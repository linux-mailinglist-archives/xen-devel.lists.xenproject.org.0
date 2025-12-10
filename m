Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E45CB29D3
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 10:58:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182762.1505603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTGxH-000236-RD; Wed, 10 Dec 2025 09:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182762.1505603; Wed, 10 Dec 2025 09:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTGxH-0001zv-NG; Wed, 10 Dec 2025 09:57:55 +0000
Received: by outflank-mailman (input) for mailman id 1182762;
 Wed, 10 Dec 2025 09:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c2u0=6Q=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vTGxG-0001qV-01
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 09:57:54 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b14eaa58-d5ae-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 10:57:53 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by CY1PR03MB8124.namprd03.prod.outlook.com (2603:10b6:930:105::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Wed, 10 Dec
 2025 09:57:50 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 09:57:50 +0000
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
X-Inumbo-ID: b14eaa58-d5ae-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aql1VhiNEzRmCejp3igIZ7Dg2vKSQuIiAj86asQPsewnojB4Wa/m6PK23jADwr16WkGjd8IFIvOLyndci9rv8q8kfrfbK1d8ErrhNAHPLx0YR1ey1950lk4hsjKGtH9FW3AIi5AECg7kTgsFJfj081Czf6w1/8savxhfvIQn6ACR1PldUlN2U+K4hKUedOarXOn+TCF7TLrKr0ta3+oEtLzzx79Hww0E1+OK9QQO54TZyR8xicXcFlWrHE25VWB5S3R0dywNtxLFTIUYdgoWsI46NiHoz6KFeRRzB20Ikkb/v8vkJqUrvf+OC+XWFnj6nzEGHSsM7tu4D/9b3ZY4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqW4FUxlfyINIX81hhhWKbnw+XsY3GcuwIXW3aC20cs=;
 b=fy0a7nwtmjfQtsxaLNC6qFylmXLzkz60q5X7WNJAWpwaSRhCN7+OZqTlAK0wyW3gzOVJVi2GXDGjblVLURoptxSREq3DI1WcM/jcJufAJ7jzrKf+M6N4LNscXxtVz7EKPPuhxQuTvSJ2oyU2Xy9q/o7Ufvk8tIdN8SbTggAHIFy9Lx+hpEp5kPypP5Sg3Elvc8EVfq651grc6czqkfE6h/q9BdL5M6xtNq3ph+7fjOPhYZoDT8KNNHbubWthUPDLmlfmGNw9T+UhGHMrMLn4hMkzIE1UH1E31r8sPCG8TqXVQBK6Nm+NjO9J7ngMuQNaQlD+TDeKTTg6zf/+guPvhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqW4FUxlfyINIX81hhhWKbnw+XsY3GcuwIXW3aC20cs=;
 b=CNfAZXdC8njk3rkT4MV5XC/KTFZYs91W/HAto3Tym8kfa9/cORqotKirX4W72CZbKuRIVHkcCm7TYkgEkUJIb7HamKyz3c24JrTQSnBejQQro5sWY7hflkQK4HaRDztcAXaJ1JfGT7op2eHM+XfA+2M+XJZ1M+FhRKseuB3vwiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 10 Dec 2025 10:57:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v3 7/8] x86/mm: update log-dirty bitmap when manipulating
 P2M
Message-ID: <aTlEGeUzGFX4b2Aa@Mac.lan>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
 <d47d01dd-0289-370d-7b5e-bd80f9e0a911@suse.com>
 <aTlAnH7bei04azol@Mac.lan>
 <2341ab2f-f185-4bdb-b851-5a19a820b02e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2341ab2f-f185-4bdb-b851-5a19a820b02e@suse.com>
