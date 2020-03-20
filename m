Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED0818D0D2
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 15:30:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFIcv-0008Hz-LA; Fri, 20 Mar 2020 14:27:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EUly=5F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jFIct-0008Hm-MF
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 14:27:55 +0000
X-Inumbo-ID: fcb44164-6ab6-11ea-b34e-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcb44164-6ab6-11ea-b34e-bc764e2007e4;
 Fri, 20 Mar 2020 14:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584714475;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=XwC/XfHY+fI1tyhWpSHTC0e/eZxI0/mdu26ApHWMk34=;
 b=DTAIKiEAaLrBkVdHE+MVVN3dU/F2dS7zontHe572xs+nhcEk9o+/Lt6r
 NsxMe3CN/49YKl6jlJnR3ik+K8V2Bg98WfoxEzcNkp86DkifvdGoWcmb2
 K0n1mgKC3Vc5cdtEsQI0tvIi62GOf9+vOTaagNP4yukAVa8DWsDYOjRy2 E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: M6LSuY1I/q7LJb7HpmxZSCBzs9mL+y5wU60Xq3icid8AOLgIVunAHBfMH/V0QGik7O1SVb2RHY
 dyI0jk2QIo/i1+deZRS93fniRbgLgQqVNoDUff4+3IPN+Qkdqcwqnlrdl7yvS5riCYvWM5kQoJ
 1crSHw7tM6ptqL8nnLWN3yGqdRioLiaizBQjkM+IIvU74kShWP5iKYtVLgAIJ8puUH0FUidtJ6
 ZXTRYpVZeckrvHTneEpmHYj75CsfGB+YD2EMw9vOELpCgBnIEbztqgomjGHAs4mfM/1iSL4qrQ
 67Y=
X-SBRS: 2.7
X-MesageID: 14355186
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,284,1580792400"; d="scan'208";a="14355186"
To: Jan Beulich <jbeulich@suse.com>
References: <20200319152622.31758-1-andrew.cooper3@citrix.com>
 <20200319152622.31758-5-andrew.cooper3@citrix.com>
 <5bc79b55-37c6-005f-2dd9-ac929d3627fb@suse.com>
 <65f58103-cb8e-3276-f8df-908cdbe152cd@citrix.com>
 <cbca0ee6-183b-9f1a-8c02-9b56012d5030@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a3c16068-e2d7-9d91-5dc3-9b623b5adccb@citrix.com>
