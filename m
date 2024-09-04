Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9704F96BC07
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 14:26:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790184.1199881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slp5P-0004Gx-Ko; Wed, 04 Sep 2024 12:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790184.1199881; Wed, 04 Sep 2024 12:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slp5P-0004Ee-ID; Wed, 04 Sep 2024 12:26:11 +0000
Received: by outflank-mailman (input) for mailman id 790184;
 Wed, 04 Sep 2024 12:26:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slp5N-0004EY-Qm
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 12:26:09 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc83a453-6ab8-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 14:26:08 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a86984e035aso803272166b.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 05:26:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196980sm800995166b.126.2024.09.04.05.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 05:26:06 -0700 (PDT)
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
X-Inumbo-ID: dc83a453-6ab8-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725452767; x=1726057567; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+T0ArKwNRk3kPlpt3Te6PBBOSa8QNAotp7xHuyiwqZA=;
        b=PDDo7D3mLAf0XyqnHBct9k7WOOe124RCg8GkDRN9typ7t9kx5v7Zh+tLPH5jtpTk34
         4bCe9lz26lTAT1dH0BJBu2PqrTOnIruXdZqykrZjxNvnjGlZ4sdystKX9VA0VemLkCw9
         tsXYBMp7X7tMlsDoK/uyIABBQ072PjqD5cdgculNeR9bRZLOW4sa3PYnbs1x7wAJe134
         ltErz2+6mVMJ7wSzutjlIhFHDJtMkEyML+rDlJFBjsQnpJmMpgXS/8JuO+BWB+Iagrp0
         1Q+TUwNgS+JD/D8U33HWjilCDZu6EuPska2CfstGbaceMC8ft8Zp/TkOAdZ4tM+zp7Hj
         bOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725452767; x=1726057567;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+T0ArKwNRk3kPlpt3Te6PBBOSa8QNAotp7xHuyiwqZA=;
        b=NlFVRAd7Wu96+Zngl/J+5n2lavpnNWY9us37usNbXFC+9ykI+hq/0gCv7SVODFo5ia
         L+ZSoO4gWH4bVfjJcz4TVL5ZM/h+YXmElkAtYxDKJWXIHR4UXh72YPp17XeEsKyEfLDo
         qhQl02nawEgBOjzhVwTKaxMojSE56mVvogbGQfRCDASgf9zohKkhwWmt4i5fVrfVJEW5
         SFZQx4aNZb56t1q40bzq6LwAwrUidU+owOLQBv4l0Gy5gtihuoMvFAsUjdNDnsS6FGnv
         va6Pz90Zie54yxSdZpJwCUYA4MUYSGt9RkwsMb1A5vqwHf7oDM68R496va1OB8eAzYhh
         uiWg==
X-Gm-Message-State: AOJu0Ywf4b6EEDSyUyuyOtAbg/3DWmORK2fmC9IZ5VlUYqjx/sn5hklU
	YmiRwyehQa6Ykg3tB6I7EV4PundITfmeNYK83IKC+pOE+yH76leDN9jDUh/HxMoA9qmNpG5qGR8
	=
X-Google-Smtp-Source: AGHT+IHMos8LajsLQAt8pnc0vN/QGfKYOzxToaiIMR6N6GltqQggR/8Dirtj7pZh82ar8M3bsx5Pgg==
X-Received: by 2002:a17:907:9723:b0:a86:88f7:679c with SMTP id a640c23a62f3a-a89a37a7ff3mr1046773966b.41.1725452767178;
        Wed, 04 Sep 2024 05:26:07 -0700 (PDT)
Message-ID: <0b9a0ae8-a39c-49d8-b4e7-f2a463128058@suse.com>
Date: Wed, 4 Sep 2024 14:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 0/7] x86emul: misc additions
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
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

1: x86emul: support LKGS
2: x86emul: support CMPccXADD
3: x86emul+VMX: support {RD,WR}MSRLIST
4: x86: introduce x86_seg_sys
5: x86emul: support USER_MSR instructions
6: x86/cpu-policy: re-arrange no-VMX logic
7: VMX: support USER_MSR

Jan

