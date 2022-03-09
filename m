Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A6E4D2FDB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 14:23:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287847.488092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRwHe-0004ky-KM; Wed, 09 Mar 2022 13:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287847.488092; Wed, 09 Mar 2022 13:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRwHe-0004j5-HE; Wed, 09 Mar 2022 13:23:18 +0000
Received: by outflank-mailman (input) for mailman id 287847;
 Wed, 09 Mar 2022 13:23:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRwHc-0004ij-Pg
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 13:23:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 139255d8-9fac-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 14:23:15 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-GdfsXvOQPxuC3sMzOsz-Hg-2; Wed, 09 Mar 2022 14:23:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Wed, 9 Mar
 2022 13:23:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 13:23:11 +0000
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
X-Inumbo-ID: 139255d8-9fac-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646832195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t6wfWfh1Q3I4yPNq/WpipMeqY+xy9cpYPKhae/68H+w=;
	b=Rp2fxVqH5leq2/4z3l2x73j8FA9UyvR80QN9Zt42ecAw3FVhemjX9KMW0F9sF7rkwAoS3k
	deZ8QI4Nodm8hVNonsWD+9Y/4ewaerC+YS9EsaQJPfLYPzEKYxFjIyDU9SpGL9cKN6vmJj
	jVlD3YmZ9A06q3EafpA4kv5Urbv4/6I=
X-MC-Unique: GdfsXvOQPxuC3sMzOsz-Hg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxFIfXruC3VsWZjxmGQdkO26zqgl75AH5ejB1rDVKfklmMQHksbBgzh02XanuRiBMM7UwBJCbpJUe1Tw8dY6t9DqS4r5W3dDkiDAdQoJ4GxtHF3TlrrvhjdA7CPzVgK7EusrVkSyepQG53lFluGo+8c+pbem5Ny3oiSUmmSgG2d9cbFkUleOefXJz8XnnNrsP8/0OxftAg5ABLoItuMH1zQz/IwW840bMZ8RjFoJqS9hh8FgYgtNPX4YTciKboPGO3jbLm4vlHqq5RKKNZEq70z9wU8TCExm1WgZNOnxhjmORpknwTZJGj2OHY9rp+3I+RL3lqw6znBY+vKC7lLkKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6wfWfh1Q3I4yPNq/WpipMeqY+xy9cpYPKhae/68H+w=;
 b=OIRheWWLrqmUmB7F6DJ/GOpgqU2o0NMq2gCd5uHqOEjCUsz0lJe5t1NVN/h7Bzm/ZJcqJ4FUgz9y18QMhgBbOrZmRMCk5tmndDWqvPoPdMaHIvHtbG4SitzME8NW9lzOxLFSxPKP+9sxIlESVMOXx04oKF47Dklvth/jJ5W0p1CEZCfqiJYHuCvptx9+MVRhSp+HiACp23iH3duHw5/CbIzggzgXPnMl/ea3A6sTJoktthqjbmPv8XlrSH7OtGgZv03/CQYX2h/nGlyhkL9pb1RhE6hgOewlQuJZXvBg+o8PUHZsjnoyugtzQDpU5Tm5UiTVfJuufiMy98NO2tqewQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2dce76d2-e988-dd9f-4597-0f1e4fba22cd@suse.com>
