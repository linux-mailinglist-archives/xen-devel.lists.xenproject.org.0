Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE288D208E
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 17:38:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731223.1136618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBytV-0004Uh-TP; Tue, 28 May 2024 15:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731223.1136618; Tue, 28 May 2024 15:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBytV-0004RV-Qb; Tue, 28 May 2024 15:37:45 +0000
Received: by outflank-mailman (input) for mailman id 731223;
 Tue, 28 May 2024 15:37:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tjWx=M7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBytU-0004RP-D8
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 15:37:44 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38705bb1-1d08-11ef-b4bb-af5377834399;
 Tue, 28 May 2024 17:37:41 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2e9819a630fso15462821fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 08:37:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cda1a97sm626713366b.188.2024.05.28.08.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 08:37:40 -0700 (PDT)
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
X-Inumbo-ID: 38705bb1-1d08-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716910661; x=1717515461; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vSEy2ETKGHjyHgCOnRsKIiBnMDV8gzkuxwZ76brN06M=;
        b=ZYpPB9WRldWFzQNHWdRh58jYhX7fL17mnbXanGxgnQVfUhQWpC6CE4VyQdQWnj/HGL
         ryAiCvI1kESMSBc/cDtVy5R7j8bdhLgyYC7JCN2oHOIwuISWP+QKAn2P3f5NcbWQVosC
         N24Ot5oZCwZ4okrlkNETnuwj0BfNPDGFlgDNNHINYjm+4VdVQh9lzVatWGSBRCWI8xg7
         vHJZxkZ+vZI5JoOHn/WQHqbrAUNCn2Wc+QN1ZJ+QPmhe0Rhq/rf4dFLBB5lNtQ6ZaoSz
         4NBL4mp9iPjQIq1AK0K1tOwZz+G7sVy3Cmq4wnKlKP7shtkNyFbw4R7c+jngquzcL37H
         TFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716910661; x=1717515461;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSEy2ETKGHjyHgCOnRsKIiBnMDV8gzkuxwZ76brN06M=;
        b=ncJtU/o4uO3aqdxx1wL9KyWiBPm2y/JAjTa8KdBJ2h+tZ87nol/xTdNx4MysUOYHVi
         IEVavwA5HJykyYh+i5gaH/kGyClJaUwsV0X2lbd2zaOEJlYzoyAShlz731IXe3FaJ3ci
         6DNs4cQBufHzNz/3xvm9VRAPIzPax0ixQ45ACeFXooZMmbRmLIBdXE2EBQhGfgDdvM+0
         M4k94b3Kgq3IOVpKapOVKgJIEPyamp+M+tUwfFA8K89GSu5a7o1l3qYkjqq5ixg5y8Io
         ohKfASzLAby1Vtbqa+A/64yEI3/iZ+CD3zw4xzVwC/FR/69ffj+B14ofNkEmPmfQTuHB
         b+eg==
X-Forwarded-Encrypted: i=1; AJvYcCVsp7879JuluI4t2+A+Z99EbKUoLvf/OinZHA8hMGmMdeHTxhBM8a8c4jx9QQ0KMoOU/pvU6OakxBUKFU6Ke101qckmUkVrgYRbDtS/GKk=
X-Gm-Message-State: AOJu0YwqIXDnr7/kYxTaTpW50KE3dVjluFuqfXnDbBC4oS/jmnwhM0aa
	P5EO6BspjfOB4a5LYjSw7uPcUTNNvXfmjqDhsqOWwMTUbGfLzdQWM+i9o0h1OA==
X-Google-Smtp-Source: AGHT+IFtDUZFPFxGUj7vs/4Ncw624wqhwAu4aXC+RFb9/UtJnuxPTEvHKsz2fF2aYtlBH1yNilBbGA==
X-Received: by 2002:a2e:9b0a:0:b0:2e6:935f:b6d3 with SMTP id 38308e7fff4ca-2e95b096b74mr94554951fa.14.1716910661058;
        Tue, 28 May 2024 08:37:41 -0700 (PDT)
Message-ID: <b05a744d-cbc3-4de2-b138-5591c54d01e3@suse.com>
Date: Tue, 28 May 2024 17:37:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: Rework VMCB_ACCESSORS() to use a plain type name
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240528153204.1350919-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240528153204.1350919-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.05.2024 17:32, Andrew Cooper wrote:
> This avoids having a function call in a typeof() expression.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


