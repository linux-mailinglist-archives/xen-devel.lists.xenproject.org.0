Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 604EF132B02
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 17:21:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iorZd-0004xf-PX; Tue, 07 Jan 2020 16:19:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iorZc-0004xU-LO
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 16:19:16 +0000
X-Inumbo-ID: 6e13f778-3169-11ea-acfb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e13f778-3169-11ea-acfb-bc764e2007e4;
 Tue, 07 Jan 2020 16:19:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5F75CB035;
 Tue,  7 Jan 2020 16:19:07 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-3-andrew.cooper3@citrix.com>
 <145d6e59-b50e-b617-cbb5-48ebed002c23@suse.com>
 <fd2d333a-8127-2688-acb7-b082955f9eb5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b07c66db-193e-7bb0-7ea2-12d876b3ccac@suse.com>
Date: Tue, 7 Jan 2020 17:19:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <fd2d333a-8127-2688-acb7-b082955f9eb5@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/6] x86/boot: Map the trampoline as
 read-only
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

T24gMDcuMDEuMjAyMCAxNjo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNy8wMS8yMDIw
IDE1OjIxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDYuMDEuMjAyMCAxNjo1NCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IGMvcyBlYzkyZmNkMWQwOCwgd2hpY2ggY2F1c2VkIHRoZSB0cmFt
cG9saW5lIEdEVCBBY2Nlc3MgYml0cyB0byBiZSBzZXQsCj4+PiByZW1vdmVkIHRoZSBmaW5hbCB3
cml0ZXMgd2hpY2ggb2NjdXJyZWQgYmV0d2VlbiBlbmFibGluZyBwYWdpbmcgYW5kIHN3aXRjaGlu
Zwo+Pj4gdG8gdGhlIGhpZ2ggbWFwcGluZ3MuICBUaGVyZSBkb24ndCBwbGF1c2libHkgbmVlZCB0
byBiZSBhbnkgbWVtb3J5IHdyaXRlcyBpbgo+Pj4gZmV3IGluc3RydWN0aW9ucyBpcyB0YWtlcyB0
byBwZXJmb3JtIHRoaXMgdHJhbnNpdGlvbi4KPj4+Cj4+PiBBcyBhIGNvbnNlcXVlbmNlLCB3ZSBj
YW4gcmVtb3ZlIHRoZSBSV1ggbWFwcGluZyBvZiB0aGUgdHJhbXBvbGluZS4gIEl0IGlzIFJYCj4+
PiB2aWEgaXRzIGlkZW50aXR5IG1hcHBpbmcgYmVsb3cgMU0sIGFuZCBSVyB2aWEgdGhlIGRpcmVj
dG1hcC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgo+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+Pgo+Pj4gVGhpcyBwcm9iYWJseSB3YW50cyBiYWNrcG9ydGluZywgYWxvbmdzaWRlIGVj
OTJmY2QxZDA4IGlmIGl0IGhhc24ndCB5ZXQuCj4+IFRoaXMgaXMganVzdCBjbGVhbnVwLCBsYXJn
ZWx5IGNvc21ldGljIGluIG5hdHVyZS4gSXQgY291bGQgYmUgYXJndWVkCj4+IHRoYXQgb25jZSB0
aGUgZGlyZWN0bWFwIGhhcyBkaXNhcHBlYXJlZCB0aGlzIGNhbiBzZXJ2ZSBhcyBhZGRpdGlvbmFs
Cj4+IHByb29mIHRoYXQgdGhlIHRyYW1wb2xpbmUgcmFuZ2UgaGFzIG5vIChpbnRlbmRlZCkgd3Jp
dGFibGUgbWFwcGluZ3MKPj4gYW55bW9yZSwgYnV0IHByaW9yIHRvIHRoYXQgcG9pbnQgSSBkb24n
dCBzZWUgbXVjaCBmdXJ0aGVyIGJlbmVmaXQuCj4+IENvdWxkIHlvdSBleHBhbmQgb24gdGhlIHJl
YXNvbnMgd2h5IHlvdSBzZWUgYm90aCBhcyBiYWNrcG9ydGluZwo+PiBjYW5kaWRhdGVzPwo+IAo+
IERlZmVuY2UgaW4gZGVwdGguCj4gCj4gQW4gUldYIG1hcHBpbmcgaXMgdmVyeSBhdHRyYWN0aXZl
IGZvciBhbiBhdHRhY2tlciB3aG8ncyBicm9rZW4gaW50byBYZW4KPiBhbmQgaXMgbG9va2luZyB0
byBleHBhbmQgdGhlIGRhbWFnZSB0aGV5IGNhbiBkby4KClN1Y2ggYW4gYXR0YWNrZXIgaXMgdHlw
aWNhbGx5IGluIHRoZSBwb3NpdGlvbiB0aG91Z2ggdG8gbWFrZQp0aGVtc2VsdmVzIFJXWCBtYXBw
aW5ncy4gSGF2aW5nIGFzIGxpdHRsZSBhcyBwb3NzaWJsZSBpcyBvbmx5CmNvbXBsaWNhdGluZyB0
aGVpciBqb2IsIG5vdCBtYWtpbmcgaXQgaW1wb3NzaWJsZSwgSSB3b3VsZCBzYXkuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
