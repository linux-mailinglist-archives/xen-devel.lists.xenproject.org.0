Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BC6A25FCF
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:23:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880779.1290860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezDp-0004g9-HB; Mon, 03 Feb 2025 16:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880779.1290860; Mon, 03 Feb 2025 16:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezDp-0004dw-Ec; Mon, 03 Feb 2025 16:22:53 +0000
Received: by outflank-mailman (input) for mailman id 880779;
 Mon, 03 Feb 2025 16:22:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tezDo-0004dq-4M
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:22:52 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d27c7a3-e24b-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 17:22:51 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5dca468c5e4so2494765a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:22:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a7de5sm784588366b.35.2025.02.03.08.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:22:50 -0800 (PST)
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
X-Inumbo-ID: 1d27c7a3-e24b-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738599771; x=1739204571; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I1CHrN62NN3tnZAv/W+lYAL9hCy01DQc8ZgkHGp3DLg=;
        b=KVFL+CDGuX5WJw6mcPmMTIlqQwfeJ5lbzdtrO+Ck0DGCFZR/2MSCZdg5dzcbTiPvFx
         e7/2YQ5aI7fhY2f4/SUdqEVsx53hfVE0c1k62EMDs6hUOc2A1GwnCrGtJo0V6Jqaidi+
         unab5dr1yynQRMxv87+wxgcf81OzynFtsFHe1Z4LwsSWsD0SjGrzxK6W2AtpV45GshiV
         kdbZdOO1vBBnxoTNefL0GfmHhh1HSuZylWiWmeB1ekg7DlpP+F5UP78MWYg3qQ748PzX
         0Gi8Vdr83MWmA7m3pok3NAKON+H+++c3Zh+dbRkYal2mF76npeYX9zm3ZAuZsgeeQN3R
         uHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738599771; x=1739204571;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I1CHrN62NN3tnZAv/W+lYAL9hCy01DQc8ZgkHGp3DLg=;
        b=ESNW2eu7sEuPhiGfMzgR3O6Ozr9dtkLSsyoIS9Engzdt4vmXk7yp+ER1T+/amZ842G
         45aKRKjgsUYol8bUdIsJXQOftLwyA2ZXKqL9V1sJSZ6m5/xjPA6XbekRvUQhnfTSTyqI
         XPoTBR+01M082WQLEA30cW0S4xTXRFuUT0WFReeSfTmnir9Nkg/UyKPlIP9RlnRwPPJ5
         3nSXFMCrgIchXybN7R/6KxhyKkncqoY+3xsdLsySLoLDUVpBMczexv+D3pTYOfrdDpfj
         xwOVPwou4o4vcGUEJzLTLMnjGhLCWzC3XJMMCRXHDc/6iriER6io4ZK1wwFoKE5+cGc9
         fyUg==
X-Gm-Message-State: AOJu0Ywn3xGeYyEwHvbLTDibIRZXkEzdPnnsHRuriKUI+I1kMvfn/Wx7
	CGWBCzMZXFa+7Y7mFS5iBp1hijE1j7gOBcAZIMql/Vkh6YtkshK5+jCz5cyUyPeP+eAouyI2QeU
	=
X-Gm-Gg: ASbGnctahwzER2oh3mCu0D01jIww2Wv6S01jhp/llj2wQtmX06VZL4m8ajcmt1PQBtO
	kjSTGOsiwbHZ0epm7mv4/8i7uAnTTT7lmAb9IvuVSiqlds7qizz8mzkix+aJoy5nDhU4hjRvcYe
	RcV17syRvf2bXygP7kwd6i/SDpyGDcMnDx9s+KLlUO78ucjRD8KPwybJz4r1Zu8+/xQ607GcbpE
	KdhKcfZqgroK5DLl2IGmWsKRmb0zmDCbYmlDajOetUkoQvCCNLod7eq4uGt7XqIn45F2HrJudAh
	4pJSxL/mRBrOKv2hncS9ipZlpG52qfFNRoc6FaMrOKmZRld/1/YYpqNhKkCVK+XyOc3lz6QmoNi
	D
X-Google-Smtp-Source: AGHT+IGC01/Z+gLIvxkPERvFP0z0HAvHtrEzJRfHFtrqFkwln7akOKNz9ffbRuuCv3NM4SUbz8z6pQ==
X-Received: by 2002:a17:906:6a24:b0:ab6:4fa6:71e2 with SMTP id a640c23a62f3a-ab6cfccb88cmr2570807566b.22.1738599770713;
        Mon, 03 Feb 2025 08:22:50 -0800 (PST)
Message-ID: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
Date: Mon, 3 Feb 2025 17:22:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.20 0/6] AMD/IOMMU: assorted corrections
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

The first two patches are functionally independent, and they're presented
here merely in the order I came to notice the respective issues. At least
patch 2 wants seriously considering for 4.20.

While alternatives were considered for patch 2, it's left as it was in v1
for now. The disposition there depends on (a) the four new patches, in
particular what the last patch does and (b) backporting considerations
(we probably don't want to backport any of the radix tree tidying).

1: AMD/IOMMU: drop stray MSI enabling
2: x86/PCI: init segments earlier
3: radix-tree: purge node allocation override hooks
4: radix-tree: drop "root" parameters from radix_tree_node_{alloc,free}()
5: radix-tree: introduce RADIX_TREE{,_INIT}()
6: PCI: drop pci_segments_init()

Jan