X-ClientProxiedBy: PAZP264CA0254.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:239::20) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|CY1PR03MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: db04da6e-56e9-4f6e-4d73-08de37d29437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTM1T3Zpd1JBWERraVhRR2VBa1FwVE5zMllDM2duYjhPQitnTUI0YklVK2p4?=
 =?utf-8?B?V1BkdVFoZkFEZ1NlOVA5MnhWVTJ2MEZsZEJxVTc1ZERIMXdXSzNtUmxRMndi?=
 =?utf-8?B?MWV4d0lGWXhZOFJBSzFHanRYeEhsMTU0ZmgzOFNDSkdnTWttSng2L01aWDFr?=
 =?utf-8?B?K0tMUmJhelM0T2c2TzhUSFJUWnRQQ0l0TWpDMVV5UU54VFlVeWdCUGwySGM0?=
 =?utf-8?B?SGJEdWxRRnF4NzR3cjY4TlZNL2diQXZTQjgrSlVwdWZ2TjdqSzBpK2l0RGNo?=
 =?utf-8?B?eVZ3Z0pGdUt0djEwdlhCK2tOZFFVWGFzMVpTSVVRMzh3ekc3NGFJTndpam1V?=
 =?utf-8?B?a0xoeHNCZDB5SjZaVmduVzlGZmpyV0JqSnB1VkIxeHFQdmlWV2xMdGU1RTFN?=
 =?utf-8?B?NmUxVkVEb3ZFNWUrTmxSdlhZUkI0NFJib0YvSysxdy84WjdMaW1tTFdLbFNX?=
 =?utf-8?B?OXY4ai9VamdJaHBMUzAxY2I4MnNWUnhDVHJITmV0Y1VUZDBMRFNKUkVSNXYx?=
 =?utf-8?B?Nkdyc3p3TWcyRG5ZSWxZVXh2YXk2QmcxeDA3dUprWkJYOHVqU3o2YVpUOTlD?=
 =?utf-8?B?WWVDMlpSKzVwbnZPV1laRWxFR2Rady85U0VXSXhqRmZ2am1RbFR2QU1hOGl2?=
 =?utf-8?B?V3l1dk9jemMrQjVXdklGVVhraUtmdmlwZ1VKdFFYZ3FzdHVnOEh6ZHJic05E?=
 =?utf-8?B?SjJhQklMRFZyR2FjR1NJRmFPdWVEM1d3RnJBcE5peTJEdmRzNTVEdDJkMjVu?=
 =?utf-8?B?K0wwZzVIOHpITDVtRDVkZ3FtcmV6NjVUTkZhZG9uY2xOL1JkazZTb21EUDVI?=
 =?utf-8?B?VHRFbVlJY1MvZk9uU1VzaDJ3djlvOFo1ZzlRbkJhZUJyMDFWWTE3SVR4Z25x?=
 =?utf-8?B?L1pRYkQ1ZHFLRjdnaGljTzFEQnFDNTMyYXpkb3p6cEZnQlRQOHpEUkRlYXhS?=
 =?utf-8?B?Y05ZNWY0NHVEOGZSSmNFQVIremFJaEQ1bko2MG1CdUVhMHYvMmh0WWs4QkdJ?=
 =?utf-8?B?MHovMVRQVUVsellKR205Q0RWUy93OE4wb3VrVDZjOU1HRnpYajVUamhob3BV?=
 =?utf-8?B?UXVyUmZlQVAxai9SSUw1Rkx1djlTa3VpYThnWlc0S1NiTGpGb1c1WjZQTk8z?=
 =?utf-8?B?blk4WVBkalN3clBXejJtYWRSSjYrUzNlR29kTWtrdk0zdXIvOVJXanNnWVh4?=
 =?utf-8?B?aStpT1ZlQ3VPMGhyNjg0cFphRFJFWVlHeWlRRVRhV29INWt2YnZGNnJuWS9P?=
 =?utf-8?B?MXl6OWFzMDJQZWZ3MDJjYkI5TlgrOXFqaUR6ZzFwektJemdzOHBadFNRUEJt?=
 =?utf-8?B?UEVENEVJZUw3VVdvYTZFd0t1TkdTdzY3aUlPd0dnTmE0ZjNPdVVpbVZJc0Vt?=
 =?utf-8?B?bVBlSXIzOGpxTnJuNDhaUzFvdm5MMnVDY1BSazBCM043UWIrOEhQcXhlUWsw?=
 =?utf-8?B?TWlHb0J6K0tWNkJwSUNnTE1vTzcveGxQeWUwL1lKMVBvRU8yQzZUM0dRcmZq?=
 =?utf-8?B?ZXdHcVNSYnZVeXlBUWI5WUs1enJqeGxRN3RCZXA0UjF1TjlPNTBRWlFCQVVa?=
 =?utf-8?B?NyttRDNzSzk0MEZTeEk4dXlpaGQ0K1h5S0ttTHA4N0cwNjlYWkVxYlFKWksx?=
 =?utf-8?B?NUsyKzFjblRqdXRDWlczVlYyZ2VpY1F4a1FKUitEK3RXN3JYV3ZXSkZOd2g1?=
 =?utf-8?B?b0xRWDhtMmJNOWVYZUFFSlhPYTBERUlPalVvSW5qdGErWHk5SlhzWUZKL2Z4?=
 =?utf-8?B?OU9OdWhPY29UL2Rtdng2YnRhZmFpTENZaTVEWnlYdHMwYStYR1I3Q3J6QTk5?=
 =?utf-8?B?cnBjdEUrcHNSV1d5d3dUSmkvVGJaWTh2QU1NV2ZVM3Y1RUdjbE4rdTVETGpJ?=
 =?utf-8?B?aFBzME01SXVlaTBBanFQaDhEUVZuQVZXakhqSmtKWnRaeEpFUmxiYjVzU081?=
 =?utf-8?Q?5hSnmmKe9BIde7cHL0Oi1BFZD/w0b5ON?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTlzMjdtWmt1b2VsTXhKZWh2RGV1YnBXazFZa01JWFZNTFphOU9JakFBQVd5?=
 =?utf-8?B?bjQzTnd6bVJtUU9iY0F1TjNNa0pKSTZLSC96RDN1elMwU2EwelRCanJUOHBn?=
 =?utf-8?B?Qlp3YXN2SDN6U1dyYm5wMng0aWgzNUZiaWczU0J0bEQ4R0ZudTVCZ3FzbDh1?=
 =?utf-8?B?dkpUNnU2UkJ0dEhWY0pSelF4dnkyL0ZBMGRzSU90ajRHSzZnL2hDMktDcHUr?=
 =?utf-8?B?bnJLOXhIVi92UnhnMVlNSUhzRjI3RzlyOFFEMGJqK2ZRbnd0WkhDM0NVZ3BG?=
 =?utf-8?B?VUVpV1IvM3VLTkttM2xucmVmQnpady9IZm9XSnlBcW5oUFJObzZVNWlJM1Nt?=
 =?utf-8?B?eXVIUHZHRlBXQitYOEJlL05EMUxHTEx3WGVWSWNFYmxUUjJRM2hZcDZkTVhp?=
 =?utf-8?B?ZVY5QVh6WDlJTmY4OFByUWhBb2wyL0o0UGxKc3Y0a2o5VnIyMUZidVNDZnRh?=
 =?utf-8?B?bUdtOUJ5VTZJTUEyYTdsaktIVCttWEV5K2ZoOU1UZHl6UElOUERjRkZaRllN?=
 =?utf-8?B?d0l4UVp1M2pxSEIrbnBJcDBkRjBGR0FkUllKRVFqR2w5Y0M1OXRWcWJLbTMv?=
 =?utf-8?B?bm10bDZmT3ZTNWZ3MTk3aGhCU1JCRkJEOFFXcmhDOGVnOTZyWkRvRnVkV1VL?=
 =?utf-8?B?am51OC9QdnZRL3d2TnpaS1Iwd1ZVSi95aUQzeTNLME5wSjVaZDBGZ21MTjFr?=
 =?utf-8?B?MnNpc00waXJTYlBub0RmeG82SVVEV3M2bllsU2o3SW1naldQK2JTMUUva0tI?=
 =?utf-8?B?aGY3Nnd1djRFUGthMGQ0QUlkektsRlFQYkJBY0Y1N3ozMnprazNLZ3hhQy94?=
 =?utf-8?B?ZUdHOGl2eFVZRWZERUw0QUdMOTNZU092eFo4MUxpbkdFeVFDbEZ0Mkc0L0xO?=
 =?utf-8?B?QjZDcUhnZExkYjh3b1Zxd25FYTlsY0lONHRhVko3QVoyeWloT0NzMGlIVGIx?=
 =?utf-8?B?aHZnOUtxaG5vZ242YjE4NElVWnNFd1FIWnh3bnZJc29uNElnaHBxOWdJNXEr?=
 =?utf-8?B?Y2ZRSmJCdEpXZGpzRG9sbXVHZytZZ05pSzY1NXNEYm1qNXMySHNRcmRzMVNE?=
 =?utf-8?B?OVRIZFhQd0M1Q281bEJiU252SHRURzgxd2IrZEhRYWFtT1RHcC9Ca0dBNVpE?=
 =?utf-8?B?USs0bWIydEtIR29QdTRoVE9pWjV2dEkxbFI4ZG5rK21RZDhoT0pSSTVDQUJ3?=
 =?utf-8?B?V0NmMVo2b2tQNDlDb0tlNzZXcytDdG1TMWxoVjc2WXVFV3h1b2tCUmRBNXlD?=
 =?utf-8?B?bk8yYm1LV2E2Q2hrZnVhVkxFanI2bXRyVHVyMUE1Y3lleU56bCtjYXZNMm1S?=
 =?utf-8?B?WXRLbEEyUVQwbnVSbG10a044Vk51N2JYSCtFWWVXcnJZcUkxQjN1RWtIaG1O?=
 =?utf-8?B?cndLdXpWT2oxcDJ2N1d2U093bHk4NG5vd2ZzWHpsNjk2YkJMZzdjcXRDc3NB?=
 =?utf-8?B?c04wenhkTVRLdk9iUE9pdjZNRFJUb0FSNUd1M3MybVV1UEFVVFo2VG85NEtQ?=
 =?utf-8?B?NHF5UkdvZmhKKzcrVjc3b3gyNjdhNjh1V2x6cFdQMW9MMXdWYVBicGdyQTA5?=
 =?utf-8?B?ek1XS0l1eVdZUVRlY1dCanhxNkZKQzZZSk9tSkQwN21zeDJIeE1YcVpPbm1u?=
 =?utf-8?B?YWVIOWFYdTg5Q0JMWWszcWtIcVpmQzE3eFR1NFhvUE1LWmJJTzV3MFk3Y1Fv?=
 =?utf-8?B?dXFwVXY4TDlJeThrZmIzQ2xxU3JoZVlRMWpVUUwyZGorK0NLWVhQRDloMVdB?=
 =?utf-8?B?cW9nUGsvYVZ2VnBWR09yYUlTUk5sMHIrVVlSMnpPazA2alEwRGFsM2lMaHdB?=
 =?utf-8?B?Y0V3aUJ6UWZhOFlOdEY4YnIvdUpIbkt6SktheXdwVTBiVTc2KzUzSXpvUXh0?=
 =?utf-8?B?Qk9mMmd2RGVzQWEwKzFNZkJnQlRBVks4QnhIbjdnWWgrUHZ1NnRvc0RneFBV?=
 =?utf-8?B?MzhMTlJ4WTdZT29yaWRwRDh5eHNJYlhBMmJyejF2YzQwK3RrckdqSmpiMFdz?=
 =?utf-8?B?azhHSVlEMTBHZnpaWmpFOW1qc0RFUFNxZjBac0dUM2dvSVQ4eWdnalBrZ3Fy?=
 =?utf-8?B?cm1iSXZ5dnhBZDAxeEdhdTdwWXJOQUpDQVQxRnppS2dBRk14a2NjOCs2b2Z3?=
 =?utf-8?Q?FN/VIwqSRDFK1vOOWbMqppyzA?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db04da6e-56e9-4f6e-4d73-08de37d29437
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 09:57:50.4658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6TXCOCSvdEgGDkc8tVAMZIPkjJTgMQCKV9+/ZsBHc8pBbJKyptyfJdCijcDEgYir54AcsRlDgqnFKyVZ6WVkrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB8124

