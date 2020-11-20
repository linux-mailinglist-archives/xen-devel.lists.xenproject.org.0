Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0432BAAD5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 14:12:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32171.63131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg6C4-0000IR-7r; Fri, 20 Nov 2020 13:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32171.63131; Fri, 20 Nov 2020 13:11:16 +0000
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
	id 1kg6C4-0000I2-4Y; Fri, 20 Nov 2020 13:11:16 +0000
Received: by outflank-mailman (input) for mailman id 32171;
 Fri, 20 Nov 2020 13:11:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N4/k=E2=gmail.com=lambert.olivier@srs-us1.protection.inumbo.net>)
 id 1kg6C2-0000Hx-3N
 for xen-devel@lists.xen.org; Fri, 20 Nov 2020 13:11:14 +0000
Received: from mail-vk1-xa31.google.com (unknown [2607:f8b0:4864:20::a31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e746f718-d898-4057-86d9-1e63b0311efa;
 Fri, 20 Nov 2020 13:11:12 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id u16so2186730vkb.1
 for <xen-devel@lists.xen.org>; Fri, 20 Nov 2020 05:11:12 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=N4/k=E2=gmail.com=lambert.olivier@srs-us1.protection.inumbo.net>)
	id 1kg6C2-0000Hx-3N
	for xen-devel@lists.xen.org; Fri, 20 Nov 2020 13:11:14 +0000
X-Inumbo-ID: e746f718-d898-4057-86d9-1e63b0311efa
Received: from mail-vk1-xa31.google.com (unknown [2607:f8b0:4864:20::a31])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e746f718-d898-4057-86d9-1e63b0311efa;
	Fri, 20 Nov 2020 13:11:12 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id u16so2186730vkb.1
        for <xen-devel@lists.xen.org>; Fri, 20 Nov 2020 05:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Is4LlyNi/I66refyHQmdCDL6lW4ZWZ2icPR7xWsFFGM=;
        b=AChYZ+S1hdoa/8SzPN4oDXyK916yATiMb4kYWKHiG4sPYotW9Ia2wZ300UCZemcuCj
         9h273X3kmNZ4sr8llgyZyhzNuqjy1SLEN8mMt8CjP3UhrjQVN2HWxeAOzA1JOlk/Atiu
         +ltn9b7a4kCgbMDlvyGBC3pCf4yRC9aApF2IEoeOOo2Rh3ITj7NET5sS8ZT3IcxG97jv
         bzvILUnahm0kNhB14b5BRUJ7sciIrhz7B99juvumfxqI+p07ib9tkWoIL0zuMYrhO0nz
         eHIMA10tNKRP9UkOkbBlODW+MxB1cYBDumeb1Iws8FtHD/ib21oB5YbSRgjTpHxuu0go
         2Olw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Is4LlyNi/I66refyHQmdCDL6lW4ZWZ2icPR7xWsFFGM=;
        b=H1Wc0vswr2d5TU3j87doh00mUBeInpzmktqu2jt2t56twgPgiaa0cSu95OgSmYx7md
         BNoe/v8MFQRbQ8atE4K/FNGgfbYEYXqj2gvaGFOvOdvU271P9tUDYrKQPcbUVn9/9N5P
         mV+nJKkWJVrzD4E+o6KD6B46EWdAldozn4LMhpElNJ4rWXzfTnotfwlzJualTfy350nN
         9DN5X0ceCljrmtGST6OTfJ5CaqPcDXkwgHo9cmB4+wCMLLeJlxwV+vGAeR7q/to2IYFw
         rnF8ccXn1zSmrUcoYpWU6eWlsTT5Etstrlz13IqmV41Cj/mSEYDrpmMTVSd6qOxknnRX
         dggw==
X-Gm-Message-State: AOAM531bIcsDtWVsBZ0IENCZMRRUsfmrSJnAWlPX7HuYQhTS+G5q8R/e
	rtrWXhE4+Y0tcjpVqGLVJMW6w/EDhZoiFeH7LYiWqbRscWq1oh0N
X-Google-Smtp-Source: ABdhPJy+Y5xPa/pgsmnUlgOSBA5KsoyKfAf7QayiS0Rk+ne6AIl3S6t+gupbBEt4CcqW1c73qC6Ec6fRr+rxNv0nYbU=
X-Received: by 2002:a1f:1c6:: with SMTP id 189mr12053599vkb.13.1605877871800;
 Fri, 20 Nov 2020 05:11:11 -0800 (PST)
MIME-Version: 1.0
References: <CACJ1ZNuJCgDkRHvH2gXqC5gWTJHdUQ9J4G-HBNFwKYZFaWpWuw@mail.gmail.com>
 <CACJ1ZNupvRX_fcGPWn3mm+3Lm4gT38M088tUc_sSUu8JeQg3Fg@mail.gmail.com>
 <CACJ1ZNu5Kdf72j1eTtdgTuSOjgkpeEWFM0cKB-54pxqwXuWCDQ@mail.gmail.com> <CACJ1ZNtfgNr9oz7stE=2iwijjAUtZLWR2u_xihFZeEk3Y7gYRQ@mail.gmail.com>
In-Reply-To: <CACJ1ZNtfgNr9oz7stE=2iwijjAUtZLWR2u_xihFZeEk3Y7gYRQ@mail.gmail.com>
From: Olivier Lambert <lambert.olivier@gmail.com>
Date: Fri, 20 Nov 2020 14:11:00 +0100
Message-ID: <CACJ1ZNtiTg874VDKeV2sLdk0qWzt79pVf3Bo4J+GZWPhZdxWFQ@mail.gmail.com>
Subject: Re: Schedule for OpenPOWER/Xen meeting
To: "<xen-devel@lists.xen.org>" <xen-devel@lists.xen.org>
Cc: damien.thenot@vates.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks everyone for participating in the meeting!

Here is a recap on topics that was discussed (some partial/draft notes
from me and Damien at Vates, sorry if some are not entirely accurate):

* Page table implementation, hardware page walking, virtual memory in Xen
  * Multiple implementation, first a hashed tree structure, then later
a radix tree, closer to x86 and Linux usage.
  * Multiple page size support: 1G, 2M, 64k, 4k
  * All IO are memory mapped access

* Power arch hardware control and power management
  * Based on firmware called
[OPAL](https://open-power.github.io/skiboot/doc/opal-spec.html), Open
Power Abstraction Layer

* Interrupts are different than x86
  * Exceptions are considered interrupts in Power
  * Interrupts coming from external hardware are called external interrupts
    - On [KVM](https://www.kernel.org/doc/html/latest/virt/kvm/devices/xive=
.html)
    - On [Qemu](https://www.qemu.org/docs/master/specs/ppc-spapr-xive.html)

* There is an existing hypervisor spec on Power
  * What kind of hypercalls are needed to run a Linux guest on Power?
  * This spec need to be implemented on Xen to be the most compatible possi=
ble

* Might be interesting to join the OpenPOWER Foundation

* Toolchain to use to develop on Power
  * LLVM/CLang or GCC crosscompiler
  * Qemu emulation of Power architecture? Functional enough to begin
working on it?

* Availability of test hardware
  * Adapting the current CI loop for new architectures

* PCIe root complex each have their own IOMMU
  * Might be able to be disabled
  * Has an integrated error handling scheme

* Hardware information given by a device tree

This is all for our notes. Feel free to share if you have more content
or things to fix.


IMHO, it was very interesting, and also bringing good news:
1. There's an hypervisor specification for POWER, which will be
**really** useful if we want to implement Xen ("just" follow the spec)
2. POWER design and virt mechanisms seem -at first glance-
surprisingly similar to the Xen way (equivalent of grant table
principle etc.), and maybe it will be a great fit in the end!

There's still some technical docs to be published on the OpenPOWER
side, but they are willing to move forward relatively quickly.

In conclusion, I would say we are on the right track, and we might
have good surprises on how Xen can fit easily on POWER. Next steps?
Should we have a Xen meeting dedicated to that topic or should we wait
for the next monthly community call? We could use that time to decide
a kind of agenda for the next month and prepare some tasks to be done.

Thanks again!

Olivier.

For reference, here are the links we had during the meeting:
* https://openpowerfoundation.org/?resource_lib=3Dpower-isa-version-3-022:1=
3
OPAL, is a combination of multiple parts22:31
* https://open-power.github.io/skiboot/doc/opal-spec.html#what-is-opal22:33
* https://github.com/open-power/docs22:34
* https://openpowerfoundation.org/?resource_lib=3Dlinux-on-power-architectu=
re-reference-a-papr-linux-subset-review-draft22:37
* https://www.kernel.org/doc/html/latest/virt/kvm/devices/xive.html22:51
* https://www.qemu.org/docs/master/specs/ppc-spapr-xive.html


Le mer. 18 nov. 2020 =C3=A0 16:17, Olivier Lambert
<lambert.olivier@gmail.com> a =C3=A9crit :
>
> Hi!
>
> So I managed to get an agenda with basic questions. The meeting is at the=
 planned time (Nov the 19th, at 3PM central time, which is 9PM in UK and 10=
PM in Europe).
>
> Meeting place will be: https://ibm.webex.com/meet/mendy
>
> Don't forget to ping your colleagues/friends that aren't watching this ma=
iling list actively, so they won't miss the meeting :)
>
> See you tomorrow!
>
> Olivier.
>
> Le jeu. 12 nov. 2020 =C3=A0 21:44, Olivier Lambert <lambert.olivier@gmail=
.com> a =C3=A9crit :
>>
>> Okay so before having the meeting webex/whatever link, I think it would =
be more efficient to plan a kind of agenda, something we can pass to the Op=
enPOWER team in the next few days. This way, they could have some answers r=
eady, allowing us to explore more things interactively during the meeting.
>>
>> Feel free to participate in this thread (even if you won't be at the mee=
ting!), so we can gather and then organize a bit of what we'd like to know/=
discuss during this meeting.
>>
>> So go ahead and start to throw questions :)
>>
>>
>> Thanks,
>>
>> OIivier.
>>
>>
>> Le jeu. 12 nov. 2020 =C3=A0 09:26, Olivier Lambert <lambert.olivier@gmai=
l.com> a =C3=A9crit :
>>>
>>> Thanks to everyone who participated in the poll. Due to the limited num=
ber of answers, I think it's wiser to go for the second option (Thursday th=
e 19th), because everyone who already answered seems available that day. I'=
ll confirm that to OpenPOWER. When it's confirmed, I'll do a recap here ide=
ally with the meeting place.
>>>
>>> Thanks,
>>>
>>> Olivier.
>>>
>>>
>>> Le mar. 10 nov. 2020 =C3=A0 13:41, Olivier Lambert <lambert.olivier@gma=
il.com> a =C3=A9crit :
>>>>
>>>> Hi everyone,
>>>>
>>>> We got 2 potential dates for the initial tech meeting with at least on=
e OpenPOWER expert, so we can discuss the effort needed to port Xen on this=
 architecture.
>>>>
>>>> Because of time zones (on OpenPower side, there's one guy in Australia=
), we got 2 possible schedules in November:
>>>>
>>>> 1. 3pm CT on this Thursday the 12th (! this week)
>>>> 2. Or next week Thursday the 19th
>>>>
>>>> I made a doodle-like so everyone can vote on their preferred schedule:=
 https://framadate.org/QQu5rYEOEYr4ZHc4
>>>>
>>>> Note: 3pm CT would mean 9pm UTC, 10pm UTC+1 (CET). But correct me if I=
'm wrong.
>>>>
>>>> Reminder: the Cryptpad of the last Xen Community meeting contains the =
list of people interested. If you are aware of someone interested that coul=
d miss this email on this devel list, feel free to forward it. Cryptpad lin=
k: https://cryptpad.fr/pad/#/2/pad/edit/k-0Aj+Sxb5SliLWrFRBwx49V/
>>>>
>>>> Thank you and see you soon!
>>>>
>>>> Olivier.

