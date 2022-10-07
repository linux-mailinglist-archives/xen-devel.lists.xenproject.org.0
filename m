Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C8A5F7506
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 10:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417443.662157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogiIK-00047H-7b; Fri, 07 Oct 2022 08:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417443.662157; Fri, 07 Oct 2022 08:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogiIK-00044x-4A; Fri, 07 Oct 2022 08:01:20 +0000
Received: by outflank-mailman (input) for mailman id 417443;
 Fri, 07 Oct 2022 08:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lE99=2I=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ogiII-00044r-PN
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 08:01:18 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34a56e08-4616-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 10:01:16 +0200 (CEST)
Received: from BN8PR15CA0059.namprd15.prod.outlook.com (2603:10b6:408:80::36)
 by MN0PR12MB5857.namprd12.prod.outlook.com (2603:10b6:208:378::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.36; Fri, 7 Oct
 2022 08:01:05 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::dd) by BN8PR15CA0059.outlook.office365.com
 (2603:10b6:408:80::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.39 via Frontend
 Transport; Fri, 7 Oct 2022 08:01:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Fri, 7 Oct 2022 08:01:05 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 7 Oct
 2022 03:00:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 7 Oct
 2022 01:00:42 -0700
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 7 Oct 2022 03:00:41 -0500
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
X-Inumbo-ID: 34a56e08-4616-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOe4djQ77krgCI/6Vr3D6Jf7oyDKeNj0djea7DG/IuKLhN1NncKCROknvoDQJiq1qrG/FATL9mxTdbBHB750MGBHiDclyECmt4dLpyAlOffvouPApwUUccbTQzId5YaYBdVZqm7bPX6aFSERcDp4Bifkl2Q+IRDv1YieuUmBw80ZX4y6Pq8ja8zt4Lfn7r+zRLJnJ68p1PTfRBFWFw0dSdXvMKp2tD4BICylhEPWd3+UjfZREnMZ/09OxIk+28AXHxMQFhPtM9Ey3roDSCC8wv8pMHo6hCfXl6ahfXPmK/TlLvxzfNWwWbBudr86kaGELHOWvlgSAlUKI1f2Jyhrqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJCPZ7ytrc5rQ2EA8F20/nl5g5C/rc9PD/Uty/N0zR4=;
 b=EYyk3XF+1dobY69nVJMTlF9slPFFxl9g9+N5a6smlp1RCndKFIRRnkWlEIWSSFlwuQLL+okqlj7c78Yca7bhmKO72yR5V68xePWYITI4K341J6z3PkXHkOBBj/cO545UzQ+sWhuINjC1fm7tPY+I2q6hKtQCBYZBJVLe/EzUHxIb1stBqHqMA9am6TuwFWzDppHRQT9H5FbcEGSK8tusNurx+nHEVs57lCxXIkYv8xjYdj+q9/dl7LOEydyFphfKpSF782yDBiBXm0S3bUU9RHdyA4jw+i/hjMcuNbwSNoG7WS0D8CGgRFrWpRBjc5r8Zys6jaNVeqeK/8tnkM9RhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJCPZ7ytrc5rQ2EA8F20/nl5g5C/rc9PD/Uty/N0zR4=;
 b=BogzMkfhz7FJ0rzRUVeLutG9XFndRafAjX9DpUNgTT3M9upCecJ6A9bzhBJGdBzOkZGFOkrtboWmqxiHuDs7S3Qpaw0HThgT/YJ9jYB4z/v4CaqIOEdZj77fVZ/F7jZFQhK5iYNHtzSJ+V61mICXmriyvrfwYJSG9AEAFnvmgkM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <25626565-ba7d-265b-38f5-003b0b504d67@amd.com>
Date: Fri, 7 Oct 2022 10:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] ImageBuilder: Add support for 64-bit addresses
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <stefano.stabellini@amd.com>, <xen-devel@lists.xenproject.org>
References: <20221006102035.16281-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2210061349110.3690179@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2210061349110.3690179@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT051:EE_|MN0PR12MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f0ec7f-8f04-462b-477c-08daa83a1600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eDecsE7+ksF0/W197gLqihcrjYrW0EZuB4xG9UtZceN68xHL6wmeQnF51Xa0lGyLaKVLs25nRw9ld9/7Hdjr27EPDamBSdMG3CzJmB1Mlhsa/mduL66vOKMMjlDdPTBhFKKMoFEoVk//kfqQFGdGMYhoQRMSfb9pIEBLIcIPYHLLvE6INASQNyo3+lM05SxAsZ6EHApBHnkdwcpQwzkzIwol3h0TWuLMDqp78bDCTUxWuGoWpW9WMSye1QULGLpOsnDUWPWutZXMGWd4pDf+088aEWBQF37PbCykPeZ6OqAQv5Xh71D+DT0/f+rcutDQhEYvctOeD1SySMrkJDMWkcR/dOa09pJjtOSAfpn3lAJIg4zgxGWcRt44PogMYaVLaz9sFVKnUcHiNA6s3LNpeOM34Heglr8H5wN5+yZyvPBKpnzVp80sZmh/e6q9N4aX/uEfeyWQOr1TbceAYb5QUA/XXI81ohtHKPlmum+9BMDpsY3KwgjGBYto2Je6zVdVZmxrnKu+YkfRlhIv+TUZRXz6j9Dq7Gx8TtHc5LK4OqnAK4SzpUgBcWloCOC8FJ11gfLhz+4823sFRUZaPdPLAgN+a0nNfN17vTc0nOZH7Da/vZhWsYpSSHlKX6PTDQ9iW+AWL7rIfzIxdGlxA62TOD+bYw3dGqSsMltxNr0AxNN3mJzqI8eGb4DWoLGdhN0y0QlKa/ClD2tEWv7tt4Y0shHdJPhxz6lCawrQx1T8A9ao+DFKodySOrxdkHWE9Cy70WUaQInta/bxQInqItfLFIuGUnrYqDKzGy6f31zOMPkwin5vQ9Wpcxo32AKzOwqW1u5EdDrVowzq9AWxP+tNMQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(44832011)(31686004)(5660300002)(8936002)(40480700001)(41300700001)(2906002)(4326008)(70206006)(53546011)(40460700003)(356005)(478600001)(36756003)(81166007)(70586007)(8676002)(26005)(82740400003)(336012)(316002)(83380400001)(47076005)(86362001)(6916009)(426003)(16576012)(186003)(31696002)(36860700001)(54906003)(2616005)(82310400005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 08:01:05.6251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f0ec7f-8f04-462b-477c-08daa83a1600
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5857

