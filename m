Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PtHEHLwimmwOwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 09:46:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA2B1185B6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 09:46:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226131.1532672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpjO0-0002AN-Vt; Tue, 10 Feb 2026 08:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226131.1532672; Tue, 10 Feb 2026 08:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpjO0-00027s-Sv; Tue, 10 Feb 2026 08:46:20 +0000
Received: by outflank-mailman (input) for mailman id 1226131;
 Tue, 10 Feb 2026 08:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjf6=AO=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpjNz-00027m-9y
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 08:46:19 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6b893f0-065c-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 09:46:18 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BL1PR03MB5989.namprd03.prod.outlook.com (2603:10b6:208:310::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Tue, 10 Feb
 2026 08:46:15 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 08:46:15 +0000
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
X-Inumbo-ID: f6b893f0-065c-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQBQe+0QnoqUhom5MGzsfYsxmR3WOVLpbtmGwJqFaybIevgZgHnG1WiD0GrjLpy3yg7VQstYqV6M1H3E+nLIrTJWL/iqhz+FGgqs6Ex7LIJigOAZRaL5NU2pBp2kC3+VCLUTzUCIvwZAXi8p7+gJDTDOPNPDQRKz8Z+TVgqzLs2O66hncP/GEoXAIkV4MCLfIVvgLGwG2JKBqdHsdnRKli7F3chpUZysDIyG7dH5X72zG0utc5jGQT0NTYnqaYcbMyxJcJ8F/R7BmZha0jd6vjTRo88lJeUatOwn8zZDL+BYz4Qi8R3kq30TyAJRFWup/1NGjWQqHWa+e+2ez5BmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtrJmb+yUkl7dnB60ogjypBykGtGLQRUomR2oT0oPYg=;
 b=NaLl1ElAireOw9Cdj4Uw/SmKkppdXI4u5vCn/AAPR81XtS06knMuG6IyDASvdM143HyPzYkSrZF5c2EPHVmBkth7VyLw4gZtUqCSxPaY1OQbqDjmric0Jg28QNn3cYCFkjlDERuAfpKrgsOBzXrZ3428K2iLKlgwB6EfmekUah/8VQxQC5iBo9VzBah44Pdu3BaDpFfg1567dyEBym61xG4UckmkFmk6Rb6ACCPC0NH/ZzHOabcq3/FuT9LipgYTKIUIQe8jtRQChxVvLLse9d9/AmoS7dk6YyWmyyBrXHJxHgbcbbFIv9xZTy/jF/5wE3nAS4O63t7Z6EXtjrolYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtrJmb+yUkl7dnB60ogjypBykGtGLQRUomR2oT0oPYg=;
 b=Hw4dK4fUV34Bfmew9HvhMlfIwPue+0FthaxgbQh6cex9nkc2dUldkuOWxRHzzvsAtB+pSFqYvHlcfoekogdKpomF0QgWu49qVKQji8lvPrHfBMGjpmJ/8jFKRdvwoRVFuxUldEk0TyPbOeoIkDdTiRMSx52Oe0oWfPNCahDiURI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 Feb 2026 09:46:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 03/12] x86: Add cpu_vendor() as a wrapper for the host's
 CPU vendor
