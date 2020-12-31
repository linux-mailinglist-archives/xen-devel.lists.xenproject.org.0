Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DABDC2E7FB7
	for <lists+xen-devel@lfdr.de>; Thu, 31 Dec 2020 12:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60517.106225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuwIN-0002VV-Ql; Thu, 31 Dec 2020 11:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60517.106225; Thu, 31 Dec 2020 11:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuwIN-0002V6-NP; Thu, 31 Dec 2020 11:39:07 +0000
Received: by outflank-mailman (input) for mailman id 60517;
 Thu, 31 Dec 2020 11:39:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIAU=GD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuwIL-0002V1-N5
 for xen-devel@lists.xenproject.org; Thu, 31 Dec 2020 11:39:06 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 568f5b3b-7f69-4cb4-953b-14cc742f739d;
 Thu, 31 Dec 2020 11:39:02 +0000 (UTC)
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
X-Inumbo-ID: 568f5b3b-7f69-4cb4-953b-14cc742f739d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609414742;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=aInut7JyCpiAzvfaDakqSiCf6uQ1lNKSdZHQbTE92wg=;
  b=Xq7aJbqofjuPtNbt9m5uKHFJUwU2YYppGDRvpxMU8QxdewQLxi7LEDcX
   uprbsi3LpsJDbCmEp9ip9fPXQEiOl8Onmvn27o2l3LpwdfzGul3rMnZNM
   dEmygvF0Pnqxs/CJwrbHLj3suxPX1gEVmksuk7Hwjaparz+FD7vTehDl/
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oOnwT6W/RrcwnMG6MKptGOw0WkJqDyddswjM1Gw1tqxIELwS3ipwlmddzUjqP7g7GfNmv/9bN6
 IzOdtbyhTAWbdB5FHlWahZOwwkbWNGAA5toDyYwy7yl4YS1T4rLWPT/bq8/XEb5Bf0UBUdegTR
 Q/srjy8C5I0akqD+HZafvBEUxSIyJBKDQ9BYxNVqhnfdFh7gK650Zvug1m0q2hIhro01ki20h/
 GYkFNAUAGVs3EtnmqecVXHa1P2y2pxCdEcq71388vd9zkMDul8HitBQFgzPlumDZRd2xL9XKRP
 wSY=
X-SBRS: 5.2
X-MesageID: 34565937
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,464,1599537600"; 
   d="scan'208";a="34565937"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnYr/kZEz39dyb9POLb0L/NbdjunkQIIaIi8GrFLYc2Yo4geY9rPqopzNnaG7DR7z2jWW2nVCqoXdT5kor/FJQt8fu+7u3cA7MtxhnvP9bU/bW7k5Np+7qr9IpOsKIDHMhAIj9IzfZ+ljqn0GP2s7YSLvPnzBdigpN8fPy/GUDLE8JaUassBtj80iQCP8YmFvxICUiPPWmt0/fhz4a8Qkkk3JmGhDZY9oeXHHURFOGV6Cs64+QCE/oGccPWSuqVBS404YQAA0yl/pjO0h1AGKJ6T26i3/7qZKpbWDiTzEM06w2+L8TjzQ8ox0LNm94lf82oorPrc7q+VIxU7fS3HJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErATkNMeYpagVSj1neMVSCRFlx5oN0uzbtN5CjR2NEY=;
 b=cz6pNqolLogKuIG89k8mYjlQnrAF/EwZu5xC3COyUlWl+8N0dNRIV5ckDn3MayRxs/L0tJltDBrmFeXSt5mfoH49OcWtU4P/zjNK3QbiLSgVe37cJgfoDvDWVHrhgQk24/eUNp8DRlfTTt/aHj6MpTogv3s/27JzsljLuRP/tbb406D51lcMKCbWWZPJfiovJdNCN29fup1dzRU6I6mhs6F26GaxrB3LrSQBLniDWVjKenqrvEd0HfpkMCmi44wi9BqK1U5tRsdKTjfgN986mRlkAMf91vt4cI/ri/bi4dolgsahKbimqyNX4lCZL3vkYiQwquOQft8+6l1/lNjwDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErATkNMeYpagVSj1neMVSCRFlx5oN0uzbtN5CjR2NEY=;
 b=ilFj6BixARfvjRyHlU5RKvFvOiO6kR6LQeVA/TGzoF6t5h01v0Ym5tO2p26edkPcV3F5bMjPf//KDURXSQVpU1Z0kGAw7XJ9BomTMJGtHF3pkR+JMUxT6uq29t2l8tgN7OJX/2Yu5CU2Ls4DS5MnuDbsFtnUKXqZbDreI+qQuIo=
