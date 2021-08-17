Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9ED3EED0E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 15:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167845.306426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFyns-0007it-Vh; Tue, 17 Aug 2021 13:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167845.306426; Tue, 17 Aug 2021 13:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFyns-0007gu-SA; Tue, 17 Aug 2021 13:06:52 +0000
Received: by outflank-mailman (input) for mailman id 167845;
 Tue, 17 Aug 2021 13:06:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSHW=NI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mFynr-0007go-FA
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 13:06:51 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 367f3105-f33d-4958-82e5-e91d85ec44b7;
 Tue, 17 Aug 2021 13:06:49 +0000 (UTC)
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
X-Inumbo-ID: 367f3105-f33d-4958-82e5-e91d85ec44b7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629205609;
  h=subject:from:to:cc:references:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oHpm3lM+gxkamMY7kN+EKCfCX6TvsV0U/FOzBhgwNAU=;
  b=Lg4RMaZK/Kz1TRWccPpEKrfINBdFl6lSDYpOjmeuZCr3PavrIJ6QNVYI
   MqLZ7BEYuMxbKZb4qSiGlXKF1j/aYmhPmWUqhcDh8E7CM9VmegyH46BQk
   giZALWAGTNNKhgP3f2hs35dl8RpnDexitcPtsxB5PBGMJrp7vxUqoR1L8
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3irAD2tMThIvqdGmpt5eTJrlre3bbb06us3BwED/T4nFxkOQ3tEei7dBsC6Dt2Lxz7pX6SmaUt
 UaALi0MegwZ+oxT4Gk56ySNQPX2pXpTFuE9UHBWamtIO2YTw0+vtNaNDa0XnPmBvihPJnSiKMT
 v7wqgEkDQ2RmKkumEL2AjZzPTSweiBVOuhy+yXUmxcGY1i4o6xT5DKOoEEj0xr7nDXfFw7r4p5
 SPNIgU/fI8Pwm+KlEdCKsXT3zmydjeHMnePcF0kTju/YfiCPEzEsv69Vxa+D0lQ8cIk28eyKZ1
 3Si8QjRbRKICG88iQ3POLLPZ
X-SBRS: 5.1
X-MesageID: 52343813
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8LpPjaqufxj1VfJHlcrQqxcaV5uXL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXcH2/hqAV7CZniqhILMFu1fBOTZslrd8kHFl9K1kJ
 0QC5SWa+eAQWSS7/yKhjVQeuxIqLbozEnrv5am854Hd3AJV0gU1XYcNu/tKDwSeOApP/oEPa
 vZwvACiyureHwRYMj+LGICRfL/q9rCk4+jSQIaBjY8gTP+ww+A2frfKVy1zx0eWzRAzfMJ6m
 7eiTH04a2lrrWS1gLc7WnO9J5b8eGRi+erRfb8yvT9GA+cyDpAV74RHoFqewpF5N1H3Wxa0+
 UkZS1QePibpUmhOF1d6iGdpjUImAxel0MKj2XozkcL6PaJOw4SGo5Pg5lUfQDe7FdltNZg0L
 hT12bcrJZPCwjc9R6NruQgeisa4XZcm0BS59L7TkYvIrc2eftUt8gS7UlVGJAPEGbz750mCv
 BnCIXZ6OxNeV2XYnjFti03qebcFUgbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuBjla1ITMURcaVhbd1xCfefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEv6OSjaPUzve8PcV
 T6ISZlXEsJCgjT4OG1rex2GyH2MReAtG7Wu79jDrBCy83BeIY=