Date: Wed, 9 Mar 2022 14:23:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v6 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220307150609.10662-3-jane.malalane@citrix.com>
 <20220308173643.2929-1-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220308173643.2929-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0003.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10662c1a-0eb7-41fa-84b7-08da01cff549
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8604A89990C339368B0C43AEB30A9@AM9PR04MB8604.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UaZJtNTvcRbbzKkKh9PDo3asVQZbZPSlk+ZOGf4r8qarCZBuEimL02gBwXRzsQR/DQspCY9MDwMT17ixE27Ezo+AqfxSBAmM/VdCJUnjBYktW8l3gDHZPoays13ExKX8tjhpsHbhihqORWRusedDT0MIcaS9bjA3ZO/62K6Yd4ODVHFOoS7QCc/eOehOATcirQQky8+xT31BqhuhuUK7WEAX2C2morK+vFLvgAaSm8wynZM6hNoAYEKgr42tpPgt8WHW+G9D+Wt5fF4kogHRMCixK967bx+wB3LIR+aUyqfRxQpoEo7K+A7gJRPae4WtuV/790P0Sdnkp2nO8DMEkoBHXBcNY+6Erju8bDvm+rUGTe9pL8kPIRhf30Ok2iQchFbHsDYLHfW2D/W3DavI2dcV4BMe3yODdL31tHhSo9EygmNFacuskgeVHMUgSxJuCplVW7yQ6tNvUa6NxkTKbXkDFqmi82r8uY5Box1H62rAqq42oVO6WQmUCqqzYW5SJO7v9lvF0I/cTQsvSN4LlNTGonOwzTKZXzSpIyggBgQB2przBqzeTlfTPv073UvtJmUuxJcV3pnPDQZlT04/B12cIDB5/VMyvUWk/+7ISd+LzcSNK34SyZHZXO4tfzlQd0gBhshupHdQ5/7mdTuGT4CQNmk7PhxxRuYk1m+Eq7dyLItDf5bVLFR7GBnkTHf9Z7mVc/BWbnWYgLkOBKGhTe4acOMah2LZG9Kvq5UoRNY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(36756003)(66556008)(8676002)(4326008)(83380400001)(66476007)(31696002)(66946007)(2906002)(86362001)(8936002)(316002)(31686004)(6506007)(6512007)(53546011)(7416002)(6666004)(186003)(5660300002)(26005)(38100700002)(2616005)(6916009)(6486002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGw2SlFIejdYSTcvSDZacDArTjBmWlU1bGdFbm8zd3Y2clZybDhqTUZwZVBt?=
 =?utf-8?B?d2IyTGpOaEQxcWU3U2VEdDFEWE9LVitKVWVWWEh5UUhlNllNNlA0ZVZDN1VM?=
 =?utf-8?B?OE5HS25DWjdKYk9Lam5VQkM5Y28vbFNYZXFUV0lmbUNuMW81Zkw3SHFxQXA3?=
 =?utf-8?B?MlpFbGZpTWQyeG1vNGpOZjBQbGtWWWJvQk9zK2ZOTkFheE1aY0w0QTVDU2tP?=
 =?utf-8?B?THJNbDFldkFCRGFxekRUNWE1SGF2dlFwL215UFFzQWcrSmR2czRWVjEzOUs4?=
 =?utf-8?B?WWI2ejZzV1h3RkQ0d1N6K25BZlRyWUE3SFZTY2k2UXRBM3dJSEN5QVFaMzVz?=
 =?utf-8?B?UnhJL1hzZlpWTVlJRUFBcmFUZm1vVm50MmN5VldZNXZQZmZHVmlsTUJJcWFR?=
 =?utf-8?B?eHB6c1Iwb3JUUWpHUzN5SEs1dnBIU3ZyWDdrYjRLbWluUXgrYThSYXpuMkww?=
 =?utf-8?B?UVVwYmlIUkc1YVYrNE9yQTVXUlEwOVR6ZllRb0JCVzZqNG9BYWdDaFR4N2pY?=
 =?utf-8?B?TmR1UjJ6a2xlUjg4Ni9iUWk5bDlibk9uTldZd2hZeG5ROFMwSWlqclhINkp0?=
 =?utf-8?B?OEh5KzRjSkRhZis0bTVkK3ZYWWFFRDlmZlZnTkFqaXlxaklnYmdBY1JHMW5N?=
 =?utf-8?B?UGwvSDVlQVIvOVZDaUFTcG5FRVEvS1ZzT1F5TlVKRjdJcU5HLzhiNEx2VmVF?=
 =?utf-8?B?Q3Y5bEtqYnJDMDB0cTJaVU1LYlNEN1NHNkY2TlU4WHh2QmhFUGM5NitjNlNL?=
 =?utf-8?B?OXBEVTdzMWErMVhKV1BROEd3emJLcVREdU5UTkR1YnE3K1FkYm13Nmp0YnMv?=
 =?utf-8?B?TzRjUTB2R2loSmt6S0ROYUI1WmFuN01sam1LYTRWSDZQazlhd0wzOFhCRytW?=
 =?utf-8?B?VEt5V0tHcmFTRHFGa0htM1NMdDR4bXZHNkJxblNsK3c5WW5wblJOZS9hSVo5?=
 =?utf-8?B?VUJETTdOcmpCUjNsN3V3eEF4TTFnaWFoUWwrWEQxWHBLRUlIbm5IWU1Ib1lN?=
 =?utf-8?B?VloxbTFNeUVvSmV1dXpRWUJKWEVUMGs2NlVtcHBXTFppRTBtN2R6OEc2Vmk2?=
 =?utf-8?B?VWxwUDVYQ0JoSWwxNVhPNTdOeDdiN3RaNWc2dTBVUUpwWkhFT0RVZ1h1YzVp?=
 =?utf-8?B?NHVhem5DNmh6LzFVZGx6OVdrWEZscTJBVzJFRExjSTB5eEI0OHpTTjNEVVRa?=
 =?utf-8?B?aXE5cDlLaXZ1cFdnRFpGY2RpYXlaYlV5T3JkelFKK1ZKV01pbnJlSFpITDZB?=
 =?utf-8?B?aUt3T2M3YUVJYjVNYkFNZ0NyMWh6UXJ6cy9kRFBLRDh4Q2lmNk5DMHVxWEN4?=
 =?utf-8?B?QmRNbVF4SVRaTXhscHhud2IybVRkd2xIemNSYm1JczhqQzdQSnFIendzWDVF?=
 =?utf-8?B?SnVDT0RZOHU0OFRhWGhmT2ttVlgwdnQ5R0FnSExVUUlwZEFlZk1ERjhxU0xz?=
 =?utf-8?B?b29yQkc3cm5IcmcxRy8vanlFUkhKbWgyQ09EWkZPTmJ2MTR4YjFrWER6aUNW?=
 =?utf-8?B?N2FaYWFTTTNtd1JlSmdoYVpzM3hvbVEzQzVUUG9NZ1h0aml2QlJuK242TnNi?=
 =?utf-8?B?andXTXlIRVJKaWVrYjAyaUZ0N1BPVWtKemowM3BVdzF1LzNrb0M0d2puNzZP?=
 =?utf-8?B?TGw3cWVLSjZUMVFDaFpmVTVHZ2FJOXVDU1hZYlBMVGRtUDczQU1pSnY1NVNi?=
 =?utf-8?B?YytOdE5WMGNITHFoWG1NMjI3OVViSGpzaWk4aU5QOEVYTk5UTlVoeHFYOWVB?=
 =?utf-8?B?d0MyL3B2VzJzL2dUdGF5OGgyTjVLRVdtaWJPRCt6aXV1ZmNkN1pibFVZZlR2?=
 =?utf-8?B?VWh1Q2xGYXc0d0ZaN21CdkZwN2RLeWtURlZTRytNSGpoS1hxZGhjdC9DSEhS?=
 =?utf-8?B?c0NyZTVJRWtrb2lOKzFkd1NFNkxJdi9RRlFVbElQdG1FR1NQb3VLdUV4eW42?=
 =?utf-8?B?RUZyVEQ3bTVWS1d1NDVZdWc5cndOU3pLSWdDOHBZWXA4Z3phNjJzU0lQVGdC?=
 =?utf-8?B?T080S0NFbk80eXd3YklRaUdvb1NHMFFrOHlyLzlQUXVNZWZYYlI0V0dEcVcx?=
 =?utf-8?B?eHVHN2F4RVkxYTFKREJYa2lGOWd4ZHVrOHhQWGJLZ0FKVWl5T3liMVJrdmEy?=
 =?utf-8?B?dm1RdWRaeHp0RE83L2lGRVZQVDh6ZG84WGdqSS9EMFBqQlp1d3ZmbEo1THFP?=
 =?utf-8?Q?uG4GLT/bK/3Yz0QXRgFPKLo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10662c1a-0eb7-41fa-84b7-08da01cff549
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 13:23:11.6127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9QmM3uP3yTni6oSdt0HmZm6MM6fCaz34ce4UHCDJtZHtuww3AOG3ReJjmQr60PHt3IOIpXp9rtuNKZ98ZbQNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8604

On 08.03.2022 18:36, Jane Malalane wrote:
> @@ -685,13 +687,31 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          }
>      }
>  
> -    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
> +    if ( config->arch.misc_flags & ~(XEN_X86_MSR_RELAXED |
> +                                     XEN_X86_ASSISTED_XAPIC |
> +                                     XEN_X86_ASSISTED_X2APIC) )
>      {
>          dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
>                  config->arch.misc_flags);
>          return -EINVAL;
>      }
>  
> +    if ( (assisted_xapic || assisted_x2apic) && !hvm )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "Interrupt Controller Virtualization not supported for PV\n");
> +        return -ENODEV;
> +    }
> +
> +    if ( (assisted_xapic && !assisted_xapic_available) ||
> +         (assisted_x2apic && !assisted_x2apic_available) )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "Hardware assisted x%sAPIC requested but not available\n",
> +                assisted_xapic && !assisted_xapic_available ? "" : "2");
> +        return -EINVAL;
> +    }

My understanding of the outcome of the prior discussion was the opposite
use of EINVAL and ENODEV respectively.

Jan


