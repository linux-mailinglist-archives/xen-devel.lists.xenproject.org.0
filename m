Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C0DD0366C
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 15:38:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197743.1515201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdr9I-0007hG-Fk; Thu, 08 Jan 2026 14:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197743.1515201; Thu, 08 Jan 2026 14:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdr9I-0007eN-CR; Thu, 08 Jan 2026 14:38:04 +0000
Received: by outflank-mailman (input) for mailman id 1197743;
 Thu, 08 Jan 2026 14:38:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIqS=7N=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vdr9G-0007eH-I6
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 14:38:02 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a11082d4-ec9f-11f0-b15e-2bf370ae4941;
 Thu, 08 Jan 2026 15:38:01 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA6PR03MB7879.namprd03.prod.outlook.com (2603:10b6:806:431::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 14:37:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 14:37:57 +0000
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
X-Inumbo-ID: a11082d4-ec9f-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ov//o4MfcqhkQhcPOgI4h8Yh3zKq1dAxKKUXF/9JDdMcpunBV0JAoQuU49VFwKuNkkeyEktNvzLGuh73jOTask7qAevDit9Sa2rUbPXcpVKFQWQtlt4jX1TI01KHwQtdbNNteIsKPtdGR2lXRuqxXizKWGVjMufDBZONi5nX4xVVMnUJZwnMCIwkIwYkyLAwA2movQgOeYkgNPGKqMB/9y8zWmDmg4V2LOh92zZ2vVmCA8xG8v/u1RDVi44uJiLc9zpms2vdH5NePXQZvjdMWMMv28aVi/uF0NZQa0clR24/fogmIowEkR4ZBOJUn/r93doIskwJ8Y6nsEnyCQ/8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFxlg3C3/h5QhHvzxIVc31OMINZ3mt91RFw85ov5sAY=;
 b=NnMokkGfkNRk67wswtOL8nEnLgmvE4KwwlafHtDFqmswuHHzJof+xZdtnhAKhQmscwOq08JVt+aOVK1kBclMr+YiL8Cqvoja89u/erjFPuox3KMR3b+G1RYWm72zrDcmTmh1/wt98t0ztZctFfvE4DBsphHYoq3FTUEBH0bV39OXZRNK0q4dW+oIRuX7DyUD3d1x4sD/9ICswmoNGtV3tEFO6e4FNR7uz1VvlOyqnoMuzWOvk5GTu9y6hod8QzsU5PmnT0pdpLiHQVKysbE5zUfzXJvoWB/gOkW9ymzszFWepMQRv3wdMGH7w1Jc2Wgh/jzwrsIEmLawJHxo5xNusQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFxlg3C3/h5QhHvzxIVc31OMINZ3mt91RFw85ov5sAY=;
 b=Um/mODpiX5vusgBSc2gokWdbS4o7rbrsFld1NHAOclg9R62/6ofHLrgso1hp/0FhjTnRswYBqJToD8jcqibEhvVHHYQeoJab8Yc3R77AzehO3fk9IVphMeW9ihrm2LRfMgOca4bt2qg4Erc/M6KphCbPpmEfFRM/LjFc+y1QOs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 8 Jan 2026 15:37:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"committers@xenproject.org" <committers@xenproject.org>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>
Subject: Re: [PATCH][security policy] embargo control and crediting of
 discoverer
Message-ID: <aV_BQfmy0-mpv7gQ@Mac.lan>
References: <93718ef5-bb60-4476-9936-039f11a945ad@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93718ef5-bb60-4476-9936-039f11a945ad@suse.com>
X-ClientProxiedBy: PR3P189CA0028.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::33) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA6PR03MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: bbcc0759-43a1-4b29-a14c-08de4ec383a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVRDd2ozUDgxbkgwYm96SmRINlFpWC93RzVuV3h1YjNsQnFPR3ZIMFNUYm5Z?=
 =?utf-8?B?aXJVaW5aUEI0NS9Wb2ZqbVZHc1RCdWpZVC8rbDZzbUs0c2JiOTlNL1Z0eEFI?=
 =?utf-8?B?ZHN4OHVlUXRsZmdhWk5ldVdDNE10RDU5TlNxaXJvRlorOWtWN2U5Nytsd3pw?=
 =?utf-8?B?aUZ2cUJrY0RhaERLZFdER2s4S0hYcEh4aEl4NnBERzlZSUZPZFkxQVlzMWgv?=
 =?utf-8?B?UXJPUmVkVFBYY1VPc3pEaEZoaTZsTFo4Z3J6ckRtRGZKUEc1KysrQXQ0Q1kr?=
 =?utf-8?B?clIxaEZtdkE1MDdqcjcvcGpHR2RoTXQvQWMyZzZ0WSt3UXljYmZseXQ1ckNC?=
 =?utf-8?B?UXJGUHRqTFBZMjNJWWlBMjJSWkx0ZHFtNDRiQUd1MjBRb05RVmwwenh3WjV3?=
 =?utf-8?B?K2ZXWFdVSVYrUTM4cWxaVHFsTjUxSEE1TUprMUs5eUJ3UEFSMGZlajlKZDEr?=
 =?utf-8?B?N3pCTU4xbnhOdjlsdlZ2WkYwUE9PcGtsZHZTU0VpdUEvM1g1MTJ0WGFqME9S?=
 =?utf-8?B?NTgvVmQyMGE3eHQxRjlQK00vNGJESkswK0JUaTBsREt2OSs2TEdvV3FOd1Aw?=
 =?utf-8?B?RHpoQytsVllyOEJXKzhuVEdlQVo1MytWVXNhYlQyQzlBQ1JvcWZ0N0NZNUNN?=
 =?utf-8?B?L0ZzZnVMQ25HT0Nkd0tVNmNlQVR0bm1LRFp4VjNJeXZoUkpaeVlnYXpUVVE1?=
 =?utf-8?B?UlZOR0kvTG02OUh0Q2Y4S1NrbWl6ZGdBQWRpb2trU0lWYkZXd1lzODB1WWRj?=
 =?utf-8?B?MEF6YlliekU1YjhSSjZ6WkFzNnJJOHRvMnZ3MTRKQXNaM250cFUxZitOdDcx?=
 =?utf-8?B?M25vdDV6RzJaSFZoS1QxSzYwZkorNW9ORkdLR2pxcUZjR2xvWUJ4RnJOSW1k?=
 =?utf-8?B?eEU0bU1WdEJMRi9lc2VEbEZ4cUhiTEdHV2dmNGVaTWc1RWZJNG1HSnkzMzJF?=
 =?utf-8?B?dW5rakFtdUxVbzRjdHlWUVNFY0Y5NWVaWXI0QzhveXRGbkVCUFI5Qjd1bGVO?=
 =?utf-8?B?ZHpnaExhNVJick9UMXJBMnBxWDdCT1Jpa0xudlg0aUMxaVRrR3pyd1hXTHZk?=
 =?utf-8?B?amxQamxueExIU2dYWUxrZzA4Ly9DUmRYOE5CbmFPMGQybzJ0ZllONDBoNzlV?=
 =?utf-8?B?TzNXcnlIZmRqQTBkTXQ2UEtFR0pqcDJCTCtzTFozTUFhNXNDQU5QV1BjSnI0?=
 =?utf-8?B?N3VtVE5OSjRHWWUyMmVLQzA2em9rcmJKQ2JlSkx1SDNRTWFVZkNkckJKMWZq?=
 =?utf-8?B?dVl5ZHR0V3VKZGp4eS9KQlViOUlkNHlTcEU0T05taEMrTUs0YnZ4Rmo1Qmw0?=
 =?utf-8?B?L3BhbWFVRlloZ05XbTZncVVOZ0NFb1NOS09oTm4rMFI5OFZmeXFCSlk3MnR6?=
 =?utf-8?B?NkZ4TTY3TWZEK2NTSkVzTGkxcTYzZWdXWTdmYk1jWm94S1JUYXRkV2hnay9B?=
 =?utf-8?B?K2NHV05heEJ0RVVVUzRjcW5zYTdsZzVLdE1FRHl0ejIwQlpBdy9EdUdONXVn?=
 =?utf-8?B?M3RENHN4T09MOFNmTXdGMnUyOHBlZkJFZGVPV1E3OWRWSWdKZy9HM2t5L0I3?=
 =?utf-8?B?dHBDRUFCbDRzRVB6TG5VaE9odjlnaEhLOGFpUW1yNFM2ZElRZ0EyaUVMenMy?=
 =?utf-8?B?d0dHWmIwejNwZy9MTk1rSDVodW1BSkgxSnNtdjBmTnI3VC8wRzJMTFl5TjlC?=
 =?utf-8?B?SVVma3BoaURDZ0NyaC9uUmtzdHVQNFFPZzVtRlVRVXFiREZmZmhsc1BYYW1K?=
 =?utf-8?B?azFaMXo1WlhEdmNhc0hmQ2tZdmFkYWZ5WkQ2REluS3Y2SWovdWY0ZFNLL1p4?=
 =?utf-8?B?dXBocUkxYnVNRy83MlJKMGZsTGVwQm1lQVl3bWtLclpsR09xd3EvNGVDbHFM?=
 =?utf-8?B?cW1IclBkR2FQOFlQYVRZWk9hY2R1dTN6dWxBL1kraTNSTDkza1hndm40b2JT?=
 =?utf-8?B?cDMrT2dLY3ExdFlQZzIyTTJLamlhZ3h4ZnNOMnR3bXNqellrVWl6RmdVTEtu?=
 =?utf-8?B?OHJERW9VMGRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1NEZ3NmUXNGeW5MU3pKdDBjK0dUb0dqVi9TQjR4SDg0UHQ3Ym5iU3F0K1NV?=
 =?utf-8?B?eG51YmQ1QllHZWxlbUs2bXUyVk1ibURKSVUza0ErQW9EYW9IUjVqOENYYUYy?=
 =?utf-8?B?ZlVhcHg0TFJxK1VUbUpCNXVtaUxLa2RzaHNRdkI0d0dOanNkQkNQZDRycHZQ?=
 =?utf-8?B?emc2STZZZE5yOVpDdDE0L1N0ZUpObWtSZ3JjWU9NWjN6NDVCcGRhQTVYWU80?=
 =?utf-8?B?bml5WXFkT01UMlRpNnRqSXdMOWcxeDNyYXB2aHZva1VmZkt0eXgzTTdCUVNO?=
 =?utf-8?B?eC9ReWM3UVRIc3Q2SHgwVmI1OTNSQTZxV095OCtDbk1xRHBudXpBa3ZuTnpw?=
 =?utf-8?B?WWNDUmZvb0JZRHNOa0FsZG9KaXpCZTJVVXh0QzJ6dnJZYURBakVzaWIzeWVS?=
 =?utf-8?B?Zjd3ZVVjd2VQaUlaYklqUG5sNEtIcGl4K2xlQk9iUlkwT3k0Yy9GbTlFVTU4?=
 =?utf-8?B?YXhtaXpyT1JjNWhIdlBPTUpNNXFicWhpazBCUVZ1emhqNUNKV2pCMWswaWVK?=
 =?utf-8?B?U0lkNVFLZXJoRXFhVjF6QUswMUZiMDR3bXV5aGtiYXJITlhHNWxPYlFYUWs4?=
 =?utf-8?B?KzZza00yQzJNeTRLZ3BkUmpIa250MTBMc2l3VmhhY1FmczNZTUZTLzlLTmov?=
 =?utf-8?B?QWhaZnBmN1Q3dUplaUY4YXRmTzFMOHBIMTdFdk15YUdncnV6YXFJclVaRkJy?=
 =?utf-8?B?SUUvMEFyRkNKRS95SFhncmF2Z2tITmxTeHlkLzl0MW9lS0hQZkswK0xjamtN?=
 =?utf-8?B?MXN1cjV0Q1IxVU82NktvdnRUcytadDFnM2FzWjJxdlR1MUVYb1R5Zk9ZT1B1?=
 =?utf-8?B?K3BsT0JKRTY1czZab3BJblN1Nkc1OXJBWFgvWVV6RlBZZ2hGSWswU2RUdXFX?=
 =?utf-8?B?Y1E2SkZ3KzRiUzhubG96RWg5Zk94NytJQ0pINzVyV01ya0FzNXNhYXE4c2pk?=
 =?utf-8?B?MzVTWXRHVXhFd3pJV0VGeG92eHhCRjRwdzNpMWRpS1VUd0hrc0tRb0ZMMHJS?=
 =?utf-8?B?OVk0SmRweloreUJ2SDRoWXY3di9Ob2R3Nko3SlhBU3ovbUR2L3dUZDFnVm9L?=
 =?utf-8?B?c2FQalZZVmZwMmJydWlkL3hwWTBkc2VHRGEvYkVDWlplS2Zma1MxRXZZd0Jv?=
 =?utf-8?B?VFZIOVd5U0RncmRlSG5DN0xzM0RWTE1JTkVrTnY3THdKKzJmL0xTbFVMeUpB?=
 =?utf-8?B?R25kc1R1UW1nTjQxM3FQeDBXbnZKdVIvS1BVVE9sMWUrSE5SUkJjeVhKQXFT?=
 =?utf-8?B?eWZGRm5JNTY1cG9zUkFMTzBDMGRmRkF0aGRqUlRYaEhpdDUwNEJ4VVlRMnZY?=
 =?utf-8?B?OUVuZWtvQVY2RUpERW0yTis0ckwzNDYvVHhXL3dKVFpyanFxMWtZNWs4M0kw?=
 =?utf-8?B?VTZvck9PekZ0NUpKTGZnR1g0akxjNzdnUks1amNCZlJ4VS9vNGwyNHZqY1ZU?=
 =?utf-8?B?MjdNMGZzV3ZVTS9YdzdaZ3Q3Ung2UDBJMnVsYTcyZXZpT0RFSkg5L2hvMVRM?=
 =?utf-8?B?Y1h5MTNUU0o5NW5pN3lrRnZWNng5aXE3RU4ySWxkZ1kzZGdGTGI3d3J0ZkND?=
 =?utf-8?B?L3dpUjNtRlNCR2ttc2xaRUlLSWEwTWF3UERKZ2FBNGlhTUZzaCtrdC9scEpu?=
 =?utf-8?B?dGYwZkp6NXpaTGttM2hCd3NkcW0rV3o5UWMrWGYyWGJWOERWYkZya3FIZGhS?=
 =?utf-8?B?UlBnRkFwdWgrdS9GWXJFQ2VrclRnMmhST2ZraFBXSldZdm40YzZhalFUVk9u?=
 =?utf-8?B?MlAwb1NsT1hRVVpBR214RE1GRGN6S1JXdm5xRkg5c2t3L1ZiQVY2amg2TlMr?=
 =?utf-8?B?MDVIdEx3ZithUk5WUGg2dUhvNEhLdDBkSWVQMEc3YTVGK3c2c0JIdVFJUjh5?=
 =?utf-8?B?MFBRM0xBR0lkRFFXRHBwdWJYSk4vTGxSc0Q0Z0VVakNCZ0ZTSHlrZXBTUVFJ?=
 =?utf-8?B?UEVtQUVVdE9udVptTkd6WWtrN29oWTliYXV4UCsvUHQvV1R1SGh5ZjgzSVlQ?=
 =?utf-8?B?ZDkzYUVSNzNtczUzV1BHU1pDdE12NlRFL1NBTy9ZYUlQZUUrTFFrcHBvOXpZ?=
 =?utf-8?B?aXdtbEpCdnJrV1VZV25mZjhxVlZXQnU4SnVYUWFiRStzd1JVeWRqU01VNHRK?=
 =?utf-8?B?TWFPKzAzVS9QQnA2dFlkVHQ1ZnB0bnJBVE1ReC9iaDFzUTBveDhkMmhIYUNz?=
 =?utf-8?B?bmp1ZTJlRFV5NDJxMldSOXJGQzl4WkozRUx5U21mKzAxR1N5NUpNSUZBc2Vy?=
 =?utf-8?B?dGNGU1VGTHpPU2xIelVOSjBZbTM4T0txRXpQZ1BSR1dpajNvMTFCZUZmYzhC?=
 =?utf-8?B?b0R5OFIwRTdBN3dBenMybUlxQTA5VXZsaUkycEJuaHhLTFdWaThQQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbcc0759-43a1-4b29-a14c-08de4ec383a9
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:37:56.9636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKhnOspQl2Hj//0+x3i5Ak3+5cKJ6WSHM/E5HnZhIE5Cmeyj+SMohJxVdZSMm4rvH/mqnoTYf+b3ZtjgONtxwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7879

