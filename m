Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA897A9237
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 09:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606133.943887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjEKG-0000UR-RH; Thu, 21 Sep 2023 07:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606133.943887; Thu, 21 Sep 2023 07:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjEKG-0000S3-ON; Thu, 21 Sep 2023 07:42:16 +0000
Received: by outflank-mailman (input) for mailman id 606133;
 Thu, 21 Sep 2023 07:42:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KrUB=FF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qjEKE-0000Rx-HQ
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 07:42:14 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60d297ce-5852-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 09:42:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 07:42:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 07:42:11 +0000
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
X-Inumbo-ID: 60d297ce-5852-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbxZ3OYr47p+vIPIPLsOr7Dw+0N8V0yh5AsZAAvQsRp0a9QNjtE0q4Xj40hYJmx0CRVjxA3F/sC0KaUr+PJMnChpBmdf6+ZTu76JVeVf6YK9WNJov9p6vywQxmFb0UMNt1L6AytgF5OugJwEz/kBRaP8AKVGM7Ol5bBKqMUt+KqHzksgn4kUU9cMPqcucNVAKJ1UULmpn5IMe0oxk7pFFFytvn6Z/uYHMw1sg6GnlAiXtwzu67K/GRA+P9c5Kl9mof6840zDqzwMgQdJ2s99XSipce0RdB/mNb/Zhv1yTH//JNyG1DMtL+trxP2YfNaNlSVwVCrKxM6A/RW21pvU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66IYN27JxVO1SeIztLIsxgVrFKtvVD42qff1GK4SzFc=;
 b=V6U6Bq3VaFBJcg2GYkHcCCrkzDZl3s+FMb2qMh73MawDHtd0Ai0WGWkJ0M0oHBbFN/CHaMxhFTfnKZE4hStB8eNkqvEvwwWwgZkpMS9p+CwFUUs3cq6J7XTuffwniu+h5/BgCvd50lZgxaDgQqoIgalkLXnazutjm5WIq6QcMiUgR2w8hRlnGx8gR3BbEV0Upkbwhoekl6imNfxmHL5UqjtEllTlaKOqCf/G2m7DcL84ank/3wM7o/kMC7DXLSVpbkhw+hZz4tm1W7cmsZk+FUQB6Wo3nt4jgh83ss8Knh9sre9V4FYfzG3bbKu9rrCPaaDrcxdLvreyWqzDpYJK9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66IYN27JxVO1SeIztLIsxgVrFKtvVD42qff1GK4SzFc=;
 b=KgDyANvaUhGjRvyv7AqMw906fTAEX3DwpyiYnIYRhoDl4l30dssjP5guNJz7OLHcB4ssIDLE/pd8QNqxYG0AZgIfxCWKaCy+FiGkJOqaEAf25kH7n+0l4XwCKAoKlWVuPkH5sESxXpslzmqHUgfcHj9IbcGFIlirm7Cw5IAJMe+6a8j/d8dwdeseoD8p1/ncX3Ro1sjdBEMROtVAlJV568pfv5oxLL8m6Kz28a1tz/kWBOLgROI4s3Vx/O/UNdTAi7mXB8iu3NO1HGdZ/xkzcclOsQar6VqDqRE4b/x0qvqHr8IuXDbpJyNSya2biLZjjXmzKYtN8DobKagQWGfiUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c1f0f3cf-a5de-5f90-e153-c523665eba0f@suse.com>
