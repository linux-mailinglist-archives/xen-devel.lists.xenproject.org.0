Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3645947A189
	for <lists+xen-devel@lfdr.de>; Sun, 19 Dec 2021 18:33:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249326.429762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mz02Q-0007CM-Mq; Sun, 19 Dec 2021 17:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249326.429762; Sun, 19 Dec 2021 17:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mz02Q-00079V-J2; Sun, 19 Dec 2021 17:31:58 +0000
Received: by outflank-mailman (input) for mailman id 249326;
 Sun, 19 Dec 2021 17:31:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pryn=RE=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1mz02Q-00079P-0K
 for xen-devel@lists.xen.org; Sun, 19 Dec 2021 17:31:58 +0000
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ea95be7-60f1-11ec-9e60-abaf8a552007;
 Sun, 19 Dec 2021 18:31:56 +0100 (CET)
Received: by mail-io1-f46.google.com with SMTP id b187so10439065iof.11
 for <xen-devel@lists.xen.org>; Sun, 19 Dec 2021 09:31:54 -0800 (PST)
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
X-Inumbo-ID: 8ea95be7-60f1-11ec-9e60-abaf8a552007
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=hLZyWateaNhomaPRkzIvsUXw4EF+E9NSaVSjVkcOAso=;
        b=g6darX+Ev0OJhGrmzFdjIaCvZN4J2gOpLXR3qg36rceKCnvV69V1csqj5i13bIiHDs
         WGsxiV7Mrk2w0U7vxkRCOVJMvcKCpnaaEOVKnc86BudvGgdQQFzNQ7TWwYfPk/m/Rjmh
         a9mXJxGo4gRLoIMObaNzLOwmqviPRgsHgtmvT4JCf93BsP73NuLphi+HbcTeypXlbF39
         e0klG0hfXNfCvoPQunmQwanTPDNGwMj06V6Np8LRdrAaKUogqUrzu71mlIfYcDT32T8v
         jA/yAndmHCLRWwp0P8f07jSrWD34hHHEzDj7if/rspLPEhltm0EYPUwmx8y+giwoEfii
         pRpQ==
X-Gm-Message-State: AOAM53200SkokDZpKcrk0ZtwwzoljFkSL1yqN2AdSzHrC8oxOGCM70R2
	pBU9pBpw/AN/uj/GtVAiem//jEJKC0M1Fc3Omk4SPwf5N5homg==
X-Google-Smtp-Source: ABdhPJzt7ZJE/Qo2fn59b/a3vQoDFQPOdiJucYzrGzjmzTQdZY8bSFHCONnfrdPfYVwI8PSgoeL1CPt1CyH+eI1dkYA=
X-Received: by 2002:a05:6638:410b:: with SMTP id ay11mr7787766jab.183.1639935113042;
 Sun, 19 Dec 2021 09:31:53 -0800 (PST)
MIME-Version: 1.0
References: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
In-Reply-To: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Mon, 20 Dec 2021 01:31:41 +0800
Message-ID: <CAKhsbWYLC+cEuaJefi4Zy1ZcZaOtM6_2WV+9uq8=pTdi5NYLJA@mail.gmail.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
To: xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 19, 2021 at 2:35 AM G.R. <firemeteor@users.sourceforge.net> wrote:
>
> Hi all,
>
> I ran into the following error report in the DOM0 kernel after a recent upgrade:
> [  501.840816] vif vif-1-0 vif1.0: Cross page boundary, txp->offset:
> 2872, size: 1460
> [  501.840828] vif vif-1-0 vif1.0: fatal error; disabling device
> [  501.841076] xenbr0: port 2(vif1.0) entered disabled state
> Once this error happens, the DOM-U behind this vif is no-longer
> accessible. And recreating the same DOM-U does not fix the problem.
> Only a reboot on the physical host machine helps.
>
> The problem showed up after a recent upgrade on the DOM-U OS from
> FreeNAS 11.3 to TrueNAS 12.0U7 and breaks the iSCSI service while
> leaving other services like NFS intact.
To clarify -- mounting iSCSI disk will cause the problem immediately.

> The underlying OS for the NAS is FreeBSD, version 11.3 and 12.2 respectively.
> So far I have tried the following combos:
> - Linux 4.19 DOM0 + XEN 4.8 + FreeBSD 11.3 DOM-U: Good
> - Linux 4.19 DOM0 + XEN 4.8 + FreeBSD 12.2 DOM-U: Regressed
> - Linux 5.10 DOM0 + XEN 4.8 + FreeBSD 12.2 DOM-U: Regressed
> - Linux 5.10 DOM0 + XEN 4.11 + FreeBSD 12.2 DOM-U: Regressed
- Linux 5.10 DOM0 + XEN 4.14 + FreeBSD 12.2 DOM-U: Regressed
>
> I plan to try out the XEN 4.14 version which is the latest I can get
> from the distro (Debian).
I just upgraded to Debian bullseye (11) from buster (10) and migrated
to XEN4.14 as a result.
The syndrome persists, unfortunately.
BTW, my Dom0 kernel is a custom built version. Does any kernel config
could contribute to this problem?

> If that still does not fix the problem, I would build the 4.16 version
> from source as my last resort.
>
> I have to admit that this trial process is blind as I have no idea
> which component in the combo is to be blamed. Is it a bug in the
> backend-driver, frontend-driver or the hypervisor itself? Or due to
> incompatible versions? Any suggestion on other diagnose ideas (e.g.
> debug logs) will be welcome, while I work on the planned experiments.
>
> Thanks,
> G.R.

