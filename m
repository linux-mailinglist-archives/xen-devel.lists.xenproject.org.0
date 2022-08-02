Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECDF587CF9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 15:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379304.612640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIrpN-0001Gw-DX; Tue, 02 Aug 2022 13:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379304.612640; Tue, 02 Aug 2022 13:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIrpN-0001Et-Aq; Tue, 02 Aug 2022 13:20:53 +0000
Received: by outflank-mailman (input) for mailman id 379304;
 Tue, 02 Aug 2022 13:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPpP=YG=citrix.com=prvs=206784369=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oIrpM-0001En-Mj
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 13:20:52 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec4401d6-1265-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 15:20:50 +0200 (CEST)
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
X-Inumbo-ID: ec4401d6-1265-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659446450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gsqV/QACjx0v25R8gJdUnAjBJQ0Vt5rADqB7xDJ3Obs=;
  b=FFSU+8gUpOo3pUTy3bIT+1A1QKXd+3u8HuuAquUv+AGkc7mCEwR8ILmh
   2S+EZ4PYnHb/X4gINT4kkPqPVVb1MVBA5drYBafAun3L+vpvmDM3cGmHV
   uNpK73IpqT3eaQoZUZ1chxfJKTnL+sLDl+YltSgB2tHC/6DXNA4TR/Iip
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 79733339
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OZYWoq0+w7V+bPRl3fbD5RVxkn2cJEfYwER7XKvMYLTBsI5bp2dVn
 GAXXDrVPfmOazP9KNp2Pomy9UlX7ZOBx9U3SFFlpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQTNNwJcaDpOsfrT8Ek355wehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj68tjPW9pbdVfxtR+PW51x
 /o8LhQBVinW0opawJrjIgVtrsEqLc2tN4IDoHBwizreCJ7KQ7iaHf+Mv4UBmm5t2IYeRp4yZ
 OJAAdZrRB3Gfx1IPEZREJ8klf2krnL+bydZuBSeoq9fD237k10ui+O2a4u9ltqiSMgJsmWg+
 EX/3kvlKAEkLYOG5SC52yf57gPItXyiA99DfFGizdZugVeNx3ZWDBwNSXOhrPW5g1L4UNVaQ
 2QT/icttqE0+FacUsjmXxa4rXiHuTYRQ9NVVeY97Wmlwa3R5geFGmUeVRZRZdo+rsg0SDc2k
 FiTkLvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyKkxkxbOQ9BLAKOzyNrvFlnYx
 iiQrTY5lbM7l8MH16ynu1vAhlqEoZzETRUp9x7Xdm2g5wJ9IoWiYuSVBUPztKgaatzDFx/Y4
 SZCy5P2AP0y4Y+lqiG8brpdRPaV1f+5Pwbuh3ppO5UZzmH4k5K8Rry88A2SNW8wbJtVJWe0O
 RKJ0e9CzMQNZSX3NMebd6r0Up13lva4SLwJQ9iONrJzjo5NmBhrFc2ETWqZxCjTnUclisnT0
 r/LIJ/3XR725UmKpQdaptvxMpdxn0jSPUuJGfjGI+2PiNJzpBe9EN/pymemYOEj97+jqw7I6
 dtZPMbi40wBDbylPXiPqNVCfAliwZ0H6Xfe8pU/SwJ+ClA+RDFJ5wH5m9vNhLCJb4wKz7yVr
 xlRq2dTyUblhG2vFDhnqxlLNtvSYHqIhStrYHZ9Ygn3hyZLjETGxP53SqbbtIIPrIRLpcOYh
 dFcEylcKpyjkgj6xgk=
IronPort-HdrOrdr: A9a23:t3OKw6E/MMVCQaCppLqE0MeALOsnbusQ8zAXP0AYc31om+ij5q
 eTdZMgpHnJYVcqKRUdcL+7VJVoLUmyyXcx2/hpAV7AZniChILLFvAA0WKK+VSJcEeSygce79
 YDT0EXMqyJMbEQt6bHCWeDfeod/A==
X-IronPort-AV: E=Sophos;i="5.93,211,1654574400"; 
   d="scan'208";a="79733339"
Date: Tue, 2 Aug 2022 14:20:40 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Michal =?iso-8859-1?B?UHLtdm96bu1r?= <mprivozn@redhat.com>, "Oleksandr
 Tyshchenko" <olekstysh@gmail.com>, <xen-devel@lists.xenproject.org>,
	<libvir-list@redhat.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, "committers@xenproject.org"
	<committers@xenproject.org>
Subject: Re: [libvirt PATCH] libxl: Fix build with recent Xen that introduces
 new disk backend type
Message-ID: <YukkqFxKAIPxVe7l@perard.uk.xensource.com>
References: <20220729155024.3327364-1-olekstysh@gmail.com>
 <d29b2ad1-fa32-4897-a113-c8a0864c6630@redhat.com>
 <7444eeec-5a7c-6a18-ffde-cb32528a0e20@xen.org>
 <8947085c-bcc4-e599-0636-3a7f1f7b9ac6@redhat.com>
 <793186ea-11de-7ce6-9866-7d4c1336ca02@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <793186ea-11de-7ce6-9866-7d4c1336ca02@xen.org>

On Mon, Aug 01, 2022 at 06:04:38PM +0100, Julien Grall wrote:
> On 01/08/2022 11:08, Michal Prívozník wrote:
> > BTW: every other package that does switch() over libxl_disk_backend enum
> > will need this fix.
> 
> Indeed. From my understanding, there is an expectation that tools built on
> top of libxl may need some update to work on the latest Xen. I will let
> Anthony (one of the tools maintainers to confirm).

Actually, if an application defines LIBXL_API_VERSION, like libvirt
does, we expect the application to still build against the latest
version of libxl. But I don't think that should prevent us from adding
new enum values.

Cheers,

-- 
Anthony PERARD

