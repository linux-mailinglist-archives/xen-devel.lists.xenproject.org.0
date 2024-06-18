Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C985890C981
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 13:31:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743021.1149920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJX3I-0000wI-Rx; Tue, 18 Jun 2024 11:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743021.1149920; Tue, 18 Jun 2024 11:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJX3I-0000t6-PN; Tue, 18 Jun 2024 11:31:04 +0000
Received: by outflank-mailman (input) for mailman id 743021;
 Tue, 18 Jun 2024 11:31:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TBP2=NU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sJX3G-0000t0-TT
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 11:31:02 +0000
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [2607:f8b0:4864:20::112b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bed4ed4-2d66-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 13:30:59 +0200 (CEST)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-6326f1647f6so36809177b3.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 04:30:59 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5eb4a9csm65426756d6.80.2024.06.18.04.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 04:30:56 -0700 (PDT)
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
X-Inumbo-ID: 3bed4ed4-2d66-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718710258; x=1719315058; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jfDsGWpu8kmMigXDssbe2VS7M/If25548mxXexQvdaY=;
        b=KjB/rSIo+GMI3bg6l4n8AAGLOjLgFgAeWvXucmopJTCctOUkPy66Vv87pWRhRdBkeb
         3k/L9tw6pSUBd//Br7WW1Ra9fyeW3Z2W4A1mWNgW66x9C9H6lThcLns2If534xjtwarg
         V8Ao2DundyyY1wmP8TIgO9nQrR6DF4ztaF0F4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718710258; x=1719315058;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jfDsGWpu8kmMigXDssbe2VS7M/If25548mxXexQvdaY=;
        b=u4FkNtKN5xD4wx1OHOc60bsWMBLyySqQoM6NPueEc+tA1m6mJsdDdkhINB1lzxbhSx
         ZFlMnPxlDKjm5fmAfJyP5GQsGUM1mIpEekabN91/teZ/5isa/cktjxZ4L8CQcMgTw4Ip
         M8JqxButK7ILsmZov7AARDx16Y3tLSTbhmTMTKQXX+q0bfDhgawnB7KYyu8AJ3UDhMxU
         7ONBttVPjHvwVAikGQbqHmZI7CP0HHH8nP9tBetO8Ixel52nq672ZujhTqb9ndN3Ziu3
         PMs+wGIbPQF6RFgwDPKKo09XYpTb15kzWDNjQMcJQ07fRLhoghRMFkqSZeA2PwKEG5mN
         7zGw==
X-Forwarded-Encrypted: i=1; AJvYcCXIyKS3Ql4AugBuyAtU6F3pS0Vg9EzcSoegHX8GVjJ5BcJHfwzVgi9KvlCymkgm5oNHVHvXjI6a7zwOJ5Hswn9yFiuBFPXdemwVXhV43UY=
X-Gm-Message-State: AOJu0Yx3sIW72g5Mjdvt4JCoCZcBkPMfTcq080/MpSvK4MqrBuIJS/N2
	l8CYIF5RKNkJ+nO4WsUzHPTNsPNW+wsODq780h0FjvNG7vCX0rz461+sFJGlgdgqZasmr49tqkZ
	K
X-Google-Smtp-Source: AGHT+IFNljBgGvji7v9Ju+ECIIS8KF+0wNUSyIiZazzVLjN3HK+Uc+rPTfxXuiJWkxQX5vQ4Y4pmKQ==
X-Received: by 2002:a81:7bc6:0:b0:62f:eab8:7a09 with SMTP id 00721157ae682-63224ef2521mr113565647b3.44.1718710256601;
        Tue, 18 Jun 2024 04:30:56 -0700 (PDT)
Date: Tue, 18 Jun 2024 13:30:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/3] x86/irq: forward pending interrupts to new
 destination in fixup_irqs()
Message-ID: <ZnFv7b4YNjeRXj6-@macbook>
References: <20240613165617.42538-1-roger.pau@citrix.com>
 <20240613165617.42538-4-roger.pau@citrix.com>
 <e3912334-4dbe-40e9-aed4-8b47e1570cc7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3912334-4dbe-40e9-aed4-8b47e1570cc7@suse.com>

On Mon, Jun 17, 2024 at 03:41:12PM +0200, Jan Beulich wrote:
> On 13.06.2024 18:56, Roger Pau Monne wrote:
> > fixup_irqs() is used to evacuate interrupts from to be offlined CPUs.  Given
> > the CPU is to become offline, the normal migration logic used by Xen where the
> > vector in the previous target(s) is left configured until the interrupt is
> > received on the new destination is not suitable.
> > 
> > Instead attempt to do as much as possible in order to prevent loosing
> > interrupts.  If fixup_irqs() is called from the CPU to be offlined (as is
> > currently the case)
> 
> Except (again) for smp_send_stop().

I guess I haven't worded this properly, the point I was trying to make
is that in the context of a CPU unplug fixup_irqs() is always called
from the CPU that's going offline.

What about:

"If fixup_irqs() is called from the CPU to be offlined (as is
currently the case for CPU hot unplug) ..."

> > attempt to forward pending vectors when interrupts that
> > target the current CPU are migrated to a different destination.
> > 
> > Additionally, for interrupts that have already been moved from the current CPU
> > prior to the call to fixup_irqs() but that haven't been delivered to the new
> > destination (iow: interrupts with move_in_progress set and the current CPU set
> > in ->arch.old_cpu_mask) also check whether the previous vector is pending and
> > forward it to the new destination.
> > 
> > This allows us to remove the window with interrupts enabled at the bottom of
> > fixup_irqs().  Such window wasn't safe anyway: references to the CPU to become
> > offline are removed from interrupts masks, but the per-CPU vector_irq[] array
> > is not updated to reflect those changes (as the CPU is going offline anyway).
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >[...]
> > @@ -2686,11 +2705,27 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
> >          if ( desc->handler->disable )
> >              desc->handler->disable(desc);
> >  
> > +        /*
> > +         * If the current CPU is going offline and is (one of) the target(s) of
> > +         * the interrupt, signal to check whether there are any pending vectors
> > +         * to be handled in the local APIC after the interrupt has been moved.
> > +         */
> > +        if ( !cpu_online(cpu) && cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
> > +            check_irr = true;
> > +
> >          if ( desc->handler->set_affinity )
> >              desc->handler->set_affinity(desc, affinity);
> >          else if ( !(warned++) )
> >              set_affinity = false;
> >  
> > +        if ( check_irr && apic_irr_read(vector) )
> > +            /*
> > +             * Forward pending interrupt to the new destination, this CPU is
> > +             * going offline and otherwise the interrupt would be lost.
> > +             */
> > +            send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
> > +                          desc->arch.vector);
> 
> Hmm, IRR may become set right after the IRR read (unlike in the other cases,
> where new IRQs ought to be surfacing only at the new destination). Doesn't
> this want moving ...
> 
> >          if ( desc->handler->enable )
> >              desc->handler->enable(desc);
> 
> ... past the actual affinity change?

Hm, but the ->enable() hook is just unmasking the interrupt, the
actual affinity change is done in ->set_affinity(), and hence after
the call to ->set_affinity() no further interrupts should be delivered
to the CPU regardless of whether the source is masked?

Or is it possible for the device/interrupt controller to not switch to
use the new destination until the interrupt is unmasked, and hence
could have pending masked interrupts still using the old destination?
IIRC For MSI-X it's required that the device updates the destination
target once the entry is unmasked.

I'm happy to move it after the ->enable() hook, but would like to
better understand why this is required.

Thanks, Roger.

