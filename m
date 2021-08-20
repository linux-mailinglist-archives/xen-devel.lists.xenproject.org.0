Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5D33F2BB9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 14:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169494.309622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH3Io-0002Hk-GP; Fri, 20 Aug 2021 12:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169494.309622; Fri, 20 Aug 2021 12:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH3Io-0002FA-DC; Fri, 20 Aug 2021 12:07:14 +0000
Received: by outflank-mailman (input) for mailman id 169494;
 Fri, 20 Aug 2021 12:07:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mH3Im-0002Ez-VH
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 12:07:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25b64658-01af-11ec-a6a2-12813bfff9fa;
 Fri, 20 Aug 2021 12:07:11 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-gasV4yzOOLqNhYPpKqwLDA-1; Fri, 20 Aug 2021 14:07:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 12:07:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.021; Fri, 20 Aug 2021
 12:07:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0054.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 12:07:07 +0000
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
X-Inumbo-ID: 25b64658-01af-11ec-a6a2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629461230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tzqFJ5DQuYawbCFJUSn8oHxjHDJugyc15iD50lfNrtw=;
	b=jC8LTAWsaB+ND9mRMoyW/1M6o2JW5MC+7rflzDRSK8Ca2UrpT+HRYvAAhlFaH9FL3uWdHC
	7tev+OgiK7O4Wylo9OfDUPOWw0VwolK12QuHWgnQO0Wi9h7tqpVZz6eekBKtLT2mwE8VPD
	qclgshLy2qGm3x8opINFJ6Of9xmsi/Q=
