Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3346711889A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 13:40:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieelO-0003AT-C0; Tue, 10 Dec 2019 12:37:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jFD4=2A=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ieelM-0003AO-9U
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 12:37:12 +0000
X-Inumbo-ID: c906cb6e-1b49-11ea-88e7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c906cb6e-1b49-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 12:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575981431;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NNGIC51IM5B8BH2oU9YE/F/Lr6b+9t3EPOULcP5x7sE=;
 b=Z6A/LgQ3ybvwsX4HCKTRByNfptRFW75m3GNo3ZZiVbJOakkC37+yagdP
 inzO2/HlardS6WrI/E29SD+FM0RqlFagZ4FlvWYNE3hMTCrZC3vzxXHQu
 Y8viJ1LPn7PZ8cTze+b9l+8wP6b5Zi4NrROj1W2AodXxd6uHMn+t62YtN k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9kWpLYJOc73WbhVM6BEBzihEn86NiBWwJ8Ws9WmjU4cNFTP7MAzp4PRxLt0pEMFK9eDbJurocQ
 rIPaaK+lwMHwWE4Lcv9I6gtRtJPQCSRQHcUyHhbFQHn8tb587R+fF9sE0eg2BgUHKiLUKhKjBA
 +K6fm4Uydi9UlNt2cdL14w1YWrPYjTYlhAG44QicIc0SBD+KhjuzDcwwT6gJXpq/DdXXaJo1ax
 aMLWYKa//mbv0ju/xUpmvdI+ceUPEysMJsNHwDiQNvEspW1Gh725p1gkJuGWZHEXhqPTUQjKno
 I5Y=
X-SBRS: 2.7
X-MesageID: 9808576
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,299,1571716800"; 
   d="scan'208";a="9808576"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
References: <1575417367-12822-1-git-send-email-igor.druzhinin@citrix.com>
 <1042aef4-c873-6cf9-c7b4-cca1214d61af@suse.com>
 <df136147-76f4-841c-9f3e-2700fb856405@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <74022d78-e4b4-11e2-95bc-7986fe2cb76e@citrix.com>
Date: Tue, 10 Dec 2019 12:37:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <df136147-76f4-841c-9f3e-2700fb856405@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] x86/AMD: unbreak CPU hotplug on AMD
 systems without RstrFpErrPtrs
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, roger.pau@citrix.com,
 wl@xen.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMTIvMjAxOSAxMDoyNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMC4xMi4xOSAx
MToxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA0LjEyLjIwMTkgMDA6NTYsIElnb3IgRHJ1
emhpbmluIHdyb3RlOgo+Pj4gSWYgdGhlIGZlYXR1cmUgaXMgbm90IHByZXNlbnQgWGVuIHdpbGwg
dHJ5IHRvIGZvcmNlIFg4Nl9CVUdfRlBVX1BUUlMKPj4+IGZlYXR1cmUgYXQgQ1BVIGlkZW50aWZp
Y2F0aW9uIHRpbWUuIFRoaXMgaXMgZXNwZWNpYWxseSBub3RpY2VhYmxlIGluCj4+PiBQVi1zaGlt
IHRoYXQgdXN1YWxseSBob3RwbHVncyBpdHMgdkNQVXMuIFdlIGVpdGhlciBuZWVkIHRvIHJlc3Ry
aWN0Cj4+PiB0aGlzCj4+PiBhY3Rpb24gZm9yIGJvb3QgQ1BVIG9ubHkgb3IgYWxsb3cgc2Vjb25k
YXJ5IENQVXMgdG8gbW9kaWZ5Cj4+PiBmb3JjZWQgQ1BVIGNhcGFiaWxpdGllcyBhdCBydW50aW1l
LiBDaG9vc2UgdGhlIGZvcm1lciBzaW5jZSBtb2RpZnlpbmcKPj4+IGZvcmNlZCBjYXBhYmlsaXRp
ZXMgb3V0IG9mIGJvb3QgcGF0aCBsZWF2ZXMgdGhlIHN5c3RlbSBpbiBwb3RlbnRpYWxseQo+Pj4g
aW5jb25zaXN0ZW50IHN0YXRlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmlu
IDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgo+Pgo+PiBJJ3ZlIGNvbW1pdHRlZCB0aGlzIHRv
IHVuc3RhYmxlLCBhcyBwZXIgdGhlIG91dGNvbWUgb2YgdGhlCj4+IGNvbW11bml0eSBjYWxsLgoK
V2hhdCBvdXRjb21lP8KgIFllcyB0ZWNobmljYWxseSB5b3VyIFItYnkgaXMgc3VmZmljaWVudCB0
byBnZXQgdGhlIHBhdGNoCmluLCBidXQgeW91IGtub3cgdmVyeSB3ZWxsIHRoZXJlIGFyZSBvcGVu
IG9iamVjdGlvbnMgYWdhaW5zdCB0aGlzCnZlcnNpb24gb2YgdGhlIHBhdGNoLgoKQWxzbywgeW91
J3JlIGFjdHVhbGx5IGluIGEgcG9zaXRpb24gd2hlcmUgeW91IGFyZSByZXZpZXdpbmcgeW91ciBv
d24Kd29yaywgd2hpY2ggaXMgbm90IGhvdyBSLWJ5IGlzIGludGVuZGVkIHRvIHdvcmsuCgpGdXJ0
aGVybW9yZSwgeW91IHdpbGwgb2JzZXJ2ZSB0aGF0IHRoZXJlIGlzIGFuIGFjdGlvbiBpdGVtIG9u
IG1lIGZyb20KdGhlIGNhbGwgdG8gY29tZSB1cCB3aXRoIGEgbGVzcyBicm9rZW4gYWx0ZXJuYXRp
dmUgd2hpY2ggSSdtIGdlbnVpbmVseQphdHRlbXB0aW5nIHRvIGRvLgoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
