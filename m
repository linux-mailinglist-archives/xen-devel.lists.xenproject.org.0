Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r5AkGhA/QmqX2gkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 11:46:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7196D8692
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 11:46:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=jEFUjYf0;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1347353.1605215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8Za-0001ki-Qg; Mon, 29 Jun 2026 09:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347353.1605215; Mon, 29 Jun 2026 09:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8Za-0001jB-Nq; Mon, 29 Jun 2026 09:46:38 +0000
Received: by outflank-mailman (input) for mailman id 1347353;
 Mon, 29 Jun 2026 09:46:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1we8ZZ-0001Zg-5W
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 09:46:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we8ZY-00DMLz-5c
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 11:46:36 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a423efa-5cb7-0a2a0a5109dd-0a2a450c8216-8
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:46:36 +0200
Received: from [40.93.201.59]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a423efa-f399-0a2a450c0019-285dc93b14e9-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:46:35 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5141.namprd03.prod.outlook.com (2603:10b6:a03:1e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Mon, 29 Jun
 2026 09:46:33 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 09:46:33 +0000
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
 b=nKeyCOr26EnzApBdLLdXg784PsHPCB4PYXZ/ObHuGnV/k6Y7MoeYnr4Jb8mMFDu215L2XMkos8uE+yKOIYb6FJUbv0KpMRc9uqnQjAOC4xAXzxYWYMgrExGI/DtVW8jdcAhtodBpyJMFfDCK7KMD7JWHlPbQawtlb7xq5u0pDEOjqI0/3qeE78VwzFE6RwsVxfXFUz9ig7dfX1KaEMe0Pdniv9VUpDmLQrqhGkfkrcDqBtDZrJm6bSM+CWBf+4EHgy6wSOiSLn145Q9/Xkopn2pGrxd9FrNXvE21r/O5VeBN1Onn8aONDs4PqJYAH0D8Mxoey8nZD+XNuizRW0yO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HY5yZIB/IQ6+L8KU+ioxvL6s7xlSNcpLpZDSMfGZOqw=;
 b=POBTv2wk3HOh5jWCJZJe+pLB+LrvttDa5mb5L1K57xjnBkF3KzZs75XGOAQy4ojE5CQMw28r5ePgh2hCDVkva4wc2EJ9XEAzzLXIEn6RGJlrh22XGB+I6JC143EkhCGrR5eX9crch5190aNKUOSv4s1TiB73A875dFURxJkdY/IX+mmZOvgB6YKU85NQB7mhEmv5bF3gf2cTavYP7jEWuPGBtqwWYos6JmD+BaXYqNfmg+YvsT2kapB6mLhJ26cUzI/OBMvCpN/XG8nUI/UR8B7vw6igPBuA0qaDLFOGDpkKd4o8x81yJLRO2uu7hcgzYMrLAfTfRK2JfvFSEqsx0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HY5yZIB/IQ6+L8KU+ioxvL6s7xlSNcpLpZDSMfGZOqw=;
 b=jEFUjYf0IUH4Crdfjp/2KvTzB7L5sEFBUqLyIG4JE5c/ZC9DbbtL8raYdYBkojKEQ5tOPtMNEwjhndtZWYBzSchPDpe6bAKXywTIDdWjGHu5uCWs6VCM9HFtSTS3WDNCAqbya8gvMo26aqPIQCs1qVIHYkJ4FYwl4jHxGgAGiU0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.22 v2 1/4] riscv/irq: define a per-arch irq_to_desc()
