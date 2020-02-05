Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD05153100
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 13:45:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izK1B-0002J2-UG; Wed, 05 Feb 2020 12:42:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n2Y8=3Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1izK19-0002IT-OC
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 12:42:55 +0000
X-Inumbo-ID: 07d9b868-4815-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07d9b868-4815-11ea-b211-bc764e2007e4;
 Wed, 05 Feb 2020 12:42:55 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izK17-00050w-3C; Wed, 05 Feb 2020 12:42:53 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izK16-0008SR-Pb; Wed, 05 Feb 2020 12:42:53 +0000
Date: Wed, 5 Feb 2020 12:42:49 +0000
From: Wei Liu <wl@xen.org>
To: "Xia, Hongyan" <hongyxia@amazon.com>
Message-ID: <20200205124249.yjftscman7omq6fc@debian>
References: <45c03833059b0ce3f52c02693a2eb649356adf3e.1580755007.git.hongyxia@amazon.com>
 <20200204120808.fknxju7u43jpmvcc@debian>
 <9ca0658178bc07b19c8c0fcd0aed822fa8be7c1c.camel@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ca0658178bc07b19c8c0fcd0aed822fa8be7c1c.camel@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/domain_page: implement pure per-vCPU
 mapping infrastructure
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
Cc: "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDQ6MDI6MzhQTSArMDAwMCwgWGlhLCBIb25neWFuIHdy
b3RlOgpbLi4uXQo+ID4gS2VlcCBpbiBtaW5kIHRoYXQgYWNjZXNzaW5nIHRoZSB1bmlvbiB7cHYs
IGh2bX0gYmVmb3JlIGtub3dpbmcgdGhlCj4gPiBleGFjdCB2YXJpYW50IGlzIGRhbmdlcm91cy4K
PiA+IAo+ID4gQmVjYXVzZSBtYXBjYWNoZSBpcyBpbml0aWFsaXNlZCBmb3IgUFYgb25seSwgc28g
aXQgc2hvdWxkIGJlIGZyZWVkCj4gPiBmb3IKPiA+IFBWIG9ubHkuIEkgdGhpbmsgeW91IG5lZWQg
dG8gcHV0IGl0IHRvIHB2X3ZjcHVfZGVzdHJveS4KPiA+IAo+ID4gSWYgeW91IGRvbid0IHdhbnQg
dG8gZG8gdGhhdCBiZWNhdXNlIG9mIGFzeW1tZXRyeSB3aXRoCj4gPiBtYXBjYWNoZV92Y3B1X2lu
aXQsIHlvdSBtYXkgd2FudCB0byBpbnZlbnQgbWFwY2FjaGVfdmNwdV9kZXN0cm95IGZvcgo+ID4g
eW91ciBwdXJwb3NlLgo+IAo+IEFoIHJpZ2h0IHRoaXMgaXMgYSBwcm9ibGVtLiBJIHdhcyB3b3Jr
aW5nIG9uIGEgdHJlZSB3aGVyZSBldmVyeW9uZSBoYXMKPiBhIG1hcGNhY2hlLCB3aGljaCBpcyBu
b3QgdHJ1ZSBmb3IgY3VycmVudCB1cHN0cmVhbSB3aGVuIEkgY2hlcnJ5LQo+IHBpY2tlZC4gV2ls
bCBmaXguCj4gCgpJZiB0aGUgZnV0dXJlIGRpcmVjdGlvbiBpcyBmb3IgYm90aCBodm0gYW5kIHB2
IHRvIGhhdmUgYSBtYXBjYWNoZSAoPykKdGhlbiBJIHdvdWxkIGNlcnRhaW5seSByZWNvbW1lbmQg
aW52ZW50aW5nIGEgbWFwY2FjaGVfdmNwdV9kZXN0cm95LgoKV2VpLgoKPiBIb25neWFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
