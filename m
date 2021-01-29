Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD4930908B
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 00:23:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78584.143014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5d67-0004mQ-U5; Fri, 29 Jan 2021 23:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78584.143014; Fri, 29 Jan 2021 23:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5d67-0004m1-QN; Fri, 29 Jan 2021 23:22:39 +0000
Received: by outflank-mailman (input) for mailman id 78584;
 Fri, 29 Jan 2021 23:22:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDuN=HA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5d66-0004lw-6e
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 23:22:38 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4cf5ac5e-1fc6-478e-bde8-6a3b82a8a7f4;
 Fri, 29 Jan 2021 23:22:36 +0000 (UTC)
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
X-Inumbo-ID: 4cf5ac5e-1fc6-478e-bde8-6a3b82a8a7f4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611962556;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rN52QUG/vnSC1Rk3ZeFIzrNZjfQfTQtZIFBS5Ygg+fI=;
  b=LrtstFotQx9TWxSyPSOrhSLuRj22j6sqz09agyOiQSlpbXGO+h+qiA7p
   Fu/DqnIjzy6SYR0/sJX4kkjSu1SPDMVLnwFwFw3EKK0IJIrBOhdF0VzAm
   6j65vXOskP4FnYrkm+3dVe+fJFBRdfkeqsF+WZOuskKse23oINlz5V0nN
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LcypBY2ms1cwZsp9r5UpLupyBzd2kRXa8EltVAw8HkKuw8HIz1QvstvVLN8PFkFmg71RPyMUeE
 KiIc4K33j+VyK/nKxAhHW0P+6SJkdroIoQDY9rIoJk3gurIFmqY4PN1pC8/c/AUquP2j9pxbWV
 inkZh6i4qvWbRX9anVCXjKt52ViC03YY7MCWmdccUVn9SOuB0iintV1oI/mikmcNAKPYsaUrR/
 Dg5xO0DiZMlf1gLTBQuDOsVeuywBrbnud6QNiBmysJpoTM9dk0IBy0tDR96wHYWP/TgMo0Y0Py
 eSI=
X-SBRS: 5.2
X-MesageID: 36569774
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,386,1602561600"; 
   d="scan'208";a="36569774"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eke2mlhLJj0VbaQBTNwkWm+yGTIyDPaapF8eKkh9jE9pRPB6CmuHqpFFJp4pw4A8tmYDZHkj3rqKO2o2K5Y1JI9HHIBucJOi9Qt3rNKt/dn1lHxD+OxxDKTi8jkXUJmwCrKOApSzD/5jw8etm69MUeiIbewqh4oKZ/H8utt8eyGNzikODvucx96kxF5p1RgszzylEND8d/osfsmQ6+f6lj4OBm7YL9ECeQWEs0f/kEG+I39GNfaGDq0bfCz64GZy538bVnWUJbQMus4x8Q/XBuyBEgmuTZMundaNaOB4Pn5BiAo+dnTpIEqNxttSDIvCq30tfKLGqbUUBRcqmigCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iQJ6DC5JbUpdSrZK2XCjVwldLMtD1Z2rfQeIraRGWU=;
 b=MAYqOq4hBcWFT/Usz1DPSV20Ke6MJsmSowee1yYZ59jo7N80Cg1vjdLAXmGGpzaIzcEUPdzBbQgSvYuTHFm6WrC2VwyoXf/rJsLTVEZWc/dtMx4LfH68ogFyD37xPnqjX5D54Nh44UvksSrILdk3QmUSIS10Z7E4Se2KMM7mqteM3r6+sK5k/oH/DVLDMaXkW18ilAYs8nE4q7XYyVvM82yo8hvPzlOMpwMbNT/9IQQ8dfJu+BG3roKgyN7tr35zmb3SuO+Ob7SZBNrGHqJOJlNuamhilabb8OrUi/WVFYYRlTY5HtBhJDWrF9XonQkt5dSOKuRVqKMeMeZadFhwEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iQJ6DC5JbUpdSrZK2XCjVwldLMtD1Z2rfQeIraRGWU=;
 b=hOVwsGqdN9nUYWs4z44kdlgrkJp8UwdhlKyK86SvjpJVrgb2kiHqpHv+YhSHjPcd5Nd2dFqe7hv5HwfEa0wy1E0gWlDqcASzI/rm7vDbszLkhYVkqhyjw0jErEN8yr1vX+uZfuLRCja0iQbLbI19CJMbhcFSH8a4arTZnLRJ2DE=
