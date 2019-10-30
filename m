Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76978EA184
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 17:13:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPqXi-0001n2-7E; Wed, 30 Oct 2019 16:09:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BWtK=YX=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPqXh-0001mw-Fk
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 16:09:53 +0000
X-Inumbo-ID: b3f1c344-fb2f-11e9-beca-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3f1c344-fb2f-11e9-beca-bc764e2007e4;
 Wed, 30 Oct 2019 16:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572451793;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QDb0PpdNtwQ0AG5ps/gVfjxYd+q31U33P43gd2HvYYw=;
 b=T0lfo5wtcp1DuFIG+2FVrQ3Pgf5cVPprd1oqo5zcUvQLHnIRjEwAa0px
 Kwt0UPU/ywoIAXOEOnI8LJhaSkZRejCkle8fnX0SmNoDvPt8EXY7o6Hsd
 Oj8Hd3EW/j6IL5T+eCAsBcQMjyAHg+4yiF4gRcDfrGJJiuzaGiKO/1HEm 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BTxySh6mupme50ew2zbwmgIbcH9etBbpSqAoBCv9ExrhtwkQR1NvBgkbzo0mrHIGvm+YYc7zkb
 odCiT74xV41anyLGxrJ937WQV+lAqJlNNnnq+I5fc/YgxmQEQC+oWwSPUhe9OTiS0UIRnRSzBZ
 auEY50tHjn0sdnPq5nzetWr/xU3spI6t/DlOS8q66vMmFS8lupdJUMSUHX4vkyHYwrBWO8ayx+
 MvMLoz6peLFjLKK/SPCOFq4XULHss8R/mpITKFv6LcvTgjXnRrkIJyJljPe7NTyByHI20nruLX
 O3E=
X-SBRS: 2.7
X-MesageID: 7732010
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,247,1569297600"; 
   d="scan'208";a="7732010"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 30 Oct 2019 16:09:37 +0000
Message-ID: <20191030160937.19420-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] xl guest creation: Pause 10s to work
 around libxl/blkback races
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
 Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gZWE2NjI2ZjdlZGQ5ZWI0MGEzNTEwZWFmNjgxNmE3N2NhYzRmNjNkMAogIGd1ZXN0X3ByZXBh
