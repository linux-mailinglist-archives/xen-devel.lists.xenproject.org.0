Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A5DC1F7C6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 11:18:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153294.1483784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEPjS-0004Fy-NQ; Thu, 30 Oct 2025 10:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153294.1483784; Thu, 30 Oct 2025 10:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEPjS-0004En-Jy; Thu, 30 Oct 2025 10:18:14 +0000
Received: by outflank-mailman (input) for mailman id 1153294;
 Thu, 30 Oct 2025 06:12:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MAXf=5H=siemens.com=haseeb.ashraf@srs-se1.protection.inumbo.net>)
 id 1vELu3-0001xf-0E
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 06:12:55 +0000
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c406::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76313d7a-b557-11f0-9d16-b5c5bf9af7f9;
 Thu, 30 Oct 2025 07:12:51 +0100 (CET)
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 (2603:1096:820:87::11) by SEZPR06MB5812.apcprd06.prod.outlook.com
 (2603:1096:101:ac::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 06:12:44 +0000
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523]) by KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523%3]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 06:12:44 +0000
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
X-Inumbo-ID: 76313d7a-b557-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTtinF2Y3B0uecTBG3RJTRFwqXT1rqzX2UNHrLVl6PYK9CLHNZ/cL5e7R3VW4qWL+rOR+ZDW45cdtD6mgdiOIn9ap0ia+Esd4giN++0gJHkkJWNQyE2KIwNUvqjE1x52/pCEQn5fgtW4ZLknrUwLRYVZ51fKJ6Vwd6l/s9chCA6qhqmCBkVrpNvQioDt4sDftFc/UAmtft/GrgVomX+6jUp2qzKH52Xo4c0gls4brFWzdt3phN38zvtDFWgHfy5YGnjV17rLO8omxyAQ0mI0T6yvgKXMWW58WZjxRgXQl5WVtajLCYOyJly7JY2/cH+K/cX4VgMKcM0+JhkVf25Bjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erp5B8/zWvKQdvr4nZo1K1MCyTHV4bScG8pvt06uSkY=;
 b=t50F8+ZpMG5uFeHGPhgZkVovTGJ1Vk2MW8t2vGriltR+42mg2Avp6k+/ukDlBnf23TM1c0Qei82QUko2H7azZ7+Gx4FwNQDSWNXpBFy2DHgAXSvwaZs04mDgZgmHxqjI9aA0w4/QAzreH61Brt9PtiyMGnvpN38syG/SbcdTy4pELx2Fi3i4ZO0BANl4IkqYdQAZDmdxWXOhgelW3djW5dQkBdMPVX7zFCGhmF/oYM/nu0VuFuwlzq7Qb6I7tytVZbf5aruntUFcjdfQgaufTLdz675YbZsKwGz0a4aK6yJHCkSvl/dMEcl8yHE1RzBa7phSVqS0UgStnVA9WmflOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erp5B8/zWvKQdvr4nZo1K1MCyTHV4bScG8pvt06uSkY=;
 b=JhIVFAY58jDhtCFjgs2nag8MJNOCDXNRJDjALE6pGO47EKztdrE7sF5jVi6WURmcxSp48sGB27zIxk0OVS9wolP45D+4GibL5LU1/tUs+4sgyoXTH9I2oLviCJ5daTAUfJbUH008ztPxkOr+Rz5IawoGigf5MGLRgxvO0R7xpYfjRTULlx07Vy/N0+djvQGc1oKJhFLLiWJSQ2VM2EiD3lUUkfgb5/gpk5JF4EB2i/VoBo8OR8/1c5fAaia23n3kHzJlveQdubDN2CpzaK8Ye76krNsFBZT5VYyKcVblYWjzPa0HivuHvaYk3vI3wVvv4GIUnvocT73GM6wiPs03/g==
From: "haseeb.ashraf@siemens.com" <haseeb.ashraf@siemens.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Limitations for Running Xen on KVM Arm64
Thread-Topic: Limitations for Running Xen on KVM Arm64
Thread-Index: AQHcSVi3paxtnyIgIkOf6jhuJCbvfg==
Date: Thu, 30 Oct 2025 06:12:44 +0000
Message-ID:
 <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-30T06:12:44.041Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4588:EE_|SEZPR06MB5812:EE_
