Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ADDD267C2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 18:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205648.1519779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgRDz-0002n1-NF; Thu, 15 Jan 2026 17:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205648.1519779; Thu, 15 Jan 2026 17:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgRDz-0002ku-KO; Thu, 15 Jan 2026 17:33:35 +0000
Received: by outflank-mailman (input) for mailman id 1205648;
 Thu, 15 Jan 2026 17:33:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZ5x=7U=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vgRDx-0002ko-Vo
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 17:33:34 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ba3b0bf-f238-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 18:33:28 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS2PR03MB8158.namprd03.prod.outlook.com (2603:10b6:8:27b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 17:33:22 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 17:33:22 +0000
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
X-Inumbo-ID: 4ba3b0bf-f238-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DU76gdvHuIPHw8RmlSiewDp1pR5W+36ltDLE2S4Kdi5QlW7v5cSRTQYPsuJoaV4D3XTrsHJnPZ3DtQW/r82r+5VRw4q4k23P3fcSluxWvxCBbKyHkoee7JrzVyglTZPAet6YxwfETed+jbSK4YRHRNuQUqzDn23HWCjl7Dbk2LjK95UGVToqjPlOpPz+l7Nn/nBwoJVo3QpYVeMBhvgvUrExxAurXrqiGqsGzATjEl0piFKThXq4NtemYLBJMLsEsvQofCCrL586bsEGmwEjZy5hd/8D7R3ySuZMm/1T2ve73qylGOFGz2dz9U01psCEzPIGo+BMXXzKHYtFCaNfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBwI/3ozVYTUN92TwQP6D4wLM33n82wTqfF7bmaMe2U=;
 b=TfPOWGgoc4dpNhWCXPCLFThSfHaVZyG5ITfjNa4IVvIqNlvtY5FvX37a0mfJDQ9qVEgzJrCqUBCXbEDwlBnQXtsn+EeOW0mffRA+h6nDuKKuuuHS0ax65yr3mwTpvz4xlNb5FRjrQnpY2oklD0OYsVQs4jS1deMrILsLNtmS+e9sdx9yJEqcZVFypnvUYgua5JfyOTDdp81HXiw4c3T8kMREDH48+mEk96UmpVa4My3rs+uJVEljD9N5IpvcpfZdbEN6P70KxO+0BGVelg1VLESVRfzpj/2N9St3s3NnRrLf/bKQb8fAzOk+FCUi1Lbhk9aTZNkh2NXGGffGne9o4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBwI/3ozVYTUN92TwQP6D4wLM33n82wTqfF7bmaMe2U=;
 b=rrevciZDSk/05oLza/TYH5APTRUNcKICGr7OOZzIIMJMAMvmYLc6pIdLGic6Q0adXAlAkaoC9Q/KSvntvVAFxz1aoK/NYouZR6gjJnLrs1vFEqSbnTGo/LEpOwPxq0I7V2vjTGYOFq2Wp+TD8Xq6+4LvJK2ZF0EVjSiphuG387Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <57a89245-d493-41a8-9e1d-adfab2282771@citrix.com>
Date: Thu, 15 Jan 2026 17:33:18 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] xen: Move NX handling to a dedicated place
To: Teddy Astie <teddy.astie@vates.tech>,
 Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <20260115151658.3725784-1-julian.vetter@vates.tech>
 <69b511db-654d-46b3-aca3-3f37f30d3473@citrix.com>
 <ed39c6b4-a9e7-4ef3-a185-27533be55e96@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <ed39c6b4-a9e7-4ef3-a185-27533be55e96@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0134.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS2PR03MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: efec6832-70ca-40a2-c724-08de545c2ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjNQZ3dWZUJmRmxaMUFuRFM1THVoTzhPcHNKUHJHMGRLK3pHWWNKbmFPbXQ5?=
 =?utf-8?B?M253ZUI3bUJUT0VWS0RyV0JkUmYwQ1ZMWHJ4SHpNTnNRTmVqcWY2djA0TUhh?=
 =?utf-8?B?K3RWWkh2dGRkanFkZnQ3RURSQmE3ZnYyVWlkL2hyK1RHSkxtdSt5OTZQN29P?=
 =?utf-8?B?QS9KT0F3NkpYNnpIVms5bmtzVXNMWGdrQnhsOFkvc0ZoazlhaDIwOXN2Z2w0?=
 =?utf-8?B?bUhUK0s0T0dhVjc5Y05TbktJN203VVh1Z2dyME81MDlseWFOWTBUVkY2Zzk3?=
 =?utf-8?B?M1phKzJLSHh1UDF4OXduNC9vTk1yYnF1eVcrNXFnRFlEV09rQnlTbnFnd3dT?=
 =?utf-8?B?aHZMWHpTMUZTYXh4eWJackhKZHV5MW1ITmlvMFo5ZVowQkJacU9pYk9tZVlG?=
 =?utf-8?B?VWhPNk1IaExMNm1hSFB0MDh6L0JnY3Y5N1RHRnEwOWtHS0tnN0RFMDNOYmZW?=
 =?utf-8?B?L05EZURyRVBLLzVKT2EvMDA3aTFEMFhUNHB6VTJ5dWUvSnY0Wld3RkgzNkhy?=
 =?utf-8?B?WFJFMUZiQXhNVnd6UlNNUkd4Vk9nVForTkdGVFNnN1hDODdjT045dDk1aHll?=
 =?utf-8?B?VEh0a2JMOHgvVEg3L3lid25FSUs4SzdjL09kTFg5NWZNZVdhVWpUd3AyVlJk?=
 =?utf-8?B?Z2dIbUUwMWlYaTZ0S2VGckJzNU9HdTIzL01mdVdGRzJYanFhMHBoUW5DT08w?=
 =?utf-8?B?ZXduT2FKVjJ5RFRObWhxUTM3UEFrTWRMSmFQZjB1eXF2UW9reWtYak1IeHVx?=
 =?utf-8?B?TTMzcm5RM0JnZzZ2N1hzVjJvRFRkUmg3OUE2M2FpRERBSkxhUjkxcjQ5bHZW?=
 =?utf-8?B?THZPejZ0UWQyaXh6dGwxWDhGckRYS0FKWHd3V0lHZ1h4ZnoyempNYjZ0VXV3?=
 =?utf-8?B?N3R1UDdyUmNSUG5QZlE1Q2pVRUNHZmhadFBxdm9uejFWQXJiNEdUcmg2cWp1?=
 =?utf-8?B?ejJjUmc4NDdBcUhyZTl6TGJycHRYcGlSL09uUDhpTTBoUVdRaTZ0SHpsMXd3?=
 =?utf-8?B?MndnZ3FhdWRRdDBiUzBpNkg4Rk9ab2JwYVhvY08zSmNsaUE3M01yZVN1UDJa?=
 =?utf-8?B?dWFRd25ienJSK0wrSll0MXMvekc0dFJJbkJxdDNrRDBzVmxGc25YMml2azhK?=
 =?utf-8?B?MjlQdmFZc1R5QXlIRmM4c3poWUEveURvUnUya2grSGt5WmIvbnBCOGFCSGM1?=
 =?utf-8?B?eXZLaHA5YlJkdDRTS0tMekFzckxUaUhVWk9UdzMySkRDVmxtSktraGNDZHpv?=
 =?utf-8?B?M1VyQlY1UDc0WVVxUGlxbTR5YmcvWWNHRzJ0Z29ZUFZDQUVJeVExNU01dWNy?=
 =?utf-8?B?d0ZBb0JLQVUyek9iT2UyL1Vmd0dNSG96VE5vcFVkVWJTMjFXUWc1dVZwRWR6?=
 =?utf-8?B?cTZrdFZUQXYyRkthMzFqSlpBa2hybksvWVROMGM0dnE3N0greGNMVzVzRjRo?=
 =?utf-8?B?OFh0YWRzT0UrS0p6MFNqTFZsblJLN0Y1NHlYZjVjYVBESWNhS2V1YkJHYUQ4?=
 =?utf-8?B?Znp2bmRYY2tJYkIyYkhORWhFUDdHR3orVG4vaEc3U1YrMzlHM2QxekdnZ3Bs?=
 =?utf-8?B?Rnh6V0dOUnQxaDh4RXhKQ3c3cmllQjMwRVFKU1A3T2hUVVRSTEJKcjNPSy9G?=
 =?utf-8?B?K283UWVXL0Y2TGpQR2RMSmVmSmlmRFNUeDRFV1lINGtQdGEvc1EvNjFWenNS?=
 =?utf-8?B?QmtoNTMxdCszVjcrQVQ2Szd2UlpTeFJZaEMweTUvWmdBU3ZwUElld3RocElE?=
 =?utf-8?B?TnB4Rk1pRWY3aUdFdWtud2RzTytrcTJUMzN1YnpOcDF1Y0NsK2YyWWhEZEY3?=
 =?utf-8?B?TmJvbjh5Q2Y1N0dtZ1U4WEdwTGxlbmllY1VpWjRoNk15Tnh2VlFIRGJjcHMr?=
 =?utf-8?B?K25tUHI1OFZ0VFlNT05PdWQyWkNhRjFja3ZCRnZOSlFDVEYxdWdHYjNJa080?=
 =?utf-8?B?UmVSanhIMmFGUkxHUXcwZnZhSWZ4Yjk2QmdhSU9MUmxuRlk2UHB3VGMwNHpi?=
 =?utf-8?B?TElnaFY4dlE3aTNsS2ZhTDlSUStJZ0FSK1VMR3VHYzY2bEpHNmN5OE8zNVpq?=
 =?utf-8?B?Y1IrQWR5dVN3a09XZ0psdW81RmVIR01RVFFlOEZlSUNuaHRzOHRlaS9ITDFO?=
 =?utf-8?Q?4RD8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHNQbEowZEhYN0c3TWEzeURzajBIWGxkaklSY0dHM3k2akRvbzhlZkluaTBK?=
 =?utf-8?B?S0FBMUtNVzhwOVRERnNLbjRSR2pyeWwzL1pCZlV6c2FiWkVzTGZoNUJFSTdJ?=
 =?utf-8?B?d0ZTSmxlM1FkTjhxWGZnVUFwR1pmanpFSS9WNGN6RzV2MFdEaWtFWXZ0dkNY?=
 =?utf-8?B?ZW5ISGhyYmY5V2pnR2I2akhCYlBMSTloOUY2ZmJRdjVZakNKUk00R0Vacy9W?=
 =?utf-8?B?UTcxb1JZOW84VC85cXFKeG8zY2JnRm50TFJrYUZ4Nno4WGdUM0I1RFRXYkJW?=
 =?utf-8?B?UGFLcGR2ZEpUR1UrUGFZVVk3VXo5eWR0RU0zMVZGcytxUWxhZkFOMHVXdEpT?=
 =?utf-8?B?RElDcisxT3RPcXgzdGN3VFZ3Q2pFQWg0WENMa3pMZXAreFRHYTc3Nm0zb3Y5?=
 =?utf-8?B?NEF2R2NKMjRRYk1xTHRDVkhpN0drNS92VkNtT3lRVXdsaENRZ0xSZXU5Sll0?=
 =?utf-8?B?eHk5dExOOFlMMlgvZmVSTkVQYkl2SmI2dGZHM3BsQnlxcFY2UDNBbXdsd0lQ?=
 =?utf-8?B?TXFnNWk4NzgyM1hkTTdYaXo3U2lHUm1RWWxCVlBCRWpDenNtT1NPQzRjUzZw?=
 =?utf-8?B?cEZwNXFFRGwxYmdBTXpvRDNrZHRnY24zOTdLVVRpOFpJWW9POSt5WHpiaXcv?=
 =?utf-8?B?TW5iallYcHkvRXloRWx4WXdBaytEREo5K3g5K05hbC9ROGJER1Nwb2FLVzhE?=
 =?utf-8?B?Y21QRGJITVZjV1dJNDFxUVJ4c3pqVWNCWVg1eUVBQ3NWVU10WkUzRjRxMm1U?=
 =?utf-8?B?bDhNUU9zUlgwUHYzRk04VDJoSjQxNFFPY1F2TC8xM3kvTGZpZFAwWEc3YU01?=
 =?utf-8?B?RTVzZDhLQUFReHIxVEhGRnZEQ2xYOC8yOHNEcHZYdTNmVUhiNHV3L0RGUE1w?=
 =?utf-8?B?QStFb2ZLUnkyMk8wSlEwWkFvL1FBb2hLYzl6Z1ZHcGlJMlovcnZPWUFoUm14?=
 =?utf-8?B?VHZ6R0h4RXA0RzFZN0dJRjFhNGx6ZjUwM0pyWXllSUVraStmV3FpYktDeUow?=
 =?utf-8?B?S2hRT3FKakpveDdETWVaOTZtNkI1SWp2SVVHUmJGdm5xZDNmRS9ZME9mMWJj?=
 =?utf-8?B?Qnd3aTh6WkwrMDliUDZ6UkdkRXNrTTh3ZTJGUzlBTENoVnRxMlE0eHhsVWRM?=
 =?utf-8?B?VjNMQmh2YkhKaGsrVzQzWmxOWkVaTng5MWFsSnMreG8rbnF3dG1rd1daWW03?=
 =?utf-8?B?bjFYcUp5cWVFSWtaSm9yNElhR0MvbStDa254Y2RycmdvRjRkNzRzQUlhWGxP?=
 =?utf-8?B?SHd6UlNmaEFpQmVGRXY0dFFpY2hBQng4bXBVcmRsRC8rc3VBQXZaYXA2bjJ1?=
 =?utf-8?B?UGp0YnNhaFZKSGZndzBOZ2o5b2NFRmoxS0ZnekFQQkNaQ2haSGdNVno3TmtW?=
 =?utf-8?B?WHgrczhBQjYwVGlzaUUyS1BEaHcyeW0zRmhEOWRnZGRucWVZMzFJWGVCN1Jn?=
 =?utf-8?B?Y2dTaysxWkVOTE90TUI5MlFQNXlGOVJzcjZuUitwMzc3TVNGejB1SGN0Mi9F?=
 =?utf-8?B?QlJkUy9YNWdNY2xJU1BFU2wxTm45VXFxazlPVnl1M0wvZmlEdE9vS1ZoaUND?=
 =?utf-8?B?ZEFIZmwvait5UndLRHg3eTNJc1pkTW0xZ3FxcGFYVjlIQ3VEOUVDM1AyY1Ju?=
 =?utf-8?B?dmN6Rk5tcGh6M0h1N1g5SFowa1VaeExwSnpYQVVUNTVidW01WGtHZHRPWVF0?=
 =?utf-8?B?OTZCSjNlYzVic3JmaEdTb2x5Z0VVekQ4ZFQ4WkI0U2g1OXhqYXBxM3A5OWRr?=
 =?utf-8?B?QlNoeEMyMEVGWmxSa29CSlF2TlNDT3BnclpZekQ5b3FsYjJQRlhLNWZFRDBq?=
 =?utf-8?B?RlVFamMycmFzUE1XUDV5QThBNTFaaE5MK2NKSUdFVHBXb0lhZDkwcEcyZklH?=
 =?utf-8?B?bTJOMklPTnF3TE5hb2tObDEvQXphem1ZUVZkeDV3WXFjUUhwMTBHaHQ5ZGFB?=
 =?utf-8?B?N2NLSVM1TCtKU3pHaFNHUkZPUEh4ck8zK3V3MkZoK2R6OU8zT29LaHpwdElF?=
 =?utf-8?B?RGplYnlSMmJuWXYxeUt6ODlaUkZ0ajYxeCtsSEc5OU1OTU1BTjU0QmlDQkpp?=
 =?utf-8?B?cXFqcmpVMS9EZ1owQ3AzYWNmUW9USDVNKysyb2VKR01pWUt5Q1QvOTlkUFRS?=
 =?utf-8?B?U05HMnAwRUluaUgvaWpLMkZTTDZQTC9XMVpRcDh3Rm1DbGNFOTgxKzYxeVNs?=
 =?utf-8?B?MGNsTVdsYzhhenpOWTFGelcwVFlLd1FHOUVFemQ5TWpJN3BWVklIU1Bxa0dz?=
 =?utf-8?B?S0lYU0lpOXFCTFhGQkFLRm1CT0s2S2VxSFg1TXpidWRQaXp6NmpHZkdxNWxn?=
 =?utf-8?B?NzROb1A4a3J6dGhpdjJnQUVZcnhsZUtBaUNQMG9rckl4N1VqOFpmQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efec6832-70ca-40a2-c724-08de545c2ded
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 17:33:21.8494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vyNxIb5vYl4f9Tr1sN5tP2jlcV710fJTio1MKjkW1t8Ee2eTFDe0O0wg/sfLYaiGytwNhK4YUyRggMebNIJKyQ+E7XeMJg+QuFY64IorjoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8158

