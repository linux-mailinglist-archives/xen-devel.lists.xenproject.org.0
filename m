Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F8959E51F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 16:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392015.630127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQUwp-0003Zq-Hj; Tue, 23 Aug 2022 14:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392015.630127; Tue, 23 Aug 2022 14:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQUwp-0003XN-DW; Tue, 23 Aug 2022 14:32:07 +0000
Received: by outflank-mailman (input) for mailman id 392015;
 Tue, 23 Aug 2022 14:32:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQUwo-0003XH-5S
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 14:32:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bc0cad4-22f0-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 16:32:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5337.eurprd04.prod.outlook.com (2603:10a6:5:1b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 23 Aug
 2022 14:32:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 14:32:01 +0000
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
X-Inumbo-ID: 5bc0cad4-22f0-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cv9eH1Xc66bon2Pg/gI2n6CkjVWuc39XhLnEEhzhLi8YuCLJKUod90P4APDIMkRcZa0++T+3khK6lkAG399QgI1kHIjLCUCh9gYL7D/KoZr+9+SejQg8PaoN73rUpoWbiitceg8wkTWkw7oFNV6pa8AzrEDeYDwZ0Wr/4lHqSq5S8pS/DM5UaFloxWdEOufoPAdIaevdwY62G/GK22KxhzEgRydevdmwYZNLgDIgEbvEnFQCMExx7oSQc+W2wngVN18ib96SGpNrcCzLLlytp0oJzdEkyq+I7kb8a68Xt2OWH8PXD/P4F+aolnbSLW5GarI8qZ7wH7YP+SaAJBOApg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLAxPaJh4V4gDpf7W0JAhRFKiH0NVbXs2nMsq9z3QKM=;
 b=T0PvxLGxSneVqZWsbDCS+C8jtjnCS3rtVjm9fF6/7fWE7SKhjX5MOiV2UK82UkyRkuXHp1YLv8Va2rE1DIx+mpgPWqYKhea49zq0bO0AzGLJzQUfUaIU46iqueaFQLhSsEPgZz16TDB7/7mcOQbzXv4hqHKzc1Bk0P0KLVEnW7MGq6FQ2t6THlsU865leFcoXE0fpl97j3tqUivnuGawRAXeUw0URHw1/3+9yoDutb2f4A4chawp9AMNdi3oUWSC0rbUcKZmoFnwnALkl9anyEB54yyjcp0kLiGW7dZ+Wlke45zzE+IDuQqMtdoTwXM2USSJqWBI2zWq5nimcd6XFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLAxPaJh4V4gDpf7W0JAhRFKiH0NVbXs2nMsq9z3QKM=;
 b=VbH0Nefry+UxUmxRiJPmT1viN1KqAR847/H4Mi1vBnBh+A++2XouhpHUlXVrb8fbEzwCbgm0Q0IuhhWUwTrOJvjxswgtacv9pxMeXhXZKC8RC+SPwPt9XLvLKBPJSZRR+5HF7uXQ1VAVUdG285oOX1Y5jG8j/bazTfVarRjZKWIu97ANSXua9vAD1oFgqV2F3TTQh/WNM4UBB9SPS2nWihOgxhaqqhVMTVNIiAb1L7cpS6OzoIvWU30ak/peqUbIfvqCx27/9aVC4GnXIlWnNQtsnVYUQxoJF8gr/erjAbk7FtDjNYzu+eZone7NDmtnpzL3SyMkmfEQ8/Dl5LxMeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74994bdd-8c70-7f5c-2146-157a36c843a0@suse.com>
Date: Tue, 23 Aug 2022 16:31:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH] libacpi: Fix cross building x86 on arm
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c3d431217010f669de809a76c2f1c15a0313ae53.1661246753.git.bertrand.marquis@arm.com>
 <844e0164-96b1-8a56-a9c0-0f432b9e648a@suse.com>
 <B2DC2AC4-E59C-4C96-8993-D4812D73E799@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <B2DC2AC4-E59C-4C96-8993-D4812D73E799@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26180034-3251-4d29-457b-08da85143e0a
