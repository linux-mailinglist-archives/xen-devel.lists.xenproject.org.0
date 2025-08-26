Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB2B36765
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094540.1449912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ8-0000tI-3O; Tue, 26 Aug 2025 14:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094540.1449912; Tue, 26 Aug 2025 14:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ7-0000dk-PD; Tue, 26 Aug 2025 14:05:53 +0000
Received: by outflank-mailman (input) for mailman id 1094540;
 Tue, 26 Aug 2025 14:05:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqrf=3G=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uquJ3-00072q-AZ
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:05:49 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c39b460e-8285-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 16:05:48 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PAXPR03MB7887.eurprd03.prod.outlook.com (2603:10a6:102:216::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 14:05:40 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 14:05:40 +0000
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
X-Inumbo-ID: c39b460e-8285-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDFJ5ysZWDTbrVdRxekgE4poOo5AEtx09MyZt9BilnipCuhYMijoUUZWe9k8mpEsHFMwpGO5VFzKZRMYq6OtfoTjbpjii2JFW76AmUM/vUjoVWiX50ru1RlKN4D2HLE+EQ+0g86HNHA7PHeatpOZZ2qcJxcEj3qIa+TQUn0X8xqmi7fEYcCX91dIfEuG5MOo8gPFVKA0IqQjrUZDNzdnoU7oNSd1OABS3649qnVfpi7LNLld0cWZFg3eURUvYcz3JwHTARJiazBRIfQCbei8SuxT5pVAUtIT9LyYHRa0/nDE6INPxODBj/iTEUMhWa5TfUx185KP+2ghNESs6SHtwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LR0XpG1PYMsgTHsPiGadhzjQXzc9SBlRtpWVb1VKY+E=;
 b=qp1j7vm9CO4ZBhjUmT6MyaBP7d5cT/0G5qDA6jWsA7QCUXkh+JncSbjFDtFbD8iHefCl5JrQ5dnAQzWzn1/Wb7A/5qb8RVgu8OCpW230ZXOe+C6P2mah/SVsAgKndgLwbU1OY6fx2mnB9RzpW+VqV3sgnvHS86QYLl8VR5VdVudH7T04/PtJwDo2gk0iMC+jgWxSpCjSy5rwhva+nH2n/qRnY2/hHCewO8swtGyxtIRDP9I+/9HCy1EYwAkxrLjzav/Z6SIvt0Vmp4QI8tGe/zyLOTn7mqAiZBxPsw2zkuuCV3/69/OJ2sl0jfm9Bu0wLCtxzWM167HdcyjT2zdZFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LR0XpG1PYMsgTHsPiGadhzjQXzc9SBlRtpWVb1VKY+E=;
 b=JUWHJb+7daAPO5HMiRBU09pH9AepiUSH6wCpzWa5e+Xz37imDtLEXwi/0XxckbmHmanBE6eBaFic2twHwzBEi3kLgBGriKI7ZmgD33sl8W/3wVpyZjrdq1HNjs7xG2Co/r4OivCd43tdwT66WDv0eK4O3ybunHL8NWFqEmpOq+TBsRvIakAPWKvwnsYU93l1FYNkoCKjqxvm/aqedUQaPBpDaVu21vjZqa/p26ZgOJ3FRlvzAPj4UVfSutag8osDQ+BRNIfKtsyolm0W7wja7eiv01aAvPicOrKLKPTBu4Xkrt+zH6bCN1gtQ/ehRltKvHPjKqHrlpFpMq0Nh1fWpw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 10/11] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v3 10/11] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHcFpKAKCVIbYC3hEGAz+VsUD3/gQ==
Date: Tue, 26 Aug 2025 14:05:39 +0000
Message-ID:
 <642a994d712a8c9df7aed9dec22124564db83c7e.1756216943.git.leonid_komarianskyi@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756216942.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PAXPR03MB7887:EE_
