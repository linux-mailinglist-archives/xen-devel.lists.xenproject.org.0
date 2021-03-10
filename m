Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76E93338CB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 10:34:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95931.181149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJvE1-0004YG-LC; Wed, 10 Mar 2021 09:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95931.181149; Wed, 10 Mar 2021 09:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJvE1-0004Xu-H7; Wed, 10 Mar 2021 09:33:53 +0000
Received: by outflank-mailman (input) for mailman id 95931;
 Wed, 10 Mar 2021 09:33:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfCg=II=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJvDz-0004Xn-FR
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 09:33:51 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9b2f481-325c-4347-b85b-6796d5aa0264;
 Wed, 10 Mar 2021 09:33:50 +0000 (UTC)
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
X-Inumbo-ID: d9b2f481-325c-4347-b85b-6796d5aa0264
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615368830;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vUE9Zwwbm825ZnVQZ/NF2c62gs4Cjq8UGLO+t/md7EA=;
  b=T/jXuDLdOOAFEUt81uDpIQf1wIVObDzrLrno4ox2E7GzZyy5gByTe7Nu
   xDiO0CzpWTn2sviAty7mUKK2/6iDdxtGji6+Ib+MZ1Nm8Xgbr+/5a0bw3
   e7PUcsGTcLPseMSsgnLAiHl3Bz5zmgBFKzO/7+K+AI9x2eQgyITKyTcJS
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1R+wBfQouc/GyzeMVpI50Rd7lJ/u1+pEVibCeJoVQoFE8CCP5Xt4s7/9GUVFIXcvtNy9UKeYwa
 rwuVROwQ/Fk4hLVzM36yotT9FVKzdD8z9KEtF51nYNEo5VI1gj1DvMD23cPEEVt0oG5jbiEZ8W
 m71jxb4FIyqUM5sCEWjfZQNRlUHOK3jhRwvtgDo9V/H6+6aga3TWc6HFv3RpLCJwup6O3woB5G
 uNreCh+38ErlOP5uPTp/Ii4J0mP8Wh8NS9jL9zUGfVpiJ/JgrLkIngIkthy73MfWWEgdl84nEa
 7gk=
X-SBRS: 5.2
X-MesageID: 38933019
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,237,1610427600"; 
   d="scan'208";a="38933019"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWS6NvuUmh/LZVubQs7IAWi5jlvol/+g7ICPn9V2uHQVIPwQ0+WULdVeg1delJXbDNx/3UR98lSN60vWs5kHxwrOWix3O2TE8JuGg4Sk7IfepSglrZ37LhuS3twXBUDJoA8q2cHno6+bQ7rgTJZGvzJGInYbc+tKDNGnJ33k87XkkF2o/oiuOj++PTnGA8XEzBmcRHrmmGtbEkAjZdEgB6eUKmjKYj0gvIT1WUeTdzyUxu8mfUz5hgaNZwzURdLzMzYlXW30mqvx4iZRXmn6W2ffsD/zFqg7GlfYdh4E1zeUuthUdiR3iFWudFpmIHcyXk6d22zefuGKC8Yy8t+C0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkYzQmaI74fUYW98c90Ctctx2PFPCJPbIhEfdEsz2ig=;
 b=eZKnp8ss3zSZU6q2s5VngqcRNjk5TTyG47dTNZ4VIWjnnwXcbjqCdtEvdIe2+8xLLPvC2E5c54C5EWe5zH5QlcPz8W/oCqAB4/2e8EINHTOgC91dy/TB1sSpy4NtXgvMS9N9bQYxQXdOE1BzN6uyoU7Ilew2RGuDJIcHTd1+NgiWm4rs+18JiZlKxiIHFL9/r6NJD0BPDT45PcpOTnbLohXLaietGZeru27TG0laWwRgZjaGn8PoQ6LII+ztR/Qg0XVmCjYh2wkEsUtYdjgs1cmHjNfaxU4uNQfZtmr9n4LsoDS8SNtPDNzKcM46OnnKRvXqLetdpayYbr3nnyDlBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkYzQmaI74fUYW98c90Ctctx2PFPCJPbIhEfdEsz2ig=;
 b=G0pHbQaA9PDpyTPf4XSNZ62B7ZwRhPzV4pD8ASW/bKOMLYDuvYL522BtQW98F+za6Yot/4sJakbPveXOLmUkrNWgz1nzESZc6QLJB9iNxHQPhnO5jHaMXp/ojWfmifs/DhcEY7Dhmm+Av8c716yAWz0axvmdAFa9NSi+qUwd4/w=
