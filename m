Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2666CBF8
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 11:33:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho2k5-0006ow-VE; Thu, 18 Jul 2019 09:30:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hbxb=VP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ho2k5-0006om-AL
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 09:30:25 +0000
X-Inumbo-ID: aa801c4a-a93e-11e9-889a-cf6246ca9a59
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa801c4a-a93e-11e9-889a-cf6246ca9a59;
 Thu, 18 Jul 2019 09:30:23 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dCuNeL3PSIsvTp5pgmOY6VkQF+eGqjhz6Hv1RH6slkxqERfIttZSKlTaH8dEBSe1uLLm598kUm
 hnoO63LfIcqV6AY1jRoR7V4T+A43EZfk1YBuhIt1PG09DkowmqI2FsEDJbgHnCF8VZfGPOKlli
 CQrzSm2zsM4Q4xYJPu3HOhDAk0u7PoEk8kySYUQ0v6Olp0BYaRYPhiNMW7RXYr6ahkr/r9I53C
 TokiaI368eDaTMYh/25sVCcgUkdFQ20hKBjP2UciFQ+2TYAPU3eoiLj2mHspL676wYnuM0LQVg
 sKg=
X-SBRS: 2.7
X-MesageID: 3220108
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,276,1559534400"; 
   d="scan'208";a="3220108"
To: Jan Beulich <JBeulich@suse.com>
References: <d7b10cdc-b33a-0297-458d-1bad42727fa0@suse.com>
 <18e7f37f-826e-0671-9d2c-1a33b1d1d6f3@citrix.com>
 <798637b0-2b1c-9ca0-43af-408868072eaf@suse.com>
 <20c99768-6677-c322-8a4c-cdcaefff8f02@citrix.com>
 <e5fe058b-cdba-bc41-0241-f038785a93e7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <51b8414f-f8ee-7eae-bf47-84267520dd9e@citrix.com>
Date: Thu, 18 Jul 2019 10:30:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e5fe058b-cdba-bc41-0241-f038785a93e7@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH RFC] x86emul: unconditionally deliver #UD
 for LWP insns
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

