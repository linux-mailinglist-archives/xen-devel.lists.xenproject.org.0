Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F09C7747384
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:01:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558374.872406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgaL-00059B-Vo; Tue, 04 Jul 2023 14:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558374.872406; Tue, 04 Jul 2023 14:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgaL-00056i-T5; Tue, 04 Jul 2023 14:00:53 +0000
Received: by outflank-mailman (input) for mailman id 558374;
 Tue, 04 Jul 2023 14:00:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGgaK-00056c-BI
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:00:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f2d3c74-1a73-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 16:00:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9138.eurprd04.prod.outlook.com (2603:10a6:102:22d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:00:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:00:48 +0000
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
X-Inumbo-ID: 2f2d3c74-1a73-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZlPC3vMUIxxH/RE7HuKeAiAVKN33yHhf5QhD62F0YR6GSkaHf+ffVIWzOTAEPMNHEbT9BrdHqMExUaWaPviYOGhNa9KnPBlAu/XlZ2GzJBIQONEnOfKUHgT5B2n1sk6/qJ3/iOv0kkS1hYn5uYgsti/ScKkXNr/zNrYqPHWQvue9El53vGlGozghNBBOYYydBoyeB8SXpJeXjUXh24pPDHiAFfrXcPHYfexNYZzYR6t9MWI2espUJaa4iGq1JveaHovMRdh3mf9Ut35hT3dVcnFNKSXY8K18HtmGbvnuKHbcVccL8ac06EEmbQp2Tg4poa962Wc3h7Bf1vj1+dO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gll7WaYdb8WKnaoDfTPkTUK3k2BeCemleAxdO6F4qNo=;
 b=Z67RlhSK8qtURFLls64BTlKpIefvZjrU16mo5coMSg6O5Px6hVx1Mj0e8W3CB3jIZCmUmu3Qx5oBwMGUprwL4CkEo5hP47o4egLK49Cz3aGLKX98YkaYBy+/mBAqHABtuTI8FJoIG5uUB4cdhpN4ljBQMHUXoWxYVm8bErxRSwdDel3q8/l7Xte8WNxFMOicTmaSZqqaJKOczBoYGgolX+F0zhSt5wPFbTG3jbbQQaCvm3TWAeD6L8w4HE4p7qaiiwCjWTnaozYetCw/pmsR5XoQubQ2shNHF25h/nwjwNwGnaDQK4szcX+9z29VyY2XjUqjPEippPBMHP17JXdXEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gll7WaYdb8WKnaoDfTPkTUK3k2BeCemleAxdO6F4qNo=;
 b=WC9q8KFPcjULEPffrLyUBJ/zYk/M5fKBq1mn3vKFuXq/33x1okQ+yjHHO8C0I4IIRmsY9Tq0mxh/5L50IpNfmJkTUOoRxBgCtkkmUGQLZ/fSqLYpD9+jiHaoNrnNVOGTHteMOE/CmZlr/W2sEmIQYValeJyOSw+Hw0ADnN676NrZ4lTVdn9Eu7dGZBdlgFLmGECYjaL3k67S2KylCiiZJIPfGSD6F3utjBoFcoHfsUpRssHMHAYNrYFh2y1/TITT6jLIKWlViZ8ES0Gt2A48S+Bbx4vSPXXA+Oc0XoG2cuSAOFRK9t4Arkw2oM9eDNrRcCBWkOmWF4pFkoaKAJz2Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0076f2d6-03b7-0a1c-c423-1f55b7195407@suse.com>
Date: Tue, 4 Jul 2023 16:00:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 5/5] x86: make parameter names of function
 declarations consistent
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1688049494.git.federico.serafini@bugseng.com>
 <5ee57d7bcd79daa0314f182ecb73e1eb6d8ecc03.1688049495.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5ee57d7bcd79daa0314f182ecb73e1eb6d8ecc03.1688049495.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 98abebdb-395e-437a-4d38-08db7c97118c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uP7e0A8XKaVLiYTL7EqaerIX3d/IfDwpU2F0YlJ3SBveLcNGTGZQbwoyZbol0MPIWJSpRXiNLuZFBAiZ0sXzzF3Yh9bCnGJc7w/HbZgBPB65IVSJzghw5LUaztO3xjXkF19SP2TGOzR69TYWd9HwGHu2fqEaz7tD8eIKr/p0qYnm06rRl9dX4F4IslRKJh8No93sztqv89WWHxJD5pu1oIa1fU5HCo3byPH+oej9hoscRQB5vP1d1PhF6mEk5XReg56kdq125sFXS9xzSKHv3oIBMXfBVVR1KNOQre3htqDhJWjyfNwKdTj6hTHM0Q1sOTGiePlTuYdi5w0VohKrn199X6nb+tv4tcPoK3EnOSKiFgiu6LVPYpKORTzCjjEmns38D72+WQvHZT9VLlwu8t4KEsgA5/doohkZjCiL3MCgsLEIJM5wcLtvaMqopS8N/uasCcYpoz73F8pUKa6tnzrCRV+B+p7IVj+fg1y4TYloEZHpuefMgoRZjpJFZJniDK7UZOD6RQguMT6Tl7JOL9ikr7szlROOW2ctWZ8z/n25My8qVVQHk5ldUO1Apaf6mkGygVrpnNvZJ0Fnu4ZNCWLV+uRRWvaXIw55YpgncUNpDEJmR2oGpxuedzFr0Q9ZPtQ+qYH+I7JfBAJ5fRsDOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199021)(6666004)(478600001)(6512007)(86362001)(31696002)(6486002)(38100700002)(316002)(66946007)(26005)(53546011)(186003)(66476007)(2616005)(66556008)(6506007)(4326008)(54906003)(6916009)(31686004)(5660300002)(7416002)(8676002)(2906002)(4744005)(41300700001)(8936002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2F6YmN0c2lMU3IzdkdGb3ZxUUV3Tk5OQ2k1Yk8rb2xtR010KzdEcDdoLzFt?=
 =?utf-8?B?M1REM0VmcUp1M3JPc0JaN1lVRkNqZ0dGYmptbVRIc1V4R05HYWNya2MwR25Z?=
 =?utf-8?B?WmxpZlhwYkNNNEcwTnpMc2V2N09Rd2pRWTd0dEF6SlZkaVN5SERuREVVR0dH?=
 =?utf-8?B?RVRnZUNqUi9rb3Q3dUhHVUx6VGpITjhNWWpSQ29uREhVK3ZwclZnRlhDbFdz?=
 =?utf-8?B?czc1MHVsWlE3a0tTaFpndlRFZ3lGdGQzdVBGV0lVdC9oUko1MUtPMkpEa1RS?=
 =?utf-8?B?TnQwNDBoVTNhN3BiL2lWamMvNHVZNDdNQWovSjFEdUpmSksxME5IYkU5WklP?=
 =?utf-8?B?NVkyUzE3eUs5TzJyTWJJUHN6cTdEUFVyNEpZRWFMREt3ZHl6cHM2UkdERy9P?=
 =?utf-8?B?c25OSmRUZTdOUVFlcGpVc0lwYy9iS3RoSDlIaWJqa1QyNC9MQXczVWF2TCtn?=
 =?utf-8?B?UmZFYUtDM29raUVUazdmL29HZnBjdStrd2RBTkdtdmExZlVVNkk2OWg2djRp?=
 =?utf-8?B?Ym02cnFXc3JwOUJEK0pVejZ1T0NmbzBYMXc4dlFUd0JFd04wbUhUZjhHS1Fz?=
 =?utf-8?B?S0JNekJ3cllQa3Z1cUdSMFhITVNZZ2tFTGJMYkhGUkVUdGZCV21JOC95dUdF?=
 =?utf-8?B?cURqRFJ4bEEvVXJhdFFIWnhJYTQ5MWJycE4zejhUSmFLWTByNVZuRXJDTWtL?=
 =?utf-8?B?RkRDQ3VRTTJRb2lucVphYWdmNnExN3M2M1R6SVEvMUJSRGhEVWVnL1lqdnEx?=
 =?utf-8?B?L2VJaUdOS3ppcVcxTXI4dm00WDdwMEU3TXRjUTd1MENFbEY5VE1NQStiaCtw?=
 =?utf-8?B?bkczMmJiVE1YOVM2T3Fnc3lTOGtCekRYSkNwYkhMQjUrcU9VTGxsYkxqam51?=
 =?utf-8?B?K3pnaVVabmdvNlROMFI4VDU2b1VTZ2Fwc3R6NDl5Umk5WW93eVd5TWIxQVpi?=
 =?utf-8?B?MW95Sk5vVUtRYzdGM1hYSjZ5Y0xFZTZwbnV3QVg5MmZzVFpkcU1LTHlQT1Fm?=
 =?utf-8?B?dE1Yemh1MEEvSkZjb1Z6ZDZDQ2tRL1ZiVDI2OG9HVmhSV042aGpUZDJoS3JP?=
 =?utf-8?B?UXpSL2FId3ZyalU1TTVYbDRCVUZwbmNmU21Sa0d5ZXBBZmQ3MWJ0Vm9tOXJy?=
 =?utf-8?B?SU5oQXkwdTZYL0JqeDB2S3RwdnRyY3UzeW9wTmVWN09qb29HSnVGVjd4Mm1R?=
 =?utf-8?B?RVl6RjJ1NUo1d3ZaQXZydUQzbHUrMnVFYnAxOGF1cUllSnVVNjNIejljY29s?=
 =?utf-8?B?d1g3MmNaejVZNm9NeSt3VkkrelF4TzhzWXd5bU5uT2hDNkR6Tm1mN0pqUjNF?=
 =?utf-8?B?V24yNWYyMzI0Q1pmeEN0eWQ3QU5FOUNpN2I4aC9qQlVISEV4eUVZZXc3M2xV?=
 =?utf-8?B?MXphLzV5NytTSFc2R2kvQy9IbExJelMxeUpxNmErOG9yKzVxYWZ6a3FyQllK?=
 =?utf-8?B?TXduTnRTWjVrU1MxWjFtTU05ODJnclp4WGtxL2dXeGZGeXRyOUNNNXZPVUVt?=
 =?utf-8?B?MDNyK0pUYUJwM3U4em1yZkZPTlZqRGZHY2pKNlMrU2lDS3UwQWNuVURYR1FB?=
 =?utf-8?B?Q3djcWNqd0dac3M0SzNQL1ArYkkzYXlSVXNmVTltOHhldDZmMWNFVm1BeTBK?=
 =?utf-8?B?WHdia3g1cDJQYVFWM2M4d29HZUM1UTVCN1I0SzJVbHQ0OStqOHRFQ3RjOVBn?=
 =?utf-8?B?bll1MmhTdUttU1YvVG9oRS8wWjJ5S1R3aEMzYWw5N1orMmxTTm9GdGZDVita?=
 =?utf-8?B?bWpxYkZiZndUcFRrU2c5YWhMcVlxOEVxMDlyR2RGelVnejc0Z1VEUFhHbWFC?=
 =?utf-8?B?eDIwSEZwWk1jNnBLUytlTUhTYW1IRjhFT0xIUUgycW9ONEVvTnl1ajY5YndN?=
 =?utf-8?B?UHhsOGxJa0lSNEUvdnJ4QkYxc0lCUTRrMjRjUWRzN2ZwbGV2N0hxby9Pa0Ez?=
 =?utf-8?B?eEFJUFZWL3dYSDMwRUc3WDl1Y1dSaTZWaEJ6LzVFMDFGTFlQSXNLaHZ4OFJE?=
 =?utf-8?B?UWkyNTBUWGhxNXcvUGNPWUhiQzc2NTdPMUVYQ3J5Q0NkV2JER2lzMTBHa000?=
 =?utf-8?B?MVMvT2h1QitPYVkzc0MzaXVjeGtCUG9FMnZrdWlOQlZWZkNQei9hWXp2YXFn?=
 =?utf-8?Q?g378puj0a1nEokpNE6Vs97erl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98abebdb-395e-437a-4d38-08db7c97118c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:00:48.0461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWZ462A6jg7p91S/JGVrZC3YkkYwP9Kg1a68hFs9EikVQ7gcXJRpJ5gXWgI8xfDBsUaiMeDS23Etqu0jnxXcUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9138

On 29.06.2023 17:55, Federico Serafini wrote:
> --- a/xen/arch/x86/cpu/mcheck/mce.h
> +++ b/xen/arch/x86/cpu/mcheck/mce.h
> @@ -44,7 +44,7 @@ extern uint8_t cmci_apic_vector;
>  extern bool lmce_support;
>  
>  /* Init functions */
> -enum mcheck_type amd_mcheck_init(struct cpuinfo_x86 *c);
> +enum mcheck_type amd_mcheck_init(struct cpuinfo_x86 *ci);

Supported even by ...

>  enum mcheck_type intel_mcheck_init(struct cpuinfo_x86 *c, bool bsp);

... immediate context, c is the name we use for parameters of this type.
You want to change the definition in such cases instead of the
declaration.

I also think this patch could do with splitting, not the least to
reduce the Cc list(s) needed.

Jan

