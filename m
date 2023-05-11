Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF7F6FF109
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 14:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533316.829864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px53Q-0008E8-R9; Thu, 11 May 2023 12:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533316.829864; Thu, 11 May 2023 12:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px53Q-0008Be-NY; Thu, 11 May 2023 12:05:52 +0000
Received: by outflank-mailman (input) for mailman id 533316;
 Thu, 11 May 2023 12:05:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px53P-0008BT-Cf
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 12:05:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ba90d4c-eff4-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 14:05:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7072.eurprd04.prod.outlook.com (2603:10a6:800:12c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 12:05:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 12:05:47 +0000
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
X-Inumbo-ID: 2ba90d4c-eff4-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdselYRAYcXbhpzaS6z2V0aX9Eb2tElMtKD/HI3zCG3yFxoEOgLxGPGoPWc+kBYzOVinix1he5Mey9uM4+6NIhwA/vt432E2Xo9dQoInvPI7flemYA1n3/HuGxG20iNQPl22oOjwDi34d6jLQa5Jb5qA0UmJhGxxNFaZHutw88VqCK4GTuSucNDf1Fj26JaxlLpT0B/f1rgvQ3aJDoURlxSmFdORnFsB5ECrtG8ogh9zgLbC7vmuTONiYwQvB9adDg8Yl+0F3Z5pN9fd7mh5pTwUlsRrYxqEGxHvN9sHF13Vg+XoURQZuOLQ+NuLLDVAMzzgi9zyw/+kEzh7s+Ejpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CR+eUbj/5Je+MQ4vbE1qFcIftH2nxRaJNZbDsHnTN30=;
 b=dEYNR9elkY97Kh/NWmiBiv7wYpgr1QixASMvbvXk8YxOW9IZjkHB/LmXp6yZT+xIvOmn7GnrpM0T/OhtRC3KDG8NuQV7czzcXyeopSzx6VirYUUfORKsZP0DnYcysMpNfdlGf8XeLnWG1pYU4WVq/eAp3fpZ3zPfF7rZ1ahqHM7FWAt3yVW6iioByk3qz1Q3X9P1J4wXav1ljMd0m7mE5k74HYrYfiXKrgN3ri2DgQI5C5ZwtVDS8BY+YuODkuYS0nDB1BIzhshb49wV3yye45O7TEu7DoxETsvLgedX0XqC2+we7tWHwT+mmJIeDKKRW8FZcgma4T17uCSK0k+sEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CR+eUbj/5Je+MQ4vbE1qFcIftH2nxRaJNZbDsHnTN30=;
 b=gmvVD31Uzhmc3065LJVJD9vi3aSZRZ0SRr0ZKUUEJ4jDyYLsDie5v7UqSL1pdf9Vgf+kpazZ5/256oLgfhqcxswyI9hi3L2F/pja4Li0dHYZmk+Xl/37tSOs3VM0D7zUjVfPCZ0NrrkhSGQvBP+cfijzmhDqmi3qdimIWhAOdEsWW1b9UNMVUx8X+h9S7ewjqeelfLY2mfbgDemyPF6U4q+l1nzJ0rWllCAAnjhyKGEfUxA0rQIroNw24cU7nFPu8AsPYZkzj+ub0Lv362uX/EBKVPUruF1gIFalYs0uVURuNjmGeytL76RidoHWg1Da1SjoUvC6DQNUjtcACVfBRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ba1de950-185e-8d8e-e313-aef54b18a097@suse.com>
Date: Thu, 11 May 2023 14:05:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH 2/7] x86: don't allow Dom0 access to port 92
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
In-Reply-To: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 33aa4a28-5125-4ced-661a-08db52180e4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HM2sNlcV4vHZe7NyVOKjkwNirF8rzK75n/dcGPlPlZ5mnucRyJCOboYRuBDhAK4NoavUUR71AiXbu6EoiY4AJlYi6FBV1maIV76FXFN+hs+aX74FV2frTPisNepXVPVgFsxe8/7lvdUxcfeXkvnXrTN1Ap3jOWSlCPGI6ycMy0GDFufj6JVRj1jaKNTKEoJQ5JUWPHh+eoSIddZJFB8s3IcxaURbL4/z9GG4BylrhmvzgorDAe5e/nEaa9LD4GNwGQwZmGgsIatwPZKZCc5xE/jCgkr2arQGr4vAN9xnu1p1klWQFGExQqPXLyh+ySxjbr9NncAn6PIf/ER8Xd7B/BNEcwRslv25kJPH4P0wHJ2iF/4yLE0WY6yVGEXomOCvJymjS9zFCTEeLq64pdt/6+hHqnDTJzqIToKsJw0ImORpPmqMrf245cyFx7AEeR+tVV7HIkmD5jgxwpult3DFoTUCJAwKv68hI+BXI7FCb0siKigC4P0dRSSM860MzQnNSeGmFLpej4gA5MS16ir4JPrccOQNqBb5IaqT8d+V5qId676Fm0WMNyTmUAKyzsgG6ohrppBeglspV8bBklRjM9Rp7aDOO/JItrafBalPmuVHP+FA00DL3EHosXgjbgByAL9pnIXd2EmkSBg3hQtvPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199021)(31686004)(36756003)(2906002)(41300700001)(86362001)(38100700002)(8676002)(31696002)(5660300002)(4744005)(8936002)(4326008)(316002)(83380400001)(478600001)(66946007)(6506007)(6916009)(186003)(6486002)(66476007)(66556008)(26005)(54906003)(6512007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVVjMzZ3ZmwwcWhKUExTMHE3RklyQmRNNUFzcTBWTm10Q0tJVWp2NVJ5dXBy?=
 =?utf-8?B?Wk55YURGMEZ5TEl4dm55VGUwT3JaaW15Tk9ZaGpUYzFOU3cwSms4bTlNalJY?=
 =?utf-8?B?TkhrT2IveGJHbUVKanlweUgwaW51ZWhySXhNa2cyU3VNckVpK3ExYzI1b1Bh?=
 =?utf-8?B?bXc0Rjdka1ZOcWhJTGlzRURDQXViS3BCTWZVc3dlcnJMamFFZDU4NmZMcWRl?=
 =?utf-8?B?VU9CUnpzdGsvTzhrbUtHbXJWYjRLa1hMN0FycE5rWnlvbWRWU0hrR2tGdW1n?=
 =?utf-8?B?NHdEbjNsUlFTYVlZbEJoTGtTeHVPbm1DaXA4YXhxM2Y4ZDVYcExqenhXblVZ?=
 =?utf-8?B?ZzM5eVgzRVdJVWg1bmxWZ3p4cG5kS2dVVWlvQktSQTdhVjQrM091NW9MUjNx?=
 =?utf-8?B?VW5aQWducExXUWxXVVA4b1RBbnlmOHQwV2pyQ2tFZ0JlVXFiOXcrR01Wcmgw?=
 =?utf-8?B?amRWMEd4YWxTRG1OSUppZnJCV0hlbysxMDhzSVZUNUlBL2xOV0NSNHVabkdw?=
 =?utf-8?B?ZFNlSTYyUW1mcElmWnhPYU5oRW1UaXdYTEo3d1RPZUlpRUQzaWFiNkFPOTRZ?=
 =?utf-8?B?MXJpZEY3RjFvV0NOaWJVS1Fodk9aRjFXVy9CNlR6bloxdnRUN2FwU21UYWNP?=
 =?utf-8?B?QW9VVmlkQlJEWWZadVAza3RuZ2dRQ3hXMWRQNHBGNjVWOCt0NTFOZGhrVHgw?=
 =?utf-8?B?bVBheENZOWRaU2U4anE4K2ZibWJBSkxvRy9tUURXaXB5blpyMUtQUXJlcVRB?=
 =?utf-8?B?cjg2aTV0dWFGUjdFaTZmTXZuMEwvWjQyNGRNclAwUStLU2YyQ2tZc1dKK085?=
 =?utf-8?B?UThWZ3VOMkYyMCtyRC8rNkZoUndBZ2xHa2dpVzZnN0dLK0dYTTdzV1NkajNY?=
 =?utf-8?B?SkxiSFFXTjg2b2VrVXpNbXJJTzZPNnlNZGFoS2tpdmdKWkM2cHg1WFRtc2NY?=
 =?utf-8?B?Nm5NYWx1VzlGa1FoZDZyRzZ5OEpmK0pBS2hySnRJNjZnd2ZzNm56cURZc3JN?=
 =?utf-8?B?Z1dHYTJsQ0ZVYnY0aFFreGNxOTJXNGVCT2pMVDdQSDV6Rkp5eENjRGJRSVgv?=
 =?utf-8?B?NGpUZmxhcmdLOUtWSDM2VkVOLzlwc3ZwN1Q3dEF0WXRPaitlUEsyOGZ6aE9O?=
 =?utf-8?B?OXlhS0h4eHZLcEJyQ0ZxMVk4L0VRKzhMU3VWWkNGYm9LcHZiU3U3c0RZZ2pJ?=
 =?utf-8?B?RFdhTnVvRnVMZzJPSU5VckFnZ3l2NTJCdlZCdStueVZRd2U3VVhyZ1VqWXhX?=
 =?utf-8?B?NlVJMnBjOVlUNGtZMXV6MTlXeXpiYmVueTJCQlRXR2d1WXpVUEZETXlXTHZ3?=
 =?utf-8?B?c2VMRDdtV2JwRTJwRDFOaVk3MkNscVdoYU1oVDV6L1k4S1pER29ydXFFZjF5?=
 =?utf-8?B?VURLSTR6Vk92ZHdKK1FQcmk0cmdGWE9lbkE2djdNaVdqZUtPcE1Md01vNkZM?=
 =?utf-8?B?c2tMV1ZUYW9Vc1krYkxQN1FXMUxXUW02NnUrcXYyUGczZXRPZUkyQkkyMFhI?=
 =?utf-8?B?WlJxYW9teUprWGZtRlZicnFVWkZwYnVDcEZTYk9EY0cwY0hUVXAwZ3g1enJG?=
 =?utf-8?B?NmJyYVBDWEJKd1lGbUdkWVM4WDhvY3NZRE94VTB2R3RXMElUZURWcmRTaUtl?=
 =?utf-8?B?NTYyNERVYlFQeHR0ZXNwc2lsVWtjSlQ3Y1drY2wrT2RwUmFkVmRwMHEvbDVq?=
 =?utf-8?B?N0owMGo5TWpxVlg5b0VocDhubnNlTmNtNThCWUJtbHlDaVp6U3FzTm1wemJy?=
 =?utf-8?B?bnROaGdBUk1jbGR6MjlBMmRPdHBJWU9wMk9BYS82YXk1WVhVS3lTSEVBSVRL?=
 =?utf-8?B?MGRrdEtSaWhDeS9tRkMvQmRtV2JSSlJRRDJFSHFwVjBwZitHYnBjZkwwWjdo?=
 =?utf-8?B?aUt6a21ZZ1RvdE9wNUxmL0hDeVNrWEd1eEthTDNUNWVaeWFzUW84a1B2WHpO?=
 =?utf-8?B?Q1YwMDg2Zk9vV29KQ3FOWHB2ZFFNdlB2bExadWRHaW1HVVhDSDJPeERxaVgz?=
 =?utf-8?B?NUp3bnRLK1JMbjNpRGU1NW9mTjNyZ1VFRFNheTVYdWFvRmpaTDArRzlwUm9i?=
 =?utf-8?B?S0pkZUtwYWRGcjJ0ZGpyMG5RbnBHRmtHbjJEMjVneURUc0s1VlpZRGVkVXhj?=
 =?utf-8?Q?FRp6Wq2q1EAL9fjrPLn8QTOYI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33aa4a28-5125-4ced-661a-08db52180e4a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 12:05:47.6798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nbRYqbki1naMA/9xJWjk8F753BmG7VTR0U/KIGTSvkEF5vVfyrveuwMg7Xv2T7ChHxEMrWfqPEO0VSg/Aj61Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7072

Somewhat like port CF9 this may have a bit controlling the CPU's INIT#
signal, and it also may have a bit involved in the driving of A20M#.
Neither of these - just like CF9 - we want to allow Dom0 to drive.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -500,6 +500,10 @@ int __init dom0_setup_permissions(struct
     rc |= ioports_deny_access(d, 0x40, 0x43);
     /* PIT Channel 2 / PC Speaker Control. */
     rc |= ioports_deny_access(d, 0x61, 0x61);
+
+    /* INIT# and alternative A20M# control. */
+    rc |= ioports_deny_access(d, 0x92, 0x92);
+
     /* ACPI PM Timer. */
     if ( pmtmr_ioport )
         rc |= ioports_deny_access(d, pmtmr_ioport, pmtmr_ioport + 3);


