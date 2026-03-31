Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAjTFqy2y2kpKAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 13:57:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC59C3692F8
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 13:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268875.1558074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7XiH-00022L-BA; Tue, 31 Mar 2026 11:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268875.1558074; Tue, 31 Mar 2026 11:56:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7XiH-00020h-7i; Tue, 31 Mar 2026 11:56:53 +0000
Received: by outflank-mailman (input) for mailman id 1268875;
 Tue, 31 Mar 2026 11:56:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w7XiF-00020b-W5
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 11:56:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7XiF-007Ouq-5T
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 13:56:51 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69cbb67a-e002-0a2a0a5209dd-0a2a45059400-44
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 13:56:51 +0200
Received: from [40.107.208.20]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69cbb681-5aeb-0a2a45050019-286bd014a7a8-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 13:56:50 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB6994.namprd03.prod.outlook.com (2603:10b6:510:12e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.27; Tue, 31 Mar
 2026 11:56:47 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 11:56:47 +0000
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
 b=Aq2zfdgm8D7Ym4A1ltscvh6lfarNS7v21+XrwLbPGIx9zBuFFF5EtXVrR9u1zDyaWASw22YR2ybTZbfu63BLt9RHan46//2Msg9zqT+MVmmDFC+CRHWuMj9IWu2Pnnlvp0WzNolDP5yWtaIlLV0aO4G0ri7rLz+p9HP/VwnGyaN901ehUuHVcZ0ruwj4hDNqnWurdD/YESoGjUAWJ/YfIrZ6pLtSquzaGqxr+cVe17mpHk/pjEMKEEXWwlGKuGfxyt2QP61Cf23m8g2dUqP8D5NCSaDJlkn1NwipPY0yMEPYhmNlPkrAH1FSNT5l7y8pLnmrjlAVmcdvws8URHapFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfGjFthC/K00Gy1hqVzQCHMfTBwwcc9Qc2chCxNKKXs=;
 b=zJ5GdxikHlSrOrZFRM2YS+gF7ALwwKY8uT9XZb9r7BkeDUj9p8NAEwkpPTal7Qa6Pqe4Wr+/f52QaJETR27LC02vFoNDyaj/QwWRQAStTk+0vqEh2qgEEjpcp92038zhh69Y7uLIteBtW3kGhmNVgsHYRMI0ktYH2iQvICShnopnOxJew9m2JgULEYWTOVIvfbc6YvIjpHhIs/svZR8CMcc3rLwrYCze37kzlAhlLZv1MYekX0HKDhM9IPl8xrAoCz1Gt5yN/A13uoHxM43VfjHBXgit6rNTQNfuEkN6Njcy+ASKlXnBrAGtqBnXk3n+pXEi/PNStjAYK9Wdeodq6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfGjFthC/K00Gy1hqVzQCHMfTBwwcc9Qc2chCxNKKXs=;
 b=jHJVdCA7Nca9gTPjtbpm7NzNwtJ8/GF/cd4i5LXxVxP29Le+g//Ykt46IhNUKYmWjhmw1921nCRKNMg+WctNY22oqV5H8gIRKr0s64KD321AsfWUCNmA38FLR6wU8uvOOioZliXHQnOCPrJlGZ1VI8y9MNJetyQ9x97VD11XVW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4c5fc93a-bbd8-4936-8c5c-9e963fd59bd4@citrix.com>
Date: Tue, 31 Mar 2026 13:56:33 +0200
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/8] vpci: Use pervcpu ranges for BAR mapping
To: Jan Beulich <jbeulich@suse.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <43ce584a124f0bd07e641934e15e5ab56548e1ba.1772806036.git.mykyta_poturai@epam.com>
 <5edfcb6c-c36e-48cb-a8ec-39e0ff7ceb91@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <5edfcb6c-c36e-48cb-a8ec-39e0ff7ceb91@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P251CA0009.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::31) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c9296cf-da68-4ea2-7d27-08de8f1c95f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	739tk0BoI4OWA9ZjzZWvuDD5/r0BnlyFf0Cce77zu5tQXykxCTkvpywCAHgduLtgpZg1R3lKjraL5Rq9A+B3WXnHUaCEknPDrrdgN1BQ5bcJ3s5KdrfCzl42jFwFzqNYfyb58LtNX+EUY3VjSaITlp6QcU0ehH+h2J9IsRX4LykcWMMEDxSUTQTlZx+IDifgy4MuYFyBVvN9V+QAhFTpFHWoe374xL21D8uL8r/nc51dFzfgzqpfDEYg6LSMemXc0YrA3TkiruaaVKxHO3WWfwQNAwjgjUGL2TMTIW6ZIbdPGexthe+DM9kLeJA/hfRmrGRGB9Ga4LwdIHGk/8/lClbuKQQGV/kaxml1ZGsAqegwohKfVHvgeVpzzZyC5a5+yRMGWaRh8eQ9dUTpy7CUyxKCA61hG0FHXk0V56lVCHFXc0UuZgcPsiNfGt8IxIABnPaUrGnEd0cHA264Lp1drj5oJoCvMUZNRKxgMJNBMQj9xWG11WsHCqDNmk72hk76Q2jrvoBxlPehk7lfU1KED/u2RZCfibRaaD6ZnlbZZyJKl8BXkAKrnpXdcrvFI0uNkZ1U/yJTRY8CFqYl722fGSQf2tfTE3azoE22eogpPXUa2rHGgN82GVC/71aLEqOnVPeRdAK2Z0BbdLQ34MjLWdq07ftZUBwY6sdpjHs0sEPVvtDBQKIdCBy3fw0Sx6zpzCla5kRGJ4nqhL9ReAd7AN4qDoSFzlIkf0LDfoS9Y+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1J6OTlLQi9GYkRxNXloQ1MyVHRMd2ZWd3E0dW5PSnhmZUl4cElWQk4yR1Ro?=
 =?utf-8?B?WFc5anFUNmNTTk9ESGJNMFNIdFVMckVER2tVNkgrWStUdktLWElZazQ5emJj?=
 =?utf-8?B?ZDJtUU5mS2VsRUcxRXhjcFd4MC9zRXZZYlFTR0tuZkdPM1M1ejhybHY5YTM5?=
 =?utf-8?B?ejBxYVJ4a1hUOHZaL2hFSnZvaTBKekhHRlZKSGxub05YUjhYb282ZjU4VUdp?=
 =?utf-8?B?UDVCSkgvblRVS0hmZ0k0cG9yOWVrWXB1anRrcjVZMGRYRW5jeGIxQk9McSsy?=
 =?utf-8?B?Tmg4VUovSzBRWTMrQTQyc09YSXhITWlxSTFlQTIvSUh5R2owNTh1QnR1T1Vr?=
 =?utf-8?B?Q1I4WXRMamRZWEx3dnJ4OTRJa2ZVeHpFY3ZOamVtV3NycU43MHYzTXJDVzN5?=
 =?utf-8?B?ZnZPRXVzMzFTbysxYm1oMG01TStXRGg1MVYyY2Q0eDVERFNiMU5MZWc2SjFQ?=
 =?utf-8?B?UmdlQTBsM3BuTG1GaFdlY21IbERQMDdSZXF5ckxiYmREMDZwalYwbkFOZVd4?=
 =?utf-8?B?Y05OdFBXeTdCTmh0TVB4RXozamdtQVhNOXFOWlF5ME5uK2owRFlodzl6aWFF?=
 =?utf-8?B?ekE0M0NnVTZuUnpiaytsQU9HdXFuTFZqdTNzYlB6NU5FZ2djMHR4NTh0d3J1?=
 =?utf-8?B?aEFjdTFkNVlnV21yeDlkdDFqcVczMUhSVTNZY1p0L3Z0elp4V2I1dTBtSjRX?=
 =?utf-8?B?S09JeUx4TDRjVlhJcWJwVFNTN0ZMOStlQlVqYjZtdlBZWUdCN2oyM3R5VzUv?=
 =?utf-8?B?K1VLSDdIdzV1aGgvemdoTWRNWVhQNHZ1NlNURThPVXdrMTJtbHM2S2NZblpj?=
 =?utf-8?B?aWlodG8ySWFwM3RRY3lyY3NSMy8yWXo4OHI0MTNXL3dUZHEwRGw2NlJMMDhF?=
 =?utf-8?B?dVdPcjU0eGF2clBWMGx2ZjJlL3NMTnd6cjRsVHZGdEdZSWkvclBqNUt4eFFX?=
 =?utf-8?B?aEM1ajRveDkybDJ3SU1VcTVyc01FYVZoaTg3Vzk3ZlhvSzVVZVJlRVB6dFYy?=
 =?utf-8?B?SFlwZVBFK3NveFdZaW1SSHJCeXViVmdvNVlpNlhPR3dLa3dTNmljdWNrcW5q?=
 =?utf-8?B?SHpGUGlZYURZZi9TRjdPb1Bqa2R2RWVPZUpsNURrcUNJckRJRGQ5cUVXVTZR?=
 =?utf-8?B?SmN1QWV5ZEM3NTNpWHFTNERubjFuRm1GcFBDOHVPR2FxUWxWcjU2dytXTjdw?=
 =?utf-8?B?OHhqUmJJNmkxZHpoUG9tamszaXZPSy9nWlpIOHNwTWt5ay9TRjZKY2hWV0Vi?=
 =?utf-8?B?Rnc2TWl3ajd3elc1TGx3WUF1emt2VHcyZjIyK0lQRU40UmpEaUNzbk5SQkFy?=
 =?utf-8?B?aHpVbVlyWldwSmVIelZxSFZoSjdMNlNWZkZJV3JUMHFUTVRTdTE0d29hZUZx?=
 =?utf-8?B?Rm1GYUV3RGZHd2tRdG9UcUhOemRiOWp3aTZ2ZTJEZGZJRXJndGVRQ2hhTlow?=
 =?utf-8?B?b0xpMk5GbjIzSytDTUU0NmZjT0gwb21maFB6NUtERFBwS0NtbURtc1R2bzZn?=
 =?utf-8?B?b1k0U092TVZDWEx0V00zdmY3Mk92ZjdCcTFTbEZJSzNmRjhPNkhrR3g3TXZY?=
 =?utf-8?B?OG5yZi83YUR0YXI1cGUvbEVmNU05VEhUUlcwaXd0dDEzNlZydWZKMnVDUzlE?=
 =?utf-8?B?aTJ6OCtoaTBjaGdPaEFTaTdiMm1xditMRmN6Y09RZXR0VWdTWnE5c1V4WVlZ?=
 =?utf-8?B?MzRXQzRCZVAvcjZEV1M0RlNITUVnT1BxRExQSk9BaFVud2ZxSDIrdGR6Szdk?=
 =?utf-8?B?VTM4RnJHWmVSMUhpWEVmQkFiVzhaUTFVOE83azhUdGpMbzlIRUprWTVHRFkr?=
 =?utf-8?B?LzhBNTVrRlNVcG10bWdwQmY3cG9aUk12cnFrdlZ0UUdsQThwZVZUTjNyNmQy?=
 =?utf-8?B?aldDT0sxNTIwc1lHYU1HK1V1OGVXRlV5TWdWS2RTMEJXdjREWkRpak8yOHUz?=
 =?utf-8?B?cTA2ZExPOEtGSk1KMHlxTjgwOHdwTkNsV0tFVnFFRk5ldll1R08wNlhVQk1O?=
 =?utf-8?B?SHRkS3p5NmVKZEdpbVBhOWN1Y0lCNlNFQVNDajc2ZTNQdWd1aDRYRFlCOTVV?=
 =?utf-8?B?TTUyYnU5c0xsUi9RSnZ4Umttc0Jkcm5hTzh0S1pzczR3TFpGaUp2Ny9sdHZU?=
 =?utf-8?B?SzZxbHlmUFc1ZGplcU55czBkb05WWW0vSHBhK0owdnRydjVjNGNYNVo4V1R2?=
 =?utf-8?B?YWdtUjQzZjIvVE9xbUNEMGRoeUxnS0VsVTdMTlFCUk1iUm81bWEwT0VTbHB3?=
 =?utf-8?B?aHhpdUhIS3NIMXZpMUJtUHZ6cGUzYUlyZ0F6aG93eHBocmtxUG91ZGthL1Fv?=
 =?utf-8?B?bExzWXpiNzhMTFJBYXllWXRJK3ZJYVFlT0svUFdXYVg1OHlWVk8rdHVKTlpj?=
 =?utf-8?Q?wGOYZZAirrnjVnel9upFcMpXdVh8za3LNiLgq2CUQ1YWS?=
