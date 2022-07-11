Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D1F570518
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 16:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365153.595247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAu5r-0001qv-Ih; Mon, 11 Jul 2022 14:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365153.595247; Mon, 11 Jul 2022 14:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAu5r-0001nw-Fi; Mon, 11 Jul 2022 14:08:59 +0000
Received: by outflank-mailman (input) for mailman id 365153;
 Mon, 11 Jul 2022 14:08:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oAu5p-0001nq-VP
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 14:08:57 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00078.outbound.protection.outlook.com [40.107.0.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0097d3fa-0123-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 16:08:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB8042.eurprd04.prod.outlook.com (2603:10a6:10:1e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Mon, 11 Jul
 2022 14:08:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 14:08:55 +0000
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
X-Inumbo-ID: 0097d3fa-0123-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T52cG7fu2tQeZdAXimk5K275jLyaF6WcXgm4ImqUKS9OoiUYsk1qNm4AEs+5EKW8aDk6lUveXvBcFwyOW7IPRaKTc05GFCtcWecrcrkbM0WzpEe0uNUAx8gub9W6xFy+yM0fnx3f0OtN5YAv3dsjyCq6qCMfgajukjF/rPcPC37v65ppE9wcUwlQXRMzGBaUIFu/RYvRE3fPVNfrhQWgfrxF4ZWyuxxqCj7FDMXyYIuhxOwQ8aMPEEEzu6iJ5HIjUom8KiikKTQQjZAuXpq7BNBBaVJivV6Tsrsk3qvrcuWTr6rbLOUv+mk6fomiRoYX4sGyKIC5U29iiOTKC/rQcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sj9oFkingfdtvKPcRBxSTLyW6PnodPV3R8KwLJ0PWeA=;
 b=CUHWLTxAYaXVyLxu3yPAep03LiRaPT+i8nEhxlZOEio/gFN9rf2i7/YDI4W8GWetY8r9QmZWR9bDtFqCnLo8nQvsnRgSUraMGczUA2VGlsBj5BQuzPA/Sh8IXDe4BjWwF/GNxdaWHya7ITPdrW/ZqTbzBa243kNI6EmOJzKcJ9jcf7Td3Z5BTx8sfM7IhHGrrHXZeLRUdV0zjMiTQqYECzMzRWlVIUvSf2NQYMgyvPhvnm8iXuRHYtzLDP0GAMsWeU/yrlDcLFfwikYcRkfnXZVSDuTZwfNtyTswvqxZuwxzJ/ZknIFXp1PLSwy8SEDZS9xdSPp4cuihGfRA0DsTKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sj9oFkingfdtvKPcRBxSTLyW6PnodPV3R8KwLJ0PWeA=;
 b=MYOGaJ8E4xBl1GrzCioD8JKGLtGneOCEuVx8UEC0o6Y0NhDnoSw49sAxaj6Agol5gWDOJGOSpIKwGUD/hFKmpiJxA8QWOczsKb7VOKxh8Q4bGhDZSS4eReA0umcHKF0Y//aELjxMjT4e53sF0U5PtaakwoEmyJJZp6OkNwdgBmMvkfPQqxmsuqqUuPdj2jXPKYy6/vS4HtRLIAvT0j9xfb0vbuVhVOALXleenQQrZBLO4YJsKY54Gk+x+AoIHp+iRvZfuX1HzWa4CNk2lQTiFnBhCzyRsxKr+tzw7ISbMlmHPu3U/OyzAlFj3v5KLoq6Zyb5FkAGX1ElUFHt+42nWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d917d9a6-5ab7-f826-21e0-2c95b4614f9c@suse.com>
Date: Mon, 11 Jul 2022 16:08:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN PATCH v3 06/25] tools/fuzz/x86_instruction_emulator: rework
 makefile
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-7-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220624160422.53457-7-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5f5ed12-c9b0-4c7f-23dc-08da6346e3cb
X-MS-TrafficTypeDiagnostic: DBBPR04MB8042:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PrHKhPfDGyixuuqvbGlnF3COynMzrgVmkTc5qdjquLdjFiVZRu63wF9czYk66nQTq1382oPXMPubQgj7VvLkmlqARmAPqoBYWYwO8P7Pat1M+m2YxmYycE//BonNOgZcMjYnhpx9gENb5PcVKyu/pvwkQWPBYgclP6NHBV4iA/RQqBLZb29/9N24tPlzSsVVhEyFFWPYbnpUr+mTwpKgu+1dTG2ejmjxg07jPA48/qkkw02HFkkTA4MdlVoCGzQkQEFreuqdSLakvEhdIi34JB9Ev4KwK4/uIhHX8RgUye5alzBJB3a9w4YW80HAcrqOHxz9dPgYwRGkLgMkuGqkV+Mahd/SqWEvTlTvLa6JZQA3TG6jKGKfFmiwnmcDUGjbFmcUAv0Lj7PLSj6u7/0R5EOJITZPz/pihV8Xw2Wx6eODTvnwrScpgC67VZvbmrrUAgSo3GdJLoFJDP1mdIFAbh9TQnJ0S3DRrR4njdMmQFWTfWmid5tvo7x7YvQfvyVfi6X/Gi0x1o+aN3eYdeTNLApHyh0e8g5YSZCDN9J3PxZNLH+0nhJK8FqImn4Y14s77K3YjotuQktMX0MhcVAcyiFJXZVZhNYmLLJGpLSUWoNNB01Lwu/9ddvvS1ObjS9jSoZnjsG/FzOq+v34JJt1Ny5wRdyUMF1Y3kwlcT5pd/g5PWIzeu6Ivxd5y722/633uq9+KJn6pX+T/kHs2PGPv/5V4PpnTvHP2Bz2tPj5+gKJ9Ypj61MHfvX9Xps/kyEoNgWMdtbjLQe12OPDImApJPSvi7dMSPIRko1L0YitdjlgVnIrg1AreOc6sFJEEn15TsW85zv9O99YYIkCN+hFAhzQS/46BcJJRepm1MODY4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(376002)(396003)(136003)(366004)(2906002)(5660300002)(6506007)(53546011)(8936002)(6512007)(83380400001)(31686004)(478600001)(6486002)(4326008)(66946007)(66556008)(186003)(8676002)(6916009)(316002)(2616005)(66476007)(41300700001)(31696002)(36756003)(54906003)(26005)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUpSZG5nRERGVnE1VTJ5cHlKckJTcllnNXJQWENjelJqZGw4YlBBaVFvZmlJ?=
 =?utf-8?B?K0hvTFlPL1RlMStpS1AwbGx5T3FOQWpGWElWMHh4a0dkQW9xWlBadVhOKzd1?=
 =?utf-8?B?Yk4wMVdtTm0yQ1ByekFVNjNyTXJUTVpEaHlzUFJaZHkxU0h4UDNaL2FXWGtQ?=
 =?utf-8?B?TWVwaUlkdGtpaFNtNWlyQ0kzVFllOWV0K3libS82bEdrckRKcFlFSHJSdXE4?=
 =?utf-8?B?eHIyd0lIeGZCd3RjbXlNZ1JrRHhoeXg1b1dHN1BpYU5zem90MHR6bVZpVTVO?=
 =?utf-8?B?VHZjcHF6T1RpTTZoTlF3VGtyckZnWVROOGNaMmY0RHlBSHJxRERHaFBRZ1NL?=
 =?utf-8?B?UTR4YXQybzNCVzgxcnlkM24xMTZGU1dMYnRXOE0vQXZpZVdydHVIZmZpdXRP?=
 =?utf-8?B?cXhZRUVnWFM4cXZ5cHNJV0dMZGE0cHFNdUxsNWNyTEJsc2VEZUw2YzlGcysy?=
 =?utf-8?B?VTFJbTdPbFptNTJiaXpMMXBIYTc3ZUpua2taVElGVTFLUTBHU0dWR1Ftb0kv?=
 =?utf-8?B?dUV3RGFLWHd2RXFQSlBHdUdjYUV3aXRiT25zSGtqYnNmOWhXVUI2eDZsbmNG?=
 =?utf-8?B?bDVJb1FVVUJSc3dmcDQxbVZiaGNMZEFRREYvMUpRRzkwb3BKbkI4VStrVFgz?=
 =?utf-8?B?Y1VmTStGZ2poRERyM1p2b0liRFlqKzdnQWVFOFFZSGxKNndneGgxNStpZXkw?=
 =?utf-8?B?NVFIbzllcDVYVGdoOHQyN3IwMlFtL2FBdFJEWm95dUttaEJIWjNxQkZ2Sy91?=
 =?utf-8?B?VUJEajZOblRYUS8wTFVvVk5vMVQwb09CeUptUGIrUVdRMnplYlhCbXdYTmQr?=
 =?utf-8?B?YlB0MVpEUFpWNWpFZEtSK0N6cWQvWjJkTDF5bmJFanR2Rmc4OGZrUlNwN0R0?=
 =?utf-8?B?OU5seXlGbC9EMFAwY2xWMnRQa3FqYlZCRi92MFYyM0xYSlh6RHZUaTVNN3lD?=
 =?utf-8?B?S21RNkdYVGEvaFVZWFZybWprNHpJZjdvTFRJR1AwOVNtWHBRajNaQlF1Qlpz?=
 =?utf-8?B?bTUyNHdyVHM1ZStJOWprZldqbmhpb2hVZWFncnR0cU9pd0Q2cXBUaVFBYjRz?=
 =?utf-8?B?R25JdkNrR0d4eURJQkFZZE03dWNPekFOKzZZVFp5QUxCM09oZFIxWUl5VkFW?=
 =?utf-8?B?WHA5VitPTk44aVFGSkVpcFE1TjYxczJhNExnMGlCWWpWNXBZYitCTHFxaDN1?=
 =?utf-8?B?WTN4RStKTUJCV1ROeFpvM3I2U0FjK3dxWHVZamxxSG53WTFIaGFCQVRkclZi?=
 =?utf-8?B?MSsraGhORHFQMGQyWGtvd0YzQW0yZW5HejdCbytjckpKNWRNU3lsTUhLL2po?=
 =?utf-8?B?RW9sQlhNTmtmdzI3YmhHSkh4OHFtY3lmVzduNTRUcG1obVBMZnAwK25zZ1Rw?=
 =?utf-8?B?YTFMK2ZpVGJqY3hlMk50NEYzcDNoOVJLeURweVhCcnVkMjdnYjg3TUEzWkR1?=
 =?utf-8?B?OXRmZ3VKNUJ5L3VFUFN5Zm5WMnFuRzRrZDNXU1p0RE54OTVqNlluQmg5VTRn?=
 =?utf-8?B?MlgzRm9ROFNheU9sV1RxazFtS1BoVEV5NmgrRnpMSVhRUEZCUFF3RW1seU8z?=
 =?utf-8?B?eGFpb0FqR1Z2N0tudXJHa0lqalhhemlHcUdoWlEyL2JKamxpV3RKVVAraUhE?=
 =?utf-8?B?eWJPUzRVRVBpN0gyL2ZzRlh3VzcxVWZlc1Rvak9rb2xiNnVJQ3ZUVksvL1ZC?=
 =?utf-8?B?ZDFwSVZJYTQ5L2RaY290YXMyMXNWd2JSZDZ4OEdCdWZxdmQybG5PR0R3Z2Mr?=
 =?utf-8?B?N3JJdVQ4Q212OUUrelVGd3Z1SHVtYzlDVWNOOWkwald5Vkw4YTVsL25Da0tO?=
 =?utf-8?B?bldTaFkwMlFnRmt4WGhMaVF2RWE3UGxIcGtXRUkzUmk3TVdiTExmZXhVT1hr?=
 =?utf-8?B?dTl3VFJEb1ZpK0VTZ0UyRHUvL1gxS0owYmM1N2xZc0xDVnppd2dwT1FRSkp4?=
 =?utf-8?B?c2U1bEhoZkgrWmZqTGQ1NUlPK1BoVzBST0NPYlNMTzk4MUV0YkNjM2lsNGVS?=
 =?utf-8?B?M0Zla0lTZWV2dlJkbUdpWVFSRU45dUwzT2NqMlpzVHJLVmRZK2pGUGxEMTZW?=
 =?utf-8?B?ZVFWTFJDNVVPWDlEc2lFYnV5RUR4VldIZGMycng2RGJPV3hyWWtYSjNRSE5q?=
 =?utf-8?Q?iCW3xOBguM955IaMtgQDynvbO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f5ed12-c9b0-4c7f-23dc-08da6346e3cb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 14:08:54.8354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18JWPt9a4JXZExYRp/eCkU/dRQwOfqwqIWxz74gqaGXVWJHONZYufnbPvj9PYH8DkojzECWKHuBj94me/d0/ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8042

On 24.06.2022 18:04, Anthony PERARD wrote:
> --- a/tools/fuzz/x86_instruction_emulator/Makefile
> +++ b/tools/fuzz/x86_instruction_emulator/Makefile
> @@ -8,33 +8,27 @@ else
>  x86-insn-fuzz-all:
>  endif
>  
> -# Add libx86 to the build
> -vpath %.c $(XEN_ROOT)/xen/lib/x86
> +cpuid.c: %: $(XEN_ROOT)/xen/lib/x86/% FORCE
> +	ln -nsf $< $@

I guess the idea with the original construct was to allow using further
source files from libx86 with as little code churn as possible. Your
change now requires two more lines to be touched. As long as we avoid
name collisions in the various directories (wrapper.c and a few more
files come from yet somewhere else), couldn't this rule simply be

%.c: $(XEN_ROOT)/xen/lib/x86/%.c FORCE
	ln -nsf $< $@

?

> -x86_emulate:
> -	[ -L $@ ] || ln -sf $(XEN_ROOT)/xen/arch/x86/$@
> +x86_emulate: FORCE
> +	ln -nsf $(XEN_ROOT)/xen/arch/x86/$@
>  
>  x86_emulate/%: x86_emulate ;
>  
> -x86-emulate.c x86-emulate.h wrappers.c: %:
> -	[ -L $* ] || ln -sf $(XEN_ROOT)/tools/tests/x86_emulator/$*
> +x86-emulate.c x86-emulate.h wrappers.c: %: $(XEN_ROOT)/tools/tests/x86_emulator/% FORCE
> +	ln -nsf $< $@

And similarly

%.c: $(XEN_ROOT)/tools/tests/x86_emulator/%.c FORCE
	ln -nsf $< $@

%.h: $(XEN_ROOT)/tools/tests/x86_emulator/%.h FORCE
	ln -nsf $< $@

here? (I'm hesitant to suggest plain %, i.e. without the filename
suffixes, as that would likely be at least confusing for Makefile.)

> @@ -67,3 +61,5 @@ afl: afl-harness
>  
>  .PHONY: afl-cov
>  afl-cov: afl-harness-cov
> +
> +-include $(DEPS_INCLUDE)

I would expect doing so was avoided for some reason. Albeit it may
well be that too much cloning of tests/x86_emulator was done here,
and it's all fine this way. Can you confirm things to work when
building locally in just this subdir, e.g. via

make -sC .../tools/fuzz/x86_instruction_emulator CC=/build/afl/2.52b-base/afl-gcc

?

Jan

