Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24585627902
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 10:29:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443202.697724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouVls-0002AL-9K; Mon, 14 Nov 2022 09:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443202.697724; Mon, 14 Nov 2022 09:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouVls-00028T-4T; Mon, 14 Nov 2022 09:28:52 +0000
Received: by outflank-mailman (input) for mailman id 443202;
 Mon, 14 Nov 2022 09:28:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ouVlq-00028L-O6
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 09:28:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bee76a12-63fe-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 10:28:49 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB7973.eurprd04.prod.outlook.com (2603:10a6:20b:28b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Mon, 14 Nov
 2022 09:28:48 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 09:28:48 +0000
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
X-Inumbo-ID: bee76a12-63fe-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=du0uay7OA1w6Ows0oJ3y7fNSjFcAHSRIPCHcaERD+4MF9RAd9K9CFFhdrh8JNjX4hKy1qljEbcFaHQN/bvuAYcZAzhuNV172fOPrt3EmhAe0BuLZjPlfliXIs7wP/qshnID+HISJYSnhUDhmihmYB0q3Ab+CVc1GHrmkNC1lv99o4YnYcD65wwqT3TgtjMc81bdNaDQFoPqH4c0PidCitVFwiQFkBHONyoaZShTJRRCPiHbJkGJ7YY6wij/VH/lJjSalz55+6+y+vONkP4SLNIOR8ORTWxV4R8CVV9iwZwvg7Kv+mgyUWsKfN0r4SY2LGQCXcVpwhEbJitPixZeAfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmNa0uYvjtufCq0VaHCrZkh48Hhuo/JIzUc3gUDieck=;
 b=a4B9qr3OJF2kplr0zLeRlw9ZcPcA7QRqbWnUDwiGr+cNIT0xT3TLhVRrDG6Yyv6+hUvVV5jyRw4WIaEaiOqmj37uANVFDF8EniCyEfiGHtp53UwPpa1Z9wmReoQrEudP7HtkPuKAAaQEXoSwT5AmjSLOT2oZGKT1sGDD2z35UglFkU802Ts+caOIUO94aKQVrI7dhUj98AoO4v1zXDP+6k/oYxVsQWNza1abicHKEgN8gfdOItNngyxkGBa7cBWNJ8iFWMRbl9iXFhPmMeq7UNlsgxBmzTrmhhMIC7cZqY/gm3nx0RnXtJRfQHabRi9PEvVLEdiRP6MctyC1WMqZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmNa0uYvjtufCq0VaHCrZkh48Hhuo/JIzUc3gUDieck=;
 b=B1s1RYeUkdPH+vLXYENqYBj5cjodDKsTZ1TdeDCLVp8rv33e5d80QdgZ1BZmfGZAIbZU9VDAVoAcm/Wjbh4fVCRI4TYao2rfeoMob04wAOXrBAYuJveQS6x4ofAH2EW3JqDbTMlkAbAs1okNV3jjELuAR3ZUgOafUpaxGCx7nhW7Y/6yKcbmJ4WhSxx5rdY2D0Otp7R6E2SsY/YgykYJ9O/aDQTEbHYbOd7kbGzJpP4pKg3mXgezyrtLGr6+H8z4khtdQhDAUvAV2a4q4fmq+25citXccHPH+uPouooXFqVujKG9GmCi1V0M3bippJ5dtO2gaSwHA0ULyG3/o1MGzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <73becaf7-8c94-1261-f504-865cc0425c79@suse.com>
Date: Mon, 14 Nov 2022 10:28:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v8 0/6] Device tree based NUMA support for Arm - Part#2
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221114063451.473711-1-wei.chen@arm.com>
 <3aa067b2-fa49-326a-c5a0-6735bc95951e@suse.com>
 <PAXPR08MB74209231BFD7E8C3004C55A49E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <2beb3d17-99f6-77fe-a5d6-d60e665f01d5@suse.com>
 <PAXPR08MB74205604C48B1D2CBB7A135B9E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB74205604C48B1D2CBB7A135B9E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0729.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::24) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS8PR04MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 88c2e1ea-3d0c-4581-aca6-08dac622a235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PBAAOprXkuRJN5LbQYqCFTc+Dk2mEo2RogjAaCSVbd2HH/kI0kSO3xVcdW5qGJANTgFs4noLBn1B0X+pwWSzG3ntVPxXRUeVE+h1qWFxmFlda/sX91oD8IWeDZ2o2H1i/3BM0msvR6c4PLxR4FHmSmaxXXz/3fK8lCKA1uoSq6KHI4jlk5iHMBQbNDZc3F3WKBTQG806M58Z829D2k62QqFM6TNF3XuGwTYgM/jEYkKXijTxT1HuJaBPydwTt1/HW5ZOSNGtLdIGkyWNGay5QEFqIeTqjOrQFaRPJuUYv2PGLVtQSpub98iLtXjQ8oa4ggw/ZvkpCmKPxjjuxDatf1jQC79wRKPlifCx8srhp0gGeVDDGX6qhnbpLjZldlIJ06lyktfnGvz4lur57dkITRhJ0Hw3oRhoMSk7enEuXsOzQ6nxBlx2o8UZ+scH4uFtafWBm2c7zPuuBWtvcJx/3F1l3hPaNOVksHKzAKcURY4Rw70dwebrSth2Kb6w5i/MCyIYZ72XRcZiGoIEGmKhIOAOyKl5TiwibGMuAgDO9Zvo5h2SlmOnaQPaqy5n5rrURLr4jSRthqws5qlAsJk86gVymiI9bFjzQEUe+/NtHcYffhyAiNJYjEqiT52aMtd5kfNbafIIyOMtPN3kYg82L6nxdakOlMtdZMqZEu4Mv43/wQOtYlN3+tcaGay8/72m13XotA+8w+cDVCIs6IeXe7sT3dhoRRNiBLrHwq+dB8Wesad9MGXW4AV9msYiKzkxw6TT5qahyNQbL3QZLSiAkjOSrON8tkishHX6Omp7uZxZC5gU/ohwNN38Rdvg4lSKeMgPGfA2SotFS0t9QaLYiWgfXxASDXrXdu8vq6hQC2RiO5DX3Mdv0j9er9b0mR7d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(54906003)(26005)(31686004)(6506007)(478600001)(6512007)(53546011)(86362001)(966005)(31696002)(6486002)(2616005)(186003)(316002)(6916009)(5660300002)(36756003)(2906002)(38100700002)(66556008)(66946007)(66476007)(8936002)(83380400001)(41300700001)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEV6d2prd1dPdWdtOFlMMElaNXVVbThqYi9UcmxrcHRUME1rbnRaU3lMRnpm?=
 =?utf-8?B?RG8zVGtCVjRQYjhuQTZYek9uaXVhZGdYSnRBNnRYbWtSTWp0dVQ5aTNTa2pM?=
 =?utf-8?B?cDhWUk51SHRzWHZWUkViMlQ2b0QxM0pIVzVTT1RWSW5Ibm1CZkFCN3NlS0Zi?=
 =?utf-8?B?eXFQWVpTWFVqeXQ4OGN4bFJJbDFRWkpDZ00wbU5WY0RENkhJSFd1a2JuM1ZP?=
 =?utf-8?B?b3pTRzFSZXEvYWt1cUsyMDNlZlJrL2lSYzNnZzhNU2hwdlhtR1RYMjRPZFpQ?=
 =?utf-8?B?RnJMcEJVeldud1lKZ3NOT3BxOVZ0RW8rbjE4TWVHNVJXZU5zWjl6SFBuRW0r?=
 =?utf-8?B?WWk3end1NnU5c1oyVElJc1pHRTV3SktpNWUwaEdMTzBaR3Fsd29XNFRhYU51?=
 =?utf-8?B?K0hRUzIydC9sWE96aW94a2lnSVBReWVnWVhMUlRKMC9VWW43b3NvZXFjcW4y?=
 =?utf-8?B?WXBxTW43Wk1GMFhxYTAyNG96VnVOK2Z3Vjc2YkJpT25aQW1lVnZueEo4WUVD?=
 =?utf-8?B?TEZNMTRaNU9SM21RbklaSDNucEU0eU9nT3haWmxlbDRxWE44VzZvekVuMUVL?=
 =?utf-8?B?ODJydGRveDBrOWxwcWlOUCtmT0x2NHBqcC9ORjI3NnV0blY5TDArTWgzS1Ni?=
 =?utf-8?B?dWVSd0x1NVo0UitJcENuL2ExMzVaOWt4aW5VVUVBZDhCRWo2OFkxNEl4cjhu?=
 =?utf-8?B?cThhaWpKakNwYWxvVG1lc29oblJqRmEzejNBQ1pSVVN5OXJQbEpvRDBHdkNW?=
 =?utf-8?B?QktUZk9OZEJPMkN2VjIyanBteTJUeFBGOG1aQk5ETlB5cTBPSTJEdXRsQmZy?=
 =?utf-8?B?bnNIZHpVRGtJTGdzckpmNUJJdG9sbFRXL1BYZ215NURjMkZyV1hlRStMMmhW?=
 =?utf-8?B?MEdJYnBmMFgwZ3pjVTU5cGNpTHh3UDY3TVZ2b3Rwb0pJejNQejhDdFhuRjFy?=
 =?utf-8?B?MEtzWU42YjNNaUltMGprNkpMODgrZm1lM1U5eUZBYVg2TjFJQk12NDg1QUQx?=
 =?utf-8?B?U1c3akYzZmxjMTRIWU9rTXVhWXZuNjltS2FaUmtEMnRQUGgyMlRjZ3hmRlhM?=
 =?utf-8?B?U1gycERUQnl2dFBPYlVwR0VXMGNSVzJqa1QrZDh4RXlkMjJkbGFJQ0RMM096?=
 =?utf-8?B?ZUF2dHN1RnU5Rytpb1FSTEphWDZ1RGdHK2c5Z1o2UzZVVElvbWhmOVFCWmx6?=
 =?utf-8?B?bTgxKzV5YzBXbWpXdDVCQllpK3lZNXl6ZmJxRDM1U1ZEU1RkbC9qNU9nY09U?=
 =?utf-8?B?ZTBaRHhPUWhKbUkvUmxja2JpeHNzeXVkNGdvclJONWc3RXNxUUxKSkM2MDh2?=
 =?utf-8?B?cEY5UnRYVURYazRqWjB0Tnk4N3UxaEcrbUJyaVByM1Vud1RhbHZtbU5zWTBS?=
 =?utf-8?B?VDFrek9aWUtsTndQclIzbG05Qlh2U0pvS0RuNFlhdnUwVVN5ZzZwekFvVENX?=
 =?utf-8?B?SXUxY2NRM2V4dmhFU0grN2hHTUtpQnZ5ZVhZVUF6U1R5Y2tsZ0c2Qk1odEpM?=
 =?utf-8?B?OFVJcGF5NHZLc2tVOFg2RFQzb0FJd3BGZXdsTmVIVXVkS2t2L1cyU21LK1Jn?=
 =?utf-8?B?K2hGWlNxNG0wOERYVVoyQUR1RlBCbCtrdFI3RWxQaU05ZHlYeW9aSlduZFFa?=
 =?utf-8?B?N3M3WGxORVJsbG1hWVlwSjVDK20xbExkaGZtQWpJNWdDcVdVUlQ4N2gxV0Vn?=
 =?utf-8?B?R2dmTUZFNmYxWE9hbWlGa1kyOEhoY0o0c3lXRFBrNENqcDNvcGsrUWxQSXFu?=
 =?utf-8?B?dzVCVWJMQThCSUNSaUNyRDlHcjUyNXFoUXlibmxsMW9YSDdFVWxrbS85Wk9O?=
 =?utf-8?B?eitDMklPTDFBWUkvUDNnSFZyUGtVajkzaGJ6clQyYmpmS2MzS2ZTbGxaUlVS?=
 =?utf-8?B?eDJMTGN1YXBXTHpoSjRtWndkZEx3cGkwdWZHSVhuMVN1R1VvYlYyOXYrMmdr?=
 =?utf-8?B?RENlb085OWkyNXBETnBLamExS2xqQnU4enFkb3FTa3RhVkRLMlZjbEZrTXNj?=
 =?utf-8?B?VWVWSUYzQVlNTkZjZWRqUTBoL0VEaHU5UWRZT3VCK2JwUUtWWmZ4YmI2dDhZ?=
 =?utf-8?B?WG9HUmU0NmkrbmpRSDJ4YXUzM2UyYjZxeWFUdkw2SkdBRjdUOXpMd0ZIUUNj?=
 =?utf-8?Q?jA7J5XMs84eDNGR0FTJTc0vIP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c2e1ea-3d0c-4581-aca6-08dac622a235
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 09:28:48.0210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6voeRK657HaG0ODOCRAeYmu8BXGiB+btAvq0YLYHjArL+i9s407dznnvUGYJ3b5hZkj7HANJgBmfil5VD3Few==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7973

