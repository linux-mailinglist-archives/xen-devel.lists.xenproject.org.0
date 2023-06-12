Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60DA72C34D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 13:44:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547038.854215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fxd-00062q-Nn; Mon, 12 Jun 2023 11:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547038.854215; Mon, 12 Jun 2023 11:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fxd-0005zV-Kw; Mon, 12 Jun 2023 11:43:49 +0000
Received: by outflank-mailman (input) for mailman id 547038;
 Mon, 12 Jun 2023 11:43:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8fxb-0005zP-A1
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 11:43:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63aa05ab-0916-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 13:43:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9196.eurprd04.prod.outlook.com (2603:10a6:10:2fb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 11:43:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 11:43:42 +0000
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
X-Inumbo-ID: 63aa05ab-0916-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvobFaYsMTZB7bPUOenSsimSX7kseE52PXVbg2G4SMlTZvDJsxvzQZoVLCELjFh8/BGRoxVteYFBRYW4R3jVl1o4Di9tJr1tZVa5RUJx0PmRJ8cds3vWmr2c24/i9LC7G3f8z2QN3wh6HN1eNo2D/YrQX1cEts4wvoUoTpcZMzdouNzuOKQRWm7GHyTiCyu5KxIiHDpsjb2KQ2BjWkWZEvbsVdIF68QYVyAbv26+ncaMJshrJN5M1IsNnbZH293PZ1Pvk68xCxGl9Z14XgfuuQQMFdXEVYp48fy+3UTojtaf7AxbZvXc0MarWp73f1bbRBiS5OGWCvQogQudkQdUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGkmc2wSqEMHphmPgawD+3qg9wOrKHkL6facag/Exak=;
 b=Wlrsa0TjrnfgBbZB9QhhzAYWaUpnrzugGdKFRmZpYa2a9HCKWf8eK4iWM0S+/LDH+/FD/ASi2421Ph63+mIcnvkLLWMsUtZH3ifcqEr0k4/MBS9EQmxOAkNZpftLEZnZSRWm/2BKH0eFL5T6w95kkOje5tgabBXm+aN29YqsrYzy4odOrr6pjG4jcTQXB6GJAKvXuLsgD+3X0K8xAlO6xMGZNowa69tcd59LoRwaD4ueiccGsj29dOndiLDxLdzc9LtS9Y4kdubR0R3Lumoxc9miPXm7dXrktf5Doe2caKj64IIhIAAFOHoH0AgQ9U+PcWFFSbGkGTzfPMDYOqZIAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGkmc2wSqEMHphmPgawD+3qg9wOrKHkL6facag/Exak=;
 b=qgKjWbpanbwuOZL3be5ZNozKYzvEnBtEy5leyb6GXgnhGykuxd+VEySNqRUpPls8hCdAGFuj/79ueU5GAaDGe4A7HLiUzaVRXGLRTY5qWUO+a6ajwwJIP/eRetoEq0ALhH1wcjDFERYisw6xV7eZiYoH1dCsKerrHPk47UFdsbG/EdWlK0DKW1vmg6sz/ifLmavo8KMd9dTKeDem6W1KqKTcPYQdRuyjI5gy8GrmyrtLfjy2tizkCJBQAQL5/5qBZf0jLcZhwwAUrGSxi5XJusOvxSqEWKAfFammyu2G4qVeMNlG/sVlMCbcIHEKT8jEqXeNzFdtF13vq6O57kugSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
Date: Mon, 12 Jun 2023 13:43:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] tools: address Coverity UNUSED issues
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a04332-8c16-408d-cd4e-08db6b3a45c4
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BdEL8VTJQj3TBrpCtb9foOrGqinOQw70jrhDkXtkROe6Qe88Pq+2jBnRGC+mBvtmX6MTZMeKGQxCr/vvUGrRzEc6Ve4FomGZi5YWIp87TUCK63WtAdGRBH06lCQnHH9TzPzULtu3SZ5xgVa0D3DavL4wOptpY6eqr8o5u15HjGl8VQHQ+135g3ue7tpaW6TcqJp2jCPx7gWU+Qu+VIfloC9lBTYkTaWV/Y35+4A+OJ4wtaKqnc0F4umIypcARE7ZFh9pHAzoVi10kcMzyJG6EfPA4fvicyKY54szx0++KBUH9IPSaEjA+X2MRGdUhdk6AUAn7dwBgSaQAltn6wSejLJgGphFnNYZemyNBHQfGbqFrPqN/P2tXOmpVTkOdwzOWPupgckdfAZ8trtAgNXDBLPCnsz9oui7UvQttgvNtmkxRYM1gozvCzr60Q2LN2VMVF/5cu1e6jqnehd+GNOLuhFQfhU05BPmQF871q1cd1Zw80kDPQtynt0oo4sNPgOEtG7W04dvILR+tLWyFQncx1cFRw6vwSaIrZGcSFPE6G0xelcIqdd+vzAgvi4nINQEnjEgmcuEuq/fMIBi+Fc4aH37I2wxR9rxNhSnMoQBk2hZm/ZSlowOgnM98O6sQ5OvOq6nLFZUiDNeHfEfGxqMICUD77tV6iMVtf7hOM0sGPg+GrqxmMrJ1WcE+6yqPiw7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(366004)(376002)(346002)(136003)(396003)(451199021)(54906003)(5660300002)(31686004)(4326008)(66946007)(66556008)(6916009)(8936002)(8676002)(41300700001)(316002)(4744005)(186003)(2906002)(478600001)(66476007)(107886003)(6486002)(6512007)(6506007)(26005)(36756003)(86362001)(2616005)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVZVSHRLQkxoYTBUU1JER3pUZjhYOVdIc2NkclE5QXlCRTRXc1R0STgwUTJ2?=
 =?utf-8?B?RGVzK2xGK2xsRy9RUGgyS3VHQStOWDFZYURabzBxSDY4bVBJcXZmbVB6ZURz?=
 =?utf-8?B?aThlWFFPa2VDRXBwdDNRNi8xQkpJTUNlZXgwYTBnZENzK0YvOWtLa2xMeDI0?=
 =?utf-8?B?N3NUSjVkU3luOGZzZk1qTE8wb2YrR2NUcGRZanlnNVQyeWZLZDV4L0FMMXZn?=
 =?utf-8?B?UEhETE15TDVRYVFpKytKbldsenlKYWdvcWl3SUxNelpSaWdDZHJtemhWR3or?=
 =?utf-8?B?N0xVTnRSek5wSEtHWitnMUhoTjZMQXp4SWZxbDZzR0N3TlpCY0NPcDFHcWlL?=
 =?utf-8?B?ZXN6RUUrS3ZKSFpsTEkvaXNPbGcvOW1UZ1QvckQ5bGhUU0xJMFU0WGtBQ2Fo?=
 =?utf-8?B?dnlOa3Z4UGducHhNYWx6NzNIRjBDUG5BOE9kNWt5Z0FBNkQ0MTdpY2lSSTVp?=
 =?utf-8?B?ZTB2R1ZwTm50S3RjNFhUZlJjVEs4cHZVUmduZkNNSldHQ2dTdVJTWkh3NDND?=
 =?utf-8?B?cW5qVTBkRk9zcWZaR2ZzYUxvWFNySUw0RURLeVhyaFVqcHBSWFpLV0dnbHFp?=
 =?utf-8?B?aFB0Q08vSG1IV0tsVmdDU0kvSjdqdFVLNVA2UTFsVitvZS9lZlFZVnlUR1N4?=
 =?utf-8?B?dlp5a0lETzV0SzVlb1N6TkpnRTdyc204NWdjOWx2aFlYM1FjQ3NFbkppL2V6?=
 =?utf-8?B?Nm1ZcnlhOUVuQ0VGcnV5dFJxdlV5N2E2WTlDVzdPMDZSbG5WZmJsc3JXT2J2?=
 =?utf-8?B?cnp0b1hSc2hlZGZNSGNxcDFUVmVwQTVzd0RLeTFGRytVVXVSTjdUQ0ZQMXZZ?=
 =?utf-8?B?VlJrTjR1V3JZN3VpUkpNWDVvWVRUL0R0OFZVWldWemFjWnhZc1RQTGZPeW5t?=
 =?utf-8?B?T1VpbVlPb2JqZTROTkFtSGlDRW9RU3hrRDRMME5DMDByV1JnR2NOaEp0NS9I?=
 =?utf-8?B?Q29PblNwMytNeTkyYm44MEhEOUFTQ3FuS1d6RUFOQnc1V1dUQ0NXS3JJcmpL?=
 =?utf-8?B?aS84L01nZyt0bGdFM21EU1YvSERPelRJcURubFk3T2lia1NXQzQ4OXhnd0Iw?=
 =?utf-8?B?WU1yYmhPcFZ6UUVQcGVYdmd5bHl2UTRaQ3dTZ1VlZzFNNnNuTGhaTFJ0UndG?=
 =?utf-8?B?TWZONEoxejArQ2FueFh4MnloVnhEZlRQRjZZMVRsVVlkOXNuejRKRXpDbXZl?=
 =?utf-8?B?Q2V5N0Q3NGM3OTNPZTVpeXhPMEUrZXFjKzJxQUdDRlNPT21oZXFGbmdXSTlo?=
 =?utf-8?B?QmZOcURzbVBzaXpwcTk3SGdZbmxqRU9DWWx2czVMZFh5eVdVaDFYU3B1UlJh?=
 =?utf-8?B?Q3ZiMWsyTDFmaHYzWDJZc2E2N0I2MzUvTEFGNWtBNVZRU0YyRVN3ZWVnbmJF?=
 =?utf-8?B?OUV2eHNQZjVpb3dPUGR3QjJtQzFKbEk1aGRtUEdGaWYrWTlZc0UyZ2NZZ2t1?=
 =?utf-8?B?Q3FjVzZnUldaNGZ6UkV5SEZHeSt1clY1N0VVb0RkWXgrVXBMeXVCUjNORFdT?=
 =?utf-8?B?UDZiN2t0U2JOT2ZWNGFrWkt3dDZIdlgrWldZRFdidUl2VnhLUTE4THVIelFn?=
 =?utf-8?B?QVB3YTlpNWVaM2hWZ05MWWVFLysxekdNbmdQVVVOSEptZWRIb21Zcm43MEs0?=
 =?utf-8?B?SUNHNjIxN1ZkVnlBNXNlNjgzQzBtcWRUL1FrOXR0ajlUMWM2VWtYSTlFcnRa?=
 =?utf-8?B?T3BKZ1l2MjRQbXVzb0hxOEFTRnM1emN6aEpHSFZ6QjBxVWdVdFNFeEZLcmVF?=
 =?utf-8?B?Y2FvSnVwVjlZOXZDMS93Z3JnL2Vrakkrbk50a0wveVBiUmpjZ2lMTjJEc09I?=
 =?utf-8?B?Y2RLSWVCWHpQNjQxNnBhS2xGWCthVVFCMUptcFBjZ3B2TFFhT2RTZVJKSzdz?=
 =?utf-8?B?Q3dMMHVyOTdwU2QyWmRlUEI1eEtUTmdFMUJNTDQzMGZocFJud1RMVitGOXE5?=
 =?utf-8?B?Rjh2ZHhlMS9QcjNqSmlRc096QlIraXU4UE9ibkNGVTZOU3AzdVdCbXpwVFR5?=
 =?utf-8?B?NFkyZlFrZVF2aDduU01oU0ZRZ2g3eVlMdEt4dHFmdUpmczBjZFpRa01ua3FY?=
 =?utf-8?B?U0llSFJ4TE96TFJZSlkrU2Y5Qm1hRzllTU5VUTV3STZ4cllGRmMxSm1EMWtJ?=
 =?utf-8?Q?B8N/LqLYhVuaN8W1P3iHWg5sV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a04332-8c16-408d-cd4e-08db6b3a45c4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 11:43:42.7465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EpmlI6p29jP/vFjRmwccaFuhYL8vW47RGfhIz/NvTRG1OFS9tL+oplvls3xixjeqBbIzodEIwtsz6b/yZOJZ7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9196

There a number of cases where Coverity has spotted writes to variables
when the written values wouldn't be used subsequently. The patches here
are independent of one another, except for this common theme.

1: xen-mfndump: drop dead assignment to "page" from lookup_pte_func()
2: libxl: drop dead assignments to "ret" from libxl__domain_config_setdefault()
3: libxg: drop dead assignment to "ptes" from xc_core_arch_map_p2m_list_rw()
4: libxg: drop dead assignment to "rc" from xc_cpuid_apply_policy()
5: libxl: drop dead assignment to transaction variable from libxl__domain_make()

Jan

