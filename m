Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC45143C75
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 13:03:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itsCp-0006Mk-A0; Tue, 21 Jan 2020 12:00:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zZg3=3K=amazon.co.uk=prvs=282bd3163=pdurrant@srs-us1.protection.inumbo.net>)
 id 1itsCo-0006Me-90
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 12:00:26 +0000
X-Inumbo-ID: 982f9315-3c45-11ea-ba7e-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 982f9315-3c45-11ea-ba7e-12813bfff9fa;
 Tue, 21 Jan 2020 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579608019; x=1611144019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WKoR9PC7aSnHANmo5IpUHS8ceug/R3yGf9Cfb0S+vI4=;
 b=aXRcQxuv2HejQuKC7dqQX5FiuZJHJfkKOasX/rO3Rg4OFbtnwJIqecV9
 WReLILyenE76Hazxa4TYGAodFu+38AsCVSL3EgXa9RMTZ0GUujGUD8b5x
 kdJIY0ms+ciXkkchbCffrzPVzx4shwI+L6Ok+h78q6cjxfU1Hovgi0zGs E=;
IronPort-SDR: xoDkFJ5fBz8WfBIsHzhyMcORRus7lFpjUyYAPOV1WUkPvYpDbOFxZLzAp/nQ5tjFmxVAAP3gTZ
 bM3djReBfFaA==
X-IronPort-AV: E=Sophos;i="5.70,345,1574121600"; d="scan'208";a="14010584"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 21 Jan 2020 12:00:18 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS
 id D3275A23F0; Tue, 21 Jan 2020 12:00:16 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 21 Jan 2020 12:00:16 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 21 Jan 2020 12:00:15 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 21 Jan 2020 12:00:13 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 21 Jan 2020 12:00:07 +0000
