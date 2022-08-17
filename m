Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FC059682B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 06:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388645.625368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOAfm-0005hu-3p; Wed, 17 Aug 2022 04:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388645.625368; Wed, 17 Aug 2022 04:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOAfm-0005fo-17; Wed, 17 Aug 2022 04:28:54 +0000
Received: by outflank-mailman (input) for mailman id 388645;
 Wed, 17 Aug 2022 04:28:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIU2=YV=gmail.com=lukas.bulwahn@srs-se1.protection.inumbo.net>)
 id 1oOAfk-0005fi-47
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 04:28:52 +0000
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [2607:f8b0:4864:20::1135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17e2f0ea-1de5-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 06:28:51 +0200 (CEST)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-32a09b909f6so202543307b3.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Aug 2022 21:28:50 -0700 (PDT)
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
X-Inumbo-ID: 17e2f0ea-1de5-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Fd64ZTYpBZ+RIWsrdcx55o1cFYfsxNqJQSrJeLxKjSQ=;
        b=Ad99UETspLmbHH9gsu+1FAFTvXlfJoLpaNP0OL9t4xxoVylZiSsMLzp4nPYGIA1UFH
         IOKL84hR+P6bSU7poN6ScvoslZBqCCZJ+q/m/a3E+GfVFccj2tMmQaejOqlhVckdRP2K
         5/9xgAqY2UHzw7qhAf13K6clzbiIjuZIaU9rLdrg2XKbT27K6Kn7nQXLXk6No6K9C0q0
         3d/ppwe3m4L4fPgoXWluWqPvm1Y7d2cz6MIvl/hxiWZkTiTtseK7FvlK4sQobx0QkTNJ
         3X89MouRVjqTxcepKwydY0yX7qth747/NNwCTIg0LL55+5UtSw6tC3MfVpOTZXRRo7al
         TUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Fd64ZTYpBZ+RIWsrdcx55o1cFYfsxNqJQSrJeLxKjSQ=;
        b=dygi7+0aNN4Ljw0NQc4lqCFk1QD+KvFB+2PznFHSdGB8I/FcR/2Ai8JA4aamO0Zeph
         +7VUeBaT/botgRifdhXZPH2/JIaLlZpnYYkW1W4tQEdg6hENQQTqVNCqX30vg6w2F1HD
         XlgzhisE0pJHHmRZgybiaKXZ58NG8B8lrFFv80cTwNvUmb6I+ytEPFPBD7TLrFaLaZZd
         l4UJyvqE5ueFGSQtBq+6UuS+PV5OsIg64QBXYS/ZaJhIE90QVq4CmDKf9op3gs4+2Cv9
         GQzuq3/0Hd9xCMkWKl7tpfVzFbjD6wQYctCcB6cJm7WB8MZLuX5H0rioKBjMlA7vusnl
         S95Q==
X-Gm-Message-State: ACgBeo1qXI4FSC8oUJ3gPb46hXxoZG23UPA507NVZUWn51uFhk3oCghp
	c9DisfrGe3RUMsI7LS+ocLik91OBGoT/zhKv04E=
X-Google-Smtp-Source: AA6agR7r3Vz1IkV8JjjkI722lpR7xQMTMFPwTM97y2R48sSD8HSCg6dN1OoUe4zjtP1cNX3v/pKyZCb6n0V55d2IfQo=
X-Received: by 2002:a25:6885:0:b0:68b:b381:facf with SMTP id
 d127-20020a256885000000b0068bb381facfmr7872999ybc.318.1660710529892; Tue, 16
 Aug 2022 21:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220810050712.9539-1-lukas.bulwahn@gmail.com>
 <20220810050712.9539-2-lukas.bulwahn@gmail.com> <d8930edf-d138-6ef2-81c3-ff4d9003066b@suse.com>
In-Reply-To: <d8930edf-d138-6ef2-81c3-ff4d9003066b@suse.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 17 Aug 2022 06:28:39 +0200
Message-ID: <CAKXUXMx2HvR5SYxpvH3=LSzv_v6S65n-F4FyUSD=STpAgSYcOw@mail.gmail.com>
Subject: Re: [PATCH 1/4] xen: x86: set the config XEN_512GB after config change
To: Jan Beulich <jbeulich@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, kernel-janitors <kernel-janitors@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 10, 2022 at 9:07 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 10.08.2022 07:07, Lukas Bulwahn wrote:
> > --- a/arch/x86/configs/xen.config
> > +++ b/arch/x86/configs/xen.config
> > @@ -14,7 +14,7 @@ CONFIG_CPU_FREQ=y
> >
> >  # x86 xen specific config options
> >  CONFIG_XEN_PVH=y
> > -CONFIG_XEN_MAX_DOMAIN_MEMORY=500
> > +CONFIG_XEN_512GB=y
>
> Does this actually need setting here? The option's default is y, so
> it ought to be turned on "automatically". Hence I think it's only
> the stale line which wants deleting.
>

Jan, that makes sense. I will send a patch v2 to do so.

Lukas

