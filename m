Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070BD6FF114
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 14:08:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533340.829914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px55j-0002oa-Ei; Thu, 11 May 2023 12:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533340.829914; Thu, 11 May 2023 12:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px55j-0002mT-BZ; Thu, 11 May 2023 12:08:15 +0000
Received: by outflank-mailman (input) for mailman id 533340;
 Thu, 11 May 2023 12:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px55h-0002N3-Df
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 12:08:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80769162-eff4-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 14:08:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 12:08:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 12:08:11 +0000
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
X-Inumbo-ID: 80769162-eff4-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRsdVBXLWggBdeJz9wDXs/c0bpNMEwVxqf8eD7b4kYCdKfyYjJWtNgah0v7RcR+bMpp0KdpJch5HhN2wEUtIxbfbdy1WoObqG2oCiPbCijkScVfqdjRrFUbtIcKYlNb0UeMulNIr7GGwP/omCd7VuhkSBbCqx0dWX3YdJStlIIJntzS/sp2GEtbXX0AUMaCcHqyhazEYU+BQ7rtBoKLjxwNyQV1iyoTzo/Jp4VUw/Lp1dNF/sVQNW4T4Trsa0EdA10DGCAFpF77VTwosQeNAKmGDuoU6K1mPkHlvWNeIQuU/SCr/YSuUwkZlg7vRtHQyKnqmwDayj4XPPbgXNnM96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+zqZGPqfnT5MVrIi37WQFaIf6fuLMsYpLckidDxeS8=;
 b=j8PqPPaOhWr9n9lovQd0CVjd0QwrMmCRNxnOLj7+qF//i8k7Lj/923RH+TuGwzWNOHRcnHSDyAqr3N23gv1F9h5eoyE23VhESUvQMoCorGZv3HPzjI6O6dY558MvmJruEWC1v64IEyRcI3IQqa89EE7hikq0dwqAWKR6JW07yDktb3o3JIjMp7Dz0gcNhE0INtRJDwEdApiaxAuRfHxSuKJTLZs3E74THuK4qA3vE7UT1Q20t2fQmb/bk0D4I0goo+shSDkQSaItFwwLursLwDhxWvo7jEPGVjRByaJbZL6+Gv3t8hPDQlJHnICBcNXhirkf5nd3KHAQrnZXOubN8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+zqZGPqfnT5MVrIi37WQFaIf6fuLMsYpLckidDxeS8=;
 b=X/eaUmwPTaHbbav2G5Q7c8e2osiyFc8R2cVrI3PwdMf6VG8+RvbAwQOJiXjIxJgSgoVtkde8jRWO2Yj4aKTgjaIGvUDqBOAYT8NXxPCE8wPvt8xv0MtcS2ejxs3Dg0H0dRNeE+3UZOjEMLD3LuMlLIj5bskjDzcwB0z03Zy8kAaPfY0Amt/9pLs5SAsTEE3hNTNa76ivuhxeqbQykN6zFbJSzdk8OCQf2Lp3hhFGUnjiuwvrdPl7FWcpiiHjWw5gT/4cN4WSqBt2FJF0W7ilMQkusc2YEfgObqEtJTcm9vdZ8xlTQ/G8HbiSBmteYIK7RyoH3mHD9W5dixWgaNSqYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <118fa3e5-e1ac-ab3e-8b86-1ec751513434@suse.com>
