Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4686832E480
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 10:16:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93529.176471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI6Yg-0005SD-UA; Fri, 05 Mar 2021 09:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93529.176471; Fri, 05 Mar 2021 09:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI6Yg-0005Ro-QI; Fri, 05 Mar 2021 09:15:42 +0000
Received: by outflank-mailman (input) for mailman id 93529;
 Fri, 05 Mar 2021 09:15:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAw7=ID=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lI6Yg-0005Rj-37
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 09:15:42 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b912cdc8-618a-4ff1-9200-81746f2b41c2;
 Fri, 05 Mar 2021 09:15:40 +0000 (UTC)
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
X-Inumbo-ID: b912cdc8-618a-4ff1-9200-81746f2b41c2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614935740;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5WLW6xC1hb0LU3xrQHdVehbuDxwwHl4xlznZGb0zOwM=;
  b=bOnsVexKyudxtz0ix0YUQBAjWxv1TV4CemImmlghHTbnsZoshxQVFuzi
   g7FawgmEEYOfphMSeSgf8Q//swsTuvST0ZeKPmeoSqcV8bVDs0/EzSLTL
   XIApYT6fztpU/qNeWEEegbzk1Ew5YWj5D5x4zY8RWfpm5tXWvEsECe9v7
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WZxMw46G7MlCecjbeiNHYDAqKc1c6lUoLDWzfrO+zkb8wkmanAGwnZ5LYyy+fl4OAYfPryqXf1
 brsdoNTHMYeVdWFlx3x2emwq3INhdjkp5qsCLBMm4+jmXCn/E1/Jdnls58k6geFg/Py+Bpvaww
 nRyVD4CmQAsYCK2p0sZpiyNKPftiHFNp1uG32Ji/xFAiRULK8mYihBOLLUiSME3hUf8DNSJWHH
 2OVM56DUYgB2YH7yhW4cEfGReElebH2pAYovAiVOUY5QLEblxVNdmNH/Ekx8zBOpbthhsDyu0r
 H0w=
X-SBRS: 5.2
X-MesageID: 38536023
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,224,1610427600"; 
   d="scan'208";a="38536023"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jdvgrkap3HRD13M81sY20CQAkeQpBrzilcYQ+QF5s4WC+6fzZr+zUbhwOmOLpeJoUqyJyeGxEbSsb1Opsbog0b/KmaTbZVrAD2ZgTG7eB8WpjZPwHlucHOhBS1a1zCNlg45VnsiZHyQ/2OkqvKy24ANLomnkAzgb/a/aphSQXsSB+1Gz8rOiuhebl5H7hBfhNgqg13BFssBAGKK4LDVgeuvsV7vAp9XLdXqCM42Xq2IQJrcFtEcjG+wbZX9OJMRpBIW7ubtbqS9FhnDWprKcxLaMTHPxqYtoprSCMCTbqNatDOyLwQgM3FV5AOIBYKJRIiIkxXmDgc1DfeOz8Dhwhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STPnH53ZsQpCKQ9ZN7EFp5JtlTRdLtQXi0k0FIJDNpo=;
 b=cqKuR8tDSbVQSUhiF6KVymWMf6ketbN2Z8WRMWFiqek/+/4rQENX9GX4z5GribYRUwtZoo3nflB/2w7BYLxsdjzLMWrULfwejkaFNsGOEX6T5u5giy150cWT7LVN7AwRofRo9vYbGpg+J92gZH9r/w0lM5gxKTI1sJohANdWzZBZQ3sh2GFY+QyJllynMBz04sFUO+3kBRfcmuKp5bMeXh2F4360rIaT53fgnbkkoElzn4YKT9usuloQEg4Fwenv9Egb4jI8msjXfXMJ4Vkq3No2P+rBAozeqhel+rHTtyRIxptduD+KcgyLTGqWxdjYUAYmSgD8l28dyh7iGwue1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STPnH53ZsQpCKQ9ZN7EFp5JtlTRdLtQXi0k0FIJDNpo=;
 b=YitAHVdjr4y8B9Pp+aAMZ+zrh4c/IHHtZS9ts7sTe4/CrgGQ/e9dJJQP/bEqTyymYQ1LM5Vy60pnFDcTK67eZkhM9pako26Rum7RERRvekraovjKKP5zCRwkDIxngrqQmme10rgKEo2ZTQV6JmitSmv0MVQwyZ5ZYF1BqQXhp+Q=
