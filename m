Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3396B154469
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 13:59:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izgiG-0008Q2-Oh; Thu, 06 Feb 2020 12:56:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izgiF-0008Px-Sa
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 12:56:55 +0000
X-Inumbo-ID: 266e6c62-48e0-11ea-af72-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 266e6c62-48e0-11ea-af72-12813bfff9fa;
 Thu, 06 Feb 2020 12:56:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E4309AEC5;
 Thu,  6 Feb 2020 12:56:53 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, Julien Grall <julien@xen.org>
References: <20200206103833.15355-1-julien@xen.org>
 <d30a9c1b478c4e3a8b082fa625c8989a@EX13D32EUC003.ant.amazon.com>
 <0fb52abc-1a41-ab91-9c74-6f0913092a02@xen.org>
 <202acf94cd674228a1d852ccd372a90c@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <94c9aee5-04de-c4d4-5c35-0078b57dfd42@suse.com>
Date: Thu, 6 Feb 2020 13:57:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <202acf94cd674228a1d852ccd372a90c@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/mm: Avoid assuming the page is inuse
 in assign_pages()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Grall,
 Julien" <jgrall@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDIuMjAyMCAxMjo0NCwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KPj4g
U2VudDogMDYgRmVicnVhcnkgMjAyMCAxMToxNwo+PiBUbzogRHVycmFudCwgUGF1bCA8cGR1cnJh
bnRAYW1hem9uLmNvLnVrPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4+IENjOiBH
cmFsbCwgSnVsaWVuIDxqZ3JhbGxAYW1hem9uLmNvbT4KPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
Ml0geGVuL21tOiBBdm9pZCBhc3N1bWluZyB0aGUgcGFnZSBpcyBpbnVzZSBpbgo+PiBhc3NpZ25f
cGFnZXMoKQo+Pgo+PiBIaSBQYXVsLAo+Pgo+PiBPbiAwNi8wMi8yMDIwIDEwOjUyLCBEdXJyYW50
LCBQYXVsIHdyb3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+Pj4gRnJvbTog
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KPj4+PiBTZW50OiAwNiBGZWJydWFyeSAyMDIw
IDEwOjM5Cj4+Pj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+Pj4+IENjOiBq
dWxpZW5AeGVuLm9yZzsgRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgR3Jh
bGwsCj4+IEp1bGllbgo+Pj4+IDxqZ3JhbGxAYW1hem9uLmNvbT4KPj4+PiBTdWJqZWN0OiBbUEFU
Q0ggdjJdIHhlbi9tbTogQXZvaWQgYXNzdW1pbmcgdGhlIHBhZ2UgaXMgaW51c2UgaW4KPj4+PiBh
c3NpZ25fcGFnZXMoKQo+Pj4+Cj4+Pj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9u
LmNvbT4KPj4+Pgo+Pj4+IEF0IHRoZSBtb21lbnQsIGFzc2lnbl9wYWdlcygpIG9uIHRoZSBwYWdl
IHRvIGJlIGludXNlIChQR0Nfc3RhdGVfaW51c2UpCj4+Pj4gYW5kIHRoZSBzdGF0ZSB2YWx1ZSB0
byBiZSAwLgo+Pj4+Cj4+Pj4gSG93ZXZlciwgdGhlIGNvZGUgbWF5IHJhY2Ugd2l0aCB0aGUgcGFn
ZSBvZmZsaW5pbmcgY29kZSAoc2VlCj4+Pj4gb2ZmbGluZV9wYWdlKCkpLiBEZXBlbmRpbmcgb24g
dGhlIG9yZGVyaW5nLCB0aGUgcGFnZSBtYXkgYmUgaW4KPj4gb2ZmbGluaW5nCj4+Pj4gc3RhdGUg
KFBHQ19zdGF0ZV9vZmZsaW5pbmcpIGJlZm9yZSBpdCBpcyBhc3NpZ25lZCB0byBhIGRvbWFpbi4K
Pj4+Pgo+Pj4+IE9uIGRlYnVnIGJ1aWxkLCB0aGlzIG1heSByZXN1bHQgdG8gaGl0IHRoZSBhc3Nl
cnQgb3IganVzdCBjbG9iYmVyIHRoZQo+Pj4+IHN0YXRlLiBPbiBub24tZGVidWcgYnVpbGQsIHRo
ZSBzdGF0ZSB3aWxsIGdldCBjbG9iYmVyZWQuCj4+Pj4KPj4+PiBJbmNpZGVudGFsbHkgdGhlIGZs
YWcgUEdDX2Jyb2tlbiB3aWxsIGdldCBjbG9iYmVyZWQgYXMgd2VsbC4KPj4+Pgo+Pj4+IEdyYWIg
dGhlIGhlYXBfbG9jayB0byBwcmV2ZW50IGEgcmFjZSB3aXRoIG9mZmxpbmVfcGFnZSgpIGFuZCBr
ZWVwIHRoZQo+Pj4+IHN0YXRlIGFuZCBicm9rZW4gZmxhZyBhcm91bmQuCj4+Pj4KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgo+Pj4KPj4+IFRoaXMg
c2VlbXMgbGlrZSBhIHJlYXNvbmFibGUgY2hhbmdlLiBJIGd1ZXNzIGhhdmluZyBhc3NpZ25fcGFn
ZXMoKSB0YWtlCj4+IHRoZSBnbG9iYWwgbG9jayBpcyBubyBtb3JlIHByb2JsZW0gdGhhbiBpdHMg
ZXhpc3RpbmcgY2FsbCB0bwo+PiBkb21haW5fYWRqdXN0X3RvdF9wYWdlcygpIHdoaWNoIGFsc28g
dGFrZXMgdGhlIHNhbWUgbG9jay4KPj4KPj4gVGhhdCdzIG15IHVuZGVyc3RhbmRpbmcuIFN1bW1h
cml6aW5nIG91ciBkaXNjdXNzaW9uIElSTCBmb3IgdGhlIG90aGVyLAo+PiBpdCBpcyBub3QgY2xl
YXIgd2hldGhlciB0aGUgbG9jayBpcyBlbm91Z2ggaGVyZS4KPj4KPj4gIEZyb20gbXkgdW5kZXJz
dGFuZGluZyB0aGUgc2VxdWVuY2UKPj4KPj4gcGdbaV0uY291bnRfaW5mbyAmPSAuLi47Cj4+IHBn
W2ldLmNvdW50X2luZm8gfD0gLi4uOwo+Pgo+PiBjb3VsZCByZXN1bHQgdG8gbXVsdGlwbGUgcmVh
ZC93cml0ZSBmcm9tIHRoZSBjb21waWxlci4gV2UgY291bGQgdXNlIGEKPj4gc2luZ2xlIGFzc2ln
bm1lbnQsIGJ1dCBJIHN0aWxsIGRvbid0IHRoaW5rIHRoaXMgcHJldmVudCB0aGUgY29tcGlsZXIg
dG8KPj4gYmUgdXNlIG11bHRpcGxlIHJlYWQvd3JpdGUuCj4+Cj4+IFRoZSBjb25jZXJuIHdvdWxk
IGJlIGEgcmFjZSB3aXRoIGdldF9wYWdlX293bmVyX2FuZF9yZWZlcmVuY2UoKS4gSWYgMSBpcwo+
PiBzZXQgYmVmb3JlIHRoZSByZXN0IG9mIHRoZSBiaXRzLCB0aGVuIHlvdSBtYXkgYmUgYWJsZSB0
byBnZXQgdGhlIHBhZ2UuCj4+Cj4+IFNvIEkgbWlnaHQgd2FudCB0byB1c2Ugd3JpdGVfYXRvbWlj
KCkgYmVsb3cuIEFueSBvcGluaW9uPwo+Pgo+IAo+IFRCSCBJIHdvbmRlciBpZiB3ZSBvdWdodCB0
byBzYXkgdGhhdCBhbnkgdXBkYXRlIHRvIGNvdW50X2luZm8gb3VnaHQgdG8KPiBiZSBkb25lIGJ5
IGEgd3JpdGVfYXRvbWljICh3aGVyZSBpdCdzIG5vdCBhbHJlYWR5IGRvbmUgYnkgY21weGNoZyku
CgpJIGFncmVlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
