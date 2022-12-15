Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B7264DE6D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 17:20:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463577.721788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5qx7-0005Mf-8O; Thu, 15 Dec 2022 16:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463577.721788; Thu, 15 Dec 2022 16:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5qx7-0005Jn-5K; Thu, 15 Dec 2022 16:19:21 +0000
Received: by outflank-mailman (input) for mailman id 463577;
 Thu, 15 Dec 2022 16:19:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g8Eh=4N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5qx4-0005Je-Nl
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 16:19:18 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2086.outbound.protection.outlook.com [40.107.105.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38f723b4-7c94-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 17:19:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8637.eurprd04.prod.outlook.com (2603:10a6:102:21c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Thu, 15 Dec
 2022 16:19:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 16:19:15 +0000
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
X-Inumbo-ID: 38f723b4-7c94-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+TRoKG2WTX6ar88BHnKRNZB6HBvE+E7KBk8kNodEMNqkln2CU2GyndPy90ryfDmc2OLCKWFbvK66vBFcehHMWavLLLrYBkXCAZ6E8tS734IKRDYH9VP8uI/fONJeaaBDtLBapigAMNQZqkFI/CYNzE4ihEA+g+qhu4+zCDzxS9Oinq9bhbo/ojwCgMDyhycE6Su72ye080jnJEFC+yzVtBRJkv/MSmvzGXo7nyWs/zBtHQf12qSz9uNKIfK0+4KH9tcFVFai6fjLUJQ+epAqyihy9w29zZmCawTIIMmT9ar2eN72OLCJhPsJSacDsJAs0zI3G2HOQkH0HIotoQYoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1kO7gZPpgT6AwMCUQla9n06WpqgNnuZMSnGTiHLEoE=;
 b=af3v7WbJZMF86FWp3mYD52AEg2oEEt18+f17QUDEcBKAKwNauWV3c85W7VU2nbV005ha2dyVTW4/YQt2YhYo+s/fd0rS34d3a53jNqK62YbRbPUSkMRGLkibcdry4qQ79UqafQL86Aa4BnDDTgCVNoXEeSiDmXjyqvt35dW+yJUo0hL/6W+JEmMVAbu/iByUSzZVsp80piF/hidT3Yz52/ihOBmnAJNCJk8ZjRfAO7WwLKxtU0rPZyQvEGZ8PZhBwIs0d+0WxSWfS48Hy8iVsi0jLnl5AP5vf+ePYkCIHEBJ3Pvy9yFCupTK7lQylskHM0okLE98+ASOpasJUpE0ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1kO7gZPpgT6AwMCUQla9n06WpqgNnuZMSnGTiHLEoE=;
 b=O4vD/XMD/6I6UzLh7KcJDcdGaWGc9NPoUdS2qbsQYbaXSCU01ixudYFWixqd5zngVipaEJkyc1z7t2GKz4aJGqGeEJYe9bwUgBeuZM8iGSj7c9ukPHY1IHuS86b5+Es5/+v30N5DT2iaraWgyX6RO5B0ZtHCrL0bVY/9f4O9bDnIyYNZwfaNyhyBWTpGdoL1+MZqstFYTjyl2KFHH8rXXcl7KuRoJNq89GudAYiHQ0oPF04qabTXvdZoQSqtW1AX2pgW4NJZ6In0jp37EKAJ7tgtiyxYWreWpsHBLpgNnnxj5gc+X+A3heUYvvSOX6/wkk4fL6Xz7LxeIQXP7g47dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41fe2bbc-b650-2638-690f-28d1213531e3@suse.com>
Date: Thu, 15 Dec 2022 17:19:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 06/12] x86: Replace MTRR_* constants with X86_MT_*
 constants
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1671057808.git.demi@invisiblethingslab.com>
 <8ab41b88c5724df7ee31d7b21221d5727216faac.1671057808.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8ab41b88c5724df7ee31d7b21221d5727216faac.1671057808.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8637:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ab4832-e9c1-4b5c-3ba9-08dadeb81bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	al6/cE27Ycjsg5sYtQSOh1rFERPY1PHGFZb3St7XJHOHdJo6bno+oYwe7l/vZ0cq2LLetOdcqb3bC42SWCKzmY2+ghcg7auRlnliu7xpXTuAg4nfvMQztGXn38TOdfJUDOIIIr2l5Y7Smk6fx1YiF1pgElNFpxN9lrolq1gP5iOMD80jluBKYRdSmHs2EtHb2M7O1o+O/kTBsVjnDOCxgORQaiUa/gLU8Zt53D6XkZEKReAD8iCryQ+78iRuYwwq8kg5apihG2DTGvYD7eluMIKW4Q6VPIK2I06gBT59yV2MovzfYHgNPXgw2OHoDUYB4lguhdhQADrgL36Kw+/mJZpI2qGrmO5b91zf8JFFiEfOt/x+xE3vtcCOxQBPgvyQDWRUA8uaLn/5+L062VnPYp41HnzSiTZgCKD0n+gJTcRKE6zLG2NXhlJCZEENqDmT7QFA2k+LEto7Txjjg2LP+G/cLGDIlM61QOlYy9RnIaUP+Rbn5vXi7KMPRlj2gdmiIfa49eKNoWJHC9+zC7kzDluWAxHylwpmyVPsW06TRrjkPs83viuiAuAfUzsOdYB5zUXS7UYLinuYurjI310K5Mqb86Ee3+W6F/ripZTdz6mUbkfrX7Uodu/SarXdAth+FoTpTwgWmIJZnrt3wzPlXlTSyCLHoFPQscIYwJHVNokCk5hX6qGD0txlEMtpJoxpsphGw2/VG0VBH6KjSAIt5VELJ4VkriS4SixQlFEOspY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199015)(6666004)(36756003)(31696002)(54906003)(86362001)(478600001)(6916009)(38100700002)(316002)(7416002)(41300700001)(6486002)(2906002)(4744005)(5660300002)(8676002)(66476007)(4326008)(66556008)(8936002)(66946007)(26005)(6512007)(186003)(6506007)(53546011)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cERwSW5kcUNCMWpRaytUOFVpSHpOV0w2SHlNTXkvdnNYSVlVa0VpV3I3TFF4?=
 =?utf-8?B?UnlLcU01T1Jldk91ak9lMWRqMmFRbFhUS1N6MkJLYjk1RlZDc1YzUGN2T2Z0?=
 =?utf-8?B?T1RFeHdtdzNKdzZoMTViNW5CR1RTKzJydzdpcWpMbktZa2x1MXhhQ2Y3Ykwv?=
 =?utf-8?B?dDJGNjZNUWFoRlJwVHcrVjBwZ3htWjkrQ0hMNE1TOVRUZThPbW9PeXFaa05S?=
 =?utf-8?B?N2R5UktKZkRCTDNMZ1ZNOUpsVjVhODRZN3BsSnkzOTgyc1BuWXBjc0FrT3BH?=
 =?utf-8?B?a0cyMjR2dWt6UEI1SlR3NW4rWEJsemFjM1FwaFBHSlRRYzZhZW5TQU1rQWMy?=
 =?utf-8?B?U2hjSkhQSFB5c0VHelNxdmVYOUVreGordGpXUXo2MFNOSlo1d3E3MjN1aGNq?=
 =?utf-8?B?ZU81T25GRlR5cllLNlZmMjVxNDFpUHVwTXpCOGJWMk1DemZRblpqTkxibGNu?=
 =?utf-8?B?SEl6Yk92a2t5NSttRkE4a3VIVzh5YUZrZDYrZTU2bytVUTFJcU51YU1UTkF6?=
 =?utf-8?B?YldXOTBIRFNvOGpoT0hpWURRN1JpWmNrNTAwZHRhODBUNFRwZWp6dmFBbDFx?=
 =?utf-8?B?Y3RNTGdweGlhOEQxcG5XWFNLNys1dzlzN1k2L1dNR0k0MVgrTklOMjJtQy9t?=
 =?utf-8?B?aE1TQk9SaDRXd0RJMG00RFZWNmFmS1BnajNteDlzdER6Ymd6WCsxV0Q3aEFH?=
 =?utf-8?B?WlR5N1gyZmlxRHpNN1ZwVkZhVzViYUVqNjMzanhMWXVSY1RRbDg1ZDlBSE5l?=
 =?utf-8?B?NmhNVXZNUUxNNVpuL3pCeE5KWDA3MnIyOW9hYmphek5wcmliVy9zbytZeWFj?=
 =?utf-8?B?K1ROVldwM2gyMHJCVmtGMmFoeHBkRmJzeUo0YWtxK0c1QjZUa2JIUDVIRURt?=
 =?utf-8?B?a3FQKzBYZ0hTUll2bXljQ2FyTmdDbmxVc2Z3anZhalhiNXJJZEtuY1BKUExI?=
 =?utf-8?B?VnhHQXl5dWc4dnNlU05sWEphU094OVJKRUlCR1NXKzBUaTRUVnJkVnZOc2FM?=
 =?utf-8?B?dWI2MEpqTEh6VmU4V1F6c1VGTmF6dVJ6MDFySE13RnExVWpvOEVsc0dkYUNj?=
 =?utf-8?B?eFpxOXNhNEp2djZlK1U0b0pSbjUrcm5HOHNOekRpWEJhYTRnVC9XQXhuMzBD?=
 =?utf-8?B?anFqT1hOaFhnUVowY2pnbTVTV3FmZUNGbGRTT0Q4K3F5ZnhEei8vSG15Z3kr?=
 =?utf-8?B?RmI4WlArR3BqTnE4MGVkU214aTlrMGlqOU0xU0ZSbDhGSklFRWxkY290NjVz?=
 =?utf-8?B?ek4rTTlKL0xIeFRuVE5Zb1ZBZzVHUWJ3K1lUWmdueS9tVWluNWlJZmo2UEVH?=
 =?utf-8?B?MHZCMXIrZG9vMzJJYjcyNncyR0ZrNDJoMXE3Sm9uSERpQ3lWb05nZ2Y2Qkdm?=
 =?utf-8?B?YTJRTjRzM1FvNS9saHY4TGpuNU05aUxNTXRCZUcycXgyU1BFVkJaQ2lId2N0?=
 =?utf-8?B?aEk4MTVoSHVEMGVYcStHcTRjM1Vuc05DK0ppNHdIRmNWTWtTZ1h5b05ZWVJT?=
 =?utf-8?B?RlRBZTRaOVhHUGV5NFN2ams3SXFnWkdOYUZxeEczVkRlODZ4cGx1RWVWSlpX?=
 =?utf-8?B?ZlFMVWNwMHpBdWx5MnBnSFZGM3A0V2syRzMrS29nRkV2ZUdOcERHbXR6M2hH?=
 =?utf-8?B?bC9KOVZ3WGRlOHhDbVA4bUhyc3BNNVFYS0lLTzBjc1RGK0gwRlU0MkVXbjJk?=
 =?utf-8?B?TUw0N0hNR1pvQmVVRTl6NW4xQVBNd24wVit6bzhCY3FoK20yM3NROFd2TkNq?=
 =?utf-8?B?L2c3V3ZuSVlqVndrMzdiekRZVXZpOE1YQndjVk9GYVovTFlKaWNISXl6RmYr?=
 =?utf-8?B?WSthNmxIQ3pZVFRFMlJsdnJmdVZhcm9jd3FUdDZCd0tRSkE0ZHZ1K1UvdjhO?=
 =?utf-8?B?aUdsWnFUTS9mMElOL1QxQnFwRzFGWUw5U1FPQ05OQ3hxd2R2NU9HR2NOdDNx?=
 =?utf-8?B?bWF0ZDE4ajBUTUM0UE9tcnMwZkNxOGk4U2dGU3F5SzlEbnB4akNIVVZvYkox?=
 =?utf-8?B?TXR1bEMxZ3ZWY3Y0VU8wbml3VGtIOVF1emtwZDFNNC9OcXg4c2FPSFRNb29s?=
 =?utf-8?B?T3l1RG5VbmVKVkhqUXR2cXpMUEU3M2IwelVRK3UvbzBTbEY4T1V6VGtITDd0?=
 =?utf-8?Q?tV4lWkzMXv6dwU623jHioIM8P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ab4832-e9c1-4b5c-3ba9-08dadeb81bcb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 16:19:14.9561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6oN0K98ML+6K+FuP5bjq7YQVHLiIJL1C/ffLH+l156V6Dzx9cVp8ihAKHSst5INGbtRkkgijLCmV7VltQQFSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8637

On 15.12.2022 00:11, Demi Marie Obenour wrote:
> This allows eliminating of the former, with the exception of
> MTRR_NUM_TYPES.  MTRR_NUM_TYPES is kept, as due to a quirk of the x86
> architecture X86_MT_UCM (7) is not valid in an MTRR.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



