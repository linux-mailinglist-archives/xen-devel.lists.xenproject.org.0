Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44594CD94C2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 13:37:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192562.1511708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY1dF-0004Pi-L9; Tue, 23 Dec 2025 12:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192562.1511708; Tue, 23 Dec 2025 12:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY1dF-0004Nm-I4; Tue, 23 Dec 2025 12:36:53 +0000
Received: by outflank-mailman (input) for mailman id 1192562;
 Tue, 23 Dec 2025 12:36:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mhFC=65=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vY1dE-0004Ng-5M
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 12:36:52 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c847bba-dffc-11f0-b15b-2bf370ae4941;
 Tue, 23 Dec 2025 13:36:50 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8373.namprd03.prod.outlook.com (2603:10b6:8:32a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 12:36:43 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 12:36:43 +0000
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
X-Inumbo-ID: 0c847bba-dffc-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZoOVGvvZKF0/ScdPnBHKuckhtXthjCFxE+56VF29VvORQfFMZRc7rwOu0VdEBK6iWBjBIN0e5wZdncFEB68+uAouN/SAUqgLu0ZNGfAU3y4KTOGELB7NEwnhJ2/vopOo92osFtFzbXQtsUOd+W6NDrKhZodvaehqeFiWQPFD7ljnpFEQ9pjK+e0+ENNmCNRx7kib7+fFr4+0rlB9GkHM2OeD6ActrIt3QDaOM4S4Hgk+9/3n9BuTJ3hmLpyr/R4a2Y3YJpqE0UJ/9j7DBQ3CmHV3N55jpnXJZrAnLO2IoooD/VxBdvtHYOlKMMleztzWcxDYWMok1Qnn0UYKWHqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eccSa/J37gwASMRRFlnVVl3pc7ECyxKGqkatMbHQqaQ=;
 b=FrMwRVAhCL8HLFrRGNFyestASPYghV+UzmxgUKo9Iek94poBmZa0L3bA+fQIBPOlt+XYI+4NQTIQCEBKnSooF7TovuHCABSstLdXCxPRR8as1cW7OPxPvhD3Qbo5oHp+artAmkSgrsv9zj63NW9hk+1qaab4KVLvRHB+Z8HfeQHjRAKyFxd/B867sBBDrqZ60x7resg8gThpoUNw1Cih7w5y1RKoWxRqzf/ihPikIOapuS01aogFtjG3eAE2c7eSyfH8eWYwIqk+0+WkmiS4o7wthSj7Aw35hM3QOCMBMR++yfBulo/84D5ZZFdBnNdwW5sbJfw5mBCtLeR3lWiSoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eccSa/J37gwASMRRFlnVVl3pc7ECyxKGqkatMbHQqaQ=;
 b=wADOQlQVafDmh2sbKW7QvyleQZug/fBihchkhRNWLDZ452mhuXU+gCYvsFwP8Y/xhTkCmEHn3C+xDGZeJuzldHsI4UGNaNmQ7xeqoXD3oGDEan/IZaT7dIh3GEsU4JFVYyLx+yt1FHn2bftX2HJe9XeYHAaEpcSvVC2p7y7QGK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2516cd03-7a66-49d9-9414-fe39aee74fae@citrix.com>
Date: Tue, 23 Dec 2025 12:36:40 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/4] xen/arm: vcpu_vgic_free() updates
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1766404618.git.oleksii.kurochko@gmail.com>
 <17d04a2ba8211408cd188891a301bc521cac3bd5.1766404618.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <17d04a2ba8211408cd188891a301bc521cac3bd5.1766404618.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0415.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: c06d840a-604c-4ec5-3e06-08de421fedca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXJqYlJ4UWJKcFRzQ2lWNXpERWRXMTRyQjR5bjV3ckRtZlIybW5RK0F4ekpj?=
 =?utf-8?B?MlNRTzJjYXNha09FNG0vNllxTElhL21NSVpYQXA4YXhNNVFJMlJodDViaWt2?=
 =?utf-8?B?TDlXRXFTb1BMWDdWcU9IczNMYmMwZWZmQm10NDBiamFEM2pVS2k2YnBEelhC?=
 =?utf-8?B?YmU0VHVCa3Vid2lENmRIbjdYOENtelBlSzB5clZ5Rm1tWVhnZ09jWmw4d0dX?=
 =?utf-8?B?ajV5T21MdW8yeWN3SFg3bEFqVng5Zi9ER3pnaXR1Zmd4Szd5NUdMQmlYWWFy?=
 =?utf-8?B?bDlyWU82Y3BjOW1INW82d0V4OGhPR3ozbFY5THF0UEFBOEhKeDB0Umt0RVkw?=
 =?utf-8?B?ajBqSlRFNW1pQUlzNFhkYU1vNTQzRVpHYUlpTC9PZFdYdnNxRUNTRklXakZs?=
 =?utf-8?B?NVlGbkduYTFXaHZFZzQ1b1Nad0x5RVFYRmhoYWFsNytlUGtUUFVlaEkzTUEw?=
 =?utf-8?B?b09tZ0RualZ0ckVocHFCdWVuZGlreTQ4TXhLUVo2K0hhR1ZWVjNJemZhMFZX?=
 =?utf-8?B?TnUvc2RzdmlTVU52ajZ6SWU3NExXd3FGRmd0dkdHMk8wSE90SkZHaXgzODNU?=
 =?utf-8?B?NFRoOFpVeWk0NldXOUo5K0xDWlVKeWw3SThhNGZndVdreDdqblh6b1N5cmk2?=
 =?utf-8?B?VERtZUUzNnBNenVZV2VvNVNqOUNZZFRmSGU0N2xIYVlNK0NTWjY1TEpLZXFK?=
 =?utf-8?B?L0lPV3VTalEyc3kwdTg5Wi9vK3dpWjFweXlPNmIxTzFhVm5Ub0tsbXpseGg5?=
 =?utf-8?B?RE5oUmZhYWpjR3Y2RVI1L0lsV3lUV3hTU2NsVDZ3THFaUTRUcFBtL0VLTGIw?=
 =?utf-8?B?d21Pam1lNXZyaDl3WnlSUXRkak1UN2pFQnJjekVQT1B5Q20vZTgwVUIwU3Yx?=
 =?utf-8?B?SkhsMkFmZUZaeW5DZjI5YmYxR2xiNW4vQ0dEbURrbmNXWDV2MXFpdE1YckxC?=
 =?utf-8?B?c1BvTnc5RXphOUdRbWd2TEt5QStjbklDTkY2RE1yU29rMHo0RDVQbGFsNlRX?=
 =?utf-8?B?Q0pLTThzajJBWnZ1azRYbGZUSkhDamdaTVM4ampHZnJwZHgvY1E1YlU0NkpB?=
 =?utf-8?B?V3QxSnhidmgzYWRxRUdvSXc2Q3JyRUt3UDMzaWwzTHFsSFhoM3ZpeUJMYURz?=
 =?utf-8?B?ampqcmpGOE9mVlMwMHNFK3RGc3NMOXdrcmFsZXUyOStDV2M1dzdycnAzL1FN?=
 =?utf-8?B?VVZ4WnVTSTl3NVVYUjRNSFpQQjM5bDY4enIybFpMUm1NZWV5ZVBCMlpBTnJk?=
 =?utf-8?B?NG9oTlk4NUZ5SXVibEtiUW96dlpVOVc1VndNV0JuWnlaQlcwSzdxT0IySDYr?=
 =?utf-8?B?TFg2MUlzZlhrRUF1bnBBR2Jhd1Q1Z245dW9QZ2VqSDlOemJzUFpudzdqR0Yz?=
 =?utf-8?B?Y0FJQWI3Lzh2dE9GeVBUeGI4WXVVMVBQdTFxQ2RaMmsyay94MldsQkpMVDZi?=
 =?utf-8?B?U0FSbWdFL1pZKzN1SDYxZHZxL2pmczNCcjA1dUg0QTRldkE1Zm9BQjV4MS9n?=
 =?utf-8?B?UmhCMDZqdHpmRTBmdmZDNys1bUJMWjd0SFdOM0M1Q0NNZHFoaGIxMHhyOVhu?=
 =?utf-8?B?U2twQ0dCQlFDbVdLTUo4Y2RQSXFRNVZKbnB2UGp5UTFkL29NL1p4YXcwVjBE?=
 =?utf-8?B?Z2FYOFdYZkZUTmZCcS9adHNhbzRiaWJlRnFZaXcrVTI4aVA4S09BNStLQitS?=
 =?utf-8?B?ay9yVmxwYjFOdThpRStKMjFJR2pXbWhJZ0ZvS1IvVlVPUTBVYU5qbTR4M0ly?=
 =?utf-8?B?RzNhakc3MXJwUjdmeEsySDFvbmZPbUJ4WDdDTzNQYnRmNEpmU3JwZzhuOS9w?=
 =?utf-8?B?WVJGbG5jS1BKSUQyS2NxQzN2QWx5MEtXaDVUVVdtRHExajQvRXBuMjh6WTFt?=
 =?utf-8?B?TGd5UFVncHVCS3BCSFFiaFVMbEZUTXlZM0F5NmJKTnR6TktiZ0N1WDVrYk52?=
 =?utf-8?Q?2wL0p6XF+pWEFqjxDSxdw/LsQfcIsWye?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3RJYVc0dlc3R1FIaGhiSzRSanlBYlVSam0zY1o3VE5oZ3lJS1A5Q2x3RHZY?=
 =?utf-8?B?aHdqalJGdTQxRklJVHYvRWFNcGNha0FENjJOZlc3TGRib09BSEhoeVdSQjFP?=
 =?utf-8?B?M2pCVDFlc0l4WWxqWlZ0RCtiaVZXQUpFM3V1d0daWmdEVWxFR2dKN2h0VkpS?=
 =?utf-8?B?QUo3RU1obG1JYm91eW03TmdCUi9LUU5SNmt5cTV1SmI2NmwxcG45eGZHTjQ1?=
 =?utf-8?B?NW9scnpwR25aY3REdThUMno5R21jald3cHNYMktIdHlDYWhMbjdXREVDYkVv?=
 =?utf-8?B?cDc0dTBTaVRkTXgyUTJwK2M1bm1KNEVKcUpWTUNIdkFRQjdCR2tQRTMxVS9s?=
 =?utf-8?B?SGFEU0xnNk9RTUZRcmp4MG1jd1dZbCtoUk91TU00dUozbXlWTUY4VzZpYTlI?=
 =?utf-8?B?QUdLc01seVhTT0FIWS9NY3dZK08yUWxRVE9qa2NjZWZLUld4WFpiVUpMTy9v?=
 =?utf-8?B?STJJdXZGYVdZVVVnNXdMcDdsYW52clFQSHBEMFl6cU0rSFNwalU2TXRaVW9W?=
 =?utf-8?B?YUZMNk1vRFgzTUxYREc4TFdINlU4ZGE2QzJXdWIwNTNkcTM3cVBCaDZlbCtj?=
 =?utf-8?B?Y0Rsb0h5aWVmWit5eU5ENHhKeCtUOXBtdDAzdjZJY0paZ2RMMWExbUw2Zm9I?=
 =?utf-8?B?YlJPYzhWcHVjQ1ZZVWpFazBJUDdKZWFQZjJ4UkY2UUJXcFRQTVhSMTR0QkRH?=
 =?utf-8?B?OGVndnJqK2E5VG11azFrNThYZXVTaG1qcFprNXJNTVRCOXBDWFRHQWlJRzg0?=
 =?utf-8?B?MG1UVEptaGNSbCtML2ZJMml0QXQ1TXh3VVBoVVdjaUZUTndqZzRNVldOdHBx?=
 =?utf-8?B?UEIzQUQwdm0xd3cwb1E0YWNsa2VJeCsycDFwbVhpbWJMODhZbkVJckN3MDZX?=
 =?utf-8?B?WmdCejJPNVJRNjdxM0k0ZkdoYnlybmFWYitqT2o1Zy80TlpRVi9RaEZ4bER5?=
 =?utf-8?B?TWNlTE5XZnhMcEZyaUc3WldBRGZPd0hmVHlENkZrVExia0IzbllrUVBCM0FG?=
 =?utf-8?B?V1lJMHVpMjkrRzhPUXpmYzdtd2RBeEladHBlU0RocmRYWFhXVmNwSzZCWE1u?=
 =?utf-8?B?YTFYMk01aENTOHRRN2s5dGpJQkh0c1owWDhLUzhMWVNBN0JiQ3hVOHFmNWlh?=
 =?utf-8?B?QzFVdU82L1YwYjUvcDFjR3BBWjBTZndpdEtPVUoxbWNXRG5hWERtZXpSVWpa?=
 =?utf-8?B?QUNsbVZWQkFZVzVJeWZ4NytabXgyWTNXU1p1UjVDTWN4OEZQSU5EQTFNOXpa?=
 =?utf-8?B?Vm5maS9IV1FYTldldjVUTU5oaEQyMzhxaUpQakc3L1pOUm1KK2dFclZPTzRm?=
 =?utf-8?B?cGxCTHJpUkdiNW4xRG9wWm8rUnJkam4rT3NsejJtcnpKWCs5Q1NWM2c4WUNG?=
 =?utf-8?B?ZC9DVUtRZFJ3eDF6T1RZaXZLVFhvS0YyM1JSRW01TVAwRHZsNlZ5QVgvb2Fu?=
 =?utf-8?B?Tk4wbVBqbkgyVm4wd0RSZW5TdndYalQwM2VuRHdTVEdSYzJRMVJKNUl2MXNQ?=
 =?utf-8?B?czM4YUNKa3E0U3hGZjltc3VvQ0lDRVlNUUdIc1l6MG9jSGJKbm9NZzlaVlNG?=
 =?utf-8?B?QnlXVDN6M2hVQlR4enp3Qmc3SkJ0NDBhNE83Y1VZTjVsZEdSMDRUWloxK0VU?=
 =?utf-8?B?MmpEekgxcjI1Yk5VQUoyV1hmUWJHM3lXeWhzMHk2ak5RZm9abUpuQThGM1Fp?=
 =?utf-8?B?N3R4YXdNWnJNQUd0VWg2Unh2aVp1UEZYa3dtaWoxblk1Y1NwUVoyM2QrUXFi?=
 =?utf-8?B?Lzk0b3Z1b0FJMllRSXZWRTB3eW5yalc0QUhHMS8zN3c2cG1kTFZ5TjAvTzBh?=
 =?utf-8?B?QlF0TnFDOWlpRWhwWjBDdGE3LzN4NlJoeWNwbHNIblQzZ2JOaDZXTVhDOG9E?=
 =?utf-8?B?M3A1SlhSaG8zTHdyWmpPUURmbHVqcGkxWkJPL3RwU0JOQmlJYi9kYzRpdzF4?=
 =?utf-8?B?dkdZWEdtMFozbjhvWENUOXVTOUdiOUpjWGFzTk1QVlZISUU3SlhIeFNxOWJP?=
 =?utf-8?B?dXNhN0Zlak1uL3hoNkJLcG9MbjdpbVlwVVhMRnpQUE1lNG91NkF0V2l5eW5L?=
 =?utf-8?B?b1JzK2VRdWVtKzUySWRYY25pQXZrYkpwVFpyUUVsSk50U1JzQklLeW83WER3?=
 =?utf-8?B?ck92NktVL3lmMXZ1b29uOExGMzhCRmhlM2s1Yk1iV284Z29Ubkc1SGNKN3BF?=
 =?utf-8?B?Q2NBT29xNG5XSUxqL1ZHR1RlZTh1R0loVk1kd3Vwd0ljZ3hnU0NTek9tUEh2?=
 =?utf-8?B?M0RkNkFQNkY4Y2tOTGoreE1nL3FsVk45QXoyZ1lxOXZWaEc5Z3pOaEFZeFhn?=
 =?utf-8?B?eTZBaW5GVDE4eFVFd1ZyTk1KVEtLOXRCdzE3NFBHRHlWRVBPV2xEUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c06d840a-604c-4ec5-3e06-08de421fedca
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 12:36:43.5690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwytSgSqmGqITdYvJnmAMsJ2KOAGkkq6OWT8X8kHYoy92e6YNR7hn3yof/NQiYmSIk6wZagpcBreMV16F9vFySsI2VC+BSGq8uMQ8SHGPas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8373

On 22/12/2025 4:40 pm, Oleksii Kurochko wrote:
> Use XFREE() instead of xfree() so that vcpu_vgic_free() can be idempotent.
> With XFREE(), vgic_vcpu->private_irqs is set to NULL, so calling
> vcpu_vgic_free() a second time is not an issue.
>
> Update the prototype of vcpu_vgic_free() to return void to satisfy MISRA
> Rule 17.7, since the return value of vcpu_vgic_free() is not used by any
> callers.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

