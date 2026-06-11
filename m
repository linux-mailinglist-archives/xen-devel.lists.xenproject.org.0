Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vaiVCjttKmqwpAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 10:09:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A4166FB75
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 10:09:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=j7W40Gnq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1335176.1597624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXaTH-00066N-U8; Thu, 11 Jun 2026 08:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335176.1597624; Thu, 11 Jun 2026 08:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXaTH-00063p-R4; Thu, 11 Jun 2026 08:09:03 +0000
Received: by outflank-mailman (input) for mailman id 1335176;
 Thu, 11 Jun 2026 08:09:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wXaTG-00063j-MN
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 08:09:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXaTF-00A091-OA
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 10:09:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2a6d1d-e002-0a2a0a5209dd-0a2a4507d518-0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 10:09:01 +0200
Received: from [52.101.48.40]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2a6d1b-229c-0a2a45070019-3465302846ab-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 10:09:01 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MWHPR03MB989341.namprd03.prod.outlook.com (2603:10b6:303:2a8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 08:08:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 08:08:57 +0000
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
 b=xu73hOPIeRcV3Es5GvZ8mlzII+RsZhvglOUf8m2eGSo93gqoLZgK6fQkcaqMNKtmN1iwmpEE8RzvVAUL2armtuTfPzfLqJ1YDcqom78WR/KRF0MEiLlN68uMtjZDDwudqwiJapz9Wr2tw0/d1Ae6//kHUYgFWeYnUQxLZuVCgyn5Exj2LUg9dwYTO5w1iEXvCbxzqXAYQEZ0W7qOmTKDu7C2Cs9Iluxe+3/OeGwaJUpqawxF2t+JwZG2a+nElI30Mj9Wp2utipd2KG3IuBX9lfHxJpx6fpRTMiosCJ7G1TsBw+UgggGlUdnNvJSb0dRzbUyo5DLWwVFcH+8bNuEhGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhM9SDJwUwcFVUro1wVHTOQpVWwH6UWu6BSkodrAWSI=;
 b=gk2anq1OX+UVTqH+yzscaOtqygxD3afdVAleOaHF/afKxGpmWhH9VB7CUIcff/qCIInyU4uw0rsTrspRDNyOJl7aeNorki0kOGK+V0LPlt9qwKn8l/TQVOPOFxiv/1Ey/2q5SxKc92vrtrHALncBVPaSp+Aya3WPUmUkzIczlkIvmcCIYsRsmKYXSXryspi2UfPobsXTVIy95RPRslRmo3WUKBRqBFUKPkfK/4VF61FzScCiMAur6HzH6GgVBRRFIcDXCYplxiTrTlBYd+oKt4t2T1kZ0kId0Wj8uamUxtMyAG143ruqAReDCWtQMCUXjlZqQrDMKbS1F3SCvj4ywg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhM9SDJwUwcFVUro1wVHTOQpVWwH6UWu6BSkodrAWSI=;
 b=j7W40Gnqko2XHuyuHn0XzPbOpxpABs+4yRCsNL2BFnLHbjbCKbVG8OYCL8SKdtsBZTil9GEQlZX221ZPZLgkQ4GNllz4OsTGqmspq35ZFWjGbQIYldaRYrJZkztGu5ZG2l5k3n3s0Jx7Y2+oLgRVappKyJcPbIWOAoFqZZeVMAE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH for-4.22] xen/x86: Change stub page allocation/free
