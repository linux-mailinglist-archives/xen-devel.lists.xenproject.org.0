Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E892D5E9E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 15:51:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49388.87337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNHW-0007N7-Up; Thu, 10 Dec 2020 14:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49388.87337; Thu, 10 Dec 2020 14:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNHW-0007Mi-RZ; Thu, 10 Dec 2020 14:50:58 +0000
Received: by outflank-mailman (input) for mailman id 49388;
 Thu, 10 Dec 2020 14:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hBiL=FO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1knNHU-0007Md-NO
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 14:50:56 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8bb974b-d1b8-42fd-9206-3c405fce51d5;
 Thu, 10 Dec 2020 14:50:55 +0000 (UTC)
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
X-Inumbo-ID: d8bb974b-d1b8-42fd-9206-3c405fce51d5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607611855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d7yW/0Easa2rv+HhhDpJy1/8GG46cCAThpfClkI+EHw=;
  b=VIXqJLWJoZSemNIuoUD+8nVN2CV+mzgRDPkYA6UtEMdJlk07TKaiLMBi
   cdCR13ShyH1ZPrrnG9jPQg1pHHLMtZuqKR8aLj6Rj/jTLSUA3DUKVC9kD
   +ma0bd0VXJhgOFRYFtbno9tkJYUeX10cRSDQJCxegvyrAApVtBz/14BHx
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CyonRS18s9UGpcznotCRZLAvitXpCNJaykJIKrX+QsixWhv0V2yVGRL2M8J18dNURP6LOwflAj
 YMXuKABLAt5No4z4enY7u+eu9BYcIUZZlFW/BLnpXtA5Ovdz/84uhbetlBuY2uj5wyk/R51x2Q
 qp4vwww6Ir7IpHLA9KVeAGEW/OglpSP12N3IQ7+UG5OkXNGiZiV6yqxP3lHdj1ZR3sqgPsLHTM
 HxWcq/Z9l8dITZblHkz0WFZ+hLN9DmjUIvoHV902yzYMHTOfsHB6uHKY1RI/GjgWhRFrHXK7E/
 gec=
X-SBRS: 5.2
X-MesageID: 33295570
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,408,1599537600"; 
   d="scan'208";a="33295570"
Date: Thu, 10 Dec 2020 14:50:51 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v3 1/8] xen: fix build when $(obj-y) consists of just
 blanks
Message-ID: <X9I1yxNbWD83F+58@perard.uk.xensource.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <511be84d-9a13-17ae-f3d9-d6daf9c02711@suse.com>
 <X9EL90SMyqrs9GaL@perard.uk.xensource.com>
 <50fc5143-5b5e-46ae-56a3-6eba2707f293@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <50fc5143-5b5e-46ae-56a3-6eba2707f293@suse.com>

On Thu, Dec 10, 2020 at 11:21:53AM +0100, Jan Beulich wrote:
> On 09.12.2020 18:40, Anthony PERARD wrote:
> > How about using $(XEN_CFLAGS) instead of $(c_flags)? That should prevent
> > CC from generating the .*.o.d files while keeping the relevant flags.
> 
> What does "relevant" cover? For an empty .o it may not be important
> right now, but I could see
> 
> c_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_CFLAGS) '-D__OBJECT_FILE__="$@"'
> a_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_AFLAGS)
> 
> include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
> 
> c_flags += $(CFLAGS-y)
> a_flags += $(CFLAGS-y) $(AFLAGS-y)
> 
> leading to CFLAGS-y / AFLAGS-y which need to be consistent across
> _all_ object files (e.g. some recording of ABI used).
> 
> > Do we need to worry about having a object file been listed twice?
> > Wouldn't that be a mistake?
> 
> No. The list approach (obj-$(CONFIG_xyz) += ...) easily allows for
> this to happen. See xen/arch/x86/mm/Makefile for an existing example.


Sounds good,
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

