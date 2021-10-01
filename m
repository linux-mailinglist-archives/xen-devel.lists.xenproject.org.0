Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B996A41F578
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 21:09:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200808.355378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWNt8-0003gR-TC; Fri, 01 Oct 2021 19:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200808.355378; Fri, 01 Oct 2021 19:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWNt8-0003dQ-QA; Fri, 01 Oct 2021 19:08:06 +0000
Received: by outflank-mailman (input) for mailman id 200808;
 Fri, 01 Oct 2021 19:08:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmoI=OV=gmail.com=this.is.a0lson@srs-us1.protection.inumbo.net>)
 id 1mWNt6-0003d8-Dw
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 19:08:04 +0000
Received: from mail-qt1-x830.google.com (unknown [2607:f8b0:4864:20::830])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d103af8-ef0e-420e-9c0e-efa612e329d3;
 Fri, 01 Oct 2021 19:08:02 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id e16so9917831qte.13
 for <xen-devel@lists.xenproject.org>; Fri, 01 Oct 2021 12:08:02 -0700 (PDT)
Received: from development ([24.214.236.228])
 by smtp.gmail.com with ESMTPSA id v1sm3464287qkv.37.2021.10.01.12.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 12:08:01 -0700 (PDT)
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
X-Inumbo-ID: 0d103af8-ef0e-420e-9c0e-efa612e329d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=wOSN/23E1YtC/bsgmWNfyTXDkqv22zJD+bK79ix+BB8=;
        b=MQPDan3lsBieNH7UBdxhTdu5ryG4l7iEHz+M5fkLLfvv2GJHp0m0nMgiFsFoRQ934J
         8h+UtYNbp5/PiS2VmULQpJBqTVcvIGaiUfokFwjKIImI9R/I1OjiSKp3bEprVwds2+L5
         kju5+ZfBbkDTUXPuy5IQVMqJ5grOmXa9jVgu9sO+05d+K9qiUW+1cBP/1/BE15G4BP+l
         qfU4KshWTM0YPJcUCyYlNnmQexogCeOZvAW4YwT4ZuYCfjROQebpx2MCqXtIaCIPrKEH
         zE/lw6297mzZw0TISXSJmJ3+kPiGp2O8339+sDC8pPU9l6nu+rMJEQpHvGeJf8afXBh8
         ZV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wOSN/23E1YtC/bsgmWNfyTXDkqv22zJD+bK79ix+BB8=;
        b=4xsIf6oMzx2Jm4yOPhE1XiixCrVcEq9fdl9wfObmp3KLL6VvPz6fmTMJKbAFxMvndZ
         /gwcQU4TdJZeCuxhUek+cVjfWuuPTyUxHFWyVx/Dr5QRMrCKX1WXKK1w69c4Dhn5WL8W
         YNTJOYwoegsgt0YdLNEUssk56X3pcHwBG/hEhMFw+C+F9GuLa5rNnoXSMCqQI/bRZJno
         EfL1JqOqLwBaFchqS4yQouBgzp5URJVWj2sKOHMMptTPFIEOQDPyDHuhEPly53A3W0G/
         HkVhtUkBuCZA8tnRNLHa9FkvkCAqFbWku+TpKtYXfgljs7T7sfBPWBpb1PIOAoeYyCxF
         ZDug==
X-Gm-Message-State: AOAM531QYd/z+awdIzn+IQFgnh0xofiBy3F27U1IoVJj1EIvWOhkYLZF
	Er2i6lvOQe1pVtKAp63Fp+4=
X-Google-Smtp-Source: ABdhPJwuFp86pYiOUIVy4/oDalxruLAqFyJgC/M0dX/IG+z3OjfIRjCGzLWQj6zNxbuz6V9sC0wAsg==
X-Received: by 2002:ac8:1c6:: with SMTP id b6mr14579275qtg.221.1633115282336;
        Fri, 01 Oct 2021 12:08:02 -0700 (PDT)
Message-ID: <9c69a0cdbdfe6f29cd295802e13df46509abd5bb.camel@gmail.com>
Subject: Re: [PATCH 1/1] x86: centralize default APIC id definition
From: Alex Olson <this.is.a0lson@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>,  Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <iwj@xenproject.org>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@citrix.com>, Alex Olson <alex.olson@starlab.io>,
 xen-devel@lists.xenproject.org
Date: Fri, 01 Oct 2021 14:07:59 -0500
In-Reply-To: <5464f556-4932-ee6b-b98c-78ad1bc6bdce@citrix.com>
References: <cover.1632512149.git.this.is.a0lson@gmail.com>
	 <85b59046315b8a84afa8538aacdea92b19200faa.1632512149.git.this.is.a0lson@gmail.com>
	 <d899b058-a201-e2f8-35d2-f0e59ab4bab3@suse.com>
	 <d63a0e7d-7f9d-0dcb-0ac9-8995e56698b4@citrix.com>
	 <2ff385c7-55bd-4647-efb5-9909addca226@suse.com>
	 <5464f556-4932-ee6b-b98c-78ad1bc6bdce@citrix.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

