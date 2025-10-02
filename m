Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C541EBB3A0A
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 12:22:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135672.1472701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4GS4-0000Fu-N0; Thu, 02 Oct 2025 10:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135672.1472701; Thu, 02 Oct 2025 10:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4GS4-0000DL-KD; Thu, 02 Oct 2025 10:22:20 +0000
Received: by outflank-mailman (input) for mailman id 1135672;
 Thu, 02 Oct 2025 10:22:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddTC=4L=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v4GS3-0000DF-Ey
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 10:22:19 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa8ab6c1-9f79-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 12:22:16 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by PH0PR03MB6622.namprd03.prod.outlook.com (2603:10b6:510:b5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.15; Thu, 2 Oct
 2025 10:22:07 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.015; Thu, 2 Oct 2025
 10:22:07 +0000
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
X-Inumbo-ID: aa8ab6c1-9f79-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwtyMWs9h/W1KrkMJ62pVYm1sEFV5RfmUdFgeBAPACUpim8qAbQ6VieT9m2tXSlJ1/g4YTtzeLnX6PMFCJ0AzUlyGO2B8m1dF33RRyKoC6dIoYb2Hu1Ktlj8B1psudxKiEk3k43PCt6pk1+1Af/swIBFenwWQf9oxdOh9wOkSnvckByubzaXvLDRqAFPOaNy4d+0UsXRwC43cr5MLJjh27fCzo9H9azBnLhOSHg0TfPaVWcC8/M3UX8gZmLxVhTQD9TiPdLpJqfZ0DZe2K4Ki+wX6WxK6RlPmOVbNFalM/uTaR36fGnK3K1oiPdE/H7cKdjdeC3+8M/4SkAjWSyxaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QUB8XuJaJVA7h4ehC5DNoDp0OLu6jlM/AdVcy6r/j0=;
 b=Zun3qwVCGSdU1lE0tqw9I0K2Cg0gZRVaWBgo+gDMlbjCIX8MhuBZ5yYJ32nekVfQ5x4hmr/xkIEmTcOYqF0+NB+L49HleKBZ+dj9zzlG4AXbvIvNbyrsEPWEtuLvwZtxSDGaUhh6NYuZlC9dMxESjw+6ZZef9SHZxTuAgNd+0oMsgjq2JAi1oDr7ruvN7MrSbgEUAI++gXoycgi5d70vr6uOQy8AaAOMtyzWNcMpdXGR5+2g6tTRLkqB2npeeVqMXgG2bn2p9kTQBhYy4FGT4V2xlAV7i/OjCQKWsyzoqUhb/JJoUjoN4xpN2fc8qRkZ8s0aLLftL4oerob+MiItYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QUB8XuJaJVA7h4ehC5DNoDp0OLu6jlM/AdVcy6r/j0=;
 b=M8GX1OZGpTf9l3JnQ/wLSkKdFrEeAxGdTiP5iEkXiQph1RNMd8Yz9exZw9wFrY0tOmwuWO+N1NKsOvAuBwWc9531qnqUgtYOxb9q2dtPc4hnRKZKVJ/2uXZHlQhlFq0nARtCAP8PK5/CafI8zMqSssiMikqdcz+MmFjy9MhosME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.21] x86/hvm: fix reading from 0xe9 IO port if port E9 hack is active
