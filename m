Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cuD5L26GRmpvXwsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 17:40:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1094A6F9899
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 17:40:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="G8E/OPY/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1352084.1609007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfJWI-0005OV-9P; Thu, 02 Jul 2026 15:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352084.1609007; Thu, 02 Jul 2026 15:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfJWI-0005Ll-6E; Thu, 02 Jul 2026 15:40:06 +0000
Received: by outflank-mailman (input) for mailman id 1352084;
 Thu, 02 Jul 2026 15:40:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wfJWG-00059y-Vg
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 15:40:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfJWG-00EVOQ-C2
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 17:40:04 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a46864a-e002-0a2a0a5209dd-0a2a4504b9c0-24
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 17:40:04 +0200
Received: from [52.101.85.64]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a468652-a01d-0a2a45040019-346555404dab-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 17:40:04 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB5683.namprd03.prod.outlook.com (2603:10b6:303:9a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 15:40:00 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 15:40:00 +0000
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
 b=Xq6L0EW8cmNSozruK4Mh4Uif/JXSa7SKtWbaPHgOV7qNl+04iGK0pZK4IZMXViOvw2zMRJzuRikFWLD9tFojkEUF1ReIsDvs0J5LaK8kBDUqs3aYzztXlp5d2VLjFvNk/U8tkE/+6ePEIruXGEOTF9TLSsgho3uYk/q331/V0hZbazLb1jroOBp+R8F1BRuQo1SloXPpq5fAmFHKVYHWd9BUfcm7S1Sjp3Mg1JuXdmdkWwpiWW3oWbfG7VwiOv9gKvNqvKXBTqIXLCSMmwTLTQDbmeMjAqxDf61rodk3pp2higDFt6YQ7ma1TCb8li9G8BLlArfsu5Hafzd24YpkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbowieJOT1/uNI5pXTx+Eiyli8QxGa23XmMOv8oyoDk=;
 b=P8VAt2bbmTCLvzeIFRsujQtLtM68V4L+Z2VqBbfgJUQ1RqhuIucfYrZwcO5mcil1zJamHWQGUowFh84XLxl6uXUAIuJ8oOFSGt3NvusIIBmZQ3MsG89DPdwGYsvyZjI9USVZflBnhQeiDVqJ/Winbvse74wcphrTDq45hjIrLp3EJmUPFCD+pTKrz6gL94ptm4vjyVuXX0mEINJa2wKAUbzujd3VV5mVPzbx/esK02OQOgyUGUk3o0OWIrstdbaLt+hzP8Nzbpezz5hgW/0YQUfQRpZvcGPthg6sUFWVMGZ1POYzU/077veRwzhHCUDydlfTTUVEtZXkLTtxMpE5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbowieJOT1/uNI5pXTx+Eiyli8QxGa23XmMOv8oyoDk=;
 b=G8E/OPY/nvSm+Lk7DKqW4UmeYwZEZ7Py7W+IoBaomcCRBk71eYAaKumRDl92+y1+HE8iShOKWYhKrHpNQoRT7gJgk1KOq8Dm8fUBl2fngEc0s0+uqnEw/awumTJCzvJppb3doPl1GMdhrTx74ytD7I5QefpLrMuJTcKxQqw3M/k=
Date: Thu, 2 Jul 2026 17:39:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22] tools/libfsimage: Remove the XEN_FSIMAGE_FSDIR
 environment variable
