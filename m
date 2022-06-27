Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0187455B8E9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 11:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356359.584535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5kpy-0007Dh-TF; Mon, 27 Jun 2022 09:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356359.584535; Mon, 27 Jun 2022 09:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5kpy-0007AF-PQ; Mon, 27 Jun 2022 09:15:18 +0000
Received: by outflank-mailman (input) for mailman id 356359;
 Mon, 27 Jun 2022 09:15:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GcZ/=XC=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1o5kpy-0007A9-7G
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 09:15:18 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a875d8dc-f5f9-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 11:15:16 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4185.namprd12.prod.outlook.com (2603:10b6:5:216::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 09:15:13 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::6d20:93ce:c4d6:f683]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::6d20:93ce:c4d6:f683%4]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 09:15:13 +0000
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
X-Inumbo-ID: a875d8dc-f5f9-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OT7qFhchU2PzV7GRp+LW/eZXcYIaOeVvWXZcsbH0ulIJTQKTC/xHHHZ9uCqBaounVPA1PQbmwjMuOmqzuFcIpQme78Moy8eeNMcgJ2GlqCQkgIOaFharBj/a4oKHyPUZpj/HJBw3ppz8UGov0mZ3LO8U3JhoelE6si3CXolplz3SLpYlm7pVPaFfSrJWyht+LFX9OYvbbkPB+XfJVoHzo1DlV8pnp2Y+ioAA4f6EWBvkE8XTUtf4+43WwWLoxYFFLUiLO2gQd3oqvxFGZsvaHVgFFmDM6z8me9AZs9tAoiAO3S9CanmbjJTnCGKv5hgfUZ+mesDb5dA9snrCdWK26g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UBn0p/7StPmtkjZOa+mAy0AOnP5Z686T6X4+RveO/o=;
 b=eRQQYChpUXVepf5dFoWmwIGVd4WNRTwAbwTKor+v8I3YNzhDUpTpDuNZcnG+cKJnolyGhekPsDfBMgnSKNbCJk2gP6dUkd3RMgq9S/QH43OOgtedrsSVMVsbBES+md/qclPXErIcw/pWu5Pm+9G4nBJxxOLjea3dC9xb0zxY92jq0PzRSJ9+iJR4ghWYSbJcP7JT6ikpI9S5MalJC27zlIgEaxv15NdGPA/AKc/Um+Rc8fgBUV5idZLL/Pe8t/75COk0yzINiwOltQC98L0l0fqayOjmf4/nv3MK0CGATof1e2D3B0ZD+ThbnAM33/x4bJlrwHjqTWF0L/Cu6btiHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UBn0p/7StPmtkjZOa+mAy0AOnP5Z686T6X4+RveO/o=;
 b=dlbVMR0mqfT5vFvnFu0K6k7ng78J5IFZuRaiwQKllNwOBN016eC53MVnS+8oTPGRhCH69m60jLkeU+mfKfgdDNbTAxdE/p9juEVcVwC3u0o7MyiS128o+5POn4ep32UffJrZttSZHTSVXlFZhmrbomg21gNs1b+0fOPmbXfbfLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <78353de3-7483-a949-731c-d5a9199e7154@amd.com>
Date: Mon, 27 Jun 2022 10:15:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [Viryaos-discuss] [PATCH 2/2] uboot-script-gen: do not enable
 direct mapping by default
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net
References: <20220626184536.666647-1-burzalodowa@gmail.com>
 <20220626184536.666647-2-burzalodowa@gmail.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20220626184536.666647-2-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::24) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7a75105-2008-4634-38a3-08da581d8b17
