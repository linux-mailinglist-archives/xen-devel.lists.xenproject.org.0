Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016D55B5F7E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 19:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405968.648390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXnTT-0002y8-L3; Mon, 12 Sep 2022 17:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405968.648390; Mon, 12 Sep 2022 17:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXnTT-0002v8-Hb; Mon, 12 Sep 2022 17:43:59 +0000
Received: by outflank-mailman (input) for mailman id 405968;
 Mon, 12 Sep 2022 17:43:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Y9l=ZP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oXnTR-0002um-MG
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 17:43:58 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78530616-32c2-11ed-a31c-8f8a9ae3403f;
 Mon, 12 Sep 2022 19:43:55 +0200 (CEST)
Received: from BN9PR03CA0619.namprd03.prod.outlook.com (2603:10b6:408:106::24)
 by BL1PR12MB5048.namprd12.prod.outlook.com (2603:10b6:208:30a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18; Mon, 12 Sep
 2022 17:43:52 +0000
Received: from BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::63) by BN9PR03CA0619.outlook.office365.com
 (2603:10b6:408:106::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Mon, 12 Sep 2022 17:43:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT052.mail.protection.outlook.com (10.13.177.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Mon, 12 Sep 2022 17:43:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 12 Sep
 2022 12:43:51 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 12 Sep 2022 12:43:50 -0500
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
X-Inumbo-ID: 78530616-32c2-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBlPLHXHJHrl9EBpprXzeetoJn6S8Xj08f3xhQ+Cw35p/+FosKK5fnUu6sX0VXsZsOulI7YGK0IYLoZYSkXq8HqUdxRwrJKRaxA5vMa2WF2K0CgX41Vu8Lpr1qK8ztEbZcK6xL1zP0Zhk8MNUPSQf8IBVQvcxD5ZuDA3Sig1d/OrIiw9Z8s4sm24Ld3TqDI+IZPYPIjYrbe4s60OaSINh3/ZqfttKtGj4X02fc5x96Sf7A4R6eGp5fvERznb154pFkEg1hSSYyxog7LhyGcBnjhfIayolHEqpsbQBPXx1phwhxgd3KSrcxrYa6OGBTQgEjjuldioIcZ9H2ZhDSWnxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOYYOT3vSza1B0X2L7tBDBT9w17kawbMA9QA06xg/KQ=;
 b=agYKtIA5jJ5ADBDUvN2ZqLdRzdS2oaDdokGnWsQ1XxBYm6/+sEGCeS0nVMm9eAemVBhZUvpv19i1r7xrlIYJdGFdKpm1LVClEQOnOKBnzSTe/KL1qcZpdsiS82k1MCWBXebhcyRrZ4dmoaMHz1oLuNks5g9ZdL3H521wzDZ9j+vhY6v9VbqO7VH1wKDt2sZU/IjHl0Y+Wwhejvrvznzne4GWcgOB14N3hm3OxBVHBfCVjy0JqQ8vXU3PEx9dY/fvKf0weY1/8bj05DIhv+cy4E+fwmhBC1FD+3bWZFcz1Kmf6utoj0r/C9JfM8u1dWHlq2Nuuf605T74ixci/oe58g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOYYOT3vSza1B0X2L7tBDBT9w17kawbMA9QA06xg/KQ=;
 b=aXeH/+FJWakms0fp3pVb3nUjVRQB26DEsp4v9kXTbjwTNRyl5NuICCj/sAvjH2nJRNnV0y5xpjvsis7/ltKJ/LVT6WM2TrtIUw2AuyOZ7HLnaiFn+dwThU9Trs8KF/3zFgY3mnq6vTtnzZJRN+HBZwlOrOVyTbMsblvIDiVY94g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a77584d8-d10b-d2fd-b070-0e37269d1503@amd.com>
Date: Mon, 12 Sep 2022 19:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [ImageBuilder 2/2] Add support for lopper to generate partial dts
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>
References: <20220912115934.19552-1-michal.orzel@amd.com>
 <20220912115934.19552-3-michal.orzel@amd.com>
 <276bd45d-7ab8-fc5d-a065-df6188b4f42f@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <276bd45d-7ab8-fc5d-a065-df6188b4f42f@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT052:EE_|BL1PR12MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: d658c294-0dfb-4669-8e55-08da94e65b1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AvYVTJfYCLYfVFnxgYl2jo28SjmdEVgrYy314BUoTmcDjxNh0tGTQMpviMEOtHvHglo5ChPiRPUPJUTtX2X66koOBTA/A1CNtgyb5lD9xPBXjujOZohgm1irqqNjGAg8W87S7RQPTZ+F+waVk4Z8H2107pX25K0CQcWiRRBPXDl4hTV+RpbZOCN4Gjef/MrOevLUNYo6rKCkCCigTkJ6fvyISGcvNOffF48IhxZFktyaAXsavz3/GOKn6w2aQmC++Y/sGYj8RX/lrdd2Wi3At7D3ZD+KKGQ23JtLQAtLpsctJeR8Az3Y05ulvJRZOCjOYQLlKX4EjnF3XCtYgjNbNKk0FzzutxIewXyAHjMsVEF4dTmyZZz6ieWi950QPeCAYKawYSi2TPIf7h6El180B04mmWYMcOjjh7GOdAKKTKUjchoPp5NotQMiS9CxeeesfCtdqYUU+lzTl1KjDXkbjKN4QGbUR5uvnjbjM8/7Z2fXkCC9/D39v17unDv4/7RADMbPZ6cpWNapPuKyWeS/XS58+ptBQZJMdMAh/S5qnPnntf0LWITIBsIOEHPKGoHJAlkrXg9PsIBd7Z/xpFG4Do1+YyT/gHcyHAam0kw6WTKzztg+ngN047EwJer2CR2AI+J/fpTGcyX+OfnrF+pYg3MmUty29Ofuhj6s3kZW2ZqgObnsRSI0okV1CuUERc9/qD3j+RMcqkS6150OdgWUemT67KOJI/68wzOA0OXFYIFyBjKQq5+QCIIVEz3/ATPesIYdRUDkpXCNv8A3A7AtE2qYjg3/u5sRs+D6X2mrDU2OdpEciDFdAU7k91sbZzmPkPslMzu4BzIUVy3uv+RxkD5ypYjJMMZkDYJhd71wCAk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(46966006)(36840700001)(40470700004)(16576012)(316002)(31696002)(82310400005)(40480700001)(81166007)(41300700001)(26005)(36860700001)(110136005)(8676002)(86362001)(70586007)(36756003)(53546011)(356005)(336012)(478600001)(2616005)(47076005)(186003)(44832011)(40460700003)(8936002)(31686004)(426003)(83380400001)(4326008)(70206006)(82740400003)(5660300002)(2906002)(21314003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 17:43:51.7643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d658c294-0dfb-4669-8e55-08da94e65b1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5048

Hi Ayan,

On 12/09/2022 18:41, Ayan Kumar Halder wrote:
> Hi Michal,
> 
> On 12/09/2022 12:59, Michal Orzel wrote:
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
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>   README.md                | 22 ++++++++++++--
>>   scripts/common           | 64 ++++++++++++++++++++++++++++++----------
>>   scripts/uboot-script-gen | 17 +++++++++--
>>   3 files changed, 83 insertions(+), 20 deletions(-)
>>
>> diff --git a/README.md b/README.md
>> index da9ba788a3bf..aaee0939b589 100644
>> --- a/README.md
>> +++ b/README.md
>> @@ -128,6 +128,19 @@ Where:
>>   - DT_OVERLAY[number] specifies the path to the hosts device tree overlays
>>     to be added at boot time in u-boot
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
> 
> You are using some more arguments (besides -x and -i) :-
> 
> --permissive -f
> -- extract -t
> -- extract-xen -t $node -o
These ones are fixed and do not differ depending on the type of device or board.
That is why LOPPER_CMD is used only to allow users to specify what can be required
to support a new device (usually not necessary) or a new board.

> 
> It will be good to have some explaination for these. See my comments below.
> 
We don't seem to do it in general (see all the commands used by disk_image) so I think
we should only describe what is available to the user. Otherwise we would need to be
consistent and apply this rule to all the other places.

>> +
>>   - NUM_DOMUS specifies how many Dom0-less DomUs to load
>>   
>>   - DOMU_KERNEL[number] specifies the DomU kernel to use.
>> @@ -140,7 +153,7 @@ Where:
>>   - DOMU_PASSTHROUGH_PATHS[number] specifies the passthrough devices (
>>     separated by spaces). It adds "xen,passthrough" to the corresponding
>>     dtb nodes in xen device tree blob.
>> -  This option is valid in the following two cases:
>> +  This option is valid in the following cases:
>>   
>>     1. When PASSTHROUGH_DTS_REPO is provided.
>>     With this option, the partial device trees (corresponding to the
>> @@ -149,7 +162,12 @@ Where:
>>     Note it assumes that the names of the partial device trees will match
>>     to the names of the devices specified here.
>>   
>> -  2. When DOMU_NOBOOT[number] is provided. In this case, it will only
>> +  2. When LOPPER_PATH is provided.
>> +  With this option, the partial device trees (corresponding to the
>> +  passthrough devices) are generated by the lopper and then compiled and merged
>> +  by ImageBuilder to be used as DOMU[number] device tree blob.
>> +
>> +  3. When DOMU_NOBOOT[number] is provided. In this case, it will only
>>     add "xen,passthrough" as mentioned before.
>>   
>>   - DOMU_PASSTHROUGH_DTB[number] specifies the passthrough device trees
>> diff --git a/scripts/common b/scripts/common
>> index ccad03d82b30..680c5090cd07 100644
>> --- a/scripts/common
>> +++ b/scripts/common
>> @@ -9,6 +9,9 @@
>>   # - NUM_DOMUS
>>   # - DOMU_PASSTHROUGH_PATHS
>>   # - DOMU_PASSTHROUGH_DTB
>> +# - LOPPER_PATH
>> +# - LOPPER_CMD
>> +# - DEVICE_TREE
>>   
>>   tmp_files=()
>>   tmp_dirs=()
>> @@ -99,31 +102,41 @@ function compile_merge_partial_dts()
>>       local tmp
>>       local tmpdts
>>       local file
>> +    local node
>>       local i
>>       local j
>>   
>> -    if [[ "$repo" =~ .*@.*:.* ]]
>> +    if test "$repo"
>>       then
>> -        tmp=`mktemp -d`
>> -        tmp_dirs+=($tmp)
>> -
>> -        echo "Cloning git repo \"$git_repo\""
>> -        git clone "$repo" $tmp
>> -        if test $? -ne 0
>> +        # Partial dts will be obtained from PASSTHROUGH_DTS_REPO
>> +        if [[ "$repo" =~ .*@.*:.* ]]
>>           then
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
>> +        partial_dts_dir="$tmp"
>>       fi
>>   
>> -    partial_dts_dir="$repo"/"$dir"
>>       i=0
>>       while test $i -lt $NUM_DOMUS
>>       do
>> @@ -133,6 +146,25 @@ function compile_merge_partial_dts()
>>               return 1
>>           fi
>>   
>> +        if test -z "$repo"
>> +        then
>> +            # Generate partial dts using lopper
>> +            for devpath in ${DOMU_PASSTHROUGH_PATHS[$i]}
>> +            do
>> +                node=${devpath##*/}
>> +                file="$partial_dts_dir"/"$node".dts
>> +
>> +                $LOPPER_PATH --permissive -f $DEVICE_TREE \
>> +                -- extract -t $devpath $LOPPER_CMD \
>> +                -- extract-xen -t $node -o $file
> See below comment. Applies here as well.
>> +
>> +                if test $? -ne 0
>> +                then
>> +                    return 1
>> +                fi
>> +            done
>> +        fi
>> +
>>           sanity_check_partial_dts "${DOMU_PASSTHROUGH_PATHS[$i]}" "$partial_dts_dir"
>>           if test $? -ne 0
>>           then
>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>> index 1f8ab5ffd193..84a68d6bd0b0 100755
>> --- a/scripts/uboot-script-gen
>> +++ b/scripts/uboot-script-gen
>> @@ -1138,10 +1138,23 @@ fi
>>   # tftp or move the files to a partition
>>   cd "$uboot_dir"
>>   
>> -if test "$PASSTHROUGH_DTS_REPO"
>> +# If both PASSTHROUGH_DTS_REPO and LOPPER_PATH options are specified,
>> +# the former takes precedence because the partial device trees are already
>> +# created (probably tested), hence the reliability is higher than using lopper.
>> +if test "$PASSTHROUGH_DTS_REPO" || test "$LOPPER_PATH"
>>   then
>>       output_dir=`mktemp -d "partial-dtbs-XXX"`
>> -    compile_merge_partial_dts $output_dir "$PASSTHROUGH_DTS_REPO"
>> +    if test "$PASSTHROUGH_DTS_REPO"
>> +    then
>> +        compile_merge_partial_dts $output_dir "$PASSTHROUGH_DTS_REPO"
>> +    else
>> +        if test -z "$LOPPER_CMD"
>> +        then
>> +            # Default for ZynqMP MPSoC
>> +            LOPPER_CMD="-i zynqmp-firmware -x interrupt-controller -x pinctrl -x power-domains -x resets -x current-speed"
> 
> It will be very useful, if you could provide the link to Lopper's README 
> which explains the arguments used here, as a comment.
> 
This lopper feature is still in an early state, hence there is no such information
in the README. I described everything a user can change (like -i and -x option) using the information
from the extract's help. 

> Even better if you can provide some explaination (as a comment) to what 
> the command intends to do here
> 
> - Ayan
> 
>> +        fi
>> +        compile_merge_partial_dts $output_dir
>> +    fi
>>       if test $? -ne 0
>>       then
>>           # Remove the output dir holding the partial dtbs in case of any error

~Michal

