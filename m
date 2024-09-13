Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FC9978054
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 14:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798171.1208296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp5fq-0001cv-6x; Fri, 13 Sep 2024 12:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798171.1208296; Fri, 13 Sep 2024 12:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp5fq-0001a3-4Q; Fri, 13 Sep 2024 12:45:18 +0000
Received: by outflank-mailman (input) for mailman id 798171;
 Fri, 13 Sep 2024 12:45:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sp5fn-0001Zr-TR
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 12:45:15 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05751ca4-71ce-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 14:45:14 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42cb60aff1eso20321935e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 05:45:14 -0700 (PDT)
Received: from [10.239.240.84] ([88.128.92.31])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b16c0c5sm25302395e9.25.2024.09.13.05.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 05:45:13 -0700 (PDT)
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
X-Inumbo-ID: 05751ca4-71ce-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726231513; x=1726836313; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gz42ccT1luhyhAUMz91x+Bkrq9Ir1Drr2ZsZB4ymUkk=;
        b=QfRFHu4LI/IsYBCx5/+HSKWKM+GjB4QABlZeInprAh8lgH+M6r/09Gct0wZX9ruTNR
         2Q9e9nboT80zMzetubeuulgc84J4XQAoyMhIMJsq6zUJrq2O5feHoWrUBFuqVi5eKwPp
         /UWuoLJyilXexW5sm0rq69pp54+qXutZ2g20eApVig7NcVsdI5b6pP6V/RSy2wWYDd7H
         oRLScaDgRTHul7Az7fa30jfqp9EB6z5nf4Gsg+PDjduE8djE+Hf3aQTAKlv7e7w0010L
         dd+PJ7b2aXwTergjlVcVYi0b/bpaht6wzulZ7FQgTNQG9L7JTUwNPyXiKpC0UPfGypI9
         asHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726231513; x=1726836313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gz42ccT1luhyhAUMz91x+Bkrq9Ir1Drr2ZsZB4ymUkk=;
        b=gUvx+sn97wfbLDqfSLYqT4Y9UKQctzmIuA0D/Xtn5SH5wguYcAYTBuQSHmMGR5AVmP
         2B91U/qDXymOFedZrBdOfQh5aYWUCnJJU7dLTPabGnN2SDA/AQl+PTv9bKJpR5Mg1MVC
         mEC0ecmhxeFgafooCiZ/R6/2wcpYefSmfDcrm51Ri+f/aRWYtJvvsYrC1+hcmRvQCC2X
         OwOIDdp8wSxOCLErjV6XUIfQEN9AQDiYKHNl0KdMmrjbYNhPahO6M1wyq8wOET1wZJ6O
         tKw8DYswh8TKCBuODVYk+A53qpUeCxWKF3bT/bJiSvm3DrGcm1GfX+mRSgAHlE76ECni
         ZwnA==
X-Forwarded-Encrypted: i=1; AJvYcCXGz8T2fjCvcu+LiurQrZd8UFAFCPoY1gI3bAsiGmXUmxIURPHT9XECrXr8ykKMWXfaABafnwKwpwE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGEXcPeiKqFlMZP4v4CqquW/o1U9y0/B+y209AWq3x89lCP4jx
	g17RvAyuRl5ZaoIAX1ZrZ2USEfv9MjXxPrwvuSRQSZ6AMh3C38v1gb3rzUXSKw==
X-Google-Smtp-Source: AGHT+IFs02iuGAizrV4L1vXFJyvYv4myBN1TueSdPbrpcf/1MVq5RXOXMbLlfPZL4p++o13I4oR+pA==
X-Received: by 2002:a05:600c:1d0b:b0:42c:b309:8d1a with SMTP id 5b1f17b1804b1-42cdb549947mr56534885e9.13.1726231513389;
        Fri, 13 Sep 2024 05:45:13 -0700 (PDT)
Message-ID: <db2d6779-2dbb-4e0b-94f5-c6843aa09b54@suse.com>
Date: Fri, 13 Sep 2024 14:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/ucode: Fix buffer under-run when parsing AMD
 containers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240913110907.1902340-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240913110907.1902340-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.09.2024 13:09, Andrew Cooper wrote:
> From: Demi Marie Obenour <demi@invisiblethingslab.com>
> 
> The AMD container format has no formal spec.  It is, at best, precision
> guesswork based on AMD's prior contributions to open source projects.  The
> Equivalence Table has both an explicit length, and an expectation of having a
> NULL entry at the end.
> 
> Xen was sanity checking the NULL entry, but without confirming that an entry
> was present, resulting in a read off the front of the buffer.  With some
> manual debugging/annotations this manifests as:
> 
>   (XEN) *** Buf ffff83204c00b19c, eq ffff83204c00b194
>   (XEN) *** eq: 0c 00 00 00 44 4d 41 00 00 00 00 00 00 00 00 00 aa aa aa aa
>                             ^-Actual buffer-------------------^
>   (XEN) *** installed_cpu: 000c
>   (XEN) microcode: Bad equivalent cpu table
>   (XEN) Parsing microcode blob error -22
> 
> When loaded by hypercall, the 4 bytes interpreted as installed_cpu happen to
> be the containing struct ucode_buf's len field, and luckily will be nonzero.
> 
> When loaded at boot, it's possible for the access to #PF if the module happens
> to have been placed on a 2M boundary by the bootloader.  Under Linux, it will
> commonly be the end of the CPIO header.
> 
> Drop the probe of the NULL entry; Nothing else cares.  A container without one
> is well formed, insofar that we can still parse it correctly.  With this
> dropped, the same container results in:
> 
>   (XEN) microcode: couldn't find any matching ucode in the provided blob!
> 
> Fixes: 4de936a38aa9 ("x86/ucode/amd: Rework parsing logic in cpu_request_microcode()")
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I wonder though about scan_equiv_cpu_table(): Should it perhaps complain
if it doesn't find a null entry? And when it find ones, but that's not
last?

Jan

