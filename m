Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC87BF2620
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 18:23:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146795.1479160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsf6-0004Ts-E9; Mon, 20 Oct 2025 16:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146795.1479160; Mon, 20 Oct 2025 16:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsf6-0004Ro-BO; Mon, 20 Oct 2025 16:23:08 +0000
Received: by outflank-mailman (input) for mailman id 1146795;
 Mon, 20 Oct 2025 16:23:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abR8=45=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vAsf5-0004Ri-EZ
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 16:23:07 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bdf0499-add1-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 18:23:02 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DS0PR03MB7751.namprd03.prod.outlook.com (2603:10b6:8:200::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 16:22:58 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 16:22:58 +0000
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
X-Inumbo-ID: 0bdf0499-add1-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6c6wJ5dvo8zZhWdHadsGAzmDOgW7J536ty8prd2x+ekBR8Yh9LNsHgRbv8CAX+f55Az1ARdb8zq+cynnqMVQiTVe7QBfMeJMF7KD1A0rR7lbyeMCOxpZSgOW+bnP50coUvF7cjmLNzVdqpjbtzu2STsW5kchvi67cj+0uf3tlg6pQlkvRI0ly07ynfJIwoPrFRazpKexqQRWnbV/gx7/XsUdynNNAGcbU+kflN5N2zK3Iw7x/avNcAQkPe46kvRBIG6iwV9qkK0CYzzN6kHYQqRvDyzgLf4OadvfwvIj2OrH9otlCaPXcPEWUi8bXfCjlhXHGysyTaL5cub3cg69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGQqv0Z3o1On+lcdHUw9WFunRhrZNO3XruIGeFNi6Y0=;
 b=fZEwkjb8/nNVTFyxfzuQP59xr3lhYA8EHdT0p7l94k3yzighV4g/PQqle6pJsQo5HLCN8R5vm7jYH//W1oJNQ5IzK+2Ft3tpu/ZkuX/Yaqr2YnDt7siQbFWLZqH3QdUyos8s9TBy+KgJZIHLiIikFtrD6RclM/IWg/efX7MDthJuaLtw6NpMMrx2w+FYMw4zPDg6YvnM3i3li8k8PogH+TYvh/Rc671KPTx0+YteFJLKMi7UoUWdZMn8OikVxnr+KwIM2z7Dw6WbHnthmQD9q7i8AD9maIowikwuq8EZ6TLFJ8dr5S8NnoLQ/NdFt4IsXDtscYnSA8hRcVUTPA1pXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGQqv0Z3o1On+lcdHUw9WFunRhrZNO3XruIGeFNi6Y0=;
 b=gKHVETTip6oRz2OFU4QDcckB8ZbvQo1FXGOA8sLNdy7y5/ruONWGo0BQlexng2VndGIY2TMmPqPXr66SFl+QyEnZsv9z4xxm6JW1tFtPXDsIJUPzTtnplUw1/K1bFJtJpdd3hgowAilKQo2P7ZJyOVgoJUYJnKMW+XKc8+/mvdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 20 Oct 2025 17:22:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.21 2/9] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
Message-ID: <aPZh3Y8W4QcV_oLs@Mac.lan>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
 <c8c124c4-71c5-41e7-8d84-fd45ffd6af14@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c8c124c4-71c5-41e7-8d84-fd45ffd6af14@suse.com>
