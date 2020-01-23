Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BACB6147118
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 19:48:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuhU9-0003SG-93; Thu, 23 Jan 2020 18:45:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WnRe=3M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iuhU7-0003SB-4f
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 18:45:43 +0000
X-Inumbo-ID: 8dd79bec-3e10-11ea-bebf-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8dd79bec-3e10-11ea-bebf-12813bfff9fa;
 Thu, 23 Jan 2020 18:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579805141;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wnJiuWeEU2p2HqcJZaJsarHdXWuKDJQ3GcTSEO6nJiA=;
 b=RE9fJZmVyDda8XuL5kGQKPROloBpQ/mz9i4WS5FeKYCY+PKknd5YXqrS
 9sVE+JJr7Pryxxct8iNtptdQuqguUR4wAN7rvEb8+oBfbmvx1TvmFshvl
 UzebOZ8hA4v8dQ1KR1IgYSP3KrAk+pB1VuOo0RjRazvKYhcdVdYt+Q5ia 4=;
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
IronPort-SDR: b/Bh0rRy0RiMovW5erDwVSRK36U41hn75WQZq9jeHm6Yuxl0DZXDijhizgOgNfJNrFgOeXO/9F
 ut0TL7k+SJhznUW4ithUNkWkFL2K6CN7Fo18mmdoawMIfQGHZtl7ljqbWRe7dCAw9UgeNOiN2o
 WbJRP1Ov8kpfj3x5Uob9y8x8/sccA2pnyAnI8UCUmK/CKXFau4YwYdgnOMwdjGFvGtbHgYZeF1
 2JcWoV0JwVk6JXEFpxit8K9opzlgRod7jIN9to4xdYxs4Set1Ufy5NoLxsJgjlJZsYiApzQw+r
 JLw=
