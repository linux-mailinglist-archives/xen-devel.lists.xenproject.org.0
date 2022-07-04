Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0829656562D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 14:54:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360348.589679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8LaK-0000uM-2x; Mon, 04 Jul 2022 12:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360348.589679; Mon, 04 Jul 2022 12:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8LaK-0000rf-07; Mon, 04 Jul 2022 12:53:52 +0000
Received: by outflank-mailman (input) for mailman id 360348;
 Mon, 04 Jul 2022 12:53:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8LaH-0000r0-Tw
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 12:53:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 504e6d81-fb98-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 14:53:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9486.eurprd04.prod.outlook.com (2603:10a6:102:27d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 12:53:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 12:53:46 +0000
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
X-Inumbo-ID: 504e6d81-fb98-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ac2XqLyGVhBpRcAva759Eolczr0tsuUonk7HyjiDBCBnKFug4DMEnaFiZKkAfsegIJKtvybaMBy9evr5z0bZtKmMGPJzEFINLesuwaJwKACJTKvzPRuH2E32jqgMCf+KCO5Uvd/a4Sq3J9hGLxw1651wJxiEYNoAU1feIA+FgKVGTC8uNvToeFIm+aK6J4DLWKAng5OxgP6oXE67x1ScljO5zfyB0WvIJ63Wwm5Ta1h9oixn358L1V+QOeMaN+1t3rzvxEeNPz8IDR6ja9i6U6gqbkboO0d8Qct6p6Ffru5cXhcCgroZyI3oLpK482vEBQT6lZiA37uYcb+4pkcHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8Y8mDwtxmAxBw6f4NNMJLRFjn71RGDhvL1Mi6KMwb4=;
 b=S5oNoCPk9362sHvagn8fsVf8uCqbU+Est/bEt9/N404V5k1+YfUOOrFv3cLSlvtNyF7ZzGhQuO2zvLP6xgeMbLc1abcSmd74S6reFROh4qQKIDRJ1aGG8pAeeAlAjvbp81IKWkM+tkS7D1y1T4vWlHX/3VwUvQxh2pMW2na/CqPmGX6cv/jL+Na+4HeMR7B6D0veG7R9O2f4ABENPYzHHBj2INrklvzN2dbO5gC2a7hj89n83gg5QPR9T1fu8EdJqAqlFDTNnUPTjTus982XlxdCKjfmUKIn1u0yL4W3s4DmzCfcOmlCrXHf1BYbzEoLXa5MifjrdVoLVW5IwkBQtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8Y8mDwtxmAxBw6f4NNMJLRFjn71RGDhvL1Mi6KMwb4=;
 b=4jtWKVbo9PSROm4plXQO4/R6m1d9esDxHbFCykLSlbjRNpy8+tQxCdMfBPxbkUMqChZ3e3Yrw7lrc168a5bjd4ZCcVW0Gxat1BNQiHniKIovBguPJ4ytDSLvOSyC0xfzGbaXEwwBp23FIB8KnsXc+hvTabIHIiow195H8yGWMo/z4FGjBxie2qN4jw5h9HXq8x2mrdxeZ1035zApQaL7lBzK2cU7Zuszp1KEzM8llATyNL51kzBKoiXwZmxuoHa5GRKup+0IsE7XVBfJ9/DN2FJzLG9JmLIRfuzLubGF9imHr+Rcj+6fPHHvmF28/qXeTa0FEI1p8rZ6+syIt1onoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f37c4fe4-cf0b-224a-f1eb-d5e3c0d990a3@suse.com>
Date: Mon, 4 Jul 2022 14:53:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] public: constify xsd_errors[]
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0048.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f43820d-6387-4514-21fd-08da5dbc3ba7
X-MS-TrafficTypeDiagnostic: PA4PR04MB9486:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iyNGqB05oQNqSNBJcKcOIgOTygYBv4Q+MK5oXzL0f8WlcXoFHsF0OQXXl/EEp7LReazgaD9BUAl5p7BOrNa+jOXfnsXTIu2I0wgqvmZBFaBrhg2WE0Aoas95UWi3NMCFkbnZPqQjRMTjcpgTzFdLbFfi2R4H6C5STHgopPjjwpo6QfwwJIABlMDS019Tgn/bdvI0lHoE+GplpTLbdNg+cfQKdzJ/v829xDlainxR87avnEY8cBEp9rOucQZ6JpDnEH38wDe/qsSBNEThSyutsDDaDW3GmjRS2yUCECCjglxB0fwDYpV9VItf2a/NZuZxIBbYEfrMs8BAyIjf4YWm49Pn5t2YCXjlfiE24jcm7CBOGgTrXy48nAm4jxwPcqzBPB0b/LQHE98fNJYofrRqOyNQ9jy0KKUxJHpmyqcxhHIkFParLHCrOyhXdLBtrgOqb5BNQiP2H0U5fhKGfzWs71JlDT1m4g3V/vX58bUXE4s57Dc4soOqXIDHKJ3T5g+CFoKAwNfJPmXjIQAYDHrRPbvLVHGP83jRjl1ngI8y62kMeB+3YlBg23jIIejOhlRkjWo92bhZSzCl1jK1M7vvp7XGHqTERC8MLMI1WkgYnxdJTdzOkAed29MLKnyK0emkMH/wnxHGyWbdTJL1/qKtljnUh5GGMyI9wztH93i68GjV6S/3YTIaCjRYGeSJDaVNw/FDTa754uQSGAVkukwIv3EdOljdb54uD2DpvtNZPNW2ezK6txNYEGxBgrMSqBbZoAXVukjk2lm94okKhQrudHvgnd+MX0WB1YQgREZ2ofnQNcrR0KE/xf6M/dtAom/HR/kQGT7i4OvsWqNQW88z/T8/vRTxiIH0lCp8O4taJo8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(396003)(366004)(376002)(346002)(6512007)(4744005)(6506007)(5660300002)(8936002)(26005)(86362001)(8676002)(66476007)(66556008)(66946007)(4326008)(6916009)(41300700001)(316002)(6486002)(478600001)(31696002)(107886003)(186003)(36756003)(2616005)(38100700002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmhyUnF1aUU5eUpiNUZaeVdKUmdkcU5zMTB1NzhTQ0VHQU0xWlJzN1N1YW9V?=
 =?utf-8?B?NlFaRjJyS0RDVUVrRCtYT2RFZzIzek8rR1NBSVlmSFREVytUanNpRUt5cTIw?=
 =?utf-8?B?d3NIby93TDlpNDBqdXdYd0dYK3VGUCtJL3N6U2kvNkkxU3JQN0Y0M0wzakhj?=
 =?utf-8?B?T0E1WW9qeWxkTkVyZ3R3M0w5VHUxQWZqNVpFYzU0LzhyTTMvbng1aHhWUHI1?=
 =?utf-8?B?NWIrTS9pY3ZyME16ZHhod1BRTCt1RTBQRllDc3pJV20zYVBXT2E5ellmaHIr?=
 =?utf-8?B?WVBWaElZaERlOUk4d1V3ODFDMWcrWGh5R0RBWDRXdzNWRUMyWDZHSHRLWmNK?=
 =?utf-8?B?QkkzdmNUNmxRUVF0aXlmKzV1Zm50RldKR29QODNpdE5qbEFPazlyVE1Rdkxz?=
 =?utf-8?B?ZDZuTTJaUFpzdkcvNVMzNHBNdGlOYjZnQlB6QXZCb2RyQ0w3b1dEWTRPNTJD?=
 =?utf-8?B?aTB0c3hlUXArSE9lb0x1VUE1cGZkQVFodXNlWkJsQUJ4MVpPWjdYRjRsaHVx?=
 =?utf-8?B?WmduN1NjYXZEL1ZEdWtIUmhHVmVpdFppOUNVZzl1TXlrWGtwWEVhQVJhdjRK?=
 =?utf-8?B?WDBOWlJNRlRyQlpzRjFVN3BtcFJVOWZES2p1cXdnMkFwTUgreEQ0QmtjR3Z0?=
 =?utf-8?B?Sm92bERiTDZ6NklNY3RGdzAvVkl6c0J0KzY5TDRzZ2hEVVJ4VHpxRUJXMG5C?=
 =?utf-8?B?OGtRd202WldzcXVETTd5UUhvZzh0eUZzRDViYkNQTkwrWnVWYk9scmZ1bE93?=
 =?utf-8?B?L0tYNVl3bGp2Y0xjNHQ0ckQyVjlwMEw5TDVPOG1rL1dodjJjOEZVcnA5VGVl?=
 =?utf-8?B?MVJiWENYeGRaNlFQK3g2cHZzR212bDZBNndYSGgycXdnL09odlBnWUZORzhD?=
 =?utf-8?B?M2h1TkhsSEhmUTRZb2dKYUo2c3IwNmZoeFhreHowMmdzSDMva3BUTWlPRGRN?=
 =?utf-8?B?azNJUGFzaHRWdjJaaWIveXZEejkxUzNEbGhzSkpBdVFRMThCZDdNR2U5N05o?=
 =?utf-8?B?QXFZWERSaVljeSs5cC9vTGpYQU9qaksxNTBiVnQxSldaS2FBODZrZHU5cDZS?=
 =?utf-8?B?VHE2UG1QUG9lMEZrd2htUDNSS3J3QVZQY3RqWHprcGlRY3FVU0RRSE9lbjJF?=
 =?utf-8?B?WXFSN29ZdFpwMkQyNHc1eGZJS2ZMOHRpWklNMzVCdXF1VlJxK2ZPemsvb2lB?=
 =?utf-8?B?bGE0WXZtd0tPTjRpR0ZjOGFIdURwbkxpTHhOTVNnK3dtTmtUNWVvTStUcnFR?=
 =?utf-8?B?dWE5MjdieGFGbFBJanMyZ0E2dHJIVS91Ly9oQm53YXBZZk9wVy81dDNPL0Na?=
 =?utf-8?B?YVA2Vi9iOXlMSE41SUF4RS9tRGUrUkFvWFp1SDdJdmxOd09CdW93RFdlbktj?=
 =?utf-8?B?RTJnbzJkUEk0T2dNNkZBS2M5emV2VkxQM05ldmhTVXE2OUZkQ1JSdW5LM0Z2?=
 =?utf-8?B?ZnhYMk9mSzJLUG5ZQ1k4V3RjUEp0cW5IVTBZK0NmTDJKYnlwZjBJRTYzZWx0?=
 =?utf-8?B?L1phQkZzbXhWTStuNStPbVcxWjhrZ3B4czA3dmhHamdsTFgzWm5GTkNSdi94?=
 =?utf-8?B?Z29HUHAzMXNZR1RhblJ5UEZXb015bkpMNUYyc3hZUWFBRzZBcm8zSmRHRFo4?=
 =?utf-8?B?ZG5VeUJyTUtMTGlqK2VhK01NNjMrQjlITUN3V2p6eWF2U0lJQ3BNWTk1OWhJ?=
 =?utf-8?B?UlMwTWFLcTZqR1ZhLzZUVVcwL2ZlWXlVZ1BJdk52M1g5MmQ0dEJJZ3ZHVjNG?=
 =?utf-8?B?NDJsNTZ3TCs5K2tzVmQvTU5IUnVHcStJZFo4L2MxOSs5em51UnlodHkwcXNQ?=
 =?utf-8?B?NTN5c2hJUDBVY2tiT2ZpdExDazBMS1NHRWYxTUQ3U2JRb3U2NktoeGQrVTlC?=
 =?utf-8?B?aVlzMTNaeXpKazJGOEI4NGYzR2FTSkRIbTRKOGxCZ2tVSE9mV1piSno2ai9V?=
 =?utf-8?B?cFZtdGtIbHVBRDJUcERDZTJEd0tabHJaZGVmTHVzN0h2UEFNMGE2eDBqTThQ?=
 =?utf-8?B?a0pETmJhOGJGT3U4cHpQd1ZWeGVjR0NRZU5LdGpaKzNZNFU2c2FqSnRVODVy?=
 =?utf-8?B?b0w5U21tNytHckxQdGc5dlp5U1dzeDBkeUc5N3hGY2NuZFZ1L2tHUzlJa1Jq?=
 =?utf-8?Q?VeFxQ9ehCzuCuOqgWWER8dPGl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f43820d-6387-4514-21fd-08da5dbc3ba7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 12:53:46.3483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vC05NUSIa1kA9HECdkupx/p6lMgemGWvAeQjFGTatEyzEUm8uT7aVuXeOs3OkZdt4AiG3A7QvhYHULsSnvV1cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9486

While in principle this could break existing users, I think such users
deserve to be put in trouble. After all the table should have been const
from the very beginning.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Especially since the table definition lives in a header, the adding of
"const" might render redundant the adding of the "unused" attribute. But
I'm not sufficiently certain that all supported gcc versions as well as
compilers claiming gcc compatibility behave consistently in this regard,
so I'm leaving the attribute in place.

--- a/xen/include/public/io/xs_wire.h
+++ b/xen/include/public/io/xs_wire.h
@@ -71,7 +71,7 @@ struct xsd_errors
 #ifdef EINVAL
 #define XSD_ERROR(x) { x, #x }
 /* LINTED: static unused */
-static struct xsd_errors xsd_errors[]
+static const struct xsd_errors xsd_errors[]
 #if defined(__GNUC__)
 __attribute__((unused))
 #endif

