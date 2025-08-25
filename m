Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298EFB342AF
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 16:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093227.1448768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqXr9-0004SV-Dh; Mon, 25 Aug 2025 14:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093227.1448768; Mon, 25 Aug 2025 14:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqXr9-0004Qn-9p; Mon, 25 Aug 2025 14:07:31 +0000
Received: by outflank-mailman (input) for mailman id 1093227;
 Mon, 25 Aug 2025 14:07:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0n7W=3F=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uqXr7-0004Qf-Jx
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 14:07:29 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce3c6d8c-81bc-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 16:07:16 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU0PR03MB8243.eurprd03.prod.outlook.com (2603:10a6:10:317::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 14:07:12 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Mon, 25 Aug 2025
 14:07:12 +0000
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
X-Inumbo-ID: ce3c6d8c-81bc-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHPJGqGPVS6zrIn911yXY88QM3TFS8S62xmyzf0hq113yT1PYDzFwlEM4PhO5Gi4c7Ot44Y4wWofZeQokdIkThGdtaZBL8VnqmM2PoOGfKQpop/KSKhuvHphDvn4TRfP4ccGW8BSz7VhNnMGJMbKQoosP5sPEbh9mmLy7u2VgBYIFKCKJvEZlt6T1F7B9FbNeAV/KEPBFxYmHPpARN83y0Ui+avP7k8N+5FR6ozOUlgc4UI2nuQgiW65hIl8NitrF43S+ijavMeGZ+KpD4CArbHknUiDnKGA3N8PTeCDv1wSpT/uuwFQisxt8Ekycd6fA/y/XdyCP6L/N0quJW92ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOgZU454hGNRQAich4MpnvTh4VUK/fd370NVTLKYJ6c=;
 b=n2wBzzrzM/z6UUHGRuUgm5Z8SZANHcEf7BMA/3bRVGm7vGbrA+ahicRYy5g4lE/r3P87a1aE1oQYGyLBH9DUYlq9HFrteZ9DIvTAWIO1JMOAKXfpF3stMTyyk6nBWGxZYX7oACWa2TpaVbeOvmwHuictZw4f5cRovhDux8yL82kmB3nW9WdQcvbPuMglAiVdDfjXSuV3wkcV52NdaNZA/FABot1rmI+johr31aFfZJ4ckBWszwdQgnoC0KoOy4/M/ydwXvAnGgM4igMMn81Jl9pVhBzZbpu8PyhQhpScmmAtX5iTZUYZ5WPzPPVQxo3lGj86HUUJRpHvXkCyijT1tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOgZU454hGNRQAich4MpnvTh4VUK/fd370NVTLKYJ6c=;
 b=fKSNKt9rLTJjGRbUs6JRBEwoKlwQv1z71H275UQR9UKZCO8GKQr1Q3jqkyDl6WCFZtollion0lsRAvgzWOJK5nirHxd0eVEAJATvWYw2qYiGF2A6lppj5ikvAp5FhgcjafeNYwiZk+TS+QSVdCCefQBc+SBrVjj6H+q2720JW+mESLL1kmWIgtjif/2GTyq41YpQl8vYez3A2RypXEL06hTe6pg4OJNBeL2tgZnB92v068mik7+ax+oQ/ilvTCTerE5KA698P+dRg+ayyGuATgPPgVPPTgfrrBtqF+SxidqoMdJaREB4uG7TLUe/h973Vj9B1CON3p8NEftjm9SRKg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 10/10] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v2 10/10] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHcB5d9o2YugLH3UUKTUBQVCD+iyrRzg+qA
Date: Mon, 25 Aug 2025 14:07:12 +0000
Message-ID: <68e0717e-f193-4718-bf04-c5c236eec65f@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <3ba2381b4c782a5187161f9418e5a35e7916c752.1754568795.git.leonid_komarianskyi@epam.com>
 <87a53sd1ry.fsf@epam.com>
