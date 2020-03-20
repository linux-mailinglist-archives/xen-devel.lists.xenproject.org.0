Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A601318CF9F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 15:01:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFIAw-0005D7-Gy; Fri, 20 Mar 2020 13:59:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aOFD=5F=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jFIAu-0005Cx-BQ
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 13:59:00 +0000
X-Inumbo-ID: f2aa4622-6ab2-11ea-92cf-bc764e2007e4
Received: from us-smtp-delivery-74.mimecast.com (unknown [63.128.21.74])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f2aa4622-6ab2-11ea-92cf-bc764e2007e4;
 Fri, 20 Mar 2020 13:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584712739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vG6jOFqL5yyGBydMNsMbILYo5yPiJ8TQta/MyKAx2Y4=;
 b=e5nZL1J10CDL2Jh9KvMst64UdIuT3B0a7Ei2OiADJM8/ZrYuqlUwttG0ISb7FINeyLtj5p
 1fwi7uuZmtrHacS2HyCmwSpjpV6YhbLjjycX8j7zMXGAmPDDgsVlc8wIwX/wbw7G43EzOW
 rTCB9UzkGxn5Pb6n+ThKVSijy42Nwp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-7hf_sQkxM5aAapW4mr69cw-1; Fri, 20 Mar 2020 09:58:57 -0400
