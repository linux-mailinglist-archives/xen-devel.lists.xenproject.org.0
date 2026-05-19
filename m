Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF5ML45ODGpIeQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:50:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1805957E07E
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:50:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312862.1583031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIxy-0002oM-TB; Tue, 19 May 2026 11:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312862.1583031; Tue, 19 May 2026 11:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIxy-0002lW-Py; Tue, 19 May 2026 11:50:30 +0000
Received: by outflank-mailman (input) for mailman id 1312862;
 Tue, 19 May 2026 11:50:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wPIxw-0002lB-HK
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:50:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPIxv-006cBs-S7
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:50:27 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c4e7f-bab6-0a2a0a5309dd-0a2a4504e09c-36
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:50:27 +0200
Received: from [40.107.208.47]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c4e81-1dec-0a2a45040019-286bd02f295a-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:50:27 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA1PR03MB8215.namprd03.prod.outlook.com (2603:10b6:208:5ab::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 11:50:23 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 11:50:23 +0000
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
 b=XaANfIqrHdZE7XuzQ2j2BErGcz7WRVsAcEcF0sm3IZ9yyZaG1bWPilQL4Ugrqh/j7NiJUAhrrCWu1fYXijXZzvmh6xcYHz4Y7U2TwxwoMxx2nByZ98r21r0pRXKH71rkhOmplP+YMvS0xz7IXSc8Hl7g9Fph7L1kPs1Ruu82XyHNyk0IAAOmwVDk2hCunoseqlqC28G4DrA3g4pSBgKjfGxNDoBaoS1qp6kkUFKayQmk32zBL3FGnzUdi2PJT60yonI55YohQSO0t9PFI9VkOOKsF85jwwKYHq3SEyxc6xK7Ywp6b4TVgVxItkQHMLd8zPStV3vMmdK7CtYgbeFjPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVfj2cmqrInkkkHaSE1/LrrwP0n3azVW2OaahmIbFpM=;
 b=VcXhX9F0gEyce4PdD66OGOOyPXOVldNoAHJWyHh96Klz1bPyA8TZLzLUHO1WXPA6q9c68Bhd8eDr1DcjoxSMJ/AXQ5x/cXH+o09EHDOveAG97/jzvmw3hVJkusBwMbyQLiEjpNO/XvG596ifvjzgpRbSfrTVoqvdZTZvkMVOP+yOigtPCEGbFjdPBOYy3bnQiteo7uyqW4x1yqkSKgndmgjwBvaT8/op33UJl67HX1aTf5EGghPaSxYRbueS3I2porc+kwpDyGbZOCmFCsNK8inB1bk+ATKDuKU9SpjxZOjoAeKiaGb0so6Sd9CeqOzxsPqHNkBJmNwug3HcTChkFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVfj2cmqrInkkkHaSE1/LrrwP0n3azVW2OaahmIbFpM=;
 b=cqsWS9tv49cGliuMmMh7CkmXtBcvIB+aCo7zNLc4HFYS1l0gzgbmXpheSOu6FPHS0ROrQSce4798vGEsZqphjxt1mFmF5x1X54c1EtVK+WnY1ChW9E2nRkibpvD7l704L2VIiosyDo7AK36VZauHKuq0RAuW/WrPlf6fYuR4HTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4a264ce1-cd01-4519-bfe9-840083bbd623@citrix.com>
Date: Tue, 19 May 2026 12:50:19 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 1/3] xen/riscv: fix switch_stack_and_jump()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <1ac102874c8f7190ea09787a035692b03e4b46cf.1779179301.git.oleksii.kurochko@gmail.com>
 <5f8850b7-11db-4d78-8353-6e0580bd397b@suse.com>
 <5c348320-099e-4511-842b-4d352d641c10@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5c348320-099e-4511-842b-4d352d641c10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0248.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:371::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA1PR03MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: 9503dc6d-f43d-4d82-d3f8-08deb59ccf93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|22082099003|56012099003|11063799006|18002099003|4143699003|3023799003;
