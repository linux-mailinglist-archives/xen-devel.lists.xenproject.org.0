Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D4456EE3
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 13:35:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227828.394143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo361-0005jC-7w; Fri, 19 Nov 2021 12:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227828.394143; Fri, 19 Nov 2021 12:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo361-0005gU-4H; Fri, 19 Nov 2021 12:34:25 +0000
Received: by outflank-mailman (input) for mailman id 227828;
 Fri, 19 Nov 2021 12:34:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo35z-0005gO-QX
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 12:34:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0579bf76-4935-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 13:34:21 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-FFIZtvazM-S-vvcxapHTjw-2; Fri, 19 Nov 2021 13:34:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 12:34:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 12:34:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0070.eurprd04.prod.outlook.com (2603:10a6:20b:313::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Fri, 19 Nov 2021 12:34:10 +0000
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
X-Inumbo-ID: 0579bf76-4935-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637325261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yQ4mYTWdI627UFE54cE0Y2ZnmHlgdUOswhx5HOMPLhM=;
	b=bnn+04pvYTP6n+BsxLXzPwuhUxIR9rtNEbjUKFmNQXMEuwNTq5jqAF2ANHhwWviuivtAME
	6i48mJhsnSuFBuD6fyPo6FP4fuWlRzQ3P6uPLgcHL7Rldf0L1+i/8xYKY+9OWdKd/Ji6Ta
	9T64fEAfUf0f3HD3kHIr6xcD58wwIyw=
X-MC-Unique: FFIZtvazM-S-vvcxapHTjw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAQ8tyjVFYScj75jscQrBcDf2u2z4S/ZBg3ct8Wy4tCyfxXct7ktObTlYH1pA8dg2YMfSbjl9kmTe5981f8bBl2rOM9OaMIT7d066m8X5UTKOlquax7jCJ1O0yrugVbo2k6TyxXYMM7qcB1AiJtm7g8o5kDD/qQUZFLJxCd8jWnmQ+qRHjahfCaxnkhfq0gzyHTaPxtsVty8KDMayLwHhiDie5S7CzidyVh/25brEJuRtYy3uAEXEF8kda7ADovlwGOnQluG1cgQ9ERhSequHqqanS+8//uigzOgeLG/HknDHB7C80kFWj67zWS+zb48JKrpFeJ02wthkPoRQD+gWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQ4mYTWdI627UFE54cE0Y2ZnmHlgdUOswhx5HOMPLhM=;
 b=E2j+6glfQF4eZp2HwLk0eFk0iTe2gEWM/blzqGHY0HCT+aC8QrjhCDiGhXgCqm3glSEzQBjJnrd9q41ItN/fS8WrIiasWvH/voPbjPCUpA0dQNmyqqSMCAKpiHqorYpQxHOyF4cf/DRwAorFpH8jtLfEJaIav1rQgk3Sc4UGleBWvqm1RaRFlysS1UN+5aU8SfGhD7xAVwTssEupd/Irtvu2pebOhs5+rDVkM54NOlZyu4S0VYMXVBIKjhwUnqwwt+xgXof49CZDSkXL3gagd3LZQz00Cy3JJ9ZFQd5mZhn9TrNOuhfM1KwMNkKV6yMW5SSp2Aqf+tjbUENyEd07Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e64d3e7b-a725-07aa-3a03-512868527221@suse.com>
Date: Fri, 19 Nov 2021 13:33:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 07/11] vpci/header: program p2m with guest BAR view
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-8-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105065629.940943-8-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0070.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e461f5c-e0ec-4169-5f09-08d9ab58e6f9
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB532519FDF69E81BDE021DC95B39C9@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZTQpw5YCnXIXKXNKgaUrYQX4H7x8ptQpJRXMvsAuJXMqJ43ufCpci3TT4839oyio6/lf0Gs9+K5LdQuVxIVuofaZ7VLyV8VReQijm7D9c/zQ2uCVxZ8NqqqLgUSdLREBVBphs4Y8NkzOeXvYndpCccb5G/yO/pmBCODpwxhZBQ1YtuHTpP9v9AcsBUDeudyJc2MhsEZIatk0Mfa7Ql7G3kPocBNeEvcGUX3GhF5TAH274pQNy/d5goyu2n7KX/y5w0dmtNUdfKel09ckm2fw4Q3xY8x+xtEKxgYhhUtGUNYzt+cD/pZwjF3y3ve22GVKZti05L1nABZecRP6g+hri55BUpO4CwJeDdICObdLI2LUwfc8PXoGIKdAYTLun4SnTjoFahyYEeCennEU/HVBVYU9XDnUTiSPyojBYbphATlnmU9O4oAa7BU3E3QOYoFhCR+IRcuWpzN/Sej3Jp0mvqO89A3RdWaOCfdxD+B9Ob7FcgARy6QFHbm/soLwORI6pAVMAd8EP3eo+6a7l/lghim9VuFhVxBCQyDeqPQA5PYUwER3vh6lE+ySfsCBnQkRnvawPnZpghnB+5A7FCIxGcE0IXiiPg/TaNNwSP4RIzuRLc0md61UyqARZ91AEepxSQ0ZswU+459eHDfDWUqg7VClboNsV2LtbcOgk98pTl5dYikT9f1qruXlvqd9BdSeGbqr81X8DWM1YrwlAYFhIlT6QVlI3p3Fo4CjFrrkKVY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(6486002)(66476007)(66946007)(186003)(2906002)(6666004)(66556008)(86362001)(31696002)(2616005)(7416002)(8936002)(16576012)(508600001)(316002)(38100700002)(53546011)(5660300002)(4326008)(31686004)(26005)(8676002)(6916009)(36756003)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3JpbDJuTWdsbUJnUlFnclEreXY2QUx0TkxSNlB3aWo0UXdLWFpSOC92SkJZ?=
 =?utf-8?B?RXI1MXJUOHk1MkJFOWdETHFaTmR4SmV0Y09UTXBZWWhTcHoxM0lybTFsaEM0?=
 =?utf-8?B?a3JZdTdLeGtXampoaXNZRjFWc001bmNHNG5OdCtySkhTVnFRQXBuekhhVDl0?=
 =?utf-8?B?VU9wMFhET09xMExoMDBTUExBOE5qMVltOFZPdi84ZW9OYkNCanVFaWl0TEwz?=
 =?utf-8?B?TzNHWEtsS0hVWDZkb3hzais4Z0pKL2Z3ZFFpZEVRdEVpRGF4Uzg2ZTF4UnAz?=
 =?utf-8?B?S2xSazRvdWdFdENtRTc5L0RUWVRBTmRidW15anM2azhBbWUxQjZUd1F4Wkt5?=
 =?utf-8?B?bGpOSTloM3Q1TldMZkovdlVmeWNEVEt3QzViQjRHUXFYUG54VUszMG8reXFn?=
 =?utf-8?B?cEhDUE9JRkdsVWlzU1hmUUw0VXNWcURZbWdnbytoUFVWQ3hXNGl4allFWVo4?=
 =?utf-8?B?eWE1ZFVVaEVGWXNvNlpReWs1NTAxNVNYemRFd3NRTWthbGU1U2t2cUFOZXhI?=
 =?utf-8?B?YUdwWCsweGpTV3BDeXJybzBQMTVlb2gzMHFoazVMY1VBYzkwekVRN3J2QTJz?=
 =?utf-8?B?V3lINGFBMytEMzMxVG1WbmVmdUJVMEFWbWFYOHNUTVk2WnNMQW1SYkowdGJV?=
 =?utf-8?B?L1l2MzZSaS9yVWowemM2UEJaYjhaUnR5TVl1V1pFUnN1VElCRUVmMVB5dXdq?=
 =?utf-8?B?ckUzWVByazBQL2JXN2tiOXdTb3NzeEJhbkVKY2dBaUYvNXd6d3MwNlEvKzA3?=
 =?utf-8?B?ZTJaUCtMd05LT3NhQXhIQVdJTGZqeDlRdUlmUlluVW5MaG9iQndGSG0wTXhO?=
 =?utf-8?B?Ulc2ZWdrK2xnUWRUVEFrQWtjT29NTHF3RnJRTkFlRkIvcGFjZ0R0NDQ0Snhr?=
 =?utf-8?B?Vjd5bHVHL1l4TlhmRm1EQWZvVHdMWStOd1F6ZHlhaVRlZm5kYWJ4NWxpT24v?=
 =?utf-8?B?VEREaDR5N2UzbGEzR2lPV2NZVWJscFZ3YkUvcGtLdzZmaDJkV3lCTEljWk5p?=
 =?utf-8?B?dGM5QjgzUk0zNDQwT1l1bzhSeEZoWkpVM2Ewckp0TW1SRld3YUh1Q0gramYz?=
 =?utf-8?B?RnJrcGY0V0RVOFFaL0FXUlRmTlpjWXRMMU5uMFdWYUFrY2wvTXZPWUhsSVhu?=
 =?utf-8?B?a3BEKy83NjNzaTJLeHJNcit4Lzk5Z2VzU0NKMVRpZmN1emNhUENNQWVSYTVU?=
 =?utf-8?B?RVFRZDFhM0VObHZhamNNcHA5TFM4d0xZV0pMbG9HM292ZHhSNmExSVVveWRD?=
 =?utf-8?B?eXFPTjhZaEM5R2hKK1FDWW1oU0NiNTBoYThITlBuN2NNVU40NmhMT3FGSDEw?=
 =?utf-8?B?L0NnSm9pMVV3Mld5ZklXSnlvbHo3SjkxUVdYM3N3VjVwVEdyU2dpaFExNlhP?=
 =?utf-8?B?MWJZY3M3dlFwZGl2M2FCaFdRaWllN3dxVmJ3SEI2RURmOHBMQjVZb2VYZFo4?=
 =?utf-8?B?K3ZyOHdmbDhUazVhdTBNL1lVWTc5VFkyc1VGSGJoai9PSG5OU2FiYm5zNnpl?=
 =?utf-8?B?VTl5SmZNbkFjdzBQK3Y5ZE1Ya1RwS3lWUjJTNWFsRThQL1dFRTg5M3RBcDJn?=
 =?utf-8?B?cWZyZUNkb3lmS3NNSnloek9DWFA1UW03ZFIwU1BEQy8xM0VuanBSOFQwRHdP?=
 =?utf-8?B?d0NldktLZTROVXFNbkYybVpRM2thSmdhdEU4VTY1VzlMWTFIZjRoeWRnS3FL?=
 =?utf-8?B?T1BnczBsSGNKTG0wVmY4SWtDZmlnbjkvQzl1VGRKZnFQam45cW0rQXRmVUZT?=
 =?utf-8?B?b0I4Q2p4YlpHRjAzR0tOUVB3c1lxSGptcWxtdGdvdHEycVNnVTFxVlY1b2Zi?=
 =?utf-8?B?cFVxbXk3eGsyVVRUYW9mM3k2NUNsMXlVam01aFU1ZXg2OUIyMElxdjRhc2s3?=
 =?utf-8?B?WHFHcnlvTHVlajZBR1NlNlVaaWJwbUlyd0pSTng0NVRVSzFKSTN5eEY5b2Vy?=
 =?utf-8?B?QUxyRVg3SjF0TjZ2bVpMa05PQVdacFZ3SkJxRk9vbmNZN3Q1OVlGZEIrdEg4?=
 =?utf-8?B?bzRkWGVCSE9LbDRFQTRlMGZOWlhQZStDY1MwbmJNZDVOdUdRZjgzT2tpVnpk?=
 =?utf-8?B?SzdFRzdKUTl2bG9xUTF0MGxFNTdYaVMvdS9wRjN4eUduT1NLMjAzNUFkbFJ0?=
 =?utf-8?B?WWx1WXpHOXE2SS8zbVd2a0lrUmd5ZCtMeGUySmNiYlRoTjYrT3FUb2txcHFW?=
 =?utf-8?Q?gv422ooG4mGWtrzM8Q+tNqc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e461f5c-e0ec-4169-5f09-08d9ab58e6f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 12:34:17.5706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxCJZK48A1nd2aE6Rk7fDT49eH/un3BgOmKoKzzZPTq82KdheLjTDh+LRFQZ+ERfDB+GxCcFojOa3xlmJl/3eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Take into account guest's BAR view and program its p2m accordingly:
