Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E541FBC38FC
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 09:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139353.1474750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Obp-0006Yt-T4; Wed, 08 Oct 2025 07:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139353.1474750; Wed, 08 Oct 2025 07:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Obp-0006Wb-QL; Wed, 08 Oct 2025 07:29:13 +0000
Received: by outflank-mailman (input) for mailman id 1139353;
 Wed, 08 Oct 2025 07:29:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tb2B=4R=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v6Obp-0006WV-8h
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 07:29:13 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bf94eae-a418-11f0-9d15-b5c5bf9af7f9;
 Wed, 08 Oct 2025 09:29:12 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 07:29:08 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 07:29:08 +0000
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
X-Inumbo-ID: 7bf94eae-a418-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1XGDwrdGj6GuMW3x+dR4UpwOilgQzFkPq7xjPywFGOdAdU2vSnRTU5nh8PG1ODOxF1U9wmGacvlRiQ/wwrfZJlVHDxhmF+QdHmQC+y16Essm7QVkdwzFQ4aFKu81VTZgXJzJH8Y1pahgiCeo7lXip3yDsyTcECv2XrOrmzijs+ZNWYCJ1KHU1/UMZfer6hYnszR+ISV2Et3tOr1vm03ZdbgYnkDyZDQZqbvG9PP1UGYBNGr34hS6b2tJ9p5+ciKDs8ixe9oJSTNzu36+FL7bpOh0bDXfwj29ydx/GgsNVnqZj2NwuNYN8UTubXt52c+pJazredfNFnVXtqPMC6Wyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTOYEjl64LRlQYAvP9+I1/dWcT5YwcVafHk4fHRCjfE=;
 b=ZOf7XnLlebBV2nKLS6kF/bopO7RqopsmA7UY2JYu/vKRI5VRd2WEJxBiULpFUHQsYy3sIKMwlt5DEs2kKJQqQconT1vi0VXRBu2r03BrLiMDvirWu3Oj3AXOfe6bizte4X8HqgOx6N0nfCQjGMTOcdlPeaD5H1cJEh0oKY5p//8l+/RsErg23YsyRuKv+j0mKv6mRKuLgqeFFml2bJTNoV+UkPOyJPm5q9DtS5Wfp0TvHnHQpt9eNfnwUg69s9I78zdHXLEo33yOPQHIHQAfVCcFGlnbtVlvE3EPZ2x9Rky5RbsS1lc4NXyZm9C676J7Yr3Y8cAi0hsmK/fPX+5HVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTOYEjl64LRlQYAvP9+I1/dWcT5YwcVafHk4fHRCjfE=;
 b=htsXqTELhQPflGsRjYXEy5+7qLqQHTkmmt1lvK66yJ05vKiBFGn8BP/sKFOQKaX9D1GcweBnCJSXGtc2QPnO9FwSvAn5NCeeoHJE/mugpHHYDKE8Lwfa5nfbUw/+B7JlwK7pivFnKkhLNweQcRoN8C7UOVA2txcNpqTBbsQNZNM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 8 Oct 2025 09:29:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.21] cirrus-ci: add json-c for libxl dependency
Message-ID: <aOYSwTYt7-345Gcm@Mac.lan>
References: <20251007161333.89190-1-roger.pau@citrix.com>
 <5f2e6f4e-cbc9-4705-8817-366790717164@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f2e6f4e-cbc9-4705-8817-366790717164@citrix.com>
