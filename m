Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5810C6B093
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 18:45:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165244.1492028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLPlc-0007e9-8H; Tue, 18 Nov 2025 17:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165244.1492028; Tue, 18 Nov 2025 17:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLPlc-0007cE-4D; Tue, 18 Nov 2025 17:45:24 +0000
Received: by outflank-mailman (input) for mailman id 1165244;
 Tue, 18 Nov 2025 17:45:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xTEL=52=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vLPla-0007c4-Mw
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 17:45:22 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59d4dc1d-c4a6-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 18:45:20 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5172.namprd03.prod.outlook.com (2603:10b6:a03:221::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 17:45:15 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 17:45:15 +0000
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
X-Inumbo-ID: 59d4dc1d-c4a6-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbOGZ280UVWWNLboerJBvKB+DtMsXxLdTj1aVp0PVwm4brasCmxPy3QxP4KvolI0i5CeWdqHQ2Fvu+ZjQ1hh8AlvB9PsdLGpG81ffpuYpjZq+ck8qhwYYfvY1KWo8CdbOEHJzF11NDTssEigJU9YJwxqHE3/Xpo2k7Chk6nfoL+Q5A4fBtHmj1xgke2/Q6QV77WQhQ4xao7O/jGINu9OdsUd832JPAeJ8TrFUs9yQJlUYv6uZCPwomOAJ1d+MnFAE4bKatY5br43NhDRTAfZPh7QdT6g2oYawv0sO2OJzHd73l6iSs2gfjLNshyz5QoxteB9t9ZzS5OoNeZ8AVs9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/t0fFz3Dnek+3b+5m+uqxUS8yfWzmjjyWFZjC4Wwa4=;
 b=g6zBJe3gipmA3SL9+tLioDqAa1/lZE5eqZkm9yjh41lwtES+Frjs4EgQAUb9sTtyXSDEwLicYqlVJOUeAVXpaz6OIXYV4eoFhMCtAyCGWo8e+PTSo0rDg9QgMpZVNkcBuZjPkQ7oawBBhYM1Ax6ZGIT4z2Vwy42089bHKxMrW0RgOa/kjqGvF8B7lbmfDCQTB3N3FuOhp2ZKTG3pItOQ5PKPpjq2AUtTdCo22KkI7Gh9Lcyc+a34WF+QeFmwvRF+ojm2SeLOnmivXX+5qO1gcmVFvc892dITwsKKZMcNeYd7u1XWT7AA5kAMr8ZasQJywOoNvjnH31D5VjCihdgmDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/t0fFz3Dnek+3b+5m+uqxUS8yfWzmjjyWFZjC4Wwa4=;
 b=S+sapZOCSQ84C7uRX0A65Viiv3jCWSnMcYI7Z2kYsxLG43uxu2Pv/MrVAV3RlRxgwDm7Iog0gAuHtCPH/DFuDd6ZG5FflJayo0rKwAO5P2sYh5DtLIS4VnbvPV+6tzvIEOTOvEON0c17cxcJvOG6HubiLRQ8C77Ktt3off1PQK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 18 Nov 2025 18:45:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] CHANGELOG.md: Set release date for 4.21
