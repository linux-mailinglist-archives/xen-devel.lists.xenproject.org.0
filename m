Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BC8B41753
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 09:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107935.1458111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utiKc-0005sh-Px; Wed, 03 Sep 2025 07:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107935.1458111; Wed, 03 Sep 2025 07:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utiKc-0005qH-ND; Wed, 03 Sep 2025 07:55:02 +0000
Received: by outflank-mailman (input) for mailman id 1107935;
 Wed, 03 Sep 2025 07:55:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utiKb-0005qB-7W
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 07:55:01 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a8159f3-889b-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 09:55:00 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b042ec947e4so451836966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 00:55:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b02152cc1b8sm1013733366b.36.2025.09.03.00.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 00:54:59 -0700 (PDT)
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
X-Inumbo-ID: 4a8159f3-889b-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756886099; x=1757490899; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8Fac9W0WyfAOWo1532JBJfaFeza7fgTiztMVtxng74=;
        b=fVWhTUsRgnx0g/BixGhssjTmxP/n1pysQglqGRNQUI0MrD7fLlN7JW40/y3HJhjh/9
         MS4/tIWg5eVC1Dn34jtKonXsys8rZ8z5srL0S4CQYzKiWQAZvmWfVKNFhOb11crZ8ZQv
         eZ5vkzX0jm2p9rixlEcnlNn10A8+HLu4Ojn9ufpUCwGblL8HRPVcVq+gtaIwsLumR1M6
         fwQtXgnvmkkd7ow/fkbpwX8xWQNArB5Vcvr52m3+96jJ34IcrDkc1v9FHpAyLBi2xsu5
         gPVsTEAHlDNOxctT0JHyzZUW9H9xsXMvzljeAo+WEECJPI0Kh0Us1DTWxNZM2UKjUasc
         3nLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886099; x=1757490899;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8Fac9W0WyfAOWo1532JBJfaFeza7fgTiztMVtxng74=;
        b=ByLqQsZzDCZidJF7yM7hm/UyDJXxoBqoF23jvA88UXrkJ5uiGB30o6Pn70sREAfgDm
         P9Xys3bu4jEbsQxZf1nUWczSn0Lpf38cYhB9Srf5J6RdEYiNRop1FpG1ehDZKIs7MCqE
         HKmIdB1h/pF+WthPldgQ1wDKJm0FR9Fl4e8QZ6C1ckyRilFP06zViAqYnjB87GlUhXM8
         rkv0ptdoKDXS0rT+CFa6M2cOFj6o76Cj2oHB8DA58sJb1uJ9hC2H2T9b01fRFcMqSBzI
         3Z1+i0H0tTOQGKexqJNSsC2B+TBDhB7e16WqkzWYpcyRUOTD1vxvRAyoxr4MPZt1fSX4
         cUAw==
X-Gm-Message-State: AOJu0YxbdL7CGSDXsWPA12v/9YFcTx+eQuduCSIoG039ulnHHFE+krd0
	3+5YZEMJ1rfvlPFdte2lZslnDvDpbhQefKp3zoHRLDXoeJc9dGMLuT+jYW/oDZevEcemZ3V/Mqy
	4sgM=
X-Gm-Gg: ASbGncuC2v16XIzUx87nCqT1xXIgEGYM2kVJn+siewYuSrsybmGdcbhGz/mX8frGsHs
	K4Flw7VsUfl1Nvl0riILXJLXbwSg+AUV6vUYDXSiwP8pA8h1W/geifK9YOA7Fky7UuepdtT5RC0
	+UBxkuVSQEl7vVORQfBYZRpybfkPbUKgxBvjWS+9D41V5IM4CysNV5IyFoEn/voLueMuBO8/N+9
	RwWAY3EfcPeVuVXdhUbmN21tnxb2H07n+OtcXcQ57b+IUlgVtS+W27ypBpVeku06AG+BAHcg7vs
	a0UNPYfJjuPRq3gmRLUeniQCYCij1mggsIGNtBsbD9y9W3D9+wJa/eRcV1t4HVR61YwJtskK0EP
	ENYUYl5T8nAame/lIlY2JtjU6Z7olQ8cr2q7ds45d3R/ct5WWo6qAiF8t0q0+JGq1kaSk80duqL
	omo/nRCZkPkHY1vt7YDg==
X-Google-Smtp-Source: AGHT+IGVRSeoD1SWy4Epend3lSVzSf9IlN2J/ki83n5e2qHv8f8sg0mDmQUmBW1FI7f48/1oZSCfEw==
X-Received: by 2002:a17:907:e916:b0:afe:ae6c:411c with SMTP id a640c23a62f3a-b01f2113c64mr1317974066b.64.1756886099526;
        Wed, 03 Sep 2025 00:54:59 -0700 (PDT)
Message-ID: <e2e54b68-1521-4bf6-9cb9-5703ed2a69fc@suse.com>
Date: Wed, 3 Sep 2025 09:54:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/IO-APIC: remove dead / unreachable code
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

It's not quite clear whether the two functions involved violate only rule
2.1 (dead code, not accepted so far) or even rule 2.2 (unreachable code).
I'm leaning towards the latter, hence the changes would be an active fix.

This is effectively follow-on to "x86/apic: Drop vestigial pieces (Intel
VFM cleanup)".

1: drop setup_ioapic_ids_from_mpc()
2: drop io_apic_get_unique_id()

Jan

