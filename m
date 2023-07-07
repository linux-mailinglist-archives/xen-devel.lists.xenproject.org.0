Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9DC74AEA4
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 12:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560366.876241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHiWQ-0000nZ-Kp; Fri, 07 Jul 2023 10:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560366.876241; Fri, 07 Jul 2023 10:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHiWQ-0000lu-GE; Fri, 07 Jul 2023 10:17:06 +0000
Received: by outflank-mailman (input) for mailman id 560366;
 Fri, 07 Jul 2023 10:17:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHiWO-0000lo-Q2
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 10:17:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a31adb1-1caf-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 12:17:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 10:16:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 10:16:59 +0000
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
X-Inumbo-ID: 6a31adb1-1caf-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvcKEtS9SfHkA6dC5dNRy8yT2FF+Y+QpF7tdtTVwFCwmcnxpFo4T5xy8OrWugiqiuJAMhxCBbqio0w3DubkWOKbmf9E5Tn9czEeZa8mt2z8D99VccH60Uh88Y6bfharDyS/GPSoydkx7s7lD/yhLSuTllPDok5aCIP4bloBMHACGIiQmVJR8nHMA+jFUpy2wejj7KOwjyB2FNaEDtYd6G+Ipr/Q1ndZZq5beE4OX+f3A4R92FgTMHZgbuRO9e675yeFxHfJxLIciyX5BAp7JO3UhuqXEe0dOxdcmfa+Y9z//FGAlpams2CEV0eJLt3zhLU5YYrDD6BIj4/aEaNtI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3bffg+VqPaPLCUztFTe3SBOuAsFr6E4z1VQ4ZYZQIQ=;
 b=Uv/aey8FG0xH5m4tYnuhUajgMDfwp6+Xu6PqlxpLb3nSVPaERdG6+n/g/MX0KOrFDF85BP0tMFufA7jOWyRSiosewwn/zsLzyGKoOYp9whl2RtZ7uOFdHC0D4Kcobutv+M65wIRB+AcZc0Amds499EHzwwh5mnN2EW2Gtv7a6bdnk88zIj0HA8IAX2LEx4cHL9N/k2L8X3i3AqS7RcgyGD49DWXCkVQiqoueuqHP6dXL4x6ivrtdTXkpVZ4LLpr8ZbwLnDUXTsPcp6YeGm9y0px6iMNYp5nLwLw1XEFGn2xuHA2Zk9U27nBjhY3sNWofLMGq59cOqAXKGBhvnqu1lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3bffg+VqPaPLCUztFTe3SBOuAsFr6E4z1VQ4ZYZQIQ=;
 b=KzGvMZwJ5ryg1nxrzabUFntMv8uZeYiW1+eRRUklrGjODBqXeet65Pztl5tGmqOCVuXx1OMoABWIo/nF9kC2jCLHvB2EeEfsk4ZhqeqXBMWUiS5JBRzTUTYNHVaW4pnDyIPFOVPzRqSxpkkVrxhN4F4qGq7xpOOLTCGZc+O0ZKAjWJVpCiGb2oDhFr+7xLwss7y5GdqLhMEOK5OD2BGym08LrwW/MTUi5fjmBl89NV/SSddlRWn50P+xFFyovIOkAmnecUz2lJZIBDm0nZeNhifbNTjwHB9TG/QzVE+0ofA6ZX3opdzqcafrgorS3LPF105KFG6DV6zNC6CIaPYRvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <495946e9-191f-22fe-9ecf-08eb5af833ba@suse.com>
