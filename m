Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C026812B4FA
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 14:53:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikq0g-0004Bx-SA; Fri, 27 Dec 2019 13:50:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ikq0f-0004Bs-Vr
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 13:50:34 +0000
X-Inumbo-ID: d4e49f1a-28af-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4e49f1a-28af-11ea-b6f1-bc764e2007e4;
 Fri, 27 Dec 2019 13:50:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CF163AC88;
 Fri, 27 Dec 2019 13:50:23 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191227134516.15530-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5660e951-4fa3-a37d-31e9-30e9da97486e@suse.com>
Date: Fri, 27 Dec 2019 14:50:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191227134516.15530-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] tools/libxl: Reposition build_pre() logic
 between architectures
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTIuMjAxOSAxNDo0NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgY2FsbCB0byB4
Y19kb21haW5fZGlzYWJsZV9taWdyYXRlKCkgaXMgbWFkZSBvbmx5IGZyb20geDg2LCB3aGlsZSBp
dHMKPiBoYW5kbGluZyBpbiBYZW4gaXMgY29tbW9uLiAgTW92ZSBpdCB0byB0aGUgbGlieGxfX2J1
aWxkX3ByZSgpLgo+IAo+IGh2bV9zZXRfY29uZl9wYXJhbXMoKSwgaHZtX3NldF92aXJpZGlhbl9m
ZWF0dXJlcygpLAo+IGh2bV9zZXRfbWNhX2NhcGFiaWxpdGllcygpLCBhbmQgdGhlIGFsdHAybSBs
b2dpYyBpcyBhbGwgaW4gY29tbW9uCj4gY29kZSAocGFydHMgaWZkZWYnZCkgYnV0IGRlc3BpdGUg
dGhpcywgaXMgYWxsIGFjdHVhbGx5IHg4NiBzcGVjaWZpYy4KPiAKPiBNb3ZlIGl0IGludG8geDg2
IHNwZWNpZmljIGNvZGUsIGFuZCBmb2xkIGFsbCBvZiB0aGUgeGNfaHZtX3BhcmFtX3NldCgpIGNh
bGxzCj4gdG9nZXRoZXIgaW50byBodm1fc2V0X2NvbmZfcGFyYW1zKCkgaW4gYSBmYXIgbW9yZSBj
b2hlcmVudCB3YXkuCj4gCj4gRmluYWxseSAtIGVuc3VyZSB0aGF0IGFsbCBoeXBlcmNhbGxzIGhh
dmUgdGhlaXIgcmV0dXJuIHZhbHVlcyBjaGVja2VkLgo+IAo+IE5vIHByYWN0aWNhbCBjaGFuZ2Ug
aW4gY29uc3RydWN0ZWQgZG9tYWlucy4gIEZld2VyIHVzZWxlc3MgaHlwZXJjYWxscyBub3cgdG8K
PiBjb25zdHJ1Y3QgYW4gQVJNIGd1ZXN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IElhbiBKYWNrc29uIDxJ
YW4uSmFja3NvbkBjaXRyaXguY29tPgo+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IENDOiBB
bnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiBDQzogSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IENDOiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBDQzogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPgo+IENDOiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBh
bS5jb20+Cj4gLS0tCj4gIHRvb2xzL2xpYnhsL2xpYnhsX2RvbS5jIHwgMTgzICsrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICB0b29scy9saWJ4bC9saWJ4
bF94ODYuYyB8IDE4MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLQoKSSdsbCBkZWZlciB0byB0aGUgdG9vbCBzdGFjayBtYWludGFpbmVycyBoZXJlLiBJbW8g
dGhpcyBmaWxlIHdvdWxkCmJldHRlciBiZSBzcGxpdCAtIG9uZSB0byBjb250YWluIHN0dWZmIGJl
dHRlciBmYWxsaW5nIHVuZGVyIHg4NgptYWludGFpbmVyc2hpcCwgYW5kIHRoZSBvdGhlciBmb3Ig
ZXZlcnl0aGluZyBmYWxsaW5nIGluIHRoZSB0b29sCnN0YWNrIHJlYWxtLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
