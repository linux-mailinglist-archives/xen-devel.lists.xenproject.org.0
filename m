Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD54312F57
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 11:45:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82720.152839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l942h-00019U-Dn; Mon, 08 Feb 2021 10:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82720.152839; Mon, 08 Feb 2021 10:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l942h-000195-AM; Mon, 08 Feb 2021 10:45:19 +0000
Received: by outflank-mailman (input) for mailman id 82720;
 Mon, 08 Feb 2021 10:45:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0k8o=HK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l942g-000190-9p
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 10:45:18 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcc1da21-fd14-42a2-8d3a-1e9dfa182c8d;
 Mon, 08 Feb 2021 10:45:16 +0000 (UTC)
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
X-Inumbo-ID: dcc1da21-fd14-42a2-8d3a-1e9dfa182c8d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612781116;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KTAhKbc8ItfP/8f/ZVtVH7mdz7uVY/mhTn0Uoxu7XQ4=;
  b=V7M31FwJwZmGdl+YujJFaQoFVhfI0QmB25A58qBU3TuUtEZs3p0LzMoB
   H983bJmSlvQJMoOZN9d4CaruU4uEYN9uZ0aWv+FM0qVd54tzC0qpPkQHQ
   gA9OzHvx1Tbnk21W1Q3rCfqy2AkStTeK04SErNxmnDMKl7cochdQ/pc2C
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dLXmBGtmA5SK9mLVGnfJ5CwbCEpIfdJepfI+K//9UEPkFe/WYAMwhCpW1kbX2JY7Mgiiy6zT/t
 MgP9ZnPhZ7jNe0QmV5gPCxIBaJ9/DFDdk0mw7sk10PXeBxsh6jMYtYP7F5qIR+sHYauwMfMe+o
 xK51HjPdrlP7T1HZ12+9FFSNVFaGy+sNgH1xpYbupRWq/OOJmlmUS65rN7sLTIsLAd7zHHXVDS
 hntvuBe2/4c59edQA6Aid2ZNvb0WwKVW4yyo8mVOeHHIaS/WfGLi3cyfdnUfXdeZoBIoUGJg3M
 GMg=
X-SBRS: 5.2
X-MesageID: 38109484
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,161,1610427600"; 
   d="scan'208";a="38109484"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZitFKSKKOhP1dbIzVOi/kUfoIOhPjzI8OS24C5WkEv/JZI4dCHtHJBzl+yQmpUb0FrRSZF5LbbF5V1yv+v1i82/YIerPTl+8wb5hz9RFtorKjtIZiTpBjkkiNwqo1M1CtOseUR3S+I1aouIasZ12UapvPQacFNeigdO95bGmHlUb/rQeGnveXgQds2IQc9ckWS3zughSB6dINEKcP4MZxJpd3Qv569PBQBVIcsvPQmeBuI3oh/3iXsge9iEsWU42VkYOyweiaSUAKlbtqxmFBTCgHi+ou0qLt0n5fYq3H67bQ8slbLweb9A2CD/bTJWAddMjNmnnJKC2v1eu7Jb0vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTAhKbc8ItfP/8f/ZVtVH7mdz7uVY/mhTn0Uoxu7XQ4=;
 b=aQSUZ3Jba6eFbxJFXSpUsp0Cljtcb4YTA7+qWnlpTG80CmOJwda335H3OcqHDVkRGF2URlpH6Ho0xwiWHdDLwAa1FHeFTD4N4xMymrGCpLpWj/eJw0/Xp6DeSSmYOlEZLGrK65jOX+Uh/2KfLpRM0nm/PxZt5cYD0w069nkGTEF1VAqcjUQHMTGcDSKAozusyxCK78rd0U2/lAxAYaVWr9QXnWaYGYdwGmTG3upadjt2d2e8dgaeZKhtS20rkwvWVCjeI8bZwqr7cl/OAq338AFquhdJAGEVvQYQ66+2EVlijhEXad4fW5tety1pMgiw5uuuixWHf3i1zpM0mldHEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTAhKbc8ItfP/8f/ZVtVH7mdz7uVY/mhTn0Uoxu7XQ4=;
 b=oGLjqoGfJ8mpbXHIk8yY3Mp/qKI0opKoC0/VAQ4EehagjowU907ZnZR+AULJYdvFmcs35VP3JCX2ZszO9zsEXHLvTrLwsThC7rOTt/OxsH0MVhKvJT5vJDptSdBISiE3KkobsC5utB3FAJDJ2/WMfG7qFc1/ufODGFbV3vw1NmQ=
Subject: Re: [PATCH 6/7] xen/evtch: use smp barriers for user event ring
To: Jan Beulich <jbeulich@suse.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
	<linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-7-jgross@suse.com>
 <2d354cad-3413-a416-0bc1-01d03e1f41cd@citrix.com>
 <dfa40af0-2706-2540-c59a-6593c1c0553a@suse.com>
 <e68f76a5-27ce-a6d8-88a3-1e8fa1c30659@citrix.com>
 <def49076-f943-9418-86b0-2aafbd0bf7de@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f2a71421-7169-f3c8-9799-66dd8e07459d@citrix.com>
