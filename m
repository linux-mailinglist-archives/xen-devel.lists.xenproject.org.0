Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2P5rL6FPMWoEggUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 15:29:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A89D68FF07
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 15:29:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=yhwSbnjA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339236.1600390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZTq8-0008AC-Qg; Tue, 16 Jun 2026 13:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339236.1600390; Tue, 16 Jun 2026 13:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZTq8-00088p-N5; Tue, 16 Jun 2026 13:28:28 +0000
Received: by outflank-mailman (input) for mailman id 1339236;
 Tue, 16 Jun 2026 13:28:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wZTq7-00088j-Jn
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 13:28:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZTq7-004rh0-03
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:28:27 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a314f79-e002-0a2a0a5209dd-0a2a450a907e-12
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:28:26 +0200
Received: from [52.101.56.30]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a314f78-56b3-0a2a450a0019-3465381e7762-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:28:25 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by PHXPR03MB989234.namprd03.prod.outlook.com (2603:10b6:510:3ca::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 13:28:22 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 13:28:22 +0000
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
 b=Nu9PO6vNHx7wCzUrEUte/nMe6DMSrOdLzWB9nktRKtPrqKKcfFtC990QTnHWdRicy8OtqdekNSAs9N3fYjmjSgoE16cWTpOof8qS5oTghwWepKxiUpnUqBP8/IKI/++MyEuitVYNK9IjZ2lksIWMSL2G2m4r0S8iSLzMs3BP9A1Dh+whK53xxSFzO5VpBFiI/c5Kvjzc7bG7/AayJRNeEJxq2BWvzdb9VnWoombjz7DCV6B/GmhNOoWMEPqGJJFiT74seWKlisMkiplIg6W0CWaNiSi9r9MBwEoi/NIovSHCXMuZ3HBTf9eytEC0qNUpJ5KCIMqpD9N9MHt8TEB2wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHrqwKPtIkVM2Le8zVC4Ap5UBhCOoLk9tAJ4rTESw8A=;
 b=ypp1ht7NMFLjXdh07ZSu9sb46IddqwsnsgAIrkgfa7Zx7SgDmX+nXu6vVPIaEQzeD2dvxp47RrJJC5DiM3L/JlpUGLmEp0NPCDoh5WGtguZAkUzAKAbSJSPRFC3prGuQOY/tllU0nzNupFDCuCWb9bTKv2TPAxQejWKNbbR2GZ4/AC/kRr/Zgg88AMMmimwMYflrZ01zGqKFkKD/n2h7dPl6VHdtuzHz3La7+845l6rMWj7tZBwaE5deRBUbm4aW0pKqbPjb9pF/A11Nc0y1W/PpryQMf/Kq7UU0iDpnEHTIBs33W1Fy0nj5pF7PELWeUQTbUMxo6g977pXIvvUqKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHrqwKPtIkVM2Le8zVC4Ap5UBhCOoLk9tAJ4rTESw8A=;
 b=yhwSbnjAgvPrZYK3+BSGolXyr5Pol0EPmgghnzZEKltxpKzYObH8u8nEwBYcFIyjcTPsZ8BjdTS9ROAybfJW3mM/9SEeiMoQywbGbW98EKVSaucHXp1KjlCL4VoYGLihqBzH5zdEgoMn/fjqkwUlk8Mu1C3gMU/y7AZLs1WOZwA=
Message-ID: <fec75a30-b51f-47fa-93ea-a02e82873afe@citrix.com>
Date: Tue, 16 Jun 2026 14:28:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] efi: Skip FPU save / restore if using idle vCPU
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20260616130051.3359801-1-ross.lagerwall@citrix.com>
 <1781616095.8631fc262581453bbf619ec5b2062170.19ed098307b000701b@vates.tech>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <1781616095.8631fc262581453bbf619ec5b2062170.19ed098307b000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0045.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::17) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|PHXPR03MB989234:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac21d4c-04f9-4451-bb56-08decbab2329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|11063799006|56012099006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	vYTpxiirO6IUKeEg7woy4aepEKvuC0IqkqRdkTs38+brpW1FW0DMkyBhr92WyA9eoLrc7OvxI9qAP/3f50TdYVjScThFU3FZUVcOMoEt4F6XekW7y+4hVEKkLS2W9lXsQ9AD0m/jn/UARlzGfriFzcLhtciN0zyi9h7AZX1FU7lXJzmMYSaLJncgbTdCJLann6/mKMTGQRjSbjSBXqS7Sk1BFQ+CPL1/yTs2ceTSdMjjj1G0CnweedgAsRE+oQkL/d7vY83tt12VBQfmd9qMjXrBLsxNJizkEkkPid0SNq1prbwgq9qcbEkISLlZJCbbYckmiSFKxRzW3UFsJoxPc/obbRlKeTvVlRpSw5iVKaL1kx/t7OFTCUgz7P3VTVNoI/MIgvuR5SSAniNHr1Hy7aGkXxlQPbhd1+m3inHFMfaDG8w0QI2qFf7EyberGqOzV7ru2QbT3WhH2BCiMwdhUahdopxEsY5Qxwh3J5IRFUo8ECNLyRzQzaKrZ35pPGmA5o0BGX1iGtHnK9efgDGpfC7LQB/tnb5Ol9Kz3M2TQRGjIYwQcGOf1S888quEaAhBL1CA2lvS6SHp1e5QN4vComVRy5t/2Z/hAMK6dCG++rfEv97cO0kGEgcA0MHE4SRs2t0unf2WqVG3dgpl9cxfZSRhfYXAZTM/OXm2uPSDYa0VCghMutdqjWOuuz0VEp+0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1BrWVczRWJxaktQbEtTTTcwdWd3dXRjamdNNitEWUpENkZWYURmbDlocVhM?=
 =?utf-8?B?REdBYnRCcllhU29TNEY3U1JMOWlRSHN1OE0veFBzUnJndnF4eG53WnoyTjRI?=
 =?utf-8?B?ZldZczZvRDlDTmt6MGNDck0yY3UyaDhmU25iNEsrdWF1MXpSTTUvU3RDNUtO?=
 =?utf-8?B?RTBXandGTVNXVkhBa3Fzc01ueEpqdXVhNjNheTBDMk5hREtXdm13TnVmdFJs?=
 =?utf-8?B?RmgrYkpzb0ZEWklLOXI4UUNqV1cwYk1DS2FVTGh3cGl5TmhUUFVBMDlRaDBt?=
 =?utf-8?B?dDNVRTMyVmtYS2QzV2VtRnFYYlB0dXhSc2lkYVo5T2txZlpMdDRKRnh5NTd4?=
 =?utf-8?B?Vmg2a2Z5ZFJJK0VaTG4vUU8zb3BaTjcreU5hWk0yNWJpWWlJU2F0c1lNcUdz?=
 =?utf-8?B?bUJ3cC9KWGNQR0JaNTAwWkdYWFhKcGF2VzdxUnpLc1lLdnE5bGdOTExJQVVj?=
 =?utf-8?B?eUt4djlHV21iQ2pXbmRWamFLdXh5Q3d6bjFUL2Z2cWdheHR5SjNrNjNWTFhR?=
 =?utf-8?B?OTN1R1RLREk5TjQ2ZHZZNy92T3d2YUYvc0FoK2tkbmIvM2kzQmlOWjRodU5L?=
 =?utf-8?B?aWYrZ0Z3M21pc0ZMeWhmQkxUamNjTWdCWTBnQmhYUUlDMUtSOVduTGV2NXJ3?=
 =?utf-8?B?c3FkS0l3Q0M4MUhFZzZzbDlSdXAyMTNzRnp0RHdWbnJ3d0x0ZEhXMW5Vcncz?=
 =?utf-8?B?eWp5WXl4N2U5YmhHTWdMMW5BTWpiTzB1WmdXNDRnZnBrN1UvWnVzblQ0R0F5?=
 =?utf-8?B?SHRKd3krMk80TldiOXpvYVpDY3hYSlBYZTZLQzZtS2FpZFhSNVc0ajRrZkk4?=
 =?utf-8?B?VllIWWJvZURqVzZtZms1VVdNY0ZIai91R0xLT0U2OGFidnRpTTdmZ2ZzbjRI?=
 =?utf-8?B?NnJwam8xZDFVVXYvTnovemcyRWhOYTMzdWJMYmdkQ1Bza3llNS92WVZibC94?=
 =?utf-8?B?Z3Y2Uzl6RTREUjFXZERxcGgvbGYxa3ExbGgxMUl6TjZKY05rRVRhYjBPQys4?=
 =?utf-8?B?S0szbTFleFBYTE95Qmt2VnRVS3c1c1E2S0F0SU81bHlUWDRqQlF3R1prODFR?=
 =?utf-8?B?VXNURkQrUXVVL1RWL1lYMDcxaXNRS1F5NEd3bVNnS2Vyek1QbVJ1bDdBakZ1?=
 =?utf-8?B?d09TYjdUcHdsSlBUaXN6d0tNaFpYNXFaWFF0ZVlSeVlMR3ZySFBucDJzZ1pF?=
 =?utf-8?B?VzFEc1IrbmZReUNnK05zTFQ3R1RscWpMOXdpdXQ1SS9QMGJLeURSQzVJZnBq?=
 =?utf-8?B?ZDlYZk5kU3lHL0NnalhRRzhvVHk1aE11aGZFOEYzc3BoM2RBTHpqd2ZIYjl1?=
 =?utf-8?B?SEp3Z3ZYbWxQK1N4U0NhWk5Ob1BUVEwyRTM1a0pxSDFybTRGaCtIL283aFM3?=
 =?utf-8?B?N0VVbnNjSEQ3MTlnZURSUVpwRjRVSlBEUGxNc1NPTEF0bjgxWFAxWDhNS3Qy?=
 =?utf-8?B?a3d6VnE5Uld3NjMwZ2xFblBVNnlKNE5OVlR6eWlQL0wvWFN6UkNyMURYdmZD?=
 =?utf-8?B?V3l1TkhsOC9zWFpTQWNQSUtlenUxbExRdlFTMkdtejlSWGN4dmNEbTFzbEpB?=
 =?utf-8?B?b1RCMjRDeGZWMmlwaG1YdGV3Uldia3ZkZEEwd3B0NjR1N0N1a0duRWZaUnU2?=
 =?utf-8?B?WDJENG5odGc3YXlNN3l6UEJZTTFPcWpRMUFiT0JuR0VKamh5YmFKdExoeDRZ?=
 =?utf-8?B?OFh3d0dzNU9mOWVjY2xLODF2ZTdsSk5tWFRGQ1I2WUdnNDhlTVdpZXVwcHRZ?=
 =?utf-8?B?KzNvcDVJVmRFZXBMNVh4YSs4Tm9qN1pFblV0bzVmajlEbnZZWFI3YlczU2tt?=
 =?utf-8?B?UnRKbGpndVlkTHZnVkZJK01KZ2IwM1FPZEp0c1pyUE05Q2NTZG9hUGxaM2lx?=
 =?utf-8?B?RVY4enhDQkxTNjVtVElDYVZLWG5GR2VoR0FLQlR3RThhT1g1TEFpWkFUTElT?=
 =?utf-8?B?REQyOWJvUCtLcnF5UnNlelBKN2Q2dXZ2OHlPMmpjck5EQjRKTkZxQmZndkhj?=
 =?utf-8?B?eUhySk94ay91SStQZUNJdDNpNWNOMEtFNURuVW1jUHV2eTViN1Y0TUVYVnow?=
 =?utf-8?B?OGhTK2w3YWpvMUdCRjNVRmE5NjhyVFoxNXlNa0crbXRON0RIQWFETklvd05l?=
 =?utf-8?B?MTZwYzViSjZlcGFCNFh3MEdMU2hKWGdvYjNPczlhMjg3UVV1Y0I5ekpPekRj?=
 =?utf-8?B?b05Odk5jRFJ3bXczNmtGQkZNQVRnS1FDSi9icUdxTU1HVUsyM0l6MjNZdUhZ?=
 =?utf-8?B?QU1qam9Ba2ZYWWk5alBJWXhpbStGMWVtZlNQSFdQdXcyY1puN2RwOWI0Skhj?=
 =?utf-8?B?c0NiL20ydE5leFBicDU3VEE0SHdjaUd4N0c3TXlvM2xTV1oyWXBhTUVWekh0?=
 =?utf-8?Q?ExtXvBL0HWpmKBu4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac21d4c-04f9-4451-bb56-08decbab2329
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 13:28:22.4708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTMS2/WdXvvR6SHGVrnSZ4FlF3fThyxTRcVclYAbZxsiuqd/FFZCdH+9e8V2LwrQDPtoNaA26GtY5GsNs07kmEUPBaP6l5AbEGtXmnoV9ZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR03MB989234
X-purgate-ID: tlsNG-4011c0/1781616506-7C07C8B7-144FFC41/0/0
X-purgate-type: clean
X-purgate-size: 2865
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A89D68FF07

