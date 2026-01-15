Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EFAD241F2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 12:19:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204853.1519392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgLNk-0003eI-AA; Thu, 15 Jan 2026 11:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204853.1519392; Thu, 15 Jan 2026 11:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgLNk-0003bN-6K; Thu, 15 Jan 2026 11:19:16 +0000
Received: by outflank-mailman (input) for mailman id 1204853;
 Thu, 15 Jan 2026 11:19:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cICa=7U=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vgLNi-0003bC-Gv
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 11:19:14 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05013c79-f204-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 12:19:13 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7431.namprd03.prod.outlook.com (2603:10b6:408:194::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 11:19:10 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 11:19:08 +0000
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
X-Inumbo-ID: 05013c79-f204-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVc4aqOFZhHr5uOYPjB2PKpn4p2NFivFsXZy4h2BdorNh/EoH3UPbr9tvHcDI/jY1HGeF6jDaYap1oI1YcFuXi8ZtbxpaQLsvE9WXs8MJ5ktxBqahTugl6RdQDzHt9AIIw8M2ewi3744E2+iKD0qrUAfWqo+4XU+5JLD44VLNjPLiavYdOBi/36uPDCPE7vJnn4dV8f6eJVQJbS/vBz9wVsoIYpqsZ6bK3m9EDnQH8OZFuK4StGwC0WD9+Bb8ElN2obSynw5K7v6uGKQ7gD59NDrkrluR0Qks3cnmPiINMbp4YLh7+SdWjXBY03Nb3trB6zcj1mDvBCq/Qw9h8uxlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9Cibf6lORNw9LbneDyZBJ7456XS35mADhwrOLDAMMw=;
 b=AqavF1uVKJXO0iCONMio9gCd5W7AheTQ/fAC7ntRzDLWEBClwxe60eJbS7oO5i93VZBnbnXFDwajj4vWbjicAdMCxXLSppg7ADM5qmZudcBwyVaEYd7WIk/z2hnprPJzPAS58vE0iTor/Fe5rBhM+IboNStkaeyXo7M8hNYu0+I8Rr9CgSvDAYmZ6VCnq2KL5P1GEjWhQOobibGGLPjYghcCxkguwKrLm6L4oeelRcTJqudH+eZpDcNGrSSFAJSZPqgNSeo88QA33m3VFsU9b90H08FkCcXikoU0mMtItUn4uPxSn1vTQxC/7ZDaJ4meA+pbtKEF+mZt/Louly3vXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9Cibf6lORNw9LbneDyZBJ7456XS35mADhwrOLDAMMw=;
 b=s0XpGH38Mi5Nytksx4/DmiWp0w6dRtWET7tvVq/b5ZrdzTWfkSryRnyaqxbm4y7iSER31dzqQtT+jpMB5rWDZgfZRgDuxbX8CxIUAwaIHRXNJ75N2uRFeubrL/MZ0jvFqY2M1idEZ7o5lHWTIXKaw8VyrR2cxNzR7rApZhu9gYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] xen/mm: limit in-place scrubbing