In-Reply-To: <87a53sd1ry.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU0PR03MB8243:EE_
x-ms-office365-filtering-correlation-id: a95d604f-a3df-495d-d96d-08dde3e0b004
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dXQzYTZkQjlJaGlScy9xZFd6QUhJbldBQmw0Mi9XeE1DeFc0bFFLdE8yWVJ5?=
 =?utf-8?B?eklOblBEMGt3cWQvM0d1bU9uMVVjREkvU2dxQVZXbmVYeEtwWU5SYlE1MWMr?=
 =?utf-8?B?YmZOeWppTk9ESHhnUGxETHZ3MnV4YUd1Z2pCMkpRYnpoZHBCNGpuQ0Q2SFlE?=
 =?utf-8?B?OFBnSmwyR0g0R0hYaitzUm9la01Ea3BCWFNyb1MwOVNRVnpaVEU5VnJJazdr?=
 =?utf-8?B?ZzRRNnM5OVNvOE8rODRCL3dGUGVhTUI4ZHRDZWR1V2laSldIb1czeWxVVjRB?=
 =?utf-8?B?S2JLVTYwSWdjSEV4SDJMbHhOY2kxaHUrQzNLZnJNbjgyS013QklCc3JNRjJp?=
 =?utf-8?B?QjVXbURlQVZ6TU4vajBxU25kWEZuTDNCMXFwckhtSngyQWt3Z0pONFJOc3Ex?=
 =?utf-8?B?eDA5aG14L3dnVG1Kd2JCbUtGMWk1cTArWHRwdTJ0K3VPdHI1cHB4cXdTU3Rv?=
 =?utf-8?B?NHBMZUtFTHNwYXh1RXRpN1IrOW1SOUs1dFBNUkhyWkx2Nlp4U3dWNGNsWE9V?=
 =?utf-8?B?M1pIV2JNcktYUUpSWFNlSWVTZVp1NDFIQmdIWHRVekNPbUwxWjZ2UUorQVNH?=
 =?utf-8?B?RFlJYm4zSWE1czloUnZEMDExTkhnMDZWNGhDNHlvbWdXVlZ0L0hyOUczdjZv?=
 =?utf-8?B?bzF2SHhxR2JWU3BtUVZRUWVLZTRpWGFjN0dYZlI4ZSt2ZWFpL2h1TFN6ZWc2?=
 =?utf-8?B?dmRlU1N5bGZGZXZmRGRsUUthcWZHOVlDaDhVN2o0cVZWYmVPWFk5eUZESmxk?=
 =?utf-8?B?akhNMkViajJuUjNRUEJ1SlhKMlFPMWVmM1o4K0JNdGl1YnlwQk9YZDhiamQ0?=
 =?utf-8?B?MFdFWCtacFBaNGV6dHd6RUs4QVNFRmw5UUQxei9GYWcvbTFPTGdQUmtuTzBt?=
 =?utf-8?B?Q0tCYm1FanpvbHpmMGxkMHAyTHZaOXZ3Qmw2bTJrRjhmVndIRkpsVVdXQVpj?=
 =?utf-8?B?NTlwMHRyRkpyODJmR3drSGdZTmQwUjQ3NVFrWmZHRVByK056MVgyZkRZZjJz?=
 =?utf-8?B?a0VDa1FMeGRFSUtkdTVmR3dlZ1ZsZnRmOURvYThsK0s5cjRkZFkxV3ZVTWVO?=
 =?utf-8?B?djZjNnNkYkZVUUlKd0lQckhvb21TZzR5WFE1N3FhN0tnYkg4ZjZUdE5Wd3Nx?=
 =?utf-8?B?VEFLcjl5di9iZk44d1dGY2gweXhKUS9XWG0zeThkbnc1RWNtV2F2NmlHRXJZ?=
 =?utf-8?B?NDhTV2FOenUwd3dDWFFLek9vWEdST2tYcWFCOFgrenowNGFZWmMvbGZrVkpH?=
 =?utf-8?B?d1FOc0tDdHRnbk5HRFRRTlIzZitnY3hxL2piT2NNY0FqUHNiem5mOVliYmVP?=
 =?utf-8?B?aS9pTlBwUkdmall0UThxQU9FRVpqSS9RUk5qb2ZYekIzMnV0c2libW9FMVhw?=
 =?utf-8?B?SENKNGlYcFptcGdIMTlBSHFLTWVETmd2KzU0cDN0NFRmMU9nV2FveTRXb2hF?=
 =?utf-8?B?M3dtZUlreE1ocEowS0piYU9icEhPY2VNYTgzd1NEdlhNZ0pxd3RkZkw2ZDNL?=
 =?utf-8?B?V2I3NjlTd1FrSlRNeVRoZFhsZWF0aHdObGlMYUdzTzAydDlZY01DRHp5cnhL?=
 =?utf-8?B?dkQyU1dEbUFsSDE3aFQ4Z2NlZUFXNGhXQzM1RG9DNDdDUUVIWXBXNm5pNlph?=
 =?utf-8?B?Z2loaTZCM2trNFV3ZzdmRWJqUEU2MVN0QTNtT29kU0VDTnRVWnEwTWV4YUN4?=
 =?utf-8?B?TmVPeTVOa1dzWlFCbytlem5GWXQ3eWpabEJ0N3doV1JRb2FrdnlFWUlSZFdM?=
 =?utf-8?B?eXpoZjQ3d1ozSDdETjFzRlBJWU9LL3hlZVpjY1ZORmF1eDFiU0ptbmxSLzJN?=
 =?utf-8?B?bDgxSno0TnRyQ2t4WVNlbHNtbXAxRmQrZ0ZScTJtb0tyT3NSVWhtUlQyZFY0?=
 =?utf-8?B?OU5Sb25ta0s3MkpjVTZWVEhZMFpDc1ZzK0RmSitGS01BaGQ2S01YdzBPMDRh?=
 =?utf-8?B?U3RSSllrM2w1Q0tTdVBvV0lUK2lGRk96QmZmMVM1bytzNitOS2hKVUh1Tlcz?=
 =?utf-8?B?MXB2WXV2SDB3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TmR0eGR4MndORUxsWFVJazg2MnlPQktUdngzby9Ma1pPTnc4K1N3clRrcURk?=
 =?utf-8?B?M0R4endyaXdiRzZORzA4dFNreGZ4YUt2b2pkVFVNTEwvd1NuM056MkdqU1g1?=
 =?utf-8?B?cGdNWkNHajBWTFBCRmNSdVg5Mjk2SlNRYmdYbTFPWFdZUkdVQXdXWGtWT1dB?=
 =?utf-8?B?Ry90d21HU2dNRlpTWFN1QXdzZ0VCczVZUkxiZlFSV0ZqNWcxNkRGd2RJV1NK?=
 =?utf-8?B?YVI1Z0pGNm9PQlJ5VXUyc1FLRW54RDQ1eXN0ZTlhNHZ6RXRJV1RWNVRoT01i?=
 =?utf-8?B?TlRHa2duQzR1Vkgxc2cwTXd1RUJ3cGV1eStKVWhDczE1S3RsK3NBbTZNSThr?=
 =?utf-8?B?OWVwUjVvR2l5aEptTGlnNnhQM1ZJamNRNUZZOCtuUUlJNWVXQ0JnZ3JkckFG?=
 =?utf-8?B?WjVSdjdWOHFyY3dnV1IrNVFXMTBsTTZtdC9uNnRsOGIxSU83YTBOb1E5cjlC?=
 =?utf-8?B?Z0FpN0tUcFdWTE1NME0yOTlTVnhOVTVsdE9DbmUySjluL0xoNkU1em1waDIx?=
 =?utf-8?B?empPSGlIQW9BQVJ6ZkRZaVdGdytGQUwveTN1anhwYS9YZkpKeVFvbnJTNFdQ?=
 =?utf-8?B?R2lQcENDL1RYVU1PaHcrTmtLU1ZQc1dRakN3M0piL3RnSXZtNGk2NExwcy9n?=
 =?utf-8?B?TEJvMVJwSyttOUQ0S3RBRkZXalhJZkxNSVZFQTRNMThRNzlwR3VZOWRWSFlL?=
 =?utf-8?B?aXNCQWs2d0crUkNTdXVyc20zUkgxa3pnblY0aXpmVytPV3FrQXdiekJ5cEE1?=
 =?utf-8?B?K0VBYXVQbmRYQzdoUmZFWVZ0Yzg1ejNhQjNlZlcyaTRFclhsUWI3KzFPWWpj?=
 =?utf-8?B?eTcvaUJkYmVpaGcvUzBRVGhFVnZkVGJZWW1idEdkb0NCL09mNGo0TlR2MkI5?=
 =?utf-8?B?OUk3bGp3NHh1enp2MTEzSlRhOVdyM1F3Q2hhd3BBVDE2Z2ZQZlloZTNQRE9X?=
 =?utf-8?B?NlMrMFB3NVVhSE1sdENWVStEeFJJL053TVJtUDlFckNlS2NKcEVOVnZpYXg0?=
 =?utf-8?B?L1ZWazVyNk1kZkRPOHpGT2FIbHNBVjZ3eFlyNzF0dUtCWXBQTUxLTzlNU1U4?=
 =?utf-8?B?cXlhRk9ZKzJrVW03QVlTVXVFcGpIc2swSDN5ODZpMXNTSDVhNTdpWjdDSXhW?=
 =?utf-8?B?KzQrUG1yaGp3QzB2cWhSbTJhTHZYbGhkYXdNM2NxSmhHRDcrenFCYmk5WVEy?=
 =?utf-8?B?K3Zra3E4cGR5a0liZ1d2S1ZWNFZKUUlSZnpXOHU3L29lVWNQQkdrUGtkY29t?=
 =?utf-8?B?cE0raGhqOTZMbWxJMllVaHl2V3FtU05XRlhucUVEbkhRMzhzaDNqNjk1QUVZ?=
 =?utf-8?B?MCs0MlVNTXN3UnIvQ0R1ZlA3cU8vUmdhZ2tvdVNlQmpDWWxuU3JVZCt0SmlZ?=
 =?utf-8?B?ek9KU3QyUDlmcUxlaXdRVm5WS0VFRk03RldQQkNSTzAvNkZ0QXVsVU9KUTNs?=
 =?utf-8?B?dU1XaFU4Q1RzUXpkdmRxdHdoeDdqeEx3RytkZkNuNWhXbVhXSTZITFZ2eWIw?=
 =?utf-8?B?WHpsVy9iTTh0VDQ2bnRtZDRnWkd3WVlSNzJBN08zcm5zMllQcWhWRUNMYWw5?=
 =?utf-8?B?aGpud3ZaeUNPSGlzSDk2VWQ5MVR6aitMSWJvb2JLdDBYV0puVFMzRXBhcTZU?=
 =?utf-8?B?VEtSKytPK0l3aEpOTUo3d21BZ3NnV1hYMTJHUlNoelRkZGJRdk5KcjNQOXY1?=
 =?utf-8?B?M0wrS2xKNmJjd2gwRHYvU1pkQWZLc1Y3TzZuNmRqdHpHR3lINXh0ZnUwT2dq?=
 =?utf-8?B?NGY5UzY4RGRob3E1NlNlVjhGb1AwZkEyOGVPTTRuMW5CSVFJOWtDUWZtbDR1?=
 =?utf-8?B?K21qSnVwL0NOM2dqL1lxVnV3KzY3RVNwc21hbUlHVElGVW5IUFh5MTE1NjJJ?=
 =?utf-8?B?eXMrTGdGNTNjajV5bVY1WTdQZm5xYVBROUFHZFBtZWVuckN3bE5FdWhUakZZ?=
 =?utf-8?B?UHlUbkxWT09kcHduMUxudWFRSWhzeWFMYVZOdmp1THRhZkNUM1F0NzhSVDdX?=
 =?utf-8?B?RDYxQlNlcUpRZ0pOckRYNEc5UExhSWdhdytjYTJFNkM2c1F5cE1EQTZoZjN6?=
 =?utf-8?B?N09hRTZ3TGR5ZUlpNDJvRi9XZjFlOVpOZUpFRXZ3dXRoNWp1dlBCbmE0VWRO?=
 =?utf-8?B?Q21qS3JuU0ZoanB2blQzcXIvaHJBZUgrV2dFK0FrMkJudjdoV2k4S1VuTEVi?=
 =?utf-8?Q?0ECEtsL+NLYO05ov0mHT11k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCE91E96D891F643B1956A1F5095E33E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a95d604f-a3df-495d-d96d-08dde3e0b004
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 14:07:12.1569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c2jSojPrhHPEbhBnsfyCQ6yoruGRAFdR/QU865O6Grqi2FjEVxZeYI6UmuM6WvYqLUHZvNWwrHhMwuFd+PM1ZURSF+6iCDRuXZrTxjV2X2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8243

