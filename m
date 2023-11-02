Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56C47DEE43
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 09:39:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626774.977318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyTEV-00041o-3E; Thu, 02 Nov 2023 08:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626774.977318; Thu, 02 Nov 2023 08:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyTEV-0003zG-0U; Thu, 02 Nov 2023 08:39:19 +0000
Received: by outflank-mailman (input) for mailman id 626774;
 Thu, 02 Nov 2023 08:39:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyTET-0003zA-Og
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 08:39:17 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20607.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e976d5a-795b-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 09:39:16 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9341.eurprd04.prod.outlook.com (2603:10a6:102:2a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.18; Thu, 2 Nov
 2023 08:39:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 08:39:14 +0000
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
X-Inumbo-ID: 4e976d5a-795b-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdQgSt7/y8p1DK9N/P+T2cgTJ7OmD88EyfvlgmsqjlV5TI9kq6vDJuUP3v4x5AzIan3vPhqQMpvztH5rv5+PuAzmCbL67Sjp3O/9olMNQCXWvzohFkh+WA0V24s1KPmbwWj7Zq+ZuVyK5h6gWFzOBfmXfJafWj0xLF5lVa1ZBWqmI2LUplXVtX17ebRMoIlD8+Y8/uog03qHKSiOXDH7OcySt48v5VGw3QvbvknqLiEGmeMckdv5ZoAOwSTU38K2AtdtM997+uKnJk1fECJ10yzvumd5r0Ut/RIz3HDoO2FEdhyNgszOW1pekj7Q0WFVTAvPEwGP0lz50/O+9nifvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnNEdTC2b5YoH4KGuowk3NrtAXlJ6IAvhCBVPgYMI+E=;
 b=WO0/cx+Vl9NcFtOaOPUixi6yu0AXKJEbnFKqvm6W8P0qzdfXvJDvKoitgGR6PgFBPaFlShJ4KCc32CBpunVwKHgUBPcaXMpZP3UhXLs5cvKFs6i+e3sWYrRpRpWjOF2kmUa9Rm5HCHIFtDAmXVM7V5mjCb4hboZ5yJ3eigSS9bI2CIcBs+w3v6MyfL3PfqgV5WHerVXAwVzZBHsZ0TwI0jWQRTj9j5rO+cpXGUfYqqogsBIb3zKBpEdtBjzdlc/eZJedVFFWIhWnEimqVH6ej0CAYFfMwmlox/WOhVXFK0xn6x7F8MwhVjo6c92OJ3/NPPGG3IWHJdMZ4ny/hhs5xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnNEdTC2b5YoH4KGuowk3NrtAXlJ6IAvhCBVPgYMI+E=;
 b=KTK1vXyf+YhpZ1Vy3BqVjzhp+r0CGChJPibg3IIbHF41zX/KfscwuAQvqCS1Q1qocNeejaQoOyeufJWQ4i5vlqp9mKi2P8cAycCQqzYnC6eNWxf8Icma6vLJDve4btvQzeS6Pt+dDUOW+/AIY67jUBLMMwEQGDrVjFwXQXF/ErsB6GcXh/JtRGZTxUj5IKqV/kSirQIOfM1PELK86L3IYEuDjacHRDnnGQ0TFyksC0gbsJP1OttAoRdm6FFhrxNG1biM+vJJb55x3JLMB+c6bGqSh+5l0lTGfmtPEHJDCrRXZiqlsjzCZ4OU2qieUDcAznWB7eMLlMhGqIffRl7nCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7642b4d4-c710-d254-b182-4f4540b6c63d@suse.com>
Date: Thu, 2 Nov 2023 09:39:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] xen: avoid generation of stub <asm/pci.h> header
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <f3fff005a4f9af419144d768afcf2fd4de3f21a4.1698833709.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f3fff005a4f9af419144d768afcf2fd4de3f21a4.1698833709.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d463d18-2236-4264-329e-08dbdb7f313e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XXkzSbzqyc0Jr2MTFvBBJQjM4q1g/3WrVxL4PAnpPp8yTxAtZ4yrOCRASrMvVzX4xo7IcPRxN0PhVK659Z9cWFbTwn+SUdetcZJvifhSCXbW2C2A256jd2L/tRHgtuGgbRdX0xfLFz3Dv1CdUFAPmUQBO+jH+9PB3/Izw/7jdctpdIpt35CV61I41/zToRNGpKFb0P9pF812hZgdMlIcO8o2X7fmJUjc/39n+umE0QsnUlcRb0VRXFUhxO4Cq1n6W1Z0ZtT2BvS/mKa0ClN8VEB1YGXLVloCbqDy9vzeSfZ8UWqCvnBiCpOJo+zfvi6NELY19whCPcpP7R1XtR7XbjFWViluGFaIVA4se2pDwREf/Y2yFnnqu6J8rn44wToBUmwMyL9WSWl3hX+lyqfBrI12T1ZgJJtgwWaPQDYqLxXJJt84yjcEXy+tznEzq0wZtJdV2g7NK/KNixC+hGO0kD6W+EhC9sS45M7wnPA0g9uG8RLf83b/vHN9iPQ3XsG9qaXGwveKjE42Fh7GUO7RmvS08iI8C5DIqRK93HaALYdsJVl8lVurfEF+VVylNprIS25MsPUL1pue2S0DlZ+myevccbWg+/FB+4mv3h06/CzIpiP6IGaIpHq0YEWRYwVBoah34cM8DT+HMtle5JF0PA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(316002)(6512007)(26005)(6506007)(6666004)(2906002)(478600001)(8936002)(53546011)(8676002)(5660300002)(66556008)(41300700001)(66476007)(54906003)(6486002)(6916009)(66946007)(4326008)(83380400001)(38100700002)(36756003)(86362001)(2616005)(31696002)(7416002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVFPSUFMZ3BXc3VvNEF3RE5JVFhoNmEwSU1BMVNoZlZvcEFGb25qc25iLzht?=
 =?utf-8?B?U2R3VnBlTEIwMVVEL0pqVTc2VU13Lyt4WnhUQWh2SkM0bU9EL0FoNmJCOXY3?=
 =?utf-8?B?KzZ4WVIrMFk0TGM2OWlldjlyV3FNSXg3Mll5clloTmM5OUlqa2dyTi9CNzl4?=
 =?utf-8?B?cmtvazg2WWE0U1pGRWpaV0NFUThHNmVIQ0MrOW5qMld1bkhJcjJNU0FtWkh1?=
 =?utf-8?B?dHV0Wk9iSHlCNzlQRktSUkNEd1pTTWtncGIzdUNBYmhtKzQyTjRPajN1S003?=
 =?utf-8?B?REdMQ09TK2dmNEZvR0pPOTlDek93bFg1OGcwcHJIMVVkWGVzZmE2aEp3Lyt0?=
 =?utf-8?B?NUR1Q1FrMnUvWmpZZHJXUW5LeW1lSlo3ajVjNU0xb1BMbEZ1OUM1c2RUN3Nl?=
 =?utf-8?B?aTNNbm1ZT2NYUlAwUHRXWFppTmlTRXEzTjBibjdxS1lHM29nZGdaR2Z6SHMr?=
 =?utf-8?B?KzFVOFBZWGNMV2cwOW9iVmtyMjltcHIvdEpxQi9pMVFNWUdubENrTDRuNlZm?=
 =?utf-8?B?UEwxcTJaekthQ3VmblczN3FwUmhjb3dHNTJXOWV2Zkg4VzBqYUpZWFBwa0lN?=
 =?utf-8?B?cHZTYjdkTnVWSHN4ajVjeTQ1ZTZrZEY4RDZaQ1lsSjNXcW9qQ2ZDb1ZvdEJX?=
 =?utf-8?B?a2ZacnJRb29SaHNSdTNiTVUrRFlNRkFsd0NKL3NlUzIwcHJoeGd3dzROa3pH?=
 =?utf-8?B?eE00N1FTYjNTNnRORFVoL29kZjdFVTFGT1grbzdTblkram9sYVdLMEcySGtH?=
 =?utf-8?B?TUZwc09XT1QxbkRwUnEzQzhRYno1dFBJWXI5UFBrTnFpOUxvTFNqZkJvMnhk?=
 =?utf-8?B?d3FQRkFjOERHa3VZTjV4Y05lcnZSV3JSUytsQUd2WmNuUzZVaWVOUk1HQmlL?=
 =?utf-8?B?Z0VmMy9ncERGbWp4RCtpUnRZa1hBQnpNbWNOeEw2elNVZkVUcE5sQTBVYmZF?=
 =?utf-8?B?cTJVbmtpUmN1YVE4TzA3RTRPZ29RWEJVZXlMejZxN2UxRGFRYWFUSDdKZGtS?=
 =?utf-8?B?cnIxbi9qSXJ4WkNRMG9sUmJBaTNkL3ZrK1NPbldCVVpxcGl4TmFLWG1VNDhx?=
 =?utf-8?B?d085aXN3R1dkLzJDWXM0cThRTzYyT29lR3lNWTdQWnovUGJxVWZrMGo1T1RW?=
 =?utf-8?B?NUxQNEJ0cVE1a3l6ekVBOW92ZU84Rm55YnRaVVVQM05lWVAySUhJc0h4NVBQ?=
 =?utf-8?B?eDhydmRrUS9QVU1EQVVUaWI5SHNVeEplczlGbVJBSWR5YlhBdUxLWCtpYWUw?=
 =?utf-8?B?YnRwemwyRGp4U0NLK1lyaHBSUGlmQ2VxZjJKMDRqcUc3QmpjL29aY09HRDFY?=
 =?utf-8?B?WHZYTzFOOVlDbkxNNzdsWE5IZU1XY20wR2xQMUJ2clV6V3QwZndJakFhR2ZQ?=
 =?utf-8?B?NW1saHVrY254cjZ1bDNCajVSbDhQQ1puckNoWVlLWThyUVpNR2g1WG5NclBN?=
 =?utf-8?B?QTl3Z1BIeCtQbnh3NkFuRHZqUC83VnVibThsSHZOUVZuWW9xMEhNdnVNL2Qv?=
 =?utf-8?B?aUhxU1Y5RTdSTDBsd2JjV2E0bGJpRkdXMkRjUlc5dHkyay93eDdPWm9VWWtB?=
 =?utf-8?B?OWR5YlBONFhHaC9LRzY1dXNQVDh4M1hvK0xjS05tSjBTdW5NQ1RHQk5kbzFF?=
 =?utf-8?B?d3VqT0pFSFhISnMrdHVlYmRHMnJMM3hHbXNFOGl0dmdBdnkra0IzU3NDRE02?=
 =?utf-8?B?d0U5My93ZGlvb3A4dUpWWmhmeG5PZTN3TmZqL1AwcjZOdXJvMktmZUNpOVZw?=
 =?utf-8?B?QjkxK0dZV29PMmk5Z2hIU3RGeHJuUE42KzRsTEZtRHRXbjdlUFU1a2hqYSty?=
 =?utf-8?B?S1h1Tjd2K1ZMUy9GK3hqSDUwTHYvZWxGaWRSUWlqeVM5ekFkSzFVQ1FnYkFj?=
 =?utf-8?B?MmtTOTdvMlFGSm9rNnVadTZuZCtFUk5CQWVOUWN6SGhCUytRZldDZXZlT0kw?=
 =?utf-8?B?Tm5Dd0xZZExobjg4ZkpYZ3pDc0MzaXV6aVgreDluNDZNczlMNkd4Yks1SVBs?=
 =?utf-8?B?d0t3WkNtb1lIRmVjWkJNNDY3MWZuR1RRRHhiWS9YL1U5WHJTL0lOeFluUWE3?=
 =?utf-8?B?ZnVsNFlCMzFmNTJaTzBTSFpEUVFvWWNNSHdPb2twbFFDQnNHNG9FdUM4NTBU?=
 =?utf-8?Q?mMMjrrPVJhHPB41UiU7VrthyZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d463d18-2236-4264-329e-08dbdb7f313e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 08:39:13.7854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NzowyKfSDcXcPo3Fqo2pIzRdpGck8N2xjPbbwkhXQgWwWJLsAggypHGbQOsiXUPSOFsb+PIlYD+aVQoiAO9u2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9341

On 01.11.2023 11:15, Oleksii Kurochko wrote:
> Platforms which doesn't have HAS_PCI enabled it is needed to
> have <asm/pci.h>, which contains only an empty definition of
> struct arch_pci_dev ( except ARM, it introduces several
> ARM-specific functions ).
> 
> Also, for architectures ( such as PPC or RISC-V ) on initial
> stages of adding support, it is needed to generate <asm/pci.h>
> for only define the mentioned above arch_pci_dev structure.
> 
> For the Arm-only stubs ( mentioned in <asm/pci.h> for disabled
> HAS_PCI and ARM-specific) will be needed
> to add <asm/pci.h> directly alongside <xen/pci.h>. Only to
> <arm/domain.c> <asm/pci.h> was added.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with two remarks:

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -68,7 +68,18 @@ typedef union {
>      };
>  } pci_sbdf_t;
>  
> +#ifdef CONFIG_HAS_PCI
>  #include <asm/pci.h>
> +#else

This minimal scope of the #ifdef will do for now, but will likely want
extending down the road. Even what's visible in context is already an
entity which should be entirely unused in the code base when !HAS_PCI.

> +struct arch_pci_dev { };
> +
> +static always_inline bool is_pci_passthrough_enabled(void)

Perhaps s/always_inline/inline/ as this is moved here. We really shouldn't
use always_inline unless actually have a clear purpose.

Jan

