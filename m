Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F66127ED6
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 15:57:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJgi-0001FT-KQ; Fri, 20 Dec 2019 14:55:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiJgh-0001FM-Ul
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:55:31 +0000
X-Inumbo-ID: bfadc512-2338-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfadc512-2338-11ea-b6f1-bc764e2007e4;
 Fri, 20 Dec 2019 14:55:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 86061ADDA;
 Fri, 20 Dec 2019 14:55:22 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <aa264d92-2545-f2e7-5225-4f870e3ec8f9@suse.com>
 <272862bd-0b05-9a66-c79e-76502b89dd38@suse.com>
 <45b14083-fdf3-7dc5-e3b4-5b332e401e46@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d892871d-b357-4d4d-6ed1-d04e07074bff@suse.com>
Date: Fri, 20 Dec 2019 15:55:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <45b14083-fdf3-7dc5-e3b4-5b332e401e46@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] x86/mm: drop redundant smp_wmb() from
 _put_final_page_type()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTIuMjAxOSAxNTo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8xMi8yMDE5
IDE0OjIwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gZ2V0X3BhZ2VfbGlnaHQoKSdzIHVzZSBvZiBj
bXB4Y2hnKCkgaXMgYSBmdWxsIGJhcnJpZXIgYWxyZWFkeSBhbnl3YXkuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBXaGlsZSB0cnVlLCBp
cyB0aGlzIGFjdHVhbGx5IGEgY2xldmVyIGNoYW5nZSB0byBtYWtlPwo+IAo+IFRoZSBpbXBsZW1l
bnRhdGlvbiBvZiBnZXRfcGFnZV9saWdodCgpIGNvdWxkIHBsYXVzaWJseSBjaGFuZ2UgYW5kIG5v
Cj4gbG9uZ2VyIGJlIGEgZnVsbCBiYXJyaWVyLCBpbnRyb2R1Y2luZyBhIHZ1bG5lcmFiaWxpdHkg
aGVyZS7CoCBPVE9ILAo+IHNtcF93bWIoKSBpcyBmcmVlLgoKSXQncyBmcmVlIGF0IHRoZSBDUFUg
bGV2ZWwsIGJ1dCBub3QgYXQgdGhlIGNvbXBpbGVyIG9uZSAod2hlcmUKaXQgc3RpbGwgaXMgYSBi
YXJyaWVyKS4gSSBhbHNvIGRvbid0IHRoaW5rIGdldF9wYWdlX2xpZ2h0KCkKY291bGQgY2hhbmdl
IGFzIGRyYXN0aWNhbGx5IGFzIGxvc2luZyBpdHMgTE9DSy1lZCBvcGVyYXRpb24sCm9yIGlmIGl0
IGRpZCB0aGUgYXV0aG9yIChhbmQgcmV2aWV3ZXIpIHdvdWxkIGJlIHdlbGwgYWR2aXNlZAp0byBh
dCBsZWFzdCBicmllZmx5IGF1ZGl0IHVzZSBzaXRlcyAob25lIG9mIHRoZSByZWFzb25zIEknbQps
ZWF2aW5nIGEgY29tbWVudCkuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
