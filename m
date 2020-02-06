Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BF81547E2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 16:22:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izivu-0004i2-Sf; Thu, 06 Feb 2020 15:19:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izivt-0004hw-1k
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 15:19:09 +0000
X-Inumbo-ID: 046cbede-48f4-11ea-b6fe-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 046cbede-48f4-11ea-b6fe-bc764e2007e4;
 Thu, 06 Feb 2020 15:19:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 799C0AB95;
 Thu,  6 Feb 2020 15:19:06 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed08a701-01bd-4cae-0b7f-4872c805470e@suse.com>
Date: Thu, 6 Feb 2020 16:19:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/p2m: p2m_flags_to_type() deals only with
 "unsigned int"
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UFRFIGZsYWdzLCBmb3Igbm93IGF0IGxlYXN0LCBnZXQgc3RvcmVkIGluICJ1bnNpZ25lZCBpbnQi
LiBIZW5jZSB0aGVyZSdzCm5vIG5lZWQgdG8gd2lkZW4gdGhlIHZhbHVlcyB0byAidW5zaWduZWQg
bG9uZyIgYmVmb3JlIHByb2Nlc3NpbmcgdGhlbS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKKysr
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaApAQCAtNzk2LDcgKzc5Niw3IEBAIGV4dGVybiB2
b2lkIGF1ZGl0X3AybShzdHJ1Y3QgZG9tYWluICpkLAogICovCiAKIC8qIEV4dHJhY3QgdGhlIHR5
cGUgZnJvbSB0aGUgUFRFIGZsYWdzIHRoYXQgc3RvcmUgaXQgKi8KLXN0YXRpYyBpbmxpbmUgcDJt
X3R5cGVfdCBwMm1fZmxhZ3NfdG9fdHlwZSh1bnNpZ25lZCBsb25nIGZsYWdzKQorc3RhdGljIGlu
bGluZSBwMm1fdHlwZV90IHAybV9mbGFnc190b190eXBlKHVuc2lnbmVkIGludCBmbGFncykKIHsK
ICAgICAvKiBGb3IgQU1EIElPTU1VcyB3ZSBuZWVkIHRvIHVzZSB0eXBlIDAgZm9yIHBsYWluIFJB
TSwgYnV0IHdlIG5lZWQKICAgICAgKiB0byBtYWtlIHN1cmUgdGhhdCBhbiBlbnRpcmVseSBlbXB0
eSBQVEUgZG9lc24ndCBoYXZlIFJBTSB0eXBlICovCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
