Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC61D695B78
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 08:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495011.765258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRqBK-0005CK-AQ; Tue, 14 Feb 2023 07:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495011.765258; Tue, 14 Feb 2023 07:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRqBK-00059q-7e; Tue, 14 Feb 2023 07:56:54 +0000
Received: by outflank-mailman (input) for mailman id 495011;
 Tue, 14 Feb 2023 07:56:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrib=6K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pRqBJ-00059k-Ht
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 07:56:53 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23d925f3-ac3d-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 08:56:52 +0100 (CET)
Received: from DM6PR08CA0050.namprd08.prod.outlook.com (2603:10b6:5:1e0::24)
 by PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Tue, 14 Feb
 2023 07:56:49 +0000
Received: from DS1PEPF0000E649.namprd02.prod.outlook.com
 (2603:10b6:5:1e0:cafe::dc) by DM6PR08CA0050.outlook.office365.com
 (2603:10b6:5:1e0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Tue, 14 Feb 2023 07:56:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E649.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.8 via Frontend Transport; Tue, 14 Feb 2023 07:56:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Feb
 2023 01:56:46 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Feb
 2023 01:56:46 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 14 Feb 2023 01:56:45 -0600
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
X-Inumbo-ID: 23d925f3-ac3d-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFkM23ipgnXToOKTit0/H5zi6Glu8So/YQl4iGshLmeCKmGCu86y8rTxWkvgU5HPEnqautoooFbw4JUbqIf13JHsntWJ7rjcfqDgo7SimeTeI+Qe4PHNO/6umPg12kKo6NQ9Gd4Vt5WcCfQNYYB9VjTrBF91SqJGDrRXyPg71WDZrKZ9ZtX3BeWiNMUUZCo1ZEHhRe7mfNbbblwqSLFj1HEtJ+l7CjW2aWhNb7KoAKApD7DF90qpOFuJG+JrizEtlMYGaPBTTWlDGYiBOU6bD81fIBjLlSYXe2SYyucBgpqIRnIpTH4NDV6YhoTQz1TNL2Z810qN8XTPc3KtqPb+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHRGeqFabrzqgtkCv/kwcmFJX8POG9wc4dVfDhSbL9g=;
 b=OOFNW714u2TRqv1cpkfX9H+Qr81ZG7g5ojhC3Cc9ZjQWaCZEGavt5jjUHUSb2YXFUC1PF7bfhBTMBBBbeYPfwmH5dXPnV4ODf3ooZwkR3RkIkNeJ2NmE2dUnG+915chRoeIVpZ6YHkHDqvY66AwxtkIqTD8PrlL/bJ+gtrpMC/HJhXfId9WWItVLVFDuXkQuXvGKyOYT7jHHQdIaGJSfIQnTzaVBZzI7pc5jJXF6vZCl2P0r6jf33EtI1tvCwylkgcJVmVP+UaCD078+bAYz8qHXChBLzBw3DDluyFlwS3tdidlLdMXP4vJ4SJb3FCAHmR0l3CP0VQHXRm1uH+nDvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHRGeqFabrzqgtkCv/kwcmFJX8POG9wc4dVfDhSbL9g=;
 b=IWmmC2I4B3p6xDTDzGWZS4sgxJ2PD0Ebmvg07ZM89Kf506gaIISNZOGPnQLJqmFXJGSLpmWJh4hX8f0C2RlAD7uyDQDDQAQzG/Ns1kTde5CuEeScggv5Ew92rR1696yHVkduL10cI8kADpY13MyQTnhlox9WR65sOi247WW6B2I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f4d8a2a8-ea8a-60af-a819-989f9dcbc6ab@amd.com>
Date: Tue, 14 Feb 2023 08:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/3] automation: Add arm32 dom0less testing
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20230213142210.11728-1-michal.orzel@amd.com>
 <20230213142210.11728-2-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2302131545220.4661@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2302131545220.4661@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E649:EE_|PH7PR12MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: bcffba99-3af3-4ee2-be4d-08db0e61068a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W7DgCkVsOQoeRXK/ACKIkrlJE0EjvN8lVMIEY0+HS3++FY/Zq0+mAanAsw9+pXYhhtb5I6p1Su3cuZFVy/puG2DNjhvM1wJ6yn2cJ3gj/GVHkR0DNz7nhHPJnjQFkA+tx3uFlFRBZ5Yx7/Q+xoEtwVFnekfMQ7exrNnWr0UeuAZ62Eo0ESs3QARPGudvUSIIZSK8o2u6ECk6EW91J4pogz9LNtewbtswDCzdliF3WdxiCls+3bKR01IhWLfGUas9qK3FJ1dH21vcqLJkTeFRExOLZqgqRrihiHRPg3wjQ5zUOS4bHyKkHyRUGY6bw2Dq9dfm5/PpX6c3iS5ufb6ZMmbl/H38Vqe0/hGmaaR7fb4HyvGrlxvz0orjEJts9kWI7hwyIkRDC1fXaokIwqxmeyPmXfYxvmU6Mtgev4NTJxB4kcRwtN/ojB9b1eIHmpO9HO4Zox/2FUpcohKlQBQ9/wHM4/wMUuYSBaPHqzKIaTnQXwq956zBQMYVWPYl0LJoVtpPNn6HgIwX5SUz647CNIqv5EZhlrmH5Vlb/epRbGYiDrx9fq4LtnwBapG0YuJO5QlUEgyxQGZwrq7KuGySliW4TBta/3aqSF1r+pxqGgf7cnEs6WkXArrXAeCO/vtzPMLYQq7R4OrpRponHivc5G04qTgbYatRQ9YW8JtycJICqSBRuLga9fe2+iILORUaVgGea37V7+3DpL07u2cgkP/lLSJfM1KwIWHfVjDRwCaYzfJ3lJq0XpV4Kfxp2Ea8elhHJuTjWuko9cKblbvL7ciftLCl57MIFYY8nL1bdp8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199018)(46966006)(40470700004)(36840700001)(82740400003)(82310400005)(40480700001)(83380400001)(47076005)(966005)(478600001)(36756003)(40460700003)(26005)(426003)(336012)(53546011)(2616005)(186003)(36860700001)(31686004)(44832011)(70206006)(6916009)(70586007)(86362001)(8936002)(5660300002)(41300700001)(81166007)(356005)(16576012)(316002)(31696002)(54906003)(8676002)(4326008)(2906002)(21314003)(32563001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 07:56:48.6492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcffba99-3af3-4ee2-be4d-08db0e61068a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E649.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8156

Hi Stefano,

On 14/02/2023 01:37, Stefano Stabellini wrote:
> 
> 
> On Mon, 13 Feb 2023, Michal Orzel wrote:
>> At the moment, we only perform a single arm32 test in our CI, checking
>> whether dom0 boots successfully or not. This is mostly because we do not
>> have any arm32 runners and we only execute a hypervisor only build.
>>
>> In order not to leave the arm32 testing in such a poor state, add a
>> script qemu-smoke-dom0less-arm32.sh to start testing true dom0less
>> configuration, in which case we do not need a dom0 with a toolstack.
>>
>> The script is mostly based on the one used for dom0 arm32 testing as well
>> as the one used for dom0less arm64 testing. We obtain Debian Bullseye
>> kernel and Alpine Linux busybox-based rootfs. Depending on the test
>> variant, we prepare a test case contained within domU_check variable,
>> that will be executed as part of /init script.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  automation/gitlab-ci/test.yaml                | 16 ++++
>>  .../scripts/qemu-smoke-dom0less-arm32.sh      | 89 +++++++++++++++++++
>>  2 files changed, 105 insertions(+)
>>  create mode 100755 automation/scripts/qemu-smoke-dom0less-arm32.sh
>>
>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>> index ce543ef5c0ef..84ab1fee50a4 100644
>> --- a/automation/gitlab-ci/test.yaml
>> +++ b/automation/gitlab-ci/test.yaml
>> @@ -210,6 +210,22 @@ qemu-smoke-dom0-arm32-gcc-debug:
>>      - *arm32-test-needs
>>      - debian-unstable-gcc-arm32-debug
>>
>> +qemu-smoke-dom0less-arm32-gcc:
>> +  extends: .qemu-arm32
>> +  script:
>> +    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
>> +  needs:
>> +    - *arm32-test-needs
>> +    - debian-unstable-gcc-arm32
>> +
>> +qemu-smoke-dom0less-arm32-gcc-debug:
>> +  extends: .qemu-arm32
>> +  script:
>> +    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
>> +  needs:
>> +    - *arm32-test-needs
>> +    - debian-unstable-gcc-arm32-debug
>> +
>>  qemu-alpine-x86_64-gcc:
>>    extends: .qemu-x86-64
>>    script:
>> diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
>> new file mode 100755
>> index 000000000000..c81529cbbfd0
>> --- /dev/null
>> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
>> @@ -0,0 +1,89 @@
>> +#!/bin/bash
>> +
>> +set -ex
>> +
>> +test_variant=$1
>> +
>> +cd binaries
>> +# Use the kernel from Debian
>> +curl --fail --silent --show-error --location --output vmlinuz https://deb.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
>> +# Use a tiny initrd based on busybox from Alpine Linux
>> +curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
>> +
>> +if [ -z "${test_variant}" ]; then
>> +    passed="generic test passed"
>> +    domU_check="
>> +echo \"${passed}\"
>> +"
>> +fi
>> +
>> +# domU rootfs
>> +mkdir rootfs
>> +cd rootfs
>> +tar xvzf ../initrd.tar.gz
>> +echo "#!/bin/sh
>> +
>> +mount -t proc proc /proc
>> +mount -t sysfs sysfs /sys
>> +mount -t devtmpfs devtmpfs /dev
>> +${domU_check}
>> +/bin/sh" > init
>> +chmod +x init
>> +find . | cpio -H newc -o | gzip > ../initrd.gz
>> +cd ..
>> +
>> +# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
>> +curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
>> +./qemu-system-arm \
>> +    -machine virt \
>> +    -machine virtualization=true \
>> +    -smp 4 \
>> +    -m 1024 \
>> +    -serial stdio \
>> +    -monitor none \
>> +    -display none \
>> +    -machine dumpdtb=virt.dtb
>> +
>> +# ImageBuilder
>> +echo 'MEMORY_START="0x40000000"
>> +MEMORY_END="0x80000000"
>> +
>> +DEVICE_TREE="virt.dtb"
>> +XEN="xen"
>> +XEN_CMD="console=dtuart bootscrub=0"
>> +
>> +DOMU_KERNEL[0]="vmlinuz"
>> +DOMU_RAMDISK[0]="initrd.gz"
>> +DOMU_MEM[0]="512"
>> +NUM_DOMUS=1
> 
> Since we are at it I would prefer to create both dom0 and a domU to make
> the test more interesting. The following works on gitlab-ci on top of
> this patch. Would you be up for adding it to this patch?
This is exactly what I had in my initial approach. However, because this would not differ
much from what we have in dom0 arm32 testing, I decided to go for true dom0less configuration.
I'm ok to always boot dom0less domU with dom0. In this case I might add an additional test to
run a true dom0less as well.

~Michal

