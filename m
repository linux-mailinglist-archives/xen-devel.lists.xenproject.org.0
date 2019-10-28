Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D93C1E76E8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 17:44:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP85A-0000MA-UL; Mon, 28 Oct 2019 16:41:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datn=YV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iP859-0000M4-A5
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 16:41:27 +0000
X-Inumbo-ID: c85b9c68-f9a1-11e9-94fb-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c85b9c68-f9a1-11e9-94fb-12813bfff9fa;
 Mon, 28 Oct 2019 16:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572280886;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=5B3wYD5m0sLO5U30l4tHygvCTIYwVDLAqRLQpC8CrZI=;
 b=M1vdeSfWjcB1QDZ+kc7ptU60O5wzkw9rkWWyLpxWY3Q6M0JZ14PV91eX
 cmrFEUdeIEfsPt+9OcmZuaMu/C48Oti+yEhYTlh2h26oAQub9ymfve5Nl
 81uj0DeEmEGBEJqGnh5kD7lOgY58VSn/Zu6vf6wEIrm1xoh26KfsiLfXk M=;
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
IronPort-SDR: zdqpLNybJ9JgtBLakWFpuJbd9WzVX+ZbjJo6LsmT04GePvTa+TJ0D0Fq2OnXp630MRItAErAac
 fbywURYSnkDMkmU1l75Q4XHjPq8h487f2DEjombPUggMY9g1vjsNeDbd3997qg0WhttOZg3Q0j
 AUrTVJmCUg3T5iImFV6kEmnZmyOjSFIXBBz9dovdQz7zA5+ChtLkl9AHsN+cRo1IJ0SWnbmxzP
 ZWVCLNYpOUIYwOBPzdAooGHFx6stDw1pIvRMgexhzPSCZGjH+TEYjxHgc2jxEruZVPitpHDDHF
 zEY=
X-SBRS: 2.7
X-MesageID: 7611985
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7611985"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23991.6698.727798.707927@mariner.uk.xensource.com>
Date: Mon, 28 Oct 2019 16:41:14 +0000
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
In-Reply-To: <2491e384fae5399baf8639e07882f8ee687b6370.1572038720.git.m.a.young@durham.ac.uk>
References: <cover.1572038720.git.m.a.young@durham.ac.uk>
 <2491e384fae5399baf8639e07882f8ee687b6370.1572038720.git.m.a.young@durham.ac.uk>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH 2/3] read a grubenv file if it is next
 to the grub.cfg file
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

WU9VTkcsIE1JQ0hBRUwgQS4gd3JpdGVzICgiW1hFTiBQQVRDSCAyLzNdIHJlYWQgYSBncnViZW52
IGZpbGUgaWYgaXQgaXMgbmV4dCB0byB0aGUgZ3J1Yi5jZmcgZmlsZSIpOgo+IFdoZW4gYSBncnVi
LmNmZyBmaWxlIGlzIGZvdW5kIHRoaXMgcGF0Y2ggY2hlY2tzIGlmIHRoZXJlIGlzIGdydWJlbnYK
PiBmaWxlIGluIHRoZSBzYW1lIGRpcmVjdG9yeSBhcyB0aGUgZ3J1Yi5jZmcgZmlsZS4gSWYgdGhl
cmUgaXMgaXQKPiBwYXNzZXMgdGhlIGNvbnRlbnRzIHRvIHBhcnNlKCkuCgpJIGFtIGhhcHB5IHdp
dGggdGhlIHNlbWFudGljcyBvZiB0aGlzIHBhdGNoLiAgQnV0IEkgYW0gbm90IHJlYWxseQpoYXBw
eSB3aXRoIHRoZSBkdXBsaWNhdGlvbiBvZiB0aGUgY29kZSB0byBjYWxsIHNlbGYuY2YucGFyc2Us
IHNvIHRoYXQKaXQgaXMgbm93IHF1YWRyaXBsaWNhdGVkLgoKPiArICAgICAgICBpZiBmZW52ICE9
ICIiIGFuZCBmcy5maWxlX2V4aXN0cyhmZW52KToKPiArICAgICAgICAgICAgZmVudmYgPSBmcy5v
cGVuX2ZpbGUoZmVudikKPiArICAgICAgICAgICAgZ3J1YmVudiA9IGZlbnZmLnJlYWQoRlNfUkVB
RF9NQVgpCj4gKyAgICAgICAgICAgIGRlbCBmZW52Zgo+ICsgICAgICAgICAgICBpZiBzeXMudmVy
c2lvbl9pbmZvWzBdIDwgMzoKPiArICAgICAgICAgICAgICAgIHNlbGYuY2YucGFyc2UoYnVmLCBn
cnViZW52KQo+ICsgICAgICAgICAgICBlbHNlOgo+ICsgICAgICAgICAgICAgICAgc2VsZi5jZi5w
YXJzZShidWYuZGVjb2RlKCksIGdydWJlbnYuZGVjb2RlKCkpCj4gKyAgICAgICAgZWxzZToKPiAr
ICAgICAgICAgICAgaWYgc3lzLnZlcnNpb25faW5mb1swXSA8IDM6Cj4gKyAgICAgICAgICAgICAg
ICBzZWxmLmNmLnBhcnNlKGJ1ZikKPiArICAgICAgICAgICAgZWxzZToKPiArICAgICAgICAgICAg
ICAgIHNlbGYuY2YucGFyc2UoYnVmLmRlY29kZSgpKQoKQ2FuIHlvdSBwbGVhc2UgZG8gc29tZXRo
aW5nIGxpa2UKCiAgIGdydWJlbnYgPSBOb25lCiAgIGlmIGZlbnYgLi4uCiAgICAgICAuLi4KCiAg
IGlmIGdydWJlbnYgaXMgbm90IE5vbmUgYW5kIHN5cy52ZXJzaW9uX2luZm9bMF0gPCAzOgogICAg
ICAgZ3J1YmVudiA9IGdydWJlbnYuZGVjb2RlKCkKCmFuZCB0aGVuIHlvdSBjb3VsZCBhdCBsZWFz
dCBhdm9pZCBmdXJ0aGVyIG11bHRpcGxpY2F0aW9ucyBvZiB0aGUgY2FsbAp0byAucGFyc2UuLi4K
ClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
