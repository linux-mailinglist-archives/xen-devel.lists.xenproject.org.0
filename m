Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D12C18F299
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 11:20:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGK9F-0007Uf-S4; Mon, 23 Mar 2020 10:17:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0LFc=5I=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jGK9E-0007Ua-Lk
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 10:17:32 +0000
X-Inumbo-ID: 816027e0-6cef-11ea-829d-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 816027e0-6cef-11ea-829d-12813bfff9fa;
 Mon, 23 Mar 2020 10:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584958652;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NVhPp3CK1T6YVM/zSwD7Mh4a8zQCz0UWiIu3H8QT/iE=;
 b=MKKyiQokVAQkMgop6oI7GoXzKgLeilSoFtqbtQKVghA/tK5tU6bSF7CY
 kXNVAcCtjsscnz+3zDG6Z/am/nniwWiDyWWT6o5t6mgL1OSDoUua//LJY
 27TlcNgN5kxzxlcPr5nOzqNoDKxoye8k1gRzf+VTlqoagQN9kUrkS8Vsh 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /+hYMUVxRG7LFHgqu8b/DaolDUyfaGApd5PzqQVQWhAN3QyHvm4ZgpACrSjwS08C/PGPjn1XAi
 mBFY6OFJM1+5AhGydIxkhITVkDQPPwBIbq0DYDpMB+WMXLUxfzL6qNmszNA6OMNL3Ymqpc3JPK
 r/dhdx7Htsq7so7Lpa1gaJLzJiQhSaWQr3vxQhIbtzZY6mCIQcVJ4IUb3Cc3xeR6FiuQo8X3pO
 pGnxv69lLNG0/qHHaRROvWFfguTy6VoSGeXBX9HXeNxsvpGe3fkWXrw1EWWyof+qm7mRwkO0Cm
 ld0=
X-SBRS: 2.7
X-MesageID: 14435765
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,296,1580792400"; d="scan'208";a="14435765"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 23 Mar 2020 10:17:17 +0000
Message-ID: <20200323101724.15655-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/7] x86/ucode: Cleanup and fixes - Part 3/n
 (Intel)
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBmb2N1c2VzIG9uIHRoZSBJbnRlbCB1Y29kZSBkcml2ZXIsIHJlbW92aW5nIHRoZSBncmF0
dWl0b3VzIG1lbW9yeQphbGxvY2F0aW9ucyBhbmQgaW5kaXJlY3Rpb24sIGFzIHdlbGwgYXMgbWlu
b3IgZml4ZXMgaW4gb3RoZXIgYXJlYXMgb2YgdGhlCmxvZ2ljLgoKSXQgZGVwZW5kcyBvbiBib3Ro
IHRoZSBQYXJ0IDEgYW5kIDIgc2VyaWVzLCBhbmQgaG9wZWZ1bGx5IGJldHRlciBkZW1vbnN0cmF0
ZXMKd2h5IG1ha2luZyBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoIG9wYXF1ZSBpcyBhIHNlbnNpYmxl
IG1vdmUgZm9yd2FyZC4KCkFuZHJldyBDb29wZXIgKDcpOgogIHg4Ni91Y29kZTogRG9jdW1lbnQg
dGhlIGJlaGF2aW91ciBvZiB0aGUgbWljcm9jb2RlX29wcyBob29rcwogIHg4Ni91Y29kZS9pbnRl
bDogQWRqdXN0IG1pY3JvY29kZV9zYW5pdHlfY2hlY2soKSB0byBub3QgdGFrZSB2b2lkICoKICB4
ODYvdWNvZGUvaW50ZWw6IFJlbW92ZSBncmF0dWl0b3VzIG1lbW9yeSBhbGxvY2F0aW9ucyBmcm9t
IGNwdV9yZXF1ZXN0X21pY3JvY29kZSgpCiAgeDg2L3Vjb2RlL2ludGVsOiBSZWltcGxlbWVudCBn
ZXRfe2RhdGEsdG90YWx9c2l6ZSgpIGhlbHBlcnMKICB4ODYvdWNvZGUvaW50ZWw6IENsZWFuIHVw
IG1pY3JvY29kZV91cGRhdGVfbWF0Y2goKQogIHg4Ni91Y29kZS9pbnRlbDogQ2xlYW4gdXAgbWlj
cm9jb2RlX3Nhbml0eV9jaGVjaygpCiAgeDg2L3Vjb2RlL2ludGVsOiBGb2xkIHN0cnVjdHVyZXMg
dG9nZXRoZXIKCiB4ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9pbnRlbC5jICAgfCAzNzEgKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9jcHUvbWljcm9j
b2RlL3ByaXZhdGUuaCB8ICA0NiArKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9taWNyb2NvZGUu
aCAgICAgIHwgICA1ICsKIDMgZmlsZXMgY2hhbmdlZCwgMjE0IGluc2VydGlvbnMoKyksIDIwOCBk
ZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