I hadn't seriously considered the scenario of VM migration from older
Xen versions,  but If I understand Andrew's last statement correctly,
it sounds like my patch will break things in new ways that cannot be
fixed at this time. If that is the case, I'll abandon my efforts with
this patch. 

Thank you for the reviews and detailed feedback,

-Alex

On Fri, 2021-10-01 at 18:38 +0100, Andrew Cooper wrote:
> On 01/10/2021 16:08, Juergen Gross wrote:
> > On 01.10.21 16:29, Andrew Cooper wrote:
> > > On 01/10/2021 15:19, Jan Beulich wrote:
> > > > On 24.09.2021 21:39, Alex Olson wrote:
> > > > > Inspired by an earlier attempt by Chao Gao <
> > > > > chao.gao@intel.com>,
> > > > > this revision aims to put the hypervisor in control of x86
> > > > > APIC
> > > > > identifier
> > > > > definition instead of hard-coding a formula in multiple
> > > > > places
> > > > > (libxl, hvmloader, hypervisor).
> > > > > 
> > > > > This is intended as a first step toward exposing/altering CPU
> > > > > topology
> > > > > seen by guests.
> > > > > 
> > > > > Changes:
> > > > > 
> > > > > - Add field to vlapic for holding default ID (on reset)
> > > > > 
> > > > > - add HVMOP_get_vcpu_topology_id hypercall so libxl (for PVH
> > > > > domains)
> > > > >    can access APIC ids needed for ACPI table definition prior
> > > > > to
> > > > > domain start.
> > > > > 
> > > > > - For HVM guests, hvmloader now also uses the same hypercall.
> > > > > 
> > > > > - Make CPUID code use vlapic ID instead of hard-coded formula
> > > > >    for runtime reporting to guests
> > > > I'm afraid a primary question from back at the time remains:
> > > > How is
> > > > migration of a guest from an old hypervisor to one with this
> > > > change
> > > > in place going to work?
> > > 
> > > I'm afraid its not.
> > > 
> > > Fixing this is incredibly complicated.  I have a vague plan, but
> > > it
> > > needs building on the still-pending libxl cpuid work of Rogers.
> > > 
> > > Both the toolstack and Xen need to learn about how to describe
> > > topology
> > > correctly (and I'm afraid this patch isn't correct even for a
> > > number of
> > > the simple cases), and know about "every VM booted up until this
> > > point
> > > in time" being wrong.
> > 
> > What about:
> > 
> > - adding APIC-Id to the migration stream
> > - adding an optional translation layer for guest APIC-Id to the
> >   hypervisor
> > - adding the functionality to set a specific APIC-Id for a vcpu
> >   (will use the translation layer if not the same as preferred
> >   by the hypervisor)
> 
> The vCPU APIC IDs are already in the migration stream.  They're just
> too
> late in the stream for any easy fixup.
> 
> A second problem we have is that (x)APIC IDs are writeable under Xen,
> but writeability of the register is a model specific trait to being
> with.  Furthermore, you get potentially differing behaviour depending
> on
> whether APICV is enabled or not.  I plan to fix this by simply
> outlawing
> it - OSes don't renumber the APICs in the first place (just like they
> don't move the MMIO window), and all they'll do is break things.
> 
> The main topology problem is that we have no interlink between the
> CPUID-described data, and the default APIC IDs chosen.  There are 5
> different algorithms to choose from (vendor and CPU dependent) and we
> implement 0 of them.
> 
> The xl config file needs more than just cpuid= data to express the
> topology correctly, because for non-power-of-two systems, there need
> to
> be gaps in the APIC_ID space, and this needs communicating to Xen
> too. 
> (For old AMD, we also need a slide, but we can probably leave that as
> an
> exercise to anyone who cares, which seems to be noone so far).
> 
> Either way, when the toolstack can reason about topologies correctly,
> we
> can extend the xl json in the stream.  The absense of the marker
> serves
> as "This VM didn't boot with sane topology", which we can use the
> fallback logic (see libxl__cpuid_legacy() and the soon to exist
> companion in libxc) to re-synthesize the old pattern for when data is
> missing in the stream.
> 
> Any change to the topology algorithms before the toolstack is capable
> of
> doing everything else leaves us with two[1] different kinds of VMs
> that
> we can't tell apart, and cannot cope with in a compatible way.
> 
> ~Andrew
> 
> [1] Actually 3.  XenServer still has a revert of ca2eee92df44 in the
> patchqueue because that broke VMs which migrated across the point. 
> As
> it's from 2008, pre-and-post VMs aren't something we need to care
> about,
> because anyone still running Xen 3.3 has far bigger problems than
> this
> to worry about.
> 