x-ms-office365-filtering-correlation-id: 298f2d8c-2768-4a6f-36f5-08dde4a9a382
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?NgzIOYyppFOSycWg9NVwPzZx8MZVrjeAHRSqMXxjfcO34ROsqoOJRacW86?=
 =?iso-8859-1?Q?UQRRBC4czftupkD2e85FR0E4p9S9syWXKt4DCbTiY9sNZkGzHWnNSGjTxr?=
 =?iso-8859-1?Q?1iY+/XLrYP76r+0HHGK31pwfus9YM5ZlMJq7QbZJ1E3/XNwB2a0Fbts37o?=
 =?iso-8859-1?Q?vHnyEmC8sLZM0ywcfz991EWlN4pqQ05Dxjuq4T74vV7n+mHo0XzIMHFhpJ?=
 =?iso-8859-1?Q?p/IlZD3FE7qsrRVwRjXtNTJBXNUFWT0P98yLiPf2eSuA4sVrEPBiMwvRRS?=
 =?iso-8859-1?Q?uSzqYIuDLocXomtA/j8Ajs22kW1lVzxPjMLInJHiuZLN/UpII7+aIBbryz?=
 =?iso-8859-1?Q?nfGuvv6nEbzAb4njSvujzBPf9acVecvyqKX1RyICbtMbuEYIV0MWTxN+sJ?=
 =?iso-8859-1?Q?6ajiAGVbdFjSbLF0iRJQ2s0ZC97X4vEJemu7Lo37hcm5536ZOU6UiouXnT?=
 =?iso-8859-1?Q?Hc8DEkNmEyRMF1yLdjmQFV36bBxFewYt82vKIp4PqNHHjC2EThk0918p72?=
 =?iso-8859-1?Q?VO7xI6l1sI/KVv4VcdgyVn/y26Vppp+jbd2Y4FoSlAYzZqwCX3BCxIQbmw?=
 =?iso-8859-1?Q?7dzpMUK0JrNNwFNwbgeXetBoAKpjbFjc8DF4EA+xEjHoE44FRQixxGv4eE?=
 =?iso-8859-1?Q?RLkmuBNIO7JH1E0hpLKCtiqjmdXUhrc/b8FQ5JyyqIuiQuedBbYaYNz4Vh?=
 =?iso-8859-1?Q?9DdalQCO4HJfywXEDu4XdO2mH0IquSSbzlO2AH06iO9SqvueBsacrIjIOC?=
 =?iso-8859-1?Q?e1wXcdxaSHlCpx9qfE6AasrLrMTggPghZipc6yV1nGr35Y0z3O5cy45w5W?=
 =?iso-8859-1?Q?Ts3TsUUeVEADl0ZG6Ob8SVa5H4NAOt4Zv34BPu/9/dcfbf5jZcAym+woIB?=
 =?iso-8859-1?Q?X52oy6oxics1yodGeEa7dnM323dlgdz+UBosfdmE0Nr/eztOh1f54EbM2B?=
 =?iso-8859-1?Q?oQORWr7ynWCYL6AcrOm2G9HnPnbeP/S43BSANyC7cAfAuixe6DlMrha4a1?=
 =?iso-8859-1?Q?uI9zBgUnkdqMbCoGUW6Ds4yFcuzjwMx4BX7TUOciF4sXxVp+qFSGxoUR+3?=
 =?iso-8859-1?Q?azZsA7aQuvoE4emSLdbyDw/DUr1WayTxgxryeffbxnxhu0NHOkUHL4uQA5?=
 =?iso-8859-1?Q?gU2Hr4vPq1Ie2qac3hL9RHrdhMxoCn4D3hv/eCqB45+XVA1st0Y+b2TG5J?=
 =?iso-8859-1?Q?T++lP+mUuT2ZD5W4G4UDLqBNBuBgPsTc1J/ABOgVYq8SmJ6b5usU2ybsdh?=
 =?iso-8859-1?Q?AJvTRdhucGoMI3aku594jXx7gqq4nxJo6tkx3WCp8vOYHRbuzYP3GT3oyS?=
 =?iso-8859-1?Q?F9jbjDBJ6Rd3NoCC56tHtgf+6VpTpgnQSzNRWewLlK0sqYvQhHguU/MFGs?=
 =?iso-8859-1?Q?AP5bFKMqgNIPMW5u2WxPYa8KB0r+zHlCaHCtXvXOe5udfry1kexgUW0h2V?=
 =?iso-8859-1?Q?Uor87hpzVE2qERYjlvvzTj4508E/+pCi1+wSmmuHO/rjtmnloLHIOhqim4?=
 =?iso-8859-1?Q?Rq/7oRfkyPKmymrXXQx02LY2FmiVvDQ/TFKduWFhabTg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TU7tWu0uP+Pv14FAAgiFVdNu21KRjaqa0Wi1SUjFxkItPeAHzzSuiyreBL?=
 =?iso-8859-1?Q?QXKB1R1QIMskCPj/KHpDeX8xmpt4/X772eVhxrRdDWsYCtU3IIlzrAnEkg?=
 =?iso-8859-1?Q?Eg4/YipgSf8NYfvSRNNzo+IOyY/4SLJNVUK15162m3IkApl2+yp+Axs7r2?=
 =?iso-8859-1?Q?3n0hb2JT+HfMAad2CoYE0wrruKO78kGgnROw9RJ0urzB3KTuDZa+uKBK8O?=
 =?iso-8859-1?Q?JZea2gy2+3Zts0h//cM6XzxThW+nlEdrk3e8EQilncGAT4pPmlvzxQfLII?=
 =?iso-8859-1?Q?XWQ6davxYWc1vByDaC7vKVEGJq8yteEzIVpaQL8maLOq6Ff5KNbg4fqQZ9?=
 =?iso-8859-1?Q?UIQN8qM/6c4F0v1AQNDJI9ci/CoGso+WQE2SL0ru12FIowfRJ9VNySc6+3?=
 =?iso-8859-1?Q?QW/QyLwbvFtIQoSeoN2QKJEz3BywuDPfsxyWOPqUwk7HoQyrWF1ZKFxA1S?=
 =?iso-8859-1?Q?FBXABDCZkiVjO/jAz5KOeCGGBXtHlBnkhycEOxollaA+Ug1SjnuZUNP3gq?=
 =?iso-8859-1?Q?XVwdgRTkEXm/fGDdlBL+JgNm2VNU11Lv7PE1d4CPdcSQWmya8+PsA+BElZ?=
 =?iso-8859-1?Q?nKDgfk0tgyEsX/Udz2hrsT2YBz+B4ynkuzsWAZYCBsaRpV8YLZK+hBFCPt?=
 =?iso-8859-1?Q?o/VfFeViHFXGL2qPqmaDbLW5eO3pZgX1Euv0E7fXO7//8YUQfTCvtjEax5?=
 =?iso-8859-1?Q?mE9u71sHI4Q7PF+4j8RpBWxPUow5qTT3mCI1PxoyKdWzzchW8OSMGNtTem?=
 =?iso-8859-1?Q?Ra1VUKrZ8VfmytP8VmIi6a74X9uGMUp2Cz5vlfd+NBux6SehyLR8XxI+vf?=
 =?iso-8859-1?Q?YpWcpgEOLIRs3CyimGB6j4WyjtOpYrBJ+QkiT9Nqf0zKnvyUFYvA/p6gTj?=
 =?iso-8859-1?Q?ZLjFrQZNoRqpVOUrLdXojcHbap4Y3eGkAUODw2AuvYgvo7yQYpu7s71976?=
 =?iso-8859-1?Q?Ycm6zJFlF4mlIWo7j08OEFjXUSpSzeGFDjFNZ0WgHnP4saAAunweo697Ut?=
 =?iso-8859-1?Q?yMSOnE5UTwqeOfRDeLltkwV2wohGRzEJaVJ7jyD8dgb/k4XjWYuUOQzFXy?=
 =?iso-8859-1?Q?KLuzzMCd6oJchzQHfmirqiK2osWtbb7c2v8ZAaz/+s3rie//XK8CtFQLG/?=
 =?iso-8859-1?Q?jxI+NQPyh5WDMoXsvYb4n9+i0X2nRousSTVqTGCSL0eMliVz1NrHTSgaAo?=
 =?iso-8859-1?Q?JDGqY5a9u2l7tjQMt0CcWHB/OxJwLqS5tTHnp5DgbbT3EAP9o1UO/Tnk4X?=
 =?iso-8859-1?Q?SLB7EKd3Ss0m1nYafhd2cGAN0wwPDmdU/7SdL6i4uPRuqNSCmDuzK2w3U6?=
 =?iso-8859-1?Q?lAUMV6HYSNHRwmbKbB+WvcsBkDSqUeedxoDtTK1TF5NQ4j6bRD2M1UkmGt?=
 =?iso-8859-1?Q?TcBws/U98s73wTmOeqA2dRtIGXbiF31NE+v1FwpBSIx+aFsYf98q9SwOGn?=
 =?iso-8859-1?Q?/XVnSAG6llfLSA+sXqg6/RJ1aY7soz7MS+o0g8iH9EsoM0Rdhhfm+EEF8N?=
 =?iso-8859-1?Q?LYiK1Ls+h5Zpjq5sMbju643Chc/4i+oP+i1i0iPIIM/KDRXsSaB0kB4Fsy?=
 =?iso-8859-1?Q?p0dZz+9AG4VHc8gokWy6rnSyALwMfz+JaTEBM/ehy7h8XGPKQoZgoJsV33?=
 =?iso-8859-1?Q?BkS1/hxM5aQM85ktdAmioZbe6UWCAGzFQOihcs1PT8JWiKBqS6iq0BoZp9?=
 =?iso-8859-1?Q?xESWKHkExFvEIceUM6w=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298f2d8c-2768-4a6f-36f5-08dde4a9a382
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 14:05:39.3963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rxl44sUUgLOMMYzHbtWmRXNGJiMa0iq5FIL6gs5vKZ8oLNkvsoDZWHO0EsIl1XS/qyvyPEKmcMaK+djvuSrkVC1FyaLOeyy2euj6YujHcaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7887

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

