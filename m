Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6249E772977
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 17:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578672.906289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT2Ku-0007ni-CB; Mon, 07 Aug 2023 15:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578672.906289; Mon, 07 Aug 2023 15:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT2Ku-0007lI-8v; Mon, 07 Aug 2023 15:40:00 +0000
Received: by outflank-mailman (input) for mailman id 578672;
 Mon, 07 Aug 2023 15:39:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT2Kt-0007l5-4G
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 15:39:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a99ecd9a-3538-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 17:39:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8949.eurprd04.prod.outlook.com (2603:10a6:10:2e0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Mon, 7 Aug
 2023 15:39:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 15:39:55 +0000
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
X-Inumbo-ID: a99ecd9a-3538-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n83PtR4euJ/pDChSm8mmzYO7BLj+YLUyWp+vayTnhJmRntmawKgWToC48evGZeAye6mfMMz3njTbpcVDmFCdOS1PPTldopfpyohCyg51i2YRAE8RVPb9z3Vf7402EMn1F9I550d+u1jHG3WcRr1wsb72CRqdGAn329mZcCAdNKYUB8YJ4CftT+1uzrWyVOzS8wXLZTuaWfYLWO48R+0Lfl3aaxGKAu17UwIUacCif0F6B0MTmZSVJSdYBhhq0YCLG8cVsgfkCL9Kw5iSlAwSqT3hdnwe6mq/pySho4/zSO+xEkjXT9l4uFGD3nvRyfO4OQr48iteVLF8xLztTUqJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5a0aGsgMCp4OKHVf3eaemHU1LFdujOUFiyGq8ijI+ww=;
 b=GDVmFR3hkfbhw4YYvca2uq/mxNWA1UJFaEjjjNM7gtlLupcpGmTvZG1QtGjjV7ibxY/BaIU3YySDJ0yh795YvGzXMiiGHncOq8JF1+EHcVfhHqqz2G2DU5oVQO4vgYU69VpigXfrf6UNlYL3AuCO8U02l2U4wo/PKiZ2nTXmuOHopz91z9PkRkxwfYYmWQKwyavrnbuRbVllr/ZqqUI1QDJbA2jW3Cm6s3p4NbdQpk1073HOhhvXuqyO90G4HYbnbYOjyiEMB4TJuTTx5D66RuiEQPzaioEmm2LOJeJ9ycJKTb/T/qezeCHgTYzI11WZ6L1IFK5lG2k33Ru/+Be8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5a0aGsgMCp4OKHVf3eaemHU1LFdujOUFiyGq8ijI+ww=;
 b=kYyYgxhbjfd6r2AqUh+b/7C5aFzrMcdL9I+97qg9Pxv+mnkkpM/XqbMtCRHOX7CVoOeN88Kjqa10EcjEyCVaGKkI3/UGzynS9pZzqXhPuyuQmWrp1brikIfqRWu3PUpx4PLGmY3sPdTCVzRmzH+xtzCZmaz2XkJMWQpYTIaJEXdzAqdEFPNyY1zDn1XEx5hvyc5Jwt1vYDTbLj9Lp3yrw19T5Q/Aq4oChMeTYaFDnN6Cojr5JwYh82zRb1Zo9Q6nQH880fGHMLfoYGO04yLo+kkbmd4VKszcBZQRMCp0CrH7IX2k+oPrnoW98ERykTrxQZh74sIJ8ioNJjfxlqNjXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <af751f31-5e8d-2b1d-e878-148e08d9264b@suse.com>
Date: Mon, 7 Aug 2023 17:39:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/9] xen/common: Add missing #includes treewide
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <2c9eb4fc175a1bdd21293f2e2611d8e21991636d.1691016993.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2c9eb4fc175a1bdd21293f2e2611d8e21991636d.1691016993.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::23)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8949:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f23f9e-c930-4264-9bcc-08db975c8ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h/GVPe/pLfbUQ6MfsViHwOoFihOuP9KTjJpZe24QdkgQDKlcr030tZKcJAKV38VkKPlFPbB4O918RzWNvnVLcx/HqG6gVhOE5+Cs68D17Z/S920noRpp8PQnVRlgqaelqXeRccnr2nU/nvaDQdM5z3/QD7hE9lRZmptdU2pIMQrjFVMuhuLpuFIEm1va/jdizwBKmhRzvsH5/FGZPfCJkVOWFDkv2Fl7pQrrUQEDmk4QkuFNS8QimzJD6blwVTD1ZToNk72uQBqSbkQd0vc0lfESCeUxbfZK20fPVraL24wZIJNb0NamiQuMIIm/hY898Sli5VaIc74fz7H/GMOShM6f2Mrwu5JDL+RzNXSn/weE1sQYpThva6gxxfBkv4eL/mdrxA3TO9U7kV2t4DTYGkPmNyHn41XVigVRyK2bzKyNrUy0pIeCbyH4tB08TTP/G02KCted3Ty3icJzUOL14ygyNGS8zCdHgInKZu2588YYK+JjADhU3sJLfQIlmDxsNvQUp+Yf/QKlv7MPDP8q2e+YEy5p0CxyK4xiE87Qz2M0EY0cT/JVWRyotvc6SDYPkH+JlXQMU+qdrlppHqgU2ckfIu/Kn/n4eUSb1aYBe+KlGi4shtgM/2iRmsIdiJbm8/d0P4QCcyOZwxp9YBaWWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(136003)(396003)(366004)(39860400002)(186006)(451199021)(1800799003)(66946007)(66476007)(66556008)(4326008)(6916009)(2906002)(53546011)(2616005)(38100700002)(6506007)(54906003)(86362001)(31696002)(6512007)(478600001)(26005)(36756003)(6486002)(8676002)(8936002)(41300700001)(31686004)(316002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGdJTDI0QU1OQVozNDUvbmNpcVFBNEQvYzI4Vjc4bWwvQXZaZGJ0UWFRTnZp?=
 =?utf-8?B?VkZ5djZMbjNpNUJRU0Fvdzl2c003UW5Ud1plcGdsaWEvZk9NcTZBallVTG02?=
 =?utf-8?B?SzlMZDk1QVdJbWRTWnB4Y210a2ViYXRuZFFBRUh4dkttKzBNVW1nUlhQeXFT?=
 =?utf-8?B?U2grbjlnTlFSRGVXMHp3VlowWDIxcklXWERVZE9mR2NQMWJndENlU2RKWGJa?=
 =?utf-8?B?dWZvbjd1bTVIeXVaTXZxcjRBNzBpb2ZoZGtwY2E4NmxBd3JJYktxUTc4U3N3?=
 =?utf-8?B?NkRBdXVPWjY1ek1kQXJrMmRGRmJNOEJnUjg3ekpWSy96eDFzK3NTR29Ha3E5?=
 =?utf-8?B?M1V5NGpKQTE2bDQxVHhScW9XRlBrN0t6OFpsZGM3cE1vZHBheHZVY0xQTU9X?=
 =?utf-8?B?NU5UczU5NlpYTXFaZElhTzJPY3pEMkhPOEk2cG85Snozb1dCZ2JlZmRIQzdv?=
 =?utf-8?B?bTU0V2JOaTh3bmVXem9MMEhvUFBsOEJSTVpHWVRSSm9yVWMwUlFtWkM2SVJ5?=
 =?utf-8?B?RzNKUGJhUkxLZERmazRTbE9wOFdwMkh6MDJWWk9xWEdueWhhOUo5aHorSkhQ?=
 =?utf-8?B?S1JLM2M2eGRDYlFBQUxQT1ozbWZIN29RRkUvSytjVHhLQm1NdmErbjlVcGQ4?=
 =?utf-8?B?akxySWQvMzZiQlowdlFxWkhSa3EvS3lJbXZoR0dIcUtRNFlLMlhYeVplUHpa?=
 =?utf-8?B?YVRML0t2d09FKzhCY1dPL2ZiTGx6V2RGWTI3dGVSZTEvR081TzBHMEc5M0h1?=
 =?utf-8?B?Wm94a0pUQy9XQVpFK1kzaEltYmhzUGFlem01MU9QdWszMi9jdkFUKzVYcTBE?=
 =?utf-8?B?c05PaHlvdUJhd2tENUhqYTQ3d2JsK2lXbng3WDJrOWZla2NlQzd5d1hRMm5U?=
 =?utf-8?B?K2pJcWdRM2dKeGVoZkxXUjFpSDN4aTNWTG1oR2hvelZ6SDNtMlgyZlFsTmdN?=
 =?utf-8?B?WlRwUTBKVXFVYlIrZ0xTTUhtMmFDQkNKeGxLN1h5bWtQbU4ydk0yeWlpQ0tV?=
 =?utf-8?B?ZCtvMHRFRzFYM1hyaTdLbUh3dVlYRXE0MzVpZmdJdGNqYjZuQU5MVnpRNWxy?=
 =?utf-8?B?MHRGdEtHVDljUnBHRGExNWtDSzJMdlJOTXlQa2hsejh5dXN6dGtHQ0JEUzBs?=
 =?utf-8?B?TmpEdTMzWm0xUTdnVHUwaEVPRGkrMytrMEk4bVlqc1M5djRDYnZTd255bjFB?=
 =?utf-8?B?MDJsK0RPNDlGM3FDZ2I1MFludDdsb0QrWTFtK3ZzUmJSSGk4ai9Edk9zZTV0?=
 =?utf-8?B?eXJBOUdOMGU1NnNJeDNMdzdUYUw4eDA0eHpnYm1DM2hWMUdVWnVaaUMyQzZJ?=
 =?utf-8?B?aThoNGk4RTJNd2p1cUlpOG9aWk9PSjVQSWZVdWQweTZmMFNTVmtxZ0x3OVF2?=
 =?utf-8?B?TEwyZmtPMi8vQTNaeVdzb0YwMlVZWXA5YlNZM0RmVHkwRFJOLzhOWFdkdVV3?=
 =?utf-8?B?Tys0Si9kbE1KK1ZvTGdDSExNY29qVUdGZjBTaURpQ2FEd3NZeVJuZFVOUmpk?=
 =?utf-8?B?V09PUVRabjFONEdVbTFKcnU2Z045bnJPcXhJRk1lakFrdDFXTWVJbVpvSDRQ?=
 =?utf-8?B?U1AwbW5LWERQL0N1ZDBtZGJpMW83UnF6QXRxOW9VQjdZUnY1SjdocmtvaUlF?=
 =?utf-8?B?ZStZbUoyTXB1MHhMSnd4TEt6MXdCblRVUS92UFZNVklmL2JvTCs5UDYwSkov?=
 =?utf-8?B?bm1xeVNCQXhrNzNZaFlrVmZFNUdDODR2ZGVwbXBGbXdLYlB4YUxqM1ZCdlh2?=
 =?utf-8?B?QkpkQjFJbWlwZkVYT1RPcFpqaFozYWpwTGI5Z090R2Y2d3JzWEt6YVVlbGRa?=
 =?utf-8?B?TkV4UFVZRWp2WkdObWlzUDRtMkdOMUpVd3RsdnVpdGQ1WXZCY0Q2SnJiUWZh?=
 =?utf-8?B?NWNKMGgzVFVoYTZEMHFVelpBVnVkTTZ4MHcyQm5Gd3VaeU90bDBKdUVwMFp0?=
 =?utf-8?B?Y2lsbW1vdSsvL0hIWTA5NjZNcnA2TWo3L3NSejZiVTlPRnhnZUxDWmgvbGF0?=
 =?utf-8?B?c0YwZ3ZIODlMWXZ1b0x5TkFaa2RYcVBROFRLbkU3R0RNUUlmenFDNVpNWXVx?=
 =?utf-8?B?YW82d3haV25hbEUvQXdtWnk5U2o4a2piYVFUTkl6a2d4YUllL0lIZjB3NWht?=
 =?utf-8?Q?O2OIPK9TEwgh/vOwraL823dkX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f23f9e-c930-4264-9bcc-08db975c8ca2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 15:39:55.7140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGawX2cTgMWWu2p6MlJ2iT/nxYTBecKIbNS8h4X45eXlqbPRFnbXf0T9yXXcvi38WhNCyS1SHYporMsciLLfTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8949

On 03.08.2023 01:02, Shawn Anastasio wrote:
> A few files treewide depend on defininitions in headers that they
> don't include. This works when arch headers end up including the
> required headers by chance, but broke on ppc64 with only minimal/stub
> arch headers.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

I'm okay with the changes in principle, but I'd like to ask a question
nevertheless, perhaps also for other REST maintainers (whom you should
have Cc-ed, btw) to chime in.

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -28,6 +28,7 @@
>  #include <asm/current.h>
>  #include <asm/hardirq.h>
>  #include <asm/p2m.h>
> +#include <asm/page.h>
>  #include <public/memory.h>
>  #include <xsm/xsm.h>

I realize there are several asm/*.h being included here already. Yet
generally I think common .c files would better not include any of
them directly; only xen/*.h ones should (and even there one might see
possible restrictions on what's "legitimate"). Do you recall what it
was that's needed from asm/page.h here ...

> --- a/xen/common/xmalloc_tlsf.c
> +++ b/xen/common/xmalloc_tlsf.c
> @@ -27,6 +27,7 @@
>  #include <xen/mm.h>
>  #include <xen/pfn.h>
>  #include <asm/time.h>
> +#include <asm/page.h>

... and here?

> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -4,6 +4,7 @@
>  
>  #include <xen/types.h>
>  
> +#include <public/domctl.h>
>  #include <public/xen.h>

While following our sorting guidelines, this still looks a little odd.
We typically would include public/xen.h first, but then almost all other
public headers include it anyway. So I'm inclined to suggest to replace
(rather than amend) the existing #include here.

Then again I wonder why this include is needed. xen/domain.h is
effectively included everywhere, yet I would have hoped public/domctl.h
isn't.

Jan

