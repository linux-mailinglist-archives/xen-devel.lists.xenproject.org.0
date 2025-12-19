Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8022CCE1CD
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 02:02:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190356.1510839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWOsQ-0007qR-9Q; Fri, 19 Dec 2025 01:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190356.1510839; Fri, 19 Dec 2025 01:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWOsQ-0007mW-6O; Fri, 19 Dec 2025 01:01:50 +0000
Received: by outflank-mailman (input) for mailman id 1190356;
 Fri, 19 Dec 2025 01:01:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lTMo=6Z=ariadne.space=ariadne@srs-se1.protection.inumbo.net>)
 id 1vWOsO-00072l-81
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 01:01:48 +0000
Received: from outbound.ci.icloud.com (ci-2006c-snip4-5.eps.apple.com
 [57.103.90.156]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 491378aa-dc76-11f0-b15b-2bf370ae4941;
 Fri, 19 Dec 2025 02:01:45 +0100 (CET)
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-central-1k-100-percent-9 (Postfix) with ESMTPS id
 379DA1800976; Fri, 19 Dec 2025 01:01:41 +0000 (UTC)
Received: from phoebe.my.domain (unknown [17.57.156.36])
 by p00-icloudmta-asmtp-us-central-1k-100-percent-9 (Postfix) with ESMTPSA id
 581AD1800950; Fri, 19 Dec 2025 01:01:36 +0000 (UTC)
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
X-Inumbo-ID: 491378aa-dc76-11f0-b15b-2bf370ae4941
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space; s=sig1; bh=k/sGFpxfsXXE4bG/gLuHDwciH+XbI6Fj1Tr7xEr6v5E=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=l08dQAmdWxd78K9aTsjzZqQqJP20hlqWzb9XcSdc7O2beVBuqN5KJLLi68TMY5qS3fivMURmk7JkWRnxMmF4L3YuWUxVC9qvV+/fEn32BrjLmkzqUXSMNRl/vnbFhLl8xGPUvMscAb+1/axGSaDjH75cNi4BYfUPhH7/YYeauqNLp072Wrgt6RTYflDXEATzONN2x4pbf9KLjAU0C3UZelUN19B+1oS9Ijh/+RNVOeSRL9KG4EGn9AQFXdYKrXNTGBes2WRj4MO2FCfyk8ZZiITj/CHDF4nnvlKPho8nAFMcSl/DZ/aZccu5gJcGqcVKMeN7TWZ6LFxa5ukT3Jyr4Q==
mail-alias-created-date: 1688796967087
From: Ariadne Conill <ariadne@ariadne.space>
To: linux-kernel@vger.kernel.org
Cc: mario.limonciello@amd.com,
	darwi@linutronix.de,
	sandipan.das@amd.com,
	kai.huang@intel.com,
	me@mixaill.net,
	yazen.ghannam@amd.com,
	riel@surriel.com,
	peterz@infradead.org,
	hpa@zytor.com,
	x86@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	Ariadne Conill <ariadne@ariadne.space>,
	xen-devel@lists.xenproject.org,
	stable@vger.kernel.org
Subject: [PATCH] x86/CPU/AMD: avoid printing reset reasons on Xen domU
Date: Thu, 18 Dec 2025 17:01:31 -0800
Message-ID: <20251219010131.12659-1-ariadne@ariadne.space>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info: v=2.4 cv=EvbfbCcA c=1 sm=1 tr=0 ts=6944a3f6 cx=c_apl:c_pps
 a=2G65uMN5HjSv0sBfM2Yj2w==:117 a=2G65uMN5HjSv0sBfM2Yj2w==:17
 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=cWRNjhkoAAAA:8 a=VwQbUJbxAAAA:8
 a=64mAIdLp92yHhwu-ie0A:9 a=sVa6W5Aao32NNC1mekxh:22
X-Proofpoint-ORIG-GUID: 1g18WFCENcLrMa1DtA2XBcKaizFIFmka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAwNSBTYWx0ZWRfX/XpCqHGo7QO8
 XVEEd3U/KM52M38w2R3bbNH4op/A1zG3zWse8yplnN98hfQQ5GScFAaMWZDNnLjSsobxsn9wtMv
 oQD4cfxn1mcvBW42+XnjIq0uudpEieWbdtuH9wxL27zMjW38iPPiqYyOSazNxAL2Tflxazp73XC
 o6ltxRDRu65VSwW8mzkBKilupg+8at7y2zzy/nNK/fGqxggSYEp/UWRvvdWkzOot3zxqLpBOgsg
 MNX1TelkMr9UmLZ3yKxck5uWvPMpZAAcbShqnu1jujqsLH9nn02wKOgehR45nur8sPRegqbAJFv
 0Vjb/iS5jZOhSuLHKjZ
X-Proofpoint-GUID: 1g18WFCENcLrMa1DtA2XBcKaizFIFmka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=873
 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1030 spamscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512190005
X-JNJ: AAAAAAABr0Q3G94xuvIY8bsEvQNKzbJxhRRxFTbgzGxeuuI6C4zYTCLLh4fyc9dUpyIayNXyTsbSuWjV2AV54y4wdepy1oZRzxT1yakRmjtaGyrQW2y3wNZQTnMfpq7Ugrm8fiopawQF4k5T+2TL9XAykNLaotdeii7CwWE+aS/fDwEgTr/Vdya1EC76gKNdiQiU2Ikhj4OpKbau8+Wmz9+XrYGvly7BbqWkmc6rWCepubDzm03rOas3Pu8Ua3sqZtFsKeh+/ujqEC41cG3j8JOcyybKSb9pwuEw7q+0Sg4C/DsFUrBQ9vGmPZNeQXK5BxB8a2AUCJULS7XY/cU8qUrlgl1+gWwOBjQPrFjnyW9Delr8Us3j3WK3HyNEZQYXEEOkqzW1Lf1En3sIdS4PmdmfJJS2S7a3IM5z+Pcv6uEm+xTWRKCeXHF3BZ1xGimnSePcGtkbpLJP5RLw5fbOK/wM6T/cSP8d9RYbr50D1XJWoRw9o1rBQg3B12lHUc681qn8HgtRRf0OegUnzTTLD6J3Uk22T9Ek9iqvSBZJzTqG6FtiBZTLO01NTv4Aox6FZCjw84u4HXBBVd8dnjbueW6thg69a5AeocA2wQwl/5VSwx9M4CLpIm3g7tt62oVdJkxVcc6TxOWjgE8rqnJKDPzZ2dP8N2XTE5+WjgtJ3735dNOIm9AHEHuepai7KoKUxpI78edlvtC1Oo+1tY7zcauaPbJ89OHwXDGE/Icm4ZmhNUpHr8sIKO/3MxZD/6VPHqhroh4rd5OivC8uzGsxZCbH06iOmNFiD/FBPFvK6n1oh0Bj0ESDDeTQzvFX0SpT1y3bhx/KSjvEjmEfCVU=

Xen domU cannot access the given MMIO address for security reasons,
resulting in a failed hypercall in ioremap() due to permissions.

Fixes: ab8131028710 ("x86/CPU/AMD: Print the reason for the last reset")
Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
Cc: xen-devel@lists.xenproject.org
Cc: stable@vger.kernel.org
---
 arch/x86/kernel/cpu/amd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index a6f88ca1a6b4..99308fba4d7d 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -29,6 +29,8 @@
 # include <asm/mmconfig.h>
 #endif
 
+#include <xen/xen.h>
+
 #include "cpu.h"
 
 u16 invlpgb_count_max __ro_after_init = 1;
@@ -1333,6 +1335,10 @@ static __init int print_s5_reset_status_mmio(void)
 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
 		return 0;
 
+	/* Xen PV domU cannot access hardware directly, so bail for domU case */
+	if (cpu_feature_enabled(X86_FEATURE_XENPV) && !xen_initial_domain())
+		return 0;
+
 	addr = ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(value));
 	if (!addr)
 		return 0;
-- 
2.51.0


