Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 953BCA7EA40
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 20:30:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940851.1340477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1rEb-0004px-QQ; Mon, 07 Apr 2025 18:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940851.1340477; Mon, 07 Apr 2025 18:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1rEb-0004nF-NC; Mon, 07 Apr 2025 18:30:13 +0000
Received: by outflank-mailman (input) for mailman id 940851;
 Mon, 07 Apr 2025 18:30:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xyMQ=WZ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u1rEa-0004n9-KX
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 18:30:12 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20624.outbound.protection.outlook.com
 [2a01:111:f403:2408::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54b75a5c-13de-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 20:30:08 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MN0PR12MB5932.namprd12.prod.outlook.com (2603:10b6:208:37f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 18:30:02 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8534.045; Mon, 7 Apr 2025
 18:30:02 +0000
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
X-Inumbo-ID: 54b75a5c-13de-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKYZTkiaCk1aOjX5u/8qpkIGRdIr+0btMWis88vwf9tMfs430/XrjBLu1evkHbffDkl8i8lXjgxZ+fScfwo2R0N9gdJamMMkHS9mKSnlSabYhdI68Qk9CRdFo3mbrSYufUqeXPz0Cx7KzF+C+y4kX1JFrc3A1Ru97pNqhWN+XyoSEYA5c5Zla8rLEpO6nWrDIUA9Wly7fjVt6MOYhKINm+qj9nynqTQgDzhzcc5SO+Fm2r2RACEoLr22FdXnHv6KxfIkI3DbA1eBN22XQ+nN/MhHm9xXFFmoEqTzcVsafFnfjqDbEqSRKZyIBeYkwQzdg+O1meBIupqzxbZtNVfcoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jALAJGIJb4PhDswvLljZ9wO+SoS9rpvDC7PTmfM2pBo=;
 b=ynVrOuoaHjzvPX5G5HiQSQgt4Vv4Z7+z1RwR1xHpElHcu6Epq+m1ab6AlmALkK5AT83EG7T2vmCi+9dSwxPh0Tailymyv1Y+iyzJ9v351w6Siv5a4Z2pm9SiwOJhAIanf+3V8AVbgl66UB9HgYe3gKd4p1dyUONbVRdofEGR3LbMBhnRiWzn10a9EkVQyFFc29tqUAgQBLnVEzt6goZhYKpRcwfxNK4zYtc7H5gkaI0sNmW1yQPRM+zZu+SONqmQ3/s/RLgCph9J0atKjCd2WVuDQOBYz/+z2oA16gS8yiCqijP5YWp18YRpR8gD5OcSg0FsRMkZvuwWDxpC8c768w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jALAJGIJb4PhDswvLljZ9wO+SoS9rpvDC7PTmfM2pBo=;
 b=0r17TdqqsJmnZomVQ8T9CjkQFwbsaul21nCZmlnBTswoV+WhfCINvmhsZzESjBplXXG4Sf5MtvMCXpwDm0TmhN4GFNBWsMWcWWm4S5J9iKbJ66paSE57PrJAwdjEYtyTIqHVr95gnRgUh1Gj9MMNLV3U2C0GatRP6XHN65EEW70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a82bfb6b-970a-4b24-aaa5-190c2df14592@amd.com>
Date: Mon, 7 Apr 2025 19:29:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] xen/arm32: mpu: Stubs to build MPU for arm32
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
 <20250403171241.975377-4-ayan.kumar.halder@amd.com>
 <A3945B22-D60E-4E66-B4FE-C0013A532E62@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <A3945B22-D60E-4E66-B4FE-C0013A532E62@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0034.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::21) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MN0PR12MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd51004-0664-478d-1c26-08dd76023592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MU1mTmdiUkxGTVNIMjg0VmNyd0dGRWM2cVM1YndHUTY3Zy8yTW1oanNyNW9v?=
 =?utf-8?B?elA1bVlmYnk0bEFOQjFoa1BwWDRySkpiRnNHTStaaEFNODBrUEFOMzIrVWtj?=
 =?utf-8?B?N2poQ0w2VzRoWHpuRnkxVHN6UUlHc25zZGNZRFhLUjViM0dTV0tPQVh4eDFQ?=
 =?utf-8?B?R0ZwWnhINXpCb0haZ2REUU5sQ2JsNjFQV1NuUnFXNUNYWE8vWnprempONzVn?=
 =?utf-8?B?czVtRTNHT2pmcDZMYnhTaDFyTTNOY1h3SjI1cXJKb05tc3RCazlsbnZ2S3Rh?=
 =?utf-8?B?TVBqUDJMMkNFNGt4RU1ncjkvMytObWZoSzJzdkdrUEMvaE83Sm0yMU1BMHpy?=
 =?utf-8?B?N0s5ZERNTFZmRHUxSi96NnlQR1BaUnVwRXhleXlobmVuN3dySXA5bUZWWklq?=
 =?utf-8?B?Sk5uZHhKd1MxSDRGbHRzTng1b29YY1g4RlpFTEU5eEZnNUR4N3BuRk02M0xI?=
 =?utf-8?B?Qno3TyswazJOOWkyd3QxYkdUYnhHLys5MjhOaENHbVNzRFF3bGxsdFNQbGFk?=
 =?utf-8?B?Yzd4a01YZ2tJU24zU0pFVjI5YlFCeTUwV1JKUDZwdGl1bTE4bnJja0xsUGFC?=
 =?utf-8?B?VXRSNEF3MlV3ZjhDaURnWEJVZzFFMmJkTjdwekxSWE5JRXFvTTkvTHFqVytk?=
 =?utf-8?B?QVp2VWVMMGZDSW10K1FHam1HR2VaMmNmUzJhM2w3WVJHVEhIaVE5ZkZURFpB?=
 =?utf-8?B?czZlb0ZlOHZCbzFpU1VNckZWdzN5SEkrQmhOSW1QRVRReEYrU1YyTmFPeXFp?=
 =?utf-8?B?RWtWSHdmMHU4WUErTzUrWWRSbEZMY2FuZ3R5Q3drNnFFZ0prTEQ0NSt1cy9E?=
 =?utf-8?B?MWlSa2RHcGhPSXJ2UzZWdVBSbnp3OTVCWldHV2cwcWo1dEZDajJSWU5Gbjd1?=
 =?utf-8?B?ZGcrdkdCZ2o4ZzZPMUJoc3A2bHpvb2FFRG44eWdkenFsdzJQajhFdzBXQ2Ra?=
 =?utf-8?B?TDA4L1I5SEd4SUZUN2FodjFzWFVENTcyV3I0LzJncWxudC9EM3ZianphQ2Uz?=
 =?utf-8?B?MHFKQWpjem8vMS84bkZoWkQvcUtyL1hoYUxkV3dBc3o3cG43bmk1bEt3TlMy?=
 =?utf-8?B?VzgxdW5leGFyQWY4RUV4ZFBSQ2ZKK2ovVGFTTDMxZnZSL29aRUFuTURwSVls?=
 =?utf-8?B?VkgyUjJDYXhYTTIyQ1lVWDlIcTRlZkdzTTJVL04xYzhVRFhObDhSanRIMEFS?=
 =?utf-8?B?WUFmN3FJOFBvQ044R1dVeS9UU1U1aHZEdFRObzk0SE12cExpRU1LTDJoTGFX?=
 =?utf-8?B?a0tWbUhsMHlCdHphOUNudVpha0pkay9vR2tyZTFuVE9hekFJdGgzWE1Ddlhs?=
 =?utf-8?B?Y1RhR0tEdDBPeExjMG15VUFmSE5GUkthNVBQZk1DTlZrTTc4czJyanh4VWNM?=
 =?utf-8?B?QVZUV2lvWUZmeSt4RWFpcEY1cXJQd09WYnJHd3duczg5MEpLa0xFcHA3TFlo?=
 =?utf-8?B?MjJhTTUyUXpSeGRsY1d2VDQ1YWdxUXZsRGh2R2FmQnVUYmwyN09neW5IMEsx?=
 =?utf-8?B?TFpiMkluNUZrUnNRR3o4OXBzYVdmcERaaHc0MTczck85MTRhYjNPR0NDU25X?=
 =?utf-8?B?Yk5HdGhNMWRjWnZGamYyZUxRR28vbXUzUFFlTzRjb0pTQ295WmJzREJwTG9J?=
 =?utf-8?B?cDk3K1Q3dmt3ajdsUUI2RVoxKzNDeDFQbGIvaWN0NituRk94TE41MUt5MGsz?=
 =?utf-8?B?bzcwMEVTVVVXOGpya2ZJbStLMmFvcU5WNU5Qbk8vWlJ1ck5aWVI4SHh2Yjds?=
 =?utf-8?B?N1hLYmd5QTAwWU9Gekc0bDQzK2x4N3QrRlJaSzdCTlhZb3JrRGoxRXJvVk0y?=
 =?utf-8?B?ZUJMUm1iMWQ0ZG9IN2ZCd2I4VWpHMURxZFhqVHBYMlJ5dGtIOE16VGp1dU5h?=
 =?utf-8?B?dlRzWUNzUkhXK0RSYzMxNmtUUW1kRmJKRmRBWFVGeCtXcjVNTVd3VTBUVnpl?=
 =?utf-8?Q?PkRLCVpDAPs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWtTSy85K0dna0t3ZmJYSWs0aG0vT2RqSlg3TjlOL05jNHdNcUx5Tjg5S3hn?=
 =?utf-8?B?c2Z1dmhnVng3dHF6N2xUOHVURlo0dSt0SjdDaDMwYm5IZ0VPT1EvTkErM3Zo?=
 =?utf-8?B?R0dWdy9mdVZWSkhScXE3SS9TWGpOSHR0YXVEWmt2ZjB6SkhsbGVSUDV4Uk9i?=
 =?utf-8?B?NlZKSmxUbjBEdGpFNEJad3pqWUpUbis2ZVJUTFFHeW43SGg2SVh4UEIzMlVW?=
 =?utf-8?B?ayt3SUppZWZDejlmNnQ4V0FZSzZ0OC9na0dqcE1wTUZiS0RXd3ZOcHg5Zk5M?=
 =?utf-8?B?ZUZNYk1qL0VpT01iZGpSUVdhaTJrcmliMWpsa0FSeDhlSHhqWEJxWUdTSlZV?=
 =?utf-8?B?Q1AyVitHeW5SdEFzWTUvQWlIVkFpQjdueWQ5VjFlUDQvRDd6enhaNmovTm8y?=
 =?utf-8?B?MzFrVFhHa3hxYlVqK0VISnpGNXZvTjZhMzdGS0xGb2FkeDlITSs2SndhRmhz?=
 =?utf-8?B?R01TWVpVYXBLek5SeVI0TmRQVUFUSFZGRjFtalhwRFNuaVh0d1NCZGRSRGt5?=
 =?utf-8?B?cVJSRitWbGRaV2xDUm1YNnI0V2wycURoa0FINlBHbTJYbUUvb1ZBWUJDTjBs?=
 =?utf-8?B?U3VLTmtkL012TlFGZXI0SHVRK2JZY3lEa1NQYVI0b0E3VGN6ajRsTDdNeUI2?=
 =?utf-8?B?Wk11REZyME1Hb2xFU2xScUpsT2tvWkJaTjQ3WHoxdWpzaTl0OEs3NndSYkZC?=
 =?utf-8?B?SHg0Smx6ZUJMUW9HQ2xYUmc0amxZTUxaWU1BZi9xajhNUlZLdkdDU2JFR2wr?=
 =?utf-8?B?aEZjUlRUL1QybzVTTC9LQ2Z5TkZHRVRKb3BVUllXTm04Y2tlUUtpRU5CUStM?=
 =?utf-8?B?Z2VnY3hYcnkwUk9pZ0VySERLcm5YZ0VVQTJWN0JkTVNKQVFpdDBDT25pcHBu?=
 =?utf-8?B?V29rMmZwQjhXWnJuN281OWhXRlo5WE1pS2Z3T3FObGVtMkdvdDRyWWNtL2VQ?=
 =?utf-8?B?MDVCc05ELzF3dzJmbmV4V09janV4a3czZ09mRlM0NFhoeXZjMXU1WkFWTVFF?=
 =?utf-8?B?bWtvRE5uSkw1bEFnOVhmbFpzYjUraGgvWmI0aVQwUVhpR0t0eVZxUTBWVW5V?=
 =?utf-8?B?SjlLVEd4VnNJZ1dwWGxlSWNGck9wbE5tSnQ3Q1pLTEZHb2ZlWWZTMWt6YzYy?=
 =?utf-8?B?UzhQaDFaeXdmK3V2OXJDS2p6N1BrOU9YZ2s2Y2pJempRclZENGc4eWZ1cDVk?=
 =?utf-8?B?ZEhzZnlkTkVBby8wdUFOUUptM0hZMy9ibzlsa1dvNEJUWjJuWFd4dWhySS80?=
 =?utf-8?B?R1dDdjFUT085LzVhcnAvblNNZ21CejlEQ09MNThqZGhJbkZzaVQ1Z1pBZCtv?=
 =?utf-8?B?dm01SjlPVHVwM29uV3NtU0s2eGFiNEQ5c1luVGZMWlFjNnp4SFBNWW8xNTV4?=
 =?utf-8?B?N3NTL3NtNWtaeEo1NUpCZnJoSWhSR0hwQ0hGYXR3aWlwRFZhdFpkQzEwK0JW?=
 =?utf-8?B?bjY1R0p5bE5HMldZdkZZeWRZOWh2QW9tcWVkVURYUng0Z2I5TW9tb2VWTVNl?=
 =?utf-8?B?QldiaUN4T0xSOWliZzRIazFuQjIyWW92ODJ2MlJVanllSFJJVzFtd0xuQkRy?=
 =?utf-8?B?aDB0ZDl4M04yMGlMTWVkbFkzRzJFaVB4SnNXc2t0MkpzTFJmK01pK3hSWEhB?=
 =?utf-8?B?TzBmanRPYUVnUkFxaklEWTFhWmRzclRDbHkzRU1sZUx4T3Vlc2xHcjJ0L1JP?=
 =?utf-8?B?eDREU29mRElCZzd3ZFZycEI3TCs5SHA3VTFrYlRyU29RQ1FQT3JURVVZU2tX?=
 =?utf-8?B?SUlvblhtb0puMHFvQzdpQW1SemJONW1UQ0RBaks4QVZjYk40WFRzZmRvZklu?=
 =?utf-8?B?eFdrNkJtMXh5blBKRjlKbVlMZVlEMHdrRlhyTXRNZXl1dFFPdm03SnJIRzl6?=
 =?utf-8?B?dGtCRzZqcUw0UkdwM0ZpWnhrNlI5OFQxSWc5ZzY1enBHQ3FNbXcwdXJxdFdw?=
 =?utf-8?B?dUh5Y0xtM0tnS0Vsb0hKRkxFTVUzaUZoeW1XajVsZlVYbHB2c1NzRzlva2Fa?=
 =?utf-8?B?YzBPWkJSQ2tJU0M3MVNOTEJPMXNuZSthS0NISlVMTHJ4ekFVNVpud1pnN2dw?=
 =?utf-8?B?bHlBRVIrQzdYQXQvNWRBVXhXMFBveWkxZEZ4bXdjMWZ2VGliRFlIa21BTDBL?=
 =?utf-8?Q?46+gTXz8JWXXsKMo/guLjIFH0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd51004-0664-478d-1c26-08dd76023592
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 18:30:02.0227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcSHy0g68IpTBKwC1H5zEv07wUgUoVoLOLXrbptg9i0gDH7vs7dfCuDdamguflP2tl76VrsbXAEHwwdK9wg4lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5932


