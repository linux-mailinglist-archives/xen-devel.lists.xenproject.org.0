Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BBA5BCA33
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 13:04:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408700.651526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaEYH-0002tc-6j; Mon, 19 Sep 2022 11:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408700.651526; Mon, 19 Sep 2022 11:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaEYH-0002qZ-3U; Mon, 19 Sep 2022 11:03:01 +0000
Received: by outflank-mailman (input) for mailman id 408700;
 Mon, 19 Sep 2022 11:02:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaEYF-0002qT-5P
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 11:02:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e649908-380a-11ed-9647-05401a9f4f97;
 Mon, 19 Sep 2022 13:02:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7450.eurprd04.prod.outlook.com (2603:10a6:102:8a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 11:02:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 11:02:54 +0000
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
X-Inumbo-ID: 9e649908-380a-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdwH/z2VCdt0FL1XFObizg86TlNKwzLQ1wmH76LPf/OxTC5vN7YQA+VwzKA0UUR37dCYkKh2Hj9yvmnEYZ09gdLqLCdmaSK2B1AQvGpoa2z0gMy0O3S9GxA1USSz5nCanLYgYOg3IXqlDVXxQn9cD00PIEVTfunH2AVw+Xbx9G1DT7ju6EZADYP0nu2k3MKWkYkXrNoj6yKboIVCJtjtmnxqNQDIYJje2nTbG+Bg1It++Ha/j85qG89/Yig6RAaxtLqwDpBevLf/aB+d5nE/c+vgjVahHV2LUAKudmHLBPGps2NcVkuoPaBq6/LEikiiUQmMYT0GkMkD3gZbzuKW/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02xU9hjYOfhnYP2ePWIEqxRClQxXIq7p6wgidrJu+3E=;
 b=FkF40NtYajTViYWvxkZwwRTBORAvxyaS2HfMwQBkGanASDqWyUB5R+YnJkIpLMIouw1Yxhs4JBFvorcxCOrT0Mm4OnD9aFBNtOg9YMETzt7ZkiS7VXcnW3oDsd6shGXH4AHczsjplgrg3HNlT7azBQZgnzJ51KPR471nea5ydVNIDOopUK9UVtdTucMbaFUhI+Xkof7HagCtdATRnXLMDkUet/5UOYjlL6vN901KqjyON+ME9wsZyJt9obyTRyE0kzs4mV72PZlP9S+eCn0g/Wr16tEtTPPFc75II75SpbTSOt9CKgJbL30ycZU5Hpn9G9cEtemu58xUKqtM5YnH8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02xU9hjYOfhnYP2ePWIEqxRClQxXIq7p6wgidrJu+3E=;
 b=Zkh4SuVOhhrDMC1XvW8yEWOGOSXYReKeR5ktU/7wB39+/GDnNIoTLI0z8+FUqPCtd4cc5QEbJ38O0LKZV9LIYPGAVekAwCRXiFeiZ/J3E+HEFPr9R2CFSsDcFJkTaEVghgekDzJBlzn3OXmC+SJJwI+jX3facczSA/Y2iaxKgZL40ebUcFcpxfBzTX2N+AyNbjHLZk21pX6HkW+urwmfX/GGFxVu55ZnIAqfr1OY1r7QJKIrpow+NF0UeKDsi1JJqDMUtsieauZ94n/3XPKpQl5auKH4I4+11LA+YoeKYKjS1mrVFF22JiBtY+ixQDcxLzACYa2AqEuYvBaD7qpB+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c6fc8cf1-c8d5-fd5a-f70f-42756db074fe@suse.com>
Date: Mon, 19 Sep 2022 13:02:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [XEN PATCH v3] build: Fix x86 out-of-tree build without EFI
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Wei Chen <wei.chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220919102831.17438-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220919102831.17438-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0150.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e05f1e9-20e0-40cc-2838-08da9a2e80af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M8lAVySBHnv6yVdup02+J9jsEf6EoHIicGg97qXbAvB8u9HmJOh5KJGPTXqFIjz7XO+DrWcEM+ATGx4A6zZYs1PBqqbe4z1FruJZUnum8da620d7qyNchP5zl2mzrlM2hfg40mQhBSoTIGjfoM2D2ORgH6Wp0KThalkc2SiEs22+U/c+W9CoknDQjGW1TvUhsrGS6Kl9oDO7q/NvNkZddBvZEowLWonPFtH69P6jLFmt1HTgl88arAYsQrN3nTFfaXUArJmOPK1OjR7dkv6CoN9MA3ctmaNBvGEvRIHoQPDXuTWTrYJO46KjFeXPaybizxmmMYcOYyaB1Fkyk0NfCROSjASg9THjWyV8PZguaINntMnRFLEawsnrGmII40k2ZL6vZZ5JJ3zMkvmUm89iBM1QzfvTHVWznhVZ8M9Apnyyr2p4YXIQdqFO0Gnj/Dk0VAy4tUWJKP2/Wl3KdgLvQH2dS2TJcar4FdGNDDsu2XqB8Pu0zk4u5XnB4CqGq+Is7DWW07PzR86PrjvHcyHSJJYM/bsDw91GOdHPfQLqEwaWWKsCHx5WG/7vymUBrDJQFZrEPRMhNhxVvijcyJ/ytAPCiLKtG5TO586uaqJ4FtyAi9Irrs+bsXwxGoQ/ZjNGr5A5/hzJ49gKurqonvQMB8mTQSYK7IKbj80uPFV5qG8OiiE9R7XT0fk4Ou3UYXMsr4XwpAj3PIEfxJkD/yncwcUbrcbWQQRbj03gnWQ4CFbYRxQbc5XTvrq+yQF6+12qOxy4Y4pgik1MCxaEBu4/b2PULf5frYnCaM5vopKeHPs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199015)(66946007)(4326008)(5660300002)(8676002)(66556008)(66476007)(7416002)(54906003)(31696002)(6916009)(86362001)(8936002)(316002)(38100700002)(83380400001)(53546011)(41300700001)(6486002)(6506007)(478600001)(2616005)(186003)(26005)(6512007)(31686004)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1VYQVBTQXNyanNMOEU0cG12L1JWQldYcnpHOXVIMWxoTmQwZDkvT1lHM2dn?=
 =?utf-8?B?dFdHbHRXNm00cmtjcTJYU3NoYzE0RXdOTkp5QnNPZ09QN3hrNG8rbUpKaHNk?=
 =?utf-8?B?N0U5Q1YyNGNpWGpnS0NoRVdSNGpET0RUQXJMVlFRY3puUVN5SUEwK0lVakR1?=
 =?utf-8?B?QWwzM3hMdldmb3lRWUZVS3U3MWNIWjd0dGNWSG9JSW1oYzVYVkRaL0NJaGNw?=
 =?utf-8?B?bWdDRWs1emx6TFFqdnR0WEJvMWFOdHhhR1E5VXMwaHU2NHh6bDlZdGt5b2Mr?=
 =?utf-8?B?V0dHUVJxbG9yd1p4RGtBc1lCV0paRjg2RXYxRnNiZFFBeWlHYk5XUU9nMkty?=
 =?utf-8?B?aGNURDJVZ3B4dFRyOTdFK3FjQUFDeFIwc3RUcE1UTUN0cDFNNnZqSXQ5OFBQ?=
 =?utf-8?B?bHVHdm53dmpKS0h6bUJSQ3BiWEZSeXcrWUlHQXFuSEhMem8zd0tZd2JjNmpm?=
 =?utf-8?B?ODMwTEpjVEVOQXBiUDBab1MrK2dDSGQxaXNnRWRBUWh2Z3hOTldwdDZUWGE3?=
 =?utf-8?B?TUdEeDd1VlN3bHRXczVlT0NEOCs3QVVzYWtja0FRblplRjBDZmVGZGhvOE0z?=
 =?utf-8?B?RjVac0RXN0NGbnEyOXFkM1NxL0NjOFFRSWNzdzNNTVJaZWJ4WmNRV2lTL0Q2?=
 =?utf-8?B?djlPcU0zeDFSbjlXMENtcmpKcTlkL2FOV1ZOOW52dnhiUGQvZEZvM1ZEMWFk?=
 =?utf-8?B?S3ZyWGMwaHpNbVJOQjRoVnFITlF6MTY0bEpUU21PU2ZhQmJxYVU5NTF3Rzdu?=
 =?utf-8?B?cERqeDZvVlcyb3NETzhLc2hTaExqQ1NjdjFzb3hyNTZSZHBHUU5lc1lTNnov?=
 =?utf-8?B?YWt4bjBFOFNjallvY1QyWkt2U0lVVkN6UVBqMXN3YmswOGI0eWZ1Z2NWK2NL?=
 =?utf-8?B?dUZwUzBGVWFrZEVDcHNKbmwrY2tieW5Ha2RQOTArZk1kN1FpTVVnYTlZY2ta?=
 =?utf-8?B?N1FIWFlIZ3l0NFM0RHRLeWlzU0VjOTE3SU9yNVpCb0NMRnNKSTBGR2NOSEZs?=
 =?utf-8?B?WUF2SDZCVXhaUDNEZXowZWdSeFpBRDJ4a3pEWTEvOGU4VHhvYlA4VFBUUy9j?=
 =?utf-8?B?RGxJM0x0b3hvY25wTWQxSDM3T1JPZ0tmbGVqSmNUemNyb2V0V2ZHbTFSbTNi?=
 =?utf-8?B?RUJNdUtOTExxWXdQYzdkbDI3d3FDb3dNZjFWZFFnT0xGLy9lQWZ0TjRUS1VL?=
 =?utf-8?B?U0M5Vm5sV2tOWEtaR2plaTRqSk1aa2FrK0J4KzdLZEpINWpnVHlDUnFGVjYr?=
 =?utf-8?B?bDQyRGxIenFtYVhsUmhwL3RQS1FpcWhicG1ZdjlCZnZHNmo1aWorK1B1WHBr?=
 =?utf-8?B?WUFGNFE4TmJBMnY5b3RSaXBhZkhhNHp1QzhaZElRTHkrNDlhbVF6VmVGZHNk?=
 =?utf-8?B?WFBOVFRvaEVjc2Q1bG9uV1RPRzBTVjNGVzI4VWxRVmRPbFdLdm9kOHVzMzRR?=
 =?utf-8?B?VHQ2blExT1hnQzZDUmFMelpXNGdCZjRIU1JlY2RBUnBwY21OUjB3MU93aGdj?=
 =?utf-8?B?aDA5ZnhzcXljcTZKaUl2QThVVm1qV2NJYU02YW1NNDBqRk42eGVhY05PVHFF?=
 =?utf-8?B?Z3U1eURqbEhUVmhyTVBjc21jazhyL3VsN0RYY1gzcXpvV1lzSWtYSGhtNkVP?=
 =?utf-8?B?cEMzdlpwZGlTcnVuZDFLVEd1eDdUaFF6L0ZqeFNWR0xEZzByeVdVd0x6TE9F?=
 =?utf-8?B?NU9xQ2tsSFJSU0cvT2Qva1UxMStxeDR1ck84dXZnQ0ZZdlJJcHYyU0l2T2dt?=
 =?utf-8?B?TVN1MnJUc2dGQTRwc3duTDVkQXNjdCtiY0liaWl6cE9VOFplRmJadVBPbnp5?=
 =?utf-8?B?NERHTzN4UzlRQkozbndIbCt5cnF3MEZ3UzFQUHlRRGtCUCs0SWtYeWRKLzFi?=
 =?utf-8?B?REJPQUsrek9hNUFicjFyK2tlaUNtNzJjMmNsMEJGTjV1MWl6K3NwUHA2K0xP?=
 =?utf-8?B?R2lVS1dxRm41bUlsbENkYXFTWDlBZi9qcER5NFIxc1N0OUkzTXdaRUVmeWFN?=
 =?utf-8?B?b1dtRGltSEh2cXdaUWJiMWwxanR5a2JxTGcrN3pNYXB4bmxUeHVlMUJmR0Jz?=
 =?utf-8?B?WUw3ZHE0VjFiVGZRVnRVYXN1OWk4UHl3cjlyLy95ZWZaL2NOQlFJbFAzZjZz?=
 =?utf-8?Q?90FbSUNHTF7JT0k5tINRM7OY1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e05f1e9-20e0-40cc-2838-08da9a2e80af
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 11:02:54.6513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ua8ryscwaPv9MegdeyBE9dSpmj0GyXnRNpX5aEXq99lLY8u+4nI373SZgI2B4ZyArUSzZWwY8e3LnJRetAiuIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7450

