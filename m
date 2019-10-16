Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB64D8DC7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 12:22:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKgON-0007OV-CB; Wed, 16 Oct 2019 10:18:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lClj=YJ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iKgOL-0007OK-SK
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 10:18:53 +0000
X-Inumbo-ID: 59cc326f-effe-11e9-93ad-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59cc326f-effe-11e9-93ad-12813bfff9fa;
 Wed, 16 Oct 2019 10:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571221133;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=4SawiJxcNnwh8VD+izDvU1BikvuR+bL8L9YzoQSizBI=;
 b=Pi8QRswUS3QgVomBJlfcoApM9ktNJt6hMvjogketTP5UyD7PLpMxZs6n
 SnSxFfLf1HuwsBNvi+wzetu+LyhX74BbMsJeC0V0q+YnmUP46NtDhcLX3
 ocd+HGrfYuHcyoisGJqMg6ILCoRc3+MO4RPYarbOxHJXo019AaChRgeDV k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vqRQ//SQ0jbRBquWFCDBV2x5Ncy5LBd0NHYlx2zhkj5WrWp/bLr+M1+DCbZxBjBaD++AODxFT5
 H6xm7anI4GEVAhBu46PpRmggrKF7ve6gMCwd+GP3EYyKKC0UmwNUfylKg+NasQ5Cz6JcVAYuZa
 VDypmK/cd/5gF40naS3WO/vGsTTyybR/PTFfRl6n6bw2iG86gPzbtNOP+Uk3ZhmucnSBjFNyos
 1LCJgEUn6rIooO4/3UkkecOYKzrJhrV2eMPex3xVMuDHRnJutIc/xX+AWp3aHv/eZRDWAOqHav
 K+s=
X-SBRS: 2.7
X-MesageID: 6948104
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,303,1566878400"; 
   d="scan'208";a="6948104"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23974.61064.928585.36020@mariner.uk.xensource.com>
