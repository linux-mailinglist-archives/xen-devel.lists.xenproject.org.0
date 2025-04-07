Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AABA7E2B9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 16:55:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940279.1340107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1nsY-0007In-8o; Mon, 07 Apr 2025 14:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940279.1340107; Mon, 07 Apr 2025 14:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1nsY-0007HG-5Q; Mon, 07 Apr 2025 14:55:14 +0000
Received: by outflank-mailman (input) for mailman id 940279;
 Mon, 07 Apr 2025 14:55:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LsCM=WZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u1nsW-0007H9-Ho
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 14:55:12 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20610.outbound.protection.outlook.com
 [2a01:111:f403:2418::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c8c39bd-13c0-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 16:55:09 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 SJ5PPFEB07C8E34.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 14:55:06 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 14:55:05 +0000
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
X-Inumbo-ID: 4c8c39bd-13c0-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktTA9n74uMDs18plg4sd/ARFWJwYPOAHutjq0c9+H3oIjC32KnwYZ/LuJy9SelpEyOKyTv1pcqbRuPzzaJ/sk1/or5Y2PmJcoKWEW9Cp0ch/UoJ+rzNokgmHt48vtO9ElOwgqc92YT39C14H+9w5i7tj3+HU45Z3Tv6KJ7Th9oAuBbg8rmuJc32gDkEh6GpIfLayF2+Mj9BPKv9l2EUqS9xTo0RQ5B7ALFV64AxgddYXmgCxIi4RUf4OUKXBbhe1MP+ztw/1xZHsAZJJnJv+eOiYrZNlWOc1QQgshE+UkibY0K+JdfWPCEN1DwJASexO6RUDZ+lyjN74e0jA3nq5gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rEJ+iPxXAe42dA7L7BcAV0Z4z1NmDsa561fHV6Pp0w=;
 b=NzgKmwY+vaq56tHC1qIT8f1bz0HCWUospGh0h3jIj5nVtjcQ/O+yb0UFI+aTutcb45n59oUiy/Sw9mzgfCSb42z7PzviqLDJoDmL6UpHNQKDP4Lr1iVesaqqIhVjZf0IA2EvJYqGM0JeqAk1loNHKkHzawDd7qaVUEybMn/yPoN0ZeW5G8HoEXSfOteaj2K1SVlKwFJ/pb8kIjhD2gNIMqOro8gFwN8Qf363dPKkiSRPpl+JUJSseEFKILWdulHDIbcLR6UGyLhwyDs4LLfAkuMYURDfu5UCcy6jkAyWsJV9Rv/M/PvzLK+X2iGsah2X70Vh75BuyaU2n71PwZ1YGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rEJ+iPxXAe42dA7L7BcAV0Z4z1NmDsa561fHV6Pp0w=;
 b=IpcOW1pm0ubgVLHvZc+Lm4pjIMqp7OM/frb+cdrip6W61ustiEuekrfp0rh3PQ6oLenvnWDgw9ww0oNW3O9us/Rf7HGUjYaiVltncIbwlvEmGHm05ilZBIncJX8PIk7bJ61qez9ep3UKAcSJXebZZiZetgXPUvK4N19Rfqe0rXU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4ae55251-38ed-461b-ab7a-1d1bce1f01ab@amd.com>
Date: Mon, 7 Apr 2025 16:55:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] xen/arm: Move some of the functions to common file
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
 <20250403171241.975377-2-ayan.kumar.halder@amd.com>
 <45d47205-409c-492a-9841-3b162c05ec09@amd.com>
 <0ed34b41-0cf8-4bab-9304-d6c3f2ec276d@amd.com>
 <8C708752-ADB1-4904-ACCF-FDDAD965FAE3@arm.com>
 <4a88cea0-83bc-40ab-bd95-4acd2ce4ede5@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <4a88cea0-83bc-40ab-bd95-4acd2ce4ede5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::6) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|SJ5PPFEB07C8E34:EE_
