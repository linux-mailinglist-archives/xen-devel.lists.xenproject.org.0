Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1a0YJaCeTGqtnAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 08:37:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD4071805A
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 08:37:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=F18q7yot;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355931.1610601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgzQQ-0005Lx-G7; Tue, 07 Jul 2026 06:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355931.1610601; Tue, 07 Jul 2026 06:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgzQQ-0005JG-DA; Tue, 07 Jul 2026 06:36:58 +0000
Received: by outflank-mailman (input) for mailman id 1355931;
 Tue, 07 Jul 2026 06:36:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wgzQP-0005J9-4D
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 06:36:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgzQN-00ApMt-UZ
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 08:36:55 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4c9e83-bab6-0a2a0a5309dd-0a2a4502af5e-10
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:36:55 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4c9e87-5a27-0a2a45020019-d155dd35ed5a-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:36:55 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so1788557f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 23:36:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039b126sm30737848f8f.24.2026.07.06.23.36.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 23:36:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1783406215; x=1784011015; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sYYUNAdei+xxoJhpIZ3PM0GLWk+daOyRIF2AQbx+Xdw=;
        b=F18q7yotPSMPK6UVndVbnD+DDHmLcOJdIr3orpUcR5ppHcmDJ4UjYrbuHntq7lGTf6
         8/vtCBYypWC8BX00ojR4AatHBWnKdaZOK0XySAzVdZbH3WRHCFA4F2dLpDD1S5o/oNtz
         MW7ixs0pOfx8Otjrp0fBzRFId5rBICJSiQDT3+T0mNipr2Vm++s2wQP4Da1U8pRJTugl
         e1N3py14HzDDekvYEMJzyTZkmrOtOxlUtd/7XMaSD8Kt4ZFJhM/ps+vb2PuCNzb3H6+Z
         8FA0kKpbQcrpQ7n96YcBE6lo5l8qkUF8OlIZJ+wygnE+cjrGJzqlidUtJ2nkNi+3UKM3
         l9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783406215; x=1784011015;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYYUNAdei+xxoJhpIZ3PM0GLWk+daOyRIF2AQbx+Xdw=;
        b=qo+joYIs/nyhZ9dR8zB6tSMbxgFYo+ZkLth/NTtO1Ku+SnZL3ZbgDOlKDardMh9tNf
         Sa1o4NyLYHd0/pimDMLVghZbj2xkn0j3PuO0JHcCyRIsLxyVYp7gxaKaxUzEa0p26JHZ
         qbhIYtcOKpUZLja2S5SolL+vh+X7b5UZFsowmhqHutSsNuozVXk7mkAlK/RnQN+Ivgee
         z9Ewi+u7PGGc7wQNv9L46cmxkyim1961vzsAm8Mdnmp4oLb++NmeWk7H8PNNLoiNwbLJ
         zIpOcNly2kVNkIAY/fUk4YphumTWCQYzlKCodQrmjfpnOe1Gjpfwe79SjAPf5FJ8XXU3
         WiIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqH6pYbjMZZfyCsVIRH0DVGpJHWUhT0gaa+6OyRwq+gwRJv7fo+ztI/+p13Px2j+Jw70rVaafzuX4s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHtr15Plrrau+ykTWfEsqmWbj/A1r7+tgs67zjC0Hi0GRaADkF
	NGNJvn7Y5LZXrmy4kVSA686vpoigmJ/tme0/6az4poSJrEvALSmQ3vBbh7xh1LwJxA==
X-Gm-Gg: AfdE7ckNfZr8y4g6iLgAbt13iG3kohVAWxUVisqBhe5CadmM2nJEDf4fov/fk4PZhnZ
	f0ez/8sT5iyjyhi+FR3gI2vSKlDR/afvJhkmEt9OoZJD1ZyME0JoDNPZ0SWk19r4HU8llHjY2l5
	fZJBXnWxUwYifIIHo4Dg2lIG7NMVvQULZ+mo3xa7rSOd0w/xbNzAeqsG33Dvu7WKkcHrEqST02T
	pUBCufSOgBMynPVVctjeWQidmVQ7r9RYBot8OHEaPqAw4tzUhLoAEsil8+cLD1UU5V9eYBVhcQB
	CKikrv+zGmex60eigAjdd/AHEAryqXzZW5GcXHCqYoPtlcy4jP9eI6WIo50vXBSg6UrCEVBpar2
	kVYbPGQgYHkzVKWtiBn0jJ9wh9Vh6EilthlH6wBKUIO3qXee8yex6LtXKLhXHCzOZCZ08cnQVuI
	Y/dbktZ1/66/2sLv/0Q37vOD7uqoZDKHdZiHeuLPktawSR60MHDMVFY6+oQj5VdbxWZAdCG2cDb
	BS0
X-Received: by 2002:adf:f00a:0:b0:474:2929:474c with SMTP id ffacd0b85a97d-47de66d2d91mr2864223f8f.36.1783406215192;
        Mon, 06 Jul 2026 23:36:55 -0700 (PDT)
Message-ID: <c3af3c25-31fa-4805-92f5-d48ebb87d686@suse.com>
Date: Tue, 7 Jul 2026 08:36:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: mmu: avoid transient mapping of page tables when
 a directmap is available
To: mixx86 <gabi.qs.mail@gmail.com>
Cc: sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, xen-devel@lists.xenproject.org
References: <20260706222934.221182-1-gabi.qs.mail@gmail.com>
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
In-Reply-To: <20260706222934.221182-1-gabi.qs.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1783406215-4D1027C5-F3D6CF1D/0/0
X-purgate-type: clean
X-purgate-size: 1029
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
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:gabi.qs.mail@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:gabiqsmail@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBD4071805A

On 07.07.2026 00:29, mixx86 wrote:
> ---
>  xen/arch/arm/mmu/pt.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

First two formal things: There's no S-o-b of yours, and a change like this
hardly can come with an empty description.

> --- a/xen/arch/arm/mmu/pt.c
> +++ b/xen/arch/arm/mmu/pt.c
> @@ -42,7 +42,11 @@ static lpae_t *xen_map_table(mfn_t mfn)
>      if ( system_state == SYS_STATE_early_boot )
>          return pmap_map(mfn);
>  
> +#if defined(CONFIG_ARM_64)
> +    return __va((mfn_to_maddr(mfn)));
> +#else
>      return map_domain_page(mfn);
> +#endif
>  }

The abstraction exists for a reason. If anything CONFIG_ARCH_MAP_DOMAIN_PAGE
would be the correct dependency here (or else the pattern, if copied
elsewhere, would break the MPU=y case), yet that already is what controls
whether map_domain_page() is a mapping operation in the first place.

Plus - why would only this call site benefit? Any improvement should be done
in map_domain_page() itself.

Jan

