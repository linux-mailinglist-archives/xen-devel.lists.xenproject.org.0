Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9067299E9
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 14:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546033.852623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7bDi-0007Oh-1l; Fri, 09 Jun 2023 12:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546033.852623; Fri, 09 Jun 2023 12:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7bDh-0007N2-Uo; Fri, 09 Jun 2023 12:27:57 +0000
Received: by outflank-mailman (input) for mailman id 546033;
 Fri, 09 Jun 2023 12:27:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aHKT=B5=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q7bDg-0007Mt-RI
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 12:27:56 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f809a42-06c1-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 14:27:55 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5169f920a9dso3783884a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jun 2023 05:27:55 -0700 (PDT)
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
X-Inumbo-ID: 0f809a42-06c1-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686313675; x=1688905675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6eznpnb4WE1YrVxeEoTzAdGBnzBAGxVYJjgDduCRWY=;
        b=A0qVZhFsJvyNxYngSYEwCP1x84ItLbc0oJsvh6HpK44cekoqJ/aDLJwvLyRMpUc9QD
         2V1F6+Yqz41DmRoQQ5HH72YHuC3f8qs0lAjkQ5U+8nPFliJRbRl4DbR3zmpTciKQXYCl
         0Xz0OnYsCjsUnmMwLCQY/o4bZu//hAJNb0wFgFzFIfSI55GjZGonFp5dH9OhUHBBWUGc
         DZIbcF1m9s9t+V04tySvAmQUR8E70DSFcSoZH6gSpSrcf4ACnORoFf5p0t/gCuk9U8Zr
         PYG30KcknjKomwvYlaXC1TxT5purx5LuJRpjhdFh1vhfjhCcHgAJeEVc7NFEDhzApV+5
         POBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686313675; x=1688905675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6eznpnb4WE1YrVxeEoTzAdGBnzBAGxVYJjgDduCRWY=;
        b=l/qz6KPw+5C7pkXd2UODPWP9Iyi5CWi3LFqOzHb4iMYiZ/UtOLmKjbUspuPvX18Zs1
         8At1TEq/xUEF15pMXOPR96PQjbJMbc8YXT7Soea4OIRI3yfwbs0zUPMGlJM5P9nQPJsV
         LwuaDjivT3Y5PCkYxtCI8Sj84OJHJ7Xl08tkBne4PntrH5T5SdMKWe1Dgg9xs5uIOHxu
         JQapJ4Wujl1dbkyXeoYdND2v9Ekrx/H1JtNIrCTUHPQ90lscsTEYpy87HDcdVRov7vPr
         HFSMIwTkabRpdQ8Dm6iIHF8kq1NrlPODncGFbOInHRffolBVeej1o8lamtN/gyjySGxe
         174Q==
X-Gm-Message-State: AC+VfDyC6IMqXw12GBMbM1Bh4VCLvGjYL6fAyzdRGCzIG3roe+/lPEJ8
	U0OB+4YT1PCcgSyAWrkov53LhW97tOkEeQZWXerXFdu2
X-Google-Smtp-Source: ACHHUZ7C0QCrSclOVlBMuSDBw2xkfuIARt30LEC2XPFYcZ21DStRA2u7nDRl8fDluB/kg7DHC/HbtkZi8ueWiD7nrHQ=
X-Received: by 2002:a05:6402:1018:b0:516:4414:eba0 with SMTP id
 c24-20020a056402101800b005164414eba0mr1866574edu.4.1686313674808; Fri, 09 Jun
 2023 05:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230609101105.2585951-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230609101105.2585951-1-andrew.cooper3@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 9 Jun 2023 08:27:42 -0400
Message-ID: <CAKf6xpv0A63Wq6botd-WxgRigSbf4MfNc2rb2vS5U1O-aLDY3Q@mail.gmail.com>
Subject: Re: [PATCH] tools: Move MASK_INSR to common-macros.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Luca Fancellu <luca.fancellu@arm.com>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 9, 2023 at 6:11=E2=80=AFAM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> MASK_EXTR() and MASK_INSR() are a matching pair.  Keep them together.
>
> Drop the pair from x86-emulate.h which includes common-macros.h.
>
> Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling for =
Arm")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

I have (and will now be dropping) an equivalent patch for my
forthcoming HWP v4 series.

Thanks,
Jason

