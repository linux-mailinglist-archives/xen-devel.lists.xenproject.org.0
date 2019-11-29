Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0623210D847
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 17:10:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaioK-0005ux-2D; Fri, 29 Nov 2019 16:08:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wlA=ZV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iaioI-0005us-TN
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 16:07:58 +0000
X-Inumbo-ID: 681bf17f-12c2-11ea-a3e7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 681bf17f-12c2-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 16:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575043677;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=xoXbdBgb7CdI1hvbeACDIvkb2xyZf/oZPjwyNc1DcoE=;
 b=FmLGv0GRnDlZLodv9PVX5iQIs1HKXNlLeDhfgksJnT88riTpssjiwafu
 AW4dircmigznD3Uo16/vFMB1GUBJ2+gQrTb6vXYEnE+uNh8qPAhstfnKf
 qsfgPBquz9ssWupWnQCd3LARTRUSFfhis74GHZ4eMeVPEZqor2jx4MhYs w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zunDeRmskAdqdi6PRNS/Opiep9LD3gfJ+QTPfO24hmJn3nXmbGXFb2oTAuGceX4J8oK25yz139
 OrugagZnc8g3D5XgU3swgLBqkcte2LIKSTq0tggWiRhxHt//wIo0V7dh4ZWcgn8ASpkR2s/A2l
 ohq9oLilPMC3+SN7Nv/qqbvSXzbajmwBDwHWtjAULrLymOJWAvk6z3OidsrKkFS6q9j7hKn1Eo
 oCqPnpAmVjn+XespQj/a4ZcW8R4sXj4RQrMpirPIscoFLyJCOZMpqSEBvATWW5Zgkm5rPBGapR
 fmU=
X-SBRS: 2.7
X-MesageID: 9541411
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9541411"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24033.16985.749977.747490@mariner.uk.xensource.com>
Date: Fri, 29 Nov 2019 16:07:53 +0000
To: "Durrant, Paul" <pdurrant@amazon.com>
In-Reply-To: <428ff7e73f654f5c89cd0837f69002dd@EX13D32EUC003.ant.amazon.com>
References: <20191128165224.2959-1-pdurrant@amazon.com>
 <20191129124427.l7wyupz5mcn7nx57@debian>
 <24033.15733.686597.694978@mariner.uk.xensource.com>
 <428ff7e73f654f5c89cd0837f69002dd@EX13D32EUC003.ant.amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH-for-4.13 v5] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVycmFudCwgUGF1bCB3cml0ZXMgKCJSRTogW1BBVENILWZvci00LjEzIHY1XSBSYXRpb25hbGl6
ZSBtYXhfZ3JhbnRfZnJhbWVzIGFuZCBtYXhfbWFwdHJhY2tfZnJhbWVzIGhhbmRsaW5nIik6Cj4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gRnJvbTogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGNpdHJpeC5jb20+Ci4uLgo+ID4gSXMgdGhlcmUgc29tZSByZWFzb24gd2Ugd291bGRu
J3QgdXNlIH4wIHRvIG1lYW4gZGVmYXVsdCA/Cj4gPiAKPiA+IEluIHRoZSB0b29scyBhcmVhIHdl
IG5vcm1hbGx5IHNwZWxsIHRoaXMgYXMKPiA+ICAgICAgfihzb21lIGFwcHJvcHJpYXRlIHR5cGUp
MAo+ID4gdG8gbWFrZSBzdXJlIGl0IGhhcyB0aGUgcmlnaHQgd2lkdGguICBCdXQgaWYgd2Uga25v
dyB0aGUgdHlwZSBhbmQgaXQKPiA+IGlzIG9mIGZpeGVkIGxlbmd0aCwgYXMgaGVyZSwgMHhmZmZm
ZmZmZnUgaXMgT0sgdG9vLgo+ID4gCj4gPiA+IFRoZSB0eXBlIGNoYW5nZSBoZXJlIG1ha2VzIG1l
IGZlZWwgYSBiaXQgdW5jb21mb3J0YWJsZSwgdGhvdWdoIGluCj4gPiA+IHByYWN0aWNlIGl0IG1h
eSBub3QgbWF0dGVyLiBJIGRvbid0IHNlZSBhbnlvbmUgd291bGQgc3BlY2lmeSBhIHZhbHVlCj4g
PiA+IHRoYXQgd291bGQgYmVjb21lIG5lZ2F0aXZlIHdoZW4gY2FzdCBmcm9tIHVpbnQzMiB0byBp
bnRlZ2VyLgo+ID4gCj4gPiBUaGUgcHJvYmxlbSB3aXRoIHRoZSB0eXBlIGNoYW5nZSBpcyB0aGF0
IGluIHByaW5jaXBsZSB3ZSBoYXZlIHRvIGF1ZGl0Cj4gPiBhbGwgdGhlIHBsYWNlcyB0aGUgdmFy
aWFibGVzIGFyZSB1c2VkLgo+IAo+IENhbiBhIHRvb2xzdGFjayBtYWludGFpbmVyIHBsZWFzZSBj
b21lIHVwIHdpdGggYSBjb25jcmV0ZSBzdWdnZXN0aW9uIGFzIHRvIHdoYXQgdGhlIHBhdGNoIHNo
b3VsZCBkbyB0aGVuPyBJdCdzIG5vdyBhdCB2NiBhbmQgdGltZSBpcyBzaG9ydC4KCkkgdGhpbmsg
b3VyIHByb3Bvc2FsIGlzIHRvIGRyb3AgdGhlIHR5cGUgY2hhbmdlLCBjb250aW51ZSB0byB1c2UK
dWludDMyX3QgZXZlcndoZXJlIGZvciB0aGVzZSB2YWx1ZXMsIGFuZCBzcGVjaWZ5IHRoZSAidXNl
IGRlZmF1bHQiCnZhbHVlIHRvIGJlIGFsbC1iaXRzLXNldC4KCklhbi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