Date: Fri, 5 Mar 2021 10:15:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed
 rdmsr behavior
Message-ID: <YEH2rEw31frFcq4D@Air-de-Roger>
References: <20210304144755.35891-1-roger.pau@citrix.com>
 <4cb7e1f3-0593-6d06-281a-e3bf06843221@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cb7e1f3-0593-6d06-281a-e3bf06843221@citrix.com>
X-ClientProxiedBy: LO3P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65c9924d-4f62-4a87-8785-08d8dfb738d7
X-MS-TrafficTypeDiagnostic: DM6PR03MB3674:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3674253F03F69DA7EF74E0768F969@DM6PR03MB3674.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KnfbRJ5UzEs6kwIiJEUSG+huRojxUl7t5BthWE9lLpcDWQmyUMps31o3i8qSLBUpvChHMkdpHRmnI/kZhMYaMdSZik2Vfeg65Kh1KqZoZ+NEfAj84V1VFCWxbc71u+mI8YMxOasFKG5jbNORLnnO8nWqdYF8q7eloufy2eFs36bkzCjw8Ze4BmwkUL1bbS1/drmLDwjljEfDnT46gUQItpH+Nfx3BF3+Kw6ro9qCWv2PoMJHDdfLtlRmJTfXHnG+GQsuObADuv3+Zr0ixrP7GKRxVgHcA3Ll2I+poM8QAvMK0wy8LPGEeVbTbj6cgtfQO9Ktzusz5mYyXHjrqGfLeJvkyYdIr5tnEYj8QtrrCmF5pbiU54q5QM6DbdOwhW9HW0iPdDp2pgXR4ZnmKu6prySZZGiqQU39ACTbvh/v+B+FdV7ERPaViOZKCTAVOJByd+J/8zwni+gU6q3RMA8BguLvSBHHdAR5+mQaHyMKm/R2ApNzudR+RBQFINrW8fLgYX1aDar1wOV2BZpSEVNW4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(136003)(366004)(39860400002)(376002)(16526019)(186003)(26005)(6496006)(86362001)(2906002)(956004)(5660300002)(53546011)(66946007)(66556008)(83380400001)(66476007)(6486002)(33716001)(54906003)(8676002)(8936002)(85182001)(6636002)(4326008)(316002)(6666004)(6862004)(478600001)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OFQxK00vREM5U1BjQ1hQL01sSUtrZXZPbm5seDkyS2ZRQld0QytDVDhJalpR?=
 =?utf-8?B?cmFFd2lTZ1QvdXk1ZE9PZi9SM0kreVFWaUc2N3ppQm9DQVUxWFdVaHVLZ2lo?=
 =?utf-8?B?Vy82NDdEM0MvVm9JV3ZFbWVaYXIvbVJMVGNDdVNQejRSNlNuZm1DNEhxSnJF?=
 =?utf-8?B?QU9lME11TzQvVWZWVDJzZXZnVnRONlUwUEFpdGVTQm5IdWQyNUhtLytkd1B3?=
 =?utf-8?B?TVo5OXpCMnJmRGFsNVZxMENhN2JFbHBnUllVbnB2SzRyOEkwVHpKNHRsa2dM?=
 =?utf-8?B?SmZLSTczSndMWWU2TVA0T0VidFBwTlVrOEM4bEhoRGRGKzRyZm42Y0RiQVM1?=
 =?utf-8?B?MWRZWHZ0KzVvbXIrUzBKUE9kQ1lDdTRHeVN1Y00rcnFOZ2RMVUdFb2k3SXN5?=
 =?utf-8?B?c1F3TFJoZkJaNWFuOXNmVTdNT1RjSWdBRGw0a0x4TFdTUjRpaDIyaERhRmdt?=
 =?utf-8?B?SmdvUEh3bTRqUnF3QTdYTngrcVUydlVQVWNEdzFKeEorT1VJb0hvRld5Y05M?=
 =?utf-8?B?UTNhQUdHTWZwOVpJVnEwbWJSQ0UxdkxBL2tQb1ovQTRmTFRhQUFPVy91clNq?=
 =?utf-8?B?RDlCWlg1TllCV2MwRncwNk04MXlpckhrVkJoUDFkYUM4bnpkK083UENDL0Mv?=
 =?utf-8?B?WHZZNnFxTWxCckdHSTl5TXhzRDc2MFQ1Yys5RU5lSUJicFFBSE5ldjNxT1ZM?=
 =?utf-8?B?NUF4bWpiVXFSYi9rUGJ3ZUljd2oxYkZoc3hkc01wYUtPeGFjRzJGL20vMXc5?=
 =?utf-8?B?amc2ZjdNR0RtNWJtOE1jTk9KOGREblBoZzlUWjhycDNnbm1LT29MMkRDNVli?=
 =?utf-8?B?cDRRbU1aY1hvd2FGdXVZcWhVUGpjSFJjNTllT3I0TWRMQS9IUUpBMUQ3TDRG?=
 =?utf-8?B?NTVNR1RrUlBCVDVXaFVKRXp6Rjh5Uk5JTktZcVM1YmV2Zjk0K0F2YzA4ZzJ1?=
 =?utf-8?B?dXpuaVYyS0lHQ0ZlRUowR0VzeWU2akNqUUd5b0lEem56Wlg0Q0ljREVPS0pT?=
 =?utf-8?B?SW9YZjA2YVVtQlRIVVB1eFhrclpudWxsT3V6a1VtN29XdDV1RnZVeE4rN2xZ?=
 =?utf-8?B?bnZBRUNSY01tS0NYVlRxR3l2anoxVEdDYnhjQnUveDNhYldjdUhMRlgwRW5K?=
 =?utf-8?B?UzNpMGN3dWNCMEE0VjI0YW5KLzV5MWs5Y0JOazlueng5b2pPTUIwTldrOHg0?=
 =?utf-8?B?SGs2YzVxbTdFM0dPZDl5V2dudFFZcEF2ZFRHa1JRdER2cytqZzFZa3J5NkJ3?=
 =?utf-8?B?dnJFOFZhY2J6R2FLOFFXS2syTlFudzY5Tjhsemo2cExYbGxRWHdRcHRHajdW?=
 =?utf-8?B?RFVMcmhld0pQYjBHNzdmQlVXZnZWMGx3dVdSMGRtZUZWUm5LM1Vuc3hSZkly?=
 =?utf-8?B?RmdyMy9WZmdjY0VUZmVDTkw1djl0TXBlSkx6SEJyQUxTc3dIK1pMK0t4NWlL?=
 =?utf-8?B?aE1PUHl2SVVrcEw4d0hkVmpJTnhtQUV1ZWNlS1VGYitYTG5lTldGRWdURmly?=
 =?utf-8?B?ajVlaHNJeXpZSDUyeVQzWnNuY1ZLMWt1MUFCQnVpTEwyLzMwTUpHOUphMzJp?=
 =?utf-8?B?alI2ZjB0U2ZURnlzdk5rKzI2TUNaT3JkaUZYak83SkdOcXVhZVhHUG5GL1Ns?=
 =?utf-8?B?QnNuR2xYbmFJV1gzS1BXeElDSGVFdmdVd3REckZVcmtWQjVmNUpFeVJZdzg2?=
 =?utf-8?B?MVc3YU5OZ0NCd0FIQkpuZmlvNjFqenNrRDdCdVpiS0tDYnZYc1NlWlFMMnI3?=
 =?utf-8?Q?zE7w/a9D3dv0sd/Ncy36SpkUv5qtDkUVLEXNUwg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c9924d-4f62-4a87-8785-08d8dfb738d7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 09:15:29.9937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLke7Y2YnKaZO1mhWARhITcJJs085BagzzNnOgbiz/Vtfv1IPDJUKj1mO5atWHYvIXp/5cePGyCorRGu3yApLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3674
