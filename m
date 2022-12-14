Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D5B64C475
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 08:45:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461769.719914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5MRb-0007dU-BR; Wed, 14 Dec 2022 07:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461769.719914; Wed, 14 Dec 2022 07:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5MRb-0007au-89; Wed, 14 Dec 2022 07:44:47 +0000
Received: by outflank-mailman (input) for mailman id 461769;
 Wed, 14 Dec 2022 07:44:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5MRa-0007ao-H0
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 07:44:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d728312-7b83-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 08:44:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8054.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 14 Dec
 2022 07:44:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 07:44:43 +0000
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
X-Inumbo-ID: 2d728312-7b83-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=if9uVh8Z79jsjrcOaPHubA+OGJ42bslQ2Hy/8vP8veEjywAoRxVOBvTjQOH66WkKQ2ztvWrMBgxtAkb2aotIhtfS6+4G57/812f2OMjEx0X2ccMoND8OtuOWLF2gPL1372dOzqFKEvJGAnQK81imieeSlOOeIFTE0GWz0Hu6K0aXsqt+qW/gfejCc88MIlIouCNov1hj/M5dcg1RKy9ERIRkqtBaP1r9hiBUIW9o2EEuoTDKZD/5sGXigDPA0brs6ekbeDfmpza5TEb0BXEzLYRXLcYHE131ejvkLZ2XWaDQ106CGfFgGFsG5xc6obdZEmGHfuvwQZnDK7vm3FRVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qq3IpAcUi72TvglG7aCmx0LlJl/vlgVF+F4dXcQsL1o=;
 b=GVBDmhnuz6OL82zMT0nMfbsSPnCW5Uw1WI5wqTFOBQGv4xERV5A1FrP1pmAcuxkfB+QtV0SkJp4FQ83/u2EwsBSSdXU+CEBJPV/t2YygZzHC/TGvRM5rXZDsa7HJWhBMA1vKExg1osu/WsnhXW3nz/7b8BCjzE/J5KaCVyf80gIqjs1c3l139op77qCFozNAnPWoqERoLBLltJj5F/Qo5y+k0lBOH5Mvo/31OjhpqH9pBzjHxZdDeDIs0/AonK9clT8wTlianeMe/ylYn1rbb4bPlW6QieKZnzubnBxj7UOTrJEOkYDomOPubeDlnV8IIOlTZJ2cnoIglHh5uL5q+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qq3IpAcUi72TvglG7aCmx0LlJl/vlgVF+F4dXcQsL1o=;
 b=Af9JQCVmF3rfuOjpWamhWP47GAFPodbPueQS1/TYNMnElZzEnokLDppU7kpTYQkquoDx9fmiuwBTqCBaSkPL5F20fcip/Z9o185Ft0RkZuq740LtPVMHdIj27txqvo+86aPmgDTBzsS07B+3BsluEosVIg+QKcklWfL4Oab65Zu0XAJmCslvBGRoIMxJL8daJGlhK1QUfZKywLLMUCOR9UkqdYWtvBSUfTuBiL1mY9NObOu9dBiPUYmKUVY5vQjE+WYiTA6ByDtLIDeYhLGpb1GG56HUho+bHU5OyEyfU8WCw0XzRbbWc6tH9SWEMKnqe0SMfxvL+8w9ndMdaYcWOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bde2aa35-773f-1c8f-3a80-f4ecb2d445bb@suse.com>
Date: Wed, 14 Dec 2022 08:44:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] x86/mm: avoid phys_to_nid() calls for invalid
 addresses
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <471bd202-7bf0-81be-e8a5-780ea5975a70@suse.com>
 <d503a684-1689-ef60-23e8-5eb6b33ab5c8@suse.com>
 <495b4c44-0af0-d057-c584-8601c65c770a@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <495b4c44-0af0-d057-c584-8601c65c770a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8054:EE_
