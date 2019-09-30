Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 135DAC1F4A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:39:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt2w-0002My-0k; Mon, 30 Sep 2019 10:36:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEt2t-0002Jb-SI
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:36:47 +0000
X-Inumbo-ID: 323f8f30-e36e-11e9-96ce-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 323f8f30-e36e-11e9-96ce-12813bfff9fa;
 Mon, 30 Sep 2019 10:36:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6C8C7ACCA;
 Mon, 30 Sep 2019 10:36:43 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190930052135.11257-1-jgross@suse.com>
 <20190930052135.11257-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e8b69bec-d9e2-8803-bc0a-4c3c315f97f2@suse.com>
Date: Mon, 30 Sep 2019 12:36:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930052135.11257-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 01/19] xen/sched: add code to sync
 scheduling of all vcpus of a sched unit
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAwNzoyMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBXaGVuIHN3aXRjaGlu
ZyBzY2hlZCB1bml0cyBzeW5jaHJvbml6ZSBhbGwgdmNwdXMgb2YgdGhlIG5ldyB1bml0IHRvIGJl
Cj4gc2NoZWR1bGVkIGF0IHRoZSBzYW1lIHRpbWUuCj4gCj4gQSB2YXJpYWJsZSBzY2hlZF9ncmFu
dWxhcml0eSBpcyBhZGRlZCB3aGljaCBob2xkcyB0aGUgbnVtYmVyIG9mIHZjcHVzCj4gcGVyIHNj
aGVkdWxlIHVuaXQuCj4gCj4gQXMgdGFza2xldHMgcmVxdWlyZSB0byBzY2hlZHVsZSB0aGUgaWRs
ZSB1bml0IGl0IGlzIHJlcXVpcmVkIHRvIHNldCB0aGUKPiB0YXNrbGV0X3dvcmtfc2NoZWR1bGVk
IHBhcmFtZXRlciBvZiBkb19zY2hlZHVsZSgpIHRvIHRydWUgaWYgYW55IGNwdQo+IGNvdmVyZWQg
YnkgdGhlIGN1cnJlbnQgc2NoZWR1bGUoKSBjYWxsIGhhcyBhbnkgcGVuZGluZyB0YXNrbGV0IHdv
cmsuCj4gCj4gRm9yIGpvaW5pbmcgb3RoZXIgdmNwdXMgb2YgdGhlIHNjaGVkdWxlIHVuaXQgd2Ug
bmVlZCB0byBhZGQgYSBuZXcKPiBzb2Z0aXJxIFNDSEVEX1NMQVZFX1NPRlRJUlEgaW4gb3JkZXIg
dG8gaGF2ZSBhIHdheSB0byBpbml0aWF0ZSBhCj4gY29udGV4dCBzd2l0Y2ggd2l0aG91dCBjYWxs
aW5nIHRoZSBnZW5lcmljIHNjaGVkdWxlKCkgZnVuY3Rpb24KPiBzZWxlY3RpbmcgdGhlIHZjcHUg
dG8gc3dpdGNoIHRvLCBhcyB3ZSBhbHJlYWR5IGtub3cgd2hpY2ggdmNwdSB3ZQo+IHdhbnQgdG8g
cnVuLiBUaGlzIGhhcyB0aGUgb3RoZXIgYWR2YW50YWdlIG5vdCB0byBsb29zZSBhbnkgb3RoZXIK
PiBjb25jdXJyZW50IFNDSEVEVUxFX1NPRlRJUlEgZXZlbnRzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogRGFyaW8gRmFn
Z2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KCng4NiBhbmQgYXBwbGljYWJsZSBjb21tb24gY29k
ZSBwYXJ0cwpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSG93ZXZl
ciwgLi4uCgo+ICtzdGF0aWMgdm9pZCBzY2hlZF9jb250ZXh0X3N3aXRjaChzdHJ1Y3QgdmNwdSAq
dnByZXYsIHN0cnVjdCB2Y3B1ICp2bmV4dCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc190aW1lX3Qgbm93KQo+ICt7Cj4gKyAgICBpZiAoIHVubGlrZWx5KHZwcmV2ID09IHZu
ZXh0KSApCj4gICAgICB7Cj4gLSAgICAgICAgcGNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ss
IGNwdSk7Cj4gICAgICAgICAgVFJBQ0VfNEQoVFJDX1NDSEVEX1NXSVRDSF9JTkZDT05ULAo+IC0g
ICAgICAgICAgICAgICAgIG5leHQtPmRvbWFpbi0+ZG9tYWluX2lkLCBuZXh0LT51bml0X2lkLAo+
IC0gICAgICAgICAgICAgICAgIG5vdyAtIHByZXYtPnN0YXRlX2VudHJ5X3RpbWUsCj4gLSAgICAg
ICAgICAgICAgICAgcHJldi0+bmV4dF90aW1lKTsKPiAtICAgICAgICB0cmFjZV9jb250aW51ZV9y
dW5uaW5nKG5leHQtPnZjcHVfbGlzdCk7Cj4gLSAgICAgICAgcmV0dXJuIGNvbnRpbnVlX3J1bm5p
bmcocHJldi0+dmNwdV9saXN0KTsKPiArICAgICAgICAgICAgICAgICB2bmV4dC0+ZG9tYWluLT5k
b21haW5faWQsIHZuZXh0LT5zY2hlZF91bml0LT51bml0X2lkLAo+ICsgICAgICAgICAgICAgICAg
IG5vdyAtIHZwcmV2LT5ydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lLAo+ICsgICAgICAgICAgICAg
ICAgIHZwcmV2LT5zY2hlZF91bml0LT5uZXh0X3RpbWUpOwo+ICsgICAgICAgIHNjaGVkX2NvbnRl
eHRfc3dpdGNoZWQodnByZXYsIHZuZXh0KTsKPiArICAgICAgICB0cmFjZV9jb250aW51ZV9ydW5u
aW5nKHZuZXh0KTsKPiArICAgICAgICByZXR1cm4gY29udGludWVfcnVubmluZyh2cHJldik7Cj4g
ICAgICB9CgouLi4gSSBkb24ndCByZWNhbGwgaWYgdGhlcmUgd2VyZW4ndCBjb21waWxlciAoY2xh
bmc/KSB2ZXJzaW9ucyBub3QKYWxsb3dpbmcgKG9yIGF0IGxlYXN0IHdhcm5pbmcgYWJvdXQpIHVz
ZSBvZiB0aGlzIGV4dGVuc2lvbi4gSSdtCmhhdmluZyBkaWZmaWN1bHR5IHRoaW5raW5nIG9mIGEg
d2F5IHRvIGZpbmQgYSBwb3NzaWJsZSBleGFtcGxlIHVzZQplbHNld2hlcmUgaW4gb3VyIGNvZGUs
IHByb3ZpbmcgdGhhdCB0aGlzIGlzbid0IHRoZSBmaXJzdCBpbnN0YW5jZS4KSGVuY2UgSSB3b25k
ZXIgd2hldGhlciBpdCB3b3VsZG4ndCBiZSBiZXR0ZXIgdG8gYXZvaWQgdXNlIG9mIHRoZQpleHRl
bnNpb24gaGVyZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
