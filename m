Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D72E58F7B5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 08:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384173.619465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM1p7-000079-0C; Thu, 11 Aug 2022 06:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384173.619465; Thu, 11 Aug 2022 06:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM1p6-0008W1-SA; Thu, 11 Aug 2022 06:37:40 +0000
Received: by outflank-mailman (input) for mailman id 384173;
 Thu, 11 Aug 2022 06:37:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM1p6-0008Vv-7R
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 06:37:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 180f8806-1940-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 08:37:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9265.eurprd04.prod.outlook.com (2603:10a6:20b:4e0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Thu, 11 Aug
 2022 06:37:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 06:37:37 +0000
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
X-Inumbo-ID: 180f8806-1940-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loCBei8o6ZOWEPuLM5ac4iVrtRtq56Dg++TVW3bj14eGfWVPftdGd2d75o55W3T8qdufXrnaZtrcV+AnXeb5jqZXI3EyY8UghfAFCQiQqSyKvfQKUurJizeosUHJOzNYhblFZe9mXvg6jh1c8TzGuIfYgb8CB6dCCuoewTF4CDjYxLX1mIyI2s84KOLIlPb4m/Y8iwC5Xvc4pxjJoQOX4JzKsCkcPyt4xf3hpMyFgOL7aBXhGLbn/gk02jSFSaWsZs8Q/RmUTjJJtQD5cNGO229hon7BNSLbjZawsfOfYZ5CXiSgNs0qHHkbiFaQ8aE4fdPGJsOaNgAI8z3I8o+rHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qd4ySrKofq/MThdlK6vhj46TAhUuCbNiuCWdMP3Du3w=;
 b=J2kGKxU0+P0aYdQI2ZLRqytz7RHDm973Dydoc/I/58QtoLjC9/cxpy56WTRABLciTLV7qMF1jTcZ8XAS2X+Nm7MiDoVp0/MegMQOMB77KpYH6Eckt/nyaKZRs3y1YnwKGkeU2+fGxmEOlDW8Eb4sTIYIIImUqzNtenp2IjuJ0pNpOanshCkrCaa2Gt7iK3fZ+Wyrwss/vk31ZRWSspardTofkgDeQU7mWqYUDa8HbRUgeljxGFhiReKZctj8EpHVg8BlOK5PlW0whHjDklAQg7LKqqBuAUEMA75bJNqSDdA/CVwotDrc9Y1k4QemGz+RjL5jjoWhjInidrLb2fwYZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qd4ySrKofq/MThdlK6vhj46TAhUuCbNiuCWdMP3Du3w=;
 b=Z6DSXfhg3RzqxljVCJ8ojMlwUU4u+IihYXLec99uANo+zGAP7+TG6+vQD3ntFwisiAm9u4jEEmmQdyQkAmDdsSnxXA3QvvfT2FoAnOK7hiUCrs8dDwJcrqnxeHXGM7oBPe7DXYBkrFeaTkJ6w4+tSJ0xzbqW4H9XARGRnIa2nWOf7/J+hDj7i3HSn/sk5itGcmBvPoe3FaC/R31JxhDMkIc9mB2MOzeGz7xcs4L4r2/UZNq+cpmemi5vzIQ5tXkvvf0CqRvXwElgBcu+fphb2gBNrd23ZuMAI/Hu0kad2vGZqwl8vmshUTgZHJXPvJqGLcfuQsF8HIc2UVZjKRuY2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <995cfb07-0981-1ea1-de6c-42792cd04eb6@suse.com>
Date: Thu, 11 Aug 2022 08:37:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 10/11] x86emul: handle AVX512-FP16 conversion to/from
 (packed) int{32,64} insns
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <2f99e91d-6a91-f860-45d0-9c8b67c9b2b8@suse.com>
 <11a429f8-0ba7-f380-e7d0-28817cb9593f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <11a429f8-0ba7-f380-e7d0-28817cb9593f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0734.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a25a6d8a-1b8d-46af-ac56-08da7b63fafb
