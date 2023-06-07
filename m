Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38FA725658
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 09:50:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544433.850220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6nvh-0001V4-C8; Wed, 07 Jun 2023 07:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544433.850220; Wed, 07 Jun 2023 07:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6nvh-0001Q4-7v; Wed, 07 Jun 2023 07:50:05 +0000
Received: by outflank-mailman (input) for mailman id 544433;
 Wed, 07 Jun 2023 07:50:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6nvg-0001Cj-7U
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 07:50:04 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e84fc6ed-0507-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 09:50:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9337.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 07:49:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 07:49:58 +0000
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
X-Inumbo-ID: e84fc6ed-0507-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+UAzNJPBI0oRkx3KBJmNfOz7ypIQA2odDIuDZJrR3IipTIg7Z1YNkj50GlCkErVyHuz2fVpaz/rFmzzb/w/N30QSX/Legbnh3gObbI1R27wjp926iEaBtLsxqtqwCDxO8JgOLwDHsqJ+p+q9l5R0azKDN5c2kPe3dCNDfKzPa60v2zfSiqxOHUYSc28/3jm7F5qp4Dfo1/TRN3wkDxLNY4MKWMaLd+gLqSjgXucIaWV+mIQSv5Xg0Vx95kZHe4BoeygwLwFSk0nA6pCwOw1cH9WPe4aZUnlMSxIssuaB2CVxMTUL1+5egLgmhK4vhJExok1N1VT4x5ZbrsKXInoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sm4ALZX2TZ1d3Khf215OZzJFjp3/wU2zCbZPY+epx4E=;
 b=OJtPWiEDjr3HW4M5OMNTXRDgHUCJK/0YHEKHEcCRp1YvlELSMY00x1VI3SkAt60zZ4BvZ9rcDC41rVJVoEqMxbhSbAXbwnHhHZDlErlMuY+NvidUbGuMNLNCFP+V0rKktD6aX3REyyFmQUlKC7nu04qwG4dE+PXXqVuLRJ1xqm4IsKzuZHoFYawWJOEet+7QPBu1+OvqV2xuI6hsE3bi55PdWxlauWyGogJYcGxiWcEGorQ6Ldj620IbcU+clVbpIN+BygE9upzoL57fXmUDElDrfxKoaHhwj9+zIYbKp4LBrXpdDjEYzP+yQQdtcq5U4dyB1G6qgMrpzTUzHf/sMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sm4ALZX2TZ1d3Khf215OZzJFjp3/wU2zCbZPY+epx4E=;
 b=mA06USPw64/QTCKZj/gNOjUlepmOqm4K48up2w7OfojduCha1JjjlpRz7kZVvaR7ML6pDHrBNgX9+WYMOptZkSDYyoFTSiYGSSlxzbaaFx11f/C4HrmTadZ/yO5scJXr6vfIUgVZ7h/gl2aClRzDosPI1Awh1mc3I8JBq5k7lHWMBxeadhXcSxBMTMDp+6FgY5YgmOzLvzs0F20H3Jq0Bu3k+2hkTNDnH+91v/BOwQM36FDrzpRTUUaU5RtLpIrnglwrtJA4ildl+ONmtMv2Bn55EU5E+XwoLYQzies97zTLB9M5ez8Rz8UvBjme2ryAzYDA6HpjRrGeypGn7WoiYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e3e3f8ef-fbf6-76b8-4883-219d67e5db4e@suse.com>
