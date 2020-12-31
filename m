Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60F52E7EBD
	for <lists+xen-devel@lfdr.de>; Thu, 31 Dec 2020 09:47:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60435.106066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kutb2-0003z8-TP; Thu, 31 Dec 2020 08:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60435.106066; Thu, 31 Dec 2020 08:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kutb2-0003yj-Q4; Thu, 31 Dec 2020 08:46:12 +0000
Received: by outflank-mailman (input) for mailman id 60435;
 Thu, 31 Dec 2020 08:46:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIAU=GD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kutb0-0003ye-QN
 for xen-devel@lists.xenproject.org; Thu, 31 Dec 2020 08:46:11 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eda73e53-34a1-4ace-b8aa-89b19f390615;
 Thu, 31 Dec 2020 08:46:07 +0000 (UTC)
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
X-Inumbo-ID: eda73e53-34a1-4ace-b8aa-89b19f390615
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609404367;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gRxrrKXZn0KdLmk6xPEJsIwzSBfYwF762ol0b1f21L0=;
  b=d2YF4h0iIMPU4uhv6iwWTvL+sbMSmfYjnOHhOy4CMrKUC+UM0jpCMeEt
   LRQoshw10wrSOc8ooNk4kQyrl/yIe4Js5Imx1mQpcb7c4uhSQBOhvswVM
   SMLllAYSoySzz+QUANOv8g0RNhnwm5s90K6IyaCL3iRwB3/6KP8ZxU6w7
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: sGoeYkk4ypAAPSwWpVlb4YuwXYl13dpXSWNzPGw5Azv9QW2YY5hGNugNqDm5qV8lWyXq3V6z8i
 bNBwM7955uRmigA5aKZdSvxI3KikTC55dUhIkp8JfbqGYWE4s1fXdSYNjtiDVVUd6YdqBAWJNv
 egJCaAkN4AGOJSynNGwTf7z3EZ4JCnu4e5NWqggf9S2UHglFIgdrIPUOAXbiTHdSZXRq6GG5yJ
 cWXR8IsQzm4pbeQPIy5+Zycf9mZJfkt9GZe6narOFxFrDWfCUKNwGGQUQ6daQiHt4Sww+rFvo0
 WX4=
X-SBRS: 5.2
X-MesageID: 34427108
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,463,1599537600"; 
   d="scan'208";a="34427108"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNfXFBU5xj2ccMb+lO7iM9JZbEyAar2lPoYb2lhh2klM5JuSWH3jghryOp5dCgYdIlIEiymJQWWwul9nVT5XolpJ/Tqm6cQ/ApknESD8uqfLjx2nH+bzjkEbHJB2kheoouxJW0yK8QG00l74h5c6YOh8ASVPOvVjlZZV9nxmI9+foVjA14XnfNFoPfcNthMg/khaClAhH87cf2yt0lxPSvNnJajzve8RbIJ1pNoEbV0qu8Q6r3j3igUq8PZQJ3DjrlagPwZZ8JFr9bddZa8WchMtkss6TRiWMDJLMolUr60cvrg0Zlfq0ojDWZZ+z94wYYmBkKL7J2YTT5X/XgLG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fUtm5oHVl9pVLu6B6OLdeRXtRiaWfgxkme+DWGgI54=;
 b=nAtOVonR4FrQYtCHgZHwpcJOumCQyPB4/AQiqtxW6Mmz6gkP416UkNNfs8r61bmmjjCvtyZU4J3Qrg21hyoJLB1w3u5JR8XCAkceQnMs7oTH/8v1rYacCsfzF7kDhuzGcgyyEnHussqoef6XZ6jMORZzslvI9SUPbuXIeS/SortW2e3OhD6+TRSuuPc47u68NWukyqlJ5AvW/LI5LrELyCop0bncHFTeC4X1I/AO0KhRBDHMrsAWVlzHiVmXF5tUEM+ITdEFKjfThJITXjxHkOh5D4W4PHSS49aLcYtrV2kZFle3ZjJ9+x2gaj3fL9oYzD9JdQ57oxNIWW8MMPd/Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fUtm5oHVl9pVLu6B6OLdeRXtRiaWfgxkme+DWGgI54=;
 b=vora2xGzH8GcLrpxDcyh4ckY03veUhzRXNCql8CD4gx34bwmtFVJ/wKgJ3oMqiz1avGZiryl3plom6HVYK6I2Z41hlWOhwvK7DAfBITYv0i2GQyOseGNae9wgxlcSiB7cnRJekLL9M1OH1oXlKpfU2mq4R9x0PKFd3FFdpOgkkY=