Date: Fri, 7 Jul 2023 12:16:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Detecting whether dom0 is in a VM
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: zithro <slack@rabbit.lu>, xen-devel@lists.xenproject.org
References: <CA+zSX=Y4MwsDSd9oSG1NQyt==YAw9SeRdh=eJxTUhhOx57ihWg@mail.gmail.com>
 <4ee01a0f-063e-ef93-ac24-da387d5b3438@rabbit.lu>
 <a680ae62-7765-aa51-1edd-9a1a7e39e449@suse.com>
 <20b1a79c-23c1-93bc-2090-8052f143422c@rabbit.lu>
 <27a3e6a2-b150-1d75-c86f-dfa2b906b298@suse.com>
 <CA+zSX=ZCmmKQX7acx-oK4nSki9ONscxLP7E8t8USjdjXJ9UDpA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CA+zSX=ZCmmKQX7acx-oK4nSki9ONscxLP7E8t8USjdjXJ9UDpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9496:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e550a4-96a7-42bf-cf9a-08db7ed34cd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2sMrUhR65NmFCgJ+NFveyv0slvxrroLceros5cHw1rKCeJIMCSJG7dyuyQco3pZDNXbLMCO9Au5JKVKBbCQPeKLP1up7RQvKtZJP5ruLl0Jnlll+T7+mYahx6a6pLV5sOGw2l1a/A0bRb2iWOtzv+XFM2u4eMYR1G4Tzy93bb0V71UXDkm7WWJwGZKAiNryo/TWvnfLlq5GdSSCvOVrGIvkX9MokJPFCbk/ki+INbaRBgEACbODyn/HgJvKYal9sl53rXs5IJkX2JMB45lJ0MFarqOC6jXy1mga5m5o2VJoPqhDQTVpmjlAANmdaGnjQ/LA+cxuSQI/u+SJFSzI4YRpNfUmPRy3/W9vkLkG5MBfTP0gZn61xehBiAmU9jCkDOVKZWbna+h0jbk/LvyNa3T1QWC9SaTqzAHsNbqEGUq5mwlvAby0Fkqxyf6rKHIdb1Lma1x0mwwf1kpkE/siBfcDJfwCrXk45xVYixPh15K+SAhxCLavA+YqPkebKd0LpafbM7qb+3GbMLhj6v4J91PIjxdsKl4TvJkuNS6rSFethS2KD4Ep0IU/09ZLvKBNVdXuu2AB6lbtf8Cr4zBbNd45RX4qQxnho2gWpZJLMKN38Ia537movgcnlpXANpDC7KnUCmMxhe+VTRgl3QHBZEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199021)(31686004)(8676002)(2616005)(2906002)(8936002)(5660300002)(26005)(66899021)(53546011)(6506007)(186003)(66556008)(41300700001)(66946007)(6486002)(4326008)(83380400001)(316002)(66476007)(6916009)(36756003)(478600001)(6512007)(966005)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXVDb0FpeVk4YXZONmpidGJGMitWY3hnMFY2OGIyWXA2US9PVWZ1ZVdqbW1y?=
 =?utf-8?B?KzdtRmtFN0MxMDlweHhMT1hSSzlLcU5mamY3bnJ2Y2JLa21YdSt4cmVIVXFR?=
 =?utf-8?B?T3NkTXlDekVvV01BbFd2cGY1cklCZUF0dnIweDlDREUvK2Via2lIYkhrV0pw?=
 =?utf-8?B?SUhvSFJZZ1pDQWJiaHpBRjR2UHA3OStjdHhOOTJLNE5LRGxEOEgvTFF6T1RY?=
 =?utf-8?B?SElIbkNiMjRzelYzb1lzQ1o2UUNyd3hGb1VGb0QrY0VKOW8rTjF2WmFnUnZt?=
 =?utf-8?B?OXZBZjBkM0I1QW9ERkRvdXI1K1dCK3ZyN0pBWlhYNEtqWko5cElGamNnR3FT?=
 =?utf-8?B?UlcwM1V5ekcxWDh3WjhrRjB1bXJ3VTJ0bFh1MzlyTUx6OE1rWjJ5bmlTbXlw?=
 =?utf-8?B?Rm13aGRsU3ZlR3M1bnQxcERuUVJpUDlNK1hzU1lsNm1leWZrUk0yKytvVHBX?=
 =?utf-8?B?UmdOUmZYc3d1M0lMMVRRei9uT0J0Z09GK3pjUUJiZllpeVFRTndZdE5PakI1?=
 =?utf-8?B?MlhaUHFsampGelE1SnpNYlF6NUtZekllMHUweDJvaWJVL3EwbEswOHlDSnda?=
 =?utf-8?B?NXVTdU5HUW9Gbmo4bFhUU1B5VVJaNGQ3ZXlZWFpxRXhpUVpLQzFMUktrWldk?=
 =?utf-8?B?eDhPY2JYa1orWEFBUU5NQ3RsZk1TWGJpK0NtRkRVVXVQcDVydTQvV01PbC9m?=
 =?utf-8?B?ZGVtSHJ4cTF3Q3drdEdaL3M4dGFaYUVnejVlYkdOY2JNMTZjVXZTNUFtRTdm?=
 =?utf-8?B?S1hnMTl4RXE5SEkydm0yUksyWDJEUXhGMnc5OW5xY01IMVIzZHNBMVhEUm16?=
 =?utf-8?B?TUl5OWU1RzFnRmZpZ05xcTM1eUhoQmM2bWJaT29RaHNqTDNITXhVbk15ZkVh?=
 =?utf-8?B?a0FYSEIrd3VFbUhJVGxRdEh2WFo3TmtLQzZtYkZONXo4YzROdkVneDcyVHor?=
 =?utf-8?B?cm11aHhYVW5hU0Z2NmhEMDJ0WlhGMUJsQng0SVVFKzJKZ0RPUFFYZ1RPeTFQ?=
 =?utf-8?B?a3JXVHRRK1VKcTM1TlBOZDJCTE1YNnVsMSsvR3JKenEvKzNSc0tuMzZNMXEx?=
 =?utf-8?B?b1NXOU9oN1dlRVg4Z3FwTWtMd1BycWNXRjE4UVV0aDlubzc5czd2amJZbUZz?=
 =?utf-8?B?NzVnQ0E1L0p0TjRJR2pOOFMzdEVVQStjTVhNSEpqblplQjU4RUYrekFkVmVM?=
 =?utf-8?B?NENsVGVGdTh1WnRWZTRHdEVYajFxYkdmdThiU3psTnZHdWowRkE5SVJyYjdZ?=
 =?utf-8?B?NWR2RThpM3RWdDVhYXNYTHdpMFJPM2FiTEs4NVJRV0htbW1CSS9OYkZFMDdF?=
 =?utf-8?B?UWRZY1IzT2RteEFyNU52SW51VFo1aDk2MFp0U0pZSFNEY0x3MTJLWkhHUmFk?=
 =?utf-8?B?cEdrRGIxM3lyMkZNQjRJcGliMDJoU21HclpOZi8vbEVBOFBaV1MzUFArVW5W?=
 =?utf-8?B?YUtyZ3kwRys4Rk9sVWdrMVkzRXQ5QmNuc3ZvVXpUYUNlZm85c3NVNlhaeXE5?=
 =?utf-8?B?S3ZuUjNTK3dHZURmT0hsQzVMMjB4N3hBZUh0dzlxcG84WGc1SHkwY1FKQWc3?=
 =?utf-8?B?eHd5QXNwdk9qSFRkVTVtSTZyc21QWE5YWHhFNDJ5a1dCZUM4TFFUNWhMbis2?=
 =?utf-8?B?Q0tDNGpVeXhyOCtnVUxYUmlOUk1rd2laL3dXamJtVlEzdW5LcE50ZHc0aGpu?=
 =?utf-8?B?dnQyd1ArTGkveFh0QWkvMGd3d2ZrVVc3QUIxWlMzY21QblI2SUtjdUxHeXly?=
 =?utf-8?B?MHlqckZtREJtUXhENzUvWVkrZ2RxTkFDMDBnZWJSU0RsUDRWTjM4UmthV0dL?=
 =?utf-8?B?d1RUcjdBc29KOHRjVEI0SnNZTUpuZjIzaFlTeFNBbkRrSy9oWjFVQWMzMEdp?=
 =?utf-8?B?VDNBYVVEL1d5RHAraGcxYnFLQnNFMGNxdjR4MXV3c04rNTZydDhKVzVUNXh4?=
 =?utf-8?B?WkxCZXBNblhCQmhvb1dCWFZuK1FNeDl5cDJNMzhSaGhSOFg1RmM3UG93dlhm?=
 =?utf-8?B?bE9RWFRBb0VXTUZWZmZJcjkyalBxS0RaYzcvcitLQ2MzVllkOWlsa0d5c1Zj?=
 =?utf-8?B?aG5pQXFwOE5YSExpSVZNTmhGKyt0U2gxeUp2NE5JcHBtcVFya2FyMWI3V0to?=
 =?utf-8?Q?rFlWf+XE1KiNzn/mw2dFFKw3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e550a4-96a7-42bf-cf9a-08db7ed34cd3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 10:16:59.6079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loIIhZjtGRyAvTk5ydyHJXIv9O+/Qura93D8Dj5faEx72dskYuGLInrN293gEBhMIemsiIwpeUYAbaspM8JdwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9496

