Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 764C6BDED48
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 15:48:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143612.1477313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v91rO-0003Cv-UQ; Wed, 15 Oct 2025 13:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143612.1477313; Wed, 15 Oct 2025 13:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v91rO-0003Aq-Q0; Wed, 15 Oct 2025 13:48:10 +0000
Received: by outflank-mailman (input) for mailman id 1143612;
 Wed, 15 Oct 2025 13:48:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pY79=4Y=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v91rN-0002AF-Kk
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 13:48:09 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9506f1f5-a9cd-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 15:48:09 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH2PR03MB5176.namprd03.prod.outlook.com (2603:10b6:610:97::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 13:48:07 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 13:48:07 +0000
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
X-Inumbo-ID: 9506f1f5-a9cd-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymluJR4PiKjiUuFSOS8w2TKltw1DCPsIRqfhWGrW3w0Ymx3XmLkh9FszY9MgXtPTPhUfU3xABLcjNiONfMUudlYEPSElUynNJbF9FAPoiQUteE9wyQYcGgtHLPGpA/OSqAFKlpih31T9kpIb/h+6BYuQb17SwXc8PbgD9GmSMaIBpVN3ctbw5N3sYywBF0lRj1dd7XifB1H118jZ+VfaBJCZbsHE0JIkgPCMUJhrfzQ42y9Hr0Th+Rcal+Jh30fpkcFAZrSgKpxKWV/SdhBfKdD2zqL1Ejau5XskeJ0FGYLtzhmu1zImAi0G4obiURzJjsO/Rm3T+jH49vbD3COECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tksbA7H2lMSaY3a5c9YU6hhiTitb1FxEL7gVnxGjj7U=;
 b=WhkWOnsYXmtBxI8C/0PEuamRPbu7Wo/wKCUltRUmCofoDr/hOZMAKRqI9uGNtTipS0eqE+de3gx9j/7Jp/n8NI4IYBQLOiIIOO4VhgpLlAGVUVMg4k4xEBG3ArtLAaJ+vHvXevDwDeGDbd/9N3Y7enMUg5tdj77URhbe6ZTFd6twSYDAf0GUjc5CSkSe76klcCYBwTdOuka6oujYY2vMOvMfCrXb86qBulVoN+ZQrX8DjPixS6ocFX8a0fvX5swaHXszjG6E7H3UhYRJvwmuHUlwxU3gAYXxfAU7xalzI+aRFKikM5/MyeseLK2bkKtwlT9poNOw5+yCWofPQ7zQVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tksbA7H2lMSaY3a5c9YU6hhiTitb1FxEL7gVnxGjj7U=;
 b=y/+k9wt0aFAy4t/iSOmuSBJ/AjkVcKlnJFUBctbrChXdTN38N5Ta9lbMS4+3w7I+h8RJ/gI8LIZE4nM4TNnk1iRVjMGBJ02xTRC54t37QfGuasJ2hjRGBoNMqLuolkrScYs5q90zBVIcjvBlycWuI69u/URYYGMyq1w6h7UTMM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pua@citrix.com>
Subject: [PATCH for-4.21 4/6] tools/xl: check return value of printf_info_one_json() in list_domains_details()
Date: Wed, 15 Oct 2025 15:40:41 +0200
Message-ID: <20251015134043.72316-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015134043.72316-1-roger.pau@citrix.com>
References: <20251015134043.72316-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0105.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:348::19) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH2PR03MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df38a21-8d59-47a7-8a40-08de0bf17893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmxjVVZZVkpIaDd1Vmh6VWJ1ZWRIQnZrbUV4ZDdrdDdGVmFOakhoQzdPcFht?=
 =?utf-8?B?MWxKWEg4THVUUnM4UTZXKzVlNTJySEZ6Y0tFNjZMTlBIMlZDVTVseGZ2Y3Yz?=
 =?utf-8?B?YU01b1pZM0JaTzNIdDdoRnNObjlrcndLd3NVVVpuM0xzdDRQZHZINkpHUnEx?=
 =?utf-8?B?NmU2Z2pteldOM0FXeE5WNk5DemdGUHl1RElCenBwbXFrU2xSdW95UXJnZFlu?=
 =?utf-8?B?VDNuQnNScVBET29EeGk4Q0lrOE1xbFBIUFdTU254UE8rNk45OWlMbnNaY25X?=
 =?utf-8?B?UnI1OEpWcUxRZ3FRZ0JEM0tZK1BhelNBVk5KSWFNem1wUE04NVNJVEN0Q3hF?=
 =?utf-8?B?Y3pBM3hFVTRIaXkrN3NnRUdMSmxQQnRCTFAycGFYVHgwT1FXVmZVK043TUhS?=
 =?utf-8?B?Y3ZSZEZ0WU4zNVBtcE9HT25KSmNyZGZTN2tQSkovY0t6NXg1a1dlWmRiUFhN?=
 =?utf-8?B?aEFydThka1lvRzEwdzB6TXppbW5MellYVTdyeXAzS3E1NUVndzZhUEc5UEZJ?=
 =?utf-8?B?MzMyYzh1OTgrSGV3NktaL0JPckJKdzNvR0UwSXYva0xqOGZYMUpiU3c0ZzFK?=
 =?utf-8?B?S3VsckNUNXVRYnl0VGkyUTRRMWpZdVZPSmI0YnhEaDFRdlp3UFprTlh1c29Y?=
 =?utf-8?B?R3NFd3BkS251WHFGenMzWHNQS3l6Rmc3WEpwUytPRHNIUWlWdEpGeDBiUms1?=
 =?utf-8?B?R3hJblRIM2pGbzQ5YjhEN0ZzNmx0UXNhU3h0QitST0plbWdEb0pkSGdoYk9P?=
 =?utf-8?B?NVZoRUw4ODhFRTBhMHBNM0ZGdGFRUXlzK3VUdzNVdkM3YWRJVG55aS9qdU5t?=
 =?utf-8?B?ekhPUnl2cWJROUthT2d0eTNvcFpRSGRJOU9vTVhNeGF6QTg3d1dNbm9zUHdm?=
 =?utf-8?B?WG5iMnBiTXVOcTlZRUpVTUt5Zm8rblNidWZpdWZVWERUa09pNm1zdWlxY0hh?=
 =?utf-8?B?ZDhYZklYT3NpNlp3VFRFWkh3OEQra1huVkdaNnc4dElDV1lSaElHdTk3cU0r?=
 =?utf-8?B?ZWpkWkx1T2VvZVh3bDQ0YkRXdWxWL3Q4YXpVSkw3ZVhTUlhLdTd2TFEwM2xa?=
 =?utf-8?B?SjA4Zk5YNzdidGIrY2hkdDRLcTA0WXRiZmIxZEIvWkorL1BkT1FKclJzY3BK?=
 =?utf-8?B?YUNlUEJiNmwySTA0cTdOTlZybGNBT2d1M1NrTElIQW5TcTg0c3RyY1VOVlho?=
 =?utf-8?B?NDhoeWJ5QS9kVlNTYTBVZlF0NnYyWXF5TXpyRG1VUHhtZDB1bTlKTmFvd3V3?=
 =?utf-8?B?Qm9sVzBnYUJtbWt0Z1NKUjY5V2JyZDlhUk5SWE02VEJ2RUZaZUJ3enozNzha?=
 =?utf-8?B?dFBoL3c0bmptbzJzdkJ1LzNBQzBJcHpTN1pmbFVYQ01XSFZWUDdQRS9jdnVv?=
 =?utf-8?B?bEd3SHBmd09PZytHNVRmMGNPT2pYOUkvdzhodFo0QzFJYUNqd2J2eHFUYTZM?=
 =?utf-8?B?Y0ZPTzUzNEloNVdtdnlKeWpFQndkR29ubmNNc3ZsZk4vN3BReVZpRHduNit4?=
 =?utf-8?B?dUpoSjJ1YUhXeHdaMFhVaWFpNlNPNWtDNGpRME1CWk9rWkljMVdHWk1OV2xh?=
 =?utf-8?B?VnF2TTBWUTJYdXhPYmpkWUtJVUdCeTV3djlYd2dueTJTYW5SWUNzTE5zMFJZ?=
 =?utf-8?B?eVRzaUUwNnhhU2dpdVdxT1lsLzM0YXYzaXV5TVRkb0p4SWIzU1lwN0REQy9m?=
 =?utf-8?B?NGUrN21FN1VaWlR5RGRkUmQxS1BCRlQrMjRDQ1p3NU14WWFWOEdLeE04QVdF?=
 =?utf-8?B?T05FRHVTTi81UGl1NVdhQ252SkJXQlY0d0VpWEpDbmljR0ZaaWEwYUlYbnVw?=
 =?utf-8?B?cG41TDZGYVR1SFg2OHFDYjRNb1ZxOEdZVGgyVzNPMzJqcVY4TS9ZOVhqWkhh?=
 =?utf-8?B?UDJOY0ZJZzdJVm9hWFUwTDFvQWhPcjJKdmwvQmJnb0xhcVpLMzhod29UTVpr?=
 =?utf-8?Q?hlD77Z9YZA6NAz1Je6T2zlqK4SDv1eyW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHMxM0JFZFRDM3NFVTJsTWRucWlPNGRIN0MxcFFOQ3hrM0Fwbis4VWVSVFhu?=
 =?utf-8?B?cVk3Q21ZQ0g0Nk53K1phc1lvMmNza3RwZStlWHErQ1lvMGhROEpYWXQzdGh1?=
 =?utf-8?B?OXdxbE1hS0VndVlRUEZIR2tDR1crVFNoY0MwdndpSDBVNGJYTCtRem9tMXVO?=
 =?utf-8?B?N0tGeVBGMGQveE94b3l1eElpOFlyTkFuVjc2YUN4cWZoU29tdUlLZkY4VDls?=
 =?utf-8?B?dGJNMi8vYlBWRVFySllSZlFRbmdOS25KMktBTVA4MDdzdXlKNjNxb0oraFRZ?=
 =?utf-8?B?SWxGV0FRc09qanp5TW5XM0RQRWJUZUZkNEk4REJrR2hFN3JEbWxMb3JiOFR1?=
 =?utf-8?B?NDJya2RqVFEwS2tORzlGak5rc3NmVGt3dm1MUGtYZEtYbUwxcnFpKzMvMVJj?=
 =?utf-8?B?WkcrbktMUzIwVDdUQTdtTWh6UytITlRyV1dRVytwSmo3QTQ0SGc0b1pjYVhR?=
 =?utf-8?B?ejNJNGsxR2g3MzgzS0x1YlB6eDBicldQWC9LNlZhZmVKc1YrL3VJT2tENW1x?=
 =?utf-8?B?b3hDSHFHa0N1Z1daUUFlLzhIT04yeDVTTXh3YWhXVVJuUkNLRDNmYlcyWUps?=
 =?utf-8?B?YjVDcS82bnJtRUJZZ3pqWklXMEhJVGFKVWQ1eDRCaGdheEdrdVRGY1QvamQr?=
 =?utf-8?B?MENEWGl5bWtUN2h2Z24xTDdHZW9xSGdEd216dkNCTndPYjhqUFI3ZlprU1h5?=
 =?utf-8?B?SmNLMm1NZWJoRUMxR09VR1BoUmtFMHY0Z0Z2S2hhT2xTRStlMnliU2FwaWtp?=
 =?utf-8?B?eW1QYkZoeklIMERhd25PNENKTnREeDQ0b2tXdVhqb3k4SVZwNTlNci9FRzJS?=
 =?utf-8?B?RDVuOVhib1kwSTl5VnpiT2gySGhjK0ovbUg3L2RseHJDWU1RRDh0eXpxeWpL?=
 =?utf-8?B?dC9ETUFhT3lGMW5wbXY4cVl3Zkx1WFo1V1pvZTlJNERwaEF5NkpySVBrZjU2?=
 =?utf-8?B?RjV4NUpmTXczc3JhekZEVXp4T2NFVnF2bW1GZ3Y2VEtCdUFCM2thYWlSZytL?=
 =?utf-8?B?VUVlL2hiNEpzN09nTUhJOVc3SEVuL1dKZFFiaHFBOTFDaFZ6RVM2UFYyMVJL?=
 =?utf-8?B?RC9JRGhxYVNnRWdPclptR1BzQ3RPSlQvUlBsU1NOaDViWEo3TnhEVmpGMEdR?=
 =?utf-8?B?WFJTWEZCdjErbUdkQWlZQ0U0aTRuYTZZcElvVWxhNmUrNnNLMlpSZU92KzNo?=
 =?utf-8?B?K09hZXNJQW02cFc4cmxDQXdkN092ZkQ5U1czdXgrSkhCMGFpa3dCN0xMYXNI?=
 =?utf-8?B?RkF1aUVqVjh4ZFRyZUJsc29iMXJoUlNhbnJDMUppTkdQNS9RK2V3MjA3aFJI?=
 =?utf-8?B?MGs4akU5bzlvYXdCenRRZU9GazROYlYrREJ6RkhYK0RKWUpXQzc4UHBtM05j?=
 =?utf-8?B?d3dvcTlNK0NTMXlTbFQrRmg0Y2N2U0RFSzhiRlhROHV0STNlZlc2azdhd2h0?=
 =?utf-8?B?NTFVREVlVHBFOWlFNkpIWmFTZFgvK2lTSkZLWDJkdFQzR0ZKSytNdDY1YmVa?=
 =?utf-8?B?UjkxVUNSSEdMcGJ3VGduMVBwZWpmMGRSbXVFby81QXRpN2oyNXBoSFN2MHh1?=
 =?utf-8?B?SVlDR0VQTXFGcVBuWXJZRFg4RnlUYkdBUE9qTmYrWlZCeHFndy9DbFhqU2JS?=
 =?utf-8?B?eFVIZE16eW5maHFBUS82L21RVnEyVFBrSWtjNFhYTTJoTFRTOUdIRUlidkpD?=
 =?utf-8?B?bmJMakdmZzVSM3dBTUJSdGtMZDFFRVVsSGIxcFlzZlRqR3pQb09KbStwRmdz?=
 =?utf-8?B?WlplcWx4M0lXVnY0aXRIenFoS0xrWnJ0UW5SYks3WGRUT3dkZ25XdWY2OGVV?=
 =?utf-8?B?eERpL2VDTTRTUVFkbWlFbjFYWmpLaVd3NmgxQU5UcVgxZHJCTmFYanNxeFpK?=
 =?utf-8?B?RzI3bU9ZVWlIZVVWWEkyNUNPcHBSL2x1VUtIWTlMbGJFeG53THQ3WjB0SG9m?=
 =?utf-8?B?Tm05VDVXM0pmN3JVVjZNekV2WmtXLzdETFJMcU40U2lNam9UNWFzeE1zWTYz?=
 =?utf-8?B?OXpkWm1lYmxkWTdxNGk1aGxhWkJ4c0JzTzc5VVZzbXJGVllUUGU3T0t2WGVK?=
 =?utf-8?B?Umx4dHY0NGYwaSt1SnA0V1ZKSE5zK2J3YUxVRlBpdFA0WGpib1owdHo3S3U5?=
 =?utf-8?Q?Lw9Sa7L50l+8cTwJeBXFxq/ow?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df38a21-8d59-47a7-8a40-08de0bf17893
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 13:48:07.2268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5713U0KRGhpbw56KBCa9c6exSAx5U7HfaGcPqTj4SHN2+T7WRzvM4/pqKFkyWnJu/FQeTRkbLh7jBCncUPaFUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5176

And return from the function early if printf_info_one_json() returns error.

Reported by internal XenServer Coverity instance.

Fixes: f6c6f2679d49 ("libxl: Convert libxl__object_to_json() to json-c")
Signed-off-by: Roger Pau Monné <roger.pua@citrix.com>
---
 tools/xl/xl_info.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 2048669abbd4..696f1f7423cb 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -585,6 +585,8 @@ static void list_domains_details(const libxl_dominfo *info, int nb_domain)
 #ifdef HAVE_LIBJSONC
             json_object *jso_value;
             rc = printf_info_one_json(&jso_value, info[i].domid, &d_config);
+            if (rc)
+                goto out;
             json_object_array_add(jso, jso_value);
 #elif defined(HAVE_LIBYAJL)
             s = printf_info_one_json(hand, info[i].domid, &d_config);
-- 
2.51.0


