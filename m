Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B115290F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 11:24:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izHpv-00051D-Gz; Wed, 05 Feb 2020 10:23:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izHpt-00050z-KV
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 10:23:09 +0000
X-Inumbo-ID: 7f86a286-4801-11ea-90bc-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f86a286-4801-11ea-90bc-12813bfff9fa;
 Wed, 05 Feb 2020 10:23:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7C8F5ADB3;
 Wed,  5 Feb 2020 10:23:05 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200203144340.4614-1-andrew.cooper3@citrix.com>
 <20200203144340.4614-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c8a16d97-d851-7a7e-e7c7-eac50ddbfa62@suse.com>
Date: Wed, 5 Feb 2020 11:22:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203144340.4614-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] AMD/IOMMU: Treat guest head/tail
 pointers as byte offsets
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

T24gMDMuMDIuMjAyMCAxNTo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgTU1JTyByZWdp
c3RlcnMgYXMgYWxyZWFkeSBieXRlIG9mZnNldHMuICBCeSBtYXNraW5nIG91dCB0aGUgcmVzZXJ2
ZWQgYml0cwo+IHN1aXRhYmx5IGluIGd1ZXN0X2lvbW11X21taW9fd3JpdGU2NCgpLCB3ZSBjYW4g
dXNlIHRoZSB2YWx1ZXMgZGlyZWN0bHksCj4gaW5zdGVhZCBvZiBtYXNraW5nL3NoaWZ0aW5nIG9u
IGV2ZXJ5IHVzZS4KCkkgZ3Vlc3MgaXQncyB1bmNsZWFyIHdoZXRoZXIgc3VjaCBtYXNraW5nIG1h
dGNoZXMgcmVhbCBoYXJkd2FyZQpiZWhhdmlvciwgYnV0IGl0J3MgY2VydGFpbmx5IHdpdGhpbiBz
cGVjIHdpdGggYWxsIG90aGVyIGJpdHMKdGhlcmUgcmVzZXJ2ZWQuCgo+IFN0b3JlIHRoZSBidWZm
ZXIgc2l6ZSwgcmF0aGVyIHRoYW4gdGhlIG51bWJlciBvZiBlbnRyaWVzLCB0byBrZWVwIHRoZSBz
YW1lCj4gdW5pdHMgZm9yIGNvbXBhcmlzb24gcHVycG9zZXMuCj4gCj4gVGhpcyBzaW1wbGlmaWVz
IGd1ZXN0X2lvbW11X2dldF90YWJsZV9tZm4oKSBieSBkcm9wcGluZyB0aGUgZW50cnlfc2l6ZQo+
IHBhcmFtZXRlciwgYW5kIHNpbXBsaWZpZXMgdGhlIG1hcF9kb21haW5fcGFnZSgpIGhhbmRsaW5n
IGJ5IGJlaW5nIGFibGUgdG8gZHJvcAo+IHRoZSBsb2dfYmFzZSB2YXJpYWJsZXMuCj4gCj4gTm8g
ZnVuY3Rpb25hbCBjaGFuZ2UuCgpXZWxsLCBub3QgZXhhY3RseSAtIHJlYWRzIG9mIHRob3NlIGhl
YWQvdGFpbCByZWdpc3RlcnMgcHJldmlvdXNseQpyZXR1cm5lZCB0aGUgbGFzdCB3cml0dGVuIHZh
bHVlIGFmYWljdC4KCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
