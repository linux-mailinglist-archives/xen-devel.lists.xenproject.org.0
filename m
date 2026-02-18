Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMPaE8PRlWlEVAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 15:50:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CCE1572CF
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 15:50:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235699.1538606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsiso-00016X-Qi; Wed, 18 Feb 2026 14:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235699.1538606; Wed, 18 Feb 2026 14:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsiso-00013u-Nq; Wed, 18 Feb 2026 14:50:30 +0000
Received: by outflank-mailman (input) for mailman id 1235699;
 Wed, 18 Feb 2026 14:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cF4C=AW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsism-00013o-Ol
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 14:50:28 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29070bf7-0cd9-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 15:50:26 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48374014a77so49399995e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 06:50:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac9d77sm38786344f8f.33.2026.02.18.06.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 06:50:25 -0800 (PST)
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
X-Inumbo-ID: 29070bf7-0cd9-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771426226; x=1772031026; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XyalVrOy7BpKhSfTPoJ8tKECpIFYmccAizK1HMw5QMQ=;
        b=DhI9l+Fil2mjppXR680lbGXe0ycHeZmvv00ZXjkXcEMWSO0YilHKcAg/IO7hJhO0hs
         4yUWyjH64fp2AJGFx2EXylZVNOsWVNtSnCDK4p7F3zB0jg8gVpN+cWoYlXjhjAqMzmVo
         DlxgPxW+Cr4hifPkPUoTUCVxNdcb5mblIQDNxFyQ1+SkdcCIke9e4gWXugZfGi/sPKj3
         cZn5pqY+p0IXNtSXENH25h0YzoyGKBYzgnzTX6N6VzkBQZ72TYD0di57jnbi2iQDJHYq
         7BFWpLN1EaCHNVM0jOyDdsvnwfOYG4wyWHvGGCVOwzCXA2uwJxwWgnKaXZFgotnO3wS8
         8Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771426226; x=1772031026;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyalVrOy7BpKhSfTPoJ8tKECpIFYmccAizK1HMw5QMQ=;
        b=XH5IKw0JKtYdFpc+GM6RzZkuBziwtvtAjx7Z+RCCxKap8aeREjmEjN9Du+OX5PmVN9
         ZJvAhklQcXO67JvdBMHlkUctaloBFYgJMZJ+qs0f6OkkP4Q00xaXGGLGZICPOEkkYjoK
         V5vm2uE3PJbrwevIHkP7/0Oqevu5RaRVv2jFPXEZJ5T3uuiBIQqo8tHrBupCL1JHx2Mu
         2AfR+usi0XhDglqaSonlfb2OwoICuFdLMn2gYgR3spQbHmKDd3nXvwpqdP1o9XvqpQ82
         IgJOjBfpDBJ7WvNHai4zeV64u1GMD/+8XgUgL3NiMn/KueJ4iZjoNvC5IRxcdbXvgI7+
         irYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWibC8r70/NJJcj61AUMvaXGwszkZroKvyWMVF2uB2Hvl55NyrNMO4DoVhhUIaYkETCq8NUbVfP7pA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3KTkkVz18tKBnA+/JE1K/1NFb6USGJf0iZQHY5nA4asMcvFiF
	jDvsVYq1oX1lL+WukLVdc40Dvbf3SuFHlFS/x87/cb13W/3bo3g5Ma4cOzqAIVxuTQ==
X-Gm-Gg: AZuq6aIau9Jfs3srpdRGAzL2eEmAYIk9ZJVrGUhLFboF8H1gwkhrtZffR2v+G39RM9c
	8tvY8uiOZYbRwVMojfVntPpLNWxtRV4KL4/86qgKpP7qZfLOzB1Mgh6O+3d/SaQyEEeM/Cg1sfJ
	pIzFYjdyzli3qa4mvV8Vqh1w50mKM1xP9pHThqSTFvZxPN7wQqkTY3HqC/Orj+I4JR+FEXzoJBt
	KumsnRJUpsB1FVBtMcAupGWE0uQy3UThOq2VwvKLfSU7LqP7QdmD34ZEmSKrHnO0F5uoGCmRoxG
	qKi+N3r9PmeHXoERk3uzxSulVEH8hvwFpYodtm7S7xjM43h9e8hPdEBPH+hhYTa7d2MVv31XAfg
	nYYbUBHWMj6fn8ugop8qU753BdKVONNklsFyHLpOluwMgsMkYWuTRBMwBhY8YSIBAidD3JN16jn
	fTLBf6okiDmNpB93G4kuUdxyBLeOgMSQXVBZqvMW4N6HBbm7JXnBW82qj9rqK8QOxWDqiE9PRJU
	FnDmwlO5+n/oo0=
X-Received: by 2002:a05:6000:603:b0:436:3483:5c8 with SMTP id ffacd0b85a97d-4379791ce00mr31571627f8f.50.1771426225486;
        Wed, 18 Feb 2026 06:50:25 -0800 (PST)
Message-ID: <74060a96-110f-4d6f-bbad-361021315884@suse.com>
Date: Wed, 18 Feb 2026 15:50:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] xen: move domain_use_host_layout() to common
 header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <678eb53c56bc4f6147feb0bbb6c1319197d0f0df.1770821989.git.oleksii.kurochko@gmail.com>
 <522a71ce-05da-4a66-956e-5581f0c49e0e@suse.com>
 <alpine.DEB.2.22.394.2602161038120.359097@ubuntu-linux-20-04-desktop>
 <d9feffe4-c45e-4bed-bc5e-776e4547578a@suse.com>
 <5eb4ba3b-f7b6-4cfb-ab67-60198c3f8572@gmail.com>
 <0c0061ab-acdb-4ceb-92e2-ca4e591ee741@suse.com>
 <ab0b7dcf-c607-43d3-bb1c-f782c3a71332@gmail.com>
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
In-Reply-To: <ab0b7dcf-c607-43d3-bb1c-f782c3a71332@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: B2CCE1572CF
X-Rspamd-Action: no action

