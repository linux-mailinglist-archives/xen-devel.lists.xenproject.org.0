Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A006B5B5E6F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 18:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405943.648367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXmVA-0003js-Qp; Mon, 12 Sep 2022 16:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405943.648367; Mon, 12 Sep 2022 16:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXmVA-0003h6-O0; Mon, 12 Sep 2022 16:41:40 +0000
Received: by outflank-mailman (input) for mailman id 405943;
 Mon, 12 Sep 2022 16:41:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUhb=ZP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oXmV9-0003h0-GR
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 16:41:39 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c45cf1bd-32b9-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 18:41:37 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BL0PR12MB4881.namprd12.prod.outlook.com (2603:10b6:208:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Mon, 12 Sep
 2022 16:41:34 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f%7]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 16:41:34 +0000
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
X-Inumbo-ID: c45cf1bd-32b9-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnaZf5s3836ASX61JRso23FJAu3hzZ1J53SCl8yAcxIsrNOSOQcx19fLa7B1ijyAPiaHA56f7883Z3nQDYM2sW6xlGXXp0yP4dVKudPFqsZp2sEKbhdCRrr/ApQc3lF4zcs/AQVRHIwKT3xh84KzcSscTi7xxZXvZVhs7sDkCZaAYPJqiKQwwSSKXAqkwQlgcwZz1nsUsQY2L3MbYX1msArvOM9sHTGEgI9kSeaUJnDQIgnI6ApPCblsgaUkg2wvGpqwOthPILP8FHFXuhzGzjqVhT5NTLU7uBRtuji+PfLeolS5ebX6YykR4AXwUATT/taAi8M5sI4pVSqRLkXtWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvdGQAgT8wcsWoOOAirWtXjeIJ1Wk2SHhu09KgIVbvs=;
 b=eOm94mW8jhczIVnK6Cxsu5Rz6q0LV5cT3ZdOPox6YOnKkAN/1bMH7W/f++iUmokh3pqFBnQhc4MdKJxjjdLe1iwQDfJwt+wQTYCV5CKUvqdLTb8CB3teR82o9JZJG3PjPkfjmA/4NSlscoi4Nuu+iCy0wGsNUlRPNZ/Fk2+bjGNWChvRcjgDM5HLuXOQW7lCcFL5cA4zv3tiNStLnXJTN015s5cCMJMYtrI7ymngu+ektRqYBgCNMr4klEYB1TihmwhfDkg97+O8vRycNKUN4mDt4LexMLVp3W0evYpQ3dU6tpkiCUI/LgizscPQOwvnfX5Fdg0ED8CmqWTnnvmejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvdGQAgT8wcsWoOOAirWtXjeIJ1Wk2SHhu09KgIVbvs=;
 b=J7wp3fkx+e9iLA0P+JgwHtrvXg7CwI4XRHOhV7fsjn0Gtk96Bs5VMDUfoiIOqh2CYLE2faH54IXLXTsPqQi4dpqEKmwz8U3UtLAtMO2OLZ4LLwVRhxcMJutN5/ic2HTXwQ8Rlx/mkl2CVx/DbcIUVc102HxcpvLhiV5QGBe6Lbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <276bd45d-7ab8-fc5d-a065-df6188b4f42f@amd.com>