On 04/04/2025 10:11, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
>> On 3 Apr 2025, at 18:12, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> Add stubs to enable compilation
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from :-
>>
>> v1, v2 -
>> 1. New patch introduced in v3.
>> 2. Should be applied on top of
>> https://patchwork.kernel.org/project/xen-devel/cover/20250316192445.2376484-1-luca.fancellu@arm.com/
>>
>> v3 -
>> 1. Add stubs for map_domain_page() and similar functions.
>>
>> 2. 'BUG_ON("unimplemented")' is kept in all the stubs.
>>
>> xen/arch/arm/arm32/mpu/Makefile  |  2 ++
>> xen/arch/arm/arm32/mpu/p2m.c     | 18 ++++++++++++++
>> xen/arch/arm/arm32/mpu/smpboot.c | 23 ++++++++++++++++++
>> xen/arch/arm/include/asm/mm.h    |  5 ++++
>> xen/arch/arm/mpu/Makefile        |  1 +
>> xen/arch/arm/mpu/domain_page.c   | 40 ++++++++++++++++++++++++++++++++
>> 6 files changed, 89 insertions(+)
>> create mode 100644 xen/arch/arm/arm32/mpu/p2m.c
>> create mode 100644 xen/arch/arm/arm32/mpu/smpboot.c
>> create mode 100644 xen/arch/arm/mpu/domain_page.c
>>
>>
>> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
>> index fbffaccef4..2a52cf530f 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -171,12 +171,17 @@ struct page_info
>> #define PGC_need_scrub    PGC_allocated
>>
>> #ifdef CONFIG_ARM_32
>> +#ifdef CONFIG_MPU
>> +#define is_xen_heap_page(page) ({ BUG_ON("unimplemented"); false; })
>> +#define is_xen_heap_mfn(mfn) ({ BUG_ON("unimplemented"); false; })
>> +#else /* !CONFIG_MPU */
>> #define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
>> #define is_xen_heap_mfn(mfn) ({                                 \
>>      unsigned long mfn_ = mfn_x(mfn);                            \
>>      (mfn_ >= mfn_x(directmap_mfn_start) &&                      \
>>       mfn_ < mfn_x(directmap_mfn_end));                          \
>> })
>> +#endif /* !CONFIG_MPU */
>> #else
>> #define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
>> #define is_xen_heap_mfn(mfn) \
> I’ve had a look on this, if we want to get rid of some #ifdef we could do this:
>
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 2a52cf530f25..5b67c0f8bb1c 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -170,19 +170,7 @@ struct page_info
>   #define _PGC_need_scrub   _PGC_allocated
>   #define PGC_need_scrub    PGC_allocated
>   
> -#ifdef CONFIG_ARM_32
> -#ifdef CONFIG_MPU
> -#define is_xen_heap_page(page) ({ BUG_ON("unimplemented"); false; })
> -#define is_xen_heap_mfn(mfn) ({ BUG_ON("unimplemented"); false; })
> -#else /* !CONFIG_MPU */
> -#define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
> -#define is_xen_heap_mfn(mfn) ({                                 \
> -    unsigned long mfn_ = mfn_x(mfn);                            \
> -    (mfn_ >= mfn_x(directmap_mfn_start) &&                      \
> -     mfn_ < mfn_x(directmap_mfn_end));                          \
> -})
> -#endif /* !CONFIG_MPU */
> -#else
> +#ifdef CONFIG_ARM_64
>   #define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
>   #define is_xen_heap_mfn(mfn) \
>       (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
> diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
> index caba987edc85..9b98d12b076b 100644
> --- a/xen/arch/arm/include/asm/mmu/mm.h
> +++ b/xen/arch/arm/include/asm/mmu/mm.h
> @@ -21,6 +21,15 @@ extern unsigned long directmap_base_pdx;
>   
>   #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
>   
> +#ifdef CONFIG_ARM_32
> +#define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
> +#define is_xen_heap_mfn(mfn) ({                                 \
> +    unsigned long mfn_ = mfn_x(mfn);                            \
> +    (mfn_ >= mfn_x(directmap_mfn_start) &&                      \
> +     mfn_ < mfn_x(directmap_mfn_end));                          \
> +})
> +#endif
> +
>   #define virt_to_maddr(va) ({                                                   \
>       vaddr_t va_ = (vaddr_t)(va);                                               \
>       (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK)); \
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 86f33d9836b7..bfd840fa5d31 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -13,6 +13,11 @@ extern struct page_info *frame_table;
>   
>   #define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
>   
> +#ifdef CONFIG_ARM_32
> +#define is_xen_heap_page(page) ({ BUG_ON("unimplemented"); false; })
> +#define is_xen_heap_mfn(mfn) ({ BUG_ON("unimplemented"); false; })
> +#endif
> +
>   /* On MPU systems there is no translation, ma == va. */
>   static inline void *maddr_to_virt(paddr_t ma)
>   {
>
> But feel free to ignore if it’s not desirable.
Actually, makes sense. I have included this in my v5.
>
>
>> diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
>> index 21bbc517b5..ff221011d5 100644
>> --- a/xen/arch/arm/mpu/Makefile
>> +++ b/xen/arch/arm/mpu/Makefile
>> @@ -2,3 +2,4 @@ obj-y += mm.o
>> obj-y += p2m.o
>> obj-y += setup.init.o
>> obj-y += vmap.o
>> +obj-$(CONFIG_ARM_32) += domain_page.o
>> diff --git a/xen/arch/arm/mpu/domain_page.c b/xen/arch/arm/mpu/domain_page.c
>> new file mode 100644
>> index 0000000000..b9ebb03d67
>> --- /dev/null
>> +++ b/xen/arch/arm/mpu/domain_page.c
>> @@ -0,0 +1,40 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#include <xen/domain_page.h>
>> +
>> +void *map_domain_page_global(mfn_t mfn)
>> +{
>> +    BUG_ON("unimplemented");
>> +    return (void*)0;
> return NULL? here and below
>
>> +}
>> +
>> +/* Map a page of domheap memory */
>> +void *map_domain_page(mfn_t mfn)
>> +{
>> +    BUG_ON("unimplemented");
>> +    return (void*)0;
>> +}
>> +
>> +/* Release a mapping taken with map_domain_page() */
>> +void unmap_domain_page(const void *ptr)
>> +{
>> +    BUG_ON("unimplemented");
>> +}
>> +
>> +mfn_t domain_page_map_to_mfn(const void *ptr)
>> +{
>> +    BUG_ON("unimplemented");
> Not really necessary, but if you want: return INVALID_MFN;

The function is still technically unimplemented, so I will keep that and 
add return INVALID_MFN;

The rest of your suggestions are perfect. :)

I have incorporated them in v5.

- Ayan

>
>> +}
>> +
>> +void unmap_domain_page_global(const void *va)
>> +{
>> +    BUG_ON("unimplemented");
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> -- 
>> 2.25.1
>>
>>

