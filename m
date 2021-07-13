Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B793C6FAE
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 13:24:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155314.286737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3GWD-00043K-8S; Tue, 13 Jul 2021 11:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155314.286737; Tue, 13 Jul 2021 11:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3GWD-00040v-4o; Tue, 13 Jul 2021 11:24:05 +0000
Received: by outflank-mailman (input) for mailman id 155314;
 Tue, 13 Jul 2021 11:24:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRbA=MF=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m3GWB-00040S-Ci
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 11:24:03 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbdadde5-924f-4875-91a6-b3f92c30003c;
 Tue, 13 Jul 2021 11:24:02 +0000 (UTC)
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
X-Inumbo-ID: fbdadde5-924f-4875-91a6-b3f92c30003c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626175442;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DSATlIsLgU8p+g1i3c0Aw8JPeUufzeiIhCzmr1/3EKA=;
  b=LpGQkWAP3ofmkqvRJOlloXfhyGYrcjYgH4XPJ3VcAPEsuyhvaxEqRnPD
   Kj2mT+M877rzl/YarqEo3+ltDt3xCXpPRjeh3KlnhcFAgSO35F0Vxo5t3
   AZeTl2Fz0X3rEOCdoyVwBZnr3/X2JOvsBqApbO3GGK+xBLuYrB6KiiV3x
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qnXolNMXHQHkSXE1eORRu7xn7VWv0E3olUh1F1IWm7HqqpCqI302UVj+gWeYxouXElkAFESVlp
 ovLDkcO1yT2rKZa50IlWbwbiLXNXWT50ZDqQH/65QantHGc7sNfzFxR9qZf0LGBCAQB764tb6f
 +ttWAABY3WncuP5d1sk/I1uIv2oS74+OUrPspUW/6L975HaJf4xEsOrzIxcgMXfz6f46DKBI7Z
 tdsOhP4gSbWjtae6rkyM0zwR466cj5Z1z3ylxEqXhk9IQagKQOifis4xX/ld96u3gcPPq8zRCS
 j8Q=
X-SBRS: 5.1
X-MesageID: 48526132
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:aKvfMqHqMalRdzjepLqFH5HXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HmBEDyewKjyXcT2/hvAV7CZnibhILMFuBfBOTZskbd8kHFh5dgPO
 JbAtVD4b7LfCtHZKTBkXGF+r8bqbHtms3Y5pa9vgJQpENRGsddBm9Ce3am+yZNNWx77PQCZf
 6hD4Z81kCdkSN9VLXLOpBJZZmOm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTsj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZuA+1Dr1fqOk2lqxrk3AftlBw07WX59FOeiXz/5eTkWTMTEaN69MFkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l3CzvWEpnYco/jxiuLMlGfpsRLEkjQdo+M9qJlO81GlnKp
 guMCjk3ocVTbvABEqp+FWGqbeXLwYO9hTveDlIhiXa6UkOoJlD9Tpu+CUopAZJyHsMcegx2w
 36CNUfqFhvdL5dUUsvPpZNfSOIYla9CC4kdljieWjaKA==
