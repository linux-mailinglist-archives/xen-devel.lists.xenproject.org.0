Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 451D2479FAF
	for <lists+xen-devel@lfdr.de>; Sun, 19 Dec 2021 06:48:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249184.429696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myp1k-0006g8-RJ; Sun, 19 Dec 2021 05:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249184.429696; Sun, 19 Dec 2021 05:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myp1k-0006eO-JT; Sun, 19 Dec 2021 05:46:32 +0000
Received: by outflank-mailman (input) for mailman id 249184;
 Sat, 18 Dec 2021 18:36:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRCJ=RD=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1myeZ1-0000cX-TY
 for xen-devel@lists.xen.org; Sat, 18 Dec 2021 18:36:11 +0000
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d68cd8e-6031-11ec-9e60-abaf8a552007;
 Sat, 18 Dec 2021 19:36:10 +0100 (CET)
Received: by mail-io1-f47.google.com with SMTP id e128so7755911iof.1
 for <xen-devel@lists.xen.org>; Sat, 18 Dec 2021 10:36:08 -0800 (PST)
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
X-Inumbo-ID: 5d68cd8e-6031-11ec-9e60-abaf8a552007
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=6ceRzcVhEh6kFYWkjslDz9MBwsAZbmz99HyxNoE48zA=;
        b=hABV3h5Wdg5Ar8LXPB+heXGfWGRjgDYDotW1oPAz5v/0bNz6rS8nGCay9rB+/jBF5q
         KrAj1E1lOJsADWJ/IOZ5hIx6h1jOuiDNahX8tk4W0sQOkDGOF37EYsn4cCAdVmeVcDAC
         yopB7eJ2gdhDf3xQV1t1x5l/k0GaP7NIwPwkJtQO1qnrNSlPAGf9c1SXXtHfqcbCT5Zk
         kDuZ6YNXJsDh/J0c0YpIT4sJXJW3s7WQ7WUVrEV72qXm6UZxgkAPfhbcVaphWDgpAEjv
         eTrlOYAKnvOn5NL7Rt+YX0b2ejerB9aYMNyHbO78e2suK55fGlBMTuRafkUGGE5xHije
         v+sQ==
X-Gm-Message-State: AOAM530F5qB4BnAlQqh0Nosux6BQfTadSqbFQ+ZJKgf/0UEGVMMAil8l
	U04E4RrAuEsZ6y7mZPKbUzd0vd+FwWGpqLuFY2F9GH/kDpdWcQ==
X-Google-Smtp-Source: ABdhPJyczt3ZsZgeCwXSLpjsLfFKg1AY0D4omnYVn4Bmz1Uzf1CpJvnXRPOJAScfudDMhDME4u4djOMQOIOLlpsyIGw=
X-Received: by 2002:a6b:b886:: with SMTP id i128mr4638128iof.151.1639852567066;
 Sat, 18 Dec 2021 10:36:07 -0800 (PST)
MIME-Version: 1.0
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Sun, 19 Dec 2021 02:35:56 +0800
Message-ID: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
Subject: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
To: xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

I ran into the following error report in the DOM0 kernel after a recent upgrade:
[  501.840816] vif vif-1-0 vif1.0: Cross page boundary, txp->offset:
2872, size: 1460
[  501.840828] vif vif-1-0 vif1.0: fatal error; disabling device
[  501.841076] xenbr0: port 2(vif1.0) entered disabled state
Once this error happens, the DOM-U behind this vif is no-longer
accessible. And recreating the same DOM-U does not fix the problem.
Only a reboot on the physical host machine helps.

The problem showed up after a recent upgrade on the DOM-U OS from
FreeNAS 11.3 to TrueNAS 12.0U7 and breaks the iSCSI service while
leaving other services like NFS intact.
The underlying OS for the NAS is FreeBSD, version 11.3 and 12.2 respectively.
So far I have tried the following combos:
- Linux 4.19 DOM0 + XEN 4.8 + FreeBSD 11.3 DOM-U: Good
- Linux 4.19 DOM0 + XEN 4.8 + FreeBSD 12.2 DOM-U: Regressed
- Linux 5.10 DOM0 + XEN 4.8 + FreeBSD 12.2 DOM-U: Regressed
- Linux 5.10 DOM0 + XEN 4.11 + FreeBSD 12.2 DOM-U: Regressed

I plan to try out the XEN 4.14 version which is the latest I can get
from the distro (Debian).
If that still does not fix the problem, I would build the 4.16 version
from source as my last resort.

I have to admit that this trial process is blind as I have no idea
which component in the combo is to be blamed. Is it a bug in the
backend-driver, frontend-driver or the hypervisor itself? Or due to
incompatible versions? Any suggestion on other diagnose ideas (e.g.
debug logs) will be welcome, while I work on the planned experiments.

Thanks,
G.R.

