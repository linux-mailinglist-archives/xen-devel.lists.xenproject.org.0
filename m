Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E30746FAC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 13:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558267.872197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGe00-000284-7e; Tue, 04 Jul 2023 11:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558267.872197; Tue, 04 Jul 2023 11:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGe00-00025j-4B; Tue, 04 Jul 2023 11:15:12 +0000
Received: by outflank-mailman (input) for mailman id 558267;
 Tue, 04 Jul 2023 11:15:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gy6C=CW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qGdzz-00025d-CU
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 11:15:11 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 090bd87a-1a5c-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 13:15:09 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS0PR12MB7778.namprd12.prod.outlook.com (2603:10b6:8:151::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Tue, 4 Jul
 2023 11:15:04 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 11:15:04 +0000
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
X-Inumbo-ID: 090bd87a-1a5c-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1qjbqt1h5BVOF9bs5EaQ0vT3FIa5ekaPZkAmJ+UDByOb0SkDjIGNXMGMx5HrMGEBjXPFeaxH0s32qhOoxAMBkq3Y4CaJcJjy6SQvQkF1c5PIwe3fozP21Xo+VVd29J4r4ONJs1h/mhPm90BKTaTKDwcKESAYelA1SvkoXUZ+xFjhhA6WpYztsHzLSUvbmjoBeRfDysNCMoSmYS4xSwXSYWo120R1l6/80lbfjfvTmtE0C7L9BxduOY5CFL6TqTNM37ROguqAtpZTkJydblzL7qR76QB76q04i6zTsCkzDjgIpdLtCqZQAcv6m+hVFTkqcXcvOQg/o8AscK6b2sPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAI8Ye1hiMiM5bokZODWSS1ZmLb9C8JWqzXtgxkAowk=;
 b=Xm39IlFVxPayxiCV9mYhnT9w3PQOc8Z4Th3seoBs5GMsMNlfmF8E5GTaDadjqY8Rx1WIvMNIIIJ3HmDlwkWZ0HE2n6nlGlFIrbjNwUoDqAGQpjS+eYs2h+jvQioNkwLqma8aq75hPtWCGQKAWovKOcpkdsOQ0JBF8wP9D+xxs78HG00VeBos+qSPyz/llkOjqJTLZqTIFTJwGAa/V+wmqmY41VrBk41DGbQ/xX4FK0lTHciMkYAZyNG6eJEEBpi95zijSB0qBamVuTgv6M2yGqXAW7FHiae7/oTgiflg4cllgOEL5ePQL6lbEQG0Yo997Pr0Q8kL04RQ5kIzi2lshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAI8Ye1hiMiM5bokZODWSS1ZmLb9C8JWqzXtgxkAowk=;
 b=PaEFIfo2JwvdWnOVc3ygVzK7l/rqIPuVvsoiO3zOM2Z+sxPHKVfa5Wo29vfyweJxDiDoG7D9kWPF8B2x/gKeQoF66HnFB96ejE+uWUcFpW0DWj1c57MKcPHXgozm05jvOXt0vB4hF4pnEG7LOX90YVqKqQy8JajF+5ncDkrWQQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4303bf0e-a987-1ee4-9524-c83756789322@amd.com>
Date: Tue, 4 Jul 2023 12:14:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 06/52] xen/arm: introduce CONFIG_HAS_MMU
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-7-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0197.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::13) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS0PR12MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ea7405-330d-4687-adb2-08db7c7fea82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2K7ZJzf9uyDygERV9Xolzz8s+O6RgAIMCtB2BaSVft9Y3s73TCikS3Z2JxXk4bkNXEPi2ibKT6POEivQNJzvtmYphqioYLb4G7ue0khOYfigE3241uAnaLibBxyAH9Usv4DoshqwnGhezBve4OVqreoFlnPtVtxyERVLdcXdULxWVWGFPtNPkKEFblrBwDEjB8SaxKm+XeUtbmaA4EBz5bIBGEMiB2Zv5AgTPcKuYvAV7WBVcCseYF0Vlv8taDwDU6zKfCkRMna6drHHiVUbSfqYoqrb9O+AEnLl0MbZiQTnNnNFX+x37Tl/ZZD3arLL48sxyvsVjL+MRZtZ/CHH5kFdGmv+X/dW6Dz68NSdu0RpZPijl69W6b4+JXBo374hA21clx5xdVmRWfaGrWRPotSAUu61i1UPoINPV8+cCSlfuibnIHJa9tcvoTuWVFyCTnDW3FatyPJE5IXAF7DUM8CYIpZ2QkePuogfAgmm+ZGFjHnJZXn7QKeEqJDI4UFRuT2i0sWZusDSkun4OCXQtyrlnCq8qPXnuuhDTeSm7AzpN+LSmRrXD5a9abpEbFN8M+Eq5SY/4nqPcVylo1LTVMHKQaQVQXA7HTrr3+sEW0krfxoQj+rBXLFr+a0rdT7TVXLKRnYa+QZm1lm6qezWfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199021)(2616005)(2906002)(83380400001)(38100700002)(36756003)(31696002)(6666004)(53546011)(31686004)(6506007)(5660300002)(41300700001)(6486002)(4326008)(8936002)(8676002)(316002)(66476007)(66556008)(66946007)(6512007)(478600001)(54906003)(186003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjQwMVZkVmhuanBaUlJ3Z1JEMGppLzE5Wm0yeVozQ3hlVWhBSk5VWmY3bDF6?=
 =?utf-8?B?enhNN0tuUHFyUVFKVjl6RUs5UU1SM2kzYlBQTm9sbHEyRzNLYXp2R3RSK1hF?=
 =?utf-8?B?aGh5eG9kSDgwUEcvRnZaRWFPUGNPNHJWd1N3WHo2aDMxRy9oTzhhL0dsRE05?=
 =?utf-8?B?c0xUcERPRE1CUnNQbEFQRnNWeEZoZVdna1BmbkxKT29VTGx0SU95Vkw5ejNN?=
 =?utf-8?B?VjZWcVZOVTdwRThoUzV1V25jZy9EUTl2WDhxdG01dWg2aWVEYkhpR1Z2TENY?=
 =?utf-8?B?eFZHdXpBdlYvM0VVcklhRXEvbVBCbHE4Z1hGMnd1bGhQR3AvaUh1cFdiaUow?=
 =?utf-8?B?OUxYWDVScEpYUDlORFhyY2hPa0NWeTBoQmtidGtGeWxiSVZVN1J2YnhlRzE2?=
 =?utf-8?B?L0dTK2hzdGVvdG0xQWl0T0EzRzI3eGRKNWdHSkFqRTBXdk9yZjhyWmRpRmxq?=
 =?utf-8?B?VTFkQXYzb0FiRHpGVFF6eVlxaWdNczJGTU41UGFiMlRud1d4dlFNN21TQkdT?=
 =?utf-8?B?N0tqcjRKeFJZSnRzNTlyODFhdmNCRjVjcEdXMCtEREJPQUVLdGJmbUJEclpp?=
 =?utf-8?B?SU5tZ1NKY0owYVZDSVFvdnBpM3NBYWZRZlVXTkVLU1FzbnhZTXRXZkNnN05F?=
 =?utf-8?B?WVBwcDhmL28xbW9xNmNmWUhZRUhuaUV4TndaYXd2aUI3WlVuNzJnSjgxNGk3?=
 =?utf-8?B?YU1RWVdGMG1Bck15VHdSRUNkM0kvaWQ2bFF1SjBXOFJCY0lWWGIwTlZsRmRD?=
 =?utf-8?B?WW94WDN0cTA1c3VxNitoZjZMSUUyWTFqTmxqaW1lVkM1RDkyRE1kQmVpT3ZL?=
 =?utf-8?B?Z0pUUi9HMW84Nk5nVUdEMG51bUpSRzFVZThEMHdJSHdaSWZxYnVxdXpsTWRn?=
 =?utf-8?B?bzNTNWxFeUJROVFtaEhYbFJPZTFBQWY2cnNRbmczTDFIZXpqOS9UcllUczlN?=
 =?utf-8?B?cWZQTlYvNllLaTVQQjlJdjBxV2F6UXp3SjNDZmNHVm5rRHdWWHVSYkhURE5L?=
 =?utf-8?B?V0JSZm0zaDVQMk40c3pVWWJBazV5VFpGb2F0UVFwdEJEWnRvMGNGc1ZXK09r?=
 =?utf-8?B?NDZwNFJTcGhFYmJTbFRKVDhXQ0J3ZUxsZUhVUzB0a3JYRkZ6TkJ5YVdsSzB5?=
 =?utf-8?B?cmVCbU10RG9Oenczd2g4RGNXOGtqL2VxMmZ2UTBHZ2tsRnNKVUNzZzlPMHJp?=
 =?utf-8?B?WnRYYlpJMGtmbEN5SjRYVEUrR1dtNGppcFRTSS9nVmdzWEIxUmNOU1hWM3lM?=
 =?utf-8?B?OXlsYTBzSHBjL1Jkek1adFlyUnB0cGtMVVNqN09XSHN6QWc4aW5RMm41aFBS?=
 =?utf-8?B?R3VFS2J1ZlZOaUpta2FvSWhEWmNHL0xXZFNReTRaak1hOXNVSWxlODFhTE5k?=
 =?utf-8?B?czU1Z2dUS0djb1EzcFZqYkJzYzhlWWYyTnZ5bDRHeGFWSjBiTHFyTzN2QmZi?=
 =?utf-8?B?ZWxvSUxkZE5DU1B3MkkvMTJGbzZTamx4UEdzaVAyUklTeGhJOEFqNjJPRUpC?=
 =?utf-8?B?aDdqRDJxc2tPZ1FsNGhYamhSYm9NVEFQMVUvUUZRTTJSUEtpN1pQQURZWTc4?=
 =?utf-8?B?OXFHNUw0L0tLQlU3bVhnMlh1T1VYYnBCcm10Q2k3WUZFTG0wWmxnT3NZN1RY?=
 =?utf-8?B?Yk0xWkFMcndpYm5OQ1lnOWQvbEt6VFBwQ1N4ckJPOXBublFUTHJZSFVldHBX?=
 =?utf-8?B?V2I0NDAzcFRoZk5naUViWlRRRW10K2htOUs0czZ2TSs4YSs0MDJIRkM3a2Uy?=
 =?utf-8?B?cVpmdjNOR2YxdGN3WXRBaUtwbEUwVTczR0M1RlZjckFYaVoyUE9WdyttczAy?=
 =?utf-8?B?ZGRQSWdmdTY5VnVrZ3ZYaUhRdWs0U01OR05tMUFvcnA4U1FrTmYrV3lzTHo1?=
 =?utf-8?B?bmJCenZPRzAxb05ONnZFKzVHRHVVZXYwQ3Zxby95R1ExNDg1U1dCTThPVWJp?=
 =?utf-8?B?MTNKcDRjOWx3WDB3NmdTVnEyYmdTVGt5RjR3MTYzZU1VMGhOU2tsRDg0c2VJ?=
 =?utf-8?B?NmlQeTFrZGJCSUQ1RTVlLzlOWHJ4Vi95Q2ZualNwV25XVWZPS2xzRHl1d2ZD?=
 =?utf-8?B?Y003ejVIQTVsL21LQ2Q2QzJJZFFqaERGT0xjOUk4UDZjV3BUWEk2SG9GY3pR?=
 =?utf-8?Q?HV7wNpFSf43o1fiKgnONoySB/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ea7405-330d-4687-adb2-08db7c7fea82
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 11:15:04.2139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4ziEqqUbz9xgBHsE5MGjfK1UwB/KJz9Y0Rx1d3j/k2+fldzvQVkxfuVmC+xYntr7pkLVD88F6RlTGUQME5iIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7778

Hi Penny,

On 26/06/2023 04:33, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> This commit wants to introduce a new Kconfig CONFIG_HAS_MMU to guard
> MMU-related codes, to tell two different memory management architecture:
> VMAS and PMSA.
>
> In a VMSA system, a Memory Management Unit (MMU) provides fine-grained
> control of a memory system through a set of virtual to physical address
> mappings and associated memory properties held in memory-mapped tables
> known as translation tables.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v3:
> - new patch
> ---
>   xen/arch/arm/Kconfig | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ff17345cdb..fb77392b82 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -60,6 +60,14 @@ config PADDR_BITS
>
>   source "arch/Kconfig"
>
> +config HAS_MMU
> +       bool "Memory Management Unit support in a VMSA system"
> +       default y
> +       help
> +         In a VMSA system, a Memory Management Unit (MMU) provides fine-grained control of
> +         a memory system through a set of virtual to physical address mappings and associated memory
> +         properties held in memory-mapped tables known as translation tables.
> +
>   config ACPI
>          bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
>          depends on ARM_64

I don't think you need this option.

In patch 52 ("xen/arm: add Kconfig option CONFIG_HAS_MPU to enable MPU 
system support"), you have introduced "HAS_MPU" option.

May be you can introduce "HAS_MPU" option a bit earlier, so that 
"!HAS_MPU" is "HAS_MMU". So, you will not need this new option.

Let me know if this makes sense.

- Ayan

> --
> 2.25.1
>
>

