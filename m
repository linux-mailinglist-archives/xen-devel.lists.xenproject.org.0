Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 207056CD530
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 10:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516114.799711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phRVj-0001re-SU; Wed, 29 Mar 2023 08:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516114.799711; Wed, 29 Mar 2023 08:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phRVj-0001pF-Os; Wed, 29 Mar 2023 08:50:27 +0000
Received: by outflank-mailman (input) for mailman id 516114;
 Wed, 29 Mar 2023 08:50:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phRVi-0001p6-Hi
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 08:50:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be71298b-ce0e-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 10:50:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8483.eurprd04.prod.outlook.com (2603:10a6:20b:34b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 08:50:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 08:50:22 +0000
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
X-Inumbo-ID: be71298b-ce0e-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HODU2ap3wxttrYE+nj0+9XhMTE7/xriCOd6BTn+BP1U/rkOMqzcYhImlTuLRHecOptAz6MIqjUM8ZWjnmXoG5M+d5nizsMRwJb0kuvtXNuCiAK43bq4XjP55f8N+WcIkhhZ/8J2RlMSknKkwmkCxN6/r0786WAQsx+P219RPYllj3KbAsZ04/oaPDD7K9yVmFs0lQ48EXcwF5lMPm6Qy6IHqmX0XcUHSmnQcX9s/Y1xwxc2t6DdPCt5/oDM78SXUhJx92syz1o2pkSbkovqm/9HIhz+bV4OEEqoAE5vp/m8TY3Wx7bgOkDABKdfNsCjtwQXwZLSwOC/mIo9ABfjrcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDwTQjm9f4YS0A6Zf/UkCq2GJX8v/ebzIxfJ7bjcWB0=;
 b=gaRUEkkNujS2LlvrMlc3Bmn/Lem2jkOvLd+Q7jzXu1cMzgKqs2G7C/qkwF/SFuLeaLzHOzluHSceEnxZrAskmv1REQ/FcpUmKMm8ePXTIw/AzDrzvGlsPMdnMxifmhlhJZd0H3kVZYMkO7GmCaRfCnGUjdcRa12M+CNSe5H9HYUVRoEERtzpt0WVsPDAf3TAuR3U+ujgvAunqT1PFs0oq5V9xhK3p9b4pHWte0BeEWTsPqIq7r6Q+AJB753gKCPGs5hx/QpjYhbnvtOjGy7cGmVmhdf3B597IWU0RQRHCiXYLS1TfCEEsBblkJWDDnGhSM3wiWmsqG7kWlyVim0R8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDwTQjm9f4YS0A6Zf/UkCq2GJX8v/ebzIxfJ7bjcWB0=;
 b=p1yL8hCH7C770sUp7r4gADhEqjbKAEk6xgf2WOEKZn1/5eHvq75a8x66bFWkvdxe1SeqobSFy+hvA2C+nNsGT2NgPmojD4KharVQL+IZ2t8tCBM8fk8PuS3um3Tqd/K7u8F95XBYUdu6Wx3Lb4ibPgYz9kSyZzs5TU5taAxSOW9hFLlO3FqyA73auYD7z8e9IIpEwCbDqQBb1rXh1vFXjoZjFnVjM0jgokx0yY34nylNiV+a3wCutHyfASGMtJ6pxQOZLiht+C1MGyDsU8HXeKxdNAmHrfFDIKvFblyeR6RPbd4nETJ7abpX4iptgqErLgp/7YcuGyqXIb8BZmqYvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e238bffa-5eba-b18f-ed73-1c5c9730cf70@suse.com>
Date: Wed, 29 Mar 2023 10:50:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] x86/mm: add API for marking only part of a MMIO page
 read only
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.0fffd3f3080b5eeb8d22126eda6088734bb0c926.1679911575.git-series.marmarek@invisiblethingslab.com>
 <f5381e06d92cccf9756ad00fd77f82fba98a9d80.1679911575.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f5381e06d92cccf9756ad00fd77f82fba98a9d80.1679911575.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: d572f895-60b6-4e0c-257c-08db3032a188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dg411uFw3HKiYorjYzQ4hifBL9EinMfn4X4km4+CL2GyfmcefxJExktRDK2UFqboUfy8uJ9QE9Sp9ablQDdRygiFqV4M+sqGd2Qbxfd773uH4G6qUMT3AT/nCCMx4TS7kUePhmWSao7xs9ilNMBA74848NNPLm2/L/FedMJyZO1S/Fip213rWiIqVTWEuPl7uunn7S31V5jWjfweg9bDBPKiR5wWqgkNLZGpJfN0QP0qiG/wHX9R0kFF4nM0qn0UoVlV/lS1g3WeqAdnd9BvSx9p+jpyX0IQ7+6mXmvSc/bv6nq30idf9Qz+h8RLacS/c7HtSMla5lphIyw6J21vFF5qUhXWE8kpGcA3zCWK60KYZOWvyYSMWxEtAmDQ+NoWXhfgdM2+PbxSAhGssSChmqSAfkTxPzut/IQBBh+7gdgAer3/7vlSCr2ca03OveyonI5+XIjr/tl9StJsXK3TPbc3wjouVjd0KUyFb8+ZtTtNDAQWAwm76bddenVn0TEk5Bfd+ODNNnJHSVfR6PJ03ezgxJI/JQ4XBpO63BXGPGo7mEFsaS7znTiWwWM7mBUiYh7B5bO7bfCuOC3mnp/3QfUa+NllkFfVBoPQxsOoCtQ8uZuEfQnhFi4+IQRBgWLBlZxBW+KLIGhF9i7LVd61WQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199021)(53546011)(26005)(6486002)(38100700002)(2616005)(6512007)(66574015)(186003)(2906002)(8936002)(5660300002)(36756003)(6506007)(54906003)(478600001)(316002)(41300700001)(31696002)(86362001)(66476007)(66556008)(66946007)(6916009)(8676002)(4326008)(31686004)(83380400001)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHEzeFA5TVlYbUhaejF2bVdTSmx4TkZvbnoyUDVFWXBIQ1l3ZzQ1ajd1UnpN?=
 =?utf-8?B?U0tYT0hxMDlkOG1uMmpmL1VMbGVvR2NobUViYUFMZ25hR2lMb2tIODVYNGUx?=
 =?utf-8?B?MW5LZkNQL3ExOFBXRG82V29ybGpPMEFDVWloQTJQYVNDTkVhOFhLS2NSNEFJ?=
 =?utf-8?B?UUhDTGNXaFpZL2x1Z2lQN1F3UTcyYnZ0Rlk1ZDloS1BiZVYwdmZTamFHeG96?=
 =?utf-8?B?RlRxKys3T1V2SmFJOGdXanpDVG92azlVekx6NEpLbjNwQ2tjWVNvOFdQaFpY?=
 =?utf-8?B?SXE3cWZRVnNHeDV2Yng1NXZIS3k1aHFabHhpVVVTRnQ5VkpNaVBLbjhhZGUw?=
 =?utf-8?B?NVRnSi80aXVwTFBZR0tobGZSTllhNGozOXJQOXQ1YnZOM3NKdDkweURyTzBD?=
 =?utf-8?B?VFRxaVZxRm0wVXNaeUxaZlBXckZIbXlyR3FUSzUyTTBBekdmMFNGWXB1SVl0?=
 =?utf-8?B?YmMyWHVGc0hWVS80SkxuaXBDazdTbXEvM3FySWxkK3VaNlhXY0JKbm5kUHY1?=
 =?utf-8?B?b0ZzV0lUaHNYSlk0LzB5ZlEydlBlUTNDT0d6VkduVVRKaEQxSGJmd2pwckhz?=
 =?utf-8?B?NlVGakFRZHEreDlFRWh2eU56anhkVWR3NXY3M1FhZGpoeWhURkRnV2VNejM5?=
 =?utf-8?B?MkpQZ0RJZ3Exc1lTSmdhWGRIOEV6SDFYcTE3SFNsV0JjVUhQYnNXVi9zUW5L?=
 =?utf-8?B?K3JRVW04VEtEUk9rVjJ3T0pZVHJPSExlak42NGxWL09kbkVnU1dtK3d5VGQ5?=
 =?utf-8?B?aUNkTE9OV1loNG50dlBJeVM0VllSUHB4NG51dlZWUTdRRCt0a2wxWGp3Tktx?=
 =?utf-8?B?YldDMDhJK3RxYzhIWk15Yk9xVGtHMk9LRXNiREd4TkpyVmoyNmp3Sjl6SFZF?=
 =?utf-8?B?WXBwbHJWTktTZjFQczJTRUZmdDR4WUlXdmN2Zi9mblFnbDBnYzI3ci8yczc0?=
 =?utf-8?B?L0ltZ1BTT01kWVRGZjQ4dG92SDFGZzJGOTlobzlWeCsvbEtmaG9OMlErSVNo?=
 =?utf-8?B?RWRpOEhVWkZBN0hiRTllOWdTalhWWkxFV3Vad0Y2Vks2d2k2dEJFdkRoUXJp?=
 =?utf-8?B?VnhuVkJOQmVOYnMrRjQ4RmpzOSszTzRRd3U3U0dCRStnNzd1Ry9CaDZVU29z?=
 =?utf-8?B?b1NjTFptSVBFcXVic3V5VmJYN1BBdURQK1VnZFUyTE5QZzIwRzRia1NiZkVk?=
 =?utf-8?B?bklsZ2ZiaFFKa28ySkVUcnMvaDEydllWeDJjZ0JtbFRyS1VGSGowOFp2V3RN?=
 =?utf-8?B?am13b0ZIL3BHUlR6TmVIdzZMVmRKa0ZHL0tWN1ZhSXhFbDVnTHpTc1B5azlE?=
 =?utf-8?B?eVQrUEF1bWJtV0RBbzBMc3pKQUtuTDRJZm5vUzh4LzZ4OW9odGtCNk8rZkhy?=
 =?utf-8?B?RitraTZqcit5U0h3TTFTcWtNc1JIaTZkSitzT3ViZFRTaUVoQnQwbER4R1lh?=
 =?utf-8?B?Rlpxb2syTkJMLzFNcm1rNGZjOU5hU0dvTmJwakp6VDlsenFQeEk0Z1NyeHB4?=
 =?utf-8?B?ZmkrTFlBbU9KLzNBdEtFWE94ZEtrZm5teUoya2FHRW90bFFEZzgrMGxrVlpN?=
 =?utf-8?B?R3pNUFhHd0FHNjd5QU02bWdrR1I0NTg0SjJkclIramRvSHJiT3JYYmdrN09r?=
 =?utf-8?B?cThEZCt4QjEwUkg3bnowQm1GNEJMRml6aUJ2dVRjQjBYWUF4bE5lZGVtYkt1?=
 =?utf-8?B?bGxsL3gwTFhOSng0dXAvWFMvUFFYUHZ3U3RDS29rMWJOSjkxUTNLbXFKR3Q0?=
 =?utf-8?B?SmZsS0dwd3N6NjhiTlNYUnRvd2paSjh1Y2crK2hQY3ZKd2htckRRTkQyTVNi?=
 =?utf-8?B?VjdIUVJZNEo5aFFBY3Zyb2xyZCtjd3NkMSt2aXJRUGZrUDc3RGE1VTlYM0d6?=
 =?utf-8?B?dXFLRlFWOXZRc2Y4d2l1VXp3WnN4OG9UZWwzbnpPMThsY1g5QTVWbEtmRFV6?=
 =?utf-8?B?akI2aHVEUmlSeUJGUmFVeWlyS1lyZnJ6d1NFYmZUS1ZQM04yckVWL0NSV1ll?=
 =?utf-8?B?YWkrOUlKMndMYjJnU0tDTWMxK3BjdmhBM2hCNGFOOTVhNVI4SEQ4YS80ekps?=
 =?utf-8?B?aXRGQ1ZhV3J5SUNDS3oxZ3hVSEg1eFBlL3lsSG5XVzU1UzdMVTUzcFIxQStz?=
 =?utf-8?Q?A3RbGyD9VtCJR2mkTAsw9OQGu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d572f895-60b6-4e0c-257c-08db3032a188
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 08:50:22.1443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OS9yXcqxwBhBSbKQ6jVbsHhBN0BabmV8WZ2zNV2CZn5l13iXR1R9FMCTg5u7trZxTQmLSI25sA6nflWF+hV/FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8483

