Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3150C17C1A2
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 16:25:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAEnc-0007KU-Lu; Fri, 06 Mar 2020 15:22:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J+hc=4X=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jAEnb-0007KP-Ml
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 15:22:03 +0000
X-Inumbo-ID: 3acd6cea-5fbe-11ea-a80d-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3acd6cea-5fbe-11ea-a80d-12813bfff9fa;
 Fri, 06 Mar 2020 15:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583508122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3W7qv0j/eoCvAaFdDDrXED6dNJGR9cDFQwpXqUHHuQ=;
 b=RcETT0MMQxDYgbY4QCyn8Ds2ZL/Unvu+OZO5F18pd3SDz8OkWI2eUHoFBL/Iuidz4mQv8q
 60LM0FP0P7ZC5T64VXPe2WqXQViXiAuJXG+RWyUqrWznLbjshZPu0C/VBnxlCARDtAx8eX
 1K111Vsp4JtEF4sXmltIcBCBJLpFgDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-DDz5roYpNAqFxwcKzusvlg-1; Fri, 06 Mar 2020 10:21:58 -0500
X-MC-Unique: DDz5roYpNAqFxwcKzusvlg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6895896EFD;
 Fri,  6 Mar 2020 15:21:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8D1B5C21B;
 Fri,  6 Mar 2020 15:21:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7712711386A6; Fri,  6 Mar 2020 16:21:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
