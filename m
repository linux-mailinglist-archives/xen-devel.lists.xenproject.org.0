Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAD312E93E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 18:22:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in49O-0006ai-Qt; Thu, 02 Jan 2020 17:20:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WNQ8=2X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1in49N-0006ad-Oi
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 17:20:45 +0000
X-Inumbo-ID: 30a8eabc-2d84-11ea-88e7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30a8eabc-2d84-11ea-88e7-bc764e2007e4;
 Thu, 02 Jan 2020 17:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577985636;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qRyzI7jbht5VKKuA1YlNxCDYR/DgJNHVkFh2Ryv/srI=;
 b=BMhdz0qRMF3RKMOhXZ+3rDsUhXUgVKG/Nz8wNn4cqECd3YrCEy5PX/b8
 MFPmHq1iJiiPlNFbZtCDaewClJkVAkaE0jI19T6tgO8wfBd5BVFLZl5jE
 kWUxdaWRq5rOX4AHOBN9e89fzSn6HGr1oijr6F7vyXJWsKHGcaJd80C20 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: c9SqVw9VcVJFdL+esr4VRBmuR+pNBRc4EfSXDwtl2LGq/cgrT/819w6Sd8nDv0bRS6wORd4Jaf
 8EJ1Ic2p5qqSaKgKgYpY9mikAQ1un1nZB3Dk5mSj/N3s+I+fE0pHR358LhrYENhATGxmvsDvTv
 /uINSBv+nWhVsbMlmZ778jNNR9W2jnAJJ2/XL+P+KUvYNlEsx33B+TraLpRrlHYsokXHlLfVwQ
 UpjdLQSxbAEEajF3wURIFG93NkuXyR3Pxmx7i0KJJqveYLwLzkDwewVhllpSVynxSiLwB2JNF+
 Tv0=
X-SBRS: 2.7
X-MesageID: 10814700
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,387,1571716800"; d="scan'208";a="10814700"
To: Wei Liu <wl@xen.org>
References: <20200102145953.6503-1-andrew.cooper3@citrix.com>
 <20200102165515.4brbqceseurokvp3@debian>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a5883bef-d760-5712-3f76-78e96a018a45@citrix.com>
Date: Thu, 2 Jan 2020 17:20:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200102165515.4brbqceseurokvp3@debian>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/boot: Clean up the trampoline
 transition into Long mode
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMDEvMjAyMCAxNjo1NSwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEphbiAwMiwgMjAy
MCBhdCAwMjo1OTo1M1BNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBUaGUgam1wIGFm
dGVyIHNldHRpbmcgJWNyMCBpcyByZWR1bmRhbnQgd2l0aCB0aGUgZm9sbG93aW5nIGxqbXAuCj4+
Cj4+IFRoZSBDUFVJRCB0byBwcm90ZWN0IHRoZSBqdW1wIHRvIGhpZ2hlciBtYXBwaW5ncyB3YXMg
aW5zZXJ0ZWQgZHVlIHRvIGFuCj4+IGFidW5kYW5jZSBvZiBjYXV0aW9uL3BhcmFub2lhIGJlZm9y
ZSBTcGVjdHJlIHdhcyBwdWJsaWMuICBUaGVyZSBpcyBub3QgYQo+PiBtYXRjaGluZyBwcm90ZWN0
aW9uIGluIHRoZSBTMyByZXN1bWUgcGF0aCwgYW5kIHRoZXJlIGlzIG5vdGhpbmcKPj4gaW50ZXJl
c3RpbmcgaW4gbWVtb3J5IGF0IHRoaXMgcG9pbnQuCj4gV2hhdCBkbyB5b3UgbWVhbiBieSAidGhl
cmUgaXMgbm90aGluZyBpbnRlcmVzdGluZyBpbiBtZW1vcnkiIGhlcmU/Cj4KPiBBcyBmYXIgYXMg
SSBjYW4gdGVsbCBpZGVsIHBhZ2UgdGFibGUgaGFzIGJlZW4gbG9hZGVkLiAgRHVyaW5nIEFQCj4g
YnJpbmctdXAgaXQgY29udGFpbnMgcnVudGltZSBkYXRhLCBubz8KCldlIGhhdmVuJ3QgZXZlbiBk
ZWNvbXByZXNzZWQgdGhlIGRvbTAga2VybmVsIGF0IHRoaXMgcG9pbnQuwqAgV2hhdCBkYXRhCmFy
ZSB5b3UgY29uY2VybmVkIGJ5PwoKVGhpcyBwcm90ZWN0aW9uIGlzIG9ubHkgbWVhbmluZ2Z1bCBm
b3IgdmlydHVhbGlzZWQgZ3Vlc3RzLCBhbmQgaXMKdWx0aW1hdGVseSBpbmNvbXBsZXRlLsKgIElm
IGFub3RoZXIgVk0gY2FuIHVzZSBTcGVjdHJlIHYyIGFnYWluc3QgdGhpcwpWTSwgaXQgY2FuIGFs
c28gdXNlIFNwZWN0cmUgdjEgYW5kIGhhdmUgYSBmYXIgbW9yZSBpbnRlcmVzdGluZyB0aW1lLgoK
SW4gdGhlIHRpbWUgc2luY2Ugd3JpdGluZyB0aGlzIGNvZGUsIGl0IGhhcyBiZWNvbWUgc3Vic3Rh
bnRpYWxseSBtb3JlCmFwcGFyZW50IHRoYXQgVk1zIG11c3QgdHJ1c3QgdGhlaXIgaHlwZXJ2aXNv
ciB0byBwcm92aWRlIGFkZXF1YXRlCmlzb2xhdGlvbiwgYmVjYXVzZSB0aGVyZSBpcyBsaXRlcmFs
bHkgbm90aGluZyB0aGUgVk0gY2FuIGRvIGl0c2VsZi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
