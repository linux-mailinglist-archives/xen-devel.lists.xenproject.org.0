Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22145B6B99
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 12:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406280.648663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY38A-0005X2-Nk; Tue, 13 Sep 2022 10:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406280.648663; Tue, 13 Sep 2022 10:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY38A-0005UI-KX; Tue, 13 Sep 2022 10:27:02 +0000
Received: by outflank-mailman (input) for mailman id 406280;
 Tue, 13 Sep 2022 10:27:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWZA=ZQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oY388-0005UC-VT
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 10:27:01 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b569861-334e-11ed-9761-273f2230c3a0;
 Tue, 13 Sep 2022 12:24:22 +0200 (CEST)
Received: from DS7PR03CA0286.namprd03.prod.outlook.com (2603:10b6:5:3ad::21)
 by DM6PR12MB4482.namprd12.prod.outlook.com (2603:10b6:5:2a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Tue, 13 Sep
 2022 10:26:55 +0000
Received: from DM6NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::73) by DS7PR03CA0286.outlook.office365.com
 (2603:10b6:5:3ad::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22 via Frontend
 Transport; Tue, 13 Sep 2022 10:26:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT078.mail.protection.outlook.com (10.13.173.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Tue, 13 Sep 2022 10:26:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 13 Sep
 2022 05:26:54 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 13 Sep 2022 05:26:54 -0500
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
X-Inumbo-ID: 3b569861-334e-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcPSFlomQaKnAr/cgy9Y0a7Ta5RKcPf8LteiaaCJv55iFIEnmxov1vdjcW6cAq5AvF49M035S9n7MDGn0obMP4xlf2NT/ZCggVdZKb++XjzsHkbp5kMxRwiBk4fVtgG9sKDoxMFSYxz3Oq4CvdHbqlLid0hgGroW1jWFOppZ0FWlFRUJoPM9KJik3/DjfQYGSLy6uDdPs7EWkQQe1sN6LeXXDaQwMZY1qPagqC01Pu22gzLO71b87pCZJ/Xg/og1Q4YSvmWRYemotffSFgfGieK8TS3bzlHdWLI4ZK0h7t7jCe0xVBIqR2ZWXTL+62Zzy0b3IL9TmRLeR4Bp9cptmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKIF4aseAT4bj9zk56AyTjkrKzQ/p+1kM91bR5dP4NU=;
 b=CqMeIRo3/YW6k+LiGPrw8uWnQejhiQ+0LCsRIkHbA8naj6d58JwW3keAE0yXbOa1Oz7f6GisIpj/rwF1+HrgONTTGAaF58LNFGS1HRJLtLZoqGRm1oI5K38UAomdHvQC74oYJUoKcDRY1IiMIB/LhD5FlpG5kxKDF0B12Un34YMJeafAmwQtEdb1RQgRWr2knEdO0OQ1NxYRApiVI6/41MVSSQd4Dx2S2Prlm1mXL9qsrehWnHtLELIVF7P7uvjyXAlsqhrD4P6P7q0x0G5pDFBVvSGosdW3lEGTlV1o6fzcDhr/G70omVL7CxRIK3arG6wRC/cHxZp5o3JggqX79g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKIF4aseAT4bj9zk56AyTjkrKzQ/p+1kM91bR5dP4NU=;
 b=vketUcggaWvRADyHcdcExbbyEAFWC9jFfGCfYKLT/ZNkZY2BSK6MBdX9JQIJrcNy+3J2eukUI/ZO80S5PpUGZepLTsdf+5o0NUZew8YBF6vbw1k7/lKtfBgFt3uPdC8XbaCfPj+vctPL6Q8kYUVzc0shMi/yjaB2igr0jJjLID8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7b8deb6d-3638-c025-d7b3-8c0211497fee@amd.com>
Date: Tue, 13 Sep 2022 12:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [ImageBuilder 2/2] Add support for lopper to generate partial dts
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>
References: <20220912115934.19552-1-michal.orzel@amd.com>
 <20220912115934.19552-3-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2209121758280.157835@ubuntu-linux-20-04-desktop>
 <57721e49-1692-64ec-92b1-ce393b79e070@amd.com>
In-Reply-To: <57721e49-1692-64ec-92b1-ce393b79e070@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT078:EE_|DM6PR12MB4482:EE_
X-MS-Office365-Filtering-Correlation-Id: d9787f68-2b88-420e-291c-08da95727b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AJT/nfx92GRRPBJbiUmpCFdIPx6soUgEdeYp/C7u8JDfGglnjVZUADOmPSJnTp21HpcweCEgcRSx2EDvcSYNOup8vJwpSBZv4I4sZeJdnM3fjDNUW5tMLf4gdZsiUl0EIY8n04Eba9EL8NGMAwyaCYoSl6OWpmLxznxDa3L+nR0jd/Snl9T6tX8OdbCWE4DU7gFEgX2pR1CGALvDvpqRIIns/sOndoWYIhXlB7pWLCEbHKeeuBckz+e235sm71DvV3MQh78q8EtA2vNDqUzQ5zoSsI76XxgVwEXhRbYnkkKDjY8TtUkzYpsOv3b+bCqfsnHu8/IxBEeQ/L210+3mXTbLSfFBCZ4hEdBU8ExN/k+MvzVapjqgsiMZfg/8ee7SwkVDlsz+ampCJVDWbx7xR2nYWRTT3gVuzhth/7VkbmPN02SL8A4qK/UgzZES/q/dYyvVe7Yxw1zkVPtvk76zNHkRdZ7wLPc8CtfJx3R3ltyEGxuyB5O5BcHkx6MWmwD713DyJRcwOZ/i2QYCZ6meXtbXARKjNtXRZs/7lzOHzxuouOovVB0mJTiJLuqpOC4Y5CbU8G/p+uzNhcFTwfUkIjQLd6CmBxJI4MVKp3Xz1BeL7Gd1wfOdx1H9Sa2PxMR8IElY8OX3NWWYSfc+PJcrV3F1gADp3Xir240fheqfOE0OyczYAbZ0dydgIX3zHc2AN095mY677zGdoMtxOn2TQVZASEg14laWkWK3DJycxdS93cQeoVkqDu/Wm7h1XSiONN3+Ook7CdDZt2w5xxS2yDuN3NGwAXyiJPiajiNxE6ohtQBE4RK55C1SpeUVsAnlOFn4T7fO9pNl1YWwb3KiOkw6IiEYp07uG1/1+FikQS1HVU6GgOwzo9/DZrrWEAVD1qaeII2YRCCMoz1VkGkbAQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(40470700004)(36840700001)(46966006)(82740400003)(356005)(86362001)(31696002)(83380400001)(2616005)(966005)(40480700001)(41300700001)(478600001)(316002)(16576012)(81166007)(2906002)(40460700003)(8676002)(31686004)(70206006)(4326008)(8936002)(36860700001)(36756003)(186003)(5660300002)(53546011)(426003)(70586007)(26005)(82310400005)(45080400002)(336012)(6916009)(47076005)(44832011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 10:26:55.4512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9787f68-2b88-420e-291c-08da95727b66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4482



On 13/09/2022 09:54, Michal Orzel wrote:
> 
> Hi Stefano,
> 
> On 13/09/2022 03:13, Stefano Stabellini wrote:
>>
>> On Mon, 12 Sep 2022, Michal Orzel wrote:
>>> Currently ImageBuilder can compile and merge partial dts obtained from
>>> a repository specified using PASSTHROUGH_DTS_REPO. With the recent
>>> changes done in the lopper, we can use it to generate partial dts
>>> automatically (to some extent as this is still an early support).
>>>
>>> Introduce LOPPER_PATH option to specify a path to a lopper.py script,
>>> that if set, will invoke lopper to generate partial dts for the
>>> passthrough devices specified in DOMU_PASSTHROUGH_PATHS.
>>>
>>> Introduce LOPPER_CMD option to specify custom command line arguments
>>> (if needed) for lopper's extract assist.
>>>
>>> Example usage:
>>> LOPPER_PATH="/home/user/lopper/lopper.py"
>>> DOMU_PASSTHROUGH_PATHS[0]="/axi/spi@ff0f0000 /axi/serial@ff010000"
>>
>> Is lopper.py this file?
>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fdevicetree-org%2Flopper%2Fblob%2Fmaster%2Flopper.py&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Ca7d4f0cc1c07424da8ba08da955d2fcc%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637986524721374780%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=oz5an1eISNbs6LoX3lE90RR%2FnYTX7ikZXw%2Fl57HlHV8%3D&amp;reserved=0
>>
>> If so, it would be good to specify in the README that this is not just
>> an arbitrary lopper.py script, but the main entry point of Lopper as a
>> project. For instance:
>>
>> ---
>> Introduce LOPPER_PATH option to specify a path to a lopper.py script,
>> the main script in the Lopper repository
>> (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fdevicetree-org%2Flopper&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Ca7d4f0cc1c07424da8ba08da955d2fcc%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637986524721374780%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=6ScZeGSMsX4MGgbOEi6I%2FDvkGNPlbVvBeSKQwexTHGA%3D&amp;reserved=0). If set, ....
>> ---
>>
> Sounds good. I will add this explanation.
> 
>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>>  README.md                | 22 ++++++++++++--
>>>  scripts/common           | 64 ++++++++++++++++++++++++++++++----------
>>>  scripts/uboot-script-gen | 17 +++++++++--
>>>  3 files changed, 83 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/README.md b/README.md
>>> index da9ba788a3bf..aaee0939b589 100644
>>> --- a/README.md
>>> +++ b/README.md
>>> @@ -128,6 +128,19 @@ Where:
>>>  - DT_OVERLAY[number] specifies the path to the hosts device tree overlays
>>>    to be added at boot time in u-boot
>>>
>>> +- LOPPER_PATH specifies the path to lopper.py script. This is optional.
>>> +  However, if this is specified, then DOMU_PASSTHROUGH_PATHS[number] need
>>> +  to be specified. uboot-script-gen will invoke lopper to generate the partial
>>> +  device trees which have been specified in DOMU_PASSTHROUGH_PATHS[number].
>>> +  This option is currently in experimental state as the corresponding lopper
>>> +  changes are still in an early support state.
>>> +
>>> +- LOPPER_CMD specifies the command line arguments for lopper's extract assist.
>>> +  This is optional and only applicable when LOPPER_PATH is specified. Only to be
>>> +  used to specify which nodes to include (using -i <node_name>) and which
>>> +  nodes/properties to exclude (using -x <regex>). If not set at all, the default
>>> +  one is used applicable for ZynqMP MPSoC boards.
>>> +
>>>  - NUM_DOMUS specifies how many Dom0-less DomUs to load
>>>
>>>  - DOMU_KERNEL[number] specifies the DomU kernel to use.
>>> @@ -140,7 +153,7 @@ Where:
>>>  - DOMU_PASSTHROUGH_PATHS[number] specifies the passthrough devices (
>>>    separated by spaces). It adds "xen,passthrough" to the corresponding
>>>    dtb nodes in xen device tree blob.
>>> -  This option is valid in the following two cases:
>>> +  This option is valid in the following cases:
>>>
>>>    1. When PASSTHROUGH_DTS_REPO is provided.
>>>    With this option, the partial device trees (corresponding to the
>>> @@ -149,7 +162,12 @@ Where:
>>>    Note it assumes that the names of the partial device trees will match
>>>    to the names of the devices specified here.
>>>
>>> -  2. When DOMU_NOBOOT[number] is provided. In this case, it will only
>>> +  2. When LOPPER_PATH is provided.
>>> +  With this option, the partial device trees (corresponding to the
>>> +  passthrough devices) are generated by the lopper and then compiled and merged
>>> +  by ImageBuilder to be used as DOMU[number] device tree blob.
>>> +
>>> +  3. When DOMU_NOBOOT[number] is provided. In this case, it will only
>>>    add "xen,passthrough" as mentioned before.
>>>
>>>  - DOMU_PASSTHROUGH_DTB[number] specifies the passthrough device trees
>>> diff --git a/scripts/common b/scripts/common
>>> index ccad03d82b30..680c5090cd07 100644
>>> --- a/scripts/common
>>> +++ b/scripts/common
>>> @@ -9,6 +9,9 @@
>>>  # - NUM_DOMUS
>>>  # - DOMU_PASSTHROUGH_PATHS
>>>  # - DOMU_PASSTHROUGH_DTB
>>> +# - LOPPER_PATH
>>> +# - LOPPER_CMD
>>> +# - DEVICE_TREE
>>>
>>>  tmp_files=()
>>>  tmp_dirs=()
>>> @@ -99,31 +102,41 @@ function compile_merge_partial_dts()
>>>      local tmp
>>>      local tmpdts
>>>      local file
>>> +    local node
>>>      local i
>>>      local j
>>>
>>> -    if [[ "$repo" =~ .*@.*:.* ]]
>>> +    if test "$repo"
>>>      then
>>> -        tmp=`mktemp -d`
>>> -        tmp_dirs+=($tmp)
>>> -
>>> -        echo "Cloning git repo \"$git_repo\""
>>> -        git clone "$repo" $tmp
>>> -        if test $? -ne 0
>>> +        # Partial dts will be obtained from PASSTHROUGH_DTS_REPO
>>> +        if [[ "$repo" =~ .*@.*:.* ]]
>>>          then
>>> -            echo "Error occurred while cloning \"$git_repo\""
>>> -            return 1
>>> -        fi
>>> +            tmp=`mktemp -d`
>>> +            tmp_dirs+=($tmp)
>>>
>>> -        repo=$tmp
>>> -    fi
>>> +            echo "Cloning git repo \"$git_repo\""
>>> +            git clone "$repo" $tmp
>>> +            if test $? -ne 0
>>> +            then
>>> +                echo "Error occurred while cloning \"$git_repo\""
>>> +                return 1
>>> +            fi
>>>
>>> -    if test -z "$dir"
>>> -    then
>>> -        dir="."
>>> +            repo=$tmp
>>> +        fi
>>> +
>>> +        if test -z "$dir"
>>> +        then
>>> +            dir="."
>>> +        fi
>>> +        partial_dts_dir="$repo"/"$dir"
>>> +    else
>>> +        # Partial dts will be generated by the lopper
>>> +        tmp=`mktemp -d`
>>> +        tmp_dirs+=($tmp)
>>
>> setting tmp and tmp_dirs can be moved outside of the if
>>
> Ok.
> 
Actually, these cannot be moved outside of the if because we have
3 possibilities and we need to create tmp dir only in 2 of them.
1) partial dts stored in repository - tmp needed
2) partial dts stored in a local dir - tmp not needed
3) partial dts will be generated by lopper - tmp needed

Moving the tmp creation at the top of if would result in creating redundant tmp
for second case. So it should stay as it is.

~Michal

