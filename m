Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB8E11C9F8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 10:55:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifL9G-0002eE-QK; Thu, 12 Dec 2019 09:52:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifL9F-0002e9-8h
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 09:52:41 +0000
X-Inumbo-ID: 1ce9926c-1cc5-11ea-a914-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ce9926c-1cc5-11ea-a914-bc764e2007e4;
 Thu, 12 Dec 2019 09:52:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2B254AC18;
 Thu, 12 Dec 2019 09:52:30 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191209180638.47305-1-roger.pau@citrix.com>
 <db19e41f-9ecf-b999-23ce-075daf6dff22@citrix.com>
 <2214d2ca-271b-da04-14a1-7014c8faf6ed@suse.com>
 <25310dca-1f21-942d-1f88-0d712658de6f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7fd931f2-7945-bfcc-3280-5ea563b54059@suse.com>
Date: Thu, 12 Dec 2019 10:52:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <25310dca-1f21-942d-1f88-0d712658de6f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: store cr4 during suspend/resume
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMjAxOSAyMDozNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMC8xMi8yMDE5
IDEwOjA3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTAuMTIuMjAxOSAxMDo1OSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDA5LzEyLzIwMTkgMTg6MDYsIFJvZ2VyIFBhdSBNb25uZSB3
cm90ZToKPj4+PiBDdXJyZW50bHkgY3I0IGlzIG5vdCBjYWNoZWQgYmVmb3JlIHN1c3BlbnNpb24s
IGFuZCBtbXVfY3I0X2ZlYXR1cmVzIGlzCj4+Pj4gdXNlZCBpbiBvcmRlciB0byByZXN0b3JlIHRo
ZSBleHBlY3RlZCBjcjQgdmFsdWUuIFRoaXMgaXMgY29ycmVjdCBzbwo+Pj4+IGZhciBiZWNhdXNl
IHRoZSB0YXNrbGV0IHRoYXQgZXhlY3V0ZXMgdGhlIHN1c3BlbmQvcmVzdW1lIGNvZGUgaXMKPj4+
PiBydW5uaW5nIGluIHRoZSBpZGxlIHZDUFUgY29udGV4dC4KPj4+Pgo+Pj4+IEluIG9yZGVyIHRv
IG1ha2UgdGhlIGNvZGUgbGVzcyBmcmFnaWxlLCBleHBsaWNpdGx5IHNhdmUgdGhlIGN1cnJlbnQK
Pj4+PiBjcjQgdmFsdWUgYmVmb3JlIHN1c3BlbnNpb24sIHNvIHRoYXQgaXQgY2FuIGJlIHJlc3Rv
cmVkIGFmdGVyd2FyZHMuCj4+Pj4gVGhpcyBlbnN1cmVzIHRoYXQgdGhlIGNyNCB2YWx1ZSBjYWNo
ZWQgaW4gdGhlIGNwdV9pbmZvIGRvZXNuJ3QgZ2V0IG91dAo+Pj4+IG9mIHN5bmMgYWZ0ZXIgcmVz
dW1lIGZyb20gc3VzcGVuc2lvbi4KPj4+Pgo+Pj4+IFN1Z2dlc3RlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+Pj4gV2h5P8KgIFRoZXJlIGlzIG5vdGhpbmcgZnJhZ2ls
ZSBoZXJlLsKgIFN1c3BlbmQvcmVzdW1lIGlzIGFsd2F5cyBpbiBpZGxlCj4+PiBjb250ZXh0IGFu
ZCBsb2FkcyBvZiBvdGhlciBsb2dpYyBhbHJlYWR5IGRlcGVuZHMgb24gdGhpcy4KPj4+Cj4+PiBJ
J3ZlIGJlZW4gc2xvd2x5IHN0cmlwcGluZyBvdXQgcmVkdW5kYW50IHNhdmVkIHN0YXRlIGxpa2Ug
dGhpcy4KPj4gV2hlcmUgaXQncyBjbGVhcmx5IHJlZHVuZGFudCwgdGhpcyBpcyBmaW5lLiBCdXQg
SSBkb24ndCB0aGluayBpdCdzCj4+IHN1ZmZpY2llbnRseSBjbGVhciBoZXJlCj4gCj4gVGhlcmUg
aXMgYSByZWFzb24gSSBtYWRlIGl0IGV4cGxpY2l0bHkgY3J5c3RhbCBjbGVhciB3aXRoIGMvcyA4
N2U3YjRkNWIKCldlbGwsIHRoaXMgbWFrZXMgY2xlYXIgd2UncmUgaW4gaWRsZSBjb250ZXh0LCB5
ZXMuIEJ1dCB0aGVyZSdzCnN0aWxsIGEgZGlzY29ubmVjdCBiZXR3ZWVuIHRoaXMgYW5kIHRoZSB1
c2Ugb2YgbW11X2NyNF9mZWF0dXJlcwoodXAgdG8gYW5kIGluY2x1ZGluZyB0aGUgc29tZXdoYXQg
bWlzbGVhZGluZyBjb21tZW50IHNheWluZwoibW11X2NyNF9mZWF0dXJlcyBjb250YWlucyBsYXRl
c3QgY3I0IHNldHRpbmciIHdpdGhvdXQgaXQgcmVhbGx5CmJlaW5nIGNsZWFyIHdoYXQgImxhdGVz
dCIgbWVhbnMsIG5vdyB0aGF0IHdlIHJ1biB3aXRoIHZhcnlpbmcKQ1I0IHZhbHVlcy4gWWVzLCB3
cml0ZV9wdGJhc2UoKSBkb2VzIHVzZSB0aGUgdmFyaWFibGUgd2hlbgpzd2l0Y2hpbmcgdG8gaWRs
ZSwgYnV0IHRoZSB2YXJpYWJsZSBuYW1lIGxhY2sgYW55IGNvbm5lY3Rpb24gdG8KdGhpcyBmYWN0
LgoKPj4gLCBhbmQgZ29pbmcgYmFjayB0byB3aGF0IHdhcyB0aGVyZSBiZWZvcmUKPj4gaXMgaW1v
IGdlbmVyYWxseSBsZXNzIGVycm9yIHByb25lIHRoYW4gZ29pbmcgdG8gc29tZSBmaXhlZCBzdGF0
ZS4KPiAKPiBJdCBpcyBkZW1vbnN0cmFibHkgbW9yZSBlcnJvciBwcm9uZSwgd2hpY2ggaXMgd2h5
IEknbSBzbG93bHkga2lsbGluZyBpdC4KPiAKPiBTdGFzaGluZyBzdGF0ZSB3YXN0ZXMgdW5uZWNl
c3Nhcnkgc3BhY2UsIGFuZCBhZGRzIGFuIGVycm9yIGNhc2Ugd2hlcmUKPiBzdGF0ZSBpcyBlaXRo
ZXIgc3Rhc2hlZCBpbmNvcnJlY3RseSwgb3IgZ2V0cyBtb2RpZmllZCBiZWZvcmUgcmVzdG9yZSwK
PiBhbmQgd2UnbGwgYmxpbmRseSB1c2UuCgpUaGUgd2FzdGUgb2Ygc3BhY2UgaXMgZW50aXJlbHkg
c2Vjb25kYXJ5IGhlcmUsIEkgdGhpbmsuIEEgdmFsdWUKZ2V0dGluZyBtb2RpZmllZCBiZWZvcmUg
cmVzdG9yZSBpcyBubyBkaWZmZXJlbnQgZnJvbSBhIHZhbHVlCmdvaW5nIG91dCBvZiBzeW5jIHdp
dGggdGhlIHZhcmlhYmxlIHdlIHJlbG9hZCBmcm9tLiBJdCdzIGEgYmxpbmQKdXNlIGluIGVpdGhl
ciBjYXNlLgoKPiBUd28gZXhhbXBsZXMgb2YgcmVhbCBidWdzIGNhdXNlZCBieSB0aGlzIGFyZSBj
L3MgMGMzMDE3MWNiIGFuZCA0ZWUwYWQ3MmQKCkkgc2VlIHlvdXIgcG9pbnQgZm9yIHRoZSBmb3Jt
ZXIsIGJ1dCB0aGUgbGF0dGVyIHNlZW1zIHRvIGJlIHVucmVsYXRlZC4KCj4gQWJzb2x1dGVseSBu
b3RoaW5nIHJlbWFpbmluZyBpbiBzdXNwZW5kLmMgc2hvdWxkIGJlIHNwaWxsZWQuwqAgSXQgY2Fu
IGFsbAo+IGJlIChyZSljYWx1Y2xhdGVkIGZyb20gdGhlIHNhbWUgaW5mb3JtYXRpb24gc291cmNl
IGFzIHRoZSBBUCBib290IHBhdGgsCj4gYW5kIHRoZSByZXN1bHQgd2lsbCBiZSBzdHJpY3RseSBz
bWFsbGVyIGluIFJBTSwgYW5kIG1vcmUgcm9idXN0LgoKUm9idXN0bmVzcyB0byBtZSB3b3VsZCBp
bXBseSB1c2luZyB0aGUgc2FtZSBjb2RlIGZvciBkb2luZyB0aGUKY2FsY3VsYXRpb25zLCBub3Qg
cmUtY2FsY3VsYXRpbmcgZnJvbSB0aGUgc2FtZSBpbmZvcm1hdGlvbiBzb3VyY2UuClRoaXMgY291
bGQgYmUgYXMgc2ltcGxlIGFzIGFuIGlkbGVfY3I0KCkgd3JhcHBlciBhcm91bmQgdGhlIHJlYWQK
b2YgbW11X2NyNF9mZWF0dXJlcyBmb3IgdGhlIGNhc2UgYXQgaGFuZCAoc3VpdGFibHkgdXNlZCB3
aGVyZXZlcgphcHBsaWNhYmxlKS4KCkFueXdheSAtIHRvZ2V0aGVyIHdpdGggeW91ciBzdWJzZXF1
ZW50IG1haWwgSSBhY2NlcHQgeW91ciBvYmplY3Rpb25zLgpPbmNlIHRoZSBjb2RlIGNoYW5nZXMg
cHJvcG9zZWQgdGhlcmUgaGF2ZSBnb25lIGluLCBJIHRoaW5rIGl0J2xsCmJlY29tZSBtb3JlIGNs
ZWFyIHRvIHJlYWRlcnMgdGhhdCBpbmRlZWQgc3RhdGUgc2F2aW5nL3Jlc3RvcmluZyBpcyB0bwpi
ZSB0aGUgZXhjZXB0aW9uLCBub3QgdGhlIHJ1bGUgKGN1cnJlbnQgY29kZSBkb2Vzbid0IGdpdmUg
dGhpcwppbXByZXNzaW9uLCBJIHRoaW5rKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
