Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EC78C77F3
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 15:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723350.1128121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7bXM-00052D-Ng; Thu, 16 May 2024 13:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723350.1128121; Thu, 16 May 2024 13:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7bXM-0004yt-Kc; Thu, 16 May 2024 13:52:48 +0000
Received: by outflank-mailman (input) for mailman id 723350;
 Thu, 16 May 2024 13:52:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6R0U=MT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s7bXL-0004v6-DZ
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:52:47 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e88::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9285b3e0-138b-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 15:52:46 +0200 (CEST)
Received: from SJ0PR13CA0129.namprd13.prod.outlook.com (2603:10b6:a03:2c6::14)
 by MW3PR12MB4394.namprd12.prod.outlook.com (2603:10b6:303:54::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.29; Thu, 16 May
 2024 13:52:42 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::9e) by SJ0PR13CA0129.outlook.office365.com
 (2603:10b6:a03:2c6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.12 via Frontend
 Transport; Thu, 16 May 2024 13:52:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 13:52:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 08:52:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 08:52:39 -0500
Received: from [172.25.174.161] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 08:52:39 -0500
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
X-Inumbo-ID: 9285b3e0-138b-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvDcpkHR/OqiTxtQHbcvsg5iNPgiyBsegq95yESeCfpoV8ZZJ05xJJVWj6LZnn/X4YWQzT+BZgMDxCeQHiSedD+wBPWLmiSEGGuZZEDLDw660cA5LAkBntT0+jek3luv4jOOZnYtFsrelufIa0TiADTbkd+bhl7nZIN7a5R+1heR4hXDz34vCCv6GsaYniHXQFNu2Rxh/bvF/OuBs9b4jwaiWtX2SnbsdT/M50wLkjVe4WqhxUElLLzOyJ2BgMkt1LXjdEaZP/VyUTTp5Dv67V9u2zQeWCFoysHi6Q9HkFdktneU2ASxt3JmJYzxlX8Zks06I5aKiSWR2jcKK8TpUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUj5FOqbKH7wwT1u1EJdGkPcJ91VQKVB3nhPZyk750A=;
 b=jfRU/A5eTVg+yAxNntV+2VcNGBJFxJ2GLRmm97B9Sfmvd7D8yOFaCC8F3ZzftmKf7H5k6joL1FuCTtYm8oT6kaiNPDCmYVAHupgEe+U44F8+3weuBmou9xMmQwdp0mJY5HLzadhN7nsWLrRoYVuuhYWoE21Z0wXIP0YfTP6kY/rPIl2dswMRLAE70XMphoZnpdSIBeWc1F5z91/Vy7cdwniUia2aubkJmsqj3SASSYGL3ZH3R4usRtyQ97Li0E/c1+NCP/YeV45pnxhoyvkzSgbK6n85ttRsfVZaFOK0YH4UxrfvyLzxdhUBjmugJP5hnZpkUPrNguR0juiwb5uoMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUj5FOqbKH7wwT1u1EJdGkPcJ91VQKVB3nhPZyk750A=;
 b=PZ6H76y2FKlDS/nyKhhA5oPL89xTRzFE7QSpYVQ9LSMKxvxWhV+dut02Cen9Qbd1vCbgo8q04CWK7YM9zQdmz0mT96RRJ1umGfamDR1R2n7HrbVVIUAApn581qsbLzQ/25HYHu7nyZ4ikdOf3bxwpvsziT9LyweCqp3QtU8GOKE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <9678073f-82d5-4402-b5a0-e24985c1446b@amd.com>
Date: Thu, 16 May 2024 09:52:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hotplug: Restore block-tap phy compatibility
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jandryuk@gmail.com>
CC: Anthony PERARD <anthony@xenproject.org>, <xen-devel@lists.xenproject.org>
References: <20240516022212.5034-1-jandryuk@gmail.com>
 <64083e01-edf1-4395-a9d7-82e82d220de7@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <64083e01-edf1-4395-a9d7-82e82d220de7@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|MW3PR12MB4394:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ec1f20-3d86-4d9e-0bc7-08dc75af7453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnNkRGdpRzR0WldmdkVsYWV6aWRDWGZ1K2NscHhBVHJwdjd6THhiWjRGcEF0?=
 =?utf-8?B?aWxvWjFYWlVLck5CZkU5WGVoNEpubENYaCt2NGVFeGdoTTJ5TnJ3OEVXNHNj?=
 =?utf-8?B?RVpJd2F1S3ROaDVmSHFWTGcrRUpNd1Zkcm5yWWdzazlFeitEbFNKR1FVQjRQ?=
 =?utf-8?B?ZjNRVGd6b2E3NnR3eGtuajFLU3llVE8wanl6cGFoZDM5YlpYYzlNYlBFczNO?=
 =?utf-8?B?d2NTYldzS0JhcTNXaitsWGFzTGd5QVVub1FKVExkdGgxQjNLcUVhdXhFM0Fa?=
 =?utf-8?B?ODJhYTdESndaVjFYQU5hZUdBeDJIQU5zTnB4YjR6eW5yTG1iOTFOV0RLbTE0?=
 =?utf-8?B?TWZuaVRhVnp1RENFUmw0aGNaU1kvSHdMQVlSRUFpSXBadmZ3WWZxcldCSnRv?=
 =?utf-8?B?aVhyVXJVVmRZSWd5Z2RTclNiMWhCUmIxaFlNMzB1WWV1SVc4d3g0cXQyY0hV?=
 =?utf-8?B?Y21heFlwWFE3L0ErN3RWVkpXcm5palZNNlZoZjB0VWhKUURyTnJKSjdSbDBk?=
 =?utf-8?B?MStEaXBtaWZhWWdRZ2tzME1OS3JkTlBLRFExa3JsNzVRbno4bitDWStrZXRu?=
 =?utf-8?B?UVNCanE4M1drRDBFVDNMSnhob29vSkJlTmtWYnNSc3A3anBCUXpYN0FsaXdZ?=
 =?utf-8?B?eDd1ek00RC9WaU9aaVVOWjdyV1Zxd0FaOEtVa0hLSEhhcU41ajNSS3oyd3I5?=
 =?utf-8?B?dHRIdVZPYlJKTkxQVXlTWmIxajVDajVDam4vWUVJbjh5Vk9YWG5RSnIyYU93?=
 =?utf-8?B?Q2hHS09naXVFR2FCY0sxekV1YnFCdEhUWHJCTnNxcDFXY0EvRDVTdzZRQVdB?=
 =?utf-8?B?NlpUOXlxWXFZYnZyWUtiY082ZTVHdExxd09wZTdDVStFSE5ENmFnWjhIZk9E?=
 =?utf-8?B?U1p6Q2x0RWxwaU9SRzFoRUhZNFlSaHB0TDF4Tm5ES1BiOVhHWFJET3VNbVJ2?=
 =?utf-8?B?dU41dmszamJzbzgraXRvUk9wZlJiL1lEdlkwN2o0VFNBcDhzdDBKNU54TzUr?=
 =?utf-8?B?ZmszbXo2MEJ6ZHJnSXkra2w0bGozMlNwYUlGa2tDaE5TMHEyL2xmRFNYVzdi?=
 =?utf-8?B?bE1WeHNLamhvRXczN0cxZUJJWHZjSFVQemJNUDBuTkNnL2Q3dWwrZFlXdFlq?=
 =?utf-8?B?MlBMWHlwMFBtRFBCZmZlMlJ1enJpMmJnSzBSYWNqdFpTaW1Yclp2UE52TlFw?=
 =?utf-8?B?SEFKU1hrUlBlekVYc3ptSzJXb3dpRk5JUGU1dUVsdlkyL1lvdFNHTW4rQUJT?=
 =?utf-8?B?V3psQWxka0FFb1puNHNFVmswejljMTVUTTBVYkxKV2p4cHlnQko5TTZpZDFr?=
 =?utf-8?B?Q2NjWHBQMHplbmMrSHYwVDFSV21JSUsyTGhDaDNPaFNXWDBWWXAzU2ZHbGY1?=
 =?utf-8?B?Nk1FNG50dWwvMDZEYThMN0Rab3pPMHlTNmt4SWZYWUVPNlBFWkkvMlVwWER2?=
 =?utf-8?B?MUUxMDA4TGwvQmtRZDBpSGVDRnZ3ZEJYekNGUml4OGxpSEgwT0tHaGdPVVlC?=
 =?utf-8?B?Ny9sZHZhMjJHUUg5Mld2N2Y3cE5vWFF2bkM4ekNaY0huUlA4eEV4OFQ1bHFP?=
 =?utf-8?B?MnMzZHdPcEw5M3ZVNjZMOHprcXZPc3h3aVJ0SGZXalVFcDdlaFBucGZWZFRP?=
 =?utf-8?B?bFVtZ3NYSFVtYzRKbThvdFdhVEIza21JVWx1Z0RMMngrSVU3OVF5NEhmRFpO?=
 =?utf-8?B?U0Q2SjhSMlRvdEhRSjlrRTh0dWI1UWVmS1FTZVZ1ZmQrdzF6TGxMUGNmNHkr?=
 =?utf-8?B?Zm1CVUhnZmtub3VRQUxOeitXa3JXWWMrT2o5eHZ3RVRkbGlsWlhuZzk3eHM2?=
 =?utf-8?B?cmFpWlltQy9XM2k2QjZzdjE2TXgrZ21RbzdhanduVDJWYkpycVRaT005b1d5?=
 =?utf-8?Q?SoxNvPnQBp0Wu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 13:52:40.9062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ec1f20-3d86-4d9e-0bc7-08dc75af7453
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4394

On 2024-05-16 03:41, Jan Beulich wrote:
> On 16.05.2024 04:22, Jason Andryuk wrote:
>> From: Jason Andryuk <jason.andryuk@amd.com>
>>
>> From: Jason Andryuk <jason.andryuk@amd.com>
> 
> Two identical From: (also in another patch of yours, while in yet another one
> you have two _different_ ones, when only one will survive into the eventual
> commit anyway)?

Sorry about that.  Since I was sending from my gmail account, I thought 
I needed explicit From: lines to ensure the authorship was listed w/ 
amd.com.  I generated the patches with `git format-patch --from`, to get 
the explicit From: lines, and then sent with `git send-email`.  The 
send-email step then inserted the additional lines.  I guess it added 
 From amd.com since I had changed to that address in .gitconfig.

>> backendtype=phy using the blktap kernel module needs to use write_dev,
>> but tapback can't support that.  tapback should perform better, but make
>> the script compatible with the old kernel module again.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Should there be a Fixes: tag here?

That makes sense.

Fixes: 76a484193d ("hotplug: Update block-tap")

Thanks,
Jason

