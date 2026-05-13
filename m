Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBXsHMk8BGqsGAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 10:56:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0A95300BB
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 10:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307712.1579299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN5OJ-0001GT-PG; Wed, 13 May 2026 08:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307712.1579299; Wed, 13 May 2026 08:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN5OJ-0001E0-Le; Wed, 13 May 2026 08:56:31 +0000
Received: by outflank-mailman (input) for mailman id 1307712;
 Wed, 13 May 2026 08:56:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wN5OH-0001Dp-US
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 08:56:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN5OH-001zoo-Ao
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 10:56:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a043cb1-bab6-0a2a0a5309dd-0a2a4508d6f4-48
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 10:56:29 +0200
Received: from [40.107.200.13]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a043cbb-63b5-0a2a45080019-286bc80dbc57-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 10:56:28 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA0PR03MB5402.namprd03.prod.outlook.com (2603:10b6:806:b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 08:56:25 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 08:56:25 +0000
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
 b=GSv8EA90mkhayk/T4EQY5UPgZUe+DW3W84OjJBKXMs9sUCkVl0W1BVK04w6H9rrcBBmtfREsLuUpUNTM7VyKDcvCaXN2sBS2+KgQGaKjo4hZZQOYqwElZL7Kf8tAXd/dd5CxVAh4KFbAVFpauO4AmfHKAbZanLMxtHLd016bWf3VHX8KPzqIhewxwXpWHNO5DZgCkbBeVtrKaB4pAV8wJLCrMU+9ulTynW0m3FVmMm13xALsl8VCj7dck5wvEJi/YwPdwmrECsfIw7UHmYKMJ+aUdVBpkov6nR0dowwzuk4EItm80m5TXHhs+ZiDS757jO89ernkodseP4OY7lyuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XP3WQuQURq4bqXMRqu2WUgpsN5UQQNKBcWqSipehal4=;
 b=izeIzFEIiNaZ0QOnwhYx34EuSJyq/RwJHDy2m+K+1y/ohRcGxW9ECfXkNHXWXXHsjRbtYiK7t10ObQOApTPWYGC7Q9VBsVRNR84GDmtWzyGCVARn4n09T/zHGwCxSdqdBOSpq8eavG1jVA06gVLmazh5b9pgsz4KzCn1/ze9IRnx/x+ZwjdhD2X1p97pJ0uOsBXEiWarjGe/vFGtikqUy/fWFoPrAGsQG3oD16uWPIhAkNyRLop4hKclGfd/s7C8RFFpYitCPT2XqdtyH+TQSg5rZLj5K3fxqwPs7VlIVFRZRIKmE4oTC3A0qZUeFA+euY6htpMBTX3FHLlMH/Vm8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XP3WQuQURq4bqXMRqu2WUgpsN5UQQNKBcWqSipehal4=;
 b=oPVMKLeeGZ2cSRFAUNUFGGkmH00a33FSvxwUKnyWDkS1gHPMD7qIna1SIEcN5te10G4o0DMbvuOFU8hqL0k6lQUbh5psuxzM2PLfSnF6NKDpdywhWeVowsoFq/OuNQY+HkbsQm1pmKPcb85VCO9UfOroSIKDlWrACmU4pvE5D+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 13 May 2026 10:56:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/5] x86/time: move BCD_TO_BIN() uses
