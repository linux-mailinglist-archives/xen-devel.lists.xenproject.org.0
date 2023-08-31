Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8666878F426
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 22:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594117.927327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qboO5-00072u-N9; Thu, 31 Aug 2023 20:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594117.927327; Thu, 31 Aug 2023 20:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qboO5-000711-K5; Thu, 31 Aug 2023 20:35:33 +0000
Received: by outflank-mailman (input) for mailman id 594117;
 Thu, 31 Aug 2023 20:35:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8b1Y=EQ=nureva.com=anthonychan@srs-se1.protection.inumbo.net>)
 id 1qboO4-00070v-01
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 20:35:32 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20700.outbound.protection.outlook.com
 [2a01:111:f400:7eae::700])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec425b15-483d-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 22:35:30 +0200 (CEST)
Received: from DM6PR20MB2779.namprd20.prod.outlook.com (2603:10b6:5:140::30)
 by DM4PR20MB5040.namprd20.prod.outlook.com (2603:10b6:8:89::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 20:35:25 +0000
Received: from DM6PR20MB2779.namprd20.prod.outlook.com
 ([fe80::c3:998a:f69:190e]) by DM6PR20MB2779.namprd20.prod.outlook.com
 ([fe80::c3:998a:f69:190e%7]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 20:35:25 +0000
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
X-Inumbo-ID: ec425b15-483d-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0IVlGennfm7UEU4K4tQsDySI3YFq7GkLcBIFhJwZiV6GjmIBef6uCShAIvgNVjWjb2xMTsmAz1RWcJVf1BQWue8mqgOWET0JPpyBF6f3+LnZ3pFHGeJVehgKb8CKlyrloas0WaJqcE/Y6V4DlNMPg4qUG6oIRUJ2WWmw24QMT0CdyIf5bSKKwYDkEMbk6d1QuppvDRizn2inzMLUmMbUBDLo2YwlCbMJEO0uiAN/m5yeO8Cqu3D6SRcMZ9RTpjXS4gJVvRSsPdowcj5FpfoM11Tux4X6ErBJBzGMQlA+NIIxrcnsjdUJYTtXn1VSh0PJYZQ1QM8ldgmPiGzYAaTdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHJfInpEZL0bq02vH/gppcRPaMh9pJFqiaLPiAFdobA=;
 b=aO2LlbU9y8ZnWbNy4qE83wqSyg0JK7QuYgZuqUYIf/gGI0tOA831UTK9SnyZRDgLHWwZ1aA3ScrBFFVjYSsrLzRRElza1bcT5rZuSO/tnisJyMJxU2YtiKDJstjX4ku+1lziPg4/QYZLhqTeNJZneyklA7mF4Y8qZ9Fj4zEUKbp19BU2Oh3N1KcA66Owc+KPfdlBZRDaWVVCRF6Imw589MeziiUqoFgfIWfx/sr2qPkAkqRx3A/1JX7qdFANOv0Nt94BpTs0jaAJWDFZqrzEB60x+MnD0DjUVzzPqTgbBf70SKdJDlp+/n9e19B8XB21838tYue6O42h/lNYQJBOVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nureva.com; dmarc=pass action=none header.from=nureva.com;
 dkim=pass header.d=nureva.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nureva.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHJfInpEZL0bq02vH/gppcRPaMh9pJFqiaLPiAFdobA=;
 b=prD5BK5+sC1C8UxXGEZEsebgeijYIOxHg0CZXZE2jHsO0ykPL6dXhunw7ZVDupQl9tJapWkqY/CWBxsa/5k7Oq1zmQrI23vHk53Sxm3hVubkI/heu+O4nEfE880e+JdRIoTCMPirfE5gImIrImNNsn8MFVtGjlBnbmYzU2UwmwQ=
From: Anthony Chan <anthonychan@nureva.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "julien@xen.org"
	<julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, Dan Waqar
	<danwaqar@nureva.com>
Subject: RE: [EXT] Re: xen arm64 low power sleep support
Thread-Topic: [EXT] Re: xen arm64 low power sleep support
Thread-Index: AdnanCj70Orzia5aQfSER7H0AUNnzgAKb5uAACL7QIAAFccGAAAoRLpQ
Date: Thu, 31 Aug 2023 20:35:24 +0000
Message-ID:
 <DM6PR20MB2779E6DD63DC5CC9A1FE161AC1E5A@DM6PR20MB2779.namprd20.prod.outlook.com>
References:
 <DM6PR20MB277971712E5415CB231AEB37C1E7A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2308291512271.6458@ubuntu-linux-20-04-desktop>
 <DM6PR20MB27795F4B6C327F7F031BABB0C1E6A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2308301814580.6458@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2308301814580.6458@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nureva.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR20MB2779:EE_|DM4PR20MB5040:EE_
x-ms-office365-filtering-correlation-id: e96a2c45-ae1c-45b5-2c18-08dbaa61ce28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hKbt1dzYlmz4CHmwDpwXyozOApJ1WeDW9KTGPelnO3wGcxCvGDyCM3+Xn6vgEJJ5j0mDHxmOdL4cRuIvPJxte2mug3hf/NxwD7P55DQ5srCuVfZvowNc0Jd5gI8gFI7iMStu7xd381J35xedR283hQ8jamgDFbKFRMNcvMY23v0NLpv5M1Rh9+gWJjsALSvjDA5o9ONmg74z1cQf2mNtxQdXtxyM0rKkVXLjyFZpuftfEZKcj0DN2z09tulek40Xkbfd14PZC7ByHFBRF5EXUossn0MLXrLmtfIUaslb+iHUl4wfXKONICINx2InVAczNH0fx9KxJl98N2wvuVxE/RTVRBF5IQIrrOEvCwXV4CoRNmSffKzgtbzM8+wdyOQAD8jQ9riDZXgpDbZFssmV32qRJx0Cc09r7uBCpECOPR+S6sQmVQuH93UYx9UUTlZklBCiJk9Z7UnH9/Mr3K3ab/uH9SYKB/m+QEpsnn9E7i7LHU+hbjaVQa2A0+UcYEQGpNunJL1uvJdsVX/lvay7LT1/dSv2lWjVlFjxR5WqPTNmay+HHNUZKvQ+xrak3frHq9bWfHKVLv6tY2DI8ZUez7tZ2/G1RQHDgP/hdV98lyehe7yfjotJC4bV80fFVfdP
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR20MB2779.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(396003)(376002)(366004)(346002)(1800799009)(451199024)(186009)(8936002)(6506007)(7696005)(9686003)(71200400001)(4326008)(38100700002)(33656002)(86362001)(38070700005)(2906002)(76116006)(107886003)(122000001)(55016003)(52536014)(8676002)(54906003)(478600001)(83380400001)(41300700001)(64756008)(5660300002)(66556008)(6916009)(66946007)(66446008)(66476007)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+vVA1h+9pxxywutG+3EFz8Q+2KKUyB7CsxrKNRKYIfPEx3R6vJDxDUDHxOqf?=
 =?us-ascii?Q?lSVBYmaeGjHacGYWgAe2lM98sCb+6FjkJSZhPP++qX0fysgHWhvGDGe9Ufzw?=
 =?us-ascii?Q?mmjIU+YwufvGeZ+2OO2D+O8u/bonfDD4HOQDwPGQvU8Li9FbL/jf2ajPs9sa?=
 =?us-ascii?Q?bXMITa1QoAaMGwE4SSR44srFZAlFqdAXnXwMZcWnKKwSCJwvKVfDr9DFc5bN?=
 =?us-ascii?Q?vyRTb5sbvO4A/MB3xU5w37WVWHqLCGyQJTSnPKitBH8TmfLoQNrWJLHPUjVO?=
 =?us-ascii?Q?ZMn2aJdsGQs4p9GxKbPKcxcNG4nPceEj6ug3Tg3CIeSL++EnwEfBucxy5cTt?=
 =?us-ascii?Q?AXnCO6phkX7Mbjb+oM4Iau+w32NNJHZeF+M3fyTAb2IW+bMwktAAUoaFJ5IP?=
 =?us-ascii?Q?N5FESCNoBnxHLPHiw+Rrm7nPnpcFlZSPGovLHqr2SbSlm/2Hvm3swQXIhg8D?=
 =?us-ascii?Q?PTk2c5o9rSyK29t0ymEgYUYvWtNJGTz4xqEalUsyNmdVoTrobWSr30UUklvw?=
 =?us-ascii?Q?jpMnBtdlS/BPOzx2cq5R/he5TxZq27D3cTby9zJ5B5x0CCCJbQgeSCCz3gmf?=
 =?us-ascii?Q?iu3+8Eqy5w3gt2RnQ6TRL7yypdbTT7mQbeEFkLM/BkkA7sFDj79DpbCPt1JJ?=
 =?us-ascii?Q?vl1FaL7eF6kVPo3KYxUuyZD9S66lzcSVLVE2Qn5fyrInrT4wFERR79EHYxAN?=
 =?us-ascii?Q?pj/aayHtuCxJ/xYTfPpzTydBC4lgPX5SWhC/7WxCIfn0mIuk+UoK3TIpvgLo?=
 =?us-ascii?Q?GQq1/xS5GBdut69Sm8qFhsZY4h5FqLjDC/pVJPF6jakNNzhZkrSMNnhR3eTS?=
 =?us-ascii?Q?0fzLauCR2v2itLy2/vQkhvLylEhxAAm7Ijl1jWAaanz8VZlnctiPe8d49nk0?=
 =?us-ascii?Q?BqLhIXDqp6aLoU9lUkkR09onP1l1licNqrspEuefsHweAlKOpGNyxs+UylyV?=
 =?us-ascii?Q?3euwrcfT6tEIZ8oQEPeMi3zOYmvHYBCu9AY0m9Za7XDxrEPE5px21ni6sP36?=
 =?us-ascii?Q?vUoLM/zaFKRe5rnFMf+dvZI2aNZBVmQIytVv8xu8VGfSBx4dSsDiX0R5vxom?=
 =?us-ascii?Q?VIy/R60I348cCzNkrHGDEpv48Ht9Pm/fsgdzDkEg7cH5TWEmRHKMPSuk1h/5?=
 =?us-ascii?Q?43sva0bm8eLai6h6c4ctC/85+mbeK7jKTRTc8fZtDI6cWSHnbmnM8K7DLfek?=
 =?us-ascii?Q?vG2FugXLJrqs+q51INkG+ok8/HwfUKqbzqHzw17NHHCiyEd0A1ssbMZV5f7x?=
 =?us-ascii?Q?Fo7a5QTUqtAnniHW0CemFlOyz7uwyAqiMA5mckyX7VrOkvvp5yP2BaAfHH5g?=
 =?us-ascii?Q?ziaDoGGJN3bbfUJBmyN1mY+9to9VrMzIjI9bNA6Ukp6TW19xbzDvrnQOyR7d?=
 =?us-ascii?Q?seK93viH25UMdhz0HbIn6+KdNTJWbsSxyoqqgoBQog463q5gXtfOemzQFRGM?=
 =?us-ascii?Q?Mwn+wXmbu/JvVtviH+Ct7AxPC8QfXwfDi957ee0R6MZea+PS2uzprZ4fFBaK?=
 =?us-ascii?Q?HhnEn6byi+Hvd83VOFW6+9aZYoAF4/jBDHHAXe2wPy8LgJNQdSW71+N/8xbv?=
 =?us-ascii?Q?F9aW/Lf9xtQYYzaOeM2iUJoA5HxYoQjpNTKfUclquSq5+L2QGF+ad0eq4Q3D?=
 =?us-ascii?Q?xBTvF38zsHwvRhS9f3N2oEubbme9Wu8wQfr5Hki8O11F?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nureva.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR20MB2779.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e96a2c45-ae1c-45b5-2c18-08dbaa61ce28
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 20:35:25.0172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5aeb77fa-643b-473e-aee0-cb54a11ccba3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h0lqDzg9CsVLueoxrjZXDKw55CjkbRuL8DpJ5CeDUt3FN1GSWvkQhFjTuiUSRQr8StDvXJEEjZIiIPKW4c8R7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB5040

On Thu, 30 Aug 2023, Stefano Stabellini wrote:
> On Wed, 30 Aug 2023, Anthony Chan wrote:
> > On Tue, 29 Aug 2023, Stefano Stabellini wrote:
> > > On Tue, 29 Aug 2023, Anthony Chan wrote:
> > > > Hi all,
> > > >
> > > > My name is Tony and I've been researching/developing using Xen
> > > > for potential upcoming uses in our embedded systems.  I started
> > > > with Xen using Xilinx tools about a year ago and still have lots
> > > > to learn about what it can to do in the embedded space.  So far,
> > > > I've managed to integrate Xen and Linux into an existing product
> > > > that exclusively runs bare-metal code on a ZynqMP SoC and
> > > > migrate some of the functionality into custom Linux driver/userspac=
e.
> > > >
> > > > I'm now looking at low power support, for now at least between
> > > > Xen
> > > > (4.16) and Linux (5.15) dom0.  I've tried a few different Linux
> > > > kernel configs around power management and each time I try to
> > > > suspend from linux dom0 (via sysfs or systemctl), Xen will
> > > > watchdog on
> > > > dom0 guest.
> > > > AFAIK, Xen should trap on a 'WFI' from guests, but from what I
> > > > can tell debugging through the linux suspend process is it's
> > > > spinning in a 'suspend- to-idle' loop before it can get to
> > > > issuing a 'WFI' or using PSCI interface to notify Xen.  I'm
> > > > beginning to suspect that 'low power' support for embedded arm64
> > > > just isn't quite there yet, or am I missing something in the config=
s?
> > > >
> > > > I realize this could very well be a Linux 'issue' but checking
> > > > here first.  I know Xen presents a flattened device tree to
> > > > Linux without CPU idle-state nodes and maybe this is causing the
> > > > linux guest to only do the suspend- to-idle mode?  I should
> > > > mention that I'm booting up using dom0less feature if that
> > > > matters.
> > >
> > >
> > > Hi Anthony,
> > >
> > > Assuming you are using the default Xen command line parameters for
> > > Xilinx boards: sched=3Dnull vwfi=3Dnative, then if the guest uses WFI=
,
> > > the CPU will execute WFI directly and go into low power mode.
> > Yes, using these command line params.
> >
> > > Given the issue you are describing, I am suspecting the guest is
> > > not issuing
> > > WFI: that is simple and known to work. Instead, I suspect that
> > > Linux might be trying to use PSCI_suspend in a way that is not
> > > supported or well- implemented by Xen.
> > >
> > > Can you check? You can add a printk in Linux
> > > drivers/firmware/psci/psci.c:__psci_cpu_suspend or in Xen
> > > xen/arch/arm/vpsci.c:do_psci_0_2_cpu_suspend
> > Instrumented both places it doesn't appear to reach there.  In
> > kernel/power/suspend.c, there's a call to s2idle_loop that it's current=
ly 'stuck'
> > in and I think it doesn't get to the psci suspend your referring
> > till afterwards, when suspend_ops->enter is called.  Unfortunately,
> > without any idle-states nodes in the FDT, the only suspend state
> > Linux is defaults to is 'suspend to idle'.
>
> The fact that Linux uses "suspend to idle" is not a problem because as
> I mentioned WFI or PSCI_suspent are not different on Xen. That part is OK=
.
What if using "suspend to idle" is preventing a WFI/PSCI_suspend?  Which is
what I believe I'm currently seeing in my setup.  In kernel/power/suspend.c=
,
suspend_devices_and_enter(), it gets into the this s2idle_loop and upon
resuming from idle, it jumps past the point where I believe a
WFI/PSCI_suspend can happen.
if (state =3D=3D PM_SUSPEND_TO_IDLE) {
                s2idle_loop();
                goto Platform_wake;
}

> However, if the issue is not PSCI_suspend then I don't have another
> easy guess. Please post a full stack trace or more information about
> the error in Linux and I might be able to see where it is coming from.

echo mem > /sys/power/state
[   75.666385] PM: suspend entry (s2idle)
[   75.685382] Filesystems sync: 0.018 seconds
[   75.685446] Preparing system for sleep (s2idle)
[   75.695087] Freezing user space processes ... (elapsed 0.001 seconds) do=
ne.
[   75.698339] OOM killer disabled.
[   75.701618] Freezing remaining freezable tasks ... (elapsed 0.063 second=
s) done.
[   75.767215] Suspending system (s2idle)
[   75.777682] macb ff0e0000.ethernet: gem-ptp-timer ptp clock unregistered=
.
[   75.784525] suspend-to-idle
[   75.784580] CPU: 0 PID: 548 Comm: sh Not tainted 5.15.0-xilinx-v2022.1 #=
1
[   75.788626] Hardware name: xlnx,zynqmp (DT)

[   75.792867] Call trace:
[   75.795373]  dump_backtrace+0x0/0x1a8
[   75.799094]  show_stack+0x18/0x30
[   75.802466]  dump_stack_lvl+0x7c/0xa0
[   75.806186]  dump_stack+0x18/0x34
[   75.809559]  suspend_devices_and_enter+0x334/0x4cc
[   75.814403]  pm_suspend+0x1f0/0x248
[   75.817950]  state_store+0xb8/0x100
[   75.821497]  kobj_attr_store+0x1c/0x30
[   75.825302]  sysfs_kf_write+0x40/0x54
[   75.829022]  kernfs_fop_write_iter+0xb8/0x170
[   75.833433]  new_sync_write+0x74/0xc8
[   75.837153]  vfs_write+0x104/0x128
[   75.840613]  ksys_write+0x70/0xdc
[   75.843987]  __arm64_sys_write+0x18/0x24
[   75.847965]  invoke_syscall+0x74/0xfc
[   75.851684]  el0_svc_common.constprop.0+0xb0/0xdc
[   75.856442]  do_el0_svc+0x84/0x90
[   75.859816]  el0_svc+0x20/0x4c
[   75.862930]  el0t_64_sync_handler+0xbc/0x158
[   75.867254]  el0t_64_sync+0x1a0/0x1a4

CONFIDENTIALITY NOTICE: This e-mail, including any attachments, may contain=
 information that is confidential and privileged. Any unauthorized disclosu=
re, reproduction or use of this e-mail is prohibited. If you are not the in=
tended recipient, please notify the sender by reply e-mail or telephone and=
 permanently delete this e-mail and any reproductions immediately.

