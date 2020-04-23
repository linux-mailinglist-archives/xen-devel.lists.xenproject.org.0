Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D7F1B604E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 18:06:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jReMu-0007m5-CX; Thu, 23 Apr 2020 16:06:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XA1d=6H=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jReMs-0007m0-Ve
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 16:06:27 +0000
X-Inumbo-ID: 6221aa48-857c-11ea-9e09-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6221aa48-857c-11ea-9e09-bc764e2007e4;
 Thu, 23 Apr 2020 16:06:26 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id h6so5234158lfc.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2020 09:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mwH9Ib0J5zg1xKgoiAredKEIra7n1riZan7qItV2GyY=;
 b=RFWDHO1SNU+NdyPc/rgZkzWeIyqqxQ+7hvOLsPiXlLo47K4OqPFhFbW9P06oBlPheW
 JkU5zAbj/ujH90wK4AWAd80ngLG9+DDdO5RmWN/yyayJyc0yPQ7OB4hNdo5qVs3VVNFN
 fXITXQDNhJkTIyP/Vc7xWC5R/xuUKtSnyKqSbZI2OMjB2QEr6axb8hDnPqdqMJlOh3X8
 REgLOtqKb+UUfOO2FXs1jRCH8bYFKH65/CPB13hzKbVFL0ZejJZKAtVaND4iexDJbMFg
 GnOKoobiQM5c4NHuAOS+jYgpsOBuMh8a3b1ZwYVku2irOqRBiONwlasHk/zqWF2bw03a
 sAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mwH9Ib0J5zg1xKgoiAredKEIra7n1riZan7qItV2GyY=;
 b=ItuftXa38IhdR8iK5Bjxoy6zp82djo7Lu2yGDU1PvILSqIwfOmMZ7knJphoqRaOIy6
 YZY6U2yz3yFo4P2wxpz5QC1E2hzA/62LMUFBAcSfd4PMOyN/XLxGIenh6xo4ygsNPnDy
 +qiA2h3BTIWWBE6GgGADhDL65ZlJjA6QCUbx2/fBMiswC/HseUyDlgERStFbAQqz/VbI
 ATRForFMHdue+tV1xtHq2klQnfBebAnh32veH6bgRL7G9EcP9hk+3YKazEGhTGtBbBcr
 yj5YDDDbQn/0s0XncwS8jRrgzSSU3UUReX9Bnvi3SPSwgfYC4fbrYtg+q/41ZwL3QOuU
 Aa7w==
X-Gm-Message-State: AGi0PuZVkT7fWcH7V43QJVhC22/RCCfbWmQuBItETFrlQlUJTI6alsIq
 JwF1D4/ACWbMhXqbdxBQ/0ofWGF5/PPxFyl4OVm2wVb+
X-Google-Smtp-Source: APiQypI3tFYufmXQVRqZVVdLTos8zyHe2bLo9tB/ZKsu8F+Ttr/2IKfHGCczoNSTO/cJZfSsPNdug6QrSoiwttm7dQM=
X-Received: by 2002:a19:a411:: with SMTP id q17mr2955216lfc.214.1587657985332; 
 Thu, 23 Apr 2020 09:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587599094.git.rosbrookn@ainfosec.com>
 <c2d966b43313c9df64551b0ce31462c176445b70.1587599095.git.rosbrookn@ainfosec.com>
 <20200423102538.vxuo7s2lamkxhoo7@debian>
In-Reply-To: <20200423102538.vxuo7s2lamkxhoo7@debian>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 23 Apr 2020 12:06:14 -0400
Message-ID: <CAEBZRScj397TxGBrJ78Qi8jh_NWGOi8BL4TXciKZFayewysRNA@mail.gmail.com>
Subject: Re: [PATCH 1/2] tools: build golang tools if go compiler is present
To: Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 23, 2020 at 6:25 AM Wei Liu <wl@xen.org> wrote:
>
> On Wed, Apr 22, 2020 at 08:25:25PM -0400, Nick Rosbrook wrote:
> > By default, if the go compiler is found by the configure script, build
> > the golang tools. If the compiler is not found, and
> > --enable-golang_tools was not explicitly set, do not build to the golang
>
> --enable-golang-tools here.
>
> > tools.
> >
> > The new corresponding make variable is CONFIG_GOLANG_TOOLS. Remove
> > CONFIG_GOLANG from tools/Rules.mk since the new variable is set by
> > configure.
> >
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
>
> Acked-by: Wei Liu <wl@xen.org>

Thanks!

-NR

