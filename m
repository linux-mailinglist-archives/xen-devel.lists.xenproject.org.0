Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4FB30F5B3
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 16:02:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81336.150144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7g8V-0003iX-OH; Thu, 04 Feb 2021 15:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81336.150144; Thu, 04 Feb 2021 15:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7g8V-0003i8-L7; Thu, 04 Feb 2021 15:01:35 +0000
Received: by outflank-mailman (input) for mailman id 81336;
 Thu, 04 Feb 2021 15:01:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N2gu=HG=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1l7g8T-0003i3-Sv
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 15:01:33 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a591b159-ad8e-4d62-a29b-bc547d9eb4fe;
 Thu, 04 Feb 2021 15:01:32 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c12so3852725wrc.7
 for <xen-devel@lists.xenproject.org>; Thu, 04 Feb 2021 07:01:32 -0800 (PST)
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
X-Inumbo-ID: a591b159-ad8e-4d62-a29b-bc547d9eb4fe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AuJjeB+t2k15miUTBh9UizpGnimRvXMSVTLdkay4a60=;
        b=s3B1Tb/Nf8+6/wDMsJ7nwyGD77FhrMVuO2QA8n5elReOICNzWmfzzvm88Xd0ZrjcK3
         nHwFlqoBf1p0TWy162nQhIiwawiX1J5mhhTvrLqa6BGG8VsCNn1saBmqCteECiUs1ZBt
         5B4sHyO3NC1TZQeNscPZRIgiGEO2TVHDqYOmvEIMphuBJ92uFtqWo5UeSqwK2bQHNOX+
         Jto21JyNdRhOC9JCBMDitGnzGsbzVyXYXhSxcF5ZmJ6L1g8g/CD2FQ/COGeNzMTxvVJ7
         zXmqfKMiZETPjhqmmLyQ2kHSnSBDKD1GSaBjaH5SXL2hx2CJuMzAdpunj8z1xTfpOX0W
         yB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AuJjeB+t2k15miUTBh9UizpGnimRvXMSVTLdkay4a60=;
        b=ZyHaRcywwO6mpLpfHXgFrDpgmarNdkycfw9CVhe0WhYU+XtELdLtNY10PBTswCNixL
         FtKIZ6xpqe2fhkDZ8lHFXe+coN3J+gZqOGefSgmao1nyB2R7hbG9YCU9AXZk+bYgM5Mu
         zrzHzT9M2WIa+jDxUxAHq/CN5U0GOAj9FHTKZ/0VuXA0+M+zI3f3bVgWLzvbeWrv9nGw
         LwWH1ODQcSQ1q8Lh1J1KJfcHbuxbdv19N60fYkU87s6JEE5YytBZkyr6479G2WOu+oTs
         bNB/FwrVbUQmNfGpnQTkhm1pIsU9fGwogwMegK+FWDkPRPZdOE5LQoB/8P3wfXpciVnV
         91uA==
X-Gm-Message-State: AOAM531ekjxpkJqZUWmAxaH2lTUHqTDTOj8dOKCINw4O2Redqg0SBtET
	ERsuYxyW2DCnN7+Ccqeq9v7ZR6UbKCojKciEUcE=
X-Google-Smtp-Source: ABdhPJz6Ho7t3Ui566OsDdM7Zf5qUEUw7IuJCL7P1sR+2xMIb09PgQovsZplHp82Qzoy76bjrOmFs0ZEiEXdwoENh7g=
X-Received: by 2002:adf:f687:: with SMTP id v7mr9766870wrp.182.1612450891650;
 Thu, 04 Feb 2021 07:01:31 -0800 (PST)
MIME-Version: 1.0
References: <24600.8030.769396.165224@mariner.uk.xensource.com>
 <24603.58528.901884.980466@mariner.uk.xensource.com> <6d0d7181bad79259aff28351621d2ac1eeaca113.camel@suse.com>
In-Reply-To: <6d0d7181bad79259aff28351621d2ac1eeaca113.camel@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 4 Feb 2021 10:00:55 -0500
Message-ID: <CABfawhkT5JBsT2-reSLB-bNFhP1em5U3vBs+z_FM6_Kcd7TSiQ@mail.gmail.com>
Subject: Re: [ANNOUNCE] Xen 4.15 - call for notification/status of significant bugs
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Committers <committers@xenproject.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, community.manager@xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021 at 9:21 AM Dario Faggioli <dfaggioli@suse.com> wrote:
>
> On Thu, 2021-02-04 at 12:12 +0000, Ian Jackson wrote:
> > B. "scheduler broken" bugs.
> >
> > Information from
> >   Andrew Cooper <andrew.cooper3@citrix.com>
> >   Dario Faggioli <dfaggioli@suse.com>
> >
> > Quoting Andrew Cooper
> > > We've had 4 or 5 reports of Xen not working, and very little
> > > investigation on whats going on.  Suspicion is that there might be
> > > two bugs, one with smt=0 on recent AMD hardware, and one more
> > > general "some workloads cause negative credit" and might or might
> > > not be specific to credit2 (debugging feedback differs - also might
> > > be 3 underlying issue).
> >
> > I reviewed a thread about this and it is not clear to me where we are
> > with this.
> >
> Ok, let me try to summarize the current status.
>
> - BUG: credit=sched2 machine hang when using DRAKVUF
>
>   https://lists.xen.org/archives/html/xen-devel/2020-05/msg01985.html
>   https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01561.html
>   https://bugzilla.opensuse.org/show_bug.cgi?id=1179246
>
>   99% sure that it's a Credit2 scheduler issue.
>   I'm actively working on it.
>   "Seems a tricky one; I'm still in the analysis phase"
>
>   Manifests only with certain combination of hardware and workload.
>   I'm not reproducing, but there are multiple reports of it (see
>   above). I'm investigating and trying to come up at least with
>   debug patches that one of the reporter should be able and willing to
>   test.
>
> - Null scheduler and vwfi native problem
>
>   https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg01634.html
>
>   RCU issues, but manifests due to scheduler behavior (especially
>   NULL scheduler, especially on ARM).
>   I'm actively working on it.
>
>   Patches that should solve the issue for ARM posted already. They
>   will need to be slightly adjusted to cover x86 as well. Waiting a
>   couple days more for a confirmation from the reporter that the
>   patches do help, at least on ARM.
>

I've run into null-scheduler causing CPU lockups as well on x86.
Required physical machine reboot. Seems to be triggered with domain
destruction when destroying fork vms. Happens only intermittently.

Tamas

