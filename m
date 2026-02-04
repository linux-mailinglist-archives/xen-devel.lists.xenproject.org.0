Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKERHmtyg2mFmwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 17:23:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3271EA259
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 17:23:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220992.1529392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnfeN-0006El-7v; Wed, 04 Feb 2026 16:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220992.1529392; Wed, 04 Feb 2026 16:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnfeN-0006Bx-4c; Wed, 04 Feb 2026 16:22:43 +0000
Received: by outflank-mailman (input) for mailman id 1220992;
 Wed, 04 Feb 2026 16:22:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f40U=AI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vnfeL-0006Br-98
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 16:22:41 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9254bf8-01e5-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 17:22:39 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB8316.namprd03.prod.outlook.com (2603:10b6:8:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 16:22:37 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 16:22:37 +0000
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
X-Inumbo-ID: b9254bf8-01e5-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5OL5FtrmSO9WhqXpjsHUYVBVnSKDYQRQ036cZ2pwDepvGnAbBsaUy0gzPj5e7KGlEAd1/D6U/9qZ9TuF61LF8FKZck3UsI0U6NOq96jsnrGYDbMl3gGpkjsSS6ApmXGiOd78GTEaUENmnonMx/vOpWa/ALPBunTvTkrTLzgsHhJa+y/RGiTalSvhjeVta9+iJdjuXq5AoyS93ujjBmXoygk7k8RJkGm7gexJ1unxUhjfw8wY/iHAn15MQIElDkFsZo8zkOeFCyUmW9o4EMWFVmqETQsmBCOvtR3FJeTdeELL36+ZD6fPUAWT4bJzPzEw6K0On1TIC4klyvO0olnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fSC02YMDefO3K14W1SRqWL1Q+a33EDCPQPp4S2Nqck=;
 b=EpFu7KMWN6cgpElH+bblYct4FxAj/lNFs/fXZshSS0cN45KE9qWQnYnDRmlbkxrwp9+769D8SAKUsS50EagmGqGCDUWbBsZVBCm2WTWL/qbFh1EqlsVoXwLfgrvH+C/D6IYw8aDobdW+/YwELnai8SMck0DQWa5ti7ZXEIWjJFmNlHP7VIPDw2jGE/Pm5anxigre0OwxTy2n9My+QLlGGXg3hqjj77fwd59LfqW70C8PNQTpVIYliF92aYigUB8MgWzpXuBXzEzfwpDyqiBPmQ3kNKWqoIyKj9ldY1dEy05z388EM1V7upT8R12Pg3uy1bfPtMpB7qophhpXe1f0ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fSC02YMDefO3K14W1SRqWL1Q+a33EDCPQPp4S2Nqck=;
 b=0PAb0qpitJ1u+wF0PUPfxEHWMl10pcArgWN5REs4FgDcoap2ZxnJBoFrQKOVP3aFFeYa6pbutSG1Q0v50Ft0D0MStloNHHTL4+6b6fRshI8tDEpx0PPgddpgrnSWbBqWaVdDPoAbva7iLFkyWia0ZLVaOWLRe7Ogs+ZnRh0X5iA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Feb 2026 17:22:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] xen: Add macOS hypervisor build support
Message-ID: <aYNySRMnVyNixlzr@Mac.lan>
References: <d923a50ff7870087347ef783516f3c2d2764dc6e.1770210872.git.bertrand.marquis@arm.com>
 <a3637eb3-ff0d-4a69-aa7e-e86be92b062b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a3637eb3-ff0d-4a69-aa7e-e86be92b062b@suse.com>
