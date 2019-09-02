Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107DDA5476
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 12:53:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4juf-0000Ct-CO; Mon, 02 Sep 2019 10:50:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4jue-0000Ci-Ha
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 10:50:20 +0000
X-Inumbo-ID: 7425096c-cd6f-11e9-aea1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7425096c-cd6f-11e9-aea1-12813bfff9fa;
 Mon, 02 Sep 2019 10:50:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3C4EEB023;
 Mon,  2 Sep 2019 10:50:18 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <793a54c4-902f-ca02-357f-5080f938e0d6@suse.com>
 <6bca0f32-aea3-39cc-8d71-50b4ddcbe98c@suse.com>
 <750ae778-982e-ef2b-9155-b1819e08fe90@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8250daa4-dbd3-c9a8-d5fb-6aa54bac8378@suse.com>
Date: Mon, 2 Sep 2019 12:50:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <750ae778-982e-ef2b-9155-b1819e08fe90@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/3] x86/ACPI: restore VESA mode upon
 resume from S3
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMjAxOSAxMjo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAzMC8wOC8yMDE5
IDE0OjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSW4gb3JkZXIgZm9yICJhY3BpX3NsZWVwPXMz
X21vZGUiIHRvIGhhdmUgYW55IGVmZmVjdCwgd2Ugc2hvdWxkIHJlY29yZAo+PiB0aGUgdmlkZW8g
bW9kZSB3ZSBzd2l0Y2hlZCB0byBkdXJpbmcgYm9vdC4gU2luY2UgcmlnaHQgbm93IHRoZXJlJ3Mg
bW9kZQo+PiBzZXR0aW5nIGNvZGUgZm9yIFZFU0EgbW9kZXMgb25seSBpbiB0aGUgcmVzdW1lIGNh
c2UsIHJlY29yZCB0aGUgbW9kZQo+PiBqdXN0IGluIHRoYXQgb25lIGNhc2UuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBBY2tlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClRoYW5rcy4KCj4+IC0t
LQo+PiBJJ20gd29uZGVyaW5nIGFjdHVhbGx5IHdoZXRoZXIgdGhlIHVzZXIgaGF2aW5nIHRvIGV4
cGxpY2l0bHkgcmVxdWVzdCB0aGUKPj4gbW9kZSByZXN0b3JhdGlvbiBpcyBhIGdvb2QgbW9kZWw6
IFdoeSB3b3VsZCB3ZSBfbm90XyB3YW50IHRvIHJlc3RvcmUgdGhlCj4+IG1vZGUgd2UndmUgc2V0
IGR1cmluZyBib290PyBJbiB0aGUgd29yc3QgY2FzZSBEb20wIGtlcm5lbCBvciBYIHdpbGwKPj4g
Y2hhbmdlIHRoZSBtb2RlIGFub3RoZXIgdGltZS4KPiAKPiBCeSB0aGlzLCBJIHByZXN1bWUgeW91
IG1lYW4gZHJvcCB0aGUgYWNwaV9zbGVlcCBvcHRpb24gZW50aXJlbHk/CgpXZWxsLCBubywgbm90
IGRyb3AgaXQgYWx0b2dldGhlci4gQnV0IGludmVydCB0aGUgczNfbW9kZSBkZWZhdWx0LgoKSmFu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
