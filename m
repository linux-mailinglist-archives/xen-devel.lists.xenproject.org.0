Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 966BB1C1AF7
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 18:58:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUYyP-00032b-K3; Fri, 01 May 2020 16:57:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0mR=6P=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1jUYyO-00032W-Ly
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 16:57:12 +0000
X-Inumbo-ID: cacd0f64-8bcc-11ea-b07b-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cacd0f64-8bcc-11ea-b07b-bc764e2007e4;
 Fri, 01 May 2020 16:57:08 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p16so7689550edm.10
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2020 09:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b9REn6X5SevH+LhOI4dPec9Nj6TaOfQYrUIVwbI6BoM=;
 b=mG1IcDPBM3HrlLCRXRv7RTTYgDzrduMX/5i/AlHCRx1Od+IpfQAyd0PeN//EsT0f5h
 4ISFK8ebgantTgILgro22Ez5VhTT+nYI/BrtdR2EEj+8gVO8TXYZXeoKV+n5R7g8buaW
 2yUZz1nPzY+7zON3G0XQLly2Qxcbo0G4O5Y6WDLkdJ7/fnZJpvu7siFKyoRkKMeO0fUZ
 /D0cspPD70+dXDGbdUVG4+VwKt7dWiqpPW5XzMx4fPRxJpNAeD6LnRMMzp+TiNYAZ53P
 qpaqeGLDtip2gO0UP/p8HNcC5mdTxBx8phoHoUjMgHPlB7ivmPuMEBOrgC5YppxB1E9h
 UOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b9REn6X5SevH+LhOI4dPec9Nj6TaOfQYrUIVwbI6BoM=;
 b=Moxh9WXoZQnTSDaUwy4STZsKFsnMTiSOHV+QgcQ32Hk2fzuYj5tQoIwpNUSg9NNkUp
 d6b2NQ3aRuMvoqsZrF4FmjobiMYuSnxJdL1ENOtYCgZKgShv8fwHBbxgzyFMmDSYmkh+
 Z4YpDTbqdEWhMhw++lQOhB4TXrBfJvzZHSNpZR4U9yIjmyh9gcqCC+3MhmPlcOk5IRN+
 O2IkyddVggq+gTTOgfFaG2hwk17MlUs4AGRKF2jvFdRJp6NURmcVOi9rrIbI6tZ2kP2Y
 yBzi0A459XahTcIOQSL1xR9Klhc8ADk0Ij0rUm7knGGf3j8u1xwiqhr/4Q/YE0iWKqpP
 j2nQ==
X-Gm-Message-State: AGi0PuZa1qFwYAcaxPCXWqaNHIysS7JmeFbXZTN+006KtxAhuM7H82Xw
 +NzOz6oP/9llOyHSbcISTeyCt4WmmyD+OGimOFHY+g==
X-Google-Smtp-Source: APiQypJO8dBUZTWLLj3LS+obr3vgzbWXqFSCM7dxYsl5W+J7URhuw83eMvKFki8Cpffi0gsBU7jQUIflqfdneq89wWQ=
X-Received: by 2002:aa7:c643:: with SMTP id z3mr4236295edr.154.1588352227631; 
 Fri, 01 May 2020 09:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200430102908.10107-1-david@redhat.com>
 <20200430102908.10107-3-david@redhat.com>
 <87pnbp2dcz.fsf@x220.int.ebiederm.org>
 <1b49c3be-6e2f-57cb-96f7-f66a8f8a9380@redhat.com>
 <871ro52ary.fsf@x220.int.ebiederm.org>
 <373a6898-4020-4af1-5b3d-f827d705dd77@redhat.com>
 <875zdg26hp.fsf@x220.int.ebiederm.org>
 <b28c9e02-8cf2-33ae-646b-fe50a185738e@redhat.com>
 <20200430152403.e0d6da5eb1cad06411ac6d46@linux-foundation.org>
 <5c908ec3-9495-531e-9291-cbab24f292d6@redhat.com>
In-Reply-To: <5c908ec3-9495-531e-9291-cbab24f292d6@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 1 May 2020 09:56:56 -0700
Message-ID: <CAPcyv4j=YKnr1HW4OhAmpzbuKjtfP7FdAn4-V7uA=b-Tcpfu+A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mm/memory_hotplug: Introduce MHP_NO_FIRMWARE_MEMMAP
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: virtio-dev@lists.oasis-open.org, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Wei Yang <richard.weiyang@gmail.com>,
 linux-s390 <linux-s390@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Linux MM <linux-mm@kvack.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 1, 2020 at 2:34 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 01.05.20 00:24, Andrew Morton wrote:
> > On Thu, 30 Apr 2020 20:43:39 +0200 David Hildenbrand <david@redhat.com> wrote:
> >
> >>>
> >>> Why does the firmware map support hotplug entries?
> >>
> >> I assume:
> >>
> >> The firmware memmap was added primarily for x86-64 kexec (and still, is
> >> mostly used on x86-64 only IIRC). There, we had ACPI hotplug. When DIMMs
> >> get hotplugged on real HW, they get added to e820. Same applies to
> >> memory added via HyperV balloon (unless memory is unplugged via
> >> ballooning and you reboot ... the the e820 is changed as well). I assume
> >> we wanted to be able to reflect that, to make kexec look like a real reboot.
> >>
> >> This worked for a while. Then came dax/kmem. Now comes virtio-mem.
> >>
> >>
> >> But I assume only Andrew can enlighten us.
> >>
> >> @Andrew, any guidance here? Should we really add all memory to the
> >> firmware memmap, even if this contradicts with the existing
> >> documentation? (especially, if the actual firmware memmap will *not*
> >> contain that memory after a reboot)
> >
> > For some reason that patch is misattributed - it was authored by
> > Shaohui Zheng <shaohui.zheng@intel.com>, who hasn't been heard from in
> > a decade.  I looked through the email discussion from that time and I'm
> > not seeing anything useful.  But I wasn't able to locate Dave Hansen's
> > review comments.
>
> Okay, thanks for checking. I think the documentation from 2008 is pretty
> clear what has to be done here. I will add some of these details to the
> patch description.
>
> Also, now that I know that esp. kexec-tools already don't consider
> dax/kmem memory properly (memory will not get dumped via kdump) and
> won't really suffer from a name change in /proc/iomem, I will go back to
> the MHP_DRIVER_MANAGED approach and
> 1. Don't create firmware memmap entries
> 2. Name the resource "System RAM (driver managed)"
> 3. Flag the resource via something like IORESOURCE_MEM_DRIVER_MANAGED.
>
> This way, kernel users and user space can figure out that this memory
> has different semantics and handle it accordingly - I think that was
> what Eric was asking for.
>
> Of course, open for suggestions.

I'm still more of a fan of this being communicated by "System RAM"
being parented especially because that tells you something about how
the memory is driver-managed and which mechanism might be in play.
What about adding an optional /sys/firmware/memmap/X/parent attribute.
This lets tooling check if it cares via that interface and lets it
lookup the related infrastructure to interact with if it would do
something different for virtio-mem vs dax/kmem?

