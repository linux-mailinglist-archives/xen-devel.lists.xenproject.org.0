Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBBA10A343
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 18:21:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZeUD-0002CO-Gv; Tue, 26 Nov 2019 17:18:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G2sx=ZS=amazon.com=prvs=226091ee5=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZeUB-0002C1-OC
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 17:18:47 +0000
X-Inumbo-ID: ce20168e-1070-11ea-b155-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce20168e-1070-11ea-b155-bc764e2007e4;
 Tue, 26 Nov 2019 17:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574788728; x=1606324728;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z6J5/hXta2S22gaWo21MAF1aBFejb5nQtmeLzX8YuUs=;
 b=gwBHvHEQ/sJxFBO5F5Y6/fiu7hODZlyJrJJ8Uez412qgI7lptRBX7pIe
 wRHaQFAvzYu004MBnYWUZPRtX6uOm0cKVp5R2mJcV5D133Ncir1zaIKzC
 +tF0HYtT35slu9+L1Ys1J/rtydqsLTcC0fN9fX6PNaBvIQIdaFp29uTd6 A=;
IronPort-SDR: BwYEWlJRZgssE+ZJXZc/w5tW4s1VZRosdAZ8KsdMi15vW8L8eanw9+B1DDw0ih2QUsQJbV9FIa
 OEfxZ/Ib1QFg==
X-IronPort-AV: E=Sophos;i="5.69,246,1571702400"; d="scan'208";a="10012929"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-c300ac87.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 26 Nov 2019 17:17:27 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c300ac87.us-west-2.amazon.com (Postfix) with ESMTPS
 id E97DCA2563; Tue, 26 Nov 2019 17:17:26 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 17:17:26 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 17:17:25 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 26 Nov 2019 17:17:23 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 17:17:15 +0000
Message-ID: <20191126171715.10881-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] xen/x86: vpmu: Unmap per-vCPU PMU page when the
 domain is destroyed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <pdurrant@amazon.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KCkEgZ3Vlc3Qgd2lsbCBzZXR1