X-ClientProxiedBy: MR1P264CA0078.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::24) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: b09493e1-8ce0-45a7-2ec5-08de64099c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWFhOUxQQ3JBQW0rU1BkNW5UUitRdzArZXM5MlUyT1h2czg0Q0F4djlnT2dj?=
 =?utf-8?B?V1h4bEFVOG8zYmtLcWRvT0NIRWZNU25WSklCN0RMMkdCTkpaSUZ3bW9RVkFv?=
 =?utf-8?B?dkFWTUp6a3ZrWTlTK3J2SnVVMjRSelFWN01yQ24xdXRtRGFYQ28zaldyeGxw?=
 =?utf-8?B?aHBPNENFT1JoOE5nSlJrZG5wK29VcWVWVnlBK2hLT1ZEbW5GVUhkTGo3Tm1N?=
 =?utf-8?B?QURTSlJiTzEyWGhQSGRFV1pxMDFmams5ckMwNFNpZW12SU91VmRaMGNyVThD?=
 =?utf-8?B?SGpxemZQT3huOGJUcXlEU2RBa1JjeGlibXJ5RmRXeVJHMzhwS2NVOThxelQw?=
 =?utf-8?B?ZDN4R2hueXhRb21VRW42K1diNWJyZlFwR3NHQitLS25mNjRoVXROdXZTOEpG?=
 =?utf-8?B?QUdZd3VMYnF6ZUZSUUYvcHpqU1F5QmFWbC94d1JyNHZGMDR5UExrMWZ6dkVm?=
 =?utf-8?B?TmswYTJ6LzVyMXhVREZrNkpIWDRPeFBWUjAweG1jdkFIY2J4aGFaVExQY1F2?=
 =?utf-8?B?dlIrWEUxa3NUNG9uMW9KT2xNVGplRnNOSXhVWkk3Q0JMOE5uTnJIV1Z2NllE?=
 =?utf-8?B?SWNxbnZEa3IxNDJwQ00wTUhuMHFWMTVNRGFWcGZCZDd1Y3JJUG9qaU8vQ3BS?=
 =?utf-8?B?cjI2eVBLWmJTMmpTcGNCcHYzYXpuZDIyU3k1S0xwNFhJOEtwWjVHaU1wVUNZ?=
 =?utf-8?B?d2p3ZmhYM2paWkJWZmI1L2VjMk5IWk1MUyt6MXI4MXdIdHM5OEpUUGtOVkFM?=
 =?utf-8?B?OHZXd25Ickd3MzUzc0IrMWJjWGlXU2pKalNCK09xUjBLUnRpM1ZwL09YWTlv?=
 =?utf-8?B?TDhoZjBpdHhMMmZJa050a3VjR1VkRG4xak14OVIzNEx1WWZpRXVqdlVoYXhH?=
 =?utf-8?B?eGJ2dTJPbGpLVGk3UlYxUlNEaFdpcklXTzYwR0tVZVpTL2ZZMVgrS3hnMlhN?=
 =?utf-8?B?OFVOcmt0MDF3dFZvQ25xeUxiV3QySHpjSkR2Qi92ekVFNWZEVXpLZ2JMWW4x?=
 =?utf-8?B?c3ZtMnVDYTZTTE1WN0lseHF1SDlnbC8rdWc5UjJhWnl3bzR3TGxJckxRVFlD?=
 =?utf-8?B?cFlwa1JvK1Q1Ky8xclBtenlyaXJ4VDhkNWVTK2JKVnAwZGVEL0N1eGxxcG0y?=
 =?utf-8?B?NkhySW1iM25Yck5Zd3NuZlZSR1dyWFBEcTJnRHRsTWtONFhwQTFDbUN1ZmlK?=
 =?utf-8?B?OExZSXY2T01yQXVzZlU4eURZVGROUk9tcnZuUzRUMDRleUNicTZwbVpJZkpI?=
 =?utf-8?B?c3NNaVEySUhhbVNxVmY0dUM3VURUNmp1OEpTTW9LbklMTEFqaGE4UWYzYzh3?=
 =?utf-8?B?RVdPcW9CdjJjWDdqdWxlbmJSTy80OEJ6RHVNSDUwbDJSYUxaQXJQUkJvVm9p?=
 =?utf-8?B?d2x2enhHNmQwTmRqdFFzTmN0aHJBd0Y4QnhHZVdNRm00VU1sTjk4cHNtRDJi?=
 =?utf-8?B?a2pqYnNsVTEyM2NQczNCOGN5SzVIRkxEbFIxSGNWVWNyUzVWYzhjeEdBWFZm?=
 =?utf-8?B?T0pEa2hPZnNFMm9wK0h0SGpCR2w4KzBMWWF6KzZEWTRWc0NmRy96T3VKa29D?=
 =?utf-8?B?OC9GeEZOa2hCTFVhRmwra1VoT0N6bGo2clBBeUM0Z1ZzbzBkLzZYMGxUQ3FR?=
 =?utf-8?B?azZEWXdIdUlpZ0dwWjV4ZzRpSGVoMExvRWRvSGFPeWU1eDBTa0dEcmNYVkVr?=
 =?utf-8?B?TkpMWmRWcFhqQ0JRMHYzakRXbVVjR3VndjJMSFJJYjhXQm1lbkNBbmdLbFFG?=
 =?utf-8?B?YmdqVnB3dlgrSi96emF5dWNhMDVkWlNBbnF6UjZKTEZ2Y2w5L21XWmRJQUU3?=
 =?utf-8?B?cDlnNXJDQmxCRk0vRGRIZnlRWTJyRU1BU2lZQTA1aVRtSWhtUmZ1cmpoWldj?=
 =?utf-8?B?RHdkUjZSM3cyNGUxSWgrQXM0NFFnZ0RjQkJ6SFcybHAzQ1dqVm5reG5nMWNs?=
 =?utf-8?B?aEJVRTNIbDZvZDVFTkN1Vlpwd1pxM2Fwb2hnYldtVktuQnNONE9hNGd2L2hG?=
 =?utf-8?B?Q2lJbDRmRUZqSVB2Qk9RRTkzQ2ZCb05ER3MvQ2huZEdsNGxRMHR2NkZLYmNO?=
 =?utf-8?B?clBud21KVHg2VnBucldnMUc4YXd4RjU3SEQ0cGJiQ1pmSjlwTElXZEYyYm14?=
 =?utf-8?Q?i8X8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTJxbUtvVUZSQUU3K0s0dU51QlIrRURxZlZsYlkwRVVMaDh6ejJqQndJenFW?=
 =?utf-8?B?blkvaC9aK2JwRW56RGZRcjBWa21VeEZxRHRiN1VpZTh3MHhyTGh3elhPc0JK?=
 =?utf-8?B?UUp5d0hibi92cWduYW84anJKcnlCd3M2N1Q0cnFVdStOdXNOS3UyVS9BWmQ5?=
 =?utf-8?B?V1VZZmx3ZHdOVHVKSG1sK1c4Si9ONmxvRTVBQWs4clUvbm1WVWtJRk8yc2ho?=
 =?utf-8?B?OWh4TU0vUVEyVk54bkhzYTNMd2MzL0gvYW1rWlVkQkZMK0taay9CcWo2WmVi?=
 =?utf-8?B?RytCTUJDSkpNYjVxdmVWTUR0VkQxZkgyU2pRc0phUkNOdFFzNEx1SERINllp?=
 =?utf-8?B?N0YycDU0RXIweGZqV3hrbE5LaDMybGdzN3puc2Z2dmgxZHlBSTdETER0UWRo?=
 =?utf-8?B?dVh5NzNEenFobmh1NUR6cjArQWNTcklMMjBPSm5ROEQwRmZ5Tm0xRStzTXdj?=
 =?utf-8?B?cC9NMm9vVlpNbDQyN3dGSDF1alM4Uy9tR2c5M2dLOWZDck9KWnpteEpDakZV?=
 =?utf-8?B?ZkV6YzhKek14VUN5enU3OXg0ODJiWThZOVdXOC9sS3JLSFpQQ2N0VElabzhQ?=
 =?utf-8?B?S2o0azk3SCtEZmhpRkxyaXF4bUQ4c0x3UUZNNWc2L2x2eGpMN0Z1cS9YTWtE?=
 =?utf-8?B?NW4vKzk0b3lwWnJDd295c3ZxNkpxRFpiWDhNMXZWNmlnc3FLaE9jZi9xc2hv?=
 =?utf-8?B?VWdKRVBDNHFXSjF4Vy9McGF6elp6ZFR5eVBxVUxwcmRMeFJXUG9xbkJBeFNm?=
 =?utf-8?B?UCtrb0VPWmdrYldqM1krcXNzcnoxam9aenJraVZndHduYml4RzdpRldFbTA0?=
 =?utf-8?B?TWxGUTFSakY4UFZ2ZG8ySldtNDN1R296R2dqV1VFWXoxK24yTnI1VjlkOHRS?=
 =?utf-8?B?d3hYZTBrVGRZRUhnNzBoeE1NSzl4Zk43cW5mMG9xcHdVRmhFOVg5VzFVcDRX?=
 =?utf-8?B?UHpoOGVxdGlHSDF1YzFQNnRQdXowZG5GWkk1TnJyUE1wY21UbTdEOXJ0dFRI?=
 =?utf-8?B?dGJEeEUxZUJRaWlYZi9SV0xjMlJteU5Zbzh1anZRYWtWSHFBaWpocnIzUEVG?=
 =?utf-8?B?bXdyQkZqNGJQbHJ0QXVTT0ZvMjNlNUYwWkpvQ2IyWTIybFRGdFJTbzhHcWJW?=
 =?utf-8?B?RUpmRk1ERGtqL1JCNk5Nd1Nxa0MxWU9iL25BQXNoM25yMXZLNld4ZlVKaEE1?=
 =?utf-8?B?OXdFSlg5d2cxL1E1VkpGK1NtWjgyYjVDam1LNXlTa0lCdy8zRXpvMkpXVTdB?=
 =?utf-8?B?M2lWNCtna2Fncng0SnpkdWlyZEZySjJiU1cxQ2FzTnRhSXNQUVhHTmtTRE12?=
 =?utf-8?B?WDB3Ti82bzRTNTNXR1FCdFhKNEN6RWVPc3d3ZE1sZ056RGVDWkt1OGJTMWJm?=
 =?utf-8?B?Nk1XbTBiTFpoa1MyYlJJc1VXMHRjcWtmdUhhOXJGTWxLb1JPT2l5LzZ4cW5z?=
 =?utf-8?B?bWFJU1ZxY3Y1T0FVZDNncmNpVnV5VkJkRC9qN0lkSGZ6RVhBS0NKU0E0UGVz?=
 =?utf-8?B?TVFBZVZTaXBwamZKWC91UlBNeWhVS2Y2QzluejlFYitYVmc3K2p4WHNhVzBQ?=
 =?utf-8?B?ZmRyS3BlOWlya2VHZllIQUwrcUlQTkRPeHhzUytaRjI5ZU1zZ3hnb0V3R1R4?=
 =?utf-8?B?MXcva1M5bVc2WHRsa2p6NlhubXlvVG9GZVRNQ3V5MmlEUmNCSG82VEE5QUF3?=
 =?utf-8?B?R0tXbTRyaFcwUjFKeHdNc2NyZTcrMjlMVEdPVllxZnJIVlMwS1JjU3VFT0tX?=
 =?utf-8?B?eTNBQ1hoaHU3Qi9LeG1CL1JkRExiVGlrVFJuMFFqOFFKVmVJb1p2VmJtOTdx?=
 =?utf-8?B?YW5oTTM2ajFIQWgrTUhhaE1PK2d1TnhTNVJEMTRTOG9RSyt2QlJmZWptKzMv?=
 =?utf-8?B?Tm1lL1lvN3BFa3FOUDg0VWZ1RnVmS3gxQTVFODIvVW51ejNOT1BUZytjajU3?=
 =?utf-8?B?QzdGZzZYRm52N01zTnNZemY4MkZsbjI2ZWhucVUxb1ZOSjQxc1pWNDQzZTlM?=
 =?utf-8?B?emFFdVNsb2xydDJpYjVMRVF4anprR3Ivc05BcEZBanA0TmREWEg0TTg4enZx?=
 =?utf-8?B?ZUwyK2NQalVvU3daT1dQUndjL1NTbkhxOEUvYlZqTGxPNDgraXNXSTVPWVVj?=
 =?utf-8?B?WW5yaGRQZnk5ZE1XR1pWSk04SXZhcnNQS1BSenI4OTRZa3cvUWFqdmRsN1ht?=
 =?utf-8?B?cm5uQjY5OFg1dTJxeDJreCs3bFJRSFdYWkFHTG5Tbm4rNXh2RHVRQzZ2Ris4?=
 =?utf-8?B?d0UvbWY1SmpJb2dmdzU0TmdSWDZsYlNoZ0xvWStBeTRsbkIyVzYzVnFRMXpy?=
 =?utf-8?B?UlMrQVNKT25wUzh0UStiU0JERVVpT21ZcWtCa3kxTTFaNzBUajFkZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b09493e1-8ce0-45a7-2ec5-08de64099c32
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:22:37.3344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: En6A1E+rxUBx5OfAHHZoTi7dmRoe72+5P5iLfji/7XpUeckP350qtP08yptqLN+wcayE6qId5tDlcTkR2mhp6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8316
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,freebsd.mk:url,stdgnu.mk:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:bertrand.marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D3271EA259
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 04:31:12PM +0100, Jan Beulich wrote:
> On 04.02.2026 14:16, Bertrand Marquis wrote:
> > Xen does not currently document how to build the hypervisor on macOS, and
> > there is no Darwin configuration for a Homebrew-based toolchain. In
> > addition, the Makefile silent-mode detection can be tripped by -I paths
> > that contain an "s", which hides build commands unexpectedly.
> 
> This wants submitting as a standalone fix, so it can be backported. But see
> also below. I don't, however, understand how -I could be useful here - our
> build system is self-contained, so any include directives used should be
> satisfiable without any -I.
> 
> > --- /dev/null
> > +++ b/config/Darwin.mk
> > @@ -0,0 +1,4 @@
> > +include $(XEN_ROOT)/config/StdGNU.mk
> 
> Darwin isn't really a GNU environment, is it? The definitions in that file
> may be suitable, but perhaps a brief comment is warranted?

It's similar to FreeBSD in that regard, which is also not a GNU
environment as the compiler and toolchain is LLVM.  However the LLVM
toolchain attempt to be command line and output compatible with the
GNU one AFAIK.

FreeBSD.mk also includes StdGNU.mk.  Maybe we want to rename StdGNU.mk
to generic.mk or common.mk?

Thanks, Roger.

