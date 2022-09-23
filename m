Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CEE5E74E6
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 09:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410625.653718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obdC4-0004ZR-Sf; Fri, 23 Sep 2022 07:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410625.653718; Fri, 23 Sep 2022 07:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obdC4-0004WE-PS; Fri, 23 Sep 2022 07:33:52 +0000
Received: by outflank-mailman (input) for mailman id 410625;
 Fri, 23 Sep 2022 07:33:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tkvz=Z2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1obdC3-0004W8-Fu
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 07:33:51 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 106beefd-3b12-11ed-9374-c1cf23e5d27e;
 Fri, 23 Sep 2022 09:33:49 +0200 (CEST)
Received: from BN9PR03CA0940.namprd03.prod.outlook.com (2603:10b6:408:108::15)
 by DM4PR12MB6160.namprd12.prod.outlook.com (2603:10b6:8:a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Fri, 23 Sep
 2022 07:33:47 +0000
Received: from BL02EPF0000C402.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::ab) by BN9PR03CA0940.outlook.office365.com
 (2603:10b6:408:108::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20 via Frontend
 Transport; Fri, 23 Sep 2022 07:33:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C402.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.11 via Frontend Transport; Fri, 23 Sep 2022 07:33:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 23 Sep
 2022 02:33:45 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 23 Sep 2022 02:33:45 -0500
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
X-Inumbo-ID: 106beefd-3b12-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0AuZgYVdRWmn4NYpVR3SPBmpJCXRo5o4Hs+WVOCUzM0S70L2PJ9FKU/CfayzlLIIm+QuiDROqJxWK41IQ/FROvyHfliVhB0IWgjUbQkmVaMATxe5S2aOmmP4CZ4s/pRfeG4yYCD+yM2OEbP+31/9vsXi2DqU2okExdQGeARVtK0P70sZmWX4tTnZLGMr+yYORM3ga9b4XmHft3pL/6MclJEUi06M+fP+AyKgmw/As/Aq54RlEtXztzGuCZUnycmkK6naLR2DObozJD7PonzQwkhqxA94KhRNIYbRoYqvAM3d4sDhvyUMGzTMG2458aJST1gb+VEtapMKNRXZdAV+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyfWqoV7mW5UHT94u3tkjCszZ5FWTHuxyDk3LaMCiE4=;
 b=C/dgG1J+JTrIzI9zRGYwgi7O5PWsGmWpqOazGiSLLfrPueHlATocfyHgl6KoETqrZiPsBnbv7hsqPmfCdvWMBm78NjvI8hG9NtREqdes2ZEgV/xs4eJXa6So3cxPU7u7OLdrapQhDiyOVmxu087kBr7ROvj5FbcrWQk6rtkn8s1Zvk1QwNdKNKSgeHHSwBsOE9P6w+obJEECnTIN7BI0HhTWRtroSmpECz1IsBCjAydwpmesa2RDPDOJn6Wx8W89++CmbgVcQbF2051gahPVn/ns75+wJhMFK3uMyufeM+0rpLwxkKM8Ri2ymbJawZRLJOs2O7mvm4sqSGohL2l3mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyfWqoV7mW5UHT94u3tkjCszZ5FWTHuxyDk3LaMCiE4=;
 b=JrROYhEmtN1yGIB0DI8Dqo1qIiidz7AEYP6IEdk5U9XsCLrBZYOes/mh3KsD2iqhHZC+VNjpnlrPSz4WytK5M9UWl86poUv120bHo5lIGXHOct1K8QhsqPzoGdXgRSrlSI3SSIOQZ3Aw5QfeJav+hUTEWQjz6VMS78ONhxngt8I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <12139bc0-57cd-e0a1-d487-40e61ebc0c96@amd.com>
Date: Fri, 23 Sep 2022 09:33:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/9] automation: Add randconfig build jobs for arm64
 alpine container
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20220922134058.1410-1-michal.orzel@amd.com>
 <20220922134058.1410-3-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2209221442350.65421@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2209221442350.65421@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C402:EE_|DM4PR12MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: b34c9370-c171-4b00-5ff8-08da9d35f36c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0gO+SB3rMnH+Irrebsov+WwctB+mK14W62DiI/w2pV9d8JvTy/np3EKCjUtUViN8M85u9DHOyhAEnOOMISepCJP6bg59mntXwt1DxyFI6i29AHhQj0tl7p3TXwYMotrhp5uFtAsM2138ICKHoITF8yLi0D0C2A7uOUIP/ia2YQ7t8gj3DwcyQF6FVsrezG363WwY9vHnoIgulu66fKYvLFXF0Jj0HOvxv+eLgUvRWsVKPwrDpObb8SXk2ljlHTjMJDy4Uzs68v6ZqXTZD3dZWpJ1hsQYPEmqfPxSm9MJD0mlk7SLuxpvKVqxaE/pNB7CsMoKsMayb+mWhDbxiFSB+zxKbHTbb8ctGmjV5nf8iGdNh8lJzUXZAcjCFomRV+UOvECBowQl5mCaYAUtnFSqYBF3OkLNtwBlp1NxqHKkQ2CVUmxFgEoMVElciitBYBpxyhXyhxv2wOtNuJ2mdfYXF6VyvlO81y1kRPznXnv86Z6/U5I5HGyi2fr1dqEsehrZRDIu41eiUomSMkjT4QzP9Gi0hbdm7H6xhdEUTbfxLRdcFkLDE5Dk44BDt8DYUmyz6L69TsLW3cyyTEHq6svhD8QBztNw6xi4VaLACERGwNtRo+/rWaFrSP/h2JusK2iRL5S2bn5t/egGqr2RgPKqFHGHYr0f+YRBRAINGzDWWoosNwfH2+cesi5CZsEYiNRF3xMYYPAVGhnRk+jJ1luWajd1ezBL6TkeUduHU4D02SS/8tM5oOk8MlkCOV+8n5HA9mWmX64ZYqrNx4etnAKVzVIwrW1Ubol/FPcRXwMy3mmyC843ATNnVLMv1RjSCvOI0GRBPjTik1M8SDbK7G3xMg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(36840700001)(40470700004)(46966006)(47076005)(53546011)(2616005)(426003)(2906002)(4326008)(8676002)(36756003)(186003)(41300700001)(82740400003)(5660300002)(6666004)(8936002)(26005)(40460700003)(86362001)(82310400005)(356005)(40480700001)(81166007)(44832011)(31696002)(36860700001)(336012)(6916009)(31686004)(16576012)(54906003)(316002)(70586007)(478600001)(70206006)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 07:33:46.8513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b34c9370-c171-4b00-5ff8-08da9d35f36c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000C402.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6160

