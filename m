Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A5FAB6936
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 12:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984179.1370361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF9iG-0002Rd-MU; Wed, 14 May 2025 10:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984179.1370361; Wed, 14 May 2025 10:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF9iG-0002PY-Jb; Wed, 14 May 2025 10:51:48 +0000
Received: by outflank-mailman (input) for mailman id 984179;
 Wed, 14 May 2025 10:51:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjT3=X6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uF9iE-0002PN-VN
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 10:51:47 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2413::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c33531a-30b1-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 12:51:44 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH0PR12MB5607.namprd12.prod.outlook.com (2603:10b6:510:142::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 14 May
 2025 10:51:40 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%4]) with mapi id 15.20.8722.031; Wed, 14 May 2025
 10:51:40 +0000
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
X-Inumbo-ID: 6c33531a-30b1-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0h18L1D4Y6n/JIuov0tDnYNuvg6FoIxSGDe5i9Vs14h0rW5RTF04n6FiOrknVnWwLzNX6N+WdL+XtcsXQ+J9hej5rgup5V6DnS+vZULueWygTdvMMrANkYPA4c9Bs2lKW8mCTTO8ipTEoXn8Jz7hFlA57bWtJV4uAauZmkjp4Nx7ueJswcwWer9gZzd+vGGg8VBIVijBzWofmWsfDm6t7fZp+9Iwx5GHE9gRynNxP4zBAtVl9dXsTovFiRGVacPhFU0rtnX53LWi1VAt+jdlGEkLJq0JkWt9HLQwjiBw8hmgzhhO23Pjt4MU5w4gOyUFpJu8MxxlYSGDb6wBMhIiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIHjq5yAZkayvYvPPVAUGfkiWqVNM4CUGFrjqG4ULZU=;
 b=lK98vN/0Q4HORxmyD7H7XAWrk1RRyF0moh5GlEKcdmDk+XHnC5cLOdvbVqjSjCnA8dGiJfZwiHddBWIBDSifwSCMeOUBRD9i6OLGfI72jXR0ODgzpKBwT1fkE8xl8A49gwt6EipbKzzTbhGWWsHjlCKcrwAtrV1ZIupodOrGZuqNhzXSwar7x8qWGdgSBTo2idLReo4d8iJubcPbgFzdyv+e9xR4q/rvUs4Q6mERQPSn6rjx38nq2AC1yEHto1BJOG3rRSDuXAxiOOjBpivfti9p8cTqI4dod1sIzjZOzQzM2DnKzTI2Mgv23KNs92nJFX/d24stwFxQc4+c5aYu/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIHjq5yAZkayvYvPPVAUGfkiWqVNM4CUGFrjqG4ULZU=;
 b=fU9qbazOy+2W0FSMBjiSpy/M5war12tyflrvjZrJVR92ruzRHc6h3WyiJshfShSHZo6pF6chMVu4XHEoVO5Fy13xWVNTIHwT03d6aWG5isIWYZce3x6KxHOYQrk1gvAz/H8pknnraBGHciBTY791YUoBxunpTPjOqrrniT3W++0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c8e9469f-2ee3-4b60-a580-9705f4831053@amd.com>
Date: Wed, 14 May 2025 12:51:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/dom0less: refactor architecture-specific DomU
 construction
To: Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com>
 <a13b414ba19c8928dc7b0e70cece6c26a77d514f.1747145897.git.oleksii.kurochko@gmail.com>
 <0acae8dd-d4d6-4d65-909d-637c4a283ea7@xen.org>
 <6ec7c286-a6c4-491b-8733-42037ba3b91a@gmail.com>
 <44143db1-1766-4851-9a0c-7428dce9087d@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <44143db1-1766-4851-9a0c-7428dce9087d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH0PR12MB5607:EE_