cmVfZGlzazogT25seSBkbyB0aGUgdW1vdW50IGlmIHdlIHNldCBhbiBlbnYgdmFyCndlIHJlbW92
ZWQgKGluIHRoZSB1c3VhbCBjYXNlKSBhIGNoZWNrIGZvciB0aGUgZ3Vlc3QgZGlzawphbHJlYWR5
IGJlaW5nIG1vdW50ZWQgaW4gZG9tMCBldGMuICBUaGlzIGNoZWNrIGlzIHRoZXJlIGZvcgphZC1o
b2MgdGVzdGluZy4KCldlIHJlbW92ZWQgaXQgYmVjYXVzZSBpdCBleHBvc2VzIHdoYXQgd2UgdGhp
bmsgaXMgYW4gYW5ub3lpbmcgcmFjZSBpbgpibGtiYWNrLgoKVW5mb3J0dW5hdGVseSB0aGlzIGNo
YW5nZSBzZWVtcyB0byBoYXZlIG1hZGUgZ3Vlc3QtcmFwaWQtcmVzdGFydCByYWNlcwp3b3JzZSBy
YXRoZXIgdGhhbiBiZXR0ZXIuICBTdGVwcyB0ZXN0LSogZ3Vlc3Qtc3RhcnQvZGViaWFuLnJlcGVh
dCBzZWVtCnRvIGZhaWwgYSBsb3QgbW9yZSBub3cuCgpXZSBhcmUgaW4gdGhlIHRocm9lcyBvZiBw
cmVwYXJpbmcgdGhlIFhlbiA0LjEzIHJlbGVhc2UuICBUaGVzZSBndWVzdApyZXN0YXJ0IHJhY2Vz
IGhhdmUgZXhpc3RlZCBmb3IgYSBsb25nIHRpbWUuCgpCb2RnZSB0aGlzIGZvciBub3cgYnkgYWRk
aW5nIGEgc2xlZXAgOi0vLgoKV2UgZG8gdGhpcyBpbiB0aGUgeGwgdG9vbHN0YWNrLCBkdXJpbmcg
ZG9tYWluIGNyZWF0aW9uLiAgQW5kIGFsc28gaW4KdGhlIGxpYnZpcnQgdG9vbHN0YWNrIGJlY2F1
c2UgdGhhdCB1c2VzIHhsIGJ1dCBkb2Vzbid0IGluaGVyaXQgdGhlCnNsZWVwIGZyb20gdGhlIE9z
c3Rlc3QgbW9kdWxlLgoKQ0M6IErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4KQ0M6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0
cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+Ci0tLQogT3NzdGVzdC9Ub29sc3RhY2svbGlidmlydC5wbSB8IDEgKwogT3NzdGVzdC9U
b29sc3RhY2sveGwucG0gICAgICB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L1Rvb2xzdGFjay9saWJ2aXJ0LnBtIGIvT3NzdGVzdC9U
b29sc3RhY2svbGlidmlydC5wbQppbmRleCBlODE3ZjViNC4uMjNjNzZjYzAgMTAwNjQ0Ci0tLSBh
L09zc3Rlc3QvVG9vbHN0YWNrL2xpYnZpcnQucG0KKysrIGIvT3NzdGVzdC9Ub29sc3RhY2svbGli
dmlydC5wbQpAQCAtNTUsNiArNTUsNyBAQCBzdWIgY3JlYXRlICgkJCkgewogICAgIG15ICRsY2Zn
ID0gJGNmZzsKICAgICAkbGNmZyA9fiBzLC8sLSxnOwogICAgICRsY2ZnID0gaG9zdG5hbWVwYXRo
KCRobykuIi0tJGxjZmciOworICAgIHNsZWVwKDEwKTsKICAgICB0YXJnZXRfY21kX3Jvb3QoJGhv
LCAidmlyc2ggZG9teG1sLWZyb20tbmF0aXZlIHhlbi14bCAkY2ZnID4gJGNmZy54bWwiLCAzMCk7
CiAgICAgdGFyZ2V0X2dldGZpbGVfcm9vdCgkaG8sNjAsIiRjZmcueG1sIiwgIiRzdGFzaC8kbGNm
ZyIpOwogICAgIHRhcmdldF9jbWRfcm9vdCgkaG8sICJ2aXJzaCBjcmVhdGUgLS1maWxlICRjZmcu
eG1sIiwgMTAwKTsKZGlmZiAtLWdpdCBhL09zc3Rlc3QvVG9vbHN0YWNrL3hsLnBtIGIvT3NzdGVz
dC9Ub29sc3RhY2sveGwucG0KaW5kZXggODU5NzI3NTMuLjUxN2IwZjRkIDEwMDY0NAotLS0gYS9P
c3N0ZXN0L1Rvb2xzdGFjay94bC5wbQorKysgYi9Pc3N0ZXN0L1Rvb2xzdGFjay94bC5wbQpAQCAt
NDMsNiArNDMsNyBAQCBzdWIgZGVzdHJveSAoJCQpIHsKIHN1YiBfY3JlYXRlICgkJCQpIHsKICAg
ICBteSAoJHNlbGYsJGdobywkb3B0aW9ucykgPSBAXzsKICAgICBteSAkY2ZnID0gJGdoby0+e0Nm
Z1BhdGh9OworICAgIHNsZWVwKDEwKTsKICAgICB0YXJnZXRfY21kX3Jvb3QoJHNlbGYtPntIb3N0
fSwKIAkJICAgICRzZWxmLT57X1ZlcmJvc2VDb21tYW5kfS4iIGNyZWF0ZSAkb3B0aW9ucyAkY2Zn
IiwgMTAwKTsKIH0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
