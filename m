Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E19318152D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 10:41:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBxpQ-0006Xt-37; Wed, 11 Mar 2020 09:39:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=At4r=44=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jBxpO-0006Xn-LX
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 09:39:02 +0000
X-Inumbo-ID: 227101d7-637c-11ea-af4c-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 227101d7-637c-11ea-af4c-12813bfff9fa;
 Wed, 11 Mar 2020 09:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583919539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kLv6h6+V/o2qyCXkDIjC9ltvx09vIt/SVYH84pvLOZY=;
 b=jBznuyaGQXvPPOGwV2ABut4XGYsR/XPFFl5xvgb3UNliKQMSr1vbLLWTi8yzAIw83tChRv
 ssAv0C+fMm+mlI1SPH2tRez8CpbW3n8ztoDochfHopYT8kkG5n0GBGQqhTDGYrXCqnFeuF
 dOK4Vxn9d6Gu3qYaSLDAwfYBoMtlg2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-UFrvi3bMMvOEcpcwWN0xfQ-1; Wed, 11 Mar 2020 05:38:56 -0400
X-MC-Unique: UFrvi3bMMvOEcpcwWN0xfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D925E107ACC4;
 Wed, 11 Mar 2020 09:38:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-34.ams2.redhat.com
 [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 453B460C99;
 Wed, 11 Mar 2020 09:38:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CB70511386A6; Wed, 11 Mar 2020 10:38:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-3-vsementsov@virtuozzo.com>
 <87lfo997hs.fsf@dusky.pond.sub.org>
 <fda76f8a-bb62-d867-d7b4-7cf8caf0489e@virtuozzo.com>
Date: Wed, 11 Mar 2020 10:38:47 +0100
In-Reply-To: <fda76f8a-bb62-d867-d7b4-7cf8caf0489e@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 11 Mar 2020 11:29:25 +0300")
Message-ID: <87a74ngriw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v8 02/10] scripts: add coccinelle script to
 use auto propagated errp
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
cml0ZXM6Cgo+IDA5LjAzLjIwMjAgMTI6NTYsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+PiBT
dWdnZXN0Cj4+Cj4+ICAgICAgc2NyaXB0czogQ29jY2luZWxsZSBzY3JpcHQgdG8gdXNlIGF1dG8t
cHJvcGFnYXRlZCBlcnJwCj4+Cj4+IG9yCj4+Cj4+ICAgICAgc2NyaXB0czogQ29jY2luZWxsZSBz
Y3JpcHQgdG8gdXNlIEVSUlBfQVVUT19QUk9QQUdBVEUoKQo+Pgo+PiBWbGFkaW1pciBTZW1lbnRz
b3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdyaXRlczoKWy4uLl0KPj4+
ICsvLyBOb3RlLCB0aGF0IHdlIHVwZGF0ZSBldmVyeXRoaW5nIHJlbGF0ZWQgdG8gbWF0Y2hlZCBi
eSBydWxlMSBmdW5jdGlvbiBuYW1lCj4+PiArLy8gYW5kIGxvY2FsX2VyciBuYW1lLiBXZSBtYXkg
bWF0Y2ggc29tZXRoaW5nIG5vdCByZWxhdGVkIHRvIHRoZSBwYXR0ZXJuCj4+PiArLy8gbWF0Y2hl
ZCBieSBydWxlMS4gRm9yIGV4YW1wbGUsIGxvY2FsX2VyciBtYXkgYmUgZGVmaW5lZCB3aXRoIHRo
ZSBzYW1lIG5hbWUKPj4+ICsvLyBpbiBkaWZmZXJlbnQgYmxvY2tzIGluc2lkZSBvbmUgZnVuY3Rp
b24sIGFuZCBpbiBvbmUgYmxvY2sgZm9sbG93IHRoZQo+Pj4gKy8vIHByb3BhZ2F0aW9uIHBhdHRl
cm4gYW5kIGluIG90aGVyIGJsb2NrIGRvZXNuJ3QuIE9yIHdlIG1heSBoYXZlIHNldmVyYWwKPj4+
ICsvLyBmdW5jdGlvbnMgd2l0aCB0aGUgc2FtZSBuYW1lIChmb3IgZGlmZmVyZW50IGNvbmZpZ3Vy
YXRpb25zKS4KPj4KPj4gQ29udGV4dDogcnVsZTEgbWF0Y2hlcyBmdW5jdGlvbnMgdGhhdCBoYXZl
IGFsbCB0aHJlZSBvZgo+Pgo+PiAqIGFuIEVycm9yICoqZXJycCBwYXJhbWV0ZXIKPj4KPj4gKiBh
biBFcnJvciAqbG9jYWxfZXJyID0gTlVMTCB2YXJpYWJsZSBkZWNsYXJhdGlvbgo+Pgo+PiAqIGFu
IGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBsb2NhbF9lcnIpIG9yIGVycm9yX3Byb3BhZ2F0ZV9wcmVw
ZW5kKGVycnAsCj4+ICAgIGxvY2FsX2VyciwgLi4uKSBleHByZXNzaW9uLCB3aGVyZSBAZXJycCBp
cyB0aGUgcGFyYW1ldGVyIGFuZAo+PiAgICBAbG9jYWxfZXJyIGlzIHRoZSB2YXJpYWJsZS4KPj4K
Pj4gSWYgSSB1bmRlcnN0YW5kIHlvdSBjb3JyZWN0bHksIHlvdSdyZSBwb2ludGluZyBvdXQgdHdv
IHBvdGVudGlhbCBpc3N1ZXM6Cj4+Cj4+IDEuIFRoaXMgcnVsZSBjYW4gbWF0Y2ggZnVuY3Rpb25z
IHJ1bGUxIGRvZXMgbm90IG1hdGNoIGlmIHRoZXJlIGlzCj4+IGFub3RoZXIgZnVuY3Rpb24gd2l0
aCB0aGUgc2FtZSBuYW1lIHRoYXQgcnVsZTEgZG9lcyBtYXRjaC4KPj4KPj4gMi4gVGhpcyBydWxl
IG1hdGNoZXMgaW4gdGhlIGVudGlyZSBmdW5jdGlvbiBtYXRjaGVkIGJ5IHJ1bGUxLCBldmVuIHdo
ZW4KPj4gcGFydHMgb2YgdGhhdCBmdW5jdGlvbiB1c2UgYSBkaWZmZXJlbnQgQGVycnAgb3IgQGxv
Y2FsX2Vyci4KPj4KPj4gSSBmaWd1cmUgdGhlc2UgYXBwbHkgdG8gYWxsIHJ1bGVzIHdpdGggaWRl
bnRpZmllciBydWxlMS5mbiwgbm90IGp1c3QKPj4gdGhpcyBvbmUuICBDb3JyZWN0Pwo+Pgo+PiBS
ZWdhcmRpbmcgMS4gIFRoZXJlIG11c3QgYmUgYSBiZXR0ZXIgd2F5IHRvIGNoYWluIHJ1bGVzIHRv
Z2V0aGVyLCBidXQgSQo+PiBkb24ndCBrbm93IGl0Lgo+Cj4gSG1tLCB3aGF0IGFib3V0IHNvbWV0
aGluZyBsaWtlIHRoaXM6Cj4KPiBAcnVsZTEgZGlzYWJsZSBvcHRpb25hbF9xdWFsaWZpZXIgZXhp
c3RzQAo+IGlkZW50aWZpZXIgZm4sIGxvY2FsX2VycjsKPiBzeW1ib2wgZXJycDsKPiBAQAo+Cj4g
IGZuKC4uLiwgRXJyb3IgKioKPiAtIGVycnAKPiArIF9fX2VycnBfY29jY2luZWxsZV91cGRhdGlu
Z19fXwo+ICAgICAsIC4uLikKPiAgewo+ICAgICAgLi4uCj4gICAgICBFcnJvciAqbG9jYWxfZXJy
ID0gTlVMTDsKPiAgICAgIC4uLgo+ICgKPiAgICAgZXJyb3JfcHJvcGFnYXRlX3ByZXBlbmQoZXJy
cCwgbG9jYWxfZXJyLCAuLi4pOwo+IHwKPiAgICAgZXJyb3JfcHJvcGFnYXRlKGVycnAsIGxvY2Fs
X2Vycik7Cj4gKQo+ICAgICAgLi4uCj4gIH0KPgo+Cj4gWy4uXQo+Cj4gbWF0Y2ggc3ltYm9sIF9f
X2VycnBfY29jY2luZWxsZV91cGRhdGluZ19fXyBpbiBmb2xsb3dpbmcgcnVsZXMgaW4gZnVuY3Rp
b24gaGVhZGVyCj4KPiBbLi5dCj4KPgo+IEAgZGlzYWJsZSBvcHRpb25hbF9xdWFsaWZpZXJACj4g
aWRlbnRpZmllciBmbiwgbG9jYWxfZXJyOwo+IHN5bWJvbCBlcnJwOwo+IEBACj4KPiAgZm4oLi4u
LCBFcnJvciAqKgo+IC0gX19fZXJycF9jb2NjaW5lbGxlX3VwZGF0aW5nX19fCj4gKyBlcnJwCj4g
ICAgICwgLi4uKQo+ICB7Cj4gICAgICAuLi4KPiAgfQo+Cj4KPiAtIGhhY2t5LCBidXQgc2VlbXMg
bm90IG1vcmUgaGFja3kgdGhhbiBweXRob24gZGV0ZWN0aW9uLCBhbmQgc2hvdWxkIHdvcmsgYmV0
dGVyCgpBcyBzaW1wbGUsIGZvcmNlZnVsIGFuZCB1bnN1YnRsZSBhcyBhIHNsZWRnZWhhbW1lci4g
IEkgbGlrZSBpdCA6KQoKWy4uLl0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
