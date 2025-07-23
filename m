Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3381FB0EE74
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 11:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053649.1422417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueVnT-0003H6-9K; Wed, 23 Jul 2025 09:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053649.1422417; Wed, 23 Jul 2025 09:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueVnT-0003Em-6I; Wed, 23 Jul 2025 09:29:59 +0000
Received: by outflank-mailman (input) for mailman id 1053649;
 Wed, 23 Jul 2025 09:29:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ueVnR-0003Eg-81
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 09:29:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ueVnQ-00EpQB-0d;
 Wed, 23 Jul 2025 09:29:56 +0000
Received: from [15.248.2.234] (helo=[10.24.67.34])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ueVnP-009Ko3-2h;
 Wed, 23 Jul 2025 09:29:56 +0000
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
	bh=k5Dboy+HlfLwhycwLgAeoepjFwrfpV1tlCGLAOljyjo=; b=l2pXryDFRWPQAH57jyJQKQAJuM
	rPy/YW+pHv13rZWE5VX53gicjMTITRCQJZCGMGe0bAoyQGq3xm81ANOdAp/nYO8Mtkw0wnSM+/iQO
	URPVnTRlIJjAmqtBMuoHemeVZIi4xinASmBpFUt9bf8ulNAb/VSfHTtPNqyd3v4WoeuY=;
Message-ID: <5b4b8ffe-2660-4c95-8afd-8d28c1c016ad@xen.org>
Date: Wed, 23 Jul 2025 10:29:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/17] xen: Introduce
 XEN_DOMCTL_CDF_not_hypercall_target
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-5-jason.andryuk@amd.com>
 <5c99a02b-a5f6-4dad-8d55-936697c70f2c@xen.org>
 <b18d800f-ac44-4748-b366-f2421e4e0a49@amd.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <b18d800f-ac44-4748-b366-f2421e4e0a49@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jason,

On 21/07/2025 23:00, Jason Andryuk wrote:
>>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>>> index 88a294c5be..f1f6f96bc2 100644
>>> --- a/xen/include/public/domctl.h
>>> +++ b/xen/include/public/domctl.h
>>> @@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
>>>   #define XEN_DOMCTL_CDF_trap_unmapped_accesses  (1U << 8)
>>>   /* Allow domain to provide device model for multiple other domains */
>>>   #define XEN_DOMCTL_CDF_device_model   (1U << 9)
>>> +/* Domain cannot be the target of hypercalls */
>>> +#define XEN_DOMCTL_CDF_not_hypercall_target   (1U << 10)
>>>   /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
>>> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_device_model
>>> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_not_hypercall_target
>>
>> I am not sure where to comment. But aren't both flags mutually exclusive?
> 
> No, XEN_DOMCTL_CDF_device_model is *this* domain providing the device 
> model to other domains:
> 
> + * Device model capability allows the use of the dm_op hypercalls to 
> provide
> + * the device model emulation (run QEMU) for other domains.  This is a
> + * subset of the Control capability which can be granted to the
> + * Hardware domain for running QEMU.
> 
> Whereas XEN_DOMCTL_CDF_not_hypercall_target removes targeting on *this* 
> domain.  So the domain with XEN_DOMCTL_CDF_device_model cannot target 
> the XEN_DOMCTL_CDF_not_hypercall_target domain.

Thanks for the clarification. I misunderstood the goal of 
XEN_DOMCTL_CDF_device_model. That said, I think there is still a problem 
because with CDF_not_hypercall_target, you would not be able to have a 
device-emulator for that domain. Is this intended?

Cheers,

> 
> Regards,
> Jason

-- 
Julien Grall


