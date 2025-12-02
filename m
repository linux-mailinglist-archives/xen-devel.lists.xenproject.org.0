Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB88C9B58C
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 12:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176151.1500689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQOpf-0000bq-W7; Tue, 02 Dec 2025 11:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176151.1500689; Tue, 02 Dec 2025 11:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQOpf-0000ZT-ST; Tue, 02 Dec 2025 11:46:11 +0000
Received: by outflank-mailman (input) for mailman id 1176151;
 Tue, 02 Dec 2025 11:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WL05=6I=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vQOpd-0000ZL-Ua
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 11:46:10 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d4e79ce-cf74-11f0-980a-7dc792cee155;
 Tue, 02 Dec 2025 12:46:07 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by GVXPR03MB10730.eurprd03.prod.outlook.com (2603:10a6:150:21a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:46:02 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 11:46:02 +0000
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
X-Inumbo-ID: 7d4e79ce-cf74-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnnXKuDZwu7HSiDACltX4RDitL26gU+71xHAFXjZCIHbPCKyCULtfrva8nOS8HcfAWo9nB8o6OExiydqUgv/nAJ+eB6Obk4sDI5GSxw0BgGx1YaBjeQm2GfoigvMkcE70+CdtFyxGgHSgTnMS8eyWIP8jK3HwJw6vNU/c0X00Odz1xYxxTnlRN3UO9YIB9lLLVFbjGOLGEqTTMwxXxfm/Cb25khP6IERpwlJSn+pTNuH7b8YEL+0Me64AJbqjPo7ve+X2m1OuORgK7QinJyZrXxcaA5Doo4vcmYS8bVzxdhe+cyjZc/k7lw4nFy/hFqCQjOqPMUA90TMm3SsPtQFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4hF5jWz+q0rDtUoloYxl1dnjJtfk1uJ6cK5yuXSIkI=;
 b=jTJDjp4GJtafHYXH9X8qeHhdL/3kB6rzq6RBfhC3T2oOWQBEKDbvmbyoGzDCNBjrvbNoHdeEp/3DF1Euqmn6u2epFi6aFDk7ICbvLGWKAQarkSlNz2PslnHHyboPbXJboV3Qt5NqBEM/7kUlBiy8KHBykChuoztyBNGsSkEVOi5ynwcHeX7tbsHnGM8wX0oKaEJulgSGHgkdB3YI06bBX8CXVh1CMkeI1TEQX7DzyNGx+oUzG3S9OhMdQNbKItlA9eodPb1/5ouIMHoSdaefJbYQB9suaMbxW27/UVHYaVghxciebnje98FEWC+vmfHXAs1xuYE+BEtYyAIe+4/5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4hF5jWz+q0rDtUoloYxl1dnjJtfk1uJ6cK5yuXSIkI=;
 b=mnfEkAlBs34vzmO2furB5y+Q6PUBYVf2TNTB48qUdfEwmmLPt1JutnspCP3cdrfu7EW/kbql52vFRHZxSHNfpMwqqYvYyYn1bMBzWSdN7wZmJyq9ljW6wBO9CmR/Is49ieOys67ZsgSdz86pR2Lu3rgWiRxC3HZSHfvJj1iWNqm17ynBtWebOcVvRFRXj0MY5n9LE5JVdgNUNJqVzHzpahrK6ZnT62wQa7lH763cnoA2Itkm+AzNO0XNvjZ6S0ivO0Ag4kSmZeTjZv6BEb0clNlj1E13em0/+h2bxj8slGRf3mD2Co24GJutB0QksTV0efSl9SgJsSLdSu+NlQ7QZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <c0ea6866-1899-456b-a47d-1aa46d6b3bdc@epam.com>
Date: Tue, 2 Dec 2025 13:46:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v4] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251114140117.270461-1-grygorii_strashko@epam.com>
 <11c3929a-977b-4ef8-aaaa-9aea01657b04@suse.com>
 <fdd51da7-c8dc-4c0f-aaaf-a9fd2094bcd4@epam.com>
 <567f2759-fa03-43bd-9ae4-75e0e3811b60@suse.com>
 <276968a6-4688-48bb-b0a1-5270ad3f0002@epam.com>
 <081b0989-79fc-4cf2-9527-0dcd2d91d518@suse.com>
 <0256fa42-59d9-4d0e-b439-0a89217a207e@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <0256fa42-59d9-4d0e-b439-0a89217a207e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::27) To AM6PR03MB4600.eurprd03.prod.outlook.com
 (2603:10a6:20b:6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR03MB4600:EE_|GVXPR03MB10730:EE_
X-MS-Office365-Filtering-Correlation-Id: d60b7896-3c44-44f0-0830-08de31985eaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NlhwbmpuN09BSVZLdFZ0RzBZUzdUMCt3UW5MeHhxWEs3WGdaMlpPa041S0hn?=
 =?utf-8?B?WXIrZWFZSThJZVE5WTBtRERBa2xSbTBrMVliUHBaT1d3QWxJMGp4Q2RjTkFT?=
 =?utf-8?B?VHZRWFVYdVR3R1c5MmZ5ZEdwNmFwd296VXc2c0E1RGpYdTZJa0wxN1ZBb3U5?=
 =?utf-8?B?T1J4TzJJQVI5Yk9qU1BaU1hLNzU4c01obm1LTllMYnFoUG8vbEdwZWlmOUZ5?=
 =?utf-8?B?bnlaWENqb0VjT0JLSk9uUk55Rk9oT2lXOE5nRE1hOEkrNjd4YWZWM0VGY2ZX?=
 =?utf-8?B?Q2QxVDVkbTlQZm4xOUFiZDh0TGpmekVLWm9uUXM4cjBXRWJWZVZXQjRiM1B5?=
 =?utf-8?B?RnZEZDFkOUdtT2psMU9HN0I5K3N4NDcrV3F5Ullvdlo1MFZZdFBHcWlpQVBM?=
 =?utf-8?B?cXRJczhORTJmMTZaOFR2M0xTK1ljNTZZZ2FxamlCeE9aS2pzTitYQ0tIRU9z?=
 =?utf-8?B?Ykk4VjRoR0FaNVQ2UVhoTVZqZmtRNW9FanVmMXBLU0IvNmxkNm1FL2toMGJ0?=
 =?utf-8?B?cWduUHdqTTlvN280WTl4RWxpZUx2cmRJTXVPUUZBSjJ3YTNZQkQ5RW8xMUwv?=
 =?utf-8?B?L3JHdndDUFgzSEJaeFhKOVFrVDd2YzI0T2d5TzlFWkkvR1dtZWJiME5xZWFq?=
 =?utf-8?B?eDN6QzVGbEJlQzJScDJJSFFiRTQxT0R3M3JOZkVnM0JIQ0s5d0VtVm5mZTd6?=
 =?utf-8?B?eXF6NktwWEZTQ1RGc3pOdGFVaERIMFIzeWhUMHozUERrbkdQeVNTZE1PNWpq?=
 =?utf-8?B?b2RNY1pBc3ZqeHBIblh5VXFWVlNtQmtUbk1vLzkveS9WNW9PVXhiZmpCRGlK?=
 =?utf-8?B?SVA4L21zVFU2ZE1CUzY1RFAxR3VBSUpkajBCUzNsNHFDRXlFcCt1cmVzR1dU?=
 =?utf-8?B?aDJ6YXJUUHVua24vSVNLbmN3MXpkNEVMdFVYUW1BaGFvWU13K2RmcmdDRm03?=
 =?utf-8?B?MG1IQndJT05RV1NMU3NpdURubGtxQWlsZGc5TGlkNHBONjkvSmhTWmVmSlYz?=
 =?utf-8?B?dnk2WmdER0FRWjg1Tzh2Qm51QXZyMTJsTnJmWEpURVhBNFlySkpCWDFPUm14?=
 =?utf-8?B?a2NGcmduTUZjN0xMbEtONGJSRFJNMVEwVThCRkZZQmhOaWtzTzVySkV6UW5G?=
 =?utf-8?B?L0k5Ti9ESHp4ZGpNeDZMQXdjOWo4cXpwTWQrV3pUVlVZdXdDQlVCYUhNVG9B?=
 =?utf-8?B?Tkg0VE5tVFB0YXpDbWlpcDVNZStCRUVQcDBJTDl2K0RyYkVYN3VZYkd1TEUr?=
 =?utf-8?B?aU51RmtDMnEyaExHdnlOTHZ1Y0ZHbHF2ZDc3SDZLOTMzMjhldnBwMWVTZGJt?=
 =?utf-8?B?RkQ4b0RNeE93VlF1TjlzL2pCbFlRbUpIdkttMFJsbk4xaERId0t4U3pESkR1?=
 =?utf-8?B?aDBkZEZ2bUZGd2gwQXdRMTRJWHhJZEl2SUJBUHV0Ym5VOGFMNGZpRnF4ZDR2?=
 =?utf-8?B?V0lKd1dQRWg1WFkyTHpmcDJ4OXIxalhITTltdnRlNk8wbHlXcUV6bHZqQ1h3?=
 =?utf-8?B?US9VTFBmdEtqVDJJSmk3ckI2dlllVXU0aFJhWFV1S3pYSWhLNWZzV2tnYzNS?=
 =?utf-8?B?ZXdDUGJlWnc0VmRibTFTMFV1dGthaHk3dUp6WWRWZkhoZzJaanpETTlMUVRC?=
 =?utf-8?B?UGo0eFhRTndRbEFSSEZIRVQycEs0OG5mUVhiQXA5dkMzR0Y5WjcrOVNleHB0?=
 =?utf-8?B?czhVbFpoMkxyRmJBY1NwUnBZVW9aYUhUY0Q0dVB0OVVtWXFTT1J2K09hS2FP?=
 =?utf-8?B?OGk0SjJLVTBmTlB4Vjd4VjR0K29ZOWloaDJzREVHRzJFVHJ1bkdxZXJ0cUZM?=
 =?utf-8?B?bHdtQzhuRENyOTNtRU9xQllZZlBtVURROE43U2Z4d08ycXEvRmEzcHZROUht?=
 =?utf-8?B?L1liNFBnaGc4YU9mNDF5Y21jVGcrNmVaYXlCRzN1RVVuWjlESFF6WHVNellM?=
 =?utf-8?Q?p+3c82sGlBGJQbpjIcxHbzQvn5HqpG/l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkdRbzRQUGVQVXM5T1dvbUxla1BweXhiS3d2MVo4QlJPNXFleG81NnhiQXlF?=
 =?utf-8?B?c0tKbkNjd0JuVEdYMXo0SmJaNzEzZlZlbnA4UUoxM0FLQnUzRFJwcEVWcHVP?=
 =?utf-8?B?YW5JSlZmL0R4bTBtR3laOGcvRnFpeE41TURiTFVpZDJTYUFvbmlqUXpzL1o1?=
 =?utf-8?B?ZlIvRGxNcldpQjczOWRScEFqelhlc2x4S05YNnI4OVlWMEdkS1J4dk04SzUz?=
 =?utf-8?B?TUpaaVJrVEJKSWt6RExlbk9FdXBPRElkNGRSL254UEpjczg4RStSeHp3K3hr?=
 =?utf-8?B?ZmpjbExZb1h6dzBneWZxeUk1VjNNUGZsMlk1Z0xob2NPZG90Wi9UdGc4QjBX?=
 =?utf-8?B?YUZBK0I0ZDRBRnpJTWh3SjZxbUpnSTJoeE9BQ0t5NGs2RisvSEdLQXlUd1l6?=
 =?utf-8?B?cTBhN2lYYVZiUWIvOG1QQVNJR1NGM2RSYkRzbHVyM0JFZFphSTlqMEFRVFow?=
 =?utf-8?B?L2ZiZ2VmRGltZVk5ZE93UDRUcjZCeW1Jb0dmUlI0cE9HelAwM0M0alRkd01x?=
 =?utf-8?B?UzN6ZmV4Rk1OdUNSMHh6T0tOanRIRWlESGlMcjcrR3lpbVMrOG8vb2NDU1d2?=
 =?utf-8?B?SFM2OXNKcWRkeTFVSFA0RWRwbzNRMFdaZnhWNUJSMWdjeHcrMGpCeWxDQTRL?=
 =?utf-8?B?dzFtUkVEczYwc1pOZnZiRWQ1UU1YbDFTamJDU1p5Mis4dzE0aVNPclVoNytj?=
 =?utf-8?B?NnB4dHZyMzlyd2YyRW1PRUc1T2dwcnJVdWhwdlRHd2ZPaVdtMStVYnpjVEdB?=
 =?utf-8?B?cjVtNklhYjBZdkU2Y1A0Z3pFVGhhRW5tU2ZuWlNLNXNQZnR4U2FVK1JicXVJ?=
 =?utf-8?B?U25ham1RNFFMMWtPYW1VY1YvN0M4NjN3L1hwZnNVL0tTWXR0RERQTzI2dmZB?=
 =?utf-8?B?TUNIQU56R2tCNCtYeEhqb0R5Qnp6KzlOZlVXS1dVckhJVzZpTmw4ZGFFSmJ5?=
 =?utf-8?B?VTZNTS8vaW5qaFdyS3VHUTZKOHVYRnROYzNKczB1dzJsbys0QnF4YlIvMlJJ?=
 =?utf-8?B?anZHVlpIOEt1SHhtZVMrWDMrRVlGTFJFRFBwRG9wTzhCaEJuZ0dZcXJMNEk0?=
 =?utf-8?B?VE11TmhTQjF0QzNXNFhuQ3VzNzZuWThXTHY0ZURZdzRYVGs0VVlMUzdCTzU2?=
 =?utf-8?B?MkZDeGlZSXUrT2tXSEpkUVZpam44bVpJUkJleWN5QjF4dmRxOURKMHAxYW5X?=
 =?utf-8?B?Rkl0MXNPekgyWTV3Q2RVbU8zR29rMjc2V3JLdFNtcjZiTER3c0F3UHU4Y2tU?=
 =?utf-8?B?UWZzOEdBYk00RXdlaFJEcmdqVmNZQk05THFUWmNZcmxoRnZlek83WHBlZm1n?=
 =?utf-8?B?QUxROURXTkROcWJ2M0grNnNYSyszZWY5bjVnZDRCWFVDMmRvWC95YlUzSk1t?=
 =?utf-8?B?WDJKUDY4ZWdqc2tLUXN0R09XWko5U2wySzN2azljUTVIYkFIMTBUU0hDTUlN?=
 =?utf-8?B?b2o5Y0N0OFZaMWt3UFVPWmtUZW5aeFFUck4wbFBpMVRZdTdXNWEzZ3JlQzlE?=
 =?utf-8?B?SjRRdkNNSnE4dlhqOGcwT1d0dE9tdW9BODhlQ1paVEFPWDNyR0ZXbm5pYk5W?=
 =?utf-8?B?aml1Q3NsazVzdnBrQWE1OUhLaTNtL2JwSHdrNUdvZURyaUpHUld3Zm1wNHk2?=
 =?utf-8?B?cHBmZ3Z2bWtzSkg5Y2hPdHVGZkZWSk1LUTI4Q2JkbDdhY1BuY0xUU3ZWTU1B?=
 =?utf-8?B?MUZZb3lVWjU0UVZaTlE3VTAvQms5dm5XcGJPaHhOVCtyMUFoS1hlOUljc1U1?=
 =?utf-8?B?QUJ5QVNEaXdZMGlIc091VnN1ejRDaUlRazlCNnhneW1NTzFpWnhnUmh4a040?=
 =?utf-8?B?WE1LSHBBTVdjbUpzZTZ1a21kT0VjcXNLMFFyMjVQSUZyMXdPZGhQT1FJU2Zj?=
 =?utf-8?B?ay9hN3k1SGQvVDduTisyY01EZTcyU01WOXl6R3kzWEczenJhaGt5Vmp0Zk0r?=
 =?utf-8?B?OWxpOTNIczFtUG1wSnl3RFU4QnVVTTRZOUxuRDRBQzM5UlBIMmFQZVlNL3Ix?=
 =?utf-8?B?anpRL1hhRjNDNnU2U3VoeXJnUFJFVGhDVVlCWVY1bmwvN2UzUHAxOHFaQm92?=
 =?utf-8?B?WU92TEEwY3JBbGFXR1lXSVF0Wng5aGxaK1p4VnZzRU9McU54aW1tSkJSOEFr?=
 =?utf-8?B?VWxCMXJnaGFYb3RCVXlWeEMya1pYZnJaZlFZc3RDSHQ1akc1SkZVTHJ4OFd3?=
 =?utf-8?B?WkE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60b7896-3c44-44f0-0830-08de31985eaf
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:46:02.7875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImYTwLWwgJwVoQF76qN6uPDPn1kDysactGAJPNRBNy5khhjmfC/ASFDjqC+JhNGG4cAqN9isYCRUEDrVEaFkwNIpAPvceeyAfeKO34D8Vm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10730

Hi Jan,

On 24.11.25 12:08, Jan Beulich wrote:
> On 20.11.2025 09:11, Jan Beulich wrote:
>> On 19.11.2025 20:36, Grygorii Strashko wrote:
>>> Hi Jan
>>>
>>> On 18.11.25 15:45, Jan Beulich wrote:
>>>> On 18.11.2025 14:08, Grygorii Strashko wrote:
>>>>> On 17.11.25 18:43, Jan Beulich wrote:
>>>>>> On 14.11.2025 15:01, Grygorii Strashko wrote:
>>>>>>> --- a/xen/arch/x86/pv/Makefile
>>>>>>> +++ b/xen/arch/x86/pv/Makefile
>>>>>>> @@ -14,6 +14,10 @@ obj-y += ro-page-fault.o
>>>>>>>     obj-$(CONFIG_PV_SHIM) += shim.o
>>>>>>>     obj-$(CONFIG_TRACEBUFFER) += trace.o
>>>>>>>     obj-y += traps.o
>>>>>>> +obj-$(CONFIG_PV) += usercopy.o
>>>>>>
>>>>>> Just obj-y with the movement.
>>>>>>
>>>>>> However, is the movement (and was the adding of $(CONFIG_PV) in the earlier
>>>>>> version) actually correct? The file also produces copy_{from,to}_unsafe_ll(),
>>>>>> which aren't PV-specific. This may be only a latent issue right now, as we
>>>>>> have only a single use site of copy_from_unsafe(), but those functions need
>>>>>> to remain available. (We may want to arrange for them to be removed when
>>>>>> linking, as long as they're not referenced. But that's a separate topic.)
>>>>>
>>>>> It is confusing that none of build cfg combinations have failed
>>>>> (HVM=y PV=n, HVM=n PV=n) :(
>>>>>
>>>>> copy_to_unsafe_ll()
>>>>> - called from copy_to_unsafe()
>>>>> - copy_to_unsafe() has no users (unreachable, MISRA 2.1?)
>>>>>
>>>>> copy_from_unsafe_ll()
>>>>> - called from copy_from_unsafe()
>>>>> - copy_from_unsafe() called from one place do_invalid_op() with
>>>>>      copy_from_unsafe(,, n = sizeof(bug_insn)).
>>>>>      Due to __builtin_constant_p(n) check the copy_from_unsafe() call
>>>>>      optimized by compiler to
>>>>>      get_unsafe_size(*(uint16_t *)to, from, 2, UA_DROP, ret, 2);
>>>>>
>>>>> as result copy_from_unsafe_ll() is unreachable also (?).
>>>>
>>>> Yes, these likely all want to become library-like, so they are linked in only
>>>> when actually referenced.
>>>>
>>>>> If those function are not subject to be removed, the
>>>>>     usercopy.c can't be moved in "x86/pv", Right?
>>>>
>>>> That's my take, yes.
>>>>
>>>>> Making copy_{from,to}_unsafe_ll() available for !PV means
>>>>> rewriting usercopy.c in some way, Right?
>>>>
>>>> "Re-writing" is probably too much, but some adjustments would be needed if
>>>> you want to keep the "unsafe" functions but compile out the "guest" ones.
>>>> It may be possible to compile the file twice, once from x86/pv/ and once
>>>> from x86/, replacing the self-#include near the bottom of the file. The
>>>> former would then produce the "guest" functions, the latter the "unsafe"
>>>> ones.
>>>
>>> Below is the difference I came up with, will it work?
>>
>> That'll be on you to make sure, but ...
>>
>>> --- /dev/null
>>> +++ b/xen/arch/x86/usercopy.c
>>> @@ -0,0 +1,77 @@
>>> +/*
>>> + * User address space access functions.
>>> + *
>>> + * Copyright 1997 Andi Kleen <ak@muc.de>
>>> + * Copyright 1997 Linus Torvalds
>>> + * Copyright 2002 Andi Kleen <ak@suse.de>
>>> + */
>>> +
>>> +#include <xen/lib.h>
>>> +#include <xen/sched.h>
>>> +#include <asm/uaccess.h>
>>> +
>>> +# define GUARD UA_DROP
>>> +# define copy_to_guest_ll copy_to_unsafe_ll
>>> +# define copy_from_guest_ll copy_from_unsafe_ll
>>> +# undef __user
>>> +# define __user
>>> +
>>> +unsigned int copy_to_guest_ll(void __user *to, const void *from, unsigned int n)
>>> +{
>>> +    GUARD(unsigned dummy);
>>> +
>>> +    stac();
>>> +    asm_inline volatile (
>>> +        GUARD(
>>> +        "    guest_access_mask_ptr %[to], %q[scratch1], %q[scratch2]\n"
>>> +        )
>>> +        "1:  rep movsb\n"
>>> +        "2:\n"
>>> +        _ASM_EXTABLE(1b, 2b)
>>> +        : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from)
>>> +          GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
>>> +        :: "memory" );
>>> +    clac();
>>> +
>>> +    return n;
>>> +}
>>> +
>>> +unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int n)
>>> +{
>>> +    unsigned dummy;
>>> +
>>> +    stac();
>>> +    asm_inline volatile (
>>> +        GUARD(
>>> +        "    guest_access_mask_ptr %[from], %q[scratch1], %q[scratch2]\n"
>>> +        )
>>> +        "1:  rep movsb\n"
>>> +        "2:\n"
>>> +        ".section .fixup,\"ax\"\n"
>>> +        "6:  mov  %[cnt], %k[from]\n"
>>> +        "    xchg %%eax, %[aux]\n"
>>> +        "    xor  %%eax, %%eax\n"
>>> +        "    rep stosb\n"
>>> +        "    xchg %[aux], %%eax\n"
>>> +        "    mov  %k[from], %[cnt]\n"
>>> +        "    jmp 2b\n"
>>> +        ".previous\n"
>>> +        _ASM_EXTABLE(1b, 6b)
>>> +        : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from),
>>> +          [aux] "=&r" (dummy)
>>> +          GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
>>> +        :: "memory" );
>>> +    clac();
>>> +
>>> +    return n;
>>> +}
>>
>> ... we don't want to have two instances of that code in the code base. One file
>> should #include the other, after putting in place suitable #define-s. Which
>> direction the #include should work I'm not entirely certain:
>> - pv/usercopy.c including usercopy.c means usercopy.c then ends up misnamed,
>> - usercopy.c including pv/usercopy.c means a "common" file includes a more
>>    specialized (PV-only) one.
> 
> Likely it would be best to build this into library members (ideally one per
> function), such that unused ones wouldn't even be pulled in by the linker. I
> meant to suggest to move to xen/arch/x86/lib/, but right now we only have
> xen/lib/x86/, where I don't think this would be a good fit. I've brought this
> up with the other x86 maintainers ...

I've seen your "x86 lib" patches. Hope they will move forward.
I'd be happy to resend on top of them.

-- 
Best regards,
-grygorii


