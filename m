Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9972A34F16E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 21:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103659.197711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRJiy-0002kI-BO; Tue, 30 Mar 2021 19:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103659.197711; Tue, 30 Mar 2021 19:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRJiy-0002jp-6c; Tue, 30 Mar 2021 19:08:24 +0000
Received: by outflank-mailman (input) for mailman id 103659;
 Tue, 30 Mar 2021 19:08:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FNPq=I4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRJiw-0002jk-8W
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 19:08:22 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c89f95df-dbd7-4f60-894f-765cc08f87e4;
 Tue, 30 Mar 2021 19:08:20 +0000 (UTC)
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
X-Inumbo-ID: c89f95df-dbd7-4f60-894f-765cc08f87e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617131300;
  h=to:references:from:subject:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9VD8Ex+jjCHS1bOeQS6HAdC2uGW47/bL6H+BbZGc01g=;
  b=WGT5Or+mDpznT6k/vK/EV2gRL6Mjm1rg+iUGmr5Rj/hPU3Ezy8Klk2qQ
   uuED6q5FwJZ9Or3KU2TMTVhkARuOJY+1RoZM6Om5NgCt1P3pfauEtJGvn
   P1zqhRIBEUcd+V0fSm2yr79r4+zdiZRhFYYYTONhAiDX0hlj6sBB+dFCk
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4PosuCBROH/TQ6vUGGFTMt5KIJDw5ldNHfJQ4hZB5MHltDraIquN7gnyLS4q6SO7ZGSOOxwpcW
 AYBUhPYkUKRzsHfL8HG9K0OaJmTWDdi/tS1zmh+ABfkvLo4fJUxUL5UFUpzmv5HdjeOqf279wM
 ItpKdmRZRrZflmkiUNTz2mGL5fIG2IbQpBama/R0YXxCsZ8oYgFXHCeQ+pQA4Q5rj/MevaYo9l
 c0zkMKvHAYyWHwHal/Sgafomp3WTr3TuRTbHHHxtjywFmXky4OkXFMzv0LAl8tp/RBj4gNY1y/
 K6Y=
X-SBRS: 5.2
X-MesageID: 40845127
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:lETBSK8WwodC7MzRPWpuk+FJcL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmyybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUHD38Zn/+
 Nbf6B6YeecMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsKV4hL6QBlBgGHVmh/QwdbDZQ0fa
 DsmvZvjTymZHgRc4CHHXEDRefOvJnmk5jhbB4ACXccmXSzpBmv76P3FAXd4wcGX1p0sM0f2E
 Xmsyi83KWstPmn1gTRvlW80716kMbso+EzffCkpdMSLlzX+2KVTaRnH4aPpTUk5NyogWxa6+
 XkhzcFE4BN52jKfmezyCGdqzXI9Do18XftxRu5rBLY0KrEbQk3AcZAmo5VGyGxgyFL3KAeod
 B29lmUuJZNARTLkD6V3amsazhQmlepun1nqOYPjhVkIPojQYVMpo8S9l49KuZmIAvG7ukcYY
 tTJf3H6O0TWV2XaG2xhBgW/PWcGl43HhuAX3EYvN2U3zV8jBlCvjUl7f1asXEa+J0nTZ5Yo8
 zCL6RzjblLCvQbdKRnGY46MIaKI12IZSiJHHOZIFzhGq1CE3XRq6Tv6LFwwO2xYpQHwLY7hZ
 ypaiIViUcCP2bVTeGe1pxC9R7ABE+nWy72981Y759l/pXhWbvCK0S4ORETuvrlh89aLtzQWv
 61Np4TKeTkN3HSFYFA2BC7c4VOKEMZTNYetr8AKhyzi/OODrevmv3Qcf7VKraoOy0jQHnDDn
 wKWyW2C95H6mytR3/kkDncU37gYSXEjNFNOZmf29JW5JkGN4VKvARQo0++/Nu3JTpLtbFzXE
 YWGsKkroqL4U2NuUrY5WRgPRRQSmxP5q/7bn9MrQgWd2f9cbMJvcSjaXlftUH3YyNXfofzKk
 pytl538aW4I9i73iY5Ee+qNWqckj81qG+VSYwf3omO/93sdJ99LptOYt0/KSz7UzhO3Sp6om
 ZKbwEJAmXFECn1tKmjhJsIQMfFd9d9hw+vCdVOqW3WsHidoc1HfApaYxeeFeqsxSo+TTtdgV
 N8t4UFhqCbpDqpIWwjxNgjPEZ0c2SRCrJeBAGjbIFZ84qbPD1YfCOvv3i3mhszcm3l+wE3in
 b6JSOZQ/3NH2FQo2tVyKrs7VNyeFiMZk4YUAEIjaRNUUD9/lpj2+6CYaS+l1GcbVYP2ckxGj
 DIazl6GHIn+/mHkDqu3BqSH3QvwZsjetHHBLM4arfJxzeGM4uTj5wLGPdS4bdoPN3jqfUwTO
 qaYgOZRQmITN8B6kiwnDICNyZ1onV/zq+t9x3h8WSi3HkwRdDVO09rQrkHI9eaq0joLsz4pK
 lRvJYQh6+XNG60V/utjYfwRBRHIgnIoWG3Q/ozwKok9J4ahf9WJd3jTTDM1Ht7xx0wI8f/qV
 MGTM1AkcX8E74qW/ZXRjlQ8VUonumeNUcHsgT5BeklYFEm5kWrSO+h0v7tqbA1BFeGqxa1EV
 6D8zdF9/OtZVrJ6ZcqT4YxK39Rck4y9TBL+/6DbZTZDEGPe/tY9FS3dl+7f7k1ctnOJZwg6j
 J76cqPhemZam7R3x3RpyJyJuZ2yFmcKPnCdj6kKKpv6Ny1OVOFn6us7oqStV7MOESGQnVdo5
 ZEe0wWZtlEkR84guQMo26PdpA=
