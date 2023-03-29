Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0936CD978
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 14:40:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516266.800124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phV5O-0003sz-05; Wed, 29 Mar 2023 12:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516266.800124; Wed, 29 Mar 2023 12:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phV5N-0003ph-Sa; Wed, 29 Mar 2023 12:39:29 +0000
Received: by outflank-mailman (input) for mailman id 516266;
 Wed, 29 Mar 2023 12:39:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phV5M-0003pW-5o
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 12:39:28 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd3dbb09-ce2e-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 14:39:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7807.eurprd04.prod.outlook.com (2603:10a6:102:b8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.34; Wed, 29 Mar
 2023 12:39:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 12:39:24 +0000
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
X-Inumbo-ID: bd3dbb09-ce2e-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9s+mfdrpewzRyFR8bKKfFdw36yUoFQ4hCyfLei3oGr7YWsY2G8UyYkbKbdEqEufMgx5HxoZyDU9A4fWo77HOhWxBuAVt0i9Xu5bU4AJe7msXF8j+0YhODLsF1vxIEBYGmvwwGvUgyf/HlgIJc4nyKoG/lTt4J56wcgWbLFizRMp5uh+xnV1FgG6F5yH6qLdRHKtPpn1fGOO0BV4iQj+4i5yvYvOY69Cg8APcr7HZAMe7Rpx17ZS6gwouB5qs63H4i0kECT/OExLYB8KLCUx+dvJ2Gw0ft9FQaYnz097k99PDpJSTbmzMpCzkOSA1/pxoPyBvg3D6Tq0/kHC+ZIKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2G2f/T67qJji4pmNb8rtlag+GnESLtkQshqk1X8WSAk=;
 b=St6F7JoMnVHlyqCw7NGKGCCOabIQg2z2wGODhfAHn8g4mSrX0tYplXdngr2RXDe44Mm4W3ewtMgS/hSwWi5sZsRbRvRolyvlLBw4Kpreq2C+TSYw4AG4lvbHqyinCNzvqZHQOBEjr5RgGJ4KIvI22tgyJKtpREayyUVzIVjPcZZE3F5ZzsFISEkhZ+nxFI53NbQ0y8iRH5u/r9tUDDyb6x4c5YZA0YM58ljuBMNj70KNW10wvCDfxgkpbQ0ob2nBQkqk6M5LhS7cuxQF2ns2Yo3IR3VC+0hsDhRgT+6+6UvCfZj2UFmduURCrN2kX9/LlxXWgbt8M9k7N+kmdQXSHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2G2f/T67qJji4pmNb8rtlag+GnESLtkQshqk1X8WSAk=;
 b=LY6NXMBsEBKnaRD2gB2pIepbiKU1+lrfEUAD3cJuFVlgrIJ5MHCmMk7rRe97r9ypt4blR4s1DL7xgCOC+KejCY0J59kO2cGHMukBB5HIo8JvA0DNgDIFS8hwsp3XaKPeT7ySXPTz7LktCxrQyuZ7T3nffuueDAqz3lHlzguWLvP3BSJonsIz9Jfp9JbDfQnJoLoIT/3GF/mmofWXRZ/BWqjrrpwS/720GU4L4VBTBtVeW8P627NMAfRGbTsB/UqnbQg1LNPv4UcBTdAaxf0bSjqhtMoP4FzX24jt+Ccj2c7/9hNwmWElNEe0WEa/oQcE6e26958Myvo2dAUVrAlFEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c689aeb-db4a-f2a4-d1b2-31f1283c0de7@suse.com>
Date: Wed, 29 Mar 2023 14:39:22 +0200
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
 <e238bffa-5eba-b18f-ed73-1c5c9730cf70@suse.com> <ZCQYLkoSfZ7klmNC@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCQYLkoSfZ7klmNC@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: fb9ea86f-b880-487b-4242-08db3052a08b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	55Sm3/ttYXKkvQhyVcNw6aLODr96jVucN+5/fgUlxwepdPn7kaNqFgz3ZgV6v8kPmIMc2N5jOotu+AbNGJqIFZMr45AXQbfDL700Xz+WJl8I8P89s96GJtG9Q5jxO1oI4qqwjWPstxuEchKGmyaUJrWLgoyWn4aAyjKVvZajw0yS9U9JoY85kyHXv/4BC3AytNMwfMroA3c06K5HzqwPOpKOPp4M/1t98/75Fk7aQUGLVPs8VTK+9lHSTLl2bGvOs+ZpHS80qqhj23qIG1sMcSpHy6wRKiiFZ6QpBun2dsnqHq/ZAP1BeiDkVl3ecFYF42sYoOezjgEdbLVeCwHSCmkphf1StM4xHhNgG/SWKFIo/M7WF/fFdlG0Z8yThPo4m8U0p3d23sI+cWc6Ziz3WwjIkC98EDqyvkRXJhhcCjuz6ZjNdWsieS4srGmh7HSZcqAJbQzuDyUCRph1fLKFqLo3qXbtzmz2l1qHecUiZrvgdYrIMv9S0tbAqzN8Rjj0XqhU978/ixG13N+BoiMmRjZgnszi6E9RyvdMO16Q/KpU8FKM9x5a0BonQ0qwq7HQ5TWyoKsNe77aHgrxF2qRQ3cgZMASE2VJBlbuHCmAZC9uOA9nL0N7t13O7HGcBueG/p/R4T061Z9U1h0jj03hOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199021)(31686004)(478600001)(2906002)(31696002)(83380400001)(86362001)(6486002)(38100700002)(5660300002)(54906003)(6512007)(26005)(6506007)(316002)(53546011)(36756003)(8936002)(66476007)(186003)(2616005)(4326008)(66556008)(66946007)(6916009)(8676002)(66574015)(66899021)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alQycjVra04wY0RQK1RhbGtsQ1haUGF5ZmFyaExnbjUxUGhQeVNyTjdMMHpp?=
 =?utf-8?B?aVVFbmkyRFFTTk9rb2lQZVRIazQ3NHNhZytUMjhodHlnb3hzajhrdXNDM05m?=
 =?utf-8?B?cCs4azkyc0pZTSt5cVdlVHM5aTRrclVVendDTHFpcjN3bEJ4VC8rWVhBayt3?=
 =?utf-8?B?cXR4bE1oNEFCak55L3FkTGRaMklNbmhNQk5ETi82OUszRUtHQXRvWlNmRjZZ?=
 =?utf-8?B?OHp0SVNSUmxMN2F2QUtuRWNjSm92aEo2ZEx0S3I0S1YvVkE5YmJtOTN4KytF?=
 =?utf-8?B?UXkwR3lybVR2REFtM3BQcm91N2FTdEJQdkcwSktZQnNXRW5yREpYMnZvT2lv?=
 =?utf-8?B?MDNIcDg0WHJoUE5OMTRQT2NHMmkzNjlkeUVrMEYvREo4QjY5dGdSK2VKNE4w?=
 =?utf-8?B?RmdRSy8zSDlEQ1BRbWxKMEhwS29rMFB6bU1aYkJZUmVuV0crSXRlSmw5TW9j?=
 =?utf-8?B?aHNSZ1V6SFdnTGJKMVI2ZzN6TDZSbVBCQUExNGRFa3l2NE9saERnK0VVNHJh?=
 =?utf-8?B?WFYzTUl0cWU1Z3hoOHFhSmRvS2pwZytQNTdIblFrbEpjRlFzWkdBT0N3RGNL?=
 =?utf-8?B?TFcrUlhFUHZCMzZnQzNtaFJWK3BWRzYvaXM0UU44Z0pPakZWZFZHbjBsRFM3?=
 =?utf-8?B?b3FNaEttNFE5c1VIODJSaVRBaEpJTkZBSThMRjA2dDFzM2RUTHpCNTRTSG02?=
 =?utf-8?B?SmxFaFk5YThMK0RVTk9tYk16T2p0ZnA1YWdqVktEVXN3T1pyRDlnNko4VWZZ?=
 =?utf-8?B?UmN3NlpzVkUzZ0RQYTR4dUdUcHVhWkhBWCtIU3pQUE9sNXlTZ0pBZ2t0UUc1?=
 =?utf-8?B?SUNwNHoraHlzbWJuUDI0U2N3RmhjZEl2RWFwOUdwWFYvMy95SkRNd2s0d3Fh?=
 =?utf-8?B?NEZ2Tnh4VDk5OWQ5bDUvRGQ5M0hqaWdHL1dzc01SRTBJaVpIZldmNmRkVnU5?=
 =?utf-8?B?cnc1ZkZkQk9UVlRIUVprd095WjR5RWNpbW9JeXJuczNMYmt5NDZWQVhReUhX?=
 =?utf-8?B?Z1lTdnFZQ3huMStpcGpkRG9mVzFVeXQ0ZExTdUtKRDFFVzZVLzYvVnFkUHM5?=
 =?utf-8?B?bUlnejR5NlJrWmxEV1QvNUZERXhqTWU4NjdVeFJodmNETnRxQkJ0ZkRBRDN1?=
 =?utf-8?B?cSs5a1NPQi9sMUgvL0QyU3VDUGlMU0FyRzdRV244NzBnaVRPZFhuTTR4dmxp?=
 =?utf-8?B?dG9TL0krLzBjS1ZTQnRnWStjQk1hSTNtQjhqcjhkK2dhdXNVb3pRR1B3RmdJ?=
 =?utf-8?B?QUFqdVVmam5KT1dvNmtaRktUbTJIcENBajk2clpkYXNveGE3L3Rkc3VBS2ln?=
 =?utf-8?B?N3dZNlg1Z0RKQmE3NjdEcFZGWG05ZDdJNTZIc0RBZDEyTGYxNjVqQ3ZzRjBr?=
 =?utf-8?B?NkVhdSthWFF1VVNMVnJmRG11WEdpd21vbTdhVG9vb0JIVUJ1NlcrOXloa2lC?=
 =?utf-8?B?ald4Qkd4cHhjVkhLVTJ4eTFxZlh6VEcwQ3ZscUY4RkZzYVR5RWh6YSt3dVk1?=
 =?utf-8?B?UXRMOFBEcnBOa3VjR24zN2VOVTdVbWloalJ5M3R3M3Z4cDlsVG5LOFpYTWFv?=
 =?utf-8?B?M213bUt4S1FzOUhVOE1OSTh6a1ZxU3owWm96eVFEK2ZkRGY3ejFrbVVLWm1v?=
 =?utf-8?B?Rk5Sa2hvWENxem1ROXVWV1l1cjJnampDUk9ZekQ1UVQ2SEdhUmFUd2hsaXJr?=
 =?utf-8?B?QkZheDl4REJsajBMU2ptbVBVZlduNDJlaEozM1JiMXlQZHY2WTExN3pNTTkw?=
 =?utf-8?B?RTQxdzYwRlVrZmFPS0x3Z2dka004NE5uZzVCdkdXd1dWRk1LcnpNWURYeDJo?=
 =?utf-8?B?cW01TXA0OU9rUlhuT05rM0c4cEcwY3F4OVFlQTBiOXFtWEs5c2xpZENSb2t0?=
 =?utf-8?B?bld5VG1RT3d1QmJlMlVRaW0wYUxSMFh1bkxOSklGNlRpTEtjWmpEL21OeHd1?=
 =?utf-8?B?N3Y2QkduQVpjd3lJRnpyNzROOVo0OTBiMTd1UzFYR2lmOG8wRTNPcXpwVlJp?=
 =?utf-8?B?V2NSRHBxUGVwTjBaUUJZYVRpS2Q5N1JMdWNlV0RUWDNrOVVURGhQK2FHU3ph?=
 =?utf-8?B?RUdCbTNZWHdYbyt2S0c0WEVPRXJGMjBWRjgrRXAwUERBaUtUZkdteHNNRVNH?=
 =?utf-8?Q?taRqqiO9Lb/Pxf6uSa7mgifgp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9ea86f-b880-487b-4242-08db3052a08b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 12:39:24.3413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DdQq0xqLgGyzaNMa9cB4jIb6MaClmndOG/z/L/OX545fOoy+k4dDuG1Gvkps8MFuFQLe3KJZhriMtkhpyJuBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7807

