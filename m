Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OuYIbCY+Wmo+AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 09:13:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF494C7AE1
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 09:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300230.1574758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wK9xx-0004MA-J8; Tue, 05 May 2026 07:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300230.1574758; Tue, 05 May 2026 07:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wK9xx-0004Jx-G2; Tue, 05 May 2026 07:13:13 +0000
Received: by outflank-mailman (input) for mailman id 1300230;
 Tue, 05 May 2026 07:13:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wK9xw-0004Jr-Rf
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 07:13:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wK9xv-004oYC-Lh
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 09:13:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f99886-e002-0a2a0a5209dd-0a2a4502c106-4
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 09:13:11 +0200
Received: from [40.107.208.61]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f99885-af86-0a2a45020019-286bd03d6d90-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 09:13:11 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB5752.namprd03.prod.outlook.com (2603:10b6:510:36::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 07:13:07 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 07:13:07 +0000
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
 b=d9tPYAqimQSJIyPCJGvZ5liD+68yhqk/RtsxgcyOffrwFU0zojyJE1+xZguNmI/Up9UnuVzAxL9m70mw7SEfgwd59PYo7igWW4u4uOZ7Rl6eA+S1QHJ3n7SQBp8+VaMgGoxzqN1Ay7lAJXXfr9V58CmAPP4XHNufw3l1m7qNEhYT/1R+w8zGx97QXU9Q/dpKI3QRvYvNYKodlhaQ9qZWAbJZeLL3NeqJcO9p2EtxoQuc3h6F2ayhJojjSIBRehReJotzVDVUtxqvR4ImUPPrD5JfOqlt61Ap33YUEim6Ut7iz5qHPR8dUTHdza8VlsTEa4vGvMbBz1P2IoyqSEUAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+AV+3QmT/PFKL1SK27tSCTKbimpMTh3lGCPVS+KyJU=;
 b=mPv4nHiNyrzjFopRdfG0/mJVGc9BtJwmTiU7Gyacg6bBBZjQj47DBl3iVWCj0n1Z9+f2X4KtSg2urxPImbM9gYQ0pUrU0ymbd4/+NrB+2SP6VzPx3CIJPU/BwnFgYG6+KwrKHlRQEstlBywdiwkt10pDy2m+o0+6MfDlxgm53p3Yd/qanB5xdqxjlcJzrDDfeiLowEDUoFh0UuBj4FLkufmYLOECfgz3NhTd7HubKv6nztBdLsnLkQSvcOHseaX/ZNeJm9XktEA6Z9019XY01yeyu8LKdSX/jglryixL44BDbUW63grIrki0GvZj9oLSRAJ3ROmzZxIYS4a9K3YYGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+AV+3QmT/PFKL1SK27tSCTKbimpMTh3lGCPVS+KyJU=;
 b=gzE6ckc9wbBAnp77YUefY5Fx2AQYi/N5s0+eMq+01R+sN8mOk9xuOwWCabxq0+4C6QNrUc0ldPlUsXHhjW5epVsmwfEbXdAeeFmzkKT/+sm3LD9rbByEwW2gQ+lelmwM3tH4SWYGDqR+oS5sI9RIPB2n5qeYazApuLxz/HHgPPQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 5 May 2026 09:13:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
Message-ID: <afmYf-ldUxWQXRDL@macbook.local>
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-2-michal.orzel@amd.com>
 <afi7HUFoDYabM9VV@macbook.local>
 <65ecf1c0-0844-4ba9-a250-a94aeaf4d251@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65ecf1c0-0844-4ba9-a250-a94aeaf4d251@amd.com>
X-ClientProxiedBy: MA3P292CA0014.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB5752:EE_
X-MS-Office365-Filtering-Correlation-Id: 112036f2-ac58-4d03-395e-08deaa75c191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XGe7eV4k4k/7hQ/YEf152hQQKbl54Cy9ElmU/nInFuNuFJfwJoHbokwIaljwB2VpdIDA+5iZkpqAo4yhwQauuogmW6qCTuuDoQRgPqCW4FZUnFIq8vmK4CXlIG5Az8SLZ3msDvNk4nJXvbnch3ijfFoArzmHzzL9tJOXZ9FKtz4Hl50TrzdhzUUFJgt7ex2uwCOvE0zt8KYm++a1PXpWHIAe0wp/uzUdbUoI5/EwhwePVtemWuQoICMy9u1dM56pwefTBBwshlnnDOl33d5Pu/wKrJJ1sg5w4R4OSSdrmdhNDUvnZm3KUNsLfY4tJBCv2Uuf5ipIrVvWpzSmxOszCimNY9syGKsRjt05WLij5rhZEm3utEq34WmG6qRArha8OSlEdAXAMUy9X1DdMHc7OKyTtQMhdRBkLUVjO0SmOX614Ni8oQPdk9RbIDCBjePFEXc631E/k9v7roHNdgOOiItRjod/BF5JXzN86SBdczJ994p5vPFgli1paa25fGHJyy/5nPMUGtgfjt8qmn3bsMW1R3qS+3dEnUvPFj1mh/S7oJ0ItdefJKjvy3fpgUbpjskIbFC9m5UdUGT7/uR/9GA/NwtnkR5OYGvijkQFh7gUY4qhxHNj0p6wO18rnqGDRAaiceAmbqhK4+3f2OSvD1mDVnGdLBakXvoiWMldYpW3/dhwwwCmwzsf1mENN7iW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUJLWk9UYmd0TXEvRW9tQ2l0Q1pHaWNRUXhCQkhmMzFtYXd5OGN2MStKMkYr?=
 =?utf-8?B?WW53NXFRcGJsaThjSVJUSEpmVUVVZzVoZkw0Vk1ZNXI0R2dQTzVYVGFQRk1y?=
 =?utf-8?B?cUZJYS85V3pjMlh6bFlEbEh6RVYydnZtNFN2TjgyOEtFdjRQK2ZiallhUUl2?=
 =?utf-8?B?eCs5L0Z1aWdPelZIdDZoUmJqN0xTOG4wQzhVZmZrbjBiUFJoRjdKN3lSZ2px?=
 =?utf-8?B?cGhtY2RlaUY2QUZqRVhCa1cydUFjMXo2R1piUHA3TnJhb0xBQ2NRUWwzN05B?=
 =?utf-8?B?bVMrRlVlSTNmSjlYbkxQbmtnU3psYnIxOXk1THRhN3VET1NjY0VhUVd0Szda?=
 =?utf-8?B?b2E3WUlyRWl0QmxYdFNnWnF4eUE3bisvbzREK2dFWGJQU2ZqeFV6N2ROdi9v?=
 =?utf-8?B?WFh3UDc1RWhMdE1MaTZqVHEvRlU0N3NScWNhbmF0dVQ3ditEeTJ2KzNLZW1U?=
 =?utf-8?B?NVVsNUpkcFFoeDBQUGNsc0VLUGpkSnFoc0EzUWF3VTFzdVVZNkNhd3owcXQ4?=
 =?utf-8?B?djJwKytPMzE1bXA1WmVZREduZk03QlpkNlM1SVFVZW5Wei9TSzdZVmNOZWgy?=
 =?utf-8?B?dU9LYU1Fa1ZPTm5TSFZkc0ltSTl3cmFtdGNiZTlFUDdqL1NYQWtiZHZtL2lp?=
 =?utf-8?B?SnV4dzhPcXNpTXg3T0xac1EzSEdiWktXN0RETHZDNGFGUkxZNVpHSVNxVW1H?=
 =?utf-8?B?UHJKYVRoUHdmTjhSNWI3S1EwVjFlSGlsakRqd2Z4dlBaUElSM0Z2RkpsZGVx?=
 =?utf-8?B?L2d3bDVhMDZybUdEY3A4VVg3Y2YyTVlLVUI2S2xqeklEMjIxaFp0UlFtWnNi?=
 =?utf-8?B?K2x6YndzSFIzK3NENTE2MGNOdWNYRGhMUmFzTGtJS1pDZXluc2pVbXAwM3hX?=
 =?utf-8?B?cE84U29TaEJJckpoL2cxWGREMFBJZXE5OVV5dkpubFhYQkdyOHdDVkVWTVJV?=
 =?utf-8?B?cDBIKy9IUHVvWjR1eHd2N1NTUnhVdnpRa1hDWHZPd1pKeGlJVDlEZmNWL1Bw?=
 =?utf-8?B?OUtOMVp5ZllscFVFcnFsM3ZiaWkvSWFiYVphNXRTc3N1cG0rSnZNRmZUcG1F?=
 =?utf-8?B?TXgrd2xJeXRDNzhGTU4wcC9xZTc3VDdheUVPU0dpU1gxbUJEMlBVL3hkUmJG?=
 =?utf-8?B?dlZ4REZBblFEZ0ROSjhpRnM2Z21nb2ZTd0hUT3NuSHVuOGdsMlBFZWFHTzZn?=
 =?utf-8?B?MHZ4QmVseUtiZ2g3L0tRbFNtdlQ4TjZhQjJsR2Q5ZTFkK2ZTenUyVW5GUTRS?=
 =?utf-8?B?Z0JwY0FEc051SC80SjUwQW5jN3JYNTlDeFNQUnZwVUR1T1JMNEdISmk2RGdv?=
 =?utf-8?B?aHN0OWIranMrMzdSSVJzZnJaelhxYjBxWXVBV1pHbU1xajNxVFdVTit2N09D?=
 =?utf-8?B?Y1lUTnQxN3FmT08yZVhkeEZBY3pmMER0Qm9XcWhUSXZ2K1lRZU5pbElmRUsr?=
 =?utf-8?B?aWdiVmVQczFlYU9JNHAzTExTQ0h6aXdFS0ExMlVPRGJ4WFpSSG1VbS91NDZ0?=
 =?utf-8?B?VzgzMGUzQlZ4L2J6WGtET01nSkdHZ2NoWXVSSmltUjcxVzNQUmRrR21lc1g3?=
 =?utf-8?B?b1pDUG4xT0VmdkJFeGlzd29WbFl4bmJLcVVLNStnVHN5b3RRbzd3aXZzdU11?=
 =?utf-8?B?c1RFd3hOZHJzaFR5RCt1cjRTOWswMHcvRTZ1UnFWVVZpTzBQNGplbWN2QVVY?=
 =?utf-8?B?eWRQZUVsdjM2NjZGd2NVelRSa1pKLzJGMnNNZW5Kc2JOdERXUlhVVk9vQU9l?=
 =?utf-8?B?K3ptNk5PL0FmaFc0VTk1b00vR1k2OGlsYkd2eVU2MEIxWGpnSzdCdHplcmho?=
 =?utf-8?B?Z1FxbGcrYVVuUmpEWXVydksva2NIR3RZTjMwdndTc1NjcTJrd1cxdzRpZFF5?=
 =?utf-8?B?NFIyYjk4NldobVlTZ20yR3E5YlpyY29ibE9pOWREeUI5eXdoTXpCUmRjbTBU?=
 =?utf-8?B?bHBNWE1jdGJDaWhPZWZhM2Eyb0E0cVk3cUNhbkxaNzA0WlJjdDg3elliakda?=
 =?utf-8?B?b2tvTFlxRGR6bGt6bm1IMEF1TjBDMkN2Vmh5SzJRdEJMcmZvVys5bzhBR3o3?=
 =?utf-8?B?clJFR1l3WkhqcGw5aVRpdzZqY1hoNUpPVW0vSWVDSkFDZCs4bDhqenBiMlRl?=
 =?utf-8?B?TzNRRUJpNWw2ZVdpMkdhRm9Id1YwaC8zTSs2MXpldGhjWjBWdWlKeW1NZWIx?=
 =?utf-8?B?bEM5WnlaSWFiWWdMQXBxMm94dWFDK1lTWmxLOGw0MWllaUFTWWUxeDc2Y0JS?=
 =?utf-8?B?NlpzM3o3aUJUSW1ZSTFUa2F3UDJCM1ZKc2h0UG8zYmZxYWFmUDlLOU1ReW9M?=
 =?utf-8?B?TTNXVGovcVV1czIra2I5cTFFWGhHWEhhTWsxWmptQzdvQnpWSmxPdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112036f2-ac58-4d03-395e-08deaa75c191
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 07:13:07.0933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h87a38DH2uw52hpMTX7I67I2fvgTric9mRzCLdQ0BUHQSw3mGwYG40vNChTipRjc6KYtGKBQ1Q5eufeK1Bst3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5752
X-purgate-ID: tlsNG-720697/1777965191-B3563161-C92E432A/0/0
X-purgate-type: clean
X-purgate-size: 2527
X-Rspamd-Queue-Id: ECF494C7AE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]

