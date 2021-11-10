Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 686FF44BC3A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 08:42:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224211.387375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkiEA-00085c-RX; Wed, 10 Nov 2021 07:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224211.387375; Wed, 10 Nov 2021 07:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkiEA-00083e-NK; Wed, 10 Nov 2021 07:41:02 +0000
Received: by outflank-mailman (input) for mailman id 224211;
 Wed, 10 Nov 2021 07:41:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2fe=P5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mkiE9-00083Y-3k
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 07:41:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bb3e488-41f9-11ec-a9d2-d9f7a1cc8784;
 Wed, 10 Nov 2021 08:40:59 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-OcmaSEmQNgiYrMYzsXuw7w-1; Wed, 10 Nov 2021 08:40:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5904.eurprd04.prod.outlook.com (2603:10a6:803:e6::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 10 Nov
 2021 07:40:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 07:40:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR0301CA0019.eurprd03.prod.outlook.com (2603:10a6:20b:468::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Wed, 10 Nov 2021 07:40:55 +0000
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
X-Inumbo-ID: 8bb3e488-41f9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636530058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2xb6oeZURi1BjOi+lhkPpWY/Axvg0uHMw9sQrKjibRU=;
	b=dQIO/tVQdCiBPRm5z+m2nJv+/ui92kmQnOOPhVnuoJNJJWjY3Tn3T0MPbWVmyUELoUr0qm
	YO5TLlrVhL5vX+ZECW3gpIRpLTPulQiKOLDaltfYSFeJDD9V7/L7uF9/qURIdvLOZpi5Vz
	vh67COjsbekOYDfrHretYbxwYa8vypE=
X-MC-Unique: OcmaSEmQNgiYrMYzsXuw7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TycyWrBhf7W/rG40YfZCXdYOCbIXjXO1XtRNzmJB8tymFa2vfy2fOG1P/+55s75rmvjJ7HtRLzXo+PSBzacq+kcz4GO2+GZZNpjKajDQoZGeUuSN0rlG8ZEYGdDyaKPHcFNpHUGw+yjd/7QQC3QEX0sUENtsvOcvhnboW/wobghW03qjDfVYRaCx4UxXNxjf5NBobiflztOqfKsvfAGZ4+jWNXRZEdItHx7VAgCt+6KoWlTazuit5J9+fvaH3hQa9ienpoZkpAHjO5pN5OStHoY+nOGq/Ik6Nd83bRP24nFGsj77FNTN7L7EINmmX1xOrkww1pnz3nqhf7d3geJ9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xb6oeZURi1BjOi+lhkPpWY/Axvg0uHMw9sQrKjibRU=;
 b=XTa0Jw9PZYynTVNS+h1EGX6bN1OP9P9/UM78O6PeFt1Vm5jNU7pwtm2yDp20RFJwpv+NqPjShYT6gdspPVrMASHPlS1Wj2DO1tAGlk2OVhjWu2SO+uVrXdf13VgacevTjFB9j3q5Gecmu/zS0hoDATPQelEolgLNYfSfBsZa42daY/PKnuva0OU8jgFXewe+5uiSeb06c3B2HoPqF1PItjIyvuCzs3OAvxhbABlDcIlYnMTRVlqjddhrwb6Wso3uPqeaKLxb278ijz9UzF9UEhY81LUOj9zh7RUygEJDLxOkQDtNwtGHtV/McKWr8RS2mTIGrilvgyHUOTCiPEb5TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb273fb8-fa41-755a-b9c5-b16d3bfbd3b5@suse.com>
Date: Wed, 10 Nov 2021 08:40:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Luca Fancellu <luca.fancellu@arm.com>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
 <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
 <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
 <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
 <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop>
 <e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
 <alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop>
 <9bd58aa4-602b-4c64-e759-581513909457@suse.com>
 <alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop>
 <191dd1b2-8e2a-ee91-f401-dda4fabf4c7c@suse.com>
 <alpine.DEB.2.22.394.2111091350510.440530@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2111091350510.440530@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0019.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c3df1aa-201d-4af5-4f4e-08d9a41d6e48
X-MS-TrafficTypeDiagnostic: VI1PR04MB5904:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59047BB15963EB041114D26FB3939@VI1PR04MB5904.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qyzwMGoekvvQltStfHjOuXkdksADVSPN/XQNZSxh2MZf0IVFX4sCLLdwXOlFVO+y7k1gw8988Lr8XYdAv2jppg2nMhGUIyLn6RAX4aroD1k80vnQ8AbNKPss26wt2AW5T+BZxUeDXU/Kmn0JhyWcjePQPJkMYvK8sTGDXMImmEh2Z5Gl+BSAyXpuUACldqp1TeF9x53xYZB/79Z5zS9yCtRyrYC74OWXdoHfUcD725CaM5bqctdT4A6sfJ+OEtNS7wlD/VYrQpq9emHo0AbA1QnstVr/ojvHXXrP99K0bQol+/UjoOZoGUG/ygiWFD/KTAKtJsLHmswRZ18bfM5DmjpCfXrxwscoKFemO33LqTjVPA3v1y+Q9Ktph1zorvzZYNTDaZcUdS+V+mTaUrTpYtyygMCU5sv5/igbKzF85of2fcuUH9JacwO+QF1KnVm+WwIFKtJWJeNeXPY+sni0sIU1GDFRAXUM2TCZD/TSpNDUSXmGODYKvA8mAwoIsn5fevWmukjkV21lZOx1dnG3STCykuW4E0ydZDn7jkz9erZGV+W8qTiEOVHziiQ8D3xJzlXoyqpyrInr6AK2CrsxNYF5ODepgdXuuRgnZDifRJV3UDV/Pol5JKpotnleiUwDEs5N/w4Tf353JlmU/zY5soIuT1LvTwYznceooCg+0rcjnozKnGrrl7mRszuUcfHJKADDrlnwj2V0z8SJ6Tj4/LUKKB6NdrWaCRwry4x/HEU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(16576012)(316002)(86362001)(5660300002)(54906003)(38100700002)(31696002)(36756003)(26005)(2906002)(31686004)(6486002)(186003)(8676002)(6666004)(83380400001)(4326008)(66476007)(66556008)(66946007)(53546011)(508600001)(8936002)(956004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXg1OHlMaTFFUDRSUmUvV0xuSlNuSERrWDdFSm0zdFRSZVVrdEl4bHJENXBk?=
 =?utf-8?B?c1ZGTHdSM3dUSDNrczdLWDMwRnM1cUtuNzNkVmlPNklZL3JINkNuY0VHeER0?=
 =?utf-8?B?UnZDeE9XTU5SZVR1eUI4dDZoUlVPRm94bnpjcEU0MDFrejlaUWZhQVpCZkVn?=
 =?utf-8?B?VEVYWE5rR25Cc2l5blZvRVA0a05NMXdFWEtSaUFka0pONDFJMUVPWUdGb1BH?=
 =?utf-8?B?S1M4NExSRkhaUi9HNzdXYW9EUUtGT2F5b3FWcEs5Rm1Ea3hDTUhnd1A4Tmtn?=
 =?utf-8?B?eUlqOUFGTm5ETjRsc05ERW5MSEw5TlkxMlRtdmlSaEwvYWZtd1N6YVB2V0NL?=
 =?utf-8?B?SGJDNVhqblI0d3o4SUIrUWxhU3hkY3JYOUlxZGx3cmM5V0k0RnNDcWorKzQ1?=
 =?utf-8?B?ZzF5RnBwUWFVYzVpQ3RSa1FuZ0xNa1BWVVdlWS9xYW1jTEN1NDUxMlMySTNM?=
 =?utf-8?B?aTJKVHNySFE4a0NLSndDQXIveC9IblBnTzBIT2wyd2R4TGVkTms2OURKZ05w?=
 =?utf-8?B?MFpmcExrb3dLYXFtdENpSUpTOS9mU01Gc0t2dnQyK0ZrcWtTZjhVQzI1ZG04?=
 =?utf-8?B?em1LQ0p6cG1TRURQMzdZcWkzVGZDMkN0WG81eXh6UUlJWWZQTUFoNlZlbXd2?=
 =?utf-8?B?V1AvZS9hdENRdDc4R3J5RUZEcGwvcXllZEUxZ2drK0VMVUJYSXFRbjBaTkRj?=
 =?utf-8?B?bjhwelVTSmIvTGtzSkdyU1hYYk00U1lQOGVnNU54SFh0SXphMS84eStVTGVI?=
 =?utf-8?B?UEZRY1RvU3d1anpHWGFVejBsa1YzcDE1eTI4alZUUlRTWmU5SnFPSFZML2RR?=
 =?utf-8?B?QVc5YkhuWUp6dnpQdHQyeGwrdVU2WkFSN1ZJSm5RTjJUaTZVaDU5OGRrM3M5?=
 =?utf-8?B?VFJObEdNWSs5azZ1NkIvdmtkRFFlN2hKakVpY3lXL3h2NVJCZjJ6VTVIdExm?=
 =?utf-8?B?V21YbFk5azllY0hYTUlxY28rWXNBdGcxM2dzb2VZUTZObnM4MXlQUmJxdFlk?=
 =?utf-8?B?L29mV1NnRXFBblp4WjlWV05XTzFxZHEwTlNPRGRNSS9sMWFEa0RTWmUxZzVh?=
 =?utf-8?B?WmJHVHBJak9GR0gwKzNHck5kYzFWWEx4MFV4WVV4bUpiMnJwYis0T3loWkZo?=
 =?utf-8?B?WFlIMUxuR05lODVoN0pualphZEt1NE4venpWMnh0d3hIS3dOUm10cUl3b1Zw?=
 =?utf-8?B?ZDZNRElJa1JTMFcwdG5VUGFqUURkRWdreUE4U2toeWRJRWtXdXZPelZ0T2JJ?=
 =?utf-8?B?anJmNE41K1pCaHJCUUZGUGVQbDdkb2gyY3NBcUg5Vi9OSFl1TWFrWU9xclc2?=
 =?utf-8?B?WENya2xvWDhDQXJ0MG9TczVQZVphcDliVVZHOTIxRDJoN0JLck9RbUJXTnRT?=
 =?utf-8?B?NGx3YUE3NjVJYTJBVTBaOEVENWFxSkRGZXI4RTBBeDhkYmRxTHFSeWNGNWp6?=
 =?utf-8?B?RFdlY0xZRTR1YjYvS2oza1RBNjUzbEhvK3hxTUEwaTVWemg1UWtPOXR5VVRL?=
 =?utf-8?B?OFBFTXMzU1VNUUswbDZKNWlhS3A4VkhJMm5SaGQxelFEWWd1K0ZyS0RFeWJ0?=
 =?utf-8?B?N3lxdGVGOWRZbnBCR1dzY3RpSk1pbUtMOVFpYWZJNlNtbDZ0YmJoYnlUakFx?=
 =?utf-8?B?WFlUalI3RTFRbVJNa1dkMjJhUVVxY09pMm1qTnQ3R3ZlaVlNOXhUNDF3M28w?=
 =?utf-8?B?a0tVMFJTcVUrNWZ2SWlZZkc0WXkzT1JwQmhwQzgwRW1jcEVlWlVFL2dRVzBs?=
 =?utf-8?B?U1FsT3BiSTBUcXcxUTQyUnJZUko0c2t4NWsrcmZTdk5YSXBtTlBuSUtOZGp0?=
 =?utf-8?B?ZzZiT2NwUFloZE8xN04yaFk5RGRMWDdiczArZmxXZFhaYlhNeUVwd1FTRkZ3?=
 =?utf-8?B?WVN0dUJoQVJtSnNIbjBXY1BDdFBQZjlXRWZmdmxXVzRYVmU2cEtCS05rczFr?=
 =?utf-8?B?bmdRRmw2YkkxNXljWnF1MTVrT25UMWp1d3NpNmNxRnI1NFh6aGZ3ZG8xY0RW?=
 =?utf-8?B?cHd0c2pndXhDeXFiSjJkNDI3STA0N1JzYjFRMmkzUHlhdzRwR1I5eHRZZnB1?=
 =?utf-8?B?VnJZVVFBTFkxLzl2L1M0SC83TEw2Y2JzZU1oR1pxRjZoNWc0ZVpTbVhrekJu?=
 =?utf-8?B?elpSMytkVzhrNDFESHVQMks2c0hQVTJHY0tWaHB4RXZOSHU1QVp6alNscEQy?=
 =?utf-8?Q?LmEYEbbsPGNqiIkScO6g1ag=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3df1aa-201d-4af5-4f4e-08d9a41d6e48
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 07:40:56.3064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8dpH2RoweDdj66WTikkzPYERGVZu4C2gdogvWcuss1J7oP0XoaKLT2S1kP0zaan5de2iLZY8uEbxg414hZw4Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5904

On 09.11.2021 22:52, Stefano Stabellini wrote:
> @@ -862,6 +856,7 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
>  {
>      int chosen, node, addr_len, size_len;
>      unsigned int i = 0, modules_found = 0;
> +    CHAR16 *fname;
>  
>      /* Check for the chosen node in the current DTB */
>      chosen = setup_chosen_node(fdt, &addr_len, &size_len);
> @@ -871,6 +866,8 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
>          return ERROR_DT_CHOSEN_NODE;
>      }
>  
> +    dir_handle = get_parent_handle(loaded_image, &fname);
> +
>      /* Check for nodes compatible with xen,domain under the chosen node */
>      for ( node = fdt_first_subnode(fdt, chosen);
>            node > 0;
> @@ -902,6 +899,8 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
>          efi_bs->FreePool(modules[i].name);
>      }
>  
> +    if ( dir_handle )
> +        dir_handle->Close(dir_handle);

Weren't we there before, resulting in the same problem that Luca's
change attempted to fix? get_parent_handle() simply shouldn't be
called unconditionally aiui. I could see closing of the handle to
happen here, but its opening imo should happen the first time
allocate_module_file() is actually reached.

Jan


