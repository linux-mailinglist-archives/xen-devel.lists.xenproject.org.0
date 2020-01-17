Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E20D140C56
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:22:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSSk-0000Bf-37; Fri, 17 Jan 2020 14:19:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E2+z=3G=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1isSSh-0000Ba-Kw
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:18:59 +0000
X-Inumbo-ID: 48ab91a8-3934-11ea-aecd-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 48ab91a8-3934-11ea-aecd-bc764e2007e4;
 Fri, 17 Jan 2020 14:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579270730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=35qmtPvrRFjgXhduzB5j7ovXY4i2VhZtNdB1mTF6Ai0=;
 b=GA+wgWj2+fSji9XcSfz/1G924pHWBgasrYfzlLyGfaeSxM+4eozM/U0PgE9AEdCa+IrUnd
 laZ4+MZb7GydtKZ4NgV+OOlVagYgHsd0iVDEG9+KA/ZMlImnJtMKkVtD0fQn4rXHBoxJBb
 FrqhuGZuh0CuZy7FjUqpnh60VAq6eWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-YcGS1C0wO0yiTAf5oWf2oQ-1; Fri, 17 Jan 2020 09:18:47 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 401741800D48;
 Fri, 17 Jan 2020 14:18:45 +0000 (UTC)
Received: from [10.3.117.16] (ovpn-117-16.phx2.redhat.com [10.3.117.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9174119481;
 Fri, 17 Jan 2020 14:18:36 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20200110194158.14190-1-vsementsov@virtuozzo.com>
 <20200110194158.14190-3-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d15df303-7152-d1e6-47b4-4a4c7d68ccf3@redhat.com>
Date: Fri, 17 Jan 2020 08:18:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200110194158.14190-3-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: YcGS1C0wO0yiTAf5oWf2oQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v6 02/11] error: auto propagated local_err
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
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8xMC8yMCAxOjQxIFBNLCBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IHdyb3RlOgo+
IEhlcmUgaXMgaW50cm9kdWNlZCBFUlJQX0FVVE9fUFJPUEFHQVRFIG1hY3JvLCB0byBiZSB1c2Vk
IGF0IHN0YXJ0IG9mCj4gZnVuY3Rpb25zIHdpdGggZXJycCBPVVQgcGFyYW1ldGVyLgoKcy93aXRo
L3dpdGggYW4vCgo+IAo+IEl0IGhhcyB0aHJlZSBnb2FsczoKPiAKPiAxLiBGaXggaXNzdWUgd2l0
aCBlcnJvcl9mYXRhbCAmIGVycm9yX3ByZXBlbmQvZXJyb3JfYXBwZW5kX2hpbnQ6IHVzZXIKCm1h
eWJlIHMvJi9hbmQvIHNvIGl0IGRvZXNuJ3QgbG9vayBsaWtlIHRoZSBDICYgb3BlcmF0b3IuCgo+
IGNhbid0IHNlZSB0aGlzIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24sIGJlY2F1c2UgZXhpdCgpIGhh
cHBlbnMgaW4KPiBlcnJvcl9zZXRnIGVhcmxpZXIgdGhhbiBpbmZvcm1hdGlvbiBpcyBhZGRlZC4g
W1JlcG9ydGVkIGJ5IEdyZWcgS3Vyel0KPiAKPiAyLiBGaXggaXNzdWUgd2l0aCBlcnJvcl9hYm9y
dCAmIGVycm9yX3Byb3BhZ2F0ZTogd2hlbiB3ZSB3cmFwCgphbmQgYWdhaW4KCj4gZXJyb3JfYWJv
cnQgYnkgbG9jYWxfZXJyK2Vycm9yX3Byb3BhZ2F0ZSwgcmVzdWx0aW5nIGNvcmVkdW1wIHdpbGwK
CnMvLC8sIHRoZS8KCj4gcmVmZXIgdG8gZXJyb3JfcHJvcGFnYXRlIGFuZCBub3QgdG8gdGhlIHBs
YWNlIHdoZXJlIGVycm9yIGhhcHBlbmVkLgo+ICh0aGUgbWFjcm8gaXRzZWxmIGRvZXNuJ3QgZml4
IHRoZSBpc3N1ZSwgYnV0IGl0IGFsbG93cyB0byBbMy5dIGRyb3AgYWxsCgpzL2FsbG93cy9hbGxv
d3MgdXMvCnMvYWxsL3RoZS8KCj4gbG9jYWxfZXJyK2Vycm9yX3Byb3BhZ2F0ZSBwYXR0ZXJuLCB3
aGljaCB3aWxsIGRlZmluaXRlbHkgZml4IHRoZSBpc3N1ZSkKPiBbUmVwb3J0ZWQgYnkgS2V2aW4g
V29sZl0KPiAKPiAzLiBEcm9wIGxvY2FsX2VycitlcnJvcl9wcm9wYWdhdGUgcGF0dGVybiwgd2hp
Y2ggaXMgdXNlZCB0byB3b3JrYXJvdW5kCj4gdm9pZCBmdW5jdGlvbnMgd2l0aCBlcnJwIHBhcmFt
ZXRlciwgd2hlbiBjYWxsZXIgd2FudHMgdG8ga25vdyByZXN1bHRpbmcKPiBzdGF0dXMuIChOb3Rl
OiBhY3R1YWxseSB0aGVzZSBmdW5jdGlvbnMgY291bGQgYmUgbWVyZWx5IHVwZGF0ZWQgdG8KPiBy
ZXR1cm4gaW50IGVycm9yIGNvZGUpLgo+IAo+IFRvIGFjaGlldmUgdGhlc2UgZ29hbHMsIHdlIG5l
ZWQgdG8gYWRkIGludm9jYXRpb24gb2YgdGhlIG1hY3JvIGF0IHN0YXJ0Cj4gb2YgZnVuY3Rpb25z
LCB3aGljaCBuZWVkcyBlcnJvcl9wcmVwZW5kL2Vycm9yX2FwcGVuZF9oaW50ICgxLik7IGFkZAo+
IGludm9jYXRpb24gb2YgdGhlIG1hY3JvIGF0IHN0YXJ0IG9mIGZ1bmN0aW9ucyB3aGljaCBkbwo+
IGxvY2FsX2VycitlcnJvcl9wcm9wYWdhdGUgc2NlbmFyaW8gdGhlIGNoZWNrIGVycm9ycywgZHJv
cCBsb2NhbCBlcnJvcnMKPiBmcm9tIHRoZW0gYW5kIGp1c3QgdXNlICplcnJwIGluc3RlYWQgKDIu
LCAzLikuCgpUbyBhY2hpZXZlIHRoZXNlIGdvYWxzLCBsYXRlciBwYXRjaGVzIHdpbGwgYWRkIGlu
dm9jYXRpb25zIG9mIHRoaXMgbWFjcm8gCmF0IHRoZSBzdGFydCBvZiBmdW5jdGlvbnMgd2l0aCBl
aXRoZXIgdXNlIAplcnJvcl9wcmVwZW5kL2Vycm9yX2FwcGVuZF9oaW50IChzb2x2aW5nIDEpIG9y
IHdoaWNoIHVzZSAKbG9jYWxfZXJyK2Vycm9yX3Byb3BhZ2F0ZSB0byBjaGVjayBlcnJvcnMsIHN3
aXRjaGluZyB0aG9zZSBmdW5jdGlvbnMgdG8gCnVzZSAqZXJycCBpbnN0ZWFkIChzb2x2aW5nIDIg
YW5kIDMpLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5
IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+Cj4gLS0tCj4gCgo+IC0gKiBSZWNlaXZlIGFuIGVy
cm9yIGFuZCBwYXNzIGl0IG9uIHRvIHRoZSBjYWxsZXI6Cj4gKyAqIFJlY2VpdmUgYW4gZXJyb3Ig
YW5kIHBhc3MgaXQgb24gdG8gdGhlIGNhbGxlciAoREVQUkVDQVRFRCopOgo+ICAgICogICAgIEVy
cm9yICplcnIgPSBOVUxMOwo+ICAgICogICAgIGZvbyhhcmcsICZlcnIpOwo+ICAgICogICAgIGlm
IChlcnIpIHsKPiBAQCAtOTgsNiArOTgsNTAgQEAKPiAgICAqICAgICBmb28oYXJnLCBlcnJwKTsK
PiAgICAqIGZvciByZWFkYWJpbGl0eS4KPiAgICAqCj4gKyAqIERFUFJFQ0FURUQqIFRoaXMgcGF0
dGVybiBpcyBkZXByZWNhdGVkIG5vdywgdXNlIEVSUlBfQVVUT19QUk9QQUdBVEUgbWFjcm8KCnMv
dXNlL3VzZSB0aGUvCgo+ICsgKiBpbnN0ZWFkIChkZWZpbmVkIGJlbG93KS4KPiArICogSXQncyBk
ZXByZWNhdGVkIGJlY2F1c2Ugb2YgdHdvIHRoaW5nczoKPiArICoKPiArICogMS4gSXNzdWUgd2l0
aCBlcnJvcl9hYm9ydCAmIGVycm9yX3Byb3BhZ2F0ZTogd2hlbiB3ZSB3cmFwIGVycm9yX2Fib3J0
IGJ5CgpzLyYvYW5kLwoKPiArICogbG9jYWxfZXJyK2Vycm9yX3Byb3BhZ2F0ZSwgcmVzdWx0aW5n
IGNvcmVkdW1wIHdpbGwgcmVmZXIgdG8gZXJyb3JfcHJvcGFnYXRlCgpzLywvLCB0aGUvCgo+ICsg
KiBhbmQgbm90IHRvIHRoZSBwbGFjZSB3aGVyZSBlcnJvciBoYXBwZW5lZC4KPiArICoKPiArICog
Mi4gQSBsb3Qgb2YgZXh0cmEgY29kZSBvZiB0aGUgc2FtZSBwYXR0ZXJuCj4gKyAqCgo+ICsvKgo+
ICsgKiBFUlJQX0FVVE9fUFJPUEFHQVRFCj4gKyAqCj4gKyAqIFRoaXMgbWFjcm8gaXMgY3JlYXRl
ZCB0byBiZSB0aGUgZmlyc3QgbGluZSBvZiBhIGZ1bmN0aW9uIHdoaWNoIHVzZQo+ICsgKiBFcnJv
ciAqKmVycnAgcGFyYW1ldGVyIHRvIHJlcG9ydCBlcnJvci4gSXQncyBuZWVkZWQgb25seSBpbiBj
YXNlcyB3aGVyZSB3ZQo+ICsgKiB3YW50IHRvIHVzZSBlcnJvcl9wcmVwZW5kLCBlcnJvcl9hcHBl
bmRfaGludCBvciBkZXJlZmVyZW5jZSAqZXJycC4gSXQncwo+ICsgKiBzdGlsbCBzYWZlIChidXQg
dXNlbGVzcykgaW4gb3RoZXIgY2FzZXMuCgpJdCBkb2Vzbid0IF9oYXZlXyB0byBiZSB0aGUgZmly
c3QgbGluZSB0byBjb21waWxlICh3ZSByZXF1aXJlIEM5OSsgCmNvbXBpbGVycywgd2hpY2ggYWxs
b3cgZGVjbGFyYXRpb25zIGFmdGVyIHN0YXRlbWVudHMpOyBidXQgcmF0aGVyIApiZWNhdXNlIGl0
IG1ha2VzIGl0IGVhc2llciBmb3Igb3VyIENvY2NpbmVsbGUgY29udmVyc2lvbiBzY3JpcHQgdG8g
Y2F0Y2ggCm91dGxpZXJzLiAgQnV0IEkgdGhpbmsgdGhpcyB0ZXh0IGlzIG9rYXksIHdpdGhvdXQg
Y2FsbGluZyBvdXQgdGhhdCBleHRyYSAKaW5mb3JtYXRpb24gKG1heWJlIHRoZSBjb21taXQgbWVz
c2FnZSBzaG91bGQgbWVudGlvbiBpdCwgdGhvdWdoKS4KCj4gKyAqCj4gKyAqIElmIGVycnAgaXMg
TlVMTCBvciBwb2ludHMgdG8gZXJyb3JfZmF0YWwsIGl0IGlzIHJld3JpdHRlbiB0byBwb2ludCB0
byBhCj4gKyAqIGxvY2FsIEVycm9yIG9iamVjdCwgd2hpY2ggd2lsbCBiZSBhdXRvbWF0aWNhbGx5
IHByb3BhZ2F0ZWQgdG8gdGhlIG9yaWdpbmFsCj4gKyAqIGVycnAgb24gZnVuY3Rpb24gZXhpdCAo
c2VlIGVycm9yX3Byb3BhZ2F0b3JfY2xlYW51cCkuCj4gKyAqCj4gKyAqIEFmdGVyIGludm9jYXRp
b24gb2YgdGhpcyBtYWNybyBpdCBpcyBhbHdheXMgc2FmZSB0byBkZXJlZmVyZW5jZSBlcnJwCj4g
KyAqIChhcyBpdCdzIG5vdCBOVUxMIGFueW1vcmUpIGFuZCB0byBhZGQgaW5mb3JtYXRpb24gKGJ5
IGVycm9yX3ByZXBlbmQgb3IKPiArICogZXJyb3JfYXBwZW5kX2hpbnQpCj4gKyAqIChhcywgaWYg
aXQgd2FzIGVycm9yX2ZhdGFsLCB3ZSBzd2FwcGVkIGl0IHdpdGggYSBsb2NhbF9lcnJvciB0byBi
ZQo+ICsgKiBwcm9wYWdhdGVkIG9uIGNsZWFudXApLgoKZG91YmxlICgpICgpIGxvb2tzIG9kZCwg
YXMgZG9lcyB0aGUgbWlkLXNlbnRlbmNlIG5ld2xpbmUuCgo+ICsgKgo+ICsgKiBOb3RlOiB3ZSBk
b24ndCB3cmFwIHRoZSBlcnJvcl9hYm9ydCBjYXNlLCBhcyB3ZSB3YW50IHJlc3VsdGluZyBjb3Jl
ZHVtcAo+ICsgKiB0byBwb2ludCB0byB0aGUgcGxhY2Ugd2hlcmUgdGhlIGVycm9yIGhhcHBlbmVk
LCBub3QgdG8gZXJyb3JfcHJvcGFnYXRlLgo+ICsgKi8KPiArI2RlZmluZSBFUlJQX0FVVE9fUFJP
UEFHQVRFKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgZ19hdXRv
KEVycm9yUHJvcGFnYXRvcikgX2F1dG9fZXJycF9wcm9wID0gey5lcnJwID0gZXJycH07ICBcCj4g
KyAgICBlcnJwID0gKChlcnJwID09IE5VTEwgfHwgKmVycnAgPT0gZXJyb3JfZmF0YWwpICAgICAg
ICAgICAgIFwKPiArICAgICAgICAgICAgPyAmX2F1dG9fZXJycF9wcm9wLmxvY2FsX2VyciA6IGVy
cnApCj4gKwo+ICAgLyoKPiAgICAqIFNwZWNpYWwgZXJyb3IgZGVzdGluYXRpb24gdG8gYWJvcnQg
b24gZXJyb3IuCj4gICAgKiBTZWUgZXJyb3Jfc2V0ZygpIGFuZCBlcnJvcl9wcm9wYWdhdGUoKSBm
b3IgZGV0YWlscy4KPiAKClRoZSBtYWNybyBpdHNlbGYgaXMgZmluZSwgbXkgY29tbWVudHMgYXJl
IHNvbGVseSBvbiB0aGUgY29tbWl0IG1lc3NhZ2UgCmFuZCBjb21tZW50cy4gIERlcGVuZGluZyBv
biBob3cgbXVjaCBjbGVhbnVwIE1hcmt1cyBpcyB3aWxsaW5nIHRvIGRvIApyYXRoZXIgdGhhbiBy
ZXF1aXJlIGEgcmVzcGluLCB5b3UgY2FuIGFkZDoKClJldmlld2VkLWJ5OiBFcmljIEJsYWtlIDxl
Ymxha2VAcmVkaGF0LmNvbT4KCi0tIApFcmljIEJsYWtlLCBQcmluY2lwYWwgU29mdHdhcmUgRW5n
aW5lZXIKUmVkIEhhdCwgSW5jLiAgICAgICAgICAgKzEtOTE5LTMwMS0zMjI2ClZpcnR1YWxpemF0
aW9uOiAgcWVtdS5vcmcgfCBsaWJ2aXJ0Lm9yZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