Message-ID: <akaGTETSE5m8rXmr@macbook.local>
References: <20260702150301.825883-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260702150301.825883-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MA3P292CA0019.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f1e905f-128a-4f97-f245-08ded8502d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cpz7LV4gsA4vsI8GwrXuWyc3HCESvIheXdm/Gx2QQ5r0yNNrdkdzVmtfKhHj5T0t9lmEHAaGl+yDaIQdafVfcQJtY2IP0zLYviS0vaXDiYYYvL8tg5k03G1yYfWgoB+kVWOf2i1KPoJT3SJF85JE8PwDI6yA6FJZgBo3V3WhyTAjPR/Ai1fBOfk6zneu0T7jXsswNutJwMajgV2AMXa1WdZhhvGWuLE9WuPh+usOOOGCwRUP/qyWKFHYgcjJJOl8meWj+PDPlxcq4HVwlfJrOV4AfVlKTc2jpztylEx0cuKRXj30/EjKw9kByCzmIdF2vnb7DpfS4yrcovY/9Bywyl4OzYeuTGF+J+kuhrEJOFuECYpb/LzLuZSYPOEoMq7dZt18atJHktAllNNnynROK/t6bHuKZZR2kNxxazKMx6myspZlaMKNnbwQb0D1+p63eL2knL4DX9hhlAMeGmTumxHzxDjdeAtj6PD6RyRg2yOQGecMrXFWL4SwJoIMLS4bpa0owSFkBcRmChbu07FxM5ATHbmavUrguldKKt/uiQbLfU9kfHdgfmfWt7Vz1jculttHMQAMT3TBOck+cs5rHrB4Aidlfrrm/Enq72pwtckh/nzsleHlOqMlER9oy8k5S0PqI6cvQrWTDECiWmfQTyaAJo5Yt5EiiF2fYMKgKJU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXB2RVhrNDQ2OXM4em93WGx1VkMxS2svN1RZc3pCSnNsWndWbzEvUWs2akJB?=
 =?utf-8?B?a2ljRDNZR2l0UDRIU3hoOHRtdDhDK1NicW1aNzVKMVluRE5TTFVjc3c4R1Ir?=
 =?utf-8?B?MDJLT3c3Wjd6UTJGZDBWdVBWNy93Z0tQZ0s1Q3hYSFRBK0hreStzS0RSdTg4?=
 =?utf-8?B?T3RhdUZFc00zVUJIWk5kS05WQ0NISFlabVc4YUwxWThQdEJlZ2xaS2pGWTlJ?=
 =?utf-8?B?L2lJaEF6cVhWNkZTa3NRQWVNaWRiTi9zV0xSMG52RnkweGM0QXl1V3owRW55?=
 =?utf-8?B?cDFreDhVS2ZYK2hseHFQeGFVbUFpWVVYeUxzQm53SE54ZHkyVTlqOEg1RXdH?=
 =?utf-8?B?QXpyWHc3bE5EVEZWcG1UUkJ5UXVKeldIckFJSTJjVjlXNTdGdXBmY2tVcEFR?=
 =?utf-8?B?ck85RE96M2Rtb1RqR0hiNktPQWFoaVFSMUNwQVN1Q3RhazA2My82LzZ0bDJi?=
 =?utf-8?B?cnYzS2pMOWFrRWdFUk4wbTNLbVl2NFE3UDVCWnA3cDRYWEpid250a3RONHBG?=
 =?utf-8?B?WGV2NTh4THd2cE9hWDdNRG5RRkZ2Zi9kdkFVMWQyTzh1MzRQeGY1ZUo5NXgv?=
 =?utf-8?B?ODNDaVFOQnNNei9MK0MxUW9QYlg5SkUrRTUxSk9pZnVWYTRNamNZQ2pvblhW?=
 =?utf-8?B?L3ZxZjZuR0tMbHlMNUVFYlFmM2MzRkpBaU5hUzZycTg5SzdUalR0dE1kRTJt?=
 =?utf-8?B?Y0FUdForTnpSY0YyZkVRVTBhZWJsdWNxL25kOXNUZUQ2RW1rWmtkZUZycEdn?=
 =?utf-8?B?UWpuaVRyWDRvcTVOTHZzdXFzMStueDY5ZDVaV1RpUFZVVEVFS2lXS0p5eEtu?=
 =?utf-8?B?ZE9CelYzS2xQeEVSa0xiUDZHUGt5VzNteFVoS0wrZStCVVNoQWZwYWFtV1Ry?=
 =?utf-8?B?dUxsMktlMzBNYWdSbGxEakJ4dGpWNnprUXZBdEFaNEtSQ1BuR0hvRHF0TGYz?=
 =?utf-8?B?UmFna1dFeTRZTHJvdlJOanVFTWZQM215N3lYRWRUN05CMGpsT2V0YmlzRE5D?=
 =?utf-8?B?NXM3cGpmR1RGZlZCUXZoSTFndkgrRW56TkpRUVBhLzBNK3pUbSsxMUIyVXhF?=
 =?utf-8?B?bTdZRzVETm4xK3ppcVNuK3lCRU4xM0FzbytGcWx4TTZydUU3OEZQU2FVbVRD?=
 =?utf-8?B?T1Z3OC9INnN0d2t5cWk4cWFIUGdHMmdJQkp0Q09uOEhWNDIrVWduSWJUS0U0?=
 =?utf-8?B?dWN0RXRpZHphdXduYmduN3BhWWUzSXN5a0dMWjBGelk2Y0RCOEpQL3BNOTZw?=
 =?utf-8?B?UnN3Mnl3OWZvNzU3eXZUdWtTeGpTQ0pTcHJoaFRFMWpZemNEQXNGNFFvSTFW?=
 =?utf-8?B?SlZsVWRlckxrTERVNGRrMjJwTUpSUnRma3M2czFWOG5aSUtZZ2RHMU14WHlU?=
 =?utf-8?B?NkpBMFVaRU1sYjJEWHVSU09iWnJlSUNnekJwRDJFTDdCdjI5M0poUmtNY0hU?=
 =?utf-8?B?aEcvRTFjZ3BSRFNPL0tEQ084azhJQmhCRlc3NjIwdlZEY0dnVytsM291ZzQr?=
 =?utf-8?B?WlJsOGxVdWczMCsrczRuZWo0T2dqVi9jNjhDZFdRaDliQTFLVTV3NnFubTVo?=
 =?utf-8?B?SXBaUzUzWk1uSjB5TWNCQ1JxSnB5OHkyNUdiYmlGbndJMXJlRy80c2F0T1NK?=
 =?utf-8?B?aHRUdVJCUERDUzJnek1wY0gzekpTRG13ZmYxS2NFMW5FVHIxQnNZV09lZ1dQ?=
 =?utf-8?B?VHFiczV5LzlhODBQc0lpOWhlemNTbHNIV0R2SS9rMmlUK2VQejhWNUx3VVlW?=
 =?utf-8?B?RzdoYXk3NGM0UzhDU2tMNVVnOEdMZC9La2NrZWYrbUU5TUVXNVdKZlJMdUhj?=
 =?utf-8?B?aisyaWp4cGdRU2tuUHp1TjFnb2JNeXJLRGZhTWl0OCtEU09hb0tmaU1SVlhF?=
 =?utf-8?B?WWpJM2cyOWd6Y0w2SjhPc0xXMzVPUjNiN1o5MXdnYWRLR3FoUUN2akF1ditB?=
 =?utf-8?B?MGxVOGtxbTVSQlB2ZEV2VkFTU0tjZFNsRW5ta053OGdaZ085UGFhN24zQTJq?=
 =?utf-8?B?R0F4MDYwaFM1bHlMOEJCQUhTYWJzQXVIL1BnZG0vM2RwQlBvdk05UG5LdHpI?=
 =?utf-8?B?TnBQZGtTa1Flczk0eVFKbGl1RndpUlorWmsrVmRYVzZEdldlekV3K25JdU5Z?=
 =?utf-8?B?QjdvNWtGbHJZZUt2Z3NKRWxNL0duTnNSc1h0ckkvajFsV2NWTUJad2graGNW?=
 =?utf-8?B?NHMybXBPMlc3dHllalBGR2tnQmJmK0ptU1QwRnBLMTFKVWN5ZnF2aDBRMnBG?=
 =?utf-8?B?LzN3Tk1SZDlsREhkWVUvbUZBYlByS1kwRUkvMDl3cG83Z3M3QUR2REZYaTRO?=
 =?utf-8?B?c2tIbGFlTWdrTStmTVFrWVFFQnRxNVcwNCtCOWZIUFJ6WW8zYVVCdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f1e905f-128a-4f97-f245-08ded8502d2f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 15:40:00.3295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwXtM/J1fafZHNTJGn7P1eSZOCRqcEFNBIGs7l3Klvxl9QEW8rAkGzgYXFNQWWZozS+x9i6wv0l10zsSJ7j2FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5683
X-purgate-ID: tlsNG-ebf023/1783006804-AF32F1CC-61F768F0/0/0
X-purgate-type: clean
X-purgate-size: 570
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,vates.tech,amd.com,suse.com,xen.org,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,macbook.local:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1094A6F9899

On Thu, Jul 02, 2026 at 04:03:01PM +0100, Andrew Cooper wrote:
> This was reported to the security team, demonstrating that code execution
> could be achieved, but without a demonstration of a priviliege boundary being
> bypassed.
> 
> Still, it's a high risk path with no obvious evidence of having been used even
> for debugging, so remove the environment variable and use the build time
> $(libdir)/xenfsimage path only.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

