Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403A47D0830
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 08:18:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619656.965101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtipb-0001OM-H9; Fri, 20 Oct 2023 06:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619656.965101; Fri, 20 Oct 2023 06:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtipb-0001Mg-EE; Fri, 20 Oct 2023 06:17:59 +0000
Received: by outflank-mailman (input) for mailman id 619656;
 Fri, 20 Oct 2023 06:17:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8lwx=GC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtipZ-0001Ma-VJ
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 06:17:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68e61053-6f10-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 08:17:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9871.eurprd04.prod.outlook.com (2603:10a6:10:4b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Fri, 20 Oct
 2023 06:17:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 06:17:53 +0000
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
X-Inumbo-ID: 68e61053-6f10-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WevBsIbsNg6wrcjL7zvP1LDrBOqeb6k/3RgzExAIrZ7RH/nMYjViqGaOdr1mSgMDzZ/CIVkHuRsNuBNXQjmfSg9eGBCqRseYH7ParQ7rN1OIrEzkIF5Y0h5Jc+gt/GkJct5FMruSQYbU0wj+1/jI9Fxoyz8G9DYzwEyPpWdD6pLAP8Nl+u8DPPTXX+nkS5Bh1WuqZTzKHtoThDOY1XoVPd1k8k+MjZy3xa8hX038S+SeZkJw8UWsHmM3OSq/yHnktcY7f1tInmQ8TcSFPHIK5T3Lnf/BiU3W19it1ljI+Ik3R6ycKBa+ww7QIwWO6QamoWWik0Lx7oBAp611bhVVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTwms9+MKt+WkL4ozlEIwyXsRkILlNw0fYcZHV7kwrE=;
 b=VrU5ZXcQKLgP1Ik0VszzWQDcOQjfEg7UptY/SWcDYgXOUio1zCqWNRuL33own6QSEwkVmNJGmyGoUQzSLIiSp57q8JogTN9Re6jqLnVURo46SmExOb+Oq+y/tpPC3kzdXDW6Elnof52/jblixRIl+Lp22bLUMxT56G4qEook5mZ+u20J+GZc0KPcT+s7NACeHVskw51Pd8RqmjxZO72TCyc1s/OgAJVj5NELIukqMZY/G6W06zZQTfRwjEABMseiwKupb0ynZFWNlT6nJVU2s+lBiIM+TVmte/9M8QgwZ5UpuCTFM97vX5HFCYeAw5BBrtXi052U43kcKGPGnrqopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTwms9+MKt+WkL4ozlEIwyXsRkILlNw0fYcZHV7kwrE=;
 b=DrbHA/1vR4MATdhSHf6L9UH3Q2/S+Z5BqDKyKaEXr3aWYpVSoSoxWgKWzReGZevM1CnGLoxvlBX7uMk2xuyuOi5l80qCtgOwhfSujhmT72OiufSuqhnACxEQUNUMlD1Yn3s/hNcN4gE+Lx+bPThAGpSOByYZL7RLhuCpOUFXRI0MPqu+34y9xUOwnFq7VtuxVLH+XUSHu+Lr6qBJEqnjRWI7Is0uM3d9cOmKbmvV13VQftjdv0GN2+MEuNMigqBoKPprFVQOxBxlS5zx5YrX/oPQCGJUyPJAvJvLR5j+syxdCkHOSx26WBcICd1npximWyllE5d1EWc+CH0gXL0wDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df57ab56-5b8b-1213-5d71-14ca7b8cf9f4@suse.com>
Date: Fri, 20 Oct 2023 08:17:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] ns16550c: avoid crash in ns16550_endboot in PV shim mode
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <de07d56188f13e222ddaa1b963c20f8d7d61350e.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <de07d56188f13e222ddaa1b963c20f8d7d61350e.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9871:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e41c7c6-9b56-41a7-6937-08dbd1344b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cXAQygzrRGnDDKzQxsvx3KxayObhxbPgBWF5AI/loKKr1hgL83tfQQYIh/GJS6Ch/vQeHPwqDZ994LYMEOIZ8AP/4aujSE3SdAFdDW2AEIlyvsnqXR4d8rtjzQ8iry2A38m8uoGaDzOeAnNv4TMhiOI0sDPoS8NCPqKnEc+kNanMjONdsju4Iqh9jYK6ADshkg9mNeqXuC7dy4HIuaiI7Q5U7Luix8oYN5zKlIwkaMCGrp/Xj561I9S+y2Yznu35Mn7+klE5CkF1lzCJyaavHXfSq4Xs8jDkSSZBhxAS9fKXzOWijgcVA0h6dhy808MkOZWNn0+v3TZUv7zj7B+dVq+zMvAPBCVe1AlMeOvCd72cPbW6pywHWldGIZgdey7eGjhR1DayLlQXIzBiV8LiEzpCAw+w+a7La9mlSeu6HUuGrQubK5tP2PI8/Ot6w3I7AuWNJj4NepCFwldUqPgrOrBcntlEhguu/Ohn9T59MnLBpRYXBDLPUgszQJ/FU3jao0OVslQ9qINV+HupsncifJZUY3JN08EnhmK7NCOHpRsznBKNFtszLHlaPG72J8xpMejWMLLypgugG0aL1TW+yHGGhT+EchoXvR0maPp8dGVkt/2A1onhDOeefBjomTnS1xhEwHdFRhBKIrLdT98DWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(346002)(366004)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6486002)(26005)(2616005)(83380400001)(41300700001)(53546011)(6512007)(31686004)(6506007)(38100700002)(478600001)(316002)(66476007)(66946007)(6916009)(54906003)(66556008)(36756003)(4326008)(8676002)(5660300002)(8936002)(4744005)(2906002)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUdkeFF6bWJrY0Y4anBaMFRDQUkxUkV3Wi94VTRSdDhqYVViYzY0UUR2Z1Mv?=
 =?utf-8?B?azhSRkE4aGlzdEhaZEdiTHJpYURhcFFSNTVDVW9IVHRUTGl2L1ZpcHIyaGZ3?=
 =?utf-8?B?dUMzam5HNWtmNXl3MXZoSGRLU3F4VkluWStPc3J5Q2U3a282WnlvZW44d2tX?=
 =?utf-8?B?NTQ5ekhaME4vSkdTUHVwRnQ2YnJJSEd6R21sU1NKL1QrUDd3djhSZ0MzZ1M4?=
 =?utf-8?B?WUZ1TlFGMDRTNHJoYVdDVEZVQWRXYkdvYm1aOFB4NDQvVXpMR3dSZWVBS29M?=
 =?utf-8?B?UmhWUTBKaGNGRGZEOE05N1lLdFBXUm5MRHFFMnRUMVlhcEw4bVlEMjdwZkpD?=
 =?utf-8?B?cE91SjlNZ1NYQmNzaFA0bVY5Q0VScjFONVNzS1RJa2UrRzBBcDM5Q2NoZmw0?=
 =?utf-8?B?ZWZSOVBnK05pQi91L3VReWoxK052TURINGFHR3AzSzl4TUV5eTk1Mi9QcERu?=
 =?utf-8?B?RkV0M2xYR0pCMFpnVmZEcURHSVc0eE5ncVh4aGlXUHA5RWMyREVpS1JQMTNQ?=
 =?utf-8?B?a21oaEJoVE9UMWc4Y21BbUhuYU5uN09oaDhVbGNsbHR3ait5T2hJYXpqbll2?=
 =?utf-8?B?VGNadFZVTGlPUXR4M3NUdTdTQThsdWFBelVKcXUvVGdFSTFpTFVyckNXaith?=
 =?utf-8?B?RVZWLzl6eDNmdHF2RXhaMHM1TjloR3dYMUU2bnpneGZ5Rlc0OFBKTVZNcmlP?=
 =?utf-8?B?bkVQMjJWSUZtMDFOcC8wa1BhVW42ZVV1ajRGMW1CbXhHbVJrVkFENXVVNXF5?=
 =?utf-8?B?OTJyYytiT3NhZlRBbWdqZ3VmMUp4K0FmdkNxbHUwSmRHckhXV3BDUVdEbXFI?=
 =?utf-8?B?UGtHSVh4VGwwWWhjTENhRVJDR1RTZWxZcXVnZGFjOEdUUFZaNjJNWklwUlM3?=
 =?utf-8?B?dUJBeTB4eGZWQzRZaGpYVkZLUzZYakkvRG1pMitUaWFDak1vem9JZkRBNy9F?=
 =?utf-8?B?TEx6V2tRaXFCWTZ2YXdvcnIyQVBrTDYvZVMvRklDZUNYUkYwbGl6VFFGQWRp?=
 =?utf-8?B?a0ZkK3Y4WGN4c3dCYmRnZ2RVbHRlNlluNUt3RmVPbUMxeXNPakpCcGM1NGxX?=
 =?utf-8?B?emF1cmNkVGptK25sK0JVZHUyTUVtczBTeXJueVBrL2pVZlIxRThmZHdzUUl6?=
 =?utf-8?B?TmF0dHV1QWp3bW9ia0ZHQWJhNXlsL21vMnlYbEJISEpqV2JheUlxQitZNkR2?=
 =?utf-8?B?VlpwYlBLdVVxYmFYR0NCTjFuV3Q3VTFNVHR6T3E1QUlHTFBIVVpSa2s2dmxI?=
 =?utf-8?B?QTRvMFVLZXFZVm8vUXZGSXlUOGU0SmtkYk1sMUlUZ2FjUzQrRG52VW9sVFdu?=
 =?utf-8?B?R1FlSDVNc3JFaW5tNHhvQ0JNUGhGakxGZ1M4aFlZNTdFdGtFSzY3Y2V6L25a?=
 =?utf-8?B?TjhhQUYyVmJSQlgvY2d0aVFoR3o4YzhpUStDZjZlNmhPQzdiQVFhK3VjVFcy?=
 =?utf-8?B?MTBPaUd4VFBXbkM4a3Y3aTlOTTEvdWNjeHJYcDh6NlR1QWlBbDRBR0FZYk1L?=
 =?utf-8?B?N09neWhmMXZsQjlXOXdvUXhBNUp2SmcwWnFYV3o5UUFLT0c0d2VuVU9IQVd0?=
 =?utf-8?B?UW9JMmVmNldLSHlZekRZZC9IWnZ3MFNnY1FJcko5V2VGZ3lqWVFQS2NZTktH?=
 =?utf-8?B?Znk1SCtXTitzdnlUUC8weHUrK2RadEtlMHFYM0grMjFlRkxaQ1FQYjFYMVZT?=
 =?utf-8?B?UDR2M05aOVk4Vm05N1JZVWtocU5IOFo3UmlNcGVEVmhZMmJyUEhFVEd1WEEz?=
 =?utf-8?B?YnJ0ZHFtTXUzNVdEOUF0NVBwWU85WDJpd0hWM3QrY2wxajUvKzVQU3A2WlVL?=
 =?utf-8?B?SlFXQVZyV2I3MXZQTEF2Rk9teFltNzI4Z3UrditEZXpDM3dHcXdaM040elJD?=
 =?utf-8?B?cVNNZkFtYUpIRnF2cElXV0V1NUxPK1ROMFVXTDZFaE5BSjhocTJkSEdMczky?=
 =?utf-8?B?cEJQdEUzM0JkYVd4RXFHeld1QUN5dDNpdTVBKzdYZi9BNkhjei9SYU05dUFz?=
 =?utf-8?B?RHlpTS80UldCSytnUkpRcUlpQUJEdUtPOGc1ampGYW1ObUFUS2VUZExKZ2Z0?=
 =?utf-8?B?ZmJ0Y3lvSWEvcTF6ZSs3Qk1DbkZlTDZFaWZuT0FyR1FRYUNCNmoyLzRZVGdk?=
 =?utf-8?Q?vQB3JY4Gygdg79aZ9HK09qUCA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e41c7c6-9b56-41a7-6937-08dbd1344b36
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 06:17:53.6691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aA0IYTi4yfHPOzLuZaZ9qy7kIKiIMojK7FWbEeSE8JlhPr0Mz4KOhvGme1wVPk3MAtbWb03f6wxJVY6pubLwEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9871

On 19.10.2023 18:21, David Woodhouse wrote:
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -586,6 +586,8 @@ static void __init cf_check ns16550_endboot(struct serial_port *port)
>  
>      if ( uart->remapped_io_base )
>          return;
> +    if (!hardware_domain)
> +        return;
>      rv = ioports_deny_access(hardware_domain, uart->io_base, uart->io_base + 7);
>      if ( rv != 0 )
>          BUG();

Considering this is the only use of hardware_domain in the driver, fixing
it like this (with style adjusted) is certainly an option. I'd like to
ask though whether it makes sense for execution to make it here in shim
mode, where there's no serial port anyway (unless we start supporting
pass-through [of possibly even non-PCI devices] for the shim). I wonder
whether we wouldn't want to bypass ns16550_init() - likely as well as the
EHCI and XHCI ones - instead, until (if ever) such passing through was
actually deemed necessary to support.

Jan

