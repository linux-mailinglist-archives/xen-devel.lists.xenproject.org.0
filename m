Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937DBB2A1F9
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 14:45:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086024.1444256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unzFA-0003x8-2W; Mon, 18 Aug 2025 12:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086024.1444256; Mon, 18 Aug 2025 12:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unzF9-0003vf-VB; Mon, 18 Aug 2025 12:45:43 +0000
Received: by outflank-mailman (input) for mailman id 1086024;
 Mon, 18 Aug 2025 12:45:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=czvt=26=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1unzF8-0003vE-Ff
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 12:45:42 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d35beeb-7c31-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 14:45:37 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB7735.eurprd03.prod.outlook.com (2603:10a6:20b:405::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 12:45:35 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 12:45:34 +0000
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
X-Inumbo-ID: 3d35beeb-7c31-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6zWZnPs+W2bR2aYhHS4DDCG472zkU3XNGurA6Gtrk0+FYZtmTXVkkl1NBnwaUOnZuSxp9pEb8hBNFKmt1MVI5boMdQpTa3ZwCpTWDYg+cWZGpZxBBOMN9iqtAIiPqeVLApMz/0yR/NQNTCKHU2To9uj+O8veoyh9Fm37u9tuuAexXQjjjAsAeH0AFJhf74ufM+YbosIRSEuofaa0zRu47+HT4eiL5kBypuB87T9ba448donGzI52fWXKhIUxAYJ2G1+78zWdGAN8ADjJ+i+bFawFa10IubqPjI+glo/rUezC8ASUajqEprjvwIpDW4MrHHdi6DSL5qwDMXzZ3sb6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohAJdWNY7iLIqoQeAkdAh8dV5HVGtsMZnmPU5ogE1B8=;
 b=dxGyruQ0KDgAq7fXnBTmtTdv7cYKAew6oDNsY0xDOPx9p57J1uABX+rZGvPhpazOVKujIRfH45jBYnc3yttNkTfazmc8gMqm3SvSbX08u89/w5H1uP1k3w3T9QcgtKDoZQDAZGT5ehJbYceuTBHDY8Gt8/KOLsnaHFVwoowwLEjtI1X9MTkCqgn4uCdienhP2WQy8r3SbzwWv8BNWCM+TMRtv7vAZtbuTNIgk6FuY6U7d7KaqVXy/VCYzG4RVgCXvVvNEvSJM9NxeGLCq6Davy927KXeKCWOiERxwi4rv33M538QghVvAI0eh2tIgK1l5OiHw7U1PTY9fu3eu6Eqwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohAJdWNY7iLIqoQeAkdAh8dV5HVGtsMZnmPU5ogE1B8=;
 b=Uaovfy+sHk9tBZsWRgbyXZ3gwjBOhQI2HFslo0hkoV/ph+GYSlAf6Y16AUdA3C8IfwulHg8augch9pqp/9YuNy0+kEpNW1t3CywBRsnwd+aw2ylCjANeCXkysukjfdANXGSTI8qsQF4vwxR6b3ld8dG2zGxWynNA31lfi/7OgKLFRDfeNmn1Ngukyt9kMXDLjSU81nah01UFqMWLLt03P/72TdDM60mofSQJ7wZUx0M9fKKURDNrYP1OEm8dhHHlTNkvnc/BCwZGexxBQ+v+ERWlrSjiWjQAG4P+d+M6M5BdjlWBKEUYjwD/APDhR8Lyfc/naxv9MCVF2DdbIrlxFQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] efi: remove unreachable code in read_file()
Thread-Topic: [PATCH] efi: remove unreachable code in read_file()
Thread-Index: AQHcC72+MqlVxdSA/E6jjiAcMI3Nd7Rh0dCAgAaSrYA=
Date: Mon, 18 Aug 2025 12:45:34 +0000
Message-ID: <e1b5de9c-b911-4349-a045-fa9b15a04ecd@epam.com>
References:
 <52dbb5c5c1385b3b9d8522ef308ef15248973368.1755023074.git.dmytro_prokopchuk1@epam.com>
 <bda0c44d-d862-4045-8653-0d36d3ad479e@suse.com>
