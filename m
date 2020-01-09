Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 252FD13612B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 20:35:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipdYH-0001w5-Gt; Thu, 09 Jan 2020 19:33:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zaws=26=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipdYG-0001vt-R1
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 19:33:04 +0000
X-Inumbo-ID: d5386ad4-3316-11ea-b89f-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5386ad4-3316-11ea-b89f-bc764e2007e4;
 Thu, 09 Jan 2020 19:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578598374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S0PnDIRPnnivkZtzB1RPCTwe6TcOz1Y0241PkWUJgLU=;
 b=ZOj5qAH0Dqw/2PbpP963aA1W+jtRClbs3EQjwRIwOvmn38DsanJAIOxh
 v4XcrTh7qhOSzVwV3ZVZYpseIpj5DCMe1ma9I+F5YMi52fpnELUx8oEti
 rR2NR4Tmj9qqRnIbDasRryVhIjxsgJwskg/0hqPuPfcUjX0BJokOQ0iDI w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AFFgm29NDEXp+EmqkD7Dewug/IH2mIPbHS9RB/3yyT6dRa2DGobrfRFypdYu4I4CRUSaTZpVOw
 f8c7ko4NFbGwWX4EQD5hNUNKrwBN8HviP1aZA66s4TPLI70wAS1xMbWAnE+y2/D5ygqjsogyjW
 Qpvs4BYtiZUtnFnKzEquZPE59yBcCsL+BkXEpHdLQKZIWWzK8/90Mfr7D+DfQIWKdLpu2cVeDL
 IP+osGtpvOd/QNcJusTUQoE8OPXyv14O67pD1EYxPKWXWTLRw30aykJ/NKpo6HQf3M9Pk+Ki5a
 lyk=
