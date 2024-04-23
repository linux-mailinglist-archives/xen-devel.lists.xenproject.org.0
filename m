Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9199B8AEA04
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:01:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710757.1110192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHe7-0007Ao-Bd; Tue, 23 Apr 2024 15:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710757.1110192; Tue, 23 Apr 2024 15:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHe7-00079D-85; Tue, 23 Apr 2024 15:01:23 +0000
Received: by outflank-mailman (input) for mailman id 710757;
 Tue, 23 Apr 2024 15:01:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nbx+=L4=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rzHe6-000791-43
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:01:22 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57b1b87b-0182-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 17:01:20 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-516d4d80d00so7440229e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 08:01:20 -0700 (PDT)
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
X-Inumbo-ID: 57b1b87b-0182-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713884480; x=1714489280; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESOg7SGD6GYiPUl3T/442BEGSgS0PiMFYOlnFJkA7wc=;
        b=l0hMUCg+kVzhw6UZYtUCDW5Vnq/a32GRVjZ+LtAx5eUOkHNUm/E09TWEce6goD9J1W
         AsfVnuVXMqZWnPi7tI4ufy5b3+/+Q2hJVha4tYGLPO1lZvkxVmdZOpbrRs3+5VwBKSSr
         4eY0sL6aFnAwUn38IrJIXa+uW4w8rSRyLATm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713884480; x=1714489280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESOg7SGD6GYiPUl3T/442BEGSgS0PiMFYOlnFJkA7wc=;
        b=OGF03LireaQlNqTh6XujP9oPjdnIx2e4YaCDiFSCpU9CuYS4uToQYWiMdfkyaWGH+H
         v3vkYmzDGQmg2i1LuY9N+m1/rH3aS0atR9yxHQpOEAUTBjCbxveBgQN9lFt7gARIoNAe
         k/fMVjSubYb9uEtBoo3a9S7pgtO+vrAtEkLUuQmwYTRybOSK9G6NfwBSBls4vKxBdgk9
         EP7/vFBrItWWaE2VFEt2O3i4PQm7/nG2jEwSZVVlg6q0oVMLKdf7r3eya9xyqgit9ZJ2
         aB5y3t1XB5sxovtRy/Sjs2ybiwQPKqU4QBP91KvnZS8JW3zjbp0sub8VAH4WEEm1K+fE
         pRpQ==
X-Gm-Message-State: AOJu0YwRgZH7hl/2a5bYm/uoFLl8oclJyZav5LAwoDTHyf9/uJUYQ1de
	jOo8OK0KbJVsNQ+EZspLUrjIotkQANCwoD1dDrzVRg4enoS0t16Hu9Q8z9BtCtlkqUGboWi4GyQ
	G2zDbg2SaUnypADifgbbB5r0sgISu8o8OrCFiTQ==
X-Google-Smtp-Source: AGHT+IFlNb/K7tIIOc2G2pZppcDSl/+e76U4EH8HP9C7iLvFQwS5gHvue4ryH41GlbYSjJ5x1sdEoZQvnnkEAlt6y/Q=
X-Received: by 2002:a19:7019:0:b0:518:96b5:f2c5 with SMTP id
 h25-20020a197019000000b0051896b5f2c5mr10177881lfc.46.1713884479547; Tue, 23
 Apr 2024 08:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240416091546.11622-1-fouad.hilly@cloud.com> <20240416091546.11622-2-fouad.hilly@cloud.com>
 <c865e0ea-fee1-42e8-a30f-5344863d00e9@citrix.com>
In-Reply-To: <c865e0ea-fee1-42e8-a30f-5344863d00e9@citrix.com>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Tue, 23 Apr 2024 16:01:08 +0100
Message-ID: <CAJKAvHawk_o1Eu+KK8RmALK_B2mSUrKvm+dHsvJ2W+AuqgSrNw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] x86: Update x86 low level version check of microcode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 11:05=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 16/04/2024 10:15 am, Fouad Hilly wrote:
> > Update microcode version check at Intel and AMD Level by:
> > Preventing the low level code from sending errors if the microcode
> > version provided is not a newer version. Other errors will be sent like=
 before.
> > When the provided microcode version is the same as the current one, cod=
e
> > to point to microcode provided.
> > Microcode version check happens at higher and common level in core.c.
> > Keep all the required code at low level that checks for signature and C=
PU compatibility
> >
> > [v2]
> > Update message description to better describe the changes
> >
> > Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
> > ---
>
>
> As a general note, your v2/v3/etc changelog needs to go under this --- li=
ne.
Noted.
>
> ~Andrew

Thanks,

Fouad

