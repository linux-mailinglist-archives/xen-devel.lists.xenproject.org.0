Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F7617DDCE
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 11:43:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBFox-0001uU-GQ; Mon, 09 Mar 2020 10:39:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBFow-0001uP-51
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 10:39:38 +0000
X-Inumbo-ID: 45f1ad1c-61f2-11ea-ac01-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45f1ad1c-61f2-11ea-ac01-12813bfff9fa;
 Mon, 09 Mar 2020 10:39:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 42ED3B1F6;
 Mon,  9 Mar 2020 10:39:36 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <a8fc7299-4632-b32a-939d-b2e8354cf296@suse.com>
Date: Mon, 9 Mar 2020 11:39:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 0/5] IOMMU: restrict visibility/scope if
 certain variables
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
eQo1OiBpb21tdV9zbm9vcCBpcyB4ODYtb25seQoKVGhlIHNlcmllcyBjb250ZXh0dWFsbHkgZGVw
ZW5kcyBvbiAiQU1EL0lPTU1VOiB3aXRob3V0IFhULAp4MkFQSUMgbmVlZHMgdG8gYmUgZm9yY2Vk
IGludG8gcGh5c2ljYWwgbW9kZSIKCnYyIGFkZHJlc3NlcyByZXZpZXcgY29tbWVudHMsIGF0IGxl
YXN0IGFzIGZhciBhcyBhZ3JlZW1lbnQgd2FzCnJlYWNoZWQuIFNlZSBpbmRpdmlkdWFsIHBhdGNo
ZXMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
