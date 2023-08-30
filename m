Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F07D78D6BA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 16:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593042.925945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMcM-00084Q-Q4; Wed, 30 Aug 2023 14:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593042.925945; Wed, 30 Aug 2023 14:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMcM-00082Z-MF; Wed, 30 Aug 2023 14:56:26 +0000
Received: by outflank-mailman (input) for mailman id 593042;
 Wed, 30 Aug 2023 14:56:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lAWd=EP=nureva.com=anthonychan@srs-se1.protection.inumbo.net>)
 id 1qbMcK-0007cD-Vr
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 14:56:24 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071c.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::71c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 623c6fed-4745-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 16:56:23 +0200 (CEST)
Received: from DM6PR20MB2779.namprd20.prod.outlook.com (2603:10b6:5:140::30)
 by DM4PR20MB5631.namprd20.prod.outlook.com (2603:10b6:8:10d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Wed, 30 Aug
 2023 14:56:13 +0000
Received: from DM6PR20MB2779.namprd20.prod.outlook.com
 ([fe80::c3:998a:f69:190e]) by DM6PR20MB2779.namprd20.prod.outlook.com
 ([fe80::c3:998a:f69:190e%7]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 14:56:13 +0000
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
X-Inumbo-ID: 623c6fed-4745-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxSHKyYUkcDY9ZDsN8bcUiC6RE7JonM+WT+W3pKUcSYD5xtkZzclCyIsDTkyfybdBebiPm+9PHqxU1bDF4hmo/Xtp8GllAnWAymj1bqiqujJSS5D5+AgYMSBlqPS8dx2FsNuKw97KVyZxB5jdNcdiCj25hPAwNoez4honKt5lZ9x/xvnlX7HH1KGvblcL7a6mj94vCg849kXvyBv5LggOIl5aiy3pI1wEGZjDa8dQiF1FAs8W5tf6uoiqs/2/+iuSFJ6gIwwQzrub//fayGtOF04hXkYXkhkTKI9FKVkuVP9zcAfbv3txVOD8VDPPrHHtDY78pX7Z4qSAE0RnmvQuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3V2ZbKEVkLTYFV1zY+n+rRFRLqtZLQERegskirl4004=;
 b=aQ/w5bEvDbSZLjdDcaAe316FZdMKilwqt8scEDt592FbVyJjGfuMjnbipR1vER5hw0jtOd3PyK4T8SgW/rw/cdn9Zdth3iP4sQm2bwedxcqB0ifD7IygVbGLgyTUFpXILVvkggLuib15IUE6Bq0cW1ui/6EVVQHnBpoCapHEVetKxaB2/PtbkRz7BiklEJwogCDIen65I1t0dFFURitkEvezT3d4EcRf1k8c2ggyY7J0wrb12qv0EPTWDPfmwZVEQNf7z8akejpi9QSG2eNFbpknztR71lQtdYAq4BLDLwOLx2ngs4xXQFuPm44CdK6jd9pU8yBz4Sm/W976lBmQUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nureva.com; dmarc=pass action=none header.from=nureva.com;
 dkim=pass header.d=nureva.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nureva.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3V2ZbKEVkLTYFV1zY+n+rRFRLqtZLQERegskirl4004=;
 b=eUgpjdcwpWsfGmvRFgrsiLrCI4TUWF3xhG9uEj+DuiLTBavdiB2lKySJHB/BeaCbJh1a25TxmX82vp7YchpcWKV4Fxn8WFNvFaNPyDSLKNVlnmkOvOv1gWUodHOfWr/NYIx2CaYjkb/TPOxglqvrm9Gdc1KNQFfEeYdvAQg+ti0=
From: Anthony Chan <anthonychan@nureva.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "julien@xen.org"
	<julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, Dan Waqar
	<danwaqar@nureva.com>
Subject: RE: [EXT] Re: xen arm64 low power sleep support
Thread-Topic: [EXT] Re: xen arm64 low power sleep support
Thread-Index: AdnanCj70Orzia5aQfSER7H0AUNnzgAKb5uAACL7QIA=
Date: Wed, 30 Aug 2023 14:56:13 +0000
Message-ID:
 <DM6PR20MB27795F4B6C327F7F031BABB0C1E6A@DM6PR20MB2779.namprd20.prod.outlook.com>
References:
 <DM6PR20MB277971712E5415CB231AEB37C1E7A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2308291512271.6458@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2308291512271.6458@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nureva.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR20MB2779:EE_|DM4PR20MB5631:EE_
x-ms-office365-filtering-correlation-id: 09c32dd8-5544-4c11-8b54-08dba9694147
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tWKAA3Nu3FoEk8BUuE+9vLLXl9oAUXZT2vWWHhYztMjWGrl+MtD/OiTC8UOXqFqUP4BpktS2Zy+BPKVRDKC7mcvPveYuj6XLp0vi3wdPDH7HSSjvRFuP7OV3fS1fN968tyyZnsNvMkudpb3VW/NJbpXo9ipJ4u/TKHeW9SFFvBbP6YDya7uFze7hR4sS3rKlSBdo3mU2pJn6bdNkGxJ1vn2vJWOFXhTU9D0BiQyvcMQjNJ7VCoE+wQ2O3NLKfcWAg1pMxM0YR1o4yBJWvzV+9inzYV62v+BaYaWpDacb+uCF+oWMd+ox9sn5uKQItH1r1gw30H7Hu6PgD5r8oYOPqGT5vWcJX0IQWynTISVQ1+WOaeh8UE/t6+OV228G3g7cSifWLLaU2wTzPs+MZfjM8AoCCIijWmCagSk9fxsYIMzrXlLETOTiaRUNCUM94G1YQx2tsMxvPzvkGZvJFls7fLQlBbgPig08lMxKVYAwrl6PAsVBBgalL1ZMEoChiSVguEtKjogfvdT9YuqdIWa5q+nYN5q0MjLSspkEtMkNYCkOWNAAij2iT1Dts1pbHRiJHq47thy2/jdyQpjESEcdwJf+Cklm1aYE8f3mc2ISWpQsyLLCQkWp+jSRqZZd1K7Y
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR20MB2779.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39840400004)(396003)(346002)(366004)(376002)(451199024)(1800799009)(186009)(9686003)(71200400001)(55016003)(7696005)(6506007)(107886003)(26005)(38100700002)(38070700005)(52536014)(33656002)(5660300002)(4326008)(86362001)(2906002)(8676002)(41300700001)(8936002)(66446008)(66476007)(66556008)(64756008)(76116006)(66946007)(54906003)(316002)(6916009)(478600001)(122000001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jRoZOFgNIVDU50JtHAF7TAs7j677iPbNaEWmVHqF1uKB+RMBVkc6M7SwbZwf?=
 =?us-ascii?Q?y0frYC12p7kS9YDMKMx81hOBbEEGPojNdc3KP2kTjpYcHy74vHkALHIssYSv?=
 =?us-ascii?Q?XrVEX7W6UsnQboqDjISb54YZYfUxn3BWQPL7oq8SALfVJIfkSNTlAAMIRgY6?=
 =?us-ascii?Q?8BTxMn+giHke6XoZ2pbPeLsqKPB9BcSM4MSC/pTHgblKeBPCBO3+Urn23B0A?=
 =?us-ascii?Q?g5Se92WaleBhAHuV0HepP4mE2VV56bSkSg6gokc/gS4VkrdQuSfXOGBQZfXD?=
 =?us-ascii?Q?MhvdHTV4k2wP4uC6oGbWHJcYNkVJrsc60QJBnlMQUS5dzXQnjWJ979gq5526?=
 =?us-ascii?Q?FSAExTv4t0QHvMIADa3WEu7//sPIgaKEFpmg0X55PMrCP5WBqFM4E0u0B6GF?=
 =?us-ascii?Q?YzgmdvRclZ4c6H5Q+vsL5Pn74uL2n4RWPzo7B/7zwa5EAztyqlP0SeY5W88g?=
 =?us-ascii?Q?oIoYVgeKlAZLgUVr1nA51S0BSfAEbaewbxb+tYdhFYXwl1Bowuek7tHQibcw?=
 =?us-ascii?Q?fWGD8cvxa4ZoWBmOtFhsyLqG65ii2X8TNH+BXafNSy6IEyhJLrXDRU9rkFlb?=
 =?us-ascii?Q?AuujqRhdB8y1uUUxOXs3J/jteme85Byp7MUf4DFXknV5Zm/vyEMn+/EKafss?=
 =?us-ascii?Q?621yOfu/zFxmSXrily9jGQWWZNDt6Rt3/9Ip1sjDJnRmezXndY2OoF9EVHea?=
 =?us-ascii?Q?OoK/ma5He6soO9AsdbdDRI00ly/EXqYN0h+X6kJVEo8LBr1Upvg4nsOjvb0x?=
 =?us-ascii?Q?Sngf2e2p/WvkZQ9AxwtNVyosIBiimdelElL06dD8RWH93sERENOTGOcdlE/e?=
 =?us-ascii?Q?kUb/AuxaRfm/5yrm6tLefv36WD5oeipMwB9Xq/nKHv6yKFJVNHH+hv7OJAyi?=
 =?us-ascii?Q?BI+EEpzKjNkntyhqD2qSi5q9oFZDiXXl9DtqlN//ue5+hEgm2m6WjjZi4NBf?=
 =?us-ascii?Q?Txmtw9ITz0d0yEtzz+jJZkwWoE5b6kQJyH1NN5fkPVsfz0EDT1aA5A5oNZ4U?=
 =?us-ascii?Q?fh9DFSfiw41y106Y+MuuN7ImSS+f9CamS/JGORm+mOVhwy12Th8MNXb8bQAK?=
 =?us-ascii?Q?lYy69Bnj5NoFn+nUjEBs9KJd5MKOEFGjdiuHMH6J/9jycQ09+7G+LEjTByZP?=
 =?us-ascii?Q?IPZgmBWfG5EFmUMb9v09F9QElcLY9btTsDNXpZ2HiHdW+JZXxTCIre3MZZDR?=
 =?us-ascii?Q?RVo/bKzJcUUKd7H0NbhS7j6QvhhpskDPLZck33APYaCy6ZVnRTkgqGEIAU7u?=
 =?us-ascii?Q?3lHzsdBNeekCD0K55hYpohbHC/G/e/b0np4WOqWlf7QqHkRkTVcs1p8GdDsa?=
 =?us-ascii?Q?Vvx5yJbLSc93rxuW7urNugolIrlhCWq+dUEW5EabyHMEfwVWdTIbJje8Jhut?=
 =?us-ascii?Q?QfQCZLtufHIWFWSJtRlPWdJxcdt1nhw9qLJTHIcDqmJxAF0TUN5gALjs2ajA?=
 =?us-ascii?Q?5kU4FPfUAwm/MZ2aOwiEXE9zAa/wkdqnmFyh8NSRtagei/zMuopR786QcS2f?=
 =?us-ascii?Q?1hgfewGbXH7MdzbPiYFSc0BnbG+55fcL0s7jO0sXHkNdT1AH4LFXtZr7hlXH?=
 =?us-ascii?Q?OzqPu+1U8hZZUydMnQKSDx0y2Qh9VFAY6SK/CzKn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nureva.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR20MB2779.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c32dd8-5544-4c11-8b54-08dba9694147
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 14:56:13.4840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5aeb77fa-643b-473e-aee0-cb54a11ccba3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fq/MXB6KiDTPGxwEglSq6j+i8EfTd5WScWE0KmcpqyB3v/utSA3BZyADsmHO8qF2jKachbyY/n6WM15xEMPvyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB5631

On Tue, 29 Aug 2023, Stefano Stabellini wrote:
> On Tue, 29 Aug 2023, Anthony Chan wrote:
> > Hi all,
> >
> > My name is Tony and I've been researching/developing using Xen for
> potential upcoming uses in our embedded systems.  I started with Xen
> using Xilinx tools about a year ago and still have lots to learn about wh=
at it
> can to do in the embedded space.  So far, I've managed to integrate Xen
> and Linux into an existing product that exclusively runs bare-metal code =
on
> a ZynqMP SoC and migrate some of the functionality into custom Linux
> driver/userspace.
> >
> > I'm now looking at low power support, for now at least between Xen
> (4.16) and Linux (5.15) dom0.  I've tried a few different Linux kernel
> configs around power management and each time I try to suspend from
> linux dom0 (via sysfs or systemctl), Xen will watchdog on dom0 guest.
> AFAIK, Xen should trap on a 'WFI' from guests, but from what I can tell
> debugging through the linux suspend process is it's spinning in a 'suspen=
d-
> to-idle' loop before it can get to issuing a 'WFI' or using PSCI interfac=
e to
> notify Xen.  I'm beginning to suspect that 'low power' support for
> embedded arm64 just isn't quite there yet, or am I missing something in
> the configs?
> >
> > I realize this could very well be a Linux 'issue' but checking here fir=
st.  I
> know Xen presents a flattened device tree to Linux without CPU idle-state
> nodes and maybe this is causing the linux guest to only do the suspend-
> to-idle mode?  I should mention that I'm booting up using dom0less
> feature if that matters.
>
>
> Hi Anthony,
>
> Assuming you are using the default Xen command line parameters for
> Xilinx boards: sched=3Dnull vwfi=3Dnative, then if the guest uses WFI, th=
e CPU
> will execute WFI directly and go into low power mode.
Yes, using these command line params.

> Given the issue you are describing, I am suspecting the guest is not issu=
ing
> WFI: that is simple and known to work. Instead, I suspect that Linux migh=
t
> be trying to use PSCI_suspend in a way that is not supported or well-
> implemented by Xen.
>
> Can you check? You can add a printk in Linux
> drivers/firmware/psci/psci.c:__psci_cpu_suspend or in Xen
> xen/arch/arm/vpsci.c:do_psci_0_2_cpu_suspend
Instrumented both places it doesn't appear to reach there.  In kernel/power=
/suspend.c, there's a call to s2idle_loop that it's currently 'stuck' in an=
d I think it doesn't get to the psci suspend your referring till afterwards=
, when suspend_ops->enter is called.  Unfortunately, without any idle-state=
s nodes in the FDT, the only suspend state Linux is defaults to is 'suspend=
 to idle'.

Sorry about the boilerplate confidentiality footer below, I am not allowed =
to disable it...



CONFIDENTIALITY NOTICE: This e-mail, including any attachments, may contain=
 information that is confidential and privileged. Any unauthorized disclosu=
re, reproduction or use of this e-mail is prohibited. If you are not the in=
tended recipient, please notify the sender by reply e-mail or telephone and=
 permanently delete this e-mail and any reproductions immediately.

