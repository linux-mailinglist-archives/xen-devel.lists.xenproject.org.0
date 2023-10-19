Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41DF7CF477
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 11:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619068.963630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPhY-0001EA-0F; Thu, 19 Oct 2023 09:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619068.963630; Thu, 19 Oct 2023 09:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPhX-0001C6-Tu; Thu, 19 Oct 2023 09:52:23 +0000
Received: by outflank-mailman (input) for mailman id 619068;
 Thu, 19 Oct 2023 09:52:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtPhW-0001C0-9v
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 09:52:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31b14af4-6e65-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 11:52:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9907.eurprd04.prod.outlook.com (2603:10a6:800:1d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Thu, 19 Oct
 2023 09:51:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 09:51:49 +0000
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
X-Inumbo-ID: 31b14af4-6e65-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmTwxne3QFhmd4qrAwbNzyxMdQ1XVg0vC/1TaoV1HhfqYRTeihdS93gVTHXHPf1FWkmuh9l/P8zr9UE7IlL8QqlPncVqGah6QDo/huwBkrzYo9pp5TZlGZOY0P0BCxaqe1gnvePBfFk60s4yQIjosdSFhnnpmNbOVOo5SYYF1naweAdnoRMC5tTQ8Hw4+FDDyLksWwLq2GnEdsjmvLDzIm05qv0cQZLdLD1VJ5EG1wvyDWrMIrPCg5ZzDWGM6z2PdvZ4RiQ+CU1cws0r3r8QltcKXnq1KU8O9XF1USSw6rHtrQkqghFF2VUiHaPHp4I7A5wk4erXLTQ1n4natNP5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4ucjr77fwf0ioLdOk+gBV/jF4CgTK6atl/mLF9b6JE=;
 b=J6yOOsTg4OaweuFdkA+T4eoUzUjAUL2fsaNlPb/IkV+IFj2xqFN8Lb1pr5Chx/cZ9x+0pxm24FnV7pkULzswfPfZ8X8Hf6ODhyxmP9aq2U++nuYkMM94QhSY28mxptyiBUTELaptFHObZnXKDbBgKEWvWhLr84vyWO7cDrwVAd4rMknOrYky3zNIT4QV38rn1QEBYwTT0xBYmUAdYqztNSs7U/nj5G+LpuBccNltyEKBboNCz5mkviJ/Sbtv1gGyN+wgqg6i2KWyxFU88JM30s3ig76v267w76XtKOypMdFuq4GpRYaR3xJqYnpMA9gf+VFVUMeGnpy+m00LuLGEUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4ucjr77fwf0ioLdOk+gBV/jF4CgTK6atl/mLF9b6JE=;
 b=mMmGb4TkCc7lKgFMlKjvAtzxXAJfV0UzCOCCTcx/SkvazPoR0dS+br0wSMo8JjpKuDLImM/A7uoFe+AwIF02RCVxvPs9popC96pgOyr0Ok0DzUOjDJjjgkxFFfDu15+Kg+AiArsibVin4afrqb+ZxmLvihFI3XjMDkMrvuiBS8CHzS50FSlZoV+Od9d/Cf8B/Rh3FKiqNsGf0EpcTwNM1fHfYHrw91p9dSAbsMN0zsuv1iTBbAaoYe6yu8LjQdqeVZFXU1epXYIwZUukf2wH2rqNabxeLM4c/2naCrDFFO6SPthyBXJBCRQwq10TF3VIsI1rglOKjnKL8ppG88D72A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3cff4f87-0da3-1e46-4b86-c43c02dde064@suse.com>
Date: Thu, 19 Oct 2023 11:51:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 11/29] xen/asm-generic: introduce stub header
 mem_access.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <79ed96f65e7c7f4036cf62ba6b5b44a371c758ee.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <79ed96f65e7c7f4036cf62ba6b5b44a371c758ee.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9907:EE_
