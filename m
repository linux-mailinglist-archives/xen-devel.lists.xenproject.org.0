Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E34EB5E1
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 18:14:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQDyO-0003Xe-Dd; Thu, 31 Oct 2019 17:11:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T8b6=YY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iQDyN-0003XZ-AW
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 17:10:59 +0000
X-Inumbo-ID: 676e7581-fc01-11e9-954e-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 676e7581-fc01-11e9-954e-12813bfff9fa;
 Thu, 31 Oct 2019 17:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572541857;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3mPNLXvpjxQnUmDBA5LcICR/1ppwK5qqnjDVNl3I4Kg=;
 b=HxlLDnvgAjDPZI3HQtbEjY5IBtS4fBWko6R7VhOobr9rwYHIXbcEFCgF
 KJYCTArVb784XLw/J7Gx+XicPxjjBnO8YHdFMamSTJjVzeLmYmZOMvUrB
 Pz4xdgVFwRQk/inD0uamefwOCnLYhnXmPsFyHOFBZXK3aZsbgTJ3C9PMY k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gjLqlGuJjWxoRPkq+INrl9HUA1h1ZFCq7k5I59NjmcDvdszykFrLbLQon6+ZrTk+hkGkZyUqqN
 BR4fHOj9h0CNejyiHkkxWiwJCO5MZsu5hZyl0zaDKOnw8OGzGbYMvxLiwmeZbJZLqox7SmNtXC
 iqltcRX+GtjLAXffImHW7GFmz8m7c2ygwjJrSCgRCIKoKSCsSoy4oZr/ANPa4qpRLXYDG2TTWu
 la+lxtuteqPyhB0iSmCB6Hc+C8gaDzCKrDARKlB/k/HQrS8UKcdBBTFx0X3BF6ifavTuyaTMp3
 HLQ=
X-SBRS: 2.7
X-MesageID: 8021275
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,252,1569297600"; 
   d="scan'208";a="8021275"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 31 Oct 2019 17:10:29 +0000
