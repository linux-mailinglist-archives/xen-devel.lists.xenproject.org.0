Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMDWF1mAnGmLIgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:29:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D21179C90
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:29:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239238.1540679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYnk-0006dV-BP; Mon, 23 Feb 2026 16:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239238.1540679; Mon, 23 Feb 2026 16:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYnk-0006bE-84; Mon, 23 Feb 2026 16:28:52 +0000
Received: by outflank-mailman (input) for mailman id 1239238;
 Mon, 23 Feb 2026 16:28:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuYni-0006at-9q
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 16:28:50 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb8bafad-10d4-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 17:28:49 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so50325175e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 08:28:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a4e8d392sm245257785e9.2.2026.02.23.08.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 08:28:47 -0800 (PST)
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
X-Inumbo-ID: bb8bafad-10d4-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771864129; x=1772468929; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IFdaVeftgkFAomm26AjL10ccMTmEbHpLfmot698xY0o=;
        b=I5vHGuMXoqwZWnBXSTEP/RgX8wtoX78x+xsDYH85cNlF7rsgQzdLT24ka3ibbsrjz9
         2wp/C00R58WRqJLgdZkp4ReMFP7xGI+X5IEZSYsArGcGSnwkfmPArMwPNBqI0VJwfMai
         YxaN5sPZt37uKvjQKvYx6vR+zc11vVtzsubdbnSKyPS1VjHGJHX6NzOiOtK3Rr+gFbyV
         kSRhSUfadsnD01YSAk43FDx016L6a/jSA+xFQY1NKsNq41E0EffOMvP75ilkGrQ+vaB4
         pdzJ+gKIWKuIeJU/Ubm0PQ0m+vL5DeWo0x+syrbqD3PoBsaYL/sq40arWESkKZf+eg5O
         lY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771864129; x=1772468929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFdaVeftgkFAomm26AjL10ccMTmEbHpLfmot698xY0o=;
        b=vz5BtK/rVvMRZsnyvTaRVxyYCw+IcFvWw1PHBrFl3cz3qtDuEJYfIE+IHQ7GGURQ9q
         i7O4OsLWyK93Niuwnw3a41PmpueyGy4hmSJEpPwV23548MV35gUuX5b11r5v5WaC3o44
         vn4dVCWSIwz8FbOwqVSMTelaSmuWArFqE3nZ8rKZ4z/+Qhonk40UjqJ1ueAOBbyxlowE
         LcAmVQ5J7XoU0rRjNSFXtL2PIBQ9vSXDr3Yro8X+P+8sF6yhaGJWeKkEsd3xda+XIjal
         VXa9dZX3wRHu6G+FXxDj6whbty6sOjjOMoCZr0f6Xmx31QBcOxDnJBF0UCtfN/JxqwXV
         sNhg==
X-Forwarded-Encrypted: i=1; AJvYcCUMzViu4SVRN/vA/RQ/8srzHOLNSFMshso5I/lU4H/szYusvzGOzUJ/mgqnFc1FI8++i8PbyAdv9is=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjxW1u/pbydrsoW8OHAL/iT/d8V5SkLAWE/3SFXdNBESzHm5mQ
	SRMD7QF651bPHlH3FAtVW4sCtN/Ft4s9kfnD8nJpdaVr/HdADiVRB9FPXUxjiflLtQ==
