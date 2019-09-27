Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 992E6C097E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 18:21:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDswa-0002U3-8h; Fri, 27 Sep 2019 16:18:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qPq4=XW=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iDswY-0002T7-87
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 16:18:07 +0000
X-Inumbo-ID: 5fe1c1ac-e142-11e9-b588-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::6])
 by localhost (Halon) with ESMTPS
 id 5fe1c1ac-e142-11e9-b588-bc764e2007e4;
 Fri, 27 Sep 2019 16:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1569601080;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=+LqA3RdCHozXgYfWDdpeb4PStAKTCTOLXtoCcFUJKVM=;
 b=aUOJ5uvreCBzXSm/N6HoUaFFOEu17Cy+2nX8hefl635A0562qwZbKtl3Tq8/C9DGEj
 ve/rMFN4QQurGjhRXMoM4r0Z+CTS6BuoHvBfaUY2JwPd+TyKIjRuBereZagH9rzN+0Rq
 6nJkxRqDgHcg7WKi2j81V2r5mk+QOROERkjbQxyXjxFrkgv1l3U1qh0upBVUoJgeySfj
 P0reHKkDxxWS7rs3ijAs/cg5Jo0DgxyZs3x5aNdO8OueyAn3NhylBKQ7Kau2+8CsUX4a
 4/B5hUCy3GZYJNh6AEUJzRt2trysUPod/rHR8amJE+uU9g7cVRTO2FKxI6SZ2fnqzduk
 UWkA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuznLRsvz6zGrN/JP2665"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 AUTH)
 with ESMTPSA id j06a90v8RGHnEU3
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 27 Sep 2019 18:17:49 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 18:17:46 +0200
Message-Id: <20190927161746.25902-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1] libxl: fix crash in helper_done due to
 uninitialized data
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Olaf Hering <olaf@aepfle.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBjcmFzaCBpbiBoZWxwZXJfZG9uZSwgY2FsbGVkIGZyb20gbGlieGxfZG9tYWluX3N1c3BlbmQs
IHdhcyByZXBvcnRlZCwKdHJpZ2dlcmVkIGJ5ICd2aXJzaCBtaWdyYXRlIC0tbGl2ZSB4ZW4rc3No
Oi8vaG9zdCc6CgogIzEgaGVscGVyX2RvbmUgKC4uLikgYXQgbGlieGxfc2F2ZV9jYWxsb3V0LmM6
MzcxCiAgaGVscGVyX2ZhaWxlZAogIGhlbHBlcl9zdG9wCiAgbGlieGxfX3NhdmVfaGVscGVyX2Fi
b3J0CiAjMiBjaGVja19hbGxfZmluaXNoZWQgKC4uLiwgcmM9LTMpIGF0IGxpYnhsX3N0cmVhbV93
cml0ZS5jOjY3MQogIHN0cmVhbV9kb25lCiAgc3RyZWFtX2NvbXBsZXRlCiAgd3JpdGVfZG9uZQog
IGRjLT5jYWxsYmFjayA9PSB3cml0ZV9kb25lCiAgZWZkLT5mdW5jID09IGRhdGFjb3BpZXJfd3Jp
dGFibGUKICMzIGFmdGVycG9sbF9pbnRlcm5hbCAoLi4uKSBhdCBsaWJ4bF9ldmVudC5jOjEyNjkK
ClRoaXMgaXMgdHJpZ2dlcmVkIGJ5IGEgZmFpbGVkIHBvbGwsIHRoZSBhY3R1YWwgZXJyb3Igd2Fz
OgoKbGlieGxfYW91dGlscy5jOjMyODpkYXRhY29waWVyX3dyaXRhYmxlOiB1bmV4cGVjdGVkIHBv
bGwgZXZlbnQgMHgxYyBvbiBmZCAzNyAoc2hvdWxkIGJlIFBPTExPVVQpIHdyaXRpbmcgbGlieGMg
aGVhZGVyIGR1cmluZyBjb3B5IG9mIHNhdmUgdjIgc3RyZWFtCgpJbiB0aGlzIGNhc2UgcmV2ZW50
cyBpbiBkYXRhY29waWVyX3dyaXRhYmxlIGlzIFBPTExIVVB8UE9MTEVSUnxQT0xMT1VULAp3aGlj
aCB0cmlnZ2VycyBkYXRhY29waWVyX2NhbGxiYWNrLiBJbiBoZWxwZXJfZG9uZSwKc2hzLT5jb21w
bGV0aW9uX2NhbGxiYWNrIGlzIHN0aWxsIHplcm8uIGxpYnhsX194Y19kb21haW5fc2F2ZSBmaWxs
cwpkc3Muc3dzLnNocy4gQnV0IHRoYXQgZnVuY3Rpb24gaXMgb25seSBjYWxsZWQgYWZ0ZXIgc3Ry
ZWFtX2hlYWRlcl9kb25lLgpBbnkgZXJyb3IgYmVmb3JlIHRoYXQgd2lsbCBsZWF2ZSBkc3MgcGFy
dGx5IHVuaW5pdGlhbGl6ZWQuCgpGaXggdGhpcyBjcmFzaCBieSBjaGVja2luZyBpZiAtPmNvbXBs
ZXRpb25fY2FsbGJhY2sgaXMgdmFsaWQuCgpTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xh
ZkBhZXBmbGUuZGU+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfc2F2ZV9jYWxsb3V0LmMgfCA1ICsr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3NhdmVfY2FsbG91dC5jIGIvdG9vbHMvbGlieGwv
bGlieGxfc2F2ZV9jYWxsb3V0LmMKaW5kZXggNjQ1MmQ3MDAzNi4uODlhMmY2ZWNmMCAxMDA2NDQK
LS0tIGEvdG9vbHMvbGlieGwvbGlieGxfc2F2ZV9jYWxsb3V0LmMKKysrIGIvdG9vbHMvbGlieGwv
bGlieGxfc2F2ZV9jYWxsb3V0LmMKQEAgLTM2Niw4ICszNjYsOSBAQCBzdGF0aWMgdm9pZCBoZWxw
ZXJfZG9uZShsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19zYXZlX2hlbHBlcl9zdGF0ZSAqc2hzKQog
ICAgIGFzc2VydCghbGlieGxfX3NhdmVfaGVscGVyX2ludXNlKHNocykpOwogCiAgICAgc2hzLT5l
Z2MgPSBlZ2M7Ci0gICAgc2hzLT5jb21wbGV0aW9uX2NhbGxiYWNrKGVnYywgc2hzLT5jYWxsZXJf
c3RhdGUsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNocy0+cmMsIHNocy0+cmV0dmFs
LCBzaHMtPmVycm5vdmFsKTsKKyAgICBpZiAoc2hzLT5jb21wbGV0aW9uX2NhbGxiYWNrKQorICAg
ICAgICBzaHMtPmNvbXBsZXRpb25fY2FsbGJhY2soZWdjLCBzaHMtPmNhbGxlcl9zdGF0ZSwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNocy0+cmMsIHNocy0+cmV0dmFsLCBzaHMt
PmVycm5vdmFsKTsKICAgICBzaHMtPmVnYyA9IDA7CiB9CiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
