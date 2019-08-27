Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6358F9F2B1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 20:52:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2gVd-0006nY-1G; Tue, 27 Aug 2019 18:48:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ssFz=WX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i2gVb-0006nT-1i
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 18:47:59 +0000
X-Inumbo-ID: 2fb50232-c8fb-11e9-ae39-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2fb50232-c8fb-11e9-ae39-12813bfff9fa;
 Tue, 27 Aug 2019 18:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566931677;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=a66QGGQqyGThOKhKUpz0FwrcX8oGf8y0qSoFoJHEjjE=;
 b=ORc0UwW6aO+wrZi6aoAcJYKqJ6jOer0O6avlUM6MIn2RlmOcgl+fM88X
 8SoSK7VhrHEwTQplKUzfGC2vnw0yCNEldEuntEj8N+MK0v9KuMoxeoPa4
 VRyjwo20KRnLk6L0dTfvYz3MTlcyI3KGb+5omghXbza/xD7zq7a+XiPRV c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cuWMndfcdw3HSIlqgjDZP8ijpg2jX2Yc4F9X5pTYtAV1lK+22GlpdFV4lc6PraAl2i4yYOme6K
 E8v2cgTHKk/IXviIxgosqLSEDll8a0+iAIE5HWhOLUChtFcZ40jikeqJxbmDDqsYmveX24Xjkl
 ojOJCWJG5heXQJRbcKxy8olClAeLHhCKVtPhXe2vksYkFZ6XRkcnEQAsUrbtMtpV5xA7JrVWi5
 amDkiCnQyQjeH4fddXek6PiHh/5Up3XLBfpghTbvKaRP8jUyXVoo4qF94kSYbt7XfqyhcwRPiu
 LU0=
X-SBRS: 2.7
X-MesageID: 5010026
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,438,1559534400"; 
   d="scan'208";a="5010026"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
 <3f30c73d-94a7-f9ca-5914-0400f1f98cc3@suse.com>
 <fc5f0b03-2e69-8fa9-289f-50e8abb57210@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <fa1c12e7-8567-450f-d8a5-3d92beaa6cec@citrix.com>
Date: Tue, 27 Aug 2019 19:47:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fc5f0b03-2e69-8fa9-289f-50e8abb57210@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/6] x86emul: generalize wbinvd() hook
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
Cc: Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>, RogerPau
 Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDgvMjAxOSAxMTo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gSSB3YXMgYWxzbyB1
bmNlcnRhaW4gYWJvdXQgdGhlIG5ldyBjYWNoZV9mbHVzaF9wZXJtaXR0ZWQoKSBpbnN0YW5jZSAt
Cj4+IGdlbmVyYWxseSBJIHRoaW5rIGl0IHdvdWxkbid0IGJlIHRvbyBiYWQgaWYgd2UgYWxsb3dl
ZCBsaW5lIGZsdXNoZXMgaW4KPj4gYWxsIGNhc2VzLCBpbiB3aGljaCBjYXNlIHRoZSBjaGVja3Mg
aW4gdGhlIC0+d2JpbnZkX2ludGVyY2VwdCgpIGhhbmRsZXJzCj4+IHdvdWxkIHN1ZmZpY2UgKGFz
IHRoZXkgZGlkIHVudGlsIG5vdykuCj4gVGhpcyBpcyBhIG1vcmUgZ2VuZXJhbCBpc3N1ZSB3aGlj
aCB3ZSBuZWVkIHRvIGFkZHJlc3MuwqAgVG8gc3VwcG9ydAo+IGVuY3J5cHRlZCBtZW1vcnkgaW4g
Vk0ncywgd2UgbXVzdCBndWFyYW50ZWUgdGhhdCBXQyBtYXBwaW5ncyB3aGljaCB0aGUKPiBndWVz
dCBjcmVhdGVzIGFyZSByZWFsbHkgV0MsIHdoaWNoIG1lYW5zIHdlIG11c3Qgbm90IHVzZSBJUEFU
IG9yIHBsYXkKPiBhbnkgImZhbGwgYmFjayB0byBXQiIgZ2FtZXMuCj4KPiBGdXJ0aGVybW9yZSwg
QU1EJ3MgZW5jcnlwdC1pbi1wbGFjZSBhbGdvcml0aG0gcmVxdWlyZXMgdGhlIGd1ZXN0IHRvIGJl
Cj4gYWJsZSB0byB1c2UgV0JJTlZELgoKQmFzZWQgb24gc29tZSBmZWVkYmFjaywgdGhlIGVuY3J5
cHQtaW4tcGxhY2UgYWxnb3JpdGhtIGlzIG9ubHkgZm9yCm5hdGl2ZSBzaXR1YXRpb25zIHRyeWlu
ZyB0byB1c2UgU01FLCB3aGVyZSB0aGUgbG9hZGluZyBrZXJuZWwvaHlwZXJ2aXNvcgpuZWVkcyB0
byBlbmNyeXB0IGl0c2VsZi4KClNFViBndWVzdHMgcnVuIGVuY3J5cHRlZCBmcm9tIHRoZSBzdGFy
dCwgYW5kIGhhdmUgbm8gbmVlZCB0bwplbmNyeXB0L2RlY3J5cHQgaW4gcGxhY2UuwqAgVGhlIGV4
cGVjdGVkIHdheSBpcyB0byBjb3B5IGJldHdlZW4gYW4KZW5jcnlwdGVkIGFuZCBub24tZW5jcnlw
dGVkIGJ1ZmZlciBpbiBzZXBhcmF0ZSBHRk5zLgoKVGhlIFdCSU5WRCBpcyB0byBlbnN1cmUgdGhh
dCBkaXJ0eSBjYWNoZSBsaW5lcyBhcmVuJ3QgY29ycnVwdGVkIGJ5IHRoZQpXUCBtYXBwaW5nLCBh
bmQgQ0xGTFVTSCAob3IgYW55IGVxdWl2YWxlbnQgZnVsbCBldmljdGlvbikgY2FuIGJlCnN1YnN0
aXR1dGVkLCBidXQgZm9yIHRoZSBpbnRlbmRlZCB1c2VjYXNlLCBhIHNpbmdsZSBXQklOVkQgaXMg
dGhlCm9wdGltdW0gc3RyYXRlZ3kuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
