Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B55695A8A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 08:23:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494987.765215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRpdg-0007oh-Sf; Tue, 14 Feb 2023 07:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494987.765215; Tue, 14 Feb 2023 07:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRpdg-0007lK-Pr; Tue, 14 Feb 2023 07:22:08 +0000
Received: by outflank-mailman (input) for mailman id 494987;
 Tue, 14 Feb 2023 07:22:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRpdf-0007lC-5K
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 07:22:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47a6ef45-ac38-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 08:22:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8773.eurprd04.prod.outlook.com (2603:10a6:10:2e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 07:21:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 07:21:33 +0000
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
X-Inumbo-ID: 47a6ef45-ac38-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTpYR0udfnr+mPhtWKDZhMUYO/RJKIjoXZ85e19DdpWwPzIWfizvAfm8Fw8+pIw4rYJviV2WmWoRQUDalrtQpyMNtWyZX5aEZgt4aGROHA7kkvsmebZP8xOn4YFqnPELp3hY36lT9EvitmkBKutu/MF6aSI5WfkdBqFuq0ZaKDqWDXfLxWJJ4d4lIUCEMRtrbDDYC32UtuwS7JZ+AAWb8UX1sZc7/PIBzYmEuNGuK/VrloeeERA5ZL0FGaAEkKcxxawGKFxQ/87w+C4RLWKwiED/ZZF/4EyKvAy8J2gdYmW9F/DS1HtseyvH1/IIjERdfCG5RosCNGiLkPC68wTCOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulJXw170r8WN8WSBOaLWRs33tLp8RRxGLUjOt9zeFtk=;
 b=hQEJBRQHlPVB87+migtbcE2SoV9UvhjWp29XNZD2UuzpfYsxsA7RfADfBe7KP5KZ4rpLiVB1X3ax/6HvhpU1GMwMWLzR3qYqDeUOpH/yUdRa3LG4+gxyrf2JWjBN8B8szx2G7wacPKePNaTM16bPJxKJ9KseK0St9Lna0F6rs1VzMRJR6/b5sSXrzMvXj7mqbpSrNNpsuHtNNqPE+htWHIcAkHcRuJTP1ZjPwzoYfR8+vJsvGomqjy1EpQ5lyBn45xzIEmmph0pSnMRv2n/CgetfkWdWE8TqZuWa0a6WmHjgJDOPkrXy56eEMLTSwF1qgc2iijg0IulDYnRRMXcR9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulJXw170r8WN8WSBOaLWRs33tLp8RRxGLUjOt9zeFtk=;
 b=z12XoTeX+gxjFcNw+4rVQf5lgq7VdR/5YfxFRlJmfttyoA+NvFsgI7FLJtr/IJrPo/QqMMU1daceb/udjWUITQRhyLM5aWFlLUCFrUHWBBSjF/fa3fTn/DBM8ko98hCUYOgFvzCdnucKHA1gn0kIb8xX40HJtfOpOmMhPLb2YMcLMlQSNR9AxPTAmfxhcdEpYzJr5zcAe8Pn9LmL415gYcL87sU42DEBF3gZpNWcvkgLQShTzDt5Ve5ZvjAJ2legqF0NAVY0/YYhWMCvVmP4Dc5Td3ZzqjU7uiLfRc7Ylb0wq6R8pmI2udxYBxoq2lgG7KR8qPI+hBymIs/qq5a7wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ba89c85b-9aef-6087-d91f-c9097b30cc6a@suse.com>
Date: Tue, 14 Feb 2023 08:21:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] x86/platform: make XENPF_get_dom0_console actually usable
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b1250f72-d268-7bdc-2381-adb75f958ceb@suse.com>
In-Reply-To: <b1250f72-d268-7bdc-2381-adb75f958ceb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: cfac289a-124f-4dcc-f7f0-08db0e5c1974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4pfhSiCc1JRTDZ+4pw/IDHRKbfLyL+H2gEbcdn6GrPMq7V/FhRtscIHkSVyjSzhueLUwLyarVdERky5WRlq4f4mxYfq4b+JVA4+ird9mgrtpYxSkkWL677KiMuw45g/zHBEXlzKwzzUJFnTvq9eHD3w2jcUS3dadIqqYiUxfvUtoaQnHiTpzZvl1YSinpAXGxFp36BelbB1EAbs3hq6uUQL3nU5mt6OBF1Mmaqty9sbu+EYIvJaaae6eqZl0WAWOrTmD5SIgg5Qga/sjLynKd6VQY9xts7ZmNklKs+QIyQ6NeqIRyIbIonIlIhwTG/sCbcNyh3BbrSh/lX+/73D9aRgmbtnthQLG21zwhAN8peelSa42qvC1Ol2m5FoWuAfz9zuPLN9Tj475p6TpLgxWu0OrhH4MorhqQukLZQL9nhln7Yyght2Q2cG56bqIh8shryb2BHS5v1blvV6Mnb9z2LBBPYDgUUjAAhG/fQWor5yR+oOGOe2HAttn3c21+emsMCsNFVBKEpPSmBhUK4t1/OR26FW1xccGM8BUj4Zgj4tLXcAsCzdbOBIHkkhRjoa1NA4r7m5kCQT3HPGfmW23LXpuchWPGgCsHUp90jNvz1TOun3YlAqMemJFQRVtvILhnOxUys6nxq8TlTEvXnz14JuxrtWXnK+RoZJyfW6leoAJz5xx/eNQFfKWvdit6ARz7qoVVP8xwxCP6zVG2E8xqcr//9DvfG42T6JQyv+Vzs8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199018)(36756003)(2906002)(26005)(5660300002)(31696002)(83380400001)(186003)(2616005)(66946007)(38100700002)(6916009)(8676002)(4326008)(66476007)(316002)(66556008)(54906003)(41300700001)(478600001)(86362001)(6506007)(6512007)(53546011)(6486002)(8936002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlNOT1NJWFBoSXR6eVdpYkx6eThEUmhqV25YL0RzbVBOMVUyMFp5YlR5SjRD?=
 =?utf-8?B?MGpYQWlWUkRoMkt6aHhzYi9iVUZFZGNxVEgvU0NjcHB1R3c2Q3hUMzJwUlhq?=
 =?utf-8?B?QjBwczRveEtLb0txcGdYeVppVHg5TlhrWVRSNkl1M2NsUGk3VGwyaUdFNFRJ?=
 =?utf-8?B?K2d6WW9ONFpzdHlsZEhub01rUThNZDIvVlRFZUhreFJKWUs1OXZ1VEl0a2xC?=
 =?utf-8?B?ZVQ3alhhOXpzRHZYSHBVSHp0TUdvYUxPNlBjMWxVeGdsMG9vdEd4UGoraW9y?=
 =?utf-8?B?cFFPdjNycGM5T3l5TVUyL2ZPa1JYVXptblpZZ250V0gvTHUrREg1Q2tQRG9D?=
 =?utf-8?B?Z0ZsWHNzbFk3akFwZjRUNE1xMmRoQ0dIUUpmaVFnY0JONDdKb1JuTkYvMVNH?=
 =?utf-8?B?dllBMnVMQjRHVDEvYmxIb2V6MlJtVHM2enRzOGJyQ05PQldyTXdKc3hDRlF2?=
 =?utf-8?B?eW42SnB4aVhxcVVRazNVSEgrUzM0b2ptUUN2c3ZQNHF0dXJ1UFVuRjJIYkE4?=
 =?utf-8?B?ZnIzT2JpV1Z4RVNNbkZ4eWdxVWdhc09mSWJzMTRMRVZaT2p3NVFsUTZuNWtQ?=
 =?utf-8?B?ZUVxdTJ1S25Wdyt1YkNyUVp3SUxVbEYyV0J0QnpPZXc5ejIwSFlVbkNDTUZx?=
 =?utf-8?B?Tm5ab3A1dEdNQlBoVTE1Y1lQUk1rdWNpU2g1eklKWWI0WGN5MFR1c2VMcVcz?=
 =?utf-8?B?V3U4bzhOVjRJZGlpRjl4dUlUR1ZxQzN5c3Q2dkt1OG5EWEIwTGxFcThxc0d1?=
 =?utf-8?B?RnU3bUk1WVpyNEpaTUxjR1JEbHhBbHcyODF0UGQ4d0ExZjVtS3UxMUtlWXpI?=
 =?utf-8?B?TndzSytvRCtCQ2pKdkx2ZjIzVnVjd01uUGZiZ2RQRHNoUlcwNEx1NzJlbEFF?=
 =?utf-8?B?ZktVVFZEVko2cDJGMlJNS25mVFRGeE5EazMzSG15eHd1MnVwcnZpZDA5VE5F?=
 =?utf-8?B?YnIxVitMaEVkQXEzaFNFbGVEdWZEbHVBQSt6T01QWlczUXBZd1hDaTMwaHRT?=
 =?utf-8?B?dFg0OHNBa0o0OTkxMTNidFhEZFZyeVR3SG13R01NQ0wraGxYNlAxdytNVit4?=
 =?utf-8?B?bHhwTjBxUkxxd2hLT1kxUXBJQ1pnRkRQbmNmcHVVMDRLMi8rK290ZTdmeHh4?=
 =?utf-8?B?a0pMcXE0MnNpeVRacHZHUkNvUnhmWlNrRm1DUkgyakNWbUV1OWxpMkcydjlv?=
 =?utf-8?B?bm1yMUF1cXUxVUtHUlo2Z2kvWC9IUDgvTGVXZFhnZEhOUW4xUUFBcEZLNUxZ?=
 =?utf-8?B?TnBlYURsOGZuZzlsLzRIQU95UWp0RUFXWFE1eGd4QVprRDB5MUVNY0hRVHoy?=
 =?utf-8?B?enlETlorbmxlNjRHcytQZ0I2UmkxOVdFek81Z0tONmZONE5aVHZ3OWovS251?=
 =?utf-8?B?dE92WklwV0Fkbk5PUzZvYzlsblEzOFg1c2xKaXZFelYrNlRMYUlvRXIvdXAw?=
 =?utf-8?B?RVJPL1FmVWRXZk9NT2VJQ1k4SUVTeTBzdjh3aVJOQytrN2ttbi9QN0lJWW9N?=
 =?utf-8?B?KzZPdC9ZVy9WcVcrR21rbGdoQlZtdUVEUm1GZ2JoODZBQStsMktFdEVzWCth?=
 =?utf-8?B?YUIyR1dWaW5IdlFQeXA4OXNuV05oSiswVzF4d1RWNUhMUmdJQkdlZDFFeW9I?=
 =?utf-8?B?ejlLZ2dNVkFvaXhmbVJIRmZZV0VtWmppdmpQVEdaM1kxRmxlMExPQmdmWUl0?=
 =?utf-8?B?M1M4M3FNQ3pnY0l4QjdZcnh1WWNHNCsrVnovSXFzSno1M0tyYU1CWjhEUm1x?=
 =?utf-8?B?R2pGeUJYZy82YjFzTmR1eWliUVNJanJvQlY3dFF2aGlGTjdvdkJqaVlURHR6?=
 =?utf-8?B?SEtPWFFpemN3ZS9DWWxPcis4M0RVRHhYQ0YyWWZLd0JyQ3paOTZ5S0RuL3Vh?=
 =?utf-8?B?UHpxZ0hVUHFDVlViN3Fqcnd4QjFZSWlCNmJVZDNQcTk1ZzVoQWVqM1BmVE9H?=
 =?utf-8?B?VDROM1p3a3hBb1J3VFZKU2lsV3dyU280Q1RhVU1ybjdxdjl6MDgzZER4alZr?=
 =?utf-8?B?YjlYZ3BWeittYjlyVC9sdW8zdEZHTjlaekRtdkpQeFhRcGN2OTVkQ0RpZmNZ?=
 =?utf-8?B?QkFOWFlHQm02S1hnaDhwNWhOYWVjcWdlRWRLZTFxWlNlTnhndHBEY0I2WjhP?=
 =?utf-8?Q?bSkUze4/t3FYhUa1UD2f0Kuge?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfac289a-124f-4dcc-f7f0-08db0e5c1974
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 07:21:33.4776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWOOfKjjYW+5+gvf+t9wDi8h7MBJ/F5YF9QbMf5JUZ7PCl9CVkRVtYp1mYilx2AE4c+jDebHCsf/l3YtKydkmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8773