Message-ID: <aYrwUj1uaEgGL9hl@Mac.lan>
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-4-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206161539.209922-4-alejandro.garciavallejo@amd.com>
X-ClientProxiedBy: MA3P292CA0022.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BL1PR03MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: c64ed4c4-1dc4-4978-2232-08de6880d987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SU5IUWZPRDJxMnVtcVkzZjJCdDJpUmNFWk4zSkhtNmRCaElLYk5BbDh1Z0ZO?=
 =?utf-8?B?c0JpQzZwRXZ2Wmt1M0ZwVCt4eUVteG1OZUJ4eUg1TnZISFdzRnJ6bllIVmUr?=
 =?utf-8?B?ZkkyQWxMQkpqV2pYNEF6VHhKSDFHR3kwTGs0SlFLYUJBNjZUalJaMjZLOTZT?=
 =?utf-8?B?YUI3a2ljTzJtVDlFNnhQMnM0UTZCdk1jRXZPcFRrb1FVNmJBNHBLamRqVTNz?=
 =?utf-8?B?OWZWN3VFbU5QZm5aLytRbmkrZ3pZUEVtSk9nUVRhSmZyZk5TVTlXUmVMZFFv?=
 =?utf-8?B?OFJ5dGJ1MERuZlQvZVorL21UT2lyZlJEc2xKVFV0MGE2a2t3bE1WTHFJRzdF?=
 =?utf-8?B?eTZQWmpCclQ5UVZhY2pGejFBQXB2bXRUK1BrcmhvQUd1TkcrQkVmdGRlbWRp?=
 =?utf-8?B?c09VMEd3LysvcEZjZGNPdXd5MjJpamFRZTVDT1dPQU9PNmpRd1VHVTBLbnRR?=
 =?utf-8?B?b0JIYmpuWEU5WVpSajlXK0crejdLN2xIM3VRM2FIVVg4Mkdoamp3cUxOcTls?=
 =?utf-8?B?VTFMaHJURUVrSWp6R2VxZDlqOVVRWkJETGFDSExndzRyVlNwTDQvNEtnaWEx?=
 =?utf-8?B?Tk1hSE5tWk9qUDlMNytIeWhQUmpxaURDdXQ4Ym1Hc0xoalhoSUNHNHJ4RXcy?=
 =?utf-8?B?N2t1RXBwVzloczU0Mi9VUE81S08veVgzamcvMkFseHNUTW14QVRWMDU0R01T?=
 =?utf-8?B?ZnU2dFZ4MFNZQWh0b3FVU25jZytMYWFLNURmckF1by9vMUJnWk9udFRYZkhr?=
 =?utf-8?B?QnFrOEk3RmxrSGhUd01Ia1h2U1VPdEtZMmNvcjdla080UDR1L0FPczl4N2Ri?=
 =?utf-8?B?Z3RPblg0eGk3NFgzbTRaRUtiWTBlVDdnTXNKbTM0NFFEd0RRa0NzTWtGSTZi?=
 =?utf-8?B?SFJiUlVqNmxVaEdKTkM4c3g2SDVJd21MM3lkYVpzSGxubk9Cbm80RGVuNjFO?=
 =?utf-8?B?YmNJYS93dzUxdk41eVNyeW82Tk12SVg5SzJCckFhTitCUHVkUXY3UXI3cUZv?=
 =?utf-8?B?UG5GSE1aUDFmVFJSbGJ6dWlUQ3A5ZVd2SjFuc1JoU3RBUlhNUWsyVVF2VCt4?=
 =?utf-8?B?Y2QrQms1Um1Mb0EvbCtFak5wSnFESUUxZkQ0dnNQV1o3eVBsZlFNMTRDRzJu?=
 =?utf-8?B?cWdUR3RhWTNQSVFhYTQzcXd0Y1F3TW1NY1ZYNGF0SThKKzR4VUhEOHVVakE2?=
 =?utf-8?B?UmtoNjcwSWdoWVMzTmpOakgyazdvUUdlUmFLRWdzb2t4cEdrb2RocWpnVVVy?=
 =?utf-8?B?aDh5UXFMaTZpYWlneUlXZFkwMkFLR2h0TllGVEk4a05Odyt2Wng0M0Fma0JN?=
 =?utf-8?B?WHZ1TDJCNW9wV1FzVjFnamtFSW1TY2JGKysxb2N5L1hwU2lsVGRPazhreDNh?=
 =?utf-8?B?Q3ZOUDRTUWJaR0RJTWdBSkFFSDZwbUk4TCt0TEVKbnB4ZG9iV3VZWGZqd2FW?=
 =?utf-8?B?S3pyY3pKOWc3MjZrRmJpMmtaL2JydHA4QVREYk1oTVJPYkpHdXNuMWdLRmJW?=
 =?utf-8?B?ZGxHVE5RNEYzajZaM3dKYzhGTDFTYURxMjBIN2pmQ2I1MWNSR0lwbUEzeGli?=
 =?utf-8?B?aFZRZHJyV2RaT3IwVXhwZEdKWm5kck0yblF4ZHIrR3l0UXVpaWxWVTNZNjJj?=
 =?utf-8?B?azdIMXQ1UU9KYkhFWWRJSjZKQUFvN0dKV0xYck1YV3VIU0tIVkRvMzVHS1pk?=
 =?utf-8?B?UFR1YzZ0UDlYWTF0cFV3ZVMrdnNlK09meHlTRlljZzJiM3d3TEI2dXpFZ0Jl?=
 =?utf-8?B?L0lQS0VQVy9aTGF0N2dCOGk5MFBhNUN0TE1xTjVzYllodjNScGRjQzBpZlRZ?=
 =?utf-8?B?cjBvdDd6NGRxODFGWjYwM0s2eHNGZVlNenFHQUZDUHN5VlhwQVRYeFRzMFlx?=
 =?utf-8?B?Q2krbkYxWml1blkrQUdBVHhBSi9Va3RpaWtIeWNvREZSRThUQnhSUWdKckNj?=
 =?utf-8?B?aWNVTUhMbkRnQmtNdXVIZ20wODIya2U1UjhjNlllVkdtZ1lRN0thYkpwY2c5?=
 =?utf-8?B?UExHWHBVOWxmSTQvWGdwNmxCVFNpT1ZlODBURVdpWEtmaXVhZlk0STQyR3Zu?=
 =?utf-8?B?TDJCbVBLVW1KU2xlNHFvdTZoMWlGVnZCaHVZMm5QSkwra0g0bUZIZ2d4Qk5j?=
 =?utf-8?Q?KZVk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0dHUFhUVlNMakU4OHhBUjFCNnhLY2dXTDYrbnFXL2p1Q3REbFVTTWFpYmVC?=
 =?utf-8?B?NmYrdDhTYnNHUVl4ci9YaFNyOXRxVk5UQ1NnL1pXV1E4R1ROT2JHMGxFeExT?=
 =?utf-8?B?MGxqZndlQWQ4QktPS1JKS04wMGE1QXBVRHpSNksyeWcxMWZXdHV3Z3VmbEpL?=
 =?utf-8?B?c1hvZGEwN1ZyZFN4dWUvdjBwZWVyeXE2WEpjRVhKVy9QanF1MWpuWHJOSUhl?=
 =?utf-8?B?UXRJYjN3eU05YTFOWE9RU28xeGNoYXJmbFBISG9SMCtvU0hQaEFwdTl3d3c3?=
 =?utf-8?B?SG1WNHYyRnl0SjFlNGk0UEJkMEQ1bjNKMjZrU2ExMlluMzhOeFIxcGRrMy93?=
 =?utf-8?B?RUExc2JDc2FXU1NHbmJrdGtYUEZHY3Q2Y2Z3bUlqaHFtTjRBeW9NUzlRNXhF?=
 =?utf-8?B?VHFNc1lEY29jb3B1QTJOM3FWU0Z0dUEzdTN0SXZmdkNRMDczQTlvdFppZ3lM?=
 =?utf-8?B?M2FaWXFWQzk4cHlDRXlZYTFLZEZQaURvejA1NVAxbW55YStiTDNhdTFISng1?=
 =?utf-8?B?RVM2MXZKbHFMSi92SVNrdW1Pb2FldkJ1RkhBcW1KdkZrZVhvdGJENXgvWHZT?=
 =?utf-8?B?bFJjWUF4WWtmWGI0WklrY09OTXU0STRlNE1WUnJDY01tekNRVk5YMUUvdWxi?=
 =?utf-8?B?cTE5WWNRQjFYSyt1OXk1RUNvakFnSWE4N3JNZkpiK3d5d01sdWNqeU04c2xZ?=
 =?utf-8?B?WHJCbHJ5aUFmVEU0WmFZVm11SGkwbWdBV2VkSmU1RmFlOGJpMjQvWUVRVXZY?=
 =?utf-8?B?WUFDSTFtbWx2REdqd3psVGx5Z0pKUmlraGtBT0dlOUN6NHFYMmNXdmc5Z0JS?=
 =?utf-8?B?eWxIbmpzWTUyeTJQeWhEaWJZWXlzVDJvTjlJaytUUEFIdTY0MFplN2RhRFFa?=
 =?utf-8?B?RUlYd2hsUmsrd0lYdzk4emJDSWN3SXcxcFphSmV2cUpJb3dyS3JWRDlQMEY2?=
 =?utf-8?B?OW80d3puTVJGTG5SdjhZU2dwMWxoN2dQeDlIb25BVjc2Q0VHYjRBUkw5OXpa?=
 =?utf-8?B?SHcyVktWZGJHMmVkUllMbGxuVHFxY3NMekFYenh5MDFKaWZjeVpzUlJIZXk4?=
 =?utf-8?B?QWsrelZScmxJTHNHTjBjQ2p6N3N6UTlJeTZpdjZuQjRqWmEwS1JlL3NzVGUr?=
 =?utf-8?B?cEFBb2RWY3hMN2NYSUVxdnk3UnF6N216cXZVL0NhLzdOWTJMR0tKMEVhbFdn?=
 =?utf-8?B?V0ZtL3lrL0tGb3ZzRnpzTVo2VHJZNVdBYUsvN2FLQkkvMFg4elhJdWl2Yjc3?=
 =?utf-8?B?T21QSmtjTDN6Q0NHUHRhZUdVaEd3dUZ3WHViSXkzdHZhZEx0MnpXQVdDaHUw?=
 =?utf-8?B?QW5jWUdRZjA0aXBmTlZ4bitQVW5CRTAwSkVnSDJMNVFnclJ6NzJnNk9rUTNW?=
 =?utf-8?B?NWltczhWb3RRbktaR25TV0VXWkpYSFA0MHNpVXg3ZWgvbXRJUDROWW1JMjBm?=
 =?utf-8?B?Y1FRMnJJY3E2Q3ZJZk1LcUg0UWIzcHBCMTBkZE14ZTdnTEdwcEl5Z1BGdndr?=
 =?utf-8?B?UVlhOHdqZHZiRmYrT25DQmxEOGppUlJIQnNzVGs2WGZUWWFRL1YrNngzd2Zt?=
 =?utf-8?B?dXJGaXkrY0JpNUhiVzk1YStSNlhLZUJqZ0N1NGpzRGdoRGFYNXlBeVg2SDEv?=
 =?utf-8?B?QllCSDJjRnBUaitKZFdhdUpWWEh0RHVqUVpVNms3cUZOdjVTbUxDTXNqUDBt?=
 =?utf-8?B?aHRvNkxaVTJHVW5jY3g2aGkrRkQzT1dLeGtuVFgxY0ZpVzAzMStUVWt0L01r?=
 =?utf-8?B?bzNZbFRvRjM1S2NOL3E3RURhR2FZdC9QUlpUcm1yUjVvNk8wMUVtMEd0d2RP?=
 =?utf-8?B?cnNhbXVyWEpGZU9sV0c2V1Z1VHMvVVJXM1laVVBuUUlPVUFzdkRVZkNqUWZz?=
 =?utf-8?B?MlViY3ZKem54SXZhcXBCSFE0ZFZ5ZU96eUo4N29VU0FFemtsMVhFb1VKZnI4?=
 =?utf-8?B?QkozQjVNdmJKaWRlN1dCbG8rRmxqaDEvWldBNjZIWjVqR2dscmt2ZDlHZVM0?=
 =?utf-8?B?MmJTQmtaQTY3eEJSSnczUk1BdlRtNy9ZRnhacFh4cGIxMTlLQ1lnL3VFMndO?=
 =?utf-8?B?R2pxM1J2UW10MVRhMjl5SWxuVVBwR3l3YnA1YkF2eU1ZcjRxQnovb1RnL3dF?=
 =?utf-8?B?cGkzTHNtNit3RzV2NlNLa0lmd0ZTamtxR2k0dTltRXIwMWRFa0ppMXJWVE9v?=
 =?utf-8?B?dThWeTlOLzRlUHpCZW5RczZsM243WlRHbTZXZ1NpVHVVYlk3Q05TZXVqNjA4?=
 =?utf-8?B?WkVvdEQ1cnNZVmJGd2J1S3k4S2g2Nmw5aGN5K0w1eHE2R0dHcnZEdHltWmdu?=
 =?utf-8?B?V2J2U2kyMXMyZHB6eUhORjBmeVE3Snl6MzNHd2dYY1J2YzRJTmtpdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c64ed4c4-1dc4-4978-2232-08de6880d987
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 08:46:14.9779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++m9tpYX92SZCe7JSlWutBbJAn5qcnq2fng0Vtvwji4yhaeKWwPT5Plq6xqYZYGqU3zNAkQUcYlT7kdXTOde7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5989
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,citrix.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8BA2B1185B6
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 05:15:25PM +0100, Alejandro Vallejo wrote:
> Introduces various optimisations that rely on constant folding, Value
> Range Propagation (VRP), and Dead Code Elimination (DCE) to aggressively
> eliminate code surrounding the uses of the function.
> 
>   * For single-vendor+no-unknown-vendor builds returns a compile-time
>     constant.

