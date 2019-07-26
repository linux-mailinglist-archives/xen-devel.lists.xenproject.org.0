Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A823769D5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:54:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0eP-0000QE-8P; Fri, 26 Jul 2019 13:52:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOBC=VX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hr0eO-0000Pg-26
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:52:48 +0000
X-Inumbo-ID: a52b1a82-afac-11e9-9586-d3709a2e07ee
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a52b1a82-afac-11e9-9586-d3709a2e07ee;
 Fri, 26 Jul 2019 13:52:45 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EjQuVhwRieW+cRMWLFJAMF8i/ttFaOQQvZ6lL2y5i/Gu7jqlUxoVXEPAp6KfzGraTXZMJjz4GG
 fkR6mbjAc3tuHKTthxahGlyei4lUucI5lbJhkKEv9hjO9o3A2JpIW2Q9koEyGfRFIJPdaGBnhY
 rua3CSEZmjx5r0ve3X63ulxD+UA7Ze5Il6E7dnYNpSBHsr1Kg1Gop097FmrO0gYcirYXkvZVaY
 qZy/fUh0QLmDLA/ldpoVhMl61gqZvbN60m3TO6fBM6GvT4BhhHfPm966N3IvetNvY93wqS6o9Z
 Rq4=
X-SBRS: 2.7
X-MesageID: 3474414
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,311,1559534400"; 
   d="scan'208";a="3474414"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 26 Jul 2019 14:52:39 +0100
