Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 764A56E465C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 13:26:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522005.811098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poN02-0001DJ-GE; Mon, 17 Apr 2023 11:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522005.811098; Mon, 17 Apr 2023 11:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poN02-0001AO-DK; Mon, 17 Apr 2023 11:26:22 +0000
Received: by outflank-mailman (input) for mailman id 522005;
 Mon, 17 Apr 2023 11:26:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poN00-0001AE-LK
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 11:26:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac367e3c-dd12-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 13:26:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9264.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 11:26:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 11:26:16 +0000
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
X-Inumbo-ID: ac367e3c-dd12-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CikCacH62Gazd2DTsqVfGIT1TJc7y5w4nq3qaF4ztU6HNGUtt7rkVV4+u8kKuGIjyq57b53sPt3NLfEtR7cbvbvzxqEdbkJOZY+74YN+Ly2GYzruuhJPdIPZb/HByiIjum7hpzCsUR3ggPVQHa+LjG5MoZawulydm4iyCoQSLLH+7lWALZbS5ZFymflAHYTGib0WArORUvykMACO8HA6sVtqzmezq8MPGaEptH8ze+aJAvUpvPhjkHpHNcoaxu5KOBXIJ2+Nd8m64INhsakRfvB5dtblF1VhrDfVRxGjTUZtvOXuThdZZbBbXY0bGU7J9QvBB+hMc+/PaOmCZR/FnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSp8JAdbD6alqZx8DC6iHdRefLG+btm9pOyUQkSTXUI=;
 b=hpPZP+DWVsJGXjLfaZSFWxqn6KhnpboytYM7L+C7iALzszRZ8o0qzmfg2KTKWhBLRiUQgIOm8SlvMJWbSrON3121AfhSuZRtUgqhfEfgV6hsXJt3tynhsCMHOAP6dIsgCOCeIvhF8V3q8j4euzXel500zxRPhE0fX7LEo0pmQc66P7c7tCajXrjXK4GpUdibx86+NDLoQLEou5nlbLUDiTf2Od7tWVxOxIXqJC/JTQ1nm6tqLprjl9GA1Xdx4JIsZXjb5wb29u6NoWnFWZDGHk7JM+o5yCEYLHFVTNqzO65o2SN3x6Fn4ZHVoUTyH0Y/RG1PWI9nTIZsSrfPLdAlRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSp8JAdbD6alqZx8DC6iHdRefLG+btm9pOyUQkSTXUI=;
 b=b/8v+TZlVuWptQNz1ZNOB8wHs4l6DnJlk2FNWh8kg12u3GoY9ad+wMmHWx94arAoYez9OMD+4yueSdqy5GvwQWyYdSGxnFVrIzp3TWGxKKzj6UC1p5cIfMUwoEFT7CnfGx2/M6H+OlQsa0m54ZBQk59i+jD8LuoP9+0e0nZCJ6MJZIKmL2w1NLzy4E8ZoJERn8JapI3WhWE4HwSQjrlistsKhLuLnqLsRQ0D/wB7lnFHWW7rro48z5KlpsM8EwfWm96sfjEW79E5vvhuCkDG0fFIKw5nd1CiffZGzuEeCPZB7cn9z/lFAWVmtNGV8rtCeaU8J8z2WwNwtNGaDl8xNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b164d8d-e09e-b1b7-9d5d-7c7fe2fd0702@suse.com>
