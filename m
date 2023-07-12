Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BB17502A1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 11:15:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562094.878658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJVwI-0007dl-Tq; Wed, 12 Jul 2023 09:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562094.878658; Wed, 12 Jul 2023 09:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJVwI-0007bz-Qk; Wed, 12 Jul 2023 09:15:14 +0000
Received: by outflank-mailman (input) for mailman id 562094;
 Wed, 12 Jul 2023 09:15:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJVwG-0007bp-JN
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 09:15:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 995ff8f0-2094-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 11:15:10 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM7PR04MB6981.eurprd04.prod.outlook.com (2603:10a6:20b:103::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 09:15:06 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 09:15:06 +0000
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
X-Inumbo-ID: 995ff8f0-2094-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cp87fV6KVPF87LjmSTFxVEPu7ZMshvERllRfhAO5HOALXsrNiqtRnIBSDb8u9VQ4L7HtEwmrP8QICAxpNuVLoRQVoma6zGbIYickcNSlI/DAQJO3ACtTApRlGo+SyGA0ngkEF9k4L+w1AprqX5u1nQiOa4J/lYg1Csiij2CqKVEtA9m+7lun6omXmk4sNxpnhadKGAt/v5YNYoE/uPBnWuaWB1XCgvnCiiaFS+MSIEzPuWL/gy6FrLWOkbjXTmbiwf2/+oE95fLOvgh0a2fHNzoKZjfY89iL3C+XHeAJlzWeQL63w/FLjFjSki6TnFhGvmQo0RDirAGlNc06prQqEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ts4v3umcPW/luaRlyh4QjGIcut16SrfPkRDGRVu08Ck=;
 b=LdAj4sj4SRRVcOlinc/EeAMKeeGcFp7yyamHxy57tbvIBc4fyWSM7clTUZlx8FDbk/7RN6WcfLLbUhKpr5Q3Gv/Vrbq28tZOmb9gCGwt92CW/oHUOBShyXpErTMrStPJLPlK6gMFG+rd7q8sJvly1t2XDmPylXXHu9EEtvMwQyrUnSub+6e2UFdWD8Qc5SxZsSjHsCePqb+x+qhNCRR02p48JpDyVhbemO6GETZRyaiNCea5lJKutfnDZdhsRsQ8T+HZfAfoJ82XIyv9+AdhMcAexYZdoRUXl6gVCn6Ri6rv5Z0lCPRCeC3eojHHRcvQJh/iu6TIKbpit60pBdCPyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ts4v3umcPW/luaRlyh4QjGIcut16SrfPkRDGRVu08Ck=;
 b=VCUuvwzW60kr6LbcOutLg/OApZFWPExf62hUHfEwlIhDsuZ6zbUiQtCusbbDzH2+yVt4rgLCi3XNynRQlZBmGh+3bEtoXjzoBisg7nUDH74tBzD5a9flV2UNzrbys4Hpcia7tjrHr92AWQPYSRy/HliKw745jqffOs2KpOrzbVm3SqqNQ4H75q3aDdc519ZBBFHFTAScAXJlqVEXhh1rjF9Qk0jh6IRVJWbfjFjsJIy97UQ8nmkcUI4pcGNKkOufaiUuA7lINJ8uurPIc20OS3rvw4aM09DuIWZplATrRnA2yDsNiIGeclXXhWs8QbSCWEd+B7vq1gDagzYrMMqeQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c0ba8144-3e3e-1f98-a719-ea03e9f29495@suse.com>
Date: Wed, 12 Jul 2023 11:15:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH] pci: introduce per-domain PCI rwlock
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230711004537.888185-1-volodymyr_babchuk@epam.com>
 <e6ca0ef1-fb66-d923-388f-79cfc20d1626@suse.com> <874jmagulx.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <874jmagulx.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::11) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM7PR04MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: 7382b5d9-b78b-4181-80a3-08db82b87bc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ahcWpndPex7X37P4bDSO+lOGvtBtDGn+SD+W2t1FsPBVGxYQ4HQL6VslekyTXm54bh5ENNcVqGSUr7W7gauMBOZE8zNJq+Wddx5LYqsRR9m2+qX4WiKRXF3OrQP4+3ATGYLIyiX+C2XlrpNRp1dJmEIrEoHTRtzdZ/ZQ0yDDJ2UKRxS2Jf4Jqf1S1YuwK30EwGtb4oeS+cKiTmtU+WZ/N658uq921JRnL/h/zSfDyjdbZobRxQcVTm82S+eI4z6sJEOdz0I6MHkDIdoGWO0sL4ECNXPN6WJlU9imNm+VbUTu2G3RiV7T2Z6bZtJBrdbqMz1fQgQcSe7aKw1TSzCfnb7Ek/eN/xQ2CAYtLo0BuCT6yOKE4Lep+bGqcLUi6N5QFMJVgvgfmqaqtNbeoFLURoHH2eyw9JmAFqB15HwybgFElHDUA/z3J+3cwYovRmu6Wm3Gl0hr8cwbECHxSYV90zFVrl/DNXzjSW5T1PIEGxubzViEr07ZXmR4iaJ/l+vzHzd94Fs2iLEK3888Ucs8oxZEgtKYzl9xXkogwNwWKhNXl6CPM6ejwl0VCjnA8aIlWxIe6DP4YOdj2ID+FyUQY4pJGA8JppxHntbReGf3xO2sxi+Jv6Ok2vZ1CCLZ4+rWSx2ZT8XWWd/iSZ+tBF+sFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(346002)(376002)(366004)(396003)(451199021)(2616005)(53546011)(26005)(186003)(6506007)(66556008)(6486002)(316002)(4326008)(83380400001)(6916009)(6512007)(8936002)(8676002)(7416002)(66476007)(66946007)(5660300002)(41300700001)(2906002)(478600001)(54906003)(38100700002)(31696002)(36756003)(86362001)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVJSZlplZi84dmFncGlaWkllVjZ6eHEyTXpQUWUycUROWFpBUkErRUZ6czgv?=
 =?utf-8?B?d1VTcjVtcUxMRlVNZmxuSm9HYnRDK1EwRFhhVExlYTFPVlZnejhJTFo3cHpW?=
 =?utf-8?B?ZnR1K294RmVTWmlPTGRmNnp3bFV3L1JKR296UmowZnR6ZTY4SVZRV24rRlZi?=
 =?utf-8?B?UVJmOFhudTJQMEcyNWRjTTdkK0g3elViZWtyR2IrdXYvZVhacjhoT1NEeVRx?=
 =?utf-8?B?UUZZSmVqemFNNjA3MHlVUjg4S2JheVBTTStaQmM0MmRiRW1UUkVwRmE4UHNJ?=
 =?utf-8?B?OXNyNDU0NFRUZlVjYmp0bzdGd1J1L2Z4QmhhQ0hNVWJpWnE4VHpMTk1BbU8r?=
 =?utf-8?B?K2F0Wk5sRGREMXlWK0xBaWdBblhBSjF5bElNbkZTU0t1ODEzTnNzMmhWbWsy?=
 =?utf-8?B?bU1tNzk0dktySFRWeFY1Zkx1Q3V6M0NaelY4cFk4T21vdWtCVGZ2R0xMSEM5?=
 =?utf-8?B?dC9iakdNV0dZaXp5TDB5akIrUnAvYkp5bGJZZkUvSEV3TGxBcjBubTk1VEt1?=
 =?utf-8?B?Rks2KzBXdSs3V2NrZ0sybjlHWXFWMHFDdlI0RzVtVmpkNHVuQ2UxTUJqT2Fa?=
 =?utf-8?B?bFlrSmdHU2pUOEdoV2VyaVF5S3EwUDBQT1RIRlI2STViM0VYNlRac3ZCN1hU?=
 =?utf-8?B?K2lRWHRGOTdhNnFDSGhZSU5MaElHSG96UjZKbkg0VldITzdiZDY4b1FKZ2Jp?=
 =?utf-8?B?VmJwd3duWjIyQkdOTTRwRDl2WlhmcHZrOFZwdWR2bnZCQ1UvVjR6bmhOSVlJ?=
 =?utf-8?B?NnNwa0JNTFp4VkdscHhzZUhVU25GQXAyUUtNeE1MUWR2Mmo1aTVlTERFR3F5?=
 =?utf-8?B?akRvSUVYSVhDd0gxeUZQdWdlNGU1dUp3dHdmd1dta1VXVCtrVkFVa1F5Ri9F?=
 =?utf-8?B?cHNWMlVobVdNZVFnMVRnV2R4azBLVW5UL0pBemYyQmVIQVJ2ZFEvTzNYeHFh?=
 =?utf-8?B?cW1lWkFuclUzS0pITVNHK3g2ZDcwSTdUa2R6OU1Wd0J2ZFFORUlwOVE4clBa?=
 =?utf-8?B?cXdSK24zcjFBdW1aOHdvcDc4dm5ZTEpoc2Mva2hzRzVZKzU2UkFBZFF3QXVl?=
 =?utf-8?B?cGVISk9TUFZiVW5XZ01Jb1ZCczNmTTVScFJRT0NsK1lRNi8xT3ROUHNzZGVh?=
 =?utf-8?B?a3ZJcWdsR2lsdk5XR1Q0bUJ2K1JBSkxpZm0vWTBselJoaVVOZVVQWXgwYXdz?=
 =?utf-8?B?QzRmK0VGRlZ3ckpkMXBZUlcwbTE2SHNYSDJnTFZCeU1yOUgvVktrcDBrTmdj?=
 =?utf-8?B?QStHaUgrdnNJa3hSajkvNmhleUJGMDFpY0FSajJhVmJabnJ3UU9YNVIvNUpj?=
 =?utf-8?B?RzR5SzhvOFFOSGJuZnJpNzY1SldpSURQSlVmWGEzc3Z0SmpCeWl0YXE0Z3E0?=
 =?utf-8?B?eGJuQVdYZ0pnUENIeDJXS3J4U3JMb2hpeU9mUzhCSTVLdk1FS2hKK05iaHoz?=
 =?utf-8?B?dlpKYVhaakc4N3lVWTZKcmQ3S1VIb1NDUXZUU2RHZ01YcXlCdWRFaTBpdExx?=
 =?utf-8?B?SGRITHFvQXc3L2gzanVkUHM1Rkw0VVMxUHpjckdzYXNBMHJ4RmFhYXdwMXBL?=
 =?utf-8?B?WnBWajdSNHVBTUNXaTBxVUdpQ3VCNXFpU0xIcWxWVk9SUWJGdUVIQlE3YlNO?=
 =?utf-8?B?ZFZ5YjRNQ05nTWRqR3RQTUVSVEcveThZQk1GdGlLTXhPZDdEZndtNW5Tb2pE?=
 =?utf-8?B?cXBkRnVtNXhqRWpJOEJkM1pWdy9nSmdNcGN2d1hXd09kRVBMMDNDSXRKVGhF?=
 =?utf-8?B?OFJUaS82N2hmTjNUNGEvTlVYaHdFNFdBQ09kb3ZlR25HMnJ1SzMwdUp3aGc0?=
 =?utf-8?B?TVFwUUt0bnNIU1pWSUlKRW9BVkc3NnhzL1huSU1qSDdNLzdiYWdETDFNcnhP?=
 =?utf-8?B?cmplemJIS084QTlRWTBHcWFwYU04YURYNjJUQmMxdGhVREd0MHlLZWtFOU9U?=
 =?utf-8?B?aFBYMnMyS3VVY2JybEFlRlFFSHR4WGsyaUIyTU82R0pyWHJ5U1lCK0tONS9p?=
 =?utf-8?B?SGFoUzl2Rjc5ZVhnTjNWdXhTd1JSNEE4VzBXbGdST2hVRjhhMUtOeTFqQ2Mr?=
 =?utf-8?B?cmhlZ0VhSzVoQ1UyT05SWDB1RzB0dGt2RHFHc1pvcU96NHdQNk8waU52dHQ3?=
 =?utf-8?Q?B0IvSOYqHGzeqrMOt8HSFMQC2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7382b5d9-b78b-4181-80a3-08db82b87bc7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 09:15:06.6195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylDttuKhkiyBXDYGo2o6L2DrMpj3njfqNRbP+CplnPn9OJlM5Ywzjt1J52s6+Od9w2pNetH4yfSVG0LRh+6fTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6981

