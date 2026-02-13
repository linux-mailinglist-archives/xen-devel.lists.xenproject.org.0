Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iE0qKBXtjmk5GAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:21:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15660134654
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:21:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230369.1535854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpMT-0005Um-9F; Fri, 13 Feb 2026 09:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230369.1535854; Fri, 13 Feb 2026 09:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpMT-0005TD-6L; Fri, 13 Feb 2026 09:21:17 +0000
Received: by outflank-mailman (input) for mailman id 1230369;
 Fri, 13 Feb 2026 09:21:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqpMR-0005Sy-FL
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 09:21:15 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50e79cc2-08bd-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 10:21:03 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN2PR03MB5151.namprd03.prod.outlook.com (2603:10b6:208:1ab::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 09:21:00 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 09:21:00 +0000
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
X-Inumbo-ID: 50e79cc2-08bd-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOLE41X8UKbUT1DP3y0KXD10N36nnwCpo7YIS5F0sMAj6g8SUBBfUOR+vPOEz+fme2cWYWuhbuPo1ib+ShVb8w7m/VhHj1HRbezL+a2lN3+pQMbVMYBGfkKorVh3iKrZ61hLDohetTJl2H1DKwgaAWQSqUrZwS9ijrF4lJYUCyF4o3O7W0tV0MF/1HyRX1uOGpU9ZnRaR4XZwxN5i3tcZSrFO1OOlVNqaxSJbR3m4Qqd7gUgATqsmIYcMLyMAuLG9N3YBF10v5iKbMXI4zbALMG8cx0Rz6Z0qdXsY4m2Ghk27Cumwapzja8uWUFNpKWDda8ZN8E1lGB1jUhGvVVPOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJYbYyKldCsd05Z1aVUDZ0Q4DFlyKL6R/ype5LiatdM=;
 b=XL43yFMzUmfuNl83Y30EGXot8PX3CXp70Ph2IJFQjbMwkCC56bMcu4VrcfSSpLugq68vXouSR0aQNnKk09QRske+e4YDwLO75UGga/fCUzPmZXR0oJZgGghy+8AO0TL8EGXs44rYxNDREfs8g6I/Pw9gWWDJljLLt5QqaPf4tOZV8BsDL+TEUE5nIK+cUJuqKug2WsyAw8TKcPYY6HdC9vQGYckIjMuzlYblLLygnMyI3XjCMGy7DcjyuGDyugLObiM8Y7QnNZ6qQvZ9WouGbsGw/Llq/EL6fR4LD3zebdHLoebMylkQCvGjvFZUEt3kNYxAdHf+yuRfgZcbyUiw7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJYbYyKldCsd05Z1aVUDZ0Q4DFlyKL6R/ype5LiatdM=;
 b=z6SRGLiZ/sw6xDHfhyjyccwLmnei7GI4GeuCdynrCszNQ37LhX3wvmHBpRZNlHdvJvlwUxX2ZEcMuhM2V+oQwZUSFxC6gTfQkJa7XgMx/4JyOZqilvG4invVXpl8PwIH7cvHXVT0WHdwyLDDPoms7wMJKTP7h/iG/2NC6jatQiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Feb 2026 10:20:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/5] darwin: expand cross-builds to also support x86
 and testing
Message-ID: <aY7s-SFbVcGgvVX9@Mac.lan>
References: <20260212144618.43200-1-roger.pau@citrix.com>
 <61a3f852-915c-4d9f-8dde-01d000aa4fe7@citrix.com>
 <1a98f22d-ef9e-4df2-aa87-585713cd3989@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1a98f22d-ef9e-4df2-aa87-585713cd3989@suse.com>
