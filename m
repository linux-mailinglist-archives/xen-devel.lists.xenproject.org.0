Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDlsJzrvFmpwxgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 15:18:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F36F35E4C7C
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 15:18:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320475.1587749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSE8n-0007mF-1A; Wed, 27 May 2026 13:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320475.1587749; Wed, 27 May 2026 13:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSE8m-0007jQ-SA; Wed, 27 May 2026 13:17:44 +0000
Received: by outflank-mailman (input) for mailman id 1320475;
 Wed, 27 May 2026 13:17:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wSE8l-0007jK-Mv
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 13:17:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSE8k-00GNG3-SA
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 15:17:42 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a16eef0-bab6-0a2a0a5309dd-0a2a4507ab00-30
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 15:17:42 +0200
Received: from [40.107.208.6]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a16eef4-229c-0a2a45070019-286bd006eaa9-4
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 15:17:42 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BLAPR03MB5571.namprd03.prod.outlook.com (2603:10b6:208:298::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 13:17:37 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 13:17:37 +0000
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
 b=LS0kUNOv546GpwPgCLnVtXcER5fHzuWMkJhd+VYrnkBliJiLe1CJrxMwPNTQ/DYdu9QDmSYtRrhmszkZWeAV6ble6z3PfeYN5t5U8pz4qqD5UUaskGNaxQd2QkO063Zo/ee9sfgXiezIWwvv8X9LV89TBsHWh0Pdtap1+CFQDw9MpQhKWXa6dfTTz8C1HzoaSoSsO0/2towi2t75VI6YpZWfFuZQGp8q6YEDlPGkKWS5Nwg7ivc+bmtvm3W3lQ/6XrHosp3AoQsde6xvbGf1EtxNaGIxNhv9yNZyiz5P9GWVVcJPcEZA3/tQBmLquiBJB+BmRu9i61LHC2HN4lxyAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+abF84evVeM7QZZTYHTMiVAhQCPRcqYEs8XOWad3h8=;
 b=LLFmgl4bHNwrcs/HXPxR3fc2RtZed66aOKKbtqqTOhZp69JMvsAlYb6n8djb4OQ4lVPMClWm5E3o0yK4U3cbgsHdayIBKkB+K9w/75hP+nHD9X7e+/j1Hpj9hovyHlOl4Kjh7/7LaiNuarc5YdtHrW6NpK7UnbQnmzSLDBLXtKbuJqfxnw2arV6ztatllpl943Y5Lim5I9O0HjjiLIHIy6LiDS3C4jkROu3pPyMCWUviFfBBg94reXGDfK7hpJ/A0D+HhoqDcdtvKz4NXKh//Qvieq7OHf3PWxNMnRjqjjovWcwyzt5x9ikKmqU6WRZjq3a6HWlmf6beuROzWabgvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+abF84evVeM7QZZTYHTMiVAhQCPRcqYEs8XOWad3h8=;
 b=RS9e1Fezj8xqcZh4kiZhDWFdqWc8OwR1mN/blcKArRtymx4SN6iZSWM3rtXLS6Po/Onr2C7jQKIHJXLx+igiYFPxFaRSqzpt63ZuG78eoLmh3wxLONBJeg8HgpAE8YE9HYh5a/JGdj0/1kLGo2lkdGShlCGEKh7Qsi3YuWNle6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 May 2026 15:17:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] coverage: place GCOV-generated .text.* sections in Xen
 text
