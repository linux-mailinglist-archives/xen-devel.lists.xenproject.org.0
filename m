Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2433A603A01
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 08:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425497.673352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol2qH-0001wI-Or; Wed, 19 Oct 2022 06:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425497.673352; Wed, 19 Oct 2022 06:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol2qH-0001tw-LV; Wed, 19 Oct 2022 06:46:17 +0000
Received: by outflank-mailman (input) for mailman id 425497;
 Wed, 19 Oct 2022 06:46:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ol2qG-0001tq-TD
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 06:46:16 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2043.outbound.protection.outlook.com [40.107.104.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba47d503-4f79-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 08:46:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8490.eurprd04.prod.outlook.com (2603:10a6:102:1de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 06:46:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 06:46:13 +0000
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
X-Inumbo-ID: ba47d503-4f79-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZC6C/MUuHKJRncUWlqiNXXNhg2VVkKxSmPW86NSSTYoVkYV9sd+Z4I0vGebAO59+zDNsRnz2l7LyGyTZ0q8s5AIBNSYeo5cf0LnTOLm8w3Wif+94GcvqCQW5QqxxbvBBqvz10yyu0EbE1jDszPVAwZqys27UHUyt5vhULIX20xUuZxRpJDv+MOS6T029pBr8UiOWMdIWf1zKunoFEPMEMAuf823B0I2KfQkYf0YHHroPeOxFg5PItVPxmRje0pc+o0BOMNRq5aWFVSd5HV6EAsLjkn20anWTK14xQUcPcv46kxsWdcudhP7V5H0pb/qRqAhQl7xALJFM3LXUXdeGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Lgyb00FqAeO12JB6cDVClauHNkexfkXc7WQaudLwA8=;
 b=nT6nWq1ErxU8TXMpA/oIZaWmyNOQJjiWfnV0N5t7uUKKAW9jURCuEhyZ3iXu1XIKecHnoNYiF5RVl2TTsOvtTzbrVJLcpfE4Dx4kRs5TVebKldpV+3L2HkfRzms2nDdDAMj1mKRHgVJhSnHUZYkWapKL5tT6YkcoMYmSafohBykjH4y84rbYp8K2ImN+P1NRZlJ8JMQAXq1Y7zfhvpa5p3F0sUyzK0tDeUc64wwQnG0a8OhRKKZn6yIzahV3a2rvTo4imMFd5WH16TXF+JDUw+4yMl/cbSzKml5hzCUTbjUDhmvSzdMVbUMl1U6ens0zTXellhFsTscnpwBk7tWPgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Lgyb00FqAeO12JB6cDVClauHNkexfkXc7WQaudLwA8=;
 b=5A+5GxACub0bUqwxVh0dCY0EJU499YJZK3tbwAV/6SVo9HhJCfr31x+m5KzKbvjqRk9IjYCD4o4NRsZzCalHcxyegRpZWzW5F92g2CSY9lrqjOnA9Xw6sAaMKpuibmr6F3dCWLEdKxVZdgZjf4l1A/gzgJ4cYMerjEylXgvb7IU8FTXwnERou0Oq36ht47IisK1eVh4pkD6BeHkyRz5x71f/MdiXaU6NDa3bIcLZOG5y/php7yON8ckO25AU3oDjbrI2JFGeo4OqI63S2DE9TUELTC7A4LQVnxfedneVH45Fb+X2e29igZ1cq2l4RMjx1OhC5kjlxuJjq3xf3Wp0QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e850527-70f5-c6fd-e3da-1cddaf5c6bd2@suse.com>
Date: Wed, 19 Oct 2022 08:46:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v6 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221011111708.1272985-1-wei.chen@arm.com>
 <20221011111708.1272985-3-wei.chen@arm.com>
 <039ba141-766b-a7ea-2124-be396e8433f2@suse.com>
 <PAXPR08MB7420E9ABED55E0554D3C33689E2B9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420E9ABED55E0554D3C33689E2B9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: f8020892-04e4-4195-f512-08dab19d9d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PklSBXrCrVpfx0Hc7Ig4QOLSCIhUHw6NZzYv9kEI3myDDnYFhaknv7pME7hqWUp4hbvEZsSyKv5g2mj9a1kgIeWxdOPftbABXNKoISO6GHiOk9JvQX0csjPwqbyJU0OF3915toGWSmWGiJ9JnfDL/weTQEgoSnbxtpudYG6xnCcyRBzVTKkJpLOo0gORYhv9wdQZc5TOyNQwRKMKQ3iD1e52hc9jbj3dO70ePDYBZz8nv/UTjIrocHM1E+95vtYujo7p/SmkYSI3k4zQ4z7rE23aE77VCZsQTnyF9AS1l/uh54g0C0ab3FfbF226wHlrNA91MSjSvleYmzyHJlh+R9OM4WktBAwx99sxnz9cmOofCy/pRjPatT0JXtHrHw4r5pQH3kpnwjv6obL6HlLspv32CcAr/eTTF/J7FwygKPugi8FhIwT2ulffF15ARX/OuP3qBSe9i0a6MrNX1ZWXecLQoV2KjLDRye9kQcAWLzP19T7Hh+GC+6AXajP3oX4G38R267XWv9f8rnuNzvy+nh567THvKIMrH+zg7wvqRg/pYMSIx+FAPhoeLWA6JB1KW9cNgDbepT6fX1b+V4KwdhDvsfsip/JiiC7R+e0CzqT/Aum5+cC4xkQCIXAs3tsmdFxRiLQsAfkt7bqvJtKy4vOVUnGq64eEunGSSJVuEJQiBDitP1WCuOSDFNOJYy9WSwY+qKMJQpe8ZcfWGnYcaOWEKqJZ83a8hHVDGwf8csSUUZVnNIr8xjD29Mp8lKUT92vFldri8X73RCvYFplnY+tTUgHWNjD712RM9a5B9Y8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199015)(26005)(4744005)(41300700001)(6512007)(66946007)(478600001)(2616005)(186003)(36756003)(2906002)(6506007)(4326008)(8936002)(5660300002)(31696002)(86362001)(53546011)(38100700002)(6916009)(316002)(54906003)(6486002)(8676002)(66476007)(83380400001)(66556008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWdWZjFUOVkwZjVOS2xxdDlTTjRvSjdJSThPaVFqS2FsV25sT2ZSYUlWRzgy?=
 =?utf-8?B?SW1HV044WmhHS08zcjRsZGYweTRrNVQydmZTSjBmbW5yc244UE0rb29lTjZC?=
 =?utf-8?B?Ky92WlAzSS9OdkdmOGwzTCtGMWlMNUszQUNpZ3FLdGJvYTlWNTVyMVpxTjAy?=
 =?utf-8?B?NWM4ZDJiaGhRYTJsa3plK3JOblVTTGFZTDBESXJaY2FMRkNHK05hWUMxei9N?=
 =?utf-8?B?MGtneHVsdkIybU1LV1Q2Ulh3RDRSTlZ5WGY1YWZxOVhEUlFWdmhTNzB2L0pZ?=
 =?utf-8?B?UjNUakwvVjJTTVIzdlpXdzdsVXJPVFhmV0tjNE5WQk1qSjBhdDV1MVhIQldP?=
 =?utf-8?B?UWFOWlRtZHlRVVVnOExQTTdkU3I1OG1CTVN0Q1J4RWQ3amh2UExKZ0hqMDQ5?=
 =?utf-8?B?SXloc1dYbXBiajBpTmIycGMrNzhHcXVxb092NHNOeVpYcDRUam9zSmhGSUx5?=
 =?utf-8?B?ekRIR3FsQ280RnFwaXVHUGhGWHVES3dONmIydFdBcmR3VWJHQklnci9pWG5u?=
 =?utf-8?B?V0Q2WXlDM295NlRIWjBsTFBDQmxxeVIrT0h3WFdzTXZPYW9Dc29ReEMrQWlO?=
 =?utf-8?B?bnhoWStXRmMwZTZmMUpwQmlLbUxEVjNKY2dlOUlMK1MxL2pqVzdhWVBQQjhI?=
 =?utf-8?B?WTZ2SVRCTW1veXJoeGllOWp1dURIdUw4bnlPTXJORDd5eUU5b3Z3R2xoYUVV?=
 =?utf-8?B?SVNyc3FvMTAreW5SampzRVVmZlFFZWtwWENmUTVRakg4MGp2cC9EcXB5djUw?=
 =?utf-8?B?QlhMbnhTcW1RbHZ0Kzl6K0w5U1FGMWs0ZFJvTm1WUmZVODRxcnFCQ2JMQTdP?=
 =?utf-8?B?Wk1EZnFhb1dyeDJNa2llRFZJenVJa0tpaWM2SzgyT0o4aUpscUlTV01BbEk1?=
 =?utf-8?B?bkY2V0JTSU5sODN5NkhaK0RhM2YwZGJXckJmekVlM3VCNzBLWDZoZzR2OW1y?=
 =?utf-8?B?cEFXeENVRU42MWxUUU1PT1laSFNUMllDcllQajlhZ2ZyRDdsek82V2YyZ09k?=
 =?utf-8?B?RFQ1Zk1mMFhINFkrekhYblE1dGRTcDVwZkVWMTM1T3hlRWZUMFRQSkx2dmo0?=
 =?utf-8?B?eFRueEVoKytiNVlMSEVSMDRqSVNGOFFQNlBQNnhpQlRlcDBGKzFSbG5VKytD?=
 =?utf-8?B?ODZQU0l0MEVoQUlNelRXRVpZTTBLTTNTVS91QlpDMlp2NmxBT29iQzd6SXBv?=
 =?utf-8?B?ZHg4ZDh2bVdDMXRRcHFhczU1OFcrZ3hhamlMeWdMODE0ZXVmdkVIRnFqYWMr?=
 =?utf-8?B?b0ZDQ3RkeHBPbk9nUGw0NnRvWU9KWDcyV0lNQlpZQXhCMUYvdWlFalFrSkZ6?=
 =?utf-8?B?SlltcmhiRk1TSDFISGg3bjN2Z2crZWtTeWV4Znp1TURKb1JkL3pydFlLYk1H?=
 =?utf-8?B?ZmR1b1FYdXdvZkMyZ0w1djVlOFZhL0JGbW9uVHVGL2tJZHRoN091cEp0YW1Z?=
 =?utf-8?B?UDd2QkcvS2hDOUM0Ylc3VFYzQUtzVXdkSzh4UTNsb05Fa0FtK1FFSDNMV2ty?=
 =?utf-8?B?aDFPQmV4aTZTZ2lTRDRBeVppbHd0bi9EZTVqblVxWktBVk9mUFJkZUp2OGg4?=
 =?utf-8?B?dGtYYWI2Ylo5aWZBcVRBeGFXOExEZndYTXJqeEZHZHYwTzJMcjQxcDM5Qld2?=
 =?utf-8?B?NnlyeFZBNGxmQVNmTWRqMytpakx4NHZjRWhTR25ZMVhJMXJmM1AvOHowREx2?=
 =?utf-8?B?cHV4d0NUVUZ5NWI3OEthZm5NVTdrVU5ySkNwS0o1Um53VjFubmVtdm44bUlL?=
 =?utf-8?B?YjNCVHVKYk5idHFsUC82RzJIcC85WXNiOTl2S1ZNWHJZU1ZOMXZPczNzT2F4?=
 =?utf-8?B?REhoNDRQWFVyczlVb2J3VklOTDZFUTJJc1IzTldXUHcrNmFxQy9YcUEzbFU3?=
 =?utf-8?B?bnhac3ExamZ0TW9xTU9Cc3I5NjhKcVFFU2dPRVgxd3BlMng0STZ1ZTlWaFJs?=
 =?utf-8?B?UTkyVXU1UU5oVzVubTM3cDBOZG1nNlh0VzVPcEZORExlZjF5VlRLc1Z6dlR5?=
 =?utf-8?B?TVZ1eUFoN295bW1JOWJndHhiYUZ6emxZUnRFWWlJT0dBN0dRN202MU9NNlNk?=
 =?utf-8?B?TWJlaGJGTzhTZzlCajBCbUZhTHJUVEhNL0tCL3V2OFhlOGVha3dzcktTeG5K?=
 =?utf-8?Q?qBSiYflrZJMPGfVhgd8UOd4pu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8020892-04e4-4195-f512-08dab19d9d64
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 06:46:13.6061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ME5zCsGXRr4Jzcspaj0YbzTlL2R9gESa969HJchammtSYxoHlYn9iqRWRiFJeCuHDnoXFsfAAtsKR3QV5NhhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8490

On 19.10.2022 03:58, Wei Chen wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年10月18日 21:46
>>
>> On 11.10.2022 13:17, Wei Chen wrote:
>>> +static void cf_check dump_numa(unsigned char key)
>>> +{
>>> +    s_time_t now = NOW();
>>> +    unsigned int i, j, n;
>>> +
>>> +    printk("Memory location of each domain:\n");
>>> +    for_each_domain ( d )
>>> +    {
>>> +        const struct page_info *page;
>>> +        unsigned int page_num_node[MAX_NUMNODES];
>>> +        const struct vnuma_info *vnuma;
>>> +
>>> +        process_pending_softirqs();
>>> +
>>> +        printk("Domain %u (total: %u):\n", d->domain_id,
>> domain_tot_pages(d));
>>
>> Perhaps switch to using %pd here?
>>
> 
> Did you mean %d for d->domain_id here?

No, I did mean %pd:

        printk("%pd (total: %u):\n", d, ...);

Jan