On 27.03.2023 12:09, Marek Marczykowski-Górecki wrote:
> In some cases, only few registers on a page needs to be write-protected.
> Examples include USB3 console (64 bytes worth of registers) or MSI-X's
> PBA table (which doesn't need to span the whole table either).

Yet like the MSI-X table the PBA is not permitted to share a page with
other registers (the table itself excluded). So a need there would
(again) only arise for devices violating the spec.

> Current API allows only marking whole pages pages read-only, which
> sometimes may cover other registers that guest may need to write into.
> 
> Currently, when a guest tries to write to an MMIO page on the
> mmio_ro_ranges, it's either immediately crashed on EPT violation - if
> that's HVM, or if PV, it gets #PF. In case of Linux PV, if access was
> from userspace (like, /dev/mem), it will try to fixup by updating page
> tables (that Xen again will force to read-only) and will hit that #PF
> again (looping endlessly). Both behaviors are undesirable if guest could
> actually be allowed the write.
> 
> Introduce an API that allows marking part of a page read-only. Since
> sub-page permissions are not a thing in page tables, do this via
> emulation (or simply page fault handler for PV) that handles writes that
> are supposed to be allowed. Those writes require the page to be mapped
> to Xen, so subpage_mmio_ro_add() function takes fixmap index of the
> page. The page needs to be added to mmio_ro_ranges, first anyway.
> Sub-page ranges are stored using rangeset for each added page, and those
> pages are stored on a plain list (as there isn't supposed to be many
> pages needing this precise r/o control).

While, unlike Roger, I don't want to see mmio_ro_ranges' granularity
changed, I wonder if a bitmap isn't going to be easier to use (even
if perhaps requiring a little more memory, but whether that's the case
depends on intended granularity - I'm not convinced we need byte-
granular ranges). I'm also worried of this yet more heavily tying to
x86 of (as of the next patch) the USB3 debug console driver (i.e. as
opposed to Roger I wouldn't take anything that's x86-only as
justification for making wider changes).

