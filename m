Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F32168D99
	for <lists+xen-devel@lfdr.de>; Sat, 22 Feb 2020 09:28:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5Q57-00048l-WB; Sat, 22 Feb 2020 08:24:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cztt=4K=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1j5Q56-00048e-CD
 for xen-devel@lists.xenproject.org; Sat, 22 Feb 2020 08:24:12 +0000
X-Inumbo-ID: b3466695-554c-11ea-87db-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b3466695-554c-11ea-87db-12813bfff9fa;
 Sat, 22 Feb 2020 08:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582359851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T45vrP9XIhTb9vS7RjFPPl1JpkYIOutb0fUu3RFTTrw=;
 b=Ibknjp5yCD9t8t8M1bLmQSxRwMfGL24Jt/+owGZ9h5EqoQ24qkat4Tr6Rwln85defxydlu
 ffKxfpWGYsQ6H0UTCWxUjW5DqwfcGv5Khgun91oUtol/h82gp9FTvZvjEHzEvN0UWOJONJ
 IftnMcfhyMG6bv0kjqgqkg2xesXmQ40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-52XP2uA5M1qKR3W2VghM7A-1; Sat, 22 Feb 2020 03:24:09 -0500
X-MC-Unique: 52XP2uA5M1qKR3W2VghM7A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4A4C189F760;
 Sat, 22 Feb 2020 08:24:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F176391;
 Sat, 22 Feb 2020 08:24:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A616511386A6; Sat, 22 Feb 2020 09:23:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
 <20200131130118.1716-2-vsementsov@virtuozzo.com>
 <87d0a88k6d.fsf@dusky.pond.sub.org>
 <7856fcbb-8c01-aba3-a11b-63058c117362@virtuozzo.com>
 <875zfz6gsh.fsf@dusky.pond.sub.org>
 <064ca8e9-458e-c780-92a0-05f40cf0975b@virtuozzo.com>
