Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFD2BE9202
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 16:15:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145221.1478324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9lEP-0007Cz-LC; Fri, 17 Oct 2025 14:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145221.1478324; Fri, 17 Oct 2025 14:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9lEP-0007At-IH; Fri, 17 Oct 2025 14:14:57 +0000
Received: by outflank-mailman (input) for mailman id 1145221;
 Fri, 17 Oct 2025 14:14:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rDIu=42=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v9lEN-0007Ak-H2
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 14:14:55 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5e64b7a-ab63-11f0-980a-7dc792cee155;
 Fri, 17 Oct 2025 16:14:53 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DS0PR03MB8200.namprd03.prod.outlook.com (2603:10b6:8:293::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 14:14:50 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 14:14:50 +0000
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
X-Inumbo-ID: a5e64b7a-ab63-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cvke+1iwVeq2SVODEsoXdlgtn6EOmFNsxeNMlQlyOxl8IwTqiIlpSFzTd9y7o+Y39YeV1WjSyApHdII5/SwboYO6SQwtYF21/x8qKqgW2fPeIlIKzL4iKexE0S61EkV4OuE97urEqEgtrROR8dPisQZS/oOuOLrJ3+ZwTqMkrUq7cdo9oLWs3XaSsxSBb3pyYMsd+RNcFlDRgFD00BXk6AGRoKWDXMacN87dE7uMNN3u1rAh+xSK6igYBShN3L/f7iP6FG4x9YFYTSIXtDM2kKjOG99MQqw5S1Drvy7OcmYvSlr/2fqHcBOiVt8wJwaWaqeceidw8t6hzlphWh9O9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gQj1pMsmb7+ZVEz8JVRpOUrAauqwu3sRsy1uxzpjAw=;
 b=FF1JorMKLzR9XODvpoyysiCsw1ja4vTLGNhuukajlSlAy9ISQO7TJfSFxFVYhEa1Zdw4zdEhxoi8stZhRGYFMtYZsRwzA4YB+DAfO4HWSgdGPPOTD2TFKrq9gXZtirPnv5iDA1i3YKCxH8qJlJ5X8tvxnrlUXRRxPQC+7d7ENgRPToKX+zmocO9/w1GYEosBAw/QcoIywR2pVzkq2Dv4mWayS9xKMaAcHI4BRVNGSkGD/IFPuP/xLS5Jjj0E69JwFxCVMUWZkPjbxo5MZrC7Abd4XwdAZQv36S/ykoTWtHAg13gjy7dZdBF2yy15zTdc0uyLBUGrW8XrwauyT5pKPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gQj1pMsmb7+ZVEz8JVRpOUrAauqwu3sRsy1uxzpjAw=;
 b=SvIxsEG69gO10qldD+EVEV2QAqTOhNYMmQRXi/vzih2Zmg6N9Cd/mUBmv+3pGVJQc+0Ai6If/wR4Br2QfGWrU5VTY1wnyhIIbsHkvgfM0g0/0vjesaH6zaiF2czDHKUMkTBLSbSyic9iGwcqtm86nQ5i7m3+Lg7ri7ak6bBhyJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.21] tools/libxc: fix xc_physdev_map_pirq_msi() with PCI segments != 0