Date: Thu, 21 Sep 2023 09:42:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 02/16] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-3-volodymyr_babchuk@epam.com>
 <ZQnAvNSDn0WB13Gn@MacBookPdeRoger>
 <98b8c131-b0b9-f46c-5f46-c2136f2e3b4e@amd.com>
 <ZQqoqrmDr2jY_bMu@MacBookPdeRoger>
 <8f8e293c-80a9-03e0-0c19-e641dc42d42e@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8f8e293c-80a9-03e0-0c19-e641dc42d42e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f71571b-8ae4-4449-5c9b-08dbba764446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7BckOQo724g3UIX68F23FsaZDfnlljVMctIeJTaUMmV1pJNQpHX30VPngH01j94A6lWX6Wo/a9mTgGddrggVN5wheO0up09f+UOst6ilWr93JqESbLujMCH5OP6nmPIEIZV/C3p9JU1/F5QmSHQzYjhnvSDagVVR/7l41Ke3IFP7Fs2+sD6pTXk58kAM6P0MdeUiorF27RvUgi+Y1jUvNHwWUvI+696ZNqMV7kJscg8uKZ/lLZ83m5AMtoMQa+i4STWkmz81+me8lzGs+xjokFmF6nBWBCM2+U2XavPIi0ZtYMzxPs9U1+DmkydojwUUMoIRlD1PrwQA21L+UzWkquFxYLxZiGxv9NBAWoGKH1QZEo1SyM9irWR7dAUP51q1GEuvQER5MdeVb1t9F1EWHh5pDg9dFvcsp9ROs1POFvHn28W70RZgG/DkMzAoUmSqpU8vOw6Ix77F4atXgv29bV2dUkBqRNv6L/NQZ/wqBajpebKzT/4CDaEx/NiXuOTN73a9tlQuc+oKDbjdGtNncipez73f5XdUjQgpQdSbb+DsRwHtfpjdnGw+e6glwjjq/2odGM6AceDTDeGI1xw1uwiaqsTOuC/V8QuI5y4BvH1xWhNW2bFStPzRHzwCjB+GGwBZkHSgCG9lwLzuqiDINg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(186009)(451199024)(1800799009)(478600001)(7416002)(86362001)(41300700001)(2906002)(5660300002)(31696002)(110136005)(8676002)(38100700002)(4326008)(8936002)(54906003)(66946007)(66476007)(66556008)(316002)(83380400001)(53546011)(31686004)(36756003)(26005)(2616005)(6506007)(6486002)(6666004)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVFTVytQS0xiV3NZcEpnRmJra1FKK2hpaXpwVFdXTklTL2JxakJPeVQ0U2xC?=
 =?utf-8?B?L1kvYnhuSGRmbXZBcDN1eHZueWt5RUIwRHBEUllmREsrQlJobEJtVjhYWnBm?=
 =?utf-8?B?L1V4VDVEMjBoZzdiWm1LNXBib0NTejFZWVlnSFNEb2Q4UFBReGVFOVpnN1NJ?=
 =?utf-8?B?bSszR1FZZUlkOFg5ZENReVVkeVV0Y3JqS2pMNExjODd6WWpFdkFiU2FKNSs0?=
 =?utf-8?B?ZUdDZ0d1S1BCaTV6U21aVi81UjIwRGxlbElnNDV0WGhHaUo4emdFbUtzRGg4?=
 =?utf-8?B?T2NmWVpNTk8rWUlYZ1lUbHR2NjFoY09GZjI5SHNycE05UDE2NVYrdVhhVWcz?=
 =?utf-8?B?dlgvaDlsQmxwR1JDWDhSNFNyVGJqOHNlYXZzTGhZQnVTZW1zN0Q1SmZucGhz?=
 =?utf-8?B?ZUJVSUtVd1BsYkRGS2xTQjMzcnJoekFLK1ZxbGMzWFV6aEQ3Mmo5aFhLTGZY?=
 =?utf-8?B?WnpCTldKaXdLM2owc0g2ZnhNLzhDMXNLdGtIMFdnK1NMSEJJWGxyUzFGK3VM?=
 =?utf-8?B?OUdsQlpOWG91SXk3aUkxRDBCeTlETzJ1SDFrNHJjekpiV2ZYdXNzTFUyZUFv?=
 =?utf-8?B?bk4vV2psZEVOanl3TzFMUXFTVU54OURpaVc5ZUtLNDl6NURtMVcrWXpPR0wy?=
 =?utf-8?B?cTZpQWwzak9FRWU1VWZXTzVEblgxbmJ2SHoyZlBMVVlFM0xoWmxRZG4rcTFI?=
 =?utf-8?B?UGE5SzF6WFJzeDFVTHBrdGhBWmFoREhrZllORmxNNzdWM0pzd2VsQXc1TnFh?=
 =?utf-8?B?eHZJcHNGRW0xZ215ZllSbVJFeVd0S2JRZXJPbmxUeGhPTndsYVlNZHJONWhO?=
 =?utf-8?B?WWpXQjhHaDVkRHdtK3Q4YVh1YW1NNHd0VHRpZlZJbTk4R2diVEdqejhEaDMx?=
 =?utf-8?B?UHk3UUhqNkJ3OHkrRHlGSzVweXlhVU1weHNwY2JMdXg3TnkyWnN2TXl5akpF?=
 =?utf-8?B?MjNJcldJWUw2SXo5eTNCcFRCc0l0T05YSHNyempqSFlmTnVNUk84ZURPWDBX?=
 =?utf-8?B?ZWJyUkF6V3c1Z056VU9WTWxJSVUrZElyek9pYWlXdU8wMHF4Wi84ZzNoZXF1?=
 =?utf-8?B?SVA4S1k2UnB1SXM1Y085ZjU2VFlITytCcWlZNXhRaEhBbVIxd1JnbTFKRlpo?=
 =?utf-8?B?YU5xaFVKMnRKaTNNcHBZVlRYOGJOMTdlMnB2OFE4VndVK1ZCUDdlRWZESmZC?=
 =?utf-8?B?cVBmNXdSQURoNVR5YnlLUTNrTExzRWlqcWJyT1k4K1AxMVkwM1BWZUd2K0lN?=
 =?utf-8?B?MjJIYVVzMjV2K3dGRW5qNzFDeDVmZTJTeGJLbG9JZGNqSlBOL3pYdmpNZElQ?=
 =?utf-8?B?Rm52OTVZeXFFdk95ZFIwSFZYb3YxSGRPbnhaNFpCNGZnSU8reWpIc2c5T01O?=
 =?utf-8?B?SUt5VElMa3dRWkdZWStVZDFnWWFJL29aVWROZXBLVlA1SjhDdU1xb2JTbDMr?=
 =?utf-8?B?Mko0b0VDRmhkUUdxeTdHVUVRdS85UlVVaWNZYVBtKzJnZzZaV3I3bVFaRVow?=
 =?utf-8?B?SnE4ZmcrZmE5K1FGUytHQVdGY3R3L3B0RGlVSlBnTDlHbUJ4Y252YXVaK2VO?=
 =?utf-8?B?V2dlaENYSGhkRlZHK3pTeloxaG9nTWc1V2pqMW1Fa2h3Zlh0bHlsYWpITDJn?=
 =?utf-8?B?eGRWQ0tFLzhKd3BzYnZqOFIvRmdPV2xieXRyUWNlYzV6V0EreHNmbW5aampt?=
 =?utf-8?B?T1lTRnFURjFSc2pMTUZ4NTU0a2VYWFFoT2lvTWh0M2x6Y1cxUXVBZjIrNkZW?=
 =?utf-8?B?Y3dsandudXFUZXpaN3ZqcTRIc3NMVnRkcGFGbFZSbjNaWEtNVUp2cU5XWGsw?=
 =?utf-8?B?VmwyOVFXZDBLUURqMklwNnMzSWVyQk0xOFZkdkxpYVkrMEIzUHJjVGZuamNi?=
 =?utf-8?B?MEo5Yk4raFAxMVpIZFFwa1NNTDFEdEYxUS8rNEY2MklZbitQQ3Joc0o3VEdk?=
 =?utf-8?B?UzVlbmlST3pXY05ZZUVRR0Z5cEFIeGxFa1lGbTJLb1J6aFJ2WmZ5M05BWGZO?=
 =?utf-8?B?QS8vdmxIWnZjWFNOdFlaK0hYWU96NzZrWlNMUmhUR1c2UDVEd3BGVHc1OHJl?=
 =?utf-8?B?QTczOFlQT3NRejlvOUlHSDlWWXhSclZWdmtRSWZiT3BnLzh4K2RPYWVSVmt2?=
 =?utf-8?Q?KJdJ2CgK+w6bbk9Lbb0y0sexV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f71571b-8ae4-4449-5c9b-08dbba764446
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 07:42:11.8579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2kEi65998x2BMX6ZUIms+Fio2sAhzLflRxAL7jBp2dUpIP5xoTT1xkaNjliJGW7vCso3IIh0L9IDINIFjUC6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440

