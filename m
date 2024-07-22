Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26278938DD7
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 13:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761669.1171674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqpW-0002v1-J6; Mon, 22 Jul 2024 11:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761669.1171674; Mon, 22 Jul 2024 11:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqpW-0002sn-GP; Mon, 22 Jul 2024 11:03:46 +0000
Received: by outflank-mailman (input) for mailman id 761669;
 Mon, 22 Jul 2024 11:03:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVqpV-0002sF-4A
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 11:03:45 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f2341bc-481a-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 13:03:43 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52f04150796so979485e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 04:03:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30a4d6bf8sm5941110a12.18.2024.07.22.04.03.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 04:03:42 -0700 (PDT)
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
X-Inumbo-ID: 0f2341bc-481a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721646223; x=1722251023; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=utl5XZdwp1pLAWSJaQtWWfeUODwZdmjCm4sfCuJUjC8=;
        b=UIz1pRnp2vu8P2RXO5hFl4RA/2n67TpZzssJ0innVbJDKoxbnBHJMBlo7SkD0n00kn
         /NCX+s7xJCgzFYpAmJcl3x089/6MjtgOkhkGVE61FDCMQfkdtvtR3pvJ8rXF0WWBBN0x
         Fs6OStjy2OPJnrB/nET7S4cWd9CTj23RX9iAL+NCmkhWtxjg4zfk/4SM5C0DeMpXsQJi
         JMtoLVpuOE0CtQsPSl9ojorEshDR421TiJ3yI7om+yBWZQXDVHI+mCY68GJLccTi2Ipc
         ZAtHBXhBMXaFTn2QipR10gNZWxVEQWsQ+HyIohse8svVgs6SBKvzVVANCrDit9L7FxiL
         uGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721646223; x=1722251023;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utl5XZdwp1pLAWSJaQtWWfeUODwZdmjCm4sfCuJUjC8=;
        b=xMsbWZmW7ruyRlnXzWYABIBzPWGWJ7eGoXGfPMXAh+YlFset8kQpuLvyEMCBrKwdzV
         4ccna31RwgfKhjAmdg0caqmdmFYaPstOiWHMVRHwfUa5MmpX9xeaVF7KmjDUDjmzmycZ
         Of6GjjFiUBTS37ou0oVGS2SYQbDAnvrT6nfh8epJWQ2sSqYC3A00rIm2djX/YbBEPxVL
         D+GQ7fsCPrIMyC9Mu1yq5E38RI0MLR0mg1gX2eVJ20xqhLGTt/FakdK0nYXbsH4nvVT8
         UUKG+kfdjVRwIMyFsmrQrzpy7bCoTSWRm6mrHi7JSxFWGJBLE39D7ZKCdSOfiFs2dgGa
         HF9w==
X-Forwarded-Encrypted: i=1; AJvYcCVXncd3NGTGJqlio4hqLnFBukQOdHTuzteCZ68k2lSyPV5oj2xYSzeTscAXvus1DZdq+AMVaZxlTug4oe52hnj/p6kCaJ47qTq9g95suaw=
X-Gm-Message-State: AOJu0YwaUzzxXrPGahv7BvbbBgIyrAGiF9y5nklv/f5VxN4UuTNXe/w9
	sefYwWFKC+89+z8GknXAbn2+rXCf3nNgH8kHuCotAZwTT30Ke7vv/GgoYX51jvbTpjv+wzM8HFM
	=
X-Google-Smtp-Source: AGHT+IG7y5XZSCgGdLGd7R+Rm0uhb0boLZaEfLFNhBAhu/UrdcT6F6RY1UKT6DuBcZ2lxnggJmb3hQ==
X-Received: by 2002:a05:6512:31c9:b0:52c:e312:2082 with SMTP id 2adb3069b0e04-52efb810895mr4345903e87.54.1721646222726;
        Mon, 22 Jul 2024 04:03:42 -0700 (PDT)
Message-ID: <7f0ffa65-2931-4335-b926-7c16ac3e3519@suse.com>
Date: Mon, 22 Jul 2024 13:03:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/list: add LIST_HEAD_RO_AFTER_INIT
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.8c9972382c46fce22682bcec2ee28fe2501dd18f.1721356393.git-series.marmarek@invisiblethingslab.com>
 <1994087de901c7520db559724ae95b2b0e1b1f5d.1721356393.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <1994087de901c7520db559724ae95b2b0e1b1f5d.1721356393.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.07.2024 04:33, Marek Marczykowski-Górecki wrote:
> Similar to LIST_HEAD_READ_MOSTLY.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



