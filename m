Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3058A5AFCD6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 08:50:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400845.642461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVoss-0001Eb-7H; Wed, 07 Sep 2022 06:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400845.642461; Wed, 07 Sep 2022 06:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVoss-000195-3b; Wed, 07 Sep 2022 06:50:02 +0000
Received: by outflank-mailman (input) for mailman id 400845;
 Wed, 07 Sep 2022 06:50:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiom=ZK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oVosq-00018t-57
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 06:50:00 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48ed5780-2e79-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 08:49:58 +0200 (CEST)
Received: from MW4P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::11)
 by BL1PR12MB5240.namprd12.prod.outlook.com (2603:10b6:208:319::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 06:49:54 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::56) by MW4P223CA0006.outlook.office365.com
 (2603:10b6:303:80::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 06:49:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 06:49:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 01:49:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 01:49:51 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 7 Sep 2022 01:49:50 -0500
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
X-Inumbo-ID: 48ed5780-2e79-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isbW2x6b/IhdO0VHf5PJNYlYzvyW5E7wYJC2FLZ+LDVdjluexUgEYFWlFtVY9NcHNBVpI9xty2maRqgO1uAwRheYBmsu1feRTx9ZTIOwU6Sv9vi9x705Edw9dDqcGm+yEL1OvH6TuqlsVDl51ijSG7Jicnqx6iH5LkRHKXIBeLBdez0L2zETr7we1hgfE6ikcXs/yyObf/r8hxu5KhfuSutrSCMhqc2lMcjlVfTEZUCP+77KYzPAv1oVH4fR++oa+wtluFtmIJC5nNUxHFbyus0rV7bw2ajb30Kr//IWfSCGmkToMfkJIuYgDC8F4WW9QRnSeKBeslQksu3ZfxQ0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2USVaTAicxjRY+lKuGGdLuCt7Msq7kML8XSHQtYTx70=;
 b=mfh2EjgfCo/gXJ9+izfYulXET+SqstQA5fUMVZelRg9aO1LOnxG4v20sQ7Awp+xsKaUc+VLu5Y/lhXgdIoeuwFmnpzZXpZYHjWK72FNy2sPBYqD6KIGdgojIGHBlogDW/bIl/MCwCCcJYoEZhhhpRGJ8Ip9rBIuvxRF5nknFWK4Rc8ezCmSv1XgdU52NKafwe/1ejy8Rlcz8U9Ag53YwiDgvx7P+CSg1EG4STU7t4aEu2RHi8isRSxaWBTJX9PRkSQLkfBQ2al763u65usPcK+yE/aYW0/+uqV2rv5OhNvNxbAwAz+MjWrh1oNaPLgcY9EDNPEXBiKCSSkaY6GJ0JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2USVaTAicxjRY+lKuGGdLuCt7Msq7kML8XSHQtYTx70=;
 b=JnycwLbD5d8CykTBlGYVEYJR7iF4W2LdTaxSPPQQuJktBFwGP2zhogEivSAvTGIUm6geY8ixIqBTAizVlU8LxEkvhJFrm0UtZ26uD0rkZG37RKiP6mTcDpXjFvPe2s3j+FHSyh8S8o3AyvMT/A6cyy+STUA8hmjk4wyr3w9p+E0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3fe3bd63-e215-a2e4-acf7-273f9936808b@amd.com>
Date: Wed, 7 Sep 2022 08:49:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [ImageBuilder] Add support for Xen boot-time cpupools
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>
References: <20220906111214.26912-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2209061819310.157835@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2209061819310.157835@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT010:EE_|BL1PR12MB5240:EE_
X-MS-Office365-Filtering-Correlation-Id: dc73a7cc-f4b9-4b18-79c3-08da909d2b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CJw0HYd+QVm85tmgqP3ZsxPNdEkS4d3sRicvChIg5qgdL9lIonzt3N6LKxKrjM9hbuWHjyuDNAWdOrWBqb/1uyz+VCUzpK/S5Lh1Aw6Nf5W6foP/ozyMSk5P2D/Hw3nLVpiKo5yD0lQICKBQ2OO47D7bZ5Y+KWAhVNtP55qzpBluN/RG04+r6rm6uQ/F++7nsDqFWRMtggp6UESGyh3jiG04yKBnCKyy8W2EljXaDDFps8gP+mtazT/d12d7YdhC39N2xIPumwoU4W1YcCNZ0KOnGLW9c2v5vt2dr47Jhol4uCoo9Ld+djMFhyiFkzV/KcdGBX50G47JJxTc94sA8u1BKJt77Bsz3TcFTJg404wFX4jMJZxOgE9V9/X8z19VSKKuadkrlFhhII00WC4OyhAYnIt9LqJk7azg9dazhu+BA4S7HP6LfhjGjDGoVTWRCEjs4E3uk8BwMb+UZYAFFjpZ/ff8i6f6ueOa1Uq/JFhgeVlR20jg1k0tLvX/GxEtkvJls5n5mnWMERhNGj0iXXxvJ2qBZjBttRLDRa9dxIrA8KNj/f7xdeGfjXJLIpFrkisaZ3hCTWyoeIGQ/q5PqsR+UqOZJDA3W61Sqtxyy8sXmPCGi6XDWx+g5oBocYg9m+JmyoiMWrlZHzZquxI+1NI0KsVbcgXeSvZtZ/sTQEc5stlcJxS1xHPxQzfiU8fa4Nq/hYsm3fnMXsQq3Qi1wcf1dXEGf184nW/8cBP9d9+wyZ2wKsSi7ThAqzl0WVZBzYQrjKa63G9zpq3HigVj7Fbq3nd41hg8UFvgkiIe3fKdbVKYq/ufBEiMp9ZxvRJBRIlipYx4SzVkuyO4x5SWnQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(396003)(40470700004)(46966006)(36840700001)(8676002)(426003)(83380400001)(70206006)(47076005)(70586007)(8936002)(36860700001)(5660300002)(4326008)(53546011)(26005)(478600001)(186003)(336012)(2616005)(41300700001)(16576012)(31686004)(316002)(44832011)(6916009)(31696002)(86362001)(82310400005)(36756003)(40460700003)(40480700001)(356005)(81166007)(82740400003)(2906002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 06:49:53.7044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc73a7cc-f4b9-4b18-79c3-08da909d2b6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5240

Hi Stefano,

On 07/09/2022 03:43, Stefano Stabellini wrote:
> 
> On Tue, 6 Sep 2022, Michal Orzel wrote:
>> Introduce support for creating boot-time cpupools in the device tree and
>> assigning them to dom0less domUs. Add the following options:
>>  - CPUPOOL[number]="cpu1_path,...,cpuN_path scheduler" to specify the
>>    list of cpus and the scheduler to be used to create cpupool
>>  - NUM_CPUPOOLS to specify the number of cpupools to create
>>  - DOMU_CPUPOOL[number]="<id>" to specify the id of the cpupool to
>>    assign to domU
>>
>> Example usage:
>> CPUPOOL[0]="/cpus/cpu@1,/cpus/cpu@2 null"
>> DOMU_CPUPOOL[0]=0
>> NUM_CPUPOOLS=1
>>
>> The above example will create a boot-time cpupool (id=0) with 2 cpus:
>> cpu@1, cpu@2 and the null scheduler. It will assign the cpupool with
>> id=0 to domU0.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Great patch in record time, thanks Michal!
> 
> 
> On the CPUPOOL string format: do you think we actually need the device
> tree path or could we get away with something like:
> 
> CPUPOOL[0]="cpu@1,cpu@2 null"
> 
> All the cpus have to be under the top-level /cpus node per the device
> tree spec, so maybe the node name should be enough?
> 
According to specs, passing only the node names should be enough
so I will modify it.

> 
> 
>> ---
>>  README.md                | 10 +++++
>>  scripts/uboot-script-gen | 80 ++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 90 insertions(+)
>>
>> diff --git a/README.md b/README.md
>> index bd9dac924b44..44abb2193142 100644
>> --- a/README.md
>> +++ b/README.md
>> @@ -181,6 +181,9 @@ Where:
>>    present. If set to 1, the VM can use PV drivers. Older Linux kernels
>>    might break.
>>
>> +- DOMU_CPUPOOL[number] specifies the id of the cpupool (created using
>> +  CPUPOOL[number] option, where number == id) that will be assigned to domU.
>> +
>>  - LINUX is optional but specifies the Linux kernel for when Xen is NOT
>>    used.  To enable this set any LINUX\_\* variables and do NOT set the
>>    XEN variable.
>> @@ -223,6 +226,13 @@ Where:
>>    include the public key in.  This can only be used with
>>    FIT_ENC_KEY_DIR.  See the -u option below for more information.
>>
>> +- CPUPOOL[number]="cpu1_path,...,cpuN_path scheduler"
>> +  specifies the list of cpus (separated by commas) and the scheduler to be
>> +  used to create boot-time cpupool. If no scheduler is set, the Xen default
>> +  one will be used.
>> +
>> +- NUM_CPUPOOLS specifies the number of boot-time cpupools to create.
>> +
>>  Then you can invoke uboot-script-gen as follows:
>>
>>  ```
>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>> index 18c0ce10afb4..2e1c80a92ce1 100755
>> --- a/scripts/uboot-script-gen
>> +++ b/scripts/uboot-script-gen
>> @@ -176,6 +176,81 @@ function add_device_tree_static_mem()
>>      dt_set "$path" "xen,static-mem" "hex" "${cells[*]}"
>>  }
>>
>> +function add_device_tree_cpupools()
>> +{
>> +    local num=$1
>> +    local phandle_next="0xfffffff"
> 
> I think phandle_next is a good idea, and I would make it a global
> variable at the top of the uboot-script-gen file or at the top of
> scripts/common.
> 
> The highest valid phandle is actually 0xfffffffe.
> 
This was my original idea so I will do following to properly handle phandles:
- create a global variable phandle_next in scripts/common set to 0xfffffffe
- create a function get_next_phandle in scripts/common to get the next available phandle,
  formatted properly in hex, which will also decrement the phandle_next

I will push this as a prerequisite patch for boot-time cpupools.

> 
> 
>> +    local cpus
>> +    local scheduler
>> +    local cpu_list
>> +    local phandle
>> +    local cpu_phandles
>> +    local i
>> +    local j
>> +
>> +    i=0
>> +    while test $i -lt $num
> 
> I don't think there is much value in passing NUM_CPUPOOLS as argument to
> this function given that the function is also accessing CPUPOOL[]
> directly. I would remove $num and just do:
> 
>     while test $i -lt $NUM_CPUPOOLS
ok

~Michal


