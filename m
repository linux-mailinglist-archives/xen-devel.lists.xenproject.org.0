Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F39884A4691
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 13:06:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263067.455630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEVR3-0003GU-BV; Mon, 31 Jan 2022 12:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263067.455630; Mon, 31 Jan 2022 12:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEVR3-0003EC-8T; Mon, 31 Jan 2022 12:05:29 +0000
Received: by outflank-mailman (input) for mailman id 263067;
 Mon, 31 Jan 2022 12:05:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nEVR1-0003E6-7C
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 12:05:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12df667a-828e-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 13:05:25 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-w9U_t3VDNDmaGOogMXEVLg-1; Mon, 31 Jan 2022 13:05:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3908.eurprd04.prod.outlook.com (2603:10a6:208:f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Mon, 31 Jan
 2022 12:05:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 12:05:22 +0000
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
X-Inumbo-ID: 12df667a-828e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643630725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SGSu9fisyfVy9eWrZKdoaw4VlvCYs0jqkrwz8n9jUAQ=;
	b=EbJUXqhGIPPc08f0hv/CmUw/ZwGmvWXYZekAAGC2l9uohrAaZTsz1khuILJGULPCAHjtr2
	6ORxvBFuW+bcUtON4WQlUMwCqgWTrxyU3bapRRIqUtPtcVjS8sjLHWLsoWTtKJSkrS+5bb
	BPdRykSNKkRimI7HR4WKhbgtazV5qlg=
X-MC-Unique: w9U_t3VDNDmaGOogMXEVLg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifluw/Cv4pX2iVk0XNIUptDgqHwDs+98cIV1YkLAJpQT+Gfruq+E8Q6D7Bix2WjrwYjHmlyTH4Gsfu+TMYa9okorxYRHdwo/8jfk2U26YNZKJxNPxdhf78Z4Q/XBxUW8yvb8U00Rv47nQBFs4e5h0XFRJ7FPnxhAKARtAB4uBHbciSwcE/seQ3nm3B8aMXBZGrj+qY7V49dTfs2Avxik8ke6k/N1Ngg+dEVfKXNWGMlvs4CTuYIg8m+hwUqT8E1EBRG4wfZsfDrDFGC3iafnSpowIYuUECtx4xl2Zjl3eA45T7REQukwRUdy6ZhwWSLBm6OV+BavADSncdG+hwVIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGSu9fisyfVy9eWrZKdoaw4VlvCYs0jqkrwz8n9jUAQ=;
 b=j9YSdICLLG1XIu4c8OyhLA15jfePpat+IM1jRM5kjQZq0HfcRxpHf5R528Ul4Lu26JmAxp7t2IezvZqEUrjRD1/+vLGHo31gDMgqpjUWv5dO4NC+warU7+ZY/zwNiwsn9FeiH4j90+oY+Nar/m0I9Y7OITHaG68dmr1nyMceMsshL5LKgxoEQcP+X/4mJJSXJl2hk9hgrbv+j1nm/btqm3WQB7YVmBp3xS8YL+nPUvJErZaOvncACxqDGifuN7AYHjLS3j6zlmottyNn2lsegGTXaZBpFP00SPjRXdIjPxdHo9SRHWtivHaxxyFvo6rbwIomKhreG+HghzIpwMHrSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8b59b7d7-2d0a-0b8a-f936-1e537dfc4f9a@suse.com>
Date: Mon, 31 Jan 2022 13:05:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] x86/xen: Allow per-domain usage of hardware
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
References: <20220127160133.11608-1-jane.malalane@citrix.com>
 <20220127160133.11608-3-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220127160133.11608-3-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0068.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78d5d554-7fb3-4cf7-e742-08d9e4b1f4dc
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3908:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB39086019D76F6381EB15F014B3259@AM0PR0402MB3908.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H6Y7mG06/iEyhxABUJANwp1z3IFaX4j9S3KoQW9FY0jxEkzeKyNpM1ifOArk8NjQX3LIFZn8bud+RacfSbGGpHjNjggVLE9OnIQbD5spMsYbssU30T2eDwO2/hMxHslSAyjIP/2HccFHhCmh4xhmkW/5MZuqOxxkn8HXTPsp8FTW338OeYiDwTEPketFR2W069byqLuwmZN+oGtYT5pLR2zWmg5qZD9U0YZfutibSNQz1bzdmcWn32h/rtuN//ivWNKvjg3PjJJh7gh/7Gdxi2CeiH0jEA+gpVRO97nKjgz6ujnn3owwOGUL0/79TXDZIStO2Hxl/hxIO/HVomA5raUN/C4XVLTABzEjL5dPAHsAnzFZacCJHPnts8UCMfz9qorgpH80oOSfK9XGAArNXkf+KryXOUs9fRUUkLlFvrbKsmWJ0YOZfw/CgVVyUCPlYzGisP4/mVcSDv++fm518AXlRXcaLINqyT25bVzmcD7IDo19KMVzaINPeQBaJpIp2GgSGHwMBk+RentHPHIhgbGuo9hRfdaKkqNLlPYstMjGZytAZN5fpXhJnWbELJcihqGStI8VY5YjM3KurDjJQOTWSym+iiHYrJs+cQnyk9ptIt9YucWjmf65uylWDzpir+XEvh3QzvvHoibRP6+ofGuBcvJMJQZ3TR1aq7ySwEdG4NpoczpIPG0ds4G42rIL9uP3/JwGMUGWhcrsyrOcmRx9Il8aqftiWMxmMmczJKmD2m9VSap0bUxiflyo5q4I
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(6512007)(54906003)(2906002)(86362001)(31696002)(6486002)(508600001)(8676002)(4326008)(38100700002)(316002)(26005)(36756003)(53546011)(8936002)(186003)(6506007)(5660300002)(66556008)(66476007)(66946007)(31686004)(83380400001)(7416002)(2616005)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHBTSHR2c0Z5TXg0TzNieHJraFNRNjA5YUxxcmxIajNZK3E1ekNvbFpHUWxL?=
 =?utf-8?B?UGlpam10OGtVLy9xSHdhOXQzL1M3OXE0dVVtY2JvR2ZOamVpMVZ5WkIyU2d2?=
 =?utf-8?B?cytNSU40WGgxTko4b0MwZ2tSaG5Ibk9iOEdqeVdVTzJsWUNrOFRNckxjbHFJ?=
 =?utf-8?B?ZnJRVXN4V2VGdncrdy80QzZTNXZoUUxFd0RsWGUzTDk5OGx6NWVObkw1ODR6?=
 =?utf-8?B?SHgyamo1Nlp1VDI1WHZxK0pQWmxCZnoyVjdVREVJcVJSVVdjbWhCeXpUOEFU?=
 =?utf-8?B?YXFqSk9YZFBaYjFIcG9wZHVZN2tabkZWZllVUVlqckZGeHRWWXkzeWlVbE5o?=
 =?utf-8?B?dWphQlVlSmJrZERqKzRKOHY4YWcrRUQvWjdLa1F4amdzbU9xMTBLckhmK1pN?=
 =?utf-8?B?SEVPbzlMeW54aUZ1NVVQNXpKaVZIL2swYjNNWmJqY3RWRmVFMklIblViVmc4?=
 =?utf-8?B?Tm5BVHpEUFByVDEwRStJWC85MFNPNWF5dXUwTTVROGhGc1grR001U09BUXJs?=
 =?utf-8?B?Y2U0KzV5S3dTekVDZFN1UjZuM3pUY0RxYU9RT0pYaDVQc09EQWRacGdQckVi?=
 =?utf-8?B?cUJBS0ljSG41L1o5ZUx2M1hLaW5sYXgwNjFQb2k4MG5xZTRkODU0ZWd1dUtk?=
 =?utf-8?B?U1RNSXQ5TzZuOGNlV3ZNSzIyMXlaNWFoOTRmM1h0Sno0MHFwdWd0MFFoL2Nm?=
 =?utf-8?B?VFhXanhXdmZ1NjNCM3I3aWlvTnBBb3J4UUVlaGVDblNvaklXU2l3eXhwdUdk?=
 =?utf-8?B?V2JrYzZOaWlKZDZWeGVqWXlPUDlJa2xRV2gwdWZ5bUp5Y1pTR2tTUGU2WEtn?=
 =?utf-8?B?b05xQU1XOS9Ec2pEbFhZMGRRcFRYNlhGSUhlYUJPS0V1VnBNRUFJSERKTXRG?=
 =?utf-8?B?ekp0T1VKeGxzRW54N1hCc3FyYXVQb3Z2ZkZtTDVVeSt3QlRVRmlJSlZINU1Y?=
 =?utf-8?B?dVZ5U2RKNW0vSEVBN1JaVzVzWEVIQjRpSlVyZExQaUozTkpuQ3ByMTFtZmZz?=
 =?utf-8?B?cyt1OVlkQ0dQSXFRQVp4NG90ekhWTWQvWWVOb0M1ck94aDdNYXNGOG5xWi9x?=
 =?utf-8?B?a05UbEZQYVUyRmVweHhDTnp5VVEvbjNnUjkzOE42aUZVa0NIU0V3enNWb2E4?=
 =?utf-8?B?VmQyaG00eXBCNkZCR3NFdTVkNkxnam9zTzl5a2s3N01ETDhQaTY3c0tlNTZy?=
 =?utf-8?B?T0NlQWNkQVZ2aU9kY2dWVFJlaG5PZ1dNVTNGYlJrOE1ZY3g2aVNmTmlwMWdv?=
 =?utf-8?B?bGZkdjdOV2hub1JPbnNqQTJ6UHFlL3ZOWVAxN296REtveU85a0Z3MjEvTUIy?=
 =?utf-8?B?emVKbDEzaXlkS2ExQkhuMlNjRk80SUtQN1FsQTZVaFZSZ05IWTllbjVWOGZZ?=
 =?utf-8?B?bmVZc3hlcmV1WWxtTTk5RjdNNU56R1ppaDdua1JwRzZRN3JBaGxkK2xISnc2?=
 =?utf-8?B?M2NCYllVNGJ0eWp5bUY0WlpPcDdrb2lRNWRlNzVVSmRKdmRxNFBad3VHR0gw?=
 =?utf-8?B?WDU0L3dYU1dzYVQwRVltdE1TMW05UmkydS83clVGa05qbmp5eGpzaTZaNjgw?=
 =?utf-8?B?MjZQbGl2Zkw2QlA2MTEzVEZrK0NrM1ZxWGM2dzVFL3V3UlZjb1lVSW9WRzR0?=
 =?utf-8?B?T1JtYkFGVTlxRlEwbThYM0hLbjZSWTJoOUt5Ty9xdU9xT0treG5WdzlKVlVI?=
 =?utf-8?B?SlVMWXRQZlBWb1VtZUErc2FyZmFCanhzRWt3UWEwY1VNK2RFZGdreXRFUzRT?=
 =?utf-8?B?dEZnU28vMDM0WGVENkx4d2t1VnhPQ0g4K3R3OWF6Ri9XeU1sZTBUM09WaEJB?=
 =?utf-8?B?WWRFSHNwb2JtUklHaHBzeFladXpuNDlFQy9tU2d2ZU5ZYkMxUFZ5ZUh6RS9R?=
 =?utf-8?B?c3Jmb1dob2ZjK1cwQWZYS0xUNHkvUTNuaWYrYnVVcjJUb2w1U0lCNDlXbmNE?=
 =?utf-8?B?ZXpta3l0RjludHNjanowQWwzNzY1V2NEUlpwQUpjRU4wdUo3Q0wxeExlM0JT?=
 =?utf-8?B?UlR3MXM2WkRwWThjaDF0WXEzYXhHdEhnZjdPcFM5WHB6R0ZqRFdudjBmZEhs?=
 =?utf-8?B?dUZNWkxVWkhxa1k5Q1VZc2dvVzY2WjNqUXY2WFNxUTdwRDJRMndKOHhwR2ZN?=
 =?utf-8?B?VnEzNEVTWHNiK3I0bmxBREhmTTVzRmFtUUljMm1LMlV5c1ZJRm5NRzBRb0ox?=
 =?utf-8?Q?YUkmyzPFFlr4IzT9DzXyOmw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d5d554-7fb3-4cf7-e742-08d9e4b1f4dc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 12:05:21.9660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQPsKjyda7kg7XJB0DQThINIG/X/BK3s2n7Y1zXLUrdmRUJJjGyFJUdBvgDlJ/7XshjtAofU9MXvZmJu1K+2sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3908