Date: Mon, 29 Jun 2026 11:45:28 +0200
Message-ID: <20260629094531.55555-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629094531.55555-1-roger.pau@citrix.com>
References: <20260629094531.55555-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0154.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: d36fcc14-811e-4e5b-3175-08ded5c34d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	8OT16dL8izRjfn47tWOsSvJMP/+mP+ZZiK+sv8lwe069VJECXK8RyrlrREun8GQamvpd4pbnyJsJ8WP7K3QG9r/nHEGd+WZWtZz6HwnNnNOpxNFb8hX2ZE2Y7RCJIniH+19tDd92EPTrnIx7Sw4BvJhw/JK5hdrenBrFCxo/0VBM2T7PqSkCecPIwpuyxujlmr7dvhrqjVEyk3D7suKcl6wRm7ttHLlxcRZPhf/No03qgx2QP3TLgTW5KZSnHVP9ojyjY2b1l1wD2nULKvXXObYUE01DL2n4IYiFMTJ1AtKQP6mcjqtY9RSl9fWll8VtF8W9uhi2EH9BmxQQbvUrEflw8oxbRa3BtgRNzOGKAT4gF7G85baRXjcqYSIpwRVO/3Plp3WWPzOzu/wt+WuYVMFhhOfJBuuSfJwLQ3h0oaQs7tN+Cxvw1nuw2ixNp2JUy041GQLm6QqAugK+E80MhG14PqqUCuafh6fEi6MiPAmeNyw7KPu8x3vekArSZRFAlTjTIrh/pUjqB5YNp2qj24wrHnOEyttI87cRwx5+rlyZJJLxWthsnPCyIqX3GdjF2LYBuZ8Zat/A75VKhEL3K8AZExyMla+e1gj8SqqkUOh1EEIkYyrnhe8Sqj43DXm0b7goX5Jnwn85ZFdvMrLomUh9JddMx4AuMkln8ckfrDM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHdJUy8vc1FKOVJ0R3hHaXZpNmpXVlhyeDZUaVBYZFRKVHZWKyticjRBR1VH?=
 =?utf-8?B?bVdRTFRjYkg2MlBOUTA5MGtmcjZBVFBmZzNSTFpHOS8rcWpYU0djc3JVZmJH?=
 =?utf-8?B?aUNyZ0pocDJwQWhzRmhxTWE0eURuS0FyMkgyMU0zdTlickI2aEJBdVFwdkVX?=
 =?utf-8?B?bEtJWEF6SDkwZ05Takd4WGllZHBUV2lBaUZGOFRaZm9WQjJjcW5pbXZobSt0?=
 =?utf-8?B?dDltRWJVZnRpREhlQnVrRG5vcm91VWxoMjBwcTE0Qk9CVWhKbUJQbzVFMUpR?=
 =?utf-8?B?T1d3cVlCSm1RSkdVU2lBNEZ0VnY1MzF2aWRlNStwOThBS29tVlN3ZG9wSjc0?=
 =?utf-8?B?eUtEdUpSeXZTUlhQRmxaOUhSb3pSRlJUalM3MDVYSkgrM0gzWnpOSUdEZGdS?=
 =?utf-8?B?eDd4Y2QzSFhFZVU3VnRiajNuVXEvR3VETmNKNHZDNjNleWMxZnlPOS8vbkV4?=
 =?utf-8?B?ZDlEYTJGdy9hMnRCMVBncWRJT0h6V0FKK21vdlRBTHBYMzJaZTdSSjBjckpE?=
 =?utf-8?B?R080M01VWXhZb1Rqd1ZBME9neWYxenZMbkJ4TnQyR09UVHlGSHdMK3l2VXBH?=
 =?utf-8?B?a3FSTXRXbGptbHp0T3FibXpHeGwyQ254M0ttNGUyQ0JGUklrU2dDc0MxNzBI?=
 =?utf-8?B?SHRxbFVRYWJjVHVjZWRteGFTd3psYnJQaEllMFRKTmFPZ3ZsRHBmRE1VdnhT?=
 =?utf-8?B?QlRLRnVYRXN6MGxGeUlvSFpkNlA3RmZXazNrMWx4UitWVlVnWEhWOWZBTmpw?=
 =?utf-8?B?NFg3TDhkdXZvc2Y4dGJhTDJNMUFuVE9SWmpUdVRCRVhRSnJKUExrWUhFVUhi?=
 =?utf-8?B?R2ZpVk1pT1IvMDY2L2grcXB5bUszY1JVTDZOci9kZ0lxOU1kc0g2RVFmZ1lU?=
 =?utf-8?B?MVM4R1lMa1Y4L29YUjR4M0VaTUtid0tiMDZzbjdwTFV1NkRJM04ybUx2YW1a?=
 =?utf-8?B?L1prRHQ5K05PU3dNUTZDZzhmb2JEUVRqdWVOY1NXM1dOSldBRFgyTTd4WGZT?=
 =?utf-8?B?Z1NMaFBqK2xpdEtTZGFWZG1xTUxOSDZ0eHQrdG5aNjh0SVFhakNHRkpIZTFa?=
 =?utf-8?B?TStWaE5jNWhDU1k3ancvcGg2T1A5YStwdVFUL2lZTHl6TFV0TWUrNU5IZTBE?=
 =?utf-8?B?UWpHQXVmbFlCd0pGUFIySHJsL29xRGVGUHFHdGwzQ0kwYlZBZjIzd1J0OG1i?=
 =?utf-8?B?MEVaTGxjQzBTY3Y0RG5lTnZxWWpQMnFBeXlwN05nbGNSYXlaakk5S1REcVhI?=
 =?utf-8?B?RVRsakEyTVhvWGVuRElDVTBYVEVSVGY2SU12dnhFajZpMmpIbnR4N2NsM1la?=
 =?utf-8?B?b3diY0E5ZncxcThJa0NvSi9CbzNKUmg5NFN2S0x1bGNESmVEbmRpUXFvaGMz?=
 =?utf-8?B?Qk5KeWpJTXdOV1psZGNDcHYrR1FrT3BsTUNUN3FmcXBMcy9YcGxqTGZHcXdz?=
 =?utf-8?B?N3IyZVh1YldMcVAyYXRpYTVjdjJrcmJodGwyMmFlRjd3M05CQ29ZQXNuaDM3?=
 =?utf-8?B?a0FTOUNBRDhCdW5iVzJaQUNwNzBSV2JiZG04ekpuZTNEVnVtZjhSRm5kaFF2?=
 =?utf-8?B?Y2FIQk9VM3FvcmFrNEhBUFlVemFtZVNhNm1rcjdRV1RzdXpJWWJXbXBQSFpw?=
 =?utf-8?B?UGFzM2FZeU5qdlQ1dkNsVHJ3RDBubU5yVTFrQVhGQ2U1UG5VdGVpWlh1VzFY?=
 =?utf-8?B?ZktxQ1JrcURxcEtXekFWVTMwcUxtbTFzbCs4aTUyRWd1cWVYTDgxR1NzZFlp?=
 =?utf-8?B?SFRNQzNXSk1CSkRLWWFzbml1V01YNWtCQ0FFeG9ONlFjNzdUUVlYcGJKMXU2?=
 =?utf-8?B?QkxiUUFKVE5ES01JRStsSUE4ZlNQOUxoTG55OENDMG00QkUwYlZEaUhNL0xB?=
 =?utf-8?B?SEVOaUVlMjdMbWxnbFRqNFJiOVdoK0ZHQjFOT1pTUkhLQWhIMVdDb0tFOXNU?=
 =?utf-8?B?cXRhU3dVTnFwS3UyK0hGTTQwVk1pVGZqTHd3N1ZWb0dlMTNWYjdpT2xtSzZM?=
 =?utf-8?B?ZnpEdHF5YUNjZ1dJRUVzbmRON0daTXhWbnMrbDcrRXZxb2JTaml3eXJGM2Ux?=
 =?utf-8?B?bkRmYVJCbjhNU29MVE83WWVHcTR1Uzk2aTlpdUJrTUM3NlByS1A4WC93aGRC?=
 =?utf-8?B?LzRGM2RndUdsLzVYU0tqc0ZKN0IwME00RzNaNGxVOFRVK3VRR3BXVFN0QXlY?=
 =?utf-8?B?UEVTRkZiOGtyZlFzZk1ZN2duL1Vqd1lTcUxRQ1NPL2h1cVRweXg1N1hza1V5?=
 =?utf-8?B?TVdmMWwzWEtOQjBSa29CSTZnUnEwZHExUjJxL0p1WFV2WjJmN0NZbnJRb0lr?=
 =?utf-8?B?cVVEL21uS3hXaWVWc3ZTb1VuQWlib3ljbmlCL05VQnJQZ1ZLeWlKUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d36fcc14-811e-4e5b-3175-08ded5c34d74
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:46:32.9643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVILyCFB8ycHIS7gGDyL6DrHbQ4mKTay1GC5+95s6F+zEa4U5P9q+D++XRtrK+1igKvXrxuJe441L/NqUanscw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5141
X-purgate-ID: tlsNG-d25034/1782726396-92321D51-E1E696EC/0/0
X-purgate-type: clean
X-purgate-size: 1468
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,wdc.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E7196D8692

