Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DB0A7A025
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 11:36:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936425.1337676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0GzI-0007J1-7I; Thu, 03 Apr 2025 09:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936425.1337676; Thu, 03 Apr 2025 09:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0GzI-0007HE-4S; Thu, 03 Apr 2025 09:35:52 +0000
Received: by outflank-mailman (input) for mailman id 936425;
 Thu, 03 Apr 2025 09:35:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t8zK=WV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u0GzG-0007H8-Bf
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 09:35:50 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2415::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06b2ff9b-106f-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 11:35:49 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH3PR12MB8849.namprd12.prod.outlook.com (2603:10b6:610:178::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Thu, 3 Apr
 2025 09:35:46 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.045; Thu, 3 Apr 2025
 09:35:45 +0000
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
X-Inumbo-ID: 06b2ff9b-106f-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sv9jqQQP85TheNWqgopVDvEk8hro7QI2ObbhO52rK8opPahHbk7verw9LGaA8KnTW/crpT6UZ0dG5QA482MiFrucYXsATPGXNyzYIf3CkUpx/8XLCjw57d42UdiAKtPBMxHBtueU0WAd5V8/DGNJJepO1I+mt8HRX96CePQ4BB5XGYdKLl1pvPQ8RpdOXm+Q2IfVtmlS3/1ghSt3DKXRkTErvXdp/pISOm2EcwHFVbSrmEoE+IEjHXdzKg9UiX0nDTPwHCOCJvlDNxhD86efMXaqzQNtB2KM8WBUYEy/nuyxFyaClmrqBjM3WpXKU1B34lt3N5jzm4FkD4IIityqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2Mo6Z1TodjxGYRpnAA31H0tyJUYgFl7YtnziJkp+9s=;
 b=gGoGm8oMczfHvNd5dj6wlPoR+tkiE258P/PfhtHaW0jI43tvSaJuIDKbYO/Un/lJUfQCex8oI9WpHsFqSsWCtSvhQmKWYqKkxEG0my5/3WR33H5pnKI5kU6VJ1hpfbMe0zw4fQ482X8g+L8yl0/rHyS3ehZP5HCF1Pri/8p2K9XwtqwPUIWecylWDVl/oVcFoXW1D4NdPxNxxjHG/EHtnU9jiY/vHQ6L9sahtQtaopTHWWQZFIESmT0lSM4VIb2cgIP8r5t5gFsytLRa+VHZVVRkRBUuvkAi6aXM7biiLnb6psLYMJ8qgsjVjiLQdD5yGa55IglDAmbd24rpmFrUHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2Mo6Z1TodjxGYRpnAA31H0tyJUYgFl7YtnziJkp+9s=;
 b=qHB2jj0uQJ9RNdFvV+07P6IhnNsS5pfOaOMtMG8tu3hvDMDB5T+0PxscjB13mNo9mFecLl7oNzl682zxSmjZ/aIG8BRb4lAWLdXCbavy1bfnGCrU8wq3MA61JEVr3A0H4yGNMbZfrCxKFcomLdyElTWH9pTKmASVZv/oGIMuyc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <65d12272-0ceb-4570-bade-5a0901264e16@amd.com>
Date: Thu, 3 Apr 2025 11:35:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation: Add Arm64 MPU build job
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
References: <20250403081916.6834-1-michal.orzel@amd.com>
 <20ac780b-f5ac-4531-997e-362d72adddd2@suse.com>
 <2a8ab261-480f-4bfe-b2b7-7fdff4516078@amd.com>
 <a67d260e-fe1a-44bb-8b49-fa0509716da2@suse.com>
 <44500161-1346-4c9e-bcb3-a4301c197913@amd.com>
 <235cb577-b28f-49ab-b0a3-94ab35572d83@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <235cb577-b28f-49ab-b0a3-94ab35572d83@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::15) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH3PR12MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d35a131-c201-4b2d-0b89-08dd7292e901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDQwR0dCK1lxRklYR1RsOW9jbzAyc2tuZlRadlRsaEJoMGZvV2R5akZhNlM4?=
 =?utf-8?B?enhXd2hUbjY5VW81anJMdmo3dyt6MkFGYmh3MUphRmdwWGZiWXJKQ28wOW01?=
 =?utf-8?B?Y2ZyMk5zMFMxNFpSaHJ2R1BrRWtPeFpUTEpZb3V6aWZKRkIyaSs0MUd5K0pT?=
 =?utf-8?B?Tk95TW9yejBKVHQ2THNOZnFUd3dHWHl3QVRXWUtWRXlMQWI3RVRGZWp5bi91?=
 =?utf-8?B?RUdSaHUvMmNNSUo0cTVqbEttQm9HM1BaZldDZTdBWkVjZEhhU096M01kSUZE?=
 =?utf-8?B?TjFXTndaRW5KTit4K1FOaE5HMWRxbWhxaXAyVWl3d2JzWjh1WDMwN3VXTy9R?=
 =?utf-8?B?VEtFMFA0eVQ0Ui8yL0h6dVV5cEdoTW12QWxjeU9yVmorb1I3TklmSEREUUFK?=
 =?utf-8?B?S1crVzBSOGpIcDE5REJOUXhIRlZSaFJZYmcreE5zWWdCK3BkczFPVVJaMzR2?=
 =?utf-8?B?NGYyYjB1TlN4bjBhY25HOEI5a3drN1dFR2RXZmVWcjJUMlFGNWU0eno1NVE5?=
 =?utf-8?B?QzBIMjE1RnRodnI1RmN6YVN0Qjg1ZHJBdWdqOUo1a0RMNy9jaS90ejVacVJs?=
 =?utf-8?B?Rnh4VVpFTC94YkxVQkdFMnNQenZpbFo3TVBKYXk5MDBaeDZrbzUyeG9KeUE4?=
 =?utf-8?B?NnNnMjJ3SWN4eVVqNlpxU25DK1B3QmZqWVV2bDZzRGJuSVRHb1dxVFRFSzZo?=
 =?utf-8?B?SFhMNnFaa0ZsbGxDR0ZNekNlNlhGRVY4eitsMXo2UmZ4YTNYWEZpTjNJVnJR?=
 =?utf-8?B?Rk80K2FBM0VhbTRWUXRGdzJEK3VGRXNURE5LdllTeDdBeW9VTmd2VU5zZTcr?=
 =?utf-8?B?WUV3SnJaM2VsajFGOTJ2OGRWYTR6VDBmMXNoUmYzRkd3ZW9UdTh6MTRnQUQ5?=
 =?utf-8?B?ZjhiYVZtY2QxOFpyYzEvcFRGaXo5RjBkWHJYZmxGM1pJRzd3SkIwc3BwWEpU?=
 =?utf-8?B?c3pFRUtaOUt4MmtickNWV1NLZ2hydnB1clJMNVF4RGROUWF3L05sUmtWV3ZC?=
 =?utf-8?B?bWRoYzVnM1cvU3pTdHZxcUM0VW1mMW41VzlSbWZmaEU2eklWZTkxVDNkbllL?=
 =?utf-8?B?VmlaN0RCNCtyZHN5WHo4NHV6WVhQMDcrdE92c0hNTkplY0tSajRPcldmeld2?=
 =?utf-8?B?aHNwSlNnem9wakxpRmZHa0JlbmtaQlJRZC9hU0FiQzNzN3NsM29kVFJZdnlk?=
 =?utf-8?B?c0dxQTkyMmtTeXFHNHNHU2RhWWlMcVI5eTVySXJKSElsVjNIYVdiZ0VFb2FS?=
 =?utf-8?B?K01GYUk5c0tkOUNGWXNRQzJxZmZucG02d0tOV0U1WUI1bGtjaWY1Q2tIWU51?=
 =?utf-8?B?VG5Ya0llUzljZU9XUDAyTTNJS3J2VjRTUC9BT1dIeG5DaitlVDY3ckR0VkFt?=
 =?utf-8?B?OVpIRStReHp3YXFYNGd6YnpIY1JubXJ4eGlnUWloQnpHK0JlcUZ0ckRncjB1?=
 =?utf-8?B?d3RTUTducnhwUnZZNUdJRmtJSFd2QUYvWUlrRWFSWkNPdHJZZTZGRDhqcTVl?=
 =?utf-8?B?akpPWlAvK3NtL1MrbzJWeWowRGRzSXRKUSsrQ0pjSU4wSXcvT0pzaW9PU0ZX?=
 =?utf-8?B?ZFAzU2V2UFZOK2g5VEQwdGMwaEcxcEtQSnF5T252VEM1ZkFnWHJKNGl6eUJK?=
 =?utf-8?B?TVpvM1RzWXk1Q3BtWGxGMlVwYXI4YTR6by9CdjZmRDhVTStBT3NIT0kzM3Iw?=
 =?utf-8?B?WWUwK3ByYWY0YklscXZueWNsc0d6WXVWSm9qZkF5bnJJM21CS1lWcm56SDBH?=
 =?utf-8?B?LzQ0Vy8vUytOdXRLWlYxVGU1eFQ1SFM3emRYOHJoRVJnYXM5dE5jbmcza2h2?=
 =?utf-8?B?eVlTOUVETkNtYVVNaVU1MGJuNGpLRGxxWWI5S2JybE1LQng2c2hUREZaT3Bw?=
 =?utf-8?B?Um5Mek93Vkx1RFhvZTErd0hHRHpad1NSUlluSkVUQjdmTzR6cUFQLzFFRjdU?=
 =?utf-8?Q?75v9+/qk7sw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2kzQWdFYVFPUWp5RkRkTU1VbU91TEIyd2E2d0IrWW4vaTljTDJIZlZHaHc1?=
 =?utf-8?B?RzY4bEFkd2FiSmE1bXZUZk4rbUF3N2xGZ3BMbXdRUENXREpnbEMwYitITkMy?=
 =?utf-8?B?elMrM1hqOEdUaitFdlR4TXpiZTd6UTkwUm1JaXR5eWhyQjVFYXBpSjhpM2E3?=
 =?utf-8?B?Y3V5a3R2WUNoOUVWL2picGR6OXZGR3BEdENnQXV0MHltNS9lRUtLYTB2M2xC?=
 =?utf-8?B?c1ovSjN1OHNzSUpxQWRJeUgrcHlYZllXUHdMMGRVNnFmTEMzMGJUY1lUQitN?=
 =?utf-8?B?cE1DK1BNSXIzS3MxTEkxSkNWUEtQaFNqM1dkamxHY3NIaURUNDVDTUFjNXpD?=
 =?utf-8?B?bnJWWk5nRytERFJyYnp4RjF6by9GUitzR1cwVEVPWjl1aFh0cU1xc0lwMHo3?=
 =?utf-8?B?Y2NkQTQ1dXRrR1IrcTNiMHhscm9JNjVrZjZXV1NocjJYTk4ycTdoMTBuQ1VZ?=
 =?utf-8?B?RTcya3lmRTMwMDA2UlhrQ0ZQM0Qyc1NGeUUzc0ZCYjI0eUNVc0JmcDVSRVhO?=
 =?utf-8?B?SlkxYnJycTV4MVZ3YXVrTkp2aGRFZ3BJRnM2a2xGbitxeDFGVVZ0OHl6YUo1?=
 =?utf-8?B?ZnJsNnFmTncvY0tONUJWckRSZEZ1RmlWNzEwT0g0RW5LaDN2N1BEaitxYmlB?=
 =?utf-8?B?bk1YakZoWDBhbkJEVlZSdDczODhWMDRzMG91TlhTbStuc2xDNWk2YzlTNHNh?=
 =?utf-8?B?Y0ViOWlJRUxSZmJ2dzU3SVRIMWpyOElabjN6aFU4Uk9JQ1p6TmJudGZ1b3hu?=
 =?utf-8?B?NUI5dFk2UHpnMUhFYW1LQWx6dkEvUGRSSUROdnZ2WjZTR0NYVDJMeHpsZ3V0?=
 =?utf-8?B?QXdSVnZFZUp6S1dRbkRBYVZrZ2EyL0U2ekRtVS8vdDFmUXlWMmRGYjd2cDRQ?=
 =?utf-8?B?dnpnOURLbnJFSGhWT0txZUtpUUtMTG1kRHl2N2NFRit2ZW16SDkvNk5pVita?=
 =?utf-8?B?c2M1a0t3S3A2ODVxNmw4WVBDREwwRU1zejZwMDhPS3kzMm10aXJJazU2aTdx?=
 =?utf-8?B?L2h6cnJPeU5WTy9VaHVuS1Y4cVFJeG5iazJwWStoNHlFMElHVEFZYWRmVi9r?=
 =?utf-8?B?Q2xkN3U4dXhrTEdjOUV4TWJmQlZsaWdOYWF0czJhd2p3by9uUnBWNmFSQVNZ?=
 =?utf-8?B?RnphRzFDMHhTUzBLOTBwUzM0U0JHMmpUdmZSUE1ZdVF1NFB2cmRmUldldUFr?=
 =?utf-8?B?MjdUUVNmWjN3cFFkL3Npdld3RjczN2dqYlREMTBiYkUvaWJNa3BXK01wTUR4?=
 =?utf-8?B?NDNhcmNiY08vUE1KUERkU2lDTzdDSzJCSTZ4SGF4MG5nZUJ6QW5NdGozN1NH?=
 =?utf-8?B?bUkzQ1Z4QTZmdS9Qb2hNQnljUlU0T0RPNEpOTXZVaVRoNnE5ZURFcU90ZG5J?=
 =?utf-8?B?STVSbVJOeVUzK3dwbm9yby8yNFZWT29UVlVqTlErOU9sUms3eWczVmE3YWpN?=
 =?utf-8?B?UVZqczZwQ3JybGJtTHJSMkFmM2ZRcXV3Q0R3WGpwdEJkZU0yNFZZQmxRL2JS?=
 =?utf-8?B?VkdRWms0SVJoZ2pkd2o4QU9iSmxXZzJqWUkwaTNSMUs5R2FPS212cHVtNnAv?=
 =?utf-8?B?angvUWRnQzhwRUpJVzNZNTcvbDh0cmhCOUd2anBOK095dVo5VythdllPYnhN?=
 =?utf-8?B?N1N3Q2Zzc0lIUko1ZHhZWlJJR3lnTHJXT1I5S3Q0M0xOY1NING9wR3ZqandT?=
 =?utf-8?B?K3V0d2FtQVpjdisvQ1Y2UHFtVGc0KzlxTjNybXR6M2NNYTJMUFA2WFlpSEsx?=
 =?utf-8?B?Qk9DRWdYdVRBTzVUckJEaWJpWmJPSm80WjV1VzRma0l4cVcxakt6ajY0Rldn?=
 =?utf-8?B?WUp2Q0pTSUN2ckZIZHhGMW1vN090Z3Q5L1JWb3hTYi9pWnFJUkxJUFlGbnQv?=
 =?utf-8?B?MU1VdjlrOXNuMFdWanF4Sys5ZUJuTUx0R2pYZThUM2V1TjdoYzF1VXR2SnRE?=
 =?utf-8?B?V1FmOVRheUE2d1NtOGhzYUkrVWg0WXZ0UitWNzdWd0ljeC96Sjl5NG9UNmR5?=
 =?utf-8?B?ZVBweXpseXhkYW1iWnV2V1pnVEdJTTluWDBaTHo5Z0srUU5zeGtTRy9aUFVE?=
 =?utf-8?B?VjNjMHRYUlFVVEFsVTBMRzZOYzdySUd4TS9NYWJMOUNldXU1ekFydTlQMmFV?=
 =?utf-8?Q?1AP0TzvY0HheXdLUI8L/IgOGi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d35a131-c201-4b2d-0b89-08dd7292e901
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 09:35:45.8115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbEIoC4YTy60Nj5uOUpOqbcAagcWqwUB00WemVF50lyR/ItpSH2QyRA/CRkasT9M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8849



