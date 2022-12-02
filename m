Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A7D63FEC1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 04:25:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451438.709173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wf0-0000gt-AU; Fri, 02 Dec 2022 03:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451438.709173; Fri, 02 Dec 2022 03:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wf0-0000dV-6b; Fri, 02 Dec 2022 03:24:22 +0000
Received: by outflank-mailman (input) for mailman id 451438;
 Fri, 02 Dec 2022 03:24:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VP6A=4A=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p0wey-0000dP-GD
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 03:24:20 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdc92c9c-71f0-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 04:24:18 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by PH7PR12MB8179.namprd12.prod.outlook.com (2603:10b6:510:2b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 03:24:14 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::b955:9b0b:3b7e:40bb]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::b955:9b0b:3b7e:40bb%6]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 03:24:14 +0000
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
X-Inumbo-ID: cdc92c9c-71f0-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Juj3fpINQzIJW2roBJXEndmXD0pSU20m44IQn+GzSU+mqABKDfyeMvIkLnqLncT2SGBqhyqWpMTYNKPMGVEwOlGtYNmGD6YqOREetn5zuZZhKNTA2l0Q1Ix4PhhQslRO7rUjjMPuWUkM1Jr7i4eyL0/EmMrZNqceMzVG5Pgfn/8viFFIWuXpyAt5D7Qr+Z3t6QMBthjY2shqe3BVEKGhTPuCW2JnLsVkl8bq/vOD48v4U4HBwvFh2ctn9v+cZaEOdOdUyGUCUQuuNXwMeDe9wCzUa7hZRgNy5hxmzPFYQpGjKfLvMB0IF66TalAz9RYRfsA9Qi6UFrTyVUvd68CV7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eb+mNe6jWnzw2Goe3qx9uou6gVlSe4Vejc1vXobydxk=;
 b=GjIvdXXo/2wdRyNw5NLoBvV1g53Xe1eWHiaRNdy2M22N3uDenc3uuEoCfg+3RpdEME1hX3tGu0Trvr7sJADn6M4DVnssuRFxa6WRvBdnJ+t9KZ50Ch0g8SrMFS0f79w6R6xAUI/iqbbPXrDjeDX+SVlhumSNDjt4Sz587c2lnghGRxxRF7RiClX8ZjoY6bUeNIktxug7VQDWwxwSijP8CIGCtrI12vGw9EBLaLxCVoR1d2XrbMhs1uUQ+hAhmm3Z7upnD0slO52tqMdfq7lEi1FWPKh1gmGO5KvRl7PAGm5N39Nj7hBGl/kjazoP7LYmj+D/iybjy6JQg25W2zTEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eb+mNe6jWnzw2Goe3qx9uou6gVlSe4Vejc1vXobydxk=;
 b=wjfNliLBqggAkXe0b90N8SxBZF9bzuoROOOh6W2PXyzPkx+rjcXWJcdkOZ3SsxaXTkwiRJY2hWZEShYBHooDfMxPV++UdUlzcY+o+2BL84XNv6+JjKbN09rcxCht2NIkglsnX7Whpub6bc/TIT1RwfXRKmj6DbWO8kvnx8xsPtg=
Content-Type: multipart/mixed;
	boundary="_000_MW3PR12MB44096CC3AD5CD01D6043B0E79F159MW3PR12MB4409namp_"
From: "Garhwal, Vikram" <vikram.garhwal@amd.com>
To: Julien Grall <julien@xen.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "Stabellini, Stefano" <stefano.stabellini@amd.com>, Peter Maydell
	<peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
Thread-Topic: [PATCH v1 10/12] hw/arm: introduce xenpv machine
Thread-Index: AQHY4FQ15RSSddYLF0Kn4xxgJMMxt64RTjOAgEa3YYY=
Date: Fri, 2 Dec 2022 03:24:14 +0000
Message-ID:
 <MW3PR12MB44096CC3AD5CD01D6043B0E79F159@MW3PR12MB4409.namprd12.prod.outlook.com>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
 <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
In-Reply-To: <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
 <MW3PR12MB44096CC3AD5CD01D6043B0E79F159@MW3PR12MB4409.namprd12.prod.outlook.com>
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR12MB4409:EE_|PH7PR12MB8179:EE_
x-ms-office365-filtering-correlation-id: 801b36ca-676a-4132-8702-08dad414b020
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5ahEdauuu7TEWImDK1xIaTCDNPxe1XU8LP15MCw1s+igVuUg5vXcEG9wiLNPwIodZLt0/m/8gwHIU4/C42vHPXRVGkelVMcPQqCkbb1z287CxTXKyrjTW5/SHbHEo03mWghN9VVB3eTntSsN7Hr/YTMZubOe3yk6Q1RYpUTiPhwV19T0wne8jnAHwrTAxRGMLWn20ghWldlJtBJKpArnfE1Z0Blb7+VBFTNWO5P+wD8oPumv3GvBdqYVaNFMGj7G3Q5SmBN0PVqUFw1swxqSy/byI4YXjGkpCXa6/t6m6P2gTkrmypBe/IMIapgCc2blia4OdF7BKWbyv1hCkpXT/X6Pq72Mbh3S6KqqsNQQpsdC1+WW6kdCXoqc5AWK3p+RHp8dwuLV+IU4ocgpNN04oRJrDTrEBfdertwbLXyhm1AYpwSvRKXjjfiRUblhSqKkoB4mUxriUmHsseFG1+8BLjypzeUmc6TsGLuixL7ZVnb3wYKvwD6uRO75EAQJ4YDOhLqXc08DzCpM0UfS/e2kafWYEqm1Zc4LEuVTTwdomY9ef96AU+2aqg536ci/5oi15Ubr2gx3ZTGX0Ij6IVoy/SGlCeULcJlOqlbD2X0eygyeLeDdkNi94vXYXQNE6RCzYfUzYpHVpnc52asVaba//z1o9EXhs+7NAWG5WACUc7zsW8yVvSb8kBmiL65i6Pf4itjJZTvMeOPf4I1uQUA0r7GWDGzW4l867qwyQNssAkw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199015)(2906002)(5660300002)(52536014)(9326002)(8936002)(64756008)(54906003)(8676002)(66946007)(66476007)(66446008)(66556008)(316002)(110136005)(4326008)(33656002)(966005)(41300700001)(76116006)(91956017)(186003)(71200400001)(6506007)(26005)(9686003)(86362001)(55016003)(83380400001)(166002)(38070700005)(478600001)(7696005)(122000001)(53546011)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?u/k0i9xjBmNGBZvGM4sj5g0lgFiTJf72FTddQ6YGvYUtzpse3Fo1KnIz?=
 =?Windows-1252?Q?+E/djzkSNYG8CpMwlT8V75B1WbOSZDSFCZtUOT/IJhL2wEpdHzr39eRN?=
 =?Windows-1252?Q?MklBSiuOpmup4y1LMJ8MlMsxcxmpD2Xv+2M5BMPnc3p8lu2fKQ4wl8+m?=
 =?Windows-1252?Q?iHnfaTzO2qak/s4MCh/hGD7i6Xz9ukh6YC9KKBv2qvMZJ6e19WQB0PKd?=
 =?Windows-1252?Q?Jy8MQkehR1+DtXSxS0b1gxiauQyLPqWQ01DJy8aS+ZePTwY+FB8fE5RF?=
 =?Windows-1252?Q?q/uX4m2sHf7swJj1H5LYlsRe2sYfjYEYkAEbjO3kqrR0Vn8RMDjrYTys?=
 =?Windows-1252?Q?VhjJ8jtC8UgNv0XJJUBQ7AdF6fY/fBa5kcwPhlLMmgmlBO9tAd8Q8R6R?=
 =?Windows-1252?Q?ZfF4KYQnXZe/H8/15XFwlx9/awbTIVsAjxys8F40zuXH1/uz45JZ08VD?=
 =?Windows-1252?Q?1XLa3RPGa3vqy4pWoyRcxbHFzBJKnjgB3c3GKTzKF5ZQk2hnDrRrWEzV?=
 =?Windows-1252?Q?bslFYETUwJQK5xATfFuaaFnUyD/tdXK3zEQSUeDYXyWN6ElwEZJK1j+M?=
 =?Windows-1252?Q?jVo2M2ocM95aVDp92iISFREyInVAV8ju2ZUjjGnOzNJ5qwy1G/P0+WlT?=
 =?Windows-1252?Q?bMZoaDZla0ge3a45GtuPOSseRwDLgLoQci6sie6fHag4KVwCLkAYxgWN?=
 =?Windows-1252?Q?zQXhlexO+b4y+M24J5NSkpiHhAU3Do9zo7Vvx5kxa8JQgAX9zIRMNmdo?=
 =?Windows-1252?Q?s8GmWBFtzVCagQWgXPCsBQT6+dZPSuRzXwKkq1zBknelKeoAV0c0zqTL?=
 =?Windows-1252?Q?T3oEaPXPpneVtsqvDR0EIwa0LfEMj8Y92qfq/rnO9sQCrlU/ibtRb5DN?=
 =?Windows-1252?Q?qRM2vbW9zEDy8O5WBgreJDFkiNDVetLt4L91wNLmpXsPBplGXGVeuZbo?=
 =?Windows-1252?Q?/bRHK0/dzF+QYpy7AyBDfBszdkEerZBGcZRHBIvprI6k+3fIzt/L8pxH?=
 =?Windows-1252?Q?vSXzKTXPKab8PE6SF5HPGC+Wq3RXdgebc0VyB3I/wd22w4pSDw6JY7OV?=
 =?Windows-1252?Q?bd6FYXfRuLJRDMlZeDz9PFrm5A5jO3DRoFCyclNUXlHdrkRYk8s1eckc?=
 =?Windows-1252?Q?LwRode+/kzMU0CqqMgsfMwcrdj/zgXi8Dlrc8YXOdxUY0c5/Eq7Gpk7T?=
 =?Windows-1252?Q?zoF2GjUNvUyFQCaPsPE3DFvzTLM+7uuV3X4cy2Qvhzlb75M40t2pcdIW?=
 =?Windows-1252?Q?PEKjBoaA2Gglw0HNsLvote+n22oY4yBXbBrK9SkS9vVnZaqcIWyb6hRh?=
 =?Windows-1252?Q?GHuQSzJVZqq/KkOBSlULaqgKDhAhdZx0Q867invRY3ZwLhbk1MfxDcTZ?=
 =?Windows-1252?Q?L8HL2V31gwQdVFwdzgJVH23B55xh+5KG2uTHrwsmXxVOVTBcJiBOoosP?=
 =?Windows-1252?Q?Mfb7G/kPkyMgxFn69V0XmRwulmkeDxtRq3AvoiJXbzU+wTtTe/TxlBJf?=
 =?Windows-1252?Q?d1pTs2EWZU5Ue+fv1GstivLyHcTv2Cq6gT+dDUpSkbTpr35RhSko1IRD?=
 =?Windows-1252?Q?AUXP2k0bC8i4F2H7p67eTVOdm5tBAdcFKfHsvyVbgzQAtVAOat+BNbmy?=
 =?Windows-1252?Q?wMlCc2bEXmCsPzEZw9RedguzipjjDe49bdn/1GcS8CzQdIP5N77u0X5M?=
 =?Windows-1252?Q?Zuby2VvWwEQWPsjXt5DOmra2cAbJ/ZwQE30ud0yDg7fUJdOsRGYB2g?=
 =?Windows-1252?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 801b36ca-676a-4132-8702-08dad414b020
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 03:24:14.5389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LFXM7nznxkq9SOEW41CgvtU2StrYF/XMegIv+mtbw2Ig4s1zpHiw/bnczn4Jjo4qm4ht5X7SzQFm9N3/0D1RIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8179

