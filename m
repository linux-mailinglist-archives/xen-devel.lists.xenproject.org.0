Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB4A6FEBE6
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 08:48:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533142.829547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px06G-0007rp-Vx; Thu, 11 May 2023 06:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533142.829547; Thu, 11 May 2023 06:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px06G-0007om-T1; Thu, 11 May 2023 06:48:28 +0000
Received: by outflank-mailman (input) for mailman id 533142;
 Thu, 11 May 2023 06:48:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px06F-0007og-0x
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 06:48:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4483bd0-efc7-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 08:48:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7551.eurprd04.prod.outlook.com (2603:10a6:102:e9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 06:48:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 06:48:24 +0000
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
X-Inumbo-ID: d4483bd0-efc7-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YksM4q4n2VOEzm3QmeSyUkzBRYLD7xB5xbm4bhHAxR5bdsuznwlcgaThqJihqFx9IVg2rgrw2rIXh8EUU7L4jH5k/WDQO6oebbRP2yysz7No2h64iYB2O/3iV0jiqDKifmd1/fsnDcWHbk2XVsHGK8ThqR1YzGHoQI2AnnQf9Dh/eW3ve0ShQgpFQ89/ZmiO3pd+I3wFT0Vn2qGhHOsrSAhedyhBXZb4bf/8IzBKaJU7q0HEMHrfW46ivJ8AYMpXW9kzvdb5W8u1MmHjHk+rtJYWXrYEjXWZwpJ/yCHmJAmFjSiqGji9Hcr8ZjltGg0i1zwdlxPwEl7HypnFWqmU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5E0xoFqOO1H/rtjWFvPzFubDbc41FBKEVv5ge4YVCic=;
 b=HgfpDIEh4CTFNCI0mFC99BFACeWcF1IgH4CEXgZHUYbAFBAVvs/1wf/YTkw5Mh5pLdj3h+n3yrHEqX8Qx4jG/GUUiayQqfY8HX1GoM0GTR0CgHPLboljY3OQSdYFRAu5jC0gW5a7dG3URsoK17DwenNZmQpfRstAtzSpCO5OtXB87jDSQ2YuU9em2xeIffKej/cy4lJXwaR+uNeXTbX6yjR0wC3HbClQETqYsnT3lqK+dJnyeKYTWgd7XjvHFmwEKIJrqkQ4oWFCcwjmxUAq4D9z3tpH/VSLr2UQe9Joz1iCbBfFUjvHhqjFhtpkOhuSG7N9Y/SEFcaDdWW/btzZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5E0xoFqOO1H/rtjWFvPzFubDbc41FBKEVv5ge4YVCic=;
 b=2R0houClePBXVNMkZZPYfD7nYs7+Tu5371NBdbhKCAESgpwWtdOANYKH61o8k/v4fFe/50dvHaJ/xX/Q5J05zrpr1nbx3lTBG2KzV4Wq1YJVjMVvQPhZ8NRNCJl9BxWpBuPBjSeATuI9wUAFMuWyWD09QmeJwX6yUZSOpQirP03q4bYmagkNg5Y5WD/Wb893a9Uxyn75JPrpkvLj92IDIC5OXtfJVmTAcesfaPIGXJmMekyq8bG17jtrmhhoOQoa3zbbYXNle9xBaAl1CsR9yr43CakbapfKYtdy0rDFpLN9jVuqO2JU7zkOsBmXPtgTHvmD1m/mZgUvGDgxqpBHNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46701a92-2ada-abb4-e1a7-c8b1bfc5aa2c@suse.com>
Date: Thu, 11 May 2023 08:48:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] x86: Use printk_once() instead of opencoding it
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230510193357.12278-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230510193357.12278-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: ee89a06b-e14e-4d1f-ff35-08db51ebb7c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YnJTlh51o+uNVYCG9r4B5ebW5wp5Vx/vtWABi1egJoHGwOSv8zsUbcsrtiK0Ur7lw64X9FC7RkCDo/sbz6JE2dWFnOcwVNYBXxp7EAtH9ieMHF7Q3zqeKZbmKFMsSq7005lYQd5pX7yEUpehJlluHwFcnXlIQkJ1G3eJyATrQ/WcXNgE3SKHqndVZDRAu5Bnjwi/vYu246r2fjWnYHINgRdvW+UNhFXyfnrbk8jHHZAYyR2L1SAwN8EHtV0Kkuv0G87/WDEYH5PHkpvxIC35vDnpx8oaZ1tkjKS4E+vA3P8TjHEKt6bliM/id2pD8+e/0zq0vk2yOk5fY9eZlA5phyqSOu7HF9W21fTl2A3hZSLkqCtyEBY50yx+um3IxMa8n8UP4/DtqmXTstECrjzTCQrraE6QcMb3vA4ncKdjMlq8jkgxlHM2R4vTO7OO14jaQy81t8FusgxVFTRABqd1KGCFOlOmdEDWvNavTXlaw6k8jlIjoL3RzcCs5sWxxvHEoUbvaHEjvHM8tfPMqtaQmMm3AB5I4VMdtpVs8T/DNcGyQy6PdTDxs/5xVnThBclrCAtPZHSqwyxLsN2Ip7pvTlpGFL6gnyQ6ERI71vLhjQd/NFa5XoLYbVCqFevI7hN5WznVj9pfCWfUUitVtrq8xg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199021)(31686004)(36756003)(66556008)(66476007)(4326008)(6486002)(66946007)(6916009)(54906003)(478600001)(316002)(31696002)(86362001)(6512007)(26005)(186003)(53546011)(2616005)(6506007)(8676002)(8936002)(2906002)(5660300002)(4744005)(41300700001)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3BTTTdBdVVheDVzYkFNUnFFTEh4bkVrMXdPTlA1dEMyZEozOEpyZGU4UWVB?=
 =?utf-8?B?TStFZkI1SlRPQmpRK3FFOFVVVlNqV2t2ZjhOZ2NPdWhQWERiYnBYNFdLSEE3?=
 =?utf-8?B?N2c2cnBEMGxZN1hzekJTLytKaU1Nbk04V3JDbHpsVWgxVE54dnZ3Q0VjT2dG?=
 =?utf-8?B?QzIxSkplZDM1WFo2WVVEczcyaUh5eFJHQkExaG1zM0gxTkVYcjdjTTdINzdM?=
 =?utf-8?B?OSsxb1Y4UTNaMzlTbkxCaGlJbkltc1VTM0s4MlpKangzMitVVlBOemNSQVJt?=
 =?utf-8?B?c1VUaUMrM3RuaVVlTGNKYTRWY1dWbTJwNVhxczlXaEJuUEVESlRFOTJoblk1?=
 =?utf-8?B?a1lXUi9rTGlsSTI2LzREVVpJSEE3QWdoTWRnZ21QWlVZV21BTVJZcmdTdTkx?=
 =?utf-8?B?L2QyTlNSaTZkdGVqRG5WTU1zenRkL3BMTTJYUWdIaWtlLzRiWXZEdWExWmRW?=
 =?utf-8?B?VlIranVKVmtXb25xeVl1NUdDK01nL1RSbDJ4SENsaSt4RmFmdnowYlNxV3BZ?=
 =?utf-8?B?aksybFZzM3BOUk15QW9zdnBjVE4vZmVTcUZIcTlNZjZtVWFKNTJ3RnRTaFR4?=
 =?utf-8?B?K05JQjBwZmhWNzRLamluUVo1WFVpem9FNWxCQkoybGgyVVgrcUpEcVJIcGZH?=
 =?utf-8?B?ei9mV1Bta3FONGhQaStLNDY0K01EZ2xPL2Rhbm01NUUxTVR0cGRsd2EzcktM?=
 =?utf-8?B?SkVXVURrQWNia1h1KzNITjlBTG9XNmxSNzdnN2dPQ2hIay9uNWgyWlYvd3pl?=
 =?utf-8?B?MC9PWXYxVmRqM3FjY1FLWHg2bVJRWUhkZFljNFp4VVltSk95b2laVFdqKzdm?=
 =?utf-8?B?WTZPSStDU2lBa2dRb2xON1g2V2Zrb1RFcThnQUowYlJIVnNmbkRjeUo3dmgw?=
 =?utf-8?B?WllQeWVJcnNMM3lGL20rNW5RbXRCWktUSERwMFVxSWJ0UnBnL0F4enRPNEJv?=
 =?utf-8?B?cnNyMlk1alJsSUxRVGJFWXk0OUpzS21zaEJUOWR5ME5xWW9HbzRmcUppeXNK?=
 =?utf-8?B?YUZhcmJ5NmhselNMUTFYMThQR1pNclNYMmpTTDg0Q0J6YjBGeVN5WFlsUC9r?=
 =?utf-8?B?M05xeENhZmwwM1NlTXBFZUJ3b00rWFpKTXBYQlR4YUN3bmxoVnY4dCt4ZUJF?=
 =?utf-8?B?VVhmQ21Dcnkxc0RRUDY3Rm84TzkwczhKK2hsTk5qTWN2cXcvSUtVN2RwM1FC?=
 =?utf-8?B?SHdxVnZ6eVhhb1Njd1Zaak1GQ0ZQSGhCNm1XcE1tRzhsMWcyMjUzWThCbXY5?=
 =?utf-8?B?T01iMllSM0VUM1QrTDd1ZDY3eXNGSTQ1b3lidTV0ZmlVZlpTNW4wemwrTlMy?=
 =?utf-8?B?dGd0V2wwYjRmSysyR0lTZnAxTTVWLzNyWmFENFdzT3ZBVlJXbGZGc1l4aTlR?=
 =?utf-8?B?OW9nc0poVkkrZ0ZUQjkwWDdKU3NMU1psV3hzcTJXWDdRWDJzR3g4YzQzTktu?=
 =?utf-8?B?bXZxV3Qvcm5nTWRhcEk4VzdEZWliYWVlNzlueWsxOTFyRXM0RjEzUTg4N3Az?=
 =?utf-8?B?NWU2ZjAyMEdUM1NCNHBGZXpPeDNXMHRkYzdYdXNjSEdTOHhuSWdYbm5wSWY0?=
 =?utf-8?B?eWd5UjNReERTTWViR2M3ZjZlaVNTR0ZGR2tzRlNwZlc3ZmFXTnpqdXNNMmdP?=
 =?utf-8?B?NnV0UkgrbzJhekw1MTlmOVhraWRscVJzclJaUHVIVDIyakdHeGNMUXhqM2py?=
 =?utf-8?B?UWh2bGYrVmdlNkJScnNhSlhrcjlpeTBYY1lnS1B3Lzc5U1dEREM0dGZtSDJM?=
 =?utf-8?B?ODdtVDA1cjNMSThkY2hHUmxQL0JpSGxEL2N5TjNiMkRrSUMzRWhPQ0QwMVRB?=
 =?utf-8?B?bEhMcXY4Nzg3dXVyajNUM1lLUnlqV2ZVYkg3T09uSTVQanMxZjNtMTlOY2FV?=
 =?utf-8?B?UFZETkZMTWpsR040YU5TSlV4L1hJRTdUNXRzbmM5bytCUW05UThkZjVMeWt3?=
 =?utf-8?B?MHUweVV2cG5YeE9aR09vZXJKNk4yejUyYUQ2NHFlbFhxeUtYQzZSK2ZiaGhi?=
 =?utf-8?B?Y0dqb0FKNUFmU0cwVHFiZkhUcVNaOWIzRmdhWWJTSUNiNGZWNWlpOUpNUHFQ?=
 =?utf-8?B?QUljVVlCdmNpd0tPektQajF3djRINVJyZ3VkK1RLTWM0bGl5c3o1c21IdzZl?=
 =?utf-8?Q?G5/pyBJ6Cpne8mChxrYUyq3OB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee89a06b-e14e-4d1f-ff35-08db51ebb7c3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 06:48:24.7013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BX+ZFTX7/SemYgy/grQDNA5g9d/a00IpH/EgkahUc/KAmybirLr2XVgub+/HMz/5s6CSrZ1sc8+ESCHAYtRUHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7551

On 10.05.2023 21:33, Andrew Cooper wrote:
> Technically our helper post-dates all of these examples, but it's good cleanup
> nevertheless.  None of these examples should be using fully locked
> test_and_set_bool() in the first place.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