X-MC-Unique: 7hf_sQkxM5aAapW4mr69cw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4617477;
 Fri, 20 Mar 2020 13:58:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 056FB1036B3B;
 Fri, 20 Mar 2020 13:58:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 660E01138404; Fri, 20 Mar 2020 14:58:48 +0100 (CET)
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
Date: Fri, 20 Mar 2020 14:58:48 +0100
In-Reply-To: <d7bc3318-2d39-ce6f-1bd0-4165084458a2@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 19 Mar 2020 15:12:07 +0300")
Message-ID: <87r1xn2kmf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3
cml0ZXM6Cgo+IDE5LjAzLjIwMjAgMTM6NDUsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+PiBW
bGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdy
aXRlczoKWy4uLl0KPj4+IFNvLCB1bmRlcnN0YW5kaW5nIHRoYXQgdGhlcmUgbm8gc3VjaCBjYXNl
cyBpbiB0aGUgd2hvbGUgdHJlZSwgYW5kIGV2ZW4KPj4+IGlmIHlvdXIgcGF0Y2ggd29ya3MgZmFz
dGVyIG9uIHRoZSB3aG9sZSB0cmVlLCBJIHN0aWxsIGRvbid0IHdhbnQgdG8KPj4+IGRyb3AgaW5o
ZXJpdGFuY2UsIGJlY2F1c2UgaXQncyBqdXN0IGEgY29ycmVjdCB0aGluZyB0byBkby4gWWVzLCB3
ZSd2ZQo+Pj4gYWRkZWQgX19fXyBoZWxwZXIuIEl0IGhlbHBzIHRvIGF2b2lkIHNvbWUgcHJvYmxl
bXMuIFBhaXItaW5oZXJpdGFuY2UKPj4+IGhlbHBzIHRvIGF2b2lkIGFub3RoZXIgcHJvYmxlbXMu
IEkgdW5kZXJzdGFuZCwgdGhhdCB0aGVyZSBzdGlsbCBtYXkKPj4+IG90aGVyLCBub3QtY292ZXJl
ZCBwcm9ibGVtcywgYnV0IGJldHRlciB0byBiZSBhcyBzYWZlIGFzIHBvc3NpYmxlLiBBbmQKPj4+
IGluaGVyaXRhbmNlIGhlcmUgaXMgbmF0aXZlIGFuZCBjb3JyZWN0IHRoaW5nIHRvIGRvLCBldmVu
IHdpdGggb3VyIF9fX18KPj4+IGFkZGl0aW9uYWwgaGVscGVyLiBXaGF0IGRvIHlvdSB0aGluaz8K
Pj4KPj4gSSB3b3VsZG4ndCBjYWxsIGl0IGNvcnJlY3QuICBJdCdzIHN0aWxsIHVucmVsaWFibGUs
IGJ1dCBsZXNzIHNvIHRoYW4KPj4gd2l0aG91dCB0aGUgZnVuY3Rpb24gbmFtZSBjb25zdHJhaW50
LiAgVGhhdCBtYWtlcyBpdCBsZXNzIHdyb25nLgo+Cj4gQWdyZWUuCj4KPj4KPj4gMTAwJSByZWxp
YWJsZSB3b3VsZCBiZSBuaWNlLCBidXQgbm90IGF0IGFueSBjb3N0LiAgU29tZXRoaW5nIHdlJ3Jl
Cj4+IHJlYXNvbmFibHkgY29uZmlkZW50IHRvIGdldCByaWdodCBzaG91bGQgYmUgZ29vZCBlbm91
Z2guCj4+Cj4+IFRvIGJlIGNvbmZpZGVudCwgd2UgbmVlZCB0byB1bmRlcnN0YW5kIHRoZSBzY3Jp
cHQncyBsaW1pdGF0aW9ucywgYW5kIGhvdwo+PiB0byBjb21wZW5zYXRlIGZvciB0aGVtLiAgSSBm
aWd1cmUgd2UgZG8gbm93LiAgWW91IHRvbz8KPj4KPgo+IEkgd2lsbCBub3QgYmUgc3VycHJpc2Vk
LCBpZiB3ZSBtaXNzZWQgc29tZSBtb3JlIGludGVyZXN0aW5nIGNhc2VzIDopCj4gQnV0IHdlIHNo
b3VsZCBwcm9jZWVkLiBXaGF0IGlzIG91ciBwbGFuPyBXaWxsIHlvdSBxdWV1ZSB2MTAgZm9yIDUu
MT8KCnYxMCdzIFBBVENIIDErMiBsb29rIHJlYWR5LiAgVGhlIGVycm9yLmggY29tbWVudCB1cGRh
dGUgY291bGQgcGVyaGFwcwp1c2Ugc29tZSBwb2xpc2g7IEkndmUgZm9jdXNlZCBteSBhdHRlbnRp
b24gZWxzZXdoZXJlLgoKUEFUQ0ggOC05IGFyZSBnZW5lcmF0ZWQuICBUaGV5IHNob3VsZCBuZXZl
ciBiZSByZWJhc2VkLCBhbHdheXMgYmUKcmVnZW5lcmF0ZWQuICBXZSBjb21wYXJlIHJlZ2VuZXJh
dGVkIHBhdGNoZXMgdG8gcG9zdGVkIG9uZXMgdG8gbWFrZSBzdXJlCnRoZXkgYXJlIHN0aWxsIHNh
bmUsIGFuZCB0aGUgUi1ieXMgYXJlIHN0aWxsIHZhbGlkLiAgSSBjYW4gdGFrZSBjYXJlIG9mCnRo
ZSBjb21wYXJpbmcuCgpJJ2QgbGlrZSB0byBoYXZlIGEgcHVsbCByZXF1ZXN0IHJlYWR5IHdoZW4g
dGhlIHRyZWUgcmVvcGVucyBmb3IgZ2VuZXJhbApkZXZlbG9wbWVudC4gIExldCdzIHVzZSB0aGUg
dGltZSB1bnRpbCB0aGVuIHRvIGdldCBtb3JlIGdlbmVyYXRlZApwYXRjaGVzIG91dCBmb3IgcmV2
aWV3LgoKSWYgSSBxdWV1ZSB1cCBwYXRjaGVzIGluIG15IHRyZWUsIHdlIHNoaWZ0IHRoZSByZXNw
b25zaWJpbGl0eSBmb3IKcmVnZW5lcmF0aW5nIHBhdGNoZXMgZnJvbSB5b3UgdG8gbWUsIGFuZCBj
cmVhdGUgYSBjb29yZGluYXRpb24gaXNzdWU6CnlvdSdsbCB3YW50IHRvIGJhc2UgcGF0Y2ggc3Vi
bWlzc2lvbnMgb24gdGhlIGJyYW5jaCBJIHVzZSB0byBxdWV1ZSB0aGlzCndvcmssIGFuZCB0aGF0
J3MgZ29pbmcgdG8gYmUgYXdrd2FyZCB3aGVuIEkgcmViYXNlIC8gcmVnZW5lcmF0ZSB0aGF0CmJy
YW5jaC4gIEkgdGhpbmsgaXQncyBzaW1wbGVyIHRvIHF1ZXVlIHVwIGluIHlvdXIgdHJlZSB1bnRp
bCB3ZSdyZSByZWFkeQpmb3IgYSBwdWxsIHJlcXVlc3QuCgpXaGVuIHlvdSBwb3N0IG1vcmUgcGF0
Y2hlcywgdXNlCgogICAgQmFzZWQtb246IDwyMDIwMDMxNzE1MTYyNS4yMDc5Ny0xLXZzZW1lbnRz
b3ZAdmlydHVvenpvLmNvbT4KCnNvIHRoYXQgUGF0Y2hldyBhcHBsaWVzIHRoZW0gb24gdG9wIG9m
IHRoaXMgc2VyaWVzLiAgSG1tLCBwcm9iYWJseSB3b24ndApkbywgYXMgUEFUQ0ggOSBhbHJlYWR5
IGNvbmZsaWN0cy4KCllvdSBjb3VsZCBpbnN0ZWFkIHJlcG9zdCBQQVRDSCAxKzIgd2l0aCBlYWNo
IGJhdGNoLiAgSSBob3BlIHRoYXQncyBub3QKdG9vIGNvbmZ1c2luZy4KCkkgdHJ1c3QgeW91J2xs
IGtlZXAgcHJvdmlkaW5nIGEgdGFnIHJldmlld2VycyBjYW4gcHVsbC4KCkkgc3VnZ2VzdCB0byBh
c2sgbWFpbnRhaW5lcnMgdG8gbGVhdmUgbWVyZ2luZyB0aGVzZSBwYXRjaGVzIHRvIG1lLCBpbgpj
b3ZlciBsZXR0ZXJzLgoKTWFrZXMgc2Vuc2U/CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
