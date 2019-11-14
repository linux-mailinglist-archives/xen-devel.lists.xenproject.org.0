Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB03FC66C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 13:40:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVENm-0004ST-47; Thu, 14 Nov 2019 12:37:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MiuJ=ZG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iVENj-0004SO-Qw
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 12:37:51 +0000
X-Inumbo-ID: 92031492-06db-11ea-b678-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92031492-06db-11ea-b678-bc764e2007e4;
 Thu, 14 Nov 2019 12:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573735071;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rejClLKSLmyPj5JFl3ipRX+0x4Clc1LwlpIpWq1fUBU=;
 b=VeHnCVxPyoYTAPCq6Exvy9VmdnPFS06eGzNa8ZiQQ2G6dB7IZPV1Hc/6
 t8zeByirUjx8XkCjPoPzM4c33ET+klQqGnhrc4YcLh7jdOX0CujJSZlEv
 mjq43eIll5yfc/hVuOiNrluFRxRje0rnxjMCAJWJEf++/+1rLbk3qSxfi I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hUvBhcCT7Z2fRmt0wBRhtH4CuAuYp7P661ECWSqCBVmZqp+erxkxNrla2G44xwxKbXfUq1Ky8R
 oT/j4o6FDV475nTbwOHZ1SbcXmfZl1svAq4rMQoKfWkNb+I9hbxqkY9TSFBE5QTosrzgzKp/2Z
 edoJftkS4GzwMayorXPeXGmslk0nmUZqE3qCzirlbuNQvmBb4o22VXPoJ2ACoV6/QUNGNVkFQ8
 lLo+WSfrZqlhpQ84JHcAQJaTOzS7rqjLTTFrVW4ebHxfzaFHiYQ9JXpXE8GzjWLE8a7Gnc15Su
 2D0=
X-SBRS: 2.7
X-MesageID: 8319780
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,304,1569297600"; 
   d="scan'208";a="8319780"
Date: Thu, 14 Nov 2019 12:37:47 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Ian Jackson
 <ian.jackson@citrix.com>
Message-ID: <20191114123747.GB2337@perard.uk.xensource.com>
References: <osstest-144067-mainreport@xen.org>
 <75512f9c-a521-1aec-34f5-e11540dbe973@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75512f9c-a521-1aec-34f5-e11540dbe973@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [xen-unstable test] 144067: regressions - FAIL
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
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgMDY6NTE6MDJBTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAxNC4xMS4xOSAwMDowNiwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+
ID4gZmxpZ2h0IDE0NDA2NyB4ZW4tdW5zdGFibGUgcmVhbCBbcmVhbF0KPiA+IGh0dHA6Ly9sb2dz
LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDQwNjcvCj4gPiAKPiA+IFJl
Z3Jlc3Npb25zIDotKAo+ID4gCj4gPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFy
ZSBibG9ja2luZywKPiA+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+
ID4gICB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtZG1yZXN0cmljdC1hbWQ2NC1kbXJlc3RyaWN0
IDEyIGd1ZXN0LXN0YXJ0L2RlYmlhbmh2bS5yZXBlYXQgZmFpbCBSRUdSLiB2cy4gMTQ0MDQyCj4g
Cj4gcWVtdSBoYWQgYSBzZWdmYXVsdC4gQ291bGQgc29tZW9uZSBsb29rIGF0IHRoYXQsIHBsZWFz
ZT8KCkFuZCBubyBjb3JlZHVtcCBvciBzdGFja3RyYWNlIDotKC4KCklhbiwgaWYgdGhlcmUncyBu
byBjb3JlZHVtcCwgaXMgaXQgYmVjYXVzZSBxZW11IGlzIHJ1bm5pbmcgd2l0aCBhCm5vbi1yb290
IHVzZXJpZD8gQW5kIHJlc3RyaWN0ZWQgZW52aXJvbm1lbnQ/CklzIGl0IHBvc3NpYmxlIHRvIGhh
dmUgb25lPwoKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
