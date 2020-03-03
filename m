Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC5E176B81
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 03:50:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8xad-0003d9-SE; Tue, 03 Mar 2020 02:47:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WhNk=4U=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1j8xac-0003d4-49
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 02:47:22 +0000
X-Inumbo-ID: 4dd2fec6-5cf9-11ea-ac41-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dd2fec6-5cf9-11ea-ac41-bc764e2007e4;
 Tue, 03 Mar 2020 02:47:21 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CEBBF246A1;
 Tue,  3 Mar 2020 02:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583203640;
 bh=Ijmq/i5PFf8y/H7vXVaSKWPVJgkUToA6JgRLsQDTu7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sPTg+ULhZ1Q68IJVHqyvOCxzETa9b555+K7DFNVCnoEj98cDP+NG0bd92iSC0zUW+
 2a8MIYzyP888DHf/1WOpdHaQFjLa8h0uuDgV1mEO3SsEnqCsGEM+Fy4AeFCLsImiiP
 0lSQGzGZf81NmpgtAEty6Z8ZzPL3IBz1rF5IUex0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon,  2 Mar 2020 21:46:01 -0500
Message-Id: <20200303024615.8889-52-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303024615.8889-1-sashal@kernel.org>
References: <20200303024615.8889-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Xen-devel] [PATCH AUTOSEL 5.5 52/66] x86/xen: Distribute switch
 variables for initialization
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
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
 Kees Cook <keescook@chromium.org>, clang-built-linux@googlegroups.com,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CgpbIFVwc3RyZWFtIGNvbW1p
dCA5MDM4ZWM5OWNlYjk0ZmI4ZDkzYWRlNWUyMzZiMjkyOGYwNzkyYzdjIF0KClZhcmlhYmxlcyBk
ZWNsYXJlZCBpbiBhIHN3aXRjaCBzdGF0ZW1lbnQgYmVmb3JlIGFueSBjYXNlIHN0YXRlbWVudHMK
Y2Fubm90IGJlIGF1dG9tYXRpY2FsbHkgaW5pdGlhbGl6ZWQgd2l0aCBjb21waWxlciBpbnN0cnVt
ZW50YXRpb24gKGFzCnRoZXkgYXJlIG5vdCBwYXJ0IG9mIGFueSBleGVjdXRpb24gZmxvdykuIFdp
dGggR0NDJ3MgcHJvcG9zZWQgYXV0b21hdGljCnN0YWNrIHZhcmlhYmxlIGluaXRpYWxpemF0aW9u
IGZlYXR1cmUsIHRoaXMgdHJpZ2dlcnMgYSB3YXJuaW5nIChhbmQgdGhleQpkb24ndCBnZXQgaW5p
dGlhbGl6ZWQpLiBDbGFuZydzIGF1dG9tYXRpYyBzdGFjayB2YXJpYWJsZSBpbml0aWFsaXphdGlv
bgoodmlhIENPTkZJR19JTklUX1NUQUNLX0FMTD15KSBkb2Vzbid0IHRocm93IGEgd2FybmluZywg
YnV0IGl0IGFsc28KZG9lc24ndCBpbml0aWFsaXplIHN1Y2ggdmFyaWFibGVzWzFdLiBOb3RlIHRo
YXQgdGhlc2Ugd2FybmluZ3MgKG9yIHNpbGVudApza2lwcGluZykgaGFwcGVuIGJlZm9yZSB0aGUg
ZGVhZC1zdG9yZSBlbGltaW5hdGlvbiBvcHRpbWl6YXRpb24gcGhhc2UsCnNvIGV2ZW4gd2hlbiB0
aGUgYXV0b21hdGljIGluaXRpYWxpemF0aW9ucyBhcmUgbGF0ZXIgZWxpZGVkIGluIGZhdm9yIG9m
CmRpcmVjdCBpbml0aWFsaXphdGlvbnMsIHRoZSB3YXJuaW5ncyByZW1haW4uCgpUbyBhdm9pZCB0
aGVzZSBwcm9ibGVtcywgbW92ZSBzdWNoIHZhcmlhYmxlcyBpbnRvIHRoZSAiY2FzZSIgd2hlcmUK
dGhleSdyZSB1c2VkIG9yIGxpZnQgdGhlbSB1cCBpbnRvIHRoZSBtYWluIGZ1bmN0aW9uIGJvZHku
CgphcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmM6IEluIGZ1bmN0aW9uIOKAmHhlbl93cml0ZV9t
c3Jfc2FmZeKAmToKYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jOjkwNDoxMjogd2FybmluZzog
c3RhdGVtZW50IHdpbGwgbmV2ZXIgYmUgZXhlY3V0ZWQgWy1Xc3dpdGNoLXVucmVhY2hhYmxlXQog
IDkwNCB8ICAgdW5zaWduZWQgd2hpY2g7CiAgICAgIHwgICAgICAgICAgICBefn5+fgoKWzFdIGh0
dHBzOi8vYnVncy5sbHZtLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9NDQ5MTYKClNpZ25lZC1vZmYtYnk6
IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMjAwMjIwMDYyMzE4LjY5Mjk5LTEta2Vlc2Nvb2tAY2hyb21pdW0ub3JnClJl
dmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cltib3JpczogbWFkZSBA
d2hpY2ggYW4gJ3Vuc2lnbmVkIGludCddClNpZ25lZC1vZmYtYnk6IEJvcmlzIE9zdHJvdnNreSA8
Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxz
YXNoYWxAa2VybmVsLm9yZz4KLS0tCiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgfCA3ICsr
KystLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIGIvYXJjaC94ODYveGVuL2Vu
bGlnaHRlbl9wdi5jCmluZGV4IDFmNzU2ZmZmZmU4YjMuLjc5NDA5MTIwYTYwMzYgMTAwNjQ0Ci0t
LSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYworKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdo
dGVuX3B2LmMKQEAgLTg5NiwxNCArODk2LDE1IEBAIHN0YXRpYyB1NjQgeGVuX3JlYWRfbXNyX3Nh
ZmUodW5zaWduZWQgaW50IG1zciwgaW50ICplcnIpCiBzdGF0aWMgaW50IHhlbl93cml0ZV9tc3Jf
c2FmZSh1bnNpZ25lZCBpbnQgbXNyLCB1bnNpZ25lZCBsb3csIHVuc2lnbmVkIGhpZ2gpCiB7CiAJ
aW50IHJldDsKKyNpZmRlZiBDT05GSUdfWDg2XzY0CisJdW5zaWduZWQgaW50IHdoaWNoOworCXU2
NCBiYXNlOworI2VuZGlmCiAKIAlyZXQgPSAwOwogCiAJc3dpdGNoIChtc3IpIHsKICNpZmRlZiBD
T05GSUdfWDg2XzY0Ci0JCXVuc2lnbmVkIHdoaWNoOwotCQl1NjQgYmFzZTsKLQogCWNhc2UgTVNS
X0ZTX0JBU0U6CQl3aGljaCA9IFNFR0JBU0VfRlM7IGdvdG8gc2V0OwogCWNhc2UgTVNSX0tFUk5F
TF9HU19CQVNFOgl3aGljaCA9IFNFR0JBU0VfR1NfVVNFUjsgZ290byBzZXQ7CiAJY2FzZSBNU1Jf
R1NfQkFTRToJCXdoaWNoID0gU0VHQkFTRV9HU19LRVJORUw7IGdvdG8gc2V0OwotLSAKMi4yMC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
