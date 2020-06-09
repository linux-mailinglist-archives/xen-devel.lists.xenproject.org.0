Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C831F37FC
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 12:23:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jibPH-0006cd-1f; Tue, 09 Jun 2020 10:22:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SYwg=7W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jibPF-0006cX-Ds
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 10:22:57 +0000
X-Inumbo-ID: 2ef3bc18-aa3b-11ea-b301-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ef3bc18-aa3b-11ea-b301-12813bfff9fa;
 Tue, 09 Jun 2020 10:22:56 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EOsWrPTebEbtU0to4SChpf/HjOT3LEn6GUXRBVPWbATRtwthm1Jt+84v/uQlmtmaZHspttUBER
 x2HfHuNr9hwhzcJ6S4r8BRrVeaUvLp6wnec+vOGcaY4TBSgK3ZfHO7vUEyTILH78v1W3PpAsi8
 vEgrf7EcBi0Xz73UzIXX/pEjQYmLRu55vS6Po5Z4diTeeOiaoxjMnxtbxyVHjgGLxurArb6hrG
 JNTjlhYxWCbIWlpZF6wZb0NSrphk0I/191MJtP65ugcQwOr6BxbAgKSk77/ZxQucDVgQ0/hy6t
 VQw=
X-SBRS: 2.7
X-MesageID: 20318778
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,491,1583211600"; d="scan'208";a="20318778"
Subject: Re: XENMAPSPACE_grant_table vs. GNTTABOP_setup_table
To: Martin Lucina <martin@lucina.net>, <xen-devel@lists.xenproject.org>,
 <mirageos-devel@lists.xenproject.org>
References: <20200609094425.GB9734@nodbug.lucina.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3c7269b9-bf3f-5359-6ce2-049f935c8e84@citrix.com>
Date: Tue, 9 Jun 2020 11:22:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609094425.GB9734@nodbug.lucina.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09/06/2020 10:44, Martin Lucina wrote:
> Hi,
>
> I've been making progress on bootstrapping a new, PVHv2 only, Xen platform
> stack for MirageOS [1]. The basics are now functional and I have started to
> re-implement the grant table code.
>
> After studying both the Mini-OS and Linux implementations some, I don't
> understand the difference between using XENMAPSPACE_grant_table vs.
> GNTTABOP_setup_table to set up the initial grant table mapping for the
> guest.
>
> Are these calls just newer and older ways of accomplishing the same thing?
> The Linux driver seems to use both in various conditions, whereas Mini-OS
> uses the former on ARM and the latter on x86.
>
> If these are functionally equivalent, then for my purposes I'd rather use
> XENMAPSPACE_setup_table, since IIUC this lets me map the grant table at an
> address of my choosing rather than GNTTABOP_setup_table which at least on
> x86_64 appears to be returning PFNs at the top of the address space.
>
> Any advice much appreciated,

There is a little bit of history here...

GNTTABOP_setup_table was the original PV way of doing things (specify
size as an input, get a list of frames as an output to map), and
XENMAPSPACE_grant_table was the original HVM way of doing things (as
mapping is the other way around - I specify a GFN which I'd like to turn
into a grant table mapping).

When grant v2 came along, it was only XENMAPSPACE_grant_table updated to
be compatible.  i.e. you have to use XENMAPSPACE_grant_table to map the
status frames even if you used GNTTABOP_setup_table previously.

It is a mistake that GNTTABOP_setup_table was usable in HVM guests to
being with.  Returning -1 is necessary to avoid an information leak (the
physical address of the frames making up the grant table) which an HVM
guest shouldn't, and has no use knowing.

An with that note, ARM is extra special because the grant API is
specified to use host physical addresses rather than guest physical (at
least for dom0, for reasons of there generally not being an IOMMU),
which is why it does use the old PV way.

It is all a bit of a mess.

~Andrew