x-ms-office365-filtering-correlation-id: a9b93fe5-d1ea-499b-2604-08de177b5731
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|39142699007|31052699007|38070700021|8096899003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?IIQl8w4SC5Jp9qLD4o0Pfcte7+11azpHZf09FTL10ul1lJAXPJurqTek0A?=
 =?iso-8859-1?Q?fjJdKAd/4Vt79EqtbYe1o8ft0Hq16EE0YStxWeocYQ9TbYC/b38HT0ZcKD?=
 =?iso-8859-1?Q?qVX193nX8refNvVvvx0bySYb7jy9eaUDwp9X6ksVIBZpq8/tWYaxUp426G?=
 =?iso-8859-1?Q?7pKwn8bGz7054rvyumykPq6Mzhx4bd9G7pukxZ+7AkyAcLJOnXX2j75gaT?=
 =?iso-8859-1?Q?0girYJp3xNF8I9bYu2gFa2YJRvS2tMZvdTiZyXS1EdN6gA1a48AR8pgvwp?=
 =?iso-8859-1?Q?1SiywTlsB6tdKzT2MAgc/iMMjehzdviVQUiXwDRaMlpjo+HgKLF5WUtV96?=
 =?iso-8859-1?Q?BMzaEUe/WQ15PMblkyEwsj7QnIFQrvgbKktLn4aHXI0wrJlZB4sxWC8Zs2?=
 =?iso-8859-1?Q?WREqQW1hcs2rX/uSrkHfXyaQU8rPg8wgBVIEQhUncViUuQjgO1x+nzGzYB?=
 =?iso-8859-1?Q?1pj3GQ+XE6AVTBVndjwngHlbslwVg2EEeGjnTUv8yIfq/gjXEOv773g+La?=
 =?iso-8859-1?Q?FGH14VdQ+JjRjfOv/jguoL7/3j3RZ70m4HGCXytlpKdf3W0jK7Rm94NRrN?=
 =?iso-8859-1?Q?FDRq8xaxv4Iw5QU8NVj+wrPUvRAstPCC5vRnDK7BFN+iiTlkKPlP9c3QCV?=
 =?iso-8859-1?Q?ZNjJgGaEFSEBvLrDtni30njrnoLDz/qS0tSGR9duPdIcZek/hzGCuvu0yw?=
 =?iso-8859-1?Q?zP89HzjhpmELobzvJ9HEjE2iVMIHErRQDbRYBNYrpPq8GaXgOWaEohakQy?=
 =?iso-8859-1?Q?MAqcXay6DUgkB/V44dDRLEZLQligEvNDCQrXbQyRD7pfEkM+JkKOloqLfv?=
 =?iso-8859-1?Q?Y5SBHW0OK6Au/Ngbad/j7OHbolHXLQSjlpxlwPNUAmsQ2fJzBfExjkQ0H7?=
 =?iso-8859-1?Q?XlsAYvd0qV+vIRIXsyzXFbXjdVB8pCQg+xI/DnadjFvKc4imRB3nEimiUV?=
 =?iso-8859-1?Q?Id6lEpfLpbCQaUL9fVs/rPjna0i5fkWO2bcOEkCPi9WeSycZyaz5vtmGPu?=
 =?iso-8859-1?Q?ycO8ZW8sOWspxQi9ER/wrWLrGHhmmTUqWdSGIEGoutHW299wS+vNre0mRf?=
 =?iso-8859-1?Q?fMwKnGwQCv+d6eTEomfjeY7iqqaQlMTfg3P3Rp7H1OPSw6qaGo6TQZU2Jy?=
 =?iso-8859-1?Q?vAAfScyfvlaXsTkh14SllwBHJfPEUYUrTs4syS9qNBk6Ksoo3E/Olj0qG7?=
 =?iso-8859-1?Q?lMgfQuOT9bDxAB42aGBzcUc3joRIBAHSCeon1IOhtyy+exmr5tH+0VL1ux?=
 =?iso-8859-1?Q?pMXrU/LOocZ+C5ygWKkLpxW0R4dlRCbt0IktJZmgpau/yzqVHtpfkaf7+A?=
 =?iso-8859-1?Q?JXctGKMjKz4sI683u6R5AuYsbpdBrztCL29T+b7FAPNVxbifmiaNrHCLLR?=
 =?iso-8859-1?Q?DRxy9TI2SuFr9RwRe3Wv+KFmcG6qHFBjeIm4RCeJKCQcXA4ac+M5C2RH7N?=
 =?iso-8859-1?Q?Bizc6ZKhka3lI6w7v8qIwbbYkSEY+BRYWfkvqYnQNEb26bLIYz+MnyvaXL?=
 =?iso-8859-1?Q?6PGI2KUqK/2M+THclD2f416RaedoKM2yZ3OJdf4YxvFNExDHMdVQXT+j2A?=
 =?iso-8859-1?Q?8H+ZsvIccDZTlzuwbYapEGkSkJHu?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4588.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(39142699007)(31052699007)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5Sxllu5Ul/8U9Zoq+tGJcB2w+7FPOSNzF0WlgXBwcM3bXcUwBgbsd+7M2k?=
 =?iso-8859-1?Q?miluEgJQ8YOv519c7Rw4RfGuWQQZkquKB8QM3eiDeXAJNYIepLKA8kgVwG?=
 =?iso-8859-1?Q?6xpLI6SOUJc5uF84RV6E2waSFaMjws07J+0/HjPgoYK+MlzjCryfjh0fUx?=
 =?iso-8859-1?Q?3Se2O8fi7qb9m2pfUqmp0EoBP+Nnd1nSzHUq7eZV9s+vQfytJE7ZBra2FC?=
 =?iso-8859-1?Q?Vz1LzOijjHeTthHr2rMxiWZ9B+ByGcmAfuLnSRD9gKhFGLCOhx483JTWVe?=
 =?iso-8859-1?Q?fRuR0mHU5f016K8G1etTPd1qUWzxetOD4VktNsdOo+NRMjl6Vk/dNVyyD6?=
 =?iso-8859-1?Q?nkc+eC4+Zoq4D9MsbgdBR5t4UH7VsT4MExdrxnopp5Qx1U7tzoDn8LpQPE?=
 =?iso-8859-1?Q?Zq14ksY83E1q8bLDCTtXHbn2Vpj+AhhtuqmGMDgi4dSRU5KXD3FBap9yyY?=
 =?iso-8859-1?Q?hbILmk0K6IIRszrVArW+M/snNl0EXLXUDsHuhQ1lafAXOCgEJLxPmmGwKK?=
 =?iso-8859-1?Q?Veveoi/6HoIBadaJyJfLVZI7sSsmIgKy5bnj4m/Z2y5UsqE0R5cSz9zaA2?=
 =?iso-8859-1?Q?HQBi4IOIJxkCyXMWrh8K4raM6pT1dWG+c7H+gIDKaudimENkp2ZvKkaSL7?=
 =?iso-8859-1?Q?6eGPOGnKn+JMB5O+zFhfottFd8hmZMw25nc/YoDxpNNCzheJjZd/YCDKvb?=
 =?iso-8859-1?Q?R/xA8H+MeomEWcjQ9lWRlXHiVqjLRIRYgv620A1h2HUtRTfy5k3YOHuGEz?=
 =?iso-8859-1?Q?7QMQwK0Hbbjimuy65zctVdqMLZj7q70rN8bu7a+3P8Ce26SndOFyuGRrPW?=
 =?iso-8859-1?Q?k3IWtPy3RZdLEpxj0JllSu+Uw/5uKBys6HdgGNGYBByW9A/De5AVHkXhPT?=
 =?iso-8859-1?Q?VJROw6t4GHtsL3inxiQcboEcgZfDhhyVOu+0L/tX4g+JwzhDqyN7ycwsWg?=
 =?iso-8859-1?Q?kTvTx8+0+vC/7GqR2CmrZAwthsXKojT1pZi6MWmz5fW1DmpVbTtwRhMs2g?=
 =?iso-8859-1?Q?9hF27wkR9L/AmZ/7/aWILyEOoX5HS3nNoHkOXr0ZVKUeuB6crXAA6k66h7?=
 =?iso-8859-1?Q?L7dfXzg35xQHemvGE/2rEcJum9e3xQ16mP02moDfY6J9Ctco4t5Dy044Og?=
 =?iso-8859-1?Q?j0+5dqfwOE4PkdJh4acJr8mdg4IukC9F3cG9o68Tqwm5B0zQ3hQWrCmyzX?=
 =?iso-8859-1?Q?X+vWwr04yLhECmdF8sAkOf3jALQjJNR9Bq2TBXHzVXDB9m8nXOCHmo41Zf?=
 =?iso-8859-1?Q?xYQbRy6ralwoBV8fmOCPZ4xNPUwrNcTf6dPENHb0Q/IxyaggvstOw51jmT?=
 =?iso-8859-1?Q?qqYKXIWSc+AKZj2RKwtw7DSx8WTMZs0aIPLJiVVa/j7+Lkp/1L0Cs5Q514?=
 =?iso-8859-1?Q?w2ZihnMEC+gZh/AkvcindaUgkkU+HfwFSvusetnjRGrhabhTdeo78KztWF?=
 =?iso-8859-1?Q?sl6Bh4a8xYYOllvpctmL5GROWojHT9AIq8B7W5aUY7nJ02XEgcEfEFunmh?=
 =?iso-8859-1?Q?JalXpW6fcYu0wJPl+JarOLvHy8ehwR92O6QPViIoH1wQCa1VseDZ5ofjWJ?=
 =?iso-8859-1?Q?UN9xGAxHreYnU50rwUUbIke/5qN16wAEuC+ONGb2/khdGFYouSlCoHAD/m?=
 =?iso-8859-1?Q?5tXDOiA7BbbYQRhDf0SEKo3OU8hmrjKzFK?=
