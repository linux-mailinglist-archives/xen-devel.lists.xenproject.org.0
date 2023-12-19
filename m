Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 445C7818579
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 11:45:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656645.1024964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXap-0005Hm-Jz; Tue, 19 Dec 2023 10:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656645.1024964; Tue, 19 Dec 2023 10:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXap-0005G2-H8; Tue, 19 Dec 2023 10:44:55 +0000
Received: by outflank-mailman (input) for mailman id 656645;
 Tue, 19 Dec 2023 10:44:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFXan-0005Fw-Sb
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 10:44:53 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a389f759-9e5b-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 11:44:52 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c2bb872e2so50039155e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 02:44:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n35-20020a05600c3ba300b004064e3b94afsm2296448wms.4.2023.12.19.02.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 02:44:51 -0800 (PST)
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
X-Inumbo-ID: a389f759-9e5b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702982691; x=1703587491; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVZT3gW+xzUGhAySh7dzcSMVZ/RcXnsavSY+i3y0IbQ=;
        b=LVhQV2jBjsJj2UDtrHpF6ubtZbtdGHBaOqvK5TuaawZq7zoXEC7GPQsuyE8VOigwG7
         eZjbrHMzEHNuIqU/5uAFjb/IMQ/37Y6ryg+LMowvs9O8jz5ZW1CVgrfXXndUq8X/A0oI
         nVRjglFU6VWMOZQjFguFnpmMI0ZLbln7FuUHijSM488zP66ifItsn1/9vE99YwS0HCZn
         oqTPyJK9dTKY1gGiDfJjfzobEhCyhBi89ux/hrZ7QoNSdEEg1SGfPgZJrCfYUF2FZSp6
         yOkiz1MhHBYLTaWtkKDtfYGxz2KkzewKuZI6vRlw2W5ZHa4Te5Pcqkaq7rdW/sYVWgfu
         c7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702982691; x=1703587491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xVZT3gW+xzUGhAySh7dzcSMVZ/RcXnsavSY+i3y0IbQ=;
        b=qEMzfa2LP3luamaVTvl8ShLwYN/UhE3BZmaABO/RR8OYs34dTII6EIG8iy4HGe135f
         iVuiCerMKX+JGJLK3/ILMXCvruv7IwMf2tLPXjVaPWBJLZ03ArbbXlK+w4bqUyG12yfn
         ulmKVFMoAhYiH7ERfPNPUEFkOjzEvJNeOvrBTrvpc5YcFih+c71uuQMgP2lmlmmFhab9
         wYoGtP/CQ5B78PnIb54sRm7cbR4X2JKu4O0J65WySTxAbpz+4ItlAwatAdtnCBYmdahq
         9cBLp9+EqWxvYEnYW4S5RbAat/SCRGrkvDsZDORSh8Cxb8P4yRQamByECwOrQosbdg05
         o1CQ==
X-Gm-Message-State: AOJu0Ywn77XHl7F8aR2fcAuNTpEr/0VnOpt+JKDRuxA9Et/a0zDTrm2L
	SqColxm/5gJdtHURM+3m9hLS
X-Google-Smtp-Source: AGHT+IFy3bqR2cPK4Z+8vN1tFlQ8fuYHH7PglETp5XUtbdH7+XDtZ12cKOaR4CcsrbpKdxzm7szVPw==
X-Received: by 2002:a05:600c:1e1a:b0:40d:2e2b:6e76 with SMTP id ay26-20020a05600c1e1a00b0040d2e2b6e76mr13805wmb.146.1702982691446;
        Tue, 19 Dec 2023 02:44:51 -0800 (PST)
Message-ID: <c4705dba-ce9f-4b4d-9962-8f9d420047f7@suse.com>
Date: Tue, 19 Dec 2023 11:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/5] x86/hvm: dom0: use helper to get sizeof struct
 field
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1702553835.git.nicola.vetrini@bugseng.com>
 <17b01f14b89a5dba6935bbd8019ddf431d595890.1702553835.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2312141332470.3175268@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312141332470.3175268@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 22:32, Stefano Stabellini wrote:
> On Thu, 14 Dec 2023, Nicola Vetrini wrote:
>> Use of the proper helper macro also resolves a violation
>> of MISRA C Rule 11.9.
>> No functional change.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