X-IronPort-AV: E=Sophos;i="5.81,291,1610427600"; 
   d="scan'208";a="40845127"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyoNqieBytD2H2J3JisUHocXLkpis7ZVcK9OUk5ObDXa/lNBffnDTK8PhFFd7+5jRkIC38CDZREn9v3ruIL43uYQOaar0G+ABHzoMcN+mf70hzuSQVMxVO4hdcdFXWYmhwrA8bBY/VaZ8J0yr6N6Rq/LAsX4fVQXXVq3FP0E2cnSrvgOpz7HWIEjTApv2HXsNHk1mcLGGUgrzoYT3kB0WuFzzUrq9DhRcpv57oggJ1MpMK0JJAAOzEpiFZWBESwaz3Dhb2Zh4eAKyXB51E33wpoHr/FqVudEQuoIVzkTKWWZ3dK+nuiROMr09s0tk5DTZ/FpBIxEjC7WlNN2I1Jqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VD8Ex+jjCHS1bOeQS6HAdC2uGW47/bL6H+BbZGc01g=;
 b=W+cOWjAP/RzlCJb/BNhNaPgsqZgkaP2quHOlaje31hOmH9WNGhpKE35ZxUttsHHonN6PuOvknRFXNgafjwBQxixZtinJRjATUEIMfThyCKHedOuk8UH63TpelZOE2G1sC15s7TXX67MOvJJHRNCyOG562izAQzvrLI+tODQF2cSaNNxovA+LRE5GRepzQCbvkwEJv2aLeb2+X87QJEoed3UEkIJdLZLsZbGpjjQCz+L5zecNHLd4UZRRmU7lndjb0bqS97gW4PnaDSpduOfQsL3muDHcpH4hJbRJvg7fxfs9ve1h1KfWDwqeVH7mq3McbhVEr0I0tNkPyAdSL9v3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VD8Ex+jjCHS1bOeQS6HAdC2uGW47/bL6H+BbZGc01g=;
 b=nk3lpC4Ivu4Nu/V5iyO/5e0AM2kc7Xpe0/myeejGpN/HCnhv5kkZXQSGS8Sc8PJqQNh1esManarWulO2ZVfijoCSWone4EwsvNQgtoSJoEq3K4SqPOUDYbYYOhBz0+3LQVVN7StYOUQzPcGzLJevYHToG6JXXUxNZ/+kRH6XtJo=
