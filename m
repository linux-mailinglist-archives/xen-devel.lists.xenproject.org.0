Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE74C221C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 15:35:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEvo9-0005jz-3z; Mon, 30 Sep 2019 13:33:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=znM2=XZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iEvo7-0005ik-6o
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 13:33:43 +0000
X-Inumbo-ID: e40f1a10-e386-11e9-97fb-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id e40f1a10-e386-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 13:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569850410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bqa+mZRc/9alYURjatEvLIFM2PBvEfV2qKyP0A+lpss=;
 b=CFDfs+34DipWz1OeRTby6Jqrfv4mn02VlPGoGNSinwwVNbwuabQM70xF
 fi2wxJJfy8/beMB4YQrnb5I9zGVRXBJGKYJ5krKt9dPrdRP9hj9nffvEQ
 WLyMhWfMQcEwJlW5z//m9oxkybKkr8G9vA5rLhPK0e9Nxk6mmaeV996c7 Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jsxn3nV9LZvrVpiuxX8CBndFKAn9kUhdyswjPeW+87TwabwEV9ppO5KuVgtBbpWlTZSLKiLVmB
 xeL4pJQ/Xea4w6UaSomJqJkD2WJba7WHOU4oQTBew9vosTuBV9cYiosjAs2oAP4In3JE2XHMkF
 M/yhzeY8Lt2UaBfJ5EmER/H5N9hnLyCmzDGd4AFaJRAmEcEaoZbmiFinsIqajswispeantyaNh
 QYUHJ7UPshbX1SC5U7wMODXKtUJEXRgyG9ccG2MbEeLsMi/+R4ek7PzHeS5B7Xix3MNpjgCxUr
 YVE=
X-SBRS: 2.7
X-MesageID: 6602549
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6602549"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 15:32:38 +0200
Message-ID: <20190930133238.49868-11-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930133238.49868-1-roger.pau@citrix.com>
References: <20190930133238.49868-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 10/10] ioreq: provide support for
 long-running operations...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uYW5kIHN3aXRjaCB2UENJIHRvIHVzZSB0aGlzIGluZnJhc3RydWN0dXJlIGZvciBsb25nIHJ1
