Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677F5CD94C5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 13:38:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192571.1511719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY1eH-0004sl-Tr; Tue, 23 Dec 2025 12:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192571.1511719; Tue, 23 Dec 2025 12:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY1eH-0004qV-Qz; Tue, 23 Dec 2025 12:37:57 +0000
Received: by outflank-mailman (input) for mailman id 1192571;
 Tue, 23 Dec 2025 12:37:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mhFC=65=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vY1eH-0004cp-0W
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 12:37:57 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3461e581-dffc-11f0-9cce-f158ae23cfc8;
 Tue, 23 Dec 2025 13:37:55 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8373.namprd03.prod.outlook.com (2603:10b6:8:32a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 12:37:52 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 12:37:52 +0000
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
X-Inumbo-ID: 3461e581-dffc-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zp/V5QMLjTNSwgnzkj9rNOaOVwYb9a0C/ZvP2NBTw9EYxrr2UeADRFbHvwvHPxUmya9yF4Tv5yssn7WQReKTTyEqxPAh9D9s2KrxB+3m3fnQjee1nPZRKW+HEmwcxFLWu6fti7wzqVeEhI4Yi634SWhiY+aHNelDkyxtHxZSSt/WbbdIobRwtsaxKESqI7owpwhN7p76txx26s+yzbr/qOHt/M9++SxY6lW3v0i6FL+ZLulxXzwu/4ZjCgK2GhAktwcM16gsnKyAF71Tvw3voskt7urJ4c5vovTM8UNdfBZryJe5gO/pHcEHoz3Ran/3SeD0KC3ZvF9RNmcjcKtQNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oyn1YZ1VNLO+xTLGb2WF3f3FsP0GMakfu375KSm8j/M=;
 b=riL9uF2QQRKeKhK7BvHPVK0nNJhVcUipjXLowv6OoxErJrOjPJVkBYipsLV8+nL7XYORzIT4ekIGTEeUkOC/d59FakUNSEoVs4hbkYw2GYcl7uG4yw0ONqU7Zim48LxL4b3zKMpRpmvpxu0NZFJsJ45lLMp04HILjiuPvZEfmC8J15CbPD9SwipH1f3eJB97/klmd0ToWmd/gIp5shHItd8pLw2JR1YuuMDuS8GrKO6kmkBKOVA1RRQx+M+AjfCZMB3mwb4tEpvPiVt/suz/eQByzWOwZMBU3AsZifyKDS0u/I9mJ9vr0XET7NGeFJhEHHYFXpSSCoLbpeEWIiWEpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oyn1YZ1VNLO+xTLGb2WF3f3FsP0GMakfu375KSm8j/M=;
 b=HiMv9aaPYVtkudwpwfB1/RzIu8Cllv0pU2hvyLgzFUSt4ZS9H+BngG8LEnGCO4AMXOWw722zy2xaPksYcNwRu4z3uaQa8rckAzUuxQHFVAPy3kAPQbl++AquAGjd+LGMBiluLJAnW+r9vxz2U7i9T9hW9dXnz3mPiphTKx4hYzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cd6dbe4a-2a86-4485-b1d3-15e7c21110d8@citrix.com>
Date: Tue, 23 Dec 2025 12:37:49 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 2/4] xen/arm: optimize the size of struct vcpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1766404618.git.oleksii.kurochko@gmail.com>
 <7cad22bb0aa95eed7f9710024356110b4443f554.1766404618.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <7cad22bb0aa95eed7f9710024356110b4443f554.1766404618.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0416.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: adf02e69-260f-493a-db38-08de422016f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0NUZDlVdThBSEhWYlJ6U3ZSTCtVcmoyNWxDalk2cGVKamlncXhsb0xIeFdF?=
 =?utf-8?B?WU5ZaXdhOXpqVHB5TmpXUHZqczZmR0UrS0xiYzFld2xyaS83MnE4aEEwYkx6?=
 =?utf-8?B?OHMrR3hSNnF6NHRTdUpFNVovOHdadVRWem5mVnJpSTh2bHNsT0toK0FJRHNG?=
 =?utf-8?B?TzFqUVNyVXgxM0VEeUtOclpFWmNYencxNVdEN29iV3FNNkFyU2swWUgzWmlQ?=
 =?utf-8?B?Y0pPU2pqN01laVZ5amRuTVdXRENZU3VqalVWMGNxM29XNloxOE5Kd2w2bWtB?=
 =?utf-8?B?WDJ6RGlESlhjOVM3OHVWZVNSVDNOdkVYbEhub1dvaU5kNk83T2E0elE2akxW?=
 =?utf-8?B?REpucktkZ1NMNk9XdC90QUhjT1pFQWJ5RElyaVFIUm1OY2VKYkNseFY1UlVC?=
 =?utf-8?B?Y3VrYWZtWVVXNXE0cnVCa1F2NXhsODFjSHNYaklBYVFQSUtPWnA5RDFqVnJo?=
 =?utf-8?B?M3Q1L2c3MXQwVXllNDRxSng1QmdUVDY5YmFNUlRiWVorRzA2ejJWSWYwM3Zq?=
 =?utf-8?B?K3RSTlF0dmphakpUQTJlaUZGT0Z0QVBocC9sd3BWNlg4M3VMcmZSV0RWODlm?=
 =?utf-8?B?TFgwSlNLR1JzclZtWUJTc2REQlllT3ZxeVl3Skhxb1h5VndWWElodXB3eEln?=
 =?utf-8?B?N2tPM0p3akdFVkszeVUwWkhTWTZWWStTa296bWU5TXZXV1FZd0VlY0YxVXlo?=
 =?utf-8?B?SnpWc0tDMDIyejRtb1kxcjUxdUc2UW9LT1FTZUVOcmRRMTVsZlB5Mk9BMGN4?=
 =?utf-8?B?Mnp3a0JEK3E3VVcwLzZ6MGdwVXFydGxFaU42a0dxcytOVDNFZTJldnI5QTNy?=
 =?utf-8?B?VzQ5ek96TG42ZkZSKy90bEphQUU0SHJuUkZ3ZE1oZnVEZDUrTTZWSVpPVGt0?=
 =?utf-8?B?NTJpOXNYQVdaWmdEamtEL084eG5LeDI0cWM5WDZIVEU5Q3o5SnB1QkxNK3I2?=
 =?utf-8?B?UEZDVVR4Ky9wd0p3K2NlMnVPQVdUSWV0VXVPU2JtMFlYTzhxMkRTNFdtbEpr?=
 =?utf-8?B?ZDJzMnFDSnN5SlFHOTZBSUc1ZDY1RDNWSFBxYVI4S1dmcXFTS1FnWnRQcXhJ?=
 =?utf-8?B?NFhUYi9jajhvZUNiUjgyaEFhSGwya0xCMXgxTWl1Y2dYZ3NtS3ZJYU1aZUNs?=
 =?utf-8?B?SWN0RmlpYk1RVjljMC9TVEo2UGRqTVpEZ1VERGthdzFBRTFPcjJMMVZlR1Jk?=
 =?utf-8?B?Y2NJWVF2TFREM3FmZFJycndXYlBMaGNwYTR2ZkFySmhIU01RK255bGdMaVpN?=
 =?utf-8?B?K2RaM0pNRXVXdXpldnRRWVU5SHpXQTRqczZQL3FLM2RpUGI5VlQ2TXBuNG9P?=
 =?utf-8?B?cW5NbmgyeE9VWHExQXFuZzJNaWZEc0FPRStjc2l5MnFvNEpSWjZwbTFFYWFJ?=
 =?utf-8?B?STYySVFKS0RsUGpUalJaMU5wRXJ0NVZ5SXhoYitHWE5VbU5PQ2x4b2hJUGFF?=
 =?utf-8?B?SWJjMEdkd0kxWHhEdFh6RENKVzRuVWpEVUZSbE1qTlU1TmcwRkd2L1VuWDg4?=
 =?utf-8?B?WHBoV2RjWUkwQUNzNGpCUXlqeERNWDBuM3ZPRWZaTGw4UjErbmU2cHFvSTJ1?=
 =?utf-8?B?YkEzKzB0elJ2WWhZa1ZRNjBsSUVVaXpQZTBONTAxWHZIbCtVQ0M0SldncUh3?=
 =?utf-8?B?bXRqSkJPSzhxdTU3T3B2ZVdBa0t1V3p4bHVWK3M0QiswU09MdGdtVXR1M0M4?=
 =?utf-8?B?VDJ1NzlDbHFFMFowWEVMVUxLd05pYnVDMTQrOXVNMlBzN1JKc0dXNVhqdjd5?=
 =?utf-8?B?NzlZSEJZYXQ1b1EvUFh1R2VXa0drYlA5amhrN0dHTy84RHRHOXVxcFR3VzdB?=
 =?utf-8?B?d3d1dlV5NkwzMVlBRnU2cWp0N0NhdTNOY2RVZjZ2clppQkY3RDEyMGNOYkdx?=
 =?utf-8?B?b0ZwdmRzMXp5WUJvV2NBc0NYZTR1U0I4b2drcVg0TGtjbkxJblJwejJtV2k5?=
 =?utf-8?Q?20p1W8q54hZB4Jm4BLshsAjdKurBdcMR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NG1HcWFWZm5xbE00U2RsaG4zRGpwNHRJL0t0cmNrMmZBMGMveXcwOVJsdjR3?=
 =?utf-8?B?UUVUaDNTYzlhQmh4anRQdFhoeHFIRTZmbStiMnlOUXhMRVlyMkFjMllrYWMr?=
 =?utf-8?B?d2xLMFlPbUpiQlNTQnlrZElSVW9rZXprcUkzZGd2Y04zTm8wWGVRNFhnVjdJ?=
 =?utf-8?B?SWNQWDhWdzVXQWtHRlNTaWI0Z1lBUHNwL0UxU0N1MUFUaUMxL1RsME9CemZm?=
 =?utf-8?B?Nmx4Q1dLUnI2K2cxcDRvLzh0STBrSW16clM2M2NENWs1WnR5YlVHaEtvcHJv?=
 =?utf-8?B?OGxjR3VNSTY4ZzV4TGxGOHRCRFpKSVJjMVRkR1NiTFhkWUZGMkhzQjFaTkFk?=
 =?utf-8?B?M05Pai9YNWkrVFZuVjZSSjRkMHBWRDJrdDhJZVpCc2JFUzNZcisrbUxmQjdS?=
 =?utf-8?B?Ym0yY3JicjdPZVYzMnZFblhTKzlkNEtzRUlPK2RDRk8wcjZ1RWk4OHZDUkFm?=
 =?utf-8?B?c0wvbjlOb1cxVEMzSmg4OXp5RUo2VWVNeW9pWmdWTCs2T0NSZUF4dWhJTjQ1?=
 =?utf-8?B?UE0ySE13MHk1Um9neDdlSzI4cnlHeGFPdHZqdDVuc3BNUmNDamtxL1FmYU9S?=
 =?utf-8?B?aGNIekd5NGRVRE4yRFhqTjgwMUJINzJJa21rT2pmY0srTkJoS2lLWng2U1Uz?=
 =?utf-8?B?Tks0Z29JdzVuR3NQWVBsaFltKzRITS9JUjFObVBSbkJ2ZXRmWFJQc05icDFi?=
 =?utf-8?B?YU5NZUwyVzlxZEJHT0wyT3Z2NkZDSlFtQ1lUR0pTcWttMk1vbWZ3OFp6RHNM?=
 =?utf-8?B?OGRRMFBLR3FLaEUrcTBoK1k0NEtnempETDk0MFdqVzhWb3pLRDhwK3krSFVW?=
 =?utf-8?B?aHN1TmVzTUNGT2RMVjVsRWdLNTB6cWdRTlIvdzNjUkcvbDZKYTF5SmlXNEVK?=
 =?utf-8?B?ak8yNmJEN3FmS1BHbWVuVklhSjRJNDZnTFBzU1dtRnpUbFpKdGtzYnhHQ2tX?=
 =?utf-8?B?NDFSYld4Y3JBaXZLUHo0aEhNckhuYThFbkpWSG9Sdk5MUWt3aUYvSVRXaU5L?=
 =?utf-8?B?TkRyNGk0bmhNMVRpS2t4NjlJUG5zK2Y2ekt3MUJFek1FRWZrSWkvUHJWM1Zn?=
 =?utf-8?B?TW1zSGtuTUVKcjljUGlBem5LSWxUQks3amtJd2VIdGNTV2krRFVxVmhDenc4?=
 =?utf-8?B?WmdSd0R3dStNNHRoL3didzNRd2c4RlVVYmRnd3l0RWhneVV3N2V5YXFIT1JU?=
 =?utf-8?B?Yy9vWXhIenRNcm55bDJaSll4VU10bUZ6Y0k4NjVPQmVzcEswOWc4di96eUFn?=
 =?utf-8?B?SGhjWVJoazNkTVJtaUxabVFmV2ZCT2VRMjhYdmVwWFFDaVJ3M01MZ2c0SzVZ?=
 =?utf-8?B?RXJNY2tMT3Y4bC9UNVl1dWp0bm9tLzRqYWJRV1QxTE9Fdnc2OGFaZmpvdHp0?=
 =?utf-8?B?cmJtalFvTEJZT0hNNjhGS1luUGRKK214aFJYVUs1TUY1bzZsQkJIV2xDVmMx?=
 =?utf-8?B?QXV0a2RYeXRVK3lDbTRSTTJQQnpWYnVhY1A1azc3M2w1eWNmaEVTMEl3RnJP?=
 =?utf-8?B?Qk5rQnlqazcrMVljUjN2aGN2OVR6anB3dGx1WXZnejF6aVVPNC84MDkyL3VZ?=
 =?utf-8?B?TDZ2cFlXV1Q3cS9INkNEeWNPY2E1cE03bDNLWGZSWkg3eHhhcmhZUldlYjlO?=
 =?utf-8?B?Sm5wVXU5L3BGdGxKcURBYXVaNmRjYVQ5RVZZc3l1OWl0QnNQVzhGOEk5Rit6?=
 =?utf-8?B?amZ1dWVUQ016bEZTY05NOERmL1VVaGxjRkNoMFJoK0hEKzdsYlJobFJQekNu?=
 =?utf-8?B?L3ZQSno0NitYU3Voc1dPWmlvWkNUbUM1SkVudG5vcSs3L0h1amIwRFVZcm1R?=
 =?utf-8?B?QUtERTN4dmhyYUhpUHdwakpDRmlZa0tZdFlEQlp3ckl1RUhjcVhQL2k2dWVT?=
 =?utf-8?B?eHdnRjJiMTM5cmY1Mm1NVjZpdndnVWV6cks0UUk5aWIwU0Q2N2lQU0F6T1lP?=
 =?utf-8?B?SjdKTkh5ZkVPYUg5RkI0MTZUTytIUTd1RVVsaTBoMmRLVXhPMU9HbTVQWWow?=
 =?utf-8?B?QU9KN1RoTWlTTE94Nk1hbFhaRmQxMTIyWWRpc2dTalhrRlNoYi9PeEdxZTJG?=
 =?utf-8?B?Z3VzT1ZCN2hVVksrSEZLUG1taGJoZHpzYm9tcWJ1aExKNmxXeVlidnlYUzNU?=
 =?utf-8?B?ajJjdW03VW15TFFrZk0yRTREV1VFYS96Qm1ZRnQ1VDdvekI4SWtmeGNWVWxu?=
 =?utf-8?B?bno3UWJ3aENid3VFTUhoRjRaQk5HbWN2NUVjcjR0LytSOFlKeUVMbEhyMzhn?=
 =?utf-8?B?dVlhbHNyb2UwTHQyZXVOSE5mUjllbDJqeE5VT2d4d2xreXAyckZaN1R1MWdL?=
 =?utf-8?B?K09pZWJwOXFMekhad2pQNnh2L05sQmhXajJBOERDUmtCdmJXQTZJZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf02e69-260f-493a-db38-08de422016f6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 12:37:52.6309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOOhedc3sYfV4M9jdoLzWxrhp1l9B6TqeFbIvPT8LiowHNFgkmxP9MGVTX+TtV/Dv3unTusDTj7IQ7c0Z28wa4U02x7kuIX2WlMt3ljDZuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8373

On 22/12/2025 4:40 pm, Oleksii Kurochko wrote:
> When CONFIG_NEW_VGIC=y and CONFIG_ARM_64=y, the size of struct vcpu
> exceeds one page, which requires allocating two pages and led to the
> introduction of MAX_PAGES_PER_VCPU.
>
> To remove the need for MAX_PAGES_PER_VCPU in a follow-up patch, the vgic
> member of NEW_VGIC's struct vgic_vcpu member private_irq is changed to a
> pointer to struct vgic_irq.
> As a result, the size of struct vcpu for Arm64 is reduced to 2176 bytes,
> compared to 3840 bytes (without these changes and with CONFIG_ARM_64=y)
> and 4736 bytes (without these changes and with both CONFIG_ARM_64=y and
> CONFIG_NEW_VGIC=y).
>
> Since the private_irqs member is now a pointer, vcpu_vgic_init() and
> vcpu_vgic_free() are updated to allocate and free private_irqs instance.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Oh - even smaller than I was expecting.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

