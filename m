Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E59743F98
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 18:19:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557580.871058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFGpR-0007IK-UO; Fri, 30 Jun 2023 16:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557580.871058; Fri, 30 Jun 2023 16:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFGpR-0007FH-RH; Fri, 30 Jun 2023 16:18:37 +0000
Received: by outflank-mailman (input) for mailman id 557580;
 Fri, 30 Jun 2023 16:18:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w8ty=CS=intel.com=dongwon.kim@srs-se1.protection.inumbo.net>)
 id 1qFGpQ-00077E-SA
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 16:18:37 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c10e8b43-1761-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 18:18:33 +0200 (CEST)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 09:18:30 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2023 09:18:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 09:18:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 30 Jun 2023 09:18:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 30 Jun 2023 09:18:23 -0700
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by SN7PR11MB6874.namprd11.prod.outlook.com (2603:10b6:806:2a5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 16:18:21 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::b33c:de68:eacf:e9c4]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::b33c:de68:eacf:e9c4%3]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 16:18:21 +0000
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
X-Inumbo-ID: c10e8b43-1761-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688141913; x=1719677913;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=1RoFsUtIl4m4Jy2z09xkPKdoCxdBiU5Y3E1w8N8qHFo=;
  b=U75d2S6othUn8w2eCO7i/kPU+70u7xZU4I5NCFqjKbl+iIadb6vXFqyP
   WYOX047Jh/4IOAMWLnyw3zIzfCcWNA10D9f05CrabjHhX/YiaGZl+G9QZ
   tlAwCX/SLMjVrlcsnlPWoYNFFMM6v8ks0a5jEiYR4NXcTxWczSzgGcVYQ
   LX/nAL/LkDfvYNiooC0txHx7A0X8X8dGhpJjZ+H7u9QXkcc0XRCoyxpzC
   f3WeGkb6g8WZWi/MbOfMgvckzJGetf1mSYQ9ENCOdTKlfLCUJB2CURXIC
   25hCnuhAIkgVtCc46nysv9g4WwwaO3+3u4NqsB0B8ne0FW4xohlm7fAix
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="428476228"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="428476228"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="964450424"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="964450424"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GigzMC/zOZ35bD1LyH9K5lpUgdoI7VDgvpQnGs4GLWRJiVP2TLwhGqW/euGhDxzuizpLGgnNTm/H1AyY6+KihT/n7bZkb48afkIspctTPUAMvUEpwtzberJq4Y3S0j6bRZ3dpCl7tZiHGo94gV/JEOFiY6LpKslcW2b+BNV3LlKksGP5J7xHoxiKSGbb/XrX9DduBVfIVr4AzqmhhFUxD2Ik4A00KgCRV8K1KsfqLYukvvtgRYORjp5e3LHeKdP1PEPtBgGwz+OwhlFTs+ZtNMUXFnwtMxro4tOTeNv5Ml9EwCWLVHqKhuRqkSknOpH/O4yyhIwdDNg5rejeyfLlUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoBdhZV6z1gwbFKh2TDZZVIIHq2xn2PQGFAiSTDlYiM=;
 b=lqUgMfYhccZn3IyAm76cnWqIYV5//6WrDTMqO5DYGVcM5t8wINzUgLLl4jeNhHcwAXhK6L0Vlqwwgeiy6M+kZcBe1lh7v0yLUlXakaDe5//GNBmhbOA6pzagAfDKxJJV8uec8r7OH4wFisM3sJ3GmSBOmoEQoYDs6QWIHx0nhSmBuo2Wv7VTDxSIhkBn64Agq5HtVro4WrMh1wPfkM88ef2LftqlitYSGOdHA0vncqUZz0XjfDrLeqZhpMBcQTdINdmBLgT2LZ1QuZ0PQe1sC2u2vXrrFZjBbLYf3U/J9uyI0DDs3ZTXCareCCWnUi/O3F8HuwHbwPaNjn2WsGx0gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Message-ID: <5edb57f9-4c11-270b-a9de-c176ec1875fd@intel.com>
Date: Fri, 30 Jun 2023 09:18:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [QEMU PATCH 1/1] virtgpu: do not destroy resources when guest
 suspend
Content-Language: en-US
To: <xen-devel@lists.xenproject.org>
References: <20230608025655.1674357-1-Jiqian.Chen@amd.com>
 <20230608025655.1674357-2-Jiqian.Chen@amd.com>
 <980355eb-0241-2690-8ba4-3f136dd8555a@intel.com>
 <BL1PR12MB584957276B8CD25F6E35DD61E72AA@BL1PR12MB5849.namprd12.prod.outlook.com>
