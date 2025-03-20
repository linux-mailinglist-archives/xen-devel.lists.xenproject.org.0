Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AF0A6A304
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 10:53:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921565.1325378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvCaV-0006Mb-0W; Thu, 20 Mar 2025 09:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921565.1325378; Thu, 20 Mar 2025 09:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvCaU-0006Ke-TR; Thu, 20 Mar 2025 09:53:18 +0000
Received: by outflank-mailman (input) for mailman id 921565;
 Thu, 20 Mar 2025 09:53:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvCaU-0006KW-16
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 09:53:18 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24b23177-0571-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 10:53:15 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso4665085e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 02:53:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f855efsm43034455e9.34.2025.03.20.02.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 02:53:14 -0700 (PDT)
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
X-Inumbo-ID: 24b23177-0571-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742464395; x=1743069195; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M87pZ4SbcAKBO3wgeuet/ypAWi8WtEbcnAiE9lruV2M=;
        b=Yp0Ux0lR9taxxh347F5ZBKhGoiDeBbahdzDtJ28naEjlP8yfqwb+uJTxdN572iFTWx
         OD22/hzD9XKWgf0bUaZBZkYaFL7ei4691GMqCwLDkdwMR6wkBcABQoLFwQdYMyt9QLYh
         /1Lj5GVbFK1r3YHLF1lmJJOlOmYMd9MaM3s4uwJBMKevs4dN0wQ1GyC5FtQZ/vNfa6K+
         m56UbqYmAyeZNgYrmWrpnw+q5VP9jn3d7VAH/i0eOsJt0Ft5/iWVpB8qNZb8wOUaeB2S
         LRQ8yxLQC7G00F3NpRUCeBY0wrlYq7Qi5mWZFwneP/tLpf5/Ydzog5PnkpknbG/tZhdo
         WEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742464395; x=1743069195;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M87pZ4SbcAKBO3wgeuet/ypAWi8WtEbcnAiE9lruV2M=;
        b=QhiTXuarvMtGm+vKNIDDsturYGFTH7312iKrNDrohK+wY7Saw9PuUzVHNHRSXYWXq7
         +wI+baLoAXxBQlgRyVjzCwy46ffeYH2PS7x8XWd+I26NM9xgcne9aKifcJZY8zPli2Lo
         6M3pZnfU/fEIVarjhjQJ/ys8bMOMATV+Nzey+ViVXO+R+o3SmbjZXjVGibqqn5jVFoUh
         zAuen81DduTDdNvXyflLsyHSBuFK11J/XPuUbCgYNYFJhKvznfypkkQRVCnkIL/X0Jbn
         7NQxLxw2t24woS5r9qHALmq0ZVCowxumftRBDkNMNUBQxsGymNk1pBSOUpapeNWwKNIC
         vExA==
X-Forwarded-Encrypted: i=1; AJvYcCVR2rXQV/KllDmPGF9GP/E2wxtF+J65R5YvWIl8+LUwfvcvy2Vb3cFJVYze+fe3KiYrLHLaRXPQzlQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybF+t2dSqsRM4tq0wiiD1mlUVY83c9eNNOgIuofPAnO5r1pYTo
	KOCdYt4i5pDdT4+40M0ru8Ou/DZ0LCL8AWcjjbD7Y+xbN426qOC+sgJ/jGZUAQ==
X-Gm-Gg: ASbGncv1o2KL3Hn/LvZxavwlEH635XP5joIT80miNSLhu/jJJtB4usU5dwlR6Rv/M8L
	j27n/ljuSWPugWk4mRiWN6vF1ooAEWCp1lKQyXnEb+OB8G6MMJhtFyowFlBJ96XS0jPf8ynp970
	43iDw90NUHPFOFwHtJAlCmL8C7yhuGOQLtQJzkfINzDi6+Wcu3UrdKB61R9omFIYwIJHg6i+a1Z
	iyDso7qyLIIJQi/lhltOl0da81w/51SvfSvfy2hsgSkX5K2RAXe0U/Xtl3DTGrIigr8GQ+DZb/H
	qRfRq8akFSoUA/3IVeqm8YRR9pNGz4coDP7vd0M79W8QuG9CsyMvMikMZ2CNfSRAt1Y5cIXZQiJ
	uaGG9qCoqjxd+aPx1sGBDb98V9OiYzw==
X-Google-Smtp-Source: AGHT+IG6NvHWVaCkaJD3dQYAjgrgI1/MVvghGsibVOi3d4Iuc9bSGqfYEfNhie6pTQTEI5DAcYjFvg==
X-Received: by 2002:a05:600c:3d85:b0:43c:fbe2:df3c with SMTP id 5b1f17b1804b1-43d438842aemr49287015e9.26.1742464394813;
        Thu, 20 Mar 2025 02:53:14 -0700 (PDT)
Message-ID: <3bec51cf-e3db-4f1b-ac24-4686e2498fde@suse.com>
Date: Thu, 20 Mar 2025 10:53:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] x86/mkreloc: remove warning about relocations to RO
 section
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-6-roger.pau@citrix.com>
 <a3c70637-b354-40f4-9a67-9d2aa7bcdcb0@suse.com>
 <27ebf169-ab63-4def-a98b-751ae1758293@suse.com>
 <Z9vOc5I828aV49rI@macbook.local>
 <0da7c7dd-bfbc-4e41-98ed-6e98793e6f50@suse.com>
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
In-Reply-To: <0da7c7dd-bfbc-4e41-98ed-6e98793e6f50@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2025 09:34, Jan Beulich wrote:
> On 20.03.2025 09:14, Roger Pau Monné wrote:
>> I wonder how this worked then, as I've tested with the xen.efi smoke
>> test in gitlab CI.  Maybe ovmf doesn't acknowledge the RX sections and
>> unconditionally sets all mappings as writable?
> 
> Possible. And that would be in line with the mode being call "physical mode":
> There are no permissions to enforce there. It just so happens that x86-64
> requires paging to be enabled to be able to run 64-bit code.
> 
> My experience with OVMF has been that it's hard to find where certain code
> lives. Perhaps I should try whether I can find respective code there. Then
> again if I find nothing, there wouldn't be any guarantee that I merely didn't
> spot the right place.

All I can find is BaseTools/Source/C/Common/BasePeCoff.c:PeCoffLoaderLoadImage(),
which doesn't look to care about section flags at all. (By implication this
would mean they needlessly load all the .debug_* sections as well. Then again we
need to be glad they ignore the discard flag, or else .reloc wouldn't be loaded
either.)

Jan

