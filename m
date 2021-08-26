Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB663F83F1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 10:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172809.315334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJB69-0002GZ-Tj; Thu, 26 Aug 2021 08:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172809.315334; Thu, 26 Aug 2021 08:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJB69-0002Dq-QQ; Thu, 26 Aug 2021 08:50:57 +0000
Received: by outflank-mailman (input) for mailman id 172809;
 Thu, 26 Aug 2021 08:50:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q24O=NR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJB68-0002Dg-1O
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 08:50:56 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b90a6980-064a-11ec-a9da-12813bfff9fa;
 Thu, 26 Aug 2021 08:50:54 +0000 (UTC)
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
X-Inumbo-ID: b90a6980-064a-11ec-a9da-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629967854;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zv+ixs0he0shTc1ZOiu4CmiafUJGLlqdBX6n99nYnhI=;
  b=f5wRZAzII2tF2L+35igGmWmfXSnMIEz8QD0fa692t7ytDn9hMieO0vhJ
   x5B+0xGUtk7VTrWJMn/eySDS9nXtKtrkdYA3rNdQuUAPzmtcfV71awdkH
   YFmN85HYDDn0YOe3KjpyyOkNwlctkF32heBhBvTaFuUZta3NDAWcmaL9q
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0hYusKMiWHPBDhU7eTj8JXxvRSMmEUpx0sHXyu6Ter46AmrLxJ0jvtYTN+Jg2wjgaT862jpL7s
 zc2HcedQVZY9o/taJhRyx/G3GTjzRkSVLUT6k117nv3GzJFwY+jbvI1ExdGMg3U3cq1PYUmUU8
 +4Dt1JcKDKjR3X6qFkb4hO1/UZoV1HKKVRIV1702RPv+dzzVOBgRjb/coM7i84c3J96ev3GD/p
 ZwNlfI26JgwPaS3u65SgRRNgmPjzHf7KgsjSn1B3LqUx6PA3eQH+TaZVgUeh3ikK3XmBplL5Hi
 LRalfEVC0yWEq3nk2dZffui9
X-SBRS: 5.1
X-MesageID: 51734835
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+ZnEW6CREPBiXQXlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.84,353,1620705600"; 
   d="scan'208";a="51734835"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELos0GsJg3O1ZQow1lRht89pHhHI+QmPKk16p3KxtTWvIHZjcRcFXVJgL5+OMnq6v3vNAB3nKRyz/971vLNqe52MdS0lGXAdAEbJziLZm/gtzdz+WL+gbQtBg4mo4ZIpcRWSkg1pWvUPVah05dUO//Ihs1BDEVbwNRQkgwMBvPRHoPwKetmGjSI3wyN/GkdL3M3Kfk5EFNW+9B8OMCUHMH8zLPzSBUvn7izVYZcuj6G6EABe2nL0pLSwjY10Dgrw3N3MO1+PVgiss2GF2ck/j9fH9Y198/Nqu6S6BzUo67U0whcI5vP/m8uXdNKwGIJL2dqi4YmKzOFn5d2P/w1Oag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1m+2iFF8RpNK/aFR1R4C/j7e36kWbDGgwOOxsM+KnqY=;
 b=LfQ06uuG7O84Pk/lU0FkONlsdrstwy0lLJDJiLy04/H301AEnxbmKq0RsspRmXOHh6OyB9Z7d9k3Lcl7pnXC5FTiIJVq218WOy0YkRE2MxRzedS9B6WoYk/jW4x5znTb0cjRphQHURopsObo7rME86j+TtBLmjpbW1PsIcZ+apkrWowxnbeI7BvnW8pQA8HWtHd4WOVwET+YGwO6Kzt0LbuUhZgpgI/8kUMHBIK672jmQT8SKVroAkOvHCzeDELb/MzxP8E0kjUPKDduFwxG28AYAkRV0NMTUzF3Wn8I7JM5T3Sk99VnKRnQJCSM0/m3wHrj25CbEDgJ/t1m9k9d+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1m+2iFF8RpNK/aFR1R4C/j7e36kWbDGgwOOxsM+KnqY=;
 b=Y6JuKyYitp+aI8Wp6Ju6sxCh7k46z8lIgijPls18xq5Vb2GvJ+cz+uqKbtkWW28tO7u09fsn/keSW3W+txB4WlvuNfVHdydIKH6+bH9jsHfZzATfoCS8s1VmWG495bl7LhGYQWPU5PLyUWScN7rdAOT0l9Gave0UjXmfy5jrcNk=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, <xen-devel@lists.xenproject.org>