On 07.07.2023 11:52, George Dunlap wrote:
> On Fri, Jul 7, 2023 at 9:00 AM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 06.07.2023 17:35, zithro wrote:
>>> On 06 Jul 2023 09:02, Jan Beulich wrote:
>>>> On 05.07.2023 18:20, zithro wrote:
>>>>> So I'm wondering, isn't that path enough for correct detection ?
>>>>> I mean, if "/sys/class/dmi/id/sys_vendor" reports Xen (or KVM, or any
>>>>> other known hypervisor), it's nested, otherwise it's on hardware ?
>>>>>
>>>>> Is that really mandatory to use CPUID leaves ?
>>>>
>>>> Let me ask the other way around: In user mode code under a non-nested
>>>> vs nested Xen, what would you be able to derive from CPUID? The
>>>> "hypervisor" bit is going to be set in both cases. (All assuming you
>>>> run on new enough hardware+Xen such that CPUID would be intercepted
>>>> even for PV.)
>>>
>>> I'm a bit clueless about CPUID stuff, but if I understand correctly,
>>> you're essentially saying that using CPUID may not be the perfect way ?
>>> Also, I don't get why the cpuid command returns two different values,
>>> depending on the -k switch :
>>> # cpuid -l 0x40000000
>>> hypervisor_id (0x40000000) = "\0\0\0\0\0\0\0\0\0\0\0\0"
>>> # cpuid -k -l 0x40000000
>>> hypervisor_id (0x40000000) = "XenVMMXenVMM"
>>
>> I'm afraid I can't comment on this without knowing what tool you're
>> taking about. Neither of the two systems I checked have one of this
>> name.
>>
>>>> Yet relying on DMI is fragile, too: Along the lines of
>>>> https://lists.xen.org/archives/html/xen-devel/2022-01/msg00604.html
>>>> basically any value in there could be "inherited" from the host (i.e.
>>>> from the layer below, to be precise).
>>>
>>> So using "/sys/class/dmi/id/sys_vendor", or simply doing "dmesg | grep
>>> DMI:" is also not perfect, as values can be inherited/spoofed by
>>> underneath hypervisor ?
>>
>> That's my understanding, yes.
>>
>>>> The only way to be reasonably
>>>> certain is to ask Xen about its view. The raw or host featuresets
>>>> should give you this information, in the "mirror" of said respective
>>>> CPUID leave's "hypervisor" bit.
>>>
>>> As said above, I'm clueless, can you expand please ?
>>
>> Xen's public interface offers access to the featuresets known / found /
>> used by the hypervisor. See XEN_SYSCTL_get_cpu_featureset, accessible
>> via xc_get_cpu_featureset().
>>
> 
> Are any of these exposed in dom0 via sysctl, or hypfs?

sysctl - yes (as the quoted name also says). hypfs no, afaict.

>  SYSCTLs are
> unfortunately not stable interfaces, correct?  So it wouldn't be practical
> for systemd to use them.

Indeed, neither sysctl-s nor the libxc interfaces are stable.

Jan

