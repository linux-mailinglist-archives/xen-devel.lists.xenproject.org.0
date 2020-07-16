Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8136221E04
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 10:16:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvz2u-0002mH-NK; Thu, 16 Jul 2020 08:15:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOKz=A3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvz2s-0002mC-Dv
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 08:15:10 +0000
X-Inumbo-ID: 75a9636c-c73c-11ea-948b-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75a9636c-c73c-11ea-948b-12813bfff9fa;
 Thu, 16 Jul 2020 08:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594887309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QM4Yo08UU96sEkO/vwoDacKsS3qDPIvblp+LQRxpJLU=;
 b=LGUT0qXBIWPvBbeZ7F7SZtECSYNhazYozEfqU6ehEoOIZqrnW4EY7IKY
 GXX6DH0NTZVxAn3OtfoCxo5ToZZTpbA56nmMtcZB9a1A/hkBTiYxWCyII
 mPeAr86xRft0WnSZYYy2t+bBJkqG8ZM4BMfYUCnaIVMbl6UtA3sc5DXhD o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HN64iurN4tvosFYXRllUbPa5w9feraQzTUBYr1ZVlWnGsKrnMNqR/bp36R+16yGXaR2ppMWY4Z
 WF7GXvBFhj0fxHM6v864cbmJH32YTM+AZ4gFVCSLctj7N/EdoifqUmZbvwRJvDQZIfCQY/mb/R
 pfHVY+qEqTPBr1fmmLgvMhCG1QI07EBRWjIaEY5xvYVMOTeB5I+qRba3NWnXb92Jy5zImLcQms
 va7mgP9Us6S1TOPpjnmIHWxkAvQTLvdcNu/zzMu1a+14qaPzCf34RLwKxMOZ+z7wyWOX6LXqux
 jUQ=
X-SBRS: 2.7
X-MesageID: 23353559
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,358,1589256000"; d="scan'208";a="23353559"
Date: Thu, 16 Jul 2020 10:14:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v6 01/11] memory: batch processing in acquire_resource()
Message-ID: <20200716081455.GH7191@Air-de-Roger>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <02415890e4e8211513b495228c790e1d16de767f.1594150543.git.michal.leszczynski@cert.pl>
 <20200715093606.GU7191@Air-de-Roger>
 <61828142-8135-deee-43c6-1a2124f55756@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61828142-8135-deee-43c6-1a2124f55756@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 tamas.lengyel@intel.com, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 02:13:42PM +0200, Jan Beulich wrote:
> On 15.07.2020 11:36, Roger Pau Monné wrote:
> > On Tue, Jul 07, 2020 at 09:39:40PM +0200, Michał Leszczyński wrote:
> >> @@ -1599,8 +1629,17 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>  #endif
> >>  
> >>      case XENMEM_acquire_resource:
> >> -        rc = acquire_resource(
> >> -            guest_handle_cast(arg, xen_mem_acquire_resource_t));
> >> +        do {
> >> +            rc = acquire_resource(
> >> +                guest_handle_cast(arg, xen_mem_acquire_resource_t),
> >> +                &start_extent);
> > 
> > I think it would be interesting from a performance PoV to move the
> > xmar copy_from_guest here, so that each call to acquire_resource
> > in the loop doesn't need to perform a copy from guest. That's
> > more relevant for translated callers, where a copy_from_guest involves
> > a guest page table and a p2m walk.
> 
> This isn't just a nice-to-have for performance reasons, but a
> correctness/consistency thing: A rogue (or buggy) guest may alter
> the structure between two such reads. It _may_ be the case that
> we're dealing fine with this right now, but it would feel like a
> trap to fall into later on.

I *think* this is safe, given you copy from guest and perform the
checks for each iteration. I agree the copy should be pulled out of
the loop together with the checks. There's no point in performing it
for every iteration.

> >> +
> >> +            if ( hypercall_preempt_check() )
> > 
> > You are missing a rc == -ERESTART check here, you don't want to encode
> > a continuation if rc is different than -ERESTART AFAICT.
> 
> At which point the subsequent containing do/while() likely wants
> adjusting to, e.g. to "for( ; ; )".

That's another option, but you would need to add an extra
if ( rc != -ERESTART ) break; to the loop body if the while condition
is removed.

Roger.

