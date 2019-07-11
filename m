Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F1165E63
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 19:20:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlcha-0002Ko-Vv; Thu, 11 Jul 2019 17:17:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Sfew=VI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hlchZ-0002Ki-Q9
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2019 17:17:49 +0000
X-Inumbo-ID: cde3e278-a3ff-11e9-aa87-fb8e2d2d4a20
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cde3e278-a3ff-11e9-aa87-fb8e2d2d4a20;
 Thu, 11 Jul 2019 17:17:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95B4E337;
 Thu, 11 Jul 2019 10:17:47 -0700 (PDT)
Received: from [10.119.48.77] (unknown [10.119.48.77])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 308FB3F71F;
 Thu, 11 Jul 2019 10:17:47 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 xen-devel@lists.xenproject.org
References: <1562159202-11316-1-git-send-email-vrd@amazon.de>
 <3badf43d-4bd8-9492-247b-7429253c0996@citrix.com>
 <d0729146-a930-4de7-b765-6b0f0ab65e3a@arm.com>
 <9e094ea9-7070-b4a4-c4c5-124bcc6e1652@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <de885305-ccd8-6fd6-4b07-1b325512fcfd@arm.com>
Date: Thu, 11 Jul 2019 18:17:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <9e094ea9-7070-b4a4-c4c5-124bcc6e1652@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: Get rid of p2m_host array allocation
 for HVM guests
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Amit Shah <aams@amazon.de>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gNy8xMS8xOSAzOjI1IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9u
IDEwLzA3LzIwMTkgMTQ6MjUsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Cj4+PiBIb3dldmVyLCBp
biBhdHRlbXB0aW5nIHRvIHJldmlldyB0aGlzLCBJJ3ZlIGdvdCBzb21lIGJpZ2dlciBxdWVzdGlv
bnMuCj4+Pgo+Pj4gQWxsIEFSTSBhbmQgeDg2IEhWTSAoYW5kIFBWSCkgZ3Vlc3RzIHJldHVybiB0
cnVlIGZvcgo+Pj4geGNfZG9tX3RyYW5zbGF0ZWQoKSwgc28gc2hvdWxkIHRha2UgdGhlIGZhc3Rw
YXRoIG91dCBvZiB4Y19kb21fcDJtKCkgYW5kCj4+PiBuZXZlciByZWFkIGZyb20gZG9tLT5wMm1f
aG9zdFtdLsKgIFRoZXJlZm9yZSwgSSBkb24ndCBzZWUgd2h5IHRoZQo+Pj4gbWFqb3JpdHkgb2Yg
dGhpcyBwYXRjaCBpcyBuZWNlc3NhcnkuCj4+Cj4+IEkgYWdyZWUgdGhhdCBwMm1faG9zdCB3aWxs
IG5ldmVyIGdldCB1c2VkIGJ5IEFybS4gU28gdGhpcyBpcyBhIHdhc3RlCj4+IG9mIG1lbW9yeS4K
Pj4KPj4+ICDCoCBPbiB0aGUgQVJNIHNpZGUsIHRoaXMgYWxzbyBtZWFucwo+Pj4gdGhhdCBkb20t
PnJhbWJhc2VfcGZuIGlzbid0IGJlaW5nIHVzZWQgYXMgaW50ZW5kZWQsIHdoaWNoIHN1Z2dlc3Rz
IHRoZXJlCj4+PiBpcyBmdXJ0aGVyIGNsZWFudXAvY29ycmVjdGlvbiB0byBiZSBkb25lIGhlcmUu
Cj4+Cj4+IEkgYW0gbm90IHN1cmUgdG8gZm9sbG93IHRoaXMuIENvdWxkIHlvdSBleHBhbmQgaXQ/
Cj4gCj4gZG9tLT5yYW1iYXNlX3BmbiB3YXMgaW50cm9kdWNlZCBmb3IgQVJNLCBhbmQgdGhlIGNv
ZGUgd2hpY2ggdXNlcyBpdCBpbgo+IHhjX2RvbV9wMm0oKSBpcyBkZWFkIChvbiBBUk0sIG5vdCBv
biB4ODYpLgo+IAo+IEl0IGlzbid0IGZ1bmN0aW9uaW5nIGFzIGludGVuZGVkLgoKSSBhbSBhZnJh
aWQgSSBzdGlsbCBkb24ndCBmb2xsb3cgaXQuLi4gcmFtYmFzZV9wZm4gaXMgdXNlZCBpbiB2YXJp
b3VzIApwbGFjZSBpbiB4Y19kb21fY29yZS5jIGFuZCB4Y19kb21fYXJtemltYWdlbG9hZGVyLmMu
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
