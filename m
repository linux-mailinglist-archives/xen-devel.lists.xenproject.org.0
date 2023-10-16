Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5797CAB61
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617658.960468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOX0-0003Va-Nm; Mon, 16 Oct 2023 14:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617658.960468; Mon, 16 Oct 2023 14:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOX0-0003Su-KP; Mon, 16 Oct 2023 14:25:18 +0000
Received: by outflank-mailman (input) for mailman id 617658;
 Mon, 16 Oct 2023 14:25:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsOWz-0003Is-4m
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:25:17 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d39a5854-6c2f-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 16:25:16 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9922.eurprd04.prod.outlook.com (2603:10a6:20b:67c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 14:25:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 14:25:14 +0000
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
X-Inumbo-ID: d39a5854-6c2f-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYDE9qe5VzT2zI0uUS0x33S5PcI/GSAfO+J1QSTtou9zLVJS37mxJVxs7jOeFQm6T5xVJpkjfmkMoAnvOQLGenFZodnc05kt2H5oWMZawRujhlgEcSeK5DFHgcfQn5tX9FYuXvENaCEIKN2X1Jen0qyHGa4S9CATMRjucYZkbzW9j3PY9t3C/rkkMrK1nj/Gxj9f6iKBkLi0lUrzSDtBLPsWyPm8DijUk1CgPI5MXAC/xpKynRv9OZk0IwYZkX4+fk7iIAQsJfBQG8e5qj0TncwKewXYCF+A2hw8uaXj3wKl94VMiqiX0aEPdBl7WD/+/LksPzm5PYLfAdtQMjwYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8a+rp6rS5hERbpA11vmd4FLXufR8wnF7R567w+cUtPI=;
 b=Z5mSfc97J04rEQdSAnsV8NqOaqV0JswBB/AS9E1ZMHGkegvoDaDLz3nG7A50VsDofaPIwpE+hIT/ya2SS0TuR4JNKUS3g7VgmnZ8rOUfwUWhEAO+8XWqwCSJUg2rx5+oRPz6AOX0SrA4FswvOMSftF6p9GxF3nHpp8/dTbNTXlgm72oVYkP8/8o1GcNhx6vFQJpxRJ5+HV/MQGFenrLoc45r8AA/yTyrWh7/qrLKUcDbD2lbkXbVg6qkrSVUxabh+/BiDLtw4iQJYjPySqVlKjUxVVcZWkFRZq5AUvAMzjol2qrkqRWQsHfJDkscwO1JnT2j8YbSXOJBnvVMBRvbJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8a+rp6rS5hERbpA11vmd4FLXufR8wnF7R567w+cUtPI=;
 b=Djh9NxAlu86wnfbEV/TcqcrIk8nqJHunFSVFRoRbJ5FGGbiB1OrnOxgqS/dHbBsZSN7b5BDI+J/3/ABMwjxhho3cvPvUtIGdzfAyTgQcG/diaWQLvymTylzx3NyBdqzSQhdeURG+WAbezqUSXbxidbiKYHaLzYdCxzHReB8BhJoTBMSgD20Gf3+y94y5uyJCInlxyvoItku70Qr1tRpRyGLrBbmYkqNMaE35jZc/Nd1hYZldx3WLyKIyrbd7uRKvb5JAED1/6BKG4JjOsgx449272dNptE938i9vVmLIc0CM4hzR0UgmBbFuAgjQirNzLXRru1CoEEkSC+Bvrjzccw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a05f547-1592-070d-bf1f-2d51c0b57971@suse.com>
Date: Mon, 16 Oct 2023 16:25:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.19] x86/cpu-policy: Adjust
 CPUID_MAX_SERIALISED_LEAVES to placate MISRA
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231010095748.1205365-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231010095748.1205365-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9922:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6d0242-432a-4e1b-13ef-08dbce53b681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jkhuZobRa8VfrG7GAC1Dd0+zBzVU62DCMfEsHXMtpHh9ENm1SM9WAw4nSuTxboPKSY2sI/kDZxX6X6rKHBgFJYnccTONnLZbAUWgL+EYkk9NpmnvhWeuACYplOYzNaxlHpYsK+22RP0B8vuF4XyK2QXaOX5wzVWOLWtzmxkH9LMTWBcrRLjJEDUuFXJ2KMDfhVLvFpbgHq530Rg9XmmYYworMqpJrQ2eZQZ0v9AduIaW8bVqXgIkQYaiaYhmkVvUBE4z32TaJHbA7d5Q0rg5hlXzCu4HDBmqHLFJltlLXJtT3CoOD4rggz64CzRJKfTDsH6GKTuxSgSNOcPFR9srvUJLD0w+O7vweldtytWcadwssoWvwV3LWfPA7SaVsKZQRmmomYwiH02zPZ33nBH4hjaRVSx6cOZf9sfHpO1yzB4KWWjlu0QHKHdY04JBSrFwzqzbgt9rCw6ZBXSOzOXbn7WDyU5hv77SYqFGADtzJRsGZSOs18jHAac8+arL49mtoHChlr2HrMgX23SmtduYADjXB2ZSCORva6fsFcoqeQhNweRILyiqSg8zjMEOOfQ/TBayX9czCuNEXSbSbAm40T+S+pVBshYLKccCWNyIiZK/spH2foHEb4U7mOnJGD/p5qzjrggTefoQaV1qdnIdNapRknFyPChaOJf0uw0+dkLB4zem+/lDQRlaMmuHQ+Af
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(41300700001)(6486002)(478600001)(66476007)(66556008)(66946007)(54906003)(6916009)(6506007)(26005)(53546011)(316002)(6512007)(2616005)(8936002)(4326008)(8676002)(4744005)(2906002)(5660300002)(36756003)(86362001)(31696002)(83380400001)(38100700002)(31686004)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZndaaGdNL0RlSGZJeVNFZEl4L202dDNiV05pdU1XVERxQVAwTHhWRzc5TjR1?=
 =?utf-8?B?a1FCTTltTzIrRVFmamdLWVZtSmNka1JxcC9WUTZCU3dHT004RUY1NWFCdGta?=
 =?utf-8?B?YWdaOEtMRVJXUzVPdElpZEJ4OHRYYW1CdHIwZW50NVF3T3JQTWRBWjg4RnlK?=
 =?utf-8?B?bTlSTS9sazJ6R2tWZU9YaWZNazhqWGtySnNaaE1rcDNYZDdFT3doSUpwSmdp?=
 =?utf-8?B?VzN2aVFEQjQwYXRFdERaY2g0L0hkRlQ0TGFJTk1UVzBHVTlRbHdzNEZ5akhq?=
 =?utf-8?B?RU5vblZqYlFzMDZDMmY1aFFFZ2JJanl1NVZ4aHNFcFBsclhsbW4xbGJRcG9I?=
 =?utf-8?B?dmhSMnJmVWs2RmNWaXIyTS9KdnJuYmVuajhxT2NleTd2WUQwR2ZzWDdkblZM?=
 =?utf-8?B?RUlwc2VwdlJiR0Q4NGVTeUQvTzNSdmpJbCtuUnl3eDByQUpEeDJ6b1Vya2dl?=
 =?utf-8?B?SFhjZ0F1RmdNbStlSmIzbmZrV2E1MkplcEtiTnpVSzZBQmVkKzhmYlZKUTFX?=
 =?utf-8?B?VVRMd3FLOVNvNmdrM29XeFlRTlNzMVQzM2k5L2pVcVRWdWpEZ1NIbGJpV2lI?=
 =?utf-8?B?clp3MFJ6blFyb3hBWEllY280cWtJUGxFV0dieGJCL2Q4MWhzeUc2ZVFzcUdx?=
 =?utf-8?B?ZEtLRVgrSEZrdkZmVE5LOXhNZlhXSkxZQUY1MkNwaDVaTHEwa3NSdmJBK2Yv?=
 =?utf-8?B?MFV1dU5GVFNkaFlQQXVOYzBRdCtoODMxK2xPRXZ6WlNGN0lJZ3YzY0tGYkFy?=
 =?utf-8?B?R2xVdXpzcWhZN1BWZmtua0MwQzBLRGh3UzFaanFiS3JMcnlybnJFN0VpVktJ?=
 =?utf-8?B?QVBZTkhJM0p6d2FXaVhTOWJ1NTRGcEJCdXFUMTJUeFFPempDM0VrQWJPNjVL?=
 =?utf-8?B?U0pMM2tDT2F2NURYT1MrZkNqczhkcHFzNXF1bWdOSEFlanRtVDM5MWVKQTVR?=
 =?utf-8?B?VTFJak9wWEFYTkxOOWJuY0JNRE1DUm5JUXJZTWhiZlZzZ1VIWHllNFRuSVdZ?=
 =?utf-8?B?cDhhbkMwa1lFcHFYSnF1dkFEc3ZLNUpxRUFJS3llYmZyZ29CWFhvNjlpemJC?=
 =?utf-8?B?SUhyRGlFQjhVQTNmVDZtbGY1NkQwd2FkbXE4ajNKTUYwZ3grUTAvbnFRam5N?=
 =?utf-8?B?N2hnOVNqeXFHVU1BVWN6c25WTVVsb0tTa29YNG1Ra0MrN0RBV0lTS0t6M3hh?=
 =?utf-8?B?VjF6MEVrdDlGbDU2WGZYU0lBUEhVVWFXSUk5U2pQYkZBYWF1VmFmNXZ6ang5?=
 =?utf-8?B?YWYwaERoVGJ1UlhMeHU1a2NVVFRUTDlLVThLVFA1YTEwV1ZPSE5Wck00bHlQ?=
 =?utf-8?B?RGV6QmVBNitKL25UN3Mrais3Q1lWclB2dFk3REtabms2WDBsZEJTYUlRcm9w?=
 =?utf-8?B?cHNKbHlWVEFKS0NWM2xtOXVoSE1WMm9pbWU1MjBQcDRUc3N1bHU0UTRSOU5t?=
 =?utf-8?B?TlVJL1pKR1JaaVZ5VzhNUTc1cDhlTVhMT3FWaVFnNUdpa0JHNGdiUHdHNnk3?=
 =?utf-8?B?Y3ZXaDFLeitvMVdtVlFldmE4Uy9td2dvSC9OQmNTK2ttanZvQXllbmNYZUlw?=
 =?utf-8?B?Wmp0OVZvSEtuZ0pwbzVhRVJpKzFRYUNlZ3pScjdicnQ5Nld2bkxrbXgzb1U0?=
 =?utf-8?B?QVlFdUF4aWEzbndHQ2JyS3ltYWFzQWE5UHI4cCtxWXFNMTdnVk1Lb3V0Ny91?=
 =?utf-8?B?NE9NaHR1bGZoOFg2R3h0dWozMkt3dGI1U2htK1NoQUhQVm1HVit3V0lLVTlP?=
 =?utf-8?B?a1U0aGM1ZzNSQUh1VHk4UTJKcDZ0N1U4WXJZdDRjRDdNczBxRDJINDNRelM5?=
 =?utf-8?B?UEZlTEpVdkVnWVJLWE1qNG15cjFqS2hLNFB4ekVzTzRwMHprT25YQU5QVEFF?=
 =?utf-8?B?RE1ocnR1OEoweHNXRFdyc2U3YmVwS3NiUTQ0Q3hpUGhidDhUYkR4eDc2Uyth?=
 =?utf-8?B?ZWpFK3RvRjZSUmR3NGRMVGhwZ3FPRmk0ZnNkMWdWOEJKRTNtUi9UaThvcndy?=
 =?utf-8?B?RG5mUjdGcHRKTnIzeExoZndWWk4vajRvcFBJVHU5ZVhjUXlRRi9hbEhUTUhC?=
 =?utf-8?B?V0E3S29hbkttNzhJWERlc1NxbkJnU0hKcCtwODB4bGozcWJjSU1aRDU2YjJX?=
 =?utf-8?Q?OgEUMJTlsTwVCu1Mmj3H1SWd4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6d0242-432a-4e1b-13ef-08dbce53b681
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:25:14.3926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFpLxRhXboJTj3FN2GHyQQzqU6uC6kcVJf0I/Lg99JvUbZINJq3xYk+MRpWgKIWJIgP4tIMpYh2ieZElEA6kDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9922

On 10.10.2023 11:57, Andrew Cooper wrote:
> MISRA doesn't like !!CONST being used in place of a 1 (Rule 10.1).  Update the
> expression to just be a plain 1, which still matches the description.
> 
> No functional change.
> 
> Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



