Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C236CC076
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515812.799023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9DE-0007Zp-PO; Tue, 28 Mar 2023 13:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515812.799023; Tue, 28 Mar 2023 13:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9DE-0007Xv-Lu; Tue, 28 Mar 2023 13:18:08 +0000
Received: by outflank-mailman (input) for mailman id 515812;
 Tue, 28 Mar 2023 13:18:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IY7/=7U=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ph9DD-0007Xp-6U
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:18:07 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f85ddb38-cd6a-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 15:18:03 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id ew6so49532001edb.7
 for <xen-devel@lists.xenproject.org>; Tue, 28 Mar 2023 06:18:03 -0700 (PDT)
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
X-Inumbo-ID: f85ddb38-cd6a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680009483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhT+ZhphlbdeUESsSSgGWxwo5/1pHAMO/rIl/XZvRVQ=;
        b=oEpjkZ+B3up9MPdlF02zEwh027XzlHFpQgS7gGDuP2kiIvBfmJaMeaQtsGuxo4pas+
         6qbl+rGyaeIyl9waibTijT45S79OfcBEogpvP3rgeJDYdEHa3Su6v0CXpZfrr80wA5Ff
         PN/KXVOXKNzxoO9Dek4YYJcprRi+qQNs2xbx7zWoiE0et9f6MKzqx9SCy3p88U7lTXok
         ki+5sHyuo+DzluGKgi3LFwqhTotG8lQHfkRb3fmtTfa/xec5xhNmG21rzjV/H4vadkzJ
         y5PNS8iCZwP7k8jFo8IAQQVbQf2SvIP8zN5iuVGLzODygzXDjG5REopq3JzY7wdn3wBC
         ohnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680009483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LhT+ZhphlbdeUESsSSgGWxwo5/1pHAMO/rIl/XZvRVQ=;
        b=juHUsrfggs1Q3eeQRDyj6jZkLzTdhclFsS8mCXL434l5lM9qYnZJgSO/GK3gqq4pjx
         hfdfjMu6ZQGk6BqjA2a3oDDqxAG4OpNbSFXK8DfTROVExEguv0CyuUcML4Jr6X9n/VfN
         x4iVAsTLFWroREQKaOQ//6ZsLTHmZuEHki03IDjBTQoTk4vFRtHWk+DMAm3/1yADgiRq
         McJk+6YJE6BjwZqsk+RYiOJpXcVFjG2kwRqQx46M1EhW0dIBJrGY8tD3CuDPaLjV8rOI
         DYiQsoAkjVQKqv93Cn6oDMszR1kyZFCdJUFa+pyD4IrFEi2UyDzFBz6WWIT2/NYdUpRG
         1E4w==
X-Gm-Message-State: AAQBX9dpIRWnK1hLwoC44idxcKnRqEVHfn2w/7H0hUzr2Gqlzgvr3Hl1
	ur9jRLWsSVWn6FsBkVhh8VIb2tqe8kxR2kb6GMA=
X-Google-Smtp-Source: AKy350adxhMxYXEULKXAdAsCgMBdNursG8/RisqS74DQxotcbMeFYnuEp+Jh80j8UoVOJMahHsY2etrIZbgy0F+5P74=
X-Received: by 2002:a17:906:ee8b:b0:93e:739f:b0b8 with SMTP id
 wt11-20020a170906ee8b00b0093e739fb0b8mr6628491ejb.3.1680009482936; Tue, 28
 Mar 2023 06:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-3-marmarek@invisiblethingslab.com> <5cfcfb7a-df50-fbe4-89e6-611a83991790@suse.com>
 <ZCLl3ePLgrmFTViV@mail-itl>
In-Reply-To: <ZCLl3ePLgrmFTViV@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 28 Mar 2023 09:17:50 -0400
Message-ID: <CAKf6xpto87QRSKT2qc1yApNfaw2SrLLxPoytYJv_jEbYTAbjCg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 9:04=E2=80=AFAM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Tue, Mar 28, 2023 at 02:54:38PM +0200, Jan Beulich wrote:
> > On 25.03.2023 03:49, Marek Marczykowski-G=C3=B3recki wrote:
> > > Some firmware/devices are found to not reset MSI-X properly, leaving
> > > MASKALL set. Xen relies on initial state being both disabled.
> > > Especially, pci_reset_msix_state() assumes if MASKALL is set, it was =
Xen
> > > setting it due to msix->host_maskall or msix->guest_maskall. Clearing
> > > just MASKALL might be unsafe if ENABLE is set, so clear them both.
> >
> > But pci_reset_msix_state() comes into play only when assigning a device
> > to a DomU. If the tool stack doing a reset doesn't properly clear the
> > bit, how would it be cleared the next time round (i.e. after the guest
> > stopped and then possibly was started again)? It feels like the issue
> > wants dealing with elsewhere, possibly in the tool stack.
>
> I may be misremembering some details, but AFAIR Xen intercepts
> toolstack's (or more generally: accesses from dom0) attempt to clean
> this up and once it enters an inconsistent state (or rather: starts with
> such at the start of the day), there was no way to clean it up.
>
> I have considered changing pci_reset_msix_state() to not choke on
> MASKALL being set, but I'm a bit afraid of doing it, as there it seems
> there is a lot of assumptions all over the place and I may miss some.

Hi, Marek and Jan,

Marek, thank you for working on MSI-X support.

As Jan says, the clearing here works during system boot.  However, I
have found that Xen itself is setting MASKALL in __pci_disable_msix()
when shutting down a domU.  When that is called, memory_decoded(dev)
returns false, and Xen prints "cannot disable IRQ 137: masking MSI-X
on 0000:00:14.3".  That makes the device unavailable for subsequent
domU assignment.  I haven't investigated where and why memory decoding
gets disabled for the device.

Testing was with this v2 patchset integrated into OpenXT w/ Xen 4.16.
We have some device reset changes, so I'll have to look at them again.
Hmmm, they move the libxl device reseting from pci_remove_detached()
to libxl__destroy_domid() to ensure all devices are de-assign after
the domain is destroyed.  A kernel patch implements a "more thorough
reset" which could do a slot or bus level reset, and the desire is to
have all devices deassigned before that.  Maybe the shift later is
throwing off Xen's expectations?

As Marek says, the MASKALL handling seems tricky.  Xen seems to use it
to ensure there are no interrupts, so clearing it makes one worry
about breaking something else.

Regards,
Jason

