Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D3aBo0PBmoFegIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 20:08:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA24545ABB
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 20:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309162.1580281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNaTP-0003pz-MG; Thu, 14 May 2026 18:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309162.1580281; Thu, 14 May 2026 18:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNaTP-0003nA-J8; Thu, 14 May 2026 18:07:51 +0000
Received: by outflank-mailman (input) for mailman id 1309162;
 Thu, 14 May 2026 18:07:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wNaTN-0003n4-Jd
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 18:07:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNaTN-0000l9-0b
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 20:07:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a060f3b-5cb7-0a2a0a5109dd-0a2a4507d666-42
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 20:07:48 +0200
Received: from [52.101.53.70]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a060f73-229c-0a2a45070019-34653546a4dc-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 20:07:48 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7346.namprd03.prod.outlook.com (2603:10b6:806:382::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 18:07:45 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 18:07:44 +0000
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
 b=Puy3Wjgq6JA6qYk1T4i+VIaipOnaqfPgxlbcjSYGa3euR0OkAEkHXiaDE/h0OwQ/h/19LpBEO+xy6Owl2L+cpCUIVpwG7ygfZ79+q1dk0z9Iy5bmf6wQpmUFuk0exwgYfKLnGR+SPsdUJiWypJYO3GdcfZ0xpU9TAjKJJXXNODaOQq+C/SLRix2TWX1oOkB/xtdnxJbJEinoUVTul0PmMVU76Wyp06YA4swnAfG1itdhgRsEQUf+w62KHtCWiX5gZ3JfUoqwpCRIzf7joFjg3+EIIbJEKZaLtXkIR6CfCEuHgDcsyAeFa+b573S9Liheftw6gskCrIxIO54aoifZzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqlB1iEE+XpADb0XMiExpDYTQYTPBQSjBhwLyUp5vMA=;
 b=reH1IOLhuGHtEJ+n43Ghbs6L6SvpBTSctNSbdKuzSFgA+RHkHYqXGo9NIjeFYNo3F3a5RGDHeo/Gr53MEQ39+1eKwZKN1U4FbQGkGvxpATmc08HSxpr7DuLdGC2oJDFDm5I3EFY7Ydtxr7Z8IJghXkBKvMQ3TnUyC6ywJSrFoaohdaUwBZQtkpIL8GsB2KYXJuaYNp1tMDZ+zq1a5Uqb0R8MK3rgc9ri6612YG2ZhvVMT7NJr3V7fQ6r3usoykkh30Qm33uNDzNBIGyp0V+2sHkLBPYgPU+iLoERT5FSHGvgEaNvPD8rapbjmrbqV32ByxuJcEOXZ7Bzsm75/mNXLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqlB1iEE+XpADb0XMiExpDYTQYTPBQSjBhwLyUp5vMA=;
 b=OU6GDLfq3L/sHUS5gcA1PZV+/ImfznRUpwKRCK7bjNUNIFHpNVxxCTKNbJ8779IN/Nxu5uhRu94ggpBMMZ7vieA82y0bZT+wPzP5yVeOsyBDcoOgkv3LNNrXVOrUJtlEu/uh7COE9Q58iDyjBDLAV4v+0fqFHnfsI+4p2vRbF5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7ef99f0e-2847-49d8-8701-8243e4b073ed@citrix.com>
Date: Thu, 14 May 2026 19:07:40 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] crypto/vmac: adjust for Misra C:2012 rule 17.5
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <036752dc-5333-4d01-acaf-ed450e09fe48@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <036752dc-5333-4d01-acaf-ed450e09fe48@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0474.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f252fe5-2e34-429f-75be-08deb1e3b246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	qID5mEFutlJnFbPMllt6az8J73D2cf7mihkHI9rpp4Hl0qMNIQTbpNyC3xPXeuyhrv5Hmje2EPhH1LcAQotBRfENHtmHOM9aiSyA/yMuRPgQVp43qEpA2os+SE5yrcm4WY+XMClTcQplZwvMFI0KSE+kmer0tSuOphrUM5FKCDjaByaZ5rLp2wOyMUfs/hQveCh28wkCPWxmWAN7fQGVXNCy/KVgqaJx5S0Qo0L953Bod/XCbTOjp28NDU2XTt+cEjzrbPNcjCLO9PyS6mzqWpFmAbobwSnXlsnnPi0scSFGAj44yqgdXQR16579zZSys5UUJtHQDSCwSH5ognU+1KOr7QMI+1ikN+PX6hfaJuDer7kGKIdL6Hh55cfo2xyln+DuQhkmLNwOFMM/mLdfWJ5dL6M7Otcdn22Quaqa4gWW+j1syMUVpmUTWYDGrxTQjg2R0VxdHCmOUMYFMsT0+eUDfxSIHdydjCWoUkWOuB2/0GZyRTUVZ/ME9aP5Rp2WT0wYG818xe2Hok99iqkjRf9KPyqUXGfnlZYGBdAumzBxI9Oo+o8JZYusBrGapogR4Pwzn0IQcVwR6R3z5Cw7PyQexlq5E28t/QmQ+Iy55d23jpca3tCKxiY0Cv5Tbupsmw870gSeg4waB6FJpB6Nai9Dmk/yqZ+SdnZ8SkmsMZSxbD8QHHgPvKrlKKLbKr+s
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU52L3ByRUM3d2lYVng2a2luNXdMcUtiUHkxUlR1dHhzQW5RV1ZLTU5MMWg2?=
 =?utf-8?B?YU5OdkxURmp5cHVteXJFZmJ5M1ZkNHRKazVKaUlteHdMRzg5MGJ4NEdldzdX?=
 =?utf-8?B?UUVIRXRqZDBiOEpmS0FIOTU0V3J5a1FxUDFHK2VmM1dINkZWNmg2Y3NublJz?=
 =?utf-8?B?UkpTemJzcllQdWVwbTFrcnNNeDd1a0VPSzJyaElsN3NZUHU5eENhemZtT3Nn?=
 =?utf-8?B?b0tUd3RMSndvUGdxS0J1NlowTEpOVzZ4anQ4bzFxS3ZETW9hZ0ZVWGU0eUVn?=
 =?utf-8?B?cGJNRU00dk1OMW9FcEpBenFjMGV0ZWZWcVZtcjh6TmJMR3RkUEc0V0VKRGJB?=
 =?utf-8?B?bml5bmIvdUFXazVMMTdqV0hwMC9KQWRaSk5QZlVsckRrNnh2WkhEUWtGUGtV?=
 =?utf-8?B?Sm1YTWtyeFBGUkg1eHpTSjFrdlN5LzBtTXdoZmVBUzZlNXVWS2FnOVcvUFlk?=
 =?utf-8?B?aFFqUjNOS3VoTE0wU3o4NWxLOTBRRGN1cU4zVFA4bUVFQThEb3NtQkJ3R21Z?=
 =?utf-8?B?d3pQbjZ0Y21WZytOMDlYeUtPT2RuWlJTalFwT1ZCK3F2Y0FBaEhMZFc5YUx2?=
 =?utf-8?B?aXhObnRabkVKWStIZ0M2d002MTFNc1hwczhTYXRFNjY2ektDTjhKL1o4VFkz?=
 =?utf-8?B?MmliQm1mVGYyL3hPNHloN3JTK3NZNDA0eEtQWTBkWFdjZkRVbnFlMjBULytE?=
 =?utf-8?B?bE00WGpQSkNUMmRTVXdRVkE4aVE2Q1VTKzQ5bkw1N3cwY1RDN0dGMkJOSW54?=
 =?utf-8?B?MDRkQlJENERrU0t4UXZZcjhTZjZWSmpUeC9RbElhMmZ1cXBZUmgzYVREaFdU?=
 =?utf-8?B?RmxPWW1NdmJXOWhWQWozTUJrMWJsSG5oVUlwWndTaDkyMHp6VXhiNGh5OU4w?=
 =?utf-8?B?Zm1wTjRGRFhWVnJuVGR0ZkZhSUcvbUdmeEpHWDBZMnh0Ylh0S1BneExOY0dM?=
 =?utf-8?B?cnZRaGhIdTNaeTYzOE5NSzRNWWJwYmJ4RXI2YVJWZE5iSkNPeTdicEEyckta?=
 =?utf-8?B?U012VWF0MlhSd1kxR1VEeVB0ZmpWKzU0UlQyTVg3WDhqZ1VXM05RNWgrOHVk?=
 =?utf-8?B?R1RHQVBMQ2dtRG03OUtERWFFWDY2QnFPK2o1ZmVtUmtoZlhzMWZkWEt5Z3Nk?=
 =?utf-8?B?YTB2cEhmMUpTd2tGZ2RvVHBIYzZaYWd3YlNVdHJ0OHg4cjFiWlpiRUdPUnpU?=
 =?utf-8?B?cE43N1FVdlgvNk9wNkFNTGNFTDZNbHZoZ1Y0NWRYN1FkTUI1ZkxsUVE0L1JY?=
 =?utf-8?B?akkzTkIzUVpDTFVnN0lKZVZKQWZQbDFEenhqbTdUNHZDY2tEZmtSTFc4Q3Jo?=
 =?utf-8?B?UkcyUlBDYWVQeVBmMmdqRkJVWFhQSXp1WUp2aXlaTTkzN3BTaVM5alFYS2cx?=
 =?utf-8?B?cGFxOFZKNTM2ek5FRUlmZHhscWNFaWs2VmRJeE1DMk1VNE55TENNNGM0RWJY?=
 =?utf-8?B?SHZOck4xelM5VjBMeU9SS1FGdlRKNXlCbGNZaDYvbXFDamJuVmpDMmZBVUhM?=
 =?utf-8?B?TDZXS2ticjA3WjBJVVQxb2pKeC9DazF5WGYrbWdwZkVpcjZHbW1TcVVQVTNL?=
 =?utf-8?B?bzJFenA2SlozdTdleVVuQ0lHTUJxOS9zcGUrNVhiNUY0WkQ1MFpzbFFNMmlU?=
 =?utf-8?B?RGNnaXN1VEV4VXNlOEFON3J4V2swOC83bnArYnRLOUpFWC9iVTBFUVkxczVH?=
 =?utf-8?B?Y01pZGdCeVQ4RE56U25XK2xYS1gvZlVrV2dxSSt2MEVwSGNDMThyRWpVVDg0?=
 =?utf-8?B?UmptV0JDNjFaR2RaajhsVEF4L3h1Z3A1dVc0dElxQ01FbW4yc2R3NktFYjcx?=
 =?utf-8?B?TmdaVFNqcms2dVdFNExhaldGcFh5YUpRZXFTSWJlV1BWWXh1ZDROTnk1ckpN?=
 =?utf-8?B?NXV1S1RRNDdyQ1UzOGxCcXlxNzhwN3piNzEyVjR5QzVIME8rRHAzMnhsSXZ5?=
 =?utf-8?B?UEl1ZjRkZzlSRlQxVnBobndROE9sd3J3ajlUSldMY1V0QVAvZXNPcUV2UXJL?=
 =?utf-8?B?YVM5M0hBQ3lCVkhxeHVBdnFONCszYW1BbVNvdkYzWGVwNlhrQ1BOUG85UVpx?=
 =?utf-8?B?R2QvOUNUaWVBNnZPR09XQzZwVjdmRFR5RC9QWDJvdkRzZEh3UXFLazU3SlR3?=
 =?utf-8?B?TXA4RDN4M3dKTjBQL2ZGYXpGVjBDS2grOUVqQzlzbVZVYWhUMHBFdldMbWRr?=
 =?utf-8?B?MDFZTTREZXYvdmgyYTdXUFByTXdYYkVKNGpvS1hGbStSblhzSy9SL2xibUNt?=
 =?utf-8?B?RlNGUFg0dmhDVndvUEpOVEx4TEQxODMwVlpZM3d4Ujh2dW5vYWZBWlZ0dVdM?=
 =?utf-8?B?YStpYnN3amt3TGIyR25yUE5aQmFheTZmU2FLRFpNTmV2RUwwdVJNNWRnUm5E?=
 =?utf-8?Q?5+geGOKtDlTdWP38=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f252fe5-2e34-429f-75be-08deb1e3b246
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 18:07:44.0764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdmGsU1kuP0ZPrGa4pxuPpxguCELsSwYEd3i1w2Mc9yq0oSwQi6hz6doGWGIFq4M4t70oQ06eF9p07Ks15D+cpu1sZTWWtqjPPI8Y+517zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7346
X-purgate-ID: tlsNG-ef75cf/1778782068-22772C48-3781E648/0/0
X-purgate-type: clean
X-purgate-size: 501
X-Rspamd-Queue-Id: 2FA24545ABB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 13/05/2026 4:51 pm, Jan Beulich wrote:
> ... ("The function argument corresponding to a parameter declared to have
> an array type shall have an appropriate number of elements"). Instead of
> casts, (ab)use unions.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

The Rule 17.5 violations aren't reported against this function.  They
look to be addressed by one of your other patches.

Which rules is this addressing?  I can't locate anything referencing
this function.

~Andrew

