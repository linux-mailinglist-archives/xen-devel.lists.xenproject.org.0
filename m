Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64149C8B7F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 16:42:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFflo-0001F8-Ir; Wed, 02 Oct 2019 14:38:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFfln-0001F3-AJ
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 14:38:23 +0000
X-Inumbo-ID: 48776fec-e522-11e9-9718-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 48776fec-e522-11e9-9718-12813bfff9fa;
 Wed, 02 Oct 2019 14:38:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95B1428;
 Wed,  2 Oct 2019 07:38:21 -0700 (PDT)
Received: from [10.37.10.48] (unknown [10.37.10.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CAB73F706;
 Wed,  2 Oct 2019 07:38:18 -0700 (PDT)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20191002072745.24919-1-jgross@suse.com>
 <20191002072745.24919-2-jgross@suse.com>
 <68ab9788-a61e-bffc-3fdb-ddc82450dfdd@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f72547a9-e2a1-8385-1e67-6d57efd3ba20@arm.com>
Date: Wed, 2 Oct 2019 15:38:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <68ab9788-a61e-bffc-3fdb-ddc82450dfdd@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 01/20] xen/sched: add code to sync
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDEwLzIvMTkgMjo1NiBQTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBP
biAwMi4xMC4xOSAwOToyNywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gV2hlbiBzd2l0Y2hpbmcg
c2NoZWQgdW5pdHMgc3luY2hyb25pemUgYWxsIHZjcHVzIG9mIHRoZSBuZXcgdW5pdCB0byBiZQo+
PiBzY2hlZHVsZWQgYXQgdGhlIHNhbWUgdGltZS4KPj4KPj4gQSB2YXJpYWJsZSBzY2hlZF9ncmFu
dWxhcml0eSBpcyBhZGRlZCB3aGljaCBob2xkcyB0aGUgbnVtYmVyIG9mIHZjcHVzCj4+IHBlciBz
Y2hlZHVsZSB1bml0Lgo+Pgo+PiBBcyB0YXNrbGV0cyByZXF1aXJlIHRvIHNjaGVkdWxlIHRoZSBp
ZGxlIHVuaXQgaXQgaXMgcmVxdWlyZWQgdG8gc2V0IHRoZQo+PiB0YXNrbGV0X3dvcmtfc2NoZWR1
bGVkIHBhcmFtZXRlciBvZiBkb19zY2hlZHVsZSgpIHRvIHRydWUgaWYgYW55IGNwdQo+PiBjb3Zl
cmVkIGJ5IHRoZSBjdXJyZW50IHNjaGVkdWxlKCkgY2FsbCBoYXMgYW55IHBlbmRpbmcgdGFza2xl
dCB3b3JrLgo+Pgo+PiBGb3Igam9pbmluZyBvdGhlciB2Y3B1cyBvZiB0aGUgc2NoZWR1bGUgdW5p
dCB3ZSBuZWVkIHRvIGFkZCBhIG5ldwo+PiBzb2Z0aXJxIFNDSEVEX1NMQVZFX1NPRlRJUlEgaW4g
b3JkZXIgdG8gaGF2ZSBhIHdheSB0byBpbml0aWF0ZSBhCj4+IGNvbnRleHQgc3dpdGNoIHdpdGhv
dXQgY2FsbGluZyB0aGUgZ2VuZXJpYyBzY2hlZHVsZSgpIGZ1bmN0aW9uCj4+IHNlbGVjdGluZyB0
aGUgdmNwdSB0byBzd2l0Y2ggdG8sIGFzIHdlIGFscmVhZHkga25vdyB3aGljaCB2Y3B1IHdlCj4+
IHdhbnQgdG8gcnVuLiBUaGlzIGhhcyB0aGUgb3RoZXIgYWR2YW50YWdlIG5vdCB0byBsb29zZSBh
bnkgb3RoZXIKPj4gY29uY3VycmVudCBTQ0hFRFVMRV9TT0ZUSVJRIGV2ZW50cy4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiBSZXZpZXdlZC1i
eTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KPj4gQWNrZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBKdWxpZW4gZ2F2ZSBpcyBBY2tlZC1ieSB2
aWEgSVJDLgoKRkFPRCwgdGhpcyBpcyBhc3N1bWluZyBwYXRjaCAjOCBpcyBnb2luZyB0byBiZSBm
aXhlZCB0byBwcmV2ZW50IGEgbGF0ZW50IApidWcgd2hlbiBjb250ZXh0X3N3aXRjaCgpIGlzIHJl
dHVybmluZyAoc3VjaCBhcyBvbiBBcm0pLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