On Tue, May 05, 2026 at 08:48:15AM +0200, Orzel, Michal wrote:
> 
> 
> On 04-May-26 17:28, Roger Pau Monné wrote:
> > On Thu, Apr 30, 2026 at 02:51:02PM +0200, Michal Orzel wrote:
> >> The generic pdx_to_page() and page_to_pdx() macros in xen/pdx.h assume
> >> the frame table starts at PDX 0, which is only true on x86. ARM
> >> uses a non-zero frametable_base_pdx to offset into the frame table (PPC also
> >> defines it).
> >>
> >> Fix the generic macros to subtract/add frametable_base_pdx, defaulting
> >> to 0 when the arch does not define it. This makes the generic macros
> >> correct for all architectures, even though they are only used on x86
> >> today.
> > 
> > Hm, I assume this offset was added because the original mask PDX
> > compression won't (usually) compress the gap between 0 and the start
> > of RAM.  However the newish offset PDX compression should be able to
> > compress from 0 to start of RAM, and hence you don't need to apply
> > an extra PDX offset there?
> > 
> > If that's indeed the case it might be better to integrate
> > frametable_base_pdx into the mask compression algorithm itself, so
> > that on some arches it's a mask plus a decrease.
> The offset is needed regardless of whether compression is used. With
> CONFIG_PDX_NONE (no compression, PDX == MFN), if RAM starts at e.g.
> 0x80000000, the first valid PDX is 0x80000.

OK, so you are doing some (kind of) address space compression (removing
the leading empty range to the first RAM region) even when PDX is
disabled.

> Without frametable_base_pdx
> the frame table would have to be indexed from 0, wasting
> 0x80000 * sizeof(page_info) of memory just to cover the hole before RAM.

But you don't really "waste" memory, just address space?  Oh, maybe
not on ARM as it doesn't use pdx_group_valid?  And so you
unconditionally populate the frametable from PDX 0 to max PDX.

> So frametable_base_pdx is really a frame table indexing offset, not
> something tied to the compression algorithm.

Right, it just seems odd to do that extra subtraction when using
offset compression, as in that case the compression logic itself
should remove that leading gap when RAM doesn't start at 0.

Instead of generalizing and expanding the usage of frametable_base_pdx
it might be better to implement support for pdx_group_valid when
populating the frame table, and switch by default to the offset
compression method that will already remove any leading unpopulated
spaces?

Thanks, Roger.

