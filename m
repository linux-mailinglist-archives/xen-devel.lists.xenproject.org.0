Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9200C72F536
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 08:52:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548463.856430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9KMd-0000PV-FL; Wed, 14 Jun 2023 06:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548463.856430; Wed, 14 Jun 2023 06:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9KMd-0000NM-C7; Wed, 14 Jun 2023 06:52:19 +0000
Received: by outflank-mailman (input) for mailman id 548463;
 Wed, 14 Jun 2023 06:52:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9KMb-0000NF-Ut
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 06:52:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff6fc983-0a7f-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 08:52:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6806.eurprd04.prod.outlook.com (2603:10a6:20b:103::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 06:52:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 06:52:12 +0000
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
X-Inumbo-ID: ff6fc983-0a7f-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4hF4o24Opp4EABxjyIr5RB6j9UlkHetbQKVvESChXJkGhlzBZ7CgCsKTb/O54nICSD4VqirG6mfYNTFMiQbO14vXrqdSK3qa/fflseBMNd5QOeyBhs9D0PtRbL+bjp6vNBvAdXGWybqWumLM0qm8BHoITSY/TGhfAESrdsG5nmo3UH7b+HJ6PRELOyyHb2MEtwbsip1gBgubi4Jt8Mi6gu/EpaEbiXTCZvtI5Wl2VAw3v1Z5QM4DNZLxBrBX2b2lbmgAS7Phmj2ealCUK2kmFneh7aY+fk9ESF5hYhkH+uzWEH7vuFvKKj2bM7D6J5wfbDb1S0rwrR23JsHV9Ub9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHF8ceRqJ/i/Jy/W5LLDJx9ngIg86BYCpYxEQCCN87A=;
 b=fAUTc2yXpd+hyuyoqbeISY1MU8byvpxnCc4kWj5m6WdZ3YJGSGD8GVyHLwYHzyqKEsg/zPBbiGohsbPoUEwuPxlCcdPvAnNdZ8uJrZeWimJaj2BstZQim5rIgomQC6+9v62Nc1ZlxIa276et8ccaKWZD5YFLR3sJYfe2C1cRerIyvysBADRwTD0YnMONs6kRzuOsvew5zmdVQ9eORKRcXAY6bvb6XLVUv2sDLRSlomxeAkNeeWnM4KinPbqO0RTjqpS+zTjHrxU3zsGPY5JHiTGZJULSaQYLQE2gwJjmf2X8lJhRMUMJDwhepOrY4o0hyMRH2T6O15/v5+rUteqXNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHF8ceRqJ/i/Jy/W5LLDJx9ngIg86BYCpYxEQCCN87A=;
 b=mD9lKydLpjHLqnrx9gGibgm3yQeHXwAluRSa6ZhI3UmwKViB2Q8KeNL2RFIgT/OeZj0UQQMsUCen3Gkyh6Ew80eUjnGlJuiUZOHJScyjJPjNDb3uhN8b9h2m2DTkFp1s3V92XpT1iz9UtOhB3P7Ywwout9LKBAZ4wqB4hmhi/gSfAiLLYs+4Jr8QHAcglT9gkp6udQ8n9VPLntKWciec1lIFjw/lp1sqG7Ylpsbpe73vSNPBr3Y7qgIT7/DMqFvsg6vIU66tFznLtBvKmOezlo8Fi9nO7x/tq2fLwu/G/B9RqSmcSGrla/gLw3qK+W5RFQcR6AlACFsST7o1gv17vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5dbb751d-e8d7-fa26-81f8-5a3b1b12cd65@suse.com>
Date: Wed, 14 Jun 2023 08:52:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/evtchn: Purge ERROR_EXIT{,_DOM}()
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Andrew Cooper <amc96@srcf.net>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230613162220.3052184-1-andrew.cooper3@citrix.com>
 <d3883a59-acff-198c-a688-ac2546de69a7@xen.org>
 <86f357da-2fe1-7fe4-c061-d30b8e5bcbd3@srcf.net>
 <fab38a04-20ac-c2bc-7e8f-9ae00524ba6b@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fab38a04-20ac-c2bc-7e8f-9ae00524ba6b@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::14)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac53715-12c8-4372-ffea-08db6ca3e1ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9qdVwhh5wP3Rqejo+H6TiXhHwuRAdj+pJp9YkOUtTtlRWfbADE7qHthoSG2WlFH7A5iaw+rfNy4Ks4ZgrCwPNNSOqGpCVqPNwWX544dRAbs9J1SUOOXlWIwx2EsHk/Uw0pqAJGD6Oc37yi9vRRgdKPS+62MsrzZXDVWnyYFa072bWch9ugyDaRiNjFGXWirgQqTVlcThDhT1LW7nY1LAzOiROZQiWgxCGGMIQ+IG0m2R/UiHGk8jqrpp5svP33sqAp8wDZ3y+kgjihcdfZ5NZkhi3NSRBMy8GRAqcuNFs/SqrwmMfDTCYn19Yhw8ALFusPK+DHr3Pa88HP8EbJ9yyfW3EMiFNr6+zGI43cD2ePD6kdt8mhJhLCnng5kVo2bwWmt4IpIIBP9nssppdmlG1NhGVjyJ8B3D4bqpjQxP5p/XPrYLSX+tUD2cVJjV0dvbWWPxmdo4AWch7FQDYXHPL50JQopwQ4OY0bqUF14dHwnmmIKrTgLm+7qNlKlHndwwFF6sQY7jg3eN7l+8NSf1h4UKaAZJPwYHz3k/P4f392+lCjggdMVDq3ptYW6B+oH7TK1J0dREtkdGeDUO0GxUnqM85zvKUDWb1ehElVItFliM+Ll9d8VzUL7Cvfo/IEDgIlkw70h6IV35t7KQYGSE8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199021)(8936002)(6486002)(26005)(8676002)(6512007)(41300700001)(36756003)(478600001)(38100700002)(66946007)(6916009)(66476007)(86362001)(4326008)(66556008)(31696002)(316002)(54906003)(53546011)(6506007)(5660300002)(186003)(2616005)(7416002)(4744005)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXlwdW9IM2xDakI0V1VSanBHT2NSVTh3OFp5UlJVaDBiaE9pYSswKzlHdVA0?=
 =?utf-8?B?Q3BCU1IwdjFLaWFOZEc4VEJndEJwWlovSUdodFJNSTUzZTdMaFE0UVNFOTdT?=
 =?utf-8?B?UkgxUW1QRE5lb1h0NTZvZUJ2azhvMnhGZ3VYNDJ6RGVCRUtmRllKMGxXSHpT?=
 =?utf-8?B?RUt3ZUFqNDI2M2F1RjdkSHo0S01zRFZCVnhON0VWMUF3aWtIQllnRmVXaXli?=
 =?utf-8?B?M0JBZ1cwdDBWbmlEVC9sUU1DeUN1Y1hZVGVhNEN0Ny9SL0M5SWFjT051a1Zr?=
 =?utf-8?B?dllBZ01ySmw5dkdUMTYrS2ZpN09zTGZ0VDY4ZERzNzZ1NnNRV1lxV1d2by9x?=
 =?utf-8?B?TGFxTUdpbkNMWCtGNVZSU1E0ZUo0RWpPZk1KTXgrMEpicmRBckNEREVkdEFr?=
 =?utf-8?B?UWJuT0QweUg2VVRkZzdwYmJNZVdac2JhOWt3NXU2V0g3OWlFR1JQY1dScGsv?=
 =?utf-8?B?aTN3N3NETmVVMmltTTQyLzRMdnZLQ05kelZUT0d4V2s0Nzl1bDVoWFBaa09B?=
 =?utf-8?B?SFNUMk5VVEdZK2pkK0hvZDBZZ1JjSEtZb1J3clYwUmV2VDRhUXZaUUViVDc4?=
 =?utf-8?B?U3lOcE0rN1pHeXpUQjR3ZVNPUnc5RG1EWmZlM1RUWUsyV29QZUNDYlJsN1px?=
 =?utf-8?B?SmMwcytsSGhqWHhhT3lVRlFxa1VRS2ljdlJtNjZsZ29ZYzFubDAxTzRQM1Ux?=
 =?utf-8?B?dHgrNjJvVG0rQkx5MmRablVRbGZBNFpSWUhkc3l0RHZ3SDBSNndIaVpWUUJH?=
 =?utf-8?B?V1lSNy9Hc1ZHbTUyU0N3YVp0K2RVSSswa2ljQTR2RjVZSEJ3N2lBVDJrWWpF?=
 =?utf-8?B?YlBBUERHYU5OcmFieTVIRnp6ajRrejk0SHo3MGMxY2VSUnQ3SHJmdmYrRSt6?=
 =?utf-8?B?bnIxUjV6MVVuZENYMU9tWTVCUFQzRVZaVUNkYXVKQ3RvYWtIUSt2TWRBMFFW?=
 =?utf-8?B?SlJsR0JFYlRsWXhCZ3VRczRlRERPWlJybHUyU1F6cDFibWhhdi83Q2JneXk5?=
 =?utf-8?B?WGVJemhYdUs0bEp3MC82c2t1S3R1NCt3V1ZBQkl2ZDEyOHdQNG5RcW9hdGRi?=
 =?utf-8?B?ZUkvbC9XbGxZK0R0WDZkTHQxbGtTY245ZzFLOFE3YlNuUW9lMXg5TjZ0ZEpI?=
 =?utf-8?B?YjVzRnc4alhRbHloZUFDcHNlVHdwb3d6cmJTZng2K3IzN0QvVGhRRnlRL2px?=
 =?utf-8?B?aXR2dnBXQUlRQnNYUDQvT0J3SzNldG1oYldYVWZqbDF3SlNSNWZGLzNLbHNL?=
 =?utf-8?B?WHdzaENySDJ1N1dYa2NYMTVhUkxFVFBVdk43SlgvMjBnM3VBVTNnS3pNdHNn?=
 =?utf-8?B?RG85N25kNmlZcFVYNmNKSTRsdy9iclU5aCs2eDRiUnJ5RlU0VDZmbWRlTXMy?=
 =?utf-8?B?VGNLbGhEVHBGZ2ZJeGZZcDhSd1gvdUhBYVZWYUcrbzBtbDNYTTB2bHJOQVpL?=
 =?utf-8?B?RStRb1ViY1pIQzVpWnI1elJncVZGeGZ5MDlBaU5lN1dLaGt3bVJFNFFLNXlp?=
 =?utf-8?B?M3ErYnRNSGtGaWJwRkNENlptM252R0Z3VllhaCtNM1d6bzN3cVhJSytzOHg3?=
 =?utf-8?B?TUxCR055a1N0Z3oydnRVOFdCR0liT2ZNOThrOFRhQjdZTXQyZUtsOXlMYWI5?=
 =?utf-8?B?WDByeDYxQjZuYThjVmNEZDBGOG0wY0tEb0JXemIraVAzTzBvOGZYNWJiQXAz?=
 =?utf-8?B?Z3dmRGVMQ1JIL2NTRlEwcVNPTkR0WktkRVRwUnk5TnROdWtnUmZXUUk1RXBi?=
 =?utf-8?B?VFg4L2tRTnZIMTM1VURzQmFpYi9rUmxYbXQvQjh6M3N1NXdKNmVvdEZrWk1w?=
 =?utf-8?B?MFlURC9ZNWxtSkN2KzFzN01IZ3lhU0svU2FTMktPb1hOY0RTTG9XWHpDQWh0?=
 =?utf-8?B?RHkrWWVRaStaR1RGNGx2YVRDcWhxVE1zNkt1UmJ1eVluZy9nYzR6WEJLMXJk?=
 =?utf-8?B?UFBIZmtQVGhxbTAxSG9DejZXdlpCd052OW8wdStUSEp3TEN5cktmOTBLSkhY?=
 =?utf-8?B?bzI2RnpYVkJ4K1cvVlBnZVFCN1FyQ1hKTWVJcFJub2ZuK3ZRK041WkhESDln?=
 =?utf-8?B?aFZvOEhtWEFEOXQyVkdtZVduTGgra0YwVlhuNHRFNTBOaHhtbXpkZlk5SlRy?=
 =?utf-8?Q?b2jaazLhjmbUzFigZkF8bEGlB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac53715-12c8-4372-ffea-08db6ca3e1ba
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 06:52:12.6713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7TLCb5D2X0gSzBRkxFJsZ+nM9CA3wFqeyDdAXfMFUyxevy+1okieNysvJBEXYkLukdBbhpUNac5vbEtaeoEBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6806

On 13.06.2023 21:47, Roberto Bagnara wrote:
> On 13/06/23 19:45, Andrew Cooper wrote:
>> On 13/06/2023 6:39 pm, Julien Grall wrote:
>>> Hi,
>>>
>>> On 13/06/2023 17:22, Andrew Cooper wrote:
>>>> These are disliked specifically by MISRA, but they also interfere
>>>> with code
>>>
>>> Please explicitly name the rule.
>>
>> I can't remember it off the top of my head.
>>
>> Stefano/Bertrand?
> 
> Rule 2.1

That's about unreachable code, but inside the constructs there's nothing
that's unreachable afaics. Plus expanding "manually" them wouldn't change
reachability, would it?

Jan

