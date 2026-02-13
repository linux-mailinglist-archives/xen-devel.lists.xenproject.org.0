Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3t0bBV52j2lERAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 20:07:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572A013918E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 20:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231714.1536750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqyUw-0007OE-0I; Fri, 13 Feb 2026 19:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231714.1536750; Fri, 13 Feb 2026 19:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqyUv-0007LG-Tj; Fri, 13 Feb 2026 19:06:37 +0000
Received: by outflank-mailman (input) for mailman id 1231714;
 Fri, 13 Feb 2026 19:06:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqyUu-0007LA-5M
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 19:06:36 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a72f001-090f-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 20:06:30 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA5PR03MB8404.namprd03.prod.outlook.com (2603:10b6:806:47d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 19:06:27 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 19:06:27 +0000
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
X-Inumbo-ID: 1a72f001-090f-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYv4ajBsbA9qf3zmRc3UQGlwiFP2BsguaXIXWCl4o6LYIs9rl8sA1Lf0SqKmJxeuWM3j3h80yKxIKEPZZpQc2bzkyE/kjDCfv30nsQaKfP0CjBMSINo6tNTIYq3IcOA6povOJcyHePdYFypJbGvOvBZpM2jatLQtFdF0rwuuVwR4F/e+t9VcbqCmfZ1KvweKhQau23hCuhQPy42YZ7OAVgbR5I7Aj9DMgXUZfRI0Mt4Mlz6GuJ+8j9zh08fkrWO2+wembxU8mO4iaK4ru/naY2IulNPkG2mZIcrW/anuYjpWQin1HvtGqCX9XxKHgsJZo+EV71WDwoQ+Oks6xzRS0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqIQfQm3PDBmFuYCg+nrp5yXVMcn/GZSwOeoXiyaeC4=;
 b=p6btQZTeTal/K39KIt31fEXIP2BKaqRM7hCDi/Hs/vLcgPmmxurY/JY0cG7+eybp1lNBS9yYmMFaas/dKwp8VgMvnQwgCKsaaYgzYZXucjq4pgncWmZ3Oz32UUoB4wNc7R6B4iUbVAfUSbXAQwrfHOMIJwiF5ZNowFjFnKZnaTOZXkv7SXhcezv9EbJ5VI5HlPWy0BIOfueMu7Ip4QCZp4yl4QsvowW7hWxdVzLV8o5+KD9oD9XowYmV/Tb3UfCQUKqZWpeaZ2+fuiFTjXLAlI65uxnS4Td5WRO07nGX2n1uv1Xrk0GYCGREtMXyBYrldx2sh9XXeisx8/h2TIX08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqIQfQm3PDBmFuYCg+nrp5yXVMcn/GZSwOeoXiyaeC4=;
 b=rz44ufFIvplvqYKxojID1R0EeV+96TMAYdpZQWct+pQf6EXXcO6m6Y0kHvp6K1qCOPIZVKHvcIZSriZE78RUj5wdcQdsDA5kkM9y5z4kO3JCAxIhsBhHn0Z2g7ip9M1hO7sk51bDso8MKBCxoOsO9J+2if5iy0XYHl8vujk1Gm0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Feb 2026 20:06:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/bitmap: Drop unused headers
Message-ID: <aY92LyZZ6ngPfwbY@Mac.lan>
References: <20250510131245.3062123-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250510131245.3062123-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MA3P292CA0016.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA5PR03MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 9238179f-c5b9-4256-9e85-08de6b32fd0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUxEL25JWCtjQkUxS3ZTWEgrcWpsZDJVUHptR2JIRnJLaHFTSXNTYlNkSWlu?=
 =?utf-8?B?Yi8zcjJrYTJrMERtVHFPZTlGcWcvSkNwc0Zuc1l5L1B1Snl0WTVVNER1V2w2?=
 =?utf-8?B?dnpvUGNUdW9rZVpYUUlVY2tJRGJ2SURsMzN6b3VVUjhMQTZtZDdMM0ZwUDhi?=
 =?utf-8?B?MVEzcHZtQnF6YURVbGdBQVJSZXlNNXNBenZZK1F0U3JyRmFnekJ3YnduL0lX?=
 =?utf-8?B?RTlyYk45VnA2aTZrWFUvUDJTem1TenJkNEE3Z0VPUHBVK3BNQTJOdmVhdGJN?=
 =?utf-8?B?cnRLa0FPenZnditoT0QrbEZXK2p1K1RlNEVnMnhEOWluUVdZZjBocEJxOUhR?=
 =?utf-8?B?Nm9JM2h3c2NWVzJNQlc2ZFBnTmExWTc3Tk83ekxWR0VEZm0rQk9WWWVHQ0xW?=
 =?utf-8?B?OXc3R1poalN6WHhLMEoraHZOeXArbDNpUlQ3UUEyVXFncU1La0VSZEVwTHZM?=
 =?utf-8?B?bTBRT3QrajBxREdNd255cUpOK1YyNnBBNjZvTGtjY0RRdnp3bGlvcEFrdGJC?=
 =?utf-8?B?N1lBWVNILzZKaElidTRYVElIVS9DZXpONERRV1FkNVhoU2NSN3BUby8rbFZ5?=
 =?utf-8?B?YzZBOTJlY2prODVnK21yb1BPZ3hkRjBPaDg2dGh1SXdtNlBTN0lrVm5aZ0Zv?=
 =?utf-8?B?dE5zeXpJNHpIV05SdTdtK2l6N2VuTHZJbHI3NGZTL3NYcDhKWGhNbkNKYVA3?=
 =?utf-8?B?OTVHQXNocmphdGJTUGN0SDR0dDF2d0x4T2tGV1BFMUlqZnRENkJOcGpmUWFX?=
 =?utf-8?B?bmdCWUM1NkMrWHFTcTcxdTk1NDlTelI5MzcweXRlVytvZmZjaFpzUTNyWWY2?=
 =?utf-8?B?Q1RBd1FwR2lFTithdDBDNDBJRzdHM3pQV3hVRHUveGNRcGlvb3lQaktjVTB1?=
 =?utf-8?B?WE96Yk9WeGxscmtwZ0FOSXBESE1wSjFQM2VCSGpjc1BRZVl4Z1UxS01rUy9H?=
 =?utf-8?B?c1Bwclk1SGlxZ2ZmRkhzMWQ5Yy9iVDdzRW1jU3JIeGJva25OdXJEL0p4RXFX?=
 =?utf-8?B?TG1BTFFxNW5mbXdGMVlGVHBObXBLN0N6b08xWTBqWXZKZDUvT0xhL1pHSDhX?=
 =?utf-8?B?NGZSNXpaME5YbW9oK0NqWUllVjVLWXdCeDI4cnBkcHc2cjk4UkFyVmxndzd5?=
 =?utf-8?B?M0lqZ2RRMWFzakQ4c0FsVGZWSzFPenF2VndPZU9QdmpFYTBscW5RZlo3TFZv?=
 =?utf-8?B?bkNGZzZjNmlJMVFscy9XQmRDZjkyQTZmb0lsT2xBRmVHb0xSemlOcUtrdHQ3?=
 =?utf-8?B?aWtoUXpTWTZZYXlkWTJTQlFwbS9zM0xSYVlGTkZSbGpXdjVMNVZLblVrOWVN?=
 =?utf-8?B?VVFzRWRBUGQxc3FwUHJmVjc4SzM2cHhiMnY2Uk5PL0hXR0pSdnJCYzNWZm1C?=
 =?utf-8?B?RzF4QjZqeDBULzJkMDFGa3d3Y1k3MWJ5dDhJSy9xZEJteEFLVjRLcWhkMHc4?=
 =?utf-8?B?Z1hHc1dWUVlEMGVQYkZTZnZhMU5KcEZOUGg2bU5tcFlKYkdDTXgwejNSU1ht?=
 =?utf-8?B?RWNiNTRiT09VeVVzUEdPRnpxUHh3bXlid2JaU0YxWmJXNlg4T3lPTHVCclBC?=
 =?utf-8?B?bW1ORWE5bTdhd3drNThqdWkzQ1ZQZGk4dkZ4YVVFQzFkVXdzYXdJSEpvOTRy?=
 =?utf-8?B?UnBoenYxRnZrdm1IU1lBQWlkTkdoWk5LRnROWTdRcEpubUQ4UmFhaVplZk9Z?=
 =?utf-8?B?dzRHaFdwaHpYcFpKYVN1RTlucU5HY0lWQ0UxS3VSdTZIajY5QVpaSzRmTFhN?=
 =?utf-8?B?U2ViOUl3WkNQYlEwM2N4aGVxaWpJQWsyd3BYcitLKzlZc0lXQUkyM2dNdm9t?=
 =?utf-8?B?djdJREdZVHFnL3NvejQxSzFGRXNNSVZMUUIwZUF2S0xERjMrQ2NGS1FOWkd2?=
 =?utf-8?B?V2RsTG12ZFJrWHRRdGZkYXZxOXhRY0g2TjdVR3pIUk5pa2M5b3BPWXJ0bE1C?=
 =?utf-8?B?NGxSUnYwV2JYR2pianp2NEFxMGtwbkVHeVJMRENUQjU1QVVjdXhLUWhZaVBN?=
 =?utf-8?B?WCtTUDBlV21FZ1VqbjBPWVZDb21HQmlxRHFqN3VQMDZHQWsvM016Vm12NGR5?=
 =?utf-8?B?YlI5cE0wRFZXVnlReTRTbnlvVitTYlNOR1QxNWpCOGczZG1tcjM2Zk0xNHBm?=
 =?utf-8?Q?DeCA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1haUWRVeGxJREJRYU5nYXZjWFBLbzcvbVg2NVhIV2ROMDBreDBoS0Z1dmFm?=
 =?utf-8?B?OVU1dS9HKysvS3ZQM2tvTWJRT21yZU9qMmFhMzlUTU9EOFBtZUcyQU9oaFlP?=
 =?utf-8?B?akVGTm4wc0ZwdiszSzVzQkJ6dUtqN0N2V25QM2UrQk5IZWV3TFpzcWIycy92?=
 =?utf-8?B?MC8yZmc0VGhQdW1mRzZnMWhqWnlEa0VkOEYwckhLRjMrRXQ1VElkNUs5Yno5?=
 =?utf-8?B?alo0SmttZlgwa3pIVmxwcXZ4NDQ4SzRScU1yeEkwMlRkeHlYM3FuYVFiYTRt?=
 =?utf-8?B?cEg4K1FIdksyTTUwQld0NzJuVDRyQm1DSit2dXZQS2w2eWY4K1o3WmN0VXZr?=
 =?utf-8?B?ZVVZUlZHMjRndnJhRTNZMnpaa0tSek16UFlheXJpdm9KT3FzbGx1TzFtbjZ3?=
 =?utf-8?B?VVdyeFFmUWRiTW5kVE90Q0FlNjNzdmpvdGdTM0FVaFBhS3Z3MWtoUzFzNFVY?=
 =?utf-8?B?dk42Zlg1cytOZmxMRGhwYWoybTdJajdqUDJIS0MwQzV5NUp2Mmg1MkJaL1Rp?=
 =?utf-8?B?NXlYcG1Dd0VCdnppdXFOeU1HLzFlTWFrMEdQU2pJcGFBcFNPWk50Qm5VMVhO?=
 =?utf-8?B?VnBQcHRqWVdBNFZ1WG05T1laQ0hObG5LNzRSakRQTUtKL3NCdERTeEZ0a3Bo?=
 =?utf-8?B?WVFLODdrNDVkTGlmRHlWZnVLUnZTdXlvdU1PNHNhWTZ4bDhxNXJkdGw4RDRH?=
 =?utf-8?B?aTdrdU1LTWxFdW1KNHVOWnB5NGlRZXVuVVRlTWpERUVmcXdXeWpTNHI1VGJi?=
 =?utf-8?B?WkJWTDlWc05SY3JOZ1BOMGF4NHl6MVRYRUlOMDVyY2p0enBnUHQzQXRkMW9U?=
 =?utf-8?B?akdoeG9ZeUkrcEE3Z3AveE5kS1EzWk5OdzM1Rno1VnZONVNiVDA4V0RmM1dK?=
 =?utf-8?B?TW5sYXlzMTlPNys0cVpxcHA1M24zTzN6OEtWQkFkYmtNT0NyUEFIbGZaYllz?=
 =?utf-8?B?aHoweWFrWndHcCtxY3BxRFJ0bmdmTTQwcTkyUjZxSEVwKzJYNllRdGFmL0lN?=
 =?utf-8?B?ZXhibHVBVTlNZm5sTE1TdTZENmtEc1psUzFXcHZYV056YjM1amJFaHozc1I4?=
 =?utf-8?B?bU5tbGhiWElsYlBWQytGcW4rOTcxR1FlcXFEcFJwTkdPamVLcXJoYlYxOHFq?=
 =?utf-8?B?dmt1RGpXRUhjYmNQaHhWd0Y3YzFmWmNwRDlJL0lOS20zR2FGM1VPUVMvZUpS?=
 =?utf-8?B?MDcyTEw1aysyK0thNENCK01CeTl0RXNDRWJ0ZUZVblJwY3pyZURuMlA5cWcx?=
 =?utf-8?B?dFU5dGNqbW5LVzV6MEpUeWQxcWdqM1RsWnVDOThydXYzdUhtV28zKzljaFpL?=
 =?utf-8?B?WVlsTXVEZ1ZIL2U1UkxxNjdVTlRFa1BMQVJPR0t2K0w5RG95WXVUNVlpUnQ4?=
 =?utf-8?B?d1h4S3RXVVpXUGJ3dmpGSUo3V2VXSlhKWXBUR3ByQ0NCeDErVFA5KytBOURi?=
 =?utf-8?B?VVNSQUxDM2F6WG82ZnV6cmZuU1EvYjdzV2tINGFBOHVuUkYvbG91U24waHBp?=
 =?utf-8?B?WjB4UmJBaE5ISVpVSUlaakJPNU8wK3VUaWZjNncwMjBxeVZGMnlCNzNMcGZ3?=
 =?utf-8?B?K3FCcmtYK0Jkc050VmVVTE5laHZnK3hsOThGYSsycTdNaFBQY0dHbWtFd0xS?=
 =?utf-8?B?YkVrMUdwVmVZNnFsUHp2SGJ4NEJSeStMc0N0UDZCNHFoTU85Wit1TEl3SzU0?=
 =?utf-8?B?V0dqR2ZzdHgwZHE0bXlvMjJuWXFJRmxhWlJWeVEyUWhkcGV0L1Yrbk5QM2k3?=
 =?utf-8?B?YjhnOER6ZG1DaGpOSVY4MkxYdEhrNU5qYmp0azJKbjNkTzRUNnFKNnRwWmF5?=
 =?utf-8?B?dTRRaXFaajFlb2lBMVRESWR3NVYzK2VoRGx4ZUlsZzBiNjVScUxIa0NSRmFZ?=
 =?utf-8?B?K0V3WTFRUXRvY0JzUjBycFpnV3hUb2k2UFhndjJncU9zTCtqOFNIWlc0OFcr?=
 =?utf-8?B?Yk1BY2VpdzlQcFRjY21KbERHZlRpdmhJOFNlZ3MyRWNaMTR4UE1aZ2VwTnlJ?=
 =?utf-8?B?ZzV4TFpmUm1HLzM1Rm1EWS9KeEdzaURsVS9rbmhCTDNGQTFwV3hPc1dSL1k5?=
 =?utf-8?B?RmhlaGl1NUFlVVRZWDQ4aHpySTd5bE9sZlJsNXVORTBnVHpGTmYyZTgycDFu?=
 =?utf-8?B?bmdFdEcwUUkwNDNpR0lnS3JKbWhqenRrZ3hGMzN5K2o4ejBpQ3dNb1JpbVBK?=
 =?utf-8?B?VitVVnF4ZHZ4WXhkNnlPUFVuUkZLcGhMdlhHTVF0d2hpWjN0K05BSTBTa01r?=
 =?utf-8?B?dkJSWDIzaGY4SDcyQXoxYkExdzl0M3hJaTlSZmI0U3Z1NGhmKzErZlJ3cTdk?=
 =?utf-8?B?RUF6SUh5WG1PcmkrSTdGYlRUdVBHWC9sMEwwRUpoVW9Gd1IvUWxwZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9238179f-c5b9-4256-9e85-08de6b32fd0d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 19:06:27.3821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxfy6YibWDbfmwiZ56x4I1XVUljy9VWReXqGqUtuRrRRcA72ZxLVdzT2W2kfXI1bWv13IifTugeDfFNbdtcPxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8404
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 572A013918E
X-Rspamd-Action: no action

On Sat, May 10, 2025 at 02:12:45PM +0100, Andrew Cooper wrote:
> Nothing in bitmap.h uses lib.h.  Reduce to just macros.h and string.h.  Drop
> types.h while at it, as it comes in through bitops.h
> 
> cpumask.h and nodemask.h only include kernel.h to get container_of().  Move it
> into macros.h where it belongs.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

