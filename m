Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85289476097
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 19:21:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247534.426839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxYst-0006zA-8U; Wed, 15 Dec 2021 18:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247534.426839; Wed, 15 Dec 2021 18:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxYst-0006x4-5B; Wed, 15 Dec 2021 18:20:11 +0000
Received: by outflank-mailman (input) for mailman id 247534;
 Wed, 15 Dec 2021 18:20:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxYsr-0006wy-VP
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 18:20:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxYsp-0001Rb-2g; Wed, 15 Dec 2021 18:20:07 +0000
Received: from [54.239.6.190] (helo=[10.85.97.145])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxYso-0002qF-T2; Wed, 15 Dec 2021 18:20:07 +0000
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
	bh=xLie/Mw7cBNpOtimSu1MzWXhmLpKaFsDMG2FMwhsBgU=; b=P9AudKy20WbvQbQkRliH983+20
	AnAZyxCcwsLeotn6MP8lZBmfasx5qfO0NeqRCd7Q1jkAo4JDItTanEL8D9o6pr6+rdSrXNLVqKN4x
	13bafwS1Dyn5hev3PJdN52qJuDGHeWUqh9pQ3nJ8xMDaaApNwRmFpszK9chClGcu+6Qc=;
Message-ID: <917e0157-11f4-acf5-05cd-920cbc8e6399@xen.org>
Date: Wed, 15 Dec 2021 18:20:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
To: Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20211206142032.27536-1-michal.orzel@arm.com>
 <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
 <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
 <b7a53384-39cb-f368-f39b-9b560336226b@xen.org>
 <6ab797ce-86dc-2c32-1cd0-417fab7516c7@suse.com>
 <73913bdf-7449-34fb-b86b-662774cb3e62@xen.org>
 <865fb3a7-76fc-24da-e07d-c6e59e3e1abe@arm.com>
 <3aae0020-938e-d5fe-7d7f-d5d1c8335a24@xen.org>
 <447b6c54-7d0c-132f-6202-c1ae7fb16e5d@arm.com>
 <871bda7e-3f94-a5bd-3caa-16b0c8f6d693@suse.com>
 <87080c9d-803d-608a-1c5a-2102f014d2bc@xen.org>
 <1fcc18d4-70ce-12d1-6d54-ae82e511a4d7@xen.org>
 <040a1871-08ee-00e9-b46f-ca4854e8a541@arm.com>
 <82557218-539b-204a-a1a7-7c796a2baa8a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <82557218-539b-204a-a1a7-7c796a2baa8a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/12/2021 09:35, Jan Beulich wrote:
>> 1. Regarding save_x0_x1, it is 0 only for guest_sync_slowpath, which is called by guest_sync.
>> So as we are dealing only with compat=1, save_x0_x1 cannot be 0.
>> The conclusion is that we do not need to worry about it.
> 
> Oh, good point. I guess you may want to add a build time check to
> avoid silently introducing a user of the macro violating that
> assumption.

+1

Cheers,

-- 
Julien Grall