Date: Wed, 10 Mar 2021 10:33:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3 for-4.15] x86/msr: introduce an option for compatible
 MSR behavior selection
Message-ID: <YEiSXWDSo4WVuwas@Air-de-Roger>
References: <20210309105634.7200-1-roger.pau@citrix.com>
 <dbf31ab3-bae4-0b86-9bb6-bdd4e66e155b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbf31ab3-bae4-0b86-9bb6-bdd4e66e155b@citrix.com>
X-ClientProxiedBy: LO4P123CA0329.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa3d6e46-b1ed-476a-5adb-08d8e3a78d0b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4683:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4683DCCF5D0FB4571333BA198F919@DM6PR03MB4683.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eG90uArd5XY4rNTE7ZAMh8N1PLYYuLnb8WR0cgO1IiLkVk4roTqtwoGRT13Wj82XgJPVJNmdIlAqJpg5kX4c88hUaTYlRvXcTg2enxQr8fCYnvh46A005wp1E+I4egK3VH06H8zbqIRfmJ5qi0CQQi216t7l7tqTabO1EsTHUzvzWYxOX/8Y4WEQcwVL6okHKJIIUKfeSB9sWJ9CF0NMzxlppBD1+PYTlC4lZwRDNf/Y1EikbsAmv0cYeAOLBQ6efhbo1HfOQn7iUcwVBY7J5lruG1OjNmaTSP+sQNvqqIgmBKNbCPFLHwCpJrYsmIfj0nFZcUhQMbNaF8QskDQC1ERk9lParpbaJs1h1fQvwVcmn8ETgGtiqes5NqgECSst8nxiZdCAz2/SSHkZsn1+ZLtidGOBLca8XmVZuJ5vtfQY7E7BAzaVMY/SjhunHhEeNZrEJse35mITxMeWJTUMWt7G4gcvqaVl+njMibz7YU4++UlLrAAV9cJWwQZ3GV7QOGOMX79fnSBNDnqwkCTE0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(136003)(39850400004)(396003)(346002)(376002)(16526019)(186003)(6496006)(7416002)(6636002)(2906002)(66946007)(83380400001)(33716001)(5660300002)(9686003)(53546011)(66556008)(26005)(66476007)(478600001)(4326008)(8676002)(316002)(6666004)(85182001)(54906003)(6486002)(86362001)(956004)(8936002)(6862004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZXZZcVkwUlVNekJxMnY5bjJWdWhEREVUUnI5SUo4alZFeXUyNVFDTmFsWUgz?=
 =?utf-8?B?ZjUxMCtXb0hYcC9yS2FzS29aRTArQXRxMzdWLzBIUlN1V2hWdUNET2U1aHU3?=
 =?utf-8?B?dDlwZzVhSjZocTBqbFV1R2tia3BZQ0psNTlYUm5qZCtqNkV3Mk8xaWpJTytC?=
 =?utf-8?B?ejJiNGtRK1QvK2U3a29qbUNMR0cvaFUxbzNLS2txWnlOeGc2WDVNNUl2Zjcy?=
 =?utf-8?B?ZE1mZWN5ZE92c0s3QkhiVWNJdEQ0S2I4ckJDTlczNEpQdzN2R2pIU1BPUmZm?=
 =?utf-8?B?K0EzdzFJNUdWSW9FNm83dlYwNmhNMHh3OUZ3Mkdlc0IzYzVZVU52ZThxZkNP?=
 =?utf-8?B?REgyK2JrSjIzQ2pCaTkzRXUvUS9FamZsZTU1LytmQmdpZ1RSNTdxRm16Z2R1?=
 =?utf-8?B?ZEliL2IvdzlIV3lCUGpZK0ZjcE5kSzNYWGRKbkNUVHBEYVpXUFRHZ2ZxRG1G?=
 =?utf-8?B?SHYvWkZqVURvWEV2d3J5bDZNS3hSa1poWEkrN3Jkbjh6TEw2V2dNcXk0aGhu?=
 =?utf-8?B?dVNFTExUR002b1UzR0NjU2JXejluZTdLbzZvQnA1QXVTNUVIakNjZ1NPU1RC?=
 =?utf-8?B?ZmdlYjRIWWZBamYwTUlsWDNYYm9UUTJXN3FHbGhpTnd4cWY4UHVFWnQyU2E3?=
 =?utf-8?B?djliMjVnQU5nbUZITjN6VlBKSkQyaDVpR2ZqQkxHTVRES29iOC9ocklqcjlN?=
 =?utf-8?B?WC9vdDN3dUpwRlFTMU1wZ0F6NnpBU2owQWFCV0hTZTgrRjJVNkRSb2I5OTdQ?=
 =?utf-8?B?N29RbDMwWHJnTGl0MTkrTng2RnFUTlJoSXNpeUJHa09Kb29kanJoS2RnY24x?=
 =?utf-8?B?bEg3aHBVdTBydXAwZHFmSVdld05WeVNPcmhGU3ROck1xOVFDdWtpc1l3eU1Y?=
 =?utf-8?B?UTdHdlNSaXNldFpoQTNLTlBiYUc4UnM1eWNNRXVEK3IyM0dtTVYrcGQyQjFD?=
 =?utf-8?B?T1M1SjNZRktROE91VjlFLzNGNnR2MFFGWW15dGx2KzR5WEVxK01yeVpSTklq?=
 =?utf-8?B?RGY1RFRDdldTZlZrVHpSdS9IdWU3SjRIQVkrYTRNRG5pYW5XZjBtMXhXVDFG?=
 =?utf-8?B?UURmL1RPdURxeENCRHZoNGZ3K1VvWVZsaXRvb0VscXZCL0FsL0dTYXE2ZWFE?=
 =?utf-8?B?VG1jRys4NEdxUG9XZUJuOTRQTFcyNGJ6Y2RzMDMwc3VxTmJMU0l4cnpNMitZ?=
 =?utf-8?B?c212SHFTdzdZbEpWSnd5b2VBblp4a3huTTFLVnFtcUliQUhEMjUwU2F4Z1Vo?=
 =?utf-8?B?bENJZlhUQjY1YmFOQ05yNkRqOUZwdnRadjkybDExNTJ5RTBVR3VpbDh1MUVi?=
 =?utf-8?B?YWhFbnpIRjNCbjhjYTZrbHZrZ1dCZ01FNDRZbVpxWmZXVC9LUXJKZDRwTHFG?=
 =?utf-8?B?MU9kZWxBTjZGU29ObkxmNng5Y1lmT1FxSENZRHoxUmtKQTFLT2NxSmxuOWN1?=
 =?utf-8?B?RmFoY0phWnlBMFZ1eXloYkZBNWFLaGNZRGZKbHhHWjJnV0kyYktuTXJoVDRR?=
 =?utf-8?B?VW9vUk15dFBNazMrYjBNb3dZZFBjY3NmYzBEckZrQUJZU2ppcjk0dm5PT0hr?=
 =?utf-8?B?Q0NvbUJ4MVZobk13dmVEUEU2RW1EcktsUTVvTWRRY3U1VllvYUxhOVBmUVdZ?=
 =?utf-8?B?NEYwWDR0MWI0SmdzOHd5V0U2V1FZc2wrdmpCTUh3QWM3VXFnTzBWaHA1MnJk?=
 =?utf-8?B?cEFiVUt2UmRRbVB4cXRIQ2VvNE00NEhQMGY2OTduSzlIbCtLRnpJZHM1UTZy?=
 =?utf-8?B?QkR6bG9qNTdxVVBUa3JuRmIrS05GbTB0SGJQTU9sZ2RubjJaUW9EQ3AvUVNE?=
 =?utf-8?B?SmtKb1BYakFJdnFNUERPUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3d6e46-b1ed-476a-5adb-08d8e3a78d0b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 09:33:24.0550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10A6TqebKqXD85pF1i3qA+HAEZ48YPYofTk+tNPjpqVQSI3aNvQjWf+QBdcvsz+Wc1KXuuGT+1dOCB1g7QlOUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4683
X-OriginatorOrg: citrix.com

On Tue, Mar 09, 2021 at 07:13:26PM +0000, Andrew Cooper wrote:
> On 09/03/2021 10:56, Roger Pau Monne wrote:
> > Introduce an option to allow selecting a behavior similar to the pre
> > Xen 4.15 one for accesses to MSRs not explicitly handled. Since commit
> > 84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
> > handled by Xen result in the injection of a #GP to the guest. This
> > is a behavior change since previously a #GP was only injected if
> > accessing the MSR on the real hardware would also trigger a #GP, or if
> > the attempted to be set bits wouldn't match the hardware values (for
> > PV).
> >
> > This seems to be problematic for some guests, so introduce an option
> > to fallback to this kind of legacy behavior without leaking the
> > underlying MSR values to the guest.
> >
> > When the option is set, for both PV and HVM don't inject a #GP to the
> > guest on MSR read if reading the underlying MSR doesn't result in a
> > #GP, do the same for writes and simply discard the value to be written
> > on that case.
> >
> > Note that for guests restored or migrated from previous Xen versions
> > the option is enabled by default, in order to keep a compatible
> > MSR behavior. Such compatibility is done at the libxl layer, to avoid
> > higher-level toolstacks from having to know the details about this flag.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thankyou for doing this.  By and large, Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com>, subject to some pandoc syntax fixes below.