As to sub-page permissions: EPT has, as one of its extensions, support
for this. It might be worth at least mentioning, even if the feature
isn't intended to be used right here.

Taking both remarks together, limiting granularity to 16(?) bytes
would allow using the advanced EPT functionality down the road, and
would at the same time limit the suggested bitmap to just 256 bits /
32 bytes, which I think gets us below what even an empty rangeset
would require. Plus lookup would also be quite a bit more lightweight.

> The mechanism this API is plugged in is slightly different for PV and
> HVM. For both paths, it's plugged into mmio_ro_emulated_write(). For PV,
> it's already called for #PF on read-only MMIO page. For HVM however, EPT
> violation on p2m_mmio_direct page results in a direct domain_crash().
> To reach mmio_ro_emulated_write(), change how write violations for
> p2m_mmio_direct are handled - specifically, treat them similar to
> p2m_ioreq_server. This makes relevant ioreq handler being called,
> that finally end up calling mmio_ro_emulated_write().

I wonder whether that isn't too heavy a change to existing behavior.
I understand that taking this path is necessary for the purpose of the
patch, but I don't think it is necessary for all p2m_mmio_direct pages.
Checking at least mmio_ro_ranges right in hvm_hap_nested_page_fault()
looks reasonable to me.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -165,6 +165,19 @@ bool __read_mostly machine_to_phys_mapping_valid;
>  
>  struct rangeset *__read_mostly mmio_ro_ranges;
>  
> +/* Handling sub-page read-only MMIO regions */
> +struct subpage_ro_range {
> +    struct list_head list;
> +    mfn_t mfn;
> +    int fixmap_idx;
> +    struct rangeset *ro_bytes;
> +    struct rcu_head rcu;
> +};
> +
> +static LIST_HEAD(subpage_ro_ranges);
> +static DEFINE_RCU_READ_LOCK(subpage_ro_rcu);
> +static DEFINE_SPINLOCK(subpage_ro_lock);
> +
>  static uint32_t base_disallow_mask;
>  /* Global bit is allowed to be set on L1 PTEs. Intended for user mappings. */
>  #define L1_DISALLOW_MASK ((base_disallow_mask | _PAGE_GNTTAB) & ~_PAGE_GLOBAL)
> @@ -4893,6 +4906,172 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      return 0;
>  }
>  
> +int subpage_mmio_ro_add(

As long as patch 2 is going to add the only users, __init please, and
there's no need for a "remove" counterpart.

> +    mfn_t mfn,
> +    unsigned long offset_s,
> +    unsigned long offset_e,
> +    int fixmap_idx)

