Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBCA69F1C9
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 10:34:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499301.770381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUlVD-00017D-03; Wed, 22 Feb 2023 09:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499301.770381; Wed, 22 Feb 2023 09:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUlVC-00014O-Sp; Wed, 22 Feb 2023 09:33:30 +0000
Received: by outflank-mailman (input) for mailman id 499301;
 Wed, 22 Feb 2023 09:33:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUlVA-00014I-Lq
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 09:33:28 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4f708b8-b293-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 10:33:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.18; Wed, 22 Feb
 2023 09:33:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 09:33:24 +0000
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
X-Inumbo-ID: f4f708b8-b293-11ed-93b6-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGeRGAKNDePP0MOKYv4g6/oNP0WzMpZ+EAy9DcH1GqHj9xoQVWgeKmg5yXjXbuwImIk1QSRYCFP8qjMgGgF1x68oVwQi6oDyqXBZYkGR6ZuxbTr9Q2SKL5mX1X1kiP08P1M0/B3TFvw5dZXBbgwoCn0PsIrucBfudd2xZd8cGsSpcXCPoqwFkzgEt0bEYnsdHXAMkQESgACYY58rCQBwH02mF0nAhvOS1/A+d/vkxKod989LWCMoJwkcnbNTz6IXIPSXgT04QZMOpN/UFIHDgAlPgbi/2Qxf1KPDNS8KynjURnn/x9rdCDP99oNZeiGWf5t+DjJVqBJS0tabI2qbGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/T6Dg7QHblN9sHPTSrT66ZFu1n2VLTRFa9wx5/oY7w=;
 b=OPSefJA/BKjhTa+nhsuKkLdHD8J3IkTRpwzoTMNh0nVbMEuWJ/pwHXawUmr44WxGUH+RsLlq3EouIiXKpZq2vKGA+Eh6kQtGzLJFeo1faobO8dYXcCE/+OPfNapmJ/TWMZhWrLejN/xP3puWiF5VMoovxFZqEN2rLp6WYQ8omrsN1DCM+cCYZygMSsNwMIjIMVOO14p8MKqyxi1iswp9krTz04lSzBBLudpIKHjQBFbxw1zxJH7sxNs8Erfq4CFjPRFXU3nSBx0X1IAoV96RgwFGY2cX/9BDTTL/QKvkTGQ/wKskSiT5TUZ0Aw57v7OBkpS8Y0lMA39hFqzKvxbrhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/T6Dg7QHblN9sHPTSrT66ZFu1n2VLTRFa9wx5/oY7w=;
 b=F/Bzwj5hsUr0qjMHGptPRhvfQdXA2pwN5axE3aXFThRIje3XPMczi9LNIHCFje1oV/doAKZt4Pa33wIxQ7UnEWTCMkDFkoDv72os604K1PYmowJjsy3VrK1JVvNFw7hL8WSkl7FsAag0gNmh81jh906mMIDJYVEfRZO5XZJARBhpLjLm41UVH9FKy/lX7yL5oQUJRzbqW4TXqAqaSeVrbwtop09/PZEPj7pwLP9yruK2GTlAJhbjEzE3y+CffzpQI2opKqRi9h4Us0GH+82bHRfB17poeq//NzChwSncWPLKK3zVcL9ufVl9l8X2iepYDPgbsk4EHHOj34ReGervHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <71b9a6c4-950b-201e-7d39-eee602f2c26c@suse.com>
