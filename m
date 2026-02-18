Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFkyC8G6lWntUQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 14:12:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FB7156884
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 14:12:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235551.1538514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vshLh-0001cv-O3; Wed, 18 Feb 2026 13:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235551.1538514; Wed, 18 Feb 2026 13:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vshLh-0001a6-Ka; Wed, 18 Feb 2026 13:12:13 +0000
Received: by outflank-mailman (input) for mailman id 1235551;
 Wed, 18 Feb 2026 13:12:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cF4C=AW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vshLg-0001a0-DM
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 13:12:12 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cd62f2e-0ccb-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 14:12:07 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43945763558so2340625f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 05:12:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1b4sm39635235f8f.14.2026.02.18.05.12.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 05:12:05 -0800 (PST)
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
X-Inumbo-ID: 6cd62f2e-0ccb-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771420326; x=1772025126; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jgOU8DpEqvFl+9GpN4Jie7xcZawNhYLJFYr9No6Vk7c=;
        b=KRzpr0SwDubN48f118TrsXlOhGDGHGl03TjLgfkVYl+5T9gQEWfZ+t48bVcG12Ysmc
         375lEq2RIiwCKUpmYmb/K7ieqWCuTy1OJp3n2Bu/f+aKEwTbK1eL1DDe/6y5CFwWCuN9
         jK2PGRNQeWCQmEpkqn4fauaUumApIEiZw24RkGqbzs+tam1aMaDITRQPcAWfg/XP286H
         PGri/eklJfc2JITJm7LpsqaMIwVKYWE9ov97AZ4+HhmI7aqS1RbXyfcm2jVyb9Wrah7M
         C1S0Ne7tQ4EnCmQuvntNlHTrjBLf2BkvXmn6vgoJnL2eGUPmXzQmOgj7gRedvY1s5O8c
         MVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771420326; x=1772025126;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgOU8DpEqvFl+9GpN4Jie7xcZawNhYLJFYr9No6Vk7c=;
        b=lSia6XyukDiOBGKidhPY8DLjrFGlCewaPPGSYgN35mknGkatc6MdR/rOUuhyRdNIIH
         yGhWUF5CbDP6vOQV17LfuM5PGkt2DMvwdgSFJwNuOkc+Fje6V0Tu33D8hnGbjTh+9I/g
         2WKiZ+1A5k3b1rVErf3pNZbmEMwsPxiE8icDWcXSDzyNd3KEObUJ+lAsndc0pcITLFMP
         RkKjjM2boO41co07UN6n+/zBNeV4fD4lH1LdX/bbKkqGUTaFQqtU8vafb9B9Ks59zrzj
         M55MBJUfKMiVRAk2Y7sWXet1pQUiOItOl0v5lsHRKDCMGOaZpy/YlUE0Cpd3sTs9m1Qx
         8cTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7cyOGxof0+Pr6Nk+fLoUXvP+te+Uvnv9vLBIcYJwSNLVVDdZdbkTdY4YhtMQ2XSqW8CNN9mfF+lI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKRjqBHmBLsjr+ZfSO5QwF8w5AVdRgfFiw7VYxCTASwBWaKR26
	WbXyOCQeJHwia6UnCvfRZyHErhuk16ZDIpEpJ/HguiCkW6evCXky07qlZzDLCZg/GQ==
X-Gm-Gg: AZuq6aJ3pMXP8tsamR3jq3eH6QsBr0CrFkQCSqzX0H7pXsbzJBGtVgBm7dfOPapGmMI
	3xU7fdJpyJRDUGyrBJ9px7AERbIoKfAR1xuH2ablwZWR4uvTBhgv/vUHP1DDPMIuWqfWSaQwBuy
	kfi9vOYRNPHDZQP4CvuncWgixe2kTrBYloPRRpykKTO6QK9LpLl9uxhqzyVnIxlXT7Tcj0PSH1z
	dU+B4kEEL/GhRBhnim1J4iSdz4ZSfwPQLLmLfYUynrNHHnZXIgRXhEONl+6NgJouL0WLeG3jCTO
	aVN/Yq21AcBkGLfQMwyzGBkHESvXP+1SkjmJzlTj3v6nvOUcQPngtQZBjdWGpNHkU/Eh4VDPhUf
	vlDHQ5i7JCg9CF0dfB/fK+ZYt1znCZexPNzHc1n0KJ60uUTeNJmCMUBpHr3kZlA+18cZ+vCXwOW
	lcwYWkYV2ezooCggj/96pdTgk7FwHQcO9JhXzlBdpwaC1s7WxQFJ7tG6NUscOzYdawHcgRjZtqv
	v7C8OziAL2qq9I=
