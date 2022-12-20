Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C456521D7
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 14:56:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467053.726045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7d6U-0001Fz-Pp; Tue, 20 Dec 2022 13:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467053.726045; Tue, 20 Dec 2022 13:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7d6U-0001De-N2; Tue, 20 Dec 2022 13:56:22 +0000
Received: by outflank-mailman (input) for mailman id 467053;
 Tue, 20 Dec 2022 13:56:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7d6T-0001Cz-2u
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 13:56:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2048.outbound.protection.outlook.com [40.107.6.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 147205b2-806e-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 14:56:20 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6976.eurprd04.prod.outlook.com (2603:10a6:803:130::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 13:56:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 13:56:17 +0000
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
X-Inumbo-ID: 147205b2-806e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOnY/vSZEXO6JDHof8AlbcgsMmUnuS39iqWIasuLvd5Xw3wAG0BE8yz4YeGZriPAXF5dJSfj1m4yfk09W7JkKpiqFJQZKAIJU2R3UShQd6dVRRWAw/utLojZ1vDJjxlkFWxXIuQbBVWU4gFrTWymoNtVdMnD+GgXBhnW8EYoyJExAMft6/t205ugK9TQgcdL9opOtBE9PXJXZi+nI/4p7bBggA9OUUXidP2J08X+uRFdBlVu6AKIkr0wkR6uDMwHJf1diqVZhQUcmH9veFbJovUJ49HHV4k54JRPg/0rmIm6K120l0953U+WzHcpvcNpVxwZ/OgGR4p1CkbunDh7KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZ31w3lhrZVNvOvtH6RU+qBBkb2EY/fUiZ/rB9hGLVM=;
 b=D6qjKTVzIYv9lpftRLeL2oqiHDjUEhqfJOonmifT+TeNSZ/Y3rW2yamr74BhbJrLhm+fDI/G4vYVDwS2Q6hyseybAkYhzQooN5ZmunBKukMDLd9zwudg/ukzNHkNub8CFudb/nidIEYPEscd1uDTS3P4x8BjXl6nybkwyxSU1/5IBfHPgJbuP/gPxCGzbrSiskay4cFviIXzurg4nR3t8W1T4ZyTlHm0GdMQKmJNTa8R2AyvDaofaxWhpJcmEb5XEqZervYK4K00o/pbCb/cJAwEmya3VfCfL96sbrpszIz7cYyQGV90HG2DFRDzJsn7ip/7KyVpQaXem9CzjajjAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZ31w3lhrZVNvOvtH6RU+qBBkb2EY/fUiZ/rB9hGLVM=;
 b=jZNjhryNenH4yAfMcBGiXHDm8wzoZwDPZj7bh2XOQwA8h/cYv9kZaGR07ih+wCbQYrnBNC3hoBEnr21QdqExxF3St0NCfTtqG7sIPOdWtPgY4hDRSIs9c7ZFnah29ZzgG0ZkGAMsI1YF/Dhwk4yhLctQtV8xknL2dJgp1iyM3NqJmsTCims5IShSTlNSbV0gTuD+EEzo+jKpd5LM564DPHWptToJlzZ7TCUAUGO1DoVZJkb3OBmMihuOLwRS1USJwhZKzAxMdDx3MNebe4cfb8/pS/WeoGL1bncgqPtLwTBcpyKRy6qFCTwXk7wFhUZJl9zKdRmx4UvNBDf1ccbQJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bcf75dde-89d1-b97c-dec9-ad8f4a370765@suse.com>
Date: Tue, 20 Dec 2022 14:56:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/3] xen/multiboot: add proper struct definitions to
 typedefs
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20221219144533.19836-1-sergey.dyasli@citrix.com>
 <20221219144533.19836-2-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221219144533.19836-2-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7373f1-09a1-4a20-3d01-08dae291f744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A1Cc5jeqngktyiir25iwbGgjvuOfqbuaoIm3Dy2UxphClK0qWV/A1o6H/nVpGKrsFd8p+EW94LdujdI5cF4xy24rP99b1+4VyohCLyhxTZTnfj/c8M3SYlrG9hE7CNYfKfUdKDTKApz6RQJrYwbRbU8t/L1nX8u4EHVsGFODvfkE13Q9yPuDpDOYKzrBdPbw4auX2zfNr4g9B0mAlnj5bXUpQ4+nzAbRn9Uorre8YQmcz0xyL7iA/vR/Ns+c4R6tDzZhIyRMhiVIwA9M6XGnl111JIkZ8vdmbEdOo9jg8ywnK1K+OPxJuaeESM8+eyN+P8vuIEPM8XVwFMy1y5wL/dfG+35E9CMrqSpzRLv7rKuaB2tx4TNnK5TicIg6/13sBN5lS8+/DrHfuio7RD1EhBm+MdTxUTetue7eJCh5qdsKLMUBCYecHGXW4NzyoKfW7lJsOpF8D4xDjzh+CR02Y8QrLytW5htYVK0RspyC556jL8FxTy5bu61QURFvGqg36j1faWznzCD1NZKUNYFR40seHY9rRv92JXjiUFFryQ9g/Xni9deeh1UDO2j9jmayhTz3u44VB/bWwqLA36e7ILNYYrlXY+waIE+JQ2yLCeFhgGj2cSe09F08DkEyH9EyVWtOKQL6PUoiG3XVAJbV8qIU3pXzhmWUbChmiWcVpX4VCQDo1HtWyROrJl1rnh28W3O+idwH2+m9ywROuC3bqS7YZs5iyDULjE/v/W9GTCs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199015)(38100700002)(5660300002)(316002)(6916009)(54906003)(186003)(8676002)(4326008)(66556008)(66946007)(2616005)(66476007)(31696002)(41300700001)(36756003)(86362001)(26005)(6512007)(478600001)(53546011)(31686004)(6506007)(6486002)(8936002)(2906002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OW02YkExWXJkRDBLdGgwaVpXUVVwVDVTQTNHK2VaSlJmb0Z2WW41dm9NZndT?=
 =?utf-8?B?WG42K1RPRllUZ08yNFVIL2RNamgvQlVLM0VuQWFVTG9vUDBFWG52ai9QTXpr?=
 =?utf-8?B?cjQxWGZpSW15bWc2dnZFeFY2U0o2ZFUyOWtLSmtjUDZJR3ljN1RYUWhGcTFr?=
 =?utf-8?B?ZWIyYzdpTUdVMVlHcHB2bGluaGRNaWloZ2tFZU9RVnM4RTZ6d1lwSXBTZVRK?=
 =?utf-8?B?ZHUvTFVseDhKczNBUmZMcmJyY1NxT1hwQkRDTUwwS0YzemR3NVoyRC9NQ1VG?=
 =?utf-8?B?QnA3OVpxMG9UYmE2aUoxNVpKd1gweTE5R1AxciszZ0pCNjZCUFg2b1N2ZS9E?=
 =?utf-8?B?MzU1T3dxZGJSeE1rYVR1ZzJ3TVVFV0hWNzUxQ2M1NGFLVi9Yd3VIbU9IVDM4?=
 =?utf-8?B?emUzV1llc2czK2JzTGdRcWMrR3lIK092dHdXZVlnWDA0emFiOXM2dzNqSFlT?=
 =?utf-8?B?REFSRmdzT1JIeXdqUElZOG8vbUpSUTc1VHRzM3QveDVBOVdRczVMVHR5b3ZX?=
 =?utf-8?B?Y1Z5eFprRUhRZjFZT1ppYlhLcGNGUG5pT0tMak54MzI2eWF2MlpyTkhTUjZp?=
 =?utf-8?B?cDd6S3VYcEVCN0NRK0JXbThNcUQxeE5oOVlEVWZCUUVCT1g4Z2p5aXJSMUd6?=
 =?utf-8?B?SnBGeFFhVjM5NzVWL0w4L1dWc21CMmZ6WHNrSDQ2L3lDMklmWUpxQjU4SGts?=
 =?utf-8?B?d0tmOUx5ek5GK0VUUU5WQktzV0FLR0pVR0RBdll1OUdUaWYrdHN6R1M2OUgv?=
 =?utf-8?B?OEJpYm1ueUF2Znludmw5cVErS2JxZTBxb1NnOFpwQjNkZ3M1ZEgwNGZzeFZW?=
 =?utf-8?B?VFhSaFhOZGpPeHFoL0dmbFNqOHNSYmsvNVN2KzhPbzVEZHB1Q3FONnEwWjdU?=
 =?utf-8?B?anR0QnN6Q1NrSUpYVEpmU0ZyMnRhTllaU01iUkNua2V6NDZYL1JMUi9hbG5t?=
 =?utf-8?B?akdQZnNvc3dOd1Y1YnBDakxuMW5tQ1FiRzZiZmhUKzFzTk4rY1ZqeWI4SHU3?=
 =?utf-8?B?aGR4N3l5SkVYTnB4MnMrQ1d0VGM0ZFN2NVE4REs4b3pwYXh5WHROczJRRlAr?=
 =?utf-8?B?OG9iZThpZ25HK1Z3Q1ZkZitmR29wM1BHTC9KMkhDNmxwamV6aEsrU3d0TE9E?=
 =?utf-8?B?UjJBRlU4aXNCZUljeWpONzdBaUxNOTNaVkZzd1RWN3NZYTcrOFZiR0ZMUm9n?=
 =?utf-8?B?K0xCMGJsS3VqYW8rTFAySWs3SWpCQ2duc0ZSNXpKK0JjUVRNUVYyRnFVRG5N?=
 =?utf-8?B?QjJMa3hGWXdtMnI5UnVOZDNQcEV6QkVXTDZrZUdJcVg2VW90QWxEMVdzSHg0?=
 =?utf-8?B?amhaS2tHaEtGc2NJUUFoWUxITWlJcDNmUlNjWCtMbTlJMkZqTHpTaS9WRnhK?=
 =?utf-8?B?cmgyNVNxOHcxNUdMWDRPcjhBbDRUK0ZCWmxYNWlZUWRVaEVqLzREbUJ1S2o5?=
 =?utf-8?B?bGYxS0V1UjRCdTNOa0FGWEtoUDdLRk9DU202VVhMVmZJb0IzQUpESWdNSHJN?=
 =?utf-8?B?aDV6QjZkR0tvRmk0TWZiN2s4U0lHWWM3dUIwdUQyQWx5YldLc1pML3BIY3RV?=
 =?utf-8?B?VTN6ZTBmTTNWK0FwZnErVjBjd0pza0h2MVphMEt5VXZFdGxCOGwwekhJV25q?=
 =?utf-8?B?c2ZrOTZXNkMvQUZqalZ2cWN5SUVQRlJibVpJZ1drRkNLellIK2ZSWnNJK1hG?=
 =?utf-8?B?SVhIQ2p3QWpoYjdETndmdDMvcHpnS3pEaWlJOGpBblU5Nm8xYkRUazBReGZh?=
 =?utf-8?B?Mk52M2tVc1BHWlcrY01WSUs0K2JkemVFVDlOQlZtS1ZHd3RkSzhjNm1MOTBD?=
 =?utf-8?B?Q3NCNjhrZXZhSm1BRFFXNGV6Z3pRaFF2UVREMjhVQzBTQ3RWcUpsYjhkaTZ0?=
 =?utf-8?B?cU1CWjhhT2VueG8wS3QxSjc0RmQ4UmdpcU5SMlhrbFBwaldyZzk5amIxN2J3?=
 =?utf-8?B?UWRPYmpCcGl5cUMrQlZGdGlxazkvaFQvbi9BMU53Y1ppV1pRZ1JrTm41UlZi?=
 =?utf-8?B?YTVqVWJDMlFzU2VFOXlWR2F4UTFZQVJhdFlzNkdONWFIaEJjaGx3Vzl1cWtD?=
 =?utf-8?B?a084L2JKZlpVVW51QklUa1dOcXMrRHo2Y0N4dHBKd2Uzc3ZoRHdIaVdUVEp1?=
 =?utf-8?Q?hFyvrhkEK3HKEUpT9pq/a9Y38?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7373f1-09a1-4a20-3d01-08dae291f744
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 13:56:17.4176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IyRKJamxqfOVU52NM8aSglsHY7KLoDUldyxo2til1zychgrCLFtUCkFzFNAKNMo6BZC6Uz4yfx7YjHLNn8+0sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6976

On 19.12.2022 15:45, Sergey Dyasli wrote:
> This allows to use them for forward declaration in other headers.
> 
> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/include/xen/multiboot.h
> +++ b/xen/include/xen/multiboot.h
> @@ -46,23 +46,25 @@
>  #ifndef __ASSEMBLY__
>  
>  /* The symbol table for a.out.  */
> -typedef struct {
> +struct aout_symbol_table {
>      u32 tabsize;
>      u32 strsize;
>      u32 addr;
>      u32 reserved;
> -} aout_symbol_table_t;
> +};
> +typedef struct aout_symbol_table aout_symbol_table_t;
>  
>  /* The section header table for ELF.  */
> -typedef struct {
> +struct elf_section_header_table{

... the missing blank added here.

I also have to admit that I would have preferred a variant with less
code churn: The typedef re-arrangement really isn't needed to fulfill
the goal pf the change.

Jan

