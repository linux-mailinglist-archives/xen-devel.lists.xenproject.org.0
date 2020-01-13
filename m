Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA42913981E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 18:54:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir3rC-0004iy-U3; Mon, 13 Jan 2020 17:50:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A39C=3C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ir3rB-0004ip-9P
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 17:50:29 +0000
X-Inumbo-ID: 2cf5c5d2-362d-11ea-82bc-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cf5c5d2-362d-11ea-82bc-12813bfff9fa;
 Mon, 13 Jan 2020 17:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578937824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Aoc5mBtdig1TgC+bnbuIyB/xaMvCbrdPEgDzzP13MIg=;
 b=VX6gxqfVgYtutH1octOxluMfCxhnWzUFAfgi1dI5ZJHo8LY/bBGOuz1n
 Gd5SH+7D/pyi1Gqb26zau87un3pM14eYq847aGSnT/tHDbxwyqcr2uWo7
 hG3W+krMt8i8L9ZQA87VVpKEO63VJtvPM27ZqJKb5UpGfSf1Lo2tp0S5b E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qmAbKmQFTHC7gZHzoZmJtNrYulNdBiWd/es2iDfaf+6wUS0cFIC1rEAgy4d3p+38GieEHrrhS0
 WVx/FYl+3ASHWxmJH/7WFt3YnOcNMGeEyJG+1uUfxwLXELRVdv7qZXZTKB99NSLzInuidoBfGi
 vD6AtaEkVVROIGHAD12rL9GuWGoWD7p2Qf+PSfblMFkGOod4zd7mkdhNPgB3S8bhjo3EHwZ+XA
 q3+GPdAGzmtPa+Bn9wmdkaOX4xJE3Z+np3D8vehv9G91PweCEqCveSNQFKoyM6GrwwbHyy+uTO
 Ti0=
X-SBRS: 2.7
X-MesageID: 11215604
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,429,1571716800"; d="scan'208";a="11215604"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 13 Jan 2020 17:50:17 +0000
Message-ID: <20200113175020.32730-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200113175020.32730-1-andrew.cooper3@citrix.com>
References: <20200113175020.32730-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/4] x86/page: Remove bifrucated PAGE_HYPERVISOR
 constant
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

