Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BCD554DA6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 16:41:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354010.581049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41Xu-0008GM-SD; Wed, 22 Jun 2022 14:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354010.581049; Wed, 22 Jun 2022 14:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41Xu-0008EA-Ov; Wed, 22 Jun 2022 14:41:30 +0000
Received: by outflank-mailman (input) for mailman id 354010;
 Wed, 22 Jun 2022 14:41:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o41Xt-0008Dr-A7
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 14:41:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60047.outbound.protection.outlook.com [40.107.6.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65434f00-f239-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 16:41:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9347.eurprd04.prod.outlook.com (2603:10a6:10:357::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Wed, 22 Jun
 2022 14:41:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 14:41:24 +0000
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
X-Inumbo-ID: 65434f00-f239-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khNefwpP3pA1IhxOCZEHJgILXRvrqWLTscfxXSnDJUw+DDgOzaKTeh5HiRkPoQecHW6GRKybRo33sk0ye54K0drNyXpwmbwhgyRRtMchwlDmm9JkHZBIZ8qpo1zXsWsviFM0jCfq3GTs4vqfxdaNYcU5N5nyRQCzphszDP2OuRgPGzYJB2Xp88VJV1U+4FVZcCLSyhDrWs/Fw2+I7VRtQg1kLoFJkehg/g6ixAhPmCg/FOR5w6dafUiwA12zbEAowOnCFTMyEPUNYCraNnqzyzFQZuktShdxWZceWXZxQL2nTlbBv2SgF2i4p6vBmricbUy1emKuoZVjiqlsEE27Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxnYRklrBNX/a/PCwFncD9PTfIZLtozlem4/33xpRxo=;
 b=LL1/Nhn3geCuUmYVQ06Js1DvBlfblfGN3/4ehSUqcXUXLjfYsNhq4PlwPBSkWsYisbvxD4ygsxJeQPszjUGT27cHOskrVEorv79f1brrCyCOajj3sFLaoOZtOT49XZGOLRIbfURfQRVnWnijzOrlmAJATOl5lOaE2JVIVJiPT/pcD1nXfMa6ezPRN4VF2lYGV2Z6FuPIZEuQvtHNceak4/c3u+QtPBh1vVWBauftV4qOd1gyeokVXdwdRQCR2sByYrWOvtefCdOmQbdSp6QnCC6rXSjHDytp2UJDLyPpR5bWr03ggoui2s9H6Dr9ARhfZIrmi6HxG/IS/BkSBUD36g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxnYRklrBNX/a/PCwFncD9PTfIZLtozlem4/33xpRxo=;
 b=1Fvmza11M6xGz7QWl6vLXDDVltpL1hI4UOHu+VV3fvKa+rH+Xu9JvUKWxhDbcx21k3MMac3zZC8FhflOOpgq+l+EOgkXHpzsNQo71I9R5bvMrGUB6ORjuHDtF8il70RuwmSjDJ/nuX7StC5I9AT3VNw/neo5IohGzqn2u1KhXZH6V1z7HepFF/UhdTZNh+6uyWlwS9Fcdh9DxWFd2UMznjVlE+8BqWLid3CF7RmuZOy2+2aWl+bTOwJTcF0yNctgzJuEKKiTTo2XpYGJswCvpNz5yottIjw8HqdqLF5X2lW1kRb2OHjQsBZUot/5t6NxYp7KO1iO5LmKbBwbONBCCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a8d70e3-c331-426d-fe96-77bd65caade7@suse.com>
Date: Wed, 22 Jun 2022 16:41:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/9] MISRA C 2012 8.1 rule fixes
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Michal Orzel <Michal.Orzel@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <dd016e82-2480-0e1e-6286-18b2f677dd65@suse.com>
 <74ec2158-3d19-3b2c-1e8c-fb5b30267658@arm.com>
 <d91bb4ea-41be-225e-e2fe-1b03aa06c677@suse.com>
 <C45BA6EE-6294-4C6F-ADC4-3DE7C8DA866F@arm.com>
 <68d7fb35-e4c5-e5d2-13a8-9ee1369e8dbe@suse.com>
 <BE80A241-7983-425F-9212-0957E29AA5C7@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BE80A241-7983-425F-9212-0957E29AA5C7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0037.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 913aec08-23bd-4559-d225-08da545d47c4
X-MS-TrafficTypeDiagnostic: DU0PR04MB9347:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DU0PR04MB934730222CCD7ABD9C9568F5B3B29@DU0PR04MB9347.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xZZhuN1gOgUL2X7XVVQGq5r4PNkuam1gCVWYWZwZO929B3FmHJUdUGMvgnr24tCZrUqtlHXs7yb1J/RepGf+JMgMR3+CwEiob7f5N4HTf9vwopLlgEPCanDjqltjFefl+b3/FNOMXwBwy4jAFgk3kSasW0+DiJLCq0jCF9j5fbMEPpgHKdH06cDB+BQ8lIUWEZJPA92+op9zsCmCp71owdLFl5UfIzHKKmU7jpNXIMSiS8x3pPQFQegff9LYG3oaWoNS2hFHV2Fe97D+R9AVuzeHQ07OEg8ybcooIz+/Z8t7G7qe8Gi/EOvRlghOOhEdClakKZrt0wa0ION2UFJ6jFZNsFQLgPGPbE2qHHO5epQNG6h/1fS5EXHgKu+eJT1sAwC5XCPeE6seUM42A6fqO6BDZNZhMz9PbjEIz/J9LGc3LTC1HpilKr+BxGeKZymR0yXAW15HIgiBk9nKCi/uo+vGswp4KaAkEDCMwIrFamBbI8c6UAPpOue8yqqJN7yaJYD2qinC53Ip2iz2L9UOT7rqVsK3CC158jPY5pzmvy7ZzVT5EnDqjOOunpMWmQL4uhFrO2IvX13dqzs7/sYO9t9YTGsDA07W3MRleGSyzpCtATbMOsZJ/lunHOntB5pHfwOeApt2a4/A8Zyd8WTRVrE5q87GfnBzgHGSKnGipx7LvsS9xYSkWAUlYusGxdqzUVIxovtpKwHSiKzpQo8vHKs7wSj+hWzJzobiPXdSfvwEMDf2KtffhKPxDZNNfHf5OVLLQHNztQEd4uvgcfL0cl33yB0J3i1VKDZpY/zvR7E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(136003)(346002)(39860400002)(366004)(316002)(8936002)(38100700002)(7416002)(2616005)(26005)(31696002)(6666004)(6506007)(41300700001)(6916009)(6486002)(86362001)(31686004)(5660300002)(36756003)(478600001)(6512007)(8676002)(66946007)(4326008)(66556008)(53546011)(54906003)(186003)(2906002)(83380400001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blZsbzd0dUZHdmVKKzFVck8xNEZSK3g3SFh0bktXcVpSUHVXNWpxaHRjWDI3?=
 =?utf-8?B?TkJYUS85bUdaR1dNeWVRRUdKYmx3bXR1anBuTEFuRnBpcFZpMlVyQUptbHQ5?=
 =?utf-8?B?NkRVK1A1UDRKUUdrOHB2dXlrSSszQlR2TjBIM2NBM3R5ZUtXRTRlTDVMaFcr?=
 =?utf-8?B?V3kyRnRrRXpKWnlzNGVyMzlxK1Jvb1FpTzNtWTBDRTVUQWduY2p0NHFVWkpS?=
 =?utf-8?B?Ylh0amFoTGlIWXBBejd1V0Zvb0ZXbVlyYVZpdlBoSnpFVGxsMjZjdkMzcmIw?=
 =?utf-8?B?cFAzUzNFRkcwdXVONi9BUFRuejdOcmhEdEQ0akVjMzZCYzdjb3ozWXJkN05W?=
 =?utf-8?B?dkE4QTRjdWRHZ3lsVW11aWZ6a3owdmlqYmpNSmhsZFBZdWx0anowVHNZTkpl?=
 =?utf-8?B?R2swY25HR1VQbll3VTIzY3l2a3NGNEVETUVkZDg0RlpIVEFHQWtYdHp5RzM5?=
 =?utf-8?B?RWY0aEw0UnY1TkkzZWpIQU5vYlZncWNvMlVxaDJIOGVyYStLRklnYkV1WDVn?=
 =?utf-8?B?SlgvakF5Uk1SM09nRlhUangvUjZReTlLSHQ5QmErRS9FT2lHQnNaV3VNK0Nq?=
 =?utf-8?B?dlR1eElpc1dsRU56UExoNXFibWx2bXBYZURkdENqK3dPS0x1b1k5MnZGdVNp?=
 =?utf-8?B?TjdDQmRjckk2S25INklNM0pwR0RDNkhIUVV1bmlsT3ZzUnl4UCtjSGVHMUVv?=
 =?utf-8?B?UDJyc2VVYzRzUFVnaDZqdlMyZEJJM25lMGFwekFVQ0UwRzcrNkVRLzFlWFIr?=
 =?utf-8?B?TTQ3OE93dDRaSEM5V3dZRHhjQnFSb29LMHVQNm9iYURPaWR4UlR1RkNXRGFY?=
 =?utf-8?B?ZnQ2ZmNsYm5yK3VKU2hBNEdyM28weW1LVVV6RVlja3pWVWw5ekIxSDd1QWVh?=
 =?utf-8?B?Ly9CZ1ZIejRBYURZbUE5azhqeStxYk9XNjV5WEt2UU4rNEw2VUdpUjRnaGEw?=
 =?utf-8?B?bzZURlA1enVWYitrL29QemZyMFR3YlBIOGx5bDBpdnZsWGhoeWFRVTBnUHZM?=
 =?utf-8?B?ZE4rbnJYcEFFMngrcXgyNU81bTErajVKWnRFTWxhekkyRlZpQmxGWUtQdm9Q?=
 =?utf-8?B?RWxhNjNGNU5sZ01tc2hHSVdBcGg4R3hQV05hRnlKaU1JVjcxMFpKU0h4Zy96?=
 =?utf-8?B?TkZ5N25QbkNqTWFvZ1BtcDl3T2VzbmsvWDE3RklOaFhMY0phd2VXRUZhd0tS?=
 =?utf-8?B?a1FYQjEyZWtwOHMxYUZ2VXViMzd5c2JuYjdveDNaSlJDMlN6Njg5ZSt0cDBy?=
 =?utf-8?B?WGtMVU4rUUIrU2Q5alUzeUdQcVE3Y2NaWm9kcDJwemdZMndZYkJwV3g2V3Rx?=
 =?utf-8?B?aENKSFJaRmVkV2RjZnJDdW15dHhuZm42TFZyTGlmSHFMWVliOExXMStHMk9X?=
 =?utf-8?B?VzlEUEJ5WWFoUXpYZG9WNFh1MUxyNTljTWs5YkhZYnpyT1pOYjlUaTVGNFZU?=
 =?utf-8?B?VUdmRHhySzFCT3daVThLYzl5RFRQNGhLZXo5dGd0S3BLTDdSdjNCZzQ3YXdS?=
 =?utf-8?B?VGhNMnRzWVA4Unlnd2NmcDlYZGdnRS8vZ1hNSHl0QXNHVFpuU25GRUxDZDhl?=
 =?utf-8?B?bFB3dzRmUERETjVHSFViOTVxUGMyang2REYxdmVIRXNjZkd1THNlOHE4dUtL?=
 =?utf-8?B?Sm9sUVpyUkx3T0tvNHIxYys4K1RwdExkSXlsRmt5UWVNZ3ZPOFdWaVZMdFIw?=
 =?utf-8?B?dUZvVUY4WFNET0JFVlhyaGZlR2Ztd3I2Rno0eVAvOFEzSFJzdG8wVHJtSmxu?=
 =?utf-8?B?L2xiTVNQVENOaDdzbVZlMmpxanNUZEd3a2IveFhwcEhQWmlmUm5lQnY2TzBq?=
 =?utf-8?B?Tmo4aWhMdEtLZ0N1K0I1R1plV1JYRVFPTk5SdmxkUHdjWEFQS1FiMjF5SkRL?=
 =?utf-8?B?SWdUWExvcEZXVUNaNVphc3k2ZFd0VFdxdmx3eFBSQVJlZjgybDg2RjJybzVI?=
 =?utf-8?B?MUc2WlBUTWdwcXplWEE4ZFltcFczckZ6TXd0b1AyTlc2K1N3N1IyZmE3bEVQ?=
 =?utf-8?B?WE1HRmt1MlhWQXNJMzl3WW84cVRqQUtjRm5PRERuYXlHUisyNzArSEI0ZGRq?=
 =?utf-8?B?UVprc3ViNlFJa21XaUhtSVJTMmFlVXl0cDJUcFFyU0x3VDhnaFBuZHdqcVZr?=
 =?utf-8?B?dnNSTllNUWFLYzZYMmdiMmd4TWRvUlNjOFJINkVvdFAxaXdneGRnZCtXMml4?=
 =?utf-8?B?MFA3Umh2UGtFVWQ1UzROdXRKdDhiRWRLNnpFcmVKVmVJSG5BTjJ5RW42cWgw?=
 =?utf-8?B?SjJ0VWtjb1h1WVZieXg2ZStMSHU4UUdPKzA1TVRLVk9qQmpkTVd0SU02V08r?=
 =?utf-8?B?dVExZndvb0Q5KzdKZ2JST05WWnRudVRGcHFUS0x6Y0hsamhWcjVtQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 913aec08-23bd-4559-d225-08da545d47c4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 14:41:24.1619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+q/gL9G9yD+80hVnatmAh2/A1ZnR08c718yn1qtLXBskATsGufsPbF7Sm40JeVd4c06rjKvUfXyKFnROasU4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9347

On 22.06.2022 16:27, Bertrand Marquis wrote:
> Hi,
> 
>> On 22 Jun 2022, at 15:10, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 22.06.2022 15:55, Bertrand Marquis wrote:
>>> Hi Jan,
>>>
>>>> On 22 Jun 2022, at 14:01, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 22.06.2022 14:55, Michal Orzel wrote:
>>>>> On 22.06.2022 12:25, Jan Beulich wrote:
>>>>>> On 20.06.2022 09:02, Michal Orzel wrote:
>>>>>>> This series fixes all the findings for MISRA C 2012 8.1 rule, reported by
>>>>>>> cppcheck 2.7 with misra addon, for Arm (arm32/arm64 - target allyesconfig).
>>>>>>> Fixing this rule comes down to replacing implicit 'unsigned' with explicit
>>>>>>> 'unsigned int' type as there are no other violations being part of that rule
>>>>>>> in the Xen codebase.
>>>>>>
>>>>>> I'm puzzled, I have to admit. While I agree with all the examples in the
>>>>>> doc, I notice that there's no instance of "signed" or "unsigned" there.
>>>>>> Which matches my understanding that "unsigned" and "signed" on their own
>>>>>> (just like "long") are proper types, and hence the omission of "int"
>>>>>> there is not an "omission of an explicit type".
>>>>>>
>>>>> Cppcheck was choosed as a tool for MISRA checking and it is considering it as a violation.
>>>>
>>>> Which by no means indicates that the tool pointing out something as a
>>>> violation actually is one.
>>>>
>>>>> It treats unsigned as an implicit type. You can see this flag in cppcheck source code:
>>>>>
>>>>> "fIsImplicitInt = (1U << 31), // Is "int" token implicitly added?"
>>>>
>>>> Neither the name of the variable nor the comment clarify that this is about
>>>> the specific case of "unsigned". As said there's also the fact that they
>>>> don't appear to point out the lack of "int" when seeing plain "long" (or
>>>> "long long"). I fully agree that "extern x;" or "const y;" lack explicit
>>>> "int".
>>>
>>> I am a bit puzzled here trying to understand what you actually want here.
>>>
>>> Do you suggest the change is ok but you are not ok with the fact that is flagged
>>> as MISRA fix even though cppcheck is saying otherwise ?
>>
>> First of all I'd like to understand whether what we're talking about here
>> are actually violations (and if so, why that is). Further actions / requests
>> depend on the answer.
> 
> I would say yes but this would need to be confirmed by Roberto I guess.
> In any case if we think this is something we want and the change is right
> and cppcheck is saying that it solves a violation, I am wondering what is
> the point of discussing that extensively this change.

Because imo a patch shouldn't be committed with a misleading description,
if at all possible. Even less so several such patches in one go.

Jan

