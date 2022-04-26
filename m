Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AD75100CD
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 16:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313988.531825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njMOb-000469-Mu; Tue, 26 Apr 2022 14:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313988.531825; Tue, 26 Apr 2022 14:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njMOb-00044B-Jw; Tue, 26 Apr 2022 14:42:29 +0000
Received: by outflank-mailman (input) for mailman id 313988;
 Tue, 26 Apr 2022 14:42:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njMOa-000445-V8
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 14:42:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17f646ee-c56f-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 16:42:27 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-14-ICHN2OMuEZxmKIWLK_Q-1; Tue, 26 Apr 2022 16:42:25 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBAPR04MB7430.eurprd04.prod.outlook.com (2603:10a6:10:1aa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 14:42:23 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 14:42:23 +0000
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
X-Inumbo-ID: 17f646ee-c56f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650984147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvWIhYE4cEBXVy3Ooxi1iGKA9YQ/B58YM7J25bpT9dM=;
	b=HkScXG3xTC4T1BBLGMXSqVfhM0QcXC3tQFUmsTsILAizTW0CWXJ5GnEgrIcrp5lI9TLkWD
	wKLMOhvzcVazT4Z34mggjCRPL89WI0zgi+1AsijpIxrZMse/xpQnXJVr3vygKHOsEwg/8x
	+waCMzv/WQcFui0W6Ryvevm3dtypDeY=
X-MC-Unique: 14-ICHN2OMuEZxmKIWLK_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBoIHk7C1/Y+zbV21qYEFcEwJqWPZqKYI5gvnVc/lwpoXVqvZsKxV1AHWcXudRzBKMgMBsfIIaHHCbFLIAZbgOKei1miejZWZBeE7KyWluANYvgxzwllJcn3017jcIgEeifpJ+QZnn++GGn8XnuiWYUMuZGt5P3Fe9IZFMv7zdTw9T9dWocrW2AA2gOzPrbeCe7jJwlfAMpuCajcL7EzsDtWfuPwZ/H96q70rJQtiicK3ODG0YWn7XwmLzvPmYdEToKWkRhSyZGJ8CdAxfx9MjU6ksEThO1Ucjaog1PMSY+QjdBBdhW0roH3IK4yLAFGWnMTkWbg3Fy7kEzwMwaazA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvWIhYE4cEBXVy3Ooxi1iGKA9YQ/B58YM7J25bpT9dM=;
 b=J6cyBWi3cpWGWX2T80cQ8UG3ynMUNkusmCpBq5mRbm7cao9yO7RAl8IatE6RHMXjQ0rtLCZr6ijh6Jq6qga6W1eirGL/VVTrF8+fqIjRvUNsk+H1UP1AlHB3zSRaoqCdXzqN9nIXAexBndtsOzLn/ko3BlEhSpA4Cp2w6oM2N+ZbNCLT5MB9EQf0I8FhTHdA4XpHOtlnoN5vnYua/p13OwXb6RdzQfV3eGYEkIm3tHL8Mfj9nNvMDFCUy84JcSGPTgUJSwqhZHqwUxAe4yl4cG6b2den5I2fYQyCBhbhULJgSGl6Wh1r+4YZEwSJQIFfU8pYmASHUd37DKJEmbqlDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <79e3fc8d-7064-e981-b90c-d0f7fa0aafae@suse.com>
Date: Tue, 26 Apr 2022 16:42:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 05/10] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON
 for phys_to_nid
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-6-wei.chen@arm.com>
 <6d666aa4-c0d3-b8ed-9fca-e9d2179564d3@suse.com>
 <7d7fc887-20a3-49c3-0754-3bca3442ccce@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7d7fc887-20a3-49c3-0754-3bca3442ccce@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0029.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::39) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7c2b2bf-0ae4-4312-238d-08da2792f99c
