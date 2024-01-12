Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C480382BEAA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 11:32:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666740.1037588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOEpx-0000Zj-0C; Fri, 12 Jan 2024 10:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666740.1037588; Fri, 12 Jan 2024 10:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOEpw-0000XT-Tn; Fri, 12 Jan 2024 10:32:28 +0000
Received: by outflank-mailman (input) for mailman id 666740;
 Fri, 12 Jan 2024 10:32:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnUc=IW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rOEpv-0000XC-R5
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 10:32:27 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0c58ade-b135-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 11:32:25 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2cd7e348311so31394211fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 02:32:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p6-20020a056e0206c600b003607f777e2bsm855479ils.11.2024.01.12.02.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 02:32:25 -0800 (PST)
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
X-Inumbo-ID: e0c58ade-b135-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705055545; x=1705660345; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VaXeqnGqMfvdtweBedl2DIdxSBhilSSdX6el04mTpf8=;
        b=Gvb/CeauKbxQQt1iw5MLskYYiOIgPC0wYkkBIQB6QR4WZJd8Qf8mtGmA+nasfiZHHi
         53LD6Ev0Ooyzznz5LytrG6ygdTUhDKTvi4ajLoXWuAk1i1MRzKUvsEP56sVXUiC++iZY
         LJ6fk5BDNkpWFPe9OFDBiUcqSYypH+7Z8BO7vdFQfzpQEikfsRu5i9afxkoxN/CQ26vk
         Us4GI4V8p9gcCRFt3kXX3aBwY5XYqzu9sB3ZZa3S0vl3z05dFXVrVbB6cHU8ct87SAkD
         8Jpkf6mgAEnzK4EnWICRKovwc4Wx8DINH6cH5mEIRchrdw2Lbj7QGK35cDX/zdUFB1Bj
         JasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705055545; x=1705660345;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VaXeqnGqMfvdtweBedl2DIdxSBhilSSdX6el04mTpf8=;
        b=Dpx7avl8SqXUbDRircRmYOiUUFpw0LDw+8u9xlHEb3vv56iIxMfsW9K9bwfCZQinES
         /fbpLcP9HCdqiPRUq72LEWowvj0paE+p1FtgjBeOaCWo5wuMv0p8SAusfjG1wAibyFNU
         /iY/CDGpkEkzwh8355QT7efd8OuS2mqzYAfRv5Qn4MqNjg05XdxIKCpsIx3S/by0dNd2
         iBXwm9BderlBbw8fZtxQkwavbLxVR9+XQN2HmZqH55By6fUTKupCIzihxM9rrfeghqof
         vbhv9Qi088CWay68XKffoYf4zDGW9VvQE1e+XQuCJJ6PNccCg5eRWRkc4WQ2uZ13Qi9i
         qmzQ==
X-Gm-Message-State: AOJu0YypJFHxAiECgKa0iCqlvfDtquNndCcA5PT33B+k/zV1RYhr5q1Q
	mn+T0f1Dyyw9X9faOWOkXa8cVijOrHO2
X-Google-Smtp-Source: AGHT+IGs17TswpoUqpEzqEdkjeG9vR7txfSv+WHv/qZCNpFJUi1QIKFFsMxtCLYsbLWP1VjXW43ySw==
X-Received: by 2002:a2e:b752:0:b0:2cc:f1ea:aa6b with SMTP id k18-20020a2eb752000000b002ccf1eaaa6bmr543920ljo.78.1705055545476;
        Fri, 12 Jan 2024 02:32:25 -0800 (PST)
Message-ID: <0734779c-c3c3-452e-bb58-533492a9fc81@suse.com>
Date: Fri, 12 Jan 2024 11:32:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/vmx: Collect all emtpy VMExit cases together
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240111231323.4043461-1-andrew.cooper3@citrix.com>
 <20240111231323.4043461-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240111231323.4043461-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.01.2024 00:13, Andrew Cooper wrote:
> ... rather than having them spread out.  Explain consicely why each is empty.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



