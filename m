Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA7D2F1A44
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 16:58:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65005.115024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyzZq-0007bF-UX; Mon, 11 Jan 2021 15:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65005.115024; Mon, 11 Jan 2021 15:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyzZq-0007aa-RF; Mon, 11 Jan 2021 15:57:54 +0000
Received: by outflank-mailman (input) for mailman id 65005;
 Mon, 11 Jan 2021 15:57:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ci+=GO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kyzZp-0007aV-IR
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:57:53 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31fc58c7-760c-4841-9ad8-7d423f57f74d;
 Mon, 11 Jan 2021 15:57:52 +0000 (UTC)
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
X-Inumbo-ID: 31fc58c7-760c-4841-9ad8-7d423f57f74d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610380672;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=A0tM90vc/5a5/wcTu68Yi1FvvxcPU60LMWbkz+k9qdk=;
  b=SdaPlgVkRpEVxrfOAV/3zhqh36E4nKh419VuGJMyI9a229bWW3aspvNd
   cBVc4NaHVDnI24scPyV/0HH/8jD4C7GlxJwxit7Kz+FrJCrCI6ZlSQziV
   UQmbYg50FcY5K1TLQosZYxUjhyR8Vu1TMIg5hUj56SLpMFok5u+5QazRC
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wgJv8C+MkuOjoY9GywNZlspuUK0PPtUFuqRYe3hE+XpbtJWIEukNR4fGCF21KuLNXS197Rp7Qf
 G09Ev23CG3ZewQaqh1Feye70cTJwA8Zscdaw+IvvZ2AvkaKo7OGAEt4qtlZBhr//NVqsEJaRji
 GbCQnzmQaePkKDZbXxAAN66ZbFwDVmNCJ5Xg1Ovs/eggbPgSTysBBtPMgQpLDHAIyDX2m28tnE
 Lu68JmF+tScFi7nXtsZA5e024ih4gh0V2fxrHHoSC1BmHo9+bpBXwAJn/Pu0JvQOze0pfaJKlx
 zTE=
X-SBRS: 5.2
X-MesageID: 34836633
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="34836633"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwFStR5+LrnH4oXc0vyDuRUOL7hU3htWYRwIyqbOGXM2Spv1++YfQ20FO1HKaoPy1qTJJ7D/pXhkVeAvUHiUR6kE0W6SXUi1Hkr79rYYr0bJw/fYv/IIUofq+JuYk56Kqp/Kes2jHZcyc+2jny5eCnXKyGVOQAe/khRmB+3xVbaC4rf9uqM01FtaudhBtDwvbPtSgK4MMV+APufw0ENhYeWJDiK3Cvir1V6kaIPipNOfb00MK/Af6hJFBy1izWT09MM1oKzCTZ2i8qlImRyXSoXGvAmsdlfewN4qEDXIFDZlPJqZNEapSddkvokTQ7vW77PC6f4Xdlj+XoyYhiJ1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3CIQ5B6ky7mC/spBld3HayakLYgVAImwOq6sXPdr4Q=;
 b=DVkD3r2ngslYkAnXz4ppp5niip+QjV6WlwCXldv8tLHGyKyF9aB86GIxapIbWoM9O2V71T19thO4/oC+hWpfk1Uh/BbEZGtOtB5+zePkZc5ZhJFN8D2QRlKfr22u/76JQl/Hb55Eb74DAZD3VhiJE4N1n/umQEu2KOSjdjGp5Hg+AGBGkKiJ5TMwC6Irb7iA+wHw+nAVn8Hi8hatGUHgoSfCQdIMNBzuMdSdG8iFfNGOuOkmdptOkCg3vCuGHpN5+6E+UjYR+pR6V4YV1pg0xfPou+kk2Kvo+107bujZhdgGQJU82zbs9MTlm+JSMRQGmY2fQJSULYEweANksEW41w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3CIQ5B6ky7mC/spBld3HayakLYgVAImwOq6sXPdr4Q=;
 b=uAsvUQrHPCWQolVkOUMONpffaS4/959ahorM5e6AfAL6b9mFdVDsDjG33Nh18vPbDZKFwuJHEqh2VJ60p9NShK5l0Wkj+gX0sxvvqAqa6Ch7eP3LiyLZHg6Fs2x6uBs67zs+E61SpKcd3yy+QWvSZSyD/vusmvLz3FC/9gwdqdw=
