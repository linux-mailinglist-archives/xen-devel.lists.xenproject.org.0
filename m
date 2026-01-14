Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0169D1DB9B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 10:53:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202821.1518254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxYk-0008IV-Bb; Wed, 14 Jan 2026 09:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202821.1518254; Wed, 14 Jan 2026 09:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxYk-0008FO-8K; Wed, 14 Jan 2026 09:53:02 +0000
Received: by outflank-mailman (input) for mailman id 1202821;
 Wed, 14 Jan 2026 09:53:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=47rf=7T=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vfxYj-0008FI-51
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 09:53:01 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf0cd5c8-f12e-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 10:53:00 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by DS7PR03MB5653.namprd03.prod.outlook.com (2603:10b6:5:2c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 09:52:56 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 09:52:56 +0000
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
X-Inumbo-ID: cf0cd5c8-f12e-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eL8sfaoc7JCFAXcdY5LJMmL3uG8oQv7YjrdPR9PvRHJDKTfL7EyO4qimgsm1Tcn+VnLJJ6NUrM8MviD12dWhxYlUBTot2W1U5uA5yMYHkK15n/ZtpOmjN8oKOtN3gyq5itkWJKSnp6M47f6U5l5Jl4AJL3xEL1Dt2F4qroSiwKu7p3uEsnpz6AQWojTjPUCo5RgrDRc9wfS6Shntp57cRQ0k5oU7f0eZRwH0GX5t/s9lfWAt+fWsY2bphOnzNr7wMLZlIfCbvffIQnpbAo27CIII0KXl2MiDbTWsXTJmT8JqQia/V6h6eb/Lnk3wRAhWiIHS3/tRwDmw3DfAR9/9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQXsGox0J2nDQ7zGjOnmuQKu+/3lCfMKMolkWae8U/M=;
 b=G8svYoVxvAnJcl8ODA7MK3e1q1FL+LQ5Zc2SEQlZULGdHC7uIRqsxE8KCr0CFJ/gAAUH4vW/9gPmdiI3yZq9isr0tCCaIgpy92DaPxNJLo7juX5/mVgjSgMPdSGSZYjSYrNQpVUoHb+5ei6IrAWgG2MH2XqmxyOKd9QQKkZloJn94Ow0vXER5mj7Vxt0QP29qVxXCMxjfLx6/CHHaZPInICFKRKE4wyxmO88SohwPmkA8E7BZcrF+dyQ9QsAUCiFG+/e2ilvl2Rezp6qt8O06XZubQOvI8YSJrGnCZ9EKGRAIO3Z5gVzi0i/SA2ECoxjtBIC2/fbEOEkW9JUufpI9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQXsGox0J2nDQ7zGjOnmuQKu+/3lCfMKMolkWae8U/M=;
 b=0YZmyHPwHL5I3RSmdgu6/nWfxCTREtonx1IH+y5W3u8iuy9uFE5KjbQ/IxrwwzHMOTrz3EQvrjA3odq4nu0g3Mq4a+63tok7eMSPPNzgOJypt3sjwuJUX4hkLFcqOByCK3Wt5MGY2VUjy7U4bjxidlauKfSUND2rVuIFJfwpVTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 14 Jan 2026 10:52:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/5] x86/time: gtsc_to_gtime() is HVM-only
Message-ID: <aWdnR9YGrYSzj2fH@Mac.lan>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <79c32e1e-15d6-4b9a-9645-1429a21e63ec@suse.com>
 <aWdlSkpL-jR66Maa@Mac.lan>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWdlSkpL-jR66Maa@Mac.lan>
