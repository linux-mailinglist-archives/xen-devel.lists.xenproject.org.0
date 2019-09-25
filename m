Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07D5BD8BD
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 09:08:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD1MQ-00081w-AW; Wed, 25 Sep 2019 07:05:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD1MO-000814-KH
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 07:05:12 +0000
X-Inumbo-ID: cdcb0dc2-df62-11e9-962b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id cdcb0dc2-df62-11e9-962b-12813bfff9fa;
 Wed, 25 Sep 2019 07:05:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 17180AE78;
 Wed, 25 Sep 2019 07:05:06 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 09:05:02 +0200
Message-Id: <20190925070503.13850-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190925070503.13850-1-jgross@suse.com>
References: <20190925070503.13850-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 1/2] xen/sched: fix locking in
 a653sched_free_vdata()
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGFyaW5jNjUzIHNjaGVkdWxlcidzIGZyZWVfdmRhdGEoKSBmdW5jdGlvbiBpcyBtaXNzaW5n
IHByb3Blcgpsb2NraW5nOiBhcyBpdCBpcyBtb2RpZnlpbmcgdGhlIHNjaGVkdWxlcidzIHByaXZh
dGUgdmNwdSBsaXN0IGl0IG5lZWRzCnRvIHRha2UgdGhlIHNjaGVkdWxlciBsb2NrIGR1cmluZyB0
aGF0IG9wZXJhdGlvbi4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KLS0tCiB4ZW4vY29tbW9uL3NjaGVkX2FyaW5jNjUzLmMgfCA2ICsrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRf
YXJpbmM2NTMuYyBiL3hlbi9jb21tb24vc2NoZWRfYXJpbmM2NTMuYwppbmRleCA3MmI5ODhlYTVm
Li5kNDdiNzQ3ZWY0IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX2FyaW5jNjUzLmMKKysr
IGIveGVuL2NvbW1vbi9zY2hlZF9hcmluYzY1My5jCkBAIC00NDIsMTYgKzQ0MiwyMiBAQCBhNjUz
c2NoZWRfYWxsb2NfdmRhdGEoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3QgdmNw
dSAqdmMsIHZvaWQgKmRkKQogc3RhdGljIHZvaWQKIGE2NTNzY2hlZF9mcmVlX3ZkYXRhKGNvbnN0
IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgdm9pZCAqcHJpdikKIHsKKyAgICBhNjUzc2NoZWRfcHJp
dl90ICpzY2hlZF9wcml2ID0gU0NIRURfUFJJVihvcHMpOwogICAgIGFyaW5jNjUzX3ZjcHVfdCAq
YXYgPSBwcml2OworICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKICAgICBpZiAoYXYgPT0gTlVM
TCkKICAgICAgICAgcmV0dXJuOwogCisgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkX3ByaXYt
PmxvY2ssIGZsYWdzKTsKKwogICAgIGlmICggIWlzX2lkbGVfdmNwdShhdi0+dmMpICkKICAgICAg
ICAgbGlzdF9kZWwoJmF2LT5saXN0KTsKIAogICAgIHhmcmVlKGF2KTsKICAgICB1cGRhdGVfc2No
ZWR1bGVfdmNwdXMob3BzKTsKKworICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNjaGVkX3By
aXYtPmxvY2ssIGZsYWdzKTsKIH0KIAogLyoqCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
