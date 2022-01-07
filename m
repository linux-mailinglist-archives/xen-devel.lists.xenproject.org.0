Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2B04878D7
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 15:23:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254472.436328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5q8N-00016h-7l; Fri, 07 Jan 2022 14:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254472.436328; Fri, 07 Jan 2022 14:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5q8N-00013u-3n; Fri, 07 Jan 2022 14:22:23 +0000
Received: by outflank-mailman (input) for mailman id 254472;
 Fri, 07 Jan 2022 14:22:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Ee=RX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n5q8L-00013o-OB
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 14:22:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39386fab-6fc5-11ec-9ce5-af14b9085ebd;
 Fri, 07 Jan 2022 15:22:20 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-1wbnhbRHNHaKQgZr5RdbGQ-1; Fri, 07 Jan 2022 15:22:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.10; Fri, 7 Jan
 2022 14:22:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.017; Fri, 7 Jan 2022
 14:22:17 +0000
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
X-Inumbo-ID: 39386fab-6fc5-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641565340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W0aR9RyLcm2HgSb0SEQ4dUaDAcdv7xx4z6fzykrqqvc=;
	b=DsOLROE7RsBOP/l/AOzzZbqP8eUmEgwELMeVR/qtFS/CjtrDo90407YWw9Ga7GUKxr1h6k
	IHOQMHDkILbGi9oysrFD/VBdXYppvJe/4agY1yrJBS8VDEZKyEJzZLvpDrr7zqE3qnX7Un
	9yPQWTNaili0mS0HZkqjTkVBz8YicfA=
X-MC-Unique: 1wbnhbRHNHaKQgZr5RdbGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2mm27whvtyte3fzv642DmHH5vrHygsGu49L6jVT1uZAqmsiAmrwYmcylLYSFhl//4QsIeztiHkrv4BCqKW/0bWCYHpx8z1OvnCDR5RYCkiA9wHhG/q09/So7Hzgbkiqmfxo/GzG09GYcshZ1qN/QKH55s6XNT44NEJuo74VwgaOyIAHDX8elN21ntdBlNtzgPjtU8jDDqpu1ahwvkID+tL/hQ73iqSTjVj97yzGLWDndE45vQEdzTkkyQRjxZSqzTlxvYEhyf6AFg9vXYJN+Y4ETHLzrsTKK2bOUVnu2+xRa/GlG6w9qBTAoXFp5x49ETCCYr5SvWVkHohv9oTOHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0aR9RyLcm2HgSb0SEQ4dUaDAcdv7xx4z6fzykrqqvc=;
 b=SSrvf76vTBE7+EZUJVjoHOp7hTOc05FbWZ8x+8m1PSoQqzJBvL1dh8nP62OyfMbgo8E42vVwXlzPimPfLBuTuzBNiCbDIUslP9uw875p4RpP64WerPD1vNl0yUFT9khajVa4hJG0DcXApS2wUl5hSD/+LCODccC8Q6gd665ucsWZt5068ivLzDuCa0doLE5gxhMrafSHyQb3cFczA8UHp+FxchJMtDGGXgOXLGzJi9sIyuo2ILU1T0Pr+hMgbTlZNhCOlE3Y4YxvYwDFB9ybVgmghEbFZ+9Hk4/+C1HG5Udsp9cVA3k2YLFzhHrg3Igw5Y2LkQKfvSuNI7i0WfrMxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e13c5289-f32b-dea8-f9c2-a0a6a98413a4@suse.com>
