Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2F79A1A39
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 07:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820382.1233885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1JIo-0002HL-9T; Thu, 17 Oct 2024 05:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820382.1233885; Thu, 17 Oct 2024 05:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1JIo-0002EF-6q; Thu, 17 Oct 2024 05:44:02 +0000
Received: by outflank-mailman (input) for mailman id 820382;
 Thu, 17 Oct 2024 05:44:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rwie=RN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t1JIm-0002E9-KV
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 05:44:00 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce936d94-8c4a-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 07:43:59 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37d51055097so338738f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 22:43:59 -0700 (PDT)
Received: from ?IPV6:2003:ca:b721:c8a3:a0aa:3800:312c:4957?
 (p200300cab721c8a3a0aa3800312c4957.dip0.t-ipconnect.de.
 [2003:ca:b721:c8a3:a0aa:3800:312c:4957])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fc3d6afsm6107515f8f.99.2024.10.16.22.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 22:43:58 -0700 (PDT)
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
X-Inumbo-ID: ce936d94-8c4a-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729143839; x=1729748639; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6zkQIIwzYIRwp+LUOZJITxncw14i1Ey5xaPR2IZVMlE=;
        b=XcSqxubPUzhwdfZehi7sy+prW3krYDwGteHRmPzZiaFWF82AEZO5oWaKDeGrcDaq/c
         eBw+YKiV0/OjPrjRyIFcMOQ9szzEZecqiWVfBHK9ITZN1zGXxYpsKE35kMsLt0BR7gya
         F+PKph0moDFI0LaCQlRD1ygnuikLpjoSEp0yHBUkSKfU6KPyJ5KdAyfsshiOjPWUwhMf
         qrWpSyKK4/DSSnUvGgSdKilL0FZSmlOI8OTHovXiE00mNYl+b4sMZA+1Pred1MvYIk6j
         3YiJa9SwLn7bZBcqyVfw7rNo6dwiO48pEHE8jQiPo0QzJO7ckMcNTQx+Y8j/BZ7yYyee
         Wjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729143839; x=1729748639;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zkQIIwzYIRwp+LUOZJITxncw14i1Ey5xaPR2IZVMlE=;
        b=kJF8ZBaid0+IpePgros/1zxWOv5orV0wQ5e6RO8V6IgDIy8ggSmknz0ZThVDgQJ9iV
         yGAHfKNeEkFBjIHbb60GTd0ZDF8shMGhqCGMqew2Fkt8hg4zzx3gW6F0k3E+eUh5Vbxa
         7CFQP3nBRTbLO5V8+DAMSqqjAyzaegvPn9RoyOvsl88FU2rWeZ2lLlof+/n4CZ8SJOJA
         HwRcjV+MpZGuvCATIp+XulUNrfAa5RDCWTwXilS2EHEgHMuGRgAz9uboK4KDwl9/uFxH
         S1cH56Q8AJbo3+KzVRherG249+do9vvnFoeAn8Iz/LeeWm5gfyDA7ots+1c9uhekYNwt
         1VLg==
X-Forwarded-Encrypted: i=1; AJvYcCWWqMxFQHaEF8vL/vc2bfIlvrawj8lNNZRUTzLyDAPxM+FbMCqE1wLWGArEs0aLfke+Fq7gFKeKVyg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBmEg+SWsmiHlNA1BhqNft4Sya0ogbuv0qmtzKAVGggxd7CFWz
	gxifTyEAqC3tA0OTd9tg2LYZocWX61Q5LnvNSxF8disM9PtT3B3UjBRPBcb+zw==
X-Google-Smtp-Source: AGHT+IFZyG+hycCeH2Ah4V6tJmfldugaoHjvEPjp05+zAbUmQenrF3rMbW/RGgS1/c9tVVxmV/6mRg==
X-Received: by 2002:adf:f686:0:b0:37d:5232:a963 with SMTP id ffacd0b85a97d-37d5fef48abmr11075781f8f.14.1729143838872;
        Wed, 16 Oct 2024 22:43:58 -0700 (PDT)
Message-ID: <0f67b7b5-b309-448b-a721-aedc3c77d63e@suse.com>
Date: Thu, 17 Oct 2024 07:43:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: update documentation of reboot param
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20241016131813.801242-1-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20241016131813.801242-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.10.2024 15:17, Marek Marczykowski-Górecki wrote:
> Reflect changed default mode, and fix formatting of `efi` value.
> 
> Fixes: d81dd3130351 ("x86/shutdown: change default reboot method preference")
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



