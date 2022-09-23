Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2086E5E7561
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 10:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410652.653743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obdfr-00016G-Va; Fri, 23 Sep 2022 08:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410652.653743; Fri, 23 Sep 2022 08:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obdfr-00013j-Sj; Fri, 23 Sep 2022 08:04:39 +0000
Received: by outflank-mailman (input) for mailman id 410652;
 Fri, 23 Sep 2022 08:04:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tkvz=Z2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1obdfq-00013d-Rs
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 08:04:38 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d46cfa5-3b16-11ed-9374-c1cf23e5d27e;
 Fri, 23 Sep 2022 10:04:37 +0200 (CEST)
Received: from DS7PR03CA0149.namprd03.prod.outlook.com (2603:10b6:5:3b4::34)
 by BL1PR12MB5109.namprd12.prod.outlook.com (2603:10b6:208:309::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 08:04:33 +0000
Received: from DM6NAM11FT115.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::3b) by DS7PR03CA0149.outlook.office365.com
 (2603:10b6:5:3b4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20 via Frontend
 Transport; Fri, 23 Sep 2022 08:04:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT115.mail.protection.outlook.com (10.13.173.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Fri, 23 Sep 2022 08:04:33 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 23 Sep
 2022 03:04:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 23 Sep
 2022 01:04:27 -0700
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 23 Sep 2022 03:04:27 -0500
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
X-Inumbo-ID: 5d46cfa5-3b16-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMOnkmCIScaytb+ppBSjLWwOMwyQuEosvikM2Yoxdh7Q3H2FoAy2kDMkJOaFOZ9IRqz4RHVTwRppfLoyzAzJ7xb0nDeaUJaUreETlk7m9nIwYX/wUkUi9eCoB9zkdXBPWySChxDW6J0P+mJYrUJjgActZbwjsstsvV/+Z9Byif2NpV0zpSqao2SbpiteUlpULuUk+UtleQwyQTyY6FiMpcnflW7OZoRXRhJCExX8Gvl2PhtoxBlI4K5iaBT6rMKNY8Iku19Gyi5w970tK/lhNFTzswr5Kz0xOYd5Ywm0LOST1PFeMWu5tAJJFgGqwCLJUUWukB25wzT4usl7OldD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elVgYMLkUcavZyiFvELPr6QVQ/0eeYdOyU1DIRPP6BI=;
 b=B4mR/F7bsLzlL3hg03b1rGDliAoSh9snDnkm96tW51Q7T4Q6Js4E3IkK+YVZk0Y1ad/Vk6BYfnjUZEBV3zJDzH9wjfk1cBMATl9XZp+Fx6euadfwd7o6234F5hz90DRTM1DTel6j8HoIWVLWrflNsWXuf3A92wHxo6YAaS8kR5AEsmr+oy8ZbVXKCtypcuhDJ0wsjeddQLpQanZxOq6Eckb+8Ye9Y6nEMIfDs5kdG35zrHB2FZum3uJkMQDepgGwrAXPZ7fYr3ou8WrXntADiz/rsG4O1jKV8YJGW2JUYpgdb1Ov1GfUzfCJc19/+JeJED/KbsrYuvpfPOJzZCyylQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elVgYMLkUcavZyiFvELPr6QVQ/0eeYdOyU1DIRPP6BI=;
 b=nJdr4fYk3LxREaajFyT1CIqSlzfx7ornfn8tGgb16UNuUwzQGlksUrrD1xTz0s7xbMUyjM34SzsfZBNmN4h/SXbiO9vASxvWF6LxBS9MFi1W38s8qK4eS0cZ+LOSwe4inFt8kpweXqy2Ha4uNt/Ghhh1yJ+Csj+JhgHGr9qRyY4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <69d8193b-12e2-459e-6921-e84f0f3775d7@amd.com>
Date: Fri, 23 Sep 2022 10:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 5/9] automation: qemu-smoke-arm32.sh: Modify script to use
 ImageBuilder
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20220922134058.1410-1-michal.orzel@amd.com>
 <20220922134058.1410-6-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2209221507480.65421@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2209221507480.65421@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT115:EE_|BL1PR12MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: 648427ab-e212-4bd0-c383-08da9d3a4016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K041UHhtVzdSSWRZM1FDVnhOa1QrT2w0ckp5dVpMUUd4T1JIaWQ0RjRLMUpJ?=
 =?utf-8?B?TzN0ejZ4dGJjalFveUpBc2VBMmYyWnl5ckZXRXF2SVNOT3RJdkVJdjJsdk5p?=
 =?utf-8?B?Zi9ncUE1MUVZRnc5bHoyVTFHVk5LNW0wY3dJUmlaMGZlNGNmRlRSS0NBb1Vx?=
 =?utf-8?B?T005dmNNVW1TRUp2cDBPOWlEUEpFUC9yUGwzekpmS1p2WmJlNERXSXZlemE3?=
 =?utf-8?B?SEppTklaNEZ2VEc5KzF6dDg0a0xmM2RGWGg3L2RpTW5BeWxqeEpWVGpZOGVx?=
 =?utf-8?B?TmxjdUtCUG5NMjlNTG94RFBJSCtPSHpCeGxuaFZyazFkcUlQVDNuVElJZW9N?=
 =?utf-8?B?NldCSHpjaE5XRFFLaHd3Y1pCLzhEUm11YndqbEYvNG8raEpzdHg3M2RvL3dR?=
 =?utf-8?B?VklOOVlubnVjT3g3R0c4eEkwcFRONDlqVGFmK2JFc0RxL0RWTmlFZ0x3eFA3?=
 =?utf-8?B?dE1IekxIakxOWHJSV2ZVaWZySWpNa3dXNW1jS3lxU2FxdmlLcjlsaFIyUHlx?=
 =?utf-8?B?UE9oRFJ5RDB6MVE3NTQyME9tazNnZjI5ZG5hQlhONFgxYUpENFgybUtlcjAr?=
 =?utf-8?B?TVdkV2FuZ09kUTQxS0RWL0N3VklQOGRwVFB5ZXJLOHJjMUJBSEhTTXFwd1dN?=
 =?utf-8?B?Q3VrTVBIV2NjMytkUUJZdXJ1SmgxTEJJeXVBcWlnZ0hFRkovd08raVJjQmd0?=
 =?utf-8?B?MDEyaUp4OVJzMGp0NGNmYjVhMDBnc0hIWUt1dnNMV2g1ajBxcGh5UlV0RWJ5?=
 =?utf-8?B?ZUEvNmIvVEhWa2k2NUE1Z1JKdEFmZU5NWEUvQm44Vyt3K2ZHcjlEQUpTUzFN?=
 =?utf-8?B?VlFWQWlCK3lyYmlUaG9xcElEdnZtc29KeUxUdzFzR2lSR2RFY2NIMGtVWFBK?=
 =?utf-8?B?c1dIcERCYWxXNm11UG5zUDNocE9hMmhLY0dYSC9lTTdNSXZPUDVnZElMUWg4?=
 =?utf-8?B?NUJDMjlub1oyTXRxK0hEU0pWaTlkM2lmUW5wb3VaaWxpa0ZqbFgrTXNnK0tp?=
 =?utf-8?B?cGk5YlJ6dFBiVU9ZSWNLWmhrUGk2V3pQTzZoUUZQQTFCZGRYVWZRdkZ3M3pK?=
 =?utf-8?B?dm10dmpQazludjJCb3o0ME1LaytycHpoeElFQ0M1MTZrbmQ3SHBtc203ZFEx?=
 =?utf-8?B?ZlRvc2I3Wks1eFNlQ2ZWdE9jdzZEbi9sSzNtRGlCL1RselRLbXFnSFNUYnkv?=
 =?utf-8?B?WUV4dkMxZ1AyNlFKUnpxSGdFVlB3bnlQNDVnR3pxUFcwVkNrUDN3NEFJYVFj?=
 =?utf-8?B?RVVmREtXTm5zR1kwSk5xY1dacmFhbWFEZlNsTmVMMDc1NzNVUT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(44832011)(2906002)(82310400005)(4326008)(8676002)(70206006)(8936002)(70586007)(41300700001)(5660300002)(966005)(16576012)(6916009)(36860700001)(186003)(40460700003)(54906003)(478600001)(2616005)(356005)(81166007)(45080400002)(316002)(53546011)(26005)(36756003)(83380400001)(31696002)(31686004)(82740400003)(86362001)(47076005)(336012)(426003)(40480700001)(21314003)(36900700001)(43740500002)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 08:04:33.4306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 648427ab-e212-4bd0-c383-08da9d3a4016
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT115.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5109

Hi Stefano,

On 23/09/2022 00:13, Stefano Stabellini wrote:
> 
> 
> On Thu, 22 Sep 2022, Michal Orzel wrote:
>> Take an example from arm64 qemu test scripts and use ImageBuilder
>> to generate u-boot script automatically. Calculating the addresses
>> manually is quite error prone and also we will be able to benefit
>> from using ImageBuilder when adding domUs to this test in the future.
>>
>> Install and use u-boot from the debian package.
>> Modify the script so that binaries are loaded from u-boot via tftp.
> 
> Great patch! It makes the test a lot better!
> 
> 
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  automation/scripts/qemu-smoke-arm32.sh | 57 ++++++++++++--------------
>>  1 file changed, 27 insertions(+), 30 deletions(-)
>>
>> diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
>> index 530f3892fdd3..765facbe4d66 100755
>> --- a/automation/scripts/qemu-smoke-arm32.sh
>> +++ b/automation/scripts/qemu-smoke-arm32.sh
>> @@ -4,7 +4,9 @@ set -ex
>>
>>  export DEBIAN_FRONTENT=noninteractive
>>  apt-get -qy update
>> -apt-get -qy install --no-install-recommends device-tree-compiler \
>> +apt-get -qy install --no-install-recommends u-boot-qemu \
>> +                                            u-boot-tools \
>> +                                            device-tree-compiler \
>>                                              curl \
>>                                              cpio
>>
>> @@ -20,10 +22,6 @@ tar xvzf ../initrd.tar.gz
>>  find . | cpio -H newc -o | gzip > ../initrd.gz
>>  cd ..
>>
>> -kernel=`stat -L --printf="%s" vmlinuz`
>> -initrd=`stat -L --printf="%s" initrd.gz`
>> -
>> -# For Xen, we need a couple of more node. Dump the DT from QEMU and add them
>>  # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
>>  curl -fsSLO https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fqemu%2Fqemu%2Fraw%2Fv5.2.0%2Fpc-bios%2Fefi-virtio.rom&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Cd33d5c4c08934fac0cc208da9ce7a3fb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637994815957091528%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=JuEapfYVLj5P3S5yY%2BAa47Nk4zgbdymjjsiUTmoTmyk%3D&amp;reserved=0
>>  ./qemu-system-arm \
>> @@ -36,31 +34,31 @@ curl -fsSLO https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fqemu%2Fqemu%2Fraw%2Fv5.2.0%2Fpc-bios%2Fefi-virtio.rom&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Cd33d5c4c08934fac0cc208da9ce7a3fb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637994815957091528%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=JuEapfYVLj5P3S5yY%2BAa47Nk4zgbdymjjsiUTmoTmyk%3D&amp;reserved=0
>>     -display none \
>>     -machine dumpdtb=virt.dtb
>>
>> -dtc -I dtb -O dts virt.dtb > virt.dts
>> +# ImageBuilder
>> +echo 'MEMORY_START="0x40000000"
>> +MEMORY_END="0x80000000"
>> +
>> +DEVICE_TREE="virt.dtb"
>> +XEN="xen"
>> +DOM0_KERNEL="vmlinuz"
>> +DOM0_RAMDISK="initrd.gz"
>> +DOM0_CMD="console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh"
>> +XEN_CMD="console=dtuart dom0_mem=512M bootscrub=0"
> 
> This is missing dtuart=/pl011@9000000 compared to the original

Actually this is not needed because we always have stdout-path defined in chosen to point to /pl011@...
but I can add this.

> 
> 
>> +NUM_DOMUS=0
>> +
>> +LOAD_CMD="tftpb"
>> +BOOT_CMD="bootm"
> 
> "bootm" because "booti" is not available on arm32, right?

Exactly.
> 
> 
>> +UBOOT_SOURCE="boot.source"
>> +UBOOT_SCRIPT="boot.scr"' > config
>>
>> -cat >> virt.dts << EOF
>> -/ {
>> -     chosen {
>> -             #address-cells = <0x2>;
>> -             #size-cells = <0x2>;
>> -             stdout-path = "/pl011@9000000";
>> -        xen,xen-bootargs = "console=dtuart dtuart=/pl011@9000000 dom0_mem=512M bootscrub=0";
>> -             xen,dom0-bootargs = "console=tty0 console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh";
>> -             dom0 {
>> -                     compatible = "xen,linux-zimage", "xen,multiboot-module";
>> -                     reg = <0x0 0x1000000 0x0 $kernel>;
>> -             };
>> -        dom0-ramdisk {
>> -                     compatible = "xen,linux-initrd", "xen,multiboot-module";
>> -                     reg = <0x0 0x3200000 0x0 $initrd>;
>> -             };
>> -     };
>> -};
>> -EOF
>> -dtc -I dts -O dtb virt.dts > virt.dtb
>> +rm -rf imagebuilder
>> +git clone https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2FViryaOS%2Fimagebuilder&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Cd33d5c4c08934fac0cc208da9ce7a3fb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637994815957091528%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=i5N8DXMjn%2F80mdXtc%2FwDGJw6ImUrUAjOg0SJp9CkRdQ%3D&amp;reserved=0
>> +bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
>>
>>  rm -f smoke.serial
>>  set +e
>> +echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
>>  timeout -k 1 240 \
>>  ./qemu-system-arm \
>>     -machine virt \
>> @@ -70,11 +68,10 @@ timeout -k 1 240 \
>>     -serial stdio \
>>     -monitor none \
>>     -display none \
>> -   -dtb virt.dtb \
>>     -no-reboot \
>> -   -kernel ./xen \
>> -   -device loader,file=./vmlinuz,addr=0x1000000 \
>> -   -device loader,file=./initrd.gz,addr=0x3200000 |& tee smoke.serial
>> +   -device virtio-net-pci,netdev=n0 \
>> +   -netdev user,id=n0,tftp=./ \
>> +   -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& tee smoke.serial
>>
>>  set -e
>>  (grep -q "^/ #" smoke.serial) || exit 1
>> --
>> 2.25.1
>>

~Michal

