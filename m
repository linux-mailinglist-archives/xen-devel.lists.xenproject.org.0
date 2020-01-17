Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2C4140E39
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 16:47:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isTnZ-0001X8-4d; Fri, 17 Jan 2020 15:44:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1isTnX-0001X3-Tb
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 15:44:35 +0000
X-Inumbo-ID: 3d9d5074-3940-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d9d5074-3940-11ea-9fd7-bc764e2007e4;
 Fri, 17 Jan 2020 15:44:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B124AAC22;
 Fri, 17 Jan 2020 15:44:25 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <73dd65c0-188c-7ba0-46b8-339943642c72@suse.com>
Date: Fri, 17 Jan 2020 16:44:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] build: fix dependency file generation with
 ENFORCE_UNIQUE_SYMBOLS=y
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHJlY29yZGVkIGZpbGUsIHVubGVzcyBvdmVycmlkZGVuIGJ5IC1NUSAob3IgLU1UKSBpcyB0
aGF0IHNwZWNpZmllZApieSAtbywgd2hpY2ggZG9lc24ndCBwcm9kdWNlIGNvcnJlY3QgZGVwZW5k
ZW5jaWVzIGFuZCBoZW5jZSB3aWxsIGNhdXNlCmZhaWx1cmUgdG8gcmUtYnVpbGQgd2hlbiBpbmNs
dWRlZCBmaWxlcyBjaGFuZ2UuCgpGaXhlczogODFlY2IzOGI4M2IwICgiYnVpbGQ6IHByb3ZpZGUg
b3B0aW9uIHRvIGRpc2FtYmlndWF0ZSBzeW1ib2wgbmFtZXMiKQpSZXBvcnRlZC1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL1J1bGVzLm1rCisrKyBiL3hlbi9S
dWxlcy5tawpAQCAtMTk1LDcgKzE5NSw3IEBAIFNSQ1BBVEggOj0gJChwYXRzdWJzdCAkKEJBU0VE
SVIpLyUsJSwkKEMKIAogJS5vOiAlLmMgTWFrZWZpbGUKIGlmZXEgKCQoQ09ORklHX0VORk9SQ0Vf
VU5JUVVFX1NZTUJPTFMpLHkpCi0JJChDQykgJChDRkxBR1MpIC1jICQ8IC1vICQoQEQpLy4kKEBG
KS50bXAKKwkkKENDKSAkKENGTEFHUykgLWMgJDwgLW8gJChARCkvLiQoQEYpLnRtcCAtTVEgJEAK
IGlmZXEgKCQoY2xhbmcpLHkpCiAJJChPQkpDT1BZKSAtLXJlZGVmaW5lLXN5bSAkPD0kKFNSQ1BB
VEgpLyQ8ICQoQEQpLy4kKEBGKS50bXAgJEAKIGVsc2UKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