X-MS-TrafficTypeDiagnostic: DM6PR12MB4185:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bpgb6wBsuY5Od6mLXxMeKi/D+o48pH/Lym/tVUxD4NYFQqg0oI89OSdaoqd/L2PaAOo6gqPtsxxPr1h8+NHKThldDbL7qFZ3dZJ5DoJAvBvBEXpETV7q7Jmf+dmq8LX9tB3DlbJ83Ste7fChkML36ruUQHIlaLlr+ejlqGSfXaPUBqLoNm1Ap9taYnMOH5R3GJZ+ZJAT+0lK9VTdHLKozf5D3+pEjhPoW7njmHEvFZ3ie3j2ODfD9uVjRnRmKHikkwCn7gMnSr1fx2nuESmwdsuGFF14NHmcz483PhWsTn/SFMYMxQVV01NwZ2zP09//gDZGj9xlbaAXR6Pe96xayJb8nJzgtV1ElDy5R9AUj271JzTuYVW75wgsvD3jjF6dprT0HZrMwz0CrGfI2F2QeuCyBlXhT26tNUCErf7IHCtZ6DQJhP+JLqNT7W35OEj733M+H6qYSIe7RkIBVfWCcy9vL/OHh3hD9oax8jefn/z+m1deqD4VJLFK5H0FdkFqT//w4VLpexJP00amfJc656fI+/yfQcFMj86HV+elxzO3zfdfrbZCcS+GLX3mMcx2zcn3k3iUNFGZgm10TwkBNYzslySmmYaCKqs/yWFouZyYlStNjKVf0urf49foKiy6hfFfTohXvVl+XcBZY6lALGk93eGukgLZWv8JYfXn2nFNTLR7GNwBBAmpYYEU389zAfTFcHswnMLpj1QbVxRxmYLOYTQqHALmyrNnV5UDgMhDkCUXNi8QdzsU68m1CLUI28O/boH0Fh0/m25Er2VoluOe2joVBboyGo8gAZqwKxI2+3tZMr9kgVa4VqEfswnp06vmOj5HJ6BH4/TF229EVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(6486002)(31686004)(26005)(36756003)(6506007)(53546011)(6666004)(316002)(6512007)(66476007)(83380400001)(478600001)(186003)(2616005)(41300700001)(66556008)(66946007)(31696002)(5660300002)(38100700002)(8676002)(4326008)(8936002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUkzQ3hqRE1uTGx0d0RVZkJ2Q3pWZFMwWkRmQkhuMUNScTFyRGNDK0pUbTNp?=
 =?utf-8?B?WXJHcFQrV21HOHhNRzlHNzBGT25ObGU3Z1VmWEhOTWRvUmNQcm11VnFVQ1h5?=
 =?utf-8?B?dnE0SFZTRyt4clNXWXhVNUlOZkNNRGYvRlRxRzM1Vm5qdk1RRC9LQjNteWlD?=
 =?utf-8?B?V1pzV0lQVThtbFlHSDRVREh0UkhyYWlkZW1MejFydHF4VStYQmlnNEVGYXQ4?=
 =?utf-8?B?ZjVxZDBiSnI0OWJSY25ZajZPZEhEL05FYTl4Nkoyc3FUUG5FUDhrYU9Ca2la?=
 =?utf-8?B?bTZUMXFDVjE5ZHNGVmtWb0swUWF4QU9QSFlQUm03YlZxRWlsZnFGd054dVE5?=
 =?utf-8?B?a3o1QTl1N3ZWdjZzaGEyRjhYbkpWTjJzWnUyNG9tNFNEa0NESjJWUHJSSFkx?=
 =?utf-8?B?STJYSW9qRVFyQStuMzJLRnRBaDZyQXB2MkRUT0x3MnFHblNuK3ZYS3FqOHE3?=
 =?utf-8?B?YkhzUEtnVmtLQXM3M0ZnYjBpckZGaytjMFV6RWpxY1NOdGxRb0NCeUdLYU9Z?=
 =?utf-8?B?UnpaMVRFSGgrRTFoY2NWU3V5d0o3TU5uOUg1cmZWeVBUNllLUllVcWlWeThP?=
 =?utf-8?B?dms2MmdiTkZETCtwbXZUTnBvOW5LL21OTEFvbThya1VSeCs5Z2M5RkVHckk0?=
 =?utf-8?B?c2RLbGZLZWs3VjFqWnhSUVFpaHg2N3BpWFFWQmIrTTBPWDJBd2NoOFp5ZSsz?=
 =?utf-8?B?ekorRlVvbFZCSFBOMW0vaytraHpyNERGVm9YeWI0ZklHN0V3aWMrVHVLVGJy?=
 =?utf-8?B?QlQrVGhmaWRRbDRmNWF3R2dmdUJSdURrck85MnNaWmdHQkpTZVl1dWl3VWVS?=
 =?utf-8?B?TDZFUUxPaXd1bUVhZzF2elh2Vkc0R05wZnpXWHVhcDVobXRoWFhDT2lRVXdz?=
 =?utf-8?B?UEFkTGZ5bXZ2cGVzWEljejZZQXAyOUxZTXRpTmtocExJb01aTDc4M0dCaTJG?=
 =?utf-8?B?bjhEZWFvdXVrbEQyT0IxU0xLVHhVS3E3ZUNQYzBEZUZmcEhBc212S1JxU0pR?=
 =?utf-8?B?OUR4eTVHenphVVVsZ1pHYS9DWWNmZExJOHlmYmpOdHBVNHFSbjZlY29YL0xi?=
 =?utf-8?B?blNaeEpJOXhsRzZNK2dJRk5zTHZlSUZQeGZ2UCsyRE5SbGJ5YUxFOVpxRjdO?=
 =?utf-8?B?bVJOVTBVeUNIaGtRRWFDZnBpajZPK3BEdjZnOUxmZGptY3pWbWQxaXVpczFP?=
 =?utf-8?B?WmtwcTZteUg1eDFyeWVzTFdOU1hSTFpnWlNoOFphc2d1REdONGRQcHRTY2R3?=
 =?utf-8?B?NkEwbFBtREUvY2dORDZjZnZDWktLa1V2YVhWYVl3TFgrQ0thNVdLYnJaMEdO?=
 =?utf-8?B?L2lPc0NqWDQwcFU4TEVzbTh0SGE5L0FSdGd6aVlDNmlQT0Y4ZmRSUm53MHVh?=
 =?utf-8?B?ek9WYWdLM3kyN1U5MHhYSmh0bHN2T3FBOWlpVzAyanV5dmFhM0xEWHVQUDZz?=
 =?utf-8?B?TFJPTngyeE44d3k2c0lDMGdURlhUY2lxNnRhcTczQzBDTEU5NDYyMzZLcHRR?=
 =?utf-8?B?bEhaUXVrT09WMnpVdFNQSHdnaStpRTNGYVFFL0dWM2xvWVhLd2lOSGRybStk?=
 =?utf-8?B?T0duSHVrbDArSkNOQlZtKzhnVm40MnpTRWdBSW5yd0VsUVFFazlnRXFEajdT?=
 =?utf-8?B?WkJ1d0t3TzJqTmNudHlIMTUyUzA1NFF5WVcvKzNvV1lENHd3amtVMW8xSlUz?=
 =?utf-8?B?L1ExNWEvYTZXcUFtK3p2d2JxSy9KTjVlZTRZQmRrN01mamZmWmxKdXJUd2Ns?=
 =?utf-8?B?QmRONTArQmcyVXU0L0NJMGxqYjVpdUVOVW5jdnIxSlg5OGNZL1J0WXRlL1d5?=
 =?utf-8?B?WEtWMU96UFltbEwwT0hkZ04vdXRBNHZOVEpHQ21JYVJPT1ZRSmlxSmFFUTdk?=
 =?utf-8?B?SmR3S3B0bGNWVSsvVnF1RmN3WWd5eWdwNnVkZE9CQjIvZUp6QWhpMlRmaWZF?=
 =?utf-8?B?Y0xWQVRaL0VzZjhuSlN3U0ZQQzF2UEFCRzFNeTVhdnVMb1FiMWkrWVhsR2h3?=
 =?utf-8?B?QUU1OHgyb3dTa2xkaWx3YzduRHVqZE1MWmFZY1c2UndSbStzZDYva3ZVNjNI?=
 =?utf-8?B?eGZabFA0OUZ0WUxzVEhQNm9DUEhTM2JobC9VWHJ5TlZpMVlEamxVU1VRYlI4?=
 =?utf-8?Q?PnkT/SdcCI9mNQo6ATwMTtiq5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a75105-2008-4634-38a3-08da581d8b17
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 09:15:13.8915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecSKvl2TnZcyoDIdB/PCW9JKRBFa/Qhu6pxdZMgcDbDZiXfODpkgJk212AwtDF96BXeSWVronJ5JGYiFibP5yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4185