Date: Thu, 31 Dec 2020 09:45:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Rich Persaud <persaur@gmail.com>, Jean-Philippe Ouellet <jpo@vt.edu>,
	Christopher Clark <christopher.w.clark@gmail.com>, openxt
	<openxt@googlegroups.com>, <xen-devel@lists.xenproject.org>, Oleksandr
 Tyshchenko <olekstysh@gmail.com>, Julien Grall <jgrall@amazon.com>, James
 McKenzie <james@bromium.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul
 Durrant <pdurrant@amazon.co.uk>
Subject: Re: [openxt-dev] VirtIO-Argo initial development proposal
Message-ID: <20201231084556.ogvltixgd6ovlja2@Air-de-Roger>
References: <DBCC8190-7228-483E-AE8A-09880B28F516@gmail.com>
 <20201229091730.owgpdeekb7pcex7t@Air-de-Roger>
 <eac811f4-51fd-9198-446a-230dc6915f62@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eac811f4-51fd-9198-446a-230dc6915f62@xen.org>
X-ClientProxiedBy: PR2P264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61b14778-8f39-4a77-ea0e-08d8ad68810f
X-MS-TrafficTypeDiagnostic: DM5PR03MB3290:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3290BEF9A2656D424A8F298C8FD60@DM5PR03MB3290.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ub2iFZO4KO9MmaI9Xen7JbWqz6UQBrjz4N73+YA0b1WCjD6vhmCwBZjSYaGfe+FboyRPyB56eFhKluKrOWxYA0UvuNZ/aUXxkCAqrysPcAlVagoGiq3KxPSPjPq3ktgr9BHfGaU3jbJng6zOFtQVtHbxR87uYrBWDkmsiPFUjSEepJYzM45Td+yuJj8AliYtuvWnXeWaY68X09m8zrGrjwNRQ008dqjXe8ACSmtWScyOLW1GsbJZx6QT2s3C90/UN27qjzK2ZxnDP6JKM4X/rvfO9PoNLimomhwoXCFjYQ5OttcxhZNDLuR8dqMy2uIT5TXZU3NQNq21Dh5a7bfbFM2KaZS7P3OCYZuu+ds1ciOk5WXRBkc9l6o92pV49kTrtfMw3wUN3cz6I++FzGOeBtJ2X8uvAwYbSE/3omMPoFoxZ4mJp4iTnwlYUV0lJOriVB1AJ0QkqFYkhLc2NKFfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(186003)(2906002)(6916009)(53546011)(16526019)(8676002)(6486002)(5660300002)(9686003)(7416002)(4326008)(83380400001)(26005)(478600001)(85182001)(54906003)(966005)(86362001)(316002)(66476007)(66556008)(6666004)(1076003)(6496006)(956004)(8936002)(33716001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bGZVSkhsOVVwRlJpb1NnMnlWWkFONXRBb3EzdFF3bUlSLzEwaUN4dnFhbnNZ?=
 =?utf-8?B?c2NJZ2RxTFp5S3JyVjFuMUJtQVZKeG04ME0wSDVlQzByQzE1RTBYeGR1YXpR?=
 =?utf-8?B?WjY0VjMwbFd1MTlIUkJnaXo4Wlp6MTE5dWtOVjNBZXVMSFpkWkRyaEFZNmVN?=
 =?utf-8?B?WXM2Z0FCdzMxOHdRNU1icXYrN1N3OEM3OEtwRnFtWGFicklVUlRLRk8xN0M5?=
 =?utf-8?B?ZmlWSyszWUxWUDQ1Nk84M3lKNXM1bStnZ0RyNWQvR1Ara3FKYktRMURZRGJ2?=
 =?utf-8?B?SG5qYlpSbDIzVVZpR2VwUkVzaVR3elR2Q1dpQmR6M3dZV0hQekp0Si8rQ2ZN?=
 =?utf-8?B?eUlxM0JOV0NkbG5lVm5lbTVhTEVSdzVzUGQvbHlBbGduSk9GOGYzZkVqeHpq?=
 =?utf-8?B?ZStvZkFVVk0rN0pXQjRLamZxY1l3SGZRSkVBdHBwSEdxQkZ5cnh6d3BEYlZw?=
 =?utf-8?B?NjBYQmhLZUs5ZFdSNXV4d2MwT3pURGJhVWFiWFAwQlFpeHh4b1lGTkxxR1lr?=
 =?utf-8?B?dElaaFdINlRwemt1V0c4dldtd0pHb1lWdm5sc2RvUFJiQzBTeFlNMzA4SW1m?=
 =?utf-8?B?Q01KdWFkZ0ErUXNtbk1sNlBzbDhGaEpvNXh6WFNMU1h5dWtuak0xd0NhbWE1?=
 =?utf-8?B?V2YwVVljbDlhSm40YWIwYk1xMUVuVWo2ZEhTdU93aFpFRW8wZm9hZm94Rmdk?=
 =?utf-8?B?M2l1SDFISExXbzRITXVIa05uQUlCbkgxQldaTndXeis0TkozWWlSM29mU2w3?=
 =?utf-8?B?VzZVUUJLaHo3WFIzNGc4NkJ6dEJ1ZExzTVdoY2pSbTRCVm5IbjhIOFgwVm5P?=
 =?utf-8?B?QzdiQ2lrRGU2T2tBWVBBMjg1ZGhhSU9mQncvZFB3dENzN0hwSk8wakt0cStG?=
 =?utf-8?B?Sy8vZDI5NGhJT1pXUVlvU3J0WHI2MzBxcXIrS01sWGpVUXU1dXZmSkxvOXZl?=
 =?utf-8?B?K0c0a0V5WnhudUtYNnZNNHFacVNrT0JxdVIwK3NTRDVnTnZPVEVaM0pRRTVV?=
 =?utf-8?B?ZTNnVitoY25Fb0lIMXhwU1hGeVNqMnFSRGV2MEF2RHRIekJZWjhmM0VQWnR5?=
 =?utf-8?B?ZDZNbSs1blUydGd2Q3Vxd2lGb0ZOblF3U0RTV1A4cllaaVhaS3g2emlRcWpv?=
 =?utf-8?B?b3N3Smk5NW9nOWRoVzk1dTN0R01uQmRwblZxaCtUV0c3cldteVhjUXJ5RVhF?=
 =?utf-8?B?bDJRWWwvWDFyNGgzdWVQUFh0cWd2OU9rbi93V1I0eUlaNDZ3SFdsMitWSWlr?=
 =?utf-8?B?Qks4eDVqRmRqQWhid2JYTkxaMW54WnJOY2pQcEMxYU1zYU5mQTYzOXkyTVlP?=
 =?utf-8?Q?AasT2jY9vrsiCyy298qAlKLe7Q3cHsP3FZ?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2020 08:46:02.5805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b14778-8f39-4a77-ea0e-08d8ad68810f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KKpDKzTz/HUpL+W57MpZjoxkcEzQ51wQfwxbsPS3DNU5Gn/OjTOlU//GT25N0biENaypwC0+vTTioZzczwr1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3290
X-OriginatorOrg: citrix.com

On Wed, Dec 30, 2020 at 11:30:03AM +0000, Julien Grall wrote:
> Hi Roger,
> 
> On 29/12/2020 09:17, Roger Pau Monné wrote:
> > On Wed, Dec 23, 2020 at 04:32:01PM -0500, Rich Persaud wrote:
> > > ﻿On Dec 17, 2020, at 07:13, Jean-Philippe Ouellet <jpo@vt.edu> wrote:
> > > > ﻿On Wed, Dec 16, 2020 at 2:37 PM Christopher Clark
> > > > <christopher.w.clark@gmail.com> wrote:
> > > > > Hi all,
> > > > > 
> > > > > I have written a page for the OpenXT wiki describing a proposal for
> > > > > initial development towards the VirtIO-Argo transport driver, and the
> > > > > related system components to support it, destined for OpenXT and
> > > > > upstream projects:
> > > > > 
> > > > > https://openxt.atlassian.net/wiki/spaces/~cclark/pages/1696169985/VirtIO-Argo+Development+Phase+1
> > 
> > Thanks for the detailed document, I've taken a look and there's indeed
> > a lot of work to do listed there :). I have some suggestion and
> > questions.
> > 
> > Overall I think it would be easier for VirtIO to take a new transport
> > if it's not tied to a specific hypervisor. The way Argo is implemented
> > right now is using hypercalls, which is a mechanism specific to Xen.
> The concept of hypervisor call is not Xen specific. Any other hypervisor can
> easily implement them. At least this is the case on Arm because we have an
> instruction 'hvc' that acts the same way as a syscall but for the
> hypervisor.
> 
> What we would need to do is reserving a range for Argos. It should be
> possible to do it on Arm thanks to the SMCCC (see [1]).
> 
> I am not sure whether you have something similar on x86.

On x86 Intel has vmcall and AMD vmmcall, but those are only available
to HVM guests.

> > IMO it might be easier to start by having an Argo interface using
> > MSRs, that all hypervisors can implement, and then base the VirtIO
> > implementation on top of that interface.
> My concern is the interface would need to be arch-specific. Would you mind
> to explain what's the problem to implement something based on vmcall?

More of a recommendation than a concern, but I think it would be more
attractive for upstream if we could provide an interface to Argo (or
hypervisor mediated data exchange) that's no too tied into Xen
specifics. Using a defined vmcall/vmmcall interface (and leaving PV out
of the picture?) could be one option.

My suggestion for using MSRs was because I think every x86 hypervisor
must have the logic to trap and handle some of those, and also every
OS has the helpers to read/write MSRs, and those instructions are not
vendor specific.

Roger.

