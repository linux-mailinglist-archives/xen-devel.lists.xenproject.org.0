Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AAD7CAE02
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617832.960877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPmz-0001hG-3k; Mon, 16 Oct 2023 15:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617832.960877; Mon, 16 Oct 2023 15:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPmz-0001ei-0U; Mon, 16 Oct 2023 15:45:53 +0000
Received: by outflank-mailman (input) for mailman id 617832;
 Mon, 16 Oct 2023 15:45:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsPmx-0001ec-IO
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:45:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14f71e8b-6c3b-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 17:45:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7822.eurprd04.prod.outlook.com (2603:10a6:102:b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:45:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:45:21 +0000
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
X-Inumbo-ID: 14f71e8b-6c3b-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvOppz9UAZkB5KEatf9xNpsGhmegQsDFunLfnaRJHw7fjR2oLcv/V2MH5veeRtjpKdQjhsDZShOlkN6P7jWgDJDLsDw7eTJ413qRdtqZrhJA53WAFKJfKMqS+Xd05AjCF+DPy+xdbnr1dpQcueNgpTUFUg2sP6mVs9Ymc55W3filuM3wlKCfO5D+X3B2A/C4lAZ4O6UFKSx7+/zrSG1dUtfZ5T+cqxWHj6J1B1FHmh3WyHVXtdzmd22QPfzHSaoG18pz0M2kuxsd+ojTIQL8zvmL0ZiANb6x76hzLBXWN6oR2ZaHKIvDtTanjaJGqc4KQnEPoH+9I10wqgHT9Svs0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MtG5WG8C8z5WHNmPe3GjTvrXlY7bDtxauhg/a5/8hE=;
 b=elf04errhjTyTWH/s0xTsAMCbHZMxGx/pisZZUQLA8duffSeP0jEcfBj3EZkRm2u9dPgDh+rNSYtZ8R21VIv3CqnvAdhlYr+SCHaU7TSEROtdXtR6EBK7EoT05lx2Tw5zHF77h+ZtCQLA64l+7FYPTnwJeqHE/iLpSxaRVKr+ZYsM0qmXsSnE4L0UO3zN5N92FCiF+Beus1MgPVNPM6uu7riqJNtmycTUs5dOSDRNe8BLvzv4uGBjrp6XOwt/ebkepvbaHbw1VzZ1l99AUka85GczZC9fUQ7jnBZjpX0fd5KnRlln7afxVD4iKjs799H+Y3pQcW47ukl3c3uAlcB0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MtG5WG8C8z5WHNmPe3GjTvrXlY7bDtxauhg/a5/8hE=;
 b=ZDCGTqPt37DCDf4eXITXxDGsNx6639lJXBpHFrlTqhptqyyczy6V3fmH3m6uueVlBmrnLuVKx+oNPNa9PfVG/6mzoOa6NgD97y87u9B8NknL5wPLtF7V/dyXpiB6ANTU5YdWl0awODJQZNQNjPxSc5MK3SLckgV8HrRSA2lH0Qgc1HzME4eBgnuR+wsjMOzEUl2YzWChPKcCgLrsFnWM98cAnoYoa9dpd5KZFvbUyhrwO3mJ+0m5lXl0GNBoKu/Q378F1f4Vgdrl/FNY7j5m7s2IrV1Mqpn90uXhr0rY/PqiLA50imAvDxLGNoc+VUzttO8LNalepwgJWi3x7ovqeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1f0fc3c-0eb2-81d6-132c-d6b2ed2d7308@suse.com>
Date: Mon, 16 Oct 2023 17:45:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-next v2 6/8] x86/mce: Move MC_NCLASSES into the
 enum mctelem_class
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <6622a2ec7079f86b73ae420e1e840d3d35ffb3a0.1697123806.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6622a2ec7079f86b73ae420e1e840d3d35ffb3a0.1697123806.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b5ae39-5c60-4b4f-ffc8-08dbce5ee7c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dV+hJZ+H/08zNDj2ZuTsXeOz6VAw6mTAP2gBpLPq3Qi6MLhXFeyLhdFIkc7NM5fYkbt6L7LJDjkAK2TMMjfiYBUcV1ThpoUP2oFeTy2Y0TSuLpK5endAphkeUkZOCghtUsTnxt+uFYiUcTNs//hUcp5UbZS8+D5T9yDAv5dIu1Pt8wwfmdNzAtkkY9vR4I9LeCel7tp8l/WRQfTIBw7VqnXvYnLd42mmlWeimbQQW2L5tUAjwoI7rlq36qrFpIkCquJyU46wyDpRJkidar+TPORydcJ8woKHWkNvSN/zKVaFgI8ykI33DXuX7/56P9J/Zp+ebVrU4J9PUCwhuUz+6ZY23xEQmfXChjE+McKFwyoOgmyab2CBSyrgTqp0QlkON0LQzUo6DXTJKf32+LrulngGUc2LPqUuLqPA/Bz6uoEiE+6UPSbdsddfaCZRQZ3ilhRR69q9jk1Ytfbq2K4PU9wBobOZDR/eQLxPyGAS7biJwYTGEHHg2so3WLey2LpWyGLpX9scAt8zEmjbmmVqiuVIP7wH1jarBA4KAbtWcLH7mTnm1vVSdtLRCZKR6bGp2yj6caLct1ojvOeAUR/LNfdx/yBdCmzzbkQSN2HjnX9fau7sKQqX4CFDzoXli+coEspl7VH/CKhkeDLbEbhmHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(346002)(396003)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6486002)(2616005)(6916009)(66476007)(66556008)(478600001)(316002)(66946007)(6512007)(26005)(53546011)(6506007)(2906002)(5660300002)(8676002)(8936002)(4326008)(41300700001)(7416002)(86362001)(31696002)(36756003)(38100700002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmVxbGVwblljbXQyN1UwMTZOZXNiQjhaajVjVEh1N2pnUzBmYnRmdEdoekVQ?=
 =?utf-8?B?eDFxNWVCY1pVaWt0RFVRZHZnYWhOQW5sY2YrcFpsSnNPOGxUUXhybUpaQm91?=
 =?utf-8?B?cjdaZlAybFk5ZHFnUWFKYUhWc2ZMaXFwdmZET1I1eWVWVUZrblRqeGtIM2Zm?=
 =?utf-8?B?SlZ2QmxNNCtTSzdaejdFeHNJcCtMRVpDQmNBaVFTeEgzbUZlSFVrUzROclRX?=
 =?utf-8?B?a0UrLzNPaWVrZ3ZqQ0syUDVPaUw3SzFMVUl5Nm0rb1l3RDRuWkk3WDM1Tklw?=
 =?utf-8?B?cmN0ZE1rbTZNWEpWTURYeGtsT0N5TE5qWWtsSnhJQnE3dTA5bVBSak85QXhv?=
 =?utf-8?B?R1BYTjJ5VDRGMm5KTXFiSE9jZWwrZWNsbk1ibmtUY0svbmxER242SFdiTTVq?=
 =?utf-8?B?bmxlU1lNcVg4QlNQTWRScmdtcWx6cERVMlM3blB5UVY2Y1Z3aWdESGIzeUZU?=
 =?utf-8?B?TUxqTUhyK2U1M1ZwbXVEYk95bnZxMHEzcjhNUzl6ZVNLT1FwWEZoajhVWGFh?=
 =?utf-8?B?QzZXa2ZXdWMxNVJxbmJOVjVtcTVWdmRKSTZTanB5OWRLS3MrWVRiK0h4WEh3?=
 =?utf-8?B?a0NqNzJuSU91U2FkV2o4VWtxbFM5Z2FjNm1rRTBBa2NUU0c3T3BzbUlFN1Fu?=
 =?utf-8?B?THBJRFRsUVJCcUpyRnQwSWlRdCtQTldvQ3ViVC9IRGU3MmJGcXFiN0ZlZDRx?=
 =?utf-8?B?eHpTNisveXc5bmI0dUpxYk02aUphSFp6bWFoaVhWRTh1QXBxTnZ2SlMvcEJY?=
 =?utf-8?B?U21kZGFXaW1VZWRRTUJHS3JUQmdlbGRNTUNieVplNHJWbTljOW12NzJrWk9x?=
 =?utf-8?B?dThIejlHR2wyT2pCSHA4aGhWWnNBMEVRNjE2Y0xkWTkzL1dMUkUyWDVxL28r?=
 =?utf-8?B?a3R5UkxUWFBIWHIxYjZyOWMrT2cwNEZzcDNCcUVNM1dsZkp2UnVGQnFCTXVn?=
 =?utf-8?B?UzdGMkY2dEE5anRuaEVWNSt4eTc2TDBUNDVOak1HZ2VLU2k3eVU4eU8xRDJ1?=
 =?utf-8?B?YlV4cGJrSkRWeUhyZmVRN1BaOEdlY2t5OVNPcFVtam9VTkVyZzVZVC8ya1Zh?=
 =?utf-8?B?SGJHZFFjeDJnL2JPUVd3VjVmTkFXL0RlWnNvZFdWZWx6RVo1Mk9OMFpVMFRP?=
 =?utf-8?B?S0ozejVnT3J0UUdQakVCQktPV1R4UlZGUFZ6ekJYR2dxdzlEYnBlZ1k0NElU?=
 =?utf-8?B?OW8zcVBqSzk0TDRuK2kwTFljWnNOT3BCNzdjWkxMU2U0eEhjOXA1cm5Qbk5x?=
 =?utf-8?B?THFWWlBDVzE2QktVTEc1cEdod3ExbEQvdmNLR1VHb0ZEVGNGeWdZdjlOVXJI?=
 =?utf-8?B?WDRCc29VUFU0SlZraTgydzlZVkJRNldFeXVzSHJiUWFYajV2OW1ndzN0Ykhw?=
 =?utf-8?B?RGZpWmhRVVN0bnZvcmNIbzBSZ0dKSGlIaVowNTg5d25QaEpMUjVkVkdmMTFs?=
 =?utf-8?B?dG1mSUxQUHEvNEhEMGhKckxVcHVIOGhNMW9VZ25Ma01pcm55Y0JkbUtSZCtH?=
 =?utf-8?B?ZkpOdU1ZV0I1OTM1UTRkQU5mZVYydHR2aU5wU2NBSDdDMEdNYWlXL1N4YTAy?=
 =?utf-8?B?ZEVJNHp3ajZvUzg4VjB5bGx1dTRTczdpWGYzQmR1M2IwNk1xUndwTGlSMkZK?=
 =?utf-8?B?allGL3Uxa0poMGpCbG1yMDNuTnVBcVJiRWJGaFIvcG9yQzE0cXMzdEw0UkFt?=
 =?utf-8?B?cDgzTlFZb2htb1JXTVhCQmxET0p2Qkp6TFdFV0s2VUszQnJhVGRkZGFzeXc4?=
 =?utf-8?B?OUhlNWZZeXp6UWxxVjdVQ2RPQllyRUI0b0lPSXQ2NG9GUUVUbVdudzh3UmpR?=
 =?utf-8?B?SzUwelk0TkRxRlVOaWhCWjBENzNQa2IzTVlpa29HcmVYaWVEL2ZJWDBWaVRj?=
 =?utf-8?B?S0lCYUhkU0ppU1JTSE5YTVRQOC9tVW1JK2pnR2xCVHVHbjVlc09xblM1NXVU?=
 =?utf-8?B?M1VDbENqUlptYWZ4SjhuM2NpbHlOa09MRHNhWVJXaUk2VEd1azBzaUJ2Ulkr?=
 =?utf-8?B?ZEVHeVlMOXhrV2phU3lyb3RZMXliU2NGckc4OEdkUkczYkNacG1aTFNLKzI2?=
 =?utf-8?B?WHBrV2daYk92WGgzQVRNNjJQcitSa244Q2tRWDNoV0RkRlIyeGVDcWt0bTNX?=
 =?utf-8?Q?EDXi19Pvg2DRNWC4CqozXVFlY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b5ae39-5c60-4b4f-ffc8-08dbce5ee7c4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:45:21.4781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpJcwKEOrrppY6RDiU01fDCH1gR2Co07Llyif5Jg5i7htZ2Gc8Nv/+VrxNq/0py2UvWgMv4JzT7m4c75Jm0lDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7822

