Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7900B3E748
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 16:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105020.1456011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut5dF-0003Q6-2P; Mon, 01 Sep 2025 14:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105020.1456011; Mon, 01 Sep 2025 14:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut5dE-0003Nz-Vx; Mon, 01 Sep 2025 14:35:40 +0000
Received: by outflank-mailman (input) for mailman id 1105020;
 Mon, 01 Sep 2025 14:35:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut5dD-0003Np-DE
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 14:35:39 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed262057-8740-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 16:35:37 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b0431c12df3so141402266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 07:35:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0416e878a2sm420837566b.95.2025.09.01.07.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 07:35:36 -0700 (PDT)
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
X-Inumbo-ID: ed262057-8740-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756737337; x=1757342137; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W8Vq3X22cq1z0AO8Qpb5DTb9Jg/EwQI2gYZ3eSHW/1k=;
        b=EiRZruzwbOhXGVizEyVAmrGfEqddbE3rB/cfSTs15aVRebQy19jKfKdlwrWGcY9UM+
         RoeEI/J8hIEY1iIIESgOen6wflkzojIa+0FUYyKwYsy3VwRxojlFgyOjiGSN5G4zPgS4
         90oYYctYrs8Dt/XNhsWo9D7U+zfWIBc51IcLd6Oa9JubCBdT8t75Ol6anv+jruVwudxC
         EuI+ys4/jOhzO/dPxcFE1Awu0+7fagYPVeGVZCAYicb9lZTndAYS/SORN+KERGYu8H1R
         ot5MBAoeyc/XSbf/ldFcvWJDS49GfTFdFI5rvtz5fqax18Aj501IbMODtf8dBzli7JPc
         qK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756737337; x=1757342137;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8Vq3X22cq1z0AO8Qpb5DTb9Jg/EwQI2gYZ3eSHW/1k=;
        b=UbSwMutfXsBR/LKrPndZdSu0G4zlWJLnkzMpzuoD0DctsnuNdaaoIKvYg75jK7GRCP
         x1aT7kr3zY0NdSlrmPhGsLJ8N45MSmD1pueUuH4S4j0wUwaBamuUy6zDbf0ik8SEgIjW
         n5gw+Qgr5jK7E48C1wTC+CIC0haSioRtQWzGIrFLxa2DtgEquAdXcak3/VHsihiJEH9l
         j3X4cdnafGDlTkHw31RsOyIa/xiC9xLm7TinrqhA8rN9oHc/Mo0xUzDPj519ka+ANneL
         UQ8Chiepz5kkxBr/8CevhfhvO0A5gjNzQ4MQvT+yY3TpijSfCwhMuOMbg8kECTlNeXnx
         T+1g==
X-Forwarded-Encrypted: i=1; AJvYcCVUkIKD7yeEpOVwj8kj5fyncZ1G1mFhExE0mRoHdqsuMbGnxolXhte9DBuaK6b+PLjoG5VYpXUloQc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywcl0YA/Cmue/a1GyyEMnsz109IGwfbEkAt9bq8tHB+MdiURYgT
	vaOwDRZikzPTy3pwBxrI2qcGAU3fDWy1lWWzb1nepOvYKXwOARWISu3l4dXP5vGH2Q==
X-Gm-Gg: ASbGncssshnvGbm3D+RA0HFOs8QMK9pLeUQbo2mti7zZUGlka6ZkZKLBV9tAMfuu7oB
	D4ObzNaih1Y9dIMm9nSMYE5RDq5JRa4qpA6QD10r7nnP9aFv9BgELiycNR9jzKnisQu1xJdULCV
	idaq+AsJ1HXrEg8FxfK3Mp1xKe5DLUIEE/jtQxV2R6nUi5wQa8a/t5avSm/1sqJCaPCWL/EdDx/
	NMopRcG6U4ygk4C6BdqUgAnvSXOgMZYlgl5UzE4xhXmgVB/tMmkHtgjBHCdMnKBHAiHQnEZRv/G
	MKvuMct0sJqrdDzEonqSdmm8e5RF5AjGN19qQkI3BVAmQrRda0bL1J9W5zT1IoodGxLK3u5TCf3
	PKYKBVaEPlq/3xbQBERfx4kmmPsPYbsWVTUtKJbcJyxKfNe9xZ2ahVSPUimle5w6N09TcEXP8kT
	F4T5BoDG1OddfM2WYu+A==
X-Google-Smtp-Source: AGHT+IGFCSfGNeTKZ90u4o1CV7D2UIcbc1x9pjjyayilYfz/BHb+rxWVZ0H5/Hp+0diyH0ATo8PVfw==
X-Received: by 2002:a17:906:1c4b:b0:b04:20c0:b1f9 with SMTP id a640c23a62f3a-b0420c0b498mr404263166b.52.1756737337013;
        Mon, 01 Sep 2025 07:35:37 -0700 (PDT)
Message-ID: <82d2264f-8d44-471b-875b-4b6f432a6f81@suse.com>
Date: Mon, 1 Sep 2025 16:35:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/bitops: Optimise arch_ffs{,l}() some more on AMD
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250527222930.1452674-1-andrew.cooper3@citrix.com>
 <20250826174135.605220-1-andrew.cooper3@citrix.com>
 <3ec7b53e-aef6-4a00-acb3-19cbbe6543c9@suse.com>
 <fa534ac9-21db-4d26-94f7-e7a016f31edf@citrix.com>
 <8e7293e9-6479-4904-8072-8eec9f1d5751@suse.com>
 <33ad597d-82e1-4e74-971b-0afee9307a55@citrix.com>
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
In-Reply-To: <33ad597d-82e1-4e74-971b-0afee9307a55@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.09.2025 16:31, Andrew Cooper wrote:
> On 01/09/2025 3:26 pm, Jan Beulich wrote:
>> Hmm, okay, it is of course in principle possible that one flavor is screwed
>> while the other isn't.
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks, but I now have both R-by and A-by you on this patch.  Which
> would you prefer?

Oh, sorry, I checked whether I sent an ack to v2, not paying attention to v2
already having a tag. Please keep the R-b.

Jan

