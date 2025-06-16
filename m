Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B307ADB6AC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 18:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017501.1394490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRCd7-0006Di-Vw; Mon, 16 Jun 2025 16:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017501.1394490; Mon, 16 Jun 2025 16:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRCd7-0006CJ-Sr; Mon, 16 Jun 2025 16:24:17 +0000
Received: by outflank-mailman (input) for mailman id 1017501;
 Mon, 16 Jun 2025 16:24:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRCd5-0006CB-TF
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 16:24:15 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52233d1c-4ace-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 18:24:05 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a35c894313so5378689f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 09:24:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748a6b1d620sm4133340b3a.116.2025.06.16.09.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 09:24:12 -0700 (PDT)
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
X-Inumbo-ID: 52233d1c-4ace-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750091053; x=1750695853; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eSCJ7/mkL3BvXuKI7zkoRMrFgPTCvPYO/2N1D8SOp9I=;
        b=ZLBPwPpy6LyaWNClZPBbHfp0aPYWfhnV1OVGdm8mwGpgCoRdqiziTkSJ3wiXkJrHlA
         W1S/r87PXUep6KYzQpTtT8rxuU5DZDlqG8dYuuDqzgYUhghLJVhFaPTpbh7XyXtvYEG0
         c2jfG9h7c1V4Y7ijE5M+s42apn17h+v/+lH+FEvwCnA+Z32yHJbIk6hoPWIxu2Rb9zPC
         /S6NZ0abImj2dHrjooOPfblkJUviqMluTCwOKnB7o2fdA2ehVpVmwdbYGg2Fqj4kNU34
         9wooI4bWnfsxbEjD7NIMioDneCxIkMa3cFY2PZtU5Ae4v4Zb2axHJhEX1jC+SSFunuct
         ItFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750091053; x=1750695853;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSCJ7/mkL3BvXuKI7zkoRMrFgPTCvPYO/2N1D8SOp9I=;
        b=mjcgpBQF4OrLR/ays8ifrt76XVn63dv16hkKGY6kdzZWDDAAIHwCGdB5Bix8SefAyp
         MPTPayIAam7/wowJglW/9WV6CHYbyoewaOncdOASdgrUuSinb/wVnf/1wsghVMkzav3u
         ptRPfsy0QfvETsyr5LojX0g75AQrqUsjzjKbiMdJDlR4XOMiFpj3FRRoqYqIZr0c6ttw
         wdbxNDPKzrC0MdDsybumfkwPOhLVcLFf9ttly2poyixiLMVn8DBHcMAHluHTiqQ85/Cy
         2jDh3A8dZeiZ3rVnPM6/UDKgRKHjwq4LXTA5UmAhOfCKknq6XpZsC7Akc4AgykL+xBrv
         jQaA==
X-Forwarded-Encrypted: i=1; AJvYcCXZixBKxS06T+iWxuLjd3BhEp7xf3DNdL0xNURLQDZ9EUDXtMWd72PUVPLbzeul4K83qg62NL4ccxo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzTmgIT/+aB/ixowpLMwPlaOdKbmcvr4btYcpU5qnrLbv+OwsSH
	AEtKBlTjo3ED7u+lE5K7djq88ajXD1CK1Ic3r7S0BJCk0GET6fAPY+BHc/dzu13aww==
X-Gm-Gg: ASbGnctEpp8KajFo/GRVwYxgVQGNPIcGqde374qVrqZnDIGOpSQj0RxIKjQ89BcPBxz
	sGUa/Ssp3maeMHW8r4/fQma5sta1MvV/uCOY7rs0e44O/dlYa6w5x+P59WGmI6zJ9hbp8DIYmrK
	Zd5pdCNo9sUnblJ8ipH6S2tibeZY399y6pURrIOe6vH5puvxBGnlgAaezgefmNmGEN+pxjUCfxG
	ivPXEXaS9cMIv7x8l2wItoL6yhIME8a1Uicuqm5pUm7vh4m5Q84NsfUthXH6Fk06oeG4sI6H0z/
	uxIAW5UOsyOpKcM36b8BuFA6u49nsetvVV7szB2/liWzf65vi9uJBt5u+iNLwOh1BCinw1GOn9H
	4JjAj8f/yC5pkigwp3F/RxnZDwhPxpbzzQ8Iht4zm1qJe0hrrQeWTF55o0w==
X-Google-Smtp-Source: AGHT+IH16MFIwKXm9NacQxcfC73Pa0ChKE7VbvK5ZZon+cljZ0ZTU1wUIHfm3XjFZVlZFHNTH6G98A==
X-Received: by 2002:a05:6000:230e:b0:3a4:e740:cd72 with SMTP id ffacd0b85a97d-3a572396df6mr8229313f8f.13.1750091053379;
        Mon, 16 Jun 2025 09:24:13 -0700 (PDT)
Message-ID: <d1d9ce07-a74f-4a4f-af56-b5bc07b24737@suse.com>
Date: Mon, 16 Jun 2025 18:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/18] xen/cpufreq: normalize hwp driver check with
 hwp_active()
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-14-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-14-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> Instead of using hypercall passing parameter to identify hwp driver,
> we shall use hwp_active(). Also, we've already used hwp_active() in
> do_get_pm_info() in the same file to do hwp driver check, it's
> better syncing with same way.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Is this okay to apply ahead of most/all of the earlier patches?

Jan