X-IronPort-AV: E=Sophos;i="5.84,236,1620705600"; 
   d="scan'208";a="48526132"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLY6YbkB66yugONGi45oE+D04YyXOorY2v3Dn8FVfjCO5zOy8oNOl2xxYfYmb4jYLELFCgq0aj6Q0Nj3+Ry45r57faOgUkOD81QgJj27X9z+KCxz2uWYXEK4g3QsWi1l/C0gwpcDibtq7v38U0bJz2th1IKPAzhtyWdgwMERrGT47sK1PqHM8G+C98+VGcC4J9gfDPw+CngAFbRc8YqkYFK07uhfruI7GyffPhU6qZyuvBozATlwCQhi3rPCByvhxLwRH5TKOaoWs14RyJuGuxmFblj37h0lVBxXfpCie7d34HUOBzv+sRwoDh/TPvkXiznZWWuD275+RHQ39CljXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSATlIsLgU8p+g1i3c0Aw8JPeUufzeiIhCzmr1/3EKA=;
 b=DTijWqDWw8lwMQ69770Pyx2AdrVTYMVOKJncIi9eEkXjqPSA4Pe2SBajxdio+orzaLY7BCbpYREaG/Rgez9wqzjVBXnQWKj7wHVPvkBSrs30JCKCz27wMXCUYeRvC2YeStJ+USAgz1a5S2rCg/vn5Kb2CxBquUE4FgC0IfS/uw6Upgv2l/5FfOIV98nOGiz2RNhbiKgw0dCG/89fFiBsWywvD8Mj0VYEmWSPTIZr9fHE3UdH8/T/nYbDWYqyC9RGKOQ51gKJtAUsI8j8ZjmSw3x8Cx/yJooAWRk4TtlVrw/JzYnNEutuOYAPp3Rgw67BICqdnF90a0wj+O1vaJdt/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSATlIsLgU8p+g1i3c0Aw8JPeUufzeiIhCzmr1/3EKA=;
 b=RIIxL7gIbWhe8KPXBJ0Qz2gTUQzzdth3AQU9v9ddCXNxxohrQo1CzyfrUG4wQ3gSJ2Rbuf+Iy10/bIRktfZ1xQhw2N2p6PIVCDjMyiBhP40SYwyW1gsHyPyeDYzMOycuJtByC33KoPFSwZjSDXtSTvrAD+r/XtdGSMdvfLGrTeg=
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
Date: Tue, 13 Jul 2021 12:23:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0245.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b68c78a0-d643-4278-b4df-08d945f0b46d
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5664:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB566483DCAA63FA81F1445E2ABA149@SJ0PR03MB5664.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: awq3DvAFU2vRospWEbxXIo8qBN9Oqp+rxbltL4W2D+KbDCba/TvuposIB+RN6ZVApLavk1y1sU58VOW/Uv+uIMWSeXf+Nin5pbsoE5clp/WkpjlwlZ6tPXWjLxUx11Vsa4aWHH+IoyxijF5Gu9+zSdot0DNgbUiPuKv2+VWz/JZ4rvIhb8qCq907EVcKKx4xL2XGOAIbwBWyjXjlYWziD5sju8dnrrtEaXY01Qdtky3IGAVdXzXOy3OHwmBWHhKy/hWoOHQayfmL9YWuHzLllaXbskV4eKuhC6nP0TCiAH9f0JLfjrdyOlrOTxCvnCbmR7jbU/0QrLaBZ74HSJeTkLTXOGByS8w8obtPpFmdWL0fK3eHauGRSLA9x580vNdyuDUl1bLLu9Z5McQYaE5X7bgeuFZiP5WhTFSfYNDGNZknr9eYQWn8Hm1/5Fc0j1xrSUJvsdE1nJD3UzvAeYOupqTP93KhY2usORazdhjcK53klG1rH/sBCQtV98UyBMSspIdsxMtiAqj59LAKHvjRRdc9frW/5+ZbRWb/I6ruSnHZUmos41BzHnuvthVd3+FKHNArBj1C7WWYdHLjGbdJ1wH1vszQBW/yachnhgkFqGLhDb9z5p5smLYtHHAteZTOIHQ545FBGf7KyEkrDEnszmGf1n41h4GGdqrnGq74CPU+lQcpFmdvv7uaZ6Olba2GMoG/cS20zTfxpduexkif7M4wOtggwVO5L7Su9fJYijdCL4WvzlnA2wq0tjb0sjpu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39850400004)(31686004)(8936002)(6486002)(66556008)(66476007)(478600001)(66946007)(2616005)(956004)(54906003)(8676002)(38100700002)(4326008)(36756003)(110136005)(26005)(53546011)(186003)(31696002)(16576012)(316002)(6666004)(2906002)(5660300002)(86362001)(98903001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGlIUkpjWGxsSUhBNDlFNXVIUmp0Z2xxdGZhRGwrdmYvdStOUm1TK2VsME0y?=
 =?utf-8?B?S0JRdnZSZ0M4Y0x3Nm1ob1RCc2RUcG5SWUdsc3NuTHpPQi9lOGtROEVKTWhv?=
 =?utf-8?B?c2VTQUpvZHRYSU5zalJXK0dUYkUzTExmSEFqQko4dlowRGYrbDV4RnF4OGda?=
 =?utf-8?B?b3JkR1M0dzh3T09aNHFRTG1Cc3VkTmdkMDlUaTR0Vm9xSnFwalhMTkV6SXIy?=
 =?utf-8?B?UmJMRHdFY3dSc2taR0xSMlVLNUYzcmRMRnl1NlIrOWVHdEFzVmRDS2dCR1FN?=
 =?utf-8?B?b2pUVm8rU2FGNjR1b3IrN3hROStiWERPZmVhK1FBMGxBekJlVk9BYkRScUNJ?=
 =?utf-8?B?ZlRqUGN2Ky9wNnU0d0ZuWktmMDlBem5WMWFZbEhXeUUrc3NmQnNSeHBlRnlH?=
 =?utf-8?B?OCtwdk5VOGN4Unp1Qngya3UybVJGb1FCSVpscTVuNFNpdUxzVWlOWWpOOWZq?=
 =?utf-8?B?aUlVNWhxYjRtMUt3U2lmUWxyZlVDTk1hcTJTZXdWcy93WXFjdU9Gb3FrTFd2?=
 =?utf-8?B?TmF4a3pUMzl3NktXTlFmMUhIdXhRbGFUc2grZHhTN0dwekJnWDVPeC9jTzIr?=
 =?utf-8?B?bWFXdlcrYXQ1T1V6QldYdlcwWGZrMzcrdlR0akRadWVzdWlNblZlL1I0SHJE?=
 =?utf-8?B?anZFTElUQVNMaGMxaTNjUWFDVVRIWVdyU0ZFUWtjakcvNmFvZjJjMDhKdkVB?=
 =?utf-8?B?Y1phaTBhcTI5U2hCa0tGVkJNQlZBR25nd2kxZ1VxbCtZZUlSTnF0WjBZak5r?=
 =?utf-8?B?SWJrUXgyUDJPTGZZUXB4dUJNQW9MVWZJK0lHKzlMM2x5dDU3ZnZQRVJramsx?=
 =?utf-8?B?MEJMUkk2czJBcHZZaGZFdnkxQ2JKM3NXcitobWZGZWVIVkRqWFY1Z1I0UDFo?=
 =?utf-8?B?NklVR3BTS004NkpzWmRqeE8xKzFuZk16bldvR0Y3NmVaOXJZUHBYZE5WZmRC?=
 =?utf-8?B?V3JFdEhLNndRVEY2dElaZlR5dGdRRnJ1SUlseTV1eFJub1BDTzdmV0JjNTRu?=
 =?utf-8?B?WDYxQVJuSlpQdCt6LytwaCtuWWRVcFduK0dFaGg3VEtHdUMycmorcjA5a0xW?=
 =?utf-8?B?OTFuZHkrMWV5THQwVjZmcUNiUGVNWitBWEd3WDYxWVdaWXhIZFhBY2lGWXdr?=
 =?utf-8?B?ZmNpVFpXeUd1WWlKNTFSL1dHRWFoRFRNS0VRNko0R3BDREhyTjlPNU81S05E?=
 =?utf-8?B?VnF0ZzlvSXdNVVJKZUpONUxKVGpjeHRobHVvVWRNNDZ1YktpOTk1Smo2VkZQ?=
 =?utf-8?B?OVdvVkFQQUtyWm9OVi9uTDdiQkN2dlBtWFVpelpzM085QW1kdGFaOEVnQ2Yr?=
 =?utf-8?B?Sk5McGdyeTIrTFd1S1FHQ2pQdXp0aHJ1ODQva2xlWFpVNFcwMXRGVGdXOE5i?=
 =?utf-8?B?Y2FpS3pINzIyRnl2VzNianZBZUhlOEhZVWJJWXNNclloMDExUTk0eUpoUTBH?=
 =?utf-8?B?UmVvdDFHVitqZ1REQVY4V1RZazRaUFNUOHVOK3lDT1JjYkRSYWJUdnpGVk9T?=
 =?utf-8?B?dVFPV1FMYk5WQmtndm1VR3lHQkorKzBJendLc1BLWkJkclJVb2NkS2JST1Nu?=
 =?utf-8?B?V3VkendyRzE0OC81b1dsdUJqQWdNRkt1bkY4R3c0MWkzdVhWVHB0OVBKZmg3?=
 =?utf-8?B?dnl4NXNqb0NhMjFSUXEwMFNZUGVWcU1IcHBIMit6Ty9mOFNXSjZoQ0tUUzFU?=
 =?utf-8?B?ZTk5a1lhcDJBNEFuZ3UreEx2RHNsbktwWVRNSkRSK1E3bk5oaGF6ditDRUw3?=
 =?utf-8?Q?UD+UGlNb+lSSxybuBjM4tnkB9fPIM9D242zPonG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b68c78a0-d643-4278-b4df-08d945f0b46d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 11:23:57.3540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Snil5YGBALeOoAW62xGRSQqXjfUoVY5kGd+diPvoryvb2XgfdCpkxjMExbtLcXTc4Df7TiqpICfdIwCMWpSgPqTQPFK5QsxFCDDiIfm3Wu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5664
X-OriginatorOrg: citrix.com

On 13/07/2021 12:21, Julien Grall wrote:
> Hi Andrew,
>
> On 13/07/2021 10:35, Andrew Cooper wrote:
>> On 13/07/2021 10:27, Juergen Gross wrote:
>>> On 13.07.21 11:20, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Commit 0dbb4be739c5 add the inclusion of xenctrl.h from private.h and
>>>> wreck the build in an interesting way:
>>>>
>>>> In file included from xen/stubdom/include/xen/domctl.h:39:0,
>>>>                    from xen/tools/include/xenctrl.h:36,
>>>>                    from private.h:4,
>>>>                    from minios.c:29:
>>>> xen/include/public/memory.h:407:5: error: expected
>>>> specifier-qualifier-list before ‘XEN_GUEST_HANDLE_64’
>>>>        XEN_GUEST_HANDLE_64(const_uint8) buffer;
>>>>        ^~~~~~~~~~~~~~~~~~~
>>>>
>>>> This is happening because xenctrl.h defines __XEN_TOOLS__ and
>>>> therefore
>>>> the public headers will start to expose the non-stable ABI. However,
>>>> xen.h has already been included by a mini-OS header before hand. So
>>>> there is a mismatch in the way the headers are included.
>>>>
>>>> For now solve it in a very simple (and gross) way by including
>>>> xenctrl.h before the mini-os headers.
>>>>
>>>> Fixes: 0dbb4be739c5 ("tools/libs/foreignmemory: Fix PAGE_SIZE
>>>> redefinition error")
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>
>>>> ---
>>>>
>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>
>>>> I couldn't find a better way with would not result to revert the patch
>>>> (and break build on some system) or involve a longer rework of the
>>>> headers.
>>>
>>> Just adding a "#define __XEN_TOOLS__" before the #include statements
>>> doesn't work?
>>
>> Not really, no.
>>
>> libxenforeignmem has nothing at all to do with any Xen unstable
>> interfaces.  Including xenctrl.h in the first place was wrong, because
>> it is an unstable library.  By extension, the use of XC_PAGE_SIZE is
>> also wrong.
>
> Well... Previously we were using PAGE_SIZE which is just plain wrong
> on Arm.
>
> At the moment, we don't have a way to query the page granularity of
> the hypervisor. But we know it can't change because of the way the
> current ABI was designed. Hence why using XC_PAGE_SIZE is the best of
> option we had until we go to ABIv2.

Still doesn't mean that XC_PAGE_SIZE was ok to use.

Sounds like the constant needs moving into the Xen public headers, and
the inclusions of xenctrl.h into stable libraries needs reverting.

~Andrew

