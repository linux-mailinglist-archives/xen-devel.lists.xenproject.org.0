Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB035B6914
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 09:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406174.648575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY0kS-00011M-Vy; Tue, 13 Sep 2022 07:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406174.648575; Tue, 13 Sep 2022 07:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY0kS-0000yy-Sg; Tue, 13 Sep 2022 07:54:24 +0000
Received: by outflank-mailman (input) for mailman id 406174;
 Tue, 13 Sep 2022 07:54:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWZA=ZQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oY0kR-0000ys-0f
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 07:54:23 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45cbd9bb-3339-11ed-a31c-8f8a9ae3403f;
 Tue, 13 Sep 2022 09:54:20 +0200 (CEST)
Received: from DS7PR05CA0050.namprd05.prod.outlook.com (2603:10b6:8:2f::9) by
 DM4PR12MB7549.namprd12.prod.outlook.com (2603:10b6:8:10f::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.19; Tue, 13 Sep 2022 07:54:16 +0000
Received: from DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::af) by DS7PR05CA0050.outlook.office365.com
 (2603:10b6:8:2f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.10 via Frontend
 Transport; Tue, 13 Sep 2022 07:54:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT004.mail.protection.outlook.com (10.13.172.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Tue, 13 Sep 2022 07:54:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 13 Sep
 2022 02:54:14 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 13 Sep 2022 02:54:13 -0500
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
X-Inumbo-ID: 45cbd9bb-3339-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzTaOjRDjv9YWHOi6Yx4TVBofJ8rs8rKJCE7BkgVf/e6H5DEj0lYNmNDB6KrSJ30OAfVQHejjhcGY17I/e+PzxmgXfKg8HjNI5uLYHSe0ljXIX2ghtVnYkGV47/VGGuvKmWPwREzgWjyFQxBJ6oqdX1VuNGqVdLSEPNnaYFcDBddgYeS24A7425LBJNeDrBQsqGaG1itrfNVbbVtnN8vU6qI9iFp9B/uPBADW/6yy4jLZxmLDveaO9Zf0mY3+c/EBUmd9babbaXp1lE/dmICsoIFCHHlME5y0y+b8dLq7a/sHheltgHZ48D0kUt5CY+FBQcpgc+qaKGNJ3MaNcq89w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiJ79U++0AcWuLpxbjDCIB1xyDR746SiRPXyj0e/xX8=;
 b=mq4dzxebfamloLTqGzMsLU/jjHK4Uip1fePmWqh41EyscgyGLuWpVWdlmYFB3YdcdjCOFB2NbOWNXw9wAIltgWm2SQmBmHmzgYX8yEboQ8vGsVGe5kVY2rGXni/0clJJOqTuKyUA4nXg+ahifQTN2OP/FH+hBQ3ky0JcDBftR/8mVLfU70nOPzJ0JFTBVZN3U4M3vCmqsd9chQ+J6fEAPo0Jw099SoW7MzfPEtVuOfpAtgaE76CPLcmaCwf8APkiER7xuI5XRD0KZsp1YCsDTLaSDZDRGOXuHyBL2/FVeJCye9fDER36i84PLpZuQPWWKlZD4ft8fGQuZqJTAqKUwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiJ79U++0AcWuLpxbjDCIB1xyDR746SiRPXyj0e/xX8=;
 b=3V/7ayVo7c0RsyuPuGpzT7LPY5Nv3cW3S0SGpWm97gp3/Hu/GqDzZYpxCCkkNhzvbw+NKNs5Ks8/BoU354mazbq7OZq1gbvY36499QaJjDWogqNVaIxUD5iSUOgU87qCm83kYFw02lgMLruBhPMfu7mqgqPkDvOq/V84BKVTB1A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <57721e49-1692-64ec-92b1-ce393b79e070@amd.com>
Date: Tue, 13 Sep 2022 09:54:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [ImageBuilder 2/2] Add support for lopper to generate partial dts
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>
References: <20220912115934.19552-1-michal.orzel@amd.com>
 <20220912115934.19552-3-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2209121758280.157835@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2209121758280.157835@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT004:EE_|DM4PR12MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d38a07-e7bd-4189-6618-08da955d2833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	swyQeszxxTijeZ/RdR7BltET0QxhT7jxw5fcd8EFVMrZYI0Ge4VYYQ7ncfhwFnsddLrYY974RpKTCgdcdqi1CTYZMPZlal+jafJA9Gc5ll8FLAHAucD2oWf8NDCvhLwmIW4JylgZf8a1dfDptHD9EOFx54tji8c3tHGR6e3/667vEWLV45X9WMfGF/z+iPUCxQBBsDwfxwhRqUjY5/JVQ1tUzPZLQtGASmiw7JilLmhb60poCAa79VKEQRYvadM8WTn8qgw0GNlBhR44ivI976iLnyul0aKvK/JJdeM5QaFp8NrnB0Z1urlVocb09E1cWtLg5aUiHVV1yaTki1cWfr3CB5J3HdsxyPVf87tWscHJLJufVx9e5f1SP06mBsCPA8BCBhC6zpmG12zCqQRFpzYYTB9xShvPYZlGPrTePMkF0n3V3xZGAkJqfPLFVdUeyjxmA8wUW6BWk4DoPIRrZOYiKJplZ9n2N6As2/8YHfJJyE+LBzuSn4VNj6BeXmCiz7/J19l0s4aVFa7lnDd7H8L1xGauzU3pWKLEQ4zxjE3QbEsFtgAEiEoWdUN80V/XR7fs+sNkFt3eZ0yG2iP/7lOp5mzrW44S0IBCaV0zKIdgQVzi+3p9aA2wUw9CoHsoRG80/8fPl3ikJjOioPvyDKo+h+HUPXtdzNTNKBmWGyvEzPVqegPgKKpmxMYTF3oPB+yDgUAds2A5HePp+fsFgpN9YdXyxymZiLYHD7FhT25qSIhrc1L0Fpjmqv1cl28fKqbz4l8672wkv1hEm452r2jT4ulpDk+vWp2goppvj7xsTIU5x+ucTE/IzXBDViJWN60aApEikorj2/bbLfncbEixwS92CuS4gmRtphzz1ouLDhSs0Q/uII6QOwlUNEUrJPTQQvbBPiQVoczd2PNqUg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199015)(46966006)(40470700004)(36840700001)(53546011)(6916009)(8936002)(81166007)(5660300002)(316002)(966005)(31696002)(83380400001)(45080400002)(82310400005)(186003)(16576012)(26005)(41300700001)(478600001)(2616005)(4326008)(8676002)(82740400003)(40460700003)(36756003)(356005)(36860700001)(86362001)(426003)(44832011)(336012)(31686004)(70586007)(47076005)(2906002)(70206006)(40480700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 07:54:16.4363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d38a07-e7bd-4189-6618-08da955d2833
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7549

Hi Stefano,

On 13/09/2022 03:13, Stefano Stabellini wrote:
> 
> On Mon, 12 Sep 2022, Michal Orzel wrote:
>> Currently ImageBuilder can compile and merge partial dts obtained from
>> a repository specified using PASSTHROUGH_DTS_REPO. With the recent
>> changes done in the lopper, we can use it to generate partial dts
>> automatically (to some extent as this is still an early support).
>>
>> Introduce LOPPER_PATH option to specify a path to a lopper.py script,
>> that if set, will invoke lopper to generate partial dts for the
>> passthrough devices specified in DOMU_PASSTHROUGH_PATHS.
>>
>> Introduce LOPPER_CMD option to specify custom command line arguments
>> (if needed) for lopper's extract assist.
>>
>> Example usage:
>> LOPPER_PATH="/home/user/lopper/lopper.py"
>> DOMU_PASSTHROUGH_PATHS[0]="/axi/spi@ff0f0000 /axi/serial@ff010000"
> 
> Is lopper.py this file?
> 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fdevicetree-org%2Flopper%2Fblob%2Fmaster%2Flopper.py&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Cb756682b3b0a460f5c3608da95252c7c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637986284138713501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=KShbbVjvB1vG26vUQL6py7edWylpoZ63n5BW11dxbmo%3D&amp;reserved=0
> 
> If so, it would be good to specify in the README that this is not just
> an arbitrary lopper.py script, but the main entry point of Lopper as a
> project. For instance:
> 
> ---
> Introduce LOPPER_PATH option to specify a path to a lopper.py script,
> the main script in the Lopper repository
> (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fdevicetree-org%2Flopper&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Cb756682b3b0a460f5c3608da95252c7c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637986284138713501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=vEh2VZz84MQiZJnKyGzGejJ7QKO%2FYENwg1v4XdF8PRk%3D&amp;reserved=0). If set, ....
> ---
> 
Sounds good. I will add this explanation.

> 
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  README.md                | 22 ++++++++++++--
>>  scripts/common           | 64 ++++++++++++++++++++++++++++++----------
>>  scripts/uboot-script-gen | 17 +++++++++--
>>  3 files changed, 83 insertions(+), 20 deletions(-)
>>
>> diff --git a/README.md b/README.md
>> index da9ba788a3bf..aaee0939b589 100644
>> --- a/README.md
>> +++ b/README.md
>> @@ -128,6 +128,19 @@ Where:
>>  - DT_OVERLAY[number] specifies the path to the hosts device tree overlays
>>    to be added at boot time in u-boot
>>
>> +- LOPPER_PATH specifies the path to lopper.py script. This is optional.
>> +  However, if this is specified, then DOMU_PASSTHROUGH_PATHS[number] need
>> +  to be specified. uboot-script-gen will invoke lopper to generate the partial
>> +  device trees which have been specified in DOMU_PASSTHROUGH_PATHS[number].
>> +  This option is currently in experimental state as the corresponding lopper
>> +  changes are still in an early support state.
>> +
>> +- LOPPER_CMD specifies the command line arguments for lopper's extract assist.
>> +  This is optional and only applicable when LOPPER_PATH is specified. Only to be
>> +  used to specify which nodes to include (using -i <node_name>) and which
>> +  nodes/properties to exclude (using -x <regex>). If not set at all, the default
>> +  one is used applicable for ZynqMP MPSoC boards.
>> +
>>  - NUM_DOMUS specifies how many Dom0-less DomUs to load
>>
>>  - DOMU_KERNEL[number] specifies the DomU kernel to use.
>> @@ -140,7 +153,7 @@ Where:
>>  - DOMU_PASSTHROUGH_PATHS[number] specifies the passthrough devices (
>>    separated by spaces). It adds "xen,passthrough" to the corresponding
>>    dtb nodes in xen device tree blob.
>> -  This option is valid in the following two cases:
>> +  This option is valid in the following cases:
>>
>>    1. When PASSTHROUGH_DTS_REPO is provided.
>>    With this option, the partial device trees (corresponding to the
>> @@ -149,7 +162,12 @@ Where:
>>    Note it assumes that the names of the partial device trees will match
>>    to the names of the devices specified here.
>>
>> -  2. When DOMU_NOBOOT[number] is provided. In this case, it will only
>> +  2. When LOPPER_PATH is provided.
>> +  With this option, the partial device trees (corresponding to the
>> +  passthrough devices) are generated by the lopper and then compiled and merged
>> +  by ImageBuilder to be used as DOMU[number] device tree blob.
>> +
>> +  3. When DOMU_NOBOOT[number] is provided. In this case, it will only
>>    add "xen,passthrough" as mentioned before.
>>
>>  - DOMU_PASSTHROUGH_DTB[number] specifies the passthrough device trees
>> diff --git a/scripts/common b/scripts/common
>> index ccad03d82b30..680c5090cd07 100644
>> --- a/scripts/common
>> +++ b/scripts/common
>> @@ -9,6 +9,9 @@
>>  # - NUM_DOMUS
>>  # - DOMU_PASSTHROUGH_PATHS
>>  # - DOMU_PASSTHROUGH_DTB
>> +# - LOPPER_PATH
>> +# - LOPPER_CMD
>> +# - DEVICE_TREE
>>
>>  tmp_files=()
>>  tmp_dirs=()
>> @@ -99,31 +102,41 @@ function compile_merge_partial_dts()
>>      local tmp
>>      local tmpdts
>>      local file
>> +    local node
>>      local i
>>      local j
>>
>> -    if [[ "$repo" =~ .*@.*:.* ]]
>> +    if test "$repo"
>>      then
>> -        tmp=`mktemp -d`
>> -        tmp_dirs+=($tmp)
>> -
>> -        echo "Cloning git repo \"$git_repo\""
>> -        git clone "$repo" $tmp
>> -        if test $? -ne 0
>> +        # Partial dts will be obtained from PASSTHROUGH_DTS_REPO
>> +        if [[ "$repo" =~ .*@.*:.* ]]
>>          then
>> -            echo "Error occurred while cloning \"$git_repo\""
>> -            return 1
>> -        fi
>> +            tmp=`mktemp -d`
>> +            tmp_dirs+=($tmp)
>>
>> -        repo=$tmp
>> -    fi
>> +            echo "Cloning git repo \"$git_repo\""
>> +            git clone "$repo" $tmp
>> +            if test $? -ne 0
>> +            then
>> +                echo "Error occurred while cloning \"$git_repo\""
>> +                return 1
>> +            fi
>>
>> -    if test -z "$dir"
>> -    then
>> -        dir="."
>> +            repo=$tmp
>> +        fi
>> +
>> +        if test -z "$dir"
>> +        then
>> +            dir="."
>> +        fi
>> +        partial_dts_dir="$repo"/"$dir"
>> +    else
>> +        # Partial dts will be generated by the lopper
>> +        tmp=`mktemp -d`
>> +        tmp_dirs+=($tmp)
> 
> setting tmp and tmp_dirs can be moved outside of the if
> 
Ok.

> 
>> +        partial_dts_dir="$tmp"
>>      fi
>>
>> -    partial_dts_dir="$repo"/"$dir"
>>      i=0
>>      while test $i -lt $NUM_DOMUS
>>      do
>> @@ -133,6 +146,25 @@ function compile_merge_partial_dts()
>>              return 1
>>          fi
>>
>> +        if test -z "$repo"
>> +        then
>> +            # Generate partial dts using lopper
>> +            for devpath in ${DOMU_PASSTHROUGH_PATHS[$i]}
>> +            do
>> +                node=${devpath##*/}
>> +                file="$partial_dts_dir"/"$node".dts
> 
> This is a minor NIT. As we do below:
> 
>             file=${devpath##*/}
>             file="$partial_dts_dir"/"$file".dts
> 
> Can you change the code below to use node and file as you do here for
> consistency?
> 
Sure, I will modify them.

~Michal