References: <20210818113017.454251-1-marmarek@invisiblethingslab.com>
 <45de5185-b514-8c52-6922-4c587818c698@citrix.com>
 <3125583f-b965-7746-d833-c197857cd7d7@citrix.com>
 <15fb708e-e03d-bc4a-a0bd-72b81d26c6da@suse.com>
 <930a3c79-ddf3-2b95-495d-8d4f229c9fb9@citrix.com>
 <853d0d22-734e-b3ef-dff5-2763c88630eb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/xstate: reset cached register values on resume
Message-ID: <8fb27cad-5998-7266-396f-872f4a69c552@citrix.com>
Date: Thu, 26 Aug 2021 09:50:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <853d0d22-734e-b3ef-dff5-2763c88630eb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a146919d-6a73-486d-4f56-08d9686e98bb
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6224A93E3800373A1EE1A5A8BAC79@SJ0PR03MB6224.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4HT7vfKqpKAYsmdaCizNA6mLF64snpAppb8xyHYJPgGmPy7yJYRX0x9VlQZfNtfyJ/VHetqJOBdPK/hsJNQwmNjegwUfvLmwDeVZYctXAN2mvL3jcA4GS5vf8zlMjbbBqrnsVFobyKIY+1YVTQw+vahTQY4XNHvhUBqrnSG6UQBugzbybredbzZKTFgcSk03OXHelRdsQlfKdxh0YujMj2YumgpALfXD0KjL8Q6WDTnkAGhqTBoPmy3XCz2I+gtGs4tbmQq+lIj2QcAL3TPzVXJui8eScNKTb1ET8JiTnKj6DtphSjTUTC8zPF1e+GHqazx+MBgtgoECQNWBmwpvu5ZmWPWAz17rcxhpihKQebffOSgPY/ajEUsYvUjsQPsj2soSKgytcb4WYF28w7D2DOF1CXsYWW57ORD4+YP22NCGsm5qA7DGf5tN4dspGsqyatE3ZuZdnJWG8RC+6442P9GZfTAPvQnOVmhzfy61OL03p4kgUBoPjyuOn9Vhk5S7EWHwftssH2pSi/Wq3k6zFYTN2HWX4Xp1zk8j7yiB+bKFDNBar4K13TkoMrZGNiyZL/piDxyZKw8aEWq5qGplLWaRsMimO7Scg/JvZtWf9L2EHHXKHir8q52Xn0i3lDCFnTFsJWKSGvRDdE9Jccopkp70uJ6CDZsirpr5E/zergUXdiUgKSdAdtVKq9kNdU0mNKSE+WYr17f1ZxKTCEtRMucNMlqa1mBRo3nOpg6mezY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(31696002)(26005)(86362001)(6916009)(186003)(6486002)(6666004)(38100700002)(478600001)(66556008)(66476007)(66946007)(8936002)(5660300002)(956004)(8676002)(53546011)(54906003)(2616005)(316002)(16576012)(2906002)(4326008)(31686004)(55236004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SllEajR3SXVHWHNxdENacHNwWEhtQWF6OG0xSlNSQUxsT2VUcm16Q2pURW9X?=
 =?utf-8?B?YWI2Mmg3U0NHOW15d3M3QkxTVXdhNkErTHByUHk0c21hODF2MkpvWHNrRTg3?=
 =?utf-8?B?ckR1UlFQZDBiOUdaU3BtQlprWm1WeVFwY0prSXR5YjVyY3BBanVvczlJRmxF?=
 =?utf-8?B?VXI5bkJkME5UVzNLRHB0Qk1tMzRQbHFLdnVYdlJnTzQ0K1lWWFVzSWVvYkti?=
 =?utf-8?B?N1ZYTXBTTEdVV2dsK3QxVm92YlR0TGhDZGNPZXVORXJPcHMzREtJOXlsTUk4?=
 =?utf-8?B?VFc4ZXdHMzdrcVF3WXVxekNBcnY2RkZwdkhjaVh4Sk1lRDFxczRJT3h3RnM5?=
 =?utf-8?B?dHZDVldPZmVZV3VaM3E1Y0VuZG1XQ0hnZmpQZ3JEeDBRVjJIUTkwbnlIbjBi?=
 =?utf-8?B?YmpQd05xQWczbUVPajE3dG1VaVVOSGNKYVVsRTVaSGNOUyt0T0pzRnZpZGRN?=
 =?utf-8?B?dDhDNER0LzhmU2dKcnFhN3hQM1dNUDBBemJkZTUyZ0xGK1paSStpdTYwY1lU?=
 =?utf-8?B?WitDWVIzZE1pOVVjemRiVHUxeUVZdVdIOVE2bk9YVWVzTHhFazhTVzUxT0Rx?=
 =?utf-8?B?OW9NTWwyWXlYWDZnVVl6VXJDODlTbkpYY28rNittNmlUcUUvZFkvVXQ2Ullx?=
 =?utf-8?B?ZEp1ZTBHVnlBZUJ2NVZKME9ua1dXcEJGZ3RDcUhHZjIrVmZCQnR0QkJvSCtT?=
 =?utf-8?B?czBOZXp6QS93SlJOWHV2ZUlla2lDY3BXbjZiVVFUenRuSWxGSitXMDNpaXR0?=
 =?utf-8?B?OFk1SEpwYVREdHNwODdqQUhZRnhqZU5lS0w3SFJuQkV1SVVvcG44NWsxclRT?=
 =?utf-8?B?VWhDVmFFQ0VueXpOL2RGOEZWSlNncm5oZVhHalI3cHpmaFVualZYZGxvamVI?=
 =?utf-8?B?ZEppUGo1d2RxRzI0UWh1TndGcVBkZEhiQWpoeDJFK1FGemFjT3krM3pJYndl?=
 =?utf-8?B?TDQxVlJnWndhL2VNVW1ncWg0OG1OT0VINkd1bkMvcTVUaW5xczhEQ2RjRVNW?=
 =?utf-8?B?QStwZXpGcHNqSWhRU1I2V0NVY1JWMmlZNWpNOXVIenZGS0VmNWpEdlE0dTZU?=
 =?utf-8?B?YlRlTC9oWXVoWmlMOCt3azg4NGJzNy9wYnV0eU5aWjZNQVZOcUV6aVJocGw1?=
 =?utf-8?B?bStyRTlCZGVkdHJEQjh3S1pGRVlHMW5RMHRNVmFlYU9WbjVUYThmKzQ5Qkp3?=
 =?utf-8?B?emxnVzkrMzcwQlA1WVRTamovSWJsbDhZT0U1VUxRa2ZOUjdicXIybVl6Zlcw?=
 =?utf-8?B?cG9ud1FWUnAvVVBTdW4yZkk5RlRxMVh1Tjl0bzlRTlhWcTJRL2FjTm1oNGZ0?=
 =?utf-8?B?R1JCUE93Qy9WVHhGVHUyQjZ0V1V2VU4rcy85ZDg3NGViV3k3T1RTeDlKME1D?=
 =?utf-8?B?dE96aXRhSS9TSmdqU2NLTEJVblIzSDdmaHhhMGdrc21KMzBBLzRNUGhhV3Ji?=
 =?utf-8?B?TkdVOVRnUHpJVU5aYnZMM0lzVmpxdDdLWkk0ZG52MkJWTUF4UThwSkdaSjhr?=
 =?utf-8?B?NHlFUFRvNXpQc3pKNk9QOERtQ2pOVG45WE1zbmx2NngrYnUzWnJEdU9QbS9Y?=
 =?utf-8?B?ekQ1V1lBaUhJT3Y0SUw2Ky92eGh1U1lOTmxZS242aXFjWm4zUGc0L2c3LzBa?=
 =?utf-8?B?emtJRXBsRG5FTFZuclZtWmo4SG9ubGsrcmJ1RkpoRlY5bFV3cCthQTZrTTBs?=
 =?utf-8?B?VnBxcEZnaERwcThVT09Ic1pWb3F3V0FBZ3ZZdVVsaWUzbk00MHlMVlJRUDlj?=
 =?utf-8?Q?t9TlM0rwshOR3RG6MLG22+7fd0XpfCLiDiqUIWo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a146919d-6a73-486d-4f56-08d9686e98bb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 08:50:46.9447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AR0GRw6ftNfCSor1NABh83S+D/Xjv0f1+mEHqvlEGgxHNjDsdn+ECoi2hvgl9f9EzBpFkZ0DyqBfXsUY+fgvlPJYLk3Uxx+jA+kDAuRoxJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6224
X-OriginatorOrg: citrix.com

On 26/08/2021 08:40, Jan Beulich wrote:
> On 25.08.2021 18:49, Andrew Cooper wrote:
>> On 25/08/2021 16:02, Jan Beulich wrote:
>>> On 24.08.2021 23:11, Andrew Cooper wrote:
>>>  If
>>> the register started out non-zero (the default on AMD iirc, as it's
>>> not really masks there) but the first value to be written was zero,
>>> we'd skip the write.
>> There is cpuidmask_defaults which does get filled from the MSRs on boot.
>>
>> AMD are real CPUID settings, while Intel is an and-mask.=C2=A0 i.e. they=
're
>> both non-zero (unless someone does something silly with the command line
>> arguments, and I don't expect Xen to be happy booting if the leaves all
>> read 0).
> Surely not all of them together, but I don't think it's completely
> unreasonable for one (say the XSAVE one, if e.g. XSAVE is to be turned
> off altogether for guests) to be all zero.
>
>> Each early_init_*() has an explicit ctxt_switch_levelling(NULL) call
>> which, given non-zero content in cpuidmask_defaults should latch each
>> one appropriately in the the per-cpu variable.
> Well, as you say - provided the individual fields are all non-zero.

The MSRs only exist on CPUs which have non-zero features in the relevant
leaves.

The XSAVE and Therm registers could plausibly be 0.=C2=A0 Dom0 is first to
boot and won't expect to have XSAVE hidden, but we do zero all of leaf 6
in recalculate_misc()

There are certainly corner cases here to improve, but I think all
registers will latch on the first early_init_*(), except for Therm on
AMD which will latch on the first context switch from a PV guest back to
idle.

>>>> cpu/common.c:120:static DEFINE_PER_CPU(uint64_t, msr_misc_features);
>>> Almost the same here - we only initialize the variable on the BSP
>>> afaics.
>> No - way way way worse, I think.
>>
>> For all APs, we write 0 or MSR_MISC_FEATURES_CPUID_FAULTING into
>> MSR_INTEL_MISC_FEATURES_ENABLES, which amongst other things turns off
>> Fast String Enable.
> Urgh, indeed. Prior to 6e2fdc0f8902 there was a read-modify-write
> operation. With the introduction of the cache variable this went
> away, while the cache gets filled for BSP only.

Yeah - I really screwed up on that one...=C2=A0 It was also part of the PV
Shim work done in a hurry in the lead up to Spectre/Meltdown.

MSR_INTEL_MISC_FEATURES_ENABLES is a lot like
MSR_{TSX_FORCE_ABORT,TSX_CTRL,MCU_OPT_CTRL} and the MTRRs.

Most of the content wants to be identical on all cores, so we do want to
fix up AP values with the BSP value if they differ, but we also want a
software cache covering at least the CPUID_FAULTING bit so we don't have
a unnecessary MSR read on the context switch path.

I'll try to do something better.

~Andrew