Date: Thu, 15 Jan 2026 12:18:01 +0100
Message-ID: <20260115111804.40199-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0275.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6704ae-ce37-4d0a-8058-08de5427e6e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEdCQVh5Y2xRSHpGSlR2ZDZybHYrOUVGTUcyWmtBK2NZSnlHQUM4OTlzbHhR?=
 =?utf-8?B?ZWFnbGNGb0xvZWROeC9ISWhlRzU0Y3FWS0lpcG5saFIrWXNRZkROZXRUZi8r?=
 =?utf-8?B?MDdtcEY0ZFF5SzNJNHA5Zk5wVW9vbGlnampTd1g3RHpGa2d0QXphRXVlbGdS?=
 =?utf-8?B?OFV0VGVOa1MvcVJqd3piOGZ6YlNpU1drekE0S1BCZEpIRTdIYzJDM3dhYjVW?=
 =?utf-8?B?RnhGL0ZjQmpXSWxMTFhCcjQ4ZFk3STFnL2ZlNktnYUFBN2dweG1ETnB0WU5r?=
 =?utf-8?B?bVNrUXlveXhxb2VHQUU5a0RSV1RlVkNwYnhYWm1qRmI2cldxbUphZHMxZEtt?=
 =?utf-8?B?REtLaFYxaUVHeG9mY3pYdGltTXlmWDkyNWl1cmEwdCt3Z1p6WFgyYWNRTEY0?=
 =?utf-8?B?a0p2RU1ZVXFJblR0QTl1ei93Sld4QS9XUE01RHBhclFkZkE1aUV1WVM2Kzdo?=
 =?utf-8?B?ODNndjJTaVlSN1FMWXlzT2QxMDRrZTRWUW5qVE5ERU4wczhJQ2oxQTc0OFJp?=
 =?utf-8?B?VktIanhiUmIva1FRcVdnSU4wOUNSU0VsaGNKV0FUc3VIbFJUaWw3cDlQNXNN?=
 =?utf-8?B?alV0ekNUZHNZN1hTU0NIRm91VWtxVGFsQllSN1AvYjBrYXJma0RMMUhsZVM3?=
 =?utf-8?B?WlhjRWhwMUlKRjRDcnRldWJUaXROQW9jeFlBS0dsdXhIL0RrSGF4QkVWVllm?=
 =?utf-8?B?ZEZEdkZ0ZmNGdnhmVUtRQzVRV2VXQVNYcUNUMkRvdVQ4M3cyaVdYRktrdEph?=
 =?utf-8?B?TUt3emtjbjB6RXNaV0hBWjlmT2QxVVlFLzE0cVFyMEFFb01GQ0xXNDdsUGlr?=
 =?utf-8?B?Zi9qNiswSUVRYzJicHlaSFJHckhzcGMra2FtdkZPak5LWTltUlRnam1MbFBm?=
 =?utf-8?B?NHJvZFpEVXRVdUZDalc2ZEVhQ2tURmd2Mk9YOFBzSVhLY3Q0U2s2dlZ6TzFz?=
 =?utf-8?B?SVh2T0Z4Zmh0TU9xeDRwVEdFMlB0V0RnL2lpTnVWL0t1UUVnUDJEc3B1Vk9R?=
 =?utf-8?B?TTEwUzNsZU9rSUk2czdxdFhyaDdUcGF2bWdaQjd1Zy9kZzJhVE9MbStCRXVS?=
 =?utf-8?B?TzFCcHdPT0JEdU5UWTJxKzVRbnV2bVQ4S0hqc1BDeGxZM2trRHBPcHFyZ0hT?=
 =?utf-8?B?T3lZcDBKanpQRHZlWnA5THhpRG5wc3pZN3h3U2FEODExQk5nUTQzaVdtWFEv?=
 =?utf-8?B?STRxUkNlYkNETklEUk9qLzE2U3RwVnVNZXZQaU1MWnpYbzk5OGxzamFydDFH?=
 =?utf-8?B?djJGajR4UnRxWlFBK1F3MlRBUkVKV20ybTJxeUVCMTV4azFKWUFJZk5EVmlC?=
 =?utf-8?B?OEZhbUF1a2RnUFpORHdWYU5yVXpJVTJaRFpsWkdNWkhRSzVCbVl0OW9PL255?=
 =?utf-8?B?c2lPck1sU2dGUENqT0o4L2FUN082OG1mdlpzclpuSHZ4KzNQaGNTbm42MXVv?=
 =?utf-8?B?elZ4Q2FnMVBXVzR5YzdOQjQyb2cyeXV2MzBwVDV4ZmFNYmdkSVRHSGN4UjMz?=
 =?utf-8?B?dGY2TGd5bnNVTXR6QzEzMFloN0NwcnZUQUZZQWNEZEtrSk5BdGJsbW9xQzVS?=
 =?utf-8?B?cFpFVTF4bHFJK3R3S0dqWlBRdEVvQ21RRE40RWEyNnl3STQ4QTdlaUtCdG9Y?=
 =?utf-8?B?T3JVVHZzSHhxNW1FeE5PZmxMMXhjcERiL25qeVBleVZXZnVBYVlNOW1XbXVX?=
 =?utf-8?B?YVV5VHl6VkFSaUZtQ1NsalZPRDI5YW8rYUI1VWhXaFFBUDZPZW5mVHp6aEls?=
 =?utf-8?B?amRrZUsya3NMYi9hUDd4QTB3WnJIUTFveTI4bXdKRWl1Vmd0M1VwdTA1WW1p?=
 =?utf-8?B?SHNyUDZ4WFNEdEZsS1FzSUduOUM2YUh5TlU3NzBQdlNiWENyN2FrVEFBVzRh?=
 =?utf-8?B?UjMxMGdvdGFlVkJaUTZRN1U2YmsreFNJd0tvTmVOVlUvUit4Mmo2S1dlT1RY?=
 =?utf-8?B?MmwzQ0wvOGlHVWNpZWRNTUIzVEdWTEhRYmZQc25VNlJuNUtpNmg3N1VjSjNi?=
 =?utf-8?B?VDF3bFBGQ2xGR3VyaXRPd3ZZZi9Za01kd1E4ZUJJS0YvQW8rMmQrR1R1Nk5W?=
 =?utf-8?B?Nmw2S3hwMkpzZXVOaUdsYjB6bU5aTU51WTdtL0h3anNWR3dVOEIzS0dGZjZa?=
 =?utf-8?Q?RHgo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWRvN1NYRmJKR2dhKzJ6S0I5TlIxNWV2em5lTEZ2cjFwTTEvT3VPcTFrSGlO?=
 =?utf-8?B?Y1RYN3VBYW9VYTEvMCtCV2FrQjhES3FaNmtDenl0eHpXWVNGa2NhYmx3K2tF?=
 =?utf-8?B?dVhEdkVNSloveXVEWGxPV1JZaFdCSDZRWE13eTRaZlVvSHdOQlFqU2NzRlI5?=
 =?utf-8?B?eTRYYVB3eW1UZGJLNnQvbk5VNmFnYmxVanY0VFRYQjlHQm82eHdYYUhLQkVY?=
 =?utf-8?B?dk5KZU81enBlNVIxc3pvVElSVnZjWVAyOSs1TVpQNG1mZGdDZ2RJUXFSRDRY?=
 =?utf-8?B?dHkrUkhFZVUvTXFuRkhQUnZVNGtJajVneHdiWWw3TCswamVvTm1CMElEY2ZI?=
 =?utf-8?B?YVRqUktXS2dMNlBnR2tXSyttcEVpeFJseHYxK3UvSm5abFByMnNhZ3hTNzdK?=
 =?utf-8?B?ZWdMVit5M3ZFOHcxdStQdkViZ0ppQ0t5bzIzTWlUY2U3OUpwV1pmWk1uL1k4?=
 =?utf-8?B?Wm9tTUpOcCtrZGRXMTNWa2JnS2REdEdsSzBwNlkxVTJnYnFIWEF5WjVzQngv?=
 =?utf-8?B?TUNtU1gzVXFzaElBSDdpMzh2V1EzOC9IVEFJcXBZSXNobVBvNi91RUEwOTIy?=
 =?utf-8?B?clRjQnp6Zm1nL29HdXdGZ2QzV3R6Y3hQMS8vWnZZVDBXNk9WL1JGNHQxWEww?=
 =?utf-8?B?VDBsaW9mckhBUWV2MXRnM29hb3V3c0hsUE1QcGNvUm81c2c5bjdLcUx4cmh0?=
 =?utf-8?B?d2VBMytPMVltZU9saWlEREQ1bUFQdlZFTDFlUXJpQS96dGtNc1kvMFVvRlRD?=
 =?utf-8?B?MS9sc2xuMHBNcm90V0t6ZnB2cGhyVWgzQ0dxa3FsalArNlNrWnVMcVB2N2xC?=
 =?utf-8?B?RWVEak13c2xyUFV5TnhqSVNoOUk3eDNWMGtSQ3NRUk9QUWlCeHRRak9VaEZy?=
 =?utf-8?B?bTZzV0hZVHhKTm93cy91cXRmMDdWYXN2T3dHaFFJZTUyZTN3QkFIQ29BSFZu?=
 =?utf-8?B?OGRVZy91RDZod3FlVVpLM0ZYV2tjaWZ4bjZFdWpiVmZ2QldzMzlJWnpEMUc1?=
 =?utf-8?B?WnYxYloySENsbW9qSjZoVnJxVVhCQU9GMzhMZnJkRmF2NXFiUnFnWU5jejhr?=
 =?utf-8?B?WnU1K1VMVkszWlJvTW80MVdWM0xwRDNQaXJDcTBZTlpacHBiNThRODZiUFZY?=
 =?utf-8?B?Vk14M2ZoMk5RSFdITXJjRlBNd2V4UjBEKzFrU1p0RC9PU3ZqVXk3SDBsRmp3?=
 =?utf-8?B?UWZGc1RaTnV0TGhhSHl2dlRhbWNWcGdXYktPc09Ob2Q3cDJjZ3c2NlZMYzVj?=
 =?utf-8?B?VHNuUnUreC8ydjUzTktuRTZoNElKbXZiVzVzY0hFQkNITk5qbk53TU9LaS9m?=
 =?utf-8?B?cDFyTGxNd1JtbzMvalVVaVB5am9lOUhDekxLSjRJekowN0pyT3JzeFoxSnNX?=
 =?utf-8?B?b1N1ZWdqZUxCRGVvbitNZ0lTbVJCQTV3YmF4TG85NG9BTHgvUy9TQWJYSEEz?=
 =?utf-8?B?ZVZJbnFpKzl2cmJ0Y000ZUFEWnhsVldZRitRb01JeDFHWW1rLzFpZUt3NG40?=
 =?utf-8?B?cHZnV2JBRG9xeVBuU1JBNTFIWllKREpOTXRJcS9hRk1XQ2pUWGpQb0xrWDRh?=
 =?utf-8?B?dy9DUHkrWkdicXpYUnlqa1ZkWGN5bFFyc3FWMFhJdm1KbGpLbTFHcnNYN2gr?=
 =?utf-8?B?cXdjRmxGL2w0QXpCYTJTUTFQeDNKajdBOVVBazVmb2tHRGJUM2tZMDRqUTB2?=
 =?utf-8?B?aHJlVU12bkVxQ3RxaUFGQnIzeW4rVmxwczg2SmFzMGVyTTR4UldVUUFqQlpo?=
 =?utf-8?B?WENKdkNORmFDa3g1eDNnUmZacFl6Tk4vZFArd3pHSGx4M0h4L3NQbHBQMWRM?=
 =?utf-8?B?STFpK3Y5WERkb01uOUVMeWszZlFuRTV2ZXY2WTFGaE1pa3dNcmJ0VnBQdUFF?=
 =?utf-8?B?a216U3Q5YzlHaWdBZ1ZQN216SnZqaS82aTNUYmd6elRXU0wycnM1QU1IWUFQ?=
 =?utf-8?B?cEUwckdvRktEcGxaMENRcmhodGthYnBZNWJtRUpRUyswak9zNjNNamtYS2Zo?=
 =?utf-8?B?dDViOC9zVzlDS1Z2VXI3Rmdoc3prNk1yejZkaUtmWkkxbFppQ2xnTGg4ZXc2?=
 =?utf-8?B?RkljS3F6eTVmTWlTTlBRQ2kxT3lTTDhQV3pkRWlTUkNwSUdCc2prWlpQUS90?=
 =?utf-8?B?ei9KUnpPdE40MTYrOE9QRnlxaFpWSERRUE16K2QxbXRlamxtbm8vNGRPY3gr?=
 =?utf-8?B?dVFxa3lVZmlBSTJ4Sjg1a255b3lUdnZrR0Qwb3NQNFRNSlk4eXdjUWVDSVI2?=
 =?utf-8?B?akxId0NvNVduVkhsWFdNaXF3ZU1uV2dJTXF1S1hDVldOcy9IbURyaldwWktt?=
 =?utf-8?B?d1RLWXFMcDBEclcvQkZaMDhkbWRyVXJ4ZVpyMnpNZ0lSazRTelhKQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6704ae-ce37-4d0a-8058-08de5427e6e2
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 11:19:08.9028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MVo+18YS+lan9GGjgJjY6G20Fcs2jaZtyae8rRoSjripVXCa9fxNqzs2zM39qf1tI874WzmcJ7nkkQEvt8vVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7431

Hello,

In XenServer we have seen the watchdog occasionally triggering during
domain creation if 1GB pages are scrubbed in-place during physmap
population.  The following series attempt to mitigate this by adding
preemption to page scrubbing in populate_physmap().  Also a new limit
and command line option to signal the maximum allocation order when
doing in-place scrubbing.  This is set by default to
CONFIG_DOMU_MAX_ORDER.

Thanks, Roger.

Roger Pau Monne (3):
  xen/mm: enforce SCRUB_DEBUG checks for MEMF_no_scrub allocations
  xen/mm: allow deferred scrub of physmap populate allocated pages
  xen/mm: limit non-scrubbed allocations to a specific order

 docs/misc/xen-command-line.pandoc |   9 +++
 xen/common/domain.c               |  17 +++++
 xen/common/memory.c               | 105 +++++++++++++++++++++++++++++-
 xen/common/page_alloc.c           |  30 +++++++--
 xen/include/xen/mm.h              |   1 +
 xen/include/xen/sched.h           |   5 ++
 6 files changed, 161 insertions(+), 6 deletions(-)

-- 
2.51.0


