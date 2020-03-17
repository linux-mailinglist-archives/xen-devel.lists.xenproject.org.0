Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C52187E8B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 11:42:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jE9dI-0001oy-Of; Tue, 17 Mar 2020 10:39:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4v0i=5C=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jE9dH-0001ot-7V
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 10:39:35 +0000
X-Inumbo-ID: 977e82be-683b-11ea-92cf-bc764e2007e4
Received: from us-smtp-delivery-74.mimecast.com (unknown [63.128.21.74])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 977e82be-683b-11ea-92cf-bc764e2007e4;
 Tue, 17 Mar 2020 10:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584441573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I7/q2r8eHhu1Tof18xlulApDVDHs4u/ktWqfFPWtBs4=;
 b=hNwtkO0ehnJ6CtDr6HGnPqXtQTARhxcS9xj1lV/tJ7A2m9NCH28dTHXvUoeBPeneiWYCsn
 HclbqHB2lWr5ArNtEAeIJwssPlFAHqPFhZ2NUV+U5qqm05pPR9zh91q4d1B0hpkVaKGkUy
 PEXmkMSjkOrCPHkP/q2kRKzwXayB7bY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-zcAcngZvNz2rTbBFGklYBg-1; Tue, 17 Mar 2020 06:39:30 -0400
X-MC-Unique: zcAcngZvNz2rTbBFGklYBg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8261D18B9F19;
 Tue, 17 Mar 2020 10:39:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C70AB5C1BB;
 Tue, 17 Mar 2020 10:39:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4B7831138404; Tue, 17 Mar 2020 11:39:21 +0100 (CET)
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
Date: Tue, 17 Mar 2020 11:39:21 +0100
In-Reply-To: <db2fa8a3-48cc-51aa-a3d5-eba88fb29f66@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 17 Mar 2020 12:29:13 +0300")
Message-ID: <87wo7jqn8m.fsf@dusky.pond.sub.org>
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
cml0ZXM6Cgo+IDE2LjAzLjIwMjAgMTE6MjEsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+PiBW
bGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdy
aXRlczoKPj4KPj4+IE9uIDE0LjAzLjIwMjAgMDA6NTQsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3Rl
Ogo+Pj4+IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpv
LmNvbT4gd3JpdGVzOgo+Pj4+Cj4+Pj4+IDEzLjAzLjIwMjAgMTg6NDIsIE1hcmt1cyBBcm1icnVz
dGVyIHdyb3RlOgo+Pj4+Pj4gVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNv
dkB2aXJ0dW96em8uY29tPiB3cml0ZXM6Cj4+Pj4+Pgo+Pj4+Pj4+IDEyLjAzLjIwMjAgMTk6MzYs
IE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+Pj4+Pj4+PiBJIG1heSBoYXZlIGEgc2Vjb25kIGxv
b2sgdG9tb3Jyb3cgd2l0aCBmcmVzaGVyIGV5ZXMsIGJ1dCBsZXQncyBnZXQgdGhpcwo+Pj4+Pj4+
PiBvdXQgbm93IGFzIGlzLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBWbGFkaW1pciBTZW1lbnRzb3YtT2dp
ZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdyaXRlczoKWy4uLl0KPj4+Pj4+Pj4+
ICtAQAo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gKyBmbiguLi4sIEVycm9yICoqIF9fX18sIC4uLikK
Pj4+Pj4+Pj4+ICsgewo+Pj4+Pj4+Pj4gKyAgICAgLi4uCj4+Pj4+Pj4+PiArICAgICBFcnJvciAq
bG9jYWxfZXJyID0gTlVMTDsKPj4+Pj4+Pj4+ICsgICAgIC4uLiB3aGVuIGFueQo+Pj4+Pj4+Pj4g
KyAgICAgRXJyb3IgKmxvY2FsX2VycjIgPSBOVUxMOwo+Pj4+Pj4+Pj4gKyAgICAgLi4uIHdoZW4g
YW55Cj4+Pj4+Pj4+PiArIH0KPj4+Pgo+Pj4+IFRoaXMgZmxhZ3MgZnVuY3Rpb25zIHRoYXQgaGF2
ZSBtb3JlIHRoYW4gb25lIGRlY2xhcmF0aW9uIGFsb25nIGFueQo+Pj4+IGNvbnRyb2wgZmxvdyBw
YXRoLiAgSXQgZG9lc24ndCBmbGFnIHRoaXMgb25lOgo+Pj4+Cj4+Pj4gICAgICAgdm9pZCBnbmF0
KGJvb2wgYiwgRXJyb3IgKiplcnJwKQo+Pj4+ICAgICAgIHsKPj4+PiAgICAgICAgICAgaWYgKGIp
IHsKPj4+PiAgICAgICAgICAgICAgIEVycm9yICpsb2NhbF9lcnIgPSBOVUxMOwo+Pj4+ICAgICAg
ICAgICAgICAgZm9vKGFyZywgJmxvY2FsX2Vycik7Cj4+Pj4gICAgICAgICAgICAgICBlcnJvcl9w
cm9wYWdhdGUoZXJycCwgbG9jYWxfZXJyKTsKPj4+PiAgICAgICAgICAgfSBlbHNlIHsKPj4+PiAg
ICAgICAgICAgICAgIEVycm9yICpsb2NhbF9lcnIgPSBOVUxMOwo+Pj4+ICAgICAgICAgICAgICAg
YmFyKGFyZywgJmxvY2FsX2Vycik7Cj4+Pj4gICAgICAgICAgICAgICBlcnJvcl9wcm9wYWdhdGUo
ZXJycCwgbG9jYWxfZXJyKTsKPj4+PiAgICAgICAgICAgfQo+Pj4+ICAgICAgIH0KPj4+Pgo+Pj4+
IFRoZSBDb2NjaW5lbGxlIHNjcmlwdCBkb2VzIHRoZSByaWdodCB0aGluZyBmb3IgdGhpcyBvbmUg
cmVnYXJkbGVzcy4KPj4+Pgo+Pj4+IEknZCBwcmVmZXIgdG8gaGF2ZSBzdWNoIGZ1bmN0aW9ucyBm
bGFnZ2VkLCB0b28uICBCdXQgc3BlbmRpbmcgdGltZSBvbgo+Pj4+IGNvbnZpbmNpbmcgQ29jY2lu
ZWxsZSB0byBkbyBpdCBmb3IgbWUgaXMgbm90IHdvcnRod2hpbGU7IEkgY2FuIHNpbXBseQo+Pj4+
IHNlYXJjaCB0aGUgZGlmZiBwcm9kdWNlZCBieSBDb2NjaW5lbGxlIGZvciBkZWxldGlvbnMgb2Yg
ZGVjbGFyYXRpb25zCj4+Pj4gdGhhdCBhcmUgbm90IGluZGVudGVkIGV4YWN0bHkgZm91ciBzcGFj
ZXMuCj4+Pj4KPj4+PiBCdXQgaWYgd2Uga2VlcCB0aGlzIHJ1bGUsIHdlIHNob3VsZCBhZGp1c3Qg
aXRzIGNvbW1lbnQKPj4+Pgo+Pj4+ICAgICAgIC8vIFdhcm4gc2V2ZXJhbCBFcnJvciAqIGRlZmlu
aXRpb25zLgo+Pj4+Cj4+Pj4gYmVjYXVzZSBpdCBzdXJlIHN1Z2dlc3RzIGl0IGFsc28gY2F0Y2hl
cyBmdW5jdGlvbnMgbGlrZSB0aGUgb25lIEkgZ2F2ZQo+Pj4+IGFib3ZlLgo+Pj4KPj4+IEhtbSwg
eWVzLi4gV2UgY2FuIHdyaXRlICJXYXJuIHNldmVyYWwgRXJyb3IgKiBkZWZpbml0aW9ucyBpbiBf
b25lXwo+Pj4gY29udHJvbCBmbG93IChpdCdzIG5vdCBzbyB0cml2aWFsIHRvIG1hdGNoIF9hbnlf
IGNhc2Ugd2l0aCBzZXZlcmFsCj4+PiBkZWZpbml0aW9ucyB3aXRoIGNvY2NpbmVsbGUpIiBvciBz
b21ldGhpbmcgbGlrZSB0aGlzLgo+Pgo+PiBIYSwgInRyaXZpYWwiIHJlbWluZHMgbWUgb2YgYSBz
dG9yeS4gIFRoZSBtYXRoIHByb2Zlc3NvciwgYWZ0ZXIgaGF2aW5nCj4+IHNwZW50IGEgZ29vZCBj
aHVuayBvZiBoaXMgbGVjdHVyZSBkZXZlbG9waW5nIGEgcHJvb2Ygb24gdGhlIGJsYWNrYm9hZAo+
PiB0dXJucyB0byB0aGUgYXVkaWVuY2UgdG8gZXhwbGFpbiB3aHkgdGhpcyBsaXR0bGUgcGFydCBk
b2Vzbid0IHJlcXVpcmUKPj4gcHJvb2Ygd2l0aCB0aGUgd29yZHMgZmFtaWxpYXIgdG8gYW55IG1h
dGggc3R1ZGVudCAiYW5kIHRoaXMgaXMgdHJpdmlhbC4iCj4+IFBhdXNlLCBwdXp6bGVkIGxvb2su
Li4gICJJcyBpdCB0cml2aWFsPyIgIFBhdXNlLCBzdG9ybXMgb3V0IG9mIHRoZQo+PiBsZWN0dXJl
IGhhbGwuICBBIG1pbnV0ZSBvciB0aHJlZSBwYXNzLiAgUHJvZmVzc29yIGNvbWVzIGJhY2sgYmVh
bWluZywKPj4gIml0IGlzIHRyaXZpYWwhIiwgYW5kIHByb2NlZWRzIHdpdGggdGhlIHByb29mLgo+
Pgo+PiBNeSBwb2ludCBpczogaXQgbWlnaHQgYmUgdHJpdmlhbCB3aXRoIENvY2NpbmVsbGUgb25j
ZSB5b3Uga25vdyBob3cgdG8gZG8KPj4gaXQuICBXZSBkb24ndC4KPj4KPj4gU3VnZ2VzdCAiKGNh
bid0IGZpZ3VyZSBvdXQgaG93IHRvIG1hdGNoIHNldmVyYWwgZGVmaW5pdGlvbnMgcmVnYXJkbGVz
cwo+PiBvZiBjb250cm9sIGZsb3cpIi4KPgo+IFdyb25nIHRvbywgYmVjYXVzZSBJIGNhbjopIGZv
ciBleGFtcGxlLCBjaGFpbmluZyB0d28gcnVsZXMsIGNhdGNoaW5nIHRoZQo+IHBvc2l0aW9ucyBv
ZiBkZWZpbml0aW9uIGFuZCBjaGVjayB0aGF0IHRoZXkgYXJlIGRpZmZlcmVudC4uIE9yLCBzb21l
Cj4gY2hlYXRpbmcgd2l0aCBweXRob24gc2NyaXB0Li4gVGhhdCdzIHdoeSBJIHdyb3RlICJub3Qg
dHJpdmlhbCIsCj4KPiBTbywgbW9zdCBjb3JyZWN0IHdvdWxkIGJlICIoY2FuJ3QgZmlndXJlIG91
dCBob3cgdG8gc2ltcGx5IG1hdGNoIHNldmVyYWwgZGVmaW5pdGlvbnMgcmVnYXJkbGVzcwo+PiBv
ZiBjb250cm9sIGZsb3cpIi4KCldvcmtzIGZvciBtZS4KCj4gQnV0IGFnYWluLCBjb2NjaW5lbGxl
IGlzIGZvciBtYXRjaGluZyBjb250cm9sIGZsb3dzLCBzbyBpdHMgcHJvYmFibHkgaW1wb3NzaWJs
ZSB0byBtYXRjaCBzdWNoIHRoaW5nLi4KWy4uLl0KPj4+IE9LLCBJIGFsbW9zdCBPSyB3aXRoIGl0
LCB0aGUgb25seSB0aGluZyBJIGRvdWJ0IGEgYml0IGlzIHRoZSBmb2xsb3dpbmc6Cj4+Pgo+Pj4g
V2Ugd2FudCB0byBrZWVwIHJ1bGUxLmxvY2FsX2VyciBpbmhlcml0YW5jZSB0byBrZWVwIGNvbm5l
Y3Rpb24gd2l0aAo+Pj4gbG9jYWxfZXJyIGRlZmluaXRpb24uCj4+Cj4+IFllcy4KPj4KPj4+IElu
dGVyZXN0aW5nLCB3aGVuIHdlIGhhdmUgYm90aCBydWxlMS5mbiBhbmQgcnVsZTEubG9jYWxfZXJy
IGluaGVyaXRlZCwKPj4+IGRvIHdlIGluaGVyaXQgdGhlbSBpbiBzZXBhcmF0ZSAoaS5lLiBhbGwg
cG9zc2libGUgY29tYmluYXRpb25zIG9mIGZuCj4+PiBhbmQgbG9jYWxfZXJyIHN5bWJvbHMgZnJv
bSBydWxlMSkgb3IgZG8gd2UgaW5oZXJpdCBhIHBhaXIsIGkuZS4gb25seQo+Pj4gZm4vbG9jYWxf
ZXJyIHBhaXJzLCBmb3VuZCBieSBydWxlMT8gSWYgdGhlIGxhdHRlciBpcyBjb3JyZWN0LCB0aGF0
Cj4+PiB3aXRoIHlvdXIgc2NyaXB0IHdlIGxvc3MgdGhpcyBwYWlyIGluaGVyaXRhbmNlLCBhbmQg
Z28gdG8gYWxsIHBvc3NpYmxlCj4+PiBjb21iaW5hdGlvbnMgb2YgZm4gYW5kIGxvY2FsX2VyciBm
cm9tIHJ1bGUxLCBwb3NzaWJseSBhZGRpbmcgc29tZSB3cm9uZwo+Pj4gY29udmVyc2lvbiAoT0ss
IHlvdSd2ZSBjaGVja2VkIHRoYXQgbm8gc3VjaCBjYXNlcyBpbiBjdXJyZW50IGNvZGUgdHJlZSku
Cj4+Cj4+IFRoZSBjaGFpbmluZyAiaWRlbnRpZmllciBydWxlMS5GT08iIGlzIGJ5IG5hbWUuICBJ
dCdzIHJlbGlhYmxlIG9ubHkgYXMKPj4gbG9uZyBhcyB0aGVyZSBpcyBleGFjdGx5IG9uZSBpbnN0
YW5jZSBvZiB0aGUgbmFtZS4KPj4KPj4gV2UgYWxyZWFkeSBkaXNjdXNzZWQgdGhlIGNhc2Ugb2Yg
dGhlIGZ1bmN0aW9uIG5hbWU6IGlmIHRoZXJlIGFyZSB0d28KPj4gaW5zdGFuY2VzIG9mIGZvbygp
LCBhbmQgcnVsZTEgbWF0Y2hlcyBvbmx5IG9uZSBvZiB0aGVtLCB0aGVuIHdlCj4+IG5ldmVydGhl
bGVzcyBhcHBseSB0aGUgcnVsZXMgY2hhaW5lZCB0byBydWxlMSB0byBib3RoLiAgQmVjYXVzZSB0
aGF0IGNhbgo+PiBiZSB3cm9uZywgeW91IGNhbWUgdXAgd2l0aCB0aGUgX19fIHRyaWNrLCB3aGlj
aCBjaGFpbnMgcmVsaWFibHkuCj4+Cj4+IFRoZSBzYW1lIGlzc3VlIGV4aXN0cyB3aXRoIHRoZSB2
YXJpYWJsZSBuYW1lOiBpZiB0aGVyZSBhcmUgdHdvIGluc3RhbmNlcwo+PiBvZiBAbG9jYWxfZXJy
LCBhbmQgcnVsZTEgbWF0Y2hlcyBvbmx5IG9uZSBvZiB0aGVtLCB0aGVuIHdlIG5ldmVydGhlbGVz
cwo+PiBhcHBseSB0aGUgcnVsZXMgY2hhaW5lZCB0byBydWxlMSB0byBib3RoLiAgQ2FuIGFsc28g
YmUgd3JvbmcuCj4+Cj4+IFdoYXQgYXJlIHRoZSBjb25kaXRpb25zIGZvciAid3JvbmciPwo+Pgo+
PiBCZWNhdXNlIHRoZSBfX18gY2hhaW5pbmcgaXMgcmVsaWFibGUsIHdlIGtub3cgcnVsZTEgbWF0
Y2hlZCB0aGUKPj4gZnVuY3Rpb24sIGkuZS4gaXQgaGFzIGEgcGFyYW1ldGVyIEVycm9yICoqZXJy
cCwgYW5kIGl0IGhhcyBhIGF1dG9tYXRpYwo+PiB2YXJpYWJsZSBFcnJvciAqbG9jYWxfZXJyID0g
TlVMTC4KPj4KPj4gV2UncmUgZ29vZCBhcyBsb25nIGFzICphbGwqIGlkZW50aWZpZXJzIEBsb2Nh
bF9lcnIgaW4gdGhpcyBmdW5jdGlvbiBhcmUKPj4gZGVjbGFyZWQgdGhhdCB3YXkuICBUaGlzIHNl
ZW1zIHF1aXRlIGxpa2VseS4gIEl0J3Mgbm90IGNlcnRhaW4sIHRob3VnaC4KPj4KPj4gU2luY2Ug
bmVzdGVkIGRlY2xhcmF0aW9ucyBvZiBFcnJvciAqKiB2YXJpYWJsZXMgYXJlIHJhcmUsIHdlIGNh
biByZWx5IG9uCj4+IHJldmlldyB0byBlbnN1cmUgd2UgdHJhbnNmb3JtIHRoZXNlIGZ1bmN0aW9u
cyBjb3JyZWN0bHkuCj4+Cj4+PiBTbywgZHJvcHBpbmcgaW5oZXJpdGFuY2UgaW4gY2hlY2stcnVs
ZXMgbWFrZXMgc2VuY2UsIGFzIGl0IG1heSBtYXRjaAo+Pj4gKGFuZCB3YXJuKSBtb3JlIGludGVy
ZXN0aW5nIGNhc2VzLgo+Pj4KPj4+IEJ1dCBmb3Igb3RoZXIgcnVsZXMsIEknZCBwcmVmZXJlIHRv
IGJlIHNhZmVyLCBhbmQgZXhwbGljdGx5IGluaGVyaXQgYWxsCj4+PiBhY3R1YWxseSBpbmhlcml0
ZWQgaWRlbnRpZmllcnMuLgo+Pgo+PiBJIHN0aWxsIGNhbid0IHNlZSB3aGF0IGNoYWluaW5nIGJ5
IGZ1bmN0aW9uIG5hbWUgaW4gYWRkaXRpb24gdG8gdGhlIF9fXwo+PiBjaGFpbmluZyBidXlzIHVz
Lgo+Cj4gSSdsbCBjaGVjayB0aGlzIHRoaW5nIHNvb24uIEFuZCByZXNlbmQgdG9kYXkuCj4KPj4K
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTdGlsbCwgSSBmZWVsLCB3ZSds
bCBuZXZlciBiZQo+Pj4gYWJzb2x1dGVseSBzYWZlIHdpdGggY29jY2luZWxsZSA6KQo+Pgo+PiBS
aWdodCwgYWx0aG91Z2ggdGhpcyBwYXJ0aWN1bGFyIHByb2JsZW0gaXMgbm90IHJlYWxseSBDb2Nj
aW5lbGxlJ3MKPj4gZmF1bHQuICBCbGluZGx5IHRyZWF0aW5nIGFsbCBpbnN0YW5jZXMgb2YgYSBj
ZXJ0YWluIGlkZW50aWZpZXIgaW4gYQo+PiBjZXJ0YWluIGFyZWEgdGhlIHNhbWUgcmVnYXJkbGVz
cyBvZiBob3cgdGhleSBhcmUgYm91bmQgdG8gZGVjbGFyYXRpb25zCj4+IGlzIGZ1bmRhbWVudGFs
bHkgdW5yZWxpYWJsZSwgcmVnYXJkbGVzcyBvZiB5b3VyIGFjdHVhbCB0b29saW5nLgo+Pgo+Cj4g
WWVzLCBzdGlsbCBpbnRlcmVzdGluZywgY2FuIGNvY2NpbmVsbGUgZG8gbW9yZSBzbWFydCBpbmhl
cml0YW5jZSB0byBtYXRjaAo+IGV4YWN0bHkgc2FtZSBvYmplY3QuLi4gSSB0aGluaywgSSBuZWVk
IHRvIENDIGNvY2NpbmVsbGUgbWFpbGluZyBsaXN0Cj4gdG8gdGhlIG5leHQgdmVyc2lvbgoKSSds
b3ZlIHRvIGdldCB0YXVnaHQgaG93IHRvIGNoYWluIHJlbGlhYmx5LgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
