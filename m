Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DF8C48A6
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 09:37:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFZAN-00049Y-GT; Wed, 02 Oct 2019 07:35:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFZAL-00049T-EJ
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 07:35:17 +0000
X-Inumbo-ID: 2d9a7db2-e4e7-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 2d9a7db2-e4e7-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 07:35:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1D3C2AF3E;
 Wed,  2 Oct 2019 07:35:16 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9cfa35b6-697c-5be1-f846-0bb8288a8708@suse.com>
Message-ID: <8176930a-a532-84aa-4e6c-921837f26956@suse.com>
Date: Wed, 2 Oct 2019 09:34:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9cfa35b6-697c-5be1-f846-0bb8288a8708@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/2] tools/xen-cpuid: avoid producing bogus
 output
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSB3YXMgKG1pc3Rha2VubHksIGFzIC0gbG9va2luZyBhdCB0aGUgY29kZSAtIGl0J3MgY2xlYXJs
eSBub3QgaW50ZW5kZWQKdG8gd29yaykgcGFzc2luZyB0aGUgdG9vbCAiUmF3IiBhbmQgIkhvc3Qi
IGFzIGNvbW1hbmQgbGluZSBhcmd1bWVudHMuCkF2b2lkIHByaW50aW5nIGp1c3QgIlJhdyAgICAg
ICAiIHdpdGggbm90IGV2ZW4gYSBuZXdsaW5lIGF0IHRoZSBlbmQgaW4Kc3VjaCBhIGNhc2UuIElu
c3RlYWQgcmVwb3J0IHdoYXQgd2Fzbid0IHVuZGVyc3Rvb2QgYnkgdGhlIHBhcnNpbmcgbG9naWMu
CgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS90
b29scy9taXNjL3hlbi1jcHVpZC5jCisrKyBiL3Rvb2xzL21pc2MveGVuLWNwdWlkLmMKQEAgLTUz
MCw2ICs1MzAsMTUgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogICAgICAgICAg
ICAgICAgIGJyZWFrOwogICAgICAgICAgICAgfQogCisgICAgICAgICAgICBpZiAoICFpICkKKyAg
ICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIiclcycgdW5yZWNv
Z25pemVkIC0gc2tpcHBpbmdcbiIsIHB0cik7CisgICAgICAgICAgICAgICAgY29udGludWU7Cisg
ICAgICAgICAgICB9CisKKyAgICAgICAgICAgIGlmICggKnB0ciApCisgICAgICAgICAgICAgICAg
ZnByaW50ZihzdGRlcnIsICInJXMnIHVucmVjb2duaXplZCAtIGlnbm9yaW5nXG4iLCBwdHIpOwor
CiAgICAgICAgICAgICBkZWNvZGVfZmVhdHVyZXNldChmcywgaSwgIlJhdyIsIHRydWUpOwogICAg
ICAgICB9CiAgICAgfQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
