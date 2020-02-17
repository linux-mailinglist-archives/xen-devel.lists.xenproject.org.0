Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A63BA161160
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 12:48:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3eqo-0001BP-Ec; Mon, 17 Feb 2020 11:46:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3eqn-0001AS-1K
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 11:46:09 +0000
X-Inumbo-ID: 1481823e-517b-11ea-bc8e-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1481823e-517b-11ea-bc8e-bc764e2007e4;
 Mon, 17 Feb 2020 11:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581939966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wrtHJNuL2tWxmyfOTFTjmWQj6+PEQKZYa+vWfEmz+zY=;
 b=Q8Esq4a+USU2AwHQZv39JCV94eb0kgQ8Dm/29WMw1zj7rjhNJdxcz9va
 Rt+kASwsqZuP0CsXNU3VnI7yA39b2w13GVzh7TefYNZkLHrD1bvahrw00
 Xrdwsxyuf14oYgEtFa+ftqPp+AWzhTBkZTGbhijyRzu8GOzkiIwhEplIg A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xHkWEcu/tgHRGhT2KaY4EljeOiGCyG87cNHsXR1DJlHF53aqQIwMebLaew1j3dBGOrY2LXqEJw
 BF1GX8uqLjCnuH2pZBMRXkyfqKGJtQEudzdw0NjzsIlEHY21oVlh1mJFodYlaQLU4BNRfJTHMS
 cA1V8MWKJGrzwYM2OAhvJ0VAFRtRIdPIKBIEamkhDodi+OrjCFVupwHsO5+Sz/UcDoo960uLbm
 OKu0pb9l/fcEynzEKmWVpBCKlP8yx6slHjhfbRgL8b/F7D1X99EYDZVAukLcR96cQZ6+B493S7
 D4I=