On 6/16/26 2:21 PM, Teddy Astie wrote:
> Le 16/06/2026 à 15:04, Ross Lagerwall a écrit :
>> The recent changes to remove lazy FPU support mean that
>> vcpu_{save,restore}_fpu perform the action unconditionally. This trips
>> the assert when calling these functions from an idle vCPU as might
>> happen when calling an EFI runtime function. There is no need to
>> save/restore the FPU in that case so skip the calls if using the idle
>> vCPU.
>>
>> Fixes: dba44e051209 ("x86: Remove fully_eager_fpu")
>> Fixes: 4b9851c64522 ("x86: Remove fpu_initialised/fpu_dirty")
>> Reported-by: Anthony PERARD <anthony.perard@vates.tech>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> ---
>>
>> Anythony, can you check if this fixes boot on your machine?
>>
>>   xen/common/efi/runtime.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
>> index a23fa75e3740..7713676ce288 100644
>> --- a/xen/common/efi/runtime.c
>> +++ b/xen/common/efi/runtime.c
>> @@ -88,6 +88,7 @@ struct efi_rs_state efi_rs_enter(void)
>>       static const u16 fcw = FCW_DEFAULT;
>>       static const u32 mxcsr = MXCSR_DEFAULT;
>>       struct efi_rs_state state = { .cr3 = 0 };
>> +    struct vcpu *curr = current;
>>       if ( mfn_eq(efi_l4_mfn, INVALID_MFN) )
>>           return state;
>> @@ -98,7 +99,8 @@ struct efi_rs_state efi_rs_enter(void)
>>        */
>>       sync_local_execstate();
>>       state.cr3 = read_cr3();
>> -    vcpu_save_fpu(current);
>> +    if ( !is_idle_vcpu(curr) )
>> +        vcpu_save_fpu(curr);
>>       asm volatile ( "fnclex; fldcw %0" :: "m" (fcw) );
>>       asm volatile ( "ldmxcsr %0" :: "m" (mxcsr) );
>> @@ -107,7 +109,7 @@ struct efi_rs_state efi_rs_enter(void)
>>       /* prevent fixup_page_fault() from doing anything */
>>       irq_enter();
>> -    if ( is_pv_vcpu(current) && !is_idle_vcpu(current) )
>> +    if ( is_pv_vcpu(curr) && !is_idle_vcpu(curr) )
>>       {
>>           struct desc_ptr gdt_desc = {
>>               .limit = LAST_RESERVED_GDT_BYTE,
>> @@ -159,7 +161,8 @@ void efi_rs_leave(struct efi_rs_state *state)
>>       }
>>       irq_exit();
>>       spin_unlock(&efi_rs_lock);
>> -    vcpu_restore_fpu(curr);
>> +    if ( !is_idle_vcpu(curr) )
>> +        vcpu_restore_fpu(curr);
>>   }
>>   unsigned long efi_get_time(void)
> 
> No issues with the patch content, though it's the same as [1].
> 
> [1] https://lore.kernel.org/xen-devel/8de2649558826621d49b404cae7a874f504e6b86.1781282640.git.bernhard.kaindl@citrix.com/

Sorry, I wasn't CC'ed and missed that.

Ross

