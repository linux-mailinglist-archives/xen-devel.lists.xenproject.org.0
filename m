Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF2F671D88
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 14:20:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480593.745083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI8Lz-0001ga-1h; Wed, 18 Jan 2023 13:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480593.745083; Wed, 18 Jan 2023 13:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI8Ly-0001dk-VG; Wed, 18 Jan 2023 13:19:46 +0000
Received: by outflank-mailman (input) for mailman id 480593;
 Wed, 18 Jan 2023 13:19:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pI8Lw-0001de-Um
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 13:19:44 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2066.outbound.protection.outlook.com [40.107.104.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4cf1479-9732-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 14:19:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8013.eurprd04.prod.outlook.com (2603:10a6:102:c4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 13:19:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 13:19:40 +0000
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
X-Inumbo-ID: c4cf1479-9732-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5KgBgdJgveG0rtT3H/sfHJ06Lsn20ui7tnbz8b1KkeAqeQav0DLe3ipe5uXbMyZHfYj3itGWZzfNAFEN+W59ebuZdAOD1Vqj//imqyUEXT0Bx6DHEkGN1XiUIXswu3OkHfDxPlrmM3X8XhBTRyAu5L/AlyE+/qRiPmNz68W/Giu1EJM8hw5J/OgSJpFnuBAQCnw2ktnGM8lDyjqu594YAdSFnuAgIJ87W0eyRY/lFxR5aMXvyrxcnPKm/fMHDlKr23U+jjR3wJs1+uM+Cf8wx9prorvwd8CtdAHoLycxyhqYl71bj5C4H7yD5kAWUKDs2t0ftj5ZMjFr2JxOgZo6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoPqFuxgEBpoGbs8h5qrQBBjM/5l5iN5ReL6J3W81MQ=;
 b=SzbGWnUURp3VFXUbifT8XfYdbJxNPCjvnkOfr8tAscBMmW/0iHBAal1hbB1+vTDGPKIN8vLMa8841i7ZlfRSZqfGWRKCQeGkuxtHGgZxtTrJj2h7N+eUFbsRuGTCxcLh716Fu0pvALDz+8+iqKF+KKu2zMsrtR32RmO4deqQXU6jcC3hGa8z8rhW6xp1WHKT7nb20N5cM+Wav+d1XQWS6NhcJI5datGJcgciUraHlxB4qXAJvIUG1aaAJq/Z0V56/OWEoFTH0A010UZurn7mB77wl0tTvWFNtjQfYOTbKJexvQ7v8PTsU7G7LTYhDUZkQqW3CY60Zh2NBNoob5ZSvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoPqFuxgEBpoGbs8h5qrQBBjM/5l5iN5ReL6J3W81MQ=;
 b=pqh5gX8RZC9r1uJA3nlSr/cA/eWvFKaj6RZ6gN0awRFj2UnKNAJpEsq+Yy0HV/vK2rISLCqf6LrlmSzFvC0jEMY7Y2NcZ/f7S19CLhI07aP6Mlg3iU7Esgi0kxWr7bO2+Kk2mG01fReGlwE7niWOyOxcq/bjVKvB1ynsVlNVM3rnpGyTBwS0crlUdSMLnJuhj3rK+De+IukFR4/WrjsgJZcruzsJZ6PiLK0Xy+DJRCDJI3bl3EFrZOiVwiLWgM7MurFW9ER7I1XYacpXy/dR2TjutcTPQbUpjxMNgA2zxBebq1BRi3ZGaQTTxJ1iOH47ql8IV5ggjOlIzdsOdhp3yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea32fa45-5de3-d229-8c22-913ef0513bfa@suse.com>
Date: Wed, 18 Jan 2023 14:19:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN v2 09/11] xen/arm: Introduce ARM_PA_32 to support 32 bit
 physical address
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-10-ayan.kumar.halder@amd.com>
 <49228d15-3f0d-eb89-6107-40ae9f0b9b92@suse.com>
 <376c32ed-2e9d-a81a-69a9-8ba6d54f603e@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <376c32ed-2e9d-a81a-69a9-8ba6d54f603e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: c5670667-aa9a-435f-85ea-08daf956a7c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AckbVBzHcP/QsCFXmBVfhADD1KjaQ3upeBVLY5CaBXFk03PCmzqcldxPxsIobFgI8eFkh3idFDiJbXq6pXFxZ7810ks6eZJBcLY3/9Oar8t9JOvEcSKYL3AHqFmf7mLuqOm6e8iz8HPp7/eAEe19tDUeq4DXtKpGqjICKQ4dTBe/sWphCVjOaF6FpoT/29WkrhJsg4wGoDyHOdD9gBsWe+58WiLSE7sl1olr3LHoJCfVoM1YR61QuqiHvy2CwB3LXoXmoYR3V2SJaghMsdaIP5q/u/wjngxUwvMZ7dlDS5HNCH+UkD4y//ctx8uMVEPqay6L3KeudRO3HeQi/ybnWedidBFAC43Q0NWl8LrEeBDPXeSJ9B+ENT/zTyuefdPUOMu/HE+vkvRlAletZSWtELuFDmzD3drNLy23+BvATpk0Y1PjXX8d9g82d5uG/pwO2KbJFDYmsB0LC6BpB6ZEWdApJacKlOQmLqN80y+Fz9N9UPgkjUNzDNxEQrRCJNrgyom3E+r4uKj5Z+1ixRshpJVaQt/AqHMs0y7gschZXz09i6PkjHzY/cENkpAtbM6VIjh+2jud3CRdL9zUMKwihjIDDZz7h5J2Os8GDxt7yHLSIEF5kEcRkpiDXNqFX0rKiBZ8fQEw6cDzEZnambYTdTgEM+R8nUqDN+k2INenQ7/XbvCxnuMkuZqdihvWtLIrHLF4CzWK8eryW5hbImmzDTFunq/35WohowKqVn1qiGc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199015)(31686004)(66946007)(2906002)(66556008)(8936002)(5660300002)(66476007)(31696002)(38100700002)(53546011)(316002)(6506007)(6486002)(86362001)(36756003)(478600001)(8676002)(6916009)(4326008)(41300700001)(186003)(6512007)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW5oRTlaWW9yQ0kyWDFsdmhsaVc4MzNmYUtIaFhKMUlJMVJjeVB3N2RvVVhK?=
 =?utf-8?B?ejVXaFRmZzZuQUxsVnY5ZnoyZjJzbURjOXRIa3VWTFUraFZNUGZMS2tiWmc0?=
 =?utf-8?B?K3FUUzRaK0RRaitNcW9GdElCWkxBKzcvYk5Eazc0dENia0VRaGgvakwrRG5i?=
 =?utf-8?B?U0FRU1lFdGp2VzJLa1NiZllIRVlYZXA2K1RmR2RiNmY2WElXMkFVaTVqUXVU?=
 =?utf-8?B?UnF1MWFGQlB3WXRjc2diODN1dEJKVTNZcFNPVkVzSjh2TnBKRmN2cG10YUJn?=
 =?utf-8?B?SXJCYWJQRHlTMFdrQTFFc0luaGpheFFQQThVNnU4WTdyUEVNalk0Rk0reFhp?=
 =?utf-8?B?aVFjSG5xeWwzUGJDRnRCRzRCNTFyVVAxM0w0SnJkUXZIWlEvWGg3Nmd4c3JB?=
 =?utf-8?B?YUxNcm1Wb1R3WU45UDBsbUtCVjFBbkxIQ1h0OFA2dnRrZFBQck94NWk4M28w?=
 =?utf-8?B?dnVpM09sVE45VjJJODVkamVTM21BMElwTkNvWllwYVI4R3JtTG1GMU1XOFJX?=
 =?utf-8?B?YjU4b0tRUmZyZ3lrQnNSUjNTUUpld1VoQW1QT01CSzNTbU9jbFpQQ0FhdDF4?=
 =?utf-8?B?eFRleWRxaTBCVytkZ1YwRWRHMnRRS2xmcFlGWDd3K0lYS0lBZnk3TVFndU1H?=
 =?utf-8?B?blZlcHZVT0IzQXJLNGZMNytLK2FWbm9WZGlUSGdsdE5qbEJ1ejlubmVYYWdn?=
 =?utf-8?B?RUFoN2F0RUtuUmhCcGh0THZOc05ObXZKVGxqdFB0amNhTFBOcDJLZS9JUjdP?=
 =?utf-8?B?elBMMjZ1c2xIMko5SHl6QTArLzg5amN3SWlaZW1Bd0N4WHV4UEk3KzJqakVv?=
 =?utf-8?B?MkxNZHNCZUdEQkxpVDNlWnY3SVMvMlpBbXJReDVkc3BQYmxZNTk4Y2FuanVU?=
 =?utf-8?B?V21YckdDWVh1dHVvUlN1RWdYRUZqNFcrLzBBS2xOTGN2S3NIZEg4Ymg5N0hO?=
 =?utf-8?B?MWcrUkI2TU02Mno3amJ0VU1uRmRnNCtlUnNGOGJNOXNlYmx3QmpndFoyV1ZX?=
 =?utf-8?B?L1dzUDNrZmY1L21QajZnVDdwU0tlb0EvWXRrY0JlNy9oSDFoMWVxemVSVE1o?=
 =?utf-8?B?ME9heU84U2RQK1V2T3dWZGZyRDZ3aVRkTFZpNitEN2lMRTAvRjdEQzJlUDVU?=
 =?utf-8?B?d3B0UFNsQ21CSGNzZm5vQXpuWkw3VmdXZlRxVGRmOFRzenVOMGZQdXBqMjZQ?=
 =?utf-8?B?d0JxTFAvdWRjSFdvK1Ewa29YVXJwKzV4MzlMUjljVWs0WkpjVWQvd1NDd3lK?=
 =?utf-8?B?VW44cVFqZGFUUzBicVd0R1IwajBVNGo1VVlwOGY3UEpJTFV5cDBDNVV5M2RU?=
 =?utf-8?B?WitPYklHUWFtcHpIQjlHNXJtWCsvdU9DOVU0NmFkcUNsa3U5eFhnYlp1Tm40?=
 =?utf-8?B?c2M2cHMxVXJCUGNFbk01d3puZlJpUDR0OXhBbGVBOUV6MnNoYTI5VzhyZGk2?=
 =?utf-8?B?YTlkNEJndlhiVUhBbS9UcDFYWnc0bExDbFZjNFh5WjBLdkFzbVBBYVpEUUNi?=
 =?utf-8?B?TjJXNGd3WWZ2TVpya2t6SEdLY1V5dXZIc1hIbDd3dllsQXZjczlidGhEWE9F?=
 =?utf-8?B?eG5wSE1tZmpNK0c2dUlibGcvdTJzZzh2Y3phNm1SOWZNV3RWY3UwblNqOUpO?=
 =?utf-8?B?dGpMSjljbG9IWDFjS0VYS3FETjBVT0ptM1FaaE5XOXUxWVhPcWh4VERSVU92?=
 =?utf-8?B?OEwvenhyTnBjRHhtWURnOC9xMkN6SXMyTXBzQ1R6UHBKdng0SGp3bENXTUYz?=
 =?utf-8?B?Sm1uSHZ0aTJUTXZyUTk5YzQrMW5veHdFYVM2a1ljSEtFME9KbDJpN29UTERz?=
 =?utf-8?B?Y3NqT1laUzZMNlNwY3JObTlTOWhEeFVGd2FwV1JUSmlmZm5nK09sZ2lOVDY5?=
 =?utf-8?B?bURMbWYzR1Z1ZERWZmpCWDRkTis2ZEdlQ21lOE9KNktoUjFlalRqRERtWU1l?=
 =?utf-8?B?Q3k3VFhkWjd1OUZENGJ1RkpGeDVoS0tHc0kveDRqYTJUZytrRzRWaWgwOTFk?=
 =?utf-8?B?bHl2Qy9EbFp4Q1lwUjAyMHlTQmxSd1NsNVB5RHJndlV5TzhRWDg0dEtnbzRT?=
 =?utf-8?B?ZVM5bnRqMUxpR3prMm1XeWZGYlprMXB5Wm1VVlNJdlc3V0E2NURmUmI2M2dS?=
 =?utf-8?Q?B26BdRpVgfPO30MUxWoTZ1VNc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5670667-aa9a-435f-85ea-08daf956a7c8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 13:19:40.5817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EU0TeBnZu81y3/r+jGMNRDlIum3+HULrOofW+ZRVeOMnwdX6lrqZ/liUS3o5xmFihhK32eoSRQ8OT0ZJKFvWng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8013

On 18.01.2023 12:57, Ayan Kumar Halder wrote:
> Hi Jan,
> 
> On 18/01/2023 08:50, Jan Beulich wrote:
>> On 17.01.2023 18:43, Ayan Kumar Halder wrote:
>>> --- a/xen/arch/arm/include/asm/types.h
>>> +++ b/xen/arch/arm/include/asm/types.h
>>> @@ -37,9 +37,16 @@ typedef signed long long s64;
>>>   typedef unsigned long long u64;
>>>   typedef u32 vaddr_t;
>>>   #define PRIvaddr PRIx32
>>> +#if defined(CONFIG_ARM_PA_32)
>>> +typedef u32 paddr_t;
>>> +#define INVALID_PADDR (~0UL)
>>> +#define PADDR_SHIFT BITS_PER_LONG
>>> +#define PRIpaddr PRIx32
>>> +#else
>> With our plan to consolidate basic type definitions into xen/types.h
>> the use of ARM_PA_32 is problematic: Preferably we'd have an arch-
>> independent Kconfig setting, much like Linux'es PHYS_ADDR_T_64BIT
>> (I don't think we should re-use the name directly, as we have no
>> phys_addr_t type), which each arch selects (or not) accordingly.
>> Perhaps architectures already selecting 64BIT wouldn't need to do
>> this explicitly, and instead 64BIT could select the new setting
>> (or the new setting could default to Y when 64BIT=y).
> 
> Looking at some of the instances where 64BIT is currently used 
> (xen/drivers/passthrough/arm/smmu.c), I understand that it is used to 
> define the width of **virtual** address.
> 
> Thus, it would not conflict with ARM_PA_32 (which is for physical address).
> 
> Later on if we wish to introduce something similar to Linux's 
> PHYS_ADDR_T_64BIT (which is arch agnostic), then ARM_PA_32 can be 
> selected by "!PHYS_ADDR_T_64BIT" && "CONFIG_ARM_32". (We may decide to 
> drop ARM_PA_32 config option, but we can still reuse ARM_PA_32 specific 
> changes).
> 
> Also, then we will need to support 32 bit physical address (ie 
> !PHYS_ADDR_T_64BIT) with 32 bit virtual address (ie !64BIT) and 64 bit 
> virtual address (ie 64BIT).
> 
> Let's confine the current changes to Arm architecture only (as I don't 
> have knowledge about x86 or RISCV). When similar changes will be done 
> for other architectures, then we can think about introducing an 
> architecture agnostic option.

I disagree, not the least with the present goal of reworking xen/types.h
vs asm/types.h. By having an arch-independent Kconfig symbol, paddr_t
could also be manufactured uniformly in xen/types.h.

Jan