On 29.03.2023 12:51, Marek Marczykowski-Górecki wrote:
> On Wed, Mar 29, 2023 at 10:50:20AM +0200, Jan Beulich wrote:
>> On 27.03.2023 12:09, Marek Marczykowski-Górecki wrote:
>>> In some cases, only few registers on a page needs to be write-protected.
>>> Examples include USB3 console (64 bytes worth of registers) or MSI-X's
>>> PBA table (which doesn't need to span the whole table either).
>>
>> Yet like the MSI-X table the PBA is not permitted to share a page with
>> other registers (the table itself excluded). So a need there would
>> (again) only arise for devices violating the spec.
> 
> For PBA, indeed (and due to not seeing device needing such hack, I don't
> do that for PBA yet). But the XHCI spec doesn't include such limitation, so
> this case is perfectly valid.

My remark was merely because you mention PBA in the description.
Mentioning it is okay, but you would want to further qualify it, I
think.

>>> Current API allows only marking whole pages pages read-only, which
>>> sometimes may cover other registers that guest may need to write into.
>>>
>>> Currently, when a guest tries to write to an MMIO page on the
>>> mmio_ro_ranges, it's either immediately crashed on EPT violation - if
>>> that's HVM, or if PV, it gets #PF. In case of Linux PV, if access was
>>> from userspace (like, /dev/mem), it will try to fixup by updating page
>>> tables (that Xen again will force to read-only) and will hit that #PF
>>> again (looping endlessly). Both behaviors are undesirable if guest could
>>> actually be allowed the write.
>>>
>>> Introduce an API that allows marking part of a page read-only. Since
>>> sub-page permissions are not a thing in page tables, do this via
>>> emulation (or simply page fault handler for PV) that handles writes that
>>> are supposed to be allowed. Those writes require the page to be mapped
>>> to Xen, so subpage_mmio_ro_add() function takes fixmap index of the
>>> page. The page needs to be added to mmio_ro_ranges, first anyway.
>>> Sub-page ranges are stored using rangeset for each added page, and those
>>> pages are stored on a plain list (as there isn't supposed to be many
>>> pages needing this precise r/o control).
>>
>> While, unlike Roger, I don't want to see mmio_ro_ranges' granularity
>> changed, I wonder if a bitmap isn't going to be easier to use (even
>> if perhaps requiring a little more memory, but whether that's the case
>> depends on intended granularity - I'm not convinced we need byte-
>> granular ranges). I'm also worried of this yet more heavily tying to
>> x86 of (as of the next patch) the USB3 debug console driver (i.e. as
>> opposed to Roger I wouldn't take anything that's x86-only as
>> justification for making wider changes).
> 
> Well, it's still under the very same CONFIG_X86, and for the same
> purpose, so I don't think it's "more heavily tying".
> 
>> As to sub-page permissions: EPT has, as one of its extensions, support
>> for this. It might be worth at least mentioning, even if the feature
>> isn't intended to be used right here.
> 
> Ah, ok.
> 
>> Taking both remarks together, limiting granularity to 16(?) bytes
>> would allow using the advanced EPT functionality down the road, and
>> would at the same time limit the suggested bitmap to just 256 bits /
>> 32 bytes, which I think gets us below what even an empty rangeset
>> would require. Plus lookup would also be quite a bit more lightweight.
> 
> Indeed, in that case it makes sense.

