Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14D313C916
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 17:19:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irlLY-0003MG-SP; Wed, 15 Jan 2020 16:16:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aRIg=3E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1irlLX-0003MB-LA
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 16:16:43 +0000
X-Inumbo-ID: 65e2c378-37b2-11ea-a985-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65e2c378-37b2-11ea-a985-bc764e2007e4;
 Wed, 15 Jan 2020 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579104994;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=yfhQ89AUy03n329KaALnQsXAsD2k5SujfGhAWGOTccE=;
 b=iFCVcVB0BoyrfsK3YZfqjkb9ZVRlkgZQwssa7klf3mQHgdb3i3jF9aoS
 qs7XFu+9ZkFrhJnoX2QhGOYNjXQA0jmrsxUK/XIoUqD1aPwiJl1HY5fEk
 IIi70pRE/C85/NbcKxhxtfaeHsPTTEwl29OBAnlyG//dlwHWGEdUvHcON Y=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Q1EsOK2SUaUVDx4UoWrJuxGHyUX0IFVkSYaMhP9LNn1L7SxZ1g0bN5S+8FDdmBAmyff30hKBxc
 l5mOWOQySE+0lWYdbGuqi0HSMF9GP6ByGF5Vk/CUBOGmst/4vh6f3XRljW6dccZBockd+jP87g
 SN8fSeOs9ynFFfJew3u0tRMchTcw31bRGv3rRQAA40WlrxJ0SZIXjSLc4v+LRq6E4M9q5D00F5
 kdfRzVXuVOuGyyyqIPlGSZ9sjIi9VTGIRKzedzi+6sPEkap1DjCz+oc/bBTCihevlfWR4r5367
 eWM=
X-SBRS: 2.7
X-MesageID: 11323797
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,323,1574139600"; d="scan'208";a="11323797"
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200103130616.13724-1-andrew.cooper3@citrix.com>
 <20200103130616.13724-3-andrew.cooper3@citrix.com>
 <24093.64011.290962.219358@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a361dbe7-3d86-c361-fa4e-d5649c9af64a@citrix.com>
