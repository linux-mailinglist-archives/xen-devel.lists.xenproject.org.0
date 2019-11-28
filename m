Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 072F210CADB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 15:56:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaLBl-00018C-H4; Thu, 28 Nov 2019 14:54:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PDnJ=ZU=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iaLBk-000183-6b
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 14:54:36 +0000
X-Inumbo-ID: fe196168-11ee-11ea-a55d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe196168-11ee-11ea-a55d-bc764e2007e4;
 Thu, 28 Nov 2019 14:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574952875;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=lhC/3kuHeXGwLMlgZcri7omBZPEJJ4K7gOh9QFGp4Lw=;
 b=SIYGewu9zkJAqN4lU5/FrrfEeg0c+sj3Tiu8mbpKqs6qAWkKk2TTYbj1
 TNy5EbXS/zM2Bs1LGPh6cWY0jWz6/f8aoFMLx1ab4S/dpmnlX47NzDuD+
 cYeP8hX5qGljh/H7LCIMf6zy1lS/4ACPRDkcIqxoHxAB79nOhomoY6S6b 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NsbROrrW+gmEAeKUTvmv5nie+IY1DB50p0EVZ1V44mEIUslJF9kCti1jrUa2ExFhOpqwec0P/8
 HFUQtilr5ky24FzDkvJnW3p4GceVCBJ8DKkYVyPb2BId0mFCbpn9UVgFQLZNO5BYeZPpTObHIm
 93b5k77KRSnKYcWiNgmItb8rMQWMtLLARwT7E0/qSnZP9qzZuRvPtj6KSkwLBPobfbxhq5mvR/
 Sc+PHpThbnl3dP1SsGH8ZNAjaEVgBpdm7MuUHE0z0fTnWu37s3PeJ/DY9EEIiupdqxEaX1rNTd
 I6Y=
X-SBRS: 2.7
X-MesageID: 8961528
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,253,1571716800"; 
   d="scan'208";a="8961528"
To: Hans van Kranenburg <hans@knorrie.org>, "Durrant, Paul"
 <pdurrant@amazon.com>, Ian Jackson <ian.jackson@citrix.com>
References: <20191126171747.3185988-1-george.dunlap@citrix.com>
 <20191126171747.3185988-2-george.dunlap@citrix.com>
 <24029.25218.75565.126333@mariner.uk.xensource.com>
 <c95b8096d1054d88bce16310aafe978a@EX13D32EUC003.ant.amazon.com>
 <24030.22924.67150.575753@mariner.uk.xensource.com>
 <19cdd60b0df341d38f94fa6433ef568c@EX13D32EUC003.ant.amazon.com>
 <bdbaf3d0-4b78-cbc9-3943-5bc4cfd7cb27@knorrie.org>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <414ed314-29fc-1b16-9516-790e53a65a4c@citrix.com>
