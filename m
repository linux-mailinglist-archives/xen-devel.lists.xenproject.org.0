Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9F568360C
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 20:06:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487801.755494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMvxl-0005fW-MM; Tue, 31 Jan 2023 19:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487801.755494; Tue, 31 Jan 2023 19:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMvxl-0005cy-IO; Tue, 31 Jan 2023 19:06:37 +0000
Received: by outflank-mailman (input) for mailman id 487801;
 Tue, 31 Jan 2023 19:06:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLqc=54=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pMvxj-0005cr-Lz
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 19:06:35 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fe7def2-a19a-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 20:06:33 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MW3PR12MB4361.namprd12.prod.outlook.com (2603:10b6:303:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 19:06:30 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%4]) with mapi id 15.20.6043.033; Tue, 31 Jan 2023
 19:06:30 +0000
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
X-Inumbo-ID: 5fe7def2-a19a-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQfWn5FA+1MdkskmnhwQdUIdQxceUbt6HqskG0z8z87flIYSfQ13d0xlEmuDhDqr4NXekfMcS3eD5rPQlaPT8kFuV2gXrjM7TYZ1vUICXMxjFNif+z8Jj4z+GDnhy/C83vXu7kWECOfrw2Y+qflPENduMngpLcOe/SblWNzwFwNPypVzKrNhAP8YE/Qot0WnxXZ4XoqOteSIO28bpkCqTnprn0zO+jisgtG2G8U6XgNDVojYM3A3JLbelbDZK+VnkojfQTqjpLrvXmH7261tOGG2/YJJO+/wKBa+sIR5+Sn0Lofq5vBT0hPN1FB7vxtiO+IxCPLkPQV6v5vi3RbFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfs+Jw+AZDDZLywDFBsgLDNnL1HYAAULn8BdHPceX7U=;
 b=eJ+sQMw0M7yLUj3cuuZFsso2SsT+8/6xY5DDrxhx+zW7wUGna01v+CldXTVejJE04aiwyBKSp5oKpYy/23zf1rj+IFfwwL+wTwZBiol53RflrueZN0clyeV5WEhHcuMGRBCyn/td53u8QoOEZNWkP8Mpum425HpgjwlAnfBm+hI/L7SKx25RvZgOOpAb4tEXNbYol7pZeuoEI+tVA/QSZYj24lg8gXZRBPaLBgwXiohg6cc9mwrAKjCMPrieAPNasEx3yU7u7zOjZljFn69qzw5x2hIScLhGDAF3K4KlnZXmRgehFvwdtW+exzFnxJY2UXvA37KOEvtDDj36ezLgVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfs+Jw+AZDDZLywDFBsgLDNnL1HYAAULn8BdHPceX7U=;
 b=zdbx7gFrxae43mHO9Qolx2M7xtBI1EUOcjugSQfSCh7wiR4mgwPUkTFyTCrF/n122zy09BwA2pwJ+xBcIT9PII78jIZ5BqvuqDO1lXyTPPJ0LcqXObM5fNdCZ0iUEOX1we8DV2qaUNsxRS/xdWFKu1Q6SJlunHo4t0mGZ78ci9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <03d7305b-00ea-481e-d097-fd5236bb03c5@amd.com>
Date: Tue, 31 Jan 2023 19:06:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] xen/arm: Add support for booting gzip compressed
 uImages
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230131151354.25943-1-michal.orzel@amd.com>
 <20230131151354.25943-3-michal.orzel@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230131151354.25943-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0492.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::17) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MW3PR12MB4361:EE_
