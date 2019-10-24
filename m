Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918D8E2F61
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 12:49:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNae7-0004wx-VG; Thu, 24 Oct 2019 10:47:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zclB=YR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNae5-0004wl-Q7
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 10:47:09 +0000
X-Inumbo-ID: a089d0e6-f64b-11e9-beca-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a089d0e6-f64b-11e9-beca-bc764e2007e4;
 Thu, 24 Oct 2019 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571914029;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=drY35IN31fuLXoHkjWQKU7Ip/8L9euVGc6CT11PoFH0=;
 b=CP+gLBE3Ah9wiMc4zJARopGQTGoJ9mutxXN4Hn5KRbegvowG6A6Sfi58
 /Sk2nzUbafhwBbG3lnaPTjpNmbd4cT4EziHhC6q5qvweiN4/bDcezYeNA
 lCUCiWPKUENcgj0gfNyqhcG0ees69bTqfaVtWgIWfPFJNVuGWw1seQcmF I=;
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
IronPort-SDR: mJTKRLgvbp6srcNYB2b7qiYxVWzXkeW2FJvvUbuLjLpCk9M8dlCe3U6I0oY7MjgVUF+zc2YVCm
 P/TLWxPU2y/hQLD8o3FKhO4JbWMHfYGJLHWbBQmuUabg2yQcJsCpG//2QsoMkW1btDEqpiJVq7
 DJGiflqzs0qA+NEP2czipfjfVsAyt0O3FptEKkQeOijMZS5odVF/23wvxSb6Qb3nV7eXogBBM5
 9nSn3LVHolu4ytPyeZgx+fbj4RFJiV+D1tcGwyZSiWEHMNTNi54LLqQnvDfzrmu4KUAIBIKwxW
 SwY=
X-SBRS: 2.7
X-MesageID: 7677146
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,224,1569297600"; 
   d="scan'208";a="7677146"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 24 Oct 2019 11:47:05 +0100
Message-ID: <20191024104705.11894-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] power_cycle_sleep: Change default sleep
 to 15s
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
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
