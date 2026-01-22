Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CATWHR5acmkpiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:10:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D04416AE1A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:10:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211614.1523119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyCZ-0007kt-TX; Thu, 22 Jan 2026 17:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211614.1523119; Thu, 22 Jan 2026 17:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyCZ-0007ip-Qk; Thu, 22 Jan 2026 17:10:35 +0000
Received: by outflank-mailman (input) for mailman id 1211614;
 Thu, 22 Jan 2026 17:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yxn8=73=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viyCY-0007g1-DK
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 17:10:34 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41db60fd-f7b5-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 18:10:32 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6938.namprd03.prod.outlook.com (2603:10b6:510:16c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 17:10:26 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Thu, 22 Jan 2026
 17:10:26 +0000
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
X-Inumbo-ID: 41db60fd-f7b5-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrTglBN0V3x26TysFlW5UrgVj7/cdYg2SWF9SyronAotdhTFf1ylQPRrFGUl+0AIHPLQuf8xzJ6o6VtC0L0052DL1FDkXk363ygUpeSCHI4eI6FJPMnNlAg0XmT7q7Ledm7AldwfjIreIACUheruPh4OzNN39aV2eqiyicfhiKLbvaH2Xab1BtVjAcaj8hOMoZX08CCd+KWREWalT/PhJrU+B77CT9a2dnNRhBDuiMPBq8JkQuO5Wj+fhuJBfA/QKG07xWHwiYyhzSaLH+QEBu4LEx8qgzXkA6V98ESH6t+Xs2J9wkASP/FkYJKDxQBq/vCcTSOCotYj4rHbxXlSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SCiws27Drqk7YSgpE0wXkDEzb90rCNRLgQZh16v5MQ=;
 b=an7J050JXmrewKPrUwvUBtrL9FFEed2MSZeHekQEvpPu4BSPAmViD3Tp6250Uba2YnPaZR3KqbI91xrYrIi7tcju6TWqNbWYvQD2VE9CkpsYmBxzJ8FU3zJXysmZY3LQZdA12OsNIj1sbxi1+7uWMo7wMGl+xHaqMyuCf+dGjDboC9Gy0xqn34Kt4muXMA90Eu4aPfWjQfO4yIPVCrG+rY1YPDLGBQonhuwqmmzoAsbZfHjgngz7grItsm22pQzn6GuMot+ZOvaylXD5xBmnU2t9e2MERoLTonaP2Tq0vcljHlJT6dirGVIlB2OHVf8RRPCHw/EEiXH3eLnv5+qT6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SCiws27Drqk7YSgpE0wXkDEzb90rCNRLgQZh16v5MQ=;
 b=chkQl/ciuS2o9bOkFzNHWzCKcWm8HVBxQbkYG5bdR87UfGYif4mF7b2iKLVpGUhV0O76mSTvMydvqHRD1FIIaN2/76D86XLs5y6i5Su1SLnoV/557AH3iav7iqoLELRVCkismeXl+TlOTqiLntj0U5YsaruuyL5MdS8hCqvwBfo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3421e525-fb04-4306-9320-4fa359c2ee28@citrix.com>
Date: Thu, 22 Jan 2026 17:10:23 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 0/4] x86: Drop cross-vendor support
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0136.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d9befca-3b60-4dc5-5143-08de59d92323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1laTXZMN2UxM2pkeWF3R20vcWw1M1Y2L3lsS2F3Z3hObVlLZzljTG9VU3VM?=
 =?utf-8?B?dTFVZlVjNEtyLzhRVW5hOWNWaFVyWmRDQkZnMGt2TzR4eGplN0ExTC9LL1lC?=
 =?utf-8?B?STZNUjBaYzJiVGE1azdxQWdKL1o2VmdSOXdMclo5RS9PaEZpRHNxU21PYk9J?=
 =?utf-8?B?SXFZM20ydkcxMmVQdzk1NWt3Sm16LzVwTXA4RGFORHhPdlNuQ3ZRNW05NlRI?=
 =?utf-8?B?dzRlTzNnZC9URSthK1JsOXE0cGp6ZjJKWXF4Tjh0Y2hnTVdqOFgySmZyeGs1?=
 =?utf-8?B?QVY0VG1XNnZpM2NjMmZ4bzZoL0twMThtUU40V3k4cmVyNExYRy9HM21SUUUz?=
 =?utf-8?B?U3pMM3NsV3Q2UGVyaU5lZkVFcWs4V290RS81dHJ4OFl5Yk45UFFYWmtLc1dH?=
 =?utf-8?B?UzdKRzVVUUMwdUFuaDhLZURCWkNrSXVKTUVHZlBkNm5CMzhMNGo3anBpM2pk?=
 =?utf-8?B?aENpS0xpRDl6cUgrY3hvbUYrUTM2Y3BTSmgwOGN3NFlPR05LdHdmOTBxOC9o?=
 =?utf-8?B?cytGb3RVYkQ5UEJ2UlhWaXh2amdYc0pUb3hQOE9FUzIzMjZjbDlTcFJGazli?=
 =?utf-8?B?ZkxHY3JFUUxzd0gxbFgzZ2hVL1kzUjVMU2k0RW1kQWduSmNNS3J3c3hwblR4?=
 =?utf-8?B?T21nSEpPNlc0STBReE1yYzJCUk5mbFhmeUhVVk1rUWVKRDIrd0N4TE5vMkZB?=
 =?utf-8?B?WS81bGt2WWRwMWZoSUcrcE9ycDhHZjFCSmhyTzBaVU04M0RIc3NocHNTYUZH?=
 =?utf-8?B?YmhnZGxSTGNVY0tLYnN2Ykpla0RIV2ZqaXNiUFArVEt2citlcnFoTnFXcE1o?=
 =?utf-8?B?c0wrVnU4SWZBNHpnSExMYmsrRHRYV3VBaEtTaXNBYmRlSnBBbzZCZ1F2V2Y0?=
 =?utf-8?B?NlNkMXVJbnRDbGhRcStQa1pIN1RVbGdKRUdkUXZZQ1BUTkdvZlJCbG9KdE9S?=
 =?utf-8?B?bWsreFg0M1JHWEZIWjlVMVNSMkhzZm1GaGRnQmpqYy80UFozT2lWLy9QTnRS?=
 =?utf-8?B?dEJISVQyZGJwd20zWk5iU0w0Tzd4c2Z3SndYaWE4K1o1a2E1T1RRUW54ZStG?=
 =?utf-8?B?UWFCL2N3ZXQvZ1poai9TV0t3KytTZk5wNEZJdVRkNkZrWXJUTTM3VGVNNEpH?=
 =?utf-8?B?ZUtoUGcxdjZoYzl1NEtXM1dUNis3QjFYbVhUV2pFQkZNeEdYeno2M2tCRVUr?=
 =?utf-8?B?bUdHSk9pNERQd3E5N2trcHljUURqTFYvU3g1TnlZc2ZITCt3Y0FJME0rZndp?=
 =?utf-8?B?c01PeXdwSDRzYVhQaVRPeitNWjhLZ0w1U0R6UXdZVzlJSW1Od0g5WFdVdTU2?=
 =?utf-8?B?L3YyTmRHZ1pzdklaSERGTlUxQ1M0SDljWlNVa3IyMlcyU0N4MS95VDR4SWxF?=
 =?utf-8?B?NS91ZXdNc0pqaDVoMWxwNUl5MEJ5V0tFZlNKSlpMRWVPbVRBRXhrcVBVRzF0?=
 =?utf-8?B?VmNFUk1VYzJmZGRIeWt4ZGlmeXBVbFEydjVUY3ZSUzdlUzMwRmhWdUVHSDc5?=
 =?utf-8?B?eVkza3ExV2NablBLaEVIT3Z1b3JuQVBCL1U1TEdVL1RhUHViQzFJK3VJdWZX?=
 =?utf-8?B?S3lOQUhiNzgrcHM4S3FPc2Fid0dBd0hMWVB4Nm54ODVNRlVoR3dXYzEyVElw?=
 =?utf-8?B?M0gxTXVxY2J1WWFpVS9jQ2RNVDhiUTgyS2hTaS81UVg5eEFkRWdpb0FSVHBs?=
 =?utf-8?B?TmRORTRZeTBad0hCL2hlanI3V0dxVTdmbGh0WkZIcnhuUWplODZwMUVHRmk2?=
 =?utf-8?B?L1hNRlVkNGVFcjhoMk1ZVHY1SExLYlFjUk11V2ZzeHp4MGlreTlNTXpJUHFr?=
 =?utf-8?B?NzFjUkZDenhXWHpjQVFFUUxBclBkQnRiYjZjeFF2RnBncFFVeDNmWWJpZldT?=
 =?utf-8?B?bTZBVS93eVcxMllsdFhQZG9KRHNYbW0zTWdLSVdlM0RUZTlNcUpqNnMybWRY?=
 =?utf-8?B?TDFReVpETzlpRjlQck1keEx6NW1pZnZmVVd2MjdvTWROR05qZ3VCdDhiVUg4?=
 =?utf-8?B?cWlDdURZeVFYZ1Nnamp6WWQ4SE9BODNzdzdJVW1qTTF5bkVZV01VV1VuZFM5?=
 =?utf-8?B?MzhuV29MZnVtejYvUXJFYkl1RHJieTJwd2pFamloV1JaTzdieXEvdDNheUl4?=
 =?utf-8?Q?T4TY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFo2ZVpueklsN1h6Y2pwdTIvNlltZlNUZnlNTlpsWmtiTDRuNXFROU9KZDZz?=
 =?utf-8?B?Z2pxVmNDRGdSYXd5d3RNclJVSG1zL2tPWWJsVFF4Zzl3V2lDc2xRdkUyRDF5?=
 =?utf-8?B?NjJNYTlBc1hpU0tLaEpaLy9ZQUJ6VnkwVCs3YzAvRmsyQ2ZvTy9jR2kwenJw?=
 =?utf-8?B?Qjl2b3lxelZaOUhSRnBwbDE3Mk5oZzNiTWNvTDBsRTJYU080SkZWUk0zNVM0?=
 =?utf-8?B?Wi9mNW9ZN3h5cVdxT2ZuT3U3WWhyQ2luNDR1SWpsbm82S0JwUGcvekRMTTZE?=
 =?utf-8?B?dElkc1p3ZVF0OWV1dW5Za1FETk4xc2lha2tmTFdvYlNwNWZFOWtYQm9kRGxj?=
 =?utf-8?B?SVNhMTNhdDBKbVcxMWw2R2loUFUveGozMlZUVkF4bFJnRFhudkF4WGNNRmp4?=
 =?utf-8?B?a0RXMGFYLzdmcHJRM0F1K1dWRTNlQ1pJRW1tRzJxeTBsTzNyTzI5eXhyOC96?=
 =?utf-8?B?bU9uWFJDenZXU1dVTkRCL3p4NWdvWUlGOHV3cWFMakhaanNzT1lPRTVNR1ZR?=
 =?utf-8?B?NS9qTWRDQ0dYRXVWRlJ5ZjhYRHdkRHR3Y1pDRDhYai9uV0gwVHIzNkhmZjlh?=
 =?utf-8?B?NHRCUWtmSTJ5UEhKOWdzL0JaS2ZVNWx4YWIvRzA2c0YvQ29qZU9hV3dsRURQ?=
 =?utf-8?B?VTdVbVgyUzJmM0lxRjJXWWEwL0luTFRhY1o3YjFaZnFRc1JFM3hHL2xPbDB6?=
 =?utf-8?B?L2RldzAwUWNQcGloTjF0OE02eEdJeGsxRUdXbUVnU0R3WEdQMXF4RU9wVk1o?=
 =?utf-8?B?M1hHaUpKNm5jcXRLYmZBYU5Mc05WSk1sZHR4ZGZoaGppS0F5TSsrYnhLNDVu?=
 =?utf-8?B?UG03cE51R2dKOTJmWU9iYmRZOHNaZmxiN3R0M08xOTUvenF1U2xlS2g1RVZX?=
 =?utf-8?B?UWZxK2NtOGoxVjZSYVpEMERXck5FTVkrL3FPaHlOK282M3p4L1p0RkdMdkF6?=
 =?utf-8?B?NlgrQ21Ba0tvYTcyMnpZcXJSQ0F6ejQ4d0Yyd3lhZlRwejZyNDlrUGU1NHZP?=
 =?utf-8?B?NksvMFpOVHVLV2gyMzNqRDBmcHhFWFJzb1d5Vk5rTUFZK2RsZm1SZjNZVWhp?=
 =?utf-8?B?UGhiU2V4Y0xBQ3Uyb3VVMHlueTRkSUV4RnJ6RkdzcElVTUVqeWpIV3cvNE1w?=
 =?utf-8?B?WXI3UXBiaERtc1pFYmpuME92bEtiKysvOExyR3RZTUt0aFk3cDVUbDNqYTFa?=
 =?utf-8?B?aURaVmxsR2FtWVBxdkFaemJpWElQRUx1TldPY1ZKcGpvNFd6MW9mS1dZbFR2?=
 =?utf-8?B?dm1aQ0doNnZSMWFkcUN0V0hweU5ZZmp5V0RvRTJ3WFA1L20rRzlMZk8wY1gx?=
 =?utf-8?B?bldqYWc1czJ6Y3RBcGxnR2lrNzV3MnUvNy93eUNuUUFEZ3VCREdEWmlldFZ6?=
 =?utf-8?B?eGZHUUk1RzI4WHkvWVZob3p6c2dqbTdxbjRaT0tkWWw1Rk8vaTZDMmV6L252?=
 =?utf-8?B?SlRYa0NNV3N4YVR5ci9xT3BONTVUcXBuSnk4RDF2VDRGa05GQnFUbjVZd1Jp?=
 =?utf-8?B?aG5CRmZaRjRab3N6ZmFzbFFyTEh4NFJTSm9VOHlxTGsvSElrbGNGeUorczU2?=
 =?utf-8?B?bktKZzJWZlFhdmx1QzRXcnFNdjBLZ1Nsbmx0Zmxtd1dqRWwwRHFZQnJ4ODQ0?=
 =?utf-8?B?YXE1T09yN0xENWpkcHZuVUw1bHF6Yml5YllOQWdMVThRdzBVQ2o1c2RsN01s?=
 =?utf-8?B?Q2tnaTNUUWVaUXh0NUFldVJUZnVaOVRlYVlaNjZuYm4wSk9yTTNZc3VOaE1M?=
 =?utf-8?B?SWVjakovMDZKWFE4V1J0SDhhY3NkRW9tMHpHcUpJTytRWXAzZHlITUtBcDRN?=
 =?utf-8?B?aFk3T2V1T0I4QVdPVmgrWUM2R2tHTGd4VlQrcGpNUlZTL0c3Y3VHbkZpTzZS?=
 =?utf-8?B?YTRPSjR3bm1XTWlwdm5lV0l2OENRSU4rV201ZW5iMFFCK2VwTHI3c2IxQ3RR?=
 =?utf-8?B?bDR4Q25KVEJzczIrSHlLNUNSd2QrM2pLd3VIWFJlaGlYdGhrYnE3M21NMnor?=
 =?utf-8?B?WXBwOUZsUEw3VmFDQVFtZ3FkYkV5RGFvWmJFQUFUemcyelZxNVJ2WHJnYzE0?=
 =?utf-8?B?TlYzMVVnczFVRzUra2FlZFdpWWFKNWtwU1VQUlRFbm1CN0Vvd3l4UHk4aFFX?=
 =?utf-8?B?bmw3U0dJNVpucHN2emwwZTBncU81TXhRanFzdzhpbnY0VVkzY3NLRXJSSTNw?=
 =?utf-8?B?djUxNnRTbTNaQnVSVHlERnhZNkdjUHozRWlKM3ZrYzE4RkRNbUMxU3hMd3o4?=
 =?utf-8?B?YzkwL0FzSFVHbXdtZEVqNS84ZVhFblZLVldHaWpudzZ4bjY3QzZUTitRWFNr?=
 =?utf-8?B?VGl0bUExaUZic3J3VWo5bmUzTHpBUkQzS3cveUJvbGJvdENaYjNqUXgzVHBK?=
 =?utf-8?Q?sYGG4HmVoyazm52M=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9befca-3b60-4dc5-5143-08de59d92323
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:10:26.7690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/P4ou9nzBW6rQB6f7azKfwyRXlGwP51JaY+nhpAbJKf1U3Hj81weUs7X5DdAabE3w8rDx3Wp0zKHKteqCmNoLOuehCkpCYv4E3HnACDwSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6938
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,xenproject.org,suse.com,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D04416AE1A
X-Rspamd-Action: no action

On 22/01/2026 4:49 pm, Alejandro Vallejo wrote:
> Open question unrelated to the series: Does it make sense to conditionalise the
> MSR handlers for non intercepted MSRs on HVM_FEP?

I'm not quite sure what you're asking here.

~Andrew

