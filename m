Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C99E1F2053
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 21:55:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiNrq-0003Q6-B1; Mon, 08 Jun 2020 19:55:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YeZs=7V=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jiNro-0003Py-ED
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 19:55:32 +0000
X-Inumbo-ID: 0209e778-a9c2-11ea-bb8b-bc764e2007e4
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0209e778-a9c2-11ea-bb8b-bc764e2007e4;
 Mon, 08 Jun 2020 19:55:31 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id l12so15938038ejn.10
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 12:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zkqKSfKqHvpsIvDxZ4XjYXdsn1V9rmmhwnv/LiNryco=;
 b=O85BZLnCglpx57BmQdIiQ7BQU9efA7OfNIqIlK2n9FPnGQk5BGct6VUDCBVwqHepS5
 FBCwBr/uHKz192iq0VKegJpkSkNsZP2UWgrLo83llDxLH0KzyUgzDrAkW27JAMM95EGi
 9YAoa41+cFPIMq+42TRTRPiLm0weEazeEXUN/j0HxobVrDtmdWJe0AcOw1IrjK0ALYP5
 nBklzVFPTKpz9h+F3QmDDszICO8c1NC/nHxHmKta47IPIBenmrM5KqQP8Pth3MOIgtGG
 uOXAjC/lFO5sUlzLdtD9x//7YhGxODFCm/oX+IYq7JSzCVFVmlj88/3dzcigqZ4XP3sy
 tKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zkqKSfKqHvpsIvDxZ4XjYXdsn1V9rmmhwnv/LiNryco=;
 b=iTB4VIwCa5nsQf9TTLh19+IcWMfs3bpSIZf9WI8sVhiCRLiBhX4hPkP8NVj8qnh2PR
 FoFhalUfxS7YRgGrpkdkVazZn+JmdQg7RvUTPzsofgbnwPrXL1ijq3Nu8Wgz9mkzBS1/
 7W05l5ICh4sSLtamBq5rgFXkMSmIjIfpHC8quvg2q+OjZgKo/pJhIw87aIc+6iFLkiML
 Lr+w8faAH21l1EIQKdu6MBdKRCj90ljxaF+cXLt/+fjESy/w9Cs06QUDVU9Kx4aqPhQc
 HNnqOdbAg8z7Ic+myn07ivC4IWqwV1fmaLnj34TBeCWe0iUTuqj6vZX0e9r26QlpYyWc
 5aJw==
X-Gm-Message-State: AOAM5337Z+Js2UELTcKDr1pE0tSRQ4eY6ihYPOTyy6nOq5vjCZx2SyWn
 a6HtMeg92NihUeeyzlY02bszi49S1H0=
X-Google-Smtp-Source: ABdhPJwFrul+PRfCCj6Q5AGagEd1GOAdb1vxZrv1JRwwF8IBrdwEzU1eIr0ArQbezcieucel22V/fw==
X-Received: by 2002:a17:906:c10f:: with SMTP id
 do15mr23191835ejc.249.1591646130350; 
 Mon, 08 Jun 2020 12:55:30 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43])
 by smtp.gmail.com with ESMTPSA id m3sm13278756ede.58.2020.06.08.12.55.27
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 12:55:28 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id d128so837906wmc.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 12:55:27 -0700 (PDT)
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr303568wmk.77.1591646127329;
 Mon, 08 Jun 2020 12:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200603125237.100041-1-tamas@tklengyel.com>
 <20200603150721.GF1195@Air-de-Roger>
 <be627680-5ab2-d93d-b042-2b6aadbdcd8d@suse.com>
 <ffa44e09-a9fd-8fff-16af-e0991db3cb9b@bitdefender.com>
