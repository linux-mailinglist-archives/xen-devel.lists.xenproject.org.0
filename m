Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A17139734
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 18:11:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir3Ct-0008Dl-1J; Mon, 13 Jan 2020 17:08:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aHII=3C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ir3Cr-0008Df-4S
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 17:08:49 +0000
X-Inumbo-ID: 5cb7a0b6-3627-11ea-82b0-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cb7a0b6-3627-11ea-82b0-12813bfff9fa;
 Mon, 13 Jan 2020 17:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578935328;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=lLf35lJacfDCIEk41tvNt61B4xRqmkfjY/8riKTgEig=;
 b=FN6bdqHzztwJU6r8wVdXEraRylTWagvh0xlZr+8LKxc394gOMfDwySqQ
 pFI7be9f7kDLOasOp9QxQY9Slvk5vIeySKgzQjTyrpgnqb5f1WUSYfe5f
 7Nps5DudtrKx+jkkNDixsKmFX8U1u9SJ2+kfj+kiLawJZ4kqJk6CXuKwv 4=;
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
IronPort-SDR: UZu95OfGvKpF5cbY0vfyLH5VZWYmS/krJVaCTEu861cRdC0J0BVahCKZ5nBJlSuo0q+u57dYR4
 tDx+NotaZgnn6hqWTvzBSSYwWKHqwuvvIlJMxmi8fntqL3tyPcBrClUjMLGImDC+80ylitukXI
 1OP2mlZGTxxtAoL0qFC4ow8NgH+hXD2LEp42A/bS1ETf1/Ocn+D1+DE+LtbfM7nk/U+muM8HA/
 41p4jl7Bqy/vHdTJw86YTZ8VdannGoNQ+AykHjY9szCz+AfCwup4Ad7dUXsYXaOPCTeSjktK31
 nj8=
X-SBRS: 2.7
X-MesageID: 11009468
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,429,1571716800"; d="scan'208";a="11009468"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 13 Jan 2020 17:08:33 +0000
Message-ID: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 00/10] libxl: event: Fix hang for some
 applications
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG1lYXQgaGVyZSwgaW5jbHVkaW5nIGEgZGVzY3JpcHRpb24gb2YgdGhlIGJ1ZywgaXMgaW46
CiAgbGlieGw6IGV2ZW50OiBGaXggaGFuZyB3aGVuIG1peGluZyBibG9ja2luZyBhbmQgZXZlbnR5
IGNhbGxzCgpSZSB2MSBJIHdyb3RlOgogIEkgc3VnZ2VzdCB3ZSB0cnkgdG8gY29udmluY2Ugb3Vy
c2VsdmVzIG9mIGl0cyBjb3JyZWN0bmVzcwogIHZpYSBhIHNlY29uZCByb3VuZCBvZiBjb2RlIHJl
dmlldy4KCkkgcHV0IHRoaXMgaW50byBwcmFjdGljZSBieSB3cml0aW5nIGFuIGluZm9ybWFsIHBy
b29mIG9mIGNvcnJlY3RuZXNzLgpUaGlzIGZvdW5kIGEgYnVnLCB0aGUgZml4aW5nIG9mIHdoaWNo
IHdhcyBub3QgZW50aXJlbHkgdHJpdmlhbC4KCkdlb3JnZSB0ZWxscyBtZSBoZSB0ZXN0ZWQgdjEg
b2YgdGhpcyBzZXJpZXMuICBBcyB3aXRoIHYxLCBJIGhhdmUKY29tcGlsZWQgdGhpcyB2MiBidXQg
bm90IGV4ZWN1dGVkIGl0LgoKSWFuIEphY2tzb24gKDEwKToKICBsaWJ4bDogZXZlbnQ6IFJlbmFt
ZSBwb2xsZXIuZmRzX2NoYW5nZWQgdG8gLmZkc19kZXJlZ2lzdGVyZWQKICBsaWJ4bDogZXZlbnQ6
IFJlbmFtZSBjdHgucG9sbGVyc19mZF9jaGFuZ2VkIHRvIC5wb2xsZXJzX2FjdGl2ZQogIGxpYnhs
OiBldmVudDogSW50cm9kdWNlIENUWF9VTkxPQ0tfRUdDX0ZSRUUKICBsaWJ4bDogZXZlbnQ6IE1h
a2UgTElCWExfX0VWRU5UX0RJU0FTVEVSIHRha2UgYSBnYywgbm90IGFuIGVnYwogIGxpYnhsOiBl
dmVudDogTWFrZSBsaWJ4bF9fcG9sbGVyX3dha2V1cCB0YWtlIGEgZ2MsIG5vdCBhbiBlZ2MKICBs
aWJ4bDogZXZlbnQ6IEZpeCBoYW5nIHdoZW4gbWl4aW5nIGJsb2NraW5nIGFuZCBldmVudHkgY2Fs
bHMKICBsaWJ4bDogZXZlbnQ6IHBvbGxlciBwaXBlIG9wdGltaXNhdGlvbgogIGxpYnhsOiBldmVu
dDogQnJlYWsgb3V0IGJhdG9uX3dha2UKICBsaWJ4bDogZXZlbnQ6IEZpeCBwb3NzaWJsZSBoYW5n
IHdpdGggbGlieGxfb3NldmVudF9iZWZvcmVwb2xsCiAgbGlieGw6IGV2ZW50OiBNb3ZlIHBvbGxl
ciBwaXBlIGVtcHR5aW5nIHRvIHRoZSBlbmQgb2YgYWZ0ZXJwb2xsCgogdG9vbHMvbGlieGwvbGli
eGwuYyAgICAgICAgICB8ICAgNCArLQogdG9vbHMvbGlieGwvbGlieGxfYW91dGlscy5jICB8ICAg
MiArLQogdG9vbHMvbGlieGwvbGlieGxfZGlzay5jICAgICB8ICAgNCArLQogdG9vbHMvbGlieGwv
bGlieGxfZG9tYWluLmMgICB8ICAgMiArLQogdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYyAgICB8
IDI4NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCiB0b29scy9s
aWJ4bC9saWJ4bF9mb3JrLmMgICAgIHwgIDE3ICsrLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJu
YWwuaCB8ICA1NCArKysrKy0tLQogNyBmaWxlcyBjaGFuZ2VkLCAyOTAgaW5zZXJ0aW9ucygrKSwg
NzkgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
