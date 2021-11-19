Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 570DB456E8D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 12:59:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227804.394098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo2X2-0008HE-9t; Fri, 19 Nov 2021 11:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227804.394098; Fri, 19 Nov 2021 11:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo2X2-0008F9-60; Fri, 19 Nov 2021 11:58:16 +0000
Received: by outflank-mailman (input) for mailman id 227804;
 Fri, 19 Nov 2021 11:58:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo2Wz-0008F0-JB
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 11:58:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7734d6b-492f-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 12:58:10 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-qPyhFUTfN9mAwBYlmQJL9Q-1; Fri, 19 Nov 2021 12:58:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3296.eurprd04.prod.outlook.com (2603:10a6:802:7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 11:58:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 11:58:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P189CA0015.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.21 via Frontend Transport; Fri, 19 Nov 2021 11:58:04 +0000
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
X-Inumbo-ID: f7734d6b-492f-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637323090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OnxwPg/++goKGzMmDDWyY9/y7Wpa8VYYcVLQy16C55g=;
	b=GP8hqNLzyuXzcYrN7VHj6bOU/B1y6SPt6CWxnsvXSei7Bj3mnhAPdf1dsjLT3L1+hxQtyH
	8O6owPcTGDk3JO+lYfseckmMvTK0ho3Tr7lCBwcN0SuctesZLxQBy/+qgqCNr+fty81NWt
	wZ049bq/Hd3OJ5iU7EyjL/8o4grIido=
X-MC-Unique: qPyhFUTfN9mAwBYlmQJL9Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnXMVZWrtufPfNug0g16+bV5/CKB27VYfwP3w6KenuXWPj4pflNQK2Uss0IPNG7AhTVtpT6uexf+/zMB92agTipZyT6qlZSLYZ7AJW0rFodL5t3kbXM6bXTBe6qBJYqWgiPG5gufpGXHvMxgZIf7wmL//NHp9WRPKxo8FDU4qX0aQnguFb6RV+kB3A0cDWkYdEaOLEfbaf0u7qav3TT582sOMk9oO0+4CR1QYku4akxJ8Dg2JFPFT5vy0yq8lWB7LxfyqMg8WCDE3v26JmrGGAD/LyRGrMMPq4D2xbwIkZRj5y4Nc5KQCKMbI0d7Kdspyr1iawewoa6MUhV2mWt1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnxwPg/++goKGzMmDDWyY9/y7Wpa8VYYcVLQy16C55g=;
 b=BRNGpmO8Bs7esjXpWy59Mx50VHuz6/RtS//6e32BcbQ0Fchiww+xf70+0M+PrFXj/M0+bYuHrWnlZdwJ+BYr4PP031uA9r4cua0tSdDJF89B4+bp9g+8/kIqImKFXl/tNFD/UH+bu5xzhkgf6y58k5lRv2rm8Lu0Fy/3t5vdh2Q1BPham6cZPbuousZL2dR8nMaBf2DNb0s2K8PRQFu8nuS1P4IfpazvD749DltgGw9Jb894yXWXssHUQx7G27o3e6wa6OKErX7Ha/Nr2Y3BMsibBNpR0Dbo1txXEyCh3Ve6Nrb0I+fnyt2f9vWNH0iVfcx1nuVsfd5/FuUewE3d/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6aa1a947-cfc8-ec05-e5a5-151d36fc432c@suse.com>
Date: Fri, 19 Nov 2021 12:58:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 05/11] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-6-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105065629.940943-6-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0015.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55659dff-e5a1-4ad6-cf7d-08d9ab53d8ed
X-MS-TrafficTypeDiagnostic: VI1PR04MB3296:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32967672C91160D9923944F0B39C9@VI1PR04MB3296.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EmpCDg+OdKb18Qly9DzRroj/naSQzMtDwimm2rJytCyqj+qnz7HQNAqEwRSwJjjaOor2Exm0aLH/0yAdA7MDoh7aKE2cGWIdJ0zzv2wPhhmj1R4YppzghsLsjdu8kxxtOzvoUcbLl4MW/CUQ3ZuZmUxBBRkkDGCBYebMfGu8gJC1Apb3JYxbGb6GdTHRuZaCnvook6jm+gRmf5ROwKPcteC9Q4xD4s6+xILSUJO4ZXUN69RdDBF1y3/ZzqC9r8PV3i+eQ/zMixzirgZDIIOXNy+/Jpf1k71EEPZOzh6PgjsruWbdpuRDR9xdDwgTkm0o9QrEmz74BMvUFHyKZlrIaPQnJ9S3WmrW+nQ6O3gWoKq/PoAYX3GSZ7cmaxFIZ1d3Lfm51wz6ur56LnuDvrL47r1hEujGuc/K/qn8nbvZAOPva0GFE9ntWSom32Y7Ah2xi7Vf6qhei5xdCf7MVeZbxFA+Y5GKEk4KWvwAECxXYHhyPOPtnDwbbMTyLlxo0wqpUzStbA5Z5nnXBRX/gu2HEId3KIHSiO7KhLedd5YHgfoSRd5h51nlKacgCB9uVgr6ZpjhdbJgtr1rbEAfBohQ5gi2xKrWr9ts+4Ca1zlQUHlpeQ22srr3QRQvtBAwP8wT2PwJgGMZrkP+2+32k5u6Lj6l5NbgmrC4JQ8MOzsVBrdKRPNKUC9bztoqfHEKH4NcFSn36GyE0KuURZxwSk1AI/fo99xM4l5BChlCa4rz0VkBGXlYjS4Qq6PBMK1a2iw4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(956004)(5660300002)(6916009)(66946007)(316002)(4326008)(16576012)(26005)(6486002)(8936002)(186003)(36756003)(508600001)(31696002)(38100700002)(66476007)(66556008)(83380400001)(86362001)(31686004)(8676002)(53546011)(7416002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG9IcHhSRmsxUXRQRnhUWkJkYkFWWEJiV2QzamNFVkRCQWYxaXNVNjNHNTFP?=
 =?utf-8?B?d3FKWjdUM2QvdlNUcjZKRWM1RmZOTEc1UGRwWW1lT2NKeUhvOUtUWjFHczAw?=
 =?utf-8?B?d0ZrUlBNL3lnYk9Db3R0aFI5QUNseGREbFJvdnZUVG1MdUYzY1RpSnZ0NCtv?=
 =?utf-8?B?OS8vaEZKSFFScDJQY0ZMZU9QbzlsQndqaSt1M1VIYXVZbmNsMTNmVXpLdm8z?=
 =?utf-8?B?c1YvLzl4VnBOdDl3QVNtb09aS0MyWWVUYkppUFB1QWF1RnBuMXkyTWh3L3dJ?=
 =?utf-8?B?K0N1eVB0aDlYaVNFbmduSktROEcvN3JuQzhmNnlQTzJSbVNnaThrdU1TMDMw?=
 =?utf-8?B?eUVlU044QWxYRXdsb1dFa0poMnZydSsrVHJpbFU0a0NJK0lhbDJlNmVjMUtS?=
 =?utf-8?B?NmNIcWhYRk1nQzFiMFRqU0wyQVMxK01sRS8zVS9NbTFNU1hMS0tjOGhacllk?=
 =?utf-8?B?bkZGcVAvRnhrcXRVeXZ1Rmg0TUg4Q1BrNXlrKy9YWXhzcDQzWHFvWld4RWdI?=
 =?utf-8?B?clJ2RWFkbXpOdnBKelUyWUFXSTRZKyswU0RralhsTXRtSTVzR0NOMUs3dzFn?=
 =?utf-8?B?SjliMGYyUW5TQTFSdlA1SEpJU1dpOHBDeVlLbHhEQ1hJdFZKVjdibWdCbzhP?=
 =?utf-8?B?dVo2cURpQlVnamU2dmt2WlBoMjhrVnlnSDlscjdieFRtRWdyTjMwUDVsaU9o?=
 =?utf-8?B?cHhIU0lIRlVhbkYxUjZsM3VlbFFpTXNmd3ArcnJXTEt5KzZYRFBES2JFL3dC?=
 =?utf-8?B?SC9iaWh5UzBVbkx5L255WU9nRnVQTC9XaGFLeFh2Ry9EYXozMXU5TTdFZk5T?=
 =?utf-8?B?QXQ3djBoQ1ZDa0hDU2lFNEgrbzVicnBJaE5wODNFeFhTN0ZxR1BpR3dVZVRI?=
 =?utf-8?B?dE5UYWR0bGkyem95WlJsY013WUM0cGF4MkEzQWl5QW8yZnNlSXVhSHFDeTF0?=
 =?utf-8?B?VjIrRmp0bFlXaW5QbWJRazdkTjhuRWFrdnY5aG5UYjhzclZ6eWtuWmFPSnFS?=
 =?utf-8?B?M1E3bWJDd245Qnc1MDBoVlUzWnY2dGIyVzVoUjJMd05LdFNNazBYdHNDY2Qw?=
 =?utf-8?B?RWg5WkZCSE9VWEtXZDZ1UTNiTnF5NGZiOEFNOTBFRlJDbTFUYjNPNmVKN2Zh?=
 =?utf-8?B?V2JsaHQwS2s4dlNjdG9DUnByQ1MrNU5qcjFjUHdHeEw5a0RNVmpBS295TnB1?=
 =?utf-8?B?ZTVmMFAwTXpnSzU1U2RDdVBja2o4dTBOV0c0ajl4UVc4RTdQR3JnbHRqQnd3?=
 =?utf-8?B?d3N2bXB1d2ExWEN0cVllYkZIdjlscGFpSzB0QmVVWlIyOGs0aG9ndGtxOHJ3?=
 =?utf-8?B?Z1k3U1NOWXRJWWVBNUVZNjVPdStJNmViOXp3UWlmZU1iWXR1MlZxSmVvWThh?=
 =?utf-8?B?ekkvTllZTnlyelBuNnRLaStTanU2SzZ4bG82VWUyN3lYOUhsUHg2UDNTZDF1?=
 =?utf-8?B?V1B0MFdHTU14ODJQc3NQejVrcnpCK0QzNytLSk1uZC9UWHBEZ0RLb0RzV1VU?=
 =?utf-8?B?VGd0QkhnTkdGZ2JLOHdyTG9jMm56bVJYaHB0MWQwZXA3dEJRZys4UlZselhY?=
 =?utf-8?B?T3RDWm5Sdno0M3c4UFFncjVzY1BFSlNkQnRxTmhXM0lQY0t4bFJSdm96WnE0?=
 =?utf-8?B?cVlINTVpZkdZMFNVNmVJa3hOR2JkQ0ZJNDU3SEQ3YXBod0FYY0loUlFXRy90?=
 =?utf-8?B?L3V1dTdOc2FkNGd3SjNNb0lSTDFVZVZyQUxlWHVDLzlDRG85MTlwb3FTKzVS?=
 =?utf-8?B?alRsWUk3R3lVWFg1S3pLdEFudThGRHNYQ2NleUVMYTczUHNxVkxzTUkwQlBa?=
 =?utf-8?B?a2Q4UThwYVdDcllvaCsyL0IxK1NrNVhjMDFCdzJiRytmWng5R2wxdEl5cXRi?=
 =?utf-8?B?OEZpRjNPZ20xZnZMUGZpYStLVUpKY0k0SzFxOTVFcDVtSXBXNy94L3JqUEZl?=
 =?utf-8?B?bUdrSWV3dE9zbm5RODZyWTI4dFpXMHZHTjB6RnlpRWdNYXpOejMvVE5mSjAw?=
 =?utf-8?B?bXMyeVBZQ05BWEliUmVnYWY3QlVBUDZHSVBIdTlYcUVMQXgxTk10ZDRTMVly?=
 =?utf-8?B?K3MrS1FCRTFjSnJycmpwdjZHU3hxUW8wby9USTNtbk5EMVIyMldkTU1rR3pj?=
 =?utf-8?B?QWFka3ZKMVZGQ0lHZUZ6djBiSWhrckFiTG9LNkRKbFRQeExoaVlCNW5YR1NB?=
 =?utf-8?Q?IHxD8zIaemzkC6c5dfz4jCg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55659dff-e5a1-4ad6-cf7d-08d9ab53d8ed
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 11:58:06.1074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1pkAPe7GZzDeu05zmdaqU50FLjKkgdpQVho0UWQSQ/EtHOpoZBNZ2TKA4vdyotS55ORLm1d1Th9pKYWrbpV7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3296

On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add relevant vpci register handlers when assigning PCI device to a domain
> and remove those when de-assigning. This allows having different
> handlers for different domains, e.g. hwdom and other guests.
> 
> Emulate guest BAR register values: this allows creating a guest view
> of the registers and emulates size and properties probe as it is done
> during PCI device enumeration by the guest.
> 
> ROM BAR is only handled for the hardware domain and for guest domains
> there is a stub: at the moment PCI expansion ROM is x86 only, so it
> might not be used by other architectures without emulating x86. Other
> use-cases may include using that expansion ROM before Xen boots, hence
> no emulation is needed in Xen itself. Or when a guest wants to use the
> ROM code which seems to be rare.

At least in the initial days of EFI there was the concept of EFI byte
code, for ROM code to be compiled to such that it would be arch-
independent. While I don't mean this to be an argument against leaving
out ROM BAR handling for now, this may want mentioning here to avoid
giving the impression that it's only x86 which might be affected by
this deliberate omission.

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -408,6 +408,48 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>      pci_conf_write32(pdev->sbdf, reg, val);
>  }
>  
> +static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
> +                            uint32_t val, void *data)
> +{
> +    struct vpci_bar *bar = data;
> +    bool hi = false;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi = true;
> +    }
> +    else
> +    {
> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
> +        val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
> +                                           : PCI_BASE_ADDRESS_MEM_TYPE_64;
> +        val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
> +    }
> +
> +    bar->guest_addr &= ~(0xffffffffull << (hi ? 32 : 0));
> +    bar->guest_addr |= (uint64_t)val << (hi ? 32 : 0);
> +
> +    bar->guest_addr &= ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
> +}
> +
> +static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int reg,
> +                               void *data)
> +{
> +    const struct vpci_bar *bar = data;
> +    bool hi = false;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi = true;
> +    }
> +
> +    return bar->guest_addr >> (hi ? 32 : 0);

I'm afraid "guest_addr" then isn't the best name; maybe "guest_val"?
This would make more obvious that there is a meaningful difference
from "addr" besides the guest vs host aspect.

Jan


