Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026C8A9BB6
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 09:25:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5m68-00018g-AT; Thu, 05 Sep 2019 07:22:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QhBR=XA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i5m67-00018a-DO
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 07:22:27 +0000
X-Inumbo-ID: e5d47512-cfad-11e9-abc0-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5d47512-cfad-11e9-abc0-12813bfff9fa;
 Thu, 05 Sep 2019 07:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567668140;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=4rbOoBSgs1r9JFyKpVWCmsmIHHl5h7ZxQHAR82hEbuc=;
 b=dERuytO69hJu3BKS6HqIcCfVNBg+EG0lBTFe0vWEGpLjGTA09wOfzHK3
 Jj6dUaUkPeOEd37tCQFNXkJmTWHW76EoPVcleBQfFa+bP/x3G65ghFTeS
 EOP1h9ttZ0tsHV3jU5z2RUwqxE47SiAosf4tZR/3896lEvSkfxC+IS6cQ Y=;
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
IronPort-SDR: RnJylTioxeDAsyDnXqb3rB42KH0JISQpSBZHCHz3xNDrR4uD/KvtkN2N/S0UDixupsjSBFIy3U
 BRdu50wo6m0wTqY4OUUL1YvJA3Wu/Qn4k+3U/n4IsGUpN4lWDdoOUfaGxaeqe3vBA0evVunW3N
 4nHkke7TvGlcaK1xO6gb3o/RGkVyecEhM/wEQobFXBohGOFHuIpqOewTuErmIKlMgpdIp8yGrE
 t1rB1+l9W/83Kr4FAvGP5hLunxmoUvtZfP+PQCWQ8zEEa2RD9YrPMTaAxX9+kaKv/b8bLKkDXP
 /Hg=
X-SBRS: 2.7
X-MesageID: 5391169
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,469,1559534400"; 
   d="scan'208";a="5391169"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <81569b49-5121-89b2-1002-0a9b14b9d1dd@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <3ea665bb-5dc3-4d63-949c-29e49254e4ed@citrix.com>
