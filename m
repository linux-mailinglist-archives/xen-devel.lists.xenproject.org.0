Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F53132F00
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 20:08:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iouAC-00042U-6A; Tue, 07 Jan 2020 19:05:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cF2B=24=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iouAA-00042P-Rs
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 19:05:10 +0000
X-Inumbo-ID: 9aed3cf2-3180-11ea-bf56-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9aed3cf2-3180-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 19:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578423901;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+OH8R9Xu/6quL/PDSUVrZ+8ahw7u9bk5ksTT2dsv5Yk=;
 b=eRwxHTHq4jPVdMINM8xN8TD8NRA2SN6lT3528KrFwfvLYDnrQx24CHv1
 2f/PhKmfbcH6+W+/KYZUOLkO3u8iSA3Krw/JWGHpIycKZjP9243l5miNO
 98ebIn0kC0hV3iGdQT4EdbMefJYIrv7aI1m2BwaFOMse5pCw0gs/SJS7k g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ytnFsNdq3IrjwTjfwuuDCcvbKav6fC/avTARfJ7i9y+8EVStmjic3E5ziCuxDoIj9HB0kS7DRn
 qqpTC3n/XJ5OCOHoMnaXyd6VsGKB1j/I6mRPaHXjO2dADv1Z1iYTHxwKVRuVHeSPY9LeQUMWrY
 qu6IO67QBy1rEpLw8rPtD39aslJ7mc1nI+FXScd3Zv3faGWMR7L2qvSf9Od8knOJomktdslX3F
 DHWlL5lGcg8WRZeiEJHlixiNcK50Txz/F+FpSEu1U2EcTdbj4ok7azzrJEjkUyGE/Xbl0AlQtn
 hZY=
X-SBRS: 2.7
X-MesageID: 11171432
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,406,1571716800"; d="scan'208";a="11171432"
To: Jan Beulich <jbeulich@suse.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-3-andrew.cooper3@citrix.com>
 <145d6e59-b50e-b617-cbb5-48ebed002c23@suse.com>
 <fd2d333a-8127-2688-acb7-b082955f9eb5@citrix.com>
 <b07c66db-193e-7bb0-7ea2-12d876b3ccac@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b60a3b8b-351f-5756-3726-fedd3b8bcec9@citrix.com>
