Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E053F157359
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 12:20:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j174P-00038n-4E; Mon, 10 Feb 2020 11:17:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qaH/=36=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j174O-00038h-2u
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 11:17:40 +0000
X-Inumbo-ID: f1c2ff87-4bf6-11ea-b4ae-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1c2ff87-4bf6-11ea-b4ae-12813bfff9fa;
 Mon, 10 Feb 2020 11:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581333459;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=t6t7l/ZIzW/U4XKN9HOz1RT22wQI6xkuV1doLR/1dow=;
 b=G5Bae0ol7EHjwzqYSy1o/xjOmZNRPqPdvfmnht2CrIVnR3q5Td1OD2+/
 Aa/Aw6HradEnYEQVEb7ilt5cZs8t3wpebvseCNpAWqv6D4UqXgZmbjfXp
 Vl03ESWE/pxRY8u4i1CXc8y6t/KpAd//7NyGuCdLkfUjePyI8FU5USsvo s=;
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
IronPort-SDR: AiKPk6q4Hw3PVm/vqQrCRiCw6qu7bRUNK1HeIUMgNAg5MRHoE6v7ulD1g2V9ZYU7CrsqoWPuia
 XBc3i09OL1+uEL+B3hADJg6C0ZFG0plm5axxoFXdeXbSATPODlu7YVzrA4zwohXxZJKaMpOw+D
 486t6bQIipz6HQ6lw94klHtnEc+/CLrMfsrRSgEnbgDm2rYWKfRhojt8m6yB1/rkQXVrLyjpbD
 LU1uuTZ0KYdZ4JNJAMkPk9e+zImDqHIWD4XwirR6YGUS2SZVwkrvQuMDykzOPN4Fic+GIzo3Xy
 klQ=
X-SBRS: 2.7
X-MesageID: 12201965
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,424,1574139600"; d="scan'208";a="12201965"
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20200209230655.GA32524@mail-itl>
 <a6b9455d-dea1-6c61-ff7f-4fbaaba9a953@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <41b3896b-5414-bfdf-a515-bf2f06ab6463@citrix.com>
Date: Mon, 10 Feb 2020 11:17:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a6b9455d-dea1-6c61-ff7f-4fbaaba9a953@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Xen fails to resume on AMD Fam15h (and Fam17h?)
 because of CPUID mismatch
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, zachm1996@gmail.com,
 Claudia <claudia1@disroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDIvMjAyMCAwODo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTAuMDIuMjAyMCAw
MDowNiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+PiBIaSwKPj4KPj4gTXVs
dGlwbGUgUXViZXMgdXNlcnMgaGF2ZSByZXBvcnRlZCBpc3N1ZXMgd2l0aCByZXN1bWluZyBmcm9t
IFMzIG9uIEFNRAo+PiBzeXN0ZW1zIChSeXplbiAyNTAwVSwgUnl6ZW4gUHJvIDM3MDBVLCBtYXli
ZSBtb3JlKS4gVGhlIGVycm9yIG1lc3NhZ2UKPj4gaXM6Cj4+Cj4+IChYRU4pIENQVTA6IGNhcFsg
MV0gaXMgN2VkODMyMGIgKGV4cGVjdGVkIGY2ZDgzMjBiKQo+Pgo+PiBJZiBJIHJlYWQgaXQgcmln
aHQsIHRoaXMgaXM6Cj4+ICAgLSBPU1hTQVZFOiAwIC0+IDEKPj4gICAtIEhZUEVSVklTT1I6IDEg
LT4gMAo+Pgo+PiBDb21tZW50aW5nIG91dCB0aGUgcGFuaWMgb24gYSBmYWlsZWQgcmVjaGVja19j
cHVfZmVhdHVyZXMoKSBpbiBwb3dlci5jCj4+IG1ha2VzIHRoZSBzeXN0ZW0gd29yayBhZnRlciBy
ZXN1bWUsIHJlcG9ydGVkbHkgc3RhYmxlLiBCdXQgdGhhdCBkb2Vzbid0Cj4+IHNvdW5kcyBsaWtl
IGEgZ29vZCBpZGVhIGdlbmVyYWxseS4KPj4KPj4gSXMgdGhpcyBkaWZmZXJlbmNlIGEgWGVuIGZh
dWx0IChzb21lIG1pc3NpbmcgTVNSIC8gb3RoZXIgcmVnaXN0ZXIKPj4gcmVzdG9yZSBvbiByZXN1
bWUpPyBPciBCSU9TIHZlbmRvciAvIEFNRCwgdGhhdCBjb3VsZCBiZSB3b3JrZWQgYXJvdW5kIGlu
Cj4+IFhlbj8KPiBUaGUgdHJhbnNpdGlvbiBvZiB0aGUgSFlQRVJWSVNPUiBiaXQgaXMgZGVmaW5p
dGVseSBhIFhlbiBpc3N1ZSwKPiB3aXRoIEFuZHJldyBoYXZpbmcgc2VudCBhIHBhdGNoIGFscmVh
ZHkgKGlpcmMpLgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMjAwMTI3MjAy
MTIxLjI5NjEtMS1hbmRyZXcuY29vcGVyM0BjaXRyaXguY29tLwoKQ29kZSBpcyBjb3JyZWN0LsKg
IENvbW1pdCBtZXNzYWdlIG5lZWRzIHJld29yaywgaW5jbHVkaW5nIGluIGxpZ2h0IG9mCnRoaXMg
ZGlzY292ZXJ5LsKgIChJIG1heSBldmVudHVhbGx5IHNwbGl0IGl0IGludG8gdHdvIHBhdGNoZXMu
KQoKPiBUaGUgT1NYU0FWRSBwYXJ0IGlzIGEgbGl0dGxlIG1vcmUgc3VycHJpc2luZywKCk5vdCB0
byBtZS7CoCBUaGUgY2hlY2tzIG9ubHkgY2FyZSBpZiBmZWF0dXJlIGJpdHMgaGF2ZSBnb25lIG1p
c3NpbmcsIG5vdAppZiBuZXcgb25lcyBoYXZlIGFwcGVhcmVkLgoKbW11X2NyNF9mZWF0dXJlcyBp
bmNsdWRlcyBPU1hTQVZFIChmcm9tIG11Y2ggbGF0ZXIgb24gYm9vdCB0aGFuIGZlYXR1cmVzCmdl
dCBjYWNoZWQpLCBzbyB0aGUgczMgcGF0aCBvYnNlcnZpbmcgdGhlIGdhaW4gb2YgT1NYU0FWRSB3
aWxsIGhhdmUgYmVlbgpoYXBwZW5pbmcgZXZlciBzaW5jZSB0aGUgY2hlY2tzIHdlcmUgaW50cm9k
dWNlZCAoZXZlbiBvbiBJbnRlbC4pCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
