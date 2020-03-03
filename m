Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1E61770AE
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 09:03:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j92UO-0005R5-IR; Tue, 03 Mar 2020 08:01:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qcPe=4U=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1j92UN-0005R0-3z
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 08:01:15 +0000
X-Inumbo-ID: 277529da-5d25-11ea-902a-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 277529da-5d25-11ea-902a-bc764e2007e4;
 Tue, 03 Mar 2020 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583222474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wm90ol0NPjDNZg72Nx1LBEYsoakaot778J/Y84wn4t0=;
 b=K81QdZV0rGu6/QLpDN3Mc/vrBvfkub5voK3u9rYkbpXcKGykplV3wgYmY8b8hJbPgfdAdv
 lvSoNGq8NDqEMm/psghH85k/csiZhjQ33zqzOKayzC+n76qc0fFjo8JHN4CbPwBwsftdkf
 QvLB83HyB+vE9tzycJETQBR2WZuIiX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-KX6OMs31OxSAEYyIrd6HJw-1; Tue, 03 Mar 2020 03:01:13 -0500
X-MC-Unique: KX6OMs31OxSAEYyIrd6HJw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0C97800D53;
 Tue,  3 Mar 2020 08:01:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16A7E92D01;
 Tue,  3 Mar 2020 08:01:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8F27B11386A6; Tue,  3 Mar 2020 09:01:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
Date: Tue, 03 Mar 2020 09:01:03 +0100
In-Reply-To: <20200131130118.1716-1-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 31 Jan 2020 16:01:07 +0300")
Message-ID: <87y2shdg00.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v7 00/11] error: auto propagated local_err
 part I
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
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, armbru@redhat.com,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVmxhZGltaXIsCgpJJ3ZlIGNvbWUgdG8gcmF0aGVyIGxpa2UgeW91ciBFUlJQX0FVVE9fUFJP
UEFHQVRFKCkgaWRlYS4gIFdoYXQgSQp3b3VsZG4ndCBsaWtlIGlzIGEgcHJvdHJhY3RlZCBjb252
ZXJzaW9uLgoKT25jZSB3ZSdyZSBoYXBweSB3aXRoIFBBVENIIDEtMywgaXQncyBhIG1hdHRlciBv
ZiBydW5uaW5nIENvY2NpbmVsbGUgYW5kCnJldmlld2luZyBpdHMgb3V0cHV0LiAgSSdtIGNvbmZp
ZGVudCB3ZSBjYW4gY29udmVyZ2Ugb24gUEFUQ0ggMS0zLgoKSXQncyB0d28gd2Vla3MgdW50aWwg
c29mdCBmcmVlemUuICBXZSBuZWVkIHRvIGRlY2lkZSB3aGV0aGVyIHRvIHB1cnN1ZSBhCnBhcnRp
YWwgY29udmVyc2lvbiBmb3IgNS4wIChiYXNpY2FsbHkgdGhpcyBzZXJpZXMgcGx1cyB0aGUgdHdv
IHBhdGNoZXMKd2UgaWRlbnRpZmllZCBpbiByZXZpZXcgb2YgUEFUQ0ggMSksIG9yIGRlbGF5IHVu
dGlsIDUuMS4gIEluIGVpdGhlcgpjYXNlLCBJIHdhbnQgdGhlIGNvbnZlcnNpb24gdG8gYmUgZmlu
aXNoZWQgaW4gNS4xLgoKUGxlYXNlIGRvIG5vdCBmZWVsIHByZXNzdXJlZCB0byBtYWtlIHRoZSA1
LjAgZGVhZGxpbmUuCgpJIGNhbiBxdWV1ZSB1cCBwYXRjaGVzIGZvciA1LjEgZHVyaW5nIHRoZSBm
cmVlemUuCgpIb3cgd291bGQgeW91IGxpa2UgdG8gcHJvY2VlZD8KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
