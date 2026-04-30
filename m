Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGW9A4VB82kGywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 13:48:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3BC4A254A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 13:48:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298074.1573652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIPrR-00088k-Fs; Thu, 30 Apr 2026 11:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298074.1573652; Thu, 30 Apr 2026 11:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIPrR-00085u-CW; Thu, 30 Apr 2026 11:47:17 +0000
Received: by outflank-mailman (input) for mailman id 1298074;
 Thu, 30 Apr 2026 11:47:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wIPrP-00084H-Pr
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 11:47:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIPrN-006Elg-5Q
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 13:47:14 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f3413f-2eae-0a2a0a5409dd-0a2a450ac036-8
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 13:47:14 +0200
Received: from [40.93.198.22]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f34140-56b3-0a2a450a0019-285dc61645ba-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 13:47:14 +0200
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by SJ0PR03MB5503.namprd03.prod.outlook.com (2603:10b6:a03:288::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 11:47:10 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c%6]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 11:47:10 +0000
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
 b=DkuXLB01deW4cPfURSauhuLNTRO8UX8AXkPXi7udS5kAFhrlT3D5eNhp+nqnbXmDHuTlG2k5fVriMqOgZbmKvIyCSS7qyBKaTlr4froz7V5eN+CUe6Yqj13aiNrnSEdvcQetHrHE7s9ZCEhkXjTR6b2wL2fIdNlkWClpMsBQebDqKcBJhWjh2b3Wym6MfyJqKTcXyYQ+b5fa7C0TEV8NHAZ4go02urjQN0qm8qY50Bod5zco6qNrKs05yGr47yWTNn+AxUa8sILCvJDn5nKJrombbfjd0qfAbZZ0NzuOC6MunEPiiMMVkdVclNtDRuubn/EsFEBY4I0rB5s3/BwQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GA0I+u7PVwRVBZ78yAc4QDA2zYRbNwF4+FJE2Bq+94I=;
 b=OKfmQsJJ8WRvsasonebuXWdXXNTnocJGq9AQu1tKFwb1juP5AZAlH1DZpamk/hhD+2xSVDdQ3H3wm1cZCdewvWlfaoKSrJeDnaCzKQw3/OxVdJ2pMq+gRI7UTwNBFpm6uhaLjLlmxjgNFHWVL1Vb+vLPRvPH2ZoeKgU+IHyD4Bsphrlr6xsisa4c1MKFvsZceNlBrakJqC9eGD137RBZt8X9/hVFLlf8Q6zMnvFEguVhlJ2BnMKAvJr4LSpefUXn+SVObVHLfrqOcXtIJNjgoRmcrlPo+qjUUYNkZpomYJNoJa+s5aZhgyOcPbmT+4rzTuqOLVqvRqiS6EPoowDkhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GA0I+u7PVwRVBZ78yAc4QDA2zYRbNwF4+FJE2Bq+94I=;
 b=lWQdoMWQNajCiEM3nJqfhj6QXI5s6o9JCMYudwTVnr1qsk7NpvE3KVJQRYUh/57GqF7EotYf5l8rU4t7aA1psQAuvWHmiHhjBsy5Voxuv1carwisoDbrRJ1xPP6eHTTuVmRnS1wXQzWvgHKXKO9AWdEzwvRYxXOjrT2uwG+0O5c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/cpu: identify uninitialized CPU data using BAD_APICID
Date: Thu, 30 Apr 2026 13:46:47 +0200
Message-ID: <20260430114647.94526-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0547.namprd03.prod.outlook.com
 (2603:10b6:408:138::12) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|SJ0PR03MB5503:EE_
