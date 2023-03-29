Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050696CD70E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 11:56:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516138.799781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phSWk-0003Ow-Bc; Wed, 29 Mar 2023 09:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516138.799781; Wed, 29 Mar 2023 09:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phSWk-0003NC-8a; Wed, 29 Mar 2023 09:55:34 +0000
Received: by outflank-mailman (input) for mailman id 516138;
 Wed, 29 Mar 2023 09:55:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phSWi-0003N6-Ph
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 09:55:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7d00::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d675af11-ce17-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 11:55:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8636.eurprd04.prod.outlook.com (2603:10a6:20b:43f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 09:55:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 09:55:28 +0000
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
X-Inumbo-ID: d675af11-ce17-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZUqb9SOAYipU76GmtGEBe81yDfWRuvzSOAwmA1d4z5MfVqJL118L5gc0kAlBVe7z2w0O2tE2ZCn2pQDT+f68BCfTxZDrPuAJ+HE+w7gqwVglkq+uRwwNtHjnsMU3bRn0/Iz2vX/S7zDsF69PfOxE1OcCP/zsuSMDKdNDEGDX+VbcoG6uB5dOrRHIsQWSMWjR0/UjvLCZcxw/Q1wtjzNpGb7+q2gAEgHP9D0kmyQb5Pw9lR9YVImcawvwq04fR3SNQKzpDcuyXOTQsjBj5G/ulDOKG/M9/KagdQn5/CSPvvgXnsxK+IIJbxA5r0bQctXDB/FWJ7Csib5UMlYSTv+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECfIwREF0Q6qzio+pGWhCZlG54XqiXJrnNrs4RrSaTk=;
 b=cXKFm93LPOw3qGTkJ5OZg5gqtkUuXNdcKblWaHCW1u8ZYBVYMa/OsusgT9bdcs8/h7lzjFpL35z9lQuqoZy94SEaT6gXgWmesrETLvSa0B5UpZf6+7Mzer8ZNbsA8j2IED3Cxpnn5GucQBthMaxbLsGRwjEFufkB+x6Sd6GLbr83QGSJIifJFMMQMiCRjXUgP+sqBTv8+1P48uEHMFksLg55y03NQcpnwbSzeu+7FwUlU8G43q0WdajPB1MEhpD6AiTKMHsThAk+ijEvc4ZuDZPq/ZyAFT60SL12NHtPi17THstuqWb/r6tCCYo1krZaJwAMHP5HtOvxLj1J8NqU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECfIwREF0Q6qzio+pGWhCZlG54XqiXJrnNrs4RrSaTk=;
 b=YhaG+avE5PvqEahRm0AA5f1nuFP4k/FauW+aEKyY6R8ZaojC+BCRA8iKVqkl61rxoKZ6PXDSlmv/N5mj1Dhm7pgin2qLgAutdIQHd1Jmjo9dgB82/AAlFmuWiSsZkjtO0ln4OpY+/eNsdmGGIUIXlfuQLGg39xPbPa2nKjo7fw83YLg/+d2EGS7R8eqBOOsXSG/nO1px5sEEShXSAoVOCD1IbMJ9kGx137FVaYqu3tflD0bpB1SyB9x4ekbaRRacOK7A7DWlNkDnbOW4VF7Pa/+Zfd8uH009wlEG3D3aTmSSIhxOAru0x5AfHScXpb5Wb4eViRMu33IcXzuQsGfcvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c175d1b5-972c-e311-d634-e7a68e919ece@suse.com>
Date: Wed, 29 Mar 2023 11:55:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
 <ZBNA9q5DXJYG3KVp@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBNA9q5DXJYG3KVp@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d46f12c-337b-4c06-8454-08db303bb9a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L1xGm9uvJB1CwPNxmrJGhOZKDlNc6Bcq7wwAHeDLnoQIhRH/xPxF33VIoiBCYUEgNWo9W2cG1R6he/yiqR5wQiSIkiP8P8tLThEt0zeEdJN46RYDsU0QwrfUwP58C+vnVqKIdTW0kJh19S4puU3qb9yikqp2478N+36YdFx7TVsfGjqfkt+iPejadxQOAfFK+18NcUQg/NpFZ36JQEfTdZ6z2cqOf7kh9LMxFiOxEgRgc9k2kIyiYEQtajwQKLDeYJDpIym3TtI7vEWsppGbwogQavN4uKG7+qaObaIZjmQnXUS+06fvxTh/c4hMBnfP6iwXVx8Fvj+9aD5pRauam3GS82kvH9m9N9ZnjnPINvdr4s8EOG/amQkjLC3qeyZbi+4EEmj9gFNRpzQRGFbCvhT4po0W3cyYcJHdHDQpyIvydntGxzAFJSVP/B0XecqjiRqF2lTtObbivSaEkMf0Y/x6CL2fO3exMdUtipfkcabxlp1Py58YZg6XmO3SlKw3Psys5zh7LxAVP5iRgS+r/K9zn58gf5aZizEE37dmTXLsWfJxrxiq/ijKFlrBPpslWR9UeIy6/sfDQBC6gsZsqR4dwVka+9wrpnXYf5hvTolPwljVLougabFJt5aHag+pmhtCr7W9VPyMs4WUuLNCCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199021)(26005)(53546011)(6486002)(38100700002)(2616005)(186003)(2906002)(5660300002)(8936002)(7416002)(6506007)(36756003)(54906003)(478600001)(110136005)(316002)(86362001)(4326008)(41300700001)(6512007)(31696002)(66476007)(66946007)(8676002)(66556008)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3JZVlVwdE1pbnMxbDlTclFia3hBN01KREczSnNpc2h4N1d2RHNDVU1pQlFX?=
 =?utf-8?B?bUh5SjVQSThiUmtBR2J1WlZPLzJUMCtyWXBZNko3Nnk0QW9TdmM3QitiUjVy?=
 =?utf-8?B?ejhTLzFIWmZqem45cDRUSnM2MEh0MjVaWVBYQ2JrUmpmbHRTSXRkRXpNUGFH?=
 =?utf-8?B?N01qbHI2UXBqK053bktyVTdYSktWNnZiNE9waU96d1B2WjJSU3pvbzlNcHhV?=
 =?utf-8?B?Q3E5bHBsU2NTcFdvTkljTDFpT0tUeU5zN3hsTzRtL0VJNzlPRTR5K01QNWpl?=
 =?utf-8?B?VG1IV0tFUjRSMXZFYTlTeEs1Um0zRWExYzdkSVVUdUgvdU41L3pjVXB3RmJL?=
 =?utf-8?B?L3pKc1M5QWE4eXFVc21ta1NEODFrSHpLdVJiZlFGaWI2QVdNaGtBRk5pWjk2?=
 =?utf-8?B?WTY5b2pzazd6TGYzVVdUc2VTTFQ5dkFzVHdPbitmWjN4cHZEZzRUeGwrei9T?=
 =?utf-8?B?ZEFBUG1vUXJndmdqTUR6bStqenpqUTFlTTQycDFSNUZQTklNeW5xNktkOWJV?=
 =?utf-8?B?aWZEaVZkZWNmTnhNU2o0eXVCYS9SRUlsWnU5SnNWZTRhMnd0L29LanJJMFdX?=
 =?utf-8?B?MFVINE1GL1RtcGxXTFFyMTQ4dXRHWnpmc3ZTTmhBMUtHSU9jSVBhUWJmaFU0?=
 =?utf-8?B?a3lvYm9odkc1S2l1T2Y4R1FuNFJpQXhNbitWNCtldm5Nc2lyS3BIazNIQ1do?=
 =?utf-8?B?cTRvZ2o4eHZEL0J5cXlLWkdMWkFkV3ZLVloyR3REUnA1WE53ZTVxWkpMN2lY?=
 =?utf-8?B?V2N6NVB5SncyclNycHcxUW1QSWNpSU5qMXJtRnJ2Z082cVdxeDRBVjAvYTdM?=
 =?utf-8?B?K3ptVkZ3bVpDNlREZmNtS1FYM1FZUklMakxIV2FZT252TWZlemlxeVNyNDlL?=
 =?utf-8?B?RkdkdTB5NkE2bDdTVVl1TTMxcDlUSncrUUEyYjdza0pKWUNleXQ0aXRiTXZ0?=
 =?utf-8?B?ai9UNTZBdTVrcWUyV0hiUDM4SUhHcnBwZjhwMGkzcE9FSkJrb3FWdGcwK1p5?=
 =?utf-8?B?QTYyUjA0RUEwVmJFeGJnSWFWUWh5WTQrOThtaVFodmI0SHUzNkxITWllYWVw?=
 =?utf-8?B?dEgxekR1VFhqQUtSRkl5TnlaRjM0akF4RzBUTUs4Z2lOdmp6OGxJOGxaOVQ2?=
 =?utf-8?B?bHZ0cCtZMUtBek16UURxUTNHRnE5VFlDM0dCeGczeG9EQW1KQTBhQ0ROTVpR?=
 =?utf-8?B?c3RBZUVPUUhoZ0o1TG4rdEowT2xIUWk2Q2UrWjdJMXFUWnd0bDB6VjVyQkxS?=
 =?utf-8?B?eGlxNlJTVWdHa081ZlVTMVBZQml2d2VETW45V0dFcDdDTEJHc2lLQ0pObTZQ?=
 =?utf-8?B?eitQZnRLeWh1aHVkSHZCSFRiRnFFbm1BcEFYM0pjRE5yZVU2cTBnYkdiNm1o?=
 =?utf-8?B?ZkRwU2MvR1ZMQVhRYU42UXlVNE9NeTNtYld6ZTdIa2FpWkt1ZllLNUpSSmVR?=
 =?utf-8?B?a2JtVEl1KzdXU2dHanRxU0lUTjhReTJTRFFLY0xTVGFFN3hUK3FlSGNYZzM5?=
 =?utf-8?B?RlhaYVowK1ltY3BDNXhjZ3cxeFpla09oajhQN2E0MFFRblNUbko4M2lEbzY2?=
 =?utf-8?B?VEo3a1VLeUdndDFKMml6S2dlNkZUS3A1YUJlSWltNENVVmVNSjlEeHlDTWZJ?=
 =?utf-8?B?TG9IS3RyS0xjMm1pVXF1aWw1OUkwZE90M3NTQUxrWEZIS2ZkWkdhdUtSeHdy?=
 =?utf-8?B?QTNyUHJQRTMrai85aWJqWkZLei82RDlMcXlhU0QzalFxbEl2aWdVQkhZSXJ5?=
 =?utf-8?B?MDFOTFJEV20zL2hpMHJXeGplTjJNOHdnS0RjY0N3aUZtblUrT1ZvZng5UkQ5?=
 =?utf-8?B?NXE2TC9YK3Bkd0l0RTVuWTNsMVhSaWRxMjFxVHhIME43TXFKSzVYaGd4anBy?=
 =?utf-8?B?aE1QQnQzTThaNEdrRkduTXJsTDQzQnE1a2I2NEhIeVNoNmVpWGlCNndlc3B0?=
 =?utf-8?B?NDh1eThkRUUwZ3ltY2l4dUlDUnlmZFIyWXUySm81dnNTb0t0bjRNaVZlbm4r?=
 =?utf-8?B?dUszSjFIeHVHNURGTGkreFAzMU1EMGxENk50Wk1lakNaakJDakVyNEdOMDMy?=
 =?utf-8?B?TmxVRWNHZFdHMko3aUR0eWxxbUpqRUZhWmhNRFplazUzK05UbStuSHR0d3Y3?=
 =?utf-8?Q?i7wi2/7zo4hIIzAkG7dmGA1Bc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d46f12c-337b-4c06-8454-08db303bb9a2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 09:55:28.0752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IdMGqMBXK/7yUBSS5zhAl/MFiksWY59lK37JkzkFN5LWB+B8dZbdYan6TinSfFLTIiiBn3m+6c/57MVEahk8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8636

