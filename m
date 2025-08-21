Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCDBB2F26B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 10:39:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088179.1445994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up0pM-00022d-Uv; Thu, 21 Aug 2025 08:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088179.1445994; Thu, 21 Aug 2025 08:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up0pM-00020S-SI; Thu, 21 Aug 2025 08:39:20 +0000
Received: by outflank-mailman (input) for mailman id 1088179;
 Thu, 21 Aug 2025 08:39:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m+ul=3B=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1up0pK-00020H-Ug
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 08:39:19 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50d5d544-7e6a-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 10:39:13 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB9096.eurprd03.prod.outlook.com
 (2603:10a6:20b:5b2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 21 Aug
 2025 08:39:11 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 08:39:10 +0000
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
X-Inumbo-ID: 50d5d544-7e6a-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFTU1aWQJNrEN6cuDPkeCdiLBbbcZ5nn0UFoZU2C6mUoVuFWdA8Rv5vLeP/r0tr3b4lsUQfHS+RVER9lKlyGhuN07+JUMHnKwv904HbtO+didbMMLDy8ov+6lykgF581eik1L+khTDpiomeQ0U7Wud6yHLFjxkdYulvFEQxgfHdo/8IiZyG7HBNNnz3LEvW13Ez5kYTyZDtegp2rn55DxZnukaz+DGDcd05AgSDdIE/vfmxFxEiIfOCFMJ9d8jSOkdInAs15A5y9PzXLL5GIBDNbvxs48yIsbgGEu3zR5dpFruAFx/xTJgpCPaU8wPnJG9anS5Ay7NM63rmUMeqQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5BwtJ6fvGCjGfbUbzoxAy19zus59Zz3J+RONBmP4C8=;
 b=C/17HO7sU9bsNlYjBnIIfY0O2frJE8gtq+dqK0Dfb5eLgxbxCXvtlY+JL8ys6SVXnbfo4p4iF71Ggywb36H8RNa3UGyoSmTuByu5aFCjj4I3SBwa5LO1UrD3HJibhU3piJofMpDjEfcxCoLm+7Aj9NS88OzzcuNeJ0MAsEXCdk2JpAE5y4BGfKT11Dom/WnwZtn9v0werBFBa69yllUQ7L0jqAhwT2FBhR9H2Jlh1rk6U2XtxYrToEtqZL52lnNoI3ZkrJKqXB9FkGbeUL2ewlKDzL7CT7g8DM+4uokY9HUs+kAWwDoERs8HwR/OeKgpVvDUlPWFz2WpYxeZkO+cfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5BwtJ6fvGCjGfbUbzoxAy19zus59Zz3J+RONBmP4C8=;
 b=jdTzGqD39hazG/2QXe2NemLjzf/JdicGvrcudNCCqZ/mq9Tqqblo3pde/cpkBf1FaDzAPipR94ZsYq1LA7UM9a2ueH0GCVEJ5a27I/MfWzNh2eaQ15Q/ijtqsWcSJwMFvrsEBM2t48ebgeIfs7zHLbvQsZQZ1cEstQeM4JBOUPi1l+fE1dkSxB/yDmwujH1djJud41ZEYfNMk/Er+TM1xxGCUPOTWRbm0/+YuoKywJSh09moCCVJ6bNR87IPo2YvWo4P4mizviSlZjZ4ZKce2j3aUwrx3KD9yeoPFnM3gtHwfCwGAh2terdI63EH30JX+uaoWTMgAt74/LkT+DNk/g==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/3] pci/rcar: implement OSID configuration for Renesas
 RCar Gen4 PCIe host
Thread-Topic: [PATCH v2 2/3] pci/rcar: implement OSID configuration for
 Renesas RCar Gen4 PCIe host
