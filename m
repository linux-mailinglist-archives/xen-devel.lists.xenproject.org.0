Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 610D853F7B3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 09:55:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342999.568127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyU3G-0004dT-N6; Tue, 07 Jun 2022 07:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342999.568127; Tue, 07 Jun 2022 07:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyU3G-0004aY-KK; Tue, 07 Jun 2022 07:54:58 +0000
Received: by outflank-mailman (input) for mailman id 342999;
 Tue, 07 Jun 2022 07:54:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nyU3E-0004aS-Ul
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 07:54:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ee73a87-e637-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 09:54:55 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-r3yzcu60MjO8o4-kgtsuZg-2; Tue, 07 Jun 2022 09:54:51 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7625.eurprd04.prod.outlook.com (2603:10a6:10:202::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 07:54:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 07:54:49 +0000
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
X-Inumbo-ID: 1ee73a87-e637-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654588495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MTc/EEkBFCDuOeKCw4rqXpZJkxzvOOQxY29jKUWEpAE=;
	b=JKTpMlzHr/+ByIeIxoC1GGXhsV66jTsYlodPIJwAfXoazWFFxkdauyT/gx5eEPyP0kxUk/
	j3GixXp5jjcW47lOU2GBryg1h7h/W9KwU4Vha/huFz++TxR4WVDRuwpWJEgP1i+i4KA48c
	/NVqtIv2A+0CCn6AfKJc0XsZA9A/cQc=
X-MC-Unique: r3yzcu60MjO8o4-kgtsuZg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtvWjyC1060ev5OhtCp/yhDqysGkrPC3yDe1KLoxfqJwp6au8mNZMBkQsXgsuqej943Kn4FDLH9xZIak6PdM7XpSQ/EQ99bMbBjKh4AKvHaBb74kvWxrc0DBJ/cCVMoZKI+hT/8OR5caIkbkxdoDHkSZVSeYs8p8hOcvgn37ILcYqQdY/0ciuNnKXEjs36nqyqM1OlsPdRgPuxpLW8/rwU6/iaN1raz0Sq+A2KFkCjkKfY7N7+66o6dLhSNSUKG/Ug6zOqCcs1WqN9E+j6DAovSDDubZL+N3E3BUcFmAiyPfqqXcVFR8Xz70oKuwi9kcUb4UKE0OY9+Vib/JiLribg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTc/EEkBFCDuOeKCw4rqXpZJkxzvOOQxY29jKUWEpAE=;
 b=SBRziRh0Gy/HnHEnnqeZ4RfcRDBsdU3y14+EfwsWcM7RmyyPvlwgnbdI8lRL/OBtXThebgmssCg13srm2s1ERTeC5LIJx1HlCGpFlcKiISLb/erYOd3EOxLGxJQWa6GEtFZcY32erf/5ckWsH5m8VKEYD8+r6GSY/pccyyzQDdcgl2za9iaqqXJDkjjYVg8pdviPW8Q/abxsQXsovTYswGuzQYz4+9VdJ3ukJPSOHuNVrRo7zqud7neN9g7O3cVIrmr74ufItTMteiK53MwQgWwjVuovaKAPDepy3LsFSCREj0Bd2M6gXyp1Rh6HS2fBUvZ2veRuYKztrDxkKIlrEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTc/EEkBFCDuOeKCw4rqXpZJkxzvOOQxY29jKUWEpAE=;
 b=ISY9UYAwBAjIzzzzE1fPOo330RHLSeOz7CU2uhTknkD3GSsEUqX9P5rEUv5GqSk0YpSX2E7RScBT0jMD8ijSzNvOUFIgUDn+RVGbX36jvqQSwFqOC/TTSEGyTej6IC1ZoxsBTk1m159v+Ja2tVL769HKO+MFrk/JQYogdimRtEF4eHqQ/ZA4lKiGhspvGR8TXy9zBZZMIf1FfMHJqSG6UYevF3WNHHmXG8btuNjjAEsgga8CZzZuHeAUOyKSl1rUNnnCvsf9xgI5GWtZk40VsnGFRWkfYwbxFscRSxgvPmg8axmiWCuVT/81ZvZ96pPj0nljYpOpaDETavXQXI6v7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <291312d3-9a05-fd12-86ee-a70bde5d9c89@suse.com>
Date: Tue, 7 Jun 2022 09:54:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 6/9] xen/arm: introduce CDF_staticmem
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220607073031.722174-1-Penny.Zheng@arm.com>
 <20220607073031.722174-7-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220607073031.722174-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0057.eurprd07.prod.outlook.com
 (2603:10a6:203:2::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0e70e33-7f96-4a3e-a282-08da485aff4f
X-MS-TrafficTypeDiagnostic: DBBPR04MB7625:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB76255E94AE66F077B78B75D7B3A59@DBBPR04MB7625.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i+evzGB+hce9OHG0/6UKpJozOiy9y8+w3hZExT8nJ/UpwQUhPzBeeOA51JL9IdYA6roncco9g0zd6NWNBPmfesi+L/u03nUOqQSBG8IIwmBwMTE5rreuq+ch5AIUlz6BSZweuucA7xDgQE2xJOx16I8tgXFacIjMyTf8TnF1VjTGss4Hrwk7AUXOID+aLdz2o8dzVNX4c2XzaNqFZdJ3cVOxibhVDaQlqWiP07N35sOEyErinFZg3rPPybztpHwAHuwyPSYWLmN4Pq8q6ytidmNe1EZfEX3BsrHMnaMQgw8/NwLC6hSlp+nMgfKrb+JxpXv6EKgbFP4B2gzkBh0QDYzqydyc60KjVPzNpGZvog5D2qQcSTcEfhGsZ/xcCZ9Wy9foneD21si+LvbRlINFQAbLp/w3FvzYuFSy1O7pvq8iSP34FE8X5lt5oUlyv1OnPS0UlZiRllsWHnuOxDWI0baTOX4n4KNC09dk7+Mumh3A18rN/sSC62rE1A1CzBWR4fJcRASwDyx8XUHtdB2mohEmzT4E1EGWQy2URDEhKvLOx89ET/sy7nsXO1gjR1JgjHk9AF6f9jMv5/d4sTVG6W4GKuXRq/fXQRDYyH5mByV0EGqV0clX+zrFXUXXrlLAtcn7FfT8X4OYECX9yp2RNYxEj9CBDeK7piWm0oBVSZph+3qwhYy9YHfWVR17HctTfG0/3ltXsWNeM9YeVzJkww0m2qztvXKwI93GDPn9OawmH/mVZiVx9u3n4hUVBqAS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(316002)(26005)(186003)(8936002)(53546011)(54906003)(6916009)(6512007)(2616005)(508600001)(36756003)(2906002)(31696002)(6486002)(38100700002)(86362001)(6506007)(4326008)(5660300002)(31686004)(8676002)(66556008)(66476007)(66946007)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUdEWVB6dTBWakR1QWt6SUxuWUthVWZFUDgzVkZzVGlzN0EwRDNDZCs2QUFX?=
 =?utf-8?B?V3RxbkxsOGhDZElXZGtHK2V4amJLaHh4UmhXK0FISW42UGVPczdwQW5keXBz?=
 =?utf-8?B?L2FpQnhRT29XdE0yZ1JwOVhjSWJzWkJkczEyZWlldmhuQjVpa3RpSmx5MEMw?=
 =?utf-8?B?NzdFTlNCQm85ZlJxZWwwTitSWmE1RVJPVU5Rb2lSNmwxUlZ5NVN0Q1BsQkM0?=
 =?utf-8?B?UHdReGxZZXlUMXErL0EwRTEwOUlxYXlEQWxnd3JoaVNncWowTlliR0tXSWRa?=
 =?utf-8?B?d01INWdWbWt4UkxoL3IrTkhIRUl1eFdLZ0tPRWE4UE42dy82b1A4SHRSRjYw?=
 =?utf-8?B?R3BjYjg3REN1RS9lYVpSMmVlSFU3NlAzWklaSDNvbG1iV2MwRlZtOTdxVWFy?=
 =?utf-8?B?a2RaUjVlTXRTaUxvZkJ6NmpSQVM3VlVGR1E0cFVpanN2cmJPdDdjR1VIZEtN?=
 =?utf-8?B?bndkWUphQUlrWHJmTkFidTVQRnV1ZWQ4QWdOcGd3QVRKdlVMRFJtdURQbHdo?=
 =?utf-8?B?MWRPZ0t0ZmZNTmhJekxPamMxc29xaFR0eG42MmllVzZkamxnc2NKZnpQdEd2?=
 =?utf-8?B?KzI3UW1ibkpnWDFXbTRJZWErV3o3VDhrbU1VSThSTUY1eEp3eVpKWXovb3Ju?=
 =?utf-8?B?VTRleUdMeEFmMlFJNkg3cVlVNjN3ejhlZjBvRWxlc21LSGgwcWN3TEZMYjd2?=
 =?utf-8?B?d2lqbTZ4cHJuUGdzdkhZTGF6MVNQdkRpc3lOSklrLzNvbGo4RWtpN1lNWmt5?=
 =?utf-8?B?bjgvRkJEWm5xQVNDSmdhdStwbUZ5UHUwRzR0Mm5WZTh4N0Uwbi95NXAveVR3?=
 =?utf-8?B?VCtJQjVWZEppY3cwRHI2VUxQOFN5Y3RWb1BuWEU0OXRGdmpmbmlidXdmdDBD?=
 =?utf-8?B?bldoVncrV1ZPRU9IVkxRK0FEOTMxUDFlMGltSGdSS3R4bDZrQlNaa3pYa2s0?=
 =?utf-8?B?a01ZZG40SDBrd3lCQndjUGVpaysxUksxS2o1dDhTTkFsM1JuM1Y2bGVyMmlm?=
 =?utf-8?B?ZGpKUjdBdnZJVDRwWkE4eG54SXJNbStlSWIwaXdqQmpuRi9EcVFhMTZEZFZ5?=
 =?utf-8?B?eXZYd2dNaE02UVNuTFhUOEdBcTFTcDlSRm5uRVhTZEhBNmx2YzNEQmdTM1Vz?=
 =?utf-8?B?U1FseHRueGxML0p6WUtuQXM1OUZ6N0lUL2xXOFdCMGtVSmQvaG5TekZzWjBK?=
 =?utf-8?B?KzkwNVUySXBLZFV4dFpQeFdNUHgxbnVlMzZDeVRkOHFZSUFaUThhcUVCRU1P?=
 =?utf-8?B?VitMbGhxZmd0Q1RYdHkwSGlBUEZYb1VuK1RmSWNYVGZnbHA2NFN0ZVBQTXlW?=
 =?utf-8?B?K3dNWC9FREFXVVhEUWNidjkxMTlJbTdnUkN1ckJYOFQ2RStDSVBGOW4vbjVl?=
 =?utf-8?B?djhSbzhzUnQwRnhDeDl4c2RrN0pDclZTSjk2R2VKMUxERWVWREtTSU9QQlR4?=
 =?utf-8?B?UFhydzhCT1lvWC9ndHJPUVUvMjkvTmNTMUwzQThHWXNjYXdQZWFuQUhVRWJ2?=
 =?utf-8?B?L08xVmlrNEFMdHdEL3hWd01mbU41TGNEa1g2YmlxaWE5RVRucFhBRUpleW43?=
 =?utf-8?B?L1V4NWtuYWNuZ3U1ZHlEVDFrYWJ4Z0YxS2NOcnJqMG9CcHIzTjIwbHZlSVgx?=
 =?utf-8?B?VVZTSGgreFgxaFd1REFZczdjSmp4Ykp3aVAxZ3JiVDBtZkE1alRoVkN1TVVQ?=
 =?utf-8?B?OER2K2liQ3NadW9Iek9mQlJyMTBwVmkyeEJWRjlMaitEekJHQVI4TDRTODZr?=
 =?utf-8?B?TjZNdEtMTnRVRndPd004Tm51SUJKOXpRK0J6NUVHZmZHSnE4RGVoTDhMQk1Z?=
 =?utf-8?B?a0dsc1J6WG5zcDlPQktyTkl4dERmcEovV2d6NkJONGxhVTVhOStwb25xcGN0?=
 =?utf-8?B?OCtIVm5YVThHV256U3praDdsTFFuVW5yNFRrWVlaZDJHeUJxYWZEeGhxSWds?=
 =?utf-8?B?S29mdE5OSTlVb0RidVRjb0p2N3Z3SzVxVExidmU4ZXVUNzIwajJmK1JTc042?=
 =?utf-8?B?c1VlMXBkWElnL05DcUlnTVlxTVlWU0w4a2FsSk10L0tWRWJZTUI4Q1A5dkt6?=
 =?utf-8?B?cWd1ZWszWHo3blR3SEZSTlFuNUpiYVQxNmFHaFdrNjhXTnB4VXBmajZRZUZj?=
 =?utf-8?B?aFE3clU1UVU3dVdVTnBBR0Vvb0ozZDNVSVQ2SEFZSFdVZFkvdTJvNEpmYXNx?=
 =?utf-8?B?T05FVk5QZTBZbCt3Mkx1ajNEQS9RMjFaZDM5a2VTU05Yblh0ajFDVUl6K1Zn?=
 =?utf-8?B?aHVtN1JHai9pMWtVdisxaU9uUHdsdzZxdThpR210WUtvb2l5UHVscldLQzBz?=
 =?utf-8?B?OVhacE1CdjZ3djExMUhrWVhMNVNuQnVmTndUd01nY0xyQzhpb3g2Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e70e33-7f96-4a3e-a282-08da485aff4f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 07:54:49.5261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QgCFOxnZLUj3wkuflNSs78qFSqGX9ZhBef29hAuDUq3qZtv2lhLnvif+NBi0YNAnI8obD/OESzNTyFhfYvsUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7625

On 07.06.2022 09:30, Penny Zheng wrote:
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3287,9 +3287,12 @@ void __init create_domUs(void)
>          if ( !dt_device_is_compatible(node, "xen,domain") )
>              continue;
>  
> +        if ( dt_find_property(node, "xen,static-mem", NULL) )
> +            flags |= CDF_staticmem;
> +
>          if ( dt_property_read_bool(node, "direct-map") )
>          {
> -            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) || !dt_find_property(node, "xen,static-mem", NULL) )
> +            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) || !(flags & CDF_staticmem) )
>                  panic("direct-map is not valid for domain %s without static allocation.\n",
>                        dt_node_name(node));

I think there's either a change needed elsewhere (which you may have in a
later patch, but which would look to belong here) or you may want to deal
right here with CDF_staticmem being invalid without STATIC_MEMORY:

        if ( IS_ENABLED(CONFIG_STATIC_MEMORY) &&
             dt_find_property(node, "xen,static-mem", NULL) )
            flags |= CDF_staticmem;

        if ( dt_property_read_bool(node, "direct-map") )
        {
            if ( !(flags & CDF_staticmem) )
                panic("direct-map is not valid for domain %s without static allocation.\n",
                      dt_node_name(node));

Another option would seem to be

/* Is domain memory on static allocation? */
#ifdef CONFIG_STATIC_MEMORY
# define CDF_staticmem            (1U << 2)
#else
# define CDF_staticmem            0
#endif

in xen/domain.h (at which point no IS_ENABLED() would be needed
anymore afaict).

Jan


