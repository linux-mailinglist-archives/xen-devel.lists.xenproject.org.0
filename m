Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B25AEA09
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:09:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7eu6-000863-Po; Tue, 10 Sep 2019 12:05:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7eu5-00085M-FM
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:05:49 +0000
X-Inumbo-ID: 535ee89c-d3c3-11e9-ac1c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 535ee89c-d3c3-11e9-ac1c-12813bfff9fa;
 Tue, 10 Sep 2019 12:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568117149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=rKnYMoKY7w/4NbliXgQsOoX+l5golCVhUfDZx7rVU7w=;
 b=MX3nfTvOE/cN0tXierN8kpbGcBBUwb/o4TrR12OGZSta2CgE5uw6IY7G
 h2SGWateBw9u+BHyMtApWNJtpc7skGcPsk19g/icLRGP8Cn73tmyJvrhn
 aGkh1Nl+eQdsH9TUKYDe1lDkRhN8QgVJnm097ILgFUBwZhxY3iskak+Ys I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5woO6jq4kaWw3sX4eOtb/CXWF//juZIbfcKS2UCRyFPifs7OEIu755JIJRecNMuVKxnGu2ABF3
 kBtMYWY57868WUBOHXh94uamgNAblnUGzqf+796jJsg90RuCYpgCSPwmta9qCrbIXJh6JsQrKY
 RoNYmeX2nOGupk40zVfPcQvD/H9wCZfE1epLe/UPuv30JDzqlyEZz2mxOQrz8aeEKYqDsF93PY
 /5RoCyMb8KM0YkS/RA5voyUOgsYG/ZEd56EfT3Qel++8FGV8WdGIrtHvJw/9Fqtj7/D0WG6MmD
 SCU=
