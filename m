Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B08E8DAD
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 18:09:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPUxB-0006Ta-R7; Tue, 29 Oct 2019 17:06:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lo1b=YW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iPUx9-0006TV-Fh
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 17:06:43 +0000
X-Inumbo-ID: 778b2abb-fa6e-11e9-9516-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 778b2abb-fa6e-11e9-9516-12813bfff9fa;
 Tue, 29 Oct 2019 17:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572368798;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=xAGTcPgfOmPsD6x8lczcy95UDgHwBZ6unMojEqThVtE=;
 b=GlmmzojwLJwhmzusLM2szpAlShJsMmjprO1/11pWg807hfR82VVfmnF0
 P2X/8w7oAEQfOKV9gh7MMkswTy+N5I+H+ewhopgRqoAvZpMcBDpW4z0p0
 ItEJlqPZFrrNfgu4cA0/XIJz57HwWKrjxJ7QFFN5UlvNANcz1m1qqBcKu Q=;
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
IronPort-SDR: hxgM7D/t+I0LsvqnpkbCsUwXKKdKQBm4FTHgWYlx6O/EIoLLGpprg14fsG9Dg4LUsVMEwhZZ1t
 5/4bMfF92RKFH6CFOXXIUUM9Ak+Vmasz/8t/Gt78hnEK/1ZoP/YCVU0RR8USet/RA8JT66M0bP
 m294CYrZ2xgOGmPGbZmDggheNJSN/ujnQPwlU5MCnFN02E2UjnLByHhO7jMwNH3D6znIOyeZyc
 z6unGkMtG9tHvu0gkw1QcqrgS+zTGeK0qDGBfLC2XINIPFPICYOHgw97jZ+qNPabYKkYRZgC6u
 jt0=
X-SBRS: 2.7
X-MesageID: 7574186
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="7574186"
To: Jan Beulich <jbeulich@suse.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-6-andrew.cooper3@citrix.com>
 <36bbdcf7-28c3-b924-3d3a-145b6282bd0f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <1f0bd38c-d1c4-fa45-d13e-55615be4188e@citrix.com>
Date: Tue, 29 Oct 2019 17:06:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <36bbdcf7-28c3-b924-3d3a-145b6282bd0f@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 5/7] x86/livepatch: Fail the build if
 duplicate symbols exist
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, Norbert Manthey <nmanthey@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQvMTAvMjAxOSAxMzowMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjMuMTAuMjAxOSAx
NTo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnCj4+
ICsrKyBiL3hlbi9jb21tb24vS2NvbmZpZwo+PiBAQCAtMzYxLDkgKzM2MSwyMyBAQCBjb25maWcg
RkFTVF9TWU1CT0xfTE9PS1VQCj4+ICAKPj4gIAkgIElmIHVuc3VyZSwgc2F5IFkuCj4+ICAKPj4g
K2NvbmZpZyBFTkZPUkNFX1VOSVFVRV9TWU1CT0xTCj4+ICsJYm9vbCAiRW5mb3JjZSB1bmlxdWUg
c3ltYm9scyIgaWYgTElWRVBBVENICj4+ICsJZGVmYXVsdCB5IGlmIExJVkVQQVRDSAo+IEluc3Rl
YWQgb2YgdHdvIGlkZW50aWNhbCAiaWYiLCB3aHkgbm90ICJkZXBlbmRzIG9uIExJVkVQQVRDSCI/
Cj4KPj4gKwktLS1oZWxwLS0tCj4+ICsJICBNdWx0aXBsZSBzeW1ib2xzIHdpdGggdGhlIHNhbWUg
bmFtZSBhcmVuJ3QgZ2VuZXJhbGx5IGEgcHJvYmxlbQo+PiArCSAgdW5sZXNzIExpdmUgcGF0Y2hp
bmcgaXMgdG8gYmUgdXNlZC4KPj4gKwo+PiArCSAgTGl2ZXBhdGNoIGxvYWRpbmcgaW52b2x2ZXMg
cmVzb2x2aW5nIHJlbG9jYXRpb25zIGFnYWluc3Qgc3ltYm9sCj4+ICsJICBuYW1lcywgYW5kIGF0
dGVtcHRpbmcgdG8gYSBkdXBsaWNhdGUgc3ltYm9sIGluIGEgbGl2ZXBhdGNoIHdpbGwKPj4gKwkg
IHJlc3VsdCBpbiBpbmNvcnJlY3QgbGl2ZXBhdGNoIGFwcGxpY2F0aW9uLgo+PiArCj4+ICsJICBU
aGlzIG9wdGlvbiBzaG91bGQgYmUgdXNlZCB0byBlbnN1cmUgdGhhdCBhIGJ1aWxkIG9mIFhlbiBj
YW4gaGF2ZSBhCj4+ICsJICBsaXZlcGF0Y2ggYnVpbGQgYW5kIGFwcGx5IGNvcnJlY3RseS4KPj4g
Kwo+PiAgY29uZmlnIFNVUFBSRVNTX0RVUExJQ0FURV9TWU1CT0xfV0FSTklOR1MKPj4gLQlib29s
ICJTdXBwcmVzcyBkdXBsaWNhdGUgc3ltYm9sIHdhcm5pbmdzIiBpZiAhTElWRVBBVENICj4+IC0J
ZGVmYXVsdCB5IGlmICFMSVZFUEFUQ0gKPj4gKwlib29sICJTdXBwcmVzcyBkdXBsaWNhdGUgc3lt
Ym9sIHdhcm5pbmdzIiBpZiAhRU5GT1JDRV9VTklRVUVfU1lNQk9MUwo+PiArCWRlZmF1bHQgeSBp
ZiAhRU5GT1JDRV9VTklRVUVfU1lNQk9MUwo+IFNpbWlsYXJseSBoZXJlIHRoZW4uIFdpdGggdGhp
cyBjaGFuZ2VkLCBvciB3aXRoIGEgcHJvcGVyIHJlYXNvbgo+IHN1cHBsaWVkCj4gUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoYXQncyBhIHF1ZXN0aW9uIGZv
ciB0aGUgYXV0aG9yIG9mIGMvcyAwNjRhMjY1MjIzMyB0byBhbnN3ZXIuLi7CoCBJJ20KbWVyZWx5
IGZvbGxvd2luZyB0aGUgcHJldmFpbGluZyBzdHlsZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
