Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xpz8G+hgOmol7gcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 12:33:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879F76B64DD
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 12:33:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=I9llelxK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344186.1603308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbyQG-0000oV-CZ; Tue, 23 Jun 2026 10:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344186.1603308; Tue, 23 Jun 2026 10:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbyQG-0000ms-9a; Tue, 23 Jun 2026 10:32:04 +0000
Received: by outflank-mailman (input) for mailman id 1344186;
 Tue, 23 Jun 2026 10:32:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wbyQE-0000mm-MT
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 10:32:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbyQD-00GVHp-9u
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 12:32:01 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3a609e-bab6-0a2a0a5309dd-0a2a4502e25c-10
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 12:32:01 +0200
Received: from [40.107.209.10]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3a609f-fdf1-0a2a45020019-286bd10a1d60-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 12:32:00 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH3PR03MB7506.namprd03.prod.outlook.com (2603:10b6:610:19a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 10:31:55 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 10:31:55 +0000
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
 b=QiWNPP1pM65vsN99yTeqJkbnTk90R3Nox8aik1/vXaBeBNQKLQbKqvWQTHEDMvvjtcE7N4m4NkoH3l94wYV8g7RKbxmKt4ZOjf6KpuIkKI5InK8PM5ihoAm79vURKo2tIV95KYfB1s+VaJx4B3wTZYYdF0qJrjEolgAG8K34gP2dn+MIJKuDaEUwAqUnwZtRLopsp8kGikowHy3JatO5fCryZSAiE2U1TqSWJa9x2goHXqPqS9wOLpoguKgv+qMNoa2DY2i1Du7ma1aXx1xyn899rAUhmoaYAfLqBlYTixO8vjLD4i6YewHW99iNLIDa5YzinXJEqyNSmcVmWKCB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXac0mjl7/QGoGran/UohSEtKVomfRd1ZVnByLiz+xY=;
 b=YSNUEbPNspZLXN/23lm6C1+RZSFu4jDF5Ps53Tnu/W6ZQkpcdruNyDlf+OBy9KW+iULh1OhfExmcU+5InhupROc8vUkZNmnaG4iGOsSauaLxBOUZlSItgV/xmKMnpDKKMR1gwd8KOw3YVBMWiZMTyPrz2l+7/hUzRkJHwE73SBf4U+DzuY/gZ0bIejup+h8Fe2LIMbl9BnklG2CHi+HuCCS0wBwjyFnW+okW5fALA5EoZ5ZlNmFvaG/uhhp/LZJoWEVL5W9lp88QWMNGgqDOBPRKZemvKVd2s1k6BTReKkFcRRW1/lKFA1ThjSBGKLLTdbBX5MxF3ZFS7bR8XOT/zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXac0mjl7/QGoGran/UohSEtKVomfRd1ZVnByLiz+xY=;
 b=I9llelxK9Cawhn9fjAoJeRA/0TIEN41ONMLzKLNaCckYAiv3W02mGjSDTfXweb+r4XGcbS7BLk+Cy89uHKBa7D7eqz4fadE5TtuJiIIUViTGZMuiAwiQ+G/o+eHdhweNL6Wof17P4Vvn4VFRKcOiV8kY2MsY2Agz/6LzQOfqUYY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.22] char/ns16550: bound execution time of ns16550_interrupt()