RISCV declares irq_desc as a static array, opposed to x86 that uses a
pointer allocated at boot time.  This creates issues when attempting to add
an extern declaration for irq_desc, as asm/irq.h is included by xen/irq.h where
the definition of struct irq_desc resides, and an empty forward declaration
doesn't make the compiler happy because it doesn't know the type
data-storage.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/riscv/include/asm/irq.h | 4 ++++
 xen/arch/riscv/irq.c             | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index f633636dc308..b3e03117ac97 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -35,6 +35,10 @@ struct arch_irq_desc {
     unsigned int type;
 };
 
+struct irq_desc;
+struct irq_desc *irq_to_desc(unsigned int irq);
+#define irq_to_desc irq_to_desc
+
 struct cpu_user_regs;
 struct dt_device_node;
 
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index 25d329500212..353e9246f15b 100644
--- a/xen/arch/riscv/irq.c
+++ b/xen/arch/riscv/irq.c
@@ -19,6 +19,11 @@
 
 static irq_desc_t irq_desc[NR_IRQS];
 
+struct irq_desc *irq_to_desc(unsigned int irq)
+{
+    return &irq_desc[irq];
+}
+
 static bool irq_validate_new_type(unsigned int curr, unsigned int new)
 {
     return curr == IRQ_TYPE_INVALID || curr == new;
-- 
2.53.0


