Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D13771C85
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 10:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577843.904904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvqy-0004D7-HE; Mon, 07 Aug 2023 08:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577843.904904; Mon, 07 Aug 2023 08:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvqy-0004At-Dt; Mon, 07 Aug 2023 08:44:40 +0000
Received: by outflank-mailman (input) for mailman id 577843;
 Mon, 07 Aug 2023 08:44:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSvqx-0004An-HK
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 08:44:39 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a47cd7bb-34fe-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 10:44:38 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 08:44:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 08:44:35 +0000
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
X-Inumbo-ID: a47cd7bb-34fe-11ee-b27d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIFPR2QqIEEutfCvVVCHV8pERwpT43xiyOMiiq290T1csfXdhPKROBQEjg6C/zxGFMlv3BAOPS3sk0UP0D1mqPc5xRr75FliDL/Rp0TfbOqy/blAt7ASor4Ade6WSzIFIsdwhQtPyyYT8OFFXCCAVUMsAbPCgxxEdaa8ktmz/YOT3OUktCoNGB/TUKv95wpptGC9mqoyNL8UBuL3JisaQ9jAoNjyXN5nLhVDjgo3d4Rbe0rGnQZqYQczQHa2RUbVC4gd7oh9fc3yRNdmlKMrrsy3CB03LhSxvsEwr+vhjmaDVMfZPZ0M7OjKeYXuf42QEVauwN415kXf8EbTsrQLwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoSFqZUl37POL6Jmc8YM33HSyUXquFBuoSRoCHzIMJc=;
 b=SmFVe0qpaLIjOEmRILRGMz79ViXepN/V++vhSDKhSttowDtuHUM3H2/mgFHKMsufWzrl81f+69Sqn8jWh7ANTKS16PMQdb09u+A11uvz4frFWhAkX0TtIA2hYycY6FcjG2aQoorKjtPJeMaqRJp3K+W36S5dYhyjgi/KPeHEGlSQ5tZNvlld8SYmRgdPVZMpyUiNGXagzLdv6CWCTeASxgsoJZ5Bs1uJ9aosqMxXwxYoH30BL6dUZs7dGVnTOp+BHqJTH++MGSxReVlwJQV+SXRMA+7xp0DBZdHdQjhzTOzsJRXDu7yWl+BMxl9bk00SVgLupVs/A/mNKeucqXitrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qoSFqZUl37POL6Jmc8YM33HSyUXquFBuoSRoCHzIMJc=;
 b=oRSflo1DjOJRtiERHF8ssecCDC4UczDE/VRsdx1XZV9EanIVptMMJ/e26NAlPmElP5yatuBDnfkg18TzS3p9TH6l28iVO1DN4sxI+4pwhytNns8+wl2B9SZMOJXvpboAlQDMTv8Hkoy1XToHFkkaQDMXBb52oc0Jmooy4BN3hvymHhzgYOqeH/kFHQuhqu+k3h79kkvXgB1knW/6gOjhJ/pXPSr+Gon0zHrfo9VjBcA0bglQApqzySxsmTbxqGWzkqQFAfyQWO2s8Ek81XzzLGjpDgGNGj8yd5wQd7vttsXxskoEuDm+nXrHNK+LED4SEEN3IG2WSctZeknYwfP5zA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41d5d8aa-c936-2024-b738-2df5242513ec@suse.com>
