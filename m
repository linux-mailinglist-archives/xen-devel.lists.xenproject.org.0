Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA111A1B54
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 15:24:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3KMu-0004FS-5u; Thu, 29 Aug 2019 13:21:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mvu2=WZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i3KMs-0004FN-W5
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 13:21:39 +0000
X-Inumbo-ID: ee16a8b0-ca5f-11e9-ae67-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee16a8b0-ca5f-11e9-ae67-12813bfff9fa;
 Thu, 29 Aug 2019 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567084897;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=97bAqZSeGDedZJRPkWWg8EOEjaqjmiub4FBWJwVW3GU=;
 b=QTsBH+rL8I8YkjIv106Edng/ti5KNGuG3dUZWwABQU0zZ7OHoV1doPxn
 bAcbgkpCRroCy8Dg3xwokU9TSFQSyJzP4jNaH6e9LqGaJeAaPa4WSxjwA
 zrdwKLz4qoK11NA5qPOGCXbF1mQ+/IEW6xUya9kn29Owr5XuFWgOOpDVi s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yjXJ2MrsiqbLUJwQppTg1K4/pkLkfoMmlc3Mp3EhjIaqfzwQOGYYc7ZlLY1/0k4sX0gfK2miXN
 /GO4pO9Jro6GwfrMqwwX6PWu68mFi7szxh+RjD3ruh4uWNnCEGAzbkNmLahRcZvb+2AOvdwlJm
 WpmKtTb5QxG2kgqxuM37OEDZTtgsROpql+JgkI66YJFUwLAtnVjnMQin3MBe8yLzbL9Mflzhez
 Pk3FJB9e+XJL4vMJDbAsjwZNseSnz6L2RF57HeE1oExpZKA0JZx1IfAlZdFeSU+ZDH3ENM4DXE
 XN8=
X-SBRS: 2.7
X-MesageID: 5103630
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,443,1559534400"; 
   d="scan'208";a="5103630"
To: Jan Beulich <jbeulich@suse.com>
References: <f42b05e7-22de-64b0-0486-c087bde57747@suse.com>
 <95c5ada0-5b77-072f-7ad5-c78c20c3f760@citrix.com>
 <d96c8af0-f70f-03ad-c058-c1f46114846a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e5d14e95-01ee-5879-88b6-1d63610ec490@citrix.com>
Date: Thu, 29 Aug 2019 14:21:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d96c8af0-f70f-03ad-c058-c1f46114846a@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86: properly gate clearing of PKU feature
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
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMDgvMjAxOSAxNDoxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMDguMjAxOSAx
Mjo0NiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjkvMDgvMjAxOSAxMDoyNywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBzZXR1cF9jbGVhcl9jcHVfY2FwKCkgaXMgX19pbml0IGFuZCBoZW5j
ZSBtYXkgbm90IGJlIGNhbGxlZCBwb3N0LWJvb3QuCj4+PiBOb3RlIHRoYXQgb3B0X3BrdSBuZXZl
cnRoZWxlc3MgaXMgbm90IGdldHRpbmcgX19pbml0ZGF0YSBhZGRlZCAtIHNlZQo+Pj4gZS5nLiBj
b21taXQgNDNmYTk1YWU2YSAoIm1tOiBtYWtlIG9wdF9ib290c2NydWIgbm9uLWluaXQiKS4KPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IEFj
a2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pgo+PiBI
b3dldmVyLCBJJ20gdGVtcHRlZCB0byBzdWdnZXN0IHRoYXQgdGhpcyBsb2dpYyBkaXNhcHBlYXJz
IGVudGlyZWx5LsKgCj4+IEdpdmVuIHRoYXQgd2UgZG9uJ3Qgc3VwcG9ydCBpdCBmb3IgUFYgZ3Vl
c3RzLCBhbmQgY2FuJ3Qgd2l0aG91dCB0YWtpbmcgYQo+PiBDUjQgd3JpdGUgb24gdG9nZ2xlX2tl
cm5lbF9tb2RlKCksIGFsbCB0aGlzIGFjdHVhbGx5IGNvbnRyb2xzIGlzIHdoZXRoZXIKPj4gdGhl
IGJpdCBmaW5kcyBpdHMgd2F5IGludG8gdGhlIEhWTSBtYXggcG9saWN5Lgo+IFdlbGwsIGlmIHlv
dSBtZWFuIHJlcGxhY2luZyBvcHRfcGt1IGJ5IGFuIGFkZGl0aW9uIHRvCj4gcGFyc2VfeGVuX2Nw
dWlkKCksIHRoZW4gSSdsbCBiZSBoYXBweSB0byBkbyB0aGF0IGFzIGEgZm9sbG93LW9uLgo+IElm
IHRoZXJlIGlzIGFub3RoZXIgZGlyZWN0aW9uIHlvdSd2ZSBiZWVuIGNvbnNpZGVyaW5nLCB0aGVu
Cj4geW91J2QgaGF2ZSB0byBhdCBsZWFzdCBvdXRsaW5lIGl0LgoKV2VsbCAtIEkgZGlkIHNheSAi
ZGlzYXBwZWFyIGVudGlyZWx5Ii7CoCBJIGRvbid0IHNlZSBpdCBhcyBoYXZpbmcsIG9yCmxpYWJs
ZSB0byBnYWluLCBhbnkgdXNlZnVsIHB1cnBvc2UuCgpJbiByZWFsaXR5LCBpdCB3YXMgc3Vic3Vt
ZWQgaW50byBjcHVpZD0gYnkgbXkgcGF0Y2ggdG8gYWxsb3cgYWxsIGJpdHMgdG8KYmUgdHdlYWst
YWJsZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
