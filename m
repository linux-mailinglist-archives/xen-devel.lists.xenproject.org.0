Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EF018D453
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 17:25:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFKQe-0003hI-PW; Fri, 20 Mar 2020 16:23:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aOFD=5F=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jFKQd-0003hA-2J
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 16:23:23 +0000
X-Inumbo-ID: 1cd9f817-6ac7-11ea-bdbd-12813bfff9fa
Received: from us-smtp-delivery-74.mimecast.com (unknown [216.205.24.74])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1cd9f817-6ac7-11ea-bdbd-12813bfff9fa;
 Fri, 20 Mar 2020 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584721401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awW7pCDqmWK/KSJi6O/6BS9ZZE4mG3U1A4mlWPNdVK8=;
 b=dnUyR998gfXYZYOCqFnmsORoz9OZ+Bd/BJOYYylFtKBEq9gz9SoPCwD+GfdN+Oov5a+Nja
 VhR3XlbOtaGFl8btddRrBumE4djYr+fEW4uGLbvDPskGrtfLFFeXqGEVBbJWYiVlAkIHvH
 cKrWHLfN7+cxZRQ0ZLEzSC3tth7Rov8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-6VVNQMM0PO2NCdl0ZUJc2A-1; Fri, 20 Mar 2020 12:23:20 -0400
X-MC-Unique: 6VVNQMM0PO2NCdl0ZUJc2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30194100550D;
 Fri, 20 Mar 2020 16:23:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ED465C1D8;
 Fri, 20 Mar 2020 16:23:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A4F921138404; Fri, 20 Mar 2020 17:23:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200312085936.9552-1-vsementsov@virtuozzo.com>
 <20200312085936.9552-3-vsementsov@virtuozzo.com>
 <874kuto7hq.fsf@dusky.pond.sub.org>
 <4a70c6ee-10a2-fdc3-f8df-88c05340398b@virtuozzo.com>
 <875zf8gt2m.fsf@dusky.pond.sub.org>
 <7c6f9a91-76cf-242d-8166-0693ec14b24d@virtuozzo.com>
 <87blozex9v.fsf@dusky.pond.sub.org>
 <f9c8de73-38d8-a14c-632a-8e57d18e00c8@virtuozzo.com>
 <87o8swk8wc.fsf@dusky.pond.sub.org>
 <db2fa8a3-48cc-51aa-a3d5-eba88fb29f66@virtuozzo.com>
 <87wo7jqn8m.fsf@dusky.pond.sub.org>
 <c944511d-0a10-0840-258f-8e0bac19eb47@virtuozzo.com>
 <87wo7gd3nb.fsf@dusky.pond.sub.org>
 <d7bc3318-2d39-ce6f-1bd0-4165084458a2@virtuozzo.com>
 <87r1xn2kmf.fsf@dusky.pond.sub.org>
 <28ac8e37-6b43-3755-61d7-41dc2d45ed94@virtuozzo.com>
