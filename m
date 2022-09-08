Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 530DA5B1812
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 11:09:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402963.644921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDXV-0002ak-FL; Thu, 08 Sep 2022 09:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402963.644921; Thu, 08 Sep 2022 09:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDXV-0002XL-Bw; Thu, 08 Sep 2022 09:09:37 +0000
Received: by outflank-mailman (input) for mailman id 402963;
 Thu, 08 Sep 2022 09:09:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8AK6=ZL=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oWDXT-0002WC-QO
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 09:09:35 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3efa4c8-2f55-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 11:09:34 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 8 Sep
 2022 09:09:31 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f%7]) with mapi id 15.20.5588.016; Thu, 8 Sep 2022
 09:09:31 +0000
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
X-Inumbo-ID: f3efa4c8-2f55-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwnCI2teHWcYpXtscT/aaWFg5elCwpWdHOtDueDd+H8FILaO5qT9pOx0mHzW4JNr2a/iwgwNjtv9iRnD2n7Qa4jzTlDkRdzm1N2VTsIDOtQrj2OhRQe2zHwT7FTT0DSPBNGH75nnzNtb5nvnMC7jgauQp0yffgJwN/3cnudL8yRnmCXzWal0KLt1m/N4bzSSQeTn9VAuATVi75HWu0qQ67Yh00h/OJ0TlluaP7PM8sN2D3oqeEl5PxF8Q18r7G3BlcaC6Zt9y9l6iETrStJAOZ8zOOXlcN10+Qk2/xRRAPLjjem0TnGzskvIKDKDy4HjD949Y7Mv35A2Nr/Wu3Rd0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BikOgYtUVL77xF+jLHmle+BEGw+kNHXT+lHOznmxu3o=;
 b=Ce6Jrt6/omn3gRHnMNlNFYnP8usz9kqNl8n8c38x32TRU0RSu5BJWh516MenwNKtxcvWb3dxEYZK/cm0AEe9Zaw4WstNE5ufmzrHnviF9Nd2lVvZACTXMJZVDN3KWElpjgke6AHZLL1UoKvwFTwHcEQwNRvePOetqoYH+hBW7bKovqaOS8eN7E7vRXLcqIR8it9HP5GVBXJFfQNPCt0n+WmcjTrz+GVOaZ/FQ47r2+Ws1fA9K2EUphbQlTFiE2XSmUPT53p0Aj54Y4ObNJM9PDo8SWrL+xliYAvOhz663WRSEPXzBUechPIs78KdNq9ySmyEJj0jFfPLwcR2WvXKow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BikOgYtUVL77xF+jLHmle+BEGw+kNHXT+lHOznmxu3o=;
 b=HTWyeVC5FfCXa0GsIvimrqJaMuOcvpE6ysUGyxIc5sDmDZKjqF48SK8RZNdByVP1w5X61x96DWGjGDoQ6ertePjO5e9xE6jWF4NSRFIPQ8k9a3oftyK4isR/B7WfFEOgQP87V7YUL/yapmuk/ErHvzLm5dDKO4MNNVoAFSW1tuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <fa52fd5f-7c49-c873-0884-980a904c230b@amd.com>
Date: Thu, 8 Sep 2022 10:09:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [for-4.17 2/3] automation: qemu-smoke-arm64: Silence ifconfig
 error messages
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220902070905.1262-1-michal.orzel@amd.com>
 <20220902070905.1262-3-michal.orzel@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20220902070905.1262-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0026.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::14)
 To SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64719357-8525-4de0-b1dc-08da9179d6cd
