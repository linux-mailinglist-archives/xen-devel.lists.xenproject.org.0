Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC80B7A32
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 15:10:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAwAC-00049w-C3; Thu, 19 Sep 2019 13:08:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAwAB-00049M-5w
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 13:07:59 +0000
X-Inumbo-ID: 8003f3ca-dade-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8003f3ca-dade-11e9-b76c-bc764e2007e4;
 Thu, 19 Sep 2019 13:07:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1087DB01D;
 Thu, 19 Sep 2019 13:07:57 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
Date: Thu, 19 Sep 2019 15:08:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v6 0/8] AMD IOMMU: further improvements
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
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG1haW4gZ29hbCBjb250aW51ZXMgdG8gYmUgdG8gcmVkdWNlIHRoZSBodWdlIG1lbW9yeSBv
dmVyaGVhZAp0aGF0IHdlJ3ZlIG5vdGljZWQuIE9uIHRoZSB3YXkgdGhlcmUgYSBudW1iZXIgb2Yg
b3RoZXIgdGhpbmdzIHdlcmUKb25jZSBhZ2FpbiBub3RpY2VkLiBBbGwgcGF0Y2hlcyBoYXZlIG5v
dyBiZWVuIHRlc3RlZCBvbiBhIEZhbTE1CmFuZCBhIEZhbTE3IHN5c3RlbS4KCjAxOiBkb24ndCBi
bGluZGx5IGFsbG9jYXRlIGludGVycnVwdCByZW1hcHBpbmcgdGFibGVzCjAyOiBtYWtlIHBoYW50
b20gZnVuY3Rpb25zIHNoYXJlIGludGVycnVwdCByZW1hcHBpbmcgdGFibGVzCjAzOiB4ODYvUENJ
OiByZWFkIG1heGltdW0gTVNJIHZlY3RvciBjb3VudCBlYXJseQowNDogcmVwbGFjZSBJTlRSRU1B
UF9FTlRSSUVTCjA1OiByZXN0cmljdCBpbnRlcnJ1cHQgcmVtYXBwaW5nIHRhYmxlIHNpemVzCjA2
OiB0aWR5IHN0cnVjdCBpdnJzX21hcHBpbmdzCjA3OiBhbGxvY2F0ZSBvbmUgZGV2aWNlIHRhYmxl
IHBlciBQQ0kgc2VnbWVudAowODogcHJlLWZpbGwgYWxsIERURXMgcmlnaHQgYWZ0ZXIgdGFibGUg
YWxsb2NhdGlvbgoKSmFuCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