On 14.11.2022 09:33, Wei Chen wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年11月14日 16:23
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: nd <nd@arm.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau
>> Monné <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George Dunlap
>> <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano
>> Stabellini <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v8 0/6] Device tree based NUMA support for Arm -
>> Part#2
>>
>> On 14.11.2022 09:14, Wei Chen wrote:
>>> Hi Jan,
>>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 2022年11月14日 16:05
>>>> To: Wei Chen <Wei.Chen@arm.com>
>>>> Cc: nd <nd@arm.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger
>> Pau
>>>> Monné <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George Dunlap
>>>> <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano
>>>> Stabellini <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>>>> Subject: Re: [PATCH v8 0/6] Device tree based NUMA support for Arm -
>>>> Part#2
>>>>> So in this patch series, we implement a set of NUMA API to use
>>>>> device tree to describe the NUMA layout. We reuse most of the
>>>>> code of x86 NUMA to create and maintain the mapping between
>>>>> memory and CPU, create the matrix between any two NUMA nodes.
>>>>> Except ACPI and some x86 specified code, we have moved other
>>>>> code to common. In next stage, when we implement ACPI based
>>>>> NUMA for Arm64, we may move the ACPI NUMA code to common too,
>>>>> but in current stage, we keep it as x86 only.
>>>>>
>>>>> This patch serires has been tested and booted well on one
>>>>> Arm64 NUMA machine and one HPE x86 NUMA machine.
>>>>>
>>>>> [1] https://lists.xenproject.org/archives/html/xen-devel/2022-
>>>> 06/msg00499.html
>>>>> [2] https://lists.xenproject.org/archives/html/xen-devel/2021-
>>>> 09/msg01903.html
>>>>>
>>>>> ---
>>>>> v7 -> v8:
>>>>>  1. Rebase code to resolve merge conflict.
>>>>
>>>> You mention this here but not in any of the patches. Which leaves
>>>> reviewers guessing where the re-base actually was: Re-bases, at
>>>> least sometimes, also need (re-)reviewing.
>>>>
>>>
>>> I just applied the v7 to the latest staging branch, this work has not
>>> Generated any new change for this series. I should have described it
>>> clear or not mentioned this in cover letter. Sorry for confusing you!
>>
>> But you talk about a merge conflict. And that's what I refer to when
>> saying "may need (re-)reviewing". The same happened during earlier
>> versions of the series, except there I was aware of what you needed
>> to re-base over because it was changes I had done (addressing
>> observations made while reviewing your changes). This time round I'm
>> simply not aware of what change(s) you needed to re-base over (which
>> is why I pointed out that it is generally helpful to indicate on a
>> per-patch basis when non-trivial re-basing was involved).
>>
> 
> I had thought it was a code conflict before, because our internal gerrit
> system marked that this series has a merge conflict. But the actual
> situation is our gerrit setting policy problem. There are no code conflicts
> in these patches themselves. We also did not modify the patch to resolve
> the gerrit conflicts. Regardless of whether it is a new or old version,
> if I modify the patch, I will remove the reviewed-by.

I'd prefer if you didn't unilaterally. Instead I'd like to suggest that
you apply common sense as to whether mere re-basing might actually
invalidate previously supplied tags.

Jan

