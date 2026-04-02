Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNQwLv9dzmnvnAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 14:15:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172A2388F04
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 14:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271789.1559824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8GxP-000179-NQ; Thu, 02 Apr 2026 12:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271789.1559824; Thu, 02 Apr 2026 12:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8GxP-00014c-KB; Thu, 02 Apr 2026 12:15:31 +0000
Received: by outflank-mailman (input) for mailman id 1271789;
 Thu, 02 Apr 2026 12:15:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w8GxO-00014W-TG
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:15:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8GxO-00F3C3-9T
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 14:15:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ce5ddb-bab6-0a2a0a5309dd-0a2a450b8546-26
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 14:15:30 +0200
Received: from [52.101.193.56]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <roger.pau@citrix.com>)
 id 69ce5de0-bca8-0a2a450b0019-3465c138bd2b-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 14:15:30 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH2PR03MB5157.namprd03.prod.outlook.com (2603:10b6:610:9b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 12:15:24 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9769.014; Thu, 2 Apr 2026
 12:15:24 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRe/2umaq4cy/0gVEXELik8ipLp3RL/fEoteoYi18NWQH63RpXaXMax8s5NTlnDnJpd8JZCOeuPU+gjbsFzS8raUZbkhp1Y2nhg+UF6XeK2OiPlNZIrFPmGN6x2POLHr5HMoG3aOkjtFfMIcOwzzqWZp6Ouy89ONsAodJrawzauajepYSea+FB/B/3iAX/7X4kFLDuwuwnIPpDqh1CRzx5PCgq3ReAR0g4qq6gpMVTo8bOfCa9mfheYkU32K9B3s98BT3mTYqdENVupHztJ8xTPtJe09Dk3msxWUxzrZQXYV2uVyAI7gzxNtI+RRNuMzysdSAelPw25P8YnxvVmTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wc8pq1IrTylV6Ip5xEgF/nhMeWw+c6NQxoQbG71vexY=;
 b=uhd6tV5uEFUeBCKr3BOOb9Gbhg9uA+7DwoT4jJOvFCW1vlsyl9vKhgiaLg+KknIbpEwYkYcDYs3gh1DCCPhyBl/4zJYZvo4QBEvmc2xW2hVKJKSCyzenbWhRMRwd5RjOdrgE2grg5BjA4eE19xHl6H6FRnB7ZQvnf+QaykP8IcmJrlN7b4PnPhQFsjZljG46RY1vQuu4ji5Mdqqa5v//5c4ARpJbKEoI8s5yhPUYfYplq7DUkmEfmlqvnXHVZ8S1K9s+jc1mJKgxPdOYIo0unzhe/3+jE414akwQaDyZVv69uocOpjN9l1Hv51kJyupgG7NCCsWmEYo/pkvZKnD4lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wc8pq1IrTylV6Ip5xEgF/nhMeWw+c6NQxoQbG71vexY=;
 b=R//MpD5pV7ZsjwC82ebVsqLG/GuIN1DxKnbZrk9KhYTQ2tsVrzW2EVa8tY1Oz8w8r2x7FI+GwBtetdac+pVXrZ8t0H7ha6Tn0Zy6g1F4NbFf4M4Iyb43XLpLo3iAEy0343D/CuN0zvZT5EaMERBAKFrE2KhmE6UxmNGbeVXSbO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 2 Apr 2026 14:15:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH 1/2] make ioremap_attr() common
Message-ID: <ac5d1zBaSQk7f0nE@wifi-campus-l-10-3-197-236.u-ga.fr>
References: <924f3ef2-7883-4322-a921-edc814c96719@suse.com>
 <81e4f7e0-df57-4a5b-b16d-fe668682d94c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <81e4f7e0-df57-4a5b-b16d-fe668682d94c@suse.com>
X-ClientProxiedBy: MR1P264CA0137.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::21) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH2PR03MB5157:EE_
X-MS-Office365-Filtering-Correlation-Id: 8117fb39-bfa8-4f78-6592-08de90b184e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	D2On05KBdP/9tUhWEHi5Wlx3Veual6YlpwzPqCsx7hdml1PurbGTQWL9CfGAZaHsSU2BYrOglpdDKXS/uu+5sQoowMM8wZ92xDF8Hs6LLYVtT+7+fzDmYCdmmt/eaIl4Jr7yANjCoxrV6KaikgIyAUv5NhXA7HyZlF2STzX9qZ9VppaHtEKZF3Y+lhEGWwh8Cy0EFejUFflgtO6/QFCdJKsskNgdbfh6XftZAYWUH6nY/PwyJt7xJ+gXaiGnju1WUI1dBCx+PUfpLCcLl3AAzv54fI/c7duIoxFBNhros4fgXJCEjjtAjdc+L/oC4LINYRM1cyopeutI1/RRoTT6gvyo+J4FBzVOymAppcHgCgXmDrmooS4CTmUb+Z/mDu55xYGVsQEqPwWKMqSaUI75E03uBdq7G0zdsgI17HJ8h++5cAtbCBM4KRUtMU59ye/dVUV4XbC1JRcnSBWSQkN//ILbjt1zdaJn9G8aFCRdQHaNf61Pd1SXTDlv5V2j4bElDp245Wn5V9oGTFYGQtvkF2b2UeMe/eLbjbpLzdCD/FHM1HqS1kGEuxNMT3TdXpUxjaj3whtXRj6Yhfxol/BbmyJK8YOgkUIa1JbWHaU6ikfU1j4Zhec1PCykXmvCT19oxlzwxFg/RPFUSr4ck0x8D1oFkUGorBR1xV/whzzJWvUeNwJil6LQyyjynxl2Q3kJobsOSZAhqn9soCrmC5gJ1EAcuMr+KZM9XCEtJ85b620=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDRFRVRTdTZFNkp6QmpGMW9rSlVIbE9BMFd6S0JRWFpxbndpQ05CNWRYRUp5?=
 =?utf-8?B?T0ZpeWFYMjVTRnNOMkoxbHhISmYyakdVdk9WbkNYSFd5N3U1c1RLRDRzTENT?=
 =?utf-8?B?RTBUbTVOVVNFTTdCK1RtbGFoak1CbkZNeXVZMGdYOGxVSWhHa2lHei8vVWRC?=
 =?utf-8?B?Y0lsNXo5dWxuM1JmTW90UlVSbFR0U05XSGhvaEhzVHB4Nndod0JHRURwTEtG?=
 =?utf-8?B?b0FsTWVTbExmek5DOUE4VjErSWdWSE1RODJpRCs5L3hIdDUwUE5Od2dQbEUz?=
 =?utf-8?B?SDMvblhoeXBSUkI4Z254RUFvS1RhaHJZN0I2T0htekZrMjExRTJxVW1KRGZP?=
 =?utf-8?B?NjErMjAvNmNEK2d2Qzk2OEgvM0YyRE5oWGhiR2M0Q2IxaHZwTndscWVTYTdH?=
 =?utf-8?B?RzlMYXJzYiszV2NxbkxYcVZjR1E4WUpIU1M0RzgzSmo0VEt5Y0ZLRlpqZDFN?=
 =?utf-8?B?aWhEcFlxZ2xhUEJMemN6ZkJXK2VWaUFXeHRoRHB5Ni9oTStNVEI2TnRPTTBo?=
 =?utf-8?B?cVZNY0RwTnRlV0IyWWllNlFyYnRkZEZOZ01SVEpySDdQZzhpLzhESnk4aDl3?=
 =?utf-8?B?Ym54V3lKNjZuU1JEbTRzcC9iRU9qdGdld3dnUVFDUTlNc1AxNGM5eE5JcC83?=
 =?utf-8?B?ZDlMM3RHeG5HUS8wTU5BQW1uR05Xd2VnQ0xsWEk4OXNsYjZMM0JYcW1FREpK?=
 =?utf-8?B?cERoMEtGKzQ5bHQ5S2VJZUlLbGwzV1BDYVBmSUJnaVJ3dXJ6SEVyVlVlQ1o5?=
 =?utf-8?B?dnEyNW1IQ0lCM004K0F4ZXRHZEw1NE5RRHdYTXgzVzdORG1ycWdnRzFPOFFS?=
 =?utf-8?B?bGJUVnJZbkpxNUVuaXRTcVA2UmJXdzZ1N29vUlpKQ2VHaitaUTlMRHRaV0di?=
 =?utf-8?B?dmNYNHF3Tm1md1BUc3ZaU3Y4Q1NuMHUwSEpQdDl2ZjU3ZmR1dldEUHlwOUtF?=
 =?utf-8?B?Wlhuampzc0x5NEZWV1FtSG9iWTc4cHhQcEZHTmtaTlR4SWlpNy9KR3duOWxC?=
 =?utf-8?B?VUdlWWkwdEZhOUdrTlVjWjl2RitqUkdDL2lZRC9SZFBnTjk4TEVlUHNsYW5T?=
 =?utf-8?B?TGVCSE5qbklQSEN2UFBUc095c285Z05za0VjUllITDd2d2czNDBXNzZKZVZG?=
 =?utf-8?B?NE1saUlJeFg3eWE3V05HOWtZQUorQWh3cEJOUlJ0Q3Y1MTByczV1ekpFWDJ5?=
 =?utf-8?B?bmttejJ1ZkZFQTdzOFdpdWw1U08yak5zTnh2THNoVG9yRTN3MHd4Q0hNQ2du?=
 =?utf-8?B?UHFJKytXVHpueUdlZWtOS1luS295d2NvTHQ4cFVKQjhiOVNnbG13RUo2WE5R?=
 =?utf-8?B?Yy9zZlArUDBlNmtmWlRlbk5qMFRZdVNqMFp4WERsSnd2UE1DN3g2dWhBR3Ar?=
 =?utf-8?B?bGJ2VG96blBybFg4dnVITmxBYW44L0dRakpzZ3hNZ3ppNGR6dklJd3R2Ym1Y?=
 =?utf-8?B?ODN1NkxTbFJnSEVrYVFhTnV3THlBTzVaS2RrN3FadXQvUVV6M1FVaGxKbzAw?=
 =?utf-8?B?b2dxSDFNZ0pNUG5xR0I0WThQU1dBRjYwNkx5WHNIbDNrLys5QU5MOWFmUjd0?=
 =?utf-8?B?L0RvalQ2SVQ0YzllMFZydndGWURoaUt2RVhrb2s3dkgvMTgwV2gyV2pKU3ZJ?=
 =?utf-8?B?a1VFT1R3cHpCMFR3WUowc2hSYlRsTlEwRGtJa1NLdHgwbXJCMGduTTdhWmcr?=
 =?utf-8?B?bnA1S2xzWWtSTTFJNE1wTnVCTFYyblVVUmg4SzBmbzhXSU1YOHFBbHA5cGVR?=
 =?utf-8?B?UlZqT2lzQ0Mrekl2ZExEaDd6a09vVExlc0hPMUtqZStUTGlONi9mK2VDdWVH?=
 =?utf-8?B?Q0MwMVpqa3E1V1pPZG1wYjVCTkZMdU1VSTNIR0pKclowY2d6MEltYzA3OWtL?=
 =?utf-8?B?NTNJWnZHVk81UVdJYlZNVk1QajRBTDNROURLc3hZRHFkQWNUSno3N2VsMHR1?=
 =?utf-8?B?bENXa1U5dWZpT05vNkpHaXVuR3o3UGtoYnRDR3QzQWFLQ0hWd0RXNFlnTzNH?=
 =?utf-8?B?M3d2VG00UWJhWXE5djBJdEkreXVydHczaUpBa1ljYVVGQzhhd1JwaHBXM2VN?=
 =?utf-8?B?TUlUb2ptZnhRWGRKN3g5S2tHTzZ6V3YrYkhjaHpQV1o3WnQrN0NIdnBBNGlo?=
 =?utf-8?B?SWMzaXUrUlF3T3FhRXdPdHpkeG56VTZBcERjMUp3YWtRTnFNbkFzQ25vNTJS?=
 =?utf-8?B?MHJIaXE3czhDeVJDWHUrK0RnaWdjWEJjenBmN2lLNnpaVnpBQ2djbDRwblI0?=
 =?utf-8?B?UTNjM3E4Y2FNVUxNdXFUTk5DOVIvTTBXNVRtNm5jMnZkQmovMjA3amxwVS92?=
 =?utf-8?B?ZDNDYjFmZWVLYUU1OG9RMnlYekYzdG1CMG1ZMkM3dWJhRkNEVXlKdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8117fb39-bfa8-4f78-6592-08de90b184e2
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 12:15:24.8402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHunHXyGMjar8aifkIo+malhdAAAE9ssHvT0hbEIQNvGXOr3u5icZYKVpLgvxllbiJJostVE9LR+td8EKQmgGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5157
X-purgate-ID: tlsNG-42698a/1775132130-EC75A2A1-C158F601/0/0
X-purgate-type: clean
X-purgate-size: 3559
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:tpearson@raptorengineering.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com,epam.com,raptorengineering.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wifi-campus-l-10-3-197-236.u-ga.fr:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 172A2388F04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Feb 19, 2026 at 04:51:54PM +0100, Jan Beulich wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -6166,41 +6166,15 @@ void *__init arch_vmap_virt_end(void)
>      return fix_to_virt(__end_of_fixed_addresses);
>  }
>  
> -void __iomem *ioremap(paddr_t pa, size_t len)
> +void __iomem *x86_ioremap_attr(paddr_t pa, size_t len, pte_attr_t attr)
>  {
> -    mfn_t mfn = _mfn(PFN_DOWN(pa));
> -    void *va;
> -
> -    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
> +    WARN_ON(page_is_ram_type(PFN_DOWN(pa), RAM_TYPE_CONVENTIONAL));
>  
>      /* The low first Mb is always mapped. */
> -    if ( !((pa + len - 1) >> 20) )
> -        va = __va(pa);
> -    else
> -    {
> -        unsigned int offs = pa & (PAGE_SIZE - 1);
> -        unsigned int nr = PFN_UP(offs + len);
> -
> -        va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_UCMINUS, VMAP_DEFAULT);
> -        if ( va )
> -            va += offs;
> -    }
> -
> -    return (void __force __iomem *)va;
> -}
> -
> -void __iomem *__init ioremap_wc(paddr_t pa, size_t len)
> -{
> -    mfn_t mfn = _mfn(PFN_DOWN(pa));
> -    unsigned int offs = pa & (PAGE_SIZE - 1);
> -    unsigned int nr = PFN_UP(offs + len);
> -    void *va;
> -
> -    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
> -
> -    va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_WC, VMAP_DEFAULT);
> +    if ( !((pa + len - 1) >> 20) && attr == PAGE_HYPERVISOR_UCMINUS )
> +        return (void __force __iomem *)__va(pa);

