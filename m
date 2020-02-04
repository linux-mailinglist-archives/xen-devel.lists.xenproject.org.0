Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D63151F8C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 18:37:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz26S-0005TJ-0Q; Tue, 04 Feb 2020 17:35:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uGhi=3Y=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iz26Q-0005Sy-Uk
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 17:35:10 +0000
X-Inumbo-ID: aea324e6-4774-11ea-8fd3-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aea324e6-4774-11ea-8fd3-12813bfff9fa;
 Tue, 04 Feb 2020 17:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580837706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kPXv+lDJqab58La7zV4Y0aPrRk8Om+4efmQRdNwk1jU=;
 b=W/DKwuakxxccGbGrdHfu80cyGEfSNAE5UZ/ClQj1iAWJs8Q1Ff9uoKNM
 8m+PQzjt9i4XAzWLQj8WLHjY6KN19hEFBssu51QQY0GcP5TBB+CX056GW
 JwagEXdZwcTUyq/cOLjbue94XoqyrJsFFGXevkGVDFYsKaj0vfE5MBj39 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JczS86futrQ+FZ5tJuwMdmWuwHRJXvHJEygcCmbWduZYPL3gEr1NvE6bv9wosuGum4w/96Guc9
 /RNe7CqmY0z8xzMK8mJSsGuL4HiqNW/IycySgOVL7TbdA8d2I7DMLrfeacMOw5hDZAugpNv9bV
 Uz8r85Ft0eDWqeK+hqHDpaNFlYVuvT9ubCR/VFhKfsKcxnMSmCAW7Y4XmMnJfwPDERpoyLJhq1
 Kt/IlBTea+fKUjAczl2XQcv+BoOfDR+JKeb6lJDpqCNzd2qfxq/1W0pdX/DVB6MiBVa7jezgke
 CiM=
