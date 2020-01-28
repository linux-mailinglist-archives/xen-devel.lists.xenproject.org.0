Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B628314B31C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 11:58:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwOWQ-0007CU-VK; Tue, 28 Jan 2020 10:55:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z4m8=3R=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iwOWO-0007CO-J3
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 10:55:04 +0000
X-Inumbo-ID: a30a2df4-41bc-11ea-8660-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a30a2df4-41bc-11ea-8660-12813bfff9fa;
 Tue, 28 Jan 2020 10:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580208903;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zYFAMJ4GvmCR9tyKG2LzTmySgc6wbCGWZfPUHYluUN8=;
 b=KIXpLO5gD18mPxmJW0if0eavgmoqEo6nEqJ74erSPvJqDJkGhYoBkQRq
 pv3cQlJdjikQh8bX/90kkskNS6xJ4nhJ4U7ahfZfJEWSZ1/E/Fa55gAiN
 tuH2S5vBtWgJCoygdcPdm6c8jmtT4lUn8qLAt5noTq0hZiQxIWL81EfOu w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rhg2JWdbkyu9VDcKlMfsqVhsKaYYU6alaboi33pt+BCD4Ur/X8CmTKsXBR9mi5t6jD4qLnp5mY
 Jxtu+51ux67TaIGAjiXRu7azUAv29feBJoKGbV/ZYNuwGjdSqy0Ecnf9KQWjuhFxRj8dtcxIjF
 mY5Se7GCqsCNwAXRyEdr4BERylSmAp8pfpehVoRwYJ3fgFdhxZxJHQWpALASnkCPZZx0Gd22Iv
 gJx6lVyOhr6cJNC++GJO/Tr1ysf6WeXE7CGs78DdYCtO5xOmyYPbkpakMr3Bqav+NP9hwyYzN8
 2BE=
X-SBRS: 2.7
X-MesageID: 11911847
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,373,1574139600"; d="scan'208";a="11911847"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1580160556-25621-1-git-send-email-igor.druzhinin@citrix.com>
 <20200128104528.GL57924@desktop-tdan49n.eng.citrite.net>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <c73bbc90-0037-3ce3-e278-3563101d32ea@citrix.com>
Date: Tue, 28 Jan 2020 10:55:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200128104528.GL57924@desktop-tdan49n.eng.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/suspend: disable watchdog before
 calling console_start_sync()
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDEvMjAyMCAxMDo0NSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIEph
biAyNywgMjAyMCBhdCAwOToyOToxNlBNICswMDAwLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4g
Li4uIGFuZCBlbmFibGUgaXQgYWZ0ZXIgZXhpdGluZyBTLXN0YXRlLiBPdGhlcndpc2UgYWNjdW11
bGF0ZWQKPj4gb3V0cHV0IGluIHNlcmlhbCBidWZmZXIgbWlnaHQgZWFzaWx5IHRyaWdnZXIgdGhl
IHdhdGNoZG9nIGlmIGl0J3MKPj4gc3RpbGwgZW5hYmxlZCBhZnRlciBlbnRlcmluZyBzeW5jIHRy
YW5zbWlzc2lvbiBtb2RlLgo+IAo+IENhbid0IHlvdSBqdXN0IHByb2Nlc3MgdGhlIHdhdGNoZG9n
IGluIHNlcmlhbF9zdGFydF9zeW5jIGluc3RlYWQgb2YKPiBkaXNhYmxpbmcgaXQ/CgpJIHRoaW5r
IGl0IHdvdWxkIGJlIGxheWVyaW5nIHZpb2xhdGlvbi4gUGx1cyBpbiBldmVyeSBvdGhlciBwbGFj
ZSB3ZSdyZQplbmFibGluZyBzeW5jIG1vZGUgd2UncmUgYWxzbyBkaXNhYmxpbmcgd2F0Y2hkb2cg
YXMgd2VsbC4KCkkgYWxzbyB0aGluayBpdCdzIGJlbmVmaWNpYWwgdG8gZGlzYWJsZSB3YXRjaGRv
ZyBiZWZvcmUgZW50ZXJpbmcgZmlybXdhcmUuCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