bm5pbmcKcGh5c21hcCBtb2RpZmljYXRpb24gb3BlcmF0aW9ucy4KClRoaXMgYWxsb3dzIHRvIGdl
dCByaWQgb2YgdGhlIHZQQ0kgc3BlY2lmaWMgbW9kaWZpY2F0aW9ucyBkb25lIHRvCmhhbmRsZV9o
dm1faW9fY29tcGxldGlvbiBhbmQgYWxsb3dzIGdlbmVyYWxpemluZyB0aGUgc3VwcG9ydCBmb3IK
bG9uZy1ydW5uaW5nIG9wZXJhdGlvbnMgdG8gb3RoZXIgaW50ZXJuYWwgaW9yZXEgc2VydmVycy4g
U3VjaCBzdXBwb3J0CmlzIGltcGxlbWVudGVkIGFzIGEgc3BlY2lmaWMgaGFuZGxlciB0aGF0IGNh
biBiZSByZWdpc3RlcnMgYnkgaW50ZXJuYWwKaW9yZXEgc2VydmVycyBhbmQgdGhhdCB3aWxsIGJl
IGNhbGxlZCB0byBjaGVjayBmb3IgcGVuZGluZyB3b3JrLgpSZXR1cm5pbmcgdHJ1ZSBmcm9tIHRo
aXMgaGFuZGxlciB3aWxsIHByZXZlbnQgdGhlIHZjcHUgZnJvbSBydW5uaW5nCnVudGlsIHRoZSBo
YW5kbGVyIHJldHVybnMgZmFsc2UuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjI6CiAtIFJlbW92ZSBleHRy
YSBuZXdsaW5lIGluIHZwY2lfcHJvY2Vzc19wZW5kaW5nLgogLSBDb250aW51ZSBlYXJseSBpbiBo
YW5kbGVfaHZtX2lvX2NvbXBsZXRpb24gaW4gb3JkZXIgdG8gYXZvaWQgb25lCiAgIGV4dHJhIGxl
dmVsIG9mIGluZGVudGF0aW9uLgogLSBTd2l0Y2ggc2V0dGluZyB0aGUgaW9yZXEgc3RhdGUgdG8g
YSB0ZXJuYXJ5IGNvbmRpdGlvbmFsIG9wZXJhdG9yLgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vaW9y
ZXEuYyAgICAgICB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIHhlbi9kcml2
ZXJzL3ZwY2kvaGVhZGVyLmMgICAgICB8IDYwICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0KIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jICAgICAgICB8ICA5ICsrKystCiB4ZW4vaW5j
bHVkZS9hc20teDg2L2h2bS92Y3B1LmggfCAgMyArLQogeGVuL2luY2x1ZGUveGVuL3ZwY2kuaCAg
ICAgICAgIHwgIDYgLS0tLQogNSBmaWxlcyBjaGFuZ2VkLCA4OSBpbnNlcnRpb25zKCspLCA0NCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgYi94ZW4v
YXJjaC94ODYvaHZtL2lvcmVxLmMKaW5kZXggZjM2ODRmYzY0OC4uNzgzMjJkZmE2NyAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9y
ZXEuYwpAQCAtMjM5LDE2ICsyMzksNDggQEAgYm9vbCBoYW5kbGVfaHZtX2lvX2NvbXBsZXRpb24o
c3RydWN0IHZjcHUgKnYpCiAgICAgZW51bSBodm1faW9fY29tcGxldGlvbiBpb19jb21wbGV0aW9u
OwogICAgIHVuc2lnbmVkIGludCBpZDsKIAotICAgIGlmICggaGFzX3ZwY2koZCkgJiYgdnBjaV9w
cm9jZXNzX3BlbmRpbmcodikgKQotICAgIHsKLSAgICAgICAgcmFpc2Vfc29mdGlycShTQ0hFRFVM
RV9TT0ZUSVJRKTsKLSAgICAgICAgcmV0dXJuIGZhbHNlOwotICAgIH0KLQotICAgIEZPUl9FQUNI
X0VYVEVSTkFMX0lPUkVRX1NFUlZFUihkLCBpZCwgcykKKyAgICBGT1JfRUFDSF9JT1JFUV9TRVJW
RVIoZCwgaWQsIHMpCiAgICAgewogICAgICAgICBzdHJ1Y3QgaHZtX2lvcmVxX3ZjcHUgKnN2Owog
CisgICAgICAgIGlmICggaHZtX2lvcmVxX2lzX2ludGVybmFsKGlkKSApCisgICAgICAgIHsKKyAg
ICAgICAgICAgIGlvcmVxX3QgcmVxID0gdmlvLT5pb19yZXE7CisKKyAgICAgICAgICAgIGlmICgg
dmlvLT5pb19yZXEuc3RhdGUgIT0gU1RBVEVfSU9SRVFfSU5QUk9DRVNTICkKKyAgICAgICAgICAg
ICAgICBjb250aW51ZTsKKworICAgICAgICAgICAgLyoKKyAgICAgICAgICAgICAqIENoZWNrIGFu
ZCBjb252ZXJ0IHRoZSBQSU8vTU1JTyBpb3JlcSB0byBhIFBDSSBjb25maWcgc3BhY2UKKyAgICAg
ICAgICAgICAqIGFjY2Vzcy4KKyAgICAgICAgICAgICAqLworICAgICAgICAgICAgY29udmVydF9w
Y2lfaW9yZXEoZCwgJnJlcSk7CisKKyAgICAgICAgICAgIGlmICggcy0+aGFuZGxlcigmcmVxLCBz
LT5kYXRhKSA9PSBYODZFTVVMX1JFVFJZICkKKyAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAg
ICAvKgorICAgICAgICAgICAgICAgICAqIE5lZWQgdG8gcmFpc2UgYSBzY2hlZHVsZXIgaXJxIGlu
IG9yZGVyIHRvIHByZXZlbnQgdGhlCisgICAgICAgICAgICAgICAgICogZ3Vlc3QgdmNwdSBmcm9t
IHJlc3VtaW5nIGV4ZWN1dGlvbi4KKyAgICAgICAgICAgICAgICAgKgorICAgICAgICAgICAgICAg
ICAqIE5vdGUgdGhpcyBpcyBub3QgcmVxdWlyZWQgZm9yIGV4dGVybmFsIGlvcmVxIG9wZXJhdGlv
bnMKKyAgICAgICAgICAgICAgICAgKiBiZWNhdXNlIGluIHRoYXQgY2FzZSB0aGUgdmNwdSBpcyBt
YXJrZWQgYXMgYmxvY2tlZCwgYnV0CisgICAgICAgICAgICAgICAgICogdGhpcyBjYW5ub3QgYmUg
ZG9uZSBmb3IgbG9uZy1ydW5uaW5nIGludGVybmFsCisgICAgICAgICAgICAgICAgICogb3BlcmF0
aW9ucywgc2luY2UgaXQgd291bGQgcHJldmVudCB0aGUgdmNwdSBmcm9tIGJlaW5nCisgICAgICAg
ICAgICAgICAgICogc2NoZWR1bGVkIGFuZCB0aHVzIHRoZSBsb25nIHJ1bm5pbmcgb3BlcmF0aW9u
IGZyb20KKyAgICAgICAgICAgICAgICAgKiBmaW5pc2hpbmcuCisgICAgICAgICAgICAgICAgICov
CisgICAgICAgICAgICAgICAgcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRKTsKKyAgICAg
ICAgICAgICAgICByZXR1cm4gZmFsc2U7CisgICAgICAgICAgICB9CisKKyAgICAgICAgICAgIC8q
IEZpbmlzaGVkIHByb2Nlc3NpbmcgdGhlIGlvcmVxLiAqLworICAgICAgICAgICAgdmlvLT5pb19y
ZXEuc3RhdGUgPSBodm1faW9yZXFfbmVlZHNfY29tcGxldGlvbigmdmlvLT5pb19yZXEpCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgID8gU1RBVEVfSU9SRVNQX1JFQURZCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDogU1RBVEVfSU9SRVFfTk9ORTsKKworICAgICAgICAg
ICAgY29udGludWU7CisgICAgICAgIH0KKwogICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICgg
c3YsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcy0+aW9yZXFfdmNwdV9saXN0LAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlzdF9lbnRyeSApCkBAIC0xNTU0LDcgKzE1
ODYsMTQgQEAgaW50IGh2bV9zZW5kX2lvcmVxKGlvc2VydmlkX3QgaWQsIGlvcmVxX3QgKnByb3Rv
X3AsIGJvb2wgYnVmZmVyZWQpCiAgICAgfQogCiAgICAgaWYgKCBodm1faW9yZXFfaXNfaW50ZXJu
YWwoaWQpICkKLSAgICAgICAgcmV0dXJuIHMtPmhhbmRsZXIocHJvdG9fcCwgcy0+ZGF0YSk7Cisg
ICAgeworICAgICAgICBpbnQgcmMgPSBzLT5oYW5kbGVyKHByb3RvX3AsIHMtPmRhdGEpOworCisg
ICAgICAgIGlmICggcmMgPT0gWDg2RU1VTF9SRVRSWSApCisgICAgICAgICAgICBjdXJyLT5hcmNo
Lmh2bS5odm1faW8uaW9fcmVxLnN0YXRlID0gU1RBVEVfSU9SRVFfSU5QUk9DRVNTOworCisgICAg
ICAgIHJldHVybiByYzsKKyAgICB9CiAKICAgICBpZiAoIHVubGlrZWx5KCF2Y3B1X3N0YXJ0X3No
dXRkb3duX2RlZmVycmFsKGN1cnIpKSApCiAgICAgICAgIHJldHVybiBYODZFTVVMX1JFVFJZOwpk
aWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyBiL3hlbi9kcml2ZXJzL3ZwY2kv
aGVhZGVyLmMKaW5kZXggM2M3OTRmNDg2ZC4uOTM2MGQxOWE1MCAxMDA2NDQKLS0tIGEveGVuL2Ry
aXZlcnMvdnBjaS9oZWFkZXIuYworKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jCkBAIC0x
MjksMzcgKzEyOSw0MSBAQCBzdGF0aWMgdm9pZCBtb2RpZnlfZGVjb2RpbmcoY29uc3Qgc3RydWN0
IHBjaV9kZXYgKnBkZXYsIHVpbnQxNl90IGNtZCwKIAogYm9vbCB2cGNpX3Byb2Nlc3NfcGVuZGlu
ZyhzdHJ1Y3QgdmNwdSAqdikKIHsKLSAgICBpZiAoIHYtPnZwY2kubWVtICkKKyAgICBzdHJ1Y3Qg
bWFwX2RhdGEgZGF0YSA9IHsKKyAgICAgICAgLmQgPSB2LT5kb21haW4sCisgICAgICAgIC5tYXAg
PSB2LT52cGNpLmNtZCAmIFBDSV9DT01NQU5EX01FTU9SWSwKKyAgICB9OworICAgIGludCByYzsK
KworICAgIGlmICggIXYtPnZwY2kubWVtICkKICAgICB7Ci0gICAgICAgIHN0cnVjdCBtYXBfZGF0
YSBkYXRhID0gewotICAgICAgICAgICAgLmQgPSB2LT5kb21haW4sCi0gICAgICAgICAgICAubWFw
ID0gdi0+dnBjaS5jbWQgJiBQQ0lfQ09NTUFORF9NRU1PUlksCi0gICAgICAgIH07Ci0gICAgICAg
IGludCByYyA9IHJhbmdlc2V0X2NvbnN1bWVfcmFuZ2VzKHYtPnZwY2kubWVtLCBtYXBfcmFuZ2Us
ICZkYXRhKTsKLQotICAgICAgICBpZiAoIHJjID09IC1FUkVTVEFSVCApCi0gICAgICAgICAgICBy
ZXR1cm4gdHJ1ZTsKLQotICAgICAgICBzcGluX2xvY2soJnYtPnZwY2kucGRldi0+dnBjaS0+bG9j
ayk7Ci0gICAgICAgIC8qIERpc2FibGUgbWVtb3J5IGRlY29kaW5nIHVuY29uZGl0aW9uYWxseSBv
biBmYWlsdXJlLiAqLwotICAgICAgICBtb2RpZnlfZGVjb2Rpbmcodi0+dnBjaS5wZGV2LAotICAg
ICAgICAgICAgICAgICAgICAgICAgcmMgPyB2LT52cGNpLmNtZCAmIH5QQ0lfQ09NTUFORF9NRU1P
UlkgOiB2LT52cGNpLmNtZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICFyYyAmJiB2LT52cGNp
LnJvbV9vbmx5KTsKLSAgICAgICAgc3Bpbl91bmxvY2soJnYtPnZwY2kucGRldi0+dnBjaS0+bG9j
ayk7Ci0KLSAgICAgICAgcmFuZ2VzZXRfZGVzdHJveSh2LT52cGNpLm1lbSk7Ci0gICAgICAgIHYt
PnZwY2kubWVtID0gTlVMTDsKLSAgICAgICAgaWYgKCByYyApCi0gICAgICAgICAgICAvKgotICAg
ICAgICAgICAgICogRklYTUU6IGluIGNhc2Ugb2YgZmFpbHVyZSByZW1vdmUgdGhlIGRldmljZSBm
cm9tIHRoZSBkb21haW4uCi0gICAgICAgICAgICAgKiBOb3RlIHRoYXQgdGhlcmUgbWlnaHQgc3Rp
bGwgYmUgbGVmdG92ZXIgbWFwcGluZ3MuIFdoaWxlIHRoaXMgaXMKLSAgICAgICAgICAgICAqIHNh
ZmUgZm9yIERvbTAsIGZvciBEb21VcyB0aGUgZG9tYWluIHdpbGwgbGlrZWx5IG5lZWQgdG8gYmUK
LSAgICAgICAgICAgICAqIGtpbGxlZCBpbiBvcmRlciB0byBhdm9pZCBsZWFraW5nIHN0YWxlIHAy
bSBtYXBwaW5ncyBvbgotICAgICAgICAgICAgICogZmFpbHVyZS4KLSAgICAgICAgICAgICAqLwot
ICAgICAgICAgICAgdnBjaV9yZW1vdmVfZGV2aWNlKHYtPnZwY2kucGRldik7CisgICAgICAgIEFT
U0VSVF9VTlJFQUNIQUJMRSgpOworICAgICAgICByZXR1cm4gZmFsc2U7CiAgICAgfQogCisgICAg
cmMgPSByYW5nZXNldF9jb25zdW1lX3Jhbmdlcyh2LT52cGNpLm1lbSwgbWFwX3JhbmdlLCAmZGF0
YSk7CisgICAgaWYgKCByYyA9PSAtRVJFU1RBUlQgKQorICAgICAgICByZXR1cm4gdHJ1ZTsKKwor
ICAgIHNwaW5fbG9jaygmdi0+dnBjaS5wZGV2LT52cGNpLT5sb2NrKTsKKyAgICAvKiBEaXNhYmxl
IG1lbW9yeSBkZWNvZGluZyB1bmNvbmRpdGlvbmFsbHkgb24gZmFpbHVyZS4gKi8KKyAgICBtb2Rp
ZnlfZGVjb2Rpbmcodi0+dnBjaS5wZGV2LAorICAgICAgICAgICAgICAgICAgICByYyA/IHYtPnZw
Y2kuY21kICYgflBDSV9DT01NQU5EX01FTU9SWSA6IHYtPnZwY2kuY21kLAorICAgICAgICAgICAg
ICAgICAgICAhcmMgJiYgdi0+dnBjaS5yb21fb25seSk7CisgICAgc3Bpbl91bmxvY2soJnYtPnZw
Y2kucGRldi0+dnBjaS0+bG9jayk7CisKKyAgICByYW5nZXNldF9kZXN0cm95KHYtPnZwY2kubWVt
KTsKKyAgICB2LT52cGNpLm1lbSA9IE5VTEw7CisgICAgaWYgKCByYyApCisgICAgICAgIC8qCisg
ICAgICAgICAqIEZJWE1FOiBpbiBjYXNlIG9mIGZhaWx1cmUgcmVtb3ZlIHRoZSBkZXZpY2UgZnJv
bSB0aGUgZG9tYWluLgorICAgICAgICAgKiBOb3RlIHRoYXQgdGhlcmUgbWlnaHQgc3RpbGwgYmUg
bGVmdG92ZXIgbWFwcGluZ3MuIFdoaWxlIHRoaXMgaXMKKyAgICAgICAgICogc2FmZSBmb3IgRG9t
MCwgZm9yIERvbVVzIHRoZSBkb21haW4gd2lsbCBsaWtlbHkgbmVlZCB0byBiZQorICAgICAgICAg
KiBraWxsZWQgaW4gb3JkZXIgdG8gYXZvaWQgbGVha2luZyBzdGFsZSBwMm0gbWFwcGluZ3Mgb24K
KyAgICAgICAgICogZmFpbHVyZS4KKyAgICAgICAgICovCisgICAgICAgIHZwY2lfcmVtb3ZlX2Rl
dmljZSh2LT52cGNpLnBkZXYpOworCiAgICAgcmV0dXJuIGZhbHNlOwogfQogCmRpZmYgLS1naXQg
YS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCmluZGV4
IDIwNmZjYWRiYzYuLjBjYzg1NDNlYjggMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBj
aS5jCisrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCkBAIC00ODQsNiArNDg0LDcgQEAgc3Rh
dGljIHZvaWQgd3JpdGUocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25l
ZCBpbnQgc2l6ZSwKIHN0YXRpYyBpbnQgaW9yZXFfaGFuZGxlcihpb3JlcV90ICpyZXEsIHZvaWQg
KmRhdGEpCiB7CiAgICAgcGNpX3NiZGZfdCBzYmRmOworICAgIHN0cnVjdCB2Y3B1ICpjdXJyID0g
Y3VycmVudDsKIAogICAgIC8qCiAgICAgICogTkI6IGNlcnRhaW4gcmVxdWVzdHMgb2YgdHlwZSBk
aWZmZXJlbnQgdGhhbiBQQ0kgYXJlIGJyb2FkY2FzdGVkIHRvIGFsbApAQCAtNDkyLDYgKzQ5Mywx
MiBAQCBzdGF0aWMgaW50IGlvcmVxX2hhbmRsZXIoaW9yZXFfdCAqcmVxLCB2b2lkICpkYXRhKQog
ICAgIGlmICggcmVxLT50eXBlICE9IElPUkVRX1RZUEVfUENJX0NPTkZJRyB8fCByZXEtPmRhdGFf
aXNfcHRyICkKICAgICAgICAgcmV0dXJuIFg4NkVNVUxfVU5IQU5ETEVBQkxFOwogCisgICAgaWYg
KCBjdXJyLT52cGNpLm1lbSApCisgICAgeworICAgICAgICBBU1NFUlQocmVxLT5zdGF0ZSA9PSBT
VEFURV9JT1JFUV9JTlBST0NFU1MpOworICAgICAgICByZXR1cm4gdnBjaV9wcm9jZXNzX3BlbmRp
bmcoY3VycikgPyBYODZFTVVMX1JFVFJZIDogWDg2RU1VTF9PS0FZOworICAgIH0KKwogICAgIHNi
ZGYuc2JkZiA9IHJlcS0+YWRkciA+PiAzMjsKIAogICAgIGlmICggcmVxLT5kaXIgKQpAQCAtNDk5
LDcgKzUwNiw3IEBAIHN0YXRpYyBpbnQgaW9yZXFfaGFuZGxlcihpb3JlcV90ICpyZXEsIHZvaWQg
KmRhdGEpCiAgICAgZWxzZQogICAgICAgICB3cml0ZShzYmRmLCByZXEtPmFkZHIsIHJlcS0+c2l6
ZSwgcmVxLT5kYXRhKTsKIAotICAgIHJldHVybiBYODZFTVVMX09LQVk7CisgICAgcmV0dXJuIGN1
cnItPnZwY2kubWVtID8gWDg2RU1VTF9SRVRSWSA6IFg4NkVNVUxfT0tBWTsKIH0KIAogaW50IHZw
Y2lfcmVnaXN0ZXJfaW9yZXEoc3RydWN0IGRvbWFpbiAqZCkKZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvaHZtL3ZjcHUuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZjcHUuaApp
bmRleCAzOGY1YzJiYjliLi40NTYzNzQ2NDY2IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS92Y3B1LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmNwdS5oCkBAIC05
Miw3ICs5Miw4IEBAIHN0cnVjdCBodm1fdmNwdV9pbyB7CiAKIHN0YXRpYyBpbmxpbmUgYm9vbCBo
dm1faW9yZXFfbmVlZHNfY29tcGxldGlvbihjb25zdCBpb3JlcV90ICppb3JlcSkKIHsKLSAgICBy
ZXR1cm4gaW9yZXEtPnN0YXRlID09IFNUQVRFX0lPUkVRX1JFQURZICYmCisgICAgcmV0dXJuIChp
b3JlcS0+c3RhdGUgPT0gU1RBVEVfSU9SRVFfUkVBRFkgfHwKKyAgICAgICAgICAgIGlvcmVxLT5z
dGF0ZSA9PSBTVEFURV9JT1JFUV9JTlBST0NFU1MpICYmCiAgICAgICAgICAgICFpb3JlcS0+ZGF0
YV9pc19wdHIgJiYKICAgICAgICAgICAgKGlvcmVxLT50eXBlICE9IElPUkVRX1RZUEVfUElPIHx8
IGlvcmVxLT5kaXIgIT0gSU9SRVFfV1JJVEUpOwogfQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
eGVuL3ZwY2kuaCBiL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgKaW5kZXggNGU5NTkxYzAyMC4uYmFk
NDA2YjIxZCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3ZwY2kuaAorKysgYi94ZW4vaW5j
bHVkZS94ZW4vdnBjaS5oCkBAIC0yMjMsMTIgKzIyMyw2IEBAIHN0YXRpYyBpbmxpbmUgaW50IHZw
Y2lfcmVnaXN0ZXJfaW9yZXEoc3RydWN0IGRvbWFpbiAqZCkKIH0KIAogc3RhdGljIGlubGluZSB2
b2lkIHZwY2lfZHVtcF9tc2kodm9pZCkgeyB9Ci0KLXN0YXRpYyBpbmxpbmUgYm9vbCB2cGNpX3By
b2Nlc3NfcGVuZGluZyhzdHJ1Y3QgdmNwdSAqdikKLXsKLSAgICBBU1NFUlRfVU5SRUFDSEFCTEUo
KTsKLSAgICByZXR1cm4gZmFsc2U7Ci19CiAjZW5kaWYKIAogI2VuZGlmCi0tIAoyLjIzLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
