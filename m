Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FD59845DB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 14:22:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802751.1213045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st4Yz-0001P5-4A; Tue, 24 Sep 2024 12:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802751.1213045; Tue, 24 Sep 2024 12:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st4Yz-0001MK-15; Tue, 24 Sep 2024 12:22:41 +0000
Received: by outflank-mailman (input) for mailman id 802751;
 Tue, 24 Sep 2024 12:22:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CoXS=QW=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1st4Yx-0000rJ-V5
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 12:22:40 +0000
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [2607:f8b0:4864:20::c2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af441ce8-7a6f-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 14:22:38 +0200 (CEST)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5e1b55346c0so2109125eaf.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 05:22:37 -0700 (PDT)
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
X-Inumbo-ID: af441ce8-7a6f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727180556; x=1727785356; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16ugtdQ7H0b5/A+iLdSCLv3U9trM9vtBdeqHFwDHOq4=;
        b=jF6TFqd88DTUAbMVfhclXDTNpSfk4m0oyRe3drF9I09juBumqp9jEcQhXEF2eQWLgY
         1KIm5s9CFu7UxNOnU1kDlGmdFL9Cr2J6winG+EgPVFKN4qT+UWh2yy3UBheMBwJSL0ib
         /3t8gyZUdLriQu3zZnl6QaaxNvlz/0oJL7dwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727180556; x=1727785356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16ugtdQ7H0b5/A+iLdSCLv3U9trM9vtBdeqHFwDHOq4=;
        b=u5K29wpLwWb37nq6nEs6a4HYzRG8k+1aZyN3CnwX3/pqqpuKxCRxoKaKO1txfW3szl
         ZbUAAcajQrC8eefs+YIpHX4S+PMsMDhHkpsrDnvQBeuq95wOSK1LV/4+Fhvf0ZuixU0z
         2ax3AuoGARnxUMGp+Fv/OtpKIrtCgBL1Ak//9TY7vnDK2bUQ2j7k0d8mbOLIHzkwlQEQ
         FObcg7DcomOq5z2ib7sjXALqt3AWuFy3oRq6btMZJipNpmkAeJX8Jc10j9w2bIikcwTk
         WCE6hlwBRmztjxnES/XUs/PSznGzb3+9YBjhe74PUAXR5dFXr8HHH0VriF3UPqyKeno3
         SWgg==
X-Forwarded-Encrypted: i=1; AJvYcCV6ZCH0LSgFxr6TuCjubZtEIhxqQufVkKKowFnBT4HJMvb9u/z18lVvUDdlPuhemOp1Ymw3O+UOvnw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw990cMzN9ImMYDUK09dlTdeffaCpku7r+ZNu/dwatJNSct7d78
	ruwm47dMW8aHqijEk52mVDadlsNIYRjSmNn7ekvxOWngiwSSHfQz874rr0S+h8DCEcsGwUQCi/7
	bkd9uzLqh7irYFcR5Zr5Bv4QMxYVOtUlTMr6yLA==
X-Google-Smtp-Source: AGHT+IEdk66WalK3XxsKO+TOfaZsPAPPELR8Pm3jF1ynPzb9PFzgfgjoovt6+1f3ytSIAiGqJUS5eSQ57pDzvi5iUz0=
X-Received: by 2002:a05:6820:828:b0:5e1:e748:7d2 with SMTP id
 006d021491bc7-5e58b9617a8mr6026816eaf.1.1727180556724; Tue, 24 Sep 2024
 05:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240919080021.20155-1-frediano.ziglio@cloud.com>
 <20240919080021.20155-4-frediano.ziglio@cloud.com> <f928cf8a-e047-43f0-bf1d-c864d5d0e317@suse.com>
 <CACHz=ZiFyiSaihgTL_rSqfNNag761+1QyAhytQhn5zM6tOUSsw@mail.gmail.com>
 <ac8a299d-ec25-431a-aa56-d8a10ca1220a@suse.com> <CACHz=Zh_Cr_Qfpz4vntBZfZ-HqYGH+DspEAJkVmeBKMNk_z-_g@mail.gmail.com>
 <89208fd4-eef5-4bb3-b9bb-b1ee6cd0dfb0@suse.com> <6499c5bd-8f51-4be4-ade1-c89ed07710c7@suse.com>
In-Reply-To: <6499c5bd-8f51-4be4-ade1-c89ed07710c7@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 24 Sep 2024 13:22:25 +0100
Message-ID: <CACHz=ZhN_de1T_JsZkFQgtAupSeF1hgWfKBsfb=xo3f3TRY-0w@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] x86: Align output sections for UEFI CA memory
 mitigation requirements
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 1:17=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 24.09.2024 13:09, Jan Beulich wrote:
> > On 24.09.2024 12:22, Frediano Ziglio wrote:
> >> 4- .rodata for some reason is not marked as READONLY, even on ELF you
> >> get the same issue.
> >
> > I can confirm this oddity, without having an explanation. It must be
> > one of the inputs; I've checked that prelink.o's .rodata is r/o. So it
> > can only be some other constituent.
>
> That's from .data.ro_after_init and .data.rel.ro*.
>
> Jan

That makes sense.
On a similar note, what about .text? I mean, all sections are READONLY
(or at least from mapfile) but .text is not marked as READONLY.

Frediano

