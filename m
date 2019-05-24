Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B39B299DF
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 16:15:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUAv0-00038j-Gb; Fri, 24 May 2019 14:11:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8EJT=TY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hUAuy-00038e-LR
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 14:11:32 +0000
X-Inumbo-ID: d2d9e41e-7e2d-11e9-8070-2b118b960db4
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2d9e41e-7e2d-11e9-8070-2b118b960db4;
 Fri, 24 May 2019 14:11:29 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 24 May 2019 08:11:28 -0600
Message-Id: <5CE7FB8E0200007800232113@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 24 May 2019 08:11:26 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190524131522.29170-1-jgross@suse.com>
In-Reply-To: <20190524131522.29170-1-jgross@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen/vm_event: fix rc check for
 uninitialized ring
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI0LjA1LjE5IGF0IDE1OjE1LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiBA
QCAtMTcwNSw3ICsxNzA1LDcgQEAgdm9pZCBwMm1fbWVtX3BhZ2luZ19wb3B1bGF0ZShzdHJ1Y3Qg
ZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdmbl9sKQo+ICAKPiAgICAgIC8qIFdlJ3JlIHBhZ2lu
Zy4gVGhlcmUgc2hvdWxkIGJlIGEgcmluZyAqLwo+ICAgICAgaW50IHJjID0gdm1fZXZlbnRfY2xh
aW1fc2xvdChkLCBkLT52bV9ldmVudF9wYWdpbmcpOwo+IC0gICAgaWYgKCByYyA9PSAtRU5PU1lT
ICkKPiArICAgIGlmICggcmMgPT0gLUVPUE5PVFNVUFAgKQoKUGVyaGFwcyB3aGlsZSBjb21taXR0
aW5nIChvciBpZiBhIHYyIHNob3VsZCBiZWNvbWUgbmVjZXNzYXJ5KQp0aGUgbWlzc2luZyBibGFu
ayBsaW5lIGNvdWxkIGJlIGFkZGVkIGhlcmUgYXQgdGhlIHNhbWUgdGltZS4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