--_000_MW3PR12MB44096CC3AD5CD01D6043B0E79F159MW3PR12MB4409namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

From: Julien Grall <julien@xen.org>
Date: Sunday, October 16, 2022 at 10:48 AM
To: Garhwal, Vikram <vikram.garhwal@amd.com>, qemu-devel@nongnu.org <qemu-d=
evel@nongnu.org>
Cc: Stabellini, Stefano <stefano.stabellini@amd.com>, Peter Maydell <peter.=
maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony P=
erard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, open list:A=
RM TCG CPUs <qemu-arm@nongnu.org>, open list:X86 Xen CPUs <xen-devel@lists.=
xenproject.org>
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
Hi,

There seem to be some missing patches on xen-devel (including the cover
letter). Is that expected?
Not sure what went wrong there. I can see all of these on QEMU-devel. Perha=
ps xen-devel is not in maintainer=92s list for all the xen files?


On 15/10/2022 06:07, Vikram Garhwal wrote:
> Add a new machine xenpv which creates a IOREQ server to register/connect =
with
> Xen Hypervisor.

I don't like the name 'xenpv' because it doesn't convey the fact that
some of the HW may be emulated rather than para-virtualized. In fact one
may only want to use for emulating devices.

Potential name would be 'xen-arm' or re-using 'virt' but with
'accel=3Dxen' to select a Xen layout.

>
> Xen IOREQ connection expect the TARGET_PAGE_SIZE to 4096, and the xenpv m=
achine
> on ARM will have no CPU definitions. We need to define TARGET_PAGE_SIZE
> appropriately ourselves.
>
> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, a=
dds a
> TPM emulator and connects to swtpm running on host machine via chardev so=
cket
> and support TPM functionalities for a guest domain.
>
> Extra command line for aarch64 xenpv QEMU to connect to swtpm:
>      -chardev socket,id=3Dchrtpm,path=3D/tmp/myvtpm2/swtpm-sock \
>      -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
>
> swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpm=
s and
> provides access to TPM functionality over socket, chardev and CUSE interf=
ace.
> Github repo: https://github.com/stefanberger/swtpm
> Example for starting swtpm on host machine:
>      mkdir /tmp/vtpm2
>      swtpm socket --tpmstate dir=3D/tmp/vtpm2 \
>      --ctrl type=3Dunixio,path=3D/tmp/vtpm2/swtpm-sock &

I see patches for QEMU but not Xen. How can this be tested with existing
Xen? Will libxl ever create QEMU?
Will send the patch for libxl Xen separately.


[...]

> +static int xen_init_ioreq(XenIOState *state, unsigned int max_cpus)
> +{
> +    xen_dmod =3D xendevicemodel_open(0, 0);
> +    xen_xc =3D xc_interface_open(0, 0, 0);
> +
> +    if (xen_xc =3D=3D NULL) {

You are checking xen_xc but not xen_dmod. Why?

> +        perror("xen: can't open xen interface\n");
> +        return -1;
> +    }
> +
> +    xen_fmem =3D xenforeignmemory_open(0, 0);
> +    if (xen_fmem =3D=3D NULL) {
> +        perror("xen: can't open xen fmem interface\n");
> +        xc_interface_close(xen_xc);
> +        return -1;
> +    }
> +
> +    xen_register_ioreq(state, max_cpus, xen_memory_listener);
> +
> +    xenstore_record_dm_state(xenstore, "running");
> +
> +    return 0;
> +}
> +
> +static void xen_enable_tpm(void)
> +{
> +/* qemu_find_tpm_be is only available when CONFIG_TPM is enabled. */
> +#ifdef CONFIG_TPM
> +    Error *errp =3D NULL;
> +    DeviceState *dev;
> +    SysBusDevice *busdev;
> +
> +    TPMBackend *be =3D qemu_find_tpm_be("tpm0");
> +    if (be =3D=3D NULL) {
> +        DPRINTF("Couldn't fine the backend for tpm0\n");
> +        return;
> +    }
> +    dev =3D qdev_new(TYPE_TPM_TIS_SYSBUS);
> +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
> +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
> +    busdev =3D SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(busdev, &error_fatal);
> +    sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);

I can't find where GUEST_TPM_BASE is defined. But then the guest memory
layout is not expected to be stable. With your current approach, it
means QEMU would need to be rebuilt for every Xen version. Is it what we
want?
I cannot think of better way to do this. Either we add the the def here or =
rebuild it if GUEST_TPM_BASE changes for each xen version.



> +
> +    DPRINTF("Connected tpmdev at address 0x%lx\n", GUEST_TPM_BASE);
> +#endif
> +}
> +
> +static void xen_arm_init(MachineState *machine)
> +{
> +    XenArmState *xam =3D XEN_ARM(machine);
> +
> +    xam->state =3D  g_new0(XenIOState, 1);
> +
> +    if (xen_init_ioreq(xam->state, machine->smp.cpus)) {
> +        return;

In another patch, you said the IOREQ would be optional. IHMO, I think
this is a bad idea to register it by default because one may only want
to use PV drivers. Registering IOREQ will add unnecessary overhead in Xen.

Furthermore, it means that someone selecting TPM but Xen is not built
with CONFIG_IOREQ=3Dy (BTW This is still a tech preview but there are
security holes on Arm...) will not get an error. Instead, the OS will
until it crashes when trying to access the TPM.

Overall I think it would be better if IOREQ is only registered when a
device requires (like TPM) it *and* throw an error if there is a problem
during the initialization.


> +    } > +
> +    xen_enable_tpm();
> +
> +    return;
> +}
> +
> +static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
> +{
> +
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    mc->desc =3D "Xen Para-virtualized PC";
> +    mc->init =3D xen_arm_init;
> +    mc->max_cpus =3D 1;
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);

Shouldn't this be protected with #ifdef CONFIG_TPM?

> +}
> +
> +static const TypeInfo xen_arm_machine_type =3D {
> +    .name =3D TYPE_XEN_ARM,
> +    .parent =3D TYPE_MACHINE,
> +    .class_init =3D xen_arm_machine_class_init,
> +    .instance_size =3D sizeof(XenArmState),
> +};
> +
> +static void xen_arm_machine_register_types(void)
> +{
> +    type_register_static(&xen_arm_machine_type);
> +}
> +
> +type_init(xen_arm_machine_register_types)
> diff --git a/include/hw/arm/xen_arch_hvm.h b/include/hw/arm/xen_arch_hvm.=
h
> new file mode 100644
> index 0000000000..f645dfec28
> --- /dev/null
> +++ b/include/hw/arm/xen_arch_hvm.h
> @@ -0,0 +1,12 @@
> +#ifndef HW_XEN_ARCH_ARM_HVM_H
> +#define HW_XEN_ARCH_ARM_HVM_H
> +
> +#include <xen/hvm/ioreq.h>
> +void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> +void arch_xen_set_memory(XenIOState *state,
> +                         MemoryRegionSection *section,
> +                         bool add);
> +
> +#undef TARGET_PAGE_SIZE

I am a bit puzzled with this #undef. In the commit message you said that
there will be no CPU definition. So the implications is this should not
be defined.

If it is defined, then what guarantees that all the source will use the
correct value?


> +#define TARGET_PAGE_SIZE 4096

It would be better to use XC_PAGE_SIZE (or similar) rather than
hardcoding it.
Corrected this and sent a v2.


> +#endif
> diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
> index 26674648d8..c7c515220d 100644
> --- a/include/hw/xen/arch_hvm.h
> +++ b/include/hw/xen/arch_hvm.h
> @@ -1,3 +1,5 @@
>   #if defined(TARGET_I386) || defined(TARGET_X86_64)
>   #include "hw/i386/xen_arch_hvm.h"
> +#elif defined(TARGET_ARM) || defined(TARGET_ARM_64)
> +#include "hw/arm/xen_arch_hvm.h"
>   #endif

Cheers,

--
Julien Grall

--_000_MW3PR12MB44096CC3AD5CD01D6043B0E79F159MW3PR12MB4409namp_
Content-Disposition: attachment; filename="winmail.dat"
Content-Transfer-Encoding: base64
Content-Type: application/ms-tnef; name="winmail.dat"