On 18.02.2026 15:38, Oleksii Kurochko wrote:
> On 2/18/26 2:12 PM, Jan Beulich wrote:
>> On 18.02.2026 13:58, Oleksii Kurochko wrote:
>>> On 2/17/26 8:34 AM, Jan Beulich wrote:
>>>> On 16.02.2026 19:42, Stefano Stabellini wrote:
>>>>> On Mon, 16 Feb 2026, Jan Beulich wrote:
>>>>>> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>>>>>>> domain_use_host_layout() is generic enough to be moved to the
>>>>>>> common header xen/domain.h.
>>>>>> Maybe, but then something DT-specific, not xen/domain.h. Specifically, ...
>>>>>>
>>>>>>> --- a/xen/include/xen/domain.h
>>>>>>> +++ b/xen/include/xen/domain.h
>>>>>>> @@ -62,6 +62,22 @@ void domid_free(domid_t domid);
>>>>>>>    #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>>>>>>>    #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>>>>>>>    
>>>>>>> +/*
>>>>>>> + * Is the domain using the host memory layout?
>>>>>>> + *
>>>>>>> + * Direct-mapped domain will always have the RAM mapped with GFN == MFN.
>>>>>>> + * To avoid any trouble finding space, it is easier to force using the
>>>>>>> + * host memory layout.
>>>>>>> + *
>>>>>>> + * The hardware domain will use the host layout regardless of
>>>>>>> + * direct-mapped because some OS may rely on a specific address ranges
>>>>>>> + * for the devices.
>>>>>>> + */
>>>>>>> +#ifndef domain_use_host_layout
>>>>>>> +# define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
>>>>>>> +                                    is_hardware_domain(d))
>>>>>> ... is_domain_direct_mapped() isn't something that I'd like to see further
>>>>>> proliferate in common (non-DT) code.
>>>>> Hi Jan, we have a requirement for 1:1 mapped Dom0 (I should say hardware
>>>>> domain) on x86 as well. In fact, we already have a working prototype,
>>>>> although it is not suitable for upstream yet.
>>>>>
>>>>> In addition to the PSP use case that we discussed a few months ago,
>>>>> where the PSP is not behind an IOMMU and therefore exchanged addresses
>>>>> must be 1:1 mapped, we also have a new use case. We are running the full
>>>>> Xen-based automotive stack on an Azure instance where SVM (vmentry and
>>>>> vmexit) is available, but an IOMMU is not present. All virtual machines
>>>>> are configured as PVH.
>>>> Hmm. Then adjustments need making, for commentary and macro to be correct
>>>> on x86. First and foremost none of what is there is true for PV.
>>> As is_domain_direct_mapped() returns always false for x86, so
>>> domain_use_host_layout macro will return incorrect value for non-hardware
>>> domains (dom0?). And as PV domains are not auto_translated domains so are
>>> always direct-mapped, so technically is_domain_direct_mapped() (or
>>> domain_use_host_layout()) should return true in such case.
>> Hmm? PV domains aren't direct-mapped. Direct-map was introduced by Arm for
>> some special purpose (absence of IOMMU iirc).
> 
> I made such conclusion because of the comments in the code mentioned below:
>   - https://elixir.bootlin.com/xen/v4.21.0/source/tools/libs/guest/xg_dom_x86.c#L1880
>   - https://elixir.bootlin.com/xen/v4.21.0/source/xen/include/public/features.h#L107
> 
> Also, in the comment where it is introduced (d66bf122c0a "xen: introduce XENFEAT_direct_mapped and XENFEAT_not_direct_mapped")
> is mentioned that:
>    XENFEAT_direct_mapped is always set for not auto-translated guests.

Hmm, this you're right with, and XENVER_get_features handling indeed has

            if ( !paging_mode_translate(d) || is_domain_direct_mapped(d) )
                fi.submap |= (1U << XENFEAT_direct_mapped);

Which now I have a vague recollection of not having been happy with back at
the time. Based solely on the GFN == MFN statement this may be correct, but
"GFN" is a questionable term for PV in the first place. See how e.g.
common/memory.c resorts to using GPFN and GMFN, in line with commentary in
public/memory.h.

What the above demonstrates quite well though is that there's no direct
relationship between XENFEAT_direct_mapped and is_domain_direct_mapped().

>>> (I assume it is also true for every domain except HVM according to the comment
>>> /* HVM guests are translated.  PV guests are not. */ in xc_dom_translated and
>>> the comment above definition of XENFEAT_direct_mapped: /* ...not auto_translated
>>> domains (x86 only) are always direct-mapped*/).
>>>
>>> Is my understanding correct?
>>>
>>> Then isn't that a problem of how is_domain_direct_mapped() is defined
>>> for x86? Shouldn't it be defined like:
>>>     #define is_domain_direct_mapped(d) (!paging_mode_translate(d) || ((d)->cdf & CDF_directmap))
>>>
>>> Would it be better to move "!paging_mode_translate(d) || " to the definition
>>> of domain_use_host_layout()?
>>>
>>> Could you please explain what is wrong with the comment? Probably, except:
>>>     * To avoid any trouble finding space, it is easier to force using the
>>>     * host memory layout.
>>> everything else should be true for x86.
>> "The hardware domain will use ..." isn't true for PV Dom0.
> 
> And then just pure is_hardware_domain(d) inside macros isn't correct too, right?
> So it should be (... || (!is_pv_domain(d) && is_hardware_domain(d)))

Stefano, please can you guide Oleksii to put there something which is both
correct and will cover your intended use case as well?

Jan

