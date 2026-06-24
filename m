Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XXd4JADPO2oKdggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 14:35:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55E06BE2CE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 14:35:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=d6t0bzV0;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344876.1603894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcMoi-0005RL-Gc; Wed, 24 Jun 2026 12:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344876.1603894; Wed, 24 Jun 2026 12:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcMoi-0005Ov-Do; Wed, 24 Jun 2026 12:34:56 +0000
Received: by outflank-mailman (input) for mailman id 1344876;
 Wed, 24 Jun 2026 12:34:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcMog-0005On-TN
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 12:34:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcMog-00H7c9-9Y
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 14:34:54 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bcee9-5cb7-0a2a0a5109dd-0a2a4509a5bc-12
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 14:34:54 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bceee-97e6-0a2a45090019-d155802ff179-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 14:34:54 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so12406005e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 05:34:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4924944fbbdsm410568895e9.12.2026.06.24.05.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 05:34:52 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782304493; x=1782909293; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oI44SlcQ6CmX6PsRPp0EIuybhJJHAKARuyyTAwtF36g=;
        b=d6t0bzV0whNHOZZPxjcvhjqj7jWXJXmo96QZi7lkEExNQ+T5JYurVnc3MO1RDuy+o2
         mGKebaIKSLw/BUfso6/QmxKdFBv+bWGjcvVyfE1fzp9zxkc2P17NnJ0pCGr+NIRuMisd
         ncsQW3UlXaEgq2CBlGd6BJesalY2BRUiGJAJoBMwwGlpJozLeO9/fcoe4HhzQpKUA6pY
         IZHBm+73U9AGmseUjoRPMGa1ZySp072TU3IYASA0Tj6boTuv2QprLa7cvg7AijHLDZ9C
         GbvssGWEwkwJUDrSfo+hVc/G2EimZIxF7unlWdASNLfzKp5jNyoBZUhS4KYlirGNSpXD
         p+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304493; x=1782909293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI44SlcQ6CmX6PsRPp0EIuybhJJHAKARuyyTAwtF36g=;
        b=nw78TaBJWZ6rZvYcZZOjb8J6mTzD5BzzI5AJ+DF+3JcKGDr7R+DLun/LodqFCHp6uQ
         yijw41m2KNz3/NOx5Ud3leIycd0mb9BR7dR83+UEgyW9dUUFx25v7w3X9R7zXoTwnTTL
         zG4okv5ebgomjktLFDtb9TOK2tD+OgDwKFw9JZElJLEBZT8JRGZpWhqQkmnG1trHId0Q
         BGJJb4mmDITwNUMhH4NJyi+OBMbN96LmD1iwh9saxfwlwBPkjrIUuIKyakgu9Va6Bm6M
         HREV8Ggp0oahKtOk3/Bv60ITpI4SVDOJPpX1ULc4PiDdoOKB1cXfEx/GpzBJoSOy+n4+
         qgmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+IFMvJcHEMh+vxUoeAuSRAUGBPsIo/IhrkevHC+34ClcD4dpvm5DuQA9EZRqPQd4TEjA77X8jOBk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNxm2r9ZKAJs8nAddSYHsEVP77qQp3ZzshPNpjpUxpUFoYsQSq
	IJbOf8hWQ+WCGfpJ4JWV/LZtZe1NipGWBP4+1/1I5/xdliLzv39e4B6+G4Lf0MugSg==
X-Gm-Gg: AfdE7cnT7nYEqTSZ9t1jb5dbaPfRt6rtuQuQWfdHfivtIFYoRe/Y8KKK/Wb7JDKXTnh
	nsCqMCqPuF3ionICSOcbQy4JNYHp1OCXX2+B821E2z6s9N0y5Lxc/oEBoB2Tkt7sJ14aLmsQ5D7
	yYdxpt5lkPT2ArRjyKZHm7hBROXdAR3wgaYjEJNHEhXX9kA7LnWRxoICiE3WiGbKVGlICBLPXGR
	oU6SXbZqzBpLGYvRrmwXR2icUqviM7KMbGvctEn49j0Oh4PfHlk2WKAuAub/xMk2b4k1dKeoahT
	NlwXWGaGMUO/tNg+ksk+MPRx9eTdgPDcF2GNZJfjmihgfvOCkS/h+LeNCAdxhuIVM70kWS5grk8
	IW+RKzyJbVTKu/LrweZttlil/4OMogSAVsnaFFMyNm1dIgLYnOLl1dXcDsz82huLg3IwYwH+deB
	TOFVHybeefKkXi+mEFha4Pvp60RLQpQDpzkU70pJ068JY1L18Ku27YRGhmsuvzH3R9It7TTACK/
	TFP9D+c6P4Qw3U=
X-Received: by 2002:a05:600d:6452:10b0:492:37a5:422d with SMTP id 5b1f17b1804b1-49260840116mr36232425e9.7.1782304493628;
        Wed, 24 Jun 2026 05:34:53 -0700 (PDT)