On 27.01.2022 17:01, Jane Malalane wrote:
> Introduce a new per-domain creation x86 specific flag to
> select whether hardware assisted virtualization should be used for
> x{2}APIC.
> 
> A per-domain option is added to xl in order to select the usage of
> x{2}APIC hardware assisted vitualization, as well as a global
> configuration option.
> 
> Having all APIC interaction exit to Xen for emulation is slow and can
> induce much overhead. Hardware can speed up x{2}APIC by running APIC
> read/write accesses without taking a VM exit.

This is odd to read for a patch which makes it possible to _turn off_
acceleration. Instead it would be interesting to know what problems
you have encountered making it desirable to have a way to turn this off.

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3342,16 +3342,19 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
>  
>  void vmx_vlapic_msr_changed(struct vcpu *v)
>  {
> -    int virtualize_x2apic_mode;
> +    int virtualize_xapic_mode, virtualize_x2apic_mode;

Please switch to bool as you touch and extend this.

>      struct vlapic *vlapic = vcpu_vlapic(v);
>      unsigned int msr;
>  
> +    virtualize_xapic_mode = ( cpu_has_vmx_virtualize_apic_accesses &&
> +                              v->domain->arch.hvm.assisted_xapic );

Please don't clone the bad use of blanks immediately inside parentheses
here; instead, ...

>      virtualize_x2apic_mode = ( (cpu_has_vmx_apic_reg_virt ||
>                                  cpu_has_vmx_virtual_intr_delivery) &&
> -                               cpu_has_vmx_virtualize_x2apic_mode );
> +                               cpu_has_vmx_virtualize_x2apic_mode &&
> +                               v->domain->arch.hvm.assisted_x2apic );

