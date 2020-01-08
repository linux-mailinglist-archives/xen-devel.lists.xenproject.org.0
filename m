Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DF9134BA6
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 20:45:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipHCk-0008Vp-Ah; Wed, 08 Jan 2020 19:41:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/AM3=25=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipHCi-0008Vk-5R
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 19:41:20 +0000
X-Inumbo-ID: d6f2f4a3-324e-11ea-b8a1-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6f2f4a3-324e-11ea-b8a1-12813bfff9fa;
 Wed, 08 Jan 2020 19:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578512479;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=rM2vhUO619eysCiQ//3h9QYC2hIk8A2QuRdmcWs6AYY=;
 b=D/bBZP9V50sqjwZQSSFYvhvGTtFE3krJQhbWNjSm7E7QLw8J6n/l4opq
 zZchxp4rZAHcLqzVc/1BXnj3k/S2F20S2vBLr3BaR/VESi3QL3Zb/BNhP
 4pKOvRU9ODyvrvwpf8wFcdwA1+m2QWlANRo2Ug+sOLsOjOVAh0MTLOZyi U=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yjfjQqEn2pf2+336mRD0DqIfGp+P4wskNNOmt++5NgCVLgol+RkhE4N61gqIY/gMUAMsTIzFVd
 ZsOftw36S61hSyOci1gZnq8mOOOQxRgWqOQvI6kT3QAwRXMLglrT8iMNfi8MMfoIg4NNoRrRwK
 9nv3KHDgxeSEmsDfdLIX85H8sON96bGQIUIm4jcOgiyiBJAp1y6A1leopNc2z0pApruFHwBfh6
 X8BFq4aqYf6a+4joWAPQJfgG6iznzXOfJJJn3x4PpBKtz4C8hq6DAMPySwxjRTefYXUiKG9Q6s
 bLA=
X-SBRS: 2.7
X-MesageID: 10633439
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,411,1571716800"; d="scan'208";a="10633439"
To: Jan Beulich <jbeulich@suse.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-4-andrew.cooper3@citrix.com>
 <2c6f5ae6-004d-8beb-61c8-c988930ed318@suse.com>
 <67a1bb81-98ee-bb1c-5634-fd1d9c66098d@citrix.com>
 <874e7240-58e6-dfe4-5d12-860260d83800@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <efdf3015-6be3-34a8-d396-7c111c6a6408@citrix.com>
Date: Wed, 8 Jan 2020 19:41:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <874e7240-58e6-dfe4-5d12-860260d83800@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 3/6] x86/boot: Remove the preconstructed low
 16M superpage mappings
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

T24gMDgvMDEvMjAyMCAxMToyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAgVGhpcyB3b3VsZCB0
aGVuIGFsc28gZWFzZSBzaHJpbmtpbmcgdGhlIGJ1aWxkCj4+PiB0aW1lIG1hcHBpbmdzIGZ1cnRo
ZXIsIGUuZy4gdG8gdGhlIGxvdyAxTWIgKGluc3RlYWQgb2YgdG91Y2hpbmcKPj4+IHNldmVyYWwg
b2YgdGhlIHBsYWNlcyB5b3UgdG91Y2ggbm93LCBpdCB3b3VsZCBhZ2FpbiBtYWlubHkgYmUgYW4K
Pj4+IGFkanVzdG1lbnQgdG8gQk9PVFNUUkFQX01BUF9CQVNFLCBhbG9uZ3NpZGUgdGhlIGFzc2Vt
Ymx5IGZpbGUKPj4+IGNoYW5nZXMgbmVlZGVkKS4KPj4gLi4uIGFzIHlvdSBjb3JyZWN0bHkgaWRl
bnRpZnkgaGVyZSwgaXQgaXMgYSBwcm9wZXJ0eSBvZiB0aGUgcHJlYnVpbHQKPj4gdGFibGVzIChp
biBsP19pZGVudG1hcFtdKSwgbm90IGEgcHJvcGVydHkgb2Ygd2hlcmUgd2UgY2hvc2UgdG8gcHV0
IHRoZQo+PiBkeW5hbWljIGJvb3QgbWFwcGluZ3MgKGluIHRoZSBsP19ib290bWFwW10pLsKgIEFu
b3RoZXIgY2hhbmdlIChibG9ja2VkCj4+IGJlaGluZCB0aGUgYWJvdmUgYnVnKSBtb3ZlcyBCT09U
U1RSQVBfTUFQX0JBU0UgdG8gYmUgMUcgdG8gcmVkdWNlIHRoZQo+PiBjaGFuY2Ugb2YgYW4gb2Zm
c2V0IGZyb20gYSBOVUxMIHBvaW50ZXIgaGl0dGluZyBhIHByZXNlbnQgbWFwcGluZy4KPiBSaWdo
dCwgQk9PVFNUUkFQX01BUF9CQVNFIHdhcyAoYWIpdXNlZCBmb3IgYSAybmQgcHVycG9zZS4gQnV0
IHRoaXMKPiB3b3VsZCBiZXR0ZXIgYmUgZGVhbHQgd2l0aCBieSBpbnRyb2R1Y2luZyBhIG5ldyBt
YW5pZmVzdCBjb25zdGFudAo+IChlLmcuIFBSRUJVSUxUX01BUF9MSU1JVCkgaW5zdGVhZCBvZiBv
cGVuLWNvZGluZyAyTWIgZXZlcnl3aGVyZS4KCkknbSBob3BpbmcgdG8gZ2V0IHJpZCBvZiBldmVu
IHRoaXMsIChhbHRob3VnaCBpdCBpcyBjb21wbGljYXRlZCBieQpDT05GSUdfVklERU8ncyBibGlu
ZCB1c2Ugb2YgdGhlIGxlZ2FjeSBWR0EgcmFuZ2UpLgoKPiBQbHVzIHRoZXJlJ3MgKGFpdWkpIGEg
UFJFQlVJTFRfTUFQX0xJTUlUIDw9IEJPT1RTVFJBUF9NQVBfQkFTRQo+IHJlcXVpcmVtZW50LCB3
aGljaCB3b3VsZCBiZXR0ZXIgYmUgdmVyaWZpZWQgKGUuZy4gYnkgYSBCVUlMRF9CVUdfT04oKSkK
PiB0aGVuLgoKSXMgdGhlcmU/wqAgSSBkb24ndCBzZWUgYSByZWFsIGNvbm5lY3Rpb24gYmV0d2Vl
biB0aGUgdHdvLCBldmVuIGluIHRoaXMKcGF0Y2guCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
