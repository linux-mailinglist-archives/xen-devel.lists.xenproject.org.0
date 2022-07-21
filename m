Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A199657D077
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 18:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372889.604921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEYav-0006t0-Le; Thu, 21 Jul 2022 16:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372889.604921; Thu, 21 Jul 2022 16:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEYav-0006oB-HJ; Thu, 21 Jul 2022 16:00:09 +0000
Received: by outflank-mailman (input) for mailman id 372889;
 Thu, 21 Jul 2022 16:00:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=itvi=X2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oEYau-0006g0-8z
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 16:00:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30c9b5a9-090e-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 18:00:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4314.eurprd04.prod.outlook.com (2603:10a6:5:23::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Thu, 21 Jul
 2022 16:00:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 16:00:04 +0000
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
X-Inumbo-ID: 30c9b5a9-090e-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDP0GyLPZ0nrrXjQaad51yo+OdoVLKAuMZVzXaDDJGhZ8fKmEPp/c14UTndJNUsdR8aMM+f2qLyxuKFjSUOF9rfDrjQXqA4cT3B7MmPA3q/v0GhI5xeQjuPP5W4SoqRBbB8anIagsROSVvYY29YTp3iKHgqGGznSiBkat3TgKNWXaMs3vSIazu/xkPfjhdSW0Zz+6e1kZc06VaC9nPQ8PWZTsAmjmevk2K6L3alDcJoMTkgYkqB7QK3Pl/1waMaCNkJ8LEFpA2dVIuDJ3APkZfSCJ1NK5eCBsFhnx9+p/pyA1fjUmGsH9+6bzO+RzPa9Ggluf3JraCs/HpDTv35K6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8W33qQcDznwUN2tLVyPbU4Juq2m810L8rzEfP7XtZQ=;
 b=YccpxWOmcEcz//9pKdZhSC9S2xPWVlsnHGtKC7uVNqdlgGG2UwO5EVuzwEsFBCOgdJUV8izT/4OF5gJ1mIJ2+t9/HvKqVeL7AzWHiGepw5eXr0KqlyPOozDn5czFU5Ji0j3kcBJXY9DSzWZMchxEPEgJeb5MeIasgK7bvPlhFyuvvawQTIkTXyFfeOK8HPbaTHIismcs304QttOWuGJ6fCI5Bp39ihrJxNWHLYUHvWn6Rp8nHHwarf5p9GXglCwGSqdFD98QuRzZv+Fyaqx9bc7GtC0jp4FqemtSBzoriUtgsY298DIYoMy/v9VP6SeL69meUNH405izY/xFIlgDPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8W33qQcDznwUN2tLVyPbU4Juq2m810L8rzEfP7XtZQ=;
 b=Az3Md8zBt7SGdwmcY1+f7he6/Kn3rYYwl4obyCFN3XIzV49OA3l7ZGJBzPcsvXoFNIzp0Bt2ZPBLqxBOVJk0ExuEvkzzo5X4ubHgSrXcbrT8uAnrsfcKKplNGJXdyRVM6rtY2RdXKt2sos+A2lC8cH0voSD93S9O5moZm4bc0pIpIc/mZ3aOLa37LQLyK7X1ifiX/aWhbai10vPzqkO9qGltWv1n5l4ERYk/DR0znUpZt919rUzmdaDjX5wgItQy9Eo/7B3CTnTL3hnkwUORdVJG7nlWzyETW2kHJJzPYozeAOspHk8T/rfhIRWrFUNFX53r27+Emo7Tuc0d08vG3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1ea21e87-cfea-5378-091b-1d7358c9431f@suse.com>
Date: Thu, 21 Jul 2022 18:00:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 02/18] introduction of generalized boot info
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-3-dpsmith@apertussolutions.com>
 <39c02342-649b-1f9f-f685-27efb7293c69@suse.com>
 <73cd6f59-a9d4-8767-6732-0eaae851d8fe@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <73cd6f59-a9d4-8767-6732-0eaae851d8fe@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0accfb89-cd1c-42c9-09a8-08da6b3212fc
