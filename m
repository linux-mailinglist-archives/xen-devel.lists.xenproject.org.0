Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E69B68BD
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 19:12:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAdRL-00052l-LE; Wed, 18 Sep 2019 17:08:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bm4j=XN=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAdRK-00052Z-IN
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 17:08:26 +0000
X-Inumbo-ID: ecd8107e-da36-11e9-963e-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecd8107e-da36-11e9-963e-12813bfff9fa;
 Wed, 18 Sep 2019 17:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568826505;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=2rM9AYszJEhRryA4OHVZMJJApxPV9VsNR6WjH6b1KmQ=;
 b=GG0oAcoWdIYXXZ+3nxgxHIGXYlKXSF7u5Ls5sPb6s2Jq1T+LK3oBCAXQ
 JfrVVeI/f3YF2ro1A/GIwGNTOXAS4htAnLllCbKK9j11qKta1HDUjUJLS
 voj3HFCIQUIJEDUaZBwDmVcHCoRJk2IZ3DFTEeATDPQcgAOfHnrXcJooU E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: svD6HFnwLHg92zhaXU6KO0JNUzsuQR9d8Xq3eOxHLtWYLbKsEATP/OhwufqDPaiCxIftRsnVFh
 NP0Nd/dMPDr26nddpa5pMHBQpIPmUjNX2VAeRGWa1Cwid51I9A/jKPuMOwQS8MYydjcna10DbA
 G4vSRcin8Zi02fyR5GLri3my0DWouiOf80Hgr1rX7YD8K0AgRcUgJppWwhDmlmt2AaMwglgOPa
 8Ub1rXIr/X5XhJsNoXtjL11ZqZGSGA723ThOiLPZq7i4IjjW26LHdmorwV+mAY7ol+m5cswxeg
 JF0=
X-SBRS: 2.7
X-MesageID: 5740428
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,521,1559534400"; 
   d="scan'208";a="5740428"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23938.25733.874945.800934@mariner.uk.xensource.com>
Date: Wed, 18 Sep 2019 18:08:21 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-9-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-9-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 08/35] libxl: Replace
 libxl__qmp_initializations by ev_qmp calls
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDA4LzM1XSBsaWJ4bDogUmVwbGFjZSBsaWJ4
bF9fcW1wX2luaXRpYWxpemF0aW9ucyBieSBldl9xbXAgY2FsbHMiKToKPiBTZXR1cCBhIHRpbWVv
dXQgb2YgMTBzIGZvciBhbGwgdGhlIGNvbW1hbmRzLiBJdCB1c2VkIHRvIGJlIGFib3V0IDVzCj4g
cGVyIGNvbW1hbmRzLgo+IAo+IFRoZSBvcmRlciBvZiBjb21tYW5kIGlzIGNoYW5nZWQsIHdlIGNh
bGwgJ3F1ZXJ5LXZuYycgYmVmb3JlCj4gJ2NoYW5nZS12bmMtcGFzc3dvcmQnLCBidXQgdGhhdCBz
aG91bGQgbm90IG1hdHRlci4gVGhhdCBtYWtlcyBpdAo+IGVhc2llciB0byBjYWxsICdjaGFuZ2Ut
dm5jLXBhc3N3b3JkJyBjb25kaXRpb25hbGx5Lgo+IAo+IEFsc28gJ2NoYW5nZScgY29tbWFuZCBp
cyByZXBsYWNlZCBieSAnY2hhbmdlLXZuYy1wYXNzd29yZCcKPiBiZWNhdXNlICdjaGFuZ2UnIGlz
IGRlcHJlY2F0ZWQuIFRoZSBuZXcgY29tbWFuZCBpcyBhdmFpbGFibGUgaW4gYWxsCj4gUUVNVSB2
ZXJzaW9ucyB0aGF0IGFsc28gaGF2ZSBYZW4gc3VwcG9ydC4KClRoYW5rcy4gIEkgcmV2aWV3ZWQg
dGhpcyBhbmQgaW5kZWVkIHRoZXJlIGFyZSBzb21lIG90aGVyIHNpZ25pZmljYW50CmNoYW5nZXMs
IHBhcnRpY3VsYXJseSB0byBjb2Rpbmcgc3R5bGUuICBPdmVyYWxsIGl0IGlzIGFsbCBhbgppbXBy
b3ZlbWVudC4gIEF0IGxlYXN0LCBldmVyeXRoaW5nIHRoYXQgSSBzYXcgc2VlbWVkIGxpa2UgYW4K
aW1wcm92ZW1lbnQuLi4KCj4gKyAgICAgICAgLyogQ2hlY2sgaWYgdGhlICJsYWJlbCIgc3RhcnQg
d2l0aCAic2VyaWFsIi4gKi8KPiArICAgICAgICBpZiAoIWxhYmVsIHx8IHN0cm5jbXAobGFiZWws
IHNlcmlhbCwgc2VyaWFsbCkpCj4gKyAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsgICAgICAgIHBv
cnQgPSBzdHJ0b2wobGFiZWwgKyBzZXJpYWxsLCAmZW5kcHRyLCAxMCk7Cj4gKyAgICAgICAgaWYg
KCoobGFiZWwgKyBzZXJpYWxsKSA9PSAnXDAnIHx8ICplbmRwdHIgIT0gJ1wwJykgewo+ICsgICAg
ICAgICAgICBMT0dEKEVSUk9SLCBxbXAtPmRvbWlkLAo+ICsgICAgICAgICAgICAgICAgICJJbnZh
bGlkIHNlcmlhbCBwb3J0IG51bWJlcjogJXMiLCBsYWJlbCk7Cj4gKyAgICAgICAgICAgIHJjID0g
RVJST1JfUUVNVV9BUEk7Cj4gKyAgICAgICAgICAgIGdvdG8gb3V0OwoKVGhpcyBvcGVuLWNvZGVk
IHN0cmluZyBtYW5nbGluZyBpcyBxdWl0ZSBhd2t3YXJkIGJ1dCBJIGRvbid0IGhhdmUgYQpiZXR0
ZXIgc3VnZ2VzdGlvbiBhbmQgdGhpcyBraW5kIG9mIG9wZW4tY29kZWQgc3RydG91bCBjYWxsIHNl
ZW1zIHZlcnkKY29tbW9uIGFscmVhZHkuICAoQW5kIGl0IHdhcyB0aGVyZSBiZWZvcmUsIHRvby4p
CgpTbywgb3ZlcmFsbDoKCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbT4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