X-MS-TrafficTypeDiagnostic: AS4PR04MB9265:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	isDr3K8aIx43WxqeqoZoEPFysbSqqAvGIWfGFmhmh7++nNYgUFjX84EVwW0Xxg3wZrLLPzznW2FLb+33iRmWPSLae2pS/4kI0r7UTsb8xmyIJX4J90Q+id6Qawa2151QjnrRZksTGwO7LitYeXzpDoifVsANp13Mipm9WyHTSoU3vXHtfCzSKXpz12BqZouRpA3/lvhzkOcwuWVvO0vwq3cZpiCZ/aMImfubCmxGqOsYXfKJxdNsDWoIIgTMBEjj8GsDJP6qKXIoXmoQhf4bpDEpyDr5O8Nzi+pc2HIIXulkqghQshBKJTjjctXnr3mPvh+YX1x027FC978nXW06JAHLTJFYeQRBEEnMsfyMvN3TDLf4bD92fPpBMoSKbLBtnmu0H6M+aWUi/q7GHaFgTVGpaRqtGvss14VKd25hwOUB19M7nEq2M7ZCgbFZk1tjCv04ZdPEKtxkWotbhmXmsq3hDU/Fv1WEhWsd/lpbeBTHHHxxUH2trc6zMzkPrZJBmrsEM54RBzLPfD1Kv4iqaEtRMAy6kU1Cwn75pcK5i5f3z48R3CWvz2rmAslDe50D1CzR/REEEz6PHIttA9WbnDEnSRkkIIJEHFT7P0yM1K7Hx2+MtIsNzJZLV30BMNIGY7KGNtUjbxQkAcImjwazlne2I62QVzg/tpzec0kC5FeT1vX1MbvIoX/+Vtk052donADhFbhORcCJrieT+k3kulE5D73hDmjnUk4PDC1nVnXIOIsyfyiXbiIZnfUAfzDwIQLhQd6W6BQCgXbu9OUyEYeUgVIrXWYbzchJ6pDKnKpA+UlCJ5P8fr5W2vr6GYWDncJH22CzNArjklCav5w0IA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(396003)(39860400002)(366004)(136003)(31696002)(26005)(41300700001)(2616005)(6666004)(6506007)(6512007)(86362001)(53546011)(38100700002)(186003)(5660300002)(31686004)(8936002)(8676002)(66476007)(4326008)(2906002)(66946007)(36756003)(66556008)(6916009)(6486002)(316002)(54906003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDgrMXU0RFl0MVBEZU9jMkNyaGJraTVCQnRhZFNSbVZzcldxMGVFamNPK080?=
 =?utf-8?B?UldSd1Q2aTc2REdpelJMTEcxTi9rQ3ZQODB6TDB4WTd1eW1mY2FvREtHdGor?=
 =?utf-8?B?WkNxV1NzNGZVSTZRNXAxRE5jaG44Yk5xWTlYSmhSNTRLWFRYL0I3L1U2bzRn?=
 =?utf-8?B?YUxsZ0prMTAzT3J6bjcvRmt0WXpDczFXR2VPbUMvWmkvbW1QR0pGUGowWXJz?=
 =?utf-8?B?dmtlV0VETmJ0VEMrMC9yTVk4MWcwc3dDY1hQMGtnS1lvbWVHMW5CVUoyMzdo?=
 =?utf-8?B?REpYN2NvOUNlVGhIeDdUVUxKWE9BOE15TTZsZjlYTUx1ZHdvS1RKN241ZHYy?=
 =?utf-8?B?R3VvV1R4bXhObVAvcWl4Q29wTlQ2Y2RNV1kwMzBjc2lZc0tZMlNUUFJoeS9K?=
 =?utf-8?B?U0V4ZVNIL3VTckFJZ2t4RTdqc0ZFNllhbTRpQldISjR4akhRMEZhUkNRaFRr?=
 =?utf-8?B?YjI5ZmhUUWt5UUd6VHZtTHVPSlVTeVRnd3hMY2dQelMwSGlpL1lwZXBCam5v?=
 =?utf-8?B?OE8rNFVja2tEVmlUKysvbHdFRml5OHpVMDFWSXpXRnc1K2VQR0VqR1J6ZXha?=
 =?utf-8?B?RitUSUlvUFNCMk9zdmpCNDMvSXB6SU9Mcm00akVLaldmQXpGbEZYbFltVE10?=
 =?utf-8?B?MG9JYzZrUjc5eW40S3I2UktQK0NBck4vOVJXdElQcmRneHVmMWl0bVNrS3V5?=
 =?utf-8?B?UUgya2pOYmxWOGdjR29OL2dyTUJhejljbjJCSTFSM1haekFrQ3duUXlKRUlh?=
 =?utf-8?B?UWt3S3Q3UW9oUTRVeTY4azBSRnl4L0U3RDFaOEpaTVNVUXgveHFPTDZOd09y?=
 =?utf-8?B?YWlIS3cvWTJ4RTQ3UGt0NnVnSzR2dXhJbk81dnVOQ2F1cEVnOXVYNjVYcTE0?=
 =?utf-8?B?UnA3Q0wrZUFzd3g4VFBNVEJuWWcxd2VUaWJIVzZQQUNGMDZUSWlSTHRiSXhF?=
 =?utf-8?B?ODVLZHFidWhNUyt4UitDUjVzeHhIVmRobDVWeWcyRXd3Z2t0Z1hGYks1b05V?=
 =?utf-8?B?dDhNc0p4akxWUzVKcDcvYUJ5djlGODJ4dEMxcUpUWTlUZ1ZpV3Y3RW14MW1k?=
 =?utf-8?B?RW5YN01VRW5ESVU3T0NrVXQ0MlFLVXkxazA2bm5mM0RYVjhvbk1rWTVJUXFB?=
 =?utf-8?B?THNJNzV5ZFkvRXhESlQ1ZTF0S3hJQnVhYTArNTVBTU1GUXg0WXROT2hrSUFM?=
 =?utf-8?B?Q1cyN2RlQmc0cVdVNElIdkFqNks4SlVDdnZ4cHI0MlNXemlDYlpjR090TlB2?=
 =?utf-8?B?am9LY3VYdXBjTGx1L1ZhbHRiNTdHN2UvbXprckJMNFJVOXNFakVGWiswY20z?=
 =?utf-8?B?dTMrT21DbUJ2SkV4WFAzejlkamNmRENQMkdoR1ExRkFGaC9jZTcyM1dTZ01i?=
 =?utf-8?B?S0w3QVkvNVZCUlc0dloyU2JuTTNVT2RKeVBKQ2dMa3RKbW5nc2ovQXQ4Rk53?=
 =?utf-8?B?RnR5Zm5TMlUyVVN1Sm5Qak5qTGtwN25IenMveDBnVGRITGp0YU9PalBmU016?=
 =?utf-8?B?S05DK1lSSUFBM3l4Y1dWWkhHQjM2b2JzcStrZEo4ZFRYdjVoZ1RZeVplNHJs?=
 =?utf-8?B?WE9oa3VQZXhobVY5VnFvajNKVjVUQXlQZm55c2lSdnZIaHYxWitZRTBrZ003?=
 =?utf-8?B?SkRiQmFIMzJmdmhVTlUrL2VOM3gzMVBvM0JGTkViT05Qdy90WmtOVzNuV3Rv?=
 =?utf-8?B?QmZpeGs5MzRUOXMvSHhXbFVjcWtlWmpTUVdCZjRmSlJHZVcrMDZVYUxkTGhG?=
 =?utf-8?B?R2xPVCtTN3Q4RUMxazJqSURDdy9peFFXa1dPc2RPSWJ0aW1KSjFGclBGTE5i?=
 =?utf-8?B?SUphMWQ3THYrelFaQUJSYlJSNGM3bDd4aHYxTFQ3VGlxZ3NDWTlZTnhrWXBt?=
 =?utf-8?B?d1llUjBYcTFhTjhjcVpBdk9lOW5IWUZ1eklQWFdhcWtybEsrNElGUGxmWnpE?=
 =?utf-8?B?VVNKS3RtVFhqeGYzblFtVXEra0wvTFA2MmxlbWNLeXB4WWtZYzJTd1FqYldV?=
 =?utf-8?B?R1BlTTdGcDU1MEUwSWtjaEtaTmpHODVCOXQ4VXRMOEpSL2drTzhvSmdBMW1t?=
 =?utf-8?B?azYwam5BVTZTdzNHZHZESU9GVHVQMjdjVlByT01Pd2JYVkNCWnh6WGNyUTE4?=
 =?utf-8?Q?m/VtaakZZIM5BQV8zL6GCZzeP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a25a6d8a-1b8d-46af-ac56-08da7b63fafb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 06:37:37.0372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E256gI68yVRq3HRKFnh0cgSbQOx3mtupDoPOHdGeUWr0VfXSDVhZcD5jhR3nLQwUola07zL6VzInKtmjHBkudQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9265

On 10.08.2022 21:09, Andrew Cooper wrote:
> On 15/06/2022 11:31, Jan Beulich wrote:
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/x86_emulate/decode.c
>> +++ b/xen/arch/x86/x86_emulate/decode.c
>> @@ -1489,12 +1489,25 @@ int x86emul_decode(struct x86_emulate_st
>>                      s->simd_size = simd_scalar_vexw;
>>                  break;
>>  
>> +            case 0x2a: /* vcvtsi2sh */
>> +                break;
>> +
>> +            case 0x2c: case 0x2d: /* vcvt{,t}sh2si */
>> +                if ( s->evex.pfx == vex_f3 )
>> +                    s->fp16 = true;
>> +                break;
>> +
>>              case 0x2e: case 0x2f: /* v{,u}comish */
>>                  if ( !s->evex.pfx )
>>                      s->fp16 = true;
>>                  s->simd_size = simd_none;
>>                  break;
>>  
>> +            case 0x5b: /* vcvt{d,q}q2ph, vcvt{,t}ph2dq */
>> +                if ( s->evex.pfx && s->evex.pfx != vex_f2 )
>> +                    s->fp16 = true;
>> +                break;
>> +
>>              case 0x6e: /* vmovw r/m16, xmm */
>>                  d = (d & ~SrcMask) | SrcMem16;
>>                  /* fall through */
>> @@ -1504,6 +1517,17 @@ int x86emul_decode(struct x86_emulate_st
>>                  s->simd_size = simd_none;
>>                  break;
>>  
>> +            case 0x78: case 0x79: /* vcvt{,t}ph2u{d,q}q, vcvt{,t}sh2usi */
>> +                if ( s->evex.pfx != vex_f2 )
>> +                    s->fp16 = true;
>> +                break;
>> +
>> +            case 0x7a: /* vcvttph2qq, vcvtu{d,q}q2ph */
>> +            case 0x7b: /* vcvtph2qq, vcvtusi2sh */
>> +                if ( s->evex.pfx == vex_66 )
>> +                    s->fp16 = true;
>> +                break;
>> +
>>              case 0x7c: /* vcvttph2{,u}w */
>>              case 0x7d: /* vcvtph2{,u}w / vcvt{,u}w2ph */
>>                  d = DstReg | SrcMem | TwoOp;
>> @@ -1515,10 +1539,34 @@ int x86emul_decode(struct x86_emulate_st
>>  
>>              switch ( b )
>>              {
>> +            case 0x78:
>> +            case 0x79:
>> +                /* vcvt{,t}ph2u{d,q}q need special casing */
>> +                if ( s->evex.pfx <= vex_66 )
>> +                {
>> +                    if ( !s->evex.brs )
>> +                        disp8scale -= 1 + (s->evex.pfx == vex_66);
>> +                    break;
>> +                }
>> +                /* vcvt{,t}sh2usi needs special casing: fall through */
>> +            case 0x2c: case 0x2d: /* vcvt{,t}sh2si need special casing */
>> +                disp8scale = 1;
>> +                break;
>> +
>>              case 0x5a: /* vcvtph2pd needs special casing */
>>                  if ( !s->evex.pfx && !s->evex.brs )
>>                      disp8scale -= 2;
>>                  break;
>> +
>> +            case 0x5b: /* vcvt{,t}ph2dq need special casing */
>> +                if ( s->evex.pfx && !s->evex.brs )
>> +                    --disp8scale;
>> +                break;
>> +
>> +            case 0x7a: case 0x7b: /* vcvt{,t}ph2qq need special casing */
>> +                if ( s->evex.pfx == vex_66 && !s->evex.brs )
>> +                    disp8scale = s->evex.brs ? 1 : 2 + s->evex.lr;
>> +                break;
>>              }
>>  
>>              break;
> 
> Perhaps here, in terms of overriding...

From all I can tell, the s->fp16 setting would better remain here, as
it's (embedded) prefix dependent. As are the disp8scale adjustments (if
you go look, you'll find similar pre-existing code a little higher up
in the file.)

Jan

