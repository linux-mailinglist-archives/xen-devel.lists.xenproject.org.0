Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAED8B4AA73
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 12:24:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116305.1462676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvWA-0002jg-L7; Tue, 09 Sep 2025 10:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116305.1462676; Tue, 09 Sep 2025 10:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvWA-0002gW-I3; Tue, 09 Sep 2025 10:24:06 +0000
Received: by outflank-mailman (input) for mailman id 1116305;
 Tue, 09 Sep 2025 10:24:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noAm=3U=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uvvIF-0001My-0p
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 10:09:43 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19a0ce90-8d65-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 12:09:41 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU4PR03MB10645.eurprd03.prod.outlook.com (2603:10a6:10:58f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:09:32 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 10:09:32 +0000
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
X-Inumbo-ID: 19a0ce90-8d65-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUpP/MS+ebuHOo5APhBg4SpgMgEvuIK86eLkE0M1/iCRjhnRRXubaaO0ALOPTpgv1mBHn8eSMbtrALEmEQuOzSaCixp997POI9a/nlSMkIemzLj5e7Ro7FZT5utoloDQ1jVdlU1q2WsO3UNvfbAI0DhG4qtJHEOP1O34/m9xqb7p+/LN/SccxXhtaPGQQLwNiI+9FLlDLug6mQ3YbEtnikUhBMUXwgcYB85317u0VcSQv5Pomq/oZSRWJ5pXgD5EZ834iliGgCj9Z6pb/eg5ffO6nWxBH+Gr95fCxPpPZFBsflKPHeknb/uHLR3aJRRLExkAOHeTQlLbkYXckJsfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEVDDkro/4RLcvAdwGV/VFVy/2GMbS04zF19EjNqqRg=;
 b=jRxqkOTSq6SuFlqJUkNXectJ51oH4zredxiDHqKG9+T7g+BqNY8oyPAVuTGkYX+QTP6YH822EJ1yrb+zzfZ0mQe3DYGcwYtM38N2ehdg24xljO91Bokg8IBG11dx9tc59ZbbytEbTcIUZcz2XqtC23dBi9fq7l259/1FnyLBId+v/BlPPncDBLn0C4XkBGBkNFfIOIpltefVVbhcL6G/mz+morHhLjnI66j75VO2we40c7MmJyqci4xXV89P3wzjOG69R2BlHFf2Kc9pVnCmRMWFgCkXvkEVckODyp+sOn5eyNyU8sTlZtv8Fsb4LBr2OgdMNFij3r1brgyd6i4xGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEVDDkro/4RLcvAdwGV/VFVy/2GMbS04zF19EjNqqRg=;
 b=JOWaQcsLEX/DsDiTnV3lhqryLe4qoSpUzgne5cfIkdVT2z/EKFSfVarH87Xg9cpGtIdyO6hMW6VICm1oIIipF998m40lqjFF+UecEHfTGsbJwuSNXMyCVQ9sfvuTqxjYMECr0rRsv+vbMc+Mt1aNaAfJsCiaftaNRoPmo3sv2r0QPTo2dHsjoC8bwywOHan3i4oZ5J9xhCcFMcIo4PRH6FaYxaVzpemPk7qaHHZU6FIlZckLTIYoZEpJiyWes/UwyohLjoT7ByXMPVW474KLKriYsu9mLvTshoGQN7PDtalt/46NE4O0HpriWHv5+qmuSQ6j75+h74MfkVEyGnOFZg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v8 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHcIXHV8u4+2vuOCEqK2GduOtSmvw==
Date: Tue, 9 Sep 2025 10:09:31 +0000
Message-ID:
 <9c52c50708132cdd10f9f3b4168b268a19224c62.1757412099.git.leonid_komarianskyi@epam.com>
References: <cover.1757412099.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757412099.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU4PR03MB10645:EE_
x-ms-office365-filtering-correlation-id: 77c6cf2f-833e-4002-b1df-08ddef88f874
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7OjUufHjWxVmOGw+w2pOmROAuwBoQAQNL3zqNl/9Vv6tEs1KZ1LNoVkTYf?=
 =?iso-8859-1?Q?V5/gyp+B1G0tCIa4Yfq+RvA1MMsQc8CuQDl9hPjv+yvCOuyX5LPoqpSieg?=
 =?iso-8859-1?Q?E3RafDV+VM4Ob7xIjm/WwLQms4G8ZRhNuoul2tJ2cYN+HU3eSpvP10dxEg?=
 =?iso-8859-1?Q?friC8gxKPF5u4Tjy3EjhBIvfPIlvU6jmDuxarYlYa2pL3KrwR5hLQR5r6I?=
 =?iso-8859-1?Q?+6hTFlD6ghz3cYl+nferJae7H6C5VJBk0VreTe/Zd35lqaF7/AKA87uKyU?=
 =?iso-8859-1?Q?2f8GcMGLGGmC3Nb0D631LXz5nWejBqiyIvISHoDFENLFIKYDRBn0sy+RwK?=
 =?iso-8859-1?Q?CC/RAl93TnNyyqGhZ6P5RWhWW9KrH+odGIy5dgr7NcgLw8i5srG++Femcu?=
 =?iso-8859-1?Q?Eh9HIV9FHKqvJJfzz+fzJ5EUYlNB0AjyIdTNUx9Yk3Ba2WaKrHfiuTXQDM?=
 =?iso-8859-1?Q?G+mksAquQvBwf/nvRxuWHNT28Vedw6iDBLOzEHuRAnJoVrhcU2i0+SQcaC?=
 =?iso-8859-1?Q?Grkq3a6v+sXjFAGqACAPLUuOT9Vywm8AdLkTNkbHIy+4FB+HbmO36r0N7b?=
 =?iso-8859-1?Q?6657WIPJejm2EOM5T5EUZA9QFWO7jJW2weJyGW7cn7bU54L9iullvbtZyX?=
 =?iso-8859-1?Q?hNzp+VGnoEybmBSdELDnfgMos14z93GZrznj9o7qU3o2xB8bxz94dcAvZJ?=
 =?iso-8859-1?Q?m2CIpNlQCTfNeT/hleIDJ5S15cfI1L7Nh7f9bnyE1XhaGCR2dGHx88HxNz?=
 =?iso-8859-1?Q?CRvPwrhrGMD2rE0w1YPa77lPDHDfkzno1q54acaAbJrDg6zvmttRNOA7sn?=
 =?iso-8859-1?Q?F/+6GiHc7IpE40bHn+k5Zlbe5KD/uJKKPbaYT9tOVE7uA0qKCnQ2FzvjlA?=
 =?iso-8859-1?Q?NhTO36PmONIj/zGPJ8e6mg/7A/UTPhKPEaICLgm7ZZxVlesW+YmqaCHlYI?=
 =?iso-8859-1?Q?fb5AZHf0MNcJlxGQVsvBHty83XC2KhdgqnzMmAm1L75U75o02/WnZ7XYi3?=
 =?iso-8859-1?Q?hS4Vk+JCU7OguI28K9aU+TxdyfXhyEi+LpJKgwWEfipwityxu6QIWE3nGm?=
 =?iso-8859-1?Q?IftsMZObjJBGvF9xlpwBYgDv6FuT1KB5/v0NDJy94IHlsCIFONjHP5gMpC?=
 =?iso-8859-1?Q?Npnq0GJYrCFNojre4eCWgAM1YiSuxjUgvrhOJpKyRuitwiA3Leu5ihdN1Q?=
 =?iso-8859-1?Q?4MaaxDFE9UBh4pX8fxzMTP3gDWHDTeEA6kBZqL+tdYkdfLVDrBf2OmXwF/?=
 =?iso-8859-1?Q?m23uaBsQR3em2MSg2k2q+ns+3rY/N2/iMLYbtOHYBXsguJSOhr5gmTMklC?=
 =?iso-8859-1?Q?v4ZxYemJcWs9nvT644bgl0fxyCveeG1I7cE4yX3aWmym9J0CL8hHKJdPvp?=
 =?iso-8859-1?Q?wMxkcn2ayONttS5nCceRNr3fcQu+Buo/9SnP0Locs4Inv+EbhC4zefYcxW?=
 =?iso-8859-1?Q?UsD1adzkfgEQ+DDLL6ftR3X3YhLsy0s9nez1gAtDov5Ljm/9m4BkIGv8VW?=
 =?iso-8859-1?Q?d7L2tHs/MbtTia6yg9npKTil9yI0NiJh4agoKLA0DZxA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qmKqSwlqwoP4kxvDRuxe4sNGbMarEAS0QeP2Dy8ZTn1C7eKn6FXQYiJpXC?=
 =?iso-8859-1?Q?QGUeQFtHkDy6QKzm2herLJIpxKhxKX69p6OkDhh4THdJktunaiRSD6vlH1?=
 =?iso-8859-1?Q?eAF9jGegK3bsjevSSziw5mKDOhJFl93bp3wCT0Ta1MzOVe4TUB9JoJFEG3?=
 =?iso-8859-1?Q?XVfZ+cmvgZalqtPZ4QSpNBCeRgE/i+R7oTFqyjKDDyE6vonm+Qa4jM800A?=
 =?iso-8859-1?Q?WXlPcSugeSBELm5v4TPcXUcAaGh6O9/eMkzJtL3txwGnsybLMm/Sk1Hw4n?=
 =?iso-8859-1?Q?yXOfMXhR5aoCqrvzKz83974cgy96NP1DQv7F+pyoFP1efEXWmVSWVCyZib?=
 =?iso-8859-1?Q?P7b9qnbGiNIQmGpoQtRVgCE2ytrJMTumVsls65z9JHrs3lpWjmzn0JVCFh?=
 =?iso-8859-1?Q?vD6OF9J0CsPw9Jz6bqGRtZQP3rZlkwNu+6Pd3/MSDwvjR07tliPkCeA8Q6?=
 =?iso-8859-1?Q?oKH21HEgtVyE7daVFzCUVHgEYS9FA7bVEe4AGYHOLRabLTF0tIUE96mEt/?=
 =?iso-8859-1?Q?KvaZGd8wI1ybmGp93sRojD3j+T8miXgcPjOlSlF219dG0fCmCMI3faF/RY?=
 =?iso-8859-1?Q?D4mCjdya5A+j4cE9c34WVWafwI5D37+MS4lV6iCtj0BeskAgtv1l+Xt4ye?=
 =?iso-8859-1?Q?b/yFKanIH6vDa/rm8sqVKgV+q+VJt1qcY7vMAESl3Y68TKsiD2Vmj5CgJR?=
 =?iso-8859-1?Q?tYAry2/oGIkbUZbx8gzOxE6H+U0GFuGuHdO9hEobjdmYsjEXYQIjN9HdpX?=
 =?iso-8859-1?Q?mgyYyNMQq04KHS1UKL+2Pi91QKcH13qAta2BudJ8hTJ7D1PfYnd9BsVbzS?=
 =?iso-8859-1?Q?guGuZxCR8FzauteihOWiPUb/I6gMcWbZI6VN3VttZlLxd81jPTS/8MtN6v?=
 =?iso-8859-1?Q?TR+41jUSiRpS4/EaSp/aMGcutw4u+ksC7W1DH/iYXlxcFrUcE2Kxb44BU8?=
 =?iso-8859-1?Q?zS25UqPjKmo+iTSQBH2LWHtn3NXnjmn3wTB7kD1WYF+7giKBEiXut6r9fe?=
 =?iso-8859-1?Q?ELgZco13acRO1uRLcks50OLfXa+K581NqDk9JRbWzI1Fc6q6e6+ocNbgYx?=
 =?iso-8859-1?Q?8ZJALBbIv2i7k8d1weAwXP764em18s9fh7CXtm9/5QkK1A8k4HpxgDtX+m?=
 =?iso-8859-1?Q?O9Tb5MuC3skRcx44JPzls5uoWE8XXZtWuJES2LfxM9HWeheByxe0ne5iZL?=
 =?iso-8859-1?Q?R9iMEs3Vj0IZXv+iDsFlhGCFMEj2Ko851EsnQBc9pL9ouldFQeldz1+klH?=
 =?iso-8859-1?Q?uAhMBI6YzqqDdmzi2xjcUdQ3NjSVkSaf7Tn+28Ja6codAzEZgeJW6iqP72?=
 =?iso-8859-1?Q?eABHvJVcsI7UELZlVsFcGSElYP9lMgJ45YAHmbja+RHx+AxyeT79woQ9ws?=
 =?iso-8859-1?Q?emENlZh9XERuCxYUCy9zm7X9ZdVp1WMvMKn9T/lH9Ev3MLb6usEHdGjtf3?=
 =?iso-8859-1?Q?VL1OJ6Stb0C8wpuC8Ll4Ec+3opg8mVC2DoVK3J6S6GpU5gZzza32JipWg4?=
 =?iso-8859-1?Q?0p2IceClaQ5DZGLCbGOSWsGa4K5bH59f8l+YTKmQqhvzSux/V1DTeihtNN?=
 =?iso-8859-1?Q?bf1MAoM9uuIsDRvrBxqXWnifqZ51ijX5GnoxxKlrwyIdGomzmDPqgd7zLw?=
 =?iso-8859-1?Q?SdJ6dxylx9KPAUCh88ZdNI1UTcBMcNynMqJJrj0siNEOEHk/8hqo2G4PVm?=
 =?iso-8859-1?Q?ruQz4Ya34TtMQX4ME5g=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c6cf2f-833e-4002-b1df-08ddef88f874
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 10:09:31.8701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 09M40DvE8kvZqI/XAEDwkeFwezEa+x6/q6MITwck21TKleHPyB5GJWs9N/k+BP3gBem7pETLutO5k25p71DL9M8QJmLWpKafn/H0rfEF/4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10645

Implemented support for GICv3.1 extended SPI registers for vGICv3,
allowing the emulation of eSPI-specific behavior for guest domains.
The implementation includes read and write emulation for eSPI-related
registers (e.g., GICD_ISENABLERnE, GICD_IROUTERnE, and others),
following a similar approach to the handling of regular SPIs.

The eSPI registers, previously located in reserved address ranges,
are now adjusted to support MMIO read and write operations correctly
when CONFIG_GICV3_ESPI is enabled.

The availability of eSPIs and the number of emulated extended SPIs
for guest domains is reported by setting the appropriate bits in the
GICD_TYPER register, based on the number of eSPIs requested by the
domain and supported by the hardware. In cases where the configuration
option is disabled, the hardware does not support eSPIs, or the domain
does not request such interrupts, the functionality remains unchanged.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V8:
- added acked-by from Julien Grall

Changes in V7:
- minor: renamed vgic_get_rank to vgic_common_rank_offset
- minor: updated comment for vgic_common_rank_offset
- minor: restored comment for vgic_store_irouter
- minor: added sanity checks with asserts to helper functions
- added reviewed-by from Oleksandr Tyshchenko

Changes in V6:
- introduced helper functions: vgic_get_rank and vgic_get_reg_offset to
  avoid boilerplate code and simplify changes
- fixed index initialization in the previous patch ([08/12] xen/arm:
  vgic: add resource management for extended SPIs) and removed index
  conversion for vgic_enable_irqs(), vgic_disable_irqs(),
  vgic_set_irqs_pending(), and vgic_check_inflight_irqs_pending()
- grouped SPI and eSPI registers
- updated the comment for vgic_store_irouter to reflect parameter
  changes
- minor change: changed the macros ESPI_INTID2IDX and ESPI_IDX2INTID
  into appropriate inline functions introduced in the previous patch

Changes in V5:
- since eSPI-specific defines and macros are now available even when the
  appropriate config is disabled, this allows us to remove many
  #ifdef guards and reuse the existing code for regular SPIs for eSPIs as
  well, as eSPIs are processed similarly. This improves code readability
  and consolidates the register ranges for SPIs and eSPIs in a single
  place, simplifying future changes or fixes for SPIs and their
  counterparts from the extended range
- moved vgic_ext_rank_offset() from
  [08/12] xen/arm: vgic: add resource management for extended SPIs
  as the function was unused before this patch
- added stub implementation of vgic_ext_rank_offset() when CONFIG_GICV3_ESP=
I=3Dn
- removed unnecessary defines for reserved ranges, which were introduced in
  V4 to reduce the number of #ifdefs. The issue is now resolved by
  allowing the use of SPI-specific offsets and reworking the logic

Changes in V4:
- added missing RAZ and write ignore eSPI-specific registers ranges:
  GICD_NSACRnE and GICD_IGRPMODRnE
- changed previously reserved range to cover GICD_NSACRnE and
  GICD_IGRPMODRnE
- introduced GICD_RESERVED_RANGE<n>_START/END defines to remove
  hardcoded values and reduce the number of ifdefs
- fixed reserved ranges with eSPI option enabled: added missing range
  0x0F30-0x0F7C
- updated the logic for domains that do not support eSPI, but Xen is
  compiled with the eSPI option. Now, prior to other MMIO checks, we
  verify whether eSPI is available for the domain or not. If not, it
  behaves as it does currently - RAZ and WI
- fixed print for GICD_ICACTIVERnE
- fixed new lines formatting for switch-case

Changes in V3:
- changed vgic_store_irouter parameters - instead of offset virq is
  used, to remove the additional bool espi parameter and simplify
  checks. Also, adjusted parameters for regular SPI. Since the offset
  parameter was used only for calculating virq number and then reused for
  finding rank offset, it will not affect functionality.
- fixed formatting for goto lables - added newlines after condition
- fixed logs for GICD_ISACTIVERnE and GICD_ICACTIVERnE handlers
- removed #ifdefs in 2 places where they were adjacent and could be merged

Changes in V2:
- add missing rank index conversion for pending and inflight irqs
---
 xen/arch/arm/include/asm/vgic.h |   4 +
 xen/arch/arm/vgic-v3.c          | 203 +++++++++++++++++++++++++-------
 xen/arch/arm/vgic.c             |  22 ++++
 3 files changed, 185 insertions(+), 44 deletions(-)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 24a4a968c3..31b3d3e5ec 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -324,6 +324,10 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct v=
cpu *v,
                                               unsigned int b,
                                               unsigned int n,
                                               unsigned int s);
