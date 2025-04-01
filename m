Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68066A775DC
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 10:08:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933614.1335519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzWfB-00065I-K0; Tue, 01 Apr 2025 08:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933614.1335519; Tue, 01 Apr 2025 08:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzWfB-00062W-Fq; Tue, 01 Apr 2025 08:08:01 +0000
Received: by outflank-mailman (input) for mailman id 933614;
 Tue, 01 Apr 2025 08:08:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzWfA-00062I-Br
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 08:08:00 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c65f250-0ed0-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 10:07:58 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso49312215e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 01:07:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82efeacasm191461405e9.23.2025.04.01.01.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 01:07:57 -0700 (PDT)
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
X-Inumbo-ID: 6c65f250-0ed0-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743494878; x=1744099678; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9bovgRmlu21D+Vno2OUk1sYiIkjhw0RBe5xo/egaiZs=;
        b=NpB8e48VXwd1zim59WJ5ywPZVpyfAn61DnsHiLoDveakU94xmTsy8bjbnM6vvErdn1
         9CXmgO3/wiim++K6p162MSk8RURYuc03dChGJCJIbXWMs7pO/jqz6be+CaUVzfUAaNsq
         JqQAzytbbX3LdyJYWIxlwLd5Fo9b+eihw93zv4AxOFb1o2WTUQP2ey8WCPdzECHNLCiJ
         Aq1AloN9Gfx6m4Re3LnCjSubam1SifvZXYZ2jHtmJN8A3C5s0ScbrwcAp3y3jBoQ92fo
         8siiuZYjSi6ja6ULhk4rmuC6GN/kCh/93+Q/U4NG9E/0/2zvGvouE61gkgrH+ZGxCFPe
         ORDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743494878; x=1744099678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bovgRmlu21D+Vno2OUk1sYiIkjhw0RBe5xo/egaiZs=;
        b=HRc63DDqx0fGgeNILpLhNkVKSb6ZzlIskHS1Z6bmcVkWmRuyxueCsRcwa+fcUImVF9
         mvTaPOGPHkhSp+WZpYEfn4uq4m3cbjwKv2sGAlUOI/ASsLjwxIhdQ/dvlw8xGxN+17GU
         YmWT/tKlHzRu27OC2H2HUSizB35y4bxH3FoKkmJ9ApSpxwPYTWGMd28lzntMdYuCvrxX
         0LGIwLmzipvgdThxWYyMmKwsfZrhozqNUz87mipxGE3cKmh3BLwlp9l1kXoCl+gfFz7c
         U4D3/52UWmQd1CSMg+w+LlX96ypEnHCE99qUJxtcGM5kx5x6FxqJexfzFYsCNURrqWSG
         mxXw==
X-Gm-Message-State: AOJu0YxTIOZrw51RcxpiBYtEPeQ2pkOa4jfOv/j1U6248wMFMKXI40VI
	LHJEfwDVlpO89/PCnU/7G0Tv4AEhD2OzDMtFVwtWA03YoJBJ1xNI3+mP8B006IXtPYUmz1gNl2c
	=
X-Gm-Gg: ASbGncvgzn/zPM/G4ZKG1QvF38k2YilKFoCAnrYkx6ecaK3a6gee+Wabc5UOm3jhmgx
	pQb4HXAfw97IscbLKa/8V+YV6pklyxnyZnkXGaYAJJIXj22jw+B0Z+rV/bv+WsW17A+h0r5uoov
	NwsmPqXCRota2lXeAb1huZRgwjOG8yLbvi/xbHWYthrrF73cCrAsTx9R87Lrugjwp2aG7Po1eGw
	gLAAc1szz6u9CpgsU7zvZaMdAqGqO5ZHNpfvZk3KzBTHnkqBQR+nOuSy1Cl7MkfnelHS0Rnr/46
	OkhW4QMGj7jaupqyuwnDsoYbh6rh8w1JghIgYXWH4Hma69rP6ZoSM/e3bTUtuNID7N1qSjH3Qtz
	5OsJ70zhV3ZGrKx9vRpFtF3cSDHNRoA==
X-Google-Smtp-Source: AGHT+IH0rv3a5YpQckKPKHlRaLMLEdQM+0krR5o68S2MEJpGHPxhfIOkBBC+liNZvHDX239H8OIxWg==
X-Received: by 2002:a05:600c:1382:b0:43c:e7ae:4bc9 with SMTP id 5b1f17b1804b1-43db61e0348mr88094395e9.1.1743494877808;
        Tue, 01 Apr 2025 01:07:57 -0700 (PDT)
Message-ID: <cc53bc20-51f4-49f9-b35c-77805147e603@suse.com>
Date: Tue, 1 Apr 2025 10:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Domain IDs and Capabilities
To: Jason Andryuk <jason.andryuk@amd.com>
References: <0dd25ebd-34f2-4391-aa08-3d873ec72347@amd.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <0dd25ebd-34f2-4391-aa08-3d873ec72347@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.03.2025 23:46, Jason Andryuk wrote:
> It is useful for a domain to know its own domid.  Xenstored has command 
> line flags to set --master-domid (the local domid) and --priv-domid, but 
> it would be better to autodetect those.  Also, domids are necessary to 
> set xenstore permissions - DOMID_SELF is not supported today.

Setting permissions for oneself?

> Juergen already implemented a get_domid() function for Mini-OS for a 
> xenstore stubdom to query its own domid indirectly through event channel 
> games.  That can be re-imlemented in Linux userspace, but it needs the 
> unstable xenctrl library to query event channel status.
> 
> x86 HVM exposes the domid through a CPUID leaf, so it isn't actually hidden.
> 
> Should I add a hypercall to query a domid?  An alternative, for ARM at 
> least, is to expose the domid and capabilities in the domain's DT in 
> /hypervisor/domid and /hypervisor/caps.  I've tried this out as just 
> dumping the domid and caps as uint32_ts.
> 
> Reviewing 
> https://lore.kernel.org/xen-devel/20231110113435.22609-1-jgross@suse.com/ 
> it seems like both a hypercall and an arch specific means might be possible.
> 
> XENFEAT could be extended to exposed finer grain capabilities: 
> XENFEAT_{control,hwdom,xenstore}.  This is easy.  Seems a little bit 
> like a mis-use of XENFEAT to me, but it works.
> 
> If generally exposing domids is not desirable, they could be exposed 
> only to domains with capabilities since those are not migratable, AFAICT.

Since guests have ways to figure out their IDs, there's probably nothing
wrong with having a dedicated means for them to obtain them. It just needs
to be made very clear that the ID can (and, at least for now, typically
will) change across migration. As to the mechanism thereof, I stand by my
views voiced in that earlier thread you point at.

Jan