Date: Fri, 17 Oct 2025 16:14:34 +0200
Message-ID: <20251017141434.15205-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0008.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:21::13) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DS0PR03MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: 73ed0ed6-a978-49f7-c86b-08de0d8788f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUc0NmNWM1IrOWlobTR6R0RwK0hSTnlCZ1R3TzRUcFlWMjllNXF5MDBLa1ha?=
 =?utf-8?B?UjVPSFBJVGhLNmZoZjUxVElha3RtZndzUW9mdlM5NFhCWXZtY0g0cjBpZWR6?=
 =?utf-8?B?Rk5aZGo1Sjd4UjlFRkhKMEEvZHg1N01vb3RlZmxLK1ROazJzYzBPR3h0eERR?=
 =?utf-8?B?anRDUTJpTlFmYjJraStUV2lDRnFpZ3Y0dVJYV3VtS3M5QXc5bmhablVTZGx5?=
 =?utf-8?B?dGJZK0VPbHAvRzE3aHorbENrbCtMUVl4WitqMzl0NFFLWE5OTDZkVVNudGJM?=
 =?utf-8?B?UGFFZG5uMTlZQjBnRWYrNG1RTkFsNHl5azFxZDg4T1U4TllTTVkrOUZiN0lj?=
 =?utf-8?B?aGNtbUNQVmFwdDYyREI1VDRZeGd0K2Q0aEZoRXZqaVNCU092Y0Q1anViM2Zp?=
 =?utf-8?B?bTdWYnlHeW5lT3Uvd05haEFHTG5Kd25UN3ErN1N0MnhmQ0k2SDRwUkdQTUl2?=
 =?utf-8?B?ZU10c1NCZjZaQW5PZ1VCUkpqU1BZWmhvaHJOM1RkNTIvaDNObmUydEJWcjZy?=
 =?utf-8?B?Sm5Hd1JQTzVyeUNUOHVDWnhaRXBtRm9pZWVHc01oYjM5cHZjVThmd1hhd0pO?=
 =?utf-8?B?UGVpVC9SY2ZsNGNXMytIVzNUVTJTZlNJWnNhN0dhdnl2a3VzOW5nWHNrS2g1?=
 =?utf-8?B?UW9Kb1RmUmh6b0VGOXBIdnNqQ1NlR011WmprNzA0SEdENkUrS0VYQWZhamtG?=
 =?utf-8?B?LzZaYXFxUGp2MENZUzZZT2Y0bTJXTkZZWGpCNEZ5eGhwQ2U3SEhvcTFYSk5w?=
 =?utf-8?B?eFFNSFVORGhiOVZtZE4ycnJ3L3ZvcTMwTnpNSE0veis3RXF6RyttN0o0Y29v?=
 =?utf-8?B?Q1VHQnp2eENxTWtndFZKRDF6dWMwVjQ5bjlEbCtYSWUyWitGTmY0QllNYXJZ?=
 =?utf-8?B?K05URnAxdVNqM3ZpUnZPRkl6U1lMeCtPZ2l0YnlGb044OWVzRVZoeXFiQWRT?=
 =?utf-8?B?UmljWUJIWEUxQVFNK1grOGNqcW4yVGEvaGZzUzhTcEVyMTdweEhlQnlkbVY3?=
 =?utf-8?B?dWwwZnpXNW9VakxhcXJZODl6Y1gxZTIyUndOUjE4d2hTZUp5cXo4b0NoTnds?=
 =?utf-8?B?SlI5V2NtZWhxdWVweFBqSlFrYTZCYjZyczNmWWdQT1RsU2JnQWpPL3lUY2Fa?=
 =?utf-8?B?bWFtMThGNitIQXVnM1BjdE16RlFmNUNVMnhmSllrWm55UWoydVA2Q3kydmJU?=
 =?utf-8?B?RGVQYUE4VlQzdnJvM3ZOTThxTWFaQnY3ajVZeVZ3Z0VreWdzYkY5bjBlYzkr?=
 =?utf-8?B?c0RremV5SU0wMmF4S2F2OFNwVS9QakVEYUhSNzNCeDFYSWtHSlVibGxSS3Vu?=
 =?utf-8?B?WW5ma2puUmJKd1Zra3l0TzlwR0QyMDBNQnpSam5uOERZMmlGeFFobmVldi9r?=
 =?utf-8?B?eVNBcDlxMDBUbzNlaHNhYWpOVFZaMW5CV21TRTAyUUJkODE4blZ4QmV3OUF3?=
 =?utf-8?B?allyNWduY2tFK2oxODF4NThOc1g2WnBSMkEzN1IydXdLVi9IY0NCeS9KT0sr?=
 =?utf-8?B?alhvdmJ4NGhCTXJEckl2YUgzMHNKbmtXMWprMWJOSFN6WlJvbGF2aVZKTzlG?=
 =?utf-8?B?VTlPVG5PZGZWZlpHaFlkenIza1p5K0xxeHNqVXQ1QVh6Qm43cUxvVHcxemlE?=
 =?utf-8?B?ZTd4WkRKUURFK3pUZ1RGZ1hSOUl1VlNrd2dUZVlsWklDM2llRVF1VTRwckFq?=
 =?utf-8?B?VDRtUjR3a20rTlluLzQrdFNoa0FnbnJDVU5iczFRSFNXY0M0RHV1Yi9BZGlP?=
 =?utf-8?B?N2JNb0tLVTk3Sk9zOFlJd2pYdi9jWGROSmxVT0x3ZkQzTDh5eEo5ZHAwUTcw?=
 =?utf-8?B?TVNlbEJMZklhSXA5Mmt4TzdLbk5rcFNxeDA4WGUrLzFOWE5BZWlTQ01MQmZB?=
 =?utf-8?B?VEtsWUFrV3M0b29QeWkxczd2enJIY2lQVDlRWkhiWjBKT1hDQ1FuR2I2WU4v?=
 =?utf-8?Q?QtLrWk/YRwhu5GJVjquHIzpTNr69kv9d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1NISUZOUkYzNi85VzZHS1pBZmFXaCtpaEY2NGh0L3FwMDlRM0w5dnZyYkt1?=
 =?utf-8?B?WEV6ZDhyUUdrNEsvamFoalpaZjRXWDFzTFRJQ1ZGdSszcmRhV1h6b0RLcThh?=
 =?utf-8?B?enk2QXZROFNqa2haaXlmb0hYZ1J2RldhZmNWQTJ5cE1kdUoxalJZaEkzaG9j?=
 =?utf-8?B?cy9oRFVxS1BmZnRNcWZ2eGVyR250QWhPQ1hGWTN1OCtpbEdkQmt3WDd2ZVpx?=
 =?utf-8?B?UnVNUzBCVFNsWE1ZT21KbElQRk1PVktQMVVqNXR5cUtiZUgvN2hIRzM2Q1hs?=
 =?utf-8?B?U3lQMy8vdGtmWkRIWU1vWW9LNWpjTnJtRXV4YVdaVTRrenJhazdTRVc5cEhO?=
 =?utf-8?B?cjMwczRMQnVzQld5QXBndDFaelBydVdsbkJmTndTbDVVbzVuUXo2bnZTMnVY?=
 =?utf-8?B?UnFpZEZWdk11ZmtBQXkyOTJ4TFFlWXZ3dW16US9XRnN6eUFoOWVBbXNJR0xD?=
 =?utf-8?B?S0hzWVN1OEgvMksvdHU3NHYvd3RPTHNtTzQybE9KM0o0L2RldXhvYW1hakhi?=
 =?utf-8?B?cVdoRmkxRnVkT05RblNBY0pFbjV5MG41TW9VMmVQTzhtdVQrTVEzOHZHVWcy?=
 =?utf-8?B?U2M1ZDFYZmcrQzdoc3ZnczhTbmprZjc0UUxhQUd1akpqSmR2a25vYmZHeUVz?=
 =?utf-8?B?ekxPMzBDWENCMjlxOHY4SWtZNWdsTkZkYkRiRE1RMnZlKzZqTEFxMlFKZmFK?=
 =?utf-8?B?YUgwVXlKRlVPWDBMbzhPK09naVZacXVxS0FESTA2SXdWUndiR1Y3WGZWSEFX?=
 =?utf-8?B?TktRaXFqZGVuL1l3Z2RVZjM2ZXJSK0FNdGlGS243VHBXN1MzSFdqdjIxSWds?=
 =?utf-8?B?cUxZRGpRT2RUUXJ1K3NCWjMxY1FFbWI3REJzcVNBcGxDOWRHUEVJZjZFMnhu?=
 =?utf-8?B?SVRKNGZPemxQeXBHV1hOVW80akE3SVlhbWFxOW9FZXIydXMvMjY1c1dXUkhr?=
 =?utf-8?B?bXk3REFkTEFkcVZHQWR3YmM1Z0NteHFEY2lGa210cDFzeEV3R25vZHQ3WTFm?=
 =?utf-8?B?emY0Y2pmUTk0L2c2cnJZUVBnYzluam9pR3VKNWFZeGJoYm1hcmdjUUFyY3Fw?=
 =?utf-8?B?MTNlUDZEWXFaSnpzMTJHajkxZ0VWOElGMmEvaVpLNWhvTlF1QUZPR3Z3aWtY?=
 =?utf-8?B?VzQzUVlqRHJrTFJodjhGWmxnd2c4ZzA1T2g3Rit0UFFOcGF1WFMzVUxhTUlP?=
 =?utf-8?B?anczUTFrblJoSEtlTjhxbWhSc1c0K1FPUHJMUXV5NGRka0VUUm45aDJYcFlF?=
 =?utf-8?B?VmZRZmJGWm05cS9SNHFTWlZBTzc1SlZGbUl3dnd3SkhWNlpUaUlvWGNEVldV?=
 =?utf-8?B?TVM2eDc5NnJRRncyd01kOER1SU9SREpNd0lIV0tST2NybmVlVVdvTzRaQzZB?=
 =?utf-8?B?dklTL0VVeS92U2FRQlN6dlgwdithcnpkb243cFluT0xSU1BLVktHRm5JYXpG?=
 =?utf-8?B?VXhicTBzdmpUd0ptcHdoaWF3NDhXUmtrMjQ2RlhqQU5USXJUV09hbDAwTytF?=
 =?utf-8?B?cmErMVhxREM3SERIUHUvZnE3ZlA0bnNVVmpKWVlDdHUxaTZ5SkUvUTkrdVdV?=
 =?utf-8?B?NmlIdUQ5UzRVSWFMQzVHbm5td0VyVCtIbnVzclFIc1VNeXNqcEI4bGZxWG5x?=
 =?utf-8?B?RlVnZnFWRTdua0FHemFzTW1sVTNDMmJFUDRIRkJ4R2tvdzZOVkdham5tYlFH?=
 =?utf-8?B?RVhBNWJEZHJCZDlzaDhjZUtMbkY3STE5a1lFZkRPL04vaThaVittU1FCUzdy?=
 =?utf-8?B?WFB5MkNyQWVHUXhuMzNYdmMwTzRIeExwN3BZR1pHelR3UjFNNWo5Q3A2RDdZ?=
 =?utf-8?B?aGVpQ3NGRTlWZWFBV3hzWDdBSk01RzdhZFM4UzRwR2tvSTFxbDBSTlAwTEZu?=
 =?utf-8?B?cnc2NlJkT1gyRGFicmFWVlBLWVpCUVJuUkFWNEVWUUswQkxEckc1WUhxeE9I?=
 =?utf-8?B?aDVBMTVodHhKQmwzOURhYVFNaUJqSWs0aW40UXhjVER1bS9QQW50SmZ6dzJW?=
 =?utf-8?B?Z203ZkMwdG1KK2hONEk0YjhKQWdvZERyU3dnMUp4amEvVlM1dUtEMHZObXZV?=
 =?utf-8?B?QXhtUUhrNUk5Uzh3WmkyWXQ0UDlUN1hFdDRLZTJmMjFjZW5kRFRZVEduanp2?=
 =?utf-8?Q?lnXYoH1XQKRNw05IQ7INHJ6Bu?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ed0ed6-a978-49f7-c86b-08de0d8788f9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 14:14:50.3713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cchmitaVasJgGwOIOw8grKdokPUMKA/UbFeC90XVl4wYsUyrXPit7Nww6IhRECqtHQaf3QBcGGHC58qBTc9wEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8200

Otherwise it's not possible for device models to map IRQs of devices on
segments different than 0.  Keep the same function prototype and pass the
segment in the high 16bits of the bus parameter, like it's done for the
hypercall itself.

Fixes: 7620c0cf9a4d ("PCI multi-seg: add new physdevop-s")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I think it's 4.21 material, as otherwise it's not possible to passthrough
PCI devices on segments != 0.
---
 tools/libs/ctrl/xc_physdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
index 25e686d7b389..1307d6836d72 100644
--- a/tools/libs/ctrl/xc_physdev.c
+++ b/tools/libs/ctrl/xc_physdev.c
@@ -79,7 +79,7 @@ int xc_physdev_map_pirq_msi(xc_interface *xch,
     }
     memset(&map, 0, sizeof(struct physdev_map_pirq));
     map.domid = domid;
-    map.type = MAP_PIRQ_TYPE_MSI;
+    map.type = MAP_PIRQ_TYPE_MSI_SEG;
     map.index = index;
     map.pirq = *pirq;
     map.bus = bus;
-- 
2.51.0


