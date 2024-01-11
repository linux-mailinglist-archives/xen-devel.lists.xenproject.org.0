Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F22082B087
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 15:24:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666310.1036852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvxh-0001yM-N9; Thu, 11 Jan 2024 14:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666310.1036852; Thu, 11 Jan 2024 14:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvxh-0001rJ-Jf; Thu, 11 Jan 2024 14:23:13 +0000
Received: by outflank-mailman (input) for mailman id 666310;
 Thu, 11 Jan 2024 14:23:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNvxg-0001oP-RF
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 14:23:12 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2d0acac-b08c-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 15:23:11 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ccae380df2so58182081fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 06:23:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bs7-20020a056e02240700b003608f3db11esm316791ilb.75.2024.01.11.06.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 06:23:10 -0800 (PST)
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
X-Inumbo-ID: f2d0acac-b08c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704982990; x=1705587790; darn=lists.xenproject.org;
        h=content-transfer-encoding:to:autocrypt:subject:from:cc
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7tUZ7Sksvkb2jjagshoBjH/zpcIAWheLeIEL0LxqkM=;
        b=EMDs3OrGlPuOo+IESSwTmAN1epuVDlFhBbguR0vEJioE9AHRzVlRN+HGSBLNdTpwze
         ABaWNY73/x02JXPSWxTK32tT4pSH0k3hr95NUN5c0Ih2i3Pgu6THwnj2l9WVLirWABH2
         Vav1wwzngCJzNzDjZdk9XehxBTSuzV0qCe6eb2J89PwndW2uHy3KwD6QiQMY9nvXaqpe
         RgW3p3H3J5a9Msf89vKTqrIaR5ha80Y7S4eTN1nENeo7rNEIQJmDx9KnZGTdxf5T1oTw
         VTnxudA8bPETF0+ubmq3k3lKKpH8YhFlLKrd8Akexm36K7AiHA0YvbGmUPWI73nBrUuD
         OEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704982990; x=1705587790;
        h=content-transfer-encoding:to:autocrypt:subject:from:cc
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y7tUZ7Sksvkb2jjagshoBjH/zpcIAWheLeIEL0LxqkM=;
        b=PeKAZvHp7zl8RUG2y/ZeLAuu3VPrcJZVojfRNaV9ebemgJMuYVaOJBtI2QArGmtE4o
         kLd4yVGy2yTcfG96NKxc+w7r3OTCzQiwjihc5iiK7kHBlnY69ove72lyT52fACVJUEay
         qA1XwFalkZVHrahoeLU8j95AeCP9znY5cIOUMK1xiKJ3RcpSzGlK1wwPYuS5eQplkRs5
         VQ0PyMOQADwAMCDAMjjJJvrkV3MbpUketJmT5GRpiYRAkT4REnmQsIv6MQl8AtFuDMIA
         bN4SsbWBs4+rh/kv7sSJW/C6Y07hilkx2F6pOlw5ZMJQXoFZ/nGKpMOd90Dyo0tPE4ZQ
         Zt4Q==
X-Gm-Message-State: AOJu0YzdVJkGzlvRt/DB/IiS6dxGPjUaS4as7aRIs04wTuWH5cXUHR6B
	IHG5A0jr0+K0zS/ssjEEHfgksO+LuMKVyQL1dMyPcNB9GA==
X-Google-Smtp-Source: AGHT+IGv0zGI8nwohnA7RMVGp4vya4QDaW8xuxC3NNfmmnuHi/QDFD4qAEoiexIxzfTA74L0gf7AFA==
X-Received: by 2002:a2e:6e0c:0:b0:2cd:8c46:d06a with SMTP id j12-20020a2e6e0c000000b002cd8c46d06amr401570ljc.86.1704982990692;
        Thu, 11 Jan 2024 06:23:10 -0800 (PST)
Message-ID: <774ece90-296a-4975-a31f-038de45e98bc@suse.com>
Date: Thu, 11 Jan 2024 15:23:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/3] x86/CPUID: leaf pruning
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
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

These three related patches were previously part of the AMX series,
which has been stuck for about 3 years. For AVX10 some of this is
going to be needed too, though, hence I'm now refreshing these
separately. Neither of the three is strictly a functional prereq,
but two of the three introduce new functions which then are further
altered while adding AVX10 (and AMX) logic. Hence until it is clear
that one or more of these are strictly not needed / wanted (in this
or another form), having these ahead of the actual work is
preferable over accidentally losing adjustments done for AVX10 / AMX
(and down the road perhaps others).

1: adjust extended leaves out of range clearing
2: shrink max_{,sub}leaf fields according to actual leaf contents
3: move bounding of max_{,sub}leaf fields to library code

Jan

