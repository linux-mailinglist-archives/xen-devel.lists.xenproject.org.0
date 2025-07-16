Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D7DB0787B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 16:47:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045308.1415395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3Pc-0007zF-Ae; Wed, 16 Jul 2025 14:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045308.1415395; Wed, 16 Jul 2025 14:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3Pc-0007wA-7p; Wed, 16 Jul 2025 14:47:12 +0000
Received: by outflank-mailman (input) for mailman id 1045308;
 Wed, 16 Jul 2025 14:47:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc3Pa-0007w4-Ky
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 14:47:10 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c02db91d-6253-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 16:47:09 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so3761922f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 07:47:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4323daesm126481325ad.139.2025.07.16.07.47.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 07:47:08 -0700 (PDT)
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
X-Inumbo-ID: c02db91d-6253-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752677229; x=1753282029; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YeqH7GeVFUndsb+NLUaXQWyIOxd8tZQNZZju/PCbdCU=;
        b=M9hf3XtWRa6Sf9JhlYyptf1t8BAyyK5hfvDcXy+SxQrzl9SXB8m8ScQdKTGvb0ou8L
         0JrYFXsAZRQTh8QHgupN7rIZvqlW5GGf1DY5SHEwrbDF2Txjau4gFqpBHOcve0nH8/xm
         I3Fqo0nVQTfDSleI7V2Zf1F5bH6JQUOGIAy1lO0l4wNNq7+WHcr3x5IYNBbo0jy8u2br
         9k31M0qn2+y92nurSrRcSLGOg0im0uSAFWSia426OBKgg0fJc2PXc6znL+UGy45aG0Qb
         PgO1HwPYMqhVCwEQRDs0ScT0SZ+E2FCKzApXglGhm36+U16T7mLGE3GRNRR1DVS0oMyR
         hK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677229; x=1753282029;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeqH7GeVFUndsb+NLUaXQWyIOxd8tZQNZZju/PCbdCU=;
        b=SGPsoO/EGpuxXxt8hcvxHk05hrYZKAE+jtQuB4rQG0AKC2jujUFv3RNANcIW4wPIKS
         3JVTILqhqYUvPEb1Yas3qXA1ww6/dCQ7I/HueA31OE/npUFDFOZrL6EB2V4eiACSbTMK
         OXTwKMb7LMz6izP19cSdZ2w+ccODIeLoYdKLzEzxmNjv+JoSXHu907UKeSPTh8FY+S7+
         lGzmlQKgj5CMSbZ0sekF5jRrVb+L5JJZBp+RnZztGpAChEbIUSq7pGbosx2+5Hqc9Rn9
         heRga5LcL8JOiC5xXJLLvJSo7YgYaFJeQ+4DDhnYLNGnwkPgs4lTM3oQ8EgAKd6QgPA+
         547A==
X-Forwarded-Encrypted: i=1; AJvYcCUmYzfAqZWUWEUBN8/hxtPpRNx3eMFdrYi8skrvaM+8KSgfcdIVApuDI/LMuzNX6LRwPAsoWyXQkGw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUDYiK7F4Oy92KmUJMWbIT5pOlZ5qFiNSL7K/cQLY7gMUn8t7U
	97KDqlbdwzLvYUM6PsfZxA5cO75S80Lya63YkopuPYzewXQZTxr/1Q736zQ4ogQqlA==
X-Gm-Gg: ASbGncuxARBZkDlzU14UaAvGojIqj/xuY9/2aG8Rce93Ullaejd49lmmc0VmhQmAofv
	9Pgpx1BEufhdk5UuZrSZrSXRySnOI5ZzsY4GMjNiqmJXy7TBE9MlXSYyT7REXPYppN64I1Ghy2p
	fU84VWi4i+KXCa0bfDhnDqHX3vF39UlZPSafVOqbkKs2/x3Gm0cimyrlzFKkVda/w3horrhDa7g
	/lwl8VU64PRgIw3EXrJ69JGrIMkTBueEIRFwaK1EyOY3+Cn4lruTVyLNf6tc19zkbB+geP16RB+
	9Ec49JPMJ3OIRkOPLVXu8Z+Pe39ZrxJAJrv2tXw+oOzKiKFOLyCNgH1uK4xhMjOx9K7Mjq/IWI3
	rYtx+Ma1jyq44SBOHBdpLWLot6O9bzMjNrOLsGbIDihas53PA4i8qXz9h11+EfZ0lKPdr8o6lu7
	zWD3KKGQKn5v5kqihYbw==
X-Google-Smtp-Source: AGHT+IEGbeOygEvTNPD8cdLizy/enML2xIBUzZwp7yVkQ3wo2iJWEGzoZ7IQnM1yC8uI3NOlXdptmA==
X-Received: by 2002:a05:6000:230e:b0:3b3:9cb4:43f9 with SMTP id ffacd0b85a97d-3b60e4d0135mr2539587f8f.16.1752677228891;
        Wed, 16 Jul 2025 07:47:08 -0700 (PDT)
Message-ID: <f6c00d62-e68b-4022-9573-089683aca260@suse.com>
Date: Wed, 16 Jul 2025 16:47:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/19] x86/cpufreq: continue looping other than -EBUSY
 or successful return
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-5-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-5-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:50, Penny Zheng wrote:
> Right now, only when we failed cpufreq driver registration with -ENODEV, we get
> the chance to try the fallback option.
> There are two code path erroring out other than -ENODEV in cpufreq driver
> registration: one is when the driver itself is broken, like missing mandatory
> hooks, cpufreq_register_driver() will fail with -EINVAL, in which we shall
> be able to try the fallback option, and the other is -EBUSY due to repeated
> registration, in which we shall just exit the loop.
> 
> So in conclusion, when error code is -EBUSY or successful return, both
> indicating a proper driver is already registered, we shall bail the loop,
> other than that, we shall continue to try the fallback option.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
(and perhaps also a Reported-by: or Suggested-by: ...)

