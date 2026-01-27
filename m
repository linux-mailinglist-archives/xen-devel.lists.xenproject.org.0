Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL4sGtjReGmNtQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:55:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0C796174
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214896.1525144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkkTA-0007W8-1U; Tue, 27 Jan 2026 14:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214896.1525144; Tue, 27 Jan 2026 14:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkkT9-0007UU-U4; Tue, 27 Jan 2026 14:55:03 +0000
Received: by outflank-mailman (input) for mailman id 1214896;
 Tue, 27 Jan 2026 14:55:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkkT8-0007UO-KR
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 14:55:02 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27c2e85b-fb90-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 15:55:01 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so20529435e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 06:55:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066be7413sm60496285e9.3.2026.01.27.06.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 06:55:00 -0800 (PST)
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
X-Inumbo-ID: 27c2e85b-fb90-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769525700; x=1770130500; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4SoXi/i02wz6rUdzNd3IZMG+Sq84Cytphi9dWkQBOYk=;
        b=WfDA4MHG1xgaP4nkLCuNglsenngwwRQuS7LiOCBNl1L/Sgg3bn1N2OSY4JFVTgjuC6
         hG2K431vVEwWo0w8CALMxkDqgsn57XtLj6lzzZyniGJuGbacOYQwDINHk8+XJItayI7N
         ZElKC5qs6CQt1tIWkFqeZalt8ZiHcN2bTft/9BXogy2CsklKKaAM2/hWjmP7IXQIZQVe
         B8/O+2HJmF+ybzbUJJQHBa18ijDMsmmVd9nXbVnCs+G0Sof41QVraUkeldvTNRuVyRqA
         J6/n3oA3w6jcRjkK5haUMHZJVh/tnd3AtdzF7JOKoebAtbOLAQPRD3GyarW1QT2dp/oa
         x0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769525700; x=1770130500;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SoXi/i02wz6rUdzNd3IZMG+Sq84Cytphi9dWkQBOYk=;
        b=Ee23bhT840XbbtO6HU4WiTKh+JRoFOVoIFabZhINita73+vKpUBjpNUwnQx/CrYSFZ
         CGEMt8hNIzdjezQBzwT2iPivjzHnPvVE/Hh/ObzbgWmWuQiynER0n8fcT7E++RUMYFzf
         Eg+v2JE3+5HwhJBbHYrLouRnjrf5UzhFkypnFpkg5qcdGr7Sg7ZOUp0tmQQPmsjWTXT2
         r9QAWd7AozjUPWn8JTiEgD3jsOshMK9kLH2tV/kWrSOfxSZsvNW4nc1CgjJ3KOHd/2LF
         r49ZfMqAu1GucNz613GLTDz7SUU1DH0uMurbekc8pgMT+8kHrOsgQCnM7+yib5yEJ6EH
         +Eog==
X-Forwarded-Encrypted: i=1; AJvYcCXM7Q3CiF5xCwfm9J90MOdoQkJgg6H+v76ioNr7R4QHTa+yaC9h1w0mJ6rDjY5wP4lf7Dfi66hjmiw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwkorVogYR7uFXu3QHFgMi8/ArZxjI3HCL/DqelrBJvE9SchpO
	tOb6dikZ1FxIqc+dZxPVWIgZK0lxvLs7EUj/23FNBjkqIgTCIj1KA1+9E4VhAHGGmg==
X-Gm-Gg: AZuq6aI7xx/8DmeHupe/QCebsYSWT3Jw+qRnxdYYSE30QdkpTcrzTNCd4UlfOVQrK3c
	5g2h0XWs/QgGruE1HMlNyaykJ4fBAuqez0XMieGinMjz/K3xILLUfqN2qGCzUjWSSW5mn+b37Qa
	a6iClyXVELHbG8pTwijDZcY7yH71WLNnDaCtWKcU1Ug0DkEa/YGrwfEBk1KlxZ+NzwE/bGDcCb0
	peqrqlblLVQbwszmeDeL3cZB7zjnqaF8uIqzsMlQOYX4LG2PMSEqa3COGiqm4WPxG/reKyZizBe
	m4ZMRe+Emfviw9MB+x79XCqJJcOe7EtXey08evzvD6BcNgPUnLHccwWTuEnYaNPCmSa2NvrRAGC
	iYdcn5/iSv7eNY48bILn9CCx9/OZJ5tD0VYAMaRAqsYGCzgkSC6EIjN49/ox93JOgQuS/Ap/BGG
	49KauF8rqtTc/DBEK4XOs3byOfqWFASQytOSCIIue36WkUMzCk+iQMKnK68sPEIH4+KmFAxtfW/
	dyps1Zy64O7SA==
X-Received: by 2002:a05:600c:3b8e:b0:477:b642:9dc9 with SMTP id 5b1f17b1804b1-48069c54c3bmr27348805e9.28.1769525700589;
        Tue, 27 Jan 2026 06:55:00 -0800 (PST)
Message-ID: <321c036b-0553-47d0-bb9f-31676a9151b8@suse.com>
Date: Tue, 27 Jan 2026 15:54:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] xen/sysctl: Drop XEN_SYSCTL_get_cpu_levelling_caps
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-9-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260126175345.2078371-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,apertussolutions.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CF0C796174
X-Rspamd-Action: no action

On 26.01.2026 18:53, Andrew Cooper wrote:
> This hypercall is an addition of mine from commit 67528a3f0649 ("x86/cpu:
> Sysctl and common infrastructure for levelling context switching", 2016), but
> it never got wired into any toolstacks.  In the meantime, how we handle CPUID
> for guests has evolved substantially.
> 
> In order to reuse the AMD levelling infrasturcture for boot time quirks,
> levelling_caps is going to have to change.  While it's probably safe to expose
> this difference, it's safer still to make it an internal detail.
> 
> When re-plummbing the LCAP_* constants, turn them all into single bits.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor & ~xsm

> --- a/xen/arch/x86/include/asm/cpuid.h
> +++ b/xen/arch/x86/include/asm/cpuid.h
>[...]
>  extern unsigned int expected_levelling_cap, levelling_caps;
Observation while doing the review: Why are both _probe_mask_msr()'s
2nd parameters uint64_t, when the variables here are unsigned int?

> @@ -1270,7 +1251,7 @@ struct xen_sysctl {
>  #define XEN_SYSCTL_pcitopoinfo                   22
>  #define XEN_SYSCTL_psr_alloc                     23
>  /* #define XEN_SYSCTL_tmem_op                       24 */
> -#define XEN_SYSCTL_get_cpu_levelling_caps        25
> +/* #define XEN_SYSCTL_get_cpu_levelling_caps        25 */

I realize this it to match the earlier line, yet would you mind rather ...

>  #define XEN_SYSCTL_get_cpu_featureset            26
>  #define XEN_SYSCTL_livepatch_op                  27
>  /* #define XEN_SYSCTL_set_parameter              28 */

... following this style? (I wouldn't mind if you also touched the malformed
tmem line at the same time.)

Jan

