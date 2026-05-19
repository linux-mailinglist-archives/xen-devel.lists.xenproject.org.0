Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFqRD8eaDGqUjwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 19:15:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74053582E67
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 19:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313285.1583498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPO2V-0003tw-Iw; Tue, 19 May 2026 17:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313285.1583498; Tue, 19 May 2026 17:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPO2V-0003sV-FW; Tue, 19 May 2026 17:15:31 +0000
Received: by outflank-mailman (input) for mailman id 1313285;
 Tue, 19 May 2026 17:15:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wPO2T-0003sP-DP
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 17:15:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPO2S-007bSM-B8
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 19:15:28 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c9a97-e002-0a2a0a5209dd-0a2a450cbf8e-30
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 19:15:28 +0200
Received: from [40.93.196.44]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c9aae-62f1-0a2a450c0019-285dc42c9fe1-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 19:15:27 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7998.namprd03.prod.outlook.com (2603:10b6:806:42e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 17:15:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 17:15:24 +0000
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
 b=GQVMwMqTctepAkHA0Fk83kRfFAsacoYzV58cIJWtwvOB6AHWbE8J0Yv4aNc9oGbDN2v5E/Pw9ZUXgkR0Ga4PZfYUQ48F4gKTofvf9wMYYjq0PXokYgIv1OkX/WytzFtOmCc0MMlHZ7vjR795DHSvO0Ej/OK+A0BKVDk4LQPLCMKkiFbwNX7M/xr6Mf2+HlFw8Sz5mJdTkNQfEZCLKJwznrPH5mF/sGPcjRGIODIO1Zo7HLlXgoYZyLwtqVxk5iUbBGai/HBMR1FPkA/gmadXeGAUlIXV0Ky+W46Kgr5MsXz2imMeXFlNvE7HVn4XG1PuAMNfPw4WhJkDz8WZxXMk7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaKilY3q6vWh3mxKUZf39XWzw1pXnR6ACYxasrZqYS4=;
 b=V+278Fe6mAqffU8qcBByfZO4Gnn1JPvbvYK4MhKJ9OxCTsPC64kLqwCAYcOcWhKiNZ2zOg/1Fkrnk6jNqKFbScyUVncqPC6okGHHjkhNMZakyjlK+EH6XLkw4VYM8pxVQZx1KFRE1A4X7QmbpdQUkCG4Y4HIE2cGCi9ihMzFJHbu40BzZ7wNzzNi6QczSdOUrpqS09dE4Owc4qmHaQHV32aRvFXE+Sa8RymA7r1CbQ4/TmkoKHIMa1/w5oQSJkP1u2RFVJGb2h1DGjIyweh8eFeN1w+OH3remzRg+ZCyPnI+RaxQE24eocZdEbX5O6gxiofGhYZhTCxGhbt6/4Vz9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaKilY3q6vWh3mxKUZf39XWzw1pXnR6ACYxasrZqYS4=;
 b=yvOhx3FthFLodtafwjcmBL0ivahfe0Gt0EhRn+VCbJtKdTyrUl9VN8ALFkZUvaCE3iXHFg7mSir6l0nFrYzbaUw4Q9SaYleVEIpnlnTG4AW5Mg3C/5y+NBQ+RbxysIL+zv1ULtRDL9KfBNsCBKnPcg12q7FZf34t4ZxjBKb2qNs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a32b18e8-bdb0-4c11-97a6-ea67541140bd@citrix.com>
Date: Tue, 19 May 2026 18:15:18 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 5/5] RFC: pci: Migrate pci_mmcfg_{read,write} to pci.c
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779117765.8631fc262581453bbf619ec5b2062170.19e3baeb295000f373@vates.tech>
 <7ac53569-acca-44f7-a129-99b5dcb97500@citrix.com>
 <6430026d-dfa9-4006-86cd-e228625a1914@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6430026d-dfa9-4006-86cd-e228625a1914@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P193CA0014.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a8983d-4a39-4d7c-bd10-08deb5ca36d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|56012099003|18002099003|3023799006|5023799003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	vpsr1kyHa3QRh03acO7KHJJQdNaOoxrMGUIjel7xHmlFwp/J4c9ISficrq/9tRB7vgkLJf5jOhQtO1wOfQIbhm9ohSgXBoSjds9LgpPCGNAkusuhy3cmz/qtHD0ukCVdnlkh55BnQLDwn68Wawg/AL60+P7WsrI4IupPvAALuaLrVKuHVaufiYhHzEcr/0HVOxhpX3Phhnj0D58reYnwhtjdTfB9iiBZfjUeFaKakRCCBRteaOEyHwWu8kH9WYuWZwkhEl+PkkL3FreJ3ut/TJeL1jH5co2L2eSylXqzYD4JiZT/DK70+hKFjC3n/bzHpV1gGkoRznaDYNtGkCBn6rS4rWatEW2eYrbETP5JtW2z9PhbrCcbpYZlCWlffTjCrMSoDaFxrir9JexuGPy1nNzsbLVlDGtw9C8HDNDhdtUVrNV0POF7MFlTblCSfj9xr7QF1UH4/Jyyr99q2Zk/YKDGaZDH4KEEqumM2vDtuGebrSzzCwQB3iBZfvhCbZEqD6eB9Taw2y33rJyF5gjck5Kp5KN9Ffw01BOlsLsysOWOeSqUPjWLJ3TyVb8vgLYSinXw1TKIfYncgbfuW+O4fi59uFyAVrD6oxyCU/LBSqF2DXHp23Dk4ax1y0sUXzEQenOs8Bqwudpuy8StO4AbRl89x4MkJ03rmk7mbDr56CHGDUlKbDEGhhHRrfEWFz8V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(56012099003)(18002099003)(3023799006)(5023799003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1JPNUZPdVJMZnpoQ2lMYUFNMFI3anp4blRJTmh1TE5ycWxyOWNIRm1qVnBj?=
 =?utf-8?B?eUg0YisxbnY3eTJSbnR4d0pETEJ3cko0YzJrOUhjRWhmS3pETjl3ajU5aFJT?=
 =?utf-8?B?OFVkMC9GYlBRaXJFNk5PaXFsT3lwQWp3ZnZZb1RRSFJ4UGxFMCs0ZWN5dmc4?=
 =?utf-8?B?YkFDRHEyQWwwTkw0QTZyeS9hN1dmZ3RwTWozNU92dk5NR0ZYZHlVNFBQZlFw?=
 =?utf-8?B?YWYyTy9paHluSlpXOFl4SCtDakJYNVk5bEFvK2RlK2ZPdTB3T3N5Qi8rTWpm?=
 =?utf-8?B?OTdieGRYb0VwYkVBbi9YU2h4UitqWEJpU1ZGejl4WUJQNkFQWGJCVkFPTG0r?=
 =?utf-8?B?a1NvWWI1RXZjbUplbzliYmZKR09vYVdvNEllRFpWUUVxalRDT2t2YlRWaDhk?=
 =?utf-8?B?ZWxlMXdkYys3ZWxGSjlGLzNtQmMvTktGR0xLMSs5WXNnZGE2bldWZ3ZkdXla?=
 =?utf-8?B?RkNLd3hpdHU3ZVFZZDhIRmpacmloNnZtcDA0UVZkMGZJL2hCTmlKeExmK1M3?=
 =?utf-8?B?Y3ZYUzBTUmtpODNuRlBvLzduV0lWeHVHTTRzMGUxOUJTcU1iS3pWMVdrVFBh?=
 =?utf-8?B?cFFpNDZ1L1pHeC9rMlFrdmZWLzFEVDFCNmV6Q0FFaEtNMWhqM09ObGpqcEdO?=
 =?utf-8?B?eUxvWGJmY0tBWS83TEpvKzRQN0c1YXZQbW40RmFKWDJUSkZjUVJLdUkxL0hH?=
 =?utf-8?B?cmhzQzdnYlArMk83YlpPUjlPRWRzT3hlQUtpb2swSTBpSk9pelBic2lNSmU4?=
 =?utf-8?B?YWhnSWNSNmg3bGlGME4wOTdaZTc2TG1BY2ZHSVROTXhRVVFIcm9nWmZHelVC?=
 =?utf-8?B?S1c1b0lybjVxY3pKR3IyMUVRUSt4TTBGRFJMK2QyVVpnd0YwQUpDbm9Rcm80?=
 =?utf-8?B?N0NhUXNKelp0UkNPT242OUNnK2RQZWdrUEVCRzZkVWFKZ0h6UUgxQUEwdG9Q?=
 =?utf-8?B?akVPVXU4d2FzZEFMOEhGaFAvWHM3YWRWM1F2WGM4dXJXRHlMcjhjZUZLUTNR?=
 =?utf-8?B?eXNSdWVtejlxdS9HSkJVZkJ1bDBJLzU2bndtcjQyN1hSRFVUbGN0UVhXalla?=
 =?utf-8?B?V0JQUHN6UTBtZUFWYmExRU0xV1hVVTNZeGl5bnIydHdxbmxEcWVKeUNwNGp1?=
 =?utf-8?B?VUVubXlvMmpiUWpIdUVWTGpjSVV0TDU0UlFOTnZma1djVUpYR0grejRDOG9i?=
 =?utf-8?B?a0hWT0lEQjFOeGRHWUNVa3N6L3Q3ZTdHNkRYVlVtU0FTaHZtM25qUS9tVnA2?=
 =?utf-8?B?c2FpZmxQNDJ4cUtyWDc4QlVPSUVvc2tjYW52aHFvVmFiYytWdnRWczF1K1p2?=
 =?utf-8?B?cjJMODRtMEZPV1lzSy9BUFN1cFB1TmNyM1NHSEJmSTU2VDZyejNFQ0dSb2dW?=
 =?utf-8?B?MEVVTFljS0ZMRlFtWnNkejNHSGFUMWx1aUtrTkxaa1ZJc1p0Z3ZTNVBvU2Fu?=
 =?utf-8?B?RDRDcVpNaDBuMGlqWC9FdnIweFNHZm16Y2VIU09uK2dxeG5nM2pqZUdwRkxo?=
 =?utf-8?B?eCtLbk42Q2g3TWM5YXVsbFBZc1ZlM3h1a1ZhMkhOL2RaZHRkY0doNkUwKzRr?=
 =?utf-8?B?UmNNSFpXMzJFWG5QZmhxTGVzWVdxUDJja0hYREdUaklnZEVteVZCSzEydkN3?=
 =?utf-8?B?OTBBSFYvdklwY0IvZDNnNXpEWENMajJJQ0hKTUtwc2J1NmFodXJ6WTVmQWM2?=
 =?utf-8?B?TTA3SDAxNUtkd3hFNU8xRzd2b2w5dk5vQldtSWY3bUJGSG5CeVJWYnhNK1BH?=
 =?utf-8?B?U0ZBelhTMFF1Wi9XRnZlbloreFMwRDFlUHo4M3VuZkM4ZC85NHZxWCtMNlVa?=
 =?utf-8?B?c3BJTm5EOVNNUUJOWkFrRFRWbVlhU3NLRVd2cWx0NGpvcVZkcTh3NkNJMTRt?=
 =?utf-8?B?T2wxREh6RDRCSVVNYTJCaUgwend5alE2S1dlRGM4Uks0cEhRWG0xdFhpS3Ja?=
 =?utf-8?B?eTNCa0llVmNSYmpJMmQrOWg1bmxRL2dHYlFwSnh6Q2N5bzc5NkFGcjRpN2RK?=
 =?utf-8?B?Z0tDVHdXMkx2bkd1WlF6L0RXWHV2MXoxY25CWm1UZnRjNHZJcVczUE1sQkJX?=
 =?utf-8?B?OHMvY2MxUXcrMHRGUVhwZFRsS09JV3FSNjZxMFk4bklTRDBOV3RoSWhqU0Fu?=
 =?utf-8?B?cWpkTSs2SHorUFhuRjJUMjVteWlTdkwvSHFmMFloT3hBeUNjSXk1MXBOMklZ?=
 =?utf-8?B?WXRrTVBZNks0Ukx4VkJpMG1BaEpNMjRSTFhHRmhzbUJRZy9vdW91cUNVQmsw?=
 =?utf-8?B?NFNGUXpXazBvcTZtbFVVWGx5aW1KaUs0Vm9TWlFYVkJYZ3l2RU1NcFdVcjFM?=
 =?utf-8?B?blRDK1VNQ1VXY20raS84SlNXYVgxOG4zaE1YeHBiR3JUa3pYUitzdHVCaHNz?=
 =?utf-8?Q?fw5Xs9fBWCuvun/w=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a8983d-4a39-4d7c-bd10-08deb5ca36d3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 17:15:24.2233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekrycfovhJlfxwV4I12wbtpmnv6x2Uj6T2Rdi9eX9mDo5WM4TycPTZAQwuXeLsmFe+eRZ0ZUT/JgUS1kqzo82OAJw05LrsbeHdtQKFtliaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7998
X-purgate-ID: tlsNG-d25034/1779210928-D9F6ACF5-BB9CEF8C/0/0
X-purgate-type: clean
X-purgate-size: 5046
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 74053582E67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 7:02 am, Jan Beulich wrote:
> On 18.05.2026 19:35, Andrew Cooper wrote:
>> On 18/05/2026 4:21 pm, Teddy Astie wrote:
>>> --- a/xen/arch/x86/x86_64/mmconfig_64.c
>>> +++ b/xen/arch/x86/x86_64/mmconfig_64.c
>>> @@ -133,6 +46,25 @@ static void __iomem *mcfg_ioremap(const struct acpi_mcfg_allocation *cfg,
>>>      return (void __iomem *) virt;
>>>  }
>>>  
>>> +char __iomem *pci_mmcfg_base(unsigned int seg, unsigned int *bus)
>>> +{
>>> +    struct acpi_mcfg_allocation *cfg;
>>> +    int cfg_num;
>>> +
>>> +    for (cfg_num = 0; cfg_num < pci_mmcfg_config_num; cfg_num++) {
>>> +        cfg = pci_mmcfg_virt[cfg_num].cfg;
>>> +        if (cfg->pci_segment == seg &&
>>> +            (cfg->start_bus_number <= *bus) &&
>>> +            (cfg->end_bus_number >= *bus)) {
>>> +            *bus -= cfg->start_bus_number;
>>> +            return pci_mmcfg_virt[cfg_num].virt;
>>> +        }
>>> +    }
>>> +
>>> +    /* Fall back to type 0 */
>>> +    return NULL;
>>> +}
>> This is a horrid function.  Accessing and modifying bus like that causes
>> poor code generation, and by now having this in a separate translation
>> unit, the optimiser can't fold it into it's single caller and undo the
>> poor decisions which went into writing this function.
>>
>> Instead, you want:
>>
>> void __iomem *pci_mmcfg_base(pci_sbdf_t sbdf)
>> {
>>     ...
>> }
>>
>> base which takes care of the bus adjustment internally.
> If the updated bus number need passing back to the caller, what do you
> mean by this? With two values to pass back, and without resorting to
> returning a larger struct by value, one pointer parameter is going to
> be needed, isn't it?

With an API like this, the bus number does not need passing back.  The
caller just accesses pci_mmcfg_base(sbdf) + reg (after the NULL check of
course).

Also, I'm pretty sure that it will be cleaner to merge the two functions
than to leave them split.

>
>>> diff --git a/xen/arch/x86/x86_64/pci.c b/xen/arch/x86/x86_64/pci.c
>>> index 8d33429103..c37e3edade 100644
>>> --- a/xen/arch/x86/x86_64/pci.c
>>> +++ b/xen/arch/x86/x86_64/pci.c
>>> @@ -11,13 +11,123 @@
>>>  #define PCI_CONF_ADDRESS(sbdf, reg) \
>>>      (0x80000000U | ((sbdf).bdf << 8) | ((reg) & ~3))
>>>  
>>> +/*
>>> + * AMD Fam10h CPUs are buggy, and cannot access MMIO config space
>>> + * on their northbrige except through the * %eax register. As such, you MUST
>>> + * NOT use normal IOMEM accesses, you need to only use the magic mmio-config
>>> + * accessor functions.
>>> + * In fact just use pci_config_*, nothing else please.
>> I know you're just copying an existing comment, but it's mostly an
>> opinion and not terribly helpful in place.
>>
>> "AMD Fam10h CPUs can only make MMCFG accesses via MOV %eax/%ax/%al",
>> would be better, except...
>>
>> ... this claim cannot be true.  It's been made since the K8 RevF BKWG
>> and exists even into the latest PPRs, but that's simply not how
>> load/store ops work in the pipeline.
> How do you know what special casing there exists (or has existed), or
> what (e.g.) bogus(?) SMM intercepts there may be? I'm pretty sure the
> Linux change was in response to things indeed not working otherwise.

I did see you elsewhere on the PR which merged this, but not on this
patch specifically.

I have it on good authority that AMD CPUs can't trap MMIO into SMM. 
(I'm not aware of Intel CPUs being able to trap MMIO like this either,
whereas both Intel and AMD explicitly can trap IO ports into SMM.)

Hence the aformentioned enquiries.
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    addr = pci_dev_base(sbdf.seg, sbdf.bus, sbdf.devfn);
>>> +    if (!addr)
>>> +        goto err;
>>> +
>>> +    switch (len) {
>>> +    case 1:
>>> +        *value = mmio_config_readb(addr + reg);
>>> +        break;
>>> +    case 2:
>>> +        *value = mmio_config_readw(addr + reg);
>>> +        break;
>>> +    case 4:
>>> +        *value = mmio_config_readl(addr + reg);
>>> +        break;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>> Again, for this patch or a later cleanup, drop the output-by-pointer and
>> return value directly.  The optimiser is hopefully doing this already
>> but it also makes the function simpler.
>>
>> At best, we want ASSERT_UNREACHBLE()'s in the error paths (including no
>> mapping), and to consistently return -1.  Returning 0 for a bad length
>> is bogus.
> This looks to contradict the earlier paragraph: Do you want to return the
> value, or do you want to return a success indicator?

Despite returning -EINVAL, the single callers don't look at the return
value, and only take the *value value, which is generally -1.

For a bad length, 0 is returned (indistinguishable from success if
anyone were to care) and *value is left uninitialised.

So yes, -1 on the failsafe real error path is fine; after all it can
occur for many other non-error reasons too in PCI Config Space accesses.

~Andrew

