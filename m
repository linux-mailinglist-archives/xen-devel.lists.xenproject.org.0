Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F8F7EACBB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 10:13:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632260.986489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pUE-00038o-UW; Tue, 14 Nov 2023 09:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632260.986489; Tue, 14 Nov 2023 09:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pUE-00036B-R8; Tue, 14 Nov 2023 09:13:34 +0000
Received: by outflank-mailman (input) for mailman id 632260;
 Tue, 14 Nov 2023 09:13:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ZB8=G3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2pUD-00033u-7A
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 09:13:33 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe16::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1445de1b-82ce-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 10:13:31 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7531.eurprd04.prod.outlook.com (2603:10a6:10:20c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 09:13:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 09:13:28 +0000
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
X-Inumbo-ID: 1445de1b-82ce-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8I4VBX3HNNu2zkUadxiQe9CCwfX7oUUCACI4u7aBS1st5G4dajFyI4ASvnqXldyZuk8Rt0/YPifbVS6uxv9TYiJcFBrxb5QB4xywHFw7whJ4TDvKxD96UB6YYl7G63kce6EkZ+Sos5LisG0eohyUHqWXEXky7tbySjZZSrNnz/fx0WOQt2ySBVZh4fNSzklmGn/lfmN20htleb7Rnet0sTmhC7tsxkqGtVt2onCPuOyAExsVudjMmcJqaicuPGKTYAbxpTib6c+3BIYU7XBQalzP/Ikn5bTaQwH6+OksNLNUmm6A5J2DOTuJdBU9Zc/zfQHfavejLazo+L+i0HDIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwS6wxtxzfir+c0ysyPet64hXP4uc+VHcEEin5Vt7BM=;
 b=SDiFygqzVLCQpHpJg0Ez16WuKj71MfM4nt2eM4DJxtBPGeFyc8fB89H8bt7SJAKhFg8Z1yVYjpBThL8lrrE1ZH6m7nIbujNIoxU7zMqeVKgGXdufNlHb7aYxKwUVECLSUBQQvhfdcPiF821XdvZ+jnQHVfJStBIc+MJrp3j/CXmkzWagVDalS70sbR42SLoKZQxrI6DBNQyeSMZ+NAx/zSx4QLH+x70WRPviCsXUCxKdL8Cm5EHr+NDIYL+Tclcosms1LKHtSv+CUMp1nmXsOSZxpkW7Ztu2Q4iwkOnaTsWg0KZjukQxLVGj6q4lh6+C1UXV3F5qB5peGObHXUTY6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwS6wxtxzfir+c0ysyPet64hXP4uc+VHcEEin5Vt7BM=;
 b=euyEVDp3mXzbIYmj84b6teI5pBDdz9Op2XiBlp0ANWZ9URaaFjEEC7b816JplkPNyJ7oGnvirKC8iy40O2LhTF9CpKoccADD5v56UUczKoQzgCvvMgJz5RmGWhxPfNyHNUUKMAlEe/5/OZEqpluDE4Gb7IJKoSvP7OtapgYXIpeiRlhMZf7eaMI2+DAOJx4mGL5ccn05SroFqjoec9sOI8xgAXVF5ZaByL9VxlmZGjI7ZzU9YqoFMq78bly5m+lu4vVpW9jFFmp+PLqKmmXZvvRELKCPCt5YGWzdVp+A9sRY0nrbraEMtUGx/CAdPNdpLDgea7VAkpNvyza1NFgqNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8be3763f-a4b6-8962-9183-a2a9c3509726@suse.com>
Date: Tue, 14 Nov 2023 10:13:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
 <20231113222118.825758-5-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231113222118.825758-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: a49a2f11-d65b-4707-ac91-08dbe4f1f724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1jlALgRpo3QYFtYo6I73OaSe223l+zkRniYoCRFtg/ZDl5d0p0UMbIN4/eYzP+jTvj/X9lVSwVzxWzRNB5uRXk9BQ8SM26bE8Nlmzf+UeUqTaSIn05NkE8ssdV6Zm0nk27BzkhpvLOPFpMabVU2DnCuqEbaSuI2HDq4mNHGucU/JvlTB5pUwwK701cCRiIaLePsfSdtwfZOoEJGcRImH0KbO3C2HgLrcd/gdo5NE9fnSTUkcIbibJ30EsdknlWqNsSfLqNehd/WoANdZzILvtkXMKce/LHnOLiiDXUaDyVdbER5wNj3LFQoBwBcogjN/8+YzcDq/Lo8j6H0XKw9CZ2LoQCJXLlD2twi0WsLzV6oC6zjMiOZa5JgRhpu9rm24rQdtK2EG+OSjsKbyiwcdqN6psqMPHwRzCNpmcCgOGbRvOxbNv3VRTkEmw5ErUtzadQ4JC022xANNn7gvXE8vtlUgvVzAvqBdDCYmw53oxjsBqtQaKxNuehVEJDt0mW1DMF0IvCxZyPi16d1P/8nYWSnDp/wP6P9GYG2G4PRS32+bczWeccUwHFasjpRAd2QBvXjzfvmck+BbeqUYYfxisGr4qjbr+RXT+4H00sydPBdDJnnX0u18ztlpecifsBXpxn1EzXuJ1waTvOsENFZ5jA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(396003)(366004)(346002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(2616005)(6512007)(26005)(6486002)(478600001)(86362001)(31696002)(36756003)(8676002)(8936002)(4326008)(41300700001)(2906002)(7416002)(5660300002)(4744005)(66556008)(54906003)(66476007)(66946007)(6916009)(316002)(53546011)(6506007)(38100700002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVcwaUdHTUp6M251cTkrN2Fsa0hHdXh6NWM0ck85QXNra0NMT3NVaDFCVWkv?=
 =?utf-8?B?ZWw5TENNb0JvSkFuYVJFYm4rQy9KTnhqK3FqTGZ3c1d4TWxXN2lUb09ya3dN?=
 =?utf-8?B?MUJQalpRclBmM2lZQ1ZHbjBoNmEySUZabmk5VzM3MnNKQklwZTRRMGlsQzUv?=
 =?utf-8?B?cU1xeXYwSEhBWm1lakx4Z3A1enoyaW10bXJ6UERiaTBBMU5XZFR3Um0wLzZP?=
 =?utf-8?B?YWlTRDlCTEM0TjN5bElKWFB5QnhNV3dFNG96amMxaXhmcnNmckRudjFPaEdm?=
 =?utf-8?B?aXNGRDV4ZW5aWnovZko5QytrSExteVV2QXF5MGFVVlljS0U4NUV0ZmdhNyt4?=
 =?utf-8?B?WDQ4N0c5ZldHR1NuN2xoWEFGK2M4c2MwNitkL0xmcmxCclRtU1JacVQ5OC9H?=
 =?utf-8?B?VzNyQjAwNGlxTGYxL3JySTFCYUZZZm4xbVl5WDJVQyt5U0FucEZuYkdic3VV?=
 =?utf-8?B?KzlpU0NwODJrV3FOOUlYbTZLUUh4c2gyMEdMeXprYXNuZ0gyY2dGaDRsMzU3?=
 =?utf-8?B?OFlocC9hZUJiOER5YnlCblJmQVlnRWxFZDJsNno2ZGpQRVJKUTdVL1VMRDdi?=
 =?utf-8?B?VjdjbTBmbkpQd09aZjhPY1JnZGU0cHRVL0orSjFyWnV1cDRxR0luNEk3TTg0?=
 =?utf-8?B?UzhtSlZMODNRejJ2RGdrcm81Y09qZDZnaW5KMmRhaGNyOTlBWkt1VU50N1B4?=
 =?utf-8?B?alVkcDdUVklKeW5pU210LzljWWNoNjU4L0tlUTRWY3JuOWM3b0dVdmtHZUNs?=
 =?utf-8?B?aDdzbHEzTldUWU43ZUFlZkpiQ1VYVXB0ZW9pU3c1VktaZVJRSWpiRThtVG1X?=
 =?utf-8?B?YnFGblZUbHgvUHpPbng1SXhFZm9sRS9nT1JRRUdwb1BZcjBtT3FyREF0ZFY1?=
 =?utf-8?B?RTQvMEYwMmxyYXhoOU1Fam5WMEdzdlRkN2hscVZzNkd5Uitzek5QQ0liWlAx?=
 =?utf-8?B?eGtFNjZucWxNTjRTS3BXZThSYVZCVWtwamFqS0QvUWZEblM4Q2xBbm5lTmZR?=
 =?utf-8?B?WEdvK1B2ZjBsOTVScWRXWmNyL2c1RktDa1puU1F4T1hKREd0WWpNa0pSNGZL?=
 =?utf-8?B?Yy90cVIwUjhuc09PaXVMMTF6V1B0d0dGbHluRGtKV00yQWFuRXhFMkZLaTZr?=
 =?utf-8?B?d1dWU0hES1A0K2VZMS9rOTRqZW9pVlMvQm5aMmx6QnlMMkhDMFQxN1U3akdH?=
 =?utf-8?B?eXV5ZWNMcm4rZlVLN3NuSlV3T2hrUmhROXkzNGtkemltQ09taG10N1FaOG80?=
 =?utf-8?B?TDdlcWt5djBOOGVSZFhCTTdFaFVrYUszRFNPLzNvZkszKzlTWVNuRXFHb1Y4?=
 =?utf-8?B?bEpUZWhNY3oyZ0R4b1R6YlM1Vi81bE1pNTFScnNVTUcrK0RCSkRuTjNadCtq?=
 =?utf-8?B?THY1MzNFWjFFS3BYc0N1SFF4KzV1cTV1bFZ3S3dIMGY0RGphT3BSYlBXMzFR?=
 =?utf-8?B?OFVKaEJaT1hPcmVLNlRXMUtpQlBqUDIzeVoydHM0clRjNDNWSWpiT2M1TkZX?=
 =?utf-8?B?ZHhqM2JEWng0WlFNK3dudWEwTEdMWE1iMHU4c1ZrNHhjRkU5YXdrdHB5bkR6?=
 =?utf-8?B?cnZDTit5MUxMZTNJSEliMVdWTXlnS0VMWVJjWWJuMFREbUpFWWRzMU1SOFJq?=
 =?utf-8?B?ckVYRXlKeG5KNElILzFLT0FYMHl4R0s2UlpUV0daMkJtWWVNTHJaU09PbjBo?=
 =?utf-8?B?RkpxWGlRK01Ta0lFK2JNTFRQNnFpaTVScThrK1hndkVOdGo2NmEzYlJwWFF0?=
 =?utf-8?B?ZnRIL0Y4MXRFTW9uYzZVRFljSExGcjVNWk02RTFBQzRMclpXYVZjaTJKbU4z?=
 =?utf-8?B?ekJBWU9BYkdJOUFaendUZWZmQUtSTmFBRHkxdzhpSXBIYTZnRnRIS3lGbXNm?=
 =?utf-8?B?OElNSWtFMTk5MUtXT3dJR2IxK1k0UDhhb3pLR2FXNm9TdUFrdmFaR0h4UHJk?=
 =?utf-8?B?Z2w1TmFJbjFtN3A3MldoVnVEakhpMWpHcVJvMzlIS0xjNUFDZkpicUh4Z0hQ?=
 =?utf-8?B?Zmx1SFpaWlJLT05LNEI2TmpBVXlJU2Z0K0xJc2hqdkZ6K3dJcDh1SFhDU1Rk?=
 =?utf-8?B?TlJPUDRVUnkybHBycGVZVjlhVCtFZ3JYdWd0S2t4dWFpVkg1UjVOWFBzdFhw?=
 =?utf-8?Q?lifwA2B9jn0aads0Qpx9/Qj1N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49a2f11-d65b-4707-ac91-08dbe4f1f724
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 09:13:28.9237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DrU+q9AmNh+A666agTWblqSPRw2Zhf/XysAAV1pLuk3FVWrwXCF0By7mrmOe/hoeSs1XHV4DYBfcDv5hj960A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7531

On 13.11.2023 23:21, Stewart Hildebrand wrote:
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -503,6 +503,8 @@ struct arch_domain
>  #define has_vpit(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIT))
>  #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
>  
> +#define arch_needs_vpci(d) ({ (void)(d); false; })

See my comments on the v5 thread on both this and ...

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1542,6 +1542,18 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
>      pcidevs_unlock();
>  }
>  
> +static bool needs_vpci(const struct domain *d)
> +{
> +    if ( is_hardware_domain(d) )
> +        return false;

... this. (It is generally a good idea to wait a little with sending new
versions, when you can't be sure yet whether the earlier discussion has
settled.)

Jan

