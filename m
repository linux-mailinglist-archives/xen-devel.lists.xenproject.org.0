Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D451B6D91E8
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 10:45:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518770.805611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkLEE-0002El-DB; Thu, 06 Apr 2023 08:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518770.805611; Thu, 06 Apr 2023 08:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkLEE-0002C1-9h; Thu, 06 Apr 2023 08:44:22 +0000
Received: by outflank-mailman (input) for mailman id 518770;
 Thu, 06 Apr 2023 08:44:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pkLED-0002Bv-A9
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 08:44:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pkLE9-0004hU-1e; Thu, 06 Apr 2023 08:44:17 +0000
Received: from [54.239.6.184] (helo=[192.168.21.55])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pkLE8-0004Fp-PP; Thu, 06 Apr 2023 08:44:16 +0000
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
	bh=cfEE4BoPCplRbPqVm1JQdcTkjW5f9vjLSMyN/3E6LSo=; b=X2Ie0M4qskuaS7WagpeRGxeCsL
	sjWn8UDIVD0sBJQX23cB+Qkaopo5mVqh+wuLcGfyY3j0QVphtiD9oC/03OsSTL8CtA6muRKuYnn7Z
	lZFrFd9CotT0PcacAyrGh80BKBSGOB7OyXmQDrKXvucl6MxqWAMxoeJWcySCS5Lhubk8=;
Message-ID: <cce9bac0-0b1f-eca1-6d21-10b2371fbe25@xen.org>
Date: Thu, 6 Apr 2023 09:44:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v9 4/5] xen/arm: switch ARM to use generic implementation
 of bug.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Oleksii <oleksii.kurochko@gmail.com>
References: <cover.1680086655.git.oleksii.kurochko@gmail.com>
 <8fdb98350ae4fc6029738d0aabe13a57e1945a50.1680086655.git.oleksii.kurochko@gmail.com>
 <3a94ad32-159d-d06f-cba6-3bb40f9f2085@xen.org>
 <605245331bb93b7e60a4a9d65b19b6642d897034.camel@gmail.com>
 <9c4ca4a1-1b68-5ee0-0434-e6c9ec7d1ef6@suse.com>
 <d351a7b6d673b70d45e809123e6e42abbf7b8014.camel@gmail.com>
 <fb639472-70f3-f7c9-eaa6-37effd4965b3@xen.org>
 <8fce2549-a580-6780-759d-f287fa710640@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8fce2549-a580-6780-759d-f287fa710640@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/04/2023 07:35, Jan Beulich wrote:
> On 05.04.2023 18:39, Julien Grall wrote:
>> To reduce the amount of patch to resend, I was actually thinking to
>> merge patch #1-3 and #5 (so leave this patch alone) and modify the
>> default in a follow-up. Any thoughts?
> 
> Well, yes, that's what I did a couple of days ago already.

Ah. I didn't check the tree when replying. So ignore me.

Cheers,

-- 
Julien Grall