X-MS-Office365-Filtering-Correlation-Id: 848b5035-3660-489a-e334-08dd75e42ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUZ0aEttWTZDRDM4SWZQZkdGbDFqQ010SFlGYTgxNEp1SnBJY1MzQXN6Q0Zq?=
 =?utf-8?B?N2FxNFRleVpmY3o1U0M2OThQb2toc3hTT3UwQzBMWHFiZHBuMFljWklxQ0VD?=
 =?utf-8?B?d29EWW9ESnphMGlRZkdTN2FVZ0VTeUdLU1hwQ2dVV0ovcVY5K1IzRUxZZlhS?=
 =?utf-8?B?M1QzbTR0cDEvYjBJRmFoZXBtZUdPN1FlNFdySks1NysvQXM1dnNpaGdCQmFY?=
 =?utf-8?B?TDhHNS9ybUNOdFVRMUl5aW1yRGhLeE5vaXpOQlVBYk1qQks0VktLemtNVERF?=
 =?utf-8?B?ZE9IUmVaN1pqVHo5bDUrNnJEczdUUlZXL1VZbmRTc3orTk80M2xnSEVseFls?=
 =?utf-8?B?SHdRQndUNmJPZ3N6dzNWNlczcndYcTVXK1JQOGhOVSsxWStFWWxRUmg4K1V2?=
 =?utf-8?B?MGg1Y0UyTWtXRVhNODQ4UEJwYk9SeUhOb2FRUDU4N0NmOG5QdTBBT2xPbzhz?=
 =?utf-8?B?K1hvVDBaL2ZkeVppOG1hdEJCMGFkcm9uT3pKcVJFamhuR2Q0Rm5GOThVUnhM?=
 =?utf-8?B?a0N1M3libGxrN2RnRDFmWUJEQUIvdmNkWGRFeWdHdmVrZWNWenpTOGt4MGpL?=
 =?utf-8?B?VCt6ZFNrYTk3NERpY2Qvb1BjZ2tjYVR6aTdhYkRoNVNWYThqODNvR3dHWUV5?=
 =?utf-8?B?SU9XWEJjeFVmdXY0cWUyc2FOKzlCSUc4bXVOTXhhRnhrZXdnRkpzdVpQK1Zp?=
 =?utf-8?B?Q1puUWQ0eEt0M2xFbWNkZXd1MEZpTWZPT0pTMVkyQlJIK21ndW53TWFpcDho?=
 =?utf-8?B?MjllNHFBRE90SWxTdUJQVGNLNlZnZ2c2OGV6RWJLcUJZMDF3dHJHK2pKTzI0?=
 =?utf-8?B?TkdKVnFXeDdyS1RkMjJrSW4rQlA5cDl1ZlJvSDYxVm9uMW9LSjdicDVta2RP?=
 =?utf-8?B?Z1FSckdUNDg4U01oTzdrZ0dQTkdjRkhDNncwcnZiYVZ4S3kvakNkZzZXcGhQ?=
 =?utf-8?B?SmhjeitzVWNpQlA3OThpSENFclZZcWIxTUtTTTlzY1dERkJXQU9yVnVwS0U2?=
 =?utf-8?B?dnoweVd2K0JBbUgrbHZGN2IxWGMvWEd1WXlJR1lHTHZkTmU3b21KZWZrTnda?=
 =?utf-8?B?T2lPVXNxNzdkc2hESFdXR1JvM0txRE1VUzJPbGJoSHV6RE5Tc2NrTlB5MFQr?=
 =?utf-8?B?SWlXZStnMWZiNUpLL1JTYlNrMHEzanFrK1h3eUs1Nis5VC8xYU5jZW9GQmN3?=
 =?utf-8?B?U1M5SDZuYzIrcXRQcEhYZEFQMWhTVjNXLzg2eWhHOGxSTHpPdGhZbFA4MTRi?=
 =?utf-8?B?NkhGUUg1T1FpdCs4YnJ2MFd3SHVlRitPMHpQOGhPN2pFZjBweXFPZWxzNGxR?=
 =?utf-8?B?YUZtdTFpMFM1RE4zNUd6azYyZktYTGxwV0JrNjBxZkplSzVqNHhvWWhQNGRu?=
 =?utf-8?B?Ymg4OVhZZk9XOWQ5V3RBbSttUVFRWG9jOVdYN28wSVdnYkhvQzQrMUNLUW5B?=
 =?utf-8?B?Wm1zSlNmSWE5T2Z0Z2NkazhvYjJzQkFFS3RTckk1U1VjcU1KeWllc2ZPazNo?=
 =?utf-8?B?Z3hQM1BsWndIVVNlMTl0UkFtV1hxcmMwTllXdWhtMEx1TmNMenBFbmtkbzB2?=
 =?utf-8?B?Vm03dm1IRVo3cmprWlVDaXJKTEdnaGVza2dEM1dXSFk1T2FNdEk2bS9rNlh6?=
 =?utf-8?B?RkYyRzZXUUx3NmtFbVpLKzNYcU1mV0phVCs2VjIzTnZYaG05d25kRGFKaWla?=
 =?utf-8?B?c2s5UnhnbkJmeXFZQVNJOXNpRTZ0dnltRlp2SUpyTlV3UituejJCUjR4dUtv?=
 =?utf-8?B?ek9yZUtOY21zODA1bmZzTUhJU0Y2cGJYVmVETjhyTWJFdkZpUTJGZlZxTnVz?=
 =?utf-8?B?OXZ5aU14Q2cydXd2V0w4aEVYR3ZuT2d0eUlBZTlqNUs0VXVHekZhblF6U21w?=
 =?utf-8?Q?PgaqfBvLq3bvZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnlpaUJHRndrbkQzVWwrTklHdGNEWk45ZTJXMGxtdHd4TGJQMUJjeGl0alpD?=
 =?utf-8?B?VjA1NHZ6L05ZSDIrQUt6bDZ0N29UcXRINzI4a014WkdGcmtEUU9zWFBLTUJi?=
 =?utf-8?B?SEpJWUZSRmxocHBEMWpJYWd5RjVqR0NOanpNR3Irbm83cG5YQVJhMmsrNHFv?=
 =?utf-8?B?ZXhsUnRxaTdLQjJZVEJPZlhKR01kTjRla2lheERMeVZRWC9ZSy9tMXI0RDYw?=
 =?utf-8?B?YmlaMlI3cWNmTFBCNnBQUzkrU2E1M2pYRVhNSzV4MHpxSkF6YWlnUVBOV29Y?=
 =?utf-8?B?Sm5FYVB3ZzVMcXl4Z3NWNHM5RE1rbzc0UmdOU0FsYWhiS08rNS90K0lvT2tU?=
 =?utf-8?B?MDNacmEydExXcldMUFdkMzNrbjZuR3U2dmhCNTN5UmhQZ1VmRWxGV1hOZkpt?=
 =?utf-8?B?T0gzVjQ2SFBlWHJxUzM2YzEza0VOd1k4aEJueEc2bUlSTit3MkZKVUVlbThL?=
 =?utf-8?B?S1R3TFJzODBRS0RvbTVnL1JPakxWMkc3ZGYwdU5qM0gwdXlFYm9yM3NZOTBO?=
 =?utf-8?B?eWN5QmsyS3lLZy9pNS9VMEdvZHhHOXM5MHd0KzhES0lFY2N5Qkczbnd5a003?=
 =?utf-8?B?ZE1VZWtoRmxBSVBNZDNUckpYZEIvalZjYlg0ajkzYkxIbVkvMGx1eXR1eldX?=
 =?utf-8?B?aFUrSWNRYkFnV0FYNllkTjhnTHQ5WHFuenNJRGhoQ1RPdllwSDR3TWE5K25V?=
 =?utf-8?B?bG43bHZNc2hPVSt2UDY5RFNLWndoOHF0R2Rod2pSTG13VENIYWl2R1lOQVNT?=
 =?utf-8?B?N0xUNHNUcWxVbjBsQWJvYWU5eFN6WWI4ckgvSHpEelhYcUpORGs5ZGxFMWo2?=
 =?utf-8?B?UHpEV2p5cEFQTmhKT0NuZk0vcXJiNnFvZjluSCswSXJPenUxSjQ3RmN5R2pJ?=
 =?utf-8?B?WjRCZXhiSW80dGVWYW9YWU5kQkdXZUprdmJZKzBGWWdlMnMwdE5lSzhVa0Ez?=
 =?utf-8?B?VTJZL0tQVGdqZ1k1OXFrZkV3RUk3MlBnSjBqR0pHNVM2eDcybTVOUGlNcGhs?=
 =?utf-8?B?Tmxtd1c1U1dUWlE1blZpNy9vVFViWU9ORFdDVmJ0TjJpZURuTFJyNjRMRWpY?=
 =?utf-8?B?WmJQNG5icTJ1cW9xQWJwRGZldysrcmhRYlBZWnNxMkJDMStoUVJueFZxbEo3?=
 =?utf-8?B?M1FaTytOZ0FtWkg4RHlFbXNYYnBhVHEzZ1dlVlhxOWUyQkVkMlhOQW4wQzEv?=
 =?utf-8?B?aWVEdm5pMmdaejhTTldXZHNzY3pjT1dOMzVZVTNyRkNwUzJJOUtCcUhiclNm?=
 =?utf-8?B?QWNibHBlRVlteGpNMHhaVmJwZ0NFQmNDZjVpazRqeURpM00xTGE1VTBnS1BQ?=
 =?utf-8?B?bGJ5VGtON0J6WDNUcW9BMmI5aGhXamxQeExOQnFwUUR4YWJ6VXlKU1FRSFM3?=
 =?utf-8?B?bnlmdjFTUGFheXAwQ1hhakR0dmVQR0wwS1U4M1dvNWY4R3RRbHdCWTF6NnQr?=
 =?utf-8?B?c1RuODNpMlZiUzlkWHFCbHcyZCtKcEhxYXZPU0NrQnkyQXh4Wmx0akg0NURR?=
 =?utf-8?B?N05JSEVjRHVaT0Vkc0dCNXZrK0dQc1RZUmNQWjZWOHkyY0hvVElaVU9GU0Y2?=
 =?utf-8?B?WmpMbUorR3ZRZk1qUGdYYlhpTjl1UlFZcGVRSjZaUWZFY0ZRdWtRVWI1ZTRJ?=
 =?utf-8?B?dU5GY1NBYzk2emFRcnhaTllycG5jRGQxTlp5TUZWY2oxTzJmb0pNa1pPd0tV?=
 =?utf-8?B?MWpnNDVZdlpqMkNWRFk1aXFxV2NaUjZOUHVjRVpiWlgrU1IvRndJS2dRSHZP?=
 =?utf-8?B?bHQ2MXpMVHBXSGpGSnk5RzdUUi9WRE1KNzlQcGlDL2pEWDQvZ0VmZHVnSmlC?=
 =?utf-8?B?ZGJpWkdRTysrN0ZHemtvVkgvb0w5NTN3c3hVY0JQMk5WZmhmTnM3aVdjZ0Qy?=
 =?utf-8?B?YkhMWUtJUlRzdDNFRGd5cXErYW5NOWRwODZUdUpyZVJlODhXeVNFalQ5Qjhn?=
 =?utf-8?B?K1UyUk9KTnVjQUtTbTlNdHZGNFA0TEpCQ3ZmSHpJQk00ZlBjb2M3UFloMVRy?=
 =?utf-8?B?L05sOXB4WGJIUXhqYStFZnlXa2Y0SExhOWVZN0hTSGMyZjJWU1UwelJhZlU4?=
 =?utf-8?B?cTJ0S1IyczQ4aTNPMUFzbTk3cVEvZ0VWRXNhOUZhVVBwUjJISm1mQmFSNG52?=
 =?utf-8?Q?DgFIAj1043w8ImqMe4CPRgg32?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 848b5035-3660-489a-e334-08dd75e42ec0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 14:55:05.8744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/pSu/OiCapOJtX8IbHY9Y97AwTVvEPm0PW3BHVTbqpMK0xi/o4gBqbz5M50gx3t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEB07C8E34



