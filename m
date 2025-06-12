Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1C3AD7E39
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 00:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013604.1391978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPq6M-00018Q-6f; Thu, 12 Jun 2025 22:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013604.1391978; Thu, 12 Jun 2025 22:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPq6M-00016X-3b; Thu, 12 Jun 2025 22:08:50 +0000
Received: by outflank-mailman (input) for mailman id 1013604;
 Thu, 12 Jun 2025 22:08:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H4xt=Y3=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uPq6J-00016R-FD
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 22:08:48 +0000
Received: from 11.mo561.mail-out.ovh.net (11.mo561.mail-out.ovh.net
 [87.98.184.158]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce80b410-47d9-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 00:08:45 +0200 (CEST)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.17.43])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4bJGrX2zmfz1VJG
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 22:08:44 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-s646q (unknown [10.110.178.131])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 587FC802AD;
 Thu, 12 Jun 2025 22:08:43 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.104])
 by ghost-submission-5b5ff79f4f-s646q with ESMTPSA
 id /81xCOtPS2iSJyoALs7SAA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Thu, 12 Jun 2025 22:08:43 +0000
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
X-Inumbo-ID: ce80b410-47d9-11f0-a309-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-104R00552f3c3cb-35ac-4ffc-9653-035e0927df60,
                    8533DEE15F76005A048BC18D4BF0E94304C9A0EA) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Fri, 13 Jun 2025 01:08:14 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: ross.philipson@oracle.com
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v3 04/22] x86/boot/slaunch-early: implement early
 initialization
Message-ID: <aEtPzrx7EMovvzLh@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <16a544876163afece619d50f80869aaacc9c797c.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5792bec7-cd2f-4d27-aa3b-f417b07c8ea8@oracle.com>
 <aEn_3U3YxdeUXC6p@MjU3Nj>
 <81a3551d-a60c-4aa9-8376-fc5e5550abb1@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81a3551d-a60c-4aa9-8376-fc5e5550abb1@oracle.com>
X-Ovh-Tracer-Id: 5758978023538406556
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduiedvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheeiudgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=wLjn3sax+7ZcrxL8dA07HSKCFrPL7pofictmKqSLwDI=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1749766124; v=1;
 b=YzhY8GiD4r/9qknnfwlFqEltxUJmniqV42rztV7TAa6R+LlHlrdyjUcCpxWDQJPPIVJ4yQuf
 fdx7ntWvVBh9u1Acq5pf7aZ5SJcxjWWhuPOBczHVF5fg72PlRhXqLkZVQ0ziVsoLNZ0m0pCdznG
 O2M+88SJyPGlj3maEfYkTkaKMMgRZYqpnmdqy/yIjPjPMo0hUZDG7QOxvRCBz08e/Zyoq/gkqyK
 N43PMBwyFkw9O/yILXYGiSYB4gHodGpivabZhvIhKucZPwtMWYDtaBVn2Llhbl584ZECKOBvz9g
 7RKzlcLnTlTNuo34x8N6s+cLH8wLiM9zEWJ+48seKnb4Q==

On Thu, Jun 12, 2025 at 09:30:55AM -0700, ross.philipson@oracle.com wrote:
> On 6/11/25 3:14 PM, Sergii Dmytruk wrote:
> > On Tue, Jun 03, 2025 at 09:17:29AM -0700, ross.philipson@oracle.com wrote:
> > > > +void asmlinkage slaunch_early_init(uint32_t load_base_addr,
> > > > +                                   uint32_t tgt_base_addr,
> > > > +                                   uint32_t tgt_end_addr,
> > > > +                                   struct early_init_results *result)
> > > > +{
> > > > +    void *txt_heap;
> > > > +    const struct txt_os_mle_data *os_mle;
> > > > +    const struct slr_table *slrt;
> > > > +    const struct slr_entry_intel_info *intel_info;
> > > > +
> > > > +    txt_heap = txt_init();
> > > > +    os_mle = txt_os_mle_data_start(txt_heap);
> > > > +
> > > > +    result->slrt_pa = os_mle->slrt;
> > > > +    result->mbi_pa = 0;
> > > > +
> > > > +    slrt = (const struct slr_table *)(uintptr_t)os_mle->slrt;
> > > > +
> > > > +    intel_info = (const struct slr_entry_intel_info *)
> > > > +        slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
> > > > +    if ( intel_info == NULL || intel_info->hdr.size != sizeof(*intel_info) )
> > > > +        return;
> > > 
> > > Since these are the x86/TXT bits, it seems at this point, not finding the
> > > TXT info structure would be fatal, no?
> > 
> > It is fatal, but early code doesn't have means for reporting errors
> > nicely, so it just continues.  You think it's better to reboot right
> > away?
> 
> I was trying to track down where you make the first determination that a TXT
> secure launch is supposed to be done. I think it is before this point so if
> that is the case, I think this should be fatal here.

Yes, this code is invoked only if Slaunch is in progress (Xen was
invoked through Slaunch-specific entry point).  Will add rebooting.

Regards

