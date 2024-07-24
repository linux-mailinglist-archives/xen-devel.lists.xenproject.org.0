Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958E393B458
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764402.1174840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWeKX-00032p-Pi; Wed, 24 Jul 2024 15:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764402.1174840; Wed, 24 Jul 2024 15:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWeKX-00030r-Ln; Wed, 24 Jul 2024 15:55:05 +0000
Received: by outflank-mailman (input) for mailman id 764402;
 Wed, 24 Jul 2024 15:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWeKW-00030j-SB
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:55:04 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16ffb693-49d5-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 17:55:03 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-58b0beaf703so5901217a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:55:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a92dddccdsm199841566b.79.2024.07.24.08.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 08:55:02 -0700 (PDT)
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
X-Inumbo-ID: 16ffb693-49d5-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721836503; x=1722441303; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WAJV7AqRHNU+zRboJgZu1Kleq20H7Ajj8B/uuEFbouA=;
        b=YjTJdI6wf4K9M7dM7vlSXENO8lpNFPqqOBLbBlXMTzwGIarOkXeZkOkELil6+7C/Tl
         bcjlIYHpSXKWCmP1ddq9K8N3GQlD03OaHIIKdJ1RFBP0rBHFiD2QPVyKYFce0/cKue6y
         eLDArzreLT3oqQrrf/DL30kS0P5WWqJ6tKsybU7tjTNB9hLXoa+ggCkeyCfzQHjSfxb8
         M/8huQh2P994lJA4d0mPuOkL547huER1hCQ6tyhobnPzKNh+/dEmG8CeKDB4QFafypQ3
         txiF1ZAJys/QGpTJ2QAKX+s5rtcnzisyO8O94Ohkalqd1VgWVsJ/pAn+i3uADwht5f8C
         5rBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721836503; x=1722441303;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAJV7AqRHNU+zRboJgZu1Kleq20H7Ajj8B/uuEFbouA=;
        b=C6d1GK+HMfuIsWGFtENFhZxNcz8wWGwDjh6+xzHBAad6FK+JfEo4gWCFtHWLFE8+DA
         X1QJXw4Hbik6XZrrMwtSwI2Mqa8F5+X5miCUhig7+fgAFvQoE3E1IZhKfxBZrIlqAv2l
         mIyim1eUd1ktLmg4EeBJEDfmfHV9Q04VjyETaZczsGzuIBCDhPXHFQ18vu8FDF3eLK1q
         rt2fm0ikls3x3QRtvQsB8ar/OTLz+mbIbJ3qh5JYbBw1nCvKkd0scg/HB3FDXxYk3yw/
         pcfrZAzmv3IeR+VW0vacAH2Yo/vPb3C8eoL+Bk1kxqLhbUGi9PB8V2IOn6N5dAAIoJZj
         KVhA==
X-Forwarded-Encrypted: i=1; AJvYcCX6HQB+J2svXpr6H97oO2uGu2WPqqFvorPu3/0ClcXvEk5SR/WxDUnpYzAjGSiDgJC+taRfWSlPygdaHAVQ1jUbSxt/f/g+u8kLwHMzf10=
X-Gm-Message-State: AOJu0Yyl0pcySvqujYUJ0eXabd55H2l2owZhC2h+3ruHWp3ZcMUS6JTV
	wefQhN9upHs1DXR3MhXaA/91hOPGMsWIC+pNimZU4lLU7sbDKQaagMSW6i/+iA==
X-Google-Smtp-Source: AGHT+IHi+Ul9tMRm+NRwLJAHB96rx47aulaf5BGkLVpMCuguQLwVq22lZDGR0JiDfkbrqiQuOp69Fw==
X-Received: by 2002:a17:907:728b:b0:a77:b4e3:4fca with SMTP id a640c23a62f3a-a7a87bf3d94mr464174666b.9.1721836503119;
        Wed, 24 Jul 2024 08:55:03 -0700 (PDT)
Message-ID: <3b9a9dcc-dd85-4c0e-8880-f584aa3df17a@suse.com>
Date: Wed, 24 Jul 2024 17:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 09/17] xen: address violations of MISRA C:2012
 Directive 4.10
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
 <8776f366569c1e789eaaabc8d9204d11abbf1a48.1721720583.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <8776f366569c1e789eaaabc8d9204d11abbf1a48.1721720583.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 10:15, Alessandro Zucchelli wrote:
> From: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Amend inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Inclusion guards must appear at the beginning of the headers
> (comments are permitted anywhere) and the #if directive cannot
> be used for other checks.
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Provided the description of the scheme itself goes in first:
Acked-by: Jan Beulich <jbeulich@suse.com>

> ---
> Changes in v5:
> - edit inclusion guards, according to the feedback received

Given how exactly the guards look like is the main aspect here, I
question the retaining of earlier R-b with changes like what is said
here.

Jan

