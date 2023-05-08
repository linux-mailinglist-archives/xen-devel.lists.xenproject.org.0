Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AECC6FB344
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 16:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531608.827388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw2DE-0002SU-HB; Mon, 08 May 2023 14:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531608.827388; Mon, 08 May 2023 14:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw2DE-0002Pu-Dj; Mon, 08 May 2023 14:51:40 +0000
Received: by outflank-mailman (input) for mailman id 531608;
 Mon, 08 May 2023 14:51:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pw2DC-0002Po-AL
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 14:51:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d50847cd-edaf-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 16:51:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9635.eurprd04.prod.outlook.com (2603:10a6:10:31f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 14:51:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 14:51:34 +0000
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
X-Inumbo-ID: d50847cd-edaf-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddRfcf6ZrdbL89IckrwLHwNf4gq+xT8+OrlUqAMslMuoKDAbufhocNJEIBql/DP9kJePRcf2KeY2vsLv4rs2cgu2kMcadU+SX+Wn9YkvSJuMZiAyWIR8QJEk19Eo8l0IH9+9AP2dtQpuWbjPa+GUVJ62zEE/QaqdC+d78dZ7m/kp8/VvWhxUae908YBC22aN4N3hlB/fyQZoFiF034kp3+xduoP42EvpIjZyFQKEM2IXHy+UTkyjs/L+9MY3dbPquBk4aiYz50FK91c80kbpZdByMVUQa5UMJzrj3s9TAoGesVMuz7vdytc0EGvwBJec9kDN0ERgViMIBxTNBoVCWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAGXXn/fj1TWLxwadDhIw8IrxVrgzziidtcjMLL+RBw=;
 b=BcR2QKbQIpMeYYsxPbH37dSzdQ/Z+1WsV+84J3H6o78QmGxutnKhaq2WHb/N6jVy9Y4sJ9vvai0B+o3Z0ILDjcKawUJqlYx9jxz/q+MXZL/c31rlY7V/c2i+x257lTey6jlcT2GFJF5HkxlBtQ4fT6NYvXHNpXPj5B/jUpmmBgKZJL7DQ00U7sGw4Db2ElLfmEcZkzUNhaPSXtxk8HyGV7fJ5nyrUgq6veWYwRn105OeBWQpzVaQEbMkgX0LGeU1Lm/HllW4GJZdE6iD6hbmEeKTb60gbUOvzhL7Afzquusgc3UvKtNtIYelPZjG/fMoAk74KttQSnQLWqtC/50xuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAGXXn/fj1TWLxwadDhIw8IrxVrgzziidtcjMLL+RBw=;
 b=5NWz4z/+IeeKkXBUTncI8qa/5u3guiE76Mmp5DPOlwNYLHjinIEt/IPDU+DqdXizzwAVhEQyspOrMMfdKghHiHLGnlluYWaBx8tV6VsYoOMWVCv5IHxhkgb4RK/KohAQwNLPpOBhV8W1TXjWxi+IDFhJl2BnPW0EbfmcNh+WoA6VaEclV/G6licaJQtZz4GfarqtfJcemapmRQLuEcwLZaXxhp/19pzZ+6bLK1I/6YavJBFuLYkiuWFzmoZGOWs5LwWJpO+WsVbpPvX4JfQjDiQwjhrDV+Xni2oVgZf0Ik77PulcCcZq3ocQ3WQZOTmC5N3z4MdaAMEG4+U5FoKPKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <462657d4-72e7-6266-6ea5-2b9e443f9813@suse.com>
Date: Mon, 8 May 2023 16:51:32 +0200
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
 <ced11c6e-caf7-3a19-92c8-5c11b18952b6@suse.com>
 <8591236e-5dc2-7da7-fe3a-7cb2ae1ed7d0@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8591236e-5dc2-7da7-fe3a-7cb2ae1ed7d0@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9635:EE_
X-MS-Office365-Filtering-Correlation-Id: c8354ee9-00bc-41b4-67d0-08db4fd3b783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KhLzzCuRodTH+oRcoAAo4O3kcR4dBB2lmRIVmPr8c2RIuJz4HrkYsmauHztugOIQzpjSFlC58QCJyJ+vZuVsu7LUHILhnl2jN+iS+Z72zRpHhRLnsW2G0agXsqwpjA6TmnbtTlUdRd6E1zC4Jm5TB5P5OqsMlKsRXEG0hHCvFDW0mR31hqdih82SpqNFuty4wGtcNuOIOkb6eFWtJBhMYdnvaaBfjTfU8N+mxErG6TMDHbsafBWvtsmNOL0q9HBHnInYjpT4sasNAJJEffPdiDS54UjsBtoLSyTQcYSBacKWZ7yQK50rArhkIusm003jmhWDA6PnvBsym/r34EetpoRfbOMxhtCwbIZd0kd71MGSjRaZ14OMuV0XCsL1pSdqvT+9MwhxXOyz+sLviZA3sYrbmDsxEpqG+InjrTx46ZS/zMOrDAmhN/lmX2FWMjFrWsjI72Da/h9+xI+BCcFeWoMAQODC4h3VfTtrxdcpkX3dD78yvM6bo6olqh9DFgI92PlGrzyKlBy3urVKPPnLcqpUXIH/FTj65a12MsdkOnPQ4IUQJhZaE24vo7go/jNnAZkgPDPYQIU/4D2xf6aEbk7jsUuxBYpnHVoymJ2iTAxODLB0uxDFfpvfU0xplwY0W3F0Fn0Kw7N7IZ1h/1+gUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199021)(6486002)(36756003)(66476007)(4326008)(6916009)(66556008)(66946007)(54906003)(2906002)(31696002)(86362001)(41300700001)(316002)(5660300002)(8936002)(8676002)(38100700002)(478600001)(186003)(53546011)(26005)(6506007)(6512007)(83380400001)(31686004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzB2NHpHSlVYdllXbkpRVjNpZmsrbnovdVo2S3ZDZkFveE12dS9HMGZpeVhj?=
 =?utf-8?B?U2ZpdTRrVk1FVmJ2NUNFL2Jmc3BpeTRRUVhJTEF5UTZacndjK01UbXlhUUFO?=
 =?utf-8?B?WnZLeTFqL1QyRDFkRnRzRnlGbmlueTlzd0VjRkgyaFlwTFRqd1dZNkp1NE5a?=
 =?utf-8?B?VisvblB1ekkxSWJYdThTYjRuNE91dmhnQWx6OElTeUplQy9mUndzQUNWbWJR?=
 =?utf-8?B?eCtic2dJZXlWM1JkWFNFOEVNVEJqU00rMlV2Qy9FMTEreWpibmt3K3VHVWZ4?=
 =?utf-8?B?cStxTDVQS24wams2VEdvOTFDYzVtNnVjUWg5c0lUVlRoUThLcXVjNFFmOWo0?=
 =?utf-8?B?bFBGVFdZVWNreUFEa285enJGcEFzVTdLNTVoKzNuc1MwQzVlWXBDUzJQZmFC?=
 =?utf-8?B?S3kzdXlGTUZ5WlVDK2cvZDg2dmJPZndiV3lseklrcDBkQkdrU0hFNWdCSkNx?=
 =?utf-8?B?Nld5SUk1N2p1b0xOLzZNdlNDTnlNZDFhSGcwU0tUTFFveURwTEZESTJqVGl4?=
 =?utf-8?B?eTJ2QUlaSytKTmpsSkMvejlGSEdzUXZqd1ZlZ3hkSXhyZDdLeklvdHR5TUFw?=
 =?utf-8?B?SUZIalVycUsrOUcyR09YOFlpMGhiMldlQlpLUTlyd2lnUXdRbWF5bi82TzR5?=
 =?utf-8?B?alJ0K3gvOGhnNGFwMk1mQkRkR0NSMS9LV0tGZDQzRGFSNW5lWUUrejRMRkxm?=
 =?utf-8?B?K0JWUmFreE1rc3NLV3c2NTVDQ25OdTNCZU04ODNMazVwRnJqcVNPS0Yyb3Qr?=
 =?utf-8?B?YTJsL3dZUURWU1AwWnRnM2M4V0JnRnhOcytZdnJuaGNLN1hPSnRmYVh1cDh4?=
 =?utf-8?B?bURDQjJsRktQcitMNlUrUlhiSGdLcXRsZ3BZQngvLzJCN1Yzb1g3alRrbUQw?=
 =?utf-8?B?UjdHQThUUVJ2UDFjK3BKR3grSEx3bm9HQzJCazFvZzdNTTExWTQwdHE3U3Fk?=
 =?utf-8?B?QW5QRTNIVU9VanFVVTF5ZUNmenVHbHVhRHlndHc4b1E0U3BPVUpxWjJYM3F3?=
 =?utf-8?B?dXEzbDRENTNXRlBVVXNpeklveSsyaFRqeVk2L0l3Wk9Kc0tWREpKS2d0cUV3?=
 =?utf-8?B?OEFOOFhmTmVCelZLamZzSWozNHdsN25DaW5zeTB1R0dYQjAzaWxmZHdtdDJu?=
 =?utf-8?B?dlRlemVPOUFSS2syUjlQVVRKZk4wa3cxeGJnMTd0YzdzSmRTSGt4Y3o2c3hM?=
 =?utf-8?B?dEVmOXk4Sm9GcmhaMHNITm1FSVNoMzh5OWU0U2grTHkzdmhOMkxhZ1BkcHBn?=
 =?utf-8?B?UDJWOFZSbVppMWNrRFhoK2I5R05RUFRqYlllMmVSSUY3bjliWGVyU0tJcVht?=
 =?utf-8?B?anpZbktjTCtsVHV4T3VSRHpzcW16U2FBVWVDWklFUTRtV2szTVI0L2dhT2pU?=
 =?utf-8?B?MmpnL1piaE5SOHl4QklWNlN6aGhWWUgycDZBTWYvYno1d0VhYlc3VTFFb25V?=
 =?utf-8?B?a0hzTHVwbElFTWV6MGFwaFZFNkpsQjRPTVZMdUxZWWJuTmladEd0Y0REbDVG?=
 =?utf-8?B?blFqekxnaWpSWWVVYUNoR3hHc0xEV0ZQWHNwcEpHekt6RlpORStkMlNoeDZt?=
 =?utf-8?B?UStyelRBTFd3SDcxSzVzQlVPb1RVQ2pTbjFVNXFaUXhBanQwVEZ2TTV5SEtQ?=
 =?utf-8?B?N0R3Q3VDU3NMbTNEUyt4cWVGaGR6bEE3dk1MMUlrbWs4Wk92WXNma1hKaUli?=
 =?utf-8?B?ZjFyTkhEazJBaUFabjRuUy8rNituSjJyTnBkYXRXd014Q0F3Tm9vRFZlZitU?=
 =?utf-8?B?TWhaNjFwMTFQMHRSa1pPd1JQRnZDYWtnejZlbFVFVFpzM1lCUnJQeDYxVTBj?=
 =?utf-8?B?Tnh3Wm5UaXZ3VnErbjJ6QmlxRVptUlBDWmVrcUpheEpjeXNLZk1uU3ZOc1Uy?=
 =?utf-8?B?T20zR1FCVXRYRnBMSXEzSmVOWmJRU3NNd203MEp2MTNIVFBOWVF6eTZhSzBt?=
 =?utf-8?B?TFlVWnZUdkU4ejRHWVFEZmR2YWJEdTA0eGgvdHRJdTZ2bmszS0k1bFdpMHJD?=
 =?utf-8?B?cTZjWTlBeEgwaTVuYXhLakpVMWRpTC91VmJZRXVvY3V4K2hPSGsxdkduNjNh?=
 =?utf-8?B?TGV0ZVMvRnFtMkdKenYvc0FaM01hUEpkYy9zUWVIQXRnbFVIanpaOEllSXpD?=
 =?utf-8?Q?RNxKgQF6dPl+zx5C7uy6jzmxV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8354ee9-00bc-41b4-67d0-08db4fd3b783
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 14:51:34.1122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUN+gU34u+P+vV39s7VwJGf5HbDhnU+lezm+p91NKNaVymutdTA5uYUIHx2K5KA4hAImD+8z7oBUD3Jhy+sxuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9635

On 08.05.2023 16:16, Stewart Hildebrand wrote:
> On 5/2/23 03:50, Jan Beulich wrote:
>> On 01.05.2023 22:03, Stewart Hildebrand wrote:
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -1305,7 +1305,7 @@ __initcall(setup_dump_pcidevs);
>>>
>>>  static int iommu_add_device(struct pci_dev *pdev)
>>>  {
>>> -    const struct domain_iommu *hd;
>>> +    const struct domain_iommu *hd __maybe_unused;
>>>      int rc;
>>>      unsigned int devfn = pdev->devfn;
>>>
>>> @@ -1318,17 +1318,30 @@ static int iommu_add_device(struct pci_dev *pdev)
>>>      if ( !is_iommu_enabled(pdev->domain) )
>>>          return 0;
>>>
>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>> +    rc = iommu_add_dt_pci_device(devfn, pdev);
>>> +#else
>>>      rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
>>> -    if ( rc || !pdev->phantom_stride )
>>> +#endif
>>> +    if ( rc < 0 || !pdev->phantom_stride )
>>> +    {
>>> +        if ( rc < 0 )
>>> +            printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
>>> +                   &pdev->sbdf, rc);
>>>          return rc;
>>> +    }
>>>
>>>      for ( ; ; )
>>>      {
>>>          devfn += pdev->phantom_stride;
>>>          if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
>>>              return 0;
>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>> +        rc = iommu_add_dt_pci_device(devfn, pdev);
>>> +#else
>>>          rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
>>> -        if ( rc )
>>> +#endif
>>> +        if ( rc < 0 )
>>>              printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
>>>                     &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
>>>      }
>>
>> Such #ifdef-ary may be okay at the call site(s), but replacing a per-
>> IOMMU hook with a system-wide DT function here looks wrong to me.
> 
> Perhaps a better approach would be to rely on the existing iommu add_device call.
> 
> This might look something like:
> 
> #ifdef CONFIG_HAS_DEVICE_TREE
>     rc = iommu_add_dt_pci_device(pdev);
>     if ( !rc ) /* or rc >= 0, or something... */
> #endif
>         rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
> 
> There would be no need to call iommu_add_dt_pci_device() in the loop iterating over phantom functions, as I will handle those inside iommu_add_dt_pci_device() in v2.

But that still leaves #ifdef-ary inside the function. If for whatever reason
the hd->platform_ops hook isn't suitable (which I still don't understand),
then - as said - I'd view such #ifdef as possibly okay at the call site of
iommu_add_device(), but not inside.

Jan

