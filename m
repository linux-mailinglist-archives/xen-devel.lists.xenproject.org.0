Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B0235F140
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 12:07:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110435.210790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWcR1-0006Fx-DB; Wed, 14 Apr 2021 10:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110435.210790; Wed, 14 Apr 2021 10:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWcR1-0006Fa-9S; Wed, 14 Apr 2021 10:07:47 +0000
Received: by outflank-mailman (input) for mailman id 110435;
 Wed, 14 Apr 2021 10:07:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UoOq=JL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lWcQz-0006FU-Cn
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 10:07:45 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0175771a-44bb-4e4c-8227-16de56b3e425;
 Wed, 14 Apr 2021 10:07:43 +0000 (UTC)
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
X-Inumbo-ID: 0175771a-44bb-4e4c-8227-16de56b3e425
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618394863;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2wWofnh4V/YFvf1V0yFCh2agedo6orlxQGlqd2dW06A=;
  b=EdLdlvY2pCbKfszWg1Le1CYElb0UvjlVwxAglUBL4lW2mB3eqnFM5vV1
   4o3kKG7NxVPYGVM/pSoqTbCxLa4cX0A79u1pGHnS0Odbw7Lk6tnKq+pj2
   EEnyHz8UQhD5ER/IYVF8FXAGmdtpJ3CTA5OJ22owQ84e8N9MfvWkfn4Lb
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wpSsFsqjCaPjIzQc7lsD0dAcTyQ9n1/TkNSFlXSEgUUHRWUk0y0jupBO1VRp7kryNXWgbup0o6
 LKVxm/Wl4ZpaB1KnJicpz4qk27g1SnTwt2G8sVxeGKL/a3FtQtskrqfCD2l9ThaLM/v7Vv0934
 /VvijJqduZWgCbUiJbAVwI1RPyatW35rSMf4ukE9IuMEq2AEdyeHUwSOoHobY4f0cmvOYnmOyK
 4P+xOu9PUhxmOX79TAdpWvKv9U+Bmirhnc9c5eDJZF2Lj6uv7XnzCF8uB6OhGqVTyqPWWu+c6z
 gyw=
X-SBRS: 5.2
X-MesageID: 41556405
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fyEyK6GqtRkHpEC3pLqFY5TXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7L0/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeOJwTXzcQY76
 tpdsFFZOHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLT1CQYsI1XYcNi+wFEpqSA5aQb8wE5
 SB7sRKzgDQB0g/RMK9G3UDQqz/vNXNjp3relorABQg5QmIg1qTmcHHOjKf2QoTVC4K/Kc6/Q
 H+4nDEz4iAk9X+8B/T0GfP849b8eGB9vJvDNGB4/JlUQnEpR2vYO1aKtu/lRAz5Nqi8VM71O
 TLyi1QQvhbz1P0UiWLrQD22w/muQxemUPK7VODm3PsrYjYaVsBerJ8rLlUeBfY9EYs1esUuM
 kgshP7xvgneS/opyjz68PFUBtnjCOP0B0fuNUekmBFVs8mYKJRxLZvj399KosKHy7x9ekcYZ
 BTJfzbjcwmFG+yU2rUpS1GztCqQx0Ib227a3lHkMmU3z9KpWt+3ksVyecO901whK4Vet1q4f
 /JPb9vk6wLZsgKbbhlDONEesevDHfRKCi8f166EBDCLuUqKnjNo5n47PEc4/yrQoUByN8XlI
 7aWF1VmGYucyvVeIOz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykuO7ys9vQfHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYk8pss7YVSTucjGQ7ea9tDzQbL2Hv7AADwkUmTwDj
 8oRz7oPvhN6UitRzvWmx7Ud3TxelHu3J55HaTAltJjjbQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eaqACNjCL1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaXWhT2XCANyJuVs++Kn
 8Zm31HvYaMa7CAzyErDNyqdkiAiWEImX6MR5AA3oqO+NniYZF9Kpo9QqR+GUHqGnVO6EdXgV
 YGTDVBal7UFzvoh6ngpocTHvvje951hxruB9VVp3LZvUC1vtouWXMfYj6rXaes8EQTbgsRom
 c0374UgbKGlzrqA3A4mv4EPFpFb3nSPKhLFz2fZIJfmqnifSZ5SWviv03dtzgDPk7Rs2kCjG
 3oKiOZPdXGGEBUtHxj3qH2y19sbWmGc0Vsand1jJ1lGQ39ywNO+N7OQpD2/3qaa1MEzO1YCj
 3DbDcICi5Fxty81neu6Xy/PERj4q9rEv3WDbwlfb2W52ikL5eQk7oaW9VO+ox+CdzouugXcO
 6WdgOPNgnkA+cx1wH9nAd9BABE7F0f1dXm1x3u4DLmgDoRAf/OLE9nQL9eCdeG9GTgT+uJ1p
 I8rd9dh5rHDkzBLvq9jYfQZHp/DzmWh0icZeQhs4pVsqI/r6EbJeiRbRL4kFV8mCwjJ8L1nn
 4ESKt14Lr9KpZiFvZiDB5xzx4MrpCzN0MlvQz9P/8mcXwsh3HdOcmV47Cgk8tnPmSx4C/xM0
 KY6StT4rPsWDaCz6cTD8sLUClrQXl5zHRp5+WZcYLMTC2sauFY5VK/dluwaqVURqTAObIeqH
 9Bkp21tt7SUyrzwwbLuzRnZopI7ma8WMu3RDu2JtQgya3zBX28xo2w4MCyiz/rSTy0L2Qg7L
 c1BHA4X4BkkTktjIo+zy6obLf4y3hVy2dj3Q==