Date: Thu, 31 Dec 2020 12:38:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien.grall.oss@gmail.com>
CC: Rich Persaud <persaur@gmail.com>, Jean-Philippe Ouellet <jpo@vt.edu>,
	Christopher Clark <christopher.w.clark@gmail.com>, openxt
	<openxt@googlegroups.com>, xen-devel <xen-devel@lists.xenproject.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Julien Grall <jgrall@amazon.com>,
	James McKenzie <james@bromium.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>
Subject: Re: [openxt-dev] VirtIO-Argo initial development proposal
Message-ID: <20201231113852.f7rgmqrpfdayfzfj@Air-de-Roger>
References: <DBCC8190-7228-483E-AE8A-09880B28F516@gmail.com>
 <20201229091730.owgpdeekb7pcex7t@Air-de-Roger>
 <eac811f4-51fd-9198-446a-230dc6915f62@xen.org>
 <20201231084556.ogvltixgd6ovlja2@Air-de-Roger>
 <CAJ=z9a2xJ2g_UL2oMzyQBGB1cA3nqdOrDYMPg2urHesHs0Dk5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ=z9a2xJ2g_UL2oMzyQBGB1cA3nqdOrDYMPg2urHesHs0Dk5A@mail.gmail.com>
X-ClientProxiedBy: MR2P264CA0118.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b58633b6-33bb-4ade-2351-08d8ad80a9dc
X-MS-TrafficTypeDiagnostic: DM5PR03MB2635:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2635A2F6303A9B2DB3298F4E8FD60@DM5PR03MB2635.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SPvNi6hGadKEe50oA1FQNU6dpxHmnL5JroLMhq9icxHh5VrXfWHyKKaltG0fYr1W7Xwb2Wf6b4Am5phBjmYTk092jOAIhpX6buezJWF5AVMWCwJQlyA8Y7H5Hca1CwUMS38EXMg4L1G+TV2qdgvFx01gPH+/q3QbtPMkGC0EzTZcw1cfb232LeYshRyWJnIg0Wk2JweR6KZhfst6+JyG76/ou7cTRFhCEDAl/qU/OG01e9ZReLWDZVXAzjCDdtrxOb3V6CMkz3KE5XpbZVNUEjpoOiuRoEwYN2Clpa91b4aUQWko7FUZLH80JhKmaIvW1i8oqWgi9f9KU7HaBU6ACU7PT2kSUtxgdNj9V9laP/2Q+4649MmDbdZCgcVzuuX2EZ+mRbT8uOAzBm5sruhIdg35JmbU31z/PswiHeVT9WBqh42PsDdshwscEjGYSekVKFhwen/CUy/TZep+ll9BWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(39860400002)(136003)(346002)(376002)(366004)(5660300002)(6486002)(16526019)(478600001)(8936002)(33716001)(26005)(7416002)(966005)(85182001)(54906003)(6666004)(86362001)(6916009)(4326008)(66556008)(2906002)(83380400001)(66476007)(53546011)(8676002)(186003)(956004)(1076003)(66946007)(9686003)(316002)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UEtLdFJ5ODNzS1F0MkdzQ0xWVkFDSEZsMlI1LzJqeGRNSFB2TWpnM2ZRVlhC?=
 =?utf-8?B?QjRMZCsxRWxBVHdKdWxDcXBQVkFKSGZlYUVGY0NVcFJiZHdQLzZUZi9jSnV4?=
 =?utf-8?B?VE9wNGFYVUxneDhNaFk2MWNhbjUxSzU4ODBFeTUyQyttK01Xd2lPRTNjQk8y?=
 =?utf-8?B?dFozblhIcTd6RG4yUi95Q0NGK2RTNXdXdmhHdGVyKzliVnVmanVmaUtMWk9v?=
 =?utf-8?B?dmRtUjhFSjRWZk96OUtpUm5Xc0xOSEt2T0c4N01zdnI5K1M2TElhai9JSTNm?=
 =?utf-8?B?WFJUZFhiNTY2clRqVnFYRmZZdEpFYnFkamkrUTluUjZzZDhsc2hKYXhnMWNm?=
 =?utf-8?B?QTNvTVpuZlpGR2dNUisxZE5Na0F4OG9LclVGYURjSmRicFdKRS83TWhRdVc1?=
 =?utf-8?B?dW9oc1FOaDhLcHR4eE5sSXRaRFljTlZGNW1VL2lSOXYxUXNDSklEaTJCY0k4?=
 =?utf-8?B?ZysvUXR5SlVtbEdLbS9NMlpZT0R5aFlIenFQckdCanBqMEpGZTVjdENHV2hm?=
 =?utf-8?B?UmdveWRCbkNNTEhzYjBBTENPaFlaa3lramQ4eE5CblZhN24wYjE1aTZIUjdj?=
 =?utf-8?B?Q3NuSEtNVlNaM2lQemFQYkc2N2tKczgvZERwU1I0aUQrSld5ZDV2ZGYweWxC?=
 =?utf-8?B?VU1YSUFNMjRKWjdnc1BxZCtKWC9oT1h4ODNlU2pmZjFCLzQyemxud2RVUmtH?=
 =?utf-8?B?MEFTRnQwL2IvRDBxU3ZBTGhMQVMzb3RyZ2E3NlhySDZuQUtqbDQ2amQyRkVQ?=
 =?utf-8?B?VjVOSmVsekFOa24zZldGNHlJMWpDV2tPS0RoY1JlYjBYSDBJNDRTaWFGTExx?=
 =?utf-8?B?RXQ5QVhQaDlKUlBSUEVmWjVMSlJpTFVDRVl1UU1Rc08rVHh0VzFBRXdmd3Vw?=
 =?utf-8?B?bmVZMWJ3VWlJLzFjaDdzNVRocW5VaGpoMGFjYnY3ZGlCK3RPLzJVZmN3V3pw?=
 =?utf-8?B?elUwTjBkRjBqNGhTTWZSZzhWSGJLWEdoYzJ6ZWVsK3VZbTlmTlIxcURwaDR0?=
 =?utf-8?B?Rnp2a3VMY2p0UkxpY2JXWkNSL3cvZE9SdDVOdlBGRzU2Sm1xVE51ZzFHM0pz?=
 =?utf-8?B?TzlSM3JMOGFyUmFIOE5mR0h3d015QWl5QzN0b1VtT3NMbFNhZjNQczZpSmF5?=
 =?utf-8?B?TG92OHZBQ2l4NUpaZjYwK2UwR2tCRjd3N1FSVWR3enAxOEVQY1o0TERwL3hS?=
 =?utf-8?B?UDY0RjdRc0ZuR1lSdlBmcDdMVHIxbFhPSjN6c2thMTVLYkdMeEsvdExnWXJG?=
 =?utf-8?B?RERPamJzYkhFcElkTG0rUURsQitPV2V3Ri9HK1VZYTRmU3p0RlllenNXNzlW?=
 =?utf-8?Q?8z2PGxgiwo8ppiPhVAvKclh7yIQnGqJdvV?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2020 11:38:58.9174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: b58633b6-33bb-4ade-2351-08d8ad80a9dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBsaNe5qUyMsaPGPoadDOesVndJpp7gKPfcv4iu+TQEg5FKFph/ufrUCW/pbUvyvLi8NaiYKV/swEqK270hwKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2635