Date: Thu,  2 Oct 2025 12:22:00 +0200
Message-ID: <20251002102200.15548-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0014.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::10) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|PH0PR03MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: eed7fb49-5cfc-4a52-c442-08de019d89ff
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDdIc0tuVlZoK0ZDV010OVU4cUZ5eW1ZaGJ6VDhwa3dWWm9DYnpNbTk1LzRI?=
 =?utf-8?B?Z2hVMmVhOERtaEN6djVDWTUrUld6WHpZNzEydDlNUWI1NEZNVHh2YUtpdmdm?=
 =?utf-8?B?M3lqQnIvaVdpM3NGcEZaODZYVjBzZUdLQVhNMlc1SFlZQW55YlpTTlV3V0dD?=
 =?utf-8?B?R01iNnVRV0xGQW5acGgwcDhReThkOWFhRWxEWG92aUdvOE5Zb3hvLzFyRTlD?=
 =?utf-8?B?UUc3bVlURTRiUUJESWFXampQa3FCTGZ0OTQzWmRnOXRBSXkzZjhVUUs2R3pQ?=
 =?utf-8?B?dDFxdll6RDFLOWJKbnI2Y1F0dmdqRHJ4dlBmN0tORnZjOWpUTXh0a29PeThB?=
 =?utf-8?B?ZXVOUEQ2Z2xnWE9TSzZvL01qRkZCRGluWk44dlErZ2ordmIzRkRETjZwSHZa?=
 =?utf-8?B?cTY5dHEvY3hOenRtSzdIbDk5c1lCZGUxcWhDU3VWYXdsMG5xVmlwOCtuZVp5?=
 =?utf-8?B?RUZTWU9yZnYzWUtnK0I1RjIvUHNXY0NzeEF2dEZ6YmpILzNZRDZ4aytwdjBT?=
 =?utf-8?B?dC9vNGNpT0tXK3h6WjIxMnFuTDRCa2xPcVk3SktobWM5Y2RLYTR5MVIzTEZK?=
 =?utf-8?B?WHRBMElUZU9xdzcvUlhKZ1dUUmZNTVhON1BVcGI5T0hVeDAyelZrZW5NZnNZ?=
 =?utf-8?B?NzJGSUp1RWMvUXZPaVo5QkZNajdJUFFOWlZRUGw0WWREMDdBMEpoT3B5TE9B?=
 =?utf-8?B?bi92cVpYeHBhamM4UkxqWlROcnN4RHdsaEVZdUE5RUhESjhoaUMrNnRxZHg5?=
 =?utf-8?B?czJkNU81L2NZVEZkQ0ZxZHYrdVc3bkRKeEVyQUVGL0o4OUZYZnJQT2NmRXJ4?=
 =?utf-8?B?cis4Vm01RzBybnJDc0UwOUxGV2k5Q0JXbklpUXN4NjlwSDA3Mk9kamw4OTlT?=
 =?utf-8?B?eGs4aHlIeDZrczVLZWpsRFZ3Z1M5QTYxUjRLOTFESWdGOEpScXF2YUdnZW9z?=
 =?utf-8?B?bTFUdWRKT3NERVcyT09IbEsza1dQT1oxZUowR0RNa0xOOE9rUEd0dVFNOXRp?=
 =?utf-8?B?VjM4a2ExMUQwdFVrSjFnaXpUcUYyeVBES1dFNzRWOHlqYWtrMjlBWnQ3VGRW?=
 =?utf-8?B?cUlnNlAzZVUxRmI1Uytuc1Q0aVBXMjBBMW92RFRXR05BQWFZdzNFdXFpQkcw?=
 =?utf-8?B?L3hrd0JuU1VoVWRKZi9KdDRRbVROOXNGeFgxRmFzRkdza0xpOWFWSTFESGhr?=
 =?utf-8?B?bEdLUHFZYkRNdmdGVFV3OVlPNTFkbXVoN2ttcW9yZlZrZDNkeWRpNXdSb2Q0?=
 =?utf-8?B?NEh4MlZjczlZUkR2WXpwVzViNm5PYnhmM2JYUklPYjIrZWpTYk9rZUYzdWkw?=
 =?utf-8?B?SEJaZE1xSkJHeVJMTDRSRmJYQzRzNzlsaStQQXNEbXlYL1JveXlybmV6SzBT?=
 =?utf-8?B?TnkvN1dKOUpoUDFjMEZsYkVkejVrWHVFdHluZGVzSzVOV0I0LzEyRmZidE04?=
 =?utf-8?B?NGxVNnNLS2h1TVhDNEJ4M01rYzNRcm0wUnU0SitLRldPTFJ4T1hlY0NIT0xk?=
 =?utf-8?B?SjVkekJtY3FrRnExeHhKSWNDeXR4TWJhN3JsVkhSOTRZK0N4VUM4S2JzOEtZ?=
 =?utf-8?B?ZUdvd3ZRMmltY3pVT3hEZjJtdE04QndzbE9CTzRDTWlqSmpieEZrWjhOTVVX?=
 =?utf-8?B?YXBTRDZselJLSWNyUFA1QzQ1ajBPUFdWYVI1cmFKQzhhelFEUjl1alUyUVZV?=
 =?utf-8?B?SVRLenZ6NFc5a1RCT0FzWlRiK1BsSlQrZ0Zyemk5ZnIyVmZweW8yR1E5bkN6?=
 =?utf-8?B?WVhzWWFhek1lZ1IyNmpISTRPcWJEcUtZSHlTaGR6UWduYzRIK2hwYzNuSlpk?=
 =?utf-8?B?azVBdzc1RFF4Ry9YblNtUkExS3JFOUhJaCs0aitZdXlFdnFxQXdxbmZGd2VC?=
 =?utf-8?B?em0rZGhlR3pweUxidm1QOHdQeS9Na2Z2UkorSWJqK3lXWlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDR1enhKTGRueStyN1dpU0VnOHdIMFB5emRkcVU1WlNVL0pkMnVoQTI0TlVG?=
 =?utf-8?B?d1RpZXN0bngzZTJYSG5DekEvZ0Zmb0l0ekx1Z1kzQkwveDM0bFE0Uy9MV2pD?=
 =?utf-8?B?UGhST2xYMUpxb2w3QlV1MnZMcU1LTG45c3RGSU4vTDA3ZDNJVHFqS2ozWWdv?=
 =?utf-8?B?UTM1R1RYb2pCNTh1cDEzRHhGeFFZdVpyUEJXbC93UUlzZVM2aXR0ODF1RjJR?=
 =?utf-8?B?ajMxd0lkRXprMWhlWmd4RXlkanhXeXUvQ2ZPUDdKVGVYcy9xKzFiV0NBRjFK?=
 =?utf-8?B?RGZuVUtRSURKUFJmK1dQVVZoVHNESDhFK2xGazVxa1U2TUhUcFdadC9tS2Fa?=
 =?utf-8?B?WU1HcTNCZmZYc2EwRDArait6OXVUTTkweERZUGJKbndUaEtWb1ZMVlgvVk5I?=
 =?utf-8?B?alN1YVd2RmVwdEtnRnJLY3BVaUxRSFpLZUdIVEI2Q2IzaTVqdHVaVEVQNkhr?=
 =?utf-8?B?T2Nxc3ppK1BpTHp2MTIrVTYvSWFWQytwb2hyTkg0a0F5S3JlUTlUU0RNYis2?=
 =?utf-8?B?RVQ5cE15aW0xQmZzYy8yK3JBcHdESXdoU1VUVzBlZmdLVjdvb2twSCtJQUlV?=
 =?utf-8?B?dFdKc2NMdkF3eFMrb2lZMmRkejIyNlVycFdWTDE5TTBORnZPWFhITEFkNFpi?=
 =?utf-8?B?VUFsblg3OWprNmVGUVF5aTI4cVRURkxLRkk3Z1ZIMnNSaWlzS05rbmdhSjdC?=
 =?utf-8?B?em9FcWQzSExlRXdIQnB3cERoY1oxV3BUUDZJOW5ZK1lRNHpXRmcrSkdUYnUy?=
 =?utf-8?B?OXB0eEUyZkN2NmtjZTJJNVdRSGZubE9qa003emlPT05PelRDZTF6ektLczVM?=
 =?utf-8?B?bXhmVVk4SlBOczFFNS9NN2hPVU1lY2s0U3VBZWdtYWI3cXVxREh2S25LMTh4?=
 =?utf-8?B?eGRiYTh0Ti9UdlpJcmh1V1UrNWNqdHE2UVR3a1NTMTkvRXE0OElQRGRXMmor?=
 =?utf-8?B?MWNOMnFEWWNLeWZ6QUVIR0VGTVVKY1puUGxxR3VpWFNUY29Rc2RXaFhtbFhZ?=
 =?utf-8?B?SlN0QzI3aEF3cm14enJLWjZLVm9GUnJiQWR3bDVkVlNhT2grb0pPVWxvb0dK?=
 =?utf-8?B?MDBHWUoxRHkyVXI4c0NIQlkxSjRmMTJmVWNUemJaWlZlVWhOUTZlUlZOR24x?=
 =?utf-8?B?NytOQWZNWko2S3NDVjNsaTlyVVNHbmRrZXRNMzNJQjVPdDROZjVWY1MwcjUz?=
 =?utf-8?B?UG5mYXFHSUc4ZThRbEttbXd5VjRFRTVYWFhCQzRkTlJ4VTc3c3plZTYrekdu?=
 =?utf-8?B?WjBPLy9KSC92K0MxTzVJajNqUklxeDdidDBoQklJcmU2SXVLUVdnN3RZejlv?=
 =?utf-8?B?R3B1RmE2VnA2czhJNHVnUENTMkxjcmRjQjVCZFNlQTNtNUVGcURwY25vQkdj?=
 =?utf-8?B?UmRtcjNuQVZTN3RCbkh6YThwNHphWDBmUnowWENBVHRibTJFWnRYNjlPeSsv?=
 =?utf-8?B?RXRPbTdwaWd3ZjJoallzRVIwempuWFl6cXNLUUdGbmEyWVN5QUJFSXZzQWNP?=
 =?utf-8?B?NVI4TE13byt6bEpxQzVPVlZJc1JVcHZ2WlZ1OWhZTVJhMVpZMWpYNGZyMzdJ?=
 =?utf-8?B?OVFpMHNjdTdjaWdzWnVzM00wOU5CRDBJQnlHOGZVVldPVC9ycVpiUzNkTkZs?=
 =?utf-8?B?d3hHUE1sOGFpU1UweTJqVVQxTzVQRXdqQ1loZ25LNFZYcXV3Ym9DTmRtMVhw?=
 =?utf-8?B?bllNaVJsOVgzNU1ocVZ5Q3dUWlUvV0g4ZjdTd0h3anhod0JWU1pDUUErbFc5?=
 =?utf-8?B?WE16UUkydStIQXFvQWtSakVJU3IrbGp5YVBxZ2VpMHFZS1QwNHQ2a2F6NTRT?=
 =?utf-8?B?bGVRWCtieFJldndVRUMxL3lxdjFZTHBRUTNGRVVFMzk0R3REQVZyOE8xRi9O?=
 =?utf-8?B?Tjc1YTdlYm5haWs4eHRuSzV5TjBtdEljdHFmeWZUN0g2QUxuWUh5RGZlcFo1?=
 =?utf-8?B?dC9PanFsdGNLREVxSmtHRjZ5TnB3SC9sOFV1NlFka25POC92aHV3amp1L1lM?=
 =?utf-8?B?VzdXUVFMMHNTQmJWbzdlSHZIWGRqZGQyY3RpNjVzUUxqYmdscTl3SHRQaks4?=
 =?utf-8?B?THJYUXF2bkhYc1NuLzQ2TFF3UzRRRVFURTkrWkJwbXFNSllkSE1VZVVwNWxC?=
 =?utf-8?Q?mNSzs7ei7jBdbnGz5b+sE7kl1?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eed7fb49-5cfc-4a52-c442-08de019d89ff
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 10:22:07.2526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svGNGmTFRcMA/LgTlcyTtCo8K/XXd2yUHwr2xn0WmaJj87bqmOSWtDGKnbb9gT8zPEWYd5V/PIy38hHt9uGOgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6622

Reading from the E9 port if the emergency console is active should return
0xe9 according to the documentation from Bochs:

https://bochs.sourceforge.io/doc/docbook/user/bochsrc.html

See `port_e9_hack` section description.

Fix Xen so it also returns the port address.  OSes can use it to detect
whether the emergency console is available or not.

Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/hvm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 23bd7f078a1d..0c60faa39d7b 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -567,9 +567,15 @@ static int cf_check hvm_print_line(
 
     ASSERT(bytes == 1 && port == XEN_HVM_DEBUGCONS_IOPORT);
 
-    /* Deny any input requests. */
-    if ( dir != IOREQ_WRITE )
-        return X86EMUL_UNHANDLEABLE;
+    if ( dir == IOREQ_READ )
+    {
+        /*
+         * According to Bochs documentation, reading from the E9 port should
+         * return 0xE9 if the "port E9 hack" is implemented.
+         */
+        *val = XEN_HVM_DEBUGCONS_IOPORT;
+        return X86EMUL_OKAY;
+    }
 
     if ( !is_console_printable(c) )
         return X86EMUL_OKAY;
-- 
2.51.0


