Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7A1973A11
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795689.1205132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so20m-0001Ay-Jf; Tue, 10 Sep 2024 14:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795689.1205132; Tue, 10 Sep 2024 14:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so20m-00019V-GT; Tue, 10 Sep 2024 14:38:32 +0000
Received: by outflank-mailman (input) for mailman id 795689;
 Tue, 10 Sep 2024 14:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so20k-00019P-PO
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:38:30 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58ddbfd0-6f82-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 16:38:30 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d3cde1103so441196166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:38:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d40064sm491697866b.190.2024.09.10.07.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:38:29 -0700 (PDT)
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
X-Inumbo-ID: 58ddbfd0-6f82-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725979109; x=1726583909; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYYBJOcFMrMJp2+1FbLH+3FpFYlnxuR7TQRWZgQR3G4=;
        b=RPqZuY/qI87SNjoMx11IEWAEAaFFnnqja/3YwGoPjo/3G+bGgrGbAKzws2Pw68Sksc
         vMLhUTVBZ6eCTL8IstgMVXOoaP0HgRUn9rC9PDjbnjWBEvmZ3Ipp3aPLTa6i9v+K1rB8
         hsghaRMGmsaWlikSPoPojfx0uWJTcmeIbz6ttE27DrJFIYQn/SjiDAcOrU6EJGvIORhn
         ZQGocIXQyDM7nD7yMEqF52kVE9uzZFJtfSIuoxW/KGybH7hqAut3y31xcco+JJe53is9
         IVfZEogceNfFcih2yunhbtYucV9hTC0KUBziFy1SI9U1l43sSLIR/jqYqyqGZi4P/7FP
         bJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979109; x=1726583909;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fYYBJOcFMrMJp2+1FbLH+3FpFYlnxuR7TQRWZgQR3G4=;
        b=EELHaLVdk9Ho+a8S3BK0hZXDB2zJF6iGLE81+U6e5nIC56XO2Y6xJrl6MmYwVv6lM7
         WvaZGMb14GsfwUd3uCM1iiJK+sXy9jMIyAmHDgCIjN+2kxunyyTuymudJeoXa3CmwUzZ
         uGo/69+tUr2wjDhZbQt0DS6+zUIMJ0xAXj0SOo7ZbvgpSgjYxec7KEemBjAZQYxi8Q3T
         a27esgaG4Bd1WV6M86NsJNKyPwgTWsPjlWt8qCfhYXLVntbN13mMamjPBp92p/vmuyeu
         UmbJFQL/wrmuOYig9kxXcWGDW3UnxtDoD4EuB0sxVzUEi2OVbaucAMB0NsRas+rRk63x
         v37Q==
X-Gm-Message-State: AOJu0YzXdMlcb1ns7nXpHs5YZDWEuJt/dQ36f6go+akoWu4urdyY1HAN
	mbr69TyZS5mT48qbdRaQ7UBBTrApTbWUNRcA7ZlDvk+fQ0lsAvckenTTKd8JF82uMizReSHwTVg
	=
X-Google-Smtp-Source: AGHT+IFr1dwXFc79imdEocLZtzi3hrBa3FPW51OzYmvp31kSHi9x+FI6EvztIoPb6a36dfIIm4jV7A==
X-Received: by 2002:a17:907:6d0c:b0:a86:a6ee:7dad with SMTP id a640c23a62f3a-a8ffadf2d21mr114776166b.52.1725979109223;
        Tue, 10 Sep 2024 07:38:29 -0700 (PDT)
Message-ID: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
Date: Tue, 10 Sep 2024 16:38:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/7] x86/HVM: drop stdvga caching mode
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

1: drop stdvga's "cache" struct member
2: drop stdvga's "stdvga" struct member
3: remove unused MMIO handling code
4: drop stdvga's "gr[]" struct member
5: drop stdvga's "sr[]" struct member
6: drop stdvga's "{g,s}r_index" struct members
7: drop stdvga's "vram_page[]" struct member

Of course all of these could be folded into a single patch, but I think
going piecemeal makes more clear that the individual parts are indeed
unused.

Jan

