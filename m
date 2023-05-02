Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9D46F3E90
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 09:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528379.821448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptklw-0006hK-OH; Tue, 02 May 2023 07:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528379.821448; Tue, 02 May 2023 07:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptklw-0006df-JL; Tue, 02 May 2023 07:50:04 +0000
Received: by outflank-mailman (input) for mailman id 528379;
 Tue, 02 May 2023 07:50:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptklv-0006KK-9K
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 07:50:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1c08b63-e8bd-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 09:50:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8377.eurprd04.prod.outlook.com (2603:10a6:10:25c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 07:50:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 07:50:00 +0000
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
X-Inumbo-ID: f1c08b63-e8bd-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxgGpEdCxhX8SEPQ22d/9zZfV8TsALWT/TM8iN0kTAkzpMBiS9BcL7exV3exbiYVH1d+4U0U1rn68sIxOxtHGY97K5LxhFeDJ2FVvhgZM/yYGscsFKImsllbqw86gInNBdQW11QNQ6ZGwN6U20GsZ20QAgTa7GVPivYLQHKNqwc99arKuVy+ICSS7fgKBV64yIfpmzHmwiSJ/2xAghhrj7rNeQpMJLWW1qjPN/Zli4tfRhCUfghIMPwafLYOuN6YyEH+XFmi2WIZQGXqazPKsAHYJqr+/nD/1MVUVGnYozRbdAu6mOqWQts0uYfZkUoYe/VF1i48m5ZM++Fvc5ocgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slYW9KRkZUY7iZeaVQfzOkx3O2g9GRcyd0agbY3CAwQ=;
 b=dry7INdnYsNVFGnMPxY12sJLAHSTp++OBkX3gBIgfRaCBlpt3x7oIseGbTx525u2SZuLkmFSq5mv8M0LZsP7lGIT7pleNBld5auNM1To6ewqx0zg1Cg4Dwlpd0YDiShq6x4Lkd9FzX/xP6ua/nXcdp26HOfb0H6AgHO+FCElmDLMSd0Ac7gVtKFx1g7OobifQEeC/2xSyp4V1kMOUfehm+wihdV3EndPxmBsZi1EVF0CrUHW6WrpJRCOOTf2YPaYelaO4mLoBWkIIZMhC9W4GAhpfw3uQ/oHNISESgESTlgmD3HfV9OynqP6KBXpLIrZfVSgzhl3pI4VQBW7uGJy2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slYW9KRkZUY7iZeaVQfzOkx3O2g9GRcyd0agbY3CAwQ=;
 b=2M9zENVKb7XiwhIMqu22II2wIzReOCr3BNOKv0OWMYSMa+N4gDdL6zM6HD0Qtu4WsCevwgYosrNrn0z8eL+BJbjuLUbnhrtb/LFTqep2ZRWahAjm8rEvg38Vtk1vaqYIF4LAM3ZCUcKVupON83I3dXXo9XDa1tNY1m7YMcgC02/a8xpoINgM1YfUHNxsxfitrzh1Si4aY2uWDsWrXbcs3Cr9zL4rSUbLn5PjvQ8RVktDJzrjJbzmclomGvfkN13+Pqq8bgW7dHII42IrIo+jJeiUMQSoLHnAYn+h12cgk6kP/3qfdH6ZRsC4945nhhudetuyKx2EWxh3GP4GJP6XpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ced11c6e-caf7-3a19-92c8-5c11b18952b6@suse.com>
Date: Tue, 2 May 2023 09:50:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1 4/6] pci/arm: Use iommu_add_dt_pci_device() instead of
 arch hook
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230501200305.168058-1-stewart.hildebrand@amd.com>
 <20230501200305.168058-5-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230501200305.168058-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8377:EE_
