Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4623E5EA8CA
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 16:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411895.655010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocpKA-0002t9-Nk; Mon, 26 Sep 2022 14:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411895.655010; Mon, 26 Sep 2022 14:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocpKA-0002qO-KY; Mon, 26 Sep 2022 14:43:10 +0000
Received: by outflank-mailman (input) for mailman id 411895;
 Mon, 26 Sep 2022 14:43:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5U7=Z5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ocpK9-0002qI-Jk
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 14:43:09 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88748ad7-3da9-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 16:43:07 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MW4PR12MB6826.namprd12.prod.outlook.com (2603:10b6:303:20c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 14:43:02 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f%7]) with mapi id 15.20.5654.026; Mon, 26 Sep 2022
 14:43:02 +0000
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
X-Inumbo-ID: 88748ad7-3da9-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gscYOrx5QE02p9GOMftJ3A/Ns56RnA5y32xmdVQsp6ZB6ZhPgiedjS1qfTf79qs7e7RTPRZJAvPWAESioATBNYUtfpHsXxzdd5bY3lpIEMHXUBbo28pwTfVvsZvLLVubIqc9qewmjldEc0P4lEsZyiaOiJpunlEYAlBUj+hsAXrvcxIzmc1elYpIYg/A5k3O5Gd1f1XneWzwf49zgvLZNNmP8rd7Bp8Qkz2k7cdo4kprQK/NJGKqx/4pU3M3qmVHSiTKBJpakxIVUDVHr1bkPajvpFm/innBakFDNQCogu3xZ2o8h45YqDGiuOhwEVu3M/QqoJDb3rWgorbShgKOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZMY5OwHwl2FddXGTHXtDteiRYwUkwfAWOIZsQT0Vok=;
 b=WQ0rQL3TW3oY+PBMbxKezgpSUgQezzXm7JjsKrDn/ZY6TYTL6jn68Waec03BtQn5QpJH2KD0Lt34xfEbyuELTMcSHX8QsJJpR3IzMXbrQGW/1dfv0UsZCsDCOB2mP6s/Vj/rx8YtJg7+JhHF2nkZF577aNeJ1DDIXxB/DAkcfOC5stp3jU8pfnxsE7ggaC4gczhU1sSBcethLpljZlfW7DBC70B1/G8PE8emp4dUaxA/SgTtW1rZb8r7tYGk8j9TY4ayPhxjgFMfsn8NS5cWg3yHXu4SnI/yN+X6eUdbyi9aJLNlG29SAB+v46ElARKrb7F7UOHjKa9RY0HhwME9cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZMY5OwHwl2FddXGTHXtDteiRYwUkwfAWOIZsQT0Vok=;
 b=fcctp8lZhvKL43Q2ohUODkZzx8wghFugo0XjZXUYSXoQr56mqB/P86M6HfHYdTk/Kn/6YAStlhUC/cDLNd0e8F43hHn6iJyYCxv2nJlFWVly08S0wBVGnoEBtqBVedr9XLoavCngYS2xbIUaBVWz41w12zqKWu/61QLnV7zDk5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <40b8dc01-333a-1fd7-088c-6af481c6cde3@amd.com>
Date: Mon, 26 Sep 2022 15:42:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v2 01/10] automation: Use custom build jobs when extra
 config options are needed