In-Reply-To: <bda0c44d-d862-4045-8653-0d36d3ad479e@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB7735:EE_
x-ms-office365-filtering-correlation-id: 763c30f8-6e3b-4f41-b8f6-08ddde551ffc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cG1ua2djV05QUE80dmg4c1h5MnMvcjNZQzNzTE5uQnlYN0hYUG9rMGxka2VG?=
 =?utf-8?B?dmdRbnZCZk8ybmRxREtPSm1xRFdsN3hQWTZqdUY4NHR0VG5kK0p6SjFJS3ZM?=
 =?utf-8?B?cDl1VmJVOUhzQmtVTDZFL1liWTljTDJvZ1FYN20yZzdSaTBpekFvZnh3eXpw?=
 =?utf-8?B?RE5NdUd2Mkkxd2I1Z0lzdGRLTjJlTlk5bXkrNTAyWW1DVlVvUksxR1JOZWlj?=
 =?utf-8?B?YTM1dFlHdjRNbS9zbGNLcHAzRXZURUtHM3pCSkxNMEZFZTdBUnpMdFgzNDAx?=
 =?utf-8?B?eEh2Q3RWalZuT2wxL1JEY3pseG4yUFArNjlLUkFjQXAzeE9OL2xTWFZFd0hy?=
 =?utf-8?B?Y0dFS2kvbFdpeVlTdTU0MkU1b1N3T3JIUk5uRmcxSUM3NXNsT3pSVlFibnpz?=
 =?utf-8?B?UU1RYjg3eEdSNWxRZzJDZkNwZmIvOFp2eW1Gb2VNZHhldGUwcU40ajV1YkMr?=
 =?utf-8?B?SThiQkx0UW8xQVp5SkJRV3NNRmNvbGJ1TTF0RnkraGt0M0xZUkRPL1RUSUZp?=
 =?utf-8?B?cElRaER3dSs3RzJ1MUZVanYrUDR1RlJGMWRCdlJVOU9jOVRLS3RRUndBWDRC?=
 =?utf-8?B?L0htZlZLMEZZaUhFKy9ZWnVRZFVJcnRyYUVKSEg2anUzQXl2eWZKVUpMdWpQ?=
 =?utf-8?B?NXdNOHVXcThxaHhHZDRKdVFyNkxjSkZUdGxuM1ZkWGJlNTBiNUZ4akdPVk95?=
 =?utf-8?B?WDR3cVlIWThibW1iVWtDSzIvM21ZV2p2QTRKM2pIamRSSFA1bHM4WjFFOVhG?=
 =?utf-8?B?YThpSGFrRTR3aGNlbi9IZ20xL1JwVGtRNVVxU3ZYUXpBalZMYkI4T3I0ZHZw?=
 =?utf-8?B?cG1Gb1U4KytDZUtpTDc4VnlDblRvSGtBVURmb3dIYVhQUFZENGlNY0w2c2Vi?=
 =?utf-8?B?dmVSTkQ0S3Vqc3R6eWtPZThPZVFSWXlDalVYSkN5SVhaNmpsazBpY1NBN2lS?=
 =?utf-8?B?Q1pMdWt6WFljOHk1VzI5VG5hU0JkN2pmbS96STdSbDJ4aHNsNEhxVC9Cejk5?=
 =?utf-8?B?eERiVVl5aXBWTlE5YWlRZ2s0QU1VZzRjaE9MYXhjUjBnNU1MK1A2Z3UyOWt4?=
 =?utf-8?B?V0dqcldrOGorOTJ4STN2ckZWSFAzb2o5eEUwZUJRMXp4UUxRWjVnQ2ZZdDdm?=
 =?utf-8?B?MzcxR3N4dk4wNml1dzJPTDAzTHJ1VXEybHZmR0pVenRzWDZRSDNHbG8waVFH?=
 =?utf-8?B?UTQ5b2Q1Nm9CQXprSG00Q3dodUxwVXl1SXlRNEZKdEdNZUFaNkdWWjY2QWNw?=
 =?utf-8?B?ZG1KNWZnOEthaXR0OXM4NG0wY084dHljeFdIU1BBc0Mwb1dtT0pyb0Z6dno5?=
 =?utf-8?B?bmZDSTRSVHVPWXZtUWhwRVdzV2NMUTBkMXdzalFuUDdWWTQxR1NiZ3VaMHV0?=
 =?utf-8?B?aXN4U0dCaFdrNUZxN0RvZnlTU1hSaVRwNE1FMnUvSXNLMHFJanNqZSttVitO?=
 =?utf-8?B?azc2MDY0Ti83YTIwcWZxMUswUWpPUmUvbWpEOUJnRVZVRG1sMFRYb1JTZkM0?=
 =?utf-8?B?clNCM1dKdllkeHZma2dnbUk3TDl1MzYwNS9QS0JESmVSbEZLVmpla1RyT2xD?=
 =?utf-8?B?bEJsZXRmeXYrbk02VFVpajBYYlhnQUhCYnFGTU5KMGlja0NQTWNKU2gvQ2Fz?=
 =?utf-8?B?MzhIRFdQTlBZcDkvd1JOYlNqQ0JrdmlhUVg0RW12SnJvOFdtZGdCcEVZdTNa?=
 =?utf-8?B?b2t3WURwSGkyU3ZsZzd0S1FLakpBcHYwYnJ5c0kwNlNKNEw5OUhVb1BSRXpq?=
 =?utf-8?B?a2NLRFJ4Zk9kZTRvSEVQTHdaV3ZRMDN0ZUJyVHN1RnRyZGZSUE1iK2w4SXd0?=
 =?utf-8?B?anZBbjBKc05XTkIxbnZ6U2ErUVVIcmNGZFpWSE9JZEpXTlJDSHhGKzlINU5P?=
 =?utf-8?B?YW95WHRVcHZHTjl6Z3NrbGl1YWFTRUFNVUdzZDgxbDF1M1Yzd2FlenhyVzFG?=
 =?utf-8?Q?DDr8vR7AS9A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eFhYdjVVcEVGb29PdlgvVllKSHg2WlVKVnh2U1NNZmFzTnVYZ29iWW9QUmZO?=
 =?utf-8?B?T2NhcTFWL1pRZnhtbTQ4cUVYK2pLOG0rOWtGUTJaemFNU1JFc0pyVVRPOVVP?=
 =?utf-8?B?bGVNdnYrUzduYkdGSEVMa3ErSnQ4SWhKeUN2SHRvLzR4UUU4clM3eHcxTkY0?=
 =?utf-8?B?NFAxNktiQkNvWE9hekh1Z2NpaU1ram02ZlczWC9UZGRlVXMwNjUyMExudHNq?=
 =?utf-8?B?Z0dGSWpMaW1BeS9LVnpNdDJRaFZNTXlHK2Z0NHhnK2JTbTRKK3FlU2JLcStz?=
 =?utf-8?B?UUtDMUpiUmFQbjBPZjlVN0pJTjhVdHIwMjdRdmkvaFZCRWJ0eFprRnU1VVR3?=
 =?utf-8?B?TTNnbXArbTlJNUlUbWhLZVF5Sk5RK2lWTHhHMTM3WXIwRG52bHFtOVFlYVcv?=
 =?utf-8?B?dDBKRng0c3pmczQyQlpzbDdZKzZubDFhVEJHRHBPR2RnSnBsbjlNRU0wZUx1?=
 =?utf-8?B?dDJ2bm94clJvQjAvbDFvckdYdFhiaktpbXFUakhZeitnd0ZwQUZmY2lvSXRR?=
 =?utf-8?B?cWQ0RGttSUY3S3Z3YitUaFNwbFZCOUpCZm1aL0ZHbjJBNzJVenJRNTFZVTZS?=
 =?utf-8?B?L2gxdmJiZlRKSkg2ZDVWK2Fmak5YYXYxeU9oYjNyQ1JLQXovMEt2azVzbVJN?=
 =?utf-8?B?K1pHYzVYTW1PUDY0WEluSGFDTjlGZk1XRCtlWHdrU0lLa0N5ZXR0TEx4N1lk?=
 =?utf-8?B?TWhzRDR2Q2c4WGNQRHkxSk9sTW1OVWZSSHpaZk41SXpZSVAxM0o0MWdIOTB1?=
 =?utf-8?B?emJFN0EzNW1HMEdsU3owZjBhL2tCelNieXdsT05zTEJJUk9pZEVHakYxcFha?=
 =?utf-8?B?aS9OcHA1cXMxWHMyakt5YmFNbUNCSEhzeHd3TVhhVHNWcldxOERFWS95dHFM?=
 =?utf-8?B?cnVnblJEdkowU0wzak84eWZTVFFMVk5TRHNEc3A0dXhYTzJrcDFmbWVsU05o?=
 =?utf-8?B?K29vbkJvRThVTDcrQ3UwU0hZN1NqMlhlS3ZraFYrNDhDT1FVNjFGTFFRVjkv?=
 =?utf-8?B?RkpVRjFNd2M5bXVBQjhOR2RjNFIwSGQwOEtLRFMxV1hzL2FMa3MzTFdSQ3dQ?=
 =?utf-8?B?UzNOYnB6Z1orbVB0Q3dhK2crTlFTWVV4QTdxd0tybHdDMjdUTEFDOGRkcHNE?=
 =?utf-8?B?ZnJmclpsZERCMkszMkE5N2ZYYWVWWmx2bHpqZEd6SG9NbVVZSjNmM01VVkly?=
 =?utf-8?B?WUpibGllWTQ4VFJtNnJJTVQ5SlUySVBLaTVIVllZL2h4cjFneWE5YVREcXNB?=
 =?utf-8?B?N2ErWElSSWFtdW1LMmJ4K3JsQUtITjJLMjgyNEFzbzVDUjE5cmRQTngyZXdP?=
 =?utf-8?B?VFVwL2xjanc1S01ta0wxQ3A5blBacVNSMHdVZnJGYnY4Ykp1Y3JKdjVEMG44?=
 =?utf-8?B?MU5IckNKbkZUNzdvaUlIeUZxajkrOVVCUzJzMlY3YUM2Y3V4eE43T0UvK0VM?=
 =?utf-8?B?L2k4M1NDTk9mdWY3R3A0ZDBXVHREVXJTQmJva1V0aU44Q25VaGpiMmk2bTY5?=
 =?utf-8?B?WHNxWkcwcDNxRmhyWnNGSGNWL0ZHRzEydWlSQXJ1VkN1U05mVkR5a1E0K1gz?=
 =?utf-8?B?MVdobVJQR3oweUFtem83WHd2OVI4eFIvRUhES0gyNUY4aVJrZ2p0TmQrUy9L?=
 =?utf-8?B?V2lOOFY3dVd3eCtPM3JEUjMwbE1yRFRocmE2WlEvMjZ0Qk1XaTBkKzh1QU1Z?=
 =?utf-8?B?b1JOajJWNU5WQWhweUx0M2N5VTBoM2kvNWhCSExOV05NUElkdkRScXZTYnYw?=
 =?utf-8?B?bThXbFZWb1NnclY1aVVpQVMwamxpTjBvZVgwOGtVQXVRYXl4VjgyZ3I0VHFs?=
 =?utf-8?B?eWVsUGs3dUViWEJ5eWNxZmEzN1BkNnpPcjcwZUpsdE13TjNCS0xwdWt0K0J3?=
 =?utf-8?B?NFJiTWhvNndjNkg2ODl2bVExLzN1NStnZ2VlY3FjOW1rMU5jR1J1dHoxM2Jt?=
 =?utf-8?B?cTY4OTFvK3VJYkVLdFU1bk9kVUFDWjhzb3Job3lCcWRPS1dZYWRwNFJ0SkNO?=
 =?utf-8?B?RGZQdDhQSTF2TmpteUNJYlRMZnBIU3ZFTjV3cWFVYlFhRDJ2QnI4c2tzaUF5?=
 =?utf-8?B?YW5zbDJONWZUdXEzVmFYR0hqZGpkVjd5cnlVSk9GY01XSmRNb1dkdzNvSThU?=
 =?utf-8?B?WVA0TVp6UHNqNTBpTzBXb2tUOFNVWVRYaTVyYlRCOUxWK0w3WWFkL1VzZjA1?=
 =?utf-8?B?U0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1431300A34188B41B042AD9A91B9244C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763c30f8-6e3b-4f41-b8f6-08ddde551ffc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2025 12:45:34.6204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rsgOEE+xFov+df9nArbsYhyx3n0SNtmDFOO1VW1RHxavXN0GmRi2MMImYdK0RrdSrTJbT2PZXpXgRhfqNyS60I7OZ2HTBRUYs9e8Ucn3WaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7735

