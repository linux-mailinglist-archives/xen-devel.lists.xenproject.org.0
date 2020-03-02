Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A4E1760A3
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 18:02:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8oPY-0001cd-BM; Mon, 02 Mar 2020 16:59:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xlOq=4T=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j8oPW-0001cT-QU
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 16:59:18 +0000
X-Inumbo-ID: 26dfafaa-5ca7-11ea-9fb7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26dfafaa-5ca7-11ea-9fb7-12813bfff9fa;
 Mon, 02 Mar 2020 16:59:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9101FAE3C;
 Mon,  2 Mar 2020 16:59:16 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9b3423b9-6cf1-1cc3-5011-f383979f12aa@suse.com>
 <96b8db2cab78470bd7cab97b6bbca3049999dfd3.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <26a2f836-9d64-0507-63ec-1aad496dc8ae@suse.com>
Date: Mon, 2 Mar 2020 17:59:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <96b8db2cab78470bd7cab97b6bbca3049999dfd3.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] credit2: avoid NULL deref in
 csched2_res_pick() when tracing
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
Cc: George Dunlap <george.dunlap@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDMuMjAgMTc6NDksIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIE1vbiwgMjAyMC0w
My0wMiBhdCAwOTo1OCArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoZSBpc3N1ZSBoZXJl
IHJlc3VsdHMgZnJvbSBvbmUgb2YgdGhlIGRvd25zaWRlcyBvZiB1c2luZyBnb3RvOiBUaGUKPj4g
ZWFybHkgImdvdG8gb3V0IiBhbmQgImdvdG8gb3V0X3VwIiBpbiB0aGUgZnVuY3Rpb24gdmVyeSBj
bGVhcmx5Cj4+IGJ5cGFzcwo+PiBhbnkgcG9zc2libGUgaW5pdGlhbGl6YXRpb24gb2YgbWluX3Jx
ZCwgeWV0IHRoZSB0cmFjaW5nIGNvZGUgYXQgdGhlCj4+IGVuZAo+PiBvZiB0aGUgZnVuY3Rpb24g
Y29uc3VtZXMgdGhlIHZhbHVlLiBUaGVyZSdzIGV2ZW4gYSBjb21tZW50IHJlZ2FyZGluZwo+PiB0
aGUKPj4gdHJhY2UgcmVjb3JkIG5vdCBiZWluZyBhY2N1cmF0ZSBpbiB0aGlzIGNhc2UuCj4+Cj4+
IENJRDogMTQ2MDQzMgo+PiBGaXhlczogOWM4NGJjMDA0NjUzICgic2NoZWQ6IHJld29yayBjcmVk
aXQyIHJ1bi1xdWV1ZSBhbGxvY2F0aW9uIikKPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+Pgo+IEFja2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dp
b2xpQHN1c2UuY29tPgo+IAo+PiAtLS0KPj4gSXQgdG9vayBtZSBhIGxpdHRsZSB0byBjb252aW5j
ZSBteXNlbGYgdGhhdAo+Pgo+PiAgICAgIG5ld19jcHUgPSBjcHVtYXNrX2N5Y2xlKG1pbl9ycWQt
PnBpY2tfYmlhcywKPj4gY3B1bWFza19zY3JhdGNoX2NwdShjcHUpKTsKPj4gICAgICBtaW5fcnFk
LT5waWNrX2JpYXMgPSBuZXdfY3B1Owo+Pgo+PiBhcmUgc2FmZSwgaS5lLiBtaW5fcnFkIGNhbid0
IGJlIE5VTEwgaGVyZS4gSSB0aGluayB0aG91Z2ggdGhhdCB0aGlzCj4+IGNvdWxkIGRvIHdpdGgg
bWFraW5nIG1vcmUgb2J2aW91cywgYXQgdGhlIHZlcnkgbGVhc3QgYnkgZS5nLgo+Pgo+PiAgICAg
QEAgLTIzNjAsNiArMjM2MCw4IEBACj4+ICAgICAgICAgICAgICAgICAgICAgICAgICB1bml0LT5j
cHVfc29mdF9hZmZpbml0eSk7Cj4+ICAgICAgICAgICAgICBjcHVtYXNrX2FuZChjcHVtYXNrX3Nj
cmF0Y2hfY3B1KGNwdSksCj4+IGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1KSwKPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICZtaW5fc19ycWQtPmFjdGl2ZSk7Cj4+ICAgICArCj4+ICAgICArICAg
ICAgICBCVUdfT04oIW1pbl9ycWQpOwo+PiAgICAgICAgICB9Cj4+ICAgICAgICAgIGVsc2UgaWYg
KCBtaW5fcnFkICkKPj4gICAgICAgICAgewo+Pgo+PiBwb3NzaWJseSBhY2NvbXBhbmllZCBieSBh
IGNvbW1lbnQuIFRob3VnaHRzPwo+Pgo+IFllcywgSSB0aGluayB0aGlzIGlzIGEgZ29vZCBpZGVh
Lgo+IAo+IFBlcnNvbmFsbHksIEknZCBwdXQgdGhlIEJVR19PTigpIG91dHNpZGUgb2YgdGhlICJp
ZiB7fSBlbHNlIGlmIHt9IGVsc2UKPiB7fSIgYmxvY2sgKGkuZS4sIGp1c3QgYWJvdmUgdGhlIGNw
dW1hc2tfY3ljbGUoKS4KCkkgZG9uJ3QgdGhpbmsgc28uCgpPdGhlcndpc2UgdGhlICJlbHNlIGlm
ICggbWluX3JxZCApIiB3b3VsZG4ndCBtYWtlIHNlbnNlLgoKPiAKPiBJIGNhbiBzZW5kIGEgcGF0
Y2ggZm9yIHRoYXQuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
