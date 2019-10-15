Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C6ED7A75
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 17:51:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKP3d-0006tB-9Q; Tue, 15 Oct 2019 15:48:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JiiH=YI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iKP3b-0006sv-Uc
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 15:48:19 +0000
X-Inumbo-ID: 349911ec-ef63-11e9-9396-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 349911ec-ef63-11e9-9396-12813bfff9fa;
 Tue, 15 Oct 2019 15:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571154498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H8gUhXhoQG6sziWFvHtxOALsBaCB24aPXyaAu9NuhKM=;
 b=NilDiJGKXADuja3kSAnh+K+wn4Z0CpL63ZQOgHXFgmpAdSrKWiz2ixOv
 NiAKwHO+GgdNhTFQEjRwRELV6tVG3lKWWGTRugZb58rINH2Wr2EAV6sxk
 pLhKsYY9c7an9yChnzxlni1IhfFsrKxmPUJlu0j5ZnpFkmC87Ki+pPiAG A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iOVdaOWEO30ld/BGUP3GcdrScCIWfvyaZXUccTaYqrZ4yvoT2Rhi0eNjxvngYH5chpMzkQx09K
 6dWxNru401NJ0TnSTFaeyB1Y9vsQs8RxQEBiJ+ktNzvi3RQ943fenv+lHOD+Xk6TQc6wexUyYM
 QS54TAVwaXZZbQZqdlBbo5OrUGu6NVbC23G+uXhypiSGHAkUgrtTvEB/DPx2Zeiptqn83m1guC
 h4IJ/0sqgwyYJBi7znezfCvZZheJgVKb1AMcsGqRgtAKgEvWdrVfZIbkh364iAq/8AwsB1PQwV
 DK8=
X-SBRS: 2.7
X-MesageID: 6993382
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,300,1566878400"; 
   d="scan'208";a="6993382"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 15 Oct 2019 17:47:35 +0200
