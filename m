Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009279DA315
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 08:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844492.1259995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGCSi-00026B-A8; Wed, 27 Nov 2024 07:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844492.1259995; Wed, 27 Nov 2024 07:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGCSi-00023Y-72; Wed, 27 Nov 2024 07:27:48 +0000
Received: by outflank-mailman (input) for mailman id 844492;
 Wed, 27 Nov 2024 07:27:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGCSh-00023S-9L
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 07:27:47 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17764bfa-ac91-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 08:27:43 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3823cf963f1so4102176f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 23:27:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad6270sm15382800f8f.14.2024.11.26.23.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 23:27:42 -0800 (PST)
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
X-Inumbo-ID: 17764bfa-ac91-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmUiLCJoZWxvIjoibWFpbC13cjEteDQyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE3NzY0YmZhLWFjOTEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjkyNDYzLjc3OTM0Mywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732692463; x=1733297263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9imLK/RWMmt3dOa2HaY/dk0zqUKBQATRJ3bha5+E1D8=;
        b=E8y9c6LQkib29ohNUCjzIR887uhSSutELhrM4oQQBzPdW7U2YEE4Raih6KJsPbILLm
         VaAAhKM+KyMlyopH+dkOaMVLyxaNzoD36ndxci/LQZycb8U5JqnuW+1MfDn3Gkdom2Bo
         TWgM0lOrWZxbGqCeigQUXs5mvCSBHGyo6Ij+0AbVVsouxEF+UKWDdWO34rYBOOrXMRsg
         8lgF2rND/2Ft864AIPqWk92sZl/ujvrfDMSegI4w1P6I5DuycOY+iyGUIz1J+t0589Ei
         0PtN0UmexrPQof+JUxPKMtZ+yqCa18PaCEeZp+HQ1vUVy1dtpaJBnMvIXxlNE1tYaNoK
         MgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732692463; x=1733297263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9imLK/RWMmt3dOa2HaY/dk0zqUKBQATRJ3bha5+E1D8=;
        b=d/JnnAStkVm/dglFyne9i3WfxzjHRWRxVwkFSsDKbYCqwKMuOnveflT11KmAHi9+QI
         zqi3CtTfsltzlBvZ8k6ugJQB/7RBKwPRaJ59Wwj5M6wKLvGCYh+nD66aOsHI3XuxwPGD
         uHmad1J8MMgIJRMLtCEFhYUpc9F2tK6lgzv3+zUq6x4MLh7ypS7bXs1Tw8EOyn1fVvit
         kSLLQpvTwpAmAenSh/KCacthIxMRLBJHWdOmbgqlnAq6FKTivq6iqNl05jnene3PXluR
         WuzJ4m4Sl3w9h+I9lJ+e3WgrbsnLbAiUC0Ll4C7unDJ12+f7lLrBJ+45hjH8zxpxyJ0Z
         E6dA==
X-Gm-Message-State: AOJu0Yw3RL6H2TNxqdWJgZ69ozUDAsnpWjiRLcPPC1QJAkZyJO73KOAr
	IhN8u2G6i4AY2zoxZ5uoAOZckIM5teX9h2hQjoXOtoE4rvFPF1EiIEvsMEWDHA==
X-Gm-Gg: ASbGnctzYQRwgaEqVwjpij9CVRBoXAZqPQGR6Ft0dsemZwtNv2tJtCUgy6iB6qB+rrH
	/oDFTKNHXxmCHZX+WvywfeaszCdLjUBTOIcRTcLxv/vk/j6EwHwMroGrXj9C/2QuG/C6J7RgLnK
	DFegyoi43R56/ExAhJuuD2uyc+99QPnh0wycJOs80O6VbjKvN4n2uTn3GrPM+99CjvDRGvL9Zqi
	q8ahQ6pFn8NOAezPmiUxOtEkMOF3dMu0Ydo7npd13FGLaaZRHi4g1us+2hdESgeIwhZv7sEwQsq
	egZhd9rI/ojyws1t8GyJXwaAYnRMBfom9KU=
X-Google-Smtp-Source: AGHT+IG+N9zIJ9z6iykOnERHrSxB2Rx0bVET+rWNJBWASy31bwaVd+9dVnuPqTSiOMs2if7ecb/X+Q==
X-Received: by 2002:a05:6000:481b:b0:382:4f80:1359 with SMTP id ffacd0b85a97d-385c6eb74d4mr1630838f8f.20.1732692463147;
        Tue, 26 Nov 2024 23:27:43 -0800 (PST)
Message-ID: <8a22329c-dee0-4244-b69e-eb55a32f789a@suse.com>
Date: Wed, 27 Nov 2024 08:27:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/36] x86/setup: fix typo in acpi=off description
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
 <20241126-vuart-ns8250-v1-v1-1-87b9a8375b7a@ford.com>
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
In-Reply-To: <20241126-vuart-ns8250-v1-v1-1-87b9a8375b7a@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

(Cc list reduced)

On 27.11.2024 00:21, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


