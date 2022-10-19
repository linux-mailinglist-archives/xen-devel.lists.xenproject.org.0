Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 063C6603B09
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 10:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425614.673549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3zy-0003yn-8s; Wed, 19 Oct 2022 08:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425614.673549; Wed, 19 Oct 2022 08:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3zy-0003x0-65; Wed, 19 Oct 2022 08:00:22 +0000
Received: by outflank-mailman (input) for mailman id 425614;
 Wed, 19 Oct 2022 08:00:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ol3zw-0003rj-3a
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 08:00:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140049.outbound.protection.outlook.com [40.107.14.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12890e63-4f84-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 10:00:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8695.eurprd04.prod.outlook.com (2603:10a6:10:2de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 08:00:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 08:00:16 +0000
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
X-Inumbo-ID: 12890e63-4f84-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xzgs0hcvm3N/IvxKRHtpnS8qOEbM+J9Z51t+HXUcjm3oGdmfmRoOxPANco7K2Wz3z3y07bBrfvTlw6KVtGZ+5GYZ9NiVk1D7vk9n08XNKQtHRaTiLeyo52pH8IqxkBz5W42EE0UHC1BzgWR8Q1o593oxf/G74csedId+eaRXp09MVRrdYcUWnczi6LrVqpiO8bvIUsnGPKoqFN/KDDY5ijdW4lA4ZdK0P8Ame31/YLDsaXvMk7g304uyRYMi6A6i92tFd/S6RNqCq73imAiVgctJ7O6RuAIvZ4QccUTWyafWqXGPedKkUKLkh3CsgEkT5cI2PlwRjMwrMgsotB1bEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zG5oUj1mt+uZIvQd9jtbBI3e4TyhhC7SRnv9n6nV0ds=;
 b=lUkfapLauY2awnMg9eb9GSuWPPXFf7b1oybsq4gOGTNfZCPuL9WbcwlycuZ4zMHjhbhpbMdg+ddZNSJ1EOfDj2t9gyTyVfq/eeClUjem0P3mkxu3asF30Rm5An1eydiIDTJejVVdSXQnra/3df0uo1vdByGAiQzxWGNV+JGuBWfGbctTHL/mh2AvxpMGmV9uvsVR9s6EyhR14NCdm7ij6ZMJrGSH9q1X0tERHPF+fGzkVJny8dtnn+SdIgUuNtJwrNPurgc4JfbTmB7B5UWXD9JbieLRNY2pS/e1eR6A9fwWG3nNiqIt6ssFbxseAHDF97SE3hAZZekm2sdcwpM/TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zG5oUj1mt+uZIvQd9jtbBI3e4TyhhC7SRnv9n6nV0ds=;
 b=A9l+IRoBtMZd/bjazH5ZCSYTMz2ueC+41zueMap+GThWQO2I5yK9MealmrqO6X7lz8G+M3plz0y8LoxRQT4mAhHTPQuIIKzD0AkHw1Wnr4uPadeH2zYgPM1/7wequFDjxPvKH2MHcVg7EtEo8gg5jhfY9l/suNSVtVd9ck4l1zZcmBK4vDzcn4l/0qM77/bsOKOBrrjba58l0VWYmXkH3VJF4hySM9iRZcBlIuvdCqNBmY20lHtXdt83Y/BeNqmr7FyaFh6BNc5JvbgpcpV6w5Krvec1R7n8LW5h1ynICJM7AynzhBDiAtx76OeR9s3w+KAztfWXAasNJqmTvclrtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de0d84bc-d2e3-759e-7459-d81e768b7749@suse.com>
Date: Wed, 19 Oct 2022 10:00:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Proposal for deviations in static analyser findings
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <EBCDE6CE-A84A-48C7-B3C2-7856E5D2392B@arm.com>
 <ddc5039d-e312-326a-b71c-8d08d04100e0@suse.com>
 <186C83D7-6C7A-4319-86E4-69F7FDA7FDA5@arm.com>
 <559a3d4c-08ea-ef8c-9a56-2b53db3d51e4@suse.com>
 <E00E3AE4-7863-4231-9DB7-A7B66C8F6791@arm.com>
 <233a9356-b64f-37f7-d7ee-3d6223224497@suse.com>
 <A906FDB6-7DA5-4900-A6DE-1140231E69AE@arm.com>
 <9b113db9-4dce-d300-9393-a8572ee4fdcd@suse.com>
 <A3CC086E-7B11-4D6A-BF01-565BB8C3A846@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <A3CC086E-7B11-4D6A-BF01-565BB8C3A846@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 1908bd9c-954f-4d04-ec83-08dab1a7f543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fhfDeoLgU1ExfMb2FsYMScMa8n87e+6wj/on3vIfV21tGBkK2LyMOnuUW6QvpeCqmXQNgrzZnRj4oVBNcOJqJIjS5sNaF+px9rCyI1rDL42rfS1VSyB3+TiWrzcPx3IXtAz8fOObF1pCuLRAbtSOZtFQ5erWTe8fikOSe7AdbO1tqavKLgLqAhSxSNQ5Vc2n0Y1rLZWKqsVQx1eu7yDNQKKwOtKLeNWvSO6gEv7KM1AqFOnddFjyeCUepeTn2hcNp9cg24f+Hk4cEn6OSLSQRxMp5MHcyNGtn4Vh31JzVD2/fFZfSiJuZ8CfHcXMYxnIE0cdMAIqdDJSycR4FXyMGyEbADG52Gm7k7icx2aYZQhpdX2LWaeP606bcPTPyho5Qd5viOqAE9Eym+UCn5lpeNL7qRoTT6DD83iMZCWWhY/10WJVdprHA+TbDZFdaNZMvABORcMZXFC9qvv2i8124SPp4+YkFCnHvaMFmpFizpsXmr1LWJ3WBDihk8aRCUnxowkfwgShJURB3yG7PHAsnPZHPfrV7RblaFDuLgxzRBnZAp/oBE6HDWDv33opGYgrHkz7PdjkUaxe2IoszkC6DenLYusMN3tjcQPAoGqaDeqeAhJ9Il6BqspojWFyEuwCj0DZamHkWH6SarKz02hx008bGLR1hp8EDAX8r5T7Gzy+IX0gQQqblvikbH9VvyYRctxCEDjPIqLo6leUJNetpq4GchbxPbG+iRIqaUV6wivWc41dTIh1fiWAeqxU4K1EYQcSnkrRwbTi62khjCEYaW0A3mAeaFfHsd63PgJMqeQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199015)(41300700001)(5660300002)(31686004)(2906002)(66556008)(66946007)(54906003)(8676002)(6916009)(4326008)(316002)(36756003)(6486002)(6506007)(8936002)(478600001)(6512007)(83380400001)(53546011)(26005)(38100700002)(66476007)(186003)(31696002)(86362001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWx5SzduSlRWTWQvTmNBUTU1Mzd4TUphaXY4eW5BNTZjWjZCV2lCT3Q2QUhq?=
 =?utf-8?B?N1NKdTZ5eFBhRmRveDRLL09IVHUrVXFDZVZ2YUpRZHdiSEhvNGhOdFFyT2cr?=
 =?utf-8?B?cHhCZ3ZEbkh6d1lqbEx4SEE0R3p0MlN0MEo3YjNpWjExRWtvZjZxVGtVbldu?=
 =?utf-8?B?aUdJc0JzQ3Q4UUN3ZUt2UjNPaVh4RDQ5WE4yeFMvZ20vQzhQMHJHcGV4SGw2?=
 =?utf-8?B?SzNlQmtqV0ZFcW9xWE94WWtXRzhtV3M5V3BOeSsxVjlFYTRsOTExOG1icEtP?=
 =?utf-8?B?YVlPRFdRQWdtbUdweGdRNzhVQVJzcjU0SmcwQjZFTW5yMURqMVhaRWRrWkp1?=
 =?utf-8?B?K09xNmNMMngvc1l3Y2d6Y3RHU0VLazBXU3pLRy9ybHF1NTRITjA0cDVGSVhz?=
 =?utf-8?B?SXFITjZDTWRrV3VpdmVNU05EUXRDZHVpdVhNR3R5cTFud1h4QW9PTmhPRWpm?=
 =?utf-8?B?c0owMXJLK0lhb2tJYXFxNFc4WmxUY3ZSdDZHRHJ6MytIZWdoTEZZbjFmdjdZ?=
 =?utf-8?B?dmpkaXBXOFpoUVZWMXNtYkg0KzJleVdmNjZmbmNTZEloOUc4djJQMFJmeS9p?=
 =?utf-8?B?cTV0dnp0RmkzZXI3WC9nNlhzc2VBdFVyUUJzajliZ3lHWWVZcDJYczA1OEFa?=
 =?utf-8?B?YUh6M2ZjQUtsSm5ObkJ3cG4rdmV5clQ4Q2NMMkVCMzNvR0N2MG12ZnZTNkRE?=
 =?utf-8?B?dHJLQjdhSTc3YlJrYzZTOHNSaHowQ0ZtUHl4c2wxaXlmQWtqUDZsRHV2OXNW?=
 =?utf-8?B?cTdPTGtDSmJLZ2ZzWHBqdGVUSHNqZytEMlV3OWE2eHRzQkxCK0lFS2ZvdUhw?=
 =?utf-8?B?Yy9LdldsYXRJMWxDbnV3OUF5QUdRbWYxL1FrcFUxVmF4UUdMRGY4bW8ya2lp?=
 =?utf-8?B?Y2lHZCs4SVIwUmFHWEMyVDlWK1FZdlBkQmpySWRVdnNkRHAvSEFMYnUvYW5V?=
 =?utf-8?B?ZHE3K0htZnZtQjBlRGxWcU1jRDV3L0diR3ZoaW1GSHk2RG84bzJOc1R1ZVdV?=
 =?utf-8?B?VDlEL003MER4K1V4eTAyT2dYMGJTNUNjSHZJVTBPNXpIWXFqUTVFU2c5c25j?=
 =?utf-8?B?Tk5QZjY2QzlYN3pTYlMwaVZwWHEzYVZvY3E3SndjVUphdHNpbUlsalV2QlZQ?=
 =?utf-8?B?L1lwL0o2NnJPU1VIaWh1d0M4dTdTZWFJcDFVdURzT2puTmx6N1gzNU40TVl6?=
 =?utf-8?B?YXhjWFJqWFQyREh6YXAwY2FKU0J5QlV1M0FpOTREdExONTJLM25ZWFk4WTAz?=
 =?utf-8?B?NUhId0g3cG9YQmppZG9qbE5JUExSRlZoVk5zSVE5dUhQNWNHOFhGWjJrUTJY?=
 =?utf-8?B?U0kwU0Q0bjBNYkdaMzI5Vm9zL2w1ZVYyT0NCRzh1SVhQcDNPcFdQSG5rWW1k?=
 =?utf-8?B?VzcvMHZ2UXZHOERhTnRyWTJTTU1LTkNIUXpQV0VqVlFyVU5PWStxZkFmOS9s?=
 =?utf-8?B?RVJ5WGMwN0RQSnFGOWtPazJER2hqb3djN1NvK3o4akN3L2FuSGxBNmVsSGFY?=
 =?utf-8?B?RnFHSGw1NWFVR2xtTy9PbmpwR3gzN0UyQnJNYTZkUzAvOUgxeVdycW1QMSsy?=
 =?utf-8?B?YlppdTN6VlBCc2syN2VmQzZMK1BCRm5Pa2RNeHJDbnZVVGluUVN2Y1RBaTVk?=
 =?utf-8?B?clB1KzVjbkNXUlJKUTg5T2pWK1lQUlRpRVZuZnhhZkN6SWhqVjhDV05aSVhw?=
 =?utf-8?B?dmpMYzdTM0traGMvQU1IRG5LRFNGWnVWamxZWjJGamhqbk1aWjl3aURnekVQ?=
 =?utf-8?B?WllJWEpUZkpqSGZwZm5KMnQxL3RwTGlLK1dKT3drRUR0ZGE2Qm5DMG5JQWZy?=
 =?utf-8?B?U3M0TGJzcExSUlhHRFduUHkzWGdzSmU4M0VkbHdaYzMxOXFBc3hSa2xYK3dk?=
 =?utf-8?B?b2ZLNkJOQTY0NEMrWmhWRDhiWWVmVnRTcS9aZ3N5aFVoY0RKUjVqdkFtVGNz?=
 =?utf-8?B?ck9aUEx2TmIxQ2xvdVVMcHU0OUdQdDB6TCszQjgwYnJYNTBPU090U3lhRnhL?=
 =?utf-8?B?NXV4UkNTcm43a0diMzByeVd2N2k2cjBrVFJ3SGluZnN4YUIxQmlzN2FCS2FB?=
 =?utf-8?B?VFZHRTdVTmVIMktQR21QRlBLMWNPYThhT2dWNUowRm9aSlorUnVaT2Y0dHhZ?=
 =?utf-8?Q?LLFWBebd9+FAj7Q2cniWjXika?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1908bd9c-954f-4d04-ec83-08dab1a7f543
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 08:00:16.0276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EuRNtDDLpG4EliePG4VHv8CQQYNxUNF9+M4+A2Srxw2tcvH94SRDimUS0e8FPgjM8rF1Gp3x9mXWRAIqIHhTRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8695

On 19.10.2022 09:52, Bertrand Marquis wrote:
>> On 19 Oct 2022, at 07:38, Jan Beulich <jbeulich@suse.com> wrote:
>> On 18.10.2022 18:11, Bertrand Marquis wrote:
>>>> On 18 Oct 2022, at 16:29, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 18.10.2022 17:17, Luca Fancellu wrote:
>>>>>> On 13 Oct 2022, at 12:34, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 13.10.2022 12:11, Luca Fancellu wrote:
>>>>>>> After the analysis, the source code will return as the original (with the SAF-* tag).
>>>>>>
>>>>>> While you mention something similar also as step 3 in the original document
>>>>>> near the top, I'm afraid I don't understand what this "return as the original"
>>>>>> means. If you want to run the tool on an altered (comments modified) source
>>>>>> tree, what I'd expect you to do is clone the sources into a throw-away tree,
>>>>>> massage the comments, run the tool, and delete the massaged tree.
>>>>>>>>> if the object doesn't have a key-value, then the corresponding in-code
>>>>>>>>> comment won't be translated.
>>>>>>>>
>>>>>>>> Iirc at least Coverity ignores certain instances of what it might consider
>>>>>>>> violations (fall-through in switch() statements in particular) in case
>>>>>>>> _any_ comment is present. Therefore may I suggest that such comments be
>>>>>>>> deleted (really: replaced by a blank line, to maintain correct line
>>>>>>>> numbering) if there's no matching key-value pair?
>>>>>>>
>>>>>>> Yes the line won’t be altered if there is no match. This to ensure the correct line
>>>>>>> numbering is not affected.
>>>>>>
>>>>>> "won't be altered" is the opposite of what I've been asking to consider:
>>>>>> Observing that comments _regardless_ of their contents may silence findings,
>>>>>> the suggestion is to remove comments (leaving a blank line) when there's no
>>>>>> entry for the targeted tool in the table entry.
>>>>>
>>>>> Why? The tag comment won’t do anything, it would act as a blank line from the analyser
>>>>> perspective.
>>>>
>>>> The _tag_ won't do anything, but as said any _comment_ may have an effect.
>>>
>>> I am not sure I follow this one but in any case we can choose to anyway substitute the tag with something like /* Not applicable */.
>>
>> That's still a comment, which hence may still silence a tool:
>>
>>    switch ( x )
>>    {
>>    case a:
>>        ...
>>        /* SAF-<N>-safe */
>>    case b:
>>        ...
>>        break;
>>    }
>>
>> is no different from
>>
>>    switch ( x )
>>    {
>>    case a:
>>        ...
>>        /* fall-through */
>>    case b:
>>        ...
>>        break;
>>    }
>>
>> nor
>>
>>    switch ( x )
>>    {
>>    case a:
>>        ...
>>        /* Not applicable */
>>    case b:
>>        ...
>>        break;
>>    }
>>
>> Only
>>
>>    switch ( x )
>>    {
>>    case a:
>>        ...
>>
>>    case b:
>>        ...
>>        break;
>>    }
>>
>> will make e.g. Coverity actually point out the potentially unintended
>> fall through (based on past observations). Whether that behavior is
>> fall-through-specific I don't know. If it indeed is, then maybe my
>> concern is void - in the long run I think we want to use the pseudo-
>> keyword there in all cases anyway.
> 
> We can choose the replacement comment to be something not
> considered by the tools (or even put an empty /* */).
> What we cannot do is remove the line as it would change line numbers.

Right, and hence I did say we want to zap the comment, leaving an empty
line.

> But apart from fallthrough I do not think any comment is considered by
> any tools so this should not be an issue.

Well, we can hope for that of course.

Jan

