Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 448366276E4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 08:59:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443145.697613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouUMT-0006nZ-Hc; Mon, 14 Nov 2022 07:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443145.697613; Mon, 14 Nov 2022 07:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouUMT-0006kr-Eb; Mon, 14 Nov 2022 07:58:33 +0000
Received: by outflank-mailman (input) for mailman id 443145;
 Mon, 14 Nov 2022 07:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ouUMR-0006kj-Ha
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 07:58:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20849254-63f2-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 08:58:30 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM9PR04MB8356.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Mon, 14 Nov
 2022 07:58:28 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 07:58:28 +0000
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
X-Inumbo-ID: 20849254-63f2-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aU9RsyA4N/4EilHcStXHrLp05X+g+Y5uEbEHhlTg0YjuugdmKHWdMOuINem+Qb/z/pJMTZJ0te6IXEBVzfvmn2/XdENKczvaKCCrn8Lh5wx11CTF5gGkw+Uo12psl5YhR4GBHLC8WdZsDlFRn9pfYgOeI6+diw/tWwj278vo0qDgfjssz+VyfJnzbAKatWy+pBtDid8KR1uBsQyr4oUgfttrSOx7HeVYXpDqivkstr+gfnHvSxnzxBxdnk4qr/K+DuxCyleXz7wJo8QQ5rRz1H0vkRHJVRqb7ETuJbgbaDKXmprnJuRGhiZMhrcJv0nBGQH4X+LeCUcooraYMPqNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nz+m1dnv0aD4k84yhtrbB9jb2qGDUFOyLj/d3nJlj3Y=;
 b=hl9wUhbZF5Ca3I4j3nQvrZ90FMRLnBc4qpXyXqE00t797guQ3O0eqY1SqtZFxL9BIt5Z229lCQWEYVKQMnmjkbRUKhXivS0C2XVHrnuJTg6tDMfI6HbZLnh3XeaNuZ9Y4vdtTV2ugK/3dBfwGuRVabkVpsyZZgrK4oFgbZOvxXz4hxv8DmB3lsWsCt/ulz/DIrqf+rnr2tY3Ir9HqX+kqwQlrmvOTsIK/zxDI7TA6HbBglSOJUwVCU9BQ/oXuyVTwiVRUNqTnrw1wRyxJZ38ZF0ZfZ2tC7m9o0ulmQRO39ESNljQrVxoym8ehj6ONzdQFgFQVzajc8SroztZm/m5sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nz+m1dnv0aD4k84yhtrbB9jb2qGDUFOyLj/d3nJlj3Y=;
 b=mk00cjjpH0js10VasOhgWt5U9h8bOFAHKg1caabGyjbsJhJnevZkOM1BGWlckHX2fiT1pJzjsmZxEOMn3W8opUuC2Tlq55OJ2Ux2r3YSHaCtbqNHAaSfz4k/Aqq8YU9PHuDYp02Wm+WK8wrXZzI4J+zW72a+ympu2UxM80/pBef8ZAXsA3pZJM4m/jhT/onYXJxnJxtshuRWoyLzD9LoeaqTgYQTr+MSfMwmUclcRUjrgFPapwq+OAoDCqLNMs2aMr4jOuqlEPIQP8p2mzmHYe1WMnQCe3T5oaJFbWyEVJOAx08Qpb2U8fDxoTWrqGGGNuqxBdScbTDojEWW5WEa3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ff66af70-4b50-5f54-a1a4-c4a1950464a3@suse.com>
Date: Mon, 14 Nov 2022 08:58:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the APIC
 assist options
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221104161815.38007-1-roger.pau@citrix.com>
 <69841767-ccc4-5eeb-6e9c-d59dfb197ea5@citrix.com>
 <8e52a065-0141-f75c-03e8-e9ceb18a0aa1@suse.com>
 <4d0edf44-bb7c-85d9-0890-79c999428ef6@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4d0edf44-bb7c-85d9-0890-79c999428ef6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0035.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::48) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM9PR04MB8356:EE_
