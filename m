Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D0A58F7A3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 08:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384156.619443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM1gt-0006Tg-RV; Thu, 11 Aug 2022 06:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384156.619443; Thu, 11 Aug 2022 06:29:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM1gt-0006Rp-NC; Thu, 11 Aug 2022 06:29:11 +0000
Received: by outflank-mailman (input) for mailman id 384156;
 Thu, 11 Aug 2022 06:29:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM1gs-0006Rj-6D
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 06:29:10 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10089.outbound.protection.outlook.com [40.107.1.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7e847e3-193e-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 08:29:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8054.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 06:29:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 06:29:05 +0000
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
X-Inumbo-ID: e7e847e3-193e-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvSsbKJz22eCETtWL24JfAvvcSxyOk8JL4kGlsKcuJ+OByQKuXVc72uhNzSnKKchKxTsEGn9KAHFdST1Wa/eknn2Lvn8IM/mo5sEgNAh7/O1TYNZv8Fmbu37bsxyiUOgOtO/+CdflNWDIV2OAzIULdeqoMKeXcUXrHW7pPGXd4SdCUCLRIQdD4TlFTiKd3ylvRfOJu53Ryc9sZ3V+Ckgb7UMBl1LGIsRwK9sH63x35/JNmSs22+2fKavFQ85g3oTajRhtgzVuKTCohQj3iaZRhZ6+b/CpLZWaYESZIeQHepRQl8PSU4pRw/56DLVhwn8c7cWCnuqDtivtY75fgWg4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PD97G3tW43BeWkpMob9C62GObN0nHLY5MA10bLLyhik=;
 b=oBJqSFxEaAd5N9Vgnf/gHyYJZMQQijv/5kHt+KiIb6q9/hTJ29+UwW6IZaD5crOEiQI+q+rrCxhkNB0DXFcmtBKNtml+MvemPkfokohFGMmucy7NpOzixJMt0KUpeLNknHjUQoBXUEURA50gw4IeixoqB3u7OAAb13V8+f+kUmar3herSHEWMjMtfELiYTubUR5+smHaOEJ6Jz/uX4AR/k9q17ZdgDYqZgjLX4iPcOge0NgDLg8Gt1HzosGGOmrYkeHOEiRIJWPZJGltDh8XLSIqDF3u5Byp3zXMO/n0b4cmW5U87uFO6naMLw+hqCsGmkUjWF5PYjjsmeQYqPj4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PD97G3tW43BeWkpMob9C62GObN0nHLY5MA10bLLyhik=;
 b=WaglYbvpgXMKoZDaG66SaYjtV09Uoyc8ltoS5Nw/eAuwSG8qv3YR8zRclxv6mCAvwyH4ZkVKjNYKns61Ht2VreAOtWUw+J5lA2Gz/kQhH1q0q2ym8XhuLEKFDhMGUA95/q+yC6ACd4T1mjiM3SvO/RzpNvDLWL0MuvJbVWj31utL87iP9rvJd3Sh1UJIRInzxPzKkuZG9B/7KA3z6IFcZjHQbDZMP2CjsBj2GWAZuSALsvosoRsiaQNfgjysVjimIR8yE54Mc4SgNjIBPCwSg/oFVCSdX9hJ+rvlU+t9Z2tKwXTiJXil7e65ArVdL2Uz34hSeJQwmNNPwT9f/Pcv3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <739b0c8f-b167-259f-6ea2-46bf6ecf691d@suse.com>
Date: Thu, 11 Aug 2022 08:29:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 05/11] x86emul: handle AVX512-FP16 fma-like insns
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <36fadb47-32a2-b06e-4cd3-218635ef8aeb@suse.com>
 <f6ced614-4ade-8993-bcb2-1ea5a0378080@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f6ced614-4ade-8993-bcb2-1ea5a0378080@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48694516-e298-4605-42e0-08da7b62ca59
