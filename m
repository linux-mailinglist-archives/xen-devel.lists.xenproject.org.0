Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62E5D45FC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 18:59:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIyD1-0006Fo-RU; Fri, 11 Oct 2019 16:56:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fsnF=YE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIyD0-0006FW-6N
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 16:56:06 +0000
X-Inumbo-ID: fd303610-ec47-11e9-933c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd303610-ec47-11e9-933c-12813bfff9fa;
 Fri, 11 Oct 2019 16:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570812957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=waYjhRroYa0QPnh/Vu2P3ggmuK02wsRdLmxF7DjSGrE=;
 b=a7tCDkfu7fK5UeImYUp3ymewwuq/Fuv8YyytKDc4pV/JPyCQYQoyDBVr
 HAB/ZZSDu6d5FHoqxCs/tlYnMJ9ac0qqKQeUGlSmagnbM+vflpX4+EFR8
 ne+qdkynG4zNLbqvMGEu0ZAn4ozbCrnzFDhT+qc/bZTjj24srs2hcWypr k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SFa+NCJSnd212xWTMzRYzBjyQZ1kDcSHiyrXTL+wHRva9GXIl8dohSxIvP1skjY//Podsh7Ncm
 hNIGHGa9rwAD6B0NFQ5nRW2wkQqMl7AiyTz354zIVvBjojIpAosJ5y+qNCf777RnwNlO0+L6Vi
 tk05ln/ev0fHNsyySP7eoKOh6F2G8MmzHeA4B9ez/AN9Veg8bg+YiZG5tB3HMLt5af/SQyHWev
 7D54H+Nr/hc/bTlMSc+FsKZxQkzooz4+EKlTjhc4o8USui3T9LxuGuCwCdH0Jf5XQzV7nyXpPd
 hbc=
X-SBRS: 2.7
X-MesageID: 6858881
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,284,1566878400"; 
   d="scan'208";a="6858881"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 11 Oct 2019 17:55:44 +0100
