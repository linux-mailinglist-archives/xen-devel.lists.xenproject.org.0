Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5F555776E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 12:08:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354784.582086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Jl9-0007Kc-HB; Thu, 23 Jun 2022 10:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354784.582086; Thu, 23 Jun 2022 10:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Jl9-0007Gb-Bn; Thu, 23 Jun 2022 10:08:23 +0000
Received: by outflank-mailman (input) for mailman id 354784;
 Thu, 23 Jun 2022 10:02:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyAp=W6=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1o4Jfa-0006XJ-LE
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 10:02:38 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bdb8751-f2db-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 12:02:36 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB3114.namprd12.prod.outlook.com (2603:10b6:5:11e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Thu, 23 Jun
 2022 10:02:34 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4047:c750:5bc6:19d7]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4047:c750:5bc6:19d7%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 10:02:34 +0000
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
X-Inumbo-ID: 9bdb8751-f2db-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niCB6CK+be5qMPInEHa254ZoOyZAGj5cOsf6RRo7xd8JTuPvWFwQW/k2JXgw7Rr3Hl8m6TMN8t7cADn23xaul6dGNiKrKIKon7fyO+sIOsB6faIYODvL2kwEvmCA4hWneXy5Udsg4xfGhigkDhR7/CBG32NKxKvjR7QDWzJtf+6lweDSlp/fR2OWjvKxGbn/cGLHq+DE89hIrxr5DFeCbqeyZnuZvqHtAcg72g3/UKywY9bZEmRUgC9qyyRTEjeT29hM/Ya4ThhKZ5vNP+l/byf5BqiRSadWHUtbvs5M1NSDPxfKhUp0c9ce8CgEGHy2NO94vuWET/ukofaW30a3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiKyNOVJI2mz2xvxS4XSkjceT6GMKGp26YhVkTb5B1Q=;
 b=dofuDIDlcjvixTKg7pZQSija0850h2XFRFUm/Bq7DFEWRMNkSdeDjzsVYbu01gqCDoxhGoiCLiu80AYhL8xBzhPGyTUvLWn/henuc6Mv7fw9XM/Trl5GPapkPH06+ztXnLk4DLPqHDVzlc8yA6k97RTFI75YFKe3x5tX9qAuY/5v0XlbfvtF/1Ivr5wEOpFnbYLhNFS7IZtw8HM6wh37jNvEqYsHROO8nM/TQYA2sba4MJ9dwxu+0elPqToZH/yqt2PpZBlZyysWiiw/klDlQOsz94yhy5QO789QbzbNBWztqG7TMt9HTu9Rlfri3ykKsqyT4tnQyqAPiS6O53Pfdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiKyNOVJI2mz2xvxS4XSkjceT6GMKGp26YhVkTb5B1Q=;
 b=LK0q1ucUdROLaWkUsiBz09D6rV4F/UKWpx/V+SZWiAeGIhYqVERERi6vjSH3UloS8s7bZ6Dt7ZtkOKjWa3WFWipRwuycz+uzwGhCCBv1n4CJ3i7Y5z2NUnTizBn2ZHV6s8R7mjKhF7SWWgJVgQ/hzR4rCxpY2CUAY6n51a8fjnA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <797bf441-9d7a-7eb8-4e90-787398acf726@amd.com>
Date: Thu, 23 Jun 2022 11:02:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [Viryaos-discuss] [ImageBuilder] [PATCH 2/2] uboot-script-gen:
 Enable direct mapping of statically allocated memory
From: Ayan Kumar Halder <ayankuma@amd.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net
References: <20220619124316.378365-1-burzalodowa@gmail.com>
 <20220619124316.378365-2-burzalodowa@gmail.com>
 <5cd7ee29-d43a-1302-0a0b-6b4c339a96da@amd.com>