Content-Type: multipart/alternative;
	boundary="_000_KL1PR0601MB4588D25A95D680640A80F2CAE6FBAKL1PR0601MB4588_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4588.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b93fe5-d1ea-499b-2604-08de177b5731
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 06:12:44.3973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CP9oVMkbjNSlUPQuHtIE0zzQJ2A8EFgyrL77rwDiQkpqggfK/ZXgfqWWKLoJH6afHvunQhyXlOomUZhzdxL15YfZ8nVrUlDP/z2TqtNHvvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5812

--_000_KL1PR0601MB4588D25A95D680640A80F2CAE6FBAKL1PR0601MB4588_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Xen development community,

I wanted to discuss the limitations that I have faced while running Xen on =
KVM on Arm64 machines. I hope I am using the right mailing list.

The biggest limitation is the costly emulation of instruction tlbi vmalls12=
e1is in KVM. The cost is exponentially proportional to the IPA size exposed=
 by KVM for VM hosting Xen. If I reduce the IPA size to 40-bits in KVM, the=
n this issue is not much observable but with the IPA size of 48-bits, it is=
 256x more costly than the former one. Xen uses this instruction too freque=
ntly and this instruction is trapped and emulated by KVM, and performance i=
s not as good as on bare-metal hardware. With 48-bit IPA, it can take up to=
 200 minutes for domu creation with just 128M RAM. I have identified two pl=
