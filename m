Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90A2BC1FA1
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 17:48:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139026.1474575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v69uE-0001vw-D7; Tue, 07 Oct 2025 15:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139026.1474575; Tue, 07 Oct 2025 15:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v69uE-0001t8-9z; Tue, 07 Oct 2025 15:47:14 +0000
Received: by outflank-mailman (input) for mailman id 1139026;
 Tue, 07 Oct 2025 15:47:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v69uC-0001sG-C1
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 15:47:12 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1e01e37-a394-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 17:47:09 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b3d196b7eeeso977155466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 08:47:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865f7420asm1411107166b.43.2025.10.07.08.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 08:47:07 -0700 (PDT)
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
X-Inumbo-ID: e1e01e37-a394-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759852028; x=1760456828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9ILmF6iCt2yGIewJIiJMYGHNCX34vnklwajHZKf50Tc=;
        b=HjPl5aYGmcS+83dvEOUwJjZ36uQi0HZ0dNEYylhko7OwT15tKmNPQBZJy5IG9iqtw9
         LDC0TcYHMS2cjMuAxcynWH/PB9lm5yKbTDVw2OsRFRjTub5VMegOdjaakYMQ3iu4/cS4
         1mBzUa8O/rmGRPIg5qgPXVgjDyVzdi3vfQu0amygoG/MCFfhnzuTHbCvm8JZSa0EiY+S
         acPpGrF5MyqZzVw13pBSxORro4NuWbkAj9UwbpTj8sZmzmvsp4/VLhM/I2nmzLvZTj7r
         WD7lz4Sgh4RW6krByfJF+gpPiG2NOp6e8a3QiQRpp2PM2IdxYfA0lnaVhcWUU3BINB5n
         g4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852028; x=1760456828;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ILmF6iCt2yGIewJIiJMYGHNCX34vnklwajHZKf50Tc=;
        b=kXLktbbOzXi0sYdpdoeNDhKHeWS9PpRRAt1ll4dr3D8NRbSDSujaVR6IaJSu2AK7S2
         YcQyLfGuF0tWfeDCbHYmSe6Ps9irjNz6SXxyJHOtr6gnUkreJ5v7xc+l9CT2FT5SZnG9
         L63lpYPZJDWDhMiMS3/oZhPqPEs98zJcF7pRmAbQxLXGXIOg3z7iv9fbBdL/N+Xfwkuf
         HBdLaxdB0Jpp0B5Ohl+DYKObW97CYHRIBbeEfJ2PFbr+4q/Tlbz1k9VSeEPscEHtJzyl
         rv8+HyzJllgW273hj7Pzp1tp6xoUbvoM94oG47XdIkr9vzRPLaTLapKiHtZhIt3bebKZ
         /xKA==
X-Forwarded-Encrypted: i=1; AJvYcCXlqvFMxBMCY1edjOuOr94qj7LILqJSpi5HDkAQyP2OoztPoNdbVgedx2OopZh6SOvDv+2nMWsD1Vg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4UTepgaYrDgGMn08szzz1+BRp7+GrjRZQMqWkfTmuPehFP11s
	ChcW1sLXwKFa90TKJhkg6K1PZ015CfGpLK+XmU5zNMQmFb9p1qA4QVSnuWSy8aVswQ==
X-Gm-Gg: ASbGncu+svKoFJ8fgdEWuQW316+//dvKYurvplCka+8V7e2zwJ6NYv5EBLVDmifl6TC
	PkrUwOR4+jihJXE5nbUCqPplH29ujAmThPu4UCvFuAMmKmu8JX8h4TN7/77RGNgDw2oCjoQqyUL
	4v4x0HLLAIcLl5SBsnotBBvm3gRJ/WR+W6L61Luy/VARRbYLz5gAvjdsvMezc5mA0DaZcyeBnnu
	5rE38lngNK8lG6h0Z1pbV49kKcV9pxszcqV8fd+o1YwhQOdcmLX4i3rzMKFRCSsqJ1zBuIgmetJ
	RtzBf9MpviV4RZH2uDWnh8F9+g4hh/YUPv4i2SC89pVdU11yPOtWN1hFSKPlUiBU4WMSfYr0ZJN
	9qwTc0uRmwUH7Kdu8480+cucwyXw/1W/12sRnvXNi3yjTv1O3KvG4QVH0R4fy2z42XLt9LoMsYx
	V3Iyff7Jj7AZQhjtB4YehDWBQcIxFO7kM=
X-Google-Smtp-Source: AGHT+IF4x8oxYpcT7XUsKGM0cX7T2UUShscRXIzSrflMb4IIeiSRgNCI2ZUwdbBjjZR+mC+ORicFcw==
X-Received: by 2002:a17:906:c14c:b0:b49:96e4:183c with SMTP id a640c23a62f3a-b50a9a6cdebmr12706666b.9.1759852028314;
        Tue, 07 Oct 2025 08:47:08 -0700 (PDT)
Message-ID: <b165c6b5-e77b-4abf-905a-4e93f185e367@suse.com>
Date: Tue, 7 Oct 2025 17:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/22] x86/msr: Change rdmsr() to have normal API
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251003225334.2123667-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2025 00:53, Andrew Cooper wrote:
> We want a consistent MSR API, and these want to be named rdmsr() and wrmsr(),
> but not with their current APIs.  The current rdmsr() flavours writing to
> their parameters by name makes code that reads like invalid C, and is
> unergonomic to use in lots of cases.
> 
> Change the API, and update the callers all in one go.  Where appropriate,
> update the write side to wrmsrns() as per the recommendation.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


