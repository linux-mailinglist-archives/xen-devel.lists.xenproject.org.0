Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB10182B3D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 09:32:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCJCp-0004tp-2m; Thu, 12 Mar 2020 08:28:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FfMj=45=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCJCn-0004te-Uw
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 08:28:37 +0000
X-Inumbo-ID: 76d89564-643b-11ea-b127-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76d89564-643b-11ea-b127-12813bfff9fa;
 Thu, 12 Mar 2020 08:28:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BF02EB1E3;
 Thu, 12 Mar 2020 08:28:34 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Mar 2020 09:28:29 +0100
Message-Id: <20200312082831.22280-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200312082831.22280-1-jgross@suse.com>
References: <20200312082831.22280-1-jgross@suse.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 2/4] xen: don't process rcu callbacks when
 holding a rcu_read_lock()
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29tZSBrZXloYW5kbGVycyBhcmUgY2FsbGluZyBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKSB3
aGlsZSBob2xkaW5nCmEgcmN1X3JlYWRfbG9jaygpLiBUaGlzIGlzIHdyb25nLCBhcyBwcm9jZXNz
X3BlbmRpbmdfc29mdGlycXMoKSBtaWdodAphY3RpdmF0ZSByY3UgY2FsbHMgd2hpY2ggc2hvdWxk
IG5vdCBoYXBwZW4gaW5zaWRlIGEgcmN1X3JlYWRfbG9jaygpLgoKRm9yIHRoYXQgcHVycG9zZSBt
b2RpZnkgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCkgdG8gbm90IGFsbG93IHJjdQpjYWxsYmFj
ayBwcm9jZXNzaW5nIHdoZW4gYSByY3VfcmVhZF9sb2NrKCkgaXMgYmVpbmcgaGVsZC4KClNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tClYzOgotIGFkZCBS
Q1VfU09GVElSUSB0byBpZ25vcmUgaW4gcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzX25vcmN1KCkK
ICAoUm9nZXIgUGF1IE1vbm7DqSkKClY1OgotIGJsb2NrIHJjdSBwcm9jZXNzaW5nIGRlcGVuZGlu
ZyBvbiByY2hfcmVhZF9sb2NrKCkgYmVpbmcgaGVsZCBvciBub3QKICAoSmFuIEJldWxpY2gpCi0t
LQogeGVuL2NvbW1vbi9zb2Z0aXJxLmMgfCAxMiArKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vc29mdGlycS5jIGIveGVuL2NvbW1vbi9zb2Z0aXJxLmMKaW5kZXggYjgzYWQ5NmQ2Yy4uMDBk
Njc2YjYyYyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zb2Z0aXJxLmMKKysrIGIveGVuL2NvbW1v
bi9zb2Z0aXJxLmMKQEAgLTI5LDYgKzI5LDcgQEAgc3RhdGljIHZvaWQgX19kb19zb2Z0aXJxKHVu
c2lnbmVkIGxvbmcgaWdub3JlX21hc2spCiB7CiAgICAgdW5zaWduZWQgaW50IGksIGNwdTsKICAg
ICB1bnNpZ25lZCBsb25nIHBlbmRpbmc7CisgICAgYm9vbCByY3VfYWxsb3dlZCA9ICEoaWdub3Jl
X21hc2sgJiAoMXVsIDw8IFJDVV9TT0ZUSVJRKSk7CiAKICAgICBmb3IgKCA7IDsgKQogICAgIHsK
QEAgLTM4LDcgKzM5LDcgQEAgc3RhdGljIHZvaWQgX19kb19zb2Z0aXJxKHVuc2lnbmVkIGxvbmcg
aWdub3JlX21hc2spCiAgICAgICAgICAqLwogICAgICAgICBjcHUgPSBzbXBfcHJvY2Vzc29yX2lk
KCk7CiAKLSAgICAgICAgaWYgKCByY3VfcGVuZGluZyhjcHUpICkKKyAgICAgICAgaWYgKCByY3Vf
YWxsb3dlZCAmJiByY3VfcGVuZGluZyhjcHUpICkKICAgICAgICAgICAgIHJjdV9jaGVja19jYWxs
YmFja3MoY3B1KTsKIAogICAgICAgICBpZiAoICgocGVuZGluZyA9IChzb2Z0aXJxX3BlbmRpbmco
Y3B1KSAmIH5pZ25vcmVfbWFzaykpID09IDApCkBAIC01Myw5ICs1NCwxNiBAQCBzdGF0aWMgdm9p
ZCBfX2RvX3NvZnRpcnEodW5zaWduZWQgbG9uZyBpZ25vcmVfbWFzaykKIAogdm9pZCBwcm9jZXNz
X3BlbmRpbmdfc29mdGlycXModm9pZCkKIHsKKyAgICB1bnNpZ25lZCBsb25nIGlnbm9yZV9tYXNr
ID0gKDF1bCA8PCBTQ0hFRFVMRV9TT0ZUSVJRKSB8CisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICgxdWwgPDwgU0NIRURfU0xBVkVfU09GVElSUSk7CisKKyAgICAvKiBCbG9jayBSQ1Ug
cHJvY2Vzc2luZyBpbiBjYXNlIG9mIHJjdV9yZWFkX2xvY2soKSBoZWxkLiAqLworICAgIGlmICgg
cHJlZW1wdF9jb3VudCgpICkKKyAgICAgICAgaWdub3JlX21hc2sgfD0gMXVsIDw8IFJDVV9TT0ZU
SVJROworCiAgICAgQVNTRVJUKCFpbl9pcnEoKSAmJiBsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKTsK
ICAgICAvKiBEbyBub3QgZW50ZXIgc2NoZWR1bGVyIGFzIGl0IGNhbiBwcmVlbXB0IHRoZSBjYWxs
aW5nIGNvbnRleHQuICovCi0gICAgX19kb19zb2Z0aXJxKCgxdWwgPDwgU0NIRURVTEVfU09GVElS
USkgfCAoMXVsIDw8IFNDSEVEX1NMQVZFX1NPRlRJUlEpKTsKKyAgICBfX2RvX3NvZnRpcnEoaWdu
b3JlX21hc2spOwogfQogCiB2b2lkIGRvX3NvZnRpcnEodm9pZCkKLS0gCjIuMTYuNAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