SGVsbG8gVm9sb2R5bXlyLA0KDQoNCk9uIDIxLjA4LjI1IDIwOjI2LCBWb2xvZHlteXIgQmFiY2h1
ayB3cm90ZToNCj4gDQo+IEhpIExlb25pZCwNCj4gDQo+IExlb25pZCBLb21hcmlhbnNreWkgPExl
b25pZF9Lb21hcmlhbnNreWlAZXBhbS5jb20+IHdyaXRlczoNCj4gDQo+PiBJbXBsZW1lbnRlZCBz
dXBwb3J0IGZvciBHSUN2My4xIGV4dGVuZGVkIFNQSSByZWdpc3RlcnMgZm9yIHZHSUN2MywNCj4+
IGFsbG93aW5nIHRoZSBlbXVsYXRpb24gb2YgZVNQSS1zcGVjaWZpYyBiZWhhdmlvciBmb3IgZ3Vl
c3QgZG9tYWlucy4NCj4+IFRoZSBpbXBsZW1lbnRhdGlvbiBpbmNsdWRlcyByZWFkIGFuZCB3cml0
ZSBlbXVsYXRpb24gZm9yIGVTUEktcmVsYXRlZA0KPj4gcmVnaXN0ZXJzIChlLmcuLCBHSUNEX0lT
RU5BQkxFUm5FLCBHSUNEX0lST1VURVJuRSwgYW5kIG90aGVycyksDQo+PiBmb2xsb3dpbmcgYSBz
aW1pbGFyIGFwcHJvYWNoIHRvIHRoZSBoYW5kbGluZyBvZiByZWd1bGFyIFNQSXMuDQo+Pg0KPj4g
VGhlIGVTUEkgcmVnaXN0ZXJzLCBwcmV2aW91c2x5IGxvY2F0ZWQgaW4gcmVzZXJ2ZWQgYWRkcmVz
cyByYW5nZXMsDQo+PiBhcmUgbm93IGFkanVzdGVkIHRvIHN1cHBvcnQgTU1JTyByZWFkIGFuZCB3
cml0ZSBvcGVyYXRpb25zIGNvcnJlY3RseQ0KPj4gd2hlbiBDT05GSUdfR0lDVjNfRVNQSSBpcyBl
bmFibGVkLg0KPj4NCj4+IFRoZSBhdmFpbGFiaWxpdHkgb2YgZVNQSXMgYW5kIHRoZSBudW1iZXIg
b2YgZW11bGF0ZWQgZXh0ZW5kZWQgU1BJcw0KPj4gZm9yIGd1ZXN0IGRvbWFpbnMgaXMgcmVwb3J0
ZWQgYnkgc2V0dGluZyB0aGUgYXBwcm9wcmlhdGUgYml0cyBpbiB0aGUNCj4+IEdJQ0RfVFlQRVIg
cmVnaXN0ZXIsIGJhc2VkIG9uIHRoZSBudW1iZXIgb2YgZVNQSXMgcmVxdWVzdGVkIGJ5IHRoZQ0K
Pj4gZG9tYWluIGFuZCBzdXBwb3J0ZWQgYnkgdGhlIGhhcmR3YXJlLiBJbiBjYXNlcyB3aGVyZSB0
aGUgY29uZmlndXJhdGlvbg0KPj4gb3B0aW9uIGlzIGRpc2FibGVkLCB0aGUgaGFyZHdhcmUgZG9l
cyBub3Qgc3VwcG9ydCBlU1BJcywgb3IgdGhlIGRvbWFpbg0KPj4gZG9lcyBub3QgcmVxdWVzdCBz
dWNoIGludGVycnVwdHMsIHRoZSBmdW5jdGlvbmFsaXR5IHJlbWFpbnMgdW5jaGFuZ2VkLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IExlb25pZCBLb21hcmlhbnNreWkgPGxlb25pZF9rb21hcmlhbnNr
eWlAZXBhbS5jb20+DQo+Pg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIFYyOg0KPj4gLSBhZGQgbWlz
c2luZyByYW5rIGluZGV4IGNvbnZlcnNpb24gZm9yIHBlbmRpbmcgYW5kIGluZmxpZ2h0IGlycXMN
Cj4+IC0tLQ0KPj4gICB4ZW4vYXJjaC9hcm0vdmdpYy12My5jIHwgMjQ4ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyNDUgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL3ZnaWMtdjMuYyBiL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMNCj4+IGluZGV4IDQzNjljNTUx
NzcuLjFjYWNiYjZlNDMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdmdpYy12My5jDQo+
PiArKysgYi94ZW4vYXJjaC9hcm0vdmdpYy12My5jDQo+PiBAQCAtMTExLDcgKzExMSw3IEBAIHN0
YXRpYyB1aW50NjRfdCB2Z2ljX2ZldGNoX2lyb3V0ZXIoc3RydWN0IHZnaWNfaXJxX3JhbmsgKnJh
bmssDQo+PiAgICAqIE5vdGUgdGhlIG9mZnNldCB3aWxsIGJlIGFsaWduZWQgdG8gdGhlIGFwcHJv
cHJpYXRlIGJvdW5kYXJ5Lg0KPj4gICAgKi8NCj4+ICAgc3RhdGljIHZvaWQgdmdpY19zdG9yZV9p
cm91dGVyKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2Z2ljX2lycV9yYW5rICpyYW5rLA0KPj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgb2Zmc2V0LCB1aW50
NjRfdCBpcm91dGVyKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgb2Zmc2V0LCB1aW50NjRfdCBpcm91dGVyLCBib29sIGVzcGkpDQo+IA0KPiBJIGFtIHdv
bmRlcmluZzogbWF5YmUgaXQgaXMgYmV0dGVyIHRvIHBhc3MgdmlycSBpbnN0ZWFkIG9mIG9mZnNl
dCBpbnRvDQo+IHRoaXMgZnVuY3Rpb24/IEluIHRoYXQgY2FzZSB5b3UgY2FuIGdldCByaWQgb2Yg
ZXNwaSBwYXJhbWV0ZXIuDQo+IA0KPj4gICB7DQo+PiAgICAgICBzdHJ1Y3QgdmNwdSAqbmV3X3Zj
cHUsICpvbGRfdmNwdTsNCj4+ICAgICAgIHVuc2lnbmVkIGludCB2aXJxOw0KPj4gQEAgLTEyMyw3
ICsxMjMsOCBAQCBzdGF0aWMgdm9pZCB2Z2ljX3N0b3JlX2lyb3V0ZXIoc3RydWN0IGRvbWFpbiAq
ZCwgc3RydWN0IHZnaWNfaXJxX3JhbmsgKnJhbmssDQo+PiAgICAgICAgKiBUaGUgSVJPVVRFUjAt
MzEsIHVzZWQgZm9yIFNHSXMvUFBJcywgYXJlIHJlc2VydmVkIGFuZCBzaG91bGQNCj4+ICAgICAg
ICAqIG5ldmVyIGNhbGwgdGhpcyBmdW5jdGlvbi4NCj4+ICAgICAgICAqLw0KPj4gLSAgICBBU1NF
UlQodmlycSA+PSAzMik7DQo+PiArICAgIGlmICggIWVzcGkgKQ0KPj4gKyAgICAgICAgQVNTRVJU
KHZpcnEgPj0gMzIpOw0KPiANCj4gYmV0dGVyIHRvIHdyaXRlDQo+IEFTU0VSVCAoIWVzcGkgJiAo
dmlycT49MzIpKQ0KPiANCj4gYW5kIHByb2JhYmx5IHlvdSBuZWVkIHN5bW1ldHJpY2FsIEFTU0VS
VCBmb3IgZXNwaSA9PSB0cnVlDQo+IA0KPj4gICAgICAgLyogR2V0IHRoZSBpbmRleCBpbiB0aGUg
cmFuayAqLw0KPj4gICAgICAgb2Zmc2V0ID0gdmlycSAmIElOVEVSUlVQVF9SQU5LX01BU0s7DQo+
PiBAQCAtMTQ2LDYgKzE0NywxMSBAQCBzdGF0aWMgdm9pZCB2Z2ljX3N0b3JlX2lyb3V0ZXIoc3Ry
dWN0IGRvbWFpbiAqZCwgc3RydWN0IHZnaWNfaXJxX3JhbmsgKnJhbmssDQo+PiAgICAgICAvKiBP
bmx5IG1pZ3JhdGUgdGhlIElSUSBpZiB0aGUgdGFyZ2V0IHZDUFUgaGFzIGNoYW5nZWQgKi8NCj4+
ICAgICAgIGlmICggbmV3X3ZjcHUgIT0gb2xkX3ZjcHUgKQ0KPj4gICAgICAgew0KPj4gKyNpZmRl
ZiBDT05GSUdfR0lDVjNfRVNQSQ0KPj4gKyAgICAgICAgLyogQ29udmVydCB2aXJxIGluZGV4IHRv
IGVTUEkgcmFuZ2UgKi8NCj4+ICsgICAgICAgIGlmICggZXNwaSApDQo+PiArICAgICAgICAgICAg
dmlycSA9IEVTUElfSURYMklOVElEKHZpcnEpOw0KPj4gKyNlbmRpZg0KPiANCj4gSWYgeW91IGRl
ZmluZSBFU1BJX0lEWDJJTlRJRCgpIHVuY29kaXRpb25hbGx5LCB5b3UgY2FuIGdldCByaWQgb2Yg
I2lmZGVmDQo+IENPTkZJR19HSUNWM19FU1BJIGhlcmUNCj4gDQo+PiAgICAgICAgICAgaWYgKCB2
Z2ljX21pZ3JhdGVfaXJxKG9sZF92Y3B1LCBuZXdfdmNwdSwgdmlycSkgKQ0KPj4gICAgICAgICAg
ICAgICB3cml0ZV9hdG9taWMoJnJhbmstPnZjcHVbb2Zmc2V0XSwgbmV3X3ZjcHUtPnZjcHVfaWQp
Ow0KPj4gICAgICAgfQ0KPj4gQEAgLTY4NSw2ICs2OTEsOSBAQCBzdGF0aWMgaW50IF9fdmdpY192
M19kaXN0cl9jb21tb25fbW1pb19yZWFkKGNvbnN0IGNoYXIgKm5hbWUsIHN0cnVjdCB2Y3B1ICp2
LA0KPj4gICAgICAgew0KPj4gICAgICAgY2FzZSBWUkFOR0UzMihHSUNEX0lHUk9VUFIsIEdJQ0Rf
SUdST1VQUk4pOg0KPj4gICAgICAgY2FzZSBWUkFOR0UzMihHSUNEX0lHUlBNT0RSLCBHSUNEX0lH
UlBNT0RSTik6DQo+PiArI2lmZGVmIENPTkZJR19HSUNWM19FU1BJDQo+IA0KPiBEbyB5b3UgcmVh
bGx5IG5lZWQgaWZkZWYgaGVyZT8NCj4gDQo+PiArICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JR1JP
VVBSbkUsIEdJQ0RfSUdST1VQUm5FTik6DQo+PiArI2VuZGlmDQo+IA0KPiANCj4+ICAgICAgICAg
ICAvKiBXZSBkbyBub3QgaW1wbGVtZW50IHNlY3VyaXR5IGV4dGVuc2lvbnMgZm9yIGd1ZXN0cywg
cmVhZCB6ZXJvICovDQo+PiAgICAgICAgICAgaWYgKCBkYWJ0LnNpemUgIT0gREFCVF9XT1JEICkg
Z290byBiYWRfd2lkdGg7DQo+PiAgICAgICAgICAgZ290byByZWFkX2FzX3plcm87DQo+PiBAQCAt
NzEwLDExICs3MTksMTkgQEAgc3RhdGljIGludCBfX3ZnaWNfdjNfZGlzdHJfY29tbW9uX21taW9f
cmVhZChjb25zdCBjaGFyICpuYW1lLCBzdHJ1Y3QgdmNwdSAqdiwNCj4+ICAgICAgIC8qIFJlYWQg
dGhlIHBlbmRpbmcgc3RhdHVzIG9mIGFuIElSUSB2aWEgR0lDRC9HSUNSIGlzIG5vdCBzdXBwb3J0
ZWQgKi8NCj4+ICAgICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JU1BFTkRSLCBHSUNEX0lTUEVORFJO
KToNCj4+ICAgICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JQ1BFTkRSLCBHSUNEX0lDUEVORFJOKToN
Cj4+ICsjaWZkZWYgQ09ORklHX0dJQ1YzX0VTUEkNCj4gDQo+IFNhbWUgYXMgaGVyZQ0KPiANCj4+
ICsgICAgY2FzZSBWUkFOR0UzMihHSUNEX0lTUEVORFJuRSwgR0lDRF9JU1BFTkRSbkVOKToNCj4+
ICsgICAgY2FzZSBWUkFOR0UzMihHSUNEX0lDUEVORFJuRSwgR0lDRF9JQ1BFTkRSbkVOKToNCj4+
ICsjZW5kaWYNCj4+ICAgICAgICAgICBnb3RvIHJlYWRfYXNfemVybzsNCj4+ICAgDQo+PiAgICAg
ICAvKiBSZWFkIHRoZSBhY3RpdmUgc3RhdHVzIG9mIGFuIElSUSB2aWEgR0lDRC9HSUNSIGlzIG5v
dCBzdXBwb3J0ZWQgKi8NCj4+ICAgICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JU0FDVElWRVIsIEdJ
Q0RfSVNBQ1RJVkVSTik6DQo+PiAgICAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSUNBQ1RJVkVSLCBH
SUNEX0lDQUNUSVZFUk4pOg0KPj4gKyNpZmRlZiBDT05GSUdfR0lDVjNfRVNQSQ0KPiANCj4gLi4u
IGFuZCBoZXJlIGFuZCBpbiBhbGwgb3RoZXIgcGxhY2VzDQo+IA0KDQpJIGhhdmUgcmVjaGVja2Vk
IHRoZSBpZGVhIG9mIHJlbW92aW5nIHNvbWUgb2YgdGhlICNpZmRlZnMsIGFuZCANCnVuZm9ydHVu
YXRlbHksIEkgY2Fubm90IHNpbXBseSBkbyB0aGlzIGFzIGlzIGhlcmUsIGJlY2F1c2UgaW4gdGhp
cyBjYXNlLCANCkkgd291bGQgbmVlZCB0byBtb3ZlIHRoZSByZWdpc3RlciBvZmZzZXRzIG91dCBv
ZiB0aGUgQ09ORklHX0dJQ1YzX0VTUEkgDQpndWFyZCBpbiB0aGUgcHJldmlvdXMgcGF0Y2ggaW4g
dGhlIHNlcmllcy4gUGxlYXNlIHNlZToNCltQQVRDSCB2MiAwNS8xMF0geGVuL2FybTogZ2ljdjM6
IGltcGxlbWVudCBoYW5kbGluZyBvZiBHSUN2My4xIGVTUEkNCg0KQXMgYSByZXN1bHQsIHdpdGgg
Q09ORklHX0dJQ1YzX0VTUEkgZGlzYWJsZWQsIHdlIHdvdWxkIGhhdmUgbWFueSB1bnVzZWQgDQpk
ZWZpbmVzIGFuZCBhbHNvIHVucmVhY2hhYmxlIGNvZGUgaW4gX192Z2ljX3YzX2Rpc3RyX2NvbW1v
bl9tbWlvX3JlYWQgDQphbmQgX192Z2ljX3YzX2Rpc3RyX2NvbW1vbl9tbWlvX3dyaXRlIChJIHRo
aW5rIHRoZSBNSVNSQSB0ZWFtIHdpbGwgbm90IA0KYmUgaGFwcHkgYWJvdXQgdGhpcy4uKS4gVGh1
cywgSSBwcmVmZXIgdG8gbGVhdmUgdGhlICNpZmRlZnMgYXMgdGhleSBhcmUuIA0KSG93ZXZlciwg
aWYgeW91IHRoaW5rIGl0IGlzIGJldHRlciB0byByZW1vdmUgdGhlICNpZmRlZnMsIEkgd2lsbCB1
cGRhdGUgDQp0aGUgYXBwcm9wcmlhdGUgcGF0Y2ggdG8gbWFrZSB0aGVzZSBjaGFuZ2VzIGNvbXBp
bGFibGUgd2l0aCBmZXdlciANCiNpZmRlZnMgYW5kIENPTkZJR19HSUNWM19FU1BJIGRpc2FibGVk
Lg0KDQpCZXN0IHJlZ2FyZHMsDQpMZW9uaWQNCg==

