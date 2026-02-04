Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLMTF9JVg2mJlQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 15:21:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6B9E6FDE
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 15:21:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220566.1529231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vndkO-00070Y-IS; Wed, 04 Feb 2026 14:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220566.1529231; Wed, 04 Feb 2026 14:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vndkO-0006y8-Ff; Wed, 04 Feb 2026 14:20:48 +0000
Received: by outflank-mailman (input) for mailman id 1220566;
 Wed, 04 Feb 2026 14:20:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hC1S=AI=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vndkM-0006y2-Jq
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 14:20:46 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1a762b4-01d4-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 15:20:45 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA0PR03MB5387.namprd03.prod.outlook.com (2603:10b6:806:b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 14:20:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 14:20:41 +0000
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
X-Inumbo-ID: b1a762b4-01d4-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cl/cnW8CNADFT1I9dswLkvVheLb7Ql6JlIyh+tlQJZgtuluQaLZbX+6CB0fA4JgEG0pYByTUQvYZewFep87iwlAOWpweJnRpLxVQQEuAKaCCghYpOBh0NPHb2Jelv+xMGx2Fg5k15hZU6+foPO5C/gixdMtDf42n33O3ZmnokPIQJP8Zum2SY4MFods9SyLEdj/I9OxQ838zfxP79/2Ayql/eGdFKIDOrDxEuqLXWe85/0MXoWlFh/0O630c3d5LA3OS0eXdCOqxv62ic8xGOQCip2qih54920uHZvDCh0nTklHIDNVx5bEGazl8nNap+Xn6Kp6PRuFtR7GkNvnMdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cngoLaHDWa2aLp8T19FF7Nox9rQNOz6kLyqOREK9uHU=;
 b=nUxjpA5XD7fYxQmjEngXoATKL9BHTYmA7v+VrQaMS6pc1rLdJZQRiP9v+fuY+ALHdhG1L+yiPKUdyqB5bUIhaqae6ULrYzhG9gcKlf0bp13AAzDtGbvJuV7/dC9XYUPEB/kTmqWRZO6CzZpb6hTEStkinEvfmIDxpxnpK8/thFZnavqoR4nIAUvIpLV3QSDG7ZUmWgLQHP6yi6eol7maAt0zP6w7XHrLH2FJPjMp3i0V7rDdk/j69T+KDjCZG+VrMbCKItWdfWQ3CMkCbHaDzdvwJ2VgBi/wpYYFGAAz0AlgjlOFp1ZYJMnZvsgHntqmGQJsmbp3m4VLck0Bx3J7gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cngoLaHDWa2aLp8T19FF7Nox9rQNOz6kLyqOREK9uHU=;
 b=DV0ZgClUpSsSReafdQv9ob92R12vbglxvRoikXkWI/h0s56RaAqQnXtcsmHU6XQbUINt1spZpsHgUjVbC4IM7z6t7M/uLHbmXYHUTKdMLdd/AZqWaAQrrvd5xWJ7ehx+JPeTR8jHz7w72UMb/MBS1z3i/EYZ0b0YcsISzl216Gg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cc8f0f84-fd5e-401c-ad71-ab5a10f21fa8@citrix.com>
Date: Wed, 4 Feb 2026 15:20:09 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260204122553.75711-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260204122553.75711-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA0PR03MB5387:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c7f83c-d0e8-4d39-7813-08de63f893ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2l4VUEwRzdsS3hMejRxZUNCYlNKdEpSQzAxVXhNRzVoUVdsb0NMZ2RDaVU4?=
 =?utf-8?B?NVRNeWxVRTFKalczSE80MU11U1BRYS9NQlZkL29jdGJWNkFGdkszUWZlZ2w0?=
 =?utf-8?B?QUgySm9Ia2FyUVFwcjJERFRMZXdidXgrbGpKTGpuNnp1dFp2amJuNGRhQ2VL?=
 =?utf-8?B?T1c3V3R1emlBS2ZsdDJDaTJDeGtmS1Y5QmhiV3B3bDc2ZVZwYXlzbG12cUxL?=
 =?utf-8?B?WEh2RFJhcnhkdnlFUXVYWWlsRmIvZ212Y0JBM2d0aWFqWWdKL1RjZy95a2VD?=
 =?utf-8?B?QVhXRjJXN0hxeHJGVnVWVGxIdzRTMVNHV0E1NWFPRGVmZWN3dUZOUXdVTmky?=
 =?utf-8?B?UjdVc1BlYng4THlBdW10RDg0bGJpdkdWMW5EbW5FRzZySkR6amtxck9VL2lo?=
 =?utf-8?B?MXNTVnNLNUhSY3RRcHJJOEJORlUyaHBkU1lQSzd0UWkrVEpZWFlOMC90V0RO?=
 =?utf-8?B?bXFXSGhTMmhyS1FxOHFIZnRoOENhazkwNTkyNkF4QWlzL1oxNURQNUxmc1Na?=
 =?utf-8?B?UnkvRGJhZWNhVkhlSXJoTkNWdjY2ZEQ3UDFiWHp5TzhFY2dsbFZCYjVDdnhj?=
 =?utf-8?B?eFRkbk1xUzdLN2Fna2VUbXhWUWZyOUd4Mjh2YjUvc0dKdXd4SFk4amxyZ05l?=
 =?utf-8?B?TUtmTXdtdU1QL3UxUnRGMXNOTHpZRmt4MW5MVGRGVUI5b1JmSzhiZTBDaEVX?=
 =?utf-8?B?VVdDc2lxSk5QUW1scnlQV2ExMUJ3alZldHpXRVp6Y3g3ZEpCRTJtNng2MUcz?=
 =?utf-8?B?cEcyTVJiZzdxYTc1ZUpLRWFkT0pxTzQ3U3g2bi8zMElrTTdwSVE3NW1TVTZD?=
 =?utf-8?B?U2NpdUUxWGgyTkF2cXkyWjF0Z0kvbzQ4L3hjb2hES3NvVUJkd2NYU3JhZ0xi?=
 =?utf-8?B?eUsyemVYUFZxbC9GeUhzZFNSZHAxbkxXeHJqL1lZa28xWC9KV1Y4QTJlbG9i?=
 =?utf-8?B?eFl4ak5Od3N4SWtNVjljZXJqWkJucjc2UnpIRmh5MmpHOXlCdXdDQWxBemdM?=
 =?utf-8?B?RzB1L3lQc2pHODZRR3VjV1BpQlBwRGMzbUErWDR4VFJHY1NscmcydC9CUEtV?=
 =?utf-8?B?OU85cHBxejEzUTU2akt1ajI2N3JUeWpmdXR6bzdJSWRvVVNyRTRVWFVTdTlQ?=
 =?utf-8?B?OWE5Zzdpc3pwbmpJOW9Lc090TEdDTURQVXBpTjFuV2FESEFWcmRoWkxucU5S?=
 =?utf-8?B?cit1c3ZhYjBXZnVWNmJ1c1BsdWtUUVc3TDBPQWJ1WmM4ZUxBK2lHRkcvT0FI?=
 =?utf-8?B?dEdaTWxyaTRZQnc1cFR0WE5qNmxYQmljc01hY2x2WnNqdnJkVm9ua1ZmdGpq?=
 =?utf-8?B?UXFHL3Bob0tyQVlBR0laUE93VGoxbCt6SnE5T3hwdmlxSDNQbmxhNkJLSm90?=
 =?utf-8?B?eTRvai9PT1pQM2lUa0k1R3hnZ2xzKzZyQ2ZaMG1YdTBqZGZjWmpJUkVsRlor?=
 =?utf-8?B?eHVSYm9hV05Od0U5cXd1cUMvRElSSUovTnQ2SDFlMk5EYjVCSnNuNVgvb1or?=
 =?utf-8?B?VTJ3MFhXNVNsQ1JJeWJ4a09ZR1FWcFMwSUZVLzRTS3V4REQxUU9HdkJ6M01t?=
 =?utf-8?B?L3c2aDdRaDBiL3YzUUJHbWZTTHVGemJYenpOekpJMnh1d3F4TjR1S1Y2cGpx?=
 =?utf-8?B?dmkwalJaYTh1M0xJaHhHd3lZTHJMcFNCNE9tQVZEYWRreDZ0aUU5RUtlcjVR?=
 =?utf-8?B?VlJRU2JjZTBNN2UrN21KdWgxMFZZejJaTk02WkR4QWt1RmQ0UkdLVUpBTzNh?=
 =?utf-8?B?MWNOb2lYN2dlOFl2MWJ5MFRMUUtQaDJEQ2dwYXU4Sit5MnN1ZGtzMlpFOTkz?=
 =?utf-8?B?bnFEeDdYNUd1VEVUeUJwcHRoTUwweFNYV3EzakJKMktoTzhiMHIzSXB4cCtj?=
 =?utf-8?B?ckdMYWo3UlFNby94LzZ4N0hDNVNGK1drZjQ4S3lEOWNYTktCTVVFSyttajhS?=
 =?utf-8?B?K09OYWpyZjZhaExINnRlRnN5dUFuUmFPeDdqM0l4MEt6K05DdkZ3M3YwMXdK?=
 =?utf-8?B?aE5Lenl6bFA3clQ4WEM0M3lwNVBqdGlPUGlYZ1JwOFBtUWVQOUg1WVZqWWVx?=
 =?utf-8?B?OWpFWUdENkJqeTZTaElMaXNBcThUOHEzWWdUSmFTWjk0S2dEbTlVa212Smtl?=
 =?utf-8?Q?p2vA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2M1eGtvUHo2VHNWSi9zSzFhY0VjZXRTTUpQNkFNclRUUS9qaC9GZU9PRWFY?=
 =?utf-8?B?OTdaR21lSHFtbjhpRFpoelkySUI0WlQ5OTBLVHlSWGNpWlI3KzhWSm5FcjZp?=
 =?utf-8?B?RlhoaFVsUzV4RGl6blQxNHdIWVdjN0pzdk5CdUcva1k2TVlWTGgxeUp4NjlD?=
 =?utf-8?B?NURnK0hveHpUYWpJZWhFWGhyZHUxbW13MTV0SVRIMUdudEk3VVlCdEVwVDd1?=
 =?utf-8?B?RllKK2QxbU9ESklpSlQydGd6RzlKVnlLR0ZpeVJBZER3TllPRWtJYzF1SDJh?=
 =?utf-8?B?OEo2cFdacTAzMkROL0QrQVhrOVNUOFRHd0RHUnBjTW5vYTNzbGRaOWVBcGlv?=
 =?utf-8?B?bXFDSFpObDV3d0sxdko0aTNLYjdUbzBkaDd1T0JBTVdsaTlObDZuSHA3MFA1?=
 =?utf-8?B?RW5uTWdHdk54aDYyVDRYRGdyL2dWVTVQdFNTQnRyQkQ3UStaVHA4N1pOMncx?=
 =?utf-8?B?UGsvM25GMTlSNEpGWDBKU2VGbjB5NVhwMDlPdmI3NHhSMWd1ZWpoZnBNbjJL?=
 =?utf-8?B?cTlMV0xqeHVTUmRIalZUUUhpT3BpK0pNSURLSU5CSG1MMmVvTUJHNThibi90?=
 =?utf-8?B?WXRTMGdiY3g0NStnM1JQMHQwM0FEbGthZ04yY1IrdzVXZHFrcjVzR2FWcGdS?=
 =?utf-8?B?R29xdVA1Yy8ybzZFYkVSZGJBQkNMQkJ0SGZCdzJmY1RraE1vM3FnZU4rT25V?=
 =?utf-8?B?WDQ4ZlJoMTg1WFRjOHMyQ245dmw5Q0RVUTlnQVVzaVR5WktmRmx3MjBweCsv?=
 =?utf-8?B?bVZIVUlpVVdmYWxHY1p6REUyek1TQTJzYkJkOEMvT1J1L24vYUlQQ2V2RnN5?=
 =?utf-8?B?QmlXS0JOUjZIbWlNa0xOcVRCL3hGOG1Hd1NUS3l2QUFsZ1NqZm1nWngyRXpM?=
 =?utf-8?B?MnhpcnpQWEFNMmU2MG1EaGs4cm1kK0srN1R5K2VqcXk0VEdHOHRUc1pXY2NC?=
 =?utf-8?B?SmhiTmwwYVpIQmlpeG94bFhsMGVoYkcrMyswemdjWkk3TDZsZkR0R1dEVkc3?=
 =?utf-8?B?VVl3Ly92cWorWWhaR0NGWmlOaDlZdGZJQm1SYk1oTngrL3d1c0hrbTBYa1lp?=
 =?utf-8?B?U1ozNHlYdXZpY1lPckhmVGlOblB4K2xvOU00SmR0b1QxTDRwcUluc21SdGtF?=
 =?utf-8?B?bTAxSlRvQ21iazFpMHJLWnl4NkRGWGszYmt5RHMvaW1QdHp4Z2hmN2FJZ3BL?=
 =?utf-8?B?Y3FnRDAyQllXNk4zci85Z2oyclpTYkhTZTIzM3d6c21RMEhqaWtvaUMzYjc1?=
 =?utf-8?B?LytoR3kzWlZBYVBybkJoNTlURENQZFZ3OU1IeTRNNkR2a09iblFWZzJqNWxw?=
 =?utf-8?B?bVE3S1NEQnJpZTFWT0lzd0xqWURhV3MvamtXNmNFSjRJZ2tDUW50RGxqMldY?=
 =?utf-8?B?VzRzNmZ4Q0hWVHhzQTArTkpTdWxRL2tOYlFQU2FnMzJseWx3UUl3QUdzdDVh?=
 =?utf-8?B?U0srSjBzMU9saEkxU2sySStqR3FYR0lKZkNtTlkyNGRmUWpUc0J4OUh1NFla?=
 =?utf-8?B?b3o3OTVKVGkwSmRlSUYremY4eUlMc2l3bFB4ZjBDYzFVRzRjNzZSZ1VhRzE3?=
 =?utf-8?B?VkZBV2kvRk9DRWR5UldpaWxkYVhwWVM1UE0rWWwrVGY4UDhUWURlVjdlZ1cv?=
 =?utf-8?B?SFZnazNERGJvOGp1NHZqN2RBbVJEeThhQlFjOGt6eXBxTUtEQzZyOTBNUkFU?=
 =?utf-8?B?eEVRTk1iamlicnN3eXF1Rm1yYUlybm5pQXR6Lyt6NDJzTGRJVDJsSWlnZUpp?=
 =?utf-8?B?dE91UXU1ZWJQeXdGNjc1ZElmeG94VmJLZ2NKd29ObzdLSDU3MUdnLzVxdDRp?=
 =?utf-8?B?bmgvVC9QSmJjbCtvdG9hZlZqM0FpRFJsNytsV1FQTngwbnZUVUZ1RmgrcGxT?=
 =?utf-8?B?NGdwcFNLbVpWcXNZYVpoNFZjT2xpVk9aMy9Zd2tJMWpUS25PdmlLOXhja3Vl?=
 =?utf-8?B?WlRmV2lvOWJsZGZrMFB4ZGtBTVFKZC93enVrMENkbE5yVXRSelhzRXJidUhR?=
 =?utf-8?B?TmpxWlZKeHpYb2NzRzhtWWgyclNzbksrbEE5UzNtZHZaMTRFSjB2QkdXdWRI?=
 =?utf-8?B?aGd0ckd5MjlWQmpvSEZyMXF6RkJQb20rdVBNY2NITWZid0t5czZtUlRKN0tv?=
 =?utf-8?B?ZWdWaFpISUFRNDdqZk8vMjhzZ2JSMnNlb21tTE9tUll4Vy94S3gwdWlKNHRS?=
 =?utf-8?B?TDNtSUhWc05DVnA1V0dWR0tRRTA2ZnRERk9kN2M3T1poSzdta1dOTWFGUDR1?=
 =?utf-8?B?YkJPdmNtK0JmQmFyUFVoNVFlcVRjNDR4VWdMZ01iRDMxcUJ1ekY4QnM5eWpH?=
 =?utf-8?B?M3pyemp6c1A5bCtOUitDcHNhOUtJVXRLVFFhWXJLNTE2ZklScHJVUnY4UnZK?=
 =?utf-8?Q?lZX4d8mqIQ8T1iZU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c7f83c-d0e8-4d39-7813-08de63f893ea
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 14:20:41.8671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GLF7htbrOqPFlfRmWQ1yeYQHZfWckEocAozmplwX9/zYjQECwH2GofAPKZP4cDKLICUuALyqeFIKVN4lW8s3Xo58rcGO4gWzYkTfXQWEc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5387
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BD6B9E6FDE
X-Rspamd-Action: no action

On 04/02/2026 12:25 pm, Roger Pau Monne wrote:
> The limitation of shared_info being allocated below 4G to fit in the
> start_info field only applies to 32bit PV guests.  On 64bit PV guests the
> start_info field is 64bits wide.  HVM guests don't use start_info at all.

All shared info?  HVM does use it, but doesn't see the MFN.

>
> Drop the restriction in arch_domain_create() and instead free and
> re-allocate the page from memory below 4G if needed in switch_compat(),
> when the guest is set to run in 32bit PV mode.
>
> Fixes: 3cadc0469d5c ("x86_64: shared_info must be allocated below 4GB as it is advertised to 32-bit guests via a 32-bit machine address field in start_info.")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/domain.c    |  7 ++++---
>  xen/arch/x86/pv/domain.c | 20 ++++++++++++++++++++
>  xen/common/domain.c      |  2 +-
>  xen/include/xen/domain.h |  2 ++
>  4 files changed, 27 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index edb76366b596..3e701f2146c9 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -882,10 +882,11 @@ int arch_domain_create(struct domain *d,
>          goto fail;
>  
>      /*
> -     * The shared_info machine address must fit in a 32-bit field within a
> -     * 32-bit guest's start_info structure. Hence we specify MEMF_bits(32).
> +     * For 32bit PV guests the shared_info machine address must fit in a 32-bit
> +     * field within the guest's start_info structure.  We might need to free
> +     * and allocate later if the guest turns out to be a 32bit PV one.
>       */
> -    if ( (d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32))) == NULL )
> +    if ( (d->shared_info = alloc_xenheap_page()) == NULL )
>          goto fail;
>  

