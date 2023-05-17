Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2AD706AF3
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 16:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535922.833973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzI0Q-0003c6-ST; Wed, 17 May 2023 14:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535922.833973; Wed, 17 May 2023 14:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzI0Q-0003aA-PX; Wed, 17 May 2023 14:19:54 +0000
Received: by outflank-mailman (input) for mailman id 535922;
 Wed, 17 May 2023 14:19:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzI0P-0003ZU-RO
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 14:19:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e39fc9dc-f4bd-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 16:19:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9311.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 14:19:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Wed, 17 May 2023
 14:19:51 +0000
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
X-Inumbo-ID: e39fc9dc-f4bd-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCHrgDsrod6cFbj3SyZihSRlKNGb0cuIA621fRr/kYg3Is0WLWlrPuTsboV7WX8NzAim565Khg0Q2s60jmfMnR58OyweIvLWAaluywvJ8lD9CqT89kPYOuzyj5tAOHKPxZXkdlmWDveO3lKiq4gaaMrJTole+su+T/CdZyuJXfJyFb4aV4pqRlRd/V0nwYA04VtsQZNJBUZGOjr2enHenQBjB7nDCWkMIbM1q1/h0jwuapjLOoUWVk54NRqGST9u+Lp6IGWGyNd0HJQ1cCWiuD+Vs7f6Utbtrwvc0N+9GgG3iH/+MQsIm0lFGsYdPQlvr/xWqXCgpMVwidcFRNG1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bJnpVJS26DUGOoYs8j6hlPZt9tMU0BLefLMqRo512k=;
 b=Ns6u7gPe1t7Z8EJgTMrcxUdb+MgA00pCHNmm6hXRpBUiwSLc3ToTWNZcJrHdJkU4TWqLD343TULwJW83PNAoZ+xZ2M+c6YAbwDMNUC51ajuok6tvuZkIIvUbDf5l8usYU2sXfXC3vzRmMe8huKxUHmeRD6WD+4jWk3EuFYWgSuzvu2lyfsnaDq1Pv+Zuzpb2Y/1LLLeh1p2MlnCv5yM3eyWJdhfQjXi9w9OjAZQZVi5NofB05iTMDI1mPTqlZUHkQ8gD3mokRvn59pnMXHUmi0vIPvIGoMPQOX3GRx5IodDiEZ7sCrSl9kl1JeOc4FWvUKHHu0x+VR5vFDoICvHX+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bJnpVJS26DUGOoYs8j6hlPZt9tMU0BLefLMqRo512k=;
 b=atW2emvpAXsT34hLExMu/81Gwxz4FsVzOiHuhUpSLhCSm4UfBCXFBAbGu+riy62awmn4fEjfnMexF73JX2mPDzkP/1mekGSHEn4I1/8xDMYAtmKZK95wThzvI5CLIyRpJfm7TlTFLURGPx0BjTex7bQgDHQ8Os5kuLMHsQVNRBaHxtWvc0rZdXqr6jyGk7XpZjX9e3HscfljWJjW85E9B3ZYGF487Vez+0IxM5fR8TtT0xZcqNqawQHgR6pauTkwwX1iAYgGsI9riHEEBlxOkWsorA1yYr9SjlJzw+5S/7gJ0aO0OajK01tvrbGBQmMXHp5MUu0MNgUUINiC9zlzjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f444ccc1-51be-e526-e8e2-7759a68a743d@suse.com>
