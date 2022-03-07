Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ABB4CF2C3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 08:42:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285681.484921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR80X-00033c-MU; Mon, 07 Mar 2022 07:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285681.484921; Mon, 07 Mar 2022 07:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR80X-00030b-JR; Mon, 07 Mar 2022 07:42:17 +0000
Received: by outflank-mailman (input) for mailman id 285681;
 Mon, 07 Mar 2022 07:42:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nR80W-00030V-EH
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 07:42:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b46edab-9dea-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 08:42:14 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-rKUMBHMnNoa0Fkv6IuR2Bg-1; Mon, 07 Mar 2022 08:42:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR04MB3051.eurprd04.prod.outlook.com (2603:10a6:7:1f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Mon, 7 Mar
 2022 07:42:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 07:42:11 +0000
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
X-Inumbo-ID: 1b46edab-9dea-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646638934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WhA4ixUqMQkIwjPmJQXOghGRvQ4BmDzBgCnaqvL2xRQ=;
	b=aJ5nGkCqf/RvLtLK61nXCtyuyGF70SFHwK3RWkSJKSDgOcU4N+KWlwHDbR68QuCF9UoZyU
	Iya2uI1gaV/4ict8Nqupb7I7Bm0xZ5qxvACZb4p3o2+71QLQYAU28YIl6uL8AE5l7GpyBs
	nL6CWb0x44MS43WEY0EAUPZjGdsJE5c=
X-MC-Unique: rKUMBHMnNoa0Fkv6IuR2Bg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6rLAiVFTNioCvrugh9oBKTgrmNfvFtB+TkaEqAcuJG6wU7aJwiMkPsQR8pfPp/ar/EYpQavkV8Es7le4zeKMqmOSJT8cNJtJzPneSwuuiksXj31n4Bw1v9ZWSFr0pSfIaMvwoR0hwEcv/PCBUNvqKuiaLlY++BExOAKwOhnd+R96rAkVQq+VwEtJWsBzpKGlhbLSDuCoSa+xYAZRPop/ZXum3LYnHl4VoQjoq/tj63+P25mwdZNcMyRLdroBp28Ro3tuKGimS7kIFIJIUGj7M6Vtw2DvHeCIK8lXiGWAdlF/Y+SA7J/mBmuE71N3vaF1EjTDJcJLNyrS66sKPzDhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhA4ixUqMQkIwjPmJQXOghGRvQ4BmDzBgCnaqvL2xRQ=;
 b=DACOn3X97kSPI9jbwvcco7G+Tb3/e/27f2/JnSSqnPZ8/ElFWvkFXXwmt+Yuz9+5iYhHQyaXTr8DnzKBCsKnt4vzvDLbMhvQVFJsG8n1QR5aRqvRPz/k3jcKGBobTqCFPb546UyWN2jx4RfGweIwb+hlbJH60KMtCN6uZ9I4d1nzr0Phdps8nlS9bBsq5Xelagp2bMPkFUxw49xZfE+znNYrR3zOFwHzheoR/FQMCgx2Ymz8MC+0RwmhAgnJCdsnsDmcTkahkDcx/exN2dNMDzDLF13pBKSzRDHaibTWj6CAXkIp7HChAMxiUldB4MtD/szC4mQs3+NgPKlTeDkcKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72b9f9c1-3cf7-1abc-4fea-e165ca4620c0@suse.com>
Date: Mon, 7 Mar 2022 08:42:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 33/36] doc, xen-command-line: introduce coloring options
Content-Language: en-US
To: Marco Solieri <marco.solieri@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>, xen-devel@lists.xenproject.org
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-34-marco.solieri@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220304174701.1453977-34-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0035.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b14e094f-1120-4455-52a1-08da000dfd4f
X-MS-TrafficTypeDiagnostic: HE1PR04MB3051:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB30510E6D6DB9168D10F2E7B2B3089@HE1PR04MB3051.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZM5Sy5QBvUHrnQsNNFjDlwMcFYUl82hTeMN5rriAuTuCodVZSpxadbzCfIJ8xb7nKuibH+hili566c/AvlUnrkL/p9D9VSL4B2lr+BxUjmNdMy36o9GY2nP5aeGJUf9sTRiYDZeAyjwPu7qb+14NLnvNg6LrIOiLRTrnArmVbgFjehg5nWGyMuOZVFUiaLQXqIU1d2YZwI8RdH8TAvdDTOjWeLFH1PrUmHckcjpV9kpTAfxO6KK1huNoSb9QoxUGrZwg7gyHNFB2Sm4BYcnXVwNBZdikxI/4wNabN4zfQ5KNeFBjWmZt4TpLqkYWD7L8AQexMinTOPgIcICW2w776Ze5KvXZ5519tgt3/llFr6TDbnl7SXygzuoijd9VklpmTWRNcPmSP9NsnO78kaiE+WbMVqyN2MQPHQGeE6v5QP2ZwwmZB5wPhBZUbaN0kA99Llu8SzSJBcMXA7pKzF45QsPYpkN3ig058mAxLPmtI/yeK+efyFFhPHGYKC0lIN02wvxx8uOLDZtmI8VoLWlfcNmAOYQITfp187znX37BWgQ5ZtuNfXCy55n16atRz3kneILzc8z0n54gL5xKyxxuv0D6V/IaHAot6xGF7/1+g35izu4OFg07wo43D7FURlsiKq4PsTgOyVrWjy08xcKql/QOzhGZtSnKQ9DG3uGXBvtUqyX2W4gRHE7z3IIqGU7bBQuYKqsdW6ctCLQw4IGzHQKpTxZhfr3mXjAjPpqlRoY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(83380400001)(54906003)(6512007)(38100700002)(508600001)(6916009)(2616005)(186003)(31686004)(26005)(53546011)(6506007)(36756003)(86362001)(2906002)(8676002)(66556008)(66946007)(66476007)(316002)(7416002)(8936002)(4326008)(5660300002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3NOQjF4Q0hhclYxRkw2M2RMZ0hlWGFBaDJiOU93bFVaWDdHUUNnU2dnc3cv?=
 =?utf-8?B?Q3IvcVJhdWlOM0d1Z2dia0h3Yk9aamJOTUprR2s0MlIzNVdndm0xYWZicDZ5?=
 =?utf-8?B?ZWptSm5vL1FYM1FncmtuR09TSXVTcmt5dE1iaFlaZVNDdXJldHBlMXpSaXcr?=
 =?utf-8?B?VzRqTUV0Y3lTRktnRmptbk9Cci90V1MzVnhpSWNZZ2VIVUxadmNQc2V1cXJH?=
 =?utf-8?B?Ym5XRExGa0NudVFvK1oranF4NW9odlVmbXMvOG0ySER4ZmNSZWFDengzYzZ6?=
 =?utf-8?B?V3czc1gwN3BWUmgza0w4VFNib3NpK3RvenNDeUdxZi9QN0tGUE1zZHdMUEkz?=
 =?utf-8?B?SDQvcnJQempRcG5Pa0Nja1ltQkJvMkdINUF4MkVscHlqMTN1cWhISHRENGlT?=
 =?utf-8?B?MjAzWERUZmFzZlViSWN4bmZNNlRhTzdmSW1VUG0yeVZxZ1VnZGdCWTRSTUky?=
 =?utf-8?B?S3JHbE15TGxaZXZaMy91MWl1YVRtNVYzR2lNU0J2VEFwVjFQTjRXLzllWjIz?=
 =?utf-8?B?M2JMeldjMEg2ZHBEWWVPSVgwcTZTVEhOdjdYYVlQODlXalZwT1RaeDlkTmtB?=
 =?utf-8?B?SHJSUGlubnk5cWtQUDd5cHV5ZG8yRVUzWUdoY200QWsrMUUwaXBPckV0QVBx?=
 =?utf-8?B?QWNBM3VWQzBCUHNWa3RwSU9yVUdNcDNTZStxbk1JbllZRHRBdHFGTmFnMEFS?=
 =?utf-8?B?WVAydWtRWGtXRXYyY2ltek5BS3h2Q0x2U2FsY2w0eGFXamgvazZOUHpuWmNF?=
 =?utf-8?B?dTJJbkovcld2NzBvcWxoL0dncHpwN3hrU2p6ZDJFbkNRWnBpT3o3dGJwUjFV?=
 =?utf-8?B?cFJYbWVmdmFJRW9lcjdZaWRvSDFIbHdjTXVrMUFBb2VEcUlyZDRaeTg0Qk9s?=
 =?utf-8?B?SzV6TEsxK2FObmYyNzh1OFFxbGZ2QlA4bFZpUE1KN0dzTmprWjNCbllIM0hT?=
 =?utf-8?B?REc5Z0tnV1dSKzVHMm40S2lycU55QzIrY05vM2NiNVBhOFZSUEF0L3lQaDVp?=
 =?utf-8?B?SWI5cktRdlJqT0ZJNHcyMlc4ZEthNjI1a2RsMElTNHNIWXVhWDZSL2pVTStO?=
 =?utf-8?B?cVZzb1BLSG5YeGYyeUgyY3dKNnlqd0tZQWFlcWZGMzR2dDhGYTZoNjA4ZHQr?=
 =?utf-8?B?WGh5S0g1M3FQOHphWnNERWZnQUxjbkQ3T1EyTitMQ21lWEZxczVGRmFlM1hP?=
 =?utf-8?B?c1I5bHQ1L3I3UUI2VTBnd2syMTMzMnhCUFBKN0h0VEZ2VHU3OGJsSkZuS0NG?=
 =?utf-8?B?UEVSZmJseWxKcHY1L2JlVnM3WWhZSDhLeE03Wi8rUVM3VkthSFhEbkk5RUFx?=
 =?utf-8?B?Y1JlL20zU3N0OGhDU3ljM0tXVWR6T1NHYStKMHlyeXhSY1RYMWdUeExRY25k?=
 =?utf-8?B?UU0rWFhsVHFtU1FSMGozcjlkSkQyWW93WGgzb1ZPcmd6c2FvaExTRXA3V1du?=
 =?utf-8?B?eWdmZmFDbFRJc2VjWXNPa2ZNbmx4SVpFcmNJYzNJK2M5eTlVSDZMQ0VKaEtB?=
 =?utf-8?B?czZlVzZJL2pmWFhJR3kyUzFFN1VMTkxDUmI2TC8yQjlqK1V2QzJRM0xmR2hJ?=
 =?utf-8?B?ZTYyYVFVaDVVd2tMQWlGQXNPV29Dbko2c0N4NjZQQ0twQkNmTW1KZm9QdUdk?=
 =?utf-8?B?YTQ4SHNOOHVJaGdha3JoeWpVeHJKZjdXbGdBd1VTVDFleWF5NVAzQzBlbGl2?=
 =?utf-8?B?cVNNOVZvVzlIMVl5anluc2dzaFhBR2daa1FrUUl5MVYvdENSSUlHZlNTNHgz?=
 =?utf-8?B?NEdScTlXQXVTR2hmbG1KWUlrMFZPTjZYNUZVOFl5M1l3UGVKeHo0M3dUWENr?=
 =?utf-8?B?N0xneHJjS09LanJ2U2w2LzdyMm1LQ1lwc1I3dFJQRVppeUdrejh5SDhRdk1P?=
 =?utf-8?B?VVJqMU5zakFNL1dXWlhaVm9mMzVIUGlyMWxRdmpON0hoQnRTY01QcWtpTGh4?=
 =?utf-8?B?TU5UYjY5aWlablYyb2NwaG4zUG5SRk94L2NEaFRQUFMyMkUrU2xaYnJwcGZq?=
 =?utf-8?B?RWlXOUNyOHV3WTFUdGRLYjQ5TVFWV2VFTWxqZ2NoNnpHWXRHc3lIWVF3RUZQ?=
 =?utf-8?B?S1UyRDhtSG91alRFZW85L1JXUGxzUmJ0dXJDTUFWZXFUNzkzZXA1Q0RjclJt?=
 =?utf-8?B?cUhBcXZqRzhNTSt1ZFlKdmdVaERHclFMSlV0S2JGK0VoQmpXanNucHVVM05v?=
 =?utf-8?Q?IblYB1GrKe/E/vM85oecMMY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b14e094f-1120-4455-52a1-08da000dfd4f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 07:42:11.2161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3BaHRwPE6zRMnRxnVopwaPPUeUEZikzJjzQwYy46lozM0OncejbO2faED6ehMCTO7gWs0Wy7uh56JId9fSnWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3051

On 04.03.2022 18:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Four additional parameters in the Xen command line are used to define
> the underlying coloring policy, which is not directly configurable
> otherwise.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>  docs/misc/xen-command-line.pandoc | 51 +++++++++++++++++++++++++++++--
>  1 file changed, 49 insertions(+), 2 deletions(-)

Documentation of new command line options should be added in the same
patch which adds support for the options.

> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index efda335652..a472d51cf9 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -299,6 +299,20 @@ can be maintained with the pv-shim mechanism.
>      cause Xen not to use Indirect Branch Tracking even when support is
>      available in hardware.
>  
> +### buddy\_size (arm64)

In new options we generally prefer - over _. I also don't think the name
is making clear enough what is actually being controlled.

Jan

> +> `= <size in megabyte>`
> +
> +> Default: `64 MB`
> +
> +Amount of memory reserved for the buddy allocator when colored allocator is
> +active. This options is useful only if coloring support is enabled.
> +The colored allocator is meant as an alternative to the buddy allocator,
> +since its allocation policy is by definition incompatible with the
> +generic one. Since the Xen heap systems is not colored yet, we need to
> +support the coexistence of the two allocators for now. This parameter, which is
> +optional and for expert only, is used to set the amount of memory reserved to
> +the buddy allocator.
> +
>  ### clocksource (x86)
>  > `= pit | hpet | acpi | tsc`
>  
> @@ -884,7 +898,17 @@ Controls for the dom0 IOMMU setup.
>  
>      Incorrect use of this option may result in a malfunctioning system.
>  
> -### dom0_ioports_disable (x86)
> +### dom0\_colors (arm64)
> +> `= List of <integer>-<integer>`
> +
> +> Default: `All available colors`
> +
> +Specify dom0 color configuration. If the parameter is not set, all available
> +colors are chosen and the user is warned on Xen's serial console. This color
> +configuration acts also as the default one for all DomUs that do not have any
> +explicit color assignment in their configuration file.
> +
> +### dom0\_ioports\_disable (x86)
>  > `= List of <hex>-<hex>`
>  
>  Specify a list of IO ports to be excluded from dom0 access.
> @@ -2625,6 +2649,20 @@ unknown NMIs will still be processed.
>  Set the NMI watchdog timeout in seconds.  Specifying `0` will turn off
>  the watchdog.
>  
> +### way\_size (arm64)
> +> `= <size in byte>`
> +
> +> Default: `Obtained from the hardware`
> +
> +Specify the way size of the Last Level Cache. This parameter is only useful with
> +coloring support enabled. It is an optional, expert-only parameter and it is
> +used to calculate what bits in the physical address can be used by the coloring
> +algorithm, and thus the maximum available colors on the platform. It can be
> +obtained by dividing the total LLC size by the number of associativity ways.
> +By default, the value is also automatically computed during coloring
> +initialization to avoid any kind of misconfiguration. For this reason, it is
> +highly recommended to use this boot argument with specific needs only.
> +
>  ### x2apic (x86)
>  > `= <boolean>`
>  
> @@ -2642,7 +2680,16 @@ In the case that x2apic is in use, this option switches between physical and
>  clustered mode.  The default, given no hint from the **FADT**, is cluster
>  mode.
>  
> -### xenheap_megabytes (arm32)
> +### xen\_colors (arm64)
> +> `= List of <integer>-<integer>`
> +
> +> Default: `0-0: the lowermost color`
> +
> +Specify Xen color configuration. 
> +Two colors are most likely needed on platforms where private caches are
> +physically indexed, e.g. the L1 instruction cache of the Arm Cortex-A57.
> +
> +### xenheap\_megabytes (arm32)
>  > `= <size>`
>  
>  > Default: `0` (1/32 of RAM)