X-IronPort-AV: E=Sophos;i="5.84,328,1620705600"; 
   d="scan'208";a="52343813"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kY8CtJrAwDkFtFUtpRYyaagBnW864s7ZszoQ4x9Hpl/IPk1nup9VaVFmjBk3IoRzbLriSk/v2bj4jYwZ1nohIUCGK9Abmled6zHqOLRn4zoLhIesTzBLKEDiskGx+FRDOnT2uyPXqcwLMEf5c3127cSZcFFL7U2jfEjF0ts8dGrZGwx9XgDxddcV3u5x1H5qE4hM8lEzCv7wL1+diQo8VfH07LMuQ4hGr0mc1bSjOdieX1Lv6ov0Gcxh1vUGv+0gWaWnglKeVmVSgSqo//N+IZpVgeyY6Q81DPQRwNrqVX1YlqvJPCiWq2jTGeOBhuw9i6VLsiCnzZPc2X3PuY5OUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuANkQVeutF/L7+SxgIEQfHLcdyOJTE4jbC8ueLJrLE=;
 b=Elmqa3BsJ2G3aBuLPw13LalIm0tIBd0/65KoIDWE9KZjbGNf0yfh16cXET4kXQg5SLEwBkGiZqBEFu0KMxedOH8PAmbu8J/GJqNmmlNnI6+y5Gq3ejy7Qh1ePtMelFCJGQQ7UasqiWOwUEwuqHXaFY7/KTeGRXIjAe0RxOJUmFuGXZSWhUJVX498+m4Qx1qRU8WZtYNVbVwsNO0fAlUGlQfSyXBRmelgwDbzgW/iw/4U30hUMaW4UZz1es6k7jgOxrQYPZzglqyHkPZLZVGl7k+qU4h5axtEa8u8I4s2fMfk6NF7U9MrY4S1+NeSVXRbq0VoIi1OXMm9Y4+k6FMQjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuANkQVeutF/L7+SxgIEQfHLcdyOJTE4jbC8ueLJrLE=;
 b=qTzKtfMBH1uduQkk/RM58B58VJOjNR6ElP+PdD93Qj3ucmRcvmUkeQ8SR+7O+qzfL6DUkC/IOxKqViO7egyQnU6y6zLzvhqw4KADnCN1PoKMqDbYx41zDxN3xcslH7zcQuu8f7pLx8Q7CoaqQ4RnNwKxjbNeMoyaSQirdpADoa0=
Subject: Re: S3 resume issue in xstate_init
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
CC: xen-devel <xen-devel@lists.xenproject.org>
References: <YRsQArpQcpLB/Q5h@mail-itl> <YRuXNmpT+03aPo+p@mail-itl>
 <95ca90ae-9c37-c77c-67dc-66c1aabd1626@citrix.com> <YRuhFWLrplRRV6t+@mail-itl>
 <a575e7e0-156f-9ed1-cff2-92e4d7000090@suse.com>
 <78eb61ad-45ba-51f0-a5ba-624408d60cc8@citrix.com>