Date: Sat, 22 Feb 2020 09:23:59 +0100
In-Reply-To: <064ca8e9-458e-c780-92a0-05f40cf0975b@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 21 Feb 2020 20:31:55 +0300")
Message-ID: <87sgj31140.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v7 01/11] qapi/error: add (Error **errp)
 cleaning APIs
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
 Laszlo Ersek <lersek@redhat.com>, Markus Armbruster <armbru@redhat.com>,
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
cml0ZXM6Cgo+IDIxLjAyLjIwMjAgMTk6MzQsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+PiBW
bGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdy
aXRlczoKPj4KPj4+IDIxLjAyLjIwMjAgMTA6MzgsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+
Pj4+IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNv
bT4gd3JpdGVzOgo+Pj4+Cj4+Pj4+IEFkZCBmdW5jdGlvbnMgdG8gY2xlYW4gRXJyb3IgKiplcnJw
OiBjYWxsIGNvcnJlc3BvbmRpbmcgRXJyb3IgKmVycgo+Pj4+PiBjbGVhbmluZyBmdW5jdGlvbiBh
biBzZXQgcG9pbnRlciB0byBOVUxMLgo+Pj4+Pgo+Pj4+PiBOZXcgZnVuY3Rpb25zOgo+Pj4+PiAg
ICAgZXJyb3JfZnJlZV9lcnJwCj4+Pj4+ICAgICBlcnJvcl9yZXBvcnRfZXJycAo+Pj4+PiAgICAg
d2Fybl9yZXBvcnRfZXJycAo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBTZW1l
bnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+Cj4+Pj4+IFJldmlld2Vk
LWJ5OiBHcmVnIEt1cnogPGdyb3VnQGthb2Qub3JnPgo+Pj4+PiBSZXZpZXdlZC1ieTogRXJpYyBC
bGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+Cj4+Pj4+IC0tLQo+Pj4+Pgo+Pj4+PiBDQzogRXJpYyBC
bGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+Cj4+Pj4+IENDOiBLZXZpbiBXb2xmIDxrd29sZkByZWRo
YXQuY29tPgo+Pj4+PiBDQzogTWF4IFJlaXR6IDxtcmVpdHpAcmVkaGF0LmNvbT4KPj4+Pj4gQ0M6
IEdyZWcgS3VyeiA8Z3JvdWdAa2FvZC5vcmc+Cj4+Pj4+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4+Pj4+IENDOiBBbnRob255IFBlcmFyZCA8YW50aG9u
eS5wZXJhcmRAY2l0cml4LmNvbT4KPj4+Pj4gQ0M6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3Jn
Pgo+Pj4+PiBDQzogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgo+Pj4+PiBD
QzogIlBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIiA8cGhpbG1kQHJlZGhhdC5jb20+Cj4+Pj4+IEND
OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgo+Pj4+PiBDQzogR2VyZCBIb2ZmbWFu
biA8a3JheGVsQHJlZGhhdC5jb20+Cj4+Pj4+IENDOiBTdGVmYW4gQmVyZ2VyIDxzdGVmYW5iQGxp
bnV4LmlibS5jb20+Cj4+Pj4+IENDOiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5j
b20+Cj4+Pj4+IENDOiBNaWNoYWVsIFJvdGggPG1kcm90aEBsaW51eC52bmV0LmlibS5jb20+Cj4+
Pj4+IENDOiBxZW11LWJsb2NrQG5vbmdudS5vcmcKPj4+Pj4gQ0M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwo+Pj4+Pgo+Pj4+PiAgICBpbmNsdWRlL3FhcGkvZXJyb3IuaCB8IDI2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNl
cnRpb25zKCspCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3FhcGkvZXJyb3IuaCBi
L2luY2x1ZGUvcWFwaS9lcnJvci5oCj4+Pj4+IGluZGV4IGFkNWI2ZTg5NmQuLmQzNDk4NzE0OGQg
MTAwNjQ0Cj4+Pj4+IC0tLSBhL2luY2x1ZGUvcWFwaS9lcnJvci5oCj4+Pj4+ICsrKyBiL2luY2x1
ZGUvcWFwaS9lcnJvci5oCj4+Pj4+IEBAIC0zMDksNiArMzA5LDMyIEBAIHZvaWQgd2Fybl9yZXBv
cnRmX2VycihFcnJvciAqZXJyLCBjb25zdCBjaGFyICpmbXQsIC4uLikKPj4+Pj4gICAgdm9pZCBl
cnJvcl9yZXBvcnRmX2VycihFcnJvciAqZXJyLCBjb25zdCBjaGFyICpmbXQsIC4uLikKPj4+Pj4g
ICAgICAgIEdDQ19GTVRfQVRUUigyLCAzKTsKPj4+Pj4gICAgKy8qCj4+Pj4+ICsgKiBGdW5jdGlv
bnMgdG8gY2xlYW4gRXJyb3IgKiplcnJwOiBjYWxsIGNvcnJlc3BvbmRpbmcgRXJyb3IgKmVyciBj
bGVhbmluZwo+Pj4+PiArICogZnVuY3Rpb24sIHRoZW4gc2V0IHBvaW50ZXIgdG8gTlVMTC4KPj4+
Pj4gKyAqLwo+Pj4+PiArc3RhdGljIGlubGluZSB2b2lkIGVycm9yX2ZyZWVfZXJycChFcnJvciAq
KmVycnApCj4+Pj4+ICt7Cj4+Pj4+ICsgICAgYXNzZXJ0KGVycnAgJiYgKmVycnApOwo+Pj4+PiAr
ICAgIGVycm9yX2ZyZWUoKmVycnApOwo+Pj4+PiArICAgICplcnJwID0gTlVMTDsKPj4+Pj4gK30K
Pj4+Pj4gKwo+Pj4+PiArc3RhdGljIGlubGluZSB2b2lkIGVycm9yX3JlcG9ydF9lcnJwKEVycm9y
ICoqZXJycCkKPj4+Pj4gK3sKPj4+Pj4gKyAgICBhc3NlcnQoZXJycCAmJiAqZXJycCk7Cj4+Pj4+
ICsgICAgZXJyb3JfcmVwb3J0X2VycigqZXJycCk7Cj4+Pj4+ICsgICAgKmVycnAgPSBOVUxMOwo+
Pj4+PiArfQo+Pj4+PiArCj4+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgd2Fybl9yZXBvcnRfZXJy
cChFcnJvciAqKmVycnApCj4+Pj4+ICt7Cj4+Pj4+ICsgICAgYXNzZXJ0KGVycnAgJiYgKmVycnAp
Owo+Pj4+PiArICAgIHdhcm5fcmVwb3J0X2VycigqZXJycCk7Cj4+Pj4+ICsgICAgKmVycnAgPSBO
VUxMOwo+Pj4+PiArfQo+Pj4+PiArCj4+Pj4+ICsKPj4+Pj4gICAgLyoKPj4+Pj4gICAgICogSnVz
dCBsaWtlIGVycm9yX3NldGcoKSwgZXhjZXB0IHlvdSBnZXQgdG8gc3BlY2lmeSB0aGUgZXJyb3Ig
Y2xhc3MuCj4+Pj4+ICAgICAqIE5vdGU6IHVzZSBvZiBlcnJvciBjbGFzc2VzIG90aGVyIHRoYW4g
RVJST1JfQ0xBU1NfR0VORVJJQ19FUlJPUiBpcwo+Pj4+Cj4+Pj4gVGhlc2UgYXBwZWFyIHRvIGJl
IHVudXNlZCBhcGFydCBmcm9tIHRoZSBDb2NjaW5lbGxlIHNjcmlwdCBpbiBQQVRDSCAwMy4KPj4+
Pgo+Pj4+IFRoZXkgYXJlIHVzZWQgaW4gdGhlIGZ1bGwgIltSRkMgdjUgMDAwLzEyNl0gZXJyb3I6
IGF1dG8gcHJvcGFnYXRlZAo+Pj4+IGxvY2FsX2VyciIgc2VyaWVzLiAgT3B0aW9uczoKPj4+Pgo+
Pj4+IDEuIFBpY2sgYSBmZXcgbW9yZSBwYXRjaGVzIGludG8gdGhpcyBwYXJ0IEkgc2VyaWVzLCBz
byB0aGVzZSBndXlzIGNvbWUKPj4+PiAgICAgIHdpdGggdXNlcnMuCj4+Pgo+Pj4gSXQgbmVlZHMg
c29tZSBhZGRpdGlvbmFsIGVmZm9ydCBmb3IgdGhpcyBzZXJpZXMuLiBCdXQgaXQncyBwb3NzaWJs
ZS4gU3RpbGwsCj4+PiBJIHRoaW5rIHRoYXQgd2UgYXQgbGVhc3Qgc2hvdWxkIG5vdCBwdWxsIG91
dCBwYXRjaGVzIHdoaWNoIHNob3VsZCBiZSBpbgo+Pj4gZnV0dXJlIHNlcmllcyAoZm9yIGV4YW1w
bGUgZnJvbSBwcGMgb3IgYmxvY2svKS4uCj4+Cj4+IFllcywgd2Ugd2FudCB0byBrZWVwIHJlbGF0
ZWQgc3R1ZmYgdG9nZXRoZXIuCj4+Cj4+PiBHcmVwcGluZyB0aHJvdWdoIHY1Ogo+Pj4gICBmb3Ig
eCBpbiB7d2Fybl9yZXBvcnRfZXJycCxlcnJvcl9yZXBvcnRfZXJycCxlcnJvcl9mcmVlX2VycnB9
OyBkbyBlY2hvID09ICR4ID09OyBnaXQgZ3JlcCAtbCAkeCB8IGdyZXAgLXYgY29jY2luZWxsZSB8
IGdyZXAgLXYgJ2Vycm9yXC5oJzsgZWNobzsgZG9uZQo+Pj4gPT0gd2Fybl9yZXBvcnRfZXJycCA9
PQo+Pj4gYmxvY2svZmlsZS1wb3NpeC5jCj4+PiBody9wcGMvc3BhcHIuYwo+Pj4gaHcvcHBjL3Nw
YXByX2NhcHMuYwo+Pj4gaHcvcHBjL3NwYXByX2lycS5jCj4+PiBody92ZmlvL3BjaS5jCj4+PiBu
ZXQvdGFwLmMKPj4+IHFvbS9vYmplY3QuYwo+Pj4KPj4+ID09IGVycm9yX3JlcG9ydF9lcnJwID09
Cj4+PiBody9ibG9jay92aG9zdC11c2VyLWJsay5jCj4+PiB1dGlsL29zbGliLXBvc2l4LmMKPj4+
Cj4+PiA9PSBlcnJvcl9mcmVlX2VycnAgPT0KPj4+IGJsb2NrLmMKPj4+IGJsb2NrL3FhcGkuYwo+
Pj4gYmxvY2svc2hlZXBkb2cuYwo+Pj4gYmxvY2svc25hcHNob3QuYwo+Pj4gYmxvY2tkZXYuYwo+
Pj4gY2hhcmRldi9jaGFyLXNvY2tldC5jCj4+PiBody9hdWRpby9pbnRlbC1oZGEuYwo+Pj4gaHcv
Y29yZS9xZGV2LXByb3BlcnRpZXMuYwo+Pj4gaHcvcGNpLWJyaWRnZS9wY2lfYnJpZGdlX2Rldi5j
Cj4+PiBody9wY2ktYnJpZGdlL3BjaWVfcGNpX2JyaWRnZS5jCj4+PiBody9zY3NpL21lZ2FzYXMu
Ywo+Pj4gaHcvc2NzaS9tcHRzYXMuYwo+Pj4gaHcvdXNiL2hjZC14aGNpLmMKPj4+IGlvL25ldC1s
aXN0ZW5lci5jCj4+PiBtaWdyYXRpb24vY29sby5jCj4+PiBxZ2EvY29tbWFuZHMtcG9zaXguYwo+
Pj4gcWdhL2NvbW1hbmRzLXdpbjMyLmMKPj4+IHV0aWwvcWVtdS1zb2NrZXRzLmMKPj4+Cj4+PiBX
aGF0IGRvIHlvdSB3YW50IHRvIGFkZD8KPj4KPj4gUEFUQ0ggdjUgMDMyIHVzZXMgYm90aCBlcnJv
cl9yZXBvcnRfZXJycCgpIGFuZCBlcnJvcl9mcmVlX2VycnAoKS4KPj4gQWRkaW5nIHdhcm5fcmVw
b3J0X2VycnAoKSB3aXRob3V0IGEgdXNlciBpcyBva2F5IHdpdGggbWUuICBXaGF0IGRvIHlvdQo+
PiB0aGluaz8KPj4KPj4gSWYgdGhlcmUgYXJlIHBhdGNoZXMgeW91IGNvbnNpZGVyIHJlbGF0ZWQg
dG8gMDMyLCBmZWVsIGZyZWUgdG8gdGhyb3cKPj4gdGhlbSBpbi4KPgo+IDAzMiBpcyBxZ2EvY29t
bWFuZHMtd2luMzIuYyBhbmQgdXRpbC9vc2xpYi1wb3NpeC5jCj4KPiBTZWVtcyB0aGF0IHRoZXkg
YXJlIHdyb25nbHkgZ3JvdXBlZCBpbnRvIG9uZSBwYXRjaC4KPgo+IHFnYS9jb21tYW5kcy13aW4z
Mi5jIG1hdGNoZXMgcWdhLyAoTWljaGFlbCBSb3RoKQo+IGFuZCAgdXRpbC9vc2xpYi1wb3NpeC5j
IG1hdGNoZXMgUE9TSVggKFBhb2xvIEJvbnppbmkpCj4KPiBTbywgaXQgc2hvdWxkIGJlIHR3byBz
ZXBhcmF0ZSBwYXRjaGVzIGFueXdheS4KPgo+IEZvciBbMS5dIEkgb25seSBhZnJhaWQgdGhhdCB3
ZSdsbCBoYXZlIHRvIHdhaXQgZm9yIG1haW50YWluZXJzLCB3aG8gd2VyZQo+IG5vdCBpbnRlcmVz
dGVkIGluIHByZXZpb3VzIGl0ZXJhdGlvbnMsIHRvIHJldmlldyB0aGVzZSBuZXcgcGF0Y2hlcy4u
CgpXZSB3b24ndC4KCldlIHNob3VsZCBhbmQgd2Ugd2lsbCBnaXZlIGV2ZXJ5IG1haW50YWluZXIg
YSBjaGFuY2UgdG8gcmV2aWV3IHRoZXNlCnBhdGNoZXMsIGV2ZW4gdGhvdWdoIHRoZSBjaGFuZ2Vz
IGFyZSBtZWNoYW5pY2FsLiAgTWFpbnRhaW5lcnMgYXJlIGZyZWUKdG8gZGVjbGluZSBvciBpZ25v
cmUgdGhpcyBvZmZlci4gIEkgd2lsbCBmZWVsIGZyZWUgdG8gaW50ZXJwcmV0IHRoYXQgYXMKImdv
IGFoZWFkIGFuZCBtZXJnZSB0aGlzIHRocm91Z2ggeW91ciB0cmVlIi4KCkluIGZhY3QsIEkgZnVs
bHkgZXhwZWN0IHRoZSBidWxrIG9mIHRoZSBjaGFuZ2VzIHRvIGdvIHRocm91Z2ggbXkgdHJlZS4K
Q2hhc2luZyB1bXB0ZWVuIG1haW50YWluZXJzIGZvciBlYWNoIG9uZSB0byBtZXJnZSBhIHRyaXZp
YWwgcGFydCBvZiB0aGlzCm1hc3NpdmUgdHJlZS13aWRlIGNoYW5nZSB3b3VsZCB0YWtlIGFnZXMg
YW5kIGFjY29tcGxpc2ggbm90aGluZy4KClsuLi5dCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
