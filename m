Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DADEDD81
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 12:09:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRaBg-0000qO-Am; Mon, 04 Nov 2019 11:06:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kevs=Y4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iRaBe-0000qJ-JI
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 11:06:18 +0000
X-Inumbo-ID: 1e163752-fef3-11e9-a177-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e163752-fef3-11e9-a177-12813bfff9fa;
 Mon, 04 Nov 2019 11:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572865576;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=vqF75ySCENwtsvL8n+flO4CAtOzfBPDD4xLM+gAAmH8=;
 b=BT2fQ0fVtELWgBRaloDaEaBtgdMHhF4d/CouSyiIrxsYCoaZx0AJdLJm
 +QX5SV8tbkFJDhP1Cdauk8zMAwJGCB8djAt+zGYUO3PJQy+yFLTQgBBUG
 psO+bYoAaSE04kj3GrqfwdDPUJlsI2/u8VyFTaVhkgnRGbyYYGuld+UFZ I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: urprCckga4daAEO/+vTbSYTaIoV/mQZdpj8A+9bDhI+4plkP2o2HQMx4euTK9Z1OXz3Wu85KaJ
 1cz90f/B8rPylRluNdgRjmoI3/4uyGC9SIEoVoTtlUuLukvNvEm+BajqYmD8mUd0dNxoWYQrsq
 l6bBZr7PTPHpwToDzx5Gk0hs8TvSCk6ivpaft9SsrncBBpYYvse5IPX42q02PLWAnqphwVUOvg
 RrqIBgwnGz4D17ha4/ym9W2cqLDcFW/zsY00sOivJ9isl1sw+S3iUsNajpOmgMQfe09cADjkB+
 8zQ=
X-SBRS: 2.7
X-MesageID: 7902275
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,267,1569297600"; 
   d="scan'208";a="7902275"
To: "Durrant, Paul" <pdurrant@amazon.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <1572632881-9050-1-git-send-email-igor.druzhinin@citrix.com>
 <901b33296f1a4ee489da04d79932127b@EX13D32EUC003.ant.amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <105f4eda-14e0-33b9-e364-1f8a71dce9d9@citrix.com>
