Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C75D145EA3
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 23:33:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuOWw-0001It-R5; Wed, 22 Jan 2020 22:31:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ac9L=3L=amazon.com=prvs=2839ba572=elnikety@srs-us1.protection.inumbo.net>)
 id 1iuOWv-0001If-8d
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 22:31:21 +0000
X-Inumbo-ID: e9e8abec-3d66-11ea-8e9a-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9e8abec-3d66-11ea-8e9a-bc764e2007e4;
 Wed, 22 Jan 2020 22:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579732281; x=1611268281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=m88SymQhWYJsFn/a/6K8UsMRfgoU0u5Lte066UUwfz4=;
 b=fKuPlmNp36x3Ye55MUxDsVnZpl95el35xq9ygnt0z/5+WhHAkYAZWM6h
 xw3fWyg6zC2AelHln020foR4xbOzjBORrYq5aJUXBv0WNhE/H+fMLbPDp
 eik4k2L/tYEOAHpa90DC5bHLik91woczXeGOevqW1V4b86Z0WRxhF9du8 A=;
IronPort-SDR: kaQnJaGf0yD00u07wNHosPW3Z6y4jZZi1CggqU1TpSyzxv/4gR5QKLzFPeKpUGecpkM2MrQps/
 qEqVZPkNENXA==
X-IronPort-AV: E=Sophos;i="5.70,351,1574121600"; d="scan'208";a="13688933"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-22cc717f.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 22 Jan 2020 22:31:19 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-22cc717f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3325DA1CC0; Wed, 22 Jan 2020 22:31:18 +0000 (UTC)
Received: from EX13D08UEE003.ant.amazon.com (10.43.62.118) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 22:31:17 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D08UEE003.ant.amazon.com (10.43.62.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 22:31:17 +0000
Received: from dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (10.15.63.96)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Wed, 22 Jan 2020 22:31:16 +0000
Received: by dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (Postfix,
 from userid 6438462)
 id 39AF7A013F; Wed, 22 Jan 2020 22:31:16 +0000 (UTC)
From: Eslam Elnikety <elnikety@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 22:30:44 +0000
Message-ID: <f997f1b3a7d515392c15f518ce886710068bb4ef.1579727989.git.elnikety@amazon.com>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <cover.1579727989.git.elnikety@amazon.com>
References: <cover.1579727989.git.elnikety@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v1 2/4] x86/microcode: Improve parsing for ucode=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Eslam
 Elnikety <elnikety@amazon.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVjb3VwbGUgdGhlIG1pY3JvY29kZSBpbmRleGluZyBtZWNoYW5pc20gd2hlbiB1c2luZyBHUlVC
