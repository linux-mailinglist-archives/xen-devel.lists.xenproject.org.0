Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD64739B61
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 11:00:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553421.863963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCGAN-0006SK-8R; Thu, 22 Jun 2023 08:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553421.863963; Thu, 22 Jun 2023 08:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCGAN-0006Pg-4m; Thu, 22 Jun 2023 08:59:47 +0000
Received: by outflank-mailman (input) for mailman id 553421;
 Thu, 22 Jun 2023 08:59:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vm32=CK=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qCGAL-0006PY-Ox
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 08:59:45 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e89::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20d89b26-10db-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 10:59:43 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM8PR12MB5480.namprd12.prod.outlook.com (2603:10b6:8:24::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 08:59:38 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 08:59:38 +0000
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
X-Inumbo-ID: 20d89b26-10db-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nk7AUtGZXl+CMPZJI4uZ2C6oKNU8D1m7STLrTgv5xU+XV9kgDvcWmmk50gY3PkhIuSf3d7hcpIg5SZhDjkl+TbWPGEie1zxZL0fYnQPl10HGdAQLlv603RvsCXDLORh047nUI5kmQDCjk8rFVT/9Ty+KZ4RnECcSCeQvIpcozXY+ngYZOzI7/HYbbkFhRb4tLPALA3ISzVeBbrlPR0uMgqkbgFvuPGCRqAGCrfZb00dySTH+BupyPGo2C7NQ8cGKXkzdO2xqW7CATf5sgUYWCAm5uYfg+yCCJaxJrDtCmaoneKBYqi/ap9HfH21w/LztGDsfrTbYbcDZuTq+UUebzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuwWAfHePFYTql2VkDF9PJx34FKsMPbER8xsNfTMRLs=;
 b=aUjXfWlW0mTa4CvPQZo1ArLEvJiTMl8ra19BLI/tP9jFBDeyb4uHdntgaINXE1PQ4k6XoGOgm+PIhBZiMyIEfYPgQeff65ET9vSufznrzNi7PwfvKA2mq6vxPlhBp0blDeiesd/j/gsFs2WAqsJYMbeXWY8l6AO1Y6/sCLV/vKY35T+lA6LBjvEMuYnD4kUQPooV5a1IXWIL6SNBt8qTTeSCAtGxse02ifj3x48UnACH2PpjJdq0xrd+uOPNx14t9TAWduvIpo9/ZbsJ1/OfPMX58dB088QempVq1vYgvftiy7qu3LQXwsU/S7D5TMC6mol/T1AZUeI4LvR2ApnmvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuwWAfHePFYTql2VkDF9PJx34FKsMPbER8xsNfTMRLs=;
 b=hDBa7kBIfrCX7vFNj13GcMMJ219Md8QSFvX8RulsXum58duQhUMhjyDt4hfidB3fb/fBYKviHv4Wt2Uy82v4OaACJt9xEimikAxH0e5zGIlUzV6NtmwMNvo9VAdsNpiVhrqX5vXnd5B5sqNHXe9Ts7JfHHvp1YS3i6rGDx/0YTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <bdaa74a7-8707-62a0-fcc9-24f80772a104@amd.com>
Date: Thu, 22 Jun 2023 09:59:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v1] xen/arm: arm32: Add support to identify the Cortex-R52
 processor
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230620151736.3720850-1-ayan.kumar.halder@amd.com>
 <d92e26fb-86d4-1681-0d10-be6c2e2cc846@xen.org>
 <d7701ff7-4cee-800a-69c9-deb8560804d3@amd.com>
 <3b7f584e-700e-4598-f36e-51a96140323e@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <3b7f584e-700e-4598-f36e-51a96140323e@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0237.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::33) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM8PR12MB5480:EE_
