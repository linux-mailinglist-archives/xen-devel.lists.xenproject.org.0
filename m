Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E700DBC2128
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 18:14:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139124.1474667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6AKQ-0001hI-0r; Tue, 07 Oct 2025 16:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139124.1474667; Tue, 07 Oct 2025 16:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6AKP-0001fr-UA; Tue, 07 Oct 2025 16:14:17 +0000
Received: by outflank-mailman (input) for mailman id 1139124;
 Tue, 07 Oct 2025 16:14:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v6AKO-0001fl-VR
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 16:14:17 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa6940f7-a398-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 18:14:14 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by SN7PR03MB7257.namprd03.prod.outlook.com (2603:10b6:806:2ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 16:14:07 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 16:14:07 +0000
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
X-Inumbo-ID: aa6940f7-a398-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5KRmGnYMZ5SKONNgLqdQSvBPP+rwcDqmL3TvwBgqJ1oSuC7k91CD7khjN6aB6GLjQEGM9qW8Z3CHoekQqAm4ftjqVeYtQRSwv1kx0qyo4vgkO2DT+MUl7HwCCzcuhugncYT2W51DOPrf/C3SDJB0mLj7VCnlKNrEzAUsaEBD/2CPFyRckm14ZJI8qVhUCMT517BqJCcaIWd44yXtOh8nOPvFjwr4V5lyhnnNEYwavqGT11T+A/MqMe7zdPCJxVwvZBEJZXHtyZ7Mi6rfOT6p1w+jNWzSoaEyLNTrnpz/lcF2UMdCQ4H6zj4djWh1Zm4Wtyh11BuHOMrm4Aw+Y8xkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WX6jHJjig7bG+1fuwVpsgGEGH/ZQ4lFhJQVkL5kj/Zw=;
 b=vOg/o1TE/hg+MFNj96+oqc47Qt7/2s1zMmYPxhih9yc6GlnJRj7TvldlLiWtqrv2+q5toAIOCF2gk/MFh3dx+TPMsE9BBWm13MLtwsTc5UVRs8kw3GLGg9vgOiwvrA4463LfWZ+nXCIsmIKrevAHp2DjgGuBpSXhfCKaZ4L2lwG9Zy22Je0i+SkSlCSRuLHJjUfy3y6o4vzWvmUVdmg3PD4Brcvx7mW9zYq9I0DbevLPjcvIM88SU7QGUfVfQhQDRpGgBucN8feT9aQ/4ebmxH5pv+Bq5UGJQEEKzakWMWpUaB/68YLFJsHxaxoD6U7uI52cyss+hI39sZ9WvCflSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WX6jHJjig7bG+1fuwVpsgGEGH/ZQ4lFhJQVkL5kj/Zw=;
 b=cfvRaGytmX3I7/1uDF5tIMM8R8o/oY+as+XGk9a6lQbOmOAwC4tXFh5vHpN4xtNl+tdZHOlHNaKSK+AUPn/5WQSegsQrmqm2WMvK21ID3OTmBFKe0vULabftompSHabDKrYz++z+2bDVdaiwlksgqkVsXZM6Ml+LwRSf0bN6uY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.21] cirrus-ci: add json-c for libxl dependency
