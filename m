Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA3C72D9B6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 08:13:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547794.855379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8xGq-00076S-CC; Tue, 13 Jun 2023 06:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547794.855379; Tue, 13 Jun 2023 06:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8xGq-00073Q-8X; Tue, 13 Jun 2023 06:12:48 +0000
Received: by outflank-mailman (input) for mailman id 547794;
 Tue, 13 Jun 2023 06:12:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8xGo-00073J-JG
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 06:12:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fd6a18f-09b1-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 08:12:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9456.eurprd04.prod.outlook.com (2603:10a6:20b:4d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 06:12:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 06:12:42 +0000
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
X-Inumbo-ID: 4fd6a18f-09b1-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArfQFXdnb2+bjiawcT+8PXGeDrQEalFxNGFSm+nEklFHCb1U7ogi6Ll4/nUZk49noFZQhgw7/u4Sq6Qn4B0isH9HmeV0m68EFM0PvEsvhPmCch3U33k36zXgT6xrSJ9ZAWuC6hnloRFLoQ8cNqun/nhQtiF1GjHWISapECsB+jbVNcWZNR/TPxDwyoHt7jNrHNSDGaE5Zw+aWHIWN+1sT3Cfr1okaHOuWr6NaLpyu5YeJTZ48IbP7+GIjo8f5eefoc9RrtZ/ynxcuWt2mNVkIiq6JP7ilDK+ql1cvYaHfADwN99u0HjoD846EmccahOHfweMC1PMTmFGifPFwfja7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmI1MheBS/083LswXZTMMBBl1EIZuDCFRIBCVvHzQlw=;
 b=P+Ahk9f2Sz6Jb8ugpRZle2SqSoRzqRjW6L7cS/61FkjAPNcyF/xxPKBCJaQQBJJavHT7ZPlIV6Y37OwImq1tdyktTShNRu4j6nUsgUQFBSnZXlTOE8/FhTyOKUcGfuDCr6c2W0VKqlVwFyK/7OPPDzk+B5TEgC90hQu8pGjyQQge+/Klag6lF660pngfeFLNQym1dmgXprIlXmkFmyN4+bAb3E6QVgzdo9oqFT2X4eA51lRWB4V4ZcEC9HXsHDX7z5riOxOw/MCcO4vWl5xoa2H99dLRHrWg28OKP19cN1iKFw9UhOIMTfTN/ARmK6Ygp2SckphrMMTqzQmah3eryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmI1MheBS/083LswXZTMMBBl1EIZuDCFRIBCVvHzQlw=;
 b=omcrWOYyjoSihaG8OBELUA2BmZCRqL8gnLPuJ7pjIfK73z8CiL5CyJ/OQWGNRtNSE48CqnwO4d5ntANSPPuAv8qQYNb/vn8L48gxLiO4gZrUDlQeGkBYHqNNCt/iIqG1DNaHmhqeSViYNXPN8SwCcGsF/X81iMgslyVx4FtGtXRlzxRQ6Kqm95irtfnYGJ8tSRH5YL1xSmC8GgSfDbc800Qxv9toLYvD1H15E8Ax69DeaPd/j+5D7QgwqKPVPT80hOaH8Kg/3uMRsyK+J1lslVVjoSsXi5HqZmLDHJD4h41EdHBl56DPOGuIF5x9H/tVDmJWrzeTtyXku9KYh+c7Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <063c5302-9a84-5f3c-5d19-926d09de5623@suse.com>
Date: Tue, 13 Jun 2023 08:12:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: minor tidying of identify_cpu()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: 96cbcb61-407a-4484-dff6-08db6bd53260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EXAod6xY0Tmj7QNPxJmbK4lYcwUMb0/a74NYxgzRGHzHrUm6Cu3yyqAGse+wDvM3iKIVkqzePXLJNwuAStCa/z6oZ2KcUBy0DQUjB5hB78TCf8usRKlnB7bq7k5aMLdRlgOFEjeRO9b2hupFkiv1uFeFKIlmEnQkH5GC6OmZ3WYjsOnr1rdmIsfUyYEvybSReFRFp3x7GHHor5nKkw4zhXnRz1p1z1AyupTBMKqIZJy+ur8aLyVnc+jWNKhKVB16RvSYM2XtMRmBuz6FlEtM49qLbemllUh+M/l+lNLtfEvjwK1xVzdQrpEgPOVKcOe6SFBUfxXzsdfDP1fu4wPxU+H2j0k7PsifIEy+TQS65BUE9NmcHkzFD2hhoQcM0BoDZkaFEe7u4fItOk28C5RqTnDDdARC6QXvBphQ+BgAAMrsTawEkgd9f1/IhxZqu8TIdhhe3B6PhlLdwWRDmpCPcEuEGGOnEVM+qkmtU8kNgj9fYQYcqPcWv/7yURXUdcMFAoZVVPh+clbs22yDqI9Hxp97VPm2kYYPAFKfppuN5I7+9WmavQsCyleqIE8ErNPgMu6IzpRDnR+qZ36qJO6tZzG0cIcdD7IP5kZkFgdUi1/ihRUtkHcx6YjrYj7wFL0enQrHz/FzEq/+2NnGsGKXag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199021)(54906003)(5660300002)(8676002)(66946007)(66556008)(6916009)(4326008)(8936002)(41300700001)(316002)(31686004)(186003)(2906002)(478600001)(66476007)(6486002)(6506007)(6512007)(26005)(83380400001)(36756003)(86362001)(2616005)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWZ6QUI5MGRmR0ZzQzd5QWJENFYzUEhMYTFQM3JNTjh0WWNNRE5XeW1IL2dJ?=
 =?utf-8?B?eUlEYjdxNmIzbXhJanRFdnMreUNLdWFoSktwaWxaNUZSUDJFM0c0U2xmNisw?=
 =?utf-8?B?MTVCZFhobEtBS2dKc2tDKzd5TzlyQmdyZjcwR1hFaEU3cnBvV1V0Q2h5bzho?=
 =?utf-8?B?M2ROSUFBNnhMek1UeVhFMDZxbWxraVFHaTgwMzRrMFFiVjZDWlkvRkZUOHVM?=
 =?utf-8?B?VllYbHlNbHlmTGh6eStFdmVmOE95U0pUUWJpNDl6VVNQSEcrcXk0eks5b09V?=
 =?utf-8?B?SS9EZG1UOVdJZnRlc0daVjhrZ0h3ZVZDbEpEYWdoMkNWWGtEaXZ1OXVpRTdw?=
 =?utf-8?B?WEgxMkx2VGhEbU1aV1pBelRIM2RvU2Y3R05qK0FBZUdmMEtlY0o4V1poaC90?=
 =?utf-8?B?YXUrWG0ydlVWdlRaREd2OElUd1FtUlYvZk9qVk1qaU1FZm5YSGVCT1ZjZ0ZI?=
 =?utf-8?B?L1h6bitnenovT1Zkb3hVTFNYVXo3aXBUeVFvQndNN3JreTQvU0crQmZPRlJW?=
 =?utf-8?B?WnRIckxkRjVlS3VlMnNLSldMNHg5WFF3UW42YlR4bW5CZStJTnhrYW9sZlRp?=
 =?utf-8?B?ZU9EenpqU2lUbUFxQXd0WnhqY04zbUV5RXZVWE4vQ1l6UDgzTUdLWElXY0VM?=
 =?utf-8?B?TW84dHdzQmVmd0VtUVFiL1JLV0RGenMxQ1YrS2JEYXc0S2Q0U05NMUQ0dUtD?=
 =?utf-8?B?ZjBNVWgyY2wyN0xJd3ZBQlc0Sy9IR21JeEhnSWhJZGFqVFdXaTlCNmR3Z0VM?=
 =?utf-8?B?UnJGWVJKQnB2NTNUYUJteUhwWEpWdUxHYTRHU0NUdlNEM0Z5cW9VVWlic0xQ?=
 =?utf-8?B?OFVqK1Fic0hIQWczdzJQR3YyZWxqb2dyc0gvVkZvL0RnRkpiUklLYkh1Mndi?=
 =?utf-8?B?THpqWlo5T3NyS2FZeTRZQXVVeDFERnBXdEZheW8zVDVGZUo2NUZPWTB3WUwx?=
 =?utf-8?B?YmlZRkNJeG5iMTZtU3A5QU1VMlpqbFE4UzhUWUgwN3dhbTNTN1JUQzlBYngr?=
 =?utf-8?B?bitVdG1xL2l2anVQcWNSRTV1MUFEZ1BrL3FtdXpmQU94emQvc01KanZuQ3c4?=
 =?utf-8?B?WldOQkFXZmRzajJPRUUvekwvdUQ2em5VMlllRVhKTERKV3lPQlV1UUdma0dv?=
 =?utf-8?B?WGdRbzE3QmFTZytuaVMxdE1ZdGVzSWFZUGV3NHZRMWlRWHhRSkRnblhUVC84?=
 =?utf-8?B?RWJNNENoN1FvY0ZaOEgvQldSRE5Pa3JudE9aN2o0S05IMW1GeVlaWWlJUjV6?=
 =?utf-8?B?ejVWOGw0UFVxUGVGeGpDK3IydTJ1VTYzUnUwdS90dWFvVU1hVURRdytYekFw?=
 =?utf-8?B?OHR4Ym8ya0JmUDh3N1AyVzljSWFWbHRIMjJSNzJ6Z3ByZCtKM2hvUU03dzBO?=
 =?utf-8?B?QmZNVllRZkZhUEk5N01ldXpPNnpzS1piQzlwbGRpTXM3MEd0ckxybUFadEhO?=
 =?utf-8?B?MXE3RjQvZ3FLaGpYUmk4RnM0NFk4U3FQVzRPMkZKbEJpUVo1cncxbWVDazNv?=
 =?utf-8?B?TVhnOU1XQ3ZzT0xoa1ZMVCs5WHRlbXo2bjdNRTJHRUhueUhNempkR1lxT0dy?=
 =?utf-8?B?SlphaDBLM3hXTENGUTRZVFFPZVpMeW40SnlhckFMeGpYdGxhcm5XcWlBVTZ1?=
 =?utf-8?B?S2xEOUVzd3JXemFQaTdNS0p0UHlFOHE0b0RvQU1aSDIrVmNLTEtaYnpKcENX?=
 =?utf-8?B?UmpGL0gwYmRpU0FJNVNMclFKSjVXb2syd21XaElOek9Vdzk2ZmVvSzJveENp?=
 =?utf-8?B?SkFmMUc2TjhYNTZ3WmdvcVdMTmN2MnZ2VXJzUEV4Rm8ydlBTMjBFbnQzVFgy?=
 =?utf-8?B?V0Z1VVZuaVBCb0R2UEFJSTVuWFJIZG9kYUxxYmI2QVpZNDJpbk94a0VZSy94?=
 =?utf-8?B?NXVnK3dqc1huWTQyVzVxVENSTEtkSE9uSVZTWFR1Z28xR1BHeGxTeXAyNXBt?=
 =?utf-8?B?bHk2bE5VelhOMkQ5eXl6M2R0ZlpyK2VrYlZ2bHVHMjNXUnlTWTJraEYrMXdQ?=
 =?utf-8?B?TThxc2JTanpUYnVvVVhDS1F3YU9NWVNiK1MyejJTOEJQSkVWN0k5V3ZtbC9h?=
 =?utf-8?B?NjVyRlRaTWdDT1ZHcnRzcXphWWVXUk45am13N1J3MUQ1MGRpWXVwNXJFVUV5?=
 =?utf-8?Q?9fa9x7EUrYZyy+yGlZgi3TUnu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96cbcb61-407a-4484-dff6-08db6bd53260
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 06:12:42.2667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DaSPzYuyd2VxGhoAg4aVNMWPxsVie8Z0Sv010PpbMFUCchvmXujuD9b8yd9/Nar/OC+t14apMYQA6cwAgAVAhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9456

