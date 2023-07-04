Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEE374740D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558407.872476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgxc-0002b5-EC; Tue, 04 Jul 2023 14:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558407.872476; Tue, 04 Jul 2023 14:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgxc-0002Yl-BQ; Tue, 04 Jul 2023 14:24:56 +0000
Received: by outflank-mailman (input) for mailman id 558407;
 Tue, 04 Jul 2023 14:24:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGgxa-0002YX-TG
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:24:54 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe13::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ac9f626-1a76-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 16:24:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8067.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:24:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:24:51 +0000
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
X-Inumbo-ID: 8ac9f626-1a76-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l50cU5Bx04b/1Gu+l9ZnNbAo8ndlMOMVvE3c7UIqmm2ghsd43qCsTdrmGv5N8MiSqgeWUmuIA2lBqNCVIt9zqoWUqfhiUEsY+bMaTqmQi/sdFhUvv7jKc3JL9fNV1EOZpKFSd9e6AS2sxoNFKgBFNzmMhmxxShFFGfS20z2k26JBXbF7DybS4/c2T/pezjQZxYeqS6qVNHWcrHjzmw8fGFIGZLPjf/kfvyoTXNvT6sE9cXVfy3c6IrRhUTF+AWcDT3abkEG8PaBsqcbQYoY8sS6HZHnvpFFTsqx6H9ElBl9WKCloz9RlDZUtrYR6PY/DQZzl00F/PucNtbBFajptxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfp/sOB1eMVA5o4DqiLd457KZuGKzZ1y3xs5SL2BAFo=;
 b=lKSM/fa+Sd1ibqpJgfSMER7W+8z0AR1PpS+hjQ9pFGf13cMsPfSOAxSH01KfgqcXOCsXdqQPxWXKslabVXFjNSJn0ArBOXn4aXkpv1h2Dz0Dlgg1rv1HtG9gnkir3rAh3ucgDpkfA9KpK5ZZQJnmZzijPeI/xRAnJQVyks7/Lnf3V7EWOKzAUrlWll3n6H8VXTmOPdGtnQpnHkNoedw/Rhj5tDgXQyXLSq++qRyJygo6tqRiWe63xZS/SsRPA4rTsdH+BFovTijv9Dkw4FkNY26ArTZmWdFmOvNlrKNoi4NXRX35pNyu6K5ZkFUh12icAuREvfpI/yLeAjw33j2ofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfp/sOB1eMVA5o4DqiLd457KZuGKzZ1y3xs5SL2BAFo=;
 b=2hgaSbgH719zx96cXoezPD05sPG1jakLJXBjJK0agBfR7IjHkt1zkoCJeCRBboHABccsU4GzocnbSOVeGAJ+LcYZWbGtg1pTMNLGia4iYpqd+C9Bx94kbtWtgx+qnnXKLE0A4ZvuS1W5cizJNfJ+BCk1br/5Og6TJJun8uYc3+o4rZhgSTk536JzO3myn2j0a3RgmSLKHZyN04mzlYlslYkVCi6ySKl5tGf6cmdyQOds6KB83s7D+TulSfB3Lp08yY64C39o6oWH7gJ82jGWRlg94i7m209usJixAExM02zI7HM2EEudmHEznqvqWB3mgI5XDz7vgxr2VMBv16dvYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df8a0c82-5f07-6a9b-e24d-7550387fca27@suse.com>
