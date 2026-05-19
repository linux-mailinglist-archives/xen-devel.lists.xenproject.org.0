Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wXKuC3UvDGo4ZAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 11:37:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EFB57B6B1
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 11:37:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312675.1582752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPGtU-0006ph-GG; Tue, 19 May 2026 09:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312675.1582752; Tue, 19 May 2026 09:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPGtU-0006na-DT; Tue, 19 May 2026 09:37:44 +0000
Received: by outflank-mailman (input) for mailman id 1312675;
 Tue, 19 May 2026 09:37:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPGtT-0006nF-71
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:37:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPGtS-00BMV2-JC
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:37:42 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c2f52-2eae-0a2a0a5409dd-0a2a4503e3e8-40
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:37:42 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c2f66-672d-0a2a45030019-d155802bb8ba-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:37:42 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so39363405e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 02:37:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5ab3977sm343673985e9.9.2026.05.19.02.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 02:37:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779183462; x=1779788262; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=57pwnHxMPCxaGBZNl8cs6PC7ps1WywDh+7AYGFUot5k=;
        b=feZgPsLOcIrllOuKrxaB9856pKf+EmNc0zVMtbqWRS4EQtiHW9EQqQq4pkbUzrab0L
         X/kvXfumNGq8GSZmytCMhKLRTLG7wMPXI8iWnB5dB2avwl4AkPLgaLMq4SI54W2npZZY
         XF2EQUuTMYe7kJ/ks012q+juLHbsMSwbZnqV5Tieu52TfBz6La60ykNLoKscqqs4lW8k
         C0aD2LngX39ZooTGbeZkvXdmP9wEqNKNoJCwKLZ7rbS0/Pdszy5Deq7lc3BE4hiF2HyI
         hRksogVlrvx6PXDobSk2OEd5jPwYUWRiTEn182AZ0cY93Dmz0LSMpROfAQ4TCFbKTcSe
         nSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779183462; x=1779788262;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57pwnHxMPCxaGBZNl8cs6PC7ps1WywDh+7AYGFUot5k=;
        b=FN3fIfnPuo1yC8OqjLKr8MijNPfJ5VfQXovJ68Co5foOwGJ9ojFGfJohJmx2UMq8j9
         4pK/VLPTjd+gfDWMlufgoL8GLVM/oY3zorkQBw/Dk43rZ2zoUxeMcUz40jQ5oazM2PeG
         Ceo9LiUhdOBwIdfhbPLRfpvn1uVP9uG1mT0qLmTOo+DAzKTgkWYeTg67TyJjMzjI/2yX
         NhR/9unv1kMkiYMcOEOBbnuEf4dYUX99OyC+H0fltw3YVYEd2mm4d+8p2NnnI4dc3dwx
         Y6MwEdudRqkMPDDlNpKcWXPdi+UqfzdvTgGWICj6YtBx+UCYODXkQdPVLmJHClDu4EVC
         bVtg==
X-Forwarded-Encrypted: i=1; AFNElJ8RnUrJzKDQA5HTnrj8DwpTv7Tg/C5qCNLEF4k97jo8oXFIv/dQ3Fzsot7iAEnNLdPa2pVYgg14zXs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzf2CSbxxBooHAJAdzdjYK1dpw9zhoRrmlXxWg9o+ah6oo6jCl0
	+JBO5UzUdMc91MUrQ8Z6wi5WcEPEsUNnbBqudo3r8iNSTzt/qB9oFiMTzHwtCybc0g==
X-Gm-Gg: Acq92OFalsSr+GejATrit95Ga4qLOYkP5/E/V+p2lf7ekal+tf+LH2pYxlc4+OGhuCx
	Zaf/vR7QNh4MGlJFHuhay+Ei6ZA2g6Jc16X9Of4i+VDuw20MpTEXAdFUiHtmeBitwurvMdCjwGV
	hKIqSsCnuumcCGzuYWgtJVqortzJxX6Gcrpc15OkQ5LQqK6oZaKV4IQ+XhmgszFik+TVBtS4iJj
	ZA21a2GNXa9X+Qoj6Flbnv6DueHX140QbTN8PE+UDZ6Eq8dWeiFa3vVZ07l2ourg9pT9paPUg2N
	l/dkwCMto0rfafZL627P30bP9BfTBHBHIjh4qdlEEOx7C99XPnrh4F+AWC4MtFN8ecaU2BQATBy
	4Yh9Pw66eAKN/0ez4EHjriKl+HeLv91UabB9rBZ79QAQfP0rDu8QZGq2+TExv/5xvH0NiYsZW1S
	SpVH0angm8/SW5iHpL6/KIkxdkLQCscS2a5ovFHCaeqReomUlu5katw/ZmSWxcqSrFffxWWE0QR
	ImOks5BNnZ6E8Q=
X-Received: by 2002:a05:600c:8210:b0:48a:5c23:cab with SMTP id 5b1f17b1804b1-48fe6322447mr270923715e9.19.1779183461808;
        Tue, 19 May 2026 02:37:41 -0700 (PDT)
Message-ID: <2be07ba3-879b-4c79-8103-b4951ab4cf53@suse.com>
Date: Tue, 19 May 2026 11:37:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/domain: fix UBSAN null pointer dereference in
 vcpu_info_reset()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <09ae75638f9e7991163ed3633e7a60461d93da70.1779179301.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <09ae75638f9e7991163ed3633e7a60461d93da70.1779179301.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1779183462-36F42938-45DFF5D3/10/73395122804
X-purgate-type: spam
X-purgate-size: 1792
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:baptiste.le-duc@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:mid,suse.com:dkim];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 88EFB57B6B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 10:39, Oleksii Kurochko wrote:
> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
> the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
> and falls back to dummy_vcpu_info for vcpus beyond that limit.
> 
> However, it does not guard against d->shared_info being NULL.  The
> shared_info() macro expands to a member access through d->shared_info,
> so when an architecture does not allocate a shared_info page the
> dereference triggers UBSAN:
>   UBSAN: Undefined behaviour in common/domain.c:325:10
>   member access within null pointer of type 'struct shared_info_t'
> 
> Extend the existing fallback condition to also cover the case where no
> shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
> instead. This is the correct behaviour: dummy_vcpu_info already serves
> as the safe stand-in for vcpus that have no usable shared_info slot.
> 
> Fixes: 295514ff75506 ("common: convert vCPU info area registration")

I question this, largely (but not only) because I also ...

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> RISC-V does not allocate a shared_info page at the momemnt because its
> guests run in dom0less mode and do not use the Xen PV ABI, so
> d->shared_info remains NULL throughout domain lifetime.

... question this mode of operation. Yes, you may (for now) be able to get
away without, but e.g. event channels will want supporting at some point.
Which will require a shared info page. Better put that in place right away,
even if the guests you test with don't use it (yet). Certain other common
code also assumes d->shared_info to never be NULL for an alive domain.

Jan

