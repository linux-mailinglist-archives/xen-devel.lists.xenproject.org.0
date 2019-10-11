Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A66D4175
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 15:38:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIv1X-0002K3-T2; Fri, 11 Oct 2019 13:32:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fsnF=YE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIv1W-0002Jy-DV
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 13:32:02 +0000
X-Inumbo-ID: 81588700-ec2b-11e9-8aca-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81588700-ec2b-11e9-8aca-bc764e2007e4;
 Fri, 11 Oct 2019 13:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570800721;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=fzQmhifodHJGZb/q5kHPnymMF8nnQFYhO6fEiAuNEHs=;
 b=OMyzYCVeXFplZo3MZyBI7EVA7dcdPYvEOcdFFBjeytcpaqbHOHrQ51OI
 /Zb2AdXCkFiDCbcV9a3SCaBZwpZOYV1DXTbk3uKbAfmFyToYZZoc0FjkW
 FXgGxF83Zl7D/MUtsYiwLOBBlb6rqY0X9xzU8gv1RYLawHv5n7TlOnMtw c=;
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
IronPort-SDR: iJcYfOWKpaEqt7OFTJ93bd1Lf/l3yFaLhhFVfFE8z30JuGWAL/kRSuX4D/Nmp7VQl/T3QXPxKM
 Rr6tEVEKmXlXlLYom1uF92xEbrzpNwwq+gcv7a+tO05QL+0igPAYDv/64zl6Id4LIodiQeQXKm
 NwNqdkNLnaGY+Hwwk0KNZK3MlCPCkSiASvtSAYU1dWy9SnfGEg4muPy0JIUSLBih6LEpTuTP+2
 b67OotpBK55TzIVwRdH5TvM6MxsNHOG/GP2gW+CrAUuEWJodD6NF1ZDCP3fqGPWd1gCu8s1STH
 g4g=
X-SBRS: 2.7
X-MesageID: 7159777
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,284,1566878400"; 
   d="scan'208";a="7159777"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23968.33869.906302.573866@mariner.uk.xensource.com>
Date: Fri, 11 Oct 2019 14:31:57 +0100
To: George Dunlap <dunlapg@umich.edu>
In-Reply-To: <CAFLBxZapoPdDx+2rokrq0KPE_-mTgYtyE-rk4hFsvjX8g76iZQ@mail.gmail.com>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-10-ian.jackson@eu.citrix.com>
 <CAFLBxZapoPdDx+2rokrq0KPE_-mTgYtyE-rk4hFsvjX8g76iZQ@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 9/9] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: Wei Liu <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@gmail.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1hFTiBQQVRDSCBmb3ItNC4x
MyB2MiA5LzldIGxpYnhsL3hsOiBPdmVyaGF1bCBwYXNzdGhyb3VnaCBzZXR0aW5nIGxvZ2ljIik6
Cj4gT24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgNDoxMiBQTSBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiBMSUJYTF9QQVNTVEhST1VHSF9VTktOT1dOIChh
a2EgIkVOQUJMRUQiIGluIGFuIGVhcmxpZXIgdW5jb21taXR0ZWQKPiA+IHZlcnNpb24gb2YgdGhp
cyBjb2RlKSBpcyBkb2luZyBkb3VibGUgZHV0eS4gIFdlIGFjdHVhbGx5IG5lZWQgYWxsIG9mCj4g
PiB0aGUgZm9sbG93aW5nIHRvIGJlIHNwZWNpZmljYWJsZToKPiA+ICAgKiBkZWZhdWx0ICgidW5r
bm93biIpOiBlbmFibGUgUFQgaWZmIHdlIGhhdmUgZGV2aWNlcyB0bwo+ID4gICAgIHBhc3MgdGhy
b3VnaCBzcGVjaWZpZWQgaW4gdGhlIGluaXRpYWwgY29uZmlnIGZpbGUuCj4gCj4gSSByZWFsaXpl
IHRoaXMgbWF5IGJlIGEgYml0IGxhdGUsIGJ1dCBJIGZpbmQgInVua25vd24iIHRvIGJlIGEgdmVy
eQo+IHN0cmFuZ2Ugd29yZCB0byB1c2UgdG8gaW5kaWNhdGUsICJwbGVhc2UgY2hvb3NlIHRoZSBi
ZXN0IG9wdGlvbiBmb3IKPiBtZSIuICBGb3IgVVNCIGRldmljZSB0eXBlIEkgdXNlZCAiYXV0byIs
IG1lYW5pbmcsICJhdXRvbWF0aWNhbGx5Cj4gY2hvb3NlIHRoZSBiZXN0IG9wdGlvbiBmb3IgbWUi
LiAgUGF1bCBkaWRuJ3QgbGlrZSAiYXV0byIsIHdoaWNoIGlzCj4gZmFpciBlbm91Z2gsIGJ1dCBJ
IHJlYWxseSBkb24ndCBzZWUgaG93ICJ1bmtub3duIiBpcyBiZXR0ZXIuCj4gCj4gQW55d2F5LCBu
b3QgbWVhbmluZyB0byBibG9jaywganVzdCBhIHN1Z2dlc3Rpb24uCgpJIGRvIG5vdCBoYXZlIGEg
c3Ryb25nIG9waW5pb24gYWJvdXQgdGhpcy4gIEkgd291bGQgYmUgaGFwcHkgd2l0aAoiYXV0byIg
KG9yICJkZWZhdWx0IiBtYXliZSkuCgpOb25lIG9mIHRoaXMgd2FzIGluIDQuMTIgc28gd2UgYXJl
IHN0aWxsIGZyZWUgdG8gY2hhbmdlIGl0LiAgTm93IHdvdWxkCmJlIHRoZSB0aW1lIQoKSWFuLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
