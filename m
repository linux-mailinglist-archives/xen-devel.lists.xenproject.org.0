Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C39BDFDE4
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 19:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143865.1477462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v95M0-0005W4-Cw; Wed, 15 Oct 2025 17:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143865.1477462; Wed, 15 Oct 2025 17:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v95M0-0005TR-AH; Wed, 15 Oct 2025 17:32:00 +0000
Received: by outflank-mailman (input) for mailman id 1143865;
 Wed, 15 Oct 2025 17:31:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wenR=4Y=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1v95Ly-0004vX-Vz
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 17:31:58 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da0e45de-a9ec-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 19:31:58 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-59093250aabso5856286e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Oct 2025 10:31:58 -0700 (PDT)
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
X-Inumbo-ID: da0e45de-a9ec-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760549518; x=1761154318; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVJbNnWA52ZGqingx66CCPToUTX4yaZFV0fHGnBfJrE=;
        b=f0euMXqlhkNx7GLNoOPyw74MSlzc+zlueX7WuZUiqVn3oA7w+zk5znmnthq/3QyEM9
         s2vmiSfHfGc8wviJhKdJgOAWqssUhpp+RjIDnRJaKrXLsOyMNFq6kGUJROJkAvQQQCBx
         o8bWWVhtA+jKXVbLhn8X0uLpyPI5YKqZTqMMdximqhN7qsLUoF2zAUFYSRFn53aejeKD
         rEeZPAQrF2SK27kvmhzzcEyF3l7/ZRX8hV+0kNuqHIlDllr0k/I8RWsm9D57TTr0Cyty
         LNyyZF52AM7euSYzgZv7jFtWhQdIvWVOXt2lDaZ5AyAHL/8zQlC85VlZ2wRG3fxTwsE4
         Lyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760549518; x=1761154318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVJbNnWA52ZGqingx66CCPToUTX4yaZFV0fHGnBfJrE=;
        b=LLvegnVLv6TXQrP8sOQ2Scry+DH3YKpRLMTou2gr5+pmjSt1tQislV77GfZk2bc2BI
         NE8tBn+o/QjskgBhearQoKgj64LwxkWTo2tCojkxjL1Kvza4DaRACOCGUxt55DmxaU/o
         As3DiB4/eGvPrklSl0DjtKFGJQb7C5xqrXt/CSjAe+X9T1u8pMZBoio/fMveQXj9L8wu
         alAk7fFsa+kcWXSKmX/xp4BB8vNeDEx1bjByMivkxCzU4mQwRWatxJQ/wo0AKxCQ4mdS
         dHwIhidC8s9oM2eS3E99agvP1DbmCV9g94SjKMcPKRk5PnpdAKuPKHcyM2HZocx0LA5C
         4MCg==
X-Gm-Message-State: AOJu0YwVg2039KvNO7nugl9H9ZEzxDJxTZcGg36bQwtJgD44Rd91MIJK
	1qJBI8UqzW8fG4T2VezlxQ8HXY8jnfMsrOVWC38eaE2FRGC1Q7QimlY/NQAzBaNMPTa1pUYr4pm
	lTSG9zK0/yexF5C/i59kACsAChUc5tXE=
X-Gm-Gg: ASbGncsQT15bsK9h4hDD6U9exQ8hWLSUp1Aqiwjd33mnBDS8KKnzEiS2tsyup4awrF5
	faXxHCugVGvrbeJtuXvEuHRFaTGgmNwcGlB4/IPeqZlyBJCmckJnTQ4jjyFaV8/5Pa33+o2VZds
	ClldY3b/crNa7lOPKuQoxkOaAAJaQNwqL8QYuBWmGHPSi6GgzADgfRAcDN96U2fmTKqK/FVFVd1
	6Hec9zPbv1GLkRCVKPcy2HM/MdZt0S73dE=
X-Google-Smtp-Source: AGHT+IHzkcNBHxZTMMlKPi9SC0XdgR9Ku/ZtKtRWXFDLO9I6rrmTQ+G8yRheVbreQQNsHNHyzTB4DIluuk7/dH+5GOk=
X-Received: by 2002:a05:6512:b29:b0:579:e5da:e530 with SMTP id
 2adb3069b0e04-5906d87b299mr8651501e87.10.1760549517811; Wed, 15 Oct 2025
 10:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1760083684.git.mykyta_poturai@epam.com> <7ebd435d510c88e2840ee991f8fd75f25ad66f75.1760083684.git.mykyta_poturai@epam.com>
In-Reply-To: <7ebd435d510c88e2840ee991f8fd75f25ad66f75.1760083684.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 15 Oct 2025 20:30:00 +0300
X-Gm-Features: AS18NWD4rFtDky_oPXGYHrlZn0BOQykIYfUkgcoO9UOuoqmS3nvJ6QQ5wq3EOZ4
Message-ID: <CAGeoDV-WM4UugCHk36VKhG4=jmRc1_SF34Ez4is_RE2UBfZjRg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] arm/gic: Use static irqaction
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mykyta,

On Fri, Oct 10, 2025 at 12:22=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epa=
m.com> wrote:
>
> When stopping a core cpu_gic_callback is called in non-alloc
> context, which causes xfree in release_irq to fail an assert.
>
> To fix this, switch to a statically allocated irqaction that does not
> need to be freed in release_irq.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>
> v2->v3:
> * no changes
>
> v1->v2:
> * use percpu actions
> ---
>  xen/arch/arm/gic.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index 260ee64cca..ed6853bb32 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -386,10 +386,17 @@ void gic_dump_info(struct vcpu *v)
>      gic_hw_ops->dump_state(v);
>  }
>
> +DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_maintenance);

Scope nit (MISRA C:2012 R8.8):
if irq_maintenance is only used in this TU, give it internal linkage.

> +
>  void init_maintenance_interrupt(void)
>  {
> -    request_irq(gic_hw_ops->info->maintenance_irq, 0, maintenance_interr=
upt,
> -                "irq-maintenance", NULL);
> +    struct irqaction *maintenance =3D &this_cpu(irq_maintenance);
> +
> +    maintenance->name =3D "irq-maintenance";
> +    maintenance->handler =3D maintenance_interrupt;
> +    maintenance->dev_id =3D NULL;
> +    maintenance->free_on_release =3D 0;
> +    setup_irq(gic_hw_ops->info->maintenance_irq, 0, maintenance);
>  }
>
>  int gic_make_hwdom_dt_node(const struct domain *d,
> --
> 2.34.1
>

Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

Best regards,
Mykola

