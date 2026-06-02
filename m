Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gniRAxvWHmqjVgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:09:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6664362E4F5
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 15:09:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=wvK90Nl4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325007.1590521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOsB-0005Yb-Ki; Tue, 02 Jun 2026 13:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325007.1590521; Tue, 02 Jun 2026 13:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOsB-0005Vn-HW; Tue, 02 Jun 2026 13:09:35 +0000
Received: by outflank-mailman (input) for mailman id 1325007;
 Tue, 02 Jun 2026 13:09:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUOsA-0005Vh-D5
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:09:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUOs9-003ioW-Pd
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:09:33 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1ed5ff-5cb7-0a2a0a5109dd-0a2a4508b5a2-40
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:09:33 +0200
Received: from [40.107.201.6]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1ed60c-63b5-0a2a45080019-286bc90613fe-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 15:09:33 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB4951.namprd03.prod.outlook.com (2603:10b6:a03:1ef::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 13:09:30 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 13:09:30 +0000
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
 b=mDnLcOxadTY/HHl7WRJvPFd3VCgSAkJUGxkx8eJLDfyqG9NptbojLxz10X+JRjFti33/NKTpEk0LJf1mNrOuIoQruIwWwynKDQf2Zz54/NOYg/Tz/GQmyWIMReP9M7OzMQlJTFkwaZULdM738/kZhLVLA2c0Wj6OtyE44HrdWb4runbEHYf2gZiwm/DN81Pehs34xLTCHAaj0OdtpULgEzQCKH3CYQMRaL6Sc2pT807lU4EdiSePLS7fnPLZBHKWCyDYq8Y/DnDD2PBPgyojNEQsQMxMGW2E+CoX0h5uHB7a4gK591Ucl3XBMzd186FYg6CY+V6foQ62DCA0kD+fmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOyHAdNRnSbAKIrq+mXowVimhqtVHKNabqwahNEHcXY=;
 b=MAynxGMurrP8elLgbTMFS/5YkeXOD39U8bVZIl/gOiNnc6PryKUaLvenf3k4xgZjFFglInY1GgdjuckJ/r8wAYUC/cmuVxKywE82jNkFqNsp3kG7Pfe76cQBfYpB302VYgrTTU6DgW7qhCHs77DGiExE1USzOuTYc757iWYA4yFNZCKeL8UJVvMQrmo4ijpSGdBoLNbp5sWAECfAWAm7dYnxCcsOiDGXcZglkhTd6k8+PoziNIQjx0UeAgiP1fXpu7h3DmyJhIBUejlNubTGuCiGxl6L8o3cnW3gLSUlqCFWMNBgPtF8s9pyI+r9B4V35dJqvWKQbnEvghmGzOsABQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOyHAdNRnSbAKIrq+mXowVimhqtVHKNabqwahNEHcXY=;
 b=wvK90Nl4SDrefHrst4m2brFf1fJXtJrhz6nFL+fJS8kXTXUtNKQDr5jk/YYfdTkzIOtY24b0sVlsPQWoc22+003fompPL/f3cPNdsmtqOOgfjE1m2JdTXl4XBKZGjAMjBh/G31TRzY0/NEeEfOLRF23VPo9NBL3djLzhRM3qM+A=
Date: Tue, 2 Jun 2026 15:09:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Marcus Granado <marcus.granado@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/mm: avoid watchdog timeout in dump_numa() on large
 domains
Message-ID: <ah7WB--KZY80t67A@macbook.local>
References: <10d8309efdb878a3b615a7daca2bb5209525cb37.1780390167.git.bernhard.kaindl@citrix.com>
 <4f3f6ead-b917-4824-bc24-47a37f921bf6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4f3f6ead-b917-4824-bc24-47a37f921bf6@suse.com>
X-ClientProxiedBy: BN9PR03CA0563.namprd03.prod.outlook.com
 (2603:10b6:408:138::28) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: 07181b2f-69a6-4219-9f41-08dec0a82e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099006|4143699003|11063799006|5023799004|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YWNPPRqXeEXlwfrkBqKRLPZT3QBQSE5wos543bWJkZK50P5i2EwAb9O+IO9LIC/SLH6myPpSZBJFt7h9MAzi0BXKOK6YpzlMgHrAOZdDeqZWj7yIswDY2M2sD+IMs7Jzqurd0X0SxVDat/SlATX++BXvzR/yOh5MhGJ7vZegCxErDfsCJpFF9Otuzqb10pbCmgKGXMoXR1lgsFiBb8Cwf46TFLZn/Ie/KZMEmLJCBuhfF8rtf2zjpLsnZojeVJdYsneAoZ4tWtiK+qt9RMELHhqA55cp7lASCQm//txWSE6XfXQsoIn09backawRtl2KeBsxkMK0eaj63JO9PfZ+qqt8PPcKJdH8eu6TTeoFSI6b9m3G5ELJR39lRQvNpUUqbaJy/POQSFJygxI3yqQRZSogP1IFqEIjnWp8HtS8fC0xSa+2uFpJlCR48vJ+qDXJmOXyEQa106adcS8GXZejAZlBKMO/V+444c430sDQ9ySSHmEP10TKnclYSZmkINZ9tNzIfruCfY67wuB2+CCUaOfRJ0Mhs5lx44c02UwnmdhRxbnH1hW3/xB7ZAoRRDbc26raNf5ldqdecqaDHouw4gsdOK0MKiea4xQOSzbzGVCVp56X/xbBCEb/KBCbrGO1Gey77o4m0i0du4mQ8ZX5Ez2GU0P1W7WuCqiLGLtQVOpIMaVTRDmADUbmRIStI4g/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099006)(4143699003)(11063799006)(5023799004)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmI2REcyZ1c0YysxQ08zMXNOcHAwRy9vdFRPejZpeU9tNzBwemVNaUp2SXQz?=
 =?utf-8?B?WnJVc0dVU3A3MWVzRmlJcEIxYTUxU3d3WmJRUy8yMkVRNkJFSTIxM25VdTlQ?=
 =?utf-8?B?ejd0cDN3UWNFVXdqNjY1cWZSVXU2bUZNRUlBeWxoT1k3Z3BJSk84NFFUSGNO?=
 =?utf-8?B?NjEzQndteUtCaXRKRFVxRElDcGExWlEvekpsbytZUW0yT3ZZcEkwcU1rR2ta?=
 =?utf-8?B?ZldVUjJ6QjZzb2ZZOStKQi9MbTZKMmpDbGRTMkNOU2hDQ3Q1Vzc0YnJSbGtR?=
 =?utf-8?B?WGxIdFBacG1XRTJ4UytPL2RTdG0rY0gvTGVHaW02NzZCK1pORWJZaFRkSG96?=
 =?utf-8?B?MnN0VmR3aVIza1JCOE9lV1g5alhtQ0lSZXkzUWRUS3JxNzdmeitsQ2tVQVpB?=
 =?utf-8?B?S20yTEJMa2g0WWR6ZWJjdzRrVFBtaWJFWDJYMTc1TTJ4R1ZQS0RLcUllelVW?=
 =?utf-8?B?UkJQVm4xcHowZ0FxazhRZlpva1UwRGhKSTNXRjFQRjNxUjFpdUJzbDRCSTNL?=
 =?utf-8?B?cHhZa0JvT24yM2FncGtmNzRXMWpIb2JuQUtnamJxdFloTjRrTFdscC9tNHZ5?=
 =?utf-8?B?NVVUTUJoV0Zaamp3bHg3UHY4b1lZTDJlMEl4cURST3VCL3drRXBsMUpvUnpC?=
 =?utf-8?B?bCtSdytRNDdNblFwbllPR2xEeTdmYXRuSkg1VjI4STFWeE9FaEd2cjJERVlU?=
 =?utf-8?B?ZjkvNUtYRW9Oa01oQWZpWUEzQzR4RzROT01vcGQ5UEU5SE1xRW8xeklVUjVp?=
 =?utf-8?B?c3RBMDJtOXI1MFdTM01DcnlscE41M3FTK3lPdjJkRE4wK25Lb2lLVEIvTEND?=
 =?utf-8?B?WXdTckg4TklST0NkaGFqcHFDMk1zWGJTSmVteFpqMnNBQXkxQWdFTXpsSy9I?=
 =?utf-8?B?cHlCalhZYnh2ellMSDFVTTFZYURtYkZ4R3Z0b0taS3hRMXNHbkx4YUVHcVpC?=
 =?utf-8?B?YTZmL1M5K0lSSThrd3dLZWQrSVNFL2hDcTFyQi9pS3lVK2phZHYxZXF4dWR3?=
 =?utf-8?B?ZlNST1dKYzdJZWNLVlBRODJ2M0dOWUlyMldWMk1zOWp5TjRHcVJBVndBb1Yz?=
 =?utf-8?B?NmJ2emZmWUVPbjUzNC9NOW5VWmwzK0JFSk1JRC96OXhpYXJGNXZIZVFnbElv?=
 =?utf-8?B?U0RLNVJaZ3o4TEZWZ3RwUmRKVkxiMnZkNWU1WnhPaTBqZlRGckQzY0M0eXdZ?=
 =?utf-8?B?eG1yT2lRc1FHd0l2NDJlR2lES0RPSGp1SWVNcE9aUkkzb2hCS2dtTmxXVXZm?=
 =?utf-8?B?TjVpWFJuM3Z6M3hSMWRqcGdwYmNhZEVtbldXTVY1d2JzV3FObUVaTG8xK1o1?=
 =?utf-8?B?OGlHazZDSEladWRIRGNjMXRmeWZHTkRTRXJKRmFQcmVDRDdEbTVYT0pmM3pF?=
 =?utf-8?B?NDlkZmVLYjNYdHZnNW9qYklyOWNzeU9tSWI5aEJGNWd0VHMvd2lGbVNqbysr?=
 =?utf-8?B?YmUvdkZLTktITlhZc3ltY0p1YkJKcUJVZlZRMlF6alRNNFNOTGRoaiszdjNq?=
 =?utf-8?B?TEVNQ0dlMlZFZ3lpaUdKTlFlOUw1QjNEdStaemFlcEVtUTA5dXhJcXJkRjVL?=
 =?utf-8?B?S1UrN3d2T3A3V1VrVTFnaUpJR1Q4UkZ3U0tFUW9MUU0yKzVFUVI0RU5SV2l6?=
 =?utf-8?B?WEdyOWFHL3A4aXMzcU1CN1pyZkxNTjZoNHdQYXFsaUdZaUpiL3BMSUpPUUVD?=
 =?utf-8?B?MTdMQVg4TVdsSC93bEZnTXJ1NTZPeWEvdXBLQnpPeGJ0Q0FxaitYSlZ5Smdr?=
 =?utf-8?B?eWswRk95ZGY4QzZINXI0ZHJybWdqaDlvdjlUNlhqSlVkbHNGQS9aVnh4R2RY?=
 =?utf-8?B?L3BBbndwYU9sYkxmb1NzNmFPU1BTdWpSTnI5Yk5tb3BuNlVWSHY4ei9ZaEk2?=
 =?utf-8?B?OFdBMXFIUHp0NTN1RUhIdnJwZEZ3bEpJaXZiMk03OE5TdmZGa0lQSVN4UTNO?=
 =?utf-8?B?Q1VnU1lYTGdvUzJ0Y2VXb2pUNkZzSFFTQmlSWGNRU3BrZkE4MHIrdG1mZ2p5?=
 =?utf-8?B?R2xUREVzdGVwL3RHNm5FYUZSRVd1cFBXbk1nc1NPekRLK2d2U1VuQ1YwbEFv?=
 =?utf-8?B?T3FqcktiQm15VlR0RlJKa1VrcjRud1N0NXpWeENQSzljdTRXVUhOUDA1SWsz?=
 =?utf-8?B?QVZUMTFOWlBETHcrWDJTUmtUaisyQzhTK01nVnczWXNUTHordlIrNlYrcU9X?=
 =?utf-8?B?SEdJUU9jZC9vdG9Wd0RBMXlVWGxyNTV4dnQ0OUhoWHlOcnBuL3BWb2hxdlZ1?=
 =?utf-8?B?dnVBUkpZMXpQQjR5Z2FHZ1lzUnZHMmoyN2JwNFNHZ1o4VERpRGcwSm1vczZP?=
 =?utf-8?B?Wjc3eFNtYzR5LzZsazJKMVZkK3psSysrR1dBNEM0WGNYbEpkRE84Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07181b2f-69a6-4219-9f41-08dec0a82e3e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:09:29.9067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lKaTXK8qr2ZY1TGdu9nDAvxmz+6oeFvtt69mjqVXjuMuC/rV+mIzpI5t/BGGQjl0xoJJoRNCQkIOdCrXU6fwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4951
X-purgate-ID: tlsNG-c1860d/1780405773-C4E78DB1-FA19F5E4/0/0
X-purgate-type: clean
X-purgate-size: 1386
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tamas@tklengyel.com,m:alejandro.garciavallejo@amd.com,m:marcus.granado@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:from_mime,citrix.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6664362E4F5

On Tue, Jun 02, 2026 at 01:51:13PM +0200, Jan Beulich wrote:
> On 02.06.2026 10:49, Bernhard Kaindl wrote:
> > Using the 'u' debug key invokes dump_numa(), which walks each domain's
> > page list under page_alloc_lock to compute per-NUMA-node counts. On
> > domains with many pages, this O(pages) operation can hold the lock long
> > enough to trigger a watchdog timeout.
> 
> In addition to what Roger said: Is it really the lock holding that's a
> problem here? That is, there would be no problem if there was no lock
> involved in this O(pages) operation?
> 
> > Replace the page-list walk with node_tot_pages[], a per-node counter
> > maintained in struct domain. This reduces dump_numa()'s per-domain work
> > from O(pages) to O(nodes).
> 
> Alternative approch for consideration: Purge dump_numa()? This big a
> change for making a keyhandler work better is somewhat questionable an
> approach, imo. The keyhandler isn't there for use in production anyway,
> it's (primarily) a debugging aid. If the data is still needed (and may
> e.g. be useful on production systems), make a (preemptible) domctl or
> sysctl or alike instead?

At some point a similar change will be needed for per-node memory
claims.  While we might refuse just for dump_numa(), the intrusive
changes in memory_exchange() are a requirement for per-node claims
IIRC.

Thanks, Roger.

