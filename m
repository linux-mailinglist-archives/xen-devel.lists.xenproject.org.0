Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A6CD67F5
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 19:05:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK3iN-0007yy-R4; Mon, 14 Oct 2019 17:00:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fu8Z=YH=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iK3iM-0007ys-7u
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 17:00:58 +0000
X-Inumbo-ID: 307aeb54-eea4-11e9-9384-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 307aeb54-eea4-11e9-9384-12813bfff9fa;
 Mon, 14 Oct 2019 17:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571072457;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=g03uRE93emSbMMR8wUmq+C9PhGvzFHeocnDZDxQAmw0=;
 b=PmErso+aM2YJT2fnViM5wE6vCqnYm2hyX4MIQfFECTHlTpMsBTsF+Xda
 ieQ0rpWscxtEcffBEH/kq2c2Ccp53PFwBry3RQ/yDuLLMpw5rI29dYaDW
 g6q+bjQJ9jcay0NPKXVJEU46tS1q3coN/NIbziZIvI6xhYBI2RZZ+mVy4 M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
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
IronPort-SDR: +46qtGb3oqQ2zk6q2usQmYEQvcvIgMarlLR3NbfRRZKW+M4A/MYnXZogfgBHYIbg8HTCs4aE2m
 BjWMYlRfIk8pR6q8gYuv67PcSj05P0bzJsdrfGS9Hax0tROFfoeZuiJXjBuFpEglZErK/F3jkH
 wpXUWfms2EA9hNgaZwXfHo42dKn9eI6neAgUys7Ndoq8EvdSA8A9WhGUwoFkWwuExl1Cslp/fW
 CMYPrJEgfulcpCAHvEZfArfuJSOLz5tFF7KAhH1NrMRk1GEt9Efnnpf1sLQvxxpw4jhjzFp22O
 l8E=
X-SBRS: 2.7
X-MesageID: 6941454
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,296,1566878400"; 
   d="scan'208";a="6941454"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23972.43431.117479.182683@mariner.uk.xensource.com>
Date: Mon, 14 Oct 2019 18:00:23 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191014165026.GC5743@perard.uk.xensource.com>
References: <20191011165549.21639-1-ian.jackson@eu.citrix.com>
 <20191011165549.21639-2-ian.jackson@eu.citrix.com>
 <20191014165026.GC5743@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v3 05/10] libxl: Move
 shadow_memkb and iommu_memkb defaulting into libxl
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <pdurrant@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtYRU4gUEFUQ0ggZm9yLTQu
MTMgdjMgMDUvMTBdIGxpYnhsOiBNb3ZlIHNoYWRvd19tZW1rYiBhbmQgaW9tbXVfbWVta2IgZGVm
YXVsdGluZyBpbnRvIGxpYnhsIik6Cj4gU28gbWF5YmUgbGlieGxfX2RvbWFpbl9idWlsZF9pbmZv
X3NldGRlZmF1bHQoKSBzaG91bGQgYWxzbyBzZXQgYSB2YWx1ZQo+IHRvIGlvbW11X21lbWtiIGFz
IGl0IGRvZXMgZm9yIHNoYWRvd19tZW1rYj8gQXQgbGVhc3QsIHNldCBpb21tdV9tZW1rYj0wCj4g
aWYgc3RpbGwgdGhlIGRlZmF1bHQuCgpJIHRoaW5rLCB0aGlzLgoKSWFuLgoKRnJvbSAzNzlkOGVi
NjlmNzEzY2NjZjdlYWNiNGMyYTYzZjRmNWZlOTQ0MjU1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQpGcm9tOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KRGF0ZTogTW9u
LCAxNCBPY3QgMjAxOSAxNzo1OTowMCArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIHNxdWFzaCEgbGli
eGw6IE1vdmUgc2hhZG93X21lbWtiIGFuZCBpb21tdV9tZW1rYiBkZWZhdWx0aW5nCiBpbnRvIGxp
YnhsCgotLS0KdjQ6IFByb3ZpZGUgYSBmYWxsYmFjayBkZWZhdWx0IGZvciBpb21tdV9tZW1rYiB0
b28sIGZvciBvbGQgY2FsbGVycy4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyB8IDQg
KysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xz
L2xpYnhsL2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKaW5kZXgg
NzQyM2JlZGY3ZC4uYjM5NTFhMjQyMyAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3Jl
YXRlLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKQEAgLTIyOSw2ICsyMjksMTAg
QEAgaW50IGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2Ms
CiAgICAgbGlieGxfX2FyY2hfZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdChnYywgYl9pbmZv
KTsKICAgICBsaWJ4bF9kZWZib29sX3NldGRlZmF1bHQoJmJfaW5mby0+ZG1fcmVzdHJpY3QsIGZh
bHNlKTsKIAorICAgIGlmIChiX2luZm8tPmlvbW11X21lbWtiID09IExJQlhMX01FTUtCX0RFRkFV
TFQpCisgICAgICAgIC8qIE5vcm1hbGx5IGRlZmF1bHRlZCBpbiBsaWJ4bF9fZG9tYWluX2NyZWF0
ZV9pbmZvX3NldGRlZmF1bHQgKi8KKyAgICAgICAgYl9pbmZvLT5pb21tdV9tZW1rYiA9IDA7CisK
ICAgICBzd2l0Y2ggKGJfaW5mby0+dHlwZSkgewogICAgIGNhc2UgTElCWExfRE9NQUlOX1RZUEVf
SFZNOgogICAgICAgICBpZiAoYl9pbmZvLT5zaGFkb3dfbWVta2IgPT0gTElCWExfTUVNS0JfREVG
QVVMVCkKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
