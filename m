Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD77B22B8D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 17:20:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078845.1439879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulqny-0002WX-77; Tue, 12 Aug 2025 15:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078845.1439879; Tue, 12 Aug 2025 15:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulqny-0002TL-3l; Tue, 12 Aug 2025 15:20:50 +0000
Received: by outflank-mailman (input) for mailman id 1078845;
 Tue, 12 Aug 2025 15:20:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2eVr=2Y=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ulqnx-0000N9-2y
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 15:20:49 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2009::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebc6555c-778f-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 17:20:47 +0200 (CEST)
Received: from SJ0PR03CA0213.namprd03.prod.outlook.com (2603:10b6:a03:39f::8)
 by MW4PR12MB7119.namprd12.prod.outlook.com (2603:10b6:303:220::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 12 Aug
 2025 15:20:43 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::bd) by SJ0PR03CA0213.outlook.office365.com
 (2603:10b6:a03:39f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.22 via Frontend Transport; Tue,
 12 Aug 2025 15:20:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 15:20:43 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 10:20:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 10:20:42 -0500
Received: from [10.71.195.192] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 12 Aug 2025 10:20:41 -0500
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
X-Inumbo-ID: ebc6555c-778f-11f0-a327-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLZKPDje4izDOOLiqzSUNmVIsllcVXjmhK1yR+ci22uaSFthbTUZqwotBL5euCtM0P+oTCsYKabrhZJtg64qke9Q9u0G/kYn+TCCoMMi5zkk7yAnasHrBgBB0muS4vMhVMgWFMal9d5rnZmeXm1JyiVMRdGI0LmPtv4A2xd377OvRwBrZzCdf4Xv3APbBssXIrGBVLrZLLxTonGz9Mcqg+uY3dz5R72ksuJeEpM2OOSShQifSbFM+d/+niYO/DMpD2NekVpoQrYpmPdaclfo4J5Jytk4vE1x8K00mJ+AJPo8BO+BhUwv/Ab3OzeGjSDBKAX1etOZTdnHtbL7knMhmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoQpcmomhMlZJ7ni8ZfszVR1brwT8moNASZf/uIEUPY=;
 b=JnNJ/wSVA976bYydPElpgiv7ggJPD5zSxq4i5yu9Ij8P5GpouilNLujBeLoyZfn44VwKNulqqbfhL9pm0fzsBd1/amWG+DY6a/wG8gSxtIcnMcACqx/DXvT+2tMkNQCc16ZjvVaZMb6zGlQPE6JFvdm9av51cFdtz1FrJHPu9E171jv2vBoHSEEryBTSaFPoAJ1wHv1tHbfqqTOUw0f5W4Fq20nDnJKtKsH+j+p4foewVYZ04pqWV613Q1lTwnw+MrjOQTeSwb94Qp8w9syF6pElHiF5jxtT/9FCrVuRwyTr+/4gFP1gUnFn3sQcJmtVzOhUiSpj3nj//vTEibH1Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoQpcmomhMlZJ7ni8ZfszVR1brwT8moNASZf/uIEUPY=;
 b=0JeZPQ7mYI0qEFOpELFWMpuuWLn5kZQcmLUL3BiRnFCgkwtcIA6OAA+vIsVV1unsARPyDHvnLnH3RY6EtvhDcVJdj5TvJzxv9hb/a7Guuoz0Oe2zIby3VDYpDeNw5XAe14yx/B6lq4HhruaMxbeAJZaCP1zMSfB/FHbevw202EA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <95ff08de-632c-4fd1-b73f-bb04380baac2@amd.com>
Date: Tue, 12 Aug 2025 16:20:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder] Add config option to use separate load commands
 for Xen, DOM0 and DOMU binaries
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
CC: <xen-devel@lists.xenproject.org>, <michal.orzel@amd.com>
References: <20250806123352.15852-1-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2508111428490.2883419@ubuntu-linux-20-04-desktop>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2508111428490.2883419@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|MW4PR12MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d75993b-96db-40ae-614a-08ddd9b3ce04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c05zWXNzRGdYMVUzTmpZdmR6Z3hJYlRweGJ0SHY3anp0aEVBUjltVXgxVnBa?=
 =?utf-8?B?b0s3NFIwa1hXTENrZENHQk9OM1FRaEdZM0htQSt0TWhzSXFkTVprZXVkRXZB?=
 =?utf-8?B?eEF4Q2RZK24xT2M0RE00S3VDM21zQmVIMFd5RGYrNGUvOHdNbzNrZjY4VFhz?=
 =?utf-8?B?dnFTbzdPOWxaU3d6V1lxTEQrd1Ewb2lBZ1d0OGxzdk5wRXJhdFcwZ3pPWk1D?=
 =?utf-8?B?M0hqS2lnako5VmhBQlZyMXNWd0w5VE9sYk5iM3pEMXNyaFhNRnhYbHdKTHFq?=
 =?utf-8?B?SVJESWV1Q0g5Q24wZTY2akFPbUhucVJPZnk5blkwMDdaTWxpNDZ2NjdpYy9O?=
 =?utf-8?B?ZFF6bk02Z0hrcjR2Rm1ENDVSUEF5VDhUbWY5eEJ4Njh2b2tRdEFuOTJUQ3h5?=
 =?utf-8?B?TGNvcTYzTTlRZnkrUzRFT2Zadk5KWThpaTJ3RVEvMTFVcDBEUWZTcGdKdkl4?=
 =?utf-8?B?TEdBYUoraGZ4bUduRGJKcENDR2lHQmsyRUFKRUtVd3h0TERwQk1ONGx4eXZW?=
 =?utf-8?B?bVZqak5YNzVtTWx5ZlBmU2FrZ2NmRjZleVRneWN6ZVRYWFpLU3MyT0Q1NGhT?=
 =?utf-8?B?cDlxVmd0VjNLSlpRenpqc1Y5SWJhakxDYkMrdlcxY3NiT1dZVms0SEg3eTRH?=
 =?utf-8?B?QjArQmFOUzkyQTd6SC9qWmZnTEpLdmRPalZDTW13eURLcVQwMk1SQjVQeno3?=
 =?utf-8?B?M09abWFMTXhEMHZLSjlNNU4rSFV3QWx0VTZabVhJeDVQWmdpRmpVZDNXNFVk?=
 =?utf-8?B?QW42MFUwSG5oVkJEYVlTMkVyZStpQ2lQQy9JYzRaZ1NXaVNYNktFS0NhMkRt?=
 =?utf-8?B?VlVFZFpFUjB1V1h4OWhrRUI3QlMybE5iMUZMeVNpL0R1WDY2V0ZrRm1WOW9v?=
 =?utf-8?B?aXMzVHV5aEkrTUZUaEhySnErdXZabzhGV3ZNSkNVbmxyWHVZQTl6Y0pBRDRN?=
 =?utf-8?B?VjY2MkZWaGp6NWFOclZkOU9RNTQ2QlR4cElQendOR1B4ekdqSm9Qc3hlZ0Jh?=
 =?utf-8?B?MkpTVjFUWHBBSHhIcWkxNjY1OGNEWGlValplc0xORGJvZ0JYL2xLQ2dsWVNU?=
 =?utf-8?B?OHJPWTFlSTROYjA0dVVJZFJMdDlwSGxHckZqcnZ5NndSaFVuVXM2b0RwSmVH?=
 =?utf-8?B?dHN5UDhuTWRwbnFZMjV6NHVWRmRGWFdzSHk2WkNwd2Mva0I4WEZsaTNrbXl1?=
 =?utf-8?B?ZDBVVUpZOE5rWG5SdlNxNGc5R3Q0Q2tJTk1pR0o0b29xUDVGenVoWDN4SHJr?=
 =?utf-8?B?bE1qUWlhRUcyOTZ2cTgvZkNwN0EwU3IwUjBWd2VMN0lOUXdia1cvZGxKTzlG?=
 =?utf-8?B?a3hobXdORDBYc00vS3ZzNVh0bmkxQzFDNG1SSUFQV2NXaTZVMUZGOHBSQ0Fy?=
 =?utf-8?B?WU1oeTRORG50SEh1UGRTM0ltemUzdlMrWENpUk9BcU1Tekhqc0V1bDJLUHlQ?=
 =?utf-8?B?STNzOVNXWVNWRGhrYWg1UWZjL29hSDdXOXRBa3prVnBHWEh3M1NZdU94ZjBH?=
 =?utf-8?B?YWpzNjdGNk1senpVanRhS2VXeFNBTVlBaHBQUHJpOThtRnBXRUxOR3plTjky?=
 =?utf-8?B?eDd4b0loWkhkRUo5MUkrMjJVQ2hubm8xU3RPczdLaWt4YWVSVEJMOFczd25w?=
 =?utf-8?B?SHpvckRNZCtTblRMSDcyRDN5U242Ym5PNlhTTDlsR05zSGVIR25CVXMxdXNJ?=
 =?utf-8?B?QUtnTk4zcmFHR3JaRXgzZkloNG81VTZuOTRZclYreTlsYXpSRnI3WkliSEI0?=
 =?utf-8?B?SHFBcGpBU3dTNk9MQmV6eDhMVklweGNpRHNGSTJlVlJ5KzNZN0VYclBjSGN2?=
 =?utf-8?B?Q0N4MXd0ejNacnBSZ2V2K0pHYUdvRjlYMW8rZnRhVWxiMUtnWXhLOThaT2hD?=
 =?utf-8?B?aFljVko4R3Z3eUJ3Q0xOLzhNVDhNT1krWWNlSkJqTm5MaWM2ZlRNenY3UUIw?=
 =?utf-8?B?V1cwRFl5SGFyOXhvNW1OVXVTWVUrbEhHWkc0OEgydjdIVjlpZ0hGK3p2VWpw?=
 =?utf-8?B?bC9ZbE9PVm9ac1Fmb0E2U29LVkpWbktkZEJBSVhpSzJjR3MxempNb3dHalRn?=
 =?utf-8?Q?tws8DU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 15:20:43.3902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d75993b-96db-40ae-614a-08ddd9b3ce04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7119

