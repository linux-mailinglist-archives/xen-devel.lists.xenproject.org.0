Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62D0126632
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 16:56:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihy7a-0005EH-Bj; Thu, 19 Dec 2019 15:53:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihy7Y-0005EB-Qn
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 15:53:48 +0000
X-Inumbo-ID: b95eb0fc-2277-11ea-a1e1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b95eb0fc-2277-11ea-a1e1-bc764e2007e4;
 Thu, 19 Dec 2019 15:53:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BC64EACC0;
 Thu, 19 Dec 2019 15:53:38 +0000 (UTC)
To: Sergey Kovalev <valor@list.ru>
References: <771dc0cf-3289-0bc4-4938-07144245f2f2@list.ru>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <66fd2f6b-0097-9906-f4c5-19281922182b@suse.com>
Date: Thu, 19 Dec 2019 16:54:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <771dc0cf-3289-0bc4-4938-07144245f2f2@list.ru>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v4] x86/vm_event: add short-circuit for
 breakpoints (aka "fast single step")
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTIuMjAxOSAxNjo0NywgU2VyZ2V5IEtvdmFsZXYgd3JvdGU6Cj4gV2hlbiB1c2luZyBE
UkFLVlVGIChvciBhbm90aGVyIHN5c3RlbSB1c2luZyBhbHRwMm0gd2l0aCBzaGFkb3cgcGFnZXMg
c2ltaWxhcgo+IHRvIHdoYXQgaXMgZGVzY3JpYmVkIGluCj4gaHR0cHM6Ly94ZW5wcm9qZWN0Lm9y
Zy8yMDE2LzA0LzEzL3N0ZWFsdGh5LW1vbml0b3Jpbmctd2l0aC14ZW4tYWx0cDJtKSwKPiBhZnRl
ciBhIGJyZWFrcG9pbnQgaXMgaGl0IHRoZSBzeXN0ZW0gc3dpdGNoZXMgdG8gdGhlIGRlZmF1bHQK
PiB1bnJlc3RyaWN0ZWQgYWx0cDJtIHZpZXcgd2l0aCBzaW5nbGVzdGVwIGVuYWJsZWQuIFdoZW4g
dGhlIHNpbmdsZXN0ZXAKPiB0cmFwcyB0byBYZW4gYW5vdGhlciB2bV9ldmVudCBpcyBzZW50IHRv
IHRoZSBtb25pdG9yIGFnZW50LCB3aGljaCB0aGVuCj4gbm9ybWFsbHkgZGlzYWJsZXMgc2luZ2xl
c3RlcHBpbmcgYW5kIHN3aXRjaGVzIHRoZSBhbHRwMm0gdmlldyBiYWNrIHRvCj4gdGhlIHJlc3Ry
aWN0ZWQgdmlldy4KPiAKPiBUaGlzIHBhdGNoIHNob3J0LWNpcmN1aXRpbmcgdGhhdCBsYXN0IHBh
cnQgc28gdGhhdCBpdCBkb2Vzbid0IG5lZWQgdG8gc2VuZCB0aGUKPiB2bV9ldmVudCBvdXQgZm9y
IHRoZSBzaW5nbGVzdGVwIGV2ZW50IGFuZCBzaG91bGQgc3dpdGNoIGJhY2sgdG8gdGhlIHJlc3Ry
aWN0ZWQKPiB2aWV3IGluIFhlbiBhdXRvbWF0aWNhbGx5Lgo+IAo+IFRoaXMgb3B0aW1pemF0aW9u
IGdhaW5zIGFib3V0IDM1JSBzcGVlZC11cC4KPiAKPiBXYXMgdGVzdGVkIG9uIERlYmlhbiBicmFu
Y2ggb2YgWGVuIDQuMTIuIFNlZSBhdDoKPiBodHRwczovL2dpdGh1Yi5jb20vc2t2bC94ZW4vdHJl
ZS9kZWJpYW4va25vcnJpZS80LjEyL2Zhc3Qtc2luZ2xlc3RlcAo+IAo+IFJlYmFzZWQgb24gbWFz
dGVyOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9za3ZsL3hlbi90cmVlL2Zhc3Qtc2luZ2xlc3RlcAo+
IAo+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBLb3ZhbGV2IDx2YWxvckBsaXN0LnJ1PgoKWW91J3Zl
IGxvc3QKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KZm9yIGFwcGxp
Y2FibGUgYml0cywgYXMgZ2l2ZW4gb24gdjMgd2l0aCB0aGUgb25lIGlzc3VlIGFkZHJlc3NlZC4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