+extern struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v,
+                                                  unsigned int b,
+                                                  unsigned int n,
+                                                  unsigned int s);
 extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int ir=
q);
 extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
 extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 4369c55177..8b1c8eef80 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -107,17 +107,12 @@ static uint64_t vgic_fetch_irouter(struct vgic_irq_ra=
nk *rank,
 /*
  * Store an IROUTER register in a convenient way and migrate the vIRQ
  * if necessary. This function only deals with IROUTER32 and onwards.
- *
- * Note the offset will be aligned to the appropriate boundary.
  */
 static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *ran=
k,
-                               unsigned int offset, uint64_t irouter)
+                               unsigned int virq, uint64_t irouter)
 {
     struct vcpu *new_vcpu, *old_vcpu;
-    unsigned int virq;
-
-    /* There is 1 vIRQ per IROUTER */
-    virq =3D offset / NR_BYTES_PER_IROUTER;
+    unsigned int offset;
=20
     /*
      * The IROUTER0-31, used for SGIs/PPIs, are reserved and should
@@ -673,6 +668,36 @@ write_reserved:
     return 1;
 }
=20
+/*
+ * The assumption is that offsets below espi_base are for
+ * regular SPI, while those at or above are for eSPI.
+ */
+static inline struct vgic_irq_rank *vgic_common_rank_offset(struct vcpu *v=
,
+                                                            unsigned int b=
,
+                                                            uint32_t reg,
+                                                            unsigned int s=
,
+                                                            uint32_t spi_b=
ase,
+                                                            uint32_t espi_=
base)
+{
+    ASSERT(spi_base < espi_base);
+
+    if ( reg < espi_base )
+        return vgic_rank_offset(v, b, reg - spi_base, s);
+    else
+        return vgic_ext_rank_offset(v, b, reg - espi_base, s);
+}
+
+static inline uint32_t vgic_get_reg_offset(uint32_t reg, uint32_t spi_base=
,
+                                           uint32_t espi_base)
+{
+    ASSERT(spi_base < espi_base);
+
+    if ( reg < espi_base )
+        return reg - spi_base;
+    else
+        return reg - espi_base;
+}
+
 static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu =
*v,
                                             mmio_info_t *info, uint32_t re=
g,
                                             register_t *r)
