Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB19FC889D7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 09:22:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172360.1497438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOAmb-00072i-3m; Wed, 26 Nov 2025 08:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172360.1497438; Wed, 26 Nov 2025 08:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOAmb-00070K-0B; Wed, 26 Nov 2025 08:21:49 +0000
Received: by outflank-mailman (input) for mailman id 1172360;
 Wed, 26 Nov 2025 08:21:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wUbM=6C=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vOAmZ-00070D-T5
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 08:21:47 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1368a04-caa0-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 09:21:45 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB7049.namprd03.prod.outlook.com (2603:10b6:a03:4ee::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 08:21:40 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 08:21:40 +0000
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
X-Inumbo-ID: f1368a04-caa0-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPhsl+vYeVKovEx9YAgB+ZCikOJ4/JAJ8HJebyj4DHSoZzG7MP07aMo+3tg8cYzvP1sVRI8j9y3lqLRzcjQ4FRVUa/PoRN8zvyFrhZEHdNwLN2/ZzDk0fUCMfpPgIu1MkVIdMWMtmJCSTbu0wNHn4Q1mtQ44mcu6h7iDNmCEIRB2pjVDKUJIEoBBM+j9T1r2WkOMOABErbgLx/1VDSKDBiY/qexOJat/XGB2jg0GCPDl6/6tYB8Td8TTT/c1PFQW6droMWbuhgTQTfYoK2WcJNUNk/tsbXnAwWjdK1Ved+YLGiZPjK8//S3C981Y69rEL3YiVUzh0OJdOiHfIPP9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBrEMZyPCzdcrGs9KMEnEgCG0qm2+YPg6/26ldf2PR4=;
 b=YGQ3v1w2pP/Vy6uLXhfNILiojmGK/kYFy4USsl+sSvZbDh1Y2uD7ZL0ca+nlyUWkRRPQdpfNPjTPbbd0YWyAvl1YAWGmRbSUdjZzDRoAIbdUmsvW48EB0b2CiEo/QLLIsxXVmWCl1CJ9q8e54u7KqU4Dt70ac/3NR+VLhzI5ppqPDTsDKzrpRtjWZeIfQFrtqL/k/ayyVFjbEF69KN1psAgzyGSKkCvX4F54nJOi42AWVuJ6n5D7lxxngTNovwB/nO+4JUZVi2+7qtXs1ljOGH+PAYhuD89AIJs+57DMsw6d3ptXiU4pQyXOe8bpzgerWcmld92odoZ1lzRBxI5n7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBrEMZyPCzdcrGs9KMEnEgCG0qm2+YPg6/26ldf2PR4=;
 b=ninr3gYl2GFCf2iTsxFNbQg2+UARM2usvypW6yJ8hcMUmkH9umT7KxTjH5R3QH5u7c/9MClkzxxhSiQkSJM9FUJYKuEMqwjb9W6phyaczamveK8hY7ONyVL5P9+rg77tar7X1PNK4/R73jdQrV5VSzz6Z7vwobGbuZKSfOZQ3M4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 26 Nov 2025 09:21:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 2/2] symbols/x86: don't use symbols-dummy
Message-ID: <aSa4kejiYVw1P_0z@Mac.lan>
References: <2d7602ce-3665-4853-85f0-c0201642193f@suse.com>
 <3618c458-d9ec-4cc6-a800-0741ade461a1@suse.com>
 <aSXpJ3yqSWfNgElC@Mac.lan>
 <e23aa2e1-078b-477b-9176-28b4babec9e2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e23aa2e1-078b-477b-9176-28b4babec9e2@suse.com>
