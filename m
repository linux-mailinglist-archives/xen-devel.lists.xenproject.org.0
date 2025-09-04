Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF794B446D9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110722.1459803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuG9J-000778-8P; Thu, 04 Sep 2025 20:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110722.1459803; Thu, 04 Sep 2025 20:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuG9J-00073y-4N; Thu, 04 Sep 2025 20:01:37 +0000
Received: by outflank-mailman (input) for mailman id 1110722;
 Thu, 04 Sep 2025 20:01:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukh3=3P=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uuG9I-0005Me-2V
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:01:36 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5c9f06b-89c9-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 22:01:35 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV2PR03MB10974.eurprd03.prod.outlook.com (2603:10a6:150:27a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 20:01:34 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 20:01:34 +0000
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
X-Inumbo-ID: f5c9f06b-89c9-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmBQ9eHFyeTYg+SbovRQYmI9bsTrqsrQNS79LwhoGKvGPjbX8Yz4r9UdpR4TXg0yHaXNme4cxfq4PaPW5QHqMrAvxzpRYmdoQABpAOmAxylFvRMGHgHSPunb+/lrRFxwvcN2yPT9JuPGx7SZpujpQvUvg9vDZAS1irBQ+kPcWCbxu2S9cFWhdBn8zfjIP73bv1Xm5UBL786Wc5BuZmoQDMyMNsYJuYWGJ6FZ+OWNMuRj15lK0p9dI1MFBrmuKA91k/4BBOazSkkm9xpH2WGo3AB5hXEi+ghSroNc14FihNdnXOPbUr51rBmlq7naKgKSO71OlR5RXMSYXC+k/vpQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8amQj52uB6F8lrYVBAs4+YtHsqR9Gt74UGDRJFJCFA8=;
 b=Q+tziy9Yrgk5yH2IA2JIigiF3kn6K7QTIK+P97/x+yr+2AwZIWy6Vf9rFDtOxPpNwAwJ7JTb7aTZs5xiHug2GS2nr7ck+uulZdWEW+UYgcyXMSNTp8BZP1mKaTv5nxxznPiNRr91B+DOI9YPei7RRXxIHkhMLFxlUkydR5GVpYheLH6hkV23D3SUuQSFUJ8QaurzOegsfVEoG8oMAX98QCW+BsaRDRissjmTiZvGaXozkewQqxllx1L1jcoex2o6RqSvyizY97IApz2+K861Q2Y1lsJKH7nEon8ApdyZfUAHZv/hyouda/tWYpiWjwKPGSYI5ftTfup7Vm64hnHyFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8amQj52uB6F8lrYVBAs4+YtHsqR9Gt74UGDRJFJCFA8=;
 b=ta95FLH3uvF0ET4M50NXIgjLcOeFOVCCEhVoRMQfZZvV1i1TZ9UZT4eSBuaNPD5fhR+ncN0cgc/q16gKQCPNCk7pSDGtyLCk4DMU8ATCqR07NtrAKE57GBXDOwOHUd6KPIYQ6zn5jrCT3iudRoeAlnWedgelgX7siHT44ItYZ1iqXTYOuFInmD0Vxs9zR9zASVGq97/Syfk+GlYzALdfZe2CP9enR3K3SINKsBiZWFuBnWzHfYhyYJE7X30b/hQmyD9PdoY52G6uzwpRerAFZR3I591RvC7v7M/jhWpd2Q4imw47qamEXI6uzfrdH9Vw1mr3ZnzEYdeEKZ2V0v05ng==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v7 06/12] xen/arm/irq: allow eSPI processing in the
 gic_interrupt function
Thread-Topic: [PATCH v7 06/12] xen/arm/irq: allow eSPI processing in the
 gic_interrupt function
Thread-Index: AQHcHda2Rm5suYGrqkeUMzwFAqKwmA==
Date: Thu, 4 Sep 2025 20:01:33 +0000
Message-ID:
 <59cae29e51b13a71f57f701d5991e06ecf6690aa.1757015865.git.leonid_komarianskyi@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757015865.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV2PR03MB10974:EE_