On 20.09.2023 15:56, Stewart Hildebrand wrote:
> On 9/20/23 04:09, Roger Pau Monné wrote:
>> On Tue, Sep 19, 2023 at 12:20:39PM -0400, Stewart Hildebrand wrote:
>>> On 9/19/23 11:39, Roger Pau Monné wrote:
>>>> On Tue, Aug 29, 2023 at 11:19:42PM +0000, Volodymyr Babchuk wrote:
>>>>> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
>>>>> index 8f2b59e61a..a0733bb2cb 100644
>>>>> --- a/xen/drivers/vpci/msi.c
>>>>> +++ b/xen/drivers/vpci/msi.c
>>>>> @@ -318,15 +321,28 @@ void vpci_dump_msi(void)
>>>>>                       * holding the lock.
>>>>>                       */
>>>>>                      printk("unable to print all MSI-X entries: %d\n", rc);
>>>>> -                    process_pending_softirqs();
>>>>> -                    continue;
>>>>> +                    goto pdev_done;
>>>>>                  }
>>>>>              }
>>>>>
>>>>>              spin_unlock(&pdev->vpci->lock);
>>>>> + pdev_done:
>>>>> +            /*
>>>>> +             * Unlock lock to process pending softirqs. This is
>>>>> +             * potentially unsafe, as d->pdev_list can be changed in
>>>>> +             * meantime.
>>>>> +             */
>>>>> +            read_unlock(&d->pci_lock);
>>>>>              process_pending_softirqs();
>>>>> +            if ( !read_trylock(&d->pci_lock) )
>>>>> +            {
>>>>> +                printk("unable to access other devices for the domain\n");
>>>>> +                goto domain_done;
>>>>
>>>> Shouldn't the domain_done label be after the read_unlock(), so that we
>>>> can proceed to try to dump the devices for the next domain?  With the
>>>> proposed code a failure to acquire one of the domains pci_lock
>>>> terminates the dump.
>>>>
>>>>> +            }
>>>>>          }
>>>>> +        read_unlock(&d->pci_lock);
>>>>>      }
>>>>> + domain_done:
>>>>>      rcu_read_unlock(&domlist_read_lock);
>>>>>  }
>>>>>
>>>
>>> With the label moved, a no-op expression after the label is needed to make the compiler happy:
>>>
>>>             }
>>>         }
>>>         read_unlock(&d->pci_lock);
>>>  domain_done:
>>>         (void)0;
>>>     }
>>>     rcu_read_unlock(&domlist_read_lock);
>>> }
>>>
>>>
>>> If the no-op is omitted, the compiler may complain (gcc 9.4.0):
>>>
>>> drivers/vpci/msi.c: In function ‘vpci_dump_msi’:
>>> drivers/vpci/msi.c:351:2: error: label at end of compound statement
>>>   351 |  domain_done:
>>>       |  ^~~~~~~~~~~
>>
>>
>> Might be better to place the label at the start of the loop, and
>> likely rename to next_domain.
> 
> That would bypass the loop condition and increment statements.

Right, such a label would be bogus even without that; instead of "goto"
the use site then simply should use "continue".

Jan

