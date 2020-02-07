Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FACD1559DD
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 15:42:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j04n5-0003L1-97; Fri, 07 Feb 2020 14:39:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KURy=33=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j04n3-0003Ku-WD
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 14:39:30 +0000
X-Inumbo-ID: a55b3ef6-49b7-11ea-b185-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a55b3ef6-49b7-11ea-b185-12813bfff9fa;
 Fri, 07 Feb 2020 14:39:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 721CAADD9;
 Fri,  7 Feb 2020 14:39:28 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <3deb0df2-5389-9567-3534-23e2ba57c68e@suse.com>
 <20200207142559.rsgsq56utzlcx4eb@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f405dbb-799c-1acf-1521-bf1d14a4d968@suse.com>
Date: Fri, 7 Feb 2020 15:39:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200207142559.rsgsq56utzlcx4eb@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/MCFG: fix off-by-one in E820 check
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDIuMjAyMCAxNToyNSwgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIEZlYiAwNywgMjAy
MCBhdCAwMjoyNToxN1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQWxzbyBhZGp1c3Qg
dGhlIGNvbW1lbnQgYWhlYWQgb2YgZTgyMF9hbGxfbWFwcGVkKCkgdG8gY2xhcmlmeSB0aGF0IHRo
ZQo+PiByYW5nZSBpcyBub3QgaW5jbHVzaXZlIGF0IGl0cyBlbmQuCj4+Cj4+IFJlcG9ydGVkLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPgoKVGhhbmtzLgoKPj4gLS0tIGEveGVuL2FyY2gveDg2L2U4MjAuYwo+
PiArKysgYi94ZW4vYXJjaC94ODYvZTgyMC5jCj4+IEBAIC0zOCw3ICszOCw3IEBAIHN0cnVjdCBl
ODIwbWFwIGU4MjA7Cj4+ICBzdHJ1Y3QgZTgyMG1hcCBfX2luaXRkYXRhIGU4MjBfcmF3Owo+PiAg
Cj4+ICAvKgo+PiAtICogVGhpcyBmdW5jdGlvbiBjaGVja3MgaWYgdGhlIGVudGlyZSByYW5nZSA8
c3RhcnQsZW5kPiBpcyBtYXBwZWQgd2l0aCB0eXBlLgo+PiArICogVGhpcyBmdW5jdGlvbiBjaGVj
a3MgaWYgdGhlIGVudGlyZSByYW5nZSBbc3RhcnQsZW5kKSBpcyBtYXBwZWQgd2l0aCB0eXBlLgo+
IAo+IFRoZXJlIGlzIGFub3RoZXIgaW5zdGFuY2Ugb2YgPD4gaW5zaWRlIGU4MjBfYWxsX21hcHBl
ZC4gSXQgd291bGQgYmUgZ29vZAo+IGlmIHRoYXQncyBmaXhlZCB0b28uCgpUaGF0IG9uZSBpc24n
dCBtaXNsZWFkaW5nICh0YWxraW5nIGFib3V0IGp1c3QgdGhlIHN0YXJ0IG9mIHRoZQpyZWdpb24p
LCBzbyBJIGxlZnQgaXQgYWxvbmUuIEJ1dCBzaW5jZSB5b3UndmUgYXNrZWQgZm9yIGl0IC0KZml4
ZWQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