x-ms-office365-filtering-correlation-id: 166a4d60-29eb-48a2-ae35-08ddebedd931
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?FfL5PMyiw2E8E3rE4saNo79uKTIbkLY8zO4VxgX3pW34wb8otKEKiJrsBY?=
 =?iso-8859-1?Q?vh7HU8sk6f/edx/sTiJfT/tQOJ5fjHgrkFan4znR459GOx8VJFTTZk+RSW?=
 =?iso-8859-1?Q?lARpVfGMdUk5g0KTdxKdFahyJQ89jbJmB1Aqrg6IXQiwRQ1KdcuGaQRJu9?=
 =?iso-8859-1?Q?Cvz1uEheMasgbZYMRaYJ3OtLOMsp+WXne5dd9Su92LUAM6lLs1H54/vp3P?=
 =?iso-8859-1?Q?xmCd4mxr9REndzxptvR20uW/MPUBOqItQGmPIdvoIm/bRRD72zX1SKXPsb?=
 =?iso-8859-1?Q?Ui5AUdjiLVpF50TCNm4pBPYBqnG7rv8Xp6u0pBhoL/lpk0UFgv1PNUeoVL?=
 =?iso-8859-1?Q?KOlgjAnBXDWF3zc2febiIbJvVOH/IDnZ/JSOV4vs5CtP2NupPXw6Sao2zX?=
 =?iso-8859-1?Q?DSZ08DMDtm28219IWjUBaakRICf/mqgLIy2S4pmQcP4E0l0WiKR9BFau1P?=
 =?iso-8859-1?Q?PBJ2dt120TD54bUJSB5RVZXlHlPdXhq+2jjJqYcwl7IHd/E/vPjYv7nOFZ?=
 =?iso-8859-1?Q?ntsAbcxHucLX/4YbnGTGLsg4iK5hI6+E02j6wUbbSxyLtIsJ+M8nALU7c6?=
 =?iso-8859-1?Q?pprEpjYxA6U4TB9zhgMWn9hlQemEn3XP3nxoe5Izqt0dh+YoHfbpFUkNU8?=
 =?iso-8859-1?Q?7t+mxtfbej8Lei6q9D25cKem9w+NMKZk3sxrsGTrw+XTD4jU4QhairjxlT?=
 =?iso-8859-1?Q?lCp7WgC8hjW0Y5yjNfnr4IO0MMiHUUmrc319SyzZ4vn2N5VO/oBkpE/STE?=
 =?iso-8859-1?Q?34S4me7TxFOwiavCmnntDxLTy2X7/k1mmqLfDiLQ7+ctHH8n0AZfjXqTvn?=
 =?iso-8859-1?Q?Hbh001useR1/E5W3UqnRziFigtP9ybbTy4nO8up0925npuN/HkzaGYnwaD?=
 =?iso-8859-1?Q?RwsLphNRjl1gD0xT6MLytBQ4gVQ5aS+bynGE6elnuwBGZI9Se1blnEmaSh?=
 =?iso-8859-1?Q?6ezblYx5iFMJvByqOR71471xNwQoCefgXecSPsgZI/6G7yC7bWxLR5sosv?=
 =?iso-8859-1?Q?ctJ8CoknIEP1qL561mX/oCOqcMNnlxweoNKLTcgG61FDJuJBgl68ZHRG2w?=
 =?iso-8859-1?Q?l1s6sRGd+hhNad1i3bWpQj1dFBhv7YRSgb3b2iJ/dvFk4DNSDn5IyWlzx3?=
 =?iso-8859-1?Q?OriHdDyb2i3fBYDetwAHDdiJTZPsVX2Ud5LU7AOrNxcc2TD0ZRTzlj0sGq?=
 =?iso-8859-1?Q?HZK+NPbUDc9EeqzWrVHf/psfxwclqt03ar/uTtQkEvNw//RLSt/mny3LDW?=
 =?iso-8859-1?Q?fWrWY+4/yc2ykVy6hXvYKxzanIA755gp7WCFXj1z8CPmnYIdWnDczLmFH+?=
 =?iso-8859-1?Q?Lx7XVIK5fW0IpIYpXSr35UE3gPq302W8b566GaGWvqfmSZzroCWJYcp7HC?=
 =?iso-8859-1?Q?5QxU0e+KkIQvlzXA0e3NaeTIR/DwHdgq69JYQtYgW25eun4TCiQ09uXaRb?=
 =?iso-8859-1?Q?g+Um0nLt3gOObWp7YwiSnP4IPOADM0UVett7ctRDvza2ZJZ4VoSNPPIfQE?=
 =?iso-8859-1?Q?SrYCRJDf03W8+1yLBJzxjQVYiSweRhEMLqB+0w/z3xew=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/iWf7nJeDOFIplQqadzY4pa0jtXM0frOUkoMNP7kdWAwbwtXgi/tJxEoj6?=
 =?iso-8859-1?Q?C4vSwSt4baUDgIM5AEYpG6qcHW9rKyshCY8IU8Xxt4QUW/lbmEX3lQ3sk8?=
 =?iso-8859-1?Q?+Ku+Gxv/uag3HfsONdgd8vo/txUiY9436la+KM9SkSthXZLxld3r99e7cz?=
 =?iso-8859-1?Q?JbWSEMt6jH+BqdLeEQJ4+A4ZKGbW2zVqfAlqQQIm57chDjtIex6C84Wqfx?=
 =?iso-8859-1?Q?WFh1DeOxolmhPo0O/eHeUjZ4pRJdPJmyaRDjhjY+maqIUryFfhb8FNO5Ir?=
 =?iso-8859-1?Q?YAsfS15rVuPMWI/BsSpL0A7/dG1T10EkELzS/ooV57/oZTPIZQDXI69xNz?=
 =?iso-8859-1?Q?A4kLAm1SnjM66jWZ+17nMzTIvVidHSyoqshxlbfApaBwAxMSJYoExeTN8X?=
 =?iso-8859-1?Q?P39fY0bhJTxJnOO7GebE0E/K3+uyovTGY8KKe5JZKvVIlur1pjOJUEv21k?=
 =?iso-8859-1?Q?VaI+0nlCW4GuFry/7Qd8fIAV+7yBt7gdGObAn2S3XEehi3kBtqoSZJDsTc?=
 =?iso-8859-1?Q?4qP6psh402gUojlb6OlI2NjZngRetKUuCRb8d4k6/sc+0J8crNHwhN6ToH?=
 =?iso-8859-1?Q?b0eJZ539m4s4eKsYD1QrtGRj4e0VgIXv2NAoah3Ovr0CN+/r0aD640S4uo?=
 =?iso-8859-1?Q?gVl8n5M2tmmtPO/wb8rAugyQFT6n8w6XlIdNCcDAcNx+qynvGfYp3WZ2iK?=
 =?iso-8859-1?Q?jO6EkAg0Dcu5mrBXndZKTQR3K1f7CJ9WUsAd6LJFSLHFJLK/diHNLXEiaf?=
 =?iso-8859-1?Q?zr+wJ7MXvBeoWHOOJmm7JJ9zF+i3I4h6C6fm5+MoPRKrUVp/3bwrCmDtOX?=
 =?iso-8859-1?Q?SXeJc2TPF53i5HyDMljSjCjrfPfJu69tenmf2cIVckFGPvcS/XNg+z1kjr?=
 =?iso-8859-1?Q?Dw+w3YO7AIVSQP2jU/E7/L7WLJ2R9nsmSu6L4qmEtkMxmGooFUxzjyBH94?=
 =?iso-8859-1?Q?6TM+X6kNTiKYGgAcDzPAn9KGC3SQC9WywMsxog7okczSnf09D0QlXJdQa+?=
 =?iso-8859-1?Q?ry+EXMT80IK9lDwYyDrEGoSF/9ivSMET2yND4wQtoyMjt4zk5rhDXgaAL6?=
 =?iso-8859-1?Q?yEM6sb64+n3sHZn46m7AtDEN4EbADQqkQT3SgHksfpU1/aqE3UuJx87JXf?=
 =?iso-8859-1?Q?vPtfnd1Klr8VNbmxP1jSCEmjORxi/e9ovseRwdKdv8+g0jO38RInVvh5Lb?=
 =?iso-8859-1?Q?1p8XeocybiQvBH81NW0jTod8yG02ubaMmduEuokLVA+pESqdoVy3ng4bJ7?=
 =?iso-8859-1?Q?o4mVhPb+JuJ7HXRVIPfudZP/7kEUqZdrS1bnyQK+1U1N2sNwA29tljUy0N?=
 =?iso-8859-1?Q?1bxhbKlHVNt15/ZiP0RCath9JdKzPYsGmRZM+rv0Ze1bUYv6PfOhk1I8QV?=
 =?iso-8859-1?Q?ppceG8mUG45P+inGLCzwr5ZHqeNrjUGyNtWs+2yqO/PKLSPy7O9pZNnnSB?=
 =?iso-8859-1?Q?z+mlQkE3yphEXzu/Rgk9sLdHZ66lPgdnX6KOrD85Ysd8C2RDadk8TzpOHk?=
 =?iso-8859-1?Q?tnK1MGoQq9o9duqkhcKK0zJg5ZtjTi01eAUxFRadcajFArR2GIJW1vXCOQ?=
 =?iso-8859-1?Q?dVlmmg7Qp7IcXq3lRgZ4NQwVAjos2fTa3uhYsya0pvmGz582IlVlGPe1vo?=
 =?iso-8859-1?Q?68sxc4C2UXPVOBC+OMF/7XE9Tqb7sMtk8y+7W6CAyeS4poeBwzPrn3m4c2?=
 =?iso-8859-1?Q?x3dc6JcSZJ/+SGbcyTM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 166a4d60-29eb-48a2-ae35-08ddebedd931
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 20:01:33.9820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NNQkWw50kWMCMsPxJGyciYsJdI5X7GD4BT8a38W/CCfmMnQj6UbW4c4oswTgFOmZfCcdqixYYoMwoqhGQDE/lwjmho491IDAoYIG8H4nPZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10974

The gic_interrupt function is the main handler for processing IRQs.
Currently, due to restrictive checks, it does not process interrupt
numbers greater than 1019. This patch updates the condition to allow
the handling of interrupts from the eSPI range.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V7:
- no changes

Changes in V6:
- added acked-by from Julien Grall

Changes in V5:
- no changes

Changes in V4:
- fixed commit message
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- no changes

Changes in V2:
- no changes
---
 xen/arch/arm/gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 9469c9d08c..260ee64cca 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -342,7 +342,7 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_f=
iq)
         /* Reading IRQ will ACK it */
         irq =3D gic_hw_ops->read_irq();
=20
-        if ( likely(irq >=3D GIC_SGI_STATIC_MAX && irq < 1020) )
+        if ( likely(irq >=3D GIC_SGI_STATIC_MAX && irq < 1020) || is_espi(=
irq) )
         {
             isb();
             do_IRQ(regs, irq, is_fiq);
--=20
2.34.1

