Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E52E73E1A5
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 16:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555527.867354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDmwv-0006Vr-W0; Mon, 26 Jun 2023 14:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555527.867354; Mon, 26 Jun 2023 14:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDmwv-0006Tg-TA; Mon, 26 Jun 2023 14:12:13 +0000
Received: by outflank-mailman (input) for mailman id 555527;
 Mon, 26 Jun 2023 14:12:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDmwu-0006Ta-I6
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 14:12:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDmwt-000307-NK; Mon, 26 Jun 2023 14:12:11 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDmwt-0005Iu-HI; Mon, 26 Jun 2023 14:12:11 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=xHDpglMamX19FrrAaUfEqsI6ZELmMLlFS+sR73TLYjo=; b=qB6sDBNQA+VdRPTEDPSShjCeOt
	lnPENgIya3jbIvgRRrYeZAev/kmZVi1Z2XEy0joYZBXxxiUY01JsxLOSOGTTmB0pbmlG1ViQqsFM9
	KiKpAQEgcFiGQwVxbetbULNU9zlwWmgP0kVdDZMyxJHNpfsiOTpoq/1q/X7MFza3yECg=;
Message-ID: <0529f52f-4448-fd9b-8d87-de5e96efc5cc@xen.org>
Date: Mon, 26 Jun 2023 15:12:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v3 1/6] xen/arm: change names in function
 access_guest_memory_by_ipa().
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1687771796.git.federico.serafini@bugseng.com>
 <89e96c5d4b95a35540757235e838fd65f5e4077e.1687771796.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <89e96c5d4b95a35540757235e838fd65f5e4077e.1687771796.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/06/2023 10:52, Federico Serafini wrote:
> Change the function name 'access_guest_memory_by_ipa' to
> 'access_guest_memory_by_gpa' and change its formal parameter name from
> 'ipa' to 'gpa' because of the following:
> 1) 'gpa' is used more frequently and therefore is preferable;
> 2) changing parameter name makes the declaration consistent with the
>     corresponding definition thus fixing a violation of MISRA C:2012 Rule
>     8.3.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