X-Gm-Gg: AZuq6aKF3kFvGt6SSDKyf/pEEbXf7iGC+QsPrsWt+1eMv4QgQUhNIM7+TZVZ4Oyl665
	XC1rb7jKL3tpX42t0aXLffwrNEpQTNP64w8H/a+IjpvwPGk02eiBRLTwudTC3Zr4rDOpWwCgXVj
	YS4GmEs0dDBhMf0+teC3/UOTMoMIAp2mIGGMXJT1LX5ddNEusMlFha+z0OeA1EUtISCNTOSTi7F
	4sSTg6uqA5R276qKr3tSKJrUsn32KDeIwxNDX+9TiKf1mynfEFSxFaXVhIjUdvkYS+GUHJIC1kg
	ZVZH/48fqKdnny3VukXoIfS1N+KJnUue23bjxXlDnNnsAXLtLrkdmzQn5emNUDE1BihTPqfInwA
	JHSbRhhf3cqINNDOKgsQXS5EZvIL7RQ+4WTk7S9LeJilVJtTCVE+VAXNNpTWSV8N9oqlsJ/GbTh
	zS+sU3a85eH5V2NNVrRb4cPh8E/UbPWmR9WF5JIGBB25Z7juIOlgZRwWEk1Y2/OSSsD/ODdoNmw
	GPySYapFXRCT6M=
X-Received: by 2002:a05:600c:a418:b0:483:b3d7:2e80 with SMTP id 5b1f17b1804b1-483b3d72f30mr39549805e9.33.1771864128556;
        Mon, 23 Feb 2026 08:28:48 -0800 (PST)
Message-ID: <ac6bc108-318d-4bdf-bc46-c907bc2550b5@suse.com>
Date: Mon, 23 Feb 2026 17:28:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] xenpm: Add get-dts-temp subcommand
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <c8677e4588eff14197e47070587f31df1567c030.1771860109.git.teddy.astie@vates.tech>
 <b51b2a16393be4ab956d16ba409fc6710e20db55.1771860109.git.teddy.astie@vates.tech>
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
In-Reply-To: <b51b2a16393be4ab956d16ba409fc6710e20db55.1771860109.git.teddy.astie@vates.tech>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,vates.tech,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 94D21179C90
X-Rspamd-Action: no action

On 23.02.2026 17:06, Teddy Astie wrote:
> get-dts-temp allows querying the per-core CPU temperature and
> per-package one on processors that supports Digital Temperature Sensors
> (most Intel processors; as usual Dom0 drivers cannot work due to
> misalignment between Dom0 vCPU and pCPUs).
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> 
> v4: https://lore.kernel.org/xen-devel/cover.1766158766.git.teddy.astie@vates.tech/
> v5: Removed trailing whitespace.
> v6: Report errors through errno and use strerror() to display them
> v7:
>  - Rename get-intel-temp with get-dts-temp

I'm sorry, but would you clarify in how far "DTS" is less Intel-ish than
"Intel"? Something generic, re-usable (for other vendors) may be "core".

> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -13,6 +13,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - Support for Bus Lock Threshold on AMD Zen5 and later CPUs, used by Xen to
>       mitigate (by rate-limiting) the system wide impact of an HVM guest
>       misusing atomic instructions.
> +   - Introduce get-intel-temp to xenpm to query CPU temperatures on Intel
> +     platforms.

Nit: This still says "intel". Also the sentence looks incomplete; perhaps
missing something like "command line option" or "sub-command".

> @@ -1354,6 +1358,130 @@ void enable_turbo_mode(int argc, char *argv[])
>                  errno, strerror(errno));
>  }
>  
> +static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, int *temp)
> +{
> +    xc_resource_entry_t entries[] = {
> +        { .idx = package ? MSR_PACKAGE_THERM_STATUS : MSR_IA32_THERM_STATUS },
> +        { .idx = MSR_TEMPERATURE_TARGET },
> +    };
> +    struct xc_resource_op ops = {
> +        .cpu = cpu,
> +        .entries = entries,
> +        .nr_entries = ARRAY_SIZE(entries),
> +    };
> +    int tjmax;
> +
> +    int ret = xc_resource_op(xch, 1, &ops);
> +
> +    switch ( ret )
> +    {
> +    case 0:
> +        /* This CPU isn't online or can't query this MSR */
> +        errno = ENODATA;
> +        return -errno;

I fear I still don't follow any of this errno handling. Why would a function
return -errno after setting it? Yet, here you want to "synthesize" an error,
but that wants doing to match library functions' behavior.

Jan

