Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373C551BDCE
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 13:14:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322005.543188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmZQL-0001zr-4B; Thu, 05 May 2022 11:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322005.543188; Thu, 05 May 2022 11:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmZQL-0001wu-1N; Thu, 05 May 2022 11:13:33 +0000
Received: by outflank-mailman (input) for mailman id 322005;
 Thu, 05 May 2022 11:13:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmZQK-0001wo-8c
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 11:13:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 655789fe-cc64-11ec-a406-831a346695d4;
 Thu, 05 May 2022 13:13:31 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-uuY1WKC8MO-3xiPJ3ya-dg-1; Thu, 05 May 2022 13:13:25 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB5362.eurprd04.prod.outlook.com (2603:10a6:208:119::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 11:13:23 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 5 May 2022
 11:13:23 +0000
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
X-Inumbo-ID: 655789fe-cc64-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651749211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IknTPg+MA5SHn/OdlLcI4UhfMTjucHnRbWuw51/GaZE=;
	b=Czo+qLul/g+b3541gr5w518TR3HDS9cT8f9f79TKeGygrN5WcUQzJpIzg07UIAlpWRptCE
	J1hB4jn79UpzCKLrUUsF9XHn97tDgyt2QMv6Yi5hZWoWqJazwaUqK7HHj32F2K7rt3qiiK
	uN2Fa+eJtvJDxlnATRw6xbAimazR4BI=
X-MC-Unique: uuY1WKC8MO-3xiPJ3ya-dg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CD6gHCx1maNZt7g2nLdrvQd04jakAiV9YH2v70mSyCXsLwj2DvsgGXtzUZKdbzuNXPTaSJiiaBbbBYFThE58HTZ0QOdodS/kRsSxL7UwfTJVqyf8O2PYD//xawjMn1vi94ry0iStK+kSSVhWKv1RUfWX2bGMl1f4Xx4LnsFX59QMbHr1Nd9l+jb8UwZJ1DxZNJEBFGAi9gXkr37lCHnUN+zgGdv6r3fHyyZ8LFfvg2n0w1eAtvRx5JT5jMwP8gdgp6vGFDnZ/znr/pixqiBl75St/GhPXN2oKisWtWaDKXN/iJ2hOg8pDDFj59hTz9ofMdiKEd21NLb2QPFl6oPHYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IknTPg+MA5SHn/OdlLcI4UhfMTjucHnRbWuw51/GaZE=;
 b=GL3Ek34g2xbuhnAeqISoqzinmdtoj71xs0D7V5UIQd0Y9Yz2lzwZ9IwyvtMqy09AfEGyCqC8gvfGEpmp2gTc3nUlYbaYplkpnjqKlgK45r9C3XCigUX5px4GwZ3RwZJc3FCGe8TatrjtjfNo0bBSb6vV6QB+YPa/IxwjWVmPpQTygbJ0FG4R4AMVLblYCkWBrqtTO+rRwokElB/zudjOZLFSJrufZYLMYi0wwX0Wp8Wlvcwy7Zw/ds1Nt3guh1BGT36DnIC7fPmMwM8lyOGDw7mGIO8qCiUwUw6PPrug+vUbWq8oIl/vphlFKiigp3p/wYzSu+7Td0M7WVXlwE0gkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e759dc2-42f7-01d4-3c3f-17ddfe85018d@suse.com>
Date: Thu, 5 May 2022 13:13:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] xen/arm: gnttab: use static inlines for
 gnttab_{release_}host_mapping*
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220505103601.322110-1-michal.orzel@arm.com>
 <20220505103601.322110-2-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220505103601.322110-2-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0298.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad1ae64b-9da0-4a72-f30c-08da2e884499
