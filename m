Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372E5C5DA91
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 15:45:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162713.1490258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJv2r-0004eg-HI; Fri, 14 Nov 2025 14:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162713.1490258; Fri, 14 Nov 2025 14:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJv2r-0004c9-Bd; Fri, 14 Nov 2025 14:45:01 +0000
Received: by outflank-mailman (input) for mailman id 1162713;
 Fri, 14 Nov 2025 14:45:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lTzj=5W=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJv2q-0004c3-7I
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 14:45:00 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d910ec1-c168-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 15:44:57 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GVXPR03MB10551.eurprd03.prod.outlook.com (2603:10a6:150:158::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 14:44:55 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 14:44:55 +0000
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
X-Inumbo-ID: 7d910ec1-c168-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvCyHHgj7tSSdX4UUpUfP6E3XBIRNizaxBbSFCjXFvTOIGDkuU8j9fbHZqkKPSqXCJKudLPvNDGnZE7fsKAQ3/s+UhkMo2/xl0mOQmteZx4/dftZfJ6pc7QQHGA/WeOaUt5nOy8CA/I+L0lI3hYjtpOPFVswuTcaFyVlxD7Bkbol/S3ReZ9wvQdU+hRx4fkZ9t/v+4psK6CS4YL3w3pJBALf3CwYXEmjEMwgapU4Z8oojiBUi3c6WaWfJU4UScFaN+OtClTqgb0vuwXTDjoKdaHlHXcFM2lqDShHY9AzcmYsCzCOV5G0c/M7UbJm6zNQtZfkFo3XrtNFEZHHkwAsOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qEbw20aClhzRPqLWxFwoec8KrBEQot5TwF6HWMGbHQ=;
 b=hbhScX0EJDiXQvacTHwJv/0C6nWUc8UwgHEmpIAbfMEjSzEY0EBt6Z8iNqtNLo3wJpbu/8RVeaGG7PaNGhQmQodn+A0UdoaSEIu2SIrd1pc+AIjZAzegRI7ShfZ2rs91LN5S2EG01QSCp+f3aMLmrsfTdRSw3u5OcvN1GsN9VebltVc4vQqyf7SgKyzDtKA5J8SanmE5NulckNyyEdhWnUwsGR3Sse5ZD1T3j9CSnkh+3UJQdXJ+NfAvpZVlBThjvxWFHSBVTFEdj7kEZ0aCXnVTSkKjU8rwRheodPu/PIqZHzgCsBzZ7ZDs+stMkEq/RZZCrtR/somW994ylKLWbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qEbw20aClhzRPqLWxFwoec8KrBEQot5TwF6HWMGbHQ=;
 b=VY1a3OgjiaZ8DTC2NRJ6O4UYyhp/HR3dnT5vw3HCnO6Qxmuk4IQYGFG8lKRDjAE8sTPA/tQiyHm/4YJsdBxE/f/dbvHtDIY9PpKYO1t2Oh0cg90LFk9b/hqtUYQ9FMqbjdiIRB1QBmyvGsDsaroTv2jiyA/cIqx83LLtQzR+dcPqCmfW+0dlINPXlOl4zGnDU7Pbt1efX3grVlmxJ+s/G1O8DdvzAtA7YT5yX/4UlS52YxHOqVQjwk9J1RdDZlUcArQ8hxcVuxSnQ5w2bClrON9UmJwbnadXYFc23IfEl8DQE5z4qO+8PpoEdktCarAbJESHT5aH6AMEFnISxVKNkw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [XEN][PATCH] x86/paging: replace !paging_mode_hap() with
 paging_mode_shadow()
Thread-Topic: [XEN][PATCH] x86/paging: replace !paging_mode_hap() with
 paging_mode_shadow()
Thread-Index: AQHcVXU91U+hErbh4Eaw0rWhlUZOxw==
Date: Fri, 14 Nov 2025 14:44:55 +0000
Message-ID: <20251114144454.287224-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|GVXPR03MB10551:EE_
x-ms-office365-filtering-correlation-id: 9d5a0867-6aac-4b4f-e83d-08de238c6055
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?z42VtBu+qpYpxdG3kEFulG7oD/wNMX9as7ZqCfO19pzyeBs20U2KWkDRL/?=
 =?iso-8859-1?Q?IrHxgTjsT4GCzBwA8mgfYdT1WYxNA6UoUrMI5+c1G6Y24Aw9+HBCdLJ2Nl?=
 =?iso-8859-1?Q?aRoTZsPhlG7KifrPL0OBIgflAcprq1HBNv7VGXtnS2o0pcoGffBveu/FWL?=
 =?iso-8859-1?Q?NwwWX62cYGFcPGIyr8znBA7SH3PYsqEiVPH0eaDTKQwl4CsQFpSvKffPDw?=
 =?iso-8859-1?Q?KeJgNa4+QCzbQtm/HKTz3qlaTbtjL2PZ2cVd2MEzn244NGWNeOJX2Q0SKK?=
 =?iso-8859-1?Q?7foFCsN3bjvVG5PQyqqSpGuJ+ChfUihfzLZ7LdJupEQCYlIRUsrVq77M8d?=
 =?iso-8859-1?Q?bUgPr3obKZBRo8EMppB4+tQ6cn+uAS2jM4TIAk9i+6RGIQqi/NXwy27HHT?=
 =?iso-8859-1?Q?OuB9GJ+/hQNefARRYobanNlgqD1OHhpLK6jbdZdzt7U1nsvNzntuSwAdqB?=
 =?iso-8859-1?Q?dF4ym3Wj7LnzKOx4pekNmKRRjKkJ+kvRWjbtbZM7k04LpQkMpnDZnBVlPw?=
 =?iso-8859-1?Q?uF83IEq6Mrl4+EIoW6EIXhYm9MDq8LvhpL4pdxrmpx3IwQ3KspAjQDyvV7?=
 =?iso-8859-1?Q?ironarGCVAbd3sSs/i6wtfl/9+UiDNzt5xYWS4HE1Bkm4uVYhlGRFIlD9M?=
 =?iso-8859-1?Q?ta8XVnUFLjpArDLFLXAuKeUAYiySSSy8AHwCSFtxO0R5VKsrTN/FApyEhV?=
 =?iso-8859-1?Q?6GheGPsSxJuYINrtSMMr54QCtc5TC6iv++Q1aFanF/2mlezlF+cky66qya?=
 =?iso-8859-1?Q?vVUqvqonCncdPXg1oBO9a32mKqzsSvAwfOdHkUsFsqBnqQgB5JI3vO7CTQ?=
 =?iso-8859-1?Q?QTiGuEWpWPeaNnyrpop4jZkwDqA0d9bIPK8zePYI8a2jG7H3qSWiFJVz5h?=
 =?iso-8859-1?Q?9fGpamG8RVLENF/6KQY5nhf85menHE2q4cW6BHELx8tO0DdrZAVWIGJ/8J?=
 =?iso-8859-1?Q?I3vwPViMV6WWElKTviqhoHmNb2arDPaEepfiUOZMoDm6N0oc8H0D1P6LDa?=
 =?iso-8859-1?Q?Um8z/SZtjFm773Y/28nIp/pGNJmQkrWuTn7q1ter8XZcWlE37JeyPDCcHn?=
 =?iso-8859-1?Q?/qtWDY1R1+GYdt984moR1tb1vRtSBFlsDxahTYF7d+ZNCN4nFMr/XDFQB6?=
 =?iso-8859-1?Q?+BgD6323Qzf3TNwV4EX/S+oAB+HyfodzYoz9wTzovAKkYUrM4TXurEa6co?=
 =?iso-8859-1?Q?eUa0O9sPmxGndmvs3N4plP2VFLVWDMOr68IGB2FDRz2TDXmInjXWojPokO?=
 =?iso-8859-1?Q?RxWqjAPfn1SfykAhpjcIastTalSNHaWuHGtsy5DPJwHah0IDvz2NtCpJvq?=
 =?iso-8859-1?Q?N/BmHK0RUeY4+YsH4kIEPJLsBgYlD7HYSfYgWD0K1cAGhNdimsVmsrv2vH?=
 =?iso-8859-1?Q?fdCDmrZjgCmFUKlEDhaZFGD+wTM4yLp1ORdPhj/jbVDmd6etvU5r7/twUE?=
 =?iso-8859-1?Q?wKGrZ/0xgfjpNhNuvlhKl+LkfEUIvdP6Be1zQPHLqRJsd2u4g4dAQKmSDR?=
 =?iso-8859-1?Q?Kr+4x/zrN224aF1qL5oB612mOYhZhq+TSf4bniOBIOph5xdggHtyB42lDw?=
 =?iso-8859-1?Q?yvrLYzG3DLUv1A9M4b7BDVvNrksK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?q+lPmFkgsJWC2hX5P2LwErx5+rDoHBZiRaQIBq6Rttkxau+RmTSzxQCzQA?=
 =?iso-8859-1?Q?kWPq8FSIcIg9+rxESlZjGUAPtKpGMrHqWHKNLO4qF5o2AUsV/wqZ5hbA+x?=
 =?iso-8859-1?Q?q1ykN7wB2rDHBenpmjjDjxKML5Md4ZIANBiWj7jcDgXFSHjClDByyIhUIY?=
 =?iso-8859-1?Q?LxxflZCpot1g2rS5cWHC/uNCaCZ03BOsDa3kBWhy3gDF3jFDJPal1/J+zT?=
 =?iso-8859-1?Q?FGE05bxG9NSoRHJ6FSubpfyWl+1FunOeGUpWA/41A/AT4T/Zh+fm9d1B6p?=
 =?iso-8859-1?Q?kXf8EH4BKHzqcuEhTbUOL4NVVBCLTGXu5R+HxyhCDpzUfW1NfcsYGw0Tb6?=
 =?iso-8859-1?Q?cOSg+1rW5H7v/3iletbEFTMJs+mBFMuEb3HnOX2Rcqz+HhcSJnJjxhOMcA?=
 =?iso-8859-1?Q?6SAy9pwSTHNu5IUnoJuNAGHLI1BJqg5vhSVUw4KJsIsEHxN/7DoTWCRxHw?=
 =?iso-8859-1?Q?iWk2ck5ooaran+WtrE3sZYoGOyymBG2Vt6pFn/Jv6hB+7nroRYhOA/FCme?=
 =?iso-8859-1?Q?xdzN4B6LaErfBZsBgvScXuwCVSe5zqQEHsSffe/yqtcVEn8+BS/YOEiK/A?=
 =?iso-8859-1?Q?Mc1N8BGStVq0W/aKLMRkGzl+4E8aTSlg3hz6xIRuELBCzDxKLkESOEAzV1?=
 =?iso-8859-1?Q?bfTFj/Xnnog0NZrPn+AfSY6fHPqh02Q1/kA6W3+Rzne0v2P3SXKNij5237?=
 =?iso-8859-1?Q?a1Q3tvlr8Z46f7OqBkIK9hfrjDQ4Wm9lhAa4S3xyr3aWGkGuKEvC/WVnhF?=
 =?iso-8859-1?Q?UxEI0HwiiJLBzApS9vqV1hn1tHP4Yt1RfBXL9n1rRvsT092PtqTuJOnYPe?=
 =?iso-8859-1?Q?JAlqPN0XqpiC+kriGlFbjzwF8MoiBFThqkMNnZmsaQXMp+J215KF+S0h5p?=
 =?iso-8859-1?Q?uzupPt2xRcwYXevre6kM4ytmAPNDpkAzFHQgkj13c9eo5SmeJvx5TdRMFw?=
 =?iso-8859-1?Q?xiy3gzuGzZA9100R7ii6A2Dc0NfwGe3PEyZDByLdt0A4lWBVtzx5aUGX8q?=
 =?iso-8859-1?Q?fzwW+fHvDRbXbvInKN6dgXL9RE6qUHgKGMjMPM2nTZI5f942xp5lX9RRRO?=
 =?iso-8859-1?Q?iKf4qa4+5EMGbzLHcBDBvuXYSz0NJsC+Q6I7YKM/dhFmozBbVohAiCOiG/?=
 =?iso-8859-1?Q?mpqZkVgUWHpUyz1yh/XhrmOfM4NwPqPQJcJw71rwqzOs8w81efTlgwgY5G?=
 =?iso-8859-1?Q?b5rbOo/YGVIkHQohdMarAVPGXwPVCTn2mnDjG/wOZXmLyjQqjQqVkUnd6N?=
 =?iso-8859-1?Q?J7Tw19w69QvkadAKli4YO3atiDPMqwKsSc0EMq4yb5Fi4FLcthf3JkTuTh?=
 =?iso-8859-1?Q?Y8DjWNobTBbBe4SIyjAc2Hwg7H9SXw1RyBecD+GT6I2drm7/Gr9QM9PCOI?=
 =?iso-8859-1?Q?c/VhJOHxwikyw3o3foiCxgO2Uhbk1ENRSEnR6Bg/e/WeFttq1BiXtijMG3?=
 =?iso-8859-1?Q?xyjeA98L/eLecFlTKUsCzbaqOiahXWMZIqd4yIxoRyPJWKdTufGen8DD4e?=
 =?iso-8859-1?Q?4Ouk3zs0cLSPlSxo8N9gSveuI6zvAlgfvE9s0kUoCg56mcawggC0jX1C/o?=
 =?iso-8859-1?Q?Aj4/4pEDo0eRRY+lAPWByI73jQtEuXediuVjkY6WwX467oZvKgSP5fg8WC?=
 =?iso-8859-1?Q?dLfEDsE/ZAf1KvsFFXz1lTNe6fL/2gvYUPbW4TM4sKrT1xJmVpyixCSQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5a0867-6aac-4b4f-e83d-08de238c6055
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 14:44:55.1169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zMiTzsFTqqMUkvxHlpMpgFanU3ac+L29ydd3jRKZrj/g9kgOfTpahpDpZEjWwnhzYuMQM43u1yNepu9yGNE5Sq+UlcBVlBL0P/Q28VU7kao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10551

From: Grygorii Strashko <grygorii_strashko@epam.com>

Now Xen supports only two paging modes: HAP and SHADOW, so
!paging_mode_hap() is actually means paging_mode_shadow().

For an abstract, future case of there being a 3rd paging mode it is also
better to explicitly mention checked paging mode (SHADOW) instead of using
negative check of another paging mode (HAP).

Hence, s/!paging_mode_hap()/paging_mode_shadow() which also allows DCE drop
unused code when SHADOW_PAGING=3Dn.
The !paging_mode_hap() in hap.c not changed as HAP is checking for itself
to be enabled.

Inspired by [1].

[1] https://patchwork.kernel.org/project/xen-devel/patch/20251111200958.357=
6341-3-grygorii_strashko@epam.com/
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/cpu/mcheck/vmce.c   |  2 +-
 xen/arch/x86/hvm/domain.c        |  2 +-
 xen/arch/x86/hvm/hvm.c           | 10 +++++-----
 xen/arch/x86/hvm/svm/nestedsvm.c |  2 +-
 xen/arch/x86/hvm/svm/svm.c       |  8 ++++----
 xen/arch/x86/hvm/vmx/vmcs.c      |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c       |  4 ++--
 xen/arch/x86/mm/p2m-ept.c        |  2 +-
 8 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.=
c
index 5abdf4cb5fd5..1a7e92506ac8 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -525,7 +525,7 @@ int unmmap_broken_page(struct domain *d, mfn_t mfn, uns=
igned long gfn)
     if ( !mfn_valid(mfn) )
         return -EINVAL;
=20
-    if ( !is_hvm_domain(d) || !paging_mode_hap(d) )
+    if ( !is_hvm_domain(d) || paging_mode_shadow(d) )
         return -EOPNOTSUPP;
=20
     rc =3D -1;
diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
index 048f29ae4911..37092f31f3f7 100644
--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -287,7 +287,7 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struc=
t vcpu_hvm_context *ctx)
     hvm_update_guest_cr(v, 4);
     hvm_update_guest_efer(v);
