Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A246151FCAC
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 14:25:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324458.546514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no2RN-00062Q-5a; Mon, 09 May 2022 12:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324458.546514; Mon, 09 May 2022 12:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no2RN-0005vV-1R; Mon, 09 May 2022 12:24:41 +0000
Received: by outflank-mailman (input) for mailman id 324458;
 Mon, 09 May 2022 12:24:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JH+5=VR=citrix.com=prvs=12132ff7f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1no2RL-0005qB-Cm
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 12:24:39 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc806ad4-cf92-11ec-a406-831a346695d4;
 Mon, 09 May 2022 14:24:36 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: fc806ad4-cf92-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652099076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BQHAL2/JZ7BiUyF6Ggb3MxDFFtfKott8B5+vLAiqkKM=;
  b=IrxhVwgaoSRLRJlxtcAUD2G2lfnSR7+Y3fNfwj4qrXE92pl5ObbED8Bi
   r7moyFY/qQY/gJxPGWs+Hya2l/nAXpiGChLcJ+EUhOqYHvGlt/UqEbHIm
   a7hkdksFVezwoJC8SNYxorRMSCZIufqGEC+km2lsrm0QgABqvpdHn20fA
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70895895
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MPrh06gOIz0p/RjHJP1zqgkRX161qRAKZh0ujC45NGQN5FlHY01je
 htvWWqEP/vbN2qgKNxzYY3npkICv5GBzNUwGwo6rng1EyMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlvc4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YTknYrLOoPUiakNzKS1MAK4dpOXkAmfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xNmI/PUmQMkAn1lE/B4kUkfqahnXDLRIEtRWXpI8Hv0zpw1kkuFTqGIWMIYHbLSlPpW6au
 2bH8mLREhwcctuFxlKtzHWogePemDLhb6gbHra46/1CjUWawyoYDxh+fVG2u+Wjg0iyHddWM
 VUJ+zEGpLI3skesS7HVQBmQsHOC+BkGVLJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vLLzFytLyeSVqG66yZ6zi1PEA9NnQebCUJSQ8E5djLo4wpiB/LCNF5H8aIYsbdQG+qh
 WrQ9W5n2utV3ZVjO7iHEU7vvTzwuZrxXzEMvC7tUlCY7VglPq2GeNn9gbTE1spoIIGcR1iHm
 XELncmC8ewDZa2weDyxrPYlR+/wuavcWNHIqRs2RsR6qWzxk5K2VdoIiAySMnuFJSrtldXBR
 EbI8T1c65ZIVJdBRf8mOtnhYyjGIEWJKDgEahw2RocVCnSSXFXelM2LWaJ39zq0+HXAaYllZ
 f+mnT+EVB7285hPwjusXPs62rQ23C04zm67bcmlkk7/jOHPPCPKE+ht3L6yggcRtvjsneko2
 4wHa5viJ+t3DoUSnRU7AaZMdAtXfBDX9Lj9qtBNd/7rH+aVMDpJNhMl+pt4I9YNt/0Mzo/gp
 yjhMmcFmQGXrSCWdm23hoVLNeqHsWBX9iprY0TB/D+AhhAeXGpYxPpBJ8ZvIel7pYSOD5dcF
 pE4RilJOdwXIhyvxtjXRcKVQFBKHPhzuT+zAg==
IronPort-HdrOrdr: A9a23:GYvOeaCjKkr8nWXlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.91,211,1647316800"; 
   d="scan'208";a="70895895"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 1/3] x86/p2m.h: Add include guards
Date: Mon, 9 May 2022 13:24:07 +0100
Message-ID: <20220509122409.14184-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220509122409.14184-1-andrew.cooper3@citrix.com>
References: <20220509122409.14184-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Spotted by Eclair MISRA scanner.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/x86/mm/p2m.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
index cc0f6766e4df..dc706b8e4799 100644
--- a/xen/arch/x86/mm/p2m.h
+++ b/xen/arch/x86/mm/p2m.h
@@ -15,6 +15,9 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#ifndef __ARCH_MM_P2M_H__
+#define __ARCH_MM_P2M_H__
+
 struct p2m_domain *p2m_init_one(struct domain *d);
 void p2m_free_one(struct p2m_domain *p2m);
 
@@ -39,6 +42,8 @@ int ept_p2m_init(struct p2m_domain *p2m);
 void ept_p2m_uninit(struct p2m_domain *p2m);
 void p2m_init_altp2m_ept(struct domain *d, unsigned int i);
 
+#endif /* __ARCH_MM_P2M_H__ */
+
 /*
  * Local variables:
  * mode: C
-- 
2.11.0