Date: Mon, 8 Feb 2021 10:45:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <def49076-f943-9418-86b0-2aafbd0bf7de@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0096.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::11) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72475f3f-8efe-4915-2a52-08d8cc1e9d98
X-MS-TrafficTypeDiagnostic: BY5PR03MB5153:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5153E3CDB939AA8B01E7AAFEBA8F9@BY5PR03MB5153.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H2I1amvuTChn+tCPiOxf4+h1ktKuLuEekRNJQup3NpdC6vmpHxtPOK6R5WROPp1l79FZH3Cp0qxkH98NtjytBAWQTrggqo8Yaj1SnkZJHr2w1jRiCZdNbLmOenDqRYRrXebqHPDhXEki6dFUEGBuP0WCZcU61GsjZthHlgSpxwvxD56jDs7k9Gr4+4TgDi3hJLT2TUtG62LK/qaNmI7CfHFemJTlupq8qYPmyK1N5Fy6MPwzH5SWKge4VEaPOumtaYzABWzBX4AueBhW4i41gNCJnjFeJarFAa/O5S581Iptf6eEn8wUZpccwTd6ErbS3qh/m3/h0XVZsfLVgNsDRKKs7LPlqjtiJVWfU73f+H46s3DvyW13PVH6BMS0NV7zr+KrwtXjDWRN2e2qxY6NUeA3Thle5Bfg9JDAnnghhpK7/tLwBdpLYIiEMniaYXL+vtB4Mg1nIz19vl4qc5W8iBLO4ZoL0vOW9hv2DFYy3EoysntsWGagNOtdpR0lGUJsYZyOBPE7woWnj2G1eWX9Ef8sA3AQllzuJuzjbIpvma7cUzFb3n9EiUkBXnqGmukKgXcNQDliLPflTuGsNYabGml/rixY5LroVh5J7+pyKcQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(31696002)(2906002)(66946007)(36756003)(478600001)(6486002)(31686004)(54906003)(4326008)(8936002)(6916009)(316002)(5660300002)(6666004)(16576012)(2616005)(53546011)(26005)(86362001)(8676002)(186003)(956004)(16526019)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YzBpTlVGK3hMdThGTk1EOVVVbjQyQm12TTJjSW05WWIwVHJPNHBMTUR4amh5?=
 =?utf-8?B?VENnNXh1Ti9ucUZ6WnVMRTA3RkRXemREUUZBVnh6WmlPVnNpZjZvVEliTHZE?=
 =?utf-8?B?dXU3UjQweDNqQlRQM1k1OFQ3cFBwQ2RYQUcvcmJoOVpqU056Y0dIRmFOblEr?=
 =?utf-8?B?S3hkZzRkODZ0bmdVY2p4TmxGcmw4cUJ1V0xnR3ZKL05XblpHR2h3Wk9QQUww?=
 =?utf-8?B?YlI4bHcrUTBNWDEvME8yT1NzemdGK1g1NGQ3Mkw1Q3Qzb1RaWWJZL00wMlNz?=
 =?utf-8?B?cVNvSVJXR081UjI2b20xUlJkZW1FcHdLakRJY2FWeGdMa2JMMWVZdDN2UWtW?=
 =?utf-8?B?ME1ieExtaWQ5R0tzSkZnNkR3VWprYlhMb1VWS3VMcU1UOG1tRmlZMzZPVkJw?=
 =?utf-8?B?VXBQVitFRk5Wa0xvdDhlQUFUdmFTNHBiT0pyejNGNFlKMjZEVHdnbVpnb3hU?=
 =?utf-8?B?MU5wWGNYQS91d21KUStsQzNKNkljWTJmb0ZBU3VWZ2xxN0UrdkJUSEFOei9G?=
 =?utf-8?B?MHRvTVZHc3pFQ1dyRXBvd1VBWGszaXdqZHJzMUZFYytVeFV3cGY5OWpZR05N?=
 =?utf-8?B?K0VWTXBlbFFBenpHTWxKZVJZWUFvQXdoM0JPaE5nNEJudU5Vc2FOZXVQQ2lF?=
 =?utf-8?B?a05zUGRZdGZ5cXhKcHpIaGZqV0dmNDNiSlpEK25JL2hLTXkwOUJFK2NuOGZT?=
 =?utf-8?B?Wnh4ZDU0TmN1Z1BieVozamVvRm1CTzRocmkvdTNyMmVTTDlsQi9lQTlNSmdL?=
 =?utf-8?B?d1I2OVc3TkM2LzMrTzQzY29LRXhzS0NkSWFtQmt1SkZuWi9rTXU1UnNIS1ZU?=
 =?utf-8?B?WGZNZ2NDa0FYbzNSa2t3QXBZRUUxQlMvOVNwNlVzcGpKZEpNb0s3SHJMN2ZE?=
 =?utf-8?B?WEgxdWJlME9FWjVmc1dJM1YyZklCb1NsN2pJRzg3L1BQZHdXTTJmYi9FMUJh?=
 =?utf-8?B?S2x5UHpTam5XQWVxSGowWDM3d2dxaVBDQ3JhMEJscnZZcHIrVXhnYWx3bTBt?=
 =?utf-8?B?ZDNRWWN3NzloRVlUZHJxbXIyOXZtb2s3SE9yNjFlNS8wUUw0czZXSXBmZEdN?=
 =?utf-8?B?UnJrYVYxa21xTzRvTnZwMGlSaEZKM3N3RDJCTERrQWRnV2pwd0IxYVlYQmNQ?=
 =?utf-8?B?YWhWWWV4WVhIUWNrWDZkbWtwQzc2VkM3ZVBUNXR3MVVkVUVzYndYYWFZTW5F?=
 =?utf-8?B?Q1RtSTM3R3NkN1ZQa2RsYUVpeUtaOXBwWHFCbndqRDlxVE51UnJhcTl2TG1w?=
 =?utf-8?B?QWEyQklBREQxZ1FmaUVwWVVETk9GNVN6U05VZElVOGo0bEgzMXJzSnJvL0tD?=
 =?utf-8?B?SlE5OTFOT0NlSmNKbUVLRytxTjB2ZmNUMEdxeFRZZmEyc01VVk5XbFk3NjN0?=
 =?utf-8?B?WEp0dGk2Zm04NFoxVVFvZHR3OW9xY2lqQmI2eDFTeEFWODN3N2Judjl2R1NX?=
 =?utf-8?B?OXdoSnB4RUpvUWZwVDVtZFJ4VlkraVVtaDFJbkVqZHhSQWtWWlB3VzBwR2cr?=
 =?utf-8?B?S2dHS1IrRFJNaDZvQWxZMksxdmtkUzlRSUpHRUpqRHRraGNGbFhxOUJOTkMv?=
 =?utf-8?B?eXdRWnNVMlpFc2JMSlRSVjRCemxwSUtmTEhiTjZGMGdYNThWNmR4NFlyeDR6?=
 =?utf-8?B?SkdqNC91Q1ZDelJHaWlDcG0rL1QwV1R5N0tCYzJ4bDVqNUQzNlkwVHEwaHRY?=
 =?utf-8?B?MmswL3FvYTFwZm1jTzBhdnllYmk3dVU2K3dxSTN1NWlZUXE2dkZ6bmVyeGhi?=
 =?utf-8?Q?htMe1yvQhFI8stNoOw4SpJPXh85ptrHmuzUTmD1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72475f3f-8efe-4915-2a52-08d8cc1e9d98
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 10:45:14.1333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43hiNtLVWtxhfBbIbGRUgT3J7Pu6a8zkvJkHblBGNbXRqWT3OVkfOisoE6VU4u5JVYqHiTsspG6EZQEPRwT7+6AzoTFLT8Jsq3Sv7TyYJpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5153
X-OriginatorOrg: citrix.com