Message-ID: <20191031171029.3627-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] grub2 setup: Set GRUB_TERMINAL=console,
 if no other setting
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Brian Woods <brian.woods@xilinx.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGRlZmF1bHQgZm9yIGQtaSwgaWYgaXQgZG9lc24ndCBrbm93IGJldHRlciwgaXMgdG8gbGV0
IHVwZGF0ZS1ncnViCnNldCBncnViJ3MgdGVybWluYWwgdG8gYGdmeHRlcm0nLiAgQnV0IGluIG9z
c3Rlc3Qgd2UgZG8gbm90IHJlYWxseQpldmVyIHdhbnQgdG8gdXNlIGEgZ3JhcGhpY2FsIGNvbnNv
bGUuCgpMZXQgdXMgZGlzY3VzcyBzb21lIG9mIHRoZSBjYXNlcyBpbiBhIGJpdCBtb3JlIGRldGFp
bDoKCk9uIFVFRkkgc3lzdGVtcyB3aXRoIGEgc2VyaWFsIGNvbnNvbGUsIHRoZSBVRUZJIGNvbnNv
bGUgb3VnaHQgKGFuZCBpbgpvdXIgaW5zdGFsbGF0aW9uIGlzIGluIGFsbCBjYXNlcyBzbyBmYXIp
IHR5cGljYWxseSBsaW5rZWQgdG8gdGhlCnNlcmlhbCBjb25zb2xlLiAgU28gR1JVQl9URVJNSU5B
TD1jb25zb2xlIHdvdWxkIGJlIHJpZ2h0IGZvciBVRUZJLgpUaGlzIGFwcGVhcnMgdG8gYmUgY29y
cmVjdCBvbiB0aGUgYWxiYW5hcywgb3VyIG9uZSBwYWlyIG9mIGluLXNlcnZpY2UKeDg2IGJveGVz
IHdpdGggYSBVRUZJIGZpcm13YXJlIGNvbmZpZ3VyYXRpb24uCgpCdXQgb24geDg2IHN5c3RlbXMs
IHdlIGdlbmVyYWxseSBwYXNzIGNvbnNvbGU9dHR5Uy4uLiBhcmd1bWVudHMgb24gdGhlCmQtaSBj
b21tYW5kIGxpbmUsIGFuZCBkLWkgYXJyYW5nZXMgZm9yIEdSVUJfVEVSTUlOQUw9c2VyaWFsIGFu
ZAphcHByb3ByaWF0ZSBvdGhlciBzZXR0aW5ncy4gIFdlIGFscmVhZHkgaGF2ZSBhIHdvcmthcm91
bmQgdGhhdCBjaGFuZ2VzCnRoYXQgdG8gInNlcmlhbCBjb25zb2xlIiwgd2hpY2ggaXMgZmluZSB3
aGV0aGVyICJjb25zb2xlIiBtZWFucyBhIFZHQQpjb25zb2xlIHdlIGRvbid0IGxvb2sgYXQsIG9y
IHNvbWUga2luZCBvZiBCSU9TIGNvbnNvbGUgcmVkaXJlY3Rpb24uClRoaXMgY3VycmVudGx5IHdv
cmtzIG9uIGFsbCBvdXIgeDg2IG1hY2hpbmVzIGluY2x1ZGluZyBvIFVFRkkuCgpPbiBvdXIgVGh1
bmRlclggKGFybTY0KSBib3hlcywgYGdmeHRlcm0nIGRvZXMgbm90IHdvcmsgYXQgYWxsLgpgY29u
c29sZScsIGRvZXMsIGJlY2F1c2UgaXQgZ29lcyB0byB0aGUgVUVGSSBjb25zb2xlIHdoaWNoIFVF
Rkkgc2VuZHMKdG8gdGhlIHNlcmlhbCBwb3J0LgoKVGhlIGJlc3QgYXBwcm9hY2ggdG8gdW5waWNr
aW5nIHRoaXMgbWVzcyBzZWVtcyB0byBiZSB0byBhcHBseSBhCmRlZmF1bHQgc2V0dGluZyBvZiBH
UlVCX1RFUk1JTkFMPWNvbnNvbGUuICBUaGUgZWZmZWN0IG9mIHRoaXMgaXMgdG8KY2hhbmdlIGBn
Znh0ZXJtJyBpbiBncnViLmNmZy4gIEluIHByYWN0aWNlIGFsbCBvdXIgeDg2CmJveGVzIChpbmNs
dWRpbmcgb3VyIHg4NiBVRUZJIGJveGVzLCB3aGVyZSBgY29uc29sZScgd291bGQgd29yaykgaGF2
ZQppdCBzZXQgdG8gYHNlcmlhbCcgKG1vZGlmaWVkIGJ5IHVzIHRvIGBzZXJpYWwgY29uc29sZScp
IHNvIHJlbWFpbgp1bmNoYW5nZWQuCgpUaGUgbmV0IHJlc3VsdCBpcyB0aGF0IG9uIEFSTSwgd2Ug
bm93IHNldCBgR1JVQl9URVJNSU5BTD1jb25zb2xlJywgYW5kCndlIG5vdyBnZXQgYWxsIG9mIHRo
ZSBib290bG9hZGVyIHNlcmlhbCBvdXRwdXQgb24gdGhlIHJvY2hlc3RlcnMuCgpJIGhhdmUgdGVz
dGVkIHRoaXMgb246CiAgcm9jaGVzdGVyMCAgICAgICAgIC0gYXJtNjQgdWVmaSBUaHVuZGVyWCwg
dXNlZCBub3QgdG8gd29yawogIGxheHRvbjEgICAgICAgICAgICAtIGFybTY0IHVlZmkgU29mdEly
b24KICBhbGJhbmEwICAgICAgICAgICAgLSB4ODYgdWVmaQogIGh1eGVscmViZTAgICAgICAgICAt
IHg4NiBiaW9zCiAgYXJuZGFsZS13ZXN0ZmllbGQgIC0gYXJtaGYgdS1ib290CiAgY3ViaWV0cnVj
ay1nbGVpemVzIC0gYXJtaGYgdS1ib290CgpUaGFua3MgdG8gQnJpYW4gV29vZHMgZm9yIHBva2lu
ZyBhdCByb2NoZXN0ZXIwIGFuZCBtYWtpbmcgdGhlIGtleQpzdWdnZXN0aW9ucy4KCkNDOiBCcmlh
biBXb29kcyA8YnJpYW4ud29vZHNAeGlsaW54LmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+CkNDOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvRGVi
aWFuLnBtIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvT3NzdGVzdC9EZWJpYW4ucG0gYi9Pc3N0ZXN0L0RlYmlhbi5wbQppbmRleCA3OWFh
MmQyNC4uYzIyYWFhZGYgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvRGViaWFuLnBtCisrKyBiL09zc3Rl
c3QvRGViaWFuLnBtCkBAIC02MjQsOSArNjI0LDExIEBAIEVORAogICAgICAgICAKICAgICAgICAg
dGFyZ2V0X2VkaXRmaWxlX3Jvb3QoJGhvLCAnL2V0Yy9kZWZhdWx0L2dydWInLCBzdWIgewogICAg
ICAgICAgICAgbXkgJWs7CisJICAgIG15ICRoYWRfdGVybWluYWw7CiAgICAgICAgICAgICB3aGls
ZSAoPDo6RUk+KSB7CiAJCSMgc29tZSBiaW9zZXMgYmxvY2sgdGhlIHNlcmlhbCBzdGlsbCBzbyB3
ZSB0cnkgdmdhIHRvbwogCQlzL14oR1JVQl9URVJNSU5BTD0pKFsnIl0/KXNlcmlhbFwyXHMqJC8k
MSdzZXJpYWwgY29uc29sZSdcbi87CisJCSRoYWRfdGVybWluYWwgfHw9IG0vXkdSVUJfVEVSTUlO
QUw9LzsKIAogICAgICAgICAgICAgICAgIGlmIChtL15ccyooW0EtWl9dKylccypcPVxzKiguKj8p
XHMqJC8pIHsKICAgICAgICAgICAgICAgICAgICAgbXkgKCRrLCR2KSA9ICgkMSwkMik7CkBAIC02
MzYsNiArNjM4LDExIEBAIEVORAogICAgICAgICAgICAgICAgIG5leHQgaWYgbS9eR1JVQl9DTURM
SU5FXyg/OlhFTnxMSU5VWCg/Ol9YRU5fUkVQTEFDRSk/KD86X0RFRkFVTFQpPykuKlw9fF5HUlVC
X0RFRkFVTFQuKlw9LzsKICAgICAgICAgICAgICAgICBwcmludCA6OkVPOwogICAgICAgICAgICAg
fQorICAgICAgICAgICAgcHJpbnQgOjpFTyA8PEVORCBvciBkaWUgJCEgdW5sZXNzICRoYWRfdGVy
bWluYWw7CisKK0dSVUJfVEVSTUlOQUw9ImNvbnNvbGUiCitFTkQKKwogICAgICAgICAgICAgcHJp
bnQgOjpFTyA8PEVORCBvciBkaWUgJCE7CiAKIEdSVUJfREVGQVVMVD0iJGVudHJ5LT57TWVudUVu
dHJ5UGF0aH0iCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
