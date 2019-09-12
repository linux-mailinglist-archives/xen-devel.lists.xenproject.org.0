Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D60B0EA1
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 14:10:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Nts-0006QZ-Km; Thu, 12 Sep 2019 12:08:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8Ntq-0006QU-8r
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 12:08:34 +0000
X-Inumbo-ID: 0a4bff8e-d556-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a4bff8e-d556-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 12:08:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4A8CEAF6B;
 Thu, 12 Sep 2019 12:08:32 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-22-jgross@suse.com>
 <18ec96a1-b3c3-adbf-4b0e-1fcb7185e046@suse.com>
 <13f2cf63-2b61-07fa-f43d-044c61601bca@suse.com>
 <5aeddfeb-e01f-2cef-59ff-d66bcc067d37@suse.com>
 <3fcb3db8-cda6-a90a-50c3-58f503057bcb@suse.com>
 <e98a0253-4da5-a306-871b-b822cb925cc7@suse.com>
 <7545b694-2f4b-16a3-a902-d7c3ff83ba89@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b6abbe42-cb7e-738e-fe88-57d1b3f3ef3c@suse.com>
Date: Thu, 12 Sep 2019 14:08:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7545b694-2f4b-16a3-a902-d7c3ff83ba89@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 21/48] xen/sched: use sched_resource cpu
 instead smp_processor_id in schedulers
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

T24gMTIuMDkuMjAxOSAxMzo1MywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMi4wOS4xOSAx
Mzo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEyLjA5LjIwMTkgMTM6MTcsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAxMi4wOS4xOSAxMjowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMTIuMDkuMjAxOSAxMTozNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gT2theXks
IEknbGwgcmVuYW1lICJjcHUiIHRvICJteV9jcHUiLgo+Pj4+Cj4+Pj4gV2UndmUgZ290IGEgbnVt
YmVyIG9mIGluc3RhbmNlcyBvZiAidGhpc19jcHUiIGluIHN1Y2ggY2FzZXMgYWxyZWFkeSwKPj4+
PiBidXQgbm8gc2luZ2xlICJteV9jcHUiLiBNYXkgSSBzdWdnZXN0IHRvIHN0aWNrIHRvIHRoaXMg
bmFtaW5nIGhlcmUKPj4+PiBhcyB3ZWxsPwo+Pj4KPj4+IEhtbSwgZG9uJ3QgeW91IHRoaW5rIGFk
ZGluZyBmdXJ0aGVyIG92ZXJsb2FkaW5nIG9mICJ0aGlzX2NwdSIgaXMgYSBiYWQKPj4+IGlkZWE/
Cj4+Cj4+IE5vdCBhdCBhbGwsIG5vLiBBIGZ1bmN0aW9uLWxpa2UgbWFjcm8gYW5kIGEgdmFyaWFi
bGUgb2YgdGhlIHNhbWUKPj4gbmFtZSB3aWxsIGhhcHBpbHkgY29leGlzdC4KPiAKPiBJIGFtIGF3
YXJlIHRoYXQgdGhpcyBpcyB3b3JraW5nIGNvcnJlY3RseS4KPiAKPiBJIGp1c3QgdGhpbmsgc3Vj
aCBvdmVybG9hZGluZyBpc24ndCBoZWxwaW5nIGZvciByZWFkYWJpbGl0eSBhbmQgZWFzZQo+IG9m
IG1vZGlmaWNhdGlvbi4KPiAKPiBJbiB0aGUgZW5kIEknbSBub3QgZmVlbGluZyBzdHJvbmcgaGVy
ZSwgc28gaW4gY2FzZSB0aGVyZSBhcmUgbm8KPiBvYmplY3Rpb25zIEknbGwgZ28gd2l0aCB0aGlz
X2NwdS4KCk9rYXksIHNvIGxldCdzIGNvbnNpZGVyIGFub3RoZXIgYWx0ZXJuYXRpdmU6IGN1cl9j
cHU/IFdoYXQgSQpzaW5jZXJlbHkgZGlzbGlrZSBhcmUgaWRlbnRpZmllcnMgb2YgdGhlIG15Xyog
Zm9ybSwgZm9yIGJlaW5nCmFwcGFyZW50bHkgY29tbW9uIGluIGFic29sdXRlIGJlZ2lubmVyIGV4
YW1wbGVzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
