Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BE0C7306D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 10:09:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166620.1493128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM0fW-0001M3-Vq; Thu, 20 Nov 2025 09:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166620.1493128; Thu, 20 Nov 2025 09:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM0fW-0001Ic-SV; Thu, 20 Nov 2025 09:09:34 +0000
Received: by outflank-mailman (input) for mailman id 1166620;
 Thu, 20 Nov 2025 09:09:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEGo=54=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vM0fU-0000ko-UG
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 09:09:32 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f49616a-c5f0-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 10:09:31 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN2PR03MB5072.namprd03.prod.outlook.com (2603:10b6:208:1a7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:09:28 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 09:09:28 +0000
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
X-Inumbo-ID: 9f49616a-c5f0-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsTvlb6gl58GLHdhrHR9X8gHktRQyynoE4WtFHUFW6JIn4EQKNu6NjW57RHcZQ5gLSztr0PSPC7ekrscwIN8XQtliXI8pcJ6EEM84wF8VfoqQ0UYO0CtLAUHwv/hxXq56v0KuDbzkcEoRTfl0WDTRdNap/nt5g4TcA/Jsqmx6bzBx3YGF428+WhJaadS28cXEC180hYslfiqSFBSAcPJQznFFQzElektQBjtnKJMX39hye0gW+bE5DCrg+l2OmYNT9ArHLNN9ZBA0+NFQ0b3U9q+94aAJ0FTIJRXWyXAv0v0qOVI0rMZHZTrg8IUvQS0t++oTTLTn9Ovc1mw36mGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAs1Y5Qqo4ZLjPuw0r6KVRa8n5fqVYDMsTWrbFPvIG8=;
 b=r0QcaeX2PcyzU5AJYg1gA9APsook5aMPl4rbEAH4Wm0cjw84cb4Z17k4U4fCQyMCRWvhHWV7tIdtzudQLIZmzZZJtX3yH6R7+Kgdbp916EuxeJu9gaYLIMNVQ0WwdrFsE0ZJuVTGorcCCxaXNWQ+Md4bXTyMU16DwJlQBJGkd/Q+zuENboRFdvbzVYcUnaRYp5kAdkpSpHRwwE9wMeJT5pzOm9jzTLdgruKlDW6YONZuQ1GGv+X0A6HwRUs8/PiUDnkayU10HsblQsEbBNS83t7jweHh2i44gIH133UyI6Cy8iZIrVV5NaS1bmOvjupH/LWParns1aIVZK6PfHBH2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAs1Y5Qqo4ZLjPuw0r6KVRa8n5fqVYDMsTWrbFPvIG8=;
 b=CzusmpXTTbxPNUL/FY5rSAq6pZxralPtHsvzD5pzqQP3Zf2JNGPN1+1CPiRsvXAxcDFqCSrxI4kNlBrausfu3lubtq0GtcCImqgQM3PebkO47yFIqsJ45Oflb7llv/PMVhDsKrUHiBLZptDIXmIKALW3d1kKek9F2H3VmMhyswk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 03/12] x86/irq: introduce local irq_desc