Hi Stefano,

On 22/09/2022 23:42, Stefano Stabellini wrote:
> 
> 
> On Thu, 22 Sep 2022, Michal Orzel wrote:
>> For arm64 we perform builds using debian and alpine containers.
>> We are missing the randconfig build jobs for the latter, so add them.
>> This way for each container we have 4 fundamental build jobs:
>> - defconfig non-debug/debug
>> - randconfig non-debug/debug
> 
> Should we have them also for Debian? The patch below looks fine.
> 

We already have them for Debian. We were missing only the ones for Alpine.
That is why I wrote that after this patch for each container we have 4 fundamental build jobs:
DEBIAN:
 debian-unstable-gcc-arm64
 debian-unstable-gcc-debug-arm64
 debian-unstable-gcc-arm64-randconfig
 debian-unstable-gcc-debug-arm64-randconfig
ALPINE:
 alpine-3.12-gcc-arm64
 alpine-3.12-gcc-debug-arm64
 alpine-3.12-gcc-arm64-randconfig
 alpine-3.12-gcc-debug-arm64-randconfig

> 
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  automation/gitlab-ci/build.yaml | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
>> index a39ed72aac6d..d931441b910a 100644
>> --- a/automation/gitlab-ci/build.yaml
>> +++ b/automation/gitlab-ci/build.yaml
>> @@ -566,6 +566,18 @@ alpine-3.12-gcc-debug-arm64:
>>    variables:
>>      CONTAINER: alpine:3.12-arm64v8
>>
>> +alpine-3.12-gcc-arm64-randconfig:
>> +  extends: .gcc-arm64-build
>> +  variables:
>> +    CONTAINER: alpine:3.12-arm64v8
>> +    RANDCONFIG: y
>> +
>> +alpine-3.12-gcc-debug-arm64-randconfig:
>> +  extends: .gcc-arm64-build-debug
>> +  variables:
>> +    CONTAINER: alpine:3.12-arm64v8
>> +    RANDCONFIG: y
>> +
>>  alpine-3.12-gcc-arm64-staticmem:
>>    extends: .gcc-arm64-build
>>    variables:
>> --
>> 2.25.1
>>

~Michal