X-MS-Office365-Filtering-Correlation-Id: a85daa8b-4bb4-4704-8842-08dea6ae366a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Bh17C8oRjEY0POg5b8Vhz90BO+Kren+bH6h1/bjf//peZPBb0g64zDlHxOgxGHcbJrJe3g6sM19OzLDCjENgdVcobk0Jd6XQE1hRTL3dQbhkyV9l5f4g300xSfczLn1P684IaNnnuqy8bTMzCvQT2D+MgfA5+PemZ27HTQ7198rcC8nzX0Pxm1o1L6DpYecclsZ6mpG4pnP4VGW8+Ui3reNjA4qaXCez/EfjGK60ADeyxwYH4OXNvt+bzk3X1E/EI4aUbhwlRbZNpP7UaaHHyfowafJfs6o4sikE/Gfiszcq8oc7xla2tv9Q5x1z2MD313v2Ul5B8QmUxh0vwN83DniAcK6LkFmzeGqQZgiUkW3g90Bf4RY+88DxtMu6eoh9Ijxr5AqkNkMg+Mb/iSrGm9X7mT3DNfvnsEARf8oeCkh2FwvnzOXKYNOvCq9bT+tJ04JaAOz8/Oeam8bhnLEZK+26iGOxlV54YtiRExeRNdwur0yqkblULOh3LRB0a6r5PTqLJYPdJQvNhPohIvvuHosKvmCUdAR7AMZWqVL680we94fOCcMmhINveNsYYnYKI0xpdvzP/RGD6iOQNleeokVIUJmruILoEtgy6ttH8mKO1CehZUdS52s707TI9OaPONiIQIteimD2nC+69XEktEBDQN0BqwCP2WKDNrcPn4YCf44RuU31QzyrnIyasPMyr6cVQXOZtJc5DwcaPq5rN6ihgDPft0cEegXwXXcM9N8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2w1R1E4dkVNbU9ienQvWTM5MkU5Mk0wdEplYkVrZkJUYnhsUXN0V01xWDhx?=
 =?utf-8?B?RGh5Q0FmWXE4dTZpdG1pRTNyZmMzaUZKMDFlMFpWb3B3ZzNKQkkyOThQU2NG?=
 =?utf-8?B?eUtVd2Nkam8xZlp0YlRrc2R5a3FXdDN3K0Q4YkxuaFR0aG1EaXNSZUcva0Nz?=
 =?utf-8?B?K0Z4d3dsQVlvazhzRFc0cWtpazhMbXFUTUNwak1NenZJcC9pcENmQ1B0MWY1?=
 =?utf-8?B?c0hBZWhXelVzTkJuVzBNOEZnVGk2SWxyUjJTWjVtYThhQll4dnd0UXJ6d0Ra?=
 =?utf-8?B?a2hFYlZ0ajZ3eXM1ZUd2eDhGZ0pJM1BDQ2czek01anhjMnBISWFWSjlySHI3?=
 =?utf-8?B?bXZrbk5Lc0ZlaG9YMjJydHlCRnNQNkNEcXc5MXlKWm9oSGJqd1VabnMzYmdO?=
 =?utf-8?B?ei9QVGw2M0oxTFVqVUE0YUFUczlOMXVqbVpMZWtKSjZSRjBmaVFqdGxOYlhP?=
 =?utf-8?B?Yko3Nk5RYlpZWW0xSTdpdWtlQ3FlR24rc1B5V2EwZU42VTc3MmNaUGU1RHUx?=
 =?utf-8?B?RlNqeHZ6dlcwcE40RHYvQ2VtMDdJZU91b21BQytpZllLRFhCdkdzTXhMdVJU?=
 =?utf-8?B?ZmpPVDlMUU5PdGxRd3pnNkVZam05SGNLbzREQ25TakRNTm1xQzJBcGV0RDBn?=
 =?utf-8?B?Zm9HVlA1VHdzWENwb0U5dVp5ZXBYVklaVmNJM1pseE8rVjJmN05Kb0xheFFy?=
 =?utf-8?B?UDhBSEttb21nZ2VMVmNkVjhjd1pnNHI4eTJYMm9ySG5XSUw4b05Vb0VUZnQv?=
 =?utf-8?B?NGtaOGl0eU1IYXpOam5Fa3pvUnJwUXU5VzFBMjZYcTd5Tng0RlR2MTJqMTZq?=
 =?utf-8?B?c2oyRE5zV0RuZk9ha1FPY052SGhlSXVuVWRoR0RBdnd4WllEZ0dWWkZITG9w?=
 =?utf-8?B?SklReTR6YmJEVHY2cGhqZTcrSUdsTno4VW85SWhiYlU1ODFJT0tRdElkT3RQ?=
 =?utf-8?B?WXZscXM3SXBpV1d3R1JqcW9KaVgzUjUzcEkyNjUvZWs5NlpseDhoT1ZzU2Rw?=
 =?utf-8?B?SGZVMGlWaFQvc0g0ZTFlOGNJMGowcTVHb1J0REE5K2g1NWdFNGRuU1ZyWlVx?=
 =?utf-8?B?YjlER2VZaTNMTitHbnZQbUZuMkZRKzNTNzBnbGNRUGgwbEc2U21RaThKMisv?=
 =?utf-8?B?bW85OXNONE5HVGtpS3hKR0hzYXdVRWJtTnZ3T1NFRk9nUnVVSkVmNFpqSDUw?=
 =?utf-8?B?V2RMVTJQWjdlTDRiTlhnUnZkVmhsWCtDMHRGd3lVL3ZBYUNFRlZUcVZjdnVX?=
 =?utf-8?B?Y1dvNk1QUGlFMVRzYXRXdGo4dndhRkRiWDlyeE9hNWordndYNFRVU0FlQ3Rt?=
 =?utf-8?B?TlI3QlJ5eGV3Uk1KV1R2WjBwbXoyYk56SEFYU3ltQWFWZ05oaytCVTduekIv?=
 =?utf-8?B?dVlyTURiTERtZjV3ZDVYRDlJWnBnNGJCd1BOSEozSW45NGh0enY3ZS95VXUx?=
 =?utf-8?B?RmVsNVdGV3RUVUZ1emxYVFA4cXJpQWw2QSt0bEFrSy9VZmJ3UmRteCsvaitq?=
 =?utf-8?B?ZStmdGJsTkZGODlHTkRjVTNOTDVMZlhwQ0FVcXd4Q3B0NVF1MXVSZmNMT25a?=
 =?utf-8?B?MUU0ODVocHRLM05pMHRuSzRvaEVSb2tEbktLbVdGSFAwVERUQzJuei9FaUFt?=
 =?utf-8?B?Y2pwYnNteGVOdUg2RG9XeTFzU211TlpJRlhVVWo1Y3k4QUdBWkJWVjBaOHVs?=
 =?utf-8?B?blp5L0lrdkYvSUg4SUlXQ2krdEt2cFZvcUIxY1lPNzBuTzQ5YzhFdHFObHRY?=
 =?utf-8?B?eUpFbzNTelpxSk9IMTRDZjlibFdBTTBKWEZBYVc4dWNsVm83cmNXbmlZU21Y?=
 =?utf-8?B?OWdPa0Zxek42c2dJY0tlV2JVS0M1YVg3d2l3OXhyaHQzbHVVRjJPNU5iaDlE?=
 =?utf-8?B?VjJ6M3JwS25oMVRxK0J1eEdUNVEydVlGOU1VSmtWR3N1Wi94emZLM3UwZ1Fy?=
 =?utf-8?B?dDJ5d0NtcVFpeXJiY3FDOWdlS0xQcjEyb0wveUxKbkZDRGp2V0lJR1RvaS85?=
 =?utf-8?B?aGtUUWhMRmVPaVlFWjdRanUyL3NnaWFYOVd4WkZpWVZvcThsRm1tYS9VSjNl?=
 =?utf-8?B?cWtkY0xsTVVGeitCMHM2U3VjTmJhaExtaHd0b1dqR3J5Z3JOL1Y0ck9QRmFK?=
 =?utf-8?B?TllVM2xSSE9ydVY0OHFtaU5ia3MzU0lsNE45Tko3dVk3enowL1UraXp0TWY1?=
 =?utf-8?B?UUlrNkxiYTJLelhXdGszcS83a1ZaQ0p6TFlSZmNNUlpVRjUwekdtdEtEUXZB?=
 =?utf-8?B?YzFwZGIxUEZXWjFSUzhKSFV0bUJ1djhnalpyYTN2ZGQzbEsxNHl3R2d4YktW?=
 =?utf-8?B?WVcxd0loRmwvV2wvQzFyTXcwMzRCTWpCSUZnYjk0NzRyWGN3bmlSUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a85daa8b-4bb4-4704-8842-08dea6ae366a
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 11:47:10.3243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9SYjdtrGkYmI/g3Mjl2wSi9OLPOyT5L2LHYVipmY4JVgWKO917mur22xeEubedULNzRVfy+cs5niW2+3PBO8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5503
X-purgate-ID: tlsNG-4011c0/1777549634-815848B7-617DA7E8/0/0
X-purgate-type: clean
X-purgate-size: 1071
X-Rspamd-Queue-Id: 4E3BC4A254A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

Uninitialized cpu_data[] entries have the apicid field set to BAD_APICID,
not boot_cpu_data.apicid.  Fix the check in cpu_smpboot_free() to use the
correct condition.

Fixes: 7126b7f806d5 ("x86/CPU: re-work populating of cpu_data[]")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/smpboot.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 491cbbba33ae..ff05955bae40 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -961,8 +961,7 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
      * In that case the socket number cannot be relied upon, but the respective
      * socket_cpumask[] slot also wouldn't have been set.
      */
-    if ( c[cpu].apicid != boot_cpu_data.apicid &&
-         cpumask_empty(socket_cpumask[socket]) )
+    if ( c[cpu].apicid != BAD_APICID && cpumask_empty(socket_cpumask[socket]) )
     {
         xfree(socket_cpumask[socket]);
         socket_cpumask[socket] = NULL;
-- 
2.53.0


