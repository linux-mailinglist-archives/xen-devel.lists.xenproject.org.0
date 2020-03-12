Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFBF1833C9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 15:52:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCP9b-0000ZT-0R; Thu, 12 Mar 2020 14:49:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=780U=45=suse.cz=mbenes@srs-us1.protection.inumbo.net>)
 id 1jCOh6-0006Xs-RC
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 14:20:16 +0000
X-Inumbo-ID: 94cb597a-646c-11ea-b19e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94cb597a-646c-11ea-b19e-12813bfff9fa;
 Thu, 12 Mar 2020 14:20:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A1AEAB2F8;
 Thu, 12 Mar 2020 14:20:09 +0000 (UTC)
From: Miroslav Benes <mbenes@suse.cz>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 jpoimboe@redhat.com
Date: Thu, 12 Mar 2020 15:20:05 +0100
Message-Id: <20200312142007.11488-1-mbenes@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Mar 2020 14:49:40 +0000
Subject: [Xen-devel] [PATCH 0/2] x86/xen: Make idle tasks reliable
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
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
 xen-devel@lists.xenproject.org, Miroslav Benes <mbenes@suse.cz>,
 jslaby@suse.cz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHVud2luZGVyIHJlcG9ydHMgaWRsZSB0YXNrcycgc3RhY2sgb24gWEVOIFBWIGFzIHVucmVs
aWFibGUgd2hpY2gKY29tcGxpY2F0ZXMgdGhpbmdzIGZvciBhdCBsZWFzdCBsaXZlIHBhdGNoaW5n
LiBUaGUgdHdvIHBhdGNoZXMgaW4gdGhlCnNlcmllcyB0cnkgdG8gYW1lbmQgdGhhdCBieSB1c2lu
ZyBzaW1pbGFyIGFwcHJvYWNoIGFzIG5vbi1YRU4geDg2IGRvZXMuCgpIb3dldmVyLCBJIGRpZCBu
b3QgY29tZSB1cCB3aXRoIGEgbmljZSBzb2x1dGlvbiBmb3Igc2Vjb25kYXJ5IENQVXMgaWRsZQp0
YXNrcy4gVGhlIHBhdGNoIGp1c3Qgc2hvd3MgdGhlIGlkZWEgd2hhdCBzaG91bGQgYmUgZG9uZSBi
dXQgaXQgaXMgYW4KdWdseSBoYWNrLiBJZGVhcyBhcmUgbW9yZSB0aGFuIHdlbGNvbWUuCgpNaXJv
c2xhdiBCZW5lcyAoMik6CiAgeDg2L3hlbjogTWFrZSB0aGUgYm9vdCBDUFUgaWRsZSB0YXNrIHJl
bGlhYmxlCiAgeDg2L3hlbjogTWFrZSB0aGUgc2Vjb25kYXJ5IENQVSBpZGxlIHRhc2tzIHJlbGlh
YmxlCgogYXJjaC94ODYveGVuL3NtcF9wdi5jICAgfCAgMyArKy0KIGFyY2gveDg2L3hlbi94ZW4t
aGVhZC5TIHwgMTQgKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
