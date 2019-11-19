Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8D01026DA
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 15:34:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX4XJ-0008RN-Lo; Tue, 19 Nov 2019 14:31:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J7Es=ZL=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iX4XH-0008RI-1e
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 14:31:19 +0000
X-Inumbo-ID: 3f301a4c-0ad9-11ea-a2fa-12813bfff9fa
Received: from mout02.posteo.de (unknown [185.67.36.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f301a4c-0ad9-11ea-a2fa-12813bfff9fa;
 Tue, 19 Nov 2019 14:31:17 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 5A14F2400FE
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2019 15:31:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1574173876; bh=rUCXOYXd7UjSFbCFZ3p6rSyWgaOwn6IzuB+f+S339uQ=;
 h=Subject:To:From:Date:From;
 b=nUJVjFJFG0h+7d/8mVisUQt5aVGZdjoVHeE1dnW/+m3vi9WLXhWyT/dpcPvvNTYSb
 ihlbYhSaIv9jMuwv5dCjm7EfxBdlp501yDwece7lDUr5nQL0rQWPGn69V8Vw4Loq7v
 1VeyYzZvXBzdzp/kjlB3Zvz2QbLE7yPRvm+Xy+RTPulP0nj/LsIQ+iBUfShINGyE/n
 Ob1NkFCoyAZYQlumqPw2Ntl31MHyYEj+xh03tjEzupeuM/Coa6sJAfbRmuFTRjbZ/H
 yBtxErEsF6lnnjdiQ1ifwGDhZV8AxGe2db+9ojAk/wfoZ/CjqPOGRhP0P1dE4tOqjU
 X/OEQD1c4y5bQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 47HStW06Pzz9rxZ;
 Tue, 19 Nov 2019 15:31:14 +0100 (CET)
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
References: <4bc44777-103b-ada5-839a-809da33ba00c@posteo.de>
 <10fe632c-0f08-5399-0342-f6dfd9ca9b19@posteo.de>
 <ab806fa6-bd5f-84e1-1c4b-b704b18fd020@suse.com>
 <9d781f63-c565-01fa-b289-10b31c9ad4f1@posteo.de>
 <5991e76e-f4bd-971f-110e-d87fbc19a437@posteo.de>
 <db8d7ae7-3abd-6df6-cd14-6dee3619e4be@suse.com>
From: Andreas Kinzler <hfp@posteo.de>
Message-ID: <3d021741-17eb-4d88-9628-23170ce38b0c@posteo.de>
Date: Tue, 19 Nov 2019 15:31:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <db8d7ae7-3abd-6df6-cd14-6dee3619e4be@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] wall clock drift on Coffee Lake / C24x mainboard
 (HPET broken?), best practices
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTEuMjAxOSAxMDoyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTguMTEuMjAxOSAy
MDozNSwgQW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+PiBPbiAxNS4xMS4yMDE5IDEyOjAxLCBBbmRy
ZWFzIEtpbnpsZXIgd3JvdGU6Cj4+PiBPbiAxNC4xMS4yMDE5IDEyOjI5LCBKYW4gQmV1bGljaCB3
cm90ZToKPj4+PiBPbiAxNC4xMS4yMDE5IDAwOjEwLCBBbmRyZWFzIEtpbnpsZXIgd3JvdGU6Cj4+
Pj4+IEkgY2FtZSBhY3Jvc3MgdGhlIGZvbGxvd2luZzogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIw
MTkvOC8yOS81MzYKPj4+Pj4gQ291bGQgdGhhdCBiZSB0aGUgcmVhc29uIGZvciB0aGUgcHJvYmxl
bSBtZW50aW9uZWQgYmVsb3c/IFhlbiBpcyB1c2luZwo+Pj4+PiBIUEVUIGFzIGNsb2Nrc291cmNl
IG9uIHRoZSBwbGF0Zm9ybS9tYWluYm9hcmQuIElzIHRoZXJlIGFuIChlYXN5KSB3YXkgdG8KPj4+
Pj4gdmVyaWZ5IGlmIFhlbiB1c2VzIFBDMTA/Cj4+Pj4gSGVuY2UgSSBjYW4gb25seSBzdWdnZXN0
IHRoYXQgeW91IHRyeSBhZ2FpbiB3aXRoIGxpbWl0ZWQgb3Igbm8KPj4+PiB1c2Ugb2YgQyBzdGF0
ZXMsIHRvIGF0IGxlYXN0IGdldCBhIGhpbnQgYXMgdG8gYSBwb3NzaWJsZQo+Pj4gSSBjaGFuZ2Vk
IHRoZSBCSU9TIHNldHRpbmcgdG8gYSBsaW1pdCBvZiBQQzcgYW5kIGl0IGlzIG5vdyBydW5uaW5n
LiBJCj4+PiBoYXZlIHRvIHdhaXQgZm9yIHRoZSByZXN1bHQuIFRoYW5rcy4KPj4KPj4gUHJldmlv
dXNseSB0aGUgZHJpZnQgYWZ0ZXIgNCBkYXlzIHVwdGltZSB3YXMgNjAgc2VjLiBOb3cgYWZ0ZXIg
NCBkYXlzCj4+IHVwdGltZSBkcmlmdCBpcyA5IHNlYy4gU28gc2V0dGluZyB0aGUgcGFja2FnZSBj
LXN0YXRlIGxpbWl0IHRvIFBDNyB3YXMgYQo+PiBzdWNjZXNzLgo+IAo+IDlzIHN0aWxsIHNlZW1z
IHF1aXRlIGEgbG90IHRvIG1lLCBidXQgeWVzLCBpdCdzIGFuIGltcHJvdmVtZW50LgoKSXQgc2Vl
bXMgaXQgaXMgZXZlbiBiZXR0ZXIgdGhhbiBzb21lIG90aGVyIHBsYXRmb3JtcyBub3cuIFNvbWUg
c25hcHNob3QgCm1lYXN1cmVtZW50cyBmcm9tIHJ1bm5pbmcgc3lzdGVtczoKWGVvbiBFMy0xMjMw
djUgKFNreWxha2UpOiBkcmlmdCBvZiA0IHNlYyBwZXIgZGF5ICgyMy45OTlNSHogSFBFVCkKWGVv
biBFMy0xMjQwdjYgKEthYnkgTGFrZSk6IGRyaWZ0IG9mIDEuOSBzZWMgcGVyIGRheSAoMjMuOTk5
TUh6IEhQRVQpClhlb24gRTMtMTI0MHY1IChTa3lsYWtlKTogZHJpZnQgb2YgNC44NSBzZWMgcGVy
IGRheSAoMjMuOTk5TUh6IEhQRVQpClhlb24gRTUtMTYyMHY0IChCcm9hZHdlbGwpOiBkcmlmdCBv
ZiAyLjcgc2VjIHBlciBkYXkgKDE0LjMxOE1IeiBIUEVUKQoKQWxsIHRoZXNlIHZhbHVlcyBhcmUg
bm90IGdyZWF0LCBidXQgaXQgaXMgT0sgZm9yIG1lLgoKPiBOb3cgd291bGQgeW91IGJlIHVwIHRv
IGNoZWNraW5nIHdoZXRoZXIsIHJhdGhlciB0aGFuIHZpYSBCSU9TCj4gc2V0dGluZ3MgKHdoaWNo
IG5vdCBhbGwgQklPU2VzIG1heSBvZmZlcikgdGhlIHNhbWUgY2FuIGJlCj4gYWNoaWV2ZWQgYnkg
dXNpbmcgWGVuJ3MgY29tbWFuZCBsaW5lIG9wdGlvbiAibWF4X2NzdGF0ZT0iPwo+IEFsc28gZGlk
IHlvdSBjaGVjayB3aGV0aGVyIGZ1cnRoZXIgbGltaXRpbmcgQyBzdGF0ZSB1c2Ugd291bGQKCkkg
Y2Fubm90IHRyeSBvbiBwcm9kdWN0aW9uIG1hY2hpbmVzLiBJIG1heSBoYXZlIGEgc2xvdCBvbiBs
YWIgbWFjaGluZXMgCmJ1dCBJIGNhbm5vdCBwcm9taXNlLgoKID4gZnVydGhlciBpbXByb3ZlIHRo
ZSBzaXR1YXRpb24/IEFuZCBkaWQgeW91IHBvc3NpYmx5IGFsc28gY2hlY2sKID4gd2hldGhlciB0
ZWxsaW5nIFhlbiBub3QgdG8gdXNlIHRoZSBIUEVUIHdvdWxkIG1ha2UgYSBkaWZmZXJlbmNlPwoK
V2hpY2ggb3RoZXIgY2xvY2tzb3VyY2UgZG8geW91IHByZWZlcj8gSXMgWGVuIHRlc3RlZCAoZmll
bGQtcHJvdmVuKSBvbiAKdGhhdCBvdGhlciBjbG9ja3NvdXJjZT8KClJlZ2FyZHMgQW5kcmVhcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
