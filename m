Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA00B13D711
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 10:39:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is1Zs-0006hO-Kz; Thu, 16 Jan 2020 09:36:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TxvK=3F=amazon.co.uk=prvs=27736368b=pdurrant@srs-us1.protection.inumbo.net>)
 id 1is1Zr-0006h7-DN
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 09:36:35 +0000
X-Inumbo-ID: aa31496e-3843-11ea-a985-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa31496e-3843-11ea-a985-bc764e2007e4;
 Thu, 16 Jan 2020 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579167386; x=1610703386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cKSTwccKGY8nHaDIj36V1UIPrTlUcPQVLieqyIr80mE=;
 b=vrpkpCNcfCYCQSxRLXnvpRy2ucXdj7Cy6fVDA8r+FHYeUOKX6eT/Cv6w
 yF5Wt5lVhrzXBlt7o5h5ETXp9LDDWNxlaLFEyYPOVU88CPxomrC96s1m5
 N4n81Mx6F6UZlweRs2OkdavJMqBELD/NzbvrqKlMInbg8WXfHg1kyj9nA 4=;
IronPort-SDR: vALv4Gm9YSJ7Eui+wTNGi3zpWHRbErV4gTm45X84iIxrEOj96vZYnz1Gqa6tyRy1JVh0NoPEuU
 BRrX8UjJhUTA==