X-ClientProxiedBy: PA7P264CA0525.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3db::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f319bb-bf67-44ab-2b93-08de2cc4d346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVJ3VitjZ0lNTnJ3Y3hlbTFSdFRKOVc0MHZ6U1RVVHhRRmV0dE16QjF3MEE1?=
 =?utf-8?B?R2ZxZjFEcUw5RWpSZ1RGZ1h1UGlGSXYxdVR5Ty9RaytOWmdpUktOU1djKzRW?=
 =?utf-8?B?WHVPNWlBaU1yZVZjdUh4RmdsdUI5WlBsUEVrbk94cnFKeSs2SGFhSkVmcUpt?=
 =?utf-8?B?WTUxbWFoaHd0LzNvOXNPaklqVWxraVBXTkorc1N3TjE1TmhpWmhtMmFpRWdt?=
 =?utf-8?B?NGQ2c0xWQ3JnZEYwMElFdWhvcVF3dmN4WGRtSk9aN252Y0hnd1hLTm8vUmU5?=
 =?utf-8?B?eUpMNXIwbnVReWZzVWhQYUE0M25yZjhsSzBQR25TSksvSzZIZ0s2RERobGVr?=
 =?utf-8?B?cXdnTWh0UEtwOVpub2VKWkNIcXc5TzVFd0VBbStHNW1zaGtBbHJRSFlnY1JG?=
 =?utf-8?B?YkZlZU16WW51SlRmT3VZYVV4SGlLSHd2VzhBb3dPYjR6TEFCWEZSUmNNOUFV?=
 =?utf-8?B?dG85SllqUWV4SnIyUi9UWGZ2cmJoU2tKQkNuUTFLN1BVZWR2UWoxRVRzeENy?=
 =?utf-8?B?aHQwaE1XMW4wa2NoNis5L1dxRjhlV3dUUkJ6ZWxUSk1jbjlTUFBGVnEwaVBo?=
 =?utf-8?B?NWxIcUV5azJ1bDZlVGYrbktNdVp1RHVBMXVkWnJEVnFONGlqSlNMdmtZTzBH?=
 =?utf-8?B?YmFncjViZHBySDJpSWlSZVN3Q0VHd3NDZmRkUEZwYllVNkRhZm9CV0pEbG01?=
 =?utf-8?B?Z2s5NEpWTGF1YTBTZFgyMW5MUG0rUEdEZkxXYUszMzdaVmViM25UU3B5OVZl?=
 =?utf-8?B?b3g1aEo5aFdBOUtabGdpSmpmM0J4dDJuU2dMYnVlaU1Fc3g4UTdmZFhYZXVq?=
 =?utf-8?B?UWtMM2ZBdHZYMW9OV25vSWd3OExYUXhYeWZ6S3p3clViYnpXRURNUXhjV2h4?=
 =?utf-8?B?YUxvWXk3VWFwOCs3OTRCVkFlQms2TFBGTFhaVjFPbVU3SStPUHdiVmplUUJ0?=
 =?utf-8?B?M0tpSkdZNWtML1FNenpvd3cwWkRNWWIzMDY1YTFFT0ZiM3I2Skt4Qkk4dENm?=
 =?utf-8?B?bnJrSFMvMFc5a1V3MmE3RE01OGpqOFBpQ1hoSDl6UmhwYnJ4TmZGWmV6UW5r?=
 =?utf-8?B?dEFUYVF4UUNKN3NzTlB3S2FXVGplQS9TVGxpbmdSajJQM0h0M2xoNFJpVnBv?=
 =?utf-8?B?VmdIUzE0dVNGQ1ZHVmNzVnJvMHE5UkRPb0lGZmo0ZWhQTHh5S1UrRStGNnBl?=
 =?utf-8?B?Y1owRnR5Vyt2TkhNMDVyVWlhQStBSjZwYVRNWmUzNU5VL1g1L0lib1N1YTBo?=
 =?utf-8?B?ZXEvQ2lJWkdHUVlyZXlCWGl6Y2dtU1J0dk1SajBUdXlzNG05emx3TnhEVWZN?=
 =?utf-8?B?cDgyVmw3S2Q5cWYzTGNFSlAyUCtWS2F5S3J1UGJKVkFEWjlVeTZmcS9iN1lv?=
 =?utf-8?B?eXpGd0tDbURyTDRkRVBpKytxZlg5T3ZuN1IvaEx3OEwxVC9yU2pGaXlMdERw?=
 =?utf-8?B?Tm9vK0s0N1Z3bnIxNWlnczFXK2krWm5vTXFZRC9zMktWMkJ6d29ibFJURENu?=
 =?utf-8?B?TjRFY1E0WGJYOUlxZjgxa0NkMHhOR2hQeGlTUDVXR0FCbDUwV0dPaW1OdFI0?=
 =?utf-8?B?L1A5Vi91T2tibXk4cUxCeTVCOGlwVXpUNkpaMWlHKzJ1NXZaUm5nSUgrdnRv?=
 =?utf-8?B?SzhrUVJNazdLdHl2MVVQYXJ4dDR0RjVXd0NyU3BPUkFneVBvTFlMc3dvOXFz?=
 =?utf-8?B?QUIwd296NWRFOWJmOFdIQm9mcnlMRm55YjZvZzhUdjY3Q1dhK0ZoNC9rN1k5?=
 =?utf-8?B?LzJpWE11T3ZJNVJTemVHTjBvTWxQRXpLUHlwb1RhWVNlWGFaN3VuYStsaVZt?=
 =?utf-8?B?QkRsaHZWM1I3Wlk0ZnBrRU9PNU1tM1JOaDU0VWM1MGFtOGsxRGRIcWxKazR1?=
 =?utf-8?B?NjhGTkNTU1JZRFlLTkJLT3BHWkJpUnV4ZHgydTBMU1AwN21oWlkzY1FSVkpn?=
 =?utf-8?Q?Rfak3XMw2bEXnLGGZbxhJSa8yWnJvNNB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGRMdktualNGdGVqbWw0YmxsOVBPNlQyckZHUU9iempvK1pwSWJGcElZQUgy?=
 =?utf-8?B?a3pkMW9oUjVWa0ZIQzk4THFQeG9zL1JVYjVHWUMxMG52U05kMlRzRmFXUXVn?=
 =?utf-8?B?aHN1T0JrbDBTMDNQc0Y3dGhWUERVRDVTd3VObWl0UjZjam9YN1R6TkFWZEdF?=
 =?utf-8?B?QVFramVhRENWRDNybGM4QTI1aC9aVUJOT1hnbTZPemxoOEJXbEFYRVFZM1o5?=
 =?utf-8?B?WUhpaGQycXY3Q2VEMTM1d3JzK0gwN3doRm1qRkdLVzF2WllwWDdaRW54SEJJ?=
 =?utf-8?B?SjNxU2x0MDZMMll1eUY2L0ZOZzZGOTBUVnJzWjZYMzlRR290M2gxR0ZJcjdQ?=
 =?utf-8?B?NGhNaEU0MUpxVHhzc256QUdlK0hYMTJwVk1JS2s1ZEpNS1BXKzd0SkJqQ0xr?=
 =?utf-8?B?Lzh3ZnJTS243ZjdiQjBKTUVyemhCbjZLVzNZa1NUbDJPTWdvQytxNWFZRkNC?=
 =?utf-8?B?RElHSHlyMDRqWDB5eTVOS1o1bklDRytTWnppSjVoNUVIV0pHWWV2NnFYK2hR?=
 =?utf-8?B?TEljOUxLUDUwWkhFZXpEWEc5Q3UxMkRwQnh2WjJhUDJrVHJLNnJLbnBLdlcr?=
 =?utf-8?B?cCtnZXVBcGUyM0lta0txeXR0cVZCL2NhQ1dieHp3MlRJZlRHdXdVRGZhVFRH?=
 =?utf-8?B?dGNRaGFpNzFDa0h1WTV1VmdQSEtVRkZPTVprZTdTc0pzZXFGN1ljdDNuWVZp?=
 =?utf-8?B?M0tCU0YxOW9PYTdGaUFpRmNTVHZjcDNITi8rVzV6dGdpT2NXUytrd0FXeW5p?=
 =?utf-8?B?cFJvdkt1ZE9sZVpyMnhZekZWWGhMUndlQytRVW1MSzdGT0NXZG1iRUU2clNn?=
 =?utf-8?B?cEZyNDBqV0xDdEw5ekcxVERIMGoxMzh2YkRiUURjTDZGdVhoZFAzSUZ1V2tl?=
 =?utf-8?B?VlBxWndwRG9DUkVydkZnTHdqUE5hMHFnUi9URS9RenQzc3Z4NmszK05zZlBj?=
 =?utf-8?B?cHptTUFzQ01VV0tDTEJUYVRSUWh6T3FvSmNmZXRSaWRISjVoYkRaVGdlTWJE?=
 =?utf-8?B?bXJiMzJHUTN5d0ZjNjYvUEFxank3UVVwMFc5eU1rN2t3djlVbmF5dHZoRXRW?=
 =?utf-8?B?M0VwZGhENUg0VmpQalllN1EwMGs1RUFZYXVXVnhHK05jL1QzWnpQWUhnTFVq?=
 =?utf-8?B?M0pUL0tBVEVoRVhySm9tb3FFRDUyU0NkNSs2K3ozTUJaQy90cXlZL1J2OU45?=
 =?utf-8?B?SDFzY1FYa2pVb2dSWXdwY0tvOE01MzZIaE82TmczQ245RjVyYngrRVVyUFAz?=
 =?utf-8?B?OTAzNG5mcmVGR0EwaEJmZ0tmcmFlbU5iOVhnVWg1T1ZDTVlmdWkwb0h4enc1?=
 =?utf-8?B?N1MyWWtKUGRkQ3JwVGFOelFXbmhiVmY1bkxIS0xDVWRhaHhjVVliNlBURU5J?=
 =?utf-8?B?cWQxeU45cTBmTHYwL2ZaS0xqRkI0RW45Qk1QTFY2Qmw5UFdRNWtXSlpFUzNZ?=
 =?utf-8?B?SlVQeldBY2JYN3BhbjZaOSsxNnhEekN6NmVhb0pydTJEeHNrOEhlbjlCNlc3?=
 =?utf-8?B?RWRJYzY0QktjODBmeGs5N0ZPcmdmckZpYnVFSkozNFdYcDZiVUFWdWhGc0pZ?=
 =?utf-8?B?OGFUMmY3UlpDay9MNW5JbytpZ3dPMUFJUEdQY2RtSS9HR245QVk0ZjJaYXZU?=
 =?utf-8?B?bGNjZWNFcVFQZFZtN2twbFpYMTAxcCtNK0VMNldwbU5TOWhHVk8ra0VKakVC?=
 =?utf-8?B?Y3grcVpSWG1ObkI4Vnl0TkxYMUFhcFQzSWFJK3JLSUgxVXdFemZOem1wdlZa?=
 =?utf-8?B?aG9UdjYyanVOV1lQelJZL0Mxa0p4bkpTaHlJNXVZMzU5K3ZMUzM0OHU0NjlO?=
 =?utf-8?B?RWRWQ0RvOHcyazFqVzg3YlZyWmQxZFZmZE9FdU5idUk5SWdYQTVxcDFzT210?=
 =?utf-8?B?TW1ZNEcvNmU0SHBlOWxSbnhOZnl2SFQvS1hOTlNYdWdlcUhzaW5ZVmY4MHcx?=
 =?utf-8?B?SG93R3k3YnhZc1BKeU9Jb1NEd0VvK1VnU1hkQ250eXpuTjNvS3I4QnA1Y0lX?=
 =?utf-8?B?NGNIbGRYUnBiM3V0dy9SQVB3MUhwdVdYcEdBb1NjTlFyTkxNeWljZTlFMHZ4?=
 =?utf-8?B?VGRHV1JCWTQwZXJyNU5LR0YydUxMbjNJRGVubEVPNUlMYnZ1SGh5L2VRdFdj?=
 =?utf-8?Q?TqSUJfY/7846hiAGWMI1NMppM?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f319bb-bf67-44ab-2b93-08de2cc4d346
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 08:21:40.4928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ms7B0sP4+hDzO9FL4s2waq+c9BZGb7V0XBpTuNKIHpCtv+aYTKxriDau9AIBI2Zw7dEMgcI1VXVIYVf28C4F7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7049

