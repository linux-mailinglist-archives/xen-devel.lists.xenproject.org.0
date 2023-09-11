Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5DD79A9EB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 17:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599595.935078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfj5h-0000oI-Rz; Mon, 11 Sep 2023 15:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599595.935078; Mon, 11 Sep 2023 15:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfj5h-0000lR-P0; Mon, 11 Sep 2023 15:44:45 +0000
Received: by outflank-mailman (input) for mailman id 599595;
 Mon, 11 Sep 2023 15:44:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfj5g-0000lL-2x
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 15:44:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f29cfae-50ba-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 17:44:42 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS1PR04MB9430.eurprd04.prod.outlook.com (2603:10a6:20b:4da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Mon, 11 Sep
 2023 15:44:12 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 15:44:12 +0000
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
X-Inumbo-ID: 1f29cfae-50ba-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCNl+2nEiK/z72WT7/D6qRgAxrRn+i7mzVD4lWWx85TY6DY6999/RyDJI32Pez2bkFAXVATTTG5zlEYNYMRy9TvSVriITVTxccC6RhiDON0g5FW43S/swNED86wZuv4nmTk/um31CHFb7vCVsrVd8CVsNff3THX7adkuP1Ja5EXugB/3GD1MUgWfdVO+J1ZSIVziUWwdh8dTkL+Mnc0zub5H8rt1TGItY1BdQELVtXmCcsj0Le+HXi8hCB6i70BtJJrF9BIw0+lfSeP0UITRW2LFeZ+dsy+dWcZncdAOLEz0VOvmCIe0zlZMNOWQHyR1oj5wLdS5jEoxK4x7uRiMEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZr1sn12g7Btt4NaK9zM8LhHis5d1rFDYlAdBcRHDcU=;
 b=bV1qB69R+UQoWFJMFQwLpaC5Q/Xuu2gVy01j5cGbmhMcrpP/OIwLnxnkQNA+ohONvpp7g4yl5Br34FMYWXekwUqz0ccfmcJ3L7XO8GTf4hJxGoon1zHw5E8mRHtV1bTnmx/8s4ciipnb8sKj6mNVXP/Klfq7gPDGcXLDIiujOuT7/370RJV/O3i/8qnlbYEcn7I0rmtCzVliVSt4pv9hvdFdTuvgCDHFaAllQJU8ksM28Yccz3f6mmNxLRxgJom8AL0pjmgKo2VY7UhIqGTEkR+zoeueWGeD2aPdBzsFID4Tc0dwDkqiuVslvOVGikfYSjo6mGgbNiFmc4DoTm3vXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZr1sn12g7Btt4NaK9zM8LhHis5d1rFDYlAdBcRHDcU=;
 b=KlAQydAGTh5NB1RbONnXqQQPRC324ptCLtv6cov+lr7YT/zbi7GHqjB4P4EwsHVxYukEiaNrMKQYTXcVUlkmvYtMNGM3boRmYI835UyM70trQJPYWVE3QUuecell00HFNJmGoOsjBsl6bNJfIqvg/ex8FVnQyeRt3Kr34DNnFAt50AhwgxZATYJwAtOoAMS/HPqwXX0JvQL4Uz2atcClTrwTIinAe7DIiS9+TxDyUIPLeB18nokWEBrzuCKDcb8m1qGYgHDEZy99C3JKKnbq67uYF62Uh/21g8gxQPu30rbzFjNZ+WibYMftE3DvK0AFDN1MkdtJaE48OZk8BKgTTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <507af8fc-fe95-8dc3-32a7-e7945258efef@suse.com>
Date: Mon, 11 Sep 2023 17:44:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Ping: [PATCH] build: restrict gcc11 workaround to versions earlier
 than 11.3.0
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3a5913ad-c273-0ee6-11c8-9d18e9a4a84b@suse.com>
In-Reply-To: <3a5913ad-c273-0ee6-11c8-9d18e9a4a84b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0239.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::10) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS1PR04MB9430:EE_
X-MS-Office365-Filtering-Correlation-Id: af5576f4-4b30-4e4c-549c-08dbb2ddf20a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f1NVOMU5aS/MKEtfeyYmO3Q4if7Bk/9o7DBZAw3rFejTRaApVDUHiaw55zFYq2XFGDfscYKp4ZQZ/I8rZloj4kwD6amHIH1Qf8PviLHrVVs+Aja6LvbO1WMKqo4J9JNqt9xo7XTu4cAGoe2cR5SJOxCC1FleCE+/HI2YAAdr8Gh5T2LSihLiMn5uRN534LHYbtMOZqXTRe0OP4nFYa3WImirqe2d7M4y2lr1xkBz1XkBZThR+0PU7ZQIcJdDZe1oO/KKhVMOmK+mxCK+ZpHdJIesBFdShatHN2JIHHYTuolvyq+NR+DEAi4KWrDgn+VUz3ZC7Czi7a15Zk80K5j2Ledot2Chgs5rcug6r+wbMbl7lzEZXxkjtA4GapiMbdv+ZmsPMTSdZ2yJOksor5IjJVSrQozSrlIZDZg/9AUKXUKZ+qgKlid2z8h2CBZaF866q7xAk6SGfuh9NMhkC0nioVi+NMufG7ADEDBDOK3XCs02BWJwdssauWNrISOx1fJxmqPaq86gKydBpQ1wg+u4Z+m0uyJzcLn1UWx8h/5Wfo/3QEw1c3MAJn0E2ONfWL2Lo2b/8khPxK/R6ojWLxhiEeaMbYpr7l0XT2oVNKyZFQyXwSRKUzGmpIshpUsh8K9axwhzkEYS2KZcnWJ9JjNtoA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199024)(1800799009)(186009)(478600001)(31686004)(8676002)(5660300002)(66946007)(66556008)(316002)(66476007)(4744005)(8936002)(2906002)(41300700001)(6666004)(4326008)(110136005)(6486002)(53546011)(6506007)(6512007)(2616005)(86362001)(26005)(36756003)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVFXOUp5QWNSSDcwMEtCMVF2SWZ2ZzlnS1IydkpyQnR1aFdER3VYOVFwZXMv?=
 =?utf-8?B?dXhCTFlzVUcvT0JjbWlkanVDZllwa0NkdVJGVlhNKzVXVFVoZURyVU1zekJ3?=
 =?utf-8?B?dGVjL3E0WHQ0cGptbzI5UXVYNHRETmpleHJrcy92YXhwTVF2WjNQUE9VNEtW?=
 =?utf-8?B?eGllSTg5dHNBT3pveTRHdlFDQ09lcm1ZNnJuTWs5V28wbmVSeUZ4Ry85WjZS?=
 =?utf-8?B?ZG1sM2pBYWE1eE0xbXhUQllyWHpXc3RSN2orbGxXMGM2T0VqYUcwNHpUTnlx?=
 =?utf-8?B?T1JSUE1YVzFtTVpSMHdXTzYvOHM4cS9NUGkydng0bkVVaFRXZGhuYzF5YjV0?=
 =?utf-8?B?V2wya0FIdjMvVTRYL08vVjk5eEY4Y3p0Vy9ad0pMdnFtYUpsdEVzSERDc2xv?=
 =?utf-8?B?NDVoTE10UTNqVkVjNzFBOXkwWFZTb3lGL2ZYamJFZUlxVWVoc3BINjRwc1p3?=
 =?utf-8?B?bVErQzl5cWgwTTJxU002amJSWUx5cVVYVDNEeFdvYUhsdFVQNE9TSndmU2tB?=
 =?utf-8?B?ZlpQOCtCdzRVZmN4NkRNVTR6QWJjSE8rZElKV0g0TDNZZ21SRDRTSXZFK0h0?=
 =?utf-8?B?eU5vMHVpVkhRTHZ4ZFladnR1ZVVkVjM2TUN4WWJaamYrQUFFczhGT2dHWG5r?=
 =?utf-8?B?TlFodmFuQkp6OWViM2FtUDJQblJaRW1HUEpYdDhnVlZaeXJDcDNWZG9MY0NK?=
 =?utf-8?B?NmZJVEsrTDEwOGlSa2F6amp2SnExMjFqU3hZclhHdE9SRGVGK1hUeEdtR1JG?=
 =?utf-8?B?VnpzOUJEVnp6QTV1S01TYllvNnVSZ2dJdThFaE9kMHZ3aFp0NjVrQWFiUGgr?=
 =?utf-8?B?UWhITjVUOXQxOXFiMmw3SGR4SjN0MjlOVCtjMlphSjltVE4zb3dCNWNxbEcv?=
 =?utf-8?B?OHcwbFUwSkhlc3docERxbWdtM0JqYWYzQ2thanRnUUhsdlpLckxtQmpNRTJV?=
 =?utf-8?B?NDhHVUVpL2hlV0lPZE1IeXlpaHZ2cXFsS2pxU2QxaHRVZ0ZsLzgzN1cwMjNt?=
 =?utf-8?B?UlcrMFFaVHNreTFQaTlHVTBsVS8xQTB6V1JVbmVpN2xlbGR2S1c0WTJtQWlB?=
 =?utf-8?B?ZXpoTkdqVFlhRU9PVVRrTUh0NTkxR0htR0FBWDZvWUpEMjFuT2JIU1l1MUho?=
 =?utf-8?B?Nm41dldXYWRRLzVETW5XaTVLRi92djhTQTR2RWZwbG1PYXhjQU5wMnZPeWFV?=
 =?utf-8?B?TXhZbDMrL2g2a0RUZzU1VmdFRCtlbmQrM0R6MUZHLzhkQ2VzeGx2Z0pTaW51?=
 =?utf-8?B?YjlMRzJoNWFuVzl6UTBCTG8wUC8vNTFabWRQeFVyeHdEeFg1bDZuUGtTbGxN?=
 =?utf-8?B?VEN0eENRYUEvRmdGV1RNVzA4V1dWZTVnRUJ3SC9CUDdtclBPUWRHbzVqa05t?=
 =?utf-8?B?STZGejJabWprZjExdWMwNG5tLzc1Y0c4Vm4rVVZ1TC9NQk91dGdaRnRBdith?=
 =?utf-8?B?REtDYTRNN0NoVEx4eUliblNaSUpZS3VBdy9RMXV1aDcvMjB6dHFlY0Job3JH?=
 =?utf-8?B?OW1QdlhwVUxNMXhEQ2c0NEwyMFVHRnpvZ1ZOcXludVFDbGZKOThMai9iWllo?=
 =?utf-8?B?TlkxTlFmbU1mOEtydk0waElpeXBqbUljNUEvemFyRGlUS2FBczRTWGRmK3Bh?=
 =?utf-8?B?cUQ5Zm9ya2FuZjMvUk02TWVkaFVvZVhWT1BzdlRQUVN5amlZN0wzL2xHdnZD?=
 =?utf-8?B?TTg1U0V0MlBORVo2SUVUYXNiUytQRWNTeTAwVjkyNjhZN1Rwc1hmQnNrWHpH?=
 =?utf-8?B?bC9QQnBGR2xpN1RKSXY2NkExa09RTk1KSVVTU3hxQ2F4YkZLbk1hZC9GdmxJ?=
 =?utf-8?B?TDJuME9GM2thd0UvUWxITldDdmZxd2QxMWlJcnVPK3UvNUU4SmdjWTkrS2lC?=
 =?utf-8?B?UDZrcDJiOHpJS082ZkY1NEc1VEk4Z3pZQzRKaUFlUXZZYzNFdSs5QS9pdnVE?=
 =?utf-8?B?c1llMDRMb2dOWTlpdHVDN2llTVNtemdJdHdoODBsZkhrcnpmSVJ6REI3UkVD?=
 =?utf-8?B?K1pyMG5yWHlqc2REbnhRZCtHenRqb0FhaTgwYUxYaGswa0VWNjc4amtCRkgx?=
 =?utf-8?B?OFNQNmxqbzcvQTJKY3p6SWwvWkloVjlvR3dSTzJSMUpYYTJ6ZklJaTdsRkRn?=
 =?utf-8?Q?f0cpuvvpfRlyCRznZuh3K5SBh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5576f4-4b30-4e4c-549c-08dbb2ddf20a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 15:44:12.3245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5n6Kvtn1pHzfd8iDwFzSiYVmqjueiL65fgxQAD7EnrfG7YahZMcu1W/ge6XipYnfsI1nj1oD497+HXKxE3etWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9430

On 22.08.2023 16:40, Jan Beulich wrote:
> The fix for this issue was backported to 11.3, so let's not unduly
> engage the workaround.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Anyone? Please?

Thanks, Jan

> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -146,7 +146,8 @@
>      __asm__ ("" : "=r"(__ptr) : "0"(ptr));      \
>      (typeof(ptr)) (__ptr + (off)); })
>  
> -#if CONFIG_GCC_VERSION >= 110000 /* See gcc bug 100680. */
> +/* See gcc bug 100680. */
> +#if CONFIG_GCC_VERSION >= 110000 && CONFIG_GCC_VERSION < 110300
>  # define gcc11_wrap(x) RELOC_HIDE(x, 0)
>  #else
>  # define gcc11_wrap(x) (x)
> 