Date: Wed, 7 Jun 2023 09:49:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1 0/8] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1686080337.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: a6a7a9a6-dc90-4c2d-601a-08db672bca79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K2Z1arVl62L7LpVoaMBLMM9T9Bh0I9upI8gpcnw66puNFVs9c8POixaVc5huhHOYYZf8DZ0YQ0bk+VBYtVpd/YFJSFZou/XSsbOwNR+1rO4wJbybVuv3ADODWFf6H3MMgPK00j9LwtnxAqGy1NHC8XDQUHl7j4INJz/kNTBsh5C2/lqonjiS4EecMGnQS341scvxd52NMNtOPgqjq91LQ11EF38Q4qpW1KcwasiJchXDHns+1GQjdx1ZKsYDlJZ6+lzneYjMG70Or0KxJm4rKQgGxik3pY4Bx2r7wgAHRrDV9cDZiLQJxZnlWLv0muFttpWQwocfUhB1AoHAmp5Qc3+OhgkpbN7sleVXKkiQR1pcNQgbqeJkVpiVCR8y8/FPthMWt7P9UbBO0OSH6ee7WxrWfqTRyenQE6VYUul/Pb25mFGVQnXv1sz9bUEN2+01Tja8Nrb1HAGilq7/QOcvDDjVgUN7yscS5Jlwod58ZXxR9veGV6haSlBcTwnjdJmgvRJuEMBPvJXmM4fFc4H/6drKuUdjrLV+fmC7z7MYs5GKP0CXB6sQbGmbZ59lGOzJ/NyyQ/bGwExOUwxfQMIfKFHAQGtBXdOIefFrQ0s+2lucbm7GfRsPU6as7r8Z9rDg++bFwpdSnTGT31WvFWBZHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(8676002)(8936002)(478600001)(54906003)(966005)(41300700001)(6506007)(5660300002)(316002)(6486002)(26005)(31686004)(4326008)(66476007)(6916009)(66556008)(66946007)(53546011)(6512007)(2616005)(186003)(83380400001)(2906002)(38100700002)(31696002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0tQYmgyR1JYaFhWd3QyS0w3ZXhmdkJHMEtzYU12UlZyZys2MEFNY1YvMllG?=
 =?utf-8?B?Q0ZNeVVmck1oVUhGRHNOQ1pSejVrN2xWYlhMUlN0QW9iWS8zTXUreHVzU1Rh?=
 =?utf-8?B?WTFWd1ptTUFDcTFlWGJPWDRqd2tvS1NVNVZMYWdpUmhyUTVqMnI4b284cTda?=
 =?utf-8?B?UndVYVNqN0VoZVgzNTJhY2RSR3FLdHorcms1RjlESnBWVFFmbEEzTlhvSWVF?=
 =?utf-8?B?UVVEM3JvVURldTlMc0dtRi8vTTUrZTVQRytzYnd1ellRWDVCeXlSOWQ1TjVy?=
 =?utf-8?B?SzhUVDViSTFRUUlJL0dIajhwcFZ5dFJaTW9DaGRQVG1hSFVHQk5WQWx1a3RB?=
 =?utf-8?B?V0NXeGZ6UXMvbVFDZGwxN0lOYU5iZVlMR3M2aVpmYkQxaThBT3NkUmFLL2xk?=
 =?utf-8?B?S3pDZVlRMXErRGdBUmNNRFA4T0ZNcWZQdFlWenQzZ3pPdVl4ZGJuUXJrVDBB?=
 =?utf-8?B?S21qZXI1ZlpCSm5Oc3lzcHB2aTN2OUg4VHUvZURYTWFid2pFN0pjK1Fpb0kz?=
 =?utf-8?B?Qm8yZ2xXZ052V2tLWkNIL2VxWGE5YXF4Zm1RTG4zcVdlMFFNSWRCWnVqUkw2?=
 =?utf-8?B?YVVUNWdDMzY3UWwxWnVqdjgxdExscnZBcXVTaWlKVXdQQXB4K2R4MFovd3Jr?=
 =?utf-8?B?QlZqbVFFMlRSVGhaVU5tNkhJQzRaU1N0YlhjeXZIVFVqSzc3WWFMcklPQXJU?=
 =?utf-8?B?MDFHVWlLY2UxVTB2aTZwc2VUd21QemgvSVVUZTlrOU9wcTBtKzVUR1JoV29r?=
 =?utf-8?B?SWY0d0ZsbGlLWkJwSEhXTU0ySm9ZOUZwSnRUUlF0MHNvU200T2tTOGNDenJs?=
 =?utf-8?B?VDVBaW1UaHhjZm9HbHBqZnRsUmM2OTVJdWphbnBzQXhOaEs5ekhEa3huelBl?=
 =?utf-8?B?S1V3V2xEY3h0Nk1HR2pIL2JDYUgwdG1aUEgxdVY4cHh4SytuZnpadW1wZWlr?=
 =?utf-8?B?NURkOWE1ai9MeWI4VkxVMDZnLzVZU2RKc0Q4R01VL0V4Rm44WGVHTG5UdDY4?=
 =?utf-8?B?TXR3SG9NbkhsbytBeDFpVUhpTVpzd2Y4eG90bytTdGNVa3RyK2NPZ1A1bHZw?=
 =?utf-8?B?MGo2T2UxMXVwSUdCVHFTbHN6dE1PMjB6UUpmWnJFMFN2RVBvSXRJRDFjUTRI?=
 =?utf-8?B?a1ZzWkdGRUJjMTJGUWhLRXBHanpPbzhtR0N4Z2dpdk1mKyt3UXRsclhRYlBz?=
 =?utf-8?B?VHlhM011RGFTckt1Z1o4V0NBUytSUFZKSlJrU1dzdmRmUEd4WDlqR1NhcDZI?=
 =?utf-8?B?ZDd0Z1pQTjlvdDBmd050amdvdm9pbGtyS1ZETHcxcnJDMHRoWW1yZVA5M1Zr?=
 =?utf-8?B?YTFDZ0FYN3JENzd3cGdKckJqbEpPTHdaWkROQlBHc2ZKZXk1NkViNEdwdEpT?=
 =?utf-8?B?TWtZQWhpTWI5TW56aFVCc09DMUxiSVVJeSsrQjZZSkpHSng3U2VkYVNsTjdr?=
 =?utf-8?B?c2R3T214UVByNGpXZzhqcTRDUE9OZjdFWDh1RmtqNkRQTVViZWlJSWpGRjBY?=
 =?utf-8?B?WmtYYWE1dWsva1ZBUGdTamZ3TWZTVnZ1am1RTUM2aXdOOG9sWG14cWdVQ0gw?=
 =?utf-8?B?NUJGQlRLc0lzN2RzM3JFRGNoSWlEOU42M1lUa1dNQjNFUnVSSVExMlNGblo5?=
 =?utf-8?B?dm5QSXA1YzBob2gzaDkyUVdqYUExSldENStJdkhvZ1hMTXdRMFByT2trd25o?=
 =?utf-8?B?TlpNb3FWV21JSlRXdDUvZ2xJSDVGQ3FpdE0rcTBDaEZBWHpIZW1QNiswTmhS?=
 =?utf-8?B?QURqbTZTNDRlOUxTYTNsdk04QW5lRkhYVUxvdUF3TWtvSDFEKzFNSy95SGVh?=
 =?utf-8?B?Nk52NHdCWW1hTFJpamliaW9WbGdwbEpKRncrYkVKbEMzdnZTMTZBa1VNN0RS?=
 =?utf-8?B?M3E5UE9TLytMdm1NbnJVdnBNT3RtTUNxMlBROElYeUE0Vks0RmltUmo4NGFa?=
 =?utf-8?B?T2ZoUW1tSGh3dWNvWXRIUXFyQW9LS2JldjAzQTVuS2NXYlFLampmVjZvOUxG?=
 =?utf-8?B?dkZJUVdOUW1zK0t4UWh1Yk13c3M4ZG1PSXVVeDFwc01HTnR3ZEN4OUdxRlZK?=
 =?utf-8?B?dFFOZUFkc2QycTRZWGc2NEF1ZTl2eERkSDkxZlRWN0FjWHA2d0xWNDNORlIw?=
 =?utf-8?Q?+TlAtFgIgZsjcPNRxgPQwlhn/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a7a9a6-dc90-4c2d-601a-08db672bca79
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 07:49:58.2373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDDL/DDKYcyJJJEUh9LwBicK//tnIzxDs4lLgRgUFCd204FpOvfZeUpKCArZVdD+nHNVc1+IC7aARJxFHpWMyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9337

On 06.06.2023 21:55, Oleksii Kurochko wrote:
> The patch series introduces things necessary to implement identity mapping:
>   1. Make identity mapping for _start and stack.
>   2. Enable MMU.
>   3. Jump to the virtual address world
>   4. Remove identity mapping for _start and stack.
> 
> Also current patch series introduces the calculation of physical offset before
> MMU is enabled as access to physical offset will be calculated wrong after
> MMU will be enabled because access to phys_off variable is PC-relative and
> in the case when linker address != load address, it will cause MMU fault.
> 
> One more thing that was done is:
>   * Added SPDX tags.
>   * Added __ASSEMBLY__ guards.

These are are, aiui, a response to a comment from Andrew. Hence I think
this wants expressing by a {Requested,Suggested,Reported}-by: tag in the
respective patch.

Jan

>   * move extern of cpu0_boot_stack to a header.
> 
> The reason for this patch series can be found here:
> https://lore.kernel.org/xen-devel/4e336121-fc0c-b007-bf7b-430352563d55@citrix.com/
> 
> Oleksii Kurochko (8):
>   xen/riscv: make sure that identity mapping isn't bigger then page size
>   xen/riscv: add .sbss section to .bss
>   xen/riscv: introduce reset_stack() function
>   xen/riscv: introduce function for physical offset calculation
>   xen/riscv: introduce identity mapping
>   xen/riscv: add SPDX tags
>   xen/riscv: add __ASSEMBLY__ guards
>   xen/riscv: move extern of cpu0_boot_stack to header
> 
>  xen/arch/riscv/include/asm/config.h       |   2 +
>  xen/arch/riscv/include/asm/current.h      |   2 +
>  xen/arch/riscv/include/asm/early_printk.h |   2 +
>  xen/arch/riscv/include/asm/mm.h           |   9 +-
>  xen/arch/riscv/include/asm/page-bits.h    |   2 +
>  xen/arch/riscv/include/asm/page.h         |   6 ++
>  xen/arch/riscv/include/asm/traps.h        |   2 +
>  xen/arch/riscv/include/asm/types.h        |   2 +
>  xen/arch/riscv/mm.c                       | 119 +++++++++++++++-------
>  xen/arch/riscv/riscv64/head.S             |  40 +++++++-
>  xen/arch/riscv/setup.c                    |  16 +--
>  xen/arch/riscv/xen.lds.S                  |  11 +-
>  12 files changed, 160 insertions(+), 53 deletions(-)
> 