X-MS-Office365-Filtering-Correlation-Id: 7467e6dd-0c92-41fe-0805-08dd92d54eaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enk3azVKcDlOZi9QNVYyc3lWSk9raXB4VkN2aTFjN2RncUptTVcvVU14aVhP?=
 =?utf-8?B?RUh5UG5HY2NGK0M1ZERSTVVHY0p6a0RJaS8vV0xWb1llNHU0OTYxQjBrbWFI?=
 =?utf-8?B?VWJRTzZYeFYvbEo0VDFjUVRSUW5YREgxZ3E1T3p0MWlXMzdDdUtYdTVHRDll?=
 =?utf-8?B?Qm5QZkR5dUFNV1hNQ2RnVEJ5UlVOdktCYWV3ODlySHNpSk5zQ2tLUkhseDVy?=
 =?utf-8?B?WXFBYjhreWxFM05RL2ZTQytBU0g5bWJSQlBmMy9MTXp3ajlZd2NnZ2NIUVFl?=
 =?utf-8?B?bjloZ25ubHRCQWExYjZRbm4vOFVCTnJzbUwwZTMvaDVGaThvS1IwZGtCUm1X?=
 =?utf-8?B?bFFRbjZURUI0cURmcGpsaGFkSTNhNStueTYwMGthSEZRaVRwMEhTUEJreHk4?=
 =?utf-8?B?c2txNnhrTFVJemJZN09RMFlSMGtUb2lzTS93b09WZlFJa3Zad1JxVkU2Z0JY?=
 =?utf-8?B?enN6K3FxT3paVXJjaS81eDFtd0hjdlpkSDlCVWcxMkxYdERFdHlFV1RBYnVu?=
 =?utf-8?B?ZkFYRmRSUWxUUFNjNVJhM0FpL3FCMXdhRGk5c2t4WG5ETEZnWGM3RTJuZURP?=
 =?utf-8?B?czJHbFFPM0JwbHdKSmZ6emYvSjV1ZGkzaG8vSlBidTZMbFE1Q0JyRktDRkho?=
 =?utf-8?B?Nzd0YXlyVkJJTHhmUldFYmJNRHVySVFuWW54WkRMTktrNHBBbEFpSDZFYzhU?=
 =?utf-8?B?N2tPRDVNK3dzRWxXMW9YMUJvWlFqemZITjNUbWZGSkg3THdKaU03bHlaVEdt?=
 =?utf-8?B?RmhzdEhTdFhZak1ycmo2VkQxdm5mQTBSdndKcWd1VXZHZ216ZU41cytnL3Fu?=
 =?utf-8?B?RElHbEZ2ZXpPcFZFdXBHbzR2S3lySzhZUzlUS2c1TERXbFNoeklzYWR4UmFH?=
 =?utf-8?B?SUdwQ1R1NmVIb0w2UGh0cGxCN3RaZStrSTlOY25aOGNBNHYzWUF2QlpvUWdx?=
 =?utf-8?B?bEdJODIyYlVZVk1XOGFMckNLZ0tENDZydVdiVXR1ZDA3S3duRlhRWENaNm50?=
 =?utf-8?B?dDNPd3A0djg5cmNGR3RTdWtYVStnVFpjMkhUVW1pUitDRG81djloNTgxeUlO?=
 =?utf-8?B?QWZIbjZFOFF2Mmo1aG9CR1MvazEzSlZmODJKNmt6TmI0K25oaEo5cFpzK3hL?=
 =?utf-8?B?RDBqVHAyTUJIUStnVE5oQnJQVXJvL2tpelVTTjZTcGJhcjZnOFVQQktQTklW?=
 =?utf-8?B?ZFlnQkdDNjAxbFcvOWZ2OWgraHBKaVAyM3JzWm00NTduc1h0STB1SDVwK3E5?=
 =?utf-8?B?OWkxNExkWEQxeVJaOW4rSnRmMnJXQWFpZFhCV1dVL1l5azNDSU9SVkd5Vys2?=
 =?utf-8?B?NHcwc0NKRnl6MGkrakQ3V2t2TDI2UlRmNFdud2R5NEp4NEg3bU9xWXZ2elNw?=
 =?utf-8?B?WTNwVXg4Sis3a3I0Ly9BSXB5WGg0TWpsVFVTbnptdkpXYjNLb1pGMWZKYnhs?=
 =?utf-8?B?SHlwSXE3UXRZeUIwN3RHQ2lCM240d2YyZ2JiUkZPL0h3ZXhHVkVnMW1KenBi?=
 =?utf-8?B?N0creDFCRUtqckVuTm5CTE9FeDJRRXFQR1BoUHM4cWh3aEM4N1JuV1lySmZD?=
 =?utf-8?B?WVdQOWJQSXg1Yml4VzAxc0Y3NnljS3dOZzdhTGg4bm1EMVVFd0w3dUxYTDFv?=
 =?utf-8?B?Y0luNnVjejVoNmxEWFgxQ0NadXlicU9KbHowa2xYTGhpYW1EbDMyanBUOHBS?=
 =?utf-8?B?U2xkR0R4cjYzekZScTA3RVB6d1lvcHMraGVLdGMzbmgySjVNdEJhUU9jeDJT?=
 =?utf-8?B?ZHlZZTVrRk42MTRiTW5ZRFVZeTU2Wi8rZWF6a1piclE0dVh2dWkvbGIyYUtM?=
 =?utf-8?B?eVdybUJMZysyclEvUEVrZE9EZWFac1hHOXpaSTF3NFhOcGplY0lXWHkzVDMr?=
 =?utf-8?B?SUJtYUdGaXJDRGZkQ2pYNCtadGZHY1RQWG5lNXNBcitNRjVYd2RHakNwSlRW?=
 =?utf-8?Q?rBQLvP3U6GQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEdCamszMlh5QlBqcVpHSUMxL0pKaEtHRVo4VHVvaEJsUE96VkwyOHAxamNq?=
 =?utf-8?B?N0J5WWJBTlNXWjhjcDlRcXJiWlIvYzdNalkrZlJnMjlxMFRCTEQvMjlWckpZ?=
 =?utf-8?B?VFlxV2ZjS0pSNzR4d1kzUGV2bmw0dEtpTVBoc283Z2lTRFJDbEs5TTAwcDlL?=
 =?utf-8?B?OVJ3Tm5Kelg2bVhrcUJMYWFoK0p6MHVCVWVJUUExejBxRXMzM0NTcGxnajFL?=
 =?utf-8?B?UUpRZjFLd1FleUVmTUFsQlR6OXpRWWxpbUtiNHVlZnBrWmhCOGRYbkp0eEJy?=
 =?utf-8?B?cHpHYitnSEpHS0NocERnWVY1MUQ4ejZZd0FNa2RST0lqOWdvRXVtMGFhd1p6?=
 =?utf-8?B?R04wdml6N0Rta084QzcvUWk3YW96U3F0ZUVVeFA4Q2F1TDdEaExXOEZDK2I0?=
 =?utf-8?B?bFdhZ1NCOVBWK3BHSFZMZ0NQcVVXRE83RkM0SXIyMk5RWmw4ak9EWTNiS205?=
 =?utf-8?B?ekFUWXNLSXpIMmJ4OUxodndUQXJHRzdzYStJNTBVY1Zjc01FaGw5Q2lBQXhp?=
 =?utf-8?B?NE93TEFiSVpaa1UxWXYrd2JPTXVnOUpzRnZKUGRSYUxBSmY1citvQ2VQc1Fk?=
 =?utf-8?B?Q3VPeWpyTks0YWkzakxHSHV2bzZtT0JMR0FDSFB4dzVoSGJtMk8yQ2VyeWFU?=
 =?utf-8?B?YmhVRkZ4a1BGWlRyZ1ZIZ3QzNmFYMStVa01wUFl6TEtjampxLzAzdlNtcjFT?=
 =?utf-8?B?UEZqblB1UGh1SG90cXBUdVRKUnpROG1IZFg3elk2YUZPS1VKV3BBb1ZmMnRy?=
 =?utf-8?B?cm44V3R3ZHl4Y3BESVdzQVJ5MGdPTjk5MTJZYWJ0L1g3OTViRWJMYjlEV3pL?=
 =?utf-8?B?V0xCTUk4TW5hSmdlaThZcUtvcHdTTlR2Zmx1d2ZGdFRSM0tBQ0FqZkdobGdt?=
 =?utf-8?B?TmlRMmZuSmxLZWZncmRtRHBoSTRwcm5sdjRkZXp4ZENJWHdhNEJ5NnBiVHhM?=
 =?utf-8?B?cmxidnFjTm41MFU0V0NYanNDS3ZIaHJkR3JyNGp1MHp0dzFtOEdSb3pWOS8z?=
 =?utf-8?B?ZllXY0tGUFloQ1oyQ3lUeksvdkdteCtVck1yZGZYVkE2NTJneXBtM3BEQWRG?=
 =?utf-8?B?dUZoNmR0U1hPSXRDWTgzVWU1OWpTbnZCN3BzYlZGT2J1clNmU0RBb1p2V0la?=
 =?utf-8?B?SGxmSVRmanF2YTVpNHhaalA0Y0hrUVhLYWtBVjI4YnhIa3lZanhSeGFabmRD?=
 =?utf-8?B?c1pzUUxZSGNTRTlOQllTWjdFMjcydkRUcDJ6VG82Sm1Wc2d4Tm5kTWJhNDYr?=
 =?utf-8?B?Q296c3NLS0lTMGFwZWtVRU02VTF1SWt5elRhNVdza3JPKzh3UHNNc1laOUVq?=
 =?utf-8?B?QmcyVE1BeFFCOEdWLzZ3bjgxVjZTZTd4SHRVUElabnpVRVAxcSsxak5BTGQz?=
 =?utf-8?B?OUg3WmQ4cU8wTlJXL0F1ZkFCcURCTDFrTGVFNDBtb0FFVld3WEd1dERraVUy?=
 =?utf-8?B?V3NtU0dtaFAzWGtHYWVuQ1ZaWFIrUG91dXAzSVBKWWRDVjF1TGZnQkVjeXln?=
 =?utf-8?B?NW1NdzJVSkljRHBiWjVUV2JRb2xGcW9HT1BIS3d2VkFFNkdkQk5jQkRsMEVk?=
 =?utf-8?B?TXFJdUNQOWgvd0Z5N1QwRm5XeW9tRzZMUVo5VlV0UmJzQlNmNzBBQjBYUEpv?=
 =?utf-8?B?dkdyam5VeHExUzBUbzVDbHdiWlNMSTVmSVR6UEhESVdESk4zOXZjc0JrTnZH?=
 =?utf-8?B?K1g4UXIvSzd2bTVydHUwUEJPbVdCVFVZOUZpcWFKNUtWS01vUkVtQzl4cXdx?=
 =?utf-8?B?bmZ6U1RzWmNUeE05cFlqeW9QNElnRzhmekRZaE8vTUlEanR2MlRyamFMQ1lO?=
 =?utf-8?B?clgrckJFYmFzdUpnM0FCUmhiYTZLNmdIb25IekVIMExncXZvd3J4Y0hnckNY?=
 =?utf-8?B?NHU0c0hBOFk0R0U2Vi8rSE1kRlNHVW5uem02OTgwUWZ4RmYyQzFCTEpGMjRI?=
 =?utf-8?B?a3FWOXNPZ2hOWnR5M3NEQXpnN2JYY3ptZWlRUnhtTG1sbXZiakJuM090Qlo1?=
 =?utf-8?B?QXBTcEYyYmN4MjJ5ODFkSnIvcGVPUzg3cDRUNFE4eGFXRXhqc2RZVFdsTFl5?=
 =?utf-8?B?Rjl5V1RSYmgyUGZnemVldkFRQm5kTWtNQ3h5eVo4VXB0c2drMUdhb1JtMFJN?=
 =?utf-8?Q?0j22kfzVFcbW9BVQBAfNKDK7m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7467e6dd-0c92-41fe-0805-08dd92d54eaf
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 10:51:40.4229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNRbS6mX6P6HJTE3XTMp9NXkLJvwaZqF8L2Et0C8KHrwP5viIg6kZcfLOa0TUuHn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5607