From: "Kim, Dongwon" <dongwon.kim@intel.com>
In-Reply-To: <BL1PR12MB584957276B8CD25F6E35DD61E72AA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:a03:255::8) To PH8PR11MB6879.namprd11.prod.outlook.com
 (2603:10b6:510:229::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6879:EE_|SN7PR11MB6874:EE_
X-MS-Office365-Filtering-Correlation-Id: 5616823d-fe5d-4928-9e93-08db79859ed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y/q2XJBiUe4cQWP4ObAFpsx6jNdqQIruMKZcKpln2rBzZ1lGArgSDE8qxHQPob+7KWKXCwbA5lgexqeZPWblACa3hwR/KH8LiMN6d1OkTU0Yk0aKYGB49r9aVyi5c7NnVfI4HT4/eoYp+qzborrzi3A+++EIvnFaC7AipR+iXG2381BoEmbFOG5AL5n5rBqCp5l6lSS0vQHf5TMWw0c080/E2J3m6hnVcR7c1KPV/OeJWiWJBRSy7ZgEnMqHHA/Fbn8qTnVwtwBangqTgxy9aLew29w8ZidLTP8kFKgxC/exdWocfX0dRoMy9nrczBhE/wizO+Ga5J4UN5l3m9GC8VXBGObx1Ma9JQUpk5WAhVQFORdx/8Q843/ILFPw7EN1ZeV/fwPm1Mxi7DfCMTLrBziZ3QSnP4eEmL+Okbs7Vw2IRGVVFnzZw7Aqx43OJ0iLc7LedW27K9DRf+0j22BaEjTW57jafe8lyDqUnJvyI03b3M5zFTU5nKqEdvuxnQRDy0Ajd3igDoElKpAB3vSeU8yV6NjWHBP/Kdy/VTAx4gnHbNmrP0IpliTzV9X2pwt8GhYUh00CFjr9PpKeJXr+ANSjKS2A67m5REzAOkLUKHjHNqUcnm4fFxOfX5H4TfUo06N65E8nV6zp0Bryn+Njug==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6879.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(366004)(376002)(396003)(451199021)(83380400001)(15650500001)(2616005)(2906002)(38100700002)(82960400001)(36756003)(8936002)(8676002)(5660300002)(86362001)(31686004)(6512007)(41300700001)(66946007)(66556008)(66476007)(6916009)(6666004)(316002)(6486002)(478600001)(186003)(31696002)(53546011)(6506007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkNZRml5aitBa2Q4YW9JNjl6amdsbVErTHFqUW4rV2lYVDBlUHVpVFc5em9y?=
 =?utf-8?B?bTRBVkVibTRPWGRUUHBnRm8waWJpY01pSDYyMEJjamI4MzVsKytYZzc5WFU1?=
 =?utf-8?B?VkZ3cUJ2cG9KM1JwbmdtUjRnc0VHSGFndm92czNmYnhpcUt4S1dnamZPY1gz?=
 =?utf-8?B?L3NnNko0RDNmc3QzZC9JL2Q1ZkJUVTFScmdJUFVJTS83TFBRUk9EVC9NbU90?=
 =?utf-8?B?cDRJZWFDMERwelhhTE8zdkdidHkvYTVrT2YxUXhqVmJkV1RuNVNWM1dvMjJF?=
 =?utf-8?B?c0tLNGk2TmJMY0FWK3JhYUllVlJUdFFGYmpwaDE3MmJZS2pNOHVvb3Q2VVZV?=
 =?utf-8?B?c05IUjNBN3BobzVlU2ZyYmJFaTlTZVBjRUlJTUtRTHVaV25zSHNZa1haNjRU?=
 =?utf-8?B?SVM1alBLNWY1clhDbGN2Wm8xTTZ5bFZqOEVlc3RIVGZaZTZtTnZBM3Raa3Mz?=
 =?utf-8?B?YXdGeDVnS2VnN0pmRWptV0k4eFNkR2NRZnRwUHRxQ2JDeGxiSG15ZGlkOGJi?=
 =?utf-8?B?b0ZmalF0ODk1NGhyeG05TU81TW5lUVh5MkJlRis4ZDlPbFEwampnVWpVcS8v?=
 =?utf-8?B?R0JNSUpzVkk5STVmN0t2RW83TmNURWFXSFptcGplWEhMWGNEdmVvSis5RjFt?=
 =?utf-8?B?TE9kWDJ1azFNM2hrVXJzR0VLT2RWemZ0K3VMdHFpaVBMVlJ4eTZUTmN4YzhE?=
 =?utf-8?B?Y2lWSlNxWCtvdERuTCtWa3lvL3BZMEt4dlJJUGp2citFTW1aVmZFUTdrV3Yv?=
 =?utf-8?B?MzMxN3dVTERwemtYSFc2Q1hCV2FsTnFxVG9Ub0kxZ0Y3WjhPM3loNnFMaU1i?=
 =?utf-8?B?aDZSb0dFQldWK1dzSmFFNFJMRzZGZ1Z5R1dYOVF0Vnd4NkxoY0tvYWlpMDFB?=
 =?utf-8?B?bHA2cS9QN3FtRmllUEpwUTRseG11dU9LNXRzdUgySlplaGVRWE5XeURyNWNv?=
 =?utf-8?B?U25VQVd4THU1UGtnVGEvQm10bDR6MFVza1BKVk82UUd6dlZ2aEcwSzRhUTZm?=
 =?utf-8?B?N3JRNE5nMEZQZWg2WC9IYTdlSkQxTjYybk1YeDdVcHp0ZzFUakJUWlZnL3pt?=
 =?utf-8?B?TWVrNDBEcmlnQWNJdEsxSG1yNHhsTk5Rcno0S3NmV09uM1VMUGFlK0NQRlRr?=
 =?utf-8?B?ZTRnQjhOcWJmSERjalRmY3ZIVmw4NnVLOGp6UkpLejF5TEtjdU1JV1lGOXpq?=
 =?utf-8?B?QUpRWTI1cngxU3pPOGRjcEpVWVNCRkhZTUdTeHY3YnFkQWpIZEJFOUxYa01v?=
 =?utf-8?B?ZndvUkhBSTArOFZYZEd2c3RmSlN5cVl2eVZRdDVuWkRkd0dnREtBZlMrU0Qr?=
 =?utf-8?B?bzNKazl3YitDK29TVGlEUk1YSndjakVnZ3pkVHVaZGNsdjNEMnZEcCtIVlJ6?=
 =?utf-8?B?U3pBNk95c0tvTXF1ZU13R0tMaTgvdjB1T1lkQTRsMmpwcWZQNko0WDFHd0dt?=
 =?utf-8?B?aDhQQjRxRHhsZC9LaDl6RlpsYkVIem9CWk8zY3kvR0UzTW1BWU5Cc25oS1Z0?=
 =?utf-8?B?S2FmWUE5N09jTVY3T1V1a2pDOUlGaFlJSWNWdHB4aHc0Q2l1bDcyR1lsYXdL?=
 =?utf-8?B?S1gyYXh0VGM2V2ZmYkVlYTNLeXB1eWJSREpyeER2d0JSajc2Vy9JZ3BVbDdx?=
 =?utf-8?B?RmlvMmUyTHQwS0J0ZmZ6eCt1eStFb0p4RGdKYk5obTBVS094ZzBiMnBHMGxM?=
 =?utf-8?B?SXJTUUVROUJWV1Q5Q0ZoYXF6TEVwVkZBNjAxTis5bW1IeFBpK3lDeFFwQzNP?=
 =?utf-8?B?WnBPNGpsakxSZmdMUHUvVjVWWlpIRlF2MU5yVzJDQVJ4ZmdnalRCOU13Wkx2?=
 =?utf-8?B?WDArOFFiUW96bFJGSEs3MVY5Y0JGOFFoSDVsUGpTeGZyQVRFY1hxdUV0N2Rk?=
 =?utf-8?B?b2FOTG94c2V3NkNjRWg1YXg1Q1I1dk43YUc4akkvWDNtMjI5bEJHS1B5YkJp?=
 =?utf-8?B?aVBabktXYXFIOFRNcVcwSldBaG1FTmxMV0VtOWNXSXA2ZzZlZFdlYkl4ckx6?=
 =?utf-8?B?aVZDMjFNM2NzYmlzYjhZT1AxTUN4NDJNNVRaWUtNMm9DY3l3bW02dGp3RGdP?=
 =?utf-8?B?a0tieXYvR0VxVTVvS3dpckVna3NSQ05tNXVkbmJyTUdJclV4bW9nOFdGakxR?=
 =?utf-8?Q?5HjqD6JFSHvR+EKkUoZHvgx6H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5616823d-fe5d-4928-9e93-08db79859ed9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 16:18:20.7514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmDNSZp/65GlUuo5nBo4CPwOUXvWnfIoGfFFdmekkhe/F7bXb3XSJ+ETgolU2kb7pOWAAhwrt29kVybam+SHmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6874
X-OriginatorOrg: intel.com

Hi,

On 6/30/2023 12:14 AM, Chen, Jiqian wrote:
> Hi Dongwon,
>
> On 2023/6/30 00:53, Kim, Dongwon wrote:
>> This method - letting QEMU not remove resources would work on S3 case but with S4, the QEMU would lose all the resources anyway as the process will be terminated. So objects restoring was only option for us as
> My patch is for S3 function on Xen. I haven't tried S4 before, I will try S4 later.

I understand s3 is your priority but this code path will be executed for 
s4 as well, so I think we should make sure s4 is covered as well.

>> in [RFC PATCH 2/2] drm/virtio: restore virtio_gpu_objects upon suspend and resume (lists.freedesktop.org) <https://lists.freedesktop.org/archives/dri-devel/2022-September/373894.html>
>>
>> But I only considered and tested cases with scanout blob resources, so this may not cover other resource types...
> I tried your patch, but I can't success to resume guest and guest crashed.
Hmm, probably due to some difference in the setting. Are you using blob 
guest scanout (sharing display by sharing scatter-gather list of the 
buffer for zero copy)? We may have to debug it little bit. Anyway, the 
patch I shared is based on "recovery" instead of forcing QEMU to keep 
the resources. I think this is only way to cover both S3 and S4. Why 
don't we have some time to look into this path as well?
>> On 6/7/2023 7:56 PM, Jiqian Chen wrote:
>>> After suspending and resuming guest VM, you will get
>>> a black screen, and the display can't come back.
>>>
>>> This is because when guest did suspending, it called
>>> into qemu to call virtio_gpu_gl_reset. In function
>>> virtio_gpu_gl_reset, it destroyed resources and reset
>>> renderer, which were used for display. As a result,
>>> guest's screen can't come back to the time when it was
>>> suspended and only showed black.
>>>
>>> So, this patch adds a new ctrl message
>>> VIRTIO_GPU_CMD_STATUS_FREEZING to get notification from
>>> guest. If guest is during suspending, it sets freezing
>>> status of virtgpu to true, this will prevent destroying
>>> resources and resetting renderer when guest calls into
>>> virtio_gpu_gl_reset. If guest is during resuming, it sets
>>> freezing to false, and then virtio_gpu_gl_reset will keep
>>> its origin actions and has no other impaction.
>>>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>> ---
>>>    hw/display/virtio-gpu-gl.c                  |  9 ++++++-
>>>    hw/display/virtio-gpu-virgl.c               |  3 +++
>>>    hw/display/virtio-gpu.c                     | 26 +++++++++++++++++++--
>>>    include/hw/virtio/virtio-gpu.h              |  3 +++
>>>    include/standard-headers/linux/virtio_gpu.h |  9 +++++++
>>>    5 files changed, 47 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
>>> index e06be60dfb..e11ad233eb 100644
>>> --- a/hw/display/virtio-gpu-gl.c
>>> +++ b/hw/display/virtio-gpu-gl.c
>>> @@ -100,7 +100,14 @@ static void virtio_gpu_gl_reset(VirtIODevice *vdev)
>>>         */
>>>        if (gl->renderer_inited && !gl->renderer_reset) {
>>>            virtio_gpu_virgl_reset_scanout(g);
>>> -        gl->renderer_reset = true;
>>> +        /*
>>> +         * If guest is suspending, we shouldn't reset renderer,
>>> +         * otherwise, the display can't come back to the time when
>>> +         * it was suspended after guest resumed.
>>> +         */
>>> +        if (!g->freezing) {
>>> +            gl->renderer_reset = true;
>>> +        }
>>>        }
>>>    }
>>>    diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>>> index 73cb92c8d5..183ec92d53 100644
>>> --- a/hw/display/virtio-gpu-virgl.c
>>> +++ b/hw/display/virtio-gpu-virgl.c
>>> @@ -464,6 +464,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>>>        case VIRTIO_GPU_CMD_GET_EDID:
>>>            virtio_gpu_get_edid(g, cmd);
>>>            break;
>>> +    case VIRTIO_GPU_CMD_STATUS_FREEZING:
>>> +        virtio_gpu_cmd_status_freezing(g, cmd);
>>> +        break;
>>>        default:
>>>            cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
>>>            break;
>>> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
>>> index 5e15c79b94..8f235d7848 100644
>>> --- a/hw/display/virtio-gpu.c
>>> +++ b/hw/display/virtio-gpu.c
>>> @@ -373,6 +373,16 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
>>>        QTAILQ_INSERT_HEAD(&g->reslist, res, next);
>>>    }
>>>    +void virtio_gpu_cmd_status_freezing(VirtIOGPU *g,
>>> +                         struct virtio_gpu_ctrl_command *cmd)
>>> +{
>>> +    struct virtio_gpu_status_freezing sf;
>>> +
>>> +    VIRTIO_GPU_FILL_CMD(sf);
>>> +    virtio_gpu_bswap_32(&sf, sizeof(sf));
>>> +    g->freezing = sf.freezing;
>>> +}
>>> +
>>>    static void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
>>>    {
>>>        struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
>>> @@ -986,6 +996,9 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
>>>        case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
>>>            virtio_gpu_resource_detach_backing(g, cmd);
>>>            break;
>>> +    case VIRTIO_GPU_CMD_STATUS_FREEZING:
>>> +        virtio_gpu_cmd_status_freezing(g, cmd);
>>> +        break;
>>>        default:
>>>            cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
>>>            break;
>>> @@ -1344,6 +1357,8 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
>>>        QTAILQ_INIT(&g->reslist);
>>>        QTAILQ_INIT(&g->cmdq);
>>>        QTAILQ_INIT(&g->fenceq);
>>> +
>>> +    g->freezing = false;
>>>    }
>>>      void virtio_gpu_reset(VirtIODevice *vdev)
>>> @@ -1352,8 +1367,15 @@ void virtio_gpu_reset(VirtIODevice *vdev)
>>>        struct virtio_gpu_simple_resource *res, *tmp;
>>>        struct virtio_gpu_ctrl_command *cmd;
>>>    -    QTAILQ_FOREACH_SAFE(res, &g->reslist, next, tmp) {
>>> -        virtio_gpu_resource_destroy(g, res);
>>> +    /*
>>> +     * If guest is suspending, we shouldn't destroy resources,
>>> +     * otherwise, the display can't come back to the time when
>>> +     * it was suspended after guest resumed.
>>> +     */
>>> +    if (!g->freezing) {
>>> +        QTAILQ_FOREACH_SAFE(res, &g->reslist, next, tmp) {
>>> +            virtio_gpu_resource_destroy(g, res);
>>> +        }
>>>        }
>>>          while (!QTAILQ_EMPTY(&g->cmdq)) {
>>> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
>>> index 2e28507efe..c21c2990fb 100644
>>> --- a/include/hw/virtio/virtio-gpu.h
>>> +++ b/include/hw/virtio/virtio-gpu.h
>>> @@ -173,6 +173,7 @@ struct VirtIOGPU {
>>>          uint64_t hostmem;
>>>    +    bool freezing;
>>>        bool processing_cmdq;
>>>        QEMUTimer *fence_poll;
>>>        QEMUTimer *print_stats;
>>> @@ -284,5 +285,7 @@ void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g);
>>>    void virtio_gpu_virgl_reset(VirtIOGPU *g);
>>>    int virtio_gpu_virgl_init(VirtIOGPU *g);
>>>    int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g);
>>> +void virtio_gpu_cmd_status_freezing(VirtIOGPU *g,
>>> +                         struct virtio_gpu_ctrl_command *cmd);
>>>      #endif
>>> diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
>>> index 2da48d3d4c..aefffbd751 100644
>>> --- a/include/standard-headers/linux/virtio_gpu.h
>>> +++ b/include/standard-headers/linux/virtio_gpu.h
>>> @@ -116,6 +116,9 @@ enum virtio_gpu_ctrl_type {
>>>        VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID,
>>>        VIRTIO_GPU_RESP_ERR_INVALID_CONTEXT_ID,
>>>        VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER,
>>> +
>>> +    /* status */
>>> +    VIRTIO_GPU_CMD_STATUS_FREEZING = 0x1300,
>>>    };
>>>      enum virtio_gpu_shm_id {
>>> @@ -453,4 +456,10 @@ struct virtio_gpu_resource_unmap_blob {
>>>        uint32_t padding;
>>>    };
>>>    +/* VIRTIO_GPU_CMD_STATUS_FREEZING */
>>> +struct virtio_gpu_status_freezing {
>>> +    struct virtio_gpu_ctrl_hdr hdr;
>>> +    __u32 freezing;
>>> +};
>>> +
>>>    #endif

