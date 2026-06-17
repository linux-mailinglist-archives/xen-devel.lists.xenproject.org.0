Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TDmBOyqDMmoG1QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:21:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A300698FDD
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:21:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=UbiDKyXZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1340227.1601296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoKJ-0005Rp-05; Wed, 17 Jun 2026 11:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340227.1601296; Wed, 17 Jun 2026 11:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoKI-0005QH-TA; Wed, 17 Jun 2026 11:20:58 +0000
Received: by outflank-mailman (input) for mailman id 1340227;
 Wed, 17 Jun 2026 11:20:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZoKH-0005Pd-OQ
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:20:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoKH-003Jhs-58
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:20:57 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3282fe-2eae-0a2a0a5409dd-0a2a45048a36-40
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:20:57 +0200
Received: from [52.101.46.34]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a328317-1dec-0a2a45040019-34652e229b39-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:20:56 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH9PR03MB972008.namprd03.prod.outlook.com (2603:10b6:510:3eb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 11:20:53 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 11:20:53 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVgZYZ2KRQ+nS65MafRQFAUj2/HbFMAVAXlB2deFPDt+DGr0sjgPLXp7XwwqfEsmDLfKMXi7SdKlKECqd2Unt6dgDXM5imk8eBAVmQi48TgcIrg/FfYpP7erVQ/bcN0hcOkNSGPdonqvr1qoBE1bmWQzDt0voxhfOQh8Ife4Ei2XiSuQulW4oTzOlV+1eObGWGgX+JuwB4Yxeautsbf9MdIIcvW/5YVeQEOgkBvJBOTSRf4CjvKS6w1sItuVg5tGqKpvlPQnIixpPsk+czjZEbw2StuNSE53rnW5cVk4MrifoQQzV5OKfXztCoNgqLWp3Ms4V+j49ZUtpecrDWlnOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBU13pduP7EMevZOpWZXELLKNFrOhywdifCQRkuYP6M=;
 b=ZK20CPCrNertaG+FT2aQJiFf/Tjl/8Xe3Y+2C5ucGzdDhO0zq/gxnVvS0duEn7FqyeHmbUkeh4bagkIE3sHS8tniHa4sBI3oZemRZ5KLl+R6wCQfRpkAw90xoxQk8jEv3tyArb2yBamGYL1Y6ZdgmsuBht/GCkhwC1x/m4MvExnHT36sMDQSGL5flhGY+e8IGqyzsSXSljaNmqpn2+iTq0/h78ZwFu8l1ag4qV+d+dIOyMBM6kUPOt8As6IU1WH5Sv6Z5U4QEmAmWLv/LjMtDAJ4pX2YOdduvT3SAHvo56lcK0dY3VyodI6NJXUf1oHSqIdnsNXyuJsXRcDG0hz/dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBU13pduP7EMevZOpWZXELLKNFrOhywdifCQRkuYP6M=;
 b=UbiDKyXZloCE5p5R9lRopzpO72GxgLsgYeGQZ785MMvfzIf6BalhtkCjs2NDtG4zY7S7jFrJVyZU/Z+olO9wNTqNH0JGSntC5edsJ9rqa4kiazFXTpw1654eK5hF+SmrOC7+ozT4VFu4TMqH1zfnldhR+7wbBCO1oacD+126Y80=
Date: Wed, 17 Jun 2026 13:20:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 for-4.22? 3/7] domctl: move early special casing of
 XEN_DOMCTL_shadow_op
Message-ID: <ajKDDzsGwQLmkFDY@macbook.local>
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
 <51050157-236a-44dc-93c5-8b52a31a3e62@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51050157-236a-44dc-93c5-8b52a31a3e62@suse.com>
