Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5823A5D85C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 09:39:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910073.1316852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsHc7-00086Z-6m; Wed, 12 Mar 2025 08:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910073.1316852; Wed, 12 Mar 2025 08:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsHc7-00084q-41; Wed, 12 Mar 2025 08:38:55 +0000
Received: by outflank-mailman (input) for mailman id 910073;
 Wed, 12 Mar 2025 08:38:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsHc5-00084i-WE
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 08:38:54 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d822d9b-ff1d-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 09:38:52 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so37894325e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 01:38:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfb16sm20188489f8f.29.2025.03.12.01.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 01:38:52 -0700 (PDT)
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
X-Inumbo-ID: 6d822d9b-ff1d-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741768732; x=1742373532; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TWd0JSWCnolBxwmmxmTHV+s7JlpXcHYXYHCagTxBwmY=;
        b=aNDeZnXxfSK4xNnV6wUGZRk9tl1gBvgdNaJjlBFIRhT0goAPBpatuuIYOX1y086IU1
         76Uip6NY25zFbUP3zXxNnRxrkRJriD+nP9Yi/NOdekmpZDX8XGTuhhl0o/2IVoXAaMwL
         jKzmRJpjULKZlsxGR1Nwqoqj5DCqmw524PMTvqGE1xESmVU51hpLSLWzoNqHy+4aV74o
         Emgf3cqY07reqhABjSwDJN2pK0WBz1Qrj7QNuufJbtdI6IULNZCMlSKW/cjwVAvpAQPq
         8OrP5sjCHcvcCHFrD51lIoyRdc2Vh0xWRM62rND0aKpezUPCa2tiLxX0vnQc8Y3sqs2j
         u+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741768732; x=1742373532;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWd0JSWCnolBxwmmxmTHV+s7JlpXcHYXYHCagTxBwmY=;
        b=KNxw7kzH4miGq15I2fyqCLdz/xvO4limwCPqp/vMV4TRyv7eAgvLe0fqmEeczVbKSC
         xhH+e6q0d1NdVfbptjH6bUbWMgW8aRcMGd8g/RW45bhD62HuGoaWL/cguIAEAVkjgzly
         Yj8hebQk23azhUzw3BvYNl0IQszTVn4fq2d1i/LDS9f8qvH9ODPzyfG0apd56Yp8MKZG
         nTfnJcwhLXEERGf+RiLO8vW1IDVoIhDve4/E/5AOsb8+5EGcqLBQvVgOnVeF0MuFFg5V
         JP8b3DBrfGbgY6dVGu6aedi8gSOeDEoiyi+blvszkDbsr6V3h4vYmhHJ5sEkyQ2KZkiz
         NB+g==
X-Forwarded-Encrypted: i=1; AJvYcCWUukoJv9X3FULGGLcdVgOvfXYjfpocHSKtTo9sJKfhTC6HPxWo3tUrcLICYDDGznTCyR9jsk1Fsvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQSeqVrKsAFIEuQ3+1pB+hWsqA6OyLBxxbGff56sAI5uwOFpb1
	jpH5xDvxht4mln6ctQT8tQ8oc8GB5FFwLCWNUqGG0BpiyHdvsEB+jvR+lvMRLg==
X-Gm-Gg: ASbGnctuNHcz5gApQ4OC8qGFLCmQjQRFyPr+QvwUJt3HXjgTE7R66iPL8NkXmqRe01G
	hZBnylDXXigR/QxkhEpWphVtX0I9+QOTuqYCK7KJE4K3SzECwQbqUi2CxZWq3OeGLe1pgfOEGEd
	2xGjRps329bYwabIIKyo7KzVpBGwUdB6T1BvjjmbKpp4ZmVAEBKzNANLTWSZoOuPYOvMUIX2aUC
	cgJXcsP+h3UJrJ44DJETaJ+KkIgfzN+qj8nIWcMbEvyFzOWvAVgX54pI4fu5C/Of/b+rgP2QUzD
	QDsqwyuPOmwZ15qPSLae+KR3L0Vj5EtUsJ1kJ9YmWw7Ig5Baekao6+748dilTZs9VgPa0SSyClM
	QQyZ7Y9jBPa1Km9/MIUB+iW+wtgXzUA==
X-Google-Smtp-Source: AGHT+IExedR9h7u1iNCrqxzsYgQau0D/v4C9+NUIgyME6jZy3FpuNOpK1XLznQCEmg3JSPp3rh3Aig==
X-Received: by 2002:a05:600c:1c17:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-43d0079b0c9mr98175505e9.14.1741768732259;
        Wed, 12 Mar 2025 01:38:52 -0700 (PDT)
Message-ID: <78d03f36-c848-4e88-9aac-c323a48f4148@suse.com>
Date: Wed, 12 Mar 2025 09:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/19] xen/xsm: wrap around xsm_sysctl with
 CONFIG_SYSCTL
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20250312040632.2853485-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2025 05:06, Penny Zheng wrote:
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -180,11 +180,18 @@ static XSM_INLINE int cf_check xsm_domctl(
>      }
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
>  {
>      XSM_ASSERT_ACTION(XSM_PRIV);
>      return xsm_default_action(action, current->domain, NULL);
>  }
> +#else
> +static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif

Please can you avoid introducing unnecessary redundancy, by putting the
#ifdef inside the function body here and ...

> @@ -259,10 +261,17 @@ static inline int xsm_domctl(xsm_default_t def, struct domain *d,
>      return alternative_call(xsm_ops.domctl, d, cmd, ssidref);
>  }
>  
> +#ifdef CONFIG_SYSCTL
>  static inline int xsm_sysctl(xsm_default_t def, int cmd)
>  {
>      return alternative_call(xsm_ops.sysctl, cmd);
>  }
> +#else
> +static inline int xsm_sysctl(xsm_default_t def, int cmd)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif

... here? Provided these #ifdef-s are actually needed in the first place.
The earlier one I can't really see a need for. If there was a need, at
least the assertion likely also would want to stay outside of the #ifdef.

Jan

