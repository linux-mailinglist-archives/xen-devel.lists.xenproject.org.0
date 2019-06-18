Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D00349F20
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 13:27:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdCDM-0001V2-1L; Tue, 18 Jun 2019 11:23:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OpMR=UR=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hdCDK-0001Te-40
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 11:23:46 +0000
X-Inumbo-ID: 88937ca3-91bb-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 88937ca3-91bb-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 11:23:45 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0YgI770VsdhoIsphZWcQsKcBuzjS8UWsFf1zYfmmFTerRJBZpdH3Nf+9s4UWKHZShSF14ImmcB
 /ywwj7hsJ6tXiTtcUPx0/rK19zftTQnCI4eWjBFGTn3jyI0Q6XAPgBo6BfWETnS8xXlz6GqSfQ
 q/lh0RoR6DAoNC1jhXHn9BCAD3JL24Yo0Rq4euZ+H7gweGm4dctu76L4ECTuURCOp0eTNUed+6
 79K0L+sOuXsp6q04UVCEcdOLd0SC9+llZydC1lxgM3wHNtgX7B22OEh3dKtXCDytK0bdEsEyib
 h9Y=
X-SBRS: 2.7
X-MesageID: 1889399
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,389,1557201600"; 
   d="scan'208";a="1889399"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 18 Jun 2019 12:23:41 +0100
