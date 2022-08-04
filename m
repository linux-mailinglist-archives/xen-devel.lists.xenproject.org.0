Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68427589C8B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 15:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380390.614519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJaoZ-0008Hc-3T; Thu, 04 Aug 2022 13:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380390.614519; Thu, 04 Aug 2022 13:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJaoZ-0008EV-0Y; Thu, 04 Aug 2022 13:23:03 +0000
Received: by outflank-mailman (input) for mailman id 380390;
 Thu, 04 Aug 2022 13:23:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s7b8=YI=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oJaoX-0008EP-Df
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 13:23:01 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ed9775d-13f8-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 15:22:59 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BYAPR12MB2854.namprd12.prod.outlook.com (2603:10b6:a03:135::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Thu, 4 Aug
 2022 13:22:54 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4db:f977:d898:caea]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4db:f977:d898:caea%6]) with mapi id 15.20.5482.016; Thu, 4 Aug 2022
 13:22:54 +0000
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
X-Inumbo-ID: 8ed9775d-13f8-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Et0Bv5coFZxlDv0CSAyirZykuNX/kwntG65AFiaCokeby0McP2+d6vHpKzCPg5dtFZm4dTFWDfODop0bMGSy6LPHqLYgTVUIDPkQrbuiM0J9toyoZ+EfGjhmiczCqPDPz/gDjEFrxMojkEDngjsmTzSaRmVhLLvlnQ4Asy8KGUt9NwSLTwgG8mJQur9CEn7QWVSmpC/AsHnw9Pb6FlXMwKzba88GgPpYFvUNAl4r/9Q3dPdem/QqUfhdor2bKDgPH/NmD5sEUcQ2cBcMWH1bGMWm84louAsrvpZsmMV80LWoWdXeB5xOPsPfE0BlVILzxphZU32z6kbaVABr3JSDag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAQeikYW30fZ0XpZIWy1AD3064fM3Pf/gvzk23qmEGI=;
 b=RAaeQX/72I9UoxMIpRQC/dzCVX7s2QklOLvn/KKbq2CgFzVXnuQkis/dfIprgS/itrv321m/dZFBNsbnowbfUXPSzeI9CCqRKzZ9BK/s04PifCOoZ3IDHEa9kpDKzIVxUQOvDtf46Uc46D9mnE7+1wJEg1uVL1C/eQpzG+fWzIs+pooxaPArld+DigSDLhY5BPgEHxGFUwM9BNSjk2d8a+Ggrq4gYfANPsrJEVV/yv+9aOkV3szxSqimXRFAdUnt8yAk4+sR0ij8/QYbJ2Csd4yk8Z1QLC2tvaJCiOhTDks/HsBoxADGNvPkcf+3M4Un/XvhOY11weDFdX+LjvHXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAQeikYW30fZ0XpZIWy1AD3064fM3Pf/gvzk23qmEGI=;
 b=cdfS2G9zK7dPhCKMAO2b3eo5of5nDfQjrvDlCWSBdxAF4bXIcBLp6knxkFpTCMwwUKTUzqk2kuGI/8+HUe8rbNRXLzTdRpnyuWo4/AD3HUeH798t4cBi/82gxsyklHMHNlErYJSVh1ecvFHLYA8LRLARMEthB6V3gjb4HlFX9jY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <719bbd84-6add-950a-9e4e-511073a679df@amd.com>
