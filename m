Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C243D66E003
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 15:09:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479495.743394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmeh-0000Gq-Iq; Tue, 17 Jan 2023 14:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479495.743394; Tue, 17 Jan 2023 14:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmeh-0000EJ-Dt; Tue, 17 Jan 2023 14:09:39 +0000
Received: by outflank-mailman (input) for mailman id 479495;
 Tue, 17 Jan 2023 14:09:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGQh=5O=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1pHmef-0000Cf-Vl
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 14:09:37 +0000
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fc6f7dd-9670-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 15:09:31 +0100 (CET)
Received: by mail-ej1-f54.google.com with SMTP id bk15so18120604ejb.9
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jan 2023 06:09:35 -0800 (PST)
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
X-Inumbo-ID: 8fc6f7dd-9670-11ed-b8d0-410ff93cb8f0
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxrCGjSKfBkjK5viyn3/63bLv/HFmaC1YTqocY1zE1E=;
        b=W/vgLvOb4RCSoEf3rNl+vo8bzNK3dox4hdvY0OV54GrXocUDFV44d6BEBf3axDUIoG
         psVT5Ss//MdAys5HEyZZWSSLPZJxdg+5Uu+jPZVdM4PwOOUCtGuS01ZTLG9sYfOuwb/s
         sKt7I8F0+NQ8DSGjC+m6du+yTkHYd0bVVgR11eUEVXpPaUPdOvorcfonJrkRO6J0UHLE
         Vhb2lO+kd19g79ZSkPM1C1ezJvfrbhcWJRWMwEVWf053Sj5wJs+FcovZNrd4i9fHuxQ5
         TJGwXM0qO4bEN4NOPJTJNB29Hgal4TnvZIPfIkF+A5ACRVB34w+L8EoXLVIFWwv1azc5
         iR0Q==
X-Gm-Message-State: AFqh2krSPPYlkdH1aZxn3GimcTyzM9bCMZr6jwPbG5aWsupHRoeygxD5
	HVwrkFDdevGB7C8TbCu2Wd70UI+W7woKsU5a4Sc=
X-Google-Smtp-Source: AMrXdXu3u90Y/GKUFfDt7Oeht0ZXER9iAI4urcFhf748H5avCW3qieQtQPSGgH0KHpzyPJom0xOGNHHT1Jp4RjFOURk=
X-Received: by 2002:a17:906:eb1b:b0:86e:abe4:5acf with SMTP id
 mb27-20020a170906eb1b00b0086eabe45acfmr297536ejb.615.1673964575446; Tue, 17
 Jan 2023 06:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20230113140610.7132-1-jgross@suse.com> <CAJZ5v0gP_NUeQimn21tJuUjpMAOW_wFrRe4jstN13So_4_T4QQ@mail.gmail.com>
 <e5cc2f96-82bc-a0dc-21fa-2f605bc867d1@suse.com>
In-Reply-To: <e5cc2f96-82bc-a0dc-21fa-2f605bc867d1@suse.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 17 Jan 2023 15:09:24 +0100
Message-ID: <CAJZ5v0ggSbR7+RiXuJo4aq+PYWS-eb9R2iSr0DFfVhcaJ1bfUQ@mail.gmail.com>
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

On Mon, Jan 16, 2023 at 7:45 AM Juergen Gross <jgross@suse.com> wrote:
>
> On 13.01.23 20:40, Rafael J. Wysocki wrote:
> > On Fri, Jan 13, 2023 at 3:06 PM Juergen Gross <jgross@suse.com> wrote:
> >>
> >> Commit f1e525009493 ("x86/boot: Skip realmode init code when running as
> >> Xen PV guest") missed one code path accessing real_mode_header, leading
> >> to dereferencing NULL when suspending the system under Xen:
> >>
> >>      [  348.284004] PM: suspend entry (deep)
> >>      [  348.289532] Filesystems sync: 0.005 seconds
> >>      [  348.291545] Freezing user space processes ... (elapsed 0.000 seconds) done.
> >>      [  348.292457] OOM killer disabled.
> >>      [  348.292462] Freezing remaining freezable tasks ... (elapsed 0.104 seconds) done.
> >>      [  348.396612] printk: Suspending console(s) (use no_console_suspend to debug)
> >>      [  348.749228] PM: suspend devices took 0.352 seconds
> >>      [  348.769713] ACPI: EC: interrupt blocked
> >>      [  348.816077] BUG: kernel NULL pointer dereference, address: 000000000000001c
> >>      [  348.816080] #PF: supervisor read access in kernel mode
> >>      [  348.816081] #PF: error_code(0x0000) - not-present page
> >>      [  348.816083] PGD 0 P4D 0
> >>      [  348.816086] Oops: 0000 [#1] PREEMPT SMP NOPTI
> >>      [  348.816089] CPU: 0 PID: 6764 Comm: systemd-sleep Not tainted 6.1.3-1.fc32.qubes.x86_64 #1
> >>      [  348.816092] Hardware name: Star Labs StarBook/StarBook, BIOS 8.01 07/03/2022
> >>      [  348.816093] RIP: e030:acpi_get_wakeup_address+0xc/0x20
> >>
> >> Fix that by adding an indirection for acpi_get_wakeup_address() which
> >> Xen PV dom0 can use to return a dummy non-zero wakeup address (this
> >> address won't ever be used, as the real suspend handling is done by the
> >> hypervisor).
> >
> > How exactly does this help?
>
> I believed the first sentence of the commit message would make this
> clear enough.

That was clear, but the fix part wasn't really.

> I can expand the commit message to go more into detail if you think
> this is really needed.

IMO calling acpi_set_waking_vector() with a known-invalid wakeup
vector address in dom0 is plain confusing.

I'm not sure what to do about it yet, but IMV something needs to be done.