cCBhIHNoYXJlZCBwYWdlIHdpdGggdGhlIGh5cGVydmlzb3IgZm9yIGVhY2ggdkNQVSB2aWEKWEVO
UE1VX2luaXQuIFRoZSBwYWdlIHdpbGwgdGhlbiBnZXQgbWFwcGVkIGluIHRoZSBoeXBlcnZpc29y
IGFuZCBvbmx5CnJlbGVhc2VkIHdoZW4gWEVNUE1VX2ZpbmlzaCBpcyBjYWxsZWQuCgpUaGlzIG1l
YW5zIHRoYXQgaWYgdGhlIGd1ZXN0IGlzIG5vdCBzaHV0ZG93biBncmFjZWZ1bGx5IChzdWNoIGFz
IHZpYSB4bApkZXN0cm95KSwgdGhlIHBhZ2Ugd2lsbCBzdGF5IG1hcHBlZCBpbiB0aGUgaHlwZXJ2
aXNvci4gT25lIG9mIHRoZQpjb25zZXF1ZW5jZSBpcyB0aGUgZG9tYWluIGNhbiBuZXZlciBiZSBm
dWxseSBkZXN0cm95ZWQgYXMgc29tZSBvZiBpdHMKbWVtb3J5IGlzIHN0aWxsIG1hcHBlZC4KCkFz
IFhlbiBzaG91bGQgbmV2ZXIgcmVseSBvbiB0aGUgZ3Vlc3QgdG8gY29ycmVjdGx5IGNsZWFuLXVw
IGFueQphbGxvY2F0aW9uIGluIHRoZSBoeXBlcnZpc29yLCB3ZSBzaG91bGQgYWxzbyB1bm1hcCBw
YWdlcyBkdXJpbmcgdGhlCmRvbWFpbiBkZXN0cnVjdGlvbiBpZiB0aGVyZSBhcmUgYW55IGxlZnQu
CgpXZSBjYW4gcmUtdXNlIHRoZSBzYW1lIGxvZ2ljIGFzIGluIHB2cG11X2ZpbmlzaCgpLiBUbyBh
dm9pZApkdXBsaWNhdGlvbiwgbW92ZSB0aGUgbG9naWMgaW4gYSBuZXcgZnVuY3Rpb24gdGhhdCBj
YW4gYWxzbyBiZSBjYWxsZWQKZnJvbSB2cG11X2Rlc3Ryb3koKS4KCk5PVEU6IFRoZSBjYWxsIHRv
IHZwbXVfZGVzdHJveSgpIG11c3QgYWxzbyBiZSBtb3ZlZCBmcm9tCiAgICAgIGFyY2hfdmNwdV9k
ZXN0cm95KCkgaW50byBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSBzdWNoIHRoYXQgdGhl
CiAgICAgIG1hcHBlZCBwYWdlIGRvZXMgbm90IHByZXZlbnQgZG9tYWluX2Rlc3Ryb3koKSAod2hp
Y2ggY2FsbHMKICAgICAgYXJjaF92Y3B1X2Rlc3Ryb3koKSkgZnJvbSBiZWluZyBjYWxsZWQuCgpT
aWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgpTaWduZWQtb2Zm
LWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Ci0tLQpDYzogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNjOiAiUm9nZXIgUGF1IE1vbm7D
qSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9jcHUvdnBtdS5jIHwg
NDUgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4
Ni9kb21haW4uYyAgIHwgIDYgKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMo
KyksIDIzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdS5j
IGIveGVuL2FyY2gveDg2L2NwdS92cG11LmMKaW5kZXggZjM5NzE4M2VjMy4uOWFlNGVkNDhjOCAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2NwdS92cG11LmMKKysrIGIveGVuL2FyY2gveDg2L2Nw
dS92cG11LmMKQEAgLTU3OCw5ICs1NzgsMzIgQEAgc3RhdGljIHZvaWQgdnBtdV9hcmNoX2Rlc3Ry
b3koc3RydWN0IHZjcHUgKnYpCiAgICAgfQogfQogCi12b2lkIHZwbXVfZGVzdHJveShzdHJ1Y3Qg
dmNwdSAqdikKK3N0YXRpYyB2b2lkIHZwbXVfY2xlYW51cChzdHJ1Y3QgdmNwdSAqdikKIHsKKyAg
ICBzdHJ1Y3QgdnBtdV9zdHJ1Y3QgKnZwbXUgPSB2Y3B1X3ZwbXUodik7CisgICAgbWZuX3QgbWZu
OworICAgIHZvaWQgKnhlbnBtdV9kYXRhOworCisgICAgc3Bpbl9sb2NrKCZ2cG11LT52cG11X2xv
Y2spOworCiAgICAgdnBtdV9hcmNoX2Rlc3Ryb3kodik7CisgICAgeGVucG11X2RhdGEgPSB2cG11
LT54ZW5wbXVfZGF0YTsKKyAgICB2cG11LT54ZW5wbXVfZGF0YSA9IE5VTEw7CisKKyAgICBzcGlu
X3VubG9jaygmdnBtdS0+dnBtdV9sb2NrKTsKKworICAgIGlmICggeGVucG11X2RhdGEgKQorICAg
IHsKKyAgICAgICAgbWZuID0gZG9tYWluX3BhZ2VfbWFwX3RvX21mbih4ZW5wbXVfZGF0YSk7Cisg
ICAgICAgIEFTU0VSVChtZm5fdmFsaWQobWZuKSk7CisgICAgICAgIHVubWFwX2RvbWFpbl9wYWdl
X2dsb2JhbCh4ZW5wbXVfZGF0YSk7CisgICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKG1mbl90b19w
YWdlKG1mbikpOworICAgIH0KK30KKwordm9pZCB2cG11X2Rlc3Ryb3koc3RydWN0IHZjcHUgKnYp
Cit7CisgICAgdnBtdV9jbGVhbnVwKHYpOwogCiAgICAgcHV0X3ZwbXUodik7CiB9CkBAIC02Mzks
OSArNjYyLDYgQEAgc3RhdGljIGludCBwdnBtdV9pbml0KHN0cnVjdCBkb21haW4gKmQsIHhlbl9w
bXVfcGFyYW1zX3QgKnBhcmFtcykKIHN0YXRpYyB2b2lkIHB2cG11X2ZpbmlzaChzdHJ1Y3QgZG9t
YWluICpkLCB4ZW5fcG11X3BhcmFtc190ICpwYXJhbXMpCiB7CiAgICAgc3RydWN0IHZjcHUgKnY7
Ci0gICAgc3RydWN0IHZwbXVfc3RydWN0ICp2cG11OwotICAgIG1mbl90IG1mbjsKLSAgICB2b2lk
ICp4ZW5wbXVfZGF0YTsKIAogICAgIGlmICggKHBhcmFtcy0+dmNwdSA+PSBkLT5tYXhfdmNwdXMp
IHx8IChkLT52Y3B1W3BhcmFtcy0+dmNwdV0gPT0gTlVMTCkgKQogICAgICAgICByZXR1cm47CkBA
IC02NTAsMjIgKzY3MCw3IEBAIHN0YXRpYyB2b2lkIHB2cG11X2ZpbmlzaChzdHJ1Y3QgZG9tYWlu
ICpkLCB4ZW5fcG11X3BhcmFtc190ICpwYXJhbXMpCiAgICAgaWYgKCB2ICE9IGN1cnJlbnQgKQog
ICAgICAgICB2Y3B1X3BhdXNlKHYpOwogCi0gICAgdnBtdSA9IHZjcHVfdnBtdSh2KTsKLSAgICBz
cGluX2xvY2soJnZwbXUtPnZwbXVfbG9jayk7Ci0KLSAgICB2cG11X2FyY2hfZGVzdHJveSh2KTsK
LSAgICB4ZW5wbXVfZGF0YSA9IHZwbXUtPnhlbnBtdV9kYXRhOwotICAgIHZwbXUtPnhlbnBtdV9k
YXRhID0gTlVMTDsKLQotICAgIHNwaW5fdW5sb2NrKCZ2cG11LT52cG11X2xvY2spOwotCi0gICAg
aWYgKCB4ZW5wbXVfZGF0YSApCi0gICAgewotICAgICAgICBtZm4gPSBkb21haW5fcGFnZV9tYXBf
dG9fbWZuKHhlbnBtdV9kYXRhKTsKLSAgICAgICAgQVNTRVJUKG1mbl92YWxpZChtZm4pKTsKLSAg
ICAgICAgdW5tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsKHhlbnBtdV9kYXRhKTsKLSAgICAgICAgcHV0
X3BhZ2VfYW5kX3R5cGUobWZuX3RvX3BhZ2UobWZuKSk7Ci0gICAgfQorICAgIHZwbXVfY2xlYW51
cCh2KTsKIAogICAgIGlmICggdiAhPSBjdXJyZW50ICkKICAgICAgICAgdmNwdV91bnBhdXNlKHYp
OwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbi5jIGIveGVuL2FyY2gveDg2L2RvbWFp
bi5jCmluZGV4IGYxZGQ4NmUxMmUuLjFkNzViMmU2YzMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9kb21haW4uYworKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKQEAgLTQ1NCw5ICs0NTQsNiBA
QCB2b2lkIGFyY2hfdmNwdV9kZXN0cm95KHN0cnVjdCB2Y3B1ICp2KQogICAgIHhmcmVlKHYtPmFy
Y2gubXNycyk7CiAgICAgdi0+YXJjaC5tc3JzID0gTlVMTDsKIAotICAgIGlmICggIWlzX2lkbGVf
ZG9tYWluKHYtPmRvbWFpbikgKQotICAgICAgICB2cG11X2Rlc3Ryb3kodik7Ci0KICAgICBpZiAo
IGlzX2h2bV92Y3B1KHYpICkKICAgICAgICAgaHZtX3ZjcHVfZGVzdHJveSh2KTsKICAgICBlbHNl
CkBAIC0yMjI0LDYgKzIyMjEsOSBAQCBpbnQgZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKHN0
cnVjdCBkb21haW4gKmQpCiAgICAgaWYgKCBpc19odm1fZG9tYWluKGQpICkKICAgICAgICAgaHZt
X2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcyhkKTsKIAorICAgIGZvcl9lYWNoX3ZjcHUgKCBk
LCB2ICkKKyAgICAgICAgdnBtdV9kZXN0cm95KHYpOworCiAgICAgcmV0dXJuIDA7CiB9CiAKLS0g
CjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
