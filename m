Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4496E592E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 08:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522565.812030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poebt-00089a-TG; Tue, 18 Apr 2023 06:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522565.812030; Tue, 18 Apr 2023 06:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poebt-00086D-QZ; Tue, 18 Apr 2023 06:14:37 +0000
Received: by outflank-mailman (input) for mailman id 522565;
 Tue, 18 Apr 2023 06:14:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poebs-000867-7T
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 06:14:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49102ebf-ddb0-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 08:14:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9484.eurprd04.prod.outlook.com (2603:10a6:20b:4ed::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 06:14:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 06:14:30 +0000
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
X-Inumbo-ID: 49102ebf-ddb0-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxQWVRJjiUA1x/mCUq879b2Y0GJ9lYKGlXJ9uq3DDSC+7l/iYxHllaS0KOWYsi17oWZaD6tg38ADGpItzxtCInxFDxD26zsNW1gDezJDpg/ZGd2IBpRk69Ru6aoNuXVD9iBBLHGTE+Qtc3vUctt8zvVDqDzh1jHzYXxUOXk4YtqAa+jzgBQR5TuIFS5dcnBvicmIc06HLU/SNfKffd9KA9ngV+eHssfht39YZOZ5ZnvewzEXW90yTDbOc7ZrTavQlHKZym0SQBU1QNNKEem6qQFi+/6H1FsWukoDXBplb+1FdjCwASOB2mO7bnpuYPlFUQQFJRhfwTCjGKihZFqHHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZl/v+/ijw54GOdj5uLKZsMtCnzW9OK05+tNBKbYTk4=;
 b=dcB7D4wVfzQhqGNj42pWa9MAa/HnFlyJQKQ5LleKasT/cld2XGgykVDy+MkS8KBd9FBVbXgUpY5qScjMbSBANV3vxmSRXhh7CQcCD8cWlmGqiVNq1rM0KxJre63FLkrV5/tW4KqIxwP4CC2PXRqIn5H7ACaWDLJWSdtiCmmKvEOaEZQ5LTnLfiZpTFs284rUmaYWVFp3Hy1h7dCDYkAs0WzlF3R2QW+WpdayMA1DIHGkCgb5fzceS5upo82i9norgrNND+2MQYbcyi74/n9/Urb55Dxg/ZUig0H7EV4NFFwES4FyNGXe/5fGv90oIMNb2IGnacIPgd8TLwSJ6PT/Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZl/v+/ijw54GOdj5uLKZsMtCnzW9OK05+tNBKbYTk4=;
 b=aoQ7RgMnI6R6lpi+3uDdajtx3KHwyNJQmgBbD90MwCDEXeXGZKtBa3N5A2w9khRVOh0taS3LYCm+nngMrGpTLjRZI7kQ4XpXfWyYJhCfREsKx8i2Wb1dkmuDeE99XpDElRXCxTnTyyQ7Q5Hgoz1hgpVJfsiVm3ls0sGrIMf85wvZDmjlzWSfeLhQkXFHt0Af7KXLk7878Ghsb5nmjTyqJay4sD2o7dG8EiV+CgdC/cRBPq7UoLapZxtEqpyQsU74yb12UuNjy+l5d8Fkiq9DG+1d/1yKlxwKmghJqqwkSR5V9BuvTL/XwFsLHw2ZNrVbwnRLeKwhP/UxgtY74HxxRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3cf8cdbd-75b6-b1a0-6230-b7efdb9031be@suse.com>
Date: Tue, 18 Apr 2023 08:14:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 0/2] xen: some CONFIG_DEBUG_INFO changes
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230405135629.21829-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230405135629.21829-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9484:EE_
X-MS-Office365-Filtering-Correlation-Id: de1bde4f-67e8-4184-eb72-08db3fd42be6
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BTxoTeC5W84Q7Y+E/TpFWao58ezKfr8cdOoy42l5b8NOgsnd1K3DEc6qeSIp0TyABse3IPX4pKCrI2s5OM7GXdj+h/TlScol72uRjSTsbpHLcEI7vvHU4ihkI/vsg+UXyrXcbcAdcgCvjVqquZ40bJlaVXXeryBdvW4IyguFVrf/6UBO3vz+ubcVyZtBEy4Fl4evobMRBiJOoo0h+2qAOte/kk2lUCRrXBqYU9366ejDFIABcE0UBFwgnimDbdyHbLKdtEXa7ob1eiyz2eQTM7+0+REHsILTkqWomixFCqqdx6GpbAnWnr3Nt/bOxYNAC5ZXHFdhEOzCah1/qQPTRK9DKwandLeBlKh90HBukYVb7ZV2vSDhpV+w+VflpfmszKEakqpAQeuU25v3XmTQrw4bv7g1N+xLOpN+n5YG7AOIsWevhYlLBOEh6I6rKNEXIET8oWRv6Q4KRL5fha6FvWjMppVDkzArM/kvMLi9RMGKNQ8K2vht3cI+Ofq4MyadbEgw0pb1O3YiUNk+WKBQ/WerLQbcLYEpxUM7EyLcZF1OqyzdX/UztZcJAMG/RVTl+l9dDVq8F6PBTngfuuCGG1aZaVdwkt8ib2fXVkeXi2rgWzornU+ZVYm6KJrdnRyNxcvz2bOQUpNO//H+F2yacw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199021)(37006003)(478600001)(38100700002)(8936002)(6862004)(8676002)(316002)(41300700001)(4326008)(6636002)(66556008)(66946007)(54906003)(66476007)(186003)(4744005)(2906002)(53546011)(6512007)(26005)(6506007)(86362001)(31696002)(83380400001)(36756003)(2616005)(31686004)(5660300002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnRnRHF1WFZRTTV3c0ltQzNJNkt0UmE3U0tiSTBaTWhIV3dSTmR3RHdJeUQr?=
 =?utf-8?B?UEEzK0RXQVhrbWNpaDFuQWxmQ0FUUzlzYmFBaW1ETU5CNTJleWpTUEQ5U3c0?=
 =?utf-8?B?UWQ4bm0yTUZoa2JkdFN3cjNMcis0RFZPSGJBMFhiUGlwTEsvNWg4UnNwTGNZ?=
 =?utf-8?B?My9UWUt4VUZQa0hESHQxNjNMdm8vcjdKQkt5Y0ZTVHFSWTJUaHFVZTduT0RG?=
 =?utf-8?B?SkRmZlU2dGVVVXJieElIdFkrNURuN2VOR0VDeUlGQTUrelVJMVlXM1BTdTNP?=
 =?utf-8?B?a05zZ2JsTnREQXFNdk9kT1JDdFdTNnVIMUZEbWx0YmRXcHZyUHo2b1gyZ0to?=
 =?utf-8?B?VFAvbFpBbUwxbUlHRDRCSVp2bU9yZllXc3QzRUVZZVVjSmJQU1IxUXdrcDN2?=
 =?utf-8?B?QXNPWVFvSjNIUzNzblB3T2w3V25jdVNuWjFOalIzZEhzN0JtWDVXeDBPSjl0?=
 =?utf-8?B?dGhrSVFpOU1zUXMwSDVzZmw0M0xZalRYcUNjTDBsRTAwSWxialZhZDFrM2Za?=
 =?utf-8?B?amh1cGJ1aUxNQkI2ckNPNjZKeEpmaGhzeTlHdjdCcWJjU0I1Snp0OGRaK0Ja?=
 =?utf-8?B?M1pPMkhjUmtmdjRLNGg4TjNxNWhIOWoxQTdFK2VJSkNvSXlpY2FxdldxYzNh?=
 =?utf-8?B?ZFl4TFhHcXRnK3lLRnN5TVE5WFp1R0EyZi9WL01hOWY4aDFyT2xQZ3VWRUNJ?=
 =?utf-8?B?ZjRuY2ttTlJ5Y011TTJZWVU1TFl6aDBBdFoxZVBjNzFSMTBiaFFVRFF0Snhu?=
 =?utf-8?B?T3llbU5aUlo5Y0RiUEFMcGxOUjhhSzNrWk5DREJYTEJVMEhQeXhKUURBajFj?=
 =?utf-8?B?MWY3NlFVbVdKNDZSWk9PY0xnRW9JWTFCVGFMRGYvWERVQTRYVEpQUWMwZVpp?=
 =?utf-8?B?RjN4ZzdCcFdSNFRPbk1ITmFTZTZKdWR1ZWNiK1RScnNYMCtOQVcyRldlLyt1?=
 =?utf-8?B?aGs0Z2J6TzJiS1prNXpJK0JrR3JDM2tyTFJ2cHFjcTJXMjhBNytrOU1KRjdW?=
 =?utf-8?B?bTZJamN4ZVJiRW1VYlBZSGltL2w5eVJxMnlNckE5a0ZTSVNVdlQ2MVNhRWQy?=
 =?utf-8?B?bkp2MkM1REQveXVoM1FmMlZzbnZPdWNBTmN1MnVveSt2ZU51eHI5Mkcwc1ky?=
 =?utf-8?B?U1E3OHdDdURoQ3lyZnhCamdOOXlER1J2VHlBNW1QRVlxODViN2RFeVhpbFBF?=
 =?utf-8?B?d0VMWTUxdzBIZW5URUxUcUJDTktwZW5jTGU3aDdKM0RtRFZrYVBRTkdPbTdh?=
 =?utf-8?B?cHZ6eFJzcmlVaTFpMy90VjhCblVjOG5ua3JGVVl2ZXFIcVBiVDA1WnRwSXBH?=
 =?utf-8?B?Y1BLbWZORjdxNkFydWZtRlNaOTFFMTVvdkZuakhRb1hUd0I4cDR2bzNPeE8x?=
 =?utf-8?B?N3prazk4L3p3d083TXErdjZwMEhLWTIrZ1VFU0hYdlNMelJnR0FlQ0xjSzVj?=
 =?utf-8?B?SStWZURXeE9HSWdoVmkrOXh3MFJ1SFRGYWVSTmdwcU4xWDJscWhBanl4ZFBE?=
 =?utf-8?B?cUlrUlNSU1ZMaktOQlNOM29BTHJMeWFONFN0MzRRYmJFMmpJYUN0Rmk4VkNp?=
 =?utf-8?B?ZEYzREJwQTNpcjBXMjJlZ3R5RjNBd2ZQMlFlbGoyays2MHAxMmNJRnFQL00x?=
 =?utf-8?B?MG9FcXRyRjhPTm9lakpVSVhoNHRHZmFSemF6SDkwOGNtbnptbGNwSEhLVm5t?=
 =?utf-8?B?T21JVTZlMk84Smc3WHhSWmRHS0R6UHFUNHRZcWxvYmZPTlJTUHpZUHhGSGNm?=
 =?utf-8?B?QWpza3lTaTViMmN1dVEyMlVhSjAzTjVzbnFzRWtDeE5RRlhrK0YxV203YVN1?=
 =?utf-8?B?S0FrbEVtR3MvR1I3d3pnUjMxTzA2dHNlaE5sRm1iY2dLT3l3Q0Y1dWFxcHFE?=
 =?utf-8?B?cFp6cWo2eVFWYStKcWJFWXlDcERHVExjKzN4aTY0aTIwZXJKYnJMd3FLTlRi?=
 =?utf-8?B?Qi9tajQyTHlnbWFIc2xpbVRwM2dubkVmSGltQVhUU0N4S3l5UVRNeE1zb3ZX?=
 =?utf-8?B?OFp6WWxXTlVjZnZuUUNCZzNNK0xKQ0FwcDlMa1NWZk0rTm1Xc0NDWElGWHhL?=
 =?utf-8?B?WnRReWVlWTJ5bWxUOUtKbnJZcDRxNUtXbzl0VHFXT1ZYcTR3S1h2YjFiajJq?=
 =?utf-8?Q?w0I1/0sS0rLZdgJwFmg/naqQL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de1bde4f-67e8-4184-eb72-08db3fd42be6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 06:14:30.6920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2P/Lo2c9JlGUf2Tqr1BK9NNisksJtQWguFloe+oZZCkZmMw0OUwjlWp+0xb1Z0Jjxty7PFR3BdcUGOWSpnHzwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9484

On 05.04.2023 15:56, Juergen Gross wrote:
> Enabling crash dump analysis of the hypervisor requires the hypervisor
> having been built with CONFIG_DEBUG_INFO enabled. Today this requires
> either CONFIG_DEBUG or CONFIG_EXPERT set, which are both not security
> supported.
> 
> This small series changes that in order to allow security supported
> Xen builds with the capability to do crash dump analysis via the
> "crash" tool.
> 
> Note that due to problems with test machines proper support for EFI
> booted systems hasn't been verified, so this will likely need some more
> work.
> 
> Changes in V2:
> - comments addressed
> 
> Changes in V3:
> - comments addressed
> 
> Juergen Gross (2):
>   xen: move CONFIG_DEBUG_INFO out of EXPERT section
>   xen: update CONFIG_DEBUG_INFO help text
> 
>  xen/Kconfig.debug | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)

Seeing no-one else showing any interest either way:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