X-OriginatorOrg: citrix.com

On Thu, Dec 31, 2020 at 11:02:40AM +0000, Julien Grall wrote:
> On Thu, 31 Dec 2020 at 08:46, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Wed, Dec 30, 2020 at 11:30:03AM +0000, Julien Grall wrote:
> > > Hi Roger,
> > >
> > > On 29/12/2020 09:17, Roger Pau Monné wrote:
> > > > On Wed, Dec 23, 2020 at 04:32:01PM -0500, Rich Persaud wrote:
> > > > > ﻿On Dec 17, 2020, at 07:13, Jean-Philippe Ouellet <jpo@vt.edu> wrote:
> > > > > > ﻿On Wed, Dec 16, 2020 at 2:37 PM Christopher Clark
> > > > > > <christopher.w.clark@gmail.com> wrote:
> > > > > > > Hi all,
> > > > > > >
> > > > > > > I have written a page for the OpenXT wiki describing a proposal for
> > > > > > > initial development towards the VirtIO-Argo transport driver, and the
> > > > > > > related system components to support it, destined for OpenXT and
> > > > > > > upstream projects:
> > > > > > >
> > > > > > > https://openxt.atlassian.net/wiki/spaces/~cclark/pages/1696169985/VirtIO-Argo+Development+Phase+1
> > > >
> > > > Thanks for the detailed document, I've taken a look and there's indeed
> > > > a lot of work to do listed there :). I have some suggestion and
> > > > questions.
> > > >
> > > > Overall I think it would be easier for VirtIO to take a new transport
> > > > if it's not tied to a specific hypervisor. The way Argo is implemented
> > > > right now is using hypercalls, which is a mechanism specific to Xen.
> > > The concept of hypervisor call is not Xen specific. Any other hypervisor can
> > > easily implement them. At least this is the case on Arm because we have an
> > > instruction 'hvc' that acts the same way as a syscall but for the
> > > hypervisor.
> > >
> > > What we would need to do is reserving a range for Argos. It should be
> > > possible to do it on Arm thanks to the SMCCC (see [1]).
> > >
> > > I am not sure whether you have something similar on x86.
> >
> > On x86 Intel has vmcall and AMD vmmcall, but those are only available
> > to HVM guests.
> 
> Right, as it would for other architecture if one decided to implement
> PV (or binary translated) guests.
> While it may be possible to use a different way to communicate on x86
> (see more below), I am not sure this would be the case for other
> architectures.
> The closest thing to MSR on Arm would be the System Registers. But I
> am not aware of a range of IDs that could be used by the software.

