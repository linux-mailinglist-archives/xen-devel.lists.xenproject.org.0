Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7433FC1DD1
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 11:20:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEroh-0007oZ-62; Mon, 30 Sep 2019 09:18:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iErof-0007oR-VX
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 09:18:02 +0000
X-Inumbo-ID: 32e08b0c-e363-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 32e08b0c-e363-11e9-8628-bc764e2007e4;
 Mon, 30 Sep 2019 09:18:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0B350B181;
 Mon, 30 Sep 2019 09:18:00 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1569792271-19856-1-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2a04d106-7419-ca0c-9850-52255d6cf997@suse.com>
Date: Mon, 30 Sep 2019 11:18:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569792271-19856-1-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for Xen 4.13] x86/msi: Don't panic if msix
 capability is missing
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDkuMjAxOSAyMzoyNCwgQ2hhbyBHYW8gd3JvdGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2
L21zaS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21zaS5jCj4gQEAgLTEyNjUsNyArMTI2NSwxMyBA
QCBpbnQgcGNpX21zaV9jb25mX3dyaXRlX2ludGVyY2VwdChzdHJ1Y3QgcGNpX2RldiAqcGRldiwg
dW5zaWduZWQgaW50IHJlZywKPiAgICAgICAgICBwb3MgPSBlbnRyeSA/IGVudHJ5LT5tc2lfYXR0
cmliLnBvcwo+ICAgICAgICAgICAgICAgICAgICAgIDogcGNpX2ZpbmRfY2FwX29mZnNldChzZWcs
IGJ1cywgc2xvdCwgZnVuYywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgUENJX0NBUF9JRF9NU0lYKTsKPiAtICAgICAgICBBU1NFUlQocG9zKTsKPiArICAgICAg
ICBpZiAoIHVubGlrZWx5KCFwb3MpICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIHByaW50
a19vbmNlKFhFTkxPR19XQVJOSU5HCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICIlMDR4OiUw
Mng6JTAyeC4ldSBNU0ktWCBjYXBhYmlsaXR5IGlzIG1pc3NpbmdcbiIsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIHNlZywgYnVzLCBzbG90LCBmdW5jKTsKPiArICAgICAgICAgICAgcmV0dXJu
IC1FQUdBSU47Cj4gKyAgICAgICAgfQoKQmVzaWRlcyBhZ3JlZWluZyB3aXRoIFJvZ2VyJ3MgY29t
bWVudHMsIHdob3NlIGFjY2VzcyBkbyB3ZQppbnRlcmNlcHQgaGVyZSBhdCB0aGUgdGltZSB5b3Ug
b2JzZXJ2ZSB0aGUgb3BlcmF0aW9uIGFib3ZlCnByb2R1Y2luZyBhIHplcm8gInBvcyI/IElmIGl0
J3MgRG9tMCwgdGhlbiBzdXJlbHkgdGhlcmUncyBhIGJ1ZwppbiBEb20wIGRvaW5nIHRoZSBhY2Nl
c3MgaW4gdGhlIGZpcnN0IHBsYWNlIHdoZW4gYSByZXNldCBoYXNuJ3QKY29tcGxldGVkIHlldD8g
SWYgaXQncyBhIERvbVUsIHRoZW4gaXMgdGhlIHJlc2V0IGhhcHBlbmluZwpiZWhpbmQgX2l0c18g
YmFjayBhcyB3ZWxsICh3aGljaCBpcyBub3QgZ29pbmcgdG8gZW5kIHdlbGwpPwoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