On 08/02/2021 10:36, Jan Beulich wrote:
> On 08.02.2021 11:23, Andrew Cooper wrote:
>> On 08/02/2021 09:50, Jan Beulich wrote:
>>> On 08.02.2021 10:44, Andrew Cooper wrote:
>>>> On 06/02/2021 10:49, Juergen Gross wrote:
>>>>> The ring buffer for user events is used in the local system only, so
>>>>> smp barriers are fine for ensuring consistency.
>>>>>
>>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>> These need to be virt_* to not break in UP builds (on non-x86).
>>> Initially I though so, too, but isn't the sole vCPU of such a
>>> VM getting re-scheduled to a different pCPU in the hypervisor
>>> an implied barrier anyway?
>> Yes, but that isn't relevant to why UP builds break.
>>
>> smp_*() degrade to compiler barriers in UP builds, and while that's
>> mostly fine for x86 read/write, its not fine for ARM barriers.
> Hmm, I may not know enough of Arm's memory model - are you saying
> Arm CPUs aren't even self-coherent, i.e. later operations (e.g.
> the consuming of ring contents) won't observe earlier ones (the
> updating of ring contents) when only a single physical CPU is
> involved in all of this? (I did mention the hypervisor level
> context switch simply because that's the only way multiple CPUs
> can get involved.)

In this case, no - see my later reply.  I'd mistaken the two ends of
this ring.  As they're both inside the same guest, its fine.

For cases such as the xenstore/console ring, the semantics required
really are SMP, even if the guest is built UP.  These cases really will
break when smp_rmb() etc degrade to just a compiler barrier on
architectures with weaker semantics than x86.

~Andrew