X-MS-TrafficTypeDiagnostic: DB7PR04MB4314:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+fd4g+SZP+GeB1bOhNcsQk4xN86njL2lGK50Qxwf2eVnQY1YrAWzrtS6s2vDguN7wF+ANjwyixAePmfENumNjNSWMx3VwQZZ0gOAW3toAeT/7r09uBUPIRc+DfKNZfiNy8TWt6lcSXGRQuMHsRq+Uo/Z9dImhH/8F5Hce1MR1kpxZIfMnzSuozz6FU1zKDUI43x9iHBRQF3vfM5C+2W8+gTK8I2kWo8bmaEAsos6sJn38WGW7BFcepDG1lk8J4XTAGSzX64NKOL/090YK5eLhHJiNtmGeUiz/8MpyH1DISMgE0Mjt5e4VYppvDrSlZrQorc9ThIOfketuy3JtAqpmTMHjjmnfAo33qoL04Z4UKQSBFGJ2UOj3aB1ohFgPpAMBCxNdVreo4/dB5+Qu/TWiYEc9xu/rh0a+V4Ia737uB3nqgg3jOWY5TL2p1NqEloKmeO1HM4JuTPfJ6DfmS5D00b2GDxSoJQjMLtVr9YfgsCdbLE9wn8M4+MyztRzryKOdQLF4E+KuTVSRBJMDh3HLa4UIam+jCnw4OO1imFcXqnrZDQvDSHYKfbCId8nPXcLpqlynmBgSPPRaRPNldi+AAAAu4vQllWUEB8cUr5ES29i+u83lCgAmLkIiwwQYOt8qyLB174u2JLtq8NeQaiaOSBJLkLlLzU5wrLJDve/eIJZR09tiYuz64lnl5CJLSxIf4211qpUftuGvAZLITouIvPtBVq0151ERQhjwps0Leod87Wh3Tkvqpn4ihlWsx0dC4CYDur0S5m5LZNom7Um5iOwbBmm6DUaEgV7WnhDafqXFKwGuZOxsvnid0uq/LlzH1mYX+VZaLu6+tnauzqegA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(136003)(346002)(396003)(366004)(83380400001)(6486002)(478600001)(7416002)(2616005)(5660300002)(8936002)(6512007)(186003)(2906002)(36756003)(31686004)(26005)(6506007)(53546011)(41300700001)(6666004)(316002)(31696002)(86362001)(6916009)(66946007)(38100700002)(4326008)(66476007)(66556008)(54906003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjFFdU5PZWRlS3l6dG1Vdm9IZlVUaXByMXhVZ1NNQ3pHeDlHTFRwOFVnUlBz?=
 =?utf-8?B?VjVPbTV0ZGNTMmpCOHZGY2RjNDJiUWZaTkV3NXhoTDlxZy9FOEoyL1hOQXpk?=
 =?utf-8?B?Z095TithNFNrSWRINEdWMTY4TXZjZmN0NEZGY2ZoTCtDdVlPUWNqdm92QTJz?=
 =?utf-8?B?OWdyMW5qcXpWM0tFVVdOYzkzWWVTbnBzY1h0MEUvNUZSNjYyKzlzOGlVV0hP?=
 =?utf-8?B?bHVJTFVISE9uZ285bTBjcWM4ZFJzckxxRDcybnRrdWpzRmhZQ0U3OFlxNnlB?=
 =?utf-8?B?ZFFHdzVocndFUmNhYm8vWUxqS1dFWm4vTTNlYzBodXI4S3AzK0JGeGMzZHlB?=
 =?utf-8?B?VXgxY0YxNjNieVhTeGhIOHNBNEpncUdCYXlVb1U2cndyYU5aY2NYWXV6MkZE?=
 =?utf-8?B?QS9wWVFiVTZlMWFrTVFCTmcvOHpXTExta2hrVlJwYjdXTE9rcVBQa0d2d01m?=
 =?utf-8?B?ZDVqUDNBYXdzek1RNEdMREJuUDA5UTZkRTkrSndOSmgvcmdyeEhwclNjUW55?=
 =?utf-8?B?Q0hsQngyUUM3eFpRTlF5RmNJM0U1Sm4vOE53MkFYQnpLUHVDN3M1c05PVzBU?=
 =?utf-8?B?M1NrY284VTBHUVlEeTdub1ZEMzBva1BteEVxRWJ2SWgwYUpBQnRrQ1pZL0gv?=
 =?utf-8?B?T3VBSWQyNitBUUZwWWZOb2kxQ3JNYXkvTEh5R204ZFVHRCtqT1dKSXRZQk5P?=
 =?utf-8?B?SllXZTRLbnQzcHpDcHhDNXlhUHJxd2JjR1dJMi9hRiswRUkyUU1IMG45bUFz?=
 =?utf-8?B?WGlwdXFMTUd6dngwR2pYeTF0N2lJTXZYeDZCemhuRzRmMW9TZFFzTklQNmlq?=
 =?utf-8?B?Zzd6V1g3VFIzbU5DTldsVGlxbjlXOVo4UmNFUnBJRlFHZXYwaE1RaVM3K2dV?=
 =?utf-8?B?N1RVTWVWSmd1SWdZdjJWVUhTWjhiSjR1dHNPd0NKQ1JmSUlxc2VFVXJrYlpL?=
 =?utf-8?B?RnBDUkUweWZ5akVXMWNWalZxV1BJZnpiUmtxbFhkN0NhM2F5UWlvUytiZzlY?=
 =?utf-8?B?dkR1V3I2Rk0rbGZsRDBtdmpOS05RK0t1cGJUS0pQTmJQM2hacm4zQVVCaGxS?=
 =?utf-8?B?OWxXTTZIYlNuMGdIUWk5SnRGc2xMZTZlSUlRaElvSTkvaE1hb25SY0UrcTRp?=
 =?utf-8?B?aHlRUk92SUJjTnE1VXdFVHgzaVppL2FpTWVnWXJIVlZOb3l0bjMvYWxHZHZB?=
 =?utf-8?B?ZkNiMzdLbmh2VmdXZ29YSVJKWGdSWlpMN0RRNXpkS0NUUThKeEdTRXhaU1Jr?=
 =?utf-8?B?WFlkMVhJNjhtS0RwUTZ6VitIeDJGNlVMNnNmZ2ZZeGlTV0NITkRhWmZ2Nnpn?=
 =?utf-8?B?RlgwRk5xWm9tNmpIVUFjQUFhVFpPZk5VYnJxMmlUeTV0R0x3YzhhNms4TFl2?=
 =?utf-8?B?TlgwbVJyME9GWCtGblB0U1Y4K2tydFl1aFBnZlI4VVZsZ2lEVm1IRUJxa2Fo?=
 =?utf-8?B?UVNJbkFHSDBDdERRWFJZeHZzNUZZZ3NvNGV3TVpKWDdCTEtzZEl0ZTZ1NUNB?=
 =?utf-8?B?MEFrR0ZjSVg2RndVMCtPZVlML2tGU3dNb00xblZFMkJWR25XcDlVanV5K21S?=
 =?utf-8?B?WjBORGV1cXNJTzgwREpCT1dobUdqRnRKczl3ZDJTK0F0U1BRNXBlVnZqVGRm?=
 =?utf-8?B?dkh5Y3FpRjlVUmxRaGtNWEJnMDZ6TkN2YmpYZGkxcnJ5VHpNckdsY3E1cVp4?=
 =?utf-8?B?TGZWWjEzdDVncUk5ams5Um8vT3ZhYU52OVF3T0VZNzk0U3MvQlJJMVVrbCtu?=
 =?utf-8?B?dkJIZnlDblE0TXdGRDFIVHNwa3NhRCtlaDNKK0o3L1Y1dzVXTGZwZ0tkUm9S?=
 =?utf-8?B?OFNFVUhzTW95MnFqOTZ4bnpaR0srMkZ1TzBBOHRVemoxNGRLZnM2bnJ3MlRP?=
 =?utf-8?B?cFBndG5FUVd6UVdBbFZqUjN0eWI0dmk5YmZQYVJvSzBnRGIvRHAxTmk0bDcx?=
 =?utf-8?B?OUVDNkQxR3h6eGtYNEVkbDdlUjJqenJaYVpUZmV4NFNEbmFGOU9BT2kyQ3hU?=
 =?utf-8?B?cWgwZVoxbzhQOXFwWmFCU0pJZFMzeU1PZkptb05URzRKSitNN1RYQzFyb05X?=
 =?utf-8?B?L29aRnZCb2pxUEdPUkNRY2VBVktoUFBSZmsxQU1GazdSNVJiaSs2Y2dqNVAz?=
 =?utf-8?Q?6iwnT/zvD2KlfP62tTq/y3yZ3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0accfb89-cd1c-42c9-09a8-08da6b3212fc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 16:00:03.8796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOSz1CXVcyjEj1gXnUyvHv2b2Mpf9YkZpndtDFvc3g7moG62/1/az+ZZO+OIJNY9ZYrAzeNSXCqpsayUMR5SSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4314

On 21.07.2022 16:28, Daniel P. Smith wrote:
> On 7/19/22 09:11, Jan Beulich wrote:
>> On 06.07.2022 23:04, Daniel P. Smith wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>>> @@ -0,0 +1,48 @@
>>> +#ifndef __ARCH_X86_BOOTINFO_H__
>>> +#define __ARCH_X86_BOOTINFO_H__
>>> +
>>> +/* unused for x86 */
>>> +struct arch_bootstring { };
>>> +
>>> +struct __packed arch_bootmodule {
>>> +#define BOOTMOD_FLAG_X86_RELOCATED      1U << 0
>>
>> Such macro expansions need parenthesizing.
> 
> Ack.
> 
>>> +    uint32_t flags;
>>> +    uint32_t headroom;
>>> +};
>>
>> Since you're not following any external spec, on top of what Julien
>> said about the __packed attribute I'd also like to point out that
>> in many cases here there's no need to use fixed-width types.
> 
> Oh, I forgot to mention that in the reply to Julien. Yes, the __packed
> is needed to correctly cross the 32bit to 64bit bridge from the x86
> bootstrap in patch 4.

I'm afraid I don't follow you here. I did briefly look at patch 4 (but
that really also falls in the "wants to be split" category), but I
can't see why a purely internally used struct may need packing. I'd
appreciate if you could expand on that.

>>> +struct __packed arch_boot_info {
>>> +    uint32_t flags;
>>> +#define BOOTINFO_FLAG_X86_MEMLIMITS  	1U << 0
>>> +#define BOOTINFO_FLAG_X86_BOOTDEV    	1U << 1
>>> +#define BOOTINFO_FLAG_X86_CMDLINE    	1U << 2
>>> +#define BOOTINFO_FLAG_X86_MODULES    	1U << 3
>>> +#define BOOTINFO_FLAG_X86_AOUT_SYMS  	1U << 4
>>> +#define BOOTINFO_FLAG_X86_ELF_SYMS   	1U << 5
>>> +#define BOOTINFO_FLAG_X86_MEMMAP     	1U << 6
>>> +#define BOOTINFO_FLAG_X86_DRIVES     	1U << 7
>>> +#define BOOTINFO_FLAG_X86_BIOSCONFIG 	1U << 8
>>> +#define BOOTINFO_FLAG_X86_LOADERNAME 	1U << 9
>>> +#define BOOTINFO_FLAG_X86_APM        	1U << 10
>>> +
>>> +    bool xen_guest;
>>
>> As the example of this, with just the header files being introduced
>> here it is not really possible to figure what these fields are to
>> be used for and hence whether they're legitimately represented here.
> 
> I can add a comment to clarify these are a mirror of the multiboot
> flags. These were mirrored to allow the multiboot flags to be direct
> copied and eased the replacement locations where an mb flag is checked.

Multiboot flags? The context here is the "xen_guest" field.

Jan

