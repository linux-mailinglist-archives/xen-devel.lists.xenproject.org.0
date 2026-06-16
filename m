Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ra0GDzEMMWo9awUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 10:41:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939A668D3DD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 10:41:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=TtwMu+Go;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338790.1599841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPM5-0007yc-IC; Tue, 16 Jun 2026 08:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338790.1599841; Tue, 16 Jun 2026 08:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPM5-0007wA-Et; Tue, 16 Jun 2026 08:41:09 +0000
Received: by outflank-mailman (input) for mailman id 1338790;
 Tue, 16 Jun 2026 08:41:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZPM4-0007uz-4r
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 08:41:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZPM2-008p7x-Vo
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:41:06 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a310c1e-e002-0a2a0a5209dd-0a2a4501c9ac-28
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:41:06 +0200
Received: from [40.93.198.50]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a310c21-c1f2-0a2a45010019-285dc6321cd8-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:41:06 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB6033.namprd03.prod.outlook.com (2603:10b6:610:bc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 08:41:03 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 08:41:03 +0000
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
 b=pe9z95IpGyK0B33D09M2c7K+GFPZPDZPYa6VnZ79EzbAb2t/+5CFSR4To9wkxX2pgq0XkCLJ8EfBZneRg2ui0rLzYdzuEqK9hHJuoQJs0XcKfIrf9rEuRnjSBb0+olTJIcWBlHCARRWjAbA9PNBNR73eWGeHLBNdieh/GYOH6einehJG69HwCaqSlAr+g0CYr/u+9ubCmo5THy7Uoi3r4avyY5P4L9FFeVqRBgYVAiLSdmYXT40ls2CLI7R+E6ghW3b9JUqQ11t8RXIKbNTX58pK8dFspjFhvVeYnEZZymzrq6VJxYK4GYdxqulHQx6TTBqgodWvne6Q+XVV8aoo7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9rDnPCnH3MHgCBZIVdkyEmzw7QXfupbZyecdorN3Zo=;
 b=tUs6XO3X6WIq8sVYr+fZe0ZyHF0IPKwX1BQYbhnxhEWengNTkLM/P0afOP36ypDnxKMXHCgd3B0vtrVUSk+QgIySrgt4I9P7VotFK8L7BiM2C49Y6BO6+I9Oo9akQwxd5StM+5faPDTPHRzXZSMhT8LD5Ph3UW2Uq8Fg2bW90c0Ezxc2Gp/dYgXqA1nGLkZJ3eROHfyVZGH1+9br53FyJehayoPF2LmFIB0dPrrLt0eHNEAn9UM/WMc8/8FZSdZx6cBt8s+erO6JWUw9OmluqQKQwAxFAn3iWe8RpOMc08HPizLkd7yoUacDh0dcEi94jjEHhKMZJsnlXxENyGDvEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9rDnPCnH3MHgCBZIVdkyEmzw7QXfupbZyecdorN3Zo=;
 b=TtwMu+GolqnfrWDIWiQr5r1JQRdYcNRm1VLK9NwDIl4hz8wB87wI8NMdmNvBLBjD3V8YUVEXuW9B1nMpPsqLmi7iDkTBXNBjTocvKxNUrUUaHT36Sr0VFJvzadJ4/yFctRKkfzJPenDdUgnzX0Mp8AjOgFhT5j6jXM1Och0M3m8=
Date: Tue, 16 Jun 2026 10:41:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: Re: [PATCH for-4.22? 1/9] sched: introduce specialization of
 "running only" vcpu_runstate_get()
Message-ID: <ajEMHBY6su6tPtZG@macbook.local>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <67d1e638-a2ab-4d03-b9be-915a8c42e095@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67d1e638-a2ab-4d03-b9be-915a8c42e095@suse.com>
X-ClientProxiedBy: BN9PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:408:f5::29) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a1f0aa1-b5af-49d9-baca-08decb82ffb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	FkZFBdBgc/GFVgIqM47Zfg3rxy2Xfhz/b/E+Vce318S3qaQw8i6cnHOSbMVPaJiusf+IMrpZ/sQzd8Jlhz1laHIVn5Akj/5lZwbXCZmf1NjRXTg0Z5ylDFV3qA4Z0Norq1oj7C3ZTZHBdPhvkPmgf3iwPBH5vx1vYx3JN4LWUgKHfa2nM61CCSgUqbL3NcnH0v8cbzbMZYmIzrSmxdmncvzMxfzTj9K4TvXh5BCo+M6nlnAA+X+ERsq/QYXe+431QIa4UAfI08aG5I4PYT0g26RFx5QsUECqf0HnRB0JszE9PK2X3bkec581w3WJ3y1y/jmLDzgJBDSpOE53n8S2xRF6VmoYyE6/gpEhdYmGnEK6Q9h7DB2BW2LHM1BzFazVVYi7+A0/KhjUCAKbvBqxgbp9OSjeYIz5beT/V0qN1ljO5wEQN8vRuwKRg1i1OtXT5l5JDy76an1fXMMyl8ZTkTY6o4Ai73Cy1Trsu5h1d7eFg5sHpC/Oyvb/t7dI+niV/sZurXyPSBStYywrOZLzYq29TJWdM8ywWPBA7Yu6O/EDqVU0DdnEmgqTKqbbjKKHxwKnb+PJtGCGUqAvappwYRrFBSCrs0azjqxqcZKDIQzV3rYXLFBL8n2vlha4NOTfBnMuFHWC7+3/Iq9QVIVf3RRN5rFUDxerMkTrxwcd56xiNCHIfN/Pze2qGpePV1DF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ems3cDZJRmd0MHBROHh4THE0Rng2aWxQT0F0T2dLWWFuZEQ2YzVMbXJBd2NP?=
 =?utf-8?B?a0tHalBvWUorSmx1RS9IVnNVNzhFSjRUMk15cDZSSTZnalhyVU5DZGxRMkNy?=
 =?utf-8?B?MkE3VnlxTlNCYklRZFhlZjFwYjA3bUFpZDJDRzRjaWF5SldOdDlzK0x3L0ZO?=
 =?utf-8?B?WHNxcTRIeWcxQ1hVcENxM01aazQ2RGdrRzVVbkRQRjdWZ3VMMTQvR1hjR2Fm?=
 =?utf-8?B?dE0vL0phY1pYNEY0cUcxeXNnM1RKV25zSTVWZmdFYkcycEc2WGlUcGlCNUpp?=
 =?utf-8?B?K0xJU0xzVFBEbG5laG1WYUdKN1oyd3VJYjlFbWhjTzRhWk1wdGRzWGRLSkxP?=
 =?utf-8?B?QW5lNU1QU1UwTUw1ZnVGTzBiUTJUYloxSFA3WkkzRzViSldRekVKRUgxc1dj?=
 =?utf-8?B?YTJYUFNIV3NBSTNFS2ZvUTExYWt0ZXBmQzdoRUN2MG80REJqTkt5SERiNU9N?=
 =?utf-8?B?Yk9VUEdWNHhSZTBsWU4xVTBCOE5DanFSZDZGQkQxTnFZU1Z4WGNqQUQvY2dG?=
 =?utf-8?B?K1NoUEFGeHVJTTM3TnpPd0l6dUhmdzN4WFM0amFzSUZDcGdnM01MdE5jT3F1?=
 =?utf-8?B?Tk54ajByZDdodFU4SzU5WEllYWtjYzlLVEdpR2lvMkZ1OTdGaVZ2NnVERVVl?=
 =?utf-8?B?ZnpuVWc4TmhTa1lXYk5obVZic2JkbThHS2JrLzRQSHlMeUNKRk1WQnhSTlU4?=
 =?utf-8?B?UjZXenpFdUFnK01QcjUrVE03MmhRN2MzRjQ2S29FSkd6Q1FDWG84dW5POWlL?=
 =?utf-8?B?KzgzSG5GVld2UCtPY2xWd0x1VlpTZlpadk0rUThJYWtoeEdiclYvdXN3ZjFs?=
 =?utf-8?B?bGd0NlF2RmN4RkJuMmZPbzNEOUIxUlFlV3BTZDVmQ3RVTkJtdG5IOXpGZEtZ?=
 =?utf-8?B?d1JnbU82bndsS0NVRjJvN0F0UjJoZGQ5bWFKSHhMZi80YlVZUzRoWll3eEtq?=
 =?utf-8?B?VjgydFdoS1Ardkd0dFcrWU1OZDdXMzlaVVFHQXpiTUhiOFhRdXh1OEMxN0FQ?=
 =?utf-8?B?dmNsUER4aTl2T3RodUdna0N1bEtXNHNUNW11ZTYxeldGWlE3dGt6c2FscWJE?=
 =?utf-8?B?TWN0ZnlZUll6V3JZYmxhc0x0VW9TNDZVMTZXTG5BWmZCWmpKZ21oc1JHM0lZ?=
 =?utf-8?B?dmZqUkVsYkR2Q0czejQ1aVVRQ3EyTy9qT1g2ZDFOT3FQc1dCbk9FNDJzTGwr?=
 =?utf-8?B?MWR5b1BzekM1bVk3TllRaTdZYlBsVzZOUnJ4OTR2VFlOMXZwVzAzT1BBcmps?=
 =?utf-8?B?UXJyVFlZWG1rVDVuWjlZdlFuQnRlVUhtTEVmSnY0ejdhVnFDMjgyeXJEU0w1?=
 =?utf-8?B?MGM3d1NZVytzTndOdVU1ekNHMnJNQ1VYTWpUOHFKczJ4NitlTFYzdjJSUVFD?=
 =?utf-8?B?NGY5ME9VSlBJYTd1NWgvckQrWnpTeElXd21maW5hWkR5d1VPQTdNc20vTDh5?=
 =?utf-8?B?OUpER0Y1ckRxS1V3eUdWNWVoaVlhY3hNR2F6R1NoUklUbVRWMHhRczI0ODdR?=
 =?utf-8?B?TDQ1RDdZUnFJT1F0WlhVQ2xwUVRGcWFtSEZGMHA1VkRXL3luQXBrK280dXE5?=
 =?utf-8?B?QXVMUUFVOEQ4L0pmaG9qeXBxMWt6UXp6b3dtSzhVRmlieVdYcUFoTTNxVkJk?=
 =?utf-8?B?RGIyZjVoRnd6ZHBPbm9PU3BtNkM3ODEyYVQzemdEN0VqUHJscUVPeWNGdHZk?=
 =?utf-8?B?M0dkMGdYa2oxYWZ1cTBGWVdEREhxN2l3bkNxQk45S2dQVDlaWklza1E3ZVV6?=
 =?utf-8?B?NlVtNTlJTmgxTlo3enFBUGw0R1RuTzBkamp4V3hPVzJQWDhXSElrTXNJWTNR?=
 =?utf-8?B?MDFrWWFkbG1sU2lVQk82ZDZqWk50eDYxbkdSQnpoaktyRHRNTkFGN0U3NU1X?=
 =?utf-8?B?SEw5NlpvZEMrRmRCY0xuTEhnTDZyNENsZHF4cnZMWUY0dWdtODN6dlc5TkV5?=
 =?utf-8?B?UkpnYy9xY3hacFdIWnJQYnZtcldaVHB1UzlKNHUyTEp2cXhTYjZldVhiVFl2?=
 =?utf-8?B?Tk9GOVlxc2FGUW82RkZIY1Q4bENHczN4dUhXK2pqN25rdDJoWGtnSXR6NXNY?=
 =?utf-8?B?UUdUYm8zbGE2VXdDUUJBUXdyVUw1Nmw1eUhzNWxQaHpiU1hOYWpWT3Y5bW1y?=
 =?utf-8?B?cGRyTm5yMUw0V3JZaEhwMlB0UVRRamNFWm5ndHg3WUtKOHYwYWpXOHp5eUl1?=
 =?utf-8?B?YXJEMlFHbVRpQUkrL0g3ZE93QTYyTFZyMnI4Z1l2UFhGWk9zbHVYZ2hJa3F2?=
 =?utf-8?B?bjNGWmNJZzBLeFJRT1dKblgrL3NKbkt6Y3BiaVlwQytwZnJHeUlSWVBnSHpB?=
 =?utf-8?B?YnVrbFdRdDRod0RwSW8rR0RTM01LUXlSSzdDRWN1R3g3MGZhdGhLQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1f0aa1-b5af-49d9-baca-08decb82ffb5
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 08:41:03.1469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMDtMgn7tkkSUDaA/Z/REvxd1Acj3TQzBvL5i3cMXG50jSuddBoBL7kW7PJwUpyJSE/C7xXy+MR3NT82kqKpuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6033
X-purgate-ID: tlsNG-d62444/1781599266-B6F58FF4-191E8BD1/0/0
X-purgate-type: clean
X-purgate-size: 3324
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com,suse.com,xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,macbook.local:mid];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 939A668D3DD