Date: Thu, 4 Aug 2022 14:22:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] automation: disable xen,enhanced in qemu-smoke-arm64
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: cardoe@cardoe.com, burzalodowa@gmail.com, penny.zheng@arm.com
References: <20220729000557.2090845-1-stefano.stabellini@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20220729000557.2090845-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0390.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::17) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 191f183e-7c0a-4295-9592-08da761c703e
X-MS-TrafficTypeDiagnostic: BYAPR12MB2854:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zdai8yQkXzZgb6y0UZOQ/g0SuR7sfuDfWTT4OpQQHvzFr56OUg8/PXtjjg089Pv1XtZ0V9rM7Fp9n9p0TSdK2Q2qe6HJg5U4RJwDUPXcUy610O3L9BHD29DfecFh3i78IpeEh/jTGywOFSBtXo2JpwaqH9EpkLAVMKtqOVSgyXtdo3UXShywaqgi6wBpcajdwAwGD3/n2UtzJZf6L0lrZrde8N7Z0vfrHTGvWp16mdSkvSLJGTkVoSKEcIwkr5Mp9kt7UXqwsfj9SzA7kXGDdd4M7td4Qi/cgKIwlN1Ql8BN/50+psqz2NNBynf12ii8qdqzEJKOLs3jjsZxArK9PAe+GJ8Km/ya6TIfTXwmYpJZryult/UgMrHNXDrY0B5A33qps76WSjGKfzr5Y+FFcQe0Jc1u90KVRjaDQ6+Ac91ehkEr064iC/1qIW2XcGlfroypl31HZu/cIR4s+inomvxDe9zAOdZ8f7kJxR+uT1Jr4PiTapZeZrPCPkbdBsE0AM5nVkTwElCNmvgn+PXXGWGi8GPnCySxAdmnTru7WANCeZZHS+f6qos8Wu78Walu8rgTlHpmW8Y/dSh5zRetAS4lTyjTjFnPEoRC+kesFXjcgr/mVDxM49+cGB30PQUsYLJhQRM0HJaguRxop0+PU7FDgDUDFrODnisKGG1FLHBdUtWAuNZix95uiySPRkckLvxGkz7FLc7dp8tgpLVqzJHUXmZglYsFxlwqAnnBIO99rL89FV8No405iRyKhfPq+GfB9wdfrINLhll+euAtxd0Z+IpjmmJM4vmR5Anj9OlVDRTQLGT0UL1EazPSbB2/P5P1z1+CT+LwizS6yILKIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(316002)(66556008)(8936002)(8676002)(4326008)(66476007)(66946007)(6486002)(478600001)(186003)(31696002)(4744005)(6512007)(2616005)(38100700002)(6666004)(41300700001)(53546011)(5660300002)(2906002)(36756003)(6506007)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHU0Y1RIVk12MlNyM2QrVjliY0g2OSs4aVhUSlNHUlFUaEtScmcvWGxxRHo1?=
 =?utf-8?B?NncwZVpUMlJVOXVDMVk1Z3pBK1FKQ1djNHVqQ25hRkZnMWx4T1Fqd1Z0VWNR?=
 =?utf-8?B?WVNNYzVTYWZING8wYUw1bHd3blg4NlJOY1gwcCtXQXdrWDQ2ODljdnQ4ZVRu?=
 =?utf-8?B?MU01TDFKR0dXYUpIcWdqZVZYeXJDbHFDVlE3VXpkN2xJclRnQi9mSzgrNWoy?=
 =?utf-8?B?d3Z3angrbU4rTVlYaG1ienA5MTF4d3FVYW9TMEVvYzVkOGE2VGRINzA2Y2hY?=
 =?utf-8?B?ZWJ3QVo1djlKMEhoaXA4bmhYdXh5Qjl4djdrYUNqZkl0bC9EOWhBWGNpR1FI?=
 =?utf-8?B?dGtUKzJzY3d1TE1PUTZ3cGg5ZW9HV3Z2djJCN2ozVDdHNzM2UHBscEEwUlMv?=
 =?utf-8?B?R25OWGhlK0FTblZicXJuU1JBMmFqK0RkamQvVnZCZXhIa3lFYXlEKzVNd0xq?=
 =?utf-8?B?QkJhZmx4ZlZVUVBVRHBMSk5TRkU2V2UzeVRQSW5nWVMySXkxSkQ4cmJoVHVK?=
 =?utf-8?B?ZG5CQ1BMVktEdXZtRytzT0g0UndnVE16QUdZelRkMmR2eDJsUGZaOE5BalR1?=
 =?utf-8?B?ckZtb0d6MytuVmJ4RjQ1ZTBRQ3NJS0tIekF4cnRTejNPWmpHZEhlaU9XVit4?=
 =?utf-8?B?VDRLSGFmZ2JtUjFmTlFzWVpZclJpR1BhY1VudXQ4cXN4b0JtVlQ5T1Z6M2dR?=
 =?utf-8?B?ek56K3FWNjRQWjRBbVRsRlUrWkZ0bTRXYXlLTytwUjF4WWhUYXdMSnhTeUFI?=
 =?utf-8?B?VmhBL0puUE5MaERVNDl2MWc2ZzZkMW9OSER5dVQyS2gyaEdZeW1NVnRpbmU5?=
 =?utf-8?B?bDg1YXZqYjZPRmtmN29QdGlvTWU2ZDRDTmVlL2UzNENzdHIzZ0hza29YdkxO?=
 =?utf-8?B?TUZiUkJudHJ3WTJHV09WZ0UwOEQ3VlVWRjA4bmhqNGF2eGxwMHhjQUJ0Q3VE?=
 =?utf-8?B?b0c4akVpVzlJVWl3a3dXd0Exbk0ycHBxY3B3bDN6a29selRNRVc2Q0JJSzZ4?=
 =?utf-8?B?YnF0Y1RSc3J1ZXZUS3ZhOE8xRzlqRDZ1WDZabndkVEEwRE9zLytUYWNUa2lr?=
 =?utf-8?B?WHNsQmJSUGlodVNTT01UNDNGajdOZTBReXFSWFhMWWNPUWlzTGRqUlVwRkdo?=
 =?utf-8?B?RnRjVGJVV1UwLytocnRxV0dvbGZ3TFVGeC93V3BzQUJnRDMyRWhocVdwaHVp?=
 =?utf-8?B?ZTczMTYzVFl0RGVBMExOZk9Ic2pNOUh5R2N4WXV6ZWRaTGpCbGxXd0NFVjB4?=
 =?utf-8?B?dStxcE9jQ1gycEdOdGxaYUhvdnBybkJKLzRsS2RZZHY5S0JtTFNmZEk0WUV0?=
 =?utf-8?B?Q2FHTG5oTFRoSEdOMG9sME8xR3o0cURzT0hpMllZU2t4MnlNSTNxdkxtYlph?=
 =?utf-8?B?ZW56OGZvNVl6bHdRRUtzYVhZdC9iVGpBaXdPWlBTdEZHNk44MXpBMUxIODhi?=
 =?utf-8?B?czJDcjlTNzdETGF4dVIyWUNFY0tyTGlhVyt5OXBzNEFkSUxQdi9lREN4MFVZ?=
 =?utf-8?B?QVVqbG4xdkFLU0RwVi9vVVF6YWNJSnNsVHdCVnlYSmFwMDhDblplTG9TbGYv?=
 =?utf-8?B?UHNwTnRNN2xZSXVVOEpBRHAwOFNpNTRRbnE0eWdHM1UyOFh2OXFBaFUycGxN?=
 =?utf-8?B?QzRYTEF0am1XYURoOG1rVGMwb2NhM3pPaERwVW96aTRSZUVudGZjNm5YUSsz?=
 =?utf-8?B?bFh2NHk5VzdjeGx6ZXVUYkQ3L2xIVHgwemJjdVVWU252RjdRYTM0alRTeVdo?=
 =?utf-8?B?aXVBQnFleWJjWVRCVkI4QkU1Z3R6RndyNWJ0NjZhSWQzTC8zOHUwV25qN2hB?=
 =?utf-8?B?V3RJTzErQkhubWpvVS9CcXhINDYvSXJkdXY5RzBsQXRIUVBacnNuUGhMeTJK?=
 =?utf-8?B?eWFyUTRSUTRLQm9QSVB5VllmUmV5c1pzZUlOckRWODRCdk9WRk1sU0xnTEZu?=
 =?utf-8?B?VUUzWFBhZTRWTWZCS3hWeXlNUnVpT3B2NDVTNFBQUlVKZEo3alM2Vmo4cWNJ?=
 =?utf-8?B?bTFvNVIvRi9JYXpiVXZRcFR3QlEwVUExZjZnNW9lUENlWUUyZ1pwTlVhcUp6?=
 =?utf-8?B?dEpNNldDanVqTk1GcFFrczZKWGU3M1ZzVDJVZGszelY3aHd6VEJPUHBuamRS?=
 =?utf-8?Q?O3SHxIwLgMrTQOxAUTT5ugZl0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 191f183e-7c0a-4295-9592-08da761c703e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 13:22:54.2689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YVOImhE3R1CRBceYoYxdbWAuwwbhuxYRD+4RHEAuASbOU1GhB7LgWk2Wns5Qho6hBsjTBMT2wryTQi3JN+7mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2854

Hi Stefano,

It works. :)

On 29/07/2022 01:05, Stefano Stabellini wrote:
> Disable xen,enhanced because we don't use PV drivers in this test and
> also because the kernel used for testing is old and unpatched and would
> break if xen,enhanced is passed.
>
> This patch unbreaks gitlab-ci.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>

Tested-by: Ayan Kumar Halder <ayankuma@amd.com>

> ---
>   automation/scripts/qemu-smoke-arm64.sh | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> index 898398196a..e6f1510c0f 100755
> --- a/automation/scripts/qemu-smoke-arm64.sh
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -84,6 +84,7 @@ NUM_DOMUS=1
>   DOMU_KERNEL[0]="Image"
>   DOMU_RAMDISK[0]="initrd"
>   DOMU_MEM[0]="256"
> +DOMU_ENHANCED[0]=0
>   
>   LOAD_CMD="tftpb"
>   UBOOT_SOURCE="boot.source"

