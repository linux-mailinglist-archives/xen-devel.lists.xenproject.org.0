Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF72146E9E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 17:44:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iufYe-0000aa-SK; Thu, 23 Jan 2020 16:42:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LOIr=3M=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iufYc-0000aV-TT
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 16:42:14 +0000
X-Inumbo-ID: 4eb9ec50-3dff-11ea-be88-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4eb9ec50-3dff-11ea-be88-12813bfff9fa;
 Thu, 23 Jan 2020 16:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579797735;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wUkOk7dqNE+FKuDCBca7pWw/5Gg0pJbomgS57NZhWL8=;
 b=BBwx6gmCAVkKCf4Q/c3leQB4sISr3MKyIvFxeJIuXffYmDEl++5SXr4G
 pbXLr17VFNX7L9+7ClqjBjEYhFsVE+Ne+sfJ4p1NO6us+jGMcze7SpduI
 SR9y+4wJfcuS4miuvbKu2sYYCg73LjLC+R8bMk705IgKW8rxK4CbbkKcS g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Q7ciOMPSJ620CwqYHnQk91aX3m8La4MopgvjCiZ9PfGN+mJCikGESrhXI1jpCUktvjVad8Ewh4
 32bLu4YX2hSIyVTLNOJARXHJX8TJKlRY3VywuKe/eIIQM5KnJRYpfEoXz5zBCi9bV/9oWXcgzh
 mNbNxdjX39PmQm8OMjAk8VH1w7jNftHrk7wjd1oWSk3ePhkTKRul5LmrM6z6xawgmB1kfS1Vil
 lzl44f31aoTWNGDH30GRn4z2rqEZgjHR7qtlQ8d8oQdROteAWAPDy9fJJ4VOeYub3ejW6/OHSi
 s3g=
X-SBRS: 2.7
X-MesageID: 11513894
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,354,1574139600"; d="scan'208";a="11513894"
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <59bdc31b9fcffc92c5a8817aeba8eaa2de75a43c.1579628566.git.tamas.lengyel@intel.com>
 <f95e2a51-b866-dc6e-aa10-d81a3f5fd2c3@citrix.com>
 <CABfawhmFrebRs47jQQ_8r2aMsjyWDZH=DLnVuniD3sporPN=rQ@mail.gmail.com>
 <45e5cb4e-9c82-4085-8909-eddfe20124f1@citrix.com>
 <1e2b8d8b-ef88-1a13-15a4-42e2a4a649b3@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <74130c0a-073f-e882-51da-a523c705d2b5@citrix.com>