Date: Fri, 20 Mar 2020 14:27:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <cbca0ee6-183b-9f1a-8c02-9b56012d5030@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/6] x86/ucode: Rationalise startup and
 family/model checks
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMDMvMjAyMCAxMzo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjAuMDMuMjAyMCAx
NDo0MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjAvMDMvMjAyMCAxMzozNywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxOS4wMy4yMDIwIDE2OjI2LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IERyb3AgbWljcm9jb2RlX2luaXRfe2ludGVsLGFtZH0oKSwgZXhwb3J0IHtpbnRlbCxh
bWR9X3Vjb2RlX29wcywgYW5kIHVzZSBhCj4+Pj4gc3dpdGNoIHN0YXRlbWVudCBpbiBlYXJseV9t
aWNyb2NvZGVfaW5pdCgpIHJhdGhlciB0aGFuIHByb2JpbmcgZWFjaCB2ZW5kb3IgaW4KPj4+PiB0
dXJuLiAgVGhpcyBhbGxvd3MgdGhlIG1pY3JvY29kZV9vcHMgcG9pbnRlciB0byBiZWNvbWUgbG9j
YWwgdG8gY29yZS5jLgo+Pj4+Cj4+Pj4gQXMgdGhlcmUgYXJlIG5vIGV4dGVybmFsIHVzZXJzIG9m
IG1pY3JvY29kZV9vcHMsIHRoZXJlIGlzIG5vIG5lZWQgZm9yCj4+Pj4gY29sbGVjdF9jcHVfaW5m
bygpIHRvIGltcGxlbWVudCBzYW5pdHkgY2hlY2tzLiAgTW92ZSBhcHBsaWNhYmxlIGNoZWNrcyB0
bwo+Pj4+IGVhcmx5X21pY3JvY29kZV9pbml0KCkgc28gdGhleSBhcmUgcGVyZm9ybWVkIG9uY2Us
IHJhdGhlciB0aGFuIHJlcGVhdGVkbHkuCj4+Pj4KPj4+PiBJdGVtcyB0byBub3RlOgo+Pj4+ICAq
IFRoZSBBTUQgdWNvZGUgZHJpdmVyIGRvZXMgaGF2ZSBhbiB1cHBlciBmYW1pbGl5IGxpbWl0IG9m
IDB4MTcsIGFzIGEgc2lkZQo+Pj4+ICAgIGVmZmVjdCBvZiB0aGUgbG9naWMgaW4gdmVyaWZ5X3Bh
dGNoX3NpemUoKSB3aGljaCBkb2VzIG5lZWQgdXBkYXRpbmcgZm9yCj4+Pj4gICAgZWFjaCBuZXcg
bW9kZWwuCj4+PiBJIGRvbid0IHNlZSB0aGlzIGJlaW5nIHRoZSBjYXNlLCBhbmQgaGVuY2UgSSB0
aGluayBpdCBpcyB0aGlzIHBhdGNoCj4+PiB3aGljaCBpbnRyb2R1Y2VzIHN1Y2ggYSByZXN0cmlj
dGlvbi4gQXMgbG9uZyBhIHBhdGNoZXMgYXJlIGxlc3MKPj4+IHRoYW4gMmssIGFsbCB1bnNwZWNp
ZmllZCBmYW1pbGllcyBhcmUgc3VwcG9ydGVkIGJ5IHZlcmlmeV9wYXRjaF9zaXplKCkKPj4+IHRo
cm91Z2ggaXRzIGRlZmF1bHQ6IGNhc2UgbGFiZWwuIChBcmd1YWJseSB0aGUgbmFtZSBGMVhIX01Q
Ql9NQVhfU0laRQo+Pj4gZG9lc24ndCByZWFsbHkgZml0IGhvdyBpdCBpcyBiZWluZyB1c2VkLikK
Pj4+Cj4+PiBJJ20gaGFwcHkgYWJvdXQgYWxsIG90aGVyIGNoYW5nZXMgbWFkZSBoZXJlLgo+PiBM
aW51eCBhY3R1YWxseSBoYXMgYSBkaWZmZXJlbnQgYWxnb3JpdGhtIHdoaWNoIGRyb3BzIGxlbmd0
aCByZXN0cmljdGlvbnMKPj4gb24gRmFtMTVoIGFuZCBsYXRlciwgc28gdGhleSBnZXQgZm9yd2Fy
ZCBjb21wYXRpYmlsaXR5IHRoYXQgd2F5Lgo+IElmIHRoYXQncyB3aGF0IEFNRCBtYW5kYXRlcy9z
dWdnZXN0cywgd2Uge2Msc2h9b3VsZCBjb25zaWRlciBkb2luZwo+IHNvIHRvby4gSSB0aG91Z2h0
IHRob3VnaCB0aGF0IHRoZXNlIGxlbmd0aCByZXN0cmljdGlvbnMgd2VyZSBhY3R1YWxseQo+IHB1
dCBpbiBieSBBTUQgZm9sa3MuCgpJdHMgb24gdGhlIGxpc3Qgb2YgcXVlc3Rpb25zLi4uCgo+PiBX
b3VsZCB5b3UgYmUgaGFwcHkgaWYgSSBkcm9wcGVkIGp1c3QgdGhpcyBhc3BlY3Qgb2YgdGhlIHBh
dGNoLCBhbmQgZGVmZXIKPj4gQU1EIGFkanVzdG1lbnRzIHRvIGEgbGF0ZXIgc2V0IG9mIGNoYW5n
ZXM/Cj4gWWVzLCBhcyBzYWlkIC0gZXZlcnl0aGluZyBlbHNlIGxvb2tlZCBnb29kIHRvIG1lLgoK
Q2FuIEkgdGFrZSB0aGF0IGFzIGFuIEEtYnkgdGhlbiwgdG8gc2F2ZSBwb3N0aW5nIHRoZSBwYXRj
aCBhZ2Fpbj8KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
