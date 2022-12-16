Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BA264EB11
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 12:59:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464532.722958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69NS-0003cT-KF; Fri, 16 Dec 2022 11:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464532.722958; Fri, 16 Dec 2022 11:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69NS-0003Z2-GQ; Fri, 16 Dec 2022 11:59:46 +0000
Received: by outflank-mailman (input) for mailman id 464532;
 Fri, 16 Dec 2022 11:59:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=joxT=4O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p69NQ-0003Ke-Cr
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 11:59:44 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2044.outbound.protection.outlook.com [40.107.105.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20aca2d6-7d39-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 12:59:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7658.eurprd04.prod.outlook.com (2603:10a6:10:20d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.13; Fri, 16 Dec
 2022 11:59:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 11:59:42 +0000
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
X-Inumbo-ID: 20aca2d6-7d39-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4JmhORqP+t1CoGdgV6w/qnV1DvwQt2S9aeLfZW4bgr5cKnvKRo3sfqMWU8JF01XWfL/nF/7Za+KjkOJFr04+Y8/srZXOEGuDQPw4Kb9eQgOrXMckiVzlrsE0fah0nUQ3sJtfgeGYQjlUvabVbqgRTrNeRes8MPtytWTfecis+sR4PnqzTmvHm7/uKAp+pe9UNdnCOs6GrRRJfbbBqDZXyRMLhRP/il99pA3PjSO9m4bi6JNzAD5p1Q1Xruh1gT5vmRJ8AcUQ9D37bp+lD/iA1SJy9BWigJ9uy9pIOgGWKdAT2swkeMLx/iDJ2jYTIXCQOOthP9hirvuGfq1ipH5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vddBN31vZmePKkvHxluqFDOIPBG2F6/itDT4wUkntVQ=;
 b=kY7egJ8foTaU/41Vh9b0LGcrdcu4QIDcaRvIIOY4E2wi5xU/QcWThqWxc+LnWDVvOjxIzDKckwvWis4zN12Fwawrqb4Aopmgd5AFJSLktVPTdAAhykVfG6aeTERndcQojmEQJa1rXVPD+QgyOwRfeShxTTzaoR9fWyz5+xIVChbtYA/qnf6w7IxdA2//UTcIURk6m1BiIOTjSqoHV5V6IrPFHnbj4FySG2GYO7wbnYgCiU9tyDYzTHsvJT+FJdMGRZirwgzErwIoRUxuZ/bkvgfxw+QaisAOCP08iWJHPC6H7gVr2rZL1VjXJwICN4aTSBNiObQ8SuEfxU2ucbY8TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vddBN31vZmePKkvHxluqFDOIPBG2F6/itDT4wUkntVQ=;
 b=n4p2qIbe7YCWUldXh4X9NE5F0VJlTQ3d15DzdiAKm2LXi/7Cl+hz9PSAjIMIFr9qKAxtnZKXZvkF86cD4rz/f5U9xZ2iT3T2eW/fGRrXhoQ8pWerRaEsJOkBoPWLDdNQ0lvXW7SziC7JVddrcTTYmU/TgpYKMIvpYVLKo0YR2vuB2SyC6FE0uILaE0sgpPhI0OE4C2IqlSvNAutqDJCxBLAR0VNFolaTDaqWnVay/jmfaaFvUIZ7URzKBQhVF7fE1HuPzJoY0nqdAGlWAMU5VMS+dx3yPXAg0XfqMSkEz6Tc/kAIEoWPrVJDj9hFmnRxa9Wm9ui6cLKX0rGGL4UPDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3efbf38f-4b78-7c3b-bd91-a17ff6028841@suse.com>
Date: Fri, 16 Dec 2022 12:59:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] NUMA: replace phys_to_nid()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <471bd202-7bf0-81be-e8a5-780ea5975a70@suse.com>
 <670b7017-4a6e-fa9e-9d65-65013bd4ad80@suse.com>
 <3a776bac-08d1-7772-b069-8a11583a4720@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3a776bac-08d1-7772-b069-8a11583a4720@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0612d9-5f52-4f14-fa06-08dadf5d0423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PSpMEUMk0RmWT4nlEPt2WH6ZbxpcU/x2G4rJ0Z8Q8tMIrDJZGO2E5x8fr/6D3KOHkTlXcs2rXhmpkSaSHC4ALpmW5eSnxLuI27cbVNKlAzuKm5V/cGwnLMUs7RQWBAxkfqsToH5zxe/fw2ESPpPF+jPPRVQFE2YB76L6rJ9AJ9JQf4MUVT1WWfvb8I79O8lOywM9dhgyAg21Tjd575Ay7Ky/e2BY71ET0msH4aH4CpObLnJS6p3r5T+QlQTG/Udy4973swi9Mx0jexmRq1m6wHFb8S2MXF5CNQFHOSqD1MLDEvjbTunrUZ6jX2SSrBAoZWy1jgAu0Y7rfkdorcdGHUABpW/24ygjsaFGYkk4ybNtFZ/4qng+8G789xVE18XGSqkVeIER7OmngC9Cblxyb9rj+/daOMh4lQixG8BV7WvRgzd0slUTYLIsIEIIA5SqE7JHOAy0LGRYFi5uVcb3UqWMXNgonYs0LTKCg9L3vsdHTnt2NO4BbguwUmdrT65e43Ti6W0g10AFBAoZ1zq0bE6K2DbjmH7JEp5YCmdKG0okP3+0UJvv68jP2tfB1K95GYS+SbeWSC52H7SKPiiIOROJS3XZS5CmFh1zyGmGgoNmDDMMfThOp/0TPRKHL6I8KDgL+6iXNALM/mJNFniwG8b+1eDlMLM/GQan54FTncKcPzmcLdqPL9Iv37zoD1k6P3VqbBEU5XV+j0tf2QQhxOUqxs1V83vbDVoY1N0jQEw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199015)(478600001)(6486002)(2906002)(36756003)(316002)(54906003)(6916009)(83380400001)(31696002)(38100700002)(86362001)(26005)(2616005)(186003)(53546011)(6512007)(6506007)(31686004)(5660300002)(8676002)(66556008)(66946007)(4326008)(66476007)(41300700001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTB6dWEwY1pwcXBqSjFiNlpnaFBET3d2Uy9lRi9RaE9ueTBhOTFzQ0tidldq?=
 =?utf-8?B?RUd5TTlnbE5mRUtCalpuamVuQTFMK25ZUXJka0JGeU56eHZPb3plalFvdE1T?=
 =?utf-8?B?bDhBSk1jdDlyQ0JjMW9CZ2lrQng3QWFvS1BUc0Z3K1E5UVRFQU9Zbm4zRHh0?=
 =?utf-8?B?Zyt4bnpGYzFtQkF6WFJibnpwZDNZdDErL0Z0MTN5TDRzZDJLeXIrNWFwcVgr?=
 =?utf-8?B?cUVURk45ZUxSVS85NzN5dXExVFpUTGN0WFk2cGdyWW05WHRpTCt3NGhrN2ND?=
 =?utf-8?B?TEIrRnpLeXdGR0FZVXdXajhPWDhNTFY0Q2pqN09aNmFpZlVGRjJGalRUVzhW?=
 =?utf-8?B?NmZKMUg5Z1JTcXhiZ2dpTWtHaTVlUE1oUEY4bkx3MHF2QzVjVG5sMi92RkZ3?=
 =?utf-8?B?RWlqRUhRWWJVb3FBdlhrOUJMRTJJbk51VmJFSDJjMFRPUVkvTEJ2V0M2R0hk?=
 =?utf-8?B?eCtja09EUmlSeXhLeFhzM0tHclpMc0EvNDh3TEtSQ3YxSDJzM2VkZXl3aXdj?=
 =?utf-8?B?SlJ0RDBOeXhvekNIZmFiT1NGU0JpeHVibStKYklGZ09IRmlOZEJ1SlZNbjNW?=
 =?utf-8?B?RkJTcGZlTjVZTWVMMFlNV0F3WUhJbGUwaXJ2Ukk1Z3Zyb002QXpZMXJsSVNk?=
 =?utf-8?B?MnJzWWJFNm1BMll6SkFsUWlaNTNHR1VZVDVjSWtsRG5KSEdTblFlZ1dadWw3?=
 =?utf-8?B?di9KaHpwalcvUXdDejk5Mnp4WmlMcHhDL3BNNzZiWjV1M3FoUFBQQlZxR2FD?=
 =?utf-8?B?ZWFLWWpuMkZ0cnpaWlJhQVZIZ3ZLczhKMldLY2VzQVp6UmNTQjYrNE1sMDZv?=
 =?utf-8?B?NWs5SzNJTEMwYmNrT0xtVEdZVkVTRDg0N3Brcnl6eXM3eGhPNE1UNThzaWNv?=
 =?utf-8?B?dHp1YytCcGVib290ZzR1NE1oZjZGTzRsR0lBSm5qT2wwQVp0MGVrbjJaQnV3?=
 =?utf-8?B?Q0VUQkttamRsZUZnUXIyTTFPNS9GbG9HazdXVHZVMFFJbkVacWkrZ0I4N0R0?=
 =?utf-8?B?ZDh1WkpDRDNRSUxWWVMxQnlKYlFhQUJoeGg1THhkRTlLY0drdEJxZlQwWExs?=
 =?utf-8?B?eHMvaEpsQmdpZ0c2d09NMGYycmFpQkRGd1IycXI4NlRkcE16R1hpamw2N2ZC?=
 =?utf-8?B?QnB2cUVkd0JCa2x0dFR1UEZKbCt0eklJRStKelBrRGNTRFRoL05wOVp2TFVT?=
 =?utf-8?B?MkpENVlvUHNIa2N0RkNCVElOZXg5Nnd0TGZpYmhWKzIwem5BSmMrZGVvaUpN?=
 =?utf-8?B?dHV1YUFpZEV1QUdXMGgvMjFVV3Q1cTN2bWRnbzFkZTF2YUJtQ0VpV1ljR3pG?=
 =?utf-8?B?czg0SEJzYkpTMUpHQVJaZmhDUnJ6RGlkWjhXN2RHUnkwZWZMbGx0YTl2R0hX?=
 =?utf-8?B?TXJSSExEaGZWWXNzb3Q1Q2xwWEdiczI4b21weTdnRGhSMjVRcDhaMFhud0Fi?=
 =?utf-8?B?NU4xUU1uRDUra2tyczFqdHl0ODdIMUxybitrcUZJcldHVm4vVU9TY3laT1JE?=
 =?utf-8?B?YVNETDd3R2lZb05RWXJHSVd6U3VKS2JpZ3Fnd2ZNV00zQ05hMDliek5aM0px?=
 =?utf-8?B?SnNlS3VGSnlVYzRZZ2lWQ0M5USsxQWs5Y1Z3UUJiZFM0cVFjdnBXaWZ1VEY4?=
 =?utf-8?B?ckIvcXlFN21MSEJXMzRlNmRURkFUTll4KzUvaFdnTmg5a2RBMlZUbjhhRzhK?=
 =?utf-8?B?dmovNE5YN0YrdUs1VmcwLzZkUUdZa2lKRlo0L1VJcENwRU1BUUxwTVJqMExF?=
 =?utf-8?B?b1g0Q3gxRDJlbjBKcWZKQjVxOTl6UmUzam15SWI1akprODhUaW5USUVqVlpq?=
 =?utf-8?B?OWw1TEFCK0d0dWtpNHVWTWFvNEFGYXluY3hkaUZhZWNJWTJxM0ZCV2toU1ov?=
 =?utf-8?B?V2RoSVBKVzBTc2Q2KzBwQmtLOEw5TnpVb0htTHVZMEJmUFNqNXBaT2s0b3ZZ?=
 =?utf-8?B?eDY0Z3NuLzF0M00zZ3FqZXBXUWtIU0w0T1dxQWRBSVU0OWFVMkJrU3ZNajJi?=
 =?utf-8?B?enM4Rm9tdmN3bUZXYXowdG5sN3p4dmlvNXlHU1lXRHlyRXoyZTgvbHNjL1Rv?=
 =?utf-8?B?NlBiRmxGOVREWGRoMUd3WGg4QVg4RnlMbnh2bEM3M09xZkQ4UVJLYWZxQUd3?=
 =?utf-8?Q?E3oO2OqMbujQHnCz//5d3TAsC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0612d9-5f52-4f14-fa06-08dadf5d0423
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 11:59:42.1546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzYC7ULKH+qFJfJkzkq2pe1AzhCyfGUjbapwNoMc71UrdnIlbrDRL6C0OhW07+nKm0EfWRKOhMwNFYDfuKqN4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7658

On 16.12.2022 12:49, Andrew Cooper wrote:
> On 13/12/2022 11:38 am, Jan Beulich wrote:
>> All callers convert frame numbers (perhaps in turn derived from struct
>> page_info pointers) to an address, just for the function to convert it
>> back to a frame number (as the first step of paddr_to_pdx()). Replace
>> the function by mfn_to_nid() plus a page_to_nid() wrapper macro. Replace
>> call sites by the respectively most suitable one.
>>
>> While there also introduce a !NUMA stub, eliminating the need for Arm
>> (and potentially other ports) to carry one individually.
> 
> Thanks.  This will help RISC-V too.
> 
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>,

Thanks. You realize though that the patch may change depending on the
verdict on patch 1 (and, if that one's to change, the two likely
flipped with the actual fix moving here in the form of more relaxed
assertions, one way or another)?

> albeit with one deletion.
> 
>> --- a/xen/include/xen/numa.h
>> +++ b/xen/include/xen/numa.h
>> @@ -1,6 +1,7 @@
>>  #ifndef _XEN_NUMA_H
>>  #define _XEN_NUMA_H
>>  
>> +#include <xen/mm-frame.h>
>>  #include <asm/numa.h>
>>  
>>  #define NUMA_NO_NODE     0xFF
>> @@ -68,12 +69,15 @@ struct node_data {
>>  
>>  extern struct node_data node_data[];
>>  
>> -static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
>> +static inline nodeid_t __attribute_pure__ mfn_to_nid(mfn_t mfn)
>>  {
>>      nodeid_t nid;
>> -    ASSERT((paddr_to_pdx(addr) >> memnode_shift) < memnodemapsize);
>> -    nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
>> +    unsigned long pdx = mfn_to_pdx(mfn);
>> +
>> +    ASSERT((pdx >> memnode_shift) < memnodemapsize);
>> +    nid = memnodemap[pdx >> memnode_shift];
>>      ASSERT(nid < MAX_NUMNODES && node_data[nid].node_spanned_pages);
>> +
>>      return nid;
>>  }
>>  
>> @@ -102,6 +106,15 @@ extern bool numa_update_node_memblks(nod
>>                                       paddr_t start, paddr_t size, bool hotplug);
>>  extern void numa_set_processor_nodes_parsed(nodeid_t node);
>>  
>> +#else
>> +
>> +static inline nodeid_t __attribute_pure__ mfn_to_nid(mfn_t mfn)
>> +{
>> +    return 0;
>> +}
> 
> pure is useless on a stub like this, whereas its false on the non-stub
> form (uses several non-const variables) in a way that the compiler can
> prove (because it's static inline), and will discard.
> 
> As you're modifying both lines anyway, just drop the attribute.

Hmm, yes, I agree for the stub, so I've dropped it there. "Several non-
const variables", however, is only partly true. These are __ro_after_init
and not written anymore once set. Are you sure the compiler will ignore
a "pure" attribute if it finds it (formally) violated? That would be
somewhat odd, as it means differing behavior depending on whether the
same piece of code is in an inline or out-of-line function.

Jan

