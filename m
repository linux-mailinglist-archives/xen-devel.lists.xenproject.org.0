Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3260B324389
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 19:08:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89462.168519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEyZX-00068p-L5; Wed, 24 Feb 2021 18:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89462.168519; Wed, 24 Feb 2021 18:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEyZX-00068Q-Hx; Wed, 24 Feb 2021 18:07:39 +0000
Received: by outflank-mailman (input) for mailman id 89462;
 Wed, 24 Feb 2021 18:07:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mT50=H2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lEyZV-00068L-WD
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 18:07:38 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62f1bb50-5003-4228-9474-070c1a13cc7f;
 Wed, 24 Feb 2021 18:07:36 +0000 (UTC)
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
X-Inumbo-ID: 62f1bb50-5003-4228-9474-070c1a13cc7f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614190056;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/oLhVa52hUxUKtSbAID7LLgsTNFnwK7ci+HdKGlL7TI=;
  b=ZlWPwHddeqdQhkGnRIH3dLEziLH2GFV7tOfpCACNg2cltLJ/rNuutAA3
   8UJLraf90hBjxVdMaCWNSxgi6XI9wdKKYKnAKuPzweb8yg11YsuYF08T7
   PXViQkt/COiV0Le1HUhKjse9Rs7nB8jcK8NxfXmqHp3is/OJBWtAIX4nl
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: N8ZGRH5ZyhImsvOovHH7UxUlcq9Yv4KDNEA8DAs+qNzQivhpr9UcJQce6AMqXX4ZLlpKCaPiQF
 ZlPTeLc1K+TQrdv/OEOxlUzR6EyNsKbQ5Qw+l9lpKnJ8F57xarU0a0E42KZoUQqYTSBIWsJ4gq
 ALpGnFH6yFFInlR1pANdHTZ5D3DLyF22BGeu2GwdpIp0QfnPdWWtkehPMcblpLp2HTWfcsVPRF
 3GC+SSwnszMx0Y5Me+o98TxNzjo8LqW+/aEtNTaQR8RvtLwepBI50pEjN6P/YR+hzJ00ILTY5Q
 OKQ=
X-SBRS: 5.2
X-MesageID: 37969292
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,203,1610427600"; 
   d="scan'208";a="37969292"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoUjZmvhqZLYRf7XZSA5FMWM4nG+//G8Dk14UgVaL4twapMjbDc7GIW8VqGRhB0XS3eHMhEw5dZM4CC7mGoCQHB37NpvSFpeaG9ZzejQw52q8cr+UQ7MiRyFDz3tkkpSe+3VhLZkFY90A7lLKNEljkJADvIVDQoMv2OccPt1N2b23Zum2OtaMIkTjZFaHpZJhO2ozmZU865A+Chx+tz8JjRHsCDd23VJf2JS/CwyY7RYt+RqGZONN8zs7CRZHawqg2uJMuIgvEE0dk3CIu2A1ZLUhdie2iLyIAi8QUA3cpQOK+btDffWG2AgCNyNexZ3uW0W3ArIstWaoSQ6lv8bZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oLhVa52hUxUKtSbAID7LLgsTNFnwK7ci+HdKGlL7TI=;
 b=TFx8zotsgNfyHCmuQH8br+A/mMzSKtvPjMnJa0prmvTUTYTbLYVVXlmuveZgP4sApaDrQywgLp0fgTumM2FetbaqKcjtU5P0QOuQGp6O3H0Th06tiisQqqwA+/yUpLghjJn1T/wX3lVvJaPclstlySYxXSGqRAUppQS6PTLQi0hhWe2NtWKQLR2PSkXTvBRYDx/lHoJZepzHSFpBoVhekMeq/juWE4eITWrBiK6oochK7VuiHW8+MyIjaW+hU//Ncgi/+vf0quJgmEgcWjwaucDs5an4AiuEn+nJsg5rPhAjyMEBRqB1un4/F98wPsutxPt4k+ZHptr//3sdk4eISQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oLhVa52hUxUKtSbAID7LLgsTNFnwK7ci+HdKGlL7TI=;
 b=IofMJq1shN/S3kkgH5gPIC1KTfOkQIzMbV5JG8WogS+9IDUFMmCXmFmlmeLOpECHQKrTOnw7fjd71EV1oJIqoK+N71HOIE1MakKyJqPj+YXicpQu/wQDNqER2LgHRHaEV28qgzlSliZYX6vg/V3tpPobxSUmDf3JaGFmWKiRZNI=