Message-ID: <ahbu7qiPxp7c4Yp5@macbook.local>
References: <cb8c1e0862a554f7a28347f549e9cfd0b0d6db2f.1779829545.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cb8c1e0862a554f7a28347f549e9cfd0b0d6db2f.1779829545.git.dmytro_prokopchuk1@epam.com>
X-ClientProxiedBy: BN9PR03CA0751.namprd03.prod.outlook.com
 (2603:10b6:408:13a::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BLAPR03MB5571:EE_
X-MS-Office365-Filtering-Correlation-Id: 51eb1049-d9ea-4a22-3ef0-08debbf25222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|18002099003|22082099003|3023799007|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	KqGpXo5i92BqVJT5GaljC9gWPAiCx399RFBMPwQnACr8GoVs2jQRIAKmLVCkz54mK0+Om0Hwh5HTSTepvoPvgbSGSauIWYFhLzQzZFfNasWID7zeidSV5aTLCb+JM7cjA9F5egTFdG6vVUWJ86x+yhItJK14Nwpbe5TuF2WzhEHG3eOu78DpvL13RUOvgzkpWbJsJsuc3dHzhymvGXWQ9l0TGmqdY37n0i4GmOzvO10zaHrT7eaDpoomcm7L/K80zG5jTK8At5WRtq6QWddOCo3e56CNZ+tf8P0Vtz7i/Z2pkQUYPmMZ6opHoR4XPWvahvoJJpUBXbRS8TwRbWzpdYIiCR3TskH09UIXuD+5pXEwT1a7bIXrW9hjuQL4znNg4p1Zr9pfGApW+SgwmqeB0euzNMaJWKHKTUijSOk3r1pENA+mTYfsL2HumkK69Zvn6VwIhC1ky0WM2h/tOGzrBsm1rYbAaycipWTUuRka7l/uuCFSqM+fHnpXenKk8iFZKxKj8b/8fPpwBuWgGNE8QLiP+vWaaV2U0iKo+6zBI0/NtAJXqb5o3cSI1CEETuA3Nzf7h4HXX576l4JFNEoYGpnm5ASJUytwECLTgvD5RVPn886Q7rD8eQsXb755pOMVPa8THj0dCZv/drVwERlrN5pWtMxj5xJmb4o7nzbfTpzW2rg9KskDj8toSTPL99Pe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(18002099003)(22082099003)(3023799007)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTRDczFkRmxpTnYwYTB4MVRHanpCaS83QTBlQlNJMkRTTDVYb0M0RFJuc0Jy?=
 =?utf-8?B?Z0dDS3d4QW9oUkZ5a2FVOE03QWRoajBFN0pTUXFFNmpRSVorN2FlRGVOUWp6?=
 =?utf-8?B?c2ZKdHZtdW8yMG5KbXVSWTVuYm5TQXkvdUg1OWRSRWFIYmNYSjZqdlRMS0ts?=
 =?utf-8?B?aGRia2lGR3hoYnlRMkhCSW81TldYamF1UXd5Z0YrdVcrcUZWSGE4bmdQZjdN?=
 =?utf-8?B?MHVkTnJqMWVQWEZxVmp0cEpyaGNESXhnYXZrcnp2bG52a2lMWitUVjlDb0d1?=
 =?utf-8?B?dmNBckFxQU9VVWt3amIwNk1DMWd0VmkwWlV0N2tFU2hneUV1UCtHdUNHMWpB?=
 =?utf-8?B?U0hmeHc2S2RFYUs5YU1DVG1OSXFSaXltTEdnajlNQUo1dlBlN1VGeThsSDQz?=
 =?utf-8?B?RXRzV0R6UGU0U3BuZ0ptWFFDNzU2NnR0R0VjZlJvSXJPVkpGK0R2QTlUWHh4?=
 =?utf-8?B?TVZvNUZsbUJiRUJyM2VZMnBHTk5VaWZMS1FxL2FFUVJNRFFYeENIT2NoRmM0?=
 =?utf-8?B?ZTJzQzA2NExZZlJiaGpPSlJsUVM0TnUwSytVKzRldkJMcGIxVndsM0VYQ3Nh?=
 =?utf-8?B?OFkzZVl0WEFERktvZStLQzZhNVdPK0MwclJpeWJFUEhPdzJCVU1MbHdOMzF0?=
 =?utf-8?B?VHdxWjBUSmxPOElNWVF5UEJCbEtTRU1JOFJwMW56bnZrdW9OazAvR00ybENn?=
 =?utf-8?B?aGxjL3YzVWxlOGhpMnlhTDFQVEZWL2FUQVBjcHhqVzhPTGQwMyt6UGZGUWVj?=
 =?utf-8?B?a3lLREVMZmI3SkxpQW91QzQ3c0ZONGczTXlQS2s1VG5WYXJKUlN2Q0VzSmRR?=
 =?utf-8?B?allxa1NUQmE5UWNDUWtzM0hMUWVtOXUwZzM0V0oxOW5qdjY0empKYjRaVTEr?=
 =?utf-8?B?U0lZU3AxRDV3ckhsckNDYTJqSzFockNiT0g4SUlKUmdpQlBJTEIxYzQxdkpt?=
 =?utf-8?B?YndwSUtveEVmM1RDalFFRjdmRUpheHZzY3RhOXdpVndwd0l6UVlJbFJpNEdk?=
 =?utf-8?B?RnhoSlZmY2RUZlNjQi9ncTZ1Vk42aEw3MUF4QnlqQVIxMGozUzNGRTRDME9s?=
 =?utf-8?B?T1kxUjJQOEVwYXpmWGp5M1NST3RIY0R2bmZac0RKb0RDZ2xYZDVLQ3psNnFQ?=
 =?utf-8?B?ZVFpSnlLYmlzVzNyRk5LcS9qaE1jUWpxcU02WjhJYlY4KytkOWs2MURvdnVY?=
 =?utf-8?B?OTRlVkRSN3I3Z1RWRElFN3lPRHRLcVBlMk43U002dkJVOHBYbHZYWWFUNjBa?=
 =?utf-8?B?SHc3ZjcwUVpEb1pTU3VBNXdqcHRiMUZ4bTVqTWtVSHpjT1ptUTBoMjVhTnpK?=
 =?utf-8?B?VUZwcUVKWFFML0dRalFDVFBJNWNXK0Zsenc4czhPQkJQOXFPSW42UWJTMjdz?=
 =?utf-8?B?NkdXbVUwaVQ4Mlg2WjlhQ2xISlZTRUNoZ0dIMnk4bmdGUHl4ZjFTcWdZVHI1?=
 =?utf-8?B?TlNOY3NpWVo1QUIzMUJVS0x6di9lMngrVlgzL2V2M1EvL3dLZVE2eFdIWlBq?=
 =?utf-8?B?eGRGcENadVhyNVNDM3h6U3NEUFBwRyt3WUdGalBSVUpiczVIN3U2Q0V6THJN?=
 =?utf-8?B?VHN0ZmorbThGYzlVZnl2L1lnUHVEU0tWbFNRZE9HNDJHT21YbndoRm1DMVBm?=
 =?utf-8?B?dUJ3Q3FWRy9hT3F0VHVjWjhCWjVnSlBldCtRUHVHMjR1bnFoWWN2UFpDa0Fo?=
 =?utf-8?B?MjhDbmdQT2FNOExxWlRwV2FiV0liMStwMjhKODFjek82UWNZcnZHQjk2NFBL?=
 =?utf-8?B?M1g3V3ZlZjQ5ZjZwcWJOVTlQVHN5M0xjNTJCaElCUTNCVjJZWkZzbjdCNUZQ?=
 =?utf-8?B?TlpuNDZISy90Nm9odUk1N2RGd1gzeVVsUVZSVGNpRkc1YWNPcUJab2FyOUhC?=
 =?utf-8?B?MEo1ZHhFWHpIMFFRVWZHcStkMFU3dEIwNXV0bnA4ZUM4Q3NLTzZZR1Q1MXdl?=
 =?utf-8?B?bDVucTZkVzhJS2l5NithYnhPM0pyREdVMVIzc3MwdGIvenMvdmlIUGxDbEJH?=
 =?utf-8?B?cGczWS9vS1hmUVhOekEyek1USVNMUVErSm1OMFFBbnJZV3pleGlOQ1pHbG1K?=
 =?utf-8?B?ei94NHJPT2gvQW9kSE5uNWhOYzhuT1k2Qm0rajluSUVlYXcrcSswVDhESGRv?=
 =?utf-8?B?b1lCd0pyS0ZFQlBEM2tLeW0xMGFaM2ZSQVF2SDlxREtNSGlMU3VBOVlXMUk0?=
 =?utf-8?B?c3A3UkFXMjhHYnBRMFBRTUNTYkNJMmhsR0VpUzI5eUZ0NFBYOElHV29ZQWtv?=
 =?utf-8?B?TWtaSlVsS25HTWtrWWVHV3FuRmw5ZCtqUFJ3cTlQbVV2UW5PVmtFQ1pKb1Zw?=
 =?utf-8?B?eTRTd1ZZMFM1b2JNdld5aDBCSnFwcW5YQ2I3eEE0T3VodEQ1SG9NQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51eb1049-d9ea-4a22-3ef0-08debbf25222
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 13:17:37.0181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yR7qQiLuxTV6BthAwnZyW0Iq/d+jE0zjfQ7Et2mGOnV4gU4w3g3U4hadz2uGkROJ8sQT8MaptboBB9AD2SOBtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5571
X-purgate-ID: tlsNG-ef75cf/1779887862-2976AC48-91F5C3DF/0/0
X-purgate-type: clean
X-purgate-size: 3917
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,xen.org,arm.com,amd.com,epam.com,raptorengineering.com,wdc.com,gmail.com,suse.com,citrix.com,vates.tech];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F36F35E4C7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 09:07:42PM +0000, Dmytro Prokopchuk1 wrote:
> GCOV instrumentation can emit executable input sections such as
> .text.startup and .text.exit when CONFIG_COVERAGE is enabled.
> At present the Xen linker scripts only collect .text.* into the
> main text output section when CONFIG_CC_SPLIT_SECTIONS is enabled.
> 
> With CONFIG_COVERAGE=y and CONFIG_CC_SPLIT_SECTIONS=n, these executable
> sections may be placed as linker orphans outside the expected Xen text
> region. Constructors generated by coverage instrumentation can then point
> at code outside the normal RX text mapping, leading to early boot crashes
> from init_constructors():
> 
>     (XEN) [   12.331193] Instruction Abort Trap. Syndrome=0xf
>     (XEN) [   12.334253] Walking Hypervisor VA 0xa00003ce000 on CPU0 via TTBR 0x000000004352d000
>     (XEN) [   12.338550] 0TH[0x014] = 0x4352cf7f
>     (XEN) [   12.341823] 1ST[0x000] = 0x4352bf7f
>     (XEN) [   12.345124] 2ND[0x001] = 0x40000043527f7f
>     (XEN) [   12.347329] 3RD[0x1ce] = 0x400000433cef7f
>     (XEN) [   12.351233] CPU0: Unexpected Trap: Instruction Abort
>     (XEN) [   12.357643] ----[ Xen-4.21.1  arm64  debug=n gcov=y  Not tainted ]----
>     (XEN) [   12.360243] CPU:    0
>     (XEN) [   12.364098] PC:     00000a00003ce000 00000a00003ce000
>     (XEN) [   12.375835] LR:     00000a00004802f8
>     (XEN) [   12.378273] SP:     00000a00004c7e10
>     (XEN) [   12.380492] CPSR:   0000000080000249 MODE:64-bit EL2h (Hypervisor, handler)
>     (XEN) [   12.382785]      X0: 00000a00003ce000  X1: 0000000000000000  X2: 00000a0000410fa0
>     (XEN) [   12.385176]      X3: 0000000000000000  X4: 0000000000000010  X5: 0000000000000001
>     (XEN) [   12.387555]      X6: 00000a00004e5f40  X7: 00000a00004e5f38  X8: 0000000000000000
>     (XEN) [   12.390027]      X9: 00000a00004e5f20 X10: 00000a00004e5f30 X11: 00000a00004e5f40
>     (XEN) [   12.392510]     X12: 00000a0000439748 X13: 00000a0000406938 X14: 000000000000062e
>     (XEN) [   12.394954]     X15: 00000a00004f3918 X16: 00000a00004c7bb5 X17: 00000000004c7bb5
>     (XEN) [   12.397293]     X18: 0000000000000030 X19: 000000000000001d X20: 00000000000000a9
>     (XEN) [   12.399803]     X21: 00000a00004c8008 X22: 00000a00003fa000 X23: 00000a00004e2000
>     (XEN) [   12.402392]     X24: 00000a00003f9390 X25: 00000a00003fa000 X26: 00000a00003f4ca8
>     (XEN) [   12.404798]     X27: 0000000000000002 X28: 00000a000057a9c0  FP: 00000000bedb6740
>     (XEN) [   12.407110]
>     (XEN) [   12.409442]   VTCR_EL2: 0000000080023558
>     (XEN) [   12.411291]  VTTBR_EL2: 00000000bffc4000
>     (XEN) [   12.412895]
>     (XEN) [   12.414204]  SCTLR_EL2: 0000000030cd183d
>     (XEN) [   12.415928]    HCR_EL2: 0000000000000039
>     (XEN) [   12.417642]  TTBR0_EL2: 000000004352d000
>     (XEN) [   12.419152]
>     (XEN) [   12.420327]    ESR_EL2: 000000008600000f
>     (XEN) [   12.422056]  HPFAR_EL2: 0000000000000000
>     (XEN) [   12.423809]    FAR_EL2: 00000a00003ce000
>     ...
>     (XEN) [   12.485355] Xen call trace:
>     (XEN) [   12.489080]    [<00000a00003ce000>] 00000a00003ce000 (PC)
>     (XEN) [   12.512076]    [<00000a00004802f8>] init_constructors+0x38/0x50 (LR)
> 
> Observed failing symbol:
>     _sub_I_00100_0
> called from:
>     init_constructors()
> The issue can be diagnosed by enabling linker orphan diagnostics or
> generating a linker map:
>     LDFLAGS += "--orphan-handling=warn"
>     LDFLAGS += "-Map=xen.map"
> and then inspecting orphaned executable sections such as:
>     .text.startup

The x86 linker script does account for .text.startup in the .init
section:

  DECL_SECTION(.init.text) {
#endif
       _sinittext = .;
       *(.init.text)
       *(.text.startup)
       _einittext = .;

I think you just need to copy this to the arches that don't have it?

Thanks, Roger.

