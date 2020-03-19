Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFF818AE67
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 09:34:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEqaR-00010L-26; Thu, 19 Mar 2020 08:31:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PtNw=5E=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jEqaP-00010G-MO
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 08:31:29 +0000
X-Inumbo-ID: 07999d64-69bc-11ea-b34e-bc764e2007e4
Received: from us-smtp-delivery-74.mimecast.com (unknown [63.128.21.74])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 07999d64-69bc-11ea-b34e-bc764e2007e4;
 Thu, 19 Mar 2020 08:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584606688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eCeApddrICmk/xsjdPqOtSUl0Pm0uVIHbo4ldlnlaiM=;
 b=dJNwyBr2JTE/MlPNoBAuYSx9AYpKfUsKl466OGYNLrN1ma2OTDEIrEiINLgCTzjF9feg+q
 RBIRrPe3c9Jl71/jnZ14lGv5XR7mXqfafYZ+FjC6UGIpLqrLBW1HSkhgr4PxVUShmJZ9s9
 dSeNTrNNEcVADx4M+LSTO7K+Bao2jaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-Rok3BDfKOuG_a8mww7ooPg-1; Thu, 19 Mar 2020 04:31:27 -0400
X-MC-Unique: Rok3BDfKOuG_a8mww7ooPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2609ADB24;
 Thu, 19 Mar 2020 08:31:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4303860BF7;
 Thu, 19 Mar 2020 08:31:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C2D101138404; Thu, 19 Mar 2020 09:31:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200312085936.9552-1-vsementsov@virtuozzo.com>
 <20200312085936.9552-3-vsementsov@virtuozzo.com>
 <874kuto7hq.fsf@dusky.pond.sub.org>
 <4a70c6ee-10a2-fdc3-f8df-88c05340398b@virtuozzo.com>
 <875zf8gt2m.fsf@dusky.pond.sub.org>
 <7c6f9a91-76cf-242d-8166-0693ec14b24d@virtuozzo.com>
 <87blozex9v.fsf@dusky.pond.sub.org>
 <3e1e5815-eb5f-7862-e6eb-596991e2842b@virtuozzo.com>
