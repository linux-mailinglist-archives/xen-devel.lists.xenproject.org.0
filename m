Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA0616703E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 08:42:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j52t8-0006Tp-UN; Fri, 21 Feb 2020 07:38:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F1Fm=4J=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1j52t6-0006Tk-Vo
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 07:38:17 +0000
X-Inumbo-ID: 1e119dd4-547d-11ea-85f1-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1e119dd4-547d-11ea-85f1-12813bfff9fa;
 Fri, 21 Feb 2020 07:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582270693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ivlYN+I1MiRVaAJX3T1ltBTxmac4Df8VdwXtfcMODnw=;
 b=MXGZEvzVqU722XvTc9HGMUDKs4qnkh5CbN60sljRT/5Gqe5za9IDfwhgnBI5hN2/hMGC/o
 aTnMrM3xne28BSHigSWekchu9qjdo30zTSiJAtUr5dz8ymxD75nFAJIy85KScVCUbwY/bI
 /UaYqFNGKbMh/WLe9DRaj4IYARfQWVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-Uj8oUS1wOMeD0qif6IMjEA-1; Fri, 21 Feb 2020 02:38:11 -0500
X-MC-Unique: Uj8oUS1wOMeD0qif6IMjEA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2DF88018C0;
 Fri, 21 Feb 2020 07:38:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B9EF388;
 Fri, 21 Feb 2020 07:38:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 12D6D11386A6; Fri, 21 Feb 2020 08:38:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
 <20200131130118.1716-2-vsementsov@virtuozzo.com>
Date: Fri, 21 Feb 2020 08:38:02 +0100
In-Reply-To: <20200131130118.1716-2-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 31 Jan 2020 16:01:08 +0300")
Message-ID: <87d0a88k6d.fsf@dusky.pond.sub.org>
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
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel@nongnu.org, armbru@redhat.com, Greg Kurz <groug@kaod.org>,
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
cml0ZXM6Cgo+IEFkZCBmdW5jdGlvbnMgdG8gY2xlYW4gRXJyb3IgKiplcnJwOiBjYWxsIGNvcnJl
c3BvbmRpbmcgRXJyb3IgKmVycgo+IGNsZWFuaW5nIGZ1bmN0aW9uIGFuIHNldCBwb2ludGVyIHRv
IE5VTEwuCj4KPiBOZXcgZnVuY3Rpb25zOgo+ICAgZXJyb3JfZnJlZV9lcnJwCj4gICBlcnJvcl9y
ZXBvcnRfZXJycAo+ICAgd2Fybl9yZXBvcnRfZXJycAo+Cj4gU2lnbmVkLW9mZi1ieTogVmxhZGlt
aXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPgo+IFJldmll
d2VkLWJ5OiBHcmVnIEt1cnogPGdyb3VnQGthb2Qub3JnPgo+IFJldmlld2VkLWJ5OiBFcmljIEJs
YWtlIDxlYmxha2VAcmVkaGF0LmNvbT4KPiAtLS0KPgo+IENDOiBFcmljIEJsYWtlIDxlYmxha2VA
cmVkaGF0LmNvbT4KPiBDQzogS2V2aW4gV29sZiA8a3dvbGZAcmVkaGF0LmNvbT4KPiBDQzogTWF4
IFJlaXR6IDxtcmVpdHpAcmVkaGF0LmNvbT4KPiBDQzogR3JlZyBLdXJ6IDxncm91Z0BrYW9kLm9y
Zz4KPiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IEND
OiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiBDQzogUGF1bCBE
dXJyYW50IDxwYXVsQHhlbi5vcmc+Cj4gQ0M6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVk
aGF0LmNvbT4KPiBDQzogIlBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIiA8cGhpbG1kQHJlZGhhdC5j
b20+Cj4gQ0M6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Cj4gQ0M6IEdlcmQgSG9m
Zm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+IENDOiBTdGVmYW4gQmVyZ2VyIDxzdGVmYW5iQGxp
bnV4LmlibS5jb20+Cj4gQ0M6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT4K
PiBDQzogTWljaGFlbCBSb3RoIDxtZHJvdGhAbGludXgudm5ldC5pYm0uY29tPgo+IENDOiBxZW11
LWJsb2NrQG5vbmdudS5vcmcKPiBDQzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4K
PiAgaW5jbHVkZS9xYXBpL2Vycm9yLmggfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvcWFwaS9lcnJvci5oIGIvaW5jbHVkZS9xYXBpL2Vycm9yLmgKPiBpbmRleCBhZDViNmU4OTZk
Li5kMzQ5ODcxNDhkIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvcWFwaS9lcnJvci5oCj4gKysrIGIv
aW5jbHVkZS9xYXBpL2Vycm9yLmgKPiBAQCAtMzA5LDYgKzMwOSwzMiBAQCB2b2lkIHdhcm5fcmVw
b3J0Zl9lcnIoRXJyb3IgKmVyciwgY29uc3QgY2hhciAqZm10LCAuLi4pCj4gIHZvaWQgZXJyb3Jf
cmVwb3J0Zl9lcnIoRXJyb3IgKmVyciwgY29uc3QgY2hhciAqZm10LCAuLi4pCj4gICAgICBHQ0Nf
Rk1UX0FUVFIoMiwgMyk7Cj4gIAo+ICsvKgo+ICsgKiBGdW5jdGlvbnMgdG8gY2xlYW4gRXJyb3Ig
KiplcnJwOiBjYWxsIGNvcnJlc3BvbmRpbmcgRXJyb3IgKmVyciBjbGVhbmluZwo+ICsgKiBmdW5j
dGlvbiwgdGhlbiBzZXQgcG9pbnRlciB0byBOVUxMLgo+ICsgKi8KPiArc3RhdGljIGlubGluZSB2
b2lkIGVycm9yX2ZyZWVfZXJycChFcnJvciAqKmVycnApCj4gK3sKPiArICAgIGFzc2VydChlcnJw
ICYmICplcnJwKTsKPiArICAgIGVycm9yX2ZyZWUoKmVycnApOwo+ICsgICAgKmVycnAgPSBOVUxM
Owo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgZXJyb3JfcmVwb3J0X2VycnAoRXJyb3Ig
KiplcnJwKQo+ICt7Cj4gKyAgICBhc3NlcnQoZXJycCAmJiAqZXJycCk7Cj4gKyAgICBlcnJvcl9y
ZXBvcnRfZXJyKCplcnJwKTsKPiArICAgICplcnJwID0gTlVMTDsKPiArfQo+ICsKPiArc3RhdGlj
IGlubGluZSB2b2lkIHdhcm5fcmVwb3J0X2VycnAoRXJyb3IgKiplcnJwKQo+ICt7Cj4gKyAgICBh
c3NlcnQoZXJycCAmJiAqZXJycCk7Cj4gKyAgICB3YXJuX3JlcG9ydF9lcnIoKmVycnApOwo+ICsg
ICAgKmVycnAgPSBOVUxMOwo+ICt9Cj4gKwo+ICsKPiAgLyoKPiAgICogSnVzdCBsaWtlIGVycm9y
X3NldGcoKSwgZXhjZXB0IHlvdSBnZXQgdG8gc3BlY2lmeSB0aGUgZXJyb3IgY2xhc3MuCj4gICAq
IE5vdGU6IHVzZSBvZiBlcnJvciBjbGFzc2VzIG90aGVyIHRoYW4gRVJST1JfQ0xBU1NfR0VORVJJ
Q19FUlJPUiBpcwoKVGhlc2UgYXBwZWFyIHRvIGJlIHVudXNlZCBhcGFydCBmcm9tIHRoZSBDb2Nj
aW5lbGxlIHNjcmlwdCBpbiBQQVRDSCAwMy4KClRoZXkgYXJlIHVzZWQgaW4gdGhlIGZ1bGwgIltS
RkMgdjUgMDAwLzEyNl0gZXJyb3I6IGF1dG8gcHJvcGFnYXRlZApsb2NhbF9lcnIiIHNlcmllcy4g
IE9wdGlvbnM6CgoxLiBQaWNrIGEgZmV3IG1vcmUgcGF0Y2hlcyBpbnRvIHRoaXMgcGFydCBJIHNl
cmllcywgc28gdGhlc2UgZ3V5cyBjb21lCiAgIHdpdGggdXNlcnMuCgoyLiBQdW50IHRoaXMgcGF0
Y2ggdG8gdGhlIGZpcnN0IHBhcnQgdGhhdCBoYXMgdXNlcnMsIGFsb25nIHdpdGggdGhlCiAgIHBh
cnQgb2YgdGhlIENvY2NpbmVsbGUgc2NyaXB0IHRoYXQgZGVhbHMgd2l0aCB0aGVtLgoKMy4gRG8g
bm90aGluZzogYWNjZXB0IHRoZSBmdW5jdGlvbnMgd2l0aG91dCB1c2Vycy4KCkkgaGFiaXR1YWxs
eSBkaXNsaWtlIDMuLCBidXQgcmV2aWV3aW5nIHRoZSByZXN0IG9mIHRoaXMgc2VyaWVzIG1pZ2h0
Cm1ha2UgbWUgb3ZlcnJpZGUgdGhhdCBkaXNsaWtlLgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
