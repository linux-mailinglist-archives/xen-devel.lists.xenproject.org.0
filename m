Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA68DA65687
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 16:52:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917258.1322217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuClH-0000v6-QD; Mon, 17 Mar 2025 15:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917258.1322217; Mon, 17 Mar 2025 15:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuClH-0000tZ-NB; Mon, 17 Mar 2025 15:52:19 +0000
Received: by outflank-mailman (input) for mailman id 917258;
 Mon, 17 Mar 2025 15:52:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rdq/=WE=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tuClF-0000tT-U2
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 15:52:17 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd125199-0347-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 16:52:16 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso16388975e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 08:52:16 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fdbc4cesm81462315e9.0.2025.03.17.08.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:52:15 -0700 (PDT)
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
X-Inumbo-ID: cd125199-0347-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742226736; x=1742831536; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7xiXPoAKkwFpGzY8cUM/UBfoM1Sb/wB5ZKQOj7uhRCw=;
        b=bk9p1bf0gzsP+7pH/cr+xGK7lwZyCWzekVDopP/iJkAtt+SVac215VZRL0vAzR0J/e
         qdu5kgYaGf3seozk2z8j/yocBPrrrwbedN4hhPobhMr0t7+UsO5QGk4JRWHexX6PB0ig
         mySsSLe6Q37nh1terUqXV+qWE6zzcXECNbirFOuEFS4pPxQgpqz2UlaSwYX/wlZA3yoq
         LNgnJnD5zPdkGnRfETdjQXdROiWWvK7MMT6dG9tLNP82obynuJD+Q/HVoaVNturx++k2
         GtLqqRrw2nCWO74tMny3YSMBu5NskuJ0YB94SBxGax07uGeut+dwreBvcq3Bz/AmjLCR
         5c7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742226736; x=1742831536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7xiXPoAKkwFpGzY8cUM/UBfoM1Sb/wB5ZKQOj7uhRCw=;
        b=srmASoZrvewGzNcHJgfBQKaW+6Oa1iH9YXItCGwmIGIPeessFdLSsy5Lkh1FeAd7Hb
         E/vMSstViVRwPH3R1DNqHYeO0HS7XRNjvRMu4D0DoW4/AenF+Ikw/Qk3Z/elcVBVasym
         B5m9aK/TYvSg3Y/mt0Lv52rrX4mnQxvwsbAaiKrnVLo6steFYB41SA1/vLk73zYhyNHh
         ghpI8ih8gwY7x6YnvK8jP3rWVFfiugzVsthXO++QOJPrI7ruLrdYk7vA3/43VVR5Wjmd
         GgrWDbyb1xKtV17xk6BJXwaw36MedpOJJHlG7FjGU+tmkysV1agDoak9+kzQb+VEQp7u
         XZVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyppGqoAfPzewo21GUZ7mZfFv123Taf47bBSkTW0LmgQBwOEoRoInneP1wnNxT93+hJqKXxhVqZXY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5ouyGP/4CjyZYvtkwVAtDFCDgOLHMwt+ighZaJcdOOOGyUipl
	5z8Mc6vo/l69En+gfTuRZTPE6bQM8ageQxHfK4ASoECOTCqOkxSlHaEUtK3MGso=
X-Gm-Gg: ASbGncvLBb8jz42x+xKe8yVrYHreD8QoFaOW+y70mVMrMd9AASd9ETxt40EJ8E4fdYB
	tfN9wD7a8uCFVFb8BleLPQoIgsFiGsFeZU3Z74Pecu60TugBpVK4rb0C1qwrAZnvOg1VCdb4z39
	V1o0slkgKS0Y2DAca9fMPeFdwb6c1eW6Ju/vaAc2fGWEzuUYx+AaWzfjrQb7pp4SgpoYNyup3Uj
	H6s5O0oWICr/G9JoiE95TMzHwWe/QUl89PELhEePip4ukthu+yJWlUcxZtzPbIRneKw50oAh9Yj
	yL1YTgUKRT4LEXffN534i998RtApToxdLtaSe07cucr5v9LD1tYNH+o52QwLdr4K11NZevCEqcB
	KTyJ2Mx4+Jp2I+e0VQdTX
X-Google-Smtp-Source: AGHT+IFpt8KideQTGA4uKhjvZxuTIzGsP3DM5t9jXqk82vnIbb3xkl9IyoVgYgeOQux+EakZvkLZoQ==
X-Received: by 2002:a05:600c:4ed2:b0:43d:cc9:b0a3 with SMTP id 5b1f17b1804b1-43d1ed000fdmr111360435e9.22.1742226736253;
        Mon, 17 Mar 2025 08:52:16 -0700 (PDT)
Message-ID: <0f6a945b-b3f7-4602-8c17-db07123026a9@linaro.org>
Date: Mon, 17 Mar 2025 16:52:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/17] include/exec/memory: move devend functions to
 memory-internal.h
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-riscv@nongnu.org,
 manos.pitsidianakis@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Anthony PERARD <anthony@xenproject.org>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
 <20250314173139.2122904-16-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250314173139.2122904-16-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/3/25 18:31, Pierrick Bouvier wrote:
> Only system/physmem.c and system/memory.c use those functions, so we can
> move then to internal header.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/memory-internal.h | 19 +++++++++++++++++++
>   include/exec/memory.h          | 18 ------------------
>   2 files changed, 19 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


