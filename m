Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3621065D5D5
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 15:36:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471195.730942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD4rh-0005hr-0U; Wed, 04 Jan 2023 14:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471195.730942; Wed, 04 Jan 2023 14:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD4rg-0005ee-TG; Wed, 04 Jan 2023 14:35:36 +0000
Received: by outflank-mailman (input) for mailman id 471195;
 Wed, 04 Jan 2023 14:35:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+XhT=5B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pD4rf-0005eY-AD
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 14:35:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b218fdf-8c3d-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 15:35:33 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7158.eurprd04.prod.outlook.com (2603:10a6:20b:120::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 14:35:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 14:35:30 +0000
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
X-Inumbo-ID: 0b218fdf-8c3d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWhIRKcMsrRSFxT20nxy5pJ+TmXM6ob/S50ssBFPkAnzP+UsmWPoLXIZD9/aTimxf6ZtMqRGF1+JBPr4JJLVQTrtGQv7fIrTngqTXVV3oOtbAfCwFx8hn1RM1VQnNyFkQlIl1zl4BoBiioZO1U3Ea6hqUeDTYyCP4F+dgKqt+PpSJ0FadW2A+MshxzwxpNYAjcEhoheyEbDmhSdMkE07Ar0MBkrWALrtN+xgiPrhnC0zlBm67g7YpGI7LPNlSsI/SDFx6gvHS99K6JmJeGqZN6vLjQDV8egwIFWSVJEgkAtTsER5pGODn7OxFRkcCEC8xavzRvIqQtpqrjuipdILPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSdnEC4H8uuzngem4U0xCx9Q9CnYDPx8Fuv7+TTrdUE=;
 b=gbJsV5NDu+XPYCZG8w2NKcgxS3JaRlLkB+d2AM7oDcSNxIt7lUaffGiPDA4bMumdHGrfAN/bY0ULkHINBQWo9p8BcnJqRNeTQvBmWormc+QreoyxFYga8a30dt0do6Oo80M8OCsgpRuWWKk4qZDNnFWbd0924QfzgtBn5xIXTbmp4/DdNoq0VIDGlAxz+Q8fixme8eb9m3BcXiDmzys6XdaP03A0cnnzOcq30GKI1mzxKWYqSbfApjShO88ii0QJq4biBC/c7yG3EzAJkjyvuz3VCOsos1M6bT13dj8Nc/gNfJLiJMoMZ8bFSDIsSimdLcN3cnpy0FzwZrQUACCS0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSdnEC4H8uuzngem4U0xCx9Q9CnYDPx8Fuv7+TTrdUE=;
 b=T6BWMIFozNHFtJfjNPJT3m0J64UMt1UGqpzy1mvEJWNyWX9urVnUZl+gAMDTIZFKyEBr4CY53fJu5g+M3pKb7dfExQ/a1qV+mh4I7tDEO19V3bKKNMklZc8IV/mF17lCNNdPWI16EuhQeXNthcotlolTHkYsPGaKd6n3urMBazG1TZQiaA45/cJREn0MYZrTL6Fga5GH/isJ8m4wruxV+HCDM6BTUcI1yK9UnEP5DEgPnlHyUPl6PcI9lIoZys7kz80XwJwSDa3krW84vkrHvA1gzjxgxLWVl2KwaFSk2jI2FilAHH9uAZ0ZKkB+bGY53VurkHOuoKIGs+L56p72/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <37b87d38-de11-cc8d-0663-73c09e1dfd0c@suse.com>
Date: Wed, 4 Jan 2023 15:35:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] x86/cpuid: Infrastructure for leaves 7:1{ecx,edx}
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230104111146.2094-1-andrew.cooper3@citrix.com>
 <20230104111146.2094-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230104111146.2094-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 41f0afcd-ee32-40e5-f8de-08daee60ee16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iEXdOrYZKGClUXAZax0JWRCl4iiSAgRtG5f6W1S/MSNZqQ6tvSfLpsgdiBA2IkvffM7hMH4eoqXWqH5ySD9LufxVJOT45Blk+oS0rF+B3SBoDlIBvuhMV4CNos7RUt5c/q0YmS1gxe/hFO3BAQyrTMsBin/wFmV0Ui1TibYXMld/YxiHwamXKR2pZ0TcsJxuItdNOX3AfLSdFfSikyjD1wr3wycAKK252QOG4VK264h9RFLJaHj1lBa+G6TpnFWCBCPB8bB3oznK/NfR+KsKLKBxK0sZwRlxAdpppyRGt6xoigjRTllHKQN4nbLQnNLgFtQ3CZS833jAVidXSiFOl7Yqe6mWsQyPsWB9nZT8e7jf9gUVYDxGF2+BRujoHvSlalS/OgRbOPZw6wXEP9up1GXYC6AvbZonuI0xMnTUPE/zfOjMAdodfILFZibihUwLhUg/XbvsxIrm9pWsfZGe4M6NQ817T2DbMABN51VprU7PQVXXpNkBcGwQxJBek5T9G3zIU/3nq9SJ6j+pZM7kxQxZQFDanMXmXrC/DiK0lKNxXczMonckp+vvIvxCgFH488arJCkBwGWDzM83o9g+pE7aTkUouQ25NCFciI2/Gg7ERj1qJx+xI1htlOJFcgN4k8anj1Y4/3Yfi388ph0kKMw1ccAYC0zjuUF7p9vZ++jmZ4dK+2/niNUrMPiqQRM5RHzVgkCx6KqdUcSTRR6s6DtMqq44SPPHytA9l0KbAoA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199015)(31696002)(86362001)(83380400001)(6506007)(53546011)(36756003)(2616005)(26005)(186003)(6512007)(38100700002)(6486002)(478600001)(8936002)(31686004)(4326008)(66946007)(66556008)(8676002)(41300700001)(316002)(66476007)(54906003)(6916009)(2906002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGdGb0doMjhkc2RQQW9talc5MWE0TGdwTzVqdjMrRFd0eTZEbTJQNjBQRVV4?=
 =?utf-8?B?VVhQMHd3ZFkwYWpxMzY0WVc5b29nUnM5cWpZYmRUbkxsMVdlZVhJMVVIeFpl?=
 =?utf-8?B?V3hqZTdjRFJPWHoxNjZkWDVHdGJUNlhPcVY3VWpqNlljbis2aUxaVTY4bFND?=
 =?utf-8?B?WHE3NzZmOEJ6bUNPWjh4OHNNWFJVSVNhdWkrOUUyWFJueUt5WlNXOGg2Skln?=
 =?utf-8?B?ZzBxNzdja0Qrcmg4V3RxampKZFQ3VWlXd21KbEFWOXNFYlNPTWJ3aHhET05H?=
 =?utf-8?B?MHB6WWZvZEova00xWkxmUXM1S0dITGVqNnpYMlpRTDNzeTlWeEcyTjJ6bG9u?=
 =?utf-8?B?cDBUd05ZZ1Y2RVBxbU1wamN5amZLbTFRRlFObGtLTFUvWjV3OCs5RzEvMk13?=
 =?utf-8?B?aG56dzlwcVppc3dadDZxZEFxcGp0cTNSODV1cTFTVzZtd1J5ZlVZaHo4ZTdG?=
 =?utf-8?B?OGsvMWdjWTJiSHEvaW1ncDJBbi9uTHA0MFFrQXJNcG5BMmtwTi9hbWk5Z3FG?=
 =?utf-8?B?aUlGUnZubEw4K1haVWlmVW9ieENPY0dZbWptQ0cvWjRVVzU5bmNXRjJTZnVU?=
 =?utf-8?B?cUxHd0I5SEZDZjNOQzhIaEVnL2FlRE82Nm9YVUE2UVEwNmdtSVp5OTNLMTdy?=
 =?utf-8?B?K21SQmVsYmNOcFlrQjdKdHZ1bWRNWFhUS0g2OHpMR2lZSmdmcWQ1dVJRMGVR?=
 =?utf-8?B?NGNDK0l5bzhVaFZYV25hMVV0b3RHRTZ5OVFQd3R2cm1aYzl3YVNrb0ZYRjVQ?=
 =?utf-8?B?dGpkQ2ZXRnlqMEN4c0t5UnlYd1BBMnJSd3JIYnVoT2tTTjdxSzh5TnN4OXQv?=
 =?utf-8?B?Z3ZUdk9RZmFOc3dobVg1eVVBa2hnRE9LZlRidGJiU0pNMlNmUHZqajlCSjVa?=
 =?utf-8?B?bGRicGF5KzFpQW5LUUk0TmZ5TnpBR0hYbUs0TTl6RzFuQml3bTRVYzlkVWJK?=
 =?utf-8?B?UFJ0dmZ0T05uMkpxM1RYanZkU0YxanJmS095aXJBTTduNEwyTlBiQ0xNNTZj?=
 =?utf-8?B?MWszU1F4bHhUaDdqWTZZczdsYTBHem1mQWw4L1ZqN1ZkOUJMalRtS1FCVkRp?=
 =?utf-8?B?TWlBY3ovWEFadk15UXdSSjlNSGMxc1BINHFZV1hrWGQrL2dJRGpRbjBlOUd5?=
 =?utf-8?B?RlRya2tPSzhPQnN6WjZWOW5oZ1dZTSt1Q2NXcm02TGMvajArSXNYc1lINWhL?=
 =?utf-8?B?TU9Tb0RwRDYxWldSNEZFNHZTLzhsQTBnanc4S0ZLa29GWWtxa2thOVh2T3FE?=
 =?utf-8?B?U09oWU5pY3ViMFduRVBuUnd5Y1ErcEQ4MFdndjl6cDhqRXJ4bVhxeUE4NUVj?=
 =?utf-8?B?UDZrTmdJaERIZGhsallZT3FNVnpURlJKSTBpS2VaSVhpNkxoYnJwYjhwalZ2?=
 =?utf-8?B?b0oxUXdDekR1V3NFU1lrRVI1eEpsMm4rSjJ0a0VMaCtaY2hSclNaZERCa0xC?=
 =?utf-8?B?Sm9ZWHRjZVg4WEVkK0JQVENCdzJ3WmlzSnF6Q2g1S0U2OUJuYnZ1RW1yWUxv?=
 =?utf-8?B?bVZSb0V1bGl0UlI1cGhXVjV5YXhwWE5Cd2RiNGRoVFNlemdQMGJIOGlRV3J3?=
 =?utf-8?B?QlpuQTRRQVIydGd2QVdacnFuQ3EyclhLeE9nWXVjRlErMjJKSktoZFdjaS9P?=
 =?utf-8?B?aXRGR0NnYUlML3ZGSFFFeFJRc1ZHMHNFWWZiR2ZuclNGQXhqTUVGTEsybXdW?=
 =?utf-8?B?Q0N5elg4ZmNRKzB4MlNDYXQyTEVoQzJ1MjJxb2VBTncrOTNJMUFzc2FWNDlS?=
 =?utf-8?B?Ulh2akNUeTJualhjaU8zL2tmcFlScTdnVG9FRTRUZ0JFKzhNbHBuRTI5Mk5B?=
 =?utf-8?B?bGtjNUZyN05OVzdXWXBDT2lmZE9vbVZkVzgvNXl1Zk9sQk0vWUlLRnJuRDVH?=
 =?utf-8?B?NmFyRS9pMWN0Nkc4eWN1eU10WEIxYzBiSXJQNGhLREM2aGpPd1VQNDNRSmVS?=
 =?utf-8?B?ZlRNeEplOHVZd0tlcUgrQ3lIZWJYQm4rdTltZk1mOUxaRTlPRjllZnl4eS9a?=
 =?utf-8?B?UTNBZFJtcVNCbURNaS9SVCtzTXhoSEFiUUllQ0NhTm9SbWZkRkxJc1V6b3hQ?=
 =?utf-8?B?WVVadk43QTRySmExMFNxaGIrVytob1gzNGZGcGtPUlBXRjZuMWo2Yndoamkv?=
 =?utf-8?Q?TC0NqRDThuNDsJsBJ13pvfDYb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f0afcd-ee32-40e5-f8de-08daee60ee16
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 14:35:30.6975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRr8THmXfwl5VM15QaJ9PE/X5HK7L2uzUN+cly8HTnGTImTIoLvCcDVIIFTi/RWykg+YGRV0U4l4L0YRxS28nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7158

On 04.01.2023 12:11, Andrew Cooper wrote:
> We don't actually need ecx yet, but adding it in now will reduce the amount to
> which leaf 7 is out of order in a featureset.
> 
> cpufeatureset.h remains in leaf architectrual order for the sanity of anyone
> trying to locate where to insert new rows.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -288,6 +288,9 @@ XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and
>  /* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
>  XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory Number */
>  
> +/* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
> +/* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
> +

... I'm not convinced getting these ordered by other than their word indexes
is quite reasonable. We can't really predict in what order elements / leaves
get populated, as can best be seen from ...

>  /* Intel-defined CPU features, CPUID level 0x00000007:2.edx, word 13 */
>  XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
>  XEN_CPUFEATURE(IPRED_CTRL,         13*32+ 1) /*   MSR_SPEC_CTRL.IPRED_DIS_* */

... subleaf 2 already having one entry, and that one not being eax, ebx,
nor ecx, but edx. AMD (extended) leaves would also always be sprinkled into
the middle of any such sequence. To me it ends up more confusing (perhaps
not right away, but in a couple of years time) if one needs to go hunt for
what the next free index value would be. Similarly the need to re-base stuff
using non-upstream index values (like is the case for the KeyLocker leaves
that I have pending locally) is easier to notice when new sets are put at
the end of the existing list.

In any event, what I'd like to ask for as a minimum is that you insert a
blank line between the two new comments.

Jan