aces in Xen which are problematic w.r.t the usage of this instruction and h=
oping to reduce the frequency of this instruction or use a more relevant TL=
BI instruction instead of invalidating whole stage-1 and stage-2 translatio=
ns.


  1.
During the creation of domu, first the domu memory is mapped onto dom0 doma=
in, images are copied into it, and it is then unmapped. During unmapping, t=
he TLB translations are invalidated one by one for each page being unmapped=
 in XENMEM_remove_from_physmap hypercall. Here is the code snippet where th=
e decision to flush TLBs is being made during removal of mapping.

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 7642dbc7c5..e96ff92314 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1103,7 +1103,8 @@ static int __p2m_set_entry(struct p2m_domain *p2m,

    if ( removing_mapping )
        /* Flush can be deferred if the entry is removed */
-        p2m->need_flush |=3D !!lpae_is_valid(orig_pte);
+        //p2m->need_flush |=3D !!lpae_is_valid(orig_pte);
+        p2m->need_flush |=3D false;
    else
    {
        lpae_t pte =3D mfn_to_p2m_entry(smfn, t, a);

  1.
This can be optimized by either introducing a batch version of this hyperca=
ll i.e., XENMEM_remove_from_physmap_batch and flushing TLBs only once for a=
ll pages being removed
OR
by using a TLBI instruction that only invalidates the intended range of add=
resses instead of the whole stage-1 and stage-2 translations. I understand =
that a single TLBI instruction does not exist that can perform both stage-1=
 and stage-2 invalidations for a given address range but maybe a combinatio=
n of instructions can be used such as:

; switch to current VMID
tlbi rvae1, guest_vaddr ; first invalidate stage-1 TLB by guest VA for curr=
ent VMID
tlbi ripas2e1, guest_paddr ; then invalidate stage-2 TLB by IPA range for c=
urrent VMID
dsb ish
isb
; switch back the VMID

  1.
This is where I am not quite sure and I was hoping that if someone with Arm=
 expertise could sign off on this so that I can work on its implementation =
in Xen. This will be an optimization not only for virtualized hardware but =
also in general for Xen on arm64 machines.


  1.
The second place in Xen where this is problematic is when multiple vCPUs of=
 the same domain juggle on single pCPU, TLBs are invalidated everytime a di=
fferent vCPU runs on a pCPU. I do not know how this can be optimized. Any s=
upport on this is appreciated.

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 7642dbc7c5..e96ff92314 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -247,7 +247,7 @@ void p2m_restore_state(struct vcpu *n)
      * when running multiple vCPU of the same domain on a single pCPU.
      */
     if ( *last_vcpu_ran !=3D INVALID_VCPU_ID && *last_vcpu_ran !=3D n->vcp=
u_id )
-        flush_guest_tlb_local();
+        ; // flush_guest_tlb_local();

     *last_vcpu_ran =3D n->vcpu_id;
 }

Thanks & Regards,
Haseeb Ashraf

--_000_KL1PR0601MB4588D25A95D680640A80F2CAE6FBAKL1PR0601MB4588_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Hello Xen development community,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
I wanted to discuss the limitations that I have faced while running Xen on =
KVM on Arm64 machines. I hope I am using the right mailing list.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
The biggest limitation is the costly emulation of instruction <code>tlbi vm=
alls12e1is</code>&nbsp;in KVM. The cost is exponentially proportional to th=
e IPA size exposed by KVM for VM hosting Xen. If I reduce the IPA size to 4=
0-bits in KVM, then this issue is not
 much observable but with the IPA size of 48-bits, it is 256x more costly t=
han the former one. Xen uses this instruction too frequently and this instr=
uction is trapped and emulated by KVM, and performance is not as good as on=
 bare-metal hardware. With 48-bit
 IPA, it can take up to 200 minutes for domu creation with just 128M RAM. I=
 have identified two places in Xen which are problematic w.r.t the usage of=
 this instruction and hoping to reduce the frequency of this instruction or=
 use a more relevant TLBI instruction
 instead of invalidating whole stage-1 and stage-2 translations.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<ol style=3D"margin-top: 0px; margin-bottom: 0px; list-style-type: decimal;=
" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:false,&quot;ord=
eredStyleType&quot;:1}" start=3D"1">
<li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; co=
lor: rgb(0, 0, 0);">
<div role=3D"presentation" class=3D"elementToProof">During the creation of =
domu, first the domu memory is mapped onto dom0 domain, images are copied i=
nto it, and it is then unmapped. During unmapping, the TLB translations are=
 invalidated one by one for each page
 being unmapped in <code>XENMEM_remove_from_physmap</code>&nbsp;hypercall. =
