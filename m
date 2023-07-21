Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 096D875BE8D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 08:14:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567348.886269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMjPF-00082n-RQ; Fri, 21 Jul 2023 06:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567348.886269; Fri, 21 Jul 2023 06:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMjPF-00080H-OW; Fri, 21 Jul 2023 06:14:25 +0000
Received: by outflank-mailman (input) for mailman id 567348;
 Fri, 21 Jul 2023 06:14:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMjPE-00080B-A2
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 06:14:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6053cc9-278d-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 08:14:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7041.eurprd04.prod.outlook.com (2603:10a6:208:19a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Fri, 21 Jul
 2023 06:14:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 06:14:21 +0000
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
X-Inumbo-ID: d6053cc9-278d-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Azq1mvIe9Abbo9U2TjUacnmC7FCBb3wC7XeY/s1HJ4MUEqxKMvvAc63tAYWUVaHPHO2uv90IIzhVFpg+LxKgA3NXcjXWexUeg0PDctWUCHw5ynndAZr/PbcWGtklrzrY9YVIM5mwkB1WVsUjZ9gisVPLrC9x5hia3Ro5jmxYNn8UZNrggQ4PNjpIvBMkluHqiFOljaSTlv6tx3Eqz9Qwf6e4UtkMkVRv/XPiWngbSKLOqhUYN39DAb9JCvwSwWh6i7mBJ34iaM+YfKNJfztxHnc7e2ANqTNl/aIdcvstfntRA+gtI2sdobSqU7bb5V+b+NyRfRiRi4Yg36KspLkY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngtzY7KzRhC6pMMna28295OZkJY4Gh8I+QpnU6bveBE=;
 b=g14cCGqYx5IBPuei5sj5anM9c9c6BCoFD1DOkfiJrW5ct49S2oiBTSDW/ecW5wWnltZiS/LSZAj7RaC8mkl3H/QaKGJ//2x55Vd1kMvjgnFcKqdNhiQPrGUfMFSZMlMfreuriN4vvBPB/5HzBNVXC/8Tfg7U76G6Vbp7W5iaaNtn/pLohudrfbIpdAFDzFf4mKp2TkteXio/SrAZ0DiR7wQOYztPcoZfODV5oYX1evclGsEWjTPZ5JWsZ/IBfCrzyMdo+gnsYnsPvcWaI1SdUBj3Ktl5DfmOAzs75wQDLuTsa3bEPq1cpcYMq9OYdjvMOq3DycX/v5Bwwc+u0VUxlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngtzY7KzRhC6pMMna28295OZkJY4Gh8I+QpnU6bveBE=;
 b=fYFirGmMzSEZEhBkFvGhhkbPMpFMWCbVUY7goDo/87Ysq10tRsJeZDs6+sfpypOwISHbSsHTuSkj1ryznf6WI0DCuz4LlaAhYAGdf0D98/SsurHT56YPx20cgDgzPO2XbEF0l3lpuLsiJAycrZfD2kk+3/uj7y7GVJV2/JVwyMa5ktZ2wTX6mZO4Ev94FHBksFSekqzjL3yVrdrwN7iZVURNqP/LIZWo8io2UO+CYsXfDXPKWVS1YxKu6mR5/pXm7ozAvA/2Kgog0FDhtM3G7cwC4k9+s24/cyGjs4aUpyvnWJi9rIF6Y2MWWXQCNg6CdnGCIp981o4BgEb0mYS+Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4e0a0fc9-0c1b-4725-5692-de67ee68a980@suse.com>
Date: Fri, 21 Jul 2023 08:14:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 03/10] x86 setup: change bootstrap map to accept new boot
 module structures
Content-Language: en-US
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rich Persaud <persaur@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-4-christopher.w.clark@gmail.com>
 <alpine.DEB.2.22.394.2307081144340.761183@ubuntu-linux-20-04-desktop>
 <CACMJ4GYE6PW1SY35dhs4XkXd9ru25igrvMCrh4pJMWEBNNz0YQ@mail.gmail.com>
 <CACMJ4Gb_ZwKSjP7qzfQj98YQjSpBdFuWzeGQJUNNqst0GdXCOw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CACMJ4Gb_ZwKSjP7qzfQj98YQjSpBdFuWzeGQJUNNqst0GdXCOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7041:EE_