X-MS-Office365-Filtering-Correlation-Id: a514a76d-61f1-4fdb-458d-08dadda710b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yud2mzHyGGvjvXVHTaoYadgwxE/me1ipKvp1eObXjgidndphdMI8N/v+Z+P+H04cJ1IxbC7EVRb2yhiPkVCMg74M5DVR7wYdluDlc3A7Rp1gdvIOORso+mcOu7JM8gJtg6Qjol8GOpPPxHHATrgjnpLSh/tT35SldDahDmp/NMT9xBm4ztxE1QTaAreVD1YWP9mMMbX7NZ6vpJyh1XuhUvZJ92Yq0Y2kKHRnh7sPGpyeFm/ar5RAEANh/Tqvl0QsnsOj+ahu3jZLtRZQP2LX7kArpVXKv1ItQEOO/dDLSdL5QbT+OjwOyVPr8sQDbgTkxSsLwjiaCnNDd5vPJvJMw3TMVcIlGuLtoJ3YfdFXvpRiUJQ6DWSZGuGWn+jv62T+69dm7Oa1Rc5/HL2UKu+KfCoLfSVPwlkKs+Q7p5pG/YAw3RnPibnQdG217Y5L28Veh75ciepTZxYLh93PDJeTpbcLjhL1laUBoO1hqlxf5fY/pNBzqngxR8KWUSLiKWeohxwz3Ni2aWw/RFtxJjqGtn86kG0gvn9/UXsKyn6/b5i4Z4vWzjcxXZWXIYgdnSTuIcs34baG3b7CJo/dbYLEduQbx8xwThU8lYgbbizUDXcfi5orPan28ZZd0KlklIw5VAD9bEeSSsp4hRLIwv6xdPWcTC4Q1CAADqz01P/sRph7Gg17sMsjYlhXml4LP8lCGUZaivNMrYKFZKn4AqVCQWiS9/uBUNHppjJcMMygSr0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199015)(41300700001)(38100700002)(66556008)(5660300002)(8936002)(4326008)(31686004)(66946007)(8676002)(66476007)(83380400001)(6506007)(54906003)(36756003)(186003)(2906002)(6916009)(316002)(6512007)(2616005)(6486002)(478600001)(53546011)(26005)(66899015)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUhrSkZPQ05BT0JNaFdhYlhRSThJV1NXbWJ0Qmd6bE9raENVM3U2cXpXNmNr?=
 =?utf-8?B?QlZ1d29sY1ZCZTNtNzV6QTllR1FRdHhDVG40S3o5dVlTcEtuYlA3ZmlvZzN5?=
 =?utf-8?B?aUFBU1p6ZlZLNnhFdkxNdWtBK3p3MkREdkp0TG01azBhRDFQZG8wbjdUeUFa?=
 =?utf-8?B?V2FiRGFzT3N0VWdoK3VLS0xmVmdwbU5zQ1ZkYVFoTys5MW9iWXpDNXRsTmNz?=
 =?utf-8?B?dkFDOSt3WWpDM25OTjJVUUg0MFBScmFWOFRibDcxZjBwL21sblRuQ1psMG1n?=
 =?utf-8?B?cXVETmR0VkE5ZGxPYU03WE00OGlnS1N4VmdheXoxbnUzNHhiaHFMN2pYNkxi?=
 =?utf-8?B?ZTlSSG55MU9WSGhVbmNMLy9aTy8yR2VyeFNNQjc5bm11OGtrMis2bGNESkUv?=
 =?utf-8?B?OEowN2srUUJWNkJQb1Zld2NudWRVbzVLamZHWUFrd2xoUytQM1VueGdVaTZJ?=
 =?utf-8?B?UExKc1N2ckNmOVNBbFBRYjUrWXBsWGZyTUs1VVlhekNCN2lnWHZ0STFSY3lP?=
 =?utf-8?B?dnJHVlRjV0tLbmV2SmFrNEpGcWpZek9rL3p4QlRDRkU3cFN2NmVGWVZjVXlI?=
 =?utf-8?B?T1lyNDUzVjF5UVk5dDdCRGZ5WDNsSHQ5cTEzZ3lrUHVyTHV5alpZZ2YrU012?=
 =?utf-8?B?VUU4eStCenAzOWZTWUVsNzJESW9zcG5Idk1NWVlyUkRQcjVsRWVOZndqUkxG?=
 =?utf-8?B?bFFBUjdETFBDcEhrUEliVk9IVXB2RG1JKzNZZUdJbnFXdGNVdWRqdThNeXUy?=
 =?utf-8?B?TjhOVGU3L0gvN0kxQk9YTDFVRkRIb1JDOStUY08wWVBGL09QZmY4TnBVOU43?=
 =?utf-8?B?ZFVpbkMrd2E1UUxOcUxQeE1qeTdyZGVPbzBpYzFIWHFQVndwWEQ1eTV6ZDJq?=
 =?utf-8?B?MWRUa1R2ektLbHZvVUNnWXJtMFd1VWM0bHQ2SUMrQXJSeVFITmxNTEF3L1ZN?=
 =?utf-8?B?Q2tnZHlwQkRjYW41elBXakhmTHp0cTVlQmlFRDc3WkxvVmsxaDBPNFAyUkd4?=
 =?utf-8?B?TWFJdVNBdDdLOHl2WTk1YnIvVDlOb1dDQjMrc0NSMmEwbzV1dXFlTnEvZkxM?=
 =?utf-8?B?RjRHRHpTRk5oZHBQS0pWSHFicEgweXZOc3ZWdW5wODdnM2VjOTE5UkdNZXM0?=
 =?utf-8?B?VTRrNlNvdjNNSzB0a29uUWFwWTc2bDBtN2c3Z3lwN1VONlVieXNodzl5cENX?=
 =?utf-8?B?MUgvN3V6ZGxTMzgzSEdnRVVucUkvRm5xczlTM0hhUWdFN0hxa1E5TlgvcWdN?=
 =?utf-8?B?cUtxNWJPemcxV0laZm9ubmZCNWQvM2dLc0JTdnUyWXRjU3lCdU5ERVZrMStW?=
 =?utf-8?B?T2hvU2lNeWw1VVJka2dwUTFwdnlYRGxGdE5HZmNxWHF6NGtTVDFrZ0NvNTMy?=
 =?utf-8?B?SHFIUHdIMXQ4YzJVaDZTcWlCYlEwcktaZUhnMVFLS2hMbk43eVA5eDhqOStu?=
 =?utf-8?B?Q3lmR3A4RkNTRTdFODZKNElUc2VZb0RMUlJPM2NqN0hqa0VEU0c3ZmtjNVdH?=
 =?utf-8?B?ZWJnazYrc2hpR0MwdEdtL2QwWkswemZ3Yk9GUEZ3cTg1bW9icGs4TEY5WFVl?=
 =?utf-8?B?WUR2dkFKdzZTZzZVajBzOG96YVkwazdTL2ZqdzdHWUpuSEFkRjBtdGM3eWJF?=
 =?utf-8?B?SlJkeS84WFBuRERld1U3ckpxcmRCbHRmb0I0MGZUdWdwbXNZcTBKNFAxVk5h?=
 =?utf-8?B?ZGNNWmVsVXVuMXF0bWJWcjZXWjlsTGtmNU9tcldBb0EvSS8vTkpiU2VudjdT?=
 =?utf-8?B?TWNDWEliZVk5UG1hcXJXWlB1OTRvRWtlbDFPMHRnYnNUQjY0V05hckYrYWFh?=
 =?utf-8?B?UEtqdE9Lc2V5YktRejdZVHZxdk03SUNkNmFIY29KWlEyRUUwa3NJZUIxOVV3?=
 =?utf-8?B?bUZ1alF6Tm9VMVpwd2M3QkJjZmpQeWx5ODJOKzYvRDRrTGZzVzdYbVZETm9O?=
 =?utf-8?B?bDlkWFh5c1J6TWRsbGxXdGR4UmtndmYyUTl3ZDlmc2xnQk9rNnF1dW9VWjd2?=
 =?utf-8?B?UGFlWXg4dkhqbnkvcjJJVmNNelJWWllhN3lRK0N2MG5nVGdlTE44Nys1TlFL?=
 =?utf-8?B?ckdBNGxhdlc4M0k2TlBXcTRqa0ZTZVVlN29oQWtIeDRQdlhzTS96YlhtRS9K?=
 =?utf-8?Q?Nq8xbvFnj6XECTs2bdzn+HkrG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a514a76d-61f1-4fdb-458d-08dadda710b4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 07:44:43.6810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVVRjakEqgNP4YT7IYusBRlag0ru9atP0SOQrn5y8Vl5zQBfU4TaTCCB5IvAVQ1+QF4xsDKSI5MKNyAJLd8rTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8054