Message-ID: <20191015154736.19882-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015154736.19882-1-roger.pau@citrix.com>
References: <20191015154736.19882-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 3/4] x2APIC: translate IO-APIC entries when
 enabling the IOMMU
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBpbnRlcnJ1cHQgcmVtYXBwaW5nIGlzIGVuYWJsZWQgYXMgcGFydCBvZiBlbmFibGluZyB4
MkFQSUMgdGhlCklPLUFQSUMgZW50cmllcyBhbHNvIG5lZWQgdG8gYmUgdHJhbnNsYXRlZCB0byB0
aGUgbmV3IGZvcm1hdCBhbmQgYWRkZWQKdG8gdGhlIGludGVycnVwdCByZW1hcHBpbmcgdGFibGUu
CgpUaGlzIHByZXZlbnRzIElPTU1VIGludGVycnVwdCByZW1hcHBpbmcgZmF1bHRzIHdoZW4gYm9v
dGluZyBvbgpoYXJkd2FyZSB0aGF0IGhhcyB1bm1hc2tlZCBJTy1BUElDIHBpbnMuCgpSZXBvcnRl
ZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2MjoKIC0gSW50
cm9kdWNlIGludHJlbWFwX2VuYWJsZWQuCgpDaGFuZ2VzIHNpbmNlIHYxOgogLSBSZW1vdmUgdGhl
IHVubmVlZGVkIGlvbW11X2VuYWJsZWQgbG9jYWwgdmFyaWFibGUuCi0tLQogeGVuL2FyY2gveDg2
L2FwaWMuYyAgICAgICAgICAgfCAxMSArKysrKysrKysrLQogeGVuL2FyY2gveDg2L2lvX2FwaWMu
YyAgICAgICAgfCAgNSArKystLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9pb19hcGljLmggfCAgMyAr
Ky0KIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYXBpYy5jIGIveGVuL2FyY2gveDg2L2FwaWMuYwppbmRl
eCAwNjA3ZWI5MmE4Li5hNWY3YjA1ZDVhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYXBpYy5j
CisrKyBiL3hlbi9hcmNoL3g4Ni9hcGljLmMKQEAgLTg2MCw2ICs4NjAsNyBAQCB2b2lkIF9faW5p
dCB4MmFwaWNfYnNwX3NldHVwKHZvaWQpCiB7CiAgICAgc3RydWN0IElPX0FQSUNfcm91dGVfZW50
cnkgKippb2FwaWNfZW50cmllcyA9IE5VTEw7CiAgICAgY29uc3QgY2hhciAqb3JpZ19uYW1lOwor
ICAgIGJvb2wgaW50cmVtYXBfZW5hYmxlZDsKIAogICAgIGlmICggIWNwdV9oYXNfeDJhcGljICkK
ICAgICAgICAgcmV0dXJuOwpAQCAtOTAyLDExICs5MDMsMTMgQEAgdm9pZCBfX2luaXQgeDJhcGlj
X2JzcF9zZXR1cCh2b2lkKQogICAgIHN3aXRjaCAoIGlvbW11X2VuYWJsZV94MmFwaWMoKSApCiAg
ICAgewogICAgIGNhc2UgMDoKKyAgICAgICAgaW50cmVtYXBfZW5hYmxlZCA9IHRydWU7CiAgICAg
ICAgIGJyZWFrOwogICAgIGNhc2UgLUVOWElPOiAvKiBBQ1BJX0RNQVJfWDJBUElDX09QVF9PVVQg
c2V0ICovCiAgICAgICAgIGlmICggIXgyYXBpY19lbmFibGVkICkKICAgICAgICAgewogICAgICAg
ICAgICAgcHJpbnRrKCJOb3QgZW5hYmxpbmcgeDJBUElDICh1cG9uIGZpcm13YXJlIHJlcXVlc3Qp
XG4iKTsKKyAgICAgICAgICAgIGludHJlbWFwX2VuYWJsZWQgPSBmYWxzZTsKICAgICAgICAgICAg
IGdvdG8gcmVzdG9yZV9vdXQ7CiAgICAgICAgIH0KICAgICAgICAgLyogZmFsbCB0aHJvdWdoICov
CkBAIC05MTcsNiArOTIwLDcgQEAgdm9pZCBfX2luaXQgeDJhcGljX2JzcF9zZXR1cCh2b2lkKQog
CiAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSCiAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIGVu
YWJsZSBJbnRlcnJ1cHQgUmVtYXBwaW5nOiBXaWxsIG5vdCBlbmFibGUgeDJBUElDLlxuIik7Cisg
ICAgICAgIGludHJlbWFwX2VuYWJsZWQgPSBmYWxzZTsKICAgICAgICAgZ290byByZXN0b3JlX291
dDsKICAgICB9CiAKQEAgLTkzNCw3ICs5MzgsMTIgQEAgdm9pZCBfX2luaXQgeDJhcGljX2JzcF9z
ZXR1cCh2b2lkKQogICAgICAgICBwcmludGsoIlN3aXRjaGVkIHRvIEFQSUMgZHJpdmVyICVzXG4i
LCBnZW5hcGljLm5hbWUpOwogCiByZXN0b3JlX291dDoKLSAgICByZXN0b3JlX0lPX0FQSUNfc2V0
dXAoaW9hcGljX2VudHJpZXMpOworICAgIC8qCisgICAgICogTkI6IGRvIG5vdCB1c2UgcmF3IG1v
ZGUgd2hlbiByZXN0b3JpbmcgZW50cmllcyBpZiB0aGUgaW9tbXUgaGFzIGJlZW4KKyAgICAgKiBl
bmFibGVkIGR1cmluZyB0aGUgcHJvY2VzcywgYmVjYXVzZSB0aGUgZW50cmllcyBuZWVkIHRvIGJl
IHRyYW5zbGF0ZWQKKyAgICAgKiBhbmQgYWRkZWQgdG8gdGhlIHJlbWFwcGluZyB0YWJsZSBpbiB0
aGF0IGNhc2UuCisgICAgICovCisgICAgcmVzdG9yZV9JT19BUElDX3NldHVwKGlvYXBpY19lbnRy
aWVzLCAhaW50cmVtYXBfZW5hYmxlZCk7CiAgICAgdW5tYXNrXzgyNTlBKCk7CiAKIG91dDoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9pb19hcGljLmMgYi94ZW4vYXJjaC94ODYvaW9fYXBpYy5j
CmluZGV4IDVkMjU4NjJiZDguLjM3ZWFiYzE2YzkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9p
b19hcGljLmMKKysrIGIveGVuL2FyY2gveDg2L2lvX2FwaWMuYwpAQCAtMzc5LDcgKzM3OSw4IEBA
IHZvaWQgbWFza19JT19BUElDX3NldHVwKHN0cnVjdCBJT19BUElDX3JvdXRlX2VudHJ5ICoqaW9h
cGljX2VudHJpZXMpCiAvKgogICogUmVzdG9yZSBJTyBBUElDIGVudHJpZXMgd2hpY2ggd2FzIHNh
dmVkIGluIGlvYXBpY19lbnRyaWVzLgogICovCi1pbnQgcmVzdG9yZV9JT19BUElDX3NldHVwKHN0
cnVjdCBJT19BUElDX3JvdXRlX2VudHJ5ICoqaW9hcGljX2VudHJpZXMpCitpbnQgcmVzdG9yZV9J
T19BUElDX3NldHVwKHN0cnVjdCBJT19BUElDX3JvdXRlX2VudHJ5ICoqaW9hcGljX2VudHJpZXMs
CisgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcmF3KQogewogICAgIGludCBhcGljLCBw
aW47CiAKQEAgLTM5NCw3ICszOTUsNyBAQCBpbnQgcmVzdG9yZV9JT19BUElDX3NldHVwKHN0cnVj
dCBJT19BUElDX3JvdXRlX2VudHJ5ICoqaW9hcGljX2VudHJpZXMpCiAgICAgICAgICAgICByZXR1
cm4gLUVOT01FTTsKIAogICAgICAgICBmb3IgKHBpbiA9IDA7IHBpbiA8IG5yX2lvYXBpY19lbnRy
aWVzW2FwaWNdOyBwaW4rKykKLQkgICAgaW9hcGljX3dyaXRlX2VudHJ5KGFwaWMsIHBpbiwgMSwg
aW9hcGljX2VudHJpZXNbYXBpY11bcGluXSk7CisJICAgIGlvYXBpY193cml0ZV9lbnRyeShhcGlj
LCBwaW4sIHJhdywgaW9hcGljX2VudHJpZXNbYXBpY11bcGluXSk7CiAgICAgfQogCiAgICAgcmV0
dXJuIDA7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2lvX2FwaWMuaCBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvaW9fYXBpYy5oCmluZGV4IDBiMDQxZjA1NjUuLjk5ODkwNTE4NmIgMTAw
NjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaW9fYXBpYy5oCisrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvaW9fYXBpYy5oCkBAIC0xOTcsNyArMTk3LDggQEAgZXh0ZXJuIHN0cnVjdCBJT19B
UElDX3JvdXRlX2VudHJ5ICoqYWxsb2NfaW9hcGljX2VudHJpZXModm9pZCk7CiBleHRlcm4gdm9p
ZCBmcmVlX2lvYXBpY19lbnRyaWVzKHN0cnVjdCBJT19BUElDX3JvdXRlX2VudHJ5ICoqaW9hcGlj
X2VudHJpZXMpOwogZXh0ZXJuIGludCBzYXZlX0lPX0FQSUNfc2V0dXAoc3RydWN0IElPX0FQSUNf
cm91dGVfZW50cnkgKippb2FwaWNfZW50cmllcyk7CiBleHRlcm4gdm9pZCBtYXNrX0lPX0FQSUNf
c2V0dXAoc3RydWN0IElPX0FQSUNfcm91dGVfZW50cnkgKippb2FwaWNfZW50cmllcyk7Ci1leHRl
cm4gaW50IHJlc3RvcmVfSU9fQVBJQ19zZXR1cChzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9lbnRyeSAq
KmlvYXBpY19lbnRyaWVzKTsKK2V4dGVybiBpbnQgcmVzdG9yZV9JT19BUElDX3NldHVwKHN0cnVj
dCBJT19BUElDX3JvdXRlX2VudHJ5ICoqaW9hcGljX2VudHJpZXMsCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBib29sIHJhdyk7CiAKIHVuc2lnbmVkIGhpZ2hlc3RfZ3NpKHZvaWQp
OwogCi0tIAoyLjIzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