Up front remark: I'm sorry for some possibly unhelpful replies below. I,
for one, am of the opinion that some of the issues you ask about are to
be looked into by whoever wants / needs to rework the locking model.
After all this (likely) is why nobody has dared to make an attempt before
the need became apparent.

On 11.07.2023 20:40, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> On 11.07.2023 02:46, Volodymyr Babchuk wrote:
>>> Add per-domain d->pci_lock that protects access to
>>> d->pdev_list. Purpose of this lock is to give guarantees to VPCI code
>>> that underlying pdev will not disappear under feet. Later it will also
>>> protect pdev->vpci structure and pdev access in modify_bars().
>>>
>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>>
>>> ---
>>>
>>> This patch should be part of VPCI series, but I am posting it as a
>>> sinle-patch RFC to discuss changes to x86 MM and IOMMU code.
>>
>> To aid review / judgement extending the commit message would help, to
>> outline around which function invocations (and for what reason) the
>> lock now needs to be held. Furthermore lock nesting rules want writing
>> down (perhaps next to the declaration of the lock). Therefore comments
>> below are merely preliminary and likely incomplete.
> 
> I added lock in places where underlying code touches d->pdev_list. My
> intention was to lock parts of code that might depend on list
> contents. This is straightforward in case we are traversing the list, but
> it is much more complicated (for me at least) in cases where
> has_arch_pdevs() macro is involved. Prior to my patch uses of
> has_arch_pdevs() weren't protected by pci lock at all. This begs
> question: do wee need to protect it now? And if we need, which portion
> of the code needs to be protected? I did my best trying to isolated the
> affected parts of the code.