X-MS-Office365-Filtering-Correlation-Id: e5342b64-7bbe-4e0d-84d7-08dac616037c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7JlmAOBlF7o3R+K3g7hI+zutnFsEtlkVyKqHT4n1BPI/UBpX9P/8P//LxR47J9jpIfuX1Ky6I5ApkwnBYZJk/ry1CoFenZkcK/iJFEYeHYg48XSh51QG4+ag2lEwHYeOgsymrKjZEgPLwWcAi5b968Sk31xlQE5VGNQR3D48fs975MgHgyPGwaCXJN1GeiRR3XWjdhYzj84jamSP38InV69V7STGZWJ2YJLw7xUAFe/19PTEnZ6/BRgGjyYo1oelEONrrOySZF37ye5oGNGvV1pPEuaCoqL25n3ps8vK6R6mDSMgXmT4YvQZZR/FNpYswb4swh+8J3iA6BmU4jcKm7mC89+DC+9fMsauo10vz4HVuQEca270LChFQA0TWdyvMydmli5LP89RGz0fGyI6qSu7hRigmVrdhI9vugzhkStuR9msRjK5hjDVd/9MEINWbLEAmRrF93HL1EDwJg5sZJxvrR6OmRohIFmFtNgPtBI/VzmnrhBvKfqtryzCU0CP0xr0I2IMuO7FhPOFxVSzlUz+9k04RJeHgkBxulibnVWCfImN5cFr7WWvyADenKO/fcoksSBZP9UUFCVZeoc35TzTnsS1mRRaIakuDuE/ElhKp8iKlzXnsoy1eLjK/3JD+GTAeBWq6BwxFe5rLWpkhgOlajHBCAHQ0MEA/uw+EIXVd9SoSzTo+Kok5ILs6YQMikkOGFznU9oFS34x68/DA7DKu1uKQ8gr7DdmM0yPbnxT/5ljn11SNMDquuBJQeX44w2hb99LuV1DiT0U9yladvfJXoGvodeZ0xZrdxyz604=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199015)(38100700002)(2616005)(6506007)(31696002)(86362001)(53546011)(186003)(6512007)(26005)(6916009)(54906003)(66476007)(66556008)(316002)(6486002)(8676002)(478600001)(4326008)(41300700001)(2906002)(5660300002)(83380400001)(36756003)(66946007)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFRPQWl0aUQ0eCt6YlVtT1BmY3dOcC9ud05kQnVFenM2MUZ4b21nSTZxMjN1?=
 =?utf-8?B?TDMyVUEzcUZCNE94YU52T0xUckVoMXRLdldyMTJQQ2JjRjRteEo0cGRKNGwy?=
 =?utf-8?B?SEFyY29vRXlEbkZNRXVwakpuOTNpdDRlQjYzM05aUTh0VEEvVm54WlAxRFJP?=
 =?utf-8?B?eXlRdTYrL2xwZGducnpwRC93bE0zNEFXL3M2c0VKcGRLdTgzNDV0K3ZkLy83?=
 =?utf-8?B?dEVWeXFKZVEwNXpmRTZuMXhVTFdFQzBsVldyVk0xdFk4d3B1cVhRbEgxeThU?=
 =?utf-8?B?T2t6S1R5NExiNWQvNFlCMDVEVUxCN2paeFFBa1laWlA4MXhMSGxPQ3JndGZl?=
 =?utf-8?B?clRLUXJFc3ZxOFNXUWsvUjJwa2tMQTlQS002TVdjd2NMaWR6cGtHNVRJd3B6?=
 =?utf-8?B?TUJEckhiK2g2TjlSL1hhcngzTUdEZnRvUW9qTjdaZXVwSkFzK3luU1FjN0RV?=
 =?utf-8?B?bWFOQm5QdjRzRGZNVlo4YnVLemE5cDdaRVpxc2xJTzYwV0tOTmJHTmpOMlZa?=
 =?utf-8?B?M2E5SS9McEIwb2xmeUU0VEFZdGhVSFBzVFZib2Fsb1gzMHR4M3BFOWliNldN?=
 =?utf-8?B?a2tUTGxKTEdYeTZvU1dNR2tIVzBPaHJ3U1NQaDlyaE1VNDFRQTZsVGdrWW5z?=
 =?utf-8?B?c0RVRndpYzBzVDVzOFNreTdPS2pvdHZTSHpXdElLZlBiajd0NE02eGdFL1Yx?=
 =?utf-8?B?Yjc3YkZQM2tFYkxtMzZ0ZHVNcXE1S1Arb1NwRjB5RXV1MW5BVktQVEIwamJ3?=
 =?utf-8?B?cDBVVkxVVDRoOTUzbzZITGxYMmo4MEphdVFFNzR0cFRBMHNoMlQ5NTlJMkxk?=
 =?utf-8?B?WFNBWUM3TWM2TUxHT3ZzY3Q2K1MxZS9hRE5qMnZLWjZvdXFvRERoc211eVBz?=
 =?utf-8?B?NXltNy9ldGJqeThmV1VLZG9SRGdoMGdUWld5TTNFcWNrSjJNVlNKb0d4Y0pI?=
 =?utf-8?B?cFQ1R3I0cDdidWZ6eU1FVmNHY3ZIV2lPQ1hZK0tvVFg1Rm5IbDRyMDFmSHJ1?=
 =?utf-8?B?bkM5K1B0Wk1iMS9oVkpieXZFMTdMV20xM0o2RjlYRit0ejRGYVRhZ1NlTlNI?=
 =?utf-8?B?ZmppVUFHZDNjOFR6SnRkQy9DOE02SEtpdlVFZnFzdkE0aEk1NllxVElkRE5F?=
 =?utf-8?B?YmFNUFc5R0t3RlV6MkNXWkNydk4wZ1ljTHcyc2VQenE1K2RVY01WNnZDNkc3?=
 =?utf-8?B?aDVrRUxaUDFrMzFMOEZRNTJDbUxGbTJUOXBSRmJpSGlHWnpqMHdLN1Ria3NG?=
 =?utf-8?B?SEVpa2h3cUd1QlR0djZDMnRFUno0QkExajg1NEp0U3FmZUwvais4bytmUFF4?=
 =?utf-8?B?QVplYnJ2eUlsa1ZUSzErMmJaeXkvaXdHUTdRc0FITVMvbUdxMTE1VG84OHIx?=
 =?utf-8?B?OUVxbSt2eHUyeU15SjBOSXRCd0o1VWEzbFMxRlRTdU1TYXJYcStFSTlkTGh0?=
 =?utf-8?B?UVk5TmEvNkFha0o3WitVU1hyWWFQSVl4RkNqZUQzbEorREpLdlErSTVTcDdY?=
 =?utf-8?B?MFkvREV6MjFHQ1Z5QmM4bzFXRWQydDJHa3BTeHVNUHUzM3N5QzAvSXFYQ0Y4?=
 =?utf-8?B?ZjdpQk5BNTZXYlpRcm1UL0ZncXg0MjJDYlZjQkRBMi9rZzdhcDFiSkxhakgv?=
 =?utf-8?B?a29WMll5TFdhMjRwSVVGMmEwRzM4YjVlVzBqck1XdlJDZkRCUjZMVTFCMkhp?=
 =?utf-8?B?NEtLVUNpcTB6RW5XWDZJbnpDby96WnBzRXpGUXk5UFdYSnk4cTIzU1VTbmk1?=
 =?utf-8?B?UmtWWmhOR3U1WllkdTNqbjcvSy91Y0JPYktQeENZaC9yWmVjOHVyUk90aHlj?=
 =?utf-8?B?cndjUGp1Qkp0UjU3eXd4MitCOUdMTWFTNTdmRUQwUWlVSi9YMDJ0TzQ4eTdo?=
 =?utf-8?B?RlRoWm5CNTlYNStJN0RQS3lKa2VyZnhlUTJjTFpqUFQyVTVhRlk2L293S1o4?=
 =?utf-8?B?NXlPT2tSZTZMeUZYL2tuZGlTbjRxRHVaOXczVHRVVnJtL0MzOW9WWHVsclNT?=
 =?utf-8?B?aFplVS95c2JJcTdYM3dQL2p2elM5OGtzWmVQZzJDditkQ1dRY2dOWmg0d0pR?=
 =?utf-8?B?Wjl0c0VxUzdRaTY2NkltM3dEb3pqd3RjWjl5MTlreDAxeG9jbU03Uzk0NUNX?=
 =?utf-8?Q?TM9ppi7W6W2YZLBZg7hGQRnTQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5342b64-7bbe-4e0d-84d7-08dac616037c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 07:58:28.1574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8jn3YDC9V0FfssLeCeOer8qbD7EMYrM0k1eSMfuiDlurGrb8jQVjbMiZDh3tEau16CWfiNv4wdU64azxBmkgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8356

