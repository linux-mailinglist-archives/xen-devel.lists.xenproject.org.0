Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHLmLEMecmmPdQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 13:55:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C1666ECB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 13:55:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210958.1522531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viuDS-00046H-QP; Thu, 22 Jan 2026 12:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210958.1522531; Thu, 22 Jan 2026 12:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viuDS-000445-N4; Thu, 22 Jan 2026 12:55:14 +0000
Received: by outflank-mailman (input) for mailman id 1210958;
 Thu, 22 Jan 2026 12:55:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viuDR-00043z-7S
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 12:55:13 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9546d650-f791-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 13:55:11 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB8296.namprd03.prod.outlook.com (2603:10b6:8:292::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 12:55:07 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 12:55:07 +0000
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
X-Inumbo-ID: 9546d650-f791-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jv/0uYgoeqXAmhEO+tTgRbDH6GxrZN2dQMPGkTxxvtXrhn/0JKQlqovWWYZZTKelR4VxDdbT9YhDE7Xd8IskmB5Z0K/Rzye1kthr46Z89wGLrcT6TWfVT8LsKytrab+iY/oen+/vqJAWeXDgrJJdedeteTSvfnxRrjXAoB7RJKHdshl3nZgYSAZhCqo1gkk3FYVPAM/CN9T9IztIioD26//HaJv8FC0+V9o2vxvnaqw8UhMoDiLXUWkJyIyNCPJ1I6ZR4F0lTGbVpi+zcGyChI8QLAO9scT5G8sAZEZmXuNlCZ1Y+eosNSizWdB/0uy5w3XfphpYhp6fE/VbNWPjcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGtUQ2CHyM8PU1owUC/wH4D1Y2o/0voT2bp1DKQNoVI=;
 b=oJqb2dIzseXUHHfzCdTgZnQcXAzlvP1LWhAPtlyIqSiPLGomT5DIEPiiTtuTfXZzMw/PtJb6afSJr4tgxDJijxi2b6WK4GselSfF4V6Cv6z2W/v54/blgoRpCVQsfUthNOCcF0OshFl4iJgZOjLkii0ZeyOMmRDSKcADMW6hnTiCtJVndADkmjP6Nw+S8UIufuNREBiGwOHIT0Zmu/zFoJdsog6lpQQNWw7XMVQ+uGJpDteyw+cFO3H0uMlXJ7J4bZJAfTBrN69VobwlX1RNgyBi0tMjaBVYEFMbtAFUlEG2KjiDQO+sKmZLpE2KBQ2sxrkxB0jyKm1EqFicrkRIrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGtUQ2CHyM8PU1owUC/wH4D1Y2o/0voT2bp1DKQNoVI=;
 b=DtSjIlJt3n7y/Aym/rvsAY1oqxvFPxcq/uXOIlosffa9CiFlE/98WnVdECWdDeRDKdMIWhfXrKWRwst1lVq4RVO7DsR7KPUlGOe0jClvlv7ms9goGc1uaYLVCYdfx2vbFZsF9dLnaxJqrXkCJEjuFPYRHrnedgEejctS0qN2B2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 13:55:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/3] xen/mm: limit non-scrubbed allocations to a
 specific order
Message-ID: <aXIeKAzodr75xMsL@Mac.lan>
References: <20260115111804.40199-1-roger.pau@citrix.com>
 <20260115111804.40199-4-roger.pau@citrix.com>
 <858d73b3-2feb-419f-bf3b-9a264e9f9af8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <858d73b3-2feb-419f-bf3b-9a264e9f9af8@suse.com>