Date: Thu, 11 Jun 2026 09:53:42 +0200
Message-ID: <20260611075342.58428-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0512.namprd03.prod.outlook.com
 (2603:10b6:408:131::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MWHPR03MB989341:EE_
X-MS-Office365-Filtering-Correlation-Id: b09eab00-9e20-407b-c8de-08dec790af8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	X4GbKWVq0u1347bDBxdOkPWFBeyrVVfHjhAg1D6AphD5YMgNgZKrjSX9dXX9nls0Xml5nUpn+Qp6M5m+8UJ36mlizPkGg+W5gDyk8gwFUm3s/sb0pWibCPjksJofVjphBlQVSqDkr/rTIBZc8/0Mnh9/IrGq7GSIsEm1Qqt2RCqMimQf4jxpsCU3h+jQ5wzsrsaXnLhAEx7kXVvIbbXUl4kI4/lVC2ysWe+xxGvuG3VXAt6eEOHDvU2lEhRIOrUZlwHW+Gsi+Z22qIoDVnv6/lQyBHzNnw3y7tv2l/C4HJWQppEwfmW5GpKttTfjumknbWyQq1ATnLz6XDluMLL458Q63gfEn7AJBZgta9RVGp6fDRC4E99XjLp9yB1iGaRQccW/6zJttFbwA7B1ZJkTH2yzTkOzyAVqEgfhK8GPdVc2JbFI6IfGl/3KhxGlEBwNWTYIxftaRteayPhnt6UTvVBKL/P7WsHHPq05mwg/NRL9NaLG8PVCDYIAm6b4W+0xokY312pO9/7H3NPrIeGEUNUNB92fTEVUdBJm4Zzau3po/R3Z4GdIMKZG5V2ta+CEAx+LOiy9ysbQVvbNUvog+Pw+7YmNfeX8pwFa5R8Zvfrzzc6CdNeS+mJx0WQaFG3/wNJ+WmtFwNrxShu3Lv57zyre03ja5YXYe7GE0FVtn3xCS3rVbZiN7rnlqfOzleOj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3BSVmdieHJEU01wYnp6RDA5dnBhblN4SEZVZDFQNlVFSHpPSHNtc2FSTGo4?=
 =?utf-8?B?ZlZTM3hXOUJ5RTY0UWVRTHVJSFhEd3Z2TXNOZERGRkRuZy8wbjJyL3dDa3Jj?=
 =?utf-8?B?andBd3NueGlzVFJPdm1MYzBjaUxNODBKZ2hjWlZLOExpRnBycVJQWEZWWjdy?=
 =?utf-8?B?eUx5ck5BZnE2SEw1RmEyL2crK2Z3MGlWVHp4bjduQURGVExUaXdrTjZ3VGd0?=
 =?utf-8?B?a0s5OERwSUlyVm5QUHE5bkNHL2FyTFpDQWFXdG5wMmFoYm02WHBtWlNodmov?=
 =?utf-8?B?Q0k2SUFidTZmUVNWb1dtRFNCVU9HT0tFdHNTN0NvdTVZeG1IazdTalRRY2Rs?=
 =?utf-8?B?ZU10RDVieXdoSlI4UlZVNkNRcUhWVHFGeDgxakszYXkyTEJKSDhGc1VSZmRD?=
 =?utf-8?B?YjlGL2RRZlpROWlJbnZhZHM4ZDZ6V2RyRGtFRU0vUkRCTlpvM3lmeERxZG5H?=
 =?utf-8?B?dkx6NlVvM1hrQWRTcjRaNTE5N3UwUFg2K3ByMUdocHQ2LzNMTko5ODF3Zk1w?=
 =?utf-8?B?ODBrVG9zVDZKVkRPOGJvSGlueFpaREdncVl4ckpxcWdUbmFsU0tFdWhWUi9s?=
 =?utf-8?B?eUxDRDd5c0dtSUtUc0JqSzB1QU1OdEQ3MkVlM1BCLy9vaU9GL0JMTUJ6Q3lv?=
 =?utf-8?B?Vk83UWV0emlIS2wzWHZtSkpJdUs3SkZEZzY2OUZLaUVZNlRNUzM2dWcvTUYv?=
 =?utf-8?B?ekN0RTh6Sk04VWRGaWs2dVNMOHFySHBJbDZNTlR0WFlBK3E0a2U0UGczTTB1?=
 =?utf-8?B?Q0NJcTF5elBteGtBVlZXdGJhQ041K1htZ3NuQkh2Q21vZm1WdlhTVGk4UDU2?=
 =?utf-8?B?WGRhdUVacTJITFRTSkRxekkwSlFxNjY3NStjcFVxTE11SUtLeW40UzNvenlw?=
 =?utf-8?B?bGNPQVAzanloVjFhV1FmYXFVZllMeXo2cjdqbWI4SklLVkUyeXk0NE5BREVG?=
 =?utf-8?B?eXNVOG1aMEcwZ0h4WmEvakNyV3UraERpeDIwNndkc1doaWNlRVE0RDU4TU0v?=
 =?utf-8?B?aEJFaTd3SUhoL2QxM0ZFbmpvNUx4YlF6ckwrUnBoMUErOS9YdzV3cUk1enV2?=
 =?utf-8?B?NEZZVUxONU9Na0RyUHJpZHhYRGJyTFFBNFE0OWtjUmxQWTYvZEdORU42MDlF?=
 =?utf-8?B?aTNCYktXcnI5MThUS0pzZG0rckhDOTUyOEJ2eEZJeTJHTmN2eHpzRGxGb1RV?=
 =?utf-8?B?b252YWphRlFlejJTQ0JaNm42bEk5UFdmR3ZRZmE1Ri80UTY0cytTRUdSVTBX?=
 =?utf-8?B?VnR5QzcrRzc4a2kydjF6QmladDhIajVoazFFSi9zWlBUYU5LcEJ1Rm16bUh6?=
 =?utf-8?B?aDY0V2ZhbkE4MjRvSDRPYXhmV01qdWpPem9XWW1XZGtFNC9WeUcxM2pTUGQ0?=
 =?utf-8?B?YnJCMENWQTYvajJDZWNTU01iVzgzYTVhWWQzci96eVBGWVpIOVYxSjBxb0Y4?=
 =?utf-8?B?b3FQbjhQN3dub29hK2J4aXhGUmJ5emNwWUZsUzVMUTk3VmJLTlVadEhjaXZF?=
 =?utf-8?B?N1VVQlEzeUVzVmtoRWlVUmlIbzhwdEsvMUgvKzJKOHo2dk4zMVpwaWdVYS9p?=
 =?utf-8?B?eE50ajRZR2NHU2FhSFp4RncrVTdadEsyM2JlK3hodC96dTdmblBBVjhOQ1JG?=
 =?utf-8?B?RFhIaHkzVUhPUVM1Y0tDYkxva29Ob2VxaVBZOGRVSS9NMElrK2EzeGNnQWkz?=
 =?utf-8?B?YnR1SkdxRm1vN3FyUURUd242d3ptWHd2NU42amhQaDc1dHdDWTY4MThSbUl1?=
 =?utf-8?B?SUpWclpjL3dYL3dJV0VqNFZBaVltWEJndTZQL2cvME1kU2tEbnZQdSt2cE1R?=
 =?utf-8?B?dDNzM1VSajY4SzhVcDFpc0ZCbHJsREpTMkxBcWEyVVpiTC9lU1phRkhFTk5p?=
 =?utf-8?B?c01IUkxCRlVTL1dnRUd6dDQyOW1GQU0rVEFuM3IwOHo2VU5MNXp2OHFBYURJ?=
 =?utf-8?B?M0tXQzRDT0xjMzhINHZ6L1Z5b2NqejVSOHhZNmJHeVhRZ1dWOGpMZjVLTGxH?=
 =?utf-8?B?L3g4TnlIWnVqT0k3Z0grU3krczI2cmJXRy9qZzd3VEkrdHFTc3kvcDVTSGUv?=
 =?utf-8?B?cU5hSEJsbXF4VXJzVks2WXpob3g0enNueVM3OTlRMTU4UzJzeUxsR0tVOXpk?=
 =?utf-8?B?cHVDTGgrdW9DeHhzNGNybHJUZGVSQUptKzgxQjVKMDFsallOaEVWT0Zid0Nu?=
 =?utf-8?B?Y2dWc2tjYS9OdWFBcHZJU01HRHpTeGMzbzdibVRrdXZnNHdoN0hjeFkxOWFL?=
 =?utf-8?B?c2ZwaXdUeUtRSys3OUJ5WnE0bEgxTkVldkNuOGJyb3ZnaUhsY25DVmRiTDYy?=
 =?utf-8?B?ZjRpNEUydnJQTlN6cVFVMXNvNDlSZWliSlZCcFNOeTBMcWlmaFpQdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b09eab00-9e20-407b-c8de-08dec790af8d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:08:56.9495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00+GmuMgiZ9re/JuQaBWmDC17yU7aizD8lnRctXHWHLxb8kGZQqdfdm61+baamzxZs13sTmqjM74zfmojJn9LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB989341
X-purgate-ID: tlsNG-ef75cf/1781165341-23374C48-8D0306E1/0/0
X-purgate-type: clean
X-purgate-size: 8111
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
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,amd.com,suse.com,citrix.com,vates.tech];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05A4166FB75

