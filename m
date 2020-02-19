Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2997F164204
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 11:25:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4MVj-0004nh-LB; Wed, 19 Feb 2020 10:23:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH6y=4H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4MVi-0004nK-BO
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 10:23:18 +0000
X-Inumbo-ID: d4873baa-5301-11ea-8325-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4873baa-5301-11ea-8325-12813bfff9fa;
 Wed, 19 Feb 2020 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582107791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hq6P8cJ9/khtkEZzFxObjUtwErTiIFi4/+48k8E1ubk=;
 b=Ds3Fv+78KgPXfY1thGRszIdw2ZaeqvuddJaHlbUhjYSRmqYpBFrGkW6s
 XU0xPWe5rj9Frzf04Cw0TURv8f44C1usGNBnx3e5+DrosVa74eB44Jl2u
 ZjLCFvESPhEkqnF9MXHfIvFi7sooe62/Q++en0XHsO4IhwGk/HDsHaSaI w=;
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
IronPort-SDR: nSkgh1pIQlwox/t0xitGY8pyi0ffY/mZr4hwMzXjUKQJQnSuVpyPQR/K4YOlKsnucmG8tofmLu
 2zLmZqTvYrrxH50P5y62pJAjD4uPL1e1VEbXE4JWgUaNdEKfLe2ldE8On4xKOTQFK9OJl3kFd9
 0N8uZmwWgQbzCfuaVEE6ckKH0nlWbsmmhEukSV6A6Ame6ZWd1WgbaF4wXM9yhpVTJ02RP8R3TQ
 gGZGTvywo9L46e3SGb73L9jemLibgw5xp04fYedMKFXbXotvOaYqXP5w/TJwJI4qrjj6ZIHuGZ
 rLM=
