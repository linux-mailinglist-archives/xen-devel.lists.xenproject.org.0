Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 692A5706A74
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 16:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535918.833962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzHif-0001Ff-IF; Wed, 17 May 2023 14:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535918.833962; Wed, 17 May 2023 14:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzHif-0001F1-D2; Wed, 17 May 2023 14:01:33 +0000
Received: by outflank-mailman (input) for mailman id 535918;
 Wed, 17 May 2023 14:01:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzHie-0001El-Ea
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 14:01:32 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20619.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52f9de5d-f4bb-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 16:01:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7657.eurprd04.prod.outlook.com (2603:10a6:10:1f5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 14:01:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Wed, 17 May 2023
 14:01:29 +0000
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
X-Inumbo-ID: 52f9de5d-f4bb-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1FduhauMfMoeukXmqFMEmhvto33x3Zj6lyJgLKqIENnWjpjc0Fv1h+n1xcsbUWKQQ50BV2cSAOJ4qtoOxjihi4xTSVNodfs7bOQs53Z1XlXQYIDAwBPWZkuN3wxfTmy9KmgxzgjLT8E+IeeHjvyb31JhFKGb3lJS3shs9WoUiWU2aTvyoDERQV5QZjNfHamxrC0ym1dZVzZbsjcSXMThyzSpMZFkQl3m+PA5kddz++P8pLf+wu0Ht2c8eKjthwZFNgeD0XdiQtJQTUOvRzTVkxlNOXWUpNkjql3J1jE22ntBYBJDHC/QVsQUqFPvepLq0z/hA7fS9xh2Fy4ysHuAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhY/zICz1UVzbcRZk5W3O1k5IkbOKELYWA2ukALRJ3Q=;
 b=WSlfy5ADOdgRgsrJ3+533xzW2VxW5LMvWTmq1t0MVWYkd440+iRkgTzAaQeAP3+F7+3XyXqq/NRgaCd08s9kulDhtrDQb52o2e32YJC/Kg+WQPsDyfLYJDojJ3pzKdBeX0FT40cOTQ2QKRaNOH0AjJOnTShEmrJQWggrn/CXUOaEZHNm4Xg3/uVJHebfz+Rqcgm5tVCKH0ZUjzsfcXSD8A9wn5PfkJUR9y7IHygMymyY7GrL/lp0LmkVsPvYSOAvds5AUhbIqSlYgKtgIsqYjDEHZOYxMgaBu3mNWUFnM5SBzv9DKAxRZ3YWiiRpfb9DfjH2T6J8Vm533XEjlz/aQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhY/zICz1UVzbcRZk5W3O1k5IkbOKELYWA2ukALRJ3Q=;
 b=Ec9bUv/v6F4afsDwd7CUqx9l5y6ZJ9mBWw7Od82CERUFMuVklPwPgJoA+618VzNEQdAo8EMDzhYQ1hf8WLbMK03ZuGMkuujxXbB60NrCdHlW3gO1ofXVuSof/h1U35YrPYMdO2askDD7NVVNrorWHkk0rhk4ERN3DcbD2h1bPQhClgv1xLcegGPwBbpfpJszm4t8xZl5wdk4iTDZoBsudJsMOu2ol6v4OZccuaNTQVvhOYYFxxbJVlgETBjr7tCxv4XkIrHI1ph05/JE9v7jR09iiRXalOTynt/6eke83UQ3yI2fVoERyZRYgTVEQbX5tM5AUv9MgIAZXrYwGVRMRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d5eb0703-63be-0c5c-3fee-37e74e11dcf8@suse.com>
Date: Wed, 17 May 2023 16:01:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/4] x86/cpufeature: Rework {boot_,}cpu_has()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
 <20230516145334.1271347-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230516145334.1271347-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0229.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: 418178c6-86e2-4c03-5f0b-08db56df35f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TmlapVOLUVoXxI2qlB3KwUhY/aTFEJConnZSiTtIUXWlo8mcGGvAIVz8SE6OP4w0DIwdM8YFI1s02iO0xy/PvsddAJA0BxgE/1XF8oASjPBabnz0k6z8U4fE//h1E9ZmAI9zO+sKSZYRyNtm50J1vTxFJfXyTGKU13W+THAiZzDfsMjVw8MApfx7olxwMZdIS8pLdTzKYUyIsdBhWDg/tOpQkwlgCtGMyToXIVerFdP+Kq6Iz2KQW9sQzhEbJpR4G36lGHEawxxlyhKAs7t68lmdiwROS122q+KNEooMPlz7T/d1/oP6qG2gTNRIpAAIoGfsgC27Gof3hCMW97Ss/H5YZxjaFmMAMy8VUrFXcrR8jC5ptk7tDIhGdo2zgPDemiFmBjwGAZjNYwxa2mH/AyAca8GnNYNMYnGlrOrtvJd7YF/lJ62P411l3fr1fhfAHi4KEy+sK93aeOunxUGi/cli81gOPo54qbf+6z4JDrQRUrnKGh6ySKi7IQGvi6WhSMAymvQfgZNJb/k/AiRjPN4W/HkcZxI4wWYKfvrttDp8gbr6h346i9qg6HEN4DW+cWWAEdXgZapG8HdZ3tbVSToLyBf62peN3Q2O4ctc5t4fL3JWHQrzlaJdoJAzZoZQ9Z6E1sHB661GMWmXCiqCDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199021)(5660300002)(66476007)(41300700001)(66946007)(6916009)(36756003)(6486002)(6666004)(316002)(4326008)(66556008)(31696002)(86362001)(38100700002)(83380400001)(6512007)(6506007)(53546011)(2906002)(4744005)(31686004)(478600001)(2616005)(8676002)(186003)(26005)(54906003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkpoWm0wUmpMQVNUQmVwMkwvWmh0ZkZMVDNJREpQYkYvRzRValBTV0JjVUZY?=
 =?utf-8?B?VVdJUVk5dXZqS2ZJSmUwN25WWXhBL0sra3BuYjh5RFB5Q1NSN0dpRnlzbTRD?=
 =?utf-8?B?R0lSaFZpMnhvV2dKS3F3VEYvSWpOT0NmUTFzRTBFZXVrZDgrMGJvenBjSjlI?=
 =?utf-8?B?TTA0SHg3Mk9VeTYzU2d4d0xWWGVKYWpxUXhsTWNDcmxGM1RQYjBhdzFUemFV?=
 =?utf-8?B?eHkzeUVuUndEMjhXR09hRjVEczdmbk1Hb2czemp0NktobU1zK09neTRNQ3Y5?=
 =?utf-8?B?VDlPVjlGME1qeWFvUGt1L3FNRTh0VlRNcXQxOEZ1a3RERUd6cmc2RFErUnc5?=
 =?utf-8?B?WDY2YXRLaFZyZmVEcFhsMzNERDF1WTBVTmF5MjhmVm9hOUJ1Qnhkd2NFdHZQ?=
 =?utf-8?B?ankxUHNNR1V5TGs1Z3liMTQ5V3MzTDBSdFlPZ2NRbTlYeTVEelVGb1VhREJG?=
 =?utf-8?B?TEJpQ1RIS1NlUDcvRFBZbmZmYXdCNmZkVnpnZGZoSHpjSXpPYlQvSnVwS0xy?=
 =?utf-8?B?M20vNk56anluNWpTWDg4VXJkL0Y0N0hvYURiSnlRSXRLYzRKd3dBNC9Ndkl5?=
 =?utf-8?B?QWxtRzB3Vm04TmJQVEcxZjJWUXpNWXgvbi9jNStwNFlYSjFtMDdoTE9yVVdm?=
 =?utf-8?B?NCs0MWFRN0tkZ2JobEhzK1YxSlQzZzdHb2dQcklObm9xc2pVMUJzM0xoR0N4?=
 =?utf-8?B?MFVtSUVMa2FHN1p1dFhaOGhaM2FhSGNCTzE3dmZ0VFkzdEZQRlFqK29Ka3du?=
 =?utf-8?B?T04rYnhjVGNNd1BPUk14WmlOeVRqcjAxbHdWUVA0S2I4bkdnbE4zTldlcmF1?=
 =?utf-8?B?MUlQTzF5b1J2U2x1a24rRVpvS1hMTHhrNjZWR3VKcTNDdHNxcS8vbnZUTmFn?=
 =?utf-8?B?TkNKNlhtclkvWWNiV00xbUEzWUF6SENCaG1zY2pHVEc3bzlFR3VVWWkwbEJr?=
 =?utf-8?B?RWJDZzZjVDFTdDI1aWcxcDF2bjU2L2lkMnRkUW1hUVViaGFJaVZ0Z3dGZ0V4?=
 =?utf-8?B?U1RSN1YvM2JZcGRqeXUrbWVKK2h3TFRuMHkvN2hBd0dUTUZOakJUdkVNbFVa?=
 =?utf-8?B?YURTcndHTWhKZFI4K0R2QzVmc1Z5cFdKMU1sK2FJdG42V0tNLzJWcWdpV1Fo?=
 =?utf-8?B?ODcvVzZBb2IzSmpEazNwQy9rRkxWVExPSmdJV1lVYzNkODA1TlN0ckVMZEVr?=
 =?utf-8?B?aW0rMGpwZzNoVW1UZEpueCs4MVN2ZzhkYmdJQ0RqSjlyTWJuRnRmUklac3l5?=
 =?utf-8?B?T0FsV1VhanJ4L0x5eDBUODBtYm5mTDR6eGJkN2FvdnhucklFbGNRcDVydDZm?=
 =?utf-8?B?MmZMazdyL08rd0xYdDBOeVdTRmN0NVVTVndYeFpjbytQZ3NURUd6aEdGd0Nw?=
 =?utf-8?B?UFhTRU9rWUpxYVMvZ3M1Mk1oNlJldHMyR2cyNXNoeXNWaDZkTE9GQkxxV21v?=
 =?utf-8?B?dWJNTklBRG0rNjNzKzhLR2QrVUpEcXZTUjN0R3k0SU15aHZNK0lJa2o2bGdo?=
 =?utf-8?B?SmZLQXpPUTY5YWU3UFRtM1ZPRVhUWWtpYytEdDVCb0dXWW54OFF6ak5aRDk2?=
 =?utf-8?B?L3ZDVUJ2RlRUNlV4c3BZTS8vTmJoTEh2YzBNbExYRzVkWFNmaWtVUEQxcUd1?=
 =?utf-8?B?UW5GZ2RlUndjaEdvaVNuZFBBYlRWU0xmazBRdFZJT3pZQVpUZGd6aEwwRHdC?=
 =?utf-8?B?NE9Hd0R6bFUyTnk1Q3gzZmZ0VnhsS2JUZWI3OFoyaFdHSmlxOUNkT2Y0Smxn?=
 =?utf-8?B?R2w0TjBLcGpGRnVGNXYxOXRwVFlxdGtuRjdtaVUrMURib2svSU5RSktnMjFB?=
 =?utf-8?B?UkdGOEpldkhWWFdqSEpqb2pHSitHZG1wM3ZXV0k0Y0g0REZEQU9jZTFqUkU1?=
 =?utf-8?B?NHFSQUN5RndEYndjSXg1Uk9VV1FqL0RQQ0dqUEpRMCtZUlRmNjFqRkRTVnZV?=
 =?utf-8?B?RUE1akVhRmlBd3Y5ZFVWWFFldGQxRUVwT0l2RS9idnlyWEZncmF5QkpaTm1M?=
 =?utf-8?B?Z0xsUU41dVdQazh0K1VLWDA3M2JCL05wRm1zWjN2OU0zZlRMRUltcm9yUzFr?=
 =?utf-8?B?NTRqMkpVWmRKdCs3QTdXZmJiNGVhNmlxNWdDeWtOQWE0S0I3L1ZISk9oS1du?=
 =?utf-8?Q?DXR5gtbjQCBhkJEGNQhvoOIma?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 418178c6-86e2-4c03-5f0b-08db56df35f0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 14:01:28.8646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcF7EENlYtywf7RaHROjwlReTebJJKv0kGYxE3DhpzVeI9zS8EETGx5uX/WP8T+B3R7f41lXaJs7xxVl/CJ3gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7657

On 16.05.2023 16:53, Andrew Cooper wrote:
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -7,6 +7,7 @@
>  #define __ASM_I386_CPUFEATURE_H
>  
>  #include <xen/const.h>
> +#include <xen/stdbool.h>
>  #include <asm/cpuid.h>

This isn't needed up here, and ...

> @@ -17,7 +18,6 @@
>  #define X86_FEATURE_ALWAYS      X86_FEATURE_LM
>  
>  #ifndef __ASSEMBLY__
> -#include <xen/bitops.h>

... putting it here would (a) eliminate a header dependency for
assembly sources including this file (perhaps indirectly) and (b)
eliminate the risk of a build breakage if something was added to
that header which isn't valid assembly.

Preferably with the adjustment
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

