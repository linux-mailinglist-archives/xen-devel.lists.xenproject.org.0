Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF9EAB918
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 15:17:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6E4J-0000vc-N8; Fri, 06 Sep 2019 13:14:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hqBu=XB=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i6E4I-0000vN-Tc
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 13:14:26 +0000
X-Inumbo-ID: 4019ce3c-d0a8-11e9-978d-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4019ce3c-d0a8-11e9-978d-bc764e2007e4;
 Fri, 06 Sep 2019 13:14:26 +0000 (UTC)
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp
 [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D837206BB;
 Fri,  6 Sep 2019 13:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567775665;
 bh=dTI/PD6Zp/AXRe7dx+Oz3QClHlFgk/sT4V/cXDhsk68=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kTmx2s+62Y/4eEQFPY035FvyFlUmf88LUNSIVewSZCHATtGSevTrRRVXP+wltKibl
 b9yLGk+TUP3KzvCreKIPMGfToBbt9VZV7BklHS3DfBKoSGwzouEtlf+gOnTPv7y+hu
 W0io4Di/0BRZrRDopawOxAenhii0ZCxjO2iT1PPI=
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Date: Fri,  6 Sep 2019 22:14:20 +0900
Message-Id: <156777566048.25081.6296162369492175325.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <156777561745.25081.1205321122446165328.stgit@devnote2>
References: <156777561745.25081.1205321122446165328.stgit@devnote2>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH -tip v4 4/4] x86: kprobes: Prohibit probing on
 instruction which has emulate prefix
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHJvaGliaXQgcHJvYmluZyBvbiBpbnN0cnVjdGlvbiB3aGljaCBoYXMgWEVOX0VNVUxBVEVfUFJF
RklYCm9yIEtWTSdzIGVtdWxhdGUgcHJlZml4LiBTaW5jZSB0aGF0IHByZWZpeCBpcyBhIG1hcmtl
ciBmb3IgWGVuCmFuZCBLVk0sIGlmIHdlIG1vZGlmeSB0aGUgbWFya2VyIGJ5IGtwcm9iZSdzIGlu
dDMsIHRoYXQgZG9lc24ndAp3b3JrIGFzIGV4cGVjdGVkLgoKU2lnbmVkLW9mZi1ieTogTWFzYW1p
IEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KLS0tCiBhcmNoL3g4Ni9rZXJuZWwva3By
b2Jlcy9jb3JlLmMgfCAgICA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwva3Byb2Jlcy9jb3JlLmMgYi9hcmNoL3g4Ni9r
ZXJuZWwva3Byb2Jlcy9jb3JlLmMKaW5kZXggNDNmYzEzYzgzMWFmLi40ZjEzYWY3Y2JjZGIgMTAw
NjQ0Ci0tLSBhL2FyY2gveDg2L2tlcm5lbC9rcHJvYmVzL2NvcmUuYworKysgYi9hcmNoL3g4Ni9r
ZXJuZWwva3Byb2Jlcy9jb3JlLmMKQEAgLTM1MSw2ICszNTEsMTAgQEAgaW50IF9fY29weV9pbnN0
cnVjdGlvbih1OCAqZGVzdCwgdTggKnNyYywgdTggKnJlYWwsIHN0cnVjdCBpbnNuICppbnNuKQog
CWtlcm5lbF9pbnNuX2luaXQoaW5zbiwgZGVzdCwgTUFYX0lOU05fU0laRSk7CiAJaW5zbl9nZXRf
bGVuZ3RoKGluc24pOwogCisJLyogV2UgY2FuIG5vdCBwcm9iZSBmb3JjZSBlbXVsYXRlIHByZWZp
eGVkIGluc3RydWN0aW9uICovCisJaWYgKGluc25faGFzX2VtdWxhdGVfcHJlZml4KGluc24pKQor
CQlyZXR1cm4gMDsKKwogCS8qIEFub3RoZXIgc3Vic3lzdGVtIHB1dHMgYSBicmVha3BvaW50LCBm
YWlsZWQgdG8gcmVjb3ZlciAqLwogCWlmIChpbnNuLT5vcGNvZGUuYnl0ZXNbMF0gPT0gQlJFQUtQ
T0lOVF9JTlNUUlVDVElPTikKIAkJcmV0dXJuIDA7CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