eJ8+IhkvAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEJgAEAIQAAADRERDUxM0FB
M0I0QjMyNDNCQUNDRTE3OTRBRkU1ODI3AFMHAQ2ABAACAAAAAgACAAEFgAMADgAAAOYHDAACAAMA
GAAOAAUAKQEBIIADAA4AAADmBwwAAgADABgADgAFACkBAQiABwAYAAAASVBNLk1pY3Jvc29mdCBN
YWlsLk5vdGUAMQgBBIABADUAAABSZTogW1BBVENIIHYxIDEwLzEyXSBody9hcm06IGludHJvZHVj
ZSB4ZW5wdiBtYWNoaW5lAO4QAQOQBgDkZAAAYQAAAAIBfwABAAAAUQAAADxNVzNQUjEyTUI0NDA5
NkNDM0FENUNEMDFENjA0M0IwRTc5RjE1OUBNVzNQUjEyTUI0NDA5Lm5hbXByZDEyLnByb2Qub3V0
bG9vay5jb20+AAAAAAIBExABAAAAzTAAADxodG1sIHhtbG5zOm89InVybjpzY2hlbWFzLW1pY3Jv
c29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNv
bTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS9vZmZp
Y2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvVFIvUkVDLWh0bWw0MCI+
PGhlYWQ+DQo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRleHQvaHRt
bDsgY2hhcnNldD1XaW5kb3dzLTEyNTIiPjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVudD0i
TWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPjxzdHlsZT48IS0tDQovKiBGb250
IERlZmluaXRpb25zICovDQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJDYW1icmlhIE1hdGgi
Ow0KCXBhbm9zZS0xOjIgNCA1IDMgNSA0IDYgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZh
bWlseTpDYWxpYnJpOw0KCXBhbm9zZS0xOjIgMTUgNSAyIDIgMiA0IDMgMiA0O30NCi8qIFN0eWxl
IERlZmluaXRpb25zICovDQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFs
DQoJe21hcmdpbjowaW47DQoJZm9udC1zaXplOjEwLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJy
aSIsc2Fucy1zZXJpZjt9DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1w
cmlvcml0eTo5OTsNCgljb2xvcjpibHVlOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0K
Lk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXpl
OjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFy
Z2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpX
b3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48L2hlYWQ+PGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9
ImJsdWUiIHZsaW5rPSJwdXJwbGUiIHN0eWxlPSJ3b3JkLXdyYXA6YnJlYWstd29yZCI+PGRpdiBj
bGFzcz0iV29yZFNlY3Rpb24xIj48cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdCI+SGkgSnVsaWVuLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0i
TXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286
cD48L3NwYW4+PC9wPjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0I1
QzRERiAxLjBwdDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj48cCBjbGFzcz0iTXNvTm9ybWFs
IiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OjBpbjttYXJnaW4tcmlnaHQ6MGluO21hcmdpbi1i
b3R0b206MTIuMHB0O21hcmdpbi1sZWZ0Oi41aW4iPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTIuMHB0O2NvbG9yOmJsYWNrIj5Gcm9tOiA8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTIuMHB0O2NvbG9yOmJsYWNrIj5KdWxpZW4gR3JhbGwgJmx0O2p1bGllbkB4ZW4ub3JnJmd0
Ozxicj48Yj5EYXRlOiA8L2I+U3VuZGF5LCBPY3RvYmVyIDE2LCAyMDIyIGF0IDEwOjQ4IEFNPGJy
PjxiPlRvOiA8L2I+R2FyaHdhbCwgVmlrcmFtICZsdDt2aWtyYW0uZ2FyaHdhbEBhbWQuY29tJmd0
OywgcWVtdS1kZXZlbEBub25nbnUub3JnICZsdDtxZW11LWRldmVsQG5vbmdudS5vcmcmZ3Q7PGJy
PjxiPkNjOiA8L2I+U3RhYmVsbGluaSwgU3RlZmFubyAmbHQ7c3RlZmFuby5zdGFiZWxsaW5pQGFt
ZC5jb20mZ3Q7LCBQZXRlciBNYXlkZWxsICZsdDtwZXRlci5tYXlkZWxsQGxpbmFyby5vcmcmZ3Q7
LCBTdGVmYW5vIFN0YWJlbGxpbmkgJmx0O3NzdGFiZWxsaW5pQGtlcm5lbC5vcmcmZ3Q7LCBBbnRo
b255IFBlcmFyZCAmbHQ7YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbSZndDssIFBhdWwgRHVycmFu
dCAmbHQ7cGF1bEB4ZW4ub3JnJmd0Oywgb3BlbiBsaXN0OkFSTSBUQ0cgQ1BVcyAmbHQ7cWVtdS1h
cm1Abm9uZ251Lm9yZyZndDssIG9wZW4gbGlzdDpYODYgWGVuIENQVXMgJmx0O3hlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZyZndDs8YnI+PGI+U3ViamVjdDogPC9iPlJlOiBbUEFUQ0ggdjEg
MTAvMTJdIGh3L2FybTogaW50cm9kdWNlIHhlbnB2IG1hY2hpbmU8bzpwPjwvbzpwPjwvc3Bhbj48
L3A+PC9kaXY+PGRpdj48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWxlZnQ6LjVp
biI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkhpLDxicj48YnI+VGhlcmUgc2VlbSB0
byBiZSBzb21lIG1pc3NpbmcgcGF0Y2hlcyBvbiB4ZW4tZGV2ZWwgKGluY2x1ZGluZyB0aGUgY292
ZXIgPGJyPmxldHRlcikuIElzIHRoYXQgZXhwZWN0ZWQ/PG86cD48L286cD48L3NwYW4+PC9wPjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5Ob3Qgc3Vy
ZSB3aGF0IHdlbnQgd3JvbmcgdGhlcmUuIEkgY2FuIHNlZSBhbGwgb2YgdGhlc2Ugb24gUUVNVS1k
ZXZlbC4gUGVyaGFwcyB4ZW4tZGV2ZWwgaXMgbm90IGluIG1haW50YWluZXKScyBsaXN0IGZvciBh
bGwgdGhlIHhlbiBmaWxlcz88bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1h
bCIgc3R5bGU9Im1hcmdpbi1sZWZ0Oi41aW4iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij48YnI+PGJyPk9uIDE1LzEwLzIwMjIgMDY6MDcsIFZpa3JhbSBHYXJod2FsIHdyb3RlOjxicj4m
Z3Q7IEFkZCBhIG5ldyBtYWNoaW5lIHhlbnB2IHdoaWNoIGNyZWF0ZXMgYSBJT1JFUSBzZXJ2ZXIg
dG8gcmVnaXN0ZXIvY29ubmVjdCB3aXRoPGJyPiZndDsgWGVuIEh5cGVydmlzb3IuPGJyPjxicj5J
IGRvbid0IGxpa2UgdGhlIG5hbWUgJ3hlbnB2JyBiZWNhdXNlIGl0IGRvZXNuJ3QgY29udmV5IHRo
ZSBmYWN0IHRoYXQgPGJyPnNvbWUgb2YgdGhlIEhXIG1heSBiZSBlbXVsYXRlZCByYXRoZXIgdGhh
biBwYXJhLXZpcnR1YWxpemVkLiBJbiBmYWN0IG9uZSA8YnI+bWF5IG9ubHkgd2FudCB0byB1c2Ug
Zm9yIGVtdWxhdGluZyBkZXZpY2VzLjxicj48YnI+UG90ZW50aWFsIG5hbWUgd291bGQgYmUgJ3hl
bi1hcm0nIG9yIHJlLXVzaW5nICd2aXJ0JyBidXQgd2l0aCA8YnI+J2FjY2VsPXhlbicgdG8gc2Vs
ZWN0IGEgWGVuIGxheW91dC48YnI+PGJyPiZndDsgPGJyPiZndDsgWGVuIElPUkVRIGNvbm5lY3Rp
b24gZXhwZWN0IHRoZSBUQVJHRVRfUEFHRV9TSVpFIHRvIDQwOTYsIGFuZCB0aGUgeGVucHYgbWFj
aGluZTxicj4mZ3Q7IG9uIEFSTSB3aWxsIGhhdmUgbm8gQ1BVIGRlZmluaXRpb25zLiBXZSBuZWVk
IHRvIGRlZmluZSBUQVJHRVRfUEFHRV9TSVpFPGJyPiZndDsgYXBwcm9wcmlhdGVseSBvdXJzZWx2
ZXMuPGJyPiZndDsgPGJyPiZndDsgT3B0aW9uYWw6IFdoZW4gQ09ORklHX1RQTSBpcyBlbmFibGVk
LCBpdCBhbHNvIGNyZWF0ZXMgYSB0cG0tdGlzLWRldmljZSwgYWRkcyBhPGJyPiZndDsgVFBNIGVt
dWxhdG9yIGFuZCBjb25uZWN0cyB0byBzd3RwbSBydW5uaW5nIG9uIGhvc3QgbWFjaGluZSB2aWEg
Y2hhcmRldiBzb2NrZXQ8YnI+Jmd0OyBhbmQgc3VwcG9ydCBUUE0gZnVuY3Rpb25hbGl0aWVzIGZv
ciBhIGd1ZXN0IGRvbWFpbi48YnI+Jmd0OyA8YnI+Jmd0OyBFeHRyYSBjb21tYW5kIGxpbmUgZm9y
IGFhcmNoNjQgeGVucHYgUUVNVSB0byBjb25uZWN0IHRvIHN3dHBtOjxicj4mZ3Q7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IC1jaGFyZGV2IHNvY2tldCxpZD1jaHJ0cG0scGF0aD0vdG1w
L215dnRwbTIvc3d0cG0tc29jayBcPGJyPiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsgLXRwbWRldiBlbXVsYXRvcixpZD10cG0wLGNoYXJkZXY9Y2hydHBtIFw8YnI+Jmd0OyA8YnI+
Jmd0OyBzd3RwbSBpbXBsZW1lbnRzIGEgVFBNIHNvZnR3YXJlIGVtdWxhdG9yKFRQTSAxLjIgJmFt
cDsgVFBNIDIpIGJ1aWx0IG9uIGxpYnRwbXMgYW5kPGJyPiZndDsgcHJvdmlkZXMgYWNjZXNzIHRv
IFRQTSBmdW5jdGlvbmFsaXR5IG92ZXIgc29ja2V0LCBjaGFyZGV2IGFuZCBDVVNFIGludGVyZmFj
ZS48YnI+Jmd0OyBHaXRodWIgcmVwbzogPC9zcGFuPjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNv
bS9zdGVmYW5iZXJnZXIvc3d0cG0iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5odHRw
czovL2dpdGh1Yi5jb20vc3RlZmFuYmVyZ2VyL3N3dHBtPC9zcGFuPjwvYT48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExLjBwdCI+PGJyPiZndDsgRXhhbXBsZSBmb3Igc3RhcnRpbmcgc3d0cG0gb24g
aG9zdCBtYWNoaW5lOjxicj4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IG1rZGly
IC90bXAvdnRwbTI8YnI+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBzd3RwbSBz
b2NrZXQgLS10cG1zdGF0ZSBkaXI9L3RtcC92dHBtMiBcPGJyPiZndDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgLS1jdHJsIHR5cGU9dW5peGlvLHBhdGg9L3RtcC92dHBtMi9zd3RwbS1z
b2NrICZhbXA7PGJyPjxicj5JIHNlZSBwYXRjaGVzIGZvciBRRU1VIGJ1dCBub3QgWGVuLiBIb3cg
Y2FuIHRoaXMgYmUgdGVzdGVkIHdpdGggZXhpc3RpbmcgPGJyPlhlbj8gV2lsbCBsaWJ4bCBldmVy
IGNyZWF0ZSBRRU1VPzxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+V2lsbCBzZW5kIHRoZSBwYXRjaCBmb3IgbGli
eGwgWGVuIHNlcGFyYXRlbHkuPG86cD48L286cD48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3Jt
YWwiIHN0eWxlPSJtYXJnaW4tbGVmdDouNWluIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dCI+PGJyPjxicj5bLi4uXTxicj48YnI+Jmd0OyArc3RhdGljIGludCB4ZW5faW5pdF9pb3JlcShY
ZW5JT1N0YXRlICpzdGF0ZSwgdW5zaWduZWQgaW50IG1heF9jcHVzKTxicj4mZ3Q7ICt7PGJyPiZn
dDsgKyZuYnNwOyZuYnNwOyZuYnNwOyB4ZW5fZG1vZCA9IHhlbmRldmljZW1vZGVsX29wZW4oMCwg
MCk7PGJyPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyB4ZW5feGMgPSB4Y19pbnRlcmZhY2Vfb3Bl
bigwLCAwLCAwKTs8YnI+Jmd0OyArPGJyPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyBpZiAoeGVu
X3hjID09IE5VTEwpIHs8YnI+PGJyPllvdSBhcmUgY2hlY2tpbmcgeGVuX3hjIGJ1dCBub3QgeGVu
X2Rtb2QuIFdoeT88YnI+PGJyPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyBwZXJyb3IoJnF1b3Q7eGVuOiBjYW4ndCBvcGVuIHhlbiBpbnRlcmZhY2VcbiZx
dW90Oyk7PGJyPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyByZXR1cm4gLTE7PGJyPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyB9PGJyPiZndDsgKzxicj4m
Z3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsgeGVuX2ZtZW0gPSB4ZW5mb3JlaWdubWVtb3J5X29wZW4o
MCwgMCk7PGJyPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyBpZiAoeGVuX2ZtZW0gPT0gTlVMTCkg
ezxicj4mZ3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcGVy
cm9yKCZxdW90O3hlbjogY2FuJ3Qgb3BlbiB4ZW4gZm1lbSBpbnRlcmZhY2VcbiZxdW90Oyk7PGJy
PiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB4Y19pbnRl
cmZhY2VfY2xvc2UoeGVuX3hjKTs8YnI+Jmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IHJldHVybiAtMTs8YnI+Jmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7IH08
YnI+Jmd0OyArPGJyPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyB4ZW5fcmVnaXN0ZXJfaW9yZXEo
c3RhdGUsIG1heF9jcHVzLCB4ZW5fbWVtb3J5X2xpc3RlbmVyKTs8YnI+Jmd0OyArPGJyPiZndDsg
KyZuYnNwOyZuYnNwOyZuYnNwOyB4ZW5zdG9yZV9yZWNvcmRfZG1fc3RhdGUoeGVuc3RvcmUsICZx
dW90O3J1bm5pbmcmcXVvdDspOzxicj4mZ3Q7ICs8YnI+Jmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7
IHJldHVybiAwOzxicj4mZ3Q7ICt9PGJyPiZndDsgKzxicj4mZ3Q7ICtzdGF0aWMgdm9pZCB4ZW5f
ZW5hYmxlX3RwbSh2b2lkKTxicj4mZ3Q7ICt7PGJyPiZndDsgKy8qIHFlbXVfZmluZF90cG1fYmUg
aXMgb25seSBhdmFpbGFibGUgd2hlbiBDT05GSUdfVFBNIGlzIGVuYWJsZWQuICovPGJyPiZndDsg
KyNpZmRlZiBDT05GSUdfVFBNPGJyPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyBFcnJvciAqZXJy
cCA9IE5VTEw7PGJyPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyBEZXZpY2VTdGF0ZSAqZGV2Ozxi
cj4mZ3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsgU3lzQnVzRGV2aWNlICpidXNkZXY7PGJyPiZndDsg
Kzxicj4mZ3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsgVFBNQmFja2VuZCAqYmUgPSBxZW11X2ZpbmRf
dHBtX2JlKCZxdW90O3RwbTAmcXVvdDspOzxicj4mZ3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsgaWYg
KGJlID09IE5VTEwpIHs8YnI+Jmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IERQUklOVEYoJnF1b3Q7Q291bGRuJ3QgZmluZSB0aGUgYmFja2VuZCBmb3IgdHBt
MFxuJnF1b3Q7KTs8YnI+Jmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IHJldHVybjs8YnI+Jmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+Jmd0OyArJm5i
c3A7Jm5ic3A7Jm5ic3A7IGRldiA9IHFkZXZfbmV3KFRZUEVfVFBNX1RJU19TWVNCVVMpOzxicj4m
Z3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsgb2JqZWN0X3Byb3BlcnR5X3NldF9saW5rKE9CSkVDVChk
ZXYpLCAmcXVvdDt0cG1kZXYmcXVvdDssIE9CSkVDVChiZSksICZhbXA7ZXJycCk7PGJyPiZndDsg
KyZuYnNwOyZuYnNwOyZuYnNwOyBvYmplY3RfcHJvcGVydHlfc2V0X3N0cihPQkpFQ1QoZGV2KSwg
JnF1b3Q7dHBtZGV2JnF1b3Q7LCBiZS0mZ3Q7aWQsICZhbXA7ZXJycCk7PGJyPiZndDsgKyZuYnNw
OyZuYnNwOyZuYnNwOyBidXNkZXYgPSBTWVNfQlVTX0RFVklDRShkZXYpOzxicj4mZ3Q7ICsmbmJz
cDsmbmJzcDsmbmJzcDsgc3lzYnVzX3JlYWxpemVfYW5kX3VucmVmKGJ1c2RldiwgJmFtcDtlcnJv
cl9mYXRhbCk7PGJyPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyBzeXNidXNfbW1pb19tYXAoYnVz
ZGV2LCAwLCBHVUVTVF9UUE1fQkFTRSk7PGJyPjxicj5JIGNhbid0IGZpbmQgd2hlcmUgR1VFU1Rf
VFBNX0JBU0UgaXMgZGVmaW5lZC4gQnV0IHRoZW4gdGhlIGd1ZXN0IG1lbW9yeSA8YnI+bGF5b3V0
IGlzIG5vdCBleHBlY3RlZCB0byBiZSBzdGFibGUuIFdpdGggeW91ciBjdXJyZW50IGFwcHJvYWNo
LCBpdCA8YnI+bWVhbnMgUUVNVSB3b3VsZCBuZWVkIHRvIGJlIHJlYnVpbHQgZm9yIGV2ZXJ5IFhl
biB2ZXJzaW9uLiBJcyBpdCB3aGF0IHdlIDxicj53YW50PzxvOnA+PC9vOnA+PC9zcGFuPjwvcD48
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SSBjYW5u
b3QgdGhpbmsgb2YgYmV0dGVyIHdheSB0byBkbyB0aGlzLiBFaXRoZXIgd2UgYWRkIHRoZSB0aGUg
ZGVmIGhlcmUgb3IgcmVidWlsZCBpdCBpZiBHVUVTVF9UUE1fQkFTRSBjaGFuZ2VzIGZvciBlYWNo
IHhlbiB2ZXJzaW9uLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9w
PjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW4tbGVmdDouNWluIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdCI+PGJyPjxicj4mZ3Q7ICs8YnI+Jmd0OyArJm5ic3A7Jm5ic3A7
Jm5ic3A7IERQUklOVEYoJnF1b3Q7Q29ubmVjdGVkIHRwbWRldiBhdCBhZGRyZXNzIDB4JWx4XG4m
cXVvdDssIEdVRVNUX1RQTV9CQVNFKTs8YnI+Jmd0OyArI2VuZGlmPGJyPiZndDsgK308YnI+Jmd0
OyArPGJyPiZndDsgK3N0YXRpYyB2b2lkIHhlbl9hcm1faW5pdChNYWNoaW5lU3RhdGUgKm1hY2hp
bmUpPGJyPiZndDsgK3s8YnI+Jmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7IFhlbkFybVN0YXRlICp4
YW0gPSBYRU5fQVJNKG1hY2hpbmUpOzxicj4mZ3Q7ICs8YnI+Jmd0OyArJm5ic3A7Jm5ic3A7Jm5i
c3A7IHhhbS0mZ3Q7c3RhdGUgPSZuYnNwOyBnX25ldzAoWGVuSU9TdGF0ZSwgMSk7PGJyPiZndDsg
Kzxicj4mZ3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKHhlbl9pbml0X2lvcmVxKHhhbS0mZ3Q7
c3RhdGUsIG1hY2hpbmUtJmd0O3NtcC5jcHVzKSkgezxicj4mZ3Q7ICsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0dXJuOzxicj48YnI+SW4gYW5vdGhlciBwYXRj
aCwgeW91IHNhaWQgdGhlIElPUkVRIHdvdWxkIGJlIG9wdGlvbmFsLiBJSE1PLCBJIHRoaW5rIDxi
cj50aGlzIGlzIGEgYmFkIGlkZWEgdG8gcmVnaXN0ZXIgaXQgYnkgZGVmYXVsdCBiZWNhdXNlIG9u
ZSBtYXkgb25seSB3YW50IDxicj50byB1c2UgUFYgZHJpdmVycy4gUmVnaXN0ZXJpbmcgSU9SRVEg
d2lsbCBhZGQgdW5uZWNlc3Nhcnkgb3ZlcmhlYWQgaW4gWGVuLjxicj48YnI+RnVydGhlcm1vcmUs
IGl0IG1lYW5zIHRoYXQgc29tZW9uZSBzZWxlY3RpbmcgVFBNIGJ1dCBYZW4gaXMgbm90IGJ1aWx0
IDxicj53aXRoIENPTkZJR19JT1JFUT15IChCVFcgVGhpcyBpcyBzdGlsbCBhIHRlY2ggcHJldmll
dyBidXQgdGhlcmUgYXJlIDxicj5zZWN1cml0eSBob2xlcyBvbiBBcm0uLi4pIHdpbGwgbm90IGdl
dCBhbiBlcnJvci4gSW5zdGVhZCwgdGhlIE9TIHdpbGwgPGJyPnVudGlsIGl0IGNyYXNoZXMgd2hl
biB0cnlpbmcgdG8gYWNjZXNzIHRoZSBUUE0uPGJyPjxicj5PdmVyYWxsIEkgdGhpbmsgaXQgd291
bGQgYmUgYmV0dGVyIGlmIElPUkVRIGlzIG9ubHkgcmVnaXN0ZXJlZCB3aGVuIGEgPGJyPmRldmlj
ZSByZXF1aXJlcyAobGlrZSBUUE0pIGl0ICphbmQqIHRocm93IGFuIGVycm9yIGlmIHRoZXJlIGlz
IGEgcHJvYmxlbSA8YnI+ZHVyaW5nIHRoZSBpbml0aWFsaXphdGlvbi48bzpwPjwvbzpwPjwvc3Bh
bj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbi1sZWZ0Oi41aW4iPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48YnI+PGJyPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNw
OyB9ICZndDsgKzxicj4mZ3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsgeGVuX2VuYWJsZV90cG0oKTs8
YnI+Jmd0OyArPGJyPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyByZXR1cm47PGJyPiZndDsgK308
YnI+Jmd0OyArPGJyPiZndDsgK3N0YXRpYyB2b2lkIHhlbl9hcm1fbWFjaGluZV9jbGFzc19pbml0
KE9iamVjdENsYXNzICpvYywgdm9pZCAqZGF0YSk8YnI+Jmd0OyArezxicj4mZ3Q7ICs8YnI+Jmd0
OyArJm5ic3A7Jm5ic3A7Jm5ic3A7IE1hY2hpbmVDbGFzcyAqbWMgPSBNQUNISU5FX0NMQVNTKG9j
KTs8YnI+Jmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7IG1jLSZndDtkZXNjID0gJnF1b3Q7WGVuIFBh
cmEtdmlydHVhbGl6ZWQgUEMmcXVvdDs7PGJyPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyBtYy0m
Z3Q7aW5pdCA9IHhlbl9hcm1faW5pdDs8YnI+Jmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7IG1jLSZn
dDttYXhfY3B1cyA9IDE7PGJyPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyBtYWNoaW5lX2NsYXNz
X2FsbG93X2R5bmFtaWNfc3lzYnVzX2RldihtYywgVFlQRV9UUE1fVElTX1NZU0JVUyk7PGJyPjxi
cj5TaG91bGRuJ3QgdGhpcyBiZSBwcm90ZWN0ZWQgd2l0aCAjaWZkZWYgQ09ORklHX1RQTT88YnI+
PGJyPiZndDsgK308YnI+Jmd0OyArPGJyPiZndDsgK3N0YXRpYyBjb25zdCBUeXBlSW5mbyB4ZW5f
YXJtX21hY2hpbmVfdHlwZSA9IHs8YnI+Jmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7IC5uYW1lID0g
VFlQRV9YRU5fQVJNLDxicj4mZ3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsgLnBhcmVudCA9IFRZUEVf
TUFDSElORSw8YnI+Jmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7IC5jbGFzc19pbml0ID0geGVuX2Fy
bV9tYWNoaW5lX2NsYXNzX2luaXQsPGJyPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyAuaW5zdGFu
Y2Vfc2l6ZSA9IHNpemVvZihYZW5Bcm1TdGF0ZSksPGJyPiZndDsgK307PGJyPiZndDsgKzxicj4m
Z3Q7ICtzdGF0aWMgdm9pZCB4ZW5fYXJtX21hY2hpbmVfcmVnaXN0ZXJfdHlwZXModm9pZCk8YnI+
Jmd0OyArezxicj4mZ3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsgdHlwZV9yZWdpc3Rlcl9zdGF0aWMo
JmFtcDt4ZW5fYXJtX21hY2hpbmVfdHlwZSk7PGJyPiZndDsgK308YnI+Jmd0OyArPGJyPiZndDsg
K3R5cGVfaW5pdCh4ZW5fYXJtX21hY2hpbmVfcmVnaXN0ZXJfdHlwZXMpPGJyPiZndDsgZGlmZiAt
LWdpdCBhL2luY2x1ZGUvaHcvYXJtL3hlbl9hcmNoX2h2bS5oIGIvaW5jbHVkZS9ody9hcm0veGVu
X2FyY2hfaHZtLmg8YnI+Jmd0OyBuZXcgZmlsZSBtb2RlIDEwMDY0NDxicj4mZ3Q7IGluZGV4IDAw
MDAwMDAwMDAuLmY2NDVkZmVjMjg8YnI+Jmd0OyAtLS0gL2Rldi9udWxsPGJyPiZndDsgKysrIGIv
aW5jbHVkZS9ody9hcm0veGVuX2FyY2hfaHZtLmg8YnI+Jmd0OyBAQCAtMCwwICsxLDEyIEBAPGJy
PiZndDsgKyNpZm5kZWYgSFdfWEVOX0FSQ0hfQVJNX0hWTV9IPGJyPiZndDsgKyNkZWZpbmUgSFdf
WEVOX0FSQ0hfQVJNX0hWTV9IPGJyPiZndDsgKzxicj4mZ3Q7ICsjaW5jbHVkZSAmbHQ7eGVuL2h2
bS9pb3JlcS5oJmd0Ozxicj4mZ3Q7ICt2b2lkIGFyY2hfaGFuZGxlX2lvcmVxKFhlbklPU3RhdGUg
KnN0YXRlLCBpb3JlcV90ICpyZXEpOzxicj4mZ3Q7ICt2b2lkIGFyY2hfeGVuX3NldF9tZW1vcnko
WGVuSU9TdGF0ZSAqc3RhdGUsPGJyPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyBNZW1vcnlSZWdpb25TZWN0aW9uICpzZWN0aW9uLDxicj4mZ3Q7ICsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgYm9vbCBhZGQpOzxicj4mZ3Q7ICs8YnI+Jmd0OyArI3VuZGVmIFRBUkdF
VF9QQUdFX1NJWkU8YnI+PGJyPkkgYW0gYSBiaXQgcHV6emxlZCB3aXRoIHRoaXMgI3VuZGVmLiBJ
biB0aGUgY29tbWl0IG1lc3NhZ2UgeW91IHNhaWQgdGhhdCA8YnI+dGhlcmUgd2lsbCBiZSBubyBD
UFUgZGVmaW5pdGlvbi4gU28gdGhlIGltcGxpY2F0aW9ucyBpcyB0aGlzIHNob3VsZCBub3QgPGJy
PmJlIGRlZmluZWQuPGJyPjxicj5JZiBpdCBpcyBkZWZpbmVkLCB0aGVuIHdoYXQgZ3VhcmFudGVl
cyB0aGF0IGFsbCB0aGUgc291cmNlIHdpbGwgdXNlIHRoZSA8YnI+Y29ycmVjdCB2YWx1ZT88YnI+
PGJyPjxicj4mZ3Q7ICsjZGVmaW5lIFRBUkdFVF9QQUdFX1NJWkUgNDA5Njxicj48YnI+SXQgd291
bGQgYmUgYmV0dGVyIHRvIHVzZSBYQ19QQUdFX1NJWkUgKG9yIHNpbWlsYXIpIHJhdGhlciB0aGFu
IDxicj5oYXJkY29kaW5nIGl0LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+Q29ycmVjdGVkIHRoaXMgYW5kIHNl
bnQgYSB2Mi48YnI+PGJyPjxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFs
IiBzdHlsZT0ibWFyZ2luLWxlZnQ6LjVpbiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQi
Pjxicj4mZ3Q7ICsjZW5kaWY8YnI+Jmd0OyBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody94ZW4vYXJj
aF9odm0uaCBiL2luY2x1ZGUvaHcveGVuL2FyY2hfaHZtLmg8YnI+Jmd0OyBpbmRleCAyNjY3NDY0
OGQ4Li5jN2M1MTUyMjBkIDEwMDY0NDxicj4mZ3Q7IC0tLSBhL2luY2x1ZGUvaHcveGVuL2FyY2hf
aHZtLmg8YnI+Jmd0OyArKysgYi9pbmNsdWRlL2h3L3hlbi9hcmNoX2h2bS5oPGJyPiZndDsgQEAg
LTEsMyArMSw1IEBAPGJyPiZndDsmbmJzcDsmbmJzcDsgI2lmIGRlZmluZWQoVEFSR0VUX0kzODYp
IHx8IGRlZmluZWQoVEFSR0VUX1g4Nl82NCk8YnI+Jmd0OyZuYnNwOyZuYnNwOyAjaW5jbHVkZSAm
cXVvdDtody9pMzg2L3hlbl9hcmNoX2h2bS5oJnF1b3Q7PGJyPiZndDsgKyNlbGlmIGRlZmluZWQo
VEFSR0VUX0FSTSkgfHwgZGVmaW5lZChUQVJHRVRfQVJNXzY0KTxicj4mZ3Q7ICsjaW5jbHVkZSAm
cXVvdDtody9hcm0veGVuX2FyY2hfaHZtLmgmcXVvdDs8YnI+Jmd0OyZuYnNwOyZuYnNwOyAjZW5k
aWY8YnI+PGJyPkNoZWVycyw8YnI+PGJyPi0tIDxicj5KdWxpZW4gR3JhbGw8bzpwPjwvbzpwPjwv
c3Bhbj48L3A+PC9kaXY+PC9kaXY+PC9ib2R5PjwvaHRtbD4AAAAfAEIAAQAAACAAAABHAGEAcgBo
AHcAYQBsACwAIABWAGkAawByAGEAbQAAAB8AZQABAAAALgAAAHYAaQBrAHIAYQBtAC4AZwBhAHIA
aAB3AGEAbABAAGEAbQBkAC4AYwBvAG0AAAAAAB8AZAABAAAACgAAAFMATQBUAFAAAAAAAAIBQQAB
AAAAcAAAAAAAAACBKx+kvqMQGZ1uAN0BD1QCAAAAgEcAYQByAGgAdwBhAGwALAAgAFYAaQBrAHIA
YQBtAAAAUwBNAFQAUAAAAHYAaQBrAHIAYQBtAC4AZwBhAHIAaAB3AGEAbABAAGEAbQBkAC4AYwBv
AG0AAAAfAAJdAQAAAC4AAAB2AGkAawByAGEAbQAuAGcAYQByAGgAdwBhAGwAQABhAG0AZAAuAGMA
bwBtAAAAAAAfAOVfAQAAADYAAABzAGkAcAA6AHYAaQBrAHIAYQBtAC4AZwBhAHIAaAB3AGEAbABA
AGEAbQBkAC4AYwBvAG0AAAAAAB8AGgwBAAAAIAAAAEcAYQByAGgAdwBhAGwALAAgAFYAaQBrAHIA
YQBtAAAAHwAfDAEAAAAuAAAAdgBpAGsAcgBhAG0ALgBnAGEAcgBoAHcAYQBsAEAAYQBtAGQALgBj
AG8AbQAAAAAAHwAeDAEAAAAKAAAAUwBNAFQAUAAAAAAAAgEZDAEAAABwAAAAAAAAAIErH6S+oxAZ
nW4A3QEPVAIAAACARwBhAHIAaAB3AGEAbAAsACAAVgBpAGsAcgBhAG0AAABTAE0AVABQAAAAdgBp
AGsAcgBhAG0ALgBnAGEAcgBoAHcAYQBsAEAAYQBtAGQALgBjAG8AbQAAAB8AAV0BAAAALgAAAHYA
aQBrAHIAYQBtAC4AZwBhAHIAaAB3AGEAbABAAGEAbQBkAC4AYwBvAG0AAAAAAAsAQDoBAAAAHwAa
AAEAAAASAAAASQBQAE0ALgBOAG8AdABlAAAAAAADAPE/CQQAAAsAQDoBAAAAAwD9P+QEAAACAQsw
AQAAABAAAABN1ROqO0syQ7rM4XlK/lgnAwAXAAEAAABAADkAAINSjf0F2QFAAAgwAl6ijf0F2QEL
ACMAAAAAAAMAJgAAAAAACwApAAAAAAADAC4AAAAAAAMANgAAAAAAHwBwAAEAAABiAAAAWwBQAEEA
VABDAEgAIAB2ADEAIAAxADAALwAxADIAXQAgAGgAdwAvAGEAcgBtADoAIABpAG4AdAByAG8AZAB1
AGMAZQAgAHgAZQBuAHAAdgAgAG0AYQBjAGgAaQBuAGUAAAAAAAIBcQABAAAAIAAAAAEB2OBUNeUU
knXWCxdCp+McYCTDMbeuEU4zgIBGt2GGCwAGDAAAAAAfADUQAQAAAKIAAAA8AE0AVwAzAFAAUgAx
ADIATQBCADQANAAwADkANgBDAEMAMwBBAEQANQBDAEQAMAAxAEQANgAwADQAMwBCADAARQA3ADkA
RgAxADUAOQBAAE0AVwAzAFAAUgAxADIATQBCADQANAAwADkALgBuAGEAbQBwAHIAZAAxADIALgBw
AHIAbwBkAC4AbwB1AHQAbABvAG8AawAuAGMAbwBtAD4AAAAAAB8AORABAAAAHAEAADwAMgAwADIA
MgAxADAAMQA1ADAANQAwADcANQAwAC4ANAAxADgANQAtADEALQB2AGkAawByAGEAbQAuAGcAYQBy
AGgAdwBhAGwAQABhAG0AZAAuAGMAbwBtAD4AIAA8ADIAMAAyADIAMQAwADEANQAwADUAMAA3ADUA
MAAuADQAMQA4ADUALQAxADEALQB2AGkAawByAGEAbQAuAGcAYQByAGgAdwBhAGwAQABhAG0AZAAu
AGMAbwBtAD4AIAA8ADMAZQA1ADAANABiADEAYgAtADEAOQA3AGQALQBiADcANwBiAC0AMQA2AGUA
MQAtADgANgA1ADMAMABlAGIAMwBkADYANABjAEAAeABlAG4ALgBvAHIAZwA+AAAAHwBCEAEAAABe
AAAAPAAzAGUANQAwADQAYgAxAGIALQAxADkANwBkAC0AYgA3ADcAYgAtADEANgBlADEALQA4ADYA
NQAzADAAZQBiADMAZAA2ADQAYwBAAHgAZQBuAC4AbwByAGcAPgAAAAAAAwATEgAAAABAAAcwICdo
HuME2QECARMwAQAAABAAAADlFJJ11gsXQqfjHGAkwzG3AgEUMAEAAAAMAAAAKAMAANQ6Aij0Riue
AwBbMwEAAAADAF4zEAAAAAMAWjYAAAAAAwBjNv8HAAADAGg2DQAAAAsA+jYBAAAAHwDZPwEAAAAA
AgAASABpACAASgB1AGwAaQBlAG4ALAANAAoADQAKAEYAcgBvAG0AOgAgAEoAdQBsAGkAZQBuACAA
RwByAGEAbABsACAAPABqAHUAbABpAGUAbgBAAHgAZQBuAC4AbwByAGcAPgANAAoARABhAHQAZQA6
ACAAUwB1AG4AZABhAHkALAAgAE8AYwB0AG8AYgBlAHIAIAAxADYALAAgADIAMAAyADIAIABhAHQA
IAAxADAAOgA0ADgAIABBAE0ADQAKAFQAbwA6ACAARwBhAHIAaAB3AGEAbAAsACAAVgBpAGsAcgBh
AG0AIAA8AHYAaQBrAHIAYQBtAC4AZwBhAHIAaAB3AGEAbABAAGEAbQBkAC4AYwBvAG0APgAsACAA
cQBlAG0AdQAtAGQAZQB2AGUAbABAAG4AbwBuAGcAbgB1AC4AbwByAGcAIAA8AHEAZQBtAHUALQBk
AGUAdgBlAGwAQABuAG8AbgBnAG4AdQAuAG8AcgBnAD4ADQAKAEMAYwA6ACAAUwB0AGEAYgBlAGwA
bABpAG4AaQAsACAAUwB0AGUAZgBhAG4AbwAgADwAcwB0AGUAZgBhAG4AbwAuAHMAdABhAGIAZQBs
AGwAaQBuAGkAQABhAG0AZAAuAGMAbwBtAD4ALAAgAFAAZQB0AGUAcgAgAE0AYQB5AGQAZQBsAGwA
AAADAN4/5AQAAB8A+D8BAAAAIAAAAEcAYQByAGgAdwBhAGwALAAgAFYAaQBrAHIAYQBtAAAAHwD6
PwEAAAAgAAAARwBhAHIAaAB3AGEAbAAsACAAVgBpAGsAcgBhAG0AAAAfACJAAQAAAAYAAABFAFgA
AAAAAB8AI0ABAAAAAgEAAC8ATwA9AEUAWABDAEgAQQBOAEcARQBMAEEAQgBTAC8ATwBVAD0ARQBY
AEMASABBAE4ARwBFACAAQQBEAE0ASQBOAEkAUwBUAFIAQQBUAEkAVgBFACAARwBSAE8AVQBQACAA
KABGAFkARABJAEIATwBIAEYAMgAzAFMAUABEAEwAVAApAC8AQwBOAD0AUgBFAEMASQBQAEkARQBO
AFQAUwAvAEMATgA9ADUARAAzADMAMQBCADAARABBAEIAMQA1ADQANwA0AEEAQQA3AEUAQgBGADcA
RAAwAEUAQwA5AEYAMAA1ADcARQAtAEcAQQBSAEgAVwBBAEwALAAgAFYASQAAAAAAHwAkQAEAAAAG
AAAARQBYAAAAAAAfACVAAQAAAAIBAAAvAE8APQBFAFgAQwBIAEEATgBHAEUATABBAEIAUwAvAE8A
VQA9AEUAWABDAEgAQQBOAEcARQAgAEEARABNAEkATgBJAFMAVABSAEEAVABJAFYARQAgAEcAUgBP
AFUAUAAgACgARgBZAEQASQBCAE8ASABGADIAMwBTAFAARABMAFQAKQAvAEMATgA9AFIARQBDAEkA
UABJAEUATgBUAFMALwBDAE4APQA1AEQAMwAzADEAQgAwAEQAQQBCADEANQA0ADcANABBAEEANwBF
AEIARgA3AEQAMABFAEMAOQBGADAANQA3AEUALQBHAEEAUgBIAFcAQQBMACwAIABWAEkAAAAAAB8A
MEABAAAAIAAAAEcAYQByAGgAdwBhAGwALAAgAFYAaQBrAHIAYQBtAAAAHwAxQAEAAAAgAAAARwBh
AHIAaAB3AGEAbAAsACAAVgBpAGsAcgBhAG0AAAAfADhAAQAAACAAAABHAGEAcgBoAHcAYQBsACwA
IABWAGkAawByAGEAbQAAAB8AOUABAAAAIAAAAEcAYQByAGgAdwBhAGwALAAgAFYAaQBrAHIAYQBt
AAAAAwBZQAAAAAADAFpAAAAAAAMAN1ABAAAAHwAKXQEAAAAuAAAAdgBpAGsAcgBhAG0ALgBnAGEA
cgBoAHcAYQBsAEAAYQBtAGQALgBjAG8AbQAAAAAAHwALXQEAAAAuAAAAdgBpAGsAcgBhAG0ALgBn
AGEAcgBoAHcAYQBsAEAAYQBtAGQALgBjAG8AbQAAAAAAAgEVXQEAAAASAAAAAh+W2D2I5GBOjhGo
LZlOGD0BAAACARZdAQAAABIAAAACH5bYPYjkYE6OEagtmU4YPQEAAAsAAIAIIAYAAAAAAMAAAAAA
AABGAAAAABSFAAAAAAAAAwAAgFDjYwvMnNARvNsAgF/MzgQBAAAAJAAAAEkAbgBkAGUAeABpAG4A
ZwBFAHIAcgBvAHIAQwBvAGQAZQAAABsAAAALAACAUONjC8yc0BG82wCAX8zOBAEAAAAmAAAASQBz
AFAAYQByAHQAaQBhAGwAbAB5AEkAbgBkAGUAeABlAGQAAAAAAAAAAABAAACAUONjC8yc0BG82wCA
X8zOBAEAAAAwAAAATABhAHMAdABJAG4AZABlAHgAaQBuAGcAQQB0AHQAZQBtAHAAdABUAGkAbQBl
AAAAPQ8+jf0F2QEfAACAUONjC8yc0BG82wCAX8zOBAEAAAAqAAAASQBuAGQAZQB4AGkAbgBnAEUA
cgByAG8AcgBNAGUAcwBzAGEAZwBlAAAAAAABAAAAcAAAAEkAbgBkAGUAeABpAG4AZwAgAFAAZQBu
AGQAaQBuAGcAIAB3AGgAaQBsAGUAIABCAGkAZwBGAHUAbgBuAGUAbABQAE8ASQBJAHMAVQBwAFQA
bwBEAGEAdABlACAAaQBzACAAZgBhAGwAcwBlAC4AAABIAACAUONjC8yc0BG82wCAX8zOBAEAAAAu
AAAAQgBpAGcARgB1AG4AbgBlAGwAQwBvAHIAcgBlAGwAYQB0AGkAbwBuAEkAZAAAAAAA3KKYFp02
aU2qMLRgEjzNK0AAAIBQ42MLzJzQEbzbAIBfzM4EAQAAAD4AAABCAGkAZwBGAHUAbgBuAGUAbABD
AG8AbQBwAGwAZQB0AGUASQBuAGQAZQB4AGkAbgBnAFMAdABhAHIAdAAAAAAAPQ8+jf0F2QFAAACA
UONjC8yc0BG82wCAX8zOBAEAAAA6AAAAQgBpAGcARgB1AG4AbgBlAGwAQwBvAG0AcABsAGUAdABl
AEkAbgBkAGUAeABpAG4AZwBFAG4AZAAAAAAA1XFAjf0F2QELAACAUONjC8yc0BG82wCAX8zOBAEA
AAAmAAAASQBzAFAAZQByAG0AYQBuAGUAbgB0AEYAYQBpAGwAdQByAGUAAAAAAAAAAAAfAACAUONj
C8yc0BG82wCAX8zOBAEAAAAiAAAARABlAHQAZQBjAHQAZQBkAEwAYQBuAGcAdQBhAGcAZQAAAAAA
AQAAAAYAAABlAG4AAAAAAAMAAIAIIAYAAAAAAMAAAAAAAABGAQAAADIAAABFAHgAYwBoAGEAbgBn
AGUAQQBwAHAAbABpAGMAYQB0AGkAbwBuAEYAbABhAGcAcwAAAAAAIAAAAB8AAIAfpOszqHouQr57
eeGpjlSzAQAAADgAAABDAG8AbgB2AGUAcgBzAGEAdABpAG8AbgBJAG4AZABlAHgAVAByAGEAYwBr
AGkAbgBnAEUAeAAAAAEAAADUAQAASQBJAD0AWwBDAEkARAA9ADcANQA5ADIAMQA0AGUANQAtADAA
YgBkADYALQA0ADIAMQA3AC0AYQA3AGUAMwAtADEAYwA2ADAAMgA0AGMAMwAzADEAYgA3ADsASQBE
AFgASABFAEEARAA9ADAAMQBEADgARQAwADUANAAzADUAOwBJAEQAWABDAE8AVQBOAFQAPQAzAF0A
OwBTAEIATQBJAEQAPQA4ADsAUwAxAD0APAAzAGUANQAwADQAYgAxAGIALQAxADkANwBkAC0AYgA3
ADcAYgAtADEANgBlADEALQA4ADYANQAzADAAZQBiADMAZAA2ADQAYwBAAHgAZQBuAC4AbwByAGcA
PgA7AFIAVABQAD0ARABpAHIAZQBjAHQAQwBoAGkAbABkADsAVABEAE4APQBTAGEAbQBlADsAVABG
AFIAPQBOAG8AdABGAG8AcgBrAGkAbgBnADsAVgBlAHIAcwBpAG8AbgA9AFYAZQByAHMAaQBvAG4A
IAAxADUALgAyADAAIAAoAEIAdQBpAGwAZAAgADUAOAA1ADcALgAwACkALAAgAFMAdABhAGcAZQA9
AEgAMQA7AFUAUAA9AEQAMAA7AEQAUAA9ADEAMAAxAAAAHwAAgBOP8kH0gxRBpYTu21prC/8BAAAA
FgAAAEMAbABpAGUAbgB0AEkAbgBmAG8AAAAAAAEAAACyAAAAQwBsAGkAZQBuAHQAPQBPAHUAdABs
AG8AbwBrAFMAZQByAHYAaQBjAGUAOwBNAGEAYwBPAHUAdABsAG8AbwBrAC8AMQA2AC4ANgA2AC4A
MgAyADEAMAAyADgAMAAxACAAKABJAG4AdABlAGwAeAA2ADQAIABNAGEAYwAgAE8AUwAgAFgAIAAx
ADEALgA2ACAAKABCAHUAaQBsAGQAIAAyADAARwAxADYANQApACkAOwAAAAAACwAAgAggBgAAAAAA
wAAAAAAAAEYAAAAABoUAAAAAAAACAQCAE4/yQfSDFEGlhO7bWmsL/wEAAAAuAAAASABlAGEAZABl
AHIAQgBvAGQAeQBGAHIAYQBnAG0AZQBuAHQATABpAHMAdAAAAAAAAQAAAEoAAAABAAoAAAAEAAAA
AgAAABQAAAAAAAAAagQAAMUFAAAAAAAAFAAAAAAAAADxCAAAoQoAAAAAAAAUAAAAAAAAAM8KAAD/
////AAAAAAAACwAAgBOP8kH0gxRBpYTu21prC/8BAAAAHAAAAEgAYQBzAFEAdQBvAHQAZQBkAFQA
ZQB4AHQAAAABAAAACwAAgBOP8kH0gxRBpYTu21prC/8BAAAAKAAAAEkAcwBRAHUAbwB0AGUAZABU
AGUAeAB0AEMAaABhAG4AZwBlAGQAAAABAAAAQAAAgBOP8kH0gxRBpYTu21prC/8BAAAALAAAAEwA
YQBzAHQAUwBtAGEAcgB0AFIAZQBzAHAAbwBuAHMAZQBUAGkAbQBlAAAAm4LHHuME2QEDAA00/T8A
AB8APQABAAAACgAAAFIAZQA6ACAAAAAAAB8ANwABAAAAagAAAFIAZQA6ACAAWwBQAEEAVABDAEgA
IAB2ADEAIAAxADAALwAxADIAXQAgAGgAdwAvAGEAcgBtADoAIABpAG4AdAByAG8AZAB1AGMAZQAg
AHgAZQBuAHAAdgAgAG0AYQBjAGgAaQBuAGUAAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAC4A
AABhAHUAdABoAGUAbgB0AGkAYwBhAHQAaQBvAG4ALQByAGUAcwB1AGwAdABzAAAAAAABAAAAsgAA
AGQAawBpAG0APQBuAG8AbgBlACAAKABtAGUAcwBzAGEAZwBlACAAbgBvAHQAIABzAGkAZwBuAGUA
ZAApACAAaABlAGEAZABlAHIALgBkAD0AbgBvAG4AZQA7AGQAbQBhAHIAYwA9AG4AbwBuAGUAIABh
AGMAdABpAG8AbgA9AG4AbwBuAGUAIABoAGUAYQBkAGUAcgAuAGYAcgBvAG0APQBhAG0AZAAuAGMA
bwBtADsAAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAB4AAABhAGMAYwBlAHAAdABsAGEAbgBn
AHUAYQBnAGUAAAAAAAEAAAAMAAAAZQBuAC0AVQBTAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAA
IAAAAHgALQBtAHMALQBoAGEAcwAtAGEAdAB0AGEAYwBoAAAAAQAAAAIAAAAAAAAASAAAgAggBgAA
AAAAwAAAAAAAAEYBAAAAIgAAAE4AZQB0AHcAbwByAGsATQBlAHMAcwBhAGcAZQBJAGQAAAAAAMo2
G4BqZzJBhwII2tQUsCAfAACAhgMCAAAAAADAAAAAAAAARgEAAAAuAAAAeAAtAG0AcwAtAHAAdQBi
AGwAaQBjAHQAcgBhAGYAZgBpAGMAdAB5AHAAZQAAAAAAAQAAAAwAAABFAG0AYQBpAGwAAAAfAACA
hgMCAAAAAADAAAAAAAAARgEAAAA2AAAAeAAtAG0AcwAtAHQAcgBhAGYAZgBpAGMAdAB5AHAAZQBk
AGkAYQBnAG4AbwBzAHQAaQBjAAAAAAABAAAASAAAAE0AVwAzAFAAUgAxADIATQBCADQANAAwADkA
OgBFAEUAXwB8AFAASAA3AFAAUgAxADIATQBCADgAMQA3ADkAOgBFAEUAXwAAAB8AAICGAwIAAAAA
AMAAAAAAAABGAQAAAFAAAAB4AC0AbQBzAC0AbwBmAGYAaQBjAGUAMwA2ADUALQBmAGkAbAB0AGUA
cgBpAG4AZwAtAGMAbwByAHIAZQBsAGEAdABpAG8AbgAtAGkAZAAAAAEAAABKAAAAOAAwADEAYgAz
ADYAYwBhAC0ANgA3ADYAYQAtADQAMQAzADIALQA4ADcAMAAyAC0AMAA4AGQAYQBkADQAMQA0AGIA
MAAyADAAAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAADgAAAB4AC0AbQBzAC0AZQB4AGMAaABh
AG4AZwBlAC0AcwBlAG4AZABlAHIAYQBkAGMAaABlAGMAawAAAAEAAAAEAAAAMQAAAB8AAICGAwIA
AAAAAMAAAAAAAABGAQAAADoAAAB4AC0AbQBzAC0AZQB4AGMAaABhAG4AZwBlAC0AYQBuAHQAaQBz
AHAAYQBtAC0AcgBlAGwAYQB5AAAAAAABAAAABAAAADAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEA
AAAqAAAAeAAtAG0AaQBjAHIAbwBzAG8AZgB0AC0AYQBuAHQAaQBzAHAAYQBtAAAAAAABAAAADgAA
AEIAQwBMADoAMAA7AAAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAABEAAAAeAAtAG0AaQBjAHIA
bwBzAG8AZgB0AC0AYQBuAHQAaQBzAHAAYQBtAC0AbQBlAHMAcwBhAGcAZQAtAGkAbgBmAG8AAAAB
AAAA2gUAADUAYQBoAEUAZABhAHUAdQB1ADcAVABFAFcASQBtAEQASwAxAHgASQBhAFQAQwBEAE4A
UAB4AGUAMQBYAFUAOABMAFAAMQA1AE0AQwB3ADEAcwArAGkAZwBWAHUAVQBnADUAdgBYAGMARQBH
ADkAdwBpAEwATgBQAHcASQBvAGQAWgBMAHQAMAAvAG0ALwA4AGcAdwBIAEkAVQA0AC8AQwA0ADIA
dgBIAFAAWABSAFYARwBrAGUAbABWAE0AYwBQAFEAcQBDAGsAYgBiADEAegAyADgANwBDAHgAVABY
AEsAeQByAGoAVABXADUALwBTAEgAYgBIAEUAbwAwADMAbQBXAGcAaABOADkAVgBWAEIAMwBlAFQA
bgB0AFMAcwBOADcASAByAC8AWQBUAE0AWgB1AGIATwBlADMAeQBrADYAUQAxAFIAWQBwAFUAVABp
AFAAaAB3AFYAMQA5AFQAMAB3AG4AZQA4AGoAbgBBAEgAdwByAFQAQQB4AFIARwBNAEwAVwBuADIA
MABnAGgAVwBsAGQAbABKAHQAQgBKAEsAcABBAHIAbgBmAEUAMQBaADAAQgBsAGIANwArAFYAQgBG
AFQATgBXAE8ANQBQACsAdwBEADgAbwBQAHUAbQB2ADMARwB2AEIAZABxAFkAVgBhAE4ARgBNAEcA
agA3AEcAMwBRADUAUwBtAEIATgAwAFAAVgBxAFUARgB3ADEAcwB3AHgAcQBTAHkALwBiAHkASQA0
AFkAWABqAEcAawBwAEMAWABhADYALwB0ADYAbQA2AFAAMgBnAFQAawByAG0AeQBwAEIAZQAvAEkA
TQBJAGEAcABnAEMAYwAyAGIAbABpAGEANABPAGQARgA3AEIASwBXAGIAeQB2ADEAaABDAGsAcABY
AFQALwBYADYAUABxADcAMgBNAGIAaAAzAFMANgBLAHEAcQBzAE4AUQBRAHAAcwBkAEMAMQArAFcA
VwA2AGsAZABDAFgAbwBxAGMANQBBAFcASwAzAHAAKwBSAEgAcAA4AGQAdwB1AEwAVgArAEkAVQA0
AG8AYwBnAHAATgBOADAANABvAFIASgByAEQAVAByAEUAQgBmAGQAZQByAHQAdwBiAEwAWAB5AGgA
bQAxAEEAWQBwAHcAUwB2AFIASwBYAGoAagBmAGkAUgBVAGIAbABoAFMAcQBLAGsAbwBCADQAbQBV
AHgAcgBpAFUAbQBIAHMAcwBlAEYARwAxACsAOABCAEwAagB5AHAAegBlAFUAbQBjADYAVABzAEcA
TAB1AGkAeABMADcAWgBWAG4AYgAzAHcAWQBLAHYAdwBEADYAdQBSAE8ANwA1AEUAQQBRAEoANABZ
AEQATwBoAEwAcQBYAGMAMAA4AEQAegBDAHAATQAwAFUAZgBTAC8AZQAyAGsAYQBmAFcAWQBFAHEA
bQAxAFoAYwA0AEwARQB1AFYAVABUAHcAZABvAG0AWQA5AGUAZgA5ADYAQQBVACsAMgBhAHEAZwA1
ADMANgBjAGkALwA1AG8AaQAxADUAVQBiAHIAMgBnAHgAMwBaAFQARwBYADAASQBqADYASQBWAG8A
eQAvAFMARwBsAEMAZQBVAEwAYwBKAGwATwBxAGwAYgBEADIAWAAwAGUAeQBnAHkAZQBMAGUARABk
AGsATgBpADkANAB2AFgAWQBYAFEATgBFADYAUgBDAHoAWQBmAFUAegBZAHAASABWAHAAbgBjADUA
MgBhAHMAVgBhAGIAYQAvAC8AegAxAG8AOQBFAFgAaABzACsANwBOAEEAVwBHADUAVwBBAEMAVQBj
ADcAegBzAFcAOAB5AFYAdgBTAGIAOABrAEIAbQBpAEwANgA1AGkANgBQAGYANABpAHQAagBKAFoA
VAB2AE0AZQBPAFAAZgA0AEkAMQB1AFEAVQBBADAAcgA3AEcAVwBEAEcAegBXADQAbAA4ADYANwBx
AHcAeQBRAE4AcwBzAEEAawB3AD0AAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAADgAAAB4AC0A
ZgBvAHIAZQBmAHIAbwBuAHQALQBhAG4AdABpAHMAcABhAG0ALQByAGUAcABvAHIAdAAAAAEAAAB+
BAAAQwBJAFAAOgAyADUANQAuADIANQA1AC4AMgA1ADUALgAyADUANQA7AEMAVABSAFkAOgA7AEwA
QQBOAEcAOgBlAG4AOwBTAEMATAA6ADEAOwBTAFIAVgA6ADsASQBQAFYAOgBOAEwASQA7AFMARgBW
ADoATgBTAFAATQA7AEgAOgBNAFcAMwBQAFIAMQAyAE0AQgA0ADQAMAA5AC4AbgBhAG0AcAByAGQA
MQAyAC4AcAByAG8AZAAuAG8AdQB0AGwAbwBvAGsALgBjAG8AbQA7AFAAVABSADoAOwBDAEEAVAA6
AE4ATwBOAEUAOwBTAEYAUwA6ACgAMQAzADIAMwAwADAAMgAyACkAKAA0ADYAMwA2ADAAMAA5ACkA
KAAzADYANgAwADAANAApACgAMwA5ADYAMAAwADMAKQAoADMAOQA4ADYAMAA0ADAAMAAwADAAMgAp
ACgAMwA0ADYAMAAwADIAKQAoADEAMwA2ADAAMAAzACkAKAAzADcANgAwADAAMgApACgANAA1ADEA
MQA5ADkAMAAxADUAKQAoADIAOQAwADYAMAAwADIAKQAoADUANgA2ADAAMwAwADAAMAAwADIAKQAo
ADUAMgA1ADMANgAwADEANAApACgAOQAzADIANgAwADAAMgApACgAOAA5ADMANgAwADAAMgApACgA
NgA0ADcANQA2ADAAMAA4ACkAKAA1ADQAOQAwADYAMAAwADMAKQAoADgANgA3ADYAMAAwADIAKQAo
ADYANgA5ADQANgAwADAANwApACgANgA2ADQANwA2ADAAMAA3ACkAKAA2ADYANAA0ADYAMAAwADgA
KQAoADYANgA1ADUANgAwADAAOAApACgAMwAxADYAMAAwADIAKQAoADEAMQAwADEAMwA2ADAAMAA1
ACkAKAA0ADMAMgA2ADAAMAA4ACkAKAAzADMANgA1ADYAMAAwADIAKQAoADkANgA2ADAAMAA1ACkA
KAA0ADEAMwAwADAANwAwADAAMAAwADEAKQAoADcANgAxADEANgAwADAANgApACgAOQAxADkANQA2
ADAAMQA3ACkAKAAxADgANgAwADAAMwApACgANwAxADIAMAAwADQAMAAwADAAMAAxACkAKAA2ADUA
MAA2ADAAMAA3ACkAKAAyADYAMAAwADUAKQAoADkANgA4ADYAMAAwADMAKQAoADgANgAzADYAMgAw
ADAAMQApACgANQA1ADAAMQA2ADAAMAAzACkAKAA4ADMAMwA4ADAANAAwADAAMAAwADEAKQAoADEA
NgA2ADAAMAAyACkAKAAzADgAMAA3ADAANwAwADAAMAAwADUAKQAoADQANwA4ADYAMAAwADAAMAAx
ACkAKAA3ADYAOQA2ADAAMAA1ACkAKAAxADIAMgAwADAAMAAwADAAMQApACgANQAzADUANAA2ADAA
MQAxACkAKAAzADgAMQAwADAANwAwADAAMAAwADIAKQA7AEQASQBSADoATwBVAFQAOwBTAEYAUAA6
ADEAMQAwADEAOwAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAXAAAAHgALQBtAHMALQBlAHgA
YwBoAGEAbgBnAGUALQBhAG4AdABpAHMAcABhAG0ALQBtAGUAcwBzAGEAZwBlAGQAYQB0AGEALQBj
AGgAdQBuAGsAYwBvAHUAbgB0AAAAAQAAAAQAAAAxAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAA
SgAAAHgALQBtAHMALQBlAHgAYwBoAGEAbgBnAGUALQBhAG4AdABpAHMAcABhAG0ALQBtAGUAcwBz
AGEAZwBlAGQAYQB0AGEALQAwAAAAAAABAAAAsgwAAHUALwBrADAAaQA5AHgAagBCAG0ATgBHAEIA
WgB2AEcATQA0AHMAagA1AGcAMABsAGcARgBpAFQASgBmADcAMgBGAFQAZABkAFEANgBZAEcAdgBZ
AFUAdAB6AHAAcwBlADMARgBvADEASwBuAEkAegArAEUALwBkAGoAegBrAFMATgBZAEcAOABDAHAA
TQB3AGwAVAA4AFYANwA1AEIAMQBXAGIATwBTAFoARABTAEYAQwBaAHQAVQBPAFQALwBJAEoAaABM
ADIAdwBFAHAAZABIAHoAcgAzADkAZQBSAE4ATQBrAGwAQgBTAGkAdQBPAHAAbQB1AHAANAB5ADEA
TABNAEoAOABNAGwATQBzAHgAYwB4AG0AcABEADIAWAB2ACsAMgBNADUAQgBNAFAAbgBjADMAcAA4
AGwAdQAyAGYASwBRADQAdwBsADgAKwBtAGkASABuAGYAYQBUAHoATwAyAHEAYQBrAC8AcwA0AE0A
QwBoAC8AaABHAEQANwBpADYAWAB6ADkAdQBrAGgANgBZAEMAOQBLAEsAQgB2ADIAcQB2AE0AWgBK
ADYAZQAxADkAVwBRAEIAMABQAEsAZABKAHkAOABNAFEAawBlAGgAUgAxACsARAB0AFgAUwB4AFMA
MABiADEAZwB4AGkAYQB1AFEAeQBMAFAAcQBXAFEAMAAxAEQASgB5ADgAYQBTACsAWgBlAFAAVAB3
AFkAKwBGAEIAOABmAEUANQBSAEYAcQAvAHUAWAA0AG0AMgBzAEgAZgA3AHMAdwBKAGoAMQBIADUA
TABZAGwAcwBSAGUAMgBzAFkAZgBqAFkARQBZAGsAQQBFAGIAagBPADMAawBxAHIAUgAwAFYAbgA4
AFIATQBEAGoAcgBZAFQAeQBzAFYAaABqAEoAOABqAHQAQwA4AFUAZwBOAHYAMABYAEoASgBVAEIA
UQA3AEEAZABGADYAZgBZAC8AZgBCAGEANQBrAGMAdwBQAGgAbABMAE0AbQBnAG0AbABCAE8AOQB0
AEEAZAA4AFEAOABSADYAUgBaAGYARgA0AEsAWQBRAG4AWABaAGUALwBIADgALwAxADUAWABGAHcA
bAB4ADkALwBhAHcAYgBUAEkAVgBzAEEAagB4AHkAcwA4AEYANAAwAHoAdQBYAEgAMQAvAHUAegA0
ADUASgBaADAAOABWAEQAMQBYAEwAYQAzAFIAUABHAGEAMwB2AHEAeQA0AHAAVwBvAHkAUgBjAHgA
YgBIAEYAegBCAEoASwBuAGoAZwBCADMAYwAzAEcASwBUAHoASwBGADUAWgBRAGsAMgBoAG4ARABy
AFIAcgBXAEUAegBWAGIAcwBsAEYAWQBFAFQAVQB3AEoAUQBLADUAeABBAFQAZgBGAHUAYQBhAEYA
bgBVAHkARAAvAHQAZABYAEsAMwB6AEUAUQBTAFUAZQBEAFkAWAB5AFcATgA2AEUAbAB3AEUAWgBK
AEsAMQBqACsATQBqAFYAbwAyAE0AMgBvAGMATQA5ADUAYQBWAEQAcAA5ADIAaQBJAFMARgBSAEUA
eQBJAG4AVgBBAFYAOABqAHUAMgBaAFUAagBqAEcAbgBPAHoATgBKADUAcQB3AHkAMQBHAC8AUAAw
ACsAVwBsAFQAYgBNAFoAbwBhAEQAWgBsAGEAMABnAGUAMwBhADQANQBHAHQAdQBQAE8AUwBzAGUA
UgB3AEQATABnAEwAbwBRAGMAaQA2AHMAaQBlADYAZgBIAGEAZwA0AEsAVgB3AEMATABrAEEAWQB4
AGcAVwBOAHoAUQBYAGgAbABlAHgATwArAGIANAB5ACsATQAyADQASgA1AE4AUwBrAHAAaQBIAGgA
QQBVADMARABvADkAegBvADcAVgB2AHgANQBrAHgAYQA4AEoAUQBnAEEAWAA5AHoASQBSAE0ATgBt
AGQAbwBzADgARwBtAFcAQgBGAHQAegBWAEMAYQBnAFEAVwBnAFgAUABDAHMAQgBRAFQANgArAGQA
WgBQAFMAdQBSAHoAWAB3AEsAawBxADEAegBCAGsAbgBlAGwASwBlAG8AQQBWADAAYwAwAHoAcQBU
AEwAVAAzAG8ARQBhAFAAWABQAHAAbgBlAFYAdABzAHEAdgBEAFIAMABFAEkAdwBhADAATABmAEUA
TQBqADgAWQA5ADIAcQBmAHEALwByAG4ATwA5AHMAUQBDAHIAbABVAC8AaQBiAHQAUgBiADUARABO
AHEAUgBNADIAdgBiAFcAOQB6AEUARAB5ADgATwA1AFcAQgBnAHIAZQBKAEQARgBrAGkATgBEAFYA
ZQB0AEwAdAA0AEwAOQAxAHcATgBMAG0AcABYAHMAUABCAHAAbABHAFgARwBWAGUAdQBaAGIAbwAv
AGIAUgBIAEsAMAAvAGQAegBGACsAUQBZAHAAeQA3AEEAeQBCAEQAZgBCAHMAegBkAGsARQBlAHIA
WgBCAEcAYwBaAFIASABCAEkAdgBwAHIASQA2AGsAKwAzAGYASQB6AHQALwBMADgAcAB4AEgAdgBT
AFgAegBLAFQAWABQAEsAYQBiADgAUABFADYAUwBGADUASABQAEcAQwArAFcAcQAzAFIAWABkAGcA
ZQBiAGMAMABWAHkAQgAzAEkALwB3AGQAMgAyAHcANABwAFMARAB3ADYASgBZADcATwBWAGIAZAA2
AEYAWQBYAGYAUgB1AEwASgBSAEQATQBsAFoAZQBEAHoAOQBQAEYAcgBtADUAQQA1AGoATwAzAEQA
UgBvAEYAQwB5AGMAbABOAFUAWABsAEgAZAByAGsAUgBZAGsAOABzADEAZQBjAGsAYwBMAHcAUgBv
AGQAZQArAC8AawB6AE0AVQAwAEMAcQBxAE0AZwBzAGYATQB3AGMAcgBkAGoALwB6AGcAWABpADgA
RABsAHIAYwA4AFkAWABPAGQAeABVAFkAMABjADUALwBFAHEANwBHAHAAawA3AFQAegBvAEYAMgBH
AGoAVQBOAHYAVQB5AEYAUQBDAGEAUABzAFAARQAzAEQARgB2AHoAVABMAE0AKwA3AHUAdQBWADMA
WAA0AGMAeQAyAFEAdgBoAHoAbABiADcANQBNADQAMAB0ADIAcABjAGQASQBXAFAARQBLAGoAQgBv
AGEAQQAyAEcAZwBsAHcAMABIAE4AcwBMAHYAbwB0AGUAKwBuADIAMgBvAFkANAB5AEIAWABiAEIA
cgBLADkAUwBrAFMAOQB2AFYAbgBaAGEAcQBjAEkAVwB5AGIANgBoAFIAaABHAEgAdQBRAFMAegBK
AFYAWgBxAHEALwBLAGsATwBCAFMAbABVAEwAYQBxAGcASwBEAGgAQQBoAGQAWgB4ADAAUQA4ADYA
NwBpAG4AdgBSAFkAMwBaAHcATABoAGIAawAxAE0AZgB4AEQAYwBUAFoATAA4AEgATAAyAFYAMwAx
AGcAdwBRAGQAVgBGAHcAZAB6AGcASgBWAEgAMgAzAEIANQA1AHgAaAArADUASwBHADIAdQBUAEgA
cgB3AHMAbQBYAHgAVgBPAFYAVABCAGMASgBpAEIATwBvAG8AcwBQAE0AZgBiADcARwAvAGsAUABr
AHkATQBnAHgARgBuADYAOQBWADAAWABtAFIAdwB1AGwAbQBrAGUARAB4AHQAUgBxADMAQQB2AG8A
aQBKAFgAYgB6AFUAKwB3AFQAdABUAGUALwBUAHgAbABCAEoAZgBkADEAcABUAHMAMgBFAFcAWgBV
ADUAVQBlACsAZgB2ADEARwBzAHQAaQB2AEwAeQBIAGMAVAB2ADIAQwBxADYAZwBUACsAZABEAFUA
cABTAGsAYgBUAHAAcgAzADUAUgBoAFMAawBvADEASQBSAEQAQQBVAFgAUAAyAGsAMABiAEMAOABp
ADQARgAyAEgANwBwADYANwBlAFQAVgBPAGQAbQA1AHQAQgBBAGQAYwBGAEsAZgBIAHMAdgB5AFYA
YgBnAHoAUQBBAHQAVgBBAE8AYQB0ACsAQgBOAGIAbQB5AHcATQBsAEMAYwAyAGIARQBYAG0AQwBz
AFAAegBFAFoAdwA5AFIAZQBkAGcAdQB6AGkAcABqAGoARABlADQAOQBiAGQAbgAvADEARwBjAFMA
OABDAHoAUQBkAEkAUAA1AE4ANwA3AHUAMABYADUATQBaAHUAYgB5ADIAVgB2AFcAdwBFAFEAVwBQ
AHMAagBYAHQANQBEAE8AbQByAGEAMgBjAEEAYgBKAC8AWgB3AFEARQAzADAAdQBkADAAeQBEAGcA
NwBmAFUASgBkAE8AcwBSAEcAWQBCADIAZwA9AD0AAAAAAEu7

--_000_MW3PR12MB44096CC3AD5CD01D6043B0E79F159MW3PR12MB4409namp_--

