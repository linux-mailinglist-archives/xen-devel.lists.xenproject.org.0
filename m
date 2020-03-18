Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE7A189D9E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 15:10:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEZMO-00054p-9T; Wed, 18 Mar 2020 14:07:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ggnj=5D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEZMN-00054j-6s
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 14:07:51 +0000
X-Inumbo-ID: d98a9c2e-6921-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d98a9c2e-6921-11ea-bec1-bc764e2007e4;
 Wed, 18 Mar 2020 14:07:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A34E9B1C0;
 Wed, 18 Mar 2020 14:07:48 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <916bbc82cafac74f0a203b48eebfbc711bd33a70.camel@infradead.org>
 <c22d4a40717c7d2fad243c244619d2882ad5baf2.camel@infradead.org>
 <5fc87ac4-8be9-3881-03af-85faca1e2bf5@suse.com>
 <9664816b-7607-c3f4-b70c-455bb946241f@xen.org>
 <079ba681-0a2d-95a5-046d-15be3e123a4f@suse.com>
 <07231df6-6c4e-1fc9-4833-6e5a50b5b3d4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a27dfbce-ad88-e8e6-8d43-b630eaf204a9@suse.com>
Date: Wed, 18 Mar 2020 15:07:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <07231df6-6c4e-1fc9-4833-6e5a50b5b3d4@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] x86/setup: simplify handling of
 initrdidx when no initrd present
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <xadimgnik@gmail.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDMuMjAyMCAxNDoyOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+IAo+IE9uIDE4LzAz
LzIwMjAgMTM6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxOC4wMy4yMDIwIDEzOjEyLCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBPbiAxOC8wMy8yMDIwIDExOjUxLCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxOC4wMy4yMDIwIDEyOjQ2LCBEYXZpZCBXb29kaG91
c2Ugd3JvdGU6Cj4+Pj4+IEZyb206IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+
Cj4+Pj4+Cj4+Pj4+IFJlbW92ZSBhIHRlcm5hcnkgb3BlcmF0b3IgdGhhdCBtYWRlIG15IGJyYWlu
IGh1cnQuCj4+Pj4KPj4+PiBNeSBwb3NpdGlvbiB0b3dhcmRzIHRoaXMgaGFzbid0IGNoYW5nZWQs
IGp1c3QgZnRyLgo+Pj4+Cj4+Pj4+IFJlcGxhY2UgaXQgd2l0aCBzb21ldGhpbmcgc2ltcGxlciB0
aGF0IG1ha2VzIGl0IHNvbWV3aGF0IGNsZWFyZXIgdGhhdAo+Pj4+PiB0aGUgY2hlY2sgZm9yIGlu
aXRyZGlkeCA8IG1iaS0+bW9kc19jb3VudCBpcyBiZWNhdXNlIGxhcmdlciB2YWx1ZXMgYXJlCj4+
Pj4+IHdoYXQgZmluZF9maXJzdF9iaXQoKSB3aWxsIHJldHVybiB3aGVuIGl0IGRvZXNuJ3QgZmlu
ZCBhbnl0aGluZy4KPj4+Pj4KPj4+Pj4gQWxzbyBkcm9wIHRoZSBleHBsaWNpdCBjaGVjayBmb3Ig
bW9kdWxlICMwIHNpbmNlIHRoYXQgd291bGQgYmUgdGhlCj4+Pj4+IGRvbTAga2VybmVsIGFuZCB0
aGUgY29ycmVzcG9uZGluZyBiaXQgaXMgYWx3YXlzIGNsZWFyIGluIG1vZHVsZV9tYXAuCj4+Pj4+
Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+
Cj4+Pj4+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+Pj4+Cj4+Pj4g
U3RyaWN0bHkgc3BlYWtpbmcgdGhpcyBpcyBub3QgYSB2YWxpZCB0YWcgaGVyZSwgb25seSBSLWIg
d291bGQgYmUuCj4+Pgo+Pj4gSSBjYW4ndCBmaW5kIGFueSBydWxlIGluIG91ciBjb2RlIGJhc2Ug
cHJldmVudGluZyBhIG5vbi1tYWludGFpbmVyIHRvIGFkZCBpdHMgImFja2VkLWJ5IiB0YWcuCj4+
Cj4+IEkgY291bGQgaGF2ZSBzYWlkICJtZWFuaW5nZnVsIiBpbnN0ZWFkIG9mICJ2YWxpZCI6IEEg
cGF0Y2ggaXMgbm90Cj4+IHN1cHBvc2VkIHRvIGdvIGluIHdpdGhvdXQgYSBkaXJlY3QgbWFpbnRh
aW5lcidzIGFjaywgdW5sZXNzIHRoZXJlJ3MKPj4gYSByZWFzb24gdG8gaW52b2tlIHRoZSBuZXN0
ZWQgbWFpbnRhaW5lcnNoaXAgcnVsZXMuIFRoYXQncyBteQo+PiB1bmRlcnN0YW5kaW5nIGF0IGxl
YXN0Lgo+IAo+IEkgc3RpbGwgZG9uJ3Qgc2VlIHdoeSB5b3UgYXJlIG5vdCBoYXBweSB3aXRoIG15
IHRhZyBoZXJlCj4gdGhlIG1vcmUgSSBkb24ndCB0aGluayBEYXZpZCBvciBJIGV2ZXIgY2xhaW1l
ZCBteSBhY2tlZC1ieQo+IHdhcyBzdWZmaWNpZW50IGZvciB0aGUgcGF0Y2ggdG8gYmUgbWVyZ2Vk
LgoKSSBkaWRuJ3Qgc2F5IEknbSBub3QgaGFwcHkgd2l0aCBpdC4gSSBtZXJlbHkgdHJpZWQgdG8g
c3RhdGUgYQpmYWN0LCBmb3IgdGhlIGF2b2lkYW5jZSBvZiBkb3VidC4KCj4gV2l0aCBteSB0YWcg
SSBhY2tub3dsZWRnZWQgdGhlIHBhdGNoLiBJIGNvdWxkIGFsc28gaGF2ZQo+IGlnbm9yZWQgaXQg
YW5kIHlvdSB3b3VsZCBoYXZlIGNvbXBsYWluZWQgdGhhdCBub2JvZHkgaGVscAo+IHlvdSByZXZp
ZXdpbmcgcGF0Y2hlcy4uLgoKQW4gUi1iIHdvdWxkIGhhdmUgYWNoaWV2ZWQgdGhlIHNhbWUgZWZm
ZWN0LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
