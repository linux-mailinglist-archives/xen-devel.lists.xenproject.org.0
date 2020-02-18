Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B3C1629D3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 16:50:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j455u-0000gH-D1; Tue, 18 Feb 2020 15:47:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j455t-0000fs-4o
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 15:47:29 +0000
X-Inumbo-ID: f72ba548-5265-11ea-81b4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f72ba548-5265-11ea-81b4-12813bfff9fa;
 Tue, 18 Feb 2020 15:47:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B8FC3AF79;
 Tue, 18 Feb 2020 15:47:27 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
Message-ID: <c7adfa84-2310-3d1d-a6db-574a10247380@suse.com>
Date: Tue, 18 Feb 2020 16:47:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 4/5] libxl/PCI: pass correct "hotplug" argument
 to libxl__device_pci_setdefault()
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VW5pZm9ybWx5IHBhc3NpbmcgImZhbHNlIiBjYW4ndCBiZSByaWdodCwgYnV0IGhhcyBiZWVuIGJl
bmlnbiBiZWNhdXNlIG9mCnRoZSBmdW5jdGlvbiBub3QgdXNpbmcgdGhpcyBwYXJhbWV0ZXIuCgpT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS90b29s
cy9saWJ4bC9saWJ4bF9wY2kuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9wY2kuYwpAQCAtMTU2
Nyw3ICsxNTY3LDcgQEAgdm9pZCBsaWJ4bF9fZGV2aWNlX3BjaV9hZGQobGlieGxfX2VnYyAqZQog
ICAgICAgICB9CiAgICAgfQogCi0gICAgcmMgPSBsaWJ4bF9fZGV2aWNlX3BjaV9zZXRkZWZhdWx0
KGdjLCBkb21pZCwgcGNpZGV2LCBmYWxzZSk7CisgICAgcmMgPSBsaWJ4bF9fZGV2aWNlX3BjaV9z
ZXRkZWZhdWx0KGdjLCBkb21pZCwgcGNpZGV2LCAhc3RhcnRpbmcpOwogICAgIGlmIChyYykgZ290
byBvdXQ7CiAKICAgICBpZiAocGNpZGV2LT5zZWl6ZSAmJiAhcGNpYmFja19kZXZfaXNfYXNzaWdu
ZWQoZ2MsIHBjaWRldikpIHsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