X-ClientProxiedBy: MA3P292CA0015.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6c6471-efbb-4c19-d170-08de59b5781e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ykczc2NCL2NocFJmeWZraURiblU5TzBPQ2IzYnluN1NQdTVtcXRtZm1HM2U0?=
 =?utf-8?B?aUdVNm0xTGFQT0VmejRKdjRjNmVYQll0NUlDcEhWQi95WE5NQ1l1MGR3d1Nk?=
 =?utf-8?B?NC84b2dJbG5mTHZYeEFDUFNZOGtWVTVIUG11a21pZUtQZFEwSHZxNFdjM0pM?=
 =?utf-8?B?dXgrUFU5eXRyZVBsZUNJUzVQVkQ3czFGbVN3eTR4YUJEdXQ1TU83SmFHZXpS?=
 =?utf-8?B?dVNValZnYTI2d0RYL0s4dWx4dUszVVlxUjJhanVReFdOeHh5M2d2Y3BLWjBF?=
 =?utf-8?B?SjBZOWdnUkxaa21mNkl2QWxFOEtqbXpkL1lUSlJBTXBObmJhemthSysvWnpF?=
 =?utf-8?B?a0IrZW11NWFMRmZ3bUU0R1MxWGR2T2FwaGN5bmttMVpmTkl6YlR6dzNXVHpk?=
 =?utf-8?B?Z2ZJZmhNUlljbjNETDcyNVIwMjFYRjFjTE51NXRqTzFOL29hbFpDaHNXbWtY?=
 =?utf-8?B?T0Qwa1oxYWd6Z1ZCMmplaGRXRllFcDB3dzdzRk5oVldocVUrUnJxVmJNbEFH?=
 =?utf-8?B?UlFsWVVvYk1hdnBEZ3VqNDVuYzY2c01oWXV2SUlER3lTK2J6Q3pBRlhFLzdZ?=
 =?utf-8?B?SzFDOU9SekJTdUI1NWtnUXR2cDBZcHdoQlpuUG5oTDd4UGdlNTh6blBPSE5L?=
 =?utf-8?B?enZJS0d5T2RRQW5IQUl3TFhJS0NCRFFsTUJCazhUOE1yQWN6OXJPczE5Y2NE?=
 =?utf-8?B?RXZ0ZmlUVysvM0pTSUVWZ09qN3NXY0IycGdRbE9HUEVvOVhIeHUzUUEwdTBQ?=
 =?utf-8?B?czFITGFoQlNKWmR0U0htd0U4SHNjcXdMZ094aCs1Y29WYitFK1hXVjJsSzVO?=
 =?utf-8?B?TzR3OFNlZm5BUDhDZmsxTWJtOVRHZFRyRDhCRHlFRTFTaEJPeE5SVXZTQzh0?=
 =?utf-8?B?ZzExbERMWlp0VkhhNHRpRHRLM1hjU0NXdTBRN3BTajhySS9aL1lCUmJuaFpM?=
 =?utf-8?B?bDZkVmpveEtibURjOTlFcXNIdWVqSzhQeGlTYjhMSkhsNm4rNEpqVjZYQmVy?=
 =?utf-8?B?Wkx3RXRNQjEyc3V2RUpTYzJPdGdGY0JaeVMrbGlRcHlYNUVLZGh0RHBST2t4?=
 =?utf-8?B?dGZ0VGNSNkYxTFFDeFgzUFZZaUNZdUNsSmpSd1VKRUpzN0pGQjRYV1d0V2ly?=
 =?utf-8?B?UlhzT3FlcTQ5Ykc4dHpGNE9OU283K0RYOS93d2NXb1RRT21GNWJhczRHbDcx?=
 =?utf-8?B?NDV5Q2U2Q0hQMXJVSHhWUWxKNUFNbWppWDFMMnVSRVlLTkZXQm9sR3V6OVhu?=
 =?utf-8?B?NzhRWnpJU0lGLzk0RXIzK3Axb2d2ZGdUdE1VUHo4V2FKeWkzN0lnWUREaWg4?=
 =?utf-8?B?NDhZM1lRdzFVTUd3alZHTzcza2VrSWgxVnN1N3VJT1B3ekxpL0pReE1OU2w1?=
 =?utf-8?B?VG1UQWFJTm53T2lpcDAvYWZ3WVBxVVl1dWpYZDI5Z0tvZzJzU0o1SW5FUkUy?=
 =?utf-8?B?QXYyRklrWUZYM3hYdiszd0NQOURwTTlncjRVbC94dS9xLzYyc01uUTZBRjRI?=
 =?utf-8?B?U1FWSXJ4WkZTZG44WVhhQzBqTHRuWXdWMkkyT3lISndhL0xEMllxWDJOcTFt?=
 =?utf-8?B?NGxFd2gxL0ptdEcrVkhWMEpiMUh0bHdGOXlWV0tsUTJjeFo5bHU5Ty9iUGtK?=
 =?utf-8?B?cHBNU2pNMGxMbVg4MWVLZWthSGEyOVZYc2ZzSVRwZ0hGUFJVYUZyMHNkSzVt?=
 =?utf-8?B?bVM0dUhIRGgvdGJnODkrRWF3LzJkWThoV3BUdlVpVExvNEJaNEJrZytyQllu?=
 =?utf-8?B?THpXN0JjejUycUpXTnNBeWlXYVhVMnZHL3Nyb1YxaklhaE9NYU9FcFdQS2Fx?=
 =?utf-8?B?ZDlRQSs1Z3Nvdkt0Y0VFNVROZzJYYWQySGxNTlpwS2ZCM3o0U3J2UW9Md2tl?=
 =?utf-8?B?VXJpRUxrSHArb0NyLzRLYnZ2QTJMMk1ZMXZ0V1NGNWxoWTdmM3EyRXlXNmY0?=
 =?utf-8?B?UW5heVN4aUFTL2ZweWJ1SE9yWmgzUlBsZWQ0aVVqUFZ4bmlIOXFIOTRNNkVq?=
 =?utf-8?B?WWhTR0czSHEyd0tVOHhMQU1EN2NZL1hVRzVyZmgwNjNrdUtGQmVxekhxdWpu?=
 =?utf-8?B?dEZGMjZxVWlkeWVJb2hJM05JaWhYd3liNU42RDhDL3J5TjU4b1RhVjE3ZHU4?=
 =?utf-8?Q?aNcY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGZacDlDeUdnR3lUNmxTTTdvek83VzRYTEFMK2p4MmdPRndVdmpBNEl2U2k5?=
 =?utf-8?B?bzFQejdYbVpmL0o3N3RrbjNPNHVyWGFPVkJkdUlFd1FXdFl4aXk3TzJLNGw1?=
 =?utf-8?B?aGZaUUpzQVVPSE85SGhQSWdjQVY4MmxiZnpBZTZpN0tteWRIblhnczc5QUpQ?=
 =?utf-8?B?ZEo3TFNyREVWK2Q2VlcwN0lxSnhLY1k1d2FLVUJLVVJsc24xV05XNUNsc00r?=
 =?utf-8?B?QzcxLzRRenFEeFQ0OFFQRHNneHAyQWFXbXlFcFdtdzg0WmlRUHowTHFrZkNO?=
 =?utf-8?B?NGFYeUQ2MWtPaTZWSVI1YmR1alY4VW1HWkpkakxPTjVTOE42MW1veW1aMDhB?=
 =?utf-8?B?a3VyemYrVzVnWE5OQXRWTlJTLy9iM0VzeTMrZ1hhM0ZBcE9Vb2U3RlNubS8x?=
 =?utf-8?B?M2ZzQWgvMVhYR2gzNGdFN2dVM0xmbTNOTE9oYlp3a1JmaXJ0a0ppQ0k2T25R?=
 =?utf-8?B?VktDL0hLNFpFR3NLOFhkSFhoMVVNYlFjMDJZNVpwdzBpYzJ3MGhYbk54WXc3?=
 =?utf-8?B?bUhzb0dLWWhpcG10TDM3cVR0OWtxc2FybWpjRmxkY2tyS0t4OU0xWXdEOVZ3?=
 =?utf-8?B?ZExhVEVnQS9LeHZRMnhDVTVWVCs1ZWd3QStFdURQTVNsUHpKcVRKRlVDTXNY?=
 =?utf-8?B?ZkMwalIxVXRJUGRKcjRpOXpiTjd4cTBDWkp4UDh2ZkxEMzhtc203VDZ1aGli?=
 =?utf-8?B?ekovWTVXQkdmVXF4bkJEcnQyYUZBM1RvZHQ4YXZkT2dsQ25DYVFSOG5mZGZT?=
 =?utf-8?B?c2NlcXczZWRvRlFTKzlqRHA4ZmY2MFV4c1NtSzljdmxXTXVLK0pJYld6Wlly?=
 =?utf-8?B?SjVjU0xSNVV6SHBoeUNFWSt6VW5udVdOYzFHb0xyb1VqamxFSGhPcEsxOXJi?=
 =?utf-8?B?aktSU1owbjJKQ1BOU2syR1EweUZyalZGK2NRaFpidnlvb3d5UXN3UHA2d2dy?=
 =?utf-8?B?cGNtTCtYNGNBUXhRMmFtMVRlZUVDTDcxc3U1d3h4M3NzM3piMERSY1JhWS8w?=
 =?utf-8?B?UFRGbEVKRE5iYXJqR2xiWVpqc29nQWxBNVJOekJTdHpaRG55bE9YLzMwSUE2?=
 =?utf-8?B?Q1lmdnhESm9hdEhnc3RZdll2WmF3eUM1bkJRTGUyWDhtTzFMWWJibjdLQXRZ?=
 =?utf-8?B?ODEvT2EwYzRPaUNsSDJtUGl0eEt1K1pOWHUxN0NBRlcxRVo0R3ozK2hsN0tY?=
 =?utf-8?B?QXNlUVN4T0p3TVpnSWZ0Ry9tc1NMOFlHekVoaWVrWHVlbTRKdlljTW5wSUJa?=
 =?utf-8?B?OG9oWm9uK1IrYlpUV0tBU3hScVdGaHFSWU9mTGtVd1RFTWozd2UzSHJmZStq?=
 =?utf-8?B?TDNvamxrZW5LaFYyZ2lyVTVCQktiS25WYTlORXFJa3NkZ21EQTltVXIwWWxW?=
 =?utf-8?B?V0U3UTU4TFNZUmp1VWoxeEN6REg1NkxPQTFVTCtIWnd1YlhQQnN2OFVyS1p2?=
 =?utf-8?B?TDkxTFo4NkxnaElKTUtTVnVHaEhmZEJqbHNjQXBMUXVodi9zWFVqaXpvUkZB?=
 =?utf-8?B?NFBKM3piTGJZUmpTK1VTVzFOUCtibmJvdnErb1ZNckNXQkR5bE1QTDNjaDJ1?=
 =?utf-8?B?UG5RdHFnNGFnV05EL2lBaTBuSmZPaEJNUmlsdzZXRlBnNWNoSGp0cUdtT1E3?=
 =?utf-8?B?dFNjakFUU3hWWWNqSXd3Tk1uZWVQYzNsUmVXTXFBOXR4R3k0T3Zsb290RFVz?=
 =?utf-8?B?Z1prRG0xZm52OGR3WHl3b1FEblJ5djVqNldCK0R6dDVnZzRxOHFacTFUQUFk?=
 =?utf-8?B?dzJFUVBlbjI2bHc0SU04SkFkUzdQa2ZRaE1nRWN4US9uSnNEcDRFa1pwbEhP?=
 =?utf-8?B?Uk1rSWxzc1pJMkN6c1Z5VHlid1dxYTBjRE52N0dlbG5EaGV3NnNsMytSUU1D?=
 =?utf-8?B?YVVSV3hoeXg5RE5oM2JmcXpheWhYNWIvWmlaVHVIdDJsSVVuL3RacVNFakRC?=
 =?utf-8?B?TzhtQUJJM2J6dWw3RDQxbXQ5Uzk5d1d6TDZlWVZNK0pUWmdmN01TN21Ma0dv?=
 =?utf-8?B?djNzaFppU1FPY0Vpbk5TdXE0UlNqVXZrQlpOZnM1M0FNYTgyYnNENDVjaTA3?=
 =?utf-8?B?UnB3ZVlGV1RscHRiTkR3ZDZQWWQ3WUpWMFlERHRXMy9OUm5Sd2llTDBldnlK?=
 =?utf-8?B?RzdnRWRqVDgvRUh2RFIyWTIxSUVxaEJkZkZkSGFRUGpqbUU2UnQ0ZVNTMTlJ?=
 =?utf-8?B?ZmllMWZNbHRVeHYyMWd4K01aUk5tYUVORkR3U3k3SXdiaFNGaG9QdE1sdWtT?=
 =?utf-8?B?VitqdFBPRmdKeU04OFhTSWZDbmc5UUIwSWlIVk9Xc1VGU0pzWVVwUXpLUmF6?=
 =?utf-8?B?NzdQVTdscTdLaEVxRkpvWGU0Q0RQSGM3em42SEVnd1hVMnp2TEpwdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6c6471-efbb-4c19-d170-08de59b5781e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:55:07.4522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRogNPMglCuU2i5j906fawo6DlbZBcYYzKvcV2cW3WES9rD/v0YJ452rFTALCZ3RftIX/1bMfedJjIEMKGZIoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8296
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 27C1666ECB
X-Rspamd-Action: no action

