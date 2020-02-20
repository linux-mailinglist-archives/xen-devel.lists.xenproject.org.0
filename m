Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4417E1660BA
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 16:15:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4nTq-00087p-H3; Thu, 20 Feb 2020 15:11:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4nTp-00087k-Qi
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 15:11:09 +0000
X-Inumbo-ID: 38c29e74-53f3-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38c29e74-53f3-11ea-bc8e-bc764e2007e4;
 Thu, 20 Feb 2020 15:11:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8D48CB1C2;
 Thu, 20 Feb 2020 15:11:07 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200220120231.86907-1-roger.pau@citrix.com>
 <ecf1c47c-4cbb-c7c4-7ccf-d3620a1992b3@suse.com>
 <20200220141117.GK4679@Air-de-Roger>
 <ac515c56-e391-3636-244d-4b660c615dee@suse.com>
 <20200220143841.GL4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a2111136-e91c-4077-5bea-ea310a43979e@suse.com>
Date: Thu, 20 Feb 2020 16:11:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200220143841.GL4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] rwlock: allow recursive read locking when
 already locked in write mode
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDIuMjAyMCAxNTozOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEZl
YiAyMCwgMjAyMCBhdCAwMzoyMzozOFBNICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBP
biAyMC4wMi4yMCAxNToxMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFRodSwgRmVi
IDIwLCAyMDIwIGF0IDAxOjQ4OjU0UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDIwLjAyLjIwMjAgMTM6MDIsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4gQEAgLTE2Niw3
ICsxODAsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX3dyaXRlX3VubG9jayhyd2xvY2tfdCAqbG9j
aykKPj4+Pj4gICAgICAgICogSWYgdGhlIHdyaXRlciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBi
ZSBjbGVhcmVkIGRpcmVjdGx5Lgo+Pj4+PiAgICAgICAgKiBPdGhlcndpc2UsIGFuIGF0b21pYyBz
dWJ0cmFjdGlvbiB3aWxsIGJlIHVzZWQgdG8gY2xlYXIgaXQuCj4+Pj4+ICAgICAgICAqLwo+Pj4+
PiAtICAgIGF0b21pY19zdWIoX1FXX0xPQ0tFRCwgJmxvY2stPmNudHMpOwo+Pj4+PiArICAgIEFT
U0VSVChfaXNfd3JpdGVfbG9ja2VkX2J5X21lKGF0b21pY19yZWFkKCZsb2NrLT5jbnRzKSkpOwo+
Pj4+PiArICAgIGF0b21pY19zdWIoX3dyaXRlX2xvY2tfdmFsKCksICZsb2NrLT5jbnRzKTsKPj4+
Pgo+Pj4+IEkgdGhpbmsgdGhpcyB3b3VsZCBiZSBtb3JlIGVmZmljaWVudCB3aXRoIGF0b21pY19h
bmQoKSwgbm90Cj4+Pj4gdGhlIGxlYXN0IGJlY2F1c2Ugb2YgdGhlIHRoZW4gYXZvaWRlZCBzbXBf
cHJvY2Vzc29yX2lkKCkuCj4+Pj4gV2hldGhlciB0byBtYXNrIG9mZiBqdXN0IF9RV19XTUFTSyBv
ciBhbHNvIHRoZSBDUFUgbnVtYmVyIG9mCj4+Pj4gdGhlIGxhc3Qgd3JpdGUgb3duZXIgd291bGQg
bmVlZCB0byBiZSBkZXRlcm1pbmVkLiBCdXQgd2l0aAo+Pj4+IHVzaW5nIHN1YnRyYWN0aW9uLCBp
biBjYXNlIG9mIHByb2JsZW1zIGl0J2xsIGxpa2VseSBiZQo+Pj4+IGhhcmRlciB0byB1bmRlcnN0
YW5kIHdoYXQgYWN0dWFsbHkgd2VudCBvbiwgZnJvbSBsb29raW5nIGF0Cj4+Pj4gdGhlIHJlc3Vs
dGluZyBzdGF0ZSBvZiB0aGUgbG9jayAodGhpcyBpcyBpbiBwYXJ0IGEgcHJlLQo+Pj4+IGV4aXN0
aW5nIHByb2JsZW0sIGJ1dCBnZXRzIHdvcnNlIHdpdGggc3VidHJhY3Rpb24gb2YgQ1BVCj4+Pj4g
bnVtYmVycykuCj4+Pgo+Pj4gUmlnaHQsIGEgbWFzayB3b3VsZCBiZSBiZXR0ZXIuIFJpZ2h0IG5v
dyBib3RoIG5lZWQgdG8gYmUgY2xlYXJlZCAodGhlCj4+PiBMT0NLRUQgYW5kIHRoZSBDUFUgZmll
bGRzKSBhcyB0aGVyZSdzIGNvZGUgdGhhdCByZWxpZXMgb24gIWxvY2stPmNudHMKPj4+IGFzIGEg
d2F5IHRvIGRldGVybWluZSB0aGF0IHRoZSBsb2NrIGlzIG5vdCByZWFkIG9yIHdyaXRlIGxvY2tl
ZC4gSWYgd2UKPj4+IGxlZnQgdGhlIENQVSBseWluZyBhcm91bmQgdGhvc2UgY2hlY2tzIHdvdWxk
IG5lZWQgdG8gYmUgYWRqdXN0ZWQuCj4+Cj4+IEluIGNhc2UgeW91IG1ha2UgX1FSX1NISUZUIDE2
IGl0IGlzIHBvc3NpYmxlIHRvIGp1c3Qgd3JpdGUgYSAyLWJ5dGUgemVybwo+PiB2YWx1ZSBmb3Ig
d3JpdGVfdW5sb2NrKCkgKGxpa2UgaXRzIHBvc3NpYmxlIHRvIGRvIHNvIHRvZGF5IHVzaW5nIGEK
Pj4gc2luZ2xlIGJ5dGUgd3JpdGUpLgo+IAo+IFRoYXQgd291bGQgbGltaXQgdGhlIHJlYWRlcnMg
Y291bnQgdG8gNjU1MzYsIHdoYXQgZG8geW91IHRoaW5rIEphbj8KCklmIHRoZSByZWN1cnNlX2Nw
dSBhcHByb2FjaCBpcyBjb25zaWRlcmVkIGJhZCwgSSB0aGluayB0aGlzIHdvdWxkCmJlIGFjY2Vw
dGFibGUuIEJ1dCBvZiBjb3Vyc2UgeW91J2xsIG5lZWQgdG8gY29uc3VsdCB3aXRoIHRoZSBBcm0K
Z3V5cyByZWdhcmRpbmcgdGhlIGNvcnJlY3RuZXNzIG9mIHN1Y2ggYSAiaGFsZiIgc3RvcmUgaW4g
dGhlaXIKbWVtb3J5IG1vZGVsOyBJIHdvdWxkIGhvcGUgdGhpcyB0byBiZSB1bml2ZXJzYWxseSBv
a2F5LCBidXQgSSdtCm5vdCBlbnRpcmVseSBjZXJ0YWluLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
