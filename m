Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC5E14A851
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 17:48:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw7XN-00087R-U2; Mon, 27 Jan 2020 16:46:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ksAf=3Q=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iw7XM-00087K-SK
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 16:46:56 +0000
X-Inumbo-ID: a0a856d2-4124-11ea-9fd7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0a856d2-4124-11ea-9fd7-bc764e2007e4;
 Mon, 27 Jan 2020 16:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580143616;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=0qiKgKMNI1FcH/z3iVzXvJk2GExn/1ggPgXVsjs6Ugo=;
 b=fwmTD91WzvX/lssG1YBsRjmzeVyu1l/QcuG4j3GVwVnSB5LzHxt4FbDG
 yYZyRvzxv1QuYOR7bKWCZCxrtE/ifl6qopW1kUIe6lEfp/9BNObb4uwzO
 bu8Uv4EFpWO0Fx8PcszBSDUKT3P61SwgjgpV5oOIiukPWLYMtTWfPD6tm I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GAuJOSGtaVMEHX8PVfkKnaFomwG0X3u44GeOVfV4AJ82apJbr1HPUNt6ago0GPL13ud5x7XwhJ
 pjk/6M1L5pNVuA/Vuak5StOqmJ64nYpcx+ASBOkjIpYJXK3dxobjTgrefNlM0zgboigvQQ/zhk
 +eYOQPnkBODLtzN167km7TBTkHFjWJJFofDhyL2s0og3i4XFuRywFExYGHNyl93hiZ0UDwi2M/
 ffKwtHhyk10Dp1EjaAKxF8EcIxVxgEY2r3Pp5Y+H1x+IRpayWc96WKrBev611i/6mvkijO6ZTo
 3NU=
X-SBRS: 2.7
X-MesageID: 11938545
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11938545"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24111.5116.829923.878351@mariner.uk.xensource.com>
Date: Mon, 27 Jan 2020 16:46:52 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200127161430.3312-1-pdurrant@amazon.com>
References: <20200127161430.3312-1-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] docs/designs: Add a design document for
 transparent live migration
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSF0gZG9jcy9kZXNpZ25zOiBBZGQgYSBkZXNpZ24g
ZG9jdW1lbnQgZm9yIHRyYW5zcGFyZW50IGxpdmUgbWlncmF0aW9uIik6Cj4gSXQgaGFzIGJlY29t
ZSBhcHBhcmVudCB0byBzb21lIGxhcmdlIGNsb3VkIHByb3ZpZGVycyB0aGF0IHRoZSBjdXJyZW50
Cj4gbW9kZWwgb2YgY28tb3BlcmF0aXZlIG1pZ3JhdGlvbiBvZiBndWVzdHMgdW5kZXIgWGVuIGlz
IG5vdCB1c2FibGUgYXMgaXQKPiBwbGFjZXMgdHJ1c3QgaW4gc29mdHdhcmUgcnVubmluZyBpbnNp
ZGUgdGhlIGd1ZXN0LCB3aGljaCBpcyBsaWtlbHkKPiBiZXlvbmQgdGhlIHByb3ZpZGVyJ3MgdHJ1
c3QgYm91bmRhcnkuCj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgcHJvcG9zYWwgZm9yIGEgJ3Ry
YW5zcGFyZW50JyBsaXZlIG1pZ3JhdGlvbiwKPiBkZXNpZ25lZCB0byBvdmVyY29tZSB0aGUgbmVl
ZCBmb3IgdGhpcyB0cnVzdC4KCkkgaGF2ZSByZXZpZXdlZCB0aGlzIGFuZCBpdCBzZWVtcyBsaWtl
IGFuIGFjY3VyYXRlIHN1bW1hcnkgb2YgdGhlCnNpdHVhdGlvbiwgYW5kIGEgcGxhdXNpYmxlIHBy
b3Bvc2FsLiAgSSB3b25kZXIgaWYgc29tZSBvZiB0aGUKZXhpc3Rpbmctc2l0dWF0aW9uIHRleHQg
Y291bGQgZ28gaW50byBvdGhlciBkb2N1bWVudHMuCgpJIGhhdmUgc29tZSB2ZXJ5IG1pbm9yIGNv
bW1lbnRzLgoKSSBkb24ndCBsaWtlIHRoZSB0ZXJtIGB0cmFuc3BhcmVudCcuICBJdCBpcyBvZnRl
biBhYnVzZWQgaW4gb3RoZXIKY29udGV4dHMuICBJdCBjYW4gYmUgY2xlYXIgdG8gd2hvbSB0aGlu
Z3MgYXJlIHRyYW5zcGFyZW50LiAgSW4gYSB2ZXJ5CnJlYWwgc2Vuc2UgZXhpc3RpbmcgbWlncmF0
aW9uIGlzIGB0cmFuc3BhcmVudCcgdG8gYSBkb21haW4ncyBuZXR3b3JrCnBlZXJzLCBmb3IgZXhh
bXBsZS4gIEhvdyBhYm91dCBgb2JsaXZpb3VzJyA/CgpJIGRvbid0IHRoaW5rIGB0cnVzdCcgaXMg
cmlnaHQsIGVpdGhlci4gIEkgdGhpbmsgeW91IG1lYW4gYHJlbGlhbmNlJwpvciBzb21ldGhpbmcu
ICBgVHJ1c3QnIG1ha2VzIGl0IHNvdW5kIGxpa2UgdGhlIGd1ZXN0IGNhbiBjYXVzZSB0cm91Ymxl
CmZvciB0aGUgaG9zdC4gIFdoZXJlYXMgdGhlIHByb2JsZW0geW91IGFyZSBhZGRyZXNzaW5nIGhl
cmUgaXMgdGhhdAp0aGUgZ3Vlc3QgY2FuIGNhdXNlIHRyb3VibGUgKmZvciBpdHNlbGYqIGJ5IG5v
dCBvcGVyYXRpbmcgdGhlCm1pZ3JhdGlvbiBwcm90b2NvbHMgY29ycmVjdGx5LiAgVGhpcyBpcyBh
biBvcGVyYXRpb25hbCBpbmNvbnZlbmllbmNlLApidXQgYHRydXN0JyBpbXBsaWVzIGEgc2VjdXJp
dHkgaXNzdWUuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