X-Microsoft-Antispam-Message-Info:
	BCoCeiDl025BjW64vCZwHC7k99HKaZ85YoJYa+Vt+sxEB0N9hRMK2DaejG60zyx/kFJPq9IFI6Yvm9j+3Hhn6HALvjtkR5njNAcmFe/jNzPxNUov18ZBrfMxeWU3SLljwweanhxSUirLjseAVr+cyn9zs9pT13YXmQzssUNB0HEEoOKWwt+YROs52iudmO24rSAfpRj8Iygs1crivahnVbtvAML3LC75UJbjl7VqwIx+XQPUjgY7kext0l/sDyjHOZbsZTpeagZpC7+ayOz76Qqc/XWekqgKS+gsRG9IZ2+6OdYjtPE9rP952dlJXcrr0EFOpW/I3yyU2jFT5e6u9ksK8X8cBaqStcrY3BaRNiHYi8gmrWrioy6ByALFd8S/l+EtDeyNNRd0M2g4c0z2axo0H7Jz+2b9pDyR2KfN9d0ytTjdje6REA1poCYpo74FvLRwGI9tog/1bBye6QmBWMv4Um9adEQNfgWb7AN4gjY/3x6HB01xi8AM56FNHTti8QEWRW8R71S4apvtas/iJckU3wlaIhvr5x8Vqg7GVETjA6AMVDW5yCzMa1geQOBl2IDV94fenwJpY3kWWRZ0RplAyxSB7j2bk+gXtiQCEhz9LNV/Gv4Q3ls27GpoXnbL3W7plH5+wCwTZUpGuk9ExSRfv/ioF12d/fUALyTw65R17NrC/KLHDyUtHCC8a2B2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(56012099003)(11063799006)(18002099003)(4143699003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEJtQUw5cnZ3NENDODBZVGRBVkpJSU93aEl5S0dKdWJKaUZxZmQ5TWZUT1RY?=
 =?utf-8?B?azVCRGZzczE3YUk2YjBnK2NzZkgvcDBOZlZuUzlhOGV5RFh6eVArK3lIQ2Q4?=
 =?utf-8?B?bmprem5qc3htMHlSRkV4VklFSnpPY1ExWEp5R0t1UjBHM2x3OW5QUWJVcytQ?=
 =?utf-8?B?NXNkZk1kTWhVSXhvd1p2cmJxWUxYZTduU3FiWkZyVk1XNXMvUGttcDFqZHhR?=
 =?utf-8?B?Q0ZZRmkzbUlzYU1xNnN2bnZXZ0dTOVcrNlZJV0pCeWNuYm5WSlpWWWVJdXpn?=
 =?utf-8?B?RFZ5QzY2RU1lR3p1ZWROK2VMOTlrN0cwL1o5Q0NlRUhLemMrSm1nYW8vNTRB?=
 =?utf-8?B?SFcvL1didzRJT0RxdDMwRXNjNmhaR3crNHBNVUlhRDBnYjBjMStEa0NrVEVN?=
 =?utf-8?B?TFkvOFFTbFJGcDZXSlhwbXFQSHJIalhYZGZCWVF1MkFGVkVpSXpXOUZKUlph?=
 =?utf-8?B?LzlZdXM2WlBxOVg5NFFvWUd3a3luQWxMeEFXbGRkOUtpelltU3pGU3NtQW9I?=
 =?utf-8?B?eEhYVDExdUNGak9WdGtBMHFWQmNiVHBnazFtQUxmanF3bm1FSEtGS256OEtQ?=
 =?utf-8?B?cjljc29zdXY5Q05CeVcvaVpzVFMycjh3Y2REbDl0Zk5HeHAwM3hkdkpJcUNo?=
 =?utf-8?B?Nyt1eHlFaHlYVmhpWll0a1lIM2U1NXoxb3VrODQ5dE1LTkVCUjRCS0NoQnFV?=
 =?utf-8?B?a3lpN2tFaXJjOHVaemdHM3drN3VKUFBWdzZNbFRpazM4SElBbEMzSllQNldP?=
 =?utf-8?B?SktSaGUvREFzRnRJdHFDWUdaWm1mTFBlS1pqSGdjTTE1cmxRSXU4cEtvQ3Bq?=
 =?utf-8?B?OWk5OGFUMDdQUGtWcnNkbVVpTHVnbnh5ejV3UWlyS0h1dlFkajV4QnZDY2hX?=
 =?utf-8?B?YXRuZEc3U2F5NmEwVS9sS1YzM2tLbFk5QWdjVzhnekF5WjJneFNRVkZmUDhM?=
 =?utf-8?B?SUtZSUIwdTlVT3ZBVjA5SG9lbGQzU3Y3YmFVWXhYR0Z3cTBVV0tVVzNLSXVp?=
 =?utf-8?B?VTZSb1NrT0ZCNFA0SC95S2RxYTI3aDMrQmFFN25yb1l3cnFhS2haaExmN25q?=
 =?utf-8?B?bVdBRHRCRmg5akp3UWc1ZWZmaFVreHlGc0VUaDZpcUxBaXNPdGxOcXNMbysy?=
 =?utf-8?B?RFVXOWJUNThqN2FIL05pWUYyM0d1TUIwTldja0xnSEh2N1h0MmtGWVVVZ3ln?=
 =?utf-8?B?bG5VcnV0WFdQYlZ1Z1k2K2Z3bFZ5dFZkVTJhblNOTXphaW5MeEp6eTMzUG1j?=
 =?utf-8?B?OExFTmVLWUFqenoyb01TY21tVE5MN1NVWTQyNXJhd1k1cWRvVkhKME9UdmdO?=
 =?utf-8?B?N1VoVWlNV0pISUpUZUo3M1VnZW53Vjljamh5cGw3enRKU0JKV1ROaFBLK3Ny?=
 =?utf-8?B?MFFPMWtCdFQ5dXJFNkR2VHZLV3NQektnOHd0dlhmb1BKZXBDSWNnY243TXJZ?=
 =?utf-8?B?L083SDZ2MzNDMWpwZlBGUEI2bkRLTWZRdnphTUdDdGhZeVZ1ZTFnMjFxbEZ2?=
 =?utf-8?B?allEUXV2U0NqM2tkRlBYRGhydlBLcjhhTERtaUludm42Y2ZXODcvQVhyN084?=
 =?utf-8?B?bEp6MC9oU1F0Z0ROT3pxK2J2U0VEM01LWUtvVVgrU2wrbURmQ1NnREZDVWp4?=
 =?utf-8?B?OHZJbDJlM1h6clY1TnJWU09vcHZZS3NzWmlxcU9VOFRNN0lLNk1NME1xdlVV?=
 =?utf-8?B?YW5Xb2swTGVJcWdwaFR4NzZvN0J5cDZtSm5UV0NwWFdiajZ2dHBlMzZMMXAx?=
 =?utf-8?B?UUVHVS9oczZWUjN4aHk5Z1BaMUZ0LzlPZTBsV0I2MTUzS0FDYms5TnNnbGsv?=
 =?utf-8?B?aWhqRlhnTUhCVnhlWlV0TzJJdkkwWGJQQW9qMmY4Qm5yR0p6bVd0c0laMkFB?=
 =?utf-8?B?d2swa0JYelI3c0cvMTR3OVhRUkZ6TzY4eGhXQzBYZEU2VVdZTnVWcXFxWmwr?=
 =?utf-8?B?ditzU0g3a0xrU3MxZ092dTNGSmc4N3g2QVhHdkFuTzNUbHBNdmNodzJTanZS?=
 =?utf-8?B?U1UvQnFWdlkzR3dqd2RHTW16N0pKV2NST2ppQzJlbWQ1ZllUSS9PbWpvSnRW?=
 =?utf-8?B?amk5c2pscDkycWF2UGY5dVpYYWh3UnQyZDlRVW1QaHV5SDF5UzVGdWs0eDVh?=
 =?utf-8?B?cW42Ui96NnNhRDFOS2hBZm50M04xYmVjMmRWcVdDVytXYXhIcWVuQW9hd1hD?=
 =?utf-8?B?YmRmRlI0UitzZFhocmJCYnpDQ05MOWRiVHdveGJScmdQSmhJVnAzSFNJN0pW?=
 =?utf-8?B?dm5yWUF2ME5mT2d6NTFXQXBvWEl0cGZQNG1zbzB4WHNxRjhrNVBMS05iVFM0?=
 =?utf-8?B?VjBaVEtQTnpCelVkOURCazRMam1ObDBnRWUvYmxXd1NNOXllSDB2UGgycXlw?=
 =?utf-8?Q?oyYmLnJdZwNwzXiM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9503dc6d-f43d-4d82-d3f8-08deb59ccf93
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 11:50:23.5976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKt0YnrRQsQkHOIhRPTBo9E/6mb1/RT1bwlCPYmLh/ks09KDTHGaV6n1twXPwHeUnsxLcgudlSV8eZzS0nu94Dk6pyIB6BYdkTZZTGoFh3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8215
X-purgate-ID: tlsNG-ebf023/1779191427-41F7D3FF-873A6213/0/0
X-purgate-type: clean
X-purgate-size: 3931
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:mid,citrix.com:dkim];
	DKIM_TRACE(0.00)[citrix.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,wdc.com,gmail.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1805957E07E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 11:50 am, Oleksii Kurochko wrote:
>
>
> On 5/19/26 11:28 AM, Jan Beulich wrote:
>> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>>> The following compilation issue occurs when UBSAN related stuff is
>>> enabled:
>>> prelink.o: in function `smp_processor_id':
>>>   
>>> /build/xen/./arch/riscv/include/asm/current.h:46:(.init.text+0x274e2):
>>>    relocation truncated to fit: R_RISCV_JAL against `init_done'
>>> make[2]: *** [arch/riscv/Makefile:45: xen-syms] Error 1
>>
>> There's no init_done() as of yet.
>
> It was found based on downstream version of RISC-V port.
>
>>
>>> The switch_stack_and_jump macro uses "j " #fn which assembles to
>>> JAL x0, init_done is a RISC-V J-type instruction with only ±1MB range.
>>>
>>> Without UBSAN, .init.text is small enough that init_done (which
>>> lives in
>>> .text, not .init.text) is within 1MB of the JAL. With UBSAN enabled,
>>> all
>>> the instrumentation calls bloat .init.text well past 1MB, so init_done
>>> is now >1MB away from the JAL. The linker tries to truncate the 20-bit
>>> J-type offset and fails.
>>
>> .init.text is well below 64k right now. Are you telling us that it grows
>> by more than a factor of 16 when UBSAN is enabled? IOW while the change
>> may indeed be needed, I question this explanation. .text growth may
>> matter
>> as well, and e.g. .rodata (living between both sections) might also
>> grow.
>
> No, it won't grow so much.
>
> With UBSAN enabled:
>
> $ objdump -h xen/prelink.o
>
> xen/prelink.o:     file format elf64-little
>
> Sections:
> Idx Name          Size      VMA               LMA               File off
>   0 .text         0011c79e  0000000000000000  0000000000000000  00000040
>                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
>   1 .init.text    000285fe  0000000000000000  0000000000000000  0011c7de
>                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
>
> With UBSAN, .text itself is 0x11c79e ≈ 1.11 MiB — already exceeding
> the JAL range on its own. Even if .init.text directly followed .text
> (which it doesn't), a call from .init.text to a symbol near the start
> of .text would be ~1.11 MiB away. init_done likely sits somewhere
> specific within .text rather than at its very end, but add the .rodata
> + .data sections on top and the gap is comfortably past ±1 MiB.
>
> As a result, the target symbol init_done may end up outside the range
> supported by the R_RISCV_JAL relocation, which is limited to
> approximately ±1 MiB.
>
> Without UBSAN enabled:
>
> xen/prelink.o:     file format elf64-little
>
> Sections:
> Idx Name          Size      VMA               LMA               File off
>   0 .text         00044618  0000000000000000  0000000000000000  00000040
>                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
>   1 .init.text    00012c72  0000000000000000  0000000000000000  00044658
>                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
>
> Does it make sense now? I can use the text above for commit message
> instead of what is mentioned now for more accuracy.
>
> Would it be better to send this patch when this issue will occur in
> upstream?

You want to make the commit message less specific.

The problem here is that JAL only has a +- 1M range, and that this can
be exceeded in some configurations.

The fact it's init_done(), and indeed that it's also UBSAN, are rather
incidental.  It's useful to state once, (including "found in a
downstream branch"), but don't focus on init_done().

Also the subject should be "fix switch_stack_and_jump() for range beyond
1M" or similar.  "fix" on it's own could be one of many things.

~Andrew