X-OriginatorOrg: citrix.com

On Fri, Mar 05, 2021 at 12:06:19AM +0000, Andrew Cooper wrote:
> On 04/03/2021 14:47, Roger Pau Monne wrote:
> > Introduce an option to allow selecting a less strict behaviour for
> > rdmsr accesses targeting a MSR not explicitly handled by Xen. Since
> > commit 84e848fd7a162f669 accesses to MSRs not explicitly handled by
> > Xen result in the injection of a #GP to the guest. This is a behavior
> > change since previously a #GP was only injected if accessing the MSR
> > on the real hardware will also trigger a #GP.
> >
> > This commit attempts to offer a fallback option similar to the
> > previous behavior. Note however that the value of the underlying MSR
> > is never leaked to the guest, as the newly introduced option only
> > changes whether a #GP is injected or not.
> >
> > Long term the plan is to properly handle all the MSRs, so the option
> > introduced here should be considered a temporary resort for OSes that
> > don't work properly with the new MSR policy. Any OS that requires this
> > option to be enabled should be reported to
> > xen-devel@lists.xenproject.org.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - Only apply the option to HVM guests.
> >  - Only apply the special handling to MSR reads.
> >  - Sanitize the newly introduced flags field.
> >  - Print a warning message when the option is used.
> > ---
> > Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > ---
> > Boris, could you please test with Solaris to see if this fixes the
> > issue?
> >
> > I wonder whether we need to to enable this option by default for
> > guests being migrated from previous Xen versions? Maybe that's not
> > required as the option is helpful mostly for early boot I would
> > assume, afterwards an OS should already have the #GP handler setup
> > when accessing MSRs.
> 
> We know when building a domain whether it is a migrate or not, but don't
> recall any version information existing at an appropriate point in the
> migration stream to do this easily.
> 
> We can buffer the stream forward and peek at the libxc domain header,
> which does have the source hypervisor version, but that is going to be
> very invasive to implement.

