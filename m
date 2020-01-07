Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AD213296E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 15:59:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioqHm-00052l-1G; Tue, 07 Jan 2020 14:56:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tA6r=24=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1ioqHk-00052g-Tt
 for xen-devel@lists.xen.org; Tue, 07 Jan 2020 14:56:44 +0000
X-Inumbo-ID: e6833cf2-315d-11ea-bf56-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6833cf2-315d-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 14:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578408997;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=94WWG9t/Ut23KAK3A0wlWOZIAqGSbY5Z9cGYC6VSVwQ=;
 b=EVmGX0WscGCRllSYIUd4+p3k3qvjPmq5NzaS5m2rzfMg5Q7ZlCV3enKp
 NZns4xCbq/hrhX9H9xfI2FtvQqabm2KBZZn2BE5bVS72uzqSFhjMaca7E
 kzBY3AmKxFfDDVZwCoj2+9t/DkOd24f9YScXLlHL2+7yGvPiWS5LaXg4E s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vns71JnDip3T1YmINYAB2SDjisyo1T0kVhKQB+7yKC54qZHrnP6tcUef77x54fbht0A/l8Ujyt
 hFkF6rGCYuDMDtzgNL3/30VFarBTwIZKJIs1eHfoca8KhGTRaGBgPlGLDvR0rBF/O9X6i3FyBy
 1Zxl4hDFoRSQTLf8X+qYQ2YYHlD12nxnQBDaXb7GtKtjHEJvjIVnQyBJ5raSvg59El99rYnhTT
 10aakTwPRK4JrhGoMZyanQQkn0GbFx2Uv12RXxkYJJsWUcrQhO+ub3X9PsudcgTrsG1ZhNk6sV
 0xE=
X-SBRS: 2.7
X-MesageID: 10541782
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,406,1571716800"; d="scan'208";a="10541782"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <61c9b6aa-7c0d-6034-9846-ca09bb87361c@citrix.com>
 <e0986106-fe53-6a73-d70c-cd2ae1783b46@suse.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <cabed413-5ccc-f0ca-7827-868937b3c45e@citrix.com>
Date: Tue, 7 Jan 2020 14:56:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <e0986106-fe53-6a73-d70c-cd2ae1783b46@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Recent cores-scheduling failures
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
Cc: "sergey.dyasli@citrix.com >> Sergey
 Dyasli" <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMTIvMjAxOSAwNjoyNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxOS4xMi4xOSAx
Mzo0NSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gSGkgSnVlcmdlbiwKPj4KPj4gV2UgcmVjZW50
bHkgZGlkIGFub3RoZXIgcXVpY2sgdGVzdCBvZiBjb3JlIHNjaGVkdWxpbmcgbW9kZSwgYW5kIHRo
ZSBmb2xsb3dpbmcKPj4gZmFpbHVyZXMgd2VyZSBmb3VuZDoKPj4KPj4gMS4gbGl2ZS1wYXRjaCBh
cHBseSBmYWlsdXJlczoKPj4KPj4gICAgICAoWEVOKSBbIDEwNTguNzUxOTc0XSBsaXZlcGF0Y2g6
IGxwXzFfMTogVGltZWQgb3V0IG9uIHNlbWFwaG9yZSBpbiBDUFUgcXVpZXNjZSBwaGFzZSAzMC8z
MQo+PiAgICAgIChYRU4pIFsgMTA1OC43NTE5ODJdIGxpdmVwYXRjaDogbHBfMV8xIGZpbmlzaGVk
IFJFUExBQ0Ugd2l0aCByYz0tMTYKPj4KPj4gMi4gQUNQSSBTNSBjcmFzaDoKPj4KPj4gICAgICBo
dHRwczovL3Bhc3RlLmRlYmlhbi5uZXQvMTEyMTc0OC8KPgo+IEFyZSB0aGVyZSBhbnkgWGVuU2Vy
dmVyIHBhdGNoZXMgaW4geW91ciBoeXBlcnZpc29yPwo+Cj4gSSdtIGFza2luZyBiZWNhdXNlIEkg
ZG9uJ3Qgc2VlIHdoeSBhIHZjcHUgd291bGQgYmUgZnJlZWQgd2hlbiBzaHV0dGluZwo+IGRvd24g
dGhlIGhvc3QgKG90aGVyIHRoYW4gYnkgYW55IHNodXRkb3duIHNjcmlwdHMsIGJ1dCB0aG9zZSBz
aG91bGQgYmUKPiBsb25nIGZpbmlzaGVkIHdoZW4gdHJ5aW5nIHRvIGVudGVyIFM1KS4KCldoaWxl
IHdlIGhhdmUgdGhlIHBhdGNoLXF1ZXVlIGFwcGxpZWQgaW4gb3VyIHRlc3RpbmcsIHRoZXJlIGlz
IG5vdGhpbmcKdGhlcmUgdGhhdCB3b3VsZCBhZmZlY3QgdGhlIHNjaGVkdWxlciBkaXJlY3RseS4K
ClRoZSBTNSBjcmFzaCByZXByb2R1Y2VzIHJlbGlhYmx5IGluIGF1dG9tYXRlZCB0ZXN0aW5nLCBi
dXQgSSBzdGlsbCBkb24ndAprbm93IGhvdyB0byB0cmlnZ2VyIHRoZSBpc3N1ZSBtYW51YWxseS4K
Ci0tClRoYW5rcywKU2VyZ2V5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