Subject: Re: [PATCH v7 10/10] x86/vm_event: Carry Processor Trace buffer
 offset in vm_event
To: Jan Beulich <jbeulich@suse.com>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
	<michal.leszczynski@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-11-andrew.cooper3@citrix.com>
 <c00b60c5-ba4a-7473-cf26-60b46681279a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0a34175c-9bc1-9449-413b-01d743d201fc@citrix.com>
Date: Fri, 29 Jan 2021 23:22:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <c00b60c5-ba4a-7473-cf26-60b46681279a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0345.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::21) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6acd0717-8942-4846-e963-08d8c4acc178
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5904:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB59041920F84F4D503340C77CBAB99@SJ0PR03MB5904.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vhw4HJtq/ZnAGctVoaLQPlH1VFH9De4OSIlT92Pe7sdtua9poGpi8WywOyzReg+ew0deZ8RB0a6ne2iR+a6HWNS2E0rEE5BVjosvBJy+fqmNUbfTJiRRVLFQPgi/XJXrrUgxAsgA8vIAma+u2TlAwamznx0bRUHrjyfcm2hxBOFkOy7o10Er1clbakoOO3LcO0/1uJHMcRAU+c8GMeHqRBE+LKFokLZv0mknkAnVwDVABPdwr5y1v+yCFrh/tbbs2iXPGkMS84w2/cuNkBC2dqp2xy81L+3HDuEE6sLq9u5TZNrg8lNENje04SWK2GKYnBguoGmn9dOoYKauts1pc4e6nAXexKBV5znQE3FQMpdv7l6DUImihWqporw7B3wTV8waRQ1QKA/KenyMTWsP7RozFBklwWE2rTAhCozfJpJz8xIV+JrrxI+9pHRFEQAHFDk4j72PbAbK0/fY27d2T2zAo7pk8HNRabIvyPxAF7YFyZQ/RPCpgRCyGwMop4vLhOjaham4+TxaIZpQasntnrie9AFfsOMToREY4KlVCRr4/C8EvUJWc+JxhNWgocHikGlVMo5YfpSwBO6Yn8GrrzAe4UBC3rIruaGpD9PauHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(16526019)(186003)(6666004)(2616005)(86362001)(36756003)(6486002)(956004)(31696002)(83380400001)(66556008)(53546011)(31686004)(16576012)(54906003)(8676002)(2906002)(66476007)(8936002)(66946007)(478600001)(316002)(6916009)(4326008)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?anlCdEJqQ3BTYzNUQVNmZDUwWStuUE5BbjFSdis1ZVRJQW5FYi9wN0d0aDhK?=
 =?utf-8?B?MllpbE5VT01sUlhJSWxFSzY3cnlmOGE2cVNmYUFzckxkZUM4bzUzSCtGL0Fx?=
 =?utf-8?B?NzAzSktzVXMrc3NGSy9mcEd1dkE0bHhzSjd0SFZSNzkvRlJxZ2V2M2dhVEgv?=
 =?utf-8?B?WGRnZVNyRGpZOE1odnNtQkxLRnFxaEVDWnpMeEsrOVowN3VQNC84RWdIVFZD?=
 =?utf-8?B?SEVVYkxuNmZTZC9wQW5teGMyOGlUVDc2aXZLNlczNTAwbFp4N28zZngzd0Rh?=
 =?utf-8?B?RlZtUGIrUGlMRktlWjVaak4zbUVVdmR4MUZZbi8rZ2dCMGFJcGdpUkNiMEFG?=
 =?utf-8?B?VHVZRTdXMk5malc5eFpPSU5xdG5IMXRpRklaM2RWL0dacE9VOWhVTlJwS1FJ?=
 =?utf-8?B?d29hU3R6dWtsYU9ZWVJDS0F1Q1pMcElmOEJzTGRqVGlnL0pEbjBSZWRNTi9a?=
 =?utf-8?B?Y3FHTmtyQ3BwRG12NkVaak1NR3k1aVMvV0tUNDN3OXY5OHJwanMrS2FwR3Y2?=
 =?utf-8?B?QVc1Z25lVTJkODBpNitzQUtUMXU2WGpWYTJ6NmszVUZ1eDBya3J6MEMzNy9Z?=
 =?utf-8?B?RjJTSkliK1NsRkwwSDUrb3NFVUxyNlpxeDJMcFVIU0h0a01IUUxYSlMvbit1?=
 =?utf-8?B?NGxUbVdHMGdBZ1JlOHExUXdad3hOTVV0TnpMV2VUY2IzUm0wTFZzQmlXbXdC?=
 =?utf-8?B?SXAvdW5yT3B5cVIyVGZBVlNBVzlIK0VsRFdiSGp3ZTlhUjd5eE56K1NnQVhT?=
 =?utf-8?B?YTc5azdxNVlveCsvcW1EUExaZFZZM2hxWTI1QjBRb2w0dHFJcDdEYlRnWUw1?=
 =?utf-8?B?OUMreUhDV2hiVENSdysvTWtlMDdzV3NqeCtJY2pWOE1MNVNUOVY4cnRDNDg4?=
 =?utf-8?B?U2hja2RRRmFSeFBSWXh6YjAvSzRWUHNLSG9yVTBXM3g4K2YzbWVkaTRhRlRY?=
 =?utf-8?B?T0daY1IxZ2RZZy9BVjVKZHY3ek9OUnc1OTE0Q1liczZ1Zkl6c041N3JFZFY2?=
 =?utf-8?B?S3ArdWdjQlVtVFlkc1ptUENQdlVZN2x4TjMrVmlIemt2OGJCeFZzcjd1UUd0?=
 =?utf-8?B?VEdsL3ZYUzVob1ZVS3c5YjRLN3JQeU56dTl4MUZwYTZicGMzRzFWVFN0UHVy?=
 =?utf-8?B?TkxXZlMxVkRoY0M4RzNlU05WdzBBa2w4RjlQWmM4YmRFTzhXVE9wbHp1REx3?=
 =?utf-8?B?YlNxYm5rY2IyZlhkUFBkVTJ0OTd3K3RGWHNBOUdHV2JLd3F5ZWdoL24vU0Nj?=
 =?utf-8?B?NDdJZVVMbEpOdlR2V3ByUmx5dkFtWkQyWSt1dDg4OUpmcHZjSy83UzdVRGR5?=
 =?utf-8?B?c2FjL0RBSitLNjNKSVR1SFh6QUlSUXJUeUpBYyswVm5Zcmd5ZXI4eS8wT2oz?=
 =?utf-8?B?UUFER2dreTZxa3J4YmpKdGM1aC95RjZJK2dDUnF3UllVUGhsVytKa1FVeGVL?=
 =?utf-8?B?Y1JObnNjRTJjN21RNTZrazRkdEFBd3Z1LzRvMDlnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acd0717-8942-4846-e963-08d8c4acc178
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 23:22:33.4189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8Lv62J1BvjR1n5TLE8oeEwv85Uq5t6gMA8evaW0kTba5mwyFLFy3zu/qXOK87MwNGzR+Ttr18MtYQUaB4BO41wjI6/oxlE5MbvOmE+cYOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5904
X-OriginatorOrg: citrix.com

