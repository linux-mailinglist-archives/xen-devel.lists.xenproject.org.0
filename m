Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0972265DAB4
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 17:49:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471336.731151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD6wj-0003zD-Dm; Wed, 04 Jan 2023 16:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471336.731151; Wed, 04 Jan 2023 16:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD6wj-0003wo-B0; Wed, 04 Jan 2023 16:48:57 +0000
Received: by outflank-mailman (input) for mailman id 471336;
 Wed, 04 Jan 2023 16:48:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+XhT=5B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pD6wi-0003wi-6i
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 16:48:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acc592db-8c4f-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 17:48:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:48:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 16:48:53 +0000
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
X-Inumbo-ID: acc592db-8c4f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KByuMl3EQA2boIbd/IEpUu2zIs2s5DUsfCcF+o2bffxPD8rlQ/yqNoyAK83ENLldmgWtc9x09upKadJBgasG2Yye3BIRaOWzofK2mO5byltKjZt9+PFVrkKaVIpMEf9Rfhm5oM9kirG+o6eQfBun5dCBOZ3QMyq5od9uhEMI+lRe9ANn292/oeV0EXWlousEXVpGwAr+GGwaUFzuKFUHVe4G7WDg1kCD5Zp1+8LO0lCV5R+cE0mtPKalBHm3a49GffkMTiApM7fgM/1Ea507SuM7FLrcpYrwPRkIzFZtqmY7bhgB0BMF8XyUyzsfqPMC/0MJTXGuW0UinJlD80/Akg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xAmverj9++5UlRNO3QmIsOYSyc2TLNT0B7BkJv09qQ=;
 b=DqYwGhYsK/kAqChvuQVFRTEAIFQO/H8wASIzW+9eJ078bv/PZXL45TMdlvKqe0jgPEBugKm5RQyDoJlg8lpiMK3dI8KqE4TXrFhzmFkOCsrWb6dQsYAqckbGJLXzJmcCdwKowiBjRYLkCsg5/A1C2jIISoLW2dGIjEFqO6Oqt0yE7qvK7BFiNs0HgRznnxxfurj4zpKYSZIAwLd2xXpu1XEgIalmowcKchLu8fgv3t/Ke8h6wWozAHD4Fj5qGXW076/PfGVu9rlqAdJLlVrmqHV5/7clMPwm3jSfAGMTg8/avXeAV8pfUpkox8QZ/YWUf3jCLf5MX/QQtI2aj67YmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xAmverj9++5UlRNO3QmIsOYSyc2TLNT0B7BkJv09qQ=;
 b=s+2KXcIBjLaSUvUoKlBik02Oty7Ci9zfOE7IkVcA5+QCrMHDkVfvK7dawnkjCmRttT81jcakwVLAo285bwbhjfP2Eh32uyKdHsPWCIOC64hMTzBw1vwZhJkebjgzRpYTE+BBW2FF9k7D4pFRpYwiBRiBpUWd3wy1n8HD0POcJNR9qsw7AHNMrmUO6t+okVcX3/DMPvJejbLNdwGpEDBhFUbVn8ko8HoSmQXvlirHGOtPxw5LC/1uat9qDmd+84HsSv1J7sRylI3GkQlINbvJBVUP63FOR4y7tWwsIdWMLDL11dR/HyNc13G2U9W1ybP1mskBDGNZ25C64Az4KJW5VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <23360b49-5e64-4b8b-49b1-214a26d9fd47@suse.com>