Message-ID: <d7b428e6-4528-42a7-8c3b-3f6986329e7a@suse.com>
Date: Wed, 24 Jun 2026 14:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1780494838.git.oleksii.kurochko@gmail.com>
 <7ed7b888e203b7cc6c3a3a82b3bcc89d90b3fb48.1780494838.git.oleksii.kurochko@gmail.com>
 <d63a3877-286a-43fe-97fa-301985c3a0ac@suse.com>
 <5ca82079-4f94-4f2c-87ea-0ba54236ff72@gmail.com>
 <f561a2ad-83aa-4692-9e96-148e688c806b@suse.com>
 <f41b600c-04a3-4ff8-adfd-f101c18f853b@gmail.com>
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
In-Reply-To: <f41b600c-04a3-4ff8-adfd-f101c18f853b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1782304494-46B3B986-9758DCE8/0/0
X-purgate-type: clean
X-purgate-size: 4033
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E55E06BE2CE

On 24.06.2026 10:50, Oleksii Kurochko wrote:
> 
> 
> On 6/17/26 4:24 PM, Jan Beulich wrote:
>> On 17.06.2026 16:02, Oleksii Kurochko wrote:
>>> On 6/17/26 3:26 PM, Jan Beulich wrote:
>>>> On 03.06.2026 16:25, Oleksii Kurochko wrote:
>>>>> --- a/xen/common/domain.c
>>>>> +++ b/xen/common/domain.c
>>>>> @@ -320,9 +320,9 @@ void vcpu_info_reset(struct vcpu *v)
>>>>>        struct domain *d = v->domain;
>>>>>    
>>>>>        v->vcpu_info_area.map =
>>>>> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
>>>>> -         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>>>> -         : &dummy_vcpu_info);
>>>>> +        IS_ENABLED(CONFIG_HAS_SHARED_INFO) && v->vcpu_id < XEN_LEGACY_MAX_VCPUS
>>>>> +        ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>>>> +        : &dummy_vcpu_info;
>>>>>    }
>>>>
>>>> While the change here is likely okay, it points at possible further omissions.
>>>> You've dealt with all uses of shared_info(), but you've left alone all uses of
>>>> vcpu_info() (and __vcpu_info()). Reads are presumably okay, but writes to
>>>> dummy_vcpu_info open a side channel for possible info leaks. Looking over uses
>>>> in common code, no code changes may be needed; extending the description may
>>>> be all that's wanted here.
>>>
>>> Isn't there already a side channel that could allow leaks, even without
>>> this change?
>>
>> There are multiple aspects here. First, for PV secondary vCPU-s cannot be
>> launched when their vcpu-info still points at dummy_vcpu_info. HVM vCPU-s
>> make very limited use of vcpu-info fields. Writes look to be limited to
>> the evtchn_upcall_{mask,pending} fields, which isn't really an info leak.
>>
>> My main point here is: None of this goes without making clear that the
>> necessary auditing was properly done.
>>
>>> The change here just made it worsen because now info leak
>>> will happen for all vCPUs when  CONFIG_HAS_SHARED_INFO=n.
>>>
>>> I will add to the description the following:
>>> ```
>>> With CONFIG_HAS_SHARED_INFO=n all vCPUs fall back to the global
>>> dummy_vcpu_info, so writes through vcpu_info() could leak data between
>>> vCPUs.  Reviewing the write paths in common code: the write in
>>> map_guest_area() stores the constant ~0 so nothing serious will happen
>>> if it will be leaked; the event_2l.c paths are unreachable because the
>>> preceding shared_info() call would trap first; the write in
>>> vcpu_info_populate() targets the new mapping buffer, not
>>> dummy_vcpu_info; all remaining writes are x86 PV-specific for which
>>> CONFIG_HAS_SHARED_INFO=y.  No code changes are needed.
>>> ```
>>
>> As you start with "common code", how come the "x86 PV-specific" part is
>> still there (i.e. relevant)? Isn't all PV stuff in x86-specific code?
> 
> Good point. The "x86 PV-specific" part is not part of the review of 
> common code. I mentioned it separately to complete the audit of all 
> write paths reachable through vcpu_info(). The intent was:
> 
> * the writes discussed before the semicolon are the common-code paths;
> * the writes after the semicolon are outside common code and are x86 
> PV-specific, where CONFIG_HAS_SHARED_INFO=y anyway.
> 
> To avoid the ambiguity, I can reword the sentence to make that 
> separation explicit:
> ```
> With CONFIG_HAS_SHARED_INFO=n all vCPUs fall back to the global
> dummy_vcpu_info, so writes through vcpu_info() could leak data between
> vCPUs. Reviewing the write paths in common code: the write in
> map_guest_area() stores the constant ~0 so nothing serious would happen
> if it were leaked; the event_2l.c paths are unreachable because the
> preceding shared_info() call would trap first; the write in
> vcpu_info_populate() targets the new mapping buffer, not
> dummy_vcpu_info.
> 
> Outside common code, the remaining writes are x86 PV-specific, for which
> CONFIG_HAS_SHARED_INFO=y. No code changes are needed.
> ```
> 
> Would that wording work for you?

I think so, yes.

Jan

