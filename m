Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6A294100B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 12:56:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767572.1178245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkWN-0007cE-0e; Tue, 30 Jul 2024 10:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767572.1178245; Tue, 30 Jul 2024 10:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkWM-0007a1-Sv; Tue, 30 Jul 2024 10:55:58 +0000
Received: by outflank-mailman (input) for mailman id 767572;
 Tue, 30 Jul 2024 10:55:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/bP=O6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYkWM-0007Zv-0Y
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 10:55:58 +0000
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [2607:f8b0:4864:20::82e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a530597-4e62-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 12:55:53 +0200 (CEST)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-44fe11dedb3so19458751cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 03:55:53 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe817b704sm48859191cf.49.2024.07.30.03.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 03:55:52 -0700 (PDT)
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
X-Inumbo-ID: 4a530597-4e62-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722336953; x=1722941753; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FgXOKJWNRnRlz0Nm5RAVMdrRS+bLkdw98dwTpwqDu7Q=;
        b=F7bWE5lp75dbMAb5rgSbdRHkyGkbmCW3wBjvnFjZSmksGhD1HtfKYslZBXZ5tgiZ9p
         iWvP9qWg+BVGJ8HoMfqCT9OMT9JY9aqmqZnSxRQVG16k/Q36J7ifhO7BEZ/D+aWP85Jn
         Jlo+KGYU7UBLzZfGahQOmLR+g1Xz0gStEqVPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722336953; x=1722941753;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FgXOKJWNRnRlz0Nm5RAVMdrRS+bLkdw98dwTpwqDu7Q=;
        b=oU2FkckRg0TIrbeoNa1lOzzM2ceTPMZ9hoOJmY5ofmUDPxHOs+Xt/PmGVxoIo718gx
         NjcXig/0cXcedi3I7vt6BdlFsgo0mA0GRZiM2bKjdm2aQ9CMlU8uUi0pdwBaImMb72im
         JVdHVInIjsk94+QFQTLjtApOh3j71A8UwW2cQhKfGmqyaZlHmS+1QvtNWsDtU14saNWH
         1dAkZqOQa63h6iXmr4w4kPZO00Vxa8fs5HSGyn5jfRagbty5cMQFs1D5zdJucpnZkweg
         Nt/Tpn9lAavRpZzjGWvzsvpjcjUfq4oiI/kIRd8SfpqCHXVoADjTxUpPlTH8RHCwouje
         7zhw==
X-Forwarded-Encrypted: i=1; AJvYcCWATYD4DYjJ6JYW1U3s2iSkOvt48joPHODtEy31/eKCHwC3/kKoArCiwAOVQRt5Y3aRBjeRrpn0qzRxm5QntN5H8HGK5Que1h1dpssDYNM=
X-Gm-Message-State: AOJu0YxzPqUV6x59Br3Y/MmCOyEJ81WkuPKxzkUuoGk9X1OCUqj8V5uo
	kA+Sywf5rOF944sDsL8maWPzz4yUn7upb7vBTwP800qK5YjnCgODB8nhjIlPguY=
X-Google-Smtp-Source: AGHT+IGDcuHOXGDLPG2b8B3tNSoa6NthQF9XssbyibuciuFoE3LIh6WuK4czhNZhgcIhhog4QcHNUQ==
X-Received: by 2002:a05:622a:1309:b0:447:df6b:b8c5 with SMTP id d75a77b69052e-45004db298amr120861831cf.33.1722336952454;
        Tue, 30 Jul 2024 03:55:52 -0700 (PDT)
Date: Tue, 30 Jul 2024 12:55:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, alejandro.vallejo@cloud.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 03/22] x86/dom0: only disable SMAP for the PV dom0 build
Message-ID: <ZqjGs2NLTbatrQS9@macbook>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-4-roger.pau@citrix.com>
 <b1918f51-1ac0-40f8-9174-d8161b2681dd@suse.com>
 <5aad5f48-e32e-4a59-bcef-05adec0ecbec@citrix.com>
 <ZqfA714LUFgZOYqw@macbook>
 <542807c8-425b-481f-b02f-dd657c12ef5d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <542807c8-425b-481f-b02f-dd657c12ef5d@citrix.com>

On Mon, Jul 29, 2024 at 06:51:31PM +0100, Andrew Cooper wrote:
> On 29/07/2024 5:18 pm, Roger Pau Monné wrote:
> > On Mon, Jul 29, 2024 at 04:52:22PM +0100, Andrew Cooper wrote:
> >> On 29/07/2024 12:53 pm, Jan Beulich wrote:
> >>> On 26.07.2024 17:21, Roger Pau Monne wrote:
> >>>> The PVH dom0 builder doesn't switch page tables and has no need to run with
> >>>> SMAP disabled.
> >>>>
> >>>> Put the SMAP disabling close to the code region where it's necessary, as it
> >>>> then becomes obvious why switch_cr3_cr4() is required instead of
> >>>> write_ptbase().
> >>>>
> >>>> Note removing SMAP from cr4_pv32_mask is not required, as we never jump into
> >>>> guest context, and hence updating the value of cr4_pv32_mask is not relevant.
> >>> I'm okay-ish with that being dropped, but iirc the goal was to keep the
> >>> variable in sync with CPU state.
> >> Removing SMAP from cr4_pv32_mask is necessary.
> >>
> >> Otherwise IST vectors will reactive SMAP behind the back of the dombuilder.
> >>
> >> This will probably only manifest in practice in a CONFIG_PV32=y build,
> > Sorry, I'm possibly missing some context here.  When running the dom0
> > builder we switch to the guest page-tables, but not to the guest vCPU,
> > (iow: current == idle) and hence the context is always the Xen
> > context.
> 
> Correct.
> 
> > Why would the return path of the IST use cr4_pv32_mask when the
> > context in which the IST happened was the Xen one, and the current
> > vCPU is the idle one (a 64bit PV guest from Xen's PoV).
> >
> > My understanding is that cr4_pv32_mask should only be used when the
> > current context is running a 32bit PV vCPU.
> 
> This logic is evil to follow, because you need to look at both
> cr4_pv32_mask and XEN_CR4_PV32_BITS to see both halves of it.
> 
> Notice how cr4_pv32_restore() only ever OR's cr4_pv32_mask into %cr4?
> 
> CR4_PV32_RESTORE is called from every entry path which *might* have come
> from a 32bit PV guest, and it always results in Xen having SMEP/SMAP
> active (as applicable).  This includes NMI.
> 
> The change is only undone in compat_restore_all_guest(), where
> XEN_CR4_PV32_BITS is cleared from %cr4 iff returning to Ring1/2.  This
> is logic cunningly disguised in the use of the Parity flag.
> 
> 
> Because the NMI handler does reactive SMEP/SMAP (based on the value in
> cr4_pv32_mask), and returning to Xen does not pass through
> compat_restore_all_guest(), taking an NMI in the middle of of the
> dombuilder will reactive SMAP behind your back.

After further conversations with Andrew we believe the current
disabling of X86_CR4_SMAP in %cr4 during dom0 build is not safe.

Regardless of whether cr4_pv32_mask is properly adjusted return to Xen
context from interrupt would be done with SMAP enabled if
X86_FEATURE_XEN_SMAP is set.

I will send a new patch that uses stac/clac in order to disable SMAP
(if required) around the dom0 builder code that switches to the guest
page-tables.

Thanks, Roger.