X-MS-Office365-Filtering-Correlation-Id: 566f5c9f-2a74-415b-9213-08dbd08903aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PcGBYaiffC5ThNexaSl4syLyGcBQilCgDZHAsoEb+Q6klSOSeWe6G1gtytLitf6olmbHiI04haqLnnQ13yvGl73QM1N1IKp8SRvCSZztghRm2nFJf4UNkgQ4uUtQJTlgXxBHXJuSm6fSH9gA5g7vubqbtUXA/3EkEfTHhJTkRIKYXaB4QKGLpHumZx5Acv9WktrrWfsyiaR8VDxLb7QcpAFwSdx0O5/Lq2jWxTYJPsRJEdT8x5XCoZURDhdOV6Xok6CBDbyWLQTdCBC6DAP0actNs5ekhvfYNVXvolMCM0YULXLgctZzBxAJqT0t7Mu/hTqdaVY0hft/A3C/XVPEpIR1z8Ss4OgAItt2dA6KxaY8fvDatkPEHEJqAaNnmb4p8fcVbuSzYKnqitG/3Rce+LpnLHU3npEt5u774UheWwBuOzPEBkRggu2vpCXpEnfIrc1Xi62Yu0wcQvp+EfDs4bZNBheGhzH+J5O/22mrfTJ4ulW85fWKsyYChNeOgwHSlBme/Md0N2lXK1aLaJxznoQn4RTXx4mDtrxltBkvRuPWkgGWdZynnfdx2qQJTzhODWJ1webxIZL/YS+SVKDRTOqL3cJk1SS7yET1QR6hNSDC6hKknRCEJ9JRwoY5XvgKD8ISJJeE+iovjW1ot7Mot+0Vr7ISSmbQDV7WFiXYkSc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(31686004)(4744005)(4326008)(8676002)(8936002)(83380400001)(36756003)(26005)(6512007)(2616005)(6666004)(6506007)(53546011)(5660300002)(31696002)(2906002)(86362001)(66946007)(41300700001)(6916009)(478600001)(38100700002)(66476007)(66556008)(6486002)(54906003)(316002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0p1M1JsMzhsSzcyeHp3SEpxbis1cWNGNWtPU3J2aFd4cEFRS2lISldabm1B?=
 =?utf-8?B?MFR4WVRuQyt0R3FNMVRnb2tOaEJ5bW0xbUpRTmN1eUlaejVmQzBLckJHK09T?=
 =?utf-8?B?QXNaV1k2dEtBbUxMRHYyQkdCNHNMWlpZSllWb2RZWVpjWHZveTlVN1hLWTQ0?=
 =?utf-8?B?LzI2aTV2REQxZVhmL1BnUkRDRlFBVzFIYURnU0hXbFdrRU9CbWkzaHhkdVRG?=
 =?utf-8?B?a0w1SHZSWForUmtTVTBHajErS0tTUy9HS1ppVFprclRlQnJ1WTRuNjhzeTBy?=
 =?utf-8?B?TDFRWHpHdWtYNzBtc2Y3UGxGdVJxUXF0dkFHaWJRSUVoYXJ2Y3NvZnF0OFVj?=
 =?utf-8?B?ZUhQM2ZYamtaRTNnZzlqelUra1lZZEVvWnJyVEJrVFRHRXpIMzJmSXpRS3Rk?=
 =?utf-8?B?TGtSeDl2aWZQcUtOVXZqYkUvQTlCOHl2QWtpQ2piRmczczkxbElYRXZhWGlH?=
 =?utf-8?B?MVZUZk9yOTYrL0Y1UzJNNDB3SE51MGgyRGIzOWpLUnQvMkFWWWEyQUdDWTZC?=
 =?utf-8?B?K0hqRkoyWHZTdDhaZVBkTkVsM2doSVcwTHkvWExHNjBCN0hoZElqblA5eC9p?=
 =?utf-8?B?YThJc0UyS0VOb3k1dlk3TUpwNTc4M0xXYTBpQ2JadzFya2F4UlBYUDE2Vmp4?=
 =?utf-8?B?YjlSREkzTmNxRTcvYmt4M2NWN0FZS0RmZHVDbHNjZVJvZk9lTUhHUWFxSUhI?=
 =?utf-8?B?WGtVWHVZeGlZT3JwUlM3MklLL3czZ3JTRnJGSTh2SlVaMGhWZDhWVzFvcjRI?=
 =?utf-8?B?N3lCN1FoNlpya0ZJbWNNd2p6bVdlZ1pJQnY1VCtIOWl6ekxBVUkxcXpML3R1?=
 =?utf-8?B?YTZSVlljbXYxTzNhU3Via1dMMTBCWTgwamU2TDZ1TVNEY3VQTGpkZ3h2RkRq?=
 =?utf-8?B?VGQ0ZFh6VTdZN3V6R3JPRGtDclY1NUhpNVFiYkJQZWs1M0hYYk9ibVUzbjNs?=
 =?utf-8?B?TzYzdUFCZUNianpMUlNucDlpZTFqRCtsZmhCQ09KZWtqNjROdlR2bEVTa1Za?=
 =?utf-8?B?eWhBN0dCNkVDM21vMGZWeXVmT0VFZEF6YTRrMmhicmp6RFQyU3VESFdEN0tk?=
 =?utf-8?B?VWlzdldEcWlTZ1l6RHBsTUJpQjdFRjVjUGcybmp1RmhlYVVwL1A0Smd2aW5G?=
 =?utf-8?B?aEhzS1VOTzdiQWRwZy9jNkluN0dDUWluVW1PNUdqdGJuT1NLZGNIY1dSRENU?=
 =?utf-8?B?NCtFRkhoU3NsdlgzNW43MGx4ek5ueTNpR2lmNEFuelIxcDQxSno0Wjl0WlJT?=
 =?utf-8?B?L3pCR2RVWUlqRTlKcVl5eE4wRG1kK2hjekNhMFo1cExuaWU3WG94T1gyVHE3?=
 =?utf-8?B?aXBFeHdXZ0UzSmNqSG4vYWpFOEZrUmx6YUxVMWVlMXpsVXlYOHdUdm81Nlhi?=
 =?utf-8?B?OERGMXVDdTdNdHl6SFVoMGNkOU5FQ0RlaXdZOVVwY3dNeTZRNVQwcFFUWVZo?=
 =?utf-8?B?UUVka0ljekNTbExxNXd1MklhTkVoWjZuM1ltMlF1YjBxYWlrS0twTGk0Tnlj?=
 =?utf-8?B?akdQSXRqWitzZE1oRFMvQ2ZqK29xUVhIZXo0SnFTKzUzbTh2c20xamY3Qmlz?=
 =?utf-8?B?QmZhY1lNUWQ4VFZFMzdKN2RxYzVzRXROYzVPWHV6b0JYNk9tOFhyN2JYQytJ?=
 =?utf-8?B?eU9aUVdKL0ttanlndnhXVjVBZHRmVktyUy9TZGo2dnpFZ3lLc2htbTBaeDlP?=
 =?utf-8?B?MDBla3k5aDViVm9vMlRqS2JxQmVTTHdqVFpIaWZxZmVqbDBhem9IM2t4ZWF4?=
 =?utf-8?B?bFhNM24xbmIrODU0UWlRY3ExN3d4Z1lSakhEUkRwSms5SERvUWxieDlLeS9a?=
 =?utf-8?B?bmZkQW0rV0hVbjdhWjhoZnlnUDNLVWhKZ1RkRERQdnZJVXl0NG1PTUYvRUtz?=
 =?utf-8?B?S3NsbnZHSVVCWkVKbHNQTDBTT0JyVDBDM0xjVjQramZlb0ticGVXRGlKM09x?=
 =?utf-8?B?Vm9zak14VnZWY0g4SUM4Zm9VUkR3dkVwdVRyVlFiam5QeE16TVRJc0cvQzBN?=
 =?utf-8?B?SWpKUDVrNEd2QTM2MlROYUdZN3lCMVBGWGF6RDZncjgxVGhHd01CM3Q0dnp4?=
 =?utf-8?B?RytkRlRXUFFWU3FJdmprUGg0Q3FETUQwc2M1RmtHMXJmWitHTmVLTVJnZmhv?=
 =?utf-8?Q?vEdX9jdHXaZosmL13iQ6yTu5S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566f5c9f-2a74-415b-9213-08dbd08903aa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:51:49.5195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEwDmuWRfUvTjiy5lUxk4vu3wKfUyqIpXIrhEJ2E4NoR931RKrzgwEzmmOzuRAH0SZ44jdWGpAqm9Qasvhi9qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9907

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/mem_access.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_MEM_ACCESS
> +#define __ASM_GENERIC_MEM_ACCESS
> +
> +#endif

Does xen/mem_access.h actually need to include asm/mem_access.h when
!CONFIG_MEM_ACCESS? Without that, I don't think this header is needed.

Jan


