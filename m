Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D21A95FA69
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 22:10:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783586.1192873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sig34-0005KW-WA; Mon, 26 Aug 2024 20:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783586.1192873; Mon, 26 Aug 2024 20:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sig34-0005Hj-TS; Mon, 26 Aug 2024 20:10:46 +0000
Received: by outflank-mailman (input) for mailman id 783586;
 Mon, 26 Aug 2024 20:10:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G5kA=PZ=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1sig33-0005Hd-DF
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 20:10:45 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4629b034-63e7-11ef-a50b-bb4a2ccca743;
 Mon, 26 Aug 2024 22:10:44 +0200 (CEST)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-70949118d26so4707234a34.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Aug 2024 13:10:44 -0700 (PDT)
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
X-Inumbo-ID: 4629b034-63e7-11ef-a50b-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724703043; x=1725307843; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnF/XdMCXwGTcz8NWuFhou634GxQVc10IqMOlTd2QIg=;
        b=AeYMM2HviPaUqp33D1zALdV7NeiziP2q05kKDAcJWZeU2HW3H+2MQAl+qJ9VSn1zC/
         vPLM9d9u8QYxfJNLcHlw4byNpf+tnVVDC51kLlWHKJvfntecB67NhyM2/v8GGm1QtapT
         VGeI9L8yZiSqdAG4xYG6nYfJN7lAX012Y5Q3wN47ePMDDVT8o2Cgfnv03lNFRmDEPs8f
         0C8dKqMvNLi9Z3G6+netnHTlIgCoHDrFK3R1vOFqn2qq3Th/wmwi8slcmq0pneFrVj+9
         1aouV9lYjreenyK0kgrGVDdhuqmT6OiZB9CIiwUqlcGf4bzAXmvdu6GXijru0Rw5w1/M
         Lw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724703043; x=1725307843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnF/XdMCXwGTcz8NWuFhou634GxQVc10IqMOlTd2QIg=;
        b=L2ZfRVxaWCyO0tGgIe1SwVSzSl/TMZbIb5U+b6TF3w3DUrdrZOkRP8LJ6W37xLfusH
         Sj0Kp2DxHU1RQEtouC8QGzoeeezDjzROEpMTtHviJtck4yoVZ9FFfxyYmFK42Ty8JFJn
         +nqj8NMVB6oHeW3hA1lNnNXuy6ZrvwaTr0erpBZZe/UzbwATrrHT3HKAuz/AwyzYsP5c
         UDKDjgLDAfkiU+cBynUDsYQc2/IpyJ6xP/CAw77s3BoknK8czl6/h/VIj8hTIYr82yWz
         iaCMXQKb7GLCWF5mb+hWD5E00JNV8mMVnA+ATZxFRHQxvxDIx7s9nno6MQkhJ0AGL4AM
         psmA==
X-Forwarded-Encrypted: i=1; AJvYcCXE9mv74Eq2l7AZQtqNU+XVhRrTCSbnPdA+pRlRtoO+BJci9FavjcZWZxHJf9RC5QhnRHGwq4PLFl4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxI4V7PcA2gPFnjTINf7c3vrqSd39FRe7strdIrPxe6mSpoGyKg
	j1Za06vBfGdQAjoHgzBNeEZe8aq37XI3AfA8yxbpwRZ4hNoBAiXTImWDPC+wwPMesFXVL1zf513
	KJ/Sv5VJiuJO2UZNgjJBgdlhGhWQ=
X-Google-Smtp-Source: AGHT+IFtKoPAV4ypYxfojxEGUHlgo9o3AzRRft31sPbid5z2Yyt+aXSOviBjt0WMaNjJHNZ6YYLnjEW9YSaBVTFHxdI=
X-Received: by 2002:a05:6830:6f48:b0:709:4065:63e6 with SMTP id
 46e09a7af769-70f482eaf41mr619903a34.12.1724703043175; Mon, 26 Aug 2024
 13:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <2b747d672eeadc1150d3b84f0303e1d288311133.1721391876.git.milan.djokic@rt-rk.com>
 <728bb10e944a7ec28a67c2e9e62910632eb2366b.1721758832.git.milandjokic1995@gmail.com>
 <1e898a3c-b881-4ca8-99f0-48f51ed28098@suse.com> <CAKp59VEM6UWHM1Yu9NToFu9T4GfJpgKiXdAzA096KMVcMRqEsg@mail.gmail.com>
 <a84aaeed-6310-42fa-97e9-b391273c0132@suse.com> <8304166e-cc8f-4811-95e3-3c4414ef7726@apertussolutions.com>
In-Reply-To: <8304166e-cc8f-4811-95e3-3c4414ef7726@apertussolutions.com>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Mon, 26 Aug 2024 22:10:31 +0200
Message-ID: <CAKp59VHW6npgCQyOigHTCZGAKcV3Jxj+MU+pe_1aE=byb62xNw@mail.gmail.com>
Subject: Re: [PATCH v2] xen: PE/COFF image header
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jan Beulich <jbeulich@suse.com>, oleksii.kurochko@gmail.com, 
	Nikola Jelic <nikola.jelic@rt-rk.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Milan Djokic <milan.djokic@rt-rk.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Daniel,
On Mon, Aug 26, 2024 at 6:16=E2=80=AFPM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> On 8/19/24 11:39, Jan Beulich wrote:
> > On 19.08.2024 17:34, Milan =C4=90oki=C4=87 wrote:
> >> On Mon, Jul 29, 2024 at 1:42=E2=80=AFPM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>> On 23.07.2024 20:22, Milan Djokic wrote:
> >>>> From: Nikola Jelic <nikola.jelic@rt-rk.com>
> >>>>
> >>>> Added PE/COFF generic image header which shall be used for EFI
> >>>> application format for x86/risc-v. x86 and risc-v source shall be ad=
justed
> >>>> to use this header in following commits. pe.h header is taken over f=
rom
> >>>> linux kernel with minor changes in terms of formatting and structure=
 member comments.
> >>>> Also, COFF relocation and win cert structures are ommited, since the=
se are not relevant for Xen.
> >>>>
> >>>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git 36e4fc57fc16
> >>>>
> >>>> Signed-off-by: Nikola Jelic <nikola.jelic@rt-rk.com>
> >>>> Signed-off-by: Milan Djokic <milan.djokic@rt-rk.com>
> >>>
> >>> This looks okay to me now, but I can't ack it (or more precisely my a=
ck
> >>> wouldn't mean anything). There are a few style issues in comments, bu=
t
> >>> leaving them as they are in Linux may be intentional. Just one questi=
on,
> >>> more to other maintainers than to you:
> >>>
> >> Are we supposed to CC someone additionally for approval?
> >
> > No, you did Cc the right people afaics. You may want to ping the mainta=
iners,
> > though.
> Should this not be submitted as part of a series that makes use of it?
> Would doing so not also address what declarations are actually needed?
>
We have sent subsequent patch (after this one was committed to
staging) which modifies x86 implementation to use these declarations:
https://lists.xenproject.org/archives/html/xen-devel/2024-08/msg01110.html
My understanding was that we need to separate patches which reuse
existing open-source code from the ones which update xen source
itself. Since these changes are not too big and do not relate to
multiple
Xen topics (only EFI), I thought that they are not applicable for
patch series. Although after your comment it seems that I could be
wrong :) .

BR,
Milan