On Mon, Jun 15, 2026 at 04:12:11PM +0200, Jan Beulich wrote:
> About half the callers of vcpu_runstate_get() are solely after the
> "running" time of a vCPU. Introduce a specialization with a smaller
> read critical section and thus reduced risk of a need for retries.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> The function name was chosen such that grep-ing for "vcpu_runstate_get"
> would still turn up all uses. If that was deemed largely irrelevant, a
> better name might be e.g. vcpu_get_running_time().

FWIW, I think the fact that you can find call sites by using
vcpu_runstate_get is likely to become irrelevant in the long run.

> 
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -56,7 +56,6 @@ void getdomaininfo(struct domain *d, str
>      struct vcpu *v;
>      u64 cpu_time = 0;
>      int flags = XEN_DOMINF_blocked;
> -    struct vcpu_runstate_info runstate;
>  
>      memset(info, 0, sizeof(*info));
>  
> @@ -69,8 +68,7 @@ void getdomaininfo(struct domain *d, str
>       */
>      for_each_vcpu ( d, v )
>      {
> -        vcpu_runstate_get(v, &runstate);
> -        cpu_time += runstate.time[RUNSTATE_running];
> +        cpu_time += vcpu_runstate_get_running(v);
>          info->max_vcpu_id = v->vcpu_id;
>          if ( !(v->pause_flags & VPF_down) )
>          {
> @@ -829,8 +827,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
>  
>      case XEN_DOMCTL_getvcpuinfo:
>      {
> -        struct vcpu   *v;
> -        struct vcpu_runstate_info runstate;
> +        const struct vcpu *v;
>  
>          ret = -EINVAL;
>          if ( op->u.getvcpuinfo.vcpu >= d->max_vcpus )
> @@ -840,12 +837,10 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
>          if ( (v = d->vcpu[op->u.getvcpuinfo.vcpu]) == NULL )
>              break;
>  
> -        vcpu_runstate_get(v, &runstate);
> -
>          op->u.getvcpuinfo.online   = !(v->pause_flags & VPF_down);
>          op->u.getvcpuinfo.blocked  = !!(v->pause_flags & VPF_blocked);
>          op->u.getvcpuinfo.running  = v->is_running;
> -        op->u.getvcpuinfo.cpu_time = runstate.time[RUNSTATE_running];
> +        op->u.getvcpuinfo.cpu_time = vcpu_runstate_get_running(v);
>          op->u.getvcpuinfo.cpu      = v->processor;
>          ret = 0;
>          copyback = 1;
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -325,15 +325,35 @@ void vcpu_runstate_get(const struct vcpu
>      }
>  }
>  
> -uint64_t get_cpu_idle_time(unsigned int cpu)
> +uint64_t vcpu_runstate_get_running(const struct vcpu *v)
>  {
> -    struct vcpu_runstate_info state = { 0 };
> -    const struct vcpu *v = idle_vcpu[cpu];
> +    struct seqcount seq = SEQCNT_ZERO();
> +    const struct seqcount *s = v == current ? &seq : &v->runstate_seq;

Does it make a difference to use a local fake sequence counter or the
real one if the vCPU is the one currently running in this pCPU?  If
it's the running vCPU then it won't get the counters updated, and
hence using the real or a fake counter won't matter, as it will never
be updated while carrying out the read.  IOW: the usage of a local
sequence counter for that specific case just adds more logic without a
real benefit?

Thanks, Roger.

