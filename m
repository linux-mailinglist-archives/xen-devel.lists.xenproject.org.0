Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 075844175D8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 15:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195394.348073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTlIw-0000bM-Fw; Fri, 24 Sep 2021 13:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195394.348073; Fri, 24 Sep 2021 13:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTlIw-0000ZH-CL; Fri, 24 Sep 2021 13:31:54 +0000
Received: by outflank-mailman (input) for mailman id 195394;
 Fri, 24 Sep 2021 13:31:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTlIu-0000Ys-Ql
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 13:31:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9c28bf0-fb40-44e4-90d8-abdbab65d47b;
 Fri, 24 Sep 2021 13:31:51 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-F9I1osO7O3CTDIhUI8FDVQ-1; Fri, 24 Sep 2021 15:31:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4943.eurprd04.prod.outlook.com (2603:10a6:803:51::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 13:31:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 13:31:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Fri, 24 Sep 2021 13:31:46 +0000
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
X-Inumbo-ID: f9c28bf0-fb40-44e4-90d8-abdbab65d47b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632490311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcPWF3Ey9MNZejsP0eOYbzs9p+6nxvxxT3zaAA/DYik=;
	b=UUmJ7J+ie3Rr3yq5Z9+JOmZJvAOM7eXVU93ld8TSG4SyLMFvwhSC9oE9sHn3ToMKdhY0+p
	et5Yy7X7wd3LX2KXgKnLbMPON5mI/Ie9WaWge17AyeToJ5COgjkQzHI3vfhMhocQwgyafb
	fGf3VSmvkmvsFl/9S3Z2w8v0aH0p8kA=
X-MC-Unique: F9I1osO7O3CTDIhUI8FDVQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRBh+LHNf/otLKI/ih3o9SnjwsMXnAKw7lAHVi6s4ecdXF54myEp1zJF8qHJpMLOFjMxwKGwsYxlSSGtd9DLCMkAvpwPd4t9U3wvi1NA7mBU1e2DK3ehVWvAW8tmbtePXhBZ1UcZzwORsFrTe/BY4pbJK9FRTm6JGGpmllfl3ajy1ISDS3iXHs9CwnedpToJznP5VjL6+FXGON8sRINOwNfP5FKvnNjylfco0ZO3Hj20ENcrw0HjIhHgOugcRVzs9cH1GJC/Oe1oDH0wuPJraiPPz3EoZoFTlrKFFZlYUgtm17Rq77+745gRl4uYs9aOStRoQrWV8SuubAiOIYZANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wcPWF3Ey9MNZejsP0eOYbzs9p+6nxvxxT3zaAA/DYik=;
 b=M9fQjPLdYYlnndjB/B+jbzRshzB3jngw4YQsQFHKB/BgIGCmTxVrDxmSs9aH3xaR2x/NaDmjMlIlt8QnjZm65CKzqsg+Vk8+qp6wvYDPeS37W9M085ee1iMQRPmkX5lOdJ0y0ME5k2EbgOUT4TkEswogPwHgu7iH1AtLIqkLtZSnxuYMm5u/wbg9s8iSz+6WhTLfwNmR2jIFefG+AgD5VW45iUAS/ni26buW6rti5gkkrAkJQdLA2ysE2r5ZDTR2bQhMwgu3lz3o3EQFL1ibod1IsRyGBT/gUAY0+B0B1StkFF5RmMpf9TdGfhxlHwvstgxIAGYyUmGwDNZHRNDuUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2.1 15/12] xen/trace: Drop old trace macros
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920193302.20275-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8681fd36-2217-90f5-89cf-648caa47ce93@suse.com>
Date: Fri, 24 Sep 2021 15:31:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210920193302.20275-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bed2296-9b79-49ed-ae74-08d97f5fa888
X-MS-TrafficTypeDiagnostic: VI1PR04MB4943:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4943CCEE18324B350AE99708B3A49@VI1PR04MB4943.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i0e+Gr8t7bD6Wd07TePdzf2inG6R+dvE86qOqCXQW2SF642vSwpTsb2gdHNPYw6VyxHMRqr/sG9LbMCRwNjRgl8S1ImDKS12xc/teJ1wsm9lpH9MQZHr9C5yv8/qaP15W6fEvU1nRxz+VKMZ40r52UynzvX5r6a22kMaQLeq6G5ht2Zn52ddkfaqX8Xv1eiHT+kjChZj/UWd44CooiIHCS4apNh7dz8w7TEnij9Icf6N+lTBWCk1Do4oZYQ3iM013keKQU92SwBfDN3jIfPAXuI/1Hre05esAM1NYkhta4OauIYQwEYV5Tfn2vMxu2BkFwd6zyyLXjj0l0EdbPB0msi5pHTmc03On2PP786hbOKHMj/Yah1XI5q05U5v+Xlb0F/p+pzDqS1oMffpIXXsL8h3N7Lh6Jk0Y1/hqCOxKjQIOE0uJZgIQtpBHdTCl7ShOoqoU/GupAGrskacF92qOLTOfoNBq7SF4axDiMe6Qf6L6mYA73rlErBMsvgObYRwn+/WNTbssXOivwh4V1v24xXXH/8JPfvf3JhGMMx35znfLdIJM/TroBQ39qLhi1J0nR4quaMc7q2Co41Iqiw92dPvhjk9W2vBE2tUfLgIswfwO/66rE+KjH60S+BVBUpD3AXLzv8asQYME8rfFH+Eov/vT7RjDa+sasWhfpDWt/dbzgr0jilPvD6L7apgnZRxcM3nJ1DS0LWago5YzjymNjRc/KN14Hqodb9CCZ6mTL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(66946007)(66556008)(66476007)(36756003)(31696002)(6486002)(83380400001)(54906003)(86362001)(16576012)(8936002)(316002)(8676002)(2906002)(6916009)(31686004)(956004)(53546011)(5660300002)(2616005)(508600001)(26005)(38100700002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE1yaExqd2paY2Q3ak8rR00yY1puYmlSUGNhQStoclF5VXpSZEZvY2xIcndP?=
 =?utf-8?B?RUtpaFRWNjI0WjFNLzdySlAyYTE2YkNDc2ZVRmZkMjVJZ1k2bjJHRHp0Vmd1?=
 =?utf-8?B?UVFROEp6bVFHWXc2emczeHBqR1pSb3RWRTBqbWdnQ2NhWEIxUWZPOHFjbStz?=
 =?utf-8?B?VFNBMXNmTFdMcW1aeE9zQkl2MTRCRTdXZEFiSjFNTmVxb0N4ZlFxcFhhUVg2?=
 =?utf-8?B?cDNWOE9QeWNGQUdQTEJ3ZmNPZS9LY1RaN1diSkpnTFBCcitVNkl4VTl5UGNk?=
 =?utf-8?B?WXJ4OUhMMnVPeW44K0JxT0U3SjZHVjgyZE1vMkh2QlE0U0x1eERuRnI4S3NI?=
 =?utf-8?B?OWlsdE5KYlA1eXZVYUQ1blhudzhwalhmYnNicjRDbkVtaVZOOXFtcEZuUU93?=
 =?utf-8?B?alNsUkVyazlUZ3NGcHhoMzJ5aHl3emRKMjFEN3o0Ym1EWmtHWlJIZXdnemRl?=
 =?utf-8?B?VWY3dnVOaWRvdHkrc0FYODV5QS85a0JNM1F5UEFKNXpQZGtxV2NnUkZFSzYy?=
 =?utf-8?B?K1NkaWZQdGU0emZWQzZ4cTllaVozeVUxdWxqenNIN3NGaW5XRkFGY1Roek05?=
 =?utf-8?B?OWtHZkRVNFNncWRFV1E3SjVBaitNMVhNbnhRTFdTUHQ4bVVIbXZkdkJkQ2kr?=
 =?utf-8?B?dVM1dWpkR3llei91VVFMZWhEQWV6N2x2V3RaRjNIMDFLd09yU09sSGtUeVp4?=
 =?utf-8?B?NS9jS2w0S01jVUh4M2YwRmtDVzU4QXVpVWlsMG9aWVBqUC8wMzhVRjlTR3lK?=
 =?utf-8?B?by93TFJteTVublBNRXdiQ0RSL3VSTzlmK1k0ZVJzMFZrdlE4c1lKTFFrRFds?=
 =?utf-8?B?dTNCWldaWnUrM1NZT3I2S2JlMWtCRkpDVjZOcHMxcjBtaUZ3S1Q2WFlpVWEw?=
 =?utf-8?B?N0JsZmUveHFNVlVUTWdCeGU1anJnb0ZpMTlzejhhL1A1RmZYeEVuTGpPVVVT?=
 =?utf-8?B?VENXbGJrTG5KZzNYV29SOFI0Qy9VM0JFVWlqWlc5SHBIaWJFa0tjdzlJNVls?=
 =?utf-8?B?RlRobGhmSitORllXaVVaLzdXWnNqSkU4c01Lck1rN1V3KzUvNTd2eHJMZllO?=
 =?utf-8?B?U2pwT3E0bHpsQ3FGd0gvNEF1RWl3NUxnZnUzUXdpQkF6TVhTbGF2OW4vdlFr?=
 =?utf-8?B?em1lUHJLU2ZKdXhTVmIwVXV1NlZvRGFYVnlNeFNINlAzem45VmdOYkJtQXJG?=
 =?utf-8?B?LzZyd1EyZ2NKaGFjdHhtOXhSZUpjYkVVMkk2TER6TCtLeEFwWHBROFNsN25J?=
 =?utf-8?B?ZDdjNmc0dnY0c2syL1BaVzlZaXlFUmhORnU5OGJ4WVlVUVJTaUNUelI2NFNx?=
 =?utf-8?B?VUZ4Q3lXWitxOXY1alBWRVNralYyRU5EQk0wK1NKNFJSYWdza1E2TEI3cndB?=
 =?utf-8?B?MTIyeVhPQkdVWkg3dzZhM0ZidTN2d05majVXRjFYMWxzL0FEQmh2Qnl4VGs4?=
 =?utf-8?B?Z05rYUx1SkdvK2wwU0F4WWtVajJTOE90UkV1emRPWHJzOHNmNlVQTXZXdExP?=
 =?utf-8?B?UnUyUFYrTEJ0S3BabkVpZVpiVDIzNFZ2bUFydlRJUDlISmhLSkcwcTU4cklF?=
 =?utf-8?B?N2k3bUhBbGdsbXpBKzVaQTIrT3l6SlJ1enF6NXk2dU5GemxFQkVucWQ5Y0hl?=
 =?utf-8?B?LytVUE1LeTROL2pQdTdHSE5RNW9VOENwVmhueWlNTEp6R3NTOGNSMlh6K3Fi?=
 =?utf-8?B?RGExVnBlWjFCMjZsSFJKTXU5Rk83ZjJyeHVlOHV2aVVsSGpWZ0RaeVl2ZHNR?=
 =?utf-8?Q?VZ75o+AppmNlPGjrZsoPUIas2bsRRWraF2Cr9sW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bed2296-9b79-49ed-ae74-08d97f5fa888
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 13:31:47.7075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7bEUW/JCUuc9Ls6C3pXDyKPcBT6td1chXLaBirOELDeXQK3IlXGIwOLUdxt53Q0+LmfxNrRvHPHDX8Zn58Szw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4943

On 20.09.2021 21:33, Andrew Cooper wrote:
> With all users updated to the new API, drop the old API.  This includes all of
> asm/hvm/trace.h, which allows us to drop some includes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit I'd like to note that ...

> --- a/xen/include/asm-x86/hvm/trace.h
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -#ifndef __ASM_X86_HVM_TRACE_H__
> -#define __ASM_X86_HVM_TRACE_H__
> -
> -#include <xen/trace.h>
> -
> -#define DEFAULT_HVM_TRACE_ON  1
> -#define DEFAULT_HVM_TRACE_OFF 0
> -
> -#define DEFAULT_HVM_VMSWITCH   DEFAULT_HVM_TRACE_ON
> -#define DEFAULT_HVM_PF         DEFAULT_HVM_TRACE_ON
> -#define DEFAULT_HVM_INJECT     DEFAULT_HVM_TRACE_ON
> -#define DEFAULT_HVM_IO         DEFAULT_HVM_TRACE_ON
> -#define DEFAULT_HVM_REGACCESS  DEFAULT_HVM_TRACE_ON
> -#define DEFAULT_HVM_MISC       DEFAULT_HVM_TRACE_ON
> -#define DEFAULT_HVM_INTR       DEFAULT_HVM_TRACE_ON

... least the part up to here as potentially useful to limit trace
output. Afaics there's no replacement in the new model, as you
invoke the base tracing macros now directly.

Jan