Date: Wed, 15 Jan 2020 16:16:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <24093.64011.290962.219358@mariner.uk.xensource.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 16/20] tools/libxl: Simplify callback
 handling in libxl-save-helper
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
Cc: Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQvMDEvMjAyMCAxNzoyNywgSWFuIEphY2tzb24gd3JvdGU6Cj4gQW5kcmV3IENvb3BlciB3
cml0ZXMgKCJbUEFUQ0ggMTYvMjBdIHRvb2xzL2xpYnhsOiBTaW1wbGlmeSBjYWxsYmFjayBoYW5k
bGluZyBpbiBsaWJ4bC1zYXZlLWhlbHBlciIpOgo+PiBUaGUge3NhdmUscmVzdG9yZX1fY2FsbGJh
Y2sgaGVscGVycyBjYW4gaGF2ZSB0aGVpciBzY29wZSByZWR1Y2VkIHZhc3RseSwKPiBUaGlzIHBh
cnQgaXMgT0sgd2l0aCBtZSBhbHRob3VnaCBpdCB3b3VsZCBoYXZlIGJlZW4gbmljZXIgdG8gcmV2
aWV3IGlmCj4gdGhlIHRoZSBtb3ZlIGFuZCB0aGUgcmVuYW1lIHdlcmUgc2VwYXJhdGUgcGF0Y2hl
cy4gIEkgZG9uJ3Qga25vdyB3aHkKPiBpdCBpcyB2YWx1YWJsZS4KPgo+PiBhbmQgaGVscGVyX3Nl
dGNhbGxiYWNrc197c2F2ZSxyZXN0b3JlfSgpIGRvZXNuJ3QgbmVlZCB0byB1c2UgYQo+PiB0ZXJu
YXJ5IG9wZXJhdG9yIHRvIHdyaXRlIDAgKG1lYW5pbmcgTlVMTCkgaW50byBhbiBhbHJlYWR5IHpl
cm9lZAo+PiBzdHJ1Y3R1cmUuCj4gSXMgdGhpcyB1bnJlbGF0ZWQgPyAgSSB0aGluayBzby4KClRo
aXMgY2hhbmdlIGlzIHNwZWNpZmljYWxseSB0byBtYWtlIHRoZSBnZW5lcmF0ZWQgQyBlYXNpZXIg
dG8gZm9sbG93LApiZWNhdXNlIEkgaGFkIHRvIGRlYnVnIGl0IHlldCBhZ2Fpbi4KCj4+ICAgICAg
ICAgIG15ICRjX2NiID0gImNicy0+JG5hbWUiOwo+PiAgICAgICAgICAkZl9tb3JlX3NyLT4oIiAg
ICBpZiAoJGNfY2IpIGNiZmxhZ3MgfD0gJGNfdjtcbiIsICRlbnVtY2FsbGJhY2tzKTsKPj4gLSAg
ICAgICAgJGZfbW9yZV9zci0+KCIgICAgJGNfY2IgPSAoY2JmbGFncyAmICRjX3YpID8gJHtlbmNv
ZGV9XyR7bmFtZX0gOiAwO1xuIiwKPj4gKyAgICAgICAgJGZfbW9yZV9zci0+KCIgICAgaWYgKGNi
ZmxhZ3MgJiAkY192KSAkY19jYiA9ICR7ZW5jb2RlfV8ke25hbWV9O1xuIiwKPj4gICAgICAgICAg
ICAgICAgICAgICAgICRzZXRjYWxsYmFja3MpOwo+IEl0IGlzIGEgbG9uZyB0aW1lIHNpbmNlIEkg
ZWRpdGVkIHRoaXMgY29kZSBidXQgSSB0aGluayB5b3VyIHJlYXNvbmluZwo+IGlzICJjYnMgaXMg
YWxyZWFkeSB6ZXJvIG9uIGVudHJ5IGJlY2F1c2UgaXQgaXMgc3RhdGljOyB0aGVyZWZvcmUKPiBj
YnMtPiRuYW1lIG11c3QgYmUgbnVsbCwgc28gdGhlcmUgaXMgbm8gbmVlZCB0byB3cml0ZSAwIGlu
dG8gaXQgaW4gdGhlCj4gZWxzZSBjYXNlIi4KCkNvcnJlY3QuCgo+Cj4gSG93ZXZlciwgdGhlIGxp
bmUgeW91IGFyZSB0b3VjaGluZyBpcyBwcmVjZWRlZCBieSAiaWYgKCRjX2NiKSIgd2hpY2gKPiBv
bmx5IG1ha2VzIHNlbnNlIGlmIHRoZSB2YXJpYWJsZSBtaWdodCBiZSBub24tbnVsbC4KPgo+IFNv
IHNvbWV0aGluZyBpcyBub3QgcmlnaHQgaGVyZS4KClRoaXMgaXMgYWxsIHBlcmwgdG8gbWUsIGJ1
dCB0aGUgdHdvIGFkamFjZW50LWxvb2tpbmcgbGluZXMgb2YgQyBkb24ndAplbmQgdXAgYWRqYWNl
bnQgaW4gdGhlIGdlbmVyYXRlZCBjb2RlLgoKVGhlIGZpcnN0IGxpbmUgZW5kcyB1cCBpbgpsaWJ4
bF9fc3JtX2NhbGxvdXRfZW51bWNhbGxiYWNrc197c2F2ZSxyZXN0b3JlfSgpIChpbiBsaWJ4bC5z
byksIHdoaWxlCnRoZSBzZWNvbmQgbGluZSBlbmRzIHVwIGluIGhlbHBlcl9zZXRjYWxsYmFja3Nf
e3NhdmUscmVzdG9yZX0oKSAoaW4KbGlieGwtc2F2ZS1oZWxwZXIpLgoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