DQoNCk9uIDgvMTQvMjUgMTE6MjMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMi4wOC4yMDI1
IDIxOjE3LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBNSVNSQSBDIFJ1bGUgMi4xIHN0
YXRlczogIkEgcHJvamVjdCBzaGFsbCBub3QgY29udGFpbiB1bnJlYWNoYWJsZSBjb2RlLiINCj4+
DQo+PiBGdW5jdGlvbiBgUHJpbnRFcnJNZXNnKGNvbnN0IENIQVIxNiosIEVGSV9TVEFUVVMpYCBp
c24ndCBpbnRlbmRlZCB0byByZXR1cm4NCj4+IGNvbnRyb2wgdG8gaXRzIGNhbGxlci4gQXQgdGhl
IGVuZCwgaXQgY2FsbHMgYGJsZXhpdCgpYCwgd2hpY2gsIGluIHR1cm4sDQo+PiBpbnZva2VzIHRo
ZSBgX19idWlsdGluX3VucmVhY2hhYmxlKClgIGZ1bmN0aW9uLCBtYWtpbmcgc3Vic2VxdWVudCBy
ZXR1cm4NCj4+IHN0YXRlbWVudHMgaW4gYHJlYWRfZmlsZSgpYCB1bnJlYWNoYWJsZToNCj4+DQo+
PiAgICAgIFByaW50RXJyTWVzZyhuYW1lLCByZXQpOw0KPj4gICAgICAvKiBub3QgcmVhY2hlZCAq
Lw0KPj4gICAgICByZXR1cm4gZmFsc2U7DQo+Pg0KPj4gVGhpcyBhbHNvIGNhdXNlcyB1bnJlYWNo
YWJpbGl0eSBvZiB0aGUgY29kZSBtZWFudCB0byBoYW5kbGUgYHJlYWRfZmlsZSgpYA0KPj4gZXJy
b3JzLCBhcyBzZWVuIGluIHRoZXNlIGV4YW1wbGVzOg0KPj4NCj4+IEluIHRoaXMgYmxvY2s6DQo+
PiAgICAgIGlmICggcmVhZF9maWxlKGRpcl9oYW5kbGUsIGZpbGVfbmFtZSwgJmNmZywgTlVMTCkg
KQ0KPj4gICAgICAgICAgYnJlYWs7DQo+PiAgICAgICp0YWlsID0gMDsNCj4+ICAgICAgfQ0KPj4g
ICAgICBpZiAoICF0YWlsICkNCj4+ICAgICAgICAgIGJsZXhpdChMIk5vIGNvbmZpZ3VyYXRpb24g
ZmlsZSBmb3VuZC4iKTsNCj4+DQo+PiBBbmQgaGVyZToNCj4+ICAgICAgZWxzZSBpZiAoICFyZWFk
X2ZpbGUoZGlyX2hhbmRsZSwgY2ZnX2ZpbGVfbmFtZSwgJmNmZywgTlVMTCkgKQ0KPj4gICAgICAg
ICAgYmxleGl0KEwiQ29uZmlndXJhdGlvbiBmaWxlIG5vdCBmb3VuZC4iKTsNCj4+DQo+PiBBbmQg
aGVyZToNCj4+ICAgICAgaWYgKCAhcmVhZF9maWxlKGRpcl9oYW5kbGUsIHMydygmbmFtZSksICZj
ZmcsIE5VTEwpICkNCj4+ICAgICAgew0KPj4gICAgICAgICAgUHJpbnRTdHIoTCJDaGFpbmVkIGNv
bmZpZ3VyYXRpb24gZmlsZSAnIik7DQo+PiAgICAgICAgICBQcmludFN0cihuYW1lLncpOw0KPj4g
ICAgICAgICAgZWZpX2JzLT5GcmVlUG9vbChuYW1lLncpOw0KPj4gICAgICAgICAgYmxleGl0KEwi
J25vdCBmb3VuZC4iKTsNCj4+ICAgICAgfQ0KPj4NCj4+IFRoZSBpc3N1ZSBhcmlzZXMgYmVjYXVz
ZSB3aGVuIGFuIGVycm9yIG9jY3VycyBpbnNpZGUgYHJlYWRfZmlsZSgpYCwgaXQgY2FsbHMNCj4+
IGBQcmludEVyck1lc2coKWAgYW5kIGRvZXMgbm90IHJldHVybiB0byB0aGUgY2FsbGVyLg0KPj4N
Cj4+IFRvIGFkZHJlc3MgdGhpcyB0aGUgZm9sbG93aW5nIGNoYW5nZXMgYXJlIGFwcGxpZWQ6DQo+
PiAxLiBSZW1vdmUgYFByaW50RXJyTWVzZyhuYW1lLCByZXQpO2AgZnJvbSB0aGUgYHJlYWRfZmls
ZSgpYCBmdW5jdGlvbi4NCj4+IDIuIFJlcGxhY2VkIGl0IHdpdGggYFByaW50RXJyKG5hbWUpO2As
IHdoaWNoIHByaW50cyB0aGUgZmlsZSBuYW1lIGFuZCByZXR1cm5zDQo+PiAgICAgY29udHJvbCB0
byB0aGUgY2FsbGVyLg0KPj4gMy4gQ2hhbmdlIHRoZSBgcmVhZF9maWxlKClgIHJldHVybiB0eXBl
IGZyb20gYGJvb2xgIHRvIGBFRklfU1RBVFVTYCwgYWxsb3dpbmcNCj4+ICAgICBmaWxlIG9wZXJh
dGlvbiByZXN1bHQgY29kZXMgdG8gYmUgcmV0dXJuZWQgdG8gdGhlIGNhbGxlci4NCj4+IDQuIFBy
b3Blcmx5IGhhbmRsZSBlcnJvciBjb2RlcyByZXR1cm5lZCBmcm9tIHRoZSBgcmVhZF9maWxlKClg
IGZ1bmN0aW9uIGluIHRoZQ0KPj4gICAgIHJlbGV2YW50IGFyZWFzIG9mIHRoZSBjb2RlLg0KPj4g
NS4gUmVwbGFjZSBgYmxleGl0KClgIGNhbGxzIHdpdGggaW5mb3JtYXRpdmUgZXJyb3IgY29kZXMg
dXNpbmcgYFByaW50RXJyTWVzZygpYA0KPj4gICAgIHdoZXJlIGFwcHJvcHJpYXRlLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IERteXRybyBQcm9rb3BjaHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBh
bS5jb20+DQo+PiAtLS0NCj4+IFRlc3QgQ0kgcGlwZWxpbmU6DQo+PiBodHRwczovL2dpdGxhYi5j
b20veGVuLXByb2plY3QvcGVvcGxlL2RpbWFwcmtwNGsveGVuLy0vcGlwZWxpbmVzLzE5ODA1OTAx
MTgNCj4+IC0tLQ0KPj4gICB4ZW4vY29tbW9uL2VmaS9ib290LmMgfCA1NyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0MCBp
bnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi9lZmkvYm9vdC5jIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jDQo+PiBpbmRleCA1MGZmMWQx
YmQyLi5kZGJhZmIyZjljIDEwMDY0NA0KPj4gLS0tIGEveGVuL2NvbW1vbi9lZmkvYm9vdC5jDQo+
PiArKysgYi94ZW4vY29tbW9uL2VmaS9ib290LmMNCj4+IEBAIC0xMzIsNyArMTMyLDcgQEAgc3Ry
dWN0IGZpbGUgew0KPj4gICAgICAgfTsNCj4+ICAgfTsNCj4+DQo+PiAtc3RhdGljIGJvb2wgcmVh
ZF9maWxlKEVGSV9GSUxFX0hBTkRMRSBkaXJfaGFuZGxlLCBDSEFSMTYgKm5hbWUsDQo+PiArc3Rh
dGljIEVGSV9TVEFUVVMgcmVhZF9maWxlKEVGSV9GSUxFX0hBTkRMRSBkaXJfaGFuZGxlLCBDSEFS
MTYgKm5hbWUsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZmlsZSAqZmlsZSwg
Y29uc3QgY2hhciAqb3B0aW9ucyk7DQo+PiAgIHN0YXRpYyBib29sIHJlYWRfc2VjdGlvbihjb25z
dCBFRklfTE9BREVEX0lNQUdFICppbWFnZSwgY29uc3QgQ0hBUjE2ICpuYW1lLA0KPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGZpbGUgKmZpbGUsIGNvbnN0IGNoYXIgKm9wdGlv
bnMpOw0KPj4gQEAgLTc4Miw3ICs3ODIsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaGFuZGxlX2Zp
bGVfaW5mbyhjb25zdCBDSEFSMTYgKm5hbWUsDQo+PiAgICAgICBlZmlfYXJjaF9oYW5kbGVfbW9k
dWxlKGZpbGUsIG5hbWUsIG9wdGlvbnMpOw0KPj4gICB9DQo+Pg0KPj4gLXN0YXRpYyBib29sIF9f
aW5pdCByZWFkX2ZpbGUoRUZJX0ZJTEVfSEFORExFIGRpcl9oYW5kbGUsIENIQVIxNiAqbmFtZSwN
Cj4+ICtzdGF0aWMgRUZJX1NUQVRVUyBfX2luaXQgcmVhZF9maWxlKEVGSV9GSUxFX0hBTkRMRSBk
aXJfaGFuZGxlLCBDSEFSMTYgKm5hbWUsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IGZpbGUgKmZpbGUsIGNvbnN0IGNoYXIgKm9wdGlvbnMpDQo+PiAgIHsNCj4+ICAg
ICAgIEVGSV9GSUxFX0hBTkRMRSBGaWxlSGFuZGxlID0gTlVMTDsNCj4+IEBAIC03OTEsNyArNzkx
LDcgQEAgc3RhdGljIGJvb2wgX19pbml0IHJlYWRfZmlsZShFRklfRklMRV9IQU5ETEUgZGlyX2hh
bmRsZSwgQ0hBUjE2ICpuYW1lLA0KPj4gICAgICAgY29uc3QgQ0hBUjE2ICp3aGF0ID0gTlVMTDsN
Cj4+DQo+PiAgICAgICBpZiAoICFuYW1lICkNCj4+IC0gICAgICAgIFByaW50RXJyTWVzZyhMIk5v
IGZpbGVuYW1lIiwgRUZJX09VVF9PRl9SRVNPVVJDRVMpOw0KPj4gKyAgICAgICAgcmV0dXJuIEVG
SV9JTlZBTElEX1BBUkFNRVRFUjsNCj4NCj4gV2h5IHRoZSBjaGFuZ2UgaW4gZXJyb3IgY29kZT8g
RUZJX09VVF9PRl9SRVNPVVJDRVMoKSB3YXMgdXNlZCBkZWxpYmVyYXRlbHkgZm9yDQo+IGNhc2Vz
IHdoZXJlIHRoZSByZXN1bHQgb2YgczJ3KCkgaXMgcGFzc2VkIGRpcmVjdGx5IGludG8gaGVyZS4N
Cj4NCj4gQmV0d2VlbiB0aGlzIGh1bmsgYW5kIC4uLg0KPg0KPj4gQEAgLTg0Miw3ICs4NDIsNyBA
QCBzdGF0aWMgYm9vbCBfX2luaXQgcmVhZF9maWxlKEVGSV9GSUxFX0hBTkRMRSBkaXJfaGFuZGxl
LCBDSEFSMTYgKm5hbWUsDQo+Pg0KPj4gICAgICAgZWZpX2FyY2hfZmx1c2hfZGNhY2hlX2FyZWEo
ZmlsZS0+cHRyLCBmaWxlLT5zaXplKTsNCj4+DQo+PiAtICAgIHJldHVybiB0cnVlOw0KPj4gKyAg
ICByZXR1cm4gcmV0Ow0KPj4NCj4+ICAgIGZhaWw6DQo+PiAgICAgICBpZiAoIEZpbGVIYW5kbGUg
KQ0KPg0KPiAuLi4gdGhpcyBvbmUgdGhlcmUncyBhdCBsZWFzdCBvbmUgInJldHVybiBmYWxzZSIg
d2hpY2ggeW91IGxlYXZlIHVudG91Y2hlZCwgdGh1cw0KPiB3cm9uZ2x5IHJlcG9ydGluZyBFRklf
U1VDQ0VTUyBub3cgdG8gdGhlIGNhbGxlci4NCj4NCj4+IEBAIC04NTAsMTAgKzg1MCw5IEBAIHN0
YXRpYyBib29sIF9faW5pdCByZWFkX2ZpbGUoRUZJX0ZJTEVfSEFORExFIGRpcl9oYW5kbGUsIENI
QVIxNiAqbmFtZSwNCj4+DQo+PiAgICAgICBQcmludEVycih3aGF0KTsNCj4+ICAgICAgIFByaW50
RXJyKEwiIGZhaWxlZCBmb3IgIik7DQo+PiAtICAgIFByaW50RXJyTWVzZyhuYW1lLCByZXQpOw0K
Pj4gKyAgICBQcmludEVycihuYW1lKTsNCj4+DQo+PiAtICAgIC8qIG5vdCByZWFjaGVkICovDQo+
PiAtICAgIHJldHVybiBmYWxzZTsNCj4+ICsgICAgcmV0dXJuIHJldDsNCj4+ICAgfQ0KPg0KPiBX
aXRoIHRoZSBjb21tZW50IGhlcmUgLSBwb3NzaWJseSBhZGp1c3RlZCB0byBiZWNvbWUgYSBTQUYg
b25lIC0gYWxsIHNob3VsZCBiZQ0KPiBmaW5lIHdpdGggbm8gb3RoZXIgY2hhbmdlcz8gQmVjYXVz
ZSBvZiB0aGUgb3RoZXIgInJldHVybiBmYWxzZSIgY2FsbGVycyBzaW1wbHkNCj4gY2FuJ3QgYXNz
dW1lIHRoZSBmdW5jdGlvbiB3b3VsZCBuZXZlciBpbmRpY2F0ZSBmYWlsdXJlIGJhY2sgdG8gdGhl
bS4gKE5ldw0KPiAicmV0dXJuIGZhbHNlIiBjb3VsZCBpbiBwcmluY2lwbGUgYWxzbyBhcHBlYXIs
IHdoaWNoIGlzIHdoeSBJIHRoaW5rIHRoZSBiYXNlDQo+IHN0cnVjdHVyZSB3YW50cyBrZWVwaW5n
IGFzIGlzLCBpbmNsdWRpbmcgaW4gdGhlIGNhbGxlcnMuKQ0KPg0KPiBKYW4NCg0KWWVzLCBwcm9i
YWJseSB0aGUgZGV2aWF0aW9uIGlzIGJldHRlciBpbiBzdWNoIGNhc2UsIHRoYXQgY2hhbmdpbmcg
Y29kZQ0KYW5kIGludHJvZHVjaW5nIG5ldyBlcnJvcnMuDQoNCkRteXRyby4NCg==