On 12.10.2023 17:28, Nicola Vetrini wrote:
> The definition of MC_NCLASSES contained a violation of MISRA C:2012
> Rule 10.1, therefore by moving it as an enumeration constant resolves the
> violation and makes it more resilient to possible additions to that enum.

And using an enumerator as array dimension specifier is okay for Misra?
That would be odd when elsewhere named enums are treated specially.

Jan

> --- a/xen/arch/x86/cpu/mcheck/mctelem.c
> +++ b/xen/arch/x86/cpu/mcheck/mctelem.c
> @@ -64,8 +64,6 @@ struct mctelem_ent {
>  
>  #define MC_NENT (MC_URGENT_NENT + MC_NONURGENT_NENT)
>  
> -#define	MC_NCLASSES		(MC_NONURGENT + 1)
> -
>  #define	COOKIE2MCTE(c)		((struct mctelem_ent *)(c))
>  #define	MCTE2COOKIE(tep)	((mctelem_cookie_t)(tep))
>  
> diff --git a/xen/arch/x86/cpu/mcheck/mctelem.h b/xen/arch/x86/cpu/mcheck/mctelem.h
> index d4eba53ae0e5..21b251847bc0 100644
> --- a/xen/arch/x86/cpu/mcheck/mctelem.h
> +++ b/xen/arch/x86/cpu/mcheck/mctelem.h
> @@ -55,8 +55,9 @@
>  typedef struct mctelem_cookie *mctelem_cookie_t;
>  
>  typedef enum mctelem_class {
> -	MC_URGENT,
> -	MC_NONURGENT
> +    MC_URGENT,
> +    MC_NONURGENT,
> +    MC_NCLASSES
>  } mctelem_class_t;
>  
>  extern void mctelem_init(unsigned int);


