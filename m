Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150F3328063
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 15:11:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91544.172951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGjGw-0003c4-5d; Mon, 01 Mar 2021 14:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91544.172951; Mon, 01 Mar 2021 14:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGjGw-0003bh-2T; Mon, 01 Mar 2021 14:11:42 +0000
Received: by outflank-mailman (input) for mailman id 91544;
 Mon, 01 Mar 2021 14:11:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7NP+=H7=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1lGjGu-0003ba-Oa
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 14:11:40 +0000
Received: from mail-oi1-f176.google.com (unknown [209.85.167.176])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4fd77bb-b0bd-43a3-b9f4-538ce7612c05;
 Mon, 01 Mar 2021 14:11:39 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id d20so18111367oiw.10
 for <xen-devel@lists.xenproject.org>; Mon, 01 Mar 2021 06:11:39 -0800 (PST)
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
X-Inumbo-ID: c4fd77bb-b0bd-43a3-b9f4-538ce7612c05
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lod01F2gi753lgz6hSX8V0Vv54kwq8xzww6I7WJ5rRk=;
        b=fqMxrPj2TENBSe/A7Z2d9jZI3Rc0Df0zmHXrGP4ftWKoesNDJB3WEKBu7xKBtM1yVK
         Jh5m9grWsknVdXimJg/XTsMoy2109ZrJFhC3jNPbwUkmb2w9EophqGi1JEkkNP6WRhnm
         0sYCKHToGNa1Nv5MsVwBDi8V2yeNvWv/VVfcdw8e2Vpe9lbAXqDB93w5au14VJdPvGPM
         47mtUvfBmYuxHXRJvW1ICcw22pC4iud8JY+x0VAoOOZrtxcVaIi57hjQUvFj9PW5RQMZ
         bp7rW9bUqF2/DwdcFBXoC3P9jrA9FcY65bxv88+ElpQY5z4fyxNDCBUk544BaocXicwm
         kq1w==
X-Gm-Message-State: AOAM532snyuOU+sxC5FFiVc0NmOAYxGoR4rImg+9ovoTX7GtNK7cYxaF
	8auZAHBl2fgox0Zg1ZtLZ1NAgjP252L1pGPdW8w=
X-Google-Smtp-Source: ABdhPJznWYEz0nSJMAIKsm/EiLQc07fLscL4z3c1Nc5/ixWrTp2TGuNmjEBDbNVT+qpzuvGPQkXfa3Wu2bCv3qYBF9w=
X-Received: by 2002:aca:5dc4:: with SMTP id r187mr11284327oib.69.1614607898492;
 Mon, 01 Mar 2021 06:11:38 -0800 (PST)
MIME-Version: 1.0
References: <1709720.Zl72FGBfpD@kreacher> <eaeba4a0-7bb9-7b17-9ba6-49921f6e834c@oracle.com>
In-Reply-To: <eaeba4a0-7bb9-7b17-9ba6-49921f6e834c@oracle.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 1 Mar 2021 15:11:21 +0100
Message-ID: <CAJZ5v0jr5Mxs9NYBz1ot8O+6dKYbfAo=cJqSVAOnrFEqUNwuTA@mail.gmail.com>
Subject: Re: [PATCH v1] xen: ACPI: Get rid of ACPICA message printing
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux ACPI <linux-acpi@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
	Konrad Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 28, 2021 at 2:49 AM Boris Ostrovsky
<boris.ostrovsky@oracle.com> wrote:
>
>
> On 2/24/21 1:47 PM, Rafael J. Wysocki wrote:
> > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > The ACPI_DEBUG_PRINT() macro is used in a few places in
> > xen-acpi-cpuhotplug.c and xen-acpi-memhotplug.c for printing debug
> > messages, but that is questionable, because that macro belongs to
> > ACPICA and it should not be used elsewhere.  In addition,
> > ACPI_DEBUG_PRINT() requires special enabling to allow it to actually
> > print the message and the _COMPONENT symbol generally needed for
> > that is not defined in any of the files in question.
> >
> > For this reason, replace all of the ACPI_DEBUG_PRINT() instances in
> > the Xen code with acpi_handle_debug() (with the additional benefit
> > that the source object can be identified more easily after this
> > change) and drop the ACPI_MODULE_NAME() definitions that are only
> > used by the ACPICA message printing macros from that code.
> >
> > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  drivers/xen/xen-acpi-cpuhotplug.c |   12 +++++-------
> >  drivers/xen/xen-acpi-memhotplug.c |   16 +++++++---------
>
>
> As I was building with this patch I (re-)discovered that since 2013 it depends on BROKEN (commit 76fc253723add). Despite commit message there saying that it's a temporary patch it seems to me by now that it's more than that.
>
>
> And clearly noone tried to build these files since at least 2015 because memhotplug file doesn't compile due to commit cfafae940381207.
>
>
> While this is easily fixable the question is whether we want to keep these files. Obviously noone cares about this functionality.

Well, I would be for dropping them.

Do you want me to send a patch to do that?

