Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4352D1A1B36
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 07:05:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM2uB-0002kV-CJ; Wed, 08 Apr 2020 05:05:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sdaI=5Y=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1jM2uA-0002jQ-4V
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 05:05:38 +0000
X-Inumbo-ID: 8c753620-7956-11ea-81bb-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c753620-7956-11ea-81bb-12813bfff9fa;
 Wed, 08 Apr 2020 05:05:22 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03853MYK179629;
 Wed, 8 Apr 2020 05:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=wXWzqKpXP4X1QYluyMKcRS0Im/RDUvqYRVQBv1BS7nY=;
 b=alK3sFDt1Pwv7BYgZTwY8xnWBnHMLyJyt9SlwdNVAK2rna7XJu9iH2Y4DM6F0e9VfnC3
 GBqgu4QeDotoIm1NugkOTmgOqQb8NWWI3q5AvR/VAr/yW4T5A9roFCPiUgvbdkJf2VYr
 F0uBX8fTAVhVvjGNnf90CpBJP5UeILeKgH/DFfNpGbja2gaUn/33CY4yQCYCUjHrZ1x+
 9+GQAaIiiFoEj2zgpzDOmZOCBpdD17bAzpbXUZu+hER4VtI+Ue9QyHVrw3rsHvCXl3RO
 mhfNnyC1wWZofzLK34HV/83fsKsCqIOOP8jU05D0+FNlDl7JqAlacAHsF/SSoud5ZyCd GQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 3091mnh140-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Apr 2020 05:05:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03851X9K100807;
 Wed, 8 Apr 2020 05:05:06 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 3091m2huh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Apr 2020 05:05:06 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 038556XE030455;
 Wed, 8 Apr 2020 05:05:06 GMT
Received: from monad.ca.oracle.com (/10.156.75.81)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 07 Apr 2020 22:05:05 -0700
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [RFC PATCH 06/26] x86/alternatives: Remove stale symbols
Date: Tue,  7 Apr 2020 22:03:03 -0700
Message-Id: <20200408050323.4237-7-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408050323.4237-1-ankur.a.arora@oracle.com>
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9584
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004080037
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9584
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004080037
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 peterz@infradead.org, hpa@zytor.com, Ankur Arora <ankur.a.arora@oracle.com>,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 namit@vmware.com, mhiramat@kernel.org, jpoimboe@redhat.com,
 mihai.carabas@oracle.com, bp@alien8.de, vkuznets@redhat.com,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

__start_parainstructions and __stop_parainstructions aren't
defined, remove them.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 arch/x86/kernel/alternative.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 4157f848b537..09e4ee0e09a2 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -623,8 +623,6 @@ void __init_or_module apply_paravirt(struct paravirt_patch_site *start,
 		text_poke_early(p->instr, insn_buff, p->len);
 	}
 }
-extern struct paravirt_patch_site __start_parainstructions[],
-	__stop_parainstructions[];
 #endif	/* CONFIG_PARAVIRT */
 
 /*
-- 
2.20.1


