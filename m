Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A1E738B1E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 18:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552972.863260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0gi-0004jr-Q1; Wed, 21 Jun 2023 16:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552972.863260; Wed, 21 Jun 2023 16:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0gi-0004hS-Mr; Wed, 21 Jun 2023 16:28:08 +0000
Received: by outflank-mailman (input) for mailman id 552972;
 Wed, 21 Jun 2023 16:28:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7i6F=CJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qC0gh-0004gw-E2
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 16:28:07 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99efc998-1050-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 18:28:06 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-987c932883bso738475566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 09:28:06 -0700 (PDT)
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
X-Inumbo-ID: 99efc998-1050-11ee-b236-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687364886; x=1689956886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlEDFRP0tiRbmO7FrNAjtN6GNTyBbp+Mjv5yk5N091U=;
        b=OiDWh/vMgfS/+68M9/jAnygsPDQk8pEIwWdV9VCfMdJt2F/c83/YfpRZ5Rr4gb+9tY
         41+oLxBYpdt08QWFkIuXlO/BQHct52icu75KNRi0wi9YnueN9ZmybwW1kNELSoCrnqYq
         hjhSfs6/HEZO2vW3sll23wXQcfXCQd9jibZwiG53mLUX01FVed1zmbTPtze28A6cfWBk
         LyfOiUhSYbxUF6CA6lgdhn8QODZ/lb6RMeYBucbLEAxeEKPDzvVzTzL6HFZEISV2PyId
         cF6vcYZapNcSsHUROKHVCHzMY9CrV+qrk+mqjHQFfy78vgxGwbiaBqMwZLjjVKbCwAES
         OEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687364886; x=1689956886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlEDFRP0tiRbmO7FrNAjtN6GNTyBbp+Mjv5yk5N091U=;
        b=b4WfrPJ/4XOoz/SHrhoKr45wRiJN+/QixRYRjAjxn6F2uLLo+HxuvO+aTKNMRB3jia
         cYZjZ8aC88LwtQMTtArvSlH+uWyuSt1QNIaP9ltWW9XhvMK4a44R+yUEAES99Utl51/i
         I9eWU2ysJs0shK12QJ2mFPo552om8NAB3msFOz068sEkTJZXJFEizuNnL9oAOEdxhqqJ
         qgiG5mo1KGmmkXMWHqtcvW/mml5dzXEMK4EWHfJWlNUWZAlpJb0VJpu89I54/QN6PZOX
         ZA+sgCCHvGEhbD09m35ObttQsNglnOOjHHA4de9Ehq0Zhc2HDqOlBc5yvneyDa8gNRZe
         fjJg==
X-Gm-Message-State: AC+VfDxw3aW+y2zhct11jVqx22E0PoL9d/BI0+u+eXitdo/dvTgXzrSw
	Nv6kkS1kVjjRyH+AbgYAPpcf1KOC8SaNNk6xU5I=
X-Google-Smtp-Source: ACHHUZ4yUN8dqXBqbSoiMFFjp8EYls1tVOdAC7ZPiYs+mAnIUFVkdQdEZyuzg++es8YFQVBofLkEssOki1wOHwsiYZE=
X-Received: by 2002:a17:906:eecd:b0:973:da59:7c91 with SMTP id
 wu13-20020a170906eecd00b00973da597c91mr14936872ejb.51.1687364885551; Wed, 21
 Jun 2023 09:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230621161959.1061178-1-anthony.perard@citrix.com> <20230621161959.1061178-2-anthony.perard@citrix.com>
In-Reply-To: <20230621161959.1061178-2-anthony.perard@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 21 Jun 2023 12:27:53 -0400
Message-ID: <CAKf6xpuUUQ06KKA2NdE_Vp_rjJ0Z2RG+rm2ZnvM+DcxRouzzgA@mail.gmail.com>
Subject: Re: [XEN PATCH 1/3] build: define ARCH and SRCARCH later
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 12:20=E2=80=AFPM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> Defining ARCH and SRCARCH later in xen/Makefile allows to switch to
> immediate evaluation variable type.
>
> ARCH and SRCARCH depends on value defined in Config.mk and aren't used
> TARGET_SUBARCH or TARGET_ARCH, and not before it's needed in a
> sub-make or a rule.
>
> This will help reduce the number of times the shell rune is been
> run.
>
> With GNU make 4.4, the number of execution of the command present in
> these $(shell ) increased greatly. This is probably because as of make
> 4.4, exported variable are also added to the environment of $(shell )
> construct.
>
> Also, `make -d` shows a lot of these:
>     Makefile:39: not recursively expanding SRCARCH to export to shell fun=
ction
>     Makefile:38: not recursively expanding ARCH to export to shell functi=
on
>
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Tested-by: Jason Andryuk <jandryuk@gmail.com>

Things are back to normal speed - Thanks a lot!

-Jason

