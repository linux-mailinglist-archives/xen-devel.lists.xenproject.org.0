Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A45358F779
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 08:13:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384139.619418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM1QK-0004Ki-5m; Thu, 11 Aug 2022 06:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384139.619418; Thu, 11 Aug 2022 06:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM1QK-0004Ig-2t; Thu, 11 Aug 2022 06:12:04 +0000
Received: by outflank-mailman (input) for mailman id 384139;
 Thu, 11 Aug 2022 06:12:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM1QJ-0004Ia-AX
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 06:12:03 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2059.outbound.protection.outlook.com [40.107.104.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82e3d015-193c-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 08:12:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 06:11:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 06:11:58 +0000
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
X-Inumbo-ID: 82e3d015-193c-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlONxj1HYJlXRlbqD2MertzztKKBy4GwFOq9RKxXBbS+jHS/Ye+z0GHZRBuBcTMBkX7ZxRvrqPLLSX9aUNN+BRHGeHcNGhmMvAlbynI/yqp2FGCnyhTT/QbWn9JecHD9cIChGpkhxF0ePgm8nU2chQQCMW43gvdhH1aUO/Kam1ovqSgXgVIBhWVvr+ImAu133dlm9X2pOHXXNI8Yfc2h3iPNlroz7NhBiezIMhm4tWwoPi+QlfImjUZb713IgYEqqwmMIDoi5k5K8wk7zs939FE5rHjy3fDkOZbtPatMmB36Oub8FXjlpV+Ama8J0OFVD8UF3Z+7p4/zdQXzIinGuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrAKU4IAfpLkn38z4pni4TE6urqQ3AFd4nHtHnOkjko=;
 b=RXzTr9V10Lz0IlCChZwcK6JftTngms5sH7mei3WMpTd8GxgQxjolfXQNWuipML08Hf/ZVloRcuseyl0H4VSGzfCnN6VZGJUmS5HYDsVcFrnBoymFfvtE7JQBuK+BL9Q8tEOfhVIgnwAUo2z733P32Lmf8o0V7vhOjiW9FHi9EL4o8CcTeALpS4MK4nmwW95ptfxI4Ois2eMILfeokEoZuI77qhoExdk4I9ziVKji5LZwK0A/TOx2VzKHNz8f6ZKI6XGtUhMosew11s+ZaJqkJR+A8/ejV3MDBRtXidPLNLsghLQfr3xrIQxnO/PotSOVQamVpgWxDhEq91I6CGVLHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrAKU4IAfpLkn38z4pni4TE6urqQ3AFd4nHtHnOkjko=;
 b=mf4RkEjzWdT+OJZ42vh8POAk/n4XACcMzVpuhwCMgrx8xWDXT7LMKurUUqGNQFX7CNd4tN1od5R2A6J67CvfhBqp3EwIOfyz7ulzeuu1m2que6UkP1PyCm/0+DyWsrqOraTgE94Zx/g7ps9BBco+7YrKJGYZuE7gWKP1TqnPnEOnSkFD/WR5SazuUW9g2CT25c+GxpGnuvYIyD9uqhatGJhOMzIkrzc94Y3xsrZ5aA3FZjFhSszvXYgRNR4hZE+ioYOjZVoc8luFzwPyScu967ubON+qcFzWj9MW0M4A6wO+P1pWV//zoABKK3rlPx6lhQbgv6Sua9BsocXSHhNZMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb05c145-73c8-50ff-2ac5-3d767bce5acf@suse.com>
Date: Thu, 11 Aug 2022 08:11:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 02/11] x86emul: handle AVX512-FP16 insns encoded in 0f3a
 opcode map
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <b922b255-f8c6-725d-2290-2749c614fde0@suse.com>
 <b5040452-8b25-0363-25dd-b0fb67291a4b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b5040452-8b25-0363-25dd-b0fb67291a4b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d22dfcc-592d-49b0-245b-08da7b606617
