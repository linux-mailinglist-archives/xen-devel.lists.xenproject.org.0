Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FAA6B9A86
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 17:02:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509731.786074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc76p-0001xU-OG; Tue, 14 Mar 2023 16:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509731.786074; Tue, 14 Mar 2023 16:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc76p-0001vS-KG; Tue, 14 Mar 2023 16:02:43 +0000
Received: by outflank-mailman (input) for mailman id 509731;
 Tue, 14 Mar 2023 16:02:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc76o-0001vK-Rc
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 16:02:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5558545-c281-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 17:02:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 16:02:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 16:02:38 +0000
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
X-Inumbo-ID: a5558545-c281-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYQKf3oPH3N3O29qnBda0nFgl6h+UCM9LWbC1ZOWUbOB3E3mGE8HLHDsXwQUCohbISecrup8AXPtu5gyHtKO8Tx3ZBMUi64cx5BjdtVB9Jtj9hWEa0Oo5BBKWLxFYBxjjKpja3SjdyY9n4L7qgN7/cIFFSfemn2YO1zhXZNrSIzpZWXRvf4WsrerUBQAV3AHzN6LNyw2/CWAqddPzxxhUsetK7/TwBnmE7rbhls/H3t8px5EwoBUdGtsriRYRHogQlIicbSha9fIivc7v4ShDLRYdXwiizRf7ncq2squKShoSl/pwUC1nOqjqhQ18kjgbYmQmeaQ7Fmxpa7wPCnq6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yV6FeKxjKGLBUI2qeemyWufcRSU0liDhLszqRzIDsa8=;
 b=BrnaDP+ABDSrRFIc6gMmI6RJz05iWFMetcj2gRHwrvbfqE2pTtgKoEHzhQ4fse75MU2J29+NeN8XJNH2vb5pitbZtDLfNM/gAJidp9mv2rxyl8BBi09TDuow4UNm6X9oMo2GwqvJO3X6+KpXRYZ8FP0TJrWRq5jx7n1XFqUCqhCbkoNxcq3ULBjq7YD7+s+MpE2767DClNEYzP3M1OZUam6GJybDXREhd/vsxlrbgAgPUzQJbUExxcWxC4ndn9YSO6JGgkse+OSkhzBBHpnLqmRF/ccf7GOG5t1OUEIpzHouLkR6ApYMHuwOdY6XHx2a9P77/5YV4QTe/lJ44EviYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yV6FeKxjKGLBUI2qeemyWufcRSU0liDhLszqRzIDsa8=;
 b=o+Ter8rs54LOm5lxjwGPwM+TaR0iLAOCROFDiF6M79fZ+jvm93HjbkmRzIxjUbkYtJLLTXBwa4L7FWqDOPL6TPj5cHqesD+0OlAi1ZlDPuJh5+GWq6k6F1jNImtbLepFhNOAabkfMQzsu3GS7xxW3+uPnH3GqeFoc5orJ7fY5bE1ytDSwj+ZjhZPesTryZveebCZrvXUmjK8LeRZdaiHCbD0xBv9esm2Rnk/KZA6gKkto8tUXjYdcn+bLZOMgwXTyP1/OWDRL4ecsXVQyHD2K/JU3KF+jlf1T5c2IQCa8BvzMFVxhUqmmrR7PPJc7fHQuRbfkP09J8+piMy3A7Fq7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com>
