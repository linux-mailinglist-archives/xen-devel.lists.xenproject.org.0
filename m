Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E48370469C
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 09:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534977.832517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypGm-0005Yj-BF; Tue, 16 May 2023 07:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534977.832517; Tue, 16 May 2023 07:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypGm-0005XJ-7N; Tue, 16 May 2023 07:38:52 +0000
Received: by outflank-mailman (input) for mailman id 534977;
 Tue, 16 May 2023 07:38:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pypGk-0004Mf-KA
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 07:38:50 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2c5e3d1-f3bc-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 09:38:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8988.eurprd04.prod.outlook.com (2603:10a6:20b:40b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 07:38:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 07:38:48 +0000
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
X-Inumbo-ID: b2c5e3d1-f3bc-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsbByeVcUA2TyjPDo+eQZHTPCcDRQAcRIzA26v6kAm4IaqYEaFv3oxCdVG9DBhrlXNjhJhgfGG/QwHZfA+sd4J3uslvJ+nbH8ebxDTKSAxH9Lw3PQUoUNrRfigarVlIgZ0t04CqtrXh5Nut2/H6z0FVZC00Zv4ztvGTwXvChZQwyZzp9dHq3CQI6cMQ9899Wo8SEkTADxPeiFDruccfAEtOpeEbYkJ15mUFFm6PXtTlDnVxueqY+XgZeVXbIGExU4B+bql8dUe8hS1tmMqpDinMeviRB6/C1l8dtNVkW0oJcOQsxWsRbZgHJ3+C0DIZMMENa4qBh2B7+ecznzbopSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Je87SJkHd+CatcG6yu9Imtn4DlVtYLFfArWG7ib5DLQ=;
 b=g22gCHQBtUmWzEcRCNdnuLtFvbJF2keC/W5fLxStVxFoKzaNyoDkiqZazmS78d5HZnNa/odYGrgP2L6bry+5h/U51/ag15++MCBq87D0Zk5BYGgVJgPUDRSHXHZXeCEIW3uxDmMAIqCMZeNRVkqyyRoenS77PQ8pDR3HKcGxeqMkH7qPdQZ3eQQSzCYIum5nhOLxr4ZbxfKz/HDrmsBgQLyNaDXjeP8JsSPpvhDhlA/zF33ur25nZMzcbajCAYf87EaHEMm1ruvoSbwwRIkSZGHbe1PRJypIBbeIQQDOEDdDJLt9o6x/d5KY2V3TS+IKWaRBo6qmXThfwXdn5BGmBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Je87SJkHd+CatcG6yu9Imtn4DlVtYLFfArWG7ib5DLQ=;
 b=qQMD8gXRPi+CQFgc2yZrSKP+ersXlQjkow/OOxqCXtOALVXlxpsTcY53uBN/ylhy/rnQ9dybsAzerWv2/Ds2s8JYzlrGsSxrtrJkfg8OfcUc/S0WVG0GR13jn68dyXVWolt+7rEM3VUkC4FTBe6wxafLrIgluaz+xv1eKlsThSSaKeRE/riK/0x1vSP0Jf4v6zw7O0uuDRDiSla00joNegXsbslOnyHWNLsX4/Vy/X1H8J2W5GFIfN5zc1ofof9QP/XE1cv8THaP7/tQIxoxegbk0GYv353OLaks3GL4GheHRnRr25BKeCOSzoruXBJLZlhAiFSV0vVuDwHH1UvKQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e3aead11-f7f5-2ccd-d598-3e6ea19a0ce6@suse.com>
Date: Tue, 16 May 2023 09:38:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 03/12] x86/shadow: don't generate bogus "domain dying"
 trace entry from sh_page_fault()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
