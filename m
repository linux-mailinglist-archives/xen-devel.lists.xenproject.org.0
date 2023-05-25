Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D548B710D3C
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 15:31:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539602.840661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2B3H-0003FW-0I; Thu, 25 May 2023 13:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539602.840661; Thu, 25 May 2023 13:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2B3G-0003Ce-TT; Thu, 25 May 2023 13:30:46 +0000
Received: by outflank-mailman (input) for mailman id 539602;
 Thu, 25 May 2023 13:30:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q2B3F-0003CY-3T
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 13:30:45 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20624.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58d27310-fb00-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 15:30:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8462.eurprd04.prod.outlook.com (2603:10a6:10:2cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Thu, 25 May
 2023 13:30:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 13:30:41 +0000
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
X-Inumbo-ID: 58d27310-fb00-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InUBYeojjrbBAR6HKS1f+pHKjhqvKu1obfgYbbRM5umjyDgByahPr3nxJims3C/LAYaSUO+iMW7kJhLYP5zurm8ZVDkJW9TKpeRoulPmFtxJ3ILsrOo7WZ+O9K7uirBZ4QCkTgQbrRsq619UMwpaukwF/lh9YjBP5lkTMfmMe/ur/XSlK9Rz8qYo4k0EWQcwYqG+daEXZ4jd4WA1jpwuBfAJWPW347hUcPVMfOE0VJdNKy0STE5YVoe1k3xschCPbFHCJmQdWCwraOfKi6vQ3hw1wCev3UjTVAKzgAkzjlmDlIVZJY22KUptUJcuxiSRPRCU1wk9jJ2RjdjshhbwxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tONP3mdy83Z3QFc2VCPihdDUGYa+TnO8ymzDuor7OjE=;
 b=CDXKBi8sBzLCSAvm+D/qtztZijn9C4wzD4bJU4JHlCGFGrUXne6zXWNddNW7+0ICFz08I6bXFWiEydlNn/PCbTbkbK3bklTC2zv1HsQ/JTtkMlsoTfmByjA0NuYtocW00XPyL+4zhVXrFuVv9+q/wYO2ZlJ5E4lf/NX5F7hVGHUhiWmEzii7X6tyoIR0EEHRSlqFdlwXFoO5fzaWAiojII+3uVW3uBhHPsNahshB9toyZmC9hUpoYvqZLYIGL7ybQgoiKH8zPKKBRbj8RL//XOcYF40ybLs/ejbKFelr4j5laCIq8z20hn398L1pXER65o3l1cAm/jWvYHgIloGqqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tONP3mdy83Z3QFc2VCPihdDUGYa+TnO8ymzDuor7OjE=;
 b=Sf5cuMnGnnLgmj1qI2KPNzgaK2DS5gE0l5KF2imd9h2fRmTBwj59N9JmIlCIf7G+DW/Q3kdedtb7+UXExjEtE8UVyBPk6AHSm8U8icSBBxwQ34S9LATKrGSJ0EAlzy0LDYpSXBV1I2R6nvRBMm19pKiJ6hdufZqYgsYeez2UkCM9OjHRoITYUON5qAAnLUaY2PIX2HfpWGq2mh+Jx7CqeLSgL/xBcKXSkq6ZFdwNmRAsCSHTxTyCy0LSH3my/kOetnAd7906SKbFllZ/Xy+sNYlyuWA8W+lK7u8S4xg2/HmH2OzFhpMKIibQBqX+pwEhqJQSzzgnqPZPYfBBVA7Bqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <609ce6b2-d546-ba51-0f1b-6439c6361c01@suse.com>
Date: Thu, 25 May 2023 15:30:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] vpci/header: cope with devices not having vpci allocated
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20230525083051.30366-1-roger.pau@citrix.com>
 <25a73290-7677-e202-5e91-fdf32ad5c01b@suse.com>
 <ZG9iLwNWyK+I4HLf@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZG9iLwNWyK+I4HLf@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c36b00-7b43-4377-6249-08db5d243c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YeGZreGJtar4N5hUHuzGIrOw7fC5mcabLk2Mr2+IBSrHqUHsJuqPVii0X6HWxrMNc9lkF/lIt1lxtAailGhky77tic9Eu8SORsqvM2tjr1DZmJqjlOJAahBfU5KiGKqWWZgVvKoRqXV2Asd/Ad+2veVDVCFdudM8zXmwbS3JyuplgFUlvMuemmqMmcN612w4m3K1/n2HUnw6E+qDT0Kh3uj08KrelT3/Zk1C0Hee95xsGMsGEgVj7DdwZOkhCO5tAy0CJ3P7RjcvUzi5KqV3RMOrry13h5Dr7cyDWXjWMPPHEeCWGT9mCgImiT5T/yyumk+lDL8wQnl1lkL2p7WYLR0vWDg4sRpyJpAxqIuVlxnZrC/JhcHuptH4dNKMewxcZo43IS1A688knjBqxrtaZ32V6vWqHvNlJ+QCPZAdDLSL0PUTCCX/K3lGdauDy20jw0m6nM15yxxzPIldXs1DVf+9JOz+D2QxResRhC5XH+funPoWMCaW2kDc5+9rMgHmsdIhH3OoHuIXPxyM9xrYRZXc6p1LaFztDjJvcjtJjarCPDyGMLY6B3XyND6ta4tXX0N4tfhMB6cJv58YihNnbGpd1fSEeWz9CaJvla4+Bj4ADPDMIw2nE6eNWi90hsLJuJFILMDS4NH6tsbQrcy+Qg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(6512007)(26005)(53546011)(186003)(6506007)(38100700002)(2616005)(83380400001)(36756003)(2906002)(316002)(6916009)(4326008)(66946007)(66476007)(66556008)(6486002)(31696002)(41300700001)(86362001)(31686004)(478600001)(8676002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUJZS0ZSQW5kVmovcXl5aTRUZWpaeVc0SC9VeTlEdFpNM3RSaFRSMDhrUTVJ?=
 =?utf-8?B?Rnd5cGkyNFdtbE5TYVVPNlRzWno0WXE2VlJZTkFFdUVaTnl5Wms5RkFHbW0z?=
 =?utf-8?B?eHNEazRaWGkrZU14a29tMms4NGtKZlRkSGNnelRyY0pueEtjY1JDRVl3NCtB?=
 =?utf-8?B?cC8vL0hpalNQZmNuVHFKQ0xGNk9YZmY5MUdJdHFaT21weEhKQ3NqSm5SZWhl?=
 =?utf-8?B?dHBXaUk1T1dnNVNLS2xKOFN6ZW1YdmRoWUN2b0w3ZlJ6TWZjMjJtSHkwUlBn?=
 =?utf-8?B?ckR2ZnlqblFnU09xcy9ySVhqZG9yS0pxUE52RjllMFNvQ0IwWmk3cWp6ZVBa?=
 =?utf-8?B?ejFaWW51bHJOb2toSEhRQjNnOWwzUGMxUG52NXZUZElaNlJURFhWVXprb0kz?=
 =?utf-8?B?b1dTVDZXR3FzaXV5SG13ZXFXaFlmYVZwaDhGUEhSc01wOTRDQkFFb2NWbGpV?=
 =?utf-8?B?czA5am94VzRTUHpEVUY0c0NlTEU4c0x2ZW96Z0Jadk9KNnhURk03U1d6ZDhE?=
 =?utf-8?B?YkV0WTlxc2d0VWRRYXJaOEhnRjNIQUEzd2pEdWNjcSt1MGpZYnp5VVB3aFda?=
 =?utf-8?B?bURoUW1DWkp0NElaTDZDaDIxbVpGQlh5Sk5nSkErVUQvRERtUzdqc0E2SVM0?=
 =?utf-8?B?cXE1dnJ4dTVmQkEyVFhyTzd0OE1kVXdKTVFKdHl0YWlvdnVZNlEvaTVYbmQ0?=
 =?utf-8?B?UC9vNGhjWFlNbzlNYWJrR0tGMUtVNFFPL1lIQUtRZitTZ0ZtamM5QUVScFhO?=
 =?utf-8?B?VlFsazhXMWZ2bk9ZZmVHV1NsUmFzbTZRY1czWGRtTVNoRlNpWnFOVVVBTm40?=
 =?utf-8?B?OTFFQmxxRU56THlqWXQ4TXlESDNlV21mYm9oLzQvVHNqVjNldG9nYXNtS0Uv?=
 =?utf-8?B?REFicGNBWHhBWWlPL1FNVGxjakpZV0Zqb0tZaExwV1c4K05Kak1tMU40bWMy?=
 =?utf-8?B?RG1wazRvcTNLNTNTMFVQS3VZbTg2ZG5FTWZFV0pZYXBvQk04c0lXeEtVWmpZ?=
 =?utf-8?B?bWhaR1FjZ2FsaEdhbVFON3JkWE1NVTdML1JQQ2N0OHdtMWV1SjF0dlB1MWhp?=
 =?utf-8?B?R05IWTVhV3hpcmU3OFhnK1NFY20xSEdid3FLYzQ1aC9MV01vL3g2NnlXeGlj?=
 =?utf-8?B?b0dpY2ZiYlF0K2pRcG04WHpzZGJBYlllOFdFMHhpbHBMZENHczZqelNkZmNp?=
 =?utf-8?B?ZWs3TUdsNmZyeVpIQzF3TllvdUtIckl2cHZNcS9VMGE0VzI3OEF0Tlk3MXZX?=
 =?utf-8?B?cUt6SmRtZjdOV21TbS9PcXdqVTJSMWhCV0hZWGxQOHN1Ky9wMEdyYVdESi90?=
 =?utf-8?B?eGJCaUdEdmlpdHh2U3FYMEZTY3hBclRlYk9sOWJkMCszaFc4eTJwVnZqbExZ?=
 =?utf-8?B?bGtPbm9LMkxNMENMeW9TN2hMQWxQaGlxWFBteFdWSU9aVlFhdkJLUkFpZVph?=
 =?utf-8?B?azAzeWlTVDAvdUlSeFZWL3NoWUdlZ2FYWnc0MzZaQ2ZDSnUvdEhhUHoxcnNu?=
 =?utf-8?B?QWhTSGVmQWVXTG9SYldGRnh4YitWWlk2SmpjMGltRUVCY0wzRVJUL2ROTW95?=
 =?utf-8?B?a0tXMHJzaWRPcHpRUFh4cnhGd1JwazV6K0JvWGZ6TUxObFlDQlRIbjVJV0ZX?=
 =?utf-8?B?OTk3OUUrNE05b0FyZVdJOFRFeGtMdWZ3SS9JNFIrZXRTOE56ZFplS1pTejQy?=
 =?utf-8?B?WDNDT3R0SVJIbS9US2E3aGt5SWMrSXBhVEJYaDRZWmwrUUZDTGIwZXYyRWJR?=
 =?utf-8?B?Mi95RktEdWZqOFhtL0NSNTFXRFhsT24yQmNrT3pQbno3K0RqT2RPRERyMXZ2?=
 =?utf-8?B?UVRNZ0JvSGhsbm9SaXZyYnBkckZPa0tvR3B6YlRBK1hXcVRQWW4rVXBXdGpu?=
 =?utf-8?B?ZGVxc2d5bjRDdGphbENBbVgyZFRnMUxFVFBxSEVZRG1HMTdzZE44SnRVVmw0?=
 =?utf-8?B?ZWdyZ1o2Unhub3pYaVZWMHc1MTJXVHpjWWZqZ3ZKcENBTHRGNU4yTjF1OVND?=
 =?utf-8?B?enU1TTRlcVZaamdBbGVrTEMyRnNrZUF5d2lscEQxVTlWOERPT0RvRnZmNjYr?=
 =?utf-8?B?YUszeGxIczJMWlVwMHdhbVR6L2gzc0ZMQ3ByQVd2VEtNd0N5T2VTME9KdmdV?=
 =?utf-8?Q?gHbotJH7oIPD+n3kxWH5k4YMW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c36b00-7b43-4377-6249-08db5d243c21
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 13:30:41.3270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63Yb7YXDYqM05SnXlvnXVoCg2EVqMZ8jUpqml3BK77M9ywwMh/00nEp4zE58f+NKBOcUhauIKxtq5H1U7fNMhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8462

On 25.05.2023 15:27, Roger Pau Monné wrote:
> On Thu, May 25, 2023 at 11:05:52AM +0200, Jan Beulich wrote:
>> On 25.05.2023 10:30, Roger Pau Monne wrote:
>>> When traversing the list of pci devices assigned to a domain cope with
>>> some of them not having the vpci struct allocated. It's possible for
>>> the hardware domain to have read-only devices assigned that are not
>>> handled by vPCI, or for unprivileged domains to have some devices
>>> handled by an emulator different than vPCI.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/drivers/vpci/header.c | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>>> index ec2e978a4e6b..3c1fcfb208cf 100644
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -289,6 +289,20 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>>       */
>>>      for_each_pdev ( pdev->domain, tmp )
>>>      {
>>> +        if ( !tmp->vpci )
>>> +            /*
>>> +             * For the hardware domain it's possible to have devices assigned
>>> +             * to it that are not handled by vPCI, either because those are
>>> +             * read-only devices, or because vPCI setup has failed.
>>
>> So this really is a forward looking comment, becoming true only (aiui)
>> when my patch also makes it in.
> 
> The r/o part yes, device setup failing is already possible.
> 
> I think it's fine to have the r/o part added already.
> 
>>> +             * For unprivileged domains we should aim for passthrough devices
>>> +             * to be capable of being handled by different emulators, and hence
>>> +             * a domain could have some devices handled by vPCI and others by
>>> +             * QEMU for example, and the later won't have pdev->vpci
>>> +             * allocated.
>>
>> This, otoh, I don't understand: Do we really intend to have pass-through
>> devices handled by qemu or alike, for PVH? Or are you thinking of hybrid
>> HVM (some vPCI, some qemu)?
> 
> I was thinking about hybrid.
> 
>> Plus, when considering hybrid guests, won't
>> we need to take into account BARs of externally handled devices as well,
>> to avoid overlaps?
> 
> On that scenario we would request non-overlapping BARs for things to
> work as expected, I think that's already the case for HVM if you mix
> QEMU and demu for the same domain.
> 
>> In any event, until the DomU side picture is more clear, I'd suggest we
>> avoid making statements pinning down expectations. That said, you're the
>> maintainer, so if you really want it like this, so be it.
> 
> OK, I don't have a strong opinion, so I'm fine with dropping the "For
> unprivileged domains ..." paragraph.
> 
> Would you like me to resend with that dropped?

Yes, please, because ...

> I assume you also want the commit message adjusted to not mention
> unprivileged domains?

... some adjustment will be wanted. Mentioning (vague) plans in the
description is fine with me, if you want to.

Jan

