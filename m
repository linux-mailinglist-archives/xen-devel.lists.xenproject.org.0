Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E2F9A3E6B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 14:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821840.1235799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1m6P-0004gu-VS; Fri, 18 Oct 2024 12:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821840.1235799; Fri, 18 Oct 2024 12:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1m6P-0004eI-SX; Fri, 18 Oct 2024 12:29:09 +0000
Received: by outflank-mailman (input) for mailman id 821840;
 Fri, 18 Oct 2024 12:29:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHZo=RO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t1m6O-0004eA-F4
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 12:29:08 +0000
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [2607:f8b0:4864:20::c32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90b90871-8d4c-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 14:29:06 +0200 (CEST)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5e56759e6d7so1124947eaf.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 05:29:06 -0700 (PDT)
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
X-Inumbo-ID: 90b90871-8d4c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729254545; x=1729859345; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbpWdiQpGE3Bskr7WxrRo5EpezqbLDqpGCJ8x6fw77M=;
        b=L7qWdRHlm9dZ0PG9DrzMc+bF6v5sjjcVjSuAh9jywt1/3cA1s0t8BF7flYHNoup3Bp
         zbsIxi5iaWA6SFumN2+Ajtir6loTlOpMaFQkE9q+VQSx+MNYApks9z/Drw8vz9rCS1az
         Tn5kFBp9Nw2qIc7tmMyMZzsZGE2LGj3lOAON8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729254545; x=1729859345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbpWdiQpGE3Bskr7WxrRo5EpezqbLDqpGCJ8x6fw77M=;
        b=KetE18ED8rvfdRAcENZj7NpWoehVxKqxqhMNXn8V1Y1DK7ktPUshCgxsvN3+pFNNiy
         tk8yiCUEu0tRWKCk3IRe8ienpbpKDN9qEq8w+/d29bbW7QsFVgh7D5hwX85ePZQRYgrc
         gb+B07fBpHnLd7zJzHdsgkz2qW3DfYLXGvIh64Xa6re8mwsssKtrAJeAniSHivg9X832
         yzoG03EOOTUyT4iVsvciKWUbySpl9pVFhuOWqw4gguN+7OrfrxV6szyPaiO6PsEX+ci9
         qsMxPa9HSeFEoeAJX2QP5HKCvqZZ+b7bGjmVT7vtMIyqMRHh3cl0XddWm5jKRFPjv90Q
         Ix1A==
X-Gm-Message-State: AOJu0YwFob5qQXDFDG0Q4YDzHun9UYdKb/s+ZDy5PqyRuZLh//EyIn90
	ni1xzd8ovXVzR4fD5BA6idcvEhqH7vjRY5x7GrRtxe4RCWDddjmghukWgBop9HTLI5I7iT/z02h
	/G7AQwA5Gbuze+4lzKAjkPqnLlDaod7UVTmE0NQ==
X-Google-Smtp-Source: AGHT+IGo7na0RQQcXn7k9N5A9LHNzzvqDzEzR+XST8CqzPnsOzsEPpQmrgiStEC6ao1Ir2kKrRJdP/rmwGUqVmTzZIk=
X-Received: by 2002:a05:6820:82c:b0:5e1:c19d:3f4e with SMTP id
 006d021491bc7-5eb8b7e5be0mr1828460eaf.8.1729254545218; Fri, 18 Oct 2024
 05:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240926095133.483619-1-frediano.ziglio@cloud.com>
 <CACHz=ZgwcejTF0Yz5vchVy18Hn15LYp_R8Y1LqOA=qAHK-HRiA@mail.gmail.com>
 <CACHz=Zh9r7xFSsq3vxdBfss1ozJC1neoTFs4Dvpw+xeQiUFTsg@mail.gmail.com> <6d5bad39-1a20-4cef-a1c5-aaa99c501941@xen.org>
In-Reply-To: <6d5bad39-1a20-4cef-a1c5-aaa99c501941@xen.org>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 18 Oct 2024 13:28:54 +0100
Message-ID: <CACHz=ZhGUG8tihk6vVTLk6fJOe1mFk=Mep-YOB0ci46JsKJKEw@mail.gmail.com>
Subject: Re: [PATCH] Update deprecated SPDX license identifiers
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Ross Lagerwall <ross.lagerwall@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
	Paul Durrant <paul@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
	George Dunlap <gwd@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 1:11=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Frediano,
>
> On 18/10/2024 13:07, Frediano Ziglio wrote:
> > On Fri, Oct 4, 2024 at 9:08=E2=80=AFAM Frediano Ziglio
> > <frediano.ziglio@cloud.com> wrote:
> >>
> >> On Thu, Sep 26, 2024 at 10:51=E2=80=AFAM Frediano Ziglio
> >> <frediano.ziglio@cloud.com> wrote:
> >>>
> >>> As specified in LICENSES/GPL-2.0:
> >>> - GPL-2.0 -> GPL-2.0-only;
> >>> - GPL-2.0+ -> GPL-2.0-or-later.
> >>>
> >>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>
> >> ping
> >>
> >
> > ping
>
> Please try to be more specific.
>
> I see you already have an ack from Stefano (which would cover Arm +
> Common). What else are you missing? Is it committing? Do you need
> someone else to ack? If the latter, then please mention who you think
> need to ack...
>
> Cheers,
>
> --
> Julien Grall
>

Hi,
   I'm not a mind reader, so I don't know what is missing.
It's a style change with some updates which has been acked, so I would
expect it to be merged or people tell me what is missing.

Frediano