To: Roman Shaposhnik <roman@zededa.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, <grub-devel@gnu.org>
References: <CAMmSBy8Wpwgj3V0U8OhsZCgyAxOjTeHDMt-Vw+om1koopmxTsg@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: multiboot2 and module2 boot issues via GRUB2
Message-ID: <23baec07-a3ae-949a-a1fb-09100efd53e5@citrix.com>
Date: Tue, 30 Mar 2021 20:08:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAMmSBy8Wpwgj3V0U8OhsZCgyAxOjTeHDMt-Vw+om1koopmxTsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0481.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::18) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 908e81c5-d58a-4e5f-267f-08d8f3af2d52
X-MS-TrafficTypeDiagnostic: BN6PR03MB2516:
X-Microsoft-Antispam-PRVS: <BN6PR03MB25162D3344F76B0BE5893FB4BA7D9@BN6PR03MB2516.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tjPNhBFYmHjBbKKdAaBE9F8xLOvegH7UtMNDQDms5oU6pcFVYKyMEW1rCC3fJLUYZ48MnxBhkhsyNikgz54O11f0gI2Ev/KH9gpdifndXuClIZ4k7UXYv81Ur4s/2z6LxU1051wHR3Wr+Ukck7TGPdC2NQb7Lx6jt6kwBo9blgx/CmqV/O9hgUHwfJUIWuSWDAT0atLtLCOaUFf3NWjomdSJSx76fZZ8UH+95tHUq8qd88LuL1pYVvDs8+r4/Y6WQZMn+MnUR/KZLz2XsWL49dbQ1c3LcIwj59Nb2sDmjc6nQYyf3CU9z16X5oFeCYphS8tJNGLYDEl6MlGNw+tyYNdKfhK/+6mZK8wvBtgeNxKFpVJ4ON7uuQYTQF04Cvm48CPVDvrtA5lg6iISk7PREzabgbzZ1L3DlD0SjvoyWLSpLYPXrzRmmDOWw2j8zlUdXmI+qJgvfz0WgN0XG4wllDAa1pzZtjYM+yVZdQlC9qEPugcf0p/Jgbt7OMVCo+VU+2y8h1NT+xAIhZvW/Jv16ktisiLVs7RAodczfQmQEleSA9AXACrf313oAZmq14XaV/JTfC40D2duQvsVVxcUXM7LdLdQmevaWk1JUJVrxGgWFnPzUgwCEewJRZZJCtHfJoggdr4eyZUVuMLkl/EhJvyaL8mokoldQAUCG4wLjZaxx8bWb+2yvhyDAV1di8Td1jE13W8p/d/00Y8UAn6w1+NjUqbAtGMLRGxvzrr14A8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(376002)(39850400004)(346002)(31686004)(5660300002)(38100700001)(16526019)(2616005)(16576012)(36756003)(26005)(186003)(956004)(478600001)(8936002)(6666004)(6486002)(66946007)(31696002)(2906002)(53546011)(66556008)(316002)(8676002)(110136005)(66476007)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c0IwbFdJNVhNbllEUGxNZDF5Mk1oSjJkTHFKZDd3bGVvNkpkOTFuek04OWx2?=
 =?utf-8?B?dUpPVTk3UmZVaVdIZksvNEVqaWY0TXBPUVNXNll0MkRCOVkydmVHa1cvNkhz?=
 =?utf-8?B?UVA5b0RFRzhCazljZHlFNHlTWjZEdnl6TU9BU1pCdWFKYStHaURIWnNsZkVP?=
 =?utf-8?B?d2pVcUloRXdUbVk3NHZmdENYN2FScklINUFxS3JPYlB4cDB1QUJiaGpYM3Y5?=
 =?utf-8?B?RlRnb3V6LzJ4Ym5LKzhZemIwOE9FLytWYTFwWG01eUZvVVFzMWErbitENk1H?=
 =?utf-8?B?cVFrYktmNGlnVmRBU1pVTCtObXkraWkxU1lSVnJXVU1OakZ6eitLckxsK0NB?=
 =?utf-8?B?bnJtMWJiRWVwTjlTa2Z6Wm5xUmNEMmdLVnJjRjlyK0VBMGRseGZaMFZzR1hI?=
 =?utf-8?B?dEsxZTVJMU5obGt6N05Cc2xXVVJDVjduSzVqeWZWVkFVUHBJeis4bkhHb0RE?=
 =?utf-8?B?TWNwS1BTeXZaSjdwbFJxWHVvWG9kRldocE5zUGxFc1U1ajNzQWxkV2dIbGFn?=
 =?utf-8?B?REhKRTZqS1R2NkZKMXpGTmxUNW1YMk9LcEw3UHIyK3BjbEY3ZmtmV2hWWjFk?=
 =?utf-8?B?UEl4WUxDeS9jakRhYWRzYjluWDE0Qyt6cDRRVnF1ZmMwQmZ1ZTExL0s3WExu?=
 =?utf-8?B?cHpVRlFJRmNacHlLWHZjclE3U3E0QUJPMml6eTlKOTZEeHRhY21OV09Melpx?=
 =?utf-8?B?ZXl0UitvMmJBamVlL3ZsTTBXTnErZys0TzRhRnE4SGtpdDhTdEU4ZnlSMG55?=
 =?utf-8?B?NmpuVVFkYTczcFRWeWxiTlVEN2N2ZWdzRXRyOFRPRndwVkZ5RmtaTHkrTmdm?=
 =?utf-8?B?RFdlVW9CKzZKbjJRM3hpZURaMzloZDd5UDEvdzBLTWRvMldway9KMkxWVmNz?=
 =?utf-8?B?bTYvWWdhUEVZRVlXSjhSUWFTNXdVdjRmVHZ0MVJmemhTNXkzY2hmS095TGs1?=
 =?utf-8?B?S2VyZ1d3QkVTaHBOZ1JwQks1SUdDM0JtejA0bTJyRzZvdndBaUFJV3kzMnhN?=
 =?utf-8?B?cVZJSzNBbElxdFlsS2oxSDhPTVZUT1lHT1dISEJpMHNjTTBvLzNaSHlGUHI3?=
 =?utf-8?B?clRLeGs1SFAxU240SHp3TE01bVExRFkvZHFUZE1XOWRhRHV2NVJOTnlUYWNV?=
 =?utf-8?B?UnZKRHBFNzBJdUtLdnZrbnQvS3QrYTh4YnVLRC93MWpWcnhEcldOdGxCaUY3?=
 =?utf-8?B?eXd5dmdyWmt4R1JVL0RQL291SzFoMEVzaGFYNEhxdnJRSmExS2trZTlmNE9o?=
 =?utf-8?B?ZlcvRzFvKytvWWdxUG1KNkVLUjRPczdaQjVIR0dEUW5jREpmVVRIakNuVnpx?=
 =?utf-8?B?NFhmMWY2UGZaYkZrblBQSTV4N1ZrTFczd3hXTXRNMTh4NFM2VC9ob2ZyZFF3?=
 =?utf-8?B?K0F1ZUhISHJjcytpc0NpWWxpVnlYaTRlVTNjWXdOd2JZSmg0elorYjd6UWR1?=
 =?utf-8?B?ZEN3MEcrdUtjNERZbENHZkVYa0VrVWpzSThKaEZGbVU2bVAxQzYwTVZsMStI?=
 =?utf-8?B?VURaQlNRWmxaVHFVWHRaaURybGdKUTBvMDFNQnN6N014MG93M3BrVy8wTmI5?=
 =?utf-8?B?c0pMekM0cmR1dStEcWxva21uRzNodWdvMnhLMWpZZE9MYVNWMTV2blU2Nmdl?=
 =?utf-8?B?b1ppdUVTZ293MVBYY3RmWTdDZ2xqS1NuRGM3RnRZRlVCd3d5SThESVExNW9k?=
 =?utf-8?B?QnR4djB1UStlNjllOXc1WWhMRUpteWt5T1JGcnMzMm1uMmNnejlYR3ZGREJw?=
 =?utf-8?Q?2lFCorjaA7RMw1rGSq9LsrUNIjbTZucuW9cHQwU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 908e81c5-d58a-4e5f-267f-08d8f3af2d52
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 19:08:18.1098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMrqGZSGY7WTZ7svm1jZw/4BB72PVt3rcZUVDwInOdSbYNOYlEkDm1iAl4ifWIyQeZOXsnhEejfmSCX1gaef50eWGk4HABg4KHOGVyI87zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2516
X-OriginatorOrg: citrix.com

