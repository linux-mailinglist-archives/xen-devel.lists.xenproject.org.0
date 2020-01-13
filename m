Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AAA13981B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 18:53:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir3r7-0004iO-EA; Mon, 13 Jan 2020 17:50:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A39C=3C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ir3r6-0004iI-BI
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 17:50:24 +0000
X-Inumbo-ID: 2c20f83e-362d-11ea-82bc-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c20f83e-362d-11ea-82bc-12813bfff9fa;
 Mon, 13 Jan 2020 17:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578937823;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=053CXNSV2FfOy/WeaLnsdNavBcMPp/OzJQwg9wr2Ah4=;
 b=fet1pjdsg/RCni3eiwql6fyrAjNEIvi9GPxjzOPBXfkK/fAMVK6TBoBa
 AMqVEwbh0UTnmOqbIbfK39Vu6/0ynlS5jg14IExrkBJ+0GIm154KbjXNV
 GbeGMtL/X0uE/7H4OYAk7Ms6eADrrFNBQ5r7QaVxuLbUqWH1RTEGDCNsg Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: m8v+HvZ2dYVDzHItGgMsysFarvjHpPD9B0Z89wiGVqf7OIvmVwfZwh9ZIkZ4qptMl/djDLkSaP
 z0pATqXU30NNkSHf6t3skxTPNhxwXsjG00ZWK46chFit24gw7McMZvvpO4VRExEgn95+1jOjJU
 6PICjsx7Rx7seRV3smYdzuNu1PILzLVG0nF3X8RR2VHjmj6S16flmhvd1hUdDWrVY5zww4Mtkn
 n1G3GXz6bzijvvHUYEFVgSE3DllcaKN8dwPWY6Li3ioH5yPsdLfsc7Z9/ZERg9FDq8oryLgrFN
 Or8=
X-SBRS: 2.7
X-MesageID: 11215603
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,429,1571716800"; d="scan'208";a="11215603"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 13 Jan 2020 17:50:15 +0000
Message-ID: <20200113175020.32730-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] x86: Remove 16M total-size restriction
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgdHVybnMgb3V0IHRoYXQgdGhlIG5vdGUgaW4gYy9zIGE4ZDI3YTU0Y2M5Y2MKCiAgRmluYWxs
eSwgbGVhdmUgYSBsaW5rZXIgYXNzZXJ0IGNvdmVyaW5nIHRoZSBmYWN0IHRoYXQgcGxlbnR5IG9m
IGNvZGUgYmxpbmRseQogIGFzc3VtZXMgdGhhdCBYZW4gaXMgbGVzcyB0aGF0IDE2TS4gIFRoaXMg
d2FudHMgZml4aW5nIGluIGR1ZSBjb3Vyc2UuCgp3YXMgZWFzaWVyIHRvIGFkZHJlc3MgdGhhbiBJ
IGhhZCBvcmlnaW5hbGx5IGFudGljaXBhdGVkLiAgVGhpcyBzZXJpZXMgZG9lcyBzby4KClRoZSBl
bmQgcmVzdWx0IGNhbiBiZSB0ZXN0ZWQgYnkgdHJ5aW5nIHRvIGJvb3Qgd2l0aDoKCiAgZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVwLmMKICBpbmRl
eCA3NTk4MjdhMTlhLi5mYTgzYTlhMjhmIDEwMDY0NAogIC0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1
cC5jCiAgKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKICBAQCAtNTIsNiArNTIsOCBAQAogICAj
aW5jbHVkZSA8YXNtL3NwZWNfY3RybC5oPgogICAjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+CgogICtz
dGF0aWMgdWludDhfdCBfX3VzZWQgYmlnX2RhdGFbTUIoMTYpXSA9IHsgNDIsIH07CiAgKwogICAv
KiBvcHRfbm9zbXA6IElmIHRydWUsIHNlY29uZGFyeSBwcm9jZXNzb3JzIGFyZSBpZ25vcmVkLiAq
LwogICBzdGF0aWMgYm9vbCBfX2luaXRkYXRhIG9wdF9ub3NtcDsKICAgYm9vbGVhbl9wYXJhbSgi
bm9zbXAiLCBvcHRfbm9zbXApOwoKQmVmb3JlIHRoaXMgc2VyaWVzLCBYZW4gd2lsbCB0cmlwbGUg
ZmF1bHQgaW4gb25lIG9mIHNldmVyYWwgcGxhY2VzIChmaXJzdCBhbmQKbW9zdCBvYnZpb3VzbHks
IF9faGlnaF9zdGFydCBvbiB0aGUgZmlyc3Qgc3RhY2sgYWNjZXNzLCBhcyBjcHUwX3N0YWNrW10g
aXMKdmVyeSBuZWFyIHRoZSBlbmQgb2YgWGVuJ3MgbGlua2VkIGltYWdlKS4KCkFuZHJldyBDb29w
ZXIgKDQpOgogIHg4Ni9ib290OiBSZW5hbWUgbD9faWRlbnRtYXAgdG8gbD9fZGlyZWN0bWFwCiAg
eDg2L3BhZ2U6IFJlbW92ZSBiaWZ1cmNhdGVkIFBBR0VfSFlQRVJWSVNPUiBjb25zdGFudAogIHg4
Ni9ib290OiBDcmVhdGUgdGhlIGwyX3hlbm1hcFtdIG1hcHBpbmdzIGR5bmFtaWNhbGx5CiAgeDg2
L2Jvb3Q6IFNpemUgdGhlIGJvb3QvZGlyZWN0bWFwIG1hcHBpbmdzIGR5bmFtaWNhbGx5CgogeGVu
L2FyY2gveDg2L2Jvb3QvaGVhZC5TICAgICAgICAgIHwgMzUgKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLQogeGVuL2FyY2gveDg2L2Jvb3QveDg2XzY0LlMgICAgICAgIHwgNDkgKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290
LmggICAgICAgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCiB4ZW4vYXJj
aC94ODYvc2V0dXAuYyAgICAgICAgICAgICAgfCAgNiArKy0tLQogeGVuL2FyY2gveDg2L3hlbi5s
ZHMuUyAgICAgICAgICAgIHwgIDYgKystLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvcGFnZS5oICAg
ICAgICB8ICAyICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L3g4Nl82NC9wYWdlLmggfCAgNyAtLS0t
LS0KIDcgZmlsZXMgY2hhbmdlZCwgOTAgaW5zZXJ0aW9ucygrKSwgNTggZGVsZXRpb25zKC0pCgot
LSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
