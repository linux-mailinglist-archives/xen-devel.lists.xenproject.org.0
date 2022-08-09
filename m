Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17DB58D39B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 08:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382773.617799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLIWd-0007UM-84; Tue, 09 Aug 2022 06:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382773.617799; Tue, 09 Aug 2022 06:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLIWd-0007RX-4q; Tue, 09 Aug 2022 06:15:35 +0000
Received: by outflank-mailman (input) for mailman id 382773;
 Tue, 09 Aug 2022 06:15:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/TE=YN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oLIWb-0007R8-44
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 06:15:33 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20060.outbound.protection.outlook.com [40.107.2.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abb56666-17aa-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 08:15:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB2848.eurprd04.prod.outlook.com (2603:10a6:800:b5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Tue, 9 Aug
 2022 06:15:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f%6]) with mapi id 15.20.5504.019; Tue, 9 Aug 2022
 06:15:26 +0000
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
X-Inumbo-ID: abb56666-17aa-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCSJXukgBouTtyLvAB2G/88ff52BmacMzPZiz122Vwbj5VYExuqYpMI/SAH7OrdGuWMjTh5PpBqEOGm4uSpR3w/ecRRP4v2ZgctKnsKlfdc4jjZfkaGOMXr8vEWEeRw2idC9zEgKQINWekMWGpkwZNs9CDuHeCo5t/C5VQD8efPmcaxxNKpkZQ4ne03KxBMAlpgApNyUb60FQPW31kzQsaaIXuByLrDuBQDP10afloiah5jnwm1vOnYOE6pMBPCQgs8ghi4zlK6vT5wkxnz2tWdtnOHvmdY6neifSvjyrzzWvqelE6dy1YPFRw3ToFvxmlv1prn26RnGn6TILvpejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ot2c4bL9669ksxKlItYytiYsvDYnn9xXJUSAVuSlkXw=;
 b=mD2frlOzcpS8SB1iMRtYAo61rYbGjBlX/jiZfb5I6R0iBa6na2Mo1WXEbfJ/7O40jZGi5GuvMNKCQxMjxhWEmcjm/0umuDshAYwcKn9pruYW7eNSS9K/r4sEJOGhAKBMzoNuaOzpBG424GYFSXnuLcsQ1my+XIBf3/W2QzpW8D6Oct7g+HIf1KOPtU2inUDKu1vBXPYy6MPMDN4hktgeIf4wrEnO/HkLCIcJaNBdJ5l1Fh80US3EhC6CsMVebnY1Y55Que1hGmH1xcPvS9HC9tp187h1U5uHnI+8pUCDBhJi0Sf9sfCWppfSKJPFt3Di5jKRTRJ3G3QUNpqSI4AWJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ot2c4bL9669ksxKlItYytiYsvDYnn9xXJUSAVuSlkXw=;
 b=WHXtf6AuDc8Z4UxxEMna+YnKkW62+Q++n/Sr86jCsH2Ig5Z/FObA86aFkYGu6J/wlAqNDUy/QU/Hr8CmBGn9BanhFK0GeUZmS9FXcosvWVV6I579pgDMgGP8Qv8VSRVWBNA4IQY+aw7kSS1RexuZOnu0tHMsH9cSmnH437oJ7SXUpnZnESvuJcvs7+V2bHcF7e8yh6YbORDriAvxPgXyOjWWa+nyvUvpe6UFzgjfisVotHs90Qha3bvs+lcn87Hou2bPu+L6u+nKSjn2G0P4AdeR/gqCIVr0EHyWn+UjfAIZPCOkSVIwUAw2BC3gCm0o16L5KiYp2jQNKQmDYNaTMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <70871d00-4dc3-74b6-4c52-c9dcefeb6363@suse.com>
Date: Tue, 9 Aug 2022 08:15:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] xen/sched: fix cpu hotplug
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Gao Ruifeng <ruifeng.gao@intel.com>,
 xen-devel@lists.xenproject.org