On 07/04/2025 16:07, Ayan Kumar Halder wrote:
> 
> On 07/04/2025 14:31, Luca Fancellu wrote:
>> Hi Ayan,
> Hi,
>>
>>> On 7 Apr 2025, at 14:18, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>>
>>> Hi Michal,
>>>
>>> On 07/04/2025 10:04, Orzel, Michal wrote:
>>>> On 03/04/2025 19:12, Ayan Kumar Halder wrote:
>>>>> Added a new file prepare_xen_region.inc to hold the common earlyboot MPU regions
>>>>> configurations across arm64 and arm32.
>>>>>
>>>>> prepare_xen_region, fail_insufficient_regions() will be used by both arm32 and
>>>>> arm64. Thus, they have been moved to prepare_xen_region.inc.
>>>>>
>>>>> enable_secondary_cpu_mm() is a stub which is moved to prepare_xen_region.inc as
>>>>> SMP is currently not supported for MPU.
>>>> This does not sound right. If you want a place to keep some common MPU stuff
>>>> between Arm64 and Arm32, you need to come up with better name for a file. SMP
>>>> has nothing to do here with preparing regions so it feels odd to have
>>>> enable_secondary_cpu_mm stub there.
>>> Can I rename prepare-xen-region.inc to mpu.inc ?
>>>
>>> Julien/Luca - any thoughts ?
>> I would say we leave the SMP stuff out from the common file, at some point we could start working on the
>> SMP support and maybe there would be difference between arm64 and arm32.
> Do you want to duplicate enable_secondary_cpu_mm() in arm32 and arm64 ? 
> I am fine with that.
+1

>>
>> what about common-cpu.inc?
> 
> Sounds ok.
common.inc should suffice. Let's not split hairs.

~Michal


