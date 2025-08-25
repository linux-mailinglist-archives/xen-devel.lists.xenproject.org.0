Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E209BB33CCB
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 12:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092942.1448540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqUT7-0000jp-R1; Mon, 25 Aug 2025 10:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092942.1448540; Mon, 25 Aug 2025 10:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqUT7-0000gx-Nw; Mon, 25 Aug 2025 10:30:29 +0000
Received: by outflank-mailman (input) for mailman id 1092942;
 Mon, 25 Aug 2025 10:30:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqUT6-0000gr-0H
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 10:30:28 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8411d981-819e-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 12:30:27 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afe6fe7c89bso182741966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 03:30:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe81ebf53bsm164561066b.15.2025.08.25.03.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 03:30:26 -0700 (PDT)
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
X-Inumbo-ID: 8411d981-819e-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756117826; x=1756722626; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S+SDKZIiAKLCn7ccHg9mire8mGYQ15r9ZFJm/Drvk6U=;
        b=YrKYfsoaDLekr3JvbM2+kPEXJlelNLtP0quyDK8ts+QHowYESjI4kZtds0XfJ3Pxm2
         qCiS5dU47Zgt1g/LsqJ9bBj55QSNIdE7hBLvsA1mebKjjVgvpqdGL4ug6WjrOlExJEBm
         LKkjArCnAmY+3UY3bLKxfF/M2687MnrYtVs4yG1TzQyby+WrvQ8rUmgAYc/ZTiVmuLwV
         qEn6yo1acDS8S9g+CGwePQdEj6vuYaCQ1wmFv0C1mlx1F6hj+4w0ulK60tQS1An7Q4VZ
         JbBEjXmRGDwOz/pCmYK1tvmbt5eV4mb2jibK3L52EgVgkyrgbLkJ974Rt7MKjRaA2ELX
         yIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117826; x=1756722626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+SDKZIiAKLCn7ccHg9mire8mGYQ15r9ZFJm/Drvk6U=;
        b=bkyEhsw28iZlsp698dbnZx1m1nWGoemplZikAjhPdrMcTUG4Srf6wxDyZmSsKb1/kF
         qgRQ5Wiu6oM9N4lUMVI9SinLywLZoW6MWJdPi8S2NM86RCLSfWTLI1FO7Z8H2xzLu2Xk
         0zzhyT8J7Mjplul19CZmF4fSwy3hX2Y8PC+iqhnBGBjjsrgA5Ipa2SGlXwT+VcMAO/oe
         xAPovfFzORFywS8N63y/GwSlM+5Tnk2lirJILuiyOS6gIgsdfU0p8pNMcCg6mdD4lmOA
         WnLXOwRdyFHD2Xk4B3hFDRi58h0igVAGyBYq/I174UUUs5pV6Zrf6HhHvA6zCbiFET1j
         3nTg==
X-Forwarded-Encrypted: i=1; AJvYcCXhR4/nNsrQeREi7MBA7/4kzacdaohfwAtphNx7HtNmfgKr566bCO9WQXIJ+XBCkyhqbajxVh8yNLE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxX90/zSQDa0FjGWO+8138Qw46y5fCGQBfpl4WgMpzn+DQAIjcT
	8GXiZmwkUN5kk4DVsPNf466Xtx3e9UqTVHETgj9vAEHDbSXqlzJDrT+c+5NwzbeCMw==
X-Gm-Gg: ASbGnctw10XZHV3KKQ+8DlAsJmGqz8V718N56pgwyDVtM6jPJivVCErKnXs181564hR
	d1Bx8nC55TI9Nrwhd0IO2Cg5yvcjaFGf8Fwzx7pVcjuSMaeAjHKZLC9IhQavhJ2TcEDCQKQZ22W
	YsBmzs5IMQQZalkgUnX520tI0fbJLc8hvbB0jcJ35gCPkBJfhZXTaRw0GlZ8mESQ1wmi2FoNniM
	29oPFq19Rk68UkY3N/JHvYDoVKig2abhRiyGG9NW/rrIxctcEq9RW6opuYJA/m91GgwYZ4rBrae
	SL3vDx1EoXAoJczursi4lwmtOkbCyTQUTXYl0v4lsARuqbI/FTQjYOPYuB4WqwxbVhjYfH6ynmb
	fUAyi0MMY4L7HgEf3x8OvEEPdAukWoEkltYaTzpke0P8EXAFZn4UzWtB3XpO+ltn00uhoJpND4p
	gt2wOw1EU=
X-Google-Smtp-Source: AGHT+IErWCvIcJdhTI4v9r+3pWJ1S0pOmHeDqK3gMTiSLwDniaQmF33as/fkY08K89/Y0ZkL2S1oTw==
X-Received: by 2002:a17:907:9722:b0:ae3:5185:5416 with SMTP id a640c23a62f3a-afe290185d0mr1158518966b.13.1756117826375;
        Mon, 25 Aug 2025 03:30:26 -0700 (PDT)
Message-ID: <53d5cee3-9001-49a2-9da2-e56950a77683@suse.com>
Date: Mon, 25 Aug 2025 12:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add deviation of Rule 17.7
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ad15582787e675fadf92502f85041c3232749a99.1756112701.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <ad15582787e675fadf92502f85041c3232749a99.1756112701.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.08.2025 11:05, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 17.7 states: "The value returned by a function having
> non-void return type shall be used."
> 
> Deviate functions like 'memcpy()', 'memset()', 'memmove()', 'snprintf()',
> 'strlcpy()', 'strlcat()', as they return a value purely for convenience,
> their primary functionality (e.g., memory or string operations) remains
> unaffected, and their return values are generally non-critical and seldom
> relied upon. Update 'deviations.rst' file accordingly.

How come snprintf() is among this set? Its return value isn't quite just
for convenience, imo.

Jan

