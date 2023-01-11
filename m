Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B436E6656EE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 10:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475143.736692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFX5w-0003pD-TN; Wed, 11 Jan 2023 09:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475143.736692; Wed, 11 Jan 2023 09:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFX5w-0003mn-Oe; Wed, 11 Jan 2023 09:08:28 +0000
Received: by outflank-mailman (input) for mailman id 475143;
 Wed, 11 Jan 2023 09:08:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFX5v-0003mh-PX
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 09:08:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fbf4159-918f-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 10:08:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6803.eurprd04.prod.outlook.com (2603:10a6:208:187::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 11 Jan
 2023 09:08:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 09:08:22 +0000
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
X-Inumbo-ID: 7fbf4159-918f-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6V8MEZokr3DYQGSn6eWcqLsvGmdovnzWUNfFJGF9cSjBU11wg+dz4WLtB2W18vKzXzSiEB7LPCm/dUgbToU0Rmpd9/oGwIWElX1XxmGLKHh5Td0ZrlI3fLr03uBy1W/G5Q6gUA/O1vWG5huKlccFZxrn64E+oRu/KwAe/K0sprpaHY2juE60uew/8jMNyfWaIFsLaD6vlqj+VhDJI84NrM/3M8djRRXM9Qp343kc7DzeJNJVooDRnjkmHkOI3PWmuqJ6/OilPM22hkM6bdZTnr2sZ8vPfFhajnb4ukGul/xA61CKj/RZ5WTzSGLOlE5NLThRWzA7uRSHOM43zz9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcayiEJHhuTrBBbs3n/Zkwp+wXDoF5yREjQiuKs5PQE=;
 b=WMMU2A8HTc0kZN1fIGv/TmRHuE5RtX6D9ZsqR1P4WjiYrW0ufhbmQeAjJsuG7gxi4nUtknSbRZMBj6jjfZwUTPnq0z2LN7g4RjrUxCXWrg1EVSLVaeWsdMzVbkLd1JwrXVMsbANra94E3BggWlyVUt8ys5GN7+bA3F1p6omh6ETGMYPNBXDT1fjRS29IowCiWGhfmw2ufAX7QxNBVWjIsS2JiOFyU7JoJPBWAuLhXdr2aOLSrZlGzjNpMIDxtGCqT6AHTrzIHrmWSSp80Fhueff2g6g46OdR9/TSr2YviafUvssu0+mgUZwAmWXoM5tEMVllxOnY/Qtt1Few31P3Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcayiEJHhuTrBBbs3n/Zkwp+wXDoF5yREjQiuKs5PQE=;
 b=A019GrJZk7g5WZg4oKewTOq5gdvQmTl+YjoyVlTagVwBoC7vTsGRFV1SQhocqRMDruwbhghWHj5L6oMBw69m463FJIX/z7qIS5nfFS+rIUvC4hNlxIR1dY2JdxkG4MqTfc3AedXji1KVBbs4FQK0VpkHhgXNEhOl7dRlO3g4zCaYiSvCOBGfrKeFMVHcnN5w5j2S4tgrQkqantplbljALkgI8kFtz+el3QmKTEd9SU6pE6iT/AIo67/KwhubuEdBLz5zVgEXs5RlHSKHNMrxUjsge+js3mYvoJ4nQRAUuNATBPeF9t2liLq75Cf6vohF1bI+ZsiArahIudO4ZiXOjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b6ee20d-2f32-ab38-83ec-69c33baf42fd@suse.com>
Date: Wed, 11 Jan 2023 10:08:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/6] xen/riscv: introduce asm/types.h header file
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
 <ca2674739cfa71cae0bf084a7b471ad4518026d3.1673362493.git.oleksii.kurochko@gmail.com>
 <c333b5b0-f936-59f8-d962-79d449403e6c@suse.com>
 <06185fcfb8cbd849df4b033efa923b55c054738d.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <06185fcfb8cbd849df4b033efa923b55c054738d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: 9afdd411-15cc-4544-4512-08daf3b363e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MrMC31EWQie1C5it+fnueu96JOht7t0lOGc799NtF69t70QT7sT0UZ8sNSIxqnNNFzCJCfgZ2K4M86mIDPIezQQ4gUakc5Tx+b9aO4EAw5jUBf5EsTvnPIB0p3rO6kWC3YRfYtkSm2dy/IayqPM/6mEP8KK04efSGhd5ld7iZpcvAoFJR5GaFV6z6cmIgyTiMVAGRB8NjpjYJWpGyLvVbp+UwI5CpWfYwo5unPqguzJ8+54FA2mFuo4wkbqYNM2x41HpF8uSYsgqwRUBkBfZvxRBGi7H/Ix/zPPgckf0Pzt946rYebljzwcUsZW5b+HhBn7wuJSKThSesQ/iuVrvBNNnermfgyq4XPvm0hve4cpWUr73KZ1Ijrz2JWChEuxqx/tk3XdGSf0x7S1ME0mu0aU+5hGG5ldL/Iwu28A7trlo2MsMWwMXpfcYSWDr/4I6MEWLZHaHLAkz/WbXD3GlnuTyPUaPWQXEuWhO33Ss17z/gKOMNJLF4mWoDVoBtK9vkYKX55M9nIF1ysNVkQi9EhhT3R7nC0gqU92XAn2Kznwpb3nAxUPTXwKb+Nxde2Sbr+1ghNTS7MrvcsvVuLXRwVjygWOoE+6LznoU0NP9mcxv/gpLBNMZMDs//YzhWinqmBFWkbB4sFKpv04QnoiQQoYLFtMozQKmgUS2ThwRawsOgwb/EMIouupRyiCuCMP5fR3vbiDHJSFvOUJ6UwuEAgc7EjFSVgL7oQWdxy7f1bk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199015)(6506007)(478600001)(53546011)(26005)(36756003)(2616005)(38100700002)(86362001)(6486002)(31696002)(6512007)(186003)(5660300002)(31686004)(66556008)(8936002)(66946007)(66476007)(8676002)(54906003)(4326008)(41300700001)(6916009)(316002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjJQRW9CaXFncmJ4VkpGNHJuWjVGTmpRWjg1elpqN2ZOdUUrZGRwbTZjQVhO?=
 =?utf-8?B?SUFnSXdxT2hPSWhCK0tKRDI5OFdMd0NFRythakFrTlhkaWlyR2pYaDFJUTg0?=
 =?utf-8?B?dXkwVUxZT3Q1bjI2czZhcTR0YklqUEpyRFY0d1hDTEVISTBOWmJPaDNpdk81?=
 =?utf-8?B?YVlvdUZ1M1lOd3o4TmZBRnBsdktEa29XNm9qckpYZ1F2T1R1SFVWU0kxZGxu?=
 =?utf-8?B?VXdIbUFPWThzWDNYYzFDK3M5NHVTaXgwSHkrVkdVeS93Mm1SYVVQWFVHRUtP?=
 =?utf-8?B?cldwZ2JoYVVYaUYwaEc5eko4eCt4SWVGUGRyVVoyU3pZelRRQVFGeUtvbTho?=
 =?utf-8?B?VmFkeDNIcUF6VkVtMkdxaDI2cUpCSXR6TWZBbm5GWStqVUhPcXNGK3pjR00x?=
 =?utf-8?B?Ukw2ME90OUxvdC9BMm1WM1B5SzBlLzBjVjR1WkdwSHUwQWxvM01JYnhMS05P?=
 =?utf-8?B?RXZkUlJTTDZoZjhOeklGWUZPSVB5UkFJOFBJZkFiR0hXOTk1R2l3dzhkUXFv?=
 =?utf-8?B?VWdPN3RXUE9DZjBTZXVYYThsNERrTFpiVHpzaUJXVDFCS3BWbDNHSGNNY0h5?=
 =?utf-8?B?UW5QczVNVDR2M2dwZTM2MFRhWFhJQ1dobzJiT3JRZmtFcnVDM0w5LzExUWw5?=
 =?utf-8?B?SVZ3RXpGVS94NTYwZW9xSExuTlZSRkRXeWNUZlZTd0c5Z3Z2UG51aDY1UUdv?=
 =?utf-8?B?RjRPNldSNUF1UEVRYUcyVmJYY21RN2t1M25VdDVnMnBVcERJREExRjg3dWda?=
 =?utf-8?B?ajBScXdtaEFkVzc1UEE3aU41WHdLVWl0a09nWWhJZ0pBczZBTmhnTmpqQk5U?=
 =?utf-8?B?MUV4Y2tXbk9WZTIyREN1UDNZcHNjK0cvZTdLWnh2bUkxZjVQaVhTb0ZCbkdz?=
 =?utf-8?B?Wk5mY1E2dXRBbWNSbkRMOGlyM2ZzQ1NZRE95TlpwbFcvUTJTSXptbDBzNWhY?=
 =?utf-8?B?UUx2d3N6bnAvZk9yYVJDZTBKTGV1VkVSNU1FMi9hUUErNDR0RElhWjNzb282?=
 =?utf-8?B?SDRvL1IzMkZwSTQyWTVMa3NyeUZuSFNldkZNU1gwUDdSaFlhQlFWZWkxMUZR?=
 =?utf-8?B?WkpaeDBiUDBJRDBlclB4ZkhLck1UM2k1b2U3UzJPd1huRWJkZVFyc3pVanp5?=
 =?utf-8?B?UGFLSmxZcjQ3S1JHVGZFZ0d0RjZ2MHhzOVlzRDArbzJ4blhialErbDcwaUdl?=
 =?utf-8?B?cE4raXBuU0dWSERLTGtnaDFvb1ljdWlxWktLSVNYZjB0OFFyN2UzOUdrZDRs?=
 =?utf-8?B?R0JzRlZleHJnSzQ1ZkhOZWpDd3ptcHBwNnRTOGhCME5LZ2pCcitEVlNxZ3Zs?=
 =?utf-8?B?Ly9TRldrRFdIbWRHVDczMnB0R05hNXV1eVdubXRoTnUxU1BXVnNURnJVK1Rs?=
 =?utf-8?B?Y2llcTh2WDVwNjA1a0laOWd4aEtIc2dqQkI0aWR2Z3pWTy8rQ3pyNjc3QnhP?=
 =?utf-8?B?Y3NlQ1pXN1ZaSmFkL29FRlpyVGpBVzgxMGt0TTFkRDk5OC9SYWJKVERyS3Fi?=
 =?utf-8?B?VXp6eUxwVlhuZGpPc2NlNnh5Y2Z2dVNnUmhzcXZ2RGRRdTlZZUN4VGcvSW8r?=
 =?utf-8?B?YXF1RmVUZTRkRlJ0SS91Y01KUEJzQ3ZXd0lrd2ttWG5rRjJ4MlFPVnRBenBD?=
 =?utf-8?B?SzBHb3pRbWRaaTVvU0ZHQXJRcHNKRzV6LzZ2ZkR4dlFuQTRobXE0Zjk5VGNo?=
 =?utf-8?B?UEJHR2g2K3A5cEdyS3NLSUhmVFl6OEZ6VzAydXJodElhVy9KV2NLSENlNkR0?=
 =?utf-8?B?c1c1c0plaG9qSWdzdy9Ec1JUdUNxNEh6dTFscmtIZkpyQ2lZck1vcVE1MWtG?=
 =?utf-8?B?MDd6cGRUMXRyZi9uWlRRdFJZM0FZSkNJNUgvMHJUY0pzcFZPRCtETC9oNFlO?=
 =?utf-8?B?YmkrNnp2cHAwTXlDQUdSMk52NjBlaWNabXNOUGx1QUVLVVpVcWhHUUV6Nk41?=
 =?utf-8?B?dDJUdDB1VmZCbFZWc1FzdWRaNTMzTjlkdUlRWDBqeWlPT2ZWb2VFRWVScGZw?=
 =?utf-8?B?eVRRbUhyc0lBVTBWb2tGRmkycVgyRE9YUTdQUjNLUjBhM3RHb2V6WkJ1cDJP?=
 =?utf-8?B?aGN2V1F0Vk5DMVkyMmVBeEZrQWFqVE9Zc3JGZDE1V3dLMWw4R0JqWjdLcmdq?=
 =?utf-8?Q?Gwnri104DfMXCIKvykDxVQ81n?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afdd411-15cc-4544-4512-08daf3b363e6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 09:08:22.8171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+NxpV/yrE1ZWgUV/PqKE9nzxnq1AuySih9/tOnpcUdlxJa4UccVwEVe8g+RFHMSE/Sdy5VD/KYDt41wJWO7QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6803

