Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6C81841C6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 08:53:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCf5y-0000kC-Vu; Fri, 13 Mar 2020 07:51:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gl7I=46=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jCf5x-0000k7-K7
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 07:51:01 +0000
X-Inumbo-ID: 6114902d-64ff-11ea-b29a-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6114902d-64ff-11ea-b29a-12813bfff9fa;
 Fri, 13 Mar 2020 07:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584085859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HS9HuOWOHKe84T80WbF1D6/C2TPEug2GV+/9lm/uW4w=;
 b=JcPVI0WReoSE4xWNUJkLjbMPD5XVaIQiBLMhH1/TwkFmmJtThw9hAC7H93lc47EUmMs2XO
 jjmyTH03+4F9U1MJl05XPRyaVMkB6cbNkrjee+3NbcRFM3T9XQj6eWaFBnWBt62BGt1EPF
 eqQVz9/fE/qcu1f0gTi/4Eu+U11ScTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-8S4xheiBMLWRxhYonGBOWA-1; Fri, 13 Mar 2020 03:50:55 -0400
X-MC-Unique: 8S4xheiBMLWRxhYonGBOWA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FFA0801E6D;
 Fri, 13 Mar 2020 07:50:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-34.ams2.redhat.com
 [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D115F5C1C3;
 Fri, 13 Mar 2020 07:50:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5F75711386A6; Fri, 13 Mar 2020 08:50:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200312085936.9552-1-vsementsov@virtuozzo.com>
 <20200312085936.9552-3-vsementsov@virtuozzo.com>
Date: Fri, 13 Mar 2020 08:50:45 +0100
In-Reply-To: <20200312085936.9552-3-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 12 Mar 2020 11:59:28 +0300")
Message-ID: <87eetwlmlm.fsf@dusky.pond.sub.org>
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
cml0ZXM6CgpbLi4uXQo+ICsvLyBXYXJuIHNldmVyYWwgRXJyb3IgKiBkZWZpbml0aW9ucy4KPiAr
QGNoZWNrMSBkaXNhYmxlIG9wdGlvbmFsX3F1YWxpZmllciBleGlzdHNACj4gK2lkZW50aWZpZXIg
Zm4gPSBydWxlMS5mbiwgbG9jYWxfZXJyLCBsb2NhbF9lcnIyOwo+ICtAQAo+ICsKPiArIGZuKC4u
LiwgRXJyb3IgKiogX19fXywgLi4uKQo+ICsgewo+ICsgICAgIC4uLgo+ICsgICAgIEVycm9yICps
b2NhbF9lcnIgPSBOVUxMOwo+ICsgICAgIC4uLiB3aGVuIGFueQo+ICsgICAgIEVycm9yICpsb2Nh
bF9lcnIyID0gTlVMTDsKPiArICAgICAuLi4gd2hlbiBhbnkKPiArIH0KPiArCj4gK0Agc2NyaXB0
OnB5dGhvbiBACj4gK2ZuIDw8IGNoZWNrMS5mbjsKPiArQEAKPiArCj4gK3ByaW50KCdXYXJuaW5n
OiBmdW5jdGlvbiB7fSBoYXMgc2V2ZXJhbCBkZWZpbml0aW9ucyBvZiAnCj4gKyAgICAgICdFcnJv
ciAqIGxvY2FsIHZhcmlhYmxlJy5mb3JtYXQoZm4pKQoKUHJpbnRpbmcgdGhlIHBvc2l0aW9ucyBs
aWtlIHlvdSBkbyBpbiB0aGUgbmV4dCBydWxlIGlzIHVzZWZ1bCB3aGVuCmV4YW1pbmluZyB0aGVz
ZSB3YXJuaW5ncy4KCj4gKwo+ICsvLyBXYXJuIHNldmVyYWwgcHJvcGFnYXRpb25zIGluIGNvbnRy
b2wgZmxvdy4KPiArQGNoZWNrMiBkaXNhYmxlIG9wdGlvbmFsX3F1YWxpZmllciBleGlzdHNACj4g
K2lkZW50aWZpZXIgZm4gPSBydWxlMS5mbjsKPiArc3ltYm9sIGVycnA7Cj4gK3Bvc2l0aW9uIHAx
LCBwMjsKPiArQEAKPiArCj4gKyBmbiguLi4sIEVycm9yICoqIF9fX18sIC4uLikKPiArIHsKPiAr
ICAgICAuLi4KPiArKAo+ICsgICAgIGVycm9yX3Byb3BhZ2F0ZV9wcmVwZW5kKGVycnAsIC4uLik7
QHAxCj4gK3wKPiArICAgICBlcnJvcl9wcm9wYWdhdGUoZXJycCwgLi4uKTtAcDEKPiArKQo+ICsg
ICAgIC4uLgo+ICsoCj4gKyAgICAgZXJyb3JfcHJvcGFnYXRlX3ByZXBlbmQoZXJycCwgLi4uKTtA
cDIKPiArfAo+ICsgICAgIGVycm9yX3Byb3BhZ2F0ZShlcnJwLCAuLi4pO0BwMgo+ICspCj4gKyAg
ICAgLi4uIHdoZW4gYW55Cj4gKyB9Cj4gKwo+ICtAIHNjcmlwdDpweXRob24gQAo+ICtmbiA8PCBj
aGVjazIuZm47Cj4gK3AxIDw8IGNoZWNrMi5wMTsKPiArcDIgPDwgY2hlY2syLnAyOwo+ICtAQAo+
ICsKPiArcHJpbnQoJ1dhcm5pbmc6IGZ1bmN0aW9uIHt9IHByb3BhZ2F0ZXMgdG8gZXJycCBzZXZl
cmFsIHRpbWVzIGluICcKPiArICAgICAgJ29uZSBjb250cm9sIGZsb3c6IGF0IHt9Ont9IGFuZCB0
aGVuIGF0IHt9Ont9Jy5mb3JtYXQoCj4gKyAgICAgICAgICBmbiwgcDFbMF0uZmlsZSwgcDFbMF0u
bGluZSwgcDJbMF0uZmlsZSwgcDJbMF0ubGluZSkpClsuLi5dCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