Date: Mon, 7 Aug 2023 10:44:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] x86: Address violations of MISRA C:2012 and drop
 bool_t
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <2cd78bd0d39b36fe73e87cd1011658a54c2c729d.1691158092.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2cd78bd0d39b36fe73e87cd1011658a54c2c729d.1691158092.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: f924a01b-198d-4bf2-dee4-08db97228749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bcdEW+5+TfrGzsPR1XATNH++Vl9hSoJZNnYg1PXE4CjMKFA3Eq6NSh7j5Ism3EeAnF+bB9amDFCbXsAsvEG4pk1e4TVt02FLtxBCUJjE5m+8Qypuccf5UUJiBmJyFnzOUOUEiNy+QoYJNF9gNHd2uYIeAvDqZp242uaIwA3jbBMKAe6JlIlTbK1Byw6lWcSGAYMuJ8ZJh2LtJqggRuA8ueShgDEZOqOaZKbxUV4cuu2BRE81+KDi61gH3g5y6IhMZ8+YidxTelVi7vFoDCTEsBMlHPy7MMSrs7qNRQTBGs9/vccImnQer9CoxaKutjBi771UCBZZ8aIhu6DtUwi+2SYLzUL+o+9cPRfgQ+gPutNoNkYHXq4OA3N69eq7RFbqjBruUhXcLFCgHfMEKxzCyfKd21yQtyi4KnCzCxsIqKeTDL4lFYUIBqkESY0SYzHf8HzOqdzVHzv1QuTfxk/DI99WXo2eV800+EgnZp6JrJtHtOndX2+FDjhA2GWyQPC4gWLFe3YouHMz4lqh7+TX6py8qjKG7CoeqL9dwpHcLFuqfb4onDnoLfDy0/fwAPeRHHLneDdUUtzDCTHpweoSX+cwEQu02URxrG25MbTL1HlFxrLzESyQIBE3kq+kZwMz66nJTROK7Pe1QaK022lpdw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(136003)(396003)(366004)(186006)(1800799003)(451199021)(41300700001)(26005)(2906002)(5660300002)(31686004)(7416002)(8676002)(8936002)(2616005)(6916009)(86362001)(316002)(31696002)(6506007)(53546011)(54906003)(38100700002)(478600001)(6486002)(66476007)(66556008)(66946007)(6512007)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkNVbG1VMDNUM0RvYzFEVWZwT1kva3ZTR3ZEQ3g0UmkzUHZFTzkvTXdiM0U4?=
 =?utf-8?B?SjIwQ0FLWmtYUFlDWWkvbVk4UDYxTnNFZDlRQTBnQURGVVJGdTIwcGY2Z2x6?=
 =?utf-8?B?WHp0bDk0QVNVY0JLSkI3amxrdnlDYnBlcnhFeXBOeXZtbTZyaWNWYWJZVG9h?=
 =?utf-8?B?SFZLYWxzTEYwWW04S3pFN3ZwYUU0S2ZlSTJPNVdiN3ZFcFZRbEhKR3JGQXdh?=
 =?utf-8?B?RWtxeUlPQzNBc2NkSy9kakNXSE9RR1ZnMVlEV1F5NHBKQ3hLVmNCUTZHMFZP?=
 =?utf-8?B?NjNhY1hXdWl2THREbWorZzI5MFh2c0dSTlMzSWxYRjdvVUdlQWNsekY3a09I?=
 =?utf-8?B?YjRidVFYWGkxeTI3OWR1cSt6Zzg1c2VzZktIbnVEMUtGVU5yN3luN0UwalNF?=
 =?utf-8?B?OEFGRSt1THVaL1pML3VxdENHWEVzbVprUHZZYVRWd1RRS09OZ2VKaDV5S25n?=
 =?utf-8?B?ckdlTWRrZ0ZTN054Sit2QktRbjZyOTB6V0VpNmxJUERvbmJEZWtKTjNYd1hk?=
 =?utf-8?B?Smh1QklWSEN5YURVNDdOdEdaQ0pWWUNBRy92TzNnYmRGZHlzVjZNZWVTVFV1?=
 =?utf-8?B?NFhaQlFWVk9XQWtwTTBsb2dRQUlXdjNpenhha0xDNHB1TUQxWVJ0SURIa0xO?=
 =?utf-8?B?cnhONXFMMEVBTzN6SUM5QVp2QTZNRzNHVHMwSVBqZ2JEZFpSZm5idDhINVAv?=
 =?utf-8?B?ZHFtN0QyL2Nwd2pPbWRvNUx0cmw3TXcrSDlGdCt5ZGJzZUttWHc4Tms4OEY1?=
 =?utf-8?B?em1UdWhOWUo1aUxheElpbGticEgwMHIzMWVVYlU1eGpkc29ETjRiYUdxZ241?=
 =?utf-8?B?NFlsaFcxSXo1V3lLZXl5WUdkTDlLUkZhWmRRZzNVbk9rUkNPUkh3MXZpNWtW?=
 =?utf-8?B?WWNxQmFzMDJFRzcxZExxNFptbzdGU3BmSk5oR2kxcHcxZHRzcVN2bnFRTFlG?=
 =?utf-8?B?QlRuMDVKcW5uSk5jUUpTSVQraHpPeHpqQjJBRnpXZDFGTVMvNGVDQXhFMEdm?=
 =?utf-8?B?emsyTTVDdjlHMjVFV2JybytpWHlUNFlLZ2V6bGg4NWxBdUQvd1dNMUZDMEMz?=
 =?utf-8?B?ZTMzNzV5bTRwUDlvcEd4WE12R0xtVTNyVTNsdWNiZVR5MG5Td0paS2NDNDNL?=
 =?utf-8?B?MEUzMVNXNnBnSENBVnRtNGhhdmgwTHEwcDlWcVlzc1ZXVzI2Zm1yNURBbG1S?=
 =?utf-8?B?c2JXbDl2cjRKeDVraXp3WkU5VGdoWk5BTnB5OGJQVFZBbUxZZWZQdXU0NXZF?=
 =?utf-8?B?Qk1mUnVzZjgrdEwyVm9xRE9oVmxrSXBSWXkyS1ZBMGFGZ3EvUll1bzkwNkFm?=
 =?utf-8?B?S0tmR050RC9MNmVINElLWmxhYUUrRGtVaFZqWjAwYUluM2hpR0pSUm8vREhm?=
 =?utf-8?B?L29qMXFUNW9yWnNzY0tLcFdiSmhYREhDREpvdFYyUmIvL0tMcFJBK1hMd0sr?=
 =?utf-8?B?QnYrVW1BVUZtTjNoYUpoeVVDc21YTmpjTjFqLzRadlo0eGRONVJXTGtXdUwz?=
 =?utf-8?B?Ky8zaHoxMG0zV3k4Mnh1UkU0dVlRNDZTdjN3azdxNmFzQXpGM2Q2emhmS1J1?=
 =?utf-8?B?RGRnT2cxYVVBRlJUc0lFdEl2YVY0WEJ4MGVrS1d6NlRHb05HVFNjaHpIQXls?=
 =?utf-8?B?NW9UaUdXdkcyeUdHSUxPRFNUd1dndDIvQ2NmMGg2em5TVWdJQTIrdEFZUThC?=
 =?utf-8?B?OUJEMlVUcWpTb3dSMDZlYVZnNysrWWFUU2YvMzF6MTRaUEQzVWVoRlRvRi9i?=
 =?utf-8?B?aVlpbWdXS1lrRkFoTFdDaDJaQ3NCLzVlMTFtQThVV3k2U3c3clF4R0FUb0dx?=
 =?utf-8?B?U2hmNVBEMnh5VVBQUmcyZDVvMXFyY2h3dC9iSjR3UmZaMDhmWW9qWjVMUHhB?=
 =?utf-8?B?VnJBeHMxSWVuTTdTS3VNc3BRTUV2U2tJZDI5NVBONnpMeUFiUHk2ZHBsTGFW?=
 =?utf-8?B?OFZIcGpQdXBYUGdJK1BTMWxDOXhHKzBBS3Y3TCtaTE5rZEdFaGRJeGNUTHhy?=
 =?utf-8?B?V3FnM3E2TUpCRis4dzVPcDVYb3g5M3RtL0R6a2NkTVhiNlR4YTBJeFptclVa?=
 =?utf-8?B?dW5lTElHZlBLUTBlMnJTNG14VVdmY0VUbTV3L1RET0xYU0MzRnNpWjJjbGR2?=
 =?utf-8?Q?kHS2kSFIca1illgl0zqqse20B?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f924a01b-198d-4bf2-dee4-08db97228749
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 08:44:35.8844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: in7XfwW2D8s8DUkmS1uZ+OJZ6QyISAl8ykVgfDMbzEySfIOfn0irKK2FK7eajnjAyQgKNY8sM13cJ65/fSyR8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197

On 04.08.2023 16:11, Federico Serafini wrote:
> Give a name to unnamed parameters to address violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between object and function declarations thus
> addressing violations of MISRA C:2012 Rule 8.3 ("All declarations of an
> object or function shall use the same names and type qualifiers").
> Replace the occurrences of bool_t with bool.

Hmm, I read the title as a promise that bool_t would be gone from the
code base (which I couldn't really believe). Perhaps "... by replacing
bool_t uses"?

> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -26,11 +26,11 @@
>  
>  bool __read_mostly opt_dom0_cpuid_faulting = true;
>  
> -bool_t opt_arat = 1;
> +bool opt_arat = 1;
>  boolean_param("arat", opt_arat);
>  
>  /* pku: Flag to enable Memory Protection Keys (default on). */
> -static bool_t opt_pku = 1;
> +static bool opt_pku = 1;
>  boolean_param("pku", opt_pku);

In both cases this also wants switching to "true". Happy to make that
adjustment while committing (together with whatever adjustment to the
title you'd prefer), at which point:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

