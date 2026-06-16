Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ljo3GD4gMWodcAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:06:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E8D68DDF8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:06:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=poxSpXMi;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339012.1600120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQgw-0000Br-79; Tue, 16 Jun 2026 10:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339012.1600120; Tue, 16 Jun 2026 10:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQgw-00009g-3K; Tue, 16 Jun 2026 10:06:46 +0000
Received: by outflank-mailman (input) for mailman id 1339012;
 Tue, 16 Jun 2026 10:06:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZQgv-00009W-AM
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:06:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQgu-0049QJ-NR
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:06:44 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a31202b-bab6-0a2a0a5309dd-0a2a450c9710-46
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:06:44 +0200
Received: from [52.101.53.42]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a312033-62f1-0a2a450c0019-3465352a88e0-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:06:44 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BLAPR03MB5588.namprd03.prod.outlook.com (2603:10b6:208:290::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Tue, 16 Jun
 2026 10:06:42 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 10:06:41 +0000
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
 b=q2XnVmvLgvcvYtmNdaWhOHbzwxhx8vTqcEQ4reHsUnrjv+IwIYWpf+D4Jz01HlczrSUJjdqBbwCewihj0iXDddc+gmh++JYmpS+GbbcFt6f9UL9WuxjagEISN6fiNWDZdrPR0ICSYpsEfT0A6WEVP3hJzZO0E/bXpdCHqdsdwHj3Ff5/z4/v+oHiw3LVjc8sewCHn4f4sEQIgjmAEW6yNQ/J6YlxSrMw/kKVNPYjh8Kjx4gF/ONOXdZUsAjyeAOmsrcwKB2Nt1sI/u4K5OFurUFrL+XJ76MIHRg3LXX1w6+90BNoxhE6XyRKy5iuQ11uyCW/I1VXc+l2YM+NdBMbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnBBoXeQnWghPpVlQBGrR0/cUDfVCkPibYjO5wGmjPs=;
 b=S5OqHJ9cbQetlKd6H9xzXwLQBSwPJaScxosME9TA1DbJr/RHdfCK4YkC3fw4f4tZLugaYPyObzjUaa9HiSw0Tf67C396eV49mcbcpBsql21p22Smg7jsl0CTUGdgAYsj/33s8SKko8x3dZtzXjgHjplZ80bDU9y6KhDqWpHJTpBsNOybf7hO/wP9IW9yjxRC+h78z0iWOVUJWnBauczPraQ0RtRpe4uklQJgBt6TgqLjcoNFMemzxamUQWV06eNKcgrnHTrDGj+hEdTm9tWd8iAwV45jUGma2drVI7NCilbzDoNNnwQ0UjcmZu6WEeUiS/iO2mODNP4Wk54XeJoE2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnBBoXeQnWghPpVlQBGrR0/cUDfVCkPibYjO5wGmjPs=;
 b=poxSpXMiAC2Ch2RK10rjnRkgq7Im9e9xXvbTvdj5ZVHfevVi0UZcA+b1elJLniGsTgPTcPbIy2A0mLnxImwy0+raMFteYHZGCgT6Yd99nACWuiqHjyNt8loSIG5+RrPIKC51+skztSP3i/x/XJekP+WfoHqi9H6wnO+jrL+s4Zo=
Date: Tue, 16 Jun 2026 12:06:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22? 7/9] domctl: restrict permission check for
 XEN_DOMCTL_memory_mapping's remove form
Message-ID: <ajEgLtu95rxjRSoX@macbook.local>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <5f49f890-426e-4076-8326-c2fbff433a35@suse.com>
 <ajESc7Ae_0bzd3IV@macbook.local>
 <ccc5bc2c-8331-4624-a5be-a5b1d649b1a6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccc5bc2c-8331-4624-a5be-a5b1d649b1a6@suse.com>
