Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D23AD46B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 10:07:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Ef4-0000lr-EX; Mon, 09 Sep 2019 08:04:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7Ef3-0000lm-5u
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 08:04:33 +0000
X-Inumbo-ID: 7452daeb-d2d8-11e9-ac09-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7452daeb-d2d8-11e9-ac09-12813bfff9fa;
 Mon, 09 Sep 2019 08:04:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 33EE0AECB;
 Mon,  9 Sep 2019 08:04:31 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>
References: <20190909073557.16168-1-jgross@suse.com>
 <20190909073557.16168-5-jgross@suse.com>
 <8872a67c-0927-7a3a-3029-21e666cae858@suse.com>
Message-ID: <1ba88fc4-dc73-7fc1-d390-c7373a6db250@suse.com>
Date: Mon, 9 Sep 2019 10:04:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8872a67c-0927-7a3a-3029-21e666cae858@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 4/5] xen: add per-cpu buffer option to
 debugtrace
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAwOTo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDkuMDkuMjAxOSAw
OTozNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gZGVidWd0cmFjZSBpcyBub3JtYWxseSB3cml0
aW5nIHRyYWNlIGVudHJpZXMgaW50byBhIHNpbmdsZSB0cmFjZQo+PiBidWZmZXIuIFRoZXJlIGFy
ZSBjYXNlcyB3aGVyZSB0aGlzIGlzIG5vdCBvcHRpbWFsLCBlLmcuIHdoZW4gaHVudGluZwo+PiBh
IGJ1ZyB3aGljaCByZXF1aXJlcyB3cml0aW5nIGxvdHMgb2YgdHJhY2UgZW50cmllcyBhbmQgb25l
IGNwdSBpcwo+PiBzdHVjay4gVGhpcyB3aWxsIHJlc3VsdCBpbiBvdGhlciBjcHVzIGZpbGxpbmcg
dGhlIHRyYWNlIGJ1ZmZlciBhbmQKPj4gZmluYWxseSBvdmVyd3JpdGluZyB0aGUgaW50ZXJlc3Rp
bmcgdHJhY2UgZW50cmllcyBvZiB0aGUgaGFuZ2luZyBjcHUuCj4+Cj4+IEluIG9yZGVyIHRvIGJl
IGFibGUgdG8gZGVidWcgc3VjaCBzaXR1YXRpb25zIGFkZCB0aGUgY2FwYWJpbGl0eSB0byB1c2UK
Pj4gcGVyLWNwdSB0cmFjZSBidWZmZXJzLiBUaGlzIGNhbiBiZSBzZWxlY3RlZCBieSBzcGVjaWZ5
aW5nIHRoZQo+PiBkZWJ1Z3RyYWNlIGJvb3QgcGFyYW1ldGVyIHdpdGggdGhlIG1vZGlmaWVyICJj
cHU6IiwgbGlrZToKPj4KPj4gICBkZWJ1Z3RyYWNlPWNwdToxNgo+Pgo+PiBBdCB0aGUgc2FtZSB0
aW1lIHN3aXRjaCB0aGUgcGFyc2luZyBmdW5jdGlvbiB0byBhY2NlcHQgc2l6ZSBtb2RpZmllcnMK
Pj4gKGUuZy4gNE0gb3IgMUcpLgo+Pgo+PiBQcmludGluZyBvdXQgdGhlIHRyYWNlIGVudHJpZXMg
aXMgZG9uZSBmb3IgZWFjaCBidWZmZXIgaW4gb3JkZXIgdG8KPj4gbWluaW1pemUgdGhlIGVmZm9y
dCBuZWVkZWQgZHVyaW5nIHByaW50aW5nLiBBcyBlYWNoIGVudHJ5IGlzIHByZWZpeGVkCj4+IHdp
dGggaXRzIHNlcXVlbmNlIG51bWJlciBzb3J0aW5nIHRoZSBlbnRyaWVzIGNhbiBlYXNpbHkgYmUg
ZG9uZSB3aGVuCj4+IGFuYWx5emluZyB0aGVtLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCk9oLCBubyAtIEkgaGF2ZSB0byB0YWtlIHRoaXMgYmFjay4gTG9v
a2luZyBhdCBwYXRjaCA1IEkgbm90aWNlCnRoYXQgeW91IG5vdyBvbmx5IGV2ZXIgd3JpdGUgbGFz
dF9jcHU7IHlvdSBtdXN0IGhhdmUgbG9zdCBpdHMKY29uc3VtZXIuCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
