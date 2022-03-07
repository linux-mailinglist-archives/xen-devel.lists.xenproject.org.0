Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3304B4CF296
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 08:28:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285653.484878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR7n4-0007E0-H1; Mon, 07 Mar 2022 07:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285653.484878; Mon, 07 Mar 2022 07:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR7n4-0007CA-DS; Mon, 07 Mar 2022 07:28:22 +0000
Received: by outflank-mailman (input) for mailman id 285653;
 Mon, 07 Mar 2022 07:28:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nR7n2-0007C4-PU
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 07:28:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28ea92d1-9de8-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 08:28:19 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-ti3a-uU3OBa5fj68man-Hg-1; Mon, 07 Mar 2022 08:28:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PA4PR04MB7646.eurprd04.prod.outlook.com (2603:10a6:102:f3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 07:28:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 07:28:13 +0000
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
X-Inumbo-ID: 28ea92d1-9de8-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646638098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jyxxv8GTl8y+hQQym9L9nFDOc5vItDRJsUKCqsZ7LDM=;
	b=S8A3Pmdbi40WxVJcl+GnOVLzdNpzTBjN0pTFW2HZalrtwpICSPxTKHs0GriFtC0PeaB2n5
	rkVZiJl7PXCMk8hE3b1hTfdvZIoAHO5IKbp4LD7NcRuYP3yeGK2PDqoWMeCFxCP7pTxEy2
	nj3f/F+b1EXeBkKLZI1Vs+ycrT2qBmc=
X-MC-Unique: ti3a-uU3OBa5fj68man-Hg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcJ+da8/bRRh0P2Dp3xtWAlNMnZs9T6ubSqTISduIgE/70l8zxOxfZcH99f3aR0Rc1TSemFkLNyMiuaLMlOecuAqweLJ6f2wY2Rw+i4DlacVWob3jVbSBuQjovvDt2arqFwU+8QrkXtKW0UXBE1AlEfJJHt3Zet/pChvY/b7hgP1fvYAyMtTI3irUSxbyFuTWFl9yWkeSWsaU8oKfIoyzwR4F6BRs7sZViV5a5ZGRS2H+HR54GQNufhGV7cYgjXKZRB63/YeR/VwkFw++JAVJxy5JN3NBsWmuM9nOTd505QlJ6zKmLB6VWZcGu1hrTsRn6uh4MI0CCqCCLt+yV3/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyxxv8GTl8y+hQQym9L9nFDOc5vItDRJsUKCqsZ7LDM=;
 b=HpKK3+YKKkO6t7AA1IUNrgeVoiBmpdFtk1YZU9pDZJaX8oVuY+b+/VyrvKNY2Gk8+VyPe9KNc3q4yGaoLMdvUfyvd3BIQutMieu0Ay8x8Dgpaz9Eln41fkNVX0zaFf7DTsXAvKLLe9XmAvzCTyZbOtRKvLZZ2uGYqL/HdDxlcBlYtx8OZeE+6iUx7blH6OiiVXRmS27jNuB4gON1KpofQDBWEkmdUbBvu95goidqUgyG4nZL82ra2Tk+OwiLddx03sRqpl6/PogHdKRPIIbaVqEodGJQB8GZu/ACvwFE7kTIq9+tMG/9H+apwh+DOdJzPmqxoD/Npm8Yhz+RQ/t40Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8461cbd-78ee-69e6-6a1e-43039e8290a9@suse.com>
Date: Mon, 7 Mar 2022 08:28:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 09/36] xen/arch: add default colors selection function
Content-Language: en-US
To: Marco Solieri <marco.solieri@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>, xen-devel@lists.xenproject.org
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-10-marco.solieri@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220304174701.1453977-10-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c9affd8-a2ab-47f6-97dd-08da000c0a37
X-MS-TrafficTypeDiagnostic: PA4PR04MB7646:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB7646C23F85B6BA79B3BC6BBBB3089@PA4PR04MB7646.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n1yOLWZf9lOyYGsp4/DDnB5lhkZGHfUk/yPvG+2y96O8kifd4nWjkCie2YB4dB+E3eFfag8N37XYYPNT/RrDnoqM1JgKmRY/kR3k+FsbmWOrGvfdFEFSo0FvxvCwA44OOyXXwo2WKfKQTeXUplfWXa13j8fGNAULbUw0B8j8Sp5+cp+QmRnSx3hQw0/5rCWMr4xA1ZFFlgphQKsvLcAQV+jtGnWn6Cu4ssf2qA9cMRjAr9ZVowhQkOiHHffSZi6yjBSQDuD20fsgXo+zstMcnSH+uAPgAf1uddMSP89RrEf9gCQI/xDUxsq0pzhWywwfcEY9APoeDYqp61pr+GQhgdA+ibRcbE+Ht8UKHqayVMsiJ2vyuhju+neNDquYH/qYdPbvs8l6QkyYsOkrQIxEvaOvnuq4IAk1zpgarU1elq+d8+/ryI9Pad3V9N4isW66DnPVG3dWJnn8H6mp5ryC4fcMrQr56eIvSkVaoVEjA5PGlY+BsQfenSXBsVxqk322MpXyAOdm+Lq0no5hhzVMdh95MpaQB6ITJKXcFn0mbJeXIPDx0L1U6k0tmSH6Yn2h3ilBR/deENBpYs8LN1ln39xkp3zv1FPSuWPQQpp6AIGgAMEabGXNNYiQyu6odeHqcUH0aA7Rbmwh4Z0JerixGi/Ka9Yv/3DAi1T30O5vlWwwf8ThNVrwqik+diDzQ/pPKVF785bGntO6wKmeMOSz/1qdxpeHn3N13fFvBN7qC+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(8676002)(4326008)(316002)(54906003)(31686004)(6916009)(66556008)(66946007)(508600001)(66476007)(31696002)(7416002)(5660300002)(8936002)(6486002)(36756003)(38100700002)(186003)(2616005)(26005)(2906002)(83380400001)(6512007)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THlic1VGUit0OU55b3NqVnVlNTY4K3ZEc3c2eS9DQURMSDR0VnJDaTR6UDJW?=
 =?utf-8?B?K2FwRXlXeFZsZDgyMXNWYTRGVC8vTjNYOFlPaERETFpmeUVYNHZJNmFRcDBR?=
 =?utf-8?B?VGo3eXBFYkF0WFJTMit1UlNPTG93RGRqV1I5VTY5TGJhUlN6eUZmM3NGZEVJ?=
 =?utf-8?B?RmRYWFY1Zmg1YlBJSFpHajhld25vRmU4ZnFTYVk3YTVTQmVES081b0gxdUlS?=
 =?utf-8?B?b09VZzYwYnlEQSsxMlVmRzRsZzk4WGFDZ2tlMXdWMTFmZ2hLTzFBME5WYldL?=
 =?utf-8?B?OXhxcElXN0ZNRlRTNmpPalRKUFN6Mlo0bU1TUHl5T1V1VElVN3RwNDFpV0x1?=
 =?utf-8?B?NENQTVdFejI3N1piQkJtb0R2RFdiMkhSekthb3Y2d3BhOHNYb3ZGWko2SE1Y?=
 =?utf-8?B?VW0yMVJmQ0RnSS9KdHlUNUd3NjYzZURDUVgvT3FzTVhTTGNxeHB1d1dPYmlz?=
 =?utf-8?B?dnZSeDkzK2xVNVN0UkljZEhpMWZBSEVaUkRYUld2a1hFeU1qT3hLZHp4R2FN?=
 =?utf-8?B?UWR6QkNqczN2S2tjSEt1cjZXbWNmbWlvRkNXdUl3Sk8zL0RENTJEUG1ac3ll?=
 =?utf-8?B?a3NCZnZKejdFUHJ3MXFFT3JvREtRY05UK0Y5Qnk3V05nOWlXS2QxTmtkOXRw?=
 =?utf-8?B?YzBqRWhxU1E4UXRhenBBblVHWjkyS2hiZkpHSytvcGJ4aCtZMkxLZjl6TFhq?=
 =?utf-8?B?bWpvdnQ1aWNLdkJFTHVUYUJCczVFcXBPQkZIZ3A0NmkxcEl0Y0pDR3prTHpi?=
 =?utf-8?B?TXFnOHdhNDZtZG5CQ0RYV1EwRkRMMUNSSFEyeW5JcXRxdlNabGdXNlZITGdT?=
 =?utf-8?B?MzMwbWNPZnI2SS8zMzJ6VzBZQWJDRzN1a09IQzhCSk1MYThlWEhQL2RqQi9U?=
 =?utf-8?B?anlnQkIzTEtWMlVNV0hEbWFQd21FUWxVU2h1ZzFxdVMrd28yVzRmTm1ZUlBW?=
 =?utf-8?B?MUNBWDcxMFhUY2hIRkFkTzhBaGd1aURFLzVlbUQxZXBTV1JOeW02VDFTMWUy?=
 =?utf-8?B?bGF0SDlwekxabkZQY1lkR2NIRXZDQ1Q5STlOcTFldk40NGhnSEZKZGZZeElw?=
 =?utf-8?B?dUo4ZTQwWXltcTRYeVd3T1VlTHBEVzdoTUhNNWxhS0kxQXcvVU5lYW8yaGcx?=
 =?utf-8?B?TmVXQ21DMVFnRS9CRzVLemduTk1GZTlPR3VqYitBY2JoYUZjVlJYMW1hQlRj?=
 =?utf-8?B?SHFjWXJtZ0JGU0xkYlFBdXN2aEQvSjhPYWh6MGdTcWdIR1AzblRqdXloK2Iv?=
 =?utf-8?B?WWVRU2dFQmJ2UzMzY09vVmc5V0xLZVFZeFR4RXBnTFBybmNqZkhkT01XdWZB?=
 =?utf-8?B?WkQ1cUJFNU1UeldZV0JWdkRFUTV2bHpnRm0vNk5WaEw5cG03RlUyWDVoNHV5?=
 =?utf-8?B?UlM1bmhtckpZbTltTFZBTjB2eVBzTmsyQjRIQjJFQXlPTDIyZkVsTjIvTENS?=
 =?utf-8?B?Rk1BWVNjTS80c1lRbUlWTkRabHllK3pxUXF2WjhOUGppb2Iya3VxcEMvMHAy?=
 =?utf-8?B?RzdFcTJCS0FwQmNMMWFZeVFVWnE2SWMxOGVUZFNpMGN4M0o5aUNUTkg1WDRx?=
 =?utf-8?B?Q3EzckRwbDlWUTVEZlR4TjdoSmtWZzI4Z2hqdHFKa1RXTU5Od2dFb2QwNEtJ?=
 =?utf-8?B?RXZybVJIOXFQdUNaMnFIaG5TZFUxTXJ4RFZ3dEVQMkp5Z25PNGZDYTc3NGxP?=
 =?utf-8?B?SHpSU01kSWtvWHlVeDFYbjFKMWgwNHY2WnpsZWdCUWVUNVErZ0tJZk5qWW5v?=
 =?utf-8?B?ZEpVcTlRZ3FTMGFIS2I1UGRYamp0QzF1WUZpUE9uTHNDMjE2eHRyN1g2c3Mw?=
 =?utf-8?B?Yk9LbDVDYUMxTW1yUktyZ2J0UEJvekRYM0VWT1pta1VyWkFFNHBQRkJBcGFD?=
 =?utf-8?B?Rnh5NW1zaWZzUXJCdm8xOGJpOXhCa20vTFc0cFJMcExpY014YTRHdzZSSk1n?=
 =?utf-8?B?YnNoM2o4TS82SUtmWVNjZHkvc0hsOE8yNzMrQWRqd29aUFUwYnRBbG9QR29H?=
 =?utf-8?B?WGkzN2VGeVNSWEsvakswQ09vNEdRTGZTV09pa1ZTdkViaWVEWGFxL0oxQTdK?=
 =?utf-8?B?RWZDb1pwZWpPVzJZd1VWQ3RBSmpQSFlCQ1lNOURibkdVV2k5Yy9CQUJpNVla?=
 =?utf-8?B?UDJESGZkdFFwUVZjdFZYTEU0RVNCc1B5bHY1QW12Y0liU1hSQ3VMRWFiSkZB?=
 =?utf-8?Q?CgpqF5W1vbgWwgPFC3m1Pjk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9affd8-a2ab-47f6-97dd-08da000c0a37
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 07:28:13.8619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seiKOu8LW2NufKeJyHl+YD/H3xnfkKnS/CJXklq02kmiUauNajPx7eiwu9MzyBeFbSU6eebZRMd2ZSFn5RNfYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7646