X-Received: by 2002:a05:6000:1a8c:b0:435:8f1b:bb32 with SMTP id ffacd0b85a97d-43796aefc5cmr34904823f8f.32.1771420326357;
        Wed, 18 Feb 2026 05:12:06 -0800 (PST)
Message-ID: <0c0061ab-acdb-4ceb-92e2-ca4e591ee741@suse.com>
Date: Wed, 18 Feb 2026 14:12:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] xen: move domain_use_host_layout() to common
 header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <678eb53c56bc4f6147feb0bbb6c1319197d0f0df.1770821989.git.oleksii.kurochko@gmail.com>
 <522a71ce-05da-4a66-956e-5581f0c49e0e@suse.com>
 <alpine.DEB.2.22.394.2602161038120.359097@ubuntu-linux-20-04-desktop>
 <d9feffe4-c45e-4bed-bc5e-776e4547578a@suse.com>
 <5eb4ba3b-f7b6-4cfb-ab67-60198c3f8572@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <5eb4ba3b-f7b6-4cfb-ab67-60198c3f8572@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 90FB7156884
X-Rspamd-Action: no action

On 18.02.2026 13:58, Oleksii Kurochko wrote:
> 
> On 2/17/26 8:34 AM, Jan Beulich wrote:
>> On 16.02.2026 19:42, Stefano Stabellini wrote:
>>> On Mon, 16 Feb 2026, Jan Beulich wrote:
>>>> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>>>>> domain_use_host_layout() is generic enough to be moved to the
>>>>> common header xen/domain.h.
>>>> Maybe, but then something DT-specific, not xen/domain.h. Specifically, ...
>>>>
>>>>> --- a/xen/include/xen/domain.h
>>>>> +++ b/xen/include/xen/domain.h
>>>>> @@ -62,6 +62,22 @@ void domid_free(domid_t domid);
>>>>>   #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>>>>>   #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>>>>>   
>>>>> +/*
>>>>> + * Is the domain using the host memory layout?
>>>>> + *
>>>>> + * Direct-mapped domain will always have the RAM mapped with GFN == MFN.
>>>>> + * To avoid any trouble finding space, it is easier to force using the
>>>>> + * host memory layout.
>>>>> + *
>>>>> + * The hardware domain will use the host layout regardless of
>>>>> + * direct-mapped because some OS may rely on a specific address ranges
>>>>> + * for the devices.
>>>>> + */
>>>>> +#ifndef domain_use_host_layout
>>>>> +# define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
>>>>> +                                    is_hardware_domain(d))
>>>> ... is_domain_direct_mapped() isn't something that I'd like to see further
>>>> proliferate in common (non-DT) code.
>>> Hi Jan, we have a requirement for 1:1 mapped Dom0 (I should say hardware
>>> domain) on x86 as well. In fact, we already have a working prototype,
>>> although it is not suitable for upstream yet.
>>>
>>> In addition to the PSP use case that we discussed a few months ago,
>>> where the PSP is not behind an IOMMU and therefore exchanged addresses
>>> must be 1:1 mapped, we also have a new use case. We are running the full
>>> Xen-based automotive stack on an Azure instance where SVM (vmentry and
>>> vmexit) is available, but an IOMMU is not present. All virtual machines
>>> are configured as PVH.
>> Hmm. Then adjustments need making, for commentary and macro to be correct
>> on x86. First and foremost none of what is there is true for PV.
> 
> As is_domain_direct_mapped() returns always false for x86, so
> domain_use_host_layout macro will return incorrect value for non-hardware
> domains (dom0?). And as PV domains are not auto_translated domains so are
> always direct-mapped, so technically is_domain_direct_mapped() (or
> domain_use_host_layout()) should return true in such case.

Hmm? PV domains aren't direct-mapped. Direct-map was introduced by Arm for
some special purpose (absence of IOMMU iirc).

> (I assume it is also true for every domain except HVM according to the comment
> /* HVM guests are translated.  PV guests are not. */ in xc_dom_translated and
> the comment above definition of XENFEAT_direct_mapped: /* ...not auto_translated
> domains (x86 only) are always direct-mapped*/).
> 
> Is my understanding correct?
> 
> Then isn't that a problem of how is_domain_direct_mapped() is defined
> for x86? Shouldn't it be defined like:
>    #define is_domain_direct_mapped(d) (!paging_mode_translate(d) || ((d)->cdf & CDF_directmap))
> 
> Would it be better to move "!paging_mode_translate(d) || " to the definition
> of domain_use_host_layout()?
> 
> Could you please explain what is wrong with the comment? Probably, except:
>    * To avoid any trouble finding space, it is easier to force using the
>    * host memory layout.
> everything else should be true for x86.

"The hardware domain will use ..." isn't true for PV Dom0.

Jan