Date: Wed, 17 May 2023 16:19:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libelf: make L1_MFN_VALID note known
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9311:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f1e226-f99f-426f-73f3-08db56e1c6f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uR9Nv5PNtqWxjcNJ8OvISQemKsTXJud2sbzezaTg78Kd1F102ipjbClF/cF3pF3ugO+/YoG90eqCugx/jcaYCarYSwT4KXG2HVMu7dCppfUkQhuOqK7eTdEWorgVuSAmEEv238yNO+Rqzh7Hm5TZL4ODD73Wbg5UIF3WAEkmbnD0t4ZG6YWxqAjAsUBVkOi2QQ0PibteLCPUNFytG2eCv1L5A7hotO7iK9w7QNY1SbeN3V1SQdUSAecZ8k84LPTa16MvmtisU/8E9wSeLV4XT6ZRhrvld2Wa9rfzQZ1ndsMZaq2uIBQ8l/SHxFL1ND0TlCSOQuIl4ltNH2yAy61lpi44dD6e2y3HTic1GYnMpesEGeoo8WWgTpxG0hZOWEhP3eGX09q7EDtumavJEZGrEGsc8Z/brgv8+EijSqGpjKIE4CaaktEtM4PZIlz+JMDdxkjOCAjJQ05vbnTdVzdySaTwAPsjd4keqeITyVWJWv1MgD0B8DkFltJVGXzwISfPszQ8BEluEkMv8urUQD6md+GMbAPJ5KhFLUxIZyv+/chixaWwbwqRmZPQ8jv1ig1j89skp2kO68ENxCHEvm/n+A+muu9woZEDuI0qZ6b7EJIZZ9D2sbHrxrk0bsCnuvq+riL+E2uOB76M4G6BBj5qfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(6486002)(36756003)(2616005)(83380400001)(6512007)(6506007)(26005)(186003)(5660300002)(38100700002)(54906003)(31696002)(86362001)(41300700001)(31686004)(316002)(66556008)(6916009)(8676002)(8936002)(66476007)(66946007)(478600001)(4326008)(2906002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGZqeG9wVEh3akQrR0w3cXJPdDRuSHU5K2lZS2RTL1ZuQ3FQcHYyS1YvQXoz?=
 =?utf-8?B?WWFTaU9UZEhKS1dhc08zZ3pHUDNoTlVWclB5Um15TmpLaWJhTURDSnVEUG1F?=
 =?utf-8?B?cWdwVFl1eTVWRktXcGhGcHRCRkZwZkRGQnI2WWVpRFEybUV3anhLa01wZ3Rz?=
 =?utf-8?B?UnMwL29DQUR6S3BXTEdadCtWVC9QVFViNnZQMUR6dGJJQVZnZXhXdUV1bktX?=
 =?utf-8?B?U05ZeTFUSi9pbmxVNk9BK0RnSUFFM0haYjJtMUpHcG41aDUyVnFoajM0ZVFj?=
 =?utf-8?B?NmZVMHZrR1Q3LzVBM0NnRU1YMTdqSHMzTUFvNVhjRnpPbTVydXN6azNHZ25K?=
 =?utf-8?B?NFF4c014Q1hwTkozTFlLNGkwbm9veUh1elMraHUwUnc5YmVnbWZHWXltUmVV?=
 =?utf-8?B?SlB1WWM1NGNpL1N4eEIreXJpNHdnWlltVDgrRlpid0V2STF5V0VoTUgwWFZV?=
 =?utf-8?B?eDM2R21mNHc5L09mbWNEdHBKeThTNlRsZng4a3FubDhPR21pL3gvT1hxLzlS?=
 =?utf-8?B?TStoN0lKeVg0bVN3RExId29GTWZWR0RLVVFiMU9sd1VPSElMSFQ2dVpVQzFs?=
 =?utf-8?B?TUQwc2dudDEzL1NZb0RubStVeFduUUhob2NjOFNYTVY3ckJNR0JIOVN5Q25Z?=
 =?utf-8?B?b3orWkc2cHZzam4vOC9hQW9ZazY3aWhIYjRTM1kwWEROTC9Tcy9UWmhINzA5?=
 =?utf-8?B?ajF2U3lpd1M1WXdFcWJzbm1wREZZMzN6V2w2eUQyZlh3Q3dTemtvR1hOdm9N?=
 =?utf-8?B?NlZ1ZnVXZ1lyZXo2cDhXb1I2aE11Zk1Wb3NMTnQ2Um1QRE1Pc0NGbkhIeUJD?=
 =?utf-8?B?akw3ck1MY1lXT3BuQVlDcWtDT2VIOTl0QXdGbTBCSndrN3VGQ1VNenJIUzBr?=
 =?utf-8?B?K05KNWhDWkFjc0o1ZlFFVDhHblBXL3Y1VElnL2tTS3VHamd3cmJ6eGFaV2hl?=
 =?utf-8?B?ZStHa1ZITjZtMVpIcE91Y2JZTzhNNVZKcUFJdlJUODhqYkFpVmk1MmVITk5N?=
 =?utf-8?B?Rm9XOGVyek4vN0dXbDVORkZKVGRZNWFEaGoxZ1RBTnRHc2hUQ1F3U2RheDZi?=
 =?utf-8?B?aThyTE0wUUlrNTN3SHc4cCtDS0tUV0JodzVjdWV3eEpTOTdNWUVySkZ6ZXRU?=
 =?utf-8?B?VWU4eDFGTEFpZmR3MkdCbUlOUFNPelNQMnBIMkhRcXltUE5MaytnTDRPVSty?=
 =?utf-8?B?SkNWM1JhRVdya2FPK1BvNWlKaHFrczN6R2dHQTBRKzdzdjhEbE9Fdjk3NmNs?=
 =?utf-8?B?amFWSGJ6R3hjMUNjeVE2Y3BLcXpOM09KbzVNY1l0c2hYR01HcFI3TjM4eld2?=
 =?utf-8?B?TjRWcENxY0dwZHdEa3l2c0p1cFdzKzJDZ2Zyd2l6d0NNcm5kM3QzTXYyWGdY?=
 =?utf-8?B?N2RUSytNTDU1dnRLeE9LVkRPaWNIaVBUdVhOTS9NN1ZyMGl1bjBzOWlIYVE0?=
 =?utf-8?B?ZDhTZFN2Y25XOThSOWpnbmxkeFBlWERHeUFiWnYzekxWaE96bWphZWVieDV5?=
 =?utf-8?B?dlF5Wkw0Zi9MUG5PcS9oaVZKb3ZFVFhnTGYwbzRkMFNGeTdXaDVCQnBLUlZx?=
 =?utf-8?B?alNzckdZcTl3bC9ZUDNXUUYxSWdDV1FDOXNhMTg2bU94NjJjZk9RbWIvL0w2?=
 =?utf-8?B?R2cwNlBCQkptSjRHU0pDUU1wQXhlYjhPRDEvRUlmTGZUZzNRaFFUdmxlRVhr?=
 =?utf-8?B?Z2R5Zm14M2lEM0QwTCtlcFJZYk9YR1g5aGJVVHlqS1JmUW9USFM1UVo3NGRp?=
 =?utf-8?B?Z0NMMnYvT1E0Um1VeVBGMHZxUHFaZ2pZQlVGcnErQVVJdG5vNFZER2F2ZUZM?=
 =?utf-8?B?R3NIWEZjSzk1NE5CYlVHVEExNno0QW0wRW5JeUdCYXo5TWxoZ3hVb2dKWGlS?=
 =?utf-8?B?UEpCekJwcEJGSUlSL2pMSmc3Qk91TC9GLzk1Zkw1bVowOVdtbGhlQ2E0Y25V?=
 =?utf-8?B?UENWY2V5ODU2d1I0dFpHSERCcU5KT2FDMXRrOVlOSk1vaWdYaFZnMTRmQXRM?=
 =?utf-8?B?YmYvOVJIUDA4OSt5UlI3ejZqSldLMUI3d245RHhSZWpsQ1MvMzRvTG4xWHJl?=
 =?utf-8?B?TTRxNXJoc2tyY2h0YjNGYUl4ZjJQMGdiZ1hBNGt1UlZvNlNnRVZ4YWs1N05P?=
 =?utf-8?Q?nLpUE2VnKLrmLpB5KMVTbzcQk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f1e226-f99f-426f-73f3-08db56e1c6f4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 14:19:50.9698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8c2LQR9wyVhnHT8noFyH1V7zdf24ojy/vfIjv82ag9Y1ym/0LU4AuRDVzIyEHFhTR8s5OGoYdqBHmg6Zwb9ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9311

We still don't use it (in the tool stack), and its values (plural) also
aren't fetched correctly, but it is odd to continue to see the
hypervisor log "ELF: note: unknown (0xd)" when loading a Linux Dom0.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -117,6 +117,7 @@ elf_errorstatus elf_xen_parse_note(struc
         [XEN_ELFNOTE_FEATURES] = { "FEATURES", 1},
         [XEN_ELFNOTE_SUPPORTED_FEATURES] = { "SUPPORTED_FEATURES", 0},
         [XEN_ELFNOTE_BSD_SYMTAB] = { "BSD_SYMTAB", 1},
+        [XEN_ELFNOTE_L1_MFN_VALID] = { "L1_MFN_VALID", false },
         [XEN_ELFNOTE_SUSPEND_CANCEL] = { "SUSPEND_CANCEL", 0 },
         [XEN_ELFNOTE_MOD_START_PFN] = { "MOD_START_PFN", 0 },
         [XEN_ELFNOTE_PHYS32_ENTRY] = { "PHYS32_ENTRY", 0 },