X-ClientProxiedBy: MA2P292CA0027.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::16)
 To DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DM8PR03MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: 89be9622-1204-406b-74dc-08de063c5e7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUh4d25uNzliMVpObnRiMk1BTGR5OHY3eTEvSkl0by9kcCs4VFJVM21aY0Zl?=
 =?utf-8?B?Z3U5YVRVRW54YWtqa1Btc0RzRWJlY3Z1czhZRVBaZGhwRTUvRnVIYXl0NTc1?=
 =?utf-8?B?TTFBY3VYV2tTSlhOQm1qWFBHOFJxb0c4NGlFYUp1ZlgwNExqUHl5WEsrbkhp?=
 =?utf-8?B?dzMxTGVrSW1JQi92TVVyVFEyOXVjaHk4NnlYZEJJdkRhd2g1cUlmZktaVUhI?=
 =?utf-8?B?bWtaSU9IZDVIRGFJU3VGMTBqamxHRHVSSFFFKzFGb1U3ckZEd2E4dmNGVHBU?=
 =?utf-8?B?SUdpZnJweXV1S1pGLzdHWmw4MlMxSnFaMHpIc04rS25Kc2JuUHU5dEdkM09y?=
 =?utf-8?B?a2lMRHBKcjZJVEpOemtIZGJ3cDJTZjNTaE1BanJ0a1JKVHdrTi9jN2N2UFo1?=
 =?utf-8?B?c1dESldSQk96b3RlWm1FWEhHSjMyR3AvQmxiS3Z0YUVZMG9LMkEydmFhWEEw?=
 =?utf-8?B?YkVlVzBmZW9OWjdOeHgySE93MmxuWjVPSmdkT1FiK0pBR1d6VVdvZ2YvZWsx?=
 =?utf-8?B?S0p6QitkK216WE0ybXREcUpLWWdLa2hzMitUSTJXUXFhQ256dDF2WVM2ZkpU?=
 =?utf-8?B?WDJ4SEdIT3BhdG9IQ2tKcHNEbVdtUVlNZjFoS3R3WCszdVJ1US9wQmdVTjNQ?=
 =?utf-8?B?SXNGQUJVZkpaZDFPS045ZW1zK1Fzc0NYaFZUZjY0Ny8yVHZhRnMzL3Bnck1V?=
 =?utf-8?B?bVVHdGxocEhqRUpMMTBkSzZCemdubmFDWnNPQzhydHZrWXdZMEkyQnNud0xB?=
 =?utf-8?B?ZlR4MmJuWGx2VnNrV2ZiNjJ2b0FrTHBBemJpZnNycVdVR0xyaVowejJRTVQ1?=
 =?utf-8?B?L2tNQnRnVlJteWxHQkp2V0NOdFQ4cndpVnBsUW9VZWUzVnhpRFB5UlZBZ3dr?=
 =?utf-8?B?M1NXb2h3eHBUZlVLSnBzZUhFWmpYUTZlZ1hsRWxzRXZEZEt3eFlCbzlzSEVy?=
 =?utf-8?B?NjEvQm1zcUVSUTNqMnBXLzc1ZXIrYUlUaGp5TWhCSjI4WlFiMnJ2SUt6aGhv?=
 =?utf-8?B?QzZva0F5a1NtZVVkaERiNk92eFR3UjlzenNtWDZyeFpTd1d5dm93Y1lreG9Q?=
 =?utf-8?B?VWl0WUczcGREeUI0bXFjbXk4RWluRWFWR25hdTBmYmg4dkVZRTJSN0dUeWJN?=
 =?utf-8?B?WkUvL3pwYzRNbjJydHJrR3FlVmZnWDBGWWUyWU43VU5YWG9hYXRrdCtlcy9v?=
 =?utf-8?B?bFdZd2VVaEdaWTBadm9WY2h6dVl4ZC80akxoMEVPQ01qeFlHd3pVZHBhRjBr?=
 =?utf-8?B?bHNuTTBYcSt2S3pydVBtdGh5blBpWllISnhwMjlNS25vcC9pd1puY2hibFBJ?=
 =?utf-8?B?TFNpc0kyZ0NEam1HZUo0TTJaeXVTYURkaFJmbTRIQUJUM0M1MHF1b0gvMk1k?=
 =?utf-8?B?ZHdabkF5RWR6V2JPNlpCT2xzM0kyZG4yekk2M2VUQ3cxSFVRZ1NocnE2bWJP?=
 =?utf-8?B?dk9pS2xkQ2I3a2Fpa29HWTZZWlVjWWRhT1JqTm5xdUdtRGl1TXVaL1hvR0M0?=
 =?utf-8?B?ZWxiZmNQeUVFbW44cUpJaC9UcXlLTVVtc3JkN1ltUVZSTFpvMUpWaVJFTGpa?=
 =?utf-8?B?YXo1eDEwMm8yZlREcERpOHlKaTJ2NTgxRDNMd1MvaWNlaGZjT1VpRWQzQ28z?=
 =?utf-8?B?SER4NWh5bSsza0tVUGpLYVhsWEYxNHdVcW1nTUJSNTV5cmZkQjkrTTZRZ0Uw?=
 =?utf-8?B?T2NZNHZUbzFVTVNQaHRPVHQ3WndyTTA4aC8vVTFzczhFUm9MeDBkeDVXSWo2?=
 =?utf-8?B?TGxRYjlFaFJuOVBYbjNoM3RlUXJidG5zUnZ2SWEybjhzMVJJY1ZUdUhKdHow?=
 =?utf-8?B?TCtQVy9oWFdidGFoc3J1VUpCUjZiV25KMmpIVWNXRERyZHdGd0pZODh0ZGJt?=
 =?utf-8?B?YmpnTis0bUtSWlZUaXA4NUYxSWl4dmpJTXVrcVNZdWFIWmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3l5U2hrN3puSGJSd2R1VzhnSmFNTUo3MWVUU3lGR0FoR25DYlZVTFIxeXFh?=
 =?utf-8?B?YkVURzBiSkI1L2svQitwSVM5REpGMXBHckR4a0ZaYWRKQTVnejdxcnhRQUVh?=
 =?utf-8?B?UGFOZTJUeUFCV0tuQWFFSDF4WFRsK1FlWnFEVjkxOTNnbkdMOGNOdzhEVmgw?=
 =?utf-8?B?S2VIRjNndEJpWGNENms3aFgvKzkxM0J1M24xcml6Vk1ad2k5OHdXaGVIMG1s?=
 =?utf-8?B?aGVHdEM0U3QxOEI0Y083OGtIRU1OWjV3VFlDSkhlelpvdGxIU0gycUZQejJk?=
 =?utf-8?B?RUpyU3dPbldzVlQzNUdlUDVnOEUrZ1VhM2pRU2ZMTnZUQUhhMFJxSndjWHEv?=
 =?utf-8?B?RkpDM2RTOGF5K1hwa0R4bWx5aWh5NE5wS2diV3BiczZaVWpIR0hFSGFYV2Ev?=
 =?utf-8?B?S1M0ckplTlYrWnl1aXYrSkdoRm85bDhxY2U4R1gzQlBmOUovU1cxZTB0b1kx?=
 =?utf-8?B?V2dRZStVR0VNckYxcDRuTE8rWUgyaEdGQ01mU3ZuVVh2SUFHTnNoOGVyOUhD?=
 =?utf-8?B?V1JzdzhXMjBzaERJa0dSOWp0WUVIRFpmK2lxRDB5ZnVwcVFuKy9CanBTMUJ4?=
 =?utf-8?B?T0FPcGFhT0xNWHBWcDNMU3RDWXpuZXJydEZEUXA4WkcvK0taVnJieVVNUlYy?=
 =?utf-8?B?WTM1N0drazlUT3JXb2puR1BtNkNzb0NWb2FKZmR4RUpjYmx3TUtrTjkvOWkr?=
 =?utf-8?B?ekxONHJ5akowanlKSGtIYXpVRzQ1Nit4Y1ZZdkFaNUk3SkNmV21Oczc5ejFK?=
 =?utf-8?B?MWhVTVFadllRSGdWMnlkWWlBNjgwMU1wWm1FeVZ0dmJaalA2ejBRVDFiYUho?=
 =?utf-8?B?R2xaWWs5SjRDVWRKNTFqNk96RklYTnRWVkVhemF1ajZHSjRjZlhFWDV5NTM0?=
 =?utf-8?B?VG9WZDJqZ3Bha0dQeTFCRVBjS2NsWVpqTEJPU1VIWERRSWoyNFhoVHl0ZmNS?=
 =?utf-8?B?bkRQT0FGM2NmcTVBK2MwWFA4MDU3WjhueGxUZlc2MFVrWHVEQ3Q1SU9rZm5W?=
 =?utf-8?B?TU5tNEg1cFNvL0xYbjh5TXBQT3lIN3hOK2E0QThiMTB1TGowQVR2TytpZjZV?=
 =?utf-8?B?SUJMV3VmbWhhVUcwQ0RCdytFK2E3ZEUzenNNMW44MENDWDZUK3l2ajNhTU5a?=
 =?utf-8?B?SjNoMU9yeVpVdWkyQ04wNnlld0FJVmc5dktaZm9CV29UR2x2NVp0ZURNVWFP?=
 =?utf-8?B?eGZNOURGSVBzUll1MXdIVTBIOXNpUlZnRGJaRXp0T3ZqUGJUSThDcUw4b0xW?=
 =?utf-8?B?c2s3YmxrNjk4MVYyZExwRDhQamhwM2pKaHVOdTNnR1BReWVjUlI0Uzd3WTJG?=
 =?utf-8?B?RnFlcTFJaEFvaXR1b2hFTFZpVklveC9hSXd1RjZCN0NNV21ORTBGcWpnbmly?=
 =?utf-8?B?VjRNZ2xacnpSdWpYVGxGZWxpc3BBUmdHRUw0WGJHQWNBbG5hRG9UNkFDKzU3?=
 =?utf-8?B?V3B6U0N1clQzYlFCUlc3c3hNRENtM21oR2taOUEwbFhIMkpML2pWcVM3aWtw?=
 =?utf-8?B?ZHpJemxSRWVab2xEelNFQ1kzR2J2bGplbGVuSmRqb09TU1JIdGZDU3JWNVZK?=
 =?utf-8?B?dHZSVGdGUFFvTGZkQ0RpS2gzcHIvekhGL0FtMm0yTHlFYlNHYU9TZjg5VHl2?=
 =?utf-8?B?T0VWSHp1Qk0vTUFSUVo1SkF5cEEyV3F1SWsvRGNFZVNnY1BHVjY2SFFCeG80?=
 =?utf-8?B?cUV1a2ZFWE9MbGsrZ3hROEhaT09SYXdzTFBkR25jUzEwcFl3SHdmdks5UVhX?=
 =?utf-8?B?Vm9VVmoxYTYyODFxRURjbHhwUmxDVUJXYVZWNXFUSFluQis1b0VHUU80ZDlV?=
 =?utf-8?B?bWhOaWIzNVBnRmRkcmRkbGFFT2ttTVM4THlDRDVWS0RpbHFtdjY5dnMyYXgz?=
 =?utf-8?B?UWlFYjFBQVJXS3ErY2hSTFo4RlozK2RPSklVVmhvVXJuM2NNT2YwQitHeGtI?=
 =?utf-8?B?cU4rc2tiRSt6RW51OTlQbW9BSkY0NktjZEcvcDRMaU9aWTg1bVFJVTlDNnFt?=
 =?utf-8?B?cTFCQkprOHVHYkowYTBqMGo5MzBiTUg2U2wwN0ZZSDZHQlNMbGMrOGxZb3VO?=
 =?utf-8?B?dURzRWhaZUprWlBWdFo5OFA5QU5EN1JqeDVTUnlvaE4yRktFZzhrS295ekdz?=
 =?utf-8?Q?pqqlaTPSQTY2/BMTR5+KMWuRt?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89be9622-1204-406b-74dc-08de063c5e7d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 07:29:08.9081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbtM9SFZu4dYWuanG559xx6eeKxUhaCAnVPgT+97R1Z2hK/nxMlbr2gRFLdPa3f+T8OB7e8Jz4FaUP6CAd9JxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6230

