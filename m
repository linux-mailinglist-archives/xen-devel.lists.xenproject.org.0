Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D504497520E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796506.1206116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMQm-0003vo-7C; Wed, 11 Sep 2024 12:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796506.1206116; Wed, 11 Sep 2024 12:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMQm-0003tJ-35; Wed, 11 Sep 2024 12:26:44 +0000
Received: by outflank-mailman (input) for mailman id 796506;
 Wed, 11 Sep 2024 12:26:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soMQl-0003oB-5S
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:26:43 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 195aed42-7039-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 14:26:41 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8d2b24b7a8so166599866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:26:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d259f56f6sm597240766b.81.2024.09.11.05.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 05:26:40 -0700 (PDT)
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
X-Inumbo-ID: 195aed42-7039-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726057601; x=1726662401; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v+p9Lxdh/itkdnFscH/au8OHh7KO/SENlm0RiOLzSKM=;
        b=BFQyZrEcHs4B9TZTEoZZ0Jhd6nB8b03X13WFdj1nEzTzcO4LU0tKCMRQXPHu1n1XMl
         wlB4uAf1e9DdLv6foi2DFJ90unumOdPD9ZYsFWYOVht/4I1MmHVemOuu5xdXgtJqgfXw
         mt5ktG4Ks8iXz7HcbfVD/fWy/dHMHq6Dknk/wApJsuK2Bu6OfjMwblD8JIJg98JpElzz
         7fb9Ltbe0CrazRZiPY1aumMPCxyVznvlvwdZ6t9BWJ2blAkMzLAsCnpxsOgizs5e5zGB
         PQIts/6IpKDYxFdQkajgOCEarCshahzGaKzcCgwDzPZnFBzRJOdlFJl0+md0XsPKEv15
         Nmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726057601; x=1726662401;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v+p9Lxdh/itkdnFscH/au8OHh7KO/SENlm0RiOLzSKM=;
        b=xRgpnOqku34WILVPLulzCFUcfvNd1O4ctfhWmQxY2XH7r2JeydcZnMBVE3WahKv0Om
         0GCOlcpnw17XEkMgWWIaRYMuc+jJnl4V6n0xNe4gHD4c+vH2SckSeWSyHQ+eKz5zgnyJ
         dW8TVjJl0XvtjHKpz+F3g5xvkJFrzPQrKRGvkDEHUHGk23wn2IpdRSR80TkOWWSu1FB7
         zrhe9xvfyvQj2IoWEjOF/gOxWaWojnR6+FtZ+2cCQDByvunxtQUhlGBEBLzieThqA1zJ
         jZ02TiwKTGnedlFfJrkrGpNsdmHBMuaAxNpOWv19c80uWE3CsqDLEU5h2gh7bGD93K2H
         mYAQ==
X-Gm-Message-State: AOJu0YyvZsdDbvmxi6CwX0T/gnXGqpDDkECZpObdWDzV71xNKQHPnseF
	5EkVqJAg0xfec0P/9ME/ivW5ope5QsTCUJXFNOYcCA4MAQoUtb3tHGsYxoqv0V4zPcj+aMaNEk4
	=
X-Google-Smtp-Source: AGHT+IGR2X5KaLG3BUpmmYkng1++4MrZbswmD2+Iz0og8HxD02yi1Fq78LJicv8soTY8L44tiF7jFg==
X-Received: by 2002:a17:907:972a:b0:a72:7a71:7f4f with SMTP id a640c23a62f3a-a8ffb1b644emr386425566b.7.1726057600767;
        Wed, 11 Sep 2024 05:26:40 -0700 (PDT)
Message-ID: <dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com>
Date: Wed, 11 Sep 2024 14:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/9] x86/HVM: drop stdvga caching mode
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Language: en-US
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

It's been unused for nearly 9 years. By the end of the series stdvga.c's
sole purpose will be to make sure VRAM writes use the bufio ioreq path.

1: properly reject "indirect" VRAM writes
2: drop stdvga's "stdvga" struct member
3: remove unused MMIO handling code
4: drop stdvga's "gr[]" struct member
5: drop stdvga's "sr[]" struct member
6: drop stdvga's "{g,s}r_index" struct members
7: drop stdvga's "vram_page[]" struct member
8: drop stdvga's "lock" struct member
9: drop .complete hook for intercept handling

Jan

