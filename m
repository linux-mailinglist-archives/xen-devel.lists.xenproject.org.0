Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE40584744
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 22:51:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377171.610246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHAT3-0007Ru-6M; Thu, 28 Jul 2022 20:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377171.610246; Thu, 28 Jul 2022 20:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHAT3-0007PF-37; Thu, 28 Jul 2022 20:50:49 +0000
Received: by outflank-mailman (input) for mailman id 377171;
 Thu, 28 Jul 2022 20:50:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oHAT1-0007P9-Ox
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 20:50:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oHASz-0001bT-JU; Thu, 28 Jul 2022 20:50:45 +0000
Received: from [54.239.6.189] (helo=[192.168.25.182])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oHASz-0006l8-D1; Thu, 28 Jul 2022 20:50:45 +0000
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
	bh=8Pcqz0eQsIWIzC0PXJUMr4R4gjz+WsvYQstmpqfGkJo=; b=1nwR7oEWesBXaqWsTMf01pD9rt
	ZfYrTjCv3tV/KBnPZxSE0Ob3vN87dSrziB2JrZKJNCfLmaqAHtt3UcpY3ILdkKcSokaZ7AfHCXXX3
	uyJ6t4BgVlKSHnrzMkZuSS9z6jTwCI3AnsZ/cpRiyZPtMdSQzMYH2DMtChUQtGCMF0U4=;
Message-ID: <03fd4b2b-66ab-eaf8-0875-9382e8b14012@xen.org>
Date: Thu, 28 Jul 2022 21:50:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
 <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
 <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
 <5f200481-ed3c-a463-90aa-3718c0ab57a3@suse.com>
 <758779b3-ef39-aa95-15c9-9b84b952e80b@xen.org>
 <3b42f9ab-383c-694c-cef0-5d24531e556a@suse.com>
 <019c5cb4-7e6a-d822-3c02-e3199d499106@xen.org>
 <93E40C29-DD1E-4C9B-936B-45ACA69BBD66@arm.com>
 <d868fab2-c55a-7e2c-cd54-6dc3eedbbf26@xen.org>
 <BB3ECBA1-A028-44A0-A6BB-5D6BD009C095@arm.com>
 <ee0a62af-fa79-3699-7652-d976a8690995@xen.org>
 <99D4D342-5DF7-4F85-A311-4D03967D77DB@arm.com>
 <b98c14d6-d788-427f-3fe4-b36bc85aae59@xen.org>
 <E290A20A-D6C7-4154-A0A4-3FC91C479B25@arm.com>
 <c673e9df-02b6-4f90-aca9-dc2ad9d3f922@xen.org>
 <329C928A-92B2-43EB-8972-52DAEF5258EF@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <329C928A-92B2-43EB-8972-52DAEF5258EF@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rahul,

On 28/07/2022 16:37, Rahul Singh wrote:
> As you mentioned, if we don’t restrict the number of events channel for the dom0 system will boot slower.
> This is a good reason to restrict the number of event channels for dom0.
Let me start that I am still fine if you want to push for a new 
parameter (so long it is not Arm specific). However, I am afraid that I 
will not be able to argue for it because I don't see a strict need for it.

Let me play the devil's advocate for a bit. AFAIU, you would like to 
introduce the new parameter just to tell the admin the boot is going to 
be slower if you use a event channel ID higher than N.

To me this sounds like the same as if an admin decide to use 10GB rather 
than 1GB. There will be slow down.

This slowness is only boot specific and will not vary. So one could 
argue this is easily noticeable and an admin can take remediation.

Given Jan's objection, I would like to propose to document it in the 
bindings instead (a concerned admin will likely read it). Below a rough 
proposal for the documentation:

"It is recommended to use low event channel ID."

Would that be suitable for you?

Cheers,

-- 
Julien Grall