On Wed, Nov 26, 2025 at 07:21:09AM +0100, Jan Beulich wrote:
> On 25.11.2025 18:36, Roger Pau Monné wrote:
> > On Tue, Nov 25, 2025 at 03:14:27PM +0100, Jan Beulich wrote:
> >> In particular when linking with lld, which converts hidden symbols to
> >> local ones, the ELF symbol table can change in unhelpful ways between the
> >> first two linking passes, resulting in the .rodata contributions to change
> >> between the 2nd and 3rd pass. That, however, renders our embedded symbol
> >> table pretty much unusable; the recently introduced self-test may then
> >> also fail. (Another difference between compiling a C file and assembling
> >> the generated ones is that - with -fdata-sections in use - the .rodata
> >> contributions move between passes 1 and 2, when we'd prefer them not to.)
> >>
> >> Make tools/symbols capable of producing an "empty" assembly file, such
> >> that unwanted differences between passes 1 and 2 go away when then using
> >> the corresponding objects in place of common/symbols-dummy.o.
> >>
> >> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > LGTM, not sure whether you want to extend to other arches in this
> > same patch, or simply guard the build of symbols-dummy.o for non-x86
> > arches.
> 
> I think I'd prefer to mirror it to other arch-es, but in separate
> patches (so they can go in independently). Then once all are in, ...

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> >> ---
> >> May want mirroring to other arch-es.
> >>
> >> --- a/xen/arch/x86/Makefile
> >> +++ b/xen/arch/x86/Makefile
> >> @@ -134,8 +134,10 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj
> >>  CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
> >>  
> >>  $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> >> +	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
> >> +	$(MAKE) $(build)=$(@D) $(dot-target).0.o
> >>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> >> -	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
> > 
> > It would be good if we could now stop building symbols-dummy.o as part
> > of extra-y.  Maybe you could guard it with ifneq ($(CONFIG_X86),y) in
> > the Makefile?
> > 
> > Or otherwise remove this from all arches thus removing
> > common/symbols-dummy.c.
> 
> ... I'd remove symbols-dummy altogether. I don't think there's a need
> to transiently disable building of symbols-dummy.o for just some of the
> arch-es (like foe x86 right here).

OK, as long as those other patches don't get stuck that's fine for me.

> >> --- a/xen/tools/symbols.c
> >> +++ b/xen/tools/symbols.c
> >> @@ -672,7 +672,10 @@ int main(int argc, char **argv)
> >>  				warn_dup = true;
> >>  			else if (strcmp(argv[i], "--error-dup") == 0)
> >>  				warn_dup = error_dup = true;
> >> -			else if (strcmp(argv[i], "--xensyms") == 0)
> >> +			else if (strcmp(argv[i], "--empty") == 0) {
> >> +				write_src();
> >> +				return 0;
> > 
> > Oh, that was easier than I was expecting for symbols to generate a
> > working empty assembly file.
> 
> Yeah, I also expected it to be more intrusive. The file isn't exactly,
> though - two of the tables (the ones with 256 entries) are emitted
> nevertheless. I didn't consider this an issue, though.

As long as it builds and has the same symbols defined, it's all fine.
IMO,  We don't care about the sizes at this point, just using the same
sections for the defined symbols.

Thanks, Roger.

