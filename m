Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5EFABDED1
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 17:24:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990950.1374902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOpa-0004iR-W4; Tue, 20 May 2025 15:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990950.1374902; Tue, 20 May 2025 15:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOpa-0004fQ-Sn; Tue, 20 May 2025 15:24:38 +0000
Received: by outflank-mailman (input) for mailman id 990950;
 Tue, 20 May 2025 15:24:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHOpZ-0004fD-Ei
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 15:24:37 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 892060fd-358e-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 17:24:35 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad56cbc7b07so340820166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 08:24:35 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d0717c3sm753641566b.65.2025.05.20.08.24.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 08:24:34 -0700 (PDT)
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
X-Inumbo-ID: 892060fd-358e-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747754675; x=1748359475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s9q6aaOAVXpxltmr70zrORYazBV2HTcHNQJLw+kK75U=;
        b=NHDWZYnfoK5KFNpS69oWiePKk+nzzVaECOzBY0MkjIK9fR1xRt5KZNU+DKb7Oa7ryQ
         LUjjiAGHuGLfUx2Axohvv3RI1T+PoGqjLSqFbrdF7iFd2UjLE5iiy/0qfqs/8oJ4QmNp
         jiXhLR1Q8whagxyI2DU4y8Hl4Fh/X4u3OIYDs2sEDL/v9jpUGfZbylkr7GdqicgpSC9R
         HJp8MMyXQqufsjP2zxzV34xC1zl3bbBOeE4q4DgnXXwC2KwTun0db0Pl7KQyZxk3/xjH
         7HrGweh/Ni20fQxXVuvEWRuVqWe7QLE21fkGFt/UTWqiZLx7tu+e19VnCsgkjgMIoaRa
         r0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754675; x=1748359475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s9q6aaOAVXpxltmr70zrORYazBV2HTcHNQJLw+kK75U=;
        b=KKp4vGd9Aop88usxbsLy+S9jxiBddKtBv61MZlgo+Sv1ykmettW6ltgEn6kMM9ClWM
         wiaFU1hju2BTJBU6CqjdfJM57MgXUhTAvVXvBR9WKOJgPtGqq5UWy9jbA0pXCIBvNcnv
         9X+ZlbXNHycog0wnsM3P332mdO+xjs67I2w3lKhZeqrSQZzhOXZIaGWQ0o/TEuZSs+WI
         1oyurT8PWcKrEG41iJ++GTMoh6coqnE278bw2xOWhtZH0qqAzn12zzGdnh6DK5W3M3Td
         0GU0Glndz9pni2cN/DI9jHvVgxSJfEpLqSf1FIg5QEwuvu+zAa71q/Rq5yL+1hcppTTZ
         h0nw==
X-Forwarded-Encrypted: i=1; AJvYcCXel4e8qBHsFv5LmDWwx1l1sw7sgjTQkv7MKcemvW1WeM11YxjDmvlgQr3uMRblsQk9WLlWxtDCiWU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtP5V8UYoaqx5x9Zcz5xV45wUkcJBVs9GRFETjh/imBjhj/yA5
	eqd1tp64zUdWiiswaqKq7wCpWYzp1RpOhbhSKGNasAp8wroDJAkMlvf97YzjnL+Ykg==
X-Gm-Gg: ASbGnctMIWib9xjQ+je/irq9q2tNdBmZSIpVkXdEDuFDoEPaL1D9AU3Q348bEG+vq6P
	n01pc8ybsueTbWqXAysUJwyLfrkjGDRpYQe3uvfBF2wnSNp/vLmICiPZW4TfenP9J/eEf8fYzVR
	I65vVFTomXRzm9vYT/2o3On8yBi2rgL8nizTPec7jgb9sFBLRJHQge8FLVdrZ40cRo+zk47FmTE
	dNu0AIw9cVcXL5+Ynx3YfmuZjyDOPNqRu11tOFp58NBoEeMq7RCunnenpem8weL/Vz3zDhD3zFM
	q57iKiaN5PwXlo3Wy+FA3/p2E4dJ84AXEa4+vPoYxR3xqoKwC7WUk9YIYP5EiQ==
X-Google-Smtp-Source: AGHT+IGEZi1+KEIPWmYt6F5HNa3b//jxjEPjhWyxM+ecNqoBJBcnDzk9DiW1gsFi2LezaCtU4Li2ZQ==
X-Received: by 2002:a17:907:97c6:b0:ad4:cc66:1524 with SMTP id a640c23a62f3a-ad52d609746mr1683242466b.54.1747754674529;
        Tue, 20 May 2025 08:24:34 -0700 (PDT)
Message-ID: <e13d061a-16ee-4b8d-8d4a-db1bba609bdf@suse.com>
Date: Tue, 20 May 2025 17:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/domain: rewrite emulation_flags_ok()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250516022855.1146121-1-dmukhin@ford.com>
 <20250516022855.1146121-3-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250516022855.1146121-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2025 04:29, dmkhn@proton.me wrote:
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -494,6 +494,12 @@ struct arch_domain
>                                   X86_EMU_PIT | X86_EMU_USE_PIRQ |       \
>                                   X86_EMU_VPCI)
>  
> +/* User-selectable features. */
> +#define X86_EMU_OPTIONAL        (X86_EMU_USE_PIRQ)
> +
> +#define X86_EMU_BASELINE        (X86_EMU_ALL & ~(X86_EMU_VPCI | \
> +                                                 X86_EMU_OPTIONAL))

That is, VPCI is neither baseline nor optional. Certainly at least strange.

Jan