=20
-    if ( hvm_paging_enabled(v) && !paging_mode_hap(v->domain) )
+    if ( hvm_paging_enabled(v) && paging_mode_shadow(v->domain) )
     {
         /* Shadow-mode CR3 change. Check PDBR and update refcounts. */
         struct page_info *page =3D get_page_from_gfn(v->domain,
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 7299cfa90ad5..cb4924be9aff 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2317,7 +2317,7 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
             hvm_update_guest_efer(v);
         }
=20
-        if ( !paging_mode_hap(d) )
+        if ( paging_mode_shadow(d) )
         {
             /* The guest CR3 must be pointing to the guest physical. */
             gfn =3D v->arch.hvm.guest_cr[3] >> PAGE_SHIFT;
@@ -2368,7 +2368,7 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
             hvm_update_guest_efer(v);
         }
=20
-        if ( !paging_mode_hap(d) )
+        if ( paging_mode_shadow(d) )
         {
             put_page(pagetable_get_page(v->arch.guest_table));
             v->arch.guest_table =3D pagetable_null();
@@ -2422,7 +2422,7 @@ int hvm_set_cr3(unsigned long value, bool noflush, bo=
ol may_defer)
         }
     }
=20
-    if ( hvm_paging_enabled(curr) && !paging_mode_hap(currd) &&
+    if ( hvm_paging_enabled(curr) && paging_mode_shadow(currd) &&
          ((value ^ curr->arch.hvm.guest_cr[3]) >> PAGE_SHIFT) )
     {
         /* Shadow-mode CR3 change. Check PDBR and update refcounts. */
@@ -3966,7 +3966,7 @@ void hvm_vcpu_reset_state(struct vcpu *v, uint16_t cs=
, uint16_t ip)
     if ( v->is_initialised )
         goto out;
=20
-    if ( !paging_mode_hap(d) )
+    if ( paging_mode_shadow(d) )
     {
         if ( v->arch.hvm.guest_cr[0] & X86_CR0_PG )
             put_page(pagetable_get_page(v->arch.guest_table));
@@ -4241,7 +4241,7 @@ static int hvm_set_param(struct domain *d, uint32_t i=
ndex, uint64_t value)
          * Only actually required for VT-x lacking unrestricted_guest
          * capabilities.  Short circuit the pause if possible.
          */
-        if ( !paging_mode_hap(d) || !using_vmx() )
+        if ( paging_mode_shadow(d) || !using_vmx() )
         {
             d->arch.hvm.params[index] =3D value;
             break;
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nested=
svm.c
index dc2b6a42534a..1813692ffb03 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1341,7 +1341,7 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu=
_user_regs *regs,
             /* l2 guest intercepts #PF unnecessarily */
             return NESTEDHVM_VMEXIT_INJECT;
         }
-        if ( !paging_mode_hap(v->domain) )
+        if ( paging_mode_shadow(v->domain) )
             /* host shadow paging + guest shadow paging */
             return NESTEDHVM_VMEXIT_HOST;
=20
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b54f9d9af50e..73d6c7ed03f2 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -171,7 +171,7 @@ static void cf_check svm_update_guest_cr(
         }
=20
         value =3D v->arch.hvm.guest_cr[0] | hw_cr0_mask;
-        if ( !paging_mode_hap(v->domain) )
+        if ( paging_mode_shadow(v->domain) )
             value |=3D X86_CR0_PG | X86_CR0_WP;
         vmcb_set_cr0(vmcb, value);
         break;
@@ -440,7 +440,7 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_=
hw_cpu *c)
         }
     }
