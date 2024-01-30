Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F93842062
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 11:01:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673271.1047585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUkvb-0000Jt-Qt; Tue, 30 Jan 2024 10:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673271.1047585; Tue, 30 Jan 2024 10:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUkvb-0000HC-MX; Tue, 30 Jan 2024 10:01:15 +0000
Received: by outflank-mailman (input) for mailman id 673271;
 Tue, 30 Jan 2024 10:01:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFHt=JI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rUkva-0000H6-0d
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 10:01:14 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fe5a0c8-bf56-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 11:01:13 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cf33035d1dso39311961fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 02:01:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b13-20020a0566380b8d00b00470c4e1553esm931416jad.131.2024.01.30.02.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 02:01:12 -0800 (PST)
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
X-Inumbo-ID: 7fe5a0c8-bf56-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706608872; x=1707213672; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CHLzcoPLDTEAE+BJGU+GYGcH0d8BgyqjRpsmsTEbPrI=;
        b=bp9sjlBoDLjnv6RRskxx/dh6vqSTvnxViOktCQeGS1aRjHiV/G//iOAI2We9/NWLfR
         /8tyEvJQ/1lQ0FAdVDL/KOoErHMkso6auqenTjX2rGHRhkqrXckcB06XeLNdpld1/yWi
         q1dG2SyMfv89NXD6tedhdst/M/jPuQ2uHdGXbQl5WM5p27TgOI4SmZ2COHuMe4A7TAnI
         WAQJrAYS4ZGRSwWMBrgYIrnmqQGBF+Qyp43A67sIIUqAT4aj3Lzdb7ELXizQ5f9xEJGE
         wVGz5Ukptr2XOxUfqCP+me6MhhNKEXIoVF8vuzsUPpW+XTU/Eep8KKnADTFrpIYVqBeX
         bYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706608872; x=1707213672;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CHLzcoPLDTEAE+BJGU+GYGcH0d8BgyqjRpsmsTEbPrI=;
        b=q8vKRmSckDElMVqBXbFffemeqzDhGq5Kt3A1JJ4dW139ELhW1j/cJWKQ1ReXRuRxqq
         Mu+kMq7B9P+FIeIbVRQYsniPFQlJ2dRhFVN26u+KeNxm/RCR8rxUz38qYrO+JXJbhZUP
         1JeAZGx83wemZcFczRDyIV35tfYzlB8EZeOTc6BQtgs63OcTnn7c8Ll+e4sn+RjdW2fW
         lhExzQ9OFU+r96kjsJ+oMzh3jcee615YiXdDV7euLRxcyF46HcGsNlkpLGd+d6IgoF1H
         SKvswx81PZYQl5E8yBA4s4DdjfN/Jrn9UzVYrTnMEPc621fejSmU9VgVS77j70KAgHZJ
         b4Cw==
X-Gm-Message-State: AOJu0YxJyqlI0+u1mtXVWdOWAVjOffWmsGZM+FTAjBxQB59a3V5Lr3yw
	bg8y68MnGlznzIiZ7dBH1UCPSanM6XHa842N735RNvKPpiMxqolBDxWuEtNb3hJUOo8ZWqark1c
	=
X-Google-Smtp-Source: AGHT+IHb9lTreDXRlhxfEzUMcKAtpVCZ6N8LQ45bIIawcCi8SFtKub9YYqosEp4pkjmgXwKFJ1G7yQ==
X-Received: by 2002:a2e:b748:0:b0:2cd:a311:6ae9 with SMTP id k8-20020a2eb748000000b002cda3116ae9mr4746141ljo.5.1706608872504;
        Tue, 30 Jan 2024 02:01:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUFlyJuBxXriUEDFv+QQjMwNBZk2QCgJzZjCfweVAj7i4ZXweBrjXw6TLKdcGo7RkpRJY0FwLxkTFx1Hk43vH9SG+StpND8EHPKNkusmgd1inTh8W+RLUjtJLlfncLcdrqkiWfHfbPFOIw=
Message-ID: <95b9a3c1-d1d8-4a18-8eea-67d226478f28@suse.com>
Date: Tue, 30 Jan 2024 11:01:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xenpm: Print message for disabled commands
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240125181454.50534-1-jandryuk@gmail.com>
 <20240125181454.50534-3-jandryuk@gmail.com>
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
In-Reply-To: <20240125181454.50534-3-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.01.2024 19:14, Jason Andryuk wrote:
> xenpm get-cpufreq-states currently just prints no output when cpufreq is
> disabled or HWP is running.  Have it print an appropriate message.  The
> cpufreq disabled one mirrors the cpuidle disabled one.
> 
> cpufreq disabled:
> $ xenpm get-cpufreq-states
> Either Xen cpufreq is disabled or no valid information is registered!
> 
> Under HWP:
> $ xenpm get-cpufreq-states
> P-State information not supported.  Try 'get-cpufreq-average' or 'start'.
> 
> Also allow xenpm to handle EOPNOTSUPP from the pmstat hypercalls.
> EOPNOTSUPP is returned when HWP is active in some cases and allows the
> differentiation from cpufreq being disabled.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
on the assumption that really xenpm also ought to be listed in "X86
ARCHITECTURE" in ./MAINTAINERS (and be CONFIG_X86-only in the respective
Makefile).

Jan