Message-ID: <a704d6c5-c818-e47b-32b6-f57b2d9670f5@citrix.com>
Date: Tue, 17 Aug 2021 14:06:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <78eb61ad-45ba-51f0-a5ba-624408d60cc8@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0194.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 990c25d1-88bf-49bb-8e4f-08d9617fd9b8
X-MS-TrafficTypeDiagnostic: BY5PR03MB5080:
X-Microsoft-Antispam-PRVS: <BY5PR03MB50804BC7F2AE529A840058FBBAFE9@BY5PR03MB5080.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mvjXCmx1qVY8jT94heDfJLSBuKj1F0F1Jbxvt2fyzjiEPMMXp7Edg8sfedRMgmlRql2LWPoYF9ay8Dga5pb1zpDBGKHaZvPOKFuIOVW31OHUNODoCPvcrRpjkjrYXw/0SRUKA2lAMSiQhzM9oBMFh5hw59L3teGwAAykhMdsCOJB54oswNKbKb8xOCHKpoy2lA3/mTNAtqTlavO3K9V1m9sq8VC7Hnx6jD2ZUz2h5MkntrPbJIUSXZVATBnBzZeJAuka7+Add57qpRklnIQWIlFKKRDkQcBtJYUHxP6IvDzLFJvmyGu7aq6NuRfFp5TMGUad3UzmzqAUo1N9AvdTFIINHoVGxrwwE17Jz06N7S7P3KpNzKDZ63T8yIDPelknX16Opt0/bo6T1OHiPEUzd4inZMvw/Z6zwP4h2PUJt8/gAx8400hP5JioDXhKGNTy70JdWm1drM4/3lpWy4SWSJRl8JNHmqI5HFiX5/3LyvpQ34robJjkxdIop9hw14hFnIE/wtqSk2rMDACR6LjWbouD5GPWrPq6OJ80qasROk4bmvE/Mhnu5YMjYjBxZvUcMow2TCA6Whpwl1bc2pOp2ByRbYDMiilzDojpHL1AgOAMKgwIpC1R1TB/WhMQQ2uZodZBQRvhoQ1pYtpcw5y0Q7IyRk051RSh3DnzvqMOuw5/fDV0dcYRHnZo8H5tYU/TtSJKOcaUas8SY9M/3Xd7eb4jzwlpguxWDDZ4fn3CPM6qHDeEs+vy9A9K/ECfpzeICfMJQS9Vgn9bmu5nvCnwf+J+vDs+aiaiDlwgUFOfigmR8uOhPcAUtPHecZCiH28d
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(186003)(6666004)(38100700002)(4326008)(36756003)(8936002)(8676002)(66574015)(83380400001)(2906002)(110136005)(86362001)(966005)(66476007)(2616005)(66556008)(45080400002)(478600001)(16576012)(66946007)(31696002)(316002)(26005)(31686004)(53546011)(6486002)(5660300002)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1B6M0c5TXJmQTJpYWIwNHJhRjJOTlZlaFVCeTZMVVZmTDBMNXFsNGcyejRQ?=
 =?utf-8?B?M0llM2g3Y1kvVDZ6dy9ZSXZwTVJQbm5XVllPc1daRXFscFlISC9sQW9jUUtF?=
 =?utf-8?B?MGZGN2tCN0RISVd2R1ZMdHJiL1VtS2pyUENGa2FjRlRwdGpuakF4SWJsVWMw?=
 =?utf-8?B?WDZ1UUJCcVpaaUZUQlg4U3lZTS9uS0ZRd25YanduU0Y5bTBkdXFNTjVWMGY3?=
 =?utf-8?B?Z1czQ2Ryd21rc0JEcEtrK3VpV3djbTRNU2RsbXNqNlE1TVVsSVFtZHVPNkI5?=
 =?utf-8?B?b3lQSVJyNVlLU2s4L3hiekw3UktIL0duWitQSzRMY0Y0Z1ZIWW82Ymdhc21D?=
 =?utf-8?B?cFNhK0hHTklBWERyTmJSYi9zcytla0pLY1JIQ3JJNjEzeFEvTHJzc0JldEoy?=
 =?utf-8?B?RmJ3eXU4WkczMk41VUl3bUFKWGRTVVVvQlovcUpWcGhBeWdqcHpqRWxqZ00r?=
 =?utf-8?B?M2ZpVElvdFowWkNJMC9ZN0o5QWlKcGxJOVV1NkdNMmNZTzdRNVNxTUd1NEY5?=
 =?utf-8?B?K3k2WUFBZWdsb2dTZVBMOXdlLzByOFdLaGRvUE5HMDRZNXBaRTNzd3BQRjZp?=
 =?utf-8?B?c0RzNU5ZSEkvU1MvTjJhQk9WK3RjS2pjbC9TdjlBSUVhaUFoQnYwQ2VxallK?=
 =?utf-8?B?OEZVVUgzckpKZVBQMVprSDRuZmhsak1JUFFQR3dTbis2SkxvYTVoSVV3QUZk?=
 =?utf-8?B?SGdKQkcrQ052RGgxQ3JGWkw1U3lTNTBFb1FQUVplSzQ3cmh4MGtMTmdmVEdR?=
 =?utf-8?B?c3F4MlZvb0Z4VTZOOCtuVlQyeDBRZ0VUVzdkaVN0SDA3eDhyZEZnMVNsaUZX?=
 =?utf-8?B?M29yYTFTTUZGRzI2OTk3V1YzYXJPNXpoR050WEdIcTNWN2JOdUFOMmV6dTRl?=
 =?utf-8?B?Y0xZSTduUitlb21MNUttcDZWY05pV0gzTjNDTDhHbEpuT3V6YXY3WWZKTmdy?=
 =?utf-8?B?b0x3SU93MS9XVFhaNjN4bElYZUZsZGU1OXE2RkZlSkkzblMvdE1HRkFmZUJ1?=
 =?utf-8?B?dzRtVHZKQWJKVUVjaFlsNHVOeGJDVE1CT21OdFZJQ0w3MVJ4UXVNc05vTU9Z?=
 =?utf-8?B?TGhFY3UvMi8zemN0NGF2d2lRUk1zS29XODhMRFFWMGhNZldZdXZnYVo2TVU2?=
 =?utf-8?B?WS9kSFpJbmdyRU8yU1QvcCszT1U5VTc5d3RCUGJyUVlLb1ZGNHBFREl6RXJl?=
 =?utf-8?B?REJhR1dYWUZSdWNHaFIxcG4xRlFPQThTT2hyZVNZaFZKMkpqQUpMd21NYjZ1?=
 =?utf-8?B?am5mK3FSNTVVNEQvZE42UDhJeG5YSnhWU3VsN1F2SjVvbnRXYm9iZ0ZZRnR1?=
 =?utf-8?B?MkdFdERxQWpOREdjNXZGczBsa2cxdUpYek0xN1dyY01VUHB0Q05LcnpPZVU1?=
 =?utf-8?B?OVNPbXlGendXbG9la0dUMUtVTWZqdVpZSUwxZFBvR3U2L3FvNWVKQ2tyclY3?=
 =?utf-8?B?dk95aEU4SnRhZjJTbmlENXdQa0JzQmFEZWlYQnlpRitiUTdTVEJkVWRWUGtu?=
 =?utf-8?B?SkRhaHVyaE90UDkyMnNobnMvVGF2bHA0NWFtb29pL1J4ZG4xVE1PK2tqSkta?=
 =?utf-8?B?ZUxuelN5V1B4SEZQL0tpVVdQTDFqelJ6WFVseXRJdm9ISnJleE4wZ1MwWHhW?=
 =?utf-8?B?c0R3N0txSTBCOTlWUnFXK1NpUHhBS3RNZ1dNakNuVjBXRm9IeFBVakJPUEl2?=
 =?utf-8?B?RFU2U1hmN2FSbHZQbVRWZ2NYclh3WXRKa3NBYlJ0VVM4ZlNRNmZXNmFWdlhU?=
 =?utf-8?Q?5fDhxvdX5m2+oqqi/pj1gjmAKXIYG3lMFpUYf6C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 990c25d1-88bf-49bb-8e4f-08d9617fd9b8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 13:06:39.2266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZK11WW4hygAUEDyowc+OXt0vOcZl0GsCUew1PWM0/VXkKkT9gNMx42CxK3BPHIi07EO3RoIuDra9YS4rznLb2AleJz2LwJogaM67xBRKsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5080