X-ClientProxiedBy: MA4P292CA0011.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|DS7PR03MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: 98beacda-1cde-4812-b8e5-08de5352a343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QURnR2NVN1Y3bFpYZ3V5RmdqdUFBQmhSN0oyZWJuN0k5aGVOdzhSWUlZZ09z?=
 =?utf-8?B?Rks3ZHdWMURCQ0JrV0ZneVdCa1RIN0R0Nk5MSGMreUZXcG1tM09HZDQ0S201?=
 =?utf-8?B?andlZEFxNzJwaWV0K3NLN3hzemlhMkhOWEtIdjRHL2JZSWVJdEMxNHNCVEox?=
 =?utf-8?B?bkVwaDZ5N3hEMk5VVHZ3eEVtQ01YWDd0QnVJcTVSTjJQSWVFTjF5cmVDKy92?=
 =?utf-8?B?UTlmV1VVZUlvaS9DeERLbTRyT3RwbDI0YzFPYllldWp4Nzc3T2tJQklmUnpl?=
 =?utf-8?B?Rkp5N0ZQNEpkNzdhbjJqY2FIbUUzQXo5N2FqZDA3VmtiakZVVXh4S0RTdFJF?=
 =?utf-8?B?WE1WaldHY09yRTN1MW4rTFZFYVYxTE5sczM5VWFBcCtBcG5vSEFjSyt4RUJZ?=
 =?utf-8?B?eHZoOUMxYkpxdGlKRUpwVXdwek1JTU1Fb0JmQ2lHcUQ0NG51T0RsNDBabXhQ?=
 =?utf-8?B?ZE9rMEY5Y2xDenkxei9PSCtqVnpkSzFzWGNoeEtUZ0RYL1p5U0lveENGaXhn?=
 =?utf-8?B?NUZ3UVY1cGw3WkZwczM4NGRoRzRMTXlueGVjVUtYQlpseTBDSXpHWVpJd2RD?=
 =?utf-8?B?TnNLVk1GaHJTd3dRM093TVYyWDNGUkpRcnpnNkN6eERHQ3FpRFlyTU91NVlz?=
 =?utf-8?B?eW90TnBXUWFIYTk0MU5la2dITE9hRC95VXoxNGhSNFA0Ynh3SlJvczJEQUE2?=
 =?utf-8?B?SmUxdEJCeEh6TmgrbmRSVzVpRHppZHNNSlh4LytnNTAzaGRJRm1Ccm9jaE9G?=
 =?utf-8?B?WjdodXBsaGR1NHFJUW9FdSs3QmtTbW5Td1JkajZEN2hLenFyV09mMk9CYlBy?=
 =?utf-8?B?QzQ0Nmd6WUo2Z3dVdkVBclVNcTBFMjBwY0g1UHpKRkx3WkVSMHhDOWtlUHd6?=
 =?utf-8?B?Vkd2endyWW1HcjVzaDFGK2l0d0Z2OEtOQnlhQXNyQ2x1L29aYkRuYXoyZFo0?=
 =?utf-8?B?RXhUcUxsLytYZVdlWnB1dFd1OWovMEF6a3pEQ0RNYUxMY0psUlBoamZrN1Qz?=
 =?utf-8?B?YnpvdmxTdXc4SmtFdXA3NVFLRXIyeUduZkF3OFFtV1dHdm5TRDJJUW9xd2Ni?=
 =?utf-8?B?TlI4ZUZ2emdMWTE4emVEUFdzV0Y2alVkWDJIcUN6anE5MDVWRDF2ckg3QWJM?=
 =?utf-8?B?SkQ1Zzl6WWk1L2I1Vk5TU0x6eHIvZU5sNzNFUDlNdlpFakJQUFhDc0R2SERK?=
 =?utf-8?B?SnphTklhZEFUZTVHcEYzbHMvR3gzbmRUNEN6RWJ1TGZ1SkVVd1pUT2hwSGZE?=
 =?utf-8?B?WkI1ZU9KWTNGS3dtUGl3TzhpMHVNelFJTzU5cElQalJOMEx0ZERJZ04ycHJ4?=
 =?utf-8?B?OW8zUVhHdU5DUjdvK29jYVZXTVJ6UzQ5WWlFNkhuVnUxQk5UQXhlTUpOUVJZ?=
 =?utf-8?B?akVJY2NDNFBjZnRMUER1Rjg1dVdDVDUwR2NYZmVjL212MHdLSThuSXFYZWgx?=
 =?utf-8?B?bFZUM3E0RXlaaTRQVWw1S0pGNDJ4VnZBemJtMGlnc1puSDJjckQ4RnMzMVdv?=
 =?utf-8?B?OE0zR01DY2t6MENHcVNMZnh1dFVUWEkrNEFpYVVCbHdORHZIWjBuRlN1UjZl?=
 =?utf-8?B?d0F4UDRybTVOWFpMbWU3Qng5cnZLNmxCcWdKcXBNaVlzYnRsejFZUDEyN0VK?=
 =?utf-8?B?d2tuT0xVT3JXTW9TaTErbUJySHJYZE5aMyt2eklEbEFvbktUNlVKRi9Rc2t5?=
 =?utf-8?B?eXM5dDIycEVLdVUrYlhkanZpZ2g1Q2Fzdmg4MkhMWVR1QkUwSy82dUJydk1P?=
 =?utf-8?B?MElDZlNBaWp3NlprYUgvcWtnRU4wSWpXRVhVcWJXNVpOWU9zUkRuMDR5b1VM?=
 =?utf-8?B?RHpZRFdnS3Q3b1U3Mm1zd1NqTWpNU25kSjloUktQaVJ3aVpVQnhBVEVYcW9a?=
 =?utf-8?B?L2dUdThWTDRvMGhuYUNEK0t4K2lHSTZ6aHhYTVJJdC9wU0lQV25tb1NWeHdx?=
 =?utf-8?Q?JA5ZjdG/FT3ddm8/V4Iv/tI6Og+XrLxM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUZOU0NOMUwxN0lhM0lYVWZpL1IvaitZZmR0bW0xQmVYM295YjV6UXVMWFp5?=
 =?utf-8?B?Y0tJeW5KZTc3Qk1abll5MU1QMGRQdk9kTEJXZ09McFY1ZmhFVzJ1dGlTTXFJ?=
 =?utf-8?B?N0lBR25iSXh6WHRnSExnamtiSm9zRmYxbjQzcjkyc1JjZVZpSzRTUTBSb0ly?=
 =?utf-8?B?UENmU01LRnZGRVFpNDNLRjZ1N2tZV091SHp0RzhqZGpUNWxlUzJqbkpyV2NG?=
 =?utf-8?B?SWFUQTk5TFEzc2kvNW9paitweWl2Ui9HV3ZDUFVFaTFHdWhGcFNtWURHdDM0?=
 =?utf-8?B?UU5pWS9HUDIyYVZraFpGNHRNMFNocjFTWnY4c0lmcDlLYjdaNzNWd0d0aWZk?=
 =?utf-8?B?ZWRRRXJTQzBMdE0ySW1YNDRHRnNiS3NaaHowRER2bWJHbVB6MmRSS1pZcHU0?=
 =?utf-8?B?TjlZY1lGa3pCbHhxazNSU3Q4cVI0TWJ2Z0V6SnZwTkpXR3dYY0RaTkRhWEJi?=
 =?utf-8?B?OCtsQm1BWXYyK0o4Y2NGc2t1eEFWRVRJajduNk4rdERCMW1NOGZtamgxd0Ro?=
 =?utf-8?B?T2JRRXozK3BZMHhFR042RzZ5MlRVdmg2QzBRM1JacnBGWUZGQ0R1NHJrWDBj?=
 =?utf-8?B?VVh1anFlMkV4NVl5Q0tNZEtzSTNGazh3ZzdzSlQ1UVhxek1vbVk0NVZ4eDdB?=
 =?utf-8?B?MjlwYUxEQ1hCT1VPdXUzZC9ZdVNWSWVvemtIRVkzQ2N2Q3QrbWdybTBGc1JO?=
 =?utf-8?B?SGtFRGRlTmRjMmlCc0g3MlBsSlZxRW50NFFiZnhNWVVvem1mdUV4YkhMczB0?=
 =?utf-8?B?ZkVZRGMyMVQ5d1JPWDN0dGwrSUd1TVdzcW1qTm9WY1crb0lYcE52S1Z2Tzg0?=
 =?utf-8?B?SVJOSlJrU3NlTkZJRFg5QU0yc2NOZ3VNS2hleWJkZk1NSW5KSUFLeE8vR1FY?=
 =?utf-8?B?T2RBdTBQRVBPWTdGczdNS1orZ0QyYkpQYkRaT25zMUhRUFFmYm5CVFhaRnJ5?=
 =?utf-8?B?TnY2czYyNmJlQ2UzV2t3NWZKbEZ6NTB6SC9PZ253ZzJjWkIyamEzdjZ3K0NE?=
 =?utf-8?B?VGEvOGhaWWlwODdBd1d3b3BqajBHbkR2UFJuVXo4d202bVVBa2FUSExDSklx?=
 =?utf-8?B?VktwUjhZa21jMStQZHRtMDJBSUdPWHhrTFdZQldHc3dFSmJQcWdOUXhjbFZV?=
 =?utf-8?B?Rld6cmdsMGFadFU1akxHd2drT0FMZmpsSUhKT1FTR0xnQWpzSzF5ZENQSHlx?=
 =?utf-8?B?SkdFY2I0akhSWlE2Y1JYMklaUjZsN1c2eThnOEN0Wnk2c3gySk5wbml4L2RB?=
 =?utf-8?B?bmtNKzBBNjFkSDJlcVIvQXh5M0NxNDQxTHRRWXUxNzVQQytGZTBRYkdWd2p4?=
 =?utf-8?B?VUU0NGkyZ3ArdWJVSE1aQVMxaTI4VGQ1UVhWditYNWtjMVQ0NTZkdDFVR0d4?=
 =?utf-8?B?YjNEdHZDU2x5U1hTbmwvVHVXZ3BKaUdPSlBvMm5FNm9RNEtRK21nRmwzVy80?=
 =?utf-8?B?OGowbyt3NWNyQTZuZkVPOXBpcnkrYVdMbEJ4enZqVDVXQ1pPVG53WDJubEJF?=
 =?utf-8?B?NzlteTNTUCs0R2NqZi9RcGJTbzRmMW9Ca0RpUTdITnZTVmVseDBpTG53QWVn?=
 =?utf-8?B?NHNYWDlhUFFQT25HN0RwSEpCOFBCdzZITUFGSE9ycHd1S0FyTk9lR2dkVmNQ?=
 =?utf-8?B?ODdnSHRRNGRJTkY5MEJMSTJ3VVR6OTBmNkJyRVptajQ0V0F6SjJlTFlQa3Fk?=
 =?utf-8?B?dmJXeVY5RzBTcGxPclcrOUNuaWgzaTBmTVZOZ0lDVllWdys0OUgxQndlQUdZ?=
 =?utf-8?B?dkJKWFl1VVpURHVBdlQxUWdYekZqRE1SOE5hRUt3dWx6MnlobGhVcUZSUm1N?=
 =?utf-8?B?Y2lYU3JNbHhCQjFMQWZaNDE1ZWlKNmsxVklPMXhIUXFGS3B5N1drdk9qdGpk?=
 =?utf-8?B?b2xLRFN3bExtTk5LSzBqMFNEUDc1ZW1YZFF1YTdtTlgyZjR6MGlDQm1JQVFI?=
 =?utf-8?B?cDhHbkg1cHcyenhhOHpERzBNZHZSVGZQbDhJcDBDVE1vR3YwTlJ5bkpFalF6?=
 =?utf-8?B?NGJ4QkdlTGhsMkkwa1VCQ3RKTEVuS1YvdXQ2ZmpXQi9SQjI0NldvVUwzcjFV?=
 =?utf-8?B?aGZqRC95ZVpqZk8xNzhVNzFwdTZwM1p1UFd1clFNamlyc2JlcGZFWXJKaUNU?=
 =?utf-8?B?VGJraVY1R05HbFVLcEpidDNCZnpHNGRhNDA0R0xwZTJpTDQvTGU2czduNUlh?=
 =?utf-8?B?Umo0YkUwUEtKbEo2TndmT3d1RXFLUGNqVnBIU0d2N1FiQnJDT2VUK3VmVjcy?=
 =?utf-8?B?NmY2VXQvQjlNcnEwa1RoMTB1am1HSmtDWjJ0amlwTnhqdnFzTjVQZWk0NkVS?=
 =?utf-8?B?T2o3S3hYcndoanBRc3VZRzIzQ0F4VUhJaHd5QlA0U2JVSWNtazJuUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98beacda-1cde-4812-b8e5-08de5352a343
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 09:52:56.1284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJORWIOF0KvyEOTFjXaA5F7tkRgSpfQxFTY2xCCa+aOiulGf+X3g/fRMpIgz9f1T53EvlQ7EdhVG/xY0iBCLKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5653

