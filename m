Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A249BA8150
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 13:48:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Tjt-000830-DK; Wed, 04 Sep 2019 11:46:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ghLv=W7=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i5Tjr-00082V-BA
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 11:46:15 +0000
X-Inumbo-ID: 992aa230-cf09-11e9-abb0-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 992aa230-cf09-11e9-abb0-12813bfff9fa;
 Wed, 04 Sep 2019 11:46:14 +0000 (UTC)
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp
 [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC0A920820;
 Wed,  4 Sep 2019 11:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567597574;
 bh=tHqEkww86KOLAmW5EQ0TIw1FCRFKi6/kyBIAI58FgmQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tCvirIxsPyDLuECE+MpjKKpTgje2DwSZK2A5hmcbdQiW1cyxc+Pvk1Lo7atnCLVqd
 CosZL3Ic2nMvEv6WwnDL97wUaNn4N5A+Gkfebg70iepgH2JEVTQIdksucUonvRQeuo
 3wD1KK8jLdHLqfGD0e+FSyAXNsQrfLCOzsdDnJDs=
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Date: Wed,  4 Sep 2019 20:46:09 +0900
Message-Id: <156759756944.24473.4664241966878257420.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <156759754770.24473.11832897710080799131.stgit@devnote2>
References: <156759754770.24473.11832897710080799131.stgit@devnote2>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH -tip 2/2] x86: kprobes: Prohibit probing on
 instruction which has Xen prefix
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
 Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHJvaGliaXQgcHJvYmluZyBvbiBpbnN0cnVjdGlvbiB3aGljaCBoYXMgWEVOX0VNVUxBVEVfUFJF
RklYCihpdCBtdXN0IGJlIGNwdWlkLikgU2luY2UgdGhhdCBwcmVmaXggaXMgYSBtYXJrZXIgZm9y
IFhlbiwKaWYgd2UgbW9kaWZ5IHRoZSBtYXJrZXIgYnkga3Byb2JlJ3MgaW50MywgdGhhdCBkb2Vz
bid0IHdvcmsKYXMgZXhwZWN0ZWQuCgpTaWduZWQtb2ZmLWJ5OiBNYXNhbWkgSGlyYW1hdHN1IDxt
aGlyYW1hdEBrZXJuZWwub3JnPgotLS0KIGFyY2gveDg2L2tlcm5lbC9rcHJvYmVzL2NvcmUuYyB8
ICAgIDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2tlcm5lbC9rcHJvYmVzL2NvcmUuYyBiL2FyY2gveDg2L2tlcm5lbC9rcHJvYmVz
L2NvcmUuYwppbmRleCA0M2ZjMTNjODMxYWYuLmIxZTg2YWY0YTk4NSAxMDA2NDQKLS0tIGEvYXJj
aC94ODYva2VybmVsL2twcm9iZXMvY29yZS5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC9rcHJvYmVz
L2NvcmUuYwpAQCAtMzUxLDYgKzM1MSwxMCBAQCBpbnQgX19jb3B5X2luc3RydWN0aW9uKHU4ICpk
ZXN0LCB1OCAqc3JjLCB1OCAqcmVhbCwgc3RydWN0IGluc24gKmluc24pCiAJa2VybmVsX2luc25f
aW5pdChpbnNuLCBkZXN0LCBNQVhfSU5TTl9TSVpFKTsKIAlpbnNuX2dldF9sZW5ndGgoaW5zbik7
CiAKKwkvKiBXZSBjYW4gbm90IHByb2JlIFhFTl9FTVVMQVRFX1BSRUZJWCBpbnN0cnVjdGlvbiAq
LworCWlmIChpbnNuX2hhc194ZW5fcHJlZml4KGluc24pKQorCQlyZXR1cm4gMDsKKwogCS8qIEFu
b3RoZXIgc3Vic3lzdGVtIHB1dHMgYSBicmVha3BvaW50LCBmYWlsZWQgdG8gcmVjb3ZlciAqLwog
CWlmIChpbnNuLT5vcGNvZGUuYnl0ZXNbMF0gPT0gQlJFQUtQT0lOVF9JTlNUUlVDVElPTikKIAkJ
cmV0dXJuIDA7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
