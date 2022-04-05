Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F10A4F3370
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 15:16:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299048.509420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbj2c-00085H-Af; Tue, 05 Apr 2022 13:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299048.509420; Tue, 05 Apr 2022 13:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbj2c-00082b-6z; Tue, 05 Apr 2022 13:16:14 +0000
Received: by outflank-mailman (input) for mailman id 299048;
 Tue, 05 Apr 2022 13:16:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bLbn=UP=citrix.com=prvs=0878235d2=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nbj2a-00082T-Ft
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 13:16:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bae7ad8-b4e2-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 15:16:06 +0200 (CEST)
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
X-Inumbo-ID: 8bae7ad8-b4e2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649164566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vx3U8Q3CZ1RcdfmGM4PEMUIzgrN1MwKaOT7np1Fz3O8=;
  b=DKOYI0bwWfjp7AdCOPKsZfUOmOD/dUT/uTUl9dob7/UKr9FZmghPjW3b
   vQIZMgDG/eTV1TQGfApAwPrc7NFZt6ceo3b8ENHEXgyx2zwboTLdP4DDp
   WwmZIHR1C3xt8FpUNeMiofbRaWTsT01SNXWK9pPxPloXhOraIFQ/m9plO
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67940878
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:S/DKnKOTsFOF/3vvrR1pl8FynXyQoLVcMsEvi/4bfWQNrUoj3zRWn
 2RNDGmFbviCajb2L4h+bYWxo09QupLSm9BnSgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2tMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 uoT5aepE14QYbz8qfs8bwlqUB5yIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQQqeCP
 5pGOVKDajzOPxtDBXIOKK4GxsqmiWblbGZjj3us8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u12bkBhAXMvSPxDzD9Wij7sfKlDn+UZgfF5W58OBrm1yZwmEPCBwQWkC/qPP/gUm7M/pdI
 UEJ/islrYAp6VemCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OctXiAj3
 FKNm9LvBBRsvaeTRHbb8a2bxQ5eIgBMczVEP3VdC1JYvZ+z++nfky4jUP5RL/DltcSvQAiv0
 gC7swkCl4dQssIUgvDTEU/8vxqgoZ3ATwgQ7wrRX3644g4RWLNJd7BE+nCAs68ecd/xok2p+
 SFdxpPAtLxm4YSlznTlfQkbIF2+Cx9p2hX4iEUnIZQu/i/FF5WLLdEJu2EWyKuE3685ld7Vj
 K375Fg5CHx7ZiLCgUpLj2SZUZlCIU/IT4mNaxwsRoASCqWdjSfelM2UWWae3nr2jG8nmrwlN
 JGQfK6EVChGWPw9lGbrG7xBjdfHIxzSI0uJGPgXKDz9j9KjiIO9E+9ZYDNikMhnhE97nOkl2
 4kGbJbbo/mueOb/fjPW4eYuwaMidhAG6WTNg5UPLIare1M+cEl4UqO56e5xKuRNwvUO/s+Vr
 y7VZ6Ot4Aem7ZExAV7RMS4LhXKGdcsXkE/XygR3ZAzyhid6Pdj0hErdHrNuFYQaGCVY5aYcZ
 5E4lw+oX5yjlhyvF+whUKTA
IronPort-HdrOrdr: A9a23:Viu2x6Eu2k+/YZwOpLqE7seALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZMgpHjJYVcqKRQdcL+7VZVoLUmxyXcx2/h2AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IOceEYZmIasS+V2maFL+o=
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="67940878"
Date: Tue, 5 Apr 2022 14:16:00 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
Subject: Re: preparations for 4.14.5 ?
Message-ID: <YkxBEMlXaVrqRdrg@perard.uk.xensource.com>
References: <466e1d4b-a4b6-0797-ca1b-1ea59a3993ba@suse.com>
 <YkcCMg8+dDjxBvJW@mail-itl>
 <d2bf04d9-53e1-6658-a1d7-ca61bae01141@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2bf04d9-53e1-6658-a1d7-ca61bae01141@suse.com>

On Mon, Apr 04, 2022 at 03:42:09PM +0200, Jan Beulich wrote:
> On 01.04.2022 15:46, Marek Marczykowski-Górecki wrote:
> > On Wed, Mar 30, 2022 at 12:16:00PM +0200, Jan Beulich wrote:
> > I'm not sure if "just" bugfix qualify for 4.14 at this point, but if so,
> > I'd propose:
> > 0a20a53df158 tools/libs/light: set video_mem for PVH guests
> > 
> > In any case, the above should be backported to 4.15 and 4.16.
> 
> Hmm, Anthony, I'd like to ask for your view here: This looks more
> like a cosmetic change to me at the first glance. Plus it's a
> little odd to see it being proposed for backporting now, when it's
> already almost 4 months old and hence could have gone into 4.15.2
> and 4.14.4 if it was important.

The patch might be good to backport. I guess that could mess up memory
hotplug a little with PVH guests without the patch.

I've got a few others commits which would be good to backport I think:

e45ad0b1b0 ("xl: Fix global pci options")
d2ecf97f91 ("libxl: Don't segfault on soft-reset failure")
d62a34423a ("libxl: Re-scope qmp_proxy_spawn.ao usage")

Thanks,

-- 
Anthony PERARD