Date: Wed, 16 Oct 2019 11:18:48 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.21.1910152124170.30080@sstabellini-ThinkPad-T480s>
References: <20191015181802.21957-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910151221270.30080@sstabellini-ThinkPad-T480s>
 <bfb3ac7c-19bc-90f0-381b-32a1491a967c@arm.com>
 <alpine.DEB.2.21.1910151249160.30080@sstabellini-ThinkPad-T480s>
 <9520fef5-a21b-e4cc-12d1-97794b979883@arm.com>
 <alpine.DEB.2.21.1910152124170.30080@sstabellini-ThinkPad-T480s>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: Don't use _end in
 is_xen_fixed_mfn()
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
Cc: "jgross@suse.com" <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim  \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <Julien.Grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RlZmFubyBTdGFiZWxsaW5pIHdyaXRlcyAoIlJlOiBbUEFUQ0ggZm9yLTQuMTNdIHhlbi9hcm06
IERvbid0IHVzZSBfZW5kIGluIGlzX3hlbl9maXhlZF9tZm4oKSIpOgo+IE15IHN1Z2dlc3Rpb24g
aXMgZ29pbmcgdG8gd29yazogInRoZSBjb21waWxlciBzZWVzIHRocm91Z2ggY2FzdHMiCj4gcmVm
ZXJyZWQgdG8gY29tcGFyaXNvbnMgYmV0d2VlbiBwb2ludGVycywgd2hlcmUgd2UgdGVtcG9yYXJp
bHkgY2FzdGVkCj4gYm90aCBwb2ludGVycyB0byBpbnRlZ2VycyBhbmQgYmFjayB0byBwb2ludGVy
cyB2aWEgYSBNQUNSTy4gVGhhdCBjYXNlCj4gd2FzIGlmZnkgYmVjYXVzZSB0aGUgTUFDUk8gd2Fz
IGNsZWFybHkgYSB3b3JrYXJvdW5kIHRoZSBzcGVjLgo+IAo+IEhlcmUgdGhlIHNpdHVhdGlvbiBp
cyBkaWZmZXJlbnQuIEZvciBvbmUsIHdlIGFyZSBkb2luZyBhcml0aG1ldGljLiBBbHNvCj4gdmly
dF90b19tYWRkciBhbHJlYWR5IHRha2VzIGEgdmFkZHJfdCBhcyBhcmd1bWVudC4gU28gaW5zdGVh
ZCBvZiBkb2luZwo+IHBvaW50ZXJzIGFyaXRobWV0aWMsIHRoZW4gY29udmVydGluZyB0byB2YWRk
cl90LCB3ZSBhcmUgY29udmVydGluZyB0bwo+IHZhZGRyX3QgZmlyc3QsIHRoZW4gZG9pbmcgYXJp
dGhtZXRpY3MsIHdoaWNoIGlzIGZpbmUgYm90aCBmcm9tIGEgQzk5Cj4gcG9pbnQgb2YgdmlldyBh
bmQgZXZlbiBhIE1JU1JBIEMgcG9pbnQgb2Ygdmlldy4gSSBjYW4ndCBzZWUgYSBwcm9ibGVtCj4g
d2l0aCB0aGF0LiBJIGFtIHN1cmUgYXMgSSByZWFzb25hYmxlIGNhbiBiZSA6LSkKCkZUQU9EIEkg
dGhpbmsgeW91IGFyZSBzdWdnZXN0aW5nIHRoaXM6CiAtICsgICAgIChtZm5fdG9fbWFkZHIobWZu
KSA8PSB2aXJ0X3RvX21hZGRyKF9lbmQgLSAxKSkpCiArICsgICAgIChtZm5fdG9fbWFkZHIobWZu
KSA8PSB2aXJ0X3RvX21hZGRyKCgodmFkZHJfdClfZW5kIC0gMSkpKQoKdmlydF90b19tYWRkcih2
YSkgaXMgYSBtYWNybyB3aGljaCBleHBhbmRzIHRvCiAgIF9fdmlydF90b19tYWRkcigodmFkZHJf
dCkodmEpKQoKU28gd2hhdCBpcyBoYXBwZW5pbmcgaGVyZSBpcyB0aGF0IHRoZSBjYXN0IHRvIGFu
IGludGVnZXIgdHlwZSBpcyBiZWluZwpkb25lIGJlZm9yZSB0aGUgc3VidHJhY3Rpb24uCgpXaXRo
b3V0IHRoZSBjYXN0LCB5b3UgYXJlIGNhbGN1bGF0aW5nIHRoZSBwb2ludGVyIHZhbHVlIF9lbmQt
MSBmcm9tCnRoZSB2YWx1ZSBfZW5kLCB3aGljaCBpcyBVQi4gIFdpdGggdGhlIGNhc3QgeW91IGFy
ZSBjYWxjdWxhdGluZyBhbgppbnRlZ2VyIHZhbHVlLiAgdmFkZHJfdCBpcyB1bnNpZ25lZCwgc28g
YWxsIGFyaXRobWV0aWMgb3BlcmF0aW9ucyBhcmUKZGVmaW5lZC4gIE5vdGhpbmcgY2FzdHMgdGhl
IHJlc3VsdCBiYWNrIHRvIHRoZSAiZm9yYmlkZGVuIiAod2l0aCB0aGlzCnByb3ZlbmFuY2UpIHBv
aW50ZXIgdmFsdWUsIHNvIGFsbCBpcyB3ZWxsLgoKKFdpdGggdGhlIG1hY3JvIGV4cGFuc2lvbiB0
aGUgY2FzdCBoYXBwZW5zIHR3aWNlLiAgVGhpcyBpcyBwcm9iYWJseQpiZXR0ZXIgdGhhbiB1c2lu
ZyBfX3ZpcnRfdG9fbWFkZHIgaGVyZS4pCgpJZSwgaW4gdGhpcyBjYXNlIEkgYWdyZWUgd2l0aCBT
dGVmYW5vLiAgVGhlIGNhc3QgaXMgYm90aCBuZWNlc3NhcnkgYW5kCnN1ZmZpY2llbnQuCgpJYW4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
