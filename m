Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D58158E81
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 13:30:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Udh-0006qD-NJ; Tue, 11 Feb 2020 12:27:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zfJQ=37=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j1Udf-0006q8-Sd
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 12:27:39 +0000
X-Inumbo-ID: e3cbdb0f-4cc9-11ea-b583-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3cbdb0f-4cc9-11ea-b583-12813bfff9fa;
 Tue, 11 Feb 2020 12:27:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2392EAEAC;
 Tue, 11 Feb 2020 12:27:38 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 11 Feb 2020 13:27:36 +0100
Message-Id: <20200211122736.16714-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2] xen/sched: add some diagnostic info in the
 run queue keyhandler
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
Cc: Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBkdW1waW5nIHRoZSBydW4gcXVldWUgaW5mb3JtYXRpb24gYWRkIHNvbWUgbW9yZSBkYXRh
IHJlZ2FyZGluZwpjdXJyZW50IGFuZCAoaWYga25vd24pIHByZXZpb3VzIHZjcHUgZm9yIGVhY2gg
cGh5c2ljYWwgY3B1LgoKV2l0aCBjb3JlIHNjaGVkdWxpbmcgYWN0aXZhdGVkIHRoZSBwcmludGVk
IGRhdGEgd2lsbCBiZSBlLmcuOgoKKFhFTikgQ1BVcyBpbmZvOgooWEVOKSBDUFVbMDBdIGN1cnJl
bnQ9ZFtJRExFXXYwLCBjdXJyPWRbSURMRV12MCwgcHJldj1OVUxMCihYRU4pIENQVVswMV0gY3Vy
cmVudD1kW0lETEVddjEKKFhFTikgQ1BVWzAyXSBjdXJyZW50PWRbSURMRV12MiwgY3Vycj1kW0lE
TEVddjIsIHByZXY9TlVMTAooWEVOKSBDUFVbMDNdIGN1cnJlbnQ9ZFtJRExFXXYzCgpTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQpWMjogYWRkIHByb3Bl
ciBsb2NraW5nCi0tLQogeGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgfCAyNiArKysrKysrKysrKysr
KysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgYi94ZW4vY29tbW9u
L3NjaGVkL2NvcmUuYwppbmRleCAyZTQzZjgwMjlmLi42ZmJjMzBlNjc4IDEwMDY0NAotLS0gYS94
ZW4vY29tbW9uL3NjaGVkL2NvcmUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYwpAQCAt
MzIzNCw3ICszMjM0LDcgQEAgdm9pZCBzY2hlZHVsZXJfZnJlZShzdHJ1Y3Qgc2NoZWR1bGVyICpz
Y2hlZCkKIAogdm9pZCBzY2hlZHVsZV9kdW1wKHN0cnVjdCBjcHVwb29sICpjKQogewotICAgIHVu
c2lnbmVkIGludCAgICAgIGk7CisgICAgdW5zaWduZWQgaW50ICAgICAgaSwgajsKICAgICBzdHJ1
Y3Qgc2NoZWR1bGVyICpzY2hlZDsKICAgICBjcHVtYXNrX3QgICAgICAgICpjcHVzOwogCkBAIC0z
MjQ1LDcgKzMyNDUsNyBAQCB2b2lkIHNjaGVkdWxlX2R1bXAoc3RydWN0IGNwdXBvb2wgKmMpCiAg
ICAgaWYgKCBjICE9IE5VTEwgKQogICAgIHsKICAgICAgICAgc2NoZWQgPSBjLT5zY2hlZDsKLSAg
ICAgICAgY3B1cyA9IGMtPmNwdV92YWxpZDsKKyAgICAgICAgY3B1cyA9IGMtPnJlc192YWxpZDsK
ICAgICAgICAgcHJpbnRrKCJTY2hlZHVsZXI6ICVzICglcylcbiIsIHNjaGVkLT5uYW1lLCBzY2hl
ZC0+b3B0X25hbWUpOwogICAgICAgICBzY2hlZF9kdW1wX3NldHRpbmdzKHNjaGVkKTsKICAgICB9
CkBAIC0zMjU1LDExICszMjU1LDI1IEBAIHZvaWQgc2NoZWR1bGVfZHVtcChzdHJ1Y3QgY3B1cG9v
bCAqYykKICAgICAgICAgY3B1cyA9ICZjcHVwb29sX2ZyZWVfY3B1czsKICAgICB9CiAKLSAgICBp
ZiAoIHNjaGVkLT5kdW1wX2NwdV9zdGF0ZSAhPSBOVUxMICkKKyAgICBwcmludGsoIkNQVXMgaW5m
bzpcbiIpOworICAgIGZvcl9lYWNoX2NwdSAoaSwgY3B1cykKICAgICB7Ci0gICAgICAgIHByaW50
aygiQ1BVcyBpbmZvOlxuIik7Ci0gICAgICAgIGZvcl9lYWNoX2NwdSAoaSwgY3B1cykKLSAgICAg
ICAgICAgIHNjaGVkX2R1bXBfY3B1X3N0YXRlKHNjaGVkLCBpKTsKKyAgICAgICAgc3RydWN0IHNj
aGVkX3Jlc291cmNlICpzciA9IGdldF9zY2hlZF9yZXMoaSk7CisgICAgICAgIHVuc2lnbmVkIGxv
bmcgZmxhZ3M7CisgICAgICAgIHNwaW5sb2NrX3QgKmxvY2s7CisKKyAgICAgICAgbG9jayA9IHBj
cHVfc2NoZWR1bGVfbG9ja19pcnFzYXZlKGksICZmbGFncyk7CisKKyAgICAgICAgcHJpbnRrKCJD
UFVbJTAyZF0gY3VycmVudD0lcHYsIGN1cnI9JXB2LCBwcmV2PSVwdlxuIiwgaSwKKyAgICAgICAg
ICAgICAgIGdldF9jcHVfY3VycmVudChpKSwgc3ItPmN1cnIgPyBzci0+Y3Vyci0+dmNwdV9saXN0
IDogTlVMTCwKKyAgICAgICAgICAgICAgIHNyLT5wcmV2ID8gc3ItPnByZXYtPnZjcHVfbGlzdCA6
IE5VTEwpOworICAgICAgICBmb3JfZWFjaF9jcHUgKGosIHNyLT5jcHVzKQorICAgICAgICAgICAg
aWYgKCBpICE9IGogKQorICAgICAgICAgICAgICAgIHByaW50aygiQ1BVWyUwMmRdIGN1cnJlbnQ9
JXB2XG4iLCBqLCBnZXRfY3B1X2N1cnJlbnQoaikpOworCisgICAgICAgIHBjcHVfc2NoZWR1bGVf
dW5sb2NrX2lycXJlc3RvcmUobG9jaywgZmxhZ3MsIGkpOworCisgICAgICAgIHNjaGVkX2R1bXBf
Y3B1X3N0YXRlKHNjaGVkLCBpKTsKICAgICB9CiAKICAgICByY3VfcmVhZF91bmxvY2soJnNjaGVk
X3Jlc19yY3Vsb2NrKTsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
