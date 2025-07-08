Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DA4AFCB0F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 14:56:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036428.1408660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7rk-0002n0-QA; Tue, 08 Jul 2025 12:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036428.1408660; Tue, 08 Jul 2025 12:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7rk-0002kk-MN; Tue, 08 Jul 2025 12:56:08 +0000
Received: by outflank-mailman (input) for mailman id 1036428;
 Tue, 08 Jul 2025 12:56:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ7rj-0002X5-FW
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 12:56:07 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9a9cae3-5bfa-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 14:56:07 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ab112dea41so2344319f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 05:56:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee62dd5fsm11639524a12.55.2025.07.08.05.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 05:56:05 -0700 (PDT)
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
X-Inumbo-ID: e9a9cae3-5bfa-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751979366; x=1752584166; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6G5EgqLRhorAkPOjN/kq3i0gWdx0DcxFFzLLorZMYA=;
        b=KB5a+VZGyxSx4yN2Xpd11miUUVVIUYqAoop2A7eX/iTgvUeyzyAdcIT/c1eECPOtMu
         ZflOCrxMQzeTs3K3B0wqQbXh+VnCxomnZDajP54ECHU3sVw4dyf1ecWN9L60faa1Fe9/
         6A817T/tJszYK8QGw/8qqoZT1kAB8uyXZJT9dxZMSpHOj19q4HX8qDskLf7hxPCdgH7T
         QAs483DDY6ciX6ClpCxB22CGsUxqycORpQMAAw7QPfUUcgsFfLcRkIYpYGygEDRupXeE
         6+P73j5J9ibdEbiTD1mA2QEi6iZLK/i/DeQajoeIX4HvNeTLRIK/xZ9sZubkilYZWzel
         bwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979366; x=1752584166;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6G5EgqLRhorAkPOjN/kq3i0gWdx0DcxFFzLLorZMYA=;
        b=rjFkx8B3xMZCsQdXx1NCVN7aeQubeCW6yPkXWhCcDHZk3MxE/7V5tyd4WC9DR5ocHC
         XudtCyE+z6AzHE1UEgVq/4uHmJNdLZR7DhFaNFCRBJBiv3M2ZdPWB4Sjpfq9W6A5XVOk
         DUzh4NAF83Cm58xBX5HvsASmfQgjUskpkD1+FSqzOYySOXrLrFzqIfqqLqpg9YyDDgN2
         8vsiQx9utAqcVEl2lcXze4V84/N7S0902SnJQgvJBus5qvBefiO4gr7VGbfKyh4r3WNW
         m8RGaHPxwJXl83wRPIVr8VArB6bIVXCo7Hx0Y529vNE4W7XNSKCh36z/2QDMY4H+CLM7
         rSaQ==
X-Gm-Message-State: AOJu0Yx6m453pcXiO7Fe3DNB8o+Od6j6dq9tP6HK7PQi1sG/i3tRHKBj
	v+eO7Rk/MxdOHjkCvBkxyqCwEvumxMsHx/oMPO9gPe95gqzdKY1AwGx2iSRzVHUX6kACOFmM0WH
	6ZNo=
X-Gm-Gg: ASbGncuT3ijcifGwHzwEsTu4EjTXwcztVn1bRyRunXlpNLErCtWU2EGAgVjqF4U42AD
	tOfo65BAA0HzICnSuF1njR6l1VpcIiyv7OhgH8cmftZTs2riGmxsxAB8PoFpQ6Qe5RsNQzQY1xE
	D+6Z/K4YkTrqqcUAobftwo1BEC3CpvWiEVcAEMD+HOz4EAebwp5mtn4jWu7WJ+56eip6e93gjdX
	OQVejEvmbkA23vxXFXjy0xw874otKph8hlY485mImtGXNSCXTlZz6CqhXTI3rbdq5/mV9w9oIev
	Z5G5CtLuKWbVUzRpgwDGYgO55j5pxyIU27lM5TMGZlDh6WpaIKYaTzsM7Y5U2Jmb/UOKF3p2yXd
	3T6d6AyUxi9sEN8Jyny3AVeI1H92tFf+PuT3k/r12QhDUAKQ=
X-Google-Smtp-Source: AGHT+IHPcKupaCaLH4dgLtMLpYpjVzLLWSbXdnZ7HInI7A9uwxfgghxXQesj0ayGRalPdkwShaV9JA==
X-Received: by 2002:a5d:5e88:0:b0:3a4:e672:deef with SMTP id ffacd0b85a97d-3b5dde8ca19mr2814245f8f.36.1751979366352;
        Tue, 08 Jul 2025 05:56:06 -0700 (PDT)
Message-ID: <1df49875-99b8-4302-aed7-5a75dbdd85ca@suse.com>
Date: Tue, 8 Jul 2025 14:55:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/9] x86/mwait-idle: (mainly) imports from Linux
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

... with the exception of patch 1, which first tidies a few places. (As it
turns out, we've been lagging quite significantly.)

1: adjust section annotations
2: Add AlderLake-N support
3: add Emerald Rapids Xeon support
4: Add Meteorlake support
5: add Grand Ridge SoC support
6: add Sierra Forest SoC support
7: add Granite Rapids Xeon support
8: add Granite Rapids Xeon D support
9: add Clearwater Forest SoC support

Jan

