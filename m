Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC9628F56D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:00:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7459.19492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4jU-0008NL-6L; Thu, 15 Oct 2020 14:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7459.19492; Thu, 15 Oct 2020 14:59:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4jU-0008Mw-2y; Thu, 15 Oct 2020 14:59:56 +0000
Received: by outflank-mailman (input) for mailman id 7459;
 Thu, 15 Oct 2020 14:59:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Un/f=DW=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kT4jS-0008Mr-Sy
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:59:54 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c68e8a5-8ddd-4327-a660-80e7be0e2884;
 Thu, 15 Oct 2020 14:59:54 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h6so3985272lfj.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 07:59:54 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Un/f=DW=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kT4jS-0008Mr-Sy
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:59:54 +0000
X-Inumbo-ID: 1c68e8a5-8ddd-4327-a660-80e7be0e2884
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1c68e8a5-8ddd-4327-a660-80e7be0e2884;
	Thu, 15 Oct 2020 14:59:54 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h6so3985272lfj.3
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 07:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Be+an15LrnaPiOtwboSIUoBz1mYy3noplAiogE4hPMs=;
        b=FDot9ShXu39lveCF+OW0yRUdygZ3wBX/8lxlKrgEBuG5B7eTyrubDH7f7TJSQfo3RR
         iehEgRownftvmxjDluVRSdsOAElZGd2VrWbbNg8EMGZC09bbj7l3Y/gInN3kObFUKfoP
         ZwTu3g2/Aau1OV/ovEFWnibmFaOFvNmP4kJve/qVXAutw3AFCoUiWXG3yuPpiu5EMbu1
         sIqBGWwQZEgq0C9fkY/ARxBVHT+4gXTF37ZLLZ0M0XyPLW7AsgbaqFQ2GHiLrQLnUEDq
         CinoKqIzX4xb6Ucf/544zW7O4jDBJ/rBMZR/HZtPnrpA3VcMyA64SlCKHzFSRYKXl4vH
         3o+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Be+an15LrnaPiOtwboSIUoBz1mYy3noplAiogE4hPMs=;
        b=cxfKiF9HSZkqFDjcRTRbDGGoB6ihyEBLZAGFexF/Mv3+Qv/rWrqJC1zxcYPhNibc9U
         HDpoC7G37oTzKTW6Dt5/Y+TAPhdHM1aYq0TQP9lz7IoYMQPrg8Azu0yF3lFbvrStjb0p
         dR9NVD9KImI67tCQVnSVpBXWQaRbTif9Xgm8LWdTFL/aM2NgK/1Iw9dWITmbcDiKbWyc
         aoKZf+2+vQjghQw9QhT5/LCSTb26RDTc99K8/CzwCnlItgp6Ds9s+g+DZ7eyT/gNfWYc
         q/rxO5Ek844wzz+9c5/GQL+HQPeWP4lCkZ2xef54UE6I8oxYMA2qNIpGwTtYDuGPzZlu
         4tyw==
X-Gm-Message-State: AOAM53093qjSN/FrWUI0l7r9GfDnbMXwqHJjtoNxmv3JAeWNA/ZJAlyx
	XF4xzrCb2SSjxyK+XEN8e5iu399YLnTZ5h3QKfE=
X-Google-Smtp-Source: ABdhPJx4L4/CQ4jjGqYEQKoZVBxedUwEFtk0SDdes7DwZrBGrzlWTuA3aoI8E4T/46sDTPw9nu3QcwgAWBcqXgEv7L8=
X-Received: by 2002:ac2:52b7:: with SMTP id r23mr1135747lfm.30.1602773992720;
 Thu, 15 Oct 2020 07:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201014175342.152712-1-jandryuk@gmail.com> <20201014175342.152712-2-jandryuk@gmail.com>
 <b74a3f83-cd8a-34a3-b436-95141f01cb20@suse.com>
In-Reply-To: <b74a3f83-cd8a-34a3-b436-95141f01cb20@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 15 Oct 2020 10:59:40 -0400
Message-ID: <CAKf6xps+mAFdfk8uBw=aMsAFNYmt4ETPkB8dwT3sTv-qPbVENw@mail.gmail.com>
Subject: Re: [PATCH 1/2] xen: Remove Xen PVH/PVHVM dependency on PCI
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 15, 2020 at 4:10 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 14.10.2020 19:53, Jason Andryuk wrote:
> > @@ -76,7 +80,9 @@ config XEN_DEBUG_FS
> >         Enabling this option may incur a significant performance overhead.
> >
> >  config XEN_PVH
> > -     bool "Support for running as a Xen PVH guest"
> > +     bool "Xen PVH guest support"
>
> Tangential question: Is "guest" here still appropriate, i.e.
> isn't this option also controlling whether the kernel can be
> used in a PVH Dom0?

Would you like something more generic like "Xen PVH support" and
"Support for running in Xen PVH mode"?

> >       def_bool n
>
> And is this default still appropriate?

We probably want to flip it on, yes.  PVH is the future, isn't it?

Regards,
Jason

