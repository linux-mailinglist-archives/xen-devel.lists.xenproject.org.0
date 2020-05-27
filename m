Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AC91E4725
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 17:17:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdxnw-00076a-ER; Wed, 27 May 2020 15:17:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ARaW=7J=xen.org=roger@srs-us1.protection.inumbo.net>)
 id 1jdxnu-00076V-SQ
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 15:17:14 +0000
X-Inumbo-ID: 24df156e-a02d-11ea-9947-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24df156e-a02d-11ea-9947-bc764e2007e4;
 Wed, 27 May 2020 15:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pdLVhj5eV1gR37ueruLD3a5quNY9FX/AGMwp0eKrLTQ=; b=nkI73BHwPfHcxUIxAogRiBCRyl
 ugRwNkDUeQPgd4iGDGqR6YFSOe87tBon5w7uWL9ZTkvfdTnafVFPVrd3OrYjIhVshBPbEIRz+2gbd
 WVqc489dy6+aSzUS/xD7hbyBLeOQQe2EoAhFrHAIwerKuJ6SFNtYGVPp2jCgQdoxQmVY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jdxns-0006By-Aq; Wed, 27 May 2020 15:17:12 +0000
Received: from [93.176.191.173] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jdxnr-00033F-W4; Wed, 27 May 2020 15:17:12 +0000
Date: Wed, 27 May 2020 17:17:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86: refine guest_mode()
Message-ID: <20200527151319.GC1195@Air-de-Roger>
References: <16939982-3ccc-f848-0694-61b154dca89a@citrix.com>
 <5ce12c86-c894-4a2c-9fa6-1c2a6007ca28@suse.com>
 <20200518145101.GV54375@Air-de-Roger>
 <d58ec87e-a871-2e65-4a69-b73a168a6afa@suse.com>
 <20200520151326.GM54375@Air-de-Roger>
 <38d546f9-8043-8d94-8298-8fd035078a8a@suse.com>
 <20200522104844.GY54375@Air-de-Roger>
 <a31bd761-54eb-56b8-7c60-93202d26e7d0@suse.com>
 <20200526105652.GD38408@Air-de-Roger>
 <dfa3604a-d53e-ae0c-fe24-099b135b308e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dfa3604a-d53e-ae0c-fe24-099b135b308e@suse.com>
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

On Tue, May 26, 2020 at 03:55:39PM +0200, Jan Beulich wrote:
> On 26.05.2020 12:56, Roger Pau Monné wrote:
> > On Fri, May 22, 2020 at 02:00:22PM +0200, Jan Beulich wrote:
> >> On 22.05.2020 12:48, Roger Pau Monné wrote:
> >>> On Fri, May 22, 2020 at 11:52:42AM +0200, Jan Beulich wrote:
> >>>> On 20.05.2020 17:13, Roger Pau Monné wrote:
> >>>>> OK, so I think I'm starting to understand this all. Sorry it's taken
> >>>>> me so long. So it's my understanding that diff != 0 can only happen in
> >>>>> Xen context, or when in an IST that has a different stack (ie: MCE, NMI
> >>>>> or DF according to current.h) and running in PV mode?
> >>>>>
> >>>>> Wouldn't in then be fine to use (r)->cs & 3 to check we are in guest
> >>>>> mode if diff != 0? I see a lot of other places where cs & 3 is already
> >>>>> used to that effect AFAICT (like entry.S).
> >>>>
> >>>> Technically this would be correct afaics, but the idea with all this
> >>>> is (or should I say "looks to be"?) to have the checks be as tight as
> >>>> possible, to make sure we don't mistakenly consider something "guest
> >>>> mode" which really isn't. IOW your suggestion would be fine with me
> >>>> if we could exclude bugs anywhere in the code. But since this isn't
> >>>> realistic, I consider your suggestion to be relaxing things by too
> >>>> much.
> >>>
> >>> OK, so I take that (long time) we might also want to change the cs & 3
> >>> checks from entry.S to check against __HYPERVISOR_CS explicitly?
> >>
> >> I didn't think so, no (not the least because of there not being any
> >> guarantee afaik that EFI runtime calls couldn't play with segment
> >> registers; they shouldn't, yes, but there's a lot of other "should"
> >> many don't obey to). Those are guaranteed PV-only code paths. The
> >> main issue here is that ->cs cannot be relied upon when a frame
> >> points at HVM state.
> > 
> > Well, if it points at HVM state it could equally have __HYPERVISOR_CS
> > set by the guest.
> 
> No, that's not the point. ->cs will never be __HYPERVISOR_CS in that
> case, as we never store the guest's CS selector there. Instead
> hvm_invalidate_regs_fields() clobbers the field in debug builds (with
> a value resulting in RPL 3), but zero (i.e. a value implying RPL 0)
> remains in place in release builds.
> 
> Instead of doing this clobbering in debug mode only, we could - as I
> think I did suggest before - clobber always, but just once during vCPU
> init rather than on every VM exit. In debug mode we could then instead
> check that the dummy values didn't themselves get clobbered.

It would make sense to clobber it always with a value that has RPL >
0, so that it's consistent with PV state.

> > Will things work anyway if you get here from an exception generated by
> > EFI code that has changed the code segment? You are going to hit the
> > assert at least, since diff will be != 0 and cs != __HYPERVISOR_CS?
> 
> What would guarantee the latter? Additionally they could in principle
> also have switched stacks then, i.e. diff may then also be larger than
> PRIMARY_STACK_SIZE, in which case - with the patch in place - the
> assertion is bypassed altogether.
> 
> > I would prefer to keep things coherent by either using cs & 3 or
> > cs == __HYPERVISOR_CS everywhere if possible, as I'm still unsure of
> > the benefit of using __HYPERVISOR_CS.
> 
> See above.

Well, I think it's an improvement overall, as it allows to properly
handle the case where a PV guest could manage to trigger an exception
that uses a stack different than the primary one.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Roger.

