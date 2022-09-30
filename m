Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDA55F0473
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 08:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414006.658038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe97A-0002Rv-QJ; Fri, 30 Sep 2022 06:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414006.658038; Fri, 30 Sep 2022 06:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe97A-0002Ow-NR; Fri, 30 Sep 2022 06:03:12 +0000
Received: by outflank-mailman (input) for mailman id 414006;
 Fri, 30 Sep 2022 06:03:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHGM=2B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oe978-0002Oo-FT
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 06:03:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60044.outbound.protection.outlook.com [40.107.6.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e962169-4085-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 08:03:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8539.eurprd04.prod.outlook.com (2603:10a6:20b:436::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 06:03:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 06:03:06 +0000
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
X-Inumbo-ID: 8e962169-4085-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vrk9YMtOHxGMoSilWjWs8cDIQfwS2WkOjBiQ3V5qWgEk/49KKENO7W0+j3yeyoGxKlADZo5/L5ZGtRHPQym0B5ZTbQNJK58SqI8+tGxLgVisZi5ft8m8mNkEK+n2osEO4Y244cXrnQMV3dLEBriFR08T24s9hAFPwEDxY8T/DY5Q2EbNk3oi7dm8pKyuopMV424TEwrHYDKi3adFTTxzwkxE45VP+hLkx8QDO4LNJ9fn3B1VySFq+MXPJjV5wmNsuey0u1cx4KvHxEP4MXwnZ4SOvlanKDlAagPz0WmfhdMBoEON1xsr8zGerUUrfQNbsTAGD4YIbv65TmXGLigxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzF0cIUBeYdqvVoYkE0XVVR+Tf936AZ26VIG5zcHCUA=;
 b=RnXuP3CrbYfkx556gAOqQ5YcTwagotnWThGbL1yJ+Ek0cPS7Tzx5zlPjWqoKo4duG1StRNt6OZSgCPvqyUe5HfdVGNAFmDIqFgVbRTfHa0cxdqZEydXqOVKGEF76ROPiG3o50/pvlTO8etlmpE7xEfhPXbA7+unMmVlhrsSTQXeG4qDsVuSux/Ul6hKGmwWyMmc74z2+CvED0uY/zmU4oKT9j1Xanatz0baG/OYAtznjqPUea70CwHWSMeTjhfIx4Qdonu8ofPE8/oLhPgzMZ+a4cFBkCHPIq5ourtfaEl7Tg4otklc5ebVqD9OnEYiZAUkQGIcJAvWPcettjcGkmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzF0cIUBeYdqvVoYkE0XVVR+Tf936AZ26VIG5zcHCUA=;
 b=1QxKJFMV0q5fZYgstRurg97q+x2b5WDTV+HJkBRCkXepKePQ3cQVGNSZbnqOSD0ft6jM7Wd2G6QQqH2l5cXByCEl3b790v1XCGEJjgD5fSaMdGoCcl6kv6cd35DoxrFRTAkVOGS6TYCPYBxDihoz6eb8him3riz0u1tYoyTOoMl9vXO3aJR+oABS469qlxJezxPjOZWzKO2nwXSIsdolFF5htEpVAAdYx9/NVz3SQFDD6N4Lsn+QR1uGOpljUdsAYB03fnqrmHFmHwugAwWA/ouUGMPOoq0Z/Z7ylvBSHSI3W7pfBNRjeFkI6pQspchgHjkfbp1KJmAbf5iABhNZbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c32c4a9-d319-8886-c026-f33820a4f77b@suse.com>
Date: Fri, 30 Sep 2022 08:03:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220920091218.1208658-1-wei.chen@arm.com>
 <20220920091218.1208658-6-wei.chen@arm.com>
 <5ac85819-9a1d-b8bc-d49d-13cb34a3e7e9@suse.com>
 <fc03f565-8c05-e310-fa0a-698ad7c569e3@arm.com>
 <47ec8e01-8ea6-4678-78c2-c67305fe3b7a@suse.com>
 <PAXPR08MB742077FE40B3FB0614787B599E569@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB742077FE40B3FB0614787B599E569@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: 423ffa34-f241-4c55-8db4-08daa2a97180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jbi/t6JmELGusGaCKWus9XhFk+UIVJ4KnDialSM3oKuy05ttGMASDRy+8herhAy8OzZTHbi3DDxOErzVcVnrllaJ/zLsQkhhZIFYVVORFqDkAkjjn8YfOEhj7ZyBAQQrEGUsk+JIvjDbnKzOSym/CJqfkrTsqcAtrlNjuuIM2QT0CKfHFlJz/eTdQKerVY8rItH+CC3YsS3pBC5mJENjeIf+rmjHm/YTBOF+iRmmj32aV7xbmdWZj/cK5pz2Xyr5wcW71NhAbLrGZ7GuRDg0+G9iSRLhwG8ql5TtK04QTCC7tkErl6d1iUTkudzNMB7nLrd4iKJHXkn9picSYN29Jj6Llr/T+F/oimGEVAinnJsxLawf+KTK7h64QTV6ABurRTmqTnFxKYma4PRDGzWMSrp/TfWUspWo/R5Xuot5DdK7y2+bw8/SeuYiNr828t2VKqsQUgpRWwIKCRYS92B5AP0z5/vwcj5KMpEMOa/xpI7LTyOhbcg2kRyemwOPfgHfw/0ybXLd804O58/GY8dfDpvfpfA5lEAlr7iXZKlfb+u1LfDnH1ysFFJs/rcIOfTvtflyLtfbaFPuTa+WaazK5JPZc1pPrSohgvZU/aNlniXRpYuAbCfVnm/gCrE24n9NjleeNwu6lsTv/jdwRDV+/BGUZ4XTk+NX/vpPc+Qdh/mVMnqUu152A1Fjoj5b1I+ORC6I92H56sUWXtxifqUCI4s2N/OcwRCkijApF2Pnpnh9UVa2alxEiHJ3BrsjfmSRRBpCfucCu64CikQSDAdt1vllW+4Zev9yi6QVbr/Uhbo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(39860400002)(396003)(376002)(366004)(451199015)(26005)(316002)(53546011)(6506007)(6512007)(41300700001)(36756003)(2616005)(66476007)(4326008)(66946007)(186003)(8676002)(66556008)(31696002)(86362001)(6486002)(478600001)(54906003)(6916009)(8936002)(5660300002)(83380400001)(2906002)(31686004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3hyaEJTSENiNFZmM0VQVlFEcXVFd3RCdi95RThqL0t1NTdtNk0vRVNadVNT?=
 =?utf-8?B?Q3l3NkM3S0VvNzFZQUlEWkdXVXJDdU9OMU5mRlJSSk1FUTlJMnVUUlB5MnpB?=
 =?utf-8?B?ek5ENWdmeU9nT0hWdjdTbk10S1MzYXFOSVJNSjQ0Qy9vYkZ5Y2NOS0FOalJR?=
 =?utf-8?B?Y21PVmJrQWdjTzdEUXZXTG5YQnVIYndIcmdVaW9lUFkrTzF0cWNUbktPMmk1?=
 =?utf-8?B?S043dTJ1c2E3TzhUeU1yK0crMFk0U2daaWdxMWFEaWdxREtoenFJZzFUWGxQ?=
 =?utf-8?B?OFVpamtmZm50a1dSVzk4WVdYbFNMMTRUNFZOUkZPL0Rwbmh6M0wxVlI0VXJN?=
 =?utf-8?B?M2Zib0J6NkpPcy8yMHNuVm1aMW5JSHRRK1hUWlBucG5mSCtGL1h5NFFFSklk?=
 =?utf-8?B?am9XWk5SQ0twZEpkS3Q4VWdZNTY0Z2k5Tzk0N1NENzhTOWJzUWs4QUc4VXpN?=
 =?utf-8?B?NGp1MzR1VlpvMnVNQm4ydG1VVFVwQi91bGdHMEVZbjhMSFhJblN0ait3ZlZ2?=
 =?utf-8?B?NDBvcmsxbCtrRVByMnZvMFRuQWpNdEE3emxyeEpCSHNaQmFpOVF3UlZocWEw?=
 =?utf-8?B?emNvTElqakh6elM5a2pUQ2hOdW0xU2plcmdLdkNtbjVFbFh2ejNRT1FscXNW?=
 =?utf-8?B?UnhxczRsdTJNZlp5K2U3MSsrU0I2MXFRRTZPY05zZitsemJRQzh6SkVDWlFZ?=
 =?utf-8?B?dEQ3enM1UWZOYVM0d0E2UVQ5SFhDaTkrYk5YRERBblRmRjJpZFBYZHBhMDNj?=
 =?utf-8?B?LzYwdmJnaUV4ZXRCZ3NhckdUM0lCQktVQ0VYei9LS0RxQkF4TStXRlZUV2R2?=
 =?utf-8?B?ZnAzQ29PbkMyRkY4MG0yZEZWeUN5eithbENTdnNqYVR0NENwWkhxaTIxYmlk?=
 =?utf-8?B?RkVzVFdJS0VyRHArTS91SmFsR3NrSnJZRjZ1UXQ3dC9yY0NjUEgxY2VtZ2ZJ?=
 =?utf-8?B?MkM4cFRpSXh6b3Z3TFdqQktzRVd3aFlhbGN1RlZtVUtLMlR5b0x5YjltY1Jy?=
 =?utf-8?B?WDJWeElyZ29NTysyYW5wQjJWTHBjOElRWTZVY2t0SWJkN1dZWWpNRnpuYkJQ?=
 =?utf-8?B?aG03dEorb2I0SGhZUnZvWVVkUXgrVTRqZlRiMXZraDBwM0MyL2ZCckNxOWtT?=
 =?utf-8?B?ZFMyaXhPaVVyU1liOEJPTDUrUmtXNHJZYTF3ZGY2a3I3OFhaeTBRQTZMTk01?=
 =?utf-8?B?K0Jhc05ib0hiNEhNWk5QMjFBUE9xMFJEc0xIcUEzb1lyYnExL1ZtbWZybXRp?=
 =?utf-8?B?OHNkakJ4a0hja2FGUFBqTWZweEJ5bkhuRDdaZzFRci9HOEtWYmxVbkhWdDdC?=
 =?utf-8?B?RFF0M0VZUW5tRzFRTW5NdmFBTjZ6elNhV2xxdGZ2UFBadk9DSGk0MmR3cjhU?=
 =?utf-8?B?WkxKSEpFbmdhZFR3V3YxSCt1QVhydkFDdUpWYmFzUkRXOUpTeFpFbFdJdG9z?=
 =?utf-8?B?OVN6VHh5SFVhYWJKUzBLcjBqR0pUYWt5ODBzNFRmci9hTlU5U0VwY2FXeCts?=
 =?utf-8?B?NW5Fak9rcUlYL2ZCZ3F1WGFqYzFnVE9pdUluM0JJMVlqaFJmQnB2Q2x4ZmRW?=
 =?utf-8?B?NVJhL2J1bnZrbWlBRjUrUmpqem0xYzhsT3poblhxcC9BVHBoQkVvazNUaGdo?=
 =?utf-8?B?QitKeWQ3bEVkKzlCdS9OTExIWFAvYkJXTlNMeDdrYXdNUDRteXlhU2lXWDRZ?=
 =?utf-8?B?eUdEZGJobnNiQnZtT3dKbnhOYTV2MDJEeUxqMUxkYzhYSXpoWmRERFpLMG9O?=
 =?utf-8?B?YWxqZEpJcERHRnVEYmxnWGVrdTFnTkIwZkltVFZYUlpHcUN2bXMwMS9sMzJh?=
 =?utf-8?B?eEV6WnoxUkxVNm5lVXZNaVhMb3FZV3BvNlpWUE5XQ05NNDhqY3FaSXV2VjAw?=
 =?utf-8?B?QlN4cWZ5N0Z1a0dkKzhwM0ozbEcyeDR6dS9ydVdYRnBnOURpN3k5MXR1RUpR?=
 =?utf-8?B?TEd5aWhad2IxWlB1UTJwazlZaVZDSndOaFFHc0xkeG5QTUkvd1ZjSWczVTlp?=
 =?utf-8?B?UnZvMjhoc21oK090R3o3V3d0OS9QZStIOUhjMzhBVDhOOHNYYTQydVFvYjZR?=
 =?utf-8?B?R0NEelF4c055SndGWTVVUDh0bm5OQmdsenoxcUliMENiTFdnSjV1OG1idGFC?=
 =?utf-8?Q?eg/yQDJ7EhO1BLltUh8qx/S2Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 423ffa34-f241-4c55-8db4-08daa2a97180
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 06:03:06.5175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9OpK6n8rg6xeknXk9AoqXWmmcHW8BuPDZ88Z3Iic2fgKajeBeOr3vVm0wpP8CgWQMSqsTR2nX3N/tRK4EuYuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8539

On 30.09.2022 03:40, Wei Chen wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年9月29日 20:21
>>
>> On 29.09.2022 10:21, Wei Chen wrote:
>>> On 2022/9/27 23:48, Jan Beulich wrote:
>>>> On 20.09.2022 11:12, Wei Chen wrote:
>>>>> --- a/xen/drivers/acpi/Kconfig
>>>>> +++ b/xen/drivers/acpi/Kconfig
>>>>> @@ -7,4 +7,5 @@ config ACPI_LEGACY_TABLES_LOOKUP
>>>>>
>>>>>   config ACPI_NUMA
>>>>>   	bool
>>>>> +	select HAS_NUMA_NODE_FWID
>>>>>   	select NUMA
>>>>
>>>> While I might guess that you've chosen the insertion point to have
>>>> things sorted alphabetically, I think here it would be more natural
>>>> to select the wider option first and then also select the more
>>>> narrow one.
>>>>
>>>
>>> Ok, I will adjust the order.
>>>
>>>> One further question though: How is this going to work for Arm64
>>>> once it wants to support both the form of NUMA you're working to
>>>> enable _and_ ACPI-based NUMA? There better wouldn't be a requirement
>>>> to pick one of the two at build time - it would be nice for support
>>>> of both forms to be able to co-exist in a single binary.
>>>
>>> We are also working in this way. In part#3, we will check ACPI first,
>>> only when ACPI is off, the DT NUMA will be used by Arm. If ACPI is on,
>>> we will skip DT NUMA.
>>
>> Even more so an answer to my question would be nice: You'll then have
>> CONFIG_HAS_NUMA_NODE_FWID=y even on Arm (using PXM as mandated by ACPI
>> when in ACPI mode). But then what's the FWID for DT? I know it was me
>> to suggest this build time distinction, but I'm afraid I wasn't doing
>> much good with that (and I'm sorry).
> 
> How about introducing a flag for selected NUMA implementation to
> set it in runtime?
> For example:
> bool numa_has_fw_nodeid;
> 
> ACPI NUMA will set this flag to 1, but 0 for DT NUMA.

That's an option alongside going back to what you had in an earlier
version. Another would be (name subject to improvement)

const char *__ro_after_init numa_fw_nid_name;

which for ACPI would be set to "PXM" (eliminating the need to pass
it to certain functions, albeit the fw_nid will continue to need to
be passed anyway). I guess I'm not really certain which of this and
your earlier approach I prefer; the boolean you suggest above looks
less desirable to me, though.

Jan