To: xen-devel@lists.xenproject.org
References: <20220926110423.26030-1-michal.orzel@amd.com>
 <20220926110423.26030-2-michal.orzel@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20220926110423.26030-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::21) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MW4PR12MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a9cee9d-e528-4303-b97f-08da9fcd69d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	InKowcXTi3XTA3L439C5Z0CoB1pHLbjUbwLzfNrKi6DR3k898/HQC/b3HO2cV0PLcNEF0BZJh8oK3JCPBqQ0ED0f4GtgSGQ4udpCCvdipBSqQcV9OCWRaOMyTWlew83PBcaEwiSBorNqCYCIMTp3hvLstI85UhNZrdVTX02aCctlRx3CU+XTshXvgUOUBnMt4PwPN7yB0WzTm56MzGiIW5dCf7DAbpnqGLcohpSNNOpDTRO8hZtH2xHxuM2cyG0L/FWOMKuaP98jnoC9YhK9b5pGK1cV3ZZam65SanbDTau0xYdb8+j5lgcy+2fROy0Xy5kps4HD181wWteL2kP48hWsq6lV4M6OHSDbsGMULfQVXaZUOCg+uMFHsFMKLTEdUxwG+D7vLoyUCYS3h7FMabBvDniQV75yqN/MCBL1FymSQXrziVKBtljwyrLVCvg9QnapNu+kGvSy1J/KrEcf/+fVuecse7fB/i3FCruDYy5E3F0oroqqr7OY1cVx5bCq6QiH4u+IDMa2uCa+F+VAOUji3Pcyg46nP70jN5M5Sop6M708jFRbxZjInepCNdPAIF2BE2q0HtWh1Ne4lYhQBzkgihR1pKn42HWSnatFoXeESu+e6vZF6ynWatJ2CCTTBWuiFqxnfptFtRlDpRDsoDfhOdQpQOs235Mvc4wroOk8ERpd+W7KGVtF/p+CW65zK4To7SXQl9dBB1fmrBFGnaGtM1FJ9jHGjC61EQkAPbcB9uz+CWE3qv/m4cpTez5BUvmTKVJiWWiUw8BJXDGi+/HV4RQktUgrin9WoJ3Uc8g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199015)(8676002)(66476007)(186003)(66556008)(53546011)(6512007)(26005)(6666004)(6916009)(6506007)(316002)(2616005)(36756003)(2906002)(5660300002)(83380400001)(38100700002)(41300700001)(31696002)(8936002)(66946007)(31686004)(478600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjBSZnBBZGNuQWJmYWpONzl0TnZ4WkFTaVVUaGxxTTRjbVdUM2IwbVBxS0xQ?=
 =?utf-8?B?QkZkeDlnaEw1VXpCWkY1UVBxcWFZY3B4NG1PNHVFR0JlYmdxMThZMUY3S293?=
 =?utf-8?B?Q1N4aWFERnAwMmlucTNhaFFYRWhzQ3ZCZ3Z1dGx2b3RTYTlHVG1tUjE2QUFw?=
 =?utf-8?B?VlZZYVFYWE94NTViN01Gb25vNVBnMHp2ckRlbDZNWitWUTJ4V2M2MkdRNE5X?=
 =?utf-8?B?OUozd2oyUzdWYVRDQW80L1lpR1F6N3ozS1k5NmJQekFWZ2lhdnhlWWJENEEr?=
 =?utf-8?B?TWM1YjJwdWZNSTdhOGZyVHBGbGNPcEg3K1ZPMU9keVJTY1E1SmRDTVE4bTNN?=
 =?utf-8?B?M0pvWTVlNGEwZW9ZLzJUeHBrNWtiaGNpVlBHb0NydE1hdzJycFQ2cjBsbGtT?=
 =?utf-8?B?UFhIYnY3a2xjS1l2QllQc1pBYXpsdHVoYzVrMzJBT3djUzkyZVZ1UTY0QUpy?=
 =?utf-8?B?dmZHc0RtMnVOMC9idGNmTzhsZjN3cHM4V2VlT09oelUvRFBZSWUxTmdSMmJL?=
 =?utf-8?B?cjFMK2ZKcHFybmpnQzFXQlp1WGRFT3l6K3AzdndVZk1nZHRpT29CYnBqMDJO?=
 =?utf-8?B?dFFrakEzUjlUL2pnbkdTZldkaW9vbGFDL2htUGFSczhzWEt4SHFxR2d1ZFZj?=
 =?utf-8?B?VjVFYmoxcy82TGdzS1RlenFzUGpWbU5zWGRzdTdsQTdodWh2TmRwaWJzSllU?=
 =?utf-8?B?M2xRcFE3bjdxRy8zejNLV3hUZ0UwVnpISWpvdldZd3RIYzdhK05sclJlQktt?=
 =?utf-8?B?TEhiRGlDc0V3R0Z4MlZwWkhJYk9SbUFoUHl5ak1qZ0NCWGdSZ1o5N3VmdHlN?=
 =?utf-8?B?cEJlak9PS0tEdnh4VEd1U3Y2R01BVU5rL0tNc0k2OHFVTU9PKzkybVU4cmRK?=
 =?utf-8?B?OFdSSWtTMHZHcDE0SkpIRzZMaXp6VzdvdHUxd1MzVDIyK25FZzBrdVQ3QndW?=
 =?utf-8?B?V3A1dlA5L2FvSHFqcmZuemZTcXNVLzFvYytTZlZTZ3R5bHRNNFowbktWRGRt?=
 =?utf-8?B?WGxESjZ6cy9JUGpPY0Z5ODUxNHVyK0pHTmlMMDNjN2RMSnMzN0VpZjlxby9o?=
 =?utf-8?B?cFdPVFhVZWRNWWg2R1lGS3B2UnlkZHB4U1QxUlhaRHJKMWdrY0dIVjdCVzMr?=
 =?utf-8?B?V0h2YWpCSkNIQjN0Z2xiUkhCbmxjWnR3dXdlM0h3N0VxUlozT3JISWxRM1I5?=
 =?utf-8?B?UGk3ZUNQY0k5U1RrUDlscXNNQ0xOMXNOeTdDdlBXOE0wTS9XRHQvL1RMSlhl?=
 =?utf-8?B?bVgza1ZoYXBIV0tHVEhpcThvZHBlK0x1WlVHYjZ2VDhyVnBySlpzNkhzb1VZ?=
 =?utf-8?B?WHlVSEs3VTlrZGp6K0hwazIxZG1WZ1ZkRXBjdG9ON3VsQ3lncW9aaGQ5L3kx?=
 =?utf-8?B?U214aS93ck8veWhTakFmQ2pBd0tscVJYRERNUlVlTG1uQXU3dGg1NDd5NkRi?=
 =?utf-8?B?bEtrRFZIOVBsdTlhaUVzRmd3YldPOFhDaUJ2cEJDUFpZakt3VkhEUXVGRmFp?=
 =?utf-8?B?cUhWa1dSbGY5U0xNaHA4cjRBSmt3RTJqNG53QTZxNDRXNXQ3KzB6eG4ramtE?=
 =?utf-8?B?ME8wOWNUZnRMdFRTTXJKbEdScEh4MkxON3MzdlpJUHRBMi8xaWUxSE9ZUCsv?=
 =?utf-8?B?N29aZ3czakFpOHBmN1lmTVFCL21VYWxwdyszOENiUW15bHNOMkxNRTJDK3J4?=
 =?utf-8?B?MDJPU25GbkJJWjhORXgyZi9jSmV1RVZqTFpZTW5QYjc3WklBNzRzbjMrQmRE?=
 =?utf-8?B?Wm5TWWw5M0IzT2MvdWtSZzBGS2hMYWdhcDJpTXdKVVM5d05hditucHhLWm1i?=
 =?utf-8?B?Y0g3ZWc1OUFCNkxQWjZQVjh4WXlSWjBOQnJFVUt5ZjhyN2ZMNzFzanRZcitw?=
 =?utf-8?B?NkkrTmdJVy9ROFVqdEVxbUcrSHRXSUZhSEJkT1dIdGljK3NhdW9zYXZrZjB5?=
 =?utf-8?B?REpJR2JrVmJrNkt4VE0yWnhEZTlLZitEeGJIZ2NBRkRlR2QrTWxOY2JQWGJy?=
 =?utf-8?B?TTh3LytMbGExZ3d3SzNYYkhZcWxMT2NxV3B6a1VaUlVUcHJRL1MvRnNSeTlq?=
 =?utf-8?B?ZnZ2Qm84aTVsVVZaMm9NYzZpSERZYjQ0dGRuSXpuWEowc3BNVk9BVWtEZTVO?=
 =?utf-8?Q?M7GgTbgNM5HcmVjXTqRAlCvOG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9cee9d-e528-4303-b97f-08da9fcd69d7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 14:43:02.2172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hapgNpLHX/TplXwm2cnLE2be3lSj+debKgitNWXuj2Vf0hg2suwc/JvHRxwukxmJIiTVeMjlJ47ip7nq60AAjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6826


On 26/09/2022 12:04, Michal Orzel wrote:
> Currently, all the arm64 defconfig build jobs, regardless of the
> container used, end up building Xen with the extra config options
> specified in the main build script (e.g. CONFIG_EXPERT,
> CONFIG_STATIC_MEMORY). Because these options are only needed for
> specific test jobs, the current behavior of the CI is incorrect
> as we add the extra options to all the defconfig builds. This means
> that on arm64 there is not a single job performing proper defconfig build.
>
> To fix this issue, add custom build jobs each time there is a need for
> building Xen with additional config options. Introduce EXTRA_XEN_CONFIG
> variable to be used by these jobs to store the required options. This
> variable will be then read by the main build script to modify the .config
> file. This will also help users to understand what is needed to run specific
> test.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Ayan Kumar halder <ayankuma@amd.com>
> ---
> This patch is supposed to be merged for 4.17. The release manager agreed
> on that.
>
> Changes in v2:
> - replace [ with [[ to be consistent with other ifs in build script
> ---
>   automation/gitlab-ci/build.yaml | 15 +++++++++++++++
>   automation/gitlab-ci/test.yaml  |  4 ++--
>   automation/scripts/build        |  8 ++------
>   3 files changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 720ce6e07ba0..a39ed72aac6d 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -566,6 +566,21 @@ alpine-3.12-gcc-debug-arm64:
>     variables:
>       CONTAINER: alpine:3.12-arm64v8
>   
> +alpine-3.12-gcc-arm64-staticmem:
> +  extends: .gcc-arm64-build
> +  variables:
> +    CONTAINER: alpine:3.12-arm64v8
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_EXPERT=y
> +      CONFIG_UNSUPPORTED=y
> +      CONFIG_STATIC_MEMORY=y
> +
> +alpine-3.12-gcc-arm64-boot-cpupools:
> +  extends: .gcc-arm64-build
> +  variables:
> +    CONTAINER: alpine:3.12-arm64v8
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_BOOT_TIME_CPUPOOLS=y
>   
>   ## Test artifacts common
>   
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index d899b3bdbf7a..4f96e6e322de 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -88,7 +88,7 @@ qemu-smoke-arm64-gcc-staticmem:
>     script:
>       - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
>     needs:
> -    - alpine-3.12-gcc-arm64
> +    - alpine-3.12-gcc-arm64-staticmem
>       - alpine-3.12-arm64-rootfs-export
>       - kernel-5.19-arm64-export
>       - qemu-system-aarch64-6.0.0-arm64-export
> @@ -107,7 +107,7 @@ qemu-smoke-arm64-gcc-boot-cpupools:
>     script:
>       - ./automation/scripts/qemu-smoke-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
>     needs:
> -    - alpine-3.12-gcc-arm64
> +    - alpine-3.12-gcc-arm64-boot-cpupools
>       - alpine-3.12-arm64-rootfs-export
>       - kernel-5.19-arm64-export
>       - qemu-system-aarch64-6.0.0-arm64-export
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 2f15ab3198e6..bcfa6838f0bb 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -15,12 +15,8 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
>       make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
>       hypervisor_only="y"
>   else
> -    if [[ "${XEN_TARGET_ARCH}" = "arm64" ]]; then
> -        echo "
> -CONFIG_EXPERT=y
> -CONFIG_UNSUPPORTED=y
> -CONFIG_STATIC_MEMORY=y
> -CONFIG_BOOT_TIME_CPUPOOLS=y" > xen/.config
> +    if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
> +        echo "${EXTRA_XEN_CONFIG}" > xen/.config
>           make -j$(nproc) -C xen olddefconfig
>       else
>           make -j$(nproc) -C xen defconfig

