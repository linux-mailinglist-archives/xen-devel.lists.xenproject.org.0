Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F71C8FFE0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 12:18:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyZGe-0006Aw-V4; Fri, 16 Aug 2019 10:15:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGx2=WM=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hyZGd-0006Ar-Bx
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 10:15:31 +0000
X-Inumbo-ID: c43c2d0f-c00e-11e9-8bb4-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c43c2d0f-c00e-11e9-8bb4-12813bfff9fa;
 Fri, 16 Aug 2019 10:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565950527;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HCNTeJdmLDawUwEHOHk+s4MSk9LxcJ/swt2LMfzQzRE=;
 b=NUpavvVIuu+uQrGf+BCMSL8BH3aLFYqwllICOxhq5XmBU9jvX1mMFSaK
 bQ6hfOnV3b2t+TofXCHs7KQsLX/CwZ1T820b/2sZOuhWXJQFq+bowKijB
 1cnEm/Qe/fj/0e+eJiqAmwjlc+KSbrXpL7lzz595oAQDVwkNf2A+zvAPb Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ev4sUZG6H58ANR7CM6M5YrJBbLFRI+FL3AiQpBK6Gy+DptS2wJ/yQcJMiy1OGemQx5nIwkIxty
 NBb42PhDarQwhVIVWHADWyi+mBbsxPnvjwDdf3z1foMJKY0Gmerzs0Pn8K+1jtijL+YR9C0LhJ
 guVUTbLudxVQoa44tJVxEPoygAXYfU+0Uf70mtCZ2Pg4HPyd2h0+8u0c+R+nekM0yxbNesUVHM
 cBFd4amqQLxoAeE3R8klUlik5IR4FcSPi+1N4JpQN15HCTSTxr+TKkmf3P1HzOWlpS/p1lCHZc
 4HU=
X-SBRS: 2.7
X-MesageID: 4575371
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,391,1559534400"; 
   d="scan'208";a="4575371"
Date: Fri, 16 Aug 2019 11:15:17 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
Message-ID: <20190816101517.GG1289@perard.uk.xensource.com>
References: <635339af71d7a5defa3c5e88ca1a45abbe66f2e9.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <635339af71d7a5defa3c5e88ca1a45abbe66f2e9.camel@suse.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] More QEMU gcc-9.1 build issues
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDI6MzI6NDdQTSArMDIwMCwgRGFyaW8gRmFnZ2lvbGkg
d3JvdGU6Cj4gSGV5IEFudGhvbnksCj4gCj4gVGhlcmUncyBtb3JlIG9mIHRob3NlIGlzc3VlcyBy
ZWxhdGVkIHRvIGJ1aWxkaW5nIG91ciBRRU1VIHdpdGggcmVjZW50Cj4gKHRoZSBvbmUgaW4gb3Bl
blNVU0UgVHVtYmxld2VlZCkgR0NDOgo+IAo+IGdjYyB2ZXJzaW9uIDkuMS4xIDIwMTkwNzIzIFtn
Y2MtOS1icmFuY2ggcmV2aXNpb24gMjczNzM0XSAoU1VTRSBMaW51eCkKClsuLi5dCgo+IEkgZml4
ZWQgaXQgYnkgbWFudWFsbHkgaW1wb3J0aW5nIHRoZSBmb2xsb3dpbmcgdXBzdHJlYW0gY29tbWl0
Ogo+IAo+IDk0OTMyYzk1YzEwICJxeGw6IGF2b2lkIHVuYWxpZ25lZCBwb2ludGVyIHJlYWRzL3dy
aXRlcyIKCkRvbmUuIEFuZCBJJ3ZlIG1lcmdlZCBldmVyeSBzaW5nbGUgY29tbWl0IGF2YWlsYWJs
ZSB1cHN0cmVhbSEgSSBob3BlCnRoYXQncyBlbm91Z2ggOi1ELgoKSm9rZSBhc2lkZSwgUUVNVSB2
NC4xIHdhcyByZWxlYXNlZCB0b2RheSwgc28gSSBtZXJnZWQgaXQuIEkgd2FzIHdhaXRpbmcKZm9y
IHRoYXQgaW5zdGVhZCBvZiBjaGVycnktcGlja2luZyB0aGUgc2luZ2xlIGNvbW1pdCB5b3UndmUg
cG9pbnRlZC4KCkNoZWVycywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