@@ -685,13 +710,17 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
r *name, struct vcpu *v,
     {
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
         /* We do not implement security extensions for guests, read zero *=
/
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
         goto read_as_zero;
=20
     case VRANGE32(GICD_ISENABLER, GICD_ISENABLERN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 1, reg, DABT_WORD, GICD_ISENAB=
LER,
+                                       GICD_ISENABLERnE);
         if ( rank =3D=3D NULL ) goto read_as_zero;
         vgic_lock_rank(v, rank, flags);
         *r =3D vreg_reg32_extract(rank->ienable, info);
@@ -699,8 +728,10 @@ static int __vgic_v3_distr_common_mmio_read(const char=
 *name, struct vcpu *v,
         return 1;
=20
     case VRANGE32(GICD_ICENABLER, GICD_ICENABLERN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 1, reg, DABT_WORD, GICD_ICENAB=
LER,
+                                       GICD_ICENABLERnE);
         if ( rank =3D=3D NULL ) goto read_as_zero;
         vgic_lock_rank(v, rank, flags);
         *r =3D vreg_reg32_extract(rank->ienable, info);
@@ -710,22 +741,29 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
r *name, struct vcpu *v,
     /* Read the pending status of an IRQ via GICD/GICR is not supported */
     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
         goto read_as_zero;
=20
     /* Read the active status of an IRQ via GICD/GICR is not supported */
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
         goto read_as_zero;
=20
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
     {
-        uint32_t ipriorityr;
+        uint32_t ipriorityr, offset;
         uint8_t rank_index;
=20
         if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD ) goto b=
ad_width;
-        rank =3D vgic_rank_offset(v, 8, reg - GICD_IPRIORITYR, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 8, reg, DABT_WORD, GICD_IPRIOR=
ITYR,
+                                       GICD_IPRIORITYRnE);
         if ( rank =3D=3D NULL ) goto read_as_zero;
-        rank_index =3D REG_RANK_INDEX(8, reg - GICD_IPRIORITYR, DABT_WORD)=
;
+        offset =3D vgic_get_reg_offset(reg, GICD_IPRIORITYR, GICD_IPRIORIT=
YRnE);
+        rank_index =3D REG_RANK_INDEX(8, offset, DABT_WORD);
=20
         vgic_lock_rank(v, rank, flags);
         ipriorityr =3D ACCESS_ONCE(rank->ipriorityr[rank_index]);
@@ -737,14 +775,17 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
r *name, struct vcpu *v,
     }