On 14.12.2022 04:28, Wei Chen wrote:
> Hi Jan,
> 
> On 2022/12/13 19:36, Jan Beulich wrote:
>> With phys_to_nid() now actively checking that a valid node ID is on
>> record, the two uses in paging_init() can actually trigger at least the
>> 2nd of the assertions there. They're used to calculate allocation flags,
>> but the calculated flags wouldn't be used when dealing with an invalid
>> (unpopulated) address range. Defer the calculations such that they can
>> be done with a validated MFN in hands. This also does away with the
>> artificial calculations of an address to pass to phys_to_nid().
>>
>> Note that while the variable is provably written before use, at least
>> some compiler versions can't actually verify that. Hence the variable
>> also needs to gain a (dead) initializer.
>>
>> Fixes: e9c72d524fbd ("xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: With small enough a NUMA hash shift it would still be possible to
>>       hit an SRAT hole, despite mfn_valid() passing. Hence, like was the
>>       original plan, it may still be necessary to relax the checking in
>>       phys_to_nid() (or its designated replacements). At which point the
>>       value of this change here would shrink to merely reducing the
>>       chance of unintentionally doing NUMA_NO_NODE allocations.
>>
> 
> I think it's better to place the last sentence or the whole RFC to the
> commit log. Without the RFC content, after a while, when I check this 
> commit again, I will be confused about what problem this commit solved. 
> Because just looking at the changes, as your said in RFC, it doesn't 
> completely solve the problem.

Moving some/all of this to the commit message is one of the ways to
resolve this RFC, yes. But the other one, flipping the order of the
two patches and making mfn_to_nid() check less than page_to_nid() is
one where the commit message here would need re-writing anyway. IOW
the primary question here is what route to go.

Jan