Hi Stefano,

On 11/08/2025 22:38, Stefano Stabellini wrote:
> On Wed, 6 Aug 2025, Ayan Kumar Halder wrote:
>> Introduce the following options :-
>> 1. XEN_LOAD - This specifies command to load xen hypervisor binary and device
>> tree.
>> 2. DOM0_LOAD - This specifies command to load Dom0 binaries.
>> 3. DOMU_LOAD[] - This specifies command to load DomU binaries.
>>
>> There can be situations where Xen, Dom0 and DomU binaries are stored in
>> different partitions. Thus, imagebuilder should provide a way the binaries
>> using different commands.
>>
>> If any of the above options are not specified, LOAD_CMD is used by default.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> The patch is correct and the new config options look good. Two things.
>
> The following check should be removed or, better, modified to account
> for the new options:
>
>      if test ! "$LOAD_CMD"
>      then
>          echo "LOAD_CMD not set, either specify it in the config or set it with the -t option"
>          exit 1
>      fi
>
> Thanks to this patch, it shouldn't be necessary to specify LOAD_CMD any
> longer.

Actually, we should keep this check when Linux is loaded (without Xen). IOW,

@@ -1557,6 +1551,11 @@ then
  elif test "$LINUX"
  then
      os="linux"
+    if test ! "$LOAD_CMD"
+    then
+        echo "LOAD_CMD not set, either specify it in the config or set 
it with the -t option"
+        exit 1
+    fi
      linux_config

