Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE127AD5234
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 12:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011468.1389907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPItQ-0000wX-Ri; Wed, 11 Jun 2025 10:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011468.1389907; Wed, 11 Jun 2025 10:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPItQ-0000uh-Od; Wed, 11 Jun 2025 10:41:16 +0000
Received: by outflank-mailman (input) for mailman id 1011468;
 Wed, 11 Jun 2025 10:41:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPItO-0000ua-VN
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 10:41:14 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 981a8309-46b0-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 12:41:13 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so5442042f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 03:41:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313b1ff0fa8sm1121075a91.8.2025.06.11.03.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 03:41:11 -0700 (PDT)
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
X-Inumbo-ID: 981a8309-46b0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749638472; x=1750243272; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Zp59246u7VED9/39h653MalXJ1qhbfd3vUTR07xLHE=;
        b=UQF32LQuzsrcQacAjb3idLwwj83rdagYHRsjs5BvmnFcBwdlrkGbMJ902hXzG9iSHf
         sWzqZKUt3wIvGbNWuqPSCMDKmQlxVBUNH9jC1T4yFI8gsooi0dg04ecmsvy/nplJDPxN
         pB4005APb7HcWMWypAiG1bKnNVb1ZVny+7wDoGUwQgEDa8kDSchy0/TUsJzjDNG7k+0w
         5zoYO34Bc3QfKlEthdBKlqh23lgtZQe9i5W3jb+9kDmLIlVzqX+Q+I4RBYyImpYCvqY3
         JLsniRpbE/iBanP46WUSR8HBz+4/jb164kbXa/fQ/1gK0RR0axFSw8oWlM7EQJFZCqLq
         ZZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749638472; x=1750243272;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Zp59246u7VED9/39h653MalXJ1qhbfd3vUTR07xLHE=;
        b=Er+ZdTYeFrfOPs037D7CFgu6jfQusLiMsQ1BgM8N284YTChL0O60VX+k+ZhmCCkbdw
         +i89DCeTAkYFERBJssvGoYhMx73g5BKSUmJFOsfv+nBGQKc/QPZvPUkuAoZ2n/s7bu9e
         AENojHoYskfBEG2Hyk2Myb9T6xScsXd2s6HNs6bNeIpKJkVal4UjV45ramgtNE6ZMM8u
         qtVBk9BDngWQh32fdsCfFg3XriBQkrWVMf4j7EBFXt7kSloxRzd6uf9wemQy/GwnTmhJ
         ufQQ6GzuKkHM/i2UepoERqdetR0JNWkykiZwMvg/Gf5Zkh8cfj7TPylnBVKZCbHUkf7L
         Kqyg==
X-Gm-Message-State: AOJu0Ywknu0eyaDC4+RjAhgnir/cLnbplcGfVlQQ5xifbVu9E78tZTx3
	b7GHl79rw7nNlqz3ab6/aA/ko5g9MZg62Qx5tqbGMv72ITCc5V24tsH9jxUJ0U9rV1zqHKnFlgF
	sFvo=
X-Gm-Gg: ASbGnct0P9lg6egu8e4XG/V38dCxKUakvwmOBbd9Edt5iY/91huEYCWhtCZbrxPePCw
	owW6XW22z1YYT9GfGeZNvwGMqaxoKukJJdQZLaIBsW50yWGc2deJthtWQEiYzgrk6DV+C4/AGvA
	QoCxtEMujdl/EFMBXz3HwE6dJ4sWceDKuafVUVmgqEqJCCW2TNYQ612gmKVqOYO5+Eg9qqjkGuI
	u3Zm8LTkgNejneIYEO2qnLARIgPJKi+7OvNGbC+bZsz+T58gvskrAzBT1D0gKC5MZKpTMI6/VUp
	tVlAsQg57ZH8zeTXPrUKVH8CYOimcqlu6OkBSXyOvsTeJ2T2p5MkgC7p5q3XXnZ68bOHolufbCr
	tsBgDdivt5RGQxS2mte8Q2zETl95DwqX2+xJ5Z8vFbw16TD8=
X-Google-Smtp-Source: AGHT+IGp7woQ7a0DCmWxDOq4u2nr1j0qjfQqXzpExG9MovyDJhi5ynenoiywyOxkyr1976HYXsN8+A==
X-Received: by 2002:a05:6000:288b:b0:3a5:2fb2:35ac with SMTP id ffacd0b85a97d-3a5586dbb1amr2137946f8f.24.1749638472453;
        Wed, 11 Jun 2025 03:41:12 -0700 (PDT)
Message-ID: <44d67587-415e-4ec1-a433-64a12aea80d7@suse.com>
Date: Wed, 11 Jun 2025 12:41:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/6] vVMX: VMX insn handling
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

Originally, while dealing with some other patch, I merely noticed the
issue addressed by patch 2. That quickly grew then, though.

1: use reg_read()
2: adjust reg_read() for 32-bit guests
3: adjust reg_write() for 32-bit guests
4: prefer hvm_long_mode_active() in decode_vmx_inst()
5: operand size in decode_vmx_inst()
6: address size in decode_vmx_inst()

Jan

