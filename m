Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358E81AC1A0
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 14:44:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP3sG-0005bj-MZ; Thu, 16 Apr 2020 12:44:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IxKm=6A=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jP3sF-0005bd-42
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 12:44:07 +0000
X-Inumbo-ID: f5245c52-7fdf-11ea-b58d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5245c52-7fdf-11ea-b58d-bc764e2007e4;
 Thu, 16 Apr 2020 12:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587041046;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ikHcH4cEh6j+kdYwyEUkdhRSJ5cLmyLlvVOpIBQon6c=;
 b=MhVWPsFz56x+L6hHEN/DkN05OwQdVykUTwJzIK97I+cCmplmhJXlOkah
 sYWj3JUp/bSOYvbsFggRMWafcbAFjDPv/EJ8+jGa/WxLXWipxGqdA4C+2
 IuZM9o/DxUiAMrunS0T5gUOeyRLHfoSdvPyuUzNFwn8wPV6IkadsxC3kX E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gDc6IXGlsKq6bjl1iT+5J2MWpFL+dDsX8X+cwOLF5FDcY3kir0FF3kUMhedXemcIu0y/I3XCQg
 zrE+T0nnyrKiQ/N3YWGIty/Jzpv7TEDMTm3u8+Q1PpTYqNphUJSjywU25q1vm7MZ6ufaK5YH4W
 LURm+B8jFbEMEFoGAKvAiHZClOew3K/ELGUatHw9KT4/pfxLltxHm6yXrkh2QAAmaAUvlYr9Lj
 D6tBIiEk0zmhwzWHYm/BiXFVLPR1V5xgOS3n7NamIjy1j2hdX9rsMY31IQM4cst+0QAIcp+GET
 hJY=
X-SBRS: 2.7
X-MesageID: 16451258
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,391,1580792400"; d="scan'208";a="16451258"
Date: Thu, 16 Apr 2020 13:44:00 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v4 14/18] xen,symbols: rework file symbols selection
Message-ID: <20200416124400.GG4088@perard.uk.xensource.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-15-anthony.perard@citrix.com>
 <e28fa2b6-89c9-8e87-eaf0-91a3d6f6a62f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e28fa2b6-89c9-8e87-eaf0-91a3d6f6a62f@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 08, 2020 at 02:54:35PM +0200, Jan Beulich wrote:
> On 31.03.2020 12:30, Anthony PERARD wrote:
> > We want to use the same rune to build mm/*/guest_*.o as the one use to
> > build every other *.o object. The consequence it that file symbols that
> > the program ./symbols prefer changes with CONFIG_ENFORCE_UNIQUE_SYMBOLS=y.
> > 
> > (1) Currently we have those two file symbols:
> >     guest_walk.c
> >     guest_walk_2.o
> > (2) with CONFIG_ENFORCE_UNIQUE_SYMBOLS used on guest_walk.c, we will have:
> >     arch/x86/mm/guest_walk.c
> >     guest_walk_2.o
> > 
> > The order in which those symbols are present may be different.
> > 
> > Currently, in case (1) ./symbols chooses the *.o symbol (object file
> > name). But in case (2), may choose the *.c symbol (source file name with
> > path component) if it is first
> > 
> > We want to have ./symbols choose the object file name symbol in both
> > cases.
> 
> I guess the reason for wanting this is somehow connected to the
> statement at the beginning of the description, but I can't seem
> to be able to make the connection.

I'm not sure I can explain it better.

The "object file name" file symbol is used to distinguish between symbols
from all mm/*/guest_* objects. The other file symbol present in those
object is a "source file name without any path component symbol".

But building those objects with the same rune as any other objects, and
having CONFIG_ENFORCE_UNIQUE_SYMBOLS=y, changes the file symbols present
in the resulting object. We still have the "object file name" symbol,
but now we also have "source file name with path components" symbol.
Unfortunately, all mm/*/guest_*.o in one directory are built from the
same source file, and thus have the same "source file name" symbol, but
have different "object file name" symbol. We still want to be able to
distinguish between guest_*.o in one dir, and the only way for that is
to use the "object file name" symbol.

> > So this patch changes that ./symbols prefer the "object file
> > name" symbol over the "source file name with path component" symbols.
> > 
> > The new intended order of preference is:
> >     - first object file name symbol
> >     - first source file name with path components symbol
> >     - last source file name without any path component symbol
> 
> Isn't this going to lead to ambiguities again when
> CONFIG_ENFORCE_UNIQUE_SYMBOLS? Several object files (in different
> dirs) are named the same, after all. Static symbols with the same
> name in such objects would hence resolve to the same kallsyms
> name.

"object file name" symbol are only present in mm/*/guest_*.o objects,
they all have different basenames. There is no ambiguity here.

Thanks,

-- 
Anthony PERARD