T24gMTgvMDcvMjAxOSAxMDoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTcuMDcuMjAxOSAx
OTowOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTcvMDcvMjAxOSAxNDowNywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxNy4wNy4yMDE5IDEzOjQyLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDE3LzA3LzIwMTkgMDc6NDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBXaXRo
IEFNRCBhcHBhcmVudGx5IGhhdmluZyBhYmFuZG9uZWQgWE9QIGVuY29kZWQgaW5zbnMsIGFub3Ro
ZXIgb3B0aW9uCj4+Pj4+IHdvdWxkIHNlZW0gdG8gYmUgdG8gc2ltcGx5IHdpcmUgYWxsIHVucmVj
b2duaXplZCBvbmVzIGludG8gI1VEIChyYXRoZXIKPj4+Pj4gdGhlbiByZXR1cm5pbmcgVU5JTVBM
RU1FTlRFRC9VTlJFQ09HTklaRUQpLgo+Pj4+IFRoZXJlIGFyZSBzdGlsbCBzb21lIFhPUCBpbnN0
cnVjdGlvbnMgd2hpY2ggYWN0dWFsbHkgd29yayBvbiBGYW0xN2gKPj4+PiBwcm9jZXNzb3JzLCBp
ZiB5b3UgaWdub3JlIENQVUlEIGFuZCBnbyBibGluZGx5IGV4ZWN1dGluZy4KPj4+Pgo+Pj4+IEdp
dmVuIG5vIG9mZmljaWFsIHN0YXRlbWVudCB0aGF0IFhPUCBpcyBkZWFkLCBJJ2Qga2VlcCB0aGUg
c3VwcG9ydCB3ZQo+Pj4+IGN1cnJlbnRseSBoYXZlLgo+Pj4gVGhlbiBteSByZW1hcmsgd2Fzbid0
IGNsZWFyIGVub3VnaDogSSdtIG5vdCBzdWdnZXN0aW5nIHRvIHJpcCBvdXQKPj4+IFhPUCBpbnNu
IHN1cHBvcnQgd2UgaGF2ZS4gSSdtIGluc3RlYWQgY29uc2lkZXJpbmcgd2hldGhlciB0byB3aXJl
Cj4+PiBhbGwgdW5zdXBwb3J0ZWQgWE9QIGVuY29kaW5ncyBpbnRvICNVRCAocmF0aGVyIHRoYW4g
cmV0dXJuCj4+PiBVTklNUExFTUVOVEVEL1VOUkVDT0dOSVpFRCBmb3IgdGhlbSksIG5vdCBqdXN0
IHRoZSBMV1Agb25lcy4KPj4gQWgsIGluIHdoaWNoIGNhc2UsIG5vLsKgIFR1cm5pbmcgYWxsIHVu
a25vd24gaW5zdHJ1Y3Rpb25zIGludG8KPj4gRVhDRVBUSU9OLyNVRCB3aWxsIGJyZWFrIGludHJv
c3BlY3Rpb24sIHdoaWNoIHVzZXMgVU5SRUNPR05JU0VEIHRvIGNvdmVyCj4+IHRoZSBnYXBzIGlu
IHRoZSBlbXVsYXRvciBieSBzaW5nbGUtc3RlcHBpbmcgdGhlIHZjcHUuCj4gQnV0IHRoZXJlIGFy
ZSBubyBnYXBzOgoKW0ZdWFNBVkUgZXQgYWwsIFZULXgsIFNWTSB0byBuYW1lIHNldmVyYWwgZ2Fw
cy4KCk5vdCB0byBtZW50aW9uIHJ1bm5pbmcgY3VycmVudCB2ZXJzaW9ucyBvZiBYZW4gb24gbmV3
ZXIgaGFyZHdhcmUuCgo+IFRoZSBvbmx5IG9uZXMgd2UgZGlkbid0IGNvdmVyIChhZmFpaykgd2Vy
ZSB0aGUKPiBMV1Agb25lcywgYW5kIHRob3NlIHdvdWxkIGdldCBtYWRlIHJhaXNlICNVRCBieSB0
aGUgcGF0Y2ggaGVyZSBhbnl3YXkuCj4gSWYgdGhlcmUgYXJlIHJlYWxseSBvcGNvZGVzIHdoZXJl
ICJ1bnJlY29nbml6ZWQiIGlzIHJlbGV2YW50LCB0aGVuIHdlCj4gc2hvdWxkIHNwZWNpYWwgY2Fz
ZSBfdGhvc2VfIGltbywgcmF0aGVyIHRoYW4gbGVhdmluZyBhbiBvcGNvZGUgc3BhY2UKPiB3aGlj
aCBhcHBhcmVudGx5IHdvbid0IHNlZSBmdXJ0aGVyIGV4dGVuc2lvbnMgYWxsIGdvIHRoZSAidW5y
ZWNvZ25pemVkIgo+IHJvdXRlLgoKSW4gdGVybXMgb2YgIm5vdCBjcmFzaGluZyB0aGUgZ3Vlc3Qi
LCBpdCBpcyB2ZXJ5IGltcG9ydGFudCB0byBrbm93IGlmCnRoZXJlIGFyZSBpbnN0cnVjdGlvbnMg
d2hpY2ggYXJlIGFjY2VwdGVkIGJ5IHRoZSBwaXBlbGluZSwgdHJhcCBmb3IgYW4KYWNjZXNzIHZp
b2xhdGlvbiwgYW5kIHRoYXQgeDg2X2VtdWxhdGUoKSBkb2Vzbid0IGtub3cgYWJvdXQuCgpJZiB3
ZSBkbyBlbXVsYXRpb24gc3VwcG9ydCBwZXJmZWN0bHksIGFsb25nIHdpdGggQ1BVSUQgZmVhdHVy
ZSBoYW5kbGluZwpldGMsIHRoZW4gdGhpcyBzZXQgc2hvdWxkIGJlIDAsIGJ1dCBpdCBpcyBzdGls
bCBub256ZXJvIGV2ZW4gd2l0aCB0aGlzCnBhdGNoLgoKRm9yIGluc3RydWN0aW9ucyB3ZSBrbm93
IGFib3V0LCBhbmQga25vdyB0aGF0IHdlIHRvbGQgdGhlIGd1ZXN0IGl0CmNvdWxkbid0IHVzZSwg
dGhlbiAjVUQgaXMgZmluZSBhbmQgY29ycmVjdCB0byBkby7CoCBHaXZlbiB0aGF0CmFwcHJveGlt
YXRlbHkgYWxsIG9mIGFjY2VzcyB2aW9sYXRpb25zIGFyZSB3ZWxsLWZvcm1lZCBub24tbWFsaWNp
b3VzCmNvZGUsIHRoZW4gYW4gaW5zdHJ1Y3Rpb24gd2hpY2ggeDg2X2VtdWxhdGUoKSBkb2Vzbid0
IGtub3cgYWJvdXQgaXMgbW9zdApsaWtlbHkgYSBob2xlIG9yIGEgQ1BVSUQgaGFuZGxpbmcgaXNz
dWUuwqAgRWl0aGVyIHdheSwgYmxpbmRseSBjb252ZXJ0aW5nCnRoaXMgdG8gI1VEIGlzIG5vdCB0
aGUgYXBwcm9wcmlhdGUgY291cnNlIG9mIGFjdGlvbi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