... since you're touching this anyway, please consider correcting
the style violation here.

However - do you need these expressions anymore? The per-domain fields
can only be set if the respective CPU capabilities exit.

> --- a/xen/arch/x86/include/asm/hvm/domain.h
> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> @@ -117,6 +117,12 @@ struct hvm_domain {
>  
>      bool                   is_s3_suspended;
>  
> +    /* xAPIC hardware assisted emulation. */
> +    bool assisted_xapic;
> +
> +    /* x2APIC hardware assisted emulation. */
> +    bool assisted_x2apic;
> +
>      /* hypervisor intercepted msix table */
>      struct list_head       msixtbl_list;

Please follow how adjacent code pads types / names here.

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1115,7 +1115,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>          if ( !is_hvm_domain(d) || subleaf != 0 )
>              break;
>  
> -        if ( cpu_has_vmx_apic_reg_virt )
> +        if ( cpu_has_vmx_apic_reg_virt &&
> +             v->domain->arch.hvm.assisted_xapic )
>              res->a |= XEN_HVM_CPUID_APIC_ACCESS_VIRT;
>  
>          /*
> @@ -1126,7 +1127,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>           */
>          if ( cpu_has_vmx_virtualize_x2apic_mode &&
>               cpu_has_vmx_apic_reg_virt &&
> -             cpu_has_vmx_virtual_intr_delivery )
> +             cpu_has_vmx_virtual_intr_delivery &&
> +             v->domain->arch.hvm.assisted_x2apic )
>              res->a |= XEN_HVM_CPUID_X2APIC_VIRT;

Same remark as above - can't you now use _just_ the per-domain field?
In this latter of the two cases this would then also mean bringing
the CPU feature checks in line with what vmx_vlapic_msr_changed()
does (as also pointed out for patch 1). Albeit it might be best to
have a prereq patch fixing the issue, which could then be backported.

Jan


