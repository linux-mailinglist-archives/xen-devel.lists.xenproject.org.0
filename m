Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B930B25DB1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 09:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080953.1441117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umSYb-0003jj-8F; Thu, 14 Aug 2025 07:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080953.1441117; Thu, 14 Aug 2025 07:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umSYb-0003hE-5e; Thu, 14 Aug 2025 07:39:29 +0000
Received: by outflank-mailman (input) for mailman id 1080953;
 Thu, 14 Aug 2025 07:39:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umSYZ-0003h8-8L
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 07:39:27 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cda515e1-78e1-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 09:39:26 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so81243966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 00:39:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21b0d0sm2502545666b.107.2025.08.14.00.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 00:39:25 -0700 (PDT)
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
X-Inumbo-ID: cda515e1-78e1-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755157166; x=1755761966; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9CnYmWfPzylu9pHC5FX/R1vhS+1vHEBkIpKoCjxOZoc=;
        b=bRNTLi0cX5k5n9EEYvbYfHYj4VtUYpAyvxuNOqke81nOr70Lc2AZiqvEeP1c0MrjSP
         nbmPa2Z/Fj0F9HUE7cekwyYEGVe1/839F58IpB+ZfbfZ1m0kHUXtbSxRQpsIEkQ+dyOC
         eOzF4lgUT5QATZ6/Wce3tX8i/sxkzZOrvtqe4SgXshlDpuw8Fbv/wW5aRET9qyiXqifv
         GOSVIuNUZllkHh69hDMgq/4EHVFO6vmlTSP9vNvF2D+CE12oN71kE20/Y09aNtMLJIrE
         mmYZiBnOC9LAoCE0tA0MxtwQx11bqvD5HF2ijho58eVShmE6lRw8lO2HYuqx81GPmKXF
         zChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755157166; x=1755761966;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CnYmWfPzylu9pHC5FX/R1vhS+1vHEBkIpKoCjxOZoc=;
        b=IRshbMcRq271lmawsC9B3MGUi49Xvvs9J5xf0RQv0GhhY/XDvJ1V6cCSfOIIRxhy3O
         1HI+H2gD8/x7Cq6P15p8G8ECt49QR6OJBJ2Y2ZTKsta3x6yw3aPOZnaqRdDK4WbZNxX8
         c/a+jTVCcf45ptWTFnSndck8Ry7ubdI411ALjyEWo/CH7Gild6e+99UPdEnIbk7yDY6R
         smKWU0pV3r0RBfIUw24SrYuQYIC4pvd42FdiZ1eqOkuHkauQ9q3S5JhAtYCr7gJwLOie
         V1cgfYXOTlVb4ivthF1IZyS6Yp4s7jWquO6xsGXsC6Y2eso7JTsSPqGMJEURbwniB/01
         oNTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUidp6Hb2UHc49Ho/Afqzbh5H6D214bTZcBIJFKsLMygiqF4muwBainX7RjhKusNgR/5FlyS2IJE84=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/buvcuNgRayEM9aNCI5McUwSwMwadR+vieePCbxuASaE0AQIY
	zUPGDacdHKVm+Ok9q08nCh8OZkXKkzPX+nzUJRIb7nWFWqFEu4sS4h/LKIK5zto4l1BiuobAXdm
	lAho=
X-Gm-Gg: ASbGncvslYVEPulsLK5slgrRFzocTA1vKPgst6W74rVt7mF9KKpuqzZsBXzBo3Euld0
	70zPn21bK5f3p9inf++0Er3c/b38ML+qX5+b1b9oLomQzGRAjEilwgdgmj3VfLKYH+jseto/lgP
	sqens5L21DOdLKzL+2eNKnnR+0E3ZEzoxjbfQYC2fqljJ//8szng5zfqHdsdSeNKVnfF7pknQRi
	qcwgqO7g+fQfWjDO9E/2txQ4+E7QRAqyAN5sx3yoZhNHZpf00CBfk34nxOvkVrSTAW+Hmx0wGPX
	qHSwYYmOyo29PBCNFtvvh/kkMr9V9Wz6rOzlCOsbpwpcQAQbVw5J2zeuLA1FmDTstXAbNqvpNU3
	D/sNHssGhiJbOpF82iVs/jJC3doihpPrrrrItGvjFeBWKBW0C42R/pmeG4LR16FVmCsjo0vmm22
	v7/+oxQkM=
X-Google-Smtp-Source: AGHT+IG5dzwH7pZHxyjrQwyLzJQBp30KZKhXY7sH97kKqpNYWX0DX3mwYxFymNb3O/Ai7UG/rxY+Qg==
X-Received: by 2002:a17:907:3c89:b0:af9:2b35:a8b with SMTP id a640c23a62f3a-afcb93a2721mr181029166b.3.1755157165707;
        Thu, 14 Aug 2025 00:39:25 -0700 (PDT)
Message-ID: <91e52887-bfca-4b66-98c9-a508e6e5709f@suse.com>
Date: Thu, 14 Aug 2025 09:39:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Drop workaround for pre-GCC-5 PIC issue
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20250813230525.2435414-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250813230525.2435414-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2025 01:05, Andrew Cooper wrote:
> GCC 5.1 is the minimum supported toolchain version now.  Drop the workaround
> for the PIC hard register in earlier versions.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


