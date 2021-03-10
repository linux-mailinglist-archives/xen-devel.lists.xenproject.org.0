Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3897334510
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 18:23:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96248.181936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK2Xz-0003qX-NW; Wed, 10 Mar 2021 17:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96248.181936; Wed, 10 Mar 2021 17:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK2Xz-0003q8-Jg; Wed, 10 Mar 2021 17:22:59 +0000
Received: by outflank-mailman (input) for mailman id 96248;
 Wed, 10 Mar 2021 17:22:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RhJS=II=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lK2Xx-0003q3-MJ
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 17:22:58 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e06170f8-9259-465f-8aec-b8e177fd0506;
 Wed, 10 Mar 2021 17:22:55 +0000 (UTC)
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
X-Inumbo-ID: e06170f8-9259-465f-8aec-b8e177fd0506
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615396975;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nmT3VUh7L4Teyfr7uPRZ6ajvRBFgRjJ4Sy+i+B2Tc+M=;
  b=HOpM9fPoP+hdblb3adlaJiU0T8BofuCHFOZJfkJlSm1gKIk8+mGVWGi2
   HPG+nA6b0UNx8xE21W+xzDh9M0slj9BypquU13JkRY8RLM9e74rdk0iLu
   tAfWfRFHpeCsWOlbmJMFlQwkD0ku4DYh4XawcB6O5An29q7FOkynQnD4i
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /mNcPxlxtqBGbbq4mEkC1hXStTRa5vploDomN314OkC5ssLJmdkV9I18TY13BXMzr0tJdZxG1E
 bwV1Y3ImbBIOP9AZkCFSp1F4S39ks0bLD0jsYeR0DnhDrnCi2Y0C+DXk1O94w8tuRPSkDn73+/
 uIT3u4a2Njlql89vQ0g8gVY3U3Yib6waSjhdqLWIirgIjtAbCqTbqg092/kKPhZ3rmY3MjL/HV
 XAuqka13+IekiWj76hST92V7WjUDG/L8E2WGCN5KK98KImj/OpLWEtRHHii6znT+afNI4Px2uL
 21w=
X-SBRS: 5.2
X-MesageID: 38973377
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ZwijdKjIa7GqMkM/c1cRYIkaknBQXwB13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy48XILukQU3aqHKlRbsSiLfK7h/BP2nF9uBb3b
 p9aKQWMrfNJHVzkMqS2maFOvk6xt3vys6VrMP/61socg1wcaFn6G5Ce2SmO2l7XhNPC5Z8NL
 f03Kp6jgGtc3gWcci3b0NtN4T+jubGiY78Zlo+DwMngTPksRqT9LX4HxKEty1uMA9n/LFKyw
 n4uj283IqPmbWRyhjQ12jchq4m4ufJ+594K+GnzuQQIjXooA60aIpmQK3qhkFJnMifrGwEvf
 OJjxA8P9liy365RBDInTLdnzPO/Rxry3j+xUSWiXHuyPaJOw4SOo56qq9yNj76gnBQ2O1U4e
 Zw8E+y86dzN1fmmh/w4tDZPisa7nackD4ZvsM4y0BEXZB2Us43kaUvuHl7Pb0nByzA5IUuAI
 BVfbrhzccTS1+cYnzD11MfpuCEbzA2FheCdEAIptaY5ThQhGx41EsV3qUk7w49yK4=