X-MS-TrafficTypeDiagnostic: DB7PR04MB5337:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cUAsy55RU9axPQp2O90Ugc84kfGrEW95JEYq5wkM/GP9kWWuGemqgYAjzxwcyHQHsfu7ZgykIVp16QPJK7xQL64u6NWzMEy4DDtuGEhnOil66I76hThkHbBsKKAHFYCV/OTxhBAu1az9PH5DyLZPmYbefIFpNn7epv1oc9x5HQBBavbz9pYD3Fcc976wbnylIY0CIqutZhm/4p/c5MAB1XMPZEK2VU+kUaWDEcBkBvI0pT5XTnd8/+T1KpCs2XHgjZDbtFVqymS6M5MglWUtT53KpWoLKtZ5CzLutevcUKUzatii1bEtIeXhk8Dl63raAkuFHg/JyCtMQp7y5Al+ICasWD2T1gx57Hv64oMVq5WaPcEzpTErP04xNpDz9yoUJmyJ2eUD++zuP0XS5KhWZ1PTxfEWuyj0vy1hi7KSb5Cr4UgnEVTSeXFaau5UxbPslOtXfHr4E5ZJCgVsV1A1/cXDPrpEAdGiZB8dJ/8V+bCrSKudCYPyhMEGJkilSFxui+1oJ24gLyumEwlzfpJEW3r1UvtiTzAfC6yKbAHYyDrIUAluhzoxwEDxoyLMnnAHp90N5RDRp6C2Mtj4oipth8o9S6S2nuCiO6THB7GVzGiJW7FxRnvrXZbZy4Q7s+exlMswmN/rJhz4CoU7B9GFonQ37r/l2ADCxUDxpCSKGlN54YwgS8oZKJ6XocQH9f9/VyFoVZ4C/bGq0Cpz1DbVU8DjDh9PZu3S7uyBiuxyPvuRqMnmDH8stONPBlgLU17op1cyuibYg78i4QKPMP7padK2MLhTUvz9ooutZBSOEoI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(376002)(136003)(366004)(39860400002)(26005)(6512007)(6506007)(53546011)(2616005)(83380400001)(38100700002)(478600001)(186003)(6486002)(8936002)(31686004)(41300700001)(5660300002)(36756003)(2906002)(66556008)(66476007)(66946007)(4326008)(8676002)(86362001)(54906003)(31696002)(316002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzN3R1FZZk54VHpKKytrRnBJQ0pVbks5cEU3RktVK3o1VDJLcjc2aFZ1TWVz?=
 =?utf-8?B?QitWQWJFSEQ0Z1lHTmx4dTZ6cUlRdENFT2Z2TU1TNjdwdFZJcjVkODFTaFpD?=
 =?utf-8?B?L3M1VWdkUHRvV1JYY1M0c2VFYm1sckpvSnhJOU1LQkxjamJzelJBV2pmVENS?=
 =?utf-8?B?K0h3S2ZodE50SUlvVVZ4MGVSS3psd081clhqUzZiRXJjLzQzTG5neGlDQ0xt?=
 =?utf-8?B?QkZBclNUUzZCeHJLaUgwdDhLNzRsblhWSHBVeUtoMmljMHRUdXpzdWh1QmZm?=
 =?utf-8?B?M2JueUppT29qVzUzNkdxVndPbzY4K3lPQ1JwbXpWZzRIRDVWMmJOTzFReUZB?=
 =?utf-8?B?aU5tUmF1aU8rS050SnNhVmZCOEdyNzV3anQvaHZQTnptUklXcWwzZWFreDNR?=
 =?utf-8?B?RGMvYVRKU3pVVXM2cjl5UDlZR281eE9CeGxPUUppdHVjVGZ1bHVRT0E0SFM3?=
 =?utf-8?B?OVJBUHVGWktCQ3E1TTNyLytuWVR1VWgrTmM0U1NKM3p1M3FlU1JtZm5vK3Ez?=
 =?utf-8?B?NEV6eW9sdWVnRm9pNGg1ek52YjBqNVdsWVlCd3d0Sy9ENzFQMXA0cnM5TlNW?=
 =?utf-8?B?OHpVVDArVFhuY0tDZTVDSEZRSms2bEI5aW5CSnd2ZlEvcENhUkZpSytMZEtw?=
 =?utf-8?B?dnVsald1OWVLRGQ0RFZVa3VpVzd2UytORDRqYStwR2tudVh6SnZzZWtqZTEv?=
 =?utf-8?B?WHU4OTU4cnprZmh5ekR0eU5HZm5aN3UxUjFOaUwzNVNaek4yYVE2dm45aW1Y?=
 =?utf-8?B?czlyZFJ5NjZzRW5HVGQzMU1tWlpkM244ck1TUUp1NFduWXN0Wk5NUmk4ZkJM?=
 =?utf-8?B?YjU4dzBVUW1jT2QvMnp2VjNsRDlXUDFSQXhWTG80Qi9WdGFmMllxb1lESi9q?=
 =?utf-8?B?bHJwMzVnZ0RVVlo4VmJNaFdsS3BIUXhjdGVrcDBmWGNUZGdIMXRtOHBjTGlB?=
 =?utf-8?B?bEpaSnIzYmxFWVJUZFZ4NGorZ29PUjBBc3FHUG5QZkdVTVoxby9iNmtldXcx?=
 =?utf-8?B?N3hZYVMyc3ZjdnV3RllCMlBjVGVSa0d2MVNUTk03dEFLTGdVRFJZSnA3b0FT?=
 =?utf-8?B?ckUxcU9wdmdmcjNHNENTOGc4cHB4WCtNUzhhN0dsVGx6a1pLN1NnUXFOMWhl?=
 =?utf-8?B?a1hYYmRFaUNxc3U1aTBhUVJpVEc2YUZ3djJkOHNzcDkxQ1pOdktoNlM1WEUv?=
 =?utf-8?B?RVJQbXJCTlNPWUkxZ0V4anBBZW9HU1h3dGI4S0FDaVVGWFNXK3lINCtSaEp6?=
 =?utf-8?B?alpkWHFOY1ZNVzdmZTh3LzhGcUhIK3p5K1A3bkg3VUFPNUdwUlB6Zmo3dkZs?=
 =?utf-8?B?ckxPd3lpdnM1MzV5SnpCNHlQWXJFN0tsQkplNENIbm1UMEJFOFhiblJCbXZr?=
 =?utf-8?B?eW4vdnQ0bTdMWTUrY215TXZSVnZNNW1KcjZjOFNXQWNHbG5QSjNBVWlLOW45?=
 =?utf-8?B?RzhSdmVRQTNiZHN6akFoM1VySXV6YXMySFdjNkJNU3FZaTFvL2JDdi9lYzRh?=
 =?utf-8?B?RkpsSCsyUXdmQlFZZUhCSDFTMWF6djVHMjRMVGlxOGZqQ2xDN0ZlelVLbXZU?=
 =?utf-8?B?UkJkVC9mM2htZjJPaXcxY29GZ1Uxak15dXFlVk5ZdWE2cWx3ZGtIZmUzOVJa?=
 =?utf-8?B?aVIwdGgzVXdNTHBFdmIzRkZWSmdyMlRTdnZ2U0VlaGRKMDF5OGJESFlCMlFW?=
 =?utf-8?B?RWR5OVFYTXpnZkM4WEhjWXlWOHBqNVlmRm5XT3ZLMWJQdDF6SDZ1U0VBVklO?=
 =?utf-8?B?MmdRYW9wSWljVWdOVCtXdUxxa1B5MjN4NDRSYzlGMUVxM2ZDbTQ5UDhLeUpp?=
 =?utf-8?B?QmdYWS9ZOHQ4Zy9iNFBxeDJsWERKNVF5SVV3VU1Bc0E4TnRBamRXdnhNWFBH?=
 =?utf-8?B?VnV5R0JHNFNFNzhRN255R1dZNm45N2EzNEFTZHg3azdJaEVVdVEycTd6Tlk4?=
 =?utf-8?B?bFhaWkU4NlJtcWNWd3pBUlBjZEY3T1NYM05FOWFEK05VNzBsajJsSG16MFJ0?=
 =?utf-8?B?NXVoYWFDU1FqWmNSNk55eDdyWkU0cXZKOTYyTE9DSU1iYWdjZlJ6bG9IckdP?=
 =?utf-8?B?bVlRTjd2MHVnNExuNUt1NjJZR2RHMjU0NzVuYWE0bDlrcmdadUx1UkhyQkVa?=
 =?utf-8?Q?jZQ2J6sea3rVlbr48hw85k8+O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26180034-3251-4d29-457b-08da85143e0a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 14:32:01.4453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrll4urJMLjscGTsEgdIO1kQ+2C1eQPtpVuwMeSrIBjCEoPR5s8L3ki62T0FspasFsbKffYH7n4+3f3iAXk6gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5337

On 23.08.2022 15:34, Bertrand Marquis wrote:
>> On 23 Aug 2022, at 13:33, Jan Beulich <jbeulich@suse.com> wrote:
>> On 23.08.2022 12:24, Bertrand Marquis wrote:
>>> --- a/tools/libacpi/mk_dsdt.c
>>> +++ b/tools/libacpi/mk_dsdt.c
>>> @@ -18,6 +18,16 @@
>>> #include <stdlib.h>
>>> #include <stdbool.h>
>>> #if defined(CONFIG_X86)
>>> +/*
>>> + * When building on non x86 host, arch-x86/xen.h will include xen.h which will
>>> + * try to include the arch xen.h (for example if built on arm, x86/xen.h will
>>> + * include xen.h which will include arch-arm.h).
>>> + * To prevent this effect, define x86 to have the proper sub arch included when
>>> + * the compiler does not define it.
>>> + */
>>> +#if !(defined(__i386__) || defined(__x86_64__))
>>> +#define __x86_64__
>>> +#endif
>>
>> Besides being confusing this depends on the order of checks in xen.h.
>>
>>> #include <xen/arch-x86/xen.h>
>>> #include <xen/hvm/hvm_info_table.h>
>>> #elif defined(CONFIG_ARM_64)
>>
>> At the very least you will want to #undef the auxiliary define as soon
>> as practically possible.
> 
> Ack
> 
>>
>> But I think a different solution will want finding. Did you check what
>> the #include is needed for, really? I've glanced through the file
>> without being able to spot anything ... After all this is a build tool,
>> which generally can't correctly use many of the things declared in the
>> header.
> 
> As stated in the comment after the commit message, this is not a good
> solution but an hack.
> 
> Now I do not completely agree here, the tool is not really the problem
> but the headers are.

Well - the issue is the tool depending on these headers.

> There is not such an issue on arm.

Then why does the tool include xen/arch-arm.h for Arm64?

> The tool needs at least:
> HVM_MAX_VCPUS
> XEN_ACPI_CPU_MAP
> XEN_ACPI_CPU_MAP_LEN
> XEN_ACPI_GPE0_CPUHP_BIT
> 
> Which are defined in arch-x86/xen.h and hvm_info_table.h.
> 
> I am not quite sure how to get those without the current include

1) Move those #define-s to a standalone header, which the ones
currently defining them would simply include. The tool would then
include _only_ this one header.

2) Seddery on the headers, producing a local one to be used by the
tool.

Jan

