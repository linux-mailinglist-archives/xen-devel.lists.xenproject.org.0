Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D278E5F9AEF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 10:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419147.663879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oho68-0001gC-M6; Mon, 10 Oct 2022 08:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419147.663879; Mon, 10 Oct 2022 08:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oho68-0001eP-EL; Mon, 10 Oct 2022 08:25:16 +0000
Received: by outflank-mailman (input) for mailman id 419147;
 Mon, 10 Oct 2022 08:25:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oho67-0001eJ-NZ
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 08:25:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c738bf0-4875-11ed-9377-c1cf23e5d27e;
 Mon, 10 Oct 2022 10:25:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7659.eurprd04.prod.outlook.com (2603:10a6:10:209::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 08:25:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Mon, 10 Oct 2022
 08:25:12 +0000
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
X-Inumbo-ID: 0c738bf0-4875-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lymyZagojSFVxGn8zq7ACRAiS5L8QBpF/3y3FXfqfA8uB5WErJolvRp50I6gSWlscx0l2kgDVK3cbFSxzg9mhfqgk9xlWuPPV20orDMJn0uqD8kZZHN/or9OhG0SPI0InFoajVyvG6hmJzaS6P+Fjuxb8gaYySLnSyj9DOdRBAWRtbl9qbWGenygwIVpvZAI2Yi3PWldZjmsWUZ4gO84hSC0NiCMmKjPf7ROZqI2rpSOG1ojbtO8OVHy2eqP6GikFI+nyXxo9oiKs9gPw4N8BLSzQv2DyprLYVLtQeMAXqgb3Yn/ujak2SaZfpP7FoSaZmPkC7REp3WMkJmdnIydAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USG35lcqYGmV0PxdvXYh3KCA99nEvFvkAAmaVTCXjmQ=;
 b=d6+V7y9+RnlgSp1oWE8tz8BYDXfULBCxwPBMpJRUe5qx+3MTbsYl5xDhHCu+0bTcMqwzqpJ69TGImGcsi9NkAQZZMg11sUIzV5XOMjXTKkfy/97Iu7/67GJvRgahNGVhv92XdmC09+PUcU6ZL8kCyEiKy0Em9eIqsyus9BbfxZ9J5/sq2U/2yj/ehlNB4lbz0V6Vnkp7BfSHaq/ZO3XvMzPxq64IU4vwXHBbIUNkRUhSdSN1k8bKxkP6cU6dsCEf5Ay7aZEp8HBt2WGj/6iqJkf6/3J57eu+Qnpii+UOenL5M+uIwm02C5LmxFDvHwn5HI8BXL53ItyuXtiYsmb3sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USG35lcqYGmV0PxdvXYh3KCA99nEvFvkAAmaVTCXjmQ=;
 b=Xn01D4/FSczfhYdIYyBLq5iptol3BABK4sNvB1M8wjhOJR8gjK/Puh2tqIU02kQ3IHdvsxI8t8tiVGKX08EpCQhlRLev9OzjmyEToWe5iskCD07vheAICYyxoxU6EA2cj3rNh4JWSH6rz1sfPZzpL5agPApbU0cm55NVYL/XxLxDY2Q5bjkaLE1YJ6e1+L97fgf1GTCvZlNNXLRUmzEDxY2ZOIrl1OpByd+4fiL2nFzu/cN81OtHPMpiiHRbLZl8znNWnSf6b0WENqmOphi1IoLUlXDEosm2wt1vmhc6ztX8/7vIFaKwYwyAvEnacKsBOI7J7ZWTU/oNC1YbIiY2IQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c78ff556-ffe3-52d1-65b0-75153c1472a8@suse.com>
Date: Mon, 10 Oct 2022 10:25:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220920091218.1208658-1-wei.chen@arm.com>
 <20220920091218.1208658-6-wei.chen@arm.com>
 <5ac85819-9a1d-b8bc-d49d-13cb34a3e7e9@suse.com>
 <fc03f565-8c05-e310-fa0a-698ad7c569e3@arm.com>
 <47ec8e01-8ea6-4678-78c2-c67305fe3b7a@suse.com>
 <PAXPR08MB742077FE40B3FB0614787B599E569@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <9c32c4a9-d319-8886-c026-f33820a4f77b@suse.com>
 <PAXPR08MB7420DE5F342F17E77F5483879E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <e28f8faf-89fe-1e8f-4b8c-77097c2f2a90@arm.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e28f8faf-89fe-1e8f-4b8c-77097c2f2a90@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9453ea-edea-406a-1cfb-08daaa98f35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FULXUuDeYqXB5imG1upSihJp13rdNTQD+5o3aGaltzSwB1TcZ1wDFYQYSUullQbp6I0g+qc+tviVlG2axKep3p93zEqUMhc5Sz/sa6F+8B9W4XIzkkowtLC7c4fsHm5KNooUXw4SEi/kOu+y/h/pfIsX1hp3bfLeiFkwOCOnpHTFRpXUHSdODzanKMZ9G4K8pnFRnWt5nLUps5mK9ho7Z8ienf/JtQdlgu6q48zJDskImsSwT5E01IfdLT2CjWSahmx4iSDbQ5vTp/0JEXxdolS7ln/FTr5uPOLRW5E5eV7DI0UqhHv676JDdUm66GOXvN54k7uyV9jrpdjL4gVTimgNp+dWtG/cGdPllQepIU70CU5a2LbCFNgAHTrKG8LbS2Fo6/FYF75a9PGhXPWpebtpABQI5+nN73Z86ZSb0OZJDWg1lCgTc5Zc6sRrWeplgquMiKNbgGIn5U90GH1xgn+mRpx5UTo2kgRomau6/OHdjtW+LjP7wVPuRn58L0QRG5XLNmRBi+Fc/zVFIMp1bZHTYD5/Qhrsr0N7u6rARVl2/PNlU7ZHehuG9+3W513hiNscJWTDeG1Eb2diIL8MH8t2arFtTQeWqkikLHxO9oUU51UzZ7n3CcMBFDycjdbnehjtPqabBbeohMVgHonzdfVgCQvQsOVhYBVPkpDRM0bJnhHLdxUhKkgPRJML90GN9kPyL20yRiOcixHXKvf47nfAjihtPUbqCs75Z4K6Q2ynFiTuPP3B0lL1AWA/qINgc+Tc1we0cqDxsZMiNZoTR+spcDYjelBkkR0OwshAp9U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199015)(186003)(66476007)(83380400001)(2616005)(5660300002)(38100700002)(8936002)(41300700001)(2906002)(4326008)(478600001)(8676002)(53546011)(6486002)(26005)(316002)(66556008)(66946007)(6512007)(6506007)(54906003)(6916009)(36756003)(86362001)(31686004)(66899015)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3BXRlhOMlRoRlRIUW5ZSmd6TFZSSGlvRFpjSEFkeFlNOEFpb3JURldMaXZ4?=
 =?utf-8?B?cThBeTJ0VG5FZ1JFZWdhMVdqQnU1b3NLUEdQbFI3NnZQUUF3bkZONFY2MkVP?=
 =?utf-8?B?T1NVS1Y2VXVqYlAvcDAySVJFU2pqNzlURGlTUTA2L0h0MzNNVU5MT0FZbDVI?=
 =?utf-8?B?Q29ockorcGRtNGo0Z25NUlB2QVhNK3BCZHoxenc5RDZ2T3p2Qy9CUVVZZTRE?=
 =?utf-8?B?NTNyUURwTUxBS29WcW81azFGYktTcDJBamYvaEE5TytXeW52djdkR3FRY1Rt?=
 =?utf-8?B?em81V1d6bUhhbmxjb0RLeHZuN3o1NlA1K3ZqcVMxeGhOTnovN2cwYmZDKyti?=
 =?utf-8?B?ay9hbEVSU0NiWE5NUlMrZWk2WCtlTFYyTFh2akJTMVUwdUxQb0lmNjRyM3dL?=
 =?utf-8?B?RHJ0SWJqTUNWTGZ5bzMxTFlJTXliVnVvUkRmZFp3TDZoRjlIaHdnK2hRaXhK?=
 =?utf-8?B?N1ZGTnVTWklydVpDOGRkcWxnSHhoTTVBU1ZITnVoNHdabGYvSlhKYjl2bTdK?=
 =?utf-8?B?ME1RanJPamR1bC9DOHAvQW5kajRTWXFmQTJ0VU4vNCtJMUtHMUFsMzFydVZS?=
 =?utf-8?B?cFRSYnJ3anp1T2N2aFRaR2gwNzFPRWd5T0RjVkxKa01NcWY0bjNlR3hHVXdB?=
 =?utf-8?B?MUpRazYxckwrOTlrL05CTktPa2VEcjNqTTR6SmlvdElMQ05ESkU0MXllV1Iw?=
 =?utf-8?B?c0NTbnJTTi9OK2MwZEY4SjNaMFVaVWVkSFh5WHpmcXhjMWkyRHVEOFlLc3d0?=
 =?utf-8?B?cFA1endvbHJ3QjN1VWRFanRjYXczU2x4NzJkTDRHd2VVQTI3aHNzK3hUbGMw?=
 =?utf-8?B?bjRzcjFhSDk3RDlYR3hVMnlsOEJtUGJib3FKQUdVUHJWUDc2aUdjb1Q0NERu?=
 =?utf-8?B?bVNHeWRmUVF6dVRDQUlzMGdwUmNMLzhXUzJvNWhJVDIyQ2ZkYitYMENBQVlJ?=
 =?utf-8?B?b0N4bEpnUmY5cWVQWFhKOWtSUU4waDhWQmV1UXp4OEFGZjlPK094OEFPc2F0?=
 =?utf-8?B?cEZZYXFlaU1YSEhyN09BYS82dXd6aFE5bVpldU5CdmwyRytzRDlsZ1BHeGF1?=
 =?utf-8?B?c2pQZkZROHZQS0xrcng4WmlVZ3N0SG9KK3E1M2RuOStrVTBCVnRNcit2NStq?=
 =?utf-8?B?eTFlZGVRemE1UUxqcWcxazBoL0NLUVlsMDVaY3ZocXF6UHhmb2ROcUY5TjFn?=
 =?utf-8?B?Mk1wQ3hUMUlCYVFsRGdkUUZBNVFYTUR2cjFNVWczVWY0ckV6b21MVFQrZ2xW?=
 =?utf-8?B?VWZjK1RDeW1zTmExZXVxMlVEZ3FHaTJ5YUYzSXFJY1lBdUMydzQ3WVJCNjBr?=
 =?utf-8?B?cFloUXpYSTVaRHN5M3ZSUmtlUGlQWHkvb2p4WG1NRzZiTkJoRXlURjNYK2FW?=
 =?utf-8?B?L3R2SmdQbkQ2eDhwUlppWmFTNDl4Ry95MUxBYkpNMVB3eGphclBsV1NtVmFv?=
 =?utf-8?B?bFFIU1BXRnVKSkVCMHp1dXJNRTNBOStVb2g0OUkxUExvTmFRYTVzMnBUTkti?=
 =?utf-8?B?R0FyRmdOQUJib2I5VngvekxMVjMvVGJuMThQQTdGcmhTNnY3cHF3WjVVUWFP?=
 =?utf-8?B?Qy9TR0EwNkpLcDdOVVJUMCt4Zm80Zk44RGE0a0tWN2QwaWNKVkszVGJ6Vzdj?=
 =?utf-8?B?UlhMS2g2K2N4UHh5RVgwNnFMZzFoaUtQblRDRjVxNW1BWDF4REhZZHNUV21Z?=
 =?utf-8?B?aHBjd01ydkNuSXg4OUdhWkNZclNhWUhYVVpkL3dlZnpLQ25rMlFhMCtSdUVS?=
 =?utf-8?B?aDRVK3ZzWHZVaURuT09uL3BBSlV6OHBtTmY1a3BKWEdMa0ZRcjhDMnFRckRS?=
 =?utf-8?B?V0E4aEtCNjE5alFjdk0wRTQ5UnVtbytKWk5ZY1B0YlNaa0ZWYXBjcUE0TTRo?=
 =?utf-8?B?UVo5Z1dia09HZDdyWnVGam1YYzdoM242RElMbHRIQmpBclZ5NTdrK3ZhMTEz?=
 =?utf-8?B?WnZjNGlFUk9lazFwZjQzYU00eFRlOUd2YXJMcmtzYTd2MnJRTjBrakp3eHla?=
 =?utf-8?B?ZFhsNU9RU3lFRXRveEFLbHBWRXUwZzVQQ1N5N1I0UlpiOG5TaXYrZFhzN1NC?=
 =?utf-8?B?dmI3b3RFc3NUN3J0T0czWjVUdFFxS09sNXBmRDhUMTUxUGFIOFl3Nk5MaDVi?=
 =?utf-8?Q?Uw86yw/gzMyqjL0G0bwEfiaLU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9453ea-edea-406a-1cfb-08daaa98f35a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 08:25:12.3366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6z1gnI69KThlQKy6yKf2ZKHHNiLvptiUyB9VbaKyTjSWFrPKe34KEfdT0BB/InlF7UyhUK/RLxzo8tAJ/TaVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7659

