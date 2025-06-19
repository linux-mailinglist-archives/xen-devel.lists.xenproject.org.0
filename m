Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843D9AE0B26
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 18:15:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020230.1396613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSHvD-0006eY-JN; Thu, 19 Jun 2025 16:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020230.1396613; Thu, 19 Jun 2025 16:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSHvD-0006ce-GT; Thu, 19 Jun 2025 16:15:27 +0000
Received: by outflank-mailman (input) for mailman id 1020230;
 Thu, 19 Jun 2025 16:15:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRu0=ZC=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uSHvC-0006Y7-Dx
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 16:15:26 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b33afbc-4d28-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 18:15:24 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DB8PR03MB6332.eurprd03.prod.outlook.com (2603:10a6:10:13d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Thu, 19 Jun
 2025 16:15:23 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8835.023; Thu, 19 Jun 2025
 16:15:23 +0000
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
X-Inumbo-ID: 9b33afbc-4d28-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUtleWIMJunxzb2gll2lZX+5YembUD1SLaQeCvJ93Zli0lJ4Tfh2K6Oi7sXKoI6zhZjwPRx/I6azJjQQeDpTooNfr/POLlaLC6XLu8HCkZH90WVdMKNEsATEJMYeeAYNsKWYbPZsOz95nwbtdRH+U/lXA+7WqhXnFQ6WgeWrlfEyZvFoUchJ5QZxlZngZsIirxtG1C8GxzREsAta03ERPsFsmV99T1WggWyifrYrJCCuPPN7s1TcveIObhrFRpDCtypg5Ve7I5khXKU+zIKuX3OhR+1lf+VtQQHCCSR3uddKjpixpW3Xbf7ugQyKkjVha9LmSu95pFQ3dmRKndMKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kI/Nmo844c8oyPMspD+qZrhIsz5Mb9I6X+9a0KxvvF0=;
 b=mW9GEMgwNWNztiadbwtmWIHa/rAnolDf4lz6JnUD0jgauQgDvElekGMg99EBYQojv+zV9OBbVGjVIbOKLtPlBL4d7lnuleUJaCMmTIXBo6zsyod4S10Owz5h3RzuN7CoRLo6dl+TmHjlxNzbFFtrfbL2bbNkAfQCxcoLA16KpwN/15EZeb/KlF5yNsy681STnICeIuubTRUOFLDByNIp8fJ0h98NnxP3EWnKQvXWFWdoUPRCHcM879Cx1tDAV4Pm7LKEBTL/pN5+axpAX5AHDm8L7UxkG73iy3GbK3TtSPeQEHzcdj9qYenUy4FqH1nutOf0NVG/mFqoh56YlMpBFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kI/Nmo844c8oyPMspD+qZrhIsz5Mb9I6X+9a0KxvvF0=;
 b=V68j+A65RORFteYf3olbkXZQIBJM2y7jUVVeBftgY7FGoRnPtuxb7LQBu88C8b+A5IRelczMGe7fTEl66UYFcEKZtFDco5eJ8abJav2JvVqm7S6L7ILLby0hEWTqkiYdRfnO9YwMDVH5mPOqHk5944OAeZ+4O4kxYEsUjt2RhGgRVYqPYSg4A4tTUKwWBMaU/US0QBNAT3K70ii1E+Jgi3VC7e/TJzjZZC0Hy4r3SlwtKDYBh0oWeRepDuF5eBadX1xBH5LTXhkOkEzsbwsWeKCBiSrH3fiRo1fEn4QjPiAxIET6Faot5T6fXwUTgbwCqP/0fsTb4zEZBQWgsW3wbQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Grygorii Strashko <grygorii_strashko@epam.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Juergen Gross
	<jgross@suse.com>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Thread-Topic: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Thread-Index:
 AQHbyNXPHUV4T01ZEEC9Uxm0LaLKHbPgqpIAgA7gjoCAEAkWgIAInBwAgACBoICAAicZAA==
Date: Thu, 19 Jun 2025 16:15:23 +0000
Message-ID: <90d57a47-56e6-4ddb-83fd-c5b5ee612d21@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <318044ae12f13b6b297b3f5fda577a1a6cd143da.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505231114050.147219@ubuntu-linux-20-04-desktop>
 <04B1F737-5E6B-47C0-B2B9-74288C68E68A@arm.com>
 <50ff5d2b-bd17-4833-b497-0dda6f75964a@epam.com>
 <alpine.DEB.2.22.394.2506171625110.1780597@ubuntu-linux-20-04-desktop>
 <538e4b45-74e7-4992-a9e2-7678756f7612@xen.org>
In-Reply-To: <538e4b45-74e7-4992-a9e2-7678756f7612@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DB8PR03MB6332:EE_
x-ms-office365-filtering-correlation-id: 58169c75-ae35-41f3-4ef3-08ddaf4c7e73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bXVocGZxei9YWmoxOTR4WTl4b0hUMWt5eTZCaW56VUU3RmN6bENsUjB3VGRW?=
 =?utf-8?B?VlpYUUxUTWFWWncxRm1OYVk5bUZiMitENHZrMi9nN295azhWNDVnN2NtODNR?=
 =?utf-8?B?RHVTS1I3OWZDWHR5VThRYms5bnZTby8ySHU1bENRZmRRVDI1Mmc2RnRLYU13?=
 =?utf-8?B?V1paQllWNXdSOEVWbzdRaHdFenJFUlNKajUvWWpWWDV0SkJwWWRlQldIZUxt?=
 =?utf-8?B?WmZjQkszdlc5anA4dlV1bFJGRGt3Y1B0TUhSYlB2SzZpSTFGTEo3bWtnVkdu?=
 =?utf-8?B?aUFrTm0rTFh2Tkp4V2g1b2M2Sy9rTHNkcnc2ejc1NkFBaWV0bGMyTW11R056?=
 =?utf-8?B?NjZ3Smx2Vkw4KzZDUHJvYlQrRFB2YmJuWFprRzdoUVFTZGQwaDZaYjZST3I3?=
 =?utf-8?B?YVYveXRCbUdaVnJ2TEFwUW1EaExJbDhxenNVdk5Td2t2QU9zSllhNFNXbndP?=
 =?utf-8?B?S0pqTWcyT1FQakQvRnJsdHRiYXc2Zm5ORzJ2L0JlZkRIWE96bEFya1BlL0w3?=
 =?utf-8?B?Yi9HZDRSWVBBcitneUFTV3NCOEFPOUl4Mng4bUNqNVFmblFVRklJTlpQUHdD?=
 =?utf-8?B?RGFERXpzNGlaNHRNWDN4R2tXNjhUeUNHVHVNV1poWjRwcmFPTitOTmhSOSsz?=
 =?utf-8?B?QUFFNlJwbnJwZEE3SEFBZ3VIb2lReDNYYWVPQmRrVklsWUtFQnMvb29zSHNK?=
 =?utf-8?B?dHVhTTk5TlJwbmdTK0hGWHRZeldMVmZ5NWZ1eUZLK0JJMHZXOFNUNTZDY0Uw?=
 =?utf-8?B?OWw5eXkzTlVsMGRHUU42ZHVaZEVkMGhIRUthWm1NaTJJRzlkYmlZRUtiRGlV?=
 =?utf-8?B?K0k1dUpIb1hnRUdJdENPazB6dWFwNUo4R2R6YjNhWGZFa1FTN0laZjBwTkxE?=
 =?utf-8?B?RXdlVmJBdEhsYkpFK01sTW1xUU92RDJrb1hNYmhtd0YrRHhndm5BSzRSbGow?=
 =?utf-8?B?VmgvQjdlTWs0Uk4wSGVHOHpLNVNEc05IdWoycVNQNjQ1ZHg3R2tmKzY0L0sz?=
 =?utf-8?B?NWQzVFRxYWNoZG1OR09hZDgydjVEUlV0OU14b1paQlY4RXM0c3RoejNPS242?=
 =?utf-8?B?dEpCY0NaNW95STJJZHFoRkhZdlo4QThLcTAwMXhWWXRBODZaZENGSk9leHVC?=
 =?utf-8?B?dEREUDV3ZWxqY0NiSHVvbjcwQUNOZGhBZmxHNTIxMFAwVnNtbGF1WklRYjZl?=
 =?utf-8?B?eDdES1JXTi9rWFVHU3lpYU1hbEZmMWZwZEFxUjV6YTVxbEZoZ1dWcHRTNlVx?=
 =?utf-8?B?d09QNDk2dHZBZFBaRk9ja0dockhBK3hUbTZFTUZxUlJwSHlES2M1NlU5TU9I?=
 =?utf-8?B?RnZGNWFZemdxT3BnNzJPVGREQXRXN2drYVdPZHJCWjB3UEhHb1B6K1gyTkZL?=
 =?utf-8?B?VTJzVVBTbVJoQ2ZPUnloQWNET1ozcThZMlYwRXZJK2o0cDYvbk5EWkMwZHRm?=
 =?utf-8?B?bDA0bTBHSXduSjJPbTk2WUVwd3R2bXAxeDVRWk5KRjBTbWVRME93ZEFURlZ6?=
 =?utf-8?B?ak4xOEd4UDRUR3V5bzlScXUzK21BVlowdlRXYmxkelIrWGdtMXVYa3RmWmNY?=
 =?utf-8?B?emhBSFRiTjRNMUJpSDNSWkJldzVxYWRNOEMxUmZUSUo5V1dpL0h6V0taTXg2?=
 =?utf-8?B?MDlDc3ZnaHJGTGpvUktSUHMwaWlvTk9iN1FGVFJ1R2JmTVhjYy9SQ043MlFY?=
 =?utf-8?B?Qkcvd2JpTmNQM2VjbFdqQllDMzhVcW5CWHIwVUI3K0pHamNobGN2Z0p4NnVp?=
 =?utf-8?B?S3dkeEdCVFVzS0pOY3Q5SGZ4aStwZXhzbVNMM2U1KzMwT2kwQklSUVJTVm1q?=
 =?utf-8?B?UzRzSHJlUTVKdXNKcGJrc25GQ2ZCZGRMRDk0NFVGaFA4R2NwNTRSY0UyeTRv?=
 =?utf-8?B?d2lrbmhMM3U1cmhraWNCd0hDRC8yVm5GNTA0ZHVSbjR6bVZiRk1yaEoycGVN?=
 =?utf-8?B?MzVYL2RCMWdJRmlyS0ZlRHRibk13YTNkUFVGc0l0MEgveldDQ0dzaS9JSnhC?=
 =?utf-8?Q?zbG/jh0jNTFcn1cCFeqOMBG/CyfUWQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2hPVksydk4yTVBZazBJdG1ocGNOSjlpMjM2UDQ2SmRNVk9PTGhodTJLZjYw?=
 =?utf-8?B?cUpmUGM0SW1CQ0lqMzhsbVducXluTFhLbWc5aGxLRWwybXJnMTc3bUI4NkxN?=
 =?utf-8?B?SFNhdW9Db2c4OE5JNVNxL0REN2IxdVJGRXEwaEluRXF1NTdMVk43ZnBCellC?=
 =?utf-8?B?NzkvTGx4d3oyTTBoVi9CelRPRUZGbHNoSExWNSszQWl1N09UbU81M2RoK1hu?=
 =?utf-8?B?R1MxOHN0dVFETXBKb0xKaTlKK0VsTEZnM2d3amljeEN0RnJpVDVTVmFpQ2tT?=
 =?utf-8?B?WUUwb2M5WVpMWUsyRFA2TE5Ma1dKZ09Pd0xyRU1WWlJjdmQ1RWdmdVNPTThi?=
 =?utf-8?B?ekNmYTVha1Yraldxd0xxdG1YbyswTjE2TEw4clU0N0x0cEhTU1RJRUh4WUdk?=
 =?utf-8?B?TzhZRTk5OWJISlU5NHZYNkYyNDUwNHpBUUZCK0tGYmNaejUxNi9sWDNnQXBG?=
 =?utf-8?B?amhQR3E4cWxxV01UM0ZMUkpWZWJQb0c3TXNpRXI0cU9SVDhPaVVnN0FUWWJX?=
 =?utf-8?B?TXJrUE9US1A0WmpkZDFQa1FvZ3hvT0pwTVR6S3NxRWY2ZDAvS3NoemJlL0Jp?=
 =?utf-8?B?YVIweTQwTXJTZWVUVk1qMEFRTy9KSTRDWGdVbzhBcEpTYzFuQ0pNN2ZEUnZK?=
 =?utf-8?B?MkgzeU9pRloyTHUrR3MwNWk2UGYrVXhicDhjSDJnYkhlWDJ5dWxsektISTBq?=
 =?utf-8?B?ZExiT21NTVltKy9vZnA2SlI1aXpqbGJMT2lBNXBSQ3U0UWR3VFJ1czBqd1Yw?=
 =?utf-8?B?UVovakVIcEtHY29tUTlSc01WN09rM3dIVExVdDJwQXp4WGlUcUVBcmxmdHVy?=
 =?utf-8?B?RDlhY0pUQlk1bm5BUTQwQUFIbE10clZqNGdHSnE0MG9OK0lxRTZwN0FiUHRn?=
 =?utf-8?B?L3hRR1pybm1tLzNXR2J6Q0h3MVU2UjNvejVlWUUydHJYZkJKdVkzYkZTM1Fj?=
 =?utf-8?B?ZlhlbUN4T0FsdUtob2JTcUdFZVhCZzZMUm5LUTFxZTVqWTd4d1NIdzBWMU5X?=
 =?utf-8?B?djBDRUxZMzBkYWVZZTNBR1NoeUZveVpyUCt1NDl4RVJYRFB3Q0hrdlUyQnFJ?=
 =?utf-8?B?bW53TDkrTjN1QXEwdnJFRDFYaGRTdXpmWWMvcXhZNzBpTE85RjB5QTNsVlEw?=
 =?utf-8?B?VkZJZjBybnorWk5VQTJ6elBiLzYydkh5YVZCNXVwcFBmem0yaUxBOUY2a1l1?=
 =?utf-8?B?aURrbXJleEFqMnpOUnRyVnZCZzVGelhHdVZ4OUNNWGM1NFU3RmRkTHZFMWJQ?=
 =?utf-8?B?Z2phbndmbDJxUnhlRmJzaGozODl4eXluZzRETTlpeVRVZEpzcHcxUFh2UjFt?=
 =?utf-8?B?MmQ5bzVCbGhzSUU0RHpKNXRnWXNCOWRJMEhVNVpvckE4TFllZCtqVC85Njk1?=
 =?utf-8?B?ajNjQ0ZEaG5UOW1KVHVpNmdnZUlRTWVTVGt1SWhlS0xEZ3J1OG1RYWxORG96?=
 =?utf-8?B?UXduVzJMY3RaYXFyZDBnUzUyZlRKbTZvcDYweTMzNEVxY0NaVGdnZ2FLVDBI?=
 =?utf-8?B?eFBYMURWYXBxWXVHNmoxQWkyeDREcmZkSjF2akQwNjJBMWU1UEJUZmtIWlV4?=
 =?utf-8?B?NHZYWGl2MXpjRU0vY2UzYkl4S0JTZC9xdkVUTVh0Wk9PKzViU3ZVcVJDYkhv?=
 =?utf-8?B?cGt1UEhCTUlnNkNjRmk3dC9aeHlELzlhNGpuMG9ObkdEdFRZcVBUTU1aZ3ZB?=
 =?utf-8?B?VEEvd0xoM3dTU0h5ekxxU29UeC92MDlVK2JaQVVkWEtaa0lWaWFyZWFmNDNO?=
 =?utf-8?B?eVdJSnpLZ2ZqamJGdlVaamlvOEdEcGlIcDJTSDREbmVLU1hLeXBiNFNyNG9y?=
 =?utf-8?B?RHRLRDQ5Ukhmc045aFR6R1VJNzhFdlVGYThaMHluMlN3Y0MwQi9XUzVlbnlQ?=
 =?utf-8?B?VHg1OFM1VDVHczZTaC9hNVRYSGVSSEJaaTRvVGhDb29rU2g1MTE2VnFzOXZa?=
 =?utf-8?B?MmllWktpVXJJRjdzaW9HV0hQTjhOUEU0RGlsS1pHWjRldFFwT01YOGhMRU5r?=
 =?utf-8?B?OU5TNmloVXBiVE5xY0QvNjhOd0U5QXlNM2RVTTcreW5hRGl0NGRGOUNsYmxy?=
 =?utf-8?B?QUdOVCtneW9hd01WeVNTYnVrUUNzazROOHNaZ1M3SGJIVGI4aHJ1cGNIMFAr?=
 =?utf-8?B?SXhOS1dVVzlDTU1yQTk2d0xjWnZYM1RCQ2RZcHk5WldFcFd0c0lLYVdYRmpw?=
 =?utf-8?B?TGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <230546A7EC04AC4ABF0A42DAA97E15B9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58169c75-ae35-41f3-4ef3-08ddaf4c7e73
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 16:15:23.0214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6XAYXgs+G1BI35hz904jcuSY6v0yikuZRvWtD6zz1S5d4HfUTPD3cF8yvVlNb7p3uqkkVXbieLqeyc9b6gjx5pK/QXzK/zZ9DfYVtf7jTzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6332

DQpPbiAxOC8wNi8yMDI1IDEwOjIyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpLA0KPg0KPiBP
biAxOC8wNi8yMDI1IDAwOjM4LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiBPbiBUaHUs
IDEyIEp1biAyMDI1LCBHcnlnb3JpaSBTdHJhc2hrbyB3cm90ZToNCj4+PiBPbiAwMi4wNi4yNSAx
MDoxNywgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+IE9uIHRoZSBvdGhlciBoYW5kLCBp
ZiB3ZSBhbHNvIHdhbnQgdG8gaGFuZGxlIHRoZSBjYXNlIHdoZXJlIHRoZSBTQ01JDQo+Pj4+PiBz
ZXJ2ZXIgY291bGQgYmUgb24gYSBzZXBhcmF0ZSBjby1wcm9jZXNzb3IsIHRoZW4gd2hhdCB0aGlz
IGNvZGUgaXMgDQo+Pj4+PiBkb2luZw0KPj4+Pj4gaXMgbm90IHN1ZmZpY2llbnQgYmVjYXVzZSB3
ZSBhbHNvIG5lZWQgYSBkY2FjaGUgZmx1c2gsIGluIGFkZGl0aW9uIHRvDQo+Pj4+PiB0aGUgRFNC
Lg0KPj4+Pj4NCj4+Pj4+IEJlcnRyYW5kLCBjYW4geW91IGRvdWJsZS1jaGVjaz8NCj4+Pj4NCj4+
Pj4gSWYgd2Ugd2FudCB0byBoYW5kbGUgYSBjYXNlIHdoZXJlIHRoZSBtZW1vcnkgaXMgYWNjZXNz
aWJsZSB0byBhIA0KPj4+PiBjb3Byb2Nlc3Nvcg0KPj4+PiBidXQgdGhlcmUgaXMgbm8gY2FjaGUg
Y29oZXJlbmN5LCB3ZSBuZWVkIHRvIGZsdXNoIHRoZSBkY2FjaGUgDQo+Pj4+IGRlZmluaXRlbHku
DQo+Pj4+DQo+Pj4+IFNlZWluZyB0aGUgYW1vdW50IG9mIGRhdGEgaGVyZSwgSSBkbyBhZ3JlZSB3
aXRoIFN0ZWZhbm8gdGhhdCBpdCANCj4+Pj4gd291bGQgYmUgYQ0KPj4+PiBnb29kDQo+Pj4+IGlk
ZWEgdG8gbWFrZSB0aGUgcHJvdmlzaW9uIHRvIGZsdXNoIHRoZSBkYXRhIGNhY2hlIGluIGFsbCBj
YXNlcy4gDQo+Pj4+IEV2ZW4gaWYgdGhlDQo+Pj4+IGRhdGENCj4+Pj4gaXMgYWNjZXNzZWQgYnkg
YSBzZWN1cmUgcGFydGl0aW9uIG9yIHRoZSBmaXJtd2FyZSBjb2hlcmVudGx5LCANCj4+Pj4gZmx1
c2hpbmcgaW4NCj4+Pj4gYWxsIGNhc2VzDQo+Pj4+IHdvdWxkIGhhdmUgdmVyeSBsaW1pdGVkIHBl
cmZvcm1hbmNlIGltcGFjdCBoZXJlLg0KPj4+Pg0KPj4+PiBUaGVyZSBpcyB0aGUgb3RoZXIgc29s
dXRpb24gdG8gaGF2ZSBzb21lIGtpbmQgb2YgcGFyYW1ldGVyIHRvIHNheSANCj4+Pj4gaWYgdGhl
DQo+Pj4+IGFjY2Vzc29yDQo+Pj4+IGhhcyBjb2hlcmVudCBjYWNoZSBhY2Nlc3MgYnV0IEkgZG8g
bm90IHRoaW5rIHRoZSBwZXJmb3JtYW5jZSBpbXBhY3QgDQo+Pj4+IGhlcmUNCj4+Pj4gd291bGQN
Cj4+Pj4ganVzdGlmeSBzdWNoIGEgY29tcGxleGl0eS4NCj4+Pj4NCj4+PiBUaGUgU0NNSSBzaG1l
bSBleHBlY3RlZCB0byBiZSBtYXBwZWQgYXMgTVRfTk9OX0NBQ0hFQUJMRSBpbiBhbGwgY2FzZXMu
DQo+DQo+IEkgY2FuJ3QgZmluZCBNVF9OT05fQ0FDSEVBQkxFIGFueXdoZXJlIGluIFhlbiBvciBM
aW51eC4gTXkgDQo+IGludGVycHJldGF0aW9uIGlzIHRoYXQgdGhlIG1lbW9yeSBhdHRyaWJ1dGUg
d291bGQgYmUgbm9ybWFsIG1lbW9yeSBub24gDQo+IGNhY2hlYWJsZS4gSG93ZXZlciwgdGhpcyBk
b2Vzbid0IGFkZCB1cCB3aXRoIC4uLg0KPg0KU29ycnkgZm9yIHRoZSBjb25mdXNpb24uIFRoaXMg
ZGVmaW5lIHdhcyB0YWtlbiBmcm9tIFRGLUEgYW5kIGl0IGlzIHRoZSANCnNhbWUgYXMgWGVuIE1U
X05PUk1BTF9OQy4NCg0KVGhlIG1haW4gaWRlYSB3YXMgdG8gbWVudGlvbiB0aGF0IG1lbW9yeSBp
cyBub25fY2FjaGFibGUuDQoNCj4+PiBUaGUgTGludXggZG9lcyBkZXZtX2lvcmVtYXAoKSAtPiBp
b3JlbWFwKCkgLT4NCj4+PiAoQVJNNjQpwqAgX19pb3JlbWFwKChhZGRyKSwgKHNpemUpLCBfX3Bn
cHJvdChQUk9UX0RFVklDRV9uR25SRSkpDQo+DQo+IC4uLiB0aGlzIGxpbmUuIFRoaXMgaXMgZGV2
aWNlIG5HblJFIHdoaWNoIGlzIGEgbG90IG1vcmUgcmVzdHJpY3RpdmUgDQo+IChmb3IgaW5zdGFu
Y2UgaXQgZG9lc24ndCBhbGxvdyB1bmFsaWduZWQgYWNjZXNzKS4NCj4NCkluIFhlbiBzY21pIG1l
bW9yeSBpcyBtYXBwZWQgdXNpbmcgaW9yZW1hcF9ub2NhY2hlIHdoaWNoIGlzIG1hcHBlZCBhcyAN
Ck1UX0RFVklDRV9uR25SRSAoc2FtZSBhcyBsaW51eCkuDQoNCkluIFRGLUEgU0NNSSBzaGFyZWQg
bWVtb3J5IGlzIG1hcHBlZCBhcyBNVF9ERVZJQ0UgKHdoaWNoIGlzIA0KbkduUkU6wqBNQUlSX0RF
Vl9uR25SRSkuDQoNCkFnYWluLCBzb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbi4NCg0KPj4+DQo+Pj4g
VGhlcmUgaXMgYWxzbyBub3RlIGluIGRvY3M6DQo+Pj4gIistIHNobWVtOiBzaGFyZWQgbWVtb3J5
IGZvciBtZXNzYWdlcyB0cmFuc2ZlciwgKipYZW4gcGFnZSBhbGlnbmVkKiogDQo+Pj4gd2l0aA0K
Pj4+IG1hcHBpbmdgYHAybV9tbWlvX2RpcmVjdF9uY2BgLiINCj4+Pg0KPj4+IEluIHRoZSBjYXNl
IG9mIFNDUCAtIHRoZSBTQ01JIHNobWVtIGNhbiBiZSBhY3R1YWxseSBiZSBpbiBTUkFNLg0KPj4+
DQo+Pj4gU28sIGFyZSB5b3Ugc3VyZSBjYWNoZSBtYW5pcHVsYXRpb25zIGFyZSByZXF1aXJlZCBo
ZXJlPw0KPj4NCj4+IE5vLCBpZiB0aGUgbWVtb3J5IGlzIG1hcHBlZCBhcyB1bmNhY2hlYWJsZSBl
dmVyeXdoZXJlIHRoZW4gdGhlIGNhY2hlDQo+PiBtYW5pcHVsYXRpb25zIGFyZSBub3QgbmVlZGVk
LiBIb3dldmVyLCB3ZSBwcm9iYWJseSBzdGlsbCBuZWVkIGEgZHNiLg0KPj4NCj4+IEkgdW5kZXJz
dGFuZCBub3cgd2h5IHRoZXkgZGVjaWRlZCB0byB1c2UgX19tZW1jcHlfZnJvbWlvIGluIExpbnV4
OiBpdCBpcw0KPj4gbm90IE1NSU8gYnV0IHRoZXkgbmVlZGVkIGEgbWVtY3B5IGZvbGxvd2VkIGJ5
IERTQiwgc28gdGhleSBkZWNpZGVkIHRvDQo+PiByZXVzZSB0aGUgZXhpc3RpbmcgTU1JTyBmdW5j
dGlvbnMgYWx0aG91Z2ggdGhlIGJ1ZmZlciBpcyBub3QgTU1JTy4NCj4NCj4gRnJvbSBteSB1bmRl
cnN0YW5kaW5nLCBtZW1jcHlfZnJvbWlvKCkgaXMgbm90IGp1c3QgYSBtZW1wY3koKSArIGRzYi4g
DQo+IEl0IGFsc28gZ3VhcmFudGVlcyB0aGUgYWNjZXNzIHdpbGwgYmUgYWxpZ25lZCAodGhpcyBp
cyBub3QgZ3VhcmFudGVlIA0KPiBieSBvdXIgbWVtY3B5KCkpLg0KPg0KIEZyb20gbXkgdW5kZXJz
dGFuZGluZyBMaW51eCB1c2luZyBtZW1jcHlfZnJvbWlvKCkgYmVjYXVzZSBtZW1jcHkgDQpmdW5j
dGlvbiBpcyBoaWdobHkNCg0Kb3B0aW1pemVkIGluIGxpbnV4IGFuZCB3aWxsIHByb2R1Y2UgZXhj
ZXB0aW9uLGFuZCBsb29raW5nIGludG8gdGhlIA0KbWVtY3B5IGltcGxlbWVudGF0aW9uDQoNCmlu
IFhlbiAoeGVuL2FyY2gvYXJtL2FybTY0L2xpYi9tZW1jcHkuUykgSSdtIG5vdCBzdXJlIGlmIGl0
IGNhbiBiZSB1c2VkIA0KaW5zdGVhZCBvZiBtZW1jcHlfZnJvbWlvLiBDb3VsZCB5b3UgcGxlYXNl
IGFkdmlzZSBob3cgdG8gcHJvY2VlZD8NCg0KDQo+IE5vdyB0aGUgcXVlc3Rpb24gaXMgd2h5IGRv
ZXMgTGludXggbWFwIHRoZSByZWdpb24gRGV2aWNlIG5HblJFIGJ1dCB3ZSANCj4gYXJlIG1hcHBp
bmcgbm9uLWNhY2hlYWJsZT8NCj4NCj4gQ2hlZXJzLA0KPg0KQWdhaW4gc29ycnkgZm9yIHRoZSBj
b25mdXNpb24sIHdlJ3JlIG1hcHBpbmcgYXMgTVRfREVWSUNFX25HblJFIGluIFhlbiANCihwbGVh
c2Ugc2VlIGFib3ZlKS4=

