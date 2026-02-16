Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHMpJxrckmn3zAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 09:58:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A88B141C1F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 09:58:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233788.1537146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vruQR-0005Oy-4Q; Mon, 16 Feb 2026 08:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233788.1537146; Mon, 16 Feb 2026 08:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vruQR-0005Lw-0e; Mon, 16 Feb 2026 08:57:51 +0000
Received: by outflank-mailman (input) for mailman id 1233788;
 Mon, 16 Feb 2026 08:57:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vruQP-0005Lo-Ki
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 08:57:49 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9103f282-0b15-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 09:57:48 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43770c94dfaso3564782f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 00:57:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abd259sm26827142f8f.24.2026.02.16.00.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 00:57:47 -0800 (PST)
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
X-Inumbo-ID: 9103f282-0b15-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771232268; x=1771837068; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CRWVtAY2uADgdaFu7xbxqoScSkqucyD+/aQV1EVqXes=;
        b=IVe2FUM5FSI4ghlvumMUNGdpPg5h2x9nzB1DzKPJ5w7KDQ8jfPoA+2I+vzjNeRp30j
         1RjoNpPS1Y9egu2UclgKp1WnhFajfLdeS+y6mPsyS1rZq2SsQTLoRvjRCQ04ITAMxENN
         j5BBXB88HtcdQ8DqxwfgYPPYrNXJHGRDKx9b6jXjOAipCB7tGQ1cc2JWM0KPW1uc5Url
         bM2X4rr7NhZcoafocrTK4SieERnTHvjXg8AGafJPScMyyBzCLwxTXaIXHSeEhKmtw/Pd
         fmCXwjARq3EJXib5AZEeIa8GEVwk3a6m2NDLGFJZmqf3oMRNia3tUeB2rJimzWGFFIMm
         LD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232268; x=1771837068;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRWVtAY2uADgdaFu7xbxqoScSkqucyD+/aQV1EVqXes=;
        b=iWU2GpXcEf6AVE2iK8Qa4NR7LdEReRojMU2wGsCnn2jaFVIRr3PG8gDl+w/Y3d7Kqz
         jK64TiYQFfUvTje94hIaA6LKZCIQl2p4HYxvTwmSh8Z30xR5mrOQDLf2yCDO8z852TX7
         PJYylPIm+GM10ZuXYY8stMVMzeiNxBVDuTPAWWl8SP2Lw/Ag9LfE/6NdH5EoRsG2mjJ2
         F4J3m6IjwSnN2knCxbdJrFWp+jiTnzhzv9opECYBMb5wg8+hrurhpMFazOwHRM7/MMrY
         P+nmAgMW9bRKkd3wLa8IFLXTxkFGDCtgQ3kzqW/5U7Gp14g/A1g4kSG81ldkQmFlP5cp
         qAgw==
X-Forwarded-Encrypted: i=1; AJvYcCWx4oSSco9FsXmvjUB/FOeSUFMLVSmoLsSksE1+6igV7kzQA0yCyCn89Jn29ltD52oxSVanelsKKAU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGEDQ4cad3bp+DMUUUWeIk6JxYIYWzJv2Z4Zzbl7LjeZTBO1k5
	Bn3J2YyEKfFrRavYMsiMRSmQPwmjke9ODP6CtKfLTH6TGXUHo/uxxSF73/tLNkEHPg==
X-Gm-Gg: AZuq6aKNvOPgwqfeNo7KGiIp+RT7VYQ2lpYCdJRs2evxCK/L4PnAMyr0wyJKIshFvTS
	57zv85GU+1EcNDha2lQt4uhpR17+8vHs1ew1tfBfj5BdA5aq7TQRRGLFo0Cn+jEJHjsWYljtYbC
	fMzeHlUr2ZkqPoTYNF17ZkR1C4YHAjSUBxr7E42+RqgVjoHWcPqLxGUumQAX2wdD89yZS5dLqan
	EFfrr7q/n5++rDBYb065e/REZ5hw7UY7MZ2HFHF1cgQgltsbocmpFBwLpbKZyqJA23fn13DnF0T
	uYPbJbcE/7Hfryf2wP79/uOtmyAyHrUqazhE88dcJRFbIecomdesxjJGCwDY/GNzBhNezKRZfXn
	9uXJBS+QTuJQhqR427mNhwnM+P22geTXy4gs95KBnkPB6rE6LzUvLs+ZfycHeN18YemvK4V60wc
	JlDxGBzrrOBsLP0xZzN1dJsjEcZRxjkaCBPq5IxUN9cMn4MphStdwl1ulQhgGbmuspLpermK9Ei
	rfoN1HnbW2f8Jk=
X-Received: by 2002:a5d:5f51:0:b0:436:14c7:32a6 with SMTP id ffacd0b85a97d-437979248edmr17847028f8f.43.1771232267662;
        Mon, 16 Feb 2026 00:57:47 -0800 (PST)
Message-ID: <d6884936-a5a2-41db-8069-1c4cbd6ac545@suse.com>
Date: Mon, 16 Feb 2026 09:57:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: Add Kconfig option to disable nested
 virtualization
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, jason.andryuk@amd.com,
 alejandro.garciavallejo@amd.com, xen-devel@lists.xenproject.org
References: <20260206210554.126443-1-stefano.stabellini@amd.com>
 <7a3b72b4-23f9-410f-8d0d-08d9adaaf1a7@suse.com>
 <alpine.DEB.2.22.394.2602131342090.6031@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2602131342090.6031@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0A88B141C1F
X-Rspamd-Action: no action

On 13.02.2026 22:46, Stefano Stabellini wrote:
> On Mon, 9 Feb 2026, Jan Beulich wrote:
>> On 06.02.2026 22:05, Stefano Stabellini wrote:
>>> --- a/xen/arch/x86/sysctl.c
>>> +++ b/xen/arch/x86/sysctl.c
>>> @@ -103,6 +103,8 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>>>          pi->capabilities |= XEN_SYSCTL_PHYSCAP_hap;
>>>      if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>>>          pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
>>> +    if ( hvm_nested_virt_supported() )
>>> +        pi->capabilities |= XEN_SYSCTL_PHYSCAP_nestedhvm;
>>>  }
>>>  
>>>  long arch_do_sysctl(
>>> --- a/xen/include/public/sysctl.h
>>> +++ b/xen/include/public/sysctl.h
>>> @@ -100,9 +100,11 @@ struct xen_sysctl_tbuf_op {
>>>  /* Xen supports the Grant v1 and/or v2 ABIs. */
>>>  #define XEN_SYSCTL_PHYSCAP_gnttab_v1     (1u << 8)
>>>  #define XEN_SYSCTL_PHYSCAP_gnttab_v2     (1u << 9)
>>> +/* The platform supports nested HVM. */
>>> +#define XEN_SYSCTL_PHYSCAP_nestedhvm     (1u << 10)
>>
>> Doesn't this want introducing up front, for the tool stack to make use of?
> 
> What do you mean by "up front" in this context? In a separate toolstack
> patch?

Yes. Without the toolstack part the introduction of this flag is cosmetic
only, which isn't what we want.

Jan

