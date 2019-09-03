Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18A2A67D7
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 13:52:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i57I1-0000gT-1E; Tue, 03 Sep 2019 11:48:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i57Hy-0000gJ-Sy
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 11:47:58 +0000
X-Inumbo-ID: aacc4e41-ce40-11e9-ab8e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aacc4e41-ce40-11e9-ab8e-12813bfff9fa;
 Tue, 03 Sep 2019 11:47:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 89586AF27;
 Tue,  3 Sep 2019 11:47:54 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190828080028.18205-1-jgross@suse.com>
 <20190828080028.18205-2-jgross@suse.com>
 <393f2e3f-d15c-270b-9938-4ebcc251b482@suse.com>
 <f5bd649c-1dc2-080b-df0c-ef06d59da35b@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f373132d-ba9c-45b2-8b2d-d1833f43870c@suse.com>
Date: Tue, 3 Sep 2019 13:47:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f5bd649c-1dc2-080b-df0c-ef06d59da35b@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/4] xen: use common output function in
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

T24gMDMuMDkuMjAxOSAxMjoyMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwMy4wOS4xOSAx
MjowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI4LjA4LjIwMTkgMTA6MDAsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBUb2RheSBkdW1waW5nIHRoZSBkZWJ1Z3RyYWNlIGJ1ZmZlcnMgaXMg
ZG9uZSB2aWEgc2VyY29uX3B1dHMoKSwgd2hpbGUKPj4+IGRpcmVjdCBwcmludGluZyBvZiB0cmFj
ZSBlbnRyaWVzIChhZnRlciB0b2dnbGluZyBvdXRwdXQgdG8gdGhlIGNvbnNvbGUpCj4+PiBpcyB1
c2luZyBzZXJpYWxfcHV0cygpLgo+Pj4KPj4+IFVzZSBzZXJjb25fcHV0cygpIGluIGJvdGggY2Fz
ZXMsIGFzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gYm90aCBpcyBub3QKPj4+IHJlYWxseSBtYWtp
bmcgc2Vuc2UuCj4+Cj4+IE5vIG1hdHRlciB0aGF0IEkgbGlrZSB0aGlzIGNoYW5nZSwgSSdtIG5v
dCBjb252aW5jZWQgaXQncyBjb3JyZWN0Ogo+PiBUaGVyZSBhcmUgdHdvIGRpZmZlcmVuY2VzIGJl
dHdlZW4gdGhlIGZ1bmN0aW9ucywgbmVpdGhlciBvZiB3aGljaAo+PiBJIGNvdWxkIHF1YWxpZnkg
YXMgIm5vdCByZWFsbHkgbWFraW5nIHNlbnNlIjogV2h5IGlzIGl0IG9idmlvdXMKPj4gdGhhdCBp
dCBtYWtlcyBubyBzZW5zZSBmb3IgdGhlIGRlYnVndHJhY2Ugb3V0cHV0IHRvIGJ5cGFzcyBvbmUg
b3IKPj4gYm90aCBvZiBzZXJpYWxfc3RlYWxfZm4oKSBhbmQgcHZfY29uc29sZV9wdXRzKCk/IElm
IHlvdSdyZQo+PiBjb252aW5jZWQgb2YgdGhpcywgcGxlYXNlIHByb3ZpZGUgdGhlICJ3aHkiLXMg
YmVoaW5kIHRoZSBzZW50ZW5jZQo+PiBhYm92ZS4KPiAKPiBPa2F5LCBJJ2xsIHVzZToKPiAKPiBV
c2Ugc2VyY29uX3B1dHMoKSBpbiBib3RoIGNhc2VzLCB0byBiZSBjb25zaXN0ZW50IGJldHdlZW4g
ZHVtcGluZyB0aGUKPiBidWZmZXIgd2hlbiBzd2l0Y2hpbmcgZGVidWd0cmFjZSB0byBjb25zb2xl
IG91dHB1dCBhbmQgd2hlbiBwcmludGluZwo+IGEgZGVidWd0cmFjZSBlbnRyeSBkaXJlY3RseSB0
byBjb25zb2xlLgoKV2VsbCwgdGhpcyBpcyBiZXR0ZXIgYXMgYW4gZXhwbGFuYXRpb24gaW5kZWVk
LCBidXQgaXQgc3RpbGwgZG9lc24ndAptYWtlIGNsZWFyIHdoZXRoZXIgaXQgd2Fzbid0IGluIGZh
Y3Qgd2FudGVkIGZvciB0aGVyZSB0byBiZSBhCmRpZmZlcmVuY2UgaW4gd2hlcmUgb3V0cHV0IGdl
dHMgc2VudC4gSSBtYXkgYmVsaWV2ZSB0aGF0IGJ5cGFzc2luZwpwdl9jb25zb2xlX3B1dHMoKSB3
YXNuJ3QgaW50ZW5kZWQsIGJ1dCB0aGUgc3RlYWwgZnVuY3Rpb24gYnlwYXNzCmhhZCBiZWVuIHRo
ZXJlIGluIDMuMiBhbHJlYWR5LCBzbyBtYXkgd2VsbCBoYXZlIGJlZW4gb24gcHVycG9zZS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
