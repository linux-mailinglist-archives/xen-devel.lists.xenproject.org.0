Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D39719318
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 21:53:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOp5N-0007Oa-Ny; Thu, 09 May 2019 19:52:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UEDQ=TJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hOp5M-0007OT-IC
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 19:52:08 +0000
X-Inumbo-ID: ed208468-7293-11e9-9690-63973c213c53
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed208468-7293-11e9-9690-63973c213c53;
 Thu, 09 May 2019 19:52:08 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10A5A20989;
 Thu,  9 May 2019 19:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557431527;
 bh=6rjbtTpfYGihpE84AG/hdjLtQNTh60xGn/3Ayl6XO7Y=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=jJ3NiVIf/ikmRRBmbq4kEXobN/nA365vTSzArrY9urW1E6fCIvQUCXLllAw3So8+n
 etdkSvI/4msqpP0ads17i79jNB2B2tWjFfA1xRKDtu+DFJRxeUFXymN/zQGdBhSsA7
 dJrfpyjzxEPHS7sf2/9mrAodtCfBmsupZPExPVxE=
Date: Thu, 9 May 2019 12:52:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190508161603.21964-2-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1905091252000.25766@sstabellini-ThinkPad-T480s>
References: <20190508161603.21964-1-julien.grall@arm.com>
 <20190508161603.21964-2-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/7] xen/arm: mm: Consolidate setting
 SCTLR_EL2.WXN in a single place
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA4IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gVGhlIGxvZ2ljIHRvIHNl
dCBTQ1RMUl9FTDIuV1hOIGlzIHRoZSBzYW1lIGZvciB0aGUgYm9vdCBDUFUgYW5kCj4gbm9uLWJv
b3QgQ1BVLiBTbyBpbnRyb2R1Y2UgYSBmdW5jdGlvbiB0byBzZXQgdGhlIGJpdCBhbmQgY2xlYXIg
VExCcy4KPiAKPiBUaGlzIG5ldyBmdW5jdGlvbiB3aWxsIGhlbHAgdXMgdG8gZG9jdW1lbnQgYW5k
IHVwZGF0ZSB0aGUgbG9naWMgaW4gYQo+IHNpbmdsZSBwbGFjZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IFJldmlld2VkLWJ5OiBBbmRy
aWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IC0tLQo+ICAgICBDaGFuZ2Vz
IGluIHYyOgo+ICAgICAgICAgLSBGaXggdHlwbyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UKPiAgICAg
ICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5Cj4gLS0tCj4gIHhlbi9hcmNoL2FybS9tbS5j
IHwgMjIgKysrKysrKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21t
LmMgYi94ZW4vYXJjaC9hcm0vbW0uYwo+IGluZGV4IDAxYWUyY2NjYzAuLjkzYWQxMTgxODMgMTAw
NjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL21tLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYwo+
IEBAIC02MDEsNiArNjAxLDE5IEBAIHZvaWQgX19pbml0IHJlbW92ZV9lYXJseV9tYXBwaW5ncyh2
b2lkKQo+ICAgICAgZmx1c2hfeGVuX2RhdGFfdGxiX3JhbmdlX3ZhKEJPT1RfRkRUX1ZJUlRfU1RB
UlQsIEJPT1RfRkRUX1NMT1RfU0laRSk7Cj4gIH0KPiAgCj4gKy8qCj4gKyAqIEFmdGVyIGJvb3Qs
IFhlbiBwYWdlLXRhYmxlcyBzaG91bGQgbm90IGNvbnRhaW4gbWFwcGluZyB0aGF0IGFyZSBib3Ro
Cj4gKyAqIFdyaXRhYmxlIGFuZCBlWGVjdXRhYmxlcy4KPiArICoKPiArICogVGhpcyBzaG91bGQg
YmUgY2FsbGVkIG9uIGVhY2ggQ1BVIHRvIGVuZm9yY2UgdGhlIHBvbGljeS4KPiArICovCj4gK3N0
YXRpYyB2b2lkIHhlbl9wdF9lbmZvcmNlX3dueCh2b2lkKQo+ICt7Cj4gKyAgICBXUklURV9TWVNS
RUczMihSRUFEX1NZU1JFRzMyKFNDVExSX0VMMikgfCBTQ1RMUl9XWE4sIFNDVExSX0VMMik7Cj4g
KyAgICAvKiBGbHVzaCBldmVyeXRoaW5nIGFmdGVyIHNldHRpbmcgV1hOIGJpdC4gKi8KPiArICAg
IGZsdXNoX3hlbl90ZXh0X3RsYl9sb2NhbCgpOwo+ICt9Cj4gKwo+ICBleHRlcm4gdm9pZCBzd2l0
Y2hfdHRicih1aW50NjRfdCB0dGJyKTsKPiAgCj4gIC8qIENsZWFyIGEgdHJhbnNsYXRpb24gdGFi
bGUgYW5kIGNsZWFuICYgaW52YWxpZGF0ZSB0aGUgY2FjaGUgKi8KPiBAQCAtNzAyLDEwICs3MTUs
NyBAQCB2b2lkIF9faW5pdCBzZXR1cF9wYWdldGFibGVzKHVuc2lnbmVkIGxvbmcgYm9vdF9waHlz
X29mZnNldCkKPiAgICAgIGNsZWFyX3RhYmxlKGJvb3Rfc2Vjb25kKTsKPiAgICAgIGNsZWFyX3Rh
YmxlKGJvb3RfdGhpcmQpOwo+ICAKPiAtICAgIC8qIEZyb20gbm93IG9uLCBubyBtYXBwaW5nIG1h
eSBiZSBib3RoIHdyaXRhYmxlIGFuZCBleGVjdXRhYmxlLiAqLwo+IC0gICAgV1JJVEVfU1lTUkVH
MzIoUkVBRF9TWVNSRUczMihTQ1RMUl9FTDIpIHwgU0NUTFJfV1hOLCBTQ1RMUl9FTDIpOwo+IC0g
ICAgLyogRmx1c2ggZXZlcnl0aGluZyBhZnRlciBzZXR0aW5nIFdYTiBiaXQuICovCj4gLSAgICBm
bHVzaF94ZW5fdGV4dF90bGJfbG9jYWwoKTsKPiArICAgIHhlbl9wdF9lbmZvcmNlX3dueCgpOwo+
ICAKPiAgI2lmZGVmIENPTkZJR19BUk1fMzIKPiAgICAgIHBlcl9jcHUoeGVuX3BndGFibGUsIDAp
ID0gY3B1MF9wZ3RhYmxlOwo+IEBAIC03NzcsOSArNzg3LDcgQEAgaW50IGluaXRfc2Vjb25kYXJ5
X3BhZ2V0YWJsZXMoaW50IGNwdSkKPiAgLyogTU1VIHNldHVwIGZvciBzZWNvbmRhcnkgQ1BVUyAo
d2hpY2ggYWxyZWFkeSBoYXZlIHBhZ2luZyBlbmFibGVkKSAqLwo+ICB2b2lkIG1tdV9pbml0X3Nl
Y29uZGFyeV9jcHUodm9pZCkKPiAgewo+IC0gICAgLyogRnJvbSBub3cgb24sIG5vIG1hcHBpbmcg
bWF5IGJlIGJvdGggd3JpdGFibGUgYW5kIGV4ZWN1dGFibGUuICovCj4gLSAgICBXUklURV9TWVNS
RUczMihSRUFEX1NZU1JFRzMyKFNDVExSX0VMMikgfCBTQ1RMUl9XWE4sIFNDVExSX0VMMik7Cj4g
LSAgICBmbHVzaF94ZW5fdGV4dF90bGJfbG9jYWwoKTsKPiArICAgIHhlbl9wdF9lbmZvcmNlX3du
eCgpOwo+ICB9Cj4gIAo+ICAjaWZkZWYgQ09ORklHX0FSTV8zMgo+IC0tIAo+IDIuMTEuMAo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