Date: Wed, 4 Jan 2023 17:48:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] xen/version: Drop compat/kernel.c
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230103200943.5801-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5083e4-d739-4c70-c622-08daee739009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5hy1+vjpu7iK4XuFizmCeIIzj4pYaDqku8oNIiJwqnWelWWhufmQWQRcuGMe4JlrsN4785+WAwV4T8kqrQTKpOD3PENhNWTpmF7ZA6UqM25dekpeXN9cnAthXxqExi5m2OkVpSIAeGJZVVboWPIW79gV8WDwfRGHZF6hy//9FEDukOmDrTRnaoVNaQCtItmS2xfCegvcVpYxUK5OdobcOB+t1UM25+2X3kFJ4R2NGp+rygdBrrSxRn5hn4CZEuXOFFoaQlVaS0Xa67KM2gwT+bPBatxCRCTFq5LgfEy+SYFht12NjdvLmfX3OND3379zOmO0HiB7MiFKuQxbmOCXvb0UV9pEIpPkRK6eaji7jpsRWxioiMPwNlyy6L17v0nDBhjAVPZ6JbCcwOA0CuGqWVyzo0dDigEGDSa6he2yFrSIx3+PZgSIDgnvXWR8U9EcL9/v4YWmrUfvIomt2htGitin8rYP0EW7NegzTUckDn6I2EN67UB2buWBLDenSmwve8vVhgXhLWuQ7V74wEhU9j0WFSLRF0aM7mBd1MIgK1mjEVd1KObC++p7cqUG2vGjMtGGeBB3ZDAtSVKcY6ebdjA491EWsEeGn5kwXuB3rvR2pJnFkbEWPirX8TjynUkV14zlCm5NMEDZF3jzR+D0yAQrhVcYsuqywDvAKJ9ll3PrBe+kpimH4HgaoJSI1SURC0nZ32dkTjYgum/salSGyNnRV7x29h/tk4UjaxGy7pk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199015)(36756003)(8936002)(5660300002)(4744005)(38100700002)(2906002)(41300700001)(83380400001)(86362001)(31696002)(66556008)(6916009)(54906003)(66946007)(31686004)(6486002)(53546011)(478600001)(6506007)(4326008)(316002)(66476007)(8676002)(6512007)(26005)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUVEK2Y5SmxOcndTWkdlemRFRDByeHpsemZpa1dyd2UzTjIxYUE0Z0NiRm1i?=
 =?utf-8?B?RGsvSkxDbUJwVG1GTk9mZE9BUWRKYUdtNGpEOWFYQ1RhcCtiY3FPMHhpT2dU?=
 =?utf-8?B?SEE2cVVZTXZhajB3bytWK3VLbEZjNXJHNTU0UkJWODZ1UjlCZE1YZnNYQ0hN?=
 =?utf-8?B?NGhFeHkwb1NTTGMwLzFOWEhmUjBGb2NybVV3YXZzNS9sKzRVTGM4OVFjWCtv?=
 =?utf-8?B?Y2NvVFhoeXNHdXEvTC9nTmEzNlBvTXhJRmRjcGdUcm5WUkF0OEJPOGpyS2Ro?=
 =?utf-8?B?QTZOakdIL1RDUGZTZ3dIT3V4NXo0cnNYTnZ0WXZGTTQ3QTVjakhQS05WWldi?=
 =?utf-8?B?MWZ5c0k4eW4rK0FrUjRrZ2pOYVZGaXBXcWRDUUoyamlCUlJ0eWpjb3ZPNXZh?=
 =?utf-8?B?ak10NGxGQ29kYUFmeDYzNEFremxLK3lwWitvYnJwYkY5N09nckhTTTRNaVVZ?=
 =?utf-8?B?d1lEVWhENC9taTFyY0ZSSFJsa2VtR2IxQ3kvbUd1TWJ5aklhazBvVzhrR0s0?=
 =?utf-8?B?b2VrVlV2UjIyVVZkQWlubXlRcnJ4SFlWSFlNMk5PbjRXQ2RTUTh4L3VVSjRF?=
 =?utf-8?B?ZjNQNUFqdTZHVUhnMVdYeUUrOE5rbkd0bkZtNnI1RjN2QTZ5TmhsRUFtTUVB?=
 =?utf-8?B?U2xEcHVVRHZ4SzJMNlVaVC90L2ViZFE4VzNvcXMvekNXKzRPb2lMREI4V0Vj?=
 =?utf-8?B?RGF3am10NUJDYk1xeUF4cUgwK3o4R1d4RlZxcmNFQ1NxRmR0SHBRT0FBUGc3?=
 =?utf-8?B?Z3dCczNtRThRSm5pVXo5dzloK2ZNQzEraW10VkhCMHFLU3phbkpRc0RkY1Zs?=
 =?utf-8?B?V2VvL3pDTTRESmZndU5yYnlNbHczV3FJRmtMM0RiU1VaRzNURmRvZ0t6RmJV?=
 =?utf-8?B?b21BaGNSM1EwRG0rMFdNZWJhWlFCMzN6VFdzUFhsR2x0VkZ0dm93M0pFcnh2?=
 =?utf-8?B?S0JKc3FrT2F1SWNJeVdPc1l6clpyTitkbFlzWDA4OUdqSHV2NURnR1U3OTI0?=
 =?utf-8?B?L3FWZlpEYThMWG82bzAzMS82TUJMQWQvTUE5T0xma08xTnFkcGs4L0hhNEdi?=
 =?utf-8?B?V2pyVkkrdVpXd204a2VBdGxFcUs4cFBEOFV5WEYwYk9KcXdSV3lKbHhidFFD?=
 =?utf-8?B?RkFSUEpRYmhlMzBxdFh3R0J5ZEw5Y2tZRS9lY3ZOYS8yaGhrNDFpdlNUL3ZO?=
 =?utf-8?B?di9CcW8xREdRWTduVWhvNUFONnR0Ulk1dHYvS3UxTjhUTXFlQS9ZeFJQckJ2?=
 =?utf-8?B?U0V1bUVNTkRMVW9nb1F3R1E2SDI0OHlBMjRVa1AxUUk1R0ZSTEhaNk1rMDBK?=
 =?utf-8?B?QUk5ZERhT3k1NEQzdGR0cVV4d2dMYm9sN0djTDI5cWFoRDNRdmJleUV0RlI1?=
 =?utf-8?B?Ty82SEhFRVFYaDF6QnpZYzNOWEdPVG93Z3E5SzkxQzFMUUNTbEI3L0FQVHcv?=
 =?utf-8?B?eExJSWprSExQVGwxcGtXOG9rKzRRb2NZdlBwcmt0Y0ZGaDEyR2VMNWhOMmJj?=
 =?utf-8?B?K2ZvU3FScU0yVTRJZmZtam1JT0VPd2dlQUpCYnBTUDNLazNFZlZ5NzNiZktI?=
 =?utf-8?B?TWZVK2p2TS9xRTJJTVMvWGFQQVc4K1ZqYzhPYWRsWHdwcXB2VVltRS8yVDVT?=
 =?utf-8?B?SFJiczdaVGdrUC9BZEFOUlVVZk13aUdHeUJsYS92MVYreFdMRkh2a2pWVGQ2?=
 =?utf-8?B?SEJQaktyNVVKWlJiRGI3ZFM5ejJTUmlrTGhycXo5M1RsSW1BdVhDQS8yL0Vi?=
 =?utf-8?B?Q2k4NC8vSGppSlVpREJOWXc3K2lTUnB1QVdPSDgvQzgrdTRvdnJxalgycmYx?=
 =?utf-8?B?SUNnZmNEWlF2MmFMTERWZk9zUXdBMW1MQ3lOODM2K2lXR2Z3ZmhBTSt2QVB6?=
 =?utf-8?B?U3dpYUkzaXZxTlByM3hIZ05XWG9qRk1SYmo3QVN3cmRhdFpST3BuaWdUM3Vt?=
 =?utf-8?B?R2xGVS9JbWd5MFhqNDd4SVRBMno0Qm0zVVVPR01XNHNTMnIrWFJpNjVCWitH?=
 =?utf-8?B?Njh2YlphM3NUQ3l4VmdTWUlyT1BuZ1JpWS9EME5nK25iMHk5UWJrd21hWTFy?=
 =?utf-8?B?LzkwTkVMbG1pMHhXQUVnUmNYUWUxUldla3RhNkJZNk1PQkJuNlNxODZrbUVi?=
 =?utf-8?Q?HqaLFb+XJyVg9d/IWcxrtkLU9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5083e4-d739-4c70-c622-08daee739009
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:48:53.4524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezlwZD1NIfHo2xTeGxqdap1K6p/6QpPPeyXkoNXve+2G+1sh+1ak9IBGgjUoVLQk1U2BX+e7XHj7nad0cP84tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9351

On 03.01.2023 21:09, Andrew Cooper wrote:
> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -169,6 +169,9 @@
>  !	vcpu_runstate_info		vcpu.h
>  ?	vcpu_set_periodic_timer		vcpu.h
>  !	vcpu_set_singleshot_timer	vcpu.h
> +?	compile_info                    version.h
> +?	feature_info                    version.h
> +?	build_id                        version.h

Oh, btw, another minor request: Can you please sort these by name (as
secondary criteria after the name of the containing header)?

Thanks, Jan