I don't really know that much about Arm to make any helpful statement
here. My point was to keep in mind that it might be interesting to try
to define an hypervisor agnostic mediated data exchange interface, so
that whatever is implemented in the VirtIO transport layer could also
be used by other hypervisors without having to modify the transport
layer itself. If that's better done using a vmcall interface that's
fine, as long as we provide a sane interface that other hypervisors
can (easily) implement.

> >
> > > > IMO it might be easier to start by having an Argo interface using
> > > > MSRs, that all hypervisors can implement, and then base the VirtIO
> > > > implementation on top of that interface.
> > > My concern is the interface would need to be arch-specific. Would you mind
> > > to explain what's the problem to implement something based on vmcall?
> >
> > More of a recommendation than a concern, but I think it would be more
> > attractive for upstream if we could provide an interface to Argo (or
> > hypervisor mediated data exchange) that's no too tied into Xen
> > specifics.
> 
> I agree with this statement. We also need an interface that is ideally
> not to arch-specific otherwise it will be more complicated to get
> adopted on other arch.
> For instance, at the moment, I don't really see what else can be used
> on Arm (other that MMIO and PCI) if you want to care about PV (or
> binary translated) guests.

My recommendation was mostly to make Argo easier to propose as an
hypervisor agnostic mediated data exchange, which in turn could make
adding a VirtIO transport layer based on it easier. If that's not the
case let's just forget about this.

> > My suggestion for using MSRs was because I think every x86 hypervisor
> > must have the logic to trap and handle some of those, and also every
> > OS has the helpers to read/write MSRs, and those instructions are not
> > vendor specific.
> 
> In order to use MSRs, you would need to reserve a range of IDs. Do x86
> have a range of ID that can be used for software purposes (i.e. the
> current and future processors will not use it)?

There's a range of MSRs (0x40000000-0x400000FF) that are guaranteed to
always be invalid on bare metal by Intel, so VMware, HyperV and
others have started using this range to add virtualization specific
MSRs. You can grep for HV_X64_MSR_* defines on Xen for some of the
HyperV ones.

Roger.

