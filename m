Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAjJHNUlAmpooQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 20:54:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB579514B77
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 20:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306377.1578377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMVlR-0006vj-TL; Mon, 11 May 2026 18:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306377.1578377; Mon, 11 May 2026 18:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMVlR-0006t5-Q9; Mon, 11 May 2026 18:54:01 +0000
Received: by outflank-mailman (input) for mailman id 1306377;
 Mon, 11 May 2026 18:54:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wMVlP-0006sp-Rg
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 18:53:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMVlP-00FxWw-8M
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 20:53:59 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a0225b1-bab6-0a2a0a5309dd-0a2a4508c2fc-12
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 20:53:59 +0200
Received: from [52.101.48.50]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a0225c5-63b5-0a2a45080019-346530328061-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 20:53:58 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB7144.namprd03.prod.outlook.com (2603:10b6:510:290::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 18:53:53 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 18:53:53 +0000
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
 b=N4kHKWTeb80IbQQOoRitCawGJdbPiKsP1dOtJYwviGSH964ZImCtwj6mP5VEJHm8Cz2p+NCBiDufDWZGMAKCpl5VZRAPLc6mTASaxPplNZhN8KS/tUqghOi3uDtOptwfVh31w1SyQtbVINfHSJoiefNAdtJmFq2a/1rWRyRBrBDUvLXwtiENWL3loILsA4MfVGxNKupPBp4HRpCTWbQA48hCbgNxP1gd784N9wTA2yXMkSmGCUHU+QQ9jG/OieHlhoXbgQ81ZU69Ii39iR+NtX61wLCHKGMwjjTGj9CqUc0Njps9D/FsWoPOdjAy6Y4nH8G6cV41cG06d29eNeMdIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKfIc1mackmL21mordHHTfHxFKxbb1d1cK7hyp1j8WM=;
 b=oPmGPlykUVK5f8CUa1iCvzplYDLC4r3mTiP0RD8/zLfsHTUlSuaLh5hFImuUpx4HFrJ+atzMPR3GA1Ok7H+JUKbeeBJC8Oo52t3UXR43TQU09xlkQc+tnVl5Fxa1kxAOjYSlE0N1Jz4TP1UsWKmLJmYgxB9/l7h7Tyr7kZ5J5mGVslOkzX6q1+eP4xcQQ+fMqs94SLMDSBcttx9gAfeHB5iuMdMruCTr2Y9GpViEVf0Cl2ovn9l4LvlM9J8cUUSNj33Wt9OBOfUnWX4Jjudf/5TK94pxIOQ+l8EYBePP5LGsXiKFVTVaWcpxC4B2QHDGY+xKeWp9Uzbz7aF7HiFMxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKfIc1mackmL21mordHHTfHxFKxbb1d1cK7hyp1j8WM=;
 b=0KBVk6UYWlZdI6jRgmZcFdRPGBtx69gnETUzTmp8EMsOVEKyiZsQ4XcRFz8jKUNmk4Nsy4DtYhxnikT+vqf2Lu5eEGxMqu4vjshAydMFn593mHGjegqPpQi0QLT8TEHh/lezbaHZFQMt+7LJguRnsNpmPFWRkMuTbrHsu1nvNUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 11 May 2026 20:53:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Community Manager <community.manager@xenproject.org>,
	"committers@xenproject.org" <committers@xenproject.org>
Subject: Re: Code freeze for 4.22 started on May 11, 2026
Message-ID: <agIlvjBPH4ppBuKY@macbook.local>
References: <e21070ac-3a84-4ad7-a4d1-9178d89c1435@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e21070ac-3a84-4ad7-a4d1-9178d89c1435@gmail.com>
X-ClientProxiedBy: BN9PR03CA0348.namprd03.prod.outlook.com
 (2603:10b6:408:f6::23) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: cb771618-d9b1-49e9-e443-08deaf8ea5c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	6o3pM43Yj0qS1QDWvTer+Ax6LNYzomtIsgwTHiKIqSei8z0G8xTCMqr1B/icqGKg6TVtXIgMEGuINvC06kWymZn9an1rTmtM1yhmg8vKjxu4LpDO+EuzkiTBJws8AFuvZ8Ah/i4eZGzDSZiFLwWPuS+QeHwI8VdSeCz9S3hBhY0JeJSu9kQ7Vwvy7VrqwKKSylg9bfCJ/nmRnyukiD+2YHBIgfmclkcmrAhGOrDzA5lpcPNNFhWuvx/+FNeFUlqiT1nOgEwJU/3TOITmwAkUI/5iybIkTObQ+7d/d5HpSaIwTOSsn6GL3VkiMyAmSvQIe96oBQwD/JU4tUhNR3CCELYiGXKcSqIoiJdZs2BTNnNopjw60chbd76nf81arBpC8OcARaghxl951dWjazRoL8M93eKpC9ChctcBPpbX0sE/yhxRTDzUsy/L2fRWKScTye0GAodRGKbz15aJkCa0GZVjvMQZBK7KZDV+lirbO57YEp0PiiJ0betb47SSUuMF2rzd25CpsUPeAeN37NfD2zhs771UXburkAWOX5lIxgA2s2hQQAkp7/lBkFT+UP6xflY06YZPYadkuXfgbykKJXQoD9qc+UhPqxyYW+lZ2NAXTCQR8Qj/l0Z7iAD6Xr+R5xBEfBgajNUkkxPod6P7AXiNFfXgkvNRL0A6rSpeWFstC7q357EflZwujV34KdY5/7XSXChVSSGyDcK4xGUMiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU9hZUFhNGNWYmhoelRxOU5UUHR1ekg1TXdxM0V0ZllkNkhMTjVYelNMazRi?=
 =?utf-8?B?eUxJTi92K2VGOFNFdFlwTndJUHFvYytuQ1p0WHUyS0NIMTJWTGdudkYxYTRZ?=
 =?utf-8?B?MDZqZHloaXRYUEdOczdTNTNmZ29EZlV5RytkQ0w4by9YL2IyR3hhb3NUc3Ew?=
 =?utf-8?B?N2p5bW1tTTJMbDRvRE9XWmhJYVh1bjNURXR4Z3R4Z3UwUDVzNkJwdjNWQXJD?=
 =?utf-8?B?TENuRWgwVUhTMjBua2thWENCaUZLdEMyZVY1WSt1c1k5ckhCWmNtOUFEMndS?=
 =?utf-8?B?YitwWXF6RElxTk9JUURnMmN1U3NsMFBqclRWb3Z1RGl3Z0x0Um9mWlZycSsr?=
 =?utf-8?B?SWxjclBwWDIzc0JWc2FxOUFhbUVRaVB5VzhwVzMrSHZRdWNmMXR5cU1lRGJp?=
 =?utf-8?B?dWo0UTZsUVlGZ1pJRmZ4Mk9lcEhLNFF1aWZZWlZEdHYrZ3A2TCtLanpiTkJk?=
 =?utf-8?B?b3ROVnEwTEVnVXpHaHFvcGJtbFJSaDlRRlZQR25aWGZ6eUZrS2xJYmtlbGlp?=
 =?utf-8?B?bEJLWFVuUEpuYjY5UU9XQ3E1bUpDZS9nZE9RUmd5Y2puVE9jV3JGVEZEajVY?=
 =?utf-8?B?UVVPc0M3aExDYVBpR0RFdnpBMGpsWnFQUFdmTVBNR2pJeWpzOVR1NnJwYVVo?=
 =?utf-8?B?MnFXTjQ4dGJjWDVZSExRZmxjMGVKS0VNYUN6UndyVnd3UmZGWlk5Q1JzN3pF?=
 =?utf-8?B?dUJMZTdTQ0x1Wnh2eTBlWXYzS1cwMEJ6dWh6OEFUdlBBd0dJQUVldWNuNFRH?=
 =?utf-8?B?ZjlPQ2J0Mk1IampUWk13ejZaQU9CNlg2UVRFbkFqWkRkak91SFo0ck5vWklN?=
 =?utf-8?B?bFg5Q2s2bTRKb3lWRzlHMmdGWkxta2hBRWhpNWdMM0NWZHRCRC9wWm1sQml3?=
 =?utf-8?B?aGhPMm55THJZc24rL3lQSEcxeHduU0xRZVBwSlRwTGtTY2ZwbFliMklMdHp2?=
 =?utf-8?B?empWS1pWMk8vRnNrakpxNXRXSVMvUTRSSWpPSHNORk5RVlQvbzRmMGZqQmFD?=
 =?utf-8?B?Y1VyNnJwWTQ0dUhJKy9VNmppMmJFOFlDMlJRdGJNL0F0UGRmZFR4QWJmRm5n?=
 =?utf-8?B?bHc0alBreGZiaStJVXk4RnFWZU9RVVRlWTBOUGNTblZBMmdUdkhINHZoTjhJ?=
 =?utf-8?B?aFUxaS81Sk1sTUpnWjFzRFcxWU9nUmpLODdvY2FlSEtvZ05TVUNlN21JYjVl?=
 =?utf-8?B?M1RSRmxCdi9pUXA5MUVqc2RnZkhFZXBiUURKaGRBUlhvYTFXdGEyYklqYnlN?=
 =?utf-8?B?bURCZ3J6SUJHcjVMNVZ4VE9nV0tyamhhSEJCT2Vtdk1oUjJodGd0ZXdINjJn?=
 =?utf-8?B?bXhCd0M4WG00c1lvWE5wVmJkM1pCZlVGOVFsanl4TWdHWXFvVTJWQjd5dEN6?=
 =?utf-8?B?UEdKVmIwbndKQ1dMblN3b1ZZbU1ESDJpM1YxNC9aZW1DSUwxU0xrWHpZNldR?=
 =?utf-8?B?OGlJZGNZT0Y3R3lTRk9jbms4bTVyRE9xRGZwWDg2U0kydTN3bC8vV0ppTWlC?=
 =?utf-8?B?RUFFeG9UUXRiVWp2Z20xZUdRU0NMakF4MWhTSCs0MlMreU0rdFkvVGdCeGF3?=
 =?utf-8?B?Mzg3RVROZHJCUG96QldPTHZzaGlBUnVCTkcwQ0RuTDVYcjloZGxRcnAwQ2Mw?=
 =?utf-8?B?MEo4SGU1QUNncytIRWVPc2RQeUdDSlcxNHM0NmRpQmFkVXEvYXp4U2dOV09Q?=
 =?utf-8?B?VGg5YlhTazVjcVR2R2VQNXZ4cEYyMEZsUmdJcGZWaFdFbFdxTGJ0UVZ1T3RN?=
 =?utf-8?B?ajV0dXAydkN3UzFwYVA5THJZMXhBK0JEbEdrNU9XVEdRZDgzek01MG0zTCtz?=
 =?utf-8?B?RlBlNVU0MHBZV3F4L3N1R0JUL2ZwckdYdDNMbUVQWnJMdUF1R0FJNnZmd1lw?=
 =?utf-8?B?L1pKaFI5TTcvbHA2bUNuQktJTkV2OTh2cjFLcUlVZ3lzSk5iRkx4cGFZdEhJ?=
 =?utf-8?B?SzBSWitSSVhrUHdaVXZoeDJ5QVRnc2QwOTduWU1YVTVMSlg4VG9EbU9HUkp3?=
 =?utf-8?B?cXZoTDlQMmh1Y3dxZW5wMWNIV3p6dU91SnV6MzBXdE83SW9neWZTT3NnZUxT?=
 =?utf-8?B?TGFYd1ZTazhWWVA2eU5pWlI4cFN5R0dyZjZMZHhoeHpTSEgwNHJmMURmRkVT?=
 =?utf-8?B?R0tFeUV1a1NmNmNIeWJjME51aUJoNW82UHUxdTVZaWlBSTIzUE1iSkIvWHRN?=
 =?utf-8?B?cmpWTjFTSFFsRlk1MXRHMlF0cnlINVozV2dkTXJqbERXWXdWbmU0cEFBSGRN?=
 =?utf-8?B?ZkdBU0xYNER2UEtEVjRiVk1tQ3VuKzd1TzBZdGlLZHNYanVrK1QvSGtTTk9N?=
 =?utf-8?B?TGQ3UlVGUlBLOWJGTDdvTDhtRWRaNVV2S0V3eUVjQ0ZhWWwrMzdKdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb771618-d9b1-49e9-e443-08deaf8ea5c7
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 18:53:53.6873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+4rLbR3yhhn/P2c/Oi2VVM9hwkPJzgc3UWnoEeLLiTUinjKIXqPFAIniuH1lT6h2fUVg7LdEPGYl0ikrfVcFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7144
X-purgate-ID: tlsNG-c1860d/1778525639-BFD7BDB1-BBF055E2/0/0
X-purgate-type: clean
X-purgate-size: 640
X-Rspamd-Queue-Id: DB579514B77
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:community.manager@xenproject.org,m:committers@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:35:55AM +0200, Oleksii Kurochko wrote:
> Hello everyone,
> 
> I would like to inform you that Code freeze period is started and will be
> until Fri Jun 05, 2026 (+4 weeks from Feature freeze).
> 
> Bugfixes may continue to be accepted by maintainers without R-Ack.

Hello,

I would like to inquire about whether changing an option default value
could still be accepted:

https://lore.kernel.org/xen-devel/20260511185145.23750-1-roger.pau@citrix.com/

This is not new code, just changing a default.  I believe this makes
dom0 PVH more usable out of the box (see commit message).

Thanks, Roger.