Date: Fri, 7 Jan 2022 15:22:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v4 02/11] xen: introduce CDF_directmap
Content-Language: en-US
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20211220052123.969876-1-penny.zheng@arm.com>
 <20211220052123.969876-3-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211220052123.969876-3-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0078.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8aa6d1e1-a7b9-4c2e-3a93-08d9d1e91bde
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37740828F5D457425CA7BC78B34D9@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xFgffru9hYNJxXxYNV7G2UkWhwZ9JJBEEh4iwrzcVy5XAysRoT28JXfyRCijslEc71UuQcN5oAuJoWTiflXO88bm8z9zPhDOctqV73stThOR3vSktLZzmmhuuiE+KhPxCjVn7D2LnZlzvoiMGuroI/VWUYT1iPO0PsKZllxceFI5IKtiLrWSwyBOboOLLJ4qIVwIO+dbXic3c3NJ3/NN/17Eyj9bz+0Ch/YPTi8r3QZWwXn9DKiPticU+otHMUNSL8Ux4RsJlkeIodf5O0J8u31lpp/AEMIGuyJUx65Lvd1PsOsHOAW54CLzd0bZ4zQF7nwlzuXF3Mt/i8itElJ4Avg3C+zqIG7PoRgRzZTBCFr2qxOBKbaQl9FcunXUJvEG+5CPdGBmMwHFXA8gc/cR/3hh/WYHZAYf3tXMXPi5JJJtJShVNtNiGnqP/LKcWP5N9QgQPofCEo9XbT05QDe1vIv97zkKg1W8zznibpxEg1bh8yUUNcpgNXyOTmusklMMCzUXEBDzNzz6o2jnmpM1FovIoCGEEkWefITHUI1kpw/PfymEhzWVRG0KsqUVuSG5S2kyQvCb9vR0c+WAbBFNi76ELyyDVklQEUVf8/IgEZ4t+wUs0FILpEPGdtFxouzzkT9j9XGZzRats3YCc1x1u39HLTJHlbtOw/Hur3X8AVxPcm7nfX+2NHFebfpl5+P9StKaCr3XP4sWyZVWNZoGx0Ig4m5Q/nWZdOvVNlMN0ZnNwsC0bq6mjCaKkBhEwhJ5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(38100700002)(4326008)(2906002)(31696002)(6512007)(508600001)(186003)(8936002)(26005)(53546011)(6916009)(6486002)(31686004)(66476007)(2616005)(66556008)(66946007)(5660300002)(36756003)(86362001)(8676002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVg0OHFsS01PWk5Wd2c4aHBFdHNDUjZQbUV4bEI3bnN2VGtUc0tvQ21SVHBP?=
 =?utf-8?B?alpIeXhEYy9VdWEvRitRQmN3WW1rVCtDNGRSWmpJNDVYYmpIcWRrOUVkOHNx?=
 =?utf-8?B?V21LM2tDd0lmYjVkUU5NSHhNNEJUSlEyS2NHdWIxNFR4ZGM1OXZoRFE5SW5h?=
 =?utf-8?B?czRZOHlYNkdSRkhwQzkyZXFFd0lJaTJoQi9WbDhGUFVFOWhSVGRhZ01oTHJ1?=
 =?utf-8?B?S2tFQ3FWTkFVd2V3UzR3b2RJR3MyZXZrZkZjUG9lV0NQdXdPN29ET2FZMkRo?=
 =?utf-8?B?M0w5K0NEU0JoRUhSVEljTkpYQVJvb2IrOHZRZVJvQlc2ZTNvQVJTbVNkaXY3?=
 =?utf-8?B?QWVHSm01Mmc5S2ZIckNLcFVnVHBaTmxqQmtaUDFsS0l0SXVCK3dZS01nNmdH?=
 =?utf-8?B?TnNWbzB6bUJpS1Y3d0toMGk0TFBZYy82UTMyUWQ2R1RLUVVTam9vbWRoL2tu?=
 =?utf-8?B?YVNwTGhkMG1oaVdHb3hkUDhmcXJMU2VuVC9COEZLaFFGK0VzdW1OaURET21Q?=
 =?utf-8?B?eFplRTB5ejVkYkFuOXF0a2RlVFVIZnFCOThnVkZUVGd5aWhuMm5tellMOU85?=
 =?utf-8?B?RllSaGtScXdBSWUwczF0RWc3aWFqREJHeEgxcXpPOXVVSDhaZnd6aGprRVRP?=
 =?utf-8?B?OEtVdnIvOFhSdFcrcndzWldpZmlraDI2djdiZW02dkwxK2xCbUExK3EwdzdV?=
 =?utf-8?B?cW54SVZWbytsa2NEa3dKODR1T0hCRzdlZU10WXA5aWdxcE9UQ1BKZWlhTnNh?=
 =?utf-8?B?YzIzMnNDc2JwaUJyMWhUR1hxZUJPM1M4bDNJU0IvQit4Q1JtMVFOdVdHOXht?=
 =?utf-8?B?QnpSRFd1WVJESzcrTVRobS9mazd5eXpJamJlQUFIdHg5MzZCem5UdlM4M29B?=
 =?utf-8?B?ZExoZ0hKYWRtQ0kxazJkNzdGT3ZKeHk3YXllR3BEZEMybm00M1hhSnp4L2Qv?=
 =?utf-8?B?amVJZlgrU0tVeUVrZ256MzU3Z0RlOUYrSXV4aS9SS0lmZ0k2L0xXdzZtY1E3?=
 =?utf-8?B?TGpDRkdId2lQTjlFUGdKSVMzOTBLWm1SaG5KN0FrQ3BsMStPNnJvK2NtUnVv?=
 =?utf-8?B?WVR6OEhFaUgwL0tsb0FzK2ZubFBRQlREenl5eFdyVk9yelVBbGNJQnkxNU5K?=
 =?utf-8?B?U3dxMy8ySkR2SytPMHc5dUFpWTBkNWszdEJqcTVxSW1HOWNRbFNoOWUwangy?=
 =?utf-8?B?VG44UW1jVUhPVVIxNVFwb1o0NVVCNGV4VTdWUVVXbmhaZDNLaWVaM0x5V1cx?=
 =?utf-8?B?SzhSSXZNaFJGRVcxWUFFOTc3ZittWXNYRXllQzZwK1BuSWFsL0p5NFJRSWgw?=
 =?utf-8?B?OEJYaXZkd2twNWVhUndGUnMxc3pVSUhiQ2ZPUGljTVVrTmE2bjVqVys2Tnkz?=
 =?utf-8?B?b3lqUlVLMit2KzZsbTA0NTJRc3B1NXhwR3lXSElGV2xmeHVYWEo0VXdnOVV1?=
 =?utf-8?B?QzJQKy9BK3ZPL2lqWERuZ1lBNmpFa0dBY284WExnOVZiM29rd05DSjNPTWhM?=
 =?utf-8?B?bmhCbnlDM1I3ZW1yeUFidzJ4aVc5VWpYelAwWFBMQmU5Z3A1RlpVUFY1ZTZ6?=
 =?utf-8?B?Njg0ME45bnFtMEw4eWhTU0s5SngrUmNrakFtS2c2cFFiOG5LN3hHRmt4SDMw?=
 =?utf-8?B?cGFFOW5UQ2Mrdko4bXI1WFdQMG9hSkNLUzRuaTdhd0JqUG1PR3RIZVIxY1Fj?=
 =?utf-8?B?L3JoVjhUQ3Z6NzQ2MlJxNk5ycUM0a01OQjJVZitRZnpFZmV5a20ycEhITkFk?=
 =?utf-8?B?eGtscG5XUG9FbUQ4RkN4bzQ2YWxpVmtWY0ZmaFRJNGRESGVLMmE1cDAwZ29P?=
 =?utf-8?B?VHkvSHQ0WURDOFJDWVpOMU9jNGViTUw0RmFuUVRsZmZBN1h6TEg3UmQzWE9x?=
 =?utf-8?B?MzZBY2RNVzZ5WnpiQ1h1YTFuME9zeU1sL1FPQkFkTlE2OGpuNHU2bmtyMDVx?=
 =?utf-8?B?ZjBkTVBqV1FaQ01JVmdxRmQ0VjdpcU43ZUphQWZyZWtkZ0xWaTU4bVk2eGVi?=
 =?utf-8?B?aWpsQURwUk9WWnJoNGVNV2VZOXFRd3VrTVIyUEdXemRuMDZJelRVb0szMjZJ?=
 =?utf-8?B?MjlRUlBKOTBydHpZRzA1VWRRVHNmVFdxNlFHNGhvN21MNDRzc2tFTU5RSVBk?=
 =?utf-8?B?MGdXN0Q5dnp6Q0lxVUZkTmtKVDZ2c2dzVWNtd0JaNC91dzFoUkpLVUtGeW82?=
 =?utf-8?Q?pR+LGJ7mTE9nInUHSHFcXlM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa6d1e1-a7b9-4c2e-3a93-08d9d1e91bde
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 14:22:17.6438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaIUarcEUz5iiailK753J4TLv118v47+hTMa4j15GUDjVMlBMPp3GzVkXJy+Fg54Zd8oVtqf4GfJx2vffNb0MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

On 20.12.2021 06:21, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> This commit introduces a new arm-specific flag CDF_directmap to specify
> that a domain should have its memory direct-map(guest physical address
> == physical address) at domain creation.
> 
> Also, add a directmap flag under struct arch_domain and use it to
> reimplement is_domain_direct_mapped.
> 
> For now, direct-map is only available when statically allocated memory is
> used for the domain, that is, "xen,static-mem" must be also defined in the
> domain configuration.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Non-Arm parts
Acked-by: Jan Beulich <jbeulich@suse.com>
However, ...

> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3029,10 +3029,20 @@ void __init create_domUs(void)
>              .max_maptrack_frames = -1,
>              .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>          };
> +        unsigned int flags = 0U;

Nit: No real need for a U suffix here.

>          if ( !dt_device_is_compatible(node, "xen,domain") )
>              continue;
>  
> +        if ( dt_property_read_bool(node, "direct-map") )
> +        {
> +            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) )

Isn't this too lax a check? I didn't find any other check of this
property, so the use of static memory must be keyed to something
else. Hence it's not sufficient that static memory support is
enabled in the build.

> @@ -65,7 +67,8 @@ int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
>  void unmap_vcpu_info(struct vcpu *v);
>  
>  int arch_domain_create(struct domain *d,
> -                       struct xen_domctl_createdomain *config);
> +                       struct xen_domctl_createdomain *config,
> +                       const unsigned int flags);

Same comment as for the earlier patch regarding the const here.

Jan


