Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A7D769120
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 11:09:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572836.896901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQOty-0006Nv-HG; Mon, 31 Jul 2023 09:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572836.896901; Mon, 31 Jul 2023 09:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQOty-0006LL-DI; Mon, 31 Jul 2023 09:09:18 +0000
Received: by outflank-mailman (input) for mailman id 572836;
 Mon, 31 Jul 2023 09:09:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qQOtw-0006LD-SR
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 09:09:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQOtv-0002yA-Po; Mon, 31 Jul 2023 09:09:15 +0000
Received: from [15.248.2.156] (helo=[10.24.67.16])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQOtv-0005hR-IV; Mon, 31 Jul 2023 09:09:15 +0000
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
	bh=yMiKw+xlfyEiBPBEwLWML2GLViBDeDdcnId/YqR5qBQ=; b=uTCjwaz/chKhPdkIpzoU4RJYGP
	9vu+XgY6f5r0zxRnMQR3jaQNcQ69FT/IXBvZrGyCh8w5p4qTN8y2woEV0mwKoK6a9EL6R/w87ZuS4
	qMhRhUQ6tSdawiXM4NKkwDgtpvhBQiuSsamxkLl69mfaFY/pGJ7ZO7ibknaq5KBiV2/g=;
Message-ID: <b7fc2f24-a01c-c4bd-6e65-599694645cae@xen.org>
Date: Mon, 31 Jul 2023 10:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] pdx: Add CONFIG_HAS_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-6-alejandro.vallejo@cloud.com>
 <9f0b7ab4-090f-21ea-2cf8-6ecdc7c02225@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9f0b7ab4-090f-21ea-2cf8-6ecdc7c02225@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28/07/2023 17:36, Andrew Cooper wrote:
> On 28/07/2023 8:59 am, Alejandro Vallejo wrote:
>> Adds a new compile-time flag to allow disabling pdx compression and
>> compiles out compression-related code/data. It also shorts the pdx<->pfn
>> conversion macros and creates stubs for masking fucntions.
>>
>> While at it, removes the old arch-defined CONFIG_HAS_PDX flag, as it was
>> not removable in practice.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>> v2:
>>    * Merged v1/patch2: Removal of CONFIG_HAS_PDX here (Jan)
> 
> This series is now looking fine, except for the Kconfig aspect.
> 
> This is not something any user or developer should ever be queried
> about.  The feedback on the documentation patches alone show that it's
> not understood well by the maintainers, even if the principle is accepted.
> 
> There is never any reason to have this active on x86. 

I can't really speak for x86. However, for Arm, I think it could be 
useful in the case there is a system where the frametable size doesn't 
change with CONFIG_PDX=n and/or the integrator is happy to waste a bit 
more memory to gain performance.

Also, to reply to Jan's, I don't think this is a sort of option that 
should be gated by expert (againt at least on Arm). Xen ought to work 
fine with and without PDX enabled. From my understanding, the only 
differences are the amount of memory wasted vs performance gain.

Cheers,

-- 
Julien Grall