The comment is now out of place when the source is read naturally.  I'd
suggest dropping the comment entirely, and ...

>      clear_page(d->shared_info);
> diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> index 01499582d2d6..8ced3d70a52f 100644
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -247,6 +247,26 @@ int switch_compat(struct domain *d)
>      d->arch.has_32bit_shinfo = 1;
>      d->arch.pv.is_32bit = true;
>  
> +    /* Check whether the shared_info page needs to be moved below 4G. */

... extending this one talking about the 32bit field.

> +    if ( virt_to_maddr(d->shared_info) >> 32 )
> +    {
> +        shared_info_t *prev = d->shared_info;
> +
> +        d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32));
> +        if ( !d->shared_info )
> +        {
> +            d->shared_info = prev;
> +            rc = -ENOMEM;
> +            goto undo_and_fail;
> +        }
> +        put_page(virt_to_page(prev));
> +        clear_page(d->shared_info);

I think copy_page() would be more appropriate.  That way there are fewer
implicit ordering dependencies.

> +        share_xen_page_with_guest(virt_to_page(d->shared_info), d, SHARE_rw);
> +        /* Ensure all references to the old shared_info page are dropped. */
> +        for_each_vcpu( d, v )
> +            vcpu_info_reset(v);

switch_compat() can only occur on a domain with no memory.  How can we
have outstanding references?

~Andrew

