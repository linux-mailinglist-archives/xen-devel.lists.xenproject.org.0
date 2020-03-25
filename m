Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CC0192E11
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 17:20:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH8iY-0001hv-5i; Wed, 25 Mar 2020 16:17:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OrPJ=5K=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jH8iX-0001hq-Dr
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 16:17:21 +0000
X-Inumbo-ID: 1a72805c-6eb4-11ea-b34e-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a72805c-6eb4-11ea-b34e-bc764e2007e4;
 Wed, 25 Mar 2020 16:17:21 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z65so3144596ede.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 09:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sa3ney5gU1VEt38vTCVABQSBT3N4vc8GVI1aCJHpzBA=;
 b=bIlOZltWVtHl1z8PTSRuovGTe+7jpVHqEsE9fFqK4cM2OpdxIJLPX0KnF+b7V3ly+R
 oFck330h0Yw9Qd5DS1mC6XDD8MLRHAhU8ER9mfmthSWPf5NNexgB6xZNPUwzocFUmZvf
 2n/G+vxftx+ka0MjFlqyVoKpe72tWnJuhSxrGw2GoDLNzJ35O0X2ubL6kSw1OvQEOPcb
 U4tH75Sxb/qYnAf3dRn2qRuaLRfEiqlMDBWzLfJSLQSs4scWmrmo1k35jCPMh4mrf8AP
 p5Ewq3J+S9PnoiUaO7blpv3mVLnd2UnBzdeGn9JD69P62gme64SBmJJqGxiIH4tdvpfb
 ndxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sa3ney5gU1VEt38vTCVABQSBT3N4vc8GVI1aCJHpzBA=;
 b=gDzIvAHSZLHWC8SmMyu3smvsWPbnP24YHrviQWXqH3mGphMDQtTxw5JJtapVHSaHIj
 9WgCzEjQ76VGllepUSP0TFh8T4RVoOfT2x+QyLrkHv7915NjD1BcYl0/WeDP9+QQq/3S
 oft7np6tVxJZJj+PdE74ewDrtvyzNj6R32qkEr3Z60Dq8zX6JO6iFUEMl2t+tDgB/xBT
 NQfDhPLW9pu2Ipm29ElPH4YEmeH1sInSL54irT73dSgPsS6bB/bej/rkvo22yqLublhq
 SR7q51yc8+Ym9gVK6Fm0hj8zzRuKwKYE3fj7OVFNqoaYF5Q7wv9BP8Wgmxxs6iqKevny
 ouWw==
X-Gm-Message-State: ANhLgQ1HqU7hcjk5vqgYQVCHWygUJ/gPKdRqShkYUjpQVAeg2O4yb4Sh
 9OraN/OjBipUYyV9a0xjizL0DWaJZhs=
X-Google-Smtp-Source: ADFU+vvM7R7Sqe6kIlJQo3OJcnVL55ZbV77HwaoImLvdipxCCiksxBoqXqofONa8wzDSvPKqUR83UA==
X-Received: by 2002:a17:906:f215:: with SMTP id
 gt21mr3951076ejb.17.1585153039753; 
 Wed, 25 Mar 2020 09:17:19 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42])
 by smtp.gmail.com with ESMTPSA id v10sm1232609edq.79.2020.03.25.09.17.18
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 09:17:19 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id a25so3950919wrd.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 09:17:18 -0700 (PDT)
X-Received: by 2002:a5d:640a:: with SMTP id z10mr4484158wru.301.1585153038489; 
 Wed, 25 Mar 2020 09:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
 <20200325154702.GD28601@Air-de-Roger>
In-Reply-To: <20200325154702.GD28601@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 25 Mar 2020 10:16:42 -0600
X-Gmail-Original-Message-ID: <CABfawhn-YAb8AQfQpPrXiF4+81T+azXrkydVMY2u1beEb+Y1SA@mail.gmail.com>
Message-ID: <CABfawhn-YAb8AQfQpPrXiF4+81T+azXrkydVMY2u1beEb+Y1SA@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Xen-devel] [PATCH v12 1/3] xen/mem_sharing: VM forking
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> > +static int bring_up_vcpus(struct domain *cd, struct domain *d)
> > +{
> > +    unsigned int i;
> > +    int ret = -EINVAL;
>
> Nit: you can get rid of ret...
>
> > +
> > +    if ( d->max_vcpus != cd->max_vcpus ||
> > +        (ret = cpupool_move_domain(cd, d->cpupool)) )
> > +        return ret;
>
> ...and just return -EINVAL here. Seeing as it's not used anywhere
> else.
>

It is actually still needed, note that we store the return value of
cpupool_move_domain in it.

Tamas

