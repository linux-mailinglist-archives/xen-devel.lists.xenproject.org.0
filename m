Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP1gCETLgGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:05:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8269ECEA4B
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:05:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218774.1527629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwQH-0006m4-U9; Mon, 02 Feb 2026 16:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218774.1527629; Mon, 02 Feb 2026 16:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwQH-0006jt-R9; Mon, 02 Feb 2026 16:05:09 +0000
Received: by outflank-mailman (input) for mailman id 1218774;
 Mon, 02 Feb 2026 16:05:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTrP=AG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vmwQG-0006jn-TN
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:05:08 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0ddb611-0050-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:05:07 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN8PR03MB5044.namprd03.prod.outlook.com (2603:10b6:408:7e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 16:05:04 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:05:04 +0000
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
X-Inumbo-ID: f0ddb611-0050-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRONBckEuKxAw6Um/81IiAFTycD54OaCcpZ5gNu0jb55nGwiQ3JCX4d8SWhpHTl9pu5zdKd4Kj1CfT60U69g9fD1MAqMwRm9lAxrHfXicugl7awHHwhd47jrB0+0xQR6+GU1GVhRrThUuEc80rN5cW4FA4SYyyLzitxSyQ7cPVRmyJjjEt264GYEZ5IdXyqPJAiz+H8/yZTz7e0aqhzi6BWVLCaPYr3ZIBNoOy1JmO6G7wZi72jYLocnOgdyJRbubLvcG6y7In5Bfzlh0eaRXwI5sRMC+vtFd9kprsALyYSPBGI/qIXiqZ7eQqjCxW70fazH885kAhOGrt11UP5NmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxvFgaVgjyZInLOJCwFp5LsJs2bkiHyxCvOroDEz6iU=;
 b=yW/uwX8vfKXD6npFJSpFZN60V3BpzBAXwh5yaxMOH7cvthYuYzYjBTmNkgqcTszRtCPlCR3fhDRlFatkFiZ8/ABlB0CuOTvBSH5xugtyt7KhiDmFYs5n/qiu8SbA78zGTAxdjDL8qBP0O0c50NKRZEmdgR8agrPJsCkNwJ+bq5TUWZM//K0MU/UwlkTDjdeqV6Ty3JCQDa0KGKlTNeH/TSlhSf5cZyQh/xvP/qQb6lzh8LVJtxRkcqvsSAtD4R/rbcZhHw7FwJWKBOsNW7aUL+UMnBdDDL3pmKjdOf3zMqUTkZYSKLA2aoAAUOjNME6o1mCq9e0d4WVOSQWLQMW0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxvFgaVgjyZInLOJCwFp5LsJs2bkiHyxCvOroDEz6iU=;
 b=erGxz3orVOXQhf0fdrqSEgbTjLELYq9A2pcnCn9PsFqaaekRDLN45T1qs6THCNxG2Ky6IdjbNt37cZQKCk3tGynD+KQcpNIUqxFB7GPE6/khu3qHzmXnWoutZl6evy+9/57edZIVNng6Ay82scEL9zhjMtWeV4gaBIRPMUnE5+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 2 Feb 2026 17:05:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] CPU: abstract read-mostly-ness for per-CPU cpumask_var_t
 variables
Message-ID: <aYDLLOunpgoM9KzP@Mac.lan>
References: <fe35f075-ff44-4942-bcd1-dcd917179867@suse.com>
 <aYDHyutbi9EQcOe4@Mac.lan>
 <7eed3c7e-b3e8-4a0c-bd6d-c4ba22bb1c10@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7eed3c7e-b3e8-4a0c-bd6d-c4ba22bb1c10@suse.com>
