Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E02477229
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 13:49:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247936.427585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxqBx-00050e-8l; Thu, 16 Dec 2021 12:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247936.427585; Thu, 16 Dec 2021 12:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxqBx-0004x9-4p; Thu, 16 Dec 2021 12:49:01 +0000
Received: by outflank-mailman (input) for mailman id 247936;
 Thu, 16 Dec 2021 12:48:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mgi2=RB=renesas.com=yoshihiro.shimoda.uh@srs-se1.protection.inumbo.net>)
 id 1mxqBv-0004nw-E6
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 12:48:59 +0000
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072e.outbound.protection.outlook.com
 [2a01:111:f403:700c::72e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85a60279-5e6e-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 13:48:54 +0100 (CET)
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4028.jpnprd01.prod.outlook.com (2603:1096:404:d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 12:48:49 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 12:48:50 +0000
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
X-Inumbo-ID: 85a60279-5e6e-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmTGM8oQndh1TL3c24BAP5nAKoz72hhLC+MKlE9AWswK027sVAxnFgtzHV6xLbdGwb+ONY2ln5ynJGTxL53CvZ6eEDJji111e1kvWszWOGIzyRv8w1Wyb/E7UPAIYMNGipBdQGa99FJI3dvovlmtAqOtVLLZQu8wZfDLLOc0gDgqOy1gRrWEp93yZMxrVoMoJkCgTeB6T+jQms/m1BlNBGUs6qc0iufoC4OwX/vMYWt9ff1/FyxkpKG57BBekieaNTYGgaQZo9C8HWysPQ3Tdt8CvXD188Bqq0vg1sRS4cNxkK6LF5gKygBMG4WsJ2axXjXl7qyUL/vik/VcXNCuSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xanxDHtOVtoK9RcZrvDb+Ma9XAGVsvX5rnDtcN8uZIs=;
 b=Zd5J8hOzLQbEe7qBiMQxkfg+tOnS6hGzmjMgieOF6BFrS6VuV/V0ML5ySGEW6In56mKzE8rTBUw5mK17mkPs0WZ4h98BI5xctQUqN2kwYFV+lw7mCN1PhyJ0yVC3j3wE4fchREvJl2OXCvpMXu6l4NvSx5RR+3F6QEqDhhjknAzoaSdCfTMZoLDgK/6QDaw64vnNbeOhQxJ8efQaqGc1a2vjScAyM6GkgN2RKZFOjvICYSXSxmgK8nzC70wURlt99WbElUVUHvCZwPDVBdtO4pwNEnTYlQ+7LbN4RvOjZu3lyVQzhvKfnIphCsiJsLls+jovqIyR2ZDpaYMhVWJi8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xanxDHtOVtoK9RcZrvDb+Ma9XAGVsvX5rnDtcN8uZIs=;
 b=X7BAK+3QQUY9piyUH2Mj0MBtmvsxXdTYKdPi+6JtOqv4kar5WQvyjT3QKBIali2cJeyk+lFK7yoPdjDF6+3JL8nqk8bs+nVGPJxbhkVdUnBBHIM24rB7+d4NP664bzBYxgFQ3Uq5UFtpWZSP1R1ws5zCpUL/o4FF4OAcXDe/pTo=
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: RE: [PATCH 08/10] iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP
 to 0
Thread-Topic: [PATCH 08/10] iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP
 to 0
Thread-Index: AQHX47d7pBbIZZ/820Cis1eK882Bi6w1KKuw
Date: Thu, 16 Dec 2021 12:48:49 +0000
Message-ID:
 <TY2PR01MB369226FC51154F6E9BA37886D8779@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <1638035505-16931-9-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1638035505-16931-9-git-send-email-olekstysh@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 455c85e9-c145-4ffb-dd74-08d9c092687a
x-ms-traffictypediagnostic: TY2PR01MB4028:EE_
x-microsoft-antispam-prvs:
 <TY2PR01MB402838E7B59FC7D80CDF3686D8779@TY2PR01MB4028.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bEtjfEyy2ExsS2oc0/OLzWoLkY+vMhfAriDIs7CUoZwDrkJSKqDsz70Ev+NgQ9zVzo/UieT/amF0e+YrShccJwoJPQr+aeqouH5A/Dq7/VJNXFIjwnu+Vhxs7053fee0R8uLBRORyA/98QyXyS/YhWhJs7VFr2JfDlnx5sz3h2dMW96kLYq1bcGwr/SQ0JFUhQfd0/Vre0qqw3/JTDy4w9haeNeaQwJRcYQQplhZfg/TsLVXZIqf/uOl0/8MjeOoiedA7B4Jno9nCGxZq7A0N4e7KfkQiQcsG5rqJzNIGppzdxe7T44ugoFe0ouF5D0lJ7XXpsJ1cMiBXHeDA3Xzj7X/ajO65A2GO26eQVhlYP7A0XNZasSnMryieMkQ4AdBxdOKclfcCArHlhxWgloQxDWHNozpVuSStkYTcnVMTTHWIv2ToMbYbV06i9DRDE6mFHvgAM7wNqlIVmR9l6QbSxc8Vdl49C+O8D01zv9Df6hNB+olhk3J6lduw9BQRRkogvduHwHpCuxsBM4tCbI9aMXCufU0zelNWSYVJIPuKxM9lcblaICuWuoA6XyExpLe/ZpV/SRgb2yoU8GxDwBqrURtRsPGNGDa47E0P8RRtVhcWFGFFXVpiZpEKLNDKcesBCrE/5yNktPbzTkM8DUTqemDmScADb0NHBYNeSsUdYBcFNnBxsp+kzkP7ZOtXkYEpLjqqN15jph6a3pbp+06vQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016003)(26005)(38100700002)(33656002)(316002)(71200400001)(5660300002)(2906002)(38070700005)(186003)(52536014)(8676002)(83380400001)(9686003)(4326008)(508600001)(64756008)(6506007)(76116006)(122000001)(8936002)(66556008)(7696005)(110136005)(54906003)(86362001)(66476007)(66446008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Pmta+/zm1epbCIor+rdr+lJJS0DS9ZZ7WEOLYEdWHWBOuo914U+59YqCkb+9?=
 =?us-ascii?Q?6xe3XcVSwZHLIkFHKZFO74BtUvTuBinMNR56zaysrXqD7Yo6vo4FZrgF0Rlm?=
 =?us-ascii?Q?3cyJkGv33mIsTohU5w7P5wD9wYMJY2sS/TCtuC9c5Zb+SeZfHY1B90RkVFl2?=
 =?us-ascii?Q?2FuSWyGAIaEghJvFm1nYGyJ2VdERJ06XpFATy60Bz+lQp5wXaSyuAOA0N3lM?=
 =?us-ascii?Q?5QBRITV+YNmaIRO1a2sqizSA6cYaS+fhCLWHPtEpA2HQRzPg88z5q9nxjkI0?=
 =?us-ascii?Q?w9i/viQy10fD4z00sUFSCIzIxFj9EfKOz8NvJ8LfDRCFQDYLTsjC4Qqd7CDw?=
 =?us-ascii?Q?Gt5vtvntYUFqNQTSQlNtEyu8HcBeZ2C3Q7UkEFBsADc4t5Gyefgz6NNx84xC?=
 =?us-ascii?Q?bjBPAN153Josru/XEj1FlTewxPa2kbbViDntL3pjORV5PXkmhA/5h32kuD17?=
 =?us-ascii?Q?nsvtfY4+Pz009SCgI8bwlTBYvnBfu/wBAuO9A+4KEiq0oEke2rC84dnjPzdX?=
 =?us-ascii?Q?ob6tMAX+SAOUJkeKw76yFbUP4l4wtbNXrM3z6j9rNOgKB/E7NGq14UPqeDmC?=
 =?us-ascii?Q?imjOpxPBJLaupShDOwrWBkP2jrMfutO25LYHNrLZ8f/uksSEXoKAz1oNfjwM?=
 =?us-ascii?Q?a45b5KjoNdI67AhCwidsxBSdjrYyl23ARUihbmAJn0+aUI/atoaxlkH15PSm?=
 =?us-ascii?Q?7qej8oijWsVDrhxgn+pubXtIrfzwTEHeA96FT6Vek0DJdikLCvRO4BbwUFZJ?=
 =?us-ascii?Q?a0nC12LDgq+mLAS+EvfUFKPaOrPEdRj9rhcUqISepwuCCvwsjhNNprEeWDJb?=
 =?us-ascii?Q?lQSMJzfid5k23mrzG9/IpiWRPVUYPAMhB9A0K2jdSWMjGBGf86IpbDYkl7PW?=
 =?us-ascii?Q?kEKbBX68RQhT5eP4bFM6RPoNuzF3Agi0dPeWs4k8OL6wekSTXi+dCke/RhzR?=
 =?us-ascii?Q?wgiLn1kLAlKaBvvAB5z9POcy/Eo9ZzqYYz2UXX9GFNEzWho8+PcWjswQsLqZ?=
 =?us-ascii?Q?IUzd1tJmFqNOIoj0rkkifHM3X3Ix/kl0aaORTTyfInq/yerl00TU5/azunPq?=
 =?us-ascii?Q?r/MId43occolwXzsf4US4LuqI50cxqPZJQF8N04Y5mq7aWhE/6jwA+9/tg5C?=
 =?us-ascii?Q?KbPo6aHNX+4tTSCDmV3Q3afRmPU+rp11xbk7y9O4kma46Q0Ce+6BhNLJcxyx?=
 =?us-ascii?Q?wAqEFEvrOiUaaocez3e6eFhZMWlLbYQrBPVDrp3PXgPGcHWt3Y2MqHmljEg+?=
 =?us-ascii?Q?6QxkSZ0qPsHCzIet3Mkd6VaA2s8ovInVRrYhYz4bCEV1mzGY/fVvVzQs38Ae?=
 =?us-ascii?Q?rTTSUwmKSorAIBTnUcf7n9z4twQpvi4BYgzNIVuLz/mZAAiFklx3jsY8Vknd?=
 =?us-ascii?Q?MQ7TpNu0FucxkILXRYBp/0TRMoii+7Qw2H83krQbWYUd7Hi6m7RJw/mfWBn3?=
 =?us-ascii?Q?Po4Zfv3e73+u4OOcRUUSjBVyRc7qlPXA5JLtZt5CWVsnv7QUYu2bFOASiyHu?=
 =?us-ascii?Q?9CWqBXB0LR5tGfQbQH6SlkYzwreKDuJiAyXYbdwiC8o1WNxt1snfiiH5ochm?=
 =?us-ascii?Q?2ieGFdTdNXLehDOAEQOk7xhABNk88aY3mxUmXIGN8fSDlp0e3ag7LXHVt1gU?=
 =?us-ascii?Q?PlufZRYsmPbKeMKvmykDsW2PcSxi4U3viuA/1XLmryAzeYdM9MJ8HgJMez9Q?=
 =?us-ascii?Q?hCzo8zVIjCd9fRB9LP1uCjO5HQYwqasfrZRAR6k4ZW9Q5GSt2wXd9UQ8t/ef?=
 =?us-ascii?Q?ZESd+46zbg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 455c85e9-c145-4ffb-dd74-08d9c092687a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 12:48:49.9127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x9Pw3tkOiwS2O0aayWqFFVat/MFFYxQKmqkgcGWRLdmsy7FSOF5/zetgQ0m+1eEDtEcQrGitxoxBF5QcAJg99nkq2LkIJOHrBf3Af+x1c+fhYoWj20S85lyxY3YwLCjM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4028

Hello Oleksandr-san,

Thank you for the patch!

> From: Oleksandr Tyshchenko, Sent: Sunday, November 28, 2021 2:52 AM
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> Based on the following commits from the Renesas BSP:
> 8fba83d97cca709a05139c38e29408e81ed4cf62
> a8d93bc07da89a7fcf4d85f34d119a030310efa5
> located at:
<snip>
>=20
> Original commit messages:
>  commit 8fba83d97cca709a05139c38e29408e81ed4cf62
>  Author: Nam Nguyen <nam.nguyen.yh@renesas.com>
>  Date:   Wed Apr 28 18:54:44 2021 +0700
>=20
>   iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP to 0
>=20
>   Need to set bit IMSCTLR_USE_SECGRP to 0
>   because H/W initial value is unknown, without this
>   dma-transfer cannot be done due to address translation doesn't work.
>=20
>   Signed-off-by: Nam Nguyen <nam.nguyen.yh@renesas.com>
>=20
>  commit a8d93bc07da89a7fcf4d85f34d119a030310efa5
>  Author: Nam Nguyen <nam.nguyen.yh@renesas.com>
>  Date:   Tue Sep 7 14:46:12 2021 +0700
>=20
>   iommu/ipmmu-vmsa: Update IMSCTLR register offset address for R-Car S4
>=20
>   Update IMSCTLR register offset address to align with R-Car S4 H/W UM.
>=20
>   Signed-off-by: Nam Nguyen <nam.nguyen.yh@renesas.com>
>=20
> **********
>=20
> It is still a question whether this really needs to be done in Xen,
> rather in firmware, but better to be on the safe side. After all,
> if firmware already takes care of clearing this bit, nothing bad
> will happen.

IIUC, we need this for IPMMU-DS0.

> Please note the following:
> 1. I decided to squash both commits since the first commit adds clearing
> code and only the second one makes it functional on S4. Moreover, this is
> not a direct port. So it would be better to introduce complete solution
> by a single patch.

I agree.
However, I realized IMSCTLR and IMSAUXCTLR registers' offset differs
between Gen3 and Gen4. About BSP patch of 07/10, it seems to take care
of the offset. But, Linux upstream based code doesn't take care of it.
So, we have to add a new member (maybe "control_offset_base" is a good name=
?)
to calculate the address.

> 2. Although patch indeed does what it claims in the subject,
> the implementation is different in comparison with original changes.
> On Linux the clearing is done at runtime in ipmmu_domain_setup_context().
> On Xen the clearing is done at boot time in ipmmu_probe().
>=20
> The IMSCTLR is not a MMU "context" register at all, so I think there is
> no point in performing the clearing each time we initialize the context,
> instead perform the clearing at once during initialization.

ipmmu_domain_setup_context() is called in probing and resuming.
So, it's enough to clear in ipmmu_probe() I think.

> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passt=
hrough/arm/ipmmu-vmsa.c
> index 8dfdae8..22dd84e 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -229,6 +229,9 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
>  #define IMUASID0(n)            (0x0308 + ((n) * 16))
>  #define IMUASID32(n)           (0x0608 + (((n) - 32) * 16))
>=20
> +#define IMSCTLR             0x0500
> +#define IMSCTLR_USE_SECGRP  (1 << 28)
> +
>  #define IMSAUXCTLR          0x0504
>  #define IMSAUXCTLR_S2PTE    (1 << 3)

As I mentioned above, we have to adjust these registers' offset for
both Gen3 (+0) and Gen4 (+0x1000) somehow.

> @@ -979,6 +982,10 @@ static int ipmmu_probe(struct dt_device_node *node)
>          set_bit(0, mmu->ctx);
>      }
>=20
> +    /* Do not use security group function. */
> +    reg =3D IMSCTLR + mmu->features->ctx_offset_stride_adj;
> +    ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECGRP);

If we modify the 07/10 patch, we cannot use ctx_offset_stride_adj.
# But, using "ctx_offset" here seems to be abused though because
# the register is not context.

Best regards,
Yoshihiro Shimoda