Date: Fri, 06 Mar 2020 16:21:49 +0100
In-Reply-To: <20200306051536.27803-1-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 6 Mar 2020 08:15:26 +0300")
Message-ID: <87eeu51pbm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v8 00/10] error: auto propagated local_err
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
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
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
cml0ZXM6Cgo+IEZpbGUgd2l0aCBlcnJwLWNsZWFuaW5nIEFQSXMgZHJvcHBlZCBmb3IgdHdvIHJl
YXNvbnM6Cj4KPiAxLiBJJ20gdGlyZWQgYWZ0ZXIgYSAzLWRheXMgd2FyIHdpdGggY29jY2luZWxs
ZSwgYW5kIGRvbid0IHdhbnQgdG8gYWRkIG1vcmUKPiAgICBwYXRjaGVzIGhlcmUuCgpPd3cuICBJ
biBteSBleHBlcmllbmNlLCBDb2NjaW5lbGxlIGlzIGJvdGggYXdlc29tZSBhbmQgdGVycmlibGUu
ICBJIGhvcGUKeW91IGRpZG4ndCBkbyBhbGwgdGhhdCB3b3JrIGp1c3QgdG8gYWRkcmVzcyBtaW5v
ciBjb21wbGFpbnRzIGZyb20gbWUuICBJCip0cnkqIHRvIG1ha2UgaXQgY2xlYXIgd2hlcmUgb24g
dGhlIHNwZWN0cnVtIGZyb20gIkkgd2FudCB5b3UgdG8gaW1wcm92ZQp0aGlzIiB0byAicGVyaGFw
cyB5b3UnZCBsaWtlIHRvIHRyeSB0aGlzIGlkZWEiIG15IHJldmlldyBjb21tZW50cyBhcmUsCmJ1
dCBJJ20gY2VydGFpbmx5IG5vdCBwZXJmZWN0IHRoZXJlLiAgQW55d2F5LCBoZXJlIHdlIGFyZSwg
c28gbGV0J3MgbG9vawphdCB0aGUgcGF0Y2hlcy4KCj4gMi4gTWFya3VzIG5vdGVkLCB0aGF0IHdl
IGZvcmdldCB0d28gbW9yZSBmdW5jdGlvbnMgd2hpY2ggbmVlZHMgc3VjaCB3cmFwcGVycwo+ICAg
IGFuZCBjb3JyZXNwb25kaW5nIGNvbnZlcnNpb24sIHNvIHNlZW1zIGJldHRlciB0byBoYW5kbGUg
YWxsIHRoZXNlIHRoaW5ncwo+ICAgIGluIHNhbWUgbWFubmVyIGZvciBub3cuCj4KPiBjaGFuZ2Vz
IGluIHY4Ogo+Cj4gMDE6IC0gdXBkYXRlIGNvbW1lbnRzCj4gICAgIC0gZml4IGJ1ZyBpbiBtYWNy
byBbTWFya3VzXQo+ICAgICAtIHVzZSBkbyB7fSB3aGlsZSgwKQo+Cj4gMDI6IGEgbG90IG9mIGNo
YW5nZXMKPiAgICAgLSBhYm91dCBlcnJvciBwcm9wYWdhdGlvbjogdHJ5IHRvIHVwZGF0ZSBvbmx5
IHBhdHRlcm5zIHdoZXJlIHdlIHByb3BhZ2F0ZQo+ICAgICAgIGxvY2FsX2Vycm9yIHRvIGVycnAu
IFNvLCBwYXRjaGVzIDA5IGFuZCAxMCBjaGFuZ2VkICh3b3chKQo+ICAgICAtIE5vdyBjbGVhcmlu
ZyBmdW5jdGlvbnMgYXJlIG5vdCBkZWZpbmVkLiBTdGlsbCwgZG8gdGhlIGNvbnZlcnNpb24sIHNv
Cj4gICAgICAgdGhhdCB3aGVuIHNjcmlwdCBhcHBsaWVkIHdoZXJlIHRoZXNlIGZ1bmN0aW9ucyBu
ZWVkZWQsIGNvbXBpbGF0aW9uIHdpbGwKPiAgICAgICBiZSBicm9rZW4uCj4gICAgIC0gaW1wcm92
ZSBvcmRlcmluZyBvZiBodW5rcywgYW5kIGNvbW1lbnQgZXZlcnl0aGluZwo+Cj4gMDksMTA6IGRy
b3AgaHVua3MsIHdoaWNoIGFyZSBjb252ZXJ0ZWQgZm9yIG5vdGhpbmcuCgpRdWljayBleWUtb3Zl
cjogeW91IG5vIGxvbmdlciB3cmFwIG5iZF9jb19yZWNlaXZlX2NtZHJlYWRfcmVwbHkoKSwKbmJk
X2NvX3JlY2VpdmVfYmxvY2tzdGF0dXNfcmVwbHkoKSwgYW5kIHhlbl9idXNfcmVhbGl6ZSgpLiAg
Q2xlYXJseQpiZXR0ZXIuCgo+IHY4IGlzIGF2YWlsYWJsZSBhdAo+ICBodHRwczovL3NyYy5vcGVu
dnoub3JnL3NjbS9+dnNlbWVudHNvdi9xZW11LmdpdCAjdGFnIHVwLWF1dG8tbG9jYWwtZXJyLXBh
cnRJLXY4Cj4gdjcgaXMgYXZhaWxhYmxlIGF0Cj4gIGh0dHBzOi8vc3JjLm9wZW52ei5vcmcvc2Nt
L352c2VtZW50c292L3FlbXUuZ2l0ICN0YWcgdXAtYXV0by1sb2NhbC1lcnItcGFydEktdjcKPiAg
Cj4gSW4gdGhlc2Ugc2VyaWVzLCB0aGVyZSBpcyBubyBjb21taXQtcGVyLXN1YnN5c3RlbSBzY3Jp
cHQsIGVhY2ggZ2VuZXJhdGVkCj4gY29tbWl0IGlzIGdlbmVyYXRlZCBpbiBzZXBhcmF0ZS4KPgo+
IFN0aWxsLCBnZW5lcmF0aW5nIGNvbW1hbmRzIGFyZSB2ZXJ5IHNpbWlsYXIsIGFuZCBsb29rcyBs
aWtlCj4KPiAgICAgc2VkIC1uICcvXjxTdWJzeXN0ZW0gbmFtZT4kLywvXiQve3MvXkY6IC8vcH0n
IE1BSU5UQUlORVJTIHwgXAo+ICAgICB4YXJncyBnaXQgbHMtZmlsZXMgfCBncmVwICdcLltoY10k
JyB8IFwKPiAgICAgeGFyZ3Mgc3BhdGNoIFwKPiAgICAgICAgIC0tc3AtZmlsZSBzY3JpcHRzL2Nv
Y2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kgXAo+ICAgICAgICAgLS1tYWNyby1m
aWxlIHNjcmlwdHMvY29jY2ktbWFjcm8tZmlsZS5oIFwKPiAgICAgICAgIC0taW4tcGxhY2UgLS1u
by1zaG93LWRpZmYgLS1tYXgtd2lkdGggODAKPgo+IE5vdGUsIHRoYXQgaW4gZWFjaCBnZW5lcmF0
ZWQgY29tbWl0LCBnZW5lcmF0aW9uIGNvbW1hbmQgaXMgdGhlIG9ubHkKPiB0ZXh0LCBpbmRlbnRl
ZCBieSA4IHNwYWNlcyBpbiAnZ2l0IGxvZyAtMScgb3V0cHV0LCBzbywgdG8gcmVnZW5lcmF0ZSBh
bGwKPiBjb21taXRzIChmb3IgZXhhbXBsZSwgYWZ0ZXIgcmViYXNlLCBvciBjaGFuZ2UgaW4gY29j
Y2luZWxsZSBzY3JpcHQpLCB5b3UKPiBtYXkgdXNlIHRoZSBmb2xsb3dpbmcgY29tbWFuZDoKPgo+
IGdpdCByZWJhc2UgLXggInNoIC1jIFwiZ2l0IHNob3cgLS1wcmV0dHk9IC0tbmFtZS1vbmx5IHwg
eGFyZ3MgZ2l0IGNoZWNrb3V0IEhFQUReIC0tIDsgZ2l0IHJlc2V0OyBnaXQgbG9nIC0xIHwgZ3Jl
cCAnXiAgICAgICAgJyB8IHNoXCIiIEhFQUR+Nwo+Cj4gV2hpY2ggd2lsbCBzdGFydCBhdXRvbWF0
ZWQgaW50ZXJhY3RpdmUgcmViYXNlIGZvciBnZW5lcmF0ZWQgcGF0Y2hlcywKPiB3aGljaCB3aWxs
IHN0b3AgaWYgZ2VuZXJhdGVkIHBhdGNoIGNoYW5nZWQKPiAoeW91IG1heSBkbyBnaXQgY29tbWl0
IC0tYW1lbmQgdG8gYXBwbHkgdXBkYXRlZCBnZW5lcmF0ZWQgY2hhbmdlcykuCj4KPiBOb3RlOgo+
ICAgZ2l0IHNob3cgLS1wcmV0dHk9IC0tbmFtZS1vbmx5ICAgLSBsaXN0cyBmaWxlcywgY2hhbmdl
ZCBpbiBIRUFECj4gICBnaXQgbG9nIC0xIHwgZ3JlcCAnXiAgICAgICAgJyB8IHNoICAgLSByZXJ1
biBnZW5lcmF0aW9uIGNvbW1hbmQgb2YgSEVBRAo+Cj4KPiBDaGVjayBmb3IgY29tcGlsYXRpb24g
b2YgY2hhbmdlZCAuYyBmaWxlcwo+IGdpdCByZWJhc2UgLXggInNoIC1jIFwiZ2l0IHNob3cgLS1w
cmV0dHk9IC0tbmFtZS1vbmx5IHwgc2VkIC1uICdzL1wuYyQvLm8vcCcgfCB4YXJncyBtYWtlIC1q
OVwiIiBIRUFEfjcKClRoYW5rcyBmb3IgdGhlIHdyaXRlLXVwIQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