>
> find_root_dev and fit are the only two remaining users of LOAD_CMD.
> While I think it makes sense to keep LOAD_CMD for fit, find_root_dev
> should probably use DOM0_LOAD instead.
yes.
>
> This incremental change (untested) should work. What do you think?
>
>
>
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 9e97944..867876f 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -824,10 +824,10 @@ function check_compressed_file_type()
>   
>   function find_root_dev()
>   {
> -
> -    local dev=${LOAD_CMD%:*}
> +    local load_cmd=$1
> +    local dev=${load_cmd%:*}
>       dev=${dev##* }
> -    local par=${LOAD_CMD#*:}
> +    local par=${load_cmd#*:}
>   
>       if [ -z "$dev" ] || [ -z "$par" ]
>       then
> @@ -838,10 +838,10 @@ function find_root_dev()
>   
>       par=$((par + 1))
>   
> -    if [[ $LOAD_CMD =~ mmc ]]
> +    if [[ $load_cmd =~ mmc ]]
>       then
>           root_dev="/dev/mmcblk${dev}p${par}"
> -    elif [[ $LOAD_CMD =~ scsi ]]
> +    elif [[ $load_cmd =~ scsi ]]
>       then
>           # converts number to a scsi device character
>           dev=$((dev + 97))
> @@ -912,7 +912,7 @@ function xen_config()
>           then
>               DOM0_CMD="$DOM0_CMD root=/dev/ram0"
>           else
> -            find_root_dev
> +            find_root_dev "$DOM0_LOAD"
>               # $root_dev is set by find_root_dev
>               DOM0_CMD="$DOM0_CMD root=$root_dev"
>           fi
> @@ -960,7 +960,7 @@ function linux_config()
>           then
>               LINUX_CMD="$LINUX_CMD root=/dev/ram0"
>           else
> -            find_root_dev
> +            find_root_dev "$LOAD_CMD"
>               # $root_dev is set by find_root_dev
>               LINUX_CMD="$LINUX_CMD root=$root_dev"
>           fi
Till here the change looks ok.
> @@ -990,10 +990,6 @@ generate_uboot_images()
>   
>   xen_file_loading()
>   {
> -    if test -z "$DOM0_LOAD"
> -    then
> -        DOM0_LOAD="$LOAD_CMD"
> -    fi
This and
>       if test "$DOM0_KERNEL"
>       then
>           check_compressed_file_type $DOM0_KERNEL "executable\|uImage"
> @@ -1065,11 +1061,6 @@ xen_file_loading()
>           generate_uboot_images
>       fi
>   
> -    if test -z "${XEN_LOAD}"
> -    then
> -        XEN_LOAD="$LOAD_CMD"
> -    fi
> -

this, I have a concern about moving the changes out of xen_file_loading()

In xen_file_loading(), we set DOM0_LOAD, XEN_LOAD and DOMU_LOAD[i]. With 
this change, we set DOM0_LOAD , XEN_LOAD at the beginning of the script 
and DOMU_LOAD[i] in the function. This looks a bit odd to me.

Further DOM0_LOAD and XEN_LOAD should be set only when "$XEN" is set.

I can leave the change as it is in the current patch or I can move them 
to xen_config().

Please let me know your thoughts.

I have sent "[ImageBuilder v2] Add config option to use separate load 
commands for Xen, DOM0 and DOMU binaries" so that it becomes a bit clear.

- Ayan

>       kernel_addr=$memaddr
>       kernel_path=$XEN
>       load_file "$XEN" "host_kernel" "$XEN_LOAD"
> @@ -1518,12 +1509,22 @@ then
>       FIT="${UBOOT_SOURCE%.source}.fit"
>   fi
>   
> -if test ! "$LOAD_CMD"
> +if test ! "$LOAD_CMD" && ! test "$XEN_LOAD"
>   then
>       echo "LOAD_CMD not set, either specify it in the config or set it with the -t option"
>       exit 1
>   fi
>   
> +if test -z "$DOM0_LOAD"
> +then
> +    DOM0_LOAD="$LOAD_CMD"
> +fi
> +
> +if test -z "${XEN_LOAD}"
> +then
> +    XEN_LOAD="$LOAD_CMD"
> +fi
> +
>   if test ! "$BOOT_CMD"
>   then
>       BOOT_CMD="booti"

