Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2851109A2C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 09:30:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZWA0-0006nX-I7; Tue, 26 Nov 2019 08:25:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EMZS=ZS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZW9z-0006nS-LH
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 08:25:23 +0000
X-Inumbo-ID: 49e4c3c8-1026-11ea-a39c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49e4c3c8-1026-11ea-a39c-12813bfff9fa;
 Tue, 26 Nov 2019 08:25:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A2CAFB4F5;
 Tue, 26 Nov 2019 08:25:21 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <59a11ca9-d0df-f24d-b1df-8b1e02e73e3f@suse.com>
Date: Tue, 26 Nov 2019 09:25:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] EFI: fix "efi=attr=" handling
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDYzM2E0MDk0NzMyMSAoImRvY3M6IEltcHJvdmUgZG9jdW1lbnRhdGlvbiBhbmQgcGFy
c2luZyBmb3IgZWZpPSIpCmZhaWxlZCB0byBob25vciB0aGUgc3RyY21wKCktbGlrZSByZXR1cm4g
dmFsdWUgY29udmVudGlvbiBvZgpjbWRsaW5lX3N0cmNtcCgpLgoKUmVwb3J0ZWQtYnk6IFJvbWFu
IFNoYXBvc2huaWsgPHJvbWFuQHplZGVkYS5jb20+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9jb21tb24vZWZpL2Jvb3QuYworKysgYi94
ZW4vY29tbW9uL2VmaS9ib290LmMKQEAgLTE0MzAsOSArMTQzMCw5IEBAIHN0YXRpYyBpbnQgX19p
bml0IHBhcnNlX2VmaV9wYXJhbShjb25zdAogICAgICAgICB9CiAgICAgICAgIGVsc2UgaWYgKCAo
c3MgLSBzKSA+IDUgJiYgIW1lbWNtcChzLCAiYXR0cj0iLCA1KSApCiAgICAgICAgIHsKLSAgICAg
ICAgICAgIGlmICggY21kbGluZV9zdHJjbXAocyArIDUsICJ1YyIpICkKKyAgICAgICAgICAgIGlm
ICggIWNtZGxpbmVfc3RyY21wKHMgKyA1LCAidWMiKSApCiAgICAgICAgICAgICAgICAgZWZpX21h
cF91YyA9IHRydWU7Ci0gICAgICAgICAgICBlbHNlIGlmICggY21kbGluZV9zdHJjbXAocyArIDUs
ICJubyIpICkKKyAgICAgICAgICAgIGVsc2UgaWYgKCAhY21kbGluZV9zdHJjbXAocyArIDUsICJu
byIpICkKICAgICAgICAgICAgICAgICBlZmlfbWFwX3VjID0gZmFsc2U7CiAgICAgICAgICAgICBl
bHNlCiAgICAgICAgICAgICAgICAgcmMgPSAtRUlOVkFMOwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
