Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FFEA6A292
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 10:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921519.1325338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvCBM-0006fz-AJ; Thu, 20 Mar 2025 09:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921519.1325338; Thu, 20 Mar 2025 09:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvCBM-0006ds-7E; Thu, 20 Mar 2025 09:27:20 +0000
Received: by outflank-mailman (input) for mailman id 921519;
 Thu, 20 Mar 2025 09:27:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvCBK-0006dm-JM
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 09:27:18 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83579041-056d-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 10:27:16 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso249639f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 02:27:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318af0sm23333663f8f.73.2025.03.20.02.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 02:27:15 -0700 (PDT)
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
X-Inumbo-ID: 83579041-056d-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742462836; x=1743067636; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8AMsHBAclsHj9q1bohgg1i5ETIgom7sk+KCnDHZOS4=;
        b=aD4Poqg0cmitycuQ+eMMU0r/F7ZCA62jrmQe6v4o7qfnOknC3HUjZEwhQURI6BG+0V
         S5tjJE/lfxPTu2FM6xeP6Wly8DF+DRSYGJGd1KNy1WFtjwMSt8byE3nhH8tr+mEgJutk
         xGzGCaj9KFBtNDt2nhK0OxO6/naxqc9EH+aqIekJthc2Rleghx7MguAMObv3M26F2cwD
         5IP6yJrYHXq22wN23IU/Xe9VQFLSZKzaTQD3UEMfTjtEFHG9AnyzuxUJ31tbtQpUu5/x
         PG/RS5qUf5/8y7rOPqx6QIrgezeNd8//TuKL5q5sM1AAqdnt/XM6vm9wxSGuXtdPozfs
         Ni2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742462836; x=1743067636;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X8AMsHBAclsHj9q1bohgg1i5ETIgom7sk+KCnDHZOS4=;
        b=hDYAXMpS6iH006hrhAedEpHi1Av4CMkl0MMRzeR6i+uIGMSFm4WNxTPpmhBViZsoGH
         TJ80mBg6JInmlP8ZeIb8fsWUrFx6n5SAT88jiEzcqFlaHEI0H4pRKkks68N8JHpDdJKq
         jEWAx8DbU5IBsrK9J3S5b/wmrXAPhOVd3GxPDXwwBsCWeZlcdVGt5RH5rqAQ3X49yia6
         l38miCvJdJw2NpqCs57i2HGxKiEGCupZNdoWelpbWHKwJGzlP/ifWyJqeIvw3Tm+UtYD
         5Zp+WP1TicwV53CwtiamiIDFK2UM27w5Ma0MQDUlEdWoTnQJ5I6Vmkq5lHAXfb5kBux/
         WdmQ==
X-Gm-Message-State: AOJu0Yx6VeRN6chEc30J8ozI55cLKuDJON7FjHyAQdWTcTbKbY0SBXpP
	oorjJ59GrEPn2SUlg5M97rxaQoUcTZpF1qbTV8hVkaG1dpcuxNl6Tu0CLtRwNo0nu8lBOy9Orlc
	=
X-Gm-Gg: ASbGncsYxkPe4qsenCRmyajWCPOBBNereUyYnCJaHNMjHDEYLsP2SmjL17C5HBgzIgz
	fckotabcUjidIvBlApa6zxBfkMnuUFwO16fCGbwo24wpaaB1UPUPQxe4EMrqPftNqwTaTlOVdy9
	yk57kIoTkm9f+u4+Zmqyc0ScYyERjJBrPJtarFEaYP7O3t0QfKsebgmKDYcPKqy6ulnHOxgHr4N
	cyfKHh+KsiWou3WIYVlbVBhkkub7CsSCLqmbCAvOkW+tmcnFCkr7Ym4UefhMfo4+Bm7MkF3+zRs
	ixSTnG46XjupPt2rco6MIE2+KRI3r68QazyCiV2Xsx1gDe5RsUgzpRf4xVoje+FEkconRvYHIko
	+GPxvBQHA541GpTgQeOohX8Enn30r8w==
X-Google-Smtp-Source: AGHT+IEF24/R7z78JjQyynOehBHw6S0m11IKGprZw+zmO/LPLaehesPAFvC9WMOGUyGL3tpNwEE5mA==
X-Received: by 2002:a05:6000:1549:b0:391:31f2:b99e with SMTP id ffacd0b85a97d-399739b4089mr4965937f8f.2.1742462835667;
        Thu, 20 Mar 2025 02:27:15 -0700 (PDT)
Message-ID: <577ddc98-fdbb-48af-9c7e-1a411383516b@suse.com>
Date: Thu, 20 Mar 2025 10:27:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] x86/PVH: initial space allocation
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

Going on top of "x86/boot: Simplify the expression for extra allocation
space", first some tidying and then a bug fix.

1: don't open-code elf_round_up()
2: account for module command line length

Jan