Thread-Index: AQHcEnVb4pd/F3Rt1ky19lQedFCtvLRsyTSA
Date: Thu, 21 Aug 2025 08:39:10 +0000
Message-ID: <29855e39-9af5-4d26-beaf-c6a4264a71aa@epam.com>
References: <312c4802-0c15-4d2b-a98c-13d1ed75bcaa@suse.com>
In-Reply-To: <312c4802-0c15-4d2b-a98c-13d1ed75bcaa@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB9096:EE_
x-ms-office365-filtering-correlation-id: 61f58b45-7a01-44d6-03c8-08dde08e331b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SGxLV1FCeEJkM2I0SXJ4VXhhOEJSR2VkckY3N0sxS3NuTGVoeXlYTEVsZzFw?=
 =?utf-8?B?NFlYMTBXa1JmOFRIUzN0RTE4VEZnczJtakFkbXNYRDB3cDNabG5Ob1VJNTN3?=
 =?utf-8?B?Vm0xN0U0ck9xQzhlNjNoOHd1RHZSR215emxORndHNGdDOXUyNHJHQ1A0RVVL?=
 =?utf-8?B?RWRhT1F1SzlRajlBbVFmM3kwNjVLbkFaOWIzSXljQW1GUms2b1YzYWRSS1Zz?=
 =?utf-8?B?OU16a0VWVURFaUc2RWFZWENBeUZXeU1QTmNIYWh1US9jODF5aGExanZ6cjF3?=
 =?utf-8?B?V3MxbnEwZzZWcVlFc1RJN3ZQeWVQcXQydE5HSFgvUGIzVlZPWDBSVDBOSjRM?=
 =?utf-8?B?WGdrSnhVRUtWWWdlS0lpaU9XOTFwQ1drQ0lGSXI1NFNnQmNBMk1oYVpOYm41?=
 =?utf-8?B?L2pKOGg4SjlNR2l5M09IZjBWZVVtZ2lTV3h4Z0IwbTNGaVpqbFNQSjdSbnJK?=
 =?utf-8?B?S3A2cHZ3ZlUzZ1JrR1U0NjVoeWVzN25sTis5ZGZPRnVlQW9LNkcxUTlKeDJj?=
 =?utf-8?B?bmdtMUx5ajFsOG1qb0tTQkFaRDg5cTJvOFVhdDBZb05zVUFCc25DU3JWVG9Y?=
 =?utf-8?B?djhpcUVobzdyVE9MY0lRc1M1K0dNei9NckRjUDFOSWtEVnFUeG81YlVXcndR?=
 =?utf-8?B?aVpkcXljZUxLT1NJMURHZ3l1RGttQ3UyUGd0VHRIYmViZWZEMHZCbzZkUFFo?=
 =?utf-8?B?OGx0dVlYd2w5M1g1MHMvVU9MRjNVT09oM3JTcWVzckRYUG41RTc2Q0EzUDFp?=
 =?utf-8?B?aS8waWI5MEovOEdTNG9TN3N0dW4wT2ZVWTlQc0x2VEZDSEZoWHFubkl1aGNt?=
 =?utf-8?B?bi9LOTdGdFlYQWJRaGN4U2MxMEpGbjlvaXN0aXVNOElGVnVFU3p5bTIzRG5s?=
 =?utf-8?B?Ti82bm5mUE4rdnVpR2orUTF0T0RGckVpQjRneXlpanhJNnJkU3c0cHBrU3Nk?=
 =?utf-8?B?em9LWG1FQy9lZUNtb2RyZUNmTnBnWHdxY3ZlcWNhTy9oN2FOQzZ2dnVvRzZk?=
 =?utf-8?B?b2NrZzFmL2V6ZUpKMTFwRTZSaG92V2YvQ2o2bWNvcTl1YzRZRHFMbkRpZEhO?=
 =?utf-8?B?d250K0hTZWRIUURCMzA3OEhvclAwdGVGbzRub1pFcnRJK09SZ0o5d0R2MWk4?=
 =?utf-8?B?MTk5YitzOWh2Q25HU2t3aVVwYmRkVUQxQkw0MitzbzlLcFNDdlJZLzNEaXd6?=
 =?utf-8?B?N2JxSldUM2xzNFZlZEQ1dVpsMUNVT2tqV3lmQk9KR1MrYXlndklRUHE4bktF?=
 =?utf-8?B?djdHYUxzQ2NFbDJIcHE2R3NBOFBxTHZyMVUxZnJsQ2hIaUorVTdtdmpKckRt?=
 =?utf-8?B?VGdjdVlWdE5yVUxEbGFLK3FJWFZuRk54cmZrbnFUVlVPTkQ4YXhpOVJweVFt?=
 =?utf-8?B?cUc4NmdjdDNaL1JQYS9Bb2hnclB1Wk51c0twcmlxenZUenpFY2VOcEtoclJK?=
 =?utf-8?B?b1Z3YkFJM1ZzN0tHWWpOdm1SYU5zWWM1S3BacnBTQWlYV2dwSUsxUWNrSi8w?=
 =?utf-8?B?VksxeWxHOVhOR2lWM2JoM2VWd25LSGhLV0RyRXpNVHZrR1B0czI5UTJqV2pW?=
 =?utf-8?B?TUxENk11cU9HQjg2MTJZcmtHWlRySDlPNWtJY1RpSjZXbkI3S0IwejAzU29y?=
 =?utf-8?B?QXVlZ2laamJQYUIxVEgzK3lRdG5ScUl0UXhmUm1pc1VldTdEWG5pNGpGcmEw?=
 =?utf-8?B?bFBLdWMxWHVBQ3IzVXRKZWdtaVNaL3BVMWNKVDM5RW9Sd3hPUUdDcnJ0YXdM?=
 =?utf-8?B?cDBGYnA5M0E2aGJxRnp0VzREdHRycEcrNVg1c2NRSWVLdktlN3I2UHhlRzNq?=
 =?utf-8?B?Z0NsU3N5TzVsVCtqVmNHWlJjaVYzM1NYM1NxWG1RVVJyQXEwZGo3VDNqMThy?=
 =?utf-8?B?b2RIM2h6REdMZXpPUmhCV3k0VFptdFBrUGdjMVJsRGJUdEg5V3llakluS2c5?=
 =?utf-8?B?WmVLRzhjeFJEYlF5Z1dtSFBIQ29TaEZYaHV0WTdoMmY1cU96QjhDR1JFaERU?=
 =?utf-8?Q?+8Y9A3HxRjZbdZcnBWOWsOxZdDwhn4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VFFPSlFSbjgrbFU2dTVlN3Vqblh1ZnNHK3NudGhQVVRNcFFKY2xJU0hrcmgy?=
 =?utf-8?B?NGZjdnVDcHFqZHRBbGFBTFVBaXJXbmJzL3A1U29uQWh4SkI3T2d3cExETmNG?=
 =?utf-8?B?eDk2STRrME81TWIvYXNxTnpYY2NaUUxTWkZGTWF0a3BWaGQwYms2TTZreVhl?=
 =?utf-8?B?cXJoaXJ1R3F1dVNSZHVBbFY1S3YwTGdJWDlvRlRucWZNcExweFFmTUl5bWYv?=
 =?utf-8?B?QVM3TzlEcTh0eXhVejdldG1yS0RpWk9IUVI1cGVIaWhkaHlOc1RFVmNUWWJD?=
 =?utf-8?B?ZmtsUzNtQkxKb3pzNGpvYTBxWUNmVi9CeDFKaEZnbkJQczZUaHVBZzd3Q0hj?=
 =?utf-8?B?TFl6cmZjcitVWGZnUDFmNnozUzZoTldUSDBqNHVUa1MxVDFtallUclRmcStz?=
 =?utf-8?B?UWk1V2V5MDFqajBWRmVjbmlQODJTWXVVeDJKL1crY2V2YnlOTjNZU1dJMitW?=
 =?utf-8?B?c2FWR2hmZk13b0dKNkN2YmxWWjZTTmdCRUxqald4SFRCSnkzUUlwWHBxVXJO?=
 =?utf-8?B?NjRxN1RPM3pXeVlITkpZcm5lYnRicGpzanZqek56Wko0NmN1L3pCSlRTQ0Y3?=
 =?utf-8?B?NTVqbmZxQ2pNQXNRMjVuY2VyOU1BTGwxREs1TDdmZVhPdHJib0JUWkdNWmFE?=
 =?utf-8?B?NWxkMHV5a1E5WkV1ekdxQjdVNzBvTXVLbTNUNGMwN0lhalJXZnl0dUkzZ3Jt?=
 =?utf-8?B?dm1VS09qeU9nWldibTloejcrRVRDYlU1VXplcWkzZmNMSU5xTXBzd2ZzN05s?=
 =?utf-8?B?eS81cFNNSWZWOFVmVk9TK2pzdlJrM3NxRTZNRTAzYVJ5ak9lZVdtTUpuV2d2?=
 =?utf-8?B?ajBXcEtiWkhtcUM0R3dHTjF5VTJvS0paV1gycEovZU5CbTVSckJUT1JVRjFy?=
 =?utf-8?B?UXhhNzJ1ZmxzTll2aDM4b3Q5TEx2VEtIdm9RY1lXT0pFMlJZc1FzeUxYUjZY?=
 =?utf-8?B?dG5qc3hIQVVKdVRvSThOUjE5M2VhdkRDSE9BOFVGcUY1eXFlQXJlcTduSkpW?=
 =?utf-8?B?UUNpRTBEZ1BaVG04NFN6enZmc3FJQnVVQnU0YTYySkVjMk5OWDIrNWR5TGU5?=
 =?utf-8?B?WU1UY0FNM0xTMmk0Mk9pUlo5amIyK1ZCRUFqOWsvQkRvVkpzaytIOW5jSStN?=
 =?utf-8?B?bmppL0N1WTRIcUF2L3RKUlJvc1EzZlZGdHgxYjNpSmp2STlPb0daR0wxU09l?=
 =?utf-8?B?Q2lWNjZueXBxZHJIT0FXdmlkNDErRzNlaFJ5V1JSRDBPNDl1a1JjUlFPbXJt?=
 =?utf-8?B?SEp3SllFbDFnMU9VUnl3RXg1UWljSnhNeUZ1WXBkRkpteFMxbUdIRk1qNDUy?=
 =?utf-8?B?RVpYdy9abk13dGlYOUE0Yzh5RklvZVFPNVMwRE50NStzajdwTmpzTlVZdnFB?=
 =?utf-8?B?QzBVd3NNcWUrRkF1eUg1dmZWT1pGNmI0OExOUHdSaHJzajh3NW9NRVVDZFJX?=
 =?utf-8?B?eDZFWjYvWldBRkcwTDB5VzJDVXRObDQ5UlZUMGhFaXZvL1NxTjE2K2Njc1Rm?=
 =?utf-8?B?TkhtN2JFV204M0JpWE16OWJiRkdsV1RtRWROREdmK0VBaXpsdURubXk4RjBW?=
 =?utf-8?B?TTRiaE90VEJ0azgrVk1LdThtak1UMFZ4VlV2YzYxTDF5Z29KR0RxSER3Ylli?=
 =?utf-8?B?VFNZNURoMmRPakxoOWxlSERaVEgxZXZ0MUY4aktNVGJTMTBjVHVQL0VZUm5p?=
 =?utf-8?B?RWdmSFZnOHJmb3BhSnpFRTZYeVZGTVl3VkpxbTU1cmRJelhhY2NpZDNZL01k?=
 =?utf-8?B?Wkh0a2NMazhuZGNCVXByb3hXbCtEMW1VaHJSK0pMbnpDRThCL3cyRGd2dXdm?=
 =?utf-8?B?YVJUK0p2ZDYrdmxMRUd0S1h1OWM5dDltRnZmTlQvc2Fwbmk5aXBxSEFlTjZM?=
 =?utf-8?B?ck8zT3lXVUNlaUtGZG9uQ2hMQlBPWDNqaFZLeG0rcGZPMmRiT1hrSk4rUnF2?=
 =?utf-8?B?NDVqd1Y1OXZnQXBEZFZZN1ltc0dEZXRjYjBPcXFuYWVKKzVvdFkrQ24yL01a?=
 =?utf-8?B?UTZEaitScDRpYmhKVmhucFV6V0RIVzlzYm5zcW5mSGVTNFl3WW9YYitUTlBx?=
 =?utf-8?B?M3F1cU1uMkZBTjFKN0IwRkRuRVE2eUVzczNOdWI3TEdCZmtJemYwakd3a0hi?=
 =?utf-8?B?R1FlS2kvVEV5UVQrNWRjY3JVY1J6b1VNZHkvMFVFSlA1SGx0UTBEc3BicDJj?=
 =?utf-8?B?clE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2C95BA9EA53774CB493E12A5CD97BEC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f58b45-7a01-44d6-03c8-08dde08e331b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 08:39:10.3247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UyPkzu8uPysntDoBj21yW53aEUkgiTSe7GjYuTQ2ms0f71a/3tkr+mMWBA7EJFQGdZOyefijX2VTLbfkts6OkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9096