Date: Thu, 11 May 2023 14:08:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH 7/7] x86: don't allow Dom0 access to ELCR ports
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
In-Reply-To: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 473e6907-3e34-46d4-d0cb-08db521863e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cOZvflC5zg2EVPAOnJ36A7aTTo+8zh2mLLhgqvwgKH5bbUJZTTMJxxDyxukYqHUKmZ4mWfK3VWvu7697nS/3JUpz8dhgjH6eWXXWiQvQR/NCvq/z53tj42Bt3Crq6U1i84KSsM+og4RsN9hzAmddkZMLNHgbqk9YDAbGDOwuox3Uc0cuEPM7elksG32O0UrVzC0dimyC5OiZ83tVnn6Wc5C9O7r2U6m9nqU+WcNgphEVdUBORLig/oyKi1GkoocMsIZQdp+S0HhlwCdyp/KtT7vba8rXkdA7eR/Pts7vigsS5wo8CY+nZAJM4V6wWeP4ahjBIu4DFucmCj96Wsj4I9AqGrvRpjbxLF5A1TWLBnQ6eTlC/xnidjmtcn9WjUoCBfM+O+GuOcB7aETOyHpcjYjWSWgXZGB9BP4Ua9pR8RUIWncCV7Y8x0lGRQyTM0ZupuSX0LUc1aEb2HS83G4IhBp0EBOaRVTbkBiVk00WRIqXdFlMYLo/jc1Fuv73PjdgjDJvYEoTfv1VAHy6OVJ38xyxvjS0xY7V+0SjszYup0Pgl75+hBblsTiyRaMCoE66DIeRJtY4HGS9R9eM1qBwyvWwHd7xN658p8RBCt2AWavGpIqWcszBotGqAEF7pcqjUJt8kaStU58y7KCxgTRP1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199021)(31686004)(6486002)(86362001)(41300700001)(2906002)(31696002)(36756003)(38100700002)(8936002)(8676002)(5660300002)(83380400001)(478600001)(66946007)(4326008)(6916009)(26005)(316002)(2616005)(66476007)(6506007)(54906003)(6512007)(186003)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUhTSlFYNFhvS2duZkZ3Qys2YndvMC9PekRabzFjTGpRQmZNbG1VM3VpRDRR?=
 =?utf-8?B?UFVyWnBXOTN5cm9Eeld0ZjJTT2cwSWNGd3JHS05PUlFOcDBFWHo1SjVER3Vp?=
 =?utf-8?B?UVJhMWFTZi9lNjRXY2J5RG5CUUZmSzZSc0EwRFpMR3pnVXFjb3lEczMrWUh6?=
 =?utf-8?B?WlhFYjIzZHM0V21lUXloclZ2YVdWUFpjTWZwYmE0VWdSYXdwUSt5RmFPWngx?=
 =?utf-8?B?Z3ozL2JIZFBkdnN3cWxLVGxVaWlVZDBvVndhcFpldVZjTjRiUnhPTHdRZm92?=
 =?utf-8?B?dkZMNFMvN0xoNEZNbFc2dWhMY25TWGtkUzhlblBuTVJQbEFUcGhkelJsT2FY?=
 =?utf-8?B?V3V1MUwzWVUrQ0FRREFCVUJreFdUcmdIdXYrTlFCc3B1cm1aWjY3SUpWYzVl?=
 =?utf-8?B?RVNRWkt1RE1UYVkzMW5kVlloN2Y5RStpckxuZk9QUkhCT1RHTFBUellYejRQ?=
 =?utf-8?B?M3BmOFVEZWY4VkxpOVVJUGVPd09UMzYzWTFPRi9kWHVRUVU4dUtBdmRVNmd1?=
 =?utf-8?B?dDBOOUVUVzFCbHJzMy9JZjdxRUJKUnRuRXlNY29sSXBPQk11bnZlU041VkQw?=
 =?utf-8?B?cmRFV09oMFRrNkhhblEwSHdsdEtDeWdVcGxzcld4S1ZBUVQ5eDRSZXdMSEFJ?=
 =?utf-8?B?a3pyWmJVaVE1SUR4UjQzVHN6YjY5endsTG9GTjlmWmdDVk9KVHlHQmlZYlQ4?=
 =?utf-8?B?REd6RnM3QWNOQlRiRm1YeDBnWGtvUFNUUTFQcDcxSnhGanJ2RVIxV2YvdXhX?=
 =?utf-8?B?RmtsQkdLVDRBK3pNNE9Lb2doRk9YQ0JGNjVObzlBRmJmcWkybDlmSVFEWmx4?=
 =?utf-8?B?SFJNUjRRSDcrQVVrbmFvWTBuOWZrTjA1bWVNb3BnOVB2MVZuZlVJNmppUnIz?=
 =?utf-8?B?VkdVd1hUdGpWSUhncmVXUTdRRWxTVjVJWmEzZ2N1bUdzY3hndllKdUo0WC9p?=
 =?utf-8?B?R2NIc01lOG42RXcvRkdHUmtOSCtqbUovWlNVeXdBRFQ2cVZsOXhkY1YrZDVG?=
 =?utf-8?B?YVBnUWEzeEQrU2RwTEhnT2lnSWxXTFYrWnJUZWZlaytHaEVHaWJ1OGhmTnBi?=
 =?utf-8?B?cFZ0MWQ5MHNEOHphZ2p0d2h2NW01N1JiblVZUE15dGpNL245Mys2L0psQ3NH?=
 =?utf-8?B?WmxWN2RCMG1zNm05WXlyMDZ4Yy90WnNwdlVIck45UjdkWHNPZFBIVG5SdW02?=
 =?utf-8?B?Q0RwZVhXQlRzaldDKzgvc1owZlVrOGVOaDhybkZxS3lWbTBVaG1YK282Q1Ix?=
 =?utf-8?B?TDU3dTIrSHMvWTlpZTFZa2JsSjlqczB5SUJLcGxjNDlVcHFqT05uR0pjL0tq?=
 =?utf-8?B?R0JrZG15UlVQRHpaa1Z4ZVJsazBhczNyTzA1d0JQVnNOaGVORkFZNjdETW9H?=
 =?utf-8?B?Sk5IbnJ1YlNZcXRaeUNtUjhmaW9zSmRMRzNjdnB5cSs5Q2ZscTBvQ0lqRlRz?=
 =?utf-8?B?MW51RkhrcjBRTHhmb2xETTVGYmhYYzB5TG5vcEJGdm5lM1l1YkxCeitxdGhp?=
 =?utf-8?B?bHEyQXFJRjl1TTkrSjd6WCtabGRLZUxwQkdlSG9FeFFxRHRtQUdvWGcrb0V1?=
 =?utf-8?B?R3FQeUx4Ukl2Tm9pV012L05DSmZ2NE1iellWSEkyR2pnd3I5VlBYS1V4K3gr?=
 =?utf-8?B?K0FQWVZvbU9RTTllT0JxZzVPU1p5aVQwYjloRFByZkt6SlptVk5ncjlqek8w?=
 =?utf-8?B?NVoxRVFRVjhISjZpaHZHMFE1M1JKbnV4NFp1aEVoay9DR3o5b09uUDVydExj?=
 =?utf-8?B?c3R6em1TbzRyNmdMa0pQdkFTa0lOeDdpNWNodmV2SjNBVVJSM0dISDRvblBn?=
 =?utf-8?B?azhNS1NZMnlTUWt0ZVFReFFPUXhCNUtPYW1aRXdKWTJOVnhSWnNJbm1aV1Nq?=
 =?utf-8?B?d0J5SzFrVHBhS2JzOEpWRFR4b2Iyc0lGMUFlMnhGekhjQTlGcjFWS0F2YzYr?=
 =?utf-8?B?dldDdU5jTXc1cURSME1QSFdTQkg5WEFodzlJY1B6U2FMZHZIbGdMODdQN0Z4?=
 =?utf-8?B?S2tNQ0dDSUlYMmYwUzVLNVloa3RuOEM4K3haSWtPbFA0NDFoZU04ckJLRVY4?=
 =?utf-8?B?QzJ0QzR3cDhvamI1YmJoOGdrUEZHK1FsalVWaU9YTXRPZ2NnUHNIQnhSVUFm?=
 =?utf-8?Q?Co6AAniq/G28ZTPT/sY/smwmZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473e6907-3e34-46d4-d0cb-08db521863e6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 12:08:11.3268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8g8PXSXfiaE2KZ+sCDJ+yxYt1jxPbZ9xkNcJHErPsuF80VIhnqxJz7LP0HovPSvZk6CaIWDxs8us17YoRRmAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500

Much like the other PIC ports, Dom0 has no business touching these. Even
our own uses are somewhat questionable, as the corresponding IO-APIC
code in Linux is enclosed in a CONFIG_EISA conditional; I don't think
there are any x86-64 EISA systems.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: For Linux'es (matching our) construct_default_ioirq_mptable() we
     may need to permit read access at least for PVH, if such default
     table construction is assumed to be sensible there in the first
     place (we assume ACPI and no PIC for PVH Dom0, after all).

RFC: Linux further has ACPI boot code accessing ELCR
     (acpi_pic_sci_set_trigger() and acpi_register_gsi_pic()), which we
     have no equivalent of.

Taken together, perhaps the hiding needs to be limited to PVH Dom0?

--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -503,6 +503,9 @@ int __init dom0_setup_permissions(struct
         rc |= ioports_deny_access(d, 0xA0 + offs, 0xA1 + offs);
     }
 
+    /* ELCR of both PICs. */
+    rc |= ioports_deny_access(d, 0x4D0, 0x4D1);
+
     /* Interval Timer (PIT). */
     for ( offs = 0, i = pit_alias_mask & -pit_alias_mask ?: 4;
           offs <= pit_alias_mask; offs += i )