Date: Tue, 23 Jun 2026 12:31:45 +0200
Message-ID: <20260623103145.76383-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH3PR03MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c9212a7-30fa-449a-b2e1-08ded112a5d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|3023799007|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	HcAyvpKXypORPBurikK8uUuCCTs2hFZgz15k4bOnKKZwdt/ToxIa0WNAojMhjgs2T4VGR2QUWJVcVlp+Wm9NXWH4ZKPEnVaDFfGPVjOxVzDBx5Xk2R3mKLqMO+uty+GdyFNvx/5tvyNyBLs4YabVkb+78Pb1n0NYgvxjVygCRH9c6f1UejkvnDKsfg1Ockx0DUkBsa7jlGPJ0aB7B65yaDbnt14HA8duR4/jCChmnEGxMbGe/pxhPI5nrZ/XgOp773ycoCozucejHG8Jv9yATSBbmXo5I5fkr1SUDNRKhIUSZPtu63hIftR8GhSAvXjCy59Z7KE4g2vEuNiNzxYKMekA+6BkYVhNN6XIL/mxa8y/pFzK74Hy5YPLzsxuyXK13ms4lDOhdL9KGK9Dj77ee5CbjPTlOIPxVXhh711M7lgEqtwvzXenji4RXgUhCu4at0soVcBj1D87Px7qO5y6h0oRrHIKlN+SubBwDlmbHQ1+5dMU6o5lp81EZehf8Iepom7lUWyw0o7b66M0ptf+PHJ0cDdzRVmHtOBfeBbs0FCfcCiA/T/IkUvZ9u0ByNP4WGQ7TOtckZoEx6gRmYn0exsiH1Eu4gOm2/CUWxPrTmPaN+ATcjpjJHoqJzN2dqq2maavwnHZ1MqqzVeJGrgqZX6LkaB2CiMVougwjduIwu0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(3023799007)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2Rpd0RPTThqU2JqU29lT0x4S0lDckRkeGdWZkRrczlLNjVEZDhnQUp1VW9C?=
 =?utf-8?B?MzRndVRHMnZHd2VaVldvUnFQYy9OQnN4NlNncjlGRHdDMHpkZFpIV3NnQnhm?=
 =?utf-8?B?UnlMYkxRcDg5TEZxeWo3NDM4ZHhqMzdQeHB6dktmNmovWHEvTzJvdnlGN2x0?=
 =?utf-8?B?RGVMV0U4aGhrQTczb1VkQWExaHU1TTlpOWFDL2tJRTI5REdQTTJ4anp5UGEr?=
 =?utf-8?B?NEhyanU3akFoQ3lQQ3VTMmhyaTFWR2ZuOWM0cUg0R2lmNlhRK3gzUWFlQXFS?=
 =?utf-8?B?UHZDMkp2OWlvT1E1S3VmZEpybEEwU0lpcVdIcUQ5aExVM2ZDWVlRVFlZRWpB?=
 =?utf-8?B?KzhyTFdkTUdEc1p3UzAyZUtBK2lKdW5lQ0F0cDM0S0hSWEM5ZEpQL1Ztdmlo?=
 =?utf-8?B?SmVhQ1RlcFVKaWJJNDhoSWgxVEpSdkpIanRCRTd6RG1BdWxmZ0JvT3EzY1ZJ?=
 =?utf-8?B?YlJnazlpT1lIbzVKaGNxWmw1UFA2RUZ4N2dnMklaYVhETWRMY0xiNm9uOGY5?=
 =?utf-8?B?d3dyUTh2Q3B1Z3c2MmFSUXl2eThrUG5pQm4xSjFpaGVJK1RCUDVCTUk1S0FZ?=
 =?utf-8?B?dnlYOXdRNHpjaW1MOGFtSzQxbU5jTWpvYnVWc08zRSt3S3BtUmtJVmFuS3Jw?=
 =?utf-8?B?VmZvbWFSSm5yU1ZXRWxrQnY3bTk5WDhUVXM1V0MrUVl2dzlzUHJWVUJnMnND?=
 =?utf-8?B?d2orYUhnS25YWWx4U3ZzOXN3WlovcDRocGhOMTl5elU5eHBYU0dMZ1dJTWZK?=
 =?utf-8?B?U1dmUjNmc3MreVBvQU5vNEhNMFU5Nm9TemovV1g1OWcySDFQK3J3REdydTV6?=
 =?utf-8?B?Vm1NOXo0OUFOZWt6SURCaE1FaG5tbjZEazFubHNOMmMrTERMK0NzUmFzWFFF?=
 =?utf-8?B?UjNlWWRrVUZkOSt2K0Nod2dCZWQ1RVpDbWdCdldZZTRURHVGNlAzL1JmS2h6?=
 =?utf-8?B?TkhOQ0hUT2krZXZlVjVSSkZsQlZ6UUllVHRNRmp0ZVhna0RrTU1LbE4yTWJv?=
 =?utf-8?B?YkFLR0JHZ1BtNmgzRDltU2lidERsb1VpOE9nRnNCK3F5UUoxRlYveTh3WThZ?=
 =?utf-8?B?UUQrSDRZZklhdHRIQmNjbGhhOUpxNndUL2FjWGJNTU9HVmxaWjNmODFDY2hk?=
 =?utf-8?B?UzEydWRHU3E5NUVKQkF6TTlqU0liMjRGOFR1akxKbk9EQlJ4elRiclFmcFRS?=
 =?utf-8?B?dTBkc3U1YkprUXpOSlNzRmFsQmZ3dnp1eHBTY0hseVhZMjNVUytqSmxaMGV6?=
 =?utf-8?B?eGxaMHAvMG9ZOWZsRUJ6OFhlNUdXV1p2QTU4RllZR2NLZHBVSXVsRlFWSzdh?=
 =?utf-8?B?Y3pudzRrTVZHNWM5RXJ1aXJtYzhwQkc4aUQ5bHRicENsVVg5YTFhTXFsYk1O?=
 =?utf-8?B?UkxJallnNFdSYnBtc2VORm9UTVhuMkdPTlhwcldPcnRaR2MvblJzS2k1VGdV?=
 =?utf-8?B?MEtWMlZ0MmVzelU4b0JzcDIrQ0lCVW05SzFzRWhWSTA3UzlnY3Y4ZWFLQWM3?=
 =?utf-8?B?bXdqR2c4Qi9TNDVIOTVTcWJGVk1mV2ZjT0thdlhwT1h2VWRPUHI0QXJjUGhX?=
 =?utf-8?B?U0Jtamo4ZFZDSTRmQ2o2eHVyQlBjUk10UHN4Wk90R1hlam9hcDR5U3FFSXha?=
 =?utf-8?B?clNaSkpvU0Jvb3dBc1B1ampHZ3BrK2djV0hOd3hPbnJBb3BlN1dZZHRZSHJy?=
 =?utf-8?B?VHBBM3ptMjllU1hVWTZnYjUzTGsvc2pSUWlMUnY1WE11Ny9yOHE4ZmsrWGor?=
 =?utf-8?B?VE5SVWpWNDVyTFhpd3IvMFBnNHBvK0lnZDBGRHp4dlFlcXRvRHhSTzJKa08y?=
 =?utf-8?B?cFJGbElMaFluN1NQb0pvUTh5RUFOQnZJcEQ3UjZTTDVUaFEvMCtyNlJreVVm?=
 =?utf-8?B?ZGNTUnJNZWJmaENsazc1MmFGSWZ6UTZzdUJuMGpnQUprNE5IVWo2RGNxYjhF?=
 =?utf-8?B?SmYwR0FlYWwvUjJCc1RDQVJHUkFpcnZmSTY2TTJXVTk2cUs5NDNRdnFjdXU5?=
 =?utf-8?B?b05pZk1wOEc2em04T0ZNQVRBT0p2S1dyYm1IVHlmM05jSTlvV2JyMVNKTUN3?=
 =?utf-8?B?QlBqVXhxZkpOSmNyTG9uWGdLZjl4Z24xaERXTWVCRG92SGc3ZHh3QVBYa3lv?=
 =?utf-8?B?c2kzNzdxdm9oN1J0c1JIYXFIZ1VScEpKWUFKeDNUSTloemw5Ui9DYW44RDhI?=
 =?utf-8?B?emFYaXV1VExUbEJxajNGdFE1b1ZRdm1tNUtINUROanhVaW5JTXBhalNKNVZy?=
 =?utf-8?B?YVVhYmV2SjlwUitLWEdSZUlubTJabmJDb2VKQWdGZHEzVk1rUU1wQ0x6Uk5o?=
 =?utf-8?B?OWpSOERZNUZyM0lTOXMzaXJJNkdOOUoxLzBSa2tJbGlpRVE2TndXdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9212a7-30fa-449a-b2e1-08ded112a5d7
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 10:31:55.6550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZyybfALPv34mqt98LxFPcdvS9P1NL15hqxJpueupw5oW2qoqN8gVqB8XE9igeqec61NsAOeidA5YMw/upyp3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7506
X-purgate-ID: tlsNG-720697/1782210721-44A113F3-832AF6DA/0/0
X-purgate-type: clean
X-purgate-size: 3862
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 879F76B64DD

