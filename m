Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DA9794459
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 22:15:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596847.930915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdyvN-0006ei-5c; Wed, 06 Sep 2023 20:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596847.930915; Wed, 06 Sep 2023 20:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdyvN-0006bT-2j; Wed, 06 Sep 2023 20:14:53 +0000
Received: by outflank-mailman (input) for mailman id 596847;
 Wed, 06 Sep 2023 20:14:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kt7f=EW=nureva.com=anthonychan@srs-se1.protection.inumbo.net>)
 id 1qdyvL-0006bN-RJ
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 20:14:52 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20701.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::701])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 076b9855-4cf2-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 22:14:49 +0200 (CEST)
Received: from DM6PR20MB2779.namprd20.prod.outlook.com (2603:10b6:5:140::30)
 by DS0PR20MB6390.namprd20.prod.outlook.com (2603:10b6:8:122::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 20:14:44 +0000
Received: from DM6PR20MB2779.namprd20.prod.outlook.com
 ([fe80::c3:998a:f69:190e]) by DM6PR20MB2779.namprd20.prod.outlook.com
 ([fe80::c3:998a:f69:190e%7]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 20:14:44 +0000
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
X-Inumbo-ID: 076b9855-4cf2-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyjdXmUgHWeR6Qbb7b/kJ7lLWAXp466m6yN8MBlzRQAiWD8K8zvgPk2WYqb4i/BZf7yMR51FOpDCb5bGXxRXekDRJVm+2monR12iwqgrqYGVbVW3TZd4zHsT+c2AFV+IgE8JFtHXibTbvI9AbiVHBE5hgHUL2AECc6Vm1MPN2d0yIJPlrtEYSR9hV+VGeu+gCGt7f/gP+W7sqPV0vy+qIVzmVdogUHQ+PWF6GEATJQBGXfO/c6t3c808N4mQAmbKWk4HaQIq/cT4hFG2VFSKwnNpEir+PchHAC2Qzy+C9Fx78T00FPRbf7N6SFGSyWJLPaTZEevWO9xjA7sM1GtzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRfLdYhf9fgNRWs2oEF8wB4XzJlc/xKi0AtlWAhoX/E=;
 b=B5bf8fU1WOXtbIRbpoiFqmJ5GRbW7DbBW/Hxs7ndJgswHLJZJo/vQP4RE03LWVkNxHJLji+neMhXlfHHdyDK5g30rKr/t0j1rBG3UYOqj+Ruaa3eCAEmkdmwaK/7HFwXQuZsAa7mLHsv6xDC0FGY3gdh7lDwpMatZ+LzQQkLbpsD3n2u91+Bh+QcViFtkVp33OAeLiaRexABLBySE+sfOMEhJe3nFVSYsVHuWY3lscdlpn6xYfFC2RbgM2KJ8HMhHa/uUyLQ8+FPl40lwL1FLzmesjJfnYJX1I2acN71QSX+5K/scTg2/W7Isa/HB9v6JdGVQ0xKiZI+ATEh1fwXSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nureva.com; dmarc=pass action=none header.from=nureva.com;
 dkim=pass header.d=nureva.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nureva.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRfLdYhf9fgNRWs2oEF8wB4XzJlc/xKi0AtlWAhoX/E=;
 b=M6npHwhs+pY7OycHqbAnUMgER2QHbZmEAbm8oIUICJXR3Lb5qOck3+C2jvQ8Lbg1UwSBG1667BkmipFvo5Lq4Oavd8mqRaQpVZnAWptkQN3ZbF7atfCzcm7uV92CgEZrFyPD8HHgm0X2YR/M/RoJ8Fqx66G7qgzc7kSqtlMa7q8=
From: Anthony Chan <anthonychan@nureva.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "julien@xen.org"
	<julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, Dan Waqar
	<danwaqar@nureva.com>
Subject: RE: [EXT] Re: xen arm64 low power sleep support
Thread-Topic: [EXT] Re: xen arm64 low power sleep support
Thread-Index:
 AdnanCj70Orzia5aQfSER7H0AUNnzgAKb5uAACL7QIAAFccGAAAoRLpQAQalgwAAJhokEA==
Date: Wed, 6 Sep 2023 20:14:43 +0000
Message-ID:
 <DM6PR20MB2779A22E8CA641F0B2BBF038C1EFA@DM6PR20MB2779.namprd20.prod.outlook.com>
References:
 <DM6PR20MB277971712E5415CB231AEB37C1E7A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2308291512271.6458@ubuntu-linux-20-04-desktop>
 <DM6PR20MB27795F4B6C327F7F031BABB0C1E6A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2308301814580.6458@ubuntu-linux-20-04-desktop>
 <DM6PR20MB2779E6DD63DC5CC9A1FE161AC1E5A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2309051848590.6458@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2309051848590.6458@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nureva.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR20MB2779:EE_|DS0PR20MB6390:EE_
x-ms-office365-filtering-correlation-id: e09d8ab4-2eae-485e-b001-08dbaf15e8f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 EiF0phWxCV/yRBPZWp3pFdWmEZrzBNUPpG/Xpg2u6YcQI71XVIC0mLujd2IueOU5RX+wSjcMSzFCK+atpxKUc8gZEBeDWhJJcIDcVuSxOannSH+9YcLMCiwhuhZdw+FtaGr8TfYlnoU51S9fDxxpdHmwOE2bwgHPvYEWHFE+Ei0UsNf4gN4sFa4ykQDw0D0GKTxMOjSJP1Gjk+s/VvqKhSF1724jH4oSAj8arsO/LVD2mtcMRHcfh8VDR4p0OuqNXC+eCywiW5SjtbHeH8z+GMrrI5l+rWFhNJ2gFFOOalTK/kBjsPyIdEVhQPWCFYaTPSBlXI5tAhhOXpvy7J2J3GcNPmbtTvA3br7aMSe6/zyY6DYYFNK0BLZ6GL2TSL3Xw/GY90UK2yVIo5FRkeKQJUf4Ys0opYwGHayrmw4hUcGzesdw8Gp/QzDZpkZcGzyrWblaMY7BbGbb+DTsrFjc86yIhnb3ooEPZheKOu3WY11z8thzT8cV8e8crnE2kXren7d04PgF6nO5jGVIDVm9T5Uc9sL3eIPVajTjL2oQY+GYSqjuWFSvsGvKDR2r+7UvU4cipADIACSkYCqmdLcaApCnHINeiHqyZszUob/5BXvaeuahQk2Zrk5mYIOdH2o0
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR20MB2779.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(376002)(396003)(366004)(346002)(451199024)(1800799009)(186009)(52536014)(41300700001)(8936002)(4326008)(66476007)(54906003)(66556008)(64756008)(316002)(107886003)(8676002)(66946007)(66446008)(76116006)(6916009)(45080400002)(55016003)(122000001)(7696005)(9686003)(6506007)(966005)(478600001)(83380400001)(5660300002)(71200400001)(2906002)(86362001)(33656002)(38100700002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DfQZoGDn5I3LlmeilURdVRTz+0SA73z08+Rb38C0FTxkJR2UdDM7TE1BuslJ?=
 =?us-ascii?Q?29ZkInH9Sz6FeQ9bjUgux2MdvdQWnw61fZZJl/NgnaUtbbWa4+WHnX1v2omG?=
 =?us-ascii?Q?hXzUEpQPwpC1p5Pr62JLjuQWKl7zMqp+sgbLJ5KY5W/Dw4COCPX3b1U5vSMt?=
 =?us-ascii?Q?i+a9zTcm9oeFrD4IvwTbZ/SLee+vju++VQr3d/ezybCFyoxu7LjGRmd9WUwB?=
 =?us-ascii?Q?AbvkRLRS/GzTHV+jfQcpoEoyQ3za92xGufhnmqK7i5i46mFhiqQo18FNn6PC?=
 =?us-ascii?Q?vwekBT8jwjX1Z7KWYEGOuzeevb6uz7vv2jj94UEyhKr0s+uefaH+e/0Zo6n5?=
 =?us-ascii?Q?72mERhUFjpPHKslWmCq2qrszD/PyBx4kiDzWLJjvmnXOd8I007xoDIKzqA0t?=
 =?us-ascii?Q?LaoihzMEdVEhB/tRsMFeQCGB6DBvcCW8wkD5klHGO8ZkfCDaRGRB7IAKZxM3?=
 =?us-ascii?Q?6buWPa0xUZbUxgq3GQzIspcKh1FvxWAGAd8A5K/hl6YHdpiyw2dgsok/zGRX?=
 =?us-ascii?Q?JhDg0kUwMZMCq5gU2dMd1dT33guce3hISpt1PBGYOcH6YWtuYfK8H6SF329H?=
 =?us-ascii?Q?6vcsi7siCRTuJMBCMrUkBAWO0pJk9++3kF9NR7oci0CZvIrWzZeuMAwhfmoC?=
 =?us-ascii?Q?IfTZSssinR2hqP9BSJhWOHFFRHR/NLHvNgC4Q5xwHBpgf83Unq9PZrOQKJJa?=
 =?us-ascii?Q?BdjQo/fY/cfk8K5swn5ijPDhWzJKfp7UFjfOKAYz+nMrzGPUmhD06Qt/Y9r3?=
 =?us-ascii?Q?tyoFXV17zWGrKojjq4VQiB9rXZdAMt30nBbqmjlfRV6jPS/NcRNm+yXqlUhr?=
 =?us-ascii?Q?vGYIROK5YfSHwp/kZ+yO5PlIEqNKVFfKOoIXLKvEWtRTy2jxkUsHGdN+5WC5?=
 =?us-ascii?Q?R5mKvfxKqEsyMIlepOmYAzyqadGcWObA84oD3rG+LLtieBGcVMgvbyft1Bns?=
 =?us-ascii?Q?rWl6Tdx3ij6mzlC/QxTArbpcn0fVbvywCUzXi4Hpr3Ic8wnkj5/yGy5XRJ3P?=
 =?us-ascii?Q?oTmOR0LJbgPMt4fFmsQNLYiZ9x2du25rHpA/gHXC9YSe27O7JBm/N3zWZVoa?=
 =?us-ascii?Q?Ck0/bREU0Ca1rZhSya2RB3vIAZzcvqmlaEenPsFPQvwVsgXzYbeZAblplu7n?=
 =?us-ascii?Q?etGo8v2RgKtuRroNX3rFxRHdNSjrPeYIShKLzJZf81oYQZyDGkLDYspQONpe?=
 =?us-ascii?Q?2yO6QjQoCWXM5Tv28EOLO/6/Pmlh7LkqlRavqsVPPtAAWcAhMdv53vl9Uo5j?=
 =?us-ascii?Q?7o0mNtes8BzKgdcekeR6jEkrDTP5Ah2LSvr2uMAHHxpsJMEZn3UgyyYe1PyX?=
 =?us-ascii?Q?JQXsO4mdKvA9SHcDSWmkIu6Adlr/3G9y8K00t2k/93kvYrItXfFyB4pn9qBN?=
 =?us-ascii?Q?HaovLjlp/nGU77udn5JNWwWckAgGqwZF/YHX9Mj1oZXECg4XVVlXuYkdCfIk?=
 =?us-ascii?Q?IKRhiFKmzsrKkyjNvVZ0ok2yeEvztuttoeiZ/BOHXWO8frHRXMAfOUFLUcDu?=
 =?us-ascii?Q?M/KwredmbqJWdK63cew1hkywjODTkdL0EMZUQC6R3oW2U4ehoTJPJjmW5gkQ?=
 =?us-ascii?Q?QYmzGsuEZUAqgeumSFMnaKLXnqO4tnwSDVCXroiSgOyA/YQtNr5FA08EscD4?=
 =?us-ascii?Q?RiaZsSi/0Vd0JfUp/OaDO2H1gEAnrQWOm5P++3aBuAz9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nureva.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR20MB2779.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09d8ab4-2eae-485e-b001-08dbaf15e8f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2023 20:14:44.0070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5aeb77fa-643b-473e-aee0-cb54a11ccba3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1C/XXeEgS/oejcnu3eD9EHzcE+ADlGHoHMu7hBiItuuq5XBOPq10g6VsI+vnqtgqUcIft8sUtW9lUX5fqbj09A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR20MB6390

On Tue, 05 Sep 2023, Stefano Stabellini wrote:
> On Thu, 31 Aug 2023, Anthony Chan wrote:
> > On Thu, 30 Aug 2023, Stefano Stabellini wrote:
> > > On Wed, 30 Aug 2023, Anthony Chan wrote:
> > > > On Tue, 29 Aug 2023, Stefano Stabellini wrote:
> > > > > On Tue, 29 Aug 2023, Anthony Chan wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > My name is Tony and I've been researching/developing using
> > > > > > Xen for potential upcoming uses in our embedded systems.  I
> > > > > > started with Xen using Xilinx tools about a year ago and
> > > > > > still have lots to learn about what it can to do in the
> > > > > > embedded space.  So far, I've managed to integrate Xen and
> > > > > > Linux into an existing product that exclusively runs
> > > > > > bare-metal code on a ZynqMP SoC and migrate some of the
> > > > > > functionality into custom Linux driver/userspace.
> > > > > >
> > > > > > I'm now looking at low power support, for now at least
> > > > > > between Xen
> > > > > > (4.16) and Linux (5.15) dom0.  I've tried a few different
> > > > > > Linux kernel configs around power management and each time I
> > > > > > try to suspend from linux dom0 (via sysfs or systemctl), Xen
> > > > > > will watchdog on dom0 guest.
> > > > > > AFAIK, Xen should trap on a 'WFI' from guests, but from what
> > > > > > I can tell debugging through the linux suspend process is
> > > > > > it's spinning in a 'suspend- to-idle' loop before it can get
> > > > > > to issuing a 'WFI' or using PSCI interface to notify Xen.
> > > > > > I'm beginning to suspect that 'low power' support for embedded
> > > > > > arm64 just isn't quite there yet, or am I missing something
> > > > > > in the configs?
> > > > > >
> > > > > > I realize this could very well be a Linux 'issue' but
> > > > > > checking here first.  I know Xen presents a flattened device
> > > > > > tree to Linux without CPU idle-state nodes and maybe this is
> > > > > > causing the linux guest to only do the suspend- to-idle
> > > > > > mode?  I should mention that I'm booting up using dom0less
> > > > > > feature if that matters.
> > > > >
> > > > >
> > > > > Hi Anthony,
> > > > >
> > > > > Assuming you are using the default Xen command line parameters
> > > > > for Xilinx boards: sched=3Dnull vwfi=3Dnative, then if the guest
> > > > > uses WFI, the CPU will execute WFI directly and go into low
> > > > > power mode.
> > > > Yes, using these command line params.
> > > >
> > > > > Given the issue you are describing, I am suspecting the guest
> > > > > is not issuing
> > > > > WFI: that is simple and known to work. Instead, I suspect that
> > > > > Linux might be trying to use PSCI_suspend in a way that is not
> > > > > supported or well- implemented by Xen.
> > > > >
> > > > > Can you check? You can add a printk in Linux
> > > > > drivers/firmware/psci/psci.c:__psci_cpu_suspend or in Xen
> > > > > xen/arch/arm/vpsci.c:do_psci_0_2_cpu_suspend
> > > > Instrumented both places it doesn't appear to reach there.  In
> > > > kernel/power/suspend.c, there's a call to s2idle_loop that it's
> > > > currently 'stuck' in and I think it doesn't get to the psci suspend=
 your
> > > > referring till afterwards, when suspend_ops->enter is called.
> > > > Unfortunately, without any idle-states nodes in the FDT, the
> > > > only suspend state Linux is defaults to is 'suspend to idle'.
> > >
> > > The fact that Linux uses "suspend to idle" is not a problem
> > > because as I mentioned WFI or PSCI_suspent are not different on
> > > Xen. That part is OK.
> > What if using "suspend to idle" is preventing a WFI/PSCI_suspend?
> > Which is what I believe I'm currently seeing in my setup.  In
> > kernel/power/suspend.c, suspend_devices_and_enter(), it gets into
> > the this s2idle_loop and upon resuming from idle, it jumps past the
> > point where I believe a WFI/PSCI_suspend can happen.
> > if (state =3D=3D PM_SUSPEND_TO_IDLE) {
> >                 s2idle_loop();
> >                 goto Platform_wake;
> > }
>
> If that is the case, then it looks like a Linux bug. Maybe something
> along these lines?
>
> https://can01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore
> .k%2F&data=3D05%7C01%7Canthonychan%40nureva.com%7Ccf5e956c6a4d42b1460a08
> dbaf13e021%7C5aeb77fa643b473eaee0cb54a11ccba3%7C1%7C0%7C63829627212319
> 7144%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT
> iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DlDfILPgJQQQPJOL44%2BcU
> %2BN2RFOs8L6F4AE11kvOhOQE%3D&reserved=3D0
> ernel.org%2Flinux-arm-
> kernel%2F4665489.GXAFRqVoOG%40kreacher%2FT%2F%23m6edda92d0b5
> dc09f8e05e7d6db3807501b7249f4&data=3D05%7C01%7Canthonychan%40n
> ureva.com%7C144641906bef48b9180f08dbae7bc1d8%7C5aeb77fa643b47
> 3eaee0cb54a11ccba3%7C1%7C0%7C638295618800415028%7CUnknown
> %7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D%2Fv%2FHpI1ix3yhDJ
> 75oejWzDfUqB8SqOQzkU3clJzMOtw%3D&reserved=3D0

Thanks, I've tried patches that stemmed from that discussion but unfortunat=
ely,
doesn't resolve the issue.  In fact, the s2idle_loop branch might not be th=
e problem at all.  I experimented with Xen to allow the 'idle-states' into =
the FDT and prevented xen_guest_init on Linux from disabling the 'cpuidle' =
driver (arch/arm/xen/enlighten.c).  When I trigger a suspend, I can see now=
 another thread (believe it's the idle thread) call into drivers/firmware/p=
sci/psci.c:__psci_cpu_suspend and then the Xen counterpart at
xen/arch/arm/vpsci.c:do_psci_0_2_cpu_suspend.  The normal 'suspend' thread =
still goes
into the s2idle_loop.  Eventually, Xen still watchdogs on the dom0 VM.

sonatalinux:/home/petalinux# systemctl suspend
[ 4139.601780] PM: suspend entry (s2idle)
[ 4139.624705] Filesystems sync: 0.022 seconds
[ 4139.624779] Preparing system for sleep (s2idle)
[ 4139.634667] Freezing user space processes ... (elapsed 0.001 seconds) do=
ne.
[ 4139.637531] OOM killer disabled.
[ 4139.640797] Freezing remaining freezable tasks ... (elapsed 0.015 second=
s) done.
[ 4139.657880] Suspending system (s2idle)
[ 4139.668417] macb ff0e0000.ethernet: gem-ptp-timer ptp clock unregistered=
.
[ 4139.678642] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.15.0-xilinx-v202=
2.1 #1
[ 4139.678642] Hardware name: xlnx,zynqmp (DT)
[ 4139.678642] Call trace:
[ 4139.678642]  dump_backtrace+0x0/0x1a8
[ 4139.678642]  show_stack+0x18/0x30
[ 4139.678642]  dump_stack_lvl+0x7c/0xa0
[ 4139.678642]  dump_stack+0x18/0x34
[ 4139.678642]  psci_0_2_cpu_suspend+0x28/0x4c
[ 4139.678642]  psci_suspend_finisher+0x2c/0x38
[ 4139.678642]  cpu_suspend+0x4c/0xb4
[ 4139.678642]  psci_cpu_suspend_enter+0x5c/0x60
[ 4139.678642]  psci_enter_idle_state+0x60/0x74
[ 4139.678642]  cpuidle_enter_s2idle+0x78/0xec
[ 4139.678642]  do_idle+0x1f4/0x258
[ 4139.678642]  cpu_startup_entry+0x24/0x3c
[ 4139.678642]  rest_init+0xdc/0xec
[ 4139.678642]  arch_call_rest_init+0x10/0x1c
[ 4139.678642]  start_kernel+0x604/0x644
[ 4139.678642]  __primary_switched+0xa4/0xac
[ 4139.678642] __psci_cpu_suspend
(XEN) do_psci_0_2_cpu_suspend
(XEN) Watchdog timer fired for domain 0
(XEN) Hardware Dom0 shutdown: watchdog rebooting machine


CONFIDENTIALITY NOTICE: This e-mail, including any attachments, may contain=
 information that is confidential and privileged. Any unauthorized disclosu=
re, reproduction or use of this e-mail is prohibited. If you are not the in=
tended recipient, please notify the sender by reply e-mail or telephone and=
 permanently delete this e-mail and any reproductions immediately.

