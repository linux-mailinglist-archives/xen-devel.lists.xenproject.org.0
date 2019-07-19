Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FAF6DBA5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 06:10:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoKA7-00088j-Sa; Fri, 19 Jul 2019 04:06:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M1ZL=VQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hoKA5-00088a-Qs
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 04:06:25 +0000
X-Inumbo-ID: 905ec748-a9da-11e9-89b5-7b7b3d510d9d
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 905ec748-a9da-11e9-89b5-7b7b3d510d9d;
 Fri, 19 Jul 2019 04:06:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B0197AC2E;
 Fri, 19 Jul 2019 04:06:19 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20190718065222.31310-1-jgross@suse.com>
 <20190718065222.31310-2-jgross@suse.com>
 <4e402502-acbc-2718-26d4-cbcf83697c15@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <03892464-7429-c2e0-79fd-2774bcc3ce20@suse.com>
Date: Fri, 19 Jul 2019 06:06:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <4e402502-acbc-2718-26d4-cbcf83697c15@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 1/2] xen/gntdev: replace global limit of
 mapped pages by limit per call
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMTkgMTk6MzYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTgvMDcvMjAxOSAw
Nzo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVG9kYXkgdGhlcmUgaXMgYSBnbG9iYWwgbGlt
aXQgb2YgcGFnZXMgbWFwcGVkIHZpYSAvZGV2L3hlbi9nbnRkZXYgc2V0Cj4+IHRvIDEgbWlsbGlv
biBwYWdlcyBwZXIgZGVmYXVsdC4KPiAKPiBUaGUgWGVuIGRlZmF1bHQgbGltaXQgZXZlbiBmb3Ig
ZG9tMCBpcyAxMDI0IHBhZ2VzICogMTYgZW50cmllcyBwZXIgcGFnZSwKPiB3aGljaCBpcyBmYXIg
bG93ZXIgdGhhbiB0aGlzIGxpbWl0LgoKQWN0dWFsbHkgaXRzIDI1NiBlbnRyaWVzIHBlciBwYWdl
LCBidXQgdGhpcyBpcyBzdGlsbCBsb3dlciB0aGFuIHRoZQpjdXJyZW50IGxpbWl0LgoKPiAKPj4g
VGhlcmUgaXMgbm8gcmVhc29uIHdoeSB0aGF0IGxpbWl0IGlzCj4+IGV4aXN0aW5nLCBhcyB0b3Rh
bCBudW1iZXIgb2YgZm9yZWlnbiBtYXBwaW5ncyBpcyBsaW1pdGVkIGJ5IHRoZQo+IAo+IHMvZm9y
ZWlnbi9ncmFudC8gPwoKQ2FuIGRvLgoKPiAKPj4gaHlwZXJ2aXNvciBhbnl3YXkgYW5kIHByZWZl
cnJpbmcga2VybmVsIG1hcHBpbmdzIG92ZXIgdXNlcnNwYWNlIG9uZXMKPj4gZG9lc24ndCBtYWtl
IHNlbnNlLgo+IAo+IEl0cyBwcm9iYWJseSBhbHNvIHdvcnRoIHN0YXRpbmcgdGhhdCB0aGlzIGEg
cm9vdC1vbmx5IGRldmljZSwgd2hpY2gKPiBmdXJ0aGVyIGJyaW5ncyBpbiB0byBxdWVzdGlvbiB0
aGUgdXNlci9rZXJuZWwgc3BsaXQuCgpZZXMuCgo+IAo+Pgo+PiBBZGRpdGlvbmFsbHkgY2hlY2tp
bmcgb2YgdGhhdCBsaW1pdCBpcyBmcmFnaWxlLCBhcyB0aGUgbnVtYmVyIG9mIHBhZ2VzCj4+IHRv
IG1hcCB2aWEgb25lIGNhbGwgaXMgc3BlY2lmaWVkIGluIGEgMzItYml0IHVuc2lnbmVkIHZhcmlh
YmxlIHdoaWNoCj4+IGlzbid0IHRlc3RlZCB0byBzdGF5IHdpdGhpbiByZWFzb25hYmxlIGxpbWl0
cyAodGhlIG9ubHkgdGVzdCBpcyB0aGUKPj4gdmFsdWUgdG8gYmUgPD0gemVybywgd2hpY2ggYmFz
aWNhbGx5IGV4Y2x1ZGVzIG9ubHkgY2FsbHMgd2l0aG91dCBhbnkKPj4gbWFwcGluZyByZXF1ZXN0
ZWQpLiBTbyB0cnlpbmcgdG8gbWFwIGUuZy4gMHhmZmZmMDAwMCBwYWdlcyB3aGlsZQo+PiBhbHJl
YWR5IG5lYXJseSAxMDAwMDAwIHBhZ2VzIGFyZSBtYXBwZWQgd2lsbCBlZmZlY3RpdmVseSBsb3dl
ciB0aGUKPj4gZ2xvYmFsIG51bWJlciBvZiBtYXBwZWQgcGFnZXMgc3VjaCB0aGF0IGEgcGFyYWxs
ZWwgY2FsbCBtYXBwaW5nIGEKPj4gcmVhc29uYWJsZSBhbW91bnQgb2YgcGFnZXMgY2FuIHN1Y2Nl
ZWQgaW4gc3BpdGUgb2YgdGhlIGdsb2JhbCBsaW1pdAo+PiBiZWluZyB2aW9sYXRlZC4KPj4KPj4g
U28gZHJvcCB0aGUgZ2xvYmFsIGxpbWl0IGFuZCBpbnRyb2R1Y2UgcGVyIGNhbGwgbGltaXQgaW5z
dGVhZC4KPiAKPiBJdHMgcHJvYmFibHkgd29ydGggdGFsa2luZyBhYm91dCB0aGlzIG5ldyBsaW1p
dC7CoCBXaGF0IGlzIGl0IHRyeWluZyB0bwo+IHByb3RlY3Q/CgpPdXQtb2YtYm91bmRzIGFsbG9j
YXRpb25zLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
