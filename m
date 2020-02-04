Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E5D151FD8
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 18:47:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz2Es-0006ZL-9q; Tue, 04 Feb 2020 17:43:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I1tw=3Y=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iz2Eq-0006ZG-DB
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 17:43:52 +0000
X-Inumbo-ID: e779fc8a-4775-11ea-8396-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e779fc8a-4775-11ea-8396-bc764e2007e4;
 Tue, 04 Feb 2020 17:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580838231;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=cLCXpyHRehoqJj3fbb3fy6GOiozzqAWny0k75k42ro0=;
 b=HjirboluUw/01DfACnh/3wBKyCC6Hf2eMUhVZJO60DZZjlbXUQTR3j7N
 mLLXNU3dHHXd9zMBT0RSf83dEOI3ApgDZsSgwdb8QpQwXUpbw2JoO5u9F
 BfE9mys0IgqNmTdzCU5X3B0rAXvEFDKc50RD3t3kIJFXScF7odydhYSSJ 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rchhGzDZ+vBNCIFmOimk3ldSCUjlRpBCeyLwe1jIybUVrrXsq6Vq0/4rgf6+XpQxLybdr4LtGd
 hSFxdZMjcz7tacYj349yLpKYham1FAZJ4TqaVZb1QV3qoRXUeXI+i4VhGUgJD8Im6DsgeeLFjn
 xHzI5Nz8ezpr4a34r24aVfd1j5zQ2at2D6FGlcX5W0RFsFQaFFD7p8cPY6g9dcF5kjfARvV6dO
 j01QEUpgtQi01+3DxPkNauWOl59tn2ZwJxz4FBxPlIroHH4Qbepv/nNLOpJvrzqAQNY897V/dE
 tgM=
X-SBRS: 2.7
X-MesageID: 12550002
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,402,1574139600"; d="scan'208";a="12550002"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1580830825-18767-1-git-send-email-igor.druzhinin@citrix.com>
 <1580830825-18767-2-git-send-email-igor.druzhinin@citrix.com>
 <20200204171701.GM4679@Air-de-Roger>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <55a7f103-93fe-ceda-67e0-92ece808d542@citrix.com>
Date: Tue, 4 Feb 2020 17:43:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200204171701.GM4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] x86/shim: suspend and resume platform
 time correctly
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDIvMjAyMCAxNzoxNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEZl
YiAwNCwgMjAyMCBhdCAwMzo0MDoyNFBNICswMDAwLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4g
U2ltaWxhcmx5IHRvIFMzLCBwbGF0Zm9ybSB0aW1lIG5lZWRzIHRvIGJlIHNhdmVkIG9uIGd1ZXN0
IHN1c3BlbmQKPj4gYW5kIHJlc3RvcmVkIG9uIHJlc3VtZSByZXNwZWN0aXZlbHkuIFRoaXMgc2hv
dWxkIGFjY291bnQgZm9yIGV4cGVjdGVkCj4+IGp1bXBzIGluIFBWIGNsb2NrIGNvdW50ZXIgdmFs
dWUgYWZ0ZXIgcmVzdW1lLiB0aW1lX3N1c3BlbmQvcmVzdW1lKCkKPj4gYXJlIHNhZmUgdG8gdXNl
IGluIFBWSCBzZXR0aW5nIGFzIGlzIHNpbmNlIGFueSBleGlzdGluZyBvcGVyYXRpb25zCj4+IHdp
dGggUElUIHRoYXQgdGhleSBkbyB3b3VsZCBzaW1wbHkgYmUgaWdub3JlZCB0aGVyZS4KPiAKPiBU
aGVyZSdzIGFsc28gYW4gYXR0ZW1wdCB0byBmaWRkbGUgd2l0aCBIUEVULCB3aGljaCBJIHRoaW5r
IGl0J3MganVzdCBhCj4gbm8tb3AuCj4gCj4gSnVzdCB0byBiZSBvbiB0aGUgc2FmZSBzaWRlIGl0
IG1pZ2h0IGJlIGJldHRlciB0byBwYXNzIGEgbmV3IHBhcmFtZXRlcgo+IHRvIHRpbWVfcmVzdW1l
IGluIG9yZGVyIHRvIHNpZ25hbCB3aGV0aGVyIFBJVC9IUEVUIHNob3VsZCBldmVuIGJlCj4gYXR0
ZW1wdGVkIHRvIGJlIHJlc3VtZWQ/CgpCb3RoIG9mIHByZWluaXRfcGl0KCkgYW5kIF9kaXNhYmxl
X3BpdF9pcnEoKSBhbHJlYWR5IGNhbGxlZCBpbiBQViBzaGltCmR1cmluZyBib290LiBTbyBpdCBt
aWdodCBiZSBiZXR0ZXIgdG8gaW5jbHVkZSBhIGNvbmRpdGlvbiByaWdodCBpbnNpZGUKdGhlbSB0
byBjb3ZlciB0aGF0IGNhc2UgYXMgd2VsbC4KCklnb3IKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