Well, yes - these questions need answering. And since you're proposing
these code changes, your present understanding wants writing down, such
that (a) we can use that to make corrections to the (intended) model
and (b) we can match intentions with actual implementation.

>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -2381,12 +2381,14 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
>>>          }
>>>      }
>>>  
>>> +    read_lock(&d->pci_lock);
>>>      if ( ((value ^ old_value) & X86_CR0_CD) &&
>>>           is_iommu_enabled(d) && hvm_funcs.handle_cd &&
>>>           (!rangeset_is_empty(d->iomem_caps) ||
>>>            !rangeset_is_empty(d->arch.ioport_caps) ||
>>>            has_arch_pdevs(d)) )
>>>          alternative_vcall(hvm_funcs.handle_cd, v, value);
>>> +    read_unlock(&d->pci_lock);
>>
>> handle_cd() is non-trivial - did you you audit it for safety of
>> holding a lock around it?
> 
> Well, I only vmx_handle_cd() implements this call. I scanned through it
> and didn't found any other PCI-related things inside. It acquires
> v->arch.hvm.vmx.vmcs_lock, but I didn't found potential for dead locks.

What about overall lock-holding time, which may affect other CPUs and
hence other security contexts?

> On other hand - do we really need to call in under d->pci_lock? What bad
> will happen if has_arch_pdevs(d) will become false during handle_cd()
> execution?

