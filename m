Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51896F86F8
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 18:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530527.826202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puyY4-0002QB-6r; Fri, 05 May 2023 16:44:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530527.826202; Fri, 05 May 2023 16:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puyY4-0002Nb-46; Fri, 05 May 2023 16:44:48 +0000
Received: by outflank-mailman (input) for mailman id 530527;
 Fri, 05 May 2023 16:44:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fp4m=A2=citrix.com=prvs=4826eee3f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1puyY2-0002NV-BC
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 16:44:46 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22aa0459-eb64-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 18:44:44 +0200 (CEST)
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
X-Inumbo-ID: 22aa0459-eb64-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683305084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OEtTTua7UCQiOx6mgjVmEFb8W/Gl1MOESQKAg0KNS0k=;
  b=NEKDr5Y0xpZdGge37xAK9TJ2UdZCqIV9O9fYTxUirjXTYKila5dIxB8K
   QIET8e0F/Xe3/wlar0+hNrMDbLQIeMWE3RrSQnOFUQDY5MHuWNi6NhMZB
   LPjiDSdB04VmgSatIM0xVwhtXJ2XNOpTvkvRbWzJsutFhhOrFXK2Ydemw
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108049361
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:NSJfuKJ7iMxDYyKLFE+RW5UlxSXFcZb7ZxGr2PjKsXjdYENSgjUFm
 2sYDGqEPPmLazajfNwnOoTg/EhQvpbdyt8ySQFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wRjPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5UPVpz+
 6Q4MAtVVSiqhLKPmombE+hz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHZUNwhfD+
 DuuE2LRWAsqK9DH8H28qlWI19TsuQn2W4YfLejtnhJtqALKnTFCYPEMbnOfvPKwzGC3XdlSL
 0gJ0iM0qO4580nDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpQtE8qNU/QzBs8
 1aThs7oHhRmqrjTQnWYnp+roDL0EigYK0cLfypCRgwAi/H5p5o5lBXITdBLH6u8j9mzEjb1q
 xiVqAAuirNVitQEv4258krAmCmEvYXSQ0g+4QC/dm6s8A5RfoOuYI2sr1/B4p5oKY+DS1Cbs
 Xssms6A7fsPB5WAiCyMRuoWGLijof2CNVX0iEZiBZA7+xyx+nSoesZb5zQWGatyGp9aI3mzO
 haV4F4PosYJZxNGcJObfaqSN/8Xw/DADe+9bcj9bYp3OKNRLQ6YqXQGiVGr44z9rKQ9ufhha
 czBLJf1VCly5bdPl2TvGbpEuVM/7mVnnD6IG8imp/iy+eDGDEN5X4vpJ7dnggoRyKqf6DvY/
 N9EXydh40UOCbauCsU7HGN6ELzrEZTYLcqswyCvXrTfSjeK4Ul4YxMr/ZsvepZ+g4NenfrS8
 3e2VydwkQSv3iedd1nTOyg4N9sDuKpCQY8TZ3RwbT5EJVB6CWpQ0EvvX8RuJuR2nACS5fV1U
 +MEa629Pxi7cRyeo251RcCk/ORfmOGD2Vrm09yNPGJuIPaNhmXhprfZQ+cY3HBRVXHo6ZFu/
 eXIO8GyacNrejmOxf3+MJqHp25dd1BE8A6udyMk+uVuRXg=
IronPort-HdrOrdr: A9a23:LOrwYqzUT4C4KCnOLoeWKrPw8b1zdoMgy1knxilNoH1uA6+lfq
 WV98jzuiWYtN98Yh0dcKm7SdW9qBDnlaKdg7N+AV74ZniFhILAFugLh7cKqAeAJ8SRzIFgPK
 1bAs1D4PqZNykc/KCKmXjBL/8QhPqi+KCsify29QYWcegTUdAa0++mYjzrdnGffGF9dOcE/T
 Gnl7V6mwY=
X-Talos-CUID: 9a23:Mz2+MWFmjkMcnR+AqmJEyHUpFJgFakaF90/5IB+BU11JEbyKHAo=
X-Talos-MUID: 9a23:j5hMjQlmjXlt8DEG+F1Gdno4Lvd37/yXT3lVtrFXgOqgHyFzPzqk2WE=
X-IronPort-AV: E=Sophos;i="5.99,252,1677560400"; 
   d="scan'208";a="108049361"
Date: Fri, 5 May 2023 17:44:37 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Marek
 =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: Re: [PATCH v6 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Message-ID: <9a0398b9-5b59-47aa-af34-a41133dc9e70@perard>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-10-luca.fancellu@arm.com>
 <4e6758c0-dd81-4963-8989-d941eba2b257@perard>
 <34A79CE8-FEE8-426B-810C-1E928E207724@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34A79CE8-FEE8-426B-810C-1E928E207724@arm.com>

On Wed, May 03, 2023 at 09:23:19AM +0000, Luca Fancellu wrote:
> 
> 
> > On 2 May 2023, at 17:13, Anthony PERARD <anthony.perard@citrix.com> wrote:
> > 
> > On Mon, Apr 24, 2023 at 07:02:45AM +0100, Luca Fancellu wrote:
> >> diff --git a/tools/include/xen-tools/arm-arch-capabilities.h b/tools/include/xen-tools/arm-arch-capabilities.h
> >> new file mode 100644
> >> index 000000000000..ac44c8b14344
> >> --- /dev/null
> >> +++ b/tools/include/xen-tools/arm-arch-capabilities.h
> >> @@ -0,0 +1,28 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> > 
> > Do you mean GPL-2.0-only ?
> > 
> > GPL-2.0 is deprecated by the SPDX project.
> > 
> > https://spdx.org/licenses/GPL-2.0.html
> > 
> > 
> > Besides that, patch looks fine:
> > Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Thanks, I’ll fix in the next push and I’ll add your R-by

Actually, could you use LGPL-2.1-only instead. As this code is to be
included in libxl, and libxl is supposed to be LGPL-2.1-only, it might
be better to be on the safe side and use LGPL for this new file.

As I understand (from recent discussion about libacpi, and a quick search
only), mixing GPL and LGPL code might mean the result is GPL. So just to
be on the safe side, have this file been LGPL might be better. And it
seems that it would still be fine to include that file in GPL projects.

Would that be ok with you?

Cheers,

-- 
Anthony PERARD

