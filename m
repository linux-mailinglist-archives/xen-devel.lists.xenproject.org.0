Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D41C8455B7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 11:46:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674283.1049142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVUa7-00010t-II; Thu, 01 Feb 2024 10:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674283.1049142; Thu, 01 Feb 2024 10:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVUa7-0000xe-Eu; Thu, 01 Feb 2024 10:46:07 +0000
Received: by outflank-mailman (input) for mailman id 674283;
 Thu, 01 Feb 2024 10:46:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVUa6-0000wJ-GW
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 10:46:06 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19a9aead-c0ef-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 11:46:05 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5112cb7ae27so1400712e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 02:46:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dh8-20020a0564021d2800b0055f0b3ec5d8sm3675264edb.36.2024.02.01.02.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 02:46:04 -0800 (PST)
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
X-Inumbo-ID: 19a9aead-c0ef-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706784365; x=1707389165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HdmZFcuuIPK1Q90rspQKvLqZJBvx+8Rnf5ur+I73X64=;
        b=U8ROuIUHlCd+99sdwiitG1gmKnx7AxbYdA0ahc97jH5zq2dzChb3TedZDAMMyyskj3
         mMyxTAg+Pj4oBO4n1sztYqNqVpV2ISEPDaJFpHXX/WxJ4YHfFj419DZExd/gwZnBy7Qg
         Oz3T75gM8vWD/ocnyew3MCqQDVEnn4nvg26G/GgEYmWibLbPvd8v9UhO/1balcPyU4HR
         vWUVl4mqB+Ku0KYbbl8p6eCBtvQGVLg5akA9YSf+CZBabqDYimTvoR6YxxWMnrKy5Kgc
         kpqYbbym8Wc+JuK8UKz4iwzYlyOLMdbGHj5sn9w/7fpsUGHUS00D+iTlYWZ8/bAMp+a6
         lZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706784365; x=1707389165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HdmZFcuuIPK1Q90rspQKvLqZJBvx+8Rnf5ur+I73X64=;
        b=tiYqlbXqvthpm+KCDMiLMSghpx4nDK6FQGlG0/KPoLqsJnh/68TdK6VIANT4PCYCTg
         2wy4s4VCVihICI705cjfIxfCKz7F6scW7iR+AYox6vQq+HTMyAKPz0C2wynudjvpeHla
         uN8RvssRNlZSQXR9Ch5fmIt7E957kGP55xVHw+afKvHV3gzu//E29HM87j8zrw5QiiCZ
         yN4zNu0g5YgBKs+nUBuuRUiHRcr8nkgvFD0/zEEjVzACZPRZ+2+rCLoeeiMvR7vqIqkR
         gJVMHqIknS1dzjjE0KRsSE1meCVaH+xxL8GQgKdLmhUshzQkYivLfjOB9gERte2BAZ0d
         Laeg==
X-Gm-Message-State: AOJu0Yz6jP5dPhc5EfRIyFr3jaet7GUv9VL6S8jY7aV4tmdDl4ZbZFP/
	uoBSSUSIEeWeRf1Kysq/03lq6zjkvTlJyXVnB8jG3jY2lvdmctC6ZlCQMO0VSg==
X-Google-Smtp-Source: AGHT+IEtw/eyfacwle68fAA8jyfPWhq2Wtd9UuM/AS6Yf6sX+JkhGtqEZMHo1ubXosn5shU/MUCK5Q==
X-Received: by 2002:a05:651c:2105:b0:2d0:7590:7dd6 with SMTP id a5-20020a05651c210500b002d075907dd6mr1340506ljq.5.1706784365185;
        Thu, 01 Feb 2024 02:46:05 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVquoUlq88gZmNPZqxy2SO3va5yUl9GUEiWzOCfruj8wzBq+Gm1asGPTelwtOccYJRG6dsXHB02w2mZ//OTcYd2v0J89gAgJIMIBmrg9XW8IRKRdbytszfQ80E5Vb1mrP2X0/2Gv6wGsy2Wgk1aBobG6KCyio+jgciywaS0vWqZTRn4
Message-ID: <81820a24-03c1-4926-bd0c-5c21ed982271@suse.com>
Date: Thu, 1 Feb 2024 11:46:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/bitmap: Drop unused headers
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240201103506.549662-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240201103506.549662-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.02.2024 11:35, Andrew Cooper wrote:
> Nothing in bitmap.h uses lib.h, and there's no point including types.h when we
> need to include bitops.h anyway.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



