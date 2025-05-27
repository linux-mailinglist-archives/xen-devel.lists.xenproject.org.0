Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EBAAC52E1
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 18:18:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998650.1379372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJx0F-00050V-BG; Tue, 27 May 2025 16:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998650.1379372; Tue, 27 May 2025 16:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJx0F-0004xO-8Z; Tue, 27 May 2025 16:18:11 +0000
Received: by outflank-mailman (input) for mailman id 998650;
 Tue, 27 May 2025 16:18:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdBa=YL=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uJx0E-0004xI-8q
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 16:18:10 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d50b52b-3b16-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 18:18:08 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55320ddb9edso2570762e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 09:18:08 -0700 (PDT)
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
X-Inumbo-ID: 2d50b52b-3b16-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748362688; x=1748967488; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puVX/UZDeRCc5Pjbb5mwx3GCh2Zttj75h/9u+6oI/hU=;
        b=EDHZ5jqxD/VKO2lpj+M/jTE5v2Jl5nZxIjW/FCqde1aCPk03m1t6ifUJteZY7TTUys
         nrhQtvnCa42RSv3HaviJym6hlBsd+ZiD6Wo39yRsYOra4kgjivG+lR10SUc646st+cWe
         9tWPikeMwWtmeXzKTCzXXGOTqq3+/DyOkoF4d+oPDNyBGFiLfWoQz4QX6DEnxvzW6iYr
         NgNnB1RGkRllMQW7vrk2kKaWyi8rqxCqOiNzozbAYWdY5eXWiX3eVLpujQgb3D/wjkQu
         4WV60V7DPOD0Oac3DOwqfSLaPRs3HI9fX6rVp3McZzFnM9FRz7dH+aXya3oFHGjpmgRR
         PjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748362688; x=1748967488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puVX/UZDeRCc5Pjbb5mwx3GCh2Zttj75h/9u+6oI/hU=;
        b=Dd+9GoZbMSrzdxAEKqFL+sGldN+35Ic11Bjce9LjeKNHYQWQM4ckn3s5HgmPaPF3P9
         QAsGGEv7UTyINRTuqkbxSioaEI6yanLj0ebthBSUDkGKYvxhcH+s22/OH/u/hxPOdZ0+
         qHBPAuZXVfMVGo8mHkI3nZfYh/5jqfuuD99Y21Nyq2x0Geduegt0C/3Uff4/+lQ34/4E
         as/1DHSLYaEMSPM8fmXwD+k0L77nZmC+l0Cvo2f1y3IDyq9Zds/nrgEDdckGSer9AI0I
         bQDRsN70mca19t1AWW5S4ZMrxRtLqEUDTt0M7/OQmPyiTOTVPoGpMrcf867w3nckgmgy
         luAw==
X-Gm-Message-State: AOJu0YzyY8UFrmzi8ID1I+fUTQdiLaXUuVpquchhb/mPFvmfsPDYoQm3
	P61FReSiEP/UKiQ02taDQxrQJ2/uWWCmeESFLdCbwhNJzDON+fmI9l91IUPc6jD46B0Iz6fCcrk
	VewcA8WUNWJHVMFT7ne1gle6V8dRJKGw=
X-Gm-Gg: ASbGncs7gKE+suYEeIH4ZeDRXi82fqVMVMW+uDlg53PXsWhIbsE2Ip30XEFQ/KVtIMv
	WcMjgDyhwtNyVmP6f7RWA+zpKsH7bTHZ74nWz4w7qAZVtD/H6LiBubzhxqBcC6sAf05pB9o/Jyt
	OiMrgnG7VN2vNwxXJa7/LC8xbRIAWsGY8=
X-Google-Smtp-Source: AGHT+IHZEfAl9F0825CuXG58CnxCxRt27OhPxdFcI4uGsnqSxV0nfAskgg3qli2TWo211mf50Z0hMPkCD8ECzU+0OA0=
X-Received: by 2002:a05:6512:3d20:b0:553:2868:6357 with SMTP id
 2adb3069b0e04-55328686477mr1056901e87.50.1748362687569; Tue, 27 May 2025
 09:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <974033e9ff0df3ce8a74efaa33f1cee1dcbdb030.1748340071.git.mykola_kvach@epam.com>
 <b19800c6-ef39-479c-a320-f2eabf546bf6@citrix.com>
In-Reply-To: <b19800c6-ef39-479c-a320-f2eabf546bf6@citrix.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 27 May 2025 19:17:56 +0300
X-Gm-Features: AX0GCFtX3rICOjN9MTe0o7gzWF3cVtUtL4F-eomG1vNWqUokK6s0Ia7LXdcxTWo
Message-ID: <CAGeoDV_Ees1hUbuZm0rGncOQB-5rHR9DaqYoSoL3MGVtFXBjvA@mail.gmail.com>
Subject: Re: [PATCH] x86/ACPI: move scheduler enable/disable calls out of freeze/thaw_domains
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, @Andrew Cooper

On Tue, May 27, 2025 at 3:53=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 27/05/2025 11:04 am, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > The scheduler_disable and scheduler_enable calls have been removed
> > from freeze_domains and thaw_domains, respectively, and relocated
> > to their usage context in enter_state. This change addresses
> > the concern about misleading function semantics, as the scheduler
> > operations are not directly related to the domain pausing/resuming
> > implied by the freeze/thaw naming.
> >
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>
> FYI I've kicked off a run with this patch:
>
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/183871572=
9
>
> which includes the real suspend/resume testing on several pieces of
> hardware.

It appears I made a mistake by failing to mark this patch as
containing only non-functional changes.

>
> ~Andrew

Best regards,
Mykola

