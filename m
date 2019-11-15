Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD513FE0FC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 16:15:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVdHQ-0002yi-MC; Fri, 15 Nov 2019 15:13:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qjfG=ZH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iVdHP-0002yd-Uw
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:12:59 +0000
X-Inumbo-ID: 689376bc-07ba-11ea-a274-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 689376bc-07ba-11ea-a274-12813bfff9fa;
 Fri, 15 Nov 2019 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573830779;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=yI3tKyRkjVmWvHZ/cr8FrKSNGPz2/wJmmDym5mtj3SQ=;
 b=Xok2TqRQtqInTW/wQFj3LCtCfO+poWowgyGDfoJyB857d2bZGg/9l8Gm
 t4IgzWCmsfI+wzRYteqGLluiyBPW6wQS6wNa8eYKv3PAccJqokeUF1tuV
 RM/ZBbTZviGSF/fKF4Jnt3i3tvNzT80XPOKibqhyj3K6AbGMNAPACWIcz o=;
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
IronPort-SDR: OvbEqmZb/1/uzaQWhNBiDTXlQroBpldL3tZ/jOVaIPbYGTr5VKOLy3Hy9jgQR8QY7cclas6tWJ
 HebrSHTEBaX69piwrILdnWlupXjoYuhti1AqRm9uedYMeXBNGs8+Hxz8KRYjkLikh1pMZbDq5q
 HyOdeNEEFCL3BOSzyPd05jpTL6C8yJAGXyBUc0I93lTtYNgWKJ5yzcnQLpyzpIdyJUk4hxILNt
 tw0r+a4Q24mDJmUEYTCvSDyLBwjqvXuC1aeXlj/UO6evbAy3w6eLx1S+wHV0GpEEM+/Gdrtadh
 68k=
X-SBRS: 2.7
X-MesageID: 8387687
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8387687"
To: Julien Grall <Julien.Grall@arm.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <20191031192804.19928-1-andrew.cooper3@citrix.com>
 <7bd1d625-d501-6ca7-f951-9f42066436bd@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ebfea524-2ae1-8e83-3217-bc0d84ab902c@citrix.com>
Date: Fri, 15 Nov 2019 15:12:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7bd1d625-d501-6ca7-f951-9f42066436bd@arm.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/vcpu: Sanitise VCPUOP_initialise call
 hierachy
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
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMTAvMjAxOSAyMToyNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+Cj4gT24gMzEv
MTAvMjAxOSAxOToyOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gVGhpcyBjb2RlIGlzIGVzcGVj
aWFsbHkgdGFuZ2xlZC4gIFZDUFVPUF9pbml0aWFsaXNlIGNhbGxzIGludG8KPj4gYXJjaF9pbml0
aWFsaXNlX3ZjcHUoKSB3aGljaCBjYWxscyBiYWNrIGludG8gZGVmYXVsdF9pbml0aWFsaXNlX3Zj
cHUoKSB3aGljaAo+PiBpcyBjb21tb24gY29kZS4KPj4KPj4gVGhpcyBwYXRoIGlzIGFjdHVhbGx5
IGRlYWQgY29kZSBvbiBBUk0sIGJlY2F1c2UgVkNQVU9QX2luaXRpYWxpc2UgaXMgZmlsdGVyZWQK
Pj4gb3V0IGJ5IGRvX2FybV92Y3B1X29wKCkuCj4+Cj4+IFRoZSBvbmx5IHZhbGlkIHdheSB0byBz
dGFydCBhIHNlY29uZGFyeSBDUFUgb24gQVJNIGlzIHZpYSB0aGUgUFNDSSBpbnRlcmZhY2UuCj4+
IFRoZSBzYW1lIGNvdWxkIGluIHByaW5jaXBsZSBiZSBzYWlkIGFib3V0IElOSVQtU0lQSS1TSVBJ
IGZvciB4ODYgSFZNLCBpZiBIVk0KPj4gZ3Vlc3RzIGhhZG4ndCBhbHJlYWR5IGludGVyaXRlZCBh
IHBhcmF2aXJ0IHdheSBvZiBzdGFydGluZyBDUFVzLgo+Pgo+PiBFaXRoZXIgd2F5LCBpdCBpcyBx
dWl0ZSBsaWtlbHkgdGhhdCBubyBmdXR1cmUgYXJjaGl0ZWN0dXJlcyBpbXBsZW1lbnRlZCBpbiBY
ZW4KPj4gYXJlIGdvaW5nIHRvIHdhbnQgdG8gdXNlIGEgUFYgaW50ZXJmYWNlLCBhcyBzb21lIHN0
YW5kYXJkaXNlZCAodilDUFUgYnJpbmd1cAo+PiBtZWNoYW5pc20gd2lsbCBhbHJlYWR5IGV4aXN0
Lgo+IEkgYW0gbm90IHN1cmUgSSBhZ3JlZSBoZXJlLiBMb29raW5nIGF0IExpbnV4IFJJU0N2IGNv
ZGUgKHNlZSBbMV0gYW5kIAo+IFsyXSksIGl0IGxvb2tzIGxpa2UgdGhlIGtlcm5lbCBoYXMgdG8g
ZGVhbCB3aXRoIHNlbGVjdGluZyBvbmUgImx1Y2t5IiAKPiBDUFUvaGFydCB0byBkZWFsIHdpdGgg
dGhlIGJvb3QgYW5kIHBhcmsgYWxsIHRoZSBvdGhlcnMuCj4KPiBTbyBpdCBsb29rcyBsaWtlIHRv
IG1lIHRoZXJlIGFyZSBub3RoaW5nIGF0IHRoZSBtb21lbnQgb24gUklTQ3YgdG8gZG8gCj4gKHYp
Q1BVIGJyaW5nLXVwLiBXZSBtaWdodCBiZSBhYmxlIHRvIHVzZSBQU0NJIChhbHRob3VnaCB0aGlz
IGlzIGFuIEFSTSAKPiBzcGVjaWZpYyB3YXkpLCBidXQgd291bGQgcmF0aGVyIHdhaXQgYW5kIHNl
ZSB3aGF0IFJJU0N2IGZvbGtzIGNvbWUgdXAgCj4gd2l0aCBiZWZvcmUgZGVjaWRpbmcgUFYgaXMg
bmV2ZXIgZ29pbmcgdG8gYmUgdXNlZC4KCk5vdGhpbmcgaGVyZSBwcm9oaWJpdHMgb3RoZXIgYXJj
aGl0ZWN0dXJlcyBmcm9tIHVzaW5nIGEgUFYgaW50ZXJmYWNlIGlmCnRoZXkgd2lzaC4KCkhvd2V2
ZXIsIHlvdXIgZXhhbXBsZXMgcHJvdmUgbXkgcG9pbnQuwqAgVGhlcmUgaXMgYW4gYWxyZWFkeS1h
Z3JlZWQgd2F5CnRvIHN0YXJ0IFJJU0N2IENQVXMgd2hpY2ggaXMgbm90IGEgUFYgaW50ZXJmYWNl
LCBhbmQgdGhlcmVmb3JlIGlzIHZlcnkKdW5saWtlbHkgdG8gYWRvcHRlZCB0byBydW4gZGlmZmVy
ZW50bHkgdW5kZXIgWGVuLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
