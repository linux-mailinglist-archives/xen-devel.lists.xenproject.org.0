Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E06D09ABD
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 13:31:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198689.1515537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veBeH-0007Kp-0a; Fri, 09 Jan 2026 12:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198689.1515537; Fri, 09 Jan 2026 12:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veBeG-0007IC-TT; Fri, 09 Jan 2026 12:31:24 +0000
Received: by outflank-mailman (input) for mailman id 1198689;
 Fri, 09 Jan 2026 12:31:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ele=7O=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1veBeF-0007I6-TF
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 12:31:23 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a8257dd-ed57-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 13:31:22 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH2PR03MB5223.namprd03.prod.outlook.com (2603:10b6:610:9c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 12:31:17 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 12:31:17 +0000
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
X-Inumbo-ID: 1a8257dd-ed57-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jmuz4G+qcEy/thCqChmPr+6SCb9AnzYTbXz5cPxU+tDTlTkvf1NKw9Vz0OQwb5NfzuCeS+cD+e9LEv6hmlN++9rMMdwGInD43ESRCWgCRZyCsaP3WUKw5F/MS5/NdtLfewC6VUrx/m8IuiTvHBL7iixc5AnyU7xAOXjgr7ZoRO7HBfD/E+K6o5q2A1D3z/inCBkKftSa1K8CJYBFlPjU7nMeZFWSlRl0Z+X28TwvbhIZte3bYII14eMzi0tPy6NSBffqESuIGjT/ClvDo7fkJltFXtn3MqHm+R/cmW2+pECTDDexeMBqdkcWZhHpD0aPSSQgCdcCjSt0iknyiF5s3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4Cf8CU1ruHvAsJmqchLSN1yCpGtBp9l387ayotkjqc=;
 b=UldFIDfC2HDJQFFmu0wXb9pXMQJXuyXLHsZ7fwe4R+0pBtdzTD/K+FTlL/yp4njF5poUH80kthvOAQS2FywXmvrIhOrWivH1UY6qVkOgM8DKiCa1F5/oiAowmoCb0CNDf29vwhzp1jABe0Raz4KT7p/32tNkL9r9lCw691V9kauDby36bbpovTIla9HGOouD65xuC0TP87YTMZbb9hoyuEWuxsClUBwEhpnEpXUCY/crTH43RWTURFcKJwl68ynZYlVCbvAkwRz3GCv7wd/iK5xInVRpURRpUWDhFynIET7qLuE8p1CwF0YdcXTA5Hqk+QAkkdlmWhZyGigezVFpKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4Cf8CU1ruHvAsJmqchLSN1yCpGtBp9l387ayotkjqc=;
 b=a0CXuauidSqpnQv8xAePMO4aB1eHb6bL8nfn1OBNJZ1KBYfTqpa3DXs7eXjP6w/3G/FftsKUavgcApA/5kRmeoRxqDIerirFoxF1gAYL2w2l21XzG8OMrOOuW5uYToPtnqoL56SC8OhfqnjEvSoe86XckDpXhrKlG/o0j2AcBiY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 9 Jan 2026 13:31:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/2] xen/mm: limit in-place scrubbing
Message-ID: <aWD1EhFl0nGsBp2G@Mac.lan>
References: <20260108175536.82153-1-roger.pau@citrix.com>
 <6b4c352b-f4fd-4b81-84ac-41b7d3e04f92@suse.com>
 <b6befa76-c80c-43d1-bda3-e60e1217fa80@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b6befa76-c80c-43d1-bda3-e60e1217fa80@citrix.com>