X-MS-TrafficTypeDiagnostic: DB7PR04MB5050:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7VYkqO8Rt+rKLU750RBFsu6FYLb68X6/ZUkzpsnzmV36KUp7Q++gPN+glPnVOx1r/ogEFtkMLmatCO6VhITZgSrAQDBMmleym/XixsHlRiftKE2GnkkctL1U8oZtglNaiIBy7CF3mbCMmbcAeM+JTnFouLI5RAbJBKRjBYQKrJbrjD1z/fuXtOHIrHY0m3j1rAppiSH8Sy5/6kjMZsE38pNmOUAt7tw1DA9IV4E3M1iMhcKXvMACOeFqHp7W4AdD+W8GmnOsjxXnhmI1ulGx+TmL3C6dJYo+fKPRScTyX+tcbg0PfQMO4HW8wXn4Tg3PkTirRTqNoUytvxGsJubHoyeWcte6Q04+qQ4BDLN8plOVJsBSe3dM7Dl9kpB1HSdxQPAGUOEHuKCRGpaEoQ/GUiRD7Zej3Ox00T5fAmxEMTKNZfLa++6fEQ0whOasGIgrk8cQXVQdDelOMjC7tIfI0LEDoNMzEgATOdS27734EBtkDFCFf/U7XXCz+SPEPB9DsuCQobCN1Ny+XkPqnIPA+o8ChnxPIm8RHY09fnr57y9GeTJvHMmm6FBJ1Nq8Y7WLnnsMPaCsfJBmFg4u0dcLjvU2PKL463T9ZeDkv0Re2owEjQir0JT4irVzbQ5ad6x/c4CCDnevvvnXLqZKYu1ZLtOGW1ndGmV4olSZH0NNlrBye/9ucAnzA1Qj29HS5pGqQar3xhJoE2EN9Q4sFcr0e0KTE83EuP7rgYgm979nnFmREHQcn8Muba6oR6bwifeNJPNSYrdFrxrakuJ2TJKlQDXxBDFSgbu4qPh/s5x84kh94XJPXASlBl7xQNzy1pcvfZVbKH1x8DCOlS4DHRZ8ng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(376002)(346002)(396003)(366004)(36756003)(86362001)(31696002)(41300700001)(478600001)(6506007)(26005)(6512007)(53546011)(2616005)(31686004)(186003)(6486002)(83380400001)(5660300002)(66946007)(4326008)(8676002)(66556008)(66476007)(316002)(6916009)(54906003)(38100700002)(2906002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1AvdkZ2YmU0enhlS0lhS3FxWmNwRnZNOE1jSzllT1ZRN0dKY2RORWZNSGt4?=
 =?utf-8?B?YmVBQ3BTeDlGcEpOUUpLQ01XbS9odVJaK2lpVk9CbVhlSnl6UjZwaGdqL2J2?=
 =?utf-8?B?OHpwd2ZNMFlxY2pRN0MyVlZHWUI4VTVhdVVERWtaaW5seWxzVi9DNFpQK3lt?=
 =?utf-8?B?ZDJQMGt6ZGZ6WG5jSnJ1bGFpejk3eTdMdnhmekxoQ0xJMXpmbG5BY0h3WUZS?=
 =?utf-8?B?OWhQN1ZBY0tBRy8vTGhzelFRWHhwakdKVjRBTkV4UnhjMnpQZzV3UmdiMlV3?=
 =?utf-8?B?cHViTzFzTURBWmVXa0lCUCtXMks2bUxyNlpWWDh6ZnpqVEtCb1J2SllCOWZa?=
 =?utf-8?B?c3ZjWTJGeHd4VmY3NnBQRXZESjhkRFdiWHdqSm1HdHppS2MzNGozSFVRMUtO?=
 =?utf-8?B?VUllUTJrTnVTR1pVV3FsSXd5ZE5aVWhicyswVVIzT3NqclVicjF1dVJkSEx5?=
 =?utf-8?B?Sys1VENNZ1NxNFc0ZXhSd3FJZERkWGl6L2ZBRVVVdmJFZDFPd2VhVWNjOHAx?=
 =?utf-8?B?RTVNdEdIZk9uaUFGVmUrcEtNQm80eHhLcktoR1hRcWd3MWMwMlROZEw2M0xa?=
 =?utf-8?B?UnJmd0diRW1MU0xIR2t5QjY3UnJQQm1yU2dQQVRsc0pjdUkyZm4zWCtRL081?=
 =?utf-8?B?a0RTZUJwUC81THRTM3NRMnhMNVkrbXpOUzBsZldDRElqMzNTNzRrMDhUYytQ?=
 =?utf-8?B?TDc5bnVLTXJvTjVySWhxUEE2V1JSLzcvWkFZVHRKdFF3Q1BDRXdvUDNTOWJR?=
 =?utf-8?B?WVB4RDJyMzZKUk1wS1Rsci9XbkNTYlJjTVlYRng2UEhOQU9KZlQvTXI2eUll?=
 =?utf-8?B?QStzYVcrbXZrckJrN0cyRXhsNUU3d0hBZHJuSXlZajlsQldyVmQ3YnZKak1N?=
 =?utf-8?B?OGtocnV5V2Vkb01YMysvYUU2QjRwbXVYRXZCOGFtWGhqN0VKQTl4Mm11Kzdm?=
 =?utf-8?B?UmRiSU5nVjdTeE9OUHJYRTlyYjNMTjZRbVJ2QjNUVE1yVyt6M20vc3ZQL2Jx?=
 =?utf-8?B?Qm1nK1gvb3JLaHhIeDRHK05PSXNYWlowWTRuU0lsWC9jemlld2lDKytiWVY4?=
 =?utf-8?B?SHRsQ29UWVQ4bTlWY2EvVFlhd1haZ1VEU2c4cXg3cCtNMVR2M2VZQitaTFRn?=
 =?utf-8?B?V0tJYnVmYWtmdkJSRXpoZHlCMkR0UXZESWp4TjJoZGMvWjM0eTBzMkR6Mzg4?=
 =?utf-8?B?UU9PbVpZRjd1MklObTk4MlNrZDcvaXZ1Nmo0NVFGZ3RSWHJLWUt5UEszenpG?=
 =?utf-8?B?NjV6dXRONjQzand0emRtZDUwZEtMcGhiZVZ1ZXFEcEltTnlLa1lvQVU4ZHBp?=
 =?utf-8?B?L3Ftd0owN2xwNUpncWhxZXJQbjhGczBoR3BIKzFoSnh2UlZ1RW1ZNXdQOFhC?=
 =?utf-8?B?aEJuQWVYQWlOdFhIWkdZQ3lwalpQRmJKdnFSSVVPL1g2blZDQXAxSWhEWXlE?=
 =?utf-8?B?MWs3MnFKcWthMkNCeUNyUGJETVIzUWJVR2V6UXVTejVxTTFRZFZDUytOcndM?=
 =?utf-8?B?RmJNazh3S3JyTHBhK0xCSmFxb0R6SktBNXRFdnBtVkdyeGMwK0dyZlNhYkYv?=
 =?utf-8?B?eG0xL3YxdVAvMVJySzdva1Y5WnViMDdKOCtPWmRUZXJGcEoyMlpvWlhCVUEr?=
 =?utf-8?B?SjA1a3p1MUMyMTh4RnRrTnZkR0tsSG8vaWI3SUk0Y3ludHNzZVZDL2VSYlhm?=
 =?utf-8?B?VW1QWFhBUW83QTZhN3JpTlZiMW91RU53L3RvdVI0RHVUTVpBaEFMbWx1THpl?=
 =?utf-8?B?bGg3T1JmNTNRRzhmOW9STFEyVkc1a3p5T2Z2YW52OXdCQis1VkRrQXlmMnJy?=
 =?utf-8?B?Z20wL0RwMy9WMzUrTzUzdllIREhrNTB6cEVMYUxMVmYrSWxReDlLQmRoc242?=
 =?utf-8?B?WHBqS01rK0h1OVhvTHI5Y1lJZTlvSENFbnBZZVNmMnhRZ00zSHZVWFpsajB5?=
 =?utf-8?B?bGZ4T0kwR0xHdjBxcFY5c0xlZEh2R2Zvc1JFSE9yd082SW11SUVPeDFpYmcv?=
 =?utf-8?B?RkFBak5LU0U0OWJuN3d6Wks5OVhQaFFldU1HQkdYWWNtOGtlU3NydzVTTlZv?=
 =?utf-8?B?UERVbXByMG45S2xXUklTS250ZS9qRlNacmZpUjNuZ0x6QitDRUlpdjE2UTdN?=
 =?utf-8?Q?tnCm5EvroSKn2iPdF4MfWdPZy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d22dfcc-592d-49b0-245b-08da7b606617
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 06:11:58.7465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhPF/VBVTQqQJrouAOztjYHwPB7Ick/q5P8SIyaS0f/uXcHv1hB3M28/E3NnUYbZpmvhvW+XjaGfeLajCQnV/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5050

On 10.08.2022 19:03, Andrew Cooper wrote:
> On 15/06/2022 11:27, Jan Beulich wrote:
>> In order to re-use (also in subsequent patches) existing code and tables
>> as much as possible, simply introduce a new boolean field in emulator
>> state indicating whether an insn is one with a half-precision source.
>> Everything else then follows "naturally".
> 
> This is slightly misleading.  What you mean is it has an FP16 source, I
> think?
> 
> There are non-FP16 instructions which have half-precision inputs, like
> the F16C group.

I don't see the difference - both use the same floating point format.
Whether you call it FP16 or half-precision is imo secondary. In fact the
new boolean might be usable for the F16C insns as well, if we wanted to.

>> --- a/tools/tests/x86_emulator/x86-emulate.h
>> +++ b/tools/tests/x86_emulator/x86-emulate.h
>> @@ -182,6 +182,7 @@ void wrpkru(unsigned int val);
>>  #define cpu_has_avx512_4fmaps (cp.feat.avx512_4fmaps && xcr0_mask(0xe6))
>>  #define cpu_has_avx512_vp2intersect (cp.feat.avx512_vp2intersect && xcr0_mask(0xe6))
>>  #define cpu_has_serialize  cp.feat.serialize
>> +#define cpu_has_avx512_fp16 (cp.feat.avx512_fp16 && xcr0_mask(0xe6))
>>  #define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
>>  #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
>>  
>> --- a/xen/arch/x86/x86_emulate/decode.c
>> +++ b/xen/arch/x86/x86_emulate/decode.c
>> @@ -518,6 +518,7 @@ static const struct ext0f3a_table {
>>      [0x7a ... 0x7b] = { .simd_size = simd_scalar_opc, .four_op = 1 },
>>      [0x7c ... 0x7d] = { .simd_size = simd_packed_fp, .four_op = 1 },
>>      [0x7e ... 0x7f] = { .simd_size = simd_scalar_opc, .four_op = 1 },
>> +    [0xc2] = { .simd_size = simd_any_fp, .d8s = d8s_vl },
> 
> This is a new instruction, isn't it?

Well, its the analogue of the space-0F encoded VCMPP{S,D} with the same
major opcode. I have to admit that it's unclear to me why you're asking.

Jan

