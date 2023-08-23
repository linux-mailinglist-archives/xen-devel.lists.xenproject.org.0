Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B549778512F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 09:12:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588988.920661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYi1j-0005tT-NJ; Wed, 23 Aug 2023 07:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588988.920661; Wed, 23 Aug 2023 07:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYi1j-0005rR-KC; Wed, 23 Aug 2023 07:11:39 +0000
Received: by outflank-mailman (input) for mailman id 588988;
 Wed, 23 Aug 2023 07:11:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYi1i-0005rL-B1
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 07:11:38 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2058.outbound.protection.outlook.com [40.107.13.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bf05b1e-4184-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 09:11:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9809.eurprd04.prod.outlook.com (2603:10a6:800:1dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Wed, 23 Aug
 2023 07:11:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 07:11:05 +0000
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
X-Inumbo-ID: 4bf05b1e-4184-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAWaNtISyqSfP0wbyW6XejfNZxNkja2aFRY38f5NJ6QlSjsBM5CiKrWitvMTe/vJ4PZy2iFs7bFLGS/xGkh+8TmEfWC2ieUZ80JxGVQCuEPdlriYWxs4WGwBm3ukMbLyCUDajkeo7N7Fn67SS8XNc9d5iLphtym4hJ8V7cun/7+6qoVJcDF/FIHHnkS3di00vID/lU61feKMAtv+tEyoANnr85C/PXJvF2q7iCpuuxtj5/H6Xtmaz2eS1/zGDdyJb3zFmjCuFgHj2R+IEpMlXEJXWWSaVMfhI2k/4n87zb9NRGSW7YRMZG5PT3xwlBaNIrgBubRiP7dKtLgo8KIUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdNTbxP8ZkLMPYnZfHNUWxXnJOVnS+TEYOF5PKJCW5A=;
 b=bjtx2U4vVSVkikSherzS6CYa+Zgqtl6phQcdw1vTa45X/LayxY4iMdPDd4VI/Gx7IFMSOphcSjTzn9/A3enR+OqJ7liCvMdbeHM4um7rT0fCt95xSpxfyIoai8j+C6mLZ3xxEPuiZDXdlBvRDDtNCMxxfByUxOoTy+eWoNT2XW5PX4NdnCMPPCiX9A75VkBl/Rpv2FOmTjmW0VYrn0f+EpjnyUH3bz4HbF+UN4jfrSGNHokVMpf+r6awwlpaYN36xcKDdT/Nm50p6YW8EQCSsQxbROG0Xl1USWzvaRqXzdoeeqD0UGVsfDCkqV+so0IuBozN4bGm1gWO7Zj1zl+MnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdNTbxP8ZkLMPYnZfHNUWxXnJOVnS+TEYOF5PKJCW5A=;
 b=wU+aLqiyDjSMD6Iv/1nV20Ogb03MGoBCfhIPhPEoxI6z6Z+R9FkExT24azlQBl+pBAVeRmOFjY/B+hZURHYXvWmnDHzFYKh+Qfo6GPJ7QYBuRKLr1iqX4bXXValenw85UjfFWlT6drf0wFnwpKb7FvnD+l50RZoJ0NXtoTLCH+jRz2WEmyzQzywSkkYCMCpaJMCouRQdqiELWkSlBdCxLH2CluOztabBueRg4kF2baM4gsMWlE6z012BjceJK6EEh7RmhRdkIS/xRjvG7iAmSTdyVqLJZxIuVQsxgB5GiLSFrhOzYpPAQdWA8502vbpaubugVj9FIHRRZjFwFWj/4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0e7b444e-0b68-ee38-906c-c7d389058154@suse.com>
Date: Wed, 23 Aug 2023 09:11:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2] xen/hypercalls: address violations of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <7e3abd4c0ef5127a07a60de1bf090a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7e3abd4c0ef5127a07a60de1bf090a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9809:EE_
X-MS-Office365-Filtering-Correlation-Id: e046d3f2-98fc-4106-7216-08dba3a81dab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aLAM8t+ueEdRtHGlNUs1nyeLZNtiMQIWtc0/oKPS3Te2VYCdPr+CmN3RCBtn2+XRsWBnV0GgUlMJYqGJh7R5PRtesNeJFdYSwA3B1SoC153UfJr949JM0wwNymIxP3GU5790q/D4/y7ZxC+u8BUJpqMV6/R7VNMwq3cZEQqKkco8iJEJ56hQycIXfB2G5RpAgAP3ezuIgiyCsX2xPg8QKfy2OnO9MWSEtwAL+otOb3CT9BUAZcNkDj9YoteUbwElbpQ4dFXJz3UsTuxgYs7TUH1yQiJF2ZHIFMq2wlyVgzU82tEffFKXocAXKEx7BuMjjonVEy4YKZJcU6WmGNezG5OU4+TLUEJ3MuB6e/Ua+xzYTsYqMq9Hfg1M3PQLjuX/AaDb3RgJuX7diqDxA7xlepYkS7mdfq2N6MWGdFrJT9/0PkJA8zbnfmJF9K9AaKV6fe3I0m8ZD0Sylbewd88vLA7guMc263tjHnYEdMcmjcco8xSSE62U5tnKLoPgbAv6X2oQxHnaYi87fixoL7yMDd20DCz2amXTvAKjpaZnvOdZI7yTxkT748/t33fFSJAMFVX6h/OjiTJem1+Y8iyd7hrSUqG++hXtSedK64ohSu+P32x/a8UcL8QwgfTdpFn23bx4c/qPCOeGl2IDzMN5RA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39850400004)(376002)(346002)(366004)(186009)(1800799009)(451199024)(54906003)(6916009)(66476007)(66556008)(66946007)(6512007)(316002)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(6506007)(6486002)(53546011)(4744005)(2906002)(31686004)(31696002)(86362001)(5660300002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TCtLOG1CTmZoT2x6dGk2amhIMWZzYTNXUnhFMlFITnpRTVJyUWdzV0EvTHRK?=
 =?utf-8?B?eFd4V25mY1k0Um9ENy9vRTF5eEVWaFVnNitpWVlGeU9peFZQam9HbjQ4NDlx?=
 =?utf-8?B?c0ZIVkNGZ0lLdTVUOTFkMVRxVjVKc2lIaDZBSXdGMkd1Wk9oWEUrTWlURHdM?=
 =?utf-8?B?ZUJUclZYUzFJU3pZTTkrR0QxSXFHdUprRU1sTXNkK1ZiSTlOR2IweTVHSXRw?=
 =?utf-8?B?SWw1bzJ4MlNVb0VBbTVvNWNJNitwUHBTODNmVmRQSmdVcnVaVHd6SVpvWFUz?=
 =?utf-8?B?bE5GWTlqS1J6dUJCSEJ1RytRcmQ2WFF0bTk4cjRPdFlENDdsQTRsYU54Ni81?=
 =?utf-8?B?UjE1c3U1dXRkS2FGZnJTR2NCZmxtQmNDYUd0TkNHalJ3aFhZcm5YU2JKL2Jv?=
 =?utf-8?B?enFJRDh4b0tudEc5eEt5SnpvdE9qWUtZbHZQTk43Q3BLdU5heG1Ec2dNVmc2?=
 =?utf-8?B?Nm1ZUHlXUkN6RitsWXMxQTJTVEE1SzZpM3NwK2NjQVNLeC9kT2tvU2hIcjJj?=
 =?utf-8?B?bkNFem4zbXM3Z2NuQUdZOEFid2pZaFVaTEZJbHNVSXFYbndnWW4rby92T2Q0?=
 =?utf-8?B?MDJweDBWbFVPWDh2UVhEd3lLWEVhYVI3M0paaGNIcWVpcjBPM3NxWlk4L0dG?=
 =?utf-8?B?STM3TFBHekVlOC8zYnp3OFJqT1R2dzBPT3g5MnJnUjUyZno2cXhGK01RemxV?=
 =?utf-8?B?elorRm9jdGE3TU4xeGdxRVZaOHlmcERwaGxza0N1b0JmRlVCT2lFVXhYcGhy?=
 =?utf-8?B?SEgxcnJHRUxrRnFYaUJxajk0Q1lDMEdzREY3QkpmNkNoUTAyWmQ2b1pQQVJ5?=
 =?utf-8?B?MTR6WkxsK09WSlRER2NWeDd2TDBPTk1wYVJ5YmlLWHgzTVROMzRycGhKWXJG?=
 =?utf-8?B?cDVVMlI5V1RScmdHTnpvelRjRXp4RG9Zbmd0VFBSeUVxNmdBT2tBclowOGJq?=
 =?utf-8?B?d0pOWFBaR1VZcTJBak9mUitpbEZ5bDBOUS82K3JUSzJlNVJjZVRQanRsUkRM?=
 =?utf-8?B?ZGY2cGtYTzJsVENtaVZ2TUlMU0I3aCt5akVoSTRQSnBXckl5dXIwVVd3ZHZQ?=
 =?utf-8?B?TW9FemNoMEcvT3RRdEZTTnVjV1h2NkNxY2RTZDhxRm5VMm5CK3U0bUJKdHBU?=
 =?utf-8?B?NEV6aWg5V0pXY1lRajl1YUZ1am1WSzh0MDhVNGVKY2tkUkhXVmU3ajUyM084?=
 =?utf-8?B?a2w3QSsrYnN4WEdpNjVDUmVuM3VBcmV1U1VSb2NYKzY2cS9rQU5NWmJ4NkIr?=
 =?utf-8?B?eTRHOEU3akxPNEZDOHJsQk5qWU55eHpRRWN1NEQ4OXFnMVcrOXloTllyL0pZ?=
 =?utf-8?B?RWZhWFJjS2VVQXIzby83cHhKd2IvbXJXdm9EYUVKalJKTjJtTTczVWxROVAx?=
 =?utf-8?B?YjlvdEU4T2xvMkpYNFVHOUUweElSZ0p4MlllMG40eWJnM0pjOTBoSTlmS2h1?=
 =?utf-8?B?U2xqaTlJYWJBRktLdU5LSnNtMnVxUXBYSWxFYWhZMDJqNisyaHJwcTlNNUdP?=
 =?utf-8?B?bzBWcXBzV043NUwvcTZ0Uy9EeFRkc3YwM20vMUk4VVBkK0ZBL1IyMU8yM0Rr?=
 =?utf-8?B?Ry8wbVZEUmI5SnRMeE9JNi9ZQWkrb1BBVm5ESldZRmZwNk1ndXEwSmZMRUdk?=
 =?utf-8?B?NDZvTWJBZDRieVVGM2UwSW05dUtHNlU0OXBvS1NteXMwUUhiMk80dXRYeVFt?=
 =?utf-8?B?YlJLekVrVnRTZkJ0aytzY09sTEQydGhmUDJHY3RGUkVOc1E2ZW5WWFVhZEFF?=
 =?utf-8?B?M0NZWGR4eC9kQ0x5ZVVqQUFtQTB2WUVxajQ0azY0aU9PR1hMMlRXMTJhUW5U?=
 =?utf-8?B?bnJ3TDJkOFoxTUFwWDR6ZUNkRnh4b3ZwTUgyb1RjTFY5VHRtbHY1YTYwWC9k?=
 =?utf-8?B?VjdPaU9jemlQZi9lZ1M5aUtTY2FjN1JjS1pOQ2tKZlBYVC9jT3ZLS0F6bmtq?=
 =?utf-8?B?RTN1dFN6TXFBOVU3bGRpTEdPVHpSbE1NMnNJQ3FKN2JOakgvSXMrTTBaa2JQ?=
 =?utf-8?B?RTJjY0UyM0QxalVzeDhPOWZIT1NwRUtBbFZHM3lnUllnQVU5Wm44bXJrbERq?=
 =?utf-8?B?bnV5OUxhNVdFcURwWStUWWxIU056TXc0dXNuVnk4OUViZUQxc1hGdklYU3lz?=
 =?utf-8?Q?eIDiAX1OyZHzEOBFAGtSvZC4E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e046d3f2-98fc-4106-7216-08dba3a81dab
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 07:11:05.2135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUC390+VW8pWafaRMgGwG3J+uVezN/kmP564mZ5EaXk82X53+89n7tYe2izSQsPALEqeL7zp/r5QjICwQW0q9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9809

On 23.08.2023 09:04, Federico Serafini wrote:
> Make function declarations and definitions consistent to address
> violations of MISRA C:2012 Rule 8.3 ("All declarations of an object or
> function shall use the same names and type qualifiers").
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



