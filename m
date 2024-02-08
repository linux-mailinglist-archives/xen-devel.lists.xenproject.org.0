Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A84584D76F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 02:11:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677955.1054914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXswS-00087d-IS; Thu, 08 Feb 2024 01:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677955.1054914; Thu, 08 Feb 2024 01:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXswS-000860-Ey; Thu, 08 Feb 2024 01:11:04 +0000
Received: by outflank-mailman (input) for mailman id 677955;
 Thu, 08 Feb 2024 01:11:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jwf=JR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rXswR-00085O-8o
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 01:11:03 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec52e95c-c61e-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 02:11:01 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d090c83d45so15685031fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 17:11:01 -0800 (PST)
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
X-Inumbo-ID: ec52e95c-c61e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707354660; x=1707959460; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8cfemsAt0BP54fzkiw1RrU2pfk5Y/Jkj4Junx0q4y8=;
        b=VihC06BTko4y0ofBqdiEhZdh+ogTyENiq7lrdP3HmiiJh+/rb99GiBaEGqRkYa4Lfn
         SmUl4dd3aKPSPYJ9uFDDyN8rQcPZuRBDLaqfZ15AWMyjALow2NU8oGHYdwSkf94ZznLW
         MmXPvVzEtVkypeD7+D8nAatCxkLrCxNXjLRaoSa3m4kiIPOyvoNnuiUBm1iaYMS60bBK
         igiTQmfiTWwqF8ioF/IJfiOAlKqRmy0M2UHy3heHLAAJ5tpIyUirAME0Pq8kd5TP+sa/
         TmW7+3ExFydL79jik+MhAxqHg61qWibZkP8r5VrGVuLWGLGWkLgyRi/z7ftb6cBe1fU8
         EuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707354660; x=1707959460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8cfemsAt0BP54fzkiw1RrU2pfk5Y/Jkj4Junx0q4y8=;
        b=Vk2Xnn2g23Bo+AzY1V14ZcwClhM3UR+vFjjaI38LXdzNbHQPl0GkqpmigzvrNCX7cN
         u01+kOBNWtmEwDG5kex8fgDrNH9uX21w2unRcAwDzvne5irQICYbdkQLWt/RLkzxixwL
         d4Ni0Mgz8eplodlOLdc1qu4aLnrhATBBNGPuj999xMXi7wPf+yPy78eXKj/wU5b+xpu4
         Jk+jnrh0N4qvY73luGPCwx/uMPODRHdKZVtn5SQ/2FGJSJTPr3I9b/8KRv2ijcrDPdsd
         qLuJgtOkPpWD6k+dsOr1vwZlXyJsGgca/zTFw0I3wDltRcLVPX7INRAaqEWvIUzK1UmQ
         VLqA==
X-Gm-Message-State: AOJu0Yzzjyc2C1VeJ/VeCFLmz4r5XtJfOh+DUV9bMTfJuiFoXNa90xhz
	HqkxF+BKaRuiEF4aNkMEopPcCMM9U2biI8wTlbOFMz3gSa0g0yZf0loFdPZ5sND41BLqpBhP0pO
	Sfh4New0VIuzswCP1wy/Pjj+tUZI=
X-Google-Smtp-Source: AGHT+IE7TVEdTt7mSFoVIZF+adJDTfGzTJv1DCAGzGh2ypb3ql475iMlq3T7wBUuQdg87yb/lpHRgV+dz8c98nmlmNk=
X-Received: by 2002:a2e:700e:0:b0:2d0:b578:39da with SMTP id
 l14-20020a2e700e000000b002d0b57839damr4908738ljc.5.1707354660146; Wed, 07 Feb
 2024 17:11:00 -0800 (PST)
MIME-Version: 1.0
References: <20240205105001.24171-1-jgross@suse.com> <20240205105001.24171-13-jgross@suse.com>
In-Reply-To: <20240205105001.24171-13-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 7 Feb 2024 20:10:48 -0500
Message-ID: <CAKf6xpvGSXycixq5TP4gQFs+CRChP4z0+Y6Wf-LS0p4Yinmujw@mail.gmail.com>
Subject: Re: [PATCH v4 12/32] tools/xen-9pfsd: add 9pfs stat request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 5:57=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the stat request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