Date: Tue, 14 Mar 2023 17:02:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230312075455.450187-3-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fae28e9-cfe0-4b59-9e5f-08db24a58864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zz9ghgmlfLIEeMSn3w7MyDCBLIIr1MUDrilwT/PZ0BWVkzTcofKeg6cZORYxp4uhW47YF/YK8Or9wRAQW/YMBguFmJGNZgFTVm0p1c/DntrU2qfq1dqQqmFWJ/ZKvRmcgPQyaAzfNE5tYdgP3gkZvRglVYGyOKO6d29rb7NTDRl5kaZUwSTKUruaF0Ct+FIAZQB3u3b2kArDRY8AUZWRYeLQ+UVCSGC5UCCjmCOF/eFXkFBu8PEOUFIQsK5LPkgqqh+c5eGmLEf1//ScEUd2uwsNw7EsvEuFA88QBrReXgXQDMu7s1ylK1Ml+KsHJHUhuCUqDKEnWs/teLbR6ar/ka9bxwRq9M6cHPRBrUDqU6i1LmRHgetMzJpWO/B980NTMhlgRzusgOXSXg8SK4JzRtY6Ral8vEjCqND4n/83qXzV5C0lwDI255fWDBSJOvHedLtCMlyj/EJGZzJn0sKlf5OoMBjr8XRT4sW6FeBKbXhh+WhD9q40tp5rzeKMe79pdV4KZE1PWGRGwUJlWiXCIuCmiBzqC81Lp8t/QOwbpWZnCbLquE5pP1Z43CKcRtXGNPY10uCanA2masJ2M1S+ZzVgnaKW+AVXY3p4xGTJ8tTm29V6T5i/cFaRgBKd4xperILtL7LFyewojE7upvNHVZdp1eJSZwySs+2FjaIRbi8ePpqs+2hNFjEU2Q/IjekBpmXVw1tpTIt6WEQonK5IJqrjnqqexPIeA6G8OP9XPJE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199018)(8936002)(7416002)(5660300002)(41300700001)(4326008)(6916009)(8676002)(36756003)(31696002)(86362001)(2906002)(6666004)(6486002)(38100700002)(83380400001)(478600001)(186003)(26005)(31686004)(6506007)(2616005)(53546011)(6512007)(54906003)(316002)(66476007)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXBqS091d2srYXNXRlA4cmtZeFNTbU5nL1J3d0FRT29XaWNoZUFhVi9WQlhy?=
 =?utf-8?B?WG9ZckhJcTRvdW1JeGk0aG8xTEJsUWdVbWsrWkoxckZmaE5IU09Kdmpvei9J?=
 =?utf-8?B?THJoQnd2eGFKRDkzTnVxRk0vMjBuWDV4cW82SGx2MkZ5SjBBSUpqUXdLUkJt?=
 =?utf-8?B?K2NpaWRNeDV2ckkrblVmVW42SHdKamJqTnhtTnhPVjhrcFVKSjFCUjFrR0lx?=
 =?utf-8?B?MTBXMlR5UUgzL2RGaFVJNWR3OUR1RmFRQzhyOFF3UDd0Q3pMQnd1TWRlckQ3?=
 =?utf-8?B?S2lCcy91K2pIYXI3VmV3YWd1MkZPNnl2Z0V2RG0xVmo3UWxBN2dqNzJOK2Mx?=
 =?utf-8?B?UXFhQ2JYMlpxQTBSdlJXVHI2d0c3VHBnUjNEQ0l5dlB1Q2ZTZzQya3licVlu?=
 =?utf-8?B?c0NadUd4OHdUZjNSSy9lWTVPZlpRREZQb3FGS0h3S1RmdUdsTVVwaHU4dENM?=
 =?utf-8?B?VGZtUlIzMnpnZWRCY3pJdS90OVBCcmEvU2VJbXM3amxGYy9PMFhoN25QMXk1?=
 =?utf-8?B?K0NuendCaWphcEh5RzVGN0U1NVVkZTVTTzBRR3ZSeTh3dldtb0VjMU5UQ3NG?=
 =?utf-8?B?VElHa0dJdUJFZGs0ZzVZTSs5SFQ4dmZTeXVieEFpV0UycHk3c0pqcHRlYmVC?=
 =?utf-8?B?S1UrejBtN1VHekNubVdkd3BCdFVrcEg2dHh0V2NDZUxJQkZYc1Q4WUkxSUhT?=
 =?utf-8?B?emdHakUxc042SEFlb2o5Z2VaVVZLcFYyRmsvV0RaWGdaVjZKUG0xYWt4MVRz?=
 =?utf-8?B?ZVpJcnU5T3doWkFybWlIZmRDMEp1SUNmS2FIdDE5YVZlU3RPVjNOSnVmVmVQ?=
 =?utf-8?B?NVhtcTNpckkyTmNnTC9PWGdKaklEZ0xuLys0UnZEZTFYZFA5TWxVOTFlM2Vp?=
 =?utf-8?B?SHJWU1g2aXhncHUyZXcrRzM4cGEwTUx3MStVdW94S3JuaVJrM1FGMk5jSGZ0?=
 =?utf-8?B?ckZ0aGxJT01RVnMzOWJZRk82bFJnVVBPUHJLOXhza08zQjlDVFprSDlaUEIz?=
 =?utf-8?B?Smo3Q21kZk9VNUhGYncrYjdYelJZeHFIbWRueXFic1dZTWd2WTlGMTJRdGti?=
 =?utf-8?B?ODFZelNDN2QvckM5RFhuWExnVEtPZGF3MDZSZVh6QnBmcWRWdFU0QTdHMFYr?=
 =?utf-8?B?eFo2SWhlbFZ4ejNQbTM1bEc5aXBDT2VsSXVPMi80OGdzaHdicVFhc1h4bXlZ?=
 =?utf-8?B?NjhPWlJPQ1R3WHpGMlEyL0drRFg3WVpkVWFOak5UeGxQLzFUZkFwd0I5bG1M?=
 =?utf-8?B?NElFU1FTN3lsVU1BR21VYjhNekQ5WG1xNFYzUG1rVC8xUXFlWEJZa3BrcjBq?=
 =?utf-8?B?L29PL1JZVldVZ3J6bkRoUFdkTDFaZHVUam5kb0lFR3hoZnlzK1gvVEhLR2Mr?=
 =?utf-8?B?SUF2WFRHN3JMeEVTa2t4djlOa0NqOFpSWUgwRzhadHZueU8vWGFSQWl2YjZw?=
 =?utf-8?B?dTFodGVLa0pHZGF5ck5ML1o3WXV3TDFNdzhZUksxTHFHQ3RBdGlzVURzVXpl?=
 =?utf-8?B?K3RXMDVha0Z3S0drZ045dVNMWlk5b3FSL1FFQzNRUkxVME5EY2h3dGZ6WkFo?=
 =?utf-8?B?SDNEK1dsdEpsQWllZGZMSGZKalFZemQrK2ZjNi9TQzBvSTdwTW5IVXU5YStH?=
 =?utf-8?B?WnZKLzRPYVFYRElVWmJpbkRRYmJIeS94bVRjRERBdTJUbXBVOUNWaVN1dHJt?=
 =?utf-8?B?ZHdUWHpVb1AxZWZQLy9td1ZRVUVhbHgzWWluMU5XUTA0MzVreVd4cko5cmFG?=
 =?utf-8?B?bVY0eVVrRGMzT3VNMUxPSDJXNlYvcjVEREYxQ1ZMb2psUzRCYnFaVGp5N21J?=
 =?utf-8?B?UW12aCtVSTRGUUtFVFU2R0U4WXdQSGFjOW1uamlvQ2lCNUVzTG8waUx4ZjZU?=
 =?utf-8?B?Rndwck5BQk5tc0g4cC9JRzI3WFNTZ05rRTk5UC8raXJqYjYxSjNCNXRydEVQ?=
 =?utf-8?B?RUhYYWlaV0dEQTREMjdFZTdTaEh5ZFNUMUhmdlQxcElBdUIyYW81dmFCR3Jx?=
 =?utf-8?B?dGNaL1hucnJxZTBzNVAwMjJOTnlodEdBNEpyRTAxeGYvdmJFK3E2THVBd2FS?=
 =?utf-8?B?NUZ5UzhldkxZR2pNS2Z3cmZaenFnd1k2OGR6ZEFEeEZwYVJMaC9YVUdGSTdS?=
 =?utf-8?Q?VQPOu5JZZq8hbvtc3mpGM9d5L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fae28e9-cfe0-4b59-9e5f-08db24a58864
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 16:02:38.0806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKh+J00WcmO5w08taBgq3VJMRfjJ3Ode6A5AipNwYbUARxBgsQ+OmjdqZ3SP+dyM2FM7j8xfmfpInNYnu5nhlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8096

On 12.03.2023 08:54, Huang Rui wrote:
> From: Chen Jiqian <Jiqian.Chen@amd.com>
> 
> When dom0 is PVH and we want to passthrough gpu to guest,
> we should allow BAR writes even through BAR is mapped. If
> not, the value of BARs are not initialized when guest firstly
> start.

From this it doesn't become clear why a GPU would be special in this
regard, or what (if any) prior bug there was. Are you suggesting ...

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -392,7 +392,7 @@ static void cf_check bar_write(
>       * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
>       * writes as long as the BAR is not mapped into the p2m.
>       */
> -    if ( bar->enabled )
> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
>      {
>          /* If the value written is the current one avoid printing a warning. */
>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )

... bar->enabled doesn't properly reflect the necessary state? It
generally shouldn't be necessary to look at the physical device's
state here.

Furthermore when you make a change in a case like this, the
accompanying comment also needs updating (which might have clarified
what, if anything, has been wrong).

Jan