Date: Tue, 4 Jul 2023 16:24:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v6] xen/include: avoid using a compiler extension for
 BUILD_BUG_ON_ZERO
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <0b0d9a5614daac653b3bfbcfaa29a9b4c11286bb.1687793572.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0b0d9a5614daac653b3bfbcfaa29a9b4c11286bb.1687793572.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 3335b553-235f-45d0-3179-08db7c9a6dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WqttBExMSPfvZibV3X18ivCeo5jMoMnNoBXTe70SFMDfQogrT/IuJIAMJgSRnmh2W0YoiNG7u0klfNzI2EDpYVBO73faBqJXnekeIYNhWvZMVVgTb44sWv9xm/p8hu0qa6UHZHKlG0meRmLNBPcZT3kVljAF71NZ0dwkZGNnMffnqBdnWDAle/6puutyPTZyrlYl9Pb4uJCS17D4pCN2P0UvovehbktKmhuCSRGVq1rrh3WPq+Kz5ow1naZwnPiK5hIJGkn/hWSyFRHWKBFrMi9aSYfBbUvLDvs9uVEj/TGUYUOOBNtHG+qeb+M5aJTSluk4EdEyHNef44wvMKtnDWsYiuL+/iHXkG6jf6LXXNp3P5LiuLChgFNpISEvvzRNXrYZ9rCyD2hjVYqOHWrVeavdJtqOvSixF+NeDDgkCS1p1xQZL3c1fe3T02z6N+qLu8feGEFL4a2mTxTuDP2pEkvYJgKmDAFZn6+A5lz/DahY4d1JpJrZ5/7YF/SXxKfxMq0MaQxT6SK3YKLKCVAsToSiWjbVzNrizAVyBbdzPhxWGY1GLRbkADDjS1T3dxhkSMZCQBnRNoxVh0ObUohQKtx969lf7cg44YILp3ZGpy/Aa//C1kmpkn7I76d/TLIAeapwjLCeTsVAClZnqDBslw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199021)(2906002)(41300700001)(5660300002)(7416002)(8936002)(8676002)(36756003)(86362001)(31696002)(6512007)(6486002)(478600001)(83380400001)(186003)(31686004)(53546011)(54906003)(2616005)(66476007)(26005)(66556008)(6916009)(4326008)(66946007)(6506007)(316002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFUzd1Nod1hTREJBMktlNHJ6d1hYUGFONVpHVkZscm00bW4ybFJaRjRQWkdl?=
 =?utf-8?B?N1lDck1oamN5b3pMZTFKSk9udmtDRnFBOGF0dnFyWDNTNXVuQlVydHQwa2Vk?=
 =?utf-8?B?T295ZmgrS1BVVUpCa1Y4dTBUTHFvbENONHFvV21yMTFqQlM1ZDhpaHRqQTVv?=
 =?utf-8?B?aXZveEYxekQxRVYrcGwyVHE2dGZKOHNYQ2x0TWtPdDZKNUlPM1UvbHIzcHhn?=
 =?utf-8?B?K0grMFNOUDlhY2lMVTJ1emc0eThUSThaWEd0TW9Fd0hZRzV4TEpXTUZDU2Zz?=
 =?utf-8?B?VlVVcS9PMzM4S0cwYVdFQ1VSZ0d0cnB2TzkydWh2TzR2QURiOE9jbnY2eU9C?=
 =?utf-8?B?MnpsVTAwWi9nRHMxU2l5ZDhnZENXRlk4cHNQRitsMWpKUUNqazBlQVVxMjRE?=
 =?utf-8?B?Q01kalNLMmlreTlqRTRwaVhDYU9jQzdsaHZZblM4dmx4RHZWVDdpRlBtSzNl?=
 =?utf-8?B?ZThHaHFNdHpZbzNwZmoveEx2Y3NMUWUwR0FqYWIvdXA2anVRWW5mUDA2SnBK?=
 =?utf-8?B?S2RGYmY4T1MzUGxZQ1c4ODVkSjdzY1EwTFF4UnZNQldldVk0a1k3WkpZb2dL?=
 =?utf-8?B?VzFqc2p3VElld3JWWXR4Nit6QjkwaituSGhtU0VYUEdGSFYrdEJ6bTR1Rk5n?=
 =?utf-8?B?MHZlNEVqUm5nRmNoYUZ0M2hhdzF0TmJXbmJFeHVqZXdDc2lqUC9CbTFMU2xD?=
 =?utf-8?B?SDE2d3JBV0psa0lJRVR6UmR5aTQ4a2ZpaVdqMVl1ZnFxdTdPSDB3RVFNRVc0?=
 =?utf-8?B?VGNqeU94bU9Jd2ZIQkh4UFJQY1BVVUozcWs0djlQVWpzTmZOTkhMMU5DOEJX?=
 =?utf-8?B?NFh1R2g0WUJFM0tLamljYTVmN1dxNitVRUtISjZBdlFUVHkva0NqU2lkck5U?=
 =?utf-8?B?cE5Ud0drcjZxYlJYcTJFcElpbXQ1ZlFjSXF3QVpMQ1pTRDd5d1BXcWdIL2I2?=
 =?utf-8?B?K1FjUThQaHU5d2ZsUnlabUVyc1pZU3pqTHk4Ujc3TW12bEZmL2VDQWFNKy9U?=
 =?utf-8?B?ci9uS1BTcndhb1YvUklveEhBWlZwU05UaytvU1JydllnWFZOSEJpNTYyaE9x?=
 =?utf-8?B?NG0yc1NJeER6WXZMMC84VDB3SjZENTcxQkwvYW1EbG1kcnhzN0VFSFdsTnFl?=
 =?utf-8?B?bHk3a1lyRFpla09wTDRhWGo0UmpuTkZKSk52eExDZTRpbVEvRHZmOHdXL0FS?=
 =?utf-8?B?YW5aV3hMbk1raG1jRmdjVDlSakdwdzQvUzhDQS9ReVNzVEgrYXJtY1E2THNN?=
 =?utf-8?B?ekoxQ2ppTzNFNCtZR2dqaFNYMDZqTlVQZE9RaURCdHJTWnllMmRlbUg4TVZU?=
 =?utf-8?B?NzhyaWVtT05FbHgzTTVDUEpnOTJXMEsrZjNBazFtbjRlYXlKaFJhc2kvekNt?=
 =?utf-8?B?dUxXYW9ySXorYzZRTEFqUlFFNmxpQWZrdWZTWjFFZGU1Ykw3UTBlMEpxb1lm?=
 =?utf-8?B?WTg0ZFJ1SXVFSWduNTdFZ0liUXZnbXlqNHBFaXlSMWUyNS95c0Q2RHRTQWNL?=
 =?utf-8?B?NUwyQ0E2amRZT3ZYSWh2Y2lwVDkrRXQyV0lVVkh3d1kzdFlXbGQvcjJ1eWlu?=
 =?utf-8?B?dHhpUVpOZFFQMVNFQitVVStCYlNkR0QvVjUxZVpwTCtjQVAxOXlveS9WaHlG?=
 =?utf-8?B?cDNhSU1oWjJNVWZRU0N4TkRWTlVWa0ZLeFNKODdJU3ZXMTZmT3FBUVN1WHJE?=
 =?utf-8?B?bUgxK2lBbG1hREVwRFhzZndVSzNCakNDVWZnM25IK0ZVTG1MMm9waEI0cWtG?=
 =?utf-8?B?ZnJpbHV4UmltV2x1RlZDNUlCNitPc3l5WmNodnM3Nm5PU3FYWmhyNmVXZTl2?=
 =?utf-8?B?NE1zbkMvUGgyZ3VBUVB1bVdnWFFYa3pvYlA3VzhNZ3JuR1BFTHhHTVhzT3Z2?=
 =?utf-8?B?cVVVRklqVDRpQU55dmlrYkdYVVdOSWZWQXRWZzlUVTZKOHlVcDV1UkxSbzN2?=
 =?utf-8?B?T2RWS3RhRG8wTXM5UHVDeVhDS2NYdEYzR2FGZ1JCZnAxR3Q0cUR4bmhTdUVP?=
 =?utf-8?B?RUEwckc4b0EyWlF1VXJCb3M3eWs5QWljeHdKcFlHc2JTTUZNZllyQU9wVEpC?=
 =?utf-8?B?RWhsOGVGTklSbm5UemxHNmsrOWl1MmdCa3BTRDQ1czBYUFRKMlUvd0UrOVh2?=
 =?utf-8?Q?ps/DBWxmwDS3FWEb43W+Vj3zi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3335b553-235f-45d0-3179-08db7c9a6dec
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:24:51.4947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: weVR/5Co9X1teVguQ+Umfr2C1hLtiWC4+XmBOJKcfk1CoSgz+h4eb2o8Q5ZypxSItdiGNscrlCt4SP372K6oBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8067