X-SBRS: 2.7
X-MesageID: 11785584
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,354,1574139600"; d="scan'208";a="11785584"
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200117133059.14602-1-aisaila@bitdefender.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <25903c05-3582-9fe1-bd7d-23f265c760ae@citrix.com>
Date: Thu, 23 Jan 2020 18:45:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200117133059.14602-1-aisaila@bitdefender.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH V8 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDEvMjAyMCAxMzozMSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gVGhp
cyBwYXRjaCBhaW1zIHRvIHNhbml0aXplIGluZGV4ZXMsIHBvdGVudGlhbGx5IGd1ZXN0IHByb3Zp
ZGVkCj4gdmFsdWVzLCBmb3IgYWx0cDJtX2VwdHBbXSBhbmQgYWx0cDJtX3AybVtdIGFycmF5cy4K
Pgo+IFJlcXVlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgo+IEFj
a2VkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpTb21ldGhpbmcg
aW4gdGhpcyBzZXJpZXMgYnJva2UgdGhlIEFSTSBidWlsZC7CoCBTb3JyeSwgYnV0IEkgZG9uJ3Qg
aGF2ZQphbnkgZnVydGhlciB0aW1lIHRvIGludmVzdGlnYXRlLgoKZ2NjIC1EQlVJTERfSUQgLWZu
by1zdHJpY3QtYWxpYXNpbmcgLXN0ZD1nbnU5OSAtV2FsbCAtV3N0cmljdC1wcm90b3R5cGVzCi1X
ZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50IC1Xbm8tdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUK
LVduby11bnVzZWQtbG9jYWwtdHlwZWRlZnMgLU8xIC1mbm8tb21pdC1mcmFtZS1wb2ludGVyIC1u
b3N0ZGluYwotZm5vLWJ1aWx0aW4gLWZuby1jb21tb24gLVdlcnJvciAtV3JlZHVuZGFudC1kZWNs
cyAtV25vLXBvaW50ZXItYXJpdGgKLVd2bGEgLXBpcGUgLURfX1hFTl9fIC1pbmNsdWRlCi9idWls
ZHMveGVuLXByb2plY3QveGVuL3hlbi9pbmNsdWRlL3hlbi9jb25maWcuaAonLURfX09CSkVDVF9G
SUxFX189ImFzbS1vZmZzZXRzLnMiJyAtV2EsLS1zdHJpcC1sb2NhbC1hYnNvbHV0ZSAtZyAtTU1E
Ci1NRiAuLy5hc20tb2Zmc2V0cy5zLmQgLW1jcHU9Z2VuZXJpYyAtbWdlbmVyYWwtcmVncy1vbmx5
Ci1JL2J1aWxkcy94ZW4tcHJvamVjdC94ZW4veGVuL2luY2x1ZGUgLWZuby1zdGFjay1wcm90ZWN0
b3IKLWZuby1leGNlcHRpb25zIC1XbmVzdGVkLWV4dGVybnMgLURHQ0NfSEFTX1ZJU0lCSUxJVFlf
QVRUUklCVVRFIC1TIC1vCmFzbS1vZmZzZXRzLnMgYXJtNjQvYXNtLW9mZnNldHMuYwpJbiBmaWxl
IGluY2x1ZGVkIGZyb20gL2J1aWxkcy94ZW4tcHJvamVjdC94ZW4veGVuL2luY2x1ZGUvYXNtL3Ay
bS5oOjcsCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gL2J1aWxkcy94ZW4t
cHJvamVjdC94ZW4veGVuL2luY2x1ZGUvYXNtL2RvbWFpbi5oOjcsCsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGZyb20gL2J1aWxkcy94ZW4tcHJvamVjdC94ZW4veGVuL2luY2x1ZGUv
eGVuL2RvbWFpbi5oOjgsCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gL2J1
aWxkcy94ZW4tcHJvamVjdC94ZW4veGVuL2luY2x1ZGUveGVuL3NjaGVkLmg6MTEsCsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gYXJtNjQvYXNtLW9mZnNldHMuYzo5OgovYnVp
bGRzL3hlbi1wcm9qZWN0L3hlbi94ZW4vaW5jbHVkZS94ZW4vbWVtX2FjY2Vzcy5oOjYxOjQ3OiBl
cnJvcjoKJ3N0cnVjdCBwMm1fZG9tYWluJyBkZWNsYXJlZCBpbnNpZGUgcGFyYW1ldGVyIGxpc3Qg
d2lsbCBub3QgYmUgdmlzaWJsZQpvdXRzaWRlIG9mIHRoaXMgZGVmaW5pdGlvbiBvciBkZWNsYXJh
dGlvbiBbLVdlcnJvcl0KwqBib29sIHhlbm1lbV9hY2Nlc3NfdG9fcDJtX2FjY2Vzcyhjb25zdCBz
dHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLArCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBefn5+fn5+fn5+Ci9idWlsZHMveGVuLXByb2plY3QveGVuL3hlbi9pbmNsdWRlL3hlbi9tZW1f
YWNjZXNzLmg6ODM6Mzg6IGVycm9yOgonc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3Zl
X211bHRpJyBkZWNsYXJlZCBpbnNpZGUgcGFyYW1ldGVyIGxpc3QKd2lsbCBub3QgYmUgdmlzaWJs
ZSBvdXRzaWRlIG9mIHRoaXMgZGVmaW5pdGlvbiBvciBkZWNsYXJhdGlvbiBbLVdlcnJvcl0KwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZV9tdWx0aQoqc3VwcHJlc3NfdmUpOwrC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpjYzE6IGFs
bCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwptYWtlWzNdOiAqKiogW01ha2VmaWxl
OjEyNDogYXNtLW9mZnNldHMuc10gRXJyb3IgMQptYWtlWzNdOiBMZWF2aW5nIGRpcmVjdG9yeSAn
L2J1aWxkcy94ZW4tcHJvamVjdC94ZW4veGVuL2FyY2gvYXJtJwptYWtlWzJdOiAqKiogW01ha2Vm
aWxlOjE0NjogL2J1aWxkcy94ZW4tcHJvamVjdC94ZW4veGVuL3hlbl0gRXJyb3IgMgptYWtlWzJd
OiBMZWF2aW5nIGRpcmVjdG9yeSAnL2J1aWxkcy94ZW4tcHJvamVjdC94ZW4veGVuJwptYWtlWzFd
OiAqKiogW01ha2VmaWxlOjUwOiBpbnN0YWxsXSBFcnJvciAyCm1ha2VbMV06IExlYXZpbmcgZGly
ZWN0b3J5ICcvYnVpbGRzL3hlbi1wcm9qZWN0L3hlbi94ZW4nCm1ha2U6ICoqKiBbTWFrZWZpbGU6
MTMwOiBpbnN0YWxsLXhlbl0gRXJyb3IgMgptYWtlOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hl
ZCBqb2JzLi4uLgoKRnVsbCBsb2dzOiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QveGVu
Ly0vam9icy80MTI4OTM0NDgKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
