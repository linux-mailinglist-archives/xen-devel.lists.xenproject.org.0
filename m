Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03E0616363
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 14:09:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435934.689890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqDUX-0007Te-Q3; Wed, 02 Nov 2022 13:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435934.689890; Wed, 02 Nov 2022 13:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqDUX-0007Rm-Mp; Wed, 02 Nov 2022 13:09:13 +0000
Received: by outflank-mailman (input) for mailman id 435934;
 Wed, 02 Nov 2022 13:09:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDWw=3C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqDUW-0007Rg-97
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 13:09:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a3db6fd-5aaf-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 14:09:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7250.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Wed, 2 Nov
 2022 13:09:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 13:09:08 +0000
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
X-Inumbo-ID: 8a3db6fd-5aaf-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCdWolnxcn1CkZ/dF50qh4YulwkPbc/tWnOry0yjv1vd9RxKwgPT2cf0osgYb/omBH5/vQhurTZP6sEg7PcmCIOunxDSXLTDg+uPqJYmWtjPhrGgwVd8wWWqVaasjbnOND9JZVmpcRVAfvAVIewDp1ORD5TZXOvl+Ln25yTU3gQ1HTYjsQ9dngtGrtrNiHLs0NqJN58befBR5bxSOWHBBnigx2Fre/JUPNk5V1ZuMDnLHbi4TBlHKIerD7Rf4/bSh3yYdYb6ie1Asq3H7XCWxysV2BJLZbtKTz/3AdMzOLAq024C2jhApwVShPJMMHis3wDmT9zjdKfbp/T/Wo59Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7PjWG5zhvwbDgEjsAi6R7qZWOIjGlDWOcgveurhg1k=;
 b=FBMa1Wt5MMYYLVGv2LWHkTt6a9jU6/hKPi99BaMEl90yzRCgM/GctLMDOiyzIsH6IYS2mcrrqPRkM9Ud2yM5D4S/HDbj2N9gGtQQof/Fmm7XVm9a2tpLkRUYpDt6cxWqLJ3emrd6vVBpwJ4+rvgm3+AAf63pWfCPHXryrh5XdZKYQ2830Y6NQMMQtqRnXq0lPanKfrY+jPuiiJyMl1cXAPfZfTjtj0im9njQBy1i5PaTZFA8hu58yFId7Hbi2i4cVAFiN50q8Doml8C26AKc03tn0vnHbl2J6zpa0uZXvhkqsAGV75kDBngKcDTeCvJkSFRWzGkwS2pCdax3Pc3NMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7PjWG5zhvwbDgEjsAi6R7qZWOIjGlDWOcgveurhg1k=;
 b=tCPJemhU+5d7fgmaruMEbX0nZBLeQb5eoVAuPTbuiXsUpJPAEDOptfxXFefW4Ke1uFkV1q9ZPTDS2IDS9Lxzt852ElCKKAOhBLBUuoB6Up/SYMkVQDGqpOr3oPKNfecqDl90F+KIXV+L2WecMC2LrtW478oQhkUFJRnt+VPs8FYOcjYGEm/PaF3mj+9ZE8V+UP5rVMi97JPStEhb0L69G5KkQmb1+GS5uW1Ez7jOafuKQHas8rPlF3I5qpiQCAh5tngsu01glJTSQtM9Gk2aZVNpVaTTuV82iHfaq0lrgcvb4jLl/NwoM0iELj7Q3zncweZ/IKNejFFbt3EUQRbmKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <619bb7bb-a60a-5f13-53da-72e1d3a4aaf1@suse.com>
