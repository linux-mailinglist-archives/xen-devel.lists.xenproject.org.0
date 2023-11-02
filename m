Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2657DF4DB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 15:24:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626925.977648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyYcP-0008VS-B2; Thu, 02 Nov 2023 14:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626925.977648; Thu, 02 Nov 2023 14:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyYcP-0008SV-84; Thu, 02 Nov 2023 14:24:21 +0000
Received: by outflank-mailman (input) for mailman id 626925;
 Thu, 02 Nov 2023 14:24:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyYcN-0008SP-UR
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 14:24:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2070.outbound.protection.outlook.com [40.107.7.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82332957-798b-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 15:24:18 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7007.eurprd04.prod.outlook.com (2603:10a6:803:13e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16; Thu, 2 Nov
 2023 14:23:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 14:23:44 +0000
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
X-Inumbo-ID: 82332957-798b-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAqF0W4YlxaXCs68tmNkYz0bAJU4z4PDHozCd5ICSyL0XcLyS2Gj0lkoOlEqq9EAEcGUoLCB0VEzElqtAcfK0l/FUAt1DvnO05BTCuMLnnUYjONadJKy09xqoaFD0zciG8Q+CK1JPrJ2Xzr7bxzr99KYoIXB/zcSqRydBK727lAkCh4keP0fZu+4ZRMeiAWjtaXX4BHYFnPvCDshLN+i4zkMUktSgWeNneaXl/AFwUqZHKZNsQCo9hZxHpVmynM9fs90Fw5ub7f5LtMefpXSX2v5mKfrmxxDQQjuHNsyjXG9IoFD65EKD3VTTHQn77ylR3xP9YpAMsHDegEa+v1EdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=327YiGjoXN6nCav2A9E9WBoxK7xf1O/U0swjGWj2UwU=;
 b=GGXtTFdc82qDPjXWPMn6nKvp5L1nS5/QSq7WKBgmHDgbE8dfqFBqDmK/L+Vr1LtJODCwGhg3nmlF2cDvz+vy4336G2fqbRiMZBAsnl9wGBUYJrimdC7UO5pyYNxNyUXc+eOsCwC36NViInKoDjEAeCVfpl0P2R2GtUwsSuwzSee5BC0hzl2ZAIoiGoQacu4dSzyaPDjVQpjo1wNOkwMfGtwrMk3vFgG1T9/UojKlyP0zLxexQFpL83EIea/O3Dco+nE9028NtLTjqK7qGSO3MTVzcWlm4ZpbSN3ZXJGfO4EJkdy9J/uSbV+dJ/zYp3vGj5wUi0bgwaIVfl2IPg96zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=327YiGjoXN6nCav2A9E9WBoxK7xf1O/U0swjGWj2UwU=;
 b=33L57lrkoELQarVMd8IzdakwyumsHmr+lWGIIY9b1F9dACwTLcERKrOEMxG+tTxEggfR4T/dW2LkGqzq0f7LwW1hCKKZnaJZr21ZI2GxuuFmvHJg8Xg707R7WGizCFQD/Mq14hVH5vEBbebx9RCCn1zce4h5C5Hxbl9xrzlpeZ/HpBdkUzLIS/TMwTG4plS+Yl85UuGDObVvQcY2JjZtvVKHYChhjKaC5LClqBLP9iRkpujldYpJTgqKtywEsTV4vq6MlHln1W8aOpjMNtDNhGAO53KbxZ4Tie9ZZMy9Sn08oMC7J488clsvEi83fbFDDd5P+h+zo101Mx0nuf3vNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <47711743-f6b6-130b-6be5-cfbb84ee5e2a@suse.com>
Date: Thu, 2 Nov 2023 15:23:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Federico Serafini <federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] AMD/IOMMU: drop tasklet handler forward declaration
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a5d5e2-1980-4dd2-4078-08dbdbaf51c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i586hxCy/YwQcGXtT4URZT9p1qJk2GGJBn/9G1QnV4AtBAELKpif/LUMoVHEx+RfCK8FOCj7TTk1lg8mFGdcXzFaDnLNUUgKS2Mip+6t67tHRSkB3mZqTpq6FBHWU/WhQHqBj5+eSUhAWmEt4r/bPumEXU0jaTlMf0ODd+oPlqlPFcEI9xJrn7WXkn/Z/xuxdetRNqBFH4nQjpBcvRDAUFtNUUOfeS+V0VQN5Q8PUn/EMN0duUSCjS4FX6rCj920rxA/i9eerl7nlvwD8J6lB3p5ocvpry31GLQAFI+XmjdE3/HMhcZ9/UGBFOw85rOTKEoRYZAkMGQp816om3jFMiSuvVcs0lrWNrOoK1ZdS2bkLDWdO5dE5RF2F3D/tHD9kTtuUlOn8e6dgIYI/oCd2u9ntTXidM3zBlM3ULAAuuwxxFrBiroi8BZWsujd/xHf0CYm88FMjI1uzN8DsJeoqncefqnVffryE4X6lkQNgWoMP3BNgB5g2d8YTztXNU9AU9WIhk6IGUAT1YoUMx1AUkCLPlrWUOTamLqiDhHy4sYq2kBpT7XBTGsU85/iXEAvzUWHW/227pJz9pQzx0wNktnfOMAiL8gtFuBrhPgEJewdm3oVVCtVhfzA1knwyxLgcx3L2PRvsfk5fDR2OG8X+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2906002)(31686004)(26005)(6512007)(38100700002)(2616005)(31696002)(86362001)(36756003)(8676002)(478600001)(6506007)(66476007)(54906003)(316002)(4326008)(66946007)(6486002)(6916009)(41300700001)(5660300002)(66556008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk8zb0NjUzJzOW5JRzduYjJCbjJMNjZwcjJadmduMGVVdHZTUHhXQzVCK3FN?=
 =?utf-8?B?b0JpdFJDY25VWDNNYTNUaHJLeWhjZmxIYmRzWGpCelFIZWh6dUttNXI5SDlP?=
 =?utf-8?B?WXJicC9EcEsyQXd2UnBURCtEUFp6aXlNOVRSSEFwMDA3ektMV3I3aU55NkNq?=
 =?utf-8?B?bmJzUVhLWmxRSlVFQ1VvZ2lobnlwU0hkZFU2MXFGd2hua0IzRG9ZbEZsanRt?=
 =?utf-8?B?cVpvK0JjK2dOaFdjUHNUMU1RVXVxUzlUcDB0Qlc4Y2JvVFlnZzdlM00zMmli?=
 =?utf-8?B?c1Z4Y2FWNy9rNDEvWEhLV0lPOXMxbjZsMFdab3JBZ0ZVUzFmN1lQS2ZmYVVS?=
 =?utf-8?B?SDFLRGRjbitvVHZ6UTlETXMyQldHTldPRU8vY2xYSUkveVpjV3JOdDlZTTBn?=
 =?utf-8?B?UllBY21CaFN0dlhIaENaOW5yMEZMYi8vOWtsMmo4K0hjR0VBdCtEM0JnaVZP?=
 =?utf-8?B?Y2RpVnd5Q2FCRzdhNURBQzZZNjVVVURoQWwyUkVBblhCS0x1dndXVlUybzRw?=
 =?utf-8?B?RHlqSFNkMTRjT3Z2dGpPTFA5bitIem10Q2NkV1luYkNvdTUwSlNUV2xWT2Vp?=
 =?utf-8?B?K1lQaE1DajlNZG5UMTZUZklDZnF6K01aSHpFbEZ5OTZKMHA1dzEzaUExbCtH?=
 =?utf-8?B?NjZQTmxOc3hVZUFDdUNJYWJQMUFyR0NoQnZFK2tOcFpPOFBwL2ErR1R4cVVv?=
 =?utf-8?B?bCtwUjRyWTVscjZxRDE0S09OUyt3WVFoWExNRkl2MHM3dkJOK1lTMWdHUHU4?=
 =?utf-8?B?MTdkTW50VFNoczMyZHdMdy9QTklUWjRWZmtvekg5NzRPUlY0VUIvdjZ0UmFl?=
 =?utf-8?B?U29ibDdxOTdaNG5yVUUydk9saXhHajRJVDFBS1h6eVpYdXJab0d2RjIwSzdI?=
 =?utf-8?B?d0JGTTVxWk5Zd1ZXUk5GWmEva1lmcXIydmdUUWtHYk91U2w0ZFBSdytnZTA1?=
 =?utf-8?B?d053NWtwcE5EZUp0S3JITG9ia1Z1QlE3cnUrcndJeWhSMldRQVZKTGs1OHVQ?=
 =?utf-8?B?K1ptT3RJanplb3kzclFDWHh0S0FJbWk5anVaaWJPZXByZ1BiZXpiMkp0eS9O?=
 =?utf-8?B?Z1hxa3FRMnRaMWdRYm1QYlUxUWw4cTRYdng3Nml1aExSK3prVFJQSVVvTkkr?=
 =?utf-8?B?blB5aFVKWVNnN2FxRHhMRTZUcnROUTZsYnRPZWZVdzFvbHlVQWMrQ3czV0tW?=
 =?utf-8?B?TlgyaVVJUzkyTlZReGZ1NWQ2MkRnS0hJSnJTQlhoL2dtUWF2ZXQ0bXd4Yjh4?=
 =?utf-8?B?RVFaazJUUGNORUFiUVBRa2xwUG5uQ2RwTDVwTklJK2IwSkxZWmVrWEJ2SXc2?=
 =?utf-8?B?MXJ5TlRJNThJQjYvNTNWQ2lZVFhjNEZ5Rnd2TkFDVW12cFVSVjdkT3FXK0RK?=
 =?utf-8?B?WmVOd3hMN01CRVhYYXRPOFM5czhqSGFLYU5peDBwQm5XR25sOWp4YURQRHZ6?=
 =?utf-8?B?KytZT3JyeFZrRkQvb1hPTlI3R1RZNE5rbCt4L0NWbWpZd2syQXZVMEJMY3pN?=
 =?utf-8?B?NkFIWUpiM0o3cDRvUFd3VGl5b3BWT0F6SG1mKzAraFMzK0prOGRyVlVNSlgv?=
 =?utf-8?B?U1kwWmtvQ01PMWpqcVpLQ2lyVUxyS2NqQlFrTFM5NFI2V0F5WWM1MVRZNlk1?=
 =?utf-8?B?UHBvZjhUM21BbndPVnhmVTh6Y29KdmpCZzhITFlqY3RPdHlNbWh4TmZwanpa?=
 =?utf-8?B?UUNRN09rb256VkNCTk1YaFNCNVBFVitJaWpxVExPOGJEQUtCTFBrd0hlRzdN?=
 =?utf-8?B?QzcxbFFXTk1XTnNpbEpCQzdpQjJhOVhsbVhLSHdablNDdUNGZlNTdkVUZGln?=
 =?utf-8?B?bHU0MCtJT3lMSXJENXE0aFF4REZ2aUxueWt3VVJlNUJCa1VWT1lWZEZnQkov?=
 =?utf-8?B?UlM1ZTVuVXRlNFNEWDR5VVY5SW1IQTZUcTcrSXNLS3EwZDZDeURhOUgxK0d2?=
 =?utf-8?B?bnVaenF3TUlLQlhGTko1Vlh4S0NpZ3FIZm5tTjRHZElMTnVXWHB3dHNXejBr?=
 =?utf-8?B?SEprV083WnNING1RRGM3U0k5VkVJVG1Ta1ZONzB0ZXBHWm9vTURETlhwb2x1?=
 =?utf-8?B?T0RRaXp1cWlXYlg5TGdVVXZaNDBSVHFlTW90YzhUOCsreUtzMTQ2Smg5aGNO?=
 =?utf-8?Q?uNrLqNlptyC/2n2v45mykTS4n?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a5d5e2-1980-4dd2-4078-08dbdbaf51c7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 14:23:44.2266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sro50XJ4GthE3Oohcf/S2aDSjgp0F+/12L+VJ0Gjt/fEiFMF8KBqqREtuJEDGaVWORT1ti4IoUMNUZOkOjXLtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7007

do_amd_iommu_irq()'s forward declaration uses a parameter name different
from what the definition uses, thus vioating Misra C:2012 rule 8.3. We
can get away without such a forward declaration if instead we forward-
declare amd_iommu_irq_tasklet, putting its initialization past the
handler function's definition.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
We could even get away without forward-declaring amd_iommu_irq_tasklet,
by using softirq_tasklet_init in e.g. amd_iomm_prepare() or
amd_iommu_init(), much like VT-d code does. Still that's code that can
be avoided, even if (in the final binary) that code ends up in
.init.text, and hence will be discarded when booting completes. IOW I'd
instead be inclined to make VT-d code match what is being switched to
here.

--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -26,8 +26,7 @@
 static int __initdata nr_amd_iommus;
 static bool __initdata pci_init;
 
-static void cf_check do_amd_iommu_irq(void *data);
-static DECLARE_SOFTIRQ_TASKLET(amd_iommu_irq_tasklet, do_amd_iommu_irq, NULL);
+static struct tasklet amd_iommu_irq_tasklet;
 
 unsigned int __read_mostly amd_iommu_acpi_info;
 unsigned int __read_mostly ivrs_bdf_entries;
@@ -715,6 +714,8 @@ static void cf_check do_amd_iommu_irq(vo
     }
 }
 
+static DECLARE_SOFTIRQ_TASKLET(amd_iommu_irq_tasklet, do_amd_iommu_irq, NULL);
+
 static void cf_check iommu_interrupt_handler(
     int irq, void *dev_id, struct cpu_user_regs *regs)
 {