In-Reply-To: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: db10e3db-deb2-4e41-8405-08db55e0964a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EiqFP7aoEJ9zFyqiC1Vn9hp85I5mBR2FImPg6n//IMGyxkHsbou1qp7YI3rQsav3oMHyeplVXTXp65wSp2t8nXGcM8OT6AK+MQV6W84jhfNXQPCh8WL919uUh10fH8L7dyBZtyZPaRh9/MAEsd7Nb38vICs7Ju2V6NYVxZ+md7o/Gj+VIt/K6UkmbVNA0n8zpHG02PdQ+jchUXOlDZs7RFY26EjsbUHaKV/EAhBeZ8WiKvkn9dh3+HgbllzKcQS5/S9P2dR8ZpOtONPGOx8GxKOBr3y0bFSd6Mog45FfhFZ+FxgQuHHhNHIzcBIowR2QiTdol6Tv97eOGtpWF8KNyDOadR6U8EqXWl1lEZnjspGgkQLO5VH7dGUFj1rKx06pCjtAmvdJHVnc+5QskopYXrZWWVq3j5zbJFXnmj/UIbwCPkYioMyrkTsxQp5yJl+Dp0ip+s8bJh31AY7gpQ1kIN9Cr5AEYzaFe63R6dV/LfMkbJu/JS81ES9/v0W9hDCpFcRcVB9C4pomBVr7VoysDRlXG3dbGKoxljnMv7GwLb5C4A+NAtBP57I88IdBFfJrflvuLY4OqUJm04pgmRC7quAREhjtn/mI767CdxrZ9Nzo29Q6p38ITsu5shW72Xa+7NSM3c1GrY8c00XteGP0eQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(2906002)(316002)(6916009)(31686004)(66946007)(4326008)(8676002)(5660300002)(8936002)(4744005)(66556008)(66476007)(41300700001)(86362001)(2616005)(478600001)(54906003)(6486002)(36756003)(6506007)(186003)(31696002)(83380400001)(6512007)(26005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RS9DL21rLzVEYkhRcFdkb1VnU01Yd2dOSFM1U2RHMWs4c3RHNzlwMjZHUFFu?=
 =?utf-8?B?M2krOHJMbmVkbllLVnhlRW5YTU1rRTVscDJXbkdzZDNCUk5Ld0g5dzRHSGdj?=
 =?utf-8?B?bkwzV1E1WjhhOVlDUVVETTZWOW10akV2dVlsbzN1VVJ6MzRRbWw4anhyWVla?=
 =?utf-8?B?bmUrWFM4TUY0NlNiaHpLVHdNVGV2WS80NzlybnYxbjh6MG1jWkpwOUFGU0RL?=
 =?utf-8?B?YTFBaFhVMEdrVkk0ZzIyMGkvb1dpSFVVZVVVRHRGTDI4eVh2clpITFVibWEy?=
 =?utf-8?B?ckN1bzNUNXg5NUw1bkNtK3BScnY5MHVHVW1sVTFLQ2d3Z25XVkJEdDhxeVFV?=
 =?utf-8?B?SHE4MGh3SVdUMVRoTDJCSFo3RVFBK3VUcEJUeTB4V1p2YlRaWFhJMXpZVFZX?=
 =?utf-8?B?MytUMDE3K1NUK3c5TnhQVjZXeXBXNFBlU0lNbVRoWjNtdjV5U1pkSGNxNkhx?=
 =?utf-8?B?VDVZVU1RRmRCOG00UkxGYTZobG5oclBsWTBPL1VYTzllOUcwVFVuSHBNSHov?=
 =?utf-8?B?M1JRSDl6WjJJMERmSG4xUVBjRHZ0b2dHeXBmcVRYTmRlNmRCR0w4aWJCUlda?=
 =?utf-8?B?aFZEMHlPQ1QySVEyd0VDdW04d0dlQ3BGNElQTDd1K2pRRjZrd2FJS2Rzck1C?=
 =?utf-8?B?dmtUTWIvWlZUQjBJcGFWbFVvRHFGd2FmWUtpczVWektjSUV4MFNwU3kvaHpv?=
 =?utf-8?B?Wkh0dEp6TlgvN1A4c1lmVVBseVo2MWFtK2sya3c4RnM3U0xva3J2d0ZJcEdt?=
 =?utf-8?B?TzlCS2RuUVlHWlFsYWJWcHVEbmJrZHBNcjNnbGlDVzN1aHNMeGFHelFyRHJU?=
 =?utf-8?B?ZWZlQmw5bGNWZTRPTnZEWnlkZTZ6ZEwzV2RpVW1PRWxkbTNEYVlhdnJRS2tt?=
 =?utf-8?B?L0F0bUJTSHVKRzh5c3VqSlNwRnNPRUx4cWZOZkpiTTBRZENWcmhaMzlEUlZ1?=
 =?utf-8?B?b05PV1JGT1NtR1M0bEJxZGxMTmtPSmUzMCthVFF5OGUyVC9yUjJPOEFPczBZ?=
 =?utf-8?B?MWcxTVR5bTVMelJzekNKY25YL0hUWVIzTXJOb3AvUWxkUVpHVnBoTFBsM1k1?=
 =?utf-8?B?a3JIeExkNThHcjhmbU1ybEYzYVROY3ZESFFlOGpZbjVadGRvTmxtVnBoNkZK?=
 =?utf-8?B?a2xoSTRxTFIrV0NWSGtrcDdhRHMxTGNpNVZnR3Q2dFU5UmhoVFN0USsvckhq?=
 =?utf-8?B?WFhnWmhBcnVYZHp0R1VSRnE2VTZEeFZZVFppaENLbHhjUXJZTzR2ZWJZa0gv?=
 =?utf-8?B?TnlMcE1QQXJKSlBpaTlaYkk5Ty9RVWdvRHlhcGJrV2ZWU2V3SFJJdnNPRHQ5?=
 =?utf-8?B?bDJBRGQ0clJRNU43cm0wMHFnNjMrZ01CRnhFYnF6ejIvWDFuZFF0WE03T1pK?=
 =?utf-8?B?blc3MTd4RzRIVUZ6c2ZiY2hJalJOUENKWnpjeVp0V2ZCR2FzVFJSWUh0VTZP?=
 =?utf-8?B?dStYZmZKQmYxZ0ttVzVqVWpYaTdNVjBMd2dwUjUrQ0VOY3F1WjlWWHZNOFRP?=
 =?utf-8?B?N1FndnJidTNtTG95WFJ6VnlKSzRPQjhTOGdKb2pUT3lkS1gyVGNMU28yQStK?=
 =?utf-8?B?QXFOV1lURXdoM1BDRUI1ZkFkSXpGdE5FWDZydW9pR0tTMHdMbWY1bnZXWU9C?=
 =?utf-8?B?SmdJcWVJbXVod05NRE9aRUF5Vk9hbUJod3JIUjlYSE9RRnpjRVlZQkJXWk5S?=
 =?utf-8?B?b3pnaVBFVVUxc0kzQ0FYMHhYR2Z0U1dWSWh4dFVYQ2crMDFqWU5kb1EwVTZp?=
 =?utf-8?B?d1B0MXd0Y3JhRlhvYkIyUHlMRTJVUEZCZXQ1R252MmswZlduT1pQTzRROUNx?=
 =?utf-8?B?NEpqSGpLT3NxQUYwQzlVc1lTSlp4Ti9ta2llSXZJS1RKMlIrNGwvb3pUZ3cw?=
 =?utf-8?B?eDBYS3V5Vm1wN3hpZnVrWWE1ZWdxcEJyRFQ4K1RFOGFJT3cxZGl2U0dFdWZu?=
 =?utf-8?B?VWdTUWc5Skd5WlFsbFZ4SEo0eHNqSEpUVnpJVWdwUFBTdVhoRXlRZ0RQUG95?=
 =?utf-8?B?dEZ4aDRTZEdmR0s3c0k1LzRtcWdkZVhVQmxBR1AvWmJWcDM3aDFIRmg2d0JU?=
 =?utf-8?B?UDNPcnFDZkVPbitjTWUxZHVEY1hTV3ZwVFdqWjQ5ZlJVcEFTa1pJTjhZRHBO?=
 =?utf-8?Q?uXwfTBm1dhLtXanbcNVApddn0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db10e3db-deb2-4e41-8405-08db55e0964a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 07:38:48.6813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bF2Nbgncv27JcrxTSu9ShI3vhc/8/rLz00qzh7Rujxt0g1yYYPqW8waSrWNz1LMO5lM+QrzehQqCmF9HvE4ojw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8988

When in 3-level guest mode we help a guest to stay alive, we also
shouldn't emit a trace entry to the contrary. Move the invocation up
into the respective #ifdef, noting that while this moves it into the
locked region, emitting trace records with the paging lock held is okay
(as done elsewhere as well), just needlessly increasing lock holding
time a little.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2480,10 +2480,10 @@ static int cf_check sh_page_fault(
         sh_update_cr3(v, 0, false);
 #else
         ASSERT(d->is_shutting_down);
+        trace_shadow_gen(TRC_SHADOW_DOMF_DYING, va);
 #endif
         paging_unlock(d);
         put_gfn(d, gfn_x(gfn));
-        trace_shadow_gen(TRC_SHADOW_DOMF_DYING, va);
         return 0;
     }
 


