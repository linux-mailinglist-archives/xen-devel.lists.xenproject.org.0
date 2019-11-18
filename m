Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 543EB100AFA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 19:00:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWlHM-0002Xi-V6; Mon, 18 Nov 2019 17:57:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AWEU=ZK=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iWlHL-0002Xb-DL
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 17:57:35 +0000
X-Inumbo-ID: e60fb623-0a2c-11ea-a2dd-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e60fb623-0a2c-11ea-a2dd-12813bfff9fa;
 Mon, 18 Nov 2019 17:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574099854;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=z/mttm1Ed2UPE76MzchMR/tBee6uVkNx7K9mzDEjjJ4=;
 b=WyJtrhnTJdxLaThUTj/eIhZp2jY0W8r+fd2rpsGbb93eCb4dZ8FF4buF
 KPPTNmD5w/9PcdiIHuPq/ERliEa6CYX9my+m9KBAzSw1CIiiwfzp+luik
 zQkjb5+n6PNeKDb7LSQwknAPIuwwJEFDE/FRhsItHdyPkXt1ZULo8x94i M=;
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
IronPort-SDR: q2Ti2QzuxCTuRcH+ECdlPL4b7I5mirRTf3Vqn8wM02scQNtbWxUrfSmdFp3k629hSQbl41BNYK
 I/by7buduvvj5zkis6Vd/xhKSovcRZnbrDiQzwmoRqsSrOa/Nsl5C0wYtTp3NxC1bwfLLoceg0
 Uk0IjUAkXxHrATLzb0KLabRPuuv5zfitw+n1P26tL99B7ySTwAtpEr/+fIeCfBeIZNA+PB1O4C
 GHLHZnRR7LVvMG+NHxtCENh2LraVQeq7ZhHaQuv4ac4cqhq3c50FpkOHQQeuY5dG6ym1NxSa5p
 TR0=
X-SBRS: 2.7
X-MesageID: 9016244
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,321,1569297600"; 
   d="scan'208";a="9016244"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24018.56203.743217.719951@mariner.uk.xensource.com>
Date: Mon, 18 Nov 2019 17:57:31 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191118174956.GD1425@perard.uk.xensource.com>
References: <20191118171309.1459302-1-anthony.perard@citrix.com>
 <20191118171309.1459302-7-anthony.perard@citrix.com>
 <24018.54449.703124.372517@mariner.uk.xensource.com>
 <20191118174956.GD1425@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v3 6/7] libxl: Introduce
 libxl__ev_immediate
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYRU4gUEFUQ0ggZm9yLTQuMTMgdjMgNi83XSBs
aWJ4bDogSW50cm9kdWNlIGxpYnhsX19ldl9pbW1lZGlhdGUiKToKPiBTb3VuZCBnb29kLiBJJ2xs
IGFsc28gc3dpdGNoIHRvIFNUQUlMUSBpbnN0ZWFkLCBzaW5nbGUtbGluayB0YWlsIHF1ZXVlCj4g
Zm9yIGEgRklGTyBsaXN0LgoKRXJyLCB5ZXMsIHRoYXQgd291bGQgbWFrZSBzZW5zZS4gIEkgc2hv
dWxkIGhhdmUgY29uc2lkZXJlZCB3aGV0aGVyIHlvdQpjaG9zZSB0aGUgcmlnaHQga2luZCBvZiBs
aXN0IGJ1dCBpdCBkb2Vzbid0IHJlYWxseSBtYXR0ZXIgbXVjaCBpbgp0aGVzZSBwYXRocyB0byBo
YXZlIG9uZSB0aGF0IGlzIHRvbyBmZWF0dXJlZnVsLi4uCgpJYW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
