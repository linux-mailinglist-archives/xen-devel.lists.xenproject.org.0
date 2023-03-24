Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505506C793B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 08:53:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514193.796215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfcE9-0008OA-DC; Fri, 24 Mar 2023 07:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514193.796215; Fri, 24 Mar 2023 07:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfcE9-0008M6-AV; Fri, 24 Mar 2023 07:52:45 +0000
Received: by outflank-mailman (input) for mailman id 514193;
 Fri, 24 Mar 2023 07:52:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n250=7Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfcE8-0008M0-8F
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 07:52:44 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dab40236-ca18-11ed-b464-930f4c7d94ae;
 Fri, 24 Mar 2023 08:52:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6988.eurprd04.prod.outlook.com (2603:10a6:10:117::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 07:52:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 07:52:38 +0000
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
X-Inumbo-ID: dab40236-ca18-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esesW4DY8ENN0b0H3QtYL1KZhPOzf2z1e54abWPfzRmAo79fg0rYzenizVGPMjtEVym+RyUVvgLCC4xTa1pU5gC3myKJCD14iBslnHcCO9ULtEsRZdv9fKq3Yn4HQIUIS8B2850lOFLWketHBXG9ffLeQ0XJfZFu8f6X1ZnLP7w2JunkX2Bu8LnDfU9thKFcH3UhF73F36JlINfjZAd1no+sCugu4nG8aEfjWy2L1GcJmTTtgbS575sR8goSkUoG8SzZ6cMhQON82tmAckAxvLYgk9tBr2vB/i1v2JsdNLy1HW4wErXHWCiM5MSF8wqNOyhs1oScL8eL+5eUYOo4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N68Wac8O41rHbpwkvwzk9JNgrB8PmP9/1ATul2QjbGk=;
 b=FPYn55KxP/Kxm5+tK1A291ViN1jhCEtisWrNN3RxEu3Ov3O1SaIrCrctzNTi6VJ96SWKfAoUoBHLN9HFi0sk4CH1d3q+wOCDL6SbQ6paq2bwt6ddbyPP9gifpeqgzFCFP6o9VhIcek2k/svyLsCrc7Yx6rnb2ydfmrimxSwM7ip4RoPgtCZhuh/7I2aPGjHcZXw7Kwvy1np3ZDvS/4K7zkiefiUNN3aRLBkCMOqmE5bWIN1/0YmO5jbA4e3AwgRBv1jP5h3ldvFZyfMrqNcYdzjf+/AtbgFMkMQCl2BgphOoNbAHdZ3Jgxu4fYvQv/Cyuukuk+1NCYyIvVzrDPiJkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N68Wac8O41rHbpwkvwzk9JNgrB8PmP9/1ATul2QjbGk=;
 b=2DJaj/nA/p3AX9noM6zNtuiJriLkClhVaQMO6Q4dRgYioGMB4Vmyy4OFFXL4mCi3gcalDEqEUyQ2t51C0vbv6T5CSqhs3aqzRm84XsFy+BkzWGBRCf5bKoJv/Q5AzcBpMiXLgJhILKbJ2yKuwKayo3O+oa+s50+ma21hRE0EDejXLuuCYuQM1x7YayHOJ/xCWdOfARc2qzFGTIfDw8b5yfaHpGKvF1CANfTFL279l0gdZC+24bRpJf4rAAtk5EQQMg1gKiubIFVyw7NFawp1PjDXRwTDco95jZLBYHWQykEoWKwUjc3PW++DvZj0qnalfutKZp5+uqK6/xrpt7JlMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2977bedd-09f1-e416-e08a-3d6a0049e0c5@suse.com>
Date: Fri, 24 Mar 2023 08:52:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 12/16] x86/shadow: make monitor table create/destroy more
 consistent
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <d6ef377e-731e-faa4-aa43-ef40ea34be07@suse.com>
 <65662ae6-8a86-ddba-a3e8-57ee557f5b80@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <65662ae6-8a86-ddba-a3e8-57ee557f5b80@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: 49fa020c-7956-41ee-27dd-08db2c3cbd21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CSY8Du7Bm9T03vGlBbadhV4auwG+G5vk0A2w3XMIFVMNzy5HkvB7+PXdi3OxfU1xlp2AOJy/ucia0zg9H+xEF4tN02ASMv+peQSmpWypz1VmbWYyEZsMqxWCRlSSq6i1CXnZkt+gi3ytkRdUATK1FnUFF+UhAohl82JrGL+HhB4jn8P8hGRbt8KgFvnugFSqcbbdERLWZusJQDZwPChrr3/XvHDvZnHLP8ZogeFwSm8SPlubULPo75SGLdDeW9TkGbS9trKagp9MqNQHLpkIobioqy4MCK02YFD6f7WlLWxOqQn3TWq7CVROM9p/4CWnQryRFDll1ECIFAElP/jM6vUwj/AU1caCxl4zZ7WlzCfxogLP5jmBeEyiernyNuqU+lnT058wq2ujAUdLuOOwirmRFKf3dCMsJ9PLl+lD/SBw1x+ac6EaSCsFvYZQMkgkIXlrKBGedTSCySlMyPQaw9vw3wmra+iF1l4Igo+/atjrP4wH/ZOy2mp4iBTWpUvORt7V5yISgTl60Z3hZ086t7k9T4YutJksvulWxbtOQOsVR1iXKkhwVw1YIYlo21/vks/yOGc0tcD+iafOq+nEJe/Y4ZGr5VqtzSnaAFXMCH/bYnILzf7YsxGFmn0rb6y9kaXB9iODPRT4F7Ttxnp6Hw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199018)(31686004)(66899018)(186003)(26005)(83380400001)(53546011)(31696002)(6506007)(54906003)(6512007)(6486002)(2906002)(316002)(478600001)(86362001)(2616005)(38100700002)(6916009)(4326008)(36756003)(8676002)(66946007)(66476007)(66556008)(8936002)(5660300002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTZhZGFxbGVpQ0NxRFU0MjVtRlc0bGlqYmpBT0JUVTZnTHJvSXUyR3R6eUky?=
 =?utf-8?B?clo2T0NqSVVUVnFTbUd3QlZKMTlWVUFxcUxGMERzVEZOTkZSWkkrZjE0T1Yw?=
 =?utf-8?B?d3pNMWJSY0tzNk8zLy9wY2h3Q2ZoRmFYZ2I2cUUxcVRFb1Z2MlQ0V3ZORVhI?=
 =?utf-8?B?RC9ZbDJ1N3VoSm16amcrSk4rZnVhbFJwWUZVNXZnWVQwZHB5SEFPTXloQWV1?=
 =?utf-8?B?WEppZUZ2WmtERSthd3dLVzZKSzZsdU4rV2hDaWJybHY4TzVRQm9TUWE0YU0v?=
 =?utf-8?B?ZGF5cDhTaGw3dDN2Yy9zd1JoL0pna3E3N216eXczZVJOSm1DR1BocndRUzdV?=
 =?utf-8?B?MWxWQVE5cHl2aEZnejJ4N015a1gwVzgwUmRac3RNZElxU0VKdjl5ZjNQdUs4?=
 =?utf-8?B?WTJoa29MMzFvdTBlOE1xLzdHQy94MWRDM0cxRFg0bGFoT2pkYXlhYkVqYzF5?=
 =?utf-8?B?UVgzNkp4LzhJTy94aHI3V3BlbEJ6WDBXdzVvdkErZkJ0SnJwZTlvNEhGQlhn?=
 =?utf-8?B?V2Q2QXIreXZQcDZxUWxwZVVjc3NGQlE1WXhlOVNsaHRyd25TQmtHRVlsMk1w?=
 =?utf-8?B?WkcveG0xdWE5S2tRN3VjcGpXRU1neVd3bXlMNlIrbEhnRlZtOERyL3Q0VENx?=
 =?utf-8?B?d0MxSkxFb2lKYnpoSmlVemVONWt6SUlxSUYzbnJkS1FuZmlvSHJJVEhyTVpZ?=
 =?utf-8?B?UDZsM1FsTjBjcWR3eDdjS0FBUTRZU2tjazUzWkJJZi82c0FUWFFNdVdGSU8w?=
 =?utf-8?B?V1RLKzlMVmo3ZURLd0JJWlY4NVk5YUxmdlBsNXAvQkpZZ3RRWnpoNXROaTli?=
 =?utf-8?B?VSs4dlU3TGI5M0x6TlkrWllUc2d3akVjWmVsSEpKcWF0MVJBbmp2UFNoTVEv?=
 =?utf-8?B?WWxHa0xGeFliYkQ5L25QZk1OdCswNUkrTytzTjdrUEhHTWZsYlNpazF0Wmlz?=
 =?utf-8?B?bHY2d3pYSVYzVmFDNS9ua3krL3RjdFBPcjFLNWVMT1ZsZy9JSUhLMHVwcGU3?=
 =?utf-8?B?VzRBWVVMNGFmRUpwenFkSk1vK0IvY3oyajRBa2dnVlQ5L3prWkRrZWVTUmEv?=
 =?utf-8?B?V2tDcW9odlI1QXIrTnVLcUFQRzgrY2cyWkgxTG5LdzlSUDJpejg5UFdiVC9q?=
 =?utf-8?B?VnhtemJIQmgyTDkrbnlsWi9tZkJsVWp5VlVOTzRiRDRhRkdsR0J6V1ZKZGFK?=
 =?utf-8?B?bXdsZWdIcUl5a3BxcXZTbGxuQUw0OUtKZlhrTDFrWElZQzdxTmh2MkRMMW8r?=
 =?utf-8?B?K0ZadTVRdDFvRUREMi9WUTN5NnY5WTBCMjROcDYxQVpsL1JRMy9QeW5iQkd4?=
 =?utf-8?B?K3krb0J6cnk3dERJNGJnRlgzSWo1YmNwamZabnZPUVlEQU9PbzY3cWpTeWtH?=
 =?utf-8?B?T2czdS9rVFNPcDRLSTNPak5VNnZMM0hHTlpnbFJsSkRrNUtYOG5hUXR2UHN0?=
 =?utf-8?B?NzZLamtEK0VyNkxtNDdkWEpQckwzMjQySTZTbnpBdDRrTG5FRGZPSDVKbmtG?=
 =?utf-8?B?UVZjS0NVTEhrdExDRTJwVmtIcTJBc3g5N3BUaWtIU2xjclNWL2RCUFdsYWIz?=
 =?utf-8?B?bGp1VlpzRFBrUWFPSHRSNTZjcmJ4aDNSTkdJNEpqUm93djJxbVpnWjFQV28r?=
 =?utf-8?B?c1pnUm5CQjV2TXZzZ0dQWjl1R1Y2UzExbnN5RHZrYzJIUUdnUUNmVWM4UVFw?=
 =?utf-8?B?VmFlQTkxekljZ2s5V1k5NHpPaldKZ2tZUmo3Ymp1UmJZeDVDUm5HNU9uNitZ?=
 =?utf-8?B?TjZwdm00ME52QWxoZEdHZ2tHTFlveURyOUZnNXoxcVNnc3I3REVtakYxL2lC?=
 =?utf-8?B?MkIyN3pEekh0S241NzJSNlBUV2tzTTYrc0plQUFveW9ib3F3UGtKRSsyc2o0?=
 =?utf-8?B?RS91RTRWbDlQWnNlV2lmRzlpS0dsbGpNclZjNG9CRTRGOXZseTQwZmdzVGp5?=
 =?utf-8?B?TFQ2a3QvMWtxYjVrQTg5V1JYOHRrVjFGN3JjdElsWHBSa1haczM2RWhZb3Vj?=
 =?utf-8?B?S2FZUmZDNFlQYWNwRS9UajRoTFI5QlZQMThwTHg1d0JQNCtjaWx4dHV4Tzlw?=
 =?utf-8?B?a3hIVEI2c3VjM3NPc3JrMFBRL1ZrdXF3ZFIxb3l4ZFE0ZGFlcFNPQzZWUzVB?=
 =?utf-8?Q?8mdtwaN8ieG4uzkpysN6+href?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49fa020c-7956-41ee-27dd-08db2c3cbd21
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 07:52:38.7189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1OO7nJ6VGU8F+uSC7vs4BvMO/bGQsT7Q2mqBAKUh6x/322ZdQ79WkFBFinjhad2mUN0W0ePz9771J3ZtX4dBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6988

On 23.03.2023 19:28, Andrew Cooper wrote:
> On 22/03/2023 9:35 am, Jan Beulich wrote:
>> While benign at present, it is still a little fragile to operate on a
>> wrong "old_mode" value in sh_update_paging_modes(). This can happen when
>> no monitor table was present initially - we'd create one for the new
>> mode without updating old_mode. Correct this two ways, each of which
> 
> I think you mean "Correct this in two ways" ?
> 
>> would be sufficient on its own: Once by adding "else" to the second of
>> the involved if()s in the function, and then by setting the correct
>> initial mode for HVM domains in shadow_vcpu_init().
>>
>> Further use the same predicate (paging_mode_external()) consistently
>> when dealing with shadow mode init/update/cleanup, rather than a mix of
>> is_hvm_vcpu() (init), is_hvm_domain() (update), and
>> paging_mode_external() (cleanup).
>>
>> Finally drop a redundant is_hvm_domain() from inside the bigger if()
>> (which is being converted to paging_mode_external()) in
>> sh_update_paging_modes().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/mm/shadow/common.c
>> +++ b/xen/arch/x86/mm/shadow/common.c
>> @@ -129,8 +129,8 @@ void shadow_vcpu_init(struct vcpu *v)
>>      }
>>  #endif
>>  
>> -    v->arch.paging.mode = is_hvm_vcpu(v) ?
>> -                          &SHADOW_INTERNAL_NAME(sh_paging_mode, 3) :
>> +    v->arch.paging.mode = paging_mode_external(v->domain) ?
>> +                          &SHADOW_INTERNAL_NAME(sh_paging_mode, 2) :
>>                            &SHADOW_INTERNAL_NAME(sh_paging_mode, 4);
> 
> As you're changing this, reposition the ? and : to the start of the
> following lines?

Sure.

> But, is 2-level mode actually right?  It's better than 3 certainly, and
> is what sh_update_paging_modes() selects, but isn't that only right for
> the IDENT_PT case?

Which is how HVM vCPU-s start, isn't it? For PVH there clearly needs to
be a separate (later) paging mode update anyway (or else what - as you
say - sh_update_paging_modes() selects would also be wrong), which is
going to be whenever we see CR0.PG becoming set by the toolstack.

Jan

