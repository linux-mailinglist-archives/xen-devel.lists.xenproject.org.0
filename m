Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88CDB42611
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 17:58:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108694.1458750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utpsb-0003vF-7H; Wed, 03 Sep 2025 15:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108694.1458750; Wed, 03 Sep 2025 15:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utpsb-0003so-43; Wed, 03 Sep 2025 15:58:37 +0000
Received: by outflank-mailman (input) for mailman id 1108694;
 Wed, 03 Sep 2025 15:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utpsZ-0003sh-NZ
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 15:58:35 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d86653e4-88de-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 17:58:34 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b00a9989633so5223966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 08:58:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b043fd772bcsm619118766b.14.2025.09.03.08.58.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 08:58:33 -0700 (PDT)
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
X-Inumbo-ID: d86653e4-88de-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756915114; x=1757519914; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=swygL5HGQPRrf90Ch5ImAesfih2ztHFLRV2/KGDu/0w=;
        b=X5+q4wwdWEUWhXpc+jYxU1kPhc1IAGkvtfngZU/lls1Zceo889dMEVo8nlNnjAHVTh
         vmZ0NJayeu12XVeCp2FKWrJuRe9sdbaUGu0/W4Pv3SEXmocebzeSXS/keBPXlRyHDJ49
         jsnMa+XFt280hdkEK7+DdPHkwoxBljpApAmguiG0ZSEcb51VeqF6bskV9e0/vUT4TwrS
         IjXzoROv1FX2EhX6Tjtm4TSnAi93af3bIGLJaUTm7XeAtPWHxDqJDsy1vH8bubpCr7sN
         IXULmlYVbQjLzE4MF4cAv100JxBVqlRz11hg3A7sXsSZTr5oM3taLf4UY5CtqtH+ECi8
         yaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756915114; x=1757519914;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swygL5HGQPRrf90Ch5ImAesfih2ztHFLRV2/KGDu/0w=;
        b=XDIx/FXkHEDSWW/fPrR8SmjhVG3RZOVyPd6ubObLl/TMWOkVLC3BBI8fBvaIUZ/hLm
         gSKRfqRKBiqcxDeyPIT9xcC8xew7624wuHWY8wwd6ZGl1ZELMc4QxruHVHh+JmmzyR3B
         lLcjeXTg5PSR5XpOKHzycGGpeizhDuqLnjh5WCq2v3+By+3C1gDyOxe/yZhswyQ/Ts0T
         ZVE/vGX3wyGdFtSxy9VZYx9lrK8rplgnttH13S97xJTvt9CcHlJ2Leb8w+M+ESpxO1hC
         TCZlCw/7vlYKEZFL9IUtl39QXGsqVdMIn3ydOT0RmPhHbcmhjPDjdwQaalP6fRpeY5mZ
         vgOA==
X-Gm-Message-State: AOJu0Yx2Yy3MLhVdTUe87+CXSZRO05pTM2z/u4qz+mKFWR0vJ7eUdj1o
	5oOSZVaKJgfXWsx4UlDjEkTyGYN4HDAveHP21fKjCzmMwVpN+Wse5J6y+CTjFEzK62IodROwBRq
	Sy84=
X-Gm-Gg: ASbGncv4O+njklMJPKPSe6GghnvjeAwue801W+NEh6jcoNCGo0wbW2zyvjjKbPMIuOL
	bdInljJ2CCOCfOQbLgT1f1xuus8kfNyJTHkuq4No7f9tsaZ7Kq3GEedcoNoFsKTeeT9h1Sd7+k7
	HkL38/KOp5RiM8Hu5qk1pPcuUBAy8SmlCccnl7Esa6Zp++9qrJpR9vmHyvWB6JwCYBubOgeIaIo
	8cSqE7dPMp+EGx2/d9ljyIHCJhnye9dzuTEvmLlrrxBzz+4WZsOJucw/QyAAq/OT5RCYIZuBXNY
	HZ+0NAJtUyZBVKYnMogNoZuT0bfPbhsSxcdvA4NkSjkQ9HiG/wnC4eiNsxttfyArG9S2XgpX8iB
	SRUHrWWFhycJxPjBYDwR3QC97Z2q68xJ3D76AEeazB86PsW6THdB/WG/g3YT6qGIpr62GyD851G
	wSoE0rFS0=
X-Google-Smtp-Source: AGHT+IGhv8ojIwRCD6DqlFDEyPc2ZAM0qk1s1t2mvMNgQ5ZlXhQVn0oUuK0gyi4LD2rZRTB1WYo8Yw==
X-Received: by 2002:a17:906:4fca:b0:afe:ac57:f0be with SMTP id a640c23a62f3a-b010832f5famr1686552566b.31.1756915113843;
        Wed, 03 Sep 2025 08:58:33 -0700 (PDT)
Message-ID: <8319cf73-52f9-48e2-a571-452da53c36d9@suse.com>
Date: Wed, 3 Sep 2025 17:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging-4.18 | 51190865
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <68b862c0518f3_2cdd2ac12775d@gitlab-sidekiq-catchall-v2-5996545549-kk9d8.mail>
Content-Language: en-US
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>
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
In-Reply-To: <68b862c0518f3_2cdd2ac12775d@gitlab-sidekiq-catchall-v2-5996545549-kk9d8.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.09.2025 17:46, GitLab wrote:
> 
> 
> Pipeline #2019390073 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging-4.18 ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging-4.18 )
> 
> Commit: 51190865 ( https://gitlab.com/xen-project/hardware/xen/-/commit/51190865a4918c443c310c0478247d5f9caa5dad )
> Commit Message: x86/suspend: unconditionally raise a timer soft...
> Commit Author: Roger Pau Monné
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #2019390073 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/2019390073 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 5 failed jobs.
> 
> Job #11230955404 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11230955404/raw )
> 
> Stage: test
> Name: adl-suspend-x86-64-gcc-debug
> Job #11230955410 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11230955410/raw )
> 
> Stage: test
> Name: adl-pci-pv-x86-64-gcc-debug
> Job #11230955417 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11230955417/raw )
> 
> Stage: test
> Name: adl-pci-hvm-x86-64-gcc-debug
> Job #11233274365 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11233274365/raw )
> 
> Stage: test
> Name: adl-smoke-x86-64-gcc-debug
> Job #11233405609 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11233405609/raw )
> 
> Stage: test
> Name: adl-smoke-x86-64-dom0pvh-gcc-debug

While the same tests are fine for 4.19 and 4.20, all five show rubbish in the log,
and then fail. No idea what's going on.

Jan