X-SBRS: 2.7
X-MesageID: 5416615
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5416615"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Sep 2019 13:02:07 +0100
Message-ID: <20190910120207.10358-13-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 12/12] tools/ocaml: abi: Use formal
 conversion and check in more places
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNpZ25lZC1v
ZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xz
L29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jIHwgMTUgKysrKysrKysrLS0tLS0tCiB4ZW4v
aW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggICAgICAgICB8ICA0ICsrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9v
Y2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3Ry
bF9zdHVicy5jCmluZGV4IGM3NGMyYjQzYTAuLmY4NmVjYzdiN2UgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jCisrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMv
eGVuY3RybF9zdHVicy5jCkBAIC0xOTUsOCArMTk1LDEwIEBAIENBTUxwcmltIHZhbHVlIHN0dWJf
eGNfZG9tYWluX2NyZWF0ZSh2YWx1ZSB4Y2gsIHZhbHVlIGNvbmZpZykKIAogCWRvbWFpbl9oYW5k
bGVfb2ZfdXVpZF9zdHJpbmcoY2ZnLmhhbmRsZSwgU3RyaW5nX3ZhbChWQUxfSEFORExFKSk7CiAK
LQlmb3IgKCBsID0gVkFMX0ZMQUdTOyBsICE9IFZhbF9ub25lOyBsID0gRmllbGQobCwgMSkgKQot
CQljZmcuZmxhZ3MgfD0gMXUgPDwgSW50X3ZhbChGaWVsZChsLCAwKSk7CisJY2ZnLmZsYWdzID0g
b2NhbWxfbGlzdF90b19jX2JpdG1hcAorCQkvKiAhIGRvbWFpbl9jcmVhdGVfZmxhZyBDREZfIGxj
ICovCisJCS8qICEgWEVOX0RPTUNUTF9DREZfIFhFTl9ET01DVExfQ0RGX01BWCBtYXggKi8KKwkJ
KFZBTF9GTEFHUyk7CiAKIAlhcmNoX2RvbWNvbmZpZyA9IEZpZWxkKFZBTF9BUkNILCAwKTsKIAlz
d2l0Y2ggKCBUYWdfdmFsKFZBTF9BUkNIKSApCkBAIC0yMTEsOCArMjEzLDEwIEBAIENBTUxwcmlt
IHZhbHVlIHN0dWJfeGNfZG9tYWluX2NyZWF0ZSh2YWx1ZSB4Y2gsIHZhbHVlIGNvbmZpZykKICAg
ICAgICAgLyogTW5lbW9uaWNzIGZvciB0aGUgbmFtZWQgZmllbGRzIGluc2lkZSB4ZW5feDg2X2Fy
Y2hfZG9tYWluY29uZmlnICovCiAjZGVmaW5lIFZBTF9FTVVMX0ZMQUdTICAgICAgICAgIEZpZWxk
KGFyY2hfZG9tY29uZmlnLCAwKQogCi0JCWZvciAoIGwgPSBWQUxfRU1VTF9GTEFHUzsgbCAhPSBW
YWxfbm9uZTsgbCA9IEZpZWxkKGwsIDEpICkKLQkJCWNmZy5hcmNoLmVtdWxhdGlvbl9mbGFncyB8
PSAxdSA8PCBJbnRfdmFsKEZpZWxkKGwsIDApKTsKKwkJY2ZnLmFyY2guZW11bGF0aW9uX2ZsYWdz
ID0gb2NhbWxfbGlzdF90b19jX2JpdG1hcAorCQkJLyogISB4ODZfYXJjaF9lbXVsYXRpb25fZmxh
Z3MgWDg2X0VNVV8gbm9uZSAqLworCQkJLyogISBYRU5fWDg2X0VNVV8gWEVOX1g4Nl9FTVVfQUxM
IGFsbCAqLworCQkJKFZBTF9FTVVMX0ZMQUdTKTsKIAogI3VuZGVmIFZBTF9FTVVMX0ZMQUdTCiAK
QEAgLTM2OCw4ICszNzIsNyBAQCBzdGF0aWMgdmFsdWUgYWxsb2NfZG9tYWluaW5mbyh4Y19kb21h
aW5pbmZvX3QgKiBpbmZvKQogCSAqIGVtdWxhdGlvbl9mbGFnczogeDg2X2FyY2hfZW11bGF0aW9u
X2ZsYWdzIGxpc3Q7CiAJICovCiAJZW11bF9saXN0ID0gY19iaXRtYXBfdG9fb2NhbWxfbGlzdAot
CQkvKiAhIHg4Nl9hcmNoX2VtdWxhdGlvbl9mbGFncyBYODZfRU1VXyBub25lICovCi0JCS8qICEg
WEVOX1g4Nl9FTVVfIFhFTl9YODZfRU1VX0FMTCBhbGwgKi8KKwkJLyogISB4ODZfYXJjaF9lbXVs
YXRpb25fZmxhZ3MgKi8KIAkJKGluZm8tPmFyY2hfY29uZmlnLmVtdWxhdGlvbl9mbGFncyk7CiAK
IAkvKiB4ZW5feDg2X2FyY2hfZG9tYWluY29uZmlnICovCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS9wdWJsaWMvZG9tY3RsLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKaW5kZXggZmY5
MjY1Zjc2NS4uNzdmNTQ2Y2JiOCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0
bC5oCisrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaApAQCAtNjQsNiArNjQsMTAgQEAg
c3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIHsKICAvKiBJcyB0aGlzIGEgeGVuc3RvcmUg
ZG9tYWluPyAqLwogI2RlZmluZSBfWEVOX0RPTUNUTF9DREZfeHNfZG9tYWluICAgICA0CiAjZGVm
aW5lIFhFTl9ET01DVExfQ0RGX3hzX2RvbWFpbiAgICAgICgxVTw8X1hFTl9ET01DVExfQ0RGX3hz
X2RvbWFpbikKKworLyogTWF4IFhFTl9ET01DVExfQ0RGXyogY29uc3RhbnQuICBVc2VkIGZvciBB
QkkgY2hlY2tpbmcuICovCisjZGVmaW5lIFhFTl9ET01DVExfQ0RGX01BWCBYRU5fRE9NQ1RMX0NE
Rl94c19kb21haW4KKwogICAgIHVpbnQzMl90IGZsYWdzOwogCiAgICAgLyoKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
