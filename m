Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635B6B5392
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:04:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGsC-0002Ox-9e; Tue, 17 Sep 2019 17:02:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGsA-0002Oj-R1
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:02:38 +0000
X-Inumbo-ID: f341c272-d96c-11e9-961b-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f341c272-d96c-11e9-961b-12813bfff9fa;
 Tue, 17 Sep 2019 17:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568739757;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=GB/c86KBwgmiyaFdcs1vxvowE2r1EPsyG0VYqGISkSA=;
 b=AHZUGAcbRu/I+lzPebNK2zg96QZ8ljU4a5oc1kgYtZxqhVX2OLPk/G4n
 fJSb8fLbg7K5mcZSaMuJwsOcZDR8ttNt59ILmBdgLQDT7QNDFmwzPG5xj
 9w4mQwSBOwNEO+RTYXq9Ff2JDZH3+JSKDmy1VfeDHc1QzMBTnhN/5+RAT w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jX6jGe7POZism/yi2znnSR6N62uItaDXYJbZHFaVdtDy0zZxnA7nopPfXCD1l/vFQsoUoodFd6
 hDjxZ1DNGcvAvY9VQMxZ2OhRtmBv0I6zw8/z9dx8eirNereIDSxTYZhovKF4uIlHEpH0JoFlcV
 J0Nv+4ztHmLdseIJe8cxhJlW3YCrwT1gSZixwrl/PvebkZe3tXHt+vQUX/CFHR3Xy1sb4mUFxz
 st0RFdqS2fNWqd8Mp27LBbSaVe3G6NZ8UFptB3fWx+iBxbOtbK9aE2z0PF9r2EVk5QXhAEiDHY
 XwI=
X-SBRS: 2.7
X-MesageID: 5886114
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5886114"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.4506.366843.383849@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:02:18 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-9-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-9-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 08/35] libxl: Replace
 libxl__qmp_initializations by ev_qmp calls
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDA4LzM1XSBsaWJ4bDogUmVwbGFjZSBsaWJ4
bF9fcW1wX2luaXRpYWxpemF0aW9ucyBieSBldl9xbXAgY2FsbHMiKToKPiBTZXR1cCBhIHRpbWVv
dXQgb2YgMTBzIGZvciBhbGwgdGhlIGNvbW1hbmRzLiBJdCB1c2VkIHRvIGJlIGFib3V0IDVzCj4g
cGVyIGNvbW1hbmRzLgoKVGhpcyBwYXRjaCBpcyBxdWl0ZSBoYXJkIHRvIHJldmlldyBiZWNhdXNl
IGl0IGlzIGEKcmV3cml0ZS9yZWFycmFuZ2VtZW50IGFuZCBJIGNhbid0IHNlZSB3aGVyZSBhbGwg
dGhlIHBpZWNlcyBjb21lIGZyb20uCgpIb3cgaGFyZCB3b3VsZCBpdCBiZSB0byBtYWtlIGEgcHJl
LXBhdGNoIHRvIHNodWZmbGUgdGhlIGNvZGUgdG8gdGhlCnNhbWUgcGxhY2UgYXMgaXQncyBnb2lu
ZywgYW5kIGNoYW5nZSB0aGUgdmFyaWFibGUgbmFtZXMgZXRjLiA/CgpJZiB0aGF0J3MgaGFyZCB0
aGVuIEkgZ3Vlc3MgSSBjYW4gZ28gdGhyb3VnaCBpdCBsaW5lIGJ5IGxpbmUuLi4KClRoYW5rcywK
SWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
