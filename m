Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5F6645668
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 10:26:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456087.713783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2qgH-0000wd-0M; Wed, 07 Dec 2022 09:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456087.713783; Wed, 07 Dec 2022 09:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2qgG-0000uP-TY; Wed, 07 Dec 2022 09:25:32 +0000
Received: by outflank-mailman (input) for mailman id 456087;
 Wed, 07 Dec 2022 09:25:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2qgF-0000uJ-NB
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 09:25:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1763c6d4-7611-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 10:25:30 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7347.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Wed, 7 Dec
 2022 09:25:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 09:25:28 +0000
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
X-Inumbo-ID: 1763c6d4-7611-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7IYUOQqASEPZnhTEQb4SXyNr8qpD6T8ZJujLMXSXd/V1oIG2NoFHN8sPLdMHrRQ3UIGpLprA/SjsCpjqv/zdOj/s24ZCbikfVwSC4B0X8GN31qlV9+9QaP4XF+NFRpsJW/ZTGHCe0dLIg/9wBvRlLdOApOvU2lgOjFte6JBRBDTikiCVVENstrFhNaEvODFoSRDr6A184t321n0P94fxwiRtylgIceGZY4OWc5aCrvAyvi5xYmmMsvuhgU8kLOgQ8uorF+allDLuo0/azHthCfiEwekuXgpmzFcNUTQXumNICiZ+T88UUSim6EeCzXIXyfF4k1k/9zwKuhwCkrU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=befQWy8Fikc/t+cK+SzIW+b6RViL3BWxejfV8faWEN8=;
 b=HoGpRt8T0mhzihFcdamLjoWaHIfPtuiwB1pwu7D1KSuyLsP8avxA7ozyGm4rxWbbUY+UJOCezwu2AUtsYFKKR0spcwq4AvM8ngs/ugzAL2r5uPioWDw937LdvYI2OZXLKDT1FIXzFksbLv6+HwAAfSS/EBDirVw9EeAWWkah8NZjUU3qmmoiTX03CQRGrPEtN05WiysiN8JHVaQvTenyPUvzkpD1Jq7kl3vCc3brqMYJkHgZELuwg8mHC39ZQv4xoSkwrDXcvjPnKaI43ZloBuhEJ22o7YNMI+ZlxmLmDPaoNrbfxRxPJEA04786gt6ZMkjyJGPlUyfzLIcn4hDn9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=befQWy8Fikc/t+cK+SzIW+b6RViL3BWxejfV8faWEN8=;
 b=pir02oW5IUl2bRVUeQMZX8iPRhLLnGdRQklPDY3DMoAcUuRPcnwVYcKTO4L2VyF4DIZsSOUHrtxH/CnLFJv7YKSLnTh6uWnYp8z56uEaShvRX9jGpJlFGd1CEndHVEDnQxpD5VAfrh9EsXKfe1t5DR53VIE75/2HDIkxsyPxd70p7pjJFa0LY2FgDhXx3lSQg02CQdw/sR5iB73Pm50Mwd/JmjIOlRXnOAjih1GTjri37xEQ1kzrRaq57pAIA9ezBUBJKI/CJtAh9BAQwdvvqkdXR5uUJqfG5fhU261ZMT2Wv2bsFQKSg99U3CuD9FAPgpL5nonrW85YtyuWrjHVqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46128e5c-f616-38c5-0ab2-1825e72985a8@suse.com>