IHRvIHRoYXQKd2hlbiB1c2luZyBFRkkuIFRoaXMgYWxsb3dzIHVzIHRvIGF2b2lkIHRoZSAidW5z
cGVjaWZpZWQgZWZmZWN0IiBvZgp1c2luZyBgPGludGVnZXI+YCB3aGVuIGJvb3RpbmcgdmlhIEVG
SS4gV2l0aCB0aGF0LCBYZW4gY2FuIGV4cGxpY2l0bHkKaWdub3JlIHRoYXQgb3B0aW9uIHdoZW4g
dXNpbmcgRUZJLiBUaGlzIGlzIHRoZSBvbmx5IGZ1bmN0aW5hbCBjaGFuZ2UKdGhpcyBjb21taXQg
aW50cm9kdWNlcy4gVXBkYXRlIHRoZSBjb21tYW5kIGxpbmUgZG9jdW1lbnRhdGlvbiBmb3IKY29u
c2lzdGVuY3kuIEFzIGFuIGFkZGVkIGJlbmVmaXQsIHRoZSAncGFyc2VfdWNvZGUnIGxvZ2ljIGJl
Y29tZXMKaW5kZXBlbmRlbnQgb2YgR1JVQiB2cy4gRUZJLgoKV2hpbGUgYXQgaXQsIGRyb3AgdGhl
IGxlYWRpbmcgY29tbWVudCBmb3IgcGFyc2VfdWNvZGUuIE5vIHByYWN0aWNhbAp1c2UgZm9yIGl0
IGdpdmVuIHRoaXMgY29tbWl0LgoKU2lnbmVkLW9mZi1ieTogRXNsYW0gRWxuaWtldHkgPGVsbmlr
ZXR5QGFtYXpvbi5jb20+Ci0tLQogZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jIHwg
IDYgKystLS0KIHhlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYyAgICAgICAgICB8IDM4ICsrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygr
KSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxp
bmUucGFuZG9jIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCmluZGV4IGViZWM2
ZDM4N2UuLjgyMWI5MjgxYTEgMTAwNjQ0Ci0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5l
LnBhbmRvYworKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKQEAgLTIxNDcs
OSArMjE0Nyw5IEBAIGZvciB1cGRhdGluZyBDUFUgbWljcmNvZGUuIFdoZW4gbmVnYXRpdmUsIGNv
dW50aW5nIHN0YXJ0cyBhdCB0aGUgZW5kIG9mCiB0aGUgbW9kdWxlcyBpbiB0aGUgR3JVQiBlbnRy
eSAoc28gd2l0aCB0aGUgYmxvYiBjb21tb25seSBiZWluZyBsYXN0LAogb25lIGNvdWxkIHNwZWNp
ZnkgYHVjb2RlPS0xYCkuIE5vdGUgdGhhdCB0aGUgdmFsdWUgb2YgemVybyBpcyBub3QgdmFsaWQK
IGhlcmUgKGVudHJ5IHplcm8sIGkuZS4gdGhlIGZpcnN0IG1vZHVsZSwgaXMgYWx3YXlzIHRoZSBE
b20wIGtlcm5lbAotaW1hZ2UpLiBOb3RlIGZ1cnRoZXIgdGhhdCB1c2Ugb2YgdGhpcyBvcHRpb24g
aGFzIGFuIHVuc3BlY2lmaWVkIGVmZmVjdAotd2hlbiB1c2VkIHdpdGggeGVuLmVmaSAodGhlcmUg
dGhlIGNvbmNlcHQgb2YgbW9kdWxlcyBkb2Vzbid0IGV4aXN0LCBhbmQKLXRoZSBibG9iIGdldHMg
c3BlY2lmaWVkIHZpYSB0aGUgYHVjb2RlPTxmaWxlbmFtZT5gIGNvbmZpZyBmaWxlL3NlY3Rpb24K
K2ltYWdlKS4gVGhpcyBvcHRpb24gc2hvdWxkIGJlIHVzZWQgb25seSB3aXRoIGxlZ2FjeSBib290
LCBhcyBpdCBpcyBleHBsaWNpdGx5CitpZ25vcmVkIGluIEVGSSBib290LiBXaGVuIGJvb3Rpbmcg
dmlhIEVGSSwgdGhlIG1pY3JvY29kZSB1cGRhdGUgYmxvYiBmb3IKK2Vhcmx5IGxvYWRpbmcgY2Fu
IGJlIHNwZWNpZmllZCB2aWEgdGhlIGB1Y29kZT08ZmlsZW5hbWU+YCBjb25maWcgZmlsZS9zZWN0
aW9uCiBlbnRyeTsgc2VlIFtFRkkgY29uZmlndXJhdGlvbiBmaWxlIGRlc2NyaXB0aW9uXShlZmku
aHRtbCkpLgogCiAnc2NhbicgaW5zdHJ1Y3RzIHRoZSBoeXBlcnZpc29yIHRvIHNjYW4gdGhlIG11
bHRpYm9vdCBpbWFnZXMgZm9yIGFuIGNwaW8KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9taWNy
b2NvZGUuYyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYwppbmRleCA2Y2VkMjkzZDg4Li5lMWQ5
OGZhNTVlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKKysrIGIveGVuL2Fy
Y2gveDg2L21pY3JvY29kZS5jCkBAIC0zNSw2ICszNSw3IEBACiAjaW5jbHVkZSA8eGVuL2d1ZXN0
X2FjY2Vzcy5oPgogI2luY2x1ZGUgPHhlbi9lYXJseWNwaW8uaD4KICNpbmNsdWRlIDx4ZW4vd2F0
Y2hkb2cuaD4KKyNpbmNsdWRlIDx4ZW4vZWZpLmg+CiAKICNpbmNsdWRlIDxhc20vYXBpYy5oPgog
I2luY2x1ZGUgPGFzbS9kZWxheS5oPgpAQCAtNjEsNiArNjIsNyBAQAogc3RhdGljIG1vZHVsZV90
IF9faW5pdGRhdGEgdWNvZGVfbW9kOwogc3RhdGljIHNpZ25lZCBpbnQgX19pbml0ZGF0YSB1Y29k
ZV9tb2RfaWR4Owogc3RhdGljIGJvb2xfdCBfX2luaXRkYXRhIHVjb2RlX21vZF9mb3JjZWQ7Citz
dGF0aWMgdW5zaWduZWQgaW50IF9faW5pdGRhdGEgdWNvZGVfbW9kX2VmaV9pZHg7CiBzdGF0aWMg
dW5zaWduZWQgaW50IG5yX2NvcmVzOwogCiAvKgpAQCAtMTA1LDE1ICsxMDcsMTAgQEAgc3RhdGlj
IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm1pY3JvY29kZV9jYWNoZTsKIAogdm9pZCBfX2luaXQg
bWljcm9jb2RlX3NldF9tb2R1bGUodW5zaWduZWQgaW50IGlkeCkKIHsKLSAgICB1Y29kZV9tb2Rf
aWR4ID0gaWR4OworICAgIHVjb2RlX21vZF9lZmlfaWR4ID0gaWR4OwogICAgIHVjb2RlX21vZF9m
b3JjZWQgPSAxOwogfQogCi0vKgotICogVGhlIGZvcm1hdCBpcyAnWzxpbnRlZ2VyPnxzY2FuPTxi
b29sPiwgbm1pPTxib29sPl0nLiBCb3RoIG9wdGlvbnMgYXJlCi0gKiBvcHRpb25hbC4gSWYgdGhl
IEVGSSBoYXMgZm9yY2VkIHdoaWNoIG9mIHRoZSBtdWx0aWJvb3QgcGF5bG9hZHMgaXMgdG8gYmUK
LSAqIHVzZWQsIG9ubHkgbm1pPTxib29sPiBpcyBwYXJzZWQuCi0gKi8KIHN0YXRpYyBpbnQgX19p
bml0IHBhcnNlX3Vjb2RlKGNvbnN0IGNoYXIgKnMpCiB7CiAgICAgY29uc3QgY2hhciAqc3M7CkBA
IC0xMjYsMTggKzEyMywxNSBAQCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV91Y29kZShjb25zdCBj
aGFyICpzKQogCiAgICAgICAgIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oIm5taSIsIHMsIHNz
KSkgPj0gMCApCiAgICAgICAgICAgICB1Y29kZV9pbl9ubWkgPSB2YWw7Ci0gICAgICAgIGVsc2Ug
aWYgKCAhdWNvZGVfbW9kX2ZvcmNlZCApIC8qIE5vdCBmb3JjZWQgYnkgRUZJICovCisgICAgICAg
IGVsc2UgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigic2NhbiIsIHMsIHNzKSkgPj0gMCApCisg
ICAgICAgICAgICB1Y29kZV9zY2FuID0gdmFsOworICAgICAgICBlbHNlCiAgICAgICAgIHsKLSAg
ICAgICAgICAgIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oInNjYW4iLCBzLCBzcykpID49IDAg
KQotICAgICAgICAgICAgICAgIHVjb2RlX3NjYW4gPSB2YWw7Ci0gICAgICAgICAgICBlbHNlCi0g
ICAgICAgICAgICB7Ci0gICAgICAgICAgICAgICAgY29uc3QgY2hhciAqcTsKLQotICAgICAgICAg
ICAgICAgIHVjb2RlX21vZF9pZHggPSBzaW1wbGVfc3RydG9sKHMsICZxLCAwKTsKLSAgICAgICAg
ICAgICAgICBpZiAoIHEgIT0gc3MgKQotICAgICAgICAgICAgICAgICAgICByYyA9IC1FSU5WQUw7
Ci0gICAgICAgICAgICB9CisgICAgICAgICAgICBjb25zdCBjaGFyICpxOworCisgICAgICAgICAg
ICB1Y29kZV9tb2RfaWR4ID0gc2ltcGxlX3N0cnRvbChzLCAmcSwgMCk7CisgICAgICAgICAgICBp
ZiAoIHEgIT0gc3MgKQorICAgICAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKICAgICAgICAgfQog
CiAgICAgICAgIHMgPSBzcyArIDE7CkBAIC0yMjgsNiArMjIyLDE2IEBAIHZvaWQgX19pbml0IG1p
Y3JvY29kZV9ncmFiX21vZHVsZSgKIHsKICAgICBtb2R1bGVfdCAqbW9kID0gKG1vZHVsZV90ICop
X192YShtYmktPm1vZHNfYWRkcik7CiAKKyAgICBpZiAoIGVmaV9lbmFibGVkKEVGSV9CT09UKSAp
CisgICAgeworICAgICAgICBpZiAoIHVjb2RlX21vZF9mb3JjZWQgKSAvKiBNaWNyb2NvZGUgc3Bl
Y2lmaWVkIGJ5IEVGSSAqLworICAgICAgICB7CisgICAgICAgICAgICB1Y29kZV9tb2QgPSBtb2Rb
dWNvZGVfbW9kX2VmaV9pZHhdOworICAgICAgICAgICAgcmV0dXJuOworICAgICAgICB9CisgICAg
ICAgIGdvdG8gc2NhbjsKKyAgICB9CisKICAgICBpZiAoIHVjb2RlX21vZF9pZHggPCAwICkKICAg
ICAgICAgdWNvZGVfbW9kX2lkeCArPSBtYmktPm1vZHNfY291bnQ7CiAgICAgaWYgKCB1Y29kZV9t
b2RfaWR4IDw9IDAgfHwgdWNvZGVfbW9kX2lkeCA+PSBtYmktPm1vZHNfY291bnQgfHwKLS0gCjIu
MTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
