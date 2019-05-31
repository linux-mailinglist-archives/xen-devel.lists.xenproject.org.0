Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87999313D8
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 19:30:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWlJ9-0005lJ-I4; Fri, 31 May 2019 17:27:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u5H8=T7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hWlJ8-0005lD-LC
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 17:27:10 +0000
X-Inumbo-ID: 5187d97e-83c9-11e9-bbde-9f7e43166785
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5187d97e-83c9-11e9-bbde-9f7e43166785;
 Fri, 31 May 2019 17:27:09 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A78F26D27;
 Fri, 31 May 2019 17:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559323628;
 bh=i8VGRATqrsY0XBscRwYufWlafLhrR5/jQMJNCjpopCg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=rsyk99pj4B/6MFCatKrhMHEQ5PI93Ft/mlTSbNaPmyOuwMFxMZTiaoKZTHrAIBG9j
 mB9G5YhbON/7N1JQZujlTjf1JN8vO97kZ2816sOk+pqEsc+UF9IJl5EHY52eqCwev2
 zKc2dNyRlOuGo76/Nmt19zRmpyDEeYlMq1Jrrj7g=
Date: Fri, 31 May 2019 10:27:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <60e875e1-a0fa-9c3d-0bfc-55ae567d409f@arm.com>
Message-ID: <alpine.DEB.2.21.1905311022220.20498@sstabellini-ThinkPad-T480s>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
 <f78f627c-753f-a162-14a1-b193908f673a@arm.com>
 <5CF0F8BE0200007800233DE3@prv1-mh.provo.novell.com>
 <f8edeb03-b223-e723-0b02-9ca565fe8055@arm.com>
 <5CF0FC080200007800233E50@prv1-mh.provo.novell.com>
 <7ca91b27-1c37-70ab-e367-494603e4464d@arm.com>
 <5CF1026F0200007800233ED8@prv1-mh.provo.novell.com>
 <aa27503b-7fcb-dbf0-1f69-6aae35b6f4c1@arm.com>
 <5CF105FD0200007800233F31@prv1-mh.provo.novell.com>
 <60e875e1-a0fa-9c3d-0bfc-55ae567d409f@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/2] dom_cow is needed for mem-sharing only
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
Cc: lars.kurth@citrix.com, Stefano Stabellini <sstabellini@kernel.org>,
 WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAzMSBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEphbiwKPiAKPiBP
biAzMS8wNS8yMDE5IDExOjQ2LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4gPiA+IE9uIDMxLjA1
LjE5IGF0IDEyOjM0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+ID4gPiBObyBpdCB3
YXMgYSBtb3JlIGdlbmVyaWMgc3RhdGVtZW50IG9uIHRoZSBzdGFuY2UgIkl0IGFscmVhZHkgZXhp
c3RzIGluCj4gPiA+IFhlbiBzbyBpdCBpcyBmaW5lIHRvIHNwcmVhZCB0aGVtIGEgYml0IG1vcmUi
Lgo+ID4gCj4gPiBPaCwgSSBzZWUuIE9mIGNvdXJzZSBJJ20gbWFraW5nIHJlbWFya3Mgd2hlbiB3
aGF0J3MgaW4gdGhlIHRyZWUgaXMKPiA+IGJhZCAoYXMgcGVyIGUuZy4gY29kaW5nIHN0eWxlLCBv
ciBpZiBub3QgbWVudGlvbmVkIHRoZXJlIHRoYW4gaW4gbXkKPiA+IHBlcnNvbmFsIG9waW5pb24p
LiBBcyBhIHJlc3VsdCBJIHRha2Ugbm90ZSBvZiB5b3UgdGhpbmtpbmcgdGhpcyBiZWluZwo+ID4g
YmFkIHByYWN0aWNlLCBhbmQgdGhlIHR3byBvZiB1cyBkaXNhZ3JlZWluZy4gSSdtIGNlcnRhaW5s
eSB3aWxsaW5nIHRvCj4gPiBhZGp1c3Qgbm9uLW9idmlvdXMgY29kZSB0byBhIG1vcmUgb2J2aW91
cyBzaGFwZSBpbiB2YXJpb3VzIGNhc2VzLAo+ID4gYnV0IEkgdGhpbmsgdGhlcmUgbmVlZHMgdG8g
YmUgYSBsaW1pdCBhcyB0byB3aGF0IGxhbmd1YWdlIGZlYXR1cmVzCj4gPiB3ZSBkZWNpZGUgc2hv
dWxkIG5vdCBiZSB1c2VkIGluIHRoZSBjb2RlIGJhc2UuIE92ZXJyaWRpbmcKPiA+IGRlY2xhcmF0
aW9ucyAoYW5kIGluIHNvbWUgY2FzZXMgZXZlbiBkZWZpbml0aW9ucykgYnkgbWFjcm9zIGlzIGEK
PiA+IHVzZWZ1bCB0aGluZyBmb3IgZ2VuZXJhbCByZWFkYWJpbGl0eSBpbiBjZXJ0YWluIGNhc2Vz
IGluIG15IG9waW5pb24sCj4gPiBhbmQgd2hpbGUgaXQncyBub3QgbWFraW5nIG11Y2ggb2YgZGlm
ZmVyZW5jZSBoZXJlIEknZCBzdGlsbCBwcmVmZXIgaWYKPiA+IEkgd2FzIGFsbG93ZWQgdG8gZ2V0
IGF3YXkgd2l0aCB0aGlzLCB1bmxlc3MgYSBtYWpvcml0eSBzdXBwb3J0cwo+ID4geW91ciB2aWV3
LiBJT1cgLSB5b3VyIGNoYW5nZSByZXF1ZXN0IGlzLCBhcyBwZXIgbXkgb3duCj4gPiBwZXJzcGVj
dGl2ZSwgbWFraW5nIHRoZSBjb2RlIGxlc3MgZWFzeSB0byByZWFkLCBldmVuIGlmIG5vdCBieQo+
ID4gbXVjaC4KPiAKPiBMZXQgd2lsbCB3YWl0IHRoZSBvcGluaW9uIGZyb20gdGhlIG90aGVycyBo
ZXJlLgoKTXkgcHJlZmVyZW5jZSBpcyB3aGF0IEFuZHJldyBzdWdnZXN0ZWQ6CgogI2lmZGVmIENP
TkZJR19IQVNfTUVNX1NIQVJJTkcKICBleHRlcm4gc3RydWN0IGRvbWFpbiAqZG9tX2NvdzsKICNl
bHNlCiAgZGVmaW5lIGRvbV9jb3cgTlVMTAogI2VuZGlmCgphbmQgSSBmaW5kIEphbidzIG9yaWdp
bmFsIHZlcnNpb24gaGFyZGVyIHRvIHJlYWQuIEhvd2V2ZXIsIGZvciBjb2RlCnN0eWxlIHJlbGF0
ZWQgdGhpbmdzLCBJIHByZWZlciB0byAic3VnZ2VzdCIgdG8gb3RoZXIgbWFpbnRhaW5lcnMgb25l
IHdheQpvciB0aGUgb3RoZXIsIHJhdGhlciB0aGFuICJyZXF1ZXN0IiBmb3IgYSBjaGFuZ2UuCgpJ
ZiBzb21ldGhpbmcgYm90aGVyIHVzIGVub3VnaCB0byBkbyBzb21ldGhpbmcgYWJvdXQgaXQsIHRo
ZSB3YXkgdG8gZ28gaXMKdG8gc2VuZCBhIHBhdGNoIHRvIENPRElOR19TVFlMRSBzbyB0aGF0IHdl
IGFyZSBhbGwgb24gdGhlIHNhbWUgcGFnZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