X-ClientProxiedBy: MR1P264CA0118.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::25) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN8PR03MB5044:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba6175e-b263-4474-6377-08de6274d3ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3EvM2NRelVQQVZySm1OdkJiSmFPcFZpOE1QcFNjQ0h4RUFsZ25FZWR1WHlR?=
 =?utf-8?B?Zk9pV0w5Mk5xdXRFVE1FWVB2OHJUVkVpWmdCa0pONkxyMUkyK1dvVXNCWU05?=
 =?utf-8?B?UW9ZUkJEQUxQby91ZnBEdnFNUGRpOXFTRmppaGFNUmxQdFI5czkycDg0Q0kr?=
 =?utf-8?B?RHJ0MEdpc0xPM3lmRXFEUFp5Z0dqRHlBd1l0SUZKVG9oK1dveWNvN0RYZzll?=
 =?utf-8?B?NlliSDBNazgyelpJbkZYd0RldHJoQk1ja2JYM29hL0xsRXZDc3Y4T0xqTHhs?=
 =?utf-8?B?UEt4OHd4aW0zcGxucDVwZlRFTFBKSnV5b2Q3V1o4VmJHeTZlQmxDVVhKcUp0?=
 =?utf-8?B?NEw0QWxvWkJoV3AyZVZSSGxsRytzUmdnd3hrWWE5YkdsUkQ5QlJDbkVpMWJQ?=
 =?utf-8?B?Mzd1a21DT0Rtbm9Rblk0REowUCtVc2w2R2poYlBiSWJwZDhTcjJvcVlIV00r?=
 =?utf-8?B?MEdtbUs0Z25LdkllT3ZoVStCcDVJUUdtZzJndHByclVreVhUZlY1SDVBVzRs?=
 =?utf-8?B?dDJ1NVV3Z2VpYXFEZkFBWDVmTEdXanRiVVprKy9vN2RVek83VUxqN25ET3Nx?=
 =?utf-8?B?U0N0cGNnWFA4alZrV28zREUvOTVLWTdIQWpUK0R2K1NXc3cwV1gxbGlBRG9i?=
 =?utf-8?B?US9MWjBydEtUcStmek4wbms2TmRkRytRakJSd055NTlsY3ZPdkIvcDhkeUhT?=
 =?utf-8?B?UW9VSEl0N3gwK1czOHNTNGJOc29EQk9WbDhYTlBhbEg2Q1p0V1BEUGpITjI4?=
 =?utf-8?B?SWRITDBxNjRSWE1na0JJZzliTUJSckJxd1NyUm9sbnN6emxPYUhLWDVNS0VG?=
 =?utf-8?B?bjNWYjIrK1lIMDllSUhLKzBUdVhhaFIwWFIrcU5BeEJtM0krRnQxeERkODVB?=
 =?utf-8?B?eUdNaktmaGVlYUkxUXp4SFFzbmQzcGZWQ29vb0l5Y2pKUTc4elJaOVpmKzJW?=
 =?utf-8?B?MkczY2J3Nm85ZDhxT1hKNEZGamd5Zkh5b0RURXhMTUMrOGVLcnBYdUYzK1RY?=
 =?utf-8?B?eDBwN0lDeGZONS9MRncrcG5ZTkE4cXo2ZEZnalZyZHFUS0hwbnAwdWZNekhk?=
 =?utf-8?B?akpkWDc1a1o5Q1ZYb2JqVEY5TGV0ZkJaYlNnZjgzd3NDWGszeWRucjNrbHQ3?=
 =?utf-8?B?cXl6MS9iajFsT0lzQkM2VlpOQnczMTd3M3Ftc09wTjZRY1lyOTBOMTByQjRD?=
 =?utf-8?B?OUJ5U2dvdTczOXpwK0kyS1ZWM0xXaTdqZkplcHVOaWZYQUloYlY3WWFQUFJI?=
 =?utf-8?B?UVZIdnB0SWlKU0NPN2dHc1VxWTlvRFVoMmN3dDl4TnBMZFBhYnFqRW5IRXZK?=
 =?utf-8?B?eGNiTEtxcU42U0lhMjBhRGVzcmhMOWhlNnRreCtBTWY2ZGpUcHpaMmMvYXVs?=
 =?utf-8?B?M0JYUk14aWUvd0pPWmpVNFJkeUd3eC9BMWxJTkttZnNqVUFnTjRNMUJLdHhT?=
 =?utf-8?B?blMzMWRlc3NTYnh0ZWVkb0FjZlE0bGdOKzJTMHN2MEpDVjliZitlMkNMeDg3?=
 =?utf-8?B?NTlzVlVNc1A3dTBtMHlKRFFyeXpXM0JMazVXU3ZvRGNFSEVXRDlPL2hjODl6?=
 =?utf-8?B?cXFUa3Q4LytRL0RIVGhPN2wxMTd5TUZ5a0tzTG5jT0xBdXJmY1FCSXNjYmo0?=
 =?utf-8?B?WUthMGV6azJTYVVkY29IWUdBZElJQ3l2WTIyTFVjTS9ydGJ1UEQ0bHJtUUk4?=
 =?utf-8?B?T1lCOUVJM0M5Kzc5TUt4ckt3Y0xSZXRLRTBvRzNNcE9uaFNtOGh2T1lXb2dZ?=
 =?utf-8?B?ejV3TXhjN3ErRGNDa3VYOTBIMTRrUWRPUGUyREdhcUg4TGkyVzZrVE5SMS92?=
 =?utf-8?B?RmxNc1pnSXMvcy9QNElqanExdjRKNDJMbWlYY2tDRFlBM1R6aG9PU09IVjFX?=
 =?utf-8?B?MkxLRjFOUDYvSHY0eU54OFYyUy9aU1VXeXNUV3pWdGY2c0g4RHUzRDlxYmFS?=
 =?utf-8?B?TVRTTzVFQm8vRlV6TWVSUGxRWG1JSmNJYkh5WURMSStHR2NxbU9DdEZyZHdO?=
 =?utf-8?B?YndJWnhsSklraE54cDU1eks4cVJubjRrbkE2aVdqWTE5c0ZSMFVyb2sydVhD?=
 =?utf-8?B?S0NGOUhPTFUzdjVMQVIrRk9GanYxREh0UGxITHlxMW9zQnJhWE44RkdNS1FW?=
 =?utf-8?Q?vRnc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUdlZmpnTTM4VEVWbHpVczRoKzN2RzZnYjFaUVpuclorZnF4Z3ZNQUlrLy82?=
 =?utf-8?B?Si8rNUdkRG9kK0pKU2dPTzhoczB2S1lVbkErN1NIVW1hSFY5ZFZqeVNPSGdZ?=
 =?utf-8?B?UXhPakhSRWU4S2hRTGUxU1ZONHhpaWNHT0x6d294MktNaUdBSTQ5VmF2MCtl?=
 =?utf-8?B?R3hRcEtBZTNrSTN6U2I5THJLNWN5WkxobUVOdm5JRjllcDNtR0g0OEt5bHhw?=
 =?utf-8?B?QzVUME0yUVJCaFNTSmlEWXVRVGRFaDI5WEJNc2owQjBpZTMxTHZ1N042T2Jh?=
 =?utf-8?B?ajV4V2ZZS0JzN0QycTQ0L1NDYTVFZlE5UFFQb2xlSWkzNk4yWDkzVmRTUWRR?=
 =?utf-8?B?VUNaMWpSc0s4eTJNMlVNdGlOdkt0aHB3eU8rUlltYVplQjcwWmlYV3IzTTRS?=
 =?utf-8?B?RUFROVNlZHhxUjVRUGtyK0U2cEZtUFY4NmZPUTZwUVF1VEZmem0wY21Ba1Bo?=
 =?utf-8?B?eTEyVVBVVWpyZ29uZVZSSmpZTTZJSXZJcGF0bmg0YXFDUWpJakd1VWpXU3Fx?=
 =?utf-8?B?UFJZZWcrMk13REk1RFZybVl4UVdzc29vMkNQWmpOaVRndHc0dUVLRmxDa2JY?=
 =?utf-8?B?UWFtckpRdkl0b0lTZlZMS3BmSnorSGJmNldVVlBYWG85SEhXdnZ4TnlmUE5U?=
 =?utf-8?B?emVuYTZUdC9ORWZqU0dYK25nRWowMm9TNkljZ0l4UnEvZWhtZC92ejBoSkNC?=
 =?utf-8?B?SlJQRHpVVmtMWjluaWFpWmI4Nis5Sm1yUHg2MmxYckE2aWQ0UnBKWDhjMkhy?=
 =?utf-8?B?RERDUmQ4eWxBT2owMHVhSUpwTHBxWmhDeVJHallsL2VVMmZWOGVuVVVDazhW?=
 =?utf-8?B?SGljQUduTWRYZk84ZzZ2dnJsVEFITFh6bSthZ2VIQ0VXczBLQ1FxejRFVjFu?=
 =?utf-8?B?UG1LME9oMU9raXVGcHVGQndlc2hDZ0o2cGNaSjdZRG1NNU5tZTB0S1Nzc2Qv?=
 =?utf-8?B?VFdhSFl2eVVaTE9HaTU2UkpMbFdXSVh1TlNRUDZNT3pYTGUxdWpSZ29nQ1hu?=
 =?utf-8?B?elNHMmM5dVBwZWpsRzViUDg3SGI0TGxPS0FzU0hVZmVNMjRQVmJabjJMVUJB?=
 =?utf-8?B?R1pFUWoxYXJsNjk5RVIwSlNTUEhQSzZva2xxc2UvM3B5amxBbHZTZVRpeXBz?=
 =?utf-8?B?SlhzVlRaNG5uRHdaRmwwQXJFQnZ0QWpMWTAvRFlqaFM4Mk9vN2lvNlFwWHky?=
 =?utf-8?B?WlphZk9BT2ZFbTIzUEZIdzl0bDVYai83c2Q1MGNBb0xjUlVNYWZqR1JiR2hw?=
 =?utf-8?B?cytybFRiVGZzZG1tTHN3Zkw5RkxVTEFCUDBsM2RYZHFCcnU0Ym5VR2k1QW90?=
 =?utf-8?B?aVM3cEtLclhrZ1NpMHVuUWg4NldHVTFBbXljc1VYU2djVGpjQmplU3VVai9R?=
 =?utf-8?B?YzA5L0F5ZVNyeUxvMXJndDY1UG13VTlwZ0ZVNWFmZE9laFdnV1k4cG5PL1VI?=
 =?utf-8?B?d0s0TWwyanB4Rlk3RkFHUlQ3N09FRUE5Y2VsSkRFbmhEc1lFKzVrQjRmeW1N?=
 =?utf-8?B?WVoxbjQ2OXJwTFRFeWVYUDNjRTNCQ1J6alI3L2Erc0docndrYm84WlhtRmhj?=
 =?utf-8?B?d0FWd3dwVENZSDlPbGVCNjcyWmVDeHE0aXhFcVFvMFcvaHFSdVdwWEJKY3VK?=
 =?utf-8?B?bHdkUWRzMWJvNElPOVhqRjREd3czaHpaNEhHd0YzOTZjQUFyeWsrWUlvR01Y?=
 =?utf-8?B?MUlnZzJHeExoNUE3MHVsaWhQVHM5bkM3RUY3WVQ5M3Y0aEVOK1d2THFCb0Zw?=
 =?utf-8?B?dFJHbitjdXhudmFyM25meFRnNmdmbm5aSU5ldi9mQmhYTmNYS2JaVkNrQ1Ar?=
 =?utf-8?B?SHdFZnFDbHRnb01nVEkvVVBQL0R4dm5iVFB0QWpnQ1U1MVhFeGc4em9PL3hn?=
 =?utf-8?B?N1UwMDNxdzhPQmZldVNyUklFWG9XTklkYUtjZTN6Ykh5UzlQMTY2TVNqK2NC?=
 =?utf-8?B?aGRDOHM0dmdzQ0Vjc1pBc05RUm5iZ2dpV1NsYSt3enJ0THFJclR5a2JzZEVE?=
 =?utf-8?B?M1RiWlFjUlBTZ2N3WE9Idi9Zc1VpYlBmUHArUEpRcDlOLytWcFJNR2tVcUhh?=
 =?utf-8?B?TzBJekE1RjFoLzVEM1BaUlZpV1dzQ2E3OTVCbUdoenp1RS9JNkZmQS90ck9S?=
 =?utf-8?B?OHlscHI2U1dLSkVEZjZVamIrODZyMEU4blVGY3EyOXJJRGpvaURNVzZxd2Rh?=
 =?utf-8?B?d0N3aHU0SUFhc2lFQ1JvSmtocWZFQjQ5c21HVW1Nb1hPZXRqbVpzRHFVYlB3?=
 =?utf-8?B?Z0kvMFE4bWU5UGZYV2JrcGpjTGVKNG8wbzdCWXJUb3ZGMWRTbTRVd055d25B?=
 =?utf-8?B?Tm84MnRlR3Z5dHlKUFNzdUkzbkRxMEdhNDd0OXd1cllkL2U5OVROZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba6175e-b263-4474-6377-08de6274d3ab
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 16:05:04.2673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 039XF4aUlCglsAtiYizXwgRERGJhVqlpUUuhfZEA/wTnKn0gGXbeZMYy6KRBxz7p6a35NS+kduNKgmT/9ZPFMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5044
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,Mac.lan:mid,citrix.com:email,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8269ECEA4B
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 04:59:07PM +0100, Jan Beulich wrote:
> On 02.02.2026 16:50, Roger Pau Monné wrote:
> > On Wed, Nov 12, 2025 at 04:53:27PM +0100, Jan Beulich wrote:
> >> cpumask_var_t can resolve to a pointer or to an array. While the pointer
> >> typically is allocated once for a CPU and then only read (i.e. wants to be
> >> marked read-mostly), the same isn't necessarily true for the array case.
> >> There things depend on how the variable is actually used. cpu_core_mask
> >> and cpu_sibling_mask (which all architectures have inherited from x86,
> >> which in turn is possibly wrong) are altered only as CPUs are brought up
> >> or down, so may remain uniformly read-mostly. Other (x86-only) instances
> >> want to change, to avoid disturbing adjacent read-mostly data.
> >>
> >> While doing the x86 adjustment, also do one in the opposite direction,
> >> i.e. where there was no read-mostly annotation when it is applicable in
> >> the "pointer" case.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> ---
> >> Really in the pointer case it would be nice if the allocations could then
> >> also come from "read-mostly" space.
> > 
> > Hm, I guess for some of them yes, it would make sense to come from
> > __read_mostly space, but would require passing an extra parameter to
> > the DEFINE_ helper? Or introduce another variant.
> 
> Whether this could be sorted purely at the macro wrapper layer I'm not
> sure. It's the actual allocation (which alloc_cpumask_var() et al do)
> which would need to be more sophisticated than a simple _x[mz]alloc().

For the array case it could be sorted out in the macro wrapper - for
the pointer case it would need to be sorted at allocation, which makes
this quite weird to deal with.  Anyway, this is better than nothing I
guess.

Thanks, Roger.

