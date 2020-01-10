Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 724AC136E1B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 14:32:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipuLx-000272-Fv; Fri, 10 Jan 2020 13:29:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0O1r=27=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ipuLv-00025v-UT
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 13:29:27 +0000
X-Inumbo-ID: 2f09957e-33ad-11ea-a2eb-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f09957e-33ad-11ea-a2eb-bc764e2007e4;
 Fri, 10 Jan 2020 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578662950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=R+ahEkQ1I1GbKB9qZnY8vh7yoapgPhho9ac7tgVZHug=;
 b=GKB0YyhVYHARyY4x6cUmgXgqtd5MgFr7vZm1bHlHe+RE31tRtiZcu1Sd
 gSfktxSN55dxNSI3WNQZ0m5tDuZ9J0wnaVOk/lklTvCd0ShNF2izNJL3I
 6kcYOIUXl4u9wSpUIFlkxOKgzmPW0mF5TyeUldqQMasyz14fPGZjasIyE I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: k9saOMO7//+BGCMb86+oq7LEyP8HwhR0owqwqpg/rgeX7+TA8C2ubTbj3d7Lq72vk8OXllkhgj
 nhmmHvtmZYWmlYmc31ZQbm/AvQtQYhBTvvce7E1W+G9mqsHXlyeCSWs5gyZEEooCMgL1gSA3b8
 bz7/QduUX+mN1Ccgi+sSkJo9kcc5olQAsGp61i8LQwc4mZ+l1Los9AmPHP7lnxydAt1D2zAHnQ
 LLf5IJGdJPa6ebZSUZG2EBgaLp06gHsOW+Akl/jybOEI1Zv7ZcGrLir9lnvd/QpKOBSLOJqKOM
 Mhs=
X-SBRS: 2.7
X-MesageID: 11113830
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,417,1571716800"; d="scan'208";a="11113830"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 10 Jan 2020 13:29:00 +0000
Message-ID: <20200110132902.29295-7-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200110132902.29295-1-ian.jackson@eu.citrix.com>
References: <20200110132902.29295-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 6/8] libxl: event: Break out baton_wake
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9ldmVudC5jIHwgMjEg
KysrKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jIGIv
dG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYwppbmRleCAwNTU1OWNhZDlhLi40ZDU3ODQzY2NlIDEw
MDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xp
YnhsX2V2ZW50LmMKQEAgLTQyLDYgKzQyLDE4IEBAIHN0YXRpYyB2b2lkIHBvbGxlcnNfbm90ZV9v
c2V2ZW50X2FkZGVkKGxpYnhsX2N0eCAqY3R4KSB7CiAgICAgICAgIHBvbGxlci0+b3NldmVudHNf
YWRkZWQgPSAxOwogfQogCitzdGF0aWMgdm9pZCBiYXRvbl93YWtlKGxpYnhsX19lZ2MgKmVnYywg
bGlieGxfX3BvbGxlciAqd2FrZSkKK3sKKyAgICBsaWJ4bF9fcG9sbGVyX3dha2V1cChlZ2MsIHdh
a2UpOworCisgICAgd2FrZS0+b3NldmVudHNfYWRkZWQgPSAwOworICAgIC8qIFRoaXMgc2VydmVz
IHRvIG1ha2UgXzFfYmF0b24gaWRlbXBvdGVudC4gIEl0IGlzIE9LIGV2ZW4gdGhvdWdoCisgICAg
ICogdGhhdCBwb2xsZXIgbWF5IGN1cnJlbnRseSBiZSBzbGVlcGluZyBvbiBvbmx5IG9sZCBvc2V2
ZW50cywKKyAgICAgKiBiZWNhdXNlIGl0IGlzIGdvaW5nIHRvIHdha2UgdXAgYmVjYXVzZSB3ZSd2
ZSBqdXN0IHByb2RkZWQgaXQsCisgICAgICogYW5kIGl0IHBpY2sgdXAgbmV3IG9zZXZlbnRzIG9u
IGl0cyBuZXh0IGl0ZXJhdGlvbiAob3IgcGFzcworICAgICAqIG9uIHRoZSBiYXRvbikuICovCit9
CisKIHZvaWQgbGlieGxfX2VnY19jbGVhbnVwXzFfYmF0b24obGlieGxfX2VnYyAqZWdjKQogewog
ICAgIEVHQ19HQzsKQEAgLTYyLDE0ICs3NCw3IEBAIHZvaWQgbGlieGxfX2VnY19jbGVhbnVwXzFf
YmF0b24obGlieGxfX2VnYyAqZWdjKQogICAgICAgICAvKiBuby1vbmUgaW4gbGlieGwgd2FpdGlu
ZyBmb3IgYW55IGV2ZW50cyAqLwogICAgICAgICByZXR1cm47CiAKLSAgICBsaWJ4bF9fcG9sbGVy
X3dha2V1cChlZ2MsIHdha2UpOwotCi0gICAgd2FrZS0+b3NldmVudHNfYWRkZWQgPSAwOwotICAg
IC8qIFRoaXMgc2VydmVzIHRvIG1ha2UgXzFfYmF0b24gaWRlbXBvdGVudC4gIEl0IGlzIE9LIGV2
ZW4gdGhvdWdoCi0gICAgICogdGhhdCBwb2xsZXIgbWF5IGN1cnJlbnRseSBiZSBzbGVlcGluZyBv
biBvbmx5IG9sZCBvc2V2ZW50cywKLSAgICAgKiBiZWNhdXNlIGl0IGlzIGdvaW5nIHRvIHdha2Ug
dXAgYmVjYXVzZSB3ZSd2ZSBqdXN0IHByb2RkZWQgaXQsCi0gICAgICogYW5kIGl0IHBpY2sgdXAg
bmV3IG9zZXZlbnRzIG9uIGl0cyBuZXh0IGl0ZXJhdGlvbiAob3IgcGFzcwotICAgICAqIG9uIHRo
ZSBiYXRvbikuICovCisgICAgYmF0b25fd2FrZShlZ2MsIHdha2UpOwogfQogCiAvKgotLSAKMi4x
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