X-MS-Office365-Filtering-Correlation-Id: ab10c8f0-dcea-44e9-d9f5-08db72ff022b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jnv4l78oSQ5xe9cZkgZhH61ceniub3p+ws1Unlc581Hdid2iJ4t9FjM79vEeUKSlzk9OPblR3/TMFwnllCSxJvFTRCtmBPZrmee2M5+L1iXyq2owCXgUuKjoOGzWrcTWV13V2zBkydqH4HPs3d6qTJg7dGw51d6fOsU0EYp4NPgK1PQexGIHFbOZj75d0MLoc6Hyo43Zbtm75wEyZRfbBo0ZKDBNwWiiEmJ2/nXL4+/3aKVYAk6HgTerTfhwurnhOPw9CfpCkZ0xGigqn/P0eMs1qavOrDJ1xRx/qHQWwrv6KOH9abOc7WOoVgBZF0UMIx7LKfx2Fz3FxX8Znp2eiuSPM7ZO0McvjqCELgia4yFmQO9ILm2BaDCQgfcUp+LanPF8eYl06G1Nz0ct76pFHE/gQ1VkJr2Q8OSq+AotL62AmYIbebUvfCwqe4XpueaEggr5ctTRIlBG6Vzgu2IkARBl+dpTVJcDjyA7giDPMsfBJVA4r+OC4VqXI5LOqZ4ww0zVOEfQ0VOX+d1aWGzbuKFSYH2l8NPisEPvAVPoZnXhsESAc/WSTKOUhPNTRskEpP/mHI1mS2XyGONglNkX0yGulJFDK/XexiEtLikXN5MttjGXFrOdV9c8q70eDGtpyFT9o6Yx5gkDm2lZCTfkCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199021)(31686004)(478600001)(6666004)(110136005)(4326008)(83380400001)(31696002)(36756003)(2616005)(38100700002)(2906002)(26005)(186003)(6512007)(6486002)(53546011)(6506007)(8676002)(66946007)(41300700001)(8936002)(66556008)(66476007)(316002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFRUODNYMzZXMkh1d1pqUklJNHRFK0dzQkZyd0FWaGZ4Rmp3UzdsVngxUUpV?=
 =?utf-8?B?V1J6REgzcFRpYVpjMUVwRUJZcFZNU1JtZ2Y5YVBQNlNXWmxRb2tLdUtsbjBK?=
 =?utf-8?B?RWVZZjBndmN1MVRBNE9WQ0FMOTh6cjhJMXJuRFBsR2tkNWdYTVNPTGlRRU9D?=
 =?utf-8?B?dVZNbTlzRDBBOTJBRWVYRVpmVXNPdUFYRjJ5Z3J0cTRERDN5L09tVWptalQ5?=
 =?utf-8?B?Z3V0WndzZ21Xc1VsSVFPMXUvU2lwVHNtVUswcnF1VEh4N1VOdlk4Zk1oTmFU?=
 =?utf-8?B?NWFHZmowbVpEaUZ4bUdDT25SY1huVU9CTkZGcklHaGwydDRCajJFdGlpdkQw?=
 =?utf-8?B?c25NR1ZmTGhnejBwNVFlVmZSRUV2WDFhTmpHdHhaOEJaZXpkK0RCSnFIL3R2?=
 =?utf-8?B?RVBTZ0xibEx2ZWQ5Rk1RbEFObUcvWGhMNXY5R0hkbFlKVFFCUXIwRUlSRkVr?=
 =?utf-8?B?ZjFXZWw3RUtnYzNDUTc2YkM0eTlaaHZlc1FJZXJ1V0FmMENESVFPd2F6cVNl?=
 =?utf-8?B?K2VnekZIYzRmaTNWdkZpR1Z1RWlsNUhSSko5ZVJhdHVEbGQrQzVGWkEwN3pq?=
 =?utf-8?B?OFlpdFo2dUJaczF5eUl1MGFHOVlLUUprdTVZeGdFQ2xOY3NucHIvVEVubENX?=
 =?utf-8?B?VUxzcTlKVkh3QjNtZTNpY0tjb04waEcvNjJmQ0NsUk1OdXM3c29HVmFvK0Nu?=
 =?utf-8?B?K091WEFYWnhhdFoxNzltVTJHRGZNTkp6TjRsaFpTeFZxVS9SSmNOaEVlM2Zu?=
 =?utf-8?B?SFY2cTM4VWQvNjRJSUk3L2Z6d1RUMVBWZFRqa2RVb1RzNjhvL0dSaUJCY0Y0?=
 =?utf-8?B?Qk11Q1l4Uk5XaHZua0loTm0wSlBlcVAvMlUvaTFITitrM2YzanJsWGwrUENW?=
 =?utf-8?B?T0FNSElRRFNUZm9WSWp0dnV0emN2TkhFTmN5RFhUSzZJb3dyL0Nrd0hMR0g5?=
 =?utf-8?B?NmZBcDBQK1dZenNCUnBRWHZPc0grNGJVdnI5TE8ydWc3S1d2dGJUK0NaR0lr?=
 =?utf-8?B?bGxjZzdmblVMZEE3UlFacU9aQ1BLaWpjaEQyMjN1WU5wTHFoNFNUeTRJQVl0?=
 =?utf-8?B?bDRWM1YvR1h3U2d6a1UweE5YUW1QZnpFVzAwNFNCcWlRSDE3NEhJUDlTWUNR?=
 =?utf-8?B?YlZUaHNhYVpmdER0NldVU2F2cUtGVFpVSGUrc29ISE5EUHptaDRPNUFsdzRl?=
 =?utf-8?B?Tm9YelkvVGVUck5aMXpmdm5KcndiT1VKU3loZStTL0doL3dBTGZUdlhqaGQ4?=
 =?utf-8?B?aEFlVm9JYll5d2E1azFkZHg4VUZmM2VwRHRMelQrR094RHkxNHRtaVo3NnhU?=
 =?utf-8?B?NHAyTk1KQjlYQXhVay8xNkxnTjI5eG5XNitRODdCcEVOTm1MVElYTXpHWjhL?=
 =?utf-8?B?UzZvZ2RmbVJGb2dZRnU5M3kwZmtWR3poenNjcU5lZU95K1k5MFF3Y3VMdXA2?=
 =?utf-8?B?Y1pFZFVxYUlmcHBFcXBDUUxENDFlQ1ZkZlZtS0JCamUzR3pQOHhXRHVEY1Zn?=
 =?utf-8?B?RnVEMC9Ic3hrUmNEL09zTi9FVHIrcVE4MkJEMFFyU25XcEtVRlliTlhsS1FK?=
 =?utf-8?B?UzZFTW5RUXB1VWxFSkRSY2IycWZIQWVlb2poUTRJbEl0SVpibjJBZUxsNzZl?=
 =?utf-8?B?MnNsNFFDcmUxdkhKRXI4RVZtQ0dNNGxIc0UwV1JVZnBFTUJ5N1ludFEyNHlY?=
 =?utf-8?B?Tkp2Nlk5eE1jMlg0QnY5OEEvMmp0NDBnQlNFRk4rYzJIa2hyOXFVTE81Mm9O?=
 =?utf-8?B?RVQ0SlpJODdHVHpObDAvNDl6S3cvOFJoSXRmQ2VLZUVPcDlMeUNYNHRMajlH?=
 =?utf-8?B?eElVakdNeXBzYXNJTEFJS1ZpbXNPbmxoZEp2Ui9wRlk2Ty9helBaZ09aRUJv?=
 =?utf-8?B?S0I3UlZYL1dUNlhiUXRNYTd4Uk01MkhZYzFvc3Mza0F1Ni8zZHptSFZsU3hI?=
 =?utf-8?B?cVVoZEU2NGZhZHNJNk1uLzBKQXN5K3RJVGlZaG9YWTNabTNSTWxwSXEreEtu?=
 =?utf-8?B?Zzg1bDBITGNtNnF1Um1VRXhrZVAyWnRNL3doOEg4K0ZyYk5XaStlM2d2NUVl?=
 =?utf-8?B?R0R3VTk1WnQwU3dub0ozM2hYZ1lWbHRPaWtlVG0xZm13ZENuZFRTUURiUlh3?=
 =?utf-8?Q?PnVBo5hJiAa4hzNTOchbKB7fb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab10c8f0-dcea-44e9-d9f5-08db72ff022b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 08:59:38.3863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/twi87nVl8w5g/R2x88zn8gNbt8IakKxAC6Weh9HGmeeNIvdrCBrCArCiJ24Jh/xMkTH4BoARN1GzkbgHbbkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5480


On 20/06/2023 21:43, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 20/06/2023 19:28, Ayan Kumar Halder wrote:
>>
>> On 20/06/2023 17:41, Julien Grall wrote:
>>> Hi,
>> Hi Julien,
>>>
>>> On 20/06/2023 16:17, Ayan Kumar Halder wrote:
>>>> Add a special configuration (CONFIG_AARCH32_V8R) to setup the 
>>>> Cortex-R52
>>>> specifics.
>>>>
>>>> Cortex-R52 is an Arm-V8R AArch32 processor.
>>>>
>>>> Refer ARM DDI 0487I.a ID081822, G8-9647, G8.2.112 MIDR,
>>>> bits[31:24] = 0x41 , Arm Ltd
>>>> bits[23:20] = Implementation defined
>>>> bits[19:16] = 0xf , Arch features are individually identified
>>>> bits[15:4] = Implementation defined
>>>> bits[3:0] = Implementation defined
>>>>
>>>> Thus, the processor id is 0x410f0000 and the processor id mask is
>>>> 0xff0f0000
>>>>
>>>> Also, there is no special initialization required for R52.
>>>
>>> Are you saying that Xen upstream + this patch will boot on Cortex-R52?
>>
>> This patch will help for earlyboot of Xen. With this patch, 
>> cpu_init() will work on Cortex-R52.
>>
>> There will be changes required for the MPU configuration, but that 
>> will be sent after Penny's patch serie "[PATCH v2 00/41] xen/arm: Add 
>> Armv8-R64 MPU support to Xen - Part#1" is upstreamed.
>>
>> My aim is to extract the non-dependent changes and send them for review.
>
> I can review the patch. But I am not willing to merge it as it gives 
> the false impression that Xen would boot on Cortex-R52.
>
> In fact, I think this patch should only be merged once we have all the 
> MPU merged.
>
> IMHO, patches are independent are rework (e.g. code split...) that 
> would help the MPU.

Yes, that's exactly what I intend to do. I will send out the patches 
(similar to this) which will not be impacted by the MPU changes.

So, that both as an author/reviewer, it helps to restrict MPU serie to 
only MPU specific changes.

Can you suggest some change to the commit message, so that we can commit 
it (without giving any false impression that Xen boots on Cortex-R52) ?

May be adding this line to the commit message helps ?

"However, Xen does not fully boot on Cortex-R52 as it requires MPU 
support which is under review.

Once Xen is supported on Cortex-R52, SUPPORT.md will be amended to 
reflect it."

- Ayan

>
> Cheers,
>

