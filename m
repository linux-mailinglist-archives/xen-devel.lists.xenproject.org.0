Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CCD3574E8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 21:25:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106905.204386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUDmN-0003cu-7i; Wed, 07 Apr 2021 19:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106905.204386; Wed, 07 Apr 2021 19:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUDmN-0003c4-4O; Wed, 07 Apr 2021 19:23:55 +0000
Received: by outflank-mailman (input) for mailman id 106905;
 Wed, 07 Apr 2021 19:23:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qzdh=JE=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1lUDmK-0003bz-V9
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 19:23:53 +0000
Received: from mail-ot1-x32d.google.com (unknown [2607:f8b0:4864:20::32d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85e5cd0c-e185-4c84-8cce-a56787d58571;
 Wed, 07 Apr 2021 19:23:51 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso19119298ott.13
 for <xen-devel@lists.xenproject.org>; Wed, 07 Apr 2021 12:23:51 -0700 (PDT)
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
X-Inumbo-ID: 85e5cd0c-e185-4c84-8cce-a56787d58571
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZG8dNjLgKHWguic5fRmPLrhHTwWgDNYwLC7kfPBPkDI=;
        b=uRA8vlrBqhimzm4AvdK5rzuVd78FrvAHsLGGcPwvLe+6BbDxYbI76k2CF2ql/eYA5i
         EF+0YzHDNERym6dJOYhPUYSmjhEqi8E/kE9HOsgy0kJY8SXK6qrLHpkHkdAjp655MvRP
         057fpvyJMvjGNu8Hvf8Wq7WYdbTltHeuyga0rDawAYZAOx5C+QYwUM6VraJpuXduykxQ
         kcI9M9QLsRImqHWAUfVYpdNcRFDy4gIcouygL2v4hhnVz5yuTGy906rrj4cQWLXmOX2/
         t5QgTC+SikxW737T25r2AoY+lngmpOkYLfbVWwYOu1Wirw07v3zAOEYUHKwaBKdKj7w+
         46Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZG8dNjLgKHWguic5fRmPLrhHTwWgDNYwLC7kfPBPkDI=;
        b=qRLTcf3x29gP9rlWiPZleySi8LuuN5Iq8QAbYcLFGTu8AFaY5ZYDrtfFGW2CGQW0fi
         OmivV7fCDw4+O7S+fFxM4uUlFVvdNDomKev9qjFZgoRmwEccSFIvFJO4UofgbTKTDoYT
         DILMszaFWxW5PIoZT0CBY+5BRoMJ8jmd3s3FEljir9VTZzKVVsK4TAxdhacVRZ4nkchW
         eGLVRXvOB07EtSNKUGaNI6aD9PRhSyhK1HbIZ8iJbuDTfPKPsxLmzdkNnM+Bq5G782Zh
         Jc9e8tIsf3KEmGSEp6o80XQKg9EEejUrFsXnzLeFprjSajnUQQhXv3tsr4ejutrPRwkg
         eeEA==
X-Gm-Message-State: AOAM531GkbehiO3M1y87XJG4uH5xspvQZ99oDEqrNe8UBykX00Ep10DB
	P8nPCRw2SdwWw1+Zs5igtnKx2z25e4zky9CYo0g=
X-Google-Smtp-Source: ABdhPJxV2iav5USRnUA98DQvn2RrK66SdOQbFIYLj7pIbSxhsQ7fFODDZ/W5E1uVSloe9tFsxjjUSNwcB9972B1j+4s=
X-Received: by 2002:a9d:70ce:: with SMTP id w14mr4192391otj.183.1617823431203;
 Wed, 07 Apr 2021 12:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210316031814.10311-1-dpsmith@apertussolutions.com>
 <6314f50f-b4fc-e472-4c9a-3591e168d2c3@apertussolutions.com> <bd61f993-f719-ec87-638f-f53d6e983c3e@suse.com>
In-Reply-To: <bd61f993-f719-ec87-638f-f53d6e983c3e@suse.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 7 Apr 2021 12:23:39 -0700
Message-ID: <CACMJ4GY1QpTYUYV5oG5zOfah_PzPq_-__K3-F3qUfzX95R3w8g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Introducing hyperlaunch capability design (formerly:
 DomB mode of dom0less)
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, Julien Grall <jgrall@amazon.com>, 
	Julien Grall <Julien.grall.oss@gmail.com>, iwj@xenproject.org, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	luca.fancellu@arm.com, paul@xen.org, Adam Schwalm <adam.schwalm@starlab.io>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 30, 2021 at 7:31 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 16.03.2021 04:56, Daniel P. Smith wrote:
> > To assist in reading, please find attached rendered copies of the design
> > docs. It should be noted that due to poor rendering by pandoc, we forced
> > the tables to stay as ASCII tables in the patches whereas the attached
> > docs have the tables rendered properly by rst2pdf.
>
> In section 3.6 I found "As a result, on x86 the hyperlaunch capability does
> not rely on nor preclude any specific BIOS boot protocol, i.e legacy BIOS
> boot or UEFI boot. The only requirement is that the boot loader supports
> the Multiboot2 (MB2) protocol." I'm afraid the two sentences contradict
> one another, as UEFI on its own doesn't provide MB2 functionality. It is
> my understanding that you don't require this anyway - what you need is a
> way to load modules beyond just Dom0 kernel and an initrd.

Thanks - we'll amend the doc. Given the already sizeable scope of the
project, our current approach for host UEFI is to recommend use of
GRUB.efi to load Xen and the initial domains via the multiboot2 method.

> I'm also struggling to see how you mean to associate the (MB2) modules
> passed to Xen with the individual functions. I.e. I don't see how it will
> be ensure that the embedded mb-index is in sync with the order or modules
> actually supplied.

To make sure I'm following the concern raised here, my understanding is:

- the multiboot module list is ordered and stable, so that the order
  that the bootloader provides the modules in is the same order in which
  Xen receives them, in the multiboot data structure, so the modules can
  be referenced by an index into that list

- for a given Launch Control Module file (expressed in a Device Tree, as
  described in our second design document), the provided multiboot
  modules will need to match, both in type (kernel, ramdisk, microcode,
  xsm policy) and order

- we think that at some point the LCM will end up being dynamically
  generated by an enlightened bootloader, assembling it from the
  bootloader config file, which will list the modules and their types

> As to modules - iirc there are placement restrictions by at least some
> boot loaders (below 4Gb). If that's correct, do you have any thoughts
> towards dealing with the limited space available to hold these modules?
> I've seem systems with lots of memory, but with as little as just 1Gb
> below the 4Gb boundary.

At this point, I don't think that we'll break anything that currently
works, and that hardware or platform limitations can always constrain
what is deployable.

Christopher

