Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BFF8427C2
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 16:15:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673560.1047945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpp5-0007f9-7v; Tue, 30 Jan 2024 15:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673560.1047945; Tue, 30 Jan 2024 15:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpp5-0007cm-4p; Tue, 30 Jan 2024 15:14:51 +0000
Received: by outflank-mailman (input) for mailman id 673560;
 Tue, 30 Jan 2024 15:14:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFHt=JI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rUpp4-0007cg-An
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 15:14:50 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f6c1003-bf82-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 16:14:49 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5111ef545bfso972153e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 07:14:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c1d1600b0040ef95e1c78sm5374679wms.3.2024.01.30.07.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 07:14:48 -0800 (PST)
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
X-Inumbo-ID: 4f6c1003-bf82-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706627689; x=1707232489; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5qKpPPyT2bHgLKzcgC0ndj7WAiMHlxSTR3Qvxg11KY=;
        b=C26t13S8pfNCLjQ90mYO4mxqiUDEzejn2JjfQRihGQnPYSnu8IU5S8O0aPzOBHk7Xi
         B1CZejqb0ODhI4aEy5njB61cz/wLw9UpSvg3SyDVVwaL8zn3iNcf39bVT9n3yUphhRoq
         5ns4aA7w1mTOkxcRRPMW7rn18H2oqlLoNLX13GPWTVf2hd3R0cUQGeuPzlHvoIYmcjeS
         4D1iXwt9TN9VX6If/5Gop4AyQB4MSRwlXsUbEcprLIJsQD9fAl34xi2YPwFeO0DSEoti
         mq9bFzzwlN4LVYN+OkqUH5/cRdtifk6RZEfkuPuGOx9ukUsV261a/EyE0Ty1BQIqj8g0
         XwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706627689; x=1707232489;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H5qKpPPyT2bHgLKzcgC0ndj7WAiMHlxSTR3Qvxg11KY=;
        b=k5e9Jd+J5JNwMmyyR6OiSWQ+T9UKPuRunY0m6EPLevFY2XcEm+W22J6HLApVK4XkUD
         +nZeU+QU+mk+Cmt515ejCIp16D03bAK2hdd3Zz90Hm6tOa2/zB4bhxGgqlqJIPEqD4NU
         wYk6mEwfxTA8YBIIEBevNmWifUdJfe7kI2O6FAIE2eU2rnkwox/TxTBT407OkOm3+dnN
         cm5J6ViWs7MYJmPGP/T2p93Qkc6Q2ibRfGlHNGr6usKexvAZ/P+9/A1HR43ForonmZVC
         5FoZxBpii7sopwvlv6Sp0tz07h0Zk1s2Qnwgcb+nY6qnmmlZKaCI9blulV1XHq/ZnRsn
         ArOA==
X-Gm-Message-State: AOJu0Yz3DM1UAg2+YxrgqCC6o7FQd7JJERHbhCfv/3+nkX2PRhsJzH5d
	jWJ4Paq0l5ndTr2uOvmnPPBdHPch440edZ7vip5OFzqBSPOA6ciDasYefek/Iw==
X-Google-Smtp-Source: AGHT+IHdsw4vRTsvm0uN9cptYYIqbBiAKrlsD0Qkih3iY9Fe0MeLsuYRUga1RxXZjTEk+wglUj5HHQ==
X-Received: by 2002:a05:6512:3f8:b0:50e:76d1:b9c5 with SMTP id n24-20020a05651203f800b0050e76d1b9c5mr5433212lfq.60.1706627689044;
        Tue, 30 Jan 2024 07:14:49 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUoUmhPUOegRKBfEEb/Us8ZKqL3n8JKxN8x+TxSbHTalXEwnJKsAmyrpiseKDcZS5pF+yDtOsboU1fFgJKZO/rU31bOO9ImUhkngCc8gimgcFUTW7KB2I77wMc=
Message-ID: <05d63a0e-d3e3-407a-bf9a-4179f57a8a53@suse.com>
Date: Tue, 30 Jan 2024 16:14:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Add braces in reloc.c
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240130144838.4119329-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240130144838.4119329-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 15:48, Andrew Cooper wrote:
> 107 lines is an unreasonably large switch statement to live inside a
> brace-less for loop.  Drop the comment that's clumsily trying to cover the
> fact that this logic has wrong-looking indentation.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



