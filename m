Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12155FF412
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 21:24:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423078.669502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojQH8-0007n0-SZ; Fri, 14 Oct 2022 19:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423078.669502; Fri, 14 Oct 2022 19:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojQH8-0007kM-PA; Fri, 14 Oct 2022 19:23:18 +0000
Received: by outflank-mailman (input) for mailman id 423078;
 Fri, 14 Oct 2022 19:23:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPLM=2P=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ojQH6-0007kG-AS
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 19:23:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4d32d7b-4bf5-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 21:23:13 +0200 (CEST)
Received: from DM6PR02CA0068.namprd02.prod.outlook.com (2603:10b6:5:177::45)
 by PH7PR12MB6441.namprd12.prod.outlook.com (2603:10b6:510:1fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 14 Oct
 2022 19:23:09 +0000
Received: from DM6NAM11FT069.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::9f) by DM6PR02CA0068.outlook.office365.com
 (2603:10b6:5:177::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Fri, 14 Oct 2022 19:23:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT069.mail.protection.outlook.com (10.13.173.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Fri, 14 Oct 2022 19:23:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 14 Oct
 2022 14:23:07 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 14 Oct 2022 14:23:06 -0500
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
X-Inumbo-ID: a4d32d7b-4bf5-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+BRjNjFNa/JbaApXBrLlKjSTWm6MWFC589x/OtVVos9cg26QiScuuF8Vx3/qRGnmjjkpqRih/eyRsQRLwTuNJe9xUCd0ZYB2b7Jo5XwpGINW9PBVb3ynyopWAXNArc2T7eWhh8JV1+8+bKZ6oODpXfxuSPSJLcKTXqQUqlv/YpqpIVOfIt0f0oPzPdIuoQvdE77cxCkch+RgkDoQLQw/NNbia9SpTD0Ekw4Bs0UfnaP/HnCcwtV0mBnozrtgUNga7OLxnTXGtScYDxKGKLkLrlwEq8OVn8UDktwiWD8J0K5muM7hqT8SLfIS/LxqD/LXjwWAJr8iEIUcM38sbR48w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68HpaOmUzeR4ND0qN+hUef0LVVc5NazVcmHrSQKZrew=;
 b=VgoQkD+V+cWNTN5vhARK3HKAJj874JjEEWb1VevAGdKl6AoQ6Z+4JjiFITdSlUGoUzpb0GFdYw1mgTFlyp0Ja722Z+DgOM8u9uomu+v6wWcLi7dwQwzLipu/KmJ4MlTg3HCt0KzMSkuCln84v4VwX0EU9dJWvTaa311macQI+5RCwN/i6JHkqTFBYyqilNqlEfZNp0ndBSQ6noI9TopOnwVG7Q91r36kznzcS6gz+6XJj+rt1EG/WkeFz0w0x6YekNQM0rgyUY5PlGLJyY1/7RmLMg2HdtMCGIPN34+ZR8PkhQYxgzJ5sVpkrCXhBIpbyKf7ynBLoXrAphaEh9JFBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68HpaOmUzeR4ND0qN+hUef0LVVc5NazVcmHrSQKZrew=;
 b=2FP1SuiT3MvM95w5tMH2tizUlViptaPHYxNy21CgUk0FjMSZGCF25p5WvHeiKTZhWESDIXzw9xLQRxjJrYJTvUG39ijZlWYrlaY6A5C2kyc3IegHakbmxCNjRy4fDT2Zj4+FB3p0h+kGlJPTtN61KOAbPtobQbmrKPe2eKO2/1s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <728f2beb-dc28-9140-0fec-0a67bc49f3f4@amd.com>
Date: Fri, 14 Oct 2022 15:23:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] xen/arm: mark handle_linux_pci_domain() __init
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>, <xen-devel@lists.xenproject.org>
References: <20221014025354.30248-1-stewart.hildebrand@amd.com>
 <0ade954c-5741-754c-fc59-177feb67ddf4@suse.com>
 <5f985e76-e817-5d44-3463-ffc0a98c407c@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <5f985e76-e817-5d44-3463-ffc0a98c407c@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT069:EE_|PH7PR12MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e152c5-c590-4305-bd98-08daae1986ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fs/qxZVH47WK1AMWXownBfwgZbuDUwp994MDyY5nzF9+RdS+6SLaqZZXQXjKYCbfztmGI+r5ks5+GfSxwPjsDqARdoAMlBlleqS3+0a1tB5WD3Ur2yijT1Dn9IrP/DBo+39eyAmnrX03sPiai/NmK7EMzNAQ/YcY3gc+/gS8X2YrmT8AB22saUq5JOv0hxV1rZOvflbYqHcT/+jROrWQJ9mncHi3eDstDBw9ZKSkZBCPF3bRkf+2mWTatRI5xvxuuMc5fEguhpVKYgovlksDH1OvQqWksub2mmSCDqX8rJWV8yXvQvDX4BOvl9FYgtO4fiLkUJKnCorz/6cFZFkNnwxgVyAz/0Wt/qv8UzRPloOddHPoLq+rgFM6KfbNv2eEFn/pOT+IyNZmgSvmCcTi9jvT7RC2agd6IqaFd4FpV6n2Be3iqm5FYrTiM5V3V5xoGtZcmZwfBtcVnyK7Wwhwy+OhJj+0kaKH4SyHOXwe7x6ZKomvBo1AFOmpadOPAzNzCorXMIfoZvQRriDw08dOMvvssvvOFOAyXqZ6quZcbXsKupAoFyXCzWSZ2coCMgqPZyTElJz2r8N+R9Enf3D9a3UuXkEqWc9eCEGlT3jSntXxlx/fZiTk1GK9qIBI4WG1jSP2pDmexQ18EyMvfMBM151nLBkB4p4dOHvff7hv/wqynnOSdODO3prj9nQ4f4kdByUJszF32guSgCha9zf+e+6Gut/Tp/IoOsWdX/l3AhnvE/THwQegfe05CvLSNxl6BpmDOFVY4gzZI8UfmtkUplxZotopAK2gxeGg/0HsWj3/fygI08w/f6vZQ61GDETGSqm/UAiMtbXMpYqtFaLT7BfwJZdDt2fyjv4C6mqXRhislC4qujkEif6MYu5nOfIX
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(53546011)(26005)(31686004)(40460700003)(356005)(36860700001)(4326008)(82740400003)(316002)(81166007)(70206006)(16576012)(31696002)(36756003)(2616005)(86362001)(41300700001)(40480700001)(70586007)(8676002)(8936002)(47076005)(186003)(82310400005)(83380400001)(54906003)(2906002)(478600001)(966005)(44832011)(5660300002)(336012)(426003)(110136005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 19:23:08.2513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e152c5-c590-4305-bd98-08daae1986ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT069.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6441

On 10/14/22 04:22, Julien Grall wrote:
> Hi,
>
> On 14/10/2022 08:16, Jan Beulich wrote:
>> On 14.10.2022 04:53, Stewart Hildebrand wrote:
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>
>> I guess a non-empty description and a Fixes: tag would be nice.

Okay, I will send a v2 with the following description:
All functions in domain_build.c should be marked __init. This was 
spotted when building the hypervisor with -Og.

Fixes: 1050a7b91c xen/arm: add pci-domain for disabled devices
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

> +1. I am actually quite interested to understand how this was spotted.
>
> The build system should check that any function/data in domain_build.c
> are part of the __init section. So I guess the compiler you are using
> doesn't inline the function?
>
> If so, I am actually surprised you are the first one spotted this... We
> are building on various distribution without any issues (?). I would be
> interested to know the compiler version and maybe we could add it in the
> CI.

I added -Og to the make command line so it takes precedence over the 
default -O1/-O2:

$ make EXTRA_CFLAGS_XEN_CORE="-Og" XEN_TARGET_ARCH=arm64 
CROSS_COMPILE=aarch64-none-linux-gnu- dist-xen -j $(nproc)

Indeed, I did observe the build error:
Error: size of arch/arm/domain_build.o:.text is 0x00000008

I used this rune to reveal the culprit:

$ aarch64-none-linux-gnu-objdump -d xen/arch/arm/domain_build.o | head

xen/arch/arm/domain_build.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <handle_linux_pci_domain>:
     0:   52800000        mov     w0, #0x0                        // #0
     4:   d65f03c0        ret

I am using this toolchain: 
https://developer.arm.com/-/media/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz

Further, there were two more build errors observed when building with -Og:
arch/arm/domain_build.c: In function ‘make_cpus_node’:
arch/arm/domain_build.c:2013:12: error: ‘clock_valid’ may be used 
uninitialized in this function [-Werror=maybe-uninitialized]
  2013 |         if ( clock_valid )
       |            ^

arch/arm/efi/boot.c: In function ‘efi_start’:
arch/arm/efi/boot.c:1464:9: error: ‘argc’ may be used uninitialized in 
this function [-Werror=maybe-uninitialized]
  1464 |         efi_arch_handle_cmdline(argc ? *argv : NULL, options, 
name.s);
       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I assume these uninitialized use errors can simply be fixed by 
initializing the respective variables to false/0, but a second opinion 
would certainly be helpful.

