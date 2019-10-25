Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC4CE5075
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 17:50:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO1pL-0000Xl-TG; Fri, 25 Oct 2019 15:48:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Phy=YS=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iO1pK-0000XS-C6
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 15:48:34 +0000
X-Inumbo-ID: e3bd75cc-f73e-11e9-8aca-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3bd75cc-f73e-11e9-8aca-bc764e2007e4;
 Fri, 25 Oct 2019 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572018509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=drY35IN31fuLXoHkjWQKU7Ip/8L9euVGc6CT11PoFH0=;
 b=e4vkbpjG64hTtY4V7fVutb5g8LBM6uC2QHngoGXebxno1Lfl2Tu7YYQN
 I62jaODdBJ2zujK8kH0dDUoWvS2rOZ3pNG4H7Q+g3gstsS+64LuvCvEeI
 nwxe2JdCzm635f4YZ5sLF8uP8wzMLnEMSbHJHp2O76Tunc3qDtpnMnWt3 Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: X34DhFu2tnLQgH8KHYoR8U/w9epd9NbsdMSWBYJa6qkjvf16+9nQQxRutiGp55Jv3jAO0LGWM/
 FzbyBLIbkLGsoL7NEh4lHrKtYhkcVW9jBMleCajqOwPH7KtKgNlyqBplwwMUIYGWJADPDMaL40
 +FCSYGcEep0GlYpbEMrIKMhdt96lmsHo1DzaRORSMfawb0wXu4ScZvtaPiLkhOaOvDSlGLMUEE
 A4gxNQHbGbg+gNkcvelKZV8EtIOs8ZMVqI7DuDvKzMiPiYTUXSDmKhfc0iCPRyvVMITWOhJGzG
 Kz4=
X-SBRS: 2.7
X-MesageID: 7439066
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,229,1569297600"; 
   d="scan'208";a="7439066"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 25 Oct 2019 16:48:17 +0100
Message-ID: <20191025154819.26593-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191025154819.26593-1-ian.jackson@eu.citrix.com>
References: <20191025154819.26593-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 3/5] power_cycle_sleep: Change default
 sleep to 15s
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
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

NXMgaXMgc28gc2hvcnQgdGhhdCB3aGVuIGEgaG9zdCBmYWlscyB0byByZXNwb25kIHdlIGFyZW4n
dCBzdXJlIGlmIGl0CndhcyBqdXN0IHZlcnkgaWRsZSBhbmQgcmFuIG9mZiBpdHMgUFNVJ3MgaW50
ZXJuYWwgZW5lcmd5IHN0b3JhZ2UgZm9yCnRoYXQgcGVyaW9kLgoKU2lnbmVkLW9mZi1ieTogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC9UZXN0U3Vw
cG9ydC5wbSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0gYi9Pc3N0ZXN0L1Rlc3RT
dXBwb3J0LnBtCmluZGV4IDZiMGVlN2EyLi45Yzk5ZWUxNyAxMDA2NDQKLS0tIGEvT3NzdGVzdC9U
ZXN0U3VwcG9ydC5wbQorKysgYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCkBAIC0xMDk3LDcgKzEw
OTcsNyBAQCBzdWIgcG93ZXJfcmVib290X2F0dGVtcHRzICgkJCQ7JCQpIHsKIAogc3ViIHBvd2Vy
X2N5Y2xlX3NsZWVwICgkKSB7CiAgICAgbXkgKCRobykgPSBAXzsKLSAgICBteSAkdG8gPSBnZXRf
aG9zdF9wcm9wZXJ0eSgkaG8sICdwb3dlci1jeWNsZS10aW1lJywgNSk7CisgICAgbXkgJHRvID0g
Z2V0X2hvc3RfcHJvcGVydHkoJGhvLCAncG93ZXItY3ljbGUtdGltZScsIDE1KTsKICAgICBsb2dt
KCJwb3dlci1jeWNsZTogd2FpdGluZyAke3RvfXMiKTsKICAgICBzbGVlcCgkdG8pOwogfQotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