Much like with log-dirty enabling, the main question is what existing
races there may be plus whether things are at least not being made worse.
(Ideally of course by introducing better locking, races would go away if
any exist.) IOW here it would certainly be better to drop the lock before
doing expensive work, but than guarantees are needed that
- the state checked can't change until after the operation is complete, or
- the state changing is benign.

>>> --- a/xen/arch/x86/mm/p2m-pod.c
>>> +++ b/xen/arch/x86/mm/p2m-pod.c
>>> @@ -349,10 +349,12 @@ p2m_pod_set_mem_target(struct domain *d, unsigned long target)
>>>  
>>>      ASSERT( pod_target >= p2m->pod.count );
>>>  
>>> +    read_lock(&d->pci_lock);
>>>      if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
>>>          ret = -ENOTEMPTY;
>>>      else
>>>          ret = p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/);
>>> +    read_unlock(&d->pci_lock);
>>
>> Hmm, is it necessary to hold the lock across the function call?
> 
> Well, I am not sure. Will it be okay to just check has_arch_pdevs()
> while holding a lock? What if it would change it's result in the next
> instant?

PoD and pass-through are incompatible with one another (just like
global log-dirty tracking is). Therefore this and the other side
(like also above for handle_cd(), and like for log-dirty below) need
to make sure that a state change either can't occur or (not
applicable here afaict) is benign. As outlined for log-dirty in the
earlier reply, this may involve doing part of the operation under
lock, until it is safe to release the lock (and yes, below for
log-dirty you validly say this is somewhat fragile, but what do you
do).

