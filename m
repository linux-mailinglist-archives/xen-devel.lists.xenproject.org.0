Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3FD18D408
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 17:19:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFKJu-0002hx-JB; Fri, 20 Mar 2020 16:16:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jFKJs-0002hp-S3
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 16:16:24 +0000
X-Inumbo-ID: 23eb6050-6ac6-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23eb6050-6ac6-11ea-bec1-bc764e2007e4;
 Fri, 20 Mar 2020 16:16:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EAFBCAB7F;
 Fri, 20 Mar 2020 16:16:21 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200319152622.31758-1-andrew.cooper3@citrix.com>
 <20200319152622.31758-6-andrew.cooper3@citrix.com>
 <2acabccd-da3b-9e22-8f27-41ab1b3cde8a@suse.com>
 <5b5994ae-db1c-b0d7-16d2-c2f264dc5440@citrix.com>
 <d8475c22-3350-c536-6cf8-f3e64515ede2@suse.com>
 <6e8a9bbb-c534-46de-9510-2aa791e43b99@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bc893330-0019-e075-f92f-fe997f120546@suse.com>
Date: Fri, 20 Mar 2020 17:16:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6e8a9bbb-c534-46de-9510-2aa791e43b99@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/6] x86/ucode: Alter ops->free_patch() to
 free the entire patch
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDMuMjAyMCAxNzoxMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8wMy8yMDIw
IDE1OjE1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjAuMDMuMjAyMCAxNTo1MCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDIwLzAzLzIwMjAgMTM6NTEsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDE5LjAzLjIwMjAgMTY6MjYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IFRo
ZSBkYXRhIGxheW91dCBmb3Igc3RydWN0IG1pY3JvY29kZV9wYXRjaCBpcyBleHRyZW1lbHkgcG9v
ciwgYW5kCj4+Pj4+IHVubmVjZXNzYXJpbHkgY29tcGxpY2F0ZWQuICBBbG1vc3QgYWxsIG9mIGl0
IGlzIG9wYXF1ZSB0byBjb3JlLmMsIHdpdGggdGhlCj4+Pj4+IGV4Y2VwdGlvbiBvZiBmcmVlX3Bh
dGNoKCkuCj4+Pj4+Cj4+Pj4+IE1vdmUgdGhlIHJlc3BvbnNpYmlsaXR5IGZvciBmcmVlaW5nIHRo
ZSBwYXRjaCBpbnRvIHRoZSBmcmVlX3BhdGNoKCkgaG9vaywKPj4+Pj4gd2hpY2ggd2lsbCBhbGxv
dyBlYWNoIGRyaXZlciB0byBkbyBhIGJldHRlciBqb2IuCj4+Pj4gQnV0IHRoYXQgd3JhcHBlciBz
dHJ1Y3R1cmUgaXMgc29tZXRoaW5nIGNvbW1vbiwgaS5lLiB0byBiZQo+Pj4+IGFsbG9jYXRlZCBh
cyB3ZWxsIGFzIHRvIGJlIGZyZWVkIChwcmVmZXJhYmx5KSBieSBjb21tb24gY29kZS4KPj4+PiBX
ZSBkaWQgc3BlY2lmaWNhbGx5IG1vdmUgdGhlcmUgZHVyaW5nIHJldmlldyBvZiB0aGUgbW9zdAo+
Pj4+IHJlY2VudCByZS13b3JrLgo+Pj4gVGhlIGN1cnJlbnQgYmVoYXZpb3VyIG9mIGhhdmluZyBp
dCBhbGxvY2F0ZWQgYnkgdGhlIHJlcXVlc3QoKSBob29rLCBidXQKPj4+ICJmcmVlZCIgaW4gYSBt
aXggb2YgY29tbW9uIGNvZGUgYW5kIGEgZnJlZSgpIGhvb2ssIGNhbm5vdCBwb3NzaWJseSBoYXZl
Cj4+PiBiZWVuIGFuIGludGVuZGVkIGNvbnNlcXVlbmNlIGZyb20gbW92aW5nIGl0Lgo+Pj4KPj4+
IFRoZSBmcmVlKCkgaG9vayBpcyBjdXJyZW50bHkgbmVjZXNzYXJ5LCBhcyBpcyB0aGUgdmVuZG9y
LXNwZWNpZmljCj4+PiBhbGxvY2F0aW9uIGxvZ2ljLCBzbyBzcGxpdHRpbmcgZnJlZWluZyByZXNw
b25zaWJpbGl0eSB3aXRoIHRoZSBjb21tb24KPj4+IGNvZGUgaXMgd3JvbmcuCj4+IEhtbSwgeWVz
LCB3aXRoIHRoZSBhbGxvY2F0aW9uIGRvbmUgaW4gdmVuZG9yIGNvZGUsIHRoZSBmcmVlaW5nCj4+
IGNvdWxkIGJlLCB0b28uIEJ1dCB0aGUgd3JhcHBlciBzdHJ1Y3QgZ2V0cyBhbGxvY2F0ZWQgbGFz
dCBpbgo+PiBjcHVfcmVxdWVzdF9taWNyb2NvZGUoKSAoZm9yIGJvdGggSW50ZWwgYW5kIEFNRCks
IGFuZCBoZW5jZSBvdWdodAo+PiB0byBiZSByZWxhdGl2ZWx5IGVhc3kgdG8gZ2V0IHJpZCBvZiwg
aW5zdGVhZCBvZiBtb3ZpbmcgYXJvdW5kCj4+IHRoZSBmcmVlaW5nICh0aGUgY29tbW9uIGNvZGUg
cGFydCBvZiB0aGUgZnJlZWluZyB3b3VsZCB0aGVuCj4+IHNpbXBseSBnbyBhd2F5KS4KPiAKPiBJ
IGFtIHdvcmtpbmcgb24gcmVtb3ZpbmcgYWxsIHVubmVjZXNzYXJ5IGFsbG9jYXRpb25zLCBpbmNs
dWRpbmcgZm9sZGluZwo+IG1pY3JvY29kZV97aW50ZWwsYW1kfSBpbnRvIG1pY3JvY29kZV9wYXRj
aCwgYnV0IEknbSBzdGlsbCBjb25maWRlbnQgdGhpcwo+IHdhbnRzIHRvIGJlIGRvbmUgd2l0aCBt
aWNyb2NvZGVfcGF0Y2ggYmVpbmcgcHJvcGVybHkgb3BhcXVlIHRvIGNvcmUuYwoKT2gsIHN1cmUg
LSBJIGRpZG4ndCBtZWFuIHRvIHB1dCB0aGlzIHVuZGVyIHF1ZXN0aW9uLiBJdCBqdXN0IHNlZW1z
CnRvIG1lIHRoZSB0aGUgcm91dGUgdGhlcmUgbWF5IGJldHRlciBiZSBzb21ld2hhdCBkaWZmZXJl
bnQgZnJvbSB0aGlzCmFuZCB0aGUgZm9sbG93aW5nIHBhdGNoLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