=20
-    if ( !paging_mode_hap(v->domain) )
+    if ( paging_mode_shadow(v->domain) )
     {
         if ( c->cr0 & X86_CR0_PG )
         {
@@ -762,7 +762,7 @@ static int cf_check svm_set_guest_pat(struct vcpu *v, u=
64 gpat)
 {
     struct vmcb_struct *vmcb =3D v->arch.hvm.svm.vmcb;
=20
-    if ( !paging_mode_hap(v->domain) )
+    if ( paging_mode_shadow(v->domain) )
         return 0;
=20
     vmcb_set_g_pat(vmcb, gpat);
@@ -773,7 +773,7 @@ static int cf_check svm_get_guest_pat(struct vcpu *v, u=
64 *gpat)
 {
     struct vmcb_struct *vmcb =3D v->arch.hvm.svm.vmcb;
=20
-    if ( !paging_mode_hap(v->domain) )
+    if ( paging_mode_shadow(v->domain) )
         return 0;
=20
     *gpat =3D vmcb_get_g_pat(vmcb);
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 2fffc2006ab0..0b511939ac8a 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -135,7 +135,7 @@ static int cf_check parse_ept_param_runtime(const char =
*s)
     for_each_domain ( d )
     {
         /* PV, or HVM Shadow domain?  Not applicable. */
-        if ( !paging_mode_hap(d) )
+        if ( paging_mode_shadow(d) )
             continue;
=20
         /* Hardware domain? Not applicable. */
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 3f0e113b0b67..c98ec110d144 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1432,7 +1432,7 @@ static void cf_check vmx_set_segment_register(
=20
 static int cf_check vmx_set_guest_pat(struct vcpu *v, u64 gpat)
 {
-    if ( !paging_mode_hap(v->domain) ||
+    if ( paging_mode_shadow(v->domain) ||
          unlikely(v->arch.hvm.vmx.cache_mode =3D=3D CACHE_MODE_NO_FILL) )
         return 0;
=20
@@ -1444,7 +1444,7 @@ static int cf_check vmx_set_guest_pat(struct vcpu *v,=
 u64 gpat)
=20
 static int cf_check vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
 {
-    if ( !paging_mode_hap(v->domain) ||
+    if ( paging_mode_shadow(v->domain) ||
          unlikely(v->arch.hvm.vmx.cache_mode =3D=3D CACHE_MODE_NO_FILL) )
         return 0;
=20
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index b854a08b4c4f..ce4ef632ae0a 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1270,7 +1270,7 @@ void ept_sync_domain(struct p2m_domain *p2m)
     struct domain *d =3D p2m->domain;
=20
     /* Only if using EPT and this domain has some VCPUs to dirty. */
-    if ( !paging_mode_hap(d) || !d->vcpu || !d->vcpu[0] )
+    if ( paging_mode_shadow(d) || !d->vcpu || !d->vcpu[0] )
         return;
=20
     ept_sync_domain_prepare(p2m);
--=20
2.34.1