Date: Tue,  7 Oct 2025 18:13:33 +0200
Message-ID: <20251007161333.89190-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::7) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|SN7PR03MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: be02a7e0-c3f7-4dc7-35af-08de05bc8944
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUtQR2RiVitMV2d6cENjYTN4eGROWngwQTFlalRHUFVmajEvYVB4d0xqV3hC?=
 =?utf-8?B?QVdjL3hyb2lqRmFGNW1oVlg1bGpwSEhLL1YwSXU1OWZlaGVkejIzRkU5WlJQ?=
 =?utf-8?B?UkVFbTJpYkhITEhrR0Y5NkEzb0UwTGNrRGdlbi9XMzNXUjhVWm5iL29Cd3g0?=
 =?utf-8?B?ZFlqaSttS1ZEc0ZBNzJidmZiSklhV1gxZHY3djIxa3lIT2ExMVE2ZkErZEZI?=
 =?utf-8?B?WFAyZUZTb010RWpNenJNTWtOQ1Z6aVIxTEpoQm5EQWVpbHRFbkVtSXBiUjBl?=
 =?utf-8?B?S1hRV0MvZzVHWWxuUnIvMC9LSCtrS0lnMXJ3bkx4YVNpc0hNSVNDbzExQ0hr?=
 =?utf-8?B?VFgrT25oZWZEUCt3NFlTd0Rqc0hXbjlLMDJXa0J2V2VpZjhneWJsTnVMVm13?=
 =?utf-8?B?Y2RtZnJ2aEdScXljNlRmNmNnY2Mwd2NmdDZSMEFPdGIzU0pEcEVGQy9pdk5H?=
 =?utf-8?B?clJjVXcwK1Vvb2ZBVUhHbDZ2VzZObDQxOWJoeWdZSDBGN2g0ZTJpQ1k5NUFz?=
 =?utf-8?B?cm80amVxT0c4eWlFd3pBekZIMFlIZkRvUVJKdnZmVTdBODd1QVVNdXZwdXlX?=
 =?utf-8?B?SVI5N0R5U0NXcVFqRU9vYytRdHBXeWhVbGdWbG1rU3NQcitMYlNwSzErM1N5?=
 =?utf-8?B?UENLalJwYVpBQllDcUg2c2NPM1RBZlhOL0c1YWoxNTRBZnZseEtoNmNRRlR5?=
 =?utf-8?B?TkNHTDZvdDNGQkFTZ3FWQmM0SVBwSy9pSnJSS2NYRXJ5czc4dHh1cWNKeXZK?=
 =?utf-8?B?T1pKTUNUTHNJM1VuSnlxRHRBaWp6QS9EL0VCRklGSW1ZUjdOSjg0bUlpYTUx?=
 =?utf-8?B?L0x2SFE2QVo4Nmk0SGZ4aGNNaUE2VU1qS1U1TTZGVU50amNONmQ0czg5bFl2?=
 =?utf-8?B?QVlScGt1ZkdWTjd3YjIvMnpENHhXQTd5VUluMUNObm9lS1k5akJLWnA1Rzlo?=
 =?utf-8?B?ZWZ5WXBqOEtnWHJHNXJmUlNkekhPRnlNbW9ScTRMQXYrRkxhMWQ5QjZhV3hV?=
 =?utf-8?B?WE84a0o0R3FFRjJpTHZ6aHh4OUQ0Zy90NWsveDlIUjlWSERZM3VuVEJGemcr?=
 =?utf-8?B?bmMyanBPYWV5d2h0alY2VnN5cVZ1NlBoRWFJL1o4WFVjd0Z0Tkx1YWhJTWY2?=
 =?utf-8?B?OGtFWjB4elF4YUI0N0N5TUFtUkdQNnhiMG5jNVZLMEw2QzhvUkNla2E2d2Mx?=
 =?utf-8?B?cnI1VGJ6YzV5WXJYRDRlcnVHUW5ZcXNYT3FwMTdOVWdPSkozdGs3VTZEZGU0?=
 =?utf-8?B?MW9UVCtUVEx3ekE0MmdoMXB5Q3NpM1FoeHlDUlZ6NHluU3llRUtQM0QrZU91?=
 =?utf-8?B?TW5XQnZiVytMU2JISDdGRGdncVhLdGFtV2FJTmVDMjRFWjVLdVE4d203LzQ2?=
 =?utf-8?B?VjR4MXVRRHRxZmpRYjA1aHNJaC9lWFJKUC9JOHRDOGhXUTBQMVRKMmMyQlBx?=
 =?utf-8?B?Z3Y2dDhjTjdkZkZsOWd0TzNERUlRZkNoTitMZnNSTGMvRHNFcGsrOVVQcm5v?=
 =?utf-8?B?YUZQSlFzU2ZKTFhFcUJlWnllODBCOXRwcWZpNGxDRWVlaU9MVEsyNnNzaVRi?=
 =?utf-8?B?OEVSdU9TWVdKeEp0b0FaaVZlaFdTWmtWM3RpUEdKZGUyYVVQSHU0bTlPSVRB?=
 =?utf-8?B?akZiN0s5RTZmc3J1Ri9nOG1HYWxRQ3J0N1NObDJFOCsvN3ZaeGFmVG5ESkdl?=
 =?utf-8?B?eExlTVA4Y2R4UG4vOU5uQXUxamlwdXN6NjVQY3NrY1Y0WVA4SzlUVFhVVm11?=
 =?utf-8?B?RVVkdVU5MmZIZ2xEVWYvVkFwdmlLN010Yk9TaUFiWE1Mc0lWQjFaNUx3YjZ2?=
 =?utf-8?B?RkVoekhsUTM1bUQ3c3JWcTkzc29QeDY3V05rNU9pOWtlZWt0dGlPenNsZVlW?=
 =?utf-8?B?OThKcFNLcldLSWZyWGFoUXd1d2VrTjgyOUdEeFhTVDEvVmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWNqcFhDbzhuSzhMVG5TbU5xNmhKZDlQcGpkZUtBQy8wdDBRTWgzVFVnb2R4?=
 =?utf-8?B?MjBvM0FabTlmRmdIckhMTkFLUVVSeXBGRy9lMmZmaitFTnNhVkdnNVBkY1lw?=
 =?utf-8?B?dGFKa3JrQ0hibmZPcEpEd3pOaGFzOXlEd3piWjIyYnpjb1FpV0NiL01RN3RG?=
 =?utf-8?B?SmJGZ2l3dGlOVTA4NGNTR3VwM044a1lWejNac29LeXRKTkdGa09NdnpSVUd5?=
 =?utf-8?B?aHcvS2RMcGhvTExmbHVxc2hIeWkwbzNJR0t2RHBFbUhvbVI4elNrMEt4Y0lU?=
 =?utf-8?B?RGtxL1RrWWRMSjdTM01Rc2dhUUZEL1BmZURxdUtNYnZNMklIa0tkc1JEbU1n?=
 =?utf-8?B?WGVEcXhJdmk2SE5VS2kvbmlEM2hIR1hBR3hTRVNzRlhBamw0RGtabXpBcWs1?=
 =?utf-8?B?UXRtQnQ3ZGlVMkdTQk01ZnRha0d5M1I2bVRINHFPTlExVlJOWHRFYmhiWnJ6?=
 =?utf-8?B?NVhBMUZjWWxRWUNpTG9DL0RRNkM3dmVpRjU0OFhEakhBVTBYem1Qa3gvenpV?=
 =?utf-8?B?T0syUWdkcTZ5aFl3TXBwQmZrN3c1cWFiTTJ2U1FBVWUwblUyU3dQWkZ2OXJ4?=
 =?utf-8?B?ZnNwTll4UTVXNjMvMWwyVGN0RmFldVpFMmhRQUNXMG1Qb2JRRG9LcThvM3Vy?=
 =?utf-8?B?eVZraWlVeElMRWpoU0l1UFJibzN1NW1wTWNZWDgvcUx4TUtUa2ZuaTVGSEM5?=
 =?utf-8?B?aDhBb20rVUd2YjVwRVZCNUVmK1ErY0d2L3AwRlJweVFHWEhQSHZEZVVHYkky?=
 =?utf-8?B?WEZmVnkzcjhuWGVBay9oWjliN3B1RlZVeDhOZjBOelh3ekRHWXBvczJqSWlH?=
 =?utf-8?B?Tnl5ZldGT1JuZmpuN3J6S3Z4akUzOEROS3B4MUVQQUcrMStVYWZLTlBwMUNZ?=
 =?utf-8?B?V3ZsS21OR252aHVXQWR1V3VqUllqdnp3OEZLbWtXYUh1RiszMzlTb29JZXJk?=
 =?utf-8?B?SFJNcG05Y0V6Y2hqKzVhSldhMUVqR1JKQUs0UlRxdTdMVjhUemRPOHNUR2tI?=
 =?utf-8?B?STA0WW8wVTRQU3M1aXp1U1dPdm54N1l2ZHJUcU56K3FRQnZIM3RKNVk5MVRo?=
 =?utf-8?B?M1owaXVBeUM2Q2RTNHRhVWRCenAyalBTbEFzQWkzVVoxVkxQU0I2Zk14RDVk?=
 =?utf-8?B?VjhQMVpwWGRsamFkSDNkMk9yNkl2TkdWc3I2czU1MVA2b1J0R21iTjJaeE1w?=
 =?utf-8?B?V05GRXROSUFSZEtyd0p1RWd5N2N6SWZXRktpSUxXV3p4RjNxNm1NTFBjRzVo?=
 =?utf-8?B?cVAvbkU2dU9wTG9xRFJNVmk5Z01CazRxQzN5blBwZks5UU9BMU9RYzRaZURq?=
 =?utf-8?B?YURHbkh3b1E4THc5UVdiOVVnZ1h6Ui9HbXMvM1VlZEZhYU5iM045V2Vmc1Rt?=
 =?utf-8?B?dVQySW1URlo4TEdoUXhDbFpnOEw5dGVIdnh6UEpockNJbkRqTGIya09FTUFm?=
 =?utf-8?B?eE5TQ014TDJmSXRWRlFiTGZmQUNXQXpOVFF4WkI0T3ZVTzZzNkFWR21XQmlR?=
 =?utf-8?B?YXBUalZoTFo3V2o4b0QrOXFiZG5nNWRUYS9FSVRPWUREWDdVaUJxSTl3cUJk?=
 =?utf-8?B?cVREYWtWVWN6ZVM1V3FFNG5nSm5KVHFHM0ZQVzF2TnJTalJ6MjVTaExtV2JS?=
 =?utf-8?B?c2FwUTBSZDVwL2laeVZCZTBXb2ttNHYxTGIyOXhxTlNDYnQ3Q2I5cFh0eGxE?=
 =?utf-8?B?ZExwVUVHVUdBSGxiR2hTeDZNZUdYNWpTRExUeUVCN09SMTE1aE1iL2t1NjdX?=
 =?utf-8?B?aEZyNkpOVzJpdGpLcUYxOGRIQ0wvVnhKclJEWm5wV2phdXFvbGxGVGxNaHJ1?=
 =?utf-8?B?K2NjY3o3N2F1ZHI0alBRSXNnRmlpd1I0Skh1Sm5NVjRQSEFIZmw1V2xQbXBx?=
 =?utf-8?B?MjFCeldwbndtbE9RTFFKWDlCSjJ3djZjbTAvdW1EejVma1lFai80aFdUUTRU?=
 =?utf-8?B?QkxjTmpTQjdxVFdTZXlqS3RyODVvbUcrNGVuYkl3YVdsYnFVU2NTanFwSlJF?=
 =?utf-8?B?YmRqSzUybjhYc1pxblpvRmZseU90S3FMSENwN3psNkhHNExhaFM2b2pEYUhp?=
 =?utf-8?B?OC8vcEt6dmNPaUoyVUhXZEQyc1BMdWVpYW1kRmR5aFZwMFhhdy9XY1laOWNl?=
 =?utf-8?Q?Zuw6ZMYH4mcV6p0ACIOT/CXdX?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be02a7e0-c3f7-4dc7-35af-08de05bc8944
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 16:14:06.9834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 349OABWLCw+Xx9rgYZZ8fNgNu40rJokSuMOgjJa2sTROP5Y26kMk8jmEtaXqlaOOB+cHN3N7uKrimmPF14/j+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7257

Add json-c package for libxl usage.  At the same time drop YAJL.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Would be nice to have for 4.21, so that we test with json-c instead of
YAJL.  I plan to switch the FreeBSD Xen port use json-c for 4.21.

All seems fine:

https://cirrus-ci.com/build/5366905441091584
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 7df7ff552222..0de1012d8c60 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -50,7 +50,7 @@ task:
 
   install_script: pkg install -y seabios gmake ninja bash
                                  pkgconf bison perl5
-                                 yajl lzo2 pixman argp-standalone
+                                 json-c lzo2 pixman argp-standalone
                                  libxml2 glib git python3 libinotify
 
   configure_script:
-- 
2.51.0