X-MS-TrafficTypeDiagnostic: AM0PR04MB5362:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5362E8A94547C8A97E6B8064B3C29@AM0PR04MB5362.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QU7yB7vSvRz+M7ZU3VPwlqd080hyVFlT72g5YhKYQ2AtDyRB2SnDLWQvPe4JuJU7TD0xgkRhej3zo1h3DbsUCLXEzZ++Hz4Pr9thsp13Ctwe03P+MmfNGysYY4cZgpQRwY+U5CmhGp5wirTLCfF2Rm+hJQKRvQNFnQbZNnTvDe3st1+NIFLwJNi75uZYoxc+iAV4SXCofy4MaX0JfPKhd1ngSIS+/js0+e3F/BidVV9JFwEAr8rIRU5r7d8zMHYmoK+vWCKhonG0/fxlH42MXEbA7q+gm0bzrJi4AJrd1q9+HCrd0jjCOT5jKdDmXUtLdytkbG6VVCK1V00GF0NJ6jL0kFjHWkAuTAlVtvVcAmWQst7PWjreT3A+8rCPB8Ca5Sy5/biqo05x4GLwqMsKPIoGsM/nRJ/skX36qgYsQ6OCl/miEINrcfa65BFmsWMFWWV+9HdZjSV0TAZdoT6EyJqFF5brKU9W9DLFGl4drQZykjAjlo2g9PKhGDU8kW1ybvVE01uUYEUPcduJqedn8gGkbLtdJVgfcyFDcR+qHccCme6yZaI/5qjZw7P8bqUYIJsOGuEwKPiGT4vVnRBf25R0VcJeDV+CNNWn0XxIbCNfPxsbMKTfBc2dbwFvqGYImjh6lQ2qve+QnvNZnLLj+3yJE5t3LNjbygwOMts1g9qoyQNEq1KKGgl0A/Yf8vFBVC9Oa0g5gmR2shBCjx851hmC10+PlIzD1gVCzl5VLK3gvy+vCYRONmwd9hCKWMnn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(508600001)(8936002)(6916009)(4744005)(5660300002)(31696002)(38100700002)(86362001)(316002)(6486002)(66476007)(66556008)(8676002)(66946007)(4326008)(6512007)(26005)(186003)(2616005)(31686004)(6506007)(53546011)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REttQkJuTEZFdFBHSFhYUHZmY3c4RjU1am5QSTJ2N3BJeGFWakFuWDk2Z2x1?=
 =?utf-8?B?eUJJTktFM1BjQVdCakRIZDFFRGl5b0pMQlM1RDVJLzU5WDRReE1tYVQ3ckxJ?=
 =?utf-8?B?U1U4RDhDVzNDazZWYjN5UnVGUTNud2lOU1hJSWo1Yk4yMDlReFd5bWJkekpS?=
 =?utf-8?B?dWJWdDlOZkV4Kys5dnV1eExmSFZuOS9KOS9MYjVqK0tTelFOanpOc3Mvdk15?=
 =?utf-8?B?Q0locm5pMWNTTUxoWUoyenZwVXBZNG5IOWdxcXNZaUo2cHR0RDZNOEVtTy9i?=
 =?utf-8?B?OHp5N0N5VEpPNFVxdHlwRnE2VExPakIvcGkxdmFCeGdCT1VvdFUxME5sT2xD?=
 =?utf-8?B?dTBYbXUrVkZRd0RaaUNBK3MwczF0ajVXQU83dXFSME00OE9iUVNpeFNoTEJt?=
 =?utf-8?B?MUlSbGQrT1ZyWUFtcWNzNUt4b2d0NCsycEwzSTRlRXpWRTZud0FjemlBUUhT?=
 =?utf-8?B?eVNIY0NoVTluUStqSHBqN05pUVJ5dXluNUFXRDczSDZ3c1hmNUhPbkoxbjdo?=
 =?utf-8?B?bzhvZmU4QVZ1Z1AxczQ5c1hON1JDNVRlNnlueXFELzJ1ZTJLblpjYWpqVnh4?=
 =?utf-8?B?djNDM1gvS2svNG5nRENQWmZWRXRKNXhyamo1UGxXS0F6dXp3elVvU1pXQW1M?=
 =?utf-8?B?RUZEdnhCZHk3aXZidFBtL2VTb3VwNDFIQ055OXpQQjJKWG1xMlAyTFdRbWV1?=
 =?utf-8?B?MHBsY1BCNDBmamtTVHRzaUN4Qm42enI3L2xUUitRRVF2Zm52YVQwNDNNSSth?=
 =?utf-8?B?cis3Si9FTlBESUxOQ2VEMmk4VWhNWUpjTzYyNmgwSjhqY0lOZk1nZGNWSHM1?=
 =?utf-8?B?eVlsVHZ2YmsxRnloUDYwZ0phNDVubXRTRDQ0RlRsMGg0TTNsbXVwYVMvK3lR?=
 =?utf-8?B?L3QzN3RER2F5N2syUmlBUGNtRWh6MTJaUXFMREszVHY4VUhxM2hxMTRYOFRu?=
 =?utf-8?B?dzVBTEhINjhyODNUWi90SUlrdXZ4QTJva2NVZzNYQmdPbkVzK2hDZ2lGVDd5?=
 =?utf-8?B?VkFnZHRxQUhuU21FSnBmSXRsY3NzbG81OTVDRjlqTWpxTGo4RTFBcU03bzRr?=
 =?utf-8?B?bU0yQTRWamRXTVNVeHJlZWx4Wm1CeVBMODkzK1dpYUx0NTVON1RJZGkxRW92?=
 =?utf-8?B?bDVxM09qclorNEFvdDgzbGEvMFZkN1dNVXRnUEl6SzBmWWFzS3BCYUNXZ1da?=
 =?utf-8?B?R1crbHEyYUZlNjVHcHdMM2xCdU16bGxQTzlQa3dtaGYyUUlLb0tKalRyMzU0?=
 =?utf-8?B?UU1tNkFOU1ZBb015TnVhVUVCOGl0RXVmSWRYcjdJSUJyOGVGbkZteDNtRUQx?=
 =?utf-8?B?SFhybHZPRkNxOUFzQUpJa1M5aitPd1RsUWhCWHROVlVKQlZwRTVFYTM4dVRF?=
 =?utf-8?B?aG1ua0s5dHllOUk0djI0dWNWWFVTZ3pGTVREZFJTeEZsRWZWU1M0WXdNamdX?=
 =?utf-8?B?YS9kNEZJVVpIcFBSMXRJQ0d6Nzl1c0MzTGNkQjg0ZzFqVkwwSDJKUURZbkxR?=
 =?utf-8?B?ak9zTDFsRjJBUmF3Y3A2RXp4NjNLc2oxVlpEMjl3ZlhPYmw4VGg1SWM2S0RB?=
 =?utf-8?B?Y1d5Q2djaWE4QjZYblRIQzV0Z0M1NEU0UUJVdTRralg5T1JPaGVMaFU0dVk3?=
 =?utf-8?B?ZVlXTThWSFR0SWFtRXU4UUxRSUNSR1R4Q0pGSHVsRjBXMHIvUTNPYU9BeFRP?=
 =?utf-8?B?TmNSeVVRUmVXSkxqdlVMc1cyVFNXTHhjVVYxRkRsRjl6RmhpMmx6Q0dsQVZi?=
 =?utf-8?B?ZHhuQ2hudUFMNmJvQ09SR3B2WlVUR1FUcnRBTHErd1EvMko3RitQZDVPSTZl?=
 =?utf-8?B?MmdiTFhjUThoMFVuaUwreVdxTjZPd0NWRUE2YVg3QkswdXE0V3lPdW1iNnJW?=
 =?utf-8?B?MVBQTHkyL2hJZHVvbFlpOWF3VUpWWjdXNTRkNXF3NWRUVFVzTzl2bFJnaFp6?=
 =?utf-8?B?UW1hV1BGSCt5Qmt1YnVKUUQyNHVlaUtoaEtKVndHMU5pTU9CN2dqbE9Ia0ZZ?=
 =?utf-8?B?Wjk3ZUE1eVNZMnA4YkpxSlpQQStQcHBma1FCOElVY2dQNlhza1ZLZUtSVFJ3?=
 =?utf-8?B?UE9mUjNyb2luTU53ZUp3Y0pYekpzbFlQR0xJT2tFYUlCNXp3Y285a3loNmQz?=
 =?utf-8?B?TXdnTUVmQjd3NVRLb1FLZjI4NHVON3EvWnd6WUxrSXA4a0FBYzFTWll6WlRB?=
 =?utf-8?B?YVc5NUhwdE5SWkdwSWh3bU5ySUtobzdsUzZHUHZ2V1NTWGlpOTBzWmpGcmlm?=
 =?utf-8?B?SmJXZzB1ZUh0a3pyQjdTLzA1aXFWdVFNNTFiT3RwRGx1T3pPbVR4ZFZabThI?=
 =?utf-8?B?ZGRyNVBBS3M1eUJuVkIzdE1UQkRLUHdhaU5zcFFJaTZhclhIdmUvdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1ae64b-9da0-4a72-f30c-08da2e884499
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 11:13:23.1153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1lvfcPxREqQzcicpZKjym59HlV1erC1s4WWIb7o8vI6PVVoY+CiL/xYH4Ttrw5wrVvDHz4nOeIcvYkMjtbRYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5362

On 05.05.2022 12:36, Michal Orzel wrote:
> --- a/xen/arch/arm/include/asm/grant_table.h
> +++ b/xen/arch/arm/include/asm/grant_table.h
> @@ -29,12 +29,21 @@ static inline void gnttab_mark_dirty(struct domain *d, mfn_t mfn)
>  #endif
>  }
>  
> +static inline bool gnttab_host_mapping_get_page_type(bool ro, struct domain *ld,
> +                                                     struct domain *rd)
> +{
> +    return false;
> +}
> +
> +static inline bool gnttab_release_host_mappings(struct domain *d)
> +{
> +    return true;
> +}

Looking at x86 I think all three instances of struct domain * want to
be const struct domain *. Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