I need to look at this more closely to have an opinion. Instead of
figuring out if the source version is older maybe we could add
something to the 4.15 stream in a suitable position to detect whether
the source is new enough?

> >
> > From a release PoV the biggest risk would be breaking some of the
> > existing MSR functionality. I think that's a necessary risk in order
> > to offer such fallback option, or else we might discover after the
> > release that guests that worked on Xen 4.14 don't work anymore in Xen
> > 4.15.
> 
> Much as I'd prefer not to have this, I agree with the sentiment that we
> should have an "emergency undo" which people can use, and carry it for
> at least a short while.
> 
> However, to be useful for the purpose of unbreaking VMs, it must change
> both the read and write behaviour, because both are potential
> compatibility concerns (without reintroducing the information leak).

I think I was confused here and assumed the previous behavior would
check the written value to match the current underlying value before
injecting a #GP. That's not the case.

I can expand this patch to include the write side, I just thought
having the rad side only would be enough to cover for the unhandled
MSRs accesses.

> 
> > ---
> >  docs/man/xl.cfg.5.pod.in          | 17 +++++++++++++++++
> >  tools/include/libxl.h             |  8 ++++++++
> >  tools/libs/light/libxl_types.idl  |  2 ++
> >  tools/libs/light/libxl_x86.c      |  4 ++++
> >  tools/xl/xl_parse.c               |  7 +++++++
> >  xen/arch/x86/domain.c             | 10 ++++++++++
> >  xen/arch/x86/hvm/svm/svm.c        |  6 ++++++
> >  xen/arch/x86/hvm/vmx/vmx.c        |  7 +++++++
> >  xen/include/asm-x86/hvm/domain.h  |  3 +++
> >  xen/include/public/arch-x86/xen.h |  8 ++++++++
> 
> This needs changes to the Ocaml bindings as well.  I guess I'll add that
> to the todo list.

Hm, would be better if someone else did those, as I don't know
anything about Ocaml. I can try however in the next version, maybe
it's trivial to add.

Thanks, Roger.

