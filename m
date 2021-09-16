Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ABE40DD35
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 16:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188523.337701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQshL-00038D-Bu; Thu, 16 Sep 2021 14:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188523.337701; Thu, 16 Sep 2021 14:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQshL-000351-8f; Thu, 16 Sep 2021 14:49:11 +0000
Received: by outflank-mailman (input) for mailman id 188523;
 Thu, 16 Sep 2021 14:49:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQshJ-00034r-Rp
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 14:49:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f139f3e-16fd-11ec-b60a-12813bfff9fa;
 Thu, 16 Sep 2021 14:49:09 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-7-2mv1bDHyMEu-Sba3Rzh9Cw-1; Thu, 16 Sep 2021 16:49:06 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3933.eurprd04.prod.outlook.com (2603:10a6:803:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 14:49:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 14:49:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0083.eurprd03.prod.outlook.com (2603:10a6:208:69::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Thu, 16 Sep 2021 14:49:02 +0000
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
X-Inumbo-ID: 3f139f3e-16fd-11ec-b60a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631803748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qsGwjLGjMd2sjdb1xjhyVcOKuQDtTDX1mMRtJDJN2l4=;
	b=Pi+61BtO5YQMukvvK1hk4HfV3buBwtHv2LV9Bao7N+k1RDsUr36ouBhmIYRv878FpARCh5
	PpDTvSP7EnqxOAvNwDOxyXhT9CjLACy6gYQyx+u4nxkA+MSPokOlRBijdhfHBKFLYMzmBM
	s4QWVmIRQoJ7yIuAkEFA/5qp9sD1hmU=
X-MC-Unique: 2mv1bDHyMEu-Sba3Rzh9Cw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEIpGdr7sBcDl3WYy9KvNODReUDPDf57P3VkDAcVWtQaTIlzFXEVesg94xOlRqXPofS9SFpIoKuSNkdUBt2o0XbV5B7lJmsJuDMjaDJLvA5t5BPITXtygViwbNi0mnTlkGPiTqM+sJeY92Gho5SW4ieIG+DPASRlAb/DDC+iGCzkxaQHNBot7CpAnxNwZ3Myuw//o22CkvMMoshIm1MoFSP1gt5nmPyDg72QTnCphQYp/FEChdh3o+ksH9KUzWpHkF9qHzomQul04+oThaB8Htxg3ulNXvfA6W76R54G4RxPA/PWtEfqL4UoQPMsj0mVATpYTqtszDQw79f7ddDoVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qsGwjLGjMd2sjdb1xjhyVcOKuQDtTDX1mMRtJDJN2l4=;
 b=bHTZw4xJOTgkBodUJo7mrVjOpMMLn/A4EmiQz0l9LsjtCHqqX/ui9QS0Aey/8Ej0JOkFvhiNESVcv8nAttU9ZC/xU867L+9YSznwrUkONsQ3MOnH2QSXwFvejGTMU24ngizPKOxFROL+8W/3GV+c25jqr4mcyAUYhFOt/Ke13XUsFqUL2y1kqjQkNnQyQsKRB7RrouBcuA9CmM33vAAQba99In5ozxAX1AhgwE/Tq/H50BdRRbIqqxSjGthPJRg10QuRQLJKGtaGsqj5vxmW6yHkVPYP35i3fUhNvwHujf6rU1CJSiZDTbvkmoZdFXW1o6wk8t4paJ6TrHbVMzkLOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH V2 1/3] xen: Introduce "gpaddr_bits" field to
 XEN_SYSCTL_physinfo
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 xen-devel@lists.xenproject.org
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-2-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <03b1a1bd-2630-0ee7-b995-114632f527aa@suse.com>
Date: Thu, 16 Sep 2021 16:49:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1631297924-8658-2-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0083.eurprd03.prod.outlook.com
 (2603:10a6:208:69::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ffd8d97-61d0-481d-bba0-08d97921208a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3933:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39331DDC764E18275CC390FAB3DC9@VI1PR0402MB3933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fab+ZPs/TGD2hmgqKOWvaEDXXljm/ekDblO9hKwGsVsXVA0SZ3MD5jiS1odGAsjPITMIkCI8acWiNvNvj8MnWaudFFHqZo8M3ExbwcWyGubha9DTH5WylaI/QVwWMDH6CsK7W93HTwF1dBZgAChLx0YhIsB3OAFSr3QFecXMKn9mVb2Se+DP4cmpC+ut9bcgzUblrdKyarzFdGvm62A9veo6dOZzcXMq524HJAcf4YR6mgvpVfAWrdpKMKDqRZ6Ex/Qw1Q0u+0Nejg9JAMUWrLeFv2jd0VrzVc2oiwKvXGwJEVABpO7J2SqiFbFOCU5p+6iWvBjY9xus4uJeKgrPBkHnuCe5VBiwsC2czDdEvjnKwrIfgATHTidu1vx4TSj0w65Dnqs1XdrZSB4fIh42kpvGdPVjDf3huOjUrkd5e6pRf98guHu/OIvpLbJYO9SwnJehcKUh+vTsSomXhUWZHMm/CIKJMJpJy/wNI9BO95CEElNhvXlbU13ZEPBl2loOnnEIAGiqsCEvSH0hs/K4F8Cji8bVDDQaX/6aY5WD3ZKkwftUu36GSTVj3YlM9AGHHdDn7IzaXVftGgZ5NPTUkMX5c1mrW8aACnerF7R2bKQ/ewc9s9b9Y3zN0BAA36yO6cqwdPW+A8t5joC0Ei9fYwBp8NlPdtJd9fpEMMbLED7R0Iq6hs/BS6NkHKtgjn3ULxc5ObgctwXu/+p1K6Oz2igDvCYpnJDBbxwki9P7578=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(39860400002)(346002)(376002)(136003)(38100700002)(186003)(36756003)(31686004)(478600001)(7416002)(53546011)(5660300002)(4744005)(86362001)(956004)(6916009)(26005)(31696002)(16576012)(8936002)(2906002)(316002)(54906003)(8676002)(66556008)(66476007)(6486002)(66946007)(2616005)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHQ3SDdFNjF2S1lCR0JuVys0WXRlTWhsYUFhU2ZxUzJFc1Ird01DaEUrOTFU?=
 =?utf-8?B?TldUT0lQOW1jMEllMzdJd0FGM3BiNE45a29nK3J3OE8zYTZwMm1NVG5aV1dy?=
 =?utf-8?B?QXUxTkNTTDR2d2tVM0crUDIvWjRLQzlobi9NWFJaSENRSnVRNW5XN2JLbEI1?=
 =?utf-8?B?eExiMm51T0ROV09sT3c3REZyQ2Y1SkpTbElVUS9MVVM4VE9vYzErN1VuZU9x?=
 =?utf-8?B?SEVPZU83TUNFYXdWQkhZb2RrWCsvTi9zTVdCUzl5L3F3WUtJZUNHS1VKVllp?=
 =?utf-8?B?Z3ZFREpCa0ZZU0VVaWNUMHdiQWZuaUNuYk0rb3BDVnNLM0MxKy90K00xT2VD?=
 =?utf-8?B?VmJxSlcwWGs1dlVYSFVoSjZhQkdwQWdqMnoxdVRhT3ltTERBazJyNThZM0sx?=
 =?utf-8?B?Q0doQllEZndpTDRJbkI2Njc0LzhwbFoxc1RjVXZVWFdtS3Izd216b3FLR3JH?=
 =?utf-8?B?TGlXUTBlS0ZTUWxKZndzUzJrZWMrNEE0SzNKbTYzREs0RnZERlNxaU43MU0y?=
 =?utf-8?B?dFlkblEvaEp3Z1Fxenh1bnRUcXAyb1RkUy9OZFQybi9ZQzRHYTdvYU9GSWF1?=
 =?utf-8?B?cnJjbmxpWllucjdzY0xwMEtYVUVlYnNMOW5ncXhPZi9BWFdZaWl0dmhpWjAr?=
 =?utf-8?B?dTBjSnRsSkUrWWdueGV0dGhRcGRPWndjSVQreGd5WGtnNEt5eG82cytwWjQz?=
 =?utf-8?B?SVB6cFllZXM2eWN3NTVXWElqbHVCT2R2S3BhRzhtOGl5T3RQNDFOSE9kK3Y1?=
 =?utf-8?B?azFwV0JMd3g5WndSRGNwaURkQTRYbVUvajlsMnhsS2dYc3Bwc2ZQbnY0WmIv?=
 =?utf-8?B?MTZFYWxmYkVCTXhkZmFXWTNSWG9YSzFhSmxrb2xWSGcwRTRNdjMwUW1MUjlP?=
 =?utf-8?B?K0Y5Vm5oempQc1JkSm9oUHo5SGdxUHNDRGFQQ0U3eHJ4Qy9MYlUvMmpNTFBF?=
 =?utf-8?B?VmRGbmhGakc5QmJQa1E4UmlLS3hMYlVKRDlpaXlIWjBQa1JObWF5MnUyWFp1?=
 =?utf-8?B?dzNQZWQ2T1l0MzRTRmlNVUUrVFRpUlFONnhHNHlJZ3Z5bU01MzUvZktHTFZC?=
 =?utf-8?B?TGhwVG9hZDZJelZxUWgzZy9ibFlZTm42d3JQK0tHTU5QNXpFNEtXT1BEazBt?=
 =?utf-8?B?d0tpNm9yT09OVlczaDMwRmtDdnQvN2M3c09HRlZMNUw0Z0V0Uk0yZDF5aVJp?=
 =?utf-8?B?YUJRN2xpa2FNc3UzNzlTSjRYcXgrNHFOd285MzVkdTdMQTRsZkNCU0pqOFpy?=
 =?utf-8?B?M1JXeFBSZzhYNFhoUXZiMGFzT3c1VTVKNGo5bFYrVjc4a3hJbEsyYktWVzhH?=
 =?utf-8?B?ZHMydDl2Ty9ESGhTRDdOWWovc3pGbEdDYzBybUJiUWt3MktZZDNHeFdIcjcz?=
 =?utf-8?B?TUdJa0tBNktLUE12eGJrUVhFTmJRaXBFN25NemQ4NElIRzMrcE9NZCtqQWRt?=
 =?utf-8?B?UEYvV1IyYkFJQ21PRmQxRWEvZ2FJQ0FuMGFTWmZIVURFN3kzQWlUQkdpb3dq?=
 =?utf-8?B?NDFDTFpodHEzdlRYc1hxWHBJQ0hqNkN2RW1nSlhCWmY3cWlHRjhFMXdQYkpq?=
 =?utf-8?B?NHE4OHdSQmp2UnNIa0IvZVUxV1pHQmU2WitoNUFHN1F3Z250bHpOeG1tRCt4?=
 =?utf-8?B?VGJybEtkM1RYNUJrQnlzNEZScjNxTjdiWnZ3WWk4MXdXczVzTFZxVFVWSFAx?=
 =?utf-8?B?Y09STEZRZ0FaM3hsUzdkV1dKSGVESlhnRTE0aWJTUVFpUGRnL3M2ZHlYUU9R?=
 =?utf-8?Q?ZSX7kDlZf2XRk6xmpnL8ppPTSxYc6D+gJVvQ7J3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffd8d97-61d0-481d-bba0-08d97921208a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 14:49:03.7579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLgdH2fJ9U/Jp2CeS2LlfRe1wTA1NSB5lP1FTB+ucWUa3oiFxfpeTlRYodTz3qFN9wb7HpwFNs8Cno8md8Ca7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3933

On 10.09.2021 20:18, Oleksandr Tyshchenko wrote:
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -855,6 +855,13 @@ typedef struct libxl__ctx libxl_ctx;
>   */
>  #define LIBXL_HAVE_PHYSINFO_MAX_POSSIBLE_MFN 1
>  
> + /*
> +  * LIBXL_HAVE_PHYSINFO_GPADDR_BITS
> +  *
> +  * If this is defined, libxl_physinfo has a "gpaddr_bits" field.
> +  */
> + #define LIBXL_HAVE_PHYSINFO_GPADDR_BITS 1

Nit: I don't think you mean to have leading blanks here?

> @@ -120,6 +120,7 @@ struct xen_sysctl_physinfo {
>      uint64_aligned_t outstanding_pages;
>      uint64_aligned_t max_mfn; /* Largest possible MFN on this host */
>      uint32_t hw_cap[8];
> +    uint32_t gpaddr_bits;
>  };

Please make trailing padding explicit. I wonder whether this needs
to be a 32-bit field: I expect we would need a full new ABI by the
time we might reach 256 address bits. Otoh e.g. threads_per_core is
pretty certainly oversized as well ...

Jan