On 11.11.2022 18:35, Andrew Cooper wrote:
> On 11/11/2022 07:45, Jan Beulich wrote:
>> On 10.11.2022 23:47, Andrew Cooper wrote:
>>> On 04/11/2022 16:18, Roger Pau Monne wrote:
>>>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>>>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>>>> @@ -197,7 +197,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>>>>          res->a = CPUID4A_RELAX_TIMER_INT;
>>>>          if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
>>>>              res->a |= CPUID4A_HCALL_REMOTE_TLB_FLUSH;
>>>> -        if ( !cpu_has_vmx_apic_reg_virt )
>>>> +        if ( !has_assisted_xapic(d) )
>>>>              res->a |= CPUID4A_MSR_BASED_APIC;
>>> This check is broken before and after.  It needs to be keyed on
>>> virtualised interrupt delivery, not register acceleration.
>> To me this connection you suggest looks entirely unobvious, so would
>> you mind expanding as to why you're thinking so? The hint to the guest
>> here is related to how it would best access certain registers (aiui),
>> which to me looks orthogonal to how interrupt delivery works.
> 
> I refer you again to the diagram.  (For everyone else on xen-devel, I
> put this together when fixing XSA-412 because Intel's APIC acceleration
> controls are entirely unintuitive.)
> 
> It is "virtual interrupt delivery" which controls EOI/ICR acceleration,
> and not "apic register virtualisation".  There's a decade worth of
> hardware where this logic is an anti-optimsiation, by telling windows to
> use a VMExit-ing mechanism even when microcode would have avoided the
> VMExit.

Okay, I agree that I was mislead by the name of the control. Together
with Paul (re)clarifying what (virtual) MSRs the CPUID hint is about
I agree that it wants to be "virtual interrupt delivery" alone which
is checked here. Which in turn makes this a change orthogonal to the
other APIC assist work.

Jan

