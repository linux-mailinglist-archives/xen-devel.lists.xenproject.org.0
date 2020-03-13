Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2070B18418B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 08:34:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCeoQ-0007Aw-Rw; Fri, 13 Mar 2020 07:32:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCeoP-0007Ar-GB
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 07:32:53 +0000
X-Inumbo-ID: d8b92118-64fc-11ea-b299-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8b92118-64fc-11ea-b299-12813bfff9fa;
 Fri, 13 Mar 2020 07:32:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5D57CAC24;
 Fri, 13 Mar 2020 07:32:51 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <c50fc4e8-cb96-74a1-de2b-9e83e609db1c@suse.com>
Date: Fri, 13 Mar 2020 08:32:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/2] libfdt: eliminate UB pointer validation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG90aGVyIGRheSwgaW4gdGhlIGNvbnRleHQgb2Ygd2hhdCBpcyBub3cgY2YzOGI0OTI2ZTJi
ICgieG1hbGxvYzoKZ3VhcmQgYWdhaW5zdCBpbnRlZ2VyIG92ZXJmbG93IiksIEFuZHJldyBoYWQg
c3VnZ2VzdGVkIHRvIGxvb2sgaW50bwp1c2luZyBnY2MncyBfX2J1aWx0aW5fKl9vdmVyZmxvdygp
LiBUaGUgZnVuY3Rpb25zIGRvbid0IGxlbmQgdGhlbXNlbHZlcwp0byBiZSB1c2VkIHRoZXJlIHdp
dGggdGhlIGxvZ2ljIGN1cnJlbnRseSBpbiBwbGFjZSAoYWxiZWl0IHdlIG1heSBzdGlsbAp3YW50
IHRvIGNvbnNpZGVyIGFkanVzdG1lbnRzIHRoZXJlKSwgYnV0IEkgdGhlbiB3ZW50IG9uIHRvIHNl
ZSB3aGV0aGVyCndlIGhhdmUgYW55IG90aGVyIG92ZXJmbG93IGNoZWNrcyB3YW50aW5nIGNvbnZl
cnNpb24uIE9uZSB0aGluZyBJCm5vdGljZWQgd2FzIHRoYXQgZm9yIHVuc2lnbmVkIGludGVnZXIg
YXJpdGhtZXRpYyB0aGUgY29tcGlsZXIgbm9ybWFsbHkKZG9lcyBmaW5lIHJlY29nbml6aW5nIHRo
ZSBpbnRlbnQgd2l0aG91dCB1c2luZyB0aGUgYnVpbHRpbnMuIEFuZCB3aGlsZQpJIGRpZG4ndCB0
byBzcG90IGFueSBzaWduZWQgaW50ZWdlciBvdmVyZmxvdyBjaGVja3MgKHdoaWNoIGxpa2VseQp3
b3VsZCBoYXZlIGJlZW4gVUIgYW55d2F5KSwgSSBkaWQgc3BvdCB0d28gaW4gbGliZmR0LiBBZnRl
ciBmaWd1cmluZwpvdXQgd2hlcmUgZXhhY3RseSB0aGF0IGNvZGUgd2FzIHRha2VuIGZyb20sIEkg
c3BvdHRlZCBhIGZpeCBmb3Igb25lIG9mCnRoZSB0d28gaW4gdGhlIHVwc3RyZWFtIHJlcG8sIGFu
ZCBJIHN1Ym1pdHRlZCBhIGZpeCBmb3IgdGhlIG90aGVyIG9uZQp0aGVyZSBmaXJzdC4gSGVyZSBh
cmUgdGhlIGJhY2twb3J0cyB0aGVyZW9mLCBhcyBJIGRvbid0IG15c2VsZiB3YW50IHRvCmdldCBp
bnRvIHRoZSBidXNpbmVzcyBvZiBidW1waW5nIHRoZSBsaWJmZHQgdmVyc2lvbiBpbiBvdXIgcmVw
by4KCjE6IEZpeCB1bmRlZmluZWQgYmVoYXZpb3VyIGluIGZkdF9vZmZzZXRfcHRyKCkKMjogZml4
IHVuZGVmaW5lZCBiZWhhdmlvdXIgaW4gX2ZkdF9zcGxpY2UoKQoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