On 26/01/2021 14:27, Jan Beulich wrote:
> On 21.01.2021 22:27, Andrew Cooper wrote:
>> --- a/xen/arch/x86/vm_event.c
>> +++ b/xen/arch/x86/vm_event.c
>> @@ -251,6 +251,9 @@ void vm_event_fill_regs(vm_event_request_t *req)
>>  
>>      req->data.regs.x86.shadow_gs = ctxt.shadow_gs;
>>      req->data.regs.x86.dr6 = ctxt.dr6;
>> +
>> +    if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.pt_offset) != 1 )
>> +        req->data.regs.x86.pt_offset = ~0;
> Ah. (Regarding my earlier question about this returning -errno or
> boolean).
>
>> --- a/xen/include/public/vm_event.h
>> +++ b/xen/include/public/vm_event.h
>> @@ -223,6 +223,12 @@ struct vm_event_regs_x86 {
>>       */
>>      uint64_t npt_base;
>>  
>> +    /*
>> +     * Current offset in the Processor Trace buffer. For Intel Processor Trace
>> +     * this is MSR_RTIT_OUTPUT_MASK. Set to ~0 if no Processor Trace is active.
>> +     */
>> +    uint64_t pt_offset;
> According to vmtrace_output_position() the value is only one half
> of what the named MSR contains. Perhaps "... this is from MSR_..."?
> Not sure whether, despite this, there still is a reason to have
> this 64-bit wide.

This is a vestigial remnant which escaped the "use vmtrace uniformly" work.

It should match the domctl_vmtrace_output_position() format, so each
interface gives the same content for the attempted-platform-neutral version.

~Andrew