X-MS-TrafficTypeDiagnostic: DBAPR04MB7430:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB7430864A4B941166BC313761B3FB9@DBAPR04MB7430.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pEIy9Ctsmi/Kxg2uPNZ6+lR/X2klJjVRdaEnHJKNsZwcwcOOXOAJXZ5uIKe55J2aek320dHaLgc3lYcu7OR6yZHRZ4YhRooGCp5iNKwegkR7YkmRmM6+q0jMSUxDRxdmsplBiWfmZQslxVXuVVLuOPZh7QMtMV39+0R4pc83mwCxAGJPf6pptsHsFjt6M5q2DxWJJhc8SJSxZlPmR+V0jkywbRnRDwYCZjINu3j/3M3HEQARZkMPz55jJ2GKH818boy0Hv9VLh5sJJOoq5iXd5McG6mRWZ3J0xU6axoz2NQ+pgRJnoxY/OkezGGul86vG1wUABdpxInHbqX8eAZIC3vyqtgV0WqFpowhxGp1cy2ZUJnFd9imKc/nrFxhguijiiBJGANcqCaD0YIFq8n7wU6kKv29oQPvLYLNE56wSbvvJXtxH9u4C/7zRtYpv7A0nIZBLLoojERvBgNXg7BGX2FyQ6cPbcAvCbRf0A1Yp4V05y5pLVNFpeEHe/7BMyAQJlLQPwouD+u33Gwq8vJ5YwMKaO5eSQm/XCSR2gmWdMFzYKlGLHfQj9W6O11zxGzRIVsJDRYbjYQ7qAQt4eE1cEEOQxqJkdW97ZE0L2jb5Q0B5MX/MS7mYJa2vK4IgDcLL707DhxT012HcTSxeOopKyVSKm3k7x0iNmQLEhPAnHMQy4owI4qoNNOWQksC0WEe1NLZ8Ukur8uavRjyzsCGvnF5K3wFpVN8XOAfmDeNvPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(508600001)(6916009)(83380400001)(6506007)(66476007)(31696002)(54906003)(8676002)(4326008)(6512007)(86362001)(316002)(66946007)(66556008)(38100700002)(53546011)(6486002)(5660300002)(36756003)(2616005)(186003)(2906002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVdicUhCRVNNOXhqYmVORStIYTJOSVlGNFMzbjdTdmFieW11NFB1M2FFSXdt?=
 =?utf-8?B?MDFlUU5nNW1Xai9ad2RYOUl1SU5OemE0VWJnNmpjYVdxVGNsdkhjUjVTaHdk?=
 =?utf-8?B?OVp4MmlMNHNyUlpGTDB6UGlsa3F5WXhsblpkNVFkRGx0WXlhWUNUcEIvL0Iw?=
 =?utf-8?B?dE1MK3BQckRxMGZscW15VHVrVWVBdnE0WUc2QTh1TkVHMHhmVFk1QnBoNjRN?=
 =?utf-8?B?WHpRTkVjNVBwbjJjRjE1S2JxUXJQblloY0duWG9HK0IvSTd6b0hYWmlQQSs3?=
 =?utf-8?B?UjFZb2xNS2tSS0dJbWNXMVBvSEtLd05ORWIyemM1Y0FmaEY0R291dTUrdk9t?=
 =?utf-8?B?Q3FtQkVzT1ZObkIzZVV2cEpuN0czMVVPb1p2QzQ4ZUdyRWJXM25lYWh4SlBs?=
 =?utf-8?B?bGdWRVRLQ3VWR0hwRmRKeGNKSDVzY0ZoMm4xWlRBZ1A2MmJiWVJOdFN0OFFU?=
 =?utf-8?B?ZmpVb1NPUHJIbHVpZmJTbjdYakZvNWlROWhvQ3ZWU0F6OXl6RjYxYkViVy8v?=
 =?utf-8?B?TDdmNUhWZDlUZVpxQUZzc3pEbTErWC9qRENGTU9HTjduSWlpWFREZjY2bnJT?=
 =?utf-8?B?UkhIQjBUYm9xZStrNHZHZXVtNldrTzRYbnE3MW8yTHFCOGNMczdTMWE1WTl0?=
 =?utf-8?B?MlBUbHdGV2hjc1E1S1RxdERRYThqTks0RFhJNHFWNytEQmV1R2ZRbmFudXhp?=
 =?utf-8?B?WFlIS0FWUGE1Uzgyb0ZGbEJDcUNIcVFuRXM4Y0tjRFUvaDJmbjJXT0F4TlFi?=
 =?utf-8?B?VnhMcDhOM0FmRjhQa2lraFpheEt3U25vTmNUdi91M2Z0SGM3bkk5bjd2eFVG?=
 =?utf-8?B?aWpFZExWWGNpWW1OaUQ1Zlk2bUV3MVcvOWdDcXhVTUFxTkVNTVVHTG9GL0NH?=
 =?utf-8?B?WkM0MkdlSTIvN1RpQnZvOW9RL3JyMURjZi9wMmttTUsvVVRUVitpQmtKbjlK?=
 =?utf-8?B?QytESG1EQ0JBemI5VjU1Z1AwY3Z0WXA4ZzdWVHJYVEh6V3FyREF1bEI1WXZx?=
 =?utf-8?B?eWpXYnpudkNERitkQnc3Y2dKK05oOHV1eHFsTE5VdnYzMFliS1pFSDFsSWc2?=
 =?utf-8?B?aElwZjNwSUdZSUl1RlZKalhWaEtmZ1RmRXFkdnhyWDZLN1hsam9YTHdRUEJl?=
 =?utf-8?B?UFBscytoeUFRV0pVZ3pCNFdRQWpmMVZTdnkwUy9iYUoxOUI3Q0VzRWhBZys1?=
 =?utf-8?B?ejREbHgwbnY4TGJQdkdJeEFVUVRsWWp6WWxSNU5KYzFlVXBBNW1qc3I0WHBS?=
 =?utf-8?B?RFRzdEJJMkZYcGRPT052NE9obDZLckg4RVB3K2dDWDdINHZHYkJzN21hYnUw?=
 =?utf-8?B?Y213eE5yWHFFaDZnNGM2NGVCcXg0YkE4NE1WOGRUZ0haSHZXc292TzZtM0Nl?=
 =?utf-8?B?bkZ3VnJzc3d3N0ZFN2JCN0JYUWZPRm9iTlpSeE0yT3RDa3c5V3QrTGticEFo?=
 =?utf-8?B?NEsyNm9uN3BidWEzZWlhek02V2RlVzZERXpPVnBCQndqREd6TVFJV3dHdEpn?=
 =?utf-8?B?Y0FNN25hd1QzMWJtbE5tWlZNcjdZSlZXSkE4SkxlZ3hWQ3pkMmhNaXRnV0N1?=
 =?utf-8?B?NFZyREdhZ0JTcU15ZXZHRHZiZllpNlhVYnM1Zkk0S0hWd2ovcXJUSUNHL0k3?=
 =?utf-8?B?TzN5UWNLdERBS3ZGUzVVMFJIU29QWThYdjJ4ZExvdXBJK09vcSs1eGRxdHk2?=
 =?utf-8?B?OXFLV2Q5MWRkT3JlTmNGSzExN2RGNi9qdlFjR0ZjRSs0VVFITkUxUUNseEha?=
 =?utf-8?B?Q0xxdU4xVUM0Rm1XRVNQK0hxci9wc3Z2VkZjWHdnYlV3akJaNXFTcXlzM0NT?=
 =?utf-8?B?ZkFKL3AwdXN2aVJzUmQ4U2V0Tm4yNTdXNTZ2dGxqMktkNlQvSEd0RzdxU0Q5?=
 =?utf-8?B?NTQ1QmpDS1ozeXpqa0U5UDFuczBxTWNFMGxCSm91ZG5ST2hKYXZNS1JFSUZp?=
 =?utf-8?B?V3VjaGpPT2F3V1d1eG93bzVRSUJOUXBrbWNYNUFlbldUQ1lieTJ4WjRNVVJW?=
 =?utf-8?B?ZEZINjYwdDVMYlNYZmt0VE55SUlKM05WdzlkL3V4T2xEZk1xMkgvMkxWcHRw?=
 =?utf-8?B?SUxpemVvWU0xYW9aa2VCZHNFMHM3SnpNZFE3REpyU1hkdDJlbzVuRmlCZStn?=
 =?utf-8?B?a2d4K1QvMTdPV2FnT1hPVitNU3dSeWRuRExBVEd1Y2RhVXAwRHdlekhreVpn?=
 =?utf-8?B?YUlER2IwOFluSW1SaWZqTFkwVFRWRHR2azFsaHlpK2ZZQlBwcy96amdMbXho?=
 =?utf-8?B?cGdoRWtNMHQ0MWpEeFlXMDY2RDI2bVRIcGhtWktZZVNTcGV4dnlmRDRjWFhz?=
 =?utf-8?B?Qmp4dzZleFhVV2xzbWRUUjFXS2dVdFN0eUtSQ1NUczFPaU9jYnJqQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c2b2bf-0ae4-4312-238d-08da2792f99c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 14:42:23.4857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVNYPeEZ1zwxigJkZmxf8kqCt46HfOJ18PqhnbhZ+R1/ukgAm0XOV8UpylCw0hIO2JSVFaqiRzd1AqLslM5jLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7430

On 26.04.2022 12:59, Wei Chen wrote:
> On 2022/4/26 17:02, Jan Beulich wrote:
>> On 18.04.2022 11:07, Wei Chen wrote:
>>> VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
>>> results in two lines of error-checking code in phys_to_nid
>>> that is not actually working and causing two compilation
>>> errors:
>>> 1. error: "MAX_NUMNODES" undeclared (first use in this function).
>>>     This is because in the common header file, "MAX_NUMNODES" is
>>>     defined after the common header file includes the ARCH header
>>>     file, where phys_to_nid has attempted to use "MAX_NUMNODES".
>>>     This error was resolved when we moved the definition of
>>>     "MAX_NUMNODES" to x86 ARCH header file. And we reserve the
>>>     "MAX_NUMNODES" definition in common header file through a
>>>     conditional compilation for some architectures that don't
>>>     need to define "MAX_NUMNODES" in their ARCH header files.
>>
>> No, that's setting up a trap for someone else to fall into, especially
>> with the #ifdef around the original definition. Afaict all you need to
>> do is to move that #define ahead of the #include in xen/numa.h. Unlike
>> functions, #define-s can reference not-yet-defined identifiers.
>>
> 
> I had tried it before. MAX_NUMNODES depends on NODE_SHIFT. But
> NODE_SHIFT depends on the definition status in asm/numa.h. If I move 
> MAX_NUMNODES to before asm/numa.h, then I have to move NODES_SHIFT as 
> well. But this will break the original design. NODES_SHIFT in xen/numa.h 
> will always be defined before asm/numa.h. This will be a duplicated 
> definition error.

I'm afraid I don't follow. MAX_NUMNODES depends on NODES_SHIFT only as
soon as some code actually uses MAX_NUMNODES. It does not require
NODES_SHIFT to be defined up front. Of course with the current layout
(phys_to_nid() living in an inline function in asm/numa.h) things won't
build. But wasn't the plan to move phys_to_nid() to xen/numa.h as well?

Otherwise I'd recommend to introduce a new header, say numa-defs.h,
holding (for now) just NODES_SHIFT. Then you'd include asm/numa-defs.h
first and asm/numa.h only after having defined MAX_NUMNODES. But
splitting the header should only be a last resort if things can't be
made work another way.

> How about I move MAX_NUMNODES to arm and x86 asm/numa.h in this patch
> at the same time? Because in one of following patches, MAX_NUMNODES and
> phys_to_nid will be moved to xen/numa.h at the same time?
> 
>>> 2. error: wrong type argument to unary exclamation mark.
>>>     This is because, the error-checking code contains !node_data[nid].
>>>     But node_data is a data structure variable, it's not a pointer.
>>>
>>> So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
>>> enable the two lines of error-checking code. And fix the left
>>> compilation errors by replacing !node_data[nid] to
>>> !node_data[nid].node_spanned_pages.
>>>
>>> Because when node_spanned_pages is 0, this node has no memory,
>>> numa_scan_node will print warning message for such kind of nodes:
>>> "Firmware Bug or mis-configured hardware?".
>>
>> This warning is bogus - nodes can have only processors. Therefore I'd
>> like to ask that you don't use it for justification. And indeed you
> 
> Yes, you're right, node can only has CPUs! I will remove it.
> 
>> don't need to: phys_to_nid() is about translating an address. The
>> input address can't be valid if it maps to a node with no memory.
>>
> 
> Can I understand your comment:
> Any input address is invalid, when node_spanned_pages is zero, because
> this node has no memory?

It's getting close, but it's not exactly equivalent I think. A node
with 0 bytes of memory might (at least in theory) have an entry in
memnodemap[]. But finding a node ID for that address would still
not mean that at least one byte of memory at that address is present
on the given node, because the node covers 0 bytes.

Jan