Date: Thu, 23 Jan 2020 16:42:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1e2b8d8b-ef88-1a13-15a4-42e2a4a649b3@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 10/18] x86/mem_sharing: Convert
 MEM_SHARING_DESTROY_GFN to a bool
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8yMy8yMCA0OjM3IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyMy4wMS4yMDIwIDE3
OjMyLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiAxLzIzLzIwIDQ6MjMgUE0sIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPj4+IE9uIFRodSwgSmFuIDIzLCAyMDIwIGF0IDk6MTQgQU0gR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPj4+Pgo+Pj4+IE9uIDEv
MjEvMjAgNTo0OSBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4+PiBNRU1fU0hBUklOR19E
RVNUUk9ZX0dGTiBpcyB1c2VkIG9uIHRoZSAnZmxhZ3MnIGJpdGZpZWxkIGR1cmluZyB1bnNoYXJp
bmcuCj4+Pj4+IEhvd2V2ZXIsIHRoZSBiaXRmaWVsZCBpcyBub3QgdXNlZCBmb3IgYW55dGhpbmcg
ZWxzZSwgc28ganVzdCBjb252ZXJ0IGl0IHRvIGEKPj4+Pj4gYm9vbCBpbnN0ZWFkLgo+Pj4+Pgo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwu
Y29tPgo+Pj4+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
Pj4+Cj4+Pj4gQnV0IGlzIHRoZXJlIGEgcGFydGljdWxhciBhZHZhbnRhZ2UgdG8gZ2V0dGluZyBy
aWQgb2YgdGhlIGJpdGZpZWxkPwo+Pj4+Cj4+Pj4gWW91J3JlIHRoZSBtYWludGFpbmVyLCBzbyBp
dCdzIHlvdXIgZGVjaXNpb24gb2YgY291cnNlLiAgQnV0IGlmIGl0IHdlcmUKPj4+PiBtZSBJJ2Qg
bGVhdmUgaXQgYXMgYSBiaXRmaWVsZCBzbyB0aGF0IGFsbCB0aGUgYml0ZmllbGQgY29kZSBpcyB0
aGVyZSBpZgo+Pj4+IGl0J3MgbmVlZGVkIGluIHRoZSBmdXR1cmUuICBGbGlwcGluZyBpdCB0byBh
IGJvb2wsIHdpdGggdGhlIHJpc2sgb2YKPj4+PiBmbGlwcGluZyBpdCBiYWNrIHRvIGEgYml0Zmll
bGQgbGF0ZXIsIHNlZW1zIGxpa2UgcG9pbnRsZXNzIGNodXJuIHRvIG1lLgo+Pj4+Cj4+Pj4gKEFs
dGhvdWdoIHBlcmhhcHMgdGhlIHJlYXNvbiB3aWxsIGJlY29tZSBldmlkZW50IGJ5IHRoZSB0aW1l
IEkgZ2V0IHRvCj4+Pj4gdGhlIGVuZCBvZiB0aGUgc2VyaWVzLikKPj4+Cj4+PiBQcm92aWRlZCBp
dHMgYmVlbiBtYW55IHllYXJzIHNpbmNlIHRoaXMgY29kZSBoYXMgYmVlbiBhZGRlZCB3aXRoIG5v
Cj4+PiBuZWVkIGZvciBhbnkgZXh0cmEgYml0cywgYW5kIHdpdGggbm8gZXhwZWN0YXRpb25zIHRo
YXQgdGhpcyB3b3VsZAo+Pj4gY2hhbmdlIGFueSB0aW1lIHNvb24sIEkgd291bGRuJ3Qgd29ycnkg
YWJvdXQgdGhhdC4gVHJ1ZSwgdGhlcmUgaXMgdmVyeQo+Pj4gbGl0dGxlIGRpZmZlcmVuY2UgYmV0
d2VlbiBrZWVwaW5nIHRoZSBjb2RlIGFzLWlzIHZzIGNvbnZlcnRpbmcgaXQgdG8KPj4+IGJvb2ws
IGJ1dCBJTUhPIGl0IG1ha2VzIHRoZSBjb2RlIGVhc2llciB0byBmb2xsb3cgd2l0aG91dCB5b3UK
Pj4+IHdvbmRlcmluZyB3aGF0IG1pZ2h0IGJlIHRob3NlIG5vbi1leGlzdGVudCBzaXR1YXRpb25z
IHRoYXQgd2FycmFudGVkCj4+PiBpdCB0byBiZSBhIGJpdG1hcCB0byBiZWdpbiB3aXRoLgo+Pgo+
PiBJdCdzIGRlZmluaXRlbHkgYSBqdWRnZW1lbnQgY2FsbCwgYW5kIEkgY2FuIHNlZSB3aGVyZSB5
b3UncmUgY29taW5nCj4+IGZyb20uICBMaWtlIEkgc2FpZCwgaWYgaXQgd2VyZSBtZSBJJ2QgbGVh
dmUgaXQsIGJ1dCBpdCdzIG5vdC4gOi0pICAgSnVzdAo+PiB3YW50ZWQgdG8gcmFpc2UgdGhlIGlz
c3VlIGFzIEkgd2FzIGdvaW5nIHRocm91Z2guICBJJ2QgQWNrIGl0IGJ1dCB5b3UndmUKPj4gYWxy
ZWFkeSBnb3QgYW4gUi1iLgo+IAo+IFVudGlsIHlvdXIgcHJvcG9zYWwgZ2V0cyBhY2NlcHRlZCwg
aXNuJ3QgaXQgdGhhdCB5b3VyIGFjayBpcyBuZWVkZWQKPiBkZXNwaXRlIHRoZSBSLWI/IFRoaXMg
aXMgYWxzbyB3aHkgZS5nLiBmb3IgcGF0Y2ggMiBJIGRpZG4ndCBzZWUgYQo+IHBvaW50IGluIHNl
bmRpbmcgYW55IFItYiwgYXMgdGhlIHBhdGNoIHdpbGwgbmVlZCB5b3VyIGFjayBhbnl3YXksCj4g
YW5kIGl0J3Mgc28gc2ltcGxlIHRoYXQgInJldmlld2VkIiB3b3VsZCBiZSBhbiBvdmVyc3RhdGVt
ZW50LgoKSSBkb24ndCB0aGluayBJJ20gY28tbWFpbnRhaW5lciBvZiB0aGlzOyBhbmQgeW91J3Jl
IGEgbGVzcy1zcGVjaWZpYwptYWludGFpbmVyIHRoYW4gVGFtYXMsIHJpZ2h0PyAgRG8geW91IG5l
ZWQgbXkgQWNrPwoKSSdtIGhhcHB5IHRvIGdvIGJhY2sgYW5kIEFjayBhbGwgdGhlIG1tLyBvbmVz
IHlvdSd2ZSBnaXZlbiBhbiBSLWIgdG8gdXAKdW50aWwgdGhpcyBwb2ludCBpbiB0aGUgc2VyaWVz
OyBJIGp1c3QgZGlkbid0IHRoaW5rIGl0IHdhcyBuZWNlc3NhcnkuCgpJJ2xsIHByb2JhYmx5IEFj
ayBwYXRjaCAyIG9uY2UgSSBiZWNvbWUgY29udmluY2VkIHRoZSBjaGFuZ2UgaW4gdGhhdApwYXRj
aCBpcyBuZWNlc3NhcnkgKHdoaWNoIEknbSBndWVzc2luZyBtaWdodCBiZSB3aGVuIEkgZ2V0IHRv
IDE1LzE4KS4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
