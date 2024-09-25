Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C5C98559D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 10:38:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803560.1214211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNWS-0003JS-Kl; Wed, 25 Sep 2024 08:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803560.1214211; Wed, 25 Sep 2024 08:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNWS-0003H2-Hq; Wed, 25 Sep 2024 08:37:20 +0000
Received: by outflank-mailman (input) for mailman id 803560;
 Wed, 25 Sep 2024 08:37:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stNWR-0002i1-PR
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 08:37:19 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60535774-7b19-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 10:37:19 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c26815e174so7975358a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 01:37:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf48c103sm1602432a12.9.2024.09.25.01.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 01:37:18 -0700 (PDT)
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
X-Inumbo-ID: 60535774-7b19-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727253439; x=1727858239; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ID/5cy6TCjMfUAFoMvF43IMXGOg0+ne6mO/UqBxbtWQ=;
        b=EB92y+wKAhrltpw+qy2ktBJFE2B8h9+a8DI+RkAwargp2Srx7HwXzyI69PI7+89jeU
         G5wEhuS71VOrWZLmAk5o5fTytDISvlayDHC2TmHWc/Wv6i8tlZ1GJ0fBohPk7pXsb3yF
         YHiE5yj5VtuRnr/D9C4ZhRgz/xYJ5Eg2nGLCj/tmOOFx+TNB+PBmRve/FihBO6hwrg/d
         zINZlpByq2Sg2Q5QUOgGhZHLgML8274siwErWxG9w6o55sqqZTxcW/Ys8fVaXTsplu5J
         IdeiHLpulx0iLIcnVdWBOI/bPzhWM7iyczkp4u/hwSrGXYZ+w2OSFzS+bnbPG45N5OLk
         hEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727253439; x=1727858239;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ID/5cy6TCjMfUAFoMvF43IMXGOg0+ne6mO/UqBxbtWQ=;
        b=jzxq4CxEDJog4laxrvj3HTba6XTKzis9pcUGQ5OqNfJmtQX0BU9v1IPP1J4YFrre5C
         Wxa2x3GVxGa818ietqL4exR0FPaNXSFUTFwYMT+rfkYikFZrNxdznUISDCFJXvfTnr8Q
         7RieEYGW5FfD86dpYdkjuym2HE4fE0uxFV+WUE863IOzn2/CYyGIiW71TR9ErOy05wx8
         cJCiuDIdcCL6yWInADOqqTzP2NLWNNeoReG1rKL8AeY1x3MqA9W8G9bCcZpfJyzPmSda
         TRRe60O4CSOje92v6aVf5agzBRV46SabTL0iYrm0DOov72JUVpzlq6YDNJv584LXmXFn
         I2MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBVCOzIuCHuGmGkXQ3sV0FJsxY9IN45dQFvqSkEMKBLaZgovWAasyofvSXV4vVUviKpS8o0gRmxjI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygxI2R4ofugC9+h3arF0Mz7OFD0KR45+bXb4LcIRetmK1QcTcx
	4pj4Dw8tGdL0CW/r7uW98HcE2rwMCamJBZsZG3cm7Pacvck1jnIBQswyu1cG/Q==
X-Google-Smtp-Source: AGHT+IFEyJli+kU4bnWC7uTKRSJzmJ522SAFokSF3QXZN6Xj9lDQUVjg2iGCgaebCLzn1P8IhUR+Vg==
X-Received: by 2002:a05:6402:3588:b0:5c5:b9bb:c4e4 with SMTP id 4fb4d7f45d1cf-5c72060a8d7mr1493146a12.5.1727253438706;
        Wed, 25 Sep 2024 01:37:18 -0700 (PDT)
Message-ID: <2f140321-a897-40df-b9dc-0a4ce6243809@suse.com>
Date: Wed, 25 Sep 2024 10:37:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] xen/arm: use {DT,ACPI}_DEV_INFO for device info
 sections
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1727193766.git.oleksii.kurochko@gmail.com>
 <1533aa9fe0a4464bd97a44fc1f68cac0a670640c.1727193766.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1533aa9fe0a4464bd97a44fc1f68cac0a670640c.1727193766.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2024 18:42, Oleksii Kurochko wrote:
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -126,19 +126,13 @@ SECTIONS
>  
>    . = ALIGN(8);
>    .dev.info : {
> -      _sdevice = .;
> -      *(.dev.info)
> -      _edevice = .;
> +     DT_DEV_INFO
>    } :text
>  
> -#ifdef CONFIG_ACPI
>    . = ALIGN(8);
>    .adev.info : {
> -      _asdevice = .;
> -      *(.adev.info)
> -      _aedevice = .;
> +     ADEV_INFO
>    } :text
> -#endif

Why's the #ifdef going away here?

Jan