Message-ID: <aRywp7cDzX394Qzv@Mac.lan>
References: <20251118164730.475344-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251118164730.475344-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MA4P292CA0011.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5172:EE_
X-MS-Office365-Filtering-Correlation-Id: 6106fa48-9c3b-4757-29ef-08de26ca3b73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ek5JN3REZm1DaHlmS0NqK2dqaW45M3VNczAyRVJVdzdzVHVHcG5oTlJxSmtI?=
 =?utf-8?B?Zm12VGNYVjdma0hvRDRkd0VEWEVoMGp1TXp0RFRmMVdhU3o2Yk1XVFVxRnNG?=
 =?utf-8?B?VXltMVk2YTg3anFua2x0aFBIQXJMc0FpQWY3cFZJbzRJcHFrekg4Skp3SVov?=
 =?utf-8?B?U2I0dk9uVVpNaVI0ZHQ5Vi9XYXR1YTJpMkxKU21kc3BXQVFVejRrRU9KMkNL?=
 =?utf-8?B?Z2hSVGZHSm5wLzJXNXUxdGR3WldwWSsvUWNvbGFTQ0VNMkYzbjlvTkRXU1lx?=
 =?utf-8?B?Q2J4SzM5dEdLV09zMWtoWUxoUDlPdTNiY3NQNWxnRzlOR3J6REd4Z210c2da?=
 =?utf-8?B?d1ZTWVdGSFArSWw1NEhhZGZseDlENU9qTllqbjhCRS9BSE9YcHZWdVdzNkZ5?=
 =?utf-8?B?Qll6VnFBcG4wb0drVXZxa3RLZkZFU2xUR3IrL2VPVnZISzIvYzJ3ckZQYmN5?=
 =?utf-8?B?VFJIMmZQTlFQUCtRUTk5ZnJGdU1EYWdhTnRKanVxYk1YNTF3RmhKcWZPbjdX?=
 =?utf-8?B?ZkpoQ1BPUm1JSUVraVVlZDdldHE2TFNFTHpaRVVtaW94Y1pvMG1sNGFKamht?=
 =?utf-8?B?TzJSNWNxd3FWZ3FIWmg2QTQrZmFEQ3gzTmlwSGo3N0RhK2hUWEE3OGE4M3Bk?=
 =?utf-8?B?enlLakJ6Zk1Hc20wZ0FUYkhrdFB3My9Qbm1DVHVTcjVCc2NmQ28xcGM1cllv?=
 =?utf-8?B?cHJlbzlwME56OUdFOWdkWGkrQURDdkxWSVliM0dVbDhQWk5zSGJEcXFvcFNV?=
 =?utf-8?B?L25ucHlwUTZoNTB6ZThsREFmZnEvdFJyVlBHTXNmVXlwRjloR1ptREN2V1Q3?=
 =?utf-8?B?ZVhYU2pybDVyVFJ2dzk5V3JhYlJWdEloM3NqSHJsQXRkUGdSeGU2UWxUaEFz?=
 =?utf-8?B?K2NQODRoMHdreXE0ZEJTcFdQUnEzSmEvWUNwU1pPMGtZT2VkL1duOU9URzNu?=
 =?utf-8?B?MWRwMUx6dXppL3pQbmJFaFIvYmJ3dENyVXgveGRPejFIaHZBblFiMFFJZUUr?=
 =?utf-8?B?ZDlxOVVDMnZjZ2RYSnVUYWxlSXg1TXhWcnRlbGZBRzhqWnM5ZVlnTS9jT3FJ?=
 =?utf-8?B?NGFmMjFrRHhxSXZQckJvQ0ZhZlNHUm1iNTUvNFhubjVPVER6bTBlUGtGb3Zv?=
 =?utf-8?B?VnBVR28ydGxwblEvK0tIdVE5STJKOFJ5dXhaR2cwRlZKRHFNRG9HTmRrWW1L?=
 =?utf-8?B?d2FTcEMwbEdlRzJsU3h4OTRuQmllemdZdFA2TExzMjNUK3pSOG1yYU43RWxH?=
 =?utf-8?B?bDJEbW13NWpWUzczcU4zRUZKekdJQ3kyVTF5b0x1WXlnV0ppQWJxUGZSZjhC?=
 =?utf-8?B?b1pwZVJ5VWV5VkQ4VDFlSXZxaldkVWdQandremtoa0ZIcURFVTQ0YnlBUnV1?=
 =?utf-8?B?WDVPZDZTMVA5WkcxeTREK3dhQmYyd3BmemxhMkx1UWwzbDZ6MXBoUmF3Rjdu?=
 =?utf-8?B?bnY4REFYMzh5c051ZG9KbDAwUTJwK3gweTVGbm5mSVdBVlpvTmtQN0M0WG1m?=
 =?utf-8?B?aUY0eTliWExHa0FzYUdQYm9kZzErN3dtOGtoSUdxa3NSemREWS83N1JIQlhT?=
 =?utf-8?B?VEJQUE1EQkJBRUs3Qm40QXFaVjAxOEJKSHJJRFl1N2pqTVdNZFp1N2VNRXRk?=
 =?utf-8?B?Z1R6TEtndVJrdllSTG9EUFJTSU9HbWRuT1RpZlNHckJ2RjZ3UW9QUnJ6djlp?=
 =?utf-8?B?YnVwaVRVR3hCdDdsNm1jTmxiRHlmYURsUjZGckk1MDZzcDNnS09pSERscm9y?=
 =?utf-8?B?Ylc3dFpOOEJ1cXBiTkdTNGYwcWx0WXhEVjdXV0V0eGJRalhKK1ZtWTBqd3ox?=
 =?utf-8?B?c3ZGRUdPL1dad29RWDZnSGs3UnpQeWtvMVVuOWpOY2RQNUl6ZEh2OXdKMlBN?=
 =?utf-8?B?cERuL1dya2FjMCt0MkVsdmJzQWtqTWdkdU1FejJtMkF4dWV4SmVHWmRpNTlj?=
 =?utf-8?Q?iyQEbvvyVwz6W/8WbVXo7HxhUh02JjW2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW41dDJObHZvR2hUUGMzbHRyZFFhK0VMZ3pJek5BbU5rcGlKakVMNVIweG1o?=
 =?utf-8?B?RWo4Ump5K3c3cTlPUjU3Q3hqaWliRjdvVjVHTGdvMWRJbTM1bkdCbFRCclZo?=
 =?utf-8?B?RlZqMlZrQTZVZXhldGY2NWRoUXZZOFZJUithUXdGd05WWEZKU3J4NmZUcnB3?=
 =?utf-8?B?STE3bEtEREEzajRibGIzLzdydU5LN2tZa3FUcHZONmZXaGkvZUpuQmhzbHc4?=
 =?utf-8?B?TmFuZStxS3RZbXc2b1pKc1djYVNXdThEMzJIUW01dTNCcXZQNjl3MmF5ejdB?=
 =?utf-8?B?VDVGa2xLL0FqMEczM3NXWUhTYWdwaW41VEozYkR5SjJLMjVwd3htQTZ5bjRV?=
 =?utf-8?B?bXd2RGJiYkdKVmQySE9tbUthRWhXYTNWSDRva1BxZm80T2pSOTJsM3h1eVZ6?=
 =?utf-8?B?bjQ1VVh2MXRuYnFjRjV6U0tNczFxMWhRUXI1d1p4OVR6NEhEdU1UZXlicENZ?=
 =?utf-8?B?ZGdTTGwxVlZvOHk3QTkyTDlyait3Rlc1M0xUTDhsMzJJODhtSG5DeE5Zc3Jh?=
 =?utf-8?B?VDZ1aUI2QXVKY2NyTlRaZGpNbTJORXVIYnRlNzhZS1dNUG9Ka2tsK2JZUld6?=
 =?utf-8?B?aFlVN3RPRFB2N21xTU1FUkFuc05BU3owU0drcjA4RGx4TGdrQTdQd1hlZG5j?=
 =?utf-8?B?UVNLNnRRRmVJV2UrTUZEMFM1RVJON3NvM0YrQnllK0VhZDIxcmdvd0Q0REhq?=
 =?utf-8?B?VUpUaCtSbmZ4WVp2VXo3MTJDTzBOeS92RDVyN3NGL0hQTjZaVTBsK2d3b29l?=
 =?utf-8?B?TDJLd1FXWE1sOVNGSW52V1ZwbUkrZUxDSFhOV0h1RnVqQ0tWOTk5aTZBUDU0?=
 =?utf-8?B?V2o2R1pnWmJ4ZnVvMW5rTXk0YjBZZ0RVOVQ0NmFRbWhTYkViN3YwTmkrNUVI?=
 =?utf-8?B?ZVpZbEJoVHo5SkdaZ0Irb2NMVHFxU1U2eE05VmIzWG1JdzRHZDBhS0EzanVS?=
 =?utf-8?B?MFd4dTMxRUs3S0VsRjhEMEtEUjZQVDAzRmRNYTdFbG13UzVISmVTQmxNZElF?=
 =?utf-8?B?N21WV3p6dFhQbTg4dVlhN2R5Y0dkSGZOQWtuYlJYbTkwV3Zock00a3dEaFFF?=
 =?utf-8?B?dmNva25YOEE5QUZvdXd4eVFYb1FHV3dqR05OdGsvM2hBZFFRN1U4dmZCM2xS?=
 =?utf-8?B?bjJ0SGs1K0N1ZHBWeHEzRW5sTmozZEppSTVRNzU5R1Q2ZkxNRWkxSllXN1By?=
 =?utf-8?B?QW9IbElGNzFnT0lzejlKalI0RTZtNU5zUWZ6MjFyTmxidXRxTXQwYnc4KzFn?=
 =?utf-8?B?UnlSZEVTdURtaHhvb2xtYXRPZVpQLzFtazBDeHF6VHVTRDlSNWhkMEhtWUFo?=
 =?utf-8?B?MnlXUmhsUEI5MnRLbUovTTMvbmI5ZExCRWtTdXIzRE1ia1hmcnp2ekRZVG11?=
 =?utf-8?B?K09rWUt3aDNvd21ZQVI4SkVLOS9raWIxZTJ2dGxyUlJaMkpQZHNqNEErUkNI?=
 =?utf-8?B?VDRGSUFDTDUzYVN5TTNOVkxwVm8wcVJ3Q2Zabm9DclV1SDYrcEF0a0hiUTg2?=
 =?utf-8?B?WUttU1Vvc0Z1Ri9zbEZ0UkJvdmZXN0s4KzdOU2ZnbUo5NmhRWlp6QXZmdTVr?=
 =?utf-8?B?TUJ1S0FVcUFlSGxWVmYxMHkyU0ttZGd4cUVLQnBOTjJ4TTZ3TDZsTkVTc0ky?=
 =?utf-8?B?NzNRNmdwRlJZdW45RjhrN0djMkdNdVM5djFicThUc1dBbEozWDY2NmtZL21o?=
 =?utf-8?B?V3FoTlJrNGhORDV4bnpiUDV4VHphd3dYZW0yQytHMDhrcGRYTEtIUHNxaG91?=
 =?utf-8?B?ekxuSStRVjlJMXJxK1lWRk03U0VUMUloNlJFcTRyUVFhb0E2eVc5eTcwVGxm?=
 =?utf-8?B?NHFRWCtYTVk4ZVR3a1U4bldETzFxZ2FSSHlPODhuUlpMa3lScHpPNlgxRUlG?=
 =?utf-8?B?SmxETXVzMkpWOEc0OHZWT2REVnF3d2ZUMEJPTnJtcXhHRXhkalpXcENFU0ZJ?=
 =?utf-8?B?aGEzWkt0Mk9NcVFGdFBOdWRjUGRCNE45UlJKT0lMV1dhODdyS0FIYTBhNUtS?=
 =?utf-8?B?aTMrdmlWMERqQk1ZUVhzaWJOM1V4SlkrVHdiUHdrUmdyNXZaQ293OUdLYjRr?=
 =?utf-8?B?dForQ3F2dFpIeDNaQ1JDK3BoWnp4aHlMdm9jcW53Z2p0clpZVFVWM1AxZVBW?=
 =?utf-8?Q?VgUBTk22GJk6TnMSKPvxk5xJv?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6106fa48-9c3b-4757-29ef-08de26ca3b73
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:45:15.7041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1j8E6W4477kgQhW99Sstz5p4ZqcGimEFVDIMcqvoNpFFEJGM3IGnnPnKPzoY/XkWGREV5R7DkHOM34gRAF9HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5172

On Tue, Nov 18, 2025 at 04:47:30PM +0000, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