> gfn is guest's view of the BAR and mfn is the physical BAR value as set
> up by the host bridge in the hardware domain.

I'm sorry to be picky, but I don't think host bridges set up BARs. What
I think you mean is "as set up by the PCI bus driver in the hardware
domain". Of course this then still leaves out the case of firmware
doing so, and hence the dom0less case.

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -30,6 +30,10 @@
>  
>  struct map_data {
>      struct domain *d;
> +    /* Start address of the BAR as seen by the guest. */
> +    gfn_t start_gfn;
> +    /* Physical start address of the BAR. */
> +    mfn_t start_mfn;

As of the previous patch you process this on a per-BAR basis. Why don't
you simply put const struct vpci_bar * here? This would e.g. avoid the
need to keep in sync the identical expressions in vpci_process_pending()
and apply_map().

> @@ -37,12 +41,24 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>                       unsigned long *c)
>  {
>      const struct map_data *map = data;
> +    gfn_t start_gfn;

Imo this wants to move into the more narrow scope, ...

>      int rc;
>  
>      for ( ; ; )
>      {
>          unsigned long size = e - s + 1;
>  
> +        /*
> +         * Ranges to be mapped don't always start at the BAR start address, as
> +         * there can be holes or partially consumed ranges. Account for the
> +         * offset of the current address from the BAR start.
> +         */
> +        start_gfn = gfn_add(map->start_gfn, s - mfn_x(map->start_mfn));

... allowing (in principle) for this to become its initializer.

Jan


