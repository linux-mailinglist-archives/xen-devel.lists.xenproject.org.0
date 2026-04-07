Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDa5N/ge1Wnr0wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 17:12:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CF33B0B7B
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 17:12:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275105.1561070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA85w-0004D2-Hm; Tue, 07 Apr 2026 15:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275105.1561070; Tue, 07 Apr 2026 15:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA85w-0004Bd-F4; Tue, 07 Apr 2026 15:12:00 +0000
Received: by outflank-mailman (input) for mailman id 1275105;
 Tue, 07 Apr 2026 15:11:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wA85v-0004BX-Kx
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 15:11:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA85r-002YmH-9Y
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 17:11:56 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d51eb8-e002-0a2a0a5209dd-0a2a4501e41a-14
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 17:11:56 +0200
Received: from [52.101.193.16]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d51ebb-6fc9-0a2a45010019-3465c110c6a1-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 17:11:56 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5834.namprd03.prod.outlook.com (2603:10b6:806:f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 15:11:53 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 15:11:52 +0000
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
 b=pXJn1TPGxKDSdfRUPn5hp5ztx8a7/F1qnXeKVBfetTGk1fdQTapufnPAhnA+mSTaP3t5PnxKapypK5U+q1rqfrBbPiVhsl3ArxOrQGM8caLfmI8diwra9Dm5hPFnMuiJNw2MbxzVjdzw1llEB/p05/kmfW+jv2bBWb6Md8oSqokvO0khejIwkmkMm6wL188Hd1mW+cHuOaxFZJkOtfgr2QX4lGsQJ/ZKBXT3exCL/3GP3MzrvXt9x1LQLjLKYQZ7HZd7Dl/CJjEGomRrKwEo1tz0Vthpe9DIoI3myK1DjZRzaQVMxA3AJY7W9+Vgyq79QIp6ILMCdTcBB7h7vvTqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZW+wCXWqX8AyNyCRqHoD4suCIiZURPNLJJamfGx0KQ=;
 b=Nbh+sDNPj2q0hirRVCtRU9VX9bkmgkOjGfi9lpBePwRBFANcjucnbxHtadUAhnPhmxrsrouttbKsNeVZ9BkPAZ/Mz++Ke9LEANL4tldifro+FfJMAlSN0PCH4cHfeNhIU6AmiqbfukSYh4QIaCu8WkQOIRNw2qY8QzP1nGQMmiBJADJSP95wq/4YSrRpfXvER0IL74fePofiYFR+l1CzhSavpRTUgEO/L0gTlgfXPCiL4VCkFfPupmTb9CXtHsE2Dcw2oJbZnspe9azPfcwR2RnDnOBMhqguoNxfyiKF/mD4726n87IiSI7OaB5jhIxJHERi+VFmqu7pB1fl+Pc/+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZW+wCXWqX8AyNyCRqHoD4suCIiZURPNLJJamfGx0KQ=;
 b=niL9ZfhNrJb/jOfxVT/Iuo8CZNRdQiZh2OJ6eiH6Kw2QF0SP5Iqo2cw8yfzNH9qfXYEEV7tPGxanIWaGQFxYj+Aq3cG24fdcCukk9IzpEZi4NrK3fo+mQnHx7j/U83EaJuc2oZyeEG3i02HchDAqQx/aJg2q8LpOAiYvNGk+vy8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7c6879f6-8d70-4da6-8b6b-e03cfeb13a70@citrix.com>
Date: Tue, 7 Apr 2026 16:11:49 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 10/10] x86emul: support AVX512-BMM
To: Jan Beulich <jbeulich@suse.com>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
 <732d56d9-d200-410e-8b52-48c5e25bcf5c@suse.com>
 <50ff35c6-5da2-4c6f-94b2-025440ee618f@citrix.com>
 <0c481383-1ac8-4a31-8685-def51cdc9005@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <0c481383-1ac8-4a31-8685-def51cdc9005@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0095.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: a1816009-fca5-4c9e-3bd7-08de94b7ffdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AXZmWIdtiZ7UCaOaQmi3gEYex0v4TAV+P0PmN3RPGteNQ6H3WjmMTtMYBtl01MDhNm+PjavNcCsKXjkw4YQRk8oLfYuSujO30hn31RjVw0hVxiMof76VL2kM15V7u1a1BsvFUTUt7AGHjEgynEIUPgNokwUwnVHFuVpvLtBKRYJWwhdzgtkEkOordhcv0QgH7Rxl34m4FtRX7l5/qz2ICoFkpltO9scVtTqo59zpTa7xjJYIMU2sT5uV0F754DWY3eOc0X5f+sHEWUcAt6V6onBbHBYvEUzXrvZpCvnyPX4BmfqaWebTtfZWwScP9oLxDd4AQvmY0TWlol4GCHsIfB4TM9kmC5JsyDm8cJjNAL+w2w/MPLImyLmXebdB3ryGbGJiOf8P3v2vJIonJsgaSprEbZnzh4bl2iUOE5eyvrr3DNXgN8R3ytdd2+zMCQO9Yyo87QHOLkyLuXXk4YBWAAy2MG2FPmuLZjl/49NGjCOI5ZNckK8lmAscFN/jsENiYkgSnAAiDNVE8OquRxvvIhtzrMnvhUeSCwv1l2GQX+uoX2+cfF+PY0W6EmQIHTcuiBKW3b+Gk0ZkAdk9XCqoFtREgBek1hGF73sOuoq3IJuh0vufgOAY6lRC+qS3lljiqanVnZaErL6q948V8A6WBE77DZL35T3T8rrg6LNtPYITInNzoqHpmZMT93W/Pbp3Oijg0spjbP2+r4naDlUqfB/E9QuCnOGOHzqwAoD6fmo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjZSQnlsNHBrYmRmM0dzNUE2bklkT2MvVm9NSTVVUmF4RndGQ0JyWkpCOHQ1?=
 =?utf-8?B?b25QSlZ2eHFpSGFqdXlpM2tVcWhmRzJsam03V1g1ZDRUWWJ5cTRZcVVuKzVQ?=
 =?utf-8?B?bWRadVdtT1ZuVjJMQlMyblNzU0JvcmxlZ2tRcTNpUStzd3ozQ0VZdEhSVDNP?=
 =?utf-8?B?SHBVS2crSElPdEpzdGpEVGpuWWtGTlJ5dlZpTFRjdHRKb2Z3UGdPemlWdHpv?=
 =?utf-8?B?blRHRHEzU1VTcFJrdFZTcXpJYzdKaVNFL05yK3ZvbW1UZUF0VkxuazIyQmlB?=
 =?utf-8?B?SGRvNzMwbDR5VzVRdVFaeUUrNWhtazNOY3NtUDR6dFZZYm16YS9RQmtVQzg5?=
 =?utf-8?B?UDZuQ1ZaWm1OcWdTcGI1d1lOK1Uwd202cFI1azZQcEZ0Yk5yR3FwWFZESUx3?=
 =?utf-8?B?S0QzbkdhV214UUFtRkNKbWkwZ0NJeWhUbDF5KzNhdzNWTkQwVDNVWFUxbGlC?=
 =?utf-8?B?K0E3UG1YdFRLWWhXYmpZRjRlSGk0NnBuQ09xbjRrdlVkT2JwVnh6WUdqc3l3?=
 =?utf-8?B?ck5waGoxelVQdThPajFKSU9uemtYTTE1d2NFNS9hSENibTc4MEpCQmN2NURU?=
 =?utf-8?B?YjhUakJZNkk4amdlblVtUGpGc05VNGZKcURyU3RPSDFPVkZ3T21icmlEVmNn?=
 =?utf-8?B?bUdpWGwrN0JEVUpDTC92NEcyZVpTTXNJMC8ya1ZBaXpPOE1Rb0xMTFhzOEk1?=
 =?utf-8?B?TjVHMDdkaThROHhQSU9vMHRJMVBVYWxOelhCQW5NbnhHaE1YQVVZZEhwM2Jx?=
 =?utf-8?B?TkRNd2prQ3h4WHVZNGEybG9zYkxxTDBaT0pnZmNIVlhtbE5xRTFPSWR4bzc5?=
 =?utf-8?B?ZFY1SUFGNEZ5MXJhZG15UU9iV01YWmhPczZOaG9TeEVZYXpadVp2WnNnL2Nk?=
 =?utf-8?B?T2sxWkVtSE51Q042Ujd5ZGV3U2Jjd1BQMEk3Q0laaEVqREFpeFp1WnNVdzQw?=
 =?utf-8?B?NkdQaG4yQmRaZWpjME0wM1RJdkhYWCtwbW1hVjY2Q0ZYUnRBWlNSbXJHWDFi?=
 =?utf-8?B?bFZiV3d1NnNzUmlTQVIvV04rRFJkVStyUHhBdlE1TXQveGtwRTdLUFY5Kzha?=
 =?utf-8?B?THA2TW82MG1Tbm8vL2JoVHZuUWhrQkhSSHpmYjd4dUVxNVU3QWdaNTRCU2VH?=
 =?utf-8?B?bUNER3JLdTZKbzdrUUd4Q0U3dUs4aEhIdkxRNllLUzRwaUdwTi8xU3pMeEN4?=
 =?utf-8?B?R2w4UTVxK1VlU2plQS8yVHRkQWNpWFBIWDloU3o4U280WU5Sc3o2Q25HeGo5?=
 =?utf-8?B?czN3aXRkR1VBOE56SVVmSy9nUVppNVc3c0tyY1Z6SnRWaXBIZXEwK0FYWUlU?=
 =?utf-8?B?UitvQWJjaWtiV2hvRDE5dDNHbjZiazRub2pXMHhFcVcvMTNtVVEyYkNFRDVw?=
 =?utf-8?B?NUFNaFNpRDJ5NkRDS2Q5aHJqRjUzWHVQSCtmaWI2WHZoaUpHTldlQk91YWs2?=
 =?utf-8?B?Y3RUWDdyNXp1YXNpNElUVmR6bWhoWnFPR2ZZUm81THQ3MmFUUnhkTi8yZ3JF?=
 =?utf-8?B?NTExUnBubHM1NGR6M3YvL0UzLzJKblhTUUE0blYwRXlZZmRsZlJHeTBkOFhL?=
 =?utf-8?B?b295c3lNUGdnVFpTaTMrNWlFb1RKTWlVZTRDMDR5Ni9kcm00RFhqeFdTY3Y1?=
 =?utf-8?B?UG9tdHlSaXNKY1oxKzNXNVY5TXpQeU51NC9DYmxLb0pXZ0kyNWdlWWJvQlV6?=
 =?utf-8?B?ck02YVIrSDJadW01Uld6UEYrUzd4M2x5M1RkU0hhWHNjZ0pvVVAwbWNwWWdo?=
 =?utf-8?B?MGl1MHFUdDMrVnJsMnA1cDdDQXIvMjd1dk8xL1F4anNCWUU2Y3piaGI4ZzMy?=
 =?utf-8?B?YjhST1E1dVBkOHVtUFhoNmdFa1R3VDQ5NVRNck9qcTlRS0lqbUJ1Y0R4VG1q?=
 =?utf-8?B?K3JZeWtTVVA4OXIvc3ZZYW11TzBxTHhRSFpvRlBPYy9zamJTcGVaMTNDN1k1?=
 =?utf-8?B?WUg1NldTdTZqYXJvZXhLMCs2Q3hvUU1BVlExeW4za2RFRzN0TlRKTE1aVHB0?=
 =?utf-8?B?Znpib3ZxcjFBZzEwUVBiRUtVZjNScCs2amRJdkZCaHhGQnNrcmhsRW81cXo1?=
 =?utf-8?B?ZmVJNXJOcEF3NVEyUUp3OWpSdUZPYVpjNEVKN0l3bytnSEd3U3hYQ3Nwb0E1?=
 =?utf-8?B?cWszSWZ2cHgzUy9lN0R6YzN1SWJyTkowYXRNNExvZ2RheW4wNVcrUkVKZU9G?=
 =?utf-8?B?L0dNRkJwdTF0UEUxZVR6NGlJNnFBdGN2VE81TTNoY2ptVDR1THhWQ0d4UktS?=
 =?utf-8?B?NXorS1hJQmVQL0pReGRhVjgrN2lIRWcya0RuN256d0hVSHplVUdEQkNYVStY?=
 =?utf-8?B?b3diZ0hCWkUvNHU2S1JFMm1NMU43MlpLd1FKL2MxbVRaTWphZU1ERXBYcUpF?=
 =?utf-8?Q?OtxTlWDsaQnwnw7g=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1816009-fca5-4c9e-3bd7-08de94b7ffdc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 15:11:52.7597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NboMMPrYtDesitsYN+ymZRANyycUak6zfts7omgN1V37uyomq0ByMXu02otCVAYvaK9s+tsfrblK4NlK67HrjlFhZZv5oJMpcFG3SCHDpd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5834
X-purgate-ID: tlsNG-d62444/1775574716-150E0185-FB64FAAA/0/0
X-purgate-type: clean
X-purgate-size: 701
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 45CF33B0B7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 05/12/2025 12:47 pm, Jan Beulich wrote:
> On 05.12.2025 13:33, Andrew Cooper wrote:
>> Very tentatively Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Thanks. I'll put this into the patch as-is; it's unclear to me though
> whether I could legitimately commit the patch with this. (It really
> doesn't depend on earlier patches in the series, after all.)

For an off-by-default change like this, it's fine.  There needs to be
another patch swapping a for A when we get access to real hardware,
where any other changes can be accommodated.

In the meantime AMD have published a spec
https://docs.amd.com/v/u/en-US/69192-PUB so feel free to upgrade to a
regular A-by.

~Andrew