From: Jason Andryuk <jason.andryuk@amd.com>

Today the inline tracking of the stub page is problematic.  0xcc is used to
indicate unused, but it is also a "clear value."  A !CONFIG_PV build with
smt=0 will bring up CPU0, bring up CPU1, bring down CPU1, and free the
in-use stub page.  CPU0 or subsequent onlined CPUs can write to the re-used
page.

The new approach uses a global, CPU-indexed dynamically allocated array of
stub addresses.  However, to handle NUMA aware allocations, we cannot
allocate all the memory in advance because of the NUMA dependency.  Take
advantage of the fact that Xen will attempt to contiguously pack CPUs on
the same NUMA node (see normalise_cpu_order()), and on CPU bringup use the
same stubs page the previous CPU did if suitable.  Note the code would
still function properly even if CPUs from NUMA nodes are not contiguously
packed, it just consumes more memory.

stub pages are no longer freed.  They remain referenced in the global
CPU-indexed array and are re-used if the CPU is re-onlined.

stubs and node_stubs don't have an explicit lock.  During boot they are
accessed single threaded.  During runtime, &cpu_add_remove_lock serializes
access.

Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
There are other even more simple options here: for example Andrew proposed
to pack stubs contiguously in both the physical and the linear address
spaces, at the cost of possibly loosing the NUMA memory affinity between
the allocated page and the CPU using it.  We have decided to go for a more
conservative approach here, that keeps the same properties as the current
logic regarding NUMA memory affinity of the stub region.
---
 xen/arch/x86/include/asm/stubs.h |  2 +-
 xen/arch/x86/setup.c             |  4 +-
 xen/arch/x86/smpboot.c           | 91 +++++++++++++++++---------------
 3 files changed, 49 insertions(+), 48 deletions(-)