>>> --- a/xen/arch/x86/mm/paging.c
>>> +++ b/xen/arch/x86/mm/paging.c
>>> @@ -205,21 +205,27 @@ static int paging_log_dirty_enable(struct domain *d)
>>>  {
>>>      int ret;
>>>  
>>> +    read_lock(&d->pci_lock);
>>>      if ( has_arch_pdevs(d) )
>>>      {
>>>          /*
>>>           * Refuse to turn on global log-dirty mode
>>>           * if the domain is sharing the P2M with the IOMMU.
>>>           */
>>> +        read_unlock(&d->pci_lock);
>>>          return -EINVAL;
>>>      }
>>>  
>>>      if ( paging_mode_log_dirty(d) )
>>> +    {
>>> +        read_unlock(&d->pci_lock);
>>>          return -EINVAL;
>>> +    }
>>>  
>>>      domain_pause(d);
>>>      ret = d->arch.paging.log_dirty.ops->enable(d);
>>>      domain_unpause(d);
>>> +    read_unlock(&d->pci_lock);
>>
>> This means a relatively long potential lock holding time. I wonder
>> whether lock release shouldn't be delegated to the ->enable() hook,
>> as it could do so immediately after setting the flag that would
>> then prevent assignment of devices.
> 
> For me it looks a bit fragile: we need to rely on some hook to release a
> lock, that wasn't acquired by the said hook. But I can do this. It
> should be released after setting PG_log_dirty, correct?

Yes (s/should/could/).

> BTW, I can see that hap_enable_log_dirty() uses
> read_atomic(&p2m->ioreq.entry_count), but p2m_entry_modify() does just
> p2m->ioreq.entry_count++ and p2m->ioreq.entry_count--;
> This looks inconsistent. Also, looks like hap_enable_log_dirty() does
> not hold &p2m->ioreq.lock while accessing entry_count, so its value can
> change right after read_atomic().

I'm afraid it you look closely you'll find many such inconsistencies.

>>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>>> @@ -102,6 +102,8 @@ static bool any_pdev_behind_iommu(const struct domain *d,
>>>  {
>>>      const struct pci_dev *pdev;
>>>  
>>> +    ASSERT(rw_is_locked(&d->pci_lock));
>>> +
>>>      for_each_pdev ( d, pdev )
>>>      {
>>>          if ( pdev == exclude )
>>> @@ -467,17 +469,24 @@ static int cf_check reassign_device(
>>>  
>>>      if ( !QUARANTINE_SKIP(target, pdev) )
>>>      {
>>> +	read_lock(&target->pci_lock);
>>>          rc = amd_iommu_setup_domain_device(target, iommu, devfn, pdev);
>>>          if ( rc )
>>>              return rc;
>>> +	read_unlock(&target->pci_lock);
>>
>> You need to drop the lock before the if().
> 
> Yes, thanks.
> 
>>
>> Also nit: No hard tabs here please.
>>
>>>      }
>>>      else
>>>          amd_iommu_disable_domain_device(source, iommu, devfn, pdev);
>>
>> Related to my initial comment at the top: It wants clarifying for example
>> why "setup" needs to lock held, but "disable" doesn't.
>>
> 
> Because amd_iommu_disable_domain_device() does not access d->pdev_list,
> while amd_iommu_setup_domain_device() does.

I was guessing that might be the reason, but to be honest while looking
at the function I can't spot that access. I clearly must be overlooking
something, which may be that the access is in a called function. Yet as
soon as this isn't obvious, a code comment can make a significant
difference.

> Anyway, I am interested in AMD IOMMU's maintainer opinion there - what
> is the correct scope for lock?

To determine that (and to save readers like me from re-doing the work
you must have done already) is why I gave the earlier comment.

>>> @@ -2765,6 +2767,7 @@ static int cf_check reassign_device_ownership(
>>>  
>>>      if ( !QUARANTINE_SKIP(target, pdev->arch.vtd.pgd_maddr) )
>>>      {
>>> +        read_lock(&target->pci_lock);
>>>          if ( !has_arch_pdevs(target) )
>>>              vmx_pi_hooks_assign(target);
>>
>> I'm afraid this and the unhook side locking isn't sufficient to guarantee
>> no races. Things still depend on the domctl and/or pcidevs lock being
>> held around this.
> 
> I have no intention to drop pcidevs lock at this time. Honestly, I am
> not sure that we will be able to do this without major rework of IOMMU
> code.

Of course, and my remark wasn't intended to hint in such a direction.
Instead ...

>> As which points acquiring the lock here (and below) is
>> of questionable value. In any event I think this warrants code comments.
> 
> Well, it would be good to take the lock for the first half of the function
> where we deal with `target`, but we also accessing `source` at the same
> time. To prevent ABBA dead lock I opted to number of finer-grained lock
> acquisitions.
> 
> As for "questionable value", I am agree with you. But, if we want to
> protect/serialize access to d->pdev_list, we need to use lock there.

... I did ask to assess whether acquiring the lock (without other
locking changed) is useful, and to put down the result of this in a
comment - whether or not the lock acquire is retained here. IOW in
one case the comment may say "lock not acquired here because ..."
whereas in the other case the comment might be "lock acquired here
despite ..."

Jan

