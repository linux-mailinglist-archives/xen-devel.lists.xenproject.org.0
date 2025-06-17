Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC033ADCBAA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 14:33:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018209.1395128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRVV6-00047f-ME; Tue, 17 Jun 2025 12:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018209.1395128; Tue, 17 Jun 2025 12:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRVV6-00045K-JO; Tue, 17 Jun 2025 12:33:16 +0000
Received: by outflank-mailman (input) for mailman id 1018209;
 Tue, 17 Jun 2025 12:33:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QEAo=ZA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uRVV4-00045E-SV
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 12:33:14 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b60381c-4b77-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 14:33:11 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-450dd065828so45630745e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 05:33:11 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e243e59sm172795835e9.19.2025.06.17.05.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 05:33:10 -0700 (PDT)
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
X-Inumbo-ID: 3b60381c-4b77-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750163591; x=1750768391; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CFsnUMIKZWQrS60244cHKr2U2aZk5I35nwpyMeRtocU=;
        b=GzpAnMaWw7y6tG/G3rSVd6UxTUlG6jDWdO1Z01oejvgrr+vDx2IHBxW4zTXlRsDUib
         4DvSxLyBdRgiuhvVpztaekouCUC003c5YSJ1Qmwm4djyBSmHkYYQm/28q9ttarVoZ5fx
         6qAgmeBgHYDSsNTyze8lYmt8FkwSOHn9o2Y+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163591; x=1750768391;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFsnUMIKZWQrS60244cHKr2U2aZk5I35nwpyMeRtocU=;
        b=V4yLdsWPSR76wpgJCPOHIYr/FL5crAQ9RCw16WPMeujZ2kbkbnK0n3SSYy14kDmC++
         M3GcB2kS9N8nPWN0Vll2Qz56QqlVWqTJcif8zgDNam+YUhAZNXMMbIQ702/jV9y92mXj
         5DNVgbUCYlbRrKeKMSrAu//1wjKPNDCEi1oLfNHID/qGZ0sfMFlogxRWJGXgwCh3D5t7
         eqz4O4u7NOw6M3ydCqxub+hqignhCPZXLPQinbPGOcTtRr4KbOsau2zIuw9INqcSf/C+
         NS818CooRsEDEe6rBXjMZ92vgdZGIDdJGeaGilVM8anOKlI/CqxlJN3fG4hutsrhNlhC
         5ZtA==
X-Forwarded-Encrypted: i=1; AJvYcCWWjgqnWFRjQLtUKIJ1LFIStbxlQY3dhMev3xzTsnn1ivEc7tJHmn1q0i2q5Nq42IuoY8RTqrOaQQU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOkoAYzUX0Z5I9+dw4SQmWp2mMlH9UbeWtEwyQOoxzOh4+cO+1
	sRRPBcTrf9uuHVuB84jntB0tEQRWbj5s9Tt3s9PQY+Hpb1an1HjZnW+mYrQXVupkq2M=
X-Gm-Gg: ASbGncvvM6wSorkqrtB1DLUtFHS0ZatgsibJDsVKaepnWCZ7Lk9LJxbBILHrYVAR+cR
	F3rwLmbwJy0YaFVFgTHnwgehFvotVBfUNyQQ0WmodMrDbnTCu8E9iGA4GfdS8oBrQFkwJYkGu14
	MKPrzhw2bSYoS+aa3Hys3xBMm/+gbnCQ4sQ2etu3SEWmNjI0X+/wm+IYI0Uzs0JXiw9/eQOeCo0
	h+fT3q+L04Ez9klEeHOliwavt29DOW7CerSC5u18MdWKVbOkIUjPP7ropGN2ivDT2NCSVk5VN3h
	fMXM2mdbPHnZ5+/aYIaT9SOM8n4GuDXkxvUdQzdf7F0HU+l1cp8yDgXeZD2p4RjAG/tFetMJz6O
	ObRXZCRxnfcO000rZ3DgMCIRF3m8=
X-Google-Smtp-Source: AGHT+IGj26pUOZaq5kw5OdEH2GfEdgf5nxMu/V8rLrjN7VCv6vt9PYVMuLaXPmpMk7Pu+8V6au18xg==
X-Received: by 2002:a05:600c:8685:b0:453:483b:6272 with SMTP id 5b1f17b1804b1-453483b6369mr58304935e9.7.1750163591230;
        Tue, 17 Jun 2025 05:33:11 -0700 (PDT)
Message-ID: <6e8ca83e-1d0a-4126-9219-c02b98011e47@citrix.com>
Date: Tue, 17 Jun 2025 13:33:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/dt: Remove loop in dt_read_number()
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20250617110741.34648-1-agarciav@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250617110741.34648-1-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/06/2025 12:07 pm, Alejandro Vallejo wrote:
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 75017e4266..2daef8659e 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -261,10 +261,19 @@ void intc_dt_preinit(void);
>  /* Helper to read a big number; size is in cells (not bytes) */
>  static inline u64 dt_read_number(const __be32 *cell, int size)
>  {
> -    u64 r = 0;
> +    u64 r = be32_to_cpu(*cell);
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        break;
> +    case 2:
> +        r = (r << 32) | be32_to_cpu(cell[1]);
> +    default:
> +        // Nonsensical size. default to 1.
> +        printk(XENLOG_WARNING "dt_read_number(%d) bad size", size);
> +    };
>  
> -    while ( size-- )
> -        r = (r << 32) | be32_to_cpu(*(cell++));
>      return r;
>  }

What testing has this had?

~Andrew