Date: Wed, 22 Feb 2023 10:33:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] xen/ioapic: Don't use local_irq_restore() to disable
 irqs
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230220194702.2260181-1-andrew.cooper3@citrix.com>
 <20230220194702.2260181-2-andrew.cooper3@citrix.com>
 <b6b91164-32f0-3615-be8d-da99d9513666@suse.com>
 <95737b30-f377-7c2a-316f-8dc6ed7a863a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <95737b30-f377-7c2a-316f-8dc6ed7a863a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8213f3-f68d-487d-d02f-08db14b7d82d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rECo/Mfh85s/uWpxX/BPjVqngPJ4zHgkLcG2I4HwwA+gorKY84i0RpIN6IeM/3i7HB9AoEXEg5bsVC+ZVwA8Md6PSNv8Ksv44EMswdx5wN5SdSeLccddHYhidkBAOGFxObSkjSSXnq8AaNs7rOJSEt6dLcFtuSIg4UJE8ey5Vt7sY141idJw2rzMlXo5v/Ze9dxh/JTyHznFbn0Zt+6udvlrdPLmIB8Ix9+x8IVXw/ASEBHPoeGenjB3MzbMSPtYkArsjuwN3OevqqdEP/xaWOOkdq46WgdSboQSvCwRivuoi+5zYoj5XCCsy2QJJk9bQRbAt8SNTsii5W6vWJDJ9rIAHGnA1bnfakl49l/KbgOFqSuTxGO6Sa1IFAQcEZd90fCHI/kwzuORLwfyINWVpj695URU5GhP9pUpTbO22nANdUQvnZt1jvdEi/KxJ/cPABKlw1XELQCoamfa8FbfY+wAaE/q6gpvhorOqZRg1YOqZkaSsrgJAmlP8jf00LsjIP0RjNcXNX5ffGwAe7LltLHkOdyv/yQptnpp8rXJDWeRb8tBVyILzgMaKnHjnPO3656Te6CHLrpJgZpDdjNZxM/Py/UH6wWqBotLgqRsnRUD5p8J8m5NqtQwOlqIiivqWwhdunAgeGh6qKzR2X9MkQBT2S/bfeQR9kLuW6oxDnwNsO1vIx+rpIn9wpdeYJfPR3fKSDN1hJ4ymiWvVUwoL5QPsQ9kj93CBUA3FFQOILk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199018)(36756003)(478600001)(31696002)(86362001)(2906002)(38100700002)(316002)(54906003)(41300700001)(5660300002)(8936002)(83380400001)(66476007)(66946007)(4326008)(8676002)(66556008)(6916009)(31686004)(6486002)(186003)(26005)(6512007)(53546011)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzkvVEJ1MVJMM2VUZVExa2dydjVOaVMxcjFKSFIvTzJUdDZndHJUTlZFNCt5?=
 =?utf-8?B?VGVkR0FVU3E2TFJ1aXZhU0JZMnZZN1NKVWVhc1YwSEptZXRqaFZRRE1vTUtM?=
 =?utf-8?B?eTVjV1U5UEVxYk92TmtxNlh1YThKZlcvWm9zZzg0OTg2NEdpUDdhYkNINWdX?=
 =?utf-8?B?QVRpYU1PT0cxa2M3TWE4UFBlNUhya2d1Y2FLY0NvWnljZjNHM1N6Zmx0ZWFF?=
 =?utf-8?B?aGNLdFd1OW1hQUl6ckE5R0RGTHBRc3N3cGpnM3JNQjhYL05YVmRsOGNMa0Ex?=
 =?utf-8?B?Q2tKQWJQZVd3T0txSXByaGFnUGpIaWk2a3VRTDdLVC9QdEc3dHZjZzYvdk1j?=
 =?utf-8?B?a05JM1ZkOFZEQ3l1Z0lvZjNOa09ST3RsMGtpdFNKeWRET2p6RFpMTXI1MGYv?=
 =?utf-8?B?TXZVOS81d3dXRnl1QVZ6WGl2WXM0ZlRSenQrc1pyWklKMGtBS01BT245Y3pF?=
 =?utf-8?B?aU9YN2hRamdHZE1QZ1M2Z0dKRTRja0oweUR4anZkWHpVOExSNzQ0RE83UUk2?=
 =?utf-8?B?d2F1UzJGVUtDK2traUxXNk5DdU5zNC9CMkNTb1FUMVBTZHdlT2hUWVVLRVQ3?=
 =?utf-8?B?cXF2TU4rOTlMNlhMQ0RZUzZTbGN4SkVmOWE4ekpSbEE1b0RKekpRYi90RWZ2?=
 =?utf-8?B?WHYwNWZLcTlxbkdveUJhQ1BnelZTd2hCMXVKcFZnWFp0ZFB2U2V0UE1NM2pv?=
 =?utf-8?B?Z0V5NXZkNUJidFgxTzZRWTc3WUlrNDdtSFR3cWoyd0c3bU1jV1NuVm14bGRo?=
 =?utf-8?B?M2FOZDNTQ2lKL2g4TFhTdVdqWUx5M2kxdkJ5WlBCcUNENEFaSVRuTXJzdFpE?=
 =?utf-8?B?Ly9tb3k5Tlhrb1gzSGRNVktFTktpVjF3YkoyTTkvdG9kV1RQcUprMnZOTHcz?=
 =?utf-8?B?UkNwK3pzbG9aU005Q29tSGdWK1hRM0Q1c3I4RGZYOE41RmorbFlIT1lPNXA3?=
 =?utf-8?B?U0F4ZDBQYUdBdzhGbmJGVzZTWFA0SGt6U3Q3REhXVy9sMDdoNnlabkZadTA1?=
 =?utf-8?B?b25zbk5TQmVGTHZjMUNwN2xrQXJuVkQ2a2lCdGxCMDBvY0pOWll1YXp1OE5j?=
 =?utf-8?B?NHZGTEdvUWI3MEJVVHdUNWV3azYwbFZaTFppb2x3VkFqOWVkMWp0d0hMTGRS?=
 =?utf-8?B?TElSNHJ1RzBtQThRSDJrMEhjSG9ya0Nxa3d5cURNNGJVekJyNy9JdkdGenFF?=
 =?utf-8?B?UzUraklHNFN1NWhMWGZyTm5TVUNUVUJOOXd4MHFRemZEUGZlTHhEVVd1NU1P?=
 =?utf-8?B?ME03LzFId2lpOU1qY25CRWF1Yk9mSEdLcWRKV2o5Nit4WVFjRytpTy9NN0ZW?=
 =?utf-8?B?aHNNZjFlY1JNMEZNR3RoYWhQUWRZanR0WWFEcmtlOE5tUlh4blRkYXIyeHhV?=
 =?utf-8?B?K2hRaFRTUm1ZZ1U3K3NtMnhod1NLNUV2UEpGWGg2endTMU10UTdRNXhlUDNt?=
 =?utf-8?B?cXZvOUwxaHFKRDdTNkcySG4zSW5sYWdJYmNxRSt3VnZtNHcvR0xzWlIrc3pS?=
 =?utf-8?B?YmJlVFAvVDQwbmlZU2NqOW9aMVI2L2piZHFQclNtNFFad2JXNU80VTBHOU40?=
 =?utf-8?B?b0tCVXVNd1lQTU1QMWtPMWlSbVBjcWw0SmF6d0xkSHdOaEx6NVNQK2V4aG5X?=
 =?utf-8?B?OGkyZUU1T1ZRWUVjNlVrdWpFVSt2ajQ4aGhnVVBqSW1qNnI1dFYvaDlocW9T?=
 =?utf-8?B?QUdQYVZnTXZXbENLZURoNHdVV3BRN0g5L3h6M2tWL0k1VFhjNHY2MVh1SmMw?=
 =?utf-8?B?anBvdmJwZkdWR29kU2xWY2lKL0tOV1hmQnVPbXUzL2h4RVRwU3BMOURzZG5D?=
 =?utf-8?B?bWFpZDUvenY1aWNFVEZQWk9zRzZPTHh3SjZlZ0dsNmw3K21nUVpZNmIveDZl?=
 =?utf-8?B?SGU1UytLaytVZWE4VldPaEJxVXdKdVFlcTJ4OFNjdFNwZ05Fb0dvei9HTVZv?=
 =?utf-8?B?Q090bmlMc3dKeWhaNGVHSUJQeW16Vy9uK2FFWDZUYWRjL0MxZXlkMy8ycDRk?=
 =?utf-8?B?T25OVWt6T0dkOVQ2S2ZHdTdsKzRmR1dxN1U0b2kycnNmZ2h5dVBMRzVwU0h4?=
 =?utf-8?B?ZUZ2OUh0UituT3daT3VYUUIwOHZhd2dnMnVTRnNZaUcrdWxXZmJ0M0pJSENC?=
 =?utf-8?Q?fotdcrqRPS5+sh7q+N+QVM14w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8213f3-f68d-487d-d02f-08db14b7d82d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 09:33:24.3227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjMCv17RwiTg59um+mMo73bpRaiO92MARHa0otIF7thGk27NpTwbQlHNQO2Sct/owvPTig8/7HQmrlx8JYHmMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316