On 13.02.2023 15:51, Jan Beulich wrote:
> struct dom0_vga_console_info has been extended in the past, and it may
> be extended again. The use in PV Dom0's start info already covers for
> that by supplying the size of the provided data. For the recently
> introduced platform-op size needs providing similarly. Go the easiest
> available route and simply supply size via the hypercall return value.
> 
> While there also add a build-time check that possibly future growth of
> the struct won't affect xen_platform_op_t's size.
> 
> Fixes: 4dd160583c79 ("x86/platform: introduce hypercall to get initial video console settings")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Noticed while trying to actually use the new hypercall in Linux.
> 
> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -841,6 +841,8 @@ ret_t do_platform_op(
>  
>  #ifdef CONFIG_VIDEO
>      case XENPF_get_dom0_console:
> +        BUILD_BUG_ON(sizeof(op->u.dom0_console) > sizeof(op->u.pad));
> +        ret = sizeof(op->u.dom0_console);
>          if ( !fill_console_start_info(&op->u.dom0_console) )
>          {
>              ret = -ENODEV;
> 

Thinking about it, I've added the hunk below.

Jan

--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -605,7 +605,11 @@ struct xenpf_symdata {
 typedef struct xenpf_symdata xenpf_symdata_t;
 DEFINE_XEN_GUEST_HANDLE(xenpf_symdata_t);
 
-/* Fetch the video console information and mode setup by Xen. */
+/*
+ * Fetch the video console information and mode setup by Xen.  A non-
+ * negative return value indicates the size of the (part of the) structure
+ * which was filled.
+ */
 #define XENPF_get_dom0_console 64
 typedef struct dom0_vga_console_info xenpf_dom0_console_t;
 DEFINE_XEN_GUEST_HANDLE(xenpf_dom0_console_t);


