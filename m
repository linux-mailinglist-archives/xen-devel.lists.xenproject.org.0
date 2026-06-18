Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CJmsMZYuNGpQQwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 19:44:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3A96A1FCE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 19:44:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=IZ0MIjAt;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341528.1601920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waGmt-0007Li-Cl; Thu, 18 Jun 2026 17:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341528.1601920; Thu, 18 Jun 2026 17:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waGmt-0007Iz-9y; Thu, 18 Jun 2026 17:44:23 +0000
Received: by outflank-mailman (input) for mailman id 1341528;
 Thu, 18 Jun 2026 17:44:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waGmr-0007Hl-4s
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 17:44:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waGmq-00FSDj-Hj
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 19:44:20 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a342e59-5cb7-0a2a0a5109dd-0a2a4501b392-30
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 19:44:20 +0200
Received: from [40.93.198.26]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a342e72-e031-0a2a45010019-285dc61a09d3-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 19:44:20 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6915.namprd03.prod.outlook.com (2603:10b6:510:169::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 18 Jun
 2026 17:44:16 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 17:44:16 +0000
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
 b=zQ0kQ+YzP+EJQoUptKn4coJkyniQiBmulbJ9dnfNeqTcn3TiusrZ7BE/KCLjRCGGm0uRM+gSJ7g2oFY4JbR03ar+ZaRNWndX+1+0OsGo7m2K8csJxpI9fu39I9j1PKNpSsRYpqdEoLUGvJ0WqZa3usJIeX3oVw9taLqCM9xwbVcYCxXH2QNKH39as/G4Y01E3wUZqTgz5bvEyGfMOnsRERzNhf0UVNvi/YxbIbDpkRdn0ByiNkdk0F+B90RMxA7pz4+uwyLsCTl17Vh/+MAS4gHZq2lfznpd79ck22la83Fg6EJiBbFvr7MJpo0Tuej6bDmDmCGx8CEAdfMYPQPnIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frraLzGkQwg+4my/9UuFpzqGox4w5t0oOLozoaXxk+s=;
 b=h9F8ygsrEeQcwlbniemBjLtcixW1hQgAzFfMLgTf8Lpl+RgUo4qCP3n29MXcKyBVGMyelr8fUvw2CMVAj3HvQX3fW29oN06J3vmfGWO/Zc7w2s4FYp2koz6F8UlAOVpBgzlAclUzNWVCNYg0D4Q6idMLWc6Hbf12HGiGPTiGYf5S7VCb0Wh+BCo4YOSqFT4SZ8ywAjUkzJL7TGJ3Z4f+aTAGvqrv6ZTim70CKf3zw5A7nLMIe2/xZBkgyTueJ5IrLYVkCdUpCssEDW84VmElLuxe8zuW+usBc9AZPcgAsESABK2rzptNDZ79KLAtazf5IFzpbTsI2s3WVGuSsdeB7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frraLzGkQwg+4my/9UuFpzqGox4w5t0oOLozoaXxk+s=;
 b=IZ0MIjAtN8wulp25Rz+RS+yTHEAQ8g0pQnNKpFWdnkrAdGMmqlxvyY/uLb7YUgBWmlQM4iVyXyGKMaa4GWsZcIjg3/QODqNBZXctnPZ3LITTpiuAJGrErMktWbCvoI2m7RqpBV7JOSE0i+qS4s29EefcbDOLEx5ce5jBIYYNMuU=
Message-ID: <9dc3e33b-d2a9-4383-bd12-a46e8e9b1b85@citrix.com>
Date: Thu, 18 Jun 2026 18:44:12 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 03/15] pci: Use pci_sbdf_t in pci_device_detect()
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794552.8631fc262581453bbf619ec5b2062170.19edb3b3983000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1781794552.8631fc262581453bbf619ec5b2062170.19edb3b3983000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0236.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 613d9891-15da-451f-cbe8-08decd61378e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1UM6gB3NDRfrzfxmsRdNTKVM+L9S8bEnnQ8pBQyAk2zfBjM9wnt8vT7vZMctF5cZYwbxSc6P5gpNYsXB71KCPpprJ44bz5Ge1DXyl06fVzF2nQW60KcjFXuLmbQRgpqQEJ07qR+KSEm8rpqplbX4JVErkULLDWOCPm6LYOVjA87i1+eF65ab8ewgM9FQEAt/x3KWgHKKhkLjPCj1GOMT1OsR+c1l6etYZX5kSE47sPWXhBSLOGhr3PNaNeFjS0MYjQCqAOMOuMFrYGcQrlUQvOtYeUm0AK8vnMwmst/b5RMJ+uOXP7zF7Cnk60aALQlHj9Q7VWIfVgIsEnOypBcO6Wc1DXc3FuLAyiQ8LFzM428LEny+lgfHXmDlc94pFwJXGAtBs8POzUeiCBv8qWWcm35rNmQbrbsLhIhBosdkiej2g3niMTFav4s1vFA8eSAuNZivZiwT7O+QBqU0hlz41r439PSnydDsJe2eVJBjyHDyV4kIgxWhpyywwVBSaP7JnX6D6I3aT3m1+R0/QnHB/hdZkV7UsFfXJet49g93jR4x4NCo0PEhZuBq8fObXR8/DGLrykXt+awbUS5RQjgXVnAkUS4q32llEFjulBbIPddNl6DcPSHL02H1w9KgLdjfx7rnCamX0j//48Hiy54zx2HHUhrb7RCeY225PH8sL6pV/ESPY5ZjBFcFaKHL7jiD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjJOUDMzb1lWcmx2ZzlOZ0hQN0FRY2NGdVoxbktPcHNxTGxrY0lnS245dHRP?=
 =?utf-8?B?VjJObUl3R1Z5RWd6Q3dpSEJubkJHem5pWHc0NWNJQ2h3RGl1cXIxRklZd2dU?=
 =?utf-8?B?dzFTMzNFbjMzWnJSR3prU04wemRYMno4aW9qbzBuYXIycUZ4SWY4MGNFNHRO?=
 =?utf-8?B?ODBBcWNlbkt6ZDJyZ1o3bW1Vc2pXbE1TRVBUeXZPRHR1b3F5aUhOZ0hzUHBo?=
 =?utf-8?B?VnZXc3FrRTJUbkFPR1dkeXhrV2QyWW8rUExZdUxyOVlsVjJkVTBhbFlweG8z?=
 =?utf-8?B?SlR0NTJOckN2ZU1neDNML2RvS1BzL29TMWMzTWtFdlZYTmRQa3Z5bnNnZ3FN?=
 =?utf-8?B?Q3h5YWl5a2pYNWRhanl1YjRhUWErNVBXMjJLRUNvTHFRRXBBVnVrcHhISy9u?=
 =?utf-8?B?Y2xlNVRlYzM5U0tGMGt6SVd5OTVrVWJYcVNZc0VqaVhxdmEweEFITmUydE1V?=
 =?utf-8?B?NElHNE5SeHJwNytSdUdtQW9xY0RlRVQzT21lNk9EWEtPMVlNdFlKbUxzUktO?=
 =?utf-8?B?TTRIVjJiR2I0dHA5bVZBNHRyOWdSc3VWZkJUZUVXRmRkaUFGRTFMS2pURkdI?=
 =?utf-8?B?Tlc0S1oveTdLUjhWVmdWMkdHRGkwUHMvVTdzUlJMRHgvL1FxRk9BVmh1dk9W?=
 =?utf-8?B?RS9LaGNudUhrdExCTWdyZmRSTDBOd09lZlhKdkJzeGZCQnJMeURIeGplZDM1?=
 =?utf-8?B?RW5GKzVNNFVIaCtITXo4dVRza0c4bWFCWG5sY0JOVDg5dFV1ZjRuZ2lVWUYx?=
 =?utf-8?B?eDBLbWFTSjhUcFA5Vk8xMUNtTnduOFFYeHdKZEpMc05kM2JYTjBGaXExajlH?=
 =?utf-8?B?aWVWZWh6S1FnMUFmVjBBbEZTOW5xODVCbFQwK29PRkcrVWQvQk45Z3JKUE80?=
 =?utf-8?B?M3pDZDBZbldCU0pDMjFrZU9kWWIwcEwyTUM0TGxsVEdoRmF3eFRQN3dwSjcr?=
 =?utf-8?B?T0E3ODlpeEsxYTFNZ0x5dXpTR3ZXbCtsYmdWdkkwS1B1aytIRk1qekdXbFB6?=
 =?utf-8?B?Wk1lay9LbmlkZVRNNEVIQXRycHdOdXhyb2JSNi8wWnYzQnJFZ2VRN25SbHAw?=
 =?utf-8?B?NFVLTDFPVVlLL040TXR6eVVqRU5OR0NFNDNJTXFXVEZkRlNPK1NVMVFidG5j?=
 =?utf-8?B?VjNlMkxxaWZpMDJrUDYwSUFCd2E2a1dTU3lpSWVkN2p1VW5INDdKSlplMDY0?=
 =?utf-8?B?NmdqSndIcmNRUFNZdnhXcGx5MDQ1MTVTVnBKZUVGbk52ZnpLQm5WOWJjZ2s2?=
 =?utf-8?B?c2tlWVhJMXpZTWtZbjZ0UHovMjZoY252dElqb29OWTNPZDFwNjB3QlIrTUl5?=
 =?utf-8?B?RHBXbjkvclp2ckRMcENDSzBxRlVSZ21WcUNLUEFJdFU5R01kRmpGeWV4aFl1?=
 =?utf-8?B?ZHd5aFBNaVZoUjhIRDQ4bWhXMUhxWUhFNy9zRDBJZGUxRU5nRXNCdm90b20r?=
 =?utf-8?B?OHF2TjE5a1hiZktUZmc5Q3dkdjY2ZnFXNVZEUjFBZlVaVlovTlo1RDNIRHdn?=
 =?utf-8?B?ek4yMHlhek5HY3FMa0ZobHZSWjBPZHdzWDZ6c2l3c1JXcldUQmtmazk0SE56?=
 =?utf-8?B?OXZUOVREMmE5YUJpbjhHS0pHYlNKaTI0bVJUUG4xS2VRVk5tckxZVUFraE9C?=
 =?utf-8?B?Q3pWZ285UUFCaUVzQ091OFVRY2hHNmJaM0p5a2Y3R0hLbGR6NmNxNzNmcUVh?=
 =?utf-8?B?S2hyUjJJOFJSNm9oKy9pcEkzYUJTaWRSNUVFbVp5NExFK1QvTFJXeTF0UjQ3?=
 =?utf-8?B?YlFMZENIS1FwQmxkeEJiRmw1NmpBbFQ0RVVaWWU4d0srdkxiVFRMcll6aFQ4?=
 =?utf-8?B?WmVWc1d4UEozMzROYnJBbFBudmJZclRHZW5MWTdkakxlNVVHMVJrWEtpMlBx?=
 =?utf-8?B?ZU5UMEV6VkRVNkhNRHhwRzdzMXJHOGtMMXNybHZwcHBocHprSkxHQ3dhR3ha?=
 =?utf-8?B?bVZCNTFyYmZqU2JvZmt2T3VpdU14UTk0UHVzNDFPS1RkNWlreXNBYzA3bFdX?=
 =?utf-8?B?Nm1FVUZlZVlDblRUUC8yQVBTMmptK25mZHRJWU1ST2YyS3dET2dOcnE2Ukht?=
 =?utf-8?B?Y3pkNE9YalBGNEdETktLdUVSakJBNFpaQVNYQnIycjBVejJMNm1ZTm5aclhC?=
 =?utf-8?B?QkFEVVd2TThaM2MrYWZNdnErU3dKbnRUTVhFOTM0U3IySEl4MlVXd1U3UFNQ?=
 =?utf-8?B?V2V1UUlSNkRSd0dvRmkxOWdFT09DQzNpN0tTdHZSbE9xeHNEa1FUUDh0eU0w?=
 =?utf-8?B?VmFzNFI5NGllcFpQZUgzN0JCQ3ZTNWUyRG9COHRXWG1YeWF4aHZNYmJKM0RD?=
 =?utf-8?B?dWxiRXpBY3BKZHVxMytndlpKR3J3eVlxMytoSnJjRUdBdWplWTlZcFI1Z3dG?=
 =?utf-8?Q?YduluoRWDUiocNTQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613d9891-15da-451f-cbe8-08decd61378e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 17:44:16.1742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcsHUgE8ix0XWVTSzj9okxPvpk+5G6OaHv6qjj2ki+KvNZuouu9ZP9Avi2kb/vaygsXEEHLTGXRRF2VHD0QY7S8zHa5m8eS47Gzo72CxV1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6915
