Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 018BF1478C
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 11:23:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNZmo-0004cr-7i; Mon, 06 May 2019 09:19:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNZml-0004cm-Qy
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 09:19:47 +0000
X-Inumbo-ID: 16963019-6fe0-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 16963019-6fe0-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 09:19:45 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 03:19:43 -0600
Message-Id: <5CCFFC2A020000780022C16A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 03:19:38 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
 <1556916614-21512-2-git-send-email-sstabellini@kernel.org>
In-Reply-To: <1556916614-21512-2-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/3] xen: actually skip the first MAX_ORDER
 bits in pfn_pdx_hole_setup
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA1LjE5IGF0IDIyOjUwLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gRml4IHRoZSBpc3N1ZSBieSBwYXNzaW5nIGorMSBhbmQgaSsxIHRvIGZpbmRfbmV4dF96ZXJv
X2JpdCBhbmQKPiBmaW5kX25leHRfYml0LiBBbHNvIGFkZCBhIGNoZWNrIGZvciBpID49IEJJVFNf
UEVSX0xPTkcgYmVjYXVzZQo+IGZpbmRfeyxuZXh0X316ZXJvX2JpdCgpIG9uIHg4NiBhc3N1bWUg
dGhlaXIgbGFzdCBhcmd1bWVudCB0byBiZSBsZXNzCj4gdGhhbiB0aGVpciBtaWRkbGUgb25lLgoK
SSBoYWQgcG9pbnRlZCBvdXQgeDg2IHNpbmNlIEkga25ldyBpdCBoYXMgdGhpcyBhc3N1bXB0aW9u
LiBOb3cKdGhhdCB5b3UgbWVudGlvbiBpdCBoZXJlLCBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgeW91
J3ZlIGNoZWNrZWQKdGhhdCBBcm0gZG9lc24ndCBtYWtlIHNpbWlsYXIgYXNzdW1wdGlvbnMuIDMy
LWJpdCBBcm0gbG9va3MgdG8KZG8sIHRob3VnaCAod2hpbGUgNjQtYml0IGhhcyBhIGRlZGljYXRl
ZCBpZigpIHRvIGRlYWwgd2l0aCB0aGUKc2l0dWF0aW9uKS4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