Date: Tue, 7 Jan 2020 19:04:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b07c66db-193e-7bb0-7ea2-12d876b3ccac@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/6] x86/boot: Map the trampoline as
 read-only
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDEvMjAyMCAxNjoxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDcuMDEuMjAyMCAx
Njo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDcvMDEvMjAyMCAxNToyMSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwNi4wMS4yMDIwIDE2OjU0LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IGMvcyBlYzkyZmNkMWQwOCwgd2hpY2ggY2F1c2VkIHRoZSB0cmFtcG9saW5lIEdEVCBB
Y2Nlc3MgYml0cyB0byBiZSBzZXQsCj4+Pj4gcmVtb3ZlZCB0aGUgZmluYWwgd3JpdGVzIHdoaWNo
IG9jY3VycmVkIGJldHdlZW4gZW5hYmxpbmcgcGFnaW5nIGFuZCBzd2l0Y2hpbmcKPj4+PiB0byB0
aGUgaGlnaCBtYXBwaW5ncy4gIFRoZXJlIGRvbid0IHBsYXVzaWJseSBuZWVkIHRvIGJlIGFueSBt
ZW1vcnkgd3JpdGVzIGluCj4+Pj4gZmV3IGluc3RydWN0aW9ucyBpcyB0YWtlcyB0byBwZXJmb3Jt
IHRoaXMgdHJhbnNpdGlvbi4KPj4+Pgo+Pj4+IEFzIGEgY29uc2VxdWVuY2UsIHdlIGNhbiByZW1v
dmUgdGhlIFJXWCBtYXBwaW5nIG9mIHRoZSB0cmFtcG9saW5lLiAgSXQgaXMgUlgKPj4+PiB2aWEg
aXRzIGlkZW50aXR5IG1hcHBpbmcgYmVsb3cgMU0sIGFuZCBSVyB2aWEgdGhlIGRpcmVjdG1hcC4K
Pj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Cj4+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+Pj4KPj4+PiBUaGlzIHByb2JhYmx5IHdhbnRzIGJhY2twb3J0aW5nLCBhbG9uZ3NpZGUgZWM5
MmZjZDFkMDggaWYgaXQgaGFzbid0IHlldC4KPj4+IFRoaXMgaXMganVzdCBjbGVhbnVwLCBsYXJn
ZWx5IGNvc21ldGljIGluIG5hdHVyZS4gSXQgY291bGQgYmUgYXJndWVkCj4+PiB0aGF0IG9uY2Ug
dGhlIGRpcmVjdG1hcCBoYXMgZGlzYXBwZWFyZWQgdGhpcyBjYW4gc2VydmUgYXMgYWRkaXRpb25h
bAo+Pj4gcHJvb2YgdGhhdCB0aGUgdHJhbXBvbGluZSByYW5nZSBoYXMgbm8gKGludGVuZGVkKSB3
cml0YWJsZSBtYXBwaW5ncwo+Pj4gYW55bW9yZSwgYnV0IHByaW9yIHRvIHRoYXQgcG9pbnQgSSBk
b24ndCBzZWUgbXVjaCBmdXJ0aGVyIGJlbmVmaXQuCj4+PiBDb3VsZCB5b3UgZXhwYW5kIG9uIHRo
ZSByZWFzb25zIHdoeSB5b3Ugc2VlIGJvdGggYXMgYmFja3BvcnRpbmcKPj4+IGNhbmRpZGF0ZXM/
Cj4+IERlZmVuY2UgaW4gZGVwdGguCj4+Cj4+IEFuIFJXWCBtYXBwaW5nIGlzIHZlcnkgYXR0cmFj
dGl2ZSBmb3IgYW4gYXR0YWNrZXIgd2hvJ3MgYnJva2VuIGludG8gWGVuCj4+IGFuZCBpcyBsb29r
aW5nIHRvIGV4cGFuZCB0aGUgZGFtYWdlIHRoZXkgY2FuIGRvLgo+IFN1Y2ggYW4gYXR0YWNrZXIg
aXMgdHlwaWNhbGx5IGluIHRoZSBwb3NpdGlvbiB0aG91Z2ggdG8gbWFrZQo+IHRoZW1zZWx2ZXMg
UldYIG1hcHBpbmdzLgoKVGhpcyBpcyBvbmUgZXhhbXBsZSBvZiBhIHBvc3NpYmlsaXR5LsKgIEkg
d291bGRuJ3QgcHV0IGl0IGluIHRoZSAibGlrZWx5IgpjYXRlZ29yeSwgYW5kIGl0IGRlZmluaXRl
bHkgaXNuJ3QgYSBndWFyYW50ZWUuCgo+ICBIYXZpbmcgYXMgbGl0dGxlIGFzIHBvc3NpYmxlIGlz
IG9ubHkKPiBjb21wbGljYXRpbmcgdGhlaXIgam9iLCBub3QgbWFraW5nIGl0IGltcG9zc2libGUs
IEkgd291bGQgc2F5LgoKWWVzLCBhbmQ/CgpUaGlzIGlzIHRoZSBlbnRpcmUgcG9pbnQgb2YgZGVm
ZW5jZSBpbiBkZXB0aC7CoCBNYWtlIGFuIGF0dGFja2VycyBqb2IgaGFyZGVyLgoKRW5mb3JjaW5n
IFdeWCBpcyB1bml2ZXJzYWxseSBjb25zaWRlcmVkIGEgZ29vZCB0aGluZyBmcm9tIGEgc2VjdXJp
dHkKcGVyc3BlY3RpdmUsIGJlY2F1c2UgaXQgcmVtb3ZlcyBhIGxvYWQgb2YgdHJpdmlhbCBjYXNl
cyBjYXNlcyB3aGVyZSBhCnN0YWNrIG92ZXItd3JpdGUgY2FuIGVhc2lseSBiZSB0dXJuZWQgaW50
byBhcmJpdHJhcnkgY29kZSBleGVjdXRpb24uCgpTdXJlIC0gdGhpcyBpc24ndCBnb2luZyB0byBz
dG9wIGFuIGF0dGFja2VyIHdobyBoYXMgYXJiaXRyYXJ5IHdyaXRlCmV4cGxvaXQsIGJ1dCBpdCB2
ZXJ5IHdlbGwgbWlnaHQgc3RvcCBhbiBhdHRhY2tlciB3aG8gb25seSBoYXMgcmVzdHJpY3RlZAp3
cml0ZSBleHBsb2l0LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