enum fixed_addresses?

> +{
> +    struct subpage_ro_range *entry = NULL, *iter;
> +    int rc;
> +
> +    ASSERT(rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn)));
> +    ASSERT(offset_s < PAGE_SIZE);
> +    ASSERT(offset_e < PAGE_SIZE);
> +
> +    spin_lock(&subpage_ro_lock);
> +
> +    list_for_each_entry( iter, &subpage_ro_ranges, list )

Nit: Style (either you view list_for_each_entry as a [pseudo]keyword
for the purposes of what blanks should be present/absent, or you don't,
a mixture isn't reasonable; also elsewhere).

> +    {
> +        if ( mfn_eq(iter->mfn, mfn) )
> +        {
> +            entry = iter;
> +            break;
> +        }
> +    }
> +    if ( !entry )
> +    {
> +        /* iter==NULL marks it was a newly allocated entry */
> +        iter = NULL;
> +        entry = xmalloc(struct subpage_ro_range);
> +        rc = -ENOMEM;
> +        if ( !entry )
> +            goto err_unlock;
> +        entry->mfn = mfn;
> +        entry->fixmap_idx = fixmap_idx;
> +        entry->ro_bytes = rangeset_new(NULL, "subpage r/o mmio",
> +                                       RANGESETF_prettyprint_hex);
> +        rc = -ENOMEM;
> +        if ( !entry->ro_bytes )
> +            goto err_unlock;
> +    }
> +
> +    rc = rangeset_add_range(entry->ro_bytes, offset_s, offset_e);
> +    if ( rc < 0 )
> +        goto err_unlock;
> +
> +    if ( !iter )
> +        list_add_rcu(&entry->list, &subpage_ro_ranges);
> +
> +    spin_unlock(&subpage_ro_lock);
> +
> +    if ( !iter || entry->fixmap_idx == fixmap_idx )
> +        return 0;
> +    else
> +        return 1;

If this case is really needed, this special return value (as documented
in the header) probably needs specially handling in the callers - it's
not necessarily an error after all. But I wonder whether it wouldn't be
easier to check earlier on and fail right away (with e.g. -EBUSY), rather
than adding the range and _then_ (kind of, as per patch 2) failing.

> +err_unlock:

Nit: Style (labels indented by at least one space please, also elsewhere).

> +static void subpage_mmio_write_emulate(
> +    mfn_t mfn,
> +    unsigned long offset,

unsigned int

> +    void *data,

const

> +    unsigned int len)
> +{
> +    struct subpage_ro_range *entry;
> +    void __iomem *addr;
> +
> +    rcu_read_lock(&subpage_ro_rcu);
> +
> +    list_for_each_entry_rcu( entry, &subpage_ro_ranges, list )
> +    {
> +        if ( mfn_eq(entry->mfn, mfn) )
> +        {
> +            if ( rangeset_overlaps_range(entry->ro_bytes, offset, offset + len - 1) )
> +                goto out_unlock;

This case ...

> +            addr = fix_to_virt(entry->fixmap_idx) + offset;
> +            switch ( len )
> +            {
> +            case 1:
> +                writeb(*(uint8_t*)data, addr);
> +                break;
> +            case 2:
> +                writew(*(uint16_t*)data, addr);
> +                break;
> +            case 4:
> +                writel(*(uint32_t*)data, addr);
> +                break;
> +            case 8:
> +                writeq(*(uint64_t*)data, addr);
> +                break;
> +            default:
> +                /* mmio_ro_emulated_write() already validated the size */
> +                ASSERT_UNREACHABLE();

... as well as, in a release build, this one wants to ...

> +            }
> +            goto out_unlock;

... not use this path but ...

> +        }
> +    }
> +    gdprintk(XENLOG_WARNING,
> +             "ignoring write to R/O MMIO mfn %" PRI_mfn " offset %lx len %u\n",
> +             mfn_x(mfn), offset, len);

... make it here. (By implication: I'm not convinced this wants to be a
gdprintk(), as I think at least one such warning would better surface in
release builds as well.)

At the same time I don't think any message should be issued for write
attempts to pages which don't have part of it marked writable. We deal
with such silently right now, and this shouldn't change. In fact even
for ranges which don't overlap the writable portion of a page we may want
to consider remaining silent. The log message ought to be of interest
mainly for writes which we meant to permit, but which for whatever reason
we elect to suppress nevertheless.

As to the message - why do you split MFN from offset, rather than simply
logging an address ("... %" PRI_mfn "%03x ...")?

Like (iirc) Roger I think that misaligned accesses should be refused (and
hence also make it here).

Jan