Date: Thu, 20 Nov 2025 10:06:28 +0100
Message-ID: <20251120090637.25087-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120090637.25087-1-roger.pau@citrix.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA4P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN2PR03MB5072:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c928cc5-72e4-4763-930f-08de28148273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlZXamxVVEIrenIvSGdZWmt3VnRhckhmZjlod2NoN09BTkFUUlV3dEV6a0dl?=
 =?utf-8?B?SmlVK3hPQnAzME5vQmx3V0lhU1VxOXhPTWZXZldtS21JVzd0N0wzTXBPajRT?=
 =?utf-8?B?cDVQa1N2dHNjbGQ1Qmd4MDRFN2VuNzl1TTZmdm9TOVN6YUZ4YVFSVm51bGNS?=
 =?utf-8?B?VmtNZ2hwOTFlai9wbjBGNjRDOFVMa2JERjkzUnFFSE1TZmQzZ2NhaVRDdlV4?=
 =?utf-8?B?S1pIQW15d2VXc1ZSRGU2RVJIaWoyU0JtQWdzWFFnMXRxY1JVS2NZbFdYYldD?=
 =?utf-8?B?cnBBL2Z4VFU1WkFRRGphVm02LzBYWTlqQlRobElPaDVtZnptOStjZitTcDV0?=
 =?utf-8?B?SUE1dE85TEJFT0RRb0RlSkRKamxOSXBYNTV3S0JZNFZyVGNyWEtYcEJoblZp?=
 =?utf-8?B?VW01dXVjTDFOTGZSQzVoeG1mOHdxK20zSG9TT0EyTk83ZmFVNTVxellLRWRN?=
 =?utf-8?B?bXFvKzhtUkVhZkpBaVVtbmIwQnIyN3RqUGNCTWx4ekR0QlMwOXNkenJOODJr?=
 =?utf-8?B?aCtGdlVzd1BTOXJBV1VIQ3hFbUdDZmUxOFFXVnFybXpjM3drTzJsUmlRUmlr?=
 =?utf-8?B?VzZiODNBcG1aSDNKMFREaU1uZGtRZmMrTU1aVHNQWDZSeGJrUXBIQmljZGRh?=
 =?utf-8?B?SVZQSXNpTE5aeURVOXNMeGNWVzBmKzZMaCtRdzNsVXMvdlNHS0d5c0NxRFcx?=
 =?utf-8?B?Q1pOZlBXOCtjd1ZsclhzOVpuTkdmVWh2eE5sckpEcHhWR1ZCdFpoNEZQQzhV?=
 =?utf-8?B?Vm1WOENod21leHcvRDJteTZwWWRtakE5aTI0WFRSb1FOTzczZHBtMzB4dXBO?=
 =?utf-8?B?cW5JMXc2SmxCTzdUV0xZQnV2cnl5RGQzV2FJd1UrZ2NGVkF3bS81SCtQeS9w?=
 =?utf-8?B?Q3dUSmpHOHZUOGE2a3pXM2w2bmM5bmJ2RUxuVWpRSnRZN21VaEVBbmpyOWwy?=
 =?utf-8?B?N0hTMytXSnRPaVZnTk1EaVhmQVdOQ3Vab1R6aVdaV2h2WjczeUZvVVRnc09Y?=
 =?utf-8?B?YzlxQWlVV0VCektlZnN0UkNTVFhoV0k0SkJyblFwcDFjMFlKVnNUUnovZXFv?=
 =?utf-8?B?OFgxSVRTZ2w0Z25kUkhwK0NTS1daUGxPajlmK21rUEhMbXU1NVhNcnVaTFhX?=
 =?utf-8?B?aHlobzZtV1BOcFlraGJNelVzb0VyRHVJYWtsOGptQVQ0QTNyK25jbGhMUGF0?=
 =?utf-8?B?UkVSYjBZY1lPWllUMnlVRHl3Ull1WXNKZUZIZEozb2NiNktuQm5HcGg2d0cy?=
 =?utf-8?B?S0NRdlFWcnVzWVZnbFU5cFYvOVpxL2RQbXN0MjhPbDk2VTNFMk1NakJ6aGpV?=
 =?utf-8?B?YzgxaVdBVFQ1N3JxSnBtSngxMmpXNFBIeWhRaDYxZVhpaVFhZFpVMWsrbVFx?=
 =?utf-8?B?cWVIZ04rSm1mditwWnpOaEZYR2FVaFpLdFN2dDliVDZ5aDBwcGY3NFZYNFZZ?=
 =?utf-8?B?cmJNU0ZnRXRDbitWOVhmai9lZlRRS3VITGJWMXZESTNJQW9MUWxIWk9SaWV6?=
 =?utf-8?B?eWU3d2JDS3NQWnQxUjBrajZFT3A5WWtUUThoN0FFdElUdDJNZ0VxT0cwUWQr?=
 =?utf-8?B?RFF5V0xBVTZwUFRKaEpLd0hCckI2UXp0dUtJMlZVSjFIdU04aTFiUUgzY1Rl?=
 =?utf-8?B?cmxIT2hOdnJBcmxjQi9udUJTd3U2TURPZ1NjRU9Va2UvbUhDeUFjTWJRU1Yx?=
 =?utf-8?B?R3hNYzNtWVFqY0FXYUcvTmdNRi82ekptb2t6a1Z6MU9nZkp3RXVQVmsvVTRU?=
 =?utf-8?B?UW1ONDMxTWJwMGZ0OXN3NVRLTUg4bUdGMjBKRkp3U2VSM2djZEQxTFVQY0ZS?=
 =?utf-8?B?dWVTbURTZ05FTVI2dlMvZmpuOEZFcXZmNGNvWHhzc1lpdHc2N2dYeU1wM3pa?=
 =?utf-8?B?aFkvMjYvUncxUlNIL3gxSlhaYVVxbk9ETVJhUFFOZWxlRVZnM0NUUTFoM3dD?=
 =?utf-8?Q?13blukwbWozDY9kZ4O6Kkl06R7GiLJNU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2pPb25wck5tTlQwUDV0TEhmWWJUUFRNN1ZlNUFOOW1Tb3BJdFo4TXFNNkJh?=
 =?utf-8?B?UG9nMVQ1Zi9lZkpPYW10Ui9ZamJ2U3hSYm1BMkJiOGdwUk5hcHlNYldhUk5T?=
 =?utf-8?B?SUU4UlBnZEUxWjA2NjNFM3J1UGQvVG1OTnhKT3EzQW9BNWNSOXVXZkZHeHdi?=
 =?utf-8?B?enExV0kvZWVOdDRKVDQrbTJHTnJIazhUS3ZSVE1mbGRZV3VYUllYaFZ4SVJC?=
 =?utf-8?B?WGZrWjBZc3FtcE5PczRSOTlWRlEyZnVaV0owbXdrd1ZWZ3hkKytXRXFLcWNQ?=
 =?utf-8?B?QzdOWTRnNnFXY0tVNXcyQk9pTDdMdno1ZXd2VTdCaFoxdjlXSXR5YnZDdDRj?=
 =?utf-8?B?aGxzb09xc3BjU3NIQWNkVXFmTEJJaU52OEl0U3hLaGVLYXF2M0RiY25CYzVP?=
 =?utf-8?B?M2JjY3RwdmQ3Y09iemdlbklzRlJrcmE1TjJSMkluMUFZYitYQ0d0UTJ4TXVU?=
 =?utf-8?B?ZWl3dTR3TUZzS1ZPU25UZndqQW9abDlVSEROanZ1SEtNS3hBRnhqclNmYXZC?=
 =?utf-8?B?MjYzVUQ1ay9XeXlVTFFISmoyaXZqb241SmZBZSsreXJoQ3FtRzZwZFJmejZM?=
 =?utf-8?B?OVVSV25odFZoRi94UndVYXZPdS9abWRiSzcrajV1Ni9Ebzd4STcxN3ZVWjMw?=
 =?utf-8?B?K1d5M3lkRjJNd2RqdExCQk1zc1BkcUhOSWJPdThQdU83em94NHV1UWZ0WUVC?=
 =?utf-8?B?ZjVpQ1RtMCt2dG5RanVPL3lscEhaVUdEekQ0aUFDNnZLNjVuSUxHL3UwaWdC?=
 =?utf-8?B?b3dBTnBXWmcxME55ZW5LVHNwdXpab2hkSCtGSnZTeGFzS3ljRUdDQUxFNEZI?=
 =?utf-8?B?Y2MrdEhOWWZ6QWhhTm1MR2lWRDlKTjV2eDYvdlYrTDdDbVdJaDJGd1hyRFhw?=
 =?utf-8?B?TVlFc2o2a0pTcW8yNGlmdncwWGVVYm5YaXlpczhOYkg1QThCcksySXFaV2tO?=
 =?utf-8?B?S2lWcXZaa2lHM1hqZWRRbHhqb3h3RWx0T3BqWnFxc1hjWlBzbm1rS0RtYktI?=
 =?utf-8?B?cW9oNnl1c1E1bnpUTGdrZ2JLdFBMMHEwOVFMYmJyZ0p3UjBlMUhjdHlpS25l?=
 =?utf-8?B?ZWdyd2k5RW5jZEU4cjlnbXJ4T1o4bm5HdkpDMFU2VGM5RmZvMXZyalNLbnEv?=
 =?utf-8?B?VFlBUjl0MXI2NUJmK2xGZkIxQkR1eGxYQ1pZL2tLRjFFbkdpa1FDNzFvQzV4?=
 =?utf-8?B?dnFBdloxUUw3U1lLMjdGeDBHRDdlenE4OTZ5SjJjUVE5NkJNRW54OHlyN2s0?=
 =?utf-8?B?c0d2ZjhyLzBQempScnB3dmFES0FqS2lMQmhQVDd2S1Vhd1V4YTRGaDMrYmNl?=
 =?utf-8?B?TG1OQmtabUdBaUVMbUtjSGl2ZU91M1h2dDVYZHQ1Nzk0cUlBS1dtRkZDNkpQ?=
 =?utf-8?B?Mmx4N0lyTEdxTGhRUDBmc0VSZ2ZQeFZ1UDY0dHVsQjhmYmQ3K3hKWmxxOHpI?=
 =?utf-8?B?V3lPMVYzVnBnclFTVExHOXRNMXRKOFV5Q1YxSkdsRnJ6cC8rS2Z1SXJGa2Ux?=
 =?utf-8?B?Q3FuZCtSbWZPdmxWK3pQcFh1d1NONCtNMExxMTh3QWxOL3JaRFJYVjJBY0Iz?=
 =?utf-8?B?RXc3b1dZeVUrRk1VZHAzUm5EcTJ6N0IwV0h3U2duaGh4dGFCVjlzUGZDS3oy?=
 =?utf-8?B?b1FYTXNqWVBHOHZOQ3VEeTdpNzM5QW9pOE9YVDZNRjNHams3Lytkay9HTFQz?=
 =?utf-8?B?UjhOdURuT2ZZekRRWGY4bFBMQWJ0cVdGeGJqVkdVK1k4UEkwaTEwcG92OEtH?=
 =?utf-8?B?YnE0MXlNaEdNTi9icm5lMmVud3ZVOVVoSFZxcGRmbVNUeDdxZEsyWXd4RXp0?=
 =?utf-8?B?T3FoWndrejhaRDhZSnBqZktGRFNtU1djWDE4N2lnMU9kdFJ1QVNkZDYrMHZu?=
 =?utf-8?B?T3VHcVpZY3lIQUNCWGtnWFZoMkF4c1FDQ0VGQ3VLNHFMcEtWclJnZndVd0tz?=
 =?utf-8?B?djhmV2xhdGVpL2lKa0xRUUpYa3VVMmppaWV6ai9DQUtubmUvaU1RVE96TXJV?=
 =?utf-8?B?ZnJoNnBFQVV4VUhTS3Q1UGFPaGd4TWI3QzFnaDg1dWJ6MXJyMExpY25mNU1a?=
 =?utf-8?B?eEhtOVNYVEhERWY1aXcvcnBpTlRCb2xGcnEwOUhlamx2b2U3amVRLzhlclBH?=
 =?utf-8?Q?D5rAxVUFDmu3yqgQY4v2Vl5gy?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c928cc5-72e4-4763-930f-08de28148273
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:09:28.6915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bda0W/h0eZt0ys+ZWy75IZpb9ZcwqWsIC+OVomyWOlY9Tg6OcOM2hgxi+Z+BPo7Qmjdp0Q9sWmoROkqw0reczw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5072

Avoid duplicated calls to irq_to_desc() by storing the result in a local
variable.  No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/smpboot.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 8d3161248de0..7fab5552335b 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1455,12 +1455,16 @@ void __init smp_intr_init(void)
      */
     for ( seridx = 0; seridx <= SERHND_IDX; seridx++ )
     {
+        struct irq_desc *desc;
+
         if ( (irq = serial_irq(seridx)) < 0 )
             continue;
         vector = alloc_hipriority_vector();
         per_cpu(vector_irq, cpu)[vector] = irq;
-        irq_to_desc(irq)->arch.vector = vector;
-        cpumask_copy(irq_to_desc(irq)->arch.cpu_mask, &cpu_online_map);
+
+        desc = irq_to_desc(irq);
+        desc->arch.vector = vector;
+        cpumask_copy(desc->arch.cpu_mask, &cpu_online_map);
     }
 
     /* Direct IPI vectors. */
-- 
2.51.0


