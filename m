Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA79880C08
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 08:30:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695751.1085782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqP1-00053c-JE; Wed, 20 Mar 2024 07:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695751.1085782; Wed, 20 Mar 2024 07:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqP1-00050E-F0; Wed, 20 Mar 2024 07:30:23 +0000
Received: by outflank-mailman (input) for mailman id 695751;
 Wed, 20 Mar 2024 07:30:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmqOz-0003na-ND
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 07:30:21 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4ef8c23-e68b-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 08:30:21 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56b0af675deso3224767a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 00:30:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o3-20020aa7d3c3000000b00562d908daf4sm6522326edr.84.2024.03.20.00.30.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 00:30:19 -0700 (PDT)
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
X-Inumbo-ID: b4ef8c23-e68b-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710919820; x=1711524620; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kfPNJaVNrRLUgq1G0xyXFXGJmVwgXHUj6PPli//ssF0=;
        b=FKoLRSyCGm/BdXa1T+38hw3diqgdeOpL0q7PwOLw4VeyIduv0sBdjH1i/Sg+c7b/GB
         JJMJCf4cuygec/jVK8vHYuzisExClUfRU/cnJa0+8fQMrQ0b/GyE1+zD/MWM+urd9BDH
         /yqaPQWhZ7bouDxbXJ7i2fSgGMLuqabxJeuQoycqjsTljP3l92rvqsP22qIyepT0bZbA
         gvptIMj053OEKWa6tyywQAJ+1G+I/xdn7IzlCEVe4KCxJHFeqO1bKhlscrNAuqJcschK
         9N4vxK6HN49I6aGHQqX53DW83E7GLdnfAN5ueKdc8skrBOF/BX4Z/NwVS7qgU8MYYoua
         32+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710919820; x=1711524620;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kfPNJaVNrRLUgq1G0xyXFXGJmVwgXHUj6PPli//ssF0=;
        b=creJNNj9xZKJD81Av7XgPy4JFrP9p8XNCRns3KdM/+Aheli8mLVvZE1QQtvaNqf8oY
         jfnLq8ZCYm1gvv9EKRvbO3S/HwqXQgcC08VZHBo1NCbPdkLYNDqlAAxDY+/NgHq9LCHj
         ifGWreWP9OCfsr5skyYUOinIqb3UfN8ql8JVAbDBSP9Q+tMYGRVijyp21IdWVd1mcXi5
         1zMHZiUm2zp1XA7iu+nMtSi3o0Zgf5fHgsnbQ2OebgFbzyNdhtNDnSAD9KbfeZWHHVWB
         9sxMbqpMAPG2m4CGLWfc8Y9yS8Y1LITqhKCcsiS6X2GxIQJYg2yNxJQ5/oy4yjH5382i
         lTMw==
X-Forwarded-Encrypted: i=1; AJvYcCVGwiFqRqFz6NOPzFuyIAnY8jibRcGGWzlUxJHDsuMn9aP+bvhCwCDsGGFZGq1VqbxU66bxbhtdgadhP0kPJF7vtC7+4GbfukbSBnbSw/0=
X-Gm-Message-State: AOJu0YyqJKsu4J/VuZH0zfzNWXvlA1WH0B1Go+VhQENxefKyhLgOKD7M
	790rhpXNhmRlYxpsyZMWrhsDs+QjHnjWxqy1zy6YvfkG4I/dK8T5nXWwHgBB6Q==
X-Google-Smtp-Source: AGHT+IHA9oLQQNfw4VCNq4/k5zzyN2AAeQPRvltWYQ/CghH8ATqqwsZccww7m8FsQ4x0pI59EviI+A==
X-Received: by 2002:a05:6402:3605:b0:56b:83ff:e044 with SMTP id el5-20020a056402360500b0056b83ffe044mr594699edb.1.1710919820154;
        Wed, 20 Mar 2024 00:30:20 -0700 (PDT)
Message-ID: <373304eb-ff38-411d-becf-99fc7c170ccc@suse.com>
Date: Wed, 20 Mar 2024 08:30:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/1] tools/xenstore: Add missing XENCONSOLED_ARGS
 variable
Content-Language: en-US
To: =?UTF-8?Q?Rafa=C3=ABl_Kooi?= <rafael_andreas@hotmail.com>
References: <cover.1710892585.git.rafael_andreas@hotmail.com>
 <DU0P192MB170046CFB3F2977E45B08E3EE3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Cc: dragoon@waifu-technologies.moe, xen-devel@lists.xenproject.org
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
In-Reply-To: <DU0P192MB170046CFB3F2977E45B08E3EE3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2024 08:15, Rafaël Kooi wrote:
> The systemd xenconsoled.service uses the XENCONSOLED_ARGS variable, but
> it was missing from the xencommons file.

As to the title prefix: How does xenstore come into play here?

Jan

