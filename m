Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE32AD4BB
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 10:22:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Eu2-0002FY-B4; Mon, 09 Sep 2019 08:20:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7Eu0-00029m-Kt
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 08:20:00 +0000
X-Inumbo-ID: 9cd8d56d-d2da-11e9-ac09-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cd8d56d-d2da-11e9-ac09-12813bfff9fa;
 Mon, 09 Sep 2019 08:19:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 057B5AFCC;
 Mon,  9 Sep 2019 08:19:59 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190909073557.16168-1-jgross@suse.com>
 <20190909073557.16168-2-jgross@suse.com>
 <eca805d7-34e3-ad25-d444-3c2746a4cf12@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <7ebc3132-2c7e-f804-1b59-75bac1544d12@suse.com>
Date: Mon, 9 Sep 2019 10:19:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eca805d7-34e3-ad25-d444-3c2746a4cf12@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v6 1/5] xen: fix debugtrace clearing
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMTkgMDk6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA5LjIwMTkgMDk6
MzUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29s
ZS5jCj4+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4+IEBAIC0xMTczLDYgKzEx
NzMsNyBAQCBzdGF0aWMgY2hhciAgICAgICAgKmRlYnVndHJhY2VfYnVmOyAvKiBEZWJ1Zy10cmFj
ZSBidWZmZXIgKi8KPj4gICBzdGF0aWMgdW5zaWduZWQgaW50IGRlYnVndHJhY2VfcHJkOyAvKiBQ
cm9kdWNlciBpbmRleCAgICAgKi8KPj4gICBzdGF0aWMgdW5zaWduZWQgaW50IGRlYnVndHJhY2Vf
a2lsb2J5dGVzID0gMTI4LCBkZWJ1Z3RyYWNlX2J5dGVzOwo+PiAgIHN0YXRpYyB1bnNpZ25lZCBp
bnQgZGVidWd0cmFjZV91c2VkOwo+PiArc3RhdGljIGJvb2wgZGVidWd0cmFjZV9idWZfZW1wdHk7
Cj4gCj4gV291bGRuJ3QgaXQgYmUgbW9yZSBsb2dpY2FsIGZvciB0aGlzIHRvIHN0YXJ0IG91dCBh
cyAidHJ1ZSI/CgpJbiB0aGUgZW5kIGl0IGRvZXNuJ3QgbWF0dGVyLCBhcyBsYXN0X2J1ZltdIHdp
bGwgYmUgZW1wdHkgaW5pdGlhbGx5LgpCdXQgSSBjYW4gY2hhbmdlIGl0IHRvIGxldCBpdHMgc2Vt
YW50aWNzIG1hdGNoIHRoZSByZWFsaXR5LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
