Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C8811E51F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 15:01:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iflSL-0000xk-FH; Fri, 13 Dec 2019 13:58:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B4Jk=2D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iflSK-0000xf-0l
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:58:08 +0000
X-Inumbo-ID: 91e98f36-1db0-11ea-88e7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91e98f36-1db0-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 13:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576245479;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=6/pHWn8NriNiNmoFq0AOFcCOKG0yUPDxfn12affLOkw=;
 b=Sf00kvl++8bkr45K/E7serq7QFfObrqQklYjBOow6r5/yVb/81kPc1Zk
 A12xUvr15PkG4yDaAzd1B7egDkblUcTd1syh6fkfb2nIJRm6B/z2yc7sY
 SQAXMU+ietG52PIK/WnE70SVndItDhng0acRZ189/oquVOHT1r3iqQftm 8=;
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
IronPort-SDR: gRdLj5hiZzH7Nd9yb7a0bMFLFvc0Rv1xfpujmIY3wjIcnSxppSp4CRjTMd/hpe39yGmlR1YIzz
 mTmQoaacnXGY8eqSY4Eoxj7Nz1SzkOnTHxba45GXxw3EY/Df2bqaFFt3A0RmSbXNWxAuuloJE9
 +gsOVQYQgu2QreHQEqC0xLkZiV5xgLTFnqgowkWfZRo1AqOFiuapzVKrD0dnsndX5zUPmRMEIu
 gQ+BswjLkp5qUnjzkYzyYAXAYBItMfl4Ctp/CEEFbXqz+eA4cNJ89Yceb1lsAYvM/2jrp1YU5Y
 v08=
X-SBRS: 2.7
X-MesageID: 9777447
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; 
   d="scan'208";a="9777447"
To: Eslam Elnikety <elnikety@amazon.com>, Jan Beulich <jbeulich@suse.com>
References: <20191209084119.87563-1-elnikety@amazon.com>
 <180013ce-7b18-335a-f04b-1db0d4f2adf4@citrix.com>
 <eca670cd-7f8c-a662-320a-43981ba60c9a@amazon.com>
 <5bdb27b7-f827-23bd-a1dd-a0cec039ce54@suse.com>
 <e25e1ae4-d5b1-7ce8-348f-f2d1809d0635@amazon.com>
 <eb8beed3-3b9e-25f9-94bf-c6fe56a397f5@suse.com>
 <ff5b0699-5010-fabc-f7fd-2d40f8c56644@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <2d23e5e7-fe5d-3446-57e5-6559cd8e7258@citrix.com>
Date: Fri, 13 Dec 2019 13:57:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ff5b0699-5010-fabc-f7fd-2d40f8c56644@amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/microcode: Support builtin CPU microcode
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTIvMjAxOSAyMjoxMywgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4+PiBTZWNvbmQsIHRo
ZXJlIGlzIG9mdGVuIG5lZWQgdG8gY291cGxlIGEgWGVuIGJ1aWxkIHdpdGggYSBtaW5pbXVtCj4+
PiBtaWNyb2NvZGUgcGF0Y2ggbGV2ZWwuIEhhdmluZyB0aGUgbWljcm9jb2RlIGJ1aWx0IHdpdGhp
biB0aGUgWGVuIGltYWdlCj4+PiBpdHNlbGYgaXMgYSBzdHJlYW1saW5lZCwgbmF0dXJhbCB3YXkg
b2YgYWNoaWV2aW5nIHRoYXQuCj4+Cj4+IE9rYXksIEkgY2FuIGFjY2VwdCB0aGlzIGFzIGEgcmVh
c29uLCB0byBzb21lIGRlZ3JlZSBhdCBsZWFzdC4gWWV0Cj4+IGFzIHNhaWQgZWxzZXdoZXJlLCBJ
IGRvbid0IHRoaW5rIHlvdSB3YW50IHRoZW4gdG8gb3ZlcnJpZGUgYQo+PiBwb3NzaWJsZSAiZXh0
ZXJuYWwiIHVjb2RlIG1vZHVsZSB3aXRoIHRoZSBidWlsdGluIGJsb2JzLiBJbnN0ZWFkCj4+IHRo
ZSBuZXdlc3Qgb2YgZXZlcnl0aGluZyB0aGF0J3MgYXZhaWxhYmxlIHNob3VsZCB0aGVuIGJlIGxv
YWRlZC4KPgo+IEV4dGVuZGluZyBYZW4gdG8gd29yayBhcm91bmQgdG9vbHMgc2hvcnRjb21pbmdz
IGlzIGFic29sdXRlbHkgbm90IHdoYXQKPiBJIGhhdmUgaW4gbWluZC4gSSBzaG91bGQgaGF2ZSBz
dGFydGVkIHdpdGggdGhlIHNlY29uZCByZWFzb24uIFJlYWQKPiB0aGlzIGFzOiBYZW4gcmVsaWVz
IG9uIGEgbWluaW11bSBtaWNyb2NvZGUgZmVhdHVyZSBzZXQsIGFuZCBpdCBtYWtlcwo+IHNlbnNl
IHRvIGNvdXBsZSBib3RoIGluIG9uZSBiaW5hcnkuIFRoaXMgY291cGxpbmcganVzdCBoYXBwZW5z
IHRvCj4gcHJvdmlkZSBhbiBhZGRlZCBiZW5lZml0IGluIHRoZSBmYWNlIG9mIHRvb2xzIHNob3J0
Y29taW5nLgoKRG8gd2UgaGF2ZSBhbnl0aGluZyB3aGljaCBzdHJpY3RseSByZWxpZXMgb24gYSBt
aW5pbXVtIHZlcnNpb24/CgpJIGNhbiBkZWZpbml0ZWx5IHNlZSB0aGUgdmFsdWUgb2YgYnVuZGxp
bmcgdGhlIHVjb2RlIGFuZCBzYXlpbmcgInRoaXMgaXMKdGhlIG1pbmltdW0gd2Ugd2lsbCB0b2xl
cmF0ZSIgZnJvbSBhIHN1cHBvcnRhYmlsaXR5IHBvaW50IG9mIHZpZXcuCgpUaGVyZSBpcyBhbHNv
IHZhbHVlIHdoZW4gaXQgY29tZXMgdG8gZWFzaWVyIFNSVE0vRFJUTSBtZWFzdXJlbWVudHMgb2YK
dGhlIHN5c3RlbSBpbiBxdWVzdGlvbiwgaW5jbHVkaW5nIGNhc2VzIHdoZXJlIFhlbiBzaXRzIG9u
IGEgYm9vdCBST00KcmF0aGVyIHRoYW4gb24gZGlzay4KCn5BbmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
