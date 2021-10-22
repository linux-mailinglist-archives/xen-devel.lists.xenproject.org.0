Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F23754375AB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 12:48:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214948.373825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mds5o-00066T-QM; Fri, 22 Oct 2021 10:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214948.373825; Fri, 22 Oct 2021 10:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mds5o-00063y-Mo; Fri, 22 Oct 2021 10:48:08 +0000
Received: by outflank-mailman (input) for mailman id 214948;
 Fri, 22 Oct 2021 10:48:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+2b=PK=citrix.com=lin.liu@srs-us1.protection.inumbo.net>)
 id 1mds5n-00063m-5r
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 10:48:07 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21454dcd-711d-45f6-b2d1-d1b3b29a4406;
 Fri, 22 Oct 2021 10:48:05 +0000 (UTC)
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
X-Inumbo-ID: 21454dcd-711d-45f6-b2d1-d1b3b29a4406
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634899685;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YF8TpPaAdoSQu2GCGdxKA8fc3NP57BlDMOKMVMon5SA=;
  b=SRPYZcH8DZ2BgpR4sxy3ugOO5jQ08YDStc/RDJYlFNBZWw800VpEDiMc
   S/gjj9S+Ka9+ZpuCN6luVHxxviYBzE6Pce135efTGdfTZbZg85ttui871
   6G0IrfovZHrlYR+B7oqLETWDue+vHQAJmdRuW/nz7EHxix89/MFjb28jo
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Fx7NTsVq5WQr3Y2Q0sk06Jet0f+0FOvd65lKHSqNX5FBe4kBmI/llBnQFjK27SXTwH0WqmRz/w
 3eUTQ7JN3H4FS4yhsQYcHixbLDaYNgBInv/6vOpzvxjneYK2k8hr27zYB/8yZLdahAON4ugzDa
 VQNwsPIlSfk8hVY1I8Yz9EPRS5rg3I2PNXsSPw/cVUfQAiBzhfTH0BYHQPOjcAhXd4cXarkSgH
 HwpoTbVLSGDFk16t/hQtrJQX50uKvyaiZTDTH2HSu9xeBgA3hDlhCAU9qHV5c5cir4a5+xaVZ9
 yrwcEa6EPmqXv0pyO6a5fcop
X-SBRS: 5.1
X-MesageID: 55376142
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1hiUSqM7bU9zSEHvrR3KkcFynXyQoLVcMsEvi/4bfWQNrUpz12ACy
 GtKUG7Vbv7YZ2r1KNwna9mw90tQ6pDWy4NgHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Ug5w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxaNoPRxz
 dpdib2hcQM2b6HDstwPVzANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/Yu1tgIInLdTDN4IDoHBwizreCJ7KRLieHv6Vu4YEhl/cgOhQAanEZ
 uYQNwNiQwjNYwBCA1Q1MbAxybLAan7XLGQD9QP9SbAMy3PI0AV73bzpMdzUUt+HX8NYmgCfv
 G2u12f+BAsTOJqAyD6G2nW2j+TLkGXwX4d6PIO/8vlmkViC3Fs5ARcdVUa4ifShg0v4UNVaQ
 2QL/gI+oK5081akJvH/Qhm5rXisrhMaHd1KHIUS5A6Bx6XO6i6FF2MESXhHc9Vgu8goLRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBsZQcd+NzivIEbhwrCVMp+C7WyisDpGDb22
 HaBqy1Wr7cZgNMP1q671UvamD/qrZ/MJiY0+Qf/Tm+j9hl+ZoOue8qv81ez0BpbBN/HFB/b5
 iFCwpXAqrBVZX2QqMCTaMYJI5Wp4vmVDBzNuVpwTpUu3Qy//1f2KOi8/wpCDEtuN88Ffxrgb
 0nSpR5d6fdvAZe6UUNkS9nuU5pynMAMAfygD6qONoMfPfCdYSfepHk2DXN8yVwBh6TFfUsXA
 pycbdq3RUgTDaBq3VJarM9MjOd1mEjSKY7VLK0XLihLM5LCOxZ5qp9faTNii9zVCove/G05F
 P4Eb6O3J+13CrGWX8Uu2dd7wao2BXY6H4vqjMdca/SOJAFrcEl4VaSNke94JNw9xPkE/gstw
 p1bchUEoLYYrSafQThml1g5MO+/NXqBhSJT0dMQ0aaAhCF4PNfHAFY3fJorZ7g3nNGPPtYvJ
 8Tpj/6oW6wVIhyeomx1RcCk8ORKKUT67SrTbnHNSGVuIPZdq/nhp4aMkv3Hr3JVUEJadKIW/
 tWd6+8sacNSHlo4VJ+LMK7HIpHYlSF1pd+elnDgerF7EHgAOqAzQ8AopvNoccwKNzvZwT6Wi
 1SfDRsC/LGfqI4p6tjZw6uDqt7xQed5G0NbGUjd7Kq3anaGrjbyn9cYXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtLyDej8lCv6FA3JFDvg6yV
 h7d89VWI+zRasjkDEQQNEwuaeHajaMYnTzb7PIUJkTm5XAooOrbABsKZxTV0X5TNrp4No8h0
 NwNgs9O5lztkAcuP/aHkjtQqzaGIEsfXvh1rZodGoLq1FYmkwkQfZzGBybqy5iTcNEQYFIyK
 zqZiaee1bRRwk3OLyg6GXTXhLcPgJ0PvFZBzUMYJkTPkd3A36dl0BpU+DUxbwJU0hQYjL4jZ
 jk1bxV4dfeU4jNlpMlfRGT9SQhOCSqQ9lH111ZUxnbSSFOlVzCVIWAwUQpXEJv1L46IkuBnw
 Yyl
