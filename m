Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD5E813147
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 14:20:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654569.1021604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDldN-0004lk-7o; Thu, 14 Dec 2023 13:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654569.1021604; Thu, 14 Dec 2023 13:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDldN-0004if-4u; Thu, 14 Dec 2023 13:20:13 +0000
Received: by outflank-mailman (input) for mailman id 654569;
 Thu, 14 Dec 2023 13:20:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDldM-0004iW-DA
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 13:20:12 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 818b64bc-9a83-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 14:20:10 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a22fb5f71d9so121979066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 05:20:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ld4-20020a1709079c0400b00a1df88cc7c0sm9251893ejc.182.2023.12.14.05.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 05:20:09 -0800 (PST)
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
X-Inumbo-ID: 818b64bc-9a83-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702560009; x=1703164809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=miiwjMSAR/4BwalvAv/FwIicIF//rDW3MRsMW2tbB7g=;
        b=RUtKBcZBo/M3rdST5KMqNkpPkYsBEl1xY1fDtABuGw7KVnKiMtA6HpgWiTIwNmaeNk
         HaW8mjRA4RahJjtZku3PMiNX1/wbFLUl+2kzvDyje6bB+HClK511SJvItD1hUUoYLFCI
         O2TvYdjAhUq66qglmLxN2UpkiGLy8QZ9Kgrhd0vEv7MH3hUyk5kRr/0H+Vs1Cmmhww3t
         0T6BRSLTkckpp/OsTGgg6f2tHN1ciGkDbdt/QWtAoYvJWEeQ4ctWBOAAmIT5CEGIWzzV
         slBHpsuTiQRkkDFRE/ifu2sWH/OR0TekcykzwCvMCYqRHM5BUGMgE9FBmojM2nC3sMoO
         MR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702560009; x=1703164809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=miiwjMSAR/4BwalvAv/FwIicIF//rDW3MRsMW2tbB7g=;
        b=pmJgiiQsv2/g6sBldMW2utm6TtpLXOh/jfOVaec2+kUeqUrPIqbTeY6ux6Vu5QtyoV
         A7lBirwZcJAyJpFpABqwUKXYfV4TBmJacI8gaKT40iuWSWXQnksOKEGaLgVyHupT8hZs
         8TrTQc6Sd5Cv0nD56nd1qIAx3MCc71lYsY6tjbElr8CLGTzVAmaoDgPuUelOL9nrmEVt
         hrQnbT8QkVxhP464gCFfIUgozz/uj67uuDXAVcuKxT4q0TdQ1fZyCPr/mtn6cfV/go9I
         Zv4xN0R0WMpFSJiv50RxmwpxNQ/vgd1c2Z2N/aDTbQHWOdx7/4Aut0KJ6TXETqtCXShz
         XWjQ==
X-Gm-Message-State: AOJu0Yy/gBjMdKuFrC86ednoKjeQY7S7OiJsm9IzbIy/CTOBOQ7alqL5
	mSGiz/fqRwWnfTsbytMIFIWb
X-Google-Smtp-Source: AGHT+IGxphF/I9uOoudKMSfWlcVw6WWitUNJACvkyPvQ0fJxUGtA98SwmJpU6c0yTf/nqJ+JRCKKow==
X-Received: by 2002:a17:907:94d5:b0:a1e:6e3d:14ef with SMTP id dn21-20020a17090794d500b00a1e6e3d14efmr12125378ejc.60.1702560009675;
        Thu, 14 Dec 2023 05:20:09 -0800 (PST)
Message-ID: <19793b3b-60c3-47d1-9a40-914e7e0c47fd@suse.com>
Date: Thu, 14 Dec 2023 14:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/39] xen/riscv: add public arch-riscv.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <fc7bb0a821ce58ef908ed0282b6678d19269ffc1.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <fc7bb0a821ce58ef908ed0282b6678d19269ffc1.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

If this is enough for the time being, so be it:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