On 04.03.2022 18:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> When cache coloring support is enabled, a color assignment is needed for
> every domain. Introduce a function computing a default configuration
> with a safe and common value -- the dom0 color selection.
> 
> Do not access directly the array of color indices of dom0. Instead make
> use of the dom0 color configuration as a bitmask.
> Add a helper function that converts the color configuration bitmask into
> the indices array.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>

Nit (but relevant because it might be misguiding people just glancing over
the series): Did you mean "xen/arm:" rather than "xen/arch:" in the title
here as well as in that of the next patch?

Jan

> ---
>  xen/arch/arm/coloring.c             | 36 +++++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/coloring.h |  7 ++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
> index af75b536a7..f6e6d09477 100644
> --- a/xen/arch/arm/coloring.c
> +++ b/xen/arch/arm/coloring.c
> @@ -143,6 +143,42 @@ static __init uint64_t calculate_addr_col_mask(uint64_t llc_way_size)
>      return addr_col_mask;
>  }
>  
> +static int copy_mask_to_list(
> +    uint32_t *col_mask, uint32_t *col_list, uint64_t col_num)
> +{
> +    unsigned int i, k, c;
> +
> +    if ( !col_list )
> +        return -EINVAL;
> +
> +    for ( i = 0, k = 0; i < MAX_COLORS_CELLS; i++ )
> +        for ( c = 0; k < col_num && c < 32; c++ )
> +            if ( col_mask[i] & (1 << (c + (i*32))) )
> +                col_list[k++] = c + (i * 32);
> +
> +    return 0;
> +}
> +
> +uint32_t *setup_default_colors(uint32_t *col_num)
> +{
> +    uint32_t *col_list;
> +
> +    if ( dom0_col_num )
> +    {
> +        *col_num = dom0_col_num;
> +        col_list = xzalloc_array(uint32_t, dom0_col_num);
> +        if ( !col_list )
> +        {
> +            printk(XENLOG_ERR "setup_default_colors: Alloc failed\n");
> +            return NULL;
> +        }
> +        copy_mask_to_list(dom0_col_mask, col_list, dom0_col_num);
> +        return col_list;
> +    }
> +
> +    return NULL;
> +}
> +
>  bool __init coloring_init(void)
>  {
>      int i;
> diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
> index 70e1dbd09b..8f24acf082 100644
> --- a/xen/arch/arm/include/asm/coloring.h
> +++ b/xen/arch/arm/include/asm/coloring.h
> @@ -27,6 +27,13 @@
>  
>  #ifdef CONFIG_COLORING
>  bool __init coloring_init(void);
> +
> +/*
> + * Return an array with default colors selection and store the number of
> + * colors in @param col_num. The array selection will be equal to the dom0
> + * color configuration.
> + */
> +uint32_t *setup_default_colors(uint32_t *col_num);
>  #else /* !CONFIG_COLORING */
>  static inline bool __init coloring_init(void)
>  {


