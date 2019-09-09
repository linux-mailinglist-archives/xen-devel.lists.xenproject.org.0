Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F7AAD966
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 14:52:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7J71-0008LU-Oh; Mon, 09 Sep 2019 12:49:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiN8=XE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7J70-0008LP-8N
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 12:49:42 +0000
X-Inumbo-ID: 4a2ae4ba-d300-11e9-b299-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a2ae4ba-d300-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 12:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568033381;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ds1b8btL1mvPgHHvTaIdkeCUQ2n2i73uRm55N0vBQ2Q=;
 b=YK4pnrqYpho+OyE+mGHAg1Ram9f0Ru2oxTyzgbp8pSSaqPp5eXFsOYhl
 zMVE6pQPe5I4mm7xBzxZA8uQT9eTz1MtznObDS64Y8t4bLyT12mp7LGLf
 8RMGX+A9vifrtpY8fLMsr4rnVRHIX2ezZB5IwIel7BGnsSHrXQY/niWv2 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: salyusKe13UZ2GgT+fDMzNRWgzOR85+xfOGsk5cjE5NNhz5dbvMC7h0LUZVlc6oCzylF2o/fPA
 T0fMcV13dPaEMbUVUG1V9m7eg126zCTWhrOuyvc7CjOfT8RErO3v0jyW18iwacgEN7clAgZ713
 qDeU6E1IV0IoUUSU1AWd67bvyfTgKywsE9DzZeJpkAaJ0uPGPaGXM0oubCGAeuaO72UvbeB266
 d5z1hgVvgUg7TG2G8GTaSviM4HVdMAjZUpCE/wkUwfqVodxcQsD6HVUQ9t6YTFikjxU17rujmM
 DS8=
X-SBRS: 2.7
X-MesageID: 5548287
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,484,1559534400"; 
   d="scan'208";a="5548287"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23926.19012.402588.831107@mariner.uk.xensource.com>
Date: Mon, 9 Sep 2019 13:49:08 +0100
To: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a3142866-ec53-bd2c-0672-99923c421aad@suse.com>
References: <68db6d1a-6498-30a6-6604-a568056dd1e0@suse.com>
 <d6419b76-7864-5d45-1ddd-8c84ae4e3271@citrix.com>
 <a3142866-ec53-bd2c-0672-99923c421aad@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3] x86emul: fix test harness and fuzzer
 build dependencies
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtQQVRDSCB2M10geDg2ZW11bDogZml4IHRlc3QgaGFy
bmVzcyBhbmQgZnV6emVyIGJ1aWxkIGRlcGVuZGVuY2llcyIpOgo+IHlvdSBoYWQgYmVlbiBwYXJ0
aWN1bGFybHkgdW5oYXBweSBhYm91dCB0aGUgdjIgYXBwcm9hY2guIFdoaWxlCj4gbm90IHN0cmlj
dGx5IHJlcXVpcmVkIGZvciBjb21taXR0aW5nLCBJJ2Qgc3RpbGwgcHJlZmVyIHRvIGhhdmUKPiB5
b3VyIGFncmVlbWVudCB3aXRoIHRoaXMgYXBwcm9hY2ggKG9yLCBvZiBjb3Vyc2UsIHN1Z2dlc3Rp
b25zCj4gZm9yIGltcHJvdmVtZW50KS4KClRoYW5rcyBmb3IgdGhlIGVucXVpcnkuICBJIGFwcHJl
Y2lhdGUgdGhlIGNoYW5jZSB0byBjb21tZW50LiAgSSBkbyBub3QKb2JqZWN0IHRvIHRoaXMgYXBw
cm9hY2guCgpJIHRoaW5rIHRoZSBleHRyYSBjb252ZW5pZW5jZSBpcyBub3QgcmVhbGx5IHdvcnRo
IHRoZSB0aGUgY29tcGxleGl0eQppbiB0aGUgdG9wLWxldmVsIE1ha2VmaWxlIGJ1dCBpZiB5b3Ug
dGhpbmsgaXQgaXMgd29ydGh3aGlsZSBJIHdvbid0CnN0YW5kIGluIHlvdXIgd2F5LgoKSSB0aGlu
ayBpdCdzIGltcG9ydGFudCB0aGF0IHRoZXNlIHJ1biB0YXJnZXRzIG5vdCBnZXQgZW50YW5nbGVk
IHdpdGgKdGhlIHJlc3Qgb2YgdGhlIGJ1aWxkIHN5c3RlbTogaWUgdGhhdCBubyBub24tcnVuIHRh
cmdldHMgY2FsbCB0aGVtLgpJZiB3ZSBtYWludGFpbiB0aGF0IHJ1bGUgdGhlbiB3ZSB3b24ndCBp
bnRyb2R1Y2UgbmV3IGJ1aWxkIHJhY2UgYnVncy4KClNvIG92ZXJhbGwsIAoKQWNrZWQtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
