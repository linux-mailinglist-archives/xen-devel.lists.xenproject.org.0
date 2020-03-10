Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10FF17F3F4
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 10:46:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBbQb-00072N-3q; Tue, 10 Mar 2020 09:43:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBbQZ-00072I-NC
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 09:43:55 +0000
X-Inumbo-ID: a7fece56-62b3-11ea-ad42-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7fece56-62b3-11ea-ad42-12813bfff9fa;
 Tue, 10 Mar 2020 09:43:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 33008AD86;
 Tue, 10 Mar 2020 09:43:54 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200303122750.26996-1-jgross@suse.com>
 <8bde8418-420f-6862-760e-1dd6e25b8852@suse.com>
 <247e9905-57ad-edc7-bdac-ce9dd47cc56c@suse.com>
 <58e3214a-53e0-a033-e5fe-94f02dd733f8@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a3bff55f-76c1-6191-f666-e6f32e2c35ee@suse.com>
Date: Tue, 10 Mar 2020 10:43:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <58e3214a-53e0-a033-e5fe-94f02dd733f8@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix onlining cpu with core
 scheduling active
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAwOToxNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwMy4wMy4yMCAx
NzowNCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24gMDMuMDMuMjAgMTQ6MzEsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4gT24gMDMuMDMuMjAyMCAxMzoyNywgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkL2NwdXBvb2wuYwo+Pj4+ICsrKyBiL3hlbi9jb21t
b24vc2NoZWQvY3B1cG9vbC5jCj4+Pj4gQEAgLTYxNiw3ICs2MTYsOCBAQCBzdGF0aWMgaW50IGNw
dXBvb2xfY3B1X2FkZCh1bnNpZ25lZCBpbnQgY3B1KQo+Pj4+IMKgwqDCoMKgwqAgZ2V0X3NjaGVk
X3JlcyhjcHUpLT5jcHVwb29sID0gTlVMTDsKPj4+PiDCoMKgwqDCoMKgIGNwdXMgPSBzY2hlZF9n
ZXRfb3B0X2NwdW1hc2soY3B1cG9vbDAtPmdyYW4sIGNwdSk7Cj4+Pj4gLcKgwqDCoCBpZiAoIGNw
dW1hc2tfc3Vic2V0KGNwdXMsICZjcHVwb29sX2ZyZWVfY3B1cykgKQo+Pj4+ICvCoMKgwqAgaWYg
KCBjcHVtYXNrX3N1YnNldChjcHVzLCAmY3B1cG9vbF9mcmVlX2NwdXMpICYmCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqAgY3B1bWFza193ZWlnaHQoY3B1cykgPj0gY3B1cG9vbF9nZXRfZ3JhbnVsYXJp
dHkoY3B1cG9vbDApICkKPj4+Cj4+PiBXaHkgPj0gLCBub3QgPT0gPyBBbmQgaXMgdGhlIG90aGVy
IHBhcnQgb2YgdGhlIGNvbmRpdGlvbiBuZWVkZWQ/Cj4+Cj4+IEkgY2FuIHN3aXRjaCB0byA9PS4K
Pj4KPj4+IElzbid0IHRoaXMgcmF0aGVyIGEgY29uZGl0aW9uIHRoYXQgY291bGQgYmUgQVNTRVJU
KCllZCwgYXMgQ1BVcwo+Pj4gc2hvdWxkbid0IG1vdmUgb3V0IG9mIHRoZSAiZnJlZSIgc2V0IGJl
Zm9yZSByZWFjaGluZyB0aGUKPj4+IGdyYW51bGFyaXR5Pwo+Pgo+PiBQcm9iYWJseSwgeWVzLiBJ
J2xsIGdpdmUgaXQgc29tZSB0ZXN0aW5nIGFuZCBjaGFuZ2UgaXQgaW4gdGhlIGNhc2UKPj4gb2Yg
KGV4cGVjdGVkKSBzdWNjZXNzLgo+IAo+IFRoaW5raW5nIG1vcmUgYWJvdXQgaXQgSSdtIGluY2xp
bmVkIHRvIGtlZXAgdGVzdGluZyBib3RoIGNvbmRpdGlvbnMuCj4gSW4gY2FzZSB3ZSBhcmUgc3Vw
cG9ydGluZyBjcHVwb29scyB3aXRoIGRpZmZlcmVudCBncmFudWxhcml0aWVzIHdlJ2xsCj4gbmVl
ZCB0byB0ZXN0IGZvciBhbGwgY3B1cyB0byBiZSBmcmVlIGluIGNhc2UgdGhlIG90aGVyIHNpYmxp
bmcgaGFzIGJlZW4KPiBtb3ZlZCB0byBhIGNwdXBvb2wgd2l0aCBncmFuPTEgYWxyZWFkeS4KCkFo
LCB5ZXMsIG1ha2VzIHNlbnNlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
