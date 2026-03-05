Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PihF5UuqWlN2wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 08:19:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E6E20C84E
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 08:19:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246208.1545430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy2yj-00037Y-Bx; Thu, 05 Mar 2026 07:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246208.1545430; Thu, 05 Mar 2026 07:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy2yj-00035s-95; Thu, 05 Mar 2026 07:18:37 +0000
Received: by outflank-mailman (input) for mailman id 1246208;
 Thu, 05 Mar 2026 07:18:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy2yi-00035m-9M
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 07:18:36 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8412105d-1863-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 08:18:32 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-439a90f194bso3843852f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 23:18:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439abdf5430sm37530903f8f.5.2026.03.04.23.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 23:18:31 -0800 (PST)
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
X-Inumbo-ID: 8412105d-1863-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772695112; x=1773299912; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9yv7oBYtDclcfyhKCmhWSB01nKNJwfpg+GASZYYfBMU=;
        b=DIYXmX02ocdvkhzDuvZZhz2b8CCcweRj4ruy+55PEFan9N86m2zgvbxOcVjQvE8TkI
         If/JUxuVL7ZIUjGk0eoCSSYoofQ9Tq+zr19ET8kWuFuCcRkuSNZ2bqTTLBf4hQc1QOnI
         tn6AsWmw1fhiIsYBZZhZ9iyJtjkBQbp8NBETKbNVlC6xFZ9avzn4Mp7eOxHecOgOuis1
         +I0lumeXQQS0CK1FHjHQg9g/oOsDynMfXWRCvi33s0jCuGTPKXvKsYHr45QRpxapOT53
         VMo6W4nUQs5ntCR7P+uO2p5kZ7afVJjb65cP29vOh6cky7zb54szufpl3s1cNTRXGw/K
         CQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772695112; x=1773299912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yv7oBYtDclcfyhKCmhWSB01nKNJwfpg+GASZYYfBMU=;
        b=QnfJOumtu/LIgbExyL31NsQIYdGXM2OE2mhGJC+3mxUAzLypHrwgfYbB52+GsoiliY
         EzJMrS9GeFHc757SMZUmehIY1hPW341HI5vg+W1fRYaXDVjUqyPcOM9+TKsLdJr6VUEj
         owKFIMxmcn+UIjdM2OxstfSBs6TjNdiws1BMl0vgPdVWkQpWLVLeRFFtDd3r+VuDpwGx
         2LczDE+5WaOzzIoSSLUvSr3y13xD4kKNpt2/wbYBjZs0YfY9jRdCA/sg6lzQXSrsvz3w
         bKhLdg1+z/EuLGB3Je6bdr1nBj1/qZ3Fq4ZAJb9XjYJZWetDcGnjx2ZwIsNNtEvTlx98
         btCg==
X-Forwarded-Encrypted: i=1; AJvYcCWrWUDIfzqc0U7iSgbieGE9ui6zPj4jut+wQQw/rWuP1mjORRo8RANxmWipmwgPkTh7us7FLdWEprU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/jGfyqVx6+LChx1TkgqqnDbKGZi5COyNa86hZVJnQSyNUI7MI
	bzhnw2Xjj2aBJtWqjc6awil0XtDhf56tOreR1vLcbWpaEhfn7TEovetxDB2uimgyKvBwDkAu88K
	Giw4=
X-Gm-Gg: ATEYQzy6XxdJiET7bW42hLz8qKNpi0X2F0BfVfLmKWazyqbog7hDZ5Ln75BdXvdkb7O
	1o6+F2DGKM9os3nfkKuDLYBE9lMyVMZpYkz8kouEoFmmyEQinyiYewYQ99eQtYXhXJt9nZRgExo
	USLPuqeThnTFtH825/RBYQvaz+B+z03RMZPZptihCGDh343kPYloPtHwu5T9K+jyFxAQvcqrsdL
	gfK/24uNggZZwUVynxkvFBbVA3WqVn7fGkdWy9UO7/hJYk0ugWAoyiYjLhYHrrcNBCSvVMkyrXK
	IU4PTPIjJvsuf/4cW4/bzAZxtFPvrUHhfQWrSTQeQrRsOTpbozlrHIxzMC/HzhSPbnN9wvAtFKY
	tj5BVHcYi/rAMYb/VwQrA86GzsLftjrPotwcZgO0bb4tiU4ICFkH8RmSnD4Hmc3gGOmiHhRg7q8
	svzIUbFoi46MEDxgV99IVeI5oM3fv+n/pWnIP/jucnbT09gCPUmFDW+hLLjNJESMy0xf9qB0j+F
	sNuHXvLPF3z00Y=
X-Received: by 2002:a05:6000:24c2:b0:439:aeeb:53e2 with SMTP id ffacd0b85a97d-439c7fd304emr9063120f8f.29.1772695111648;
        Wed, 04 Mar 2026 23:18:31 -0800 (PST)
Message-ID: <6d88e3d7-3059-41ca-bf4b-6c9232e9f8c6@suse.com>
Date: Thu, 5 Mar 2026 08:18:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/14] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 1
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
 <a1954e9a30abace453f4604a47b43ecbcebe350a.1772016457.git.oleksii.kurochko@gmail.com>
 <6357ad3f-85c8-4fe4-a2c8-8b0a0a97f1b3@suse.com>
 <32bd2cc9-86ee-4470-af7c-f52838e0c4e1@gmail.com>
 <23b77208-5321-4dad-8974-f943b38ef104@gmail.com>
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
In-Reply-To: <23b77208-5321-4dad-8974-f943b38ef104@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B6E6E20C84E
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 04.03.2026 20:29, Oleksii Kurochko wrote:
> On 3/4/26 4:07 PM, Oleksii Kurochko wrote:
>>>> +void vcpu_sync_interrupts(struct vcpu *v)
>>> The sole caller passes "current". Are other uses of this function 
>>> planned?
>>> If not either "current" wants directly using here, or minimally the 
>>> parameter
>>> wants renaming to "curr". In fact ...
>>>
>>>> +{
>>>> +    unsigned long hvip = csr_read(CSR_HVIP);
>>> ... this suggests it's unlikely for the function to be valid to call 
>>> with
>>> other than "current".
>>
>> Agree, I will drop v argument and use current inside 
>> vcpu_sync_interrupts().
> 
> Then would you be okay with using current instead of v argument inside vcpu_update_hvip()
> and vcpu_flush_interrupts() introduced in the next patch?

If they're going to be used only on current - yes, sure. Of course in the
overall picture you still want to consider whether to have every function
fetch "current", or whether to have a caller calling multiple such functions
in a row fetch it once, and pass it into the functions (possibly adding
ASSERT(curr = current) in each of them).

Jan

