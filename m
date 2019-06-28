Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0DA5A483
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 20:51:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgvuJ-0005Jq-Cp; Fri, 28 Jun 2019 18:47:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kaB/=U3=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1hgvuH-0005Jl-PX
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 18:47:33 +0000
X-Inumbo-ID: 2edf92e6-99d5-11e9-b265-cb09fca2ac2c
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2edf92e6-99d5-11e9-b265-cb09fca2ac2c;
 Fri, 28 Jun 2019 18:47:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0F534AEAF;
 Fri, 28 Jun 2019 18:47:30 +0000 (UTC)
Date: Fri, 28 Jun 2019 20:47:29 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190628184729.GJ2751@dhcp22.suse.cz>
References: <20190620160821.4210-1-jgross@suse.com>
 <20190628151749.GA2880@dhcp22.suse.cz>
 <52a8e6d9-003e-c802-b8ff-327a8c7913a5@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52a8e6d9-003e-c802-b8ff-327a8c7913a5@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] mm: fix regression with deferred struct
 page init
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
Cc: linux-mm@kvack.org, Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpIDI4LTA2LTE5IDE5OjM4OjEzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDI4LjA2
LjE5IDE3OjE3LCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gPiBPbiBUaHUgMjAtMDYtMTkgMTg6MDg6
MjEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPiA+IENvbW1pdCAwZTU2YWNhZTRiNGRkNGE5ICgi
bW06IGluaXRpYWxpemUgTUFYX09SREVSX05SX1BBR0VTIGF0IGEgdGltZQo+ID4gPiBpbnN0ZWFk
IG9mIGRvaW5nIGxhcmdlciBzZWN0aW9ucyIpIGlzIGNhdXNpbmcgYSByZWdyZXNzaW9uIG9uIHNv
bWUKPiA+ID4gc3lzdGVtcyB3aGVuIHRoZSBrZXJuZWwgaXMgYm9vdGVkIGFzIFhlbiBkb20wLgo+
ID4gPiAKPiA+ID4gVGhlIHN5c3RlbSB3aWxsIGp1c3QgaGFuZyBpbiBlYXJseSBib290Lgo+ID4g
PiAKPiA+ID4gUmVhc29uIGlzIGFuIGVuZGxlc3MgbG9vcCBpbiBnZXRfcGFnZV9mcm9tX2ZyZWVs
aXN0KCkgaW4gY2FzZSB0aGUgZmlyc3QKPiA+ID4gem9uZSBsb29rZWQgYXQgaGFzIG5vIGZyZWUg
bWVtb3J5LiBkZWZlcnJlZF9ncm93X3pvbmUoKSBpcyBhbHdheXMKPiA+IAo+ID4gQ291bGQgeW91
IGV4cGxhaW4gaG93IHdlIGVuZGVkIHVwIHdpdGggdGhlIHpvbmUgaGF2aW5nIG5vIG1lbW9yeT8g
SXMKPiA+IHhlbiAic3RlYWxpbmciIG1lbWJsb2NrIG1lbW9yeSB3aXRob3V0IGFkZGluZyBpdCB0
byBtZW1vcnkucmVzZXJ2ZWQ/Cj4gPiBJbiBvdGhlciB3b3JkcywgaG93IGRvIHdlIGVuZCB1cCB3
aXRoIGFuIGVtcHR5IHpvbmUgdGhhdCBoYXMgbm9uIHplcm8KPiA+IGVuZF9wZm4/Cj4gCj4gV2h5
IGRvIHlvdSB0aGluayBYZW4gaXMgc3RlYWxpbmcgdGhlIG1lbW9yeSBpbiBhbiBvZGQgd2F5Pwo+
IAo+IERvZXNuJ3QgZGVmZXJyZWRfaW5pdF9tZW1fcGZuX3JhbmdlX2luX3pvbmUoKSByZXR1cm4g
ZmFsc2Ugd2hlbiBubyBmcmVlCj4gbWVtb3J5IGlzIGZvdW5kPyBTbyBleGFjdGx5IGlmIHRoZSBt
ZW1vcnkgd2FzIGFkZGVkIHRvIG1lbW9yeS5yZXNlcnZlZAo+IHRoYXQgd2lsbCBoYXBwZW4uCgpZ
b3UgYXJlIHJpZ2h0LiBJIG1hbmFnZWQgdG8gY29uZnVzZSBteXNlbGYgYW5kIHRob3VnaHQgdGhh
dCBfX25leHRfbWVtX3JhbmdlCnJldHVybiBpbmRleCB0byBib3RoIG1lbWJsb2NrIHR5cGVzLiBC
dXQgSSBhbSB3cm9uZyBoZXJlIGFuZCBpdCBleGNsdWRlcwp0eXBlX2IgcmVnaW9ucy4gSSBzaG91
bGQgaGF2ZSByZWFkIHRoZSBkb2N1bWVudGF0aW9uLiBNeSBiYWQgYW5kIHNvcnJ5CmZvciB0aGUg
Y29uZnVzaW9uLgotLSAKTWljaGFsIEhvY2tvClNVU0UgTGFicwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
