Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B418B5545
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 12:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713965.1114891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1ODZ-0001i6-8z; Mon, 29 Apr 2024 10:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713965.1114891; Mon, 29 Apr 2024 10:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1ODZ-0001e1-68; Mon, 29 Apr 2024 10:26:41 +0000
Received: by outflank-mailman (input) for mailman id 713965;
 Mon, 29 Apr 2024 10:26:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xS1y=MC=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s1ODX-0001dv-PB
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 10:26:39 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4b5f4b5-0612-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 12:26:36 +0200 (CEST)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-22fa7e4b0beso1530204fac.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 03:26:36 -0700 (PDT)
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
X-Inumbo-ID: f4b5f4b5-0612-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714386395; x=1714991195; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nfXhcv9K/kZBigfG/e7QMZiw0htPfEiHuRl5w2HGsw=;
        b=fvYWxj9ppHs8dzNmb88C46sez6vuoGB3cm3zNBjrHeQpEJ+vsyaQrhHhaDTPpcoCKu
         653l2Ucuk+JRzN/wk2ujLuqNRKzqE+Df1a8Q7oS+Wk5hka+1K4JcvfQnfjuym3CYx4fW
         BvgxJ6vpGWo+0jNZMaVKzFQ88fwhPIgBT577Of2AiHzPweJjG/VPCa0rs/Om46YnKHQg
         2DnmVyoXS/O102dzA7YOSiiCfUtNfyEKGmOOKAnWKSZ1cD1dQyhiNHNT6A/7HyKtW7PS
         wl5HtIg+DAKhUwjfPXiehW776DNC4XmDLvfrlaooCQCgej+FvBQBCuruGUWOzX4U7mmF
         U9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714386395; x=1714991195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nfXhcv9K/kZBigfG/e7QMZiw0htPfEiHuRl5w2HGsw=;
        b=BUMwi9s7a2ubjrjYtFOWSKi+Hyz5GVa5R8hEZLttc3WLgQI0684NOnO21+GnuvCls+
         Ry0dsx31zX1I6vfTfAPnDJRicaaDceMNreWpsRDzsSAyb1zvGrMZpnNlSpyUsWhAswwe
         EWUNt4diYVjAnoboraTs6Ci0M2nU/insHMPgm9qrgV4snGfCYJ6cci39FLI4AGfR7ata
         KKRPFj13bvMuKpFLma6We9SMKAritTvYo8jwVT1zmH5/cHqmh9STefVnpeGG4B6n666u
         ZVxKsmY2FgcpJUxEsJ86kvf2v1aa+KEH14iZSmpqE60OzV1Jo08P0GNV+sw9h3AaSAlp
         CESw==
X-Forwarded-Encrypted: i=1; AJvYcCUb67pNpduHd+DGoPDuqujEO/ERT3ZfOu9kbMpQ8sLfpAUBIwgI0RmYFdZ+MBse7IjBdUDKGsN9T8s0MMhqypBAfHrqbSVt/BjXiSp9aBU=
X-Gm-Message-State: AOJu0YxS5GzlFs+5ekpOVsuB+gLTJHY5W2fYtmuhmw2gSzi1e7Fnrn3j
	LnL1/IKR280S7HtRn7FHbG85ug+5dARksXtbcWZeQYXXPOuEg6spQiZKVkyV41raMwcPknRN3OS
	8kNII9ttbancTK0K7zxfrxL0KfgMFiW2V
X-Google-Smtp-Source: AGHT+IEDbqjoVgnM6jltbQiAa3ev5wBbpIQceMLvgo9ydqFP3dzs+VfU8qDadcKv38buIIeW+6sajPn4wBX7QRSfi9A=
X-Received: by 2002:a05:6870:180c:b0:22e:d0e3:925f with SMTP id
 t12-20020a056870180c00b0022ed0e3925fmr12094376oaf.1.1714386395146; Mon, 29
 Apr 2024 03:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1714322424.git.w1benny@gmail.com> <90082c0aa2047edf5764840f1903d1797ca4b902.1714322424.git.w1benny@gmail.com>
 <fd3efb33-6611-4c6e-a2b6-fe47f655c0fe@suse.com>
In-Reply-To: <fd3efb33-6611-4c6e-a2b6-fe47f655c0fe@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Mon, 29 Apr 2024 12:26:24 +0200
Message-ID: <CAKBKdXh7oRu0Yn_fUfVb_FcqRJZxDiYTo_iyPoSHnCp1ZpWSkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] x86/p2m: Add braces for better code clarity
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 9:07=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 28.04.2024 18:52, Petr Bene=C5=A1 wrote:
> > From: Petr Bene=C5=A1 <w1benny@gmail.com>
> >
> > No functional change.
> >
> > Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> Where did Stefano's R-b go?
>
> Jan

Oh no, I missed that one. Should I do v3?

