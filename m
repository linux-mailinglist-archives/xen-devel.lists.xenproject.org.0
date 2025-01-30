Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAB4A22C4A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 12:11:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879468.1289673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdSRq-0003Lb-Hq; Thu, 30 Jan 2025 11:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879468.1289673; Thu, 30 Jan 2025 11:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdSRq-0003JN-FJ; Thu, 30 Jan 2025 11:11:02 +0000
Received: by outflank-mailman (input) for mailman id 879468;
 Thu, 30 Jan 2025 11:11:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdSRo-0003JH-9g
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 11:11:00 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1d0a5b7-defa-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 12:10:58 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso548920f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 03:10:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a314casm101767166b.127.2025.01.30.03.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 03:10:57 -0800 (PST)
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
X-Inumbo-ID: e1d0a5b7-defa-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738235458; x=1738840258; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OM4H9pDpv5LRHGy5Rqwia44600X1pQwXwqcypJCuXM=;
        b=LPxde9yW3jPI37uOeDPDIekICR5BsgFBN1+6LZItAwpeIV/8k9lQ/F5oTMIjIT5iFQ
         SUVJXbkLQFlkYkuR4xwvYq89CX0QC1ZSoPus3kSXr0XLRLOO83QvEN6qkRcfWDpiLoCl
         qx0laVaT4P02rs1/K7FCtaPSkQQUFyfzQNDfqVSczuw7SQZHIO7EJKALPWi1Q19AWEcv
         eND1aYKX/+q6aMjyTFfHzcTkjxnzlZoPYsNrIAsGKx27FkI2lvLE6IEY08W/X+2IFVTE
         AeIy/vEDxyLsHg2q8HZN8/Yn+X7jXCGhZb94uHhtIje7ZF5y8JGfDqq4POdIS3DL8RWx
         kvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235458; x=1738840258;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OM4H9pDpv5LRHGy5Rqwia44600X1pQwXwqcypJCuXM=;
        b=elAVo02rXpk0bFKJrCzhLw+oUhNRJVRvYJv/Hbz7UKEPF6OYHaTQY4MOnbbFh7QxJk
         dE0t/mLNFwEqc4mDvxizEE9F6LbRvEzgvnP2eSpfVl1JS+zqWtFJ0eQYk38/pJpzU5M7
         0Nz5YyJBl+LVxEr1enzvl4IzYRovouko8x0vHUi9LNig8Hb4dPNtddKaIOEKjgjavvcZ
         DG4m0d4wI+P2A1fwmVPUTvXRRIq4cC6KhOr51DVJzhJs0FZGvokamcLA1Q2eRzKf7do6
         0O34biCG6G9BnrpcZkyq8nrc6z1a+E4SE7E4mNZz9hKjXT+YK4kGtIa9Rh3w+ude/MR9
         kfkg==
X-Gm-Message-State: AOJu0Yxat6WyPWsJYbHVbVF3EybCZkcQsWbaNe/puqfmPQv2Sw+Gi6oW
	KQfYdQfIuBJ8/GXhYdgcUMvppdISYxy52ieiDf7sEsCawIv3AmENUs/Xa5/eI7TYD+Ys47nFbW8
	=
X-Gm-Gg: ASbGncseN02td5nwQW+kXBwNps8kCJwcoTgF4Hah/C8XBLWPPNwVjJwjxWPxIPDQZLB
	wli3jqLaHZdsI7PizMJLVLMIXhOo25YBtc1PJYVUcp691TJvwmF7gH6lBI4K0YwRv+Z+pLBbZOb
	8xseOFLV1ohOa8lOtk/mT/zJF6FYlLuBr8T8pZY43oly29Zq//61qOEy57vBvhSAHVSrsAZq5uz
	5q5vjglu5vS9p85QbMCnD8YyEiXS+y+LlECJIJpuJCPvGiToHf/JFwYD7Grob+ACzQtYn67WTKw
	1Dilj8IOvWyTD7yWUlolBlv60zw/VswoJlWkkI/vOSvbWXmSDLq77sJJ/yK9rLtqUXLC5NvDgNN
	6
X-Google-Smtp-Source: AGHT+IFCG5tD7yUrr26NxGcMatlETXNcnqLZJagxnU9S24I1BDBG3Pc42/YZNqX5jA0RGOJ/kedTAw==
X-Received: by 2002:a5d:5256:0:b0:386:3a8e:64bd with SMTP id ffacd0b85a97d-38c51952738mr5274559f8f.22.1738235457830;
        Thu, 30 Jan 2025 03:10:57 -0800 (PST)
Message-ID: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
Date: Thu, 30 Jan 2025 12:10:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.20 0/3] AMD/IOMMU: assorted corrections
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

The three patches are functionally independent, and they're presented
here merely in the order I came to notice the respective issues. At least
patch 2 wants seriously considering for 4.20.

1: AMD/IOMMU: drop stray MSI enabling
2: x86/PCI: init segments earlier
3: AMD/IOMMU: log IVHD contents

Jan

