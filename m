Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1524C14731
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 11:09:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNZa5-0003fH-22; Mon, 06 May 2019 09:06:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNZa3-0003fC-OP
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 09:06:39 +0000
X-Inumbo-ID: 3eab3b60-6fde-11e9-ae38-cb572e2251f7
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3eab3b60-6fde-11e9-ae38-cb572e2251f7;
 Mon, 06 May 2019 09:06:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 03:06:33 -0600
Message-Id: <5CCFF915020000780022C158@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 03:06:29 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
 <1556916614-21512-3-git-send-email-sstabellini@kernel.org>
In-Reply-To: <1556916614-21512-3-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/3] xen/arm: fix mask calculation in
 init_pdx
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA1LjE5IGF0IDIyOjUwLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAu
Ywo+IEBAIC00ODEsMTAgKzQ4MSwxNSBAQCBzdGF0aWMgcGFkZHJfdCBfX2luaXQgbmV4dF9tb2R1
bGUocGFkZHJfdCBzLCBwYWRkcl90ICplbmQpCj4gIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X3Bk
eCh2b2lkKQo+ICB7Cj4gICAgICBwYWRkcl90IGJhbmtfc3RhcnQsIGJhbmtfc2l6ZSwgYmFua19l
bmQ7Cj4gLQo+IC0gICAgdTY0IG1hc2sgPSBwZHhfaW5pdF9tYXNrKGJvb3RpbmZvLm1lbS5iYW5r
WzBdLnN0YXJ0KTsKPiArICAgIHU2NCBtYXNrOwo+ICAgICAgaW50IGJhbms7Cj4gIAo+ICsgICAg
LyoKPiArICAgICAqIFdlIGFsd2F5cyBtYXAgdGhlIGZpcnN0IDE8PE1BWF9PUkRFUiBvZiBSQU0s
IGhlbmNlLCB0aGV5IGFyZSBsZWZ0CgoiLi4uIHBhZ2VzIG9mIFJBTS4iID8KCj4gKyAgICAgKiB1
bmNvbXByZXNzZWQuCj4gKyAgICAgKi8KPiArICAgIG1hc2sgPSBwZHhfaW5pdF9tYXNrKDFVTEwg
PDwgKE1BWF9PUkRFUiArIFBBR0VfU0hJRlQpKTsKClBBR0VfU0laRSA8PCBNQVhfT1JERVI/CgpJ
IHdvbmRlciB3aGV0aGVyIHBkeF9pbml0X21hc2soKSBpdHNlbGYgd291bGRuJ3QgYmV0dGVyIGFw
cGx5IHRoaXMKKGxvd2VyKSBjYXAuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
