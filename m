Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CCD2C2993
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 15:28:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36450.68346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khZI3-0004T0-VZ; Tue, 24 Nov 2020 14:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36450.68346; Tue, 24 Nov 2020 14:27:31 +0000
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
	id 1khZI3-0004Sd-S6; Tue, 24 Nov 2020 14:27:31 +0000
Received: by outflank-mailman (input) for mailman id 36450;
 Tue, 24 Nov 2020 14:27:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPq8=E6=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1khZI2-0004SY-Gf
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:27:30 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0ca2d64-7200-483a-a6e0-942f337b96a7;
 Tue, 24 Nov 2020 14:27:28 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AOERIsQ000171
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 15:27:19 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id CFD642E9CAC; Tue, 24 Nov 2020 15:27:13 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=UPq8=E6=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1khZI2-0004SY-Gf
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:27:30 +0000
X-Inumbo-ID: c0ca2d64-7200-483a-a6e0-942f337b96a7
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c0ca2d64-7200-483a-a6e0-942f337b96a7;
	Tue, 24 Nov 2020 14:27:28 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AOERIsQ000171
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 24 Nov 2020 15:27:19 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id CFD642E9CAC; Tue, 24 Nov 2020 15:27:13 +0100 (MET)
Date: Tue, 24 Nov 2020 15:27:13 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201124142713.GM2020@antioche.eu.org>
References: <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
 <20201123113241.GE2520@antioche.eu.org>
 <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
 <20201123143150.GG2520@antioche.eu.org>
 <20201123170610.kzfxvcgkdkvh3ex4@Air-de-Roger>
 <20201123173925.GG4662@antioche.eu.org>
 <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
 <20201124122102.3igsriesou3vl6mu@Air-de-Roger>
 <20201124135948.GL2020@antioche.eu.org>
 <6d6a77cf-58de-4e4d-ed75-e9365be060b7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d6a77cf-58de-4e4d-ed75-e9365be060b7@suse.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Tue, 24 Nov 2020 15:27:20 +0100 (MET)

On Tue, Nov 24, 2020 at 03:09:55PM +0100, Jan Beulich wrote:
> >> [...]
> >>> What we're missing is LAPIC information, since the masked status logged
> >>> is unclear: (-MM) isn't fully matching up with "mask=0". But of course
> >>> the former is just a software representation, while the latter is what
> >>> the RTE holds. IOW for the interrupt to not get delivered, there needs
> >>> to be this or a higher ISR bit set (considering we don't use the TPR),
> >>> or (I think we can pretty much exclude this) we'd need to be running
> >>> with IRQs off for extended periods of time.
> >>
> >> Let's dump the physical lapic(s) IRR and ISR together with the
> >> IO-APIC state. Can you please apply the following patch and use the
> >> 'i' key again? (please keep the previous patch applied)
> > 
> > Done, you'll find the log at
> > http://www-soc.lip6.fr/~bouyer/xen-log6.txt
> 
> Hmm, I can't spot respective output. Are you sure you did this with
> a hypervisor with Roger's latest patch in place?

Ops, sorry I copied xen.gz to the wrong place.
new log at
http://www-soc.lip6.fr/~bouyer/xen-log7.txt

this one ends up in a panic, I hope you'll find what you expect here.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

