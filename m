Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B80C6E434B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 11:10:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521861.810817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poKrv-0005YH-Ez; Mon, 17 Apr 2023 09:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521861.810817; Mon, 17 Apr 2023 09:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poKrv-0005W3-CI; Mon, 17 Apr 2023 09:09:51 +0000
Received: by outflank-mailman (input) for mailman id 521861;
 Mon, 17 Apr 2023 09:09:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poKrt-0005Vx-OM
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 09:09:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a8e0fa7-dcff-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 11:09:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9577.eurprd04.prod.outlook.com (2603:10a6:10:304::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 09:09:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 09:09:20 +0000
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
X-Inumbo-ID: 9a8e0fa7-dcff-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QN+v1WEiHTmgqBMkeCjOw4MzXrrsXsRuRXnHMyOUF6+Zx2C7Cxs/lSAisA7TkhB8L00Pe8cK9Ok/ePz1zWciON97psO7sObjR1la7VV5d7BNYAilR9cKZMcjf7YlsEwllp0yqhI+/WRYRodaLcPlqBy43A59bYtoC1NFwqx8AKQqlZ6+ubuptcSMcifaK0Il7Pgi5bFHFsFIYmfFPE7rnXugBo5iKwwt90dg3gQlJvFwqGNtiTDYgjrumu91BY0JLCjBuQCY8O06UTqSnRp7PQIXkojbQ5J9x9bjylNPjcYhU1WaWnlsPDrIwDy1LIRgMn2f2pGHjPcWTXHXxYZQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQF2NIVT3ZVhFqyJdWLcRXA3OYkqXWxqwG77hoStKwU=;
 b=ma1D9kaSgTm8BjGD5FxbuG2Q9bKP3xSBJvZLzCvVRxv9q5mjwmIaiDGuUC3eL/QyZ47gFm/9tK5Xu7PPeureF+xdLFaN0tcXO1CCtAW2NUtt3UjmQw5Pw9Ix/haDCy5/bXKv27eiYn2Kx6AvSycJfE2FCPuqcROXsS3paEeB7eML3F9Eog2+muICTE8u3laum9EELJM2UoDwIZD44V8JoZEC4D5zLFeGQT3nFPzWUdIFfHuRMZZpmQ3SyHZA1j75hAo5rVDBfxUtAVXPp9J0f8gA/QcbT4w6h/oJ3xwHUsFc36AhkL4nh/mEnTgW37R0JZt4XzpR+ZsuooOjQhb/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQF2NIVT3ZVhFqyJdWLcRXA3OYkqXWxqwG77hoStKwU=;
 b=phNWqD26wBgLVxUYUwBFDQicxbG+SCc2XlOy8WROtmP/xQdzCGds3cKH8GfTa6C0GTdgtCQWA8giT/lFL/Id6oOIXOPczClC7c1A2DUievEU/hNHNZiY8Iu7XWIE+i81uJ/GiY+EX03wQScDZmB+1+/XX3ExaU8SoQngk7Sguez2DxKv8Fh7hrPUu9iPlYaNOgnrboeR51ypkfQM/TfUN0LekLQrFUKWquiI6iz+SIpo26ArerSPUycpHBvm91/atR3DD5X4NNy/KPbi7iCe12R7+aGP/udvHlx+OqJZgR6IXeScQcR0TI7Cw4gH6iIOAPqMrihW5TFIz2GnfrHMLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <110951c5-4dc6-5fa5-1722-a86ba28f1789@suse.com>
Date: Mon, 17 Apr 2023 11:09:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] xen/vpci: initialize msix->next
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230414202932.293688-1-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230414202932.293688-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c77777-8d62-4a60-b8c5-08db3f236d97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	52OzxYy2jXnX118mturPZliVq1LPXTZZbI9JSXVC9RzmhPZaoaCI0RmnJBsTkgx+KO1RbPqqzyQVx1rQge6BzvhVfVfG+hI9k1S3t5JOk1zDU2vxRv3qEuybCYBbW5bmZZhSj1NdPxEJw7nwIOTZ5EOOmYE198YV1zgFGaed3SQt29kiHdq4DXtZDNC/XuNHjOtQPiIs0KsSdjKHRgND6ELZ3/hV2XN/9Pg7ESsNyI/0/vroArq5z8mKy0Wqa1rR4dXlX5d5LXRDh1YavDwQzv9jWsyYfxQnFFxw0bBt6mICq5ZPxJxbC2ZXidqyCnZ3CyeHmh1xZ7OL0FQBkeaCG8gxwKMzvxwvVYmx0zqNfT1u6rg3OWZRq+uAXi8VkJnMbbcViKRy4xLlvQ0J4BtixrYZWvlCyr/7qgj2eJmT6GkTgnOndGq1UzlgDurOLE032bZgSqZlGf7Ujkrd7pNzLVJlAHqMD4XwZ5ey7vW97Y0rHjzDFmuppBxtHH2ONAr7S3dE4eHLU2UxSC0rNG0cVRO+RLF6FKfOH58eYPUYce9TCGSBk7yfxA+SOAYQYGT3AJYawAofitsavTk11onhS4Q+7E5ya5h9CtRE6sFuwD61paeNmzHhx5oEUuiAVqlwmCvZ0NSZZdlyq0k8xPVyGQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199021)(6916009)(4326008)(316002)(66946007)(66476007)(66556008)(478600001)(6486002)(8936002)(41300700001)(5660300002)(8676002)(4744005)(2906002)(31696002)(86362001)(36756003)(38100700002)(2616005)(26005)(6512007)(186003)(53546011)(6506007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW9BNGFNNEhFK1FMa2pIR2N4Ni9OSnBDZ0dORmduT2M1T2xiZ2hNQjgyb3BH?=
 =?utf-8?B?WHlzYjhWa0ZVZFdhTWlsTi9qN3RsMkZ3WHlKUFFCdnFZVjFvSlJrNzlBM25Q?=
 =?utf-8?B?NmJ2ZWc3Z2xiV0hEcklEaTRUV1A5YitiU1JhcWxpZFBJWENNRlZSd2ZPK2pP?=
 =?utf-8?B?RTFweGNhNmlKSlRBMEZCQ3NISzhSTFJmR01CRVFFRXRUeEJOWit1Y3RBU2dq?=
 =?utf-8?B?YW9mZUl5ZG9qMTc4cDJ0S0I1bVNVVmJSN0dydEEyWGhVQVExc1I0RVIrMDBY?=
 =?utf-8?B?a0RBSS84czBqMXJrZXI0a0FIaUsyeUtWUHNjZUlvYUFReDI2N2JqeVdoS0Jp?=
 =?utf-8?B?eCtxVW0vSkFLZ3dYZ0Z2OEw4bmtZeFJ4S2oyaURsOFVzNWVUdzBXcFZnSVhT?=
 =?utf-8?B?cGtoQU5DNTl1VXQrT0ZJNVpqNXdSK3F3empPKzZTMlVSOEtJbTAxZ3BLUGhz?=
 =?utf-8?B?REtTVExFbmswRWxFNW9Zb3ZlN1Znb243M2dyZng4T0dWMWdPM0FFMXNkT1E3?=
 =?utf-8?B?QVBHNGpUN3RrSVJRSnB5NUNzMFlkU3J2OTM1TDFxL2JOWmhIRC9pTTVPS1hY?=
 =?utf-8?B?bzh3TnM4c3lLeW9TYmRmUnJtVzJtSmRwSWVkV0Y4OXVOL1BNS0tNQkFabW1O?=
 =?utf-8?B?eG1sTlRYMnMrMUlVUG56TDFyeXp3L3lqSmgydVN5dFE5TDQ3eTBaU0VQK3RE?=
 =?utf-8?B?ZUdRS1pIaUk3alZKb0dPZkZqMVhpemllc2tMZnQ3OXJjMzZ1WSthbFhUaW1B?=
 =?utf-8?B?WDlFR0kyZW9FTGVmNnBaWkNIbWxib0FiK3FocklxcjBMT0luNHVRV1ZBM0Y4?=
 =?utf-8?B?VFdUNFZobHUxYUhndk5GU0JVdmhOYkZpUkY0UDFicXBOVVc2S3R1bm4wMGdw?=
 =?utf-8?B?QnU4N2srYVRzS3MvUVcrT0xoK09zYU1ZU0Vta1hMODdDV0ZGUDNHRTkvbmo0?=
 =?utf-8?B?eWwxMlprcFVpUHgyVXgxd3N1K1BJVEtpMUQwV3QyK2JnMGpCOENQSFlMb1VE?=
 =?utf-8?B?WUhETkFtRUtJOER0TTI3MlQyS3VTRkZ2c2VHbk42ditmaEhtSENOSkFRaC83?=
 =?utf-8?B?dyt0M011WkRwcTdHSnMzVTVZOTRxTTVONFZiWG04SytZNm9aeVBXa1ozeG9v?=
 =?utf-8?B?a2h5dndPU1RqWGpMaHRtSGNBQjBPOVhaUGFZL1M4U1ZIR0FpbDBNNWRHTXk3?=
 =?utf-8?B?cnFjelB2SG9JRGhSWE00aGVxUWI0Q1lTNzZjcFVhNDhEMWlUQ2JoQ3c2MEZx?=
 =?utf-8?B?NDJyVnlCbWh0K3BIczE4MFlTWnpqVmNpN0xVNk11Nkx3SW9zenB0bk01eXJs?=
 =?utf-8?B?eFVqbEo1eDhrVnMvUHVWa2NwTnh6SkVrdkkyWGJHZ3NKaXZ1aXFQNUdHeWlJ?=
 =?utf-8?B?aktTV1htY3dkdmY4VHlWYjZJVWszNUt2N3I3cWRIdnlyQy8wcm1od2kwNFdZ?=
 =?utf-8?B?U2k0RzBtc0JQdkhScFRuaDJBU2pPZFJoeEF3WlFubXA0RklnRzJwalJNRVJs?=
 =?utf-8?B?cnhXaHdHNERtUFFFc3p1Q0NickhMMVhxd0dFRGFvMTgxV1BxbDZIbzlYTjNp?=
 =?utf-8?B?amhtT3UwZGtsbnExa3U4dXdSdkNuUUJmRHh0cUZibzc0dkcrY0tFNWZ1NzlQ?=
 =?utf-8?B?SzRoY0NsZjY0VXdpdWlGdVovQ1IxSHU5Q0tnV092ZjVQQ0R0V3hjMVdKbSth?=
 =?utf-8?B?c09GYlVWZHh6Q29MWUs5T21vclpKSDlKWjBkN21YcHBYZWFGU1BNRXF1WHFU?=
 =?utf-8?B?N0phcGRDT0NZYXg5cDVYbDZlV1lGLzFXR2FUdXpwbm9DT3RndEcxQWNRTDNv?=
 =?utf-8?B?Z0s1WW1SM1FtVDMxd1VUcXJZZW1HWGE3OUtSb3NIMXRWcStqd0t1WUVodTdl?=
 =?utf-8?B?TWFEWmhvbW1xZitSV3RhbkNqNkp3dzJGTUdad0hXWmFOdFJCckdpeFRQbWZ5?=
 =?utf-8?B?S3BOVit5N01nOU80bEdkeGdXem1zNjFEc1NOWE5UdCtEdHoxekl2Nm1Ed2ZX?=
 =?utf-8?B?QW9QUUF3Wk1hVFZyQ2MrOUwvTUF6UFFDbHdoL1BWUGJQUTdwV0l3d0UrTSs4?=
 =?utf-8?B?WmJhRzJrVnNITWVsdmpMZXhNcUhkbVNnemo2b2JUVVVCTE1JWW9pMWhkM3A2?=
 =?utf-8?Q?NV/H6MEjFxPdwD1KVTcTRtVjg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c77777-8d62-4a60-b8c5-08db3f236d97
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 09:09:19.9632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2p8nFVl0f8QCyutx0a0hFS0GGXoXPpjs4HAMUqUG5uEza3fhvB2UM/z5H6qGYEA7CoAgI16jrdRHUQ9tNzejFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9577

On 14.04.2023 22:29, Stewart Hildebrand wrote:
> The list was not being initialized, which could result in a crash in
> vpci_remove_device if no list items were added.

Can you please point out the code path which may lead to such a crash?

> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -678,6 +678,8 @@ static int cf_check init_msix(struct pci_dev *pdev)
>      if ( !msix )
>          return -ENOMEM;
>  
> +    INIT_LIST_HEAD(&msix->next);
> +
>      rc = vpci_add_register(pdev->vpci, control_read, control_write,
>                             msix_control_reg(msix_offset), 2, msix);
>      if ( rc )

The error path below here frees msix again, so can't be a problem. The
only other return path from the function is after a suitable list_add().

"... if no list items were added" is misleading too - this isn't a list
head, but a list element. The list head is d->arch.hvm.msix_tables.

Jan