X-MS-Office365-Filtering-Correlation-Id: c181bb68-c6db-4b76-76a1-08db89b1b902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XYsf9yNlfZSjJN+RHJzoOzcYfy+y8IqMhEQDpRwIxboFs8VAGdxoKh0Aj3hgqLZNWWjd449Ow+z5B9r6O+iKP7Wz/E/sMvqwNeMl2u4Lx7JtWV5rbY/Jzv4ob+iP9nii/9aNCRVmRId1idii0eYHdM7ILXqpS2oB7+QE+sCGtdRFBGeUhqNK5zT7HlneR5Xw6oYYnVaRJR3s1cRYJV5cIrno18A0DWlt3zL0RnhlFunVu2ODcFNFw4jcatfYBUFycx34v3mq09dw/SEDNNLDMbqI8XnZq3AAhZrdRTYMqdmEyiqHw/ly4l3g34/v0dZ43h3OJ7F3WxFx0DYcj+2OB0Gu6yzPG2k0D3xHc9mpZxOnhT7HjyN+hjorFAUQpLBTHWZCoMZitGUSoOIK5kN0V8UkwXJE2f6gYQHm5FIOK/0f6YYI05dqfZ6AMAZ4FG2UiV2i0Wit73cYXUue10WS0AWHEPrZzFPl4n8V/+zEum61zghlXdVhPu8GHv2H4JSQf5GNtZR9zEnWbNRJZrDbqfalTIrhofO+PrCrAoUoBgV74cPVMwWCSWBD1K26G2DfLiNqZSgyPhG2ewrLJ9gBOPkwsnDuupeRqO6FqTfneeg6RxgjlNq1uChKndk7E+Iz2+nmBeQBW3OA2awKcPy2CA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199021)(41300700001)(8676002)(316002)(7416002)(8936002)(86362001)(2906002)(36756003)(31696002)(5660300002)(6512007)(26005)(6506007)(53546011)(478600001)(2616005)(6666004)(6486002)(83380400001)(186003)(31686004)(38100700002)(4326008)(6916009)(66946007)(54906003)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REl3c29yZEM4bDAvbHRRL2UwbnVycEpCb3lnT1FPUEMyN29PVkw5NGd2dDN5?=
 =?utf-8?B?QUlwZE5qMzhZTkdab2N1R2paeEVpMWJmY3IwRTdPbTdiZE5jWDlQRDhjVmZ4?=
 =?utf-8?B?SHV0T2pyai9ROUxBSUlPNmNvZCtBRkxHeTQ4OS9LZlRxa2tpSzFBNzdkNW9j?=
 =?utf-8?B?OG9UdURaQ0MwOFNJUUp0dVlTNENRTCtXRUlEMWdpd0hjL3kwNjRSc3dINWlL?=
 =?utf-8?B?a3ErYnQyV0FsQjIwSlNFSngxRnIyeFk2WHo5T3hsa25WUzUrY2EwSWZTUzZa?=
 =?utf-8?B?Y1V3UFlRNjR1OGo3ZXUxR2k2aUVJekJZWDJjUWFIMG9RVVVFcENUQWNZVHBa?=
 =?utf-8?B?Um4rbnlnK3lTSDcvMVNhaUFxNzBtY2V6VjIyMW5qQzFvTXdJZHdIZ2R4aE9R?=
 =?utf-8?B?eloyR0V1Yy9yUmduN0diNDhMYzZIYXRjcVpNM1d6UWNvYXZobS9QTFZWU1Rh?=
 =?utf-8?B?SmFodUM2cWxxNWhhVDhWSVpTTkdVUUorVEhVa0xabkMyVVpLZ3BEN1JGWHZP?=
 =?utf-8?B?SitVaUJXN29ta2kzemEzU2ExckZCNTJtb294Nk9OcW1PNEpCaklRWXhydzZ3?=
 =?utf-8?B?Z01Oc2U1WVBVTWdWSHhtQUVtdjhBU3MzWWNiaFdsSEtqREVkMHlSSDA2NlFF?=
 =?utf-8?B?N1M3UnlzM25qQVROWGtpeU9iTXduYzIzQnBUdklTWFhHQ2gzYm1SN3oyN21Q?=
 =?utf-8?B?R0FJcUw4UnJBYk9haUlRRDBscDhuZU9jQW9oTVdLVVN3aFdIVlJycmQ1Tllr?=
 =?utf-8?B?VDVWbTlUbkVjakJLb0l1NldTOVV1S01uYU16akprSWlJNjhiRFZYa01JMkd2?=
 =?utf-8?B?c0U2S3EzS1pTdHg2dUFyMkFTN2U4Wm01WTRDNlNWMHB3V3ZFSytybzZpN0pG?=
 =?utf-8?B?VXBpMFVtR21qUHIxMnFBQTF1Y0lZUUNRVmZXbm9HRTQwYVd1UTNjU0hFY3o0?=
 =?utf-8?B?OHlQZzg4ZS9QNWozWmFlMDZ0ZU9nbnpZamhGRU9jRXJYTGMrRndsK0VRdDdl?=
 =?utf-8?B?dFRndnFkNm9QM2I0L3p6UUJIY0pvWGs1aHkxQ0tzVHFGVUl3VnBmY1VEMlZu?=
 =?utf-8?B?ZDdMMm5abWpUTjlkNks1bEpaR0ZmWDBPM0poQlJxVVRISXdaZnJocC9ZR2cv?=
 =?utf-8?B?bklRRVhwM25XTmR3ZWFzOFltZzlTVk9QbHFIbmIydlYrazZpcFBpT0pjOU5x?=
 =?utf-8?B?azh4VzZVV2F3TmdiMktIdUozZlBUUWhuUDlad1VPcG9rNU9aTExPMVIvZ3Yx?=
 =?utf-8?B?SlRWOE83eG00cHo0SjNBdFAzZENkUmdQbDRtaTg2WnJrc2JOWFNvTXh6dHln?=
 =?utf-8?B?QndXWEplQW00d25VTDBjNFEyUkJLZjFQZDR5T2s5ZXZ5SWV4Vm5TVVJJc210?=
 =?utf-8?B?bDFaWWpRUjZXMzUzQWhCejhEa0ZVdTExK2VuSlEyWkFjS211N1VjeTFMRzZk?=
 =?utf-8?B?WUNXYXlVSUZYbkJBSTAyN2svSUw1Nm9WYWhpbXp3VHRXRlBqNjdqaXVkSHc4?=
 =?utf-8?B?Y3JSTGxwbCs0Wjg2Z0tNM09XaWtFd2RSeE9vRlZ2ZWtWNUJSUUhNT3p5RWpV?=
 =?utf-8?B?SXhUQ0RPaWwxaVFmK1JIdGxRNERDK3YzSDBMVDhlMWxPcDhJMnF4RExxZmx6?=
 =?utf-8?B?dXlUd280WWtPT29VdjVMMEhFTnNpR3lMb3V5T2pCd0RRSnJ2T3lYdEhuSGkw?=
 =?utf-8?B?c0hmZ1BPQXVVODdvOFFJTWxGODNqQlE4bm5aZXlIQmd5WE9UaGJkRUtiNVcw?=
 =?utf-8?B?VTF2eVpmUVNscU5DMW8vQWM3eVFUcloyZGg3dzlUVENHVWs5czU1REt6QWdR?=
 =?utf-8?B?Y1ZDalNRRXREVGZzbUZPSGhCZWUxbG9FOTV5VHZrajNMSXJRYURnL1U2c2dT?=
 =?utf-8?B?RUUvVHdQMVVsVmxwMnJOWjFFaC9iZEhjMXBiN1FzcVFxd1YvaXVqT2lWZHR0?=
 =?utf-8?B?QU42dlRUb3d2WWRnN0s3cEdQTmRaZ2t6VlNxN1I0SVFzNXhEMkZyQ0lGQi9V?=
 =?utf-8?B?UGNOT25OTUc2QmdXUktML0NQejQ3M0lRb0VzcytLeGtmdm9ZUUsxYzVuWStN?=
 =?utf-8?B?NExvazA2aG1ncjRjL295aXkxSjJZZlBtTW1TUmptcTQ5MHQ4ZzhSUCszTlJX?=
 =?utf-8?Q?0KxozHAgD/gLu45lVbaWv5zss?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c181bb68-c6db-4b76-76a1-08db89b1b902
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 06:14:21.0182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5JuSqiEBrNzFtfF2WWt3M8y913GwpMLTDHsUF6ejF22E7ZruK0P5aK+VkntVUt+t3j5JD/ppiWGYU2jwY+OWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7041