Date: Thu, 5 Sep 2019 08:22:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <81569b49-5121-89b2-1002-0a9b14b9d1dd@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/cpu-policy: work around bogus warning
 in test harness
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
Cc: Christopher Clark <christopher.w.clark@gmail.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDkvMjAxOSAwNzoxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRGVzcGl0ZSAlLjEycyBw
cm9wZXJseSBsaW1pdGluZyB0aGUgbnVtYmVyIG9mIGNoYXJhY3RlcnMgcmVhZCBmcm9tCj4gaWRl
bnRbXSwgZ2NjIDkgKGF0IGxlYXN0IHVwIHRvIDkuMi4wKSB3YXJucyBhYm91dCB0aGUgc3RyaW5n
cyBub3QKPiBiZWluZyBudWwtdGVybWluYXRlZDoKPgo+IHRlc3QtY3B1LXBvbGljeS5jOjY0OjE4
OiBlcnJvcjogJyUuMTJzJyBkaXJlY3RpdmUgYXJndW1lbnQgaXMgbm90IGEgbnVsLXRlcm1pbmF0
ZWQgc3RyaW5nIFstV2Vycm9yPWZvcm1hdC1vdmVyZmxvdz1dCj4gICAgNjQgfCAgICAgICAgICAg
ICBmYWlsKCIgIFRlc3QgJyUuMTJzJywgZXhwZWN0ZWQgdmVuZG9yICV1LCBnb3QgJXVcbiIsCj4g
ICAgICAgfCAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KPiB0ZXN0LWNwdS1wb2xpY3kuYzoyMDoxMjogbm90ZTogaW4gZGVmaW5p
dGlvbiBvZiBtYWNybyAnZmFpbCcKPiAgICAyMCB8ICAgICBwcmludGYoZm10LCAjI19fVkFfQVJH
U19fKTsgICAgICAgICAgICAgICAgIFwKPiAgICAgICB8ICAgICAgICAgICAgXn5+Cj4gdGVzdC1j
cHUtcG9saWN5LmM6NjQ6Mjc6IG5vdGU6IGZvcm1hdCBzdHJpbmcgaXMgZGVmaW5lZCBoZXJlCj4g
ICAgNjQgfCAgICAgICAgICAgICBmYWlsKCIgIFRlc3QgJyUuMTJzJywgZXhwZWN0ZWQgdmVuZG9y
ICV1LCBnb3QgJXVcbiIsCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+
Cj4gdGVzdC1jcHUtcG9saWN5LmM6NDQ6Nzogbm90ZTogcmVmZXJlbmNlZCBhcmd1bWVudCBkZWNs
YXJlZCBoZXJlCj4gICAgNDQgfCAgICAgfSB0ZXN0c1tdID0gewo+ICAgICAgIHwgICAgICAgXn5+
fn4KPgo+IFRoZSBpc3N1ZSB3YXMgcmVwb3J0ZWQgYWdhaW5zdCBnY2MgaW4gdGhlaXIgYnVnemls
bGEgKGJ1ZyA5MTY2NykuCj4KPiBSZS1vcmRlciBhcnJheSBlbnRyaWVzLCBvZGRseSBlbm91Z2gg
c3VwcHJlc3NpbmcgdGhlIHdhcm5pbmcuCj4KPiBSZXBvcnRlZC1ieTogQ2hyaXN0b3BoZXIgQ2xh
cmsgPGNocmlzdG9waGVyLncuY2xhcmtAZ21haWwuY29tPgoKUmVwb3J0ZWQtYnk6IERhcmlvIEZh
Z2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+IGFzIHdlbGwuCgo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkkgc2VlIHlvdSBtYW5hZ2VkIHRvIGNyZWF0
ZSBhIHNtYWxsZXIgc3ludGhldGljIGV4YW1wbGUuwqAgVGhhdCBpcyBqdXN0CmJpenphcmUsIGJ1
dCBvaCB3ZWxsLgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cgo+Cj4gLS0tIGEvdG9vbHMvdGVzdHMvY3B1LXBvbGljeS90ZXN0LWNwdS1wb2xpY3ku
Ywo+ICsrKyBiL3Rvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvdGVzdC1jcHUtcG9saWN5LmMKPiBAQCAt
NDIsMTUgKzQyLDE2IEBAIHN0YXRpYyB2b2lkIHRlc3RfdmVuZG9yX2lkZW50aWZpY2F0aW9uKHYK
PiAgICAgICAgICB9Owo+ICAgICAgICAgIHVuc2lnbmVkIGludCB2ZW5kb3I7Cj4gICAgICB9IHRl
c3RzW10gPSB7Cj4gKyAgICAgICAgLyogVGhlIDFzdCBlbnRyeSBzaG91bGQgcmVtYWluIGhlcmUg
dG8gd29yayBhcm91bmQgZ2NjIGJ1ZyA5MTY2Ny4gKi8KPiArICAgICAgICB7IHsgIiIgICAgICAg
ICAgICAgfSwgWDg2X1ZFTkRPUl9VTktOT1dOIH0sCj4gKyAgICAgICAgeyB7ICIgICAgICAgICAg
ICAiIH0sIFg4Nl9WRU5ET1JfVU5LTk9XTiB9LAo+ICsgICAgICAgIHsgeyAieHh4eHh4eHh4eHh4
IiB9LCBYODZfVkVORE9SX1VOS05PV04gfSwKPiArCj4gICAgICAgICAgeyB7ICJHZW51aW5lSW50
ZWwiIH0sIFg4Nl9WRU5ET1JfSU5URUwgfSwKPiAgICAgICAgICB7IHsgIkF1dGhlbnRpY0FNRCIg
fSwgWDg2X1ZFTkRPUl9BTUQgfSwKPiAgICAgICAgICB7IHsgIkNlbnRhdXJIYXVscyIgfSwgWDg2
X1ZFTkRPUl9DRU5UQVVSIH0sCj4gICAgICAgICAgeyB7ICIgIFNoYW5naGFpICAiIH0sIFg4Nl9W
RU5ET1JfU0hBTkdIQUkgfSwKPiAgICAgICAgICB7IHsgIkh5Z29uR2VudWluZSIgfSwgWDg2X1ZF
TkRPUl9IWUdPTiB9LAo+IC0KPiAtICAgICAgICB7IHsgIiIgICAgICAgICAgICAgfSwgWDg2X1ZF
TkRPUl9VTktOT1dOIH0sCj4gLSAgICAgICAgeyB7ICIgICAgICAgICAgICAiIH0sIFg4Nl9WRU5E
T1JfVU5LTk9XTiB9LAo+IC0gICAgICAgIHsgeyAieHh4eHh4eHh4eHh4IiB9LCBYODZfVkVORE9S
X1VOS05PV04gfSwKPiAgICAgIH07Cj4gIAo+ICAgICAgcHJpbnRmKCJUZXN0aW5nIENQVSB2ZW5k
b3IgaWRlbnRpZmljYXRpb246XG4iKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