T24gMjEuMDguMjUgMTE6MjYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiAoc29ycnksIG9yaWdpbmFs
IHBhdGNoIGFscmVhZHkgZ29uZSBmcm9tIG15IG1haWxib3gpDQo+IA0KPiBUaGlzIGxvb2tzIHRv
IGhhdmUgaW50cm9kdWNlZCBhIG5ldyByYW5kY29uZmlnIGZhaWx1cmUsIGFzIHBlciBDSSBbMV06
DQo+IA0KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBt
bXUtdm1zYS5jOjU0Og0KPiAuL2luY2x1ZGUvLi4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LXJjYXI0
Lmg6NzozNzogZXJyb3I6ICdzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlJyBkZWNsYXJlZCBpbnNpZGUg
cGFyYW1ldGVyIGxpc3Qgd2lsbCBub3QgYmUgdmlzaWJsZSBvdXRzaWRlIG9mIHRoaXMgZGVmaW5p
dGlvbiBvciBkZWNsYXJhdGlvbiBbLVdlcnJvcl0NCj4gICAgICA3IHwgdm9pZCByY2FyNF9wY2ll
X29zaWRfYmRmX3NldChzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2UsDQo+ICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fg0KPiAu
L2luY2x1ZGUvLi4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LXJjYXI0Lmg6OTozOTogZXJyb3I6ICdz
dHJ1Y3QgcGNpX2hvc3RfYnJpZGdlJyBkZWNsYXJlZCBpbnNpZGUgcGFyYW1ldGVyIGxpc3Qgd2ls
bCBub3QgYmUgdmlzaWJsZSBvdXRzaWRlIG9mIHRoaXMgZGVmaW5pdGlvbiBvciBkZWNsYXJhdGlv
biBbLVdlcnJvcl0NCj4gICAgICA5IHwgdm9pZCByY2FyNF9wY2llX29zaWRfYmRmX2NsZWFyKHN0
cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSwNCj4gICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn4NCj4gLi9pbmNsdWRlLy4uL2Fy
Y2gvYXJtL3BjaS9wY2ktaG9zdC1yY2FyNC5oOjExOjM2OiBlcnJvcjogJ3N0cnVjdCBwY2lfaG9z
dF9icmlkZ2UnIGRlY2xhcmVkIGluc2lkZSBwYXJhbWV0ZXIgbGlzdCB3aWxsIG5vdCBiZSB2aXNp
YmxlIG91dHNpZGUgb2YgdGhpcyBkZWZpbml0aW9uIG9yIGRlY2xhcmF0aW9uIFstV2Vycm9yXQ0K
PiAgICAgMTEgfCB2b2lkIHJjYXI0X3BjaWVfYmRmX21za19zZXQoc3RydWN0IHBjaV9ob3N0X2Jy
aWRnZSAqYnJpZGdlLCB1bnNpZ25lZCBpbnQgcmVnX2lkLA0KPiAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fg0KPiAuL2luY2x1ZGUvLi4v
YXJjaC9hcm0vcGNpL3BjaS1ob3N0LXJjYXI0Lmg6MTM6Mzg6IGVycm9yOiAnc3RydWN0IHBjaV9o
b3N0X2JyaWRnZScgZGVjbGFyZWQgaW5zaWRlIHBhcmFtZXRlciBsaXN0IHdpbGwgbm90IGJlIHZp
c2libGUgb3V0c2lkZSBvZiB0aGlzIGRlZmluaXRpb24gb3IgZGVjbGFyYXRpb24gWy1XZXJyb3Jd
DQo+ICAgICAxMyB8IGludCByY2FyNF9wY2llX29zaWRfcmVnX2FsbG9jKHN0cnVjdCBwY2lfaG9z
dF9icmlkZ2UgKmJyaWRnZSk7DQo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn4NCj4gLi9pbmNsdWRlLy4uL2FyY2gvYXJtL3BjaS9w
Y2ktaG9zdC1yY2FyNC5oOjE0OjM4OiBlcnJvcjogJ3N0cnVjdCBwY2lfaG9zdF9icmlkZ2UnIGRl
Y2xhcmVkIGluc2lkZSBwYXJhbWV0ZXIgbGlzdCB3aWxsIG5vdCBiZSB2aXNpYmxlIG91dHNpZGUg
b2YgdGhpcyBkZWZpbml0aW9uIG9yIGRlY2xhcmF0aW9uIFstV2Vycm9yXQ0KPiAgICAgMTQgfCB2
b2lkIHJjYXI0X3BjaWVfb3NpZF9yZWdfZnJlZShzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlk
Z2UsDQo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn4NCj4gLi9pbmNsdWRlLy4uL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1yY2FyNC5o
OjE2OjM4OiBlcnJvcjogJ3N0cnVjdCBwY2lfaG9zdF9icmlkZ2UnIGRlY2xhcmVkIGluc2lkZSBw
YXJhbWV0ZXIgbGlzdCB3aWxsIG5vdCBiZSB2aXNpYmxlIG91dHNpZGUgb2YgdGhpcyBkZWZpbml0
aW9uIG9yIGRlY2xhcmF0aW9uIFstV2Vycm9yXQ0KPiAgICAgMTYgfCBpbnQgcmNhcjRfcGNpZV9v
c2lkX3JlZ3NfaW5pdChzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2UpOw0KPiAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+DQo+
IA0KPiBXZSBlaXRoZXIgbmVlZCBhIHF1aWNrIGNvcnJlY3Rpb24sIG9yIHRoaXMgbWF5IG5lZWQg
cmV2ZXJ0aW5nLg0KPiANCj4gSmFuDQo+IA0KPiBbMV0gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1w
cm9qZWN0L2hhcmR3YXJlL3hlbi8tL2pvYnMvMTEwODcyMzMyMjcNCg0KSSB3aWxsIHRha2UgYSBs
b29rIGludG8gdGhpcywgdGhhbmtzIGZvciBwb2ludGluZyBpdCBvdXQNCg0KLS0gDQpNeWt5dGE=