On 19.09.2022 12:28, Anthony PERARD wrote:
> We can't have a source file with the same name that exist in both the
> common code and in the arch specific code for efi/. This can lead to
> confusion in make and it can pick up the wrong source file. This issue
> lead to a failure to build a pv-shim for x86 out-of-tree, as this is
> one example of an x86 build using the efi/stub.c.
> 
> The issue is that in out-of-tree, make might find x86/efi/stub.c via
> VPATH, but as the target needs to be rebuilt due to FORCE, make
> actually avoid changing the source tree and rebuilt the target with
> VPATH ignored, so $@ lead to the build tree where "stub.c" doesn't
> exist yet so a link is made to "common/stub.c".
> 
> Rework the new common/stub.c file to have a different name than the
> already existing one, by renaming the existing one. We can hide the
> compat aliases that x86 uses behind CONFIG_COMPAT so a Arm build will
> not have them.
> 
> Also revert the change to the rule that creates symbolic links it's
> better to just recreate the link in cases where an existing file exist
> or the link goes to the wrong file.
> 
> Avoid using $(EFIOBJ-y) as an alias for $(clean-files), add
> "stub.c" directly to $(clean-files).
> 
> Also update .gitignore as this was also missing from the original
> patch.
> 
> Fixes: 7f96859b0d00 ("xen: reuse x86 EFI stub functions for Arm")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with a remark and one more adjustment:

> ---
> 
> Notes:
>     v3:
>     - back to using common-stub.c

As said in person, I'm a little puzzled by this, as the v2 discussion
had no hint in that direction.

> --- a/.gitignore
> +++ b/.gitignore
> @@ -280,6 +280,7 @@ xen/arch/*/efi/ebmalloc.c
>  xen/arch/*/efi/efi.h
>  xen/arch/*/efi/pe.c
>  xen/arch/*/efi/runtime.c
> +xen/arch/*/efi/common-stub.c
>  xen/arch/*/include/asm/asm-offsets.h
>  xen/common/config_data.S
>  xen/common/config.gz

The new line wants inserting a few lines further up, to retain sorting.
Can perhaps be done while committing.

Jan

