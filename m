Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 977091C1D5D
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 20:45:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUade-00044G-FW; Fri, 01 May 2020 18:43:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0mR=6P=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1jUadd-000446-DO
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 18:43:53 +0000
X-Inumbo-ID: b240cc06-8bdb-11ea-b07b-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b240cc06-8bdb-11ea-b07b-bc764e2007e4;
 Fri, 01 May 2020 18:43:49 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r7so7930725edo.11
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2020 11:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o/okLHQ7l1eoRIFhJ+xNSW46JphId+vYlLM2LdsSU3E=;
 b=weN8QfHuExHYaepq+7E1Q/0SRYMh7p8ZjcGwSWK2zt19OAmRo/ZapS6C19zKkSm2B7
 MgQyzH6J0oiR443CAJkWGf8tj+BVUlZSRUQ9WuY+YJli6fdOz/CSkzTn2K8HogDu50cD
 W2P3M2G+3faMDDJu2LjMFToE0w4DO9UD1vdNV28xQfo7n2TAVLQ5qprKz/RbrdAhYzCf
 FlniNgfFyxwzkns6nwdnGfxWiaPLt7btxT5lqw3kQWDQeAZp0ulWOQ1mPozpFGBjSDvh
 vQAiEc4xPOYkrtwSgXBLsqhlMidXYrFnlpwyZdjYONP8/X5zXKxBC6LYv8ySlQEUF4d9
 8YQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o/okLHQ7l1eoRIFhJ+xNSW46JphId+vYlLM2LdsSU3E=;
 b=Cy4HOTKPd19I7+P1pvkD1x+jRrqxihIHhiU6G7mNvR3BPrnTU/s5zgrQWH/h3VhMY0
 cxeJ4XAGHotxtUgbRjliwQYgXicGml70k2UUBa/j1Kh/Ec7H5IkNnb/lmcPY/w2N6yic
 JXCXPit/kuqbspjlepreFJmtghlAhpunYhYLlFX598UqQSUUWol2opL+b1FUL1nlQ7X1
 N4LzV2QAHV0BcA3T584LcvYk/2/U94jOzugGus49Nur97t5lcinGgoOtZ4eZJJ/MDO1z
 8kArlpQUknAErGZrpKp9IxxHPq65b+O7iDE4/fIT+ufbdHJ1eCOyQQoSClECH6RLzvLx
 rtFA==
X-Gm-Message-State: AGi0PuZcxnFf40eBYoI6kMkPogWfzduVBLrnytnROmW84MKkNQFbMW+j
 qMKp55kqNEmtyR36iYoYjFfxKYYHVOOLDp5/x1/Blg==
X-Google-Smtp-Source: APiQypLqnaYv43r6Uq1aSbujXwhGYNQdyJhTIBkjZMc5QK+kjynpE0ZZSNw0BY1FtHl+WNRGQWKFueMB52jMwly/Eb8=
X-Received: by 2002:a50:ee86:: with SMTP id f6mr4936861edr.123.1588358628608; 
 Fri, 01 May 2020 11:43:48 -0700 (PDT)
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
 <CAPcyv4j=YKnr1HW4OhAmpzbuKjtfP7FdAn4-V7uA=b-Tcpfu+A@mail.gmail.com>
 <2d019c11-a478-9d70-abd5-4fd2ebf4bc1d@redhat.com>
 <CAPcyv4iOqS0Wbfa2KPfE1axQFGXoRB4mmPRP__Lmqpw6Qpr_ig@mail.gmail.com>
 <62dd4ce2-86cc-5b85-734f-ec8766528a1b@redhat.com>
 <0169e822-a6cc-1543-88ed-2a85d95ffb93@redhat.com>
 <CAPcyv4jGnR_fPtpKBC1rD2KRcT88bTkhqnTMmuwuc+f9Dwrz1g@mail.gmail.com>
 <9f3a813e-dc1d-b675-6e69-85beed3057a4@redhat.com>
In-Reply-To: <9f3a813e-dc1d-b675-6e69-85beed3057a4@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 1 May 2020 11:43:37 -0700
Message-ID: <CAPcyv4jjrxQ27rsfmz6wYPgmedevU=KG+wZ0GOm=qiE6tqa+VA@mail.gmail.com>
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