X-MS-Exchange-AntiSpam-MessageData-1: Sp8zORDzdCuu0rAclN3MDx/de2ZFJUiX0IQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9296cf-da68-4ea2-7d27-08de8f1c95f3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 11:56:47.2740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1VMimtFjvP+pwswsWh+1n3pWSf5pucd4hhh8WxD1Tuqj4hAmmZ6Ydl4kZsUgYzQKS7Ip6sBi3aOR3bXI0pbE9D0wXUScMF29qlq3nd7zePk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6994
X-purgate-ID: tlsNG-c201ff/1774958211-200AA488-794D974E/0/0
X-purgate-type: clean
X-purgate-size: 621
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:Mykyta_Poturai@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BC59C3692F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31/03/2026 10:59 am, Jan Beulich wrote:
> On 09.03.2026 12:08, Mykyta Poturai wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -454,6 +454,14 @@ static int vcpu_teardown(struct vcpu *v)
>>   */
>>  static void vcpu_destroy(struct vcpu *v)
>>  {
>> +#ifdef CONFIG_HAS_VPCI
>> +    int i;
> Nit: No plain int please when ...
>
>> +    for ( i = 0; i < ARRAY_SIZE(v->vpci.bar_mem); i++ )
> ... its values are only ever non-negative. (Applies elsewhere as well.)

Furthermore, please use `for ( unsigned int i = ...`

That avoids needing to play weird scope games for i.

~Andrew

