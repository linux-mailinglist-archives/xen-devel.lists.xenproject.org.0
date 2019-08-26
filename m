Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 226549CBDB
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2019 10:45:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2AaD-0006ZU-2H; Mon, 26 Aug 2019 08:42:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a7Cz=WW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i2AaB-0006ZP-BL
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2019 08:42:35 +0000
X-Inumbo-ID: 72d3f0f6-c7dd-11e9-8980-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72d3f0f6-c7dd-11e9-8980-bc764e2007e4;
 Mon, 26 Aug 2019 08:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566808954;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BTl313zughx92fzSxXTj1nyMlFfQvxSmhKPlvChvf08=;
 b=gNUQlOCQ6NEdw1GWW0fsCZ7aBndecTr5T3MtLdPtV1oz1buDV4rztoup
 skxH0Y9AmsSaXL5MuGAFURVjY7TZwTl2e157sUSG97jTDJ3fP5TBpfXqU
 x+arJYdDr2a+2aUO7MdlTEYTfPjPqMHW1at0L8Rky08II2l9TF8JNa7iD g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ydmkkIsjijF6VIiHQV4CuxTHJoGQf1+7S5nsVJExe/D2Z9We3FZr2FmbvW5w88364PBAAR3PHt
 DQtqz6YqXbsYPfKoRH6fRSYTFIDORdSwRS3uC05xAd34jcOyS+calDc7OnysklGkri0Xb8ry7Q
 5XhkpOVXSNmnNmwcmVMqvjavMlAwMGAXBDacDPPm5WNfAcuhgL69rfrBN171AOsEiFKoGx1ORU
 I8hSd3PWMrrEYigMvvo/z6nhtzZxeI7gAwd9aebDLb20uQ1fuqdp7m2095LAyJdxVJ1Bht+Tq0
 0VQ=
X-SBRS: 2.7
X-MesageID: 4919332
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,431,1559534400"; 
   d="scan'208";a="4919332"
Date: Mon, 26 Aug 2019 10:42:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <20190826084202.kaez5srd23j7o7na@Air-de-Roger>
References: <20190822065132.48200-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822065132.48200-1-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] print: introduce a format specifier for
 pci_sbdf_t
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMDg6NTE6MzJBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRoZSBuZXcgZm9ybWF0IHNwZWNpZmllciBpcyAnJXBwJywgYW5kIHByaW50cyBh
IHBjaV9zYmRmX3QgdXNpbmcgdGhlCj4gc2VnOmJ1czpkZXYuZnVuYyBmb3JtYXQuIFJlcGxhY2Ug
YWxsIFNCREZzIHByaW50ZWQgdXNpbmcKPiAnJTA0eDolMDJ4OiUwMnguJXUnIHRvIHVzZSB0aGUg
bmV3IGZvcm1hdCBzcGVjaWZpZXIuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+CgpUaGlzIHBhdGNoIGlzIG1pc3NpbmcgdGhlIGNodW5rIGJlbG93LCBJIHdvdWxkIGFwcHJl
Y2lhdGUgaWYgaXQgY2FuIGJlCm1lcmdlZCB3aGlsZSBjb21taXRpbmcgaWYgdGhlIHBhdGNoIGdl
dHMgdGhlIHJlbGV2YW50IEFja3MvUkJzLCBvcgplbHNlIEkgY2FuIHJlc2VuZCB3aXRoIHRoZSBj
aHVuayBhZGRlZC4KClRoYW5rcywgUm9nZXIuCi0tLTg8LS0tCmRpZmYgLS1naXQgYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYW1kL2lvbW11X2ludHIuYwppbmRleCA2ODdhN2ZhOTIyLi4xYzkwN2NmZjUyIDEwMDY0NAot
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jCisrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbnRyLmMKQEAgLTg5OCwxMCArODk4LDggQEAg
c3RhdGljIHZvaWQgZHVtcF9pbnRyZW1hcF90YWJsZShjb25zdCBzdHJ1Y3QgYW1kX2lvbW11ICpp
b21tdSwKIAogICAgICAgICBpZiAoIGl2cnNfbWFwcGluZyApCiAgICAgICAgIHsKLSAgICAgICAg
ICAgIHByaW50aygiICAlMDR4OiUwMng6JTAyeDoldTpcbiIsIGlvbW11LT5zZWcsCi0gICAgICAg
ICAgICAgICAgICAgUENJX0JVUyhpdnJzX21hcHBpbmctPmR0ZV9yZXF1ZXN0b3JfaWQpLAotICAg
ICAgICAgICAgICAgICAgIFBDSV9TTE9UKGl2cnNfbWFwcGluZy0+ZHRlX3JlcXVlc3Rvcl9pZCks
Ci0gICAgICAgICAgICAgICAgICAgUENJX0ZVTkMoaXZyc19tYXBwaW5nLT5kdGVfcmVxdWVzdG9y
X2lkKSk7CisgICAgICAgICAgICBwcmludGsoIiAgJXBwOlxuIiwKKyAgICAgICAgICAgICAgICAg
ICAmUENJX1NCREYyKGlvbW11LT5zZWcsIGl2cnNfbWFwcGluZy0+ZHRlX3JlcXVlc3Rvcl9pZCkp
OwogICAgICAgICAgICAgaXZyc19tYXBwaW5nID0gTlVMTDsKICAgICAgICAgfQogCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