On 26.06.2023 17:37, Nicola Vetrini wrote:
> Redefine BUILD_BUG_ON_ZERO to avoid using a compiler extension
> that gives an acceptable semantics to C99 undefined behavior 58
> ("A structure or union is defined as containing no named members
> (6.7.2.1)").
> 
> The first definition includes an additional named field of type
> char.
> 
> The chosen ill-formed construct for the second definition is a struct
> with a named bitfield of width 0 when the condition is true,
> which prevents the UB without using the compiler extension while keeping
> the semantic of the construct.
> 
> The choice of the bitwise AND operation to bring the result to 0
> when cond is false boils down to possibly better portability.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

The code change looks okay to me now, but I'd like to double check
towards the testing you did with this change: While it is clear that
you will have checked that the tree builds with the adjustments, I
expect that would have been with a compiler supporting _Static_assert.
Did you also check with an older compiler, using the alternative
implementation? Plus did you also check both constructs for actually
triggering when the supplied condition turns out to be true?

Jan

> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -51,9 +51,10 @@
>     e.g. in a structure initializer (or where-ever else comma expressions
>     aren't permitted). */
>  #define BUILD_BUG_ON_ZERO(cond) \
> -    sizeof(struct { _Static_assert(!(cond), "!(" #cond ")"); })
> +    (sizeof(struct { char c; _Static_assert(!(cond), "!(" #cond ")"); }) & 0)
>  #else
> -#define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
> +#define BUILD_BUG_ON_ZERO(cond) \
> +    (sizeof(struct { unsigned u : !(cond); }) & 0)
>  #define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
>  #endif
>  


