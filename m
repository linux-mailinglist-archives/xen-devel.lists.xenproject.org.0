Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U7XhATsVTWokuwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 17:03:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEAB71CF69
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 17:03:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=LPVRLjFn;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356332.1610966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh7K9-0005zh-V6; Tue, 07 Jul 2026 15:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356332.1610966; Tue, 07 Jul 2026 15:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh7K9-0005xH-S0; Tue, 07 Jul 2026 15:03:01 +0000
Received: by outflank-mailman (input) for mailman id 1356332;
 Tue, 07 Jul 2026 15:03:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh7K8-0005xB-O2
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 15:03:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh7K7-005AaA-CI
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 17:02:59 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d1523-5cb7-0a2a0a5109dd-0a2a4506d688-2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 17:02:59 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d1516-08de-0a2a45060019-d1558036e043-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 17:02:46 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493d92b7db3so26948165e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:02:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f40912sm58952715e9.4.2026.07.07.08.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 08:02:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1783436566; x=1784041366; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1wC+pO5wbvx4aTmG8LGTZ2oy8BVV545yiOHvg29epQ=;
        b=LPVRLjFnUUBYaoZ9gRY8Du5OpIMvVpso4snvNvW8bxT+6F8pRRL+klc/s1FieQ/9/E
         xc99j9fQ2jXuDxrk7bmCzzh6vtaclBjx7g8J1zwbMGLm/AWGQG/cm4fOmbNaJRN2Rzwy
         iVWIRFMe4SvCamBMBuRc0jtJ8xywoQy+JyauGzgIC2DEFgQJ3flj/mIWu2AC5HIonSr2
         oN0g+CH/zfBieWPdU+tetbMCrRutixTWaAxc/N0OUPt+h7dEpRv9hHI1aSSSpFfoi72L
         ZwRqyOS9LAor/wB1mvEjJlEIC6qrNBJoN+ExVaa/xekOs7gqgKNnQGt4L24nyOeD44x2
         aMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436566; x=1784041366;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1wC+pO5wbvx4aTmG8LGTZ2oy8BVV545yiOHvg29epQ=;
        b=HBdtEWxV6nuXPq/IKJzFs77NFV/VZ6VdNT5xd5JfXxjstPtcUhApQDflQJno0dhCSn
         q2I59LReSp7EXmanVuZrkkxr+n7WvyIBCjLFUnMzknchtqgLoWI5bt8RfXcdmN4qGs2u
         iaczvxfBxHvFiBA92BL3oJ4F/sLThejPcGoPMa+TTPWe2/oKcMgYec4Z0z8nGerKwPsp
         I2MHGWBzQjskkKZL3Qtf39OD2B03gtc41Vrn8iP1q9GlYiBWkAKltOlC0prCdweDQ029
         V5Rv7VI+Ebf+AaxCZ6rcr2Pe5lApaGHHO/4DzuOg6oD0ujYUKGPMdqaQ6bZ7cqWMewT4
         ZnhQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgbQo71guF2nUhIbihtqaM/Gg2hQORc6ccO1B3Ig6j/YcgS0aBaS3YCzAEEmkFZ6eONF7HCE3ZSiY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwgQC6mshIgwbrucHlthzxl7FObxw7+MVi6nP8PFdyHOQDAkFD
	wZ3ryKPCL999i2bf0Xok3t2yJfqfmN69kmcdqT3ROKDvOTrL7Vh2E0GjB26hc0i1OMQm5gXmWGK
	e1BziGg==
X-Gm-Gg: AfdE7clDM2iTDOtYj78rGypQN9QIyBkMJi6HywNALAqwrQLSc/dXTq6/ox7Y6fUi8Wn
	sQh1pmhRg2+dT+7+ndiAtKEWW0lYdcJ7pHio7r116jnCzsdOd5bFLv0K1S6wsJu7YL5FSaRjMYo
	pPX9j21e0AcvQXHAGOMgPJ6rdA6ws9Z0qAanrvhqcDZEzSzmVjrNq4pA6pwrnc/EzTxMtTA3bSP
	riRlqMiQRl2yyhQaqtBeZB7udYu/YNpKc6wVjxtTaH50duWEXp2PhyOts9QLxKJGFuBlExRWHyS
	eDSihTlh2fDzdz/FyNA3CFB+t7yNNrml9xBa+GSZBW2x1rnWtw+S3jSJbbU3qz3YiiHlwZ9yaux
	j9ZSaJJBkcyAQ3QGHMVAGmPVGAzQYttatwEi8V6G/R9Z5nrCgpamZH1123D3ToNWiLyeE7rWcHk
	AOY87L/N4FSb/zx7vNIG9ioFYfCF4wKS6I1LfiLy1ZVyr1BM4CozVhEc7RSLQURhSWhWOVChoOQ
	JiK
X-Received: by 2002:a05:600c:529a:b0:493:cfd2:cd06 with SMTP id 5b1f17b1804b1-493df063deemr65242045e9.6.1783436566244;
        Tue, 07 Jul 2026 08:02:46 -0700 (PDT)
Message-ID: <ee54dd2a-d1f3-4144-911b-168fdb5a8722@suse.com>
Date: Tue, 7 Jul 2026 17:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/18] vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1782747421.git.teddy.astie@vates.tech>
 <1782753817.8631fc262581453bbf619ec5b2062170.19f1468731b000701b@vates.tech>
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
In-Reply-To: <1782753817.8631fc262581453bbf619ec5b2062170.19f1468731b000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1783436566-42F2468D-165D484C/0/0
X-purgate-type: clean
X-purgate-size: 1837
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BEAB71CF69

On 29.06.2026 19:21, Teddy Astie wrote:
> Use a dedicated pci_sbdf_t struct that we update instead of recreating
> one each time we need it.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit preferably with ...

> @@ -1195,8 +1177,9 @@ int cf_check intel_iommu_get_reserved_device_memory(
>  static int __init cf_check parse_rmrr_param(const char *str)
>  {
>      const char *s = str, *cur, *stmp;
> -    unsigned int seg, bus, dev, func, dev_count;
> +    unsigned int dev_count;
>      unsigned long start, end;
> +    pci_sbdf_t sbdf;

... this new variable moved to ...

> @@ -1233,7 +1216,7 @@ static int __init cf_check parse_rmrr_param(const char *str)
>          do {
>              bool def_seg = false;
>  
> -            stmp = parse_pci_seg(s + 1, &seg, &bus, &dev, &func, &def_seg);
> +            stmp = parse_pci_seg(s + 1, &sbdf, &def_seg);
>              if ( !stmp )
>                  return -EINVAL;
>  
> @@ -1242,12 +1225,11 @@ static int __init cf_check parse_rmrr_param(const char *str)
>               * Segment will be replaced with one from first device.
>               */
>              if ( user_rmrrs[nr_rmrr].dev_count && def_seg )
> -                seg = PCI_SEG(user_rmrrs[nr_rmrr].sbdf[0]);
> +                sbdf.seg = PCI_SEG(user_rmrrs[nr_rmrr].sbdf[0]);
>  
>              /* Keep sbdf's even if they differ and later report an error. */
>              dev_count = user_rmrrs[nr_rmrr].dev_count;
> -            user_rmrrs[nr_rmrr].sbdf[dev_count] =
> -               PCI_SBDF(seg, bus, dev, func).sbdf;
> +            user_rmrrs[nr_rmrr].sbdf[dev_count] = sbdf.sbdf;
>  
>              user_rmrrs[nr_rmrr].dev_count++;
>              s = stmp;

... the narrow-most scope it's used in.

Jan