Date: Mon, 17 Apr 2023 13:26:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 5/9] x86emul: re-use new stub_exn field in state structure
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
 <a9c212a8-8c63-91e0-eb07-8c927b62c1ca@suse.com>
 <197c2d8a-0a41-da10-771a-87843c9a007d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <197c2d8a-0a41-da10-771a-87843c9a007d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b6b284-ebc9-4de5-377f-08db3f368f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2ZYVAjExWfBSkgJguTVECm46PJQYR1Z56E8R7pffuyXfb7st0N8urz96wr0Vs0DJAUveD5sPShn/mCe9QiZqaV/OTMOLAew2cc3FMqRYCZ5T8H5U3FxOWu85U5xwk1RE9wVHykv9QjD0EwUMPF5JeQBTaBMonR+iIP82egxNSgyGtyQwidI+wXtmnlC+6GqnH/3QpBa0KvTjn/nypjPJK9ocMhkjk1Ns81CQfMBXHf2qf5Vpz5ywHEua6r6777W2lVzuDKpDYWJzUBKHT5jdfVvHSRizVuxLGICF4Hp1HpzVNH/nQjud6t5bL5sdQqJHP9XR3U4hU/dwvA6CtVnw3qPD1/Z8dqlwUaGcuCavui6n11JNUNT7SMY0aaUlDPRoi4lD/NmyJ+76NIomF0Fl8gsK21NMVwuE4EU9iCkbSTusEvB0BCHMh55cs5KCZhsUgSZ0db66B0/bxBfYaGA/lrNMcU4vq5n3UQ4/avJ9YrPfXBYg+YyngV2Xa+uxcXEKPkTuFMWYgaSo+slJZCAumJAsSJcSEhdmgUHOiJl/Pw3E6AIla1wfxTfvARrtMhCnmeUH13+xzAKnJ8b1B4CQgbPDKPHOkEUslN+1iDuYROzEDaLXHzj4TLsktj4VP1/vbtGeS4qVsGsKh8ZNbNbSTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199021)(54906003)(2616005)(53546011)(6512007)(26005)(6506007)(31686004)(478600001)(66946007)(66476007)(66556008)(83380400001)(316002)(6486002)(186003)(6916009)(4326008)(8676002)(8936002)(41300700001)(5660300002)(2906002)(36756003)(31696002)(38100700002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnNraVNTd0FTVDJ4cURnREg5NmFpTDFtUnlteFM0UnZoKytCYjNyZHk3MFZL?=
 =?utf-8?B?RW4vWjF6cCtNT1Z1NGxEQzUzaE9ud0dLY1g1Z2pualJPQlFyaGpEMjd4OG1S?=
 =?utf-8?B?dTIvSUREOUtTZUpla2wxZkJLOU1vT04xOVpQZ3F3YmVJR2k4TUhuUjFsNWVa?=
 =?utf-8?B?UUkzckI1bnRnUWlVQmRMU2VjdmZqSGM0SElvL09DQkdCdWRDcTdXT3RaTEty?=
 =?utf-8?B?SU02ZTNRL2g1KzhVNFdOSWNqSURTd2lMT2NpNWUyT092WUlTWHJ5R3N5d2dz?=
 =?utf-8?B?SndWcnJiTDFGSkJSZnhUWnBDVFBBRVFCQ0sxZ0MzZ2tuUzFSNStBRjJ4QzQ3?=
 =?utf-8?B?OFJSTDlEbUNEbG1KaHF2aHNZM3ZxOUloZXNoNzlnRkxaN2JqSkhKNHRleGRv?=
 =?utf-8?B?VFJPakg1Nm5uNzdkdHdKMlNlOC94SjdMSkJXOG9XUis2clFuZmhXdnI1T0hT?=
 =?utf-8?B?Y2hmZERDbzdlSjhXVjdDVENtSVRuMlVkT1FVV3JTVDNXc1JXV2JrVElySG14?=
 =?utf-8?B?Y1NtQ2hHd3l2VVoyWGdTNzFkOGd2R2lyRnJrVUdUWFlGWmYwQ3pYVStGeFh6?=
 =?utf-8?B?VTl4eFJmTW1sTTc0cmpreGxEWnVKQkhIS0JDSitMbmllNUZ2MEZTUHYrZ0FT?=
 =?utf-8?B?SkN5aTIwNzUzaUptUy9Rc01vQXY1RjlxNDdQcWc3UE5aa2NWREYyQ2pEMWtr?=
 =?utf-8?B?b0dxM3V0akFaWkZtS3NmRjlNN0NqMkthN01EWHRGYnQ0ek9LNHN6ZTJXMGpk?=
 =?utf-8?B?STRDYnlkcWN6MEFPMzBscytRK0c3dVNsNEtXRURCbDVPWU9hdTRZS1VWY0tL?=
 =?utf-8?B?VEZ4ZzloWnpFR2ZSMnBBUTg1RFVnbVFiNjlRK0JEYkkwekFMcE1hSkhvcWV3?=
 =?utf-8?B?bzJpQ01aY1gwaVZHVFFtelY4ZC9MWUp0R2pQbmZPQ1lqNyt2SUpVMWE2ai8y?=
 =?utf-8?B?R0RRM1I5Vit6RWZVMURyaE8zR2xTYkZ4Uk9wSWxpOG1VbFJsWTJ4VjdYSGo2?=
 =?utf-8?B?Z0hVajY4R05SYXRWelpKNmNtb3lybSt2MXRzakJMMmRFOWVwTXluZGVjNTNl?=
 =?utf-8?B?akdRdFd5Yk5qWHhtUDh6eEtIdmZYTm9odHpnWGhKMkc3VXR5NXRmWHJwRExl?=
 =?utf-8?B?WGZOWEZ1bExYVlhmR012M1N2aUgyN0NOb3dmRFY5R3FoV3hidlRkbjdWQXlp?=
 =?utf-8?B?Uk4rWk5WU0ZMMXJETzFweFlGeldHNEVjR0NNSlFOSGxzOW1Bb3IwcWdZTCtV?=
 =?utf-8?B?cWI4R2c5VWViamV2VXREQ3ZkZWtlbDY5M3dEU0ZHaFNMNS94UXJKa2hTZ0Nx?=
 =?utf-8?B?ckFHcVFJMUU0eDR6dlNTYnBPSFhpUDMvdHJVckZneDFLL0kybDJEQ0JVVHFr?=
 =?utf-8?B?Y05tL0lURDlKSldKVjNUSkNlajAvRVBRbi80eWg4MDl0YWdwUVJuallGZ3JE?=
 =?utf-8?B?ZlNhR3ZZU2Z4UWRncHFEK1g0MzBVQUNVTEJDWS9GWk4wZTZYZXEwK21xYkxu?=
 =?utf-8?B?N2NUZmJOMHcvK0xiSkwvZFB2MXVyMW1sSXFqNFdlM3pSNWNqbHpva0dzM2sw?=
 =?utf-8?B?SUgxelpGU0hJOGRUMDZFN1QyQUJjaDBOL015V1hBVW4yWC95NTZXb0NWMVhW?=
 =?utf-8?B?Tm5iMkpUeVo5b1YySlh4S0ZSYmdFUmVNU0dZZEdET3lHYWhhR1BBWTh2TC9M?=
 =?utf-8?B?dG1XZjI2SXBMSzJRY2hKdStweGZEbzNTWmdpazZURlVXN1FnVmMrR3RieTFS?=
 =?utf-8?B?ejJJODJMU2FTVlVFc3RGSGtuSXZoMEdzRkVTOXB2Yms2a211a2xJNWUySjEw?=
 =?utf-8?B?SWZOaFQ0dXRpaDNIR053eTBES3FHYUIxMGJzTGEwbXlPd2pFTVA4ZHlOdXN2?=
 =?utf-8?B?U1J1cWZ3bVJIdnFLRUx0bmNSbjJucFJVMmI2anJ6UU8rOGNvUXlST2JkdWZy?=
 =?utf-8?B?UGxhVFdZYWFTbzdSdEEyc0lib29UZnhGaHVJY3UyNjlCNXlLVmJuRnNSK0t4?=
 =?utf-8?B?enEvUlpIamFXamtCOStPbWxYaDV1VG5CYmgwZEFvbS9CbC9WQTVMMlhKN2Fa?=
 =?utf-8?B?MkxoTEpYM2FxMVo0WFZnYjRaV3VGQWNvVFlCdCtMYk9kQU8wZG1pSzBZcVBL?=
 =?utf-8?Q?/5R3YXrZL/9hkR3cmc2w8tNOp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b6b284-ebc9-4de5-377f-08db3f368f05
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 11:26:16.4803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /EDSadHpbFJAwdHOD9YwfqkN6hsECHCRAjXygc00HePJ2/PaNYreolrRPXbYYWIbKgOFgpz3yDCIJNCoSdB3/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9264

On 06.04.2023 21:48, Andrew Cooper wrote:
> On 04/04/2023 3:53 pm, Jan Beulich wrote:
>> This can now also be used to reduce the number of parameters
>> x86emul_fpu() needs to take.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> As said in the previous patch, I think this patch wants reordering
> forwards and picking up the addition into state.
> 
> "Because we're going to need it in another hook, and it simplifies an
> existing one" is a perfectly fine justification in isolation.

As said there, I'll do that.

> With that done, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>,

Thanks.

> although...> 
>> ---
>> We could of course set the struct field once early in x86_emulate(), but
>> for now I think we're better off leaving it as NULL where not actually
>> needed.
> 
> Do we gain anything useful from not doing it once?  it's certainly more
> to remember, and more code overall, to assign when needed.

Right, that's why I did add the remark. In harness and fuzzer we'll be
able to catch stray uses of the field if we keep it at NULL. Actually
if we were to always set the pointer, perhaps it wouldn't make sense
to have a pointer in struct x86_emulate_state in the first place, but
then we'd better put the struct itself there.

>> --- a/xen/arch/x86/x86_emulate/fpu.c
>> +++ b/xen/arch/x86/x86_emulate/fpu.c
>> @@ -90,9 +90,8 @@ int x86emul_fpu(struct x86_emulate_state
>>                  unsigned int *insn_bytes,
>>                  enum x86_emulate_fpu_type *fpu_type,
>>  #define fpu_type (*fpu_type) /* for get_fpu() */
>> -                struct stub_exn *stub_exn,
>> -#define stub_exn (*stub_exn) /* for invoke_stub() */
>>                  mmval_t *mmvalp)
>> +#define stub_exn (*s->stub_exn) /* for invoke_stub() */
> 
> ... honestly, I'd really like to see these macros purged.
> 
> I know the general style was done like this to avoid code churn, but
> hiding indirection is a very rude thing to do, and none of these are
> usefully shortening the expressions they replace.

Right, getting rid of those is certainly on my radar. But it'll be
further code-churn-ish changes in an area where history tells me
things often take long to get in (and hence there may be measurable
re-basing effort in the meantime).

> Also, putting stub_exn in the K&R type space is still weird to read.

What's K&R-ish there?

Jan

