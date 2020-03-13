Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E0F184ADD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 16:37:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCmKN-0006Dv-CR; Fri, 13 Mar 2020 15:34:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gl7I=46=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jCmKL-0006Dq-JA
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 15:34:21 +0000
X-Inumbo-ID: 1bf83304-6540-11ea-b34e-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1bf83304-6540-11ea-b34e-bc764e2007e4;
 Fri, 13 Mar 2020 15:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584113660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8L9kYJQLq8wQnmsdmFdZ5Ni8ot4fwiL6ME5fia5Okc=;
 b=BQUPFA1rSXy0A6OtgCUKOVF4P8Ugq4p7gC1hZETaQdeXieuS4+0MI5aS2S3qBFfyceLhlK
 aYGQ16HH/wJaRIGsDj2lqg+QwIhGNSuKTvVbABvX2JjFho6Yo1Q7UcE67cJ2Jr2Ny1/h18
 fX+Fa5NXEiAJw8AyN+TgVrBPNsmcpXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-1hGg6TUyOb2T0O_8zxpLJw-1; Fri, 13 Mar 2020 11:34:18 -0400
X-MC-Unique: 1hGg6TUyOb2T0O_8zxpLJw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2615190B2A8;
 Fri, 13 Mar 2020 15:34:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-34.ams2.redhat.com
 [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BD715C1B5;
 Fri, 13 Mar 2020 15:34:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DA8AA11386A6; Fri, 13 Mar 2020 16:34:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200312085936.9552-1-vsementsov@virtuozzo.com>
 <20200312085936.9552-3-vsementsov@virtuozzo.com>
 <87eetwlmlm.fsf@dusky.pond.sub.org>
 <efaed3e4-3f4d-f538-5087-96391fc20d2f@virtuozzo.com>
Date: Fri, 13 Mar 2020 16:34:07 +0100
In-Reply-To: <efaed3e4-3f4d-f538-5087-96391fc20d2f@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 13 Mar 2020 11:06:37 +0300")
Message-ID: <87d09ggtg0.fsf@dusky.pond.sub.org>
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
cml0ZXM6Cgo+IDEzLjAzLjIwMjAgMTA6NTAsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+PiBW
bGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdy
aXRlczoKPj4KPj4gWy4uLl0KPj4+ICsvLyBXYXJuIHNldmVyYWwgRXJyb3IgKiBkZWZpbml0aW9u
cy4KPj4+ICtAY2hlY2sxIGRpc2FibGUgb3B0aW9uYWxfcXVhbGlmaWVyIGV4aXN0c0AKPj4+ICtp
ZGVudGlmaWVyIGZuID0gcnVsZTEuZm4sIGxvY2FsX2VyciwgbG9jYWxfZXJyMjsKPj4+ICtAQAo+
Pj4gKwo+Pj4gKyBmbiguLi4sIEVycm9yICoqIF9fX18sIC4uLikKPj4+ICsgewo+Pj4gKyAgICAg
Li4uCj4+PiArICAgICBFcnJvciAqbG9jYWxfZXJyID0gTlVMTDsKPj4+ICsgICAgIC4uLiB3aGVu
IGFueQo+Pj4gKyAgICAgRXJyb3IgKmxvY2FsX2VycjIgPSBOVUxMOwo+Pj4gKyAgICAgLi4uIHdo
ZW4gYW55Cj4+PiArIH0KPj4+ICsKPj4+ICtAIHNjcmlwdDpweXRob24gQAo+Pj4gK2ZuIDw8IGNo
ZWNrMS5mbjsKPj4+ICtAQAo+Pj4gKwo+Pj4gK3ByaW50KCdXYXJuaW5nOiBmdW5jdGlvbiB7fSBo
YXMgc2V2ZXJhbCBkZWZpbml0aW9ucyBvZiAnCj4+PiArICAgICAgJ0Vycm9yICogbG9jYWwgdmFy
aWFibGUnLmZvcm1hdChmbikpCj4+Cj4+IFByaW50aW5nIHRoZSBwb3NpdGlvbnMgbGlrZSB5b3Ug
ZG8gaW4gdGhlIG5leHQgcnVsZSBpcyB1c2VmdWwgd2hlbgo+PiBleGFtaW5pbmcgdGhlc2Ugd2Fy
bmluZ3MuCj4KPiBJIGRlY2lkZWQgdGhhdCBzZWFyY2hpbmcgZm9yIEVycm9yICogZGVmaW5pdGlv
biBpcyBzaW1wbGUsIGFuZCBiZXR0ZXIgZm9yCj4gdXNlciB0byBzZWFyY2ggYWxsIGRlZmluaXRp
b25zIGJ5IGhhbmQgKG1heSBiZSBtb3JlIHRoYW4gdG9vKS4KPgo+IEJ1dCB1bmRlcnN0YW5kaW5n
IGNvbnRyb2wgZmxvd3MgaXMgbW9yZSBjb21wbGV4IHRoaW5nIGFuZCBiZXR0ZXIgdG8gaGVscAo+
IHVzZXIgd2l0aCBsaW5lIHBvc2l0aW9ucy4KPgo+IEJ1dCBpZiB5b3Ugd2FudCwgd2UgY2FuIGFk
ZCB0aGVtIG9mIGNvdXJzZS4gTm90ZSwgdGhhdCBmb3Igc29tZSByZWFzb25zIHNvbWUKPiB0aW1l
cyBjb2NjaW5lbGxlIGluc3RlYWQgb2Ygb3JpZ2luYWwgZmlsZW5hbWUgcHJpbnRzIHNvbWV0aGlu
ZyBsaWtlIC90bXAvLi4ub3JpZ2luYWwtbmFtZS4uLgo+IHNvIGl0IGRvbid0IGxvb2sgbmljZSBh
bmQgbWF5IGJlIGEgYml0IG1pc2xlYWRpbmcuCgpJIG5vdGljZWQgd2hlbiBJIGFjdHVhbGx5IHRy
aWVkIG11IGlkZWEgJS19CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
