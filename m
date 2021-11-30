Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B239463105
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 11:32:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235005.407772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms0QA-0007EB-R5; Tue, 30 Nov 2021 10:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235005.407772; Tue, 30 Nov 2021 10:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms0QA-0007Bw-Nk; Tue, 30 Nov 2021 10:31:34 +0000
Received: by outflank-mailman (input) for mailman id 235005;
 Tue, 30 Nov 2021 10:31:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ms0Q8-0007Bq-Eu
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 10:31:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aeeb2895-51c8-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 11:31:31 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-aEJL0MoPOHOEgZ8-xZFHZQ-1; Tue, 30 Nov 2021 11:31:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 10:31:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 10:31:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0083.eurprd06.prod.outlook.com (2603:10a6:20b:464::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Tue, 30 Nov 2021 10:31:25 +0000
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
X-Inumbo-ID: aeeb2895-51c8-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638268291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7LUGUM1Y9rAeuOw/zM11YUQqIE0RZ8MLtrD32zeIdro=;
	b=UBOc7D3lcIusX4MfNS1Voih5pK159aVlPIM5zk9Sy3FQ3jtUwGllLKbnasQMUjSnOvctyB
	CGa+LRpp9+2EYcbdHik5VUkPl6194s5HDcsWL0toqNk0ae0GVlRJrH+hqrnfWbW0D+oHCf
	kw3mgqCZ/Tq9Aftl9UBYNkUvHgiQAu4=
X-MC-Unique: aEJL0MoPOHOEgZ8-xZFHZQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYG1lJSkvd0I2ZfTeY4R6ls1DuXpyClnLutK+NzsVLepoK3UUIltSLSPkfxQBlILPP8wWZ82sg60ZJQ66VyhTVxRjqNmyqY7wvGt99zt1N6BXRskv2SyyOCgrTbo+CB2DWs/C0dq6Gj0cVVLIB+UNln8K0xUHp2rYXQcJjAS/5351UemGb8yzgwAUorS2LxVZS7wpMoMCyUJaMj2q1mlnZevv1Vhp81uVhtP2D1sdmHjAMLUuvIzExF6ne0zCN+Q7SnAV7ycYZbGQt5X2D0UC2qN6MY38/Y7ix1WeU/++aNfjDZr3d9uF+DzGOEOq8RADJFoqDBkmzyYoD87/L987Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LUGUM1Y9rAeuOw/zM11YUQqIE0RZ8MLtrD32zeIdro=;
 b=AWXIHpLcVwHkhjEueC0HS4T+hde/u8VtSdIHXam+/E6QslKmzp0g8KjWnbzqwKLnRQR4Sjzy/TgL79854SngmZKlmFNIq/Wx4WXDwjzeCZMBVFeV42990C24sTGmVn66LHQ1PuBPY44OEqNOncsmwwvmfUwe3lxQVNNsMcDbu5q4BXraVAoRoTqfuotAzwmTWBjhA034g8mJ8+7od1jW2/G+SrUpiq1hG/KpeFuTfI48JI2d9BwOyIdTOuawZoBjW65HDYCfb5NcGUzmaCeaP1I8aJibvrj+c4g56vMJOYxhkMtPcxgokSF1oAULooMP3M2lQfbIwGuqu5E27kLxzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a8135634-d5f3-c377-3426-5307327cd1cc@suse.com>
Date: Tue, 30 Nov 2021 11:31:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] Fixed an incorrect value
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20211129194450.62467-1-ayankuma@xilinx.com>
 <3f0230f3-79d2-d40e-f3f3-33201c2792b0@suse.com>
 <bf77c97c-df14-b6f9-cd8c-b3d86568037d@xilinx.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bf77c97c-df14-b6f9-cd8c-b3d86568037d@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0083.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23bc4a46-e81d-4ecc-b448-08d9b3ec9030
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB703743CADC508A4024A0C797B3679@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n1THYGLjMPrc71aThhAlSWBtFavqUPat6+df00s/CoaxmURBf3lSrT5PIaR0KEQPTxDZOGBGPg9aexMFqU06Z+Jju0DYTzxte1wbehHBTBykUdt3b/C1t+oVw8lSRNUvPs5WVjxgKUqhsZYcVuZYPCOsb3c9Ev3/PIaj2lZN9ZWAcW13NgByXOovtS3M9Ux0PALjd73uZh1LgPSRDNkocpiOIkGtEAn3pDEeEMRAD4tnZIaP9hAUhm3F/WK7uCNV9bdLZJZovGXGMSv/Zgil7HKemM3b7WZ0s/MOd3OE54tcqELfIaw68m1RbR+hqRoIMyDC2zU0ieGAB/WUh4RK4jQPl5FmoV2tyxa/aLc2e5GIn8wfz1JlTSkiwpivnNYVsnR2oPR9mOu55XFEYimrKL6pH5YWpMewuT24RGfLLQ+PU0c8/yfuPmvI+K6aXFDxWif56VbmM3F1AtcpyxZgz7KhnSfVeuI3n7yBIiJsDqyGmIEdoQa2AkEYqhRf1a8DLpIWKezKhHmBFSHq4EbI2adUuuO001KXh+Y2qDFOudOxCijA4S0WcJIfg5zmHC1Jioot7REN92kTXtm88XlLYykAeIjPGogCquE7+zKRXDxJDVlmJkuIZspl7CI+ZaksD5BCCv6OEKUViOib3nFkc5ntRqwZ/RxNLnX5yr6YJVDi3H1euj+2IrLUUoxKLa/K3jF4lZxamgUMdu53nWLGoZwBMHG8qBnyJcxujxQpE8I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(5660300002)(31686004)(38100700002)(66946007)(8936002)(4326008)(66476007)(508600001)(6486002)(8676002)(186003)(66556008)(316002)(53546011)(16576012)(36756003)(6916009)(4744005)(2616005)(26005)(956004)(2906002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmdWVE53TUZ4TmNSNWRveDl0OW85Vi9xZm5qT0JQSEtjclovWVViL21qMnp0?=
 =?utf-8?B?cWZQQXduV2RDRnRWRW40c2Z0dmIwbWtlZmtScG10cEVVQlZDQUE0cWFMcVBX?=
 =?utf-8?B?SnUxbzgrYkVmeHRudTR5L1VzZ3RvdCs0RGNzNWRaZlBsMDM2anJBWWZGTUxS?=
 =?utf-8?B?dXlONmcrbnh1cGd4L0N1QkdXamFGdG1lWmozdnJ0UVVWZGJjWUhROEVPcDhP?=
 =?utf-8?B?NGpITklUZEJFM3BjY3lTazZrQ1cwR3haY2M0NXMyWlVBVHVRRmNCYVczeHlD?=
 =?utf-8?B?NEptakJCUlQzSzM0RU1qWG40dmJ5V29ORVhEeGFyalByV1lUQWVrRHF5QU1X?=
 =?utf-8?B?UU9HdDR2eTBrbDdFeWR4WnY0M2sxMG9BR2RTczZBdnkrRmx3V2RCVkNzbnFY?=
 =?utf-8?B?RFdBbXE2MlErb0R4S1FPTjFoeU0wUFRSbUt5MnVKS1VLbEZZVzJQOTZxdk5w?=
 =?utf-8?B?WkdBb0N1QWRpT2pTWDBuTnFhMFZrTGhsMkhZSGZseGh6Nk5zR2xIVng1U29I?=
 =?utf-8?B?T3M4NURxakdNd3cyaGJDcEg1QkxKNmE4QUw5UHRwdkFENkdpbW5RNy9iT1FO?=
 =?utf-8?B?TlVPZWtEVE1SOEJaNXpBd0Y4ZGZhTEU3Ujkxb0V4VEZSWXhxVGUwaFNHRWtC?=
 =?utf-8?B?bytYeHdWaDN5c1JlRlNPK0hWTFQvTDlNME9UU29WL2VOcy96RTN0VC9SSnFV?=
 =?utf-8?B?ejBqcC9VeHQ3Z1gzYTQ3ODU0VExhcm5uMjR5d1FPUWE4K0dUNWwyYVQyYzNn?=
 =?utf-8?B?R0xFd3ZUcjJ3ZnMxbGdQRkw2ekhRdkdLbmRTY3Y1T3U5UkdHUVprUU9hWmJt?=
 =?utf-8?B?ZmFId3lCeG1oYzQ4MUR3UXFLbGRLcG14eDJlemtHOU1vckZEQTgzbTVJQ2R5?=
 =?utf-8?B?WFAvOS9IWWM5YXhOcWNGamlmOVZEOGczMzV1bG9kSWxOdHE1S2t3YXpjNjhM?=
 =?utf-8?B?WExiNXB5YWRaVVZ5NEVCdU1pOExJaHFJaGtYbjJMNXJMTFpwY1J3RCtlbjRM?=
 =?utf-8?B?bmVFVmFEUVdlQ0ZCRlVERTVFVFJaR1ljUUhRMTMzQ1dPa1FsQnNNY0JOaTh3?=
 =?utf-8?B?NUhySVhqaHh5UkpxNERWS21vK0xPSmZCMlJmaDFLSEk3eml5QUROQjh4NXRm?=
 =?utf-8?B?MXNmemZ1NnR2TWRodnBVbVZ5Rmx4eGo3d3RwU0JtQjNLUk94aTM5QTRXWVZj?=
 =?utf-8?B?OE9BRi9uTEFIaXZWWVh6TDVMc3FkK0RXbE5abFpEa2RJRU9WVjR4cXRvKzc1?=
 =?utf-8?B?Q0JIQmNZZ3NZbml1QXQ3TC9PNWRoNm8rWUNpV09iaUhUR1docjBMTVl4NTU4?=
 =?utf-8?B?TCtIelFSdnFmL1RJbkVOaFBZLzV6YjE3VHQ0YWNqeUNKbjVCa0QvS0RSVDFm?=
 =?utf-8?B?ZC9RNXBFaW5KRzdUc0NyTjBaTW9wd254WWd4cDB4ckRhYUY0bWJ3eUlVb0Qw?=
 =?utf-8?B?d1hqMmxRWHE0RDVTR2NhVzl0dFBJdWpsM2tBdW1XQW0xbElXVjJDZElWdXc1?=
 =?utf-8?B?b3gvSXJTM3pMNk90Y1Y3MHBPb3pVcFBxM3F5MndDT0RMeXRXVklKelRGQmxl?=
 =?utf-8?B?QTFMU0ZudXFwRUIrRG51VUp5bmRNQUVka3Bid1k1c1hCRnhLbys2Zm9hK1Jx?=
 =?utf-8?B?UVhSN2ROMVdsbVhrenpYenFCbkhsKy82WlkvOEpBWjdkQUZ3VDRVMWpVYkcz?=
 =?utf-8?B?QnBnMVQ4WkNsRmR3ck42LytURzRyb05MVWtDQ1NOZWZJRHNiNGNENHE2ZWJh?=
 =?utf-8?B?T0tGNTFBRTBlTEtzd0ZZTytaZFJBWGd1b0Z2VDk5YkxST2R3S0FQNGV1T3E0?=
 =?utf-8?B?dE1aSFBwTGVyazJpQnVKVGtocHhLMzFDWmYzWnlYeWp3VmRId2V5VVNsQ3Ro?=
 =?utf-8?B?V1V1NUlOREhqUTNFUGVxZ0xlN0t1ZHltTFA5VU9WU3NQcmFzWGEwbGVVbWhM?=
 =?utf-8?B?NnFaT3hBQ2w3ODU5dkl1eFJPUytmeDE2Y3JoSXp1ME9rYjE1KzNaK0dZSFZO?=
 =?utf-8?B?cU42b0lTZGJHeW5TRm5LdC85NWN1YkVBVGZkbzl0N1MzSGFTN1JZVHFET0h2?=
 =?utf-8?B?YXJQTnRldlNycEtRYTJNS3VDWVZqVCtGNk9vUTRXME52TE9LY3ZJOVNuYTdD?=
 =?utf-8?B?V3FkSkVUM1dZWTFSaGlnUHlMUmRxczF2TVRaVHgrUDQ4amFEVk1CTWM3QUI3?=
 =?utf-8?Q?5ITG8lZhUyHecA4C486auO0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bc4a46-e81d-4ecc-b448-08d9b3ec9030
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 10:31:26.4659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GI6HRRsSj4icCUI20wfqfozSJnvrg9K0CbwvVj5KCYC3MTYjQ5Qy2S3kUurv88K9eKLlwty9etbxy0862WVOTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 30.11.2021 10:37, Ayan Kumar Halder wrote:
> On 30/11/2021 07:18, Jan Beulich wrote:
>> On 29.11.2021 20:44, Ayan Kumar Halder wrote:
>>> GENMASK(30, 21) should be 0x07fe00000
>>
>> Please can this have a meaningful title? E.g. "bitops: fix incorrect
>> value in comment"?
>>
>>> --- a/xen/include/xen/bitops.h
>>> +++ b/xen/include/xen/bitops.h
>>> @@ -5,7 +5,7 @@
>>>   /*
>>>    * Create a contiguous bitmask starting at bit position @l and ending at
>>>    * position @h. For example
>>> - * GENMASK(30, 21) gives us the 32bit vector 0x01fe00000.
>>> + * GENMASK(30, 21) gives us the 32bit vector 0x07fe00000.
>>
>> Once at it I think you also want to
>> - replace the word "vector",
> Should I replace "vector" with "value" ?

Perhaps, yes.

Jan


