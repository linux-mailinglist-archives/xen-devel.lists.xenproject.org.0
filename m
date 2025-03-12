Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D80A5DA1C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 11:05:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910165.1316920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsIxL-00060w-Eo; Wed, 12 Mar 2025 10:04:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910165.1316920; Wed, 12 Mar 2025 10:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsIxL-0005y3-Bn; Wed, 12 Mar 2025 10:04:55 +0000
Received: by outflank-mailman (input) for mailman id 910165;
 Wed, 12 Mar 2025 10:04:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pbuB=V7=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tsIxJ-0005xx-9k
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 10:04:53 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f03029b-ff29-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 11:04:49 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS1PR03MB8216.eurprd03.prod.outlook.com (2603:10a6:20b:470::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 10:04:46 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 10:04:46 +0000
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
X-Inumbo-ID: 6f03029b-ff29-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bM4F1wFb3l0uPKTBQcJjVAiGdtwJNLxw6Ek+P/Oxupwov8NtwAwlkrFBkLdZFyOQWqqm4CHe4UnZcV9+K/zbBcb9IpGud5/fPl0ORQezjZ4i4hB/rLCuD8F5kir+fUEyVni5106yHIMSgWTRvwUM6FcMFo6L0Um/XqBT3rQ8tYJtgYWBRRE2ZkuWsqtjObvb2Td2tJgOOvbvLXRZ0919tz71U69P540GJDUvGHCvk/vc+qcANZJLgWwtafSj0IrBXoZmyIbAHLS17pWA+uixaltphnya3sdOMYXQnA/IgYtrfsJAIzY0CnKvS4K0arFTaYSO9atpLylaLV4YTmYl4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CcxKcv4E5l3ZKvy6K0qVPjENVxR8nE2gTmbnyncZ8k=;
 b=KdWhQCkhyLMdwyEl/EGH7mEddOotUnHq5Xw9C59/VhwFI6RQnCIYU4pa7Bs/TEidcEUyyZDX/IKEgk2NGyEWkrQjaLdB10blImqAF6Ji4Ay/B9zYAjTCwDyi1E6PqjXrBhwoxCxZ8EoyTio1fbSwBlZP4dpLNp6LVcg6ucA3sqJvhodJeicw60EXUBBRw1A47F4oV9iBbh9aLk5i/09hNTKa8jlSipidQYyDyx+IGO/oExz7twqHs3TUZtPwWMSXtd6xd24XjSPILJqWUC/hxVPyN8IdzpGCrHCuiKABG476GMVtCRue3rm75x0qYD573lvu9CLh/gETRfPRURbSsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CcxKcv4E5l3ZKvy6K0qVPjENVxR8nE2gTmbnyncZ8k=;
 b=bqy1fHT+GNZCI4Fq/ECzG7oPxMbOOGutButt7X4Js27QQcXbxZOKiI/b7CdIW/MjXvKDxysChvulPNPRKgwmo3X+GdvAHw4kr1M+VYEVsv4q8/DHr7/dDJvjCBw7M0cfERIVZ+DGbxEPuOJUUkOQeYsaHZaK8odgT3t43GNH2QwtR5pOk2TvtLamB84kTtkpFtMesJGM30XnjZHO2dD4av7saxNL6rvqX0d8VbXEBNH6uSlo6/zXwVuloIMsh/siLRrr4tJJcaxZDsF/lIfPq8eF4hXz8gwO5NK3VHNODdmyL3SCHanye7ZXa6a5V1aqvlhC18jYtl5X0NJiJ/jjvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <8eee73ab-31f0-4d0f-b7aa-d3de6d5aef59@epam.com>
Date: Wed, 12 Mar 2025 12:04:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] xen/arm: rcar4: add simple optimization to avoid
 ATU reprogramming
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1741596512.git.mykyta_poturai@epam.com>
 <e01e6aeba461001093b0da9af4c14b922049080a.1741596512.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <e01e6aeba461001093b0da9af4c14b922049080a.1741596512.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::14) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS1PR03MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: de1b8034-61ee-4ed3-8e8b-08dd614d5143
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WThqWUVVUmJ0MmtVc3lpd3lQR005OXZxZFF2VTNhejY3ZExhY244MWJFaFZ0?=
 =?utf-8?B?bWdSblE2ZjVCUFRBV0MxQnZXbG9PLzNqTS8ycVg4RnY0eHF4SFJ1d0Y2ZFlH?=
 =?utf-8?B?aWh3VlVzNTZ6NjVEN0drY3pLL0xURlJZaWdvRDlaNEFZa2UyVzhnbEpLSTMr?=
 =?utf-8?B?SDBRNTMxOUZwL3dWLzd5NFlQWlp5cTFCQ2JxeG16c04xZlJxbSt6THdpMldm?=
 =?utf-8?B?Zm9mQkl4T1FVdlVNTXBEMjB3QXlhaXptWng3MENSQmNYY0N3dzdESDBvTkd5?=
 =?utf-8?B?dXNoa0xiUHBobFp0R3RJdGpXcStsTkpKUXIwV2NXSEJrTk5mNGZQV3VwY0I3?=
 =?utf-8?B?V1RuU3AvcVg2SlZrWDhtblgzcjlNQmNKRklJaFlRM0p1Y0gxT01NT0JJcDdC?=
 =?utf-8?B?WjhFZmlEOVVkK0x6QTVsb0hFV3B5cWdIblFxdE5aYWI2YXNsdXYybkVsL0Ur?=
 =?utf-8?B?ME9rWDYrcVU3SFVPODlsbFdNUDdvTjdxRHFPZVZQU0FaZjc0YTNZWFZ3MHJR?=
 =?utf-8?B?N1MxZTR2S0VvQyswZW44Z2FDZDhoem9Rd25EZjIxWW84c3d1d1JZSjFzck1W?=
 =?utf-8?B?OG1PeDhCb1kwVCtDcERaS3dFZm5Vby9ZZFI3VzVNdnltTWdWRzF0OW5oeTBJ?=
 =?utf-8?B?TG5MWnhUYVphWUpkK3pnZFZWMnRsbEMrYWhET0pmSEtLVER5VXhrMWpkdjB1?=
 =?utf-8?B?QkladHBpcXN6cVZqM0hJNUFTenlsREhhNGtmRkFscEl6NHcxeUdqU2pRN1dE?=
 =?utf-8?B?VnArbFFUaHZTUzNqV0FUSElPenpscFhaQTRCc0xFRnhuMXBMQllyUVNWUmov?=
 =?utf-8?B?cE5sMXF3NGtWMk5IK0s2VnUxWUZmODZPdXNuclhsM3VyNkFhV3N1R2p0OVpa?=
 =?utf-8?B?bHozQVlSaC9vY2Rnc3ZKQnZqeG85TTA4T0NvZUhtNk84OHJYaWZ6VXVrMHVY?=
 =?utf-8?B?WW9aUlZZTDNpZWNSUEJCclJYMGxPLzlZSjFIdC92dkpaTjh1dVpaSHZDeU5N?=
 =?utf-8?B?aUdlZ0pKN0tzYXh6UWNRUEpkRzFKYW1WM21mNFFCRnBLSDlMbW5UdzhBbURj?=
 =?utf-8?B?Rm55dG9MejZBcXN6T1NZZlZqTTdFQ3FHdFYzSFJFY1d1VWtFb0tPSCszVmpl?=
 =?utf-8?B?WHp5VXNkTkw3bUZXUm0zbWo2bTAvSmV1RGFqTDk4elMwYTV6MVBUcHNBdUZW?=
 =?utf-8?B?UUtBYUliRnVlRHlEVHRGU1p4aWcrT0lhTk4xeC90d3I0NDNOb0N3WmRDK3RG?=
 =?utf-8?B?TzlEREpBU1BwbmQzZ2svQklUMVozbm5oVERvY2k2TXhlc3VVNlZFOUxYSEI2?=
 =?utf-8?B?YWxuNFJjdkUyNVUrK2JiWGduZ0JJUEhLbVpYQ2FjQjdEbDdXWGdlM2Vvbjhl?=
 =?utf-8?B?cEs3Wm51dTRkUnJ1ZHNvcDU2THU2cTZER1lmN0t2a3BrRTVHS0FUaUFJR2lu?=
 =?utf-8?B?YXBqQXQxYXgwdmliSDBwb0xZL2Q3aS9KY3Q0c05nZlA4cVgzbUVJK2FINGU5?=
 =?utf-8?B?UXZuaCtSbWNJY0lPbHdldjFCditCMDZ4WjhEclRQZUx2UWdkNVFXWTZMNVQw?=
 =?utf-8?B?R2NxaGczV0tpZWRDT2lGVHh3T0xyNUFTcFVTaU5pVFNINHlpa282dk1NRXdD?=
 =?utf-8?B?ZlRNc2x3NVg2dzNzODdXV3VWUkd3SDh0ZC8zWENnL1pjUXVrNUVJN0xsMy9H?=
 =?utf-8?B?MnVRRDYrMUFqZUxtb2ZVWXR4RXFneWlMM2ZNZ3JGRG90ZXFlTFljeCt3L3dH?=
 =?utf-8?B?VnlxNko4aTRSWldlQUdKbDF5SUtmcEZyWHRMWFg1dFVLWnVUOTRkRWJFRmdq?=
 =?utf-8?B?M0YyazBVaU5idUhIT21VQkVaLzV5MWZJMWsrS0xuR25xWmJUcTF0SXQ1SllV?=
 =?utf-8?Q?mIj7iAta5WlDJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU1xZTRSUzUvOXJHU2wxdHIyb1o1cnhXSkdaTHFmSnJTeFVuZjJOTHQyUENP?=
 =?utf-8?B?ZURJWE83RTZqbnIyN3luSmJlMU5sZVppMmZHVVJWV0VYSTU4eXRPcXR1ZG9K?=
 =?utf-8?B?emcxV3I3Z3lkOHhLTGNXbWNZZzBZeUYzNFo4bkpJMkZVT0ZlWTdwUVhqZW9x?=
 =?utf-8?B?Vkp0YzloOVFSWTc2Yy9BVm9PbU5pTjFmYitOTmZwMy9YVnFYcnkybnN2OFFJ?=
 =?utf-8?B?eU5RYmhQeFh1NUtia2RocUltTDRCbFZEdzRiTkVodTdacitpaVhWK2szTk1J?=
 =?utf-8?B?YVl5aDVVVDFFUXZGNGFmK0RQNlZTVWMvK0NFMzRyUjhlcFdlbzFRUUtRU2pH?=
 =?utf-8?B?RFBkUzZVYk1icks4cWpGYnpwd3NWMEU3OTBUd0swbmp5akFCbnJMd3V4YTRH?=
 =?utf-8?B?QTYrbG4reGEwdDVENjRpTEFJQmRReGYzRm5lTUl1TVUvdGxzNlV2c1lGWVlQ?=
 =?utf-8?B?TlZEMHI2TnZaTW1aVG9mVUpCdFhNYmp6S3dDNGVwQVBjbGZ3UXVxMGdTRTM1?=
 =?utf-8?B?V0FLc3d0WTRHTTVqQSs0WjE2TlhaZHU0NXhneWc5REwzZ0paNlU2VmRUVkVk?=
 =?utf-8?B?WVl5dnRYMlEyWHhjRDNKYTNQaTJsbnk2QVJNenJmVmwvdmw4ZFBwZWt0dTJ0?=
 =?utf-8?B?NnNGTWV3dDBUNGR5ZFNKUXJKVHBoSGVZZzh4cnZweWgwdWRGTnJZZVkxYmRp?=
 =?utf-8?B?T0t1R3lwRXZPM1RDanNpcXU5U01sWFM5V0lyWWI2R3JZVjdpRForSFNyUDRj?=
 =?utf-8?B?bVBtSnYrZ3BIMHlvMldhQXluZHB1aWl3MUt3OEkzWVliaHFuNDViV1lQOTZr?=
 =?utf-8?B?Mk1Pbkdhd1g1L29QN3FRcGxIWjZwZE9FWWp0anM0L1lCZzJKNlJxQkVCR2FR?=
 =?utf-8?B?dzlZbFFMblJkSFE1MEQ3UTdJRkdZUGtCOVF3QURHYXlFN3FoZmFlOFRkWUdM?=
 =?utf-8?B?OHFIelVIRWtLQ2tHRGozeWlaSGRwc2RwOXUwMHI4d0lxRHFBdTZDMENCaEhv?=
 =?utf-8?B?VDkwOTJOOGo0M0IyRkhja0Z0LzgrT3NHVFJaRysvV1d3OTVzSTQwUUhaRktM?=
 =?utf-8?B?c1FoUnJOa0oxSUVDYndjLzRKRHkrWTdxN0lEL0lFc05CRTNEN2t2aGRnUkJO?=
 =?utf-8?B?M2w5eENQd0lLcytsQzU1ZzBFeTNrdzdnY3VjdlJMTlZiNHVoUk5yYUlhYm00?=
 =?utf-8?B?dEs5TmVsNWE5QW5FQW9WRHlNeVJxKzRkUXNTbVpzYW5xbDMrQ2dHYnc2bjMx?=
 =?utf-8?B?UWpXcndvSDlxL1BFL0hyMnNoNFpSb2l2eWQ0S0liMzdSbmxibk93NHBjR1Nm?=
 =?utf-8?B?cm1LeHRvSWZoZFZGU3d0VHhXeERvZmJVUlFjMjlod0JSYTNVMXJpeXhrR1Nt?=
 =?utf-8?B?Y3NjQnFEUU1qdlVYNENFUVcwS1V0Q2c2Ym0xLzk4L0dJWkNhNm03RGwxQWxE?=
 =?utf-8?B?SVFmaWVoVlBCdFl0cXVMaXZ5WERQdmhoTlgwZkQ1aW5TMS9DQ2NteGlIVEZi?=
 =?utf-8?B?Q1poVXA4K0JhcG1OeWJ5bEJlTnRtekdzTGl4K3R4aTdHNDdWYVl3Y1VmMEE1?=
 =?utf-8?B?aTU1VGY1MEg4anJXaU5YcnZMY0kvMlZYY2J5Wng0Tm5TS1J1L3N2a0FqYzcw?=
 =?utf-8?B?N3hqUnpRK0VYaEhOZ0dFaVVrR0F1NGxTNEhGRXZHNjhGc1JLV2YwY0EveXRS?=
 =?utf-8?B?NjZBdVBseWFYWUlxVW0xQjkrSkNaMXZXaU5oaW4remtYTXpHdDhzblR4UzFT?=
 =?utf-8?B?aFpHbWJXdWVmeUwvMVJaam1SS3BKTWNWSTRyalBQc2V0ZjZjamNkdWwxK3FY?=
 =?utf-8?B?OEc4alc4SW5BQ2tTa1VnWXNOc3lsRkgrTk1YM1VPTmExUXArS0RqMTNoSk81?=
 =?utf-8?B?VFQxelVsK2UxcEl0VXovc1JKbUJEUENjd2FEcElEZHpJdnA2YlE2V1hlaHAv?=
 =?utf-8?B?cWI4UUpOeFoyV1pWOTIxRjhHQ0hya1NDT2NzYnM0ZDFrclAzY3I2ODFQOS9m?=
 =?utf-8?B?UlI1TGJSTVVNbzJqdHE1MDhlMXZPSldqeDFNY0lvdFliZHdPc2cxV1VzYU55?=
 =?utf-8?B?SFZvc3kwcWJZZDh5MGQwSmJ1dTRGbkJibnZNVGZDdm1hQnBYWFVYT3dCOWJU?=
 =?utf-8?B?dSsxbmVtR1M2M24xa05SSTdjaURIOWhTUk1xZ2VpVTd1RlNmOU04RkRQYWls?=
 =?utf-8?B?d2c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de1b8034-61ee-4ed3-8e8b-08dd614d5143
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 10:04:46.2827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UD2VomgrE+61KmtyncQu35SMhHZu2q6VG0LbXd3KQ9Eq33l+Qq5iUAVN3oYQWlD7SBNKVM5/smZZcS5DeO7Qz6a8+hp+9K0CLS3v+Ug3dws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR03MB8216



