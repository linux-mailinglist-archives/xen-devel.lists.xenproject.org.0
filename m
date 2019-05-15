Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 872DA1F05B
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 13:43:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQsGz-0004Sk-Rr; Wed, 15 May 2019 11:40:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FtK4=TP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hQsGy-0004SY-AW
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 11:40:36 +0000
X-Inumbo-ID: 40a9aa70-7706-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 40a9aa70-7706-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 11:40:35 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=SoftFail smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: ncXw90FgGqkDGu/2VA9OL0JeCSJC5S2AJH2ZdqKqhvUH3x19fOWIAys688HirFlAbUezoaUP5u
 jNMcu6rOJiwwA3tSi4VJp3t8GkAtcVv1YZOYDXz3RU23odCzfFuZb+VqYRpLGtSdhf/BXjQIGH
 sQoHtoru6F3HxIQZz/ObgGJ7E9DUGDeOkQmu7MLFUA8UwabLGFwJc/DhA8Iw3NPx5ewE3Bwln+
 jkpjNcbrszK8ax5SWFRqyrMpaLtlR8/VzK+6teeoS29iRqc9qsscxaq0H9F2mJ6qxaqw8MiwOT
 VK4=
X-SBRS: 2.7
X-MesageID: 463370
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="463370"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 15 May 2019 12:40:15 +0100
Message-ID: <20190515114015.25492-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] libxc: elf_kernel loader: Remove check for
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyB3YXMgcHJvYmFibHkgdXNlZnVsIHRvIGxvYWQgRUxGIE5vdGUsIGJ1dCBub3cgRUxGIG5v
dGVzCiJzaG91bGQgbGl2ZSBpbiBhIFBUX05PVEUgc2VnbWVudCIgKGVsZm5vdGUuaCkuCgpXaXRo
IG5vdGVzIGxpdmluZyBpbiBzZWdtZW50LCB0aGVyZSBhcmUgbm8gbmVlZCBmb3Igc2VjdGlvbnMs
IHNvIHRoZXJlCmlzIG5vdGhpbmcgdG8gYmUgc3RvcmVkIGluIHRoZSBzaHN0cnRhYi4KClRoaXMg
cGF0Y2ggd291bGQgYWxsb3cgdG8gd3JpdGUgYSBzaW1wbGVyIEVMRiBoZWFkZXIgZm9yIGFuIE9W
TUYgYmxvYgood2hpY2ggaXNuJ3QgYW4gRUxGKSBhbmQgYWxsb3cgaXQgdG8gYmUgbG9hZGVkIGFz
IGEgUFZIIGtlcm5lbC4gVGhlCmhlYWRlciBvbmx5IG5lZWRzIHRvIGRlY2xhcmUgdHdvIHByb2dy
YW0gc2VnbWVudHM6Ci0gb25lIHRvIHRlbGwgYW4gRUxGIGxvYWRlciB3aGVyZSB0byBwdXQgdGhl
IGJsb2IsCi0gb25lIGZvciBhIFhlbiBFTEZOT1RFLgoKVGhlIEVMRk5PVEUgaXMgdG8gY29tcGx5
IHRvIHRoZSBwdmggZGVzaWduIHdoaWNoIHdhbnRzIHRoZQpYRU5fRUxGTk9URV9QSFlTMzJfRU5U
UlkgdG8gZGVjbGFyZSBhIGJsb2IgYXMgY29tcGFwdGlibGUgd2l0aCB0aGUgUFZICmJvb3QgQUJJ
LgoKTm90ZSB0aGF0IHdpdGhvdXQgdGhlIEVMRk5PVEUsIGxpYnhjIHdpbGwgbG9hZCBhbiBFTEYg
YnV0IHdpdGgKdGhlIHBsYWluIEVMRiBsb2FkZXIsIHdoaWNoIGRvZXNuJ3QgY2hlY2sgZm9yIHNo
c3RydGFiLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGMveGNfZG9tX2VsZmxvYWRlci5jIHwgOSAtLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhjL3hjX2RvbV9lbGZsb2FkZXIuYyBiL3Rvb2xzL2xpYnhjL3hjX2RvbV9lbGZsb2FkZXIuYwpp
bmRleCA4MmI1ZjJlZTc5Li5iMzI3ZGIyMTlkIDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19k
b21fZWxmbG9hZGVyLmMKKysrIGIvdG9vbHMvbGlieGMveGNfZG9tX2VsZmxvYWRlci5jCkBAIC0x
NjUsMTUgKzE2NSw2IEBAIHN0YXRpYyBlbGZfbmVnZXJybm92YWwgeGNfZG9tX3BhcnNlX2VsZl9r
ZXJuZWwoc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQogICAgICAgICByZXR1cm4gcmM7CiAgICAg
fQogCi0gICAgLyogRmluZCB0aGUgc2VjdGlvbi1oZWFkZXIgc3RyaW5ncyB0YWJsZS4gKi8KLSAg
ICBpZiAoIEVMRl9QVFJWQUxfSU5WQUxJRChlbGYtPnNlY19zdHJ0YWIpICkKLSAgICB7Ci0gICAg
ICAgIHhjX2RvbV9wYW5pYyhkb20tPnhjaCwgWENfSU5WQUxJRF9LRVJORUwsICIlczogRUxGIGlt
YWdlIgotICAgICAgICAgICAgICAgICAgICAgIiBoYXMgbm8gc2hzdHJ0YWIiLCBfX0ZVTkNUSU9O
X18pOwotICAgICAgICByYyA9IC1FSU5WQUw7Ci0gICAgICAgIGdvdG8gb3V0OwotICAgIH0KLQog
ICAgIC8qIHBhcnNlIGJpbmFyeSBhbmQgZ2V0IHhlbiBtZXRhIGluZm8gKi8KICAgICBlbGZfcGFy
c2VfYmluYXJ5KGVsZik7CiAgICAgaWYgKCBlbGZfeGVuX3BhcnNlKGVsZiwgJmRvbS0+cGFybXMp
ICE9IDAgKQotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
