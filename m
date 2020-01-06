Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D7313181F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 20:04:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioXdZ-0006w3-JD; Mon, 06 Jan 2020 19:02:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nws7=23=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ioXdX-0006vy-TY
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 19:01:59 +0000
X-Inumbo-ID: febab658-30b6-11ea-b6f1-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id febab658-30b6-11ea-b6f1-bc764e2007e4;
 Mon, 06 Jan 2020 19:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578337311;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=bSLx6X5f09v3UeIqNnqPGkaDEBI6PTVSXP3nTNw2o7w=;
 b=W6HOlIidR+NWj0JVqnV4lp0lerRlRoVS8J88nXNGdcEn3DhpHh5oG9Jo
 hlDP8fOlcFP9yd8sVCSF1WWzodgfhvmTeiKnWWRTkmH19rKDZ9TTmbG/Y
 exlnCQGvi2XxXWzMzsIr9vxBOd9wWensAbX6GZ6HBWFD4dDtR4V3vxUrZ E=;
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
IronPort-SDR: Tnr7GBNoIx/yKBe9ztsBlevCFDcviy9Fay7NSg8vgXa0sdR2L6eQQkPL69w7mSWumMKjTo4ZIv
 ZfbpNN6jh24awHamGxpGBJNhkO5lCnOcDv9k7DHL/9wbur2JpSxCp5YfVoY5A/si9HsouYtqKk
 3PNmfOR9Al4c6EH4OoinuFz2X3AvniQABE4ZNU7lTR/loYBJNqVeAVzAfjL33/1bbSDlnRnf0s
 zSvMdv06RQUQ7zVcp7B9eNLz5EjdtrjoA4nqvPQ6DydI18mpzUfUt+o5GMYi4v/tZVkVSZK60G
 tkE=
X-SBRS: 2.7
X-MesageID: 10500592
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,403,1571716800"; d="scan'208";a="10500592"
To: Jan Beulich <jbeulich@suse.com>
References: <20191111202443.7154-1-andrew.cooper3@citrix.com>
 <ac802294-a1c6-d6cc-8684-2f50248d85ea@suse.com>
 <6ca0c51b-eb61-338f-4592-e7dd6ea3dc61@citrix.com>
 <17af65cf-fdbe-928e-e018-ee3dad31b59d@suse.com>
 <18da6d78-aac2-6a94-9b06-17a138c4aa64@citrix.com>
 <2b241b5b-7ca3-e2ae-3642-0d921797a6cd@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <72ec473d-1bad-2de0-0a55-3eb76df538f4@citrix.com>
Date: Mon, 6 Jan 2020 19:01:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2b241b5b-7ca3-e2ae-3642-0d921797a6cd@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH for-4.13] xen: Drop bogus BOOLEAN
 definitions, TRUE and FALSE
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
Cc: Juergen Gross <jgross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMTIvMjAxOSAxMjoxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDYuMTIuMjAxOSAy
MjowMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTIvMTEvMjAxOSAxNDowMywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBCb3R0b20gbGluZSAtIEknbSBoYWxmIGNvbnZpbmNlZCBhbmQgd2ls
bGluZyB0byBnaXZlIG15IGFjaywgYnV0Cj4+PiBJJ20gbm90IGNvbnZpbmNlZCB5b3UgdHJ1bHkg
dGhvdWdodCB0aHJvdWdoIHRoZSBsb25nZXIgdGVybQo+Pj4gY29uc2VxdWVuY2VzLiBJJ2QgdGhl
cmVmb3JlIGJlIGZhciBoYXBwaWVyIHRvIHNlZSB0aGlzIHBhdGNoCj4+PiBzcGxpdCBpbnRvIGEg
bm9uLWNvbnRyb3ZlcnNpYWwgcGFydCAoYW55dGhpbmcgdGhhdCdzIG5vdCB0aWVkIHRvCj4+PiB0
aGUgQUNQSSBhbmQgRUZJIGhlYWRlciBpbXBvcnRzKSwgYW4gQUNQSSwgYW5kIGFuIEVGSSBwYXJ0
Lgo+PiBJIGRvIG5vdCB3YW50IHRvIHdyaXRpbmcgdGhlIHNhbWUgcGF0Y2ggYWdhaW4gaW4gJE4g
eWVhcnMgdGltZSBiZWNhdXNlCj4+IHJldmlldyBhbmQgQ0kgbWlzc2VkIGl0IGNyZWVwaW5nIGJh
Y2sgaW4uCj4+Cj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhbiB1bnJlYXNvbmFibGUgcG9zaXRp
b24gdG8gdGFrZS4KPiBJdCBmb3Igc3VyZSBpc24ndC4gWWV0IEkgYWxzbyBkb24ndCB0aGluayB0
aG91Z2ggbXkgcmVxdWVzdCBob3cgdG8KPiBzcGxpdCB0aGluZ3MgaXMuIEJ5IGFza2luZyBmb3Ig
dGhlIHNwbGl0IEknbSBpbXBseWluZyB0aGF0IHdlIG1heQo+IHN0aWxsIHJlYWNoIGFncmVlbWVu
dCBvbiB0aGUgY29udHJvdmVyc2lhbCBwYXJ0cywgZmFvZC4gU2FkbHkgb25jZQo+IGFnYWluIHRo
ZXJlIGFyZSBubyBvdGhlciBvcGluaW9ucyBoZWxwaW5nIHRvIHNvcnQgd2hpY2ggcm91dGUgbWF5
Cj4gYmUgdGhlIG92ZXJhbGwgcHJlZmVycmVkIG9uZS4KCkFzIEp1bGllbiBwb2ludHMgb3V0IChh
bmQgeW91IG5vdCByZXNwb25kZWQgdG8gaGlzIGVtYWlsKSB5b3UgaGF2ZSBhdCBubwpwb2ludCBh
Y3R1YWxseSByZXF1ZXN0ZWQgYSBzcGxpdC7CoCBZb3UgbWVyZWx5IHN1Z2dlc3RlZCB0aGF0IHlv
dSBtaWdodApiZSB3aWxsaW5nIHRvIGFjayAxLzMgdGhlIHBhdGNoLCB3aXRoIHRoZSBvdmVydCBp
bXBsaWNhdGlvbiB0aGF0Cm9iamVjdGlvbnMgd291bGQgY29udGludWUgb24gdGhlIHJlc3QuCgpU
aGlzIGRlYWRsb2NrIGhhcyBnb25lIG9uIGZhciB0b28gbG9uZy7CoCBUaGVyZWZvcmUsIHlvdSBo
YXZlIHVudGlsIHRoZQplbmQgb2YgdGhlIHdlZWsgdG8gZWl0aGVyOgoKMSkgQWdyZWUgaW4gcHJp
bmNpcGxlIHRoYXQgeW91IHdpbGwgYWNjZXB0IHRoaXMgcGF0Y2ggKG1vZHVsbyB0aWR5LXVwKQpz
cGxpdCBpbnRvIDMgLSBpLmUuIHRoYXQgSSB3b24ndCBiZSB3YXN0aW5nIG15IHRpbWUgZG9pbmcg
c28sIG9yCgoyKSBQcm92aWRlIGEgY29uY3JldGUgYWx0ZXJuYXRpdmUgd2hpY2ggcmV0YWlucyB0
aGUgcHJvcGVydHkgb2YgYmVpbmcKaW1wb3NzaWJsZSBmb3IgYnVnZ3kgY29uc3RydWN0cyB0byBm
aW5kIHRoZWlyIHdheSBiYWNrIGludG8gdGhlIGNvZGViYXNlLgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