On 15/01/2026 4:32 pm, Teddy Astie wrote:
> Le 15/01/2026 à 16:50, Andrew Cooper a écrit :
>> On 15/01/2026 3:17 pm, Julian Vetter wrote:
>>> +{
>>> +    uint64_t misc_enable;
>>> +    uint32_t eax, ebx, ecx, edx;
>>> +
>>> +    if ( !boot_cpu_has(X86_FEATURE_NX) )
>>> +    {
>>> +        /* Intel: try to unhide NX by clearing XD_DISABLE */
>>> +        cpuid(0, &eax, &ebx, &ecx, &edx);
>>> +        if ( ebx == X86_VENDOR_INTEL_EBX &&
>>> +             ecx == X86_VENDOR_INTEL_ECX &&
>>> +             edx == X86_VENDOR_INTEL_EDX )
>>> +        {
>>> +            rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
>>> +            if ( misc_enable & MSR_IA32_MISC_ENABLE_XD_DISABLE )
>>> +            {
>>> +                misc_enable &= ~MSR_IA32_MISC_ENABLE_XD_DISABLE;
>>> +                wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
>>> +
>>> +                /* Re-read CPUID after having cleared XD_DISABLE */
>>> +                boot_cpu_data.x86_capability[FEATURESET_e1d] = cpuid_edx(0x80000001U);
>>> +
>>> +                /* Adjust misc_enable_off for secondary startup and wakeup code */
>>> +                bootsym(trampoline_misc_enable_off) |= MSR_IA32_MISC_ENABLE_XD_DISABLE;
>>> +                printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
>>> +            }
>>> +        }
>>> +        /* AMD: nothing we can do - NX must be enabled in BIOS */
>> The BIOS is only hiding the CPUID bit.  It's not blocking the use of NX.
>>
>> You want to do a wrmsr_safe() trying to set EFER.NXE, and if it
>> succeeds, set the NX bit in MSR_K8_EXT_FEATURE_MASK to "unhide" it in
>> regular CPUID.  This is a little more tricky to arrange because it needs
>> doing on each CPU, not just the BSP.
>>
> I see this MSR in the BKDG (bit 20 is NX). Are these bits stable across 
> the AMD CPU generations ?

Urgh.  Almost, but not quite, and I've apparently lost a patch.

" x86/amd: Fixes for levelling setup"

The K8 RevD and earlier have their masking MSRs at different indices.

Perhaps instead of editing the masking MSRs, just setup_force_cpu_cap(),
which confines the logic to the BSP.

>>> +    }
>>> +
>>> +    /* Enable EFER.NXE only if NX is available */
>>> +    if ( boot_cpu_has(X86_FEATURE_NX) )
>>> +    {
>>> +        if ( !(read_efer() & EFER_NXE) )
>>> +            write_efer(read_efer() | EFER_NXE);
>>> +
>>> +        /* Adjust trampoline_efer for secondary startup and wakeup code */
>>> +        bootsym(trampoline_efer) |= EFER_NXE;
>>> +    }
>>> +
>>> +    if ( IS_ENABLED(CONFIG_REQUIRE_NX) && !boot_cpu_has(X86_FEATURE_NX) )
>>> +        panic("This build of Xen requires NX support\n");
>>> +}
>>> +
>>>   /* How much of the directmap is prebuilt at compile time. */
>>>   #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
>>>   
>>> @@ -1159,6 +1203,8 @@ void asmlinkage __init noreturn __start_xen(void)
>>>       rdmsrl(MSR_EFER, this_cpu(efer));
>>>       asm volatile ( "mov %%cr4,%0" : "=r" (info->cr4) );
>>>   
>>> +    nx_init();
>>> +
>>>       /* Enable NMIs.  Our loader (e.g. Tboot) may have left them disabled. */
>>>       enable_nmis();
>>>   
>> This is too early, as can be seen by the need to make a cpuid() call
>> rather than using boot_cpu_data.
>>
>> The cleanup I wanted to do was to create/rework early_cpu_init() to get
>> things in a better order, so the panic() could go at the end here.  The
>> current split we've got of early/regular CPU init was inherited from
>> Linux and can be collapsed substantially.
>>
>> The intel "unlocking" wants to move back into early_init_intel(), along
>> with intel_unlock_cpuid_leaves().  (This is where it used to live before
>> REQUIRE_NX was added).
>>
>> The AMD side probe wants to live in early_amd_init()  (not that there is
>> one right now), but the re-enabling of the NX bit in CPUID needs to also
>> be in amd_init() so it gets applied to APs too.
>>
>> Does this make sense?
> Sounds good to me, I suppose there is no use of NX before this ?

NX predates 64bit on AMD CPUs.

~Andrew

