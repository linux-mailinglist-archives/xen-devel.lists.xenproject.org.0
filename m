Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114B8213FB0
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 20:55:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrQq0-0005DJ-4V; Fri, 03 Jul 2020 18:55:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/qb=AO=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1jrQpy-0005DE-Sa
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 18:55:02 +0000
X-Inumbo-ID: b2f5db14-bd5e-11ea-8496-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2f5db14-bd5e-11ea-8496-bc764e2007e4;
 Fri, 03 Jul 2020 18:55:02 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1jrQpt-000IZp-GB; Fri, 03 Jul 2020 18:54:57 +0000
Date: Fri, 3 Jul 2020 19:54:57 +0100
From: Tim Deegan <tim@xen.org>
To: Michael Young <m.a.young@durham.ac.uk>
Subject: Re: Build problems in kdd.c with xen-4.14.0-rc4
Message-ID: <20200703185457.GA71229@deinos.phlegethon.org>
References: <alpine.LFD.2.22.394.2006302259370.2894@austen3.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.22.394.2006302259370.2894@austen3.home>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Michael,

Thanks for ther report!

At 23:21 +0100 on 30 Jun (1593559296), Michael Young wrote:
> I get the following errors when trying to build xen-4.14.0-rc4
> 
> kdd.c: In function 'kdd_tx':
> kdd.c:754:15: error: array subscript 16 is above array bounds of 'uint8_t[16]' {aka 'unsigned char[16]'} [-Werror=array-bounds]
>    754 |         s->txb[len++] = 0xaa;
>        |         ~~~~~~^~~~~~~
> kdd.c:82:17: note: while referencing 'txb'
>     82 |         uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
>        |                 ^~~
> kdd.c: In function 'kdd_break':
> kdd.c:819:19: error: array subscript 16 is above array bounds of 'uint8_t[16]' {aka 'unsigned char[16]'} [-Werror=array-bounds]

Oh dear.  The fix for the last kdd bug seems to have gone wrong
somewhere.  The patch I posted has:

-        uint8_t txb[sizeof (kdd_hdr) + 65536];   /* Marshalling area for tx */
+        uint8_t txb[sizeof (kdd_pkt)];           /* Marshalling area for tx */

but as applied in master it's:

-        uint8_t txb[sizeof (kdd_hdr) + 65536];   /* Marshalling area for tx */
+        uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */

i.e. the marshalling area is only large enough for a header and GCC
is correctly complaining about that.

Wei, it looks like you committed this patch - can you figure out what
happened to it please?

Cheers,

Tim.

