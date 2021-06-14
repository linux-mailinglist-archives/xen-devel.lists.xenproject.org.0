Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C58D83A5F51
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 11:44:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141276.261004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsj75-0004ev-49; Mon, 14 Jun 2021 09:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141276.261004; Mon, 14 Jun 2021 09:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsj74-0004d7-SV; Mon, 14 Jun 2021 09:42:34 +0000
Received: by outflank-mailman (input) for mailman id 141276;
 Mon, 14 Jun 2021 09:42:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lsj73-0004d1-7P
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 09:42:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsj73-00017X-2V; Mon, 14 Jun 2021 09:42:33 +0000
Received: from [54.239.6.179] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsj72-0003RU-R5; Mon, 14 Jun 2021 09:42:33 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=4Vm3P39vFSk9p2iCk5JrRc1i21iUXkH1ftY0XfY2dRI=; b=czzOZx0sasQAD248a9kj8Rn6r/
	Ha0GDRq/izVaS2lsDbzuLMIDV/zh4Q1zlKrKPlzD9gCE7L6k5d0JGHrd50Vgxq1HIP1HU2xTrIuwi
	EI3Ew+UW48aMPzslTMo5EJHscSloKz+CNUyoELaEEaC0XdrlvLkBWoLPfI7uXkiufwoo=;
Subject: Re: [PATCH] Arm: avoid .init.data to be marked as executable
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <6837f903-14f6-4438-ed05-b373149984f3@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b7e76787-cdae-ed1a-a741-e5db146fc87e@xen.org>
Date: Mon, 14 Jun 2021 11:41:53 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6837f903-14f6-4438-ed05-b373149984f3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 11/06/2021 11:39, Jan Beulich wrote:
> This confuses disassemblers, at the very least. Move
> .altinstr_replacement to .init.text,

The alternative code was borrowed from Linux. The code has now changed 
to cater very large kernel. They used to keep the .altinstr_replacement 
and altinstructions close to each other (albeit they were both in 
.init.text).

I am not entirely why, but I am a bit worry to separate them. What sort 
of test did you do?

> dropping the redundant ALIGN().
> 
> Also, to have .altinstr_replacement have consistent attributes in the
> object files, add "x" to the one instance where it was missing. >
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I'm uncertain whether having .altinstr_replacement inside or outside the
> [_sinittext,_einittext) region is better; I simply followed what we have
> on the x86 side right now.

This means the altinstructions will be marked executable in the 
page-table. They technically should not be executable, so I would move 
them outside _einittext and make sure the section is aligned to a PAGE_SIZE.

Cheers,

-- 
Julien Grall