On 11.01.2023 09:47, Oleksii wrote:
> On Tue, 2023-01-10 at 17:58 +0100, Jan Beulich wrote:
>> On 10.01.2023 16:17, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in V3:
>>>     - Nothing changed
>>> ---
>>> Changes in V2:
>>>     - Remove unneeded now types from <asm/types.h>
>>
>> I guess you went a little too far: Types used in common code, even if
>> you
> It looks then I didn't understand which one of types are needed.
> 
> In "[PATCH v1 2/8] xen/riscv: introduce asm/types.h header file" all
> types were introduced as most of them are used in <xen/types.h>:
> __{u|s}{8|16|32|64}. Thereby it looks like the following types in
> <asm/types.h> should be present from the start:
>   typedef __signed__ char __s8;
>   typedef unsigned char __u8;
> 
>   typedef __signed__ short __s16;
>   typedef unsigned short __u16;
> 
>   typedef __signed__ int __s32;
>   typedef unsigned int __u32;
> 
>   #if defined(__GNUC__) && !defined(__STRICT_ANSI__)
>   #if defined(CONFIG_RISCV_32)
>     typedef __signed__ long long __s64;
>     typedef unsigned long long __u64;
>   #elif defined (CONFIG_RISCV_64)
>     typedef __signed__ long __s64;
>     typedef unsigned long __u64;
>   #endif
>   #endif
> 
>  Then it turns out that there is no any sense in:
>   typedef signed char s8;
>   typedef unsigned char u8;
> 
>   typedef signed short s16;
>   typedef unsigned short u16;
> 
>   typedef signed int s32;
>   typedef unsigned int u32;
> 
>   typedef signed long long s64;
>   typedef unsigned long long u64;
>     OR
>   typedef signed long s64;
>   typedef unsigned long u64;
> As I understand instead of them should be used: {u|s}int<N>_t.

Hmm, the situation is worse than I thought (recalled) it was: You're
right, xen/types.h actually uses __{u,s}<N>. So I'm sorry for mis-
guiding you; we'll need to do more cleanup first for asm/types.h to
become smaller.

Jan