X-MS-TrafficTypeDiagnostic: BY5PR12MB4902:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rwS6HFmAPVh48vRIMi7p+Dmhp0qm19KGXlRIpo4WHs7d1b2J8n/6ZwYKldFeBn0OnmZ4u67DeHaNbPJ00CO1Hy/BPNnlHjRFY2qPurx6Hb9iEN1wPVEDHyqYUSXfNMlaO10Do2gT/079K3gQQWDAPwylUytOygXg3xptk5V1NaAoxIfS79i9JEH3Cg0Lb1kby0utUsxPrlYcOjFrfsx0lHCvH9adNLIRCWx8rk7faDbrH6KfL1gzSL79epTpML7/3hFvw4DBgdV/LcoCJJ3fop0mLG8HoPJKL3+n27O9vS1rnk3LAWLEBngDjRw5hJZ7/vXt5uovisaFQcjPNpz6nd/wygutqg+HG60hqdP740zt6mMNySYrgQV0ubvBZFalVc7oeaaxP10aiGYagWkXsK0bYoU5rLVVbsWC27zUPsekQhWz4El2zNoblOZixNK1/JRx17RxjnFfwRhD5jNV3JHJUyuY40g3H2EoXI+gQkRQyiSGJ9oCLFJvgfRjn35nIgm4UQVlNb57Y2yz6+CYhwu740arhAsuGmhL9XHrLpe6OHoriPh+ORVRjmOwgff0e2IuViD0+/6PmGbC5BIxrqzla2wQ/inEbK8tNev6GcZGB9LVVm+NA6U7M1m4m0qJ/YLzy9JMkljMW4Wo/MlgOPHFCU1kIKiMhyhMTNaCBpNfFG19IHQbfrpzE6/VcpPLYXBqGpuDrJIHodEEcspzk69nVYjazDgfSKLtkkB4vmtJlvAqQwp3y3Te14LpDkszedikXxZC7MvNvT1DkVKHzLuIF/Or5BJwtmrJagS23mU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(5660300002)(54906003)(316002)(38100700002)(31686004)(41300700001)(6506007)(36756003)(2616005)(186003)(66476007)(478600001)(15650500001)(53546011)(8936002)(31696002)(66946007)(2906002)(26005)(6512007)(6666004)(6486002)(8676002)(66556008)(4326008)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUFuYlpFS2JjVmdtcE44TmRuYlNGQTRjTEZVYTNWeEphTmNTaU1LVzZGRENH?=
 =?utf-8?B?cjdNV2lpT2xQU0x3V0Y1QUg2TzNySWtoMDc5eU4yNUtMMzdIVHUrV0svbE5x?=
 =?utf-8?B?UWc0SEszS2hlc1M4Tzl4aDdpcnA3MVZxVGxRREp0V2FZc2VLODFlYU8vU1FS?=
 =?utf-8?B?RXQrcmFHSC9uTENxT1RvTjN2UFIzSHk1RENRSzE0QzQrV242SU4zTEs2ZThP?=
 =?utf-8?B?akN4YjdqQzY5WS9wdEpub05SOWo5T3FUMFdRNWJnTU5YRGlwVEFwSG5TcHQ2?=
 =?utf-8?B?L1J3Tk9Sd0s0a3o0cDhZMGRwdlljMFc1azNKZ05WOEZjbDc0cVYxSGRuYXNP?=
 =?utf-8?B?Z2R0NTNYMVBHNE5kM2hFODVmZlFBVVNlOHlCc21FQksxTks4OXNVMkNoeHhm?=
 =?utf-8?B?U3ZjaGFoRHpBZEVncUROblQ5VzJ4MkE5MU1mRDZSb3hWY24rSlMwaWxTZURO?=
 =?utf-8?B?ZjdSWUpHVW1zZHRXdGgyUHl5WCtpdTBqZjdkZXBDd2RvZ1hXQmxOeDBScDBa?=
 =?utf-8?B?aHRiTElyRlNRdElvWEhnVEFPcXVaN0FzaURFVDlOaENNcmVOZnY0UUdrbTlQ?=
 =?utf-8?B?anlBbjRyc1hON3R0UHJKWmxJRXp1OEpZc2lzN2xkMFdLZFZQcEROSGVsQjlu?=
 =?utf-8?B?R1Fiai9iTFFkSmZVeVpSelgvY0xJWFVJSG9WUHJtZGNBSXdlOTJyaWFZRHJW?=
 =?utf-8?B?RFdyY000bzBZOXUwM2xJNzNOdlVoZ25OSlBiWDZianU0amRkT0gyczN1bXBK?=
 =?utf-8?B?cEU0REdsYXd4MkI4YTlFU2wxMGRTSDNCK0ovTGFmYmFPcDB0VjNMeVI1Skhv?=
 =?utf-8?B?OTZZekdIRVpKUVBkTGZoclBRNGxYdEZVWnkvczlyblBzcURWa1ExUE5uSXFZ?=
 =?utf-8?B?bUZnazZ2ZHh0eGlsNSsyaWFra0g4dGRqTHMxK29idzhFdkRMaG91N21SdlBj?=
 =?utf-8?B?UlIxeHVtL1pDZ2xSK1VKZW9FOTZOdEcvY05IQzU4OGRISDRYZWoxa1pBOUd6?=
 =?utf-8?B?QStLd1Azb2JBbEhhYnY2NTA5WmExMnkzMno5cjVWV1NXa2ZEMVM0bk51Ni83?=
 =?utf-8?B?ajEwOEhWellaa2JzRHNOYndKRXlrSGo0SDhOL08vVDdYZ0pTY3gxUE9hR1lN?=
 =?utf-8?B?S0l1N3ZubkNFSC9QT0hvWVRiK1g3MHhCakdCMGpxdDlMUXpTVWIvSWFYY0Fi?=
 =?utf-8?B?RHg5MWlzYmRwVFdhZUtKcDlxSjVDeGR6V1JhZTlQU3cyWVdiUW9ibVFpUHJT?=
 =?utf-8?B?SnpENWV5b0h6OW5ENnlONm1wZkVoZityVTFYTEFwZW0xMUlxMHF0SXowQjdM?=
 =?utf-8?B?TVZ4UzhqZWNaTjdza0Y1N1pGakw4c0RpSGlYYmxNUmw0SFI0ckkxdHl1TEdj?=
 =?utf-8?B?QUlDN3BBdzhaT2NDMGZRYi9CVzRaQndZbnloZ1c0VnJhSXdGdXo0NCtqbWRJ?=
 =?utf-8?B?NkxFRVVuNy9uYVJZZ3FIdnk3azA0SldJSkVFRlBXR0VNUzFLK2pDNWxucUt5?=
 =?utf-8?B?QVAweEJaMW8vUW1QTXlvWTZqTlNWTGZVc3ZBcFp6VFhDeHdPRFp6aEZraEVI?=
 =?utf-8?B?dXNoaE01aFZaaEpSNTdRaU5GYWpXMnJad3JkMm85Y2k0ZEl1Yk11a3hnWVhQ?=
 =?utf-8?B?OGl3Z2xHaDNQY3IzN3VnWTg2VTZLL2NmL2lYS3NRWWE4THFWU0RVU0RsYWhn?=
 =?utf-8?B?TDBnZGVweTExTUpNbU5la00yNTVvN2VaVFM4WEQwL05DS0h6OUFaa2RETzhm?=
 =?utf-8?B?UjVpVlRzYVl0SWZnZmpIcHZlNm0rQ3c0WU9laHpTald0Q1ErZjdGUTFrQ05D?=
 =?utf-8?B?dWNySVR4OU9Na2F2M25ReERoaS9UdEZYTWdxdUxLTHAybzRhZVFiMURxNGdQ?=
 =?utf-8?B?Ny8rRXZWb3h1WFVmWFhnTVpRTFhGVXg4OExMKzYxVkRtSGpFZWFXTE5zVUVW?=
 =?utf-8?B?UGZrUHpIT2ZJMThNbm5OUFgxQzdDKzl4cWlKenYwYWF2MHpiOTJJR3FMVHRZ?=
 =?utf-8?B?Z1Qrdng1QXo2d1lKSkhHaWtzSUc1TUM2Mkg5YWlBcS9pbk4vMWJxcVhTZlF3?=
 =?utf-8?B?enhEbkQra25RNVQ4VGVxVWJIL0ZWTmtNSUlxVktMTFl4WjVHMklnNElJVkE5?=
 =?utf-8?Q?gfQE1evuH4R0sRgcI4GAZldX7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64719357-8525-4de0-b1dc-08da9179d6cd
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 09:09:30.9252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8dhkNBSZsKlhJHgrP0BIwFNK6DZNb/59teUasBSlkXTpz+gZcyq6GSlupPTg4YN8bLP1bq+0OqNcgTFu3xL3tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4902


On 02/09/2022 08:09, Michal Orzel wrote:
> During the ping test, dom1 tries to assign an ip to eth0 in a loop.
> Before setting up the network interface by dom0, this results in
> printing the following error message several times:
> (XEN) DOM1: ifconfig: SIOCSIFADDR: No such device
>
> Silence this by redirecting stderr/stdout to /dev/null as we do not
> care about the output and we should not pollute the log file.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   automation/scripts/qemu-smoke-arm64.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> index c80d9b2aee00..7ac96027760d 100755
> --- a/automation/scripts/qemu-smoke-arm64.sh
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -6,7 +6,7 @@ test_variant=$1
>   
>   passed="passed"
>   check="
> -until ifconfig eth0 192.168.0.2 && ping -c 10 192.168.0.1; do
> +until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1; do
>       sleep 30
>   done
>   echo \"${passed}\"

