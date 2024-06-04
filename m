Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 483108FAB5B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 08:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735198.1141380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEO0R-00027i-VA; Tue, 04 Jun 2024 06:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735198.1141380; Tue, 04 Jun 2024 06:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEO0R-00025Q-SU; Tue, 04 Jun 2024 06:50:51 +0000
Received: by outflank-mailman (input) for mailman id 735198;
 Tue, 04 Jun 2024 06:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N7N6=NG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sEO0Q-00025K-PK
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 06:50:50 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6408ca1-223e-11ef-b4bb-af5377834399;
 Tue, 04 Jun 2024 08:50:48 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-35dceef429bso2227057f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 23:50:48 -0700 (PDT)
Received: from [172.31.7.231] ([62.28.210.62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e574748ffsm5599123f8f.87.2024.06.03.23.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 23:50:47 -0700 (PDT)
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
X-Inumbo-ID: c6408ca1-223e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717483848; x=1718088648; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YJEBEdzh7uV2SLNEdg7mSfjPAreMvRs5W4pE8Flw53o=;
        b=R2YiBt4c4gSFnMXHg8IHa3Pdj9ZR5VqF3kE6N8xL6dPPD83Ftdz9fcE7PAZb73GInP
         65Mmn4uG/+V6MCv262ruqn3Qr3o5uVDLte5FDwRCoiKg6eu8QFt++hBVGoHM9cEnrCcn
         nQgBXGLJFVESTp9+r76Kc1OpKGRSdCeHUSpyvz1F1Y1H1O1PzTQDcYErYtw2K67w021j
         sJ++wXZJihd6AndJYVwQwTUt0womdomkjd2i6b43kPAPdQzM6RhkqscJM731+puYoO4t
         VSCK2WaiXNjs5KNyBuZSZuF5lnw+VHL60pPopo2j/8XdYM+mcwZUWIaYLKQgomfroAXi
         37SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717483848; x=1718088648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJEBEdzh7uV2SLNEdg7mSfjPAreMvRs5W4pE8Flw53o=;
        b=alNWB7AIC2XhvUmAek376WWHCqU0EkRCeWywjeYNzaDeN2y+6DFUvjMpYZIrP7AU+o
         175A7YerXLqcER6FbPFvCxuHxSoC9zAIKZkRKoUKRN3tkMFlLXTVmkpIqLjrpmFCsxoF
         HWlZ66tTmlo9p+ndZy88puC6MKSWtu4R7R0Ho6+FG+DAXinV3/ZrhycCPvLt2umJ0Jvh
         CWODh3F60X4LYXjZvrvy9q2Fdh3kRlGiPHc27Ue1uxpVH1DBEUk5hpS9v2i2P2YI/86Z
         h58tTY0J8modYUiqs/4uyP7vtU3jZwMjM/3fqhm0LAyhP6Xh2GAu/9rKEMnFa5ZkBZ7o
         ahfA==
X-Forwarded-Encrypted: i=1; AJvYcCUOD52oZE1FXxLJR9zijUSQD3Kozfmay6e8fNtDjgiuavf5d+Gwd6gNQndI10bIsNPC+OqdV3LgM7pMppjSGXUwwTFHVgbrwZc2lfjyM0M=
X-Gm-Message-State: AOJu0YyhUfqzmP5tfz0Ejs/8+cnf4dKNDwHzXBI+2HXUBjyd80olFlg7
	oPWcbzKgDdHtty48el3WzO+JV8JOtkSUI9eURHCbAZhFq2ohMFIk3NX0GlAEBQ==
X-Google-Smtp-Source: AGHT+IGFMGVzvhz+CTx28oIJXojI3YRxX0wIxdOs3wf20LphGJRCqtJjABNNi9gVAws2YNTkyts8LQ==
X-Received: by 2002:a05:6000:1361:b0:35e:5076:e8ce with SMTP id ffacd0b85a97d-35e7c51a31dmr1271641f8f.2.1717483847679;
        Mon, 03 Jun 2024 23:50:47 -0700 (PDT)
Message-ID: <e5a54405-d686-4ac9-a4c3-5b76e4da2bb4@suse.com>
Date: Tue, 4 Jun 2024 08:50:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v5 06/10] x86/altp2m: Introduce accessor
 functions for safer array indexing
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1717356829.git.w1benny@gmail.com>
 <e2e5f7a3c9a0ac6d65a6f942b0ea54f0f0b104f3.1717356829.git.w1benny@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e2e5f7a3c9a0ac6d65a6f942b0ea54f0f0b104f3.1717356829.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.06.2024 22:04, Petr Beneš wrote:
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4887,10 +4887,10 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
> 
>              for ( i = 0; i < MAX_ALTP2M; ++i )
>              {
> -                if ( currd->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
> +                if ( altp2m_get_eptp(currd, i) == mfn_x(INVALID_MFN) )
>                      continue;
> 
> -                ept = &currd->arch.altp2m_p2m[i]->ept;
> +                ept = &altp2m_get_p2m(currd, i)->ept;
>                  if ( cpumask_test_cpu(cpu, ept->invalidate) )
>                  {
>                      cpumask_clear_cpu(cpu, ept->invalidate);

I'm not convinced we want to add the extra overhead in cases like
this one, where we shouldn't need it. I'd like to hear other
maintainers' views.

> --- a/xen/arch/x86/include/asm/altp2m.h
> +++ b/xen/arch/x86/include/asm/altp2m.h
> @@ -19,6 +19,38 @@ static inline bool altp2m_active(const struct domain *d)
>      return d->arch.altp2m_active;
>  }
> 
> +static inline struct p2m_domain *altp2m_get_p2m(const struct domain* d,

Nit: Style (misplaced *).

> +                                                unsigned int idx)
> +{
> +    return d->arch.altp2m_p2m[array_index_nospec(idx, MAX_ALTP2M)];
> +}
> +
> +static inline uint64_t altp2m_get_eptp(const struct domain* d,

Same here. And more further down.

Further: At this point it's not necessary yet to switch away from
array_access_nospec(). You doing so right away is probably okay, but
then needs justifying in the description.

Jan

