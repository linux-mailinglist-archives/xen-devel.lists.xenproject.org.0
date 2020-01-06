Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD9C131619
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 17:32:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioVGp-0000TI-85; Mon, 06 Jan 2020 16:30:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nws7=23=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ioVGo-0000TB-0W
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 16:30:22 +0000
X-Inumbo-ID: d4d86c46-30a1-11ea-ab33-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4d86c46-30a1-11ea-ab33-12813bfff9fa;
 Mon, 06 Jan 2020 16:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578328222;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Z9MHOgBFPX4s5WzEciikV484y1O/jEQKfjvqldtQe7M=;
 b=ZFSv7SQfYOaBMjJic60Kv9iRa9qFfho1y/TjPCnRxGzFCDTz+B4zc11/
 PftXfY0uKDMWbR2ht/YRqnKddgwxqmqZIRvt7muDxIQ9reYqo9siR630v
 ZXpxHej4Blq92qyhJUvlle8XZNEWaSA2SXPgLBjRGv0eGai0zZwv4vWer U=;
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
IronPort-SDR: JEyMmj4E9fMN8GXhRHAD2pCLfSTxsEhLcOHgCPbtRwr7wXhlowzg8Yik05yo9zua92vo9+/jgs
 rF9vbgH+YQUy6bsBJTgYoJXygbPGvMTxSxBFAumIr5I0AixZCc0mrjow3EgnBJ3SiRuypxIjCN
 4pzYJWx83l90hE7pJVi4iLcbuUAjYEhduRjMTLPKB4hLArzyM6odIQDRhXhu/zPb5vAnkmBCqO
 vkzu5Kz/WRC7ZGOmcITeP7fjbH6ZeTx70QqLEWzDvhrR6O+sy/FVM/hLLFEPX9+U6OLW6f3JZ2
 s4M=
X-SBRS: 2.7
X-MesageID: 10659022
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,403,1571716800"; d="scan'208";a="10659022"
To: Jan Beulich <jbeulich@suse.com>
References: <73ea220a-d234-7a87-464e-59683fc3d815@suse.com>
 <3bd38586-d76b-2ce5-a8bb-0777b30d5b61@suse.com>
 <924cfe8a-1e6c-9f1e-e22c-06ff0fd3a886@citrix.com>
 <c574a0da-5403-76a3-1e49-3a97b0443804@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <950de2aa-71e4-8652-fac9-1061c923627f@citrix.com>
Date: Mon, 6 Jan 2020 16:30:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c574a0da-5403-76a3-1e49-3a97b0443804@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 1/3] x86/mm: mod_l<N>_entry() have no
 need to use __copy_from_user()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDEvMjAyMCAxNjoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDYuMDEuMjAyMCAx
NzowOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDYvMDEvMjAyMCAxNTozNCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3BhZ2UuaAo+Pj4gKysr
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmgKPj4+IEBAIC01NSw2ICs1NSwxNiBAQAo+Pj4g
ICNkZWZpbmUgbDRlX3dyaXRlKGw0ZXAsIGw0ZSkgXAo+Pj4gICAgICBwdGVfd3JpdGUoJmw0ZV9n
ZXRfaW50cHRlKCoobDRlcCkpLCBsNGVfZ2V0X2ludHB0ZShsNGUpKQo+Pj4gIAo+Pj4gKy8qIFR5
cGUtY29ycmVjdCBBQ0NFU1NfT05DRSgpIHdyYXBwZXJzIGZvciBQVEUgYWNjZXNzZXMuICovCj4+
PiArI2RlZmluZSBsMWVfYWNjZXNzX29uY2UobDFlKSAoKmNvbnRhaW5lcl9vZigmQUNDRVNTX09O
Q0UobDFlX2dldF9pbnRwdGUobDFlKSksIFwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHZvbGF0aWxlIGwxX3BnZW50cnlfdCwgbDEpKQo+Pj4gKyNkZWZp
bmUgbDJlX2FjY2Vzc19vbmNlKGwyZSkgKCpjb250YWluZXJfb2YoJkFDQ0VTU19PTkNFKGwyZV9n
ZXRfaW50cHRlKGwyZSkpLCBcCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB2b2xhdGlsZSBsMl9wZ2VudHJ5X3QsIGwyKSkKPj4+ICsjZGVmaW5lIGwzZV9h
Y2Nlc3Nfb25jZShsM2UpICgqY29udGFpbmVyX29mKCZBQ0NFU1NfT05DRShsM2VfZ2V0X2ludHB0
ZShsM2UpKSwgXAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdm9sYXRpbGUgbDNfcGdlbnRyeV90LCBsMykpCj4+PiArI2RlZmluZSBsNGVfYWNjZXNzX29u
Y2UobDRlKSAoKmNvbnRhaW5lcl9vZigmQUNDRVNTX09OQ0UobDRlX2dldF9pbnRwdGUobDRlKSks
IFwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvbGF0
aWxlIGw0X3BnZW50cnlfdCwgbDQpKQo+PiBXaGF0J3Mgd3Jvbmcgd2l0aCBsP2VfcmVhZF9hdG9t
aWMoKSB3aGljaCBhbHJlYWR5IGV4aXN0LCBhbmQgYXJlIGFscmVhZHkKPj4gdXNlZCBlbHNld2hl
cmU/Cj4gSSBkaWQgY29uc2lkZXIgZ29pbmcgdGhhdCByb3V0ZSwgYnV0IHByZWRpY3RlZCB5b3Ug
d291bGQgb2JqZWN0IHRvIGl0cwo+IHVzZSBoZXJlOiBJaXJjIHlvdSd2ZSBwcmV2aW91c2x5IHZv
aWNlZCBvcGluaW9uIGluIHRoaXMgZGlyZWN0aW9uCj4gKHBlcmhhcHMgbm90IG9uIHRoZSBwYWdl
IHRhYmxlIGFjY2Vzc29ycyB0aGVtc2VsdmVzIGJ1dCB0aGUgdW5kZXJseWluZwo+IHtyZWFkLHdy
aXRlfV91PE4+X2F0b21pYygpKS4KPgo+PiBJZiBub3RoaW5nLCB0aGVuIFJldmlld2VkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+PiB0byBzYXZlIGFub3Ro
ZXIgcm91bmQgb2YgcG9zdGluZy4KPiBMZXQncyBnZXQgdGhlIGFib3ZlIGNsYXJpZmllZCAtIEkn
bGwgYmUgaGFwcHkgdG8gc3dpdGNoIHRvCj4gbDxOPmVfcmVhZF9hdG9taWMoKSBpZiB0aGF0J3Mg
ZmluZSBieSB5b3UuCgpJJ2QgZGVmaW5pdGVseSBwcmVmZXIgcmV1c2luZyBsP2VfcmVhZF9hdG9t
aWMoKSB0aGFuIGludHJvZHVjaW5nIGEgbmV3CnNldCBvZiBoZWxwZXJzLgoKSSBoYXZlIHR3byBr
ZXkgaXNzdWVzIHdpdGggdGhlIGdlbmVyYWwgX2F0b21pYygpIGluZnJhc3RydWN0dXJlLgoKRmly
c3QsIHRoZSB0ZXJtIGlzIG92ZXJsb2FkZWQgZm9yIHR3byB2ZXJ5IGRpZmZlcmVudCB0aGluZ3Mu
wqAgV2UgdXNlIGl0CmJvdGggZm9yICJkb24ndCBzdWJkaXZpZGUgdGhpcyByZWFkL3dyaXRlIiBh
bmQgInVzZSBhIGxvY2tlZCB1cGRhdGUiLAp3aGVyZSB0aGUgbGF0dGVyIGlzIHdoYXQgaXMgZXhw
ZWN0ZWQgYnkgdGhlIG5hbWUgImF0b21pYyIuCgpTZWNvbmQsIGFuZCBzcGVjaWZpY2FsbHkgd2l0
aCB7cmVhZCx3cml0ZX1fdTxOPl9hdG9taWMoKSwgaXQgaXMgdGhlaXIKY29uc3RydWN0aW9uIHVz
aW5nIG1hY3JvcyB3aGljaCBtYWtlcyB0aGVtIGltcG9zc2libGUgdG8gbG9jYXRlIGluIHRoZQpz
b3VyY2UgY29kZS7CoCBUaGlzIGNhbiB0cml2aWFsbHkgYmUgZml4ZWQgYnkgbm90IHVzaW5nIG1h
Y3Jvcy7CoCAoSWYgaXQKd2VyZSB1cCB0byBtZSwgdGhlIHVzZSBvZiAjIyB3b3VsZCBiZSBkaXNh
bGxvd2VkIGluIGdlbmVyYWwsIGJlY2F1c2UgaXQKZG9lcyB2ZXJ5IGxpdHRsZSBidXQgdG8gb2Jm
dXNjYXRlIGNvZGUuKQoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
