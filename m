Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF6742AAA2
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 19:20:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207566.363440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maLQe-0002zc-SP; Tue, 12 Oct 2021 17:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207566.363440; Tue, 12 Oct 2021 17:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maLQe-0002xN-PO; Tue, 12 Oct 2021 17:19:04 +0000
Received: by outflank-mailman (input) for mailman id 207566;
 Tue, 12 Oct 2021 17:19:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+iE3=PA=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1maLQd-0002xH-Ss
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 17:19:04 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f1c4d98-ee40-49e6-a344-f94358c2f23a;
 Tue, 12 Oct 2021 17:19:02 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CGodtu030660; 
 Tue, 12 Oct 2021 17:18:55 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bmq3bh5k4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 17:18:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19CHF1iH059903;
 Tue, 12 Oct 2021 17:17:48 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by aserp3020.oracle.com with ESMTP id 3bmadyc6r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 17:17:48 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB5011.namprd10.prod.outlook.com (2603:10b6:208:333::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 17:17:46 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%5]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 17:17:46 +0000
Received: from [10.197.176.156] (160.34.88.156) by
 SN6PR01CA0001.prod.exchangelabs.com (2603:10b6:805:b6::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 17:17:43 +0000
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
X-Inumbo-ID: 2f1c4d98-ee40-49e6-a344-f94358c2f23a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=cGE2TuyHkADiEiPmnl62LUEd6AbpUdfTJ7Tgho8OOFk=;
 b=dn4J501pUw8bE1sSNrduhW8vUBPxBGlmPEFlYtfbhk7OooKmJYM3a0CfQ2XyerT+kEXH
 SQdPvwGJA8ThD882iIKtC2R9z6DXbK1UgEMcdePOHS79SU13L4Rk/G00gSO3A1QJfKAB
 dqwFrOkWNfQnWBuj+B2PT0dthB8pycQjloyu97LbP4domKkEgZ8RDKuIqCAy0Lww8dwV
 j2rWeEMNK5hbpazL7NvhvmllgxLJeZE5sYaCun84j8ynR+EUULz1uYtSDBZrA8qMNqlw
 s50yo/CX1tOfx06T1uIEaFiLA6Ywpw5Lqa9LdQe29YG7dmnldPx0oWAghAd3SSYZCCcG 3A== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a827fbOd0h84gzNT+TLPqvfFSJl2m9x3QTr7NmoAFLcfHEOCrI4BU8S9QBsO/wGetRqkUFwcU3rHJKCb5q0S7Di1b6FAfBaRLmSw4QEmML1hZ1cV/fP9gNZkwfzPtVKKA6ZlrqsEzLPhi0wGWN7PgShnUjOCF2VXGuzyJQPdYJasF0o2A5oPGzrvsqIvCpUs0VEHYNbsvjWPHHbPQmy6DIfkJ15nBHsOkvBTTLJIr4EDHfdao5cqgX8VOixfCWh/0hjrFNwEQuvp7ZFotf/QiqawYP5QGk7cSKQgujeO4et+eSQXdd84s1ck6Q5n26cpkpCIvwX1BfI/Qmlsvk7SOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGE2TuyHkADiEiPmnl62LUEd6AbpUdfTJ7Tgho8OOFk=;
 b=YYYwRz/l4ZnemluR+0bW4JXdHxDNVIuZm08MNc6TRZzQSqK8YxhxWPhqhHLUbEUrD2+9ZeNRoVOznj0JIZ51BzIXlWSk5RUeph71NkgP72DvYZnxhTT4X5g8Kbf/InFrYqCL4yhyrhwi2taBAczRGaPxYBAUInx4soS337BziQ8kQ1eAc2Diwc84TSQ63m6+hxb33SyaKl5CVHcXZz+ay1ZcBlUWPngOwnFWPa1mW+DLeOAs+b7YRiFLpArG4eNH47Pw4wALD1ohvTTqSmF3rUhry1NlsWzelNE2LI4Fkc+4frWb0NzCmmxQo/YH++FEgNQ8R7EQNep8YHHrB+IaBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGE2TuyHkADiEiPmnl62LUEd6AbpUdfTJ7Tgho8OOFk=;
 b=lpg3nMxjxpDG+Oy1c9xZeo/936p5Bxoq0iYyovIJmdIeEO5tMAeQi7o3LqyOfODvtvCpzTYBB9vP1t2bC3P1dpSlPR7jUoNhjKvdKy5dqkhJMbmm8nOnr9DSkyDAaA+xj0oR/QruE+1QmfoJ/qcNdwcGnTy4eGgAxbFsUtTnADg=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Message-ID: <4faf461f-49ca-5f2b-a7dc-e2b47b904527@oracle.com>
Date: Tue, 12 Oct 2021 13:17:41 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Subject: Re: [PATCH linux 1/2] xen: delay xen_hvm_init_time_ops() if kdump is
 boot on vcpu>=32
Content-Language: en-US
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, jgross@suse.com,
        sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, hpa@zytor.com, andrew.cooper3@citrix.com,
        george.dunlap@citrix.com, iwj@xenproject.org, jbeulich@suse.com,
        julien@xen.org, wl@xen.org, joe.jin@oracle.com
References: <20211012072428.2569-1-dongli.zhang@oracle.com>
 <20211012072428.2569-2-dongli.zhang@oracle.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20211012072428.2569-2-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0001.prod.exchangelabs.com (2603:10b6:805:b6::14)
 To BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8202eba-6dee-49ee-ec7e-08d98da43554
X-MS-TrafficTypeDiagnostic: BLAPR10MB5011:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB5011128324CC2F95C2AF13058AB69@BLAPR10MB5011.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/ORgMNsdmgGiQ9nTtEktdMCoMizc2nO5HgQyIt9DOqMy+mwzbLZjCIi/QX0w5nXltqnw0JMn/cNN0+GbqRrEsdL12pXdWfY+yiINwi73OOL6HcAHK89wsOg+zcbxeWmyLcKVhagWKlKg9ZRZ2Ow00jbuSxYMdbihvQFrVEfGvnk5Unpc55FuTVUe3p0mC3yTpcFsheCyZ1X16CXFqCke0ijzJeSIYQ/eE1zWEURUurI97BNRVwNCS1jmPcXn7lRq0SlmWotzLNgzXdpAgmvgFyPYADw9jHYFn4QdIPvIh4Z87Z2iZ2JDrCXh3FXp8TfRcz+gmPZl1pZrtXUNTpqEdiO7xJa/BuT/3J+qBLFjE5YUm9UiV5wp61ZOB0fta5lMUamDVnhvQmfEFvX7lZqWdoUzi/mtmSH6x01T1qekx0xyHi5eLBlcDfcQR2mxCbaUIuJPb2N1D71lZvo+yw18AF+260A4VGJUl0IARP2RgS0LPMS050PD5NQim6vhVaOoNDdApuA1zhdHdrMTfj3Vy7l5HaQE/j0PFksMQ99OZUgFc94i4XV9FFYSM79Xt4iRJ+0566JRhl5MjPDu7xbSwjlPkndJP+4RyKZ3G0Ivt2kA/r6B0UiDd4iB0cw/vFIM5GX2DRJTFLssZao95o7/w8udWgArtQQQWWuJT8SMO8uf4vV58yd0XXRsEgcrip8ToRmL780nOUc/3Ofvfc11uw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(38100700002)(508600001)(16576012)(5660300002)(26005)(4326008)(6486002)(53546011)(86362001)(44832011)(36756003)(66476007)(66556008)(8676002)(316002)(2906002)(31696002)(8936002)(66946007)(83380400001)(31686004)(2616005)(186003)(956004)(107886003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Qk9iTnpGU0VvL1M1QW1ZS3QramtBR2llQVMrOExsb3ZaNkZad3JoU2dGM2ty?=
 =?utf-8?B?bkpHMDhaQWZSb0ZxcUQ0MDZTWnNrdUwzaVUxdmdtNHZTQ2lRTnhVZldaN0ow?=
 =?utf-8?B?YlVYVEVQTGVYeTFWczQ2L09zLzRKNEt5eUpOOS9US3dKVnRCbXNLeUNvT050?=
 =?utf-8?B?dnAxRkk5VEtIaW93dHpFUEJHRmVUYzJzL2ZIVG1hcjZzV201TTkxeXB1NjdM?=
 =?utf-8?B?c2o0K0wyelJsNGl4eklvQnNQU01DOFpBVHVJRVVhUmlWdWZpcHVsU3dQdkZw?=
 =?utf-8?B?dWZHRk1jQVpGajJMa0RFdEdWb1lEOGpnTWhUMTR5czhLSG1DdEkzaW5HVkRZ?=
 =?utf-8?B?alVSUTl5MTQ4emVJZGNMbm8xUlorVTh6ZThwOGFKbmt2RjYweFdpWXQ3VDNZ?=
 =?utf-8?B?blpib3JqMDBWL2FXaFpqTGZrU2FtaTFDamRPekZaN2l4UnJEOUJOUm80cEkw?=
 =?utf-8?B?OE8yN1UrSkJIajJwVEFWcnBKV1hiOENuazl2R3hTVlVBT0o3aFdiYUtXanVu?=
 =?utf-8?B?YlpUWm9lVDZ2YW84OVlXdlI3YVFjRTE4d0JNWHl6WnhnMmlKL2FCSC9NbWE0?=
 =?utf-8?B?ejdsajVkNS91eTBpalBMOHJUeHhOVUxQSG1hVGRVcER2Z2lURDFXMHNyOCt0?=
 =?utf-8?B?SEtIUmx6azNQSXFpaFdvY3N3OFRtbjIvZk5tN21sSGtPR1d2ZER2MkxJak40?=
 =?utf-8?B?dnJoUUlKZHY4WGxLOW8wYnNYR1dQZFNraW9Cc2pnM2Zadkh4ZUtmN1R1SjlI?=
 =?utf-8?B?K2Z0NFJBSEtzbHNGdDQ5TkErRWl1bGpwNER3T2NYK2RSK3BQUlBqWFBGSmRa?=
 =?utf-8?B?ODNNMVlMazhnbWhDRUtDN0hVVU9uMkFVWWdMT05NTG4vN1B0R2VMYVN2Qmds?=
 =?utf-8?B?dmowNWZoa2hSV1pPMGx2eXVDdHdLMU40Mk0wbko5T0ppSXV2R2hCQjNmNEtS?=
 =?utf-8?B?RTg1ZjJJZVRabzRtZGFURzJwY3d0SEdCUmNPMmlYTkI1N0RqOEN3eUtxakFF?=
 =?utf-8?B?SmxxWnNCMlk5NWt2WEF1cWdnWHBiQUZlRFREQ0RhclZlUnFPOUozR0l5WTNS?=
 =?utf-8?B?cytnSjREUEl4SWNlaURaNHhTR09Db1A1S3d0Yk80dTZHNEtnWmE5bWdTa2hu?=
 =?utf-8?B?ai9iVVZqUGdQaTFWbE5CcHRvSksxdXhlWmNDQmRiL2p5S1E2SU5veG9aQ0ZW?=
 =?utf-8?B?S1YvdW1GcFU2eXRBZHVDbXZYVHFsV3VzY1ZSMmJabnRBSjBLRitzdlBNUHVQ?=
 =?utf-8?B?VmJodzVvcytlNS9SdDJBTEwzcU5lZzkzUlBsNG40N2JoT05yWmN0OGVqUHhB?=
 =?utf-8?B?M080d3Vuc2RKT3JvQ3M4SG4vczV0TE5SSmQ3MUc1OC84eGM3VWtrdnE5OUND?=
 =?utf-8?B?NUJqb3dCME9uT3cyeWdtSDRDRkY2V2RkUXZJb2pnaWwzN20zYmNtYWUvWXJO?=
 =?utf-8?B?dDhIbnZpWDFJSEhKcXB1OExmNDVlUVpLcmROaW8yWTRwb3FXaURmSE9TTS9q?=
 =?utf-8?B?Z3E1M2krelRtbzFFZlZIZWV2eFg0WWFVdzFHV202Tmd0aC9LZjdwWERSblFJ?=
 =?utf-8?B?b0QyV0oxUVRnRWpnWFBCeENBOTF1aXNHOHlySnp0WDdOeHd6UUJ1bkNTV3Rn?=
 =?utf-8?B?ZWNZOG5WVjMrTHovZ0w0YW44QnBtRHdERjJZM1ovcHUvdW1pNVJSVUtQRDJw?=
 =?utf-8?B?dXZJSE83Ri9tL3lHK3lXUDN5Nmo1VUtOc2pMRkZkNFU1MlE1Mm5oM096NDF5?=
 =?utf-8?Q?APl33gyOHJbNrI2xoBC8vFua5uOqF5f/hULZszI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8202eba-6dee-49ee-ec7e-08d98da43554
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 17:17:46.0528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBGkQcaIDrzxh7Vh4RtVFV7DVEOdlZDKHFDFpnMCEohwRmZ/XiJ4rl5znnlH6hcdIgG5afRalkUcEEHVFxySEeO+UIWCM4bR0yoCxBUKGY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5011
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10135 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110120095
X-Proofpoint-GUID: Z5UMs2uxpJAH0edED9hpu0XtQI0kY1Yz
X-Proofpoint-ORIG-GUID: Z5UMs2uxpJAH0edED9hpu0XtQI0kY1Yz


On 10/12/21 3:24 AM, Dongli Zhang wrote:
> The sched_clock() can be used very early since upstream
> commit 857baa87b642 ("sched/clock: Enable sched clock early"). In addition,
> with upstream commit 38669ba205d1 ("x86/xen/time: Output xen sched_clock
> time from 0"), kdump kernel in Xen HVM guest may panic at very early stage
> when accessing &__this_cpu_read(xen_vcpu)->time as in below:


Please drop "upstream". It's always upstream here.


> +
> +	/*
> +	 * Only MAX_VIRT_CPUS 'vcpu_info' are embedded inside 'shared_info'
> +	 * and the VM would use them until xen_vcpu_setup() is used to
> +	 * allocate/relocate them at arbitrary address.
> +	 *
> +	 * However, when Xen HVM guest panic on vcpu >= MAX_VIRT_CPUS,
> +	 * per_cpu(xen_vcpu, cpu) is still NULL at this stage. To access
> +	 * per_cpu(xen_vcpu, cpu) via xen_clocksource_read() would panic.
> +	 *
> +	 * Therefore we delay xen_hvm_init_time_ops() to
> +	 * xen_hvm_smp_prepare_boot_cpu() when boot vcpu is >= MAX_VIRT_CPUS.
> +	 */
> +	if (xen_vcpu_nr(0) >= MAX_VIRT_CPUS)


What about always deferring this when panicing? Would that work?


Deciding whether to defer based on cpu number feels a bit awkward.


-boris


> +		pr_info("Delay xen_hvm_init_time_ops() as kernel is running on vcpu=%d\n",
> +			xen_vcpu_nr(0));
> +	else
> +		xen_hvm_init_time_ops();
> +
>   	xen_hvm_init_mmu_ops();
>   

