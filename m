Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DEB6C1ECA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 19:00:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512049.791651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peJnN-0007Qz-Ur; Mon, 20 Mar 2023 17:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512049.791651; Mon, 20 Mar 2023 17:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peJnN-0007Nk-RB; Mon, 20 Mar 2023 17:59:45 +0000
Received: by outflank-mailman (input) for mailman id 512049;
 Mon, 20 Mar 2023 17:59:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UDcb=7M=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1peJnM-0007Ne-B8
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 17:59:44 +0000
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd179840-c748-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 18:59:41 +0100 (CET)
Received: by mail-ed1-f43.google.com with SMTP id o12so50122717edb.9
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 10:59:41 -0700 (PDT)
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
X-Inumbo-ID: fd179840-c748-11ed-b464-930f4c7d94ae
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679335181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7sGwAEHU4rAw3qBsGFuv5yZFvS6onzoI7msIxY22vg=;
        b=NDXcFQrHCteELZJwWPHeicfk20QefuNBUqcrpUiDdTiF37j1S8QjR5rpr9bfDjyMrL
         OCbUF8cdn4K2XPslt20+iLDZY8oDST9++0DhV/WRv1jzash1hE0vF0fLcIic04dq9nXL
         qDknyDyHaNS4dzKb7P7RTgq7zJfMLdAsoMkzpR2Vq1DQ73VXiR5oPwPklQ0JUCCWpcfc
         7Y5EgjalFwAcP0Wm8Hlipu8pCq93ePI5X/AAmIYU9kjdq4cf4x4CWfjFDJlvtKYPybDr
         H/97ze3ZVkAb5IBWqBZUt5M2KrkrUG6CPwxFMhIHdyExBtGiQo/VVg5e5cfmnPr5M6W6
         rjsQ==
X-Gm-Message-State: AO0yUKXttYivAiNblWjLHy1V+Cr/u9JrJijy6P7LzyKwU+xST9X/ndRx
	pi3lFzLdq5RKSyt9ChTuXnLeAhZkXnAbL5T0w+E=
X-Google-Smtp-Source: AK7set/in7G2WHAmc6rnFdSqsx1ce37uXlEGwdE3zMTPqOaxqAVJfdLtNMLdGm8j32jUt5evhqvSJZnucvSipaxI6fw=
X-Received: by 2002:a50:8d04:0:b0:4fc:ebe2:2fc9 with SMTP id
 s4-20020a508d04000000b004fcebe22fc9mr223808eds.3.1679335181185; Mon, 20 Mar
 2023 10:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230316164257.42590-1-roger.pau@citrix.com> <17ffe417-8ea0-df98-a8b7-8c370839134f@suse.com>
In-Reply-To: <17ffe417-8ea0-df98-a8b7-8c370839134f@suse.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 20 Mar 2023 18:59:30 +0100
Message-ID: <CAJZ5v0i-RGRQbkVFu0RUyhPrsbiJ1DpAM0rKU-xM4U3Yddvufg@mail.gmail.com>
Subject: Re: [PATCH v4] acpi/processor: fix evaluating _PDC method when
 running as Xen dom0
To: Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	josef@oderland.se, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, Alex Chiang <achiang@hp.com>, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 1:42=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
>
> On 16.03.23 17:42, Roger Pau Monne wrote:
> > In ACPI systems, the OS can direct power management, as opposed to the
> > firmware.  This OS-directed Power Management is called OSPM.  Part of
> > telling the firmware that the OS going to direct power management is
> > making ACPI "_PDC" (Processor Driver Capabilities) calls.  These _PDC
> > methods must be evaluated for every processor object.  If these _PDC
> > calls are not completed for every processor it can lead to
> > inconsistency and later failures in things like the CPU frequency
> > driver.
> >
> > In a Xen system, the dom0 kernel is responsible for system-wide power
> > management.  The dom0 kernel is in charge of OSPM.  However, the
> > number of CPUs available to dom0 can be different than the number of
> > CPUs physically present on the system.
> >
> > This leads to a problem: the dom0 kernel needs to evaluate _PDC for
> > all the processors, but it can't always see them.
> >
> > In dom0 kernels, ignore the existing ACPI method for determining if a
> > processor is physically present because it might not be accurate.
> > Instead, ask the hypervisor for this information.
> >
> > Fix this by introducing a custom function to use when running as Xen
> > dom0 in order to check whether a processor object matches a CPU that's
> > online.  Such checking is done using the existing information fetched
> > by the Xen pCPU subsystem, extending it to also store the ACPI ID.
> >
> > This ensures that _PDC method gets evaluated for all physically online
> > CPUs, regardless of the number of CPUs made available to dom0.
> >
> > Fixes: 5d554a7bb064 ('ACPI: processor: add internal processor_physicall=
y_present()')
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Applied as 6.4 material under a slightly edited subject, thanks!