---
Changes in V2:
- add missing rank index conversion for pending and inflight irqs

Changes in V3:
- changed vgic_store_irouter parameters - instead of offset virq is
  used, to remove the additional bool espi parameter and simplify
  checks. Also, adjusted parameters for regular SPI. Since the offset
  parameter was used only for calculating virq number and then reused for
  finding rank offset, it will not affect functionality.
- fixed formatting for goto lables - added newlines after condition
- fixed logs for GICD_ISACTIVERnE and GICD_ICACTIVERnE handlers
- removed #ifdefs in 2 places where they were adjacent and could be merged
---
 xen/arch/arm/vgic-v3.c | 275 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 266 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 4369c55177..56c539bb1b 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -111,13 +111,10 @@ static uint64_t vgic_fetch_irouter(struct vgic_irq_ra=
nk *rank,
  * Note the offset will be aligned to the appropriate boundary.
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
@@ -685,6 +682,9 @@ static int __vgic_v3_distr_common_mmio_read(const char =
*name, struct vcpu *v,
     {
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+#endif
         /* We do not implement security extensions for guests, read zero *=
/
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
         goto read_as_zero;
@@ -710,11 +710,19 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
r *name, struct vcpu *v,
     /* Read the pending status of an IRQ via GICD/GICR is not supported */
     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+#endif
         goto read_as_zero;
=20
     /* Read the active status of an IRQ via GICD/GICR is not supported */
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+#endif
         goto read_as_zero;
=20
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
@@ -752,6 +760,69 @@ static int __vgic_v3_distr_common_mmio_read(const char=
 *name, struct vcpu *v,
         return 1;
     }
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE, DABT_W=
ORD);
+        if ( rank =3D=3D NULL )
+            goto read_as_zero;
+        vgic_lock_rank(v, rank, flags);
+        *r =3D vreg_reg32_extract(rank->ienable, info);
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE, DABT_W=
ORD);
+        if ( rank =3D=3D NULL )
+            goto read_as_zero;
+        vgic_lock_rank(v, rank, flags);
+        *r =3D vreg_reg32_extract(rank->ienable, info);
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    {
+        uint32_t ipriorityr;
+        uint8_t rank_index;
+
+        if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE, DABT_=
WORD);
+        if ( rank =3D=3D NULL )
+            goto read_as_zero;
+        rank_index =3D REG_RANK_INDEX(8, reg - GICD_IPRIORITYRnE, DABT_WOR=
D);
+
+        vgic_lock_rank(v, rank, flags);
+        ipriorityr =3D ACCESS_ONCE(rank->ipriorityr[rank_index]);
+        vgic_unlock_rank(v, rank, flags);
+
+        *r =3D vreg_reg32_extract(ipriorityr, info);
+
+        return 1;
+    }
+
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+    {
+        uint32_t icfgr;
+
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_WORD)=
;
+        if ( rank =3D=3D NULL )
+            goto read_as_zero;
+        vgic_lock_rank(v, rank, flags);
+        icfgr =3D rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGRnE, DABT_WO=
RD)];
+        vgic_unlock_rank(v, rank, flags);
+
+        *r =3D vreg_reg32_extract(icfgr, info);
+
+        return 1;
+    }
+#endif
+
     default:
         printk(XENLOG_G_ERR
                "%pv: %s: unhandled read r%d offset %#08x\n",
@@ -782,6 +853,9 @@ static int __vgic_v3_distr_common_mmio_write(const char=
 *name, struct vcpu *v,
     {
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+#endif
         /* We do not implement security extensions for guests, write ignor=
e */
         goto write_ignore_32;
=20
@@ -871,6 +945,99 @@ static int __vgic_v3_distr_common_mmio_write(const cha=
r *name, struct vcpu *v,
         vgic_unlock_rank(v, rank, flags);
         return 1;
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE, DABT_W=
ORD);
+        if ( rank =3D=3D NULL )
+            goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        tr =3D rank->ienable;
+        vreg_reg32_setbits(&rank->ienable, r, info);
+        vgic_enable_irqs(v, (rank->ienable) & (~tr), EXT_RANK_IDX2NUM(rank=
->index));
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE, DABT_W=
ORD);
+        if ( rank =3D=3D NULL )
+            goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        tr =3D rank->ienable;
+        vreg_reg32_clearbits(&rank->ienable, r, info);
+        vgic_disable_irqs(v, (~rank->ienable) & tr, EXT_RANK_IDX2NUM(rank-=
>index));
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISPENDRnE, DABT_WOR=
D);
+        if ( rank =3D=3D NULL )
+            goto write_ignore;
+
+        vgic_set_irqs_pending(v, r, EXT_RANK_IDX2NUM(rank->index));
+
+        return 1;
+
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICPENDRnE, DABT_WOR=
D);
+        if ( rank =3D=3D NULL )
+            goto write_ignore;
+
+        vgic_check_inflight_irqs_pending(v, EXT_RANK_IDX2NUM(rank->index),=
 r);
