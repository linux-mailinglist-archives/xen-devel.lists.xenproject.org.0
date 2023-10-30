Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B927DBD72
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:07:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625260.974383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUnF-0001MI-QZ; Mon, 30 Oct 2023 16:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625260.974383; Mon, 30 Oct 2023 16:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUnF-0001Iv-Nj; Mon, 30 Oct 2023 16:07:09 +0000
Received: by outflank-mailman (input) for mailman id 625260;
 Mon, 30 Oct 2023 16:07:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxUnE-0000tV-MA
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:07:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f6b8d25-773e-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 17:07:07 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9799.eurprd04.prod.outlook.com (2603:10a6:20b:650::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.14; Mon, 30 Oct
 2023 16:07:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 16:07:05 +0000
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
X-Inumbo-ID: 5f6b8d25-773e-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRv3QftPfgZwl+01VYhcTIVbuqSG3qF9yu7ZOYWPsntkmjRlizMeVZ9sboTRxlDH9tDnzS7L4X8+ZhU7cXx8c5VuzwTBayAkniLsM4hDMfjAz7w3r9EQQI5pJNu1qoCzvXn4r/RN1BRT0KU2e3SVrNXRPSgv4F1i7Bf4EUpH0yf/oSBo4qN+Bzyt7LjozxGIqeysOQ4RqqNFRWtEe0KXZn8TxXMkuRKcRZDmnCseDLXa4/mG8WE1gT7oz3Z6/wn98zmzpMDnbuevup9kfvEddRP1bGyvI42VdpWPl73qzopGyOiX5TQYemhnEQlNwb9kymOiReVEYyO+KoN1V1giLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxMMYCGZQJfesL30vhlhbBOk3ppBIyeZxwf+yGxd8Vo=;
 b=hJMyE0AO8aHEorZrP/h4t3Ed2saZyi/jwgfbqJ3t46vfG0M/9cb8lGJaqKzz9LFm0Iu5GDOskdxsvkbYMG7tBhH+vjMNLXNwGSuohYKxIMCfrlLmGPM346Tr4CZgtlCA+rczQW7bs1jOwf6WaT4zLLwVdCii9uYV5WTy4YsR2pJfNGGYb3Rpzf1RCWRuzrmgCbyKOm5iFqX2vkeoKWinuP94rqW3g1k0NhtR5FBgQaOofajkU1o/f9eOFLui7FEo24cfDF9BPdF2dwcMI1T4fN0uLGRWIXg6rikedi4GMa3E9NmjVY1KeTzLARyvMt450YAPFyITRYsYQ9D4n8DQ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxMMYCGZQJfesL30vhlhbBOk3ppBIyeZxwf+yGxd8Vo=;
 b=OjAwOjF1gF0vBhTkk5ToqousYH+IMrbt5NPqx3cYV8p/KdHQkWoTCYL3B9PuvBt8/S4CrdbAejEo4uQwRv2nwWUPcae3NFLKAcofJV2JX0YISH+6xCnEBiP/YAzKV1vLa71ZRy/o9gAAequUMno0kbIHA/0R9UEN5xgGJnIEAz4XNfNhl20fGFYwB+Q3iKn/fbWpdRL+mNQa5snYxYYlapsUfv41JmdNDfonHas2PLkMIrTUoDVOtpIfWim2GuqTArmYoPWHu2LFvHy2I8kEwt0GnszgAP6RdykCJxDFv9YDusp5n92ln/G77zcMHFmX3niTUouOE2chuR8UQVKTDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c66da25e-6bc2-78f9-75a3-e1d3974fce3e@suse.com>
Date: Mon, 30 Oct 2023 17:07:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 8/8] x86/sysctl: address a violation of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698045505.git.federico.serafini@bugseng.com>
 <06004789b921a35632bd7126bf022e20c15052ef.1698045505.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <06004789b921a35632bd7126bf022e20c15052ef.1698045505.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0428.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9799:EE_
