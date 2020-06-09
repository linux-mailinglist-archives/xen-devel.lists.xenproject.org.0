Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 608421F3A7D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 14:16:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jidAX-0001wG-CW; Tue, 09 Jun 2020 12:15:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Iy+z=7W=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1jidAW-0001wB-TH
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 12:15:52 +0000
X-Inumbo-ID: f5dec7e6-aa4a-11ea-bb8b-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5dec7e6-aa4a-11ea-bb8b-bc764e2007e4;
 Tue, 09 Jun 2020 12:15:52 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1jidAT-000Mji-8w; Tue, 09 Jun 2020 12:15:49 +0000
Date: Tue, 9 Jun 2020 13:15:49 +0100
From: Tim Deegan <tim@xen.org>
To: paul@xen.org
Subject: Re: [PATCH v1] kdd: remove zero-length arrays
Message-ID: <20200609121549.GA90841@deinos.phlegethon.org>
References: <20200608203849.18341-1-olaf@aepfle.de>
 <005001d63e3b$c85059f0$58f10dd0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <005001d63e3b$c85059f0$58f10dd0$@xen.org>
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
Cc: xen-devel@lists.xenproject.org, 'Olaf Hering' <olaf@aepfle.de>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

At 09:55 +0100 on 09 Jun (1591696552), Paul Durrant wrote:
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Olaf Hering
> > Sent: 08 June 2020 21:39
> > To: xen-devel@lists.xenproject.org
> > Cc: Ian Jackson <ian.jackson@eu.citrix.com>; Olaf Hering <olaf@aepfle.de>; Tim Deegan <tim@xen.org>;
> > Wei Liu <wl@xen.org>
> > Subject: [PATCH v1] kdd: remove zero-length arrays
> > 
> > Struct 'kdd_hdr' already has a member named 'payload[]' to easily
> > refer to the data after the header.  Remove the payload member from
> > 'kdd_pkt' and always use 'kdd_hdr' to fix the following compile error:
> 
> Is it not sufficient to just change the declaration of payload in kdd_pkt from [0] to []? In fact I can't see any use of the payload
> field in kdd_hdr so it looks like that is the one that ought to be dropped.

Yes, if one of these has to go, it should be the one in the header,
since it's not used and the one in the packet is neatly in the union
with the other decriptions of the packet payload.

I'm not currently in a position to test patches, but might be later in
the week.  Olaf, can you try dropping the 'payload' field from the
header and replacing the payload[0] in pkt with payload[] ?

Cheers,

Tim.