X-ClientProxiedBy: MA2P292CA0030.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::7)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH2PR03MB5223:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3c39a1-018b-49d2-dc3c-08de4f7afc8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2ltNTd4K3pmVmFpa0ZxdmRBeHZZVUI4U084YlJqRzZmczN4dWY1akdVeU5Y?=
 =?utf-8?B?NXF0QmV5UEZTa0s3WFpOMkYrN0hiUHBhTCtKTVlpcXUySElOVkZVaE41eGFI?=
 =?utf-8?B?VjhBVXRySGxUdS9XWitJSkNqZmcySDRUYjBqazN2Ym9PbDl2U1hrNzE3Wk1u?=
 =?utf-8?B?a1BVaW1DaEt0UkJnY3RabGxPelhOWGM4K2xubnpmZmVCM3JpeEVaYjNNUDhS?=
 =?utf-8?B?eGdxYzRtdzA0UnZqZmoxdjU0OFlYN3NURnp4T1JhRFk2Y1RhdlM5UTVtNnpv?=
 =?utf-8?B?Y2N6SWcwUnVjcm5jd21lVFBscDlzWG5wZTZsenFEOHRickRVMnc1andWQ09y?=
 =?utf-8?B?M3E0NDh3WXI0aG9QMm12aEZPSVViRWhkVnhmWG96ZWxhdmRLZThST29VU3N4?=
 =?utf-8?B?cHN0NUcreTltblVCTkplcitSK3Z6bGlScjJRREF0WjByU0EyQ1pZWFp2YjZx?=
 =?utf-8?B?a0NRUnpFRmFxdlZVQVlKbThaRmMrUjY2ZWtuaDBRLzBtWTYvTHl1anRYbndq?=
 =?utf-8?B?b3Q5QkxIaVFuK25MVmRCMUNpa0FTV2F3QXNQcjgydnZKc0tyY0pLaEJQYTQr?=
 =?utf-8?B?Mm5abVRLeVBXRDcrbHdtWGp2WjBuOTFTU2lVM29XeDN5dll6ZDFma0VLbmNw?=
 =?utf-8?B?WVRXeWIxODlVUHVrbUtSUVoveGRBYmc5RzhzNjVObnNaVitHOTNNZnpwaG5k?=
 =?utf-8?B?ek0rcTlaZGh4S3hNaXJseHoralJVZzJRcVRMQW9nbFJZREMxYnROYkZ6eDdU?=
 =?utf-8?B?NThHbHUxdGg4TVZ6akt5ZVp2eTNyQXB6MElsOTFWL0dDYVdsc2RHUmMvbUJM?=
 =?utf-8?B?d0ZKd2VVRDdSRXZzZEYwZ1NldE1yVlE4d1F5RzNQMStWM3J2ZEhUVmszVDRI?=
 =?utf-8?B?bDRpQjlBVXZNdFhIaFFLMTl6a1hsd2hDbnFDR0RxOWxRNXNYTnBSY2FZVEVC?=
 =?utf-8?B?Sk1hT1k1YUpBdFhrR3R3akVRQ25tQUI4aTBiaUlhQlZ6Y3h2Ty9jOVhQQ2xN?=
 =?utf-8?B?L0UvbXoyaHJBREFtVGkyMUFCUHRZeGprT0hVUlZLS3lZR1VQdHk4M055RGZK?=
 =?utf-8?B?Nmp3WEd5aDNoWWlDRTQ2UlJLRmtnVndRaW5CdnJ0bXNwS09hUXRXVm9sTTNv?=
 =?utf-8?B?MERxMm9lTHdVTW9rcHFDM0lnVE0weGdPdndpMlJZdGxwN1YvQk1GMXY4TGZO?=
 =?utf-8?B?bUlEdGxybGUvZTFram1lb2JZUVpZeForMWhVZVFwRk9xMlFVK0pycjArc2xa?=
 =?utf-8?B?Tm51MXZaT0RObVRSNTlVd1BsUDYwWGJUL3RPcDJJdzcrMzlDNFFrUHExZTlO?=
 =?utf-8?B?bmhNZ0lqbUU2VWFkV2dQaE5NWnVWSXVJK0xkSTJHMnV1UTRKeDROYzJqRnBm?=
 =?utf-8?B?TStJT3FBdi91blptMTdnUXdSRDM2WHljRjNlMFFhc29tSlhmUldGT0FYMVl3?=
 =?utf-8?B?NnlvUGFxY1FHcFE1WmZwZklPdFluQ0FuUi9HVzlza3hibDJVenBib0RDbDdY?=
 =?utf-8?B?RUY0ak1KV1hxbUNGclE3YmRuZTdBZDBWQnZvMFdrQjgzZUtTR3RWM2ZsNjdj?=
 =?utf-8?B?bE1pUmo0NjhWN3ZNZlIycXNuL3RhSGxBR1VjNDQvelVjRms1d0VEQVNYVjdV?=
 =?utf-8?B?SFU2aVRtR1VnejZwcEh1bUVOVjlyaUNWMGxrVlhwdm9qeWhQWVZPOVc2Sjdq?=
 =?utf-8?B?NnVqWXlOT3ZITnZsd1oxSnZweHpUS2xEcUc5N0l4L0hycW42TlhsTVVVR3Uw?=
 =?utf-8?B?TkxGL2pPaUtLdUs4MkZEbXNYTzNkaStUR0RoSUdlNjhkWktBclIzaHhUaVc1?=
 =?utf-8?B?bkF2NC8yVVozaXg3K1prVmovR3lXVUlhM1dQTFJCZFExQytqeEFQTENjTzN5?=
 =?utf-8?B?RVk5SWowVk1KeGVBUGpqcis2QmF0NXhGRExLYXNSNzVuYk5IamliYWZmeTBj?=
 =?utf-8?Q?tAlZlMpsiXWMkBzwtyEqBPSlHCqGmd4J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFNJUXp6MldIVWl3WGlNeDJxZzl0YTk3SWtCQWozV29jc2ptZTZhMnJkRStR?=
 =?utf-8?B?RUcvMFB1ZE1EUTlYVCtGZFBhYWFERzVuMFUwOU5sZDBMcVdGZnRFY1Rja1F0?=
 =?utf-8?B?Z0NSMkhMUWFBOFc4NVdKRUxIdXpXcXQ3U1k2bkhlMUZvMkNKTTVydytnZWNZ?=
 =?utf-8?B?UnN1eHppa3dtTTJTcmVMakdGcjFXL2tSeXZ3dWo3RW9sOGdJSlQ3aGNOaS90?=
 =?utf-8?B?ejNkUVdwSS9ETTBsQmVzUHExU0VILzJGRGMxZ0dNQjc2ZG5ERldFV014Qlkr?=
 =?utf-8?B?Q3ZJQmluV2lsRDliL245VjhPajh5dGFBVmY3V20ybE1XZ1FPWnRYQnJzY05N?=
 =?utf-8?B?OUZYdC9QcXQybGNqVUxQTk53bVZhS0VRMk5aNDlubWRwRVoyTFZoWm9HT1Zz?=
 =?utf-8?B?eXFxcDJtbzZidnVQeWRUdFJ6bXNUTnl1Y3MzVnNmQ1o3L21rRUUyeG53UElI?=
 =?utf-8?B?YW02ZXI5eWY4dGxheEhpTmVnYnhJSDduTHlRazIvcXlLTW5TOFZ4ZmJFWnJa?=
 =?utf-8?B?dDlxOEI2eSt2RGx1Wkx2MDhNTk5ZZGoxSUxHZDJMNE12RU5tTlAwMUY2Rkt4?=
 =?utf-8?B?YWovS0Y0eWtCcmpkN0ZXMmw0K1FqZXdqYmhKWGRCaE5ESnFDSjlJSm5GV1Zz?=
 =?utf-8?B?Ly9SZE9IbWxWaitmT1ZjM3pSTnJVU1diMmhzb0Nhd2pYd0NNMFpZdVRrQkN1?=
 =?utf-8?B?dkVYcFgwNGl1aWR2UFRlRUhZMzhaRGt5djYwWXR2YUw2OG8rajVkU0JYS0VQ?=
 =?utf-8?B?V3VKMFNGUlBYelN0bEZQVGN4NFoxcHZvaHpOT2JsLzJVSFo5MFFvT1Q0R2ZY?=
 =?utf-8?B?eUtIeE94czRXQlRhdEpkSU51blJJaGpYK1Ivci9RbEo0S1MwQ0lzK0FCWFBh?=
 =?utf-8?B?M3pOK2JacGtVTVhXbUNvMEZ0SmM4NHd0Nm9pVlgzZ0ZleWM4blMrVS8wWUJj?=
 =?utf-8?B?UFArRC9YQUNJK3Qrd3JVMDVwckZQRTVpU0N6TVk1LzU2Qmp5Q0dFSy9VTi9O?=
 =?utf-8?B?MjlSMlF5OGNlM0tsOWluTFJrbkVxdlk0RkNqSnNycG1KUEFhN245dmhuWjVZ?=
 =?utf-8?B?STcwdHlmNHpiU0twVC9nMlBYcndla0t0RXlEdzV0dkpGNi9EeTIreFpBZnNQ?=
 =?utf-8?B?VW4zM2hjd2FiaU1Rb1FGUFFoMVlkLzBrWVdZemtoUTZLN0FiYm9INTJtd1cw?=
 =?utf-8?B?MFZKTG9nTG9JY3FsUW9seHVsdTRkQk11TWJ6SmNxbHg1bWZmUmlpZDd1b1dP?=
 =?utf-8?B?bzhib2lxSEhJWlhaK24vQnlvVm1EdkxBUzdUMGNjd2ZGL1lLN2RPLzVscjB4?=
 =?utf-8?B?SDNzc29OR0VhQ1dmV29Zbm92Nlc0NXd1czNIZm05UFR1RXE1eWs0SmpXRzBN?=
 =?utf-8?B?bWZ5Nk1DRFFHU24xY1lwdVNEVHN5YURya01ySW8wVW11YmIyenJCUHVEQzJj?=
 =?utf-8?B?Y2dEU3QvQWUvWlF1SnV3dVVrdzhVQlZlWTVRWEl4MnRodzU5MHZ5dWp6bjlJ?=
 =?utf-8?B?cDhra0cxc0hpVCswNnlPL3NKME5BMUNYTm1BN0ZuRk1ieFYxS0xadVZDZEpD?=
 =?utf-8?B?bmw4Nk5OWU1iN3VLMlErOXR3YitpOW8yWW1mUjR5TXI1WEhmUDN5eHMrSEl5?=
 =?utf-8?B?RXIzTEhwNUtVUHVCM0xqWkdKenlrUTZ3OGR2UVpQczAyTHZKWXE4ODMzN0Ur?=
 =?utf-8?B?clVTVFgycWxpSi91WmtHZ1pkWk5GMWFQWHdPZXloc3hXcjQxckNBZWdsMjkw?=
 =?utf-8?B?QTY2STBHVU9yRDFvVU91aS9JVi9ncFBhYkl4cUdoTnIzdkNIUDluQ01XMG5t?=
 =?utf-8?B?ZUdFQllmMVdQMUpxUzhkOVdKNFlQVytVZmtCQnhkdTd0ZTYxZlZSL1NQN0Rm?=
 =?utf-8?B?TUh0RVEwSWRNSDVFN1U3VUwwQkwyVEFSNHo2KzlFL1F0by9RdnVNOTAvU0Rr?=
 =?utf-8?B?OTJyRzlrbmZubFpoa2tTTU8xeVdWZGxkVDAzUzFzb3NRQjVlVm91VnFTeVNO?=
 =?utf-8?B?RUEveWpvSDN2QTUxemljN09QSFR1ejh4US9IaFdwL3d3ejZNRWZvWlhTSEYz?=
 =?utf-8?B?SFhrN3l0ZVV5UkZqdTB4Z2w4UU5XU1UySnJUc3FvTS8zRVFZcjYvQ2J3MFVF?=
 =?utf-8?B?cnUwYUpSUVdMdzJjaXRZM1kxZFJFWkFyZlZsbGJpdVRBNGg0NVc3aFZtWUpH?=
 =?utf-8?B?eHY3ZGxCWnJpOXRYY2pnRnRhMk5leU5xYnA3a3hyTk40ZmVSMm9ZVXBmTUVQ?=
 =?utf-8?B?cVlZbGpyWks3T25Sa2lsa2IvRGNUc1pSbjltaVZ2SXdYandodlZMSmxCZWxH?=
 =?utf-8?B?eFAybm5FSjg4M29ZWEJBY2hMTVVCSTJMcGV4bWQ1RTRmR2JvV0ExUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3c39a1-018b-49d2-dc3c-08de4f7afc8c
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 12:31:17.6863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEbjt8zoOmiOv1MY7JIr5QbbnDchNQHORxg0vJTb0PO/VjQ2bS0/jYA9yesZv5RJCCkbQ5Om7IG4tyocgEPecg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5223

