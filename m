Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6CC74CE05
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:13:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561039.877314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl5b-0007jd-Au; Mon, 10 Jul 2023 07:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561039.877314; Mon, 10 Jul 2023 07:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl5b-0007h2-7V; Mon, 10 Jul 2023 07:13:43 +0000
Received: by outflank-mailman (input) for mailman id 561039;
 Mon, 10 Jul 2023 07:13:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qIl5Z-0007gw-Ug
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:13:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2089.outbound.protection.outlook.com [40.107.7.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b6d5e19-1ef1-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 09:13:41 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DB8PR04MB6921.eurprd04.prod.outlook.com (2603:10a6:10:119::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 07:13:10 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 07:13:10 +0000
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
X-Inumbo-ID: 4b6d5e19-1ef1-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxHTCuyMLNU42ij08/WrToDdE+CVSMV0XxO7p9gkiBAWXZOM8ztCI2KeUWocBMBZsJ+34Wjp0Ke1tNjUgXCkfJUJdmkBp30Y3BIgeta9s/x9iFIYASwXxGHdzqu3jwayYhFB8lk9gZtTeC0p7b1ffbX2nqVCdKls/kdP2pvovVks+i0gu6H7PjoKGUks0vShRR3K+slYWx3jjrZ5D7C91naRU/St1skWSRnrB+GJG/hN9ZXfcuOwjy4BR99fY1yX2cGfbTvKHEq4bO6Afov25Nk1b+VKWudp5TgP5M0KhimKIHPLG+1Iq+khXVASv5H4k0bqjlGbNd58HINcsEPE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPNBskzHs7SRyoPRZBVHjLPpnZiUNce5R+6Eqo9ZqE0=;
 b=Foi+pwFcAZ/hCX7xyuc4F27CbLPj1yzBkJLBSSOreqI3Hl/es7lVkTRE7faGN0MNySUuHvmtit9JV7VWa3rNxitC0l+G4rdgmgIv3WGdWX/oTVhGqN8IG9D/WQIXzhrPOn75UBNgNagOk9xdgQMjsVguuneOX3a9OcUG6IzEUvJWwEgyYZgfSlmq+xmwy6n3fzhebAG64RpPoY3wGQEdDnNBEzwNPTyRh6NDEg3UCS8k4opP1lQ4ybKEs9iL0spg93DZYp5LiRZIxvHbuzlHlpBtC2te04awK1xU711nhr8bQUddwKsMmE1R2gzDzJQ/VhD6JZwda6LFMsXLXfhzfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPNBskzHs7SRyoPRZBVHjLPpnZiUNce5R+6Eqo9ZqE0=;
 b=2B9s46JuqJ0SbNCk8W+CpONW1/h+eYmkj8oJqmqvtsNH/fJTy6y0f5k3XoW7tebxGvkn3DTALAuaxL7SJTuItT3kJ+vOtACXKF51h2IeEtmlLQ9fh5lUsCNL90lbDg8LcQszDH6hLGGGl4PsiQA0Kauu/YXh+VQXtsIbOcFXX9CR1QoWn7oq74xSelf5ESMAIRXaipualZML/IvQDmar8M/+kJLaInNJ8l/e8wSqEWgnY/blPXxD9Diy/FM9Dv2AU6wH5TR8Wctlk/+6F8MilnyRbdGj7Vengu/too8Bkro97vghNQSf2sUS0n5LfLhtQ69uYQZQESWFjosSjKZlWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <643b2df8-e3c6-8bee-dba7-141324198791@suse.com>
Date: Mon, 10 Jul 2023 09:13:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 04/10] x86 setup: porting dom0 construction logic to boot
 module structures
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rich Persaud <persaur@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-5-christopher.w.clark@gmail.com>
 <alpine.DEB.2.22.394.2307081149090.761183@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307081149090.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DB8PR04MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 21acd519-159c-43d5-0cfd-08db81151e42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	InknVlxjFgiZ7DlQrX83UaRD2YHvDsAUN4tmyh9+2JuOXWKA8hnqFVx8LTrTbpSWSR4dOMBpmLBl3m/J7BTQBetYfqW2xWG1hWablJKCuKySy/HIw5k5DdBJvoM24fxZmSy+XIRZRNfscNFnbSuftp3E4B04UM3+5rBmnZliIQ+3pzME0MZu9590fcNfU3KiWzowJxpV7qqjHFBj73CI4UxhmoiJdjTRIxwQGdDyTPfHgLp4R7W9CV20krEAqJ8+Vy7lZGpSkaCWUEOyfehvqSAAD4zFE5akxuZNmtD21DjK//CzBJaC62CNjkKFk1XgP1VOFSb/KgpIxP+z6VHMKS557Nwxddcx51nvxQ9TQ2Ro7h4mLQBuuqNSNinYt4Mr24ovDfcsVEoQvwn8NmH1q/Rc02RUI/qImKIXEfP6tu+vXXkkyXB3X6dPkT36ocnSh471XIb2Z12NQgc8BAU5axc07xkQiikqdJUt9rNuAgyAqKpbdhZxhUWjaFZOYlzPp5J9Yk1KIbRaK6sRuMptZVPC23mtbGDfaiuC0SfGm3JwEEeWz96sAwWRxSXrnF0H11wejodJbV77gXcjTkwnI9KAUt1PQxhu3AzWilDBzfADcVUbPM/N8QHyKp3zupmQegQVx2IoxGqBEJeeemjiIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(86362001)(31696002)(38100700002)(31686004)(36756003)(6486002)(54906003)(53546011)(26005)(6506007)(186003)(6512007)(2616005)(7416002)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(83380400001)(4326008)(6916009)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUphTHFTMDE5ZXVESkxoUENwdUNiU1Y2bDRjOVYzN2VSRG9obEdUUVVtQ0NB?=
 =?utf-8?B?dnJUVlNzakFFVkEwc25Ba2pMYzBrSEJXMHZRa3NaMm5uNDlYcUJvaVovNy9K?=
 =?utf-8?B?a0ZSaDkxeW8xZ0NHRng3L01USXc0YUs0ejJNVFFPYzZkRHNOVWs5cWEzWlpW?=
 =?utf-8?B?TFlGenBEczVMZUdBaUNQZ1J2UEo4SjZoWWE1U21VVG0zWEM4MERIUzB3b29O?=
 =?utf-8?B?cTZZblp1ME9FVmhCMGxocklKbFZPWkRYWFh4RXZrRDBiSEQ2eVh3ZnpqVmdD?=
 =?utf-8?B?eUg5Z1dVNStTNUdZREVHZWdYQ0JndjY0V1ZyaTFMd0FrMnhGS21nY2hKcHcv?=
 =?utf-8?B?NGp0SldCdTNzQ2lpb1cyemZEaGZrQ3pWMkVCNzlZTjVWcHVmZXdKQTY5T2Vq?=
 =?utf-8?B?K2YrSmpaQThWVUI2T0p6RDR4QWRsb2ZxWWVFd3VsdVA2NXVxcnkveGRaZ05X?=
 =?utf-8?B?UkF0ZEFSOWs2VUQ0N1g3aTV6cFVXeHAxRUVPcGZoRjZzYnJWa0VkeHpIek55?=
 =?utf-8?B?QlM2ZFJUOE5STHRaTmd4b0dFbjBoc1d3a0NEOThEUDNkc3dqZUIrTDdWanJy?=
 =?utf-8?B?c0ozYlo4YzM0SENIZ2lGL0xITTFjMVpDQ09uMVNoWWV2ZFhGenJPVGdqOFcr?=
 =?utf-8?B?MmNZc29OUTNzN0hQT0UvWFl3WnhWNThWa05zdkNGYVlMOXdDWllqSXhhTGdG?=
 =?utf-8?B?Q1BhdnYybHBIMnVYRzVvQzMwM2xlS1BHSnFkRVpHMmU2SWZoUlFxcmREK3VB?=
 =?utf-8?B?OFpCWmdzenhobEZoZlhBcnVYK3A5b1U5TWl1SUJ2a0wxcm55OUJRSTVtVkM1?=
 =?utf-8?B?QzVOdDhwREw3RFhNU2xLanBHOXVZeWt5bWVoVVl4L1dtVEdTeUUwS3YwRFN4?=
 =?utf-8?B?THNoWGhWWTE3eWNJakhlRERTM1NTOVdQSVluZDVYRnJuY0pCL1dHd0pEc2Er?=
 =?utf-8?B?Rm9EdnhxRkRBSU1aUlRCT2FlYVNnYWtzZ0ZDM2llVlk3R2c4ZWpLQ0xlY0xE?=
 =?utf-8?B?R081eVdnWG9NNG9FNjNDS3JFYm1VY2hjKzEvUTNqODl1R3UzampYU3ZyM0J5?=
 =?utf-8?B?dkRqeEpKY0t1alA4VHZublVPSmc0REVJMTlDTUJiclg4SkJUOS9Fd0FrdTRn?=
 =?utf-8?B?TXVUZG9TWEF0dUttdjlOWTlVN1pYTmVWMC9lUFdQZEloS0N6NTZ5WHlrdXda?=
 =?utf-8?B?VnhMVjdhY29lbmYyb3hONTVGS295dlp2NFlxdWxPQU9lMDJlSmhUS3dqcVc1?=
 =?utf-8?B?TC85VlRaZ0hpMVlZMG1Wcm1qVWI4cDZ6UGsvajJPdGd2WVJkdlk4blFIM0h4?=
 =?utf-8?B?cFQ3UjMvMzdiMFc5NWcyUVFoM0hmQWNqQms2NEFocThVM2N5dkprbHRPeXNj?=
 =?utf-8?B?WmJTSXdKV2p0amRGaWkvYm1vbHBFTDFpR1FXTnFHdEJZOWRvODNqZFpQc2Jy?=
 =?utf-8?B?UnR6K2hzbFliajVmeTIrZ1JOLzZIZXdrY21rY2tPKzJyY1poSW8wVWQwN0dj?=
 =?utf-8?B?bE5EMkRQTFhJSGVSd0x1T2V4STBjSTc3YzIzMG5tQTZqMERPbU1lUW9nVTVT?=
 =?utf-8?B?MDZSMFdESjdnRmZOZ2ROekM5WWgybUllT0VITjlkOFk1dnhaNUxPVEgwTlBw?=
 =?utf-8?B?RzNYamFacWdtMUlQWHRsUkJzT21ZUWcrRHNaa0pwNS9TUTcxa3VOVVRpQ0M5?=
 =?utf-8?B?TVZjTmM1eExhNmVON1JsR2U5a1N2RFkwT0FRMjNmVkhONXdIU0JLa1NUSjhv?=
 =?utf-8?B?dVpUbmNNYitLMnBLdTZ4cjc5SHZLb252UTJaWkRoM3hsQVVJWmlrTU15aWVi?=
 =?utf-8?B?TkdNUW01OG9SNzd5NG5Qb0pxSExIZjd6S2VEZFdOUkdENndEbFhIQ2tYaVNF?=
 =?utf-8?B?S0VOSnI2YnlMQXZ2U1BXc1NDbkZXUEpKRlByWXdCSCs5QzV5TDFMNGp4dmdK?=
 =?utf-8?B?TndnQ2pYUnlQaS9oRTBYemdMd3dZbEF3dVE5Tk02TzRycTlIaDBtdkR2MjZp?=
 =?utf-8?B?YUVWak1obkk4WjNoaDNiNFZmRkI1LzBJcWdMcnAvME42ZW1VU2JyczFRTGli?=
 =?utf-8?B?dkd0a0dubGs0Q1ZuL0o0ZzFsMHNwOXdEUXlTNUYzY0FhNVE4OGd1bExGOEFK?=
 =?utf-8?Q?tSl077s8GjmrgceQrSbik+UUV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21acd519-159c-43d5-0cfd-08db81151e42
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 07:13:10.5753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XacT9hcypJgSO4OeeHjuhCMxLcq3x7r4ut7WbSvCWmcbCtKunxPiBnFBHWvsazKl/aI3BHNNxefHS07ANNOuTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6921

On 08.07.2023 21:15, Stefano Stabellini wrote:
> On Sat, 1 Jul 2023, Christopher Clark wrote:
>> @@ -1357,12 +1382,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>           * respective reserve_e820_ram() invocation below. No need to
>>           * query efi_boot_mem_unused() here, though.
>>           */
>> -        mod[boot_info->nr_mods].mod_start = virt_to_mfn(_stext);
>> -        mod[boot_info->nr_mods].mod_end = __2M_rwdata_end - _stext;
>> +        bootmodule_update_start(&boot_info->mods[boot_info->nr_mods],
>> +                                virt_to_maddr(_stext));
>> +        boot_info->mods[boot_info->nr_mods].size = __2M_rwdata_end - _stext;
>>      }
> 
> The original code had the end address as "__2M_rwdata_end - _stext"
> while now we have the size as "__2M_rwdata_end - _stext" which is not
> the same?

A few lines up from here you'll find code adjusting what .mod_end holds:
We use it as a size field in most places (along with using page-granular
.mod_start; page-granular .mod_end wouldn't work as an address, as
modules may be any number of bytes).

Jan

