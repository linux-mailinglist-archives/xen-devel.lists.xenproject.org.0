Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0A0B5649
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 21:37:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAJGc-0005t9-D2; Tue, 17 Sep 2019 19:36:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zlRc=XM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iAJGa-0005sy-E1
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 19:36:00 +0000
X-Inumbo-ID: 5faf3952-d982-11e9-961f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5faf3952-d982-11e9-961f-12813bfff9fa;
 Tue, 17 Sep 2019 19:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568748960;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=BD9okaO3bDuRQYhJiWBhzJ6/gjpSnf5TUZWm8mLqREc=;
 b=XmXq3dDGb56Bk5xpAqR4Tz4zZqyXwlcOuztLkec6V5DotNFAoS4NV5zC
 W4RdaZZL1XECrgM0nIy+r8fkmJG4Wiw9Wz252Vujbr3Q6NT+a3SxKTHvB
 sYN6cP1s6OwoS0Kcn0moAa85hSsWoI7L9pv5VKgaJj1Z2581gYfGRIOGe 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: C6+jz0n+G0ufSvUGwk6Abj2CIl0tgPBf2WcAgpqbHfzVGSyFpiWSklmP1mXhjUXEd6FA4HafbH
 KLSJYSlw9EAtVH4+xx2b1WJwkVsIf9kJZgdsK0awELojVkwml15fOkYbyweH3TMVhjy4FGnZcM
 rBmIWyyLxBQYB6wGx1F6LtWB18/OkEc1MgXHeveiBs4n6CuldH3mMzV4wWJShDD2rI23VRNQg0
 AUTnp8WlNycDjx9VuOapzudOLXHCQ4idD7IUXSUrHTRtCUjrCp/r3azzIx3uXD1YqfgEP+8XhQ
 pPw=
X-SBRS: 2.7
X-MesageID: 5692961
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5692961"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
 <46ce7d1a-2a04-726c-919b-2d8bb4844391@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <cb6f6672-7b81-d901-36da-5292bcf45bad@citrix.com>
Date: Tue, 17 Sep 2019 20:35:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <46ce7d1a-2a04-726c-919b-2d8bb4844391@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 5/9] x86/HVM: refuse CR3 loads with
 reserved (upper) bits set
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDkvMjAxOSAwNzoxNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hpbGUgYml0cyAxMSBh
bmQgYmVsb3cgYXJlLCBpZiBub3QgdXNlZCBmb3Igb3RoZXIgcHVycG9zZXMsIHJlc2VydmVkCj4g
YnV0IGlnbm9yZWQsIGJpdHMgYmV5b25kIHBoeXNpY2FsIGFkZHJlc3Mgd2lkdGggYXJlIHN1cHBv
c2VkIHRvIHJhaXNlCj4gZXhjZXB0aW9ucyAoYXQgbGVhc3QgaW4gdGhlIG5vbi1uZXN0ZWQgY2Fz
ZTsgSSdtIG5vdCBjb252aW5jZWQgdGhlCj4gY3VycmVudCBuZXN0ZWQgU1ZNL1ZNWCBiZWhhdmlv
ciBvZiByYWlzaW5nICNHUCgwKSBoZXJlIGlzIGNvcnJlY3QsIGJ1dAo+IHRoYXQncyBub3QgdGhl
IHN1YmplY3Qgb2YgdGhpcyBjaGFuZ2UpLgo+Cj4gSW50cm9kdWNlIGN1cnJkIGFzIGEgbG9jYWwg
dmFyaWFibGUsIGFuZCByZXBsYWNlIG90aGVyIHYtPmRvbWFpbgo+IGluc3RhbmNlcyBhdCB0aGUg
c2FtZSB0aW1lLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KPiAtLS0KPiB2MjogU2ltcGxpZnkgdGhlIGV4cHJlc3Npb25zIHVzZWQgZm9yIHRoZSByZXNl
cnZlZCBiaXQgY2hlY2tzLgo+Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiBAQCAtMTAwNCw2ICsxMDA0LDEzIEBAIHN0YXRpYyBp
bnQgaHZtX2xvYWRfY3B1X2N0eHQoc3RydWN0IGRvbWEKPiAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPiAgICAgIH0KPiAgCj4gKyAgICBpZiAoIGN0eHQuY3IzID4+IGQtPmFyY2guY3B1aWQtPmV4
dGQubWF4cGh5c2FkZHIgKQo+ICsgICAgewo+ICsgICAgICAgIHByaW50ayhYRU5MT0dfR19FUlIg
IkhWTSVkIHJlc3RvcmU6IGJhZCBDUjMgJSMiIFBSSXg2NCAiXG4iLAo+ICsgICAgICAgICAgICAg
ICBkLT5kb21haW5faWQsIGN0eHQuY3IzKTsKPiArICAgICAgICByZXR1cm4gWDg2RU1VTF9FWENF
UFRJT047CgotRUlOVkFMLCBzdXJlbHk/CgpFdmVyeXRoaW5nIGVsc2UgTEdUTSAoYWx0aG91Z2gg
SSBndWVzcyBpdCBkZXBlbmRzIG9uIHRoZSBwcmV2aW91cwpwYXRjaD8pIHNvIHdpdGggdGhpcyBm
aXhlZCwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIKPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
