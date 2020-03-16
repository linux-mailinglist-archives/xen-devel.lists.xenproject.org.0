Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E3A186DA4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 15:43:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDquf-0008RK-Hc; Mon, 16 Mar 2020 14:40:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iRh0=5B=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jDque-0008RF-L0
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 14:40:16 +0000
X-Inumbo-ID: 0d0c0040-6794-11ea-b34e-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0d0c0040-6794-11ea-b34e-bc764e2007e4;
 Mon, 16 Mar 2020 14:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584369615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Czoi727Qg9oCZu1w42vol8KBAGSD9icfOQv3jriOJ64=;
 b=Y6TyJkj5vcCd4YTcg1Icnh6oDjGVKVfD8Uu3lqV5tdfnCV1RNbc2CihaGmZPHjila/Xulk
 X/6pV9QNqGY51DmpALFZtx41vSDq+K29E4o1gtnjUPH5QeWEp6/0+4IPc3kzNoAUYu8tgA
 2O5TyWtfK1kDDuzCcmD70IDDbSwvyuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-U2KcF7hKM_ehlnSvpGiSeA-1; Mon, 16 Mar 2020 10:40:12 -0400
X-MC-Unique: U2KcF7hKM_ehlnSvpGiSeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 591B1100550D;
 Mon, 16 Mar 2020 14:40:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-49.ams2.redhat.com
 [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F4C15DA7C;
 Mon, 16 Mar 2020 14:40:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DD7D11138404; Mon, 16 Mar 2020 15:40:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
 <87y2shdg00.fsf@dusky.pond.sub.org>
 <87abeabb-c8ee-ed6f-6b3a-b3fc24d07b89@virtuozzo.com>
Date: Mon, 16 Mar 2020 15:40:02 +0100
In-Reply-To: <87abeabb-c8ee-ed6f-6b3a-b3fc24d07b89@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 3 Mar 2020 11:12:46 +0300")
Message-ID: <87r1xsfjnh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v7 00/11] error: auto propagated local_err
 part I
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
cml0ZXM6Cgo+IDAzLjAzLjIwMjAgMTE6MDEsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+PiBI
aSBWbGFkaW1pciwKPj4KPj4gSSd2ZSBjb21lIHRvIHJhdGhlciBsaWtlIHlvdXIgRVJSUF9BVVRP
X1BST1BBR0FURSgpIGlkZWEuICBXaGF0IEkKPj4gd291bGRuJ3QgbGlrZSBpcyBhIHByb3RyYWN0
ZWQgY29udmVyc2lvbi4KPj4KPj4gT25jZSB3ZSdyZSBoYXBweSB3aXRoIFBBVENIIDEtMywgaXQn
cyBhIG1hdHRlciBvZiBydW5uaW5nIENvY2NpbmVsbGUgYW5kCj4+IHJldmlld2luZyBpdHMgb3V0
cHV0LiAgSSdtIGNvbmZpZGVudCB3ZSBjYW4gY29udmVyZ2Ugb24gUEFUQ0ggMS0zLgo+Pgo+PiBJ
dCdzIHR3byB3ZWVrcyB1bnRpbCBzb2Z0IGZyZWV6ZS4gIFdlIG5lZWQgdG8gZGVjaWRlIHdoZXRo
ZXIgdG8gcHVyc3VlIGEKPj4gcGFydGlhbCBjb252ZXJzaW9uIGZvciA1LjAgKGJhc2ljYWxseSB0
aGlzIHNlcmllcyBwbHVzIHRoZSB0d28gcGF0Y2hlcwo+PiB3ZSBpZGVudGlmaWVkIGluIHJldmll
dyBvZiBQQVRDSCAxKSwgb3IgZGVsYXkgdW50aWwgNS4xLiAgSW4gZWl0aGVyCj4+IGNhc2UsIEkg
d2FudCB0aGUgY29udmVyc2lvbiB0byBiZSBmaW5pc2hlZCBpbiA1LjEuCj4+Cj4+IFBsZWFzZSBk
byBub3QgZmVlbCBwcmVzc3VyZWQgdG8gbWFrZSB0aGUgNS4wIGRlYWRsaW5lLgo+Pgo+PiBJIGNh
biBxdWV1ZSB1cCBwYXRjaGVzIGZvciA1LjEgZHVyaW5nIHRoZSBmcmVlemUuCj4+Cj4+IEhvdyB3
b3VsZCB5b3UgbGlrZSB0byBwcm9jZWVkPwo+Pgo+Cj4gSGkgTWFya3VzISBGdW5ueSBjb2luY2lk
ZW5jZTogZXhhY3RseSBub3cgKGxlc3MgdGhhbiAxIGhvdXIgYWdvKSwgSSd2ZQo+IHN0YXJ0ZWQg
d29ya2luZyBmb3IgdGhlIG5leHQgdmVyc2lvbiBmb3IgdGhlc2Ugc2VyaWVzLiBTbywgSSdtIGdv
aW5nIHRvCj4gcmVzZW5kIHRvZGF5LiBPZiBjb3Vyc2UsIEknZCBwcmVmZXIgdG8gbWVyZ2Ugc29t
ZXRoaW5nIHRvIDUuMCBpZiBhdCBhbGwKPiBwb3NzaWJsZS4KClRoYXQgd2FzIHY4LCBmb2xsb3dl
ZCBieSB2OS4gIFdlJ3JlIGNsZWFybHkgY29udmVyZ2luZy4gIEhvd2V2ZXIsIHRoZQpzb2Z0IGZy
ZWV6ZSBpcyB0b21vcnJvdyBhbHJlYWR5LgoKWW91J3ZlIHBlcnNldmVyZWQgd2l0aCB0aGlzIGlk
ZWEgZm9yIHF1aXRlIGEgd2hpbGU7IHNvbWUgaW1wYXRpZW5jZQp3b3VsZCBiZSBxdWl0ZSBleGN1
c2FibGUgbm93LiAgU3RpbGwsIEkgZG91YnQgcGFydCBJIG1ha2luZyA1LjAgbWF0dGVycy4KVGhl
IGhhbmQtd3JpdHRlbiBwYXJ0IGlzIGxpa2VseSB0byByZWJhc2UgZWFzaWx5LCBhbmQgdGhlIGdl
bmVyYXRlZCBwYXJ0CnNob3VsZCBiZSByZWdlbmVyYXRlZCBpbnN0ZWFkIG9mIHJlYmFzZWQgYW55
d2F5LgoKV2hhdCBhY3R1YWxseSBtYXR0ZXJzIGlzICpmaW5pc2hpbmcqIHRoZSBqb2IuICBXaGF0
IGRvZXMgdGhhdCB0YWtlPwoKKiBDb25zZW5zdXMgb24gdGhlIGhhbmQtd3JpdHRlbiBwYXJ0LiAg
SSB0aGluayB3ZSdyZSBiYXNpY2FsbHkgdGhlcmUsIHdlCiAganVzdCB3YW50IHRvIHdvcmsgaW4g
YSBmZXcgbW9yZSB0d2Vha3MuCgoqIFNwbGl0IHRoZSBnZW5lcmF0ZWQgcGFydCBpbnRvIHJldmll
d2FibGUgYmF0Y2hlcywgcmVnZW5lcmF0aW5nIHBhdGNoZXMKICBhcyBuZWNlc3NhcnkuICBTb2xp
Y2l0IHJldmlldy4gIEZpcnN0IGJhdGNoIGlzIHBhcnQgb2YgdGhpcyBzZXJpZXMsCiAgYW5kIHY5
IGxvb2tzIHJlYWR5IHRvIG1lLiAgSSBhc3N1bWUgeW91J2xsIHByZXBhcmUgdGhlIHJlbWFpbmlu
ZwogIGJhdGNoZXMuCgoqIFF1ZXVlIHVwIGJhdGNoZXMgYXMgdGhleSBiZWNvbWUgcmVhZHksIHBv
c3QgcHVsbCByZXF1ZXN0cy4gIEkgY2FuIGRvCiAgdGhhdC4KCiogVXBkYXRlIHRoZSBRQVBJIGNv
ZGUgZ2VuZXJhdG9yIHRvIHRoZSBuZXcgRXJyb3IgdXNhZ2UuICBJIGNhbiBkbyB0aGF0LgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