X-MS-Office365-Filtering-Correlation-Id: 7052c4f0-dd96-4c6a-1f10-08db03be4296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8ym0IqbAgFIQlOnMBzNU+VOZDcKWDpkMhr/LHjMRU3gPEVWr6zFhMr+zzDPtQdgStlqXDdE9nvV/uHanyOnpGPfBkcMFzXhzp3HnaSyi+yYGNph+cbtUB/CPbOK9OXPx8zLcj1tUFqW5IqRlsJps4iZO5bXfZM2yK0xvzlGBVA94bNGDwNhaMWvHlsX34iS2nm1yE/QmIRUl1pg3qGmvu01K+ekzn98/lY3en3holJBhWSDuRX71Gv1VhseclCLfeHYV23tb/vjcagpvzDaB7HJi1d0pBAaWDRVZWzOC7sEYysu0uQT7epRfbLxqI5iK+YqZ3VEuHwFMOxh5xRXpxzraS/jrKoeVwExL4tby3GL8yr6e70MIGgX1xi/qeS7zrFs6gViW162EPAEgLR1LU2xj23jRdilVXemlycjXRcL/nVL7ki6qO4jnEKh4/vdw5CYgzNLRmoU9VVjkPEtU8uL38WWTAlQvwihnM39rTyWqmvXyig2lfyIoCSDFzogEhtdhKWqLU2AKepUTv07DJjT2M7yvvPYbf9DJylYkrElpwKvlNK4g89Dj2Uuszn/H8UWbAU8XIY4tdWNSvNdZsMjxuBEBPxEbV2++VO9ACAIFY7ajBTe2yuLG3ish59thkeLx/FAHUvoUu+WRNlmtcmzHFx4+TNHPXpHrwOsDKNbcnPXFGmAXuJd+0TZwuPAjP1Qblh19yMQOjxpzcDcFz/L7rWYKlw/C9Y8qJJ0yhXI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199018)(31686004)(2906002)(6512007)(5660300002)(8936002)(83380400001)(41300700001)(66946007)(6666004)(6506007)(53546011)(54906003)(36756003)(66556008)(8676002)(4326008)(66476007)(478600001)(186003)(26005)(6486002)(38100700002)(2616005)(31696002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmpRV0kxbU91R1FpbEVzVXFuQmNlOHZmNUtiNFltQ255d3ZSMEpRL0FBQjMy?=
 =?utf-8?B?NmhXNEtPRTFIZzRSM2ZSS3gySTlualpMb2dodDBEbWN2L1NodVFoMW8wY1pW?=
 =?utf-8?B?R2dOTmV4ZzdFNjJiQ1dlM1R3L1dwZUFBblNCOTZ5S2x0Qi91UDhRM2RPMDdC?=
 =?utf-8?B?emRwM1V0b2Q1QTAvalFwbmJQOC80WlNobG5SVzJRQ0t5UGFnei9ibTR6Ym1H?=
 =?utf-8?B?YWRiek5HWnVSMzlkUG9kblJCblRONitoSllsTUt5NkpwdW9ra0NJV1JNakZU?=
 =?utf-8?B?dE12SElSUHpJckdEQzVTek1wNXV4Ym94YnJ5aDgrQkIxZHZaV0RnS3F1OFl2?=
 =?utf-8?B?UU1mWFFSN3MwT2c5NkYrOFhiUFhYTmlOdVlmemhwY1hMbFp4d3Q5djc1am9l?=
 =?utf-8?B?QVdWTHpUWmY5bFlpbmNTWmd5VmJoRFVPQzVOcExTaElDZ2xVUDRJcGd0a2Rq?=
 =?utf-8?B?aS9idlh3Y0RiazdLeURMRHdDZlBnRWs0Ym1QL2lhMGIvRHM4Si9Wb014RVlT?=
 =?utf-8?B?M3QzZTVhWWlYMTFpQWVnbk9EWGpiZzNHTHJJTW1qMUxvOVYrVWhrZXpya2l1?=
 =?utf-8?B?S1h4L0dTL0p1RC9VVE9ueEsyZTU1bVdzUENxNlAxOG5YUFlVanBLOEU2dVht?=
 =?utf-8?B?RnQ2d1RXSm5OM280Z3puNU5lMTNtckVib0NScUZvZmc0a3lVVHBML21nMUdu?=
 =?utf-8?B?bEpzbGxkdFVrWlpCMm5RWUxoYldUUG5Vd2o5Y1ZySXp0VHNPMjF2K05qT0ZQ?=
 =?utf-8?B?SFJhRmNLNWtCSk5NcDMzNXNHV0o2WlRsbXA1VTVsbVNma3g0NnVKR3h5Rk9R?=
 =?utf-8?B?aHl6Q2l6blNMWVNzbVJPK2ZHWDhyaDN1VVFPMlFPNnNaT09PTHZ3c0xlUG9K?=
 =?utf-8?B?RVA3ZGNzN3MwRS9nU2g0MlZGd1NBSHEyRGxGL2l5WStkRjhxSlFKMDNNZWZT?=
 =?utf-8?B?QUdFVFhqb1RPNU9BNlNVdmVJK0pCOFBTUE4vMTRiUndkNEpwUHdVQXVteW1X?=
 =?utf-8?B?dW1ablNUakhwZDZkdHVnSmR1dFlHMllEK2tUV3BCa2tlSEFveWVubXU0bE10?=
 =?utf-8?B?V2lpcG9NeDltSEZucndqMFhkbkFHenpFYnh0bC90K28wSHJxbjJ0SDVTUGl5?=
 =?utf-8?B?bldyMExjbjJPRGE3eWNOWHJCMG5yek5SQ04rVjdnelEzbXRaZVVSd2p6cnBD?=
 =?utf-8?B?dUdUcGVlcUJya1ZDR0ZYQzNmbk9KdEJzMXo1V0g3eDQ2RVU2K2ZwZVkrYjIr?=
 =?utf-8?B?Y25neU9rcTFIbk56RnpESnJpUVB4MnNlWFhpdnF0MjZRZm15WlhqM3JUNU9E?=
 =?utf-8?B?T3RFcGRGbWlGcEthUTFHbUEzTDVFbHdOQlRUZ0w3NmNLcWFFS0tISUl4cFda?=
 =?utf-8?B?SWxzd0xmdjNUQlFVMkdIUnNJOExzNkpBL3JPeFowQ3VaN3IxZ2Q3a1NvV3ZN?=
 =?utf-8?B?OHo5aVF4ZDFONk5BSjFhNHJQWm56cGE2QnVWaGxaeDF4S2xpYkVKbUxQVDh2?=
 =?utf-8?B?VUgzcklNY09PUE1mb01wUHI5djFzR1RuTktYWUtSZEdWRnFBdGR6dG82TmpM?=
 =?utf-8?B?c3ZOc25BdFJvZnRaMkI4R3VWNGlaQVNKWDhLa3ljSjNHQkpqMFFGWHVJUHpE?=
 =?utf-8?B?aG93QUlqbENCSmg3d3VhK0pJZU16NWtRVzRnNFpwL1ZWWXhLdGR2ZFNIQ3lS?=
 =?utf-8?B?bDhodmtIUS8zbm8veEljcmRGTkozdmwwcVlJNFp5Yzg5eC9VVTFTZVphaHll?=
 =?utf-8?B?UlN6STA4NC9VWjYvbWkvME8wT21QenpGQVBxSUhaa1lPM093SDE1Ujl5U0Nj?=
 =?utf-8?B?UmhlYmNCYmphYzVHSW5vUktqS3ZQY2NtWmZ5NHZaR2lFK2o2dzRrTW9zL1Er?=
 =?utf-8?B?aWVWYTZ1ZzV6cFpaL1gxa2JKRGk3RWVoa2MxL090czlRV2pMdGEvYkRuakVn?=
 =?utf-8?B?elJrZHlzbVFiVDlhQUVsQVdyRFI2YkR2LzFqQWhmeGNpeDB3TUNyOUZKRUw2?=
 =?utf-8?B?c3hYQW1ldkZQWFArMStnTkJ6N3k2eGo4VlF0NmxSTktFRzhvN2lRbitEZCtx?=
 =?utf-8?B?OFpOS2JZMCtYSkh0TEsydERieGhKUEppQnBCODh0cHBTazFYWVR2THYzMmJB?=
 =?utf-8?Q?cmuWAlkJ1G5WjYc0mkrZs+L+A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7052c4f0-dd96-4c6a-1f10-08db03be4296
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 19:06:30.0579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5DznlDx4rl5/feMuRiyuyFEZ1kiNQ/7bj9IjxjtkqSo91urBPGpN09MsLNQ+jOLKoQJQog1dsxDqVdUgQVfug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361


On 31/01/2023 15:13, Michal Orzel wrote:
> At the moment, Xen does not support booting gzip compressed uImages.
> This is because we are trying to decompress the kernel before probing
> the u-boot header. This leads to a failure as the header always appears
> at the top of the image (and therefore obscuring the gzip header).
>
> Move the call to kernel_uimage_probe before kernel_decompress and make
> the function self-containing by taking the following actions:
>   - take a pointer to struct bootmodule as a parameter,
>   - check the comp field of a u-boot header to determine compression type,
>   - in case of compressed image, modify boot module start address and size
>     by taking the header size into account and call kernel_decompress,
>   - set up zimage.{kernel_addr,len} accordingly,
>   - return -ENOENT in case of a u-boot header not found to distinguish it
>     amongst other return values and make it the only case for falling
>     through to try to probe other image types.
>
> This is done to avoid splitting the uImage probing into 2 stages (executed
> before and after decompression) which otherwise would be necessary to
> properly update boot module start and size before decompression and
> zimage.{kernel_addr,len} afterwards.
>
> Remove the limitation from the booting.txt documentation.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
LGTM, Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   docs/misc/arm/booting.txt |  3 ---
>   xen/arch/arm/kernel.c     | 51 ++++++++++++++++++++++++++++++++++-----
>   2 files changed, 45 insertions(+), 9 deletions(-)
>
> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
> index bd7bfe7f284a..02f7bb65ec6d 100644
> --- a/docs/misc/arm/booting.txt
> +++ b/docs/misc/arm/booting.txt
> @@ -50,9 +50,6 @@ Also, it is to be noted that if user provides the legacy image header on
>   top of zImage or Image header, then Xen uses the attributes of legacy
>   image header to determine the load address, entry point, etc.
>   
> -Known limitation: compressed kernels with a uboot headers are not
> -working.
> -
>   
>   Firmware/bootloader requirements
>   --------------------------------
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 068fbf88e492..ea5f9618169e 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -265,11 +265,14 @@ static __init int kernel_decompress(struct bootmodule *mod)
>   #define IH_ARCH_ARM             2       /* ARM          */
>   #define IH_ARCH_ARM64           22      /* ARM64        */
>   
> +/* uImage Compression Types */
> +#define IH_COMP_GZIP            1
> +
>   /*
>    * Check if the image is a uImage and setup kernel_info
>    */
>   static int __init kernel_uimage_probe(struct kernel_info *info,
> -                                      paddr_t addr, paddr_t size)
> +                                      struct bootmodule *mod)
>   {
>       struct {
>           __be32 magic;   /* Image Header Magic Number */
> @@ -287,6 +290,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>       } uimage;
>   
>       uint32_t len;
> +    paddr_t addr = mod->start;
> +    paddr_t size = mod->size;
>   
>       if ( size < sizeof(uimage) )
>           return -EINVAL;
> @@ -294,13 +299,21 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>       copy_from_paddr(&uimage, addr, sizeof(uimage));
>   
>       if ( be32_to_cpu(uimage.magic) != UIMAGE_MAGIC )
> -        return -EINVAL;
> +        return -ENOENT;
>   
>       len = be32_to_cpu(uimage.size);
>   
>       if ( len > size - sizeof(uimage) )
>           return -EINVAL;
>   
> +    /* Only gzip compression is supported. */
> +    if ( uimage.comp && uimage.comp != IH_COMP_GZIP )
> +    {
> +        printk(XENLOG_ERR
> +               "Unsupported uImage compression type %"PRIu8"\n", uimage.comp);
> +        return -EOPNOTSUPP;
> +    }
> +
>       info->zimage.start = be32_to_cpu(uimage.load);
>       info->entry = be32_to_cpu(uimage.ep);
>   
> @@ -330,8 +343,26 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>           return -EINVAL;
>       }
>   
> -    info->zimage.kernel_addr = addr + sizeof(uimage);
> -    info->zimage.len = len;
> +    if ( uimage.comp )
> +    {
> +        int rc;
> +
> +        /* Prepare start and size for decompression. */
> +        mod->start += sizeof(uimage);
> +        mod->size -= sizeof(uimage);
> +
> +        rc = kernel_decompress(mod);
> +        if ( rc )
> +            return rc;
> +
> +        info->zimage.kernel_addr = mod->start;
> +        info->zimage.len = mod->size;
> +    }
> +    else
> +    {
> +        info->zimage.kernel_addr = addr + sizeof(uimage);
> +        info->zimage.len = len;
> +    }
>   
>       info->load = kernel_zimage_load;
>   
> @@ -561,6 +592,16 @@ int __init kernel_probe(struct kernel_info *info,
>           printk("Loading ramdisk from boot module @ %"PRIpaddr"\n",
>                  info->initrd_bootmodule->start);
>   
> +    /*
> +     * uImage header always appears at the top of the image (even compressed),
> +     * so it needs to be probed first. Note that in case of compressed uImage,
> +     * kernel_decompress is called from kernel_uimage_probe making the function
> +     * self-containing (i.e. fall through only in case of a header not found).
> +    */
> +    rc = kernel_uimage_probe(info, mod);
> +    if ( rc != -ENOENT )
> +        return rc;
> +
>       /* if it is a gzip'ed image, 32bit or 64bit, uncompress it */
>       rc = kernel_decompress(mod);
I think the disadvantage of this approach is that kernel_decompress() 
now needs to be called from 2 different places. But, I think it is still 
preferable over splitting the

kernel_uimage_probe() function.

>       if ( rc && rc != -EINVAL )
> @@ -570,8 +611,6 @@ int __init kernel_probe(struct kernel_info *info,
>       rc = kernel_zimage64_probe(info, mod->start, mod->size);
>       if (rc < 0)
>   #endif
> -        rc = kernel_uimage_probe(info, mod->start, mod->size);
> -    if (rc < 0)
>           rc = kernel_zimage32_probe(info, mod->start, mod->size);
>   
>       return rc;
- Ayan