Subject: Re: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
	<dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <25034a7a-83ed-0848-8d23-67ed9d02c61c@citrix.com>
Date: Wed, 24 Feb 2021 18:07:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0233.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4a499a0-3fc2-4c68-6dbd-08d8d8ef0ecc
X-MS-TrafficTypeDiagnostic: BYAPR03MB4294:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB429429ED3C739CF583106274BA9F9@BYAPR03MB4294.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pbEb7ZzYVPFtIc/4lxv6VOXLugXh5wvRay9WWa/rTu4OMyUe6LHwkJaaFyjun7TGgUZQIwfIvy9NRQkxEOnAT8fK2Tubz3/Z0/qEapaMRde3xtS5Qa6R0CprLbfTtsnRdQcgIn7zQ8LNKpxKHCd09WTnNMsHGeQjbO7Glxrz/4of6aiCeGb2tqWV/H0xVQkd6B2uI0Dwt4kWO08mCH1b+T3xK166YvmpH12jBpxIIC6J36XgRzMfDVawknk8y3N8iWBjvPndp7ZjDpu7oBW5eZ5kMasrMvxT5I5PQ7R9TD8+hgSX8ggxGBcuqX9WIaDvtOfYOiEADSdMDxLRYYCzDV0SgVI47vOBjg9AjL6DMet3k2byftKTgAX7F7TvYfxAJC6CEWmD1iCOTSlVJ5431vGv8j23BhJyB1v4I7624BT3X7oZ/2+W1poqWO//IWVcunAOr0r9WAWFWfd1H7tiP8oIDggDQdlVteVIKtqEm0eRJfS0SEO3kUyHuCOWQzdEqdXdSgVN2AwuEQ75vVHXkyKBKrR6tw9aNn++BTEGTSWdhEJJTezK2bOaHLkKEVWaTpJuTmmIyFmbWGWIGgEl9WVZ+CmgaIRpLQE9YOuoLTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(66556008)(186003)(83380400001)(66476007)(53546011)(478600001)(66946007)(2616005)(6666004)(956004)(26005)(8676002)(5660300002)(36756003)(31686004)(31696002)(54906003)(2906002)(16576012)(110136005)(4326008)(6486002)(86362001)(8936002)(16526019)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SDFpaExVUFg3Vm9vWHRHLzhBbXZrNk0xdC9CcXpmMm1MbmFyWk90bFJUZ3ky?=
 =?utf-8?B?TzdFSEtSeFJuSnVya2I5eEVmamtLTjRJUmJmNkY1eHZjalUzT0hVSkhiUTg3?=
 =?utf-8?B?anB2N3RWWXptYXBabUN2UjhkMEpXRERPTFBqbXB0cmxiLy9rUm1uelZYeXgy?=
 =?utf-8?B?SkQySXJidjBjZGNLSWdmdVNyaVZwZmxReHJ6OVByZ09sRmk2bmpYak1mM3A1?=
 =?utf-8?B?L1hxV2MzWVVuOWFqZlBQSzVRN2JDdUZha0t1K0dZMUxpb2ZCZ1lUYW9tYU9h?=
 =?utf-8?B?MFhzVWpBOUlxM3F6TXd5ZkNPRU80Sm5GU3Urd1FvWkd0U1VEc0IwbzZBTkYw?=
 =?utf-8?B?aUlIbUJ6TXdJU0ZxRDZEVml3Tld4ckZnY3F2Rkc5T0NXTmpkTmVVejNkUm9E?=
 =?utf-8?B?ZFVZNGZEc2JmN0N4TGo3SVZtZWsvbVhSUWVLTmdaQ1p1UHdaeEE0Z3h4M2Zt?=
 =?utf-8?B?ZWF4a3p6S2t3QU5uenlveVF4N2NsTnIxYWdaY0RhNEZDamJRRjZYNVA4clZ3?=
 =?utf-8?B?YzB1TGN1ekl3bjV3dkZoQVB6eXplUDdPc3RZbHRldllpV084Vlh2NWQyT3Np?=
 =?utf-8?B?a2N1aE81bnIzNUg1T29ZbTlGZFp5VE9ONnNIOExJNDNwVUtXdFNMY0VpVzl2?=
 =?utf-8?B?ZDRVZDhoQzU1cFhSQU16K1VqYU1RSFpyVEhOdGx4a1RQTzdQb1pHVVdtLytU?=
 =?utf-8?B?OGFuMWp5ZmdQS3cvNzFlbEdrNUJSdFNDN0hQNmVNeGxud0l0bXdLcUw4L2N3?=
 =?utf-8?B?alRzZXByc0wxeEZIK2pLS0FTN1pHNTlKUWcvWmNGRjFXNkxZcGE5bSszS0Vt?=
 =?utf-8?B?VEwyYlp2RXY0Q2p0TEgxR1NKSTB2ZkhONDNpajNySWQ3Y2krNG5QTWdjQzBG?=
 =?utf-8?B?RnZuK0FSSFJta3IzZ0Q3R2ROQXBzK0Q4UFFUK0hXOThIQ3Nmck1FdGxSb1l4?=
 =?utf-8?B?cUNhai9GZzNYNDN2NXF0MVFqNDkxSEl2UlhETGJjZWZ1TXRuY2FsNzhjU09k?=
 =?utf-8?B?aWJ5N3dJTDFxSC9zeVBuRGFsUHExMHJTQzdrclYxQXJzK0NjdElTaTVhNU0z?=
 =?utf-8?B?YlFWd0k1bCtnYU1VZlJWWHdBTDZoUklnM2JvUVZGclZnMTdrSStZOFg2Ym52?=
 =?utf-8?B?SjgrUnNHVXlJU2JGNDkwM01nSmVsTjhDSURZTVZua01qcmtHcTl3Yy9BNXY1?=
 =?utf-8?B?UWR0QU9YcEcwNER0T1FEdWVlazFvMUxUNUdKNmY3RS94K24yS2ZLamkvWE01?=
 =?utf-8?B?R0ZOOU9vS0dBSzFsMWFrSlpkTC9kN00yZnRzUUVTZXlFbXRLZGNZYzBjMGlF?=
 =?utf-8?B?NXQwYlh3YkR3R29HblV0Q2ZCYXpkNTdZT1BlaElnTThYU2d5V3d3YXhrSDJU?=
 =?utf-8?B?KzF2ekFCbWFEVndKY1JvWU95MmxpQnpLOXpmL3htRy9xYjNaaFJCZ3Q4Z0tQ?=
 =?utf-8?B?RmFvYitXV1dtbTRqaTh1Mys0Z1BWTnFRYU1QUHZTeEx6dGNrNUpVK3U0RUx2?=
 =?utf-8?B?OUZkS1BVbG44UnJ3V1dCVTAwQW9LaGNRVGE0WFRYcDBxV3RzNSs4RVM5VzBa?=
 =?utf-8?B?N1lrc3FxS1RwNzJvYXJ5U1NwajFYWE9yNXJPNVdlbFpyN3RtMUhkdnhka1Vk?=
 =?utf-8?B?amFubHNpWEF4cCtkMVFtbk91OVVxbjBtamNLeHZRZVhKeU1IWUQwR05OMnBx?=
 =?utf-8?B?VDRWSnQ5enlBekhNOUo1TDNVNTF1eXVyV2lna1JnckpIS0pRcCtyVGl1QVJ5?=
 =?utf-8?Q?B4REjp2xfG4LvZ/ZJ68yznaG49FyOvy6YynlgKx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a499a0-3fc2-4c68-6dbd-08d8d8ef0ecc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 18:07:33.1676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sM9bID0edIZ6/9xSU36/2K0ED81Cat26XSPghvrR2RkZYNdbQyhOyXD/p67OYbLs0oJzVyJHt3elp2dEU3C7+CArbsk6Y5LiX/uzv2N3H6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4294