Fields that generic_identify() sets unconditionally don't need pre-
setting. (In fact the compiler removes some of those assignments anyway,
at least in release builds.)

With the setting of ->cpuid_level to -1 gone, also drop the respective
BUG_ON() from default_init().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -114,8 +114,6 @@ bool __init is_forced_cpu_cap(unsigned i
 static void cf_check default_init(struct cpuinfo_x86 * c)
 {
 	/* Not much we can do here... */
-	/* Check if at least it has cpuid */
-	BUG_ON(c->cpuid_level == -1);
 	__clear_bit(X86_FEATURE_SEP, c->x86_capability);
 }
 
@@ -492,15 +490,11 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	int i;
 
 	c->x86_cache_size = -1;
-	c->x86_vendor = X86_VENDOR_UNKNOWN;
-	c->cpuid_level = -1;	/* CPUID not detected */
 	c->x86_model = c->x86_mask = 0;	/* So far unknown... */
-	c->x86_vendor_id[0] = '\0'; /* Unset */
 	c->x86_model_id[0] = '\0';  /* Unset */
 	c->x86_max_cores = 1;
 	c->x86_num_siblings = 1;
 	c->x86_clflush_size = 0;
-	c->phys_proc_id = XEN_INVALID_SOCKET_ID;
 	c->cpu_core_id = XEN_INVALID_CORE_ID;
 	c->compute_unit_id = INVALID_CUID;
 	memset(&c->x86_capability, 0, sizeof c->x86_capability);

