Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B40CC9085
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 18:23:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189038.1510003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVvEV-000118-TF; Wed, 17 Dec 2025 17:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189038.1510003; Wed, 17 Dec 2025 17:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVvEV-0000zI-QI; Wed, 17 Dec 2025 17:22:39 +0000
Received: by outflank-mailman (input) for mailman id 1189038;
 Wed, 17 Dec 2025 17:22:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0CCj=6X=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vVvEU-0000yw-Cs
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 17:22:38 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faca2a91-db6c-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 18:22:36 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL4PR03MB8038.namprd03.prod.outlook.com (2603:10b6:208:58d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Wed, 17 Dec
 2025 17:22:34 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 17:22:34 +0000
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
X-Inumbo-ID: faca2a91-db6c-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mh4juj0hEcECw24eDt3GCiGQ9U1zgDcutjuHwG2GsCrOCsts5V9VpRQtovagWswqCx35iVfW8aJIzN3rFqTGSENjcixirZBe3vMQ/4qmFdOreekCqR7JKF2qzHjK6Q9TdDOQGOIEIEdx0qzSt7nF565bAQiBqEw3okRgTLyfrSgwrSxXIxB6n52nB1eiNLkLEoqo6KMKVOpJErN4Sdv6UCvkM0XuiTOFJuUvyflhPYIyuFHZMD1oLzOtMZufs6aj8uXFw3TTSlM+IS38UgAhC1dSEOG3f7zyWkyU9kK+2LCV+2otGdgZOBx9BJjfOlhP7nhOFlDduMOatIO076dBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7F19xt8m3Ujw/SCZ/6VD7buWnc3810xHc2zKL9MkAtQ=;
 b=t07cys7+ShoOVCskSHgREtDruwLJ+4zr3mMIvp6Zk2Ztw5yq9tiwdVlGTGcx0TObWhrkfca0PHG4VBTpzM/f9vSXIAWSmUN66spuD5S8FITDA/2cetBKyKG+duL9Kpsy3f6DcWO55mb2LoQOkKNJSBP8Uyo67hYECCtu5ghtYiJZenGB48sKYOnvA+0f8KGjkLGyLv7pFaA9qCKbqZyFtgBc6VOFM0DrfOfl3l/R5O+bfJ+nij0Sv2QcBrSMzsMqgf7UysN0A1XBOz/psrKVAzXJIexrLcRYxDSArgAioUE2O2x6Na0AXkCpJ8Kok2v5iYn/08E1lUz6jUOWnuJEVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7F19xt8m3Ujw/SCZ/6VD7buWnc3810xHc2zKL9MkAtQ=;
 b=TpLHFyUWYveaYe9OHZeB2Q9d9J+t+uI22PFeaisanYuxW5t6vwz8wLRGkgdDB07x+ZaNhqvn+v6JY8CiDan78HQ9KtAg3j0cTCiCiP7DpumQIufxfIjxwkaUu09VxFPfkMr5D3PhOrThfeo0l6GBKmEIVBtkubaqWufYWxMv4eY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e11d37cb-cb24-4d9f-a334-e59a251b22be@citrix.com>
Date: Wed, 17 Dec 2025 17:22:30 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/4] tools/tests: Memory Claims
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20251216163230.2768186-1-andrew.cooper3@citrix.com>
 <20251216163230.2768186-5-andrew.cooper3@citrix.com>
 <aULh4QZeT7uZufVa@Mac.lan>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aULh4QZeT7uZufVa@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0367.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL4PR03MB8038:EE_