Hi Stefano,

On 07/10/2022 00:34, Stefano Stabellini wrote:
> 
> 
> +xen-devel
> 
> On Thu, 6 Oct 2022, Michal Orzel wrote:
>> At the moment, ImageBuilder assumes that all addresses/sizes are
>> 32-bit max. It sets #{address,size}-cells to 0x2 and puts 0x0 as the
>> value for the first cell. Because of that, we cannot specify MEMORY_START
>> and MEMORY_END to be above 32-bits (e.g. to place the images in the
>> upper memory bank).
>>
>> Add support to properly handle 64-bit addresses:
>>  - add function split_into_halves to split the value passed as a first
>>    argument into upper and lower halves. These are then set as values for
>>    variables passed respetively as the second and third argument,
>>  - whenever there is a variable storing the full 64-bit number with
>>    "addr" or "size" in name, introduce two additional variables with
>>    "addr1,addr2"/"size1,size2" in name to store the halves. These are
>>    then used to properly set cells.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>
>> ---
>>  scripts/uboot-script-gen | 60 +++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 53 insertions(+), 7 deletions(-)
>>
>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>> index 16269f02f1e7..4c6525a910f3 100755
>> --- a/scripts/uboot-script-gen
>> +++ b/scripts/uboot-script-gen
>> @@ -25,6 +25,14 @@ function dt_mknode()
>>      fi
>>  }
>>
>> +# Usage:
>> +# split_into_halves <value> <variable_to_store_upper> <variable_to_store_lower>
>> +function split_into_halves()
>> +{
>> +    eval "$2=$(printf "0x%X\n" $(($1 >> 32)))"
>> +    eval "$3=$(printf "0x%X\n" $(($1 & 0xFFFFFFFF)))"
>> +}
> 
> I know it is the same thing, but I would prefer the following version
> because it makes it easier to read:
> 
> # Usage:
> # split_into_halves <value> <variable_to_store_upper> <variable_to_store_lower>
> function split_into_halves()
> {
>     local value=$1
>     local upper=$2
>     local lower=$3
> 
>     eval "$upper=$(printf "0x%X\n" $(($value >> 32)))"
>     eval "$lower=$(printf "0x%X\n" $(($value & 0xFFFFFFFF)))"
> }
That is ok for me.

> 
> 
>> +
>>  # data_type is either
>>  #   int
>>  #   hex
>> @@ -41,10 +49,14 @@ function dt_set()
>>
>>      if test $data_type = "var"
>>      then
>> -        eval data_addr_var="$data"_addr
>> -        eval data_addr=\$"$data_addr_var"
>> -        eval data_size_var="$data"_size
>> -        eval data_size=\$"$data_size_var"
>> +        eval data_addr1_var="$data"_addr1
>> +        eval data_addr2_var="$data"_addr2
>> +        eval data_addr1=\$"$data_addr1_var"
>> +        eval data_addr2=\$"$data_addr2_var"
>> +        eval data_size1_var="$data"_size1
>> +        eval data_size2_var="$data"_size2
>> +        eval data_size1=\$"$data_size1_var"
>> +        eval data_size2=\$"$data_size2_var"
> 
> To avoid making the code more complex, is it possible to stick with just
> a single data_addr variable in u-boot and calculate the upper and lower
> 32-bit using u-boot commands?
The reason why we need these extra variables is to add them into respective
cells under different nodes. In dt_set we need to put the variable names
for dynamic assignment and variable values for static assignment. We cannot
do this having a single pair data_addr_var,data_addr. These evals corresponds
to variables from xen_file_loading. dt_set and add_size are two different
functions. The former is used to create the nodes and the latter is used to
set values for the environment variables.

Example:
dt_set "/chosen/dom0" "reg" "var" "dom0_linux"
- this will create a reg property for dom0 kernel. We need to insert the upper
and lower halves into this property (so we need separate variables for that)
e.g.
reg <0x${dom0_linux_addr1} 0x${dom0_linux_addr2} 0x${dom0_linux_size1} 0x${dom0_linux_size2}>

load_file $DOM0_KERNEL "dom0_linux" calling add_size
- this will set values for upper and lower halves into u-boot env variables
that corresponds to variables we placed previously in reg property,
e.g.
setenv dom0_linux_addr1 ${memaddr1}
setenv dom0_linux_addr2 ${memaddr2}
setenv dom0_linux_size1 ${filesize1}
setenv dom0_linux_size2 ${filesize2}

FWICS, we cannot achieve this using a single pair.

~Michal