X-OriginatorOrg: citrix.com

On 23/02/2021 02:34, Volodymyr Babchuk wrote:
> Hello community,
>
> Subject of this cover letter is quite self-explanatory. This patch
> series implements PoC for preemption in hypervisor mode.
>
> This is the sort of follow-up to recent discussion about latency
> ([1]).
>
> Motivation
> ==========
>
> It is well known that Xen is not preemptable. On other words, it is
> impossible to switch vCPU contexts while running in hypervisor
> mode. Only one place where scheduling decision can be made and one
> vCPU can be replaced with another is the exit path from the hypervisor
> mode. The one exception are Idle vCPUs, which never leaves the
> hypervisor mode for obvious reasons.
>
> This leads to a number of problems. This list is not comprehensive. It
> lists only things that I or my colleagues encountered personally.
>
> Long-running hypercalls. Due to nature of some hypercalls they can
> execute for arbitrary long time. Mostly those are calls that deal with
> long list of similar actions, like memory pages processing. To deal
> with this issue Xen employs most horrific technique called "hypercall
> continuation". When code that handles hypercall decides that it should
> be preempted, it basically updates the hypercall parameters, and moves
> guest PC one instruction back. This causes guest to re-execute the
> hypercall with altered parameters, which will allow hypervisor to
> continue hypercall execution later. This approach itself have obvious
> problems: code that executes hypercall is responsible for preemption,
> preemption checks are infrequent (because they are costly by
> themselves), hypercall execution state is stored in guest-controlled
> area, we rely on guest's good will to continue the hypercall. All this
> imposes restrictions on which hypercalls can be preempted, when they
> can be preempted and how to write hypercall handlers. Also, it
> requires very accurate coding and already led to at least one
> vulnerability - XSA-318. Some hypercalls can not be preempted at all,
> like the one mentioned in [1].
>
> Absence of hypervisor threads/vCPUs. Hypervisor owns only idle vCPUs,
> which are supposed to run when the system is idle. If hypervisor needs
> to execute own tasks that are required to run right now, it have no
> other way than to execute them on current vCPU. But scheduler does not
> know that hypervisor executes hypervisor task and accounts spent time
> to a domain. This can lead to domain starvation.
>
> Also, absence of hypervisor threads leads to absence of high-level
> synchronization primitives like mutexes, conditional variables,
> completions, etc. This leads to two problems: we need to use spinlocks
> everywhere and we have problems when porting device drivers from linux
> kernel.

You cannot reenter a guest, even to deliver interrupts, if pre-empted at
an arbitrary point in a hypercall.  State needs unwinding suitably.

Xen's non-preemptible-ness is designed to specifically force you to not
implement long-running hypercalls which would interfere with timely
interrupt handling in the general case.

Hypervisor/virt properties are different to both a kernel-only-RTOS, and
regular usespace.  This was why I gave you some specific extra scenarios
to do latency testing with, so you could make a fair comparison of
"extra overhead caused by Xen" separate from "overhead due to
fundamental design constraints of using virt".


Preemption like this will make some benchmarks look better, but it also
introduces the ability to create fundamental problems, like preventing
any interrupt delivery into a VM for seconds of wallclock time while
each vcpu happens to be in a long-running hypercall.

If you want timely interrupt handling, you either need to partition your
workloads by the long-running-ness of their hypercalls, or not have
long-running hypercalls.

I remain unconvinced that preemption is an sensible fix to the problem
you're trying to solve.

~Andrew

