Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XT/EN5zBH2oHpgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 07:54:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E09F6346D2
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 07:54:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=FToIBSKF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325626.1590926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUeYZ-0002BK-NI; Wed, 03 Jun 2026 05:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325626.1590926; Wed, 03 Jun 2026 05:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUeYZ-00028Y-K4; Wed, 03 Jun 2026 05:54:23 +0000
Received: by outflank-mailman (input) for mailman id 1325626;
 Wed, 03 Jun 2026 05:54:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUeYY-00028S-25
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 05:54:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUeYX-00ERtw-4b
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 07:54:21 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fc17d-bab6-0a2a0a5309dd-0a2a45099f60-32
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 07:54:20 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fc18c-2497-0a2a45090019-d155dd31b198-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 07:54:20 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-45eedc94d37so3108467f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 22:54:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm4509526f8f.12.2026.06.02.22.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 22:54:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1780466060; x=1781070860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lWtvF1wVMzNc3WsfjY/tiPFaUGHCR84sxH3xGnkqI6M=;
        b=FToIBSKFgiUq1lbdlMVUDrBCHLw+GAWD88qcnj6cQRxcUCQ4N9wem67kU5JqQ3vlSB
         b6ZUnOkzuMGmeypWY1gSdT97oReea6WN5OtSFCz9b5ET3GOPTkzft2XgPl7ww/TemOcd
         J2Shy472blF9xnHTURO4KOF4Woy/sr8Z6JXEkcz8Y+2z4xaaNM+FvWTVMnro6Cwgwmn+
         qdS/aFCkCOSOqY5+jDgWXXX8yO1HIv11X+RNTROzW6gj9Len4RNMppYeeg96nvfVKVbS
         VVVQ/ApzQopcVTOtDFNvscxNh76fObqKo0K7Ue/gS5JL2qfcNmP+VvWAB9CQE8hown/r
         PMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780466060; x=1781070860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWtvF1wVMzNc3WsfjY/tiPFaUGHCR84sxH3xGnkqI6M=;
        b=hR2OImbm6QYoIFQqpoTIscNNN5QFXmuUEvQHlRhSUSOfL1co4CFBZ38f/C2CgUKEal
         ows1fSx5eaoaCx1qApNKHgIsONtcEMn4Ojm1rJQkDqlcKaxCo1lpWto1jhxczKJ2cJ1n
         GYkK+olWFsDE1+T6iPJi5JbihNC9Ckr3Npao2quOHqwQlAGFWijlpgPhRrQuxRpjTKL/
         oe89wlGCHU5gIXk8QLfAutrQIZJ8+QDpola64/Z6U6MocnIdM16l18OsRxjueUOVyb7S
         hPUpQ8/y3o7975tE0u1oaO2rLd17hw5LmdVVd6ZuHrm/XmH+6XQfDwt6+tZCNLgoCZil
         qHuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jvSwrf96tqbC4GxEXeg5VLzFRlADLgs4k9CHC1FR7xuUYg42/UtqmNAaA/Qk+/OsymKIHe546+lE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtTi5Ru27ZM7UD6xNxNyXsYCqr6pxPUtGRYmqsnodGHM7zn8nO
	qL1IVCFnbVxcYbdUx86GqMr4WJGfzIjrfQvCirEpr70AtDCTh5ZotjvZ+qLur1x8Jw==