Date: Mon, 12 Sep 2022 17:41:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [ImageBuilder 2/2] Add support for lopper to generate partial dts
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
References: <20220912115934.19552-1-michal.orzel@amd.com>
 <20220912115934.19552-3-michal.orzel@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20220912115934.19552-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::32) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BL0PR12MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d479750-2b56-4ece-a4e3-08da94dda71f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WU2aru2OcFK3kfkHL6C3wbuwLrLiBBAoRqmevp0gjQrqI7UwiOQ3CcyH2lzl6wKPI7nfGinf2occ716MoTPZIL/82wkW1dz6Q39oUaKa4o+RoOiwqXHc4ujTIsk3mnmgAyBEjLk30jHpduAR+mGjhoGPe2hiQbP5nO5TqrUJ7FMuNll/If57EmMvnLqGLVHbK1J5XMiKbXdca4QmaGDzYfK9k+8SCa8az5xxj+AAYaD0JG25EF9Zqw7jiNAiKXQfqr68vTuxvtgfENEyNUBLAjMFRXRhm+X3iNqrhQLFxtwFvVKLNIU28fzWmxTJ9i1ztOlrxrhT7lLSXKGtLS7BCvBk3ATuUOzvChuDB4NZrWmtqF0UYRXBm1ZNambyA5AoUjFhOdhzd16Ypu/Wg64BhPW9L3sW9OzG/ZjnIYQ7x8n92a7ZKkay6CGQ1ud4SRPmMnRCeZ2Ivn3HyvwE/uPFQAsQmyenuY5fKkltARwz0OsSbHbAdpexBCx6UIVE4R4VOQNtQo6sir9twgjmJ7tQ/B83hoj7q3Nv+NntgdfU0OQ55NoynXtDPGcoXBrxAXdSrApJalhmF0uSJ99MZmby1kEvo+LTtsLcp/6P6kxwtcwlLBS590dalEepeCWlJ8AY0ubyX2UH9sSkwj8TLpbAPTusThGeD/+ky3Qia4nGcoH4GmVWHOx5yGAl0pd5YDaMMRd5UeLGMQPDgLUnCxt3FoOoQMcxES5febgoIFwxoO3olpUpcIUU/kC8KTza9GdJrCzbXO1NNS9ZelEdaXGyAfvqN/+EnH1z5Oh1MXjsEHjLbKxkJNRFLP0A8fjS20on
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230017)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(66476007)(4326008)(8676002)(66556008)(5660300002)(186003)(6506007)(478600001)(26005)(2616005)(53546011)(41300700001)(6512007)(6666004)(2906002)(6486002)(66946007)(83380400001)(316002)(31686004)(31696002)(8936002)(36756003)(38100700002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGd5bi9tVWlML0E5WUJaQ1NFS0NOK2ZtbzMwR3ErOVA1Q0xZZThXc3B2eGZi?=
 =?utf-8?B?OEpDSkl0TmtrL1NINDNFdkNmQlJxZGkxQ2VBVjh1N05WLzZXV0l6dFZPaGEz?=
 =?utf-8?B?ZW9nNGx6RzAxWXpTOFhqK3orVXROUUNIanNtNVFzZUJQNnE5b1UvY2tIWkdi?=
 =?utf-8?B?WHByVTkyU1J2aHA5T3RHNnFVeHBhMDNDZ3BzZmYvNFVwcUNkazZpbHEyZUo1?=
 =?utf-8?B?QWpqQjYyYm9BSkFCR0dneldINEJSUFU4WHNaRzZSZ0tHWVdzZFlhVUxHb1ZV?=
 =?utf-8?B?UlRQaGE5dXFVMDd4SzRjekpMZU9nVE90SjRNNWRQT1RKUkNXUkpnQUQ0S1ow?=
 =?utf-8?B?ZmVoVjBmUWpvcUlXMWk2d0pXQ29yMEFFOCtFWThIYjZUdkY1QlQycjF5OWZN?=
 =?utf-8?B?dDlyTUJqUEJpczZCUUVWWmh6RStvM2Fma2kwQkZTc1NORWZIOEFTRGY2WHNK?=
 =?utf-8?B?dS9WWU4vVmVUSllpQXFsWlFGNzlXYWZnZ1A4bmUrdDdQRDhoK3BtMEpmcnVz?=
 =?utf-8?B?SjAvaHB1ZzJ0elZkWk5kKzVFOGcwUzRvS1hQc3lMTURxMWxERWV1M0hiVkVQ?=
 =?utf-8?B?UUZOZ2hBQkovaE1qaVl2d2lhRm4zVGRVWlM2U2s4QVM1UW1nQ3lZUTZwaTRy?=
 =?utf-8?B?aGMrVTdTREtHRURIVEp4YnZ5WVQxYXZCQzNVakpvTW1PbkJaRExoSDl1QmFo?=
 =?utf-8?B?MEJYMTNNanRxTE9pc2FPc3huMVRDcmg1RTIwbnZxVjlCd25SNHpvU0UyS2Fo?=
 =?utf-8?B?QlE0YTBIS1lsL1RlTUZXRnRVdlplMnFNWThDTEFGWDNFVzA4dnlCMWg4MUh2?=
 =?utf-8?B?aUhwVTFBV211Z0VrRGtJQ3liK0ljRHk5dW9jbEN1THFWbEhRT280TURzUEZS?=
 =?utf-8?B?UGdjaHUyWldFejVUM2dob0hDSUVHOGYyamI3UEpHMm5KVFNyOVQxRFBiWHBt?=
 =?utf-8?B?a3I0emQwdHkxdHdYMXBuTEhpbVBDQVQ1dGhtOFYzU3BEMTdNMmNqOVdLOHRW?=
 =?utf-8?B?aExZUUpSczdlTkM2UE1CNFEvYyt2ZXpCbTdCSXAxL1JvQ0Z1WUsrUzdyTnlh?=
 =?utf-8?B?L2tJSW9lWnY2OG9OMVN6SHNHYS84d1h5K0p1dzRXOGk1SjRMRVgyU3hUMlFm?=
 =?utf-8?B?WjFTZGN1MnhwSDFmK2lBNnNPMStTeGpId1lrUFVSeWpta3pFUHBkV241Vk9P?=
 =?utf-8?B?czY0bzdiVDZoMVVXamN3MXVDcjZwQzh3RGl1UThuUWFpZjU4elpSZ1dRRlZ3?=
 =?utf-8?B?Ry9LM3cyTnU2bzd0dHBSOEZEK2VjOE5ENjQ5SEtyZTNWcS9SZXg4bDdNeE4x?=
 =?utf-8?B?Qm9XSzVwYU90dWtMZkRtUXZ6S1Z0RW55bUhlWWhtTnUzYWdaME1HM1FTUzVW?=
 =?utf-8?B?Uzh6VUg3dnFOWEpGTmx1V014K0NyZEVldmczL09GL2hwdnhKWGxzbm5FME5o?=
 =?utf-8?B?VEE3a1VGMjF2czNwS2ZMdzVtM1o4alN6QWNrK1EybUNkMyt0cjc2bWRFZlBP?=
 =?utf-8?B?eVRYWWF1b05BWlRaazlkNXNHR1BPNUdRbUpwUS9Ja2xUbWZ5U094ckhXbitl?=
 =?utf-8?B?SE1xSzR2UE9hcGp1bGRBTWl5Y0doRVplazdGVGlNSFRZdVphZ2k4Y3QrVk1R?=
 =?utf-8?B?b3FHOUozbGVOWEI2Rmx1YldYekdIbk5rZU03OEtXRkpybDJnbUEzdktydGZZ?=
 =?utf-8?B?dEVnKzZ2Wlp6U1JhWkZxYTNrVExUbno5aWt6V0VWOHo0dk5aN1JtQ0lLT1Bt?=
 =?utf-8?B?NHJWS24vRWh1NDZlRkcwQmFCZENkRnlIbFdIWC9jYXIyOVEvTldQYU1SZ1FM?=
 =?utf-8?B?UDlIaXM4ZkNyZnlsOWZIT1NzalFqUmh3ZzN5WVhxTXZEeStPTXlva3JmVE1C?=
 =?utf-8?B?aHpQbGxXaGxGS1p5L0hYT1crTjZDcUVBeVRrUkVZUllGVUlySlpkUTNuNGZj?=
 =?utf-8?B?YkIwMm5wQVlmVFpEbkJ0cFpFYWxSeVVRcEZrQ1dIa2N2V1dyVkxZNWk4UW1T?=
 =?utf-8?B?WHZicGZkMi8vWGtqc3FiQWU4bFNFWDJHQkQvL1ZQTTFhbnREMkZZMW9UUHRO?=
 =?utf-8?B?eGZsY3hJQnJkWkhIWHIxdW53amIvNDhPT3JCc0U0M3NydzllditJb09vNDdK?=
 =?utf-8?Q?i+rAJ34dTXmtjHuICfr89GrBO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d479750-2b56-4ece-a4e3-08da94dda71f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 16:41:34.1242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJWJqDzgbKhnGoYT9SqvvAqIKD11XLPqfesueDnJkT6dDpaVG+7A9C5Onf9zUgihKAB2k5PBSdhwiXExuMrnsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4881

Hi Michal,

On 12/09/2022 12:59, Michal Orzel wrote:
> Currently ImageBuilder can compile and merge partial dts obtained from
> a repository specified using PASSTHROUGH_DTS_REPO. With the recent
> changes done in the lopper, we can use it to generate partial dts
> automatically (to some extent as this is still an early support).
>
> Introduce LOPPER_PATH option to specify a path to a lopper.py script,
> that if set, will invoke lopper to generate partial dts for the
> passthrough devices specified in DOMU_PASSTHROUGH_PATHS.
>
> Introduce LOPPER_CMD option to specify custom command line arguments
> (if needed) for lopper's extract assist.
>
> Example usage:
> LOPPER_PATH="/home/user/lopper/lopper.py"
> DOMU_PASSTHROUGH_PATHS[0]="/axi/spi@ff0f0000 /axi/serial@ff010000"
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   README.md                | 22 ++++++++++++--
>   scripts/common           | 64 ++++++++++++++++++++++++++++++----------
>   scripts/uboot-script-gen | 17 +++++++++--
>   3 files changed, 83 insertions(+), 20 deletions(-)
>
> diff --git a/README.md b/README.md
> index da9ba788a3bf..aaee0939b589 100644
> --- a/README.md
> +++ b/README.md
> @@ -128,6 +128,19 @@ Where:
>   - DT_OVERLAY[number] specifies the path to the hosts device tree overlays
>     to be added at boot time in u-boot
>   
> +- LOPPER_PATH specifies the path to lopper.py script. This is optional.
> +  However, if this is specified, then DOMU_PASSTHROUGH_PATHS[number] need
> +  to be specified. uboot-script-gen will invoke lopper to generate the partial
> +  device trees which have been specified in DOMU_PASSTHROUGH_PATHS[number].
> +  This option is currently in experimental state as the corresponding lopper
> +  changes are still in an early support state.
> +
> +- LOPPER_CMD specifies the command line arguments for lopper's extract assist.
> +  This is optional and only applicable when LOPPER_PATH is specified. Only to be
> +  used to specify which nodes to include (using -i <node_name>) and which
> +  nodes/properties to exclude (using -x <regex>). If not set at all, the default
> +  one is used applicable for ZynqMP MPSoC boards.

You are using some more arguments (besides -x and -i) :-

--permissive -f
-- extract -t
-- extract-xen -t $node -o

It will be good to have some explaination for these. See my comments below.

> +
>   - NUM_DOMUS specifies how many Dom0-less DomUs to load
>   
>   - DOMU_KERNEL[number] specifies the DomU kernel to use.
> @@ -140,7 +153,7 @@ Where:
>   - DOMU_PASSTHROUGH_PATHS[number] specifies the passthrough devices (
>     separated by spaces). It adds "xen,passthrough" to the corresponding
>     dtb nodes in xen device tree blob.
> -  This option is valid in the following two cases:
> +  This option is valid in the following cases:
>   
>     1. When PASSTHROUGH_DTS_REPO is provided.
>     With this option, the partial device trees (corresponding to the
> @@ -149,7 +162,12 @@ Where:
>     Note it assumes that the names of the partial device trees will match
>     to the names of the devices specified here.
>   
> -  2. When DOMU_NOBOOT[number] is provided. In this case, it will only
> +  2. When LOPPER_PATH is provided.
> +  With this option, the partial device trees (corresponding to the
> +  passthrough devices) are generated by the lopper and then compiled and merged
> +  by ImageBuilder to be used as DOMU[number] device tree blob.
> +
> +  3. When DOMU_NOBOOT[number] is provided. In this case, it will only
>     add "xen,passthrough" as mentioned before.
>   
>   - DOMU_PASSTHROUGH_DTB[number] specifies the passthrough device trees
> diff --git a/scripts/common b/scripts/common
> index ccad03d82b30..680c5090cd07 100644
> --- a/scripts/common
> +++ b/scripts/common
> @@ -9,6 +9,9 @@
>   # - NUM_DOMUS
>   # - DOMU_PASSTHROUGH_PATHS
>   # - DOMU_PASSTHROUGH_DTB
> +# - LOPPER_PATH
> +# - LOPPER_CMD
> +# - DEVICE_TREE
>   
>   tmp_files=()
>   tmp_dirs=()
> @@ -99,31 +102,41 @@ function compile_merge_partial_dts()
>       local tmp
>       local tmpdts
>       local file
> +    local node
>       local i
>       local j
>   
> -    if [[ "$repo" =~ .*@.*:.* ]]
> +    if test "$repo"
>       then
> -        tmp=`mktemp -d`
> -        tmp_dirs+=($tmp)
> -
> -        echo "Cloning git repo \"$git_repo\""
> -        git clone "$repo" $tmp
> -        if test $? -ne 0
> +        # Partial dts will be obtained from PASSTHROUGH_DTS_REPO
> +        if [[ "$repo" =~ .*@.*:.* ]]
>           then
> -            echo "Error occurred while cloning \"$git_repo\""
> -            return 1
> -        fi
> +            tmp=`mktemp -d`
> +            tmp_dirs+=($tmp)
>   
> -        repo=$tmp
> -    fi
> +            echo "Cloning git repo \"$git_repo\""
> +            git clone "$repo" $tmp
> +            if test $? -ne 0
> +            then
> +                echo "Error occurred while cloning \"$git_repo\""
> +                return 1
> +            fi
>   
> -    if test -z "$dir"
> -    then
> -        dir="."
> +            repo=$tmp
> +        fi
> +
> +        if test -z "$dir"
> +        then
> +            dir="."
> +        fi
> +        partial_dts_dir="$repo"/"$dir"
> +    else
> +        # Partial dts will be generated by the lopper
> +        tmp=`mktemp -d`
> +        tmp_dirs+=($tmp)
> +        partial_dts_dir="$tmp"
>       fi
>   
> -    partial_dts_dir="$repo"/"$dir"
>       i=0
>       while test $i -lt $NUM_DOMUS
>       do
> @@ -133,6 +146,25 @@ function compile_merge_partial_dts()
>               return 1
>           fi
>   
> +        if test -z "$repo"
> +        then
> +            # Generate partial dts using lopper
> +            for devpath in ${DOMU_PASSTHROUGH_PATHS[$i]}
> +            do
> +                node=${devpath##*/}
> +                file="$partial_dts_dir"/"$node".dts
> +
> +                $LOPPER_PATH --permissive -f $DEVICE_TREE \
> +                -- extract -t $devpath $LOPPER_CMD \
> +                -- extract-xen -t $node -o $file
See below comment. Applies here as well.
> +
> +                if test $? -ne 0
> +                then
> +                    return 1
> +                fi
> +            done
> +        fi
> +
>           sanity_check_partial_dts "${DOMU_PASSTHROUGH_PATHS[$i]}" "$partial_dts_dir"
>           if test $? -ne 0
>           then
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 1f8ab5ffd193..84a68d6bd0b0 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -1138,10 +1138,23 @@ fi
>   # tftp or move the files to a partition
>   cd "$uboot_dir"
>   
> -if test "$PASSTHROUGH_DTS_REPO"
> +# If both PASSTHROUGH_DTS_REPO and LOPPER_PATH options are specified,
> +# the former takes precedence because the partial device trees are already
> +# created (probably tested), hence the reliability is higher than using lopper.
> +if test "$PASSTHROUGH_DTS_REPO" || test "$LOPPER_PATH"
>   then
>       output_dir=`mktemp -d "partial-dtbs-XXX"`
> -    compile_merge_partial_dts $output_dir "$PASSTHROUGH_DTS_REPO"
> +    if test "$PASSTHROUGH_DTS_REPO"
> +    then
> +        compile_merge_partial_dts $output_dir "$PASSTHROUGH_DTS_REPO"
> +    else
> +        if test -z "$LOPPER_CMD"
> +        then
> +            # Default for ZynqMP MPSoC
> +            LOPPER_CMD="-i zynqmp-firmware -x interrupt-controller -x pinctrl -x power-domains -x resets -x current-speed"

It will be very useful, if you could provide the link to Lopper's README 
which explains the arguments used here, as a comment.

Even better if you can provide some explaination (as a comment) to what 
the command intends to do here.

- Ayan

> +        fi
> +        compile_merge_partial_dts $output_dir
> +    fi
>       if test $? -ne 0
>       then
>           # Remove the output dir holding the partial dtbs in case of any error

