Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C900BAEAEBD
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 08:10:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027281.1401985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV2HR-0003ro-Fc; Fri, 27 Jun 2025 06:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027281.1401985; Fri, 27 Jun 2025 06:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV2HR-0003pP-CM; Fri, 27 Jun 2025 06:09:45 +0000
Received: by outflank-mailman (input) for mailman id 1027281;
 Fri, 27 Jun 2025 06:09:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uV2HQ-0003pJ-FW
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 06:09:44 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50d0f598-531d-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 08:09:42 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-453647147c6so19390555e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 23:09:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af55c6a45sm1381758b3a.114.2025.06.26.23.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 23:09:41 -0700 (PDT)
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
X-Inumbo-ID: 50d0f598-531d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751004582; x=1751609382; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o4v0TGDYWLzd0Emz6k3M4SJ7ptTgDVOJ7qukt+movY8=;
        b=M6dkQpoK/iN6Zygych/lo794tKvrY0x+BbZuhE/4iITeb6aZTki1UTDBUrYdVkHKKs
         zdYGuIcWXCWtyBAxNCrCh/v6omvNhtjlgdjUwt8OI1ykryrOL8Ysq0agoVT0hfrvI4si
         xQMPNd+yUpwPSTW9IQWXpkGOLWb9dCuh8huneSMdy4lM1rEXvmDu4uhiBYiECxGRvWW4
         6foyySRkmcMVSZZB4PO7CoxWWb+gMvwZ3tKZeN5nSlWSeccbePh/tvjtmSskf3MT3lOQ
         iJuYbXKK3inZXU9AZNVYTPth5QCTimuYnseVc2Npk6+VZDplDmjp7lOTC7qZq38pfBKL
         /JwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751004582; x=1751609382;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4v0TGDYWLzd0Emz6k3M4SJ7ptTgDVOJ7qukt+movY8=;
        b=ZyKe7+RmhSw3uI4DfR6Stt0zuV9oCFHAErZuYP+vqJz0DOP3IEn6AiprtyA+++fDSx
         xZdf3QTlKO3vse6USYwYVtyAio//e72CICdA0MtFuqAXVWP3lib3U0M9VOwUsf6CznBu
         qvi4f0rYi5ZA79iWObtRgu0YDlurhNi50ZkbReBukLk1cjIsAEmR3C2ARLPMjtCusixa
         ISPbmgH27v9Y6WSCigGrnBncQ9xnlScER46JymNf0zWv/kmaUwXgiNHDyIXWoZ46L2RT
         WLKv3ITsN1Yj3YQJr1xr9LDHcQmuyBGMvOgyxqFscs6Nh1z+ubSc0GILKdP8GqC5Tob7
         jAIA==
X-Gm-Message-State: AOJu0Yzc/JLaYARTTqNNwk6HF6PfoSRiKPgOReAafjoPX+IGEjyQcxGm
	mD2YGk32T1BP+4zMLfmDKUOCIWgORpDR3O6tvIJbm20vFBHDnO1dDlcvnl2HqMqISxWOkBd/33j
	Win0=
X-Gm-Gg: ASbGncsagcydSbxncJudGySb1LuVg6qhf5ByGIPFPJWVwL4ShsOOKPstE8gA2oCWyDb
	I+rNDVvbu3Vq1F+igr832/nFRREfdMS/O0L958MSkE/r+al9dA8lJwD4RIiwhubvpj8djGEoTM7
	QjuoIIlttdE+1vbgrulX3z6z7R9ZNv6sKR/cS7YlLfM4AwGaSeHxWslqW/ANarTtezs+7/BFWct
	XzB52vFjSPs6npkVaQNdilQCAhajd1F6EanXU6TA9Nhfpj2iloTx6o++mtKJz2yAJGgnIsBJPJY
	6m1vQ3OkwiYIJyRl3QQy7duXyQurB2QxuNPv/bwzAATF6r8lQeZZjIDw+FFGSrq1mY0FM4QUlPc
	8O+d7IEANY7QyZCdz8CaxHtNPotocwme3uaUUeBCO3Ue8bP0=
X-Google-Smtp-Source: AGHT+IG9Fo7MqDdZK0o6aBOCdzRJB8cjbK/6hkrLRBHKFn1Pq1X1jtm82JyQeAP9v42shQI3Fl5Tbw==
X-Received: by 2002:a05:6000:41d3:b0:3a5:52d4:5b39 with SMTP id ffacd0b85a97d-3a90d0d6a0fmr1525302f8f.8.1751004581802;
        Thu, 26 Jun 2025 23:09:41 -0700 (PDT)
Message-ID: <24664c4f-c703-47bf-9a5f-f2852e5983fd@suse.com>
Date: Fri, 27 Jun 2025 08:09:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: don't have gcc over-align data
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <f68299c4-7aba-4bac-a50c-182f3cb5686e@suse.com>
Content-Language: en-US
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
In-Reply-To: <f68299c4-7aba-4bac-a50c-182f3cb5686e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2025 11:04, Jan Beulich wrote:
> For (aiui) backwards compatibility reasons, gcc defaults to a mode that
> was the exclusive one up to gcc4.8, establishing 32-byte alignment for

Correction - it's 16- or 32-byte alignment, depending on size.

> aggregates larger than a certain size. We don't rely on such, and hence
> we can do with the psABI-compliant 16-byte alignment.
> 
> Savings in the build I'm looking at:
> - .data.ro_after_init		 344 bytes
> - .rodata + .data.rel.ro	1904 bytes
> - .init.*data.cf_clobber	 232 bytes
> - .init (overall)		 688 bytes
> - .data.read_mostly		 864 bytes
> - .data				 600 bytes
> - .bss				1472 bytes
> 
> Overall xen-syms' _end happens to move down there by 2 pages.
> 
> Clang doesn't support the option, presumably because they never over-
> aligned data.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Looks like this is becoming a necessary pre-req to "vpci: Refactor
REGISTER_VPCI_INIT" [1], unless we want to use undesirable workarounds
or hackery there [2]. Hence may I ask for feedback here?

Thanks, Jan

[1] https://lists.xen.org/archives/html/xen-devel/2025-06/msg00840.html
[2] https://lists.xen.org/archives/html/xen-devel/2025-06/msg01760.html

