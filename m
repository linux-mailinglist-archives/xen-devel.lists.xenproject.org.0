Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EA334A966
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 15:16:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101858.195105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPnG1-0004Tl-Dm; Fri, 26 Mar 2021 14:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101858.195105; Fri, 26 Mar 2021 14:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPnG1-0004TM-AJ; Fri, 26 Mar 2021 14:16:13 +0000
Received: by outflank-mailman (input) for mailman id 101858;
 Fri, 26 Mar 2021 14:16:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVU4=IY=amd.com=thomas.lendacky@srs-us1.protection.inumbo.net>)
 id 1lPnFz-0004TH-PP
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:16:11 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e8a::618])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35b15f68-447b-4754-b68b-20a472b2789e;
 Fri, 26 Mar 2021 14:16:10 +0000 (UTC)
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM6PR12MB3082.namprd12.prod.outlook.com (2603:10b6:5:11b::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.29; Fri, 26 Mar 2021 14:16:07 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::c9b6:a9ce:b253:db70]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::c9b6:a9ce:b253:db70%6]) with mapi id 15.20.3955.027; Fri, 26 Mar 2021
 14:16:07 +0000
Received: from office-linux.texastahm.com (67.79.209.213) by
 SN6PR04CA0098.namprd04.prod.outlook.com (2603:10b6:805:f2::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Fri, 26 Mar 2021 14:16:06 +0000
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
X-Inumbo-ID: 35b15f68-447b-4754-b68b-20a472b2789e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZC9otA5g2mDB20qGi7QNQ8MxvsQq/m/gf+a1qnyhnxjxHdd4Yh/uBChVjoJrlFjfvmnYLpb/RPCaPYDLZ70YbawU4mOKuLbXSWbwdr7rH8yYsHx2zB86JpFwHf1KQ0azf5XCq2meK/4nKcaAl40S/Cu2NgCBm6aM+iyNMshmsf3Fd6RFlJMmM9Tb1gr0tJsAtaXBEfd+yUNwLSKoOj88EmbS+74x2jC5yN+2rxPXTSmdZPv3d/xbgbUuGPcDaBfAqFe2W+4vE5YMt4KYcv5W20PqX+Yx9avUGP2+QXcVOh1V8ghXRnAPZTDowUhRFpmeLYG9rHGoXetl6mdC2KiLsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX89sLHWd/73HhmUvv2w153fQonSprl22X6LtZB8ubA=;
 b=fop+SaP3cURItncBk7fRc5ivSR6SKg9QV7QKWX8fH/D1VbwDYmpxeHtGtK+i5G7C/3vav1NayjfupWGakFFi7dPzsLFIJ0hV6pc39lsx7Qx3WrDYNhfDtMyq3jton2Am9QS0W6gcmmQzirvYr3Fmb/QsJWO1ndlAkGPVSD7eR1b5gMRK83iqaDM06h5+87G363b5b1KcCQtKDkFvCnBBoVsnt6wWymtTV9yg+7gnPYxlJ0BP5xI3ukeJs3SI2qDXQBe51ZJbzdYHg71eHbuBI+RLElqyp4VQ1bwc5K23OjI4NXLv+j5VjXui/liS29y18cgFoPKApKdkwpxwARzqtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX89sLHWd/73HhmUvv2w153fQonSprl22X6LtZB8ubA=;
 b=RIkGXXklqz8VKTh7nb044vK7WyGAEZQH+l/AKqp+0rU8YNJjfCigVwF4FxyVmoX+OJ5lO1vK3Vyiv3+OH1C8GOI+1L4dzoIcuAxrTF+H9FwpmpWZEM6CsAIHZKSzJz8Vvgniys3qT3u/ahAGRheHYEAknHubZFZgstH9qzXJ3Do=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Subject: Re: [PATCH v2 4/7] OvmfPkg/IndustryStandard: Introduce PageTable.h
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
Cc: xen-devel@lists.xenproject.org, Jordan Justen
 <jordan.l.justen@intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Laszlo Ersek <lersek@redhat.com>, Julien Grall <julien@xen.org>,
 Brijesh Singh <brijesh.singh@amd.com>
References: <20210325154713.670104-1-anthony.perard@citrix.com>
 <20210325154713.670104-5-anthony.perard@citrix.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <90eb3caa-2116-e665-7dde-3fc7198409f2@amd.com>
Date: Fri, 26 Mar 2021 09:16:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210325154713.670104-5-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SN6PR04CA0098.namprd04.prod.outlook.com
 (2603:10b6:805:f2::39) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3fbc1895-1a6a-4516-4ab4-08d8f061b25b
X-MS-TrafficTypeDiagnostic: DM6PR12MB3082:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DM6PR12MB3082353DB3AE5AC387CECB23EC619@DM6PR12MB3082.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	St3U24wg0P/0i+5LyvSJwo0gD0FYHy31jX/c5phowPHquF/4YsCd5dTU5ZkLVv0GoSwkiM3UcADWQ00na63vdD9yz1qNT+h3zNx3KXct8Mo5fSKT/J9vvGNXN2bcXAqeH17G27IseyQSyJf8XE6CHryacj5HQ/DCSxepKOPDuey9UjdKXtI+66tGlENY9nWRzrc9p/SZhWOtvjl1g2qlS59sdwIk6W56WkCytvMnbYfTjUtEsesDqN6+Yq7JGKSvqRCDrefA3/hIj3Va7Z7WLCuVmhXo1SHaxEtodmoz9kdbS7R/efv+pTweYhzehwn0AXK6IrGZRmOtzrE6EGAYvTshOocvcFM8gApqfXeEqetdkar9HEppzcIc7hLG48lIwI/6BawzpqB1EOrfoqarYD8/+sUKQfZRVGbMRwNs692u5TmakHRsbBUGXTKs0N8mKF7Mieko6m56+W6LtqcUzFfGvl7wDYlQeZeOZYVLVYuDZPGw1wtQEpy0hs+I2fcWSefRuXV8Lwi8jQ7G0nmVnqMtg07FLA2JFeiqFJY5Cj2pP7v6ZxRf3yHmZfIODwynl7o5GV1UGLUHYfhjmTGq0E7o+lv6LPBnYRF5IWKLwne0EWbLRxGhLGjV4UzUeK8dB6zxrI9IBKy1hyxkBA+ZcsOnSaMxyBhqmeCCnkYgsY0AnmNHiwMGfmOYAe0y/1LPv1ktE5GUvvKpSDnEjgU8OeMqkIrjPNcEvsC6l/mK6WiooGWiHtOsCLXxeGBM3adb4mbrHzUJZw6iv7bvPDwQt7jphj2rKaymAJLtqo9u7d53Ke1I04GCeKecAYtK9Wn4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1355.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(86362001)(8676002)(956004)(6486002)(8936002)(31686004)(2616005)(2906002)(54906003)(6512007)(16526019)(38100700001)(53546011)(31696002)(6506007)(5660300002)(83380400001)(19627235002)(26005)(4326008)(66556008)(478600001)(316002)(66946007)(186003)(36756003)(66476007)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?Ujg4Y1JsajZ2TW9pZ1BuWm51NUlQblpVR0k1R3JjcFpxRy9BMjBPdFV3YWZH?=
 =?utf-8?B?SWEvL0JQUC8xRU5tcjlLVmtLbU1vU1FVWENPQ1N1SStDTTBCV3pBNEVGU0xr?=
 =?utf-8?B?T21RaHJucEUzRlM1bzNveEh1dTNYZHZ1ZFF0U1BVYUlORzVnc215eXBpNGw1?=
 =?utf-8?B?Z1BmQk8rL0kxYjhxVmlWZjlqRWtnT0tQTjZYMkJZOEl0aXRSV2lKVjh5NEFD?=
 =?utf-8?B?SDNLS0tlRU05bURmN25lTHRZc2pQZlpydmVNUWRnZ2N3VnBUbU9raEZtMHdS?=
 =?utf-8?B?QU9YVDhCZzJsK0l0VWNUc0FCbm9xZk8ySVoya3Nub3lKdTVCS213d29RN0Ry?=
 =?utf-8?B?WjBTdkF2ZFYzbWJ2cHd2RUxQNjcvL2xkWTNSbUlubmFzSGpDNEwxMjZTSEgr?=
 =?utf-8?B?RXo0cjZGT1ZvWXB4K3JlREpHS1VyYVZtamt2QncxOWtxcTlGYS9SclI4ZUU5?=
 =?utf-8?B?VE9MQnlQSE5HVnd0VEZUZXpkd0U2RzFkVU9oTUx3RE0yRlM1SDZrNldEMXBN?=
 =?utf-8?B?a1BxT0Z1aVp6QWVUTkJ1dDkwWUcxcXNXY3FScGhELy9MSzh2bkxpa2xsNG9j?=
 =?utf-8?B?aWRaNTVPT0g4ZGQyVmVMU2V0emlTMDNQa0tsaHFsZWNZellCZm5UbVREbXh5?=
 =?utf-8?B?Q1VjYTM5NlRoQ2IxN25PSVBpbktPRkcrSEtjM2J5QVNYNzlFQVc2cVVTU1Nr?=
 =?utf-8?B?dW9DQnlpY2RNTXdVK2EwMHhHY3lmU0ZiU1lWcGRhV1IvSFdwQWpCVnZvRDNX?=
 =?utf-8?B?UnU5cElpZjhGRW5US1dvc0dyZlVuRFB0TlZMQ2h3a05qcnRXeVgrUkhsUDhZ?=
 =?utf-8?B?MU10K1VjNTI1SXcrWXUwNEVNczdJczlURDhXN3VrWklrMjRPVE5Gb2s3WE9C?=
 =?utf-8?B?Uy94Tk1jc2tVbjVyYng4c0VBUnBzY2lXM0FvUXpMWjR6MlRUWlllOFA1WDQz?=
 =?utf-8?B?MndET25FMitNTDhYVXQ1ckFqZS95Y2tTWFRmOC91ZnVPWndJQTVSYjRFYWxx?=
 =?utf-8?B?ZzZpZzZBbWpLQk1iUUNielJWMFBmdFJzZTJpS09qai9keWdEZTdaRUlySitQ?=
 =?utf-8?B?MHZ6WWM3UVB2VjZwcCtNUUc5Ymg4UmhjZnpDN0FPbXY5VHhTNDlWL241dytI?=
 =?utf-8?B?b1hMNmp0UlJvRXI2dXYwY2g3VC9NUWlXMW02Q2hsMnpTTGFOSGNwT1FCRlpB?=
 =?utf-8?B?MW9LY1duMkpJdEwxYysvQUIwbnZGcU5NcU9wOXJvNmE0Y0t2ZVJJdExWUHov?=
 =?utf-8?B?MExQbmNjK0NxbkMxazRHRDZDNmUxbUlvVE9TbEdXemVvYW5DdjViS2hKUVNu?=
 =?utf-8?B?MkRNWXN4T3BaTzVpY29PRGVhTWZ6QUZxaGhQb0Ewa1BKY3MzV21GL3Nybkw1?=
 =?utf-8?B?QnBUbXhaSGFxdWY3OWs0Y0paa3pEK0pnalRsaTZsZHFDVVQvWmtyM1pvVE02?=
 =?utf-8?B?T004RVdWeC91SHRZakdQdHY0SjRaeFRrNGlsN3AvRmFvOHVNQUQ5R1pydVRm?=
 =?utf-8?B?dFBEdmJ6clQ1VWlXWlBHSWtLbU42UkMyMGZwRkZxY1dGVzlReWh5NC9xTjJj?=
 =?utf-8?B?QzgyaXhXdmRiWXBBTGxyTWE3RHphSUlOWE90ZzhPMDIxdi9IdUUrelV5VFZr?=
 =?utf-8?B?ZVNYTzBnVVhMVXNmZDJmYzdsclZQUDB2aE9keVVSUncxRlVCc2tHTzhoQnNL?=
 =?utf-8?B?ODQ1MFU0bDI1a3pyaXoyeTZabklOTlIzVW0xVHBWZFlvV2Z4QkdROWdXcGth?=
 =?utf-8?Q?RE3/Oz228LSM4dOiDhsklmxpsVrp2yXCFTbpn67?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbc1895-1a6a-4516-4ab4-08d8f061b25b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 14:16:06.9515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RfZUBYh35QtejxXijajR9mslXpCyNJ/EGHeo9NvMKhlCb0ibmhKBhkkzOQ3MouRHwWyb7aNBg1Z/OtYWok6Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3082

On 3/25/21 10:47 AM, Anthony PERARD wrote:
> We are going to use the page table structure in yet another place,
> collect the types and macro that can be used from another module
> rather that making yet another copy.
> 
> Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=2490
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

This begs the question of whether there should be only one version of this
header file, now. There are still copies in other places, but maybe that
can be a future cleanup? I'll leave that decision to Laszlo.

With one minor comment below, otherwise:

Acked-by: Tom Lendacky <thomas.lendacky@amd.com>

> ---
> CC: Tom Lendacky <thomas.lendacky@amd.com>
> CC: Brijesh Singh <brijesh.singh@amd.com>
> ---
> 
> Notes:
>     v2:
>     - new patch
> 
>  .../IndustryStandard/PageTable.h}             | 117 +-------------
>  .../BaseMemEncryptSevLib/X64/VirtualMemory.h  | 143 +-----------------
>  2 files changed, 5 insertions(+), 255 deletions(-)
>  copy OvmfPkg/{Library/BaseMemEncryptSevLib/X64/VirtualMemory.h => Include/IndustryStandard/PageTable.h} (60%)
> 

...

> diff --git a/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h b/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h
> index 996f94f07ebb..b621d811ca6f 100644
> --- a/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h
> +++ b/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h
> @@ -20,151 +20,10 @@
>  #include <Library/DebugLib.h>
>  #include <Library/MemoryAllocationLib.h>
>  #include <Uefi.h>
> +#include <IndustryStandard/PageTable.h>

Typically, these are preferred to be in sorted order.

Thanks,
Tom

>  
>  #define SYS_CODE64_SEL 0x38
>  