On Mon, Jan 19, 2026 at 05:13:25PM +0100, Jan Beulich wrote:
> On 15.01.2026 12:18, Roger Pau Monne wrote:
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -1822,6 +1822,15 @@ Specify the deepest C-state CPUs are permitted to be placed in, and
> >  optionally the maximum sub C-state to be used used.  The latter only applies
> >  to the highest permitted C-state.
> >  
> > +### max-order-dirty
> > +> `= <integer>`
> > +
> > +Specify the maximum allocation order allowed when scrubbing allocated pages
> > +in-place.  The allocation is non-preemptive, and hence the value must be keep
> > +low enough to avoid hogging the CPU for too long.
> > +
> > +Defaults to `CONFIG_DIRTY_MAX_ORDER` or if unset to `CONFIG_DOMU_MAX_ORDER`.
> 
> This may end up misleading, as - despite their names - these aren't really
> Kconfig settings that people could easily control in their builds.

But those have different default values depending on the architecture,
hence I didn't know what else to reference to as the default.  I'm
open to suggestions, but I think we need to reference some default
value so the user knows where to look for.

> >  ### max_gsi_irqs (x86)
> >  > `= <integer>`
> 
> I also wonder whether your addition wouldn't more naturally go a litter
> further down, by assuming / implying that the sorting used largely ignores
> separator characters (underscore vs dash here).

My bad, I think I've originally named it max-dirty-order and forgot to
move it down when renaming to max-order-dirty.

Thanks, Roger.

