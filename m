Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHR4N8hHk2mi3AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 17:37:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DFA146408
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 17:37:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234413.1537692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1aZ-0006T8-GG; Mon, 16 Feb 2026 16:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234413.1537692; Mon, 16 Feb 2026 16:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1aZ-0006Q1-D7; Mon, 16 Feb 2026 16:36:47 +0000
Received: by outflank-mailman (input) for mailman id 1234413;
 Mon, 16 Feb 2026 16:36:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vs1aX-0006Pv-Ui
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 16:36:45 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad812fa8-0b55-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 17:36:43 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so17022095e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 08:36:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac800esm29806641f8f.27.2026.02.16.08.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 08:36:42 -0800 (PST)
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
X-Inumbo-ID: ad812fa8-0b55-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771259803; x=1771864603; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u2woNWGSnnr0a2eOMR8D01U6viHPWQ0vb43LrsJDIWw=;
        b=QycB0JWjSHO5LBdGuUPfScSBhMgX6TyX7ASKo8qEJSMvPClNESv2P8EhaBIxG1mAGM
         NwY6YLfiAgLlZqoFIHNqDTxisvidnBh522VEB36o4L9wYEkT/clUAmkU1p3WpdI9C8+e
         4VTQyvoXFjp9zHOG296YJEC/QD0Unqkz7vKoe2dPTGpT5YALdmARiNXpMbdk7JVKa2z9
         TKmlxe24afX9cpeJ8qtJhuK96kxJmJnY40hIC8fi+qjDuUsb3lcTWWXk9RleszJ3HJx2
         U2wCfh5z1NZUAAD+LYz+zryBUy15KpqLE1TB7cFFavMDc6t60TaR2wTPDKsfBtcy/Tc6
         WCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771259803; x=1771864603;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2woNWGSnnr0a2eOMR8D01U6viHPWQ0vb43LrsJDIWw=;
        b=H+7XN14L+NUhyJvVs3+Rspm+k4UOiqFBatFirqABtQLjNACPeZ8nWSc37YoUVvw3Zc
         rSwA3jGk00e5myFfh/+jFFXh0O6+MMfZt84sYkIPmwMoatBMM+mwVGnIL0AwBVjoptcb
         IC0waLIjSgCcgqiVPDf+1b+4Mek5hYC/zmkTK7QihsNl+upOJwolLcC7TLHgEX9DIE+f
         bZh8jZp4QJ8uku+CAkKtwssRibapWWqiL1hSQ4moeCRuE472tXvOJKiqZw9JVK5TOCnF
         BqKbgDznZvF06cKfPLWBFxy8vi610VY93E+YYKEsRPePRqxI/buJYFCIwMvHiZSt+vYy
         phhw==
X-Forwarded-Encrypted: i=1; AJvYcCWBmyBLhqLJJGrfKx0E6gospLX5aKTSX4MLcBvbrYOEGhLEkXUIHPo994neUujUhfaHCVp2ZTWtQao=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVWr0O4QLcrs4YLshecO9wOfCrWu9tnlR81czgtrFWdy8ioyVq
	hbfFBQ8SjSp3/9DeEotR4g3rV2LrrVOj23fDG9IIykWz26vng79e5IX/N1TSgpaEoQ==
X-Gm-Gg: AZuq6aIm1oARFCeZ6nkm6bOLrMHzG+iobVYFwYVjK2EBw0+ooiIhbyE5eEQoC7clXDU
	eFDaXfq6ayBHJjsqjX/nrWzf+pzqaNBB0yu3znNOLLrV3hQxePKmVFzkKlkhvl7GmulTSYbisQq
	n4Wngq9NhqDUyrNpuc1lZZZ1K1VQiSfzT1R3TA7LWUb15LzhsLUmhXMJpzFSR84vMQjVet3pWgO
	G/fa2rZYv6q1pqAGFEnewztAoRhYtwEsFHj6DMGFUF/0dcRbVOp0KHYVqiayjDx3szkU5dyiMx4
	2m2X76l+fdBAGlfoQB8GLEkIriJjQibem9we3edr+6JLw+zxeTtHNpLnmAp1gndqrs2rGFV1pJW
	cPls/abo2HLr9Is8KCJEoOsjDHNVdQAO8SqaYjuutnwHDzsWkz2Cc+UoqMOzAiw/H5QcMKs7qV8
	H5mUH3TL2iNkXPqk95QribbJKZGAiCWVFJ9INr65TI3j65/uvxnW2AKkXcqEyUWL6qsdo5aBjuV
	2puxpPu5Xke9qw=
X-Received: by 2002:a05:600c:8708:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-48379bd7313mr143247015e9.22.1771259803136;
        Mon, 16 Feb 2026 08:36:43 -0800 (PST)
Message-ID: <522a71ce-05da-4a66-956e-5581f0c49e0e@suse.com>
Date: Mon, 16 Feb 2026 17:36:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] xen: move domain_use_host_layout() to common
 header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <678eb53c56bc4f6147feb0bbb6c1319197d0f0df.1770821989.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <678eb53c56bc4f6147feb0bbb6c1319197d0f0df.1770821989.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 54DFA146408
X-Rspamd-Action: no action

On 12.02.2026 17:21, Oleksii Kurochko wrote:
> domain_use_host_layout() is generic enough to be moved to the
> common header xen/domain.h.

Maybe, but then something DT-specific, not xen/domain.h. Specifically, ...

> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -62,6 +62,22 @@ void domid_free(domid_t domid);
>  #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>  #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>  
> +/*
> + * Is the domain using the host memory layout?
> + *
> + * Direct-mapped domain will always have the RAM mapped with GFN == MFN.
> + * To avoid any trouble finding space, it is easier to force using the
> + * host memory layout.
> + *
> + * The hardware domain will use the host layout regardless of
> + * direct-mapped because some OS may rely on a specific address ranges
> + * for the devices.
> + */
> +#ifndef domain_use_host_layout
> +# define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
> +                                    is_hardware_domain(d))

... is_domain_direct_mapped() isn't something that I'd like to see further
proliferate in common (non-DT) code.

Jan