On 16.03.2023 17:16, Roger Pau Monné wrote:
> On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
>> Prior to this change, lifetime of pci_dev objects was protected by global
>> pcidevs_lock(). Long-term plan is to remove this log, so we need some
>                                                    ^ lock
> 
> I wouldn't say remove, as one way or another we need a lock to protect
> concurrent accesses.
> 
>> other mechanism to ensure that those objects will not disappear under
>> feet of code that access them. Reference counting is a good choice as
>> it provides easy to comprehend way to control object lifetime.
>>
>> This patch adds two new helper functions: pcidev_get() and
>> pcidev_put(). pcidev_get() will increase reference counter, while
>> pcidev_put() will decrease it, destroying object when counter reaches
>> zero.
>>
>> pcidev_get() should be used only when you already have a valid pointer
>> to the object or you are holding lock that protects one of the
>> lists (domain, pseg or ats) that store pci_dev structs.
>>
>> pcidev_get() is rarely used directly, because there already are
>> functions that will provide valid pointer to pci_dev struct:
>> pci_get_pdev(), pci_get_real_pdev(). They will lock appropriate list,
>> find needed object and increase its reference counter before returning
>> to the caller.
>>
>> Naturally, pci_put() should be called after finishing working with a
>> received object. This is the reason why this patch have so many
>> pcidev_put()s and so little pcidev_get()s: existing calls to
>> pci_get_*() functions now will increase reference counter
>> automatically, we just need to decrease it back when we finished.
> 
> After looking a bit into this, I would like to ask whether it's been
> considered the need to increase the refcount for each use of a pdev.
> 
> For example I would consider the initial alloc_pdev() to take a
> refcount, and then pci_remove_device() _must_ be the function that
> removes the last refcount, so that it can return -EBUSY otherwise (see
> my comment below).

I thought I had replied to this, but couldn't find any record thereof;
apologies for a possible duplicate.

In a get-/put-ref model, much like we have it for domheap pages, the
last put should trigger whatever is needed for "freeing" (here:
removing) the item. Therefore I think in this new model all
PHYSDEVOP_{pci_device_remove,manage_pci_remove} should cause is the
dropping of the ref that alloc_pdev() has put in place (plus some
marking of the device, so that another PHYSDEVOP_{pci_device_remove,
manage_pci_remove} can be properly ignored rather than dropping one
ref too many; this marking may then also prevent the obtaining of new
references, if such can be arranged for without breaking [cleanup]
functionality elsewhere). Whenever the last reference is put, that
would trigger the operations that pci_remove_device() presently
carries out.

Of course this would mean that if PHYSDEVOP_{pci_device_remove,
manage_pci_remove} didn't drop the last reference, it would need to
signal this to its caller, for it to be aware that the device is not
yet ready for (e.g.) hot-unplug. There'll then also need to be a way
for the caller to figure out when that situation has changed (which
might be via repeated invocations of the same hypercall sub-op, or
some new sub-op).

Jan