IronPort-HdrOrdr: A9a23:K087u6qLDI6xqR7B7gn+Fj4aV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="55376142"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, George Dunlap <george.dunlap@citrix.com>,
	"Ian Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/7] Implement byteswap and update references
Date: Fri, 22 Oct 2021 10:47:21 +0000
Message-ID: <cover.1634897942.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit


The swab() is massively over complicated
Simplify it with compiler builtins and fallback to plain C function
if undefined.
Update components to switch to this new swap bytes.

Lin Liu (7):
  xen: implement byteswap.h
  crypto/vmac: Simplify code with byteswap.h
  arm64/find_next_bit: Remove ext2_swab()
  arm: Switch to byteswap.h
  xen/xsm: Switch to byteswap.h
  xen: Switch to byteswap.h
  byteorder: Remove byteorder

 xen/arch/arm/alternative.c                |   2 +-
 xen/arch/arm/arm64/lib/find_next_bit.c    |  40 +----
 xen/arch/arm/arm64/livepatch.c            |   2 +-
 xen/arch/arm/kernel.c                     |   2 +-
 xen/arch/arm/vgic/vgic-mmio.c             |   2 +-
 xen/common/bitmap.c                       |   2 +-
 xen/common/gdbstub.c                      |   2 +-
 xen/common/libelf/libelf-private.h        |   8 +-
 xen/common/lz4/defs.h                     |   2 +-
 xen/common/lzo.c                          |   2 +-
 xen/common/unlzo.c                        |   2 +-
 xen/common/xz/private.h                   |   4 +-
 xen/crypto/vmac.c                         |  76 +--------
 xen/drivers/char/ehci-dbgp.c              |   2 +-
 xen/include/asm-arm/arm32/io.h            |   2 +-
 xen/include/asm-arm/arm64/io.h            |   2 +-
 xen/include/asm-arm/byteorder.h           |  16 --
 xen/include/asm-x86/byteorder.h           |  36 -----
 xen/include/asm-x86/msi.h                 |   2 +-
 xen/include/xen/bitmap.h                  |   2 +-
 xen/include/xen/byteorder/big_endian.h    | 102 ------------
 xen/include/xen/byteorder/generic.h       |  68 --------
 xen/include/xen/byteorder/little_endian.h | 102 ------------
 xen/include/xen/byteorder/swab.h          | 183 ----------------------
 xen/include/xen/byteswap.h                |  93 +++++++++++
 xen/include/xen/compiler.h                |  12 ++
 xen/include/xen/device_tree.h             |   2 +-
 xen/include/xen/libfdt/libfdt_env.h       |   2 +-
 xen/include/xen/unaligned.h               |  14 +-
 xen/lib/divmod.c                          |   2 +-
 xen/xsm/flask/ss/avtab.c                  |   2 +-
 xen/xsm/flask/ss/conditional.c            |   2 +-
 xen/xsm/flask/ss/ebitmap.c                |   2 +-
 xen/xsm/flask/ss/policydb.c               |   2 +-
 34 files changed, 150 insertions(+), 646 deletions(-)
 delete mode 100644 xen/include/asm-arm/byteorder.h
 delete mode 100644 xen/include/asm-x86/byteorder.h
 delete mode 100644 xen/include/xen/byteorder/big_endian.h
 delete mode 100644 xen/include/xen/byteorder/generic.h
 delete mode 100644 xen/include/xen/byteorder/little_endian.h
 delete mode 100644 xen/include/xen/byteorder/swab.h
 create mode 100644 xen/include/xen/byteswap.h

-- 
2.27.0


