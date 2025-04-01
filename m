Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4464AA7724A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 03:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933347.1335325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzQGL-0006uQ-C7; Tue, 01 Apr 2025 01:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933347.1335325; Tue, 01 Apr 2025 01:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzQGL-0006qA-7p; Tue, 01 Apr 2025 01:17:57 +0000
Received: by outflank-mailman (input) for mailman id 933347;
 Tue, 01 Apr 2025 01:17:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gZL1=WT=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tzQGK-0006nG-CK
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 01:17:56 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20630.outbound.protection.outlook.com
 [2a01:111:f403:2607::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23d7f4c8-0e97-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 03:17:55 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA4PR03MB6703.eurprd03.prod.outlook.com
 (2603:10a6:102:ec::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Tue, 1 Apr
 2025 01:17:51 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 01:17:51 +0000
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
X-Inumbo-ID: 23d7f4c8-0e97-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmUDlfz14M7RkPqJu/JFHDVAAYvGPh4RaVloRgwAOKkbkph6qXig4Wp3X4YezopFdCPoo9hb1UECQvI2auy01Jx3GeIJrftjqtU8n3qqixoplFQnDrzWbbYjCoifNPlqpycZMbUqv8BhheRdxH1IgJIgsDXfhUExZnP8E/48In2A8h7gPdLik2qlctZAQTep4nQHE6Mf7y4jdN8cUN/vQzwf2W8kk9kU1ORUNr8C9473rUlJ2ghSniWU+g99QyAxjJcsOeLMFULrBOyQDuYy1iGHqiB4f/TvYifrTptz+6UdQz1n6s0w7Nq5lZjzLPzAbLob0KiL9pAlNL/JXxw9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eauTMPP1KriVl2OZ/pYML5XrBsfISutp4e5CHq9zXk=;
 b=Rh1f0J1sQOCnONn2lZ6au3YLNRcjqiRDG0f4Ftu96rrHLysqw1b30TOm2VXCB5K7v09QQp5IYUhO3nENG5UzK1xPNO82s7iL3FH3u0dN8ZQz+4J3oX8V/yD4ZkXQ2nIeqnIS4uah10sxsIda0fFrYKg/SJbTq7qvosZ4Qaok7HkiuzasglBpYug57edEURqtKgI569QUJrHH2osEjpsshiSFcoC7DrS71K63nv+kr9LZ6GRVD2M+LdxFUkD1KpLS2cN6ecPRpOIS0vk3O8CxcTmC4vJcBHwE4CajG2FShMn/qDquMljgEcDY2YJogkDhCfLuLYYS6Y9erzT5OQDR2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eauTMPP1KriVl2OZ/pYML5XrBsfISutp4e5CHq9zXk=;
 b=OLGhuDc4wXoAJeI68NticqjH+ss5QthC7Slg6xxqIHOotpW2p5Pormm550Dn139xxrnUTXckOZSNcSF01m9HVlFkq/X10WNHf4cGbc0ZvqbuJmqEjo8llVPHFTcYeb4eHUyZTV87ZqYvwPdxOLKD7tM1+uhUZyqufwq22NKirTIUci6O/EZxrdfE2C9l4HCJQOPRddJkBc8KTSZc5OCHsQygaqr4lXrmyaextNJFtxc6KyvyhJ0pGZNysy8SAD8dg3P5ykXJfBQQNICp9Yve65xy0gg2KjKS09OsrWtgIGuvxkWhY5KQ399jEDH2YtouZoNsyCMCEZjYFci07afxEg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/3] xen: gcov: add support for gcc 14
Thread-Topic: [PATCH v3 1/3] xen: gcov: add support for gcc 14
Thread-Index: AQHboqPjoKv09jK/Dk2C7qcEL02CdA==
Date: Tue, 1 Apr 2025 01:17:51 +0000
Message-ID: <20250401011744.2267367-2-volodymyr_babchuk@epam.com>
References: <20250401011744.2267367-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250401011744.2267367-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA4PR03MB6703:EE_
x-ms-office365-filtering-correlation-id: 20e60f01-19eb-45c7-a7ff-08dd70bb05fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Pp8//HL1rigYOceyxaJPEO2Uab6ZrCi2NKfRDTrmHZMBheTrORYoI7ptoA?=
 =?iso-8859-1?Q?7qwyMMUbK7O/lXNH6TeTTQTB8k+NoWCPqo6qlp/lBl7Q0+elEN+4LBxury?=
 =?iso-8859-1?Q?JHWFgw0h+lfO2R/YwEUUgLtmGCVILUOzDhSn80/Wqnwgxb0YF5/28+GQf4?=
 =?iso-8859-1?Q?j0tBDaeXwqlK46m5XPA2cSjLvky3b2tvlzmledTeSFQ/tnxNV90OHIeq9+?=
 =?iso-8859-1?Q?Y+ee1z4CDWRlTPeXE/VccgBVbAbIkd5LczRxmvh4CmbgUW55ucfzPJrIq9?=
 =?iso-8859-1?Q?DUq6FMSuvPlMdQpYa1rRybr30dSd31fRFDuWL6Mn9ahTBNaF/KilOhmz41?=
 =?iso-8859-1?Q?AiL8i1bZS6k/MliQQHUTTienyLyl0k8GQRsmcOqRUHcVPaBy7AYRPb20He?=
 =?iso-8859-1?Q?jYO5UJi21b6H4GdGGg6ZjSY4u505o1T9UBUU5VBJhj9YO78yq3P4AAVm13?=
 =?iso-8859-1?Q?/zznHFiy5X9FA8ZE83y5GRhrsH/kJRp2HwfDTpRUdDnxm7aFv6FeE0UY/I?=
 =?iso-8859-1?Q?Bpdq+/nm4kJLqa7TmzRkPTIon6H32RKVqoAHBdKSe40MR79KQOtA8mtjFY?=
 =?iso-8859-1?Q?YSt2n+pQXF+n4l3Kp1sCcjJt/InKvQcqk2idlOFrMNAodY/oryDDyz/U4E?=
 =?iso-8859-1?Q?badrlos2tEzcmVKpZ2rYEEkTldgHFYkKRI+mhr+XeaJ9l1tC4ZV7fFuJtw?=
 =?iso-8859-1?Q?reSBOAkvRtNtrub+TcuB9VxeG6fv1wVJcAyWZtcruzx+qaHXCSESYyxcZm?=
 =?iso-8859-1?Q?vl2w4Z3sdWTuvErsYa2PuA5VPP8No8IQz+hY4NH4UsSTk7ivgFK/VsH45H?=
 =?iso-8859-1?Q?CCG0snZg+/nw4kF5bBeR+CxKA6ePJsqpGl6tNeyNwqEHc9q7qL41P08EpR?=
 =?iso-8859-1?Q?51/gC64PD0fe801jbCK0H4w7cXDmwfb/zCcztBuahjzabromiUSpXt6+Kf?=
 =?iso-8859-1?Q?YD+LD9rwO9kjDOj1jSAMlAW4B2PYzRjtL5ULM/Rq3lQWJM5q+WVWNrx3+3?=
 =?iso-8859-1?Q?Dgh+AbNv9wO6+NXxLMYkeshcopqgkA6G4HTuHkiE5Z+SHGX/VmyU3cyNBB?=
 =?iso-8859-1?Q?RhqEZ/sW4rjqowPVkByDRh73faabyk6l4KjN4UfN1uN3IbpC8H2bwYwvi8?=
 =?iso-8859-1?Q?VlVMbIuVcpkCs3b+2YETCsOqkIG1+1yFmUXUnpR4RCaEr//St0FFf2IN0h?=
 =?iso-8859-1?Q?JPbKyUy/VJd6TK+S4cXf4X9+KJco+v7radcXPaFi29pIRRc2RJM0u0uyw3?=
 =?iso-8859-1?Q?RnrHzTWJhuNdLAnMq/KhaF945xuv2+RSVgUdjCBkSFPylh4RwJ4ZklyWYg?=
 =?iso-8859-1?Q?WQ5FMcwVOE8u+Z0QbJhEWICvVt7UXjrL7BWzNnst0VUu6twux7xLzvHwSN?=
 =?iso-8859-1?Q?AkYpcUJDS3Ihk/J15yuvvKaAQYxMrAXhxXtKCCNvUILMXPhklEPiVz4PR4?=
 =?iso-8859-1?Q?rBcxCWUm5F6ePUAyrlWEk8SekglPU4qN+rODSYH+ArguweY5+kVUqVCcec?=
 =?iso-8859-1?Q?DWgiHzz+6Gq+rk+b0QEyrx?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XjC+f851RNrbupabmBI99y8vEzHz22snNgVbiXwbLxqX4ff4UbHWyuMuKg?=
 =?iso-8859-1?Q?VluMYmwO+cUIJjj6Mi3EkPHZojgElqyw+NSta8H3TRsulRTIw934kWHevQ?=
 =?iso-8859-1?Q?RDadOuK+Dr+1oPUdeiPfOjuzTnrQBR0/KILPKFAbApa4BtlAIvOab3daqh?=
 =?iso-8859-1?Q?jWuiL1Xzo0BF7r6rL29lVUSh/ZT79FPBlNvtKNtN5Zu+Df5dYu1Ym6Qssw?=
 =?iso-8859-1?Q?AwocYaHyWey2M8XgFK7AYyHs4/pQlr67KZMu3VMOjcOA3bNrby2mWXOUdh?=
 =?iso-8859-1?Q?bdicNDButkI0kjeDH9lXKcuEGDnAdrLog7s1WPOnpqsDySXE7lgjEEb2YM?=
 =?iso-8859-1?Q?fqK8TLdcvc7ZW+gJQminO0odqssHZzglv1EdFTC8aafHmsVSE+/T0HN6do?=
 =?iso-8859-1?Q?RNIPF+9nyxDSOjLCFooI43H4d488njHpuZfL+LLgKeRXDDDZttFpbgBJQg?=
 =?iso-8859-1?Q?hMoM0aqEaRRw4t2vIt0Mu9wkDRPFll1zD4mmFFirqTj/gD52QDDGwyYrJM?=
 =?iso-8859-1?Q?M7GcbWwaRu8vSEArzXjZ4Q598pomALgrVskOcubA+j5eI0UPUj6OGJyN7p?=
 =?iso-8859-1?Q?KxwcaNreLsnic74vrTc6g88ZvT4pZr/TeV4fR9UkQGuwx/eqTzw3Ixb28t?=
 =?iso-8859-1?Q?zOpIIw5rpX3S5BXrL4CcQNNSvn8DyKUMa62dVaVRp5/B6Q3GQnLy+0eEzy?=
 =?iso-8859-1?Q?V9sJclxDYXR21dqQn0Rn+GXDdbcosRoBBW0AOFuvB151Z1GZeCjOH9BGjp?=
 =?iso-8859-1?Q?pn+evk9xOK8+bq1PaRk7jrCbDsJSwNyoFkafjvKksHMIhkkoBKRCR6SFCe?=
 =?iso-8859-1?Q?RrM7a5uM5z6oKCGFNRFh4a3eOBa3mbxnxUiUCpezAHajYtuB/P2MdnGmL2?=
 =?iso-8859-1?Q?lBdYxvAPt/M5HCni2rcVjq2uXz/5yzDE62mIGhxaQAsSTHd/SVEP6yWxVH?=
 =?iso-8859-1?Q?0rh/ZEaq5q/EaQhXVku8w6/rhVCWWSDNTcZf26NQNoeiQSZ3mPksE1ULDf?=
 =?iso-8859-1?Q?ElX9PXS9lZrAZpm+AALhE7UdlS57PV2/DK5kUbuLHjAzr3AgMUZW/xKBzR?=
 =?iso-8859-1?Q?JuExteDLVr5yKp+lel/eJ70gNgMFKDTfrMWagp1lmyz+seVcCAlzYuCqYm?=
 =?iso-8859-1?Q?OhAX/bYednFrsEVz+GPO4Nvvc/C6UMdTwZ9NZch1zQvegGnVcOV9cz7/wp?=
 =?iso-8859-1?Q?crsHGNs5GimhHEHOknnIVmy/8BMSkGGg6c0rpsA00o5ekeEDSPoVjNMgCO?=
 =?iso-8859-1?Q?FHQmiVTJoD9DjzF5rnPUt1kBBwhQ0/HAX1ZfBLi6m9BRxrXk6B6CjsQ8I0?=
 =?iso-8859-1?Q?DTnkS2xe4DamSn7X2N1B0lsow76uurPePYqxsYDzUaunrADMUpI+3aRjIu?=
 =?iso-8859-1?Q?7yCmP9g2C9iqSZOEm98P4dbMNZ14HmpJj/JuocsDJ4s25I2vysbXmLltSx?=
 =?iso-8859-1?Q?985QYR8jzG/jJh+P75xK06g9pUphiRqFVbrcs+NskXNTOXcowwheyUJZMC?=
 =?iso-8859-1?Q?s6MbIKFbY8cS3NrbJNMLTBjPSGNjqvJeAOg7lvKzHBrtA8+diMZOYVq46w?=
 =?iso-8859-1?Q?mzDqPvGb9P/Z1vfK+7vb43dMS+QVqFh3ofAIGjnJpP9LZ6f+uD20kH45PQ?=
 =?iso-8859-1?Q?tH0Dlwd8NY0/MeJsOB7hjgjxmnReRU7NT3aoDeD1rr6E0Ye59qvlUjZQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e60f01-19eb-45c7-a7ff-08dd70bb05fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 01:17:51.3584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gG6QQC3pAHoXU74YI2PAH+aXxp7SoU478Ny1RiL4L+4ww0mvZiTuwQ81UqivtU1ZaWQ4TapRktT2FULl2PbHsvgq0/lIQs2oQmix0+dz11c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6703

gcc 14 (with patch "Add condition coverage (MC/DC)") introduced 9th
gcov counter. Also this version can call new merge function
__gcov_merge_ior(), so we need a new stub for it.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---

Changes in v3:
 - Added Jan's R-b tag

Changes is v2:
 - Check for gcc 14, not gcc 14.1
---
 xen/common/coverage/gcc_4_7.c   | 4 +++-
 xen/common/coverage/gcov_base.c | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
index 1c20e35ee5..f4c1802303 100644
--- a/xen/common/coverage/gcc_4_7.c
+++ b/xen/common/coverage/gcc_4_7.c
@@ -28,8 +28,10 @@
 #define GCOV_COUNTERS 10
 #elif GCC_VERSION < 100000
 #define GCOV_COUNTERS 9
-#else
+#elif GCC_VERSION < 140000
 #define GCOV_COUNTERS 8
+#else
+#define GCOV_COUNTERS 9
 #endif
=20
 #define GCOV_TAG_FUNCTION_LENGTH        3
diff --git a/xen/common/coverage/gcov_base.c b/xen/common/coverage/gcov_bas=
e.c
index d0c6d0a3f9..742034e039 100644
--- a/xen/common/coverage/gcov_base.c
+++ b/xen/common/coverage/gcov_base.c
@@ -56,6 +56,11 @@ void __gcov_merge_delta(gcov_type *counters, unsigned in=
t n_counters)
     /* Unused. */
 }
=20
+void __gcov_merge_ior(gcov_type *counters, unsigned int n_counters)
+{
+    /* Unused. */
+}
+
 /*
  * Local variables:
  * mode: C
--=20
2.48.1

