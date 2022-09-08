Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012395B1806
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 11:08:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402951.644887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDVw-0000zP-E1; Thu, 08 Sep 2022 09:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402951.644887; Thu, 08 Sep 2022 09:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDVw-0000x4-B2; Thu, 08 Sep 2022 09:08:00 +0000
Received: by outflank-mailman (input) for mailman id 402951;
 Thu, 08 Sep 2022 09:07:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8AK6=ZL=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oWDVu-0000wy-S0
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 09:07:59 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba2e00cb-2f55-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 11:07:56 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BN9PR12MB5066.namprd12.prod.outlook.com (2603:10b6:408:133::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 09:07:54 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f%7]) with mapi id 15.20.5588.016; Thu, 8 Sep 2022
 09:07:53 +0000
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
X-Inumbo-ID: ba2e00cb-2f55-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9L/twBAhQib0rt0g2AGtI0/7jKFoFGdJa0dYr6v5LBBA3JqccQbMo0LrEAzsoh6aG3wVA9WMgqzVwlVrK4aN3qrEsQiwyPfZOi9pTS+tG4UXzu30wP1eCpz5B7BRp3XojIBnlWHJsetRftC4QRemiFMAS1yvh8RKG4hrq378CdPSmpUtop9PoEZhSmjzXKKAJT5p+0eWiC8CW7SqxRdCjfx2Ujja1eASfla4rGKn/xrHse80uSsKNIRVpSQJ4BDwgjDv9kUYpR/xCxgaWWaSSK02okjh3FdHg27M2HyOyQ/6x+WIPDV0zHoNwsAch9W3uGUW8SEpfst+1TcwCvcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRD00AqW6YDpMwaZNLvVdoIbkLaK+kJro2mFBEsr2+U=;
 b=bUYeWdhFA/L3OLyoOA01Dxx3LzbJNl9FMENdvdzaw+kAK/68n1CBzmLCe2/D3qzuaj7DqeuRZWR9rnRVFA/H1NxpRhHR+pD9REP8OKYgMLt/0ZuJx44Uoom4L1jroYb9VjVPk4iEWF0aEm0DloxSAxD4WqecGwytpZxMzshqb8il57fdZFHiJ9l/9aIwIqwQySih1sal37gMufM+VjzeRMI8KFrxAuEEeYJZBBj5xAFIWOoQVDEHT8zWNJDGKzBmCvALpf8gLipPuvO8XjF7klRq9X7DKlOGWAdbqShpdXkDy9DU1aT2y5r6QDDQktgMw9BBMpL90ju+6NERrcfaDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRD00AqW6YDpMwaZNLvVdoIbkLaK+kJro2mFBEsr2+U=;
 b=CC6e7XZf+GWVIs5dkufKEyVki2Hr2byURuCcog53/t8EgNTIkOT7Ps+craXkKQhsBD9XgD2mkY/GA3uLJdY34DDBl5a7EALS5u5gvBh4DH7/WV3+Ko+UUlg+IaRZ4xDz91YYMRYNrjRqnwEPTPmetA7uYc2mSPHqkl1Q6/OLzxI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2c2c0315-8694-d9ef-5f08-01c7bce3329a@amd.com>
Date: Thu, 8 Sep 2022 10:07:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [for-4.17 1/3] automation: qemu-alpine-arm64-gcc: Use kernel 5.19
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220902070905.1262-1-michal.orzel@amd.com>
 <20220902070905.1262-2-michal.orzel@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20220902070905.1262-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0047.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::35)
 To SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d7dd8fc-edaa-4b33-f3b2-08da91799cf8