References: <20220802132747.22507-1-jgross@suse.com>
 <20220802133619.22965-1-jgross@suse.com>
 <e62049ce-09e4-f457-f849-16ce9c581145@suse.com>
 <353f3e95-f8e8-5c25-b5e8-8d90ea62e737@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <353f3e95-f8e8-5c25-b5e8-8d90ea62e737@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9a556b8-2f35-46ca-f4cd-08da79ce8d19
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2848:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p/RIDBQptDICjmQdLKGiyOJGCptpo/0Gi5+TQbjKIrtdrR+4QIcfE9AdVHvHz8dN7kfEfBEWBZR6rkWxW5/QisvJoR0n69dtBmtCRTcR6l4FC7BnXav6zVORwf3r6/czww3zoiIVVX6EnWReqDV75DOtALnOzdFjNKYHxZcD8U/dEmlP2pBvj/GaEGWgH9UtbUfvyf5NfCb/7h03exghh6+GuG+NtbzBC83L8EFL9gtTb9TP1xrEN/8qpQGGn6OdD2LZo7e6FLEibvQzl0c6DycJoaUOczK6iIhUnTg5oG2fTKpr8jdWR1tZm6/6Fth1Zx5R/fISQvFpZGO2FUG5jKawLXCuSlzlpjaAy+2v5SQRrnOv6uKiPFo8jNDokY8Rp2ntCMJfyeBBwNVYr+aoDhPvldyLJNl8bocO9a/JV8BHq6TjKUwPx6UynwEInU40C9UH7libpUeMrtmB5KbtoaS0g8CAX94Xq30tHzxca0/ay/IVQsIa2C4RobdCZBTSQZwfqDSeMwG+ry6n9HueXdqWSHbzdL09GveBXkHSteWyfY1epH6Bo+itiv7LcvfgXJ/nPXjwdQGjfxp97lKEFlQiDRyOUVh9t5rVbiowUC+3syjwKez2i2J3A9DnsWICf3jX/ngJvcarU4wCIJ11EQxPa++D4uDTsROE7XkXCW/TWH2tZv2u1HP2UBUdSWbiBv6FyYEouMHw3Z8M4MbuK4PUN8DwngjJ/lUaeF96XJyetK2d2B6yLNh/gCrzOfrE1AnpCft77rwoVxRl0RxO6qbJvlq/oFFNcKZ3VV3tRMJUkh4bG7KYG8q7BVdunggASeGmWIaVwG73nLN2WUo5hg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(346002)(366004)(396003)(136003)(2616005)(38100700002)(86362001)(36756003)(2906002)(31686004)(6486002)(5660300002)(31696002)(6862004)(8936002)(478600001)(4326008)(8676002)(66946007)(66476007)(6506007)(66556008)(316002)(41300700001)(83380400001)(53546011)(54906003)(37006003)(26005)(6512007)(186003)(6636002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXlFM2ZicVlRTUNQS09ReTAwcnVmVy9NeVFyWTNpSzBNVFdMeFROa3NUL3A3?=
 =?utf-8?B?bnBVQUZUMG9FbEx4cjA2bkUyWU16SC8zUWtjYjgvMHRUV2pTZDQxYTdMeVF1?=
 =?utf-8?B?VDRad2JDTUlDZGRLWjZoUkMvS1FjdnVMekNSekFIVC81NksvcEVBdUwwWmJs?=
 =?utf-8?B?Q2JSSE5DODVURFR1UTIwS2cxQ1RpZzNtM3d5THBUbnpKekRXN2NGdGEyd1JS?=
 =?utf-8?B?ZHpuWHlMTkJDN2M0WjlRYXVVUXcvanpXaUhHMkRnbU1KSnVUSDBEU1ZnMzFH?=
 =?utf-8?B?cDVYR1J6WC9sbi8rRTZETnl2ZUI3UkwyNHpJSDRtN3FFN2tVYVkwVTJyWlJ0?=
 =?utf-8?B?NnkzMk83b3N6SUF0UDdCNUxuV1FpUDFXNUxuTUpBRXJ3bDYrZTduUWRTWlk1?=
 =?utf-8?B?SXFyOURZZVNuQk8xMUN4V0tqWGxsTUpBbkZ2MTR2dTVlNUlWeXE2UmdSaGlu?=
 =?utf-8?B?NGpLdDJCZEVabWRJakRDQ0JXcnVNdHJid3BRUG96RGc3RVVuRmpkeXFiL2d5?=
 =?utf-8?B?d3J4Y2tCS2RJWW5BOGd6VmlIOWdDL1FKdzBYRURRTC8wRHRndU1CTmpicWRT?=
 =?utf-8?B?bjFzUDRXeHE2TFJsSTlXZkd5WnlMek15OGtuTTQ1dFk1eVMreHpwOThtblR4?=
 =?utf-8?B?SndZQ3ozYm5rYzVhK3FWQ0lHSE90SmdHRnVqTEQxOXJFd0kxZDI4aHdRTFlj?=
 =?utf-8?B?UEUybDV4dTlWbWxhYklmRGxzL01nbmk0cDcvNVREN3U3aDJJZ25yc3lQdnNz?=
 =?utf-8?B?ZmNleE11Vy9JUEhlaStIVm0yVE9IczZGU3kzUXM1a1dZdWhMTlV3bEFnTHIr?=
 =?utf-8?B?bWFxOG91MnFza1JXRXduL0NUTjlKeEx3N25wc296ajl3ek9kc3VHTGV5M1NT?=
 =?utf-8?B?NGhSSnpjNnpuSVlzTEo5WGZDZThrUGpKMkM1M0tkR0JMdGMvTFg0UW1DSjdY?=
 =?utf-8?B?YUdMNE5zYXcvSHozc1lGd0dGQlRBZFU0OTVBaFJSR0h1blpyZjRnRUV4RmJI?=
 =?utf-8?B?ckhMRGlKbmVYTzRnSmF4dUM2aHk1TjcyalNybXI5MlJvRmRLUzhEcUVaQTRD?=
 =?utf-8?B?QVRVUXRLOWZ5Rkkxc0ZuVm4wemEvTi94NjN6dUwvWkxscWlGQkFPaldOVE9G?=
 =?utf-8?B?ejQzTm1qa2NMaC9SblJCRGdmN25UME1WaGdkWlZSY0ZBckhMZXdVZ1BrK2NR?=
 =?utf-8?B?N2kzaUVGbEZIeXJWNjJMUFpNa2dhL1k2TWlRNEppdVhvVlhmUTdXTWJ0dlps?=
 =?utf-8?B?d0YrQnpQL1Q1dDBqS3RJRVVPZnA0elBhRXF5T09OTjgvalJBR3lNaU9zaDhy?=
 =?utf-8?B?bzhpbnNhSjBDZzZKWVM2dFhwRzZ0UTVyL1BUYWx1WTRtZk9BWkpDQ1M1SHVN?=
 =?utf-8?B?eFR6OEVSaFBLWmdPaVE5S01paE93UFVnUWxoZUZRY1hYSlBTRmc5RUsvLzU2?=
 =?utf-8?B?c3NMVXZFZUJWN3ljbzNVNW5hQVNEN0hOMTBZN1ZEdXR6cVkxZWorbFhhK2ZK?=
 =?utf-8?B?Vm92elJ5RWFGUU54NWJJUzhVODllVzg4a3hyRjZQa3dBU1FyM1dyNlFQbGQw?=
 =?utf-8?B?YlZEc2VGME43dmZOMDVpUS9FWjZqUTBpMkpkYXBhZ3ZDWmZCMXNzTGZQYzE1?=
 =?utf-8?B?bEkxNG5RRHgrM0VLVzUxS3h5S01OQnhHcDRqUjAzcG9rUlZwa2VNYUdHK05o?=
 =?utf-8?B?WUJISy9TSklLS2dubTlZSmh4V2VoQkRYcjR0akdtSzdlKzlYc0dVRlpCVVBQ?=
 =?utf-8?B?cG9TN3RXRktaZVZsVCtvM3JkVjZDN2lNMWQrczE0aTUxRjVNNHpJMXdYVkJC?=
 =?utf-8?B?NUJXcUxnNUpCYWQ1bjhMWUFMczVUV3NHN1F0WUVxYWovRkZBMVRtVHpmTDdu?=
 =?utf-8?B?NnNMcXlQSU9qTEVSVCt6QVRINUt3NEsxMlBBbjkyTXBIYnc2SCsxQml5YjNH?=
 =?utf-8?B?WCtLQlpyL3NLMFVYVDhBV2VNU0p0Z2FyMXVwWE14bXNIdU5UK3JVVnZrWHRj?=
 =?utf-8?B?cGdHcW11WkZ0SlF3VjB1aDJzZW4rMG5PMnY4S2RKZHJORzJUS2FxMGdTMVN4?=
 =?utf-8?B?L2lTU3BIK1RLaEVpNzN3NTFZbHd5LzRuY050TGtlbXJvVUd1eTBMTzNQV2Qx?=
 =?utf-8?Q?h7t80daWlvQ4zgz7FoiqK5sno?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a556b8-2f35-46ca-f4cd-08da79ce8d19
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 06:15:26.6046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJRdnjQOr6oVF1Bx1dJGMg5OR2F9JczRfVnndzXSOh94ltgXv6XepEMnIL+A6LSpaATcekph6zhKTPv52pbUUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2848

On 08.08.2022 12:21, Juergen Gross wrote:
> On 03.08.22 11:53, Jan Beulich wrote:
>> On 02.08.2022 15:36, Juergen Gross wrote:
>>>       switch ( action )
>>>       {
>>>       case CPU_DOWN_FAILED:
>>> +        if ( system_state <= SYS_STATE_active )
>>> +        {
>>> +            if ( mem )
>>> +            {
>>> +                if ( memchr_inv(&mem->affinity, 0, sizeof(mem->affinity)) )
>>> +                    cpupool_free_affin_masks(&mem->affinity);
>>
>> I don't think the conditional is really needed - it merely avoids two
>> xfree(NULL) invocations at the expense of readability here. Plus -
> 
> Okay.
> 
>> wouldn't this better be part of ...
>>
>>> +                schedule_cpu_rm_free(mem, cpu);
>>
>> ... this anyway?
> 
> This would add a layering violation IMHO.
> 
>>
>>> @@ -1042,12 +1065,32 @@ static int cf_check cpu_callback(
>>>       case CPU_DOWN_PREPARE:
>>>           /* Suspend/Resume don't change assignments of cpus to cpupools. */
>>>           if ( system_state <= SYS_STATE_active )
>>> +        {
>>>               rc = cpupool_cpu_remove_prologue(cpu);
>>> +            if ( !rc )
>>> +            {
>>> +                ASSERT(!mem);
>>> +                mem = schedule_cpu_rm_alloc(cpu);
>>> +                rc = mem ? cpupool_alloc_affin_masks(&mem->affinity) : -ENOMEM;
>>
>> Ah - here you actually want a non-boolean return value. No need to
>> change that then in the earlier patch (albeit of course a change
>> there could be easily accommodated here).
>>
>> Along the lines of the earlier comment this 2nd allocation may also
>> want to move into schedule_cpu_rm_alloc(). If other users of the
>> function don't need the extra allocations, perhaps by adding a bool
>> parameter.
> 
> I could do that, but I still think this would pull cpupool specific needs
> into sched/core.c.

But the struct isn't cpupool specific, and hence controlling the setting up
of the field via a function parameter doesn't really look like a layering
violation to me. While imo the end result would be more clean (as in - all
allocations / freeing in one place), I'm not going to insist (not the least
because I'm not maintainer of that code anyway).

Jan