On Tue, Dec 23, 2025 at 06:03:25PM +0100, Jan Beulich wrote:
> This is as per discussion at an earlier Community Call.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Btw, what does "(b)-(f)" refer to under "Specific Process", item 3, sub-
> item 5?
> 
> --- content/about/security-policy.md
> +++ content/about/security-policy.md
> @@ -103,6 +103,8 @@ Vulnerabilities reported against other X
>  
>      At this stage the advisory will be clearly marked with the embargo date.
>  
> +    Unless requested otherwise, the discoverer will be credited already with the pre-release.
> +
>  5.  **Advisory public release:**At the embargo date we will publish the advisory, and push bugfix changesets to public revision control trees.Public advisories will be posted to xen-devel, xen-users and xen-annnounce and will be added to the [Security Announcements Page](http://xenbits.xen.org/xsa/) (note that Advisories before XSA-26 were published [here](http://wiki.xenproject.org/wiki/Security_Announcements_%28Historical%29)) . Copies will also be sent to the pre-disclosure list.
>  6.  **Updates**If new information or better patches become available, or we discover mistakes, we may issue an amended (revision 2 or later) public advisory. This will also be sent to the pre-disclosure list.
>  7.  **Post embargo transparency:**During an embargo period the Security Response Team may be required to make potentially controverial decisions in private, since they cannot confer with the community without breaking the embargo. The Security Response Team will attempt to make such decisions following the guidance of this document and where necessary their own best judgement. Following the embargo period any such decisions will be disclosed to the community in the interests of transparency and to help provide guidance should a similar decision be required in the future.
> @@ -118,6 +120,8 @@ As discussed, we will negotiate with dis
>  
>  When a discoverer reports a problem to us and requests longer delays than we would consider ideal, we will honour such a request if reasonable. If a discoverer wants an accelerated disclosure compared to what we would prefer, we naturally do not have the power to insist that a discoverer waits for us to be ready and will honour the date specified by the discoverer.
>  
> +In any event at the time of pre-disclosure control over a possible late change of the public disclosure date moves from the discoverer to the Security Response Team. This is to avoid pre-disclosure list members putting pressure on the individual to extend or shorten the embargo.

I would maybe add a comma between pre-disclosure and control and
clarify that after pre-disclosure it's always under the control of the
security team:

"In any event at or after the time of pre-disclosure, control over a possible late change ..."

I'm not specially fuzzed anyway.

Thanks, Roger.

