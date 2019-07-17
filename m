Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2856BFEC
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 18:55:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnnAx-0005zT-W5; Wed, 17 Jul 2019 16:53:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CQpx=VO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hnnAw-0005zD-2U
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 16:53:06 +0000
X-Inumbo-ID: 586bef26-a8b3-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 586bef26-a8b3-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 16:53:05 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: drNeixvA/iumrP1ywiMxcI6mmp2n1saE2V/GlFOQ8ELYV2VsyBhjGd7h3p8+G/2R70ds8boMTJ
 4aLUzheX7y494rZwXs/uYRoxzri3+QkOhXKTysnESTlfjgl0lHhilp9WzF0XtMKe6YGzvt/HrU
 bFYF3BcovsFVBcMpjHWE/U4IfOpigvdf3bT37yRACeeZx9ET4tMoHPZ7IPX2Srpo6OTDQ3KWq4
 47Mh5eHZTFipZKqSyzhoYr0A/xqtwDGkuYEkJQzdXM/jGejn26T9siFYWC/XU7ydO4SFI4iXzY
 cXg=
X-SBRS: 2.7
X-MesageID: 3152190
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,275,1559534400"; 
   d="scan'208";a="3152190"
To: Jan Beulich <JBeulich@suse.com>, George Dunlap <George.Dunlap@citrix.com>
References: <e6e0512b-d508-b637-9fd3-96739d5385c1@citrix.com>
 <86244630-aeb9-07a3-95f9-53d998b768ea@suse.com>
 <6dd744df-dcd8-552b-c8e4-a0d05abc7eeb@citrix.com>
 <35d77bc2-8d17-8686-c08e-211973ce49e5@suse.com>
 <76439de5430365dda0b83694444e59fa9cfdd3d0.camel@infradead.org>
 <21c9d3d4-831b-d8cd-5d81-3ce18b9f907e@citrix.com>
 <A91E670B-D372-4560-B32D-9A5142957907@citrix.com>
 <16b8a491-4522-2da2-5bf2-a76d2f4eca5f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <760df125-85a0-e5ce-a056-983813943d36@citrix.com>
Date: Wed, 17 Jul 2019 17:52:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <16b8a491-4522-2da2-5bf2-a76d2f4eca5f@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Design session report: Xen on Distros
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Amit Shah <amit@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDcvMjAxOSAxMzozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTcuMDcuMjAxOSAx
MjozMywgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+IE9uIEp1bCAxNiwgMjAxOSwgYXQgMTE6MDMg
UE0sIEFuZHJldyBDb29wZXIKPj4+Cj4+PiBXZSBjb3VsZCB0cml2aWFsbHkgdGhyb3cgdGhlIGZp
eGVzIGludG8gdGhlIGJyYW5jaCwgdGFnIGl0LCBzaWduIGl0IGFuZAo+Pj4gdGhyb3cgaXQgb3V0
IGludG8gdGhlIG9wZW4sIGJ1dCBkb2luZyB0aGF0IG9uIHRoZSBlbWJhcmdvIGRhdGUgaXRzZWxm
Cj4+PiB3b3VsZCByZXN1bHQgaW4gYW4gb2ZmaWNpYWwgcmVsZWFzZSBvZiBYZW4gd2hpY2ggaGFz
IGhhZCAwIHRlc3RpbmcgaW4KPj4+IHRoZSBpbmN1bWJlbnQgdGVzdCBzeXN0ZW0uCj4+IFRoZSBw
b2ludCBpcyB0aGF0IGFueW9uZSB3aG8gc2hpcHMgLyBkZXBsb3lzIGEgZml4IG9uIHRoZSBkaXNj
bG9zdXJlIGRhdGUKPj4gaXMgcHJldHR5IG11Y2ggc2hpcHBpbmcgZXhhY3RseSB0aGF0LiAgSWYg
aXTigJlzIG5vdCBnb29kIGVub3VnaCB0byBzaWduLAo+PiB3aHkgaXMgaXQgZ29vZCBlbm91Z2gg
dG8gZGVwbG95Pwo+IEkgdGhpbmsgdGhlIHNlY3VyaXR5IGZpeGVzIHRoZW1zZWx2ZXMgYXJlIGdv
b2QgZW5vdWdoIHRvIGRlcGxveSwgcGVyaGFwcwo+IHdpdGggdGhlIGFzc3VtcHRpb24gdGhhdCBj
b25zdW1lcnMgb2Ygb3VyIHByZS1kaXNjbG9zdXJlIGxpc3QgaGF2ZSBkb25lCj4gc29tZSB0ZXN0
aW5nIG9uIHRoZWlyIG93bi4gVGhlIHN0YWJsZSB0cmVlcywgaG93ZXZlciwgY29udGFpbiBtb3Jl
IHRoYW4KPiBqdXN0IHNlY3VyaXR5IGZpeGVzLCBhbmQgY2FuIGhhdmUgcmVncmVzc2lvbnMgKG1v
c3QgbGlrZWx5IGR1ZSB0bwo+IGJhY2twb3J0aW5nIG1pc3Rha2VzKS4KClJpZ2h0LCBidXQgZS5n
LiBwcm9wb3NlZCBjaGFuZ2luZyB0aGUgY29tbWl0L3B1c2ggbW9kZWwgd2hlcmVieSBhbGwKY2hh
bmdlcyBtdXN0IHBhc3MgQ0kgYmVmb3JlIHRoZXkgZ2V0IG1lcmdlZCB3b3VsZCByZWR1Y2UgdGhl
IGxpa2VseWhvb2QKb2YgYmFkIGJhY2twb3J0cyBnZXR0aW5nIGludG8gc3RhZ2luZy0qIGluIHRo
ZSBmaXJzdCBwbGFjZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
