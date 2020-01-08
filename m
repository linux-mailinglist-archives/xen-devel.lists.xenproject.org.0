Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0299C133FBD
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 11:57:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip8zY-0001kJ-CF; Wed, 08 Jan 2020 10:55:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ip8zW-0001kD-Hd
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 10:55:10 +0000
X-Inumbo-ID: 56465e96-3205-11ea-b79b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56465e96-3205-11ea-b79b-12813bfff9fa;
 Wed, 08 Jan 2020 10:55:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9D1E3AC53;
 Wed,  8 Jan 2020 10:55:08 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-4-liuwe@microsoft.com>
 <8437e48d-b22c-68c1-f589-fd945c011a3f@suse.com>
 <20200107163339.rwqo6ybwzxgi77e4@debian>
 <af2dd5b5-f5a4-6fe3-5654-6d84739e6d92@suse.com>
 <20200107172720.onwjgb7x2hsrrivz@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d19ba65-95f6-1e5e-1ff7-e6d488fedb90@suse.com>
Date: Wed, 8 Jan 2020 11:55:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200107172720.onwjgb7x2hsrrivz@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/5] x86/hyperv: provide percpu hypercall
 input page
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDEuMjAyMCAxODoyNywgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIEphbiAwNywgMjAy
MCBhdCAwNjowODoxOVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDcuMDEuMjAy
MCAxNzozMywgV2VpIExpdSB3cm90ZToKPj4+IE9uIE1vbiwgSmFuIDA2LCAyMDIwIGF0IDExOjI3
OjE4QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA1LjAxLjIwMjAgMTc6NDcs
IFdlaSBMaXUgd3JvdGU6Cj4+Pj4+IEh5cGVyLVYncyBpbnB1dCAvIG91dHB1dCBhcmd1bWVudCBt
dXN0IGJlIDggYnl0ZXMgYWxpZ25lZCBhbiBub3QgY3Jvc3MKPj4+Pj4gcGFnZSBib3VuZGFyeS4g
VGhlIGVhc2llc3Qgd2F5IHRvIHNhdGlzZnkgdGhvc2UgcmVxdWlyZW1lbnRzIGlzIHRvIHVzZQo+
Pj4+PiBwZXJjcHUgcGFnZS4KPj4+Pgo+Pj4+IEknbSBub3Qgc3VyZSAiZWFzaWVzdCIgaXMgcmVh
bGx5IHRydWUgaGVyZS4gT3RoZXJzIGNvdWxkIGNvbnNpZGVyIGFkZGluZwo+Pj4+IF9fYWxpZ25l
ZCgpIGF0dHJpYnV0ZXMgYXMgZWFzeSBvciBldmVuIGVhc2llciAoYnkgYmVpbmcgZXZlbiBtb3Jl
Cj4+Pj4gdHJhbnNwYXJlbnQgdG8gdXNlIHNpdGVzKS4gQ291bGQgd2Ugc2V0dGxlIG9uICJPbmUg
d2F5IC4uLiI/Cj4+Pgo+Pj4gRG8geW91IG1lYW4gc29tZXRoaW5nIGxpa2UKPj4+Cj4+PiAgICBz
dHJ1Y3QgZm9vIF9fYWxpZ25lZCg4KTsKPj4KPj4gSWYgdGhpcyBpcyBpbiBhIGhlYWRlciBhbmQg
Li4uCj4+Cj4+PiAgICBodl9kb19oeXBlcmNhbGwoT1AsIHZpcnRfdG9fbWFkZHIoJmZvbyksIC4u
Lik7Cj4+Cj4+IC4uLiB0aGlzIGluIGFjdHVhbCBjb2RlLCB0aGVuIHllcy4KPj4KPj4+ID8KPj4+
Cj4+PiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgdHJhbnNwYXJlbnQgdG8gdXNlciBzaXRlcy4gUGx1
cywgZm9vIGlzIG9uIHN0YWNrCj4+PiB3aGljaCBpcyAxKSBkaWZmaWN1bHQgdG8gZ2V0IGl0cyBt
YWRkciwKPj4KPj4gSXQgYmVpbmcgb24gdGhlIHN0YWNrIG1heSBpbmRlZWQgY29tcGxpY2F0ZSBn
ZXR0aW5nIGl0cyBtYWNoaW5lIGFkZHJlc3MKPj4gKGlmIG5vdCBub3csIHRoZW4gZG93biB0aGUg
cm9hZCkgLSB2YWxpZCBwb2ludC4KPj4KPj4+IDIpIG1heSBjcm9zcyBwYWdlIGJvdW5kYXJ5Lgo+
Pgo+PiBUaGUgX19hbGlnbmVkKCkgb2YgY291cnNlIG5lZWRzIHRvIGJlIGxhcmdlIGVub3VnaCB0
byBhdm9pZCB0aGlzCj4+IGhhcHBlbmluZy4KPiAKPiBGb3IgdGhpcyBhbGlnbm1lbnQgdG8gYmUg
bGFyZ2UgZW5vdWdoLCBpdCB3aWxsIG5lZWQgdG8gYmUgb2YgUEFHRV9TSVpFLAo+IHJpZ2h0PyBX
b3VsZG4ndCB0aGF0IGJsb3cgdXAgWGVuJ3Mgc3RhY2sgZWFzaWx5PyAgR2l2ZW4gd2Ugb25seSBo
YXZlIHR3bwo+IHBhZ2VzIGZvciB0aGF0LgoKV2h5IFBBR0VfU0laRT8gRm9yIGV4YW1wbGUsIGEg
MjQtYnl0ZSBzdHJ1Y3R1cmUgd29uJ3QgY3Jvc3MgYSBwYWdlCmJvdW5kYXJ5IGlmIGFsaWduZWQg
dG8gMzIgYnl0ZXMuCgo+IEluIGxpZ2h0IG9mIHRoZXNlIHJlc3RyaWN0aW9ucywgdGhlIGFwcHJv
YWNoIEkgdGFrZSBpbiB0aGUgb3JpZ2luYWwKPiBwYXRjaCBzaG91bGQgYmUgb2theS4KPiAKPiBJ
J20gZmluZSB3aXRoIGNoYW5naW5nIHRoZSB3b3JkaW5nIHRvICJPbmUgd2F5IC4uLiIgLS0gaWYg
dGhhdCdzIHRoZQo+IG9ubHkgb2JqZWN0aW9uIHlvdSBoYXZlIGFmdGVyIHRoaXMgbWFpbC4KCldl
bGwsIHRoZSBnb2FsIHdhcyB0byAoYSkgY2hlY2sgd2hldGhlciBhbHRlcm5hdGl2ZXMgaGF2ZSBi
ZWVuIGNvbnNpZGVyZWQKKGFuZCBpZiBub3QsIHRvIGNvbnNpZGVyIHRoZW0pIGFuZCB0aGVuIChi
KSBpZiB3ZSBzdGljayB0byB5b3VyIGFwcHJvYWNoLApzbGlnaHRseSBjaGFuZ2UgdGhlIHdvcmRp
bmcgYXMgc3VnZ2VzdGVkLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