On 21.07.2023 00:12, Christopher Clark wrote:
> On Thu, Jul 13, 2023 at 11:51 PM Christopher Clark <
> christopher.w.clark@gmail.com> wrote:
> 
>>
>>
>> On Sat, Jul 8, 2023 at 11:47 AM Stefano Stabellini <sstabellini@kernel.org>
>> wrote:
>>
>>> On Sat, 1 Jul 2023, Christopher Clark wrote:
>>>> To convert the x86 boot logic from multiboot to boot module structures,
>>>> change the bootstrap map function to accept a boot module parameter.
>>>>
>>>> To allow incremental change from multiboot to boot modules across all
>>>> x86 setup logic, provide a temporary inline wrapper that still accepts a
>>>> multiboot module parameter and use it where necessary. The wrapper is
>>>> placed in a new arch/x86 header <asm/boot.h> to avoid putting a static
>>>> inline function into an existing header that has no such functions
>>>> already. This new header will be expanded with additional functions in
>>>> subsequent patches in this series.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>>
>>>
>>> [...]
>>>
>>>> diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
>>>> index b72ae31a66..eb93cc3439 100644
>>>> --- a/xen/include/xen/bootinfo.h
>>>> +++ b/xen/include/xen/bootinfo.h
>>>> @@ -10,6 +10,9 @@
>>>>  #endif
>>>>
>>>>  struct boot_module {
>>>> +    paddr_t start;
>>>> +    size_t size;
>>>
>>> I think size should be paddr_t (instead of size_t) to make sure it is
>>> the right size on both 64-bit and 32-bit architectures that support
>>> 64-bit addresses.
>>>
>>
>> Thanks, that explanation does make sense - ack.
>>
> 
> I've come back to reconsider this as it doesn't seem right to me to store a
> non-address value (which this will always be) in a type explicitly defined
> to hold an address: addresses may have architectural alignment requirements
> whereas a size value is just a number of bytes so will not. The point of a
> size_t value is that size_t is defined to be large enough to hold the size
> of any valid object in memory, so I think this was right as-is.

"Any object in memory" implies virtual addresses (or more generally addresses
which can be used for accessing objects). This isn't the case when considering
physical addresses - there may be far more memory in a system than can be made
accessible all in one go.

Jan