Message-ID: <agQ8tRY3Kya6RasY@macbook.local>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <2c5af8f9-05f6-43c4-afb4-a50cbacd2d49@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c5af8f9-05f6-43c4-afb4-a50cbacd2d49@suse.com>
X-ClientProxiedBy: MR1P264CA0177.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA0PR03MB5402:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c8d8503-75ec-4010-783e-08deb0cd832a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9xWgUZILOZrfi50AMHFQ3wyY0YWYJNIvA+VuMVHpzrtpviFKG6k7CjdlJlGWw7z9x4eSdfO1GnNpPoefJnTKq2t2SpXGY3beFIIHZfUE1MPVIyvffyR8U0e+ayoT8ZTRtY0Sh7MvZ0qBsyH/wFx12dAINpgqKBWBuXMQOSKHkY0SxKyT/BUyxgBq01fQdN9vHSXaGkB5Nk6gGCrNbtrqMT+Hf36tSFWfUZ+RewxM2Rojw+G9CfrIvsPTyGSB2WTYwDiGdRpKwRiOINkPHWrcLIjJroyj0eE7Bvl+b9TGGz7RHrnUePdIKlg22PREltncFTTZmNRvGoKIhyHApXzhmwT9SH62uBwHldr3ZgB2ZmPK0l75KL9cn73iJ6ecp/8lKE8j8JyI61HO6brKJuAEdQiDnMwjG4WQknCzG/cxn5/bpxJ/73XsXO//kJRxjoMkN9oAhK+DXfGohJKLB4Vx+gYs2Q2/4FKOjGaVPxRI7UtZmbk0BrK9MNIgi5EWSfiiph8SWTS+TA2myaMK1eglYEOZKRF0Kq2TktlpQBVwErfkKe2Yxd/dxOhOlymohfl7f7YjFd5lKFtKChSwZOXKmYJSmQFp5uYh50zhDsAgRNRhiik+CJ8ryr/WLheBZyLLKP4jkqAFuK3E2HT/4P5la1IdLq87aXmZqxpRBt1UWQwUnE9LfjflZOiX899ZveQE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU56bEFGTzNFZnF6L0M2czBDS3NpaFNKU01YYjZVRVBOWUVYRG1oZ0cxZEp2?=
 =?utf-8?B?MUpMMmJMSTc4bWRhMWtnNFdYYjR6TThMTGltMkVscENHeHNmM011eWRITEdx?=
 =?utf-8?B?K2tHN3BOSCt2U2w3Qjk4WFgyTkVrWHp5K2xNaFkzYlhGb3NwVitZWko5M3Zw?=
 =?utf-8?B?RDNrckRIcGxHSE5BOFVlcDRCbU1LSFhiL25pTExjSU4ra2l0YnhpNGx1eFI1?=
 =?utf-8?B?OEdtRnlhM3lBdUFPSEk3b0o1T0c0THhrZVB5bUNOcXdTSmt5WDlHTitkL28w?=
 =?utf-8?B?NE5QVWc4UFVJOUFSTXlEZFRhRjIzVkYvMmc2THJMNC90TElGeFpQbnFEQ0Ra?=
 =?utf-8?B?K0UyaC9BeXFpZkhNWjJPVTNVcTRVTjJMYnNNclZIbDNxdlJGUUxuNEVIQ3ZH?=
 =?utf-8?B?R1JXckg5Q05XQ2d0eml3OXlHdU52S3YxaDV5aUJIdDU1SHI0aVNWWHBVcVFl?=
 =?utf-8?B?aDg2V2dDQlNrdTMrS1djQ21jL2E0blVGaDk1ZUZSVE9vMUNseGMwL2Y3Ykgz?=
 =?utf-8?B?b3dFUFZ6SkRXYTBpb2IrVWFzNVhhUFRCbzdScDAvR1UraCt1b1hTd29jV29v?=
 =?utf-8?B?dlNCMGRQaGpMOTMvQ0dUbHRSalI1cEEwZmExN0hwM0g1bDZtTUVERCtpRWIz?=
 =?utf-8?B?cTZnOC8vdzQyWHg5ZEg3N3M0MVJERm4xT1hYc3UwN05SOFdOUGtxREdEMkJJ?=
 =?utf-8?B?NWZsNGtxWFNTdXlDbWNucEoweGU1bytVWGFic09HajliOWlMaFlXZExBcTNa?=
 =?utf-8?B?SHd4WjBlK21hQXpFZXptUE5NOWNPTjNFeDh5Mkd2UjJSOHdobk1MY2thNklN?=
 =?utf-8?B?QUp5QXJZMkRESTg1ZFpyeGpTVGtuTFkvQndGb2FOWFB6cHZJWUNiSnpMc2lM?=
 =?utf-8?B?QWgvcE5mY0c0aU9jZHdldDl5TFZ1Sk9Xa2F1VVhvekxBdXhJbVRsMmZ4V3U0?=
 =?utf-8?B?WjB0Z1A0aU44Z2lGbXFXUFdiU3RVdmJWWlFhVnBhNTBzWENhMm9aRjhMNC90?=
 =?utf-8?B?YkZaaGRQR3JGYmk0bnFERmZvdExYb0s3VVVibVg1NjBhMkx3MUhoeWFUaEg3?=
 =?utf-8?B?SGRML09kR1pOVDNiOUd6Z0JOQXlveTVuM3ZUV29Qc2ZvdVJWUHVaSnBzcllk?=
 =?utf-8?B?cVJmdS9PNmY1cFQwdnVORy9IYmlLZzBqczhZV2FZamJPWE12N1lGM2dLZTNU?=
 =?utf-8?B?NFNqdS9RZUFyM1pmU3E3NWtNbDhSOGZMR3hrSU9lZE1PN1pFMFNLVjFUWjBs?=
 =?utf-8?B?RnpLTGxDQ3BTSVRvSk1HbWdyZ2N4clFCUDVIczhIbjJaWXcrczNxOXgyL0lq?=
 =?utf-8?B?MDFKVFV3N2w5U0NzWGt1VmhkNDl6VGszNy93Z1p1WTRtZzZaZXhTMGJOdG95?=
 =?utf-8?B?ZXd3d1llVzJhamNvbEZlKzAvaUR6K3ZPc0kxTzZ2bXQzK1B0RjY0WlROMVVo?=
 =?utf-8?B?QmJPTXNPZ1k2K1RJTndMd0p6Um9rS3JIRGZQbVltMEFkVnNJWE1rV0w5ZWkw?=
 =?utf-8?B?UGd2Z1VrVkxna0s2ejNZSFdsVTJvVVI4ZUZhdVcvZUFNTmtOK3Zqb3hUYi9L?=
 =?utf-8?B?aFZwV0kxTXByM0xvSkRyd2NaRi8xMTVTOHF5NG1McWRJOFl4S2VBRmJNWGg4?=
 =?utf-8?B?NUZwcUlwa0YvTkdGckdDQnNRZVROUXlidWk5bG5HMGo1QjJKblYxZmFJNTYz?=
 =?utf-8?B?eVNjN2RrM1VtdlFWV0E5VW9DSmd0TXJpNGVlQmE5VHRKVnNVM3NNaEtqbUJz?=
 =?utf-8?B?ckpXWWk5NTI0NFBzZVl4a2ZMcXNRemtWV05hanBQYjVoNGtZdFhvdTEzSlJt?=
 =?utf-8?B?N3FnS05ZL0NwZ2RyS3pGUll0bEdOekZvZzV6bFhJQ1hyK2JSOEp2eDAvKy9t?=
 =?utf-8?B?d3phTVVrZHQ4STBNdHBwOXRpcXdBT2QxRTdCMjZ2N0FlWjhvQWhZdy9qblov?=
 =?utf-8?B?YVR4RXEzTTkvM3hrdXZrTDRUbVhhcTNsQW5iOEFhQ2NFc25zOUZFbXc5Y1ZL?=
 =?utf-8?B?dVJ6NVkrOGZSMUpPS2VvL0o3c2ZpZWdrVjg2TnltOC9iZVllVkUxRFNkaGJC?=
 =?utf-8?B?Slk4RzRFVlE3QWJOa1FHalBrQTJYZUZkQjFMNlZ6S1U1bXA4ekFQT3ZheGF1?=
 =?utf-8?B?S1ZGREdRcWdDOXZ0WEVyL0ExNE1qNU83RE9xSG9XelIzN1VlZXR1eWp6L0Qy?=
 =?utf-8?B?YXYyYll0N0hPL2ViOGFMcDh4NmxlUjIzS3VqN04yVGFhREYveEFVcHNTWU1o?=
 =?utf-8?B?UWVNRjdyZjNpbVo2a3BQQktwWURWaWtQcW9rYUZPZnRGekM4VWxOc1JWUTB2?=
 =?utf-8?B?N0t0UnN4MVl3TW42VWFPSzJYUFpURjRMQzVJaG82SGMwamt2WEYvQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c8d8503-75ec-4010-783e-08deb0cd832a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 08:56:24.9583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPnGfjFOthsjUFANMVnYwa0tcF5hcGxbWAWko67CWkQk9lspMmoPuTSCiBn+2RMVkod9VqMhzU143WAj/BOYBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5402
X-purgate-ID: tlsNG-c1860d/1778662588-C5F80DB1-21B43540/0/0
X-purgate-type: clean
X-purgate-size: 1117
X-Rspamd-Queue-Id: BC0A95300BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,macbook.local:mid,citrix.com:email,citrix.com:dkim];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 04:59:03PM +0200, Jan Beulich wrote:
> ... outside of __get_cmos_time()'s locked region. There's no need to hold
> the lock for these computations.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I had the same thought about moving the conversion out of the locked
region when reviewing the previous patch.

As noted in the previous patch, we should move the conversion of the
century field with the rest?

> ---
> How come RTC_ALWAYS_BCD is compile-time constant 1? And then even with an
> inverted comment? Looks like we've inherited this from Linux, and even in
> Linus'es current tree it's still this same way. Yet all half-way recent
> chipsets I'm aware of properly implement the DM bit in reg B. Might this
> be another 32-bit leftover?

*shrugs* I don't know.  Seems like Linux is still doing it, so it's
likely safer for us to continue doing it also?  We had no reports of
it being problematic, albeit one could argue it would be best to
prevent such reports by doing the right thing.

Thanks, Roger.