On 14/05/2025 12:06, Julien Grall wrote:
> Hi,
> 
> On 14/05/2025 10:57, Oleksii Kurochko wrote:
>>
>> On 5/14/25 9:25 AM, Julien Grall wrote:
>>> Hi Oleksii,
>>>
>>> On 13/05/2025 15:29, Oleksii Kurochko wrote:
>>>> Refactor construct_domU() to improve architecture separation and reduce
>>>> reliance on ARM-specific logic in common code:
>>>> - Drop set_domain_type() from generic code. This function is specific
>>>>    to ARM and serves no purpose on other architectures like RISC-V,
>>>>    which lack the arch.type field in kernel_info.
>>>
>>> So you will only ever boot one type of domain on RISC-V? IOW, no 32-bit
>>> or else?
>>
>> The bitness of the guest and host should match. So, an RV32 host should run
>> RV32 guests, and an RV64 host should run RV64 guests and so on.
>> (I'm not really sure that on RISC-V it is possible to run with RV64 host
>> an RV32 guest, but need to double-check)
>>
>> Therefore, my plan for RISC-V is to have the following:
>>    #ifdef CONFIG_RISCV_64
>>    #define is_32bit_domain(d) (0)
>>    #define is_64bit_domain(d) (1)
>>    #else
>>    #define is_32bit_domain(d) (1)
>>    #define is_64bit_domain(d) (0)
>>    #endif
>>
>> With this definition, there's no need to use|(d)->arch.type| for RISC-V.
>>
>>>
>>>> - Introduce arch_construct_domU() to encapsulate architecture-specific
>>>>    DomU construction steps.
>>>> - Implement arch_construct_domU() for ARM. This includes:
>>>>    - Setting the domain type for CONFIG_ARM64.
>>>>    - Handling static memory allocation if xen,static-mem is present in
>>>>      the device tree.
>>>>    - Processing static shared memory.
>>>> - Move call of make_resv_memory_node() to Arm's make_arch_nodes() as
>>>>    this call is specific to CONFIG_STATIC_SHM which is ARM specific,
>>>>    at least, now.
>>>
>>> This looks shortsighted. If there is a plan to use CONFIG_STATIC_SHM 
>>> on RISC-V (I don't see why not today), then
>>> I think the code should stick in common/ even if it is not fully usable
>>> yet (that's the whole point of have CONFIG_* options).
>>
>> We don't use this feature in the downstream repo, but I can imagine some 
>> cases where it could be useful. So, for now, its
>> use is purely theoretical and it is a reason why I agreed with Michal 
>> and returned back these changes to Arm.
> 
> I strongly disagree with this statement. If a feature is not 
> architecture specific (like static shared memory), then the code ought 
> to be in common code so it can be re-used by others.
But the code is not common. There are still 900 lines in arch spec dir.

> 
> Also, AFAIK, the bulk of the static shared memory code is in common. So 
> it would be rather easy to add support for RISC-V if we wanted to.
> 
> Given the code is already in common, it is rather silly to move the code 
IMO it should not be made common in the first place. I don't like exposing
callers with the big chunk of code sitting in the arch specific directory. My
opinion is that they should be exposed at once when the support for other arches
appear. Today we ended up with caller protected with #ifdef and the majority of
code in arch dir.

> back to Arm for then moving back to common potentially in a few weeks time.
What about static memory code? With the recent Oleksii code movement, the inline
helpers like allocate_static_memory() became unreachable when the feature is
disabled and the main purpose for helpers was to avoid ifdefery.

> 
> So:
> 
> Nacked-by: Julien Grall <jgrall@amazon.com>
Ok. No more discussion from my side then.

~Michal


