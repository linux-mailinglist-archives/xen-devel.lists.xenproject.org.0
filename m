Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FD53FEBDF
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 12:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177209.322501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLjec-0007ZC-IJ; Thu, 02 Sep 2021 10:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177209.322501; Thu, 02 Sep 2021 10:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLjec-0007XP-F9; Thu, 02 Sep 2021 10:09:06 +0000
Received: by outflank-mailman (input) for mailman id 177209;
 Thu, 02 Sep 2021 10:09:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLjeb-0007XJ-KY
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 10:09:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b460bf3-d7f4-4a85-8e74-5a068b0940e0;
 Thu, 02 Sep 2021 10:09:04 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2052.outbound.protection.outlook.com [104.47.6.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-1w7TI-zcNQWOKAlYaIRzgQ-1; Thu, 02 Sep 2021 12:09:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2605.eurprd04.prod.outlook.com (2603:10a6:800:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Thu, 2 Sep
 2021 10:09:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 10:09:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.20 via Frontend Transport; Thu, 2 Sep 2021 10:09:00 +0000
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
X-Inumbo-ID: 3b460bf3-d7f4-4a85-8e74-5a068b0940e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630577343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9yxvLHW7DrlOt3aGmZBGtc6h5E1gB+AHZW+4J/6Z/sQ=;
	b=Zgl9xpmYjbqXHET/JW1W6JRCm9RpG9smaBaLXKfoCX2ubxjnJ1fgFI2omVTSxMSSJC/xIT
	Svgmt7S1PuPe54FfjaImFp9ZuVbD5hWWeh0D0wW8ZpoYN/FtuG7MJk3FjVLuI0X4+F4J2B
	oVwUJxhoR4aBm4tl8ZBW1nv06s4ZIEc=
X-MC-Unique: 1w7TI-zcNQWOKAlYaIRzgQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YE3kKwatrUCoCXOglCwjuP8j/DwoQdsN5AQpaHp6x5JNm0bVrvI+8umQIsPmCs9Rw9AQjZ7EGifkEohiZCeX02SD+iYM70WFMyHfSoevDPrKpIAq9a0oiyhhDElTclNNgcbf54UbO+lGehCheW2IRDLYOaaCwV7EVpcaRHYx2BAAGrrRZviCYkjOnUJFPxHPLKqMHYklUpAhzsWY3cn1u+X7ViTTNwr0lbduK7A+wzLic05ZKBJzPQ/mjZkCh97SUHpCfgQkwmhDOEut0rSYgGO33RdVWeGlvg78XOsGZ/m6k5G04NKHJAg19AaHnXfZocaCSGpLwIT2CMd+1Ltb1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yxvLHW7DrlOt3aGmZBGtc6h5E1gB+AHZW+4J/6Z/sQ=;
 b=XYc3Fza8SrSazbCb5uIgrFDMvUSw6QODoR0TQQulR1fvY4XJ2x1fN1xD0nTwD8adzlAm4kblSLKmhi5sxoLxj8TNPHdmshsSOdEw2ly64V4mOlxO3gPcQThi1vglUqac+QyT+6XIduiKHytlL44Do+ewW3tAToPWP770MNAwONJiCyxqgF/LAE9BFCEAiRJl6FY4tv/c1XyoMrFn3mGsfA0FMmQ2ViOHLSwwDknnBO3yPib3Z1FrUssf1Sa17+keYSAM1Wuj7A6r3KEctVxl2908VeiOE0hfSCQNyyhCbIrecOPNkw8tv+zqWc88VGMPU/s5/1WteEjoxHJykHg9sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 01/51] build: introduce cpp_flags macro
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-2-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ba3cfb06-1d89-ff62-1012-6edc2a9c5259@suse.com>
Date: Thu, 2 Sep 2021 12:08:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210824105038.1257926-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0008.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 108c2e8b-c526-470e-b675-08d96df9afa5
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2605:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2605D98DFD577F6E824DDE3EB3CE9@VI1PR0401MB2605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d+30HUtBcErhi5zzCKeaK66+xLt/mMlwF92UDt1wXWKN07pCI8WqWRBs39k/yeWjYo8wpaadHJ84zlwmX35ioUvaSNMwa5DKVZAjJIKT7fxvvyVIJKaM/nHyO0sDAtAMaG1Kz4IPiwVa2sXVKxwyMqcuoD7qDpcZid9gcoNF75O6c0Max72Gopda9bVVaHJOeGdstA5DqKe2yLPP0+p+Z9hL7s0QzyFM/m8ru9k56+mt/KhLV8BEjJyYFoEYlFuZDdbwzchKjXePa8QG++7ONDuaw33he4lYYC5yECdcjaWDot2Qydph5TJW0Z4U+wP5vx+o179HfyL+OqxU3h2kwYX8ql1oZ8brwwdnZ+G3Slo/p13b439V45H0Kni59tooy19mJWCi3MxTvNExGloah4Py2dtoWYyB73BWn7dHqC0mVNgHUpMGd7zPJcaffulZMLDjr8yRnjs1WiqfOxGW8GxdO+voifx13D6NG5TxQMlcJXPNLQO+7GMQTcXN1bgszYEAbj8UA13/aESwbKK8dI4ziCMya7FMWItmMa9QhpoLQiZgLfseVxdcrLb+vxv/4K4a2AfoKkZHpNPIANGiACwmUWriRqLeSJkWfJUENGw983gJhcCiDecA2aJcasDjkIAEWRuQHuZOto+rs1Q4868jbjsI0pDIbltvvpVa1erZkjbtA0WlNheQcA5DeYYmpq12HrJpj1Tb5DCCD9jqNDjpxuQVJYx2HDUA8ItPiEg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(376002)(39860400002)(136003)(6916009)(31686004)(54906003)(86362001)(26005)(478600001)(6486002)(66946007)(66556008)(53546011)(186003)(66476007)(31696002)(5660300002)(4326008)(7416002)(36756003)(8676002)(956004)(38100700002)(2616005)(2906002)(16576012)(8936002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3lTNEF6SHprZXMrOW9vL0xiWFI1TXVWVGY3VEZlODE3UlhQUTdCQStvRTVU?=
 =?utf-8?B?bjB4U0hZMmRFY2ZZb3dBbHdHUXRtdHpLSDJxajZ0YnlTdDRiZStjSGJpeGFu?=
 =?utf-8?B?bGs5MVBDZ2RYUVB6WGpSWWcrQkZldU1KdysvcXlwbjcvK25teVB5VE5paU12?=
 =?utf-8?B?NXBoT2R3YUxQY25PUzVralA5a3gyNW1oRWV1NUxqcGxERFJKclpiVWVNWG5p?=
 =?utf-8?B?TUtyS09SMkN0OExZeU5HeEIxMTVKeUFJeVluQ2JyeVRTdFdtdFJ1OXRRZEdU?=
 =?utf-8?B?RThZSTVDeEMvWXFhNDJDNCt6RmNrckg1VFhGRzJkazB3Wk53NXZnQjkya1ZG?=
 =?utf-8?B?WElITWZkZ25YRTJBaWNkY2N1emJqUS9FN0s5OWtMeGVvWHh2Qmh3WVEyNExn?=
 =?utf-8?B?TmVsbHFxb3FIcmxCNmtSVUowYm9NVFQrRDF5ZTkxdStaOWdPdVJkSEp0THJR?=
 =?utf-8?B?YjhIdmVCL0dwN0ZpeGR3US80a1NpVXpESFRSdzRYMU1JT2NTSjcxL3BzSnZ5?=
 =?utf-8?B?Qk1tbC9iSE5TWVlwMEpXUEd4dHZoTWNYb0VWOWk5b1VKblhIRDIvR3JBUXJ6?=
 =?utf-8?B?ZXNPQ1hmR0huQjFkb0YvZ21UVmtIZlV1NUpoek15eGtBMWYxaWgrbk9WTHhN?=
 =?utf-8?B?U3VnWjFESEpLUGE0VUdkMFFDUWlEQkNySXBNVEZNR2kxZ0dXelh1Rm5admhi?=
 =?utf-8?B?N2Nuak9iWWRsR095TmVQRE9yOWh2RkFLaXU4dHEzQzRJWFpFbnFERUd3NVR6?=
 =?utf-8?B?b0MzMkFyOG1YTlNmcWtqWVhYb2RyeGxHOS9PSDR1QiszNTYyS2w4S3lDWCtC?=
 =?utf-8?B?dVhlV2pZWnV2M01qSW0vUi9ncy9UQTE0U0U0WHc5T2dCMndXZ1AyYjZqQk5M?=
 =?utf-8?B?WUV5MzQzV01pTVI4RCt0cTkwZG9LU3dYamNYalFsVjNkV05sVFdUUEpXTlF2?=
 =?utf-8?B?OXpFNWFxd3hGTkErMlNuZUJMUDIxa3Q0ZUEyVksyMlFvdGRoTnpXQkFRWTNQ?=
 =?utf-8?B?NUQrcGtGdE9BbXliUVY5WHFBUEI5WXJFaFdVaFJUT0tiWjdEN0ptTlJkV0lu?=
 =?utf-8?B?YUVYM1JnMXNHdXNxcjAzVk01ak9NU0hHQnJZR0U5TWN1YjBBSWlFcDZ6ZlJy?=
 =?utf-8?B?ZTNkZTdpNGdWRVFweG4wOXo1UmdxT0RyY0hZTjBZMnY3RVovOWtlTlRuOGo4?=
 =?utf-8?B?cFZsWlVpR1Z5cmxIUUZlUE15YysyN3FWSFlwQzZkTVpoMDBEMkRLVzFUbEt6?=
 =?utf-8?B?RFJDdWpUbWpOVlRRNThqc3NOUms2VnZGbjZlMFpnR1R0RlZGSXNaeVlXc3lK?=
 =?utf-8?B?MitvOThCSjBONmNHMW5zMUhVZktEZHRXUDhETGJUM2hURmNZU08yRXRLdkl5?=
 =?utf-8?B?cUlFT2Q1dUhoOHoyOG1JQ1FkL0pMQXF2SHJnMzk2WDRIY0M2WGI1ZWU0Y1BW?=
 =?utf-8?B?YzZCclQyUDVPcGt1N21ZaFF4bCtOZGRWOVYwN29sZzYraDFGMDdteTZiZ3R4?=
 =?utf-8?B?eDVNSlNOTFovRElBU1VQb2ZHOXdOWStneHhuWjV5T0lZRWh1WDFmYWhwMmNP?=
 =?utf-8?B?YmExUlk1RFZGRzZOYzZMSTYrTUF3MElPZEpDWUgyYTZoaEJQSXNyVUhSV3k2?=
 =?utf-8?B?TmZ6U0dCN0hUbGxqcENDaWZYTTRvWHJLcmhYbkxDZ3lHVURmL3NteGpkeDZT?=
 =?utf-8?B?Q1ljUWtLbStFRzBQWGVsVm9RNXZaS3pjc0wrVjc5YnU4ai9SbmZoaU5NMHEr?=
 =?utf-8?Q?mTo6uhe/UDj4Xk6gYX3AzhYXDqf7yVXBwztvRsv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 108c2e8b-c526-470e-b675-08d96df9afa5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 10:09:01.1902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRcsMZ+U8vy+B2jwfLlQl9282gxGOwKu5OHovyjj0eXQ+zr9NWp74UJe8d3DZZB51mxfNS8TD6CaBjAUkRAAPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2605

On 24.08.2021 12:49, Anthony PERARD wrote:
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with a remark:

> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -133,6 +133,9 @@ endif
>  # Always build obj-bin files as binary even if they come from C source. 
>  $(obj-bin-y): XEN_CFLAGS := $(filter-out -flto,$(XEN_CFLAGS))
>  
> +# To be use with $(a_flags) or $(c_flags) to produce CPP flags
> +cpp_flags = $(filter-out -Wa$(comma)% -flto,$(1))

Afaics this has nothing to do with Linux'es cpp_flags, so what we do here
is entirely up to us. If this is strictly intended to be used the another
macro, wouldn't it make sense to have

cpp_flags = $(filter-out -Wa$(comma)% -flto,$($(1)))

here and then e.g. ...

> @@ -222,13 +225,13 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): %.init.o: %.o FORCE
>  	$(call if_changed,obj_init_o)
>  
>  quiet_cmd_cpp_i_c = CPP     $@
> -cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -MQ $@ -o $@ $<
> +cmd_cpp_i_c = $(CPP) $(call cpp_flags,$(c_flags)) -MQ $@ -o $@ $<

... the slightly simpler / easier to read

cmd_cpp_i_c = $(CPP) $(call cpp_flags,c_flags) -MQ $@ -o $@ $<

here?

Jan


