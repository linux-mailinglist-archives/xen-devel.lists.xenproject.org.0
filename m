Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19696417680
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 16:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195411.348095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTlmL-0005UI-5x; Fri, 24 Sep 2021 14:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195411.348095; Fri, 24 Sep 2021 14:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTlmL-0005SV-2l; Fri, 24 Sep 2021 14:02:17 +0000
Received: by outflank-mailman (input) for mailman id 195411;
 Fri, 24 Sep 2021 14:02:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTlmJ-0005SP-SB
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 14:02:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04dcecc8-1d40-11ec-bad8-12813bfff9fa;
 Fri, 24 Sep 2021 14:02:14 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-9dRITHmvPAqyJVSyQL42bQ-1; Fri, 24 Sep 2021 16:02:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6670.eurprd04.prod.outlook.com (2603:10a6:803:120::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 14:02:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 14:02:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.9 via Frontend Transport; Fri, 24 Sep 2021 14:02:08 +0000
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
X-Inumbo-ID: 04dcecc8-1d40-11ec-bad8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632492133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aQsxUjV1AEHF730NqCI/i760oUoFSMLxw6RtHJFXWJY=;
	b=Hfd70CiNurDVTrJ2ah67EgrZgKH/fjYPAhHUA/w/JQ1GWHaB6V6SSXnIGoLk7X6Kijk7M5
	/LIwQ4F0og2rWVSSUBFGGKoXoAOANJLfI0PQYssxk36MWp7ITgF99ZHC/08h8ulXF6Vu9F
	4vFo7CAbbtRFp9i4LtpoFay9nMWrFQ4=
X-MC-Unique: 9dRITHmvPAqyJVSyQL42bQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNSUJTScYY8FaZBHbABUxAVY00jAH8rscEi4FuQ7gCYLhWmfwrjJF4+WG0P7mqeUGhQMSaadYtxzb3OHzb6I0uGD/IjVyUcldaL5Koz04As6cIn8FCbV8asB1wHbm9aoo21vr7qLcDgnrZdxwuQGs1jzBq2Yacf3BTCmprvYINdBuzLyiNAoykFNfE9/34EQ836/WwuThMA9eQ446staS1RX5viE+3KnJQ9V50eYcrvwthjOfAdx22OG7AoxxfMF9Y9xdNvqOAjY355GhmrMKrXedvArMwEFICNcqgJGpqoCSprfQuutqu1QSzixtsAHvDF9uUp+kexiARxbY1XAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=aQsxUjV1AEHF730NqCI/i760oUoFSMLxw6RtHJFXWJY=;
 b=Jq724m4Cho2hSd7AkN53EF6RfxQArXzgA4uwnCVyfIjsSQDjCBk1w6c91eDUZzzi5qdbX62lF0Cu6X3DqK6B8ZAYrDv3ztn7zTpYfP6Q6wGdmqZxkvGrLddY9y4jArvg0Q9f2uz81P0ZuWuux+G4LYvurKNhAqjunY2rtAlyW2IpQVndvMK1S2VAOmUuNHs4D9xRcjnDSw/GtkOxzo1SzdoaPJ35Jbb8xD5Ao+eJI+kUidiFKJlHD7GiNRblhaG8OmeYSu+2jyf1lQmaoHXti9Jmx+f+Oxspm6WxgREIf1T0b8ZIvaV1yuTbczBu0XCt/T/JQBPAEh3mm7IfyDMdbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20210922141341.42288-1-luca.fancellu@arm.com>
 <20210922141341.42288-3-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1318fbb2-f7ae-e7e8-0e3a-9dcef69fb430@suse.com>
Date: Fri, 24 Sep 2021 16:02:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210922141341.42288-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99289bae-cfd1-4171-1072-08d97f63e66a
X-MS-TrafficTypeDiagnostic: VE1PR04MB6670:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66706F4EB969C62FA21836ECB3A49@VE1PR04MB6670.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cFPQMDVi47icNofIErhESw39KvIfs2cm97U6/i6XW7zyBQELlx24aoOXx/TzBss2x1ZMvs0Pg1oNM+Jy5nf01WlMTmwd1ZteYOup9zD3YasG+kOR91hUfl5BX3Ext7bgzL7GUl0RlMS6eOEg7XtBcqoEQUoAHLAgpM7/mhQ+D4mScHbFEDmZhB4y4ciM3cTv6Y8nqO1XMFkbL1FeS5O3tfus1rzC1BlScYksuZi+1iUQcmMvu3ylY4zf1eZsrFAtxg3IR8H6fSmQ71QuCruAlC0mIizeYzu9hS52+COYbBTBOX+HHUyQrGknZOWLu4d+wO33ubeaGMQsoLx7lF2Nv2TMFz3Vg0jKdOeBTopBpy8lODpIt3SAqeRhKRJXXejDHGqhdjDGyU38l+KGffYk6tMskZrZ3OKtVVksM4Vcnrhl4N9Sh3tl3KqB6I/YCvi7IAWp7kb1AuVn2MAnKdTd0oqrAeAYz3d62nggupAuCpp48mYZBPHLyEnfTQ5jo1HJmP9daHYE0Ray+wGQTznqv2qe735ZFDmK/TblJwp60Yl1Bm6nxcF/M3h1s+idNq53rR8H8wuQVJnsQQL81kqEn4wHydM1JZjU4y629+mWc1SJTZR1IlopwOKZK09OnM6VetuhTAOtzM9ooDa+rS4FpbR6PBq5d7i0sRxXs1i8aOnXcC1/mgb3Vs18ytkwC15l9UIfTkxyq1M8ILebd3wtbSnp8/E3/YQ5xYhjXPGLb4cxNO4AL/k6OJ3NPdmnKBDA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(4326008)(66476007)(66556008)(31696002)(36756003)(8676002)(6486002)(54906003)(86362001)(16576012)(8936002)(316002)(83380400001)(956004)(6916009)(31686004)(7416002)(5660300002)(2616005)(2906002)(53546011)(508600001)(26005)(38100700002)(186003)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UklpbkxOWk1oR3BaOTR2SXR0L0xwUmlTeUF3RThtZWxwUmQyditYTW1Yc3JN?=
 =?utf-8?B?K3NyUWNILzhpcFFtZStuNkN5YkNNb3FGQzlGOXQ2S0xWZEtqSjY3cUJNVm1U?=
 =?utf-8?B?SWZOeG4wcURad3owNjFmMUZYdEI0VEtGOGJsTHZQUlY2SWlhUHByVFRXOXVJ?=
 =?utf-8?B?RmxwQkZhdlhIZDY2T0tScHlBMXBHY0ZISmFUb09IcnF0MUVEdjA4enlJUU9I?=
 =?utf-8?B?cU9WWnFkR3VWRUgzWUpXR25NRWhyMmlCTDFBeXVWMm8zbjRVQy9RSVgzbVQ0?=
 =?utf-8?B?Sit2T1dnRjF0OTVwZVFRaWk3SHJPR285enNBZVJ1RnJycWVSUUhLZkJCQ0FV?=
 =?utf-8?B?ZWxEMURzb0JzbHRud2hPT3A3WHM1eWhZVGpOV2w1TTBxMUh2YTdBdG5FSlZ6?=
 =?utf-8?B?ZCtMWFBrU1NxVzR1dnJnWUhHYWtWd2hveWFoaEVQQmJSelpEYVV4OUtwYlpZ?=
 =?utf-8?B?NE45ZnU1U2lnSVlJUzJTQW85V2s3T2hmNVV1eVd6SHhWY1QrdDNJM0IwRjdh?=
 =?utf-8?B?VWtBN096UUFnc3ZmMFBpcms4VmtMZi9xQXkrMzBBRTJZY3FkSnQ4QmMybmkz?=
 =?utf-8?B?MUxRT2RCN3EwdkZySVJ1MURYV0xISVZqYXIyK3lEWlpGM2Nld2I0cEhvdVVl?=
 =?utf-8?B?NW12c29iekFLdzRzb1ZHQ2F4dWVwc1dBS2FZVDlQWVRWbzZXaHFxSG1JNlJE?=
 =?utf-8?B?SjNud012Umd0VDd2cG1tc2wrYUkweURQRVpaOEpCaTd2RytWQWhzYmx4VmNt?=
 =?utf-8?B?N0luNVYwdTVRVmpqNm05aFZySUZBTEFRaUlrTEYwVVFOcU1FN1d1ZjlZYzVp?=
 =?utf-8?B?Tkp2OTgySzczUTNkaHVudnBxQkFDbG1zOG9WQWJvTzJWSFM5RFNOcE16eFN2?=
 =?utf-8?B?ZDkwRmN1dnphWThWby9SUHdxOVBoenYwMkpWZXE2QnREb3JrRWYzeHd1S1BE?=
 =?utf-8?B?eWtXbW5vQWxDbGNxUkJPbzJDTWJ3MUdMbjVCTU1SS05YVVNmdWRVd2J3Nkwy?=
 =?utf-8?B?TjBHRjg0cWxtdzFSeHFZQm1qa0V0RlRWNG14NFNJUjczWS9QUzJzY2g5empz?=
 =?utf-8?B?VURXQjFlUWZDSU1vTHBEcGp2VWhTb1FEclZyWUh4c2o0T3h0OWd0SzRIMzln?=
 =?utf-8?B?U1FFaW5RTGQ5cHNmS0xTM2dGNFdpK1NMOWp2cTgrdThBOUVBYysxRTRnQm9O?=
 =?utf-8?B?b3ZjTW1JOHFvZXpyemtrZHRSeGtxNTNlUUdLbTd0ZEFuOVo5bzRFVStTb1d2?=
 =?utf-8?B?bVllcjFSZ0dNM25RaUc4d1RZQ0Flb1RyU0FRbmlXWUh2MUhXM3VrT3VHWFVp?=
 =?utf-8?B?dU1BdzdUUTBMRzI3VzZSYjRmS0tlVFNiTUNXSVoxR2h5NTd3NVNxQUZUY2tN?=
 =?utf-8?B?elM1em9uOXVmd3hrdWszK3ptb1ZxZGlEUlRNaVFWby9vUnMxbmtPOS9ubzdG?=
 =?utf-8?B?c244QkozQlA5Qnc3Y3hRNDE5QklmTndCNnZhQmdmYys4ZWZuYnV4OFd1Rjd5?=
 =?utf-8?B?aC9UODU0eTNXQzZHaHBZTExBWlg0UDh1OVdWMjdxODNWQnRGVEdyZ2ZPanF2?=
 =?utf-8?B?Zk82cjBBUTYrTmU4WnRaT3BiWGpjNWhzWGxtVVJBa04xR0RreXRzYStOTHlR?=
 =?utf-8?B?REpCQUtSRDY2aE5FbGwzamt1cXhFZTNHdllUTE1wNHZIeDNSUnBuRzdiajhV?=
 =?utf-8?B?cEl2MWRIalVHMnNJTnlJdHRENGlGaVRtcUlaKzQyUjU3NHh0ZUJLUHE3bHdT?=
 =?utf-8?Q?qXTwIV1hoqBfk3ujf8NKgRqjOEK9JeEPYn1TDgf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99289bae-cfd1-4171-1072-08d97f63e66a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 14:02:09.5065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xddhm/NQ66pVIA9ZTvsVJCQZziYRVTZuGOT03PM6uUXPBpyFmWlAVjVY/nNLzwYB5OtUyvm13RtxF7p7gtkZXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6670

On 22.09.2021 16:13, Luca Fancellu wrote:
> +static unsigned int __init allocate_dom0less_file(EFI_FILE_HANDLE dir_handle,
> +                                                  const char *name,
> +                                                  unsigned int name_len)
> +{
> +    dom0less_module_name* file_name;
> +    union string module_name;
> +    unsigned int ret_idx;
> +
> +    /*
> +     * Check if there is any space left for a domU module, the variable
> +     * dom0less_modules_available is updated each time we use read_file(...)
> +     * successfully.
> +     */
> +    if ( !dom0less_modules_available )
> +        blexit(L"No space left for domU modules");
> +
> +    module_name.s = (char*) name;

Unfortunately there are too many style issues in these Arm additions to
really enumerate; I'd like to ask that you go through yourself with
./CODING_STYLE, surrounding code, and review comments on earlier patches
of yours in mind. This cast stands out, though: I'm pretty sure you were
told before that casts are often dangerous and hence should be avoided
whenever (easily) possible. There was a prior case where union string
was used in a similar way, not all that long ago. Hence why it now has
a "const char *" member. (That's still somewhat risky, but imo way
better than a cast.)

> @@ -1361,12 +1360,21 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>          cfg.addr = 0;
>  
> -        dir_handle->Close(dir_handle);
> -
>          if ( gop && !base_video )
>              gop_mode = efi_find_gop_mode(gop, cols, rows, depth);
>      }
>  
> +    /*
> +     * Check if a proper configuration is provided to start Xen:
> +     *  - Dom0 specified (minimum required)
> +     *  - Dom0 and DomU(s) specified
> +     *  - DomU(s) specified
> +     */
> +    if ( !efi_arch_check_dom0less_boot(dir_handle) && !kernel.addr )
> +        blexit(L"No Dom0 kernel image specified.");
> +
> +    dir_handle->Close(dir_handle);

So far I was under the impression that handles and alike need closing
before calling Exit(), to prevent resource leaks. While I will admit
that likely there are more (pre-existing) affected paths, I think that
- if that understanding of mine is correct - it would be nice to avoid
adding yet more instances.

Jan