On Fri, Jan 09, 2026 at 10:29:20AM +0000, Andrew Cooper wrote:
> On 09/01/2026 10:15 am, Jan Beulich wrote:
> > On 08.01.2026 18:55, Roger Pau Monne wrote:
> >> In XenServer we have seen the watchdog occasionally triggering during
> >> domain creation if 1GB pages are scrubbed in-place during physmap
> >> population.
> > That's pretty extreme - writing to 1Gb of memory can't really take over 5s,
> > can it?
> 
> Sure it can.
> 
> > Is there lock contention involved?
> 
> Almost certainly, and it's probably the more relevant aspect in this case.

Possibly.  I can tell Edwin to give me his reproduction.  There's also
the map_domain_page() page aspect of this operation.  On big enough
systems this will cause a fair amount of stress to the map cache,
since each page is mapped, scrubbed and unmapped.  I don't think
however the systems on which we have seen this to be using the map
cache (it was on debug=n builds with less than 5TB of memory).

> > Or is this when very many CPUs
> > try to do the same in parallel?
> 
> The scenario is reboot of a VM when Xapi is doing NUMA placement using
> per-node claims.

Not exclusively.  We have reports of this also happening without any
claims or NUMA placements being used.

AFAICT it's possibly triggered when doing reboots of multiple VMs in
parallel, and all reports of it I've seen it's on multi-node NUMA
systems.  I wonder if scrubbing a 1G remote page in 4K chunks is
killing the intra-node bandwidth.

Thanks, Roger.