Message-ID: <20190726135240.21745-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190726135240.21745-1-andrew.cooper3@citrix.com>
References: <20190726135240.21745-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] xen/link: Introduce .bss.percpu.page_aligned
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnV0dXJlIGNoYW5nZXMgYXJlIGdvaW5nIHRvIG5lZWQgdG8gcGFnZSBhbGlnbiBzb21lIHBlcmNw
dSBkYXRhLgoKVGhpcyBtZWFucyB0aGF0IHRoZSBwZXJjcHUgYXJlYSBuZWVkcyBzdWlhYmx5IGFs
aWduaW5nIGluIHRoZSBCU1Mgc28gQ1BVMCBoYXMKY29ycmVjdGx5IGFsaWduZWQgZGF0YS4gIFNo
dWZmbGUgdGhlIGV4YWN0IGxpbmsgb3JkZXIgb2YgaXRlbXMgd2l0aGluIHRoZSBCU1MKdG8gZ2l2
ZSAuYnNzLnBlcmNwdS5wYWdlX2FsaWduZWQgYXBwcm9wcmlhdGUgYWxpZ25tZW50LgoKQWRkaXRp
b25hbGx5LCBpbnRyb2R1Y2UgREVGSU5FX1BFUl9DUFVfUEFHRV9BTElHTkVEKCkKClNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzog
SmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4K
Q0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDQzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KQ0M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1
a0BlcGFtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0veGVuLmxkcy5TICAgfCA1ICsrKy0tCiB4ZW4v
YXJjaC94ODYveGVuLmxkcy5TICAgfCA1ICsrKy0tCiB4ZW4vaW5jbHVkZS94ZW4vcGVyY3B1Lmgg
fCAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0veGVuLmxkcy5TIGIveGVuL2FyY2gvYXJtL3hlbi5s
ZHMuUwppbmRleCAxMmMxMDdmNDVkLi4wN2NiZGYyNTQzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9h
cm0veGVuLmxkcy5TCisrKyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMKQEAgLTIwMSwxNCArMjAx
LDE1IEBAIFNFQ1RJT05TCiAgICAgICAgKiguYnNzLnN0YWNrX2FsaWduZWQpCiAgICAgICAgLiA9
IEFMSUdOKFBBR0VfU0laRSk7CiAgICAgICAgKiguYnNzLnBhZ2VfYWxpZ25lZCkKLSAgICAgICAq
KC5ic3MpCi0gICAgICAgLiA9IEFMSUdOKFNNUF9DQUNIRV9CWVRFUyk7CiAgICAgICAgX19wZXJf
Y3B1X3N0YXJ0ID0gLjsKKyAgICAgICAqKC5ic3MucGVyY3B1LnBhZ2VfYWxpZ25lZCkKICAgICAg
ICAqKC5ic3MucGVyY3B1KQogICAgICAgIC4gPSBBTElHTihTTVBfQ0FDSEVfQllURVMpOwogICAg
ICAgICooLmJzcy5wZXJjcHUucmVhZF9tb3N0bHkpCiAgICAgICAgLiA9IEFMSUdOKFNNUF9DQUNI
RV9CWVRFUyk7CiAgICAgICAgX19wZXJfY3B1X2RhdGFfZW5kID0gLjsKKyAgICAgICAqKC5ic3Mp
CisgICAgICAgLiA9IEFMSUdOKFNNUF9DQUNIRV9CWVRFUyk7CiAgICAgICAgX19ic3NfZW5kID0g
LjsKICAgfSA6dGV4dAogICBfZW5kID0gLiA7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVu
Lmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwppbmRleCBhNzMxMzljZDI5Li5iOGEyZWE0
MjU5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TCisrKyBiL3hlbi9hcmNoL3g4
Ni94ZW4ubGRzLlMKQEAgLTI5MywxNCArMjkzLDE1IEBAIFNFQ1RJT05TCiAgICAgICAgX19ic3Nf
c3RhcnQgPSAuOwogICAgICAgICooLmJzcy5zdGFja19hbGlnbmVkKQogICAgICAgICooLmJzcy5w
YWdlX2FsaWduZWQqKQotICAgICAgICooLmJzcykKLSAgICAgICAuID0gQUxJR04oU01QX0NBQ0hF
X0JZVEVTKTsKICAgICAgICBfX3Blcl9jcHVfc3RhcnQgPSAuOworICAgICAgICooLmJzcy5wZXJj
cHUucGFnZV9hbGlnbmVkKQogICAgICAgICooLmJzcy5wZXJjcHUpCiAgICAgICAgLiA9IEFMSUdO
KFNNUF9DQUNIRV9CWVRFUyk7CiAgICAgICAgKiguYnNzLnBlcmNwdS5yZWFkX21vc3RseSkKICAg
ICAgICAuID0gQUxJR04oU01QX0NBQ0hFX0JZVEVTKTsKICAgICAgICBfX3Blcl9jcHVfZGF0YV9l
bmQgPSAuOworICAgICAgICooLmJzcykKKyAgICAgICAuID0gQUxJR04oU01QX0NBQ0hFX0JZVEVT
KTsKICAgICAgICBfX2Jzc19lbmQgPSAuOwogICB9IDp0ZXh0CiAgIF9lbmQgPSAuIDsKZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9wZXJjcHUuaCBiL3hlbi9pbmNsdWRlL3hlbi9wZXJjcHUu
aAppbmRleCBhZWVjNWMxOWQ2Li5jNTI5MWRjNWU5IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94
ZW4vcGVyY3B1LmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3BlcmNwdS5oCkBAIC0xMCw2ICsxMCw4
IEBACiAgKiBtYWNybyBleHBhbmRlZCwgd2hpbGUgc3RpbGwgYWxsb3dpbmcgYSBwZXItYXJjaGl0
ZWN0dXJlIHN5bWJvbCBuYW1lIHByZWZpeC4KICAqLwogI2RlZmluZSBERUZJTkVfUEVSX0NQVSh0
eXBlLCBuYW1lKSBfX0RFRklORV9QRVJfQ1BVKHR5cGUsIF8jI25hbWUsICkKKyNkZWZpbmUgREVG
SU5FX1BFUl9DUFVfUEFHRV9BTElHTkVEKHR5cGUsIG5hbWUpIFwKKwlfX0RFRklORV9QRVJfQ1BV
KHR5cGUsIF8jI25hbWUsIC5wYWdlX2FsaWduZWQpCiAjZGVmaW5lIERFRklORV9QRVJfQ1BVX1JF
QURfTU9TVExZKHR5cGUsIG5hbWUpIFwKIAlfX0RFRklORV9QRVJfQ1BVKHR5cGUsIF8jI25hbWUs
IC5yZWFkX21vc3RseSkKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
