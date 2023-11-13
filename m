Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0DD7E9EEB
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 15:39:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631622.985172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Y5c-0003Ln-MA; Mon, 13 Nov 2023 14:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631622.985172; Mon, 13 Nov 2023 14:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Y5c-0003Ip-IX; Mon, 13 Nov 2023 14:39:00 +0000
Received: by outflank-mailman (input) for mailman id 631622;
 Mon, 13 Nov 2023 14:38:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2Y5a-0003Ic-Tp
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 14:38:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60a51cac-8232-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 15:38:57 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7484.eurprd04.prod.outlook.com (2603:10a6:102:8d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.14; Mon, 13 Nov
 2023 14:38:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 14:38:55 +0000
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
X-Inumbo-ID: 60a51cac-8232-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVy1UI2q4sZJ3FShapl/LK6nOYNGguRkTYSYBS/YG9hbw8k1yDxtcQlssta8PNn8jGbU8DFCB1nIgbDtjsY7Pg1BIvZGIWrr0ZLTVhfgjq9swq9ScDZD+72NLTTQLgqyT+0+RsGUpj4Tx74ZdbfA7rR40mbtzUx2g/O5yHxBr1dEsBgglOZyWSJG/NDlcC+fzHAoYeWCKMV3mrIj3r5Upog9N+0BvMt3pDHTjr1HPm7LDnWi9xwp26D9zKi8Cz97U8Ty9A7T+BuK04Plfk6KpmPaPTADvn3QxMubNyonnP/x7eURIU7L4lWJdN1QtKLT+9m5OpLE4vr896c596s8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkWuOwMICPqm0UI5WQ79zEs8uniG2Cfp+jfiExAlWbk=;
 b=floN308bFgNKdMj/i1yLs5uSr43Ql7J7lUzqI3A5BkKIDUIgt/rLJLTGSlksPQijWVVDKzmBq3a3LQu7AqpnjUnBHW/IlUCcIglEVU+eebNJikArvoRzArZiGNJQluFmlzvWxsnz2pGfW2PKQwluafcNxLx02jKg4srZZl8Bc0wHOFOk5NN+PsviA/0IJphuxSlzKfmLAdoF0NIv/+MppOYcZAZ1KERokn5nseFNgtT6VD5R76Veio4O8o5vYyK8hLhArVQa8j6iuN+wE1u1HNft4OiKlmwVp6Ncn640zWfCBZaT/gOMZFBNLsd2t1vPjya9jamRZV9NTZpkWs1Jow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkWuOwMICPqm0UI5WQ79zEs8uniG2Cfp+jfiExAlWbk=;
 b=txeEvITgbXd4X2SNUTGMh8w6DWNhy3kJcVWT4sGPXNNxYCN+HAFiIJbK79Ybpjd1kSmA7TbhyRB1N810RchpP1MYUC31zsZgfvSVkSmIydshMjk6IGr7N1Oumyh/PgPFkXiWi8p/fR52Pa0vRhWBf/alzd0X7BP7zo5lRbttT15e8ovgqzR7kEiOA9gRKJ7k4OdA07Osb0jF4dquGncd1u2gZS0TyYhAHQDgvnDNCEKidEkeEHsLPFk8qIPAsKQaPjkbXPHjWh/Po2OQvbVbArbelRqNWttwz+UH4QxgCsrVA9n9GsC9VXsiZmm5tvEUbmrkxJe0UKD6XuuWVCUD7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c027b9cd-37f3-8223-141f-a1dceda82ab4@suse.com>
Date: Mon, 13 Nov 2023 15:38:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/boot: tidy #include-s
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: e05956b0-c97d-4ad1-bced-08dbe4564343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NdlLEtdDpEu8o2D8COE1Y+/BxGUjsDw4CU2UGdD9TrBWp3/vYJDySYHB0OFkcrwG05fOfHFEnqbvRHqQ+rJzHV4OJo2C+BusQ+GpTFRjnEVSp/KxUPMu9m/W2nOmqq+DBHOi7+kDKf27cEll0kC7OUmUh0SXG3WkNNfKaqienGD2Vie+DtL1wEfxFyE69WUvrW6OBnAtqAMcFpaUE7gBIFueNzuVzgetDZFg7azW5DqcC1fTUg2wGbqD71ebCsG6oQ82EPyL3TepKjkSGWi+AR1yjUusWZuJsvQIRQl94PvoWqnnZU5yHrFYbvOAEWZiBf+iowji0u2nC+pyAFiMO8kZW+Kx+8jOv3tobvZb0bOu+Ynb3pEKHMY1iJ6Aqu5B/021ymXI/Jfeo4fX7p2oYlDgdvJsIdlxcC6Czo9TgFHHhyKct+//dCxDf1uv/OsjohRyad0zJJHouFia6gNursPNkiP4ljgCGv16CrR1n+R+28WlnsAN/PZ385WwHSyxq8Dj2u1Zq/cPNzEs9Vdkzedb1uJvLm2ncPyuMoJR5fI2b3u8RJomRaAxs43ivrNwfwNI7gW1mh74bB/E0crZ9g76c90zgvsAFXf9e1mq3qRn6Umfb+J70mmCdTxuGcPn8ZwFP11gtHN/d//gxexi/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(366004)(136003)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6506007)(2616005)(6512007)(6486002)(478600001)(26005)(4744005)(5660300002)(41300700001)(66556008)(2906002)(66476007)(6916009)(66946007)(54906003)(4326008)(8676002)(8936002)(316002)(36756003)(38100700002)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTRxR3UxdjBUM2hnRS9aeDlTYVJtM3lUVVZXUko3NTN5RitpU0JBV3Jjb3VX?=
 =?utf-8?B?alhMc1ZFOUhrYUo2V3J3RTNPeHVUVmk0Kzc1b085OFk4MzdXVTJtMUZUY25M?=
 =?utf-8?B?aFVvbm92bVpESDBSSHMvYXJjZmRXdzJSNWFZbGx6N251VFBqSlJ4REFRVTVN?=
 =?utf-8?B?ZDVxL0hPWEcyY2hJN2QxZUVDeUh0b1M5QTFiVWEwakhqT3M0dzVUUzlINFg0?=
 =?utf-8?B?bTR1enRvaVh2Y3hIRWl3U2JiaS9XUm44c1Qrd2FWSUxVdzBjR1lGQnFqQlNs?=
 =?utf-8?B?UENzUlE1MTRkR1QrOTQrbUVBUTZ3cTVGcE5jMW9CMzBnUDdqWkt5TUhaSk5N?=
 =?utf-8?B?VFZySTdScnRhdGJ3MWU0dDZvbVMrUG5QK3NvcVpMaU9rMjZaR29sdHArY3M0?=
 =?utf-8?B?M3k0eFg2SjFlZ0VzODk5cUIrbFQwaEJUSk4vbDZJRG10S3BMMStwQWRWd3NS?=
 =?utf-8?B?ZW9iZG9mdU9yUFZPWGk1bjlUaFRObjlUYVM3MDV5OG14eDVzUTRLQXFLSEpq?=
 =?utf-8?B?L2o4RG1oeVYwT3FTWUY0S0t0cXBBOHF5bHl6VlBDVTVqNE9qRFhBeG4wZUc4?=
 =?utf-8?B?WWNjbVlBT09FSTh4OXgwa0J5VjNMNjNYTVBxZWx5R0NZTU1US2k3S0U4WHA3?=
 =?utf-8?B?NTVPcnVXWG5YNjQzaHVxNUdYYW00MlF0T0FFS21IRkpQR0RKa2YveFpzcVNF?=
 =?utf-8?B?ZzliTTVEajR6TkNvVGJHTUFvMDB3Ly9oN1FOYUU5MlNPWncvVW5sTEJ6U25o?=
 =?utf-8?B?MWZxTFhVL2FPOHY4d0FHVjJGVmpuSlhTa2JNeTNjNXVzL3VYbjJYdEZIRTNT?=
 =?utf-8?B?Y2VmMjFIWDBXV0VVQlpTYnV2OGR6V1dhYmd2UzBVZ1Z0SGhQa1dPYmpjOFlm?=
 =?utf-8?B?MmtzZ3l4QXZMaGt3VWt5c3VTeHdLSzgzdHpJaVNWd0lnVUJYSWNaRDlxZ25G?=
 =?utf-8?B?b3Vrb3VSOGZWRTR6V29qZVlnYzRWcjRSWi80YUE1UkxIbXJ0M3MrTUZqQjI5?=
 =?utf-8?B?TjZuUzMrWkNXa0VKeEY2TzNmOGZzU0x5clpLUHBicTd0cXpmRkdrdGwrbkJa?=
 =?utf-8?B?V3BMZDZRTlVoeVZTcWE4OGpFSXo1UmNjRTB4Y292YmFNa09BWnpOQjMreSsy?=
 =?utf-8?B?QTRGdTNtMGZVU1pqbGJYRW1weU9JdG1uNUVTY05hbE1VcDh6MC9kTlVsdmpu?=
 =?utf-8?B?dzdHRWs2b1Jlbkg4WURlVldjaHdQUE5wa0lySjFlaFV2Q1VTS3NBdkNOKzBM?=
 =?utf-8?B?dEFWU0V1ZXQyL0NCaE5OTE9PR0IrcDlFVndpRVR3aTJiZWtiVjlWSm9qVFdn?=
 =?utf-8?B?NFc2eFBrNEJ0KzFuWEhFbER4TEJuNTN2ekswM3FzK1Z0NzhscTJiLzhZRjc4?=
 =?utf-8?B?bFVhVFltVnVHN2FSdzZGVllaRFF5UnVvZDkvOXUvWk4zSXJOSmVLTjNReW16?=
 =?utf-8?B?RTJPVFdtVVlDclJFZGRJRDlwRUFHOFpFQ0ozamM2NFRSUFZDMjRLOXR3UmhE?=
 =?utf-8?B?MjNJeGNTaEVYWXBYNGVIU1E3YVVFMUo0eVJIdDFpcms5bXpVMythUlVMaDds?=
 =?utf-8?B?UW1LQlVNLzNPNnBSQUFqV0UveEgwcVZoL1dsRTRpRnkySzdCd0lVS2hIcklG?=
 =?utf-8?B?a21FeS9GbU5DOGpjUHcrN2o3QXFLNlJ5K052dWx5clRwMGJSc3NlckVMR3FJ?=
 =?utf-8?B?clpRdjJmRGxHMUdjcUJ1VGRTYVB2U21aQUJMSEI0OVdXcXkzWUlPbHlOeVZ3?=
 =?utf-8?B?Y2loUXBnb092MUhUM0lHZ3U3clNRSXNDU0F6UEZmdlBHL3k4VWNpbm5IczFJ?=
 =?utf-8?B?ejFhT0ovTUZnMlJHRnFTcnFpVS80aVpaZC9oNjJ6VVFEUnNZRTJHYzMyN2lt?=
 =?utf-8?B?dkxkTE5XOTFGNTNGb2p3RU4rS2UwM05CQ3N1bGljd1pGeVkyQ1BZMllxaFJj?=
 =?utf-8?B?N21GQzYxcmQ5Uml5ejltMDVoTjlnekEyZ3c1eHc1WHdwbGtnaHMvaGZuMlpB?=
 =?utf-8?B?L2pDcG84VENZa0pEM1M2d2JRTlVKTFl5RkUyWGdDOUlVZ2g2QytnYkdVYkxp?=
 =?utf-8?B?ekpSTXhHODhYK3Y0azlhbm9YVGlVbmRuNEdYS2JoRllybCs2cEtPeXcvOHo3?=
 =?utf-8?Q?nv7pW7M/sr3+ktHC2URM6NIt4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e05956b0-c97d-4ad1-bced-08dbe4564343
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 14:38:55.0891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ragz8Dms5AFpSQlrBYYTiDXG86RBhKeLROkcEx2cUjVXDPfSeWmCPFUjxkTfWcajdkrObowmwNEBDo+OU0pgEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7484

As of d58a509e01c4 ("build,x86: remove the need for build32.mk") we
don't need to use non-standard #include forms anymore in the sources for
the boot code helper blobs. The only place where this kind of #include
needs to remain (for the time being) is mkelf32.c.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/boot/defs.h
+++ b/xen/arch/x86/boot/defs.h
@@ -20,7 +20,7 @@
 #ifndef __BOOT_DEFS_H__
 #define __BOOT_DEFS_H__
 
-#include "../../../include/xen/stdbool.h"
+#include <xen/stdbool.h>
 
 #define __maybe_unused	__attribute__((__unused__))
 #define __packed	__attribute__((__packed__))
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -27,10 +27,11 @@ asm (
     );
 
 #include "defs.h"
-#include "../../../include/xen/multiboot.h"
-#include "../../../include/xen/multiboot2.h"
 
-#include "../../../include/xen/kconfig.h"
+#include <xen/kconfig.h>
+#include <xen/multiboot.h>
+#include <xen/multiboot2.h>
+
 #include <public/arch-x86/hvm/start_info.h>
 
 #ifdef CONFIG_VIDEO

