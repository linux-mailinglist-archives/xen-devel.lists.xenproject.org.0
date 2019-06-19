Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DEB4C22A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 22:15:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdgvg-0002gv-9i; Wed, 19 Jun 2019 20:11:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iLMg=US=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hdgvf-0002gq-9F
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 20:11:35 +0000
X-Inumbo-ID: 6dbfb49a-92ce-11e9-9033-cfaa0195547a
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6dbfb49a-92ce-11e9-9033-cfaa0195547a;
 Wed, 19 Jun 2019 20:11:31 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YrhAXwRLPvLda/EtfKvH42wMhIiTjvImc1V0U1nfoVhlSl24Fma9dkfdyMgt95ctn1ls5qh+em
 7mJ6zCJ6M/DZR9PU+ZV+jRRhqaG0fNK76V2zoD8zDIyMN+aH7bfJXgh9TYMQs9JF/os2SDRK0w
 44xo4+F81PCn4qwFJocnAAdhrG44ZbXMW4eu6RLfa+0lNn7l2pESlW5OvccIhM7MMXXW/LSYDC
 W/h5GMLVsocOVG9fsppwH3dF/Px3Aq5MdnlqoTowTWf4qkK7Zt5Wt072giWSmn6aaZPa2Awvnh
 e0A=
X-SBRS: 2.7
X-MesageID: 1992899
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,394,1557201600"; 
   d="scan'208";a="1992899"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 19 Jun 2019 21:11:23 +0100
