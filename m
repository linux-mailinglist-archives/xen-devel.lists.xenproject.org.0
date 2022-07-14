Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 395AE5750F8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 16:40:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367664.598767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBzzt-00032Y-05; Thu, 14 Jul 2022 14:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367664.598767; Thu, 14 Jul 2022 14:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBzzs-0002zc-TY; Thu, 14 Jul 2022 14:39:20 +0000
Received: by outflank-mailman (input) for mailman id 367664;
 Thu, 14 Jul 2022 14:39:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SkWo=XT=citrix.com=prvs=1879e8f0d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oBzzr-0002UF-AM
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 14:39:19 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcdc8d90-0382-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 16:39:18 +0200 (CEST)
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
X-Inumbo-ID: bcdc8d90-0382-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657809558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dERAYYpHGNdDoJC+KVVotxHQ1VnjUBp5rhHFM0sXzE4=;
  b=MCK7bo/vXRh/8qb5578TiMBgnU8smrPJn9woVb8DeQdq1pPIr8TduhaM
   kOuhHxJJfIEvRuymF+z5bmX6bsr7chnRXwLYcaNhxL2ycEAD4kdtfWn6o
   VnUQdKTNDuTcpXrjJU9FtzMtfbT3sTg23AMUxTX8l1CdXeo2QExuYoZAU
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75798792
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AiXDNOq6KkQbvo+zrfQ9WOwxR2vbMJYB3ticv2?=
 =?us-ascii?q?ybIaGNq3BzvzP6J+z/mGEsNoGQgghEXUqHF+SBmUu4agP2hTNrF5aKgZyR3R?=
 =?us-ascii?q?4P4GA0qI50YOLPjud6PHCHi/1pOz2/MjEBijBIvfJmnoJTSD1r450U94P76C?=
 =?us-ascii?q?xccJKfJwXAzxWyrM2mO8kNp34j21uwmza5YK9eBcDdZSSM+Oq8WgedLlLy7L?=
 =?us-ascii?q?ilHHkFyRhaeczJEz38cw76laVo7i5/olpY3zrGbZTnTuBmPOdoJkVvFfxEnV?=
 =?us-ascii?q?VVg360t0pFhwiBmhiHjbr8cMbtbjo+MxvjrSTtQ14DTU7v0YL5xmn7tVwsVS?=
 =?us-ascii?q?2OnkB7RrGaQ5kH5IjXSUlG/oWRqcQwqOaK1Wu1D3LpBxiW87lG3SAH5N/fg3?=
 =?us-ascii?q?oRM6/k6U0A3yZsiFP/omaov9OXhyoMRQxzp9yi5up3rlFIdv7ZUq/7JYNBaS?=
 =?us-ascii?q?TFeeQkGSGtzhx4zrXhFnn0YOA4mZiCDtojdWaPEMBCDvwQ6QqXpy+elXXQ/g?=
 =?us-ascii?q?x1oLtf2l+HpiQTTor8PWQ4yo3x/Oqr0Sg35Bc1nPIdFSRt6HuHuCJfQYiQ08?=
 =?us-ascii?q?w6HbeZW6pBqLiki3YtecajmBOYxITr/jx5q6xJcUx+WXKM1xFd06B5FJhu7t?=
 =?us-ascii?q?nfxxu15URlUMPknFdmkspJXfiF7qud+m3xHtW71NRIIvJmK7VFqXJ+Wg52VW?=
 =?us-ascii?q?jyn/yEiGdx2UDbbVA+K58z3qEBXqILxEAe0rZl31CuexgqYcEx/JzWHO7RJi?=
 =?us-ascii?q?aG1BsMypDww2+Ctw3jArzZSDYwprMvqIK52uoFFsa+yx+sr3WePRvXhZEDjz?=
 =?us-ascii?q?1+vkGAlqZabNYYD+LOuApdGy3riUzitx/RAutaEd0mzgL/pPqsjfexIqW+ZS?=
 =?us-ascii?q?gZEiWr+dsk2pZLOydjULJVD461dtZ8grF6Z+m8wZZ5Ov0+1bhapbMrJfpZWL?=
 =?us-ascii?q?doseUGY+fzqJ5NfxXM3KpfHYmp9+gF4q4cY/muCm4bSf5uDqLmgLCgsZBHue?=
 =?us-ascii?q?qzJl+10Yu113VgXABjO2LHFgBS50AyD6yFpLouno96OnKWIHpgazx1eYm3FL?=
 =?us-ascii?q?lysRNNOKBnYX0H50hkcqRk0wzKiLmbFcbcGrbX7SLTUW8wZMxjCGb9akKAkh?=
 =?us-ascii?q?k1IxWVVWHhlmqk/UVjb7aWW+B1ano2yMj7/CUJS4Grry3hvnC2LzoqgIHgzx?=
 =?us-ascii?q?u6N7odaA2a+di3sbKRddy7tRFx+yBkY0IQY8tQEPB1TsAd2ys0jqHUPcAJN6?=
 =?us-ascii?q?sbdt6k+/donjUuCNZVjrrdykKysV3cfq6SOrS3pEcDDzmLMpk0ziNb6kTQ4w?=
 =?us-ascii?q?GQPQKK4XsyWw3J3PCn/2epLQ8rCnGhthvhKH1GI1LShfXi0rW0J7gFP8J5MO?=
 =?us-ascii?q?HRdV1H9CbTPH4SfN2jp8Fd1MN4nXmnl9l0tGEs8PH+qA2EFrrVWjYm0sxoKR?=
 =?us-ascii?q?5RXYtt+mptl4HJ8qNpRyn7npjZ/uDOuollSs0bfVNmqykJhB2NOl7mBtHQef?=
 =?us-ascii?q?tf73jofkSS0mxpjNvUsnM0s2ygxP1+pR9KSpoaaZL3oCwGEiIGV5Wkh9sBNY?=
 =?us-ascii?q?Sxhej1vviDMHN2RLZL9e8S1xzMxmOSpD62qABxPfd6LjZcL5fbgaA8ab2YMo?=
 =?us-ascii?q?aDZHnZrMUD8bA2jXfBFsQjjHKbBlT0n1A9C5H/Y1yuCWjMyeFHzKl4f6+FoW?=
 =?us-ascii?q?hd9unqNCoL33o1SYNALpcXZU1UZHma4igo9ZrCbTunGR5akx/UHsIEs4DOaK?=
 =?us-ascii?q?j4x7yH2Z2VhlFcazZZ2mnkG34hGn0wGhw8v5UC+Q3neOxqmISh9K1dlbgiru?=
 =?us-ascii?q?XfsWLNvo/0+2sUja72gij3XPraCtI5xYsV3GupDCZPDgDfbgQzsDa2K1BuJ7?=
 =?us-ascii?q?VsEDaxA6PQGM0fqS3pnUADPKDVVQL2WAalt7g7lKPJs+Z13EBOV5IXKuDgCQ?=
 =?us-ascii?q?ct4MiYmtrbW+x0oI5Soaf0fRTCfB/LS50VMy5+wyr2NsavrM5kp1ADi+lH88?=
 =?us-ascii?q?D5kqqSW/VhTiN47vCZqjgqj07CLlxWwsJ1581JirwIgPbS5qtnFsA4Uvqlfa?=
 =?us-ascii?q?lNjRWUuZAgkqebKxXnlWXDLka4PR8ZzvvyzEIhhQSAmlFNk8vXkyQlGFxJjW?=
 =?us-ascii?q?r7IvBFRCd2jYBKCRcpji3lf/QMlMqGyf0/NWLI5c1DLZ17G2lby2Qt0E5qyK?=
 =?us-ascii?q?DRffaxLuzNLZDBHD5Dojtwmi+MZed/VOpqDOwluqHBkE+JR9kzBzh2U+Vyep?=
 =?us-ascii?q?KWMptqQfgdPS5L2Vy9C1+EamuGik82R04s7amRdx1Suxadg22Rvp4PlEmQTO?=
 =?us-ascii?q?pCJSr0yu0yY6os1Bnxp2g5JvkAjzxeeSVTNOue9pHFY7ncuzj9fD+td6g8D+?=
 =?us-ascii?q?eNHKh12p3DH9pCBSvnbXHIPXzYTafac/038UE3jmRucQCpfieuSAPRyz5bVZ?=
 =?us-ascii?q?1H98P92BOlgPp8x5MEEGYaCio3Ph+L4/DMQ65lgVrkwjAjF57FXZRVnrUzC/?=
 =?us-ascii?q?ANrWbN3ovroCIbU/1LkokPJN8gho7oGakmtIhh8IbIFzSKJSrqN2+Qfwk74n?=
 =?us-ascii?q?8yIU5kdCfvF3OAJpar+5bFZMGdnVyfZ26SLQUHprSuKaNSoYVhCYdrL7cJKl?=
 =?us-ascii?q?WBlsMF3q+7VXCU2c1uAthfhHZ+IipvH2z7yAfsjhgaC7r72T+wTEZ320bljA?=
 =?us-ascii?q?h0kI08wVsJbq3YZtj+uB+qxn4itMlnc/VAFyYsOgYFRW4C+4Csf0gWwjpxJS?=
 =?us-ascii?q?wi6lGrVYebNFWpR4zS58cwXjangMABpudta8CfCUpgKAQ4y6ah/qbx3DLMAM?=
 =?us-ascii?q?qrmkmtasd8q/rRacCdYyN7h+Qm0B0UHbIRw412VaWF4jEjK1ewdc/5CrGlZt?=
 =?us-ascii?q?DWngAiTR1wW3g=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.92,271,1650945600"; 
   d="scan'208";a="75798792"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/2] xen: Introduce $AWK in check-endbr
