Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D94C6CA96B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 17:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515337.798087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgp0R-00057z-7N; Mon, 27 Mar 2023 15:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515337.798087; Mon, 27 Mar 2023 15:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgp0R-00055G-4L; Mon, 27 Mar 2023 15:43:35 +0000
Received: by outflank-mailman (input) for mailman id 515337;
 Mon, 27 Mar 2023 15:43:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pgp0P-0004wy-KT
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 15:43:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fddfe64-ccb6-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 17:43:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9940.eurprd04.prod.outlook.com (2603:10a6:10:4c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 15:43:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.029; Mon, 27 Mar 2023
 15:43:28 +0000
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
X-Inumbo-ID: 1fddfe64-ccb6-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRl4O6wZ11Kjx9jVKw5QN/tqnCiLHUzhXplr7bsR+MDme66Re/L1Rlua9Vd1AL3/VNR6McazksYQw0BKTVNLwtWNjafP/plUKEpf7qgqttO2p+mhukA6WiKOZb8b3SeE/AOFFBMYYwzMr+so7crb6gn1EFJm1rPf/Vye1zcplEjz1RgZu28teDqwqNBfJjcm4qeimYDXc3u8rzT14Ceyhb4GzX3QSSnu+kF4TL6mgpFErT5maWOzCxwqpVJzXo9a1xQZ4yTmbXIJr2FqkGnK+gzmdXwSVG/+kWNC0cbrMAOypoumKbKK2+Hra+981/qHvzUFDNvJvU5R5mdz5pyXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UY4KiqS9tzYsjtxXB2qDMvweTjlc6i8zYTxrnAk30u4=;
 b=M7kbkmUxlZqmrr9lbu0sDG08w3+jj7RJXjE59C5XMzuEvY8lQICk8dhmTD9MvTq+Roa67km7IPR2YfM0LOgFje3IMm1lu/KxghaPUTzx4twwz1quOZhBmAE+rh3IcWdGSvRqDo0/moSo7safKY63oxcbYncgiKIPiwyG2Sv1WwZy7dFAln53iiFclrLhtLTg8MIcD0X6DZLPTCJO7K6tuuDhdJ2TEdFYio1s2vGp6/7EDwNrbHy4fQKJR6jzAKfzIQO2fCsoEo4uJOvBM/PX97mJFt38RK7y+elisfkZKmgvLIxi2xSO9ocqJvd9zmOn68OIThvUr9EtISwb5531dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UY4KiqS9tzYsjtxXB2qDMvweTjlc6i8zYTxrnAk30u4=;
 b=LbD5/Y6geG4FNpEah/h9mhO9xb3feS37cKnbQDluh+4bzVZLrikGo0QOqsGjpXuwl/bwDxXDadsaBcYxc58vmWtMU05MK8vBSTz5IQCVC8NSVXDuAsgJmMBOMpz7c6PvKWbpoSQJPR08zxMpZPjrrV8i1MJ1HKlVafOIGT1wrw5z+Jq59L5iJcx0CXXuZPiKpgYuUIozZrd5FxKbMxHqExDwMEgmOCtcyadXPDX4sXnTXVMEvqA9Ach/Xtz/GnTvjeBTRqov5MwbRWifWwxf7QvhhoXH6FNqr7dzfgARKaqhyvkdyYZHATepzmnEZqGTi4Ku4hG9I8jAGGeOILi2EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d26961b0-0c13-83d8-9102-37e1e297fc4e@suse.com>
Date: Mon, 27 Mar 2023 17:43:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/boot: Restrict directmap permissions for
 .text/.rodata
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230324220824.3279825-1-andrew.cooper3@citrix.com>
Content-Language: en-US
In-Reply-To: <20230324220824.3279825-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9940:EE_
X-MS-Office365-Filtering-Correlation-Id: cc8e3dd6-2c9e-49cc-b9e7-08db2eda0238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6VXxEcEYc//cYpmb53MlGf5suXJWPIDQXXZMXWqcD0uH6VsoQXD0C42VP1tcbOytO+LrG0HMnsNKH8aoQ8PFgaDCgI7ylGE2ANQmJA40oDuHHKgB1H2J6fBFlaowWUPUrOIMuWXc/TXyxvSBMJua+801qSO8b5t0ItAIn8HzUoucuwgl4xbptCfjQCgX3SxBGXVJ3bTNmcp33VP09NBWMSm7M5pGahk4cYH4vNuEw70MmvVpDxWJSaJUd5nVVus4hIdabtQqEvEIWkt76qsNj/cAG44KJFPuRe14hyVN7fvG7/uo9WnCyPdXvvDy/0vRCR6B43j426dvr4oG42uOK1/IBzW3qenOGkm9xRaTsag96Tvuezo1bkgV9SNwHzNlVD+sTxBgV81ebNQ3fgL4E7B+EIq/00p6jBy9LkQ9sKLVnyW7lW8q6nzM7byZqGfleLJHwAfExUyEXdn6Knfgru6tR/tIdhIZf7k1VY4EzNAx6D+VTrngPic0CpqRdP65Om1G324gXHMGjWpJuflxunTaiai+AzM3+qCCpG87iFc/Ejz5qIkZJN1KR9CQKm4Zde/up4uEo3BltPrRe+lUsCxcIWEmF2LKujlyZQLYYTNEa8ey/lBMOOC7kSiFlvVkY19D6grK4OhFQEjHkLBqEvxau3gqBwkKIkihWUgrUKcfJCLbMsT61/Dg5MkPabxs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(31696002)(36756003)(86362001)(38100700002)(2906002)(31686004)(478600001)(6486002)(83380400001)(2616005)(26005)(6506007)(6512007)(6916009)(66556008)(66946007)(54906003)(4326008)(316002)(8676002)(66476007)(186003)(53546011)(5660300002)(41300700001)(8936002)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXV4NUdici9DRzZ4OEszOTZLZlV6RzZFQjFpVFZ3bWNEUXVnNHdoN2pJVGN1?=
 =?utf-8?B?d0piUUFUY3AyR3hTUktEaU9tODVwUEhuM2V2SkRXOStKVmdjb0VRQXdCdkNz?=
 =?utf-8?B?c1ZsdGNnWmZVYzVrcFhORUVKUnh4S0FheEVaeGdDL1dxS1dNdG9SZ09MbmY3?=
 =?utf-8?B?cXFvWEpoREJyb2pvYnJOeU5mckNldUpLU2MzaXdpY0JtaCtOYVlHaWh3eEV5?=
 =?utf-8?B?UitVRGg3Q0lTNFNWYU4vVFVYSVFxTUUrOTVvOU1rRmJXMlViVDM5bHdtdVZQ?=
 =?utf-8?B?T2pVMmV0YUxxU3llVGc3T3Y1bWpsTy84SmtFMG1tYXlpdlgrM1M0eHI0amU3?=
 =?utf-8?B?dm12QXJUSlNHYkgzcUpKMzRPVnQyMzlDV0VQa1BPbVB3eWRuSVBVM1VhRXV4?=
 =?utf-8?B?ZndMN1lId014Q0g5bW9LYW9FZjhTZ1FoR2dzTHR0ZjBWbmk2NkRBbFp3TDZo?=
 =?utf-8?B?QlprQ2pSYWc5ODRkK3RPbXZhV2EyY01JVG0va0Z4U3pETlJCOEc0VzV1QnV0?=
 =?utf-8?B?MlNieEtjWTVla2VFRzJVcnpJSkpkNCtHcjc5bU9sdEpnNzErL2I0RkZaZGxr?=
 =?utf-8?B?VC9aeHhla2FrZGQrU1N5TVhPaitOSVVXd3ZWdWhHMk9PZWNxN2I2a0xnS3g1?=
 =?utf-8?B?ZE9pa2R6VmxVazIwM3I1NDNRZnhBc0VBemw1Y0FTQ1hiMzRSR2RWVUprUjJu?=
 =?utf-8?B?QTJpeWVqSGFQSWNhRUVlTUFNZ3dOMFdDRGpvRlhyNlJlbnRwQmlwMXQrOGow?=
 =?utf-8?B?SDZzZnc0Tll5WU9jVzZGZ3hIazl6MUl5L2JzU2ZZWGhjTXA2bzNOQ25yVEpa?=
 =?utf-8?B?UjFUWFc0bXdlM1kxc1lyU010ODBFcFdUVEthdStLL3ZBUFJmRnBlWnJ4dzMx?=
 =?utf-8?B?YVF4TWhvVTZsY1RFdWc4MzJjSHJvRjNpMTFCRVJzM1E3YjByVFNlY2wyQUhr?=
 =?utf-8?B?VElKTzVZeG9qZ2phVWRzVjRNTEd2ZXkxd1VNMW5QMS8wNEI5RlEzWmNHdFhw?=
 =?utf-8?B?UEZ0WEJOTXJ1ekNSWVk0WkxpQlhFNjlZTEk2SVB1aENEQ2ZLM1U3T1M4SFVj?=
 =?utf-8?B?RFBjd2RIa1ppVWowV2lsbENPTzloVGpVSTgwRDJ1cEhqZWRRdnZpVVJkSTAz?=
 =?utf-8?B?WkJkQ2NqRTk4RVBCVDR6QmRzdTVBMWRaMzJpRjJseWJwRzVoUVRxeHFmUTg2?=
 =?utf-8?B?ZkxFY2t3ZTRzaE4vZDN2YTMyR1JSK3EyZU1vcjg2V2JPRlVGdXdtM2hSZUh5?=
 =?utf-8?B?bHpBT0dYeXBWK01BdEh0dXo2SVJYWWpJYmdOaGZGeVdjZjVVVzRiZzFwYkZQ?=
 =?utf-8?B?NmsreDYvbUhYZE9lMzJUNjd1bmpoaTIvWE0yYmtGZjZ1SHdmYmdIS3dNWHVz?=
 =?utf-8?B?UnhaWXZxNWNreC85RlJVMnVXcFUvNDZUU1ljTHNvSzVMNmMzM3NzWGtTd20x?=
 =?utf-8?B?RUtEdjNlTDR5cStyRWpPaFIzb2NobHZTRlJiSjBZZTRxRkFCL3NUcEErNlBy?=
 =?utf-8?B?ZWtOb0VmK3A5NEZ0Lzc0QUtvVWRKVEZ6Y29ZcDZTb3lIZHlwQjJzb2l5QXJ6?=
 =?utf-8?B?cGl4ZVdvOGw3Mm5SK0RsUUYvTWp1YXhrT0xxRFAzQmtSUStKMTMvWXIvVzFQ?=
 =?utf-8?B?cXp4M04xSGdaQ2krOE5SWWhYQzVQd2dycGtoeWFUNGhJNE96dFF6eEkxSEtQ?=
 =?utf-8?B?dmxiaDRNaC94UnBkbThzZGdiRVN6VmY4MDhRK0QvUXBHdXRTczExYmNXaDgw?=
 =?utf-8?B?OWVDYi9nUi83K0F5SFZhRFRsQVVETWl1MU41Z1ZxT3dCb2Q4VDU4SHBITWNR?=
 =?utf-8?B?NFhKWWhreGZFQmwreUFob25NNXRXd3NYWXNQQ0UrbjJXc0ErVEhoVTBtU3Qw?=
 =?utf-8?B?RHJ1cGM3NGliRE4veVZqUGQvQ0QzYm8rcGNobU5KZ0hXZGJ4YUdqZkQrMjVi?=
 =?utf-8?B?SXUyanpIdjVsMEF0TGU0cElhY3dIYlIxWHZaUCtWUER3NlZ3K1NNZnJ1TXVZ?=
 =?utf-8?B?ZjhmVHVCbWQ2MzBKR3lLNUZxNktvMm9GWTNqWDQ4MTNoVCtlWDVNcVdlRVVo?=
 =?utf-8?B?c2JYMllQQTYwbFFXOXhUcFV1TVo2U2gvNTR5N1NLN2VHWWV4dXl6Um5qNjl2?=
 =?utf-8?Q?GWC+IatSjHIuYhFHzmsmZXHXS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8e3dd6-2c9e-49cc-b9e7-08db2eda0238
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 15:43:28.0177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jG62dWVXfyipz/W3lKTTcpxxZXhZlMDhbsKADvYceMpjuQasraKECCdOsGYTSb5vbYMHs75TxJnv5WIQsxxIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9940

On 24.03.2023 23:08, Andrew Cooper wrote:
> While we've been diligent to ensure that the main text/data/rodata mappings
> have suitable restrictions, their aliases via the directmap were left fully
> read/write.  Worse, we even had pieces of code making use of this as a
> feature.
> 
> Restrict the permissions for .text/rodata, as we have no legitimate need for
> writeability of these areas via the directmap alias.  Note that the
> compile-time allocated pagetables do get written through their directmap
> alias, so need to remain writeable.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Notes:
>  * The stubs are still have RX via one alias, RW via another, and these need
>    to stay.  We should harden this using PKS (available on SPR and later) to
>    block incidental writes.
>  * Backing memory for livepatch text/rodata needs similar treatment.

Right, but there it's somewhat more involved because upon removal the
attributes also need restoring.

>  * For backporting, this patch depends on c/s e7f147bf4ac7 ("x86/crash: Drop
>    manual hooking of exception_table[]") and c/s e7db635f4428 ("x86/pv-shim:
>    Don't modify the hypercall table").  No compile error will occur from
>    getting these dependencies wrong.

I suppose the latter isn't strictly a prereq, as the modification was done
from an __init function (i.e. before this new code runs).

Iirc we didn't backport prior similar hardening work? So I'm not sure we'd
want/need to do so in this case.

Jan

