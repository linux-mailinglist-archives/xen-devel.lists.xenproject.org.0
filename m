Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B851ACEED6
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 14:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006735.1385963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN9JR-0004py-8u; Thu, 05 Jun 2025 12:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006735.1385963; Thu, 05 Jun 2025 12:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN9JR-0004oX-68; Thu, 05 Jun 2025 12:03:13 +0000
Received: by outflank-mailman (input) for mailman id 1006735;
 Thu, 05 Jun 2025 12:03:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN9JP-0004M3-On
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 12:03:11 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c8dae29-4205-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 14:03:10 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-604bff84741so1681952a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 05:03:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-606e6b4d365sm2450752a12.68.2025.06.05.05.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 05:03:09 -0700 (PDT)
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
X-Inumbo-ID: 0c8dae29-4205-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749124990; x=1749729790; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yuyWPFhR9vouuWTwJYDVNkhB2rheA0q3TFazmwdccBw=;
        b=fwdQayDWr/ahi6T2hyXaWyo9T3Vb0rfwyzVmE/zcSwe47tFCgOfCrgG0i1EajRwBJf
         3jbfpzd8BX6cuGgtUybXKTtPUN0aHViGGZQ0t54qm7A32jyoesj1UgWqHcOOnpb/pMmX
         AOcoLcGnYhUUsiuLbdDCseb+SSSYYQxdL0vXWpYAxNhK6iZMDVFQ+WRDJgd6TL3Mh7kZ
         3Q6OqGgdmxeLJHs60tSDM1NNs6CHPCjZlhGY+bfWKYuFAEQUiIO5WK4H2ZkAFa/ZdhKj
         cAb77q8j3oShr2HwwXLSfga8tD9gky9//h/p3dhsAnAkDLLFQEWNE96PP4bu7q1ZJKAU
         RsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749124990; x=1749729790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuyWPFhR9vouuWTwJYDVNkhB2rheA0q3TFazmwdccBw=;
        b=BCM6/vR4MVD2tjuMydQniQdljK0a+tF5mQTip2b1rpS29U9QpfEOBoXqjYVUdG0Ua+
         2tFFlMdwcGP/anHe4gfn1x8XcybARXrT4mwMPbKwbklnGRmhwY/OwmN1Cot6kKD+8CCj
         pYzOPJJ/T3RYyuaoLqKjHfTamzE3J0FHvQZUulMv46c61eB2pKww6p53hKzykbxBPilw
         52QNUG5UX+smqwXFRzCFlYb0LsnOBIgGbzOPe+DNRRKPFfqF5jZtnqF3Wy1eYS4qu/p8
         GWFDNE4bzvAr2xvv9FJMCy+voICBamdjh613FUuvQJyMM/MFk2K7t1VMPF4oAZOPZZ8O
         tbMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWamAkkV7zNreRZgRrLHIJQ2k3r/2JvALtvzX/XGMdZ/gmUrPMb++1dIDIZwiIGG1K+59eiNXeEU0U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0Qc9RwZDrDIBvHquyUqDW40QMvfX3wAfYmiVKpJ9W75Yct/eZ
	Y+4RxaE4EFbxT1E3Nw00Wp7Z5GOP1LIGucOKSjUzOFrzHHiQ1FaY/86d3ro5q/a0Lw==
X-Gm-Gg: ASbGncskoMjFAckVXltUzcE1tjwZ7upQXLUkiEXeEm67shElRBum5WXE+HmvjabFnJ6
	CWSo7fsBGTxGQGH+bWVM0PX6HQsIvBtoIWaC7lmgn0g03mwTup345a0GgH29M0YnHhp3FgcAuVb
	5H1OqkgQn+p37+pcBTSIkfWdC3yzy6gBAaKzX4CGHStF0UrdiS7MYWEWryPo+NpZW/qK/xZVrHe
	w1J9U/m/HNEBaNMm9I6wcT8eUMd/FzlsGEa+jrjFFfHtDG1p1YwIk3VBMQgmibdQNxD63WOqJp9
	2h2UDznNU2yOl/aH94f+eGe9H9a4Nth8VklVnU31x5SC2Aw1kTIGVOFisvhEuaTHg31wGKym0oX
	lzioehkBIdD5jfwNWpSIRqj8VXsQ6Vb2B5PeW
X-Google-Smtp-Source: AGHT+IHyzuqboyAyutxQog/QcHVAEq0fcm+SpE7hGTvDmL5lURpDEQZtRj4p2srROhEZ+ZLxiKrwFw==
X-Received: by 2002:a05:6402:510a:b0:602:120c:f8d8 with SMTP id 4fb4d7f45d1cf-606ea179fb9mr6389650a12.18.1749124989574;
        Thu, 05 Jun 2025 05:03:09 -0700 (PDT)
Message-ID: <b4849370-fdbc-43ed-ac29-e38742d8df21@suse.com>
Date: Thu, 5 Jun 2025 14:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/EFI: Explain buildid.ihex
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250605111638.2869914-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 13:16, Andrew Cooper wrote:
> This is an awful lot of magic to only be explained in a commit message.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