Message-ID: <20190618112341.513-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190618112341.513-1-anthony.perard@citrix.com>
References: <20190618112341.513-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 4/4] xen: Avoid VLA
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul.durrant@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXZvaWQgdXNpbmcgYSB2YXJpYWJsZSBsZW5ndGggYXJyYXkuCgpXZSBhbGxvY2F0ZSB0aGUgYGRp
cnR5X2JpdG1hcCcgYnVmZmVyIG9ubHkgb25jZSB3aGVuIHdlIHN0YXJ0IHRyYWNraW5nCmZvciBk
aXJ0eSBiaXRzLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2MjoKICAgIC0gQWxsb2NhdGUgdGhlIGJpdG1h
cCBidWZmZXIgb25seSBvbmNlIHdoZW4gd2Ugc3RhcnQgdHJhY2tpbmcgZGlydHkgYml0cy4KICAg
ICAgKGluc3RlYWQgb2YgYXQgZXZlcnkgZnVuY3Rpb24gY2FsbCkKICAgIAogICAgV2FzIHN1Z2dl
c3RlZCBieSBQZXRlciBoZXJlOgogICAgPENBRkVBY0E4OCtBMm9Da1FueEtERWRwbWZDWlNtUHpX
TUJnMDF3RERWNjhiTVpvWTVKZ0BtYWlsLmdtYWlsLmNvbT4KICAgICJzaG91bGQgd2UgdHJ5IHRv
IHN0b3AgdXNpbmcgdmFyaWFibGUgbGVuZ3RoIGFycmF5cz8iCgogaHcvaTM4Ni94ZW4veGVuLWh2
bS5jIHwgMTUgKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody9pMzg2L3hlbi94ZW4taHZtLmMgYi9o
dy9pMzg2L3hlbi94ZW4taHZtLmMKaW5kZXggYWUzZGViNGVmMy4uNDY5ZjEyNjBhNCAxMDA2NDQK
LS0tIGEvaHcvaTM4Ni94ZW4veGVuLWh2bS5jCisrKyBiL2h3L2kzODYveGVuL3hlbi1odm0uYwpA
QCAtMTE5LDYgKzExOSw4IEBAIHR5cGVkZWYgc3RydWN0IFhlbklPU3RhdGUgewogICAgIERldmlj
ZUxpc3RlbmVyIGRldmljZV9saXN0ZW5lcjsKICAgICBod2FkZHIgZnJlZV9waHlzX29mZnNldDsK
ICAgICBjb25zdCBYZW5QaHlzbWFwICpsb2dfZm9yX2RpcnR5Yml0OworICAgIC8qIEJ1ZmZlciB1
c2VkIGJ5IHhlbl9zeW5jX2RpcnR5X2JpdG1hcCAqLworICAgIHVuc2lnbmVkIGxvbmcgKmRpcnR5
X2JpdG1hcDsKIAogICAgIE5vdGlmaWVyIGV4aXQ7CiAgICAgTm90aWZpZXIgc3VzcGVuZDsKQEAg
LTQ2NCw2ICs0NjYsOCBAQCBzdGF0aWMgaW50IHhlbl9yZW1vdmVfZnJvbV9waHlzbWFwKFhlbklP
U3RhdGUgKnN0YXRlLAogICAgIFFMSVNUX1JFTU9WRShwaHlzbWFwLCBsaXN0KTsKICAgICBpZiAo
c3RhdGUtPmxvZ19mb3JfZGlydHliaXQgPT0gcGh5c21hcCkgewogICAgICAgICBzdGF0ZS0+bG9n
X2Zvcl9kaXJ0eWJpdCA9IE5VTEw7CisgICAgICAgIGdfZnJlZShzdGF0ZS0+ZGlydHlfYml0bWFw
KTsKKyAgICAgICAgc3RhdGUtPmRpcnR5X2JpdG1hcCA9IE5VTEw7CiAgICAgfQogICAgIGdfZnJl
ZShwaHlzbWFwKTsKIApAQCAtNjE0LDcgKzYxOCw3IEBAIHN0YXRpYyB2b2lkIHhlbl9zeW5jX2Rp
cnR5X2JpdG1hcChYZW5JT1N0YXRlICpzdGF0ZSwKIHsKICAgICBod2FkZHIgbnBhZ2VzID0gc2l6
ZSA+PiBUQVJHRVRfUEFHRV9CSVRTOwogICAgIGNvbnN0IGludCB3aWR0aCA9IHNpemVvZih1bnNp
Z25lZCBsb25nKSAqIDg7Ci0gICAgdW5zaWduZWQgbG9uZyBiaXRtYXBbRElWX1JPVU5EX1VQKG5w
YWdlcywgd2lkdGgpXTsKKyAgICBzaXplX3QgYml0bWFwX3NpemUgPSBESVZfUk9VTkRfVVAobnBh
Z2VzLCB3aWR0aCk7CiAgICAgaW50IHJjLCBpLCBqOwogICAgIGNvbnN0IFhlblBoeXNtYXAgKnBo
eXNtYXAgPSBOVUxMOwogCkBAIC02MjYsMTMgKzYzMCwxNCBAQCBzdGF0aWMgdm9pZCB4ZW5fc3lu
Y19kaXJ0eV9iaXRtYXAoWGVuSU9TdGF0ZSAqc3RhdGUsCiAKICAgICBpZiAoc3RhdGUtPmxvZ19m
b3JfZGlydHliaXQgPT0gTlVMTCkgewogICAgICAgICBzdGF0ZS0+bG9nX2Zvcl9kaXJ0eWJpdCA9
IHBoeXNtYXA7CisgICAgICAgIHN0YXRlLT5kaXJ0eV9iaXRtYXAgPSBnX25ldyh1bnNpZ25lZCBs
b25nLCBiaXRtYXBfc2l6ZSk7CiAgICAgfSBlbHNlIGlmIChzdGF0ZS0+bG9nX2Zvcl9kaXJ0eWJp
dCAhPSBwaHlzbWFwKSB7CiAgICAgICAgIC8qIE9ubHkgb25lIHJhbmdlIGZvciBkaXJ0eSBiaXRt
YXAgY2FuIGJlIHRyYWNrZWQuICovCiAgICAgICAgIHJldHVybjsKICAgICB9CiAKICAgICByYyA9
IHhlbl90cmFja19kaXJ0eV92cmFtKHhlbl9kb21pZCwgc3RhcnRfYWRkciA+PiBUQVJHRVRfUEFH
RV9CSVRTLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnBhZ2VzLCBiaXRtYXApOwor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnBhZ2VzLCBzdGF0ZS0+ZGlydHlfYml0bWFw
KTsKICAgICBpZiAocmMgPCAwKSB7CiAjaWZuZGVmIEVOT0RBVEEKICNkZWZpbmUgRU5PREFUQSAg
RU5PRU5UCkBAIC02NDYsOCArNjUxLDggQEAgc3RhdGljIHZvaWQgeGVuX3N5bmNfZGlydHlfYml0
bWFwKFhlbklPU3RhdGUgKnN0YXRlLAogICAgICAgICByZXR1cm47CiAgICAgfQogCi0gICAgZm9y
IChpID0gMDsgaSA8IEFSUkFZX1NJWkUoYml0bWFwKTsgaSsrKSB7Ci0gICAgICAgIHVuc2lnbmVk
IGxvbmcgbWFwID0gYml0bWFwW2ldOworICAgIGZvciAoaSA9IDA7IGkgPCBiaXRtYXBfc2l6ZTsg
aSsrKSB7CisgICAgICAgIHVuc2lnbmVkIGxvbmcgbWFwID0gc3RhdGUtPmRpcnR5X2JpdG1hcFtp
XTsKICAgICAgICAgd2hpbGUgKG1hcCAhPSAwKSB7CiAgICAgICAgICAgICBqID0gY3R6bChtYXAp
OwogICAgICAgICAgICAgbWFwICY9IH4oMXVsIDw8IGopOwpAQCAtNjc3LDYgKzY4Miw4IEBAIHN0
YXRpYyB2b2lkIHhlbl9sb2dfc3RvcChNZW1vcnlMaXN0ZW5lciAqbGlzdGVuZXIsIE1lbW9yeVJl
Z2lvblNlY3Rpb24gKnNlY3Rpb24sCiAKICAgICBpZiAob2xkICYgfm5ldyAmICgxIDw8IERJUlRZ
X01FTU9SWV9WR0EpKSB7CiAgICAgICAgIHN0YXRlLT5sb2dfZm9yX2RpcnR5Yml0ID0gTlVMTDsK
KyAgICAgICAgZ19mcmVlKHN0YXRlLT5kaXJ0eV9iaXRtYXApOworICAgICAgICBzdGF0ZS0+ZGly
dHlfYml0bWFwID0gTlVMTDsKICAgICAgICAgLyogRGlzYWJsZSBkaXJ0eSBiaXQgdHJhY2tpbmcg
Ki8KICAgICAgICAgeGVuX3RyYWNrX2RpcnR5X3ZyYW0oeGVuX2RvbWlkLCAwLCAwLCBOVUxMKTsK
ICAgICB9Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
