Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DBD10208D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 10:32:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWzpb-0006ww-QR; Tue, 19 Nov 2019 09:29:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=56Vh=ZL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWzpZ-0006wr-TG
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 09:29:53 +0000
X-Inumbo-ID: 23bd421e-0aaf-11ea-a2f8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23bd421e-0aaf-11ea-a2f8-12813bfff9fa;
 Tue, 19 Nov 2019 09:29:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D1F46AEA1;
 Tue, 19 Nov 2019 09:29:51 +0000 (UTC)
To: Andreas Kinzler <hfp@posteo.de>
References: <4bc44777-103b-ada5-839a-809da33ba00c@posteo.de>
 <10fe632c-0f08-5399-0342-f6dfd9ca9b19@posteo.de>
 <ab806fa6-bd5f-84e1-1c4b-b704b18fd020@suse.com>
 <9d781f63-c565-01fa-b289-10b31c9ad4f1@posteo.de>
 <5991e76e-f4bd-971f-110e-d87fbc19a437@posteo.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <db8d7ae7-3abd-6df6-cd14-6dee3619e4be@suse.com>
Date: Tue, 19 Nov 2019 10:29:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5991e76e-f4bd-971f-110e-d87fbc19a437@posteo.de>
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTEuMjAxOSAyMDozNSwgQW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+IE9uIDE1LjExLjIw
MTkgMTI6MDEsIEFuZHJlYXMgS2luemxlciB3cm90ZToKPj4gT24gMTQuMTEuMjAxOSAxMjoyOSwg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAxNC4xMS4yMDE5IDAwOjEwLCBBbmRyZWFzIEtpbnps
ZXIgd3JvdGU6Cj4+Pj4gSSBjYW1lIGFjcm9zcyB0aGUgZm9sbG93aW5nOiBodHRwczovL2xrbWwu
b3JnL2xrbWwvMjAxOS84LzI5LzUzNgo+Pj4+IENvdWxkIHRoYXQgYmUgdGhlIHJlYXNvbiBmb3Ig
dGhlIHByb2JsZW0gbWVudGlvbmVkIGJlbG93PyBYZW4gaXMgdXNpbmcKPj4+PiBIUEVUIGFzIGNs
b2Nrc291cmNlIG9uIHRoZSBwbGF0Zm9ybS9tYWluYm9hcmQuIElzIHRoZXJlIGFuIChlYXN5KSB3
YXkgdG8KPj4+PiB2ZXJpZnkgaWYgWGVuIHVzZXMgUEMxMD8KPj4+IEhlbmNlIEkgY2FuIG9ubHkg
c3VnZ2VzdCB0aGF0IHlvdSB0cnkgYWdhaW4gd2l0aCBsaW1pdGVkIG9yIG5vCj4+PiB1c2Ugb2Yg
QyBzdGF0ZXMsIHRvIGF0IGxlYXN0IGdldCBhIGhpbnQgYXMgdG8gYSBwb3NzaWJsZQo+PiBJIGNo
YW5nZWQgdGhlIEJJT1Mgc2V0dGluZyB0byBhIGxpbWl0IG9mIFBDNyBhbmQgaXQgaXMgbm93IHJ1
bm5pbmcuIEkgCj4+IGhhdmUgdG8gd2FpdCBmb3IgdGhlIHJlc3VsdC4gVGhhbmtzLgo+IAo+IFBy
ZXZpb3VzbHkgdGhlIGRyaWZ0IGFmdGVyIDQgZGF5cyB1cHRpbWUgd2FzIDYwIHNlYy4gTm93IGFm
dGVyIDQgZGF5cyAKPiB1cHRpbWUgZHJpZnQgaXMgOSBzZWMuIFNvIHNldHRpbmcgdGhlIHBhY2th
Z2UgYy1zdGF0ZSBsaW1pdCB0byBQQzcgd2FzIGEgCj4gc3VjY2Vzcy4KCjlzIHN0aWxsIHNlZW1z
IHF1aXRlIGEgbG90IHRvIG1lLCBidXQgeWVzLCBpdCdzIGFuIGltcHJvdmVtZW50LgpOb3cgd291
bGQgeW91IGJlIHVwIHRvIGNoZWNraW5nIHdoZXRoZXIsIHJhdGhlciB0aGFuIHZpYSBCSU9TCnNl
dHRpbmdzICh3aGljaCBub3QgYWxsIEJJT1NlcyBtYXkgb2ZmZXIpIHRoZSBzYW1lIGNhbiBiZQph
Y2hpZXZlZCBieSB1c2luZyBYZW4ncyBjb21tYW5kIGxpbmUgb3B0aW9uICJtYXhfY3N0YXRlPSI/
CgpBbHNvIGRpZCB5b3UgY2hlY2sgd2hldGhlciBmdXJ0aGVyIGxpbWl0aW5nIEMgc3RhdGUgdXNl
IHdvdWxkCmZ1cnRoZXIgaW1wcm92ZSB0aGUgc2l0dWF0aW9uPyBBbmQgZGlkIHlvdSBwb3NzaWJs
eSBhbHNvIGNoZWNrCndoZXRoZXIgdGVsbGluZyBYZW4gbm90IHRvIHVzZSB0aGUgSFBFVCB3b3Vs
ZCBtYWtlIGEgZGlmZmVyZW5jZT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