X-MS-Office365-Filtering-Correlation-Id: 647cd747-54c1-4b0f-1637-08de3d90ddd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mk9SOGZ4eEdzdWxZSm1iY3QzWGFGYk1sTHJHd1lxZjNWL1B4ZHJUdzgzam5n?=
 =?utf-8?B?S1gwa3JXRXZUaHBWUy9WcDNrVURrYmtZNFplejliYTJ0RmZmM0dTK2FHTFFl?=
 =?utf-8?B?OVhxVjIzVEVXTHE1WTNxY2M4OXc3cW5QZnBXcEtnK2lwZndFbExvVjlDanhD?=
 =?utf-8?B?MzlhNmh0Ry9LYTB1LzJpR21raElOKzFwa2pGYkZWTzllWkx0RGkxSnUxNCtI?=
 =?utf-8?B?V2FTMGFDUVlDcStuT0VhdkRobnM5UDRsRkF6dXNScTlIVCtjS0JXaHVPeVlD?=
 =?utf-8?B?cmV2bExveVRQbzREeFplemMwN0xtd3VZVVAwL0c0eFd3ZzdUajRLMk1RaXBQ?=
 =?utf-8?B?aEhGVHNJTGNuQkt2aExGUTI2WGZxSkx4MGVQNU45SEZDOXQ3VWJWZTFhd2Ry?=
 =?utf-8?B?V2xPcS9xeC9OeDEweEcvY0lzM1JzU09vUlQ3R01PT0ZCZ1NMWWtkdE5wRW9T?=
 =?utf-8?B?NkplNi80SzdKR0FwNTdiaEg4Zy9QKzNpZXlHK1ZMTk9HQzdtamZyTGRlSG53?=
 =?utf-8?B?WndOTlF1UTRLTHM1VGJjcUZPVTdncE4rSU5KL2VMQ2NjS2hWRUx6cXVZbzNJ?=
 =?utf-8?B?aGlQRlZNZVNGRS9odlYvd203RUZiMXJ3YzdBUS90MTI3cE5kUnNEVklkMjNE?=
 =?utf-8?B?K2o1SnM1b0syMzlUbE13Mmx5MVFGdVRLRUNCaG5yaEl6bUJqVnhBTXRWdmtP?=
 =?utf-8?B?YzVIYjdVdTdFWjlENTFFTUJZZzh5SmhZN1RWNm5wTGV0a2laVS9kU01nVG54?=
 =?utf-8?B?TEFuSE1Hb3BPOWVNeExZa3RMaXhOWGNIMlZ2Mmtna1hwV1ZpL1dwMzRvVjZl?=
 =?utf-8?B?WE9xK05NT2F4b3gzeEJSdGluYSt5TEZDa2pQZUtiZG1jc2VHK2srQmx3TnJS?=
 =?utf-8?B?MnpEUHlEWmptSzJKRHFobXlSQ1pYeXhvcUxzV014SDRjTEZaNHlhczJQYjhX?=
 =?utf-8?B?ZDdaVkhGUThzRlgvN3NTK3pYZEdmVzJwN1hIbzhHNFlka2Z5K1dpcEd1a3hv?=
 =?utf-8?B?VFN3ZUE2UVIzTHBoZGdKaEhHdS96YlgydlhTUHJiTVhwVUNVREVmNWErdk9Z?=
 =?utf-8?B?dW8wYjZQNmwwVHEwU0Fjdy9tMm92MHJtWlJpbWJNazhNbWYxWTd3bFRHQzEv?=
 =?utf-8?B?N3JaN0xwTXIyWFg0d05hR3lFTnlzWldaanMyYUM5L3lYck5ESXRMUU54TmYr?=
 =?utf-8?B?ZGppVHlpRWZ5cFJCREplR0J5RGl2K0grRFlIam1WTTNQZ25tL2Y2Z2VILzZk?=
 =?utf-8?B?TGI5bGNoZk9qT1ArdUZtbmk0ZWNhUWp1N1plQ2RaWWpWOWZROXd0ZFJjWlln?=
 =?utf-8?B?NFJpaUlpR21ZclRIUVgzZTNmZHJvY0s3Q1Y4SURjTlpSNW1pdXl4MTNUcEE5?=
 =?utf-8?B?eUFvYjBTK1ZTZnpqZnlrMGxZYUNWdzdOZkovZEh0K3JjQnJ0eWxwdzFvT2N2?=
 =?utf-8?B?eUd4d0hSbEI0L1FZU1psOEJCcFZBS1JqY25ja1A5STk4OXNvRTFDNldvM1I1?=
 =?utf-8?B?akxHbWRvTHYya3pUSDU5VGxvN1plZ3JjM0pUNGNIc3RBNzdXbzlyTDVydFpy?=
 =?utf-8?B?VFFXM3JiRmltYUtYNWc1VlZwbE5vaElIbGRDTEJ4bFRNdDdvOVAxTGw2b1h0?=
 =?utf-8?B?RU9uOVREaE80bHJPY0wyeEZXQ1J2WFFTTTkzWENHczhtUFNYd1VyVU9lMTVj?=
 =?utf-8?B?UEo3ZzFLTEY4MGpRZTlSVm9Iai9Id0w5dnV3dktzSjM1ejE5V1U3Qit4a3lv?=
 =?utf-8?B?eVFrNjdUNndvaVZNMVVzRVZtZ2F6Mlo1UGFNRlVwaGdUVFI4Q3gzNVpBNndU?=
 =?utf-8?B?MVZrMEZ1dk1IZ2NtRWR2SlRHdG1ZaEhLOFZTcDdHWnFBVjZRbEU5VUt3MXQy?=
 =?utf-8?B?bjdzRTNwRko4Mks0aHhydlNaclFic1JVL0Z2RDUrY3VBMXFqVnd1YmVZNjdh?=
 =?utf-8?Q?SjagcLaRZCByAuSCVkzCduKo5v99KFk0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2J3RVIxMk9naW5KaGJIelhucXAwZWNlZ3dyZkp1RjFWblR1VVdKeWZtZkNP?=
 =?utf-8?B?cXYxZnNKeEQrenhHZUVCSFBWaGp4b0c5eEY0U01DbHNmTXhJSjlZd0xGK3Vx?=
 =?utf-8?B?SDBWQkpXU2ZZKzJwQlhlSDFad3F5UHlEQXZBY05rQVlibGVRZjZBWnpTdm90?=
 =?utf-8?B?K3FZd3VaNWZFb3Bvd25ZVitkTkxRbjBxMnBCK2NJbkZHdkU3WTB0U1JGcmt1?=
 =?utf-8?B?d3BNeWpneGoveVJoNnpod0gvZ1hFOHp2ZGpYTzlzYTNIdmFQbi9FeTh2UUJV?=
 =?utf-8?B?ZHVVSjVXOGpxejBnSjBYN29FK2I3bDd1QzZDZkdOQ3IrMlp3VmF1RGdkb0Fk?=
 =?utf-8?B?TisremdhUWZoTnlOSXIwNFBBUC9rZVBtWndMOUhoN1F3Qlp0SysweXhIVnla?=
 =?utf-8?B?ZXJMMjJMSWI1b285UzJEMCs3QndWckJOZEFQK1RqcXpNM1pFRjQwYXprajQ2?=
 =?utf-8?B?SGthU0Y5eDZmWVdaSE9YRmU3QWh3ek8vNDhRRCtsZkFPNVBvemwrTElSTzR3?=
 =?utf-8?B?c29XSGU0OEprdUlSMGpRT3B0NXE5d0daYUdrM0FaZHR3SGIweUJsc05aMnY0?=
 =?utf-8?B?bWxIUHF2V3kzTkk1b0lGQnpndFc1c2Z0RGVvTmNGcWYvVUh5OFJlaHl2enNx?=
 =?utf-8?B?YzhsQWhvNE84WGxEZnZYQnBxVkx1cmo4dG1aUWsvWHhIZit3aHNoT3k0RTNG?=
 =?utf-8?B?UjNTUGFjdHB2ZlpFSmwvQ2hzZDBTelFmemdpeDk2MDRjMlVFWGpBQ3ljNDBl?=
 =?utf-8?B?dDB6S0FHNGRxcHZIQ3pFU0FlT01rWVBURU9QaEZqU0RDSUhneTJYSE9wZEhp?=
 =?utf-8?B?RGR5dVBjd1JNWGZpRVR3ZWpOdy9VVGJQeURjMlc5MTlkKzFDellkUWxwQmYz?=
 =?utf-8?B?OWRvRnQyK1hQSjl2K2lWcmxEQTkvKzdQcEprbUk5Yi9HUmtLNUdFT1RWa1NY?=
 =?utf-8?B?NlNUNVVIU0JVRkxrdGFiT3lJVUVyTCtleGRURUQ1K3QrMnppZE9HcURVT1BL?=
 =?utf-8?B?c0pKM2ZvRmd1YitJdXFPQUh5Q2cwQlpSL09VVTAwcFRVMWZMWFdVYTh3OHhw?=
 =?utf-8?B?aFBNVC82a1N3d0RSeTdibkR2aDdhZzArZTZtbUVUV2dxUCt2Tjc5b3QwS2o5?=
 =?utf-8?B?TnAwQzZSMTJhV2hSbytCRSt1cFpQRCt0aVc5R1RneWQxUWZDTVdQVVFodDkw?=
 =?utf-8?B?SVIrWHc0ek9pTkNxNnVSOXZLREs0VnN4RHYvZzAwejBDU1ljMTBjSmtWWVlJ?=
 =?utf-8?B?bXdXRGRvN1B2WGorSmRQWnNSWEEvdU5McktNMDhnRzlGTUIyblVmOG5NM0RG?=
 =?utf-8?B?WDluRXN0MUQyNEY1b0hyRWZaWkNJeVZxYXQ4WlZ5eVp1TTBjV3pEWHZzN1l0?=
 =?utf-8?B?THdSbHBGRC9HaHNubU1SVjZSVnJXemR2RzhRTHBWV1lxQlp5bUNaTHRXSnN0?=
 =?utf-8?B?b0k4VXp6VWhaWW1wVHd2QUNPYkNMMG5zemM0WWpkOWJaV3Z0cmZ2V2Rla25q?=
 =?utf-8?B?N0NXWWhycW43L0VPWGE5cU1xa2ZkSW1sbjI5ZFlBaVlpYkhTZS9hNittbVlt?=
 =?utf-8?B?UVJ2QlhzNUVqamxNNW9DZjRlTm5XUC9QemJ0TFlxb0I1OVFGNVRSZGhnT0Fm?=
 =?utf-8?B?bzJzS2lqN0ZYeDNwT21FNkdNMUozbUl2RER5ZVhOTlFiQkgzQXI4L2gvOCti?=
 =?utf-8?B?NXUxdUN3cFZMSVVLYXpLUk5zZis0YjlESzBpd1NDWFRWU0tIanBLUlBncTVS?=
 =?utf-8?B?bGZFelNFdkgxZTBBOU8yNWRoUWNDSjFNYXZzcW9YczRtU1V5M0JLaXpJaU5j?=
 =?utf-8?B?SDhueFpTUldhbFdCL3k0NnRnbFN2cHJjdEdOb21peTVsRk95TmtlK0dDbGVr?=
 =?utf-8?B?RXRNQlJiY0swbzNGQkpWN3ZNeEU5L2FCMHEwOW9kQ2xCbTBVcDVjbWszRG5H?=
 =?utf-8?B?T0dXVzV3dnVYV3hKRlhleFNvUlF5dHFYUVorV3JGRGRFSWNYSGpGRHZ5T3NN?=
 =?utf-8?B?OGU1WWhkSFhoWkIrbGxnWlNQajRkQTNCcGtic1Q5ajEvd0lxNUhpclRKZ1do?=
 =?utf-8?B?SjlVYjhMNUVhVW9SQjR1dkVmdkxYWC9WMkErTUo0MWRQRDM5TzZQekhTb0Fy?=
 =?utf-8?B?b2dhZWh6WTA4bUIwQm1DaDYyTVAxMG1ocDAyTGpFZjRLeUpFQlpkd0J4Y0Nt?=
 =?utf-8?B?MDZDNVE2WEo3ZFpwV3dqQWlvUnRSUTRxRGVxbEhRc0VnWWZRY0hYcmw0UWtw?=
 =?utf-8?B?aENsbXI2Q2VrMSt6MUdUeHpTaHpSaGF5OUV5eEhQeU9VZWZhN3FwVVRFYkFO?=
 =?utf-8?B?bitUOEdHVUQxak1oN25TVHdzMWRJVjVJL2tRQmMwTU1OSmpqdjhwV1JrSURL?=
 =?utf-8?Q?wAJwOMhvmdS+0Rqk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 647cd747-54c1-4b0f-1637-08de3d90ddd8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 17:22:34.0337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+K8YttoukzMENMG0DnXeaB7GRPwPIKxSSqd4c8ZAVHjBfWVm5Du6VNhtYm/UYBQfWCU1zARornHVpfphU0XFPCUzOOapX68yQueFJIGPu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR03MB8038

