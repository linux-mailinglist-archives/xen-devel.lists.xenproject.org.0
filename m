Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B53BA2725A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:01:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881389.1291523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIY3-0003qL-4B; Tue, 04 Feb 2025 13:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881389.1291523; Tue, 04 Feb 2025 13:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIY3-0003os-1W; Tue, 04 Feb 2025 13:01:03 +0000
Received: by outflank-mailman (input) for mailman id 881389;
 Tue, 04 Feb 2025 13:01:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfIY1-0003om-Ka
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:01:01 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14870ce4-e2f8-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 14:00:59 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5dc75f98188so8880223a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 05:00:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc723e9fe4sm9401048a12.26.2025.02.04.05.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 05:00:58 -0800 (PST)
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
X-Inumbo-ID: 14870ce4-e2f8-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738674059; x=1739278859; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gsy5DCvacKA69LfaxtwMNyCk8gVwNAaiXVgI6mqYLt0=;
        b=Sp9Z0C2si24fffPEuIXfZyEkHE02V3pWi6V2oo1v0gByGCJA6X1UFCjNErG/xqe7kq
         P3rDDgtaAI1R/w8sSoVnllT3M1yUnISpRqzED9y2t60HFRq00xoXJhBqZmyztWs7Pg/Q
         PntzyGnRwAbBsjYF823pef7frJBZaZsXscP2OclOQ6ezzV5MpSEdh6Ak5OJDkPraal+C
         X9wN40CUmwEWNE/R3ugdZycLcikzMJIHEnsQ6r1TPtvPijYpzEyrM+S8MT7dUT7klZVB
         UOoDwgLsS8amAh9Use3mlVnNMCmlldOANJUQYmfmoMtNfDVRnrK7G9nc5l+1yS0+qx8t
         59gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738674059; x=1739278859;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gsy5DCvacKA69LfaxtwMNyCk8gVwNAaiXVgI6mqYLt0=;
        b=nrZ/U32JGc5qebuBZZ9IwxDE0ftdSfNOUuTd3gAjXQZURJdapd6weMG/nbU7SKetD5
         lZCkRzij4slT4DSFKSWfjvooyrYx8vr1atm8VXyZSsM0FgU3Q0rObta+03Jwjd6Ejjdd
         hMQYsqv8bHyytm4hyGpmZpX/Rs9PCE3xwVvZLc4ryEidHd6Qd0YQBMJzwIxnyKMIiSA5
         P+rwWD0zrYCtX5JU1H2KumEFx3X4LUF17l0HFNnl/ssHKNHNzbIMOJKCEfyGqZReA2YO
         aoKRadfE8xlQQakc50qCvalmotUG/LcVeNrlIfZocEWB76noZqO2OFMm1rtcnUMM6lMd
         kfCQ==
X-Gm-Message-State: AOJu0Yw0FH2F3Ol72YX7AG3EBm5qZJOjE1SAMcR9J+GXAA7hw1H9HXiL
	SdmrZxVj3ggX24ElNxMfu3ZECx3cLAuRtpr+XJjZDWKhx+QGb/uuucmiqW0QYtBpI61d0ueXnf4
	=
X-Gm-Gg: ASbGncu04F/1KaHkt5jWpHeGB4igqj3bex4uHItOSE2JrcG83LpdD4wWdcC6P6dAaQQ
	AQ5RO5EghbtIyxF2TdW5fq1VmxanqPUxeX/8NCe9n5aZ+UQF5W0kWEYQS8+slWvwlN2wDer3PzT
	DA71Xe/3JqMhbQvO4MGYkHuLj+S7W97wFQB+2cmhXJmVCK5b4EkjSZtRIqXocH3Et5f+6dB5ghm
	vW5RctE5EvR9pEWLspitRdEjpbvgdpxVOJ0P7oFc0EMoOauAGYZByFN+ZjdlY9QQG9iFJTl/OwW
	LSJKXkwWYFlnHbG7Qot2fElicEbk9MJkFVH8kj+hdLkEfUKnwRY4usEiLzURbOm6L01wiqa5GJ/
	8
X-Google-Smtp-Source: AGHT+IGObIPqo+qZ5I3PMKMRUD+4xkQ6wPaoHKuQPmgTtVNKiuKse0UsxO06CW5QT41OuCGTPWXhpg==
X-Received: by 2002:a05:6402:1d4a:b0:5d9:fbb5:9ee with SMTP id 4fb4d7f45d1cf-5dc5efc05f9mr28356976a12.13.1738674059071;
        Tue, 04 Feb 2025 05:00:59 -0800 (PST)
Message-ID: <0a006732-2b6e-46f0-a706-f432abd45d2c@suse.com>
Date: Tue, 4 Feb 2025 14:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 for-4.20 0/4] AMD/IOMMU: assorted corrections (leftover)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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

What previously was the main bug fix in this series was dropped for v3. It
turns out what is now patch 2 is sufficient to address the issue, while
doing the requested tidying. The latter two patches are for 4.21 only, with
the final one being up for debate altogether.

1: radix-tree: purge node allocation override hooks
2: radix-tree: introduce RADIX_TREE{,_INIT}()
3: radix-tree: drop "root" parameters from radix_tree_node_{alloc,free}()
4: PCI: drop pci_segments_init()

Jan

