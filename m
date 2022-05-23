Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36F0530C6D
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 11:53:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335656.559843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4k5-0003Bj-Fu; Mon, 23 May 2022 09:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335656.559843; Mon, 23 May 2022 09:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4k5-00038k-CS; Mon, 23 May 2022 09:52:49 +0000
Received: by outflank-mailman (input) for mailman id 335656;
 Mon, 23 May 2022 09:52:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HaIF=V7=citrix.com=prvs=1359a750d=lin.liu@srs-se1.protection.inumbo.net>)
 id 1nt4k3-0002dq-Ct
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 09:52:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18f05811-da7e-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 11:52:46 +0200 (CEST)
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
X-Inumbo-ID: 18f05811-da7e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653299566;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TVa+erymlQY+WbivPygOYiIdpa/oed2z8s+mtE7ohZw=;
  b=fufJeyRtKQqiT6V/2VV9glVz4xr1sea1UpyFxlVqi8EobIiGsVXaAoBZ
   MDJBhNPzZyEicbbMEnACM1TsxBsYTFUJTL9aeIoHKGo4cM6j24XCFfAKD
   TGci30+BA0ldFUe++RFLhHwVhYP7gnjwXOShqDYDIgoZQMugUik+woUB7
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71787721
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3qqAq6pc6bwtPWe5oqkNlbrEThheBmKMZRIvgKrLsJaIsI4StFCzt
 garIBnTOazcNmP0c9p+aIm08UsCsJTRxt5hTgJk+C02RXwQ9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvQ4
 4iq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBN/edgfsUAgVhTDxnbKthyJqAJ0mCrpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIyTDfS/InXLjIQrnQ5M8e1zA17ixLNamHO
 JpGNmA2BPjGSyFjBkxNEp4HpeStlz7gdmEDgnypq4NitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEhejJhyr3Hp0TEL6Q8eRji1megGcUDXU+a1y/pvWoj1+kbPhWI
 UcU5ykGoLA78QqgSdyVdwK8iG6JuFgbQdU4O+8n7ACAzILE7gDfAXILJhZLZcY6rsYwSXov3
 0WQgtLyLTV1tfueTnf13ruboT69IyE9MX4JZShCSxAMpdbkvukbnh/JC9puDqOxptn0Ai3rh
 SCHqjAkgLcehtJN0L+0lXjLmympp4TJZgct6x/LQ3m+6QdkeI+iYZfu4l/ehd5CJouESliKv
 FAfhtOTqusJCPmllTOPaPUAGqmz4PSIOyGahkRgd6TN7Bz0pSTlJ9oJpmgjegE5aa7oZAMFf
 mfa41JI+5YCIEL1cLYmZaWBLoMs/JX/QIGNuu/vUjZeXnRgXFbZoXo0Ph7AhDqFfFsEyv9mZ
 8rCGSq4JTNDUPk8kmLrLwsI+eVzrh3S018/UnwSI/6P9bOFLECYRr4eWLdlRrBotfjUyOk5H
 js2Cidr9/m8eLenCsUv2dRPRW3m1FBibXwMl+RZd/SYPi1tE3w7BvnazNsJItI4xP4JyruRp
 CnkCie0LWYTYlWedG23ho1LMuuzDf6TU1plVcDTAbpY8yd6Otv+hEvuX5A2YaMm5IReIQ1cF
 pE4lzG7Kq0XEFzvom1FBbGk9dwKXEn63mqmYnv6CAXTirY9HmQlDPe/JluxnMTPZwLq3fYDT
 0qIjVOKHcFZHl09ZCsUAdr2p26MUbEmsLoadyP1zhN7JC0ALKACx/TNs8IK
IronPort-HdrOrdr: A9a23:iAAjva+Q/lPzsNJ544Juk+DWI+orL9Y04lQ7vn2YSXRuE/Bw8P
 re+sjztCWE7wr5N0tQ+uxoVJPufZq+z+8Q3WByB8bBYOCOggLBR+sOgbcKqweQYhEWndQ86U
 4PScZD4aXLfD1Hsfo=
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="71787721"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, George Dunlap <george.dunlap@citrix.com>,
	"Ian Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 0/6]  Implement byteswap and update references
Date: Mon, 23 May 2022 05:52:16 -0400
Message-ID: <cover.1653295437.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit


Lin Liu (6):
  xen: implement byteswap
  crypto/vmac: Simplify code with byteswap
  arm64/find_next_bit: Remove ext2_swab()
  xen: Switch to byteswap
  tools: Use new byteswap helper
  byteorder: Remove byteorder

 .../libs/guest/xg_dom_decompress_unsafe_xz.c  |   5 +
 .../guest/xg_dom_decompress_unsafe_zstd.c     |   3 +-
 xen/arch/arm/arm64/lib/find_next_bit.c        |  36 +---
 xen/arch/arm/include/asm/byteorder.h          |   6 +-
 xen/arch/x86/include/asm/byteorder.h          |  34 +---
 xen/common/device_tree.c                      |  44 ++---
 xen/common/libelf/libelf-private.h            |   6 +-
 xen/common/xz/private.h                       |   2 +-
 xen/crypto/vmac.c                             |  76 +-------
 xen/include/xen/byteorder.h                   |  56 ++++++
 xen/include/xen/byteorder/big_endian.h        | 102 ----------
 xen/include/xen/byteorder/generic.h           |  68 -------
 xen/include/xen/byteorder/little_endian.h     | 102 ----------
 xen/include/xen/byteorder/swab.h              | 183 ------------------
 xen/include/xen/byteswap.h                    |  44 +++++
 xen/include/xen/compiler.h                    |  24 +++
 xen/include/xen/lib.h                         |   4 -
 xen/include/xen/unaligned.h                   |  12 +-
 18 files changed, 180 insertions(+), 627 deletions(-)
 create mode 100644 xen/include/xen/byteorder.h
 delete mode 100644 xen/include/xen/byteorder/big_endian.h
 delete mode 100644 xen/include/xen/byteorder/generic.h
 delete mode 100644 xen/include/xen/byteorder/little_endian.h
 delete mode 100644 xen/include/xen/byteorder/swab.h
 create mode 100644 xen/include/xen/byteswap.h

-- 
2.27.0