X-ClientProxiedBy: PAZP264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:21::14) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DS0PR03MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: c8731763-6bb3-4d32-d500-08de0ff4ee22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bis2a1poSHFPQnlKZHF6bktlUXZNWEtPR1pIS2lwUk9HUVQwNDN0aURlcE1v?=
 =?utf-8?B?Z2hJWWoxTTZ0SHlEemROTWJpb0dGeXloOVMxb1VuSWpUNDc1OCtQTW1xbEFk?=
 =?utf-8?B?Yk96WEN0MDJzQU52dzVkRUtETnBXQU1WR1dJcVFPOW85a3h4ZTkxUitPa0lU?=
 =?utf-8?B?bjJnaHdMcTRyMC9Bb0RsZjd1ejdFcEgxSDIxUEJtcG1JR0RoTTd5UVVIZUFN?=
 =?utf-8?B?TFQ4aGJLR2xWeXQzWC9nd3J2UUF4UlB1NUVhUzJ0SHBmZ1U5eUFLSDNCVnEw?=
 =?utf-8?B?TXhZUHp3YXY2VU8vL3JlYk05NmRzV3h1bitvWkh3NjRoNkZyc3NMM3VUeldI?=
 =?utf-8?B?Nm1BVW9oV2JoQ25hL1g5Ui82b2RTdmhZWEpWSEl5ZDZxMWpYVzBrZXJFQm9w?=
 =?utf-8?B?ZWtvdlk3STNBM3A3MnBBYmdTbUdwT2VONUZQQ2xjN291QUZJcC8rdlU3UU9i?=
 =?utf-8?B?c1JFM05ONjMvR3hmamtka0JKSU5zNG1nN1FjOUNDbjBNWkZCUm0zVjBjUE9X?=
 =?utf-8?B?Wng2ZlV1aXBQb2NLZUc3TlFON0lIaERoMDc4STVSb1c5YzJVUWZ6bzFUMW9w?=
 =?utf-8?B?a25idWd4bitsWHMwUXJwTUNOc0FJVkZYWFcyMnhJeUU3Yk9nUURZbEkwTEUz?=
 =?utf-8?B?MTVyNDhYcFFacXVHUkd4L0ZhRHVpYWFxUVRCTXVFcWFlWVora21NSWhrQi9y?=
 =?utf-8?B?QjFaZ29XbjFMd1QvUG1qcGgxS1ByaHkrdDF5UFVEV2FSMlNjWkpqS2VuYmha?=
 =?utf-8?B?UmozSVZFQVRSa0RzS05UbXliMXNnbmZnQkhraFZId1JaSE1SdFl2anBWaTVV?=
 =?utf-8?B?YTBTQUpyRktpbmZUY2sxR2hFUm9ESFNaazRnTC9PYS93aDI2UjMzM2YyOFlK?=
 =?utf-8?B?TVZ1aU9LT090SkoycmdaNFppL2R2UWs2Q0tDWVB3bDVYM0pxNmJsK3c3LzMy?=
 =?utf-8?B?RnZHTXNhUm5ybkY3b3ZvdFdEcWdZTk1OQlVIUHpvZHFyQW0yRUhjQm1YZjcv?=
 =?utf-8?B?UG56dndzQ3pVUVlzMGJPd0hNTXEyTnFRU2l5Q1ZUMlFZZWE4ZEVhZ2hFakti?=
 =?utf-8?B?RVQzbHVEMDQ4V1UvTUw1QW1RWHMyOW5BemdLVUtOY3BIQVBIOTY2bGJRdnV2?=
 =?utf-8?B?NWEzdENKY2JjZTBZMDRJOVZjb0Z4ZEVkaksvODJ5YVZjK3VqY3RhakVnYjhQ?=
 =?utf-8?B?TUlLSDNmcHpCdWEzUlBoQTBHdHBha0k4N3VOZ2VwWGNYY3ZDMGpXSEVkdFgx?=
 =?utf-8?B?U0ZFVU9uajRDUGgvOCsyUmVYU1F6MlJkRkF2azh5OEV4aW53MjdiTEVQaE5Q?=
 =?utf-8?B?RlNrV3pnWHAyR0RtTlFURDhiM0JqTXA1NmZpVHlLYkhSYU0vNkNadWJNczlL?=
 =?utf-8?B?KzBuUkpPbnZUTVFLMmowVkk0dDZXUDkxeFpZajJxUWt2dlZXRUlpRktKZ2Ur?=
 =?utf-8?B?c2plVjBmbEdPdHRIcmRGVjI4MHhlamQ1RVg4bW8yOEg0dWtLbWZZeEd4bHph?=
 =?utf-8?B?R3EzU0NuV2xKaVdwdG1BV3JSem5UaE9ibEdha1BCcUVFclRmcHNGeWg1UXRG?=
 =?utf-8?B?TkxURkczbC9WYklsL0d3MEhIYUdhenFkNTV3d3ZVS0xoZW1QY3gxOGxiaG14?=
 =?utf-8?B?ZDlsODdkemNnMDk2d1FVQXBEZ0VadzdJTGMwMXlQUCtXcklndHNEcGNpQTZn?=
 =?utf-8?B?STJvQ3ArUDhqc2xNU092cWk3L29hZDBQZHZ4cm9mS3owZFhOblJYQjdxN1ph?=
 =?utf-8?B?c0Q4c2ZkbU9LN2licEhDR0YrYlJUaG5UZ0Nmd3huNTN2OXBWVmxLWDk5Sk9s?=
 =?utf-8?B?OHJiT3ErbUpKRzh4UzF0WXhXQkhwcjZYcWFZUThwTkVkek8rTGZkQ3ZiYXZ6?=
 =?utf-8?B?Vko1NG5BcGRmdjFiV0VSeFhDVHdkOXlHUUVtOHJaQzdjeEU1WkdoUXIvaWNw?=
 =?utf-8?B?SmRDVFRvSU1ydytTOVR0WXpMM3RmelpUQ09VTkl2N0RwcTVzNjdZdEZLUnlQ?=
 =?utf-8?B?eHQ3TEJoNHdRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmxiM1lndHR5TGVFWjkvRE5EeE13NlVQK0xDL3ZqTXZNcEtlN0ZLQldxcVNC?=
 =?utf-8?B?a0hldWJUVk1BL3N6eU5uUU1HL1JuZUFDY3AxWFoyOU4yZ3I2cUxnKy9OblhJ?=
 =?utf-8?B?VERGenpTcXhKS1AzOWZaY292aER4a3RTdVViSnJ0WG1JWGdMc0pDcVhHbWsz?=
 =?utf-8?B?Y2N0Z0pQS3U0MzNxdGpzTThXVXpWRmEyWnBIZHdRME5jYkFIb3d0Wk5yckJU?=
 =?utf-8?B?aHdYVU9ja3E1U0c3UmVtVEdDVU5WUllRZmt1R2h0TTZNUnoyWW9xQzkzNC90?=
 =?utf-8?B?MU82VkNTT3VDeVZ0bXU0ZDc4OSthTEVOR3hUU1NtOWcvS0hUQk9qV2QxVURC?=
 =?utf-8?B?L3Y4UWVzcmRtU2p1SldoT2RFQ09QY25DMzNpTERLUStkeElVWEZ0eVlFRUFB?=
 =?utf-8?B?YzVteUZpNm1tamVHc3RmSDZDVWNuRlh4Rjh4MFBTZGhuaThRUndVZHVqeGc0?=
 =?utf-8?B?NDFXd21VUlRRQ0czVi81NmhiYk1KSVFoYWpJTmZxaWd1c20zaXB1bUwvMlJ6?=
 =?utf-8?B?OXUvbnowTEozTkxydFVMM004UGZKYi9oa3ZESDhhNUlBeDRxdWcrYnN6TmpB?=
 =?utf-8?B?eXdjY0VJTm1xUi9Ja3ZJb0RSUWx1SjVGVnpGV0J0RURTVFNqZ1ZCVXFyMUQ3?=
 =?utf-8?B?T3haTWxXK3crenNXN3l2ZVRrY0NJVG11dkQvSmdZSjMzM0VJd1RtZmk2cEdD?=
 =?utf-8?B?YmhLWmVsV3dCUG5qSzhWUkQ2YkpMNU41Y09lcUJGRFhPa2NQZmNVNFpTNUFT?=
 =?utf-8?B?emZNamZ2SDdscUo3RW1HbmtKRjQzYWxkRGdLMWhYdDJ4SWFZMmthUkt3ZEZM?=
 =?utf-8?B?NmY2UFNmODlRcHZLdzdNRm5FZ01oVlhPSGR6WDZwV3VhbkhiRWV5K0FYNjFC?=
 =?utf-8?B?cWNzdFdwVk50WFJsdEdFUUxzenA4dlRiLzNmcHJDdkd2dW11WFpFRi9oaG1W?=
 =?utf-8?B?ZCtLTnkzS1ZZUUMrUFN3TldIT0x6OGJNNG40YUI1SzlIMWt6dzZtS0VjSCtw?=
 =?utf-8?B?OW44L0VKWUpEb3B1N2xNS2p1TE1oVWE4ZTdQU2VVMWVqdlpEeEhZMlJ3OHcv?=
 =?utf-8?B?amNjY25VbmtKV0FBQjNKMXVKSGpLQ0RWb01QL1o1V015MlFMcy9QQlNoU21N?=
 =?utf-8?B?RmxFekwyTFZPazRiYm1NZ2wway9UYzk1QW1TbjJ1QjBCMVBKcDNuNjltU3Nz?=
 =?utf-8?B?SUF0SG0xUDV2ZlhFWTdSSDV3aWs5ZUI0QlRDTi9sVys2c2wzQnZrbFY1VXZI?=
 =?utf-8?B?TXNWc2NmZ2E5ellHV3M2VFZTTkF5ZklPVlNZNFFtZzFnU1FCcnpBVjdrNXYy?=
 =?utf-8?B?U1NFUytqY0VqRW44aiswUTRydzBtNy93cW9sMWpXZFYzd2s1Zit4TjlxNStj?=
 =?utf-8?B?QStjaXd1WVRRYm1uSVh1Q2Z5V3Q3ZTB2eWJndWt4N1Z3d1VGbHpFREQ3b0ZB?=
 =?utf-8?B?SHhtN0oxMjBmSTJySzJLVVJSWHlLckpGQ3FyNWZGYnEyNVBQSFF3UmNiS3Ro?=
 =?utf-8?B?U2QxbXliK3JxTmxPSnNCd3hPZkJ3MEVEMTFGUXlHWGZFSUluUCtJcUpENmV5?=
 =?utf-8?B?UXpLY3M5QlR1YWc3Tml0cDhDVys5N1Y4TTdaNTA3bzBmMmZub0VmdEFNc2Rz?=
 =?utf-8?B?aHdaR20vYkRHUzE2Q2tyekE1aTFOMnQrQXlRV3loaTZGeHR1ZzVLek1Hc0lk?=
 =?utf-8?B?RGsrWWhXTG9TN1RzYXlPUlkyWEJIaDFXaGRzWU4yMzJHTW5FSFE1d2dxaS92?=
 =?utf-8?B?YlJqb3MwTFV0a1dsUUdDVGsrZmNERm1Rb1dIQyt0dXBXWHBGeG9MTmtjWE9k?=
 =?utf-8?B?T1NFM2M2OWRSV3F3S1JITC9DWXhDczJ4Wk1UME4yTU4zd1laZXpGNmRyWDVq?=
 =?utf-8?B?dGpHNXhCWVhDTUZKL213ak80eUh3L1NOTWpWOE5QZHpKa1oydEZhcHQ1Z2Jy?=
 =?utf-8?B?ait0M0pqenNYcEMvUUpucnFyaUlZOUllR1ZxOUpBYUVHQ0Vkc1o4azR2TUt4?=
 =?utf-8?B?N2lGRTluZDFSQjEwMmpPaFgwS1dEeDBIS2UvYVV6WHUvcUgwc2VzZDZualZL?=
 =?utf-8?B?Rm83OWJ4VlhmU0h1VEpjT1htT2EvRlNnM1JybHZtb2k1WVJZOFRoNk1IUUda?=
 =?utf-8?Q?80c7PvAm1M+Qz6Qo4dfwwJelx?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8731763-6bb3-4d32-d500-08de0ff4ee22
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 16:22:58.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViSOIXY6M/O+4qw4KJVxS133bLew7yuuR9ek6XNTYdeb59CkbLfCxPKWhDVQmBIna4f/n2/mIenNEnJ3WF2eYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7751