Message-ID: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] xen/link: Fixes and improvements to Xen's
 linking
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
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggMSBjYW1lIGZyb20gUm9nZXIncyBvYnNlcnZhdGlvbiB0aGF0IGEgY2xhbmcvbGx2bS04
IGJpbmFyeSBkb2Vzbid0CmFjdHVhbGx5IGJvb3QuICBBbGwgb3RoZXIgcGF0Y2hlcyBhcmUgYW5j
aWxsYXJ5IGNsZWFudXAuCgpJJ20gYWZyYWlkIHRoYXQgSSB0aGluZyB3ZSBzdGlsbCBoYXZlIGZ1
cnRoZXIgcHJvYmxlbXM6CgphbmRyZXdjb29wQGFuZHJld2Nvb3A6L2xvY2FsL3hlbi5naXQveGVu
JCByZWFkZWxmIC1XUyB4ZW4tc3ltcwpUaGVyZSBhcmUgMjMgc2VjdGlvbiBoZWFkZXJzLCBzdGFy
dGluZyBhdCBvZmZzZXQgMHgxM2FhMGIwOgoKU2VjdGlvbiBIZWFkZXJzOgogIFtOcl0gTmFtZSAg
ICAgICAgICAgICAgVHlwZSAgICAgICAgICAgIEFkZHJlc3MgICAgICAgICAgT2ZmICAgIFNpemUg
ICBFUyBGbGcgTGsgSW5mIEFsCiAgWyAwXSAgICAgICAgICAgICAgICAgICBOVUxMICAgICAgICAg
ICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAgMDAwMDAwIDAwICAgICAgMCAgIDAgIDAKICBbIDFd
IC5yZWxvYyAgICAgICAgICAgIFBST0dCSVRTICAgICAgICBmZmZmODJkMDgwMDAwMDAwIDAwMTAw
MCAwMDAwMDggMDAgICBBICAwICAgMCAgNAogIFsgMl0gLnRleHQgICAgICAgICAgICAgUFJPR0JJ
VFMgICAgICAgIGZmZmY4MmQwODAyMDAwMDAgMjAxMDAwIDE2MTFiYSAwMCAgQVggIDAgICAwIDQw
OTYKICBbIDNdIC5yb2RhdGEgICAgICAgICAgIFBST0dCSVRTICAgICAgICBmZmZmODJkMDgwMzYy
MDAwIDM2MzAwMCAwYTI0ZTggMDAgV0FNUyAgMCAgIDAgMzIKICBbIDRdIC5nb3QucGx0ICAgICAg
ICAgIFBST0dCSVRTICAgICAgICBmZmZmODJkMDgwNDA0NGU4IDQwNTRlOCAwMDAwMTggMDAgIFdB
ICAwICAgMCAgOAogIFsgNV0gLm5vdGUuWGVuICAgICAgICAgTk9URSAgICAgICAgICAgIGZmZmY4
MmQwODA0MDQ1MDAgNDA1NTAwIDAwMDAxNCAwMCAgIEEgIDAgICAwICA0CiAgWyA2XSAubm90ZS5n
bnUuYnVpbGQtaWQgTk9URSAgICAgICAgICAgIGZmZmY4MmQwODA0MDQ1MTQgNDA1NTE0IDAwMDAy
NCAwMCAgIEEgIDAgICAwICA0CiAgWyA3XSAuaW5pdC50ZXh0ICAgICAgICBQUk9HQklUUyAgICAg
ICAgZmZmZjgyZDA4MDQwNTAwMCA0MDYwMDAgMDNiYWEzIDAwICBBWCAgMCAgIDAgMTYKICBbIDhd
IC5pbml0LmRhdGEgICAgICAgIFBST0dCSVRTICAgICAgICBmZmZmODJkMDgwNDQxMDAwIDQ0MjAw
MCAwMzg4NzggMDAgV0FNUyAgMCAgIDAgNDA5NgogIFsgOV0gLmRhdGEgICAgICAgICAgICAgUFJP
R0JJVFMgICAgICAgIGZmZmY4MmQwODA0N2EwMDAgNDdiMDAwIDAxODk4OCAwMCAgV0EgIDAgICAw
IDQwOTYKICBbMTBdIC5ic3MgICAgICAgICAgICAgIE5PQklUUyAgICAgICAgICBmZmZmODJkMDgw
NDk4MDAwIDQ5Mzk4OCAxM2ZhODAgMDAgIFdBICAwICAgMCAzMjc2OAogIFsxMV0gLmNvbW1lbnQg
ICAgICAgICAgUFJPR0JJVFMgICAgICAgIDAwMDAwMDAwMDAwMDAwMDAgNDkzOTg4IDAwMDA2MCAw
MSAgTVMgIDAgICAwICAxCiAgWzEyXSAuZGVidWdfc3RyICAgICAgICBQUk9HQklUUyAgICAgICAg
MDAwMDAwMDAwMDAwMDAwMCA0OTM5ZTggMDQ4OTg2IDAxICBNUyAgMCAgIDAgIDEKICBbMTNdIC5k
ZWJ1Z19sb2MgICAgICAgIFBST0dCSVRTICAgICAgICAwMDAwMDAwMDAwMDAwMDAwIDRkYzM2ZSAx
ZTU5MDUgMDAgICAgICAwICAgMCAgMQogIFsxNF0gLmRlYnVnX2FiYnJldiAgICAgUFJPR0JJVFMg
ICAgICAgIDAwMDAwMDAwMDAwMDAwMDAgNmMxYzczIDA0NzhkZSAwMCAgICAgIDAgICAwICAxCiAg
WzE1XSAuZGVidWdfaW5mbyAgICAgICBQUk9HQklUUyAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCA3
MDk1NTEgOTQ4YjM4IDAwICAgICAgMCAgIDAgIDEKICBbMTZdIC5kZWJ1Z19yYW5nZXMgICAgIFBS
T0dCSVRTICAgICAgICAwMDAwMDAwMDAwMDAwMDAwIDEwNTIwODkgMDFiNjUwIDAwICAgICAgMCAg
IDAgIDEKICBbMTddIC5kZWJ1Z19tYWNpbmZvICAgIFBST0dCSVRTICAgICAgICAwMDAwMDAwMDAw
MDAwMDAwIDEwNmQ2ZDkgMDAwMTVhIDAwICAgICAgMCAgIDAgIDEKICBbMThdIC5kZWJ1Z19saW5l
ICAgICAgIFBST0dCSVRTICAgICAgICAwMDAwMDAwMDAwMDAwMDAwIDEwNmQ4MzMgMTBmMzk2IDAw
ICAgICAgMCAgIDAgIDEKICBbMTldIC5kZWJ1Z19mcmFtZSAgICAgIFBST0dCSVRTICAgICAgICAw
MDAwMDAwMDAwMDAwMDAwIDExN2NiZDAgMDY5Y2EwIDAwICAgICAgMCAgIDAgIDgKICBbMjBdIC5z
eW10YWIgICAgICAgICAgIFNZTVRBQiAgICAgICAgICAwMDAwMDAwMDAwMDAwMDAwIDExZTY4NzAg
MTk4NWQwIDE4ICAgICAyMiA2OTYyMSAgOAogIFsyMV0gLnNoc3RydGFiICAgICAgICAgU1RSVEFC
ICAgICAgICAgIDAwMDAwMDAwMDAwMDAwMDAgMTM3ZWU0MCAwMDAwZTYgMDAgICAgICAwICAgMCAg
MQogIFsyMl0gLnN0cnRhYiAgICAgICAgICAgU1RSVEFCICAgICAgICAgIDAwMDAwMDAwMDAwMDAw
MDAgMTM3ZWYyNiAwMmIxODUgMDAgICAgICAwICAgMCAgMQoKV2l0aCB0aGlzIGZpeCBpbiBwbGFj
ZSwgSSBzZWUgdGhlIHVuZXhwZWN0ZWQgLnJlbG9jIHdoaWNoIFJvZ2VyIG5vdGljZWQsIGJ1dAp3
ZSd2ZSBnb3QgYSAuZ290LnBsdCBpbiB0aGVyZSB3aGljaCBzdXJlbHkgY2FuJ3QgYmUgY29ycmVj
dCwgZWl0aGVyLgoKQW5kcmV3IENvb3BlciAoNCk6CiAgeGVuL2xpbms6IENvcGUgd2l0aCAucm9k
YXRhLmNzdCogc2VjdGlvbnMKICB4ZW4vbGluazogTGluayAuZGF0YS5zY2hlZHVsZXJzIGFuZCBD
T05TVFJVQ1RFUlMgaW4gbW9yZSBhcHByb3ByaWF0ZSBsb2NhdGlvbnMKICB4ZW4vbGluazogRm9s
ZCAuZGF0YS5yZWFkX21vc3RseSBpbnRvIC5kYXRhCiAgeGVuL2xpbms6IE1pc2MgY2xlYW51cAoK
IHhlbi9hcmNoL2FybS9hcm0zMi9saWIvYXNzZW1ibGVyLmggfCAxOSArKy0tLS0tLS0tLS0tLS0t
LQogeGVuL2FyY2gvYXJtL3hlbi5sZHMuUyAgICAgICAgICAgICB8IDQzICsrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYveGVuLmxkcy5TICAgICAgICAg
ICAgIHwgMjggKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyNyBp
bnNlcnRpb25zKCspLCA2MyBkZWxldGlvbnMoLSkKCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
