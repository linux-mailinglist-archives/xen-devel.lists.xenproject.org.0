Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEC5142F0C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 16:53:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itZJF-0002QB-Vh; Mon, 20 Jan 2020 15:49:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itZJF-0002Q6-3S
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 15:49:49 +0000
X-Inumbo-ID: 7ae89571-3b9c-11ea-b995-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ae89571-3b9c-11ea-b995-12813bfff9fa;
 Mon, 20 Jan 2020 15:49:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3FCC0AA35;
 Mon, 20 Jan 2020 15:49:46 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200117095251.42668-1-roger.pau@citrix.com>
 <20200117095251.42668-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0b8cec91-9633-37b8-8495-25a34c613992@suse.com>
Date: Mon, 20 Jan 2020 16:49:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200117095251.42668-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] x86/smp: use APIC ALLBUT destination
 shorthand when possible
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAxMDo1MiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IElmIHRoZSBJUEkg
ZGVzdGluYXRpb24gbWFzayBtYXRjaGVzIHRoZSBtYXNrIG9mIG9ubGluZSBDUFVzIHVzZSB0aGUK
PiBBUElDIEFMTEJVVCBkZXN0aW5hdGlvbiBzaG9ydGhhbmQgaW4gb3JkZXIgdG8gc2VuZCBhbiBJ
UEkgdG8gYWxsIENQVXMKPiBvbiB0aGUgc3lzdGVtIGV4Y2VwdCB0aGUgY3VycmVudCBvbmUuIFRo
aXMgY2FuIG9ubHkgYmUgc2FmZWx5IHVzZWQKPiB3aGVuIG5vIENQVSBob3RwbHVnIG9yIHVucGx1
ZyBvcGVyYXRpb25zIGFyZSB0YWtpbmcgcGxhY2UsIG5vCj4gb2ZmbGluZSBDUFVzIG9yIHRob3Nl
IGhhdmUgYmVlbiBvbmxpbmVkIGFuZCBwYXJrZWQsIGFsbCBDUFVzIGluIHRoZQo+IHN5c3RlbSBo
YXZlIGJlZW4gYWNjb3VudGVkIGZvciAoaWU6IHRoZSBudW1iZXIgb2YgQ1BVcyBkb2Vzbid0IGV4
Y2VlZAo+IE5SX0NQVVMgYW5kIEFQSUMgSURzIGFyZSBiZWxvdyBNQVhfQVBJQ1MpIGFuZCB0aGVy
ZSdzIG5vIHBvc3NpYmlsaXR5Cj4gb2YgQ1BVIGhvdHBsdWcgKGllOiBubyBkaXNhYmxlZCBDUFVz
IGhhdmUgYmVlbiByZXBvcnRlZCBieSB0aGUKPiBmaXJtd2FyZSB0YWJsZXMpLgo+IAo+IFRoaXMg
aXMgc3BlY2lhbGx5IGJlbmVmaWNpYWwgd2hlbiB1c2luZyB0aGUgUFYgc2hpbSwgc2luY2UgdXNp
bmcgdGhlCj4gc2hvcnRoYW5kIGF2b2lkcyBwZXJmb3JtaW5nIGFuIEFQSUMgcmVnaXN0ZXIgd3Jp
dGUgKG9yIG11bHRpcGxlIG9uZXMKPiBpZiB1c2luZyB4QVBJQyBtb2RlKSBmb3IgZWFjaCBkZXN0
aW5hdGlvbiB3aGVuIGRvaW5nIGEgZ2xvYmFsIFRMQgo+IGZsdXNoLgo+IAo+IFRoZSBsb2NrIHRp
bWUgb2YgZmx1c2hfbG9jayBvbiBhIDMyIHZDUFUgZ3Vlc3QgdXNpbmcgdGhlIHNoaW0gaW4KPiB4
MkFQSUMgbW9kZSB3aXRob3V0IHRoZSBzaG9ydGhhbmQgaXM6Cj4gCj4gR2xvYmFsIGxvY2sgZmx1
c2hfbG9jazogYWRkcj1mZmZmODJkMDgwNGIyMWMwLCBsb2NrdmFsPWY2MDJmNjAyLCBub3QgbG9j
a2VkCj4gICBsb2NrOjIyODQ1NTkzOCg3OTQwNjA2NTU3MzEzNSksIGJsb2NrOjIwNTkwODU4MCg1
NTY0MTY2MDU3NjE1MzkpCj4gCj4gQXZlcmFnZSBsb2NrIHRpbWU6IDM0NzU3N25zCj4gCj4gV2hp
bGUgdGhlIHNhbWUgZ3Vlc3QgdXNpbmcgdGhlIHNob3J0aGFuZDoKPiAKPiBHbG9iYWwgbG9jayBm
bHVzaF9sb2NrOiBhZGRyPWZmZmY4MmQwODA0YjQxYzAsIGxvY2t2YWw9ZDljNGQ5YmMsIGNwdT0x
Mgo+ICAgbG9jazoxODkwNzc1KDQxNjcxOTE0ODA1NCksIGJsb2NrOjE2NjM5NTgoMjUwMDE2MTI4
Mjk0OSkKPiAKPiBBdmVyYWdlIGxvY2sgdGltZTogMjIwMzk1bnMKPiAKPiBBcHByb3hpbWF0ZWx5
IGEgMS8zIGltcHJvdmVtZW50IGluIHRoZSBsb2NrIHRpbWUuCj4gCj4gTm90ZSB0aGF0IHRoaXMg
cmVxdWlyZXMgbG9ja2luZyB0aGUgQ1BVIG1hcHMgKGdldF9jcHVfbWFwcykgd2hpY2ggdXNlcwo+
IGEgdHJ5bG9jay4gVGhpcyBpcyBjdXJyZW50bHkgc2FmZSBhcyBhbGwgdXNlcnMgb2YgY3B1X2Fk
ZF9yZW1vdmVfbG9jawo+IGRvIGEgdHJ5bG9jaywgYnV0IHdpbGwgbmVlZCByZWV2YWx1YXRpbmcg
aWYgbm9uLXRyeWxvY2sgdXNlcnMgYXBwZWFyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
