Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGoxFdEQwWk7QQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 11:07:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52AB2EFAE2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 11:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259180.1552492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4cBV-0002Pe-0P; Mon, 23 Mar 2026 10:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259180.1552492; Mon, 23 Mar 2026 10:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4cBU-0002NU-Tw; Mon, 23 Mar 2026 10:06:56 +0000
Received: by outflank-mailman (input) for mailman id 1259180;
 Mon, 23 Mar 2026 10:06:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HLc=BX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w4cBS-0002NL-Qr
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 10:06:54 +0000
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0322143e-26a0-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 11:06:52 +0100 (CET)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-486507134e4so49428825e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 03:06:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487031790fdsm224071185e9.3.2026.03.23.03.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2026 03:06:50 -0700 (PDT)
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
X-Inumbo-ID: 0322143e-26a0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774260411; x=1774865211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tAN8s1MLc3CnVtZFMdiJWxSGZN2ch+3z5qKXHGdayH4=;
        b=XcWQcoZykwOAtwXwULF1X/CFvEhBs7f+XE+wKQUG1ZPsl6oDfXaFSElaGnqEPJo4tx
         Ad78DdQObngTxAwl06QS787OtDh4nGBE4IzkPz3egnKy60fJkAJScvUj4jEe/PuXsRxp
         WvfPj+FazGN+TbS27kqTk/W5N4hvPBv+UxywMTZGaHAOamxw5raGWdCV8u0lJGm4RNdr
         rbjF+guY1CF6LnBxXVVQL8X8JyCNMeCFPB+e9+DGdmJrJUS39BDMbz3Cp/jgnpVKHk2z
         i85GTnYSdpiqEvkB6l+H9Mev6SzOP7JNvk6MXosNbRjenJvuXF5sMEiEjNyx3A+nLLQb
         lrew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774260411; x=1774865211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAN8s1MLc3CnVtZFMdiJWxSGZN2ch+3z5qKXHGdayH4=;
        b=pTp5mg7M3zEoZegIGSt1TguI4TZe26YPmo/HOZGvKgmfAALOeUKcHxnog0pUrgsFc3
         DKYTqp4mEpgHYsn9NMr575dMUwhumBu/waMbAJLOH6Z63zjUIq3bGCB9qrSVJCwjRGm5
         zvS9fjlHv6y9/yjBQuBNDQnNnnli+fXdP4lDw9vmH6bqqP1cG8qmXRP+ZBGhQqyroFlz
         G5sDk2UMXZ9xS/19UtHCK6DZXrijCnbrwQo9+hqXgprd1DjT83xEcJthknp8YeRqp1wK
         cbsMbFgQDWoXqfbzkyfZxUGX3t/qFKrGvXjE4Bs12P6XyuuYCFFGpiPM/sQVC2L76T9R
         ybvg==
X-Forwarded-Encrypted: i=1; AJvYcCUTl6xQGNvrZp4Z5KEO/sraxqQvXnD8mraWcNZ7Y/0EV0pVbA0raMS1FvugqrldY36xrJc+BJkzgyM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywaj4Ollasz2Nq2Y78zAn0VYBNpA19t8RdrNzFCDod5uYkwXFV8
	4k/GFG7gRS+XxjRE1mme6ILnWO3EN+XdNY9mTzcF1UppAeGojBPz2L0m9EBGbix82w==
X-Gm-Gg: ATEYQzyiKf2hJ/1gilnXTOHsdyUKpFTAUevq6ND/AZEtG2C0+JmYkG/mpc2+BNbKlDp
	R0AJVEtiqO9bbB7f+AiRFfpjMNQSSAyiqD+SSdBVCAvgQYc6W6qOgDF77BXxeJjY634nRTao8JX
	oymFBYfLDnoaPWjnuDbyof2QSMeX9uCgvU9g1sdP/K/bUOxbowd1pla5t9Mgze01JxvYVE2XrBf
	RMxK3G26E8c/ZIK6AYElEDRQY4hzIil8PnL6y5neqI1cnfWl82how4PuN5HVjqnGpy3wmzNE84/
	Z/U0gqpmAhjE/x4F3plVTZjd1WiTKLU1Sk1yiIHyUi4hxsaSvBN08GD7VaymV1iSnqZYCA1GFDY
	3mk2NE48PdnxnA3o1reh5qsPdxtXtupOYZPfaPKh5AZJ0zp/iXyhGi700Dqb5GGXK5jRE4ggmG1
	yIWAVCAdNKKxBjDAEzuB+wMVyw1Mjf4D8MXQJDE6eSHFQMYucwbw5ii/hfg3zpZ7jbdlv4m1VN4
	l3W+f+cX1bIzYw=
X-Received: by 2002:a05:600c:2d95:b0:487:338:b4f3 with SMTP id 5b1f17b1804b1-4870338b5f9mr61514105e9.17.1774260410824;
        Mon, 23 Mar 2026 03:06:50 -0700 (PDT)
Message-ID: <383ef1a4-781f-46f9-baf7-824e9f8f601a@suse.com>
Date: Mon, 23 Mar 2026 11:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v v3 5/7] x86: Remove x86 prefixed names from hvm code
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260313163630.1073019-1-kevin.lampis@citrix.com>
 <20260313163630.1073019-6-kevin.lampis@citrix.com>
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
In-Reply-To: <20260313163630.1073019-6-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B52AB2EFAE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.2026 17:36, Kevin Lampis wrote:
> struct cpuinfo_x86
>   .x86        => .family
>   .x86_vendor => .vendor
>   .x86_model  => .model
>   .x86_mask   => .stepping
> 
> No functional change.
> 
> This work is part of making Xen safe for Intel family 18/19.
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> @@ -2163,8 +2164,7 @@ int __init vmx_vmcs_init(void)
>  
>      if ( opt_ept_ad < 0 )
>          /* Work around Erratum AVR41 on Avoton processors. */
> -        opt_ept_ad = !(boot_cpu_data.x86 == 6 &&
> -                       boot_cpu_data.x86_model == 0x4d);
> +        opt_ept_ad = !(boot_cpu_data.vfm == INTEL_ATOM_SILVERMONT_D);

Nit: Why not simply

        opt_ept_ad = (boot_cpu_data.vfm != INTEL_ATOM_SILVERMONT_D);

? Will take the liberty of adjusting while committing.

Jan

