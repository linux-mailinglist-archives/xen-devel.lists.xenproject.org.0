Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7C312787A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 10:51:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiEub-0002t2-BC; Fri, 20 Dec 2019 09:49:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HR8H=2K=list.ru=valor@srs-us1.protection.inumbo.net>)
 id 1iiEuZ-0002sx-Nq
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 09:49:32 +0000
X-Inumbo-ID: 03e5b468-230e-11ea-931b-12813bfff9fa
Received: from smtp39.i.mail.ru (unknown [94.100.177.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03e5b468-230e-11ea-931b-12813bfff9fa;
 Fri, 20 Dec 2019 09:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru;
 s=mail; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
 bh=eRLlr9CJ9EcnWzK3KtPb6GwcuUJXLh6EjG1tM7xiiro=; 
 b=XPWFy1cYIumcxCkBalo2K55trtTyTGCw5fm/ILy6KE5k7PIL4TbtirEZtD2vNOt5P8XDcIYBPxR7niuqNYpGmc2b0nq8GiyMw2Or71cDtAG4jVg7Y/YwxNTxJmT+sd6k7MEwERa4Texsg+6sNt9gKtupXdLYBZkxtKYxk4wRIwQ=;
Received: by smtp39.i.mail.ru with esmtpa (envelope-from <valor@list.ru>)
 id 1iiEuW-0004OW-86; Fri, 20 Dec 2019 12:49:28 +0300
From: Sergey Kovalev <valor@list.ru>
To: xen-devel@lists.xenproject.org
References: <771dc0cf-3289-0bc4-4938-07144245f2f2@list.ru>
Message-ID: <aea646dc-59a5-f1c6-b23e-b14945bdb595@list.ru>
Date: Fri, 20 Dec 2019 12:49:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <771dc0cf-3289-0bc4-4938-07144245f2f2@list.ru>
Content-Language: en-US
Authentication-Results: smtp39.i.mail.ru; auth=pass smtp.auth=valor@list.ru
 smtp.mailfrom=valor@list.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 0A44E481635329DB0E1AA8A03B392317F65658A2B47C080365079FBEA0264E8B9CD76A7AF439B378F688BCB05C26794D2FF0265C0D61856C3AE36F1BCA0EA496F330DCD85A3793DA7A25E609C45714E7
X-7FA49CB5: 0D63561A33F958A5048ECDE16DDE82849919DBCCD49DF77386DB53B01D1D7C7B8941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C22496146753D02F7CE9A76E601842F6C81A12EF20D2F80756B5F5C318D1F9ECD513A76E601842F6C81A127C277FBC8AE2E8B9D48DF6648EC6D0C3AA81AA40904B5D99449624AB7ADAF37F910319684D6E05D725E5C173C3A84C3C9BE88FFEDFA497A2A8498970AEDF32B6C9A9530EBF72002C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F2AF38021CC9F462D574AF45C6390F7469DAA53EE0834AAEE
X-Mailru-Sender: 9422C5FC7C00AE6974C3817D9F8DFD628EC852DD5B40AF0E076A1BC51F2138F46FA35EADE8FD784D625E4CECE70E6D50FB559BB5D741EB968B87F919F3BCAAF1715EC054F9A9AD9C0DA7A0AF5A3A8387
X-Mras: OK
Subject: Re: [Xen-devel] [XEN PATCH v4] x86/vm_event: add short-circuit for
 breakpoints (aka "fast single step")
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTIuMjAxOSAxODo0NywgU2VyZ2V5IEtvdmFsZXYgd3JvdGU6Cj4gV2hlbiB1c2luZyBE
UkFLVlVGIChvciBhbm90aGVyIHN5c3RlbSB1c2luZyBhbHRwMm0gd2l0aCBzaGFkb3cgcGFnZXMg
c2ltaWxhcgo+IHRvIHdoYXQgaXMgZGVzY3JpYmVkIGluCj4gaHR0cHM6Ly94ZW5wcm9qZWN0Lm9y
Zy8yMDE2LzA0LzEzL3N0ZWFsdGh5LW1vbml0b3Jpbmctd2l0aC14ZW4tYWx0cDJtKSwKPiBhZnRl
ciBhIGJyZWFrcG9pbnQgaXMgaGl0IHRoZSBzeXN0ZW0gc3dpdGNoZXMgdG8gdGhlIGRlZmF1bHQK
PiB1bnJlc3RyaWN0ZWQgYWx0cDJtIHZpZXcgd2l0aCBzaW5nbGVzdGVwIGVuYWJsZWQuIFdoZW4g
dGhlIHNpbmdsZXN0ZXAKPiB0cmFwcyB0byBYZW4gYW5vdGhlciB2bV9ldmVudCBpcyBzZW50IHRv
IHRoZSBtb25pdG9yIGFnZW50LCB3aGljaCB0aGVuCj4gbm9ybWFsbHkgZGlzYWJsZXMgc2luZ2xl
c3RlcHBpbmcgYW5kIHN3aXRjaGVzIHRoZSBhbHRwMm0gdmlldyBiYWNrIHRvCj4gdGhlIHJlc3Ry
aWN0ZWQgdmlldy4KPiAKPiBUaGlzIHBhdGNoIHNob3J0LWNpcmN1aXRpbmcgdGhhdCBsYXN0IHBh
cnQgc28gdGhhdCBpdCBkb2Vzbid0IG5lZWQgdG8gc2VuZCB0aGUKPiB2bV9ldmVudCBvdXQgZm9y
IHRoZSBzaW5nbGVzdGVwIGV2ZW50IGFuZCBzaG91bGQgc3dpdGNoIGJhY2sgdG8gdGhlIHJlc3Ry
aWN0ZWQKPiB2aWV3IGluIFhlbiBhdXRvbWF0aWNhbGx5Lgo+IAo+IFRoaXMgb3B0aW1pemF0aW9u
IGdhaW5zIGFib3V0IDM1JSBzcGVlZC11cC4KPiAKPiBXYXMgdGVzdGVkIG9uIERlYmlhbiBicmFu
Y2ggb2YgWGVuIDQuMTIuIFNlZSBhdDoKPiBodHRwczovL2dpdGh1Yi5jb20vc2t2bC94ZW4vdHJl
ZS9kZWJpYW4va25vcnJpZS80LjEyL2Zhc3Qtc2luZ2xlc3RlcAo+IAo+IFJlYmFzZWQgb24gbWFz
dGVyOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9za3ZsL3hlbi90cmVlL2Zhc3Qtc2luZ2xlc3RlcAo+
IAo+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBLb3ZhbGV2IDx2YWxvckBsaXN0LnJ1PgpBY2tlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tCkkgaGF2ZSBmb3Jnb3R0ZW4g
dG8gY29weSB0aGlzIGZyb20gdjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