Message-ID: <20200121120009.1767-2-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200121120009.1767-1-pdurrant@amazon.com>
References: <20200121120009.1767-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 1/3] x86 / vmx: make apic_access_mfn type-safe
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlIG1mbl90IHJhdGhlciB0aGFuIHVuc2lnbmVkIGxvbmcgYW5kIGNoYW5nZSBwcmV2aW91cyB0
ZXN0cyBhZ2FpbnN0IDAgdG8KdGVzdHMgYWdhaW5zdCBJTlZBTElEX01GTiAoYWxzbyBpbnRyb2R1
Y2luZyBpbml0aWFsaXphdGlvbiB0byB0aGF0IHZhbHVlKS4KClNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CkNjOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+
CkNjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYv
aHZtL210cnIuYyAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5j
ICAgICAgICAgfCAxNCArKysrKysrLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdm14
L3ZtY3MuaCB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL210cnIuYyBiL3hlbi9hcmNo
L3g4Ni9odm0vbXRyci5jCmluZGV4IDVhZDE1ZWFmZTAuLjgzNTZlOGRlM2QgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9odm0vbXRyci5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vbXRyci5jCkBA
IC04MTgsNyArODE4LDcgQEAgaW50IGVwdGVfZ2V0X2VudHJ5X2VtdChzdHJ1Y3QgZG9tYWluICpk
LCB1bnNpZ25lZCBsb25nIGdmbiwgbWZuX3QgbWZuLAogCiAgICAgaWYgKCBkaXJlY3RfbW1pbyAp
CiAgICAgewotICAgICAgICBpZiAoIChtZm5feChtZm4pIF4gZC0+YXJjaC5odm0udm14LmFwaWNf
YWNjZXNzX21mbikgPj4gb3JkZXIgKQorICAgICAgICBpZiAoIChtZm5feChtZm4pIF4gbWZuX3go
ZC0+YXJjaC5odm0udm14LmFwaWNfYWNjZXNzX21mbikpID4+IG9yZGVyICkKICAgICAgICAgICAg
IHJldHVybiBNVFJSX1RZUEVfVU5DQUNIQUJMRTsKICAgICAgICAgaWYgKCBvcmRlciApCiAgICAg
ICAgICAgICByZXR1cm4gLTE7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXgu
YyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCmluZGV4IGY4M2YxMDI2MzguLjNkOTBlNjdh
MDUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vdm14L3ZteC5jCkBAIC00MTMsNiArNDEzLDcgQEAgc3RhdGljIGludCB2bXhfZG9t
YWluX2luaXRpYWxpc2Uoc3RydWN0IGRvbWFpbiAqZCkKICAgICBpZiAoICFoYXNfdmxhcGljKGQp
ICkKICAgICAgICAgcmV0dXJuIDA7CiAKKyAgICBkLT5hcmNoLmh2bS52bXguYXBpY19hY2Nlc3Nf
bWZuID0gSU5WQUxJRF9NRk47CiAgICAgaWYgKCAocmMgPSB2bXhfYWxsb2NfdmxhcGljX21hcHBp
bmcoZCkpICE9IDAgKQogICAgICAgICByZXR1cm4gcmM7CiAKQEAgLTMwMzQsNyArMzAzNSw3IEBA
IHN0YXRpYyBpbnQgdm14X2FsbG9jX3ZsYXBpY19tYXBwaW5nKHN0cnVjdCBkb21haW4gKmQpCiAg
ICAgbWZuID0gcGFnZV90b19tZm4ocGcpOwogICAgIGNsZWFyX2RvbWFpbl9wYWdlKG1mbik7CiAg
ICAgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdChwZywgZCwgU0hBUkVfcncpOwotICAgIGQtPmFy
Y2guaHZtLnZteC5hcGljX2FjY2Vzc19tZm4gPSBtZm5feChtZm4pOworICAgIGQtPmFyY2guaHZt
LnZteC5hcGljX2FjY2Vzc19tZm4gPSBtZm47CiAKICAgICByZXR1cm4gc2V0X21taW9fcDJtX2Vu
dHJ5KGQsIHBhZGRyX3RvX3BmbihBUElDX0RFRkFVTFRfUEhZU19CQVNFKSwgbWZuLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgUEFHRV9PUkRFUl80SywKQEAgLTMwNDMsMjQgKzMwNDQs
MjMgQEAgc3RhdGljIGludCB2bXhfYWxsb2NfdmxhcGljX21hcHBpbmcoc3RydWN0IGRvbWFpbiAq
ZCkKIAogc3RhdGljIHZvaWQgdm14X2ZyZWVfdmxhcGljX21hcHBpbmcoc3RydWN0IGRvbWFpbiAq
ZCkKIHsKLSAgICB1bnNpZ25lZCBsb25nIG1mbiA9IGQtPmFyY2guaHZtLnZteC5hcGljX2FjY2Vz
c19tZm47CisgICAgbWZuX3QgbWZuID0gZC0+YXJjaC5odm0udm14LmFwaWNfYWNjZXNzX21mbjsK
IAotICAgIGlmICggbWZuICE9IDAgKQotICAgICAgICBmcmVlX3NoYXJlZF9kb21oZWFwX3BhZ2Uo
bWZuX3RvX3BhZ2UoX21mbihtZm4pKSk7CisgICAgaWYgKCAhbWZuX2VxKG1mbiwgSU5WQUxJRF9N
Rk4pICkKKyAgICAgICAgZnJlZV9zaGFyZWRfZG9taGVhcF9wYWdlKG1mbl90b19wYWdlKG1mbikp
OwogfQogCiBzdGF0aWMgdm9pZCB2bXhfaW5zdGFsbF92bGFwaWNfbWFwcGluZyhzdHJ1Y3QgdmNw
dSAqdikKIHsKICAgICBwYWRkcl90IHZpcnRfcGFnZV9tYSwgYXBpY19wYWdlX21hOwogCi0gICAg
aWYgKCB2LT5kb21haW4tPmFyY2guaHZtLnZteC5hcGljX2FjY2Vzc19tZm4gPT0gMCApCisgICAg
aWYgKCBtZm5fZXEodi0+ZG9tYWluLT5hcmNoLmh2bS52bXguYXBpY19hY2Nlc3NfbWZuLCBJTlZB
TElEX01GTikgKQogICAgICAgICByZXR1cm47CiAKICAgICBBU1NFUlQoY3B1X2hhc192bXhfdmly
dHVhbGl6ZV9hcGljX2FjY2Vzc2VzKTsKIAogICAgIHZpcnRfcGFnZV9tYSA9IHBhZ2VfdG9fbWFk
ZHIodmNwdV92bGFwaWModiktPnJlZ3NfcGFnZSk7Ci0gICAgYXBpY19wYWdlX21hID0gdi0+ZG9t
YWluLT5hcmNoLmh2bS52bXguYXBpY19hY2Nlc3NfbWZuOwotICAgIGFwaWNfcGFnZV9tYSA8PD0g
UEFHRV9TSElGVDsKKyAgICBhcGljX3BhZ2VfbWEgPSBtZm5fdG9fbWFkZHIodi0+ZG9tYWluLT5h
cmNoLmh2bS52bXguYXBpY19hY2Nlc3NfbWZuKTsKIAogICAgIHZteF92bWNzX2VudGVyKHYpOwog
ICAgIF9fdm13cml0ZShWSVJUVUFMX0FQSUNfUEFHRV9BRERSLCB2aXJ0X3BhZ2VfbWEpOwpkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdm14L3ZtY3MuaCBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvaHZtL3ZteC92bWNzLmgKaW5kZXggYTUxNDI5OTE0NC4uYmU0NjYxYTkyOSAxMDA2
NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdm14L3ZtY3MuaAorKysgYi94ZW4vaW5j
bHVkZS9hc20teDg2L2h2bS92bXgvdm1jcy5oCkBAIC01OSw3ICs1OSw3IEBAIHN0cnVjdCBlcHRf
ZGF0YSB7CiAjZGVmaW5lIF9WTVhfRE9NQUlOX1BNTF9FTkFCTEVEICAgIDAKICNkZWZpbmUgVk1Y
X0RPTUFJTl9QTUxfRU5BQkxFRCAgICAgKDF1bCA8PCBfVk1YX0RPTUFJTl9QTUxfRU5BQkxFRCkK
IHN0cnVjdCB2bXhfZG9tYWluIHsKLSAgICB1bnNpZ25lZCBsb25nIGFwaWNfYWNjZXNzX21mbjsK
KyAgICBtZm5fdCBhcGljX2FjY2Vzc19tZm47CiAgICAgLyogVk1YX0RPTUFJTl8qICovCiAgICAg
dW5zaWduZWQgaW50IHN0YXR1czsKIAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
