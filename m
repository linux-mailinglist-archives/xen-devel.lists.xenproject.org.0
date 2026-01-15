Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55C8D23E64
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 11:19:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204699.1519302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgKS9-0007cl-4E; Thu, 15 Jan 2026 10:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204699.1519302; Thu, 15 Jan 2026 10:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgKS9-0007b9-0W; Thu, 15 Jan 2026 10:19:45 +0000
Received: by outflank-mailman (input) for mailman id 1204699;
 Thu, 15 Jan 2026 10:19:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KgiG=7U=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vgKS7-0007b3-IH
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 10:19:43 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5084e64-f1fb-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 11:19:42 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-382fd45a1feso6573351fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 02:19:42 -0800 (PST)
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
X-Inumbo-ID: b5084e64-f1fb-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768472382; x=1769077182; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZVmO8N0UZYu/o2t/bIFeKiY6ewosWiZISEU6KWNQIw=;
        b=WVK1BXr68fCteuJrRVTcC8X28KRBa/uRznKVp4A7D8BveUpC+Z55Vgn5rSlBzD216T
         /4C4ZGxyeBecBLzWs3KFt1/AWRGBC6fjfzfZAHye0pouURoR7EYlb8RSBzfH72BmaO3X
         cvLStHtuc2tsjrwJGrL0HCcW3+9o5FZyzH+C/b45MwO11id05chgoWy+3opQtO82EmGO
         KmaO7Cq/FnUhjpXzD1bfBEpJXqBI6ELVtEDxK7ffO93AHNad7bCRORMxBYaXJlnPrOKP
         OC1y0eG2xfXykeAcmb4oFiFcgZeNcUz9kGOKLswlqdWdJuxdBtXF1xCX4XALibCE7eMg
         E3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472382; x=1769077182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bZVmO8N0UZYu/o2t/bIFeKiY6ewosWiZISEU6KWNQIw=;
        b=vwPB2iAr2ggXcR87wQv42KVjlUWJPbB23ugX2NXvOCBddqmPOFz5/bdCpu733N1Gp4
         87f/146TM6I68BAkKu9pD9mpAJgzMy+Gf43nyVWOLc+cUdg25OTgZOySMbb/VnPbk9Ry
         6kcbpcf66JO6OxZEJvtY2peoFzm/Y2BTLxw1aSpL8astUklsOAcfqLkC6i12gUmOUUzv
         DZAhHRIgGYwYVPwG6x5lFpR8nAg3XVBQANkVuywdfrSBiRkTlcN3M0vph1/AH3cBPaE5
         XZON18H08m4RzAToBe0Hl2X/xOjxASVxf3KMGdr0Ym1tBhi5f0caEbcrEzJYT7jIWXlP
         +3CA==
X-Forwarded-Encrypted: i=1; AJvYcCWY/d6kw9Aiv8Aesr49EJAzTqV/1rQPnkSGhuZkxX7PKdmpxt4lCQvW4BIBxZ8XbXFQmhZDX/DS2pM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfC3qzLFwNlIt6LmqKKTEmPmh41ISeXLBQYPAlxEfLlcU9VF7o
	RMJ1GyE6tT71ZriLVxElCxREfJ9dVon0MMi/LvzYTMkZMUSvaoTYq+Pzqx1QFHBRf8mj7oVJ8wG
	zuuOTeqiJZAsdF5DztT/cUtRg+HLw53M=
X-Gm-Gg: AY/fxX61mN16hMZj4DqGOShjPOsNbGxfBDOfELY25RO43A1FRM2HhDXDD60/jBOfzHf
	LXq/JBmvwJaeQylyHpY2VIdrpAOwii4GwQk9sjk1RdKt7W2Gz9qA8P9KsGmrxJNGion3C3R260G
	JhgTYscsOyjyGfFL/rCFjnkeAJsItfwYhineUHt2IfScNExibEUo8XV96c2/89RTUejZZwvDcNN
	nnZP+T6KpTA0qOr64NQ/plc/fYic/TuNl8Bt22cTcppZmHTDRMrFqPkxr89AivH7wcNmcp7hOrh
	DawEqZjsniaOuDsUkDE6FdT1
X-Received: by 2002:a2e:b88d:0:b0:382:f9c6:ba68 with SMTP id
 38308e7fff4ca-3836ee0044cmr7611511fa.0.1768472381818; Thu, 15 Jan 2026
 02:19:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765472890.git.mykola_kvach@epam.com> <66fffded45f39599c62a1e4dad83c34f9de51d7d.1765472890.git.mykola_kvach@epam.com>
 <5bfbdbc6-c1ea-4aa6-acf0-1516b226f3c2@suse.com>
In-Reply-To: <5bfbdbc6-c1ea-4aa6-acf0-1516b226f3c2@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 15 Jan 2026 12:19:30 +0200
X-Gm-Features: AZwV_Qgt-1wOFbpC4qdZWzyD2qoK2Irfj7GqqXCWRcz4FktmgBTycqaQL1kkwck
Message-ID: <CAGeoDV8PDwmFMY-mfESUJjBokgRHDg+bT4BPqMNK3hMnWROjkQ@mail.gmail.com>
Subject: Re: [PATCH v7 12/12] xen/arm: Add support for system suspend
 triggered by control domain
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Rahul Singh <rahul.singh@arm.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, 
	Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, Dec 15, 2025 at 1:49=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 11.12.2025 19:43, Mykola Kvach wrote:
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -137,6 +137,11 @@ config HAS_EX_TABLE
> >  config HAS_FAST_MULTIPLY
> >       bool
> >
> > +config HAS_HWDOM_SHUTDOWN_ON_SUSPEND
> > +     bool
> > +     default y
> > +     depends on !ARM_64 || !SYSTEM_SUSPEND
>
> As written, this would want to be "def_bool y". However, I think I indica=
ted

OK, I=E2=80=99ll switch this to def_bool.

> previously that imo it would be nice if we could stop adding more "depend=
s on"
> referencing particular architectures. Instead "select" or "imply" from
> xen/arch/<arch>/Kconfig appears more desirable to use in such cases. That=
 way
> each arch can control what it wants without needing to touch common code.
>
> As an aside, in the context of PV_SHIM_EXCLUSIVE it was also said several
> times that negative dependencies aren't very nice to have. Here we have n=
o
> prompt, so the "allyesconfig" concern doesn't apply, but I still thought =
I'd
> mention this.

I used the common-level dependency only to avoid adding selects in every
other arch Kconfig, as the only exception I need is
    ARM_64 && SYSTEM_SUSPEND.

If you still prefer keeping all arch-specific handling under
xen/arch/<arch>/Kconfig, I can rework it accordingly.

>
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1324,6 +1324,11 @@ void __domain_crash(struct domain *d)
> >      domain_shutdown(d, SHUTDOWN_crash);
> >  }
> >
> > +static inline bool need_hwdom_shutdown(uint8_t reason)
>
> Personally I think "want" would better express things, but I don't really
> mind "need".

I'll change it to "want".

>
> > +{
> > +    return IS_ENABLED(CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND) ||
> > +           reason !=3D SHUTDOWN_suspend;
> > +}
>
> Seeing this in use, I wonder if HAS_ is really suitable here.

What name would you consider more suitable here?

Best regards,
Mykola

>
> Jan

