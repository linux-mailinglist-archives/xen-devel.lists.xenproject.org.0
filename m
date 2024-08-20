Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A01958452
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 12:25:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780276.1189900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgM1i-0006v5-JW; Tue, 20 Aug 2024 10:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780276.1189900; Tue, 20 Aug 2024 10:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgM1i-0006tN-Gy; Tue, 20 Aug 2024 10:23:46 +0000
Received: by outflank-mailman (input) for mailman id 780276;
 Tue, 20 Aug 2024 10:23:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgM1g-0006tH-Uw
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 10:23:44 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4679f4f6-5ede-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 12:23:43 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8384008482so561592966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 03:23:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83839344cdsm741874266b.114.2024.08.20.03.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 03:23:42 -0700 (PDT)
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
X-Inumbo-ID: 4679f4f6-5ede-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724149422; x=1724754222; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jQbU+wmhc9okDK89belLs9mlxFgpOghZ2CbgXLEJ9V0=;
        b=G0MI4zLscbNpHQqXdDL/ZGS6zmXqzGMJNI10m7V902JiZU2Zr2K387j916NsKy/byQ
         FC4QU2T79E6MrDyCxbmNJG2ohJsUTMQFdy8bKuWh3qCG5mV2iArKPMlThpWrltwqugRj
         rm5ZYkWbWxHU9VoWfYglVL0ZY6QidwT0946Ki1J+WkXISOF1+EXIt2tNtMmKr7K4lmND
         bD+owQDmwsT35zXklbQoK711rpwsyBOFwpCbQpaA6GRjTsZs8aTxVLl3zS+sjEIN9A4c
         zD7CCuN6NLKyiea5QudVs0cZhm0y5/wzj5ZaVgXVMBQPste4RREsAx876CRl50D66YI5
         smqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724149422; x=1724754222;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQbU+wmhc9okDK89belLs9mlxFgpOghZ2CbgXLEJ9V0=;
        b=RKd38F8Nr7b1uRqVfTvbMTalRGBcwjZIA3ZLDObZvWMtzE35CaM1ky0jFhvozeoBhw
         K9MN7zpviQS4vKZo7uI3ovpFaVARKvO5pT4qrQIL0pm52Dco2xewNjDPX67GqjQdu/xv
         RTC7fhp7Y/O4/D39n3G5oiQebQzoKyVg5PGDrb6wAQfS1HLvbRNaO3jJa27DMWj+g2bJ
         SFJQQbsSFHnkuR+ahCtsxEhVbCR8PKmMkWV2ltZ9qzVFz++ZC045Kb5e0dfWooMfPait
         kByDdB8KSrKqn67Wh/V0rgtuN6Z4MBWz17OaKM1MNPtBDbxG7DKDSEhf2p/Q7UYfOg96
         NHOw==
X-Forwarded-Encrypted: i=1; AJvYcCXqWU85HdBEPT1dhhJhCc0NTqykgQMg7WniZ3RB3nXF8xsESUpu9eyp0qTPhdadsAww9LKgnprvcNWa6eT7UOQJixNQbjJhcHNYgDNPORE=
X-Gm-Message-State: AOJu0YxedWE6T519Sse0xW9nCfbRRy6bp0Qat3p4LlJX8Bx6F4uqVizV
	xp7iyFqjXx7BFPamfjeTAv4sI0gSIOkt9kUIsJ6TRfsH5IoE/MLFUTmPIoya/Q==
X-Google-Smtp-Source: AGHT+IGYY6+/3Hs0Q6u/L07obMsnlHRatKoHFLlhFa/E1FH4GJdX79IJomctjDvK3E1Sp8/0CJuvXg==
X-Received: by 2002:a17:907:8691:b0:a77:c583:4f78 with SMTP id a640c23a62f3a-a8647a1a0eemr101756366b.39.1724149422397;
        Tue, 20 Aug 2024 03:23:42 -0700 (PDT)
Message-ID: <45a43d3c-35a5-49cd-a677-67fde3e5b56b@suse.com>
Date: Tue, 20 Aug 2024 12:23:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] xen: tolerate ACPI NVS memory overlapping with Xen
 allocated memory
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20240820082012.31316-1-jgross@suse.com>
 <20240820082012.31316-8-jgross@suse.com>
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
In-Reply-To: <20240820082012.31316-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.08.2024 10:20, Juergen Gross wrote:
> In order to minimize required special handling for running as Xen PV
> dom0, the memory layout is modified to match that of the host. This
> requires to have only RAM at the locations where Xen allocated memory
> is living. Unfortunately there seem to be some machines, where ACPI
> NVS is located at 64 MB, resulting in a conflict with the loaded
> kernel or the initial page tables built by Xen.
> 
> As ACPI NVS needs to be accessed by the kernel only for saving and
> restoring it across suspend operations, it can be relocated in the
> dom0's memory map by swapping it with unused RAM (this is possible
> via modification of the dom0 P2M map).

Shouldn't this paragraph be amended / re-written, as this was what made
me ask for what is now patch 6?

Jan