Message-ID: <20191011165549.21639-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191011165549.21639-1-ian.jackson@eu.citrix.com>
References: <20191011165549.21639-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v3 05/10] libxl: Move shadow_memkb
 and iommu_memkb defaulting into libxl
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
Cc: Paul Durrant <pdurrant@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVmYXVsdGluZyBpcyBzdXBwb3NlZCB0byBiZSBkb25lIGJ5IGxpYnhsLiAgU28gdGhlc2UgY2Fs
Y3VsYXRpb25zCnNob3VsZCBiZSBoZXJlIGluIGxpYnhsLiAgbGlieGxfX2RvbWFpbl9jb25maWdf
c2V0ZGVmYXVsdCBoYXMgYWxsIHRoZQpuZWNlc3NhcnkgaW5mb3JtYXRpb24gaW5jbHVkaW5nIHRo
ZSB2YWx1ZXMgb2YgbWF4X21lbWtiIGFuZCBtYXhfdmNwdXMuCgpUaGUgb3ZlcmFsbCBmdW5jdGlv
bmFsIGVmZmVjdCBkZXBlbmRzIG9uIHRoZSBjYWxsZXI6CgpGb3IgeGwsIG5vIGNoYW5nZS4gIFRo
ZSBjb2RlIG1vdmVzIGZyb20geGwgdG8gbGlieGwuCgpGb3IgY2FsbGVycyB3aG8gc2V0IG9uZSBv
ciBib3RoIHNoYWRvd19tZW1rYiBhbmQgaW9tbXVfbWVta2IgKHdoZXRoZXIKZnJvbSBsaWJ4bF9n
ZXRfcmVxdWlyZWRfc2hhZG93X21lbW9yeSBvciBvdGhlcndpc2UpIGJlZm9yZSBjYWxsaW5nCmxp
YnhsX2RvbWFpbl9uZWVkX21lbW9yeSAoYW55IHZlcnNpb24pOiB0aGUgbmV3IGNvZGUgd2lsbCBs
ZWF2ZSB0aGVpcgpzZXR0aW5nKHMpIHVuY2hhbmdlZC4KCkZvciBjYWxsZXJzIHdobyBkbyBub3Qg
Y2FsbCBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkgYXQgYWxsLCBhbmQgd2hvCmZhaWwgdG8gc2V0
IG9uZSBvZiB0aGVzZSBtZW1vcnkgdmFsdWVzOiBub3cgdGhleSBhcmUgYm90aCBhcmUgcHJvcGVy
bHkKc2V0LiAgVGhlIHNoYWRvdyBhbmQgaW9tbXUgbWVtb3J5IHRvIGJlIHByb3Blcmx5IGFjY291
bnRlZCBmb3IgYXMKaW50ZW5kZWQuCgpGb3IgY2FsbGVycyB3aGljaCBjYWxsIGxpYnhsX2RvbWFp
bl9uZWVkX21lbW9yeSBhbmQgcmVxdWVzdCB0aGUKY3VycmVudCBBUEkgKDQuMTMpIG9yIHdoaWNo
IHRyYWNrIGxpYnhsLCB0aGUgZGVmYXVsdCB2YWx1ZXMgYXJlIGFsc28Kbm93IHJpZ2h0IGFuZCBl
dmVyeXRoaW5nIHdvcmtzIGFzIGludGVuZGVkLgoKRm9yIGNhbGxlcnMgd2hpY2ggY2FsbCBsaWJ4
bF9kb21haW5fbmVlZF9tZW1vcnksIGFuZCByZXF1ZXN0IGFuIG9sZApwcmUtNC4xMyBsaWJ4bCBB
UEksIGFuZCB3aGljaCBsZWF2ZSBvbmUgb2YgdGhlc2UgbWVta2Igc2V0dGluZ3MgdW5zZXQsCndl
IHRha2Ugc3BlY2lhbCBtZWFzdXJlcyB0byBwcmVzZXJ2ZSB0aGUgb2xkIGJlaGF2aW91ci4KClRo
aXMgbWVhbnMgdGhhdCB0aGV5IGRvbid0IGdldCB0aGUgYWRkaXRpb25hbCBpb21tdSBtZW1vcnkg
YW5kIGFyZSBhdApyaXNrIG9mIHRoZSBkb21haW4gcnVubmluZyBvdXQgb2YgbWVtb3J5IGFzIGEg
cmVzdWx0IG9mIGY4OWY1NTU4MjdhNgoicmVtb3ZlIGxhdGUgKG9uLWRlbWFuZCkgY29uc3RydWN0
aW9uIG9mIElPTU1VIHBhZ2UgdGFibGVzIi4gIEJ1dCB0aGlzCmlzIG5vIHdvcnNlIHRoYW4gdGhl
IHN0YXRlIGp1c3QgYWZ0ZXIgZjg5ZjU1NTgyN2E2LCB3aGljaCBhbHJlYWR5CmJyb2tlIHN1Y2gg
Y2FsbGVycyBpbiB0aGF0IHdheS4gIFRoaXMgaXMgcGVyaGFwcyBqdXN0aWZpYWJsZSBiZWNhdXNl
Cm9mIHRoZSBBUEkgc3RhYmlsaXR5IHdhcm5pbmcgbmV4dCB0byBsaWJ4bF9kb21haW5fbmVlZF9t
ZW1vcnkuCgpBbiBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBkcm9wIHRoZSBzcGVjaWFsLWNhc2lu
ZyBvZiB0aGVzZSBjYWxsZXJzLgpUaGF0IHdvdWxkIGNhdXNlIGEgZGlzY3JlcGFuY3kgYmV0d2Vl
biBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkgYW5kCmxpYnhsX2RvbWFpbl9jcmVhdGU6IHRoZSBm
b3JtZXIgd291bGQgbm90IGluY2x1ZGUgdGhlIGlvbW11IG1lbW9yeSBhbmQKdGhlIGxhdHRlciB3
b3VsZC4gIFRoYXQgc2VlbXMgd29yc2UsIGJ1dCBpdCdzIGRlYmF0ZWFibGUuCgpTaWduZWQtb2Zm
LWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCnYyOiBSZXBs
YWNlIF9Cb29sIHdpdGggYm9vbAogICAgRml4IGxvZ2ljIHNlbnNlIGluIG9rX3RvX2RlZmF1bHRf
bWVta2JfaW5fY3JlYXRlCi0tLQogdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgICB8IDQwICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHRvb2xzL2xpYnhsL2xpYnhs
X2ludGVybmFsLmggfCAgMyArKysKIHRvb2xzL2xpYnhsL2xpYnhsX21lbS5jICAgICAgfCAgNCAr
KysrCiB0b29scy94bC94bF9wYXJzZS5jICAgICAgICAgIHwgMTUgKystLS0tLS0tLS0tLS0tCiA0
IGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3Jl
YXRlLmMKaW5kZXggZmQ4YmIyMmJlOS4uYTFiMDBhOGFlZiAxMDA2NDQKLS0tIGEvdG9vbHMvbGli
eGwvbGlieGxfY3JlYXRlLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKQEAgLTI1
MCw2ICsyNTAsNyBAQCBpbnQgbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQobGli
eGxfX2djICpnYywKICAgICBzd2l0Y2ggKGJfaW5mby0+dHlwZSkgewogICAgIGNhc2UgTElCWExf
RE9NQUlOX1RZUEVfSFZNOgogICAgICAgICBpZiAoYl9pbmZvLT5zaGFkb3dfbWVta2IgPT0gTElC
WExfTUVNS0JfREVGQVVMVCkKKyAgICAgICAgICAgIC8qIE5vcm1hbGx5IGRlZmF1bHRlZCBpbiBs
aWJ4bF9fZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQgKi8KICAgICAgICAgICAgIGJfaW5m
by0+c2hhZG93X21lbWtiID0gMDsKICAgICAgICAgaWYgKGJfaW5mby0+dS5odm0ubW1pb19ob2xl
X21lbWtiID09IExJQlhMX01FTUtCX0RFRkFVTFQpCiAgICAgICAgICAgICBiX2luZm8tPnUuaHZt
Lm1taW9faG9sZV9tZW1rYiA9IDA7CkBAIC0zOTUsNiArMzk2LDcgQEAgaW50IGxpYnhsX19kb21h
aW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsCiAgICAgICAgIGlmIChiX2lu
Zm8tPnZpZGVvX21lbWtiID09IExJQlhMX01FTUtCX0RFRkFVTFQpCiAgICAgICAgICAgICBiX2lu
Zm8tPnZpZGVvX21lbWtiID0gMDsKICAgICAgICAgaWYgKGJfaW5mby0+c2hhZG93X21lbWtiID09
IExJQlhMX01FTUtCX0RFRkFVTFQpCisgICAgICAgICAgICAvKiBOb3JtYWxseSBkZWZhdWx0ZWQg
aW4gbGlieGxfX2RvbWFpbl9jcmVhdGVfaW5mb19zZXRkZWZhdWx0ICovCiAgICAgICAgICAgICBi
X2luZm8tPnNoYWRvd19tZW1rYiA9IDA7CiAgICAgICAgIGlmIChiX2luZm8tPnUucHYuc2xhY2tf
bWVta2IgPT0gTElCWExfTUVNS0JfREVGQVVMVCkKICAgICAgICAgICAgIGJfaW5mby0+dS5wdi5z
bGFja19tZW1rYiA9IDA7CkBAIC04NjIsNiArODY0LDMwIEBAIHN0YXRpYyB2b2lkIGRvbWNyZWF0
ZV9kZXN0cnVjdGlvbl9jYihsaWJ4bF9fZWdjICplZ2MsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbGlieGxfX2RvbWFpbl9kZXN0cm95X3N0YXRlICpkZHMsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHJjKTsKIAorc3RhdGljIGJvb2wgb2tf
dG9fZGVmYXVsdF9tZW1rYl9pbl9jcmVhdGUobGlieGxfX2djICpnYykKK3sKKyAgICAvKgorICAg
ICAqIFRoaXMgaXMgYSBmdWRnZS4gIFdlIGFyZSB0cnlpbmcgdG8gZmluZCB3aGV0aGVyIHRoZSBj
YWxsZXIKKyAgICAgKiBjYWxscyB0aGUgb2xkIHZlcnNpb24gb2YgbGlieGxfZG9tYWluX25lZWRf
bWVtb3J5LiAgSWYgdGhleSBkbworICAgICAqIHRoZW4sIGJlY2F1c2UgaXQgb25seSBnZXRzIHRo
ZSBiX2luZm8sIGFuZCBiZWNhdXNlIGl0IGNhbid0CisgICAgICogdXBkYXRlIHRoZSBiX2luZm8g
KGJlY2F1c2UgaXQncyBjb25zdCksIGl0IHdpbGwgYmFzZSBpdHMKKyAgICAgKiBjYWxjdWxhdGlv
bnMgb24gZGVmYXVsdGluZyBzaGFkb3dfbWVta2IgYW5kIGlvbW11X21lbWtiIHRvIDAKKyAgICAg
KiBJbiB0aGF0IGNhc2Ugd2UgcHJvYmFibHkgc2hvdWxkbid0IGRlZmF1bHQgdGhlbSBkaWZmZXJl
bnRseQorICAgICAqIGR1cmluZyBsaWJ4bF9kb21haW5fY3JlYXRlLgorICAgICAqCisgICAgICog
VGhlIHJlc3VsdCBpcyB0aGF0IHRoZSBiZWhhdmlvdXIgd2l0aCBvbGQgY2FsbGVycyBpcyB0aGUg
c2FtZQorICAgICAqIGFzIGluIDQuMTM6IG5vIGFkZGl0aW9uYWwgbWVtb3J5IGlzIGFsbG9jYXRl
ZCBmb3Igc2hhZG93IGFuZAorICAgICAqIGlvbW11ICh1bmxlc3MgdGhlIGNhbGxlciBzZXQgc2hh
ZG93X21lbWtiLCBlZyBmcm9tIGEgY2FsbCB0bworICAgICAqIGxpYnhsX2dldF9yZXF1aXJlZF9z
aGFkb3dfbWVtb3J5KS4KKyAgICAgKi8KKyAgICByZXR1cm4gIUNUWC0+bGlieGxfZG9tYWluX25l
ZWRfbWVtb3J5XzB4MDQxMjAwX2NhbGxlZCB8fAorICAgICAgICAgICAgQ1RYLT5saWJ4bF9kb21h
aW5fbmVlZF9tZW1vcnlfY2FsbGVkOworICAgIC8qCisgICAgICogVHJlYXQgbWl4ZWQgY2FsbGVy
cyBhcyBuZXcgY2FsbGVycy4gIFByZXN1bWFibHkgdGhleSBrbm93IHdoYXQKKyAgICAgKiB0aGV5
IGFyZSBkb2luZy4KKyAgICAgKi8KK30KKwogaW50IGxpYnhsX19kb21haW5fY29uZmlnX3NldGRl
ZmF1bHQobGlieGxfX2djICpnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxpYnhsX2RvbWFpbl9jb25maWcgKmRfY29uZmlnLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdWludDMyX3QgZG9taWQpCkBAIC05NzQsNiArMTAwMCwyMCBAQCBpbnQgbGli
eGxfX2RvbWFpbl9jb25maWdfc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLAogICAgICAgICBnb3Rv
IGVycm9yX291dDsKICAgICB9CiAKKyAgICBpZiAoZF9jb25maWctPmJfaW5mby5zaGFkb3dfbWVt
a2IgPT0gTElCWExfTUVNS0JfREVGQVVMVAorICAgICAgICAmJiBva190b19kZWZhdWx0X21lbWti
X2luX2NyZWF0ZShnYykpCisgICAgICAgIGRfY29uZmlnLT5iX2luZm8uc2hhZG93X21lbWtiID0K
KyAgICAgICAgICAgIGxpYnhsX2dldF9yZXF1aXJlZF9zaGFkb3dfbWVtb3J5KGRfY29uZmlnLT5i
X2luZm8ubWF4X21lbWtiLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZF9jb25maWctPmJfaW5mby5tYXhfdmNwdXMpOworCisgICAgLyogTm8gSU9NTVUgcmVz
ZXJ2YXRpb24gaXMgbmVlZGVkIGlmIHBhc3N0aHJvdWdoIG1vZGUgaXMgbm90ICdzeW5jX3B0JyAq
LworICAgIGlmIChkX2NvbmZpZy0+Yl9pbmZvLmlvbW11X21lbWtiID09IExJQlhMX01FTUtCX0RF
RkFVTFQKKyAgICAgICAgJiYgb2tfdG9fZGVmYXVsdF9tZW1rYl9pbl9jcmVhdGUoZ2MpKQorICAg
ICAgICBkX2NvbmZpZy0+Yl9pbmZvLmlvbW11X21lbWtiID0KKyAgICAgICAgICAgIChkX2NvbmZp
Zy0+Y19pbmZvLnBhc3N0aHJvdWdoID09IExJQlhMX1BBU1NUSFJPVUdIX1NZTkNfUFQpCisgICAg
ICAgICAgICA/IGxpYnhsX2dldF9yZXF1aXJlZF9pb21tdV9tZW1vcnkoZF9jb25maWctPmJfaW5m
by5tYXhfbWVta2IpCisgICAgICAgICAgICA6IDA7CisKICAgICByZXQgPSBsaWJ4bF9fZG9tYWlu
X2J1aWxkX2luZm9fc2V0ZGVmYXVsdChnYywgJmRfY29uZmlnLT5iX2luZm8pOwogICAgIGlmIChy
ZXQpIHsKICAgICAgICAgTE9HRChFUlJPUiwgZG9taWQsICJVbmFibGUgdG8gc2V0IGRvbWFpbiBi
dWlsZCBpbmZvIGRlZmF1bHRzIik7CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRl
cm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCAwMWRlNTU3NmQ5Li4w
MTg1YjhmZjAxIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBi
L3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTYzNyw2ICs2MzcsOSBAQCBzdHJ1Y3Qg
bGlieGxfX2N0eCB7CiAgICAgTElCWExfTElTVF9FTlRSWShsaWJ4bF9jdHgpIHNpZ2NobGRfdXNl
cnNfZW50cnk7CiAKICAgICBsaWJ4bF92ZXJzaW9uX2luZm8gdmVyc2lvbl9pbmZvOworCisgICAg
Ym9vbCBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnlfMHgwNDEyMDBfY2FsbGVkLAorICAgICAgICAg
bGlieGxfZG9tYWluX25lZWRfbWVtb3J5X2NhbGxlZDsKIH07CiAKIC8qCmRpZmYgLS1naXQgYS90
b29scy9saWJ4bC9saWJ4bF9tZW0uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX21lbS5jCmluZGV4IDYw
NDIyOTkzOTMuLjdjMDFmYWM3ZTUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX21lbS5j
CisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX21lbS5jCkBAIC00ODQsNiArNDg0LDggQEAgaW50IGxp
YnhsX2RvbWFpbl9uZWVkX21lbW9yeShsaWJ4bF9jdHggKmN0eCwKICAgICBHQ19JTklUKGN0eCk7
CiAgICAgaW50IHJjOwogCisgICAgY3R4LT5saWJ4bF9kb21haW5fbmVlZF9tZW1vcnlfY2FsbGVk
ID0gMTsKKwogICAgIHJjID0gbGlieGxfX2RvbWFpbl9jb25maWdfc2V0ZGVmYXVsdChnYywKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZF9jb25maWcsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRvbWlkX2Zvcl9sb2dnaW5nKTsKQEAg
LTUwNyw2ICs1MDksOCBAQCBpbnQgbGlieGxfZG9tYWluX25lZWRfbWVtb3J5XzB4MDQxMjAwKGxp
YnhsX2N0eCAqY3R4LAogICAgIEdDX0lOSVQoY3R4KTsKICAgICBpbnQgcmM7CiAKKyAgICBjdHgt
PmxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeV8weDA0MTIwMF9jYWxsZWQgPSAxOworCiAgICAgbGli
eGxfZG9tYWluX2J1aWxkX2luZm8gYl9pbmZvWzFdOwogICAgIGxpYnhsX2RvbWFpbl9idWlsZF9p
bmZvX2luaXQoYl9pbmZvKTsKICAgICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mb19jb3B5KGN0eCwg
Yl9pbmZvLCBiX2luZm9faW4pOwpkaWZmIC0tZ2l0IGEvdG9vbHMveGwveGxfcGFyc2UuYyBiL3Rv
b2xzL3hsL3hsX3BhcnNlLmMKaW5kZXggMDNhMmM1NGRkMi4uNzk4NzFjMjJkMCAxMDA2NDQKLS0t
IGEvdG9vbHMveGwveGxfcGFyc2UuYworKysgYi90b29scy94bC94bF9wYXJzZS5jCkBAIC0xNTcy
LDE5ICsxNTcyLDggQEAgdm9pZCBwYXJzZV9jb25maWdfZGF0YShjb25zdCBjaGFyICpjb25maWdf
c291cmNlLAogICAgICAgICBleGl0KC1FUlJPUl9GQUlMKTsKICAgICB9CiAKLSAgICAvKiBsaWJ4
bF9nZXRfcmVxdWlyZWRfc2hhZG93X21lbW9yeSgpIGFuZAotICAgICAqIGxpYnhsX2dldF9yZXF1
aXJlZF9pb21tdV9tZW1vcnkoKSBtdXN0IGJlIGNhbGxlZCBhZnRlciBmaW5hbCB2YWx1ZXMKLSAg
ICAgKiAoZGVmYXVsdCBvciBzcGVjaWZpZWQpIGZvciB2Y3B1cyBhbmQgbWVtb3J5IGFyZSBzZXQs
IGJlY2F1c2UgdGhlCi0gICAgICogY2FsY3VsYXRpb25zIGRlcGVuZCBvbiB0aG9zZSB2YWx1ZXMu
ICovCi0gICAgYl9pbmZvLT5zaGFkb3dfbWVta2IgPSAheGx1X2NmZ19nZXRfbG9uZyhjb25maWcs
ICJzaGFkb3dfbWVtb3J5IiwgJmwsIDApCi0gICAgICAgID8gbCAqIDEwMjQKLSAgICAgICAgOiBs
aWJ4bF9nZXRfcmVxdWlyZWRfc2hhZG93X21lbW9yeShiX2luZm8tPm1heF9tZW1rYiwKLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBiX2luZm8tPm1heF92Y3B1cyk7
Ci0KLSAgICAvKiBObyBJT01NVSByZXNlcnZhdGlvbiBpcyBuZWVkZWQgaWYgcGFzc3Rocm91Z2gg
bW9kZSBpcyBub3QgJ3N5bmNfcHQnICovCi0gICAgYl9pbmZvLT5pb21tdV9tZW1rYiA9IChjX2lu
Zm8tPnBhc3N0aHJvdWdoID09IExJQlhMX1BBU1NUSFJPVUdIX1NZTkNfUFQpCi0gICAgICAgID8g
bGlieGxfZ2V0X3JlcXVpcmVkX2lvbW11X21lbW9yeShiX2luZm8tPm1heF9tZW1rYikKLSAgICAg
ICAgOiAwOworICAgIGlmICgheGx1X2NmZ19nZXRfbG9uZyhjb25maWcsICJzaGFkb3dfbWVtb3J5
IiwgJmwsIDApKQorICAgICAgICBiX2luZm8tPnNoYWRvd19tZW1rYiA9IGwgKiAxMDI0OwogCiAg
ICAgeGx1X2NmZ19nZXRfZGVmYm9vbChjb25maWcsICJub21pZ3JhdGUiLCAmYl9pbmZvLT5kaXNh
YmxlX21pZ3JhdGUsIDApOwogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
