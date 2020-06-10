Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D281F5938
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 18:37:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj3hr-0000p4-Bf; Wed, 10 Jun 2020 16:36:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fmls=7X=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jj3hp-0000oz-Rs
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 16:36:02 +0000
X-Inumbo-ID: 77ca8cca-ab38-11ea-bca7-bc764e2007e4
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77ca8cca-ab38-11ea-bca7-bc764e2007e4;
 Wed, 10 Jun 2020 16:36:00 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id gl26so3274526ejb.11
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 09:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q8zLjXo5Gf3PWy97Koz6jOMttnRr4rpiOEISH2O21iY=;
 b=N8P+t8mnku4PIgSW/grhFHrDedILVk4V6E/21KSjo2R8GM+as0NXP2KNhgtC0zSgGi
 2NgKpgfYGTnmMHZYu/S+IlhKZpRulhFf5hF8Fd+5QikvdksXDSu/EVPjtaGxNY7CMbHJ
 xASKI4JyId+/xFjMluyV8er8k9CbX3obyXXxQkI9d7tFbGoZcD9L6lryfiLLaKeaGadf
 nyou5HkcPI3qT4+pn4tqPbSjrx6K+ztaJTFV2dimpA61wrWT7rrcd39GFCMpSTaHmW9B
 XsAB8GcSl9ieeeucpgklo4eB9SU9EONycxB6XVRTO1hzluObFDJRUCRNcqADCze+mov2
 5wGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q8zLjXo5Gf3PWy97Koz6jOMttnRr4rpiOEISH2O21iY=;
 b=oJ/8NVGuxbWI/VnwdXBo6Db14LtXENQMcVvnPi5jZbZnl8/5urxfDYHiXbG3V63k2y
 rzv2hyzltbDrvlbPxZn1F4MoFYAFL7W22a/HC+SlDnfHt/HFLuS/NTUZc+ElYhB6qRdQ
 IuWm4c++4WdwK+hyB0xp0cZwlhDbXOQjKyOcbtt+NDGQliWlnFWNKWN2UYt6kbYGCrC6
 2sVxAZ0bENxra7+EFqenjdH+MsoEGT7kl0ucxGR7NECfnLjNjgWYAb89NImJmkBuDcoU
 huECBjS06H1g5k2dxA78dlOvx5J7rNE9yTwS/KEcvayO4sXTOAXbdGlXumDMc7kjFIae
 xAPw==
X-Gm-Message-State: AOAM5308CUhdLsX8r56KYjLqprIDn+hp1Bfx9eO2afabLaO7zZj1XQ3T
 dIvw1zm1u1BWaNaLRKjgqh2gxSj5CjA=
X-Google-Smtp-Source: ABdhPJwakgrhpQFNUFc0WPbG2cfg7fsz91PfCHC9SbUuUtz7kasiUuCe+ycc5qLZepfW+GM/gfIRzw==
X-Received: by 2002:a17:907:4030:: with SMTP id
 nr24mr4074179ejb.247.1591806959200; 
 Wed, 10 Jun 2020 09:35:59 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53])
 by smtp.gmail.com with ESMTPSA id oq28sm211777ejb.12.2020.06.10.09.35.57
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 09:35:57 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id r15so2418921wmh.5
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 09:35:57 -0700 (PDT)
X-Received: by 2002:a05:600c:2294:: with SMTP id
 20mr4197977wmf.51.1591806956973; 
 Wed, 10 Jun 2020 09:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200603125237.100041-1-tamas@tklengyel.com>
 <64ea771f-a7c1-cfc1-e135-632ec4c7fc93@suse.com>
 <006f01d63e43$25e98440$71bc8cc0$@xen.org>
In-Reply-To: <006f01d63e43$25e98440$71bc8cc0$@xen.org>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 10 Jun 2020 10:35:16 -0600
X-Gmail-Original-Message-ID: <CABfawh=Mtq_iUwBpOU9Ga5UohZnYWZsfM7g=J2D9xuXAOfozZg@mail.gmail.com>
Message-ID: <CABfawh=Mtq_iUwBpOU9Ga5UohZnYWZsfM7g=J2D9xuXAOfozZg@mail.gmail.com>
Subject: Re: [PATCH v4 for-4.14] x86/monitor: revert default behavior when
 monitoring register write events
To: Paul Durrant <paul@xen.org>
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 9, 2020 at 3:48 AM Paul Durrant <xadimgnik@gmail.com> wrote:
>
> > -----Original Message-----
> > From: Jan Beulich <jbeulich@suse.com>
> > Sent: 09 June 2020 10:37
> > To: Tamas K Lengyel <tamas@tklengyel.com>
> > Cc: xen-devel@lists.xenproject.org; Andrew Cooper <andrew.cooper3@citri=
x.com>; Wei Liu <wl@xen.org>;
> > Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; George Dunlap <george.dunl=
ap@citrix.com>; Ian Jackson
> > <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano Sta=
bellini
> > <sstabellini@kernel.org>; Alexandru Isaila <aisaila@bitdefender.com>; P=
etre Pircalabu
> > <ppircalabu@bitdefender.com>; Paul Durrant <paul@xen.org>
> > Subject: Re: [PATCH v4 for-4.14] x86/monitor: revert default behavior w=
hen monitoring register write
> > events
> >
> > On 03.06.2020 14:52, Tamas K Lengyel wrote:
> > > For the last couple years we have received numerous reports from user=
s of
> > > monitor vm_events of spurious guest crashes when using events. In par=
ticular,
> > > it has observed that the problem occurs when vm_events are being disa=
bled. The
> > > nature of the guest crash varied widely and has only occured occasion=
ally. This
> > > made debugging the issue particularly hard. We had discussions about =
this issue
> > > even here on the xen-devel mailinglist with no luck figuring it out.
> > >
> > > The bug has now been identified as a race-condition between register =
event
> > > handling and disabling the monitor vm_event interface. The default be=
havior
> > > regarding emulation of register write events is changed so that they =
get
> > > postponed until the corresponding vm_event handler decides whether to=
 allow such
> > > write to take place. Unfortunately this can only be implemented by pe=
rforming the
> > > deny/allow step when the vCPU gets scheduled.
> > >
> > > Due to that postponed emulation of the event if the user decides to p=
ause the
> > > VM in the vm_event handler and then disable events, the entire emulat=
ion step
> > > is skipped the next time the vCPU is resumed. Even if the user doesn'=
t pause
> > > during the vm_event handling but exits immediately and disables vm_ev=
ent, the
> > > situation becomes racey as disabling vm_event may succeed before the =
guest's
> > > vCPUs get scheduled with the pending emulation task. This has been pa=
rticularly
> > > the case with VMS that have several vCPUs as after the VM is unpaused=
 it may
> > > actually take a long time before all vCPUs get scheduled.
> > >
> > > In this patch we are reverting the default behavior to always perform=
 emulation
> > > of register write events when the event occurs. To postpone them can =
be turned
> > > on as an option. In that case the user of the interface still has to =
take care
> > > of only disabling the interface when its safe as it remains buggy.
> > >
> > > Fixes: 96760e2fba10 ('vm_event: deny register writes if refused by vm=
_event
> > > reply').
> > >
> > > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> >
> > Applicable parts
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> >
>
> Release-acked-by: Paul Durrant <paul@xen.org>

Thanks guys!

Tamas