X-purgate-ID: tlsNG-d62444/1781804660-4A5AFE30-2D72F32A/0/0
X-purgate-type: clean
X-purgate-size: 2844
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A3A96A1FCE

On 18/06/2026 3:50 pm, Teddy Astie wrote:
> diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
> index a5c79f56fc..27bcff0a8f 100644
> --- a/xen/drivers/char/ehci-dbgp.c
> +++ b/xen/drivers/char/ehci-dbgp.c
> @@ -1510,25 +1508,24 @@ void __init ehci_dbgp_init(void)
>      }
>      else if ( strncmp(opt_dbgp + 4, "@pci", 4) == 0 )
>      {
> -        unsigned int bus, slot, func;
> +        pci_sbdf_t sbdf = PCI_SBDF(0, 0, 0, 0);

Elsewhere you don't initialise sbdf, which should be fine here too.

If you do need to initialise it to all zeroes, use = {}; instead, which
is shorter.

>  
> -        e = parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
> +        e = parse_pci_sbdf(opt_dbgp + 8, &sbdf);
>          if ( !e || *e )
>              return;
>  
> -        dbgp->bus = bus;
> -        dbgp->slot = slot;
> -        dbgp->func = func;
> +        dbgp->bus = sbdf.bus;
> +        dbgp->slot = sbdf.dev;
> +        dbgp->func = sbdf.fn;
>  
> -        if ( !pci_device_detect(0, bus, slot, func) )
> +        if ( !pci_device_detect(sbdf) )
>              return;

Looking at both this patch and the next one, and despite what I said in
patch 2, I'm going to recommend separating the pci_device_detect() parts.

This patch has two separate changes going on; converting
pci_device_detect(), and using parse_pci_sbdf() in some places, while
patch 4 has some simple conversions to parse_pci_sbdf().

Break pci_device_detect() out on it's own.  Trivial caller adjustments
(e.g. acpi_parse_one_drhd(), register_one_satc(), even
_scan_pci_devices()) are fine to stay with that, but for non-trivial
ones (e.g. acpi_parse_dev_scope(), ehci_dbgp_init()), just wrap the
caller with PCI_SBDF(...) in the interim.

Then, you want a patch for acpi_parse_dev_scope(), and a separate patch
for the work in ehci-dbgp.c.

It makes the series longer but the result is easier to review because
the patches are doing fewer things at once.

> diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
> index 71e5a51a58..61269c7e0d 100644
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -1185,8 +1177,9 @@ int cf_check intel_iommu_get_reserved_device_memory(
>  static int __init cf_check parse_rmrr_param(const char *str)
>  {
>      const char *s = str, *cur, *stmp;
> -    unsigned int seg, bus, dev, func, dev_count;
> +    unsigned int dev_count;
>      unsigned long start, end;
> +    pci_sbdf_t sbdf;
>  
>      do {
>          if ( nr_rmrr >= MAX_USER_RMRR )

You're missing a hunk here, and it doesn't compile.  You've changed the
variables, but not changed the parse_pci_seg() call.

They look like they're in patch 4, which I presume is just a rebasing error?

~Andrew