X-ClientProxiedBy: MR1P264CA0106.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BLAPR03MB5588:EE_
X-MS-Office365-Filtering-Correlation-Id: 6293e178-b170-4942-225f-08decb8ef6ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	b2fs3nvr7GHkt0nFmqkLn3zDy8zjo+GnXT+rlTStkBXCsbtAoFRTik1FM6QS0EDZzK5KVf8BiQjLWGnM8oWa31A869rBnGgLEkWhCkDmN7M4CC2yEF7WOpMIlFHlEplQ+tK0X7TP/nR2LpK3ZNMcdZtLt+O9luHE27aXJt9zFWDNmA1ZTaLPKzabnnJH/gTyCWSVYK0y3yFBAfi0zdDtVx+LiokSo1NYcQGOkER50ohSwJYtwqtW72d8N/QdIvxcQBG7aK+rN79jn7nrvCvcmId3cCrp+HwpkECfMA/06GlzLuYV+f+RUBFJQQ7YBZZwppdnHPU7ddXrTBh7SX9cJEPY4jk1HwgHX1MLVbPeepFRqYbBRaEwlwIksOybPklAGdLIbibjK4kNem47KYWV6GnyuPa9h0Ax4p3JfZqX+sXseb8DT6svtrZfXhc/7eDd200MutSZKgnagGJJoz6lbMx+rWaVNutmd+Bw8bfjsGaOVjJ7+Jw9S4hr39G41fEID6oM/p/WjDZuIiSV1SnehTEerMluujmzO6FoPEXjS/BLYTi0INLbbQ8NS8L79KgB1w6zsXt9Hq/ZGj5tBpQL4esx313G1VfYNbOEeA7ZPY8uBG066qVetWTuBe87kDaeIrhqTkX1NRzepcyC+YQG3nKSjsRrplCeeHA3Dl6dyisQJABNWpBW60Ad8Ndv6BqR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RktzZzE2ZTF1c0hRdTF5Z2ZKaFJaYXJkUXpNTm4vUFpvZTA3S1E0bHpqUVN3?=
 =?utf-8?B?TFhUSmg2UnNHcFVESEd5dnQzbGsydlhMMGhLNUlwczVZeUdLV3MyMkRqQ3hZ?=
 =?utf-8?B?U1haRWtSSEEzZlp3UTJycE1ZcElhekc5aGZBQ0pLQVBzOFJ5UkJSQTl2aURF?=
 =?utf-8?B?dGJFaDBwam81V2NUejl2bTVpVHgvaXAxOEpzRk03RC9wZU1ydXFNVElLY1Ra?=
 =?utf-8?B?eDFpem15eGxNOEZUWnJkRmU4dEZCRE11Z2JCT3N1bXR5U01xVE95SXBZeWpy?=
 =?utf-8?B?TnNnT3dyNWRvS3pRbWxjV2x5UE43NHgyWGNJL0kyUTZnalJjR0xVRWNhWDhG?=
 =?utf-8?B?OEdLWUJRS2l2YjZHUzlHcGErME12OVhxeUk5YjFwT0F2MDhFL1gxcW5Kc1dU?=
 =?utf-8?B?aFBWNVNWNUtqMjg4ZlRPWjJFcXpDYmFrODFHamlDMklqUmNZYW5kU1lrRVpS?=
 =?utf-8?B?YXdYOU9JNWZHdDkyNGZvV3JRS1ZDOUIxRi92bVcrM2FUV1cwSjk5MUxJRnhs?=
 =?utf-8?B?UVVDSTVvV2xheGZXeUIwcHZwVFkrUHBCdmZnVnlqakFxZ3lpK2VFOG42K0dQ?=
 =?utf-8?B?Si9uM0kyK1EwOEtMc0hKaXJhbmc4VXVoOUt0M1FrTkoyazZUS3NIbWY4eWYv?=
 =?utf-8?B?MVk4QmMxTmJ0eGM4VGxMMXBBYy9lTE1tY3ZYNGp1YUp3K1BrRlltZW5QQkxy?=
 =?utf-8?B?QTRxQ25nVktzNUM5TFpDSW5McG03emRWZjEzQ1dTMHhwN2VXb3hhL3BPQWdX?=
 =?utf-8?B?NzFzTWc3M0hmTzNHZFMwcElSQ3FFdThVQjlENjBOellmT0VKQ1IyQnFEL3py?=
 =?utf-8?B?M3g1ZjRqM29CM2plQUZyemdSMGtlbi9PWFhTdVZmQTNua2JpdFQxZjR0RWN2?=
 =?utf-8?B?NEQrWFc1MThRcGxPNWFadFNzckZuc0FjU0RoRXQ4SGtDQ0hEK2NFb2NoSkU4?=
 =?utf-8?B?Slk2WTVpbUJtbFdWT2w1SjVWOFJROU81N0QzS1ZuTFNkY3JlZGxjVWlMYlho?=
 =?utf-8?B?WWFDV3pBemZJOWNPQklTVXh4bFZvbXlTZ0paS21VTUtwd2hPaDAwWk5DbVFN?=
 =?utf-8?B?M1d2Uk5xakpPSGRxY1BhQ0ovSFhYa285WFZKb2t4c3B4L2V0endscWpEaU5z?=
 =?utf-8?B?UUVmd2VpWmt1eXRHMWlFMHVvUTdnMklPSUJRU1ZCL0s2VHhOOEZCaVlJWi9r?=
 =?utf-8?B?QlJTUytRTERrZjNoU200aWQwdE1SanlOQUc2R2tjYWllZmRnQzl0L0lQY1I2?=
 =?utf-8?B?VnZUeWJrQjNybjN1TkpLb0xLYWpFTkhwWk1Ld0JIY21McGVJeFRrUEdmVjFR?=
 =?utf-8?B?MFNHRm0welRyVC96SmREeFRXVTZoWEdYd0JiV1FNODRoM3VmMFJIWG92NnRY?=
 =?utf-8?B?d3EwdExSWmhPTWU3dngzYTBYbmRYd1dEQ1g4d0JZNFVJbitrOFJyL2krL1ln?=
 =?utf-8?B?UHd6TUJEODU5bTJacXJjYmkydk1mVU9tK1RHNVJtZXdUdXIvcmVLdkpBcGl5?=
 =?utf-8?B?VTlNZE1MWkx0eU1sUFJVcVRLWWx4eVUycGVlblJVSnd3MEZ0eWYxN2lJZ1Ux?=
 =?utf-8?B?UXloUHY1dU51VHN1RUJSQW15WkVQb3QvbzFIKzBqTlE0N1ZjVU0zQUN4aWY4?=
 =?utf-8?B?WHp2UkZ2ZWMwU2FCaW53QjFKeHRoeTBka2k3eXRvSjVPcFpFR0VRdHBOZmcz?=
 =?utf-8?B?UUpjZ1hGWVBUVHBFVkFubDd2QnkwQjI5a2JnRmg2bkY4Zmh0SVlSZDBSN0Js?=
 =?utf-8?B?dTdSUjFHRHVZVW5paUpBUWJ3WE8yRGFYRFZyUmxLUWtyc2RwU2p5TXRkWjFE?=
 =?utf-8?B?ZUJXaVBCSE42N282bVljUnpBUjgrR2xGREZxT241Ylg0a0YrNEtYVG95NUxs?=
 =?utf-8?B?a1hEYnFibjRGSmRHNEFGUlNGVE1TVDZkbnlIaWVlVW4waVNwOUFWdjFnN2Zp?=
 =?utf-8?B?eFNpUHVFeklKK3BQdXp4SHlLMjNQemJ1c25iQk1QT09ybmdwUVZtWEJEQTNG?=
 =?utf-8?B?VnYrMWNOc0ZzbGowMllpZElWRE94aFROQXNCaVZWMnFnZDBtd1NuTEpOTkxS?=
 =?utf-8?B?dUVHZXlPUTRlZzJmd3dIcW44dVJJODlKUlZNMWpWYlpheHVmSFgyWWcrMmlw?=
 =?utf-8?B?RmE3NWQzNGNxamlzUEFNaHlOaXRtTnhBREUxcWVoQlEwOC8xd1FWSm5EQ1lX?=
 =?utf-8?B?WW82VUd6MVBTUGo4QldFd2VEenozeUpZS2t6b3dhTjU1aUVZN1V1QWNwNzZX?=
 =?utf-8?B?TGhucXlxNWxYVk9NS3FCZFJINmNVN2dwOS81YjdlY2xtaUhZRTl1OUhTY25p?=
 =?utf-8?B?STYrUjRhSTdZdmozU2hxZU9yVEl2QUx2anRmeEpGZ0JTRGZlMEpBUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6293e178-b170-4942-225f-08decb8ef6ab
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 10:06:41.9109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBNVZbSTv3U2iQoyY6iAg5FKJmrPbGG66tgkD7L1DVBDyXEamUlm61EhLP+YrYA+VP1zugc0OKxnwrgVhDoOtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5588
X-purgate-ID: tlsNG-d25034/1781604404-DA368CF5-B9B17268/0/0
X-purgate-type: clean
X-purgate-size: 2645
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
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,macbook.local:mid];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3E8D68DDF8