X-SBRS: 2.7
X-MesageID: 13038247
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,459,1574139600"; d="scan'208";a="13038247"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 19 Feb 2020 11:22:55 +0100
Message-ID: <20200219102256.81594-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219102256.81594-1-roger.pau@citrix.com>
References: <20200219102256.81594-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 2/3] bitmap: import bitmap_{set/clear} from
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
CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQpDaGFuZ2VzIHNp
bmNlIHY0OgogLSBJbnRyb2R1Y2UgQklUX1dPUkQgaW4gZ2VuZXJpYyBoZWFkZXIgYml0b3BzLmgg
KGluc3RlYWQgb2YgdGhlIHg4NgogICBvbmUpLgogLSBJbmNsdWRlIGJ5dGVvcmRlci5oIGZvciBf
X0xJVFRMRV9FTkRJQU4KIC0gUmVtb3ZlIEVYUE9SVF9TWU1CT0wuCi0tLQogeGVuL2NvbW1vbi9i
aXRtYXAuYyAgICAgIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiB4ZW4vaW5jbHVkZS94ZW4vYml0bWFwLmggfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL2JpdG1hcC5jIGIveGVuL2NvbW1vbi9iaXRtYXAuYwppbmRleCBm
ZDA3MGJlZTk3Li44ODc2OGJmOGJjIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2JpdG1hcC5jCisr
KyBiL3hlbi9jb21tb24vYml0bWFwLmMKQEAgLTIxMiw2ICsyMTIsNDUgQEAgaW50IF9fYml0bWFw
X3dlaWdodChjb25zdCB1bnNpZ25lZCBsb25nICpiaXRtYXAsIGludCBiaXRzKQogI2VuZGlmCiBF
WFBPUlRfU1lNQk9MKF9fYml0bWFwX3dlaWdodCk7CiAKK3ZvaWQgX19iaXRtYXBfc2V0KHVuc2ln
bmVkIGxvbmcgKm1hcCwgdW5zaWduZWQgaW50IHN0YXJ0LCBpbnQgbGVuKQoreworCXVuc2lnbmVk
IGxvbmcgKnAgPSBtYXAgKyBCSVRfV09SRChzdGFydCk7CisJY29uc3QgdW5zaWduZWQgaW50IHNp
emUgPSBzdGFydCArIGxlbjsKKwlpbnQgYml0c190b19zZXQgPSBCSVRTX1BFUl9MT05HIC0gKHN0
YXJ0ICUgQklUU19QRVJfTE9ORyk7CisJdW5zaWduZWQgbG9uZyBtYXNrX3RvX3NldCA9IEJJVE1B
UF9GSVJTVF9XT1JEX01BU0soc3RhcnQpOworCisJd2hpbGUgKGxlbiAtIGJpdHNfdG9fc2V0ID49
IDApIHsKKwkJKnAgfD0gbWFza190b19zZXQ7CisJCWxlbiAtPSBiaXRzX3RvX3NldDsKKwkJYml0
c190b19zZXQgPSBCSVRTX1BFUl9MT05HOworCQltYXNrX3RvX3NldCA9IH4wVUw7CisJCXArKzsK
Kwl9CisJaWYgKGxlbikgeworCQltYXNrX3RvX3NldCAmPSBCSVRNQVBfTEFTVF9XT1JEX01BU0so
c2l6ZSk7CisJCSpwIHw9IG1hc2tfdG9fc2V0OworCX0KK30KKwordm9pZCBfX2JpdG1hcF9jbGVh
cih1bnNpZ25lZCBsb25nICptYXAsIHVuc2lnbmVkIGludCBzdGFydCwgaW50IGxlbikKK3sKKwl1
bnNpZ25lZCBsb25nICpwID0gbWFwICsgQklUX1dPUkQoc3RhcnQpOworCWNvbnN0IHVuc2lnbmVk
IGludCBzaXplID0gc3RhcnQgKyBsZW47CisJaW50IGJpdHNfdG9fY2xlYXIgPSBCSVRTX1BFUl9M
T05HIC0gKHN0YXJ0ICUgQklUU19QRVJfTE9ORyk7CisJdW5zaWduZWQgbG9uZyBtYXNrX3RvX2Ns
ZWFyID0gQklUTUFQX0ZJUlNUX1dPUkRfTUFTSyhzdGFydCk7CisKKwl3aGlsZSAobGVuIC0gYml0
c190b19jbGVhciA+PSAwKSB7CisJCSpwICY9IH5tYXNrX3RvX2NsZWFyOworCQlsZW4gLT0gYml0
c190b19jbGVhcjsKKwkJYml0c190b19jbGVhciA9IEJJVFNfUEVSX0xPTkc7CisJCW1hc2tfdG9f
Y2xlYXIgPSB+MFVMOworCQlwKys7CisJfQorCWlmIChsZW4pIHsKKwkJbWFza190b19jbGVhciAm
PSBCSVRNQVBfTEFTVF9XT1JEX01BU0soc2l6ZSk7CisJCSpwICY9IH5tYXNrX3RvX2NsZWFyOwor
CX0KK30KIAogLyoqCiAgKgliaXRtYXBfZmluZF9mcmVlX3JlZ2lvbiAtIGZpbmQgYSBjb250aWd1
b3VzIGFsaWduZWQgbWVtIHJlZ2lvbgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2JpdG1h
cC5oIGIveGVuL2luY2x1ZGUveGVuL2JpdG1hcC5oCmluZGV4IDRlMWU2OTBhZjEuLmM0NGUwMDlm
OGMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9iaXRtYXAuaAorKysgYi94ZW4vaW5jbHVk
ZS94ZW4vYml0bWFwLmgKQEAgLTg1LDYgKzg1LDggQEAgZXh0ZXJuIGludCBfX2JpdG1hcF9pbnRl
cnNlY3RzKGNvbnN0IHVuc2lnbmVkIGxvbmcgKmJpdG1hcDEsCiBleHRlcm4gaW50IF9fYml0bWFw
X3N1YnNldChjb25zdCB1bnNpZ25lZCBsb25nICpiaXRtYXAxLAogCQkJY29uc3QgdW5zaWduZWQg
bG9uZyAqYml0bWFwMiwgaW50IGJpdHMpOwogZXh0ZXJuIGludCBfX2JpdG1hcF93ZWlnaHQoY29u
c3QgdW5zaWduZWQgbG9uZyAqYml0bWFwLCBpbnQgYml0cyk7CitleHRlcm4gdm9pZCBfX2JpdG1h
cF9zZXQodW5zaWduZWQgbG9uZyAqbWFwLCB1bnNpZ25lZCBpbnQgc3RhcnQsIGludCBsZW4pOwor
ZXh0ZXJuIHZvaWQgX19iaXRtYXBfY2xlYXIodW5zaWduZWQgbG9uZyAqbWFwLCB1bnNpZ25lZCBp
bnQgc3RhcnQsIGludCBsZW4pOwogCiBleHRlcm4gaW50IGJpdG1hcF9maW5kX2ZyZWVfcmVnaW9u
KHVuc2lnbmVkIGxvbmcgKmJpdG1hcCwgaW50IGJpdHMsIGludCBvcmRlcik7CiBleHRlcm4gdm9p
ZCBiaXRtYXBfcmVsZWFzZV9yZWdpb24odW5zaWduZWQgbG9uZyAqYml0bWFwLCBpbnQgcG9zLCBp
bnQgb3JkZXIpOwpAQCAtMjI3LDYgKzIyOSw0NCBAQCBzdGF0aWMgaW5saW5lIGludCBiaXRtYXBf
d2VpZ2h0KGNvbnN0IHVuc2lnbmVkIGxvbmcgKnNyYywgaW50IG5iaXRzKQogCXJldHVybiBfX2Jp
dG1hcF93ZWlnaHQoc3JjLCBuYml0cyk7CiB9CiAKKyNpbmNsdWRlIDxhc20vYnl0ZW9yZGVyLmg+
CisKKyNpZmRlZiBfX0xJVFRMRV9FTkRJQU4KKyNkZWZpbmUgQklUTUFQX01FTV9BTElHTk1FTlQg
OAorI2Vsc2UKKyNkZWZpbmUgQklUTUFQX01FTV9BTElHTk1FTlQgKDggKiBzaXplb2YodW5zaWdu
ZWQgbG9uZykpCisjZW5kaWYKKyNkZWZpbmUgQklUTUFQX01FTV9NQVNLIChCSVRNQVBfTUVNX0FM
SUdOTUVOVCAtIDEpCisjZGVmaW5lIEJJVE1BUF9GSVJTVF9XT1JEX01BU0soc3RhcnQpICh+MFVM
IDw8ICgoc3RhcnQpICYgKEJJVFNfUEVSX0xPTkcgLSAxKSkpCisKK3N0YXRpYyBpbmxpbmUgdm9p
ZCBiaXRtYXBfc2V0KHVuc2lnbmVkIGxvbmcgKm1hcCwgdW5zaWduZWQgaW50IHN0YXJ0LAorCQl1
bnNpZ25lZCBpbnQgbmJpdHMpCit7CisJaWYgKF9fYnVpbHRpbl9jb25zdGFudF9wKG5iaXRzKSAm
JiBuYml0cyA9PSAxKQorCQlfX3NldF9iaXQoc3RhcnQsIG1hcCk7CisJZWxzZSBpZiAoX19idWls
dGluX2NvbnN0YW50X3Aoc3RhcnQgJiBCSVRNQVBfTUVNX01BU0spICYmCisJCSBJU19BTElHTkVE
KHN0YXJ0LCBCSVRNQVBfTUVNX0FMSUdOTUVOVCkgJiYKKwkJIF9fYnVpbHRpbl9jb25zdGFudF9w
KG5iaXRzICYgQklUTUFQX01FTV9NQVNLKSAmJgorCQkgSVNfQUxJR05FRChuYml0cywgQklUTUFQ
X01FTV9BTElHTk1FTlQpKQorCQltZW1zZXQoKGNoYXIgKiltYXAgKyBzdGFydCAvIDgsIDB4ZmYs
IG5iaXRzIC8gOCk7CisJZWxzZQorCQlfX2JpdG1hcF9zZXQobWFwLCBzdGFydCwgbmJpdHMpOwor
fQorCitzdGF0aWMgaW5saW5lIHZvaWQgYml0bWFwX2NsZWFyKHVuc2lnbmVkIGxvbmcgKm1hcCwg
dW5zaWduZWQgaW50IHN0YXJ0LAorCQl1bnNpZ25lZCBpbnQgbmJpdHMpCit7CisJaWYgKF9fYnVp
bHRpbl9jb25zdGFudF9wKG5iaXRzKSAmJiBuYml0cyA9PSAxKQorCQlfX2NsZWFyX2JpdChzdGFy
dCwgbWFwKTsKKwllbHNlIGlmIChfX2J1aWx0aW5fY29uc3RhbnRfcChzdGFydCAmIEJJVE1BUF9N
RU1fTUFTSykgJiYKKwkJIElTX0FMSUdORUQoc3RhcnQsIEJJVE1BUF9NRU1fQUxJR05NRU5UKSAm
JgorCQkgX19idWlsdGluX2NvbnN0YW50X3AobmJpdHMgJiBCSVRNQVBfTUVNX01BU0spICYmCisJ
CSBJU19BTElHTkVEKG5iaXRzLCBCSVRNQVBfTUVNX0FMSUdOTUVOVCkpCisJCW1lbXNldCgoY2hh
ciAqKW1hcCArIHN0YXJ0IC8gOCwgMCwgbmJpdHMgLyA4KTsKKwllbHNlCisJCV9fYml0bWFwX2Ns
ZWFyKG1hcCwgc3RhcnQsIG5iaXRzKTsKK30KKwogI3VuZGVmIGJpdG1hcF9zd2l0Y2gKICN1bmRl
ZiBiaXRtYXBfYnl0ZXMKIAotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
