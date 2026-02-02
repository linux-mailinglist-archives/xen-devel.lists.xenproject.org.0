Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDo9Oa1sgGl38AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 10:21:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C573CA0CF
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 10:21:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218439.1527183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmq7d-0004vS-Iz; Mon, 02 Feb 2026 09:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218439.1527183; Mon, 02 Feb 2026 09:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmq7d-0004sh-Fi; Mon, 02 Feb 2026 09:21:29 +0000
Received: by outflank-mailman (input) for mailman id 1218439;
 Mon, 02 Feb 2026 09:21:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTrP=AG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vmq7c-0004sb-KL
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 09:21:28 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cb1992a-0018-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 10:21:27 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH7PR03MB7833.namprd03.prod.outlook.com (2603:10b6:610:249::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 09:21:23 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 09:21:23 +0000
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
X-Inumbo-ID: 8cb1992a-0018-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4aAjPuWqmX5H3tmul9S+UUCij59WEX7jTi/FAfPQSoyjlUVFBRws3ONkwMydqZSj1TJyd0WmFxoAha+hmiYHThePmPWp9OPJzk9Tv9yQdQkonzJEZSPyGFppJPY0nCIUe28TCuXAUHFxsYaftIkcZEhNrE0oFVZDQep3AxT/IgT9sC0IqmWKzovZAz0a4C19TN55y9jyU+Ko69SViZMBOaDToLulMZtvc5NyyRwOwLU39Y/YOh3l3DgIuSUl800N0ic6tW/X1iLBV0H9pyI6PD6nJHBoQBSszdv8785tu/VkQ6hDf9aBQY/dCUYDhFOqFA89AUj6TYVgbdngzozVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znUDnci0R8WKNobrONWueMov6XMO8k+67w/JNfIRzUw=;
 b=ln6lQORKyLLlC8ON1KMv6LAmVa587JakbBp0O1IekVcda5ZwtHhdYl9MZLH4e8CN52sRWC4mXi72/qo6EN5U9CwtOpdx8aY2qFcFaqO1MwbHVUtD636h7giU60otT7iztJxbcZOTP3gzUoG+yQj1ztaLgezMvoDjFQvRXbjgNMk9Hr0y+IFK2A9pJmUBvSoNQ8E/xRKSUuBj4O6WPZ0M6KnPjCtlbceHtOHt9JVr9e1wOp1/ZqNoJPQ9p4UqLj7UFyOuVRghLZVjRTEB3204DDlQWxkctcVZvbNz3EdfIJkskDQTNjEY/SVjAmjHm3mnQ25L4LSzufKp37jCCJDtQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znUDnci0R8WKNobrONWueMov6XMO8k+67w/JNfIRzUw=;
 b=aXEetn1iL9xevw2N4r5uBxWosaaTRUUU0J3wqAJlsJq8RuvW9tp7RaF5qL3IzV2fsEmzHz+kfa4vC7gcFR8neSYF+4JEh+VGzc7xmSUzJU8KSHXr3Zq3V2Zw5+VIwRgSSfgT5YOL34LTXhaCz+HZZUWC1IPwg3wFym6b/DIt/Zs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 2 Feb 2026 10:21:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 2/6] PCI: determine whether a device has extended
 config space
Message-ID: <aYBsj4BEvtsUncHY@Mac.lan>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <99d45a27-ce67-4f10-9883-dba96f055285@suse.com>
 <0873c6e6-eac9-4d9a-bde0-347050b1547e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0873c6e6-eac9-4d9a-bde0-347050b1547e@suse.com>
