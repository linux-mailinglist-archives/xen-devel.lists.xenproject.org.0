Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21741E203B
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 12:57:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdXGW-0004f0-4P; Tue, 26 May 2020 10:57:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vX9/=7I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jdXGU-0004ev-GK
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 10:56:58 +0000
X-Inumbo-ID: 9e2f297a-9f3f-11ea-a607-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e2f297a-9f3f-11ea-a607-12813bfff9fa;
 Tue, 26 May 2020 10:56:57 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: n6rV7kdbpNBzv1i57lUk+nppkCEiijrYpKl1OCbGdGTKxgsjUG290z7NYIE1TumiWo3aOyOifJ
 QusDPdZKfVpTwZ30qm0Sesbuxj9fopWvl0FduNTnyQ0ttTrX6dbZoz+6LY80c7Jq3nhuRk6bIC
 scyZsprx6g4XvmUnC/Q5DzPKr7TTbYJtxozGumxfexOC0KlPmftD+zt+J2k2xGqTK/vGUeS7Y5
 HNwVE1x9Zsp04rlvbPBPLkoiGkTxT3NerVTq9Rhgkev6ALMl3sH4ouNJKzbOqkRSENvQ/AFZH0
 apA=
X-SBRS: None
X-MesageID: 19119346
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
Date: Tue, 26 May 2020 12:56:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86: refine guest_mode()
Message-ID: <20200526105652.GD38408@Air-de-Roger>
References: <1704f4f6-7e77-971c-2c94-4f6a6719c34a@citrix.com>
 <5bbe6425-396c-d934-b5af-53b594a4afbc@suse.com>
 <16939982-3ccc-f848-0694-61b154dca89a@citrix.com>
 <5ce12c86-c894-4a2c-9fa6-1c2a6007ca28@suse.com>
 <20200518145101.GV54375@Air-de-Roger>
 <d58ec87e-a871-2e65-4a69-b73a168a6afa@suse.com>
 <20200520151326.GM54375@Air-de-Roger>
 <38d546f9-8043-8d94-8298-8fd035078a8a@suse.com>
 <20200522104844.GY54375@Air-de-Roger>
 <a31bd761-54eb-56b8-7c60-93202d26e7d0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a31bd761-54eb-56b8-7c60-93202d26e7d0@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 22, 2020 at 02:00:22PM +0200, Jan Beulich wrote:
> On 22.05.2020 12:48, Roger Pau Monné wrote:
> > On Fri, May 22, 2020 at 11:52:42AM +0200, Jan Beulich wrote:
> >> On 20.05.2020 17:13, Roger Pau Monné wrote:
> >>> OK, so I think I'm starting to understand this all. Sorry it's taken
> >>> me so long. So it's my understanding that diff != 0 can only happen in
> >>> Xen context, or when in an IST that has a different stack (ie: MCE, NMI
> >>> or DF according to current.h) and running in PV mode?
> >>>
> >>> Wouldn't in then be fine to use (r)->cs & 3 to check we are in guest
> >>> mode if diff != 0? I see a lot of other places where cs & 3 is already
> >>> used to that effect AFAICT (like entry.S).
> >>
> >> Technically this would be correct afaics, but the idea with all this
> >> is (or should I say "looks to be"?) to have the checks be as tight as
> >> possible, to make sure we don't mistakenly consider something "guest
> >> mode" which really isn't. IOW your suggestion would be fine with me
> >> if we could exclude bugs anywhere in the code. But since this isn't
> >> realistic, I consider your suggestion to be relaxing things by too
> >> much.
> > 
> > OK, so I take that (long time) we might also want to change the cs & 3
> > checks from entry.S to check against __HYPERVISOR_CS explicitly?
> 
> I didn't think so, no (not the least because of there not being any
> guarantee afaik that EFI runtime calls couldn't play with segment
> registers; they shouldn't, yes, but there's a lot of other "should"
> many don't obey to). Those are guaranteed PV-only code paths. The
> main issue here is that ->cs cannot be relied upon when a frame
> points at HVM state.

Well, if it points at HVM state it could equally have __HYPERVISOR_CS
set by the guest.

Will things work anyway if you get here from an exception generated by
EFI code that has changed the code segment? You are going to hit the
assert at least, since diff will be != 0 and cs != __HYPERVISOR_CS?

I would prefer to keep things coherent by either using cs & 3 or
cs == __HYPERVISOR_CS everywhere if possible, as I'm still unsure of
the benefit of using __HYPERVISOR_CS.

Thanks, Roger.

