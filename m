Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 623BE14DD1D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 15:47:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixB3v-0002QF-6d; Thu, 30 Jan 2020 14:44:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixB3t-0002QA-KJ
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 14:44:53 +0000
X-Inumbo-ID: 12fde98a-436f-11ea-8a89-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12fde98a-436f-11ea-8a89-12813bfff9fa;
 Thu, 30 Jan 2020 14:44:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 57A5CAD5F;
 Thu, 30 Jan 2020 14:44:52 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fd03b80e-ff1a-f2c7-20db-4604ad4d0b2f@suse.com>
Date: Thu, 30 Jan 2020 15:44:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86: fold linker script pre-processing rules
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUncyBubyBuZWVkIHRvIGhhdmUgdHdpY2UgYWxtb3N0IHRoZSBzYW1lIHJ1bGUuIFNpbXBs
eSBhZGQgdGhlIGV4dHJhCi1ERUZJIHRvIEFGTEFHUyBmb3IgdGhlIEVGSSB2YXJpYW50LCBhbmQg
c3BlY2lmeSBib3RoIHRhcmdldHMgZm9yIHRoZQp0aGVuIHNpbmdsZSBydWxlLgoKU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2
L01ha2VmaWxlCisrKyBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQpAQCAtMjQxLDE1ICsyNDEsMTIg
QEAgJChCQVNFRElSKS9pbmNsdWRlL2dlbmVyYXRlZC9jb25maWcuaDogRgogCWVjaG8gJyNlbmRp
ZicgPj4kQC5uZXcKIAkkKGNhbGwgbW92ZS1pZi1jaGFuZ2VkLCRALm5ldywkQCkKIAoteGVuLmxk
czogeGVuLmxkcy5TCit4ZW4ubGRzIGVmaS5sZHM6IHhlbi5sZHMuUwogCSQoQ0MpIC1QIC1FIC1V
aTM4NiAkKGZpbHRlci1vdXQgLVdhJChjb21tYSklLCQoQUZMQUdTKSkgLW8gJEAgJDwKIAlzZWQg
LWUgJ3MvLipcLmxkc1wubzovJChARik6L2cnIDwuJChARikuZCA+LiQoQEYpLmQubmV3CiAJbXYg
LWYgLiQoQEYpLmQubmV3IC4kKEBGKS5kCiAKLWVmaS5sZHM6IHhlbi5sZHMuUwotCSQoQ0MpIC1Q
IC1FIC1VaTM4NiAtREVGSSAkKGZpbHRlci1vdXQgLVdhJChjb21tYSklLCQoQUZMQUdTKSkgLW8g
JEAgJDwKLQlzZWQgLWUgJ3MvLipcLmxkc1wubzovJChARik6L2cnIDwuJChARikuZCA+LiQoQEYp
LmQubmV3Ci0JbXYgLWYgLiQoQEYpLmQubmV3IC4kKEBGKS5kCitlZmkubGRzOiBBRkxBR1MgKz0g
LURFRkkKIAogYm9vdC9ta2VsZjMyOiBib290L21rZWxmMzIuYwogCSQoSE9TVENDKSAkKEhPU1RD
RkxBR1MpIC1vICRAICQ8CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