X-Gm-Gg: Acq92OGwv585zKHTWA8PKGUu1219UrxmyrhTAhlY1wEkUIKQpHcewvVjlp+tV0aGIwT
	2FpxvSULw4v9VQLPJfa+66AMDZHeAI0nAuDoc9QLh1GvWDQQyhEg3rLd+MUU2tb7ihLH2zJ7Tc3
	OcJZbj3kbbU7FHG+pDuGASoUaSUlGMdEgJ/naWwKXTqXb/j2VIjHMo5/8+wh+b6gA7zcnMraBoq
	5KDM01J1NUF0BYryKVcWrpXl8th+7+/lxWxMT48+0mgIzqMkVmLdnUQPSHwLu7hmL+ni5tpw9Hh
	cqwRnv9UAa3nMnakZl4qtvjebpyHbppBJjsNAbGmWgdC7z5o/qTN3CCTfwtzIz7ekTYGH/0Y0Ti
	RzF6Sg9VVxE/0HEU0oKq4sOQ2VJ/XJNBE+myiX4GnKuCvm5XBx4TWbhawKPyxSClJo4id9/sc+U
	cZUv0GTcI16NZKNOHCXJ58GA+//e3vhLYw0jf2aciBrsK+/g6yyLE8iAwiWECBKxttOE/upBJmB
	4Mpd+EVX4Jrk8iVKfj6T+rC1w==
X-Received: by 2002:adf:f104:0:b0:45e:edc8:d440 with SMTP id ffacd0b85a97d-46021782782mr1555731f8f.1.1780466060140;
        Tue, 02 Jun 2026 22:54:20 -0700 (PDT)
Message-ID: <3eb9ab3d-dc4d-4019-89c8-9f7dbdc528cd@suse.com>
Date: Wed, 3 Jun 2026 07:54:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/domain: fix UBSAN null pointer dereference of
 d->shared_info
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
 <04dd784b6b9a4dfca9a313ea8802d8d514d65021.1779712171.git.oleksii.kurochko@gmail.com>
 <3aef7763-aea3-496a-8c18-d3659f590373@suse.com>
 <fb1b1194-5855-49d9-99fc-d35a3038833c@gmail.com>
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
In-Reply-To: <fb1b1194-5855-49d9-99fc-d35a3038833c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780466060-89775A53-61D290B8/10/73395122804
X-purgate-type: spam
X-purgate-size: 6879
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E09F6346D2

On 02.06.2026 18:11, Oleksii Kurochko wrote:
> On 6/2/26 1:19 PM, Jan Beulich wrote:
>> On 25.05.2026 15:20, Oleksii Kurochko wrote:
>>> It is legal to have d->shared_info equal to NULL for architectures which
>>> support only the FIFO ABI for event channel management.
>>>
>>> Having d->shared_info == NULL leads to a UBSAN issue on such architectures:
>>>    UBSAN: Undefined behaviour in common/domain.c:325:10
>>>           member access within null pointer of type 'struct shared_info_t'
>>>
>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
>>> the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>> Extend the existing fallback condition to also cover the case where no
>>> shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
>>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>>
>>> Additionally, if an architecture supports only the FIFO ABI, setup_ports()
>>> should be updated to avoid a NULL pointer dereference of d->shared_info,
>>> since in that case there will be no pending events in
>>> shared_info->evtchn_pending and the pending flag of the FIFO event channel
>>> does not need to be set to true.
>>> update_domain_wallclock_time() accesses d->shared_info via shared_info()
>>> macro. On architectures that do not allocate a shared_info page (currently
>>> RISC-V, which runs guests in dom0less mode without the PV ABI), this causes
>>> a NULL dereference. The early return is safe: if there is no shared_info
>>> page, there is nothing to update. For all existing architectures (x86, ARM)
>>> that do allocate it, the guard is never taken and behavior is unchanged.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in v2:
>>>   - Update commit message + subject.
>>>   - Drop Fixes tag.
>>>   - Handle migration of pending events from 2L and FIFO ABIs when arch
>>>     support only FIFO ABI.
>>
>> What does this item describe? On an arch supporting only FIFO, how could
>> evtchn need migrating from 2L?
> 
> Agree this item is inaccurate.
> 
> evtchn_init() always calls evtchn_2l_init(d) first 
> (event_channel.c:1627), so every domain starts with 2L regardless of 
> arch (of course, it is just initialization of evtchn_port_ops which 
> aren't really used when only FIFO is supported).
> 
> setup_ports() is called during the guest-initiated 2L→FIFO transition 
> (event_fifo.c:637), not at arch init time. There is no arch that 
> supports "only FIFO" as a starting state and that is why it is needed to 
> guard setup_ports() against NULL d->shared_info when migrating 2L 
> pending state to FIFO even 2L wasn't really used by an arch with only 
> FIFO support.

Imo on arch-es not supporting 2L, domains shouldn't start in 2L mode.

>>>   - Update the commit message.
>>>   - Protect some other places in common code from NULL pointer deref of
>>>     d->shared_info.
>>
>> What I'm still missing is the description clarifying why other uses don't
>> need guarding (or that there simply are no other uses, which - however -
>> I doubt).
> 
> I will add an explicit paragraph mentioning that the 2L ops in 
> event_2l.c are unreachable for a domain with no shared_info.
> 
> The only place which isn't covered now is  domctl.c:108 
> (virt_to_mfn(d->shared_info)) is only reached via the 
> XEN_DOMCTL_getdomaininfo path and
> as RISC-V doesn't use it now it could be left as it is what also could 
> be added to commit message.

Or, better yet, deal with that as well. But see also below.

>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -320,7 +320,7 @@ void vcpu_info_reset(struct vcpu *v)
>>>       struct domain *d = v->domain;
>>>   
>>>       v->vcpu_info_area.map =
>>> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
>>> +        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS && d->shared_info)
>>>            ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>>            : &dummy_vcpu_info);
>>>   }
>>
>> At the example of this: The extra conditionals are dead code on x86 and
>> Arm. While the status of the respective Misra rule is still uncertain
>> for Xen, imo we'd be better off avoiding the introduction of new dead
>> code. Which in turn means we may need some kind of abstraction to have
>> these extra conditionals in place only for arch-es not supporting
>> shared-info at all.
> 
> What about then add config HAS_SHARED_INFO to xen/common/Kconfig and then:

We're getting closer. Imo we want to go farther, though: shared_info() as a
construct should be unavailable when !HAS_SHARED_INFO. _That_ then will
make obvious (by causing build failures) that all respective use sites were
properly dealt with.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -319,10 +319,14 @@ void vcpu_info_reset(struct vcpu *v)
>   {
>       struct domain *d = v->domain;
> 
> +#ifdef CONFIG_HAS_SHARED_INFO
>       v->vcpu_info_area.map =
> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS && d->shared_info)
> -         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
> -         : &dummy_vcpu_info);
> +        (v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
> +        ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
> +        : &dummy_vcpu_info;
> +#else
> +    v->vcpu_info_area.map = &dummy_vcpu_info;
> +#endif
>   }

I agree with #ifdef here.

> --- a/xen/common/event_fifo.c
> +++ b/xen/common/event_fifo.c
> @@ -562,9 +562,10 @@ static void setup_ports(struct domain *d, unsigned 
> int prev_evtchns)
> 
>           evtchn = evtchn_from_port(d, port);
> 
> -        if ( d->shared_info &&
> -             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
> +#ifdef CONFIG_HAS_SHARED_INFO
> +        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>               evtchn->pending = true;
> +#endif

While as per above shared_info() would best not exist when !HAS_SHARED_INFO
(in which case #ifdef may be unavoidable here), an alternative where
IS_ENABLED() could be used here may want at least considering. E.g.
causing a link-time failure when shared_info() is used (and not compiled
out).

> --- a/xen/common/time.c
> +++ b/xen/common/time.c
> @@ -94,8 +94,9 @@ void update_domain_wallclock_time(struct domain *d)
>       uint32_t *wc_version;
>       uint64_t sec;
> 
> -    if ( !d->shared_info )
> -        return;
> +#ifndef CONFIG_HAS_SHARED_INFO
> +    return;
> +#endif
> 
>       spin_lock(&wc_lock);

Constructs like this are imo somewhat ugly. Using IS_ENABLED() instead
would make things at least a little better (again imo).

Jan

