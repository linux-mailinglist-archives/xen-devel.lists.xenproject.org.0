Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D36557D0A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 15:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355014.582434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Mui-0007Sz-5b; Thu, 23 Jun 2022 13:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355014.582434; Thu, 23 Jun 2022 13:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Mui-0007R8-2U; Thu, 23 Jun 2022 13:30:28 +0000
Received: by outflank-mailman (input) for mailman id 355014;
 Thu, 23 Jun 2022 13:30:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4Mug-0007R2-QK
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 13:30:26 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30083.outbound.protection.outlook.com [40.107.3.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3ae8582-f2f8-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 15:30:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2264.eurprd04.prod.outlook.com (2603:10a6:4:47::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 13:30:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 13:30:21 +0000
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
X-Inumbo-ID: a3ae8582-f2f8-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLMXNbq8pFD4gus1B5irw1ueASK/fRBe+k+8u3NJxGOD3A7/8rBHr5wzrob6U5/cHD9JrGJwQp27Pbq8mgqHvKNlGtNdlzQaxK0Tcqyy8wrbfeYrp3hDz9Ed2iFHe/HiZ4XWne6Rka0s2fPWE33haMRmofwN30hHOUx7Qw8Hc2CzNlgxXqWIxOIjgjJJT60RAUbkgx6eAdn2VloI1bPGNTRey20+iDaZXsOKPhC6Lcjs5/+Hsq32w1x2aBZRQuDoXOpblYaNzvfZCHjrvVqvRbsJwkNjMPpCiVwgD2vdSfTGwrRLsaMuzI/pu6JfJ7Qb5k94hhv7aRrlQPSnbvbgJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBo1s2Eo42rC4sM9OoapxCB7WufBem5PlY3JzRIYNus=;
 b=AebgbeyT4uQ+KInzWHypK+Xb5ZPuwUCNYk5llY+S5MMXMjNVQmfCIM28TIE9H98OKAHoafHmTZ1Vs5RiMrDw81OhuzfXWIyP9k++JRKrAKCizske1eZQwRMg64DP4jtN0AbnLO2lGVQ2JRAMudSEfaqgtok3dtiAeSI9C7v0eqOg/ERy7+fUfZ//M3v59PdOWnE8SPr/fKYrR+L4UbRPLWvz4pk7bGZDf+8kxZ/VNU38KBnce5vaKxMz3lUGdh9SjU2lcpP4+rzBroqRMtMMsHXKuLiJDv3KrF9GOQha1v4wao2EOntxkB3ecnLKSZMEQbgIIq54MFG6nJz5OzYgVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBo1s2Eo42rC4sM9OoapxCB7WufBem5PlY3JzRIYNus=;
 b=hBnkFHH1SMwbbOwmNtzVHrDGkFfqfTDLIEhF32e7Tu2lIBZqF5feUSGDvTaAA4xZG7oqpDOfmJS5OLsVfek/aElDLrsGdTWyayEA9ss3EQLlUrTwqHxUCAkSq7hkTPo83O2bhEW26gM2Z/ySpDaW3hZDFwxi/D6bWBp0736Va+s7+1B4uh093BqOGU6KHDNTGv8eSDfGlD0ANfuAWXRZIiosz6iLC0XieDNGlW6enofRDCDYt98YHJ1UgsHgg+FqKfiR0CTCWwrzBdVm5SOV2+AHrp/bYVXI/Y/Md71Wz2/eV6ZyBxXbsE+t7x2JTtiZRddGv6M2CDwjPy+Qy54hPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7372aada-d4ad-1547-2e44-acb9a5a62bbd@suse.com>
Date: Thu, 23 Jun 2022 15:30:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] console/serial: set the default transmit buffer size
 in Kconfig
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220623090852.29622-1-roger.pau@citrix.com>
 <20220623090852.29622-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220623090852.29622-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0006.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f21f9edf-7be2-4b71-5d8c-08da551c8555
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2264:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB2264AB58B095375BB5031288B3B59@DB6PR0401MB2264.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vxX4QwuEWS31p8eJaUqX71m/m7XtxjFU/EA6aOEOh3HMsAwZ2onzr2yVBUqteL9Pi8QPK6McrsYjzUJ5AFqnCiLUKmzspoCFVPwZkblUuj68uFSVGwYzGO66sbj7ulzWRPxcslEoBamtwSy+GaH7MU/jcbOXkgKdaf0wYAQmewwi9ckKs3PqIlW+1Dk7jdXsdkgTXFk/My8lELzMDlFuPjkOWuNjVvvOMzLCGPjQk7oGnXMgZ0P7UjMXt7HoKUk6HSzDWuQ5T4cK/P9ZPt1nMjY9jD9wov4eK0rBIxkt9NQWjQXrPvMfMmqDphoj+aHUEXkBC1f2DZ9fuNEVVq9TObKGhgNZe1wGQr80nJLOLcNiN0PSETh11JNV702Chsd9rIMLt8onrCzINRarYKC3THRhmOKVmdKwRPDiDMfdT8Cgmpv9V1zAebEFHILeRKOOkDCRpRxxF3Qt378H8wU714Y3ZyKxfZbRTk+6nIqxnuPalaufHWhswfWXVa/AjnctvN4JrHNib0nfw1ML95l2ngvg1ugUe4SDZYAeyX5QriXXDevViS8FFZCKulB/zBlT0GMG/H8TTezXLu8UO1hsAugNP28bFi7/aLCVSe5K7VKjfNYEfO825gUVYAs1fMSkr7sMw2i+KoqVjeaf7+QM1yB8VelhXCdI5XmVdwiwRfkC/FvB+qB95mMb6S+WwIR80hiV6Vlm7XZTRpZ14hLJuHgkihW5xswB3qwHeGS/wCfotmoniGPmgeMtEcsQ7BObUeoupDhn5gQxlpET2pnn32GR9WPoeH49rHGVuLacCHU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(136003)(396003)(366004)(39860400002)(6916009)(41300700001)(53546011)(6506007)(8676002)(6512007)(26005)(316002)(478600001)(8936002)(66556008)(54906003)(6486002)(66946007)(4744005)(4326008)(2906002)(66476007)(36756003)(83380400001)(31686004)(2616005)(38100700002)(86362001)(31696002)(186003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0U5VEJBQUdCVGZIR2hpekkwOGMyWUcwWGozOUtKYlc0Nmo0Uk5JV3pGWlpW?=
 =?utf-8?B?bUFncWhoMXFaZ3VNM3ZRNm14a04wb3lJQ2g4TWlYTTR1Z3VxK2NJR2FoYUZ1?=
 =?utf-8?B?UlNTek5yN2c3MGE5VGJHY2Q4dVo0MVVGeDE1NCtNOUJvdTB0UjRYeHBwdmUy?=
 =?utf-8?B?TjJzZEFERi9WUEVlK1VENHFycUIxTXg1c3ZxSXh5b241bTltNkh3d0ViaDNC?=
 =?utf-8?B?Z1lUYTAydmNLOUJ6WFJoWng1VVIvV3B0SnIyQ3VSMXREbUdHM01ROGp3Sm5q?=
 =?utf-8?B?dGl2R01GUVF5dGlXSXpkWXpEQ2dZWXVzM3V5S1NXT2FaYjlVMlhsNkhOOFNQ?=
 =?utf-8?B?clFZdHdleDdzVVFmVXZ1UHdReGw4VFVra2JHNnFmWExDM2IwaWZtdzdGVnFu?=
 =?utf-8?B?MGRrZTRid2FxWlhOem9rOWpieEV2NW9HMGczaVlvQzdmeWp5eTVMUjdkbXZv?=
 =?utf-8?B?bzZ0dVRMK0hnb3E5YXlQcUNLT2FYN3FPbXArdjJla0ZpOTdOeFg2bm9hOGxw?=
 =?utf-8?B?TTRwSE9qSXlKMnp6Zi83bERqMFhBdTB3aUVHQTQ0elBhRjYvTFpEYTduRllx?=
 =?utf-8?B?ZDd4V1BTYjBnU3BuN3dNU0xycWhuV2duMzVaMkhLQ0lMczJqeWZxYlA5NjVu?=
 =?utf-8?B?TlFHWmFaR01aNmx3Y0lOaXlDeUZvc1piL29pNklsckJxTXFneXNwdVhDS2pK?=
 =?utf-8?B?TXhJd1lSdTE0TWh1VDBRSmtqQ1UxVDJYVTFTTmY4bW9KdHBsRnEyUHlvVHV2?=
 =?utf-8?B?RE9vNUg5YmVzMEt0TndBK2o0bkh6ZXo2MVNZVzNFbjJwYzNkaEQ1QlFTRDRp?=
 =?utf-8?B?ajF2TEtXdmxiMUxwd0pZUXdlRDFPbzdrOVNqblZoK1pBWUtOSFAvcHJIZXJy?=
 =?utf-8?B?RklveFZVZjFQM29IU0ozdERCakIwNjZxTFNjU0dqZW1YT2p1UkNCeDdSVE80?=
 =?utf-8?B?ZkJMSS9XdE5MWTlocmQrc0VvYTUxaVV1WXF4TEdPMHd6WEJLMHVmdTZBcTJr?=
 =?utf-8?B?bnBOZzlyMjh3a204WWRaVGxmVTg4T215bDVTY3l1Wk1HTlVZNDZ6VmxWa0R5?=
 =?utf-8?B?UXFMcUxQczVWcW9lYTQ3UXlid25jM2xBZUtVei9VeUlKcUs1aHNrRlhWVlBi?=
 =?utf-8?B?b3htVXFVM1drWVdLczBSZFhERURTZlJnZEVienU3RVR6eVl5cENNOEZUeC9p?=
 =?utf-8?B?eVZkenlVd0ZFd0dYT3dmQjI1dDM2MENTWm10aUI5c2dTUnBHMjRpcmFqSXRt?=
 =?utf-8?B?WGpQMytqYzkvNEFOVjdvTk1Kb2hZZGpGR2h3V1kzbDVLNEo0WitUNk5QV3pP?=
 =?utf-8?B?ZFJHbDRTVW10WkpRSGp4bUZEVkJOb0RmdFd5NUd2aUZmN0tVYWJwczk2NnA0?=
 =?utf-8?B?NU0wWUd6blJJUzl6V1RLR3JhMmI3d0tWL2NPR3I1N1dFOC9WNFZOQS90NEZl?=
 =?utf-8?B?eUxFdjQvSTZ0eXZKeWN2eXhvR0xVbWwzck4yT0ZQUzFtZ2pWemdsdXFUaW5y?=
 =?utf-8?B?MXpMcWV2K2x1UnJBcXNEeFY3dWdoTnZKWEhrWkVmaXVyakpLYUNjc1NmZDV2?=
 =?utf-8?B?SWVMbTlSQ2c5S3Bod2NVL0VYVURjQ2Z3VksvQkppUFBBc0U5eW5UV1lSSTJF?=
 =?utf-8?B?cndienpFYzllWWpvb1llVHRnYzFxajUzQU9IU1pMZzIxRnRmWVR6dE93UHdJ?=
 =?utf-8?B?ZXJLbHhXd25WUWx2dlo1anUya3c3VUt2MmkyZjBVTFdFc0dPdjBobUxLOGNi?=
 =?utf-8?B?RE5LMGJ1T3NObm05aGJUR2JTWXhCZ2lnaXhra2Z5SEkvNldVczEyS1g1aXNL?=
 =?utf-8?B?SktmUHNqYTVBMk05Ry9RcTE0YzZHcDZ0RllMWjJDTTZYdU1TaVFxb3cxUEVu?=
 =?utf-8?B?TXRnTnUwbDNSUjZFYnlrbFFYazFOeWV1V2RuajJkSzlJOHV2MlYwaUFlTGlV?=
 =?utf-8?B?UkZNdjBJbDlCbEt0N0VBVG95WVZYZEF3cWg0VGRDM0U5dFpVSzZTMnhEc0w5?=
 =?utf-8?B?MVNXajVoVnhJRjNPWEsrVHlSaXBzbmx6T09EbndUZnZPdUdvTkN4OEpTV2Iz?=
 =?utf-8?B?cjJ3Zjg1eGlVeU5HUVFUMUNoeUYxQ2ZYMDlpK3hWcVJ4dkVBcWFRN05QdWJ5?=
 =?utf-8?Q?qkLauR7Izb/bTzAmfTX+t2erw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21f9edf-7be2-4b71-5d8c-08da551c8555
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 13:30:21.2162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7aXrSg3g7mB1g1f2Svh81IS70RyBgPBcQx+lvuwpXqqnGFYeA92Wn9OloNkHDemGhIP9nCjx0YS+TSsn+DNqrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2264

On 23.06.2022 11:08, Roger Pau Monne wrote:
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -74,3 +74,13 @@ config HAS_EHCI
>  	help
>  	  This selects the USB based EHCI debug port to be used as a UART. If
>  	  you have an x86 based system with USB, say Y.
> +
> +config SERIAL_TX_BUFSIZE
> +	int "Size of the transmit serial buffer"
> +	default 16384
> +	help
> +	  Controls the default size of the transmit buffer (in bytes) used by
> +	  the serial driver.  Note the value provided will be rounder up to
> +	  PAGE_SIZE.

I first wanted to point out the spelling mistake (rounded), but I
wonder what good that rounding does and whether this description
isn't really misleading: serial_async_transmit() rounds down to a
power of two. So likely the value here would better be a log-2
one.

> +	  Default value is 16384 (16KB).

Perhaps (16kiB) (albeit the default value would change anyway if
the above is followed)?

Jan