X-IronPort-AV: E=Sophos;i="5.81,237,1610427600"; 
   d="scan'208";a="38973377"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fO5rKa0x1EfYYttfR/akf7wHqFFx8KjLaUP0FtpFmBpvUywGyFXoAlMTs2xGNcsd+WtyscHt2OgVqF4IkSXS6B2zMUI9G5p8zANGNhjdUO/OregpM7Z7/ja9DvEHy2CyHqytWEyJ/OOEj/5dqb/yn9mSHIyULbGpI6ulRTcb377Ycjkcmt8AFcEY60nbUQbbuowsHPGn7Dhz9UuwOTS+ko2X1dJZ1xnraMolKtsTqF/JPB6uHzDLaUCasSuFojKogva+1NpGDCosPO//vlzYZsS72cry1JmoPTQMBKNNwAeEC/cfZkVzvslIh8MIombbFaVvW/27lIyjXh/rq9GIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/GN8YxH78Q+enrgfjv7pEctB1xoozBobcdx1vlh3ek=;
 b=NivRnMVQN9qfn8SjAw32HT1vwAtZ62zbl3qbvARtKr6NAcY5wQ6+MKJOjF8hGAxNOptLvdnU8HAPxtEAKdTnyuo2YQGMDjYjiUZNnoYJWIEGKvThB3HvpWw1UB9iHz2hwUgQwkqsZm2r+NK+EPSWTPq2BJJge8frPla9vtdpHXuzDcO50Gta1Kjy/xQgJ4PDcDnw7oclNx7u/UK5YVRCleKWyIG5tO0dopVzIrqhItI0LE0y6+E2EG5lJke/mbcLIWDlznj6QH8HXo8pjx13HGn4Cj9Evghgb/fmTtNKkE9PNtOaxQBhOcFc69aBbH5nw9odJZpN7KoNPcI3rlOM8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/GN8YxH78Q+enrgfjv7pEctB1xoozBobcdx1vlh3ek=;
 b=QhqMQSJVsQEzRKIgM/QWLgdT2VV7JAi3jysp7Aj8lUWrIijAQwPBXwtCslYlnkGjdMoMFXq4/4DEaRu3OOpC2a01gwTh3fJsNq0xHI1R6W4Kg/woCTl0OMno4vqJ5FfxChlFpHlLCWrf3JYD8tyyKN+cNVBjTsoo5wRj2tFYpvs=
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
 <d375232a-d1a7-737c-0887-8b7e1c9a772d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard
 from public API
