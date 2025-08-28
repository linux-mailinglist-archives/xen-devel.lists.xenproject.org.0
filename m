Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 845D6B39D5A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098693.1452685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urboL-00089z-5g; Thu, 28 Aug 2025 12:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098693.1452685; Thu, 28 Aug 2025 12:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urboL-00086p-2M; Thu, 28 Aug 2025 12:33:01 +0000
Received: by outflank-mailman (input) for mailman id 1098693;
 Thu, 28 Aug 2025 12:33:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urboK-00086j-4h
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:33:00 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 210f8c1c-840b-11f0-9491-8750323bac66;
 Thu, 28 Aug 2025 14:32:59 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-61c325a4d18so1472476a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 05:32:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cb77ec864sm3170381a12.37.2025.08.28.05.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 05:32:57 -0700 (PDT)
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
X-Inumbo-ID: 210f8c1c-840b-11f0-9491-8750323bac66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756384378; x=1756989178; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vqpQLK0KXFsen3u58tnxuWjnhzKAl1RM+ZSnXpY3+7o=;
        b=MjBBSqT9xOeAjMBtqxcBrtwCT+9wiwkKdg2SiPb9XXJa2jQNsNzWO1RXWfFnVWlGaj
         hjzwCvK/cOYkyhkIU+KNGjVv35WT5nUQ72LVKlbSNciTezZoasgwDzZo8doq1zc1dlGp
         T5N5FzndqZpx/nmo9XCWhnkQmIGgfpoh7pNuuzB0E5Vsy2ad3oSzJ2ULsKwnl25CDF8U
         8NkvCAl5Rhq8RRgZs2L2EbRnggP0RkLN7At8+OqiY8p8lfjz4zOKrTpf5qa1NTk2+kxb
         Xblh4jhP1tlgcMr4odvWBPZSzKyJFRiVnzLdSd5WdoeB/JYGELtqAkQE6rAz0NOt5E4O
         QFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756384378; x=1756989178;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqpQLK0KXFsen3u58tnxuWjnhzKAl1RM+ZSnXpY3+7o=;
        b=plo9Rw3OB86KW3Fklyhtq353HfMCAvpSAXs41GVrxsLT4C7DF5refSZlyOhTVulm0j
         0BI6iQcnzDbFjqqouG4rbeUGCCU8BBH1BWDEB4bqInr0WPZlVmvvIYssr8HmaTN4JJ+8
         0p8qWatmGYlUC2tHarTMfGSoy1AVOkOhwCkcsTxT3ypgxBUIZY+3o75lWVF6k17orfAi
         35pNAF1YgqamKBOVNrUdWSN+1PuzybDamdTGLt+bhpijxWojFaf2plWtW1UnbOxm1x4a
         nL/pvHJ37LT/2NaE9AOyekSzUysO+5NGQiVtwd3+10wySjGgE/ecnf6e/PmKspJ7FwfZ
         dWYw==
X-Forwarded-Encrypted: i=1; AJvYcCX5XcaKFnsDto9xJ1V+wBZ/aBubdPvb8ttnZfaDTmeIbCsz9DpBDLuugMH25Q3/AsOARA3eRwn28i0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHufLPvvFQhOBhlo4+6t1mzf5Dbo5L9TjaVKbeM/en1qs4QicM
	F+4Zk7nyQZ+Axybgc8HPIJGt2/j7i7X8qrLGcC6E0Ao4zrjVikfyah5ucCc3mbZR8Q==
X-Gm-Gg: ASbGncv190lqhivGp/L88Bt3vtvuhCplcCqkapTjiLiTZei9CsyVwc5wXiyB8/5fiwu
	S3tcSlUihkolxFl4+FMQow9PoyxlwazhYTcKqwcxrsju9LiaAI0jLs/CfG4HMrN66rYt+1XvM5g
	QKgfEp9QAhN6k/Vl8WSfq58sLcZ4oq32tIACRq3HWGJyFnTlr1HQmXuPmfIy19mk7H3/kIE3BSC
	QjR14upIp8Z49ayEZCnacrTe6xGpQXp//+sF+sFdyi86X+vHatUWGMA0VLc4Xsd50h1QVe4+9UL
	sWkVhM9l28/2wVh8jYSt5P0R6Rkird7aqqQaq0/ACuDO2xnPEfhs3rRfnv4k5+rJPv5U3dqqurq
	yemfyY8yhaK03m4JVH2ENFzEfxAkBdGE1yehUl0wh+vnINpxLjZZXbqEZVPOXqOagjwcs16jwm6
	o0lq/vWEAnlX5mxlbyGA==
X-Google-Smtp-Source: AGHT+IF8t+njEW28EbojKSCWJ6XRIIGGTM05NZVz4ZayJs+svhSEYxn88F0A7ySqAEz+P/CT9v3Tow==
X-Received: by 2002:a05:6402:26d3:b0:61c:7f7e:1e with SMTP id 4fb4d7f45d1cf-61c7f7e2182mr9985022a12.22.1756384377815;
        Thu, 28 Aug 2025 05:32:57 -0700 (PDT)
Message-ID: <2fcdb264-15a3-47f7-915d-83d1c1e06765@suse.com>
Date: Thu, 28 Aug 2025 14:32:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/9] docs/x86: Introduce FastABI
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1755785258.git.teddy.astie@vates.tech>
 <64800d22220f31bf052713ce61ecedeaa8a36b6f.1755785258.git.teddy.astie@vates.tech>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <64800d22220f31bf052713ce61ecedeaa8a36b6f.1755785258.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2025 17:25, Teddy Astie wrote:
> FastABI is a alternative ABI designed with performance and coco-enabled
> guest in mind. It is register-oriented instead of refering to C structures
> in the guest memory (through a virtual memory pointer).
> 
> It only focuses on kernel-side hypercalls, it doesn't aim to provide toolstack
> operations.

And even there it excludes certain pretty relevant ones, like many of the
gnttabop sub-ops. As alluded to by a reply to an earlier patch, I don't
think having an ABI for just a subset of the hypercalls is going to help.

Jan

