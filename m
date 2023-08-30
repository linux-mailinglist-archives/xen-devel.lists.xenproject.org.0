Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601F478D71A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 17:38:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593007.926005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNG0-0001I0-51; Wed, 30 Aug 2023 15:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593007.926005; Wed, 30 Aug 2023 15:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNG0-0001Fp-0q; Wed, 30 Aug 2023 15:37:24 +0000
Received: by outflank-mailman (input) for mailman id 593007;
 Wed, 30 Aug 2023 14:39:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g7n+=EP=nureva.com=danwaqar@srs-se1.protection.inumbo.net>)
 id 1qbMLf-0002Ft-JB
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 14:39:11 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071d.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::71d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa27164c-4742-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 16:39:10 +0200 (CEST)
Received: from MW3PR20MB3290.namprd20.prod.outlook.com (2603:10b6:303:5f::16)
 by DS0PR20MB6486.namprd20.prod.outlook.com (2603:10b6:8:166::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 14:39:04 +0000
Received: from MW3PR20MB3290.namprd20.prod.outlook.com
 ([fe80::f62f:626a:14b:3b1c]) by MW3PR20MB3290.namprd20.prod.outlook.com
 ([fe80::f62f:626a:14b:3b1c%4]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 14:39:04 +0000
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
X-Inumbo-ID: fa27164c-4742-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9OPtH4CNyg2YZ1Rr0D4KLvb9vKPn1Qn0xFaL2AMwoQVupHqbOGX1eymTxWPlCnDeEQZhQjx3OUZkUcyek221YBbBO3dbchcA69mhzKydk+LlxLD+aOGVuNeR4nDhhFtnc7y6Ljh/aoVwPZSE3s5bgrf9LISHhj2y0hpvUpDeVclBUPxvRaf4tcDgOVPa5SoVUcuOE6TY2pK1CE3bwJKt3MGlUwO7Cj8I/ugrvDTYTUK8f5Koco+fZASlURF+LCHkSEyRKtHMNascf2tCGxn4Ox8ql/BNefedVFQsJZ02DtfDe+AakLFcblLa2Y+BYZEQuUbEOiS3ikoXLweB48eOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6iAVqAHS9d/SMMVkOjbuf1SiV6oznBLuxEIohaYnyA=;
 b=TPybq7ADke07bnFYg28TjuC2dZ8wFDCA8MKx1WQRu3yLlZJhhwe3ZmrGgjKuy8yQ29GfO1gk7QGZLRMRgC7akqdVIIk7M3olAJgKXeQ45b4vIcwfacqV2MqwTBla7fJzOpaTsS7LBCBN5ilUxDTLFcoaXhEZ6NnDc3FD4xXSRu1GnlhFO0LNOtmleDtvqxqojUtl+XolyD3lXtbceduQSyvUb7zHaxSTyY692ZwjD3ErQk2YBt3EDGT0vfnHJ4xM5EfzPABS8gkl7RU6LxYWnQMMtDLC2naIAXFnbiZfPN3w2Neg7e3XKOg5LG9eUZTYLLNgPOvi77kyYGF99CLUbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nureva.com; dmarc=pass action=none header.from=nureva.com;
 dkim=pass header.d=nureva.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nureva.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6iAVqAHS9d/SMMVkOjbuf1SiV6oznBLuxEIohaYnyA=;
 b=PeJQOl2r7q1GUk/cnMVsU+i/BODIdOswRlhZW+/qH5fun7rN5gNRwW7V2s/iLdBwdgEVnKDgT778shseEHeoOH/dZp8++88z4Q9m0D/D8w7tm48KWT+4PjkZLywSaRVpYaPHO4iiDTnt3sluhAqrMrGtQJSnZVDKU71ZZguH/8s=
From: Dan Waqar <danwaqar@nureva.com>
To: Dan Waqar <danishnzapp@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "julien@xen.org"
	<julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>
Subject: RE: [EXT] Re: xen arm64 low power sleep support
Thread-Topic: [EXT] Re: xen arm64 low power sleep support
Thread-Index: AQHZ2sXujaKHIRxg0Ui8Q8pm/6lEKrAC6Tjg
Date: Wed, 30 Aug 2023 14:39:04 +0000
Message-ID:
 <MW3PR20MB3290BE4F7FFECC569F65FC7DB1E6A@MW3PR20MB3290.namprd20.prod.outlook.com>
References:
 <DM6PR20MB277971712E5415CB231AEB37C1E7A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2308291512271.6458@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2308291512271.6458@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_2214f2e3-d3e7-4b81-8952-aef73521b876_ActionId=6284961f-2114-4113-b191-8a72ecdf93dc;MSIP_Label_2214f2e3-d3e7-4b81-8952-aef73521b876_ContentBits=0;MSIP_Label_2214f2e3-d3e7-4b81-8952-aef73521b876_Enabled=true;MSIP_Label_2214f2e3-d3e7-4b81-8952-aef73521b876_Method=Privileged;MSIP_Label_2214f2e3-d3e7-4b81-8952-aef73521b876_Name=PUBLIC;MSIP_Label_2214f2e3-d3e7-4b81-8952-aef73521b876_SetDate=2023-08-30T14:38:20Z;MSIP_Label_2214f2e3-d3e7-4b81-8952-aef73521b876_SiteId=5aeb77fa-643b-473e-aee0-cb54a11ccba3;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nureva.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR20MB3290:EE_|DS0PR20MB6486:EE_
x-ms-office365-filtering-correlation-id: b29ce148-5ca1-404b-2460-08dba966dc01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 O2MFAicIWSkKJ4kPWGwUhdEQBW3WvYgJ50nQIirtrLpk7gf6LHdwVJH3yBQPszScFbE2qLfOx+QxDs6gaA9v0NJsXbORVi80HRcrJlM7kLTdvxyfrtDgi99M8rCe8jdyC0dG9AngqNzNnCzFyV8y6yKP55viTNaN4fkFrgxeZ40xPq6/Z4LU9qfIzZhooKZQc7xrJI4ppC+Id9YgNhIc5R/aYuC+3eSiPbqQvZWbw92wixZfjMewhVHRwN0OPTNIngvw23OHtWDZFoGpWckLefhGAodIV4Mu+ViPG4ydlpaxobKZobC8iixmpvkZDqUIIbo4FQ2uiUwCBVqsbvvjmZeR7WmF66GITY9rT415U803lZzobmlZriM4ra2GNXxXQaSESUuQQkKwi7D7Fyrnz835Yy1ryRb1SxiEghgmnq+sn/sdOQsXKqZB4l7cwFidY9YmAOKmG9WMpmMEXD/42N7vGG8EUNhqwLdQYa2RbsjzZgWxTmgYhbw77rzVE6xv9bhvT5DTZxNGRPaWgIMYQ3ncQplqNXp8TPQdt4nbQAVqCzhInasL8V5qozX2OVNKlOoAnuqleacde3+y9PJUulbpqkhQvqI/YE4HoA+T3avSUT2QHGLlkuX1a2l7xhxB
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR20MB3290.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(366004)(396003)(136003)(346002)(376002)(1800799009)(186009)(451199024)(55016003)(54906003)(64756008)(66446008)(66476007)(66946007)(66556008)(6916009)(316002)(76116006)(38100700002)(478600001)(38070700005)(122000001)(2906002)(86362001)(8936002)(8676002)(41300700001)(5660300002)(4326008)(52536014)(83380400001)(9686003)(71200400001)(53546011)(6506007)(7696005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vy6PakqnmeNBj9KEBvTZh0P+i5bWax5FAiU4UAmxyNV155hj1diEPGbHWznb?=
 =?us-ascii?Q?qm9GS+wjyp+ZL0RFzK/ifVY6tVXmjcQyqOFcz3mweNPEgmTcjO8HquGx+fbb?=
 =?us-ascii?Q?X3LLBijbcFANmxVoBDR14tSzO+JhCcwhWj0ElOJsI+mqNSdJcxPjFGoGp4HF?=
 =?us-ascii?Q?rAuhIlRsaL/nPmDsaWQXbCToM2t2Gvaf83gfCp9/2cV9mmpa5v0spPr3sMFW?=
 =?us-ascii?Q?exRN07EY6mZ5+c385U5oSQzvRcp+w140ABNzKSxbKXF6+WNOX/00ZIxiN3+e?=
 =?us-ascii?Q?JqmgYui+XwFlO7vDLwajACZZQprKChHl59Fkb3KmEwvLkMksOBEhjEsuK8vu?=
 =?us-ascii?Q?C14+cOO7cSa0p3mtaDuhsSJam3NohCSHSfglwDrCjf/oxa3RPYiGdlx6O6NT?=
 =?us-ascii?Q?jC05N8SQMa4Ov2x+q51nqjqwbqQCR/0ITiPyFNghJV5xHrV8L8uiqgd3KaVm?=
 =?us-ascii?Q?Mmt4HOzBzmxNE+/mzAIugF9Qsz4VbG8rFeQOD2MIzVA3Ut17AyLGGcC59MgO?=
 =?us-ascii?Q?t3ij/E6iIQqMQeAeGL/XdahSlezW6GcDiyZHCcsXwweYdL3NGDOSvJqsa3BZ?=
 =?us-ascii?Q?lyVvPkXMytmPsuAzBOmgiqi26f5UtKAmQvH1LPoF1Pgig/SFG+gcD0JuwNM3?=
 =?us-ascii?Q?O7UeKwkQ2DYGm45i4BVervyw93qN6j0od0aGIM1lHUWF0NuUV6GwfVMxITVW?=
 =?us-ascii?Q?AwB8+1DUxldr19tAUS/5+az3vhVEMTp5FAZDVBTsjg1xxXEeLnWpMX10bGN0?=
 =?us-ascii?Q?vCLgQbADI/TaU3K18GwUzByMoKGaFa9kaPGyd87vtUEGssHZW74uJLxBFFL8?=
 =?us-ascii?Q?vMgwOF4qIr7o5L0/JhIVDMHTh4miIwKFHsk0ALMkf2m2zeCqFIVz2jBq2LtH?=
 =?us-ascii?Q?t9Dsqelwm0GVdiQyYAWyWA+1awmDRaE9DJ+iNu77/CPEjF8bqMAXqGsGX/ch?=
 =?us-ascii?Q?WB2XQpz0+PHTmY/5IzOtk33pE/kMKBsywZKr/vKQFxXPWY/QZIguEQgarwci?=
 =?us-ascii?Q?sYsIh9T6mev85AUIWWf+3eq1euv8e8ixu0TXL1PjbPC+Wo3DQ5sa54bvLUBG?=
 =?us-ascii?Q?9sWpf2KZx/D5jqTk5ILSFM+b6I51h4UhHmT0uoyEkoSJTyUS4/sOaK7xh7za?=
 =?us-ascii?Q?rFIHiYDnh2TB8KJ2BV14ysnwJABCtzAjA5uS+fYB8gLUo4RJu5RxTccpEbV7?=
 =?us-ascii?Q?kU6H1SMyMNcnx+Rtr3I2x4PiYQhkvIvq/TKC/Dz1b/0V4E0S5Xh0M6gEk6Rp?=
 =?us-ascii?Q?+hX28D+Sh4bl1fCy/7t1cVjiqZMlD+yWjJkmhr8lUIbnGRjNOAdZBaxfii0l?=
 =?us-ascii?Q?yK2wTMK4jSoISZJyK0VdRRcD/IuZniABHVX8GkZmR/jh0HFKCNGvLhled2Os?=
 =?us-ascii?Q?PTC9WqQS9rOWeymAlcrlG0Bweb1dxpU7cuiirDB0AkAbKkDi8O7lAwI8Sw5s?=
 =?us-ascii?Q?iDsXDAuIoozxeJnlcBx3ladCgIyYYZZwws0oHyhSRhPvG1zMBkjfOjvvEk15?=
 =?us-ascii?Q?OkAwWBsLSidYxEz4opbdhVXT9t+kviSriaY0PS8Alce5bfFmBOi/+NrEC+gG?=
 =?us-ascii?Q?jGDP/3h9SW4JBbCfyP40UUuC0WK9lUqhMCUYs95e4TRR0RQZian5HB0NmDrF?=
 =?us-ascii?Q?S4uJ/gOX/lOE9GuS1gePeno9quOdCes0PXIzUyNtVrzE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nureva.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR20MB3290.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b29ce148-5ca1-404b-2460-08dba966dc01
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 14:39:04.5864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5aeb77fa-643b-473e-aee0-cb54a11ccba3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IV0bG4MYu1S+GUE9cMeryoM7qDUFVBGJBoOtLSrLvW+HOjTnStoZpbUdR2IdTR0txdo5/cLVvFndDPSsjHk3iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR20MB6486



-----Original Message-----
From: Stefano Stabellini <sstabellini@kernel.org>
Sent: Tuesday, August 29, 2023 4:13 PM
To: Anthony Chan <anthonychan@nureva.com>
Cc: xen-devel@lists.xenproject.org; bertrand.marquis@arm.com; julien@xen.or=
g; Volodymyr_Babchuk@epam.com; michal.orzel@amd.com; Dan Waqar <danwaqar@nu=
reva.com>; sstabellini@kernel.org
Subject: [EXT] Re: xen arm64 low power sleep support

On Tue, 29 Aug 2023, Anthony Chan wrote:
> Hi all,
>
> My name is Tony and I've been researching/developing using Xen for potent=
ial upcoming uses in our embedded systems.  I started with Xen using Xilinx=
 tools about a year ago and still have lots to learn about what it can to d=
o in the embedded space.  So far, I've managed to integrate Xen and Linux i=
nto an existing product that exclusively runs bare-metal code on a ZynqMP S=
oC and migrate some of the functionality into custom Linux driver/userspace=
.
>
> I'm now looking at low power support, for now at least between Xen (4.16)=
 and Linux (5.15) dom0.  I've tried a few different Linux kernel configs ar=
ound power management and each time I try to suspend from linux dom0 (via s=
ysfs or systemctl), Xen will watchdog on dom0 guest.  AFAIK, Xen should tra=
p on a 'WFI' from guests, but from what I can tell debugging through the li=
nux suspend process is it's spinning in a 'suspend-to-idle' loop before it =
can get to issuing a 'WFI' or using PSCI interface to notify Xen.  I'm begi=
nning to suspect that 'low power' support for embedded arm64 just isn't qui=
te there yet, or am I missing something in the configs?
>
> I realize this could very well be a Linux 'issue' but checking here first=
.  I know Xen presents a flattened device tree to Linux without CPU idle-st=
ate nodes and maybe this is causing the linux guest to only do the suspend-=
to-idle mode?  I should mention that I'm booting up using dom0less feature =
if that matters.


Hi Anthony,

Assuming you are using the default Xen command line parameters for Xilinx b=
oards: sched=3Dnull vwfi=3Dnative, then if the guest uses WFI, the CPU will=
 execute WFI directly and go into low power mode.

Given the issue you are describing, I am suspecting the guest is not issuin=
g WFI: that is simple and known to work. Instead, I suspect that Linux migh=
t be trying to use PSCI_suspend in a way that is not supported or well-impl=
emented by Xen.

Can you check? You can add a printk in Linux drivers/firmware/psci/psci.c:_=
_psci_cpu_suspend or in Xen xen/arch/arm/vpsci.c:do_psci_0_2_cpu_suspend

If that is the case, the attached patch might work because it disables PSCI=
_suspend support in Xen and Linux should fall back to WFI. (There is no pow=
er saving in using PSCI_suspend versus WFI.)

Cheers,

Stefano

CONFIDENTIALITY NOTICE: This e-mail, including any attachments, may contain=
 information that is confidential and privileged. Any unauthorized disclosu=
re, reproduction or use of this e-mail is prohibited. If you are not the in=
tended recipient, please notify the sender by reply e-mail or telephone and=
 permanently delete this e-mail and any reproductions immediately.