On 21.02.2023 19:14, Andrew Cooper wrote:
> On 21/02/2023 1:40 pm, Jan Beulich wrote:
>> On 20.02.2023 20:47, Andrew Cooper wrote:
>>> Despite its name, the irq{save,restore}() APIs are only intended to
>>> conditionally disable and re-enable interrupts.
>> Are they?
> 
> Yes, absolutely.
> 
> And as said before, the potentially dubious naming does not give us
> permission or the right to interpret the behaviour differently.

When I started to work with Linux, I seem to recall there were more uses
of this nature, not considered dubious at the time. Views change, and if
such views aren't expressed in the function names, then it is even more
so important that this is spelled out in some other prominent way. So ...

>>  Maybe nowadays they indeed are, but I couldn't spot any wording
>> to this effect in Linux'es Documentation/ (and I don't think we have
>> anywhere such could be put). Yet I'd expect such a statement to be backed
>> by something.
> 
> It is backed by the rude words the owners of this API had to say on
> discovering this particular use.

... have those rude words found their way into documentation, in a
place I simply didn't spot?

> Conditionally enabling with a construct like this is bogus everywhere. 
> It is only ever safe to enable irqs if you know exactly why they were
> disabled previously, and that can never be the case with a construct
> like this.
> 
> It only reason this one example doesn't explode is because its an init
> path not nested within an irq/irqsave lock or other critical region.

Which is why, I assume, it was deemed fine to code that way back then.

>>> IO-APIC's timer_irq_works() violates this intention.  As it is init code,
>>> switch to simple irq enable/disable().
>> If all callers of the function obviously did have interrupts off, I might
>> agree. But the last of them sits _after_ local_irq_restore(), and all of
>> this is called from underneath smp_prepare_cpus()
> 
> Which do you mean "the last of them" ?

Is "last" ambiguous here in any way? If so, this code fragment is the one:

    unlock_ExtINT_logic();

    local_irq_restore(flags);

    if (timer_irq_works()) {
        printk(" works.\n");
        return;
    }
    printk(" failed :(.\n");
    panic("IO-APIC + timer doesn't work!  Boot with apic_verbosity=debug and send a report\n");
}

Besides aspects one may deem benign and/or pre-existing, your change leads
to the "works" path now running (returning) with IRQs off, when the caller
expects them on.

> There is a large amount of genuinely dead logic here.

Possibly.

Jan

