Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC0174AEB1
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 12:24:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560376.876260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHidM-0002rA-Kn; Fri, 07 Jul 2023 10:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560376.876260; Fri, 07 Jul 2023 10:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHidM-0002p9-I5; Fri, 07 Jul 2023 10:24:16 +0000
Received: by outflank-mailman (input) for mailman id 560376;
 Fri, 07 Jul 2023 10:24:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHidM-0002p3-2p
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 10:24:16 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b677bac-1cb0-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 12:24:14 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7929.eurprd04.prod.outlook.com (2603:10a6:10:1ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 10:24:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 10:24:12 +0000
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
X-Inumbo-ID: 6b677bac-1cb0-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVTiN6H5fNusdwKWpCeNqhZORqeoAvCpUI7eeZtPkQ+OKhs1Rfw9WZ/rxomYf4+UVWMmiUV274A5H8f4YBXNnGj5Gcz5p6Th9xW4VSoTZGCcxt/ldt3TrCyWUoVW43Kvt9mIQbIChPdHQDKEVA+aIonFKeJGGBQQ+LW+FWj6VqdFG50oueEJgnBGA9jU6RTLIZ80pK0pbOdKYdGd7GV6NmtUXA4mviklRWd66gcZ38f/2bKjkT3MFQjLKQIRnX2+QLs0oB17Q9lvfaXRoTYt6Bi6ahrpQQtO+kIGN4yRYZOx0pRcB3OfCSHPvTF2QVicjK2uN0RdKJkiocwai1e0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrjzAScu81OJ8Z+g2rhrx2sRQ6XH9ehb3XynSCHFF8I=;
 b=fsAX4J1JEo/Uv0eQ48EA0AEK3WaIblIokz7zU/qdQ1BaPpturQoVEJw7GuRatORA3n3rsqMkM0jbycrrVh9Cyojk8ONminyaMfssiq96qb/jPBpk7Bo8rjf9IPlxCVjD8Cun3CE1Tt4dzemHsax9WSAouacWvRm0LVaVJODf9rFFP3yRp0ovB5M/8TdilpbkK8r2zCajxvAbg8flU2MFEScCA80T9Bf6LY1AHGm+vzplzymqUpcWABcylDO1N/pz04FlBA+0A9sNnx8yiIWvKruHV0aoltiNGca3joYVaMaxtbtkyNPfFCCcu4jQSSY/eSmbm3g6bITkETuLw+zUFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrjzAScu81OJ8Z+g2rhrx2sRQ6XH9ehb3XynSCHFF8I=;
 b=aSVYpyGM5RebXUNJI7mjLKsC2TXlDpKdT+T95F7v1RZJ7TWB/8mPk9TN9/je1HATw0w1gpA1I53TMtIR2pUM4FnpZfkgxqlQUBD2Iti95pXbpexUOsMiOya6A5gS3ypkR09BNGVKdu3MXQ3pCo72His95PJfwEPPOwIzC/a7XH4GzzQ6sPszZlw75nUekp5zzkTG05hEZcXzk5QH+jhPbTYx2L2IglcekLnL0XURIiTc7i/loUVsIf1JhXKuqSCl08dC8uZMgWAehotqaW6NxQiLqkoIy/A2oUjIvoHautLTeG7GzSMCg+xOXQDNJQViheNL9ixsHjDRQjTEbPuO9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3bfd9a21-e4e7-2d9b-8a40-8b77c80e4fb7@suse.com>
Date: Fri, 7 Jul 2023 12:24:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/3] multiboot2: parse vga= option when setting GOP
 mode
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230705114741.11449-1-roger.pau@citrix.com>
 <20230705114741.11449-2-roger.pau@citrix.com>
 <47cc5f67-973a-2095-932f-6ebea2d3bd9e@suse.com>
 <ZKflLxsh1AKyvPOT@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZKflLxsh1AKyvPOT@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5f1d14-bb8e-42a8-3a39-08db7ed44e99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K1MARHoNgHEWZV1wpzQXrIY0P+1ortP5Y5HMreHNn8PqHAgdU1umZ9Zb4d7WgjboKuc30sJeJhelfbSuXnwGOvV0gD+Iy1W+GPVG87uJKD5sPRKPtbrWylrvE5FJMQj+un4XEGT63Lb0JAvv0cFUOSFRjqCUpy1jGtIstACYxDk0qdgqHNSYM2GSVVs/0F3/ul68+BfBmLtRlGmXtI5ajWznehTtYsm61EjPc1GFtLLxeeFlGq3Dte/5YMiLif9QvGNmyYLxxJ/Xi/YjhR1iZQ7AlVwYKhRhCUGZkR68xPFeUdhu1tbXYVVVgYAVpcloo3JiXssu6cHFX5++gIbvBHSg7FNwYdPRUpCVLg3/mIilfzVhQBfDIXyObvoEgK6okS25xnHXStoIRMM/DqzUUUsPrm4gosOD2rta0lfdPIAld577KITR3Hk2SzJFEe122ode+NOLkKNUenei3F0qCcgmKY8GKzij52Eg8g/KypvO5lCkE7+JWVLQ4PZ3QZDuby27jZPG+Fpcs/U51AoYOlUGv8p0D1wYzpsB1+vCoMiCh59A2XPVWRcdK5KHiAjJ0Il5AEAmLhimO/EqYS1zDYmqroSX1rfme2comGoxI2dO9K5dJ/S4sUbauCRACiBrVcZRltnzTmSORAoJ0+UZJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199021)(41300700001)(6512007)(478600001)(54906003)(31696002)(86362001)(38100700002)(6486002)(36756003)(4326008)(66946007)(83380400001)(6916009)(316002)(66476007)(2616005)(2906002)(8936002)(8676002)(5660300002)(66556008)(31686004)(186003)(6506007)(26005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0FQZnEyRFZFMm16MTlEazg1Vk80RkFud1VPcWdhSkxFQVorZXEvVmtKK2hK?=
 =?utf-8?B?cVBBSFpwTGxtZHY1eDQrV2FsK29DRTJFZmpveUpoUHdNK3FyWXA3WHZpMmhq?=
 =?utf-8?B?RjNlY0ZlYkszL2F4OWl1cUJQdVpEb0tqcUlKdXJQSUg3SzV4MFRrV2xKbGdw?=
 =?utf-8?B?c3NkeDdod3UybEVCT3AxdUtxWEJXM3YzNFdkdit2THVnZFFkazdUcmV4bEdL?=
 =?utf-8?B?cVl1Y0xzQ1h1LzBxYnR0ZUlpSnU5cjdLL3JmbGV3ZDJVV3JmWnZpOFV4THND?=
 =?utf-8?B?QUdHVEJVMjZiNHhLNmI3RWNiRTVoRmtoM1NVNnJrZjF1NGozaFZlNVBrTU9n?=
 =?utf-8?B?RXRvQjdrazBwSlhJeUxDaVNzNUIvNkhmSm13SnhhK3lOS2FaRENUQWkrQzgx?=
 =?utf-8?B?emdBbUNWMlJMRy95djJteXZpNEx6MHFqTXZrZk5QMHphSG1OTUo0RkRLWWJL?=
 =?utf-8?B?NTZXSHZFdjkrazcrWkhYU0R6THJHUk5kRlFmK0o0ZUVYWWR4MGY0WW4ya0Vh?=
 =?utf-8?B?MWFqSjE5dmhPTzNrdFc5RFZyeXJpQkhrNng1aVhsSHBIMHBsdXpiTk1lSFNv?=
 =?utf-8?B?MTZGOENLcEZmQWhPVHc3YWwxdk9pN1YvYysxa1ZvelRpNzk4SXB3NFZwdEdm?=
 =?utf-8?B?YjU4QkFIeFJ2K2VxUmczUEwwekk3bzZ4TFhzekJwRkFaZFhaNWsyai9wVTJk?=
 =?utf-8?B?dGE4MStpeHQyZW94dU1FNmJ1RjNXSml0UEowT2NIczc2S0MzdzhoU2YvNVE4?=
 =?utf-8?B?TDZLYURWTHVqR3lsZ0g5OWQzVWFNYVJiMHdXbFJyOTR5M0hlcUg0dkNFckxH?=
 =?utf-8?B?RWJ5RWdSUnJpOUFTc3RmNGw1ZFhVcnVWbm9xbHdHazI3NEE0SVVoVUd1MC8v?=
 =?utf-8?B?MUoyQUZnK3FoZzdlZjRVTFpXR1IrREthNnk0aTljeVRIQXU4RmIwdXI3ZG9K?=
 =?utf-8?B?OGhqekM1SG1EeHNObUJFSzV0QldkaWpNdGJOZ3Fkd0pKbmtsc0llR0MzQ1Q5?=
 =?utf-8?B?c1BRL0ZmYmFZUlpQSWZkQVpHRWtLVkw1NHNQTWNkaVp6Q1FxL0FEa3MveHVq?=
 =?utf-8?B?Vk54dmx1SmcxMWl5SDFzRVFZY0Z2dkdmaXBvZDFJNUFjL2Y5SGlmTi9lQUlr?=
 =?utf-8?B?K1ZwdDZCdGsyaldIT2Vua2ViZFk3UDFValp4bGVGMkI5bmYxaWZNakUwRFNr?=
 =?utf-8?B?My9yeXZRS1JvUGZadFpuVVh0VWpzL2ZVT2xldlZOVmhJTDNQZTkrdFJvOEhH?=
 =?utf-8?B?bWRjd2pZcS9rZzNTb3d3ZjZoRXAzRlZNYzg5SFk2Sk1ibFo5dHVyZlZ4YTBs?=
 =?utf-8?B?ZmdPNHpDVHpXY1dhejQ0ZWNtcUxocm10THdpYXk5ZmVsdUFvOGFnMmExMXlD?=
 =?utf-8?B?Z1NuVnZvTS92ZlBEeUJTSkZpbGdXV3VmbDl0dUpXOWtCalZ1SVNySFdZM1NL?=
 =?utf-8?B?YitHMkFWTGo5MldHYXRSWFVrbEdiaDRnU1BuNVQvYVdPdno2RVFHNUhsSExQ?=
 =?utf-8?B?Z2tlU0IrY3hvQVp2R2QvOEdoeHVQQ0ZzbU16K3VUVUJ2eEVZaXhTdkM1dG9J?=
 =?utf-8?B?VWNJc1ErU1AxUllBTlpYc2tQYldiNk1zWm1ZYWpVRFNQNXpRcXAvVVcxWkd2?=
 =?utf-8?B?TDd6a3c4b2RUR3lCZGJ2Y2VZWTJUeG9nRklxV2N5RUNVU2ZHdFB4NVFzUk45?=
 =?utf-8?B?SjZ3YlE5cDlpTGFXR1V1c2pENWxXdm9GSkRvbTNXdjkvTUUxVDBiUnFGTWly?=
 =?utf-8?B?WVd4M09XdWxDUFlBNGROTENGeUYxOFowQ1kzZjl2TnpOdzNuSk42NDlpQmZv?=
 =?utf-8?B?WGw4N002ME5BVEFGdXBFUyt4OTZGSEc4blhkUTg1QTJMbUZGOXZMUmtQM2x3?=
 =?utf-8?B?OENBeEJKSWxNdDFJYXFTMFgrQ1l1NzA1SlEvNFk0YmE3UHhzUjdyc05nRDFn?=
 =?utf-8?B?emRERnpWQzFxMkR3eW5yN2FPeG4rRXFzd01EZWorSEZsNXJZajJnUFVDdGt0?=
 =?utf-8?B?YWVPQzYxcEFhM0JWZ3YrcURIYzdMWldDd3UxT1lVdERUWnFBYjRhZEZ6SGFt?=
 =?utf-8?B?S0ZwYnFEZUh1UVRZTk9jeXVaRWhGaFd1WDZ3YVF6V1VwWk1SMmc0ZHltd3lI?=
 =?utf-8?Q?tCxJdh3WCT7yX7FLpxrXHOUw/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5f1d14-bb8e-42a8-3a39-08db7ed44e99
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 10:24:12.0846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46ittGHQMyxdl6LxrifO7dcnpD0cnRF1wAvHWbiS5MkNzFWWkLXGmy2c5bw+9PHvsxRYU33cVYcpBSpXrOKFaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7929

On 07.07.2023 12:13, Roger Pau Monné wrote:
> On Thu, Jul 06, 2023 at 12:41:58PM +0200, Jan Beulich wrote:
>> On 05.07.2023 13:47, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/efi/efi-boot.h
>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>> @@ -795,7 +795,30 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
>>>  
>>>  static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
>>>  
>>> -void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>>> +/* Return a pointer to the character after the first occurrence of opt in cmd */
>>> +static const char __init *get_option(const char *cmd, const char *opt)
>>
>> Nit: __init and * want to change places.
> 
> Hm, yes.  I assume that placing it before the return type is not OK?
> (static const __init char ...)

That's still in the middle of the return type then. Technically gcc
accepts it being placed anywhere, but they reserve the right to change
meaning when not placed appropriately. Recall that you may alter both
attributes of a function (or variable) and attributes of types. Hence
to disambiguate both, proper placement may become necessary down the
road. And while it might be that

static __init const char *...

would also be okay-ish (albeit I'm not certain), that's still against
how we do things commonly (i.e. a not written down style aspect).

>>>[...]
> 
> LGTM, please adjust if you don't mind, otherwise I can send an
> adjusted version.

No need to send an update.

Jan