=20
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
     {
-        uint32_t icfgr;
+        uint32_t icfgr, offset;
=20
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 2, reg - GICD_ICFGR, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 2, reg, DABT_WORD, GICD_ICFGR,
+                                       GICD_ICFGRnE);
         if ( rank =3D=3D NULL ) goto read_as_zero;
+        offset =3D vgic_get_reg_offset(reg, GICD_ICFGR, GICD_ICFGRnE);
         vgic_lock_rank(v, rank, flags);
-        icfgr =3D rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGR, DABT_WORD=
)];
+        icfgr =3D rank->icfg[REG_RANK_INDEX(2, offset, DABT_WORD)];
         vgic_unlock_rank(v, rank, flags);
=20
         *r =3D vreg_reg32_extract(icfgr, info);
@@ -782,12 +823,16 @@ static int __vgic_v3_distr_common_mmio_write(const ch=
ar *name, struct vcpu *v,
     {
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
         /* We do not implement security extensions for guests, write ignor=
e */
         goto write_ignore_32;
=20
     case VRANGE32(GICD_ISENABLER, GICD_ISENABLERN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 1, reg, DABT_WORD, GICD_ISENAB=
LER,
+                                       GICD_ISENABLERnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
         vgic_lock_rank(v, rank, flags);
         tr =3D rank->ienable;
@@ -797,8 +842,10 @@ static int __vgic_v3_distr_common_mmio_write(const cha=
r *name, struct vcpu *v,
         return 1;
=20
     case VRANGE32(GICD_ICENABLER, GICD_ICENABLERN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 1, reg, DABT_WORD, GICD_ICENAB=
LER,
+                                       GICD_ICENABLERnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
         vgic_lock_rank(v, rank, flags);
         tr =3D rank->ienable;
@@ -808,8 +855,10 @@ static int __vgic_v3_distr_common_mmio_write(const cha=
r *name, struct vcpu *v,
         return 1;
=20
     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ISPENDR, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 1, reg, DABT_WORD, GICD_ISPEND=
R,
+                                       GICD_ISPENDRnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
=20
         vgic_set_irqs_pending(v, r, rank->index);
@@ -817,8 +866,10 @@ static int __vgic_v3_distr_common_mmio_write(const cha=
r *name, struct vcpu *v,
         return 1;
=20
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 1, reg, DABT_WORD, GICD_ICPEND=
R,
+                                       GICD_ICPENDRnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
=20
         vgic_check_inflight_irqs_pending(v, rank->index, r);
@@ -826,28 +877,42 @@ static int __vgic_v3_distr_common_mmio_write(const ch=
ar *name, struct vcpu *v,
         goto write_ignore;
=20
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        printk(XENLOG_G_ERR
-               "%pv: %s: unhandled word write %#"PRIregister" to ISACTIVER=
%d\n",
-               v, name, r, reg - GICD_ISACTIVER);
+        if ( reg < GICD_ISACTIVERnE )
+            printk(XENLOG_G_ERR
+                   "%pv: %s: unhandled word write %#"PRIregister" to ISACT=
IVER%d\n",
+                   v, name, r, reg - GICD_ISACTIVER);
+        else
+            printk(XENLOG_G_ERR
+                   "%pv: %s: unhandled word write %#"PRIregister" to ISACT=
IVER%dE\n",
+                   v, name, r, reg - GICD_ISACTIVERnE);
         return 0;
=20
     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
-        printk(XENLOG_G_ERR
-               "%pv: %s: unhandled word write %#"PRIregister" to ICACTIVER=
%d\n",
-               v, name, r, reg - GICD_ICACTIVER);
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+        if ( reg < GICD_ICACTIVERnE )
+            printk(XENLOG_G_ERR
+                   "%pv: %s: unhandled word write %#"PRIregister" to ICACT=
IVER%d\n",
+                   v, name, r, reg - GICD_ICACTIVER);
+        else
+            printk(XENLOG_G_ERR
+                   "%pv: %s: unhandled word write %#"PRIregister" to ICACT=
IVER%dE\n",
+                   v, name, r, reg - GICD_ICACTIVERnE);
         goto write_ignore_32;
=20
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
     {
-        uint32_t *ipriorityr, priority;
+        uint32_t *ipriorityr, priority, offset;
=20
         if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD ) goto b=
ad_width;
-        rank =3D vgic_rank_offset(v, 8, reg - GICD_IPRIORITYR, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 8, reg, DABT_WORD, GICD_IPRIOR=
ITYR,
+                                       GICD_IPRIORITYRnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
+        offset =3D vgic_get_reg_offset(reg, GICD_IPRIORITYR, GICD_IPRIORIT=
YRnE);
         vgic_lock_rank(v, rank, flags);
-        ipriorityr =3D &rank->ipriorityr[REG_RANK_INDEX(8, reg - GICD_IPRI=
ORITYR,
-                                                      DABT_WORD)];
+        ipriorityr =3D &rank->ipriorityr[REG_RANK_INDEX(8, offset, DABT_WO=
RD)];
         priority =3D ACCESS_ONCE(*ipriorityr);
         vreg_reg32_update(&priority, r, info);
         ACCESS_ONCE(*ipriorityr) =3D priority;
@@ -859,17 +924,23 @@ static int __vgic_v3_distr_common_mmio_write(const ch=
ar *name, struct vcpu *v,
         goto write_ignore_32;
=20
     case VRANGE32(GICD_ICFGR + 4, GICD_ICFGRN): /* PPI + SPIs */
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+    {
+        uint32_t offset;
+
         /* ICFGR1 for PPI's, which is implementation defined
            if ICFGR1 is programmable or not. We chose to program */
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 2, reg - GICD_ICFGR, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 2, reg, DABT_WORD, GICD_ICFGR,
+                                       GICD_ICFGRnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
+        offset =3D vgic_get_reg_offset(reg, GICD_ICFGR, GICD_ICFGRnE);
         vgic_lock_rank(v, rank, flags);
-        vreg_reg32_update(&rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGR,
-                                                     DABT_WORD)],
+        vreg_reg32_update(&rank->icfg[REG_RANK_INDEX(2, offset, DABT_WORD)=
],
                           r, info);
         vgic_unlock_rank(v, rank, flags);
         return 1;
+    }
=20
     default:
         printk(XENLOG_G_ERR
@@ -1129,6 +1200,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
             typer |=3D GICD_TYPE_LPIS;
=20
         typer |=3D (v->domain->arch.vgic.intid_bits - 1) << GICD_TYPE_ID_B=
ITS_SHIFT;
+#ifdef CONFIG_GICV3_ESPI
+        if ( v->domain->arch.vgic.nr_espis > 0 )
+        {
+            /* Set eSPI support bit for the domain */
+            typer |=3D GICD_TYPER_ESPI;
+            /* Set ESPI range bits */
+            typer |=3D (DIV_ROUND_UP(v->domain->arch.vgic.nr_espis, 32) - =
1)
+                       << GICD_TYPER_ESPI_RANGE_SHIFT;
+        }
+#endif
=20
         *r =3D vreg_reg32_extract(typer, info);
=20
@@ -1194,6 +1275,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
         /*
          * Above all register are common with GICR and GICD
          * Manage in common
@@ -1201,6 +1292,7 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mm=
io_info_t *info,
         return __vgic_v3_distr_common_mmio_read("vGICD", v, info, gicd_reg=
, r);
=20
     case VRANGE32(GICD_NSACR, GICD_NSACRN):
+    case VRANGE32(GICD_NSACRnE, GICD_NSACRnEN):
         /* We do not implement security extensions for guests, read zero *=
/
         goto read_as_zero_32;
=20
@@ -1216,27 +1308,30 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, =
mmio_info_t *info,
         /* Replaced with GICR_ISPENDR0. So ignore write */
         goto read_as_zero_32;
=20
-    case VRANGE32(0x0F30, 0x60FC):
+    case VRANGE32(0x0F30, 0x0FFC):
         goto read_reserved;
=20
     case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
+    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
     {
         uint64_t irouter;
+        uint32_t offset;
=20
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 64, gicd_reg - GICD_IROUTER,
-                                DABT_DOUBLE_WORD);
+        rank =3D vgic_common_rank_offset(v, 64, gicd_reg, DABT_DOUBLE_WORD=
,
+                                       GICD_IROUTER, GICD_IROUTERnE);
         if ( rank =3D=3D NULL ) goto read_as_zero;
+        offset =3D vgic_get_reg_offset(gicd_reg, GICD_IROUTER, GICD_IROUTE=
RnE);
         vgic_lock_rank(v, rank, flags);
-        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);
+        irouter =3D vgic_fetch_irouter(rank, offset);
         vgic_unlock_rank(v, rank, flags);
=20
         *r =3D vreg_reg64_extract(irouter, info);
=20
         return 1;
     }
-
-    case VRANGE32(0x7FE0, 0xBFFC):
+    case VRANGE32(0x3700, 0x60FC):
+    case VRANGE32(0xA004, 0xBFFC):
         goto read_reserved;
=20
     case VRANGE32(0xC000, 0xFFCC):
@@ -1382,12 +1477,23 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v,=
 mmio_info_t *info,
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
         /* Above registers are common with GICR and GICD
          * Manage in common */
         return __vgic_v3_distr_common_mmio_write("vGICD", v, info,
                                                  gicd_reg, r);
=20
     case VRANGE32(GICD_NSACR, GICD_NSACRN):
+    case VRANGE32(GICD_NSACRnE, GICD_NSACRnEN):
         /* We do not implement security extensions for guests, write ignor=
e */
         goto write_ignore_32;
=20
@@ -1405,26 +1511,35 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v,=
 mmio_info_t *info,
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
         return 0;
=20
-    case VRANGE32(0x0F30, 0x60FC):
+    case VRANGE32(0x0F30, 0x0FFC):
         goto write_reserved;
=20
     case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
+    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
     {
         uint64_t irouter;
+        unsigned int offset, virq;
=20
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 64, gicd_reg - GICD_IROUTER,
-                                DABT_DOUBLE_WORD);
+        rank =3D vgic_common_rank_offset(v, 64, gicd_reg, DABT_DOUBLE_WORD=
,
+                                       GICD_IROUTER, GICD_IROUTERnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
+        offset =3D vgic_get_reg_offset(gicd_reg, GICD_IROUTER, GICD_IROUTE=
RnE);
         vgic_lock_rank(v, rank, flags);
-        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);
+        irouter =3D vgic_fetch_irouter(rank, offset);
         vreg_reg64_update(&irouter, r, info);
-        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTER, irout=
er);
+        /* There is 1 vIRQ per IROUTER */
+        if ( gicd_reg < GICD_IROUTERnE )
+            virq =3D offset / NR_BYTES_PER_IROUTER;
+        else
+            virq =3D espi_idx_to_intid(offset / NR_BYTES_PER_IROUTER);
+        vgic_store_irouter(v->domain, rank, virq, irouter);
         vgic_unlock_rank(v, rank, flags);
         return 1;
     }
=20
-    case VRANGE32(0x7FE0, 0xBFFC):
+    case VRANGE32(0x3700, 0x60FC):
+    case VRANGE32(0xA004, 0xBFFC):
         goto write_reserved;
=20
     case VRANGE32(0xC000, 0xFFCC):
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index eb22de6aa6..3ebdf9953f 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -170,6 +170,18 @@ int domain_vgic_register(struct domain *d, unsigned in=
t *mmio_count)
 }
=20
 #ifdef CONFIG_GICV3_ESPI
+/*
+ * The function behavior is the same as for regular SPIs (vgic_rank_offset=
),
+ * but it operates with extended SPI ranks.
+ */
+struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int b,
+                                           unsigned int n, unsigned int s)
+{
+    unsigned int rank =3D REG_RANK_NR(b, (n >> s));
+
+    return vgic_get_rank(v, rank + EXT_RANK_MIN);
+}
+
 static unsigned int vgic_num_spi_lines(struct domain *d)
 {
     return d->arch.vgic.nr_spis + d->arch.vgic.nr_espis;
@@ -210,6 +222,16 @@ static unsigned int vgic_num_spi_lines(struct domain *=
d)
     return d->arch.vgic.nr_spis;
 }
=20
+/*
+ * It is expected that, in the case of CONFIG_GICV3_ESPI=3Dn, the function=
 will
+ * return NULL. In this scenario, mmio_read/mmio_write will be treated as
+ * RAZ/WI, as expected.
+ */
+struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int b,
+                                           unsigned int n, unsigned int s)
+{
+    return NULL;
+}
 #endif
=20
 static unsigned int vgic_num_alloc_irqs(struct domain *d)
--=20
2.34.1