X-SBRS: 2.7
X-MesageID: 11138290
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,414,1571716800"; d="scan'208";a="11138290"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 9 Jan 2020 19:32:39 +0000
Message-ID: <20200109193241.14542-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200109193241.14542-1-andrew.cooper3@citrix.com>
References: <20200109193241.14542-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/4] x86/boot: Clean up l?_bootmap[]
 construction
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG5lZWQgZm9yIFhlbiB0byBiZSBpZGVudGl0eSBtYXBwZWQgaW50byB0aGUgYm9vdG1hcCBp
cyBub3Qgb2J2aW91cywgYW5kCmRpZmZlcnMgYmV0d2VlbiB0aGUgTUIgYW5kIEVGSSBib290IHBh
dGhzLgoKVGhlIEVGSSBzaWRlIGlzIGZ1cnRoZXIgY29tcGxpY2F0ZWQgYnkgYW4gYXR0ZW1wdCB0
byBjb3BlIHdpdGggd2l0aCBsMl9ib290bWFwCm9ubHkgYmVpbmcgNGsgbG9uZy4gIFRoaXMgaXMg
dW5kb2N1bWVudGVkLCBjb25mdXNpbmcsIG9ubHkgd29ya3MgaWYgWGVuIGlzIHRoZQpzaW5nbGUg
b2JqZWN0IHdhbnRpbmcgbWFwcGluZy4KClRoZSBwYWdlYWJsZXMgYXJlIGNvbW1vbiB0byBib3Ro
IHRoZSBNQiBhbmQgRUZJIGJ1aWxkcywgc28gc2ltcGxpZnkgdGhlIEVGSQpib290bWFwIGNvbnN0
cnVjdGlvbiBjb2RlIHRvIG1ha2UgZXhhY3RseSBvbmUgaWRlbnRpdHktbWFwIG9mIFhlbiwgd2hp
Y2ggbm93Cm1ha2VzIHRoZSB0d28gcGF0aHMgY29uc2lzdGVudC4gIENvbW1lbnQgYm90aCBwaWVj
ZXMgb2YgbG9naWMsIGV4cGxhaW5pbmcgd2hhdAp0aGUgbWFwcGluZ3MgYXJlIG5lZWRlZCBmb3Iu
CgpGaW5hbGx5LCBsZWF2ZSBhIGxpbmtlciBhc3NlcnQgY292ZXJpbmcgdGhlIGZhY3QgdGhhdCBw
bGVudHkgb2YgY29kZSBibGluZGx5CmFzc3VtZXMgdGhhdCBYZW4gaXMgbGVzcyB0aGF0IDE2TS4g
IFRoaXMgd2FudHMgZml4aW5nIGluIGR1ZSBjb3Vyc2UuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxK
QmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCnYyOgogKiBFeHRyYSBCVUlMRF9CVUdfT04o
KSdzCi0tLQogeGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TICAgIHwgIDggKysrKysrLS0KIHhlbi9h
cmNoL3g4Ni9lZmkvZWZpLWJvb3QuaCB8IDIwICsrKysrKysrKysrKystLS0tLS0tCiB4ZW4vYXJj
aC94ODYveGVuLmxkcy5TICAgICAgfCAgMyArKysKIDMgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0
aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC9o
ZWFkLlMgYi94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKaW5kZXggZDE1MmFmNDU0Mi4uMGI3NWQz
M2EyNSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCisrKyBiL3hlbi9hcmNo
L3g4Ni9ib290L2hlYWQuUwpAQCAtNjY4LDcgKzY2OCwxMSBAQCB0cmFtcG9saW5lX3NldHVwOgog
ICAgICAgICBhZGQgICAgICVlc2ksc3ltX2ZzKF9fcGFnZV90YWJsZXNfc3RhcnQpLTgoLCVlY3gs
OCkKIDI6ICAgICAgbG9vcCAgICAxYgogCi0gICAgICAgIC8qIEluaXRpYWxpemUgTDIgYm9vdC1t
YXAvZGlyZWN0IG1hcCBwYWdlIHRhYmxlIGVudHJpZXMgKDE2TUIpLiAqLworICAgICAgICAvKgor
ICAgICAgICAgKiBNYXAgWGVuIGludG8gdGhlIGRpcmVjdG1hcCAobmVlZGVkIGZvciBlYXJseS1i
b290IHBhZ2V0YWJsZQorICAgICAgICAgKiBoYW5kbGluZy93YWxraW5nKSwgYW5kIGlkZW50aXR5
IG1hcCBYZW4gaW50byBib290bWFwIChuZWVkZWQgZm9yCisgICAgICAgICAqIHRoZSB0cmFuc2l0
aW9uIGludG8gbG9uZyBtb2RlKSwgdXNpbmcgMk0gc3VwZXJwYWdlcy4KKyAgICAgICAgICovCiAg
ICAgICAgIGxlYSAgICAgc3ltX2VzaShzdGFydCksJWVieAogICAgICAgICBsZWEgICAgICgxPDxM
Ml9QQUdFVEFCTEVfU0hJRlQpKjcrKFBBR0VfSFlQRVJWSVNPUnxfUEFHRV9QU0UpKCVlYngpLCVl
YXgKICAgICAgICAgc2hyICAgICAkKEwyX1BBR0VUQUJMRV9TSElGVC0zKSwlZWJ4CkBAIC02Nzgs
NyArNjgyLDcgQEAgdHJhbXBvbGluZV9zZXR1cDoKICAgICAgICAgc3ViICAgICAkKDE8PEwyX1BB
R0VUQUJMRV9TSElGVCksJWVheAogICAgICAgICBsb29wICAgIDFiCiAKLSAgICAgICAgLyogSW5p
dGlhbGl6ZSBMMyBib290LW1hcCBwYWdlIGRpcmVjdG9yeSBlbnRyeS4gKi8KKyAgICAgICAgLyog
SW5pdGlhbGl6ZSBMMyBib290LW1hcCBwYWdlIGRpcmVjdG9yeSBlbnRyaWVzLiAqLwogICAgICAg
ICBsZWEgICAgIF9fUEFHRV9IWVBFUlZJU09SKyhMMl9QQUdFVEFCTEVfRU5UUklFUyo4KSozK3N5
bV9lc2kobDJfYm9vdG1hcCksJWVheAogICAgICAgICBtb3YgICAgICQ0LCVlY3gKIDE6ICAgICAg
bW92ICAgICAlZWF4LHN5bV9mcyhsM19ib290bWFwKS04KCwlZWN4LDgpCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmggYi94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgK
aW5kZXggOWMwMzZkNWY0Yy4uMjAzYTlkM2JiMiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Vm
aS9lZmktYm9vdC5oCisrKyBiL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaApAQCAtNTg1LDIx
ICs1ODUsMjcgQEAgc3RhdGljIHZvaWQgX19pbml0IGVmaV9hcmNoX21lbW9yeV9zZXR1cCh2b2lk
KQogICAgIGlmICggIWVmaV9lbmFibGVkKEVGSV9MT0FERVIpICkKICAgICAgICAgcmV0dXJuOwog
Ci0gICAgLyogSW5pdGlhbGlzZSBMMiBpZGVudGl0eS1tYXAgYW5kIGJvb3QtbWFwIHBhZ2UgdGFi
bGUgZW50cmllcyAoMTZNQikuICovCisgICAgLyogQ2hlY2sgdGhhdCB0aGVyZSBpcyBhdCBsZWFz
dCA0RyBvZiBtYXBwaW5nIHNwYWNlIGluIGwyXyptYXBbXSAqLworICAgIEJVSUxEX0JVR19PTigo
c2l6ZW9mKGwyX2Jvb3RtYXApICAvIEwyX1BBR0VUQUJMRV9FTlRSSUVTKSA8IDQpOworICAgIEJV
SUxEX0JVR19PTigoc2l6ZW9mKGwyX2lkZW50bWFwKSAvIEwyX1BBR0VUQUJMRV9FTlRSSUVTKSA8
IDQpOworCisgICAgLyogSW5pdGlhbGl6ZSBMMyBib290LW1hcCBwYWdlIGRpcmVjdG9yeSBlbnRy
aWVzLiAqLworICAgIGZvciAoIGkgPSAwOyBpIDwgNDsgKytpICkKKyAgICAgICAgbDNfYm9vdG1h
cFtpXSA9IGwzZV9mcm9tX3BhZGRyKChVSU5UTilsMl9ib290bWFwICsgaSAqIFBBR0VfU0laRSwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fUEFHRV9IWVBFUlZJU09S
KTsKKyAgICAvKgorICAgICAqIE1hcCBYZW4gaW50byB0aGUgZGlyZWN0bWFwIChuZWVkZWQgZm9y
IGVhcmx5LWJvb3QgcGFnZXRhYmxlCisgICAgICogaGFuZGxpbmcvd2Fsa2luZyksIGFuZCBpZGVu
dGl0eSBtYXAgWGVuIGludG8gYm9vdG1hcCAobmVlZGVkIGZvciB0aGUKKyAgICAgKiB0cmFuc2l0
aW9uIGZyb20gdGhlIEVGSSBwYWdldGFibGVzIHRvIFhlbiksIHVzaW5nIDJNIHN1cGVycGFnZXMu
CisgICAgICovCiAgICAgZm9yICggaSA9IDA7IGkgPCA4OyArK2kgKQogICAgIHsKICAgICAgICAg
dW5zaWduZWQgaW50IHNsb3QgPSAoeGVuX3BoeXNfc3RhcnQgPj4gTDJfUEFHRVRBQkxFX1NISUZU
KSArIGk7CiAgICAgICAgIHBhZGRyX3QgYWRkciA9IHNsb3QgPDwgTDJfUEFHRVRBQkxFX1NISUZU
OwogCiAgICAgICAgIGwyX2lkZW50bWFwW3Nsb3RdID0gbDJlX2Zyb21fcGFkZHIoYWRkciwgUEFH
RV9IWVBFUlZJU09SfF9QQUdFX1BTRSk7Ci0gICAgICAgIHNsb3QgJj0gTDJfUEFHRVRBQkxFX0VO
VFJJRVMgLSAxOwogICAgICAgICBsMl9ib290bWFwW3Nsb3RdID0gbDJlX2Zyb21fcGFkZHIoYWRk
ciwgX19QQUdFX0hZUEVSVklTT1J8X1BBR0VfUFNFKTsKICAgICB9Ci0gICAgLyogSW5pdGlhbGlz
ZSBMMyBib290LW1hcCBwYWdlIGRpcmVjdG9yeSBlbnRyaWVzLiAqLwotICAgIGwzX2Jvb3RtYXBb
bDNfdGFibGVfb2Zmc2V0KHhlbl9waHlzX3N0YXJ0KV0gPQotICAgICAgICBsM2VfZnJvbV9wYWRk
cigoVUlOVE4pbDJfYm9vdG1hcCwgX19QQUdFX0hZUEVSVklTT1IpOwotICAgIGwzX2Jvb3RtYXBb
bDNfdGFibGVfb2Zmc2V0KHhlbl9waHlzX3N0YXJ0ICsgKDggPDwgTDJfUEFHRVRBQkxFX1NISUZU
KSAtIDEpXSA9Ci0gICAgICAgIGwzZV9mcm9tX3BhZGRyKChVSU5UTilsMl9ib290bWFwLCBfX1BB
R0VfSFlQRVJWSVNPUik7CiB9CiAKIHN0YXRpYyB2b2lkIF9faW5pdCBlZmlfYXJjaF9oYW5kbGVf
bW9kdWxlKHN0cnVjdCBmaWxlICpmaWxlLCBjb25zdCBDSEFSMTYgKm5hbWUsCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwppbmRleCAx
MTFlZGI1MzYwLi43ZjgyZjY0MDc4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5T
CisrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKQEAgLTM4MSwzICszODEsNiBAQCBBU1NFUlQo
KHRyYW1wb2xpbmVfZW5kIC0gdHJhbXBvbGluZV9zdGFydCkgPCBUUkFNUE9MSU5FX1NQQUNFIC0g
TUJJX1NQQUNFX01JTiwKICAgICAibm90IGVub3VnaCByb29tIGZvciB0cmFtcG9saW5lIGFuZCBt
YmkgZGF0YSIpCiBBU1NFUlQoKHdha2V1cF9zdGFjayAtIHdha2V1cF9zdGFja19zdGFydCkgPj0g
V0FLRVVQX1NUQUNLX01JTiwKICAgICAid2FrZXVwIHN0YWNrIHRvbyBzbWFsbCIpCisKKy8qIFBs
ZW50eSBvZiBib290IGNvZGUgYXNzdW1lcyB0aGF0IFhlbiBpc24ndCBsYXJnZXIgdGhhbiAxNk0u
ICovCitBU1NFUlQoX2VuZCAtIF9zdGFydCA8PSBNQigxNiksICJYZW4gdG9vIGxhcmdlIGZvciBl
YXJseS1ib290IGFzc3VtcHRpb25zIikKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