On 30/03/2021 19:28, Roman Shaposhnik wrote:
> Hi!
>
> seems like I've run into an issue with multiboot2=C2=A0and module2
> commands that I can't quite explain. Since it may be something
> super simply and silly -- I wanted to reach out here before I do
> a GRUB/Xen/LK source deepdive.
>
> So here's the deal: whenever I boot straight up Linux kernel
> I can do the following sequence of commands:
> =C2=A0 =C2=A0linux /kernel
> =C2=A0 =C2=A0initrd foo.cpio.gz bar.cpio.gz
> and have linux kernel effectively stack content of bar.cpio.gz
> on top of foo.cpio.gz and present a unified initramfs that way.
>
> I'm trying to replicate it with Xen, but:
> =C2=A0 =C2=A0 =C2=A0multiboot2 /boot/xen.gz
> =C2=A0 =C2=A0 =C2=A0module2 /kernel
> =C2=A0 =C2=A0 =C2=A0module2 foo.cpio.gz
> =C2=A0 =C2=A0 =C2=A0module2 bar.cpio.gz
> only seems to be picking up foo.cpio.gz
>
> Has anyone run into this=C2=A0issue before?

I can explain why that happens.=C2=A0 Not sure if it counts as a feature, b=
ug
or mis-expectation, but CC'ing grub-devel for their input.

The initrd command is presumably concatenating those two files together
in memory, and presenting Linux a single initrd pointer.

For the module2 example, you're putting 3 distinct files in memory, and
giving Xen a list 3 modules.

Xen is capable of taking various things via modules, such as an
XSM/Flask policy, or microcode, so has logic to identify these if
present and separate them from "other stuff".=C2=A0 However, there is a
hardcoded expectation that the first module is the dom0 kernel, and the
next unrecognised module, if present, is *the* initrd.

I expect that Xen isn't handing bar.cpio.gz on to dom0, but I'm not sure
whether passing two distinct initrd-like-things to Linux is even possible.

What you presumably want is some `initrd` side effect in Grub so you can
write `module2 foo.cpio.gz bar.cpio.gz` and have it concatenate things
together in memory and present one MB2 module, but I suspect that exact
syntax might be ambiguous with command line handling.=C2=A0 I have no idea
whether such a command currently exists.

~Andrew