X-ClientProxiedBy: MR2P264CA0150.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::13) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH9PR03MB972008:EE_
X-MS-Office365-Filtering-Correlation-Id: a422bf48-79e7-45e3-b4c6-08decc627d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|5023799004|11063799006|6133799003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	Sy+0sSaZiDMoF0Gw3whWbgD0KbScyifOJ0MvgE4kEzzoTbtCGnnKXkWBQpiGZRKbfvex+55neiHi0K3Sj2UJ5ZReGAFR1rdgWuavmPk633QQ4KplOoLLtgF9OV7OG62sPuxSEnW+TCkw+NMU1hLt249N0scE+ncpEVQrnHiToyz7/DqcNU67i5PDIH5ly7AvBA5obPP+c6C+CPQjnAAC2OddUBGo+E5yO8PNO/+dIwq+2aETJ0yDuXgr3DBEB3uO8jmhv7RcLkYxq8N1GjSwOBvK/bH+jtaORPKY0NZ6XEbyAmsGP19+YK4GZWCZsmEKiehGaZ5nqbD29Wa8vHSUk3hTdapIUJdsgKZmbmy0SbTnFFhKj/jRmQz1e6RC+CU/Tby7SthtFXWPV+wO61ZamBzJ56iRsmSm7kEHipZCUI6u1FGIpB6PahTnrtOYyOM88Krk4K4m1JaDXNz7s1sbFNOpxbZVRWrahYTX8aqxMCkvlmwpAqTQi9UYckDLmtmmiBtPl6UILLp0PdXwGNw0zh0oj0VbmoLVKKyJQXRiHTWZnCjkvdFb1pzkADiwb+c9GFs+Brelp4LQKX877OIdU14dUowKBe9GOz2ngNfNOnvIwfMZJKyEzSWxXkh3hWiELfOba8DwCQohSAJxzVcuKlHwnOTvAqTKMdbJKn46H58D/QYfO7Ib52p9M0NbrDlZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(5023799004)(11063799006)(6133799003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXRFSmI3Z0tlcjRyK01lRDI1cFdUbS9pUmVLK3Y4UUJKSU1LV3QxMTJmU1Nz?=
 =?utf-8?B?N1FjUWV0WHNKOUtsVy80UHc3djd0VzZZbFFYUFZQMm5sRE1GQVh4SjZuTHdy?=
 =?utf-8?B?bktwVGtabWZMSWorZU51bm4xazIraVpDdHZmVUp4cU0rYUhsVmo5VHFwQWhC?=
 =?utf-8?B?YnJVTFZyZG5qaDVNTWdLclZ6THc2VThlYWZTMlkrdWtLYno3YWFuWDRTdUxH?=
 =?utf-8?B?TzlRcjMxRlprMkg0MnhuRHZobVVhK3ZhY1RCcldoUUJNYldiR1NwdWdGR0Y2?=
 =?utf-8?B?TlRrbXpnUCtYeER5aGpRQmIxSEthamEyYzYxaktBMkZ3b0hpMUxkRXJRWkdv?=
 =?utf-8?B?WEFVQk9teWtjWU1XMU0vTHB2azZwT1FBV21ndzVibFlGSGZnZWgyMmJ0RWhW?=
 =?utf-8?B?TDlMN2NEZGhCVXVDd1RFa3RRUzBnRmRqcWlBbENUQkc1dk1nMHF4RlVycU1P?=
 =?utf-8?B?QlgycmtwSHZVRUxTK3BVSTBxSTNqWlpqdFhCOVFHSDFFOWRwanNxUDFvcUZl?=
 =?utf-8?B?dm5XbzB2cldBRFFUQi91UzVnNndpbVlRamtROFJFdzVQWUVQVnltb25ERDNi?=
 =?utf-8?B?czlwY3VDSndZK2NnNENLRllDOTNBR081dzJRRWF3WENldWlGWGxmNFhFa1hP?=
 =?utf-8?B?ZGw5eGovOFZLb01ZNFN0NlFqUVNjZkJQQTJTSis1OUErYk1MR3lQZnJCZi9B?=
 =?utf-8?B?bGxmT0k5ODdBbk50QUFvZWIvUVJ1Q0ttZEh0NFBTWit5REhnQWlVanpCNmdy?=
 =?utf-8?B?UkZ0THhjS0xSVE84V2dnd1ZNeWJUYUg0MUxJV0NCemFsZENPS0lYSnVsN1c1?=
 =?utf-8?B?S2d2ZTY2eTR5ejF4SHRYdzhYY0g4NWRML2lXYXNjMGtxWmpKOTh2dGZSMUVh?=
 =?utf-8?B?bVl0aTFTc3ExMVA1cmFqSml0ZmdCM1NtcXZ3VVpFMWJOQU00MWd1TXZzajly?=
 =?utf-8?B?a0RaTko3VXZtM2xYdC9xd3doVXIyVTBHNm5DdmZPZUNNQWl6dnBKYzVyRW1h?=
 =?utf-8?B?ZkZtNGQrTWw1TktCeW94eWZIWmtuN1RyOEJTRzhVN1IzTm04MFc3NUpuY0k4?=
 =?utf-8?B?bm55VTFOek9kRlZJMDJKRGY2aEdPZUlvbytueHVyenp6SHJSVTJyRU1MSzVi?=
 =?utf-8?B?MkdITFZaVUQxbU1nT1ZIdnJFd1NRNlUweWZQSDczVFBwQTJtNElQZThFTEY3?=
 =?utf-8?B?Nm5IaUdJa2RFM2JBanNYMlZlUGN3RVUrVGZXQ3VkcEkxQk1aUG5OSzk3MGE4?=
 =?utf-8?B?eFpHcFNXR1hwSHpWZ1NjSmFGaS83OVQvWHUyS2FYalRUWmlFb0tWSnVJMnp2?=
 =?utf-8?B?SUs5MHF2Zk01RERVdVdxVzNObDZwRzVzK2JXd3p3c3ZndUNYc3prZXhHbk14?=
 =?utf-8?B?UDZOK2lTUmJlREE5UlFNcmxCcXpPSEpuR3RhaUpMYk1IK2M3ZGozd1ZJaUl4?=
 =?utf-8?B?bklDZlRZOVgrWEhFVW5sT1VVc1U5M1BUVUNaR2hoUjRGTUsyVWhqaGUwRDF2?=
 =?utf-8?B?Rlk5VTNJTDRHWkJ6S0MrV3BEMkdnSDYvbjVGaXNMSyt3Wkg4VGQ1V3crSzM3?=
 =?utf-8?B?MmF3NmNFcEVzYkl1dEUzOG9aTDFpNHE4WVJlVG1RV3ZlNHJZa21zKy9nRGtr?=
 =?utf-8?B?NFFDZGVEUXh3OUJUb1E1d3MwMVZXMjR4bWw4WDg2b1JkM1ZVQ2ZvQkV6em8v?=
 =?utf-8?B?M0QxRGF3T2x0d3NtUWducnFUMkllSWRaN1Vlb1MraHFaZzVibG1nOVhoRWhp?=
 =?utf-8?B?SkZ1MVF0YXRPZTlaYVloTlJNRXRZVDVCSUpuL2RJajdZLzhieEhTL2NKcUhS?=
 =?utf-8?B?WkoxQ3hjQlYxWmxWSkdEeGQ1VG9JQlRQWGoyYXJHR2VoMkIyRkUrTVI4YnFS?=
 =?utf-8?B?QjNYN1kxbjBoWnZPMFVMUmxXb2xzMWFhUEUxU0JHcHd4eWxaSXlJOUJpUFhp?=
 =?utf-8?B?YTFHeVNEbDJ6Vnd4UHQzZUtnOS9lRnVTdmtkd05VQ1E0Z1M4NEtrK3pOQjhR?=
 =?utf-8?B?dFJDRG54TldQczBMc2RLbk5WSVJlUDZYZWlUZ09qSDR2RERKRmo3VE04b2tD?=
 =?utf-8?B?OVB6WjVIVXRlTG53YnYrQm9DYkpKd1k0eWkxNHlxVVBTZ3FxdTlKTWJ0ajVW?=
 =?utf-8?B?QkJzRGJvSzJoblJ5SllKUm4rTENQY241N3lJUklhRWJHaVNCTVlhejI2NzdM?=
 =?utf-8?B?UkN0a3JkUDNSeEV1aytLSE5OdnVMWUc4TElkbFhTVnlDQnk5NUd3VFdXZm1t?=
 =?utf-8?B?S09MdElGbmVxRDZFRVIveW1NV2FpZXM0aXg2RjMyMy8xdG1PUFhyN0gwZmNi?=
 =?utf-8?B?eE1SYkg3Y0VPdncySHdoNDBEZ2JnWS9Rb0dQQW1OZ3VDQ2lmWTU4QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a422bf48-79e7-45e3-b4c6-08decc627d48
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 11:20:53.2246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SweWM1U/4XZPTB2FWl/eaNN4Lga2cRUGpEo9alW1u9TCvmOwlgpOb3kPUGCdHotmyNCgyyj6VQvMVL2e91doRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB972008
X-purgate-ID: tlsNG-ebf023/1781695257-4846A3FF-3141F0A6/0/0
X-purgate-type: clean
X-purgate-size: 372
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com,apertussolutions.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:from_mime];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A300698FDD

On Wed, Jun 17, 2026 at 11:27:07AM +0200, Jan Beulich wrote:
> This wants xsm_domctl() invoked, but the domctl lock not taken. Move the
> handling to the respective switch(), thus eliminating the need for a
> separate xsm_domctl() invocation.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