X-MS-TrafficTypeDiagnostic: BN9PR12MB5066:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VHCOaLwV+57q0oxXjzms0cXvML/xDdD94qmjfuZyFPTz8c6zJreIbAcEdIZDLnW9qdMtSXzH7C01hTTMy/MqDC6W0/WsKvBFCiFC2AB806lnmQpFE6xt1Oa2YrOO7NPl/NBes3kd2afgbyAeVKVumt1StwhjLvBFHTitVYqkEoGcMazndie9Y4urvPUBCkrZNf9p2QdHsWtqmcvt67Bdw5oG6A98Tk48otj86wq/s89Fiq65FTo1zE4BIHyUJinSV9wyoPUSERMn/F5wLe5EZVi+DjGTSy6Qc+JdWs6X+6iD0EO5otYlEC+Y9HPQm4YwziKT3lfQ2hoFYGHiZKG5029sbwOW0AqlKT/druG7rwXXCpKj9xeBP28RZVIXgkP9X2ZprOioqiwcHWqRfC4UZ7ZLsJ+K7nNSBbVEnOpESESg8NTfskqVSLfOoy+UPPopUs+jbSyeYGS9IJJJUWqjZIBBUpksnJh0S4AGGe5/eLD8f03wF92zc0iBfh3DhpRsUAPbJCpe1rbVTRzPwOUMzruzyPP0XvJ6NmvnGyGPfWpQ7tohtgz4Z0XHeRQiK37OlWF7eUgq2JhJUlN8XC0ajvODdzM/OKYmyFOGKWw5jVSLXvp+KNLU+ASOikGgSWX6nxPRQGrd+AVYTtqGm5eSJZiMCW/LGp7Llvsm610B3zY3vC/6O6d01fW601ceK2SGMUYyqEUlJDzRDQFW6LH0Js/HtXvlDDXHnYE6rDgxbSnEGvWyE8ws71Mw4ZFIXdHCfSzcloYDIwDp/ZJGIJy81TbOgG7XLThBPxpPXCH1x6f+PBMUMTb3fyr6tRo9iEKJxXbSMPy0UxFA/uRacUmXOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(186003)(4326008)(966005)(478600001)(66946007)(66556008)(66476007)(31686004)(54906003)(36756003)(316002)(6486002)(83380400001)(84970400001)(8676002)(2906002)(53546011)(6512007)(26005)(6666004)(8936002)(41300700001)(2616005)(31696002)(5660300002)(38100700002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUFwNDNKelV2WmdMS2oycVoxRW5rY0RyMnFySDNkNkk5SWkyLzRpTGFlcnRU?=
 =?utf-8?B?V2xzUWdTRHlocXFRRE5yU1hmdHBxWmVrL2U5NmFtQ3JSNkl1VStlRGFQZmQ5?=
 =?utf-8?B?ODZRSEhMY0J3TmFWNmYrZVZQYVBLZzQ5TVUrOWlkSTRyRThPNzZPMU9QYmla?=
 =?utf-8?B?SGxVWDJhZFRKZ1ZMeVd5ak96cGdsdUdPSGxjUTdpendZYU1GZkQ3Z0FUQW9P?=
 =?utf-8?B?V09sY3dYL0hQWktONkpSeWVOMEhmN1hMQ3kyK1BpL0s2ZTBWbFlPR2s0ZWJC?=
 =?utf-8?B?TlBqZGVvbzZOWW1EWXlkUlJxZmNnTC9uZkVYTnhJWTB1NHdKZ1dtcHVYY05R?=
 =?utf-8?B?VU1EUjViL0h0ckllMGpyMzh3azFoN3FJRTNSdytRb0dxcnlJOUxDMVhXK09a?=
 =?utf-8?B?akhDNk1yN1YvOEJnQ0R6MHJlUVd3ZWRva1ZWOVk2TG5QQWdZY0lzcktQYUxn?=
 =?utf-8?B?cUoveEhPMDVpZmthUDRnVDRIS25zWVQ3bHBsKzkyeUVaOGpKbklPTXNYS1N5?=
 =?utf-8?B?RzZrRWp1SklUY3dMb0czWFUrcHRUTEZsU1RXek1zRWovOUVIanYvM2x3UWVX?=
 =?utf-8?B?VGpQczhYbmN0em1rMEJFUFVwVGR3MmpYNGM4dVhJVHJDSjBhVHkzZEhGTHcx?=
 =?utf-8?B?U0ROcWV1KzlCbjA1TUhlVG1VWGg3YlMyNjZHaXBzalZobzFTT3VjV3NISnFS?=
 =?utf-8?B?RG4rbmpDUXVPYk9tWjN1YkZEblM2K1RGNHlESXhuMDlVWFRvU05RMFdHYllh?=
 =?utf-8?B?TnZqdWxSMjRQZVpjRG9BZytTdkNZNGZRZ3ZCUmtrbHNWeitEQ2hWR2hPWTZG?=
 =?utf-8?B?MVdHVkhLSHRMekFBeEdQQS91RDlDeGxtb05mQ3pRQ05CYkJNMGU1R21kczR3?=
 =?utf-8?B?eEVPS2thdXBIT3hQS3JOYml6ekU0SS93RVYxdkJWeE9ILzliWldKNzZmbU14?=
 =?utf-8?B?M1o1Y2p2QVh6UCtqVGRWcU1hakpwQUYyUGZEN3paVk5OSUZmZ3J0VXJlQm8y?=
 =?utf-8?B?cDg3TzYvMVFrQWs4SDExYWxUYW1mcmFHS0xUTHFTTWRWYTJadGtlOFJIeGh5?=
 =?utf-8?B?aC9JZlJZVHk4Y1h2TjJUaFF0ZDlvQzd1VDZlQWJvZWprUnM5L2tTKzgyR0xr?=
 =?utf-8?B?WFJma2d3NnVNZUdtVzFDRmJQeGxhZlhCV0N0MlFQTkprdksweFNXb0E1MXJM?=
 =?utf-8?B?YWRNdGZadk0vVTl6VXFldTdoMGU4SDlSSXliZUZkOWNPUkdtbFJCaHMvQjd5?=
 =?utf-8?B?S0pXaUs0bWw2cHE0b2ZZVlQrZldaL2JzYktCK255c21ZWmxwL2kvcnlpMnFr?=
 =?utf-8?B?NlhDQ2VjV04zYkdVd1hHeTR2aURDaGVaVUFBLzdmT2NMVXVsSk5wTndCOWxo?=
 =?utf-8?B?aTVRQXNhUmtMaVNzR0ZRR3FLc3BsZHpXODZ6ZXRUS1Bqb2ZkMDVJVjlHaGNG?=
 =?utf-8?B?VE4xUEJEcDZSR2dDamVNcG5FY09iYVAwbEIvUUltMENhekorak1mc2lMSzIx?=
 =?utf-8?B?aFJJVCsxTWl0YThIVFBmaGpQbk1BTkZCUWFYbTk5T3NSQm9TQUdtTDBETU5G?=
 =?utf-8?B?SjdsV3lDNlJuZ0t0TjVZamFnVFNSSnI3RmRYNnZRdEgwOHVkaHpZK1JSL0ty?=
 =?utf-8?B?ZG1jWVlqL3djWElsRlhNWUtjMTQwV1BjejFwTDJRL21lbk9uaEtha01keHJs?=
 =?utf-8?B?UlRadGYxTEExRTYyKzZxMjFUSnZXblFiVjh3ejh3M2tkdTVJSCsxSlJIdTFJ?=
 =?utf-8?B?Z1IyRUZJVUZLN0E2WFpnYmpGU2RwUmkyY3Q2SEVrRXRhOTFabUEzVS9lT2Zx?=
 =?utf-8?B?YzBZcTc3SUNja0JYMUlXVGJmNmRMdlhuSE5PNW5pckNkR2htUDZwRlc4T3Za?=
 =?utf-8?B?VVFSWFJzTkdRcjFieTg0cXROTkU3a3hZazVmSkdBL013ZlhraGZYOHV5UGl1?=
 =?utf-8?B?ZWVBQVJXYUM0Y3hXVEZCWXYrNEFuVEtvMlR1cURrWWV6b2RFV0dYdlplOUwz?=
 =?utf-8?B?K2tkTVc2aTNObXpLdGtzUGluRVFLVGVieUErRFExWHl5dkdHU0ZuOXFGYjk1?=
 =?utf-8?B?S0h5aFlrOGtudXpnSGpLUUdGSUpMS0s5Tyt4WjZyWm4yaVJjQ0pleVF6UWZG?=
 =?utf-8?Q?DQLnJyhNmCl/QYRz8Y9O+kStr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7dd8fc-edaa-4b33-f3b2-08da91799cf8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 09:07:53.9321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YT4O2rBUc2KjL8cYB6W5OR9sIuZqdl/MQS5KovfKYc7KvVOP43rbblWfK5JOn5/vDo+WK7S7wJ9wyme4bBaOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5066

Hi Michal,

On 02/09/2022 08:09, Michal Orzel wrote:
> After qemu-smoke-arm64 was changed to use kernel 5.19 we end up having
> two kernel configurations. This is something not needed and maintaining
> a single kernel version is always easier. Modify qemu-alpine-arm64-gcc
> to use kernel 5.19 and remove kernel 5.9 from tests-artifacts.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>

Question unrelated to the patch.

When do we decide that we need to upgrade the kernel version ?

> ---
>   automation/gitlab-ci/build.yaml               | 11 ------
>   automation/gitlab-ci/test.yaml                |  2 +-
>   .../kernel/5.9.9-arm64v8.dockerfile           | 34 -------------------
>   3 files changed, 1 insertion(+), 46 deletions(-)
>   delete mode 100644 automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile
>
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index d2f75a090c0f..720ce6e07ba0 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -586,17 +586,6 @@ alpine-3.12-arm64-rootfs-export:
>     tags:
>       - arm64
>   
> -kernel-5.9.9-arm64-export:
> -  extends: .test-jobs-artifact-common
> -  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.9.9-arm64v8
> -  script:
> -    - mkdir binaries && cp /Image binaries/Image
> -  artifacts:
> -    paths:
> -      - binaries/Image
> -  tags:
> -    - arm64
> -
>   kernel-5.19-arm64-export:
>     extends: .test-jobs-artifact-common
>     image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.19-arm64v8
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 2eb6c3866e2c..07209820b474 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -34,7 +34,7 @@ qemu-alpine-arm64-gcc:
>     needs:
>       - alpine-3.12-gcc-arm64
>       - alpine-3.12-arm64-rootfs-export
> -    - kernel-5.9.9-arm64-export
> +    - kernel-5.19-arm64-export
>       - qemu-system-aarch64-6.0.0-arm64-export
>     artifacts:
>       paths:
> diff --git a/automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile b/automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile
> deleted file mode 100644
> index 053d65a3454e..000000000000
> --- a/automation/tests-artifacts/kernel/5.9.9-arm64v8.dockerfile
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -FROM arm64v8/debian:unstable
> -LABEL maintainer.name="The Xen Project" \
> -      maintainer.email="xen-devel@lists.xenproject.org"
> -
> -ENV DEBIAN_FRONTEND=noninteractive
> -ENV LINUX_VERSION=5.9.9
> -ENV USER root
> -
> -RUN mkdir /build
> -WORKDIR /build
> -
> -# build depends
> -RUN apt-get update && \
> -    apt-get --quiet --yes install \
> -        build-essential \
> -        libssl-dev \
> -        bc \
> -        curl \
> -        flex \
> -        bison \
> -        && \
> -    \
> -    # Build the kernel
> -    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz && \
> -    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
> -    cd linux-"$LINUX_VERSION" && \
> -    make defconfig && \
> -    make -j$(nproc) Image.gz && \
> -    cp arch/arm64/boot/Image / && \
> -    cd /build && \
> -    rm -rf linux-"$LINUX_VERSION"* && \
> -    apt-get autoremove -y && \
> -    apt-get clean && \
> -    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*

