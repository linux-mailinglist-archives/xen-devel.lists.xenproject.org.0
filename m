Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5857AE2F67
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 12:51:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNafa-00053p-EL; Thu, 24 Oct 2019 10:48:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zclB=YR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNafZ-00053j-9m
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 10:48:41 +0000
X-Inumbo-ID: d6ea5d86-f64b-11e9-8aca-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6ea5d86-f64b-11e9-8aca-bc764e2007e4;
 Thu, 24 Oct 2019 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571914120;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=wXGq11b0fOq1k3xLLrULpTD79kRON0Xy4ok9yVQxMYI=;
 b=cGEKOzSk4TulPkY0KHxxl3TdIFOtBYKvzw/7Ev23cisJkGMvBpBU3ZHm
 8PwbXxWOD/5Xh71d/e3AoFwm/xlJf9UFfHu+dvrYbEG4PTrbGqtXajsAv
 LKGuUzmy8numjQkXCyXNWeu8OohkmH77vlmtbtWN9Zc9QxGSTtdNJHx5q o=;
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
IronPort-SDR: FGjlMnZ9DkqA0RZsuW6HIki/BJrIYpxagKq/flnQ37lG/gUjQTrNIzEECo64T+D6vZh71/wmQB
 Nu3oxXoqCkAuEKPsVIJJjqxXHBleMX2XNFJEw+fk774JeF754ITjzJ8a8NvFpOOMf4XGTU7zed
 iTRTO3Jgw2mX2D6PVgBbpc3+Jv6aBJX4b70EfvZemrqPkYVhyRZ3Nb5YyY/in9+IODtfEeaAvn
 EhtUwU4f66cqctMNy2ByUXJKDSQqeo20HnrBCJY5dGbyDg6KazXZQQnApSxerrshoErgJWBqdP
 4qk=
X-SBRS: 2.7
X-MesageID: 7815573
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,224,1569297600"; 
   d="scan'208";a="7815573"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23985.33157.424790.599253@mariner.uk.xensource.com>
Date: Thu, 24 Oct 2019 11:48:37 +0100
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <45b32f7a-4dcd-c576-4d3f-387cec4d91e2@suse.com>
References: <osstest-143061-mainreport@xen.org>
 <45b32f7a-4dcd-c576-4d3f-387cec4d91e2@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-unstable test] 143061: regressions - trouble:
 broken/fail/pass
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
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW3hlbi11bnN0YWJsZSB0ZXN0
XSAxNDMwNjE6IHJlZ3Jlc3Npb25zIC0gdHJvdWJsZTogYnJva2VuL2ZhaWwvcGFzcyIpOgo+IE9u
IDI0LjEwLjE5IDA4OjQ3LCBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6Cj4gPiAgIHRlc3Qt
YXJtNjQtYXJtNjQtZXhhbWluZSAgICAxMSBleGFtaW5lLXNlcmlhbC9ib290bG9hZGVyIGZhaWwg
UkVHUi4gdnMuIDE0Mjc1MAo+IAo+IEknbSBub3Qgc3VyZSB3aGF0IGhhcyBnb25lIHdyb25nIGhl
cmU/IFRoZSBzZXJpYWwgbG9ncyBzZWVtIHRvIGJlIGZpbmUKPiBmb3IgbWUsIGJ1dCBtYXliZSBJ
J20gbWlzc2luZyBzb21ldGhpbmc/CgpUaGVyZSBpcyBhIGtub3duIGJ1ZyB3aXRoIHR3byBvZiBv
dXIgYXJtNjQgYm94ZXMsIHdoZXJlIHRoZXkgbG9zZSBzb21lCm9mIHRoZSBvdXRwdXQgZHVyaW5n
IGJvb3QuICBUaGlzIGlzIG5vdCBpbXBvcnRhbnQgZm9yIG9wZXJhdGlvbmFsIHVzZQpvZiB0aG9z
ZSBib3hlcyBpbiBhIG5vcm1hbCBjb250ZXh0LCBidXQgaW4gb3VyIGNvbnRleHQgYmVpbmcgYWJs
ZSB0bwpnZXQgYWxsIHRoZSBib290IG1lc3NhZ2VzIGlzIGltcG9ydGFudCBmb3IgZGVidWdnaW5n
IGh5cGVydmlzb3JzIGFuZAprZXJuZWxzLCBzbyBvc3N0ZXN0IGhhcyBhIHRlc3QgdGhhdCB0aGlz
IHdvcmtzIHByb3Blcmx5LiAgSXQgaXMgdGhhdAp0ZXN0IHRoYXQgZmFpbHMuCgpJZiB0aGlzIGlz
IHRoZSBvbmx5IGZhaWx1cmUsIHdlIHNob3VsZCBmb3JjZSBwdXNoLgoKSWFuLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
