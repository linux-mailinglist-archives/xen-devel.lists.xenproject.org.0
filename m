Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3695AE9F8
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:07:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7erf-0007H4-Uj; Tue, 10 Sep 2019 12:03:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7ere-0007Gu-4M
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:03:18 +0000
X-Inumbo-ID: f90939b0-d3c2-11e9-ac1c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f90939b0-d3c2-11e9-ac1c-12813bfff9fa;
 Tue, 10 Sep 2019 12:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568116997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=brCSTwUkoGhVIkFqYux1Raelk3CM0eMyTZfT+OnsnSA=;
 b=Xhl5kWrWqN2H5XpZusdfCf+v1ozxuMyDEZcR13jOg0PlOsUatl8Tj9Gk
 uEeODUR+bWBHMVER4gv749W5777Rz7gYCvKuS/pb7BoByJBc/2YkiBq88
 C8PLZqrORFigzkhQp/ZuBhObWtL0OWEPp7cUyDAr9zL3aV30DOyTR/9/C g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xWdLzGSdW2Z543kJdaVauR2R1zOUKcoT1zLg0iX2DL5yUF0FmH7nEcc4tXBcfiXMRz3YR6t7dU
 isILW4WWy5j3qAZTQq1QybMGkd9HFYyw59SK/WUuMe2rQjLUGM/WOe4c8pKQOZLwdrZXEYoQy3
 thjkupTPAVC0r1kXNgtZhB1gKgzNCrJ6vQAdxcjyWo2JAT8Ee5Mmnhr4Kxdpuj7y/c2I5YksGe
 aEMfNkvRPz1wzjYBH1IP32+OsUCIn5rPWGUsYr8xoQquIlsg+wt/4Z66lwfS8MiaJFzivFzv5Y
 /NE=
X-SBRS: 2.7
X-MesageID: 5555844
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5555844"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Sep 2019 13:01:57 +0100
Message-ID: <20190910120207.10358-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 02/12] tools/ocaml: Add missing CAP_PV
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCmMvcyBmMDg5
ZmRkZDk0MSBicm9rZSB0aGUgT2NhbWwgQUJJIGJ5IHJlbnVtZXJpbmcgWEVOX1NZU0NUTF9QSFlT
Q0FQX2RpcmVjdGlvCndpdGhvdXQgYWRqdXN0aW5nIHRoZSBPY2FtbCBwaHlzaW5mb19jYXBfZmxh
ZyBlbnVtZXJhdGlvbi4gIEZpeCB0aGlzIGJ5Cmluc2VydGluZyBDQVBfUFYgYmV0d2VlbiBDQVBf
SFZNIGFuZCBDQVBfRGlyZWN0SU8uCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwg
IHwgMSArCiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpIHwgNSArKysrLQogMiBmaWxl
cyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90
b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0
cmwubWwKaW5kZXggMzA1NjI1Y2I2Yy4uMDk3ZjM5ZDVjZSAxMDA2NDQKLS0tIGEvdG9vbHMvb2Nh
bWwvbGlicy94Yy94ZW5jdHJsLm1sCisrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5t
bApAQCAtMTAwLDYgKzEwMCw3IEBAIHR5cGUgc2NoZWRfY29udHJvbCA9CiAKIHR5cGUgcGh5c2lu
Zm9fY2FwX2ZsYWcgPQogCXwgQ0FQX0hWTQorCXwgQ0FQX1BWCiAJfCBDQVBfRGlyZWN0SU8KIAog
dHlwZSBwaHlzaW5mbyA9CmRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwu
bWxpIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saQppbmRleCBkYTkzMTYwZWQzLi45
NTdjOWZkYzJlIDEwMDY0NAotLS0gYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpCisr
KyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkKQEAgLTgzLDcgKzgzLDEwIEBAIHR5
cGUgZG9tYWluaW5mbyA9IHsKICAgYXJjaF9jb25maWcgOiBhcmNoX2RvbWFpbmNvbmZpZzsKIH0K
IHR5cGUgc2NoZWRfY29udHJvbCA9IHsgd2VpZ2h0IDogaW50OyBjYXAgOiBpbnQ7IH0KLXR5cGUg
cGh5c2luZm9fY2FwX2ZsYWcgPSBDQVBfSFZNIHwgQ0FQX0RpcmVjdElPCit0eXBlIHBoeXNpbmZv
X2NhcF9mbGFnID0KKyAgfCBDQVBfSFZNCisgIHwgQ0FQX1BWCisgIHwgQ0FQX0RpcmVjdElPCiB0
eXBlIHBoeXNpbmZvID0gewogICB0aHJlYWRzX3Blcl9jb3JlIDogaW50OwogICBjb3Jlc19wZXJf
c29ja2V0IDogaW50OwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