X-MS-Office365-Filtering-Correlation-Id: 100cf02a-9e75-46d9-dd56-08db4ae1d471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GwzwlViAGMP/4wKofkhTrxVgfxOYFxfwsH1TrXlyY6ezXvenOolS2ggkANjLUMOSGtXdRHo/SeuoXkD2DcMb7UNjlSvOkjR1KAeBLkAFQELcS9C7bcXbt7QeGaHM3Vb8Uhgn4XENow/kbYOaF3iu/fTV45RtwK8CzRbD+6xA6lc6xbqZPHoRFBN+y1g7chl0zslbGRJTjiuloxA5ckdY6uugDCS0fVXOZmeZd27iA4sqdoaRe06EFpxu2NeFiRwhe5xE7ZCI9xjn89qZ16vNp1d6UHmpAnRAeKtJMbZKN1uxOoqHh6fmbJq14F2kunsVXv2/bIVjTfNsApbxrxxvbqXzyunFdeYLvFLw6Ws84W9B2moMm+h3tyGlsCX5wwvn3FnQ2ekK9dZ3CnPrqihK0uYTb+eL2g63Q1YEMyWnJCp4JwhJWwfT8b4TrGh2bbm50cDqzA2QlGsZD4h3jFFg0ZS1AWSVy93hQ4eeZj/KLs0OU3Ud7UKB+EU4w4xFd94Nc153YRlJJGXIr3Vlemea7+C7/9i+9op0FqrgAtRUbbgCnaCvKE8s0UgXTiwAGpmvzUV+mCZtHSJsyHAGia73vgCC/g6F2nS5AoHUje7C6vT50UMhIxUIWr2jEFEavzIqqeKngxwAu7qjYLc1LSmvxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199021)(31686004)(6486002)(54906003)(316002)(4326008)(6916009)(5660300002)(478600001)(36756003)(31696002)(86362001)(41300700001)(66476007)(66556008)(66946007)(26005)(186003)(2616005)(6506007)(38100700002)(2906002)(8676002)(8936002)(6512007)(53546011)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWxTcGxvQWJtbE9SRy9tN0xVUkh3bWt0bjhyRDVLaEUrbUJuVGxrWGV2aDE1?=
 =?utf-8?B?eGR3UzRuSDkrYjFvWlJub1NUUFNXUkpJb0JJSEhtdEhRcDBIek5NZ2FFR09D?=
 =?utf-8?B?SWdlOTZ6Wm5WVFZPajBZMy9xc2pycnVFUDY4NVZjWUF4dk80K3V3MkFjTjdv?=
 =?utf-8?B?T2FSMDFaL09uQmNaRE5ETndEeVUwYVRSQ3hnelpodklBRGJRMGh0SEY0L002?=
 =?utf-8?B?eTRtM2ZaQkNmTTJKYW1mMlpHZEFtSUpXV1ZWV0dySnJjN0xYYU4zVUd1Tk1I?=
 =?utf-8?B?VHk2eUpjTk51Q0QzbVUyY290cDdML21PL1M2MGg4VzRiRll0dm9LckpOeC84?=
 =?utf-8?B?ZUpkeUI4WWFMaEdZVUtvZVV3aDgrNk5URzFCSzdkcjlnZnBwZUNkczl5VWZ0?=
 =?utf-8?B?aXBwYW9HempMVm5vTFJxbnhVK3pOTkErbXlieUQvRXA1ekVNaGFsdUlKbE5a?=
 =?utf-8?B?emZRZlo5NkZCaHl0MWU0aU81MEE2U2tIVlU0bTd5SkxZa2xVdTQ2MFM4SUp1?=
 =?utf-8?B?ZzVWSjhCbng5UXE5c04vNGM0OWpaN1ZBN09aZnhGclBjMXhuK0NldzVCZ0c5?=
 =?utf-8?B?YUs4RWtYNUlHbGpNSGhFQzhLMTlTR3pVblcwVmlJWXM3V1lLS0RvTENkSFpO?=
 =?utf-8?B?Qm9OWVMxQlFzNWxEMkNiUHN3TFl1bUtnN3Z5Z3VPN3kzMDdFWHdqQXRlbHVV?=
 =?utf-8?B?OThUUTJlRnZoZDljTGsrYURxN1pJc0hzWS9LYWRjUk9vaytyblQ2L09OUjRn?=
 =?utf-8?B?Wm0rdVlUelNqck5GQXhYKzVBa1RGOFlQR0VIRXNac3NTQzhmd2pjaXJMQ0Vp?=
 =?utf-8?B?bWtMelQyTStMK05EaFFCQVdNcmFjQ1dkVTd5eE81N016aFU1Z21sMnZZeHJH?=
 =?utf-8?B?eU0wK3dnVjQrdTlpUy9JeHYvNmxjMngwaWNUUFE3RTAwQ25na2JzVGtsaDBS?=
 =?utf-8?B?ZVJWYVNQLzJrazk3UDJRZm9aV3NwTElxWEoraTQrUXJkWnlxa2twcWdSbkZS?=
 =?utf-8?B?NkY0QTVNSlZJNzRsVEJvaCtJS012YnZINk5ha0x4YXF0amlkdUhNK2NoM3Z5?=
 =?utf-8?B?M3JhbXdPMEpWVE5JdGhZbWExdWh1OG1rQTgrMXdYQTd4alJWQnlGc0pCczg2?=
 =?utf-8?B?SUtIM2Y4QmVRSjlOcHhCcmQ1cHFqZDBQL1NtKzVSdE93MEUySXhOb3B4SFhM?=
 =?utf-8?B?T1J4UFpkaWNBSTF5alpYUmVPOXUzUm1KNklNWkV6a3dEWHp5Qk14eWtRSzhz?=
 =?utf-8?B?TE52THN4djl5NVczNXJMdTE5bXUzYURGUmxHTEhGSURrRzBTOVJhTzk3dlNx?=
 =?utf-8?B?d1R4Z0JvOW5MQU9SbE9WTkxSTVRZdVdQZkFyKzNvdzQrK2swZE5RTDBEUTJG?=
 =?utf-8?B?dEhSbW9CQ1dZVklqd21vK3BlUi9JVFd3ZFEzM3FqY2JyckNCZjhrOVAzbjRB?=
 =?utf-8?B?R09jUHVScUlEbWFWUHY4VkFCNUNxQmFHWm0xbmlDNVBQQnNIU0M4K1RTL2Np?=
 =?utf-8?B?MHNlQzEvR3pYa3NGSkdMNGNWWWcwMU1ZSm8wdDl0WGJwYm9KUWZKVmJmV25D?=
 =?utf-8?B?MHVZcGFxb2UvanZ3MVJSMFk5b3hMM1NZMlkrQ2oyZ25CdW5WUk5ZWEdlVHdo?=
 =?utf-8?B?RzZnb2tOUEd3em9nMTRXWTNBeEMvUXdoeFRnR2J3SlBkczZWNkUxYWd6ekhh?=
 =?utf-8?B?VHFPdUticjVuSGI3UVorZUkrWWxJc280STY5WVlpQ05ZbkJ3cjl0SWt1ejgw?=
 =?utf-8?B?ejhMQ0ZUMDhDS0FkZ3Z5TWNXUTB4d1ZZdFd4aUg1MmQ3SDBoNy9nakZDcVZ5?=
 =?utf-8?B?M2RheWV4d0d1L28yVDJ6RzlENGppUUFkMmlKSjNtVFBVZ05pWEhzR2tPNjQ3?=
 =?utf-8?B?dXhKaDlYOEdrYzUvUkJJNEEyVWVVQVVTaGs5ektKUkRUZHBvWnR5aW84Tk94?=
 =?utf-8?B?WTlUanhCY1ZaUmJSeWU0bWFDdElpWHpzY21XL01PWWU3dy9yUXV2Z3RUWXZK?=
 =?utf-8?B?MlAzSmNsN3dTaGtwVFJ2ODBZWUhaQ0FiY1ZHZkVCUWJ6ME52Ky9qR3JzUDNF?=
 =?utf-8?B?ZG5VTEdWWXBobVBkN04zaWF1K1R1RGs0WGpZeE54cXBjcCt0R3d0TjVZYjBy?=
 =?utf-8?Q?HH0wGI/THN9YekrD9Jq7rixmf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 100cf02a-9e75-46d9-dd56-08db4ae1d471
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 07:49:59.8345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7aeOGE8HyfdnjrgsJIy9IKOq3Ey52K4PmNsT41I0sHJjR/f76nib12izew0I7YuZ0Ju20WwLNMIOge6zz3OlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8377

