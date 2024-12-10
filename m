Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED1B9EB742
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 17:59:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852917.1266571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL3Zn-0005iI-9i; Tue, 10 Dec 2024 16:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852917.1266571; Tue, 10 Dec 2024 16:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL3Zn-0005fS-6C; Tue, 10 Dec 2024 16:59:11 +0000
Received: by outflank-mailman (input) for mailman id 852917;
 Tue, 10 Dec 2024 16:59:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3V8=TD=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tL3Zl-0005fI-5V
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 16:59:09 +0000
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [2607:f8b0:4864:20::f30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 110dc6bb-b718-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 17:59:07 +0100 (CET)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6d8fa32d3d6so41822826d6.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 08:59:07 -0800 (PST)
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
X-Inumbo-ID: 110dc6bb-b718-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733849946; x=1734454746; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7vN7jpHairKQm0qZI5k4oOx70lgfLVBYXPZclRFKLE=;
        b=gO4hPq5IxhfdI24IOBrdnXvuVLMq+1STV6dr2X0II5vxC0YliZe2C7ryUCQlGYuJEK
         TM6SeRS/mp7WXbNtAg2VOjrlzuCJU6zS5+KjSAzL01GCrfVu/AVbW3ZAzcuYdXipIySz
         WAQvn5bI28ja5vbbPQ2SZ/7J4lBJJ8TH4NItk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733849946; x=1734454746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7vN7jpHairKQm0qZI5k4oOx70lgfLVBYXPZclRFKLE=;
        b=ub8PKbS+bzWMgU+AMqnUrsa8OroyH8pRtq2xVxbCwi+iTBm/gTi97z7tM28IE1GyuC
         W89OGZslSAOh8I0bfJJ3rOUm+iHtuPoo1Jwt6Ws1ktPrmCG+J9St0hlvlns1yPCfRyAd
         CQamxAsRoQOoJve8U7ObTNgC7vNavksAB5I2mc5ck/bK5GypwMBtNRSMFim7pr0bs0LA
         zZW1249SiYiI9k9PHKYnykFhq+GLDsYlvInOjnrejrXvAPk8vora7Vk/MUzifLjJkDSO
         ZeSai4wghdCDYxuP7Ai7nHViRU2WiBZ6GSdAbzQh3KchHq4aFYacgHyjUJjT69ymwxF1
         hC1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUD66oq9hpQNsqtF/675Zp53FXxoV61DocgpasvJPGUZ9jRWLiE7BDlKgih1gFc2WSxNTiH9R4t8Z0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZCdxolddBWT0S6niG5iM8txQrhb1fNskVBBIoxmXpYwfRGglr
	uOLEJOtrWfSFD8UQ6luxfD7ewXXCkVG24zr/93pOzqXSn36svOxCfwhvJMIZM8ca89AfxUy4Nt2
	SCGf3PrvnKVro+e7E25CE78lvBoR6TDKP0sVFDg==
X-Gm-Gg: ASbGncv9BjEytUebtbj059cWtC13d3zhL4iBUU5ZFcWnOJCVhI1jsJSjcNzoIV1M70i
	StFAk52BFs5E0Y/uFFppCIjFvhBx1B+pdhRIUSQ==
X-Google-Smtp-Source: AGHT+IGNw3JumkGkMivKX7EpPjqOd7xReLyS2c97oPwFQoKaNQUI4q156SPv2hADn0JT83VNkWvZlPwBqPH0ussKcvc=
X-Received: by 2002:a05:6214:f06:b0:6d8:ab7e:e55e with SMTP id
 6a1803df08f44-6d91e40b22amr78997926d6.34.1733849945888; Tue, 10 Dec 2024
 08:59:05 -0800 (PST)
MIME-Version: 1.0
References: <da8320f7-1baf-41f5-b7ac-c05b6371e1e4@suse.com>
 <D6838QWBS1OG.37M94XNPN17P7@cloud.com> <4e9c0566-bed7-47a6-aa6d-2ac76c0a1bfe@suse.com>
 <D6848HMS6BT5.RX9OAXRM91C8@cloud.com> <6b15ccd8-9525-4a85-9fde-bb53ee34761a@suse.com>
In-Reply-To: <6b15ccd8-9525-4a85-9fde-bb53ee34761a@suse.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Date: Tue, 10 Dec 2024 16:58:54 +0000
Message-ID: <CAFi36o36RLaxieu=VU3GrhekPEZmTPT2xd7yukcAZ6yCcRx=9w@mail.gmail.com>
Subject: Re: [PATCH] x86/FPU: make vcpu_reset_fpu() build again with old gcc
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 4:14=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 10.12.2024 16:12, Alejandro Vallejo wrote:
> > On Tue Dec 10, 2024 at 2:34 PM GMT, Jan Beulich wrote:
> >> On 10.12.2024 15:25, Alejandro Vallejo wrote:
> >>> On Mon Dec 9, 2024 at 3:13 PM GMT, Jan Beulich wrote:
> >>>> Fields of anonymous structs/unions may not be part of an initializer=
 for
> >>>> rather old gcc.
> >>>
> >>> Can you add the specific version for tracking purposes?
> >>
> >> It's all the same as before, and I really didn't want to waste time on
> >> once again figuring out which exact version it was that the behavior
> >> changed to the better.
> >
> > Just checked on Godbolt. 4.7.1 works and 4.6.4 doesn't. Adding that dat=
a point
> > to the commit message really helps when navigating git-blame, even if i=
t's not
> > as precise as it could be. Particularly if one wants to understand exac=
tly
> > which quirk of which version of which compiler is being dealt with.
>
> Well, thanks for sorting that out. I've added that info.
>
> > With the commit message adjusted with the offending GCC version (i.e: <=
4.7.1):
> >
> >   Acked-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>
> Thanks here as well. Any chance though you would be willing to upgrade th=
at
> to R-b? Only that would allow me to put in the patch without waiting for =
yet
> another tag.
>
> Jan

Sure.

  Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Cheers,
Alejandro