Sorry, I'm possibly a bit lost: I see that on the bootstrap
page-tables we map the VGA hole (0xa0000-0xc0000) as UC-, but I'm not
seeing this being done to the directmap?

>  
> -    return (void __force __iomem *)(va ? va + offs : NULL);
> +    return NULL;
>  }
>  
>  int create_perdomain_mapping(struct domain *d, unsigned long va,
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_GRANT_TABLE) += grant_table
>  obj-y += guestcopy.o
>  obj-y += gzip/
>  obj-$(CONFIG_HYPFS) += hypfs.o
> +obj-y += ioremap.o
>  obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
>  obj-y += irq.o
>  obj-y += kernel.o
> --- /dev/null
> +++ b/xen/common/ioremap.c
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/mm.h>
> +#include <xen/pfn.h>
> +#include <xen/vmap.h>
> +
> +#include <asm/io.h>
> +
> +void __iomem *ioremap_attr(paddr_t pa, size_t len, pte_attr_t attr)
> +{
> +    void __iomem *ptr = NULL;
> +    unsigned int offs = PAGE_OFFSET(pa);
> +
> +#ifdef arch_ioremap_attr
> +    ptr = arch_ioremap_attr(pa, len, attr);
> +    if ( PAGE_OFFSET(ptr) )
> +        return ptr;

IMO it's a bit confusing to deal with the offset addition detached
form here, I would rather do:

if ( ptr != NULL )
{
    ASSERT(PAGE_OFFSET(ptr) == offs);
    return PAGE_OFFSET(ptr) ? ptr : ptr + off;
}

And get rid of the !ptr check in the if below.  So that when
arch_ioremap_attr() succeeds it's all dealt with in the #ifdef
protected block.

> +#endif
> +
> +    if ( IS_ENABLED(CONFIG_HAS_VMAP) && !ptr )
> +    {
> +        mfn_t mfn = _mfn(PFN_DOWN(pa));
> +
> +        ptr = (void __force __iomem *)__vmap(&mfn, PFN_UP(offs + len), 1, 1,
> +                                             attr, VMAP_DEFAULT);
> +    }
> +
> +    if ( !ptr )
> +        return NULL;
> +
> +    return ptr + offs;

I would also join the NULL checking using a ternary operator:

return ptr ? ptr + off : NULL;

Thanks, Roger.