This is kind of misleading IMO. It will possibly allow such
optimization for Intel or AMD, but not for Hygon/Centaur/Shanghai, as
for those CPUs you will always end up selecting either Intel or AMD as
a requisite (so X86_ENABLED_VENDORS will never have only a single bit
set).

Not saying it's bad, but I think the comment above should be adjusted
a bit to notice that such compile time optimizations for single vendor
builds will only be applicable to Intel or AMD builds.

>   * For all other cases it ANDs the result with the mask of compiled
>     vendors, with the effect of performing DCE in switch cases, removing
>     dead conditionals, etc.
> 
> It's difficult to reason about codegen in general in a project this big,
> but in this case the ANDed constant combines with the values typically
> checked against, folding into a comparison against zero. Thus, it's better
> for codegen to AND its result with the desired compared-against vendor,
> rather than using (in)equality operators. That way the comparison is
> always against zero.
> 
>   "cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)"
> 
> turns into (cpu_vendor() & X86_VENDOR_AMD) in AMD-only builds (AND +
> cmp with zero). Whereas this...
> 
>   "cpu_vendor() == X86_VENDOR_AMD"
> 
> forces cpu_vendor() to be ANDed and then compared to a non-zero value.
> 
> Later patches take the opportunity and make this refactor as cpu_vendor()
> is introduced throughout the tree.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>  xen/arch/x86/cpu/common.c             |  6 +++++-
>  xen/arch/x86/guest/xen/xen.c          |  4 ++++
>  xen/arch/x86/include/asm/cpufeature.h | 27 +++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index ebe2baf8b9..6f4e723172 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -328,7 +328,11 @@ void __init early_cpu_init(bool verbose)
>  	*(u32 *)&c->x86_vendor_id[4] = edx;
>  
>  	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
> -	switch (c->x86_vendor) {
> +	if ( c->x86_vendor != cpu_vendor() )
> +		panic("CPU vendor not compiled-in: %s",
> +		      x86_cpuid_vendor_to_str(c->x86_vendor));

I think you want to print both the current compiled in support plus
the host vendor as part of the panic message.

> +
> +	switch (cpu_vendor()) {
>  	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
>  				  actual_cpu = intel_cpu_dev;    break;
>  	case X86_VENDOR_AMD:      actual_cpu = amd_cpu_dev;      break;
> diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
> index 77a3a8742a..ec558bcbdb 100644
> --- a/xen/arch/x86/guest/xen/xen.c
> +++ b/xen/arch/x86/guest/xen/xen.c
> @@ -57,6 +57,10 @@ void asmlinkage __init early_hypercall_setup(void)
>          cpuid(0, &eax, &ebx, &ecx, &edx);
>  
>          boot_cpu_data.x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
> +
> +        if ( cpu_vendor() != boot_cpu_data.x86_vendor )
> +            panic("CPU vendor not compiled-in: %s",
> +                  x86_cpuid_vendor_to_str(boot_cpu_data.x86_vendor));

Is this going to be useful?  I fear the panic here might happen even
before the console is setup, so a user won't get any output from Xen
at all.

Would it be fine to allow such mismatch in the hypercall setup, just
for the sake of getting the console page setup so that
early_cpu_init() can print a proper error message?

Allowing the vendor mismatch here won't require any extra code, it's
just the selection of the instruction to use to call into Xen when
running in guest/shim mode.

Thanks, Roger.