On 17/12/2025 5:01 pm, Roger Pau Monné wrote:
> On Tue, Dec 16, 2025 at 04:32:30PM +0000, Andrew Cooper wrote:
>> Add some basic testing of the memory claims mechainsm.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Some nits below.
>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> ---
>>  tools/tests/Makefile                   |   1 +
>>  tools/tests/mem-claim/.gitignore       |   1 +
>>  tools/tests/mem-claim/Makefile         |  38 +++++
>>  tools/tests/mem-claim/test-mem-claim.c | 190 +++++++++++++++++++++++++
>>  4 files changed, 230 insertions(+)
>>  create mode 100644 tools/tests/mem-claim/.gitignore
>>  create mode 100644 tools/tests/mem-claim/Makefile
>>  create mode 100644 tools/tests/mem-claim/test-mem-claim.c
>>
>> diff --git a/tools/tests/Makefile b/tools/tests/Makefile
>> index e566bd169952..6477a4386dda 100644
>> --- a/tools/tests/Makefile
>> +++ b/tools/tests/Makefile
>> @@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
>>  
>>  SUBDIRS-y :=
>>  SUBDIRS-y += domid
>> +SUBDIRS-y += mem-claim
>>  SUBDIRS-y += paging-mempool
>>  SUBDIRS-y += pdx
>>  SUBDIRS-y += rangeset
>> diff --git a/tools/tests/mem-claim/.gitignore b/tools/tests/mem-claim/.gitignore
>> new file mode 100644
>> index 000000000000..cfcee00b819b
>> --- /dev/null
>> +++ b/tools/tests/mem-claim/.gitignore
>> @@ -0,0 +1 @@
>> +test-mem-claim
>> diff --git a/tools/tests/mem-claim/Makefile b/tools/tests/mem-claim/Makefile
>> new file mode 100644
>> index 000000000000..76ba3e3c8bef
>> --- /dev/null
>> +++ b/tools/tests/mem-claim/Makefile
>> @@ -0,0 +1,38 @@
>> +XEN_ROOT = $(CURDIR)/../../..
>> +include $(XEN_ROOT)/tools/Rules.mk
>> +
>> +TARGET := test-mem-claim
>> +
>> +.PHONY: all
>> +all: $(TARGET)
>> +
>> +.PHONY: clean
>> +clean:
>> +	$(RM) -- *.o $(TARGET) $(DEPS_RM)
>> +
>> +.PHONY: distclean
>> +distclean: clean
>> +	$(RM) -- *~
>> +
>> +.PHONY: install
>> +install: all
>> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
>> +	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
>> +
>> +.PHONY: uninstall
>> +uninstall:
>> +	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
>> +
>> +CFLAGS += $(CFLAGS_xeninclude)
>> +CFLAGS += $(CFLAGS_libxenctrl)
>> +CFLAGS += $(APPEND_CFLAGS)
>> +
>> +LDFLAGS += $(LDLIBS_libxenctrl)
>> +LDFLAGS += $(APPEND_LDFLAGS)
>> +
>> +%.o: Makefile
>> +
>> +$(TARGET): test-mem-claim.o
>> +	$(CC) -o $@ $< $(LDFLAGS)
>> +
>> +-include $(DEPS_INCLUDE)
>> diff --git a/tools/tests/mem-claim/test-mem-claim.c b/tools/tests/mem-claim/test-mem-claim.c
>> new file mode 100644
>> index 000000000000..78eae9091f52
>> --- /dev/null
>> +++ b/tools/tests/mem-claim/test-mem-claim.c
>> @@ -0,0 +1,190 @@
> SPDX header comment?

