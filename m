Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CCBAF150F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 14:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030994.1404661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwIh-0007YH-D5; Wed, 02 Jul 2025 12:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030994.1404661; Wed, 02 Jul 2025 12:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwIh-0007W5-AA; Wed, 02 Jul 2025 12:10:55 +0000
Received: by outflank-mailman (input) for mailman id 1030994;
 Wed, 02 Jul 2025 12:10:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWwIf-0007Vz-AW
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:10:53 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 988cec08-573d-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 14:10:51 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so46257955e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 05:10:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af56e8b00sm14367419b3a.143.2025.07.02.05.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 05:10:50 -0700 (PDT)
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
X-Inumbo-ID: 988cec08-573d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751458251; x=1752063051; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PbE554ZyoJxCF4Kt4rDM08ARYTbW+vpP1lliBK1TCig=;
        b=AKaGEg6Dgx7zEMF5fxXAr4Yts5HTOyTizr1TZeq4l1OUrz4HhDznVOMXNBCGaqKZug
         gCm3frVqbYyI3RuCptnWlNQY5O+iGEro4ih9bGDzuIjqLA5IRVJN+xrm2FCC4Pvh/+4U
         D4k8nuP+UGNLzXhlEJ3E65asuhRs1tdGRIGU7cR6GWllnaATeaF1D6Y3Z/b0KiCPc+PH
         OyVhNp3fXmkF5I4ZU6sK7MToU1az/yWCtbqqa3aJLOiMa7valbXiw+KZo5VBSZlokHBo
         Hoz1fyaRhj8OQSmvEYnq16aQUFCcLh8jbsCj1qNrA1haq6WtW0TQkb3fI9CNV4viNHMv
         romw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458251; x=1752063051;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PbE554ZyoJxCF4Kt4rDM08ARYTbW+vpP1lliBK1TCig=;
        b=QiPq+I0COypqHyiCtTr4HaAJxvHgiqkiQ9L36KKeguMa7/N/Um+XVw1iCKALJq9BCq
         DqI9J7EdZG5OYF+uExFKM7xmVpy+1a0DVlxYDSorMV78mox+Z+5Wd5Al8QZzALN/Tz/9
         BiSIMFerazEkRydeQOE4eKdB6z+91mznrTEIINoSw8FHr+K3PgTuvX+oxkVjVthk9blI
         iPmrE+G93jiE6wDHXbs9ZKbAyZbBJUIHj/uxrxT0wiIvS1Km5BiPc3Y+Dn++GSAj5Y+S
         b8Dfc9vYuK1oNfAbVAVK/Q5X4f7ehxZ1KORR22C3aPgeJEfyXzao+e/ntCCRxA7iGqhX
         eMKA==
X-Gm-Message-State: AOJu0Yx/SuPmftjbWf5f/qyH+uCZim6cBnCU8drwad8iW1LHZoeFrGcR
	Y18HRtHsMcr6mfLwO5PKaGDRD3VA5duOThq3cvBR42XHtRx7m0MYJiFVQejSpM1nyyH5gLdGNpI
	wiZM=
X-Gm-Gg: ASbGncsx7QwMongcpKeqowdFE7IjG9tFvByrQkf+IgvdVMIoL/+nTI0T7NI2+O+wpmm
	PLZmCB7pU9leNOKuiPLdY2DSB9rhhewtVVSaiXZF+Abr1DoyZxkXeSnP1jpsfiAnBpgFoPiYMNI
	EqR4rR+gQK5lnCQJG0U5n/Y9ZzbKlcnB0+KxAtUwLBx2XANWi/mPl0gZb2NLlDfwuvimgnyDpl1
	yj4krCtp6JF9dAmBRmaN6UvFz5dnZ8ZCViS0Uezpe/0cnuz9cWzudF0ejzSUWT1s1cMq0HgNeiP
	YxlzYbhqMX8jz8aBSUrL7HxU0oOgfxsCu6sGsbkzX/4nzQwE8VjILnuiLCTp36nL+gW1mOcxsQY
	KCXWIL1vt9drOH3l/fNU2vmP+B94Mi0wQfquJ+gZ8cOczDrE=
X-Google-Smtp-Source: AGHT+IEgOKWchSW9k4HddIU6ciRvSiWfY6F2afg8Ae45FTPXOxS8kz7jR8xi6G3o5yd7GLgbh7lZJQ==
X-Received: by 2002:a05:6000:64f:b0:3ab:27f9:e52 with SMTP id ffacd0b85a97d-3b201203956mr1853787f8f.42.1751458250710;
        Wed, 02 Jul 2025 05:10:50 -0700 (PDT)
Message-ID: <0b57c6f0-9fd0-4f8a-93f8-dc494a1e952c@suse.com>
Date: Wed, 2 Jul 2025 14:10:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7 0/7] x86: memcpy() / memset() (non-)ERMS flavors plus
 fallout
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

While the performance varies quite a bit on older (pre-ERMS) and newer
(ERMS) hardware, so far we've been going with just a single flavor of
these two functions, and oddly enough with ones not consistent with one
another. Using plain memcpy() / memset() on MMIO (video frame buffer)
is generally okay, but the ERMS variant of memcpy() turned out to
regress (boot) performance in a way easily visible to the human eye
(meanwhile addressed by using ioremap_wc() there).

1: x86: suppress ERMS for internal use when MISC_ENABLE.FAST_STRING is clear
2: x86/alternatives: serialize after (self-)modifying code
3: x86: re-work memset()
4: x86: re-work memcpy()
5: x86: control memset() and memcpy() inlining
6: x86: introduce "hot" and "cold" page clearing functions
7: mm: allow page scrubbing routine(s) to be arch controlled

Jan