diff --git a/xen/arch/x86/include/asm/stubs.h b/xen/arch/x86/include/asm/stubs.h
index a520928e9a50..7d8d302e0623 100644
--- a/xen/arch/x86/include/asm/stubs.h
+++ b/xen/arch/x86/include/asm/stubs.h
@@ -32,6 +32,6 @@ struct stubs {
 };
 
 DECLARE_PER_CPU(struct stubs, stubs);
-unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn);
+void init_bsp_stub(void);
 
 #endif /* X86_ASM_STUBS_H */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4192edf635b6..cddf8806c877 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2089,9 +2089,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
     init_idle_domain();
 
-    this_cpu(stubs.addr) = alloc_stub_page(smp_processor_id(),
-                                           &this_cpu(stubs).mfn);
-    BUG_ON(!this_cpu(stubs.addr));
+    init_bsp_stub();
 
     bsp_traps_reinit(); /* Needs stubs allocated, must be before presmp_initcalls. */
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index d8fd71ffab37..3282392317f4 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -20,6 +20,7 @@
 #include <xen/serial.h>
 #include <xen/softirq.h>
 #include <xen/tasklet.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/apic.h>
 #include <asm/cpuidle.h>
@@ -641,41 +642,61 @@ static int do_boot_cpu(int apicid, int cpu)
     return rc;
 }
 
-#define STUB_BUF_CPU_OFFS(cpu) (((cpu) & (STUBS_PER_PAGE - 1)) * STUB_BUF_SIZE)
+/* Dynamically allocated, indexed by CPU.  Store physical address of stubs. */
+static paddr_t *__ro_after_init stubs;
 
-unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
+static bool assign_stub_page(unsigned int cpu)
 {
     unsigned long stub_va;
-    struct page_info *pg;
+    paddr_t addr = stubs[cpu];
 
-    BUILD_BUG_ON(STUBS_PER_PAGE & (STUBS_PER_PAGE - 1));
-
-    if ( *mfn )
-        pg = mfn_to_page(_mfn(*mfn));
-    else
+    if ( addr == INVALID_PADDR )
     {
-        nodeid_t node = cpu_to_node(cpu);
-        unsigned int memflags = node != NUMA_NO_NODE ? MEMF_node(node) : 0;
+        nodeid_t nid = cpu_to_node(cpu);
 
-        pg = alloc_domheap_page(NULL, memflags);
-        if ( !pg )
-            return 0;
+        /*
+         * Attempt to use the same page as the previous CPU if possible,
+         * otherwise allocate a new one.
+         */
+        if ( cpu && nid == cpu_to_node(cpu - 1) &&
+             PAGE_OFFSET(stubs[cpu - 1] + STUB_BUF_SIZE) )
+            addr = stubs[cpu - 1] + STUB_BUF_SIZE;
+        else
+        {
+            struct page_info *pg = alloc_domheap_page(NULL, MEMF_node(nid));
 
-        unmap_domain_page(memset(__map_domain_page(pg), 0xcc, PAGE_SIZE));
+            if ( !pg )
+                return false;
+            addr = page_to_maddr(pg);
+        }
+        stubs[cpu] = addr;
     }
 
     stub_va = XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * PAGE_SIZE;
-    if ( map_pages_to_xen(stub_va, page_to_mfn(pg), 1,
+    if ( map_pages_to_xen(stub_va, maddr_to_mfn(addr), 1,
                           PAGE_HYPERVISOR_RX | MAP_SMALL_PAGES) )
-    {
-        if ( !*mfn )
-            free_domheap_page(pg);
-        stub_va = 0;
-    }
-    else if ( !*mfn )
-        *mfn = mfn_x(page_to_mfn(pg));
+        return false;
 
-    return stub_va;
+    per_cpu(stubs.mfn, cpu) = PFN_DOWN(addr);
+    per_cpu(stubs.addr, cpu) = stub_va + PAGE_OFFSET(addr);
+    return true;
+}
+
+void __init init_bsp_stub(void)
+{
+    const unsigned int num_cpus = num_present_cpus();
+    unsigned int i;
+
+    ASSERT(!stubs);
+    stubs = xvmalloc_array(typeof(*stubs), num_cpus);
+    if ( !stubs )
+        panic("Unable to allocate stub array");
+
+    for ( i = 0; i < num_cpus; i++ )
+        stubs[i] = INVALID_PADDR;
+
+    if ( !assign_stub_page(0) )
+        panic("Unable to initialize BSP stub region");
 }
 
 void cpu_exit_clear(unsigned int cpu)
@@ -990,19 +1011,12 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
     {
         mfn_t mfn = _mfn(per_cpu(stubs.mfn, cpu));
         unsigned char *stub_page = map_domain_page(mfn);
-        unsigned int i;
 
-        memset(stub_page + STUB_BUF_CPU_OFFS(cpu), 0xcc, STUB_BUF_SIZE);
-        for ( i = 0; i < STUBS_PER_PAGE; ++i )
-            if ( stub_page[i * STUB_BUF_SIZE] != 0xcc )
-                break;
+        memset(stub_page + PAGE_OFFSET(stubs[cpu]), 0xcc, STUB_BUF_SIZE);
         unmap_domain_page(stub_page);
         destroy_xen_mappings(per_cpu(stubs.addr, cpu) & PAGE_MASK,
                              (per_cpu(stubs.addr, cpu) | ~PAGE_MASK) + 1);
         per_cpu(stubs.addr, cpu) = 0;
-        per_cpu(stubs.mfn, cpu) = 0;
-        if ( i == STUBS_PER_PAGE )
-            free_domheap_page(mfn_to_page(mfn));
     }
 
     if ( IS_ENABLED(CONFIG_PV32) )
@@ -1041,10 +1055,9 @@ void *cpu_alloc_stack(unsigned int cpu)
 static int cpu_smpboot_alloc(unsigned int cpu)
 {
     struct cpu_info *info;
-    unsigned int i, memflags = 0;
+    unsigned int memflags = 0;
     nodeid_t node = cpu_to_node(cpu);
     seg_desc_t *gdt;
-    unsigned long stub_page;
     int rc = -ENOMEM;
 
     if ( node != NUMA_NO_NODE )
@@ -1092,18 +1105,8 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     memcpy(per_cpu(idt, cpu), bsp_idt, sizeof(bsp_idt));
     disable_each_ist(per_cpu(idt, cpu));
 
-    for ( stub_page = 0, i = cpu & ~(STUBS_PER_PAGE - 1);
-          i < nr_cpu_ids && i <= (cpu | (STUBS_PER_PAGE - 1)); ++i )
-        if ( cpu_online(i) && cpu_to_node(i) == node )
-        {
-            per_cpu(stubs.mfn, cpu) = per_cpu(stubs.mfn, i);
-            break;
-        }
-    BUG_ON(i == cpu);
-    stub_page = alloc_stub_page(cpu, &per_cpu(stubs.mfn, cpu));
-    if ( !stub_page )
+    if ( !assign_stub_page(cpu) )
         goto out;
-    per_cpu(stubs.addr, cpu) = stub_page + STUB_BUF_CPU_OFFS(cpu);
 
     rc = setup_cpu_root_pgt(cpu);
     if ( rc )
-- 
2.53.0