Will do.

>
>> +#include <err.h>
>> +#include <errno.h>
>> +#include <inttypes.h>
>> +#include <stdio.h>
>> +#include <string.h>
>> +#include <sys/mman.h>
>> +
>> +#include <xenctrl.h>
>> +#include <xenforeignmemory.h>
>> +#include <xengnttab.h>
>> +#include <xen-tools/common-macros.h>
>> +
>> +static unsigned int nr_failures;
>> +#define fail(fmt, ...)                          \
>> +({                                              \
>> +    nr_failures++;                              \
>> +    (void)printf(fmt, ##__VA_ARGS__);           \
>> +})
>> +
>> +static xc_interface *xch;
>> +static uint32_t domid = -1;
> I think you could use domid_t and DOMID_INVALID as the default value?

Sadly can't.  Domid's are strictly uint32_t due to xc_domain_create()
taking it by pointer.

> And then you could avoid the casting and just use domid <
> DOMID_FIRST_RESERVED as the check for whether the cleanup is needed?

Hmm.  The DOMID_INVALID part of that is nice-ish, but having the
boundary check be a different constant isn't.

Maybe I can just do != DOMID_INVALID for the cleanup.

>
>> +
>> +static xc_physinfo_t physinfo;
>> +
>> +static struct xen_domctl_createdomain create = {
>> +    .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>> +    .max_vcpus = 1,
>> +    .max_grant_frames = 1,
>> +    .grant_opts = XEN_DOMCTL_GRANT_version(1),
>> +
>> +    .arch = {
>> +#if defined(__x86_64__) || defined(__i386__)
>> +        .emulation_flags = XEN_X86_EMU_LAPIC,
>> +#endif
>> +    },
>> +};
>> +
>> +static void run_tests(void)
>> +{
>> +    int rc;
>> +
>> +    /*
>> +     * Check that the system is quiescent.  Outstanding claims is a global
>> +     * field.
>> +     */
>> +    rc = xc_physinfo(xch, &physinfo);
>> +    if ( rc )
>> +        return fail("Failed to obtain physinfo: %d - %s\n",
>> +                    errno, strerror(errno));
>> +
>> +    printf("Free pages: %"PRIu64", Oustanding claims: %"PRIu64"\n",
>> +           physinfo.free_pages, physinfo.outstanding_pages);
>> +
>> +    if ( physinfo.outstanding_pages )
>> +        return fail("  Test needs running on a quiescent system\n");
>> +
>> +    /*
>> +     * We want any arbitrary domain.  Start with HVM/HAP, falling back to
>> +     * HVM/Shadow and then to PV.  The dom0 running this test case is one of
>> +     * these modes.
>> +     */
>> +#if defined(__x86_64__) || defined(__i386__)
>> +    if ( !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hap) )
>> +        create.flags &= ~XEN_DOMCTL_CDF_hap;
>> +
>> +    if ( !(physinfo.capabilities & (XEN_SYSCTL_PHYSCAP_hap|XEN_SYSCTL_PHYSCAP_shadow)) ||
>> +         !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hvm) )
>> +    {
>> +        create.flags &= ~XEN_DOMCTL_CDF_hvm;
>> +        create.arch.emulation_flags = 0;
>> +    }
>> +#endif
>> +
>> +    rc = xc_domain_create(xch, &domid, &create);
>> +    if ( rc )
>> +        return fail("  Domain create failure: %d - %s\n",
>> +                    errno, strerror(errno));
>> +
>> +    rc = xc_domain_setmaxmem(xch, domid, -1);
>> +    if ( rc )
>> +        return fail("  Failed to set maxmem: %d - %s\n",
>> +                    errno, strerror(errno));
>> +
>> +    printf("  Created d%u\n", domid);
>> +
>> +    /*
>> +     * Creating a domain shouldn't change the claim.  Check it's still 0.
>> +     */
>> +    rc = xc_physinfo(xch, &physinfo);
>> +    if ( rc )
>> +        return fail("  Failed to obtain physinfo: %d - %s\n",
>> +                    errno, strerror(errno));
>> +
>> +    if ( physinfo.outstanding_pages )
>> +        return fail("  Unexpected outstanding claim of %"PRIu64" pages\n",
>> +                    physinfo.outstanding_pages);
>> +
>> +    /*
>> +     * Set a claim for 4M.  This should be the only claim in the system, and
>> +     * show up globally.
>> +     */
>> +    rc = xc_domain_claim_pages(xch, domid, 4*1024*1024/4096);
> You can use MB(4) (macro is in tools/common-macros.h) I think for
> clarity?  Same below with MB(2).

I'll wrap it as MB_TO_PAGES() to hide the divide by 4k.

~Andrew

