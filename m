Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D862D8FEBB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 11:11:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyYDd-0007Ix-H6; Fri, 16 Aug 2019 09:08:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CMUz=WM=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hyYDb-0007Ii-R8
 for xen-devel@lists.xen.org; Fri, 16 Aug 2019 09:08:19 +0000
X-Inumbo-ID: 632a60c0-c005-11e9-a661-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 632a60c0-c005-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 09:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565946498;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0s6HURGfPaU/emFr4Lmm1wioPp07EkzK7SVAWHm9Le0=;
 b=Xb6CWfWvgyjg8985psjrhElNOQURV3BB4bl6Xbq0t+jTgzTF7pQCuTNn
 DrePKG4WfQ+/+LSB3ey5xFeacsClkst8//vvTijGKKECSPrDN782V22x8
 7eD1wIsWdo/rxN/ovclVauxPeLCCvxtopWlddz1JDm5zVo0B2eWa2uaoX k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: m41VA+KCnJc/2NGLjYfgXSgAYOfG8AhlPT3o2FcUptL3ZOKwu22zQtQLzS4iLHRtoU2JIsLGaj
 NdEoN0M8DB3/9vWTEwn24SVkpe+E7jdl+skr8uIu5lz0jBW5t2v7GgB3OrFXyRvomcYaGczUTV
 eDpRVjmXzAQpocDz7+Rz8IJTF+eDa3rJ3Rwh94+ewM1YoJojw0CLQ62O+lL1d/JYeKj/n5slXA
 U06WzfkHq46NrKffBeUNyaS4OvCYURD/IJZwHtIf1VgIioabuQw8XPjBpusP9YWzuH2f7XrpR2
 PTQ=
X-SBRS: 2.7
X-MesageID: 4509114
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,391,1559534400"; 
   d="scan'208";a="4509114"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190416120716.26269-4-wipawel@amazon.de>
 <20190808122909.7162-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <9fbd82a8-a17e-1ff0-9e0f-a35c3ea230fd@citrix.com>
Date: Fri, 16 Aug 2019 10:08:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190808122909.7162-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools part2 v2 4/6]
 livepatch-build: detect special section group sizes
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
Cc: mpohlack@amazon.de, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC84LzE5IDE6MjkgUE0sIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+IEhhcmQtY29k
aW5nIHRoZSBzcGVjaWFsIHNlY3Rpb24gZ3JvdXAgc2l6ZXMgaXMgdW5yZWxpYWJsZS4gSW5zdGVh
ZCwKPiBkZXRlcm1pbmUgdGhlbSBkeW5hbWljYWxseSBieSBmaW5kaW5nIHRoZSByZWxhdGVkIHN0
cnVjdCBkZWZpbml0aW9ucwo+IGluIHRoZSBEV0FSRiBtZXRhZGF0YS4KPiAKPiBUaGlzIGlzIGEg
bGl2ZXBhdGNoIGJhY2twb3J0IG9mIGtwYXRjaCB1cHN0cmVhbSBjb21taXQgWzFdOgo+IGtwYXRj
aC1idWlsZDogZGV0ZWN0IHNwZWNpYWwgc2VjdGlvbiBncm91cCBzaXplcyAxNzA0NDk4NDcxMzZh
NDhiMTlmYwo+IAo+IFhlbiBvbmx5IGRlYWxzIHdpdGggYWx0X2luc3RyLCBidWdfZnJhbWUgYW5k
IGV4Y2VwdGlvbl90YWJsZV9lbnRyeQo+IHN0cnVjdHVyZXMsIHNvIHNpemVzIG9mIHRoZXNlIHN0
cnVjdHVyZXMgYXJlIG9idGFpbmVkIGZyb20geGVuLXN5bXMuCj4gCj4gVGhpcyBjaGFuZ2UgaXMg
bmVlZGVkIHNpbmNlIHdpdGggcmVjZW50IFhlbiB0aGUgYWx0X2luc3RyIHN0cnVjdHVyZQo+IGhh
cyBjaGFuZ2VkIHNpemUgZnJvbSAxMiB0byAxNCBieXRlcy4KPiAKPiBbMV0gaHR0cHM6Ly9naXRo
dWIuY29tL2pwb2ltYm9lL2twYXRjaC9jb21taXQvMTcwNDQ5ODQ3MTM2YTQ4YjE5ZmNjZWIxOWMx
ZDRkMjU3ZDM4NmI1Ngo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3
aXBhd2VsQGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFt
YXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogTWFydGluIE1hemVpbiA8YW1hemVpbkBhbWF6b24uZGU+
Cj4gLS0tCj4gdjI6Cj4gKiBBcHBsaWVkIHN1Z2dlc3Rpb25zIGZyb20gUm9zczoKPiAgICAtIG1v
dmVkIHRoZSBsaXZlcGF0Y2gtYnVpbGQgaHVuayBhZnRlciBidWlsZF9mdWxsKCkgY2FsbCBhbmQK
PiAgICAgIHJlLXVzaW5nIG5ld2x5IGJ1aWx0IHhlbi1zeW1zCj4gICAgLSBkcm9wcGVkIHRoZSBy
ZWR1bmRhbnQgYnVnX2ZyYW1lc18zX2dyb3VwX3NpemUoKQpSZXZpZXdlZC1ieTogUm9zcyBMYWdl
cndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
