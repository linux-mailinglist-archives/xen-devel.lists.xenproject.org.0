Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6E634E4C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 19:05:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYCpk-0005dc-Tj; Tue, 04 Jun 2019 17:02:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0KbE=UD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYCpi-0005dQ-Nw
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 17:02:46 +0000
X-Inumbo-ID: 92f869bc-86ea-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 92f869bc-86ea-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 17:02:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D1DEA78;
 Tue,  4 Jun 2019 10:02:45 -0700 (PDT)
Received: from [10.37.8.2] (unknown [10.37.8.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3B5D3F5AF;
 Tue,  4 Jun 2019 10:02:43 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
 <20190603220245.22750-2-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <73f8308e-3744-b501-b8c2-8747fa9fb4a7@arm.com>
Date: Tue, 4 Jun 2019 18:02:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190603220245.22750-2-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/3] xen: actually skip the first
 MAX_ORDER bits in pfn_pdx_hole_setup
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, wei.liu2@citrix.com,
 konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, JBeulich@suse.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMy8xOSAxMTowMiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IHBmbl9wZHhfaG9sZV9zZXR1cCBpcyBtZWFudCB0byBza2lwIHRoZSBmaXJzdCBNQVhfT1JE
RVIgYml0cywgYnV0Cj4gYWN0dWFsbHkgaXQgb25seSBza2lwcyB0aGUgZmlyc3QgTUFYX09SREVS
LTEgYml0cy4gVGhlIGlzc3VlIHdhcwo+IHByb2JhYmx5IGludHJvZHVjZWQgYnkgYmRiNTQzOWMz
ZiAoIng4Nl82NDogRW5zdXJlIGZyYW1lLXRhYmxlCj4gY29tcHJlc3Npb24gbGVhdmVzIE1BWF9P
UkRFUiBhbGlnbmVkIiksIHdoZW4gY2hhbmdpbmcgdG8gbG9vcCB0byBzdGFydAo+IGZyb20gTUFY
X09SREVSLTEgYW4gYWRqdXN0bWVudCBieSAxIHdhcyBuZWVkZWQgaW4gdGhlIGNhbGwgdG8KPiBm
aW5kX25leHRfYml0KCkgYnV0IG5vdCBkb25lLgo+IAo+IEZpeCB0aGUgaXNzdWUgYnkgcGFzc2lu
ZyBqKzEgYW5kIGkrMSB0byBmaW5kX25leHRfemVyb19iaXQgYW5kCj4gZmluZF9uZXh0X2JpdC4g
QWxzbyBhZGQgYSBjaGVjayBmb3IgaSA+PSBCSVRTX1BFUl9MT05HIGJlY2F1c2UKPiBmaW5kX3ss
bmV4dF99emVyb19iaXQoKSBhcmUgZnJlZSB0byBhc3N1bWUgdGhhdCB0aGVpciBsYXN0IGFyZ3Vt
ZW50IGlzCj4gbGVzcyB0aGFuIHRoZWlyIG1pZGRsZSBvbmUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