X-SBRS: 2.7
X-MesageID: 12305843
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,402,1574139600"; d="scan'208";a="12305843"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 4 Feb 2020 18:34:54 +0100
Message-ID: <20200204173455.22020-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200204173455.22020-1-roger.pau@citrix.com>
References: <20200204173455.22020-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 2/3] bitmap: import bitmap_{set/clear} from
 Linux 5.5
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW1wb3J0IHRoZSBmdW5jdGlvbnMgYW5kIGl0J3MgZGVwZW5kZW5jaWVzLiBCYXNlZCBvbiBMaW51
eCA1LjUsIGNvbW1pdAppZCBkNTIyNmZhNmRiYWUwNTY5ZWU0M2VjZmMwOGJkY2Q2NzcwZmM0NzU1
LgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Ci0tLQogeGVuL2NvbW1vbi9iaXRtYXAuYyAgICAgICAgICB8IDQxICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9iaXRvcHMuaCB8ICAyICsr
CiB4ZW4vaW5jbHVkZS94ZW4vYml0bWFwLmggICAgIHwgMzggKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDgxIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL2JpdG1hcC5jIGIveGVuL2NvbW1vbi9iaXRtYXAuYwppbmRleCBmZDA3
MGJlZTk3Li5mOGIyNDNlNzdlIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2JpdG1hcC5jCisrKyBi
L3hlbi9jb21tb24vYml0bWFwLmMKQEAgLTIxMiw2ICsyMTIsNDcgQEAgaW50IF9fYml0bWFwX3dl
aWdodChjb25zdCB1bnNpZ25lZCBsb25nICpiaXRtYXAsIGludCBiaXRzKQogI2VuZGlmCiBFWFBP
UlRfU1lNQk9MKF9fYml0bWFwX3dlaWdodCk7CiAKK3ZvaWQgX19iaXRtYXBfc2V0KHVuc2lnbmVk
IGxvbmcgKm1hcCwgdW5zaWduZWQgaW50IHN0YXJ0LCBpbnQgbGVuKQoreworCXVuc2lnbmVkIGxv
bmcgKnAgPSBtYXAgKyBCSVRfV09SRChzdGFydCk7CisJY29uc3QgdW5zaWduZWQgaW50IHNpemUg
PSBzdGFydCArIGxlbjsKKwlpbnQgYml0c190b19zZXQgPSBCSVRTX1BFUl9MT05HIC0gKHN0YXJ0
ICUgQklUU19QRVJfTE9ORyk7CisJdW5zaWduZWQgbG9uZyBtYXNrX3RvX3NldCA9IEJJVE1BUF9G
SVJTVF9XT1JEX01BU0soc3RhcnQpOworCisJd2hpbGUgKGxlbiAtIGJpdHNfdG9fc2V0ID49IDAp
IHsKKwkJKnAgfD0gbWFza190b19zZXQ7CisJCWxlbiAtPSBiaXRzX3RvX3NldDsKKwkJYml0c190
b19zZXQgPSBCSVRTX1BFUl9MT05HOworCQltYXNrX3RvX3NldCA9IH4wVUw7CisJCXArKzsKKwl9
CisJaWYgKGxlbikgeworCQltYXNrX3RvX3NldCAmPSBCSVRNQVBfTEFTVF9XT1JEX01BU0soc2l6
ZSk7CisJCSpwIHw9IG1hc2tfdG9fc2V0OworCX0KK30KK0VYUE9SVF9TWU1CT0woX19iaXRtYXBf
c2V0KTsKKwordm9pZCBfX2JpdG1hcF9jbGVhcih1bnNpZ25lZCBsb25nICptYXAsIHVuc2lnbmVk
IGludCBzdGFydCwgaW50IGxlbikKK3sKKwl1bnNpZ25lZCBsb25nICpwID0gbWFwICsgQklUX1dP
UkQoc3RhcnQpOworCWNvbnN0IHVuc2lnbmVkIGludCBzaXplID0gc3RhcnQgKyBsZW47CisJaW50
IGJpdHNfdG9fY2xlYXIgPSBCSVRTX1BFUl9MT05HIC0gKHN0YXJ0ICUgQklUU19QRVJfTE9ORyk7
CisJdW5zaWduZWQgbG9uZyBtYXNrX3RvX2NsZWFyID0gQklUTUFQX0ZJUlNUX1dPUkRfTUFTSyhz
dGFydCk7CisKKwl3aGlsZSAobGVuIC0gYml0c190b19jbGVhciA+PSAwKSB7CisJCSpwICY9IH5t
YXNrX3RvX2NsZWFyOworCQlsZW4gLT0gYml0c190b19jbGVhcjsKKwkJYml0c190b19jbGVhciA9
IEJJVFNfUEVSX0xPTkc7CisJCW1hc2tfdG9fY2xlYXIgPSB+MFVMOworCQlwKys7CisJfQorCWlm
IChsZW4pIHsKKwkJbWFza190b19jbGVhciAmPSBCSVRNQVBfTEFTVF9XT1JEX01BU0soc2l6ZSk7
CisJCSpwICY9IH5tYXNrX3RvX2NsZWFyOworCX0KK30KK0VYUE9SVF9TWU1CT0woX19iaXRtYXBf
Y2xlYXIpOwogCiAvKioKICAqCWJpdG1hcF9maW5kX2ZyZWVfcmVnaW9uIC0gZmluZCBhIGNvbnRp
Z3VvdXMgYWxpZ25lZCBtZW0gcmVnaW9uCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2
L2JpdG9wcy5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9iaXRvcHMuaAppbmRleCA1YTcxYWZiYzg5
Li4wNGIxNTMwMzg4IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2JpdG9wcy5oCisr
KyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvYml0b3BzLmgKQEAgLTQ4MCw0ICs0ODAsNiBAQCBzdGF0
aWMgaW5saW5lIGludCBmbHModW5zaWduZWQgaW50IHgpCiAjZGVmaW5lIGh3ZWlnaHQxNih4KSBn
ZW5lcmljX2h3ZWlnaHQxNih4KQogI2RlZmluZSBod2VpZ2h0OCh4KSBnZW5lcmljX2h3ZWlnaHQ4
KHgpCiAKKyNkZWZpbmUgQklUX1dPUkQobnIpICgobnIpIC8gQklUU19QRVJfTE9ORykKKwogI2Vu
ZGlmIC8qIF9YODZfQklUT1BTX0ggKi8KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9iaXRt
YXAuaCBiL3hlbi9pbmNsdWRlL3hlbi9iaXRtYXAuaAppbmRleCA0ZTFlNjkwYWYxLi5mMDdkMWY2
OTM1IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vYml0bWFwLmgKKysrIGIveGVuL2luY2x1
ZGUveGVuL2JpdG1hcC5oCkBAIC04NSw2ICs4NSw4IEBAIGV4dGVybiBpbnQgX19iaXRtYXBfaW50
ZXJzZWN0cyhjb25zdCB1bnNpZ25lZCBsb25nICpiaXRtYXAxLAogZXh0ZXJuIGludCBfX2JpdG1h
cF9zdWJzZXQoY29uc3QgdW5zaWduZWQgbG9uZyAqYml0bWFwMSwKIAkJCWNvbnN0IHVuc2lnbmVk
IGxvbmcgKmJpdG1hcDIsIGludCBiaXRzKTsKIGV4dGVybiBpbnQgX19iaXRtYXBfd2VpZ2h0KGNv
bnN0IHVuc2lnbmVkIGxvbmcgKmJpdG1hcCwgaW50IGJpdHMpOworZXh0ZXJuIHZvaWQgX19iaXRt
YXBfc2V0KHVuc2lnbmVkIGxvbmcgKm1hcCwgdW5zaWduZWQgaW50IHN0YXJ0LCBpbnQgbGVuKTsK
K2V4dGVybiB2b2lkIF9fYml0bWFwX2NsZWFyKHVuc2lnbmVkIGxvbmcgKm1hcCwgdW5zaWduZWQg
aW50IHN0YXJ0LCBpbnQgbGVuKTsKIAogZXh0ZXJuIGludCBiaXRtYXBfZmluZF9mcmVlX3JlZ2lv
bih1bnNpZ25lZCBsb25nICpiaXRtYXAsIGludCBiaXRzLCBpbnQgb3JkZXIpOwogZXh0ZXJuIHZv
aWQgYml0bWFwX3JlbGVhc2VfcmVnaW9uKHVuc2lnbmVkIGxvbmcgKmJpdG1hcCwgaW50IHBvcywg
aW50IG9yZGVyKTsKQEAgLTIyNyw2ICsyMjksNDIgQEAgc3RhdGljIGlubGluZSBpbnQgYml0bWFw
X3dlaWdodChjb25zdCB1bnNpZ25lZCBsb25nICpzcmMsIGludCBuYml0cykKIAlyZXR1cm4gX19i
aXRtYXBfd2VpZ2h0KHNyYywgbmJpdHMpOwogfQogCisjaWZkZWYgX19MSVRUTEVfRU5ESUFOCisj
ZGVmaW5lIEJJVE1BUF9NRU1fQUxJR05NRU5UIDgKKyNlbHNlCisjZGVmaW5lIEJJVE1BUF9NRU1f
QUxJR05NRU5UICg4ICogc2l6ZW9mKHVuc2lnbmVkIGxvbmcpKQorI2VuZGlmCisjZGVmaW5lIEJJ
VE1BUF9NRU1fTUFTSyAoQklUTUFQX01FTV9BTElHTk1FTlQgLSAxKQorI2RlZmluZSBCSVRNQVBf
RklSU1RfV09SRF9NQVNLKHN0YXJ0KSAofjBVTCA8PCAoKHN0YXJ0KSAmIChCSVRTX1BFUl9MT05H
IC0gMSkpKQorCitzdGF0aWMgaW5saW5lIHZvaWQgYml0bWFwX3NldCh1bnNpZ25lZCBsb25nICpt
YXAsIHVuc2lnbmVkIGludCBzdGFydCwKKwkJdW5zaWduZWQgaW50IG5iaXRzKQoreworCWlmIChf
X2J1aWx0aW5fY29uc3RhbnRfcChuYml0cykgJiYgbmJpdHMgPT0gMSkKKwkJX19zZXRfYml0KHN0
YXJ0LCBtYXApOworCWVsc2UgaWYgKF9fYnVpbHRpbl9jb25zdGFudF9wKHN0YXJ0ICYgQklUTUFQ
X01FTV9NQVNLKSAmJgorCQkgSVNfQUxJR05FRChzdGFydCwgQklUTUFQX01FTV9BTElHTk1FTlQp
ICYmCisJCSBfX2J1aWx0aW5fY29uc3RhbnRfcChuYml0cyAmIEJJVE1BUF9NRU1fTUFTSykgJiYK
KwkJIElTX0FMSUdORUQobmJpdHMsIEJJVE1BUF9NRU1fQUxJR05NRU5UKSkKKwkJbWVtc2V0KChj
aGFyICopbWFwICsgc3RhcnQgLyA4LCAweGZmLCBuYml0cyAvIDgpOworCWVsc2UKKwkJX19iaXRt
YXBfc2V0KG1hcCwgc3RhcnQsIG5iaXRzKTsKK30KKworc3RhdGljIGlubGluZSB2b2lkIGJpdG1h
cF9jbGVhcih1bnNpZ25lZCBsb25nICptYXAsIHVuc2lnbmVkIGludCBzdGFydCwKKwkJdW5zaWdu
ZWQgaW50IG5iaXRzKQoreworCWlmIChfX2J1aWx0aW5fY29uc3RhbnRfcChuYml0cykgJiYgbmJp
dHMgPT0gMSkKKwkJX19jbGVhcl9iaXQoc3RhcnQsIG1hcCk7CisJZWxzZSBpZiAoX19idWlsdGlu
X2NvbnN0YW50X3Aoc3RhcnQgJiBCSVRNQVBfTUVNX01BU0spICYmCisJCSBJU19BTElHTkVEKHN0
YXJ0LCBCSVRNQVBfTUVNX0FMSUdOTUVOVCkgJiYKKwkJIF9fYnVpbHRpbl9jb25zdGFudF9wKG5i
aXRzICYgQklUTUFQX01FTV9NQVNLKSAmJgorCQkgSVNfQUxJR05FRChuYml0cywgQklUTUFQX01F
TV9BTElHTk1FTlQpKQorCQltZW1zZXQoKGNoYXIgKiltYXAgKyBzdGFydCAvIDgsIDAsIG5iaXRz
IC8gOCk7CisJZWxzZQorCQlfX2JpdG1hcF9jbGVhcihtYXAsIHN0YXJ0LCBuYml0cyk7Cit9CisK
ICN1bmRlZiBiaXRtYXBfc3dpdGNoCiAjdW5kZWYgYml0bWFwX2J5dGVzCiAKLS0gCjIuMjUuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
