Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7021683B1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 17:37:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5BFt-0000t9-G8; Fri, 21 Feb 2020 16:34:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F1Fm=4J=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1j5BFr-0000t4-Sy
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 16:34:19 +0000
X-Inumbo-ID: 0207ce10-54c8-11ea-aa99-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0207ce10-54c8-11ea-aa99-bc764e2007e4;
 Fri, 21 Feb 2020 16:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582302859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aKj4cP4FGitqAYdpkXtqPuo1McOAdhjb7cNvze2C/Ag=;
 b=dJxYfWE8D51geJfn+1iW1rqQpEm1YWOmU2yYaso2otZiRKejOQA6upT3DmFybabyfs86Lp
 y+jHDhecNeEo0qnVPx/7b44hWZNNGPYigUaY8RF/SbSS52plX7OnuIDSeH0+k7W31KpHhw
 gwXFcVk26iKmh2gPgnxy+3YMtt+kYgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-RPD7Q-_SMcy4O4MKRGRnYA-1; Fri, 21 Feb 2020 11:34:17 -0500
X-MC-Unique: RPD7Q-_SMcy4O4MKRGRnYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7646107ACC5;
 Fri, 21 Feb 2020 16:34:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D96687B08;
 Fri, 21 Feb 2020 16:34:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C683811386A6; Fri, 21 Feb 2020 17:34:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
 <20200131130118.1716-2-vsementsov@virtuozzo.com>
 <87d0a88k6d.fsf@dusky.pond.sub.org>
 <7856fcbb-8c01-aba3-a11b-63058c117362@virtuozzo.com>
Date: Fri, 21 Feb 2020 17:34:06 +0100
In-Reply-To: <7856fcbb-8c01-aba3-a11b-63058c117362@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 21 Feb 2020 12:20:23 +0300")
Message-ID: <875zfz6gsh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
cml0ZXM6Cgo+IDIxLjAyLjIwMjAgMTA6MzgsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+PiBW
bGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdy
aXRlczoKPj4KPj4+IEFkZCBmdW5jdGlvbnMgdG8gY2xlYW4gRXJyb3IgKiplcnJwOiBjYWxsIGNv
cnJlc3BvbmRpbmcgRXJyb3IgKmVycgo+Pj4gY2xlYW5pbmcgZnVuY3Rpb24gYW4gc2V0IHBvaW50
ZXIgdG8gTlVMTC4KPj4+Cj4+PiBOZXcgZnVuY3Rpb25zOgo+Pj4gICAgZXJyb3JfZnJlZV9lcnJw
Cj4+PiAgICBlcnJvcl9yZXBvcnRfZXJycAo+Pj4gICAgd2Fybl9yZXBvcnRfZXJycAo+Pj4KPj4+
IFNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZA
dmlydHVvenpvLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBHcmVnIEt1cnogPGdyb3VnQGthb2Qub3Jn
Pgo+Pj4gUmV2aWV3ZWQtYnk6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgo+Pj4gLS0t
Cj4+Pgo+Pj4gQ0M6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgo+Pj4gQ0M6IEtldmlu
IFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+Cj4+PiBDQzogTWF4IFJlaXR6IDxtcmVpdHpAcmVkaGF0
LmNvbT4KPj4+IENDOiBHcmVnIEt1cnogPGdyb3VnQGthb2Qub3JnPgo+Pj4gQ0M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4+IENDOiBBbnRob255IFBlcmFy
ZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPj4+IENDOiBQYXVsIER1cnJhbnQgPHBhdWxA
eGVuLm9yZz4KPj4+IENDOiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Cj4+
PiBDQzogIlBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIiA8cGhpbG1kQHJlZGhhdC5jb20+Cj4+PiBD
QzogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KPj4+IENDOiBHZXJkIEhvZmZtYW5u
IDxrcmF4ZWxAcmVkaGF0LmNvbT4KPj4+IENDOiBTdGVmYW4gQmVyZ2VyIDxzdGVmYW5iQGxpbnV4
LmlibS5jb20+Cj4+PiBDQzogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPgo+
Pj4gQ0M6IE1pY2hhZWwgUm90aCA8bWRyb3RoQGxpbnV4LnZuZXQuaWJtLmNvbT4KPj4+IENDOiBx
ZW11LWJsb2NrQG5vbmdudS5vcmcKPj4+IENDOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKPj4+Cj4+PiAgIGluY2x1ZGUvcWFwaS9lcnJvci5oIHwgMjYgKysrKysrKysrKysrKysrKysr
KysrKysrKysKPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9xYXBpL2Vycm9yLmggYi9pbmNsdWRlL3FhcGkvZXJyb3IuaAo+
Pj4gaW5kZXggYWQ1YjZlODk2ZC4uZDM0OTg3MTQ4ZCAxMDA2NDQKPj4+IC0tLSBhL2luY2x1ZGUv
cWFwaS9lcnJvci5oCj4+PiArKysgYi9pbmNsdWRlL3FhcGkvZXJyb3IuaAo+Pj4gQEAgLTMwOSw2
ICszMDksMzIgQEAgdm9pZCB3YXJuX3JlcG9ydGZfZXJyKEVycm9yICplcnIsIGNvbnN0IGNoYXIg
KmZtdCwgLi4uKQo+Pj4gICB2b2lkIGVycm9yX3JlcG9ydGZfZXJyKEVycm9yICplcnIsIGNvbnN0
IGNoYXIgKmZtdCwgLi4uKQo+Pj4gICAgICAgR0NDX0ZNVF9BVFRSKDIsIDMpOwo+Pj4gICArLyoK
Pj4+ICsgKiBGdW5jdGlvbnMgdG8gY2xlYW4gRXJyb3IgKiplcnJwOiBjYWxsIGNvcnJlc3BvbmRp
bmcgRXJyb3IgKmVyciBjbGVhbmluZwo+Pj4gKyAqIGZ1bmN0aW9uLCB0aGVuIHNldCBwb2ludGVy
IHRvIE5VTEwuCj4+PiArICovCj4+PiArc3RhdGljIGlubGluZSB2b2lkIGVycm9yX2ZyZWVfZXJy
cChFcnJvciAqKmVycnApCj4+PiArewo+Pj4gKyAgICBhc3NlcnQoZXJycCAmJiAqZXJycCk7Cj4+
PiArICAgIGVycm9yX2ZyZWUoKmVycnApOwo+Pj4gKyAgICAqZXJycCA9IE5VTEw7Cj4+PiArfQo+
Pj4gKwo+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBlcnJvcl9yZXBvcnRfZXJycChFcnJvciAqKmVy
cnApCj4+PiArewo+Pj4gKyAgICBhc3NlcnQoZXJycCAmJiAqZXJycCk7Cj4+PiArICAgIGVycm9y
X3JlcG9ydF9lcnIoKmVycnApOwo+Pj4gKyAgICAqZXJycCA9IE5VTEw7Cj4+PiArfQo+Pj4gKwo+
Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB3YXJuX3JlcG9ydF9lcnJwKEVycm9yICoqZXJycCkKPj4+
ICt7Cj4+PiArICAgIGFzc2VydChlcnJwICYmICplcnJwKTsKPj4+ICsgICAgd2Fybl9yZXBvcnRf
ZXJyKCplcnJwKTsKPj4+ICsgICAgKmVycnAgPSBOVUxMOwo+Pj4gK30KPj4+ICsKPj4+ICsKPj4+
ICAgLyoKPj4+ICAgICogSnVzdCBsaWtlIGVycm9yX3NldGcoKSwgZXhjZXB0IHlvdSBnZXQgdG8g
c3BlY2lmeSB0aGUgZXJyb3IgY2xhc3MuCj4+PiAgICAqIE5vdGU6IHVzZSBvZiBlcnJvciBjbGFz
c2VzIG90aGVyIHRoYW4gRVJST1JfQ0xBU1NfR0VORVJJQ19FUlJPUiBpcwo+Pgo+PiBUaGVzZSBh
cHBlYXIgdG8gYmUgdW51c2VkIGFwYXJ0IGZyb20gdGhlIENvY2NpbmVsbGUgc2NyaXB0IGluIFBB
VENIIDAzLgo+Pgo+PiBUaGV5IGFyZSB1c2VkIGluIHRoZSBmdWxsICJbUkZDIHY1IDAwMC8xMjZd
IGVycm9yOiBhdXRvIHByb3BhZ2F0ZWQKPj4gbG9jYWxfZXJyIiBzZXJpZXMuICBPcHRpb25zOgo+
Pgo+PiAxLiBQaWNrIGEgZmV3IG1vcmUgcGF0Y2hlcyBpbnRvIHRoaXMgcGFydCBJIHNlcmllcywg
c28gdGhlc2UgZ3V5cyBjb21lCj4+ICAgICB3aXRoIHVzZXJzLgo+Cj4gSXQgbmVlZHMgc29tZSBh
ZGRpdGlvbmFsIGVmZm9ydCBmb3IgdGhpcyBzZXJpZXMuLiBCdXQgaXQncyBwb3NzaWJsZS4gU3Rp
bGwsCj4gSSB0aGluayB0aGF0IHdlIGF0IGxlYXN0IHNob3VsZCBub3QgcHVsbCBvdXQgcGF0Y2hl
cyB3aGljaCBzaG91bGQgYmUgaW4KPiBmdXR1cmUgc2VyaWVzIChmb3IgZXhhbXBsZSBmcm9tIHBw
YyBvciBibG9jay8pLi4KClllcywgd2Ugd2FudCB0byBrZWVwIHJlbGF0ZWQgc3R1ZmYgdG9nZXRo
ZXIuCgo+IEdyZXBwaW5nIHRocm91Z2ggdjU6Cj4gIGZvciB4IGluIHt3YXJuX3JlcG9ydF9lcnJw
LGVycm9yX3JlcG9ydF9lcnJwLGVycm9yX2ZyZWVfZXJycH07IGRvIGVjaG8gPT0gJHggPT07IGdp
dCBncmVwIC1sICR4IHwgZ3JlcCAtdiBjb2NjaW5lbGxlIHwgZ3JlcCAtdiAnZXJyb3JcLmgnOyBl
Y2hvOyBkb25lCj4gPT0gd2Fybl9yZXBvcnRfZXJycCA9PQo+IGJsb2NrL2ZpbGUtcG9zaXguYwo+
IGh3L3BwYy9zcGFwci5jCj4gaHcvcHBjL3NwYXByX2NhcHMuYwo+IGh3L3BwYy9zcGFwcl9pcnEu
Ywo+IGh3L3ZmaW8vcGNpLmMKPiBuZXQvdGFwLmMKPiBxb20vb2JqZWN0LmMKPgo+ID09IGVycm9y
X3JlcG9ydF9lcnJwID09Cj4gaHcvYmxvY2svdmhvc3QtdXNlci1ibGsuYwo+IHV0aWwvb3NsaWIt
cG9zaXguYwo+Cj4gPT0gZXJyb3JfZnJlZV9lcnJwID09Cj4gYmxvY2suYwo+IGJsb2NrL3FhcGku
Ywo+IGJsb2NrL3NoZWVwZG9nLmMKPiBibG9jay9zbmFwc2hvdC5jCj4gYmxvY2tkZXYuYwo+IGNo
YXJkZXYvY2hhci1zb2NrZXQuYwo+IGh3L2F1ZGlvL2ludGVsLWhkYS5jCj4gaHcvY29yZS9xZGV2
LXByb3BlcnRpZXMuYwo+IGh3L3BjaS1icmlkZ2UvcGNpX2JyaWRnZV9kZXYuYwo+IGh3L3BjaS1i
cmlkZ2UvcGNpZV9wY2lfYnJpZGdlLmMKPiBody9zY3NpL21lZ2FzYXMuYwo+IGh3L3Njc2kvbXB0
c2FzLmMKPiBody91c2IvaGNkLXhoY2kuYwo+IGlvL25ldC1saXN0ZW5lci5jCj4gbWlncmF0aW9u
L2NvbG8uYwo+IHFnYS9jb21tYW5kcy1wb3NpeC5jCj4gcWdhL2NvbW1hbmRzLXdpbjMyLmMKPiB1
dGlsL3FlbXUtc29ja2V0cy5jCj4KPiBXaGF0IGRvIHlvdSB3YW50IHRvIGFkZD8KClBBVENIIHY1
IDAzMiB1c2VzIGJvdGggZXJyb3JfcmVwb3J0X2VycnAoKSBhbmQgZXJyb3JfZnJlZV9lcnJwKCku
CkFkZGluZyB3YXJuX3JlcG9ydF9lcnJwKCkgd2l0aG91dCBhIHVzZXIgaXMgb2theSB3aXRoIG1l
LiAgV2hhdCBkbyB5b3UKdGhpbms/CgpJZiB0aGVyZSBhcmUgcGF0Y2hlcyB5b3UgY29uc2lkZXIg
cmVsYXRlZCB0byAwMzIsIGZlZWwgZnJlZSB0byB0aHJvdwp0aGVtIGluLgoKPj4KPj4gMi4gUHVu
dCB0aGlzIHBhdGNoIHRvIHRoZSBmaXJzdCBwYXJ0IHRoYXQgaGFzIHVzZXJzLCBhbG9uZyB3aXRo
IHRoZQo+PiAgICAgcGFydCBvZiB0aGUgQ29jY2luZWxsZSBzY3JpcHQgdGhhdCBkZWFscyB3aXRo
IHRoZW0uCj4KPiBCdXQgY29jY2luZWxsZSBzY3JpcHQgd291bGQgYmUgd3JvbmcsIGlmIHdlIGRy
b3AgdGhpcyBwYXJ0IGZyb20gaXQuIEkgdGhpbmssCj4gdGhhdCBhZnRlciBjb21taXQgd2hpY2gg
YWRkcyBjb2NjaW5lbGxlIHNjcmlwdCwgaXQgc2hvdWxkIHdvcmsgd2l0aCBhbnkgZmlsZSwKPiBu
b3Qgb25seSBzdWJzZXQgb2YgdGhlc2Ugc2VyaWVzLgo+Cj4gU28sIGl0J3MgcHJvYmFibHkgT0sg
Zm9yIG5vdyB0byBkcm9wIHRoZXNlIGZ1bmN0aW9ucywgZm9yY2luZyB0aGVpciBhZGRpdGlvbiBp
Zgo+IGNvY2NpbmVsbGUgc2NyaXB0IHdpbGwgYmUgYXBwbGllZCB3aGVyZSB0aGVzZSBmdW5jdGlv
bnMgYXJlIG5lZWRlZC4gV2UgY2FuLCBmb3IKPiBleGFtcGxlIGNvbW1lbnQgdGhlc2UgdGhyZWUg
ZnVuY3Rpb25zLgo+Cj4gU3BsaXR0aW5nIGNvY2NpbmVsbGUgc2NyaXB0IGludG8gdHdvIHBhcnRz
LCB3aGljaCB3aWxsIGJlIGluIGRpZmZlcmVudCBzZXJpZXMgd2lsbAo+IG5vdCBoZWxwIGFueSBw
YXRjaC1wb3J0aW5nIHByb2Nlc3Nlcy4KPgo+IE1vcmVvdmVyLCB0aGlzIHdpbGwgY3JlYXRlIGRl
cGVuZGVuY2llcyBiZXR3ZWVuIGZ1dHVyZSBzZXJpZXMgdXBkYXRpbmcgb3RoZXIgZmlsZXMuCj4K
PiBTbywgSSBkb24ndCBsaWtlIFsyLl0uLgoKQW5kIGl0J3MgbGlrZWx5IG1vcmUgd29yayB0aGFu
IDEuCgo+PiAzLiBEbyBub3RoaW5nOiBhY2NlcHQgdGhlIGZ1bmN0aW9ucyB3aXRob3V0IHVzZXJz
Lgo+Cj4gT0sgZm9yIG1lKQo+Cj4+Cj4+IEkgaGFiaXR1YWxseSBkaXNsaWtlIDMuLCBidXQgcmV2
aWV3aW5nIHRoZSByZXN0IG9mIHRoaXMgc2VyaWVzIG1pZ2h0Cj4+IG1ha2UgbWUgb3ZlcnJpZGUg
dGhhdCBkaXNsaWtlLgpbLi4uXQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
