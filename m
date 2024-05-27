Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBBA8D022A
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 15:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730777.1135974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBakM-000183-Ih; Mon, 27 May 2024 13:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730777.1135974; Mon, 27 May 2024 13:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBakM-00015E-FE; Mon, 27 May 2024 13:50:42 +0000
Received: by outflank-mailman (input) for mailman id 730777;
 Mon, 27 May 2024 13:50:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBakL-000158-D1
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 13:50:41 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a9d48cd-1c30-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 15:50:40 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5785f861868so3480151a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 06:50:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-579da710ef2sm838401a12.44.2024.05.27.06.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 06:50:39 -0700 (PDT)
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
X-Inumbo-ID: 1a9d48cd-1c30-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716817840; x=1717422640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VtX0VWMZK1Ppi59ELfJ3+RZ4NX9NlUvrgou+sSJ+07Q=;
        b=JlRNsCF7II8x0Cgx9VJ4to18bQT3QHoID70nHtYCupLw7sYfQIj0pUjcvvZGis/O9b
         gFQajuPTznSuQokMQImuph4GsEg0/2HdNrcgSf1Zjz49ANFjv5ROb0d/WWwg9CSiNT72
         ffp9R6mc9xyuD8HjA9qOFmP244nE7zSkfzCnU6igdYzbYG27JQOZOMJxj5fLqSFGfEra
         32/zcRC++BF9efEWR/MEuRMiii+LOWhZ6FTKOutycuiX8i9D3faj+KbPEG/Ka43MNhjA
         Se2zekfXcygBpTfXLUOTHWQ/btNYZl7FLxjwQshs3L1E6ATKpigUQ3oJ3mmG0zalzEwn
         zncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716817840; x=1717422640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VtX0VWMZK1Ppi59ELfJ3+RZ4NX9NlUvrgou+sSJ+07Q=;
        b=e0adjQ39kT/Y5F5dAnEPSJmOguWcB2evxY6AVnlHp2/6CpBVckDatC6uJ2pdFHYDeJ
         e3Na8lhNvG3gInP8y5R7WZ/N7LYeaiGwBlSkJVyXi+CWJLi0VAu/QrQ6TBN5XnpUrqnv
         NcBU+KQlfkAZrho4ks90JxemISDNRwDJl5RjD+b57z6W6BYrlYACqI6NuGXpe4uWWYxz
         HZHNxuUl8aF4zEGbjkkCDvrMw6GHFFW94eZRrnNSmc6SQoXU2I8gWSwpFwW8KOAGvorB
         ytQCclWmPfMOpzPbLxBpQCD/hjHZCk0C/3vcy4NFo+iJ2gncjw+1OVCTi5kgQJRTLzZw
         PvqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLUzEPIMHY5XrgGOquawZ5zOemuo12udLVg93Oti2v7jIQanL7w5/ZR6McR86HCnFeDLrlexc/CezPb2ATpYdu7eZd79/k6EllE7ql7Ig=
X-Gm-Message-State: AOJu0Yx+Ys2iQZ8aB3rGxP5a36V6GJRsGMvx3wVP+KW0DQZYYbs43RD2
	K+1+jkBNsp6ZYV2w5e9aPNe5BogPkB7kj3e4Tav2dcEOqGjLaLgkF9BiIJuIrg==
X-Google-Smtp-Source: AGHT+IH/I9bNBnD2Hfc0Imhbdsgpo03bBo+OOKaleZk4sIOyiZSZZYJexDApaWK5ZuQWyAUSJQbnXQ==
X-Received: by 2002:a50:a41d:0:b0:578:e1fd:1978 with SMTP id 4fb4d7f45d1cf-578e1fd1c52mr4091833a12.39.1716817839891;
        Mon, 27 May 2024 06:50:39 -0700 (PDT)
Message-ID: <d3d3f01c-5bee-4684-883f-a25a3bb734f6@suse.com>
Date: Mon, 27 May 2024 15:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] xen/bitops: Rearrange the top of xen/bitops.h
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-14-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240524200338.1232391-14-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2024 22:03, Andrew Cooper wrote:
> The #include <asm/bitops.h> can move to the top of the file now now that
> generic_f?s() have been untangled.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