On 26/06/2022 19:45, Xenia Ragiadakou wrote:
> To be inline with XEN, do not enable direct mapping automatically for all
> statically allocated domains.
>
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   README.md                | 4 ++--
>   scripts/uboot-script-gen | 8 ++------
>   2 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/README.md b/README.md
> index cb15ca5..03e437b 100644
> --- a/README.md
> +++ b/README.md
> @@ -169,8 +169,8 @@ Where:
>     if specified, indicates the host physical address regions
>     [baseaddr, baseaddr + size) to be reserved to the VM for static allocation.
>   
> -- DOMU_DIRECT_MAP[number] can be set to 1 or 0.
> -  If set to 1, the VM is direct mapped. The default is 1.
> +- DOMU_DIRECT_MAP[number] if set to 1, enables direct mapping.
> +  By default, direct mapping is disabled.
>     This is only applicable when DOMU_STATIC_MEM is specified.
>   
>   - LINUX is optional but specifies the Linux kernel for when Xen is NOT
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 085e29f..66ce6f7 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -52,7 +52,7 @@ function dt_set()
>               echo "fdt set $path $var $array" >> $UBOOT_SOURCE
>           elif test $data_type = "bool"
>           then
> -            if test "$data" -eq 1
> +            if test "$data" == "1"
>               then
>                   echo "fdt set $path $var" >> $UBOOT_SOURCE
>               fi
> @@ -74,7 +74,7 @@ function dt_set()
>               fdtput $FDTEDIT -p -t s $path $var $data
>           elif test $data_type = "bool"
>           then
> -            if test "$data" -eq 1
> +            if test "$data" == "1"
>               then
>                   fdtput $FDTEDIT -p $path $var
>               fi
> @@ -491,10 +491,6 @@ function xen_config()
>           then
>               DOMU_CMD[$i]="console=ttyAMA0"
>           fi
> -        if test -z "${DOMU_DIRECT_MAP[$i]}"
> -        then
> -             DOMU_DIRECT_MAP[$i]=1
> -        fi
>           i=$(( $i + 1 ))
>       done
>   }

