Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112659F774D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 09:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860871.1272849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOBxD-0006jE-Jb; Thu, 19 Dec 2024 08:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860871.1272849; Thu, 19 Dec 2024 08:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOBxD-0006hG-Gf; Thu, 19 Dec 2024 08:32:19 +0000
Received: by outflank-mailman (input) for mailman id 860871;
 Thu, 19 Dec 2024 08:32:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tOBxC-0006hA-RN
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 08:32:18 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0fb8d79-bde3-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 09:32:16 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso3310505e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 00:32:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c84840asm985818f8f.61.2024.12.19.00.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 00:32:15 -0800 (PST)
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
X-Inumbo-ID: c0fb8d79-bde3-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734597136; x=1735201936; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VCDnzvCnk8Cw0+AvSfr/bEeJ0BUJl6r1LDMdgz9q02A=;
        b=R6nNfkG+zwd7qTlpFv1cWkGDiBTM0zeVN4ELr9VKjgHRHMLitVzUK2D4KvWOgOAD0v
         SRiXR7e6Ws9Uyuy1/ZrzWJJrMbNMpTDTcZDRnA2A05OGVifk3O6uOx6ptJEzgxckNNpi
         PmE0ETZuWFzzmCQpBDcRUeGJpbWgrRhd+StSFzyvJBGutP9DjBmJSsVQ1hExtm51XZhK
         yAV/HfqIc7Xw67PXJNHXaQU5sYHZFgwWqfMgyd6t1TVsOyFRcxzzwNXX3qC5fzpIlP/c
         mlELSIH8GhCJI7Pt2HUMhriG0ccE+nQ4jIcaBKMkRE2sKpKP3qtRUoxegHPvMYwS1NAE
         MZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734597136; x=1735201936;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCDnzvCnk8Cw0+AvSfr/bEeJ0BUJl6r1LDMdgz9q02A=;
        b=eJRx4oD+ePqca7LcP8Nv1IPOmRO1ZeK0z/SNviZptsi1nfd+EOkGsWxHHtDxPL5lgr
         8HdPKnerN488KPl0ZmBHowVSje90r3Vv7BrKcYKV/caRjKnm2vDs/xU7Nx9OVNTpCUML
         07FKCUaWlwulsa5V1pk+LdKWiwhMRuIW8BlbRVKP3Y0xoKAIyHAkSAIrQb9E9WQENWT4
         9qIbYdGIJQgH28/pcc4UO0RABSelAi/A2kGMUF7EEHiueNMMFwTeTnILVsbeVVCIGHZX
         6SFn0JcrcX4bNp5N5fv/c+fVIrwxIPHmK308jpgTnRsV735nIQzSKd14a4FDEEHYrm3M
         zFtA==
X-Forwarded-Encrypted: i=1; AJvYcCUOT9buoTeF7+Y7/6lEDLwOSUmctVVWXer87noUx78Lpd91jcUcyw0bMqhXJLkfUkwjuTjHl6PDsxc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzrsj2+fuwoVIl50WjbSBeO8v4xdSmpt6JOooaKAkKjmHK/ATcW
	MI18CsuPiwEWc1pirjQPOGMQBlGs8B3K23gjLRCl6fpXxtDM5fJ43lWVc0lZAQ==
X-Gm-Gg: ASbGnctrrPAS1SEVEpj4cVzntUaBbrR6CigHJ+7NoaJYu7JBhgtjxf3d5FiIsjM5dXI
	4ItwPnHWoaltGVK5sev0fZw/zxe0s4Qz4PYP0MhaxyDcZkXNsXxNnrA/acCOCdA4zfdBMm8lVd2
	sEpVKm4E1xJN/Pxjw29tj1KKNu2edS29z5jNQw+KsdR8EakGhUmvmjAqgmzNKDdckuz+J3Rt+2p
	2IfatshNLBns8JcwKigA+BvTmr6cbBZbX2ed/FTI+XdAwj8wuvbLJ0C1/ZkaKOtKzZ5uiK+q7rI
	tD80C5b8KqKNLH+RYcBZE6VPBDvbdqc9xKkxNSAVpQ==
X-Google-Smtp-Source: AGHT+IF8Y7DizhDr559L8TfXVQpLUmGFnq4E+QGHys2eH6hMkW5tFzczCO4XUM44YYPEqlB6QJsVLg==
X-Received: by 2002:a5d:588b:0:b0:385:f195:27f with SMTP id ffacd0b85a97d-38a19adee81mr2395669f8f.5.1734597136268;
        Thu, 19 Dec 2024 00:32:16 -0800 (PST)
Message-ID: <7587b503-b2ca-4476-8dc9-e9683d4ca5f0@suse.com>
Date: Thu, 19 Dec 2024 09:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] xen/common: Remove dead code
To: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241218233659.573195-2-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241218233659.573195-3-Ariel.Otilibili-Anieli@eurecom.fr>
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
In-Reply-To: <20241218233659.573195-3-Ariel.Otilibili-Anieli@eurecom.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2024 00:34, Ariel Otilibili wrote:
> The if-statement tests `res` is non-zero; meaning the case zero is never reached.
> 
> Coverity-ID: 1055253
> Fixes: e2b1ebf4de ("x86: Support booting a bzImage format domain 0 kernel.")
> Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>

I certainly agree with the change, especially if Coverity complains about it.
In fact I'd expect Eclair to complain too, for this being unreachable or dead
code (I'm never sure which one's which in their nomenclature). The Misra
violation addressed may therefore want mentioning, too.

However, the commit referenced says "xen/common/inflate.c is taken unmodified
from Linux v2.6.28." Therefore the preferred approach would be to correct the
original first, then pull in that patch to our tree. (And yes, the code is
still as was even in 6.13-rc3.)

Jan

