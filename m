Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H9rLAkzrHmpgZAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 16:40:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1758462F5C5
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 16:40:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=snGSYS04;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325100.1590638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQHR-00016J-2w; Tue, 02 Jun 2026 14:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325100.1590638; Tue, 02 Jun 2026 14:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQHR-00013h-06; Tue, 02 Jun 2026 14:39:45 +0000
Received: by outflank-mailman (input) for mailman id 1325100;
 Tue, 02 Jun 2026 14:39:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wUQHP-00013b-Bu
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:39:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUQHO-008YOR-OQ
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 16:39:42 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1eeb1c-e002-0a2a0a5209dd-0a2a450597ac-24
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 16:39:42 +0200
Received: from [52.101.56.33]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1eeb2d-aaa8-0a2a45050019-346538211c64-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 16:39:42 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5103.namprd03.prod.outlook.com (2603:10b6:208:1aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 14:39:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 14:39:37 +0000
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
 b=Bp3KBzWjIT0TIgXloK3/evRsHet7Uzw1bZLDE3i4ky6q6ri1wy71MyCRSXv7/xC2To74ihgogVGI2iS6BZZOHIB5Gzrgy0cIU9sHVLXhKgTCPIG1SyStnOd6wyGERroEHzMD1GIMxEK8luEZnX4MuZpEo2LROVsro0Ffi4O5sxUd4F9gkOaHlN4ssJV6QwBAfMkg38oTP2Ing6YLZWEkjgqBu0TjUgThSpuxCmzypiM5sjznU4ATPQqPq0+cSIeOelNobBWj7wOJib72Eq/hByBqs9rsCq3hSvzu29A8swPc+nd1NjPUUTHzCZNvtHinvetttEBgbKVcGvIbAbvSRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmriJwyY8xZ1990KZgCi+g3222bhSkdhE48OsmhTgWw=;
 b=pn3vLvll4QjEKdK9Y1zttp3/3JrLHO5VGbCVDrpisKajkDWvd6EGUwp813xU1EuyaonMQ23NV7Q2E6ZBJzV5nRa4UhYett4pzeGGxvrI5I+4RjgiEUmNzUebtq2Vj7jWYyqyyTJevNfYs8veuCVEVCK+ePTGb+yo/UxvR9g9kWFPWc1UoUjc1viBjWwODF2n4XwnpOJgFDHoUv1GQ6eUa+xYIJdNAkkIwOtMAX7vPDU2EhwpWChLVc7WHo8RhLY9NCkkO+Mt/WuwUKRAjNXEhiNBvbwnZXrWrL1UlK/mW8+Kketjqlwg8oplQVqa9B4fZ+TBV1ZFOXKP0Bm3JUserQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmriJwyY8xZ1990KZgCi+g3222bhSkdhE48OsmhTgWw=;
 b=snGSYS04kzkitVUmfBbGZHyTGI77gOWbNG+qBudHCjIeIVYwowI54QcoOI/OX48TQgMFlNf4wRAUGGFa8eqlyM1pvtanbVL2dq34O+gNXcPSEPoXkSXCA4nLTAXxjfojGSidySVvwf500Cz1b9oMCvy4ClWt6XWjqA9fpckZMZA=
Message-ID: <0cd7a0e5-81f1-427a-9219-5d0eaa3e6cda@citrix.com>
Date: Tue, 2 Jun 2026 15:39:33 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3] x86/PV: drop a local variable from
 pv_emulate_gate_op()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a8a84f5b-05b9-4038-807c-8151cc705583@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a8a84f5b-05b9-4038-807c-8151cc705583@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0690.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5103:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8c317e-0f7e-4bbc-3707-08dec0b4c579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	r9OKRyAkKiKe7xaH5k8Bwl6BhLyEAf2tjuOPSPA2CLvmWSddGSwzraGRL0Qm81ebNzJndQefnWycd7qKoraRzs6LyZfbO8GtV9lTRu6B5GS5AVOGysDa0KIQkD+j8S9MMBh5YwxdPXA/IRJwf4Y4RBHMteDDFsakFR0/jufP0KouS6XJWvpRSSrxbBLQSJUhsHDc9mbqanm4+kc7zCeuwCa87iRkOBOcYVWd0uOEiIinUHAsr5KXDHk5a4CoVp2VPCq8bopOFJfltvjedwYWcWApzjuVV130lBtNp0AVIyzDR3bfvOhfjYCnasD1Q3ScPIs+2DR7pbgVPd/qZ4mGXx31VDMrATpLJZ6y3A7hSaFp5piQH17m8VbSYemhW8IPWuOSR8JxQh5bes9QP3ThhJWThvXWAd/gK54fT53a8xYCWKL65dPrGDmzn6TA9zVtELjeiyz4gLvJetiE3ZiVLCFvB39vRmDvhnHpMHobkdkInNQ4Q4TcBeryWwTL7l4OGpFMJ0fPI+nPHtZo0Jgi7BdmozDWVa5M5PI345w0HqwY2jlxYLVI7Xov0V45L658j1JfnLOEHZuVI6+3lKG1SUWDm0Ce2E9JJv6Ib+RDh+jbTe06luGuAMc7dR1+DSJL4Jx7TjrEgHI9OaH2VT9VOghUUL01p2w/Tft6/qHnpwzK4mnfyk+AzORWl/wP1Z3o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzVZZzNVdVZOSzdTcDNrUlBRQlh3VkF1eStQNXZkNS8zYVI4czhld2ZlT3dD?=
 =?utf-8?B?UGV0SUxNWkJPMkxVRjJRaTdOZEx5OVFyS0JRSEJMT29xMXE1VFV4YnNGZmdo?=
 =?utf-8?B?dnkvSTd5MUdqTmpnLzVqbnR0NlZpQi9nUUxWMzd0MGYyRzg3ZVlqaUNKUnR6?=
 =?utf-8?B?TVhhcGFXRWdzeFdpaENhWFA1QXNxajBUK3lsQUI2UDhhdWtxOEZXa2FJeW9o?=
 =?utf-8?B?ZUI4bGg5d0M3U1ZwVGZ0bThzY2kxS2hDeDhKOFl4TE5GWDA5UjJaYnBTSVRj?=
 =?utf-8?B?MlBBYjA0aWM3SzJSb1kxNDJKL1FxemtMMDJKS01UclpFRzgyb24zUEZ0cGxK?=
 =?utf-8?B?c3dkU1BkOXg4UHJNeUJlekpCSUdiS0FXdU52QUlNMUJtcnpyclNjRkI3SzRx?=
 =?utf-8?B?c3RuNFV4UHFFb0ZnajZuSzRsL0QwbGQ3YU56VWNndm5KUitCTjdkL3FjUm5N?=
 =?utf-8?B?OHVTQkpYRXZZSVZIdDRsQVB5TDNQeTJSclRncXA1U1k5RWVEWjVUVUQrTUpk?=
 =?utf-8?B?NmdZSWwvQmVxdmtPRGltSE1TeDUvUlMreitES21Ca2NUbG8zVzN4UlNwK2Yz?=
 =?utf-8?B?OEdURU5qSzUwcjRvR0xIcTl1UmtyNWpYaHV1OW5uSUlRek9sQ01SUTBuYjRJ?=
 =?utf-8?B?UUxvZ3hiU1RHWTVicGlOUlBuVzFJOStMdmhYUjBKQXBOdkg1TkVFSE45Z29j?=
 =?utf-8?B?RlNreUFTYlNJdmloazB4VFNTNEtiQ0NycTk0cGNxNXZiVDZMdHJJeGE4dkRx?=
 =?utf-8?B?VFlHV1ZRMDBsT0FleERIL29jYkZPTTRFRFZvTlRDVGthTVQ0aDZDNE9CVUR4?=
 =?utf-8?B?ZzZJZklJcVkrdWlseG9TZEp6T1kxdGhzUnBRTWdOOFRnK2xuNnNEYis5RU14?=
 =?utf-8?B?aW1hUktYdlVDdE5KSEtaQW5vMlJNK2ZzSnZpeCs3dExsSStNd2ZuSWIzUEV6?=
 =?utf-8?B?MHBFTzJWdmJmTmd6L2xSYlVNUVhEd21MRUVnanJCSHBPWktnUit2dmg2OWww?=
 =?utf-8?B?YXVlbjI5ZHNnVWhRczZIQkdCY0Z0bnlFNkQwUklkbkdodXZ4VW5mdlZ4dEJj?=
 =?utf-8?B?Y1ZVaERrMGNUZG1rMGxPNEliYXJBcmlYYXdaU0haeUdOWDEyU3E5NnN4c0ox?=
 =?utf-8?B?WGk0WGI3RXd3U3ZxaUdHdjhFVkxhWVNGVXNpTkJ1SERUaEFoaVhwQStMM0JR?=
 =?utf-8?B?Q3ZMV0trZnh2c1RnU3BiTElWNWEyV2RaMjVJT2NkUXFCK09LQktBTFJtZnh1?=
 =?utf-8?B?b2xpNWpNcnIzZFNTWGRBdHJkdXE1OUU0djJtZTRvRVRPakVYQUMzTGJwZEFh?=
 =?utf-8?B?L2lLYWl2UWNSTHVCZTU3OGRDcUFuRlpvRFNYWStMZWJ5dmpPSEMzVmtHTkc4?=
 =?utf-8?B?dG5nbkFhTXdQYUVrQkxSVjN4MVBvcjJYa2tUR0hZY1F6OGlXaEJnd2dKcE9k?=
 =?utf-8?B?SDBna0xiVWtBTjJQTFVNU0t5N2VHODdtcDJlV1p1b1JRY2RLd3VTU0lPRFlX?=
 =?utf-8?B?SmtvaVFERlNFSVozWEFYV3loSFpRWWZlakNKSTJZcFZKdTJTYlpzRkRiNHRu?=
 =?utf-8?B?VFVVREJKM0h5TnpiV05KVXBHYk93WmYrZ093OHlGalY4dXNhazdBUmJQL2pP?=
 =?utf-8?B?ZG5ablE3dXpPdm8yLysxbFBreW8yQWFEYWQ5d1EzSFQ1Tkp1TEFOcFE2Umhv?=
 =?utf-8?B?Yjg3Uzgwc2NHR3Bka2tmR0QyZkhTUFBGcStDbWNCM25TdVhhaWRIYWlJSnRN?=
 =?utf-8?B?S05xb2pVZFhxL2lWUmRnVHRtWUpHQVA0MXZTYjFyVlZsaEJaWUNmTVcvQ3BY?=
 =?utf-8?B?STBHYXpNSXhaQzdOS01VR3BoeEkzK1pGMStzV3pqakIyNkFaWEJBc01VbUV1?=
 =?utf-8?B?Z1ZUM3dWZ2tSOHBMQ05ZRmJQR0gwZitQTWJCSm1vMWRML1ZaRVlObVdVaWo3?=
 =?utf-8?B?Wnh2UklldHJvcEdrTDliMUNSc0NRb2VsUTlnSmkwV20rOW1oa3h6QWE4TTA4?=
 =?utf-8?B?NGZuNFpSVG9OTEhHdFo2Z3FneTJhZ2IwVUEvK3RwVW9MOGs0OE1LMzY3M0Vq?=
 =?utf-8?B?MFhlVXV0Z0xGZzNyU2YvY0ZqSGtuMmhrcWl3WE1GbldBZWdzQUhOTUNoUUNK?=
 =?utf-8?B?WTdvLzdrRlpjOGFoUGYrWCtrWXV0Ry9TL2pFKzlsanRwQm5UR3lhRkZKUHVJ?=
 =?utf-8?B?WUh1ZlVzKzVoTEhxUkU0QzI2L2Jxei9NSTlZWXJld2Y3bHlQNVBubDYxUTdF?=
 =?utf-8?B?MGs3c1RqaTh5eDZqOTVvWlVoTTJSNDcvQmIyd0RwQTRyb2h1cDlxMU44ZkU4?=
 =?utf-8?B?dURRRTA4WmZVbzd2eEVNUFJ0MmpoUC83Wk0xdEM0RHhMbUgweFJpZS8ycDJ0?=
 =?utf-8?Q?oyTD1LCry7bAefBQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8c317e-0f7e-4bbc-3707-08dec0b4c579
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 14:39:37.3888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJKu4tSt0SAsppk16xDYkkgmCoCpjCzuBbPPpJIU2W8y+PtPRhTCTC/2M0SEGfFpKieVy1WGeqIrh5V9BEmceu8XcoqeYadO4uv+bKDr5cU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5103
X-purgate-ID: tlsNG-c201ff/1780411182-D9772443-0AC821A8/0/0
X-purgate-type: clean
X-purgate-size: 471
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,bugseng.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1758462F5C5

On 02/06/2026 2:52 pm, Jan Beulich wrote:
> The inner "rc" shadows the function scope one, thus violating Misra C:2012
> rule 5.3 ("An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"). Drop the inner variable, as
> there's no other (later) use of the value it holds.
>
> No difference in generated code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