On Tue, Jun 16, 2026 at 11:51:54AM +0200, Jan Beulich wrote:
> On 16.06.2026 11:08, Roger Pau Monné wrote:
> > On Mon, Jun 15, 2026 at 04:15:36PM +0200, Jan Beulich wrote:
> >> Like is already done for I/O ports on x86 and for IRQ unbinding, check
> >> only the requesting domain's permissions (for it to not interfere with
> >> MMIO backed by another stubdom DM), but not the target domain's: Removal
> >> should be okay even (perhaps: especially) when permissions were already
> >> revoked.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/xen/common/domctl.c
> >> +++ b/xen/common/domctl.c
> >> @@ -436,11 +436,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
> >>              goto domctl_out_unlock_rcuonly;
> >>  #endif
> >>  
> >> +        /*
> >> +         * NB: The double lock isn't really needed when !add, but is used anyway
> >> +         * to keep things simple.
> >> +         */
> >>          iocaps_double_lock(d, false);
> >>  
> >>          ret = -EPERM;
> >>          if ( !iomem_access_permitted(current->domain, mfn, mfn_end) ||
> >> -             !iomem_access_permitted(d, mfn, mfn_end) )
> >> +             (add && !iomem_access_permitted(d, mfn, mfn_end)) )
> > 
> > You seem to be doing the opposite of what the commit message states
> > here, and checking for permissions on the target domain, not
> > permissions of the requesting domain?
> 
> I'm always checking permissions of the requesting domain, while the
> target's are now checked only for "add". That's what the description
> also says.
> 
> What's wrong with the description is ...
> 
> > XEN_DOMCTL_ioport_mapping does check against current->domain, and not
> > against d.
> 
> ... that it suggests this to be the behavior at the point of this patch,
> when it really is moved to that only in patch 8. The patches used to be
> ordered differently earlier on. I guess I should change the wording to
> be closer to what's used in "x86/domctl: don't imply I/O port permissions
> from I/O port mapping".

Yeah, I've noticed after looking at the next patch.

> 
> > FWIW, we could also remove one branch here by doing:
> > 
> > ret = -EPERM
> > if ( add && iomem_access_permitted(current->domain, mfn, mfn_end) )
> > {
> >     /* add logic. */
> > }
> > else if ( !add )
> > {
> >     /* remove logic. */
> > }
> 
> Indeed I was wondering whether something like this would be worthwhile,
> but I opted for the variant with less overall churn.

Since you have to adjust the commit message, I wouldn't mind if you
also want to adjust the logic to remove the extra branch.