+
+        goto write_ignore;
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        printk(XENLOG_G_ERR
+               "%pv: %s: unhandled word write %#"PRIregister" to ISACTIVER=
%dE\n",
+               v, name, r, reg - GICD_ISACTIVERnE);
+        return 0;
+
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+        printk(XENLOG_G_ERR
+               "%pv: %s: unhandled word write %#"PRIregister" to ICACTIVER=
%dE\n",
+               v, name, r, reg - GICD_ICACTIVER);
+        goto write_ignore_32;
+
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    {
+        uint32_t *ipriorityr, priority;
+
+        if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE, DABT_=
WORD);
+        if ( rank =3D=3D NULL ) goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        ipriorityr =3D &rank->ipriorityr[REG_RANK_INDEX(8, reg - GICD_IPRI=
ORITYRnE,
+                                                      DABT_WORD)];
+        priority =3D ACCESS_ONCE(*ipriorityr);
+        vreg_reg32_update(&priority, r, info);
+        ACCESS_ONCE(*ipriorityr) =3D priority;
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+    }
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_WORD)=
;
+        if ( rank =3D=3D NULL )
+            goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        vreg_reg32_update(&rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGRnE=
,
+                                                     DABT_WORD)],
+                          r, info);
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+#endif
+
     default:
         printk(XENLOG_G_ERR
                "%pv: %s: unhandled write r%d=3D%"PRIregister" offset %#08x=
\n",
@@ -1129,6 +1296,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
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
@@ -1194,6 +1371,18 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+#endif
         /*
          * Above all register are common with GICR and GICD
          * Manage in common
@@ -1216,7 +1405,11 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
         /* Replaced with GICR_ISPENDR0. So ignore write */
         goto read_as_zero_32;
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(0x3100, 0x60FC):
+#else
     case VRANGE32(0x0F30, 0x60FC):
+#endif
         goto read_reserved;
=20
     case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
@@ -1235,8 +1428,30 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
=20
         return 1;
     }
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
+    {
+        uint64_t irouter;
+
+        if ( !vgic_reg64_check_access(dabt) )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 64, gicd_reg - GICD_IROUTERnE,
+                                DABT_DOUBLE_WORD);
+        if ( rank =3D=3D NULL )
+            goto read_as_zero;
+        vgic_lock_rank(v, rank, flags);
+        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTERnE);
+        vgic_unlock_rank(v, rank, flags);
=20
+        *r =3D vreg_reg64_extract(irouter, info);
+
+        return 1;
+    }
+
+    case VRANGE32(0xA004, 0xBFFC):
+#else
     case VRANGE32(0x7FE0, 0xBFFC):