Thanks.

> However, I think it is worth saying explicitly that the reasons behind
> the changes in 84e848fd7a162f669 and 322ec7c89f6640e (not leaking
> hardware MSRs, and not breaking #GP-probing) are still legitimate, and
> this influences the change in behaviour between msr_relaxed and 4.14
> (i.e. read-as-zero rather than leaking).

Right, I tried to convey this fact by using "compatible" behavior
instead of "legacy" one, as the behavior provided by msr_relaxed is
not exactly the same as what you would get on 4.14.

I've added the following at the end of the first paragraph:

"The reasons for not leaking hardware MSR values and injecting a
#GP are fully valid, so the solution proposed here should be
considered a temporary workaround until all the required MSRs are
properly handled."

> > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> > index 4737c92bfe..6cf61a5c57 100644
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -740,7 +740,7 @@ Specify the bit width of the DMA heap.
> >  
> >  ### dom0
> >      = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
> > -                cpuid-faulting=<bool> ]
> > +                cpuid-faulting=<bool>, msr-relaxed=<bool> ]
> >  
> >      Applicability: x86
> >  
> > @@ -789,6 +789,21 @@ Controls for how dom0 is constructed on x86 systems.
> >      restore the pre-4.13 behaviour.  If specifying `no-cpuid-faulting` fixes
> >      an issue in dom0, please report a bug.
> >  
> > +*   msr-relaxed: Select whether to use a relaxed behavior for accesses to MSRs
> > +    not explicitly handled by Xen instead of injecting a #GP to dom0.
> > +    Such access mode will force Xen to replicate the behavior from the hardware
> > +    it's currently running on in order to decide whether a #GP is injected to
> > +    dom0 for MSR reads.  Note that dom0 is never allowed to read the value of
> > +    unhandled MSRs, this option only changes whether a #GP might be injected
> > +    or not.  For writes a #GP won't be injected as long as reading the
> > +    underlying MSR doesn't result in a #GP.
> 
> I don't find this overly clear to follow, and it also misses stating the
> default explicitly.  How about:
> 
> ---8<---
> The `msr-relaxed` boolean is an interim option, and defaults to false.
> 
> In Xen 4.15, the default behaviour for unhandled MSRs has been changed,
> to avoid leaking host data into guests, and to avoid breaking guest
> logic which uses \#GP probing to identify the availability of MSRs.
> 
> However, this new stricter behaviour has the possibility to break
> guests, and a more 4.14-like behaviour can be selected by specifying
> `dom0=msr-relaxed`.
> 
> If using this option is necessary to fix an issue, please report a bug.
> ---8<---

