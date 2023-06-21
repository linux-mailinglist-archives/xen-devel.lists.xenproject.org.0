Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C45737B99
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 09:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552470.862570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBrtQ-0003CF-G4; Wed, 21 Jun 2023 07:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552470.862570; Wed, 21 Jun 2023 07:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBrtQ-00039c-DB; Wed, 21 Jun 2023 07:04:40 +0000
Received: by outflank-mailman (input) for mailman id 552470;
 Wed, 21 Jun 2023 07:04:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBrtP-00038t-Gn
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 07:04:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e22f0b2f-1001-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 09:04:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9782.eurprd04.prod.outlook.com (2603:10a6:10:4b1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 07:04:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 07:04:27 +0000
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
X-Inumbo-ID: e22f0b2f-1001-11ee-b236-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvys7w9Ob88jsYKBSARbKJ1+//MLZwiPTBo+tgB16xnFp224od7XIKhoYvfmcD35PcPLk62z6f8hQXbIOK4mi47sVF27PxqyRLA28TwKQf3tW0IkCrjZcTrdqqwZDDgGhMfEMdM8sztA6ae+ByECBDA61sUGmJadXh7HANzOn+CuokR3Xz3EEq6DL1NO/9iHeZm4ElmoX56vLbwmTK4Mfdx5sCfW0Vwp4P4XG8s+3/07z0Efz9+8IXgGT3TT8dsdMKqdA5KZpEyiyHRBV55kXSV3QmSYmITSm859PBD0/i5nAbxVTBWwaZJk4W5Vuu5MX9vxYhS6DD0f3vC4Ulcdtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8k10gsySPbGGUaRx/m7J7snpHY5TgDta6KZKrQEfU64=;
 b=J2g/v5dC87FaS0Ygx7BjcpUbX4VbBTGQNvG2bReB/ilLbUOXf+4i5Nqxi9cZtgRFLf0m5ANTm/nkV/7bfwIgA+mf1g2gNjz9vIov1vfuZy8KUYs9T7Ph8xmzp8oLIGXiG8gY1EC8eFoCra60s41G0SM74yoHsubhaz2QjrmGTshJvhXmIsu/qiT0hbcKRfGvo+doHU4Rb3gIvs+d0doe0CH+2CPChbvNg2tV3wvU15RuTWZasdZ+xGtdKUS/pS+LqNzEEkMWhNdUhOmqiNnQY05nt+fnuRzNlNbVkADR4pIKpcV77RACfOLzbTFVWg1+GYsvjopsnlSTWS6VDE/LTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8k10gsySPbGGUaRx/m7J7snpHY5TgDta6KZKrQEfU64=;
 b=ACiQoI3+dDIje/qsLh8Pxg11yNyuQggFNlY1nddE34m/fqvtrI1DlxCRe0P9L8zd+5NWk6rJmztZEhQTo3sInR3Sg6cMUOJvcns8KjKu+V79L11y+a776SOGPlP78s0N8LmvEVDAsz/BdFYiP/Fs73tsQC8Y6yzBQ9ClZyacJnt1J1aU00stxCVYGGACHDXYtjOR1V+MDlMV36j0yje4/ZNjF+qcEyMXN6mXrddWP6K/lbgYJDZZFtRiMACWruqmTxMfG39xr7gZpFMSB/dV9XqqNFUAgoxF39K756eLlUA+n1+XOPNJEGEkgEpQJkqSkVtLaKGinIruWYh+9PEyNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e3a15602-9d00-9150-16c3-83e90c46ede3@suse.com>
Date: Wed, 21 Jun 2023 09:04:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 03/13] xen/x86: fixed violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar <ayan.kumar.halder@amd.com>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <397206cfac500d171be31dcd3503d9f61e531a97.1687250177.git.gianluca.luparini@bugseng.com>
 <alpine.DEB.2.22.394.2306201349120.897208@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2306201349120.897208@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9782:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5ea193-89f6-476e-ed4d-08db7225c0c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h6ogy1eJzfOnbOe9zRb4KRMOAXJkhzeCaQyff3ZDw/OZmfAxdbfHCd+5o+7gFJAN7FQz4VBNtR6or2nqQE5twPv4HDUrYLXSvhdMnOs8AEsdsXWl6UUPbrC25u3tDrccXMrACAVkcHoSjvDYYDRw8ZS6jhV+BFtRq38Gh1gbfZ2Fhs4Hs9nFXWORxrlh70z6jOwZVwBqDs3QjilZpYUh5JD6LP9oXWO+XNzgrf5ukCiQzvB84QEj+/HSuIRUdfiRyRue2hHNl/3c4rfcCuxA8R6PFVX2sNSvDS4f6/abnfBUhBjI2aejAwJLKhcnoFn8EALxWojMzSyzHa/HG6SdIRTrgF6Uymyk/gchO1/Fj2NZkBsMxmY0uUESTE858K9FOIwsktEXKqHz8sPe3Yqwpkezo6II/M/B9laRKSXVGELgiDS843MTyL1GHN7sUmTip1OKxzU7lr5j2+vOx0LU63ixRPsNiMf7VIs2ODRZsQY+AFnJKPqYToptRfDh8ntpuQOh7tKEGzN3Uf93JKs+k9XaypbpFx7WABt1Niumk1FXfQe1RQlleKHJIpJFFOSXZJpYgXnUiTHQMtBNiuiRL0pTNDeRse1q0C/iFsY664K44+10a5Y9PHSpf7lIHA3DzNlhGJLCrLK9h9AXOTjErA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199021)(31686004)(7416002)(38100700002)(6506007)(6512007)(53546011)(26005)(5660300002)(8676002)(8936002)(186003)(316002)(110136005)(54906003)(478600001)(4326008)(36756003)(66476007)(66946007)(66556008)(2906002)(41300700001)(4744005)(2616005)(6486002)(31696002)(86362001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1JUTkdXa3hXUWFuRStIYktXTENTSGc0Z2dxcjRubjRIRi8yY3lCSEIwTFlk?=
 =?utf-8?B?bGxUNGpIQk9nNW5XVlc5cjZtTDliUWxac2xPbEdmZVA2TS9jcnlrdC8zNEMr?=
 =?utf-8?B?MjRiWmpSY1pGdzhoaW5vY2dvb0xic1RVc3J0alliRVoraVRYMWl4dytrOGVi?=
 =?utf-8?B?dEJQUk9HU3JySlNFVi9hUjFoMGNRbytVZVVGZGZuZE50cmhVb0hBa0UvREdw?=
 =?utf-8?B?Vmp6dlhPMUcwb2YzSWtBVno3MVFwVUVKaitjc3diRW5OSkE3VzM4V1BKMzFI?=
 =?utf-8?B?cUtoTzdpUElxQVNhYkk0WVBra0hVTGN3SFdUbTRDazV6Q2xOcC90R3VsNldX?=
 =?utf-8?B?SEJkdWdTODBrcDdWUnMyK2lKRUh6UHd6ZTBxblM0c0RQQ0pzVE5aQWFhZkl0?=
 =?utf-8?B?NWp4V1dCbkNlOE4wTHBkVWN1bCtiY2hIVEtkb1RCRytpNGxKakpLUUVGWnh6?=
 =?utf-8?B?MUVzN2FwUEdtRWR2RFQrbXBRQ0dtMVJjWVE3UmVaTG9rdXRCKzVkaGxzVXFJ?=
 =?utf-8?B?ckc0RE0vQkFjM2ROWGErQ3BPNjk3TVpWQXhJb1RLK0VXNTJPV0tIZ1plVlZw?=
 =?utf-8?B?OXp3SEFUOHB3bU1FZ3RxQ1IwYlI0cmFBbzV0VjRRdWFaNTdTeWcycjI1REtw?=
 =?utf-8?B?dkVsU0RDZW5IS0k1bGt1dDNDRWdtcy8wdDJ4aWlxRExMa0J2b1d5SWw4RGM4?=
 =?utf-8?B?bFFjbFdjeFJLVGJhazlMRGNiamJ5enRlcEMwYVFwS2M5cDVwVHFHbU90cUQ0?=
 =?utf-8?B?Tk5zeVQrMnFlRm9UUGZGQWF0SVNGUXRucEF6SUpna0d6eW5icUE5SGRxdHlm?=
 =?utf-8?B?d0VxS1BsZW15bG82eFBmL3J4N3NQVEFxTW9zbnJWNFNIQ3hJZmU4YlBuOEgz?=
 =?utf-8?B?cklraTRkNGNCaTl5cWt6SEE4dmdZRmVWdmZlMzlRYWVZQTJQbEhyTlNxYURV?=
 =?utf-8?B?cTl2NlFvaVhYQjJGQWE4d3IrMVdDZmJuL1ZsTzdhTGV1K1BjQmp2RkNhVm9S?=
 =?utf-8?B?NUhiWG1xNkdZK0NJdFpZbnk1TmFYY0N4aXU0MXNvS1FQR1BLMFNYSGZhVHIy?=
 =?utf-8?B?WVJIZjJ0cjFsSi9IWUtDK2VtNnF0QytqdWZZZkx4ZmE2SCtVdzNIYnNsOEZK?=
 =?utf-8?B?Wnc5V2dnUUhuU0plT1lJbW1TV3gxZWJHUVhBR0xCaU5JUnlvQmlpZG1taUhW?=
 =?utf-8?B?MThwNnJYQkxmVkE4bDFyM2pEVmxUdDRLZFNQSDBiWUNpVmE2MHU0eStRSktn?=
 =?utf-8?B?YWo3QjRGK24vamMvVXhHMUxkN2c1Y2FCK2p0VGlpNFpFRUQyQURLQXplK29T?=
 =?utf-8?B?QlpqVDVseXRCVkNLR0tsN2gxRjFMSFcyQnlLeUYybzEyLyt0S1FFTGpiNS9n?=
 =?utf-8?B?M29TZ21USVh2OTU4WHppS1laTW9ONWw0eVovWjBUaVlhRnJnR25pTi9adjlY?=
 =?utf-8?B?SmxNSlczQWVwTlFBcFRzZWFWZ1pyRnhOUng4cVFQcWh6ZDlIcHVRUitacEJ5?=
 =?utf-8?B?ZWpnQW1TdG1COE1kck1qbS9aZ0RhK3V4WHhyY2VkbEEva2ovNHBrMVRnd2JN?=
 =?utf-8?B?dE5iYWVSK2k5WjZibjlCME92ZXd3OTBvWVI5V0RBWFUxVkUwUDdsV2tubmNJ?=
 =?utf-8?B?Vk1zYUQ3OEpHS2hkeTFGRU1kQVVaZXVDNHA4OHhKVXFGb0ZTdllrYTlxOE1R?=
 =?utf-8?B?UzlJOGJVRkFqV0hmN2FNaHF6ekxpOUYvaVFabFlxbVdnaEhQQUZyVy9lb1RF?=
 =?utf-8?B?b1JXQWNRTUg5K3lVMW5tRnVjZUtBbTRncDFQVEVLZmROelJuMHNZb0lyY2cx?=
 =?utf-8?B?cW9FOHhnRmlpNVhWYmZHVE9DTy9QRnJ3TFE1WVpuR3U3TXdRM3VYY1ROb003?=
 =?utf-8?B?bGc4RStoUjhrM0V5TEpNQW5vSk8wUUFXVmFLVGw0QVlEN1hsLzNTYU5YVjdB?=
 =?utf-8?B?WEkwSTNJUk1WcmFxRm1zR001VzRsdWdkL1VCS2lMSnkwa3FJU1h0OHZXQTho?=
 =?utf-8?B?Qi9WZ2pEVWs0MGR1VWtIM0NqcUp0L2pOTEE3WDFwMW1zZ05EY1gxTUpjNGdI?=
 =?utf-8?B?M3NSeTRiL1p5M2wvOUpxRy9mSW9haHA4L3owTkR2cTZhT3NESFNTditqbExV?=
 =?utf-8?Q?9wmlx0zzfKJwqgvIZZD566UfT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5ea193-89f6-476e-ed4d-08db7225c0c4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 07:04:27.7702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPP+GnztM8scWTBN1fYN/yCaes+9ZnP15iGRmvT0VaXpS7snNOdwaXubGDP0pY0/P3q2fd6PIKlIJbNtbwK1OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9782

On 20.06.2023 22:49, Stefano Stabellini wrote:
> On Tue, 20 Jun 2023, Simone Ballarin wrote:
>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>
>> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
>> "A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".
>>
>> I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Commit message aside:
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> FYI I would use the following as commit message title to make it unique:
> 
> xen/x86/hvm/svm: fixed violations of MISRA C:2012 Rule 7.2

Along the lines of my earlier comment:

x86/svm: fix violations of MISRA C:2012 Rule 7.2

or (imo less desirable)

xen/svm: fix violations of MISRA C:2012 Rule 7.2

At the very least the hvm/ infix is fully redundant.

Jan

