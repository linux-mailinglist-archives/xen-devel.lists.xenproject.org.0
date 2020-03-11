Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2516F18150C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 10:35:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBxkB-00066Q-6c; Wed, 11 Mar 2020 09:33:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=At4r=44=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jBxk9-00066E-1I
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 09:33:37 +0000
X-Inumbo-ID: 621b92e8-637b-11ea-a6c1-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 621b92e8-637b-11ea-a6c1-bc764e2007e4;
 Wed, 11 Mar 2020 09:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583919216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FwIuxPbuoqbGBv8xLYtj/yrJTA4MjeatVQEp20ilOpU=;
 b=VnuTaTj3BNxZa644lZ70+MIzYS3FOsZ/QeYaPxF8lbQ1CsiTdHPPasZ89BSPZtn/M2T7xB
 qCaHgbtMyVQVL8gv14KUToFQoo+XPMa3bvXMjmCsQvevNQtyjmv3u5Cs+G4/jmJzNyiXes
 KiM+WvisgVKRyRwlw14dU58upQMFfB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-DpEE1gz8Og2mXmgyiqa46A-1; Wed, 11 Mar 2020 05:33:32 -0400
X-MC-Unique: DpEE1gz8Og2mXmgyiqa46A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9157107ACC4;
 Wed, 11 Mar 2020 09:33:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-34.ams2.redhat.com
 [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5587B100164D;
 Wed, 11 Mar 2020 09:33:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DA3A511386A6; Wed, 11 Mar 2020 10:33:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-3-vsementsov@virtuozzo.com>
 <87lfo997hs.fsf@dusky.pond.sub.org>
 <83b327b0-34d9-ad71-ba3c-156bd7b82836@virtuozzo.com>
Date: Wed, 11 Mar 2020 10:33:23 +0100
In-Reply-To: <83b327b0-34d9-ad71-ba3c-156bd7b82836@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 11 Mar 2020 11:35:29 +0300")
Message-ID: <87h7yvgrrw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3
cml0ZXM6Cgo+IDA5LjAzLjIwMjAgMTI6NTYsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+Pj4g
Kwo+Pj4gKy8vIENvbnZlcnQgZXJyb3IgY2xlYXJpbmcgZnVuY3Rpb25zCj4+IFN1Z2dlc3Q6IEVu
c3VyZSBAbG9jYWxfZXJyIGlzIGNsZWFyZWQgb24gZnJlZQo+Cj4gQnV0IHRoZXJlIGlzIG5vIGxv
Y2FsX2VyciBhZnRlciBjb252ZXJzaW9uCgpUcnVlLiAgSG1tLiAgV2hhdCBhYm91dCB0aGlzOgoK
ICAgICAvLyBDb252ZXJ0IGNhbGxzIHRvIGVycm9yX2ZyZWUoKSwgcG9zc2libHkgaW5kaXJlY3QK
ICAgICAvLyBJbiBhZGRpdGlvbiB0byByZXBsYWNpbmcgQGxvY2FsX2VyciBieSAqZXJycCwgd2Ug
aGF2ZSB0byBjbGVhciAqZXJycAogICAgIC8vIHRvIGF2b2lkIHVzZS1hZnRlci1mcmVlIGluIHRo
ZSBhdXRvbWF0aWMgZXJyb3IgcHJvcGFnYXRpb24uCgo+Pj4gKygKPj4+ICstICAgIGVycm9yX2Zy
ZWUobG9jYWxfZXJyKTsKPj4+ICsrICAgIGVycm9yX2ZyZWVfZXJycChlcnJwKTsKPj4+ICt8Cj4+
PiArLSAgICBlcnJvcl9yZXBvcnRfZXJyKGxvY2FsX2Vycik7Cj4+PiArKyAgICBlcnJvcl9yZXBv
cnRfZXJycChlcnJwKTsKPj4+ICt8Cj4+PiArLSAgICBlcnJvcl9yZXBvcnRmX2Vycihsb2NhbF9l
cnIsIGFyZ3MpOwo+Pj4gKysgICAgZXJyb3JfcmVwb3J0Zl9lcnJwKGVycnAsIGFyZ3MpOwo+Pj4g
K3wKPj4+ICstICAgIHdhcm5fcmVwb3J0X2Vycihsb2NhbF9lcnIpOwo+Pj4gKysgICAgd2Fybl9y
ZXBvcnRfZXJycChlcnJwKTsKPj4+ICt8Cj4+PiArLSAgICB3YXJuX3JlcG9ydGZfZXJyKGxvY2Fs
X2VyciwgYXJncyk7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