On 03/04/2025 11:28, Jan Beulich wrote:
> 
> 
> On 03.04.2025 11:17, Orzel, Michal wrote:
>> On 03/04/2025 10:58, Jan Beulich wrote:
>>> On 03.04.2025 10:44, Orzel, Michal wrote:
>>>> On 03/04/2025 10:43, Jan Beulich wrote:
>>>>> On 03.04.2025 10:19, Michal Orzel wrote:
>>>>>> Just like for RISCV and PPC, the earlier we enable the CI build the
>>>>>> better.
>>>>>
>>>>> What about Arm32?
>>>> The series to enable compilation of Arm32 with MPU is still under review on the ML.
>>>
>>> Oh. Is MPU in Kconfig then missing a dependency on 64BIT?
>> Well, yes you're right although when I think about it, it's been like that (for
>> both 64 and 32) since the introduction of CONFIG_MPU by commit (in October last
>> year):
>> 0388a5979b21 ("xen/arm: mpu: Introduce choice between MMU and MPU")
>>
>> If you're saying that all the Kconfig combinations + targets like allyes/allno
>> need to build successfully also for new ports (MPU on Arm is kind of like a new
>> port), then I agree (I did not think about it and clearly others too seeing the
>> MPU patch above) although I'd prefer to avoid sending a patch adding dependency
>> just to be removed in 1-2 weeks. But I can do whatever you think needs to be done.
> 
> I'm far from insisting on a change here; you're a maintainer of that code while
> I am not. Yet I indeed think Kconfig needs to have the dependencies right, or
> else randconfig CI jobs may randomly fail.
Sure, thanks for showing understanding.

A different question (also to other people who knows this stuff).
MPU requires to specify Xen start address using CONFIG_XEN_START_ADDRESS that is
set to invalid default value to catch user attention. Provided that randconfig
can select UNSUPPORTED and MPU, we should somehow set CONFIG_XEN_START_ADDRESS
to e.g. 0 to be able to build successfully. Is this where we need to add
EXTRA_FIXED_RANDCONFIG to existing arm64 and arm32 randconfig jobs?

~Michal