X-IronPort-AV: E=Sophos;i="5.82,221,1613451600"; 
   d="scan'208";a="41556405"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+a7+CNEKGwhkHYHYdqZ4tZr+fpTfL3SoOQKfJZEfMjCwnAK5RYgO+P/J3OPCMe8Vsf6nnsVgp2AuZUuph0xtoS1oa9QHZE+AMqZX06RAlCSgC8LsDznNToFdj5C0b6O0iWfCb/Q5oLu4JmKj+AviSivJCGIoLqWw3jVmHV+mrNgW/E5+HniQ2NoWlju12/fx6M5yeDkDv6Ml2/5CR7YTQ0/JqsebwZQUZDrvf0+J1I/VgO+glbb9zjjjy7b7NIZCgScARh5Kg6pn0UDta5jaqMLtPpd6dtSlrFLyFy0Drq6TC55JKO9c4kpEqzKK7VjBccpT1sMpQO1D5MNGVW2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LC4EL6UtO6m71mh8ggyTrKDXYvhZDr87O/S0qcivkQ=;
 b=RTL6Yk73StAfU4Pzkq/gs2kjtqjGmnOjmN13tYgasWS0YwfpyAOtc3CUwT2gvPR0xj6KRodUotx6SwBrZFHdNGFIR9RhJxMFnGTv2SlSMo6WixPRC3lBbtHL3+jFniKaiPZejIMM5ziyetoqW5AD6NKF8jHj+mCHd10P0jigFvUPThl9V7uMIiob8vhJZ9Ds9ANTKFq4A8w9G/ZVrDsxSvytVFT0taQ32b2dCsqAZMoiDyaVCwqpnVrnbPn87MzeAEf1XB+l8cTnLx2c/iex+lK3Q15fOF78Nro8yWWLt9CSrawws+znsg/UvpIANjk0u/Mn28MECMNZGrv8j0bFGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LC4EL6UtO6m71mh8ggyTrKDXYvhZDr87O/S0qcivkQ=;
 b=FMOKhRyjPIHskHjhwQIQYxoOoGop6WHMiTQeXaPq/CBOW9DfB9TFGgGhsjWhdMR/R1/ZVCRV10iHdl9fK1N9UMqXeCrHT3DcIHLFpyKQ0/eRhXh29mWmRamOZe6a5EQgb6cFBweXqI2ab8ANn0ZDV6QOZbl9QxU4255sKe2OdOA=
To: Steven Rostedt <rostedt@goodmis.org>, Giuseppe Eletto
	<giuseppe.eletto@edu.unito.it>
CC: <linux-trace-devel@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
	Dario Faggioli <dfaggioli@suse.com>, Enrico Bini <enrico.bini@unito.it>
References: <CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
 <20210413114614.4971caff@gandalf.local.home>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: A KernelShark plugin for Xen traces analysis