On Mon, Oct 20, 2025 at 01:18:34PM +0200, Jan Beulich wrote:
> Using dynamically allocated / maintained vectors has several downsides:
> - possible nesting of IRQs due to the effects of IRQ migration,
> - reduction of vectors available for devices,
> - IRQs not moving as intended if there's shortage of vectors,
> - higher runtime overhead.
> 
> As the vector also doesn't need to be of any priority (first and foremost
> it really shouldn't be of higher or same priority as the timer IRQ, as
> that raises TIMER_SOFTIRQ anyway), avoid any "ordinary" vectors altogther
> and use a vector from the 0x10...0x1f exception vector space. Exception vs
> interrupt can easily be distinguished by checking for the presence of an
> error code.
> 
> With a fixed vector, less updating is now necessary in
> set_channel_irq_affinity(); in particular channels don't need transiently
> masking anymore, as the necessary update is now atomic. To fully leverage
> this, however, we want to stop using hpet_msi_set_affinity() there. With
> the transient masking dropped, we're no longer at risk of missing events.
> 
> In principle a change to setup_vector_irq() would be necessary, but only
> if we used low-prio vectors as direct-APIC ones. Since the change would be
> at best benign here, it is being omitted.
> 
> Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> ---
> This is an alternative proposal to
> https://lists.xen.org/archives/html/xen-devel/2014-03/msg00399.html.
> 
> Should we keep hpet_msi_set_affinity() at all? We'd better not have the
> generic IRQ subsystem play with our IRQs' affinities ... (If so, this
> likely would want to be a separate patch, though.)