+#endif
         goto read_reserved;
=20
     case VRANGE32(0xC000, 0xFFCC):
@@ -1382,6 +1597,18 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v, =
mmio_info_t *info,
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+#endif
         /* Above registers are common with GICR and GICD
          * Manage in common */
         return __vgic_v3_distr_common_mmio_write("vGICD", v, info,
@@ -1405,26 +1632,56 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v,=
 mmio_info_t *info,
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
         return 0;
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(0x3100, 0x60FC):
+#else
     case VRANGE32(0x0F30, 0x60FC):
+#endif
         goto write_reserved;
=20
     case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
     {
         uint64_t irouter;
+        unsigned int offset, virq;
=20
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 64, gicd_reg - GICD_IROUTER,
-                                DABT_DOUBLE_WORD);
+        offset =3D gicd_reg - GICD_IROUTER;
+        rank =3D vgic_rank_offset(v, 64, offset, DABT_DOUBLE_WORD);
         if ( rank =3D=3D NULL ) goto write_ignore;
         vgic_lock_rank(v, rank, flags);
-        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);
+        irouter =3D vgic_fetch_irouter(rank, offset);
+        vreg_reg64_update(&irouter, r, info);
+        virq =3D offset / NR_BYTES_PER_IROUTER;
+        vgic_store_irouter(v->domain, rank, virq, irouter);
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+    }
+
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
+    {
+        uint64_t irouter;
+        unsigned int offset, virq;
+
+        if ( !vgic_reg64_check_access(dabt) )
+            goto bad_width;
+        offset =3D gicd_reg - GICD_IROUTERnE;
+        rank =3D vgic_ext_rank_offset(v, 64, offset, DABT_DOUBLE_WORD);
+        if ( rank =3D=3D NULL )
+            goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        irouter =3D vgic_fetch_irouter(rank, offset);
         vreg_reg64_update(&irouter, r, info);
-        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTER, irout=
er);
+        virq =3D ESPI_IDX2INTID(offset / NR_BYTES_PER_IROUTER);
+        vgic_store_irouter(v->domain, rank, virq, irouter);
         vgic_unlock_rank(v, rank, flags);
         return 1;
     }
=20
+    case VRANGE32(0xA004, 0xBFFC):
+#else
     case VRANGE32(0x7FE0, 0xBFFC):
+#endif
         goto write_reserved;
=20
     case VRANGE32(0xC000, 0xFFCC):
--=20
2.34.1

