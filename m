Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C611643746
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 16:39:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbQq5-0008Co-Qx; Thu, 13 Jun 2019 14:36:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbQq5-0008Cj-0n
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 14:36:29 +0000
X-Inumbo-ID: 9fac86cd-8de8-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9fac86cd-8de8-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 14:36:26 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 13 Jun 2019 08:36:25 -0600
Message-Id: <5D025F630200007800237F41@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 13 Jun 2019 08:36:19 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190607092232.83179-1-roger.pau@citrix.com>
 <20190607092232.83179-10-roger.pau@citrix.com>
In-Reply-To: <20190607092232.83179-10-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 09/13] pci: switch pci_conf_read32 to use
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
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA2LjE5IGF0IDExOjIyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEBAIC04MTcsNyArODExLDcgQEAgc3RhdGljIHU2NCByZWFkX3BjaV9tZW1fYmFyKHUxNiBzZWcs
IHU4IGJ1cywgdTggc2xvdCwgdTggZnVuYywgdTggYmlyLCBpbnQgdmYpCj4gICAgICAgICAgaWYg
KCArK2JpciA+PSBsaW1pdCApCj4gICAgICAgICAgICAgIHJldHVybiAwOwo+ICAgICAgICAgIHJl
dHVybiBhZGRyICsgZGlzcCArCj4gLSAgICAgICAgICAgICAgICgodTY0KXBjaV9jb25mX3JlYWQz
MihzZWcsIGJ1cywgc2xvdCwgZnVuYywKPiArICAgICAgICAgICAgICAgKCh1NjQpcGNpX2NvbmZf
cmVhZDMyKFBDSV9TQkRGKHNlZywgYnVzLCBzbG90LCBmdW5jKSwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJhc2UgKyBiaXIgKiA0KSA8PCAzMik7CgpOb3QgdGFraW5n
IHRoZSBvcHBvcnR1bml0eSB0byBzd2l0Y2ggdG8gdWludDY0X3QgaGVyZSwgbGlrZSB5b3UgZG8K
ZWxzZXdoZXJlPwoKPiBAQCAtNzUwLDcgKzc0Nyw3IEBAIGludCBwY2lfYWRkX2RldmljZSh1MTYg
c2VnLCB1OCBidXMsIHU4IGRldmZuLAo+ICAgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IFBD
SV9TUklPVl9OVU1fQkFSUzsgKQo+ICAgICAgICAgICAgICB7Cj4gICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgaWR4ID0gcG9zICsgUENJX1NSSU9WX0JBUiArIGkgKiA0Owo+IC0gICAgICAg
ICAgICAgICAgdTMyIGJhciA9IHBjaV9jb25mX3JlYWQzMihzZWcsIGJ1cywgc2xvdCwgZnVuYywg
aWR4KTsKPiArICAgICAgICAgICAgICAgIHUzMiBiYXIgPSBwY2lfY29uZl9yZWFkMzIocGRldi0+
c2JkZiwgaWR4KTsKClNpbWlsYXJseSBoZXJlLgoKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC92dGQvcXVpcmtzLmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvcXVp
cmtzLmMKPiBAQCAtMTI4LDkgKzEyOCwxMSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgbWFwX2lnZF9y
ZWcodm9pZCkKPiAgICAgIGlmICggaWdkX3JlZ192YSApCj4gICAgICAgICAgcmV0dXJuOwo+ICAK
PiAtICAgIGlnZF9tbWlvICAgPSBwY2lfY29uZl9yZWFkMzIoMCwgMCwgSUdEX0RFViwgMCwgUENJ
X0JBU0VfQUREUkVTU18xKTsKPiArICAgIGlnZF9tbWlvICAgPSBwY2lfY29uZl9yZWFkMzIoUENJ
X1NCREYoMCwgMCwgSUdEX0RFViwgMCksCgpBZmFpY3QgYXQgdGhpcyBwb2ludCBhbGwgdXNlcyBv
ZiBJR0RfREVWIGFyZSBpbiBjb25zdHJ1Y3RzIGxpa2UgdGhpcyBvbmUuCkFzIHByZXZpb3VzbHkg
c2F5LCBJIHRoaW5rIElHRF9ERVYgaXRzZWxmIHdvdWxkIG5vdyBiZXR0ZXIgYmVjb21lIGFuCmlu
dm9jYXRpb24gb2YgUENJX1NCREYoKS4gU2FtZSBmb3IgSU9IX0RFViB0aGVuLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