Date: Mon, 11 Jan 2021 16:57:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH 5/5] x86/PV32: avoid TLB flushing after mod_l3_entry()
Message-ID: <20210111155732.ke2ob66432pscyuw@Air-de-Roger>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
 <181be414-49b4-3bd3-bb55-cef443191e60@suse.com>
 <20210111142308.3fowkgtvqy4dmnli@Air-de-Roger>
 <cf55e504-38f2-479d-524d-eb53e2f58b9b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf55e504-38f2-479d-524d-eb53e2f58b9b@suse.com>
X-ClientProxiedBy: LO4P123CA0065.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d812df6-586b-4940-b34c-08d8b6499dd2
X-MS-TrafficTypeDiagnostic: DM5PR03MB3146:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB31468D89655EFC1DA1C48CBE8FAB0@DM5PR03MB3146.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jYNN+64yqdG3tfXl2i/1vwp3UizIWc2+LUhA05DYWc09sebWLH4GHAxcDnToD5NrrrSbAdh3x+c0vguXHNpwPo32xeb3kX1m6v69OPcR5dNFExn0x2Hxc6VZZ19zjIS7H5hRz7Z13VZKXGp7K+yR0631K+lH10+hQxlun3eXXqCL3ReRjd8bYNfZsdcVtXf1jQjmFI19FahxFS2KDJxvpYF7TjrgJv0zKURC6ST5xWxZwdiSmm/COJ+Aq5tm9fWsb6HIoglJ+rKbq8oy3UAy1ahmBGG/KgrMgmMXY1fDA/ndstYAzMF53TO2WnPluLWodzZKTFXygqhbZhju+VABFgm85e1P4llaUmr0DESiK8RdxzUtTlCh5m9HeweCA16Gwp/AySQV8HekKhaamSKOVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(136003)(346002)(366004)(396003)(39860400002)(956004)(1076003)(6486002)(316002)(8936002)(2906002)(83380400001)(5660300002)(6666004)(9686003)(86362001)(16526019)(107886003)(66556008)(6916009)(8676002)(4326008)(26005)(54906003)(186003)(6496006)(66946007)(85182001)(53546011)(478600001)(66476007)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WHYvb2ZzREpCTWt0SWZiSGROZWtJaUs5cTBpTXo1STh3eG5DZ3Jwa1UzOE1T?=
 =?utf-8?B?T3VmTTFOTVordUJIcUR2b0dsaDV3U1lyMi9GODRWcEFZQzROSFNObHRwalQy?=
 =?utf-8?B?ajVuTmhpNkdDcmtxT1c5WUhqNnBmUnZMRWh2bkQ1WEtEWUU5cTFtTnVQTjQx?=
 =?utf-8?B?N3VMcmlKU2JqNEhEMzhndmVWR0JhRGY5WkxBemlEZFlhdTNuVFJDTWtWRWJ0?=
 =?utf-8?B?OWlHTlhlTDZ0MHJack1zNmsxOHJRWlVKZnNMZVBYYmVhdEJCaDAxWEJRV0VP?=
 =?utf-8?B?NHJObXhDRjRPalhhMGt0VVM5NllVcWJnaEZ2WCtsSHRhKzNqM2daTkh0a2g4?=
 =?utf-8?B?VW0zL1RiTVNSN0JYT1ZzODRRN205VVdGcjJRNFpESnBFU29jNnU2QnFxeS96?=
 =?utf-8?B?eHhLd0s3SDBXZHQ0OGovZ3NTdzZVMEp4d3dHUFFYTkFEZFdWMjVJWGJDbnoz?=
 =?utf-8?B?dVl4MzQ5SDN1amlLekozM0hmNVk5MmZqV3N6R2J6TG9FbjBjV2pGcXF3bGhD?=
 =?utf-8?B?UWZHanRNK0xYOVY4T1dwczNnZHJ0ZzI0c01EYkNYOVRleDRpOTU5YXZBTU5M?=
 =?utf-8?B?QVZreFozdWZ0VmJtS0dqWm4vVTNqcE1NbHNBZEVUejIraXRCSXdsQTlhVktr?=
 =?utf-8?B?UkR0MlRKOEUwTGZxZnBremtTZEEvRnhHc3JWWmcwRkQ3N0I4Sld3bnRmVTJq?=
 =?utf-8?B?ZUFOeTRHa09BNmVYV1NQTEEzQXNsU0dzTCtuUEdrV1FiMlhNRDhRcG5WYW1Y?=
 =?utf-8?B?ZVJDM0JOMm1WSEpPQ2dpdFI5eFJ3Q3lMVDVta3lQazRoL2tQOFZLdlFGcFc4?=
 =?utf-8?B?TDYwTU1HNWpyclVzMTgyUFlRNnJCbjlFZkplbzlobFVWd2tMT295SjgzTWRx?=
 =?utf-8?B?UVQ3MGJJWGZnc0dlN1dGbzhvSEVraldLZVpQdmxhTENoQUFzVTRQQ0cvVXdh?=
 =?utf-8?B?RDN4L09Za0VNdzh6cUQ1MDZUNEx2czlreUlKNldKMHRvVFJGOTM3YXhaY2pq?=
 =?utf-8?B?c3MyVmtnN0dYOFFtQUg5RFFRck9KQS9sV290RDBzTUlZWW1BZ1lGRExLVXdS?=
 =?utf-8?B?NUNsVjVVcEwzZDN0Z0VYbjB3OG9qV3pOVXFSWHNZQTJCMmtabjdQdzVPM2E4?=
 =?utf-8?B?OGsrK29ERkFsOGtxbm9jb3REVlRvNzY0OStOeXh5N2hBNG9JSVlzWkkvczdZ?=
 =?utf-8?B?RWRySTA1dDZpZy9JMlJlRnVWdUJ0cmczZUtwN3VieHhNRUhqV0dkeTBJSTMw?=
 =?utf-8?B?RzdsanRYUjF6SUVCbHRMZ3dldWRNOHNjNlBVcGpjVU4vRGhueXZBN3VTMElv?=
 =?utf-8?Q?f/I6Si1nDFXBXwjqxHE27d1voAeVnqR2x5?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 15:57:36.8877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d812df6-586b-4940-b34c-08d8b6499dd2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuT4nZcVpmwvMy8El4Ys6mWL+bT2QeGhCNseQEzWfUeNM1I01G8BCvFsg+5QMW0689gsu9eMregXYRrtUiZKHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3146
X-OriginatorOrg: citrix.com

On Mon, Jan 11, 2021 at 03:28:23PM +0100, Jan Beulich wrote:
> On 11.01.2021 15:23, Roger Pau Monné wrote:
> > On Tue, Nov 03, 2020 at 11:58:16AM +0100, Jan Beulich wrote:
> >> 32-bit guests may not depend upon the side effect of using ordinary
> >> 4-level paging when running on a 64-bit hypervisor. For L3 entry updates
> >> to take effect, they have to use a CR3 reload. Therefore there's no need
> >> to issue a paging structure invalidating TLB flush in this case.
> > 
> > I assume it's fine for the Xen linear page tables to be lkely out of
> > sync during the windows between the entry update and the CR3 reload?
> 
> Yes, because ...
> 
> > I wonder, won't something similar also apply to 64bit and L4 entries?
> 
> ... unlike 64-bit paging, PAE paging special cases the treatment
> of the 4 top level table entries. On bare metal they get loaded
> by the CPU upon CR3 load, not when walking page tables.

I wouldn't mind having this added to the commit message. In any case:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