X-SBRS: 2.7
X-MesageID: 12565373
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,452,1574139600"; d="scan'208";a="12565373"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 17 Feb 2020 12:45:44 +0100
Message-ID: <20200217114545.71112-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217114545.71112-1-roger.pau@citrix.com>
References: <20200217114545.71112-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 3/4] bitmap: import bitmap_{set/clear} from
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
Ci0tLQpDaGFuZ2VzIHNpbmNlIHY0OgogLSBJbnRyb2R1Y2UgQklUX1dPUkQgaW4gZ2VuZXJpYyBo
ZWFkZXIgYml0b3BzLmggKGluc3RlYWQgb2YgdGhlIHg4NgogICBvbmUpLgogLSBJbmNsdWRlIGJ5
dGVvcmRlci5oIGZvciBfX0xJVFRMRV9FTkRJQU4KIC0gUmVtb3ZlIEVYUE9SVF9TWU1CT0wuCi0t
LQogeGVuL2NvbW1vbi9iaXRtYXAuYyAgICAgIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS94ZW4vYml0bWFwLmggfCA0MCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDc5IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2JpdG1hcC5jIGIveGVuL2NvbW1vbi9i
aXRtYXAuYwppbmRleCBmZDA3MGJlZTk3Li44ODc2OGJmOGJjIDEwMDY0NAotLS0gYS94ZW4vY29t
bW9uL2JpdG1hcC5jCisrKyBiL3hlbi9jb21tb24vYml0bWFwLmMKQEAgLTIxMiw2ICsyMTIsNDUg
QEAgaW50IF9fYml0bWFwX3dlaWdodChjb25zdCB1bnNpZ25lZCBsb25nICpiaXRtYXAsIGludCBi
aXRzKQogI2VuZGlmCiBFWFBPUlRfU1lNQk9MKF9fYml0bWFwX3dlaWdodCk7CiAKK3ZvaWQgX19i
aXRtYXBfc2V0KHVuc2lnbmVkIGxvbmcgKm1hcCwgdW5zaWduZWQgaW50IHN0YXJ0LCBpbnQgbGVu
KQoreworCXVuc2lnbmVkIGxvbmcgKnAgPSBtYXAgKyBCSVRfV09SRChzdGFydCk7CisJY29uc3Qg
dW5zaWduZWQgaW50IHNpemUgPSBzdGFydCArIGxlbjsKKwlpbnQgYml0c190b19zZXQgPSBCSVRT
X1BFUl9MT05HIC0gKHN0YXJ0ICUgQklUU19QRVJfTE9ORyk7CisJdW5zaWduZWQgbG9uZyBtYXNr
X3RvX3NldCA9IEJJVE1BUF9GSVJTVF9XT1JEX01BU0soc3RhcnQpOworCisJd2hpbGUgKGxlbiAt
IGJpdHNfdG9fc2V0ID49IDApIHsKKwkJKnAgfD0gbWFza190b19zZXQ7CisJCWxlbiAtPSBiaXRz
X3RvX3NldDsKKwkJYml0c190b19zZXQgPSBCSVRTX1BFUl9MT05HOworCQltYXNrX3RvX3NldCA9
IH4wVUw7CisJCXArKzsKKwl9CisJaWYgKGxlbikgeworCQltYXNrX3RvX3NldCAmPSBCSVRNQVBf
TEFTVF9XT1JEX01BU0soc2l6ZSk7CisJCSpwIHw9IG1hc2tfdG9fc2V0OworCX0KK30KKwordm9p
ZCBfX2JpdG1hcF9jbGVhcih1bnNpZ25lZCBsb25nICptYXAsIHVuc2lnbmVkIGludCBzdGFydCwg
aW50IGxlbikKK3sKKwl1bnNpZ25lZCBsb25nICpwID0gbWFwICsgQklUX1dPUkQoc3RhcnQpOwor
CWNvbnN0IHVuc2lnbmVkIGludCBzaXplID0gc3RhcnQgKyBsZW47CisJaW50IGJpdHNfdG9fY2xl
YXIgPSBCSVRTX1BFUl9MT05HIC0gKHN0YXJ0ICUgQklUU19QRVJfTE9ORyk7CisJdW5zaWduZWQg
bG9uZyBtYXNrX3RvX2NsZWFyID0gQklUTUFQX0ZJUlNUX1dPUkRfTUFTSyhzdGFydCk7CisKKwl3
aGlsZSAobGVuIC0gYml0c190b19jbGVhciA+PSAwKSB7CisJCSpwICY9IH5tYXNrX3RvX2NsZWFy
OworCQlsZW4gLT0gYml0c190b19jbGVhcjsKKwkJYml0c190b19jbGVhciA9IEJJVFNfUEVSX0xP
Tkc7CisJCW1hc2tfdG9fY2xlYXIgPSB+MFVMOworCQlwKys7CisJfQorCWlmIChsZW4pIHsKKwkJ
bWFza190b19jbGVhciAmPSBCSVRNQVBfTEFTVF9XT1JEX01BU0soc2l6ZSk7CisJCSpwICY9IH5t
YXNrX3RvX2NsZWFyOworCX0KK30KIAogLyoqCiAgKgliaXRtYXBfZmluZF9mcmVlX3JlZ2lvbiAt
IGZpbmQgYSBjb250aWd1b3VzIGFsaWduZWQgbWVtIHJlZ2lvbgpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUveGVuL2JpdG1hcC5oIGIveGVuL2luY2x1ZGUveGVuL2JpdG1hcC5oCmluZGV4IDRlMWU2
OTBhZjEuLmM0NGUwMDlmOGMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9iaXRtYXAuaAor
KysgYi94ZW4vaW5jbHVkZS94ZW4vYml0bWFwLmgKQEAgLTg1LDYgKzg1LDggQEAgZXh0ZXJuIGlu
dCBfX2JpdG1hcF9pbnRlcnNlY3RzKGNvbnN0IHVuc2lnbmVkIGxvbmcgKmJpdG1hcDEsCiBleHRl
cm4gaW50IF9fYml0bWFwX3N1YnNldChjb25zdCB1bnNpZ25lZCBsb25nICpiaXRtYXAxLAogCQkJ
Y29uc3QgdW5zaWduZWQgbG9uZyAqYml0bWFwMiwgaW50IGJpdHMpOwogZXh0ZXJuIGludCBfX2Jp
dG1hcF93ZWlnaHQoY29uc3QgdW5zaWduZWQgbG9uZyAqYml0bWFwLCBpbnQgYml0cyk7CitleHRl
cm4gdm9pZCBfX2JpdG1hcF9zZXQodW5zaWduZWQgbG9uZyAqbWFwLCB1bnNpZ25lZCBpbnQgc3Rh
cnQsIGludCBsZW4pOworZXh0ZXJuIHZvaWQgX19iaXRtYXBfY2xlYXIodW5zaWduZWQgbG9uZyAq
bWFwLCB1bnNpZ25lZCBpbnQgc3RhcnQsIGludCBsZW4pOwogCiBleHRlcm4gaW50IGJpdG1hcF9m
aW5kX2ZyZWVfcmVnaW9uKHVuc2lnbmVkIGxvbmcgKmJpdG1hcCwgaW50IGJpdHMsIGludCBvcmRl
cik7CiBleHRlcm4gdm9pZCBiaXRtYXBfcmVsZWFzZV9yZWdpb24odW5zaWduZWQgbG9uZyAqYml0
bWFwLCBpbnQgcG9zLCBpbnQgb3JkZXIpOwpAQCAtMjI3LDYgKzIyOSw0NCBAQCBzdGF0aWMgaW5s
aW5lIGludCBiaXRtYXBfd2VpZ2h0KGNvbnN0IHVuc2lnbmVkIGxvbmcgKnNyYywgaW50IG5iaXRz
KQogCXJldHVybiBfX2JpdG1hcF93ZWlnaHQoc3JjLCBuYml0cyk7CiB9CiAKKyNpbmNsdWRlIDxh
c20vYnl0ZW9yZGVyLmg+CisKKyNpZmRlZiBfX0xJVFRMRV9FTkRJQU4KKyNkZWZpbmUgQklUTUFQ
X01FTV9BTElHTk1FTlQgOAorI2Vsc2UKKyNkZWZpbmUgQklUTUFQX01FTV9BTElHTk1FTlQgKDgg
KiBzaXplb2YodW5zaWduZWQgbG9uZykpCisjZW5kaWYKKyNkZWZpbmUgQklUTUFQX01FTV9NQVNL
IChCSVRNQVBfTUVNX0FMSUdOTUVOVCAtIDEpCisjZGVmaW5lIEJJVE1BUF9GSVJTVF9XT1JEX01B
U0soc3RhcnQpICh+MFVMIDw8ICgoc3RhcnQpICYgKEJJVFNfUEVSX0xPTkcgLSAxKSkpCisKK3N0
YXRpYyBpbmxpbmUgdm9pZCBiaXRtYXBfc2V0KHVuc2lnbmVkIGxvbmcgKm1hcCwgdW5zaWduZWQg
aW50IHN0YXJ0LAorCQl1bnNpZ25lZCBpbnQgbmJpdHMpCit7CisJaWYgKF9fYnVpbHRpbl9jb25z
dGFudF9wKG5iaXRzKSAmJiBuYml0cyA9PSAxKQorCQlfX3NldF9iaXQoc3RhcnQsIG1hcCk7CisJ
ZWxzZSBpZiAoX19idWlsdGluX2NvbnN0YW50X3Aoc3RhcnQgJiBCSVRNQVBfTUVNX01BU0spICYm
CisJCSBJU19BTElHTkVEKHN0YXJ0LCBCSVRNQVBfTUVNX0FMSUdOTUVOVCkgJiYKKwkJIF9fYnVp
bHRpbl9jb25zdGFudF9wKG5iaXRzICYgQklUTUFQX01FTV9NQVNLKSAmJgorCQkgSVNfQUxJR05F
RChuYml0cywgQklUTUFQX01FTV9BTElHTk1FTlQpKQorCQltZW1zZXQoKGNoYXIgKiltYXAgKyBz
dGFydCAvIDgsIDB4ZmYsIG5iaXRzIC8gOCk7CisJZWxzZQorCQlfX2JpdG1hcF9zZXQobWFwLCBz
dGFydCwgbmJpdHMpOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgYml0bWFwX2NsZWFyKHVuc2ln
bmVkIGxvbmcgKm1hcCwgdW5zaWduZWQgaW50IHN0YXJ0LAorCQl1bnNpZ25lZCBpbnQgbmJpdHMp
Cit7CisJaWYgKF9fYnVpbHRpbl9jb25zdGFudF9wKG5iaXRzKSAmJiBuYml0cyA9PSAxKQorCQlf
X2NsZWFyX2JpdChzdGFydCwgbWFwKTsKKwllbHNlIGlmIChfX2J1aWx0aW5fY29uc3RhbnRfcChz
dGFydCAmIEJJVE1BUF9NRU1fTUFTSykgJiYKKwkJIElTX0FMSUdORUQoc3RhcnQsIEJJVE1BUF9N
RU1fQUxJR05NRU5UKSAmJgorCQkgX19idWlsdGluX2NvbnN0YW50X3AobmJpdHMgJiBCSVRNQVBf
TUVNX01BU0spICYmCisJCSBJU19BTElHTkVEKG5iaXRzLCBCSVRNQVBfTUVNX0FMSUdOTUVOVCkp
CisJCW1lbXNldCgoY2hhciAqKW1hcCArIHN0YXJ0IC8gOCwgMCwgbmJpdHMgLyA4KTsKKwllbHNl
CisJCV9fYml0bWFwX2NsZWFyKG1hcCwgc3RhcnQsIG5iaXRzKTsKK30KKwogI3VuZGVmIGJpdG1h
cF9zd2l0Y2gKICN1bmRlZiBiaXRtYXBfYnl0ZXMKIAotLSAKMi4yNS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
