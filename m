Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFZAOiexhGk54wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 16:03:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86565F45FF
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 16:03:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222080.1530126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo0sD-0005SW-QI; Thu, 05 Feb 2026 15:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222080.1530126; Thu, 05 Feb 2026 15:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo0sD-0005QO-Ni; Thu, 05 Feb 2026 15:02:25 +0000
Received: by outflank-mailman (input) for mailman id 1222080;
 Thu, 05 Feb 2026 15:02:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2IOj=AJ=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vo0sC-0005QD-1n
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 15:02:24 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac719c64-02a3-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 16:02:23 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5266.namprd03.prod.outlook.com (2603:10b6:a03:22d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 15:02:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 15:02:14 +0000
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
X-Inumbo-ID: ac719c64-02a3-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPgSKIGx++s4TM3JqBU6/mJUA63x6zS5B+nHKXt3EFEZo7+X8cwWWOt6crBZQqGNs84ikRbH2zu/0nqDr9ZMSAqBsConrZXnp3vIoIq4e7NS1OBI6EWrGfTF+lbgTLJSz7rRvFpkcq7Yn04+9ZWrtYJ1Hlfeg3GT0drP03LcOTfp8qM3qGPQB/8vMEw0bFzWL+DwUlJYygP2SQKAaBC0TsdIYWSSMQaAaONRfi9syzWEgXLMeaY+BHHGqJn3DxEQJbbbOOJX9yyDl/WT2PQ2JWUENeRucZqyahCv/owD3+aytmCCkPkMdIAmaYou/O9EyFPzNe4mQo53IqRUsc3lzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAmtEgyZ3izE1S3KpuxV5RgaSy/1mD7wvplzaMq4vl0=;
 b=yoDdk60Io8gxRndLgz7Dv+vtqfYbJ7bKR3R1208ajAulhq3aIzbTJOG1kJEdfWPVYzWkcvro5YJMLZHlxm4MHvE/Xzaf2gwk64XE2A8GjdRYNloRv1aRM691nmVhVnCuX7895I74XI3tfbnIR7jSA2hW8ATj31h8rsI5k3V35wXggrE1v+3RipdX825C7qV8QCBxeBLSw5IE68Vguea5Dxgc3fVbANDo/DgcribdQOi6otUG7VX5wtvwMiaY8SCCSUqAfNs14YfxdmgD8gq5lfPjUbIX2Zckr1eqAmGL7mF+3EFf2lFIXKO2o0uALIvEXVU0vpq0GGHaqUAABaQQkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAmtEgyZ3izE1S3KpuxV5RgaSy/1mD7wvplzaMq4vl0=;
 b=Ssmxv4dLWx7XbnwV20b2WVDxmv4K2u5HmCzaE3NMEGStKrd+LT/DfpeFKllkWEKhikjAFFfViQ0mEszyfz4byjPhz+Qn5imxhLjp+l6827VKRC7nqp1ZP62QnPIh8jTufQfiiYiHn6L4ACs4rCi/UhO58PBXArQMuACjLqb+Yxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bb453adc-0b5b-428a-9a34-8c4b92c3c927@citrix.com>
Date: Thu, 5 Feb 2026 15:02:11 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/arm: use BSD sed compatible regexp in SRCARCH
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260205145913.99032-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260205145913.99032-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::27) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5266:EE_
X-MS-Office365-Filtering-Correlation-Id: c6dca37d-9f28-4f62-b52d-08de64c78c1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?em14WnhYUmFWQXJyQjZoazcwMktNTHRoZC91WlViVGZ2aER1Y1N2Zi9Ybm8r?=
 =?utf-8?B?MW83UlMxZVRScjZ1WDVWNlBMbmxiQjFqam9sYVRZNndYdzF1WTVkcXFDUVZP?=
 =?utf-8?B?dWVDOVJQQTFCcitXd3BJeGhtNXQ0UWtwZFU4T01ETXF0YUxVbzlRWGZxSUtP?=
 =?utf-8?B?eGxQTFU0TkJvSGtqV1Jpd1lMRlJpOE00djliOTM3LzBDd0QyV1NXOE02UlZO?=
 =?utf-8?B?N2JZaGRKTzJJUDFoOXNkWXNmajV2Zk5pd1ozM2haRmRKb0xiK1JYUXZuMXVU?=
 =?utf-8?B?cS9zWEZZRmtkQnl6R3k1azZzUzROOVFaZ2ZBMGRFdjlzTDFlM3B4SThPUjd4?=
 =?utf-8?B?NmVKdjN0SytlTDd1RVhWOEVocStQYTU2amRXLzJPaXNwTS9JK1FWVjBUTEVW?=
 =?utf-8?B?YksvYnNRRm4wSDVBY2RHb3FzYjErQTZ3enBzZ0tsTFdJaVpuRFM4MGN3SnpS?=
 =?utf-8?B?bGxhd1FGNi9PZjFScnZaOWR1QVlxd1FxNUdvdzJIK0ljeHJEbWdQa3NYbFRW?=
 =?utf-8?B?SytpSGFVRlpuOG1Tclc1RzBWMHZubVYwRW9sWloxdEpCdWZOVFNZU3ozcVFO?=
 =?utf-8?B?NExMY2ozT1RYV3JrMnIwMkRIc3FLWHovQVI2WEhySlp1VnRQOUZWNWNGMnhR?=
 =?utf-8?B?MGdVNjBoTk5oNEFtTjBnUHVJdUlWR1pXbmRpNWNHQXYwN2laK2h4aFE0SWtD?=
 =?utf-8?B?N1dsa2VjamxYYnZ4MXpFT2tsb0lZWWVUZHNTa1NmL1JtV1VvbStmY2tQZmtC?=
 =?utf-8?B?Mk1rTFVpWUVqekJhaWV5V20zUVYxQmR6V1BJdzBwZ1hpRk1YZU84SWk4Qmhp?=
 =?utf-8?B?V05xL3ZxdG1ZT2ExYXZuV3lEK1ZLTHQ2ZGlyYzFsN0Q0RXR2eFhQNnVTN29v?=
 =?utf-8?B?Zi9KeThhS29oWEpBbitDbTUvekhnVmJHZUFsa09YbllIWWJSRDZZTXFnOWl2?=
 =?utf-8?B?RldncHptWUExUndnV005blp0YzF4azhkT0xOaWFJL0xKSVVYUEw0K01aaWkx?=
 =?utf-8?B?UnFMeHl5MWU2anMxR2g2QTJnK2VXNzV3SUNya0NiTjlnL0p1MGR5RnFmK3hD?=
 =?utf-8?B?Nmk4eDU4SmlORWZ6UkJPei94dUF2VWl6cFZhV21HSXExZGxvcm9ETGNod09W?=
 =?utf-8?B?N0VkREV3NnY3Y0ZxQTVENUNqMGlPcUErTS9FdGdpUFRPajNqNjJJcjNTZkhj?=
 =?utf-8?B?aDJzbmlVaTQ4UVRyNDNRNncyVFhOSVQvYi9ZbDM4WlVXL0F3UFJXS094eTY5?=
 =?utf-8?B?YlFzVjBTTzJNWlJlN3FkcWZWNmdnaEpsRmlYQnpTVlFPOVBRYVlvZHExcDJV?=
 =?utf-8?B?STFTTjhKOG1uM3NjK1lEUEg4SFROeHI4TmVIZzZkTklKVWttVHNWSHhoRThy?=
 =?utf-8?B?VVVwODRPdnl0eUF2WlRMYkJkYkxTVHY3Q1NLMU03Zm1RQXN4dUVYRExEQXdx?=
 =?utf-8?B?bVU5SnZEKzBHRzVBRXB2UWJPcVNYanlHQTIyVnpISjlRTG8zV1BxeHlBTTc0?=
 =?utf-8?B?RnpNa1RHcFhCSzJVaVY5OVZMTjB1azlFWnRkY2NEdDJQRDBWNG1ON2t6Y2FW?=
 =?utf-8?B?SW5FTTJJWjI3MXVYUnM4dDR3V2ZVd3JBSnpPS2tteWtUZXZreVRRVHBBMWc1?=
 =?utf-8?B?Q2FFTDRKYTVEVTBnS2k5ZmMzaVdjdGFZcm9qTS96S3BkNktUVGRkTXY3L2p3?=
 =?utf-8?B?cWN1MXBHQnV3MUJNSUljN2RCNmU1ZjNPdDhnOWdMT0YvZWxhL005enlCNWtp?=
 =?utf-8?B?RmdOU1Z0TCtNUkpLaFNnMk01dThrQkNOOFk5djVaelFWWW5EZTYyOFp1NS9N?=
 =?utf-8?B?bEE0NU1XNlpuTUEyWElUbEY3WG40YjlOamdKNXptcW5CbkhtSTdoRW5rdy9K?=
 =?utf-8?B?ZzMxbGNsb2g0eWFhdk5UQmhZUzFYK2RMUWNWd0RZWVVBVE1xdmNOWVdRdWRP?=
 =?utf-8?B?a1JvWWhUdDh6bTNnVGVEVExlRjl6MXExRCt0Z21Ud0JiNTliZ0diNndPOUhR?=
 =?utf-8?B?aFQvb3g0RlJ3TllMT2NXRTN3NTdsZ24wRkFsL3E5Y0RrTURlQVBiTTNlT2Z6?=
 =?utf-8?B?bGZOQ1d1RmtGQ3N6WWgzNDZpR3B0OGFLbGEvMjB0dnk0ZWY4MGY4UUJ0SGcr?=
 =?utf-8?Q?qrXI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkI5d0wzWkhCSm1GQjdKVDZ2UTlzYUtoakRuQk4vOXR3V2d0eFZVa1ZjdW1F?=
 =?utf-8?B?SmpyK1ZSZzFlTG5ncFIxUTVNWkphUkZjaUpDcFRoSVlJZVlUZnVHUmZ0RWkz?=
 =?utf-8?B?Ukp4RTcvb0orY2dDZTl3Q2Q0aTluZjVUVkYzV1VZY0pwUXY2TWpJVnh2WlZ4?=
 =?utf-8?B?UDg5eHZsSkNPaXRreGg5dmVmTTZQeVl6ODhFU05hY2J5Z1pRK20rdER0SlpU?=
 =?utf-8?B?OXZ5Q2ZLQ0cwNzV3TThGdFRPMXVvTHJ5UFlVYjNHOWxWbmFvNGtheGlybjE4?=
 =?utf-8?B?NWo4L1dvcjB1VzNJVDlQT1NaRTJ4VjljTjlPR0dJZVFzU3EvV0NUaS9EcW5j?=
 =?utf-8?B?OFN3dTRZQUJ4UHZ5N0RZQjEwS01ZUlRUUVlyaktSUlJSVExQUUhjTWRacDBx?=
 =?utf-8?B?TlJhR1Q1TmVqTmhWN1FJY0V1bWV0UnFBWlczWnllRkpWQmFKNitEQ1dIZUw5?=
 =?utf-8?B?TnBxblhVWkZKV3p2V2FnYTRPVkJPUGVZYjk2Wk9KUkpJdlc1VEkxNnhZK1hM?=
 =?utf-8?B?UFB0Qkl1OUNhcWVNSVJvU0VmZzhFNUFRK1I4SXZCOFZ6YU1rRmdBRFBESnZi?=
 =?utf-8?B?aWxmcnArRTQ5d2JtaGY4NXJySGJLSFNPcUV2UDR4c0dZVEE2UVFNZlV4WXNG?=
 =?utf-8?B?d0U3c04wYUdNaDBuVUhaOHBSTVN5b2lVWGIzSE5XdDdtb2I0dThkU2xoUVNX?=
 =?utf-8?B?Rk84K0VEVWlQQWNIdzdSVWliTEMxeHRXLysxK2Z3L05pMHJmOG1teFRFZzVS?=
 =?utf-8?B?N0cxWXdEMTkrTmp6NEwzcE5qckRDa0J4eldnbnpvL2l3Q3d0NG5OS3gzYkQ3?=
 =?utf-8?B?THNabkFPeFB2UXF2NUtVOEJ6VWQ0TVM5TGlYZE85ckE2ZjJPVy8zK0xPQWYr?=
 =?utf-8?B?M0tqdDZjZDI3TzM5S29RL2ZQZU10OE1mckJVekV5T3VTL29xYVUrT05oOWlN?=
 =?utf-8?B?WHdBM2x2UUo2aURhYnpZVHJSdXYyNDd5anlxYWtzT0hzd1R0K2RoZ1lDMEVj?=
 =?utf-8?B?cUw5SGhPWFlqcG5BQTNtU25pckVGcWF4ZzczejR1MzRpNVczOGtERk5xY2Ex?=
 =?utf-8?B?Sm0xV1J3QTAvb01mV1d6S2tMYjRxaWZoQTVZNnQzZUlSVmhkd3pITjFrcHA3?=
 =?utf-8?B?OUloWTZvS2UzS2JDS2FzVWIvZHZYTmpKT1g2M1JrZklJZWhwclRuVFgxYVBs?=
 =?utf-8?B?a0pFaDUvd0dBWDZhMk5BQ3lVRGlaWlZ6TkNyRG5KUkNMZW9DaDZ0Q3JkdlJz?=
 =?utf-8?B?bEJDRkg0ZUJ6WjZ1OXR5Tjk3Vzh3bHdTdmJjK3M5Tlhta2UxNWk2UHliL2ZC?=
 =?utf-8?B?cVFIbm1KQ2I4VGZYMFNuN2xMRmlTQkxYQTV0SCtmaFpxeVBPOVRDV0tRRTBx?=
 =?utf-8?B?ZDVvOGJLMkwzcEd2V1QxMDhUVVc4bjBJQ3FSMWE2VVlVNUNvTHphbVIvdkNr?=
 =?utf-8?B?aWxtRUtUc1QyUXhnZU5wMTYxd1Bsc0NpMHEwMXptMm1PRjZUT3hqSVBMQjBl?=
 =?utf-8?B?YkI0T0p3RFAyYVNYdmQ1Y1phVzVCNUF1R2gwMEJkTFZRUjBjQUVwMnJVTWl3?=
 =?utf-8?B?VDNXVngvUFpMQ3dGcDMxcUNHaUNSWWcxMTFXNThiQXdXOGxxWVF1UnViQUsx?=
 =?utf-8?B?citkYkxObUdxTm9EeThJUjhMOFZoM3A3UGQwKzJYRENaandNYkc3VU9PVU5S?=
 =?utf-8?B?SzdYaWJNY1FaYmYvV21aTi8yQnBDS2VpVkdmbWw5VGgrbFhDZGlJNWlHQmQx?=
 =?utf-8?B?U3lrUEU3OFcxeS85dWtFV2hUbWJYQnYzZjc0cUxqeUVQTHQvR0Z4cTNwajBx?=
 =?utf-8?B?bFM5UWt5RUlzaUprL2tMVDY2UXlpNitxTytDVFRGMUJlcjhRaE9PV0xjdzZJ?=
 =?utf-8?B?dnZYeDgzQ3ZKdk9QOVVRVlE2MFRBMnhlZnpqMjF5dW56RlI1ZlYxbE1GVWhr?=
 =?utf-8?B?aVBPRytIaHlwT1UxZWVQVEN6cm9EMVhwNlNBYk9uU1hDcHo4cTExd2lqSXJX?=
 =?utf-8?B?ZWxvZlpFMGxSQVdqNE50eUZUdnVkYUx5aWVtVGFQY0F6VWZsZDA1T1dlN21J?=
 =?utf-8?B?QW1ncUtxMlJUSzFhams3QzV0ajIwZllNT3NlRmdWRFJ0RTZtNzduY29zeHBV?=
 =?utf-8?B?WFdvWmpTRDMzQU5oQWhScmt2cy9SN2lFdlE4TE9uenY2SGR2c3RzK3ZQemM5?=
 =?utf-8?B?QkljZHQ3Z2RIazJraXdvZVc2cS9Wc3hQenE3MVlobHBnbzNvaDRJVlBQa0R3?=
 =?utf-8?B?NkZWRnorSVVLcnJWRlBhTC9jdmdyRm9nSURtLzU5dXgwcjRUYzUvZ0QwR00v?=
 =?utf-8?B?MzAzY09ZaUZYZmZEajFFczIxOXdNR0FUSzJwenZjbXY1T29DVmtYZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6dca37d-9f28-4f62-b52d-08de64c78c1a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 15:02:14.5970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXGFgY7aHSk572tBtYa+IDsoh+N5w+owdW2azzoxBPQvTpPyuwkmCL30Drs/JCbvBzRAHHdFa6jqf3y2lNelX6E7bA9C8mcYe/n6w2jIHDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5266
X-Rspamd-Server: lfdr
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
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 86565F45FF
X-Rspamd-Action: no action

On 05/02/2026 2:59 pm, Roger Pau Monne wrote:
> Convert the ARM SRCARCH variable setting to use the more common 'arm.*'
> expression rather 'arm\(32\|64\)', as the later doesn't work with BSD sed
> for not being a basic regular expression.  The usage of | alternations is
> not part of basic regexp support.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