X-ClientProxiedBy: MA4P292CA0008.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN2PR03MB5151:EE_
X-MS-Office365-Filtering-Correlation-Id: 7854f834-f0a0-4f4b-6e41-08de6ae13389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnUyeS9hN0pFQThhMGJOeGhjZWJ2a2lvV0t0cjhwYzFWWnZ4S0xNd2RTdWh3?=
 =?utf-8?B?Wi9ESWh4Wm5ucTFJWXJjVnlMSUQrbjVPQ2NrZmVaUlhHcGljN2JOUitTcXhW?=
 =?utf-8?B?L21HcXA0QmU3eUFUeXN5TnlNUHJpc0tjM0JxbW5TcUJYWkp1b2REeVZ4ZVFs?=
 =?utf-8?B?LzNrdTA0empYNnRQTXBicEs0eWpTYkR0bXRjZWNBYTBlbURVTS9pbEhPL2k5?=
 =?utf-8?B?dHVvdGsxb1prM25OSVVXYjZXZVdtRjdWaFFjeXlYTzl4aXYzQzRSZUd5UWZw?=
 =?utf-8?B?bTJWdU96akRCS0w5WTlZVWpoNEpqUkZTcWQ1UDY2czBBNWtLN1pmNnBuYjd4?=
 =?utf-8?B?NFhiYUZzQ2gxajduNXU4L0NVUFNZUWlyQklTU1ZvS2ZXSmZmd1EyMitFUUpN?=
 =?utf-8?B?Y1FNVzZXdDQ2VXVmMGt2VnNqZVpRNkxsSHl6d0tZUEhKNE9HWHk2MlJCSnJY?=
 =?utf-8?B?TExHY1JXM2R4czZnUkNUQTFYOGlFQnNXL0VrVVBHUWhzTlZYYUN6eER5eG5m?=
 =?utf-8?B?YWhyejhNSjdGdEkwVDdtbVgrb0pnSTlCNmxFaS8vcys3SHMyT08vbTFKVmxj?=
 =?utf-8?B?MEZuRGRWdlZNNGY3Rk8yQTJJY0RuWG0xUjY4dDdJajRTNFNpazBkcEtqaHd0?=
 =?utf-8?B?ZDM3K0IyZ3M3V2l0WG1xUERxcjFaNlcrbFNhZ2RjdGJTL0JzNFZkb25RVmtI?=
 =?utf-8?B?YkVQbTJjMzdxVUw3ZDBaamdWVThTWFIxdVRVY1U5Y2VOZ1l2N3kvbmxYWlhF?=
 =?utf-8?B?OG4vOEg5dTJBZlBUYWNDeWdiNkhyQ1JROVZjeFVGV3c4MG9QOWlHcGpBS2Rv?=
 =?utf-8?B?VWJYS1V5K2tEWTh1UGlkeEJYZjVyYUJOU0tVWmZIVkFPb051bDdPaDV1Q2F1?=
 =?utf-8?B?bTNpZk5VZDFvN1ROSWRrLzcrUDc1UVZRVzlBdXRSd200c0g5d3RxbmRGam1E?=
 =?utf-8?B?TG9UUEc2dS9DRTVGN2dxcWNFaEJwYk1PenViN3E1NXhTWkVoaHpzSFZrVlpq?=
 =?utf-8?B?TVU5TStMWHNmWUxOQU1sY01Vb0lQb1VpOE4rZUVoOWtBWEVrSnJ1RnlDSE83?=
 =?utf-8?B?OUg2K0wrSGhxclZ2R0pZQ1dtRlhOYWQreGVTaHVUSW5kMExLSkxuaHZVQ3VI?=
 =?utf-8?B?cVpOZDJ2NHZIdUI4OTd4OHpVMHArdTZBZVRWMDhEWFNHREZjbUlPMG1rL2wz?=
 =?utf-8?B?U3o2R1A4WW52RmFXTmRERitac05wd1l6UnFTcEZ6dEp6VEY0YXpwcDd3Qlds?=
 =?utf-8?B?dlhmL05MQUdrNUxrc21uL0t3RmkyWE52Mk5tYVVNbjVTVmJDMlRKNUZHRytM?=
 =?utf-8?B?QlBWVXlEVkRqK1pUQjZsY0gvb1NTQnA3Vy8wUDhQR1hzbUZ4WllKVi9GaU4w?=
 =?utf-8?B?RU5HemFpUlBOVkVxbGRUL0VCMTdjdE1SM1VieDNLMUVIeTdoM0VRRC9iQXFX?=
 =?utf-8?B?SStNN0R2SEFST25ob0lMRU1PUTVWWFAyR2pRRjBGM1hML3cxbldaeUJ6ckMw?=
 =?utf-8?B?NGh3MStHYWpDNE52dndVbnc1d0dzaC9OUytvQjZGYXEySWQ5Tm04S1JuT2VD?=
 =?utf-8?B?a2l6Y3U3TmVGNkNPRTA3TVEwOWRZVFN1NWRpUCt0VEJCZSthRTdlMmVXZDJr?=
 =?utf-8?B?Z3JnK1h3cnNOSDFDK0s5ZU5WdEc0eFFPei96Q2JYMjZNenJJZzdGanFGMTFB?=
 =?utf-8?B?aUwwTlF3alhaQVoyRkNHSXd6WmNMWDdXZzZ2SHAzQUh4bThYZFp6ZW43cnNT?=
 =?utf-8?B?Mk5yODRJa3VCeGJQQlowTTVVSGpnV1NibUsvZlg5ZHJRSlQrbEFKRUVSYmVq?=
 =?utf-8?B?ZjVtenFmbkhuOXMvb0NCODhjMVJaMXhzblRKdEswaVB2ZXQ3aWVkb1JpalJ5?=
 =?utf-8?B?OWxhM0JXblM5eWFIZmlRVG56am1MYWppL0FVY0UvTWMxN0xodm5OcHBwcnlr?=
 =?utf-8?B?TGtsY1Z5L0xjNUtiRWovMnVMMEFTVVR4KzVXbkh4UzZobVJYSDgyWWpiSlFH?=
 =?utf-8?B?V1NBMGE4WVgvM0JrRmhrWmlrU09ENXcyQXNZTEYxOThqVlk3VjVIL0NhL3Fs?=
 =?utf-8?B?MWg1SDNZV1pjRGtkTmJSRXJldk9vR0lsbXdRVnI3UFB0dXZXcjJzL1BjTUxS?=
 =?utf-8?Q?r2RU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFk4czFidTVGSUlqYlpYUEt1OExYVGpFMzFLWTVveVpmWjNOK3p2dGUwRlFP?=
 =?utf-8?B?RTRrRXVQb05pOURtTU1ydzhCQWJKaFJtU3lJeE5lQlo5SnJKVTJoREVKY0ZM?=
 =?utf-8?B?M2JuMGgrcGpRUisrR2dkUmpwcWhuUUVtOXByaHhMYXZkT1FHYjhaM3FvcW94?=
 =?utf-8?B?TXp2K0Nqa1hvVTJ1NUN6M1haOTdwV2VmZldmNmY0Y2JGdDh5WkpMa1N5NnlX?=
 =?utf-8?B?aFZJbWRUWXF3eGRLVkVDRDFKT1BTZzdBaEpSRzF5aHpZM3NNbVhVeFZmdVhB?=
 =?utf-8?B?YnRERE1aZE1ZejY4dFpkWnFua1h2dlJyNDR3OE5VSUhGVTIwempOa1dkNVBh?=
 =?utf-8?B?OTZHTnNOckNTWGJTb2RNYkx1Q0c0Q1NrNnVKSlV3cERWK05HQ2s3bkhrYnZn?=
 =?utf-8?B?Wk1IYWNhSHBhLzI1eDZTK2ZNVlJVTExpaEgzY0xpODYxVjd1emVSZWRycms1?=
 =?utf-8?B?S2hIZGlScVBERnJNRTNXNkZqd2NKNkZuRkE5eGJNNUxmSTJZa1U1MTM3TnVp?=
 =?utf-8?B?QXpOa1V3WDBaUVhtZFFJRHoxR0YyZHgreHEzS3ZlTmVZSDkwbUpsU2JUMlFx?=
 =?utf-8?B?THE3dHc3dnQ5a3diSmh5SnB3d0wxSm9uWkJkamZvc2VtOXVKbmR4YmVXRUJX?=
 =?utf-8?B?QmFvQ1NTQUwremk1bDcwQ3pBdHBZVU1URkY5MFBaaFZQamszSnNpV0R3dlFB?=
 =?utf-8?B?YjBPbGZTc1I1YmlDbnFjWjNHWklLZ2R3ek9zMnFRYnRIWUJTV2s4aFJRQ0pG?=
 =?utf-8?B?blVoY0o0aVZNMHh6bTNzMmtxQldwam1hVlduNGhpYzJNYTBZQ05jZUN1VGVx?=
 =?utf-8?B?bGJBMW9nZU5KNjZTRmVZMlB3M2EzYTB5a0VDczFwcnpNYUlHbWlQSHdBam9T?=
 =?utf-8?B?VTM1dDFpclFObm5wam5KYXprMTdhMzduWW8rY3VJVWlHZG5yR20xQkplT1B1?=
 =?utf-8?B?RUY2Qmh5NW93Tkd0QXBqTDdsSGpEcjJnUU5qL0J1TG5VVFR6T3VXRWtTdlU4?=
 =?utf-8?B?RnRwdXJkNkIwRyt3c0M0dmwzaWNoblVrbTFQZVlIdFdQTXdIOTl4Nmg3YXlv?=
 =?utf-8?B?Yk9HbWFxZlhRTm5TK2xOSTZiYW9ia2ZhREZnWlU1V2U0dCtqTHJhTThiL3VY?=
 =?utf-8?B?c2lERTFBNDR0ZkYvWW9tMkFpVk5KSWtEY2FnamlxeElEYzY2dHIvWUpxZUwy?=
 =?utf-8?B?SU5FdjBmZDNuK3oxaDVjRWt6ZC9wWkNXeUJRNlllclJKVWhNbWlKR2RNVTRT?=
 =?utf-8?B?aFk4NmVtM08zMFgzSXY5U2laSXV2alZIS2lKY2tuNUc4dVpNc0w0S3E5cTJW?=
 =?utf-8?B?REVxQnlYZVJuakxCN0dlaGNzN2xqZndLZTlRWGxWUHZ3UXowT01UQlRyWXhM?=
 =?utf-8?B?aDdzQWFpN2xMdUsweVpzaGtXOVFRN2RhTDF3YWx1dkM0eUdqdVRVcmtYRFpY?=
 =?utf-8?B?MlFqeXJpQVJ6R2FEamJ0eEs0WHFOWjFWRW4yOUR3MTdnRnh4MUN6dUc1TGRX?=
 =?utf-8?B?QWVVLzVjQnhMS29sS1dUVm5XLzNHdFRzZ01SN2xHZkE0bjduNFpwRDNLODFB?=
 =?utf-8?B?ZDZqbU5zd3R0WmJBUUJCYjRFRmJzTWUyNElNdEtZODZjalByeGpBUCtKd1Zi?=
 =?utf-8?B?amJkQ1czY052dE5WVzJ4RnhiU0pjL1orNnhBbmJtOFc5RllLWkJnMkdwZ3hN?=
 =?utf-8?B?alJwZmliRFBDbWRUTnVZMUpNbUs2SGJFdlVkeS9iU3RQckYwMXBlVDBPOG1y?=
 =?utf-8?B?RXpDY21FbHZBME0xSUZuSnZQMHJyZXYwRVdmWU9nbVpMQW53VDN3VXZ6MkFn?=
 =?utf-8?B?VjJjVk50R1V4cXRHTUlUMG0rY0p6WWEzbVhxeFQyMnBaSUhNeTViWFJGNWxV?=
 =?utf-8?B?MGMvVWFhWkhKSnVKTEJ1RGJ2N0UxT1hFR0tEL2lyVS9OWlRuM1hCanF3dmRO?=
 =?utf-8?B?RFVmaE1hMlhRZmZCTEZOb25CdTNOZ0FXSjhLQ0VLZWd2M2JsWDdWbjIyL2xG?=
 =?utf-8?B?U25mN0NXMWh2SGFuT29ldlcvdmIrZHVOMldEaTVoR3hSL1lpK0JIVnVmOGVI?=
 =?utf-8?B?S0pKRjZCOFdRYUl6U2Q1MTkyRWszMGtEYjNBSDBJd0tGUUpSYTgvMXNncTZR?=
 =?utf-8?B?enk0SGluY1JnVmdSUmxBekcvZXBTR0x4QlFxcHdmMk1sbnliZmFqYTd2RzFq?=
 =?utf-8?B?VWcrcTR2WXp3N3B6a3dnWitmMmpDRm5UR1dETXU3MzVCNVI4SXpjWFJTalBN?=
 =?utf-8?B?NkVyclFpbDY2UmtJUEYzbW9YSlZVM2s1UGMrcWxCaXJCSUdLVUV3Q29WMDcr?=
 =?utf-8?B?eVdDRWcwS2hhRmNpNkxCM0ZVdGtyS2w5d0JNb2pPcTF6aWRIUTVodz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7854f834-f0a0-4f4b-6e41-08de6ae13389
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 09:21:00.0681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjm9Hwlo//ynYn9b9L9aB5nqqaanjA2NGOaQRH3Fm7LCzCTC5pUr0Z4AiCJRJmzJ1XsGSjx/C0XYjt25bZbdOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5151
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 15660134654
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 09:22:24AM +0100, Jan Beulich wrote:
> On 12.02.2026 18:58, Andrew Cooper wrote:
> > Also, during the final link steps for xen.efi, we twice get:
> > 
> > [10:09:57.995] Warning: relocation to r/o section .text:00000048
> > [10:09:57.995] Warning: relocation to r/o section .text:00000090
> > 
> > which smells like the multiboot header.
> 
> It is. These diagnostics are seen only when older ld is in use, but the
> issue exists in all cases.

Oh, it took me a while to figure that out.  Newer ld generates the
relocations itself, and hence we no longer use mkreloc that would
print those warnings.  However ld generated relocations will still be
against read-execute section, and hence as you say the issue also
exists there.

However the ld version on Darwin is:

GNU ld (GNU Binutils) 2.45.1

So the issue is not with the version of ld using in the Darwin build
being too old, but rather the checking done in efi-nr-fixups not
working well with BSD grep.  It needs to be adjusted to use -E,
otherwise [[:blank:]] is not recognized.  I will send a patch.

> It should really already be on someone's todo
> list wrt fully secure boot conformant xen.efi, as we did discuss this in
> the past.

I did start on it:

https://lore.kernel.org/xen-devel/20250401130840.72119-1-roger.pau@citrix.com/

However at the time I did this, the XenServer Secure Boot
implementation was doing something that would have been incompatible
with this work, and hence I set it on the side.  Later on, the
XenServer implementation changed and picked up most of this work
internally.  I however never got back to this work, neither the people
that internally worked on Secure Boot send an updated version of the
patches.

I will see whether I can make some progress on this.

Thanks, Roger.

