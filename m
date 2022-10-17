Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 552AA6006A0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 08:19:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424101.671309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okJSW-0003CZ-B6; Mon, 17 Oct 2022 06:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424101.671309; Mon, 17 Oct 2022 06:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okJSW-00039S-7s; Mon, 17 Oct 2022 06:18:44 +0000
Received: by outflank-mailman (input) for mailman id 424101;
 Mon, 17 Oct 2022 06:18:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1okJSU-00038a-Rs
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 06:18:43 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2089.outbound.protection.outlook.com [40.107.104.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bba5e86-4de3-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 08:18:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8943.eurprd04.prod.outlook.com (2603:10a6:102:20e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 06:18:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 06:18:39 +0000
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
X-Inumbo-ID: 8bba5e86-4de3-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KR3AUdNVKShookLBErG2y1EAb7rySwLnw/uQCjAHjWtfvvh8SX3hQtev+r9PKHZKK4DI50+TJlXfRjA7xXG0vgl9fzcDpc4gaSgEJ6ppzJBcJuCWZw4fd3DiWUWvmODLYfffzsqbf8UCYqKhn+dMlSrvMDeHScd3fTKXRJLqTtKebOdpnAfehjzDxU16acIGORXUqCVjGep/A+0RTJnhXYnjFZelEfa5p4K8Cb5t1xL5CnbPa07HarPDHwGlLAH1oiBhLvPH18hIi1sngzHzeHNuTEc7PugeIygrDkVCXxYDXB2ZbU+obKeik5MRtssrC5aSLLG1uUjlKh28TCi2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UI+Td8eue2PWUl764XmnwIdpSUjsrLQmd+fwdyuvZg=;
 b=hSqyMB5U2aTjdN3z7M8F0EMj6pRSGgglR68Manes91s97k2bEi+lfNM+C5V6un11DPQTgfHXkRGFCx0I8zi622k0krEhCmbaTBf1KHmVWO2CWJIYj1uDwcHH/QjGJYahRhqInyaMyW4ZdOa+bDc0ZukvPGDbXWvRr91d34vvjaz4whuViVroQT8y5jb3tticO+Dkshm9wvcapnZZ1iVY0k9bSOzKf7c9twdWhdrTxzW34cvYOBGcKJFFpff1u7rxRvjbS41UectPoFy4LFLPMSNR10dM6VtPSM7mHRb+Zklg866HOJaIN5Aj6rAkJt3w6BiKffS247fLvyL7SWzkUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UI+Td8eue2PWUl764XmnwIdpSUjsrLQmd+fwdyuvZg=;
 b=WcdTiceNvFD1+APRRow1Q4EMtQ2L2bLnSBosKjd6RTiuWK6v8PgUqpeRGBd12GYgWkb0Bjozg4GT3XFkF/gJi7ncVp8CP+h5wel53uXmCqTxMzlxMQQgMmz6mXd38ARDvs8ypcrs4FhRtuD0eQI56Rip/XV3NTu33pVztVulQP82P51smWL5r+dRgWwqrcBJzuXWHP0ztD3TkLUxjIGLjJ5Nkyos9sChNehpqq/EIu2l+NwXSq+0tEMibRLWGSHn4xDkc4/Wk3YoOGi+DIYiQ8tDP5ybD/tLXM8SYrGXPxFstjmccecnwH0jMSTyu3aIxUPjnH9JdUGSSQL6J1U9kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa699a9e-b967-2453-c53c-de96c2c1ebcb@suse.com>
Date: Mon, 17 Oct 2022 08:18:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] xen/arm: mark handle_linux_pci_domain() __init
To: Julien Grall <julien@xen.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
References: <20221014025354.30248-1-stewart.hildebrand@amd.com>
 <0ade954c-5741-754c-fc59-177feb67ddf4@suse.com>
 <5f985e76-e817-5d44-3463-ffc0a98c407c@xen.org>
 <728f2beb-dc28-9140-0fec-0a67bc49f3f4@amd.com>
 <456e5a86-a875-bc30-cf8b-e4497afc530d@xen.org>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <456e5a86-a875-bc30-cf8b-e4497afc530d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8943:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fc01ce4-e666-4d42-0dcc-08dab0076e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YqPMhbRlMypLzPDyxRDtlKyhn+zhdvJ5X9HKskJR4yuYEC21fcodQVC6FQx5Op8tllRVz7T9MgUFTajFFRMm8v7IbGtzLyZPMVsbvuGm73dOBHvZrrFMeW9/yNxm3TXQQENbckCji+FxVd6m/E229y7kHJfZMWWE/rIb/5V68ejR/AxVowFeh7YDE8ZJwmLNKoUzL1WZfieLNdQmLEJxr0vHWhkdn1LKzHlqLTuMgmjYCi7slzdX30V9tBF1AyC8GE22FUz9gtUu5rBnqNGXoqVkZ0nkPOgFxEmkm95RkDubpD1TiGPtgYBP+hIu5nnhXjI7ZV1UftZdsa1dYKT0X7XWtWWqPtYdZ7wGjM7qwPNeQN6NxYZhRZPluwPXgTDV+eit1wT5uNeAiv3y5heUjpaebb9QtFkqV2ge+zV0ojmfDDDoENZ9bObqs+w1nV9P5zcePIttV8lNH7X3Si836Kgzy8KeL6LuLYNIMEVdGCfo4fcBxrDdOcv9W9bgNLa/Ntk+tljG2c/Q1qUxje0ZM6LZ5s1oxpor2MvL5cLmPFt/Yvj5m/1tlM71E6vpc3D/bXjedGOydrUPEAvBrAiUJiuwJBFcPDiZHFIaPzggQKiEiHvirWmQ3U6p7kk9WkmbydV42UuE5o0H1URcZBszK66GgjjC98gNtImUXPBYohBUjmmYD4pZOZiLhJ+sSmO8QrtLieVy8pBY/DLqn37Fp4sVFDovCp5uNhZrTl8sKpnrCJICJKUWydbNr96QipmKJ0tlTZzSt/CwdaWRbJAAalYJ3wjgKklVELNVbPTprfw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199015)(36756003)(31686004)(38100700002)(8936002)(5660300002)(83380400001)(31696002)(86362001)(26005)(6512007)(110136005)(54906003)(186003)(2616005)(478600001)(6486002)(316002)(4326008)(66556008)(66476007)(66946007)(41300700001)(8676002)(53546011)(6506007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWlXdEs5aFBWVEU2ZTVEQkErdlhyWWs1dWRoVG9BVStFKzFsUlllL1YwN0Fn?=
 =?utf-8?B?cU9jRHRYS0ZpOVNidTlUL0NBdURvbW5sc3hvNlY0UW1rYVR2MG5hRUJlVUh2?=
 =?utf-8?B?Z3NVYWNsM3UwMmNmWnRwVU5xWEZEOStYd0U3UDFUTThyeXZhdGM5ZnhMN0FY?=
 =?utf-8?B?ZUVDcHFqTGd2Z1NpSTdXcWM4SlNVaHJjbkhVRDZZOTNxTm1mZXNuTkdLZ09n?=
 =?utf-8?B?M3ROVFlvYlowWU5GUTNEbjdWR1FGYW1HTWNGY1V0NUwwbFFacFF1UHQrV3NX?=
 =?utf-8?B?dHJMN1crQUlzaWc0L0h4UFYybnU0c1cyeno1MVdZSFk5NitjQWI5cjlxVHZX?=
 =?utf-8?B?YzFnQm5oY3ZmQjdweG9VZXhkaTQ4RGNEV0RDcUwrU2lQNENQVDRTbVNIenJQ?=
 =?utf-8?B?MnI2Y1ZxY2lzeWIvTWUyMklLYWhjZmQrSG9tSDYwOXNwVStVMnJOV3N1TThC?=
 =?utf-8?B?T1hDbU1tejJ3N1FBRzlxTVFZenpUcCs1cCtUS3c3VjBxWWlYVXJyOFh3b1lV?=
 =?utf-8?B?T3lwaTROdnF1L2JqSnhZaGxRWlJzeHhUdGtId3pMUjdzQkd3VU5wVGNLcHFp?=
 =?utf-8?B?dDhmTGxSTUhCU24zUStzMFlwV0tmcVpxUldZU1JuUUgyRDdxV1FETjVhVk96?=
 =?utf-8?B?T016cStDYStiNUxDTjgvT3p5Tlc1MjV2YU1nYUFjTVNMUWZXazV1STJvKzU0?=
 =?utf-8?B?djZoQzJSYlpIV1E1OEtPaW1ZYVlNWmdwVVNkMlE2UDVsTEMwS2VSdVBUUjVU?=
 =?utf-8?B?WHY1QlgwR0Izck5HUC9GdXRzcFVvRVVTZnFOKzliRUFIRERSUmJCdHdvbnFs?=
 =?utf-8?B?djVQLzhFMlBMdXpDY3NYaG9PTjkwTGhWRXRSMW1TOEFML2V1S0hac1hlVGo1?=
 =?utf-8?B?eFdDeXRtRUoxYVdZM2lmcTdIOWVFMlFoNS91QUZqM3NGcWZ5MUNPL3J4Q1lB?=
 =?utf-8?B?eXFVMUtSVi9tc2hQeGxqS2FKRmRVZFdSWjJUUHVhT2dkS3BsUmZnM2Jadzh3?=
 =?utf-8?B?VnRSRkxrZzkwSzBtSTRoS0NXTjgzK0hrSHlNTnpCekNENW90MjBrbXJaemM4?=
 =?utf-8?B?bkVXRElOM1dHY1JtdjdiYWhOR2lZRzIyRm15S0d0S3UrTjhBdUdJZE1iUkx6?=
 =?utf-8?B?L09tbVNwY3ZReEJSb2R2aHBScDNxTFU2SmhWUjBvNTROUmsvaU1LVkNvT0RQ?=
 =?utf-8?B?ck5ZMEJEenFFK2NrSnllVVhNWi8xUE5EUVZoTXo4djI4V0NTNG1heHhhSUor?=
 =?utf-8?B?TlZ3TE02d2V6SldtU2JyUWNhaFVpU3oyTUx0WFhwSnY0RTZ0QnorVitFUEJD?=
 =?utf-8?B?dDhrUDgvRG1mcWhGVlVZRjluWnlSUDQ2Kyt1WVgrZU11aE05akNrYng4M1Zp?=
 =?utf-8?B?ellrRFhZeHdNM3Z0aWw2S2Y2eGw2ZVF2K0RTOTN0RWh4SEJyZXJ1OXZLUS80?=
 =?utf-8?B?Qzl0MENOTmI3YkwwSzU3YkVqcm1LOWZTVm90ckhjTEVxM003T2pOM3lPSmZU?=
 =?utf-8?B?WEh0d2p2cjZyc1J6RURjKzA3eGh5aUdDTUs0aXE3YUhFY1oxOXZuZFlqTk04?=
 =?utf-8?B?RTJJbzdJbHRiaE9nYzRYV3IrQXN5VW1vd2RwRGIvemNsZmxXZkp4czdMeFdk?=
 =?utf-8?B?cCtQelFZM3E1NGpLajIyUXdkSTdnN29jOEtJb3d1UG1ZNzBML0RJN1hQa3Ry?=
 =?utf-8?B?NWRuZ0hHMENjd1NSSlV2dEN5S29Vckg5bWdyTC95VkZFQXlsUXMyTXhtVjFk?=
 =?utf-8?B?dWVNbEU4VFI2dkRzZ0FLMUJKdjV5OTJLc29pZzBwbGZlOXdXODF2TzJjNmJ3?=
 =?utf-8?B?M3lROWIvQTFpWW1tK0N0NjhOWE9IY0xlTk1qQ0c3NmhXL0VqM21kQmZ1SGIy?=
 =?utf-8?B?ZnFKZVRUZG5PN2lScDlZTyszNVhNWm1abmxyOGVkdXhBNjRzbzZFdVlGdWFT?=
 =?utf-8?B?WGNTbEZjemd6QWdjYkorcDVCVDc4T1VwSE4vS2kyZFpQQVJLL09NMFliUVRG?=
 =?utf-8?B?QlFBc2ZhVzZzdG5pM05LcGluMllnTWx3eUNUS1VicjhFZHJwK0pxbkUybTgv?=
 =?utf-8?B?Y3ZVUldhSjlDOUhobmIzS1U5WHIzYkFidWRvNDZNeEh1N1g1NUQ5Sk9zSHkw?=
 =?utf-8?Q?PwYleWUh97YPf1YNeEPAhlocW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc01ce4-e666-4d42-0dcc-08dab0076e74
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 06:18:39.3049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHoLb8CvsFc39yx6IZK8R3vz+KZW9mp4Qku4Sf3uOGZ0VAYugyC17+VTFhmjhVV8HCJY/kFgXIqSqTTnB7UjHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8943

On 14.10.2022 22:15, Julien Grall wrote:
> On 14/10/2022 20:23, Stewart Hildebrand wrote:
>> arch/arm/efi/boot.c: In function ‘efi_start’:
>> arch/arm/efi/boot.c:1464:9: error: ‘argc’ may be used uninitialized in 
>> this function [-Werror=maybe-uninitialized]
>>   1464 |         efi_arch_handle_cmdline(argc ? *argv : NULL, options, 
>> name.s);
>>        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> I am a bit puzzled why it warn on this line but not few lines above 
> where it is already used.

Same here. Plus it ought to warn for argv then too, I think.

> This function is a bit difficult to read. AFAIU, the code look like:
> 
> if ( use_cfg_file )
> {
>     argc = ...
> }
> 
> /* do something common */
> 
> if ( use_cfg_file )
>    efi_arch_handle_cmd(argc, ...);
> 
> The GCC with -Og is probably not capable to detect that argc will always 
> be used when 'use_cfg_file'.
> 
> The "do something common" is two lines. So I am tempted to suggest to 
> just duplicate those two lines. This could also allow us to move all the 
> code in the ifs (nearly 100 lines over the two ifs!) in a separate function.
> 
> But I think Jan (the maintainer of the code) may not be happy with 
> that).

Indeed. Even if it's only two statements now, my view is that we ought to
avoid such code duplication.

Further I wonder whether the call to efi_check_dt_boot() shouldn't
actually live in an "else" to the 2nd if(). It would be at least
questionable if parts of the modules were described by the .cfg file and
other parts by DT (which in turn makes assumptions about the relative
placement of those modules wrt xen.efi on the EFI partition, when I'd
expect it to be self-contained).

> So short of a second better suggestion, initializing 'argc' to 0 
> (?) and a comment explaining this is to silence the compiler may be the 
> way to go.

I'd prefer if we avoided that, not the least because this could then trip
(good) static checkers to report written-but-never-used instances. What I
might accept (albeit that doesn't address said concern) is an "else" to
the first if() setting argc and argv (accompanied by a suitable comment,
down the road perhaps including a SAF-<nnn>-false-positive marker).

Jan