X-MC-Unique: gasV4yzOOLqNhYPpKqwLDA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUS7bPbcUHbXY/TsAMiNvASb/iVxhHsUUVvVdInSntYORdip2/90LQWZvf8uzrjPMKk/z6rePUOmi7wrhp3FoFb9xxnJjK50dc/cX/Z8f+Ej3dg5U1Le21HWTuvAVRrQ2zKw2XhfPI0hIifMZPTbDC3YvePes3jdiFpFWgeKEG5JSyi1nwmUyZMM5yJKaPwLxjs/yeQpn80jNtdy1J2sLBKc9jd7ijuJoEvmCx8LafUrinHEsqRec0sXYUx6bfkbXm/HUJ7r5cedZqMuboD+KjTmKEaXIQtRbYDPEnaHGS9h5dmWgk+xQty/eEjc80s2cmC0xL/OjPQs3Rl11SaYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzqFJ5DQuYawbCFJUSn8oHxjHDJugyc15iD50lfNrtw=;
 b=WguT4BFipugBQAWoVPF8hD5fGTONCA2D+V7EuCojnWZiybHFlik0ySztAzNnE6EEKFCaYMQ8xqU1VUcKpui7baeZzY6gFvEEtsDBauUgHiq1jCEzipfUxFX0RGD8WpHfVZtb/W+bh7JvRS3K4NoxAjrFl4pDcKvPqGRanV9Gr2YjR5haO3WlS91PLsRKKQRN0mX/XxO4fy0I/wHxn7KyJU0AwCUWaMCp8EDHFXIHwOYjSfxnEsW3JPMuPRIk8/uA2bDMZSK/SjDjxhtOzp01p9EW1Whc5hpQszt4fcHIVcV82x4Qur1gfwQGcUFz9PPTNZX4X0fPz2iS6FaFSr0K8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] ns16550: Properly gate Exar PCIe UART cards support
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, sstabellini@kernel.org, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <20210820115422.2185145-1-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <af460288-0fac-b894-f727-65010ca64088@suse.com>
Date: Fri, 20 Aug 2021 14:07:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210820115422.2185145-1-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0054.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee8112dd-2b7f-4c91-2c7e-08d963d30822
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7375DE5A43F1A0FFF7012A6FB3C19@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NLhYeEBEGcwBRhMa1MUhtG3ifzCr99P6BtDU0GTCGpr8Hvhxe3sz8gMqu7ntd2ky/X1GgZCNBrojqwsSw7eoB7zPKyS8tnGXYs5LTiuCuAa+AzFTNS5P+eilTN1EBnxPCV+LBtQZm8A5VneAnvUcIFMeSpDxu9i8OXzHgh+hSQkrMRcdTgcSJIidqgmUf009/8Rx4fZknHRQWyYo9ewrFYcX2Qo5B/aziCFZ2LpEgjW+AyMyF3wy3ort5WmIrI+HPdihRYfLC7gmJeC1KFZpt1G/42k81tqC0B2/da0DgVoaUQyxRBMoQX3a0JLYfa/Vu8rpZkZLESmtlRtFritSnKkHusFPa6ZBryDuuaPw3I8e/QHNEqenEboXd8ijqJqfciEJ/OJ0mclfawlTOOUnUF7zATiSB2CtzC1jLjs8WC5DPgejsNUhI5I61Q9lMS7n63DADfjD2tbOlHpc7A6P9TkNCD8PoeSBDPzxUW78S9YMxaKCnFbGIMCoMEUrnvMMsIxtglyK+QY3H1EvBMAxOQdmIFk1ir2VQlL1djyouxi2S0mFFHBwRUqfJzSYH7c8oieXeyuEec47gG2wrmqC/BbCQGNzuF9t28jHamCXTn4PI+3XJoffRiCw42JXU9llVs6yBzkeUgUz/di4pO0nYKMzhuTDlZbDHG6RHCez2moAVN/vcl1LnKzPTcft6PAixL0rUO1HuEIESUkd6lwpNmnwekhdv0yo56P2L7kaZzs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(39860400002)(136003)(366004)(376002)(478600001)(16576012)(316002)(36756003)(4326008)(83380400001)(38100700002)(956004)(2906002)(2616005)(31686004)(26005)(66946007)(8936002)(8676002)(6916009)(53546011)(66476007)(66556008)(86362001)(5660300002)(6486002)(31696002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGwvdHgyTHp0U1FrLzRjVUdXYmhDYmtsdlNQbVpyRE9mL0pIdzZ0cm5VNjRD?=
 =?utf-8?B?WmJyN1E5Yy8zc1p2ZUc1dDduVWF0ekY5Y2lEQ2xiTWt3U3Y4bzhwbGp5ZXhT?=
 =?utf-8?B?d3c1M21zT2RvMkZETEFMT3FaMWlLZ2FCVGF5ZXpsbXNORWU3MUVCVlBvYUVu?=
 =?utf-8?B?Z21VVHMrRUNpaVFFNURuemdvdHFncW5xWmtpVmRZcDVCeWluSFI3YUZkcHNW?=
 =?utf-8?B?MUJJUDNOMzkvMHpOZlRQSERyNkpLcDFjOXFPMktNQWJuUk5oOWppZUJVREIw?=
 =?utf-8?B?VzVmQU5mWjhUcUM0TmhHaVRWang1UjNUOU5uVmJKM0Z4UnN3ZTEzUmIwS2hk?=
 =?utf-8?B?NGpFNFpjc1VhQTNCTGZFYmNidFBJNllZR0FlbEpIODFLZGRvQVl5cUE0SHlk?=
 =?utf-8?B?RUxMSXI1YU8waXpwa3o5d09wb2c5TWk3UWRGM0t1bTZieU5BTmhhMVppUlQy?=
 =?utf-8?B?eFQzRGMzZ05NUmVXK3hSdzFlamcvam9pQ2NoRXNwTXdEaGtDZ3pBN1JaRTFw?=
 =?utf-8?B?cmwxdW9WQVdET1I5YjVKTHBLQzM4TTJuQWpsZDd6RUl6NVA2bzVKSUZ6ZFFo?=
 =?utf-8?B?bVgzT3hQSUtkSDR6NE16RGdTSy9LRVBjRE4rTDNUOGNHWE9jb3U1ZTVUbEhZ?=
 =?utf-8?B?TWN6cHpUMVg5YS9HZHBCNDlCV0crb2RpUUM0Um9uZXlIVGR2NzhJSG9EMWhI?=
 =?utf-8?B?d0kvMkQ1TDhiZGJqY0R6K3ZqYWhwQmxNTTBHdTZtdjcyM2ZSQWFZZkg4V0Vu?=
 =?utf-8?B?REp5bG9TK2xoYkhySTNNMjJTRnlEMEJMRWlXZGsxMFY4ZjdKb1AwS1RUb3Bk?=
 =?utf-8?B?MkFzV3hJenhmdGFNZUNITUNUZCtPWkMwZThDbGhxMXZ0OTJmeHNxOTRXZzlr?=
 =?utf-8?B?eHN1NU1keUpEbmU3N1ZsRVlNWkoyY2MwNGVRWGhrbFcyZ0xGTTR4d2RlRU5G?=
 =?utf-8?B?ZWl1T0xjTm01YzNtMEFvMHVWMDBaMWVJUmF2TUUvczU1b0VUbFQ5Q1J6MEpX?=
 =?utf-8?B?Z3hCOXoxL3pwQVFzaDJtVWdoRGx5Tk9sZDhpeDYzeVJ1d3h4Z0tIOUM0ZFVQ?=
 =?utf-8?B?UHlsZE9pU0lMUGo5dDd3aTRCSEx5SDVacHcvejgwSUFwUU5HK3d5QjlDa2tN?=
 =?utf-8?B?NWZIem9TYTUveFR1UjVhM0w0STVOUEllRHJncy9DQmtjUTRaYkp4NW92ZFFn?=
 =?utf-8?B?ZVlTT2JIcjlvZktrVnZWTWJFNkFZNmo0bUZpZWhiMDZIRVlRY2Q3UHZHbHRV?=
 =?utf-8?B?d0tmcVVUWkxmRFlDcndyMDdPOFlIQ0IyYmJnQnhnM1UvYzlXRmRoVGMwQnBM?=
 =?utf-8?B?Qm5nU1UwY3ZtcUFzUEZ0dktFNHltNTZTaGFSVmxOTndZQWdMYUZQWG1CUTlZ?=
 =?utf-8?B?V2xpTWxzVEFjTFVJTFI5RE5RdUR6NkM5bHBjeGRVY2I5YXNMa21xZG9DZXVB?=
 =?utf-8?B?SGVoRkRLUVA2SlFJQTlMbitnVWVlV241WDFYK2FJM1UzZW1udFArVkJud0NF?=
 =?utf-8?B?YWY0OWQzUGZTbTkrdEdPeHdtV2NTRzI1QmlLRCtnbHlXWDlCY2laajlObG1C?=
 =?utf-8?B?ejEyZjAwNXdWVVp5ano5QWI0MmtoWEhlKzNvKzc1Z0swSEVMcU0xblhGbGI3?=
 =?utf-8?B?V3ZoMTFaZ3Y4M0hCczVyTEpDeXdtekpOcmpCSkV0VmRvRkFVREtRR1hkaHI0?=
 =?utf-8?B?QnNnRHFOYTBoaDNGZmk3bFJlRlJ3bEFwTEV1UnMxODU1b2tURnYyeStIKzVH?=
 =?utf-8?Q?YwFwmxog+FXtfSOLKEnC76Z6VilBGnCB3GBOaYz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8112dd-2b7f-4c91-2c7e-08d963d30822
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 12:07:07.6481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3briiArBLpAjT60y7dP28KdfxUUDy3ysl3sO/Uhn4b9e4cqSwIRUZdRxK0BaySvROH6UvVh3xCWm3r10SnJVgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On 20.08.2021 13:54, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> This fixes Arm build which doesn't have ns16550 PCI support.
> 
> ns16550.c:313:5: error: implicit declaration of function 'enable_exar_enhanced_bits' [-Werror=implicit-function-declaration]
>   313 |     enable_exar_enhanced_bits(uart);
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~

This can't be the full story - both Arm32 and Arm64 build fine for me.
In fact I can't find any "select HAS_PCI" outside of x86'es subtree.

> Fixes: 5ffd37db2ff6 ("ns16550: add Exar PCIe UART cards support")

IOW this tag is wrong, no matter that I agree that ...

> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -308,7 +308,7 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>      /* Handle the DesignWare 8250 'busy-detect' quirk. */
>      handle_dw_usr_busy_quirk(uart);
>  
> -#ifdef CONFIG_HAS_PCI
> +#ifdef NS16550_PCI
>      /* Enable Exar "Enhanced function bits" */
>      enable_exar_enhanced_bits(uart);
>  #endif

... this change is wanted, but just for consistency for now. If you
can supply an improved / accurate description, I'll be happy to commit
this with
Reviewed-by: Jan Beulich <jbeulich@suse.com>

As an aside - please follow patch submission guidelines: Patches go
To the list, with maintainers (and perhaps other relevant folks) on Cc.

Jan