Date: Wed, 2 Nov 2022 14:09:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [XEN PATCH for-4.17 4/4] Rework COPYING installed in
 /usr/include/xen/, due to several licences
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221102112854.49020-1-anthony.perard@citrix.com>
 <20221102112854.49020-5-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221102112854.49020-5-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0015.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2e0187-1d15-4ecf-a1d5-08dabcd36d11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bISqUmoa29kQOGht5kx8tVNFRm41wiVzT836OwBREVenN4sP/L24kKQjFC/8g9uglf1US1yLH8Devu59jcceUQxa4LEVWSlHpCJJ3e0wUBT6WA+u8Qho3Nvca4Kt3YYvvBtZEdG7nuFmE8mL0aiOzcQdrPNZUYlkgtAV42EFwucqJaR6YTpfmK17jgTIWDjFqMMLBt8tyr0if7oD1fbBEKTXL0uPNQg0gsk/WRmstt2+k/JKVbrwQsps51Kc4IwQtxXDjIGpV473sISe9wePRvrZxWyLves+8AUGpcTIKb/MMuk4OpbLdAXUcbfdmIqiq1Er9CkTg9SZsnPvUMjNJGlJQKZSAaFJ9sWWwIcaNOEtW5I4sp2SvELzpNfyqQKW+LEisthh3qZUhunI/lanlj2lgXjmQ2k3jvA5m4bDhS0VhjvgNXTRoEddEf71hrI7AK3JC/m9VqSvzNGnpjpIum0vSHHOKDpt6zekCrjW/PQ4j6N2PHB4JaE429XSMFSIlL0tbNY74QYP2/w6zEA4qAsOrB+drSAlECvLiFehAfncNrJ7z2m8LeAH4HF61kU0R9yTTA6WgXq+N9062ie14caBpWn1MKcL+7czjQ3kc7uIi+jXPZEKUHOhw9AtoH6nL+NBMe50QJIRmtueyvuahEaGp0KzG8hMcDyYZvJnJELMiiIbndpCrPTNmgflFcrmnmmzPfRwrNjf/hlb2Ipls8XQMHxiYiIpa06NEaTys+uoi93IgUMBPJrIlSwA6ieM/gYB2NURVGUJIh55VAHWSByTR43V9r/c46BmUb3HPpbqQIiBkg5cu2GAj+9bqkF6/BE0IoCr1npoZEsK/1Hc9RrhSMcU6RGpbSw9py6/5QQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199015)(66899015)(31686004)(2616005)(2906002)(8936002)(5660300002)(41300700001)(8676002)(66946007)(66476007)(31696002)(38100700002)(316002)(83380400001)(186003)(53546011)(54906003)(6916009)(36756003)(86362001)(6512007)(66556008)(4326008)(6506007)(26005)(6486002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1dOWmg4NTBLdVlxT2dHWHVjVDlFQ2gzcW5qUUZpeEJxM21NSE9nZ2tZYlpO?=
 =?utf-8?B?K3g4Y24xejh1NC9uYmY0UDBBRndodE5EMGcrcENxaTg1cHc2VWRDMUJNcmd6?=
 =?utf-8?B?VXd1NTdrMGlQVEhsT3N3V3BPb24yTFdiRXE1VUNzazJGRy9wMUlzNVNMWTEr?=
 =?utf-8?B?RE92WWxmclRhVDJZVzlydVhMc1dRaExqb3kzNFpZQUZ4TFBEaEcrNGpRMHJX?=
 =?utf-8?B?NVRWZ2l2RlBNRitTdm9tamVVaDJ0b3FvWGxaM1ZyTnJpNXVWWnZlS0pzdDB1?=
 =?utf-8?B?bVRXMytwN1FtZmh6ZXp2OWhDWVl6Z2kzTUdzNFNFUit4QUtFNjBRQk13UW5l?=
 =?utf-8?B?SnNGd2NSOW9WbGFRZlF4dUZHeTNCdFV0OXc4N0Y5SVJvZmt1QWpKejdIZk83?=
 =?utf-8?B?aE8vNVR3QXpxVEYydnU4SGozdXBjV09NYlJkUlBvYm1BUUY0RGs0Y0kvZWtK?=
 =?utf-8?B?ZU9UaXZ6ZFE2V0Fpd2QwZzBFV0JEd0UwanBtY3I2U2lkOXcydVZTemt0bHNX?=
 =?utf-8?B?Q1JteEFGT09XNE9IeUEyTFJTc3NOeE9mc1BjNEJzWFAzdi9QNzIwSWM0eFFB?=
 =?utf-8?B?R0g0NnpNMDJjM25aWlFOQ3ZWaXlCUDAvWTJDN2xRejQwV1poV1hybWJiR0VV?=
 =?utf-8?B?KzN3WU96QkRyVXhtZmdjTVlqSVBFTEZFcXV5WkY5eGhvMXFlNUdxSU9xSmpj?=
 =?utf-8?B?Z1pCMDhVTWNuQ1pxcjZkZ09CUlhpVFZxYWN0Um1pR0ZRalB3M1M3b0lUNzdY?=
 =?utf-8?B?Z28xK05UZG1kOFBTUEg3QTh2SkRaSUcybWszUlladXkvOGNBZER5Z0V0d09i?=
 =?utf-8?B?SGJpTkduRTkxVERvZEJibVExdDRHaEhvV1VheWtLMDllN2V3Wjd5VTMwQWxs?=
 =?utf-8?B?VFIycGRMY2FDUkNEc1JaZDNmOU5wKzRnTENFOThCM1ZaTWFhNUszRGxTbjRx?=
 =?utf-8?B?YlJYVGZiRHNSSWNHVWk1QTFYNldnZXNQemJnQUdMdzM4WU01UDY0VWJRYlZ6?=
 =?utf-8?B?UnYwSW54NUpFUHVsc0kzbitJbWV2alJCVXlZbzRyUmdxa1lFL0dEbE91RXRB?=
 =?utf-8?B?Q3VUbDJaT0F2M0tzRE9KQmdRYm5DbDN0S0NIY2hyYk1DMkY4QUlqcWRJNmRT?=
 =?utf-8?B?NEVmek9MZkduY012NnJXUGNFZEJRQmNrdEkvN05JQ2R4SXo5RzlBek9RamdX?=
 =?utf-8?B?enVhUVp2MGs4NHRIdFBKOWVvY3ZVSllnNU5aZ3M5dGNReHZ0eDVkUEF6bjBJ?=
 =?utf-8?B?akhxV3pGZVdocFFXQVBOMzQ3MlFKZWdrR1B4S2I0QXJ2Ym00eXpIWkRTSFFF?=
 =?utf-8?B?bEFuQUZERUhCQ3VsUk1zSURzcWhoeU5vZUZxVCsyblhzNmkydnR3NkgyK1pG?=
 =?utf-8?B?b0xLQ3MwcmZ0VGhteFBjTTRDc252TE1STEtwTDZjaTBYR2YvNHBESjdIdXhq?=
 =?utf-8?B?c0NnOWx5bU1pd2xLSDJybStxWUR3ajVWOWlqdzF2T29JdUdMbmRTanpCcFZZ?=
 =?utf-8?B?UjZINUErekYvc0dBd1UraDh4S1Z6WXhUM0w4ZHc5UFpaRnlnVmZJeDhwSGpQ?=
 =?utf-8?B?VjVxVkNlS2VOd3hWSkZ3K3k5WXl5UWVsYmdPMHNtczIyWVlQeTlsd0xIS3lE?=
 =?utf-8?B?MFpiaG1jd3NOWUVpdHdUR3BlWlkzTGhYVnNiTXlQWUJqUWh6T252akg4VUVV?=
 =?utf-8?B?a2lqN3U3QlErZ0VHRXNoYzRjUjhGQ3ZUV0lpL204Y1ZCQTVEbXNuTkw4ZWNL?=
 =?utf-8?B?VVNuK0QyMlVKVnNVcnY4emN2NFE1YVdRUk5qazVDZFM0SzBVV0grdnpWRk1z?=
 =?utf-8?B?TGloSjJBc0dMeVpzS3c2eGs2cVJuTDRmbElZdVAvdzdpYmNuM2MwazlGQ0Qr?=
 =?utf-8?B?WklJR3RYR3AvbFpsRzRLYWdzRUlzRkZTZE5QVHM5Ui8ybERzaHVvOHVJbHFp?=
 =?utf-8?B?UWVjUlNQTmNodUprZHhhNmtKME4waWJZdjdVWHJ4NXVkRmlOa2dLYnB4bzFR?=
 =?utf-8?B?dUNycEo3bkF1a29VdUE0LzNCYVJidDg2TmRnZitzcE93YlFRenVWYytaRkxx?=
 =?utf-8?B?UXNPWHZSNXZMeEw0WTZEY0NvNFk0UlVqYXFqcHV3VGFITk5RTnFDYlMzTzVV?=
 =?utf-8?Q?tKeeuazBcOun/6XHqeKMyvJlp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2e0187-1d15-4ecf-a1d5-08dabcd36d11
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 13:09:08.1902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmnDJmSK5r6Z0ZUKjuP357s2zyN6J8Z2eQ1NpOpP8OZKqcOe1swz5gNJQU1wERuDKHGfN3na8rYK2E62qcf+PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7250

On 02.11.2022 12:28, Anthony PERARD wrote:
> --- /dev/null
> +++ b/tools/include/xen/COPYING
> @@ -0,0 +1,26 @@
> +XEN NOTICE
> +==========
> +
> +This licence applies to all files within this subdirectory ("/usr/include/xen")
> +with the exception of "sys/" which may include an header under public domain or
> +BSD-2 licence.

Nit: s/an header/headers/ ? And perhaps better to not name the two licenses
here but instead keep this more generic so it wouldn't need changing if a
header with yet another license appeared?

> +=====================================================================
> +
> +Permission is hereby granted, free of charge, to any person obtaining a copy
> +of this software and associated documentation files (the "Software"), to
> +deal in the Software without restriction, including without limitation the

I understand you've simply copied this from ./COPYING, but shouldn't it be
"limitation of" or "limiting"?

Jan

> +rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> +sell copies of the Software, and to permit persons to whom the Software is
> +furnished to do so, subject to the following conditions:
> +
> +The above copyright notice and this permission notice shall be included in
> +all copies or substantial portions of the Software.
> +
> +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> +AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> +FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> +DEALINGS IN THE SOFTWARE.