Date: Thu, 19 Mar 2020 09:31:17 +0100
In-Reply-To: <3e1e5815-eb5f-7862-e6eb-596991e2842b@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 17 Mar 2020 16:54:52 +0300")
Message-ID: <87pnd8zqy2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
cml0ZXM6Cgo+IDE0LjAzLjIwMjAgMDo1NCwgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6ClsuLi5d
Cj4+IC8vIE1hdGNoIGZ1bmN0aW9ucyB3aXRoIHByb3BhZ2F0aW9uIG9mIGxvY2FsIGVycm9yIHRv
IGVycnAuCj4+IC8vIFdlIHdhbnQgdG8gcmVmZXIgdGhlc2UgZnVuY3Rpb25zIGluIHNldmVyYWwg
Zm9sbG93aW5nIHJ1bGVzLCBidXQgSQo+PiAvLyBkb24ndCBrbm93IGEgcHJvcGVyIHdheSB0byBp
bmhlcml0IGEgZnVuY3Rpb24sIG5vdCBqdXN0IGl0cyBuYW1lCj4+IC8vICh0byBub3QgbWF0Y2gg
YW5vdGhlciBmdW5jdGlvbnMgd2l0aCBzYW1lIG5hbWUgaW4gZm9sbG93aW5nIHJ1bGVzKS4KPj4g
Ly8gTm90LXByb3BlciB3YXkgaXMgYXMgZm9sbG93czogcmVuYW1lIGVycnAgcGFyYW1ldGVyIGlu
IGZ1bmN0aW9ucwo+PiAvLyBoZWFkZXIgYW5kIG1hdGNoIGl0IGluIGZvbGxvd2luZyBydWxlcy4g
UmVuYW1lIGl0IGJhY2sgYWZ0ZXIgYWxsCj4+IC8vIHRyYW5zZm9ybWF0aW9ucy4KPj4gLy8KPj4g
Ly8gVGhlIHNpbXBsZXN0IGNhc2Ugb2YgcHJvcGFnYXRpb24gc2NoZW1lIGlzIHNpbmdsZSBkZWZp
bml0aW9uIG9mCj4+IC8vIGxvY2FsX2VyciB3aXRoIGF0IG1vc3Qgb25lIGVycm9yX3Byb3BhZ2F0
ZV9wcmVwZW5kIG9yCj4+IC8vIGVycm9yX3Byb3BhZ2F0ZSBvbiBlYWNoIGNvbnRyb2wtZmxvdy4g
U3RpbGwsIHdlIHdhbnQgdG8gbWF0Y2ggbW9yZQo+PiAvLyBjb21wbGV4IHNjaGVtZXMgdG9vLiBX
ZSdsbCB3YXJuIHRoZW0gd2l0aCBoZWxwIG9mIGZ1cnRoZXIgcnVsZXMuCj4+IEBydWxlMSBkaXNh
YmxlIG9wdGlvbmFsX3F1YWxpZmllciBleGlzdHNACj4+IGlkZW50aWZpZXIgZm4sIGxvY2FsX2Vy
cjsKPj4gc3ltYm9sIGVycnA7Cj4+IEBACj4+Cj4+ICAgZm4oLi4uLCBFcnJvciAqKgo+PiAtICAg
IGVycnAKPj4gKyAgICBfX19fCj4+ICAgICAgLCAuLi4pCj4+ICAgewo+PiAgICAgICAuLi4KPj4g
ICAgICAgRXJyb3IgKmxvY2FsX2VyciA9IE5VTEw7Cj4+ICAgICAgIC4uLgo+PiAoCj4+ICAgICAg
IGVycm9yX3Byb3BhZ2F0ZV9wcmVwZW5kKGVycnAsIGxvY2FsX2VyciwgLi4uKTsKPj4gfAo+PiAg
ICAgICBlcnJvcl9wcm9wYWdhdGUoZXJycCwgbG9jYWxfZXJyKTsKPj4gKQo+PiAgICAgICAuLi4K
Pj4gICB9Cj4+Cj4+Cj4+IC8vIFdhcm4gc2V2ZXJhbCBFcnJvciAqIGRlZmluaXRpb25zLgo+PiBA
Y2hlY2sxIGRpc2FibGUgb3B0aW9uYWxfcXVhbGlmaWVyIGV4aXN0c0AKPj4gaWRlbnRpZmllciBm
biwgX2VycnAsIGxvY2FsX2VyciwgbG9jYWxfZXJyMjsKPj4gcG9zaXRpb24gcDEsIHAyOwo+PiBA
QAo+Pgo+PiAgIGZuKC4uLiwgRXJyb3IgKipfZXJycCwgLi4uKQo+PiAgIHsKPj4gICAgICAgLi4u
Cj4+ICAgICAgIEVycm9yICpsb2NhbF9lcnIgPSBOVUxMO0BwMQo+PiAgICAgICAuLi4gd2hlbiBh
bnkKPj4gICAgICAgRXJyb3IgKmxvY2FsX2VycjIgPSBOVUxMO0BwMgo+PiAgICAgICAuLi4gd2hl
biBhbnkKPj4gICB9Cj4+Cj4+IEAgc2NyaXB0OnB5dGhvbiBACj4+IGZuIDw8IGNoZWNrMS5mbjsK
Pj4gcDEgPDwgY2hlY2sxLnAxOwo+PiBwMiA8PCBjaGVjazEucDI7Cj4+IEBACj4+Cj4+IHByaW50
KCdXYXJuaW5nOiBmdW5jdGlvbiB7fSBoYXMgc2V2ZXJhbCBkZWZpbml0aW9ucyBvZiAnCj4+ICAg
ICAgICAnRXJyb3IgKiBsb2NhbCB2YXJpYWJsZTogYXQge306e30gYW5kIHRoZW4gYXQge306e30n
LmZvcm1hdCgKPj4gICAgICAgICAgICBmbiwgcDFbMF0uZmlsZSwgcDFbMF0ubGluZSwgcDJbMF0u
ZmlsZSwgcDJbMF0ubGluZSkpCj4+Cj4+IC8vIFdhcm4gc2V2ZXJhbCBwcm9wYWdhdGlvbnMgaW4g
Y29udHJvbCBmbG93Lgo+PiBAY2hlY2syIGRpc2FibGUgb3B0aW9uYWxfcXVhbGlmaWVyIGV4aXN0
c0AKPj4gaWRlbnRpZmllciBmbiwgX2VycnA7Cj4+IHBvc2l0aW9uIHAxLCBwMjsKPj4gQEAKPj4K
Pj4gICBmbiguLi4sIEVycm9yICoqX2VycnAsIC4uLikKPgo+IEhtbSwgZm9yIHRoaXMgdG8gd29y
aywgd2Ugc2hvdWxkIG1vdmUgdGhlIHJ1bGUgYWJvdmUgcnVsZTEsIGJlY2F1c2Ugbm93IHBhcmFt
dGVyCj4gZGVmaW5pdGlvbiBpcyBkaWZmZXJlbnQgZnJvbSBpdCB1c2FnZSBpbiB0aGUgZnVuY3Rp
b24gYm9keS4KCkkgdGhpbmsgeW91J3JlIHJpZ2h0LgoKWy4uLl0KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