Here is the code snippet where the decision to flush TLBs is being made dur=
ing removal of mapping.&nbsp;</div>
</li></ol>
<blockquote style=3D"margin-left: 0.8ex; padding-left: 1ex; border-left: 3p=
x solid rgb(200, 200, 200);">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
index 7642dbc7c5..e96ff92314 100644</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
--- a/xen/arch/arm/mmu/p2m.c</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
+++ b/xen/arch/arm/mmu/p2m.c</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
@@ -1103,7 +1103,8 @@ static int __p2m_set_entry(struct p2m_domain *p2m,<br=
>
<br>
&nbsp;&nbsp;&nbsp; if ( removing_mapping )<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Flush can be deferred if the =
entry is removed */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p2m-&gt;need_flush |=3D !!lpae_=
is_valid(orig_pte);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //p2m-&gt;need_flush |=3D !!lpa=
e_is_valid(orig_pte);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p2m-&gt;need_flush |=3D false;<=
br>
&nbsp;&nbsp;&nbsp; else<br>
&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lpae_t pte =3D mfn_to_p2m_entry(=
smfn, t, a);</div>
</blockquote>
<ol style=3D"margin-top: 0px; margin-bottom: 0px; list-style-type: decimal;=
" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:false,&quot;ord=
eredStyleType&quot;:1}" start=3D"2">
<li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; co=
lor: rgb(0, 0, 0); display: block;">
<div role=3D"presentation" class=3D"elementToProof">This can be optimized b=
y either introducing a batch version of this hypercall i.e.,
<code>XENMEM_remove_from_physmap_batch</code>&nbsp;and flushing TLBs only o=
nce for all pages being removed</div>
<div role=3D"presentation" class=3D"elementToProof">OR<br>
by using a TLBI instruction that only invalidates the intended range of add=
resses instead of the whole stage-1 and stage-2 translations. I understand =
that a single TLBI instruction does not exist that can perform both stage-1=
 and stage-2 invalidations for a
 given address range but maybe a combination of instructions can be used su=