OK, this seems to be less verbose that what I previously had, but I'm
fine with it. I assume this should also be changed in xl.cfg then?

> Other pending Sphinx work is drawing together the "how to contact us"
> information, so the various "please report a bug"s through this document
> will turn into links.
> 
> > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > index 23bbb6e8c1..d217c223b0 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -749,6 +749,7 @@ static struct domain *__init create_dom0(const module_t *image,
> >          .max_grant_frames = -1,
> >          .max_maptrack_frames = -1,
> >          .max_vcpus = dom0_max_vcpus(),
> > +        .arch.domain_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
> 
> Can I request
> 
> .arch = {
>     .domain_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
> },
> 
> please, to reduce the patch complexity of further additions inside .arch.

Sure.

> > diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
> > index 629cb2ba40..f9d0e33b94 100644
> > --- a/xen/include/public/arch-x86/xen.h
> > +++ b/xen/include/public/arch-x86/xen.h
> > @@ -304,6 +304,14 @@ struct xen_arch_domainconfig {
> >                                       XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
> >                                       XEN_X86_EMU_VPCI)
> >      uint32_t emulation_flags;
> > +
> > +/*
> > + * Select whether to use a relaxed behavior for accesses to MSRs not explicitly
> > + * handled by Xen instead of injecting a #GP to the guest. Note this option
> > + * doesn't allow the guest to read or write to the underlying MSR.
> > + */
> > +#define XEN_X86_MSR_RELAXED (1u << 0)
> > +    uint32_t domain_flags;
> 
> The domain prefix is somewhat redundant, given the name of the structure
> or the hypercall it is used for.  OTOH, 'flags' on its own probably
> isn't ok.  Thoughts on misc_flags?

I'm fine with it, will change unless Jan objects to the name.

Thanks, Roger.