X-IronPort-AV: E=Sophos;i="5.70,325,1574121600"; d="scan'208";a="20426655"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 16 Jan 2020 09:36:16 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 29142A238E; Thu, 16 Jan 2020 09:36:15 +0000 (UTC)
Received: from EX13D32EUB001.ant.amazon.com (10.43.166.125) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 16 Jan 2020 09:36:14 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D32EUB001.ant.amazon.com (10.43.166.125) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 16 Jan 2020 09:36:13 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 16 Jan 2020 09:36:11 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 16 Jan 2020 09:35:58 +0000
Message-ID: <20200116093602.4203-3-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116093602.4203-1-pdurrant@amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 2/6] libxl_create: make 'soft reset' explicit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlICdzb2Z0IHJlc2V0JyBjb2RlIHBhdGggaW4gbGlieGxfX2RvbWFpbl9tYWtlKCkgaXMgY3Vy
cmVudGx5IHRha2VuIGlmIGEKdmFsaWQgZG9taWQgaXMgcGFzc2VkIGludG8gdGhlIGZ1bmN0aW9u
LiBBIHN1YnNlcXVlbnQgcGF0Y2ggd2lsbCBlbmFibGUKaGlnaGVyIGxldmVscyBvZiB0aGUgdG9v
bHN0YWNrIHRvIGRldGVybWluZSB0aGUgZG9taWQgb2YgbmV3bHkgY3JlYXRlZCBvcgpyZXN0b3Jl
ZCBkb21haW5zIGFuZCB0aGVyZWZvcmUgdGhpcyBjcml0ZXJpYSBmb3IgY2hvb3NpbmcgJ3NvZnQg
cmVzZXQnCndpbGwgbm8gbG9uZ2VyIGJlIHVzYWJsZS4KClRoaXMgcGF0Y2ggYWRkcyBhbiBleHRy
YSBib29sZWFuIG9wdGlvbiB0byBsaWJ4bF9fZG9tYWluX21ha2UoKSB0byBzcGVjaWZ5CndoZXRo
ZXIgaXQgaXMgYmVpbmcgaW52b2tlZCBpbiBzb2Z0IHJlc2V0IGNvbnRleHQgYW5kIGFwcHJvcHJp
YXRlbHkKbW9kaWZpZXMgY2FsbGVycyB0byBjaG9vc2UgdGhlIHJpZ2h0IHZhbHVlLiBUbyBmYWNp
bGl0YXRlIHRoaXMsIGEgbmV3Cidzb2Z0X3Jlc2V0JyBib29sZWFuIGZpZWxkIGlzIGFkZGVkIHRv
IHN0cnVjdCBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9zdGF0ZQphbmQgdGhlICdkb21pZF9zb2Z0X3Jl
c2V0JyBmaWVsZCBpcyByZW5hbWVkIHRvICdkb21pZCcgaW4gYW50aWNpcGF0aW9uIG9mCml0cyB3
aWRlciByZW1pdC4gRm9yIHRoZSBtb21lbnQgZG9fZG9tYWluX2NyZWF0ZSgpIHdpbGwgYWx3YXlz
IHNldApkb21pZCB0byBJTlZBTElEX0RPTUlEIGFuZCBoZW5jZSB3ZSBjYW4gYWRkIGFuIGFzc2Vy
dGlvbiBpbnRvCmxpYnhsX19kb21haW5fY3JlYXRlKCkgdGhhdCwgaWYgaXQgaXMgbm90IGNhbGxl
ZCBpbiBzb2Z0IHJlc2V0IGNvbnRleHQsCnRoZSBwYXNzZWQgaW4gZG9taWQgaXMgZXhhY3RseSB0
aGF0IHZhbHVlLgoKV2hpbHN0IGluIHRoZSBuZWlnaGJvdXJob29kLCBzb21lIGNoZWNrcyBvZiAn
cmVzdG9yZV9mZCA+IC0xJyBoYXZlIGJlZW4KcmVwbGFjZWQgYnkgJ3Jlc3RvcmVfZmQgPj0gMCcg
dG8gYmUgbW9yZSBjb252ZW50aW9uYWwgYW5kIGNvbnNpc3RlbnQgd2l0aApjaGVja3Mgb2YgJ3Jl
c3RvcmVfZmQgPCAwJy4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1h
em9uLmNvbT4KQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgotLS0KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNjOiBBbnRob255IFBFUkFSRCA8YW50aG9u
eS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAgIHwg
NTYgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiB0b29scy9saWJ4bC9saWJ4
bF9kbS5jICAgICAgIHwgIDIgKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCAgNSAr
Ky0tCiAzIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGli
eGxfY3JlYXRlLmMKaW5kZXggYmM0MjVmZWUzMi4uMTgzNWE1NTAyYyAxMDA2NDQKLS0tIGEvdG9v
bHMvbGlieGwvbGlieGxfY3JlYXRlLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMK
QEAgLTUzOCw3ICs1MzgsNyBAQCBvdXQ6CiAKIGludCBsaWJ4bF9fZG9tYWluX21ha2UobGlieGxf
X2djICpnYywgbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcsCiAgICAgICAgICAgICAgICAg
ICAgICAgIGxpYnhsX19kb21haW5fYnVpbGRfc3RhdGUgKnN0YXRlLAotICAgICAgICAgICAgICAg
ICAgICAgICB1aW50MzJfdCAqZG9taWQpCisgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90
ICpkb21pZCwgYm9vbCBzb2Z0X3Jlc2V0KQogewogICAgIGxpYnhsX2N0eCAqY3R4ID0gbGlieGxf
X2djX293bmVyKGdjKTsKICAgICBpbnQgcmV0LCByYywgbmJfdm07CkBAIC01NTUsMTQgKzU1NSwx
NSBAQCBpbnQgbGlieGxfX2RvbWFpbl9tYWtlKGxpYnhsX19nYyAqZ2MsIGxpYnhsX2RvbWFpbl9j
b25maWcgKmRfY29uZmlnLAogICAgIGxpYnhsX2RvbWFpbl9jcmVhdGVfaW5mbyAqaW5mbyA9ICZk
X2NvbmZpZy0+Y19pbmZvOwogICAgIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvICpiX2luZm8gPSAm
ZF9jb25maWctPmJfaW5mbzsKIAorICAgIGFzc2VydChzb2Z0X3Jlc2V0IHx8ICpkb21pZCA9PSBJ
TlZBTElEX0RPTUlEKTsKKwogICAgIHV1aWRfc3RyaW5nID0gbGlieGxfX3V1aWQyc3RyaW5nKGdj
LCBpbmZvLT51dWlkKTsKICAgICBpZiAoIXV1aWRfc3RyaW5nKSB7CiAgICAgICAgIHJjID0gRVJS
T1JfTk9NRU07CiAgICAgICAgIGdvdG8gb3V0OwogICAgIH0KIAotICAgIC8qIFZhbGlkIGRvbWlk
IGhlcmUgbWVhbnMgd2UncmUgc29mdCByZXNldHRpbmcuICovCi0gICAgaWYgKCFsaWJ4bF9kb21p
ZF92YWxpZF9ndWVzdCgqZG9taWQpKSB7CisgICAgaWYgKCFzb2Z0X3Jlc2V0KSB7CiAgICAgICAg
IHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiBjcmVhdGUgPSB7CiAgICAgICAgICAgICAu
c3NpZHJlZiA9IGluZm8tPnNzaWRyZWYsCiAgICAgICAgICAgICAubWF4X3ZjcHVzID0gYl9pbmZv
LT5tYXhfdmNwdXMsCkBAIC02MTEsNiArNjEyLDE0IEBAIGludCBsaWJ4bF9fZG9tYWluX21ha2Uo
bGlieGxfX2djICpnYywgbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcsCiAgICAgICAgICAg
ICBnb3RvIG91dDsKICAgICB9CiAKKyAgICAvKgorICAgICAqIElmIHNvZnRfcmVzZXQgaXMgc2V0
IHRoZSB0aGUgZG9taWQgd2lsbCBoYXZlIGJlZW4gdmFsaWQgb24gZW50cnkuCisgICAgICogSWYg
aXQgd2FzIG5vdCBzZXQgdGhlbiB4Y19kb21haW5fY3JlYXRlKCkgc2hvdWxkIGhhdmUgYXNzaWdu
ZWQgYQorICAgICAqIHZhbGlkIHZhbHVlLiBFaXRoZXIgd2F5LCBpZiB3ZSByZWFjaCB0aGlzIHBv
aW50LCBkb21pZCBzaG91bGQgYmUKKyAgICAgKiB2YWxpZC4KKyAgICAgKi8KKyAgICBhc3NlcnQo
bGlieGxfZG9taWRfdmFsaWRfZ3Vlc3QoKmRvbWlkKSk7CisKICAgICByZXQgPSB4Y19jcHVwb29s
X21vdmVkb21haW4oY3R4LT54Y2gsIGluZm8tPnBvb2xpZCwgKmRvbWlkKTsKICAgICBpZiAocmV0
IDwgMCkgewogICAgICAgICBMT0dFRChFUlJPUiwgKmRvbWlkLCAiZG9tYWluIG1vdmUgZmFpbCIp
OwpAQCAtMTA5MSwxMyArMTEwMCwxNCBAQCBzdGF0aWMgdm9pZCBpbml0aWF0ZV9kb21haW5fY3Jl
YXRlKGxpYnhsX19lZ2MgKmVnYywKICAgICBsaWJ4bF9kb21haW5fY29uZmlnICpjb25zdCBkX2Nv
bmZpZyA9IGRjcy0+Z3Vlc3RfY29uZmlnOwogICAgIGNvbnN0IGludCByZXN0b3JlX2ZkID0gZGNz
LT5yZXN0b3JlX2ZkOwogCi0gICAgZG9taWQgPSBkY3MtPmRvbWlkX3NvZnRfcmVzZXQ7CisgICAg
ZG9taWQgPSBkY3MtPmRvbWlkOwogICAgIGxpYnhsX19kb21haW5fYnVpbGRfc3RhdGVfaW5pdCgm
ZGNzLT5idWlsZF9zdGF0ZSk7CiAKICAgICByZXQgPSBsaWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRk
ZWZhdWx0KGdjLGRfY29uZmlnLGRvbWlkKTsKICAgICBpZiAocmV0KSBnb3RvIGVycm9yX291dDsK
IAotICAgIHJldCA9IGxpYnhsX19kb21haW5fbWFrZShnYywgZF9jb25maWcsICZkY3MtPmJ1aWxk
X3N0YXRlLCAmZG9taWQpOworICAgIHJldCA9IGxpYnhsX19kb21haW5fbWFrZShnYywgZF9jb25m
aWcsICZkY3MtPmJ1aWxkX3N0YXRlLCAmZG9taWQsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRjcy0+c29mdF9yZXNldCk7CiAgICAgaWYgKHJldCkgewogICAgICAgICBMT0dEKEVSUk9S
LCBkb21pZCwgImNhbm5vdCBtYWtlIGRvbWFpbjogJWQiLCByZXQpOwogICAgICAgICBkY3MtPmd1
ZXN0X2RvbWlkID0gZG9taWQ7CkBAIC0xMTQxLDcgKzExNTEsNyBAQCBzdGF0aWMgdm9pZCBpbml0
aWF0ZV9kb21haW5fY3JlYXRlKGxpYnhsX19lZ2MgKmVnYywKICAgICBpZiAocmV0KQogICAgICAg
ICBnb3RvIGVycm9yX291dDsKIAotICAgIGlmIChyZXN0b3JlX2ZkID49IDAgfHwgZGNzLT5kb21p
ZF9zb2Z0X3Jlc2V0ICE9IElOVkFMSURfRE9NSUQpIHsKKyAgICBpZiAocmVzdG9yZV9mZCA+PSAw
IHx8IGRjcy0+c29mdF9yZXNldCkgewogICAgICAgICBMT0dEKERFQlVHLCBkb21pZCwgInJlc3Rv
cmluZywgbm90IHJ1bm5pbmcgYm9vdGxvYWRlciIpOwogICAgICAgICBkb21jcmVhdGVfYm9vdGxv
YWRlcl9kb25lKGVnYywgJmRjcy0+YmwsIDApOwogICAgIH0gZWxzZSAgewpAQCAtMTIxNyw3ICsx
MjI3LDcgQEAgc3RhdGljIHZvaWQgZG9tY3JlYXRlX2Jvb3Rsb2FkZXJfZG9uZShsaWJ4bF9fZWdj
ICplZ2MsCiAgICAgZGNzLT5zZHNzLmRtLmNhbGxiYWNrID0gZG9tY3JlYXRlX2Rldm1vZGVsX3N0
YXJ0ZWQ7CiAgICAgZGNzLT5zZHNzLmNhbGxiYWNrID0gZG9tY3JlYXRlX2Rldm1vZGVsX3N0YXJ0
ZWQ7CiAKLSAgICBpZiAocmVzdG9yZV9mZCA8IDAgJiYgZGNzLT5kb21pZF9zb2Z0X3Jlc2V0ID09
IElOVkFMSURfRE9NSUQpIHsKKyAgICBpZiAocmVzdG9yZV9mZCA8IDAgJiYgIWRjcy0+c29mdF9y
ZXNldCkgewogICAgICAgICByYyA9IGxpYnhsX19kb21haW5fYnVpbGQoZ2MsIGRfY29uZmlnLCBk
b21pZCwgc3RhdGUpOwogICAgICAgICBkb21jcmVhdGVfcmVidWlsZF9kb25lKGVnYywgZGNzLCBy
Yyk7CiAgICAgICAgIHJldHVybjsKQEAgLTE4MjcsNyArMTgzNyw3IEBAIHN0YXRpYyBpbnQgZG9f
ZG9tYWluX2NyZWF0ZShsaWJ4bF9jdHggKmN0eCwgbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25m
aWcsCiAgICAgbGlieGxfZG9tYWluX2NvbmZpZ19jb3B5KGN0eCwgJmNkY3MtPmRjcy5ndWVzdF9j
b25maWdfc2F2ZWQsIGRfY29uZmlnKTsKICAgICBjZGNzLT5kY3MucmVzdG9yZV9mZCA9IGNkY3Mt
PmRjcy5saWJ4Y19mZCA9IHJlc3RvcmVfZmQ7CiAgICAgY2Rjcy0+ZGNzLnNlbmRfYmFja19mZCA9
IHNlbmRfYmFja19mZDsKLSAgICBpZiAocmVzdG9yZV9mZCA+IC0xKSB7CisgICAgaWYgKHJlc3Rv
cmVfZmQgPj0gMCkgewogICAgICAgICBjZGNzLT5kY3MucmVzdG9yZV9wYXJhbXMgPSAqcGFyYW1z
OwogICAgICAgICByYyA9IGxpYnhsX19mZF9mbGFnc19tb2RpZnlfc2F2ZShnYywgY2Rjcy0+ZGNz
LnJlc3RvcmVfZmQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH4o
T19OT05CTE9DS3xPX05ERUxBWSksIDAsCkBAIC0xODM1LDcgKzE4NDUsOCBAQCBzdGF0aWMgaW50
IGRvX2RvbWFpbl9jcmVhdGUobGlieGxfY3R4ICpjdHgsIGxpYnhsX2RvbWFpbl9jb25maWcgKmRf
Y29uZmlnLAogICAgICAgICBpZiAocmMgPCAwKSBnb3RvIG91dF9lcnI7CiAgICAgfQogICAgIGNk
Y3MtPmRjcy5jYWxsYmFjayA9IGRvbWFpbl9jcmVhdGVfY2I7Ci0gICAgY2Rjcy0+ZGNzLmRvbWlk
X3NvZnRfcmVzZXQgPSBJTlZBTElEX0RPTUlEOworICAgIGNkY3MtPmRjcy5kb21pZCA9IElOVkFM
SURfRE9NSUQ7CisgICAgY2Rjcy0+ZGNzLnNvZnRfcmVzZXQgPSBmYWxzZTsKIAogICAgIGlmIChj
ZGNzLT5kY3MucmVzdG9yZV9wYXJhbXMuY2hlY2twb2ludGVkX3N0cmVhbSA9PQogICAgICAgICBM
SUJYTF9DSEVDS1BPSU5URURfU1RSRUFNX0NPTE8pIHsKQEAgLTE5MDUsNyArMTkxNiw3IEBAIHN0
YXRpYyB2b2lkIHNvZnRfcmVzZXRfZG1fc3VzcGVuZGVkKGxpYnhsX19lZ2MgKmVnYywKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCByYyk7CiBzdGF0aWMgaW50IGRvX2Rv
bWFpbl9zb2Z0X3Jlc2V0KGxpYnhsX2N0eCAqY3R4LAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBsaWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZpZywKLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdWludDMyX3QgZG9taWRfc29mdF9yZXNldCwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdWludDMyX3QgZG9taWQsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IGxpYnhsX2FzeW5jb3BfaG93ICphb19ob3csCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhsX2FzeW5jcHJvZ3Jlc3NfaG93CiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICphb3BfY29uc29sZV9ob3cpCkBAIC0xOTMzLDE1ICsx
OTQ0LDE2IEBAIHN0YXRpYyBpbnQgZG9fZG9tYWluX3NvZnRfcmVzZXQobGlieGxfY3R4ICpjdHgs
CiAgICAgbGlieGxfZG9tYWluX2NvbmZpZ19jb3B5KGN0eCwgJnNycy0+Y2Rjcy5kY3MuZ3Vlc3Rf
Y29uZmlnX3NhdmVkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkX2NvbmZpZyk7CiAg
ICAgY2Rjcy0+ZGNzLnJlc3RvcmVfZmQgPSAtMTsKLSAgICBjZGNzLT5kY3MuZG9taWRfc29mdF9y
ZXNldCA9IGRvbWlkX3NvZnRfcmVzZXQ7CisgICAgY2Rjcy0+ZGNzLmRvbWlkID0gZG9taWQ7Cisg
ICAgY2Rjcy0+ZGNzLnNvZnRfcmVzZXQgPSB0cnVlOwogICAgIGNkY3MtPmRjcy5jYWxsYmFjayA9
IGRvbWFpbl9jcmVhdGVfY2I7CiAgICAgbGlieGxfX2FvX3Byb2dyZXNzX2dldGhvdygmc3JzLT5j
ZGNzLmRjcy5hb3BfY29uc29sZV9ob3csCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBh
b3BfY29uc29sZV9ob3cpOwogICAgIGNkY3MtPmRvbWlkX291dCA9ICZkb21pZF9vdXQ7CiAKLSAg
ICBkb21fcGF0aCA9IGxpYnhsX194c19nZXRfZG9tcGF0aChnYywgZG9taWRfc29mdF9yZXNldCk7
CisgICAgZG9tX3BhdGggPSBsaWJ4bF9feHNfZ2V0X2RvbXBhdGgoZ2MsIGRvbWlkKTsKICAgICBp
ZiAoIWRvbV9wYXRoKSB7Ci0gICAgICAgIExPR0QoRVJST1IsIGRvbWlkX3NvZnRfcmVzZXQsICJm
YWlsZWQgdG8gcmVhZCBkb21haW4gcGF0aCIpOworICAgICAgICBMT0dEKEVSUk9SLCBkb21pZCwg
ImZhaWxlZCB0byByZWFkIGRvbWFpbiBwYXRoIik7CiAgICAgICAgIHJjID0gRVJST1JfRkFJTDsK
ICAgICAgICAgZ290byBvdXQ7CiAgICAgfQpAQCAtMTk1MCw3ICsxOTYyLDcgQEAgc3RhdGljIGlu
dCBkb19kb21haW5fc29mdF9yZXNldChsaWJ4bF9jdHggKmN0eCwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgR0NTUFJJTlRGKCIlcy9zdG9yZS9yaW5nLXJlZiIsIGRvbV9wYXRoKSwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnhzX3N0b3JlX21mbik7CiAgICAgaWYg
KHJjKSB7Ci0gICAgICAgIExPR0QoRVJST1IsIGRvbWlkX3NvZnRfcmVzZXQsICJmYWlsZWQgdG8g
cmVhZCBzdG9yZS9yaW5nLXJlZi4iKTsKKyAgICAgICAgTE9HRChFUlJPUiwgZG9taWQsICJmYWls
ZWQgdG8gcmVhZCBzdG9yZS9yaW5nLXJlZi4iKTsKICAgICAgICAgZ290byBvdXQ7CiAgICAgfQog
ICAgIHN0YXRlLT5zdG9yZV9tZm4gPSB4c19zdG9yZV9tZm4gPyBhdG9sKHhzX3N0b3JlX21mbik6
IDA7CkBAIC0xOTU5LDcgKzE5NzEsNyBAQCBzdGF0aWMgaW50IGRvX2RvbWFpbl9zb2Z0X3Jlc2V0
KGxpYnhsX2N0eCAqY3R4LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHQ1NQUklO
VEYoIiVzL2NvbnNvbGUvcmluZy1yZWYiLCBkb21fcGF0aCksCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICZ4c19jb25zb2xlX21mbik7CiAgICAgaWYgKHJjKSB7Ci0gICAgICAgIExP
R0QoRVJST1IsIGRvbWlkX3NvZnRfcmVzZXQsICJmYWlsZWQgdG8gcmVhZCBjb25zb2xlL3Jpbmct
cmVmLiIpOworICAgICAgICBMT0dEKEVSUk9SLCBkb21pZCwgImZhaWxlZCB0byByZWFkIGNvbnNv
bGUvcmluZy1yZWYuIik7CiAgICAgICAgIGdvdG8gb3V0OwogICAgIH0KICAgICBzdGF0ZS0+Y29u
c29sZV9tZm4gPSB4c19jb25zb2xlX21mbiA/IGF0b2woeHNfY29uc29sZV9tZm4pOiAwOwpAQCAt
MTk2OCwyMCArMTk4MCwyMCBAQCBzdGF0aWMgaW50IGRvX2RvbWFpbl9zb2Z0X3Jlc2V0KGxpYnhs
X2N0eCAqY3R4LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdDU1BSSU5URigi
JXMvY29uc29sZS90dHkiLCBkb21fcGF0aCksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgJmNvbnNvbGVfdHR5KTsKICAgICBpZiAocmMpIHsKLSAgICAgICAgTE9HRChFUlJPUiwg
ZG9taWRfc29mdF9yZXNldCwgImZhaWxlZCB0byByZWFkIGNvbnNvbGUvdHR5LiIpOworICAgICAg
ICBMT0dEKEVSUk9SLCBkb21pZCwgImZhaWxlZCB0byByZWFkIGNvbnNvbGUvdHR5LiIpOwogICAg
ICAgICBnb3RvIG91dDsKICAgICB9CiAgICAgc3RhdGUtPmNvbnNvbGVfdHR5ID0gbGlieGxfX3N0
cmR1cChnYywgY29uc29sZV90dHkpOwogCiAgICAgZHNzLT5hbyA9IGFvOwotICAgIGRzcy0+ZG9t
aWQgPSBkc3MtPmRzcHMuZG9taWQgPSBkb21pZF9zb2Z0X3Jlc2V0OworICAgIGRzcy0+ZG9taWQg
PSBkc3MtPmRzcHMuZG9taWQgPSBkb21pZDsKICAgICBkc3MtPmRzcHMuZG1fc2F2ZWZpbGUgPSBH
Q1NQUklOVEYoTElCWExfREVWSUNFX01PREVMX1NBVkVfRklMRSIuJWQiLAotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkb21pZF9zb2Z0X3Jlc2V0KTsKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZG9taWQpOwogCiAgICAgcmMgPSBsaWJ4bF9fc2F2
ZV9lbXVsYXRvcl94ZW5zdG9yZV9kYXRhKGRzcywgJnNycy0+dG9vbHN0YWNrX2J1ZiwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnNycy0+dG9vbHN0YWNrX2xl
bik7CiAgICAgaWYgKHJjKSB7Ci0gICAgICAgIExPR0QoRVJST1IsIGRvbWlkX3NvZnRfcmVzZXQs
ICJmYWlsZWQgdG8gc2F2ZSB0b29sc3RhY2sgcmVjb3JkLiIpOworICAgICAgICBMT0dEKEVSUk9S
LCBkb21pZCwgImZhaWxlZCB0byBzYXZlIHRvb2xzdGFjayByZWNvcmQuIik7CiAgICAgICAgIGdv
dG8gb3V0OwogICAgIH0KIApAQCAtMjAxMCwxMCArMjAyMiwxMCBAQCBzdGF0aWMgdm9pZCBzb2Z0
X3Jlc2V0X2RtX3N1c3BlbmRlZChsaWJ4bF9fZWdjICplZ2MsCiAgICAgICogeGVuc3RvcmUgYWdh
aW4gd2l0aCBwcm9iYWJseSBkaWZmZXJlbnQgc3RvcmUvY29uc29sZS8uLi4KICAgICAgKiBjaGFu
bmVscy4KICAgICAgKi8KLSAgICB4c19yZWxlYXNlX2RvbWFpbihDVFgtPnhzaCwgY2Rjcy0+ZGNz
LmRvbWlkX3NvZnRfcmVzZXQpOworICAgIHhzX3JlbGVhc2VfZG9tYWluKENUWC0+eHNoLCBjZGNz
LT5kY3MuZG9taWQpOwogCiAgICAgc3JzLT5kZHMuYW8gPSBhbzsKLSAgICBzcnMtPmRkcy5kb21p
ZCA9IGNkY3MtPmRjcy5kb21pZF9zb2Z0X3Jlc2V0OworICAgIHNycy0+ZGRzLmRvbWlkID0gY2Rj
cy0+ZGNzLmRvbWlkOwogICAgIHNycy0+ZGRzLmNhbGxiYWNrID0gZG9tYWluX3NvZnRfcmVzZXRf
Y2I7CiAgICAgc3JzLT5kZHMuc29mdF9yZXNldCA9IHRydWU7CiAgICAgbGlieGxfX2RvbWFpbl9k
ZXN0cm95KGVnYywgJnNycy0+ZGRzKTsKQEAgLTIwMjksNyArMjA0MSw3IEBAIHN0YXRpYyB2b2lk
IGRvbWFpbl9jcmVhdGVfY2IobGlieGxfX2VnYyAqZWdjLAogCiAgICAgKmNkY3MtPmRvbWlkX291
dCA9IGRvbWlkOwogCi0gICAgaWYgKGRjcy0+cmVzdG9yZV9mZCA+IC0xKSB7CisgICAgaWYgKGRj
cy0+cmVzdG9yZV9mZCA+PSAwKSB7CiAgICAgICAgIGZscmMgPSBsaWJ4bF9fZmRfZmxhZ3NfcmVz
dG9yZShnYywKICAgICAgICAgICAgICAgICBkY3MtPnJlc3RvcmVfZmQsIGRjcy0+cmVzdG9yZV9m
ZGZsKTsKICAgICAgICAgLyoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMgYi90
b29scy9saWJ4bC9saWJ4bF9kbS5jCmluZGV4IGU5MmU0MTJjMWIuLmY3NThkYWYzYjYgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG0u
YwpAQCAtMjE5Myw3ICsyMTkzLDcgQEAgdm9pZCBsaWJ4bF9fc3Bhd25fc3R1Yl9kbShsaWJ4bF9f
ZWdjICplZ2MsIGxpYnhsX19zdHViX2RtX3NwYXduX3N0YXRlICpzZHNzKQogCiAgICAgLyogZml4
bWU6IHRoaXMgZnVuY3Rpb24gY2FuIGxlYWsgdGhlIHN0dWJkb20gaWYgaXQgZmFpbHMgKi8KICAg
ICByZXQgPSBsaWJ4bF9fZG9tYWluX21ha2UoZ2MsIGRtX2NvbmZpZywgc3R1YmRvbV9zdGF0ZSwK
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnNkc3MtPnB2cWVtdS5ndWVzdF9kb21pZCk7
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzZHNzLT5wdnFlbXUuZ3Vlc3RfZG9taWQs
IGZhbHNlKTsKICAgICBpZiAocmV0KQogICAgICAgICBnb3RvIG91dDsKICAgICB1aW50MzJfdCBk
bV9kb21pZCA9IHNkc3MtPnB2cWVtdS5ndWVzdF9kb21pZDsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhsL2xpYnhsX2ludGVybmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCmluZGV4
IDNiNzA4ZmJhOGYuLmNiMjM0OTBjNTkgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2lu
dGVybmFsLmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtMTk1Nyw3ICsx
OTU3LDcgQEAgX2hpZGRlbiAgdm9pZCBsaWJ4bF9fZXhlYyhsaWJ4bF9fZ2MgKmdjLCBpbnQgc3Rk
aW5mZCwgaW50IHN0ZG91dGZkLAogX2hpZGRlbiBpbnQgbGlieGxfX2RvbWFpbl9tYWtlKGxpYnhs
X19nYyAqZ2MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2Nv
bmZpZyAqZF9jb25maWcsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX2Rv
bWFpbl9idWlsZF9zdGF0ZSAqc3RhdGUsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dWludDMyX3QgKmRvbWlkKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJf
dCAqZG9taWQsIGJvb2wgc29mdF9yZXNldCk7CiAKIF9oaWRkZW4gaW50IGxpYnhsX19kb21haW5f
YnVpbGQobGlieGxfX2djICpnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGli
eGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcsCkBAIC00MTM0LDcgKzQxMzQsOCBAQCBzdHJ1Y3Qg
bGlieGxfX2RvbWFpbl9jcmVhdGVfc3RhdGUgewogICAgIGludCByZXN0b3JlX2ZkZmw7IC8qIG9y
aWdpbmFsIGZsYWdzIG9mIHJlc3RvcmVfZmQgKi8KICAgICBpbnQgc2VuZF9iYWNrX2ZkOwogICAg
IGxpYnhsX2RvbWFpbl9yZXN0b3JlX3BhcmFtcyByZXN0b3JlX3BhcmFtczsKLSAgICB1aW50MzJf
dCBkb21pZF9zb2Z0X3Jlc2V0OworICAgIHVpbnQzMl90IGRvbWlkOworICAgIGJvb2wgc29mdF9y
ZXNldDsKICAgICBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9jYiAqY2FsbGJhY2s7CiAgICAgbGlieGxf
YXN5bmNwcm9ncmVzc19ob3cgYW9wX2NvbnNvbGVfaG93OwogICAgIC8qIHByaXZhdGUgdG8gZG9t
YWluX2NyZWF0ZSAqLwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
