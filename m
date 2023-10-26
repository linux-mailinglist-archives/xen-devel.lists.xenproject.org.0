Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 381047D7D8D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 09:22:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623525.971433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvuhH-0004az-To; Thu, 26 Oct 2023 07:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623525.971433; Thu, 26 Oct 2023 07:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvuhH-0004Ys-Qz; Thu, 26 Oct 2023 07:22:27 +0000
Received: by outflank-mailman (input) for mailman id 623525;
 Thu, 26 Oct 2023 07:22:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bkoO=GI=linaro.org=jun.nie@srs-se1.protection.inumbo.net>)
 id 1qvuhH-0004Ym-4B
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 07:22:27 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6833c8f3-73d0-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 09:22:25 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so7994161fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Oct 2023 00:22:23 -0700 (PDT)
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
X-Inumbo-ID: 6833c8f3-73d0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698304943; x=1698909743; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAJcozZEujKPLPrUxkPQBvKpVMiUDDIet325E9UGf9s=;
        b=Ujc3wi2vCGYgJr5/LNUymJSMf9VjnmjhERqqS2Hz22Wk236ybi4nT4zlJRnWRNgT6z
         erL2E9wv2N+ewKgwA9cwZaF0tbuChR/gEnrvHQFM+I1PAbvJEqi3RqSAOhjnKAOdvE/y
         lfGeLbWir4zuSTdKOafVYHVUrSH4CDcS40OClGNMVWebSEGE23rLp3UGux6nOBr/dX3A
         7j0hpwSnCd5SitcPXO0buPeXeNqTWbvUQ9GFD+fHRsh3C/PvvPkCxAgWnrKYMzVRPC2O
         DsbU67Bborqrj/U7VyF1BGdfDna1PSLD0A7uLG8UTZN7lY8wRm/lnNJ2jvP1Rv1Co/6A
         zNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698304943; x=1698909743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAJcozZEujKPLPrUxkPQBvKpVMiUDDIet325E9UGf9s=;
        b=tNqx/+b/bzluhfvFP+txmqpe77AJKJOD4iVdQgI3yLhr4gQOIs1dYG9plnhFpm8z9e
         8+e4dWp9mh3nzglUMvk3Bf7997Op/id0FOcjfBC43+mmgko9wyCrTG92o+lQsR6/4Lmf
         yvYOfss5eLNLcKlhGEocETmBz/y119afVUzTCNYsBiQvHLLQlsAjRnoyCGCmY7MykQ+7
         F1oQyVa3Qht9W7M/9meUmF6IKIqU6re1d+OOT9odPijMfJu0bmcqzcPlLW3E5iuXZUuX
         BBJ3d0tk/Iq0UN40Rps7RG9lrx9yHK2Mt1LIS2AC5C4aU2SphIvE5q7C3kvfyGB/xi2J
         jwJA==
X-Gm-Message-State: AOJu0YwXT11lDRHWmQ4SzDooVIE1+vCu1ZNCl3UI5mUhbzsL7IfiJTv1
	vmPboNd9qud6r21jHPSaL71GQMT6aReDoAkZdf17bg==
X-Google-Smtp-Source: AGHT+IFByQkt/FuY9JcAyV254982M2QJxrgA/Z4cKepu4tzALKQcLKLq60867Jcs8WRV2CWY8UZocFS+skbIjTD0cW0=
X-Received: by 2002:a2e:be9d:0:b0:2c5:3090:537c with SMTP id
 a29-20020a2ebe9d000000b002c53090537cmr14395811ljr.17.1698304942869; Thu, 26
 Oct 2023 00:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231026054634.2805035-1-jun.nie@linaro.org> <ae4342e4-0ee1-484c-b679-5e3c24e2ad68@amd.com>
In-Reply-To: <ae4342e4-0ee1-484c-b679-5e3c24e2ad68@amd.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 26 Oct 2023 15:22:27 +0800
Message-ID: <CABymUCP66YRy7=LbCtqtUPcGc+8AG5SSjS1OL+0WbhqdK5ExpA@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: Add Rockchip rk3399 early printk support
To: Michal Orzel <michal.orzel@amd.com>
Cc: sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com, 
	Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Michal Orzel <michal.orzel@amd.com> =E4=BA=8E2023=E5=B9=B410=E6=9C=8826=E6=
=97=A5=E5=91=A8=E5=9B=9B 15:02=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On 26/10/2023 07:46, Jun Nie wrote:
> >
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  xen/arch/arm/Kconfig.debug | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
> > index 842d768280..fefe8ac4df 100644
> > --- a/xen/arch/arm/Kconfig.debug
> > +++ b/xen/arch/arm/Kconfig.debug
> > @@ -158,6 +158,9 @@ choice
> >         config EARLY_PRINTK_RCAR3
> >                 bool "Early printk with SCIF2 on Renesas R-Car Gen3 pro=
cessors"
> >                 select EARLY_UART_SCIF
> > +       config EARLY_PRINTK_RK3399
> > +               bool "Early printk with 8250 on Rockchip RK3399 process=
ors"
> > +               select EARLY_UART_8250
> Platform specific options for early printk are deprecated. You can read i=
t at the top of the file:
> "
> Deprecated: Alternatively, there are platform specific options
> which will have default values for the various parameters. But
> such option will soon be removed.
> "
>
> ~Michal


Thanks for the reminder! So only below 2 configs shall be configured
when compiling the project, right?

EARLY_UART_BASE_ADDRESS
EARLY_UART_8250_REG_SHIFT

- Jun

