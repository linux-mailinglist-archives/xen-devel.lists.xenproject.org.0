Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E030335DD0
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 15:22:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYVpv-0006zT-Mr; Wed, 05 Jun 2019 13:20:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYVpu-0006zM-9f
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 13:20:14 +0000
X-Inumbo-ID: a64423d3-8794-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a64423d3-8794-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 13:20:12 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 07:20:12 -0600
Message-Id: <5CF7C18902000078002358AF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 07:20:09 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Chao Gao" <chao.gao@intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-8-git-send-email-chao.gao@intel.com>
In-Reply-To: <1558945891-3015-8-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v7 07/10] microcode/intel: Writeback and
 invalidate caches before updating microcode
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 WeiLiu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI3LjA1LjE5IGF0IDEwOjMxLCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBV
cGRhdGluZyBtaWNyb2NvZGUgaXMgbGVzcyBlcnJvciBwcm9uZSB3aGVuIGNhY2hlcyBoYXZlIGJl
ZW4gZmx1c2hlZCBhbmQKPiBkZXBlbmRpbmcgb24gd2hhdCBleGFjdGx5IHRoZSBtaWNyb2NvZGUg
aXMgdXBkYXRpbmcuCgpVcCB0byB0aGUgImFuZCIgSSB1bmRlcnN0YW5kIHRoaXMgc2VudGVuY2Us
IGJ1dCB0aGUgcmVzdCBkb2Vzbid0IHJlYWxseQpzZWVtIHRvIGZpdC4gVGFraW5nIG91dCB0aGUg
Z29vZCBwYXJ0IGl0IHNlZW1zIHRvIG1lIHlvdSdyZSBzYXlpbmcKIlVwZGF0aW5nIG1pY3JvY29k
ZSBpcyBsZXNzIGVycm9yIHByb25lIGRlcGVuZGluZyBvbiB3aGF0IGV4YWN0bHkgdGhlCiBtaWNy
b2NvZGUgaXMgdXBkYXRpbmcsIiB3aGljaCAtIHRvIG1lIGF0IGxlYXN0IC0gZG9lc24ndCBtYWtl
IGEgaG9sZSBsb3QKb2Ygc2Vuc2UuIFNob3VsZCBpdCBwZXJoYXBzIGJlCgoiVXBkYXRpbmcgbWlj
cm9jb2RlLCBkZXBlbmRpbmcgb24gd2hhdCBleGFjdGx5IHRoZSBtaWNyb2NvZGUgaXMKIHVwZGF0
aW5nLCBtYXkgYmUgbGVzcyBlcnJvciBwcm9uZSB3aGVuIGNhY2hlcyBoYXZlIGJlZW4gZmx1c2hl
ZC4iCihUaGUgc2FtZSBjb3VsZCBwZXJoYXBzIGFsc28gYmUgYWNoaWV2ZWQgYnkgcmVwbGFjaW5n
IHRoZSAiYW5kIiBieQphIGNvbW1hLikKCj4gRm9yIGV4YW1wbGUsIHNvbWUKPiBvZiB0aGUgaXNz
dWVzIGFyb3VuZCBjZXJ0YWluIEJyb2Fkd2VsbCBwYXJ0cyBjYW4gYmUgYWRkcmVzc2VkIGJ5IGRv
aW5nIGEKPiBmdWxsIGNhY2hlIGZsdXNoLgo+IAo+IFdpdGggcGFyYWxsZWwgbWljcm9jb2RlIHVw
ZGF0ZSwgdGhlIGNvc3Qgb2YgdGhpcyBwYXRjaCBpcyBoYXJkbHkKPiBub3RpY2FibGUuIEFsdGhv
dWdoIG9ubHkgQkRYIHdpdGggYW4gb2xkIG1pY3JvY29kZSBuZWVkcyB0aGlzIGZpeCwgd2UKPiB3
b3VsZCBsaWtlIHRvIGF2b2lkIGZ1dHVyZSBpc3N1ZXMgaW4gY2FzZSB0aGV5IGNvbWUgYnkgbGF0
ZXIgZHVlIHRvCj4gb3RoZXIgcmVhc29ucy4KCkkgZG91YnQgdGhlICJoYXJkbHkgbm90aWNhYmxl
IiBwYXJ0LCBhbmQgSSdtIHN1cmUgeW91J3JlIGFsc28gYXdhcmUgb2YKdGhlIHBhdGNoIChnb2lu
ZyBvbiB0b3Agb2YgeW91ciBzZXJpZXMpIHRvIG1ha2Ugc2VsZWN0aW5nIGJldHdlZW4Kc2VyaWFs
IG9yIHBhcmFsbGVsIGFwcGxpY2F0aW9uIGEgcnVudGltZSBvcHRpb24uIEJ1dCBJJ20gbm90IGdv
aW5nIHRvCnN0YW5kIGluIHRoZSB3YXkgaWYgZXZlcnlvbmUgZWxzZSB0aGlua3MgdGhpcyBpcyB0
aGUgd2F5IHRvIGdvOyBpdCdzCmp1c3QgdGhhdCBmcm9tIHByZXZpb3VzIGRpc2N1c3Npb25zIEkg
ZGlkbid0IGdldCBzdWNoIGFuIGltcHJlc3Npb24uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
