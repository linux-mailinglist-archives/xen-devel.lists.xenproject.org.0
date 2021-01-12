Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED172F3BB7
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:05:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66031.117098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzQrQ-0006Ln-6R; Tue, 12 Jan 2021 21:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66031.117098; Tue, 12 Jan 2021 21:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzQrQ-0006LO-3C; Tue, 12 Jan 2021 21:05:52 +0000
Received: by outflank-mailman (input) for mailman id 66031;
 Tue, 12 Jan 2021 21:05:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7GzT=GP=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kzQrO-0006LG-HP
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:05:50 +0000
Received: from MTA-12-4.privateemail.com (unknown [198.54.127.107])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64a65646-9497-41ea-aae1-8e54c26bb585;
 Tue, 12 Jan 2021 21:05:49 +0000 (UTC)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
 by mta-12.privateemail.com (Postfix) with ESMTP id A296F8009F
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 16:05:48 -0500 (EST)
Received: from mail-wm1-f44.google.com (unknown [10.20.151.230])
 by mta-12.privateemail.com (Postfix) with ESMTPA id 6960A80097
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 21:05:48 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id y23so3418489wmi.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:05:48 -0800 (PST)
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
X-Inumbo-ID: 64a65646-9497-41ea-aae1-8e54c26bb585
X-Gm-Message-State: AOAM533bBdSnd+cjBm5XCF9Rp1fSYawBhROggv5SpCD1nAKiNXEZGfSF
	goduGvYIe5aqjMuqEh6ErRsPdOrPI7ZG6gTZ804=
X-Google-Smtp-Source: ABdhPJwxFfyR9gxgv8RCCg/4P9xK4jiP6zIcQfSloFcTPyGg1T2Z2T1YffOLUB9BYkxf0+O0Sc6fddsAJ3cEjGhNMLQ=
X-Received: by 2002:a1c:4843:: with SMTP id v64mr1015662wma.186.1610485546976;
 Tue, 12 Jan 2021 13:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
 <20210112194841.1537-3-andrew.cooper3@citrix.com> <CAJ=z9a30MFcV4=5YU9O2oHmNeMU3vdPwSJ6vYCpDi5Zoi6aNtQ@mail.gmail.com>
 <ac46431b-3d68-e758-f598-0d39c6c39aeb@cam.ac.uk>
In-Reply-To: <ac46431b-3d68-e758-f598-0d39c6c39aeb@cam.ac.uk>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 12 Jan 2021 16:05:10 -0500
X-Gmail-Original-Message-ID: <CABfawh=OEgqoj6m=4R-VEXGJPD--+ouQmE+mt2WhRhw88QnA1Q@mail.gmail.com>
Message-ID: <CABfawh=OEgqoj6m=4R-VEXGJPD--+ouQmE+mt2WhRhw88QnA1Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] xen/memory: Fix acquire_resource size semantics
To: Andrew Cooper <amc96@cam.ac.uk>
Cc: Julien Grall <julien.grall.oss@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, 
	Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Paul Durrant <paul@xen.org>, =?UTF-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>, 
	Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Jan 12, 2021 at 3:57 PM Andrew Cooper <amc96@cam.ac.uk> wrote:
>
> On 12/01/2021 20:15, Julien Grall wrote:
> > Hi Andrew,
> >
> > On Tue, 12 Jan 2021 at 19:49, Andrew Cooper <andrew.cooper3@citrix.com>=
 wrote:
> >> Calling XENMEM_acquire_resource with a NULL frame_list is a request fo=
r the
> >> size of the resource, but the returned 32 is bogus.
> >>
> >> If someone tries to follow it for XENMEM_resource_ioreq_server, the ac=
quire
> >> call will fail as IOREQ servers currently top out at 2 frames, and it =
is only
> >> half the size of the default grant table limit for guests.
> > I haven't yet looked at the code, just wanted to seek some clarificatio=
n here.
> > Are we expecting someone else outside the tools (e.g. QEMU) to rely on
> > the new behavior? If so, what would happen if such code ran on older
> > Xen?
> >
> > IOW, will that code require some compatibility layer to function?
>
> This is total mess.
>
> Requesting the size of a resource was never implemented for userspace.
> The two current users of this interface (domain builder for gnttab
> seeding, qemu for ioreq server) make blind mapping calls with a priori
> knowledge of the offsets and sizes.
>
> The next patch in this series adds the xenforeignmemory_resource_size()
> API for userspace, so we can reliably say that anything built against
> anything earlier than Xen 4.15 isn't making size requests.
>
> The added complication is that if you have Xen 4.15, and Linux 4.18 or
> later without the kernel fix provided by Roger (which is CC stable),
> you'll get a bogus 32 back from the size requests.
>
> But that is fine because nothing is making size requests yet.
>
> The first concrete user of size requests will be Micha=C5=82's Processor
> Trace series, where there is a daemon to map the PT buffer and shuffle
> the contents into a file.  That will also depend on new content in 4.15.
>
> At some point in the future, Qemu is going to have to change it's
> approach, when we want to support more than 128 vcpus.  This is the
> point at which the synchronous ioreq page needs to turn into two pages.
> In practice, qemu could make a size call, or could make the same
> calculation as Xen makes, as Qemu does know d->max_vcpus via other means.
>
>
> Honestly, I'm expecting that Linux stable will do the rounds faster than
> Xen 4.15 gets rolled out to distros.  The chances of having a bleeding
> edge Xen, and not an up-to-date (or at least patched) dom0 kernel is
> minimal.

For our usecase it's not great that we would need a newer kernel then
what standard distros ship, but as a workaround compiling the newer
version of xen-privcmd as an out-of-tree lkm with the fix applied is
something we can live with while the distros catch up. Here:
https://github.com/tklengyel/xen-privcmd-lkm

Tamas

