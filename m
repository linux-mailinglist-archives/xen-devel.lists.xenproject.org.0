Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D60EF1F999E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:07:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkplk-0006hP-4V; Mon, 15 Jun 2020 14:07:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkplj-0006hI-F1
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:07:23 +0000
X-Inumbo-ID: 877fdd64-af11-11ea-b7bb-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 877fdd64-af11-11ea-b7bb-bc764e2007e4;
 Mon, 15 Jun 2020 14:07:22 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: kaEaQlfDnEA6486OL4gyF5vpHFV0EcEVq4roblVPlWPQ0fuNyCzmpUHvv1TYpwYQ7tIeb1hOSV
 RLvG/AR3p/4CxQyClDIZtjGOxycgAjznOygfKzWe3I1EN+cRSDi7rTgnnVhjCjGnVr8+o3Mbyb
 x+VDG+ayVqUKRkVF5+pH3MPjV0Pa/vqWFk1sDjKqWAf0lC6gAPpJiPe6uJpq8lz5AIPkjQW+ct
 AHb/+vBZvzjdEde4RZlIrhJCOI45gyijb9VWzVCYWAXRXXgXBZMeYjQFaU22yE8oy5gYg9o42F
 U34=
X-SBRS: 2.7
X-MesageID: 20363608
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20363608"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24295.32909.686801.47956@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 15:07:09 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: RE: [PATCH] tools/libxengnttab: correct size of allocated memory
In-Reply-To: <00f701d64009$c2c10000$48430000$@xen.org>
References: <20200520083501.31704-1-jgross@suse.com>
 <24261.17303.413916.29534@mariner.uk.xensource.com>
 <20200520155621.GN54375@Air-de-Roger>
 <05eac1e1-63a3-1d03-9f91-d0ffdcc44f23@suse.com>
 <00f701d64009$c2c10000$48430000$@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: =?iso-8859-1?Q?'J=FCrgen_Gro=DF'?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 'Wei Liu' <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("RE: [PATCH] tools/libxengnttab: correct size of allocated memory"):
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jürgen Groß
> > Sent: 11 June 2020 16:26
> > To: Roger Pau Monné <roger.pau@citrix.com>; Ian Jackson <ian.jackson@citrix.com>
> > Cc: xen-devel@lists.xenproject.org; Wei Liu <wl@xen.org>
> > Subject: Re: [PATCH] tools/libxengnttab: correct size of allocated memory
> > 
> > On 20.05.20 17:56, Roger Pau Monné wrote:
> > > On Wed, May 20, 2020 at 03:49:59PM +0100, Ian Jackson wrote:
> > >> Juergen Gross writes ("[PATCH] tools/libxengnttab: correct size of allocated memory"):
> > >>> The size of the memory allocated for the IOCTL_GNTDEV_MAP_GRANT_REF
> > >>> ioctl() parameters is calculated wrong, which results in too much
> > >>> memory allocated.
> > >>
> > >> Added Roger to CC.
> > >>
> > >> Firstly,
> > >>
> > >> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
> > >
> > > For the FreeBSD bits:
> > >
> > > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > Any reason the patch didn't go in yet?
> > 
> 
> I'd be quite happy for this to go in now, consider it
> 
> Release-acked-by: Paul Durrant <paul@xen.org>

Thanks.  I tried to apply this but it doesn't seem to apply to
staging.  Jürgen, would you care to rebase/resend ?

Thanks,
Ian.

