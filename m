Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3EF66E25B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 16:36:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479566.743493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHo0r-0005cI-WC; Tue, 17 Jan 2023 15:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479566.743493; Tue, 17 Jan 2023 15:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHo0r-0005a1-T2; Tue, 17 Jan 2023 15:36:37 +0000
Received: by outflank-mailman (input) for mailman id 479566;
 Tue, 17 Jan 2023 15:36:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGQh=5O=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1pHo0q-0005Zu-Sl
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 15:36:36 +0000
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b964d988-967c-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 16:36:35 +0100 (CET)
Received: by mail-ed1-f48.google.com with SMTP id x36so10940064ede.13
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jan 2023 07:36:35 -0800 (PST)
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
X-Inumbo-ID: b964d988-967c-11ed-91b6-6bf2151ebd3b
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecga+jTngnfjKJUzMM5MjyIXSr3deNDqaVoOTtaxwxk=;
        b=u+3ERuhATqIUb1crNp+zsIxxdVJcYEdTy6crqWW+F7cdobjdONb7w/QmyhFzS+jIHu
         GyI78geSzIWw9QYjsZQS1jW89Utv/LC+SgdYGqmMuarsWfajjT5waVHP53AbKkJj37TZ
         SRjgs5fKBf2x+o8PfeVCC9L5GEh3BhvoxErsJlwevgWXO1ftM53gBMpdcEA0Ex//2t/5
         khkMbLx83lJyIylnrhNiFMlleaZWmAfhN66faGx9iwq+fqJdXvOXEm+CqO7XZpSk9QEw
         XByMzTccM0qadwu/Jb0j4jQl1dg2q/xWuXixLbxNIgy/2KFp23z0lgnWomO8jDOU+yhy
         BXQg==
X-Gm-Message-State: AFqh2kp8D11fzRdMOdFyfWrcaU5quLddsiUG7gwQEHXUhxMek/dVb9jT
	ZDhAEz3fo4GCMVpwA9SCWbu+deZsyr/Tj6CUNPI=
X-Google-Smtp-Source: AMrXdXtT3fvqJUtzb/EzIMdGLBKoB2U84v13s39TajTdzxAVfMVxwEwmsQw4RK6LFCcOvz382MMMQ4nzvw6a1Q/mk4U=
X-Received: by 2002:a05:6402:94a:b0:47f:7465:6e76 with SMTP id
 h10-20020a056402094a00b0047f74656e76mr357637edz.181.1673969794659; Tue, 17
 Jan 2023 07:36:34 -0800 (PST)
MIME-Version: 1.0
References: <20230113140610.7132-1-jgross@suse.com> <CAJZ5v0gP_NUeQimn21tJuUjpMAOW_wFrRe4jstN13So_4_T4QQ@mail.gmail.com>
 <e5cc2f96-82bc-a0dc-21fa-2f605bc867d1@suse.com> <CAJZ5v0ggSbR7+RiXuJo4aq+PYWS-eb9R2iSr0DFfVhcaJ1bfUQ@mail.gmail.com>
 <05d451d0-ab2b-53a5-d666-529b0880b259@suse.com>
In-Reply-To: <05d451d0-ab2b-53a5-d666-529b0880b259@suse.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 17 Jan 2023 16:36:23 +0100
Message-ID: <CAJZ5v0idVBgi4GEBwBeGqoaDiYJBuHffy8rXsERML6Dw2pYsWA@mail.gmail.com>
Subject: Re: [PATCH] x86/acpi: fix suspend with Xen
To: Juergen Gross <jgross@suse.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-pm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 17, 2023 at 4:32 PM Juergen Gross <jgross@suse.com> wrote:
>
> On 17.01.23 15:09, Rafael J. Wysocki wrote:
> > On Mon, Jan 16, 2023 at 7:45 AM Juergen Gross <jgross@suse.com> wrote:
> >>
> >> On 13.01.23 20:40, Rafael J. Wysocki wrote:
> >>> On Fri, Jan 13, 2023 at 3:06 PM Juergen Gross <jgross@suse.com> wrote:
> >>>>
> >>>> Commit f1e525009493 ("x86/boot: Skip realmode init code when running as
> >>>> Xen PV guest") missed one code path accessing real_mode_header, leading
> >>>> to dereferencing NULL when suspending the system under Xen:
> >>>>
> >>>>       [  348.284004] PM: suspend entry (deep)
> >>>>       [  348.289532] Filesystems sync: 0.005 seconds
> >>>>       [  348.291545] Freezing user space processes ... (elapsed 0.000 seconds) done.
> >>>>       [  348.292457] OOM killer disabled.
> >>>>       [  348.292462] Freezing remaining freezable tasks ... (elapsed 0.104 seconds) done.
> >>>>       [  348.396612] printk: Suspending console(s) (use no_console_suspend to debug)
> >>>>       [  348.749228] PM: suspend devices took 0.352 seconds
> >>>>       [  348.769713] ACPI: EC: interrupt blocked
> >>>>       [  348.816077] BUG: kernel NULL pointer dereference, address: 000000000000001c
> >>>>       [  348.816080] #PF: supervisor read access in kernel mode
> >>>>       [  348.816081] #PF: error_code(0x0000) - not-present page
> >>>>       [  348.816083] PGD 0 P4D 0
> >>>>       [  348.816086] Oops: 0000 [#1] PREEMPT SMP NOPTI
> >>>>       [  348.816089] CPU: 0 PID: 6764 Comm: systemd-sleep Not tainted 6.1.3-1.fc32.qubes.x86_64 #1
> >>>>       [  348.816092] Hardware name: Star Labs StarBook/StarBook, BIOS 8.01 07/03/2022
> >>>>       [  348.816093] RIP: e030:acpi_get_wakeup_address+0xc/0x20
> >>>>
> >>>> Fix that by adding an indirection for acpi_get_wakeup_address() which
> >>>> Xen PV dom0 can use to return a dummy non-zero wakeup address (this
> >>>> address won't ever be used, as the real suspend handling is done by the
> >>>> hypervisor).
> >>>
> >>> How exactly does this help?
> >>
> >> I believed the first sentence of the commit message would make this
> >> clear enough.
> >
> > That was clear, but the fix part wasn't really.
> >
> >> I can expand the commit message to go more into detail if you think
> >> this is really needed.
> >
> > IMO calling acpi_set_waking_vector() with a known-invalid wakeup
> > vector address in dom0 is plain confusing.
> >
> > I'm not sure what to do about it yet, but IMV something needs to be done.
>
> Another possibility would be to modify acpi_sleep_prepare(), e.g. like the
> attached patch (compile tested only).

I prefer this to the previous version.  It is much more straightforward IMV.

