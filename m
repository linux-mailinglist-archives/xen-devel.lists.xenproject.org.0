Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9708530C86
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 12:13:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335764.559954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt53M-0003Hh-Ga; Mon, 23 May 2022 10:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335764.559954; Mon, 23 May 2022 10:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt53M-0003FG-DO; Mon, 23 May 2022 10:12:44 +0000
Received: by outflank-mailman (input) for mailman id 335764;
 Mon, 23 May 2022 10:12:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nt53L-0003FA-8u
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 10:12:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nt53K-0004uc-RJ; Mon, 23 May 2022 10:12:42 +0000
Received: from [54.239.6.189] (helo=[192.168.27.249])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nt53K-0005rG-Kf; Mon, 23 May 2022 10:12:42 +0000
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
	bh=TZYJXEONpXWC5QOC3nHKsqTq8o3wfdN146Gq25qnHXo=; b=Mzc4J3pCHORuq82i514Jdc6bBj
	fVb1AuOhIOL2FqzguAiRyjC7OK4oPzrZiaxx1WfCBXaUDo0nBLgXsvSuyLVkGv6/hDmSRTqQ55AJG
	5EJurcTfuKwPIt7SM1MV2hjaT/pQdVEQKmY5o6+SNPAxgMPLNSTDUcvfBOw41REXniWk=;
Message-ID: <e0f57922-39b0-a082-caf6-c333a4cd28a4@xen.org>
Date: Mon, 23 May 2022 11:12:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v4 4/6] xen: Switch to byteswap
To: Lin Liu <lin.liu@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1653295437.git.lin.liu@citrix.com>
 <3f8e73fdfb222b0d1ff391a18fa2a799f68a467c.1653295437.git.lin.liu@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3f8e73fdfb222b0d1ff391a18fa2a799f68a467c.1653295437.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/05/2022 10:52, Lin Liu wrote:
> Update to use byteswap to swap bytes.

I am still objecting on switching from be*_to_cpup() to be*_to_cpu().

I will not Nack, however the strict minimum is to explain why you want 
to replace the helpers as I think the reason that was currently provided 
is incorrect.

Cheers,

-- 
Julien Grall