RGVzcGl0ZSBiZWluZyB2YWd1ZWx5IGF3YXJlLCB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIFBBR0Vf
SFlQRVJWSVNPUiBpbiBBU00gYW5kCkMgY29kZSBoYXMgbmV2ZXJ0aGVsZXNzIGNhdXNlZCBzZXZl
cmFsIGJ1Z3MgSSBzaG91bGQgaGF2ZSBrbm93biBiZXR0ZXIgYWJvdXQsCmFuZCBjb250cmlidXRl
ZCB0byByZXZpZXcgY29uZnVzaW9uLgoKVGhlcmUgYXJlIGV4YWN0bHkgNCB1c2VzIG9mIHRoZXNl
IGNvbnN0YW50cyBpbiBhc20gY29kZSAoYW5kIG9uZSBpcyBzaG9ydGx5CmdvaW5nIHRvIGRpc2Fw
cGVhcikuCgpJbnN0ZWFkIG9mIGNyZWF0aW5nIHRoZSBjb25zdGFudHMgd2hpY2ggYmVoYXZlIGRp
ZmZlcmVudGx5IGJldHdlZW4gQVNNIGFuZCBDCmNvZGUsIGV4cG9zZSBhbGwgdGhlIGNvbnN0YW50
cyBhbmQgdXNlIG5vbi1hbWJ1Z3VvdXMgbm9uLU5YIG9uZXMgaW4gQVNNLgoKU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4g
QmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2
L2Jvb3QvaGVhZC5TICAgICAgICAgIHwgMiArLQogeGVuL2FyY2gveDg2L2Jvb3QveDg2XzY0LlMg
ICAgICAgIHwgNiArKystLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYveDg2XzY0L3BhZ2UuaCB8IDcg
LS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUyBiL3hlbi9hcmNoL3g4Ni9i
b290L2hlYWQuUwppbmRleCBhYWYwZTExOWRiLi5jNWFjYmY1NmFlIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvYm9vdC9oZWFkLlMKKysrIGIveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCkBAIC02
NzQsNyArNjc0LDcgQEAgdHJhbXBvbGluZV9zZXR1cDoKICAgICAgICAgICogdGhlIHRyYW5zaXRp
b24gaW50byBsb25nIG1vZGUpLCB1c2luZyAyTSBzdXBlcnBhZ2VzLgogICAgICAgICAgKi8KICAg
ICAgICAgbGVhICAgICBzeW1fZXNpKHN0YXJ0KSwlZWJ4Ci0gICAgICAgIGxlYSAgICAgKDE8PEwy
X1BBR0VUQUJMRV9TSElGVCkqNysoUEFHRV9IWVBFUlZJU09SfF9QQUdFX1BTRSkoJWVieCksJWVh
eAorICAgICAgICBsZWEgICAgICgxPDxMMl9QQUdFVEFCTEVfU0hJRlQpKjcrKFBBR0VfSFlQRVJW
SVNPUl9SV1h8X1BBR0VfUFNFKSglZWJ4KSwlZWF4CiAgICAgICAgIHNociAgICAgJChMMl9QQUdF
VEFCTEVfU0hJRlQtMyksJWVieAogICAgICAgICBtb3YgICAgICQ4LCVlY3gKIDE6ICAgICAgbW92
ICAgICAlZWF4LHN5bV9mcyhsMl9ib290bWFwKS04KCVlYngsJWVjeCw4KQpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2Jvb3QveDg2XzY0LlMgYi94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUwpp
bmRleCBjMjZlY2NlYTkyLi5hYWJmNTYxYjIzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYm9v
dC94ODZfNjQuUworKysgYi94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUwpAQCAtNTYsOSArNTYs
OSBAQCBsMV9kaXJlY3RtYXA6CiAgICAgICAgIC5yZXB0IEwxX1BBR0VUQUJMRV9FTlRSSUVTCiAg
ICAgICAgIC8qIFZHQSBob2xlICgweGEwMDAwLTB4YzAwMDApIHNob3VsZCBiZSBtYXBwZWQgVUMt
LiAqLwogICAgICAgICAuaWYgcGZuID49IDB4YTAgJiYgcGZuIDwgMHhjMAotICAgICAgICAucXVh
ZCAocGZuIDw8IFBBR0VfU0hJRlQpIHwgUEFHRV9IWVBFUlZJU09SX1VDTUlOVVMgfCBNQVBfU01B
TExfUEFHRVMKKyAgICAgICAgLnF1YWQgKHBmbiA8PCBQQUdFX1NISUZUKSB8IF9fUEFHRV9IWVBF
UlZJU09SX1VDTUlOVVMgfCBfUEFHRV9HTE9CQUwgfCBNQVBfU01BTExfUEFHRVMKICAgICAgICAg
LmVsc2UKLSAgICAgICAgLnF1YWQgKHBmbiA8PCBQQUdFX1NISUZUKSB8IFBBR0VfSFlQRVJWSVNP
UiB8IE1BUF9TTUFMTF9QQUdFUworICAgICAgICAucXVhZCAocGZuIDw8IFBBR0VfU0hJRlQpIHwg
UEFHRV9IWVBFUlZJU09SX1JXWCB8IE1BUF9TTUFMTF9QQUdFUwogICAgICAgICAuZW5kaWYKICAg
ICAgICAgcGZuID0gcGZuICsgMQogICAgICAgICAuZW5kcgpAQCAtODksNyArODksNyBAQCBHTE9C
QUwobDJfeGVubWFwKQogICAgICAgICAucXVhZCAwCiAgICAgICAgIGlkeCA9IDEKICAgICAgICAg
LnJlcHQgNwotICAgICAgICAucXVhZCBzeW1fb2ZmcyhfX2ltYWdlX2Jhc2VfXykgKyAoaWR4IDw8
IEwyX1BBR0VUQUJMRV9TSElGVCkgKyAoUEFHRV9IWVBFUlZJU09SIHwgX1BBR0VfUFNFKQorICAg
ICAgICAucXVhZCBzeW1fb2ZmcyhfX2ltYWdlX2Jhc2VfXykgKyAoaWR4IDw8IEwyX1BBR0VUQUJM
RV9TSElGVCkgKyAoUEFHRV9IWVBFUlZJU09SX1JXWCB8IF9QQUdFX1BTRSkKICAgICAgICAgaWR4
ID0gaWR4ICsgMQogICAgICAgICAuZW5kcgogICAgICAgICAuZmlsbCBMMl9QQUdFVEFCTEVfRU5U
UklFUyAtIDgsIDgsIDAKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYveDg2XzY0L3Bh
Z2UuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYveDg2XzY0L3BhZ2UuaAppbmRleCA0ZmUwMjA1NTUz
Li4xYTRhZjg1NDY5IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3g4Nl82NC9wYWdl
LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni94ODZfNjQvcGFnZS5oCkBAIC0xNzIsMTggKzE3
MiwxMSBAQCBzdGF0aWMgaW5saW5lIGludHB0ZV90IHB1dF9wdGVfZmxhZ3ModW5zaWduZWQgaW50
IHgpCiAjZGVmaW5lIFBBR0VfSFlQRVJWSVNPUl9SWCAgICAgIChfX1BBR0VfSFlQRVJWSVNPUl9S
WCAgICAgIHwgX1BBR0VfR0xPQkFMKQogI2RlZmluZSBQQUdFX0hZUEVSVklTT1JfUldYICAgICAo
X19QQUdFX0hZUEVSVklTT1IgICAgICAgICB8IF9QQUdFX0dMT0JBTCkKIAotI2lmZGVmIF9fQVNT
RU1CTFlfXwotLyogRGVwZW5kZW5jeSBvbiBOWCBiZWluZyBhdmFpbGFibGUgY2FuJ3QgYmUgZXhw
cmVzc2VkLiAqLwotIyBkZWZpbmUgUEFHRV9IWVBFUlZJU09SICAgICAgICAgUEFHRV9IWVBFUlZJ
U09SX1JXWAotIyBkZWZpbmUgUEFHRV9IWVBFUlZJU09SX1VDTUlOVVMgKF9fUEFHRV9IWVBFUlZJ
U09SX1VDTUlOVVMgfCBfUEFHRV9HTE9CQUwpCi0jIGRlZmluZSBQQUdFX0hZUEVSVklTT1JfVUMg
ICAgICAoX19QQUdFX0hZUEVSVklTT1JfVUMgICAgICB8IF9QQUdFX0dMT0JBTCkKLSNlbHNlCiAj
IGRlZmluZSBQQUdFX0hZUEVSVklTT1IgICAgICAgICBQQUdFX0hZUEVSVklTT1JfUlcKICMgZGVm
aW5lIFBBR0VfSFlQRVJWSVNPUl9VQ01JTlVTIChfX1BBR0VfSFlQRVJWSVNPUl9VQ01JTlVTIHwg
XAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9QQUdFX0dMT0JBTCB8IF9QQUdF
X05YKQogIyBkZWZpbmUgUEFHRV9IWVBFUlZJU09SX1VDICAgICAgKF9fUEFHRV9IWVBFUlZJU09S
X1VDIHwgXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9QQUdFX0dMT0JBTCB8
IF9QQUdFX05YKQotI2VuZGlmCiAKICNlbmRpZiAvKiBfX1g4Nl82NF9QQUdFX0hfXyAqLwogCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