Date: Fri, 20 Mar 2020 17:23:10 +0100
In-Reply-To: <28ac8e37-6b43-3755-61d7-41dc2d45ed94@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 20 Mar 2020 17:36:06 +0300")
Message-ID: <87sgi3xafl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v9 02/10] scripts: Coccinelle script to use
 ERRP_AUTO_PROPAGATE()
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3
cml0ZXM6Cgo+IDIwLjAzLjIwMjAgMTY6NTgsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+PiBW
bGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdy
aXRlczoKWy4uLl0KPj4+IEkgd2lsbCBub3QgYmUgc3VycHJpc2VkLCBpZiB3ZSBtaXNzZWQgc29t
ZSBtb3JlIGludGVyZXN0aW5nIGNhc2VzIDopCj4+PiBCdXQgd2Ugc2hvdWxkIHByb2NlZWQuIFdo
YXQgaXMgb3VyIHBsYW4/IFdpbGwgeW91IHF1ZXVlIHYxMCBmb3IgNS4xPwo+Pgo+PiB2MTAncyBQ
QVRDSCAxKzIgbG9vayByZWFkeS4gIFRoZSBlcnJvci5oIGNvbW1lbnQgdXBkYXRlIGNvdWxkIHBl
cmhhcHMKPj4gdXNlIHNvbWUgcG9saXNoOyBJJ3ZlIGZvY3VzZWQgbXkgYXR0ZW50aW9uIGVsc2V3
aGVyZS4KPj4KPj4gUEFUQ0ggOC05IGFyZSBnZW5lcmF0ZWQuICBUaGV5IHNob3VsZCBuZXZlciBi
ZSByZWJhc2VkLCBhbHdheXMgYmUKPj4gcmVnZW5lcmF0ZWQuICBXZSBjb21wYXJlIHJlZ2VuZXJh
dGVkIHBhdGNoZXMgdG8gcG9zdGVkIG9uZXMgdG8gbWFrZSBzdXJlCj4+IHRoZXkgYXJlIHN0aWxs
IHNhbmUsIGFuZCB0aGUgUi1ieXMgYXJlIHN0aWxsIHZhbGlkLiAgSSBjYW4gdGFrZSBjYXJlIG9m
Cj4+IHRoZSBjb21wYXJpbmcuCj4+Cj4+IEknZCBsaWtlIHRvIGhhdmUgYSBwdWxsIHJlcXVlc3Qg
cmVhZHkgd2hlbiB0aGUgdHJlZSByZW9wZW5zIGZvciBnZW5lcmFsCj4+IGRldmVsb3BtZW50LiAg
TGV0J3MgdXNlIHRoZSB0aW1lIHVudGlsIHRoZW4gdG8gZ2V0IG1vcmUgZ2VuZXJhdGVkCj4+IHBh
dGNoZXMgb3V0IGZvciByZXZpZXcuCj4+Cj4+IElmIEkgcXVldWUgdXAgcGF0Y2hlcyBpbiBteSB0
cmVlLCB3ZSBzaGlmdCB0aGUgcmVzcG9uc2liaWxpdHkgZm9yCj4+IHJlZ2VuZXJhdGluZyBwYXRj
aGVzIGZyb20geW91IHRvIG1lLCBhbmQgY3JlYXRlIGEgY29vcmRpbmF0aW9uIGlzc3VlOgo+PiB5
b3UnbGwgd2FudCB0byBiYXNlIHBhdGNoIHN1Ym1pc3Npb25zIG9uIHRoZSBicmFuY2ggSSB1c2Ug
dG8gcXVldWUgdGhpcwo+PiB3b3JrLCBhbmQgdGhhdCdzIGdvaW5nIHRvIGJlIGF3a3dhcmQgd2hl
biBJIHJlYmFzZSAvIHJlZ2VuZXJhdGUgdGhhdAo+PiBicmFuY2guICBJIHRoaW5rIGl0J3Mgc2lt
cGxlciB0byBxdWV1ZSB1cCBpbiB5b3VyIHRyZWUgdW50aWwgd2UncmUgcmVhZHkKPj4gZm9yIGEg
cHVsbCByZXF1ZXN0Lgo+Pgo+PiBXaGVuIHlvdSBwb3N0IG1vcmUgcGF0Y2hlcywgdXNlCj4+Cj4+
ICAgICAgQmFzZWQtb246IDwyMDIwMDMxNzE1MTYyNS4yMDc5Ny0xLXZzZW1lbnRzb3ZAdmlydHVv
enpvLmNvbT4KPj4KPj4gc28gdGhhdCBQYXRjaGV3IGFwcGxpZXMgdGhlbSBvbiB0b3Agb2YgdGhp
cyBzZXJpZXMuICBIbW0sIHByb2JhYmx5IHdvbid0Cj4+IGRvLCBhcyBQQVRDSCA5IGFscmVhZHkg
Y29uZmxpY3RzLgo+Pgo+PiBZb3UgY291bGQgaW5zdGVhZCByZXBvc3QgUEFUQ0ggMSsyIHdpdGgg
ZWFjaCBiYXRjaC4gIEkgaG9wZSB0aGF0J3Mgbm90Cj4+IHRvbyBjb25mdXNpbmcuCj4+Cj4+IEkg
dHJ1c3QgeW91J2xsIGtlZXAgcHJvdmlkaW5nIGEgdGFnIHJldmlld2VycyBjYW4gcHVsbC4KPj4K
Pj4gSSBzdWdnZXN0IHRvIGFzayBtYWludGFpbmVycyB0byBsZWF2ZSBtZXJnaW5nIHRoZXNlIHBh
dGNoZXMgdG8gbWUsIGluCj4+IGNvdmVyIGxldHRlcnMuCj4+Cj4+IE1ha2VzIHNlbnNlPwo+Pgo+
Cj4gSG1tLgo+Cj4gSSByZW1lbWJlciB3aGF0IEtldmluIHNhaWQgYWJvdXQgZnJlZXplIHBlcmlv
ZDogbWFpbnRhaW5lcnMgd2lsbCBxdWV1ZQo+IGEgbG90IG9mIHBhdGNoZXMgaW4gdGhlaXIgIm5l
eHQiIGJyYW5jaGVzLCBhbmQgc2VuZCBwdWxsIHJlcXVlc3RzIGF0IHN0YXJ0Cj4gb2YgbmV4dCBk
ZXZlbG9waW5nIHBlcmlvZC4gVGhpcyBoaWdobHkgcG9zc2libGUgd2lsbCBkcm9wIHItYnMgSSBj
YW4gZ2V0IG5vdy4KPiBBbmQgcmV2aWV3ZXJzIHdpbGwgaGF2ZSB0byByZXZpZXcgdHdpY2UuCj4K
PiBBbmQgZm9yIHRoZSBzYW1lIHJlYXNvbiwgaXQncyBiYWQgaWRlYSB0byBxdWV1ZSBpbiB5b3Vy
IGJyYW5jaCBhIGxvdCBvZiBwYXRjaGVzCj4gZnJvbSBkaWZmZXJlbnQgc3Vic3lzdGVtcyBkdXJp
bmcgZnJlZXplLgo+Cj4gU28sIGp1c3QgcG9zdHBvbmUgdGhpcyBhbGwgdXAgdG8gbmV4dCBkZXZl
bG9wbWVudCBwaGFzZT8KCk9rYXkuICBJIGhvcGUgd2UgY2FuIHByb2Nlc3MgZ2VuZXJhdGVkIHBh
dGNoZXMgYXQgYSBicmlzayBwYWNlIHRoZW4uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
