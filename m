Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E7EA56666
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 12:16:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904888.1312686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqVfe-0001Js-9Y; Fri, 07 Mar 2025 11:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904888.1312686; Fri, 07 Mar 2025 11:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqVfe-0001Hh-6v; Fri, 07 Mar 2025 11:15:14 +0000
Received: by outflank-mailman (input) for mailman id 904888;
 Fri, 07 Mar 2025 11:15:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xMDZ=V2=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tqVfd-0001Ha-0E
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 11:15:13 +0000
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b101417-fb45-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 12:15:04 +0100 (CET)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3f66dae4db9so1096475b6e.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 03:15:04 -0800 (PST)
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
X-Inumbo-ID: 6b101417-fb45-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741346103; x=1741950903; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aC+mRq0zftwvLnH56/1dj9mNI5kr+QrZy3+JWI7HWko=;
        b=gd+Fc5gWVsh55G6Fcxncy0fFGMk9oKA36XieMIkuROeUn0auuFcXx2MWYcchlgfeOh
         nLzxhz0+YvuP4oAET09sx+nwLzhbfEiES/gJuuG834OLwUbjjpiTMV3jBFb0qry96DEE
         jcdlwVPic2WRiU+EU4C7deVdYuc/s2gPmYPJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741346103; x=1741950903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aC+mRq0zftwvLnH56/1dj9mNI5kr+QrZy3+JWI7HWko=;
        b=eBL32Jj2jofNrOIkd9F7E2DQzBHsESSCeaAx4x64b1Yn2uaSnsZ5mrM7uAigfrBicJ
         RR3QueDSnKBUHonDXcFPuPO0PLjNY/JIk73Jcppg/4/4W+ZJdnT/V2/0EOdniFMVvAi0
         63kxl+v1uJZzrEmxYLaUfBQzkVFZYBPpaP1/YxyOdgXrIP0uE/lZSq8zEZ+xlaRc30VF
         s2emM0c9gvNY1fXxUbhjZzE7HmV+gv/6q0o3/vLCexe5XGENw52GaanAsbMdHx6g6Tfj
         WiYR94Zub1/kyNOEn3ALnxbi0/usyB2GLJKXyhpxgK6NCslmqGTiLkMKCsOflvXOSvO9
         koJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOVt3hMDZAdhuj1S7JOfPzt0cZiueLRbdGOSI3+CoP6LMfDUTf36jX7R15C2z3C/U2Z4sZVB17W1U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmslSVH3jcrwWVecaXoVqtq/QWviknbYJ7qp2hNWfef6+WLVgL
	kom/shJMI50oj4LXDgZ67VC/zcBCzj9ag7tOiFEnT2q8PD7avRi53V81jHxCbLWhbm/vl5Belfz
	RSN3rtCIqiew1lYafIrSNeHlNO4GO5ObCSic+oQ==
X-Gm-Gg: ASbGncvrcJmtSQqQuNkncIUF5TeQO0YnLCtiAo6XZsROOf5bHmn7bFkIRxdgSeDACz+
	nwHu/vzHFmKRf+RjVJzO6onKdqG38+maU1cSCC6g8vKeteSHV4dF9Oiz2NXmTUcMHUqUG7hoNyp
	HN1xqecuV71KS/bDE+P+i/PSGtZQ==
X-Google-Smtp-Source: AGHT+IHS+8sjc5YG92F0jPHMOtSWgd5xfM0ddbwObbq034Q1F2GLBGE1S1EJ2zlSWt+Q5PT+yX0vy3cVNnVd7DpetaE=
X-Received: by 2002:a05:6808:2201:b0:3f6:6d32:bdb4 with SMTP id
 5614622812f47-3f697bcd23fmr1526628b6e.24.1741346103371; Fri, 07 Mar 2025
 03:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20250225140400.23992-1-frediano.ziglio@cloud.com>
 <20250227145016.25350-1-frediano.ziglio@cloud.com> <a14c6897-075c-4b2c-8906-75eb96d5c430@citrix.com>
 <Z8GuItUuhbF1UZ9V@macbook.local>
In-Reply-To: <Z8GuItUuhbF1UZ9V@macbook.local>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 7 Mar 2025 11:14:52 +0000
X-Gm-Features: AQ5f1JprH-QX_1EZaSQq9Kv8z1dnQxxStGxVbnOaCg1A07TCPjKd2tyHe_b2rh0
Message-ID: <CACHz=ZjurD-dvVOnOCJv4q02UV4iy78J5hJ8rMh1UPAZBbfaXQ@mail.gmail.com>
Subject: Re: [PATCH v2] xen: Add support for XenServer 6.1 platform device
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
   after all discussions on this thread and Xen-devel, can we agree
that this patch is good as it is and can be merged upstream?
Just to make it clear, it was already acked.

Regards,
   Frediano

On Fri, Feb 28, 2025 at 12:37=E2=80=AFPM Roger Pau Monn=C3=A9 <roger.pau@ci=
trix.com> wrote:
>
> On Thu, Feb 27, 2025 at 03:41:54PM +0000, Andrew Cooper wrote:
> > On 27/02/2025 2:50 pm, Frediano Ziglio wrote:
> > > On XenServer on Windows machine a platform device with ID 2 instead o=
f
> > > 1 is used.
> > >
> > > This device is mainly identical to device 1 but due to some Windows
> > > update behaviour it was decided to use a device with a different ID.
> > >
> > > This causes compatibility issues with Linux which expects, if Xen
> > > is detected, to find a Xen platform device (5853:0001) otherwise code
> > > will crash due to some missing initialization (specifically grant
> > > tables). Specifically from dmesg
> > >
> > >     RIP: 0010:gnttab_expand+0x29/0x210
> > >     Code: 90 0f 1f 44 00 00 55 31 d2 48 89 e5 41 57 41 56 41 55 41 89=
 fd
> > >           41 54 53 48 83 ec 10 48 8b 05 7e 9a 49 02 44 8b 35 a7 9a 49=
 02
> > >           <8b> 48 04 8d 44 39 ff f7 f1 45 8d 24 06 89 c3 e8 43 fe ff =
ff
> > >           44 39
> > >     RSP: 0000:ffffba34c01fbc88 EFLAGS: 00010086
>
> I think the back trace might be more helpful here rather than the raw
> code?
>
> Not sure if it helps, but there's a document in upstream Xen
> repository that lists the IDs:
>
> https://xenbits.xen.org/docs/unstable/man/xen-pci-device-reservations.7.h=
tml
>
> It would be good to record the information you have gathered about the
> different devices somewhere.  Maybe xen-pci-device-reservations would
> be a good place to list the intended usage of those device IDs, as
> right now it just lists the allocated ranges, but no information about
> what's the purpose of each device.
>
> > >     ...
> > >
> > > The device 2 is presented by Xapi adding device specification to
> > > Qemu command line.
> > >
> > > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >
> > I'm split about this.  It's just papering over the bugs that exist
> > elsewhere in the Xen initialisation code.
> >
> > But, if we're going to take this approach, then 0xc000 needs adding too=
,
> > which is the other device ID you might find when trying to boot Linux i=
n
> > a VM configured using a Windows template.
>
> Won't adding 0xc000 cause issues?  As then the xenpci driver will bind
> to two devices on the same system (either 0001 or 0002, and
> additionally c000).  As it's my understanding that the device with ID
> c000 will be present in conjunction with either a device with ID 0001
> or 0002.
>
> Thanks, Roger.