Message-ID: <13f03a67-18c2-e564-a0f6-84eccc7eeb76@citrix.com>
Date: Wed, 10 Mar 2021 17:22:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <d375232a-d1a7-737c-0887-8b7e1c9a772d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0322.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 204347ee-6aee-4e35-e791-08d8e3e91fc4
X-MS-TrafficTypeDiagnostic: BYAPR03MB3797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB37978B8894C4891A5543CB26BA919@BYAPR03MB3797.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KsIMEIexpmZBhSkdXBdFSa0OjpfcZWcirfW6teuHrMz1Zg6bpv3ZQN7GQhTMyMmYB+p3Cb6PCSa0kOguVHvbg0qgQ2K4RdtpbjMfh0l9vj2NsxilM5zpGzD53rrpfi9rbExQzSWLENXH13C80do3HMn64N/uvONh6Jlb5fotWh9zjXuh5tJAmwB8sPm4XZDxfeqHurmGp+dbiLl6INMtaJVvDEy9AnUPUYQhUNZH7+o/QpEIxCOSZ7BtWcWKRhaNsTjKooLt3l6GfqRnt4XmNL1aF6gJu+by9fITpXhCdi9TxW/zbJn3S0dtiQT/c0S4lyABbHx310LAACsbyw6x73nWsza58ZKqTHaMgTcgn634v4cp+1aiwtCHDIrFIPOV9Dfn5/V4YPTSwZzo476p5C34xQLHPLU5UCjvR/2gXfQHK6JwpMmVtbYoyKN/x6FR/6FSY6QC/9Dqo/6MycmPNhnBileh1PKbmDWhE5WTaRZsuEt86ae9fqvRzk1fvVZdopYzgHessDtMQfZZg07m/uNXI1YnK1bJL5C7g1W2JULUl4kksHs7txPErn4ioW8XD+aVN3EYA66LZuYYJMs93ocF5Jp1Cz0hwH0GQ1uIRIQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(53546011)(110136005)(26005)(2616005)(66946007)(66476007)(956004)(2906002)(16526019)(6666004)(186003)(5660300002)(478600001)(54906003)(16576012)(83380400001)(31696002)(86362001)(316002)(31686004)(8936002)(8676002)(4326008)(36756003)(6486002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V1pEVVhCdkwza0pHaFVqV0VxbVkzRUI0dysxSVkvcE12YVZtSmQ4ZytyODdo?=
 =?utf-8?B?YlpPMWFMcmxjd0JKNnhlMmN1enZMUElqUldMN0tFY3lRS1NXN2tCaVArU3Jh?=
 =?utf-8?B?b2lqVDlnYkNFOUl6dlYybFhla3loSHZlM0hTbW5WYnl4NnZrYU1wZDVSUVhT?=
 =?utf-8?B?VWtXTzVMTzRIZUZLZzM1dWRjMDArZVVIdnNkdE43eW92Z3pndHc0RlIxQkkz?=
 =?utf-8?B?OEV2WFdXRkplZHo4RGN2dkVwbEd6azBQWWNndVdHaUpCMFVHSzJIM0FQNmlX?=
 =?utf-8?B?Skk2SE83Z05xSjlkeWIxSnowY0YyUVorS2tYbThJc1BZMmZZZjJidmxGWTh0?=
 =?utf-8?B?V0U4alZQQzZZRWxFTW1aaGdDTERpd0dOQ1RoWGF6bkQ3S2FrcFRpRG5udDRo?=
 =?utf-8?B?V2ZLdURTYWxWTlNBU3IxT3d5M1ZjZTR3TTZrc3dmTnVrU01ZZFRrcE1tb0Iw?=
 =?utf-8?B?d3dsbmVSZzNscU9IN25lbHplTDFVdkRXQkU2cE51Znl5bVNiOXdtYS9OVlNH?=
 =?utf-8?B?UjdBRndnZ0k5aTZwT2cvVUgwa0p3Ym5mUW01WjNldGRpc0lBbExmYVphNkJy?=
 =?utf-8?B?VHZDSFZzdmdPOXc2M3V3WlIrQ1JJOS81dVRrQkxsRVlJNVF6TGh1ZVpHWmNQ?=
 =?utf-8?B?TGh4bmgrcWRybFBkN3RYV244VnV1K3dGYzE0VG5YRUVGa3JNRFlZZlFGaXQx?=
 =?utf-8?B?WUY4M1o0ejBua0RqenVVTjZVRVJWZ3NHWDNzbFg1SUZySlI5cnZ0a3JSRWtW?=
 =?utf-8?B?cVJid2RQN2hLK0pFRGhCQk1XMnBIanExSDY0a1NFNmpTZFJ1Qm93ZTRKdEov?=
 =?utf-8?B?V0ZlcVNJT1g4dXFYakpDUXhWM3hrdDFmMnJhNkNFZFdZcjNkRWd1RXNpQXQx?=
 =?utf-8?B?MWE1OFExR2psdDJ6bFY0SklLQ1dHQkR1YWRmUXJ2Y2NLVlFKdWgrYk10bWhU?=
 =?utf-8?B?d1pEZ0ZlN1JVQ1VITlh4N0RMQytLbDFoOUpON2ZmQ0dmc09IL1M1bkNwaXJL?=
 =?utf-8?B?c2ZzYi8zRVN6WmpISkJ4ems2SlJycGpDTmE3S0Y2dVBoQU0yOUZlVk9TdmZG?=
 =?utf-8?B?bEVBRmZkYUxuSkI5WFRtN1BQQWQyQzJNM1NKRkgwa3B5N0pRaHlPcGIzREJ6?=
 =?utf-8?B?c203Ym9XQWRJbDc2NTlEODNwSVNYK0xSeFB2cHk4ME1zVW1Zd0J0NTBVUVNF?=
 =?utf-8?B?cnRQQ1dndExGaGM1aURVUGZEbFpyeDJWR09jT05tWVU5eG9zaDJVZkduMGVp?=
 =?utf-8?B?NmViNXlEd2VweHI0WU1GMWlTSkxYRURERFFINGVPZDcyZjJtY3p5ckRYL3VG?=
 =?utf-8?B?aEp5dTZFQ3RBdTRIeXIrMi9YVFVuMU1Za1I5RGlhS3JjK0xCSmF6TUF1RmIz?=
 =?utf-8?B?Tmo2UkV4QTBjczRXQTloRGRSd21mRHhwUmlNVVRJWTd3WXJQc3lWdXJxVWpX?=
 =?utf-8?B?SFFTYzcrUllNR05tT0pGdW4yanhGc3BMWDMzNzZtMVMyaksvVlVEVlJlNWp1?=
 =?utf-8?B?M09ETEU2SExBRVdPait1dFNSVGxqVDVaaU5hVUd1TXVMVlJ1Nzhmc080Tisz?=
 =?utf-8?B?SzYrMmhMMURTZ2FLZEUycXB5ZFZiTU8wYjJ3aWg1eXNjZHZXVGs0QXJEcm1s?=
 =?utf-8?B?WkZnaDRIYXRlOVNVdHp1MUhpT0NnZXJ5ZVBjaVJxNWtVSWJia08rL0FOYU5a?=
 =?utf-8?B?V3g4bjNlU0RQcmxCejJabnBaQXl2T0ZLMmtKOG4vVjczeUNUV2M1TWJ6TERS?=
 =?utf-8?Q?cfqDooJK4YWqmGBrVMHqcNHN2PGMDXKMKsjnxew?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 204347ee-6aee-4e35-e791-08d8e3e91fc4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 17:22:47.6995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsTBeRonP7LjqxjhKtimxfDBnKjdnCRkaOmXy1kQcYD+/5+o89+WGOeJbbi/c1MX6TK4gJi8Cx5G8B3jSInVPmYcu3akjVI06VqnCVltUbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3797
X-OriginatorOrg: citrix.com

On 10/03/2021 17:12, Jan Beulich wrote:
> On 10.03.2021 16:07, Andrew Cooper wrote:
>> --- a/docs/designs/dmop.pandoc
>> +++ b/docs/designs/dmop.pandoc
>> @@ -4,9 +4,13 @@ DMOP
>>  Introduction
>>  ------------
>> =20
>> -The aim of DMOP is to prevent a compromised device model from compromis=
ing
>> -domains other than the one it is providing emulation for (which is ther=
efore
>> -likely already compromised).
>> +The DMOP hypercall has a new ABI design to solve problems in the Xen
>> +ecosystem.  First, the ABI is fully stable, to reduce the coupling betw=
een
>> +device models and the version of Xen.
>> +
>> +Secondly, for device models in userspace, the ABI is designed specifica=
lly to
>> +allow a kernel to audit the memory ranges used, without having to know =
the
>> +internal structure of sub-ops.
> I appreciate the editing, but the cited points still don't justify ...
>
>> --- a/xen/include/public/hvm/dm_op.h
>> +++ b/xen/include/public/hvm/dm_op.h
>> @@ -25,9 +25,6 @@
>>  #define __XEN_PUBLIC_HVM_DM_OP_H__
>> =20
>>  #include "../xen.h"
>> -
>> -#if defined(__XEN__) || defined(__XEN_TOOLS__)
>> -
>>  #include "../event_channel.h"
>> =20
>>  #ifndef uint64_aligned_t
>> @@ -491,8 +488,6 @@ struct xen_dm_op {
>>      } u;
>>  };
>> =20
>> -#endif /* __XEN__ || __XEN_TOOLS__ */
>> -
>>  struct xen_dm_op_buf {
>>      XEN_GUEST_HANDLE(void) h;
>>      xen_ulong_t size;
> ... this removal: What the kernel needs for its auditing (your 2nd
> point) is already outside of this guarded region, as you can see
> from the context above. You said there was a design goal of allowing
> use of this interface by (and not only through) the kernel, e.g. by
> a kernel module (which I don't think you mean to be covered by
> "device models"). If that was indeed a goal (Paul - can you confirm
> this?), this would now want listing as a 3rd item. Without such a
> statement I'd call it a bug to not have the guards there, and hence
> might either feel tempted myself to add them back at some point, or
> would ack a patch doing so.

Xen has absolutely no business dictating stuff like this.=C2=A0 It is an
internal and opaque property of the domain if the hypercalls happen to
originate from logic in user mode or kernel mode.=C2=A0 Stubdomains would
fall into the same "kernel" category as xengt in the dom0 i915 driver.

However, the actual bug I'm trying to fix with this is the need for
userspace, which doesn't link against libxc, to do

#define __XEN_TOOLS__
#include <xendevicemodel.h>

to be able to use the libxendevicemodel stable library.

The __XEN_TOOLS__ guard is buggy even ignoring the kernel device model
aspect.

~Andrew