On Wed, Dec 10, 2025 at 10:55:50AM +0100, Jan Beulich wrote:
> On 10.12.2025 10:42, Roger Pau Monné wrote:
> > On Tue, Apr 26, 2022 at 12:26:10PM +0200, Jan Beulich wrote:
> >> Just like for PV guests MMU_MACHPHYS_UPDATE implies marking of the
> >> respective page as dirty, additions to a HVM guest's P2M should do so.
> >>
> >> For HVM the opposite is also true: Pages being removed from the P2M are
> >> no longer dirty at their prior GFN; there's no point in telling the tool
> >> stack to try and copy that page, when this will fail anyway (until
> >> perhaps a new page gets placed there). Introduce paging_mark_pfn_clean()
> >> (intentionally without a paging_mark_clean() counterpart) to handle
> >> this. Note that while there is an earlier call to set_gpfn_from_mfn() in
> >> guest_physmap_add_entry(), but there's little reason to mark the page
> >> clean there when later in the function it'll be marked dirty. This is
> >> even more so given that at this point it's only the M2P that gets
> >> updated, with the P2M still left unchanged.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> --- a/xen/arch/x86/mm/paging.c
> >> +++ b/xen/arch/x86/mm/paging.c
> >> @@ -260,7 +260,7 @@ static int paging_log_dirty_disable(stru
> >>  }
> >>  
> >>  /* Mark a page as dirty, with taking guest pfn as parameter */
> >> -void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn)
> >> +static void mark_pfn_dirty(struct domain *d, pfn_t pfn, bool dirty)
> > 
> > Nit: set_pfn_logdirty() or similar?  The function name makes it look like
> > it's marking the pfn as dirty (when it's also used to clear it).
> > 
> > No strong opinion, it just seems to me the name is slightly confusing.
> 
> Changed. While making the change I noticed that I had one other change in
> there for a possible v4. This is the extra hunk:
> 
> @@ -260,7 +260,7 @@ void paging_mark_pfn_dirty(struct domain
>          return;
>  
>      /* Shared MFNs should NEVER be marked dirty */
> -    BUG_ON(paging_mode_translate(d) && SHARED_M2P(pfn_x(pfn)));
> +    BUG_ON(dirty && paging_mode_translate(d) && SHARED_M2P(pfn_x(pfn)));
>  
>      /*
>       * Values with the MSB set denote MFNs that aren't really part of the
> 
> I hope that won't invalidate your R-b.

No, that's fine, please keep the RB.

Thanks, Roger.

