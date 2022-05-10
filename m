Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C825211F6
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 12:16:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325337.547889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noMuK-0005th-Tb; Tue, 10 May 2022 10:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325337.547889; Tue, 10 May 2022 10:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noMuK-0005pK-Q9; Tue, 10 May 2022 10:15:56 +0000
Received: by outflank-mailman (input) for mailman id 325337;
 Tue, 10 May 2022 10:15:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkLT=VS=citrix.com=prvs=122513738=lin.liu@srs-se1.protection.inumbo.net>)
 id 1noMuJ-000561-92
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 10:15:55 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b6f09a4-d04a-11ec-a406-831a346695d4;
 Tue, 10 May 2022 12:15:53 +0200 (CEST)
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
X-Inumbo-ID: 2b6f09a4-d04a-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652177753;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/Nhh6O3K3Agbq3nu1O78zNSNYAf52U6Xs2gVsrQwIMk=;
  b=b1FzRXq62AvVsdvGCyH+mov/xEhhYaO8O/JUFyPXWGez79fVzkt0HPzm
   SJWFsZtYSEhIvPfB4o7lME+llGA6ZXNZsW926+b6cH7jRcsjEZRv98VH8
   ksJXlCByqx9YSZ0jD+y7sD/oYBPAQhy6eEnRuhs6Joz34QQVUP4is3+uM
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73450891
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+XnD/6wXK1JbawCRDnt6t+e+xirEfRIJ4+MujC+fZmUNrF6WrkUBm
 mYWC27SOfuMNGH0eI9ya4SwoRgB6pKDzNJlHgBt+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY12IDhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npll4GZECp1IJH1ts89SkQDFgAvA7QbweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DOIIZ/HVh0BnSDOo8QICFSKLPjTNd9Ghr2p0WTaeHD
 yYfQT1wczHqe0NEA3RJL5Yalv2wh1LmdzIN/Tp5ooJoujOOnWSdyoPFK8HJc9aHQcFUmEewp
 W/c+Wn9RBYAO7S3yj2D6HugwPDOmSDTX5gbH7m1sPVthTW7+GsXDxEHUEqhltOwgEW+RtF3J
 lQd/2wlqq1a3FOvZsnwWVu/unHslhwBX9tdFcUq5QfLzbDbiy6VCWQJQSRIQMA3v88xAzox3
 xmGmM2BLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kbggrUS9d/EIa8ltDvBSzr2
 DeOsTQ/gLMIy8UM0s2T/1rKnjatrZjhVRMu60PcWWfNxgJmZqa1aoqw81/Z4P1caoGDQTG8U
 GMswpbEqrpUVNfUyXLLEL5l8KyVC+itEiD12HMzAaUY2R+N4iP4eKEB3igjHRI8WiobQgPBb
 EjWsAJXwZZcOnq2cKN6C76M59QWIbvIToq8CK2NBjZaSt0oLVLconkyDaKF9zq1+HXAh53TL
 ntynSyEKX8BQZpqwzOtLwv2+e96n3turY8/qH2S8vhG7VZ8TCPMIVvmGAHXBgzc0E9jiF+Mm
 +uzz+PQl31ivBTWO0E7C7I7I1EQNmQcDpvrscFRfePrClM4RTt4UaaOkeN9I9ENc0FpegDgp
 CrVZ6Ol4ACn2S2vxfuiNBiPl48Drb4g9ClmbETAzH6j2mQ5YJbH0UvsX8BfQFXTz8Q6laQcZ
 6BcI62oW60TIhyaqm91RcSs8+RfmOGD2Fvm09yNO2BvIfaNhmXhp7fZQ+cY3HNQUXDr5ZBu8
 9VNFGrzGPI+euirN+6OANrH8r97lSN1dD5aN6cQHuRuRQ==
IronPort-HdrOrdr: A9a23:dhdoR6kuisvMKGMujIlWtkvmY9TpDfIg3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7wr5OUtQ/exoV5PhfZqxz/JICOoqTNKftWvdyQiVxehZhOOIqVDd8kXFh4hgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208";a="73450891"
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
Subject: [PATCH v3 0/6] Implement byteswap and update references
Date: Tue, 10 May 2022 06:15:18 -0400
Message-ID: <cover.1652170719.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit


The swab() is massively over complicated
Simplify it with compiler builtins and fallback to plain C function
if undefined.
Update components to switch to this new swap bytes.

Lin Liu (6):
  xen: implement byteswap
  crypto/vmac: Simplify code with byteswap
  arm64/find_next_bit: Remove ext2_swab()
  xen: Switch to byteswap
  byteorder: Remove byteorder
  tools: Remove unnecessary header

 .../guest/xg_dom_decompress_unsafe_zstd.c     |   1 -
 xen/arch/arm/arm64/lib/find_next_bit.c        |  36 +---
 xen/arch/arm/include/asm/byteorder.h          |  14 +-
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
 xen/include/xen/compiler.h                    |  12 ++
 xen/include/xen/unaligned.h                   |  24 +--
 16 files changed, 167 insertions(+), 637 deletions(-)
 create mode 100644 xen/include/xen/byteorder.h
 delete mode 100644 xen/include/xen/byteorder/big_endian.h
 delete mode 100644 xen/include/xen/byteorder/generic.h
 delete mode 100644 xen/include/xen/byteorder/little_endian.h
 delete mode 100644 xen/include/xen/byteorder/swab.h
 create mode 100644 xen/include/xen/byteswap.h

-- 
2.27.0


