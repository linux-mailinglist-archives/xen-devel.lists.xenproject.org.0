Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3266911CA35
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 11:07:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifLKW-0003cz-2C; Thu, 12 Dec 2019 10:04:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifLKU-0003cu-Cc
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 10:04:18 +0000
X-Inumbo-ID: c1fdaff8-1cc6-11ea-8d11-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1fdaff8-1cc6-11ea-8d11-12813bfff9fa;
 Thu, 12 Dec 2019 10:04:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B2AD0AC91;
 Thu, 12 Dec 2019 10:04:16 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <83dd739a-8170-e135-51c4-c9716f47d3d6@suse.com>
 <bbfe755e-cab6-4c97-30d4-fefd8afbac0c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fc7b85d5-7be6-884c-6602-31888d5bf531@suse.com>
Date: Thu, 12 Dec 2019 11:04:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <bbfe755e-cab6-4c97-30d4-fefd8afbac0c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86emul: correct segment override decode
 for 64-bit mode
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

T24gMTEuMTIuMjAxOSAyMTo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMS8xMi8yMDE5
IDA5OjI3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhlIGxlZ2FjeSAvIGNvbXBhdGliaWxpdHkg
bW9kZSBFUywgQ1MsIFNTLCBhbmQgRFMgb3ZlcnJpZGVzIGFyZSBudWxsCj4+IHByZWZpeGVzIGlu
IDY0LWJpdCBtb2RlLCBpLmUuIHRoZXkgaW4gcGFydGljdWxhciBkb24ndCBjYW5jZWwgYW4KPj4g
ZWFybGllciBGUyBvciBHUyBvbmUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPiAKPiBudWxsIGlzIGEgdmVyeSBvdmVybG9hZGVkIHRlcm0uwqAg
V2hhdCB5b3UgbWVhbiBoZXJlIGlzIHNpbXBseSAiaWdub3JlZCIuCgpUaGUgQU1EIFBNIGhhcyAi
SW5zdGVhZCwgdGhleSBhcmUgdHJlYXRlZCBhcyBudWxsIHByZWZpeGVzLiIgVGhpcyBpcwp3aGF0
IEkndmUgdGFrZW4gdG8gdXNlIGhlcmUuIEknbSBoYXBweSB0byB0YWtlIHdoYXRldmVyIG90aGVy
CnNlbnNpYmxlIHdvcmRpbmcgeW91IGxpa2UgYmV0dGVyIChpbmNsdWRpbmcgImlnbm9yZWQiKS4g
QnV0IEknZCBsaWtlCnlvdSB0byBleHBsaWNpdGx5IGNsYXJpZnkgdGhhdCB5b3UncmUgbm90IG9r
YXkgd2l0aCBtZSB1c2luZyBhIHRlcm0KZnJvbSB2ZW5kb3IgZG9jdW1lbnRhdGlvbiBoZXJlLgoK
PiBJbiBhdHRlbXB0aW5nIHRvIGNvbmZpcm0vdGVzdCB0aGlzLCBJJ3ZlIGZvdW5kIHlldCBhbm90
aGVyIGN1cmlvc2l0eQo+IHdpdGggaW5zdHJ1Y3Rpb24gbGVuZ3RoIGNhbGN1bGF0aW9ucyB3aGVu
IHJlb3JkZXJpbmcgYSByZXggcHJlZml4IGFuZAo+IGxlZ2FjeSBwcmVmaXguwqAgT2JqZHVtcCBn
ZXRzIGl0IHdyb25nLCBidXQgdGhlIGluc3RydWN0aW9uIGJvdW5kYXJpZXMKPiBhY2NvcmRpbmcg
dG8gc2luZ2xlc3RlcCBhcmUgd2VpcmQuCgpPYmpkdW1wIGdldHRpbmcgaXQgd3JvbmcgaXMgbm8g
c3VycHJpc2UgYXQgYWxsIHRvIG1lICh3aGljaCBpcyBvbmUKb2YgdGhlIHJlYXNvbnMgd2h5IEkg
cHJlZmVyIHRvIHVzZSBteSBvd24gZGlzYXNzZW1ibGVyIHdoZXJldmVyCnBvc3NpYmxlKS4gWWV0
IHdpdGhvdXQgeW91IHNwZWxsaW5nIG91dCB3aGF0IHNwZWNpZmljIGFub21hbGllcwp5b3UndmUg
b2JzZXJ2ZWQgKG9yIHdoYXQgd2VpcmRuZXNzIHRoZXJlIGlzIHdpdGggc2luZ2xlIHN0ZXBwaW5n
KQpJIHdvbid0IGtub3cgd2hldGhlciBJIG1heSB3YW50IHRvIG1ha2UgYW4gYXR0ZW1wdCBhdCBm
aXhpbmcKb2JqZHVtcC4gTm9yIGNhbiBJIHNlZSB3aGF0IHRoaXMgY29tbWVudCdzIGltcGxpY2F0
aW9uIGlzIG9uIHRoZQpwYXRjaCBoZXJlLCBpLmUuIHdoYXQgY2hhbmdlcyB5b3UgbWVhbiBtZSB0
byBtYWtlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