In-Reply-To: <5cd7ee29-d43a-1302-0a0b-6b4c339a96da@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0307.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::31) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d6b4068-eda5-4900-886e-08da54ff7e03
X-MS-TrafficTypeDiagnostic: DM6PR12MB3114:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR12MB31140F5CC5187364BAB205A6BCB59@DM6PR12MB3114.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yHItHFGs/imJzdBUVCpWUSevHLn8fhrkJ3H2TJW+wHXtmcYgIVwGFDdEHGkZQXVr5bRGYUSotGS0ui7gJPYBJKviGWNTxNYUAH0b24YZ5GK50zGZUSLh+qKrwIENdryRKNpVQbR3dg7WwZs1gPfRhMP50Ie55AcaDNsK9zfk8DN9B2AriB/j6R7aGZcmzkFPdJI/kTh6pwYUaroNM9trUWnhsMqmgFLGLT2W7M9twwt/+459DMY0JWKTI/vGZ1+juDYDEyGq5egaUIJ+vevftmFrG6NGfBHLBko8XcrN2qrgacrnI9qEXNm+eGUxZLQwLBhk9qshOBYhoX/u0aW6VAcq8VMYIS1j+bAQKwidgEfuwA/vSedEH96R3DpTSulE3ME38IIvYN2+4jRT8VCK2C0q0f2XrYkd8VNRN/ot3NYYzXrWVqGfqQyTwevZwS4nJyyWjUIQDqCAjuN5ltvMGb4xcxeKFhq9vu9+BKtxXpet7h+8hBLzv/hteXxF23gyFtcgKUqSPWbBCORqbPmZrrHkFdqPK6/W9JGCpcUsJZNDmV801mSr8pvZKYm5CmmkR4w2X36U9pV3Q/coiHBYQxdvltroltgIIZ+UhGMBSMmlpoSBk2rVg4XyMUT0IeKR6Y8kKCz+rnpL/Ybw4Y2SIgJRolyv8AP8cEQEHVNQEpvRvYY7ILN81Hm55Cnh8TwvWXM+tTaGc44OqhgtUAt/j0FfKvBsvoAWeT5gfyXQH1GTu/7QeSsJnq4UQCiJQNCtFaxznAxU75KGiIW7hwRYiQTbrQpIJhepEtkjevSU1u8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(478600001)(38100700002)(316002)(2616005)(66476007)(6486002)(2906002)(186003)(4326008)(6666004)(66946007)(83380400001)(8936002)(66556008)(26005)(8676002)(31696002)(6506007)(53546011)(5660300002)(6512007)(41300700001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3NQTGZvdUZSVU5ubERWc1VVTzhocWJxSndGd0xmMys4OFBEOHUvbzJ3NXNI?=
 =?utf-8?B?VnYwdU1iYWRKU3hxSHlXc3M3bmlaNXZ3R1RPK2xwYnVrVzBFRUQ4TFRCUkRW?=
 =?utf-8?B?dkV0RTN3QlNkS0ZHR2ZObWFLMHlkV2Q4OXBFL1FrcTZtbkVQOUlmWlYyQ0wy?=
 =?utf-8?B?a2VJd3EvQmplaTVWV1BteFMzWXdKNExkS1JwWnRHc3kyM2JTVnZ4UEtQb1ZL?=
 =?utf-8?B?YmxUQWc4L3RLN3VBUVQ0b1ZRbDhxQVdPV2dDaEVVRG41Rkd1cmpxdnBjWE81?=
 =?utf-8?B?NHlOWVRsZ0Q3RFR6bk5HSEY4NzVKM25LTzM5emdsR1ZzQzIwYkZMWC91SHEy?=
 =?utf-8?B?VWNLVjBKWEpUZ2ljVEZWQmlEMUZkdW1FYTI3c3RNN1lyR3V2RkNWWVJ1ZXpo?=
 =?utf-8?B?dXlWMlZGNkJFajY1eG81Y2NrYTR1NURTZ2gzUlA0VUxDQXhNODJCQ1pRTXhI?=
 =?utf-8?B?Mm84L0Y4UUtzdUpxYStlejZmWmdxb2pNUDNHWjlKNHc1cSsvTno4K0NKZVNq?=
 =?utf-8?B?T0tmK25ueWdFS2dDZGZmVUk3NFRPK1BrUWdXRTBGeVMxb3g0anRZRzIrOVBs?=
 =?utf-8?B?STk2RGdDWUt1czRSK3pvZWwzNFVySFNhNmZ0MTFxbDROL1Btd0pRRFN6RUdO?=
 =?utf-8?B?bEtRUlRTSmNScmViTXAyc3dyRjdQdUtzMlJnYlg3d01qTjhnV0grRzZxNGpI?=
 =?utf-8?B?ZlZGVXpnMmp5MlBzWnl1L2pZdS90T3pvZHhvMUZkL3I5eUVXNUJFUDlTOUJ0?=
 =?utf-8?B?S1hVOTBwYUJIWDg3cVQxN0xkRTdpM3g2c2N3OXBRSTU3dmRyWEhKaUx6OGNl?=
 =?utf-8?B?eUhaZmIveUozNENmeXpZeHBQa1JFOStRZlBGY1ppYytpY2prWE1pOVNUeElt?=
 =?utf-8?B?N1ZyRUcwQ1hhOTA2bGU4a3B1N3FLdlVXUERMSWhFaE9oNXlHekZDeXJCNUNE?=
 =?utf-8?B?c1ZaZ0VaTHRzU0hpRXNoTWpkdGhLOXRWZXg1QUhDOWc1NTdTNjhmd0pyYWJp?=
 =?utf-8?B?RTFCV1NTbVorVmFvQTNJTEx4Wk5ud01VZys2WlRLWTRtamFnQ2MxL0tZZHBV?=
 =?utf-8?B?RzJyMnVzRjlKQndheHdPaG15VzBiSlNuR0VoN202RTJnM2dhbFM5YTZ0UDBM?=
 =?utf-8?B?RVg4blB5L01HTENjTVpNNWpYS016V3NDSXd1bnJUWTVrWnhKdWFiR2psVWJZ?=
 =?utf-8?B?akZaMS9iZ0Z6L01RZnV0cHArV1ZpeE8va3pvUERPOHdkRnVIL3BUNUxEVi9u?=
 =?utf-8?B?NW5pL0RsMXo3ZDhTM3lLM0dPNnBzR0o2YmdmU296K2crSTlNKzVablRuY0t5?=
 =?utf-8?B?aUQ3TG16SzhNdlQrTG4yVzZIM3dHcEY2VmlrVm5tMEdCYzd2MWhmdTEvSzMr?=
 =?utf-8?B?L0NrQ2kzREdVd08rTVYyQ1R1OTJPSkVMcHVQRHNOZHhBZUlzc2VoZjB0UVlr?=
 =?utf-8?B?QzVodUZDeFd5QlVyb1BwWHhMWjFFaWRaM2J3Lzk3dSs3V0lpNktkRkhlcHl6?=
 =?utf-8?B?RkNQbWp2NEtTQ1NtZTFWWnhMdkJTYTNLOEY1V0tPY1dWZXpMRWxwcDgxbmdx?=
 =?utf-8?B?NnhIWTZiQm0zczBpdG4yaktLbGkwSDBwdm9KU3JNVXBrcmZuZjBsZGRLUmpW?=
 =?utf-8?B?RXVuMDcwV2V5Wk1nTTcxT0xtZ1Q2MFUxK0xuMjV2M01LSUovdFNldEUyaFhj?=
 =?utf-8?B?UTJya1dEMUpsQmZhTFFOWUQyNm9id0w3aVVlZWJsTUhUVTBjUlFyVWhpTFFj?=
 =?utf-8?B?MGlqWE5GV3BLNDFNUGVzQzlXVkFLa1FheGd6SERndzZHQ0hIQmNhWVV6OVM3?=
 =?utf-8?B?SlNKVnhKUHVxYktLUnVwN09iU0dWeEQzdVFOMnZXaExhMHgxWEJQT3h1N0Rk?=
 =?utf-8?B?ZlorME5VOHdaN2xPQ2tuc3Q0ZExFa2hMS213SHpYekF4R0N6eDBVd0xvalIr?=
 =?utf-8?B?WkVmcXNVNmphdGZLdFJiSkNscmIwakNtVllnVFVHRW1qTHVKSGRkektYU0hu?=
 =?utf-8?B?M2lnakUvcXlsd2Fpc3BhS1d5ME9BV3NBc2RiMjBkUWhtbWZoVlN4ZlFsZnp5?=
 =?utf-8?B?VTNIK09FeG9GYkl2SzFFbjJ5TkhsT3g2SU1hU1NGaWRGOU9Ld3VlYktzK3Bt?=
 =?utf-8?B?Q3FSWWxhd2hIa3l3NlJsc2lkZVZZdzhqd3JoRGcra1l6RUVMaGp5Uy9meEI1?=
 =?utf-8?B?OGE2ZldrUzBkcTlEdlhCZnFsNTNXOCtBZkpoM0ZwWkxkcHRIWkFXOTl3QjdM?=
 =?utf-8?B?NWUxSTFYWnBabWpKRzFRS3VybkJuWVRpVEYrR1M0eVo3aVFScE9oNTVac2xC?=
 =?utf-8?B?TWpaNzMxWVVFK01TT0dVZUJ5ZHFyb1JxTkFyWlN4OVBkVldDbjdZdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6b4068-eda5-4900-886e-08da54ff7e03
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 10:02:33.9056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSFnlSGaPalG/CyICaGg+Kqk7t89o2Tk0GLoqFECjvJPQXjX1cyyscLT8MsdUDYfMjWStmOEJK4qpombm0cDMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3114

(Resending mail, as the previous delivery failed)

On 21/06/2022 12:34, Ayan Kumar Halder wrote:
> Hi,
>
> On 19/06/2022 13:43, Xenia Ragiadakou wrote:
>> Direct mapping for dom0less VMs is disabled by default in XEN and can be
>> enabled through the 'direct-map' property.
>> Add a new config parameter DOMU_DIRECT_MAP to be able to enable or 
>> disable
>> direct mapping, i.e set to 1 for enabling and to 0 for disabling.
>> This parameter is optional. Direct mapping is enabled by default for all
>> dom0less VMs with static allocation.
>>
>> The property 'direct-map' is a boolean property. Boolean properties 
>> are true
>> if present and false if missing.
>> Add a new data_type 'bool' in function dt_set() to setup a boolean 
>> property.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> ---
>>   README.md                |  4 ++++
>>   scripts/uboot-script-gen | 18 ++++++++++++++++++
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/README.md b/README.md
>> index c52e4b9..17ff206 100644
>> --- a/README.md
>> +++ b/README.md
>> @@ -168,6 +168,10 @@ Where:
>>     if specified, indicates the host physical address regions
>>     [baseaddr, baseaddr + size) to be reserved to the VM for static 
>> allocation.
>>   +- DOMU_DIRECT_MAP[number] can be set to 1 or 0.
>> +  If set to 1, the VM is direct mapped. The default is 1.
>> +  This is only applicable when DOMU_STATIC_MEM is specified.
>
> Can't we just use $DOMU_STATIC_MEM to set "direct-map" in dts ?
>
> Is there a valid use-case for static allocation without direct mapping 
> ? Sorry, it is not very clear to me.
>
> - Ayan
>
>> +
>>   - LINUX is optional but specifies the Linux kernel for when Xen is NOT
>>     used.  To enable this set any LINUX\_\* variables and do NOT set the
>>     XEN variable.
>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>> index bdc8a6b..e85c6ec 100755
>> --- a/scripts/uboot-script-gen
>> +++ b/scripts/uboot-script-gen
>> @@ -27,6 +27,7 @@ function dt_mknode()
>>   #   hex
>>   #   str
>>   #   str_a
>> +#   bool
>>   function dt_set()
>>   {
>>       local path=$1
>> @@ -49,6 +50,12 @@ function dt_set()
>>                   array+=" \"$element\""
>>               done
>>               echo "fdt set $path $var $array" >> $UBOOT_SOURCE
>> +        elif test $data_type = "bool"
>> +        then
>> +            if test "$data" -eq 1
>> +            then
>> +                echo "fdt set $path $var" >> $UBOOT_SOURCE
>> +            fi
>>           else
>>               echo "fdt set $path $var \"$data\"" >> $UBOOT_SOURCE
>>           fi
>> @@ -65,6 +72,12 @@ function dt_set()
>>           elif test $data_type = "str_a"
>>           then
>>               fdtput $FDTEDIT -p -t s $path $var $data
>> +        elif test $data_type = "bool"
>> +        then
>> +            if test "$data" -eq 1
>> +            then
>> +                fdtput $FDTEDIT -p $path $var
>> +            fi
>>           else
>>               fdtput $FDTEDIT -p -t s $path $var "$data"
>>           fi
>> @@ -206,6 +219,7 @@ function xen_device_tree_editing()
>>           if test "${DOMU_STATIC_MEM[$i]}"
>>           then
>>               add_device_tree_static_mem "/chosen/domU$i" 
>> "${DOMU_STATIC_MEM[$i]}"
>> +            dt_set "/chosen/domU$i" "direct-map" "bool" 
>> "${DOMU_DIRECT_MAP[$i]}"
>>           fi
>>           dt_set "/chosen/domU$i" "vpl011" "hex" "0x1"
>>           if test "$DOM0_KERNEL"
>> @@ -470,6 +484,10 @@ function xen_config()
>>           then
>>               DOMU_CMD[$i]="console=ttyAMA0"
>>           fi
>> +        if test -z "${DOMU_DIRECT_MAP[$i]}"
>> +        then
>> +             DOMU_DIRECT_MAP[$i]=1
>> +        fi
>>           i=$(( $i + 1 ))
>>       done
>>   }