In-Reply-To: <ffa44e09-a9fd-8fff-16af-e0991db3cb9b@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 8 Jun 2020 13:54:51 -0600
X-Gmail-Original-Message-ID: <CABfawhnNC3yCuG+xNicyjA_Qo89qpvXKL-Cp9wAc4Cq=Xv8BYQ@mail.gmail.com>
Message-ID: <CABfawhnNC3yCuG+xNicyjA_Qo89qpvXKL-Cp9wAc4Cq=Xv8BYQ@mail.gmail.com>
Subject: Re: [PATCH v4 for-4.14] x86/monitor: revert default behavior when
 monitoring register write events
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrei LUTAS <vlutas@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?TWloYWkgRG9uyJt1?= <mdontu@bitdefender.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 8, 2020 at 12:58 PM Razvan Cojocaru
<rcojocaru@bitdefender.com> wrote:
>
> On 6/8/20 6:55 PM, Jan Beulich wrote:
> > On 03.06.2020 17:07, Roger Pau Monn=C3=A9 wrote:
> >> On Wed, Jun 03, 2020 at 06:52:37AM -0600, Tamas K Lengyel wrote:
> >>> For the last couple years we have received numerous reports from user=
s of
> >>> monitor vm_events of spurious guest crashes when using events. In par=
ticular,
> >>> it has observed that the problem occurs when vm_events are being disa=
bled. The
> >>> nature of the guest crash varied widely and has only occured occasion=
ally. This
> >>> made debugging the issue particularly hard. We had discussions about =
this issue
> >>> even here on the xen-devel mailinglist with no luck figuring it out.
> >>>
> >>> The bug has now been identified as a race-condition between register =
event
> >>> handling and disabling the monitor vm_event interface. The default be=
havior
> >>> regarding emulation of register write events is changed so that they =
get
> >>> postponed until the corresponding vm_event handler decides whether to=
 allow such
> >>> write to take place. Unfortunately this can only be implemented by pe=
rforming the
> >>> deny/allow step when the vCPU gets scheduled.
> >>>
> >>> Due to that postponed emulation of the event if the user decides to p=
ause the
> >>> VM in the vm_event handler and then disable events, the entire emulat=
ion step
> >>> is skipped the next time the vCPU is resumed. Even if the user doesn'=
t pause
> >>> during the vm_event handling but exits immediately and disables vm_ev=
ent, the
> >>> situation becomes racey as disabling vm_event may succeed before the =
guest's
> >>> vCPUs get scheduled with the pending emulation task. This has been pa=
rticularly
> >>> the case with VMS that have several vCPUs as after the VM is unpaused=
 it may
> >>> actually take a long time before all vCPUs get scheduled.
> >>>
> >>> In this patch we are reverting the default behavior to always perform=
 emulation
> >>> of register write events when the event occurs. To postpone them can =
be turned
> >>> on as an option. In that case the user of the interface still has to =
take care
> >>> of only disabling the interface when its safe as it remains buggy.
> >>>
> >>> Fixes: 96760e2fba10 ('vm_event: deny register writes if refused by vm=
_event
> >>> reply').
> >>>
> >>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> >>
> >> Thanks!
> >>
> >> Reviewed-by: Roger Pau Monn=C3=A9 <rogerpau@citrix.com>
> >>
> >> I would like to get some input from Bitdefender really, and whether
> >> they are fine with this approach.
>
> Hello,
>
> Not really my call to make anymore, but I do have a few notes.
>
> First, IIRC the problem stems from the initial choice to have the
> vm_event data allocated on-demand when first subscribing to events. The
> proper solution (since this patch doesn't actually fix the problem),
> IMHO, would be for the vm_event data to _always_ exist, and instead of
> relying on the value of its pointer to check if there are event
> subscribers, we could just check the emulation flags individually and
> never miss a pending emulated something again. I did try to go that way
> in the beginning, but it has reasonably been objected that we should cut
> back on using hypervisor memory unnecessarily, hence we got at this point=
.
>
> Secondly, I see no reason why we couldn't adapt to the new default
> behaviour provided that the old behaviour continues to work _exactly_ as
> before.
>
> And last but not least, the proper sequence is: 1. unsubscribe from
> register write events, 2. process all events "still in the chamber"
> (keep checking the ring buffer for a while), 3. detach from the guest
> (disable the vm_event subsystem). Not ideal perhaps (in that it's not
> guaranteed that a VCPU won't resume after a longer period than our
> timeout), but if the sequence is followed there should be no guest hangs
> or crashes (at least none that we or our clients have observed so far).

Incorrect. That's not enough. You also have to wait for all the vCPUs
to get scheduled before disabling vm_event or otherwise the emulation
is skipped entirely. Please read the patch message. If the user
decides to disable vm_event after getting a CR3 event delivered, the
CR3 never gets updated and results in the guest crashing in
unpredictable ways. Same happens with all the other registers.

>
> So in short, I think there's a better fix for this by simply not
> allocating the vm_event memory on-demand anymore and never having to
> deal with lost pending emulations again. It should also decrease code
> complexity by a tiny bit. Then again, as stated at the beginning of this
> message, that's just a recommendation.

Since only you guys use this feature I'm going to wait for a fix.
Until then, the default behavior should be restored so this buggy
behavior doesn't affect anyone else. You can still turn it on, its
just not going to be on for vm_event by default. I don't particularly
care what fix is there since only you guys use it. If you don't mind
that there is this buggy behavior because you never disable vm_event
once you activate it then that's that.

Cheers,
Tamas

