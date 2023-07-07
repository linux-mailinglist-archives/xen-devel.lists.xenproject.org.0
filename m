Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839F374AB70
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 08:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560200.875920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHfNY-00065J-BH; Fri, 07 Jul 2023 06:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560200.875920; Fri, 07 Jul 2023 06:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHfNY-00062e-86; Fri, 07 Jul 2023 06:55:44 +0000
Received: by outflank-mailman (input) for mailman id 560200;
 Fri, 07 Jul 2023 06:55:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHfNW-00062X-Na
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 06:55:42 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2081.outbound.protection.outlook.com [40.107.13.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 497e1775-1c93-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 08:55:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 06:55:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 06:55:13 +0000
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
X-Inumbo-ID: 497e1775-1c93-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCtmwm2qZUFdbmb1OXER85oXNZOLtYaAShYh2xWO857xFudKuAvU0ydd8NdHE+XAsBa2j9oIyIblSZDWg0967EpaabbR+Vtg7XLvQcsEJUT7xaO9kjShfFim3StHxIBXWgf+ZMMqHE1DK/6UWI7TCnxEfBVddeH+cOmicNokqkjpU49gprJtLcv84HncjBF4H9tWKipbZHapBMcV0A0E6p0+j+McH+pQMRR5fMShumOooMFY/FOzryvysNsBDyqQ/Pl9nW3RDevpHdxcCLxej7qEEh5PhxDyHiBB1ll1lIb/Rgwy0BcJ9XjckFAjuC8Oo4J38hocQjWyLgnLkrA18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RC9FUMPb8U9Jd2Y6LVs5c9vDP5pikuKs56K0UrSB1s0=;
 b=Tt7juuAb8M4cl+Qz9Fxht3Ghrr6wEqWWDeER9L1pW2IYt/Ozp7Q9Q2OCToFq/e4KvTf9wrOQ+e7WA/tBs6ASNb4cJz+r69eDsaM3lonm6p3Haqm18pO58CVG5jc6621YFrQgN53rLOm9wDs1ndHufJFrBbfvhOesosis450ziLFo4phpqgY4mqIilnFmJszKXd2fdqiAfPJff12ikF4HpmQrxIp5Xzo7RPcfp8PSIN5c8IjSCeypklfyZapmIN0KZOB2ds4KsCYKOjqWfJXUaSPCQVMx6iSXtgyuq5ptnTm0l62x7W7aO6MRkbOH3MVn5O1lXuJZsaf7cyOhLnbY2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RC9FUMPb8U9Jd2Y6LVs5c9vDP5pikuKs56K0UrSB1s0=;
 b=0U+ufEH/eCW8st456DZ0mtct911b9p/r7erx3CdxYghpkjq1TV2GXbqjB6eUaXLp7d8Fbj2ucCBI4sXeG+ajicN+uNe69uh15FvhgRRBH/6XltR55vskDFMl6MvNxw5YaOYF/HzfkHhQhiFIy/0JqH9ccCXtH1L+lzcRnwHBE45Tf9QOnovYWj7WuLR5GAJT8+4bGOvSYke4wV8r+as6ZcN8Uo81MePhnUYdb4MIiv3L0hb4iZu12R/poe0/5v0EdOqz3qptzNfE9s5xqqexCTs0/8ohtz8HrNeymQQG07Aw+/JYcg1iBOkdARoKTBTUFeJAFmslFSuOkhYY5+qhUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ab542ff-9145-d989-2ec1-3d01168902a5@suse.com>
Date: Fri, 7 Jul 2023 08:55:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/3] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig
 option
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-2-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230707014754.51333-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: f11a7b03-6084-4e9b-a395-08db7eb71cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Suxgr35xsHXOzfPZ0AHKGmVqgKiiMJrYEoBm/X2Vnsi7MwZVOZwIV7Ne3x/5YfGsoREtA2a3zbhaqs/Rj71w7LZPEoF8o44rAqCt5hLFhTncbVY8Vom+S19HTrmzF8WadJGNv11SIo9saf6SqYKPhaGebnWYlNfM9NgxrTWDcFkNJYKncGVvhh0z5Tjjpacci+SFI3OwajVV1J2qYBGhFyD/Dxkpweb4ST4kjjxmuwqGg5gwf840EVv1imvDQhfjgbPpSirQd/1NIVtUo3aWO8S0UF8Wechr+JonAFMvRz1lY05klAXjvsiQ8SuTP1EUu3gkp4xfzlfmx8F6TfNmype/SNXHV0mrTFD2DwmG24rc7h7YxI4WIx0lMttD6KMGIVEfT+IYRWGdYqchPAoJBvpAnbfLP0leNp53OwFgYGLTTTdEd29WOUzmUBs3RuMFDcbKus7jq81xkKk7jE9icsgI+4YcVY7+kWGuNuAscpPpsz2ea9o7kXgYji8o15APuE3bXYw9FWML3Pw5ZNPBtuzizUftNZB/80R3v/vEjazk3dLZcTEI0FC/nzd+xu2/NHWdiPgUCu8z4WJ3bewttNY2a/0mQqkIWZc69VkDjfMbeDGrvJ6uslKPPdClxG13PAmGwGI1O8ahLcZ5+CsDmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199021)(31686004)(2906002)(54906003)(478600001)(6486002)(8676002)(4744005)(36756003)(7416002)(8936002)(41300700001)(316002)(6916009)(66946007)(4326008)(66556008)(66476007)(6512007)(38100700002)(31696002)(5660300002)(86362001)(26005)(186003)(2616005)(53546011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFdWUVVORmpWaWE1YTJhUk9ScE9Lbmd0SFRLdXZLK0orS1EreEtQOXQvVWRW?=
 =?utf-8?B?QkQyVVVnVDVHd2UzbHZRYzMzSlQycHJQVzlHVm91RHpycVhtREhwa1ljeXJ6?=
 =?utf-8?B?NjRqWC9WbTdtWnNzRFhOUkZweEtjSTcvejFQcVBpemxBRDRkd2dJMVBnVmI3?=
 =?utf-8?B?ZzdmTFhVRDJqalpWSWV3aUR4aXJ4U1pSckxZcmxKZm83bzFnaHMwcThLcURH?=
 =?utf-8?B?cUJ1c01xaW1tajdubHphV3Jna2xVTmVUOHVKS3oyd2RsSm9oOTBCM0lqQWxZ?=
 =?utf-8?B?bm9NRFNMZHhmZUl2VzY1dWlHejh1ODAzOE9acUw1VWYvbzRweHdmdllNd3hY?=
 =?utf-8?B?MnR0N01RUm9lS2ZGb3VFQmJ3ZFc0V1JJZ1pWSFhaSDA0YitOMnVLQWM3SXNv?=
 =?utf-8?B?M2VyVmsxUzMrN2p6bWp5RGJDcDBRV056elFmRUh3Tm1NMWw0ekI0U0ZXY2oy?=
 =?utf-8?B?UkNldGNEd3ZiOWNPK0IrS1grdVplTURvRjdadkY1M0RVcXIraEtuN2FDbDBU?=
 =?utf-8?B?c3A2a0hNUWE2aXhQMXdRek8yUUpyZnhxaysyL2o0d1U1MTV4STN5eHJOaVFN?=
 =?utf-8?B?VkdDSUNJUTJobXJ0TzVSSURuVmhXd3NwcGtnS1ZOelMra3JMaDJFZ0RYRTAv?=
 =?utf-8?B?eW12MUhEYy9BblFHTlVUcy9EditBcko1Wllsa0lDQ0VkSFNKb1NQMjJJcmFa?=
 =?utf-8?B?dXYzdndaZnlnaUlrOTR0ZDV1eHROTjdpTzkyK21UQXBNWjFFbElmODAvbFJv?=
 =?utf-8?B?M005SllaaitZYTR5RUNkNzdQb0NwOXB3NUYyTzBaWEswOUV3Q29IYUpOdUg0?=
 =?utf-8?B?UVllbUJJTGoyOUdRNEtpT0ZpY2g0OVcvZ2RxKzRJU0h0dUdFZ1M0aVJDTWll?=
 =?utf-8?B?dlgvYUIzWVN2cURZWDhKZ2tmZlRDMVJwQlQ1SDFxcmY4c3FDYzlCWWNLbU8x?=
 =?utf-8?B?MmlGdVJMMkF0eFQ2UjI5TUE1TFpGMExMS1RHdkpZcitHU1N1ZlJqYXF2cW82?=
 =?utf-8?B?YlA5MFhSMlBGbFAybkJpTlRnZyt5TDV5SmFXR2d0Uy9EV3pab2JHYlNFd1lx?=
 =?utf-8?B?dXh5KytpTzZUTzB5bXN2ZTk5NlVsK0tsNUVSSktwWktCQUxtVDBLdStac3hH?=
 =?utf-8?B?YWhNSVpINUVoRmR3NjVVU2RQKzFSVEtITFg1RnhhZzJ4VS85a2dNMldYSCtF?=
 =?utf-8?B?THF4T1JxR0g4L1BUVHE4cUxsNVQ4UkZEYkxPYVY1dFRSeEhrZVFjMW93dVVr?=
 =?utf-8?B?L3NjODdPQUo0MHFFR1R2OXNTenFYdnp2R25IVVVLYjBSc2UySHU1by9rTVRt?=
 =?utf-8?B?MkdBUnFuVzlwck03SzdjOUg2UnNMSVFkc0tQS0R0SEU4Mi9yWnM4WUc5TkNL?=
 =?utf-8?B?Zk13WUxpMTJaeDllelhETVdxdzhtaEpuUnN1UktzNndIdjJXQmdneGNkaGxZ?=
 =?utf-8?B?bWdnNGZTWnhIMzVsVUt2b0N6S0Nqa20rTWpRZm9yWTkvRTdHK25sRndwa0sr?=
 =?utf-8?B?dktObDZWeDVVbVhlYnBVYkhucXFwTTMrdVhySnFaNHl6MVlCTitkaTdpMVlR?=
 =?utf-8?B?VUNXVng0YlRQejlUT3JMdXdPckxKMUhJbW4zbjhneTczUHAyc01XMDY3cktR?=
 =?utf-8?B?M3czQUI2ZlRZanhLSkEyTDB3aUNvZS9zWmJLeFBGamtJWGhtVVA0eWs2Y2lB?=
 =?utf-8?B?OXArQ1h1Z1oxQWU3aUVsY1VlZDBrV1hQNWFvSEl3UEFEOUpQL3BiR0xXS284?=
 =?utf-8?B?ejZBUzNtcktNOTcvaHhzazFNUUczay80emE1cVljdlgwVzhKN09ZVUNlbFcx?=
 =?utf-8?B?RUdBcFZpVEF5TnZjODB6Yzh0TC9lQkpDZ2RnQlVDZ1dDbU50OWRuUytqbVhY?=
 =?utf-8?B?Qjh2T0hyRjlaaDRJblgyT0l3ZlRKaFZNT21wVWdIY05rSkZObmR1OFF6T2tv?=
 =?utf-8?B?NUNoTmJwYXpuWXYxU2xrV2xuS240bks4TDI4ZDU1N3Q5dmY3TmxXME5VQkVz?=
 =?utf-8?B?dnpadjZiZ1pWL0JMSmRNNlpVaHNoS2dVb1hZcFUrRWI3MmJUK0dkZi8rTjdE?=
 =?utf-8?B?SGVZY1FEQlY4TTN0N2pqaDVIY1E0cW85VVFtVW1OaWQxa0p2UnVRYWtyK082?=
 =?utf-8?Q?DPDcZRcAF65iuhf233ooNIIrb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11a7b03-6084-4e9b-a395-08db7eb71cbf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 06:55:13.2402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxJCN5WhQk3ZmSp/my9rk0mn/pothlhUNsReN7BOwCmFAqzTpyECLlJD5LxL/fMs8S3tjIKTm+XHKaQn3Tbjkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

On 07.07.2023 03:47, Stewart Hildebrand wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -190,6 +190,15 @@ config STATIC_SHM
>  	help
>  	  This option enables statically shared memory on a dom0less system.
>  
> +config PCI_PASSTHROUGH
> +	bool "PCI passthrough" if EXPERT
> +	depends on ARM_64
> +	select HAS_PCI
> +	select HAS_VPCI
> +	default n

No need for this line - that's what the tool does by default anyway.

Jan

