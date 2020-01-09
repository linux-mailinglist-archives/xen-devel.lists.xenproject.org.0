Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAFB135776
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 11:55:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipVQR-00044c-2H; Thu, 09 Jan 2020 10:52:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipVQP-00044U-4l
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 10:52:25 +0000
X-Inumbo-ID: 1e46b2ec-32ce-11ea-b99a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e46b2ec-32ce-11ea-b99a-12813bfff9fa;
 Thu, 09 Jan 2020 10:52:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5D32A6A25A;
 Thu,  9 Jan 2020 10:52:17 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200108170040.7728-1-andrew.cooper3@citrix.com>
 <bed20854-b537-da48-e7f5-451887ee98db@suse.com>
 <57de555b-c1cc-4a32-8222-ba87ecf3168c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d17f1124-9d44-5e84-8deb-59b085074e96@suse.com>
Date: Thu, 9 Jan 2020 11:52:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <57de555b-c1cc-4a32-8222-ba87ecf3168c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/boot: Rationalise stack handling during
 early boot
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

T24gMDkuMDEuMjAyMCAxMTo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8wMS8yMDIw
IDEwOjI4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDguMDEuMjAyMCAxODowMCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaAo+Pj4g
KysrIGIveGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oCj4+PiBAQCAtMjQ5LDIzICsyNDksMjQg
QEAgc3RhdGljIHZvaWQgX19pbml0IG5vcmV0dXJuIGVmaV9hcmNoX3Bvc3RfZXhpdF9ib290KHZv
aWQpCj4+PiAgICAgICAgICAgICAgICAgICAgICJvciAgICAgJCJfX3N0cmluZ2lmeShYODZfQ1I0
X1BHRSkiLCAlW2NyNF1cblx0Igo+Pj4gICAgICAgICAgICAgICAgICAgICAibW92ICAgICVbY3I0
XSwgJSVjcjRcblx0Igo+Pj4gICNlbmRpZgo+Pj4gLSAgICAgICAgICAgICAgICAgICAibW92YWJz
ICRfX3N0YXJ0X3hlbiwgJVtyaXBdXG5cdCIKPj4+ICAgICAgICAgICAgICAgICAgICAgImxnZHQg
ICBib290X2dkdHIoJSVyaXApXG5cdCIKPj4+IC0gICAgICAgICAgICAgICAgICAgIm1vdiAgICBz
dGFja19zdGFydCglJXJpcCksICUlcnNwXG5cdCIKPj4+ICAgICAgICAgICAgICAgICAgICAgIm1v
diAgICAlW2RzXSwgJSVzc1xuXHQiCj4+PiAgICAgICAgICAgICAgICAgICAgICJtb3YgICAgJVtk
c10sICUlZHNcblx0Igo+Pj4gICAgICAgICAgICAgICAgICAgICAibW92ICAgICVbZHNdLCAlJWVz
XG5cdCIKPj4+ICAgICAgICAgICAgICAgICAgICAgIm1vdiAgICAlW2RzXSwgJSVmc1xuXHQiCj4+
PiAgICAgICAgICAgICAgICAgICAgICJtb3YgICAgJVtkc10sICUlZ3Ncblx0Igo+Pj4gLSAgICAg
ICAgICAgICAgICAgICAibW92bCAgICVbY3NdLCA4KCUlcnNwKVxuXHQiCj4+PiAtICAgICAgICAg
ICAgICAgICAgICJtb3YgICAgJVtyaXBdLCAoJSVyc3ApXG5cdCIKPj4+IC0gICAgICAgICAgICAg
ICAgICAgImxyZXRxICAlW3N0a29mZl0tMTYiCj4+PiArCj4+PiArICAgICAgICAgICAgICAgICAg
IC8qIEp1bXAgdG8gaGlnaGVyIG1hcHBpbmdzLiAqLwo+Pj4gKyAgICAgICAgICAgICAgICAgICAi
bW92ICAgIHN0YWNrX3N0YXJ0KCUlcmlwKSwgJSVyc3Bcblx0Igo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAibW92YWJzICRfX3N0YXJ0X3hlbiwgJVtyaXBdXG5cdCIKPj4+ICsgICAgICAgICAgICAg
ICAgICAgInB1c2ggICAlW2NzXVxuXHQiCj4+IEVpdGhlciB5b3UgbmVlZCAlcVtjc10gaGVyZSAo
YXNzdW1pbmcgcSBnZXRzIGlnbm9yZWQgZm9yCj4+IGltbWVkaWF0ZSBvcGVyYW5kcywgd2hpY2gg
SSBkaWRuJ3QgY2hlY2spIG9yIC4uLgo+Pgo+Pj4gKyAgICAgICAgICAgICAgICAgICAicHVzaCAg
ICVbcmlwXVxuXHQiCj4+PiArICAgICAgICAgICAgICAgICAgICJscmV0cSIKPj4+ICAgICAgICAg
ICAgICAgICAgICAgOiBbcmlwXSAiPSZyIiAoZWZlci8qIGFueSBkZWFkIDY0LWJpdCB2YXJpYWJs
ZSAqLyksCj4+PiAgICAgICAgICAgICAgICAgICAgICAgW2NyNF0gIismciIgKGNyNCkKPj4+ICAg
ICAgICAgICAgICAgICAgICAgOiBbY3IzXSAiciIgKGlkbGVfcGdfdGFibGUpLAo+Pj4gICAgICAg
ICAgICAgICAgICAgICAgIFtjc10gImlyIiAoX19IWVBFUlZJU09SX0NTKSwKPj4gLi4uIHlvdSBu
ZWVkIHRvIHVzZSBqdXN0ICJpIiBoZXJlLCBmb3IgdGhlcmUgbm90IGJlaW5nIDMyLWJpdAo+PiBQ
VVNIIGZvcm1zLgo+IAo+IExldHMganVzdCBnbyB3aXRoIGkuCj4gCj4gIm0iIGlzIGFsc28gYW4g
b3B0aW9uLCBhbmQgY2xhbmcgd2lsbCBwcm9iYWJseSBmaW5kIHNvbWUgd2F5IG9mIHB1bGxpbmcK
PiBpdCBvdXQgb2YgdGhlIHN0cmluZ3RhYmxlLCBidXQgYW55dGhpbmcgb3RoZXIgdGhhbiBhbiBp
bW1lZGlhdGUgZW5jb2RpbmcKPiBoZXJlIGlzIGdvaW5nIHRvIGJlIHNpbGx5LgoKTm8sIHNhZGx5
ICJtIiBpcyBub3QgYW4gb3B0aW9uIHdoZW4gdGhlIGV4cHJlc3Npb24gaXMgYSBjb25zdGFudDoK
R2NjIGF0IGxlYXN0IGlzIHVuYWJsZSB0byBtYXRlcmlhbGl6ZSBhIG1lbW9yeSB2YXJpYWJsZSBp
biB0aGlzCmNhc2UsIGFuZCB3aWxsIGdpdmUgc29tZSBmdW5ueSBlcnJvciBtZXNzYWdlIGluc3Rl
YWQuCgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+Pj4gKysrIGIveGVuL2FyY2gv
eDg2L3NtcGJvb3QuYwo+Pj4gQEAgLTU1NCw3ICs1NTQsNyBAQCBzdGF0aWMgaW50IGRvX2Jvb3Rf
Y3B1KGludCBhcGljaWQsIGludCBjcHUpCj4+PiAgICAgICAgICBwcmludGsoIkJvb3RpbmcgcHJv
Y2Vzc29yICVkLyVkIGVpcCAlbHhcbiIsCj4+PiAgICAgICAgICAgICAgICAgY3B1LCBhcGljaWQs
IHN0YXJ0X2VpcCk7Cj4+PiAgCj4+PiAtICAgIHN0YWNrX3N0YXJ0ID0gc3RhY2tfYmFzZVtjcHVd
Owo+Pj4gKyAgICBzdGFja19zdGFydCA9IHN0YWNrX2Jhc2VbY3B1XSArIFNUQUNLX1NJWkUgLSBz
aXplb2Yoc3RydWN0IGNwdV9pbmZvKTsKPj4+ICAKPj4+ICAgICAgLyogVGhpcyBncnVuZ2UgcnVu
cyB0aGUgc3RhcnR1cCBwcm9jZXNzIGZvciB0aGUgdGFyZ2V0ZWQgcHJvY2Vzc29yLiAqLwo+PiBG
dXJ0aGVyIGRvd24gc21wX3ByZXBhcmVfY3B1cygpIGhhcwo+Pgo+PiAgICAgc3RhY2tfYmFzZVsw
XSA9IHN0YWNrX3N0YXJ0Owo+Pgo+PiB3aGljaCBJIHRoaW5rIHlvdSBuZWVkIHRvIGFsc28gYWRq
dXN0IChvciByZXBsYWNlLCBlLmcuIGJ5IGdpdmluZwo+PiBzdGFja19iYXNlW10gYW4gaW5pdGlh
bGl6ZXIpLgo+IAo+IEluIHByYWN0aWNlLCB0aGlzIHZhcmlhYmxlIGlzIG5ldmVyIHVzZWQgYmVj
YXVzZSB3ZSBuZXZlciBvZmZsaW5lIHRoZSBCU1AuCgp0cmFwcy5jIHVzZXMgc3RhY2tfYmFzZVtd
LCBmb3IgZXhhbXBsZSwgYW5kIGhlbmNlIGl0IG5lZWRzIHRvIGJlCmNvcnJlY3QgYWxzbyBmb3Ig
dGhlIEJTUC4gRXZlbiBtb3JlIGltcG9ydGFudCBpcyBwZXJoYXBzCmdldF9jcHVfY3VycmVudCgp
J3MgdXNlLgoKPiBIb3dldmVyLCB0aGUgY29kZSBhcy1pcyBpcyBjb3JyZWN0LsKgIFRoZSB2YWx1
ZSBpbiBzdGFja19zdGFydCBoYXMKPiBjaGFuZ2VkIGluIHRoaXMgcGF0Y2gsIGJ1dCBpcyBzdGls
bCB0aGUgY29ycmVjdCB2YWx1ZSBmb3IgdGhlIEJTUC4KCkJ1dCBpdCdzIG5vIGxvbmdlciB0aGUg
c3RhY2sgYmFzZSAod2hpY2ggaXMgd2hhdCBzdGFja19iYXNlW10gaG9sZHMKZm9yIGFsbCBvdGhl
ciBDUFVzKSwgb3IgZWxzZSB5b3Ugd291bGRuJ3QgaGF2ZSBoYWQgYSBuZWVkIHRvIGNoYW5nZQpk
b19ib290X2NwdSgpLgoKPiBJdCBjb3VsZCBhbHNvIGJlIG1hZGUgaW50byBhbiBpbml0aWFsaXNl
ciwgYnV0IHRoYXQgd291bGQgY2F1c2UKPiBzdGFja19iYXNlW10gdG8gbW92ZSBmcm9tIEJTUyBp
bnRvIGRhdGEsIGFuZCBpdCBpcyBhIE5SX0NQVVMgc2l6ZWQKPiBkYXRhc3RydWN0dXJlLgoKSSBk
byByZWFsaXplIHRoaXMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
