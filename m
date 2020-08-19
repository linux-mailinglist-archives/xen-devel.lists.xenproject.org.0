Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A6B24983C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 10:28:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8JRz-0006Qz-VX; Wed, 19 Aug 2020 08:28:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iHFf=B5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8JRy-0006QT-7z
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 08:28:02 +0000
X-Inumbo-ID: c8a961a9-aeee-48be-b047-91d48416a61a
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8a961a9-aeee-48be-b047-91d48416a61a;
 Wed, 19 Aug 2020 08:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597825680;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IHJws1Z/vQ4P8wz/QijMuRcvBi4IfLjRwdJL9pOxQI0=;
 b=cqjgCwe1cs7p/rPIYKwfbbpKohEWO+4pYYXh4V8pe6G4RdhQlpXFTHUF
 VTSuvWHQjKfjrigaXXnVTALbLOpfUWWCZT5NYKKm0ERm/YkZMtOEjNp5L
 VjmGUX4VaUjLJt/ULx2brzvQtOGfkcABxfTl9Y0Jzx+s9RUk1++9F6Qsj I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: dHzMQLh2vVxpn2sMfShxduxHKk5csYe8yCV8yUsa8z17loZh1LM9oDbIifxc3KHNICrswDE4Bd
 XiVqTCo8BbE2faXqFnQOXdSedz9FbVKlkIuXVcqbLkA4J11TglofQ4GsmI0EjYyOKAMqqFnkYz
 f6l8nUtCt/oUZebxrvg+qa6nNsCkxfa0x5GwqFcmgFb1kw2angowi8pfkpyG1dQCH7TEnVgglw
 vF1S5vYbHHp6QCu6fUhwPCz+Euhqq96yz8mSUyQ03KM2C3LtDdAJMGq+O5E7hP+VeRQI483fHq
 0Qc=
X-SBRS: 2.7
X-MesageID: 25764305
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,330,1592884800"; d="scan'208";a="25764305"
Date: Wed, 19 Aug 2020 10:26:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <paul@xen.org>, 'David Woodhouse' <dwmw2@infradead.org>, 'Paul Durrant'
 <paul.durrant@citrix.com>, <xen-devel@lists.xenproject.org>, 'Eslam Elnikety'
 <elnikety@amazon.de>, 'Andrew Cooper' <andrew.cooper3@citrix.com>, "'Shan
 Haitao'" <haitao.shan@intel.com>
Subject: Re: [Xen-devel] [PATCH v2] x86/hvm: re-work viridian APIC assist code
Message-ID: <20200819082635.GR828@Air-de-Roger>
References: <20180118151059.1336-1-paul.durrant@citrix.com>
 <1535153880.24926.28.camel@infradead.org>
 <7547be305e3ede9edb897e2be898fe54e0b4065c.camel@infradead.org>
 <002d01d67149$37404b00$a5c0e100$@xen.org>
 <20200813094555.GF975@Air-de-Roger>
 <f2aa0cd1-61c9-c788-56fb-b2546feed74b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2aa0cd1-61c9-c788-56fb-b2546feed74b@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Aug 19, 2020 at 09:12:02AM +0200, Jan Beulich wrote:
> On 13.08.2020 11:45, Roger Pau Monné wrote:
> > On Thu, Aug 13, 2020 at 09:10:31AM +0100, Paul Durrant wrote:
> >>> -----Original Message-----
> >>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of David Woodhouse
> >>> Sent: 11 August 2020 14:25
> >>> To: Paul Durrant <paul.durrant@citrix.com>; xen-devel@lists.xenproject.org; Roger Pau Monne
> >>> <roger.pau@citrix.com>
> >>> Cc: Eslam Elnikety <elnikety@amazon.de>; Andrew Cooper <andrew.cooper3@citrix.com>; Shan Haitao
> >>> <haitao.shan@intel.com>; Jan Beulich <jbeulich@suse.com>
> >>> Subject: Re: [Xen-devel] [PATCH v2] x86/hvm: re-work viridian APIC assist code
> >>>
> >>> Resending this straw man patch at Roger's request, to restart discussion.
> >>>
> >>> Redux: In order to cope with the relatively rare case of unmaskable
> >>> legacy MSIs, each vlapic EOI takes a domain-global spinlock just to
> >>> iterate over all IRQs and determine that there's actually nothing to
> >>> do.
> >>>
> >>> In my testing, I observe that this drops Windows performance on passed-
> >>> through NVMe from 2.2M IOPS down to about 1.0M IOPS.
> >>>
> >>> I have a variant of this patch which just has a single per-domain "I
> >>> attached legacy unmaskable MSIs" flag, which is never cleared. The
> >>> patch below is per-vector (but Roger points out it should be per-vCPU
> >>> per-vector). I don't know that we really care enough to do more than
> >>> the single per-domain flag, which in real life would never happen
> >>> anyway unless you have crappy hardware, at which point you get back to
> >>> today's status quo.
> >>>
> >>> My main concern is that this code is fairly sparsely documented and I'm
> >>> only 99% sure that this code path really *is* only for unmaskable MSIs,
> >>> and doesn't have some other esoteric use. A second opinion on that
> >>> would be particularly welcome.
> >>>
> >>
> >> The loop appears to be there to handle the case where multiple
> >> devices assigned to a domain have MSIs programmed with the same
> >> dest/vector... which seems like an odd thing for a guest to do but I
> >> guess it is at liberty to do it. Does it matter whether they are
> >> maskable or not?
> > 
> > Such configuration would never work properly, as lapic vectors are
> > edge triggered and thus can't be safely shared between devices?
> 
> Wait - there are two aspects here: Vectors are difficult to be shared
> on the same CPU (but it's not impossible if the devices and their
> drivers meet certain conditions). But the bitmap gets installed as a
> per-domain rather than a per-vcpu one, and using the same vector on
> different CPUs is definitely possible, as demonstrated by both Xen
> itself as well as Linux.

Yes, that's why I've requested the bitmap to be per-vcpu, but given
the work I'm doing related to interrupt EOI callbacks maybe this won't
be needed.

Thanks, Roger.

