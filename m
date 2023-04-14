Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8806E1CE8
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 09:04:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521031.809283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnDTH-0005fd-Ob; Fri, 14 Apr 2023 07:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521031.809283; Fri, 14 Apr 2023 07:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnDTH-0005dO-Lc; Fri, 14 Apr 2023 07:03:47 +0000
Received: by outflank-mailman (input) for mailman id 521031;
 Fri, 14 Apr 2023 07:03:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZM4c=AF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pnDTG-0005dI-GM
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 07:03:46 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7eb28b0a-da92-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 09:03:44 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id v10so3166817wmn.5
 for <xen-devel@lists.xenproject.org>; Fri, 14 Apr 2023 00:03:44 -0700 (PDT)
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
X-Inumbo-ID: 7eb28b0a-da92-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681455824; x=1684047824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGMx0rmfx67kzWt9O29eEw74QbvsMz8TesWbQZyGcC8=;
        b=A2xCGLMkFPbx/h9fqDpYraPYo3ESuXtY3oggNU2cCMvTPFP3avZx17oydoAS3SfmWI
         NkE3aYXm/bAqF68ftQbw/UBSrGtsVs5A4ZsjHi+XJlxtxLYusguKrtKTBgIM21cro8UX
         OR0ehdHAbCiUjcB2KAWEwQedPBEgfFNyAL3a3ZupkEVQHXUjvgHqNTgvP3PnnqM3osoP
         2uSIJY8c4oBbt4zphAFlVJV733jeMiEnn1txsiPoxHmg5JHl9foXC8w7LeYN9XTcDZKX
         U4MLFRyS9+nvoImS6IwXXvDsDoFPGvAmNV5aZQOgLhF3lg+Rn3Be9HTEPaNOTpwY1TyM
         w1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681455824; x=1684047824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGMx0rmfx67kzWt9O29eEw74QbvsMz8TesWbQZyGcC8=;
        b=NBixKFAZa/0UHPuMxZklXXLZgQIwy+guMfQN6PNHS1BiGeCoqi2A7/0pHSfVJGDIfH
         LCsUsAQburG8G/0FWxNfwbMPCyZCrIz6T3ZTkht2EGboBZHP+wVRnwXAECjnqC0WevDk
         nEOxgF6NqD9+TSdsklOkI5TDO4aoc14U3zWxHFNsPe2anKO2UgCxsND96WnKUR89OyWW
         sBbqIZ03UZlzDs370hNu6zwvKTubJycQUxrOGcmhel86tyWbyhbD0aQPxH7d6ZXeCCQY
         Zl19M8bYzsy0MHHf0zCAasuEazEhPA0eA5c0xA0PXH++kLgJqNX6TTN3Pdp6Q0Y0FGFX
         exBA==
X-Gm-Message-State: AAQBX9flPbJxBmBWJTtYZs5lWR6Ha8fLZi05Sw5yswhlAWit14WJBuud
	ArsL769enVHv+2rJBb3QiGh0n80HQvmFwlujN0RPEg==
X-Google-Smtp-Source: AKy350ZoyKfVIgsqyF/4nTESSIivT20YSwuFJPYTkxQN1FJIwTSEP+bFEv/+UpBMZ9k2LpwG6DrAG7GbzAc3spqlToE=
X-Received: by 2002:a7b:c4d0:0:b0:3f0:b15c:e6b8 with SMTP id
 g16-20020a7bc4d0000000b003f0b15ce6b8mr237961wmk.4.1681455823956; Fri, 14 Apr
 2023 00:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-4-jens.wiklander@linaro.org> <AS8PR08MB7991029EED281DD96108D4C292989@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB7991029EED281DD96108D4C292989@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 14 Apr 2023 09:03:33 +0200
Message-ID: <CAHUa44Hc054rLkFrvonK6X+AReonh2B_TaWwOJDK2TR5G2Jgcg@mail.gmail.com>
Subject: Re: [XEN PATCH v8 03/22] tools: add Arm FF-A mediator
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henry,

On Thu, Apr 13, 2023 at 1:53=E2=80=AFPM Henry Wang <Henry.Wang@arm.com> wro=
te:
>
> Hi Jens,
>
> > -----Original Message-----
> > Subject: [XEN PATCH v8 03/22] tools: add Arm FF-A mediator
> >
> > Adds a new "ffa" value to the Enumeration "tee_type" to indicate if a
> > guest is trusted to use FF-A.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I'll add that.

Thanks,
Jens

>
> Kind regards,
> Henry

