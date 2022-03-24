Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 246B64E6203
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 11:59:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294238.500203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXL9s-0004Py-0Z; Thu, 24 Mar 2022 10:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294238.500203; Thu, 24 Mar 2022 10:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXL9r-0004NJ-Sz; Thu, 24 Mar 2022 10:57:35 +0000
Received: by outflank-mailman (input) for mailman id 294238;
 Thu, 24 Mar 2022 10:57:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nXL9r-0004ND-18
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 10:57:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34e35955-ab61-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 11:57:33 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-IlhYfJWaO2C7WhTokMpuVg-1; Thu, 24 Mar 2022 11:57:30 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU2PR04MB8903.eurprd04.prod.outlook.com (2603:10a6:10:2e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Thu, 24 Mar
 2022 10:57:28 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5102.018; Thu, 24 Mar 2022
 10:57:28 +0000
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
X-Inumbo-ID: 34e35955-ab61-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648119452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1cOJGGdFUrOU8OTTETiNKtBvsn2MASsZFruwBAOawCM=;
	b=bNiapmX33bq2vrFEy8BNMjTIGQX/WL1DRZDfSQ8YCT0pQ76mIo/4mPeAA+HCFjb6pbGz45
	oQZIpdan6QyDDWPRzHZxsGi5Q5mQ87wEXGhSNQRLSHpgsaBnrLsa0X2nAqbfaim+pZiUaM
	V+UPEQqIeNItUjW8iBiPJJOyMnRAbFM=
X-MC-Unique: IlhYfJWaO2C7WhTokMpuVg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGANbBnAwEtj0/u47N/NEWPmwRsbWIZaQl9oKRZLkj1Mi9cJBZrsNiF/Vv7AHxixmRhTUa6PC8UpXMbUIxXTWKb2Ny9Ch4KBIJ2mNk4DvPkCpUrBAvMB7zn6X8BY2XdSxAUGkjN+gQ5NDQEQZZgvKAmf2M5Yl+v3uwYxIYPe5DuNtGL+2GOYkuMhaBn6IEGq157JG3Y+guGI7zXS4rKSEK5m7IeCvhaZFdlBKmh79jvqLTGAO6dbKXYWBsNKNDylkaLtXTBfAQYJuOHPdcDnPQTw/Lb96+GY0xERWjeJS9AOXxF3sxRfra6YrhOCIAA4dyw9hurVW83xZB5UOkR8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cOJGGdFUrOU8OTTETiNKtBvsn2MASsZFruwBAOawCM=;
 b=YIUgtwryw43qXKOBZBvtMDDWT0m/WyP47sPpuNqgvLwgmITxqlDTP8zrsLpLoapAoveU01+u+3dNZ8akaeoBsJoymNGz69EynkkDxlakCFuBx7Ty3sJ8VBVehf9I7neYWw7Gas5NoVQbU9rrB2YQJBEd5/HSqSM0Td08tslK38LlFOplBTXxFtyBvSDNjw6Cp7DV8o1hyGlPCTkn8JXFI40fjeAuAr+F/hI7wcj8uYQBZz07DldjG/O58uAxpJOEgKWk3oo4eTJNJTrTJGIGmN/8ducof4qbsiMgwVFy/a8EJS/uRqrsfhcp1Sg0Zh+djqub9+7Kz/VCo/usBEP92w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c53e65d5-82fa-2cbd-c49e-94a3935c2b7e@suse.com>
Date: Thu, 24 Mar 2022 11:57:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 03/10] xen: harmonize return types of hypercall
 handlers
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20220324081312.18222-1-jgross@suse.com>
 <20220324081312.18222-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220324081312.18222-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0028.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd594663-2401-40c6-aa7d-08da0d85160a
