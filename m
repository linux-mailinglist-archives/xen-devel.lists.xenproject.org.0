Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DCDA83D4
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 15:36:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5VQJ-0002cc-5h; Wed, 04 Sep 2019 13:34:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5VQH-0002cS-Lh
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 13:34:09 +0000
X-Inumbo-ID: aaad7367-cf18-11e9-abb6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aaad7367-cf18-11e9-abb6-12813bfff9fa;
 Wed, 04 Sep 2019 13:34:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 112D4AC11;
 Wed,  4 Sep 2019 13:34:07 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-6-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7aeb4139-7157-f2d7-faa1-a7b870be9180@suse.com>
Date: Wed, 4 Sep 2019 15:34:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-6-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 05/48] xen/sched: let pick_cpu return a
 scheduler resource
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQtaWYuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCj4g
QEAgLTE4OSw4ICsxODksOCBAQCBzdHJ1Y3Qgc2NoZWR1bGVyIHsKPiAgICAgIHN0cnVjdCB0YXNr
X3NsaWNlICgqZG9fc2NoZWR1bGUpIChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICosIHNfdGltZV90
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2xfdCB0YXNrbGV0
X3dvcmtfc2NoZWR1bGVkKTsKPiAgCj4gLSAgICBpbnQgICAgICAgICAgKCpwaWNrX2NwdSkgICAg
ICAgKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IHNjaGVkX3VuaXQgKik7Cj4gKyAgICBzdHJ1Y3Qgc2NoZWRfcmVz
b3VyY2UgKiAoKnBpY2tfcmVzb3VyY2UpIChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICosCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2NoZWRf
dW5pdCAqKTsKCk5pdDogVGhlcmUgYXJlIHR3byBibGFua3MgdG9vIG11Y2ggaGVyZSwgb25lIGVh
Y2ggYmVmb3JlIHRoZSBvcGVuaW5nCnBhcmVudGhlc2VzLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
