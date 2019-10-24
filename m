Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3A4E321E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 14:19:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNc2k-0006E5-B2; Thu, 24 Oct 2019 12:16:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zclB=YR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNc2j-0006Dz-Kp
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 12:16:41 +0000
X-Inumbo-ID: 2236ad38-f658-11e9-beca-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2236ad38-f658-11e9-beca-bc764e2007e4;
 Thu, 24 Oct 2019 12:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571919401;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=RLMyTiDcnHwgR+wLj7EjhpY3gGYFspgn0d5nOQrHS5Q=;
 b=Z55V+0X/g0feQUIJtv0+g/pTnr+EpZFMay/UI5PyOjP417mTf8gfHNmp
 jgKejvw+JYz4MDE1E74IznvdWiVx2Ja+nJYNJ49mNpiRLcbXweIeXPQGm
 WFJ61mDEXYOfjw10kepdkni6vz3e95M6fczcCdZ54qoQjhcbNoMRE3k8Y U=;
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
IronPort-SDR: KOJPy/58H0A0O+bVuemomhi1ZLrBjXjiLMzMQHZHngSnuSN0cEpFI8CpEQuDMD10lbLjhETjf/
 oiDaoPLi5zUGej2/lRLa1hqFDwK+NG1hEr1TZZ6dM8Ds3n37H+quTZgeJK19jfKITgg8IuOMxq
 sfpSNoY866aXYuzLD0xXbtm65fv/dMNZiIeSzexsunjnOJZ2BYRlqV8b0pcyItLImhNgaVSphs
 YeF+IBhEeqSNz/M/5Jyh5vvhtq4PKVFfiR/zVjYVQjgZoehCsgdzLmT9UAAMr3uqTN3YEvo2DX
 mao=
X-SBRS: 2.7
X-MesageID: 7467207
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,224,1569297600"; 
   d="scan'208";a="7467207"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23985.38431.332013.73676@mariner.uk.xensource.com>
Date: Thu, 24 Oct 2019 13:16:31 +0100
To: Wei Liu <wl@xen.org>
In-Reply-To: <20191024112226.ugcmzmsyndg3sfeb@debian>
References: <20191024110618.6436-1-wl@xen.org>
 <e05ef290-8e71-046f-a687-9d1a8e1ea7fe@suse.com>
 <20191024112226.ugcmzmsyndg3sfeb@debian>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH for-4.13] CONTRIBUTING: drop reference to
 blktap2
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Lars Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIIGZvci00LjEzXSBDT05UUklC
VVRJTkc6IGRyb3AgcmVmZXJlbmNlIHRvIGJsa3RhcDIiKToKPiBPbiBUaHUsIE9jdCAyNCwgMjAx
OSBhdCAwMToxMzoxM1BNICswMjAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+ID4gTWluZCBhZGRp
bmcgdG9vbHMvbGlicyBpbnN0ZWFkPwo+IAo+IFN1cmUuIFRoYXQgY2FuIGJlIGRvbmUuCj4gCj4g
QmVjYXVzZSB0b29scy9saWJzJyBjb2RlIGlzIG1vc3RseSBzcGxpdCBmcm9tIGxpYnhjIGFuZCBm
cmllbmRzLCBJCj4gYXNzdW1lIGl0IGlzIGdvaW5nIHRvIGJlIExHUEwgdjIuMSBhcyB3ZWxsLgo+
IAo+IExhcnMgYW5kIElhbiwgeW91ciBvcGluaW9uPwoKRXJyLCB0aGlzIGlzIHN1cmVseSBhIG1l
Y2hhbmljYWwgcXVlc3Rpb24gPyAgSWUsIHdoYXQgbGljZW5jZSBhcmUKdGhlc2UgZmlsZXMgaW4g
YWxyZWFkeS4KCkkgZGlkCiAgZ2l0LWdyZXAgLWkgLWwgY29weXJpZ2h0IHwgeGFyZ3MgZ2l0LWdy
ZXAgLUwgJ0dOVSBMZXNzZXIgR2VuZXJhbCcKaW4gdG9vbHMvbGlicyBhbmQgdGhlcmUgd2VyZSBu
byBoaXRzLgoKU28gSSB0aGluayB0aGUgYW5zd2VyIGlzIGluZGVlZCBMR1BMLgoKSWFuLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
