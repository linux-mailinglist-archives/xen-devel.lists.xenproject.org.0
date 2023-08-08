Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B655773988
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 12:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579545.907565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJai-0000Oe-Cf; Tue, 08 Aug 2023 10:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579545.907565; Tue, 08 Aug 2023 10:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJai-0000MT-9T; Tue, 08 Aug 2023 10:05:28 +0000
Received: by outflank-mailman (input) for mailman id 579545;
 Tue, 08 Aug 2023 10:05:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTJah-0000MM-BK
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 10:05:27 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 174c35b1-35d3-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 12:05:25 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7132.eurprd04.prod.outlook.com (2603:10a6:10:12e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 10:05:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 10:05:21 +0000
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
X-Inumbo-ID: 174c35b1-35d3-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4Myi64rXXfX1+OX/g64WatPxg+6k6i91ypSlF2oXOmjqT+TbXkZ4JZZ6SKO0W8LCsmyiO95Z0vReYoddAnRZD+CeBPs5pa+sNqUlBuGt91+71hRbl/My+vnR4xt1K1ru6SXTa2JOqrL76AYJwbHdMAIQkiloDSxKOcSBbCCeDbqDzYzj5mR2eQegUIDG13ow7IjZ906irKfS83X1HLVrB9/YTEcypBHKoiGc+5pep6wU/AIQyJqR88Oi5KPd31kQA0fOvjao3YGAn/tongLsNpnzvO6Wd8LTKcTfSN3uqZGyHHSmsCO+6ZQOA1arQtVbj0mh0IWfR1bDG3bIz/LOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C29WstG3FNN7JIwmB+XA6DOxLNVEuHctkhVXHKl2C9Y=;
 b=Qt5Gibhw9QmYK8a4hc77ZyN0kDf0UIG8UyoyDMG8MbLMBWRdfqgLNSRIuviYnDpDsU70N2JfIeilLlK20poALT03VfIG2Sefi2Dql2khCO7EtxrDWgtiB8yXzGABpbeRXCMdfqrqdoZMbhBEG8Frtcp4sUzy/ZDQoAYJcpPragL5WifPePNEqmIRat3l4wmopg+E8wKmhuf+xapLRGX6cSjTKZ7F1xJyANFro/nPoDJHhjCo11J/EIO0Fzze6Nlv2ZYaPQFTl5h4dAR/BkGaNnaYsPXIlkFGVQ0mKfhqKG2ZCxj9dHHnGYoxNUhWclusdeE4B8YJqwfHrad+udAa5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C29WstG3FNN7JIwmB+XA6DOxLNVEuHctkhVXHKl2C9Y=;
 b=CGjxzsOqgmmrsvgeibM23Qe60q2iRLLiUlIZsvRAQgWVXmNXDT42TCN44VZc1WHBzpO+C+R2S9BjotlTqrDVi3Dc9UHGYXyKpAWD5iGkZT3vO5Xo0OZ3kUVsLRWE14cO/ZLFQ3b2D4wadpDxfnVzUktkuriCVr0D+R24t7jSI0DPL/2NTEEAJVyPWj32QLKWikZ1u8FNwe4s7+YZTEwEFvogjnMCFO6dPmtjVFFW8ecWRNh4LEAHTMPbz9JqFFxPZGZkHZ0hbdELVhTPTl4fhrOf13ZKbuTBaNhP+U/73HUI7Hxkjpc+8frentTKq9WXV2tPTn1NISeabDFAara1nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c367d8db-5b9d-8f6e-0086-caec6e90d53f@suse.com>
Date: Tue, 8 Aug 2023 12:05:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 6/9] ns16550: Guard accesses to `vuart` field by
 CONFIG_ARM
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <1bee2fe06c4a9262b05cb4b8cd392d9630279f30.1691016993.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1bee2fe06c4a9262b05cb4b8cd392d9630279f30.1691016993.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: b5dd1285-7a5d-474b-ec2d-08db97f6f993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+QWBVsmlOPRchqXkKey82/2lJbcts8WllpoyEsUCF992s+TtonehXf/X7/+W2MIQwSkY2mLnRJTOdxMsinHIJwNPDoqnJOjKP3eXkTjBOFbWgWMCKd1S7SnTGumZXvsajY8wt/SUnUjEkqLG9Mq+s30f+V1DdUSseensOf2mMXODmTBdkE4IY22TE4W9hNbhfSg1iqTZ0ddDLGwNzZhE6aZ8C0tC1R8t1GevPXDh93VGh+NSMwWdo9PaoZMgB38rrDllGCOpw1ANenWQHH/j8NqOFxzpXN9zGZ1SACLcufHDD5UIdn1WgG+ZiTMecBXxqJnSZ5arnhl8FMoaumnDcgY4UaehU/h2B2Sq4YZxbQuYmb+1MWLdNgDB7Cz3AZ3GZoZQvKaqkCtZidPBY2AVueclkQanK2i2By5sUWhXCVsfNE3nJmeCQHoLZXr8YApj2lZCbRBw7OvvVzjfga8SwBBmhrHT+wfaXU4RtayhbwvazO1RPmYulZt228s7rHQ0evUIH5eqVWlA3l8+6N9sY/r7HeD4tJJ/493rTSXuz0cZ4j7/ENrwMv9O7mBP0P9ZD4DyeFpUw5C3UoeA14+craDUSnsyLHwwETOFsH3YzbY/AIcXP+4Eo30idAGfDwoCAOlnF7BIXwYdaTYi72DAyeEa5WqtdJirMwYmz16pcMQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(39860400002)(396003)(346002)(186006)(1800799003)(451199021)(31686004)(4744005)(2906002)(6666004)(31696002)(6512007)(86362001)(6916009)(36756003)(4326008)(6486002)(54906003)(478600001)(26005)(53546011)(2616005)(316002)(38100700002)(6506007)(5660300002)(8676002)(83380400001)(8936002)(66556008)(66946007)(66476007)(41300700001)(81973001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1dQbTFkNmptVGpRWmh3QjBFaVVoSDRjWVFGUXR6TEFDWktMQTB0NFMzQUpG?=
 =?utf-8?B?T3hXc3dCUktGM0VPUDNxbVhFaDhSTkpFeXJ3cE1qbUQra3hlSGZNbjkySGFV?=
 =?utf-8?B?R3RUdmgyazdSV2tGaVVxRjZCSytJbDUwWW5iTTgrWHo3dmZQdUhIS2NZT0RT?=
 =?utf-8?B?L0RPTWZvQ2ptOWIwRXZ1cFE4S2c2akJzWDltRUROMXZXbFhJaEd1MTYrVDVz?=
 =?utf-8?B?c0Q4M0pWd3hJTExYaDVMNkVBWDFEbHpEQ0hPbm5TNkR0NHNnZXFISUhkREhK?=
 =?utf-8?B?L3BycFJBTEFRWjBKWWhmdDFWTWdEK3p5WHlEY2xvS0FnNDRGSTBXRGFkelUx?=
 =?utf-8?B?bVgvejY3S3pWZW0ySkdsMjZoRUJ6Z0FYZzVsdmY2UGRZOVVUdEd6OVdmd0c2?=
 =?utf-8?B?bklyYjgyZUUyaUR0enFUdFZUazJwYkxKaU9jTWEzZGVWaFUyTXdyaDNCODFD?=
 =?utf-8?B?dEg1TGcyM2kwa3JyeVpYajJlN2dXc0NtcXNsTU9kZ1VrdXNtd1ZLWWtBZFpE?=
 =?utf-8?B?MjZlQkkwUEhBUEVQeGxoMXBjeEhqZzMzSVh3MDBMbjlVM3pPR3ZCMzNzN09z?=
 =?utf-8?B?RDIxQllvZkhKUFBNZGZVZ3lMWUlXcjk2ZUozQ3B4aHJFUUR3Y25HZDRSeURw?=
 =?utf-8?B?Tno4R2Y5c3M4a1Y5WnVkWWlUM0k3dmgyd2IyNFR4S0NaUmdQajJGQ2MwbWty?=
 =?utf-8?B?ekRpVmJpZVIvVHhNQUF1VlB5eFVMUk5UemlEV0xqZEEvcTMvMmJkNkRCOURl?=
 =?utf-8?B?blhoTjA4emlDNlVNa2R3dmZWTEJhdm5pbHpJaklBSjFWeHBEbUZzVTVJS3Ja?=
 =?utf-8?B?MlVodk1hMGRYSmJSM1VKRTFoYWp3TmFVblF0MmROTjRNZmNVYUJXTWFySkMw?=
 =?utf-8?B?eUpmRlFzOGFoNXVpY015R1dMRDIvbTZ6cnFjVFNrdUg2WW8yNE41akdUNVFW?=
 =?utf-8?B?bHVyMXM4cDVReUd6RDdrSjNLODlGSjhRT095U3ZpbEJtZHkrM2pCeW1MeVFV?=
 =?utf-8?B?WlkyTk8vRUlvbWhHb0NCY1hDUnQzaFVqUE05RnRyazlrbEIzdEFucE1qWEpj?=
 =?utf-8?B?S2llaDRtcXRVQ2JaZWtuYmJxZUhlblVRSHcxRVZVVmt3dnJESCt5Sk5nUXNu?=
 =?utf-8?B?R09PYUpXUHVSamRscVdieWJzc0ZQaCtxL1Q5dk5ZbHowSSt6cHk2anpZOWs5?=
 =?utf-8?B?ZVRWYmJhMVprMHJ2RHdZUUV0KzJ0M2NFWlZDRG5KU3Q3Ty9xSmNjN1FONEtO?=
 =?utf-8?B?aXJZaGQrZWN1cVhFSFRNakk4TjVydFJpeHRWaHZNYjVKaDJsOThTdmhiTkkr?=
 =?utf-8?B?ZWZJZHlCUmJYK1JCOS9VTjJUYkZTa3hkc1RFazFQeDNLN3hyVHhlNzgzSEZD?=
 =?utf-8?B?aTJXa1RZOVdMdklMNmFTYTI2NnNCc2NoOUJqeWQ0dy9Ma0FEOXQweE85dG9r?=
 =?utf-8?B?b3MvekZybHdRN09zRklJWmdHVytJRngwcmpMREZJVkJicEswL3VuWDh1UCt5?=
 =?utf-8?B?clpqc0toaXpWSGpFRFhnbDEvTDE5cUhiRFFERG0xaVBZakhNWUx2d1VyUHZI?=
 =?utf-8?B?VG9tSmkyQnNHcG9INk8veU5LOWU0enUwUk9EdkxZU0Z5UGxnL2M2TElZSFow?=
 =?utf-8?B?NUxVaWRSbHhBRTBkalg5d2JjdEYwQzRwZ29IcHBYUjQ2V09vVzJMYktKQ0M1?=
 =?utf-8?B?eGdZeC95bHVGY0JRY3JldjNERHUzbERLS1RZYWk4ZEhqaWVZem4zSXAvMkYr?=
 =?utf-8?B?Q01YZ05IMVV6ZnoxQTRBM2o3TVRQZlhsQnp3UzhlM25tdElOWWdIM3RNY2lC?=
 =?utf-8?B?WUE1ZlE3SUFIRTNMeHBzSFZnRFBJMGJQTG9YMEJ1Skd1eElQTUZRREhHZW9O?=
 =?utf-8?B?Q3Npcm9BUE9lc0gyVHlFUUpXdzJzWnoreHNuRDFralFMR0doL0xNQzR3NHFw?=
 =?utf-8?B?RmFkQkFORkdQZ0t6OVdUaDBSNWtmZGFVU2JTVGwzNmxNQmpMdERBeGduMGln?=
 =?utf-8?B?VTJWM1hHTWVUZXFmQkVnbTlyOVJXeHNPM0c4UHF2SUNQUkN5cGpBZlY4RnE3?=
 =?utf-8?B?bU5xa3dwOWFzUjRWTlhtK2toaVZFOWUwbWsxSjlaaWgzM1BSWlo2bVRRTGZl?=
 =?utf-8?Q?RjH2HT7mxipwLLcjuYSVXx3vM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5dd1285-7a5d-474b-ec2d-08db97f6f993
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 10:05:20.9827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+vY3qR4roXjaUFSjGHW47bDUL1T6ubr4wUCE6B9ArWE4c1qkgsd5HtWcYQHqnnC7NeBNNRtxlcZszWdaZUtFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7132

On 03.08.2023 01:03, Shawn Anastasio wrote:
> When CONFIG_ARM is defined, a `vuart` field is added to struct ns16550,
> but accesses to this field in ns16550_uart_dt_init weren't correctly
> guarded. Fix build on !ARM platforms that define CONFIG_HAS_DEVICE_TREE
> by correctly guarding access to the vuart field in this function.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



