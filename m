Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA7B7AFBA9
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 09:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608694.947350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlOdg-0000Gy-Li; Wed, 27 Sep 2023 07:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608694.947350; Wed, 27 Sep 2023 07:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlOdg-0000DW-IK; Wed, 27 Sep 2023 07:07:16 +0000
Received: by outflank-mailman (input) for mailman id 608694;
 Wed, 27 Sep 2023 07:07:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlOde-0000DN-RI
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 07:07:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7d00::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b1cc436-5d04-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 09:07:12 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DUZPR04MB9846.eurprd04.prod.outlook.com (2603:10a6:10:4db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 07:07:10 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 07:07:10 +0000
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
X-Inumbo-ID: 7b1cc436-5d04-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ED1Je8QaMl8RxRyLYuhcEaqLx3E9JCDSAlO7k6kMB2s7tiQwUR0VCfD/F/qU7/KmjPpKwHEEVDFn66gTVWmEVX6a4VJtEHUweMRR1Qno/y2e0Z/BItYEO1Cr99xquj9gFat2rl0n4ScP9pzPgLvV6iILvBO4MMUl0jWzxUZVCB74og/6DpU2tgOGTXZN+U+ghyKWVKeCrafkII+m/Z2YznWO2xZTYEY3MMtszr2sRMK/a0I/9tkbMiROIjXjBUJcxz9lDJUEnJ091/AbT8SPbszrE7pkFsVZm/E+ujqlQL4yZZBLibCKPe9m5S/ZrOZMHAUzXY31Ki03Gk/cU6BxGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJB4N1QRJ3okXLOguvXpjhmLrxJMHq5eAZu6GQCFeZk=;
 b=Ib2jbWJfwK7+Szb87eecDdm9K/hFyLRxSewOK4LYZ7bk1wjx9we+dwS1a973O3zrtthvvAnjOBvU3jyBgVXR8gD+W/fl42rFj2gb38SCT6SN30Kg8FF9gQrFOa5e4nVGn7bUVD6G6MkR/Lo/l5dztNqucHaEo453FkqNgQH6z5T1FT38Q7gxQhWhCXqvBmEGI2TMvmAdiaCEyYbODBFcYotiV65pvCVfHQBhgHNMDEt6IjWa2OdAuBlxi8uDMaycb+8nXbOCnbXNE2tnZWZPeKt1iGTD5pbi88yqdn820qnogS2A2lKFoYXWr8rJoAu4dx3FqD+qGjSRlodbRVbsFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJB4N1QRJ3okXLOguvXpjhmLrxJMHq5eAZu6GQCFeZk=;
 b=aRYNENQU8fBPjs5NtzwVUfduYFZ7mHgM/+uhZ1SRWD4nCyOvXW9A4sdWV2rCsD3wr2904hlJiIqeQCvBbU7pIIC47/6KtDs9GUk9LMUW5VLMo5ciE7DB/oiIiy+vQrsZlG3GVgajbhRvZWhjdTboV12YwCIOUNR299YNPd8/ecnUJz9Anq3TsQR5lr1dAbCklmvyDWuC4rMsJW5OEDaD4NQZZzspePWFBhONw8Uxbp3LV3r5jVdqH37b0yrT+3Ar7t6LDJmJ+xOtET6dX/t4CtXAtK7IL71kmBCETxPYFjR+Am7wX7e+hReAnBKi7FqMkb4iP0UeaeymIt6Za/4BmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0a7cc9ad-6233-0181-dee0-d4eddd2fbe75@suse.com>
Date: Wed, 27 Sep 2023 09:07:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] docs/misra: add 14.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 roberto.bagnara@bugseng.com, nicola.vetrini@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230908202723.1641469-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230908202723.1641469-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::6) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DUZPR04MB9846:EE_
X-MS-Office365-Filtering-Correlation-Id: fd68dd44-f316-4eec-52af-08dbbf285df5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H+5h+OS0WtuJAkdIzAL6f52t+E5SwDgQXRusRzTqDKLClDv0Yo3Xzd0tIoltVJUPNEUF2q0JRGN5SQ1DkDszg/Yl6BUxonQhOwdh2ISlyvvkV+TmyKDzWUCM0hR0CkfltzUVhsvTX5tX8KrlI2pd0y0BEgVj3JJqaMkQ/UVps5PMwrEE68yV26KNGMN6Bs848fnluAKuVf8egHIn0OOF8xdMuQ+E0QCMnDA7/8sUfCNEYr2UuWgOzupk0FIrUjwHghod9lzhPFlwJMsnVY4oORK+9zSI3Xd2YuWg6Y6Z+BrrUTAd6tbTpkDiA7eEZKYcQMfTwRZANQ4qCOlw3g+rZ9lnAYl4xkWIx0c6Wbj4hXV5rBvppKHxBQ2fLPGwfY0waisCD1MRu/blWS3OjspNA/CE7nanIpaGDtXJ9MH/o9eboXtVnsUIywHDhzZu3KLRQTm4EWCqUYNVV9M8RBcyAJG4OUypNBMr6ApRrPA3CqYwVnztB8iNxeLPmpXAVbg2/4EfLm9TwU/k/EHwRU/hgSin8MFiUcwbokeLFNwhHrQiV8t3ddTOAgI0D8LlBQvBIpJ6Dfrmt7qWeMyRgzZJU/VW14ErNHcFjw1z45mCspCkIH0vf4TCuuZHFGKEP0HDGYLptaV1duWBKrsq45LZEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(396003)(366004)(136003)(230922051799003)(451199024)(1800799009)(186009)(478600001)(2616005)(36756003)(26005)(6486002)(83380400001)(86362001)(31696002)(38100700002)(5660300002)(53546011)(6506007)(6512007)(66476007)(66946007)(316002)(2906002)(6916009)(7416002)(31686004)(66556008)(41300700001)(4326008)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzlEamwzTFJrMmQzS0JJeTBBM2hldUdwZjRvUUtPNXNRa3IzK0tZRnlyMk5W?=
 =?utf-8?B?Q0hGMngycUdpeGlFSVRwNnhVdGdvcUdEZWJzWTNkSUJMVUVUNmRTSDUxY2Fa?=
 =?utf-8?B?N3ZrUUc3L0ZoOWtDblhHVW8vNXV0MjhVcC9JSDlHVnh4TG1DUkowZ0tSbGND?=
 =?utf-8?B?Q0VaV3JTbE91TXVuaEZocThyWVo4MVQ3Z0Z0K0NYRVFBV3NUaXlzTUVJeU5P?=
 =?utf-8?B?enpiSzVlWEJFc3Uwa1JremtuMklYUVB1MXpqTUZGRjI3TC84Z0VUcGNkdndW?=
 =?utf-8?B?M2hSNzVFMEI0K3ZVQ3ZjRlhnMlJ2R2k2MStaK0FCMFBWY1hVWlZCbURQbUlY?=
 =?utf-8?B?OHprdDRnOXloYUt6V1Q1TFd6UlAzcy92MlFvL0tNL3g1ejBleG9OZkdGY2dF?=
 =?utf-8?B?elpDZG1EUHNmR3BpQ1o0OGp6MW42eVBhTUhOTGN1cjdzQ2lWeWk4b0R1Q2Nm?=
 =?utf-8?B?NVBnbzFqRlBFRmt2UmFXM2lBRElTL0RxZ2lTVUlLSmVwYVBiL1Jlallnbmpy?=
 =?utf-8?B?R0VBNWtiUitKOUE0anVxRnhJZ0VaR1IwWE4xQ2Jzc2M4bUZPUWpJbGxoUWZ4?=
 =?utf-8?B?Rldkb2FTNUo5SXJXWGFyNm5NL2h1NUZaZ3ZzSVZNdGxKMm8wZGtDc3pwem83?=
 =?utf-8?B?dHhjMWwyRTRkTW5JcGhFNUtKSXh3R3NlTnppalFvMXM1dVdkeWlzU2krWito?=
 =?utf-8?B?QVRMWm1CS1dydFdaek5IOVZLNGlDOGNBaktmZjVVVmY2bUxXSk5QeEQ5UEVO?=
 =?utf-8?B?SjBKcG5nSDBUbEwxV2ZsN1FjR0xsbzBuLzJJQWo3VGg1VWpIcXVrSnhVSFcz?=
 =?utf-8?B?anlZVEFHTGdUOVd5WGNOMW5velRuYkoxNEpmR3hzVjVtdlhwYk0wcFBvNmJv?=
 =?utf-8?B?R0tDdkI5SEtSZEZiTll0SmQvdlJ2a3pLaUhYV0Y0cEpXWURFRXF5N3RXQ0pS?=
 =?utf-8?B?V2VOVGhGWGRONGw3dHdzbmtYWGNCYTArdWMzci83Umh2T3FhVGUxTVhPdjU0?=
 =?utf-8?B?VmtWcDFudlNEZFFFWTZUYjFtMlNMV0Zqa1ppeTMweTVSTFJpNlRIdlZyS2VM?=
 =?utf-8?B?NUhOOXM4ZXlMd3pUOU96M3FROVdCS0dxQjVyNDQ5cUNKVUtGKzZVbFlPU3F2?=
 =?utf-8?B?STBLZzlieVpzb0NhZUxjU0RvMENaT3VnKytMdkl0eEwyN04xUlIzMUd6MWJP?=
 =?utf-8?B?RitDeityL1A2dXYzY2IycTJ6Y1Yxa0VBS1BLOGJobjAvZm1BRGpCTE5IQjVr?=
 =?utf-8?B?elRxVUdRbHI1Y0w2YU1tc1d0c3kycVdMa2Juell6TDVUVElKM0x0eEJhYzIx?=
 =?utf-8?B?QUhmRmVubEpQN0d1ZWJJenZOV1ZDaVdHMXlGd2J1anFmKy9QaVl0TlJJaUtk?=
 =?utf-8?B?Z3ZHQy80aERjbVdNNTFmaSs2UldQRFB0RmFmTS9OdFlmeW96MytMSE1qMDFS?=
 =?utf-8?B?bHNFbHJ1b0Vxd2RuSnh4M0FKUzVWTFNRY09MTi96NFFSZ0hZN3FpL0g3Zitu?=
 =?utf-8?B?VHE1TUxGQUY1OElyRzFLNndsU1BzT2k2T2xsV1VPWE5GVTVrNWtvK3Jmd0NW?=
 =?utf-8?B?a1lVMkdGcHkwbFRIMlZrdFVqbkpUQXlTQ3ZFUGxiVEhvbm1BeHVKRXZHUTdI?=
 =?utf-8?B?SmZLdzkzQlZsMXJlNVlWa2J0c1p3T05RK0pxWUNTWERYSTVWOGdaQlE5bHJu?=
 =?utf-8?B?VXZCL0tYNnVPOERvd3g3REtib0x1L3RkMmZFSWFwUXlVd3hHVnVvN3JxMllS?=
 =?utf-8?B?ckgrNVh6bGhhN2pwT1B4WE5SU2t6bVlwdXpWYzJBYk4xU1IxWHFyeHdYbU1V?=
 =?utf-8?B?cmovQ0R5K2x0dkEySFNtVVNWOERJbGMweUprRngwNG1oQVlrMmhyQVE2NGF3?=
 =?utf-8?B?T09mZG1Bazh6MVp5U05rcFBmYXhnbERRZkhZMEhCUUE3TTgrWGJpVTBJM2lL?=
 =?utf-8?B?VC9lMmZ5YmhiQWpMdDFSYjZMWDB3WDMyNGhmZzlyTlVoL2w1SlRxTHFoSEd2?=
 =?utf-8?B?b2VtNTMxaFYyaGdiMVIwSDc4OE42ek1iSG5tSXViQmx4b00rQ0RpOVlleXgr?=
 =?utf-8?B?cFNrTnpJNzRVRkRZNG1CNzZQcUhkajF0eVFTeVBrR1BrNFBhRmJvbVZwYWx0?=
 =?utf-8?Q?S4FjShPXTQ85eHFXszYiMEQVO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd68dd44-f316-4eec-52af-08dbbf285df5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 07:07:10.3658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ZPRGPCmiHO5S4FvIk/yPKx7lKnCNevQUR7Z3cZ+IM0NcDZA/G7GdaBFulZU6tJwETQihSvDU7ASgteo0LjP5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9846

On 08.09.2023 22:27, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Add 14.3, with project-wide deviations.
> 
> Also take the opportunity to clarify that parameters of function pointer
> types are expected to have names (Rule 8.2).
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

I'm not overly happy with ...

> @@ -385,6 +386,18 @@ maintainers if you want to suggest a change.
>       - A loop counter shall not have essentially floating type
>       -
>  
> +   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_03.c>`_
> +     - Required
> +     - Controlling expressions shall not be invariant
> +     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
> +       checks, and other constructs that are detected as errors by MISRA
> +       C scanners, managing the configuration of a MISRA C scanner for
> +       this rule would be unmanageable. Thus, this rule is adopted with
> +       a project-wide deviation on if, ?:, switch(sizeof(...)), and
> +       switch(offsetof(...)) statements.
> +
> +       while(0) and while(1) and alike are allowed.

... the final result, but seeing that you didn't get any ack in almost
3 weeks:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