ch as:</div>
</li></ol>
<blockquote style=3D"margin-left: 0.8ex; padding-left: 1ex; border-left: 3p=
x solid rgb(200, 200, 200);">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
; switch to current VMID</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
tlbi rvae1, guest_vaddr ; first invalidate stage-1 TLB by guest VA for curr=
ent VMID<br>
tlbi ripas2e1, guest_paddr ; then invalidate stage-2 TLB by IPA range for c=
urrent VMID</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
dsb ish</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
isb</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
; switch back the VMID</div>
</blockquote>
<ol style=3D"margin-top: 0px; margin-bottom: 0px; list-style-type: decimal;=
" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:false,&quot;ord=
eredStyleType&quot;:1}" start=3D"3">
<li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; co=
lor: rgb(0, 0, 0); display: block;">
<div role=3D"presentation" class=3D"elementToProof">This is where I am not =
quite sure and I was hoping that if someone with Arm expertise could sign o=
ff on this so that I can work on its implementation in Xen. This will be an=
 optimization not only for virtualized
 hardware but also in general for Xen on arm64 machines.</div>
</li></ol>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<ol style=3D"margin-top: 0px; margin-bottom: 0px; list-style-type: decimal;=
" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:false,&quot;ord=
eredStyleType&quot;:1}" start=3D"2">
<li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; co=
lor: rgb(0, 0, 0);">
<div role=3D"presentation" class=3D"elementToProof">The second place in Xen=
 where this is problematic is when multiple vCPUs of the same domain juggle=
 on single pCPU, TLBs are invalidated everytime a different vCPU runs on a =
pCPU. I do not know how this can be
 optimized. Any support on this is appreciated.</div>
</li></ol>
<blockquote style=3D"margin-left: 0.8ex; padding-left: 1ex; border-left: 3p=
x solid rgb(200, 200, 200);">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
index 7642dbc7c5..e96ff92314 100644</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
--- a/xen/arch/arm/mmu/p2m.c</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
+++ b/xen/arch/arm/mmu/p2m.c</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
@@ -247,7 +247,7 @@ void p2m_restore_state(struct vcpu *n)</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; * when running multiple vCPU of the same domain on a s=
ingle pCPU.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; */</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp;if ( *last_vcpu_ran !=3D INVALID_VCPU_ID &amp;&amp; *la=
st_vcpu_ran !=3D n-&gt;vcpu_id )</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
- &nbsp; &nbsp; &nbsp; &nbsp;flush_guest_tlb_local();</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;; // flush_guest_tlb_local();</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp;</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp;*last_vcpu_ran =3D n-&gt;vcpu_id;</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp;}&nbsp;</div>
</blockquote>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks &amp; Regards,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Haseeb Ashraf</div>
</body>
</html>

--_000_KL1PR0601MB4588D25A95D680640A80F2CAE6FBAKL1PR0601MB4588_--