Date: Thu, 14 Jul 2022 15:39:07 +0100
Message-ID: <20220714143907.25938-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220714143907.25938-1-anthony.perard@citrix.com>
References: <20220714143907.25938-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/tools/check-endbr.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/tools/check-endbr.sh b/xen/tools/check-endbr.sh
index 64fa9a56b7..523797a15f 100755
--- a/xen/tools/check-endbr.sh
+++ b/xen/tools/check-endbr.sh
@@ -10,6 +10,7 @@ MSG_PFX="${0##*/} ${1##*/}"
 OBJCOPY="${OBJCOPY:-objcopy}"
 OBJDUMP="${OBJDUMP:-objdump}"
 ADDR2LINE="${ADDR2LINE:-addr2line}"
+AWK="${AWK:-awk}"
 
 D=$(mktemp -d)
 trap "rm -rf $D" EXIT
@@ -64,7 +65,7 @@ ${OBJDUMP} -j .text $1 -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
 #    numbers, which don't lose precision.
 #
 eval $(${OBJDUMP} -j .text $1 -h |
-    awk '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 8), substr($4, 9, 16)}')
+    $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 8), substr($4, 9, 16)}')
 
 ${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
 
@@ -78,7 +79,7 @@ then
 else
     grep -aob -e "$(printf '\363\17\36\372')" -e "$(printf '\363\17\36\373')" \
          -e "$(printf '\146\17\37\1')" $TEXT_BIN
-fi | awk -F':' '{printf "%s%x\n", "'$vma_hi'", int('$((0x$vma_lo))') + $1}' > $ALL
+fi | $AWK -F':' '{printf "%s%x\n", "'$vma_hi'", int('$((0x$vma_lo))') + $1}' > $ALL
 
 # Wait for $VALID to become complete
 wait
-- 
Anthony PERARD