X-OriginatorOrg: citrix.com

On 17/08/2021 13:53, Andrew Cooper wrote:
> On 17/08/2021 13:21, Jan Beulich wrote:
>> On 17.08.2021 13:44, Marek Marczykowski-Górecki wrote:
>>> On Tue, Aug 17, 2021 at 12:14:36PM +0100, Andrew Cooper wrote:
>>>> On 17/08/2021 12:02, Marek Marczykowski-Górecki wrote:
>>>>> On Tue, Aug 17, 2021 at 03:25:21AM +0200, Marek Marczykowski-Górecki wrote:
>>>>>> Hi,
>>>>>>
>>>>>> I've got another S3 issue:
>>>>>>
>>>>>> (XEN) Preparing system for ACPI S3 state.
>>>>>> (XEN) Disabling non-boot CPUs ...
>>>>>> (XEN) Broke affinity for IRQ1, new: ffff
>>>>>> (XEN) Broke affinity for IRQ16, new: ffff
>>>>>> (XEN) Broke affinity for IRQ9, new: ffff
>>>>>> (XEN) Broke affinity for IRQ139, new: ffff
>>>>>> (XEN) Broke affinity for IRQ8, new: ffff
>>>>>> (XEN) Broke affinity for IRQ14, new: ffff
>>>>>> (XEN) Broke affinity for IRQ20, new: ffff
>>>>>> (XEN) Broke affinity for IRQ137, new: ffff
>>>>>> (XEN) Broke affinity for IRQ138, new: ffff
>>>>>> (XEN) Entering ACPI S3 state.
>>>>>> (XEN) mce_intel.c:773: MCA Capability: firstbank 0, extended MCE MSR 0, BCAST, CMCI
>>>>>> (XEN) CPU0 CMCI LVT vector (0xf1) already installed
>>>>>> (XEN) Finishing wakeup from ACPI S3 state.
>>>>>> (XEN) microcode: CPU0 updated from revision 0xca to 0xea, date = 2021-01-05
>>>>>> (XEN) xstate: size: 0x440 (uncompressed 0x440) and states: 0x1f
>>>>>> (XEN) Enabling non-boot CPUs  ...
>>>>>> (XEN) xstate: size: 0x440 (uncompressed 0x240) and states: 0x1f
>>>>>> (XEN) Xen BUG at xstate.c:673
>>>>>> (XEN) ----[ Xen-4.16-unstable  x86_64  debug=y  Not tainted ]----
>>>>>> (XEN) CPU:    1
>>>>>> (XEN) RIP:    e008:[<ffff82d040350ee4>] xstate_init+0x24b/0x2ff
>>>>>> (XEN) RFLAGS: 0000000000010087   CONTEXT: hypervisor
>>>>>> (XEN) rax: 0000000000000240   rbx: 000000000000001f   rcx: 0000000000000440
>>>>>> (XEN) rdx: 0000000000000001   rsi: 000000000000000a   rdi: 000000000000001f
>>>>>> (XEN) rbp: ffff83025dc9fd38   rsp: ffff83025dc9fd20   r8:  0000000000000001
>>>>>> (XEN) r9:  ffff83025dc9fc88   r10: 0000000000000001   r11: 0000000000000001
>>>>>> (XEN) r12: ffff83025dc9fd80   r13: 000000000000001f   r14: 0000000000000001
>>>>>> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000003526e0
>>>>>> (XEN) cr3: 0000000049656000   cr2: 0000000000000000
>>>>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>>>>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>>>>> (XEN) Xen code around <ffff82d040350ee4> (xstate_init+0x24b/0x2ff):
>>>>>> (XEN)  ff e9 a2 00 00 00 0f 0b <0f> 0b 89 f8 89 f1 0f a2 89 f2 4c 8b 0d cb b4 0f
>>>>>> (XEN) Xen stack trace from rsp=ffff83025dc9fd20:
>>>>>> (XEN)    0000000000000240 ffff83025dc9fd80 0000000000000001 ffff83025dc9fd70
>>>>>> (XEN)    ffff82d04027e7a1 000000004035a7f1 7ffafbbf01100800 00000000bfebfbff
>>>>>> (XEN)    0000000000000001 00000000000000c8 ffff83025dc9feb8 ffff82d0402e43ce
>>>>>> (XEN)    000000160a9e0106 bfebfbff80000008 2c1008007ffaf3bf 0000000f00000121
>>>>>> (XEN)    00000000029c6fbf 0000000000000100 000000009c002e00 02afcd7f00000000
>>>>>> (XEN)    756e654700000000 6c65746e49656e69 65746e4904b21920 726f43202952286c
>>>>>> (XEN)    376920294d542865 432048303537382d 322e322040205550 000000007a484730
>>>>>> (XEN)    ffff830000000000 ffff83025dc9fe18 00002400402e8e0b 000000085dc9fe30
>>>>>> (XEN)    00000002402e9f21 0000000000000001 ffffffff00000000 ffff82d0402e0040
>>>>>> (XEN)    00000000003526e0 ffff83025dc9fe68 ffff82d04027bd15 0000000000000001
>>>>>> (XEN)    ffff8302590a0000 0000000000000000 00000000000000c8 0000000000000001
>>>>>> (XEN)    0000000000000001 ffff83025dc9feb8 ffff82d0402e32b7 0000000000000001
>>>>>> (XEN)    0000000000000001 00000000000000c8 0000000000000001 ffff83025dc9fee8
>>>>>> (XEN)    ffff82d04030e401 0000000000000001 0000000000000000 0000000000000000
>>>>>> (XEN)    0000000000000000 0000000000000000 ffff82d040200122 0800002000000002
>>>>>> (XEN)    0100000400010000 0000002000000000 2000000000100000 0000001000000000
>>>>>> (XEN)    2000000000000000 0000000029000000 0000008000000000 00110000a0000000
>>>>>> (XEN)    8000000080000000 4000000000000008 0000100000000000 0200000040000080
>>>>>> (XEN)    0004000000000000 0000010000000002 0400002030000000 0000000060000000
>>>>>> (XEN)    0400001000010000 0000000010000000 0000004010000000 0000000000000000
>>>>>> (XEN) Xen call trace:
>>>>>> (XEN)    [<ffff82d040350ee4>] R xstate_init+0x24b/0x2ff
>>>>>> (XEN)    [<ffff82d04027e7a1>] F identify_cpu+0x318/0x4af
>>>>>> (XEN)    [<ffff82d0402e43ce>] F recheck_cpu_features+0x1f/0x72
>>>>>> (XEN)    [<ffff82d04030e401>] F start_secondary+0x255/0x38a
>>>>>> (XEN)    [<ffff82d040200122>] F __high_start+0x82/0x91
>>>>>> (XEN) 
>>>>>> (XEN) 
>>>>>> (XEN) ****************************************
>>>>>> (XEN) Panic on CPU 1:
>>>>>> (XEN) Xen BUG at xstate.c:673
>>>>>> (XEN) ****************************************
>>>>>> (XEN) 
>>>>>> (XEN) Reboot in five seconds...
>>>>>>
>>>>>> This is with added debug patch:
>>>>>>
>>>>>> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
>>>>>> index 6aaf9a2f1546..7873a21b356a 100644
>>>>>> --- a/xen/arch/x86/xstate.c
>>>>>> +++ b/xen/arch/x86/xstate.c
>>>>>> @@ -668,6 +668,8 @@ void xstate_init(struct cpuinfo_x86 *c)
>>>>>>      else
>>>>>>      {
>>>>>>          BUG_ON(xfeature_mask != feature_mask);
>>>>>> +        printk("xstate: size: %#x (uncompressed %#x) and states: %#"PRIx64"\n",
>>>>>> +               xsave_cntxt_size, hw_uncompressed_size(feature_mask), feature_mask);
>>>>>>          BUG_ON(xsave_cntxt_size != hw_uncompressed_size(feature_mask));
>>>>>>      }
>>>>>>  
>>>>>>
>>>>>> As can be seen above - the xsave size differs between BSP and other
>>>>>> CPU(s) - likely because of (not) loaded ucode update there.
>>>>>> I guess it's a matter of moving ucode loading somewhere else, right?
>>>>> Few more data points:
>>>>>
>>>>> 1. The CPU is i7-8750H (family 6, model 158, stepping 10).
>>>>> 2. I do have "smt=off" on the Xen cmdline, if that matters.
>>>> As a datapoint, it would be interesting to confirm what the behaviour is
>>>> with SMT enabled.
>>>>
>>>> I'd expect it not to make a difference, because smt=off is a purely Xen
>>>> construct and doesn't change the hardware configuration.
>>> Uhm, changing to smt=on actually _did_ change it. Now it doesn't crash!
>>>
>>> Let me add CPU number to the above printk - is smp_processor_id() the
>>> thing I want?
>>> With that, I get:
>>> https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgist.github.com%2Fmarmarek%2Fae604a1e5cf49639a1eec9e220c037ca&amp;data=04%7C01%7CAndrew.Cooper3%40citrix.com%7C9bcffe997fb34fe8b89408d9617e2986%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637648016779334734%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=xK014jSmKmoKdw%2BiqvsX7TLpLswzf7uzCc04xM1C8co%3D&amp;reserved=0
>>> Note that at boot all CPUs reports 0x440 (but only later are parked).
>> And for a feature mask of 0x1f only 0x440 can possibly be correct.
> As a complete tangent, we really want an mpx=off option (or extend
> cpuid=no-mpx to clobber bnd{regs,csr} too).  For systems not wanting to
> use MPX in the first place - and I'd expect QubesOS falls into this
> category - this will increase performance by not partitioning the
> physical register file, as well as reducing the xstate size for client
> parts.
>
>> I'm kind of guessing that set_xcr0() mistakenly skips the actual XCR0
>> write, due to the cached value matching the to-be-written one, yet
>> the cache having gone stale across S3.
> This is a rats nest, and area for concern, but ...
>
>>  I think this is to be expected
>> for previously parked CPUs, as those don't have their per-CPU data
>> de-allocated (and hence also not re-setup, and thus also not starting
>> out as zero).
> ... we don't deallocate regular APs either, so I don't see why the smt=
> setting would make a difference in this case.
>
> To be clear - I think your guess about set_xcr0() skipping the write is
> correct, because 0x240 is correct for xcr0=X87, but I don't see why smt=
> makes a difference.
>
>>  I guess an easy fix would be to write 0 to
>> this_cpu(xcr0) directly early in xstate_init(), maybe in an "else"
>> to the early "if ( bsp )".
>>
>> I'm not sure though this would be a good fix longer term, as there
>> might easily be other similar issues elsewhere. IOW we may need to
>> see whether per-CPU data initialization wouldn't want changing.
> We've got other registers too, like MSR_TSC_AUX, but I don't think we
> want to be doing anything as drastic as changing how the initialisation
> works.
>
> The S3 path needs to explicitly write every register we do lazy context
> switching of.

Actually no - that's a dumb suggestion because the APs don't know
better, and we don't want for_each_cpu() loops running from the BSP.

Perhaps we want the cpu_down() logic to explicitly invalidate their
lazily cached values?

~Andrew

