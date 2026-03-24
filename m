Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FKLHflKwmnvbAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 09:27:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED44304990
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 09:27:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260103.1553470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4x6Z-0006Ge-Ed; Tue, 24 Mar 2026 08:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260103.1553470; Tue, 24 Mar 2026 08:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4x6Z-0006Ej-Av; Tue, 24 Mar 2026 08:27:15 +0000
Received: by outflank-mailman (input) for mailman id 1260103;
 Tue, 24 Mar 2026 08:27:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w4x6Y-0006EX-IO
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 08:27:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4x6X-0082V2-UR
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 09:27:13 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c24ad6-bab6-0a2a0a5309dd-0a2a450ae3ba-16
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:27:13 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c24ae1-1772-0a2a450a0019-d1558032a5a4-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:27:13 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-486fc4725f0so42948065e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 01:27:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b644ae048sm35975512f8f.1.2026.03.24.01.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 01:27:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1774340833; x=1774945633; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4XmYfbroGzP/O9nzOf3h8pGDQn+M+TCuToVs73hndxM=;
        b=CtaK5210OAlcyoAzq/QPvN2Qrgqvc8HaKeleFBjFl0x95Sq4H4/sbtf5ZV6YAJbfL6
         rvWka9XMLWPngFyxJKIN/kxE1W/2FPYfJcZ3PX3wqMMGgTCgVJJDVfzreN2KzvYgS60Z
         /14yIimOHLV9ljFjZEUX60H5MTl0DgMgrJuSyBDsnD8EpEwDnfldaljedAnrzpWSp+m5
         UEcIZGvjp87t7ge6+giYZhGw8+dbYSnsDZO/8qRiVy5uDhQGWqL9tWW664oYZjjgAl0G
         hyNNthx+e0qzNLX5pcwImqqYuC/4EaIj66lMMsahY0cuF/SzqRIfNvfnKzZmZaoQj8DU
         spvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774340833; x=1774945633;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XmYfbroGzP/O9nzOf3h8pGDQn+M+TCuToVs73hndxM=;
        b=LVlXIP3Vs/bLzNXbr521SMl69jEVTepXhpEYeLXSDRa1J79zMDtMoO7nV2/nhbGnyE
         jwFYehYx15fb11hbEu/rejBl/RVY8qrucYNLHjOhipn1j1ZkVmlI65s3s7g4bUjce3TG
         twu6Iz8UiqL0llJylCxC7yA5sh7bFWQeqFkvkAkTbKCSGyaKqWaj7SxF038qiqXjTVs2
         uXCNkpG8iBChHWhbimocOHd5YNNn/A942TR9tlcnKEBQ5tTcvOcTS+/kAetvjjCpnCv4
         aloe8IvqYuWURXhPaPk2HUDmbRQtW7paI+e/QOgnF/OV+XHBelSSGipO5AUJflh3ArqH
         4ZAw==
X-Forwarded-Encrypted: i=1; AJvYcCW7rp0FEKEMnHZl/Ojzgrv8c8jDqSEmifQWQyZN7VyhGbt8iX3Szfac/fWKnd+uEsABTV4XHcBbgpI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoCJdu6NPQ9UuvGVcmYw+F5ZIAEECDyjE3AoqM0WgRNSIF5wqx
	w1Am+Fvr88okhRHnPUOg3RW1mBcth72p0jaQGfgsgcDLENdFA0jmxpGDSQaupfEWlA==
X-Gm-Gg: ATEYQzyc5y3mp2iF8hBOT2OqkQ0fhp/CZscQWGsQ8g2ajgjw0DlYrb2plIIUVkwy2+L
	U+rEf/Lu1cZKI5XfANOLmhWevtvngh+Kch5EEsWP/hsHRps5gFB6/EyJ8C9bwrx012/Ytw9TlZ9
	ElckhWAsYbgh1vMkasaAIrkm2k1R5RSkhIZNVjZsVdnCgGkett8X4wPg2ps+AiEjfTux33zRIbh
	dW5si9T74XRfZit9Nm8VIWk0NpxOxjkIq4fZW6BbESaJPKK7548l8RQv1npSTizvw0Z6LQL5C0X
	oyKf2OBmqpVFa2ydRKZ0ueqTyp9TDZBNFQStjKswpNWL0NUV6szrFRX/P0wnLesOYamFmKDQM7s
	mIXhTHhy8zZtsg4ScsqEqwGhGng0eXbI8qDn7o/fmpaJtPv8KCyUX6Xs8S3Knzvv8ufFdNZ9J2N
	zZo0by41Z3r5D0AyG/eIhyXzTDmsCyLbgOorS9i5FYcxr4zWH6iQHlm6Fk2/Haut2euzREy8305
	Evpi4LrxMNy0gw=
X-Received: by 2002:a05:600c:6b4b:b0:485:4f11:aabc with SMTP id 5b1f17b1804b1-4870f22f189mr23944165e9.15.1774340833123;
        Tue, 24 Mar 2026 01:27:13 -0700 (PDT)
Message-ID: <fefe8733-e997-4eb8-a2b4-66975ff46b47@suse.com>
Date: Tue, 24 Mar 2026 09:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/23] xen/arm: vIOMMU: add generic vIOMMU framework
To: Milan Djokic <milan_djokic@epam.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <f20ce7b6b230ee234c9a278a6d69330f1abb03c1.1774305918.git.milan_djokic@epam.com>
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
In-Reply-To: <f20ce7b6b230ee234c9a278a6d69330f1abb03c1.1774305918.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1774340833-BDA8B900-6E490730/0/0
X-purgate-type: clean
X-purgate-size: 828
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9ED44304990
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23.03.2026 23:51, Milan Djokic wrote:
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -35,6 +35,11 @@ config IPMMU_VMSA
>  	  (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware supports stage 2
>  	  translation table format and is able to use CPU's P2M table as is.
>  
> +config VIRTUAL_IOMMU
> +	bool "Virtual IOMMU Support (UNSUPPORTED)" if UNSUPPORTED
> +	help
> +	 Support virtual IOMMU infrastructure to implement vIOMMU.
> +
>  endif

This is being added to an Arm-only section, without it having an Arm-only
name. Judging from the diffstat in the cover letter, there's hardly any
abstraction in common code, so likely adding an ARM_ prefix to the name
would be the way to go (for now, i.e. if doing proper abstraction is
specifically not a goal).

Jan