On Tue, Oct 07, 2025 at 06:06:45PM +0100, Andrew Cooper wrote:
> On 07/10/2025 5:13 pm, Roger Pau Monne wrote:
> > Add json-c package for libxl usage.  At the same time drop YAJL.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Would be nice to have for 4.21, so that we test with json-c instead of
> > YAJL.  I plan to switch the FreeBSD Xen port use json-c for 4.21.
> >
> > All seems fine:
> >
> > https://cirrus-ci.com/build/5366905441091584
> > ---
> >  .cirrus.yml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/.cirrus.yml b/.cirrus.yml
> > index 7df7ff552222..0de1012d8c60 100644
> > --- a/.cirrus.yml
> > +++ b/.cirrus.yml
> > @@ -50,7 +50,7 @@ task:
> >  
> >    install_script: pkg install -y seabios gmake ninja bash
> >                                   pkgconf bison perl5
> > -                                 yajl lzo2 pixman argp-standalone
> > +                                 json-c lzo2 pixman argp-standalone
> >                                   libxml2 glib git python3 libinotify
> >  
> >    configure_script:
> 
> 
> Comparing before and after, we've got:
> 
> - yajl: 2.1.0
> 
> - Number of packages to be installed: 27
> + Number of packages to be installed: 26
> 
> So, json-c seems to be in the base image, but even that points to it
> being a more popular library and the right way for Xen to be moving.

My bet (I haven't checked) is that it's also used by the cloud init
scripts that are packed in gcloud images used by Cirrus-CI.  It's not
part of the base (non-cloud) images AFAICT.

> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, Roger.