X-MS-Office365-Filtering-Correlation-Id: af1029bf-7cc8-4069-abed-08dbd962428b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NqGKi5qNoF6VBmoid1LQRtoIzn5ODduT00bqanmDAsFuP5bDvFkbKjmv3Coavhhai6FF+SJfrBIUnyefcAvlQlLFjM88QxAIsdbpQXW1h/U3r/EtJ468MttkbbtDjJuDNM+1BWetimVU87kX4VDeZgvjxrCsHUuQWFgvPfJ8g++ILp97A0IWgpJAcCkLq+P0BWfE8C2Dv6MJJc99380/9mlqx7Xsdamm5Cyu3TUteg7BgMN1FWAxZXiCbQxsU59KrTmLzSymnbqWvweBeeTzhuKJ/XCTaDMQKsQPZtFb08qvkLOCINfTjd/F5qQTmMQ3Ud544qoSD/QkTqx4dzfmfLldabRjluGf7bspCFDl66AJwRkhQ/E9Egyx82TmSFuPgWjPaiNOQsEJk1bxlDwmJjF70ZO4UkocP72Vsgy3KeocxCMahDeO5VL8afCgSMc2pMbO7ScfeQRrgG2eZaM8iwWNEyjiv03zcAAaf8dnauF7PnMPJd5EIWyx1GGeBpvE3Jl38g6lQCDtIzfiUzxxAcTQY1xMOVnltMfw7J+uSvGGNDky7NHT9WH7z1DWUy9Y5pCQd9VHJLjoHEhhRclqbY2jT4BjZ955Yxp54hQJNehQTFiET+h2ucJCY0T9FLT0nUWoCXxxSbRdB/Bwbguvdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(66476007)(66556008)(316002)(54906003)(41300700001)(6916009)(558084003)(8676002)(8936002)(31696002)(86362001)(6486002)(38100700002)(2906002)(4326008)(478600001)(66946007)(31686004)(5660300002)(36756003)(6512007)(26005)(2616005)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1NJOHlvcDZKNWpxZGd0eUh2LzY4dDhUM21qRGdiNTFTL3BmMG5PWnoxQk5Y?=
 =?utf-8?B?cUFhQjJsODNNZVlyRWQwa0pUdHFwbzJTdXBwRE5hUXlzSStmUFdTQ085OGNU?=
 =?utf-8?B?T3ZwQS9sdTBXQWdyb0xjUlk0OWtwSDBNcDhFaHZibVlqNjMvaDVyY2x5dyt4?=
 =?utf-8?B?V2MyemRSbG1IMldYZk1pZ0RTZS9BUGdSQTN3a3paUlpQcHlqUjdMOEVDZ0NU?=
 =?utf-8?B?U1BJUlJ3bkRaVHRhemxNd1V5bGJGaG84UTdBNm5IYVJnRFZXRmFSRDZ1RGE4?=
 =?utf-8?B?ZHRpdkZHNFBJdFVGT1BtVUFwNmxrT01rVnFTYS9URWVUdDF2dndJTm4zL21V?=
 =?utf-8?B?QW5HK1dCWGRTakhBenpMTXg3Y3V6NnpSYVJQdVJKemVQWHJhdlE0RWIxQlVl?=
 =?utf-8?B?amNLcDVUQVNqdW1HcjRRZVpuSTU5U1ZKbWtiQkZ4MmxiUVFDWEE5YU5wKzJZ?=
 =?utf-8?B?RlRNc3IxRXFPVXc1SloycTZJeXhVRTJwVlNLZTM2OEFDK0x1YThyK0JmNlZ4?=
 =?utf-8?B?L09va2lQYXR1QnpYUXp2UCs4Tmthb2ZKY1RxdkZBM0V5dE5hcTZZaXR1YWZq?=
 =?utf-8?B?cFFTL0dGUU5Rd0M3QzN1UDJ6NUNIeXprcGxydUIyeHY1dzVhVzIxRThmZWg0?=
 =?utf-8?B?Q1I5VGxvN3hHcityd003b3dwbVBETHRsTG5pYnNzUzArbjMrOWY3K3hJR05V?=
 =?utf-8?B?RGpuU1NmcCtnWWRaVVU5RlN0V0s4eFltcW1RR0pNa2FDM1VGWmpZdHhDbCtr?=
 =?utf-8?B?ZnFWQ0xEb3lsdkJ3RzQvTXlSdzNpY20yMkp5T3pkdlNTS1BOVVI2eWpjSjhF?=
 =?utf-8?B?REhSaWFKUG01SmVlV0djbTJGcmJ6K0FuZjhkUVRJN3ZySi9rQ3o5bW93NlNw?=
 =?utf-8?B?QVljeCtvRHhzTWV1ZFdIZ3llaWdyTlAwSWdycVVjY2s1dGx4MEJBQmVUYnFU?=
 =?utf-8?B?S0pNeFdPM3ZBcnErdDlmQzZRSFkzN1dKNnB3RjB0VHZBMktkQ2w2RmVxMGp0?=
 =?utf-8?B?NTZkZitOcGI3NnVta2pDT3V1UU4ycWZleFJkRVdiZVJPNDBIdmVGdHVuelVO?=
 =?utf-8?B?Q1FCbHU0WUR0TTg1WWVQcGQwM1VLR0drOEpaTjRuVCtPR05UbkUvendSVmxR?=
 =?utf-8?B?NFN3K0hEWW5BZUdZNzY3VDVSNjMzVERUSnlJVmNOTU1kRHBoeHBIZng3MmlY?=
 =?utf-8?B?elRTcTJMbkQ2eFZYNEIwSUsrN3RTRGdqRnVidzh6NFpSL1RBd0ZZekd0RklX?=
 =?utf-8?B?L2xlTXlTdXFCWjVydWxUNnQ3ZkloK01oc2g5Mmp5ZzBZTUwzbkdIQ0p3T3dv?=
 =?utf-8?B?aE10N0JwdDEvZEw1RndFaXpTeXlabHpOUU5BWXBzbkhoS0NFT1VSYTJLRHA3?=
 =?utf-8?B?SzlRQXdTQWpONFRDeVNESThjcmI4eXoxWkdwTG9BeUgzd1lhUVQ5Ylh1S00r?=
 =?utf-8?B?Y1pwMzB2UmZwbjFwWm4wcTBqN2VBYUFFUWxJbEJiYnU0b0dzbjd5WU1PRXBV?=
 =?utf-8?B?bzduTU4yaUJNQTJpSmpTYlJIK1BLQjlmV1NHMDRXSDJST0cxdWJRNXFDbjAr?=
 =?utf-8?B?a1BUUWRqYmZCdFBObXRLaFIrZUFJOXh3TCt3TnhjTzZHVjFuVVVhSHRPR05F?=
 =?utf-8?B?ZjFWNmRETHBaUUZVWXdST2lnbDZ1V3o3N1NFdHhNMllxVVhZaEVVbmpsVDFX?=
 =?utf-8?B?TVJnY29yOFBhQmNURE9VYm1WT1hrT0lXZ3E0Q0pYMUQyL1FXWU1SQUtIQ2NU?=
 =?utf-8?B?QWthVk1vbXU1S0ZHMFljMDBjRWdTcXJWTGxqUDNQd3YraWxTbFVLV2QwY0ZF?=
 =?utf-8?B?a2JzcnJhS1RuN1hDUFRPVnhock15NncvWmJXUmRGSUoyZWNvWmJmUCtXY1By?=
 =?utf-8?B?TlZiQkFjNDc2S3hDMVFCRmQ1eFpWRzBaRFRPd0tEZ0JQVEZYU2JkazBNSUt5?=
 =?utf-8?B?Tml3dGFPV3Q1bzJzZUJrSmFrbnBnUXdUSTB5cDNwYlpucVozKzJDRWpIMW9G?=
 =?utf-8?B?L2gycXI3WGd5ZzFyb1ZRYlhveHBvUkNVbnpJN01WWWJXaEtrTjdBMGlFZFVh?=
 =?utf-8?B?VFRQOHRzM24vVVdCTEV1M0RuVWZSbUxyNU5MYkxsbXdQQTF1MjBsNTJUUk5W?=
 =?utf-8?Q?UBth6Y8LtWOXHRA8bS/VFLuuW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af1029bf-7cc8-4069-abed-08dbd962428b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 16:07:05.1366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LkY5JrC7ePJsM9yHZHXh0LXHJUuJrPgp956e2VLheyPTMb5MvTBHiTytpSZJmb/UYm91kc1/sRKNuj/dtyv7dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9799

On 23.10.2023 09:23, Federico Serafini wrote:
> Add missing parameter name. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



