Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B15BCD07
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 18:44:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCntE-0007zJ-Qq; Tue, 24 Sep 2019 16:42:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=htKO=XT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iCntD-0007zE-4h
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 16:42:11 +0000
X-Inumbo-ID: 40813158-deea-11e9-9624-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 40813158-deea-11e9-9624-12813bfff9fa;
 Tue, 24 Sep 2019 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569343331;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jb82Q9JDsbg4kU7PxV0vKSaysa5TR46SpgsOIV6V4BU=;
 b=cgepXkOru4VJPt4+DTYbZp6V8ibEReFAOr7oKJp+ILJ9glMewuH5dbKK
 390FIemLSXzqSdojywnMXH1tlkR+xyL2i9hpNTOlznkQIUvaB5D04Kzl6
 iO3jwxRe7D9Lv49fpJFuDCCe58XjG5lVMiR0lErki+q5m+ZreN/hMfj2B 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3Owx2S+VRoYlxSkKwE+c1BtkvAhmZH5/24KavLlcLie5SVL19oIEC1WXwWcdZU1QuoJ8bn6bou
 dA6uNvfKYA0JaIxuxPpzDbALBQkXkYsyTgFvIdBw9nO/M9pIH96tLav6bDQ3Q5wQ7gxMdtaTmG
 thRi+PK9cNC4BGdqs2cH3B8KMdLZpMJD1W1L0J7ECPWf8adzVbdxMuRGbNVvKgl35vPgu19YSj
 CiY3jXk9M2Xws5q5ks20dNQlQbICJF/nQ2eE+coSk9G+qTJmyc6C7Uk7t9YVUphg7gjOs1uF7t
 XNc=
X-SBRS: 2.7
X-MesageID: 6006893
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,544,1559534400"; 
   d="scan'208";a="6006893"
Date: Tue, 24 Sep 2019 18:42:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <20190924164202.r6hhqlyrbvs5afud@Air-de-Roger>
References: <20190822065132.48200-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822065132.48200-1-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
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

UGluZz8KClNpbmNlIEkndmUgZ290IGFuIEFjayBmcm9tIEphbiBhbmQgSnVsaWVuIEkgdGhpbmsg
dGhlIG1pc3NpbmcgQWNrcyBhcmUKZm9yIHRoZSBJbnRlbCBzdHVmZiBhbmQgeDg2IGdlbmVyaWMg
YW5kIEFNRCBieSBBbmRyZXcsIHNpbmNlIEphbgpleHBsaWNpdGx5IGV4cHJlc3NlZCBoaXMgQWNr
IGlzIG9ubHkgZm9yIHBpZWNlcyB3aGVyZSBoZSBpcyB0aGUgb25seQptYWludGFpbmVyLgoKVGhh
bmtzLgoKT24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMDg6NTE6MzJBTSArMDIwMCwgUm9nZXIgUGF1
IE1vbm5lIHdyb3RlOgo+IFRoZSBuZXcgZm9ybWF0IHNwZWNpZmllciBpcyAnJXBwJywgYW5kIHBy
aW50cyBhIHBjaV9zYmRmX3QgdXNpbmcgdGhlCj4gc2VnOmJ1czpkZXYuZnVuYyBmb3JtYXQuIFJl
cGxhY2UgYWxsIFNCREZzIHByaW50ZWQgdXNpbmcKPiAnJTA0eDolMDJ4OiUwMnguJXUnIHRvIHVz
ZSB0aGUgbmV3IGZvcm1hdCBzcGVjaWZpZXIuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50
ZW5kZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
