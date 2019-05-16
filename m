Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA0E2072C
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 14:45:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRFig-0001ni-9N; Thu, 16 May 2019 12:42:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRFie-0001nd-Ia
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:42:44 +0000
X-Inumbo-ID: 191d6fde-77d8-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 191d6fde-77d8-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 12:42:43 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 06:42:42 -0600
Message-Id: <5CDD5AC2020000780022FA6A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 06:42:42 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-38-jgross@suse.com>
In-Reply-To: <20190506065644.7415-38-jgross@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC V2 37/45] x86: optimize loading of GDT
 at context switch
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA1LjE5IGF0IDA4OjU2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJbnN0
ZWFkIG9mIGR5bmFtaWNhbGx5IGRlY2lkZSB3aGV0aGVyIHRoZSBwcmV2aW91cyB2Y3B1IHdhcyB1
c2luZyBmdWxsCj4gb3IgZGVmYXVsdCBHRFQganVzdCBhZGQgYSBwZXJjcHUgdmFyaWFibGUgZm9y
IHRoYXQgcHVycG9zZS4gVGhpcyBhdAo+IG9uY2UgcmVtb3ZlcyB0aGUgbmVlZCBmb3IgdGVzdGlu
ZyB2Y3B1X2lkcyB0byBkaWZmZXIgdHdpY2UuCj4gCj4gQ2FjaGUgdGhlIG5lZWRfZnVsbF9nZHQo
bmQpIHZhbHVlIGluIGEgbG9jYWwgdmFyaWFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKVG8gYmUgaG9uZXN0IEknbSBub3QgZW50aXJlbHkg
Y29udmluY2VkIHRoaXMgaXMgYSBnb29kIG1vdmUuIEJ1dApzaW5jZSB5b3UndmUgZG9uZSB0aGUg
d29yaywgYW5kIHNpbmNlIHRoZSBsYXJnZXIgc291cmNlIHNpemUgaXMKaG9wZWZ1bGx5IG91dHdl
aWdoZWQgYnkgc2xpZ2h0bHkgc21hbGxlciBiaW5hcnkgc2l6ZSAocGVyLUNQVQpkYXRhIGFjY2Vz
c2VzIGFyZW4ndCBlbnRpcmVseSBjaGVhcCBlaXRoZXIpLCBJJ20gbm90IGdvaW5nIHRvCm9iamVj
dC4KCj4gQEAgLTE2NTgsNiArMTY2NCw3IEBAIHN0YXRpYyB2b2lkIF9fY29udGV4dF9zd2l0Y2go
dm9pZCkKPiAgICAgIHN0cnVjdCB2Y3B1ICAgICAgICAgICpuID0gY3VycmVudDsKPiAgICAgIHN0
cnVjdCBkb21haW4gICAgICAgICpwZCA9IHAtPmRvbWFpbiwgKm5kID0gbi0+ZG9tYWluOwo+ICAg
ICAgc2VnX2Rlc2NfdCAgICAgICAgICAgKmdkdDsKPiArICAgIGJvb2wgICAgICAgICAgICAgICAg
ICBuZWVkX2Z1bGxfZ2R0X247CgpUaGlzIHZhcmlhYmxlIGlzIHRvbyBsb25nLCBvciBtb3JlIHBy
ZWNpc2VseSBoYXMgdG9vIG1hbnkgdW5kZXJzY29yZXMKZm9yIG15IHRhc3RlLiBTZWVpbmcgdGhh
dCBvbmx5IGEgc2luZ2xlIGludm9jYXRpb24gb2YgbmVlZF9mdWxsX2dkdCgpCnJlbWFpbnMsIEkg
ZG9uJ3QgdGhpbmsganVzdCAiZnVsbF9nZHQiIHdvdWxkIGJlIGFtYmlndW91cyBpbiBhbnkgd2F5
LgpBdCB3aGljaCBwb2ludApSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
