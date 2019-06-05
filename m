Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CD335F5E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 16:35:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYWzH-0007cj-Hy; Wed, 05 Jun 2019 14:33:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UgCu=UE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYWzG-0007cd-Fv
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 14:33:58 +0000
X-Inumbo-ID: f27b9590-879e-11e9-b51e-e7003c221f41
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f27b9590-879e-11e9-b51e-e7003c221f41;
 Wed, 05 Jun 2019 14:33:56 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: N5pLu9SodTLOB7DH+TM1VsKqwziDOkRI6YDYuchdiLSLaL4hkqZOGncudXD6SFvoG+Zxeegt0c
 om55HpU0SG4ZKmEeFXD65crYB8R6pMN92CKKkIL/WNRCo/JomtGh6/HH2UKZtXhp9FoS/agBdJ
 yeuckih9yaIEbODc+z805yjN3yTjcfeSBysaFM7qibc0MrPfNc5Top8xOAHC44YTFiHoHE4Edv
 5LWUTtqZGT5mZLxIK3Mpg0QwzLTUVhM82bb4t9FjYGrMXrjwxO5Qdk3TTFOLrYZfPZL6nLF4tV
 1eM=
X-SBRS: 2.7
X-MesageID: 1327106
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1327106"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23799.53930.471770.771659@mariner.uk.xensource.com>
Date: Wed, 5 Jun 2019 15:33:14 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190605142219.GK2126@perard.uk.xensource.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
 <20190409164542.30274-10-anthony.perard@citrix.com>
 <23798.44724.367137.714833@mariner.uk.xensource.com>
 <20190605142219.GK2126@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 9/9] libxl_disk: Implement missing timeout
 for libxl_cdrom_insert
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
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCA5LzldIGxpYnhsX2Rpc2s6IEltcGxl
bWVudCBtaXNzaW5nIHRpbWVvdXQgZm9yIGxpYnhsX2Nkcm9tX2luc2VydCIpOgo+IE9uIFR1ZSwg
SnVuIDA0LCAyMDE5IGF0IDA2OjQ3OjMyUE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4g
QnV0IEkgd29uZGVyIGlmIHRoaXMgY291bGQgc29tZWhvdyBiZSBwbGFjZWQgZWFybGllciB0byBw
cmVzZXJ2ZQo+ID4gYmlzZWN0YWJpbGl0eS4KPiAKPiBJIHRoaW5rIGl0IHdvdWxkIGJlIHBvc3Np
YmxlIHRvIHBsYWNlIHRoZSBwYXRjaCByaWdodCBhZnRlciAibGlieGxfZGlzazoKPiBDdXQgbGli
eGxfY2Ryb21faW5zZXJ0IGludG8gc3RlcHMiLCBldmVuIHRob3VnaCB0aGUgdGltZW91dCB3aWxs
IG5ldmVyCj4gZ2V0IGEgY2hhbmNlIHRvIGFjdHVhbGx5IGZpcmUuIChCZWZvcmUgIlVzZSBldl9x
bXAgLi4uIiwgZXZlcnl0aGluZyBpcwo+IHN5bmNocm9ub3VzLikKClNvdW5kcyBnb29kIHRvIG1l
LgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