Date: Thu, 28 Nov 2019 14:54:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bdbaf3d0-4b78-cbc9-3943-5bc4cfd7cb27@knorrie.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjcvMTkgMTA6MzIgUE0sIEhhbnMgdmFuIEtyYW5lbmJ1cmcgd3JvdGU6Cj4gSGkgYWxs
LAo+IAo+IE9uIDExLzI3LzE5IDEyOjEzIFBNLCBEdXJyYW50LCBQYXVsIHdyb3RlOgo+Pj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBjaXRyaXguY29tPgo+Pj4gU2VudDogMjcgTm92ZW1iZXIgMjAxOSAxMToxMAo+Pj4gWy4uLl0K
Pj4+IFN1YmplY3Q6IFJFOiBbWGVuLWRldmVsXSBbUEFUQ0ggZm9yLTQuMTMgMi8yXSBSYXRpb25h
bGl6ZSBtYXhfZ3JhbnRfZnJhbWVzCj4+PiBhbmQgbWF4X21hcHRyYWNrX2ZyYW1lcyBoYW5kbGlu
Zwo+Pj4KPj4+IER1cnJhbnQsIFBhdWwgd3JpdGVzICgiUkU6IFtYZW4tZGV2ZWxdIFtQQVRDSCBm
b3ItNC4xMyAyLzJdIFJhdGlvbmFsaXplCj4+PiBtYXhfZ3JhbnRfZnJhbWVzIGFuZCBtYXhfbWFw
dHJhY2tfZnJhbWVzIGhhbmRsaW5nIik6Cj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
Cj4+Pj4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVj
dC5vcmc+IE9uIEJlaGFsZiBPZgo+Pj4gSWFuCj4+Pj4+IEphY2tzb24KPj4+Pj4gSSBoYXZlIHNl
ZW4gcmVwb3J0cyBvZiB1c2VycyB3aG8gcmFuIG91dCBvZiBncmFudC9tYXB0cmFjayBmcmFtZXMK
Pj4+Pj4gYmVjYXVzZSBvZiB1cGRhdGVzIHRvIHVzZSBtdWx0aXJpbmcgcHJvdG9jb2xzIGV0Yy4g
IFRoZSBlcnJvciBtZXNzYWdlcwo+Pj4+PiBhcmUgbm90IHZlcnkgZ29vZCBhbmQgdGhlIHJlY29t
bWVuZGVkIHdvcmthcm91bmQgaGFzIGJlZW4gdG8gaW5jcmVhc2UKPj4+Pj4gdGhlIGRlZmF1bHQg
bGltaXQgb24gdGhlIGh5cGVydmlzb3IgY29tbWFuZCBsaW5lLgo+Pj4+Pgo+Pj4+PiBJdCBpcyBp
bXBvcnRhbnQgdGhhdCB3ZSBkb24ndCBicmVhayB0aGF0IHdvcmthcm91bmQhCj4+Pj4KPj4+PiBB
bGFzIGl0IGhhcyBhcHBhcmVudGx5IGJlZW4gYnJva2VuIGZvciBzZXZlcmFsIHJlbGVhc2VzIG5v
dyA6LSgKPj4+Cj4+PiBJIGd1ZXNzIGF0IGxlYXN0IGluIERlYmlhbiAod2hlcmUgSSBoYXZlIHNl
ZW4gdGhpcykgd2UgaGF2ZW4ndAo+Pj4gcmVsZWFzZWQgd2l0aCBhbnkgYWZmZWN0ZWQgdmVyc2lv
bnMgeWV0Li4uCj4+Cj4+IEkgYmVsaWV2ZSB0aGUgcHJvYmxlbSB3YXMgaW50cm9kdWNlIGluIDQu
MTAsIHNvIEkgdGhpbmsgaXQgd291bGQgYmUgcHJ1ZGVudCB0byBhbHNvIGJhY2stcG9ydCB0aGUg
ZmluYWwgZml4IHRvIHN0YWJsZSB0cmVlcyBmcm9tIHRoZW4gb24uCj4gCj4gWWVzLCB0aGUgbWF4
IGdyYW50IGZyYW1lIGlzc3VlIGhhcyBoaXN0b3JpY2FsbHkgYWx3YXlzIGJlZW4gYSBwYWluZnVs
Cj4gZXhwZXJpZW5jZSBmb3IgZW5kIHVzZXJzLCBhbmQgWGVuIDQuMTEgd2hpY2ggd2Ugbm93IGhh
dmUgaW4gdGhlIGN1cnJlbnQKPiBEZWJpYW4gc3RhYmxlIGhhcyBtYWRlIGl0IHdvcnNlIGNvbXBh
cmVkIHRvIHByZXZpb3VzIHZlcnNpb25zIGluZGVlZC4KClRoaXMgcmF0aGVyIHN1Z2dlc3RzIHRo
YXQgdGhlIGRlZmF1bHQgdmFsdWUgaXNuJ3QgdmVyeSB3ZWxsIGNob3Nlbi4KSWRlYWxseSBzb21l
IGludmVzdGlnYXRpb24gd291bGQgYmUgZG9uZSB0byBpbXByb3ZlIHRoZSBkZWZhdWx0IHNpemlu
ZzsKZW5kLXVzZXJzIHNob3VsZG4ndCBoYXZlIHRvIGtub3cgYW55dGhpbmcgYWJvdXQgZ3JhbnQg
dGFibGUgZnJhbWVzLgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