On Fri, May 1, 2020 at 11:14 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 01.05.20 20:03, Dan Williams wrote:
> > On Fri, May 1, 2020 at 10:51 AM David Hildenbrand <david@redhat.com> wrote:
> >>
> >> On 01.05.20 19:45, David Hildenbrand wrote:
> >>> On 01.05.20 19:39, Dan Williams wrote:
> >>>> On Fri, May 1, 2020 at 10:21 AM David Hildenbrand <david@redhat.com> wrote:
> >>>>>
> >>>>> On 01.05.20 18:56, Dan Williams wrote:
> >>>>>> On Fri, May 1, 2020 at 2:34 AM David Hildenbrand <david@redhat.com> wrote:
> >>>>>>>
> >>>>>>> On 01.05.20 00:24, Andrew Morton wrote:
> >>>>>>>> On Thu, 30 Apr 2020 20:43:39 +0200 David Hildenbrand <david@redhat.com> wrote:
> >>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> Why does the firmware map support hotplug entries?
> >>>>>>>>>
> >>>>>>>>> I assume:
> >>>>>>>>>
> >>>>>>>>> The firmware memmap was added primarily for x86-64 kexec (and still, is
> >>>>>>>>> mostly used on x86-64 only IIRC). There, we had ACPI hotplug. When DIMMs
> >>>>>>>>> get hotplugged on real HW, they get added to e820. Same applies to
> >>>>>>>>> memory added via HyperV balloon (unless memory is unplugged via
> >>>>>>>>> ballooning and you reboot ... the the e820 is changed as well). I assume
> >>>>>>>>> we wanted to be able to reflect that, to make kexec look like a real reboot.
> >>>>>>>>>
> >>>>>>>>> This worked for a while. Then came dax/kmem. Now comes virtio-mem.
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> But I assume only Andrew can enlighten us.
> >>>>>>>>>
> >>>>>>>>> @Andrew, any guidance here? Should we really add all memory to the
> >>>>>>>>> firmware memmap, even if this contradicts with the existing
> >>>>>>>>> documentation? (especially, if the actual firmware memmap will *not*
> >>>>>>>>> contain that memory after a reboot)
> >>>>>>>>
> >>>>>>>> For some reason that patch is misattributed - it was authored by
> >>>>>>>> Shaohui Zheng <shaohui.zheng@intel.com>, who hasn't been heard from in
> >>>>>>>> a decade.  I looked through the email discussion from that time and I'm
> >>>>>>>> not seeing anything useful.  But I wasn't able to locate Dave Hansen's
> >>>>>>>> review comments.
> >>>>>>>
> >>>>>>> Okay, thanks for checking. I think the documentation from 2008 is pretty
> >>>>>>> clear what has to be done here. I will add some of these details to the
> >>>>>>> patch description.
> >>>>>>>
> >>>>>>> Also, now that I know that esp. kexec-tools already don't consider
> >>>>>>> dax/kmem memory properly (memory will not get dumped via kdump) and
> >>>>>>> won't really suffer from a name change in /proc/iomem, I will go back to
> >>>>>>> the MHP_DRIVER_MANAGED approach and
> >>>>>>> 1. Don't create firmware memmap entries
> >>>>>>> 2. Name the resource "System RAM (driver managed)"
> >>>>>>> 3. Flag the resource via something like IORESOURCE_MEM_DRIVER_MANAGED.
> >>>>>>>
> >>>>>>> This way, kernel users and user space can figure out that this memory
> >>>>>>> has different semantics and handle it accordingly - I think that was
> >>>>>>> what Eric was asking for.
> >>>>>>>
> >>>>>>> Of course, open for suggestions.
> >>>>>>
> >>>>>> I'm still more of a fan of this being communicated by "System RAM"
> >>>>>
> >>>>> I was mentioning somewhere in this thread that "System RAM" inside a
> >>>>> hierarchy (like dax/kmem) will already be basically ignored by
> >>>>> kexec-tools. So, placing it inside a hierarchy already makes it look
> >>>>> special already.
> >>>>>
> >>>>> But after all, as we have to change kexec-tools either way, we can
> >>>>> directly go ahead and flag it properly as special (in case there will
> >>>>> ever be other cases where we could no longer distinguish it).
> >>>>>
> >>>>>> being parented especially because that tells you something about how
> >>>>>> the memory is driver-managed and which mechanism might be in play.
> >>>>>
> >>>>> The could be communicated to some degree via the resource hierarchy.
> >>>>>
> >>>>> E.g.,
> >>>>>
> >>>>>             [root@localhost ~]# cat /proc/iomem
> >>>>>             ...
> >>>>>             140000000-33fffffff : Persistent Memory
> >>>>>               140000000-1481fffff : namespace0.0
> >>>>>               150000000-33fffffff : dax0.0
> >>>>>                 150000000-33fffffff : System RAM (driver managed)
> >>>>>
> >>>>> vs.
> >>>>>
> >>>>>            :/# cat /proc/iomem
> >>>>>             [...]
> >>>>>             140000000-333ffffff : virtio-mem (virtio0)
> >>>>>               140000000-147ffffff : System RAM (driver managed)
> >>>>>               148000000-14fffffff : System RAM (driver managed)
> >>>>>               150000000-157ffffff : System RAM (driver managed)
> >>>>>
> >>>>> Good enough for my taste.
> >>>>>
> >>>>>> What about adding an optional /sys/firmware/memmap/X/parent attribute.
> >>>>>
> >>>>> I really don't want any firmware memmap entries for something that is
> >>>>> not part of the firmware provided memmap. In addition,
> >>>>> /sys/firmware/memmap/ is still a fairly x86_64 specific thing. Only mips
> >>>>> and two arm configs enable it at all.
> >>>>>
> >>>>> So, IMHO, /sys/firmware/memmap/ is definitely not the way to go.
> >>>>
> >>>> I think that's a policy decision and policy decisions do not belong in
> >>>> the kernel. Give the tooling the opportunity to decide whether System
> >>>> RAM stays that way over a kexec. The parenthetical reference otherwise
> >>>> looks out of place to me in the /proc/iomem output. What makes it
> >>>> "driver managed" is how the kernel handles it, not how the kernel
> >>>> names it.
> >>>
> >>> At least, virtio-mem is different. It really *has to be handled* by the
> >>> driver. This is not a policy. It's how it works.
> >
> > ...but that's not necessarily how dax/kmem works.
> >
>
> Yes, and user space could still take that memory and add it to the
> firmware memmap if it really wants to. It knows that it is special. It
> can figure out that it belongs to a dax device using /proc/iomem.
>
> >>>
> >>
> >> Oh, and I don't see why "System RAM (driver managed)" would hinder any
> >> policy in user case to still do what it thinks is the right thing to do
> >> (e.g., for dax).
> >>
> >> "System RAM (driver managed)" would mean: Memory is not part of the raw
> >> firmware memmap. It was detected and added by a driver. Handle with
> >> care, this is special.
> >
> > Oh, no, I was more reacting to your, "don't update
> > /sys/firmware/memmap for the (driver managed) range" choice as being a
> > policy decision. It otherwise feels to me "System RAM (driver
> > managed)" adds confusion for casual users of /proc/iomem and for clued
> > in tools they have the parent association to decide policy.
>
> Not sure if I understand correctly, so bear with me :).
>
> Adding or not adding stuff to /sys/firmware/memmap is not a policy
> decision. If it's not part of the raw firmware-provided memmap, it has
> nothing to do in /sys/firmware/memmap. That's what the documentation
> from 2008 tells us.

It just occurs to me that there are valid cases for both wanting to
start over with driver managed memory with a kexec and keeping it in
the map. Consider the case of EFI Special Purpose (SP) Memory that is
marked EFI Conventional Memory with the SP attribute. In that case the
firmware memory map marked it as conventional RAM, but the kernel
optionally marks it as System RAM vs Soft Reserved. The 2008 patch
simply does not consider that case. I'm not sure strict textualism
works for coding decisions.

