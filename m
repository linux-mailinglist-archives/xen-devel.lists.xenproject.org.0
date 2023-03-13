Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF916B7012
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 08:23:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509130.784360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbcWc-0004qc-2o; Mon, 13 Mar 2023 07:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509130.784360; Mon, 13 Mar 2023 07:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbcWc-0004nf-01; Mon, 13 Mar 2023 07:23:18 +0000
Received: by outflank-mailman (input) for mailman id 509130;
 Mon, 13 Mar 2023 07:23:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DKDe=7F=amd.com=Christian.Koenig@srs-se1.protection.inumbo.net>)
 id 1pbcWa-0004nZ-Jq
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 07:23:16 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe59::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9d2b889-c16f-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 08:23:14 +0100 (CET)
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB8845.namprd12.prod.outlook.com (2603:10b6:a03:538::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 07:23:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 07:23:07 +0000
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
X-Inumbo-ID: e9d2b889-c16f-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Spi8tUsYkVWK4aIsLmwhCMO9w2ANLN45LSdjle4EB4RaFQZL6MCoKb3zAusOvAcp7LMmj144pTrhSHPYTrNWcepeQcvF9obuCQDH4O9OiEjD+b49Wo5Up1C52i10cTPOReZMl76j3xcdbnUMweOAemPXuucmHdl35anep8viQK4GoI8ZwEiQPvxzObu5OMKSS0bv1yB9zDU1h1Re4WQlZgbo6NLhHaONacTjkHX8k9xghwp9MUWvXntmJHAP1lVTHYVlvleS0OJisdsjcuuHb1TjAQfJN+D7ebaVXMrV/ekZm7A097Ryar/j7jG/ctdWJdKMH/Vz+o99Rlwl8y5+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlJ4v+r0McIcfyEiKv4x1zw5gUvPSBstkFAYS/R5vzo=;
 b=e9KwaT5w9sopSUI2EV1t4Vz/E4nTNd5NTNBs6WOKDND6VWHEFjOgGoZPz7IqzrV7hLYcONOXnKezLjKvZwBPYXEsCcQUw8XaJb64Vtd5A/rzsdB3cxCNuQz20FF6aOH4LwDZPX5zsd3JvClXxhmQCzZm+vGE5XSgCdWZNIb1JKLIu4q4cyA3fuOeEQbe6NWuKibpkXLblZPnpV/3T/9aJzrRPkCz0zV412hHYB2dq99UeEmfRTw1YYXk32vM2U8VAO3+q7KGbddDrSoP3c4ih4bWvcgUHk3ffDyg1n6lphgTMapKEqbz/R6tLHAlIUlVTYL5lJRHg8REQGIkaFv67g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlJ4v+r0McIcfyEiKv4x1zw5gUvPSBstkFAYS/R5vzo=;
 b=CVN77JY2Y3zHLC9qo4+yC+f1lGKUT6sG+cb9cSGyVInUBRT2dVVf373nlh9zxzohkeg2zwDyOndwPdFLNa5D84phaZ7qPHHd7Gpmvq8bROJrfrGjJCjSF2gzVy6ACHD9o2ElWlbfm+7MFmQ9R+J/gn6Q91iG1FjmEiJjnczPZDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d0fb38b8-455e-1210-0f26-9ee7c4335e69@amd.com>
Date: Mon, 13 Mar 2023 08:23:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230312075455.450187-3-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3dfc3d-13cb-44c8-37d5-08db2393cb04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X38Xu2+GTZHdebcIcjZ+gNvUnjsSbXDtjzuyYs71qb82dN3H0IMLXT5AF/Jmj67NosBxMeJaLaZBdFHjdeoT0TOeoVL4pG42bqWeWso4ozQMVOtISbpKtM3MQKlnWYVc7lK6wB0QDITnMhJSjJu8GW2XIdkv3d/EqSNlS8s4anZPx2WYR1Dak1ZH5oU1TPhQiffVYwraDIkXrS6hECuQEXxwxVyVuDDVA4Bg/q0H3g8AjMTGTnI56QmINtLsfk4kzniC+1TVagfOR/XFYaLFq4Dys4v/Uk+yPCWtK71idsYXMwWTF/rM25Uah5Rh3o4PKTyMU8/tbykrDdA0Hsjsy/8I/PoPkMaTq4QSVvjIUOTSXPTYbgcfgY5xX0rj/bHdrBKAfn/7OzvA3Z1fw89PCs4pfutbxAooxRnMc/K/NTvOj4Kl+KMoKmKro8zdK0ir/f2DCsl0re9ghiq/M8Vz+52MVELV1Pb03V/ghC0M+hUBUXBxgl8jJwd4ztnMmDSBegDTz44O8F5cFFCRxGNXGVWLpUmJoypzIBOiJYE/sxyRu/JFtesI635XsWde39Jthbio7T1CMM5mRLiekpnzwWAnG/uERj1uImid4MH/MnXg2fQ0h+WHvbrXGpgCxBZcbMI7ZyrsK2fU18NrOcDa6+d4wIko3ah7aVaakvqfle19qq7Fv3QIkIht5rxzjqk5in8TH9Ntevmq05DKQaTpamobzk5IF3rJKd0ZtLzUd6c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3587.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199018)(31696002)(86362001)(36756003)(38100700002)(4326008)(66476007)(8676002)(66946007)(66556008)(41300700001)(8936002)(54906003)(110136005)(478600001)(316002)(6512007)(5660300002)(2906002)(2616005)(83380400001)(6486002)(186003)(6666004)(6506007)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3VHYmlkNTFPZjB1N1BzdVpDRVFsUjRTdGZUbXZlRnBLZFNydGNpK3BKMTZz?=
 =?utf-8?B?Mkp0L085ZWhPR3JteVNXS2pBZllvdEJlNHZpdktFMUhhN2N0VlRvR1dFOXFQ?=
 =?utf-8?B?VmZZaURoY0JFZXRYaW5aMTVoZ2lkK3dRSC9QY3A4YUFmZHBXV0lKTGJIcVRI?=
 =?utf-8?B?eS8rY0puczhqdHRjdkhWVFBOUWdYQUYyOUZ3UUZkdTVkaDY3alVpK2hFR3BE?=
 =?utf-8?B?RGlNU0U2dHNpRTg0OGw4eVpPeVNDanNzMlg2V0J1a2p5aFlqUWVBRWlNQmox?=
 =?utf-8?B?RjZPNDRYbWxtMlhzY3ZnUWd4L1NMSG5RdC9TbTZYRFJQUUl5M3VRWGZkVW1X?=
 =?utf-8?B?SjdDQUgzVWQ1akZMbXltMmdnWUdEUmcrdTgzS3VXazIyVzBxQ291WFR6NmRP?=
 =?utf-8?B?RmoySzdNWlFQTVh4cCtjYnNHRzBGTENYK2ZBeDVFckNxc3h5U3BZWUZFV0pY?=
 =?utf-8?B?OWVMTVo5RVo1d1BhZ3gyRDN1SkJSZzVsY0czMzVkZUhMZyt6WmdidEQ5ZERR?=
 =?utf-8?B?K0cxMXViQ1JhR3QrMk5DREZoK1hkODh4OFhPUlZhTGtZNzIvNjk5MjBCYTlD?=
 =?utf-8?B?ZGFIWTFZSWt5WjJHWXcrU1A4aUhQT3hKR1gxSTZGbG1JUGlqWWVHNHhjQVpX?=
 =?utf-8?B?NDFkSzk3cHhjNEVtbXVKNXFLdUd4R3VaMW5iVnVvVHRMUlhKeVZjeDRNK01W?=
 =?utf-8?B?U3pXUVRNdGlsbGN0T0o2VTFVQldUaGEvTEpHaGlHdDdncmpJUzlOTG9lMUNp?=
 =?utf-8?B?UjRISmJxaG5ERmdlcDV3SG1ubFBjV2NUL2RVM2VML0d0M242aWpobENNZFpm?=
 =?utf-8?B?TVhpRkRGNkdJN3dNUzEwSnNSTWlVWjRNc1p6WW90M1RGd04yMm5Ia1ZVM0Fm?=
 =?utf-8?B?U09sR3FzdlYyQUVOOHFrcUh0L3FURG5BM3JqQWw2OXVsSEFHV0RNa2hiYXhR?=
 =?utf-8?B?QzFpT3ZISmREQ1RkdW1wK0MzVUkrSlNMN0FzVmhjOEVNdWdhWVVhQ3E3MjRL?=
 =?utf-8?B?MTFZdytwekZWSnhCVFpxbmx3OW56bVQvcjM4cXpWcTR6VUtRUHR2VVhMc2F5?=
 =?utf-8?B?aXlWbnRTQXpFSlVTVndSQitQL05tUTVHV1NXVTJOOHdzVm96NS82TWpWdWMz?=
 =?utf-8?B?OHo1NjFCY0hZR2hHbHVaNjcrQkNEd3Yrem12L09CbEdTUGJkU3hZRGtSOFlH?=
 =?utf-8?B?QkJvTWdmK1VuV2JXSnBXMEdKdXBmM1V3NVFUTXZMaThGd1FUMGhRak04bjhp?=
 =?utf-8?B?L1BwSmFhZitxOVkyR3JsMjZQTGxwN0VHbFZ2VE5SWW1TQkdCc0Z1bmFaNkVD?=
 =?utf-8?B?a0NHejZydndWZjY3TElWSy9XOE1NVEhHems5ZVdnamFvNGdXN2kxYU9mNHB1?=
 =?utf-8?B?WDhVbjlET2RyZTVsSkVTb21EaEVpZzJpTWNUbi9ISWVMZEs0UVhGbHFSd1gy?=
 =?utf-8?B?QWt0d0Y2bHdGM0l3U210eXEvVVZCZVdTbHViSktyM1lBb0swVHl6UjBSelB0?=
 =?utf-8?B?eVpMa1N2RmYzNnNud05xdXdNeXJxTnlaL29XUHpPeS8wYXc5UytWVlF2aTV2?=
 =?utf-8?B?amZXU0tBWHJhY2x0RmxTWTdEMDRqQ3pDZi9xSGl4SDZieDM1czhwRTFsdnUv?=
 =?utf-8?B?K21tRVZWSFhLUHNwenp0SnJMdE5IUjhRalB4QzVrRUxpaldWL0VnOVNWcTM5?=
 =?utf-8?B?KzBNVmVTWE05aUIwZkdsRmpQSFoxbFI4QUZCMXdPSEw3K3JYcjhiN2lnV1hu?=
 =?utf-8?B?MVdDTVFTR2RRK0Zra0FyeXU5dG5ManBqYVF6RWNUR0U3UHBWbkp6VDNKRmVs?=
 =?utf-8?B?eTBXRzI5b2RZZkhJUGFGd3BSUUtYU3F1NVdULzZUQlZaWGZpNVNhdzdwWWtv?=
 =?utf-8?B?bVYzYTN3c3dCd0lybmdOK3BxMmhqV2pSQ2Y2VkcrOFhQcnBpTmJ4RkZrdGFC?=
 =?utf-8?B?NUV1aGg0dVFkVS9ScTl2ZFBvMDVXNlZ3OElWb2hBRVpENERBSWR6N0RETWox?=
 =?utf-8?B?Q0pZeXMwVHpEQXdDcjhBK0dER3g1SUZmbFFyd1RMM3ZReUJMWlozdHZWbGh5?=
 =?utf-8?B?OVBIdXN0N3NZekd0MjJSQ2NBN3d6aENCOUNLTFo0RW1PWENNcHhLbHF3YnJt?=
 =?utf-8?Q?4qyFuD7V28xSdJhCvp6LsF+3B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3dfc3d-13cb-44c8-37d5-08db2393cb04
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 07:23:07.8616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUhVkLpLMxAEaCi6rE4AOreUbWmH2MXG180RX7M3JBp4/EnV6scQ4HmMIwXVK5+I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8845



Am 12.03.23 um 08:54 schrieb Huang Rui:
> From: Chen Jiqian <Jiqian.Chen@amd.com>
>
> When dom0 is PVH and we want to passthrough gpu to guest,
> we should allow BAR writes even through BAR is mapped. If
> not, the value of BARs are not initialized when guest firstly
> start.
>
> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>   xen/drivers/vpci/header.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ec2e978a4e..918d11fbce 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -392,7 +392,7 @@ static void cf_check bar_write(
>        * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
>        * writes as long as the BAR is not mapped into the p2m.
>        */
> -    if ( bar->enabled )
> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )

Checkpath.pl gives here:

ERROR: space prohibited after that open parenthesis '('
#115: FILE: xen/drivers/vpci/header.c:395:
+    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )

Christian.


>       {
>           /* If the value written is the current one avoid printing a warning. */
>           if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )


