Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0F5890010
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 14:22:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698929.1091190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rppi5-0001Vj-J5; Thu, 28 Mar 2024 13:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698929.1091190; Thu, 28 Mar 2024 13:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rppi5-0001T0-FK; Thu, 28 Mar 2024 13:22:25 +0000
Received: by outflank-mailman (input) for mailman id 698929;
 Thu, 28 Mar 2024 13:22:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFXD=LC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rppi3-0001Su-B3
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 13:22:23 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34f5fb64-ed06-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 14:22:21 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56c1364ff79so1123810a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 06:22:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d18-20020a170906305200b00a46a2779475sm747994ejd.101.2024.03.28.06.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 06:22:20 -0700 (PDT)
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
X-Inumbo-ID: 34f5fb64-ed06-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711632141; x=1712236941; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3ES/YD6KLu7umQJrMk0Fjm4b3SlVOCp1O4DLrxkmg8=;
        b=ar090khskYyWgUgKgsPEWv+DnDffprLCtbGPlbUeF8aW/O4RhFa+ffuJHFIRoc1UyE
         22UsjI6ppE+9C9B1375fBTG6ExnflZEmxQeCoCtmuvYux2M4/ish4NbFhUF6gOEAlW5N
         ZS2fmERrfhnv9vwlgxVmytPN2+BPk6rXkTqsVFtu85ljMtUhCwnOhJT+okSKbcauqHxW
         j74c4RK+bTJfCiJe04Gzae3h44T9BafrtFbCEpVEAccWsnK48LglOf7zUXMemmqFwUA9
         aGLylwcNZ/F2cxBv8w6GRVM9ZkRSRBF+fiXlBD5A0rHB6ciNpOnpepIEKaVaTFyx16du
         TfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711632141; x=1712236941;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3ES/YD6KLu7umQJrMk0Fjm4b3SlVOCp1O4DLrxkmg8=;
        b=so+sS/H4/eMbPILXJOjCXLDh7VFCC6C6Fv/STjtmWIvVbmxI5pOT2mOOsF4xDm/JSQ
         iiiRTlQBkD8iwlKnhd9jgO5q5BrfHUcLAIX89s/SWSILOkL71YV3DZ/lguK+a4KFet+r
         aumA823pYA9JKcx+1ANaAgDPU8oKoHMhbJArAh5lho3WKPcQbypHA9HX1Rm573A/PGGm
         vyin85A8q2n3/xmheqGUn02Jha7kImOaczllnkASBokSHLc5/CaHA4NqoeSJh1zB7Pn4
         JoPfBP/XmJmMO/LEBZRHHXz7yzYFXeGVgTXQgjMrKG0A7fGGot/xcmL3A7ehWNoJWA7D
         p+6A==
X-Forwarded-Encrypted: i=1; AJvYcCWEDMgXcFj7FxtwDfjZEmp8snfAWJ5vowLLt5S7dSpBpqj0D2WF5LT9cKuYauFoR232qPq2btBDVrK1ODiZb8+douTpPHvXUsj4MrBT/YA=
X-Gm-Message-State: AOJu0Yw8mvh7QcWVsvk1dFgwZJ0meW5Dc3+lSUedVt2ALyOUIhvklV+x
	t4Hwkzec3Gwr5JvXYu3RoZ7kvzlg9xudxMM8+Scn3he0yVgBjpggcR2KAJdnPA==
X-Google-Smtp-Source: AGHT+IFgy7j1WeYiNlX02YTIgD1Ty+6Pt9Px0rua2wJG+dVUg4Yb5W+kuJVS1amhv3f8j8XpkHDAWQ==
X-Received: by 2002:a17:906:fcb6:b0:a4e:17c5:9944 with SMTP id qw22-20020a170906fcb600b00a4e17c59944mr1570792ejb.61.1711632140830;
        Thu, 28 Mar 2024 06:22:20 -0700 (PDT)
Message-ID: <dd2984a8-e76a-43fb-8545-b46c76b2acb5@suse.com>
Date: Thu, 28 Mar 2024 14:22:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/spec-ctrl: Move __read_mostly data into
 __ro_after_init
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240328131415.1734382-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240328131415.1734382-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2024 14:14, Andrew Cooper wrote:
> These variables predate the introduction of __ro_after_init, but all qualify.
> Update them to be consistent with the rest of the file.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



