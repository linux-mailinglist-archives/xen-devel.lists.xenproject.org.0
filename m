Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F79181B97
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 15:43:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC2Xw-0003JL-2N; Wed, 11 Mar 2020 14:41:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=At4r=44=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jC2Xt-0003JG-Mq
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 14:41:17 +0000
X-Inumbo-ID: 5d4dcfb2-63a6-11ea-a6c1-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5d4dcfb2-63a6-11ea-a6c1-bc764e2007e4;
 Wed, 11 Mar 2020 14:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583937676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eg2CZjPbTX8SjRwNDnoDsSdouoJltA9NNOsfHqNxAuU=;
 b=gtXztGcVv6ArWlzpdVkft/+DP8v/IIZy4Ry3OAzo9pD6uOUpDDOrNf6rBtFr8XM/DWGie4
 5jRz1KoiDttbOi4O5slwQTZjGi/lCmAG+RGAlFezWbUKMoIdQIvm8KW47rtheEGZdyKYFo
 yoZr/t4nzcaEK35kRraa2tmw1kavMKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-5WOfSgRnO7u9pEUtHmUJ6g-1; Wed, 11 Mar 2020 10:41:15 -0400
X-MC-Unique: 5WOfSgRnO7u9pEUtHmUJ6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0810A800EBC;
 Wed, 11 Mar 2020 14:41:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-34.ams2.redhat.com
 [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E33A9CA3;
 Wed, 11 Mar 2020 14:41:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 99B5711386A6; Wed, 11 Mar 2020 15:41:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-3-vsementsov@virtuozzo.com>
 <87lfo997hs.fsf@dusky.pond.sub.org>
 <fda76f8a-bb62-d867-d7b4-7cf8caf0489e@virtuozzo.com>
 <87a74ngriw.fsf@dusky.pond.sub.org>
 <71ada30b-c72b-6251-cc38-877ddd4156a8@virtuozzo.com>
Date: Wed, 11 Mar 2020 15:41:05 +0100
In-Reply-To: <71ada30b-c72b-6251-cc38-877ddd4156a8@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 11 Mar 2020 17:05:24 +0300")
Message-ID: <87h7yvx8ce.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org,
 Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3
cml0ZXM6Cgo+IDExLjAzLjIwMjAgMTI6MzgsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+PiBW
bGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdy
aXRlczoKPj4KPj4+IDA5LjAzLjIwMjAgMTI6NTYsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+
Pj4+IFN1Z2dlc3QKPj4+Pgo+Pj4+ICAgICAgIHNjcmlwdHM6IENvY2NpbmVsbGUgc2NyaXB0IHRv
IHVzZSBhdXRvLXByb3BhZ2F0ZWQgZXJycAo+Pj4+Cj4+Pj4gb3IKPj4+Pgo+Pj4+ICAgICAgIHNj
cmlwdHM6IENvY2NpbmVsbGUgc2NyaXB0IHRvIHVzZSBFUlJQX0FVVE9fUFJPUEFHQVRFKCkKPj4+
Pgo+Pj4+IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpv
LmNvbT4gd3JpdGVzOgo+PiBbLi4uXQo+Pj4+PiArLy8gTm90ZSwgdGhhdCB3ZSB1cGRhdGUgZXZl
cnl0aGluZyByZWxhdGVkIHRvIG1hdGNoZWQgYnkgcnVsZTEgZnVuY3Rpb24gbmFtZQo+Pj4+PiAr
Ly8gYW5kIGxvY2FsX2VyciBuYW1lLiBXZSBtYXkgbWF0Y2ggc29tZXRoaW5nIG5vdCByZWxhdGVk
IHRvIHRoZSBwYXR0ZXJuCj4+Pj4+ICsvLyBtYXRjaGVkIGJ5IHJ1bGUxLiBGb3IgZXhhbXBsZSwg
bG9jYWxfZXJyIG1heSBiZSBkZWZpbmVkIHdpdGggdGhlIHNhbWUgbmFtZQo+Pj4+PiArLy8gaW4g
ZGlmZmVyZW50IGJsb2NrcyBpbnNpZGUgb25lIGZ1bmN0aW9uLCBhbmQgaW4gb25lIGJsb2NrIGZv
bGxvdyB0aGUKPj4+Pj4gKy8vIHByb3BhZ2F0aW9uIHBhdHRlcm4gYW5kIGluIG90aGVyIGJsb2Nr
IGRvZXNuJ3QuIE9yIHdlIG1heSBoYXZlIHNldmVyYWwKPj4+Pj4gKy8vIGZ1bmN0aW9ucyB3aXRo
IHRoZSBzYW1lIG5hbWUgKGZvciBkaWZmZXJlbnQgY29uZmlndXJhdGlvbnMpLgo+Pj4+Cj4+Pj4g
Q29udGV4dDogcnVsZTEgbWF0Y2hlcyBmdW5jdGlvbnMgdGhhdCBoYXZlIGFsbCB0aHJlZSBvZgo+
Pj4+Cj4+Pj4gKiBhbiBFcnJvciAqKmVycnAgcGFyYW1ldGVyCj4+Pj4KPj4+PiAqIGFuIEVycm9y
ICpsb2NhbF9lcnIgPSBOVUxMIHZhcmlhYmxlIGRlY2xhcmF0aW9uCj4+Pj4KPj4+PiAqIGFuIGVy
cm9yX3Byb3BhZ2F0ZShlcnJwLCBsb2NhbF9lcnIpIG9yIGVycm9yX3Byb3BhZ2F0ZV9wcmVwZW5k
KGVycnAsCj4+Pj4gICAgIGxvY2FsX2VyciwgLi4uKSBleHByZXNzaW9uLCB3aGVyZSBAZXJycCBp
cyB0aGUgcGFyYW1ldGVyIGFuZAo+Pj4+ICAgICBAbG9jYWxfZXJyIGlzIHRoZSB2YXJpYWJsZS4K
Pj4+Pgo+Pj4+IElmIEkgdW5kZXJzdGFuZCB5b3UgY29ycmVjdGx5LCB5b3UncmUgcG9pbnRpbmcg
b3V0IHR3byBwb3RlbnRpYWwgaXNzdWVzOgo+Pj4+Cj4+Pj4gMS4gVGhpcyBydWxlIGNhbiBtYXRj
aCBmdW5jdGlvbnMgcnVsZTEgZG9lcyBub3QgbWF0Y2ggaWYgdGhlcmUgaXMKPj4+PiBhbm90aGVy
IGZ1bmN0aW9uIHdpdGggdGhlIHNhbWUgbmFtZSB0aGF0IHJ1bGUxIGRvZXMgbWF0Y2guCj4+Pj4K
Pj4+PiAyLiBUaGlzIHJ1bGUgbWF0Y2hlcyBpbiB0aGUgZW50aXJlIGZ1bmN0aW9uIG1hdGNoZWQg
YnkgcnVsZTEsIGV2ZW4gd2hlbgo+Pj4+IHBhcnRzIG9mIHRoYXQgZnVuY3Rpb24gdXNlIGEgZGlm
ZmVyZW50IEBlcnJwIG9yIEBsb2NhbF9lcnIuCj4+Pj4KPj4+PiBJIGZpZ3VyZSB0aGVzZSBhcHBs
eSB0byBhbGwgcnVsZXMgd2l0aCBpZGVudGlmaWVyIHJ1bGUxLmZuLCBub3QganVzdAo+Pj4+IHRo
aXMgb25lLiAgQ29ycmVjdD8KPj4+Pgo+Pj4+IFJlZ2FyZGluZyAxLiAgVGhlcmUgbXVzdCBiZSBh
IGJldHRlciB3YXkgdG8gY2hhaW4gcnVsZXMgdG9nZXRoZXIsIGJ1dCBJCj4+Pj4gZG9uJ3Qga25v
dyBpdC4KPj4+Cj4+PiBIbW0sIHdoYXQgYWJvdXQgc29tZXRoaW5nIGxpa2UgdGhpczoKPj4+Cj4+
PiBAcnVsZTEgZGlzYWJsZSBvcHRpb25hbF9xdWFsaWZpZXIgZXhpc3RzQAo+Pj4gaWRlbnRpZmll
ciBmbiwgbG9jYWxfZXJyOwo+Pj4gc3ltYm9sIGVycnA7Cj4+PiBAQAo+Pj4KPj4+ICAgZm4oLi4u
LCBFcnJvciAqKgo+Pj4gLSBlcnJwCj4+PiArIF9fX2VycnBfY29jY2luZWxsZV91cGRhdGluZ19f
Xwo+Pj4gICAgICAsIC4uLikKPj4+ICAgewo+Pj4gICAgICAgLi4uCj4+PiAgICAgICBFcnJvciAq
bG9jYWxfZXJyID0gTlVMTDsKPj4+ICAgICAgIC4uLgo+Pj4gKAo+Pj4gICAgICBlcnJvcl9wcm9w
YWdhdGVfcHJlcGVuZChlcnJwLCBsb2NhbF9lcnIsIC4uLik7Cj4+PiB8Cj4+PiAgICAgIGVycm9y
X3Byb3BhZ2F0ZShlcnJwLCBsb2NhbF9lcnIpOwo+Pj4gKQo+Pj4gICAgICAgLi4uCj4+PiAgIH0K
Pj4+Cj4+Pgo+Pj4gWy4uXQo+Pj4KPj4+IG1hdGNoIHN5bWJvbCBfX19lcnJwX2NvY2NpbmVsbGVf
dXBkYXRpbmdfX18gaW4gZm9sbG93aW5nIHJ1bGVzIGluIGZ1bmN0aW9uIGhlYWRlcgo+Pj4KPj4+
IFsuLl0KPj4+Cj4+Pgo+Pj4gQCBkaXNhYmxlIG9wdGlvbmFsX3F1YWxpZmllckAKPj4+IGlkZW50
aWZpZXIgZm4sIGxvY2FsX2VycjsKPj4+IHN5bWJvbCBlcnJwOwo+Pj4gQEAKPj4+Cj4+PiAgIGZu
KC4uLiwgRXJyb3IgKioKPj4+IC0gX19fZXJycF9jb2NjaW5lbGxlX3VwZGF0aW5nX19fCj4+PiAr
IGVycnAKPj4+ICAgICAgLCAuLi4pCj4+PiAgIHsKPj4+ICAgICAgIC4uLgo+Pj4gICB9Cj4+Pgo+
Pj4KPj4+IC0gaGFja3ksIGJ1dCBzZWVtcyBub3QgbW9yZSBoYWNreSB0aGFuIHB5dGhvbiBkZXRl
Y3Rpb24sIGFuZCBzaG91bGQgd29yayBiZXR0ZXIKPj4KPj4gQXMgc2ltcGxlLCBmb3JjZWZ1bCBh
bmQgdW5zdWJ0bGUgYXMgYSBzbGVkZ2VoYW1tZXIuICBJIGxpa2UgaXQgOikKPj4KPgo+Cj4gSG1t
LCBub3Qgc28gc2ltcGxlLgo+Cj4gSXQgbGVhZHMgdG8gcmVpbmRlbnRpbmcgb2YgZnVuY3Rpb24g
aGVhZGVyLCB3aGljaCBpcyBiYWQuCgpCZWNhdXNlIF9fX2VycnBfY29jY2luZWxsZV91cGRhdGlu
Z19fXyBpcyBsb25nZXIgdGhhbiBlcnJwLCBJIGd1ZXNzLgpUcnkgX19fXz8KCj4gUG9zc2libGUg
c29sdXRpb24gaXMgaW5zdGVhZAo+Cj4gZm4oLi4uKQo+IHsKPiArICAgX19fZXJycF9jb2NjaW5l
bGxlX3VwZGF0aW5nX19fKCk7Cj4KPgo+IGJ1dCB0aGlzIHNsb3cgZG93biBjb2NjaW5lbGxlLiBG
b3IgZXhhbXBsZSwgb24gYmxvY2suYyBmcm9tIH4zcyB0byAxbTE2cy4KPgo+IC4KPgo+IFNvLCBJ
J20gcmV0dXJuaW5nIHRvIGp1c3QgYSB3YXJuaW5nLgo+Cj4gSSB0aGluayBzb21ldGhpbmcgc2lt
cGxlIGxpa2UKPgo+IEBACj4gaWRlbnRpZmllciBydWxlMS5mbjsKPiBwb3NpdGlvbiBwICE9IHJ1
bGUxLnA7Cj4gQEAKPgo+IGZuQHAoLi4uKSB7Li4ufQo+Cj4gQCBzY3JpcHQ6cHl0aG9uQAo+Cj4g
PHByaW50IHdhcm5pbmc+Cj4KPiBzaG91bGQgd29yay4KClVwIHRvIHlvdS4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