Date: Mon, 4 Nov 2019 11:06:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <901b33296f1a4ee489da04d79932127b@EX13D32EUC003.ant.amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] passthrough: simplify locking
 and logging
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMTEvMjAxOSAwODozMSwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNp
dHJpeC5jb20+Cj4+IFNlbnQ6IDAxIE5vdmVtYmVyIDIwMTkgMTk6MjgKPj4gVG86IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1h
em9uLmNvbT47IGpiZXVsaWNoQHN1c2UuY29tOwo+PiBqZ3Jvc3NAc3VzZS5jb20KPj4gU3ViamVj
dDogW1BBVENIIGZvci00LjEzIHYyXSBwYXNzdGhyb3VnaDogc2ltcGxpZnkgbG9ja2luZyBhbmQg
bG9nZ2luZwo+Pgo+PiBGcm9tOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4+
Cj4+IERyb3BwaW5nIHRoZSBwY2lkZXZzIGxvY2sgYmV0d2VlbiBjYWxsaW5nIGRldmljZV9hc3Np
Z25lZCgpIGFuZAo+PiBhc3NpZ25fZGV2aWNlKCkgbWVhbnMgdGhhdCB0aGUgbGF0dGVyIGhhcyB0
byBkbyB0aGUgc2FtZSBjaGVjayBhcyB0aGUKPj4gZm9ybWVyIGZvciBubyBvYnZpb3VzIGdhaW4u
IEFsc28sIHNpbmNlIGxvbmcgcnVubmluZyBvcGVyYXRpb25zIHVuZGVyCj4+IHBjaWRldnMgbG9j
ayBhbHJlYWR5IGRyb3AgdGhlIGxvY2sgYW5kIHJldHVybiAtRVJFU1RBUlQgcGVyaW9kaWNhbGx5
IHRoZXJlCj4+IGlzIGxpdHRsZSBwb2ludCBpbiBpbW1lZGlhdGVseSBmYWlsaW5nIGFuIGFzc2ln
bm1lbnQgb3BlcmF0aW9uIHdpdGgKPj4gLUVSRVNUQVJUIGp1c3QgYmVjYXVzZSB0aGUgcGNpZGV2
cyBsb2NrIGNvdWxkIG5vdCBiZSBhY3F1aXJlZCAoZm9yIHRoZQo+PiBzZWNvbmQgdGltZSwgaGF2
aW5nIGFscmVhZHkgYmxvY2tlZCBvbiBhY3F1aXJpbmcgdGhlIGxvY2sgaW4KPj4gZGV2aWNlX2Fz
c2lnbmVkKCkpLgo+Pgo+PiBUaGlzIHBhdGNoIGluc3RlYWQgYWNxdWlyZXMgdGhlIGxvY2sgb25j
ZSBmb3IgYXNzaWdubWVudCAob3IgdGVzdCBhc3NpZ24pCj4+IG9wZXJhdGlvbnMgZGlyZWN0bHkg
aW4gaW9tbXVfZG9fcGNpX2RvbWN0bCgpIGFuZCB0aHVzIGNhbiByZW1vdmUgdGhlCj4+IGR1cGxp
Y2F0ZSBkb21haW4gb3duZXJzaGlwIGNoZWNrIGluIGFzc2lnbl9kZXZpY2UoKS4gV2hpbHN0IGlu
IHRoZQo+PiBuZWlnaGJvdXJob29kLCB0aGUgcGF0Y2ggYWxzbyByZW1vdmVzIHNvbWUgZGVidWcg
bG9nZ2luZyBmcm9tCj4+IGFzc2lnbl9kZXZpY2UoKSBhbmQgZGVhc3NpZ25fZGV2aWNlKCkgYW5k
IHJlcGxhY2VzIGl0IHdpdGggcHJvcGVyIGVycm9yCj4+IGxvZ2dpbmcsIHdoaWNoIGFsbG93cyBl
cnJvciBsb2dnaW5nIGluIGlvbW11X2RvX3BjaV9kb21jdGwoKSB0byBiZQo+PiByZW1vdmVkLiBB
bHNvLCBzaW5jZSBkZXZpY2VfYXNzaWduZWQoKSBjYW4gdGVsbCB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIGEKPj4gZ3Vlc3QgYXNzaWduZWQgZGV2aWNlIGFuZCBhIG5vbi1leGlzdGVudCBvbmUsIGxv
ZyB0aGUgYWN0dWFsIGVycm9yCj4+IGNvbmRpdGlvbiByYXRoZXIgdGhlbiBiZWluZyBhbWJpZ3Vv
dXMgZm9yIHRoZSBzYWtlIGEgZmV3IGV4dHJhIGxpbmVzIG9mCj4+IGNvZGUuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPj4gLS0tCj4+Cj4+
IFRoaXMgaXMgWFNBLTMwMiBmb2xsb3d1cCBhbmQgY29udGFpbnMgc29tZSBjaGFuZ2VzIGltcG9y
dGFudCBmb3IKPj4gWGVuU2VydmVyLgo+PiBKdWVyZ2VuLCBjb3VsZCB0aGlzIGJlIGNvbnNpZGVy
ZWQgZm9yIDQuMTMgaW5jbHVzaW9uPwo+Pgo+PiB2MjogdXBkYXRlZCBQYXVsJ3MgZW1haWwgYWRk
cmVzcwoKVGhpcyB3YXMgd29yayB5b3UgZGlkIGF0IENpdHJpeCwgeWVzPwoKPiBSZXZpZXdlZC1i
eTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKU29CIGFuZCBSLWJ5PwoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