X-MS-TrafficTypeDiagnostic: DU2PR04MB8903:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB89031B95C0701CB622706015B3199@DU2PR04MB8903.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	As6mPf6VrSBD33rLyP69yRub39QfmtoXcduQjokaxVSbWnAC85Px+1vi/q3liz+Wa3CXN+FQDMsENR5cKtTAeooY8PnTiwT6jIk32C5xlSzdbkjnBKKc1aepuh9828deZIg7lX0xn8t7VMbhjMyD+YGoi5FOYjJGyf9TZkufQufWUj24J8Scfpq5vnJqTPJlijquPBX70m8ggD8iFkH59RloLCO4S7bEKc9Vh54BNohYnfg8ZvX7DSOHbT20RAb6cjvW0QbRcQG4VXUxU146gRJD8V1BGSJnEe+jM1GAJIR8g0HBFdAmr5kAJ4Jg7QUN0jc6KxpkEPLCnK5JiK3zhRyGD3ccgH4kq3AXxSEMBmgGxV/NPxpdWpduuExhOcs79NBjUNkF95lpUr/pmu+NTOVWjvK/6o1r53tYP3SH9kI+4ygmDLWIZa461hJ2DGjhw7i8Y/tvsVZhgW8mJIUJipliT0XucUYNVpXKRoo7dZYT7AbqOdK3QvPaTLTHrGUqjf2dD2+kO81azZD5KO3j1yjtwIYBKjxxCy/wxv92Iwmt/useQttCxO/vx9qMUjiTHXcBdGBK3FDr9X1GtQbaBKzaMaw/JY5MgF3HXh+fB6pk8gcZ23DZxmPCJZQ4Myybi7v2TvHag97nHL8uPvsg/varAs84pNi9cl2w7XLuo231ckBs8Lql3+06njkP2ZKxjPjJPsiU7tr17i5xcdmyX/+IXka0S0ntXYY7BfvCb58=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(36756003)(6636002)(186003)(316002)(2906002)(66946007)(6862004)(8676002)(83380400001)(4326008)(66476007)(66556008)(31686004)(6486002)(5660300002)(508600001)(37006003)(6666004)(8936002)(6506007)(31696002)(4744005)(54906003)(2616005)(53546011)(6512007)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWs2YTZFa2ZzMEtaZHoySXkrR1F4aFhqUzRxYmh2MGErUUZZQ05sQzlMdkp4?=
 =?utf-8?B?WHB3U2txN0hVOE4xZlI5NWNtS2YwK0JEay9YRUc0WDRaWUJITGhETUdSNmpZ?=
 =?utf-8?B?UjFJZ2praFZrWmJTb1hXSkp4aUg0ait1SUFBbEovV2c1MDdEeExod1dZT1FV?=
 =?utf-8?B?SGlOa2dZbU5TSWJxREdoYUdwYW0wV05qSUVmRUd5VDFLbjFWalh3ZEhoc3hN?=
 =?utf-8?B?NjRHaEcvc1grNUhhbmtPTDVjaGFTUlF2VFBmSHRJRnhWa2l6ZjdjOTNQSHJM?=
 =?utf-8?B?QllreWYyR3FsZ21FRlRoNFNqZ2x5UzFwY1dWUithZ1F2a1ZVYVg1RHJuamFE?=
 =?utf-8?B?Y2t2SDQ3Y0JsU0lwZWJIS0N5QjdQTUU4b3B5N0k2cmY1akRwL0RsaDNrRFJk?=
 =?utf-8?B?WWdHem9PU0VOekxoUERtSnMwWHdLOXhhZG41UzNrVGRaYnMvWGhZRmF3Rm8z?=
 =?utf-8?B?VHd5Vk1hQkFtVStMRk5XVEoxRWd6RmFDUHNVNkl0cXJ0bExEd04wTmo1WlU2?=
 =?utf-8?B?WWU2eDhkWmYwa2FQNU9GbEJmQTVDK3dYQmY3UFkxTDI0OE8zMlJxeHhtUmNk?=
 =?utf-8?B?M0Rxdjl4RThQS25TamQ1ZDFYNWlyZnM3aS8zNDhaK3RFVzh5eVpoeGxncTVY?=
 =?utf-8?B?NkxUdUtVTmZNQUhyVzIvUnlmVzI3SGY4NnhCVzJrSGtBODBZWEJqbjRudGl1?=
 =?utf-8?B?K21XME5VUE9iSllPb3NKN2JmSDhUR2haM2pWY0loU0R2ZHVpT281TmRlS2pN?=
 =?utf-8?B?dzFvSGprMlk3UHJwc2hGVEx4RWM3UmRVcldVSTV4bitCQU9seFdnTVRkU1pI?=
 =?utf-8?B?cmZPaHo2RXc2MlpZb2c3Y2E5b0JOMEMxWFdjd0NzS01PbVlKOUEvVERlUFk1?=
 =?utf-8?B?WUpmazFVRWZuM0syUThJNzExWjh3ZXhBbjdSZEE0aWNEdG9oRlViYzl2dmNF?=
 =?utf-8?B?TVlpM2hoejVkMUhxTTZJaDdWZ21vWENaYWxIM2ZUaGFUYmJJL0hJdWM5VUxt?=
 =?utf-8?B?ZTA3aUVHOEdDaW5uWlBkQy81aG5hZUYzSWlXeU9iV3NmM3RKUWN5ZzYydFV2?=
 =?utf-8?B?djdMK0tpRU5qZEtmNE1uL2E3blYzbWlQU3d0WmpRZ3puNzk0WVk2ZnNob2RG?=
 =?utf-8?B?emN6Q1VBYkpjaWRKc0RRalY4SWlLN2xVelRkN1VCM3R6Sm9hRHdGSmY4THZs?=
 =?utf-8?B?NkQvcGxRQmlSWVN1Z21rVXgrNnlrbkJXN0svVC81UzRETzhDSEwwZ29SOHZ1?=
 =?utf-8?B?U0pxaGc3ZWhCQkdZRWNZckVLS0pGV1U4Y0pkTXdmZENyU1Q1UjFHV3JQYmNS?=
 =?utf-8?B?TjR5REJxVDhGdnlhd3dXQkVHUHpKZkxsNHBUdHlBa1FaOVNwYmRsaXJkak1v?=
 =?utf-8?B?MVN2VXRRUUFCU2REUlJyREdiTnI5a0pycHNJRnpPQmhYZkFaSmNNc1o1SXEr?=
 =?utf-8?B?d2xQbitMQURmVHQ4dThJd3UrRjcva2tOZ0dOOVdXSytNNXVHblFUekw4Tkc1?=
 =?utf-8?B?NlRPT0loWURLNjR6YVppU2hSRldsVEdnQVA0REprYW11akJuK3h0QkxRNlRP?=
 =?utf-8?B?V1pYQ3VwUkdFTTJlb1p0OFFIUjBtTnp3RjNrWVM5UnpXekV3THNtcWsyMlhM?=
 =?utf-8?B?SkplSWU5K2VIazZnN3lWSXo0TTNuTGRyc09RUUhOdWg1VzNwakRsMExhZ1Qy?=
 =?utf-8?B?WHJ1dXQ0WTRJM0cxVW1pdmd2UU5HWGo3YU9yQUpRSndzL1NDNWN3L205Q3Yv?=
 =?utf-8?B?cUwwUEwvdFRzUG9hMVhmZTNmMXgydjlkcTBZMHdlUW5MNWM0endqSmc0VVBB?=
 =?utf-8?B?b0xSTkV2N2g4MFhJRmprVjFYVzErMjJDMnNGazdTVUdWS24rODFRR3h6Qkkv?=
 =?utf-8?B?bEVmc2wyYXFTTEI4eVZXWFJxN3loRmVRWllkR3oxTWsvbUwxelozcmRWYWI0?=
 =?utf-8?Q?fOlUz0cdQQPaEiB3OzBVdhR0gNT/IJSv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd594663-2401-40c6-aa7d-08da0d85160a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 10:57:27.9361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLuTQXNUAa7hnbyLvZZR93GOBOe2WdxSVjOsTdL0h6yCxkdu5EEk78O3UmVkLW1AU4t2jJAtG4hJ0Xb9okxiYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8903

On 24.03.2022 09:13, Juergen Gross wrote:
> Today most hypercall handlers have a return type of long, while the
> --- a/xen/arch/x86/x86_64/platform_hypercall.c
> +++ b/xen/arch/x86/x86_64/platform_hypercall.c
> @@ -4,6 +4,7 @@
>  
>  EMIT_FILE;
>  
> +#include <xen/hypercall.h>
>  #include <xen/lib.h>
>  #include <compat/platform.h>
>  #include <xen/hypercall.h>

So I thought I could apply patches 4 and 5 alongside patch 1, but patch 4
contextually conflicts with the change above. Looking more closely I was
not able to understand (anymore) what the hunk above is good for: It adds
a redundant #include, just for patch 4 to remove the original instance.
In turn patch 5 then also conflicts, no matter what the correct resolution
would be in patch 4 when pulled ahead of patch 3.

Jan