I think that needs to become a no-op, with possibly an ASSERT?  Is it
possibly for dom0 to try to balance this IRQ?  I would think not.

> The hpet_enable_channel() call could in principle be made (effectively)
> conditional, at the price of introducing a check in hpet_enable_channel().
> However, as much as eliminating the masking didn't help with the many
> excess (early) IRQs I'm observing on Intel hardware, doing so doesn't help
> either.

Let's go for the current approach.

> The Fixes: tag indicates where the problem got signficantly worse; in
> principle it was there already before (crashing at perhaps 6 or 7 levels
> of nested IRQs).
> ---
> v2: Re-work set_channel_irq_affinity() intensively. Re-base over the
>     dropping of another patch. Drop setup_vector_irq() change.
> 
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -9,17 +9,19 @@
>  #include <xen/timer.h>
>  #include <xen/smp.h>
>  #include <xen/softirq.h>
> +#include <xen/cpuidle.h>
>  #include <xen/irq.h>
>  #include <xen/numa.h>
>  #include <xen/param.h>
>  #include <xen/sched.h>
>  
>  #include <asm/apic.h>
> -#include <asm/fixmap.h>
>  #include <asm/div64.h>
> +#include <asm/fixmap.h>
> +#include <asm/genapic.h>
>  #include <asm/hpet.h>
> +#include <asm/irq-vectors.h>
>  #include <asm/msi.h>
> -#include <xen/cpuidle.h>
>  
>  #define MAX_DELTA_NS MILLISECS(10*1000)
>  #define MIN_DELTA_NS MICROSECS(20)
> @@ -251,10 +253,9 @@ static void cf_check hpet_interrupt_hand
>      ch->event_handler(ch);
>  }
>  
> -static void cf_check hpet_msi_unmask(struct irq_desc *desc)
> +static void hpet_enable_channel(struct hpet_event_channel *ch)
>  {
>      u32 cfg;
> -    struct hpet_event_channel *ch = desc->action->dev_id;
>  
>      cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
>      cfg |= HPET_TN_ENABLE;
> @@ -262,6 +263,11 @@ static void cf_check hpet_msi_unmask(str
>      ch->msi.msi_attrib.host_masked = 0;
>  }
>  
> +static void cf_check hpet_msi_unmask(struct irq_desc *desc)
> +{
> +    hpet_enable_channel(desc->action->dev_id);
> +}
> +
>  static void hpet_disable_channel(struct hpet_event_channel *ch)
>  {
>      u32 cfg;
> @@ -307,15 +313,13 @@ static void cf_check hpet_msi_set_affini
>      struct hpet_event_channel *ch = desc->action->dev_id;
>      struct msi_msg msg = ch->msi.msg;
>  
> -    msg.dest32 = set_desc_affinity(desc, mask);
> -    if ( msg.dest32 == BAD_APICID )
> -        return;
> +    /* This really is only for dump_irqs(). */
> +    cpumask_copy(desc->arch.cpu_mask, mask);
>  
> -    msg.data &= ~MSI_DATA_VECTOR_MASK;
> -    msg.data |= MSI_DATA_VECTOR(desc->arch.vector);
> +    msg.dest32 = cpu_mask_to_apicid(mask);
>      msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
>      msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
> -    if ( msg.data != ch->msi.msg.data || msg.dest32 != ch->msi.msg.dest32 )
> +    if ( msg.dest32 != ch->msi.msg.dest32 )
>          hpet_msi_write(ch, &msg);
>  }
>  
> @@ -328,7 +332,7 @@ static hw_irq_controller hpet_msi_type =
>      .shutdown   = hpet_msi_shutdown,
>      .enable	    = hpet_msi_unmask,
>      .disable    = hpet_msi_mask,
> -    .ack        = ack_nonmaskable_msi_irq,
> +    .ack        = irq_actor_none,
>      .end        = end_nonmaskable_irq,
>      .set_affinity   = hpet_msi_set_affinity,
>  };
> @@ -347,6 +351,12 @@ static int __init hpet_setup_msi_irq(str
>      u32 cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
>      irq_desc_t *desc = irq_to_desc(ch->msi.irq);
>  
> +    clear_irq_vector(ch->msi.irq);
> +    ret = bind_irq_vector(ch->msi.irq, HPET_BROADCAST_VECTOR, &cpu_online_map);
> +    if ( ret )
> +        return ret;
> +    cpumask_setall(desc->affinity);
> +
>      if ( iommu_intremap != iommu_intremap_off )
>      {
>          ch->msi.hpet_id = hpet_blockid;
> @@ -476,19 +486,50 @@ static struct hpet_event_channel *hpet_g
>  static void set_channel_irq_affinity(struct hpet_event_channel *ch)
>  {
>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
> +    struct msi_msg msg = ch->msi.msg;
>  
>      ASSERT(!local_irq_is_enabled());
>      spin_lock(&desc->lock);
> -    hpet_msi_mask(desc);
> -    hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
> -    hpet_msi_unmask(desc);
> +
> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
> +
> +    /*
> +     * Open-coding a reduced form of hpet_msi_set_affinity() here.  With the
> +     * actual update below (either of the IRTE or of [just] message address;
> +     * with interrupt remapping message address/data don't change) now being
> +     * atomic, we can avoid masking the IRQ around the update.  As a result
> +     * we're no longer at risk of missing IRQs (provided hpet_broadcast_enter()
> +     * keeps setting the new deadline only afterwards).
> +     */
> +    cpumask_copy(desc->arch.cpu_mask, cpumask_of(ch->cpu));
> +
>      spin_unlock(&desc->lock);
>  
> -    spin_unlock(&ch->lock);
> +    msg.dest32 = cpu_physical_id(ch->cpu);
> +    msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
> +    msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
> +    if ( msg.dest32 != ch->msi.msg.dest32 )
> +    {
> +        ch->msi.msg = msg;
> +
> +        if ( iommu_intremap != iommu_intremap_off )
> +        {
> +            int rc = iommu_update_ire_from_msi(&ch->msi, &msg);
>  
> -    /* We may have missed an interrupt due to the temporary masking. */
> -    if ( ch->event_handler && ch->next_event < NOW() )
> -        ch->event_handler(ch);
> +            ASSERT(rc <= 0);
> +            if ( rc > 0 )
> +            {
> +                ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
> +                ASSERT(msg.address_lo ==
> +                       hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
> +            }

The sequence of asserts seem wrong here, the asserts inside of the rc
> 0 check will never trigger, because there's an ASSERT(rc <= 0)
ahead of them?

> +        }
> +        else
> +            hpet_write32(msg.address_lo, HPET_Tn_ROUTE(ch->idx) + 4);

If you avoid the HPET register update here you possibly need to make
sure that both fields are unconditionally written on the first call
after resume from suspension.  hpet_resume() needs to somehow taint
the channels to signal that a re-write of the address and data fields
is mandatory regardless of what iommu_update_ire_from_msi() has
returned.

Thanks, Roger.

