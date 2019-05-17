Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A553D217D8
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 13:42:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRbCX-0002Nl-Cg; Fri, 17 May 2019 11:39:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7l41=TR=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hRbCV-0002Ng-Qr
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 11:38:59 +0000
X-Inumbo-ID: 5b9ff5d3-7898-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5b9ff5d3-7898-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 11:38:58 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=SoftFail smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: ResV7xIXD7RfrHupvbEollEBSgW2cg+x92eMGAhEVi76594RxfJLejpoDhjNfNMi1JUuy75CBt
 +3navPC4Av/O+85ef/QT1yjCtqw6WmxcECsxnrK6i0k2v7XKF/pzW8uyiJX8ewMbrpG4844AKv
 +z8GI+trDY1pqdai3XU5iTQ3vG1tRbR+xF7NVHWjA1zXXEWtIpNWSZFQVSh1LBqITYM75CoKz5
 Bg/oYDWuK3HuCPV9b2L4h94g7ZbBjqKxBjfjW016ot6Gd/a2ZegFci/r8DL47Zaqdmj7dhXRk7
 6Ms=
X-SBRS: 2.7
X-MesageID: 565170
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,479,1549947600"; 
   d="scan'208";a="565170"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 May 2019 12:38:43 +0100
Message-ID: <20190517113843.4598-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190515114015.25492-1-anthony.perard@citrix.com>
References: <20190515114015.25492-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] libxc: elf_kernel loader: Remove check for
 shstrtab
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyB3YXMgcHJvYmFibHkgdXNlZnVsIGFzIGEgc2FuaXR5IGNoZWNrIHdoZW4gdGhlICJfX3hl
bl9ndWVzdCIKc2VjdGlvbiB3ZXJlIG5vdCBsZWdhY3kuICBCdXQgbm93IEVMRiBub3RlcyBhcmUg
cHJlZmVyZWQgYW5kCiJzaG91bGQgbGl2ZSBpbiBhIFBUX05PVEUgc2VnbWVudCIgKGVsZm5vdGUu
aCkuCgpUaGlzIGNoZWNrIGlzIHVubmVjZXNzYXJ5IGFzIGVsZl94ZW5fcGFyc2UoKSBmcm9tIHhl
bi9jb21tb24vbGliZWxmCndpbGwgZG8gdGhlIHJpZ2h0IHRoaW5nIGFuZCBsb29rIGZvciBFTEZO
T1RFcyBpbiB0aGUgZGlmZmVyZW50IHBsYWNlcwppbiBvcmRlciBvZiBwcmVmZXJlbmNlLiBlbGZf
eGVuX3BhcnNlKCkgd2lsbCBzdGlsbCBiZSBhYmxlIHRvIGFsc28KbG9vayBmb3IgdGhlIGxlZ2Fj
eSAiX194ZW5fZ3Vlc3QiIHNlY3Rpb24gd2l0aG91dCB0aGUgY2hlY2sgaW4gbGlieGMuCgpUaGlz
IHBhdGNoIHdvdWxkIGFsbG93IHRvIHdyaXRlIGEgc2ltcGxlciBFTEYgaGVhZGVyIGZvciBhbiBP
Vk1GIGJsb2IKKHdoaWNoIGlzbid0IGFuIEVMRikgYW5kIGFsbG93IGl0IHRvIGJlIGxvYWRlZCBh
cyBhIFBWSCBrZXJuZWwuIFRoZQpoZWFkZXIgb25seSBuZWVkcyB0byBkZWNsYXJlIHR3byBwcm9n
cmFtIHNlZ21lbnRzOgotIG9uZSB0byB0ZWxsIGFuIEVMRiBsb2FkZXIgd2hlcmUgdG8gcHV0IHRo
ZSBibG9iLAotIG9uZSBmb3IgYSBYZW4gRUxGTk9URS4KClRoZSBFTEZOT1RFIGlzIHRvIGNvbXBs
eSB0byB0aGUgcHZoIGRlc2lnbiB3aGljaCB3YW50cyB0aGUKWEVOX0VMRk5PVEVfUEhZUzMyX0VO
VFJZIHRvIGRlY2xhcmUgYSBibG9iIGFzIGNvbXBhcHRpYmxlIHdpdGggdGhlIFBWSApib290IEFC
SS4KCk5vdGUgdGhhdCB3aXRob3V0IHRoZSBFTEZOT1RFLCBsaWJ4YyB3aWxsIGxvYWQgYW4gRUxG
IGJ1dCB3aXRoCnRoZSBwbGFpbiBFTEYgbG9hZGVyLCB3aGljaCBkb2Vzbid0IGNoZWNrIGZvciBz
aHN0cnRhYi4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPgotLS0KCk5vdGVzOgogICAgdjI6IFJld29yayBjb21taXQgbWVzc2FnZSwgZXhw
bGFpbiB3aHkgdGhlIGNoZWNrIGlzIHVubmVjZXNzYXJ5LgoKIHRvb2xzL2xpYnhjL3hjX2RvbV9l
bGZsb2FkZXIuYyB8IDkgLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19kb21fZWxmbG9hZGVyLmMgYi90b29scy9saWJ4
Yy94Y19kb21fZWxmbG9hZGVyLmMKaW5kZXggODJiNWYyZWU3OS4uYjMyN2RiMjE5ZCAxMDA2NDQK
LS0tIGEvdG9vbHMvbGlieGMveGNfZG9tX2VsZmxvYWRlci5jCisrKyBiL3Rvb2xzL2xpYnhjL3hj
X2RvbV9lbGZsb2FkZXIuYwpAQCAtMTY1LDE1ICsxNjUsNiBAQCBzdGF0aWMgZWxmX25lZ2Vycm5v
dmFsIHhjX2RvbV9wYXJzZV9lbGZfa2VybmVsKHN0cnVjdCB4Y19kb21faW1hZ2UgKmRvbSkKICAg
ICAgICAgcmV0dXJuIHJjOwogICAgIH0KIAotICAgIC8qIEZpbmQgdGhlIHNlY3Rpb24taGVhZGVy
IHN0cmluZ3MgdGFibGUuICovCi0gICAgaWYgKCBFTEZfUFRSVkFMX0lOVkFMSUQoZWxmLT5zZWNf
c3RydGFiKSApCi0gICAgewotICAgICAgICB4Y19kb21fcGFuaWMoZG9tLT54Y2gsIFhDX0lOVkFM
SURfS0VSTkVMLCAiJXM6IEVMRiBpbWFnZSIKLSAgICAgICAgICAgICAgICAgICAgICIgaGFzIG5v
IHNoc3RydGFiIiwgX19GVU5DVElPTl9fKTsKLSAgICAgICAgcmMgPSAtRUlOVkFMOwotICAgICAg
ICBnb3RvIG91dDsKLSAgICB9Ci0KICAgICAvKiBwYXJzZSBiaW5hcnkgYW5kIGdldCB4ZW4gbWV0
YSBpbmZvICovCiAgICAgZWxmX3BhcnNlX2JpbmFyeShlbGYpOwogICAgIGlmICggZWxmX3hlbl9w
YXJzZShlbGYsICZkb20tPnBhcm1zKSAhPSAwICkKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