X-ClientProxiedBy: MR1P264CA0087.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::25) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH7PR03MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 160f3659-0ee9-4d57-8f15-08de623c6f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SCtMS0l0SWFkM2g3ZXcwZ0w2UDlJaG9GYm1reDVQblVPTllzdENDL3d6Z1Rp?=
 =?utf-8?B?bEN0RDh6ZXBQbm5wU0ZrRTV5bFFBVEhVRHlUdi9QOVN1VEdHcHJxSWR0c05B?=
 =?utf-8?B?RFVVOHh1RSttbC96azV5SER6Z3drTkRkYmsvemFLQ0loTWFZajd4L2xhOVg2?=
 =?utf-8?B?MmVzNUs1bzlMcnFaaFVnbmE3cElaWkZrV2VsOVpRUlYza0ljVmZ2QzhUWEl4?=
 =?utf-8?B?cENuN0s0MDcrQ3BXTnd3UkZsM3JXS25PNjdEVkN2T3QvWm9kOVZZVU1Mb0dC?=
 =?utf-8?B?d2tjczkySEVZRDNyZVhjZTRqUlFTek5rOWhFWk9YYW8rMDhkTW9WUmwrSmZn?=
 =?utf-8?B?Y0I0Qm1WNTN4Ulh6SUFBMThxSEw0Vno3blk1MkVQQTRVSUJVSUpqMFdjQjJE?=
 =?utf-8?B?Q1o1RHRwa2RCb3RtWHFXaHlkQk9CR2JPdC84bTI4UTFmRG1EaS80WktxR2RB?=
 =?utf-8?B?Q2JWSlR1WjI4YkZrd1NON3JyTUE4VlUwODh6OFQrMlNjdTdhRmQ2SFYwUGlH?=
 =?utf-8?B?dE5EKzVvT0ZzS09PWVFtYUhhQkQzZ1hVV0EwUjd0ZHhQN3RBZVFaMHE0V1da?=
 =?utf-8?B?bGVxYUczcE1kbFIvK1k3NTI3YXlkbEd5U1dBQWcvT2EyZVRVaEU3ckNmTHNV?=
 =?utf-8?B?dmpvWm4zVzZGMWVGcXhJYWg1eXQ1OWlBOW5ZU1E0TjlYeGtjaGRzK05XckVC?=
 =?utf-8?B?cWhLeDdyTEc2NGxNUnFPMGFaQjZ2aDhmby9xOFZIM3N0bk4vQ00vMWcxUExo?=
 =?utf-8?B?VTk1MkI2TDJrVzl2NzYvVm9OUzlmdXM1Z1BERUQrT0tUNUp2WGh1dmRsZXNy?=
 =?utf-8?B?NGJoeWx4TjZHamYyT2w0T1BHYW9YYnBiZEtpK0dFZzVXV2xBMEg3MVZMK2g0?=
 =?utf-8?B?SjB1cGl1L0xnaWovNmtoMi9qazZDMHRpcFh4K1J4Z0ZNU293NlVmODNReW40?=
 =?utf-8?B?RWNIZ2I4eWkydVlWRk9iZ2hYZ1BSNkdxaGUzd1pXZHNwK0Z4K0ZIUFlQMHVY?=
 =?utf-8?B?TGtEdG5RQU5xTTNjS1lQZTJCUDF1Q2VvWTdWcXo4RC9Vb3NvZXEzZ0UrVzd4?=
 =?utf-8?B?a3FoeDNqWkJ6RktSRGtaVVhOR2NNb2JGZ0d2L1V5UGNvOTM0NUZXMzlBcVk3?=
 =?utf-8?B?YWRJdEFiczNjU25kY0pFTngxeHAzRFh5dnQybXdBMHEvR09acEY4SUVjdGw2?=
 =?utf-8?B?aGtZWjk5eUNQb0tRa1FZR0wwVXVrQ21PcUtUOEZCQmdTZi9RY1VqM09WYk55?=
 =?utf-8?B?K1lFYXovRGw0STNjRk1hN2gvU0NSUk45MW9CbkhYeXRrSWVabllrZWZqRk5r?=
 =?utf-8?B?UlZlN1dkQjVkRVprRnBWR1V2NXlKZ1gybzVRbG8rQ2d2d0pFRkY0ejNmcGoz?=
 =?utf-8?B?RG00M3dRbWphSzZKbFpGZHo5dEJtRjFtUEZySFlua1pMRER3S2Q4eDNyRUJZ?=
 =?utf-8?B?UHoyZXF1U0JXT2o0TThPeDVZVVMyankvdXVFZy9lWlB3d1EyRGtrbmZHZlVK?=
 =?utf-8?B?aGM5VFpLWFJSbmZrN3NEbHVQQW1ROEU4bDdpeVdOVXNrWkRZZ3IzejdJVUl4?=
 =?utf-8?B?bzl3cTM1Qm5naWNvYUZ4dFVLVDc2WGtWOTBHZmw4TWI4cDlZOGNWc3gxYnM4?=
 =?utf-8?B?dWErbW1Ub1IzTzlhOHdPbkJVYitRQ2FJMU5uSVVxaE1BcFFVcmdQcm9URTha?=
 =?utf-8?B?WGRVTGdPZlE0dkxTV3lFai9iSytQR0JadTNEK2s1YXR0ZlZxNkFCMk52akNM?=
 =?utf-8?B?Y1hTdjUxaHR1TmZ1c1hBdjZORGFKaU1MWmRGeCtlaDV2aktQV0llMGNCTVBJ?=
 =?utf-8?B?bk5xbURsVk16ZWV6SEJSUWgrQURyN1BCMk90Q05iSW1VWlh1NDAveDZFK2J2?=
 =?utf-8?B?L0JMby90Y3liMllVNHQ3NEVhYjc1QzhGVVdKMlFpSFl4RE9yOUFLREVIcnpP?=
 =?utf-8?B?STFMR0xUMXRHNkwyTVBkR2U1eTFJMHc3TmtOeUdrcFJodmR1RStubndhNzIw?=
 =?utf-8?B?YUVTL2JlbXZnWnhGZUovZHhncENyMHp5QXJob21mZ3B0aXc4TTRXOEcwQXVs?=
 =?utf-8?B?dWtOc0EyTmZFVmlPaEJQU0lKU0g2OWdLRHlLMnlxWFI2VlpCb3l2NUVrdDI0?=
 =?utf-8?Q?szYo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qkt3ZzhqSnJscVdTRDhwc1k5VVR6TUd3N1VGekRHSFRlenJkcGlpeTVpM1Rl?=
 =?utf-8?B?TzY0d0dWWm4zZXpkOHprbWQ1RFhaY0dxQTJyOE15a1E3djBqajE0TGJua2dQ?=
 =?utf-8?B?dVpzRlVUOWtxRVBTVERIY3ZsWll4VFBxYndXOGpDZFptcmo1TWs3NU9tVFdn?=
 =?utf-8?B?c1pWMEVXTVZoUDh0dXhxcDNMMCs0bVlGc3VuL2J4ZldaaXNnaFVzeEFVaUlY?=
 =?utf-8?B?bE9QTDVybWpCMjdaNm4vVUUrYjFNcEVubDJ5MDlBRjN1SC9KKzlWV1RCQmkx?=
 =?utf-8?B?SG5uMm1UYlkrT0M0VjFmdFNTcHA3YXJlMXcyM214WlFaamxzNkh6NktVWGhz?=
 =?utf-8?B?T00vQ1RYVytFVVdSa3B1Ui92WXJ3TGFxTXd6WnZLWmJzR0dSZHlzckNpb29O?=
 =?utf-8?B?eG1tOVY3UmVZd0VvUVRLNEdIa1NmVzdxS2RMWVA3MXZpelFIa3NXNDc0bkNH?=
 =?utf-8?B?USs0dmUvTmtmVDhIcWFLUS9naXlXWmFET3JvL1RGQlNkcjRwRnlvVUg3RXdi?=
 =?utf-8?B?QUpTTjBTS2w4SDFWb1M1TCsxWXdjK1hvQ2ptRjE0STVnU2RLVzNZdGpSakpx?=
 =?utf-8?B?WWtKdThOWXE5OUZwSVhLdThCcG1WbG04a1g1aURUMUZCZjlGL1hndXBwbmZC?=
 =?utf-8?B?NVB1U1VBR2FubXJBKzVLeE5TZm5ZVEZqZkhFRWNJb1ErRGduTXM1Y1FRS2lh?=
 =?utf-8?B?aTgzc0w5SitTeFN0ZUlweWgvcFR6dDdHNThXUGUwMGlzWEhWb1oxc1p3WXJD?=
 =?utf-8?B?cXR6RTFPQTIxL0ZVblR5RFgxMzNxNkVKRWdsNVdpZnlKdWM1a21lWVJvTWJl?=
 =?utf-8?B?M3ZuUGtjS1JVZ2o4Smd6WnBORXg1S3Q1dDZPNkVXb1hPUFNvbkN3bldMZnhu?=
 =?utf-8?B?THNRMW5NUlNMUzFscUJaUG5IN1RBQVhiV0FrQlRuS05DRDMrMWJXZWlEV1FU?=
 =?utf-8?B?Y3RaSjMxc3BzZjJyK20rS1pQV2YxV1JLYUhFS0FUTTBNN0FXSWdXOXVJWUE2?=
 =?utf-8?B?bHVtb3k2dDZ4RmUrelJidEllaUlITUlQQU5EeVlJN1lLNVp2VFU2bmZPNW5n?=
 =?utf-8?B?dUEzSGxyZzgxU3pQZFR2OUdpak52SkhxUHFoemdQNzI3RzhuaEs0Vzk2MnNv?=
 =?utf-8?B?bHEwUm5CVkgzTFI1dWxBNFAwTTQ4NkdtVThFRnd2MWtiWlZjMVdMT3ZaQTVh?=
 =?utf-8?B?cXY1R1Q3UlJkRFQycm16NjluNVB4WUFvSmM0YTJFaTFYcG9obDRxRWxWNmdy?=
 =?utf-8?B?WGVmZWhvVkd5WFRpVUh6bTMyY0Fwd0xwVC9reVhjWHNkbFJiNFROSXZRQVVa?=
 =?utf-8?B?NXQ4SlBPdlk3OTN3YjQ4bGpzS0RIZHB4SHpTOGFDdFdiVFRYdmhVRzBnQllK?=
 =?utf-8?B?OVJOQmlLb3hMT29iYXZlaHdRbHFqWjFZdEtVNzBNSkJXRVM4U004N0ttN0pX?=
 =?utf-8?B?L0ZUdU5NeHVoY2RjYndhUDVKVERBM2QzcTNMWFhYZVk4RHJRVlZOMkYvMnY1?=
 =?utf-8?B?emEraXA1eWhEbTVBNXFYVS9INlkvUHlBZCtNenBoaW9WN0ZCMFBnUWxNUzNU?=
 =?utf-8?B?YlYyNk52RERwcWFiTG1GNHVVcXpBZW9Bemh4S2VCMktoaEsveWMrYTNEVDdk?=
 =?utf-8?B?N2xIK3ZTWFRYSEpXQ1hkNkF6eW5lOE9TWU45bGM3TGdyclRRVHYrK0p4TUZl?=
 =?utf-8?B?dDZuQmViNFBWbXhJSSt0enhYZmdSaHdDZEE5NmlNbXR5dWRBR1F6RFJyUU5L?=
 =?utf-8?B?NWtGMWtaYUZmUWQxWVlZdXdQMzV1cWpMMmZ3bDAzV2ZZUmRRb2JFcGlOSEgv?=
 =?utf-8?B?WmlxNUkrOFJLNWppbU8rRno2RjJBVnJuQzdMUER6WTgzUG5rZ0pDbC85bFho?=
 =?utf-8?B?S0ZjeEVVYXVxbW1YZGlaZFZ5dm5WM3AyTDA2ZFhpMVQwNHZlYzZ6L1JjdXRN?=
 =?utf-8?B?YjlVbkxBbmtmYkEvMGtaZ3BiSTM2ajBXbmNYZTRSVjRELzFFR2VFM0FlMkhM?=
 =?utf-8?B?alM5Q3l6YjZCRmU4ay9rb0VFNVZFZXdKcnBKOURXZnNVVks3U3ZJWEhLUTVK?=
 =?utf-8?B?K1E4eThLQUFlYmh6QzFWcm42dnc4MHk4K1ZtMmVaOWZla0FvdjJQNVZmMHhM?=
 =?utf-8?B?b3hNSnNHb2Fab3FyNlRlZmp4dHVwTjQxcmxyMFU1RzBkdC9nRU9XbWZjVG1k?=
 =?utf-8?B?ajc4NmRjWUhJNGZYbWo0c05EUVh6REtxOFpxOEZocjhRYVJqR1lpOTNuanl2?=
 =?utf-8?B?SHF0NDlpSklmRW1VdFRIK1MyMGdMMi9mbUtBMUNNS29xcmJ6RGNIanFOejls?=
 =?utf-8?B?SE51U0QzZW96YTR0UkpOTk4zblY4ZzdPM3JOV05xcUFtUDVTK2RmQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 160f3659-0ee9-4d57-8f15-08de623c6f0f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 09:21:23.6196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57xtDimVlg4Ww0WLbCw6mABOZyZGAFxlAzDZ6GIC4sA5yuSIzZi4djpdsEHtbS5X91dqIcnWxVl+CxYYLo7lig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7833
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5C573CA0CF
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 10:14:57AM +0100, Jan Beulich wrote:
> On 29.01.2026 14:08, Jan Beulich wrote:
> > @@ -1042,6 +1053,79 @@ enum pdev_type pdev_type(u16 seg, u8 bus
> >      return pos ? DEV_TYPE_PCIe_ENDPOINT : DEV_TYPE_PCI;
> >  }
> >  
> > +void pci_check_extcfg(struct pci_dev *pdev)
> > +{
> > +    unsigned int pos;
> > +
> > +    pdev->ext_cfg = false;
> > +
> > +    switch ( pdev->type )
> > +    {
> > +    case DEV_TYPE_PCIe_ENDPOINT:
> > +    case DEV_TYPE_PCIe_BRIDGE:
> > +    case DEV_TYPE_PCI_HOST_BRIDGE:
> > +    case DEV_TYPE_PCIe2PCI_BRIDGE:
> > +    case DEV_TYPE_PCI2PCIe_BRIDGE:
> > +        break;
> > +
> > +    case DEV_TYPE_LEGACY_PCI_BRIDGE:
> > +    case DEV_TYPE_PCI:
> > +        pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_PCIX);
> > +        if ( !pos ||
> > +             !(pci_conf_read32(pdev->sbdf, pos + PCI_X_STATUS) &
> > +               (PCI_X_STATUS_266MHZ | PCI_X_STATUS_533MHZ)) )
> 
> To not violate Misra rule 7.2 I'll fold in the change below. I guess I'll
> further follow up with a patch adjusting other problematic #define-s in
> that header, too.

I'm fine if you want to do a pre-patch fixing all the problematic
defines in the header and put it ahead of the series.  Maybe it makes
more sense to fix them all in a single commit than fixing one here and
the rest separately?

Thanks, Roger.

