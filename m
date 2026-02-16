Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD7lIuQ3k2mV2gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 16:29:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCDA145973
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 16:29:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234277.1537581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs0XM-0008O3-Ib; Mon, 16 Feb 2026 15:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234277.1537581; Mon, 16 Feb 2026 15:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs0XM-0008LA-Dy; Mon, 16 Feb 2026 15:29:24 +0000
Received: by outflank-mailman (input) for mailman id 1234277;
 Mon, 16 Feb 2026 15:29:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vs0XK-0008L4-P9
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 15:29:22 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43af359d-0b4c-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 16:29:20 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4837907f535so21016725e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 07:29:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d82a4afsm816242135e9.11.2026.02.16.07.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 07:29:19 -0800 (PST)
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
X-Inumbo-ID: 43af359d-0b4c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771255760; x=1771860560; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r0r/gv63b+F/1y4hzeaB7Qza8hG14SCQCXFgHh3+wwY=;
        b=IHze7VIjqFu647KxluSGxYXueJfnkmgT39FBIwrvv//KHcTpu83Nxsuig8DfE8gyT4
         0Qm7KZ4qc0BCUvnJ747WfHz7Z1f+7/WLjGkd+JjHU47JruD4aB4pbqFjEHdf8SN3aHG4
         s0ROEyTO4j7laJ8tINWgrEGp2NzQlZFl5nXRfUnOGD+0Mb26qPGfv76mqEgC4rIjH2w0
         3rHK3aZTejTQ0wKHA6X8GduuE9ai7ZMTpJdU5UoFCTgcUZ66nBbUnJGUmTFkHlErBoDA
         v5G8dYVOQHJb250219rTc2I2btR1mSphzM/kaUpm+7eRlFEBsNrsyPpk1wxZpQAQ1ZKy
         eG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771255760; x=1771860560;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0r/gv63b+F/1y4hzeaB7Qza8hG14SCQCXFgHh3+wwY=;
        b=vZqzKClV0uhLBL8wvaN7yREyDVBfNZyRsgVQhfWNaAHfWMojFAhnMW78pkViJfL3LL
         F3HLUj219ct1/7iU6eY/m/A5TkJN4ro3nPKPwgeFp7QrZZTG5DBSlKf0yZiw+RSFNKMZ
         xKM1NLGjvRbOlcdlfVt5zT69MCHt69VJ0f5I+xkSsdMjAaJPzSiuVJDkwNAaZSYvNNZw
         y9O8HXAPL+T/aQHnieEURPs7jMEVIaC4bs/SB4gTgFziTlsxjRLbcmYmko/795TVlFhc
         CJBmRBnzg8zofxTzxSkPfEAXyaAxN8Nra2VLouJlc6V3COJTq2rZXdihloHTrScvN/YV
         ivVw==
X-Gm-Message-State: AOJu0YyQG8FK+MLnWayJkQQbXWy5ExeYX4tixzQhtErPsheOLLcZUooz
	x77uk7P1CsxGhckyd4znEGTsmWQaUlPfIfBWbM670zJTDQkMKXXPVXWUkTsARmYFWw==
X-Gm-Gg: AZuq6aLuaOUjyjH0QD8x5zTQ4t6A+E/Nz/2QvVB5B6csvsf4vMt6NvKP7cmzqZ0dwVx
	tgAd+MVpt6xC5e/y6Edu3m8lH1xBaj9tfdFJDoJvHaHJU+1Zb+4wLPU/HKe1MvTLblnOYSRbqoX
	FxCkzsuIGe0nie5//aflzrDBeDAmKnVS/Pr47L6WCAYygX58monMi+SPDVbaw60pGDc7ZLJSJ2S
	4vWdjsi255+UDDUrczb+utj/Lt+l6epvIURo+/J7+a/VclHOXNG5SDDWZv35sP8oQ07bguZSqgK
	wTEwrStOqownpYItU1+H1rgw4Nblb0b3Jw2bZb6106paxyfu/6iwVXqhLFmHO/ZDkX864BTxBL6
	rZfqjhaFFkh9/ZBLiicj+r80e1mvlmmKIpMh7hRavbeYIlCbnjh1WjnX+89ZEqKRYSO2L0bhcel
	ndunc0DK7u/EkAkYjfTMscMWLkGWTsE9sJM8lRTeFS4oXIu8VsXO8UNWrB6BDnQF94xUmKymr37
	a6DQ4/IQ/kmhCM=
X-Received: by 2002:a05:600c:6814:b0:47e:e78a:c834 with SMTP id 5b1f17b1804b1-48379bf4788mr132573435e9.34.1771255760109;
        Mon, 16 Feb 2026 07:29:20 -0800 (PST)
Message-ID: <df5faf48-57bf-4b9d-bdfc-5be5896d798d@suse.com>
Date: Mon, 16 Feb 2026 16:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: skip more stuff for idle's vCPU-s in
 vcpu_create()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <b010c8ad-afcf-43f4-b273-fdb43ab641ed@suse.com>
 <aZMygcKLwGQiNZu1@Mac.lan>
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
In-Reply-To: <aZMygcKLwGQiNZu1@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EFCDA145973
X-Rspamd-Action: no action

On 16.02.2026 16:06, Roger Pau Monné wrote:
> On Wed, Nov 26, 2025 at 11:31:46AM +0100, Jan Beulich wrote:
>> Nothing hypercall-related needs setting up there. Nor do we need to
>> check whether the idle domain is shutting down - it never will.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> For vmtrace_alloc_buffer() adding the conditional may be questionable: The
>> function checks d->vmtrace_size first thing, bailing immediately when it's
>> zero (which it always will be for the idle domain).
> 
> Oh, I notice this now (after having written the comment below).  I
> would then add a comment rather than the extra check.  And possibly an
> ASSERT(!is_idle_domain(d)); inside of `vmtrace_alloc_buffer()` after
> the vmtrace_size check.

Hmm, we could move the call anyway, as you ...

>> @@ -450,7 +450,7 @@ struct vcpu *vcpu_create(struct domain *
>>      if ( sched_init_vcpu(v) != 0 )
>>          goto fail_wq;
>>  
>> -    if ( vmtrace_alloc_buffer(v) != 0 )
>> +    if ( !is_idle_domain(d) && vmtrace_alloc_buffer(v) != 0 )
>>          goto fail_wq;
> 
> There's an existing issue here, the usage of fail_rq is wrong here.
> It should use fail_sched instead.  However I wonder whether we want to
> move the `vmtrace_alloc_buffer()` call inside the existing `else {`
> branch of the is_idle_domain() condition, as to avoid this extra
> is_idle_domain() check here?

... suggest here, thus dealing with the wrong label use at the same time.
Since this change will want backporting, I guess I'll move that to a
separate patch, though. (I don't think I'll bother with adding an
assertion in the function.)

Jan

