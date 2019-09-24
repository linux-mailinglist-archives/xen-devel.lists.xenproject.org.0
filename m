Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C96B4BC933
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 15:53:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClBt-0002xv-5V; Tue, 24 Sep 2019 13:49:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iClBr-0002xq-Qf
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 13:49:15 +0000
X-Inumbo-ID: 184abf28-ded2-11e9-961e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 184abf28-ded2-11e9-961e-12813bfff9fa;
 Tue, 24 Sep 2019 13:49:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D17F6AFF3;
 Tue, 24 Sep 2019 13:49:13 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-44-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e975eb3a-80b2-0689-e92e-451773f84e6f@suse.com>
Date: Tue, 24 Sep 2019 15:49:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-44-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 43/47] xen/sched: support multiple cpus
 per scheduling resource
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtNTksNyAr
NTksNyBAQCBpbnRlZ2VyX3BhcmFtKCJzY2hlZF9yYXRlbGltaXRfdXMiLCBzY2hlZF9yYXRlbGlt
aXRfdXMpOwo+ICBlbnVtIHNjaGVkX2dyYW4gX19yZWFkX21vc3RseSBvcHRfc2NoZWRfZ3JhbnVs
YXJpdHkgPSBTQ0hFRF9HUkFOX2NwdTsKPiAgdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgc2No
ZWRfZ3JhbnVsYXJpdHkgPSAxOwo+ICBib29sIF9fcmVhZF9tb3N0bHkgc2NoZWRfZGlzYWJsZV9z
bXRfc3dpdGNoaW5nOwo+IC1jb25zdCBjcHVtYXNrX3QgKnNjaGVkX3Jlc19tYXNrID0gJmNwdW1h
c2tfYWxsOwo+ICtjcHVtYXNrX3Zhcl90IHNjaGVkX3Jlc19tYXNrOwoKRm9yIGEgbm9uLWF1dG9t
YXRpYyB2YXJpYWJsZSBpdCBtaWdodCBiZSBldmVuIGVhc2llciB0byBoYXZlIGl0CmJlIGNwdW1h
c2tfdD8KCj4gQEAgLTI0MDEsNiArMjQwNyw4IEBAIHN0YXRpYyBpbnQgY3B1X3NjaGVkdWxlX3Vw
KHVuc2lnbmVkIGludCBjcHUpCj4gICAgICAvKiBXZSBzdGFydCB3aXRoIGNwdSBncmFudWxhcml0
eS4gKi8KPiAgICAgIHNkLT5ncmFudWxhcml0eSA9IDE7Cj4gIAo+ICsgICAgY3B1bWFza19zZXRf
Y3B1KGNwdSwgc2NoZWRfcmVzX21hc2spOwoKSSdtIG1pc3NpbmcgdGhlIGNsZWFyaW5nIGNvdW50
ZXJwYXJ0LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