The current logic in ns16550_interrupt() will loop until the device sets
the NOINT in IIR.  At least on the Lenovo ThinkSystem SR630 V4 the flow
control of the serial-over-lan emulated UART seems to be broken, as it
doesn't set the NOINT bit consistently.  The Transmitter Holding Register
Empty in LSR also seems to not be properly signaled, as even with it set
writes to the transmit register take ~6ms.  This leads to the watchdog
triggering very easily on such system.

Introduce an upper bound on the execution time of ns16550_interrupt(), this
is currently set as 4x the polling interval, which is calculated as the
time to fill RX FIFO and/or empty TX FIFO.  The current maximum is 5ms.
Once the timeout triggers the interrupt is disabled and the uart is
switched to polling mode.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
There's a possible alternative approach to solve this by moving the actual
interrupt processing to a softirq tasklet and disabling the interrupt
source until the processing is done, likely unifying the logic with the
timer task.  However that's a bigger change, and too risky for 4.22 at this
point.
---
 xen/drivers/char/ns16550.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 878da27f2ef8..008f673f52ee 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -62,6 +62,7 @@ static struct ns16550 {
 #endif
     unsigned int timeout_ms;
     bool intr_works;
+    bool force_polling;
     bool dw_usr_bsy;
 #ifdef NS16550_PCI
     /* PCI card parameters. */
@@ -190,12 +191,41 @@ static void cf_check ns16550_interrupt(int irq, void *dev_id)
 {
     struct serial_port *port = dev_id;
     struct ns16550 *uart = port->uart;
+    /* Set quite arbitrarily as 4x the time to drain the TX or fill RX FIFOs. */
+    const s_time_t timeout = NOW() + min(MILLISECS(uart->timeout_ms * 4),
+                                         MILLISECS(5));
+
+    if ( uart->force_polling )
+        return;
 
     uart->intr_works = 1;
 
     while ( !(ns_read_reg(uart, UART_IIR) & UART_IIR_NOINT) )
     {
         u8 lsr = ns_read_reg(uart, UART_LSR);
+        s_time_t now = NOW();
+
+        /* Break out of the loop if spending too much time. */
+        if ( now > timeout )
+        {
+            struct irq_desc *desc = irq_to_desc(irq);
+
+            /* Disable the interrupt source - it's never shared. */
+            spin_lock_irq(&desc->lock);
+            desc->status |= IRQ_DISABLED;
+            if ( desc->handler->disable )
+                desc->handler->disable(desc);
+            spin_unlock_irq(&desc->lock);
+
+            /* Disable interrupt generation on the device and arm the timer. */
+            uart->force_polling = true;
+            ns_write_reg(uart, UART_IER, 0);
+            set_timer(&uart->timer, now + MILLISECS(uart->timeout_ms));
+            printk(XENLOG_WARNING
+                   "uart interrupt taking too long, switched to polling\n");
+
+            return;
+        }
 
         if ( (lsr & uart->lsr_mask) == uart->lsr_mask )
             serial_tx_interrupt(port);
@@ -223,7 +253,7 @@ static void cf_check __ns16550_poll(const struct cpu_user_regs *regs)
     struct ns16550 *uart = port->uart;
     const struct cpu_user_regs *old_regs;
 
-    if ( uart->intr_works )
+    if ( uart->intr_works && !uart->force_polling )
         return; /* Interrupts work - no more polling */
 
     /* Mimic interrupt context. */
@@ -313,6 +343,7 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
     unsigned int  divisor;
 
     uart->intr_works = 0;
+    uart->force_polling = false;
 
     pci_serial_early_init(uart);
 
-- 
2.53.0