Date: Wed, 7 Dec 2022 10:25:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] xen/netback: fix build warning
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20221207072349.28608-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221207072349.28608-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b3a9b2-64d1-44bc-db36-08dad834fa80
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qJgMDle8pNgWKMu6ZLAl0sfEc42MwlnpbFUQVQGTq817hIYwAjNgDsZvznHjUiRZdRjpGtJaPaxtuOCcrylG6GwBK8xUsWCCV71YHHwFLsc3zBF1etbKw9nr6uRueM+YrEIZDB2qjHcOAyt5zpb3RkezZXGOya7ObOg+rfo0qWb3/xZA5uCHc+QjsAIVkqc9Ut1Uxga8OALOUYif/Fi1oagQ+MFvo2RITHQ2kNBg8gu3qFdPu56yPhAmCDwRYQVaPNlFMR4LWnflvtePTzKktpHmGGiA44ZmJH9Da0qs/2Xp9wLNTl1d4XkMXAByOISov/r671lpFCyGACA9JGFW1KC7Pfwqgf4m1DkvRqXrFF3BPf/LGxf+71DqcJGE1WZbNQoZWm1juUES80JRayo35/3HNb5vteclDewQmc1VTZG/718206mIdWHIMjSmhs3d7yzxosZwSQGV2mMsMT8pnaZr6S5autJjNJlb3HMSHhLapO1ceX0eLUEoYqGEzUutdHAYCGpxkDDeIDUUDf2t4OmN5xlqfzodN8xsmlbf/0KABsVw8nVecDreQCnIffeQ+Kzf5toMDPNDU2fdLszhlmwsQezThBq2LD1FXk62MwfYDu8gusolsFniKOHNuTXzZxt++yh18LZ5JYBqSUrJ07fucwzUKQTQyQauhblHNLl0XJvMDDW5zol7aVoDMmeYFcImLzX7ntKw5BqV1Q0YeFynxH0L95sa0G5V+YHOAro=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199015)(36756003)(86362001)(31696002)(478600001)(6506007)(53546011)(6486002)(6512007)(8936002)(41300700001)(7416002)(6636002)(54906003)(6862004)(66476007)(8676002)(2906002)(4326008)(37006003)(66946007)(5660300002)(316002)(66556008)(83380400001)(38100700002)(186003)(26005)(2616005)(31686004)(66899015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K202U05ic0RqdUxaVjl4bVFxd1k3MXhCMG5XWE85akprbCtJelphcHZYV3pK?=
 =?utf-8?B?YnhwK2VobEUxdzZWMVFGMndnaDFjNlovSE0zdDNJUCtQZ1M1b0dhbHBUUmFW?=
 =?utf-8?B?dUd1ZjNXTGF5b0poeVhVVDV0blkwM1RXUVFUeThwZkpDd2pFSE84NjI3dUEr?=
 =?utf-8?B?SHJ5OWNRelR1c0JVdzcrMDlnOFgzcWpFQUVENXpsK0RaNjNvcUFJQ2o3TWJK?=
 =?utf-8?B?L3JpY205ay80RkVJdFBSYUIvanFtMXdjQ1A1SUlCakpqYjhyNGI2TWJpWGZY?=
 =?utf-8?B?bUs4RGJEcloyMGZNS0ViSzI4QVJoQThqejA2VHFCT0dnQmhIWEtzRUMzUjh2?=
 =?utf-8?B?SldZVTY5TWt2ckZSQW1naFFLcFJNY1RJRldSaENsMjBMSjBxM3g2ZDBWR3dj?=
 =?utf-8?B?TkRSZkY1Z1dPWWRBTFFETUExcGcvRUViM3FSMjB2UVVFejRJSlJ1V3FTRkdX?=
 =?utf-8?B?NCt2SUdwRFY3N0pTVlFWM2xwc3FCVUp0SkJrc09la2p6VUxpYnRyVVdVeUZi?=
 =?utf-8?B?cER4aGpObXhleDRlMTRhT1JPK3FVWlVOYjhtNkdPVGl4Yi9sOGhaYnQ5Vk85?=
 =?utf-8?B?em9DNGVWRWkrMXRaTG9tb1pFbzVyTUNDbHJaQ3VuVENqRkIrNUFjbzR0cEh6?=
 =?utf-8?B?dVZuckx0NStlWi9qNkcxOG9iMmtnSTZMZmx0T3V3djZlUkwvcGdwL0V4aGRq?=
 =?utf-8?B?OFV2R3V1NmFRaFZqUFlqb3JScmNYL2F4NzNiZ2QxMDY0VzZBc0ZuOGx5eTZE?=
 =?utf-8?B?T2NsQTU1UWtFWDF4V0lDbXp0dDJpQm1YMEFGNUdha3FFZjQxM2tQMEJnR0dL?=
 =?utf-8?B?VmEyaDFnNXpibW54L20yVXl0eGd5d1N0R2cxWDhWMmVOMTN2dW9JTTY5VFEz?=
 =?utf-8?B?VkJWcFlNdnRjSWFoTHhLYmVvZXpkVlNTaHExVG9DY1YzY2VDNzMzMHdxaXFh?=
 =?utf-8?B?d0pQbVBxam9tNG40bk95UDBVTFg5M3YybzRGREJwblk0OExIeGRUMXBWdnAz?=
 =?utf-8?B?RGpLSFBxSDY4L1h5bVhKbTRGR3plM2taNUZxNnVqbEJQQmlpdWM1dThFcnBP?=
 =?utf-8?B?bHEwUENnN3gvdGxCa0FZa3Z5U2IwYzlKUWMwek5HUkFVczI5N2xPeGJEWFBH?=
 =?utf-8?B?RGk4MzlvUXdOcEtram1YWkpsMkQvT3JDMDNja01Ha2FaZzFWcmRIbmtFdnVq?=
 =?utf-8?B?M1FyRVZwLzNVbjM2UUZXcEhob0sxU2gwd3lQZHhSU1RvY2pzcHV0a05FRHZN?=
 =?utf-8?B?Y2RmdFRxVzN1dGhnTDB5cDhMdFljNXdhSUE3cis0dWJEcVZ5UHJrUXZMV0xU?=
 =?utf-8?B?UVU1UEpqUEduZzdKMjhRamxDelB3UW5tbHg0Y1RUbVdYaHFNUmpUQmYrcWxF?=
 =?utf-8?B?a3JVV25LZ3ZGWHRuZmxTa3lWNm9Icjg1OW5YNXBwTGxYelIzRGFZK3RsMXh6?=
 =?utf-8?B?cWIzUGh2eUZjL3Z2OWZDcC9jWitHcUFjaUl4QXllajg0QnZPdWdNbUk4NVBM?=
 =?utf-8?B?NGw2VmpIQVJnVTF1R3Z5c2pGa0dZVzlWYUo2bHo3KzJGdDNlSmlIR3pXOW9i?=
 =?utf-8?B?V2VQVWF5TzRLT1hTSzJsYU5xZzB1NnZaa3RHS3JqdzNpY3lSUUFpQ0VuWFBK?=
 =?utf-8?B?YW5iZGZoNnNURTdyR1ZTRWQyLzdHMVhYOU04TnJPWjhIVFhvODNBZEwxaUp5?=
 =?utf-8?B?Rm5BdnNhNnlIV1hTVlZFcWZRS2RlUm1hcUtmTUdscTJ1MXBSbmtka1FCdUY4?=
 =?utf-8?B?VnpZWVFjejNLb1UrbnB5anVCdVczaEZjNVFwc2xNelBEQi9MTVBPU2hjZVd6?=
 =?utf-8?B?enJHaURPc2tvNEtNTllGRTZOVTYyVWs4bm5sZWNlRHE4UTZTOVNINDNKVlF0?=
 =?utf-8?B?bmRxZlJlWEpsSFZBUkViOVF2ZHM0NUxlcVJTSnp5eWVpQWc0cmhCNklvNXps?=
 =?utf-8?B?d2lSSCtPenRFQ2RhTlg0U2xWSVM4QzBxU2VuSDRRcEZYVFRnN1NpNmtsTk13?=
 =?utf-8?B?RllidGVUWXlBcnU4RVNmMjhhS2hTb3ROd2VQamUzYjhwZGpTV21OUGR5aWsw?=
 =?utf-8?B?SklhSFcxSE5UNXorV1JBeThsSm9adytSYjBhMDhGMVFQSE51dGRMdi9wNExj?=
 =?utf-8?Q?brqmR6pnE71Kly4RvJmiTXYUt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b3a9b2-64d1-44bc-db36-08dad834fa80
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 09:25:28.0869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzeC4iZSoaCSMogRXjFz2zBWEfFH0y5BIu+xRyWTGLBNhNO8KmgThuuFIRThkMYqTMn09YBKMQo4fJHa6Sn3fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7347

On 07.12.2022 08:23, Juergen Gross wrote:
> Commit ad7f402ae4f4 ("xen/netback: Ensure protocol headers don't fall in
> the non-linear area") introduced a (valid) build warning.
> 
> Fix it.
> 
> Fixes: ad7f402ae4f4 ("xen/netback: Ensure protocol headers don't fall in the non-linear area")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/drivers/net/xen-netback/netback.c
> +++ b/drivers/net/xen-netback/netback.c
> @@ -530,7 +530,7 @@ static int xenvif_tx_check_gop(struct xenvif_queue *queue,
>  	const bool sharedslot = nr_frags &&
>  				frag_get_pending_idx(&shinfo->frags[0]) ==
>  				    copy_pending_idx(skb, copy_count(skb) - 1);
> -	int i, err;
> +	int i, err = 0;
>  
>  	for (i = 0; i < copy_count(skb); i++) {
>  		int newerr;

I'm afraid other logic (below here) is now slightly wrong as well, in
particular 

				/* If the mapping of the first frag was OK, but
				 * the header's copy failed, and they are
				 * sharing a slot, send an error
				 */
				if (i == 0 && !first_shinfo && sharedslot)
					xenvif_idx_release(queue, pending_idx,
							   XEN_NETIF_RSP_ERROR);
				else
					xenvif_idx_release(queue, pending_idx,
							   XEN_NETIF_RSP_OKAY);

which looks to be intended to deal with _only_ failure of the one shared
part of the header, whereas "err" now can indicate an error on any earlier
part as well.

Jan

