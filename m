Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EAFA65C8
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 11:40:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i55Fv-0005iq-7V; Tue, 03 Sep 2019 09:37:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i55Fu-0005ij-LM
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 09:37:42 +0000
X-Inumbo-ID: 79b0df72-ce2e-11e9-ab8c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79b0df72-ce2e-11e9-ab8c-12813bfff9fa;
 Tue, 03 Sep 2019 09:37:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6BCC9AC10;
 Tue,  3 Sep 2019 09:37:41 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
Message-ID: <2355680d-2052-60a8-fd46-ebf23196a4d6@suse.com>
Date: Tue, 3 Sep 2019 11:37:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 2/8] x86/HVM: ignore guest INVD uses
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG9ubHkgcGxhY2Ugd2UnZCBleHBlY3QgdGhlIGluc24gdG8gYmUgc2Vuc2libHkgdXNlZCBp
cyBpbgoodmlydHVhbGl6YXRpb24gdW5hd2FyZSkgZmlybXdhcmUuCgpTdWdnZXN0ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYzOiBOZXcuCgotLS0gYS94ZW4vYXJj
aC94ODYvaHZtL2VtdWxhdGUuYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYwpAQCAt
MjIxMCwxMSArMjIxMCwxOCBAQCBzdGF0aWMgaW50IGh2bWVtdWxfY2FjaGVfb3AoCiAKICAgICAg
ICAgaHZtZW11bF91bm1hcF9saW5lYXJfYWRkcihtYXBwaW5nLCBhZGRyLCAwLCBodm1lbXVsX2N0
eHQpOwogICAgICAgICAvKiBmYWxsIHRocm91Z2ggKi8KLSAgICBjYXNlIHg4NmVtdWxfaW52ZDoK
ICAgICBjYXNlIHg4NmVtdWxfd2JpbnZkOgogICAgIGNhc2UgeDg2ZW11bF93Ym5vaW52ZDoKICAg
ICAgICAgYWx0ZXJuYXRpdmVfdmNhbGwoaHZtX2Z1bmNzLndiaW52ZF9pbnRlcmNlcHQpOwogICAg
ICAgICBicmVhazsKKworICAgIGNhc2UgeDg2ZW11bF9pbnZkOgorICAgICAgICAvKgorICAgICAg
ICAgKiBEZWxpYmVyYXRlbHkgaWdub3JlZDogV2UgZG9uJ3Qgd2FudCB0byBpc3N1ZSBJTlZELCBh
bmQgaXNzdWluZyBXQklOVkQKKyAgICAgICAgICogd291bGRuJ3QgbWF0Y2ggdGhlIHJlcXVlc3Qu
IEFuZCB0aGUgb25seSBwbGFjZSB3ZSdkIGV4cGVjdCB0aGUgaW5zbgorICAgICAgICAgKiB0byBi
ZSBzZW5zaWJseSB1c2VkIGlzIGluICh2aXJ0dWFsaXphdGlvbiB1bmF3YXJlKSBmaXJtd2FyZS4K
KyAgICAgICAgICovCisgICAgICAgIGJyZWFrOwogICAgIH0KIAogICAgIHJldHVybiBYODZFTVVM
X09LQVk7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