Message-ID: <094c4b3f-3988-c51f-3a69-cfbc8d6a45bf@citrix.com>
Date: Wed, 14 Apr 2021 11:07:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210413114614.4971caff@gandalf.local.home>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 189d045c-f2cb-43b6-0fa1-08d8ff2d22e9
X-MS-TrafficTypeDiagnostic: BY5PR03MB5048:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5048A97A6C688BB1E5B45A8EBA4E9@BY5PR03MB5048.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G+bpiVGmKhHfr8Uiu7fIAk074Uw4DZt1d7FhwhlblSxysKXMk2rOFOHWKTDcAVvdIN1sIN+5gKA1Hl0Lj262UukSlX+ts0noyLpXoibcbsOvuO05Gc2NyLhosxhGGR+z00Q+Xf1Lfk2/3MtDznkPCqDTNDf9ECGi6VlgzdrnmfOHzn/Rp9se6+tkIUsA1ZFQe0P2kpLJgYGK8fulaSb5M7Rm4NQidcBcshfLbjykFn2sc7MutkpXN03JrDoh4c476s/D+eVGOeF7yhrOxF4TGv2ZgcNeSBfW1p144ALguCk/MBJpaPCf17YJuZSqzR8w2CFcp1+y9/ZXLaQnswQJ5iAFNRj44ZEtPZjGCyu4tgc/GzGh7xhmAdF6COMT5qTtFHarKlr+GkliPwZYDh1Rk/AgtL5xt7jCewSImxrpMDMxhIBsysZWw5BuM6RsNoVhEUyhm18AP/Hx4UJfIu8vKcBHSl42Xb0HVKxQHks4ldciUF8xsgz3i2A0vBX6Zkp7Y+xwYgs/N5pdgu7jHQDDoYgfz1kslGeOPXlGp61fjfvFU4YZTJqeXVJOTSNoyGzYZIKbF6YqvgoBfG1OBngwcM2dojUJRN8izAT121G1ASfirHu0SnUuT+PcZgbck0a+WRBdGon3EOTGf+fh/wf+yDPH1OTH6pG55v4aQ8hQP+sJfLiYhyTZZ/QefyoKYlcI5cJ6DaRiI3oXJ+rSoJbtYzuI4eU725RS3UaBvZNdR3e7a9vkOU0yJbjvYLiqdyIFMDgF1NrBjtctQKQti7LhFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39840400004)(366004)(346002)(396003)(376002)(110136005)(8676002)(53546011)(956004)(31686004)(54906003)(66556008)(66476007)(6486002)(2616005)(2906002)(38100700002)(66574015)(16576012)(6666004)(31696002)(316002)(86362001)(966005)(36756003)(83380400001)(4326008)(26005)(16526019)(186003)(66946007)(5660300002)(8936002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N1BvZHRPZlZDNXlhMDZGdjg2bjBMd2l1WnZNdWdrZnNEVFlUbWorSWo2Sk9L?=
 =?utf-8?B?UU5NR0tSMEp1Tk9YVWxwVGhtUXY5TVB6cGozS1NkdXludEx4NksvNVBCdzFM?=
 =?utf-8?B?VVFLQWV6eDFBM0NwQnV1SkxBekFramY4ZlprV0M3V3FiQW5UdlM4TWZxZDRS?=
 =?utf-8?B?T1orQTFtclB4d1c1NWVwZVlhZXlKOUJzVUprK2VtOW04TENPd1phTmdtcVBn?=
 =?utf-8?B?alNyV0VXY29BN1g3N2JJWlV6djA4Nk00NHhZbVM4anFNNnlmcnc0Z2puYlBI?=
 =?utf-8?B?VTdsSHVOVncwM1dtaXlqZmhyclR4THcyRkE5MExSYm1TUzR1bXBTYThwUDlv?=
 =?utf-8?B?VmZ2M2dxTWMxYmdjazEwN2I1dzlZc1gxYUVKSEw0aThnQWdLa2s0SXBWSURC?=
 =?utf-8?B?R0JBbmp2dXYxdUtsV2dJVjFkUWZaQkErUTNZK3hUZGZ0SGl6Z2xGZDdWZFUz?=
 =?utf-8?B?N0pReG1ZZ05Ebzdic3FPZ0ptcno3d1BON0VlN0hnSzlQdW1kYTF0SVZ3QjVE?=
 =?utf-8?B?RFdFaEtjZWlHT3ZlSWYzcnk1L3d5TzF0Tmo1SFdrczFwUy96LzR2Wm9ibHV3?=
 =?utf-8?B?RnVMUzRIbUwycHAzNEVrVFlsOXJLcXIvd2trM0ZuZzYzWk54dENhdGJncHpV?=
 =?utf-8?B?NVAwNUhTWDBkWWtiT3RpWExtdE9VQ2NMNWRJSElyQUViQ0x0elgrN1lxaDNX?=
 =?utf-8?B?UnorKzdvUjZPR0lQdGFQRTlkTjMvNjVuMkhkK2piTmRqSGpuN2RNaGduN3Ru?=
 =?utf-8?B?QlVJYW5PRU50NWUyZjZNcE5nS0ZWWm44a2gvekFXMzZBYlJvRlRlV1NHTyt0?=
 =?utf-8?B?aDNlVWwrNmt3THZFOTRhSE1vSm9sV0lFZElydHMvUHh1dzJ2Wm91RkpvRHhB?=
 =?utf-8?B?S1hhQTUxaGYrTEtNSjY5UmpxRWNHZVdQeWZEcllleWN3NWwwOUE3Zy9TL2l5?=
 =?utf-8?B?dU1TTytYTTdpWWpCYUNIazNmVVNUQmJJRmNjbGVYcUpzRTRHNUQxSzNSSnVl?=
 =?utf-8?B?ZFZLSUZSZG1DQ1YzdWExMlA3YVB6aEFNV0tIZ2N6a1FCRWg3enFGam5JNGdV?=
 =?utf-8?B?akxzcUd6cmptU3ZzQjRTMjFidFVYWGVQVHdWZFJsalZGd1pPSlVoKy9Xd3RF?=
 =?utf-8?B?TzVsNjZNM0RESlFlWmFIeVFnNHcrOEx2anVPMEhtWG12WFJwZnNaeFQrUlB5?=
 =?utf-8?B?NFFFMllNS2dob0IvYy8rVTlHeFkvdG02YXIyTnluZS9MMWhhQlZRRlAwcWlV?=
 =?utf-8?B?elkzQlNXa2d2SVZXN3RyQmZoa3l3N0FxWGRDR2lLWFBuZ013THQ3NnRpQzlw?=
 =?utf-8?B?NGg0SVpURnA4VTNzWTBieHl3cCs1a1Q3SmJvZTNIbENpUmlqK3YrM1ZNWE1l?=
 =?utf-8?B?WUk4VjByU0ZHTkQyNXNVT0RydDJVTHduVzU4T2ZhN05PWng0ekdMOUNybzYz?=
 =?utf-8?B?UVpCcWd6WGRoVWNwc2lsZllIVmpzeDFxMGJTMXdFOWNmcEM4eXRML21jMjVm?=
 =?utf-8?B?dzJRSERwTTNTV2tuc0ZUWk5RcTk3a3Q4Y0F2ZjdBNFZuV29rRGs0eVkrNzZS?=
 =?utf-8?B?MHlYSDZ4WDdvdnJTL1NJUzM1TUk0bkI5dGxHcG5WdDFmL1U4UzVSNWR0L2t5?=
 =?utf-8?B?eklyOWpWTWxuZm1pa2E5N0NlM1hUZEZSTy96RXVWVXhSbkh1QkN6RlpKdlpX?=
 =?utf-8?B?SDV5REQ2Qm12MGZpT3IwRkNBOGE4OXU2b2M2OG11N1J6aCtUZ0dabDA4cXAz?=
 =?utf-8?Q?fQKxPiSePNnj4fv4YD1lpy5+oAkAb+impP6+qb0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 189d045c-f2cb-43b6-0fa1-08d8ff2d22e9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 10:07:40.0883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWYTHCIXWskSdT8xg62psT5WvksD6HQgMocugVlUtvObseBgK1d+FG0Xf7w82csMYeFCQpt/Iorr/5ZK17PoiYpTHmFDgGzAPczKseVn66s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5048
X-OriginatorOrg: citrix.com

On 13/04/2021 16:46, Steven Rostedt wrote:
> Hi Giuseppe,
>
> On Tue, 13 Apr 2021 16:28:36 +0200
> Giuseppe Eletto <giuseppe.eletto@edu.unito.it> wrote:
>
>> Hello,
>> I want to share with you a new plugin developed by me, under the
>> supervision of Dario Faggioli, which allows the new version of KernelSha=
rk
>> (the v2-beta) to open and view the Xen traces created using the "xentrac=
e" tool.
>>
>> In fact, KernelShark is a well known tool for graphical visualization
>> Linux kernel traces, obtained via "ftrace" and "trace-cmd". Anyway thank=
s
>> to its modular architecture, it is now possible to implement plugins whi=
ch
>> open and display traces with arbitrary format, for example, as in in
>> this case, traces of the Xen hypervisor.
> I'm guessing you have trace events coming from Xen itself?
>
>
>> For more information on how to build the plugin and/or
>> to view the source code I leave the repository below:
>> https://github.com/giuseppe998e/kernelshark-xentrace-plugin
>>
>>
>> In short:
>>
>> $ sudo apt install git build-essential libjson-c-dev
>> $ git clone --recurse-submodules
>> https://github.com/giuseppe998e/kernelshark-xentrace-plugin.git
>> $ cd kernelshark-xentrace-plugin/
>> $ make
>>
>> $ export XEN_CPUHZ=3D3G # Sets the CPU frequency ((G)hz/(M)hz/(K)hz/hz)
>> $ kernelshark -p out/ks-xentrace.so trace.xen
>>
>>
>> You will need the development version of KernelShark, available here:
>> https://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git
> This will soon be the main repository, as we are going to deprecate the
> version in the trace-cmd.git repo soon. And because libtracecmd 1.0 has
> already been released.
>
>
>> A screenshot of the plugin in action is available here:
>> https://github.com/giuseppe998e/kernelshark-xentrace-plugin/raw/master/.=
github/img/ks-xentrace.png
>>
>> I'm happy to receive whatever feedback you may have about it,
>> and to answer any question.
>>
> Thanks for doing this. What would be nice is to have the xen traces along
> side the linux tracing. Perhaps we can update trace-cmd agent to work wit=
h
> Xen as well. Does xen implement vsock or some other way to communicate
> between the guests and the Dom0 kernel? If not, we should add one. The yo=
u
> could do the following:
>
>  1. On each guest, run as root: trace-cmd agent --xen
>  2. On Dom0 run: trace-cmd record -e (events on Dom0) \
>      --xen (commands to do tracing in Xen HV) \
>      -A <guest-name1> -e (events on guest)
>
> And then you would get a trace.dat file for Dom0 and the guest, and also
> have a trace file for Xen (however that is done). And then on KernelShark=
,
> we have a KVM plugin in development that does this. But you can do the sa=
me
> with Xen.
>
> For KVM, we have:
>
>  1. On each guest: trace-cmd agent
>  2. On the host: trace-cmd record -e kvm -e sched -e irq \
>       -A guest-name -e all
>     The above produces trace.dat for the host trace, and=20
>      trace-<guest-name>.dat for the guest.
>  3. kernelshark trace.dat -a trace-Fedora21.dat
>
> (I have a guest called Fedora21).
>
>   http://rostedt.org/private/kernelshark-kvm.png
>
> Where you can see the kvm hypervisor task KVM-2356 is the host task runni=
ng
> the guest VCPU 0, and you see the switch between the two.
>
> Perhaps we can do something like that with Xen as well. The plugin is sti=
ll
> in the works, but should be published soon. And when it is, you could use
> that as a template for Xen.

A possibly tangential question.=C2=A0 Where does KernelShark's idea of CPUs
(i.e. real logical threads) come from?

In a Xen system, dom0 is just a VM, and particularly on larger servers,
may not be as many vcpus as the system has logical threads.

This causes major problems for `perf` support under Xen, which assumes
that the kernel's idea of CPUs matches that of the system.

When rendering a trace including Xen data, Xen can provide the real
system CPUs, and dom0 wants to be rendered as a VM under Xen, similar to
trace-Fedora21 in your screenshot above.=C2=A0 (Obviously, if you're doing
nested virt, things need to start nesting.)

~Andrew