On 11.03.25 12:24, Mykyta Poturai wrote:
> From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> There are high chances that there will be a number of a consecutive
> accesses to configuration space of one device. To speed things up,
> we can program ATU only during first access.
> 
> This is mostly beneficial taking into account the previous patch that
> adds 1ms delay after ATU reprogramming.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v1->v2:
> * rebased
> ---
>   xen/arch/arm/pci/pci-designware.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/pci-designware.c b/xen/arch/arm/pci/pci-designware.c
> index def2c12d63..cec52cf81a 100644
> --- a/xen/arch/arm/pci/pci-designware.c
> +++ b/xen/arch/arm/pci/pci-designware.c
> @@ -272,6 +272,14 @@ static void dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci, int index,
>                                         int type, uint64_t cpu_addr,
>                                         uint64_t pci_addr, uint64_t size)
>   {

First, using (hiding) static var inside the function deserve big, fat comment on why and what.

> +    static uint64_t prev_addr = ~0;

Second, from an experience, static vars in functions is source of potential problems,
it's kinda land mines in code. For example, lets assume there are two pci_host_bridge
instances in Xen and they are accessed concurrently.

Best to get rid of static var here - may be move in pci_host_bridge, like cached_pci_addr? not sure

> +
> +    /* Simple optimization to not-program ATU for every transaction */
> +    if (prev_addr == pci_addr)
> +        return;
> +
> +    prev_addr = pci_addr;
> +
>       __dw_pcie_prog_outbound_atu(pci, 0, index, type,
>                                   cpu_addr, pci_addr, size);
>   }

BR,
-grygorii

