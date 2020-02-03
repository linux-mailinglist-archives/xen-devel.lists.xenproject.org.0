Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B58E15063F
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 13:37:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyawM-0001mv-So; Mon, 03 Feb 2020 12:34:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyawL-0001mm-Sn
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 12:34:57 +0000
X-Inumbo-ID: 95b8099a-4681-11ea-8e55-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95b8099a-4681-11ea-8e55-12813bfff9fa;
 Mon, 03 Feb 2020 12:34:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B4449AB92;
 Mon,  3 Feb 2020 12:34:55 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-11-anthony.perard@citrix.com>
 <09ad3bd6-0c4d-d8b0-85c4-c2f5455ffc05@suse.com>
 <20200203121721.GC2306@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5334004d-b1fe-3583-a029-9cbbd43b3737@suse.com>
Date: Mon, 3 Feb 2020 13:34:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203121721.GC2306@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 10/12] xen/build: use new $(c_flags)
 and $(a_flags) instead of $(CFLAGS)
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Anthony PERARD <anthony.perard@gmail.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxMzoxNywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gVGh1LCBKYW4g
MzAsIDIwMjAgYXQgMDI6Mjk6NDJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE3
LjAxLjIwMjAgMTE6NTMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gV2Ugd291bGQgbGlrZSB0
byBjYWxjdWxhdGUgQ0ZMQUdTIG9uY2UgYW5kIGJlZm9yZSBjYWxsaW5nIFJ1bGVzLm1rLAo+Pj4g
c28gdGhlIHZhcmlhYmxlIENGTEFHUyBuZWVkcyB0byBoYXZlIHRoZSBzYW1lIHZhbHVlIGFjcm9z
cyB0aGUgd2hvbGUKPj4+IGJ1aWxkLiBUaHVzIHdlIG5lZWQgYSBuZXcgdmFyaWFibGUgd2hlcmUg
c29tZSBmbGFncyBjYW4gY2hhbmdlCj4+PiBkZXBlbmRpbmcgb24gdGhlIHRhcmdldCBuYW1lLgo+
Pj4KPj4+IEJvdGggdGhlIGRlcGVuZGVuY3kgYW5kIF9fT0JKRUNUX0ZJTEVfXyBhcmUgc3VjaCBm
bGFncyB0aGF0IGNoYW5nZQo+Pj4gZGVwZW5kaW5nIG9uIHRoZSB0YXJnZXQsIHNvIHRoZXJlIGFy
ZSBtb3ZlIG91dCBvZiAkKENGTEFHUykuCj4+Cj4+IEknbSBhZnJhaWQgSSBkb24ndCB1bmRlcnN0
YW5kOiBCZWluZyBhIGRlbGF5ZWQgZXhwYW5zaW9uIChvcgo+PiAicmVjdXJzaXZlbHkgZXhwYW5k
ZWQiKSB2YXJpYWJsZSwgd2hhdCBwcm9ibGVtIGlzIHRoZXJlIHdoZW4gQ0ZMQUdTCj4+IHJlZmVy
ZW5jZXMgJEA/IElzIHRoZXJlIGEgcGxhbiB0byBjaGFuZ2UgdGhlIHZhcmlhYmxlJ3MgZmxhdm9y
PyBJZgo+PiBzbywgSSdkIGxpa2UgdG8gYXNrIGZvciB0aGlzIHRvIGJlIG1lbnRpb25lZCBoZXJl
LiAiQ2FsY3VsYXRlIG9uY2UiLAo+PiBhdCBsZWFzdCB0byBtZSwgZG9lc24ndCBpbXBseSB0aGlz
Lgo+IAo+IElmIEkgcmV3cml0ZSB0aGUgZmlyc3QgcGFyYWdyYXBoIHRodXMsIHdvdWxkIHRoYXQg
YmUgYmV0dGVyPwo+IAo+ICAgICBJbiBhIGxhdGVyIHBhdGNoLCB3ZSB3YW50IHRvIGNhbGN1bGF0
ZSB0aGUgQ0ZMQUdTIGluIHhlbi9NYWtlZmlsZSwKPiAgICAgdGhlbiBleHBvcnQgaXQuIFNvIGhh
dmUgUnVsZXMubWsgdXNlIGEgQ0ZMQUdTIGZyb20gdGhlIGVudmlyb25tZW50Cj4gICAgIHZhcmlh
Ymxlcy4gVGhpcyB3aWxsIG1lYW4gdGhhdCBpZiBSdWxlcy5tayBvciBhIE1ha2VmaWxlIG1vZGlm
eQo+ICAgICBDRkxBR1MgZm9yIGEgdGFyZ2V0LCB0aGUgbW9kaWZpY2F0aW9uIHByb3BhZ2F0ZXMg
dG8gb3RoZXIgdGFyZ2V0cy4KPiAgICAgVGh1cyB3ZSB3aWxsIG5lZWQgYSBkaWZmZXJlbnQgdmFy
aWFibGUgbmFtZSB0aGFuIHRoZSBvbmUgZnJvbSB0aGUKPiAgICAgZW52aXJvbm1lbnQgd2hpY2gg
Y2FuIGhhdmUgYSBkaWZmZXJlbnQgdmFsdWUgZm9yIGVhY2ggdGFyZ2V0LgoKSSB0aGluayB0aGlz
IGlzIGJldHRlciwgeWVzLCBhbGJlaXQgSSdtIHN0aWxsIGEgbGl0dGxlIHVuaGFwcHkKYWJvdXQg
dGhlIHVzZXMgb2YgInRhcmdldCIgaGVyZTogSXQgbWFrZXMgaXQgbG9vayB0byBtZSBhcyBpZgp0
aGlzIHdhcyBwcmltYXJpbHkgYWJvdXQgdGhpbmdzIGxpa2UKCmFiYy5vOiBDRkxBR1MgKz0gLi4u
Cgp3aGVyZSwgdW5sZXNzIGl0cyBydWxlIGludm9rZXMgbWFrZSwgSSBkb24ndCB0aGluayB0aGUg
YWRqdXN0bWVudAp3b3VsZCBwcm9wYWdhdGUgYW55d2hlcmUuIEluc3RlYWQgYWl1aSB3aGF0IHlv
dSByZWZlciB0byBpcyBzb2xlbHkKYW4gZWZmZWN0IGZyb20gdGhlIHN1YmRpciB0cmF2ZXJzYWwg
dGhlIGJ1aWxkIHN5c3RlbSBkb2VzPwoKPj4+IEBAIC0xNDEsOSArMTM3LDE2IEBAIGVuZGlmCj4+
PiAgIyBBbHdheXMgYnVpbGQgb2JqLWJpbiBmaWxlcyBhcyBiaW5hcnkgZXZlbiBpZiB0aGV5IGNv
bWUgZnJvbSBDIHNvdXJjZS4gCj4+PiAgJChvYmotYmluLXkpOiBDRkxBR1MgOj0gJChmaWx0ZXIt
b3V0IC1mbHRvLCQoQ0ZMQUdTKSkKPj4+ICAKPj4+ICtjX2ZsYWdzID0gLU1NRCAtTUYgJChARCkv
LiQoQEYpLmQgXAo+Pj4gKyAgICAgICAgICAkKENGTEFHUykgXAo+Pj4gKyAgICAgICAgICAnLURf
X09CSkVDVF9GSUxFX189IiRAIicKPj4+ICsKPj4+ICthX2ZsYWdzID0gLU1NRCAtTUYgJChARCkv
LiQoQEYpLmQgXAo+Pj4gKyAgICAgICAgICAkKEFGTEFHUykKPj4KPj4gSXMgdGhlcmUgYSByZWFz
b24gYm90aCBnZXQgZXh0ZW5kZWQgb3ZlciBtdWx0aXBsZSBsaW5lcz8KPiAKPiBCZXNpZGUgdGhh
dCBpdCBsb29rcyBjbGVhbmVyIHRvIG1lLCBub3QgcmVhbGx5LgoKQXBwYXJlbnRseSBhIG1hdHRl
ciBvZiB0YXN0ZSB0aGVuLiBJIGdlbmVyYWxseSBjb25zaWRlciB0cmFpbGluZwpiYWNrc2xhc2hl
cyBhIGxpdHRsZSAidW5jbGVhbiIsIGFuZCBoZW5jZSB3b3VsZCBwcmVmZXIgdG8gYXZvaWQKdGhl
bSBpZiBJIGNhbi4KCj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9NYWtlZmlsZQo+Pj4gKysrIGIveGVu
L2luY2x1ZGUvTWFrZWZpbGUKPj4+IEBAIC02NCw3ICs2NCw3IEBAIGNvbXBhdC8lLmg6IGNvbXBh
dC8lLmkgTWFrZWZpbGUgJChCQVNFRElSKS90b29scy9jb21wYXQtYnVpbGQtaGVhZGVyLnB5Cj4+
PiAgCW12IC1mICRALm5ldyAkQAo+Pj4gIAo+Pj4gIGNvbXBhdC8lLmk6IGNvbXBhdC8lLmMgTWFr
ZWZpbGUKPj4+IC0JJChDUFApICQoZmlsdGVyLW91dCAtV2EkKGNvbW1hKSUgLU0lICUuZCAtaW5j
bHVkZSAlL2luY2x1ZGUveGVuL2NvbmZpZy5oLCQoQ0ZMQUdTKSkgJChjcHBmbGFncy15KSAtbyAk
QCAkPAo+Pj4gKwkkKENQUCkgJChmaWx0ZXItb3V0IC1XYSQoY29tbWEpJSAtTSUgJS5kIC1pbmNs
dWRlICUvaW5jbHVkZS94ZW4vY29uZmlnLmgsJChjX2ZsYWdzKSkgJChjcHBmbGFncy15KSAtbyAk
QCAkPAo+Pgo+PiBJIHRoaW5rIHRoaXMgd2FudHMgdG8gY29udGludWUgdG8gcmVmZXJlbmNlICQo
Q0ZMQUdTKSBhbmQgaW5zdGVhZCBoYXZlCj4+IHRoZSAtTSUgYW5kICUuZCBwYXR0ZXJucyBkcm9w
cGVkLiBTaW1pbGFybHkgSSBndWVzcyBhcy1pbnNuIGluIENvbmZpZy5tawo+PiBjb3VsZCB0aGVu
IGhhdmUgdGhlc2UgdHdvIHBhdHRlcm5zIGRyb3BwZWQuCj4gCj4gSXQncyBwcm9iYWJseSBhIGdv
b2QgaWRlYSB0byBrZWVwIHVzaW5nIENGTEFHUywgSSdsbCBsb29rIGludG8gaXQuCj4gQXMgdG8g
Y2hhbmdlIGFzLWluc24sIEkgY2FuIG1vdmUgaXQgb3V0IG9mIENvbmZpZy5tayBhbmQgdGhlbiBj
aGFuZ2UgaXQuCj4gSSdsbCBsb29rIGludG8gdGhhdCBhcyB3ZWxsLgoKVGhhbmsgeW91LgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
