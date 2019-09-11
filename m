Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 987CDAFFFE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:28:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i84Vb-0002l4-1m; Wed, 11 Sep 2019 15:26:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i84Va-0002kv-3Z
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:26:14 +0000
X-Inumbo-ID: 7d1de1a2-d4a8-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d1de1a2-d4a8-11e9-b76c-bc764e2007e4;
 Wed, 11 Sep 2019 15:26:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BE8BFAEA4;
 Wed, 11 Sep 2019 15:26:12 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
Message-ID: <acba3aac-bcf3-ce8f-1b0f-bd5017007553@suse.com>
Date: Wed, 11 Sep 2019 17:26:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 8/9] x86/CPUID: drop INVPCID dependency on PCID
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UENJRCB2YWxpZGx5IGRlcGVuZHMgb24gTE0sIGFzIGl0IGNhbiBiZSBlbmFibGVkIGluIExvbmcg
TW9kZSBvbmx5LgpJTlZQQ0lELCBvdG9oLCBjYW4gYmUgdXNlZCBub3Qgb25seSB3aXRob3V0IFBD
SUQgZW5hYmxlZCwgYnV0IGFsc28Kb3V0c2lkZSBvZiBMb25nIE1vZGUgYWx0b2dldGhlci4gSW4g
Ym90aCBjYXNlcyBpdHMgZnVuY3Rpb25hbGl0eSBpcwpzaW1wbHkgcmVzdHJpY3RlZCB0byBQQ0lE
IDAsIHdoaWNoIGlzIHNvcnQgb2YgZXhwZWN0ZWQgYXMgbm8gb3RoZXIgUENJRApjYW4gYmUgYWN0
aXZhdGVkIHRoZXJlLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKLS0tIGEveGVuL3Rvb2xzL2dlbi1jcHVpZC5weQorKysgYi94ZW4vdG9vbHMvZ2VuLWNw
dWlkLnB5CkBAIC0yMTgsMTAgKzIxOCw2IEBAIGRlZiBjcnVuY2hfbnVtYmVycyhzdGF0ZSk6CiAg
ICAgICAgICMKICAgICAgICAgIyBTU0U0XzI6IFtQT1BDTlRdCiAKLSAgICAgICAgIyBUaGUgSU5W
UENJRCBpbnN0cnVjdGlvbiBkZXBlbmRzIG9uIFBDSUQgaW5mcmFzdHJ1Y3R1cmUgYmVpbmcKLSAg
ICAgICAgIyBhdmFpbGFibGUuCi0gICAgICAgIFBDSUQ6IFtJTlZQQ0lEXSwKLQogICAgICAgICAj
IFhTQVZFIGlzIGFuIGV4dHJhIHNldCBvZiBpbnN0cnVjdGlvbnMgZm9yIHN0YXRlIG1hbmFnZW1l
bnQsIGJ1dAogICAgICAgICAjIGRvZXNuJ3QgY29uc3RpdHVlIG5ldyBzdGF0ZSBpdHNlbGYuICBT
b21lIG9mIHRoZSBkZXBlbmRlbnQgZmVhdHVyZXMKICAgICAgICAgIyBhcmUgaW5zdHJ1Y3Rpb25z
IGJ1aWx0IG9uIHRvcCBvZiBiYXNlIFhTQVZFLCB3aGlsZSBvdGhlcnMgYXJlIG5ldwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
