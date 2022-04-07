Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3391E4F8195
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 16:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300828.513229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncT6W-0000F5-Fw; Thu, 07 Apr 2022 14:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300828.513229; Thu, 07 Apr 2022 14:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncT6W-0000DB-Cg; Thu, 07 Apr 2022 14:27:20 +0000
Received: by outflank-mailman (input) for mailman id 300828;
 Thu, 07 Apr 2022 14:27:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncT6V-0000D5-Qs
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 14:27:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d456945c-b67e-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 16:27:18 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-ssyjTSQUOPS56_r4nY1vwg-1; Thu, 07 Apr 2022 16:27:16 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR04MB3257.eurprd04.prod.outlook.com (2603:10a6:7:17::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 14:27:14 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 14:27:13 +0000
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
X-Inumbo-ID: d456945c-b67e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649341638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vGzGK1vQdoVKXrrKQ2YHQsvPjrtBajn1TL0F4zIeRI4=;
	b=FRHrDQ0JrBJBto+kCdO9+YmL7hh+uIaSKYDaJn05mAv6txv71tu4qqfG+J00FTU//ERUGi
	rhxUM275Blhp+/KjPMwgTZ6rZDBecMSaQnuWIriYPuyhU9fDcH7qJ5K1084bxExIU8wgMw
	WO95Dk5UbcSuqhYSw+iiT+CwaZ15Slo=
X-MC-Unique: ssyjTSQUOPS56_r4nY1vwg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoCbh8HcwAybPnOU05Pf9dE/APzkvjuu9JFsD6NbAMDzQdd6G4lDlxgNrlbJWMLJqkObLsOZbYNQr9PHj0Z+sG0v/dpkqONz3V2kxTI1ztYPFEZc4bM+Ln/0Hf0TBoJ+ww2AgisAbgvCxyPgia7SUlHeSs65Bn3oXrHWbSmVDpWO8Abk4JS/DjdxhDeFF07E7hNFxROyHVG6gdE3Mk5D++83mPH0pPfjgoTOimCzOlgspqphaRDFBOCIUk9t5jdNUncjPHF3oWyMFofAYm3em99u8piJk41OwEu6veAtR8nDiR9XK+q5YAo31Y/AjaTCcwMnwMLKtR1AjTBpdGG4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGzGK1vQdoVKXrrKQ2YHQsvPjrtBajn1TL0F4zIeRI4=;
 b=FjAzMIRz/iITky05rIsOk1Mokk3AUxkgW4hck5yvZwhA2TpJiBhO+ReSwh2N77NfElP7fLy6Jq29NImk+HoeDm2j8nHR/lRwSRLBS9OY8MLJhbdDsJVsRbN7IS8Vu/QPQqqiIm1eC/UV/25Wbzna0KVTJ/QjH6/ydcrCtg+0pailCnP3+2WhOEv28atDimUnsn1+3ebtpWt5GZivfjMzJ556aIhgyEFH08zo5bagR2eyx1HebrP9bQ/NEEJlNJp4dt4Y7R1VbgpwV/vXnv3ajftCblyhIs8VN5/2gzuLfoc3dHd5n/UlUFYWXgIlVgWv/ikq67O8Ex1Ac17PiDr5Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4206733c-c4be-2e8d-7ea2-d145d3599e48@suse.com>
Date: Thu, 7 Apr 2022 16:27:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/cpuid: Clobber CPUID leaves 0x800000{1d..20}
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220407010121.11301-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220407010121.11301-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfe43b6d-6dda-4ba9-3fe8-08da18a2b5ab
X-MS-TrafficTypeDiagnostic: HE1PR04MB3257:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB325730CAEB23968BEEA5FA3AB3E69@HE1PR04MB3257.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZuuYswJ1RjIj4u4rJvAx2kgypXDCiWX26ivaB1tRg8ljzLGMcP9xGYnUuxmNmGOgdCSgRWwpSBg5Z6ncBT0Oo0FUqFtQAxr0zCkLwzRnpNhl3HmyqncaUcYU/IF1G1zxoTf7scjtJJo+rGTyNkOhusKdpniwu/Hu+Fr0HVF4+eLrNiXc0hKB5a3uI+eLcairIJPLBaBuMXxa72GHCE6tF3PXPR8A2/RU9R8nes3zPeu70q23xK1KaVlshE8Zlvuc0k45Ypy0plDsLPqfNBfJYHYkT9HmXRZ9Avt1qpyVFUxHw11cA6NPpEA/qp2+Wod1c593TClVXCTBDRqGvWJAbygcKgVNMWQ1WLW088JVUHE8QMRSe2NGVH5wC2VPNRkzyVQ2JBGvyFHxS3MvsCzkFNXuHgboheJ9pgNg6c0mP8U1nO+jGcwE6yd5FgnElCIxAGP/6oj7+BC/6J8p2qHoy3S+UXn65UH3PtsVEKS0URFgZI6bsFF/TiIEJqFdPicySst4DDj7jV3CmwKx0Dvehc6wrp7z+muoR1fy+cEztKWd6UpBQOxxee4AUa1J4BmeHelvqApEc/n29vVVk7u18gCF7tT6/HeBpAuV8gP7OPZsode90ogEwgONIeckVFlo2O7DyGHen+2YrO8tJ1qg2k1q90pmMCMQ1fNnMXNz1lz6TkL3n1B0RIwArUABGKWgX0bR0nI2qiyqOV95Qy8wEGX5+ub80Rjr90lfzPlipmyYJmOGs9NBZQ6d+mfiBrxxwm2GZyF2wdW+LwyWMTbnvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(36756003)(508600001)(186003)(54906003)(2616005)(5660300002)(26005)(8936002)(6486002)(31686004)(2906002)(66946007)(66476007)(66556008)(4326008)(8676002)(38100700002)(6506007)(316002)(6512007)(53546011)(86362001)(31696002)(83380400001)(101420200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0lORUhSdVI4eXJub3R4eEQ5U1NZcjJaaXprZHZwYkNvVkRsU0xMUU5zVjdJ?=
 =?utf-8?B?SVpiSFJ6bG1KWFB3Q3Z4Y2UrWlh2a2JHSnFnd2VEanhPNThwZ1VRQ3JZY3NM?=
 =?utf-8?B?bzJxdUVYRGdraUtwU3FUWUpwOHByOG9sbnVPSExCVXB0ZVZabUxleEpYcmlG?=
 =?utf-8?B?dDhGZHc3RlBrK2ZPMTJYVVpmTldrN256NTh4Zy81eWRlRExidHZIY0F2QTFa?=
 =?utf-8?B?TDBxSEpyVFJqekp4cDVrVk05VlV5akx6TkpSTldMUWEva1FIaUNwVWZ4UlZJ?=
 =?utf-8?B?eksydDdzNUt6Tm5GNGg3MUxrRkZxTjRhb0NLNXdPT2t3Zkcza1haQUZJT01v?=
 =?utf-8?B?WmhjdnZ6L0xCRytCSEc3UmFuUDdRdkx1Zk8yY1daKzdlWkFXSFRXRzBCeVM4?=
 =?utf-8?B?bzZackVmZ3NnREpVdklvYjdZdndkOFBmMWhpVDFkRTJOOWdzNWxVNE13LzJL?=
 =?utf-8?B?eDEyTENEaU9TZGFEK1JWZ3UxSGwzUC9rZUNjZ1FOQURFVCtOTGFSdC9iQ1pK?=
 =?utf-8?B?aGtKWDN4eXZJQjAvdko0VjNFbVA4aGdROXFNa1poTUtLOE8rbFp2Q2M3SnNM?=
 =?utf-8?B?NTZZVTRKYWhSTjdlYThlaHZ4Mk5JVnNnT3hoTzlwaXRhTTRMOXV6MHMwMlVh?=
 =?utf-8?B?b3dqbVdDbmRuT0Rwd1dsK2RvRGw1MGxNaytlNUloQ3llYlp0RTJpTFhwTjJh?=
 =?utf-8?B?Zjlyam5aU0hNeUVQN0RRR1NxRFM5QTQ4YUFzbUk0YUx6M01QNkp1eUs5TXVa?=
 =?utf-8?B?bW03clloWk9LYXg0L01QaVg4NWlsaFVNMm5oaGdIa1pneFVXdlNhSFY1V2Rz?=
 =?utf-8?B?TUJJSjJIZXdNU2NSUm54WnlHdndsdU1hVDdJQUI5cnpTbDZiVFlVWm9Pd2Rq?=
 =?utf-8?B?NnNROVR1Tzd3Q2dPNWFzMzE3eGNMUzk0cnFNZW9JQXRrZUpLWmZpbEQxWXhk?=
 =?utf-8?B?VGZBNDBSemhhU0pON1ZYNm1tTktlUGo1ck1WQVZ0c2daNTRXMG1vZ0lvVnBr?=
 =?utf-8?B?UTQyT01WYlY5ZzdObitzdTYrUFRIQlBjdGU3bWIxT0pkNFlkNUpFYmxkSno0?=
 =?utf-8?B?VEZrNHJuRUMzUVplRXg2clEydGEydndDKzZaRzkwdVI0Z3BqOExhdmNuTWZj?=
 =?utf-8?B?M0Y0VEczMmdWQ1VMd1hSWktxS3FDdlM3T3dJWUVDQllaQ1RQM3Q1OHBtaWJN?=
 =?utf-8?B?NTh0U0ZFa0UvYmxObVBOYVNqNjJta0p1bjAxaTNjMGxVZEthNmhXUGZjeE1k?=
 =?utf-8?B?WHhQQWRYOExtWDA2a1Z5dkRzRExvTkFGUnU4b2NBVm1CV0k5MHR2UWNKNVNQ?=
 =?utf-8?B?cUx3b3ZUK0NacFkxZTNiYnpRTGlaNzVCTTZ6Vm9ic3dLcHU0aS9DZEhKM1Zx?=
 =?utf-8?B?V2lDWldOLzlvRlg4d1EzOTFsdlFkeW9URWEwWG15TCtMWnpxOEkzSEJIZS91?=
 =?utf-8?B?bzdOWjF3YzZKb0Y0ZzJjZzJEaE42cEE4MzhSTUx0amhCQTdhbDBsQ3RzQ2cv?=
 =?utf-8?B?MllTZGRTMUhPbkwwbWhOWmlHTzZHSnZCRWxGd0FMbG1WSUlqREpTcUlSMGQr?=
 =?utf-8?B?dEdvTGgvME1pdE0ydFZZbkp2Z2VGNGFuVjY4Nm9rek8xcExTQmNZRTJ6K1Er?=
 =?utf-8?B?b0I1U2FVd2QzVFB6bDkzeUxudlNIaFV0K01kWVVoOE1xWWp4OVBKcnhMd3Yz?=
 =?utf-8?B?VzlsQmN0MkM1SWR4akV0dk4xYnBHVVI2MUhBZXF5S3pscXE2QkhEbjIvenpY?=
 =?utf-8?B?eUlDZ0JGdFhQWVh4VE9HYWVwTmRkdVpleitwYXV1YVlZc3RLd1JFSHNlZGhl?=
 =?utf-8?B?QXd6cmdWSVNGUHlMN0RBS0pLK1NENWpwQk55b2gxL0krbHhvWDdDckF3NFE4?=
 =?utf-8?B?d21HR2p0cXVJVkY5cFJwM2tRSFdkMDQ1ei9XdldocVEwR1gyT2hrVlczQkUr?=
 =?utf-8?B?dmZCR3haRzdZOXFPYTFzckJROW4zbXNEdnIzZ2w3d04xUG9aQm1OVnd2R2xN?=
 =?utf-8?B?YzZVNTBJVk9IZlNJc2dNUElxenZCSU1BN245VnlPWTY0ekJKaFJKWmxIcGFJ?=
 =?utf-8?B?a09QbGRSY2lLNnRTRjlWNTJ2UERQSVYwRUtpWEoxb1ljRU54d0lZRW1yci9U?=
 =?utf-8?B?RmhHMmdudS9OZGhRblNxQkdJd3E4cUpmVExmV0lWVjZVQUtGZmNKWW51L2F3?=
 =?utf-8?B?RWsxRlpKTHhtRi9PTjFPa0psTE9ZSS8remllTmhpYWIraTRUUUNUUG1oejhE?=
 =?utf-8?B?WjNlUnYvM1BFUGhIRWVrVkRiYm94RUhhUHBJVFpGVGdrZXIyd1BzQjQ1empQ?=
 =?utf-8?B?RlJTamNSWEtyN1pBRE1RbCtPUml1UVhoam9iVjlrQ0U4VTZ4YzVCQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe43b6d-6dda-4ba9-3fe8-08da18a2b5ab
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 14:27:13.9575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVoedzCHKX+il81t+FUOkOzykbpG7nh9UDVOzfez7iRy9W9GtQeTpiQTQ/eOJJox46drrZfF8ytq1DL4SEariw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3257

On 07.04.2022 03:01, Andrew Cooper wrote:
> c/s 1a914256dca5 increased the AMD max leaf from 0x8000001c to 0x80000021, but
> did not adjust anything in the calculate_*_policy() chain.  As a result, on
> hardware supporting these leaves, we read the real hardware values into the
> raw policy, then copy into host, and all the way into the PV/HVM default
> policies.
> 
> All 4 of these leaves have enable bits (first two by TopoExt, next by SEV,
> next by PQOS), so any software following the rules is fine and will leave them
> alone.  However, leaf 0x8000001d takes a subleaf input and at least two
> userspace utilities have been observed to loop indefinitely under Xen (clearly
> waiting for eax to report "no more cache levels").
> 
> Such userspace is buggy, but Xen's behaviour isn't great either.

Just another remark, since I stumbled across this again while preparing
the backports: I'm not convinced such user space is to be called buggy.
Generic CPUID dumping tools won't normally look for particular features.
Their knowledge is usually limited to knowing where sub-leaves exist and
how to determine how many of them there are. Anything beyond that would
make a supposedly simple tool complicated.

Jan