Hmm, I've checked the SDM, and I was misremembering: Granularity is
128 bytes, which might be too large for the purposes here.

>>> @@ -4893,6 +4906,172 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>      return 0;
>>>  }
>>>  
>>> +int subpage_mmio_ro_add(
>>
>> As long as patch 2 is going to add the only users, __init please, and
>> there's no need for a "remove" counterpart.
> 
> __init makes sense. But as for removing "remove" part, I'm not sure. I
> realize it is a dead code now, but it's easier to introduce it now to
> provide complete API, than later by somebody else who would want to use
> it in other places. Is there some trick to make compiler/linker optimize
> it out?

At the very least you could also mark it __init. There are also the .discard
and .discard.* sections we handle specially in the linker script. But no
matter what you do to retain the code without impacting the resulting binary,
iirc Misra tells us that there shouldn't be dead code.

>>> +    mfn_t mfn,
>>> +    unsigned long offset_s,
>>> +    unsigned long offset_e,
>>> +    int fixmap_idx)
>>
>> enum fixed_addresses?
> 
> If that parameter stays, yes.
> 
>>> +{
>>> +    struct subpage_ro_range *entry = NULL, *iter;
>>> +    int rc;
>>> +
>>> +    ASSERT(rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn)));
>>> +    ASSERT(offset_s < PAGE_SIZE);
>>> +    ASSERT(offset_e < PAGE_SIZE);
>>> +
>>> +    spin_lock(&subpage_ro_lock);
>>> +
>>> +    list_for_each_entry( iter, &subpage_ro_ranges, list )
>>
>> Nit: Style (either you view list_for_each_entry as a [pseudo]keyword
>> for the purposes of what blanks should be present/absent, or you don't,
>> a mixture isn't reasonable; also elsewhere).
> 
> Which version would be your preference for list_for_each_entry?

I have no preference, and I'm sure we have ample examples of all forms
(including the mixed ones that we shouldn't have). There's a
for_each_online_cpu() in this file, using the non-keyword style, so
if anything this might be taken as reference. But I didn't check whether
there are any other uses of keyword-like identifiers which may use the
other style.

>>> +    {
>>> +        if ( mfn_eq(iter->mfn, mfn) )
>>> +        {
>>> +            entry = iter;
>>> +            break;
>>> +        }
>>> +    }
>>> +    if ( !entry )
>>> +    {
>>> +        /* iter==NULL marks it was a newly allocated entry */
>>> +        iter = NULL;
>>> +        entry = xmalloc(struct subpage_ro_range);
>>> +        rc = -ENOMEM;
>>> +        if ( !entry )
>>> +            goto err_unlock;
>>> +        entry->mfn = mfn;
>>> +        entry->fixmap_idx = fixmap_idx;
>>> +        entry->ro_bytes = rangeset_new(NULL, "subpage r/o mmio",
>>> +                                       RANGESETF_prettyprint_hex);
>>> +        rc = -ENOMEM;
>>> +        if ( !entry->ro_bytes )
>>> +            goto err_unlock;
>>> +    }
>>> +
>>> +    rc = rangeset_add_range(entry->ro_bytes, offset_s, offset_e);
>>> +    if ( rc < 0 )
>>> +        goto err_unlock;
>>> +
>>> +    if ( !iter )
>>> +        list_add_rcu(&entry->list, &subpage_ro_ranges);
>>> +
>>> +    spin_unlock(&subpage_ro_lock);
>>> +
>>> +    if ( !iter || entry->fixmap_idx == fixmap_idx )
>>> +        return 0;
>>> +    else
>>> +        return 1;
>>
>> If this case is really needed, this special return value (as documented
>> in the header) probably needs specially handling in the callers - it's
>> not necessarily an error after all. But I wonder whether it wouldn't be
>> easier to check earlier on and fail right away (with e.g. -EBUSY), 
> 
> The idea is to allow multiple sub-ranges in a single page. Again, if
> using ioremap() internally, instead of fixmap provided externally, this
> case will go away.
> 
>> rather
>> than adding the range and _then_ (kind of, as per patch 2) failing.
> 
> Right, I missed "!= 0" there.

Hmm, adding "!= 0" won't make a difference, will it? Adding "< 0" would.

>>> +err_unlock:
>>
>> Nit: Style (labels indented by at least one space please, also elsewhere).
>>
>>> +static void subpage_mmio_write_emulate(
>>> +    mfn_t mfn,
>>> +    unsigned long offset,
>>
>> unsigned int
>>
>>> +    void *data,
>>
>> const
>>
>>> +    unsigned int len)
>>> +{
>>> +    struct subpage_ro_range *entry;
>>> +    void __iomem *addr;
>>> +
>>> +    rcu_read_lock(&subpage_ro_rcu);
>>> +
>>> +    list_for_each_entry_rcu( entry, &subpage_ro_ranges, list )
>>> +    {
>>> +        if ( mfn_eq(entry->mfn, mfn) )
>>> +        {
>>> +            if ( rangeset_overlaps_range(entry->ro_bytes, offset, offset + len - 1) )
>>> +                goto out_unlock;
>>
>> This case ...
>>
>>> +            addr = fix_to_virt(entry->fixmap_idx) + offset;
>>> +            switch ( len )
>>> +            {
>>> +            case 1:
>>> +                writeb(*(uint8_t*)data, addr);
>>> +                break;
>>> +            case 2:
>>> +                writew(*(uint16_t*)data, addr);
>>> +                break;
>>> +            case 4:
>>> +                writel(*(uint32_t*)data, addr);
>>> +                break;
>>> +            case 8:
>>> +                writeq(*(uint64_t*)data, addr);
>>> +                break;
>>> +            default:
>>> +                /* mmio_ro_emulated_write() already validated the size */
>>> +                ASSERT_UNREACHABLE();
>>
>> ... as well as, in a release build, this one wants to ...
>>
>>> +            }
>>> +            goto out_unlock;
>>
>> ... not use this path but ...
>>
>>> +        }
>>> +    }
>>> +    gdprintk(XENLOG_WARNING,
>>> +             "ignoring write to R/O MMIO mfn %" PRI_mfn " offset %lx len %u\n",
>>> +             mfn_x(mfn), offset, len);
>>
>> ... make it here. (By implication: I'm not convinced this wants to be a
>> gdprintk(), as I think at least one such warning would better surface in
>> release builds as well.)
> 
> Right, gprintk() would make more sense indeed.
> 
>> At the same time I don't think any message should be issued for write
>> attempts to pages which don't have part of it marked writable. We deal
>> with such silently right now, and this shouldn't change.
> 
> At least for HVM domains, it isn't really silent. It's domain_crash()
> (before my change, not reaching this function at all).

Well, yes, but that's one instance in the lifetime of a domain.

Jan

