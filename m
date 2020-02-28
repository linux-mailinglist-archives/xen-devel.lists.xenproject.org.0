Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257B617372C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 13:28:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7eh5-0000Gx-Ay; Fri, 28 Feb 2020 12:24:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7eh3-0000Gr-5J
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 12:24:37 +0000
X-Inumbo-ID: 4822ca1e-5a25-11ea-83b0-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4822ca1e-5a25-11ea-83b0-bc764e2007e4;
 Fri, 28 Feb 2020 12:24:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1141CB00D;
 Fri, 28 Feb 2020 12:24:35 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e53b3573-9c9a-734c-df67-6f6da7fd8ef4@suse.com>
Date: Fri, 28 Feb 2020 13:24:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/5] IOMMU: restrict visibility/scope if certain
 variables
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBudW1iZXIgb2YgdGhlIGNvbW1hbmQgbGluZSBjb250cm9sbGVkIHZhcmlhYmxlcyBhcmUgeDg2
LQpvciBldmVuIHg4Ni1IVk0tc3BlY2lmaWMuIERvbid0IGhhdmUgdGhvc2UgdmFyaWFibGVzIGVs
c2V3aGVyZQppbiB0aGUgZmlyc3QgcGxhY2UgKGluIHNvbWUgY2FzZXMgcmVwbGFjZSB0aGVtIGJ5
IGEgI2RlZmluZSksCmFuZCBhcyBhIHJlc3VsdCBhbHNvIGRvbid0IHNpbGVudGx5IGFjY2VwdCBz
dWNoICJpb21tdT0iCnN1Yi1vcHRpb25zIHdoaWNoIGluIGZhY3QgaGF2ZSBubyBlZmZlY3QuCgox
OiBpb21tdV9pbnRyZW1hcCBpcyB4ODYtb25seQoyOiBpb21tdV9pbnRwb3N0IGlzIHg4Ni9IVk0t
b25seQozOiBpb21tdV9pZ2Z4IGlzIHg4Ni1vbmx5CjQ6IGlvbW11X3FpbnZhbCBpcyB4ODYtb25s
eQo1OiBpb21tdV9zbm9vcCBpcyB4ODYvSFZNLW9ubHkKClRoZSBzZXJpZXMgY29udGV4dHVhbGx5
IGRlcGVuZHMgb24gIkFNRC9JT01NVTogd2l0aG91dCBYVCwKeDJBUElDIG5lZWRzIHRvIGJlIGZv
cmNlZCBpbnRvIHBoeXNpY2FsIG1vZGUiCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
