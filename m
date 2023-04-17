Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E31EC6E42EC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 10:50:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521851.810798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poKYu-0003JR-Jy; Mon, 17 Apr 2023 08:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521851.810798; Mon, 17 Apr 2023 08:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poKYu-0003Gm-Gx; Mon, 17 Apr 2023 08:50:12 +0000
Received: by outflank-mailman (input) for mailman id 521851;
 Mon, 17 Apr 2023 08:50:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poKYs-0003Gd-Sl
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 08:50:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dafe2924-dcfc-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 10:50:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7439.eurprd04.prod.outlook.com (2603:10a6:800:1ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 08:49:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 08:49:40 +0000
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
X-Inumbo-ID: dafe2924-dcfc-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hi45ttHk1MOGWS88Eqg5EpBEgzlwDgNsRT4gQtwEk7LdlMt/h/r83r+oizzJ3JriBfwyCbCdxItZJsdZoOBTVrdZwxGLQLu1mujl6rmdlKGceWpib36xeaM4hCZ/WC/sObxj2w9oeUjjUjNkYUtrP/d1/z9oehQGptqVVSKtLNPEltmakP/ADv0WAo2kqJxen2i3oZ60HGokzT+tAHLJBKbjhn1wqvBLGP7vrgVFHLy8ppyoy0UamMdZ2jACYsiyOf+YZGv+8rpyUM5MRkAyN4DZG+SNspinwnvifcOCJdTMZeE1I+RSAuejKPNHC9LD8QzXYPVpa0go6zQxPtt5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbnOnZxh4k4EIk3bd2LRxW8/M5ATWB6bNPv/uaYf9rw=;
 b=lAwIVcO+SNzjRqmF+7D5SngOnt99IxL2XV/yMiLUoBPh2zin+H0S3t/izbeKL/m3Teei9YuBqt+jkPRQszuWIDdC6jTWZ1aubRPE0v+zlL+HcfZ9mhLU/2xnSYKyyXTM8/Ckkii7KhiSi3JSalBeIn5sZmaKcMrfBTXbqu8c2gUBBftw/QCGQcntfbrNlTmYxg8ZSnVg2XnNdBEXZPpMuDFm3cYgM9q1+vc0oGD8iRlaYuzuVOOloxiB4S0OvmWUOPInY1LsXQXWxl31Gwnxvn7h4mAlmUn+Ou+KARZLH873YBbk2596bcljiEulIn4f4YovnX/tZHkByBB1MpXnpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbnOnZxh4k4EIk3bd2LRxW8/M5ATWB6bNPv/uaYf9rw=;
 b=rJcuXcg6AKNgIIJtpCiuR8OtVmU451eUouAeIu/4GNl4xfE1nBoAng5VJr3i24PHWQIzrwXirdAjrZ3PCCoRqtlbfSjNqFosKbfO41y7nNrM+YPdhgEQLXzZZ3qYB/LKUo3c44ElaCu23ZQEFalCk9OYiFgqklQIghvZ5yCWzhlTh+hs1vCs4FFcZML8K3oKRgJ6LDvBOyEAaxe5zrairGpWOCrt79bh5dF0nOVZBjPDvYQrfLmmduQJvknk26OsOTUaI7MzJqxuUYvZWLGPt4hicyou5EiDtBMLZ4ASDUOPsTsV+4HDC14Bb0rRMC0T7LbRKZqL7j1mkCIfBDzUCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2094ea22-a58e-fde0-8a77-f13675161a4a@suse.com>
Date: Mon, 17 Apr 2023 10:49:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: RFC: disable HPET legacy mode after timer check
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cb408368-077d-edb5-b4ad-f80086db48c1@invisiblethingslab.com>
 <0ac3fce6-dcd2-4521-6207-ede4d90e656b@citrix.com>
 <ZDaVPiJTt8q74nQw@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZDaVPiJTt8q74nQw@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: df790808-4165-4c41-925d-08db3f20ae3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HXnNzKr5r/E+n28WQnPIwGDtMS54J2/KX4/d91b9B16Zrs65IvdrvIP6UbDRCp7IUMEF8TiOnvpEqzyAmV2rNE9UPNnfimGfWRO+464ii7H2gDagTYcHwCnKVA7XKPfKW48JBw8pNq7R2K5zF68kQ01T5NW0w3O/htokAQH/7YZrRR8+bZVnCcGrV5zy3dAel6W7HqXlRyF35NWuVH45JB2ciLYo+pE7CYp2TbJUVfikah98+KAh/xCU67PmY2asibdOI+fwh0bFOcCbJAr4n0/UnUos+WTMVnFl5WN7t0sz7N+6y+XzjfgBl0ci9qI8Z+97cpgDJFuaAx35vbT0MzAPzL4aJCJKcUq8q5VSMzYuC25Gdhf6KEp0ApoXrQt0STKFMqinO9/iWU0wXVYm6KsKTlL4CZXECd9JY8mXjoKA5eVJI1YGKqUW5t3b5/fMP4uvF66mw0tHHvYKxtQiLbK48shJ5JJuDBdo/u9d6TwOlfJaF9vK9lb+JIRNARAR0VRQK4IcGLW5vaxLIrKiaR5OUqIZZNmPx1PWuhi+LOoJ0oXMHCYTKIfvcNStLa/sDaBxWLKj97Nt2Wq/XdjjTl2zC8qdT1YR3zLvxO1EKnzmtPWPVjCbYSpEik5/IiZEpzSHHD47gCfrrhcZlHYyUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(366004)(376002)(39850400004)(451199021)(4326008)(54906003)(316002)(478600001)(66946007)(66556008)(6916009)(66476007)(6486002)(26005)(2906002)(41300700001)(8936002)(8676002)(5660300002)(38100700002)(86362001)(31696002)(36756003)(2616005)(83380400001)(53546011)(6512007)(186003)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlUyOGZrUjhJTTV4OTlRUUE5QUNLL1pNRDdrNGJYcS9VdTM1QlE0K3dBcGJM?=
 =?utf-8?B?TnVleUJnRVhRVm5EWDdLcUExYks3Zmx6OGt1Z2pSRFFYQ2loSC9kd0EwUGRt?=
 =?utf-8?B?ZHpQZGFqMWFQUU4wTlgzNkZNV0wycVNQVVRGWGNmejQxS1FiOGw2NU9tN3N2?=
 =?utf-8?B?SlpyS3FPTHY5d0NMSEtqWUIxb25wRFB5RGsvOXZFMHRzV0lGWTJoT2QzOWI1?=
 =?utf-8?B?L1FhZWMyNFRyWVB0dEc5OTFjc0I4WDlaUnhpa2x1cWtpclRabGJQZXE5a0xJ?=
 =?utf-8?B?VHdqTGhIVUxTU1V2SDNTUWdXbkhrSTNyeVRFN1hkdWZXby8rNUhUS2tDb3E2?=
 =?utf-8?B?SWpiTWIrM2tFNlU1aDZpdjhFSmJFM282Y2FQUWpBYm5hRm84a0w0RU83VVlP?=
 =?utf-8?B?SXhwL2xDRUF2empvWDltNWV1VllQT3hmeHJCSmNxUFJ4d0VCU2xzNXRkZVNX?=
 =?utf-8?B?cVlLZWJNU3JNaVV4d2RnVjNZaXhoTDhWTGdwOWQ2M2k0ZkhjVmp3QzlsQ1FM?=
 =?utf-8?B?WDdZTlZsN1lESDV3Tkl4UXYxZDU2b3hNalJsd3lGeituM3NVY3FraFVFeHkz?=
 =?utf-8?B?T3daQmNXb29vSXhsOUtWcFpHeXA2WHB4cEpTc3o5S3F2S3F3ZVJmeTFCeSty?=
 =?utf-8?B?STF0ODhoZE1PMHM1Z05LUjZQdVRWbndiYmprZ2ZtQitBMmp0Ry9nbWhydWFH?=
 =?utf-8?B?eWdXQ3psaHFKd3JWY2FyRjNmQktpeEJMRFhaOHcwZmFwRnN6bHBkR0g0ZFgx?=
 =?utf-8?B?bXZzVnVBMTloSXp3NFh4dUlIZXdiK1pMSWZFRE54K05ZY2w0Rm9tZTNvQU1h?=
 =?utf-8?B?c1UrYVdNeWN0Y21Vd3JOWG51MEMzTHNmdWJLVHBnTzYxb1hQdFFIMHBTYyt1?=
 =?utf-8?B?ZERTTlcxTVV3TmdqVjYxVFNyRmg3c0dac0F1Y3ZITzU4MlBoU3ppaVl2N01F?=
 =?utf-8?B?ZGRsMUVvNGRVT29mUElHSDFwY1doQVZJeGhTZlgzVVQxNWV2U1V3QWNMR2U4?=
 =?utf-8?B?SzdIZDVlR1VNNllCRy84QWpIZXlhL25YMTNnMHJBVC8yQ3JwWXR6SU8zWkhR?=
 =?utf-8?B?Y2NYTGYwUlVXWjJBT3lzSmJCQkZYRTVtRTErdTZiaUVPWUlpZDhXcVo5dHU4?=
 =?utf-8?B?ZjV2bXUrRTM4NW44b05FK1RnSFJjQUhEV01CZ2F6NzdVY1ZEektHN0RBc0w0?=
 =?utf-8?B?Q0djYmwwMW1SREZ6blc1R1VnaldPMkpQWkNETTU2czQ2aXVsUDUwMkd6blNU?=
 =?utf-8?B?bktHNnNSVXhncWlHNEpSLy9RbzVLdmhrbWs3RGJpaytNbFFHVjFzeldiQTVC?=
 =?utf-8?B?am9iS09leVhLVU1Ga2h5dTY3bTlKTHB4dWMwS2w1eVBjbktiTGJrelZjQkhp?=
 =?utf-8?B?NUtXZ2VHNHZ2Zm9vNWZCQWk1aDNyVUJjemorc3o5aXJ0UVdYaC9JT28yZFBY?=
 =?utf-8?B?MXJQc3F6bFZzejEyMHE1eHFBVEpSVWxGU1hLcmlBQ29zcGk3NkJ1RU92aW44?=
 =?utf-8?B?N3dvYklGR25MUERMTjhPQTBZenVRUGtWRFROaFFkSklCMjNsU1k0YVluVUtM?=
 =?utf-8?B?ajJJTVlxaGZNU0phR2NvbmlQTnNFaXlhSmFwY3VTZCs2RWJDS2tsVzd0UnZT?=
 =?utf-8?B?WWl3Z1NLbkRRZTQ4NUlNSE0zRmdjcFJ1d1Vvc0pNck9UNlJUTENEYU1BT0t6?=
 =?utf-8?B?c1hvamxhTkQ3cHl2ejBEdEZNWC8yMXZWbFNRMmJZaW9HNkN2dzV4RWl5clZx?=
 =?utf-8?B?UElMOGVGNnJTa1RuSjltZ0lYNE42TTMzOGFBWSt2LzI3NWsvSTRvNU5jRTZ1?=
 =?utf-8?B?Sng3eXVRbURKZlZxREZ5TXB3UXpURWQ4WDMxbTc1cXFvMXcrdVRZc1V6Ynd5?=
 =?utf-8?B?akhiQ1laTGwxV3hBL1BYWTFUMTZ2ZkluRjd4RjlCVjlWdkNzWWRiMjNWWE1x?=
 =?utf-8?B?Mk1DZ1VoSms2UlR0Q041NnczTjdLdUtYaStLUlFIMUFTaDhDN3M3M1BiZ1hL?=
 =?utf-8?B?RGczc0ZNaHN4Mm1PTXpOcDY1WW5CTHpseVdhcnllSnp5V2ZsVWJYL2Q0eUgv?=
 =?utf-8?B?M3V0QUVLUzRtZTRMU1lQZDRhaGtIc0ZUUkg0Nm1IMmJKZUtlU1pqQUE1dWIy?=
 =?utf-8?Q?qS4gJCTIPw7GjgMRY2n7/H3ol?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df790808-4165-4c41-925d-08db3f20ae3a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 08:49:39.9269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRRpqNK/v0eUu3V6hgSE42v875kNBdeILf5NhrahgYrL8YfFpJNNkSI3x1rJbK2r3LUhru306/7kbKovO6QvTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7439

On 12.04.2023 13:25, Roger Pau Monné wrote:
> On Tue, Apr 11, 2023 at 12:20:13PM +0100, Andrew Cooper wrote:
>> On 11/04/2023 11:30 am, Simon Gaiser wrote:
>>> Hi,
>>>
>>> I have been recently looking into getting S0ix working on Xen [1].
>>>
>>> Thanks to a tip from Andrew I found that the HPET legacy mode was
>>> preventing my test system from reaching a package C-state lower than PC7
>>> and thereby also preventing S0ix residency.
>>>
>>> For testing I simply modified check_timer() to disable it again after it
>>> checked the timer irq:
>>>
>>> --- a/xen/arch/x86/io_apic.c
>>> +++ b/xen/arch/x86/io_apic.c
>>> @@ -1966,6 +1969,8 @@ static void __init check_timer(void)
>>>  
>>>              if ( timer_irq_works() )
>>>              {
>>> +                hpet_disable_legacy_replacement_mode();
>>>                  local_irq_restore(flags);
>>>                  return;
>>>              }
>>>
>>>
>>> With this [2] I'm able to reach S0ix residency for some time and for short
>>> periods the systems power consumption goes down to the same level as with
>>> native Linux!
>>
>> Excellent progress!
>>
>>> It reaches low power states only for a fraction of the suspend to idle
>>> time, so something still makes the CPU/chipset think it should leave the
>>> low power mode, but that's another topic.
>>
>> Do you have any further info here?  There are a range of possibilities,
>> from excess timers in Xen (e.g. PV guests default to a 100Hz timer even
>> though no guests actually want it AFAICT), or the 1s TSC rendezvous
>> (which isn't actually needed on modern systems), all the way to the
>> platform devices not entering d3hot.
>>
>>>
>>> I tried to understand how all the timer code interacts with disabling
>>> the legacy mode. I think it only would break cpuidle if X86_FEATURE_ARAT
>>> is not available (Which is available on my test system and indeed I
>>> didn't run into obvious breakage). 
>>>
>>> Is this (disabled PIT && !ARAT) a configuration that exists (and needs
>>> to be supported)?
>>>
>>> Did I miss something else? (Very much possible, given that this is way
>>> above my existing experience with X86 and Xen internals.)
>>
>> Xen's code is a mess and needs an overhaul.
>>
>> Right now, we're using the timer as "a source of interrupts" to try and
>> check that we've got things set up suitably.  But this doesn't need to
>> be the PIT, or a timer at all - it just needs to be "an interrupt coming
>> in from the platform".
> 
> I would even question whether that testing is useful overall.  We test
> a single IO-APIC pin, which still leaves room for the rest of them to
> not be properly configured, and Xen might not be using the PIT timer at
> the end.

Testing one pin is sufficient for the intended purpose (proving that
the delivery route platform -> IO-APIC -> LAPIC works), leaving aside
firmware possibly configuring multiple IO-APICs inconsistently. Yet
if there are multiple IO-APICs, I'm afraid we have no way of knowing
how to trigger any of the pins of secondary ones. Even if we went to
figure out what devices are connected to it, we'd then still have no
(rudimentary) device drivers knowing how to interact with the devices.

Jan