On Wed, Jan 14, 2026 at 10:43:38AM +0100, Roger Pau Monné wrote:
> On Tue, Jan 06, 2026 at 02:59:43PM +0100, Jan Beulich wrote:
> > Omit the function when HVM=n. With that the !HVM logic can also go away;
> > leave an assertion.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > --- a/xen/arch/x86/time.c
> > +++ b/xen/arch/x86/time.c
> > @@ -2840,14 +2840,13 @@ uint64_t gtime_to_gtsc(const struct doma
> >      return scale_delta(time, &d->arch.ns_to_vtsc);
> >  }
> >  
> > +#ifdef CONFIG_HVM
> >  uint64_t gtsc_to_gtime(const struct domain *d, uint64_t tsc)
> >  {
> > -    u64 time = scale_delta(tsc, &d->arch.vtsc_to_ns);
> > -
> > -    if ( !is_hvm_domain(d) )
> > -        time += d->arch.vtsc_offset;
> > -    return time;
> > +    ASSERT(is_hvm_domain(d));
> > +    return scale_delta(tsc, &d->arch.vtsc_to_ns);
> >  }
> > +#endif /* CONFIG_HVM */
> 
> Seeing this is solely used by the vlapic code, did you consider
> keeping scale_delta() non-static, and then moving gtsc_to_gtime() into
> vlapic.c?
> 
> It would result in less ifdefery overall.

I see now this might not be appropriate, gtsc_to_gtime() is the pair
to gtime_to_gtsc(), which is used in other places.  It looks like
gtsc_to_gtime() could also gain users in order parts of the code, and
hence making static to vlapic might not be the best approach.

I'm not overly happy with adding more ifdefary to time.c, and the
asymmetry this creates with PV guest not having a gtsc_to_gtime(), but
it's otherwise dead code, so:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