X-MS-TrafficTypeDiagnostic: AS8PR04MB8054:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5qXHOmGsCT6uk8ooghuGHl+4sYbXskkv0XcnPNFY/dFKAtFNOXGyy2UfWvi/adFGU1wfSdO3hWvlWyee69PfikI34j/zkS0Sl1MOoXjrOLuR1inxR9ygmZC+YziZMNbQlOQGKPTIposB6Wlj9HAFYyVlncCb81EdTqqVkIVlswyPdwHeGwuh24MuebvjOsVG2QxVlKb61SAKqobIIM/r4+qv5vdgWci5rOoEJKuVnLN50paMW8HImgvkvXDdaKizlADAtmNi6mFutecr8m0vEjhX6pkRBAQmAeCqKyHEkjhUtWvStwHuMTW7+zuYxcWx0t0YmaLzXSjEcgo+GMzF4M7AvcI2zsw0fhczcbJriKyPpX1RH/a5BBWGDU65Z77mrw5W2BwRer+a8B7VN56qTuyuMC7vxgMBfo0Pl5faqwlOgLBb+YcVBLmY/RZBnd/OumpWFaFyVdgD3nmy7oorSA8kui9gkezUy/EZM+cDlj2Ajs7Hh1iPFvC/Y/SCJxHv7+LABxiAAZ918MuDD4sMgLqWVGI9d1PZOxLYsqml3RGJRQe7GVWlbmZW57ux0WqvLtZl80foW4GmLiScwBTgQ5gTiplZy+19VDfCyUuZ/oqoBalhvJBGL73T9Q7gBxT/q97KhBbWQjDRa3DgL7a6ZZmd6JYFVd64X8vF3hISfdRbJtO8kH96FIsg5YCMzLR38gI4YLixE0btgqDsj7PvJn/L6xMQxOfzn4tY8jh1HsJ9RUrW+IVwqTlFIBrPIvgF6rs5gnK6Y9t0OQjJ5YLB4FV3IERaO5oT6TnxrxLEMPrFGEHHg9SXGzRV0ZPkCQUrnP4BcgT/VdQ1IYIAXTV2MA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(136003)(396003)(346002)(39860400002)(66556008)(66476007)(4326008)(66946007)(8676002)(316002)(54906003)(6916009)(31696002)(26005)(186003)(86362001)(478600001)(5660300002)(2616005)(6512007)(6486002)(6506007)(8936002)(53546011)(41300700001)(2906002)(38100700002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXZLUkxBcUtCMUVnaVpVSW4rN29MUTlVVjRKK2dPSVR5RXgzbzFhalVIZC9k?=
 =?utf-8?B?ekJudFRmYzB3Tm9yWHlzZ1RHUmM2Nklyd0EwNzBWL0dubTBzaklQOHpHUnRz?=
 =?utf-8?B?VUNuQnRzcDFTTnU0TVgxc0Q1dHI3dlRUcEtmdTZFVncybVdDM0lJYUNkdjZr?=
 =?utf-8?B?K2NtbkY3TG1idHJ6Q0lOQU5XVnJSazgrMXNKT2JERDBXVW4zTmxEalVIUTV4?=
 =?utf-8?B?SjFTWTJWNzNmSVhGZzhhVDRHWFdXc2YyRnJ3bXNxWFZNTnBaOVpaTFJYRE9L?=
 =?utf-8?B?cmNDRFYwTWxrSFhIVldEaHFXNDJmMm9uSU5rYUZDVytxemY4RStIOVFlMERO?=
 =?utf-8?B?bkgrZnpZeGthbHMwV0pCTG9oMFZVOE5TSVlOT0xxbC82Y1VoODhoN0czWVpo?=
 =?utf-8?B?VW1ZR01HeFBuTTVQYkQ0Ylhrb2pWa2VhME5DckRCd1JnbVp0TVJkUncycjJC?=
 =?utf-8?B?Q1NyY05zNUZqVTVCbk9mYkYycFZKU2lzdGx4WllnYndZSG9lZVNCTWdXMnRC?=
 =?utf-8?B?dUdpSUV3RHJ4OGdpSERjdVl6T3pwc2NzSEI5c3VHcDRLUFdZNTVydTB3cWdM?=
 =?utf-8?B?SGJqeDE4TkZBK3JWMmhWV2VTNTc4eUdIdGRidWFQdmIwMjZaV3dFZnhXMFdT?=
 =?utf-8?B?Sis4RDd2VWZ5QXE3TENoaXBFd29aWWIxK01pbWhaUzBuSDFPcTg2ejQrcVZB?=
 =?utf-8?B?Z2xqM0d1M2E3dTJwNkU0T3RDTDZjblJVQzJDK0NMOG9xcUs2NjFESTFJWHUx?=
 =?utf-8?B?ajNSRjBjMDVyNWxkUW1GNHJDUWpwSkptdDE1OC9uaC84bVlpdTh2NjdRdDFP?=
 =?utf-8?B?cm9XWDFNNzVPc0FhRnJSR3AwV1lQN0ZQanJ0VEZCNzZTTHZEUkYvcHBzUmFn?=
 =?utf-8?B?ZXNhL2YxSWR0Z3Q1VnIxMzZCNmpNaG5ZR3kvYnNzZDdrT2kvMW43Z3BYdEsv?=
 =?utf-8?B?NVcycjRIOGcwMU50TWpHaVZoR3hzWURDenMvU2lZSy9sYUgzY2o2cm1GdHZM?=
 =?utf-8?B?eDdsM3dYa0s0SXMvTFZjZzBXdWtQbUJaQzY0WUNBZWNWMElmMkhCTHF3UlNI?=
 =?utf-8?B?MXFhTldnTEQvTmV5K2t6SXVYSHNpbjJrTmxXVklTeTBoWUphUXdhWWFLYXFF?=
 =?utf-8?B?RmRNWEs4ME9LTVlnVFlOZjQvWDZrdWZzRERHY01TcXlLVktmbmdUUXlGbkNV?=
 =?utf-8?B?TEhXZUorV0VJWDRLMzV4eCtTVEFicVUwVGdjY1ppK3dzTnFheXVJTzZ3cHpi?=
 =?utf-8?B?alhLV2JreXRMTjdQcE5wZFgySFhZQ0ZGci9UNzIvQjNkZ1JQNVovWlQyRmZY?=
 =?utf-8?B?dzdUT0JFRnVLQm9GWnozR2d1TlVuQVVjRTJ0SW4rcnZLV2NKdVMxYUZxUkxL?=
 =?utf-8?B?dGliRGpqaXVYcXcrS3VaQlY4a1RraitnR3ZwZjMrN2tnWiswVlExUDBKd1dO?=
 =?utf-8?B?OVQyZWV3L1VYdGNtbHdFMFJvUHlncm8rQmZyMkx6ZHN1SVpoc1RFcnJqcWRw?=
 =?utf-8?B?NDhjc3o5T1lVUW90ZGRCU0EzQk5nK1lLSmVrdm9UY25FaEt6VlNrS2o2TllK?=
 =?utf-8?B?VkdOM0xaRUFCUVFRV2NwY0RFRFdsSzAzY0Q2T3FqWnB5N2JNSUtwL1ZQb1BU?=
 =?utf-8?B?SnRBSjlBRjRVbDlrVUppTmtIK2c1djVyb1dtQ3BKZVJBZXdOamtObG0zWThG?=
 =?utf-8?B?NlVwNmlFemJzMlRHK0ZKbU5DTnFSY2JjdUVFeTlrdnNoN2pMRXRHcmtxN1dp?=
 =?utf-8?B?R1JKNWF5dGRpU3lSd04vVGd5QVNjc0Fia1NxOHMxazJvOG4wNU1Cb0RHVlh2?=
 =?utf-8?B?b2QxVzhqRlNuT2Z3T1lwbGg1a1FwZmt3WXBMNG1WbDdRVkhUOHdLanh0NE14?=
 =?utf-8?B?dFN0cHFMQWVPd1FpcERwbUp6MEF5NlFJaU8vQklSTlNwL2JuVTYwOVVVZnpJ?=
 =?utf-8?B?RHNSV1M5dFcyM0VTTEc1b20rdVJPeEF3ZVFuUTJ4REdUbmRrMnJpVS9MUkZ2?=
 =?utf-8?B?THAzZ3Q2elRTMEl0V3lZUTRCQlBJb2IyTm1RdmMxMDJoY3ZqUVI2TGJXbC9n?=
 =?utf-8?B?aVBkdFFOSzliejlTcjAvZ055Y0NDQXRkNy9FUDRGQjUzRnFCc0lXVzl2RmdE?=
 =?utf-8?Q?jua8g/WPaMhryNNzlihgV1fcq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48694516-e298-4605-42e0-08da7b62ca59
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 06:29:05.9299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cZpal2d0P7l0xyeQ/vre9f9r6zG3R8t/HCo63CwxZ3FBlTszTRKUQ1ZC9NWXQoGADr9MUMDuh4XQmOB91fVBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8054

On 10.08.2022 20:14, Andrew Cooper wrote:
> On 15/06/2022 11:28, Jan Beulich wrote:
>> The Map6 encoding space is a very sparse clone of the "0f38" one. Once
>> again re-use that table, as the entries corresponding to invalid opcodes
>> in Map6 are simply benign with simd_size forced to other than simd_none
>> (preventing undue memory reads in SrcMem handling early in
>> x86_emulate()).
> 
> Again, this needs communicating in the code.
> 
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/x86_emulate/decode.c
>> +++ b/xen/arch/x86/x86_emulate/decode.c
>> @@ -1231,6 +1231,16 @@ int x86emul_decode(struct x86_emulate_st
>>                          d = twobyte_table[b].desc;
>>                          s->simd_size = twobyte_table[b].size ?: simd_other;
>>                          break;
>> +
>> +                    case evex_map6:
>> +                        if ( !evex_encoded() )
>> +                        {
>> +                            rc = X86EMUL_UNRECOGNIZED;
>> +                            goto done;
>> +                        }
>> +                        opcode |= MASK_INSR(6, X86EMUL_OPC_EXT_MASK);
>> +                        d = twobyte_table[0x38].desc;
> 
> So the manual says that map spaces 2, 3, 5 and 6 are regular maps (insn
> length doesn't depend on the opcode byte), with map 3 being the only one
> which takes an imm byte.
> 
> I think this means that SrcImm and SrcImmByte will cause x86_decode() to
> get the wrong instruction length.

What SrcImm / SrcImmByte are you talking about here? This twobyte_table[]
entry doesn't have such.

>> @@ -1479,6 +1489,24 @@ int x86emul_decode(struct x86_emulate_st
>>              disp8scale = decode_disp8scale(twobyte_table[b].d8s, s);
>>              break;
>>  
>> +        case ext_map6:
>> +            d = ext0f38_table[b].to_mem ? DstMem | SrcReg
>> +                                        : DstReg | SrcMem;
>> +            if ( ext0f38_table[b].two_op )
>> +                d |= TwoOp;
> 
> ... but here we discard the table desc and construct it from first
> principles.
> 
> Why are we processing it twice?

First of all this follows pre-existing code, where 0F38 is handled in a
similar manner. The primary reason for the two step approach though is
that we want to pick up the ModRM flag here, which the other table
doesn't have. Instead other tables might use its aliases (vSIB only for
now, which - yes - doesn't have a use yet in Map6, but this might
change going forward).

I also wonder why you comment on this here, but you didn't for patch 3,
where you've only asked that I add comments (which of course I will do).

Jan

