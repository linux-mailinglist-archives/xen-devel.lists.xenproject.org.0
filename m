Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A97EC8A10D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:39:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172687.1497793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFk1-0002dW-Jg; Wed, 26 Nov 2025 13:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172687.1497793; Wed, 26 Nov 2025 13:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFk1-0002ac-Gd; Wed, 26 Nov 2025 13:39:29 +0000
Received: by outflank-mailman (input) for mailman id 1172687;
 Wed, 26 Nov 2025 13:39:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOFk0-0002aW-0Y
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:39:28 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e81f65f-cacd-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 14:39:18 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42b3720e58eso5093937f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:39:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cc231dc6esm31119274f8f.7.2025.11.26.05.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 05:39:17 -0800 (PST)
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
X-Inumbo-ID: 4e81f65f-cacd-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764164358; x=1764769158; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFGhh0/b+q0v+Dv2vW+Q5GDUrONsfRR7u+gAnyERtu4=;
        b=gukLzYn/6aLqS08gcnttml4Z24wiq/1ZtUCYE+uIXosS6HCqoRfYwfXfQCELYJrylL
         0aoblw0AmyLch3tY9OkQZIwfavYJ4fPICVm0k6E2nPceZKRuYPK0Az4ZewGAnZqQins+
         Mqn3RZHQiz+vBvSQGK+ERlmwSTOvQkNmOay1NY7NWOp84FkjOY/N4RSnWFzBwSfw51BE
         +rM77NWG9BPcr+bHSQ4uo8ft8yR6h5ltZb7tN2I6hRMvzGMcslIr1EQ4T4D9WcyYNKNy
         huMs2nlIKupk+GLYWhkpZb8zpAEdqMdjXiIob17bqmRtSucd4tsEwe74DjxYxiZqXJ4c
         HFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764164358; x=1764769158;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SFGhh0/b+q0v+Dv2vW+Q5GDUrONsfRR7u+gAnyERtu4=;
        b=nDV0REB7pRvNtj4KybsbncblMCilWqPEjX+jn356Sm0GgSPPOITfaVnvx/8blst1iO
         3L8nSPioTYIRL+HpLxke1xyM8G9/ZX6VpoySRy4s42nU4DPoQl8TMVOB6mHL9foXF3D9
         VIdHNX/VS25YJKdturVh8Vzy+9KNGS6pWGzsChmRxE0q++Nt0Q37UFO2oMENHHcyg+HC
         s6Dw6+50tG4SH1o6ZtuaSCx1MQLGAp9a5hrwXYTK/fq5iKZt//+Ya38KFsqsd5IYgWCZ
         mWJitQFD6ZVAXwRAYeJdUBhAz8TO3mQaUENMYD7GPah541cMLqzpuW7SdxIW9RmKTRn1
         ty3g==
X-Gm-Message-State: AOJu0YzvnN57fN5vHFQaLdrGu0tN3zg0k0hh0vAViy16R7lgyVjKdMh7
	+CoX7z3K7PS/llrJNM1ySYsn2vuKdh5HAjeX6Tygsyr2biCeUKFwWTcjZmbFk/IPCvu6eEPXbpr
	6y2w=
X-Gm-Gg: ASbGncuNyJJan5duj+AyirC3ciC61ynHSQqRuhMAPSpYeVad6/bcFfd3I4tvAxsQCMV
	3QEqleu3AY/O5b7s9JQPb+IqPZFgPeJK6Y5wlhHymetD7o2AsluyGQwHYHEB8dhQs1RTqxOmoIX
	a7DCr3TVdpXKL5YXiVXl7I4Tuaml7jrww+HQT/yT8ZZCmfcYYsqxRc91wCFdOoHz4Guw7itzC9q
	oY5qWqM99y9AzQjKOJQ2xSMmZVAbCE2THtTxdN4vZ6ZKH3j1h2OxijtlbobgAfkfjDNCGOUnuYa
	1t5Qpe2QrUKf5K7n7L9nQIL+I3x7Yu4LIY4R8Ttp9AwNjxl4JWVbzDkwdkl/9dyIWa6O0iygqzw
	+nfXMgBXUd6OkZTuwsuPUh94aypKldxhZCqISZ0q3Y/xkGXmWBsHbHci+hL6LT01n0pR3UmEBz3
	kRVB7ajZS5ykkHGTasKQ6Jz8ql7Oi0/iiWcyXrxZ3iFzXUbFVpfWTpKIaGr6Mj358Nm0S+eEysV
	0o=
X-Google-Smtp-Source: AGHT+IHhqApJe/lmG8RCmLBD+nVRB+PGjLG1LVOFmBXMOAy4m6hCkF9mLTQqt/9ifh9EX1pv/eWeVg==
X-Received: by 2002:a05:6000:615:b0:42b:3d5f:ebfb with SMTP id ffacd0b85a97d-42e0f34405dmr7375312f8f.27.1764164357827;
        Wed, 26 Nov 2025 05:39:17 -0800 (PST)
Message-ID: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
Date: Wed, 26 Nov 2025 14:39:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/8] symbols: mirror and then leverage recent x86 changes
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

1: arm: re-number intermediate files
2: arm: don't use symbols-dummy
3: ppc: re-number intermediate files
4: ppc: don't use symbols-dummy
5: riscv: re-number intermediate files
6: riscv: don't use symbols-dummy
7: drop symbols-dummy.c
8: check table sizes don't change between linking passes 2 and 3

As long as patch 8 is x86 only, it doesn't depend on the earlier ones.

Jan