On 01.05.2023 22:03, Stewart Hildebrand wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1305,7 +1305,7 @@ __initcall(setup_dump_pcidevs);
>  
>  static int iommu_add_device(struct pci_dev *pdev)
>  {
> -    const struct domain_iommu *hd;
> +    const struct domain_iommu *hd __maybe_unused;
>      int rc;
>      unsigned int devfn = pdev->devfn;
>  
> @@ -1318,17 +1318,30 @@ static int iommu_add_device(struct pci_dev *pdev)
>      if ( !is_iommu_enabled(pdev->domain) )
>          return 0;
>  
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +    rc = iommu_add_dt_pci_device(devfn, pdev);
> +#else
>      rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
> -    if ( rc || !pdev->phantom_stride )
> +#endif
> +    if ( rc < 0 || !pdev->phantom_stride )
> +    {
> +        if ( rc < 0 )
> +            printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
> +                   &pdev->sbdf, rc);
>          return rc;
> +    }
>  
>      for ( ; ; )
>      {
>          devfn += pdev->phantom_stride;
>          if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
>              return 0;
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +        rc = iommu_add_dt_pci_device(devfn, pdev);
> +#else
>          rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
> -        if ( rc )
> +#endif
> +        if ( rc < 0 )
>              printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
>                     &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
>      }

Such #ifdef-ary may be okay at the call site(s), but replacing a per-
IOMMU hook with a system-wide DT function here looks wrong to me. The
!= 0 => < 0 changes also would want, after respective auditing,
clarifying that they're indeed no functional change to existing code.

Jan

