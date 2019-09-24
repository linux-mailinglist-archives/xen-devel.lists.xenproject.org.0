Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F92CBC307
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 09:45:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCfSc-0003Ei-1V; Tue, 24 Sep 2019 07:42:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCfSb-0003Ed-7B
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 07:42:09 +0000
X-Inumbo-ID: ce51fc7a-de9e-11e9-960d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ce51fc7a-de9e-11e9-960d-12813bfff9fa;
 Tue, 24 Sep 2019 07:42:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6C7E9AD07;
 Tue, 24 Sep 2019 07:42:05 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 09:42:02 +0200
Message-Id: <20190924074202.4064-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/sched: don't let XEN_RUNSTATE_UPDATE leak
 into vcpu_runstate_get()
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

dmNwdV9ydW5zdGF0ZV9nZXQoKSBzaG91bGQgbmV2ZXIgcmV0dXJuIGEgc3RhdGUgZW50cnkgdGlt
ZSB3aXRoClhFTl9SVU5TVEFURV9VUERBVEUgc2V0LiBUbyBhdm9pZCB0aGlzIGxldCB1cGRhdGVf
cnVuc3RhdGVfYXJlYSgpCm9wZXJhdGUgb24gYSBsb2NhbCBydW5zdGF0ZSBjb3B5LgoKVGhpcyBw
cm9ibGVtIHdhcyBpbnRyb2R1Y2VkIHdpdGggY29tbWl0IDI1MjljODUwZWE0OGYwMzYgKCJhZGQg
dXBkYXRlCmluZGljYXRvciB0byB2Y3B1X3J1bnN0YXRlX2luZm8iKS4KClNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvZG9tYWlu
LmMgfCAxNyArKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbi5jIGIv
eGVuL2FyY2gveDg2L2RvbWFpbi5jCmluZGV4IGRiZGY2YjFiYzIuLmM0ZWNlYWFiM2YgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYworKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMK
QEAgLTE2MDAsMjEgKzE2MDAsMjQgQEAgYm9vbCB1cGRhdGVfcnVuc3RhdGVfYXJlYShzdHJ1Y3Qg
dmNwdSAqdikKICAgICBib29sIHJjOwogICAgIHN0cnVjdCBndWVzdF9tZW1vcnlfcG9saWN5IHBv
bGljeSA9IHsgLm5lc3RlZF9ndWVzdF9tb2RlID0gZmFsc2UgfTsKICAgICB2b2lkIF9fdXNlciAq
Z3Vlc3RfaGFuZGxlID0gTlVMTDsKKyAgICBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvIHJ1bnN0
YXRlOwogCiAgICAgaWYgKCBndWVzdF9oYW5kbGVfaXNfbnVsbChydW5zdGF0ZV9ndWVzdCh2KSkg
KQogICAgICAgICByZXR1cm4gdHJ1ZTsKIAogICAgIHVwZGF0ZV9ndWVzdF9tZW1vcnlfcG9saWN5
KHYsICZwb2xpY3kpOwogCisgICAgbWVtY3B5KCZydW5zdGF0ZSwgJnYtPnJ1bnN0YXRlLCBzaXpl
b2YocnVuc3RhdGUpKTsKKwogICAgIGlmICggVk1fQVNTSVNUKHYtPmRvbWFpbiwgcnVuc3RhdGVf
dXBkYXRlX2ZsYWcpICkKICAgICB7CiAgICAgICAgIGd1ZXN0X2hhbmRsZSA9IGhhc18zMmJpdF9z
aGluZm8odi0+ZG9tYWluKQogICAgICAgICAgICAgPyAmdi0+cnVuc3RhdGVfZ3Vlc3QuY29tcGF0
LnAtPnN0YXRlX2VudHJ5X3RpbWUgKyAxCiAgICAgICAgICAgICA6ICZ2LT5ydW5zdGF0ZV9ndWVz
dC5uYXRpdmUucC0+c3RhdGVfZW50cnlfdGltZSArIDE7CiAgICAgICAgIGd1ZXN0X2hhbmRsZS0t
OwotICAgICAgICB2LT5ydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lIHw9IFhFTl9SVU5TVEFURV9V
UERBVEU7CisgICAgICAgIHJ1bnN0YXRlLnN0YXRlX2VudHJ5X3RpbWUgfD0gWEVOX1JVTlNUQVRF
X1VQREFURTsKICAgICAgICAgX19yYXdfY29weV90b19ndWVzdChndWVzdF9oYW5kbGUsCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKHZvaWQgKikoJnYtPnJ1bnN0YXRlLnN0YXRlX2VudHJ5
X3RpbWUgKyAxKSAtIDEsIDEpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICh2b2lkICop
KCZydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lICsgMSkgLSAxLCAxKTsKICAgICAgICAgc21wX3dt
YigpOwogICAgIH0KIApAQCAtMTYyMiwyMCArMTYyNSwyMCBAQCBib29sIHVwZGF0ZV9ydW5zdGF0
ZV9hcmVhKHN0cnVjdCB2Y3B1ICp2KQogICAgIHsKICAgICAgICAgc3RydWN0IGNvbXBhdF92Y3B1
X3J1bnN0YXRlX2luZm8gaW5mbzsKIAotICAgICAgICBYTEFUX3ZjcHVfcnVuc3RhdGVfaW5mbygm
aW5mbywgJnYtPnJ1bnN0YXRlKTsKKyAgICAgICAgWExBVF92Y3B1X3J1bnN0YXRlX2luZm8oJmlu
Zm8sICZydW5zdGF0ZSk7CiAgICAgICAgIF9fY29weV90b19ndWVzdCh2LT5ydW5zdGF0ZV9ndWVz
dC5jb21wYXQsICZpbmZvLCAxKTsKICAgICAgICAgcmMgPSB0cnVlOwogICAgIH0KICAgICBlbHNl
Ci0gICAgICAgIHJjID0gX19jb3B5X3RvX2d1ZXN0KHJ1bnN0YXRlX2d1ZXN0KHYpLCAmdi0+cnVu
c3RhdGUsIDEpICE9Ci0gICAgICAgICAgICAgc2l6ZW9mKHYtPnJ1bnN0YXRlKTsKKyAgICAgICAg
cmMgPSBfX2NvcHlfdG9fZ3Vlc3QocnVuc3RhdGVfZ3Vlc3QodiksICZydW5zdGF0ZSwgMSkgIT0K
KyAgICAgICAgICAgICBzaXplb2YocnVuc3RhdGUpOwogCiAgICAgaWYgKCBndWVzdF9oYW5kbGUg
KQogICAgIHsKLSAgICAgICAgdi0+cnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSAmPSB+WEVOX1JV
TlNUQVRFX1VQREFURTsKKyAgICAgICAgcnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSAmPSB+WEVO
X1JVTlNUQVRFX1VQREFURTsKICAgICAgICAgc21wX3dtYigpOwogICAgICAgICBfX3Jhd19jb3B5
X3RvX2d1ZXN0KGd1ZXN0X2hhbmRsZSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9p
ZCAqKSgmdi0+cnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSArIDEpIC0gMSwgMSk7CisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgKHZvaWQgKikoJnJ1bnN0YXRlLnN0YXRlX2VudHJ5X3RpbWUg
KyAxKSAtIDEsIDEpOwogICAgIH0KIAogICAgIHVwZGF0ZV9ndWVzdF9tZW1vcnlfcG9saWN5KHYs
ICZwb2xpY3kpOwotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
