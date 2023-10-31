Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCEC7DD1AA
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 17:34:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625972.975808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrge-0007HJ-VV; Tue, 31 Oct 2023 16:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625972.975808; Tue, 31 Oct 2023 16:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrge-0007Ej-S6; Tue, 31 Oct 2023 16:33:52 +0000
Received: by outflank-mailman (input) for mailman id 625972;
 Tue, 31 Oct 2023 16:33:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G+CR=GN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxrgc-0007Ed-SW
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 16:33:51 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43d26ab3-780b-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 17:33:50 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53e08e439c7so10072766a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 09:33:47 -0700 (PDT)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 x7-20020a170906710700b009c70b392051sm1221152ejj.100.2023.10.31.09.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 09:33:46 -0700 (PDT)
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
X-Inumbo-ID: 43d26ab3-780b-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698770027; x=1699374827; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rZtyABM22d8WNiZYCnLutaI+NLhsCfSj4kEzvmz47hw=;
        b=Vc70jUXSEgvAX5G+Y2NjpYMWvOE9A9tgOfWY+Zssg+QZMCr2et3lp6+Z38rfDH26yx
         x0Iwtvshy/9Y00joh6YJtahdYgruU3/8VmBxdpMYO7sraIXcGQO/AefrP8bwBRC2k3wn
         rspVusGA6BfflIq8FKwlKxbKAvMG6+ADimY6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698770027; x=1699374827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZtyABM22d8WNiZYCnLutaI+NLhsCfSj4kEzvmz47hw=;
        b=EpznpUZIKwwRuGCpvxVrsL8OiAgU3kmSgo4k0460f4D0XVVmMLsyxRoC5iCXUPO+kF
         7beMq3xc/vfEXnGmr59cjm4CyCZL279wbBzhGPJwZdhRVbMkFYOnsgWEo09ZdCImtpq6
         xQOKn6Sz9Vef4r1AwLQm7CE2vDQViXRFgWI739Sg29WYM/5jBsDcaOWgp3WlLsaSQ84B
         4JyXeXStYzZfMRjbzTT4WA9DhrSrLBPb3DMsOfvQ3izsB0bsYn4BO+GLggn+aCjOhWcH
         R9yBC2+TmbZE7tK8vXnvmh3QgW4BO069DTvQloi0vVNDddGbS7ujao2P6i3AOz/2gnO8
         tn9A==
X-Gm-Message-State: AOJu0Yy6FQ6i78wuV7hmnuIwvcxJ0ADsam1VZa87qoyy8PM9mMlM8Ut9
	pThrrIgzC6HOyVAi9bFYkgThnw==
X-Google-Smtp-Source: AGHT+IHMm4Nc2zIvsRh7qrAgUPH9KvEEL+Ybbgeay3cbraKNq60msb2HmT3Vn9+XXs6yL79vG8G5cA==
X-Received: by 2002:a17:907:9494:b0:9bf:4915:22c4 with SMTP id dm20-20020a170907949400b009bf491522c4mr11023456ejc.67.1698770026919;
        Tue, 31 Oct 2023 09:33:46 -0700 (PDT)
Date: Tue, 31 Oct 2023 17:33:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/irq: do not insert IRQ_MSI_EMU in emuirq mappings
Message-ID: <ZUEsabItf_lpvi25@macbook>
References: <20231031133037.157936-1-xenia.ragiadakou@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231031133037.157936-1-xenia.ragiadakou@amd.com>

On Tue, Oct 31, 2023 at 03:30:37PM +0200, Xenia Ragiadakou wrote:
> Do not use emuirq mappings for MSIs injected by emulated devices.
> This kind of pirq shares the same emuirq value and is not remapped.

AFAICT adding the extra emuirq mappings is harmless, and just adds
an extra layer of translation?

Or is this causing issues, but we haven't realized because we don't
provide emulated devices that use MSI(-X) by default?

> Fixes: 88fccdd11ca0 ('xen: event channel remapping for emulated MSIs')
> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> ---
> 
> Question: is there any strong reason why Linux HVM guests still use pirqs?

Baggage I guess.  I've suggested in the past to switch PIRQs off by
default for HVM, but I had no figures to show how much of a
performance penalty that would be for passthrough devices.

My suggestion would be to introduce an xl.cfg option to select the
availability of PIRQs for HVM guests, and set it to off by default.
You would also need to make sure that migration (or save/restore)
works fine, and that incoming guests from previous Xen versions (that
won't have the option) will result in PIRQs still being enabled.

There's already a XEN_X86_EMU_USE_PIRQ flag in xen_arch_domainconfig,
so you just need to wire the tools side in order to allow selection by
users.

> 
>  xen/arch/x86/irq.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index f42ad539dc..cdc8dc5a55 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2684,7 +2684,7 @@ int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq)
>      }
>  
>      old_emuirq = domain_pirq_to_emuirq(d, pirq);
> -    if ( emuirq != IRQ_PT )
> +    if ( (emuirq != IRQ_PT) && (emuirq != IRQ_MSI_EMU) )
>          old_pirq = domain_emuirq_to_pirq(d, emuirq);

I think you can just use emuirq >= 0, as we then only need the emuirq
translation for passthrough interrupts, same for the rest of the
changed conditions.

Looking further, the function seems to be useless when called with
emuirq < 0, and hence it might be better to avoid such calls in the
first place?

I have to admit I've always been very confused with the PIRQ logic, so
it's possible I'm missing some relevant stuff here.

Thanks, Roger.