On 10.10.2022 09:03, Wei Chen wrote:
> On 2022/10/9 15:25, Wei Chen wrote:
>>>>> Even more so an answer to my question would be nice: You'll then have
>>>>> CONFIG_HAS_NUMA_NODE_FWID=y even on Arm (using PXM as mandated by ACPI
>>>>> when in ACPI mode). But then what's the FWID for DT? I know it was me
>>>>> to suggest this build time distinction, but I'm afraid I wasn't doing
>>>>> much good with that (and I'm sorry).
>>>>
>>>> How about introducing a flag for selected NUMA implementation to
>>>> set it in runtime?
>>>> For example:
>>>> bool numa_has_fw_nodeid;
>>>>
>>>> ACPI NUMA will set this flag to 1, but 0 for DT NUMA.
>>>
>>> That's an option alongside going back to what you had in an earlier
>>> version. Another would be (name subject to improvement)
>>>
>>> const char *__ro_after_init numa_fw_nid_name;
>>>
> 
> When I was dealing with this comment, I found that I was still a little 
> unclear:
> 
> When we were introducing "CONFIG_HAS_NUMA_NODE_FWID", we wanted to 
> eliminate the redundant code of:
> if ( fwid_name not equal to "node" )
>      printk(KERN_INFO "NUMA: Node %u %s %u [%"PRIpaddr"%"PRIpaddr"]%s\n",
>             node, fwid_name , arch_nid, start, end - 1,
>             hotplug ? " (hotplug)" : "");
> else
>      printk(KERN_INFO "NUMA: Node %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
>             node, start, end - 1, hotplug ? " (hotplug)" : "");
> 
> But when I am working with numa_fw_nid_name, I find it's still not
> easy to reduce above redundant code. For example:

As said - this attempt to limit redundancy was a mistake when it comes
to the existence of two models in parallel for an arch (with either
one picked at runtime), unless ...

> "NUMA: Node %u %s %u
> When numa_fw_nid_name = NULL, we can print "" for %s, but can't reduce
> the second %u.
> 
> So can we split this message into 3 lines like:
>      printk(KERN_INFO "NUMA: Node %u"...);
>      if (numa_fw_nid_name)
>          printk(KERN_INFO " %s %u"...);
>      printk(KERN_INFO "[%"PRIpaddr"%"PRIpaddr"]%s\n"...);
> 
> Or another option, we can force each NUMA implementation to assign a
> string for numa_fw_nid_name. For example, in DT NUMA, we can assign
> numa_fw_nid_name="SOCKET".

... we can assume numa_fw_nid_name to always be non-NULL (is
there's any way to reach this piece of code). I have no insight whether
"socket" is a correct term to use in the DT case; that would need to be
confirmed by an Arm person.

Jan

