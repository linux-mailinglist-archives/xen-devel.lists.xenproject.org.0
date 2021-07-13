Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B58E3C6D9A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 11:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155253.286643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3EpZ-000681-4h; Tue, 13 Jul 2021 09:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155253.286643; Tue, 13 Jul 2021 09:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3EpZ-00066B-1W; Tue, 13 Jul 2021 09:35:57 +0000
Received: by outflank-mailman (input) for mailman id 155253;
 Tue, 13 Jul 2021 09:35:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRbA=MF=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m3EpX-000665-8n
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 09:35:55 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7c757ae-e3bd-11eb-8735-12813bfff9fa;
 Tue, 13 Jul 2021 09:35:54 +0000 (UTC)
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
X-Inumbo-ID: b7c757ae-e3bd-11eb-8735-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626168954;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vxT5CkU7iAcdzNi84SrgQZamLR7X08gqED74PP0+ZAI=;
  b=B5pz8/tWdStW5vOLaMcujPov1GfvnjTOdY87qBqFEo5pKrQuIePAItzp
   r2XSl+YJuV0AYuLDI3avZZAQs1rTuw0AfFev/lTYUkDdaQgURv2FyvC5w
   Uw/fvJ7IEnogoLCVSQl60NPYW1DJNfpkhqEKlzOHIVGURj5XT/5tnXHls
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7te/4Q1QP8lyw9wzH1vl0HTyahtxdjkT107rxeb05OLAbMJuGGgYuUG5NwpO7/kMPGUwtJIDta
 6EHMQA6NRfbN5myc1r0igayK6pl28vsm15KWM5ThQVzrBt1hK2sorR7sVRDCYCC/RuLicNqro2
 CrAyWDUgs2PIUN/sBu+Zkv9mDlKhqiNTKNIzr/ZJqi6jrdcbVxrnoSXxEahQ9ng5ITAthOEhHA
 x2T8cwUXKBme8afoXcnsy2yIfkoxfq5pM/n9w2q1ABHeeYa3GqwxgG34hxDwP9L2/rcYDCmu43
 rBw=
X-SBRS: 5.1
X-MesageID: 48137066
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JnpiRa++mY2wrK7kp0Zuk+Etdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Scy9qADnhOFICO4qTMuftWjdyRaVxeRZg7cKrAeQYxEWmtQtsp
 uINpIOcuEYbmIK/foSgjPIaurIqePvmMvD5Za8vgVQpENRGsVdBm9Ce3em+yZNNW977PQCZf
 ihD4Z81kGdkSN9VLXEOpBJZZmPm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTtj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZtA+1Dr1fqOk2lqxrk3AftlBw07WX59FOeiXz/5eTkWTMTEaN69MJkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l3CzvWEpnYco/j1iuLMlGf1sRLEkjQZo+M9qJlO/1GlnKp
 ghMCjk3ocUTbvABEqp+VWGqbeXLwcO9hTveDlLhiXa6UkRoJlD9Tpt+CUopAZIyHsMcegw2w
 36CNUeqFhvdL5cUUsvPpZKfSOIYla9Ny4kdljieGjaKA==
X-IronPort-AV: E=Sophos;i="5.84,236,1620705600"; 
   d="scan'208";a="48137066"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVn/U5/k53a2+UykKWuYd5PoLH0rBTynUA0vnD6ueF8oyJ6T5PueOqHsk0+z327hqi4zPYTK6JU1kXkjPJDYXlCfWO4GAZEITryCKT1GgnRolEMzXzlOgk3Ipy3iRlieCKKWpP6neCUqXUSWoCOP7pDhFFepNUI+8r0S8BQjqQfwjMVoP8Y3Q2IjMiRToa1JMtx6g/6sR4PKSqzaYbWSGasLJ7G5Uiu5k/n/q07jCAStDgQ86P97nFQCa/RGYmo1InsJeOb83C4twj8UBPyrHMw4r06HMIAb2v+RsVnHsjUbAC5EhCbQTZ3LdX11rD/svMY5+809tro6IHnJxJYx2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxT5CkU7iAcdzNi84SrgQZamLR7X08gqED74PP0+ZAI=;
 b=KneSavR30sTmHtpRdpgv0LwXtDcYklYoxpWCdo7nWkE6VEc7NU/u/NeNN9kNxO1odSqZDRT0g7Pkkx45IkoZkz/ZiaanZSol44MOWmLVGYWt+SHFQtK79i+7WgKdpGQdpHXcUquAgfYlwslgAwxHF1/phNGYkxL8YYMWlIR0DUCXtZoYg71QXONkMTmkxrHxZdtlZhxx83Ppl0NHNFe+zR8hcSFE2QasyaXCemu4wzzeZdKsdxD3LJAEcENQwnE9HKwSZliLD01YRaHPnywTxqG69/s0fMux1OsCCwzd4F7zy50ct0kU8gE2wdAdyaKhcnharSLeQs8GySOpewaEvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxT5CkU7iAcdzNi84SrgQZamLR7X08gqED74PP0+ZAI=;
 b=TkzH7GxAAdEt8/nZWD/+uXLavHWgRk0+HxeiHK/oucNlmHf1F/uVsjMaXbKvNuGSlHmrGQi076zPFByQpdeQlgp5yMzD0NopPfsVtLKwxSLQVNwB0qb1SSt/jcv/p2pHONjFoKxp2R1XhMjkHo5/50fHVg+lHVtzjq3DyINSSVs=
To: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
Message-ID: <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
Date: Tue, 13 Jul 2021 10:35:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0255.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a77d2dd6-a0d4-4ad6-88d1-08d945e19a03
X-MS-TrafficTypeDiagnostic: BY5PR03MB5077:
X-Microsoft-Antispam-PRVS: <BY5PR03MB50776CD25D9E49238DE586A3BA149@BY5PR03MB5077.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2VHLjsHqUe/wdXqBclDpbY6nVsGBn5qroj6xoOB6qrxv2pGXcMQCefBldHJGkZppJAWWgsvqtmFPvw8LkFIjYppUIPLN+tVfawAnTUR7xlbFdyPDN5bDCJVr3vV6+SnUAnSvfj5HtxPifdxgpyy+gmd3ABVTi/0tX1dHZ27eBAxf/pcpaD7OnClLqPf+33bhOh7dmaU2WS6X6Ev1y6OvoXnjLKi4t15zGxacAB7a0fdiXejwoLEvaJjdgUQhC5T1ttOFxbOUwp88KiKtEV3X+IeCpTAlWve++U5P5Vm4WWeBHFmKajwKQdRzspAe62acHKyGXdynd/NtHCzy3fhYjpjGeCIhsRv8rVB9lB3RN6Q4xhjOgVgYFd5dNEaaKZ1/uqUVa5YEsQk9WMQdJumfBXXgpa9kXB+bibrGbRKcqLC0/RTe7SspIe7PHOEIUAb4qPEToYy5aGJrnNiwa59yksHcHDX2KH52k29P3gaOeL0T8FaSY0rJLnjV4j7HBKbIO6Wah9kJEf2soIadCxg5O31AJ2xfMKMOxxutP2tDL0XcWooEqRSdpUcrzCd9g7yHWz4qYWk4KFHU6mI45BVsbKihbKRwwYs2bRWJEDeWime7zBubcaqU4WJTEb2QsXaUkS49dSCyHwm/tZh+hit3F3CgpKrFzQDdIuNnnhmOFvIa2G4HtbN5JIIw4R/zwxBW/P9gQjlpB5rVHODhuc1GsrPZHT4jzeIdNWjGA5zgd3oa8etTiwQQnbXNHfEshVYu8PT6pfoOnIehwkA5uqi3OQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(366004)(346002)(376002)(54906003)(31696002)(86362001)(66556008)(31686004)(478600001)(110136005)(2906002)(956004)(8936002)(6666004)(53546011)(66476007)(38100700002)(4326008)(26005)(6486002)(316002)(16576012)(66946007)(36756003)(186003)(2616005)(5660300002)(8676002)(98903001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHM1QnlyV1Q0bkNQcTNDbEZCVDJoOHFNa09PR2R2RjJwZUg5N2NEV01lYmZL?=
 =?utf-8?B?RmlucWFEYmFRWGNVUGd6c3JFNXgyTEovc1gwRHR1MHBmK0ZiZGQ5Tkxldzcr?=
 =?utf-8?B?NUxmUi85bWhHcmR1eXV5VmJCOEZyMTdpSUdmdXdqYTNJUzN3SkdzR1JhQ3RR?=
 =?utf-8?B?d3hxcUNFMkdFc0pZMWZhUGJMMkVUQmp2djZEWkFCOWpoRFptMWhDOWhjTW5j?=
 =?utf-8?B?aE1nRGRLM05nTjJMYnNJbkxWVFFoK2c1MXpGRVRtUTJnUm5tZjV3UWo3MnJB?=
 =?utf-8?B?UkRVRHZyU1BacVlkZXlIekRMcitwQWhLUlorUnFXeEVibGJFSlA3cStRV1pL?=
 =?utf-8?B?V1UxbW43aC9FdFNTNERNek5wbG5sdm1hME95VXo4MzByMW40SkxtUFY4dlVI?=
 =?utf-8?B?cHM3M1dibnVvNmxyQUlZWU9nS3ZIempkbEhMekM3VVFibXlacDE3djk4QjJ6?=
 =?utf-8?B?ZzV2Q2VjcklvR242TTFoWlY0K2RqMWRwSHBHZXovMm55QXV3VTduTjZMazJn?=
 =?utf-8?B?Mzg5cGN6Ym5GcHBPSk1WR05Vc2poZDMvN3lEWklIczQ1cGxtU2ZFVXJNUXRw?=
 =?utf-8?B?R0JKMk5aMjVJNFR2bEtaZzZvZEpjOXRKMTU4WVVkZUZVRmc1WXlRRHhNaTVY?=
 =?utf-8?B?eXVqQTZIc0JxcjJIWXFzaTFobW15SC95TnFFcUVrTGtYczFHVDBPSFV6SXkx?=
 =?utf-8?B?UWVEaEh6ZGlCUktCdmsxZjlCMU1ibHNwMkFaZmR2b1lMUzNzM2RFMko5aUhr?=
 =?utf-8?B?ZDQyY3RNVXo4ZUNmMTQwaFZoMHBVRk11VXkvM0RaT1FQenVUaEJoVWp3TWFr?=
 =?utf-8?B?V3h5TkppckkraFB1NnJVTDdQS2tzcWljMDhtbkJvUW9zQ2gxQkNZQ2F5YUNu?=
 =?utf-8?B?TSs0SldCQ1hFRmllMXY5OFhkL2R1akREQ1ZEUTNmMzBrdTRjbDc0THlBaWVi?=
 =?utf-8?B?K1BNTUJ6bmZGZEs1R0c1U3JYdWJ5eDI2aUpnR1lRb1hreFE2UzdUeWFEVFNp?=
 =?utf-8?B?UHdLRTlnYUZNQzhkM0I4a3VXV3FOWk1JZENpbnNWRElPQTNZR1JoTkM4WVF3?=
 =?utf-8?B?MHhLSzJvTnhXT08zREF2K2swM2FLYmtrVXBoZHhxUHNTSm1jMnZ5d1VBbGY3?=
 =?utf-8?B?eEg4VjU5Q201bXk5LzlqbDhBeGdOcjk1T2RRRkx6d2IwT2tBeEtUREJ5SGR6?=
 =?utf-8?B?NFRQMFRFZXNlZ1REZTY0UXpxbTd5SWxXQ0FPS092Zlo2U0QxdWFOTkw0TFRY?=
 =?utf-8?B?MlIzcFZySjhjYkNkSWRTWFBKZmYxYmZuU0lUUGJhbllReEs0M1JNVUZUdjJk?=
 =?utf-8?B?MDhBd2tjZ2QwQ3MzcExtL2hlZ2RvdXBXUTNGZ2VmVjV5dWVOdCttVy9PWXFu?=
 =?utf-8?B?eXpaSzZYakNiNjg3UXRZRjNtZHJTUTE5VVdLZHBzYVczaHBRTDlHandMU1pm?=
 =?utf-8?B?M3JNcWZKLys2Z0FHTG9iTVZueXVyd3RoMEYzaVdpeCtTaUsxZG0vUVdKaDVE?=
 =?utf-8?B?cklYRXJxMVVuaFFMN1VBb2Z6c2NyY2NUOFVzUHZBMVBRNUNJNXptOHNOMVFL?=
 =?utf-8?B?UGUveVA2ZHQwbU5hak92M3VTUVRwUjFNM0NmTW5lUVQ3Vk5WS3FqR3BWT2pH?=
 =?utf-8?B?RGdreklsdlRjdEh4WmdUM2pseFVrUUcrdnYvZ3BsRVhEZHc1OW1RcEIvcGk4?=
 =?utf-8?B?R3FaMG5YYUtDT3pHRU45Q1F4YkcyNncvMmllTHFGamdBYzA2VEttMjM2U1pz?=
 =?utf-8?Q?sj29x+pfas7eulJ+ncmXk5e7eHnJMQRRVaswm9T?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a77d2dd6-a0d4-4ad6-88d1-08d945e19a03
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 09:35:50.5095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6UDtE/FJVrHFFejChY51Iv+sBsuYFo4g2Wzzc5Xj8aawz17vfE4rDH2eYAJAWHYGIkI2zD8GXnMN9gZK9Dj6XdUxPZKeQ8TcyGPiYYJmd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5077
X-OriginatorOrg: citrix.com

On 13/07/2021 10:27, Juergen Gross wrote:
> On 13.07.21 11:20, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit 0dbb4be739c5 add the inclusion of xenctrl.h from private.h and
>> wreck the build in an interesting way:
>>
>> In file included from xen/stubdom/include/xen/domctl.h:39:0,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from xen/tools/include/xenctrl.h:36,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from private.h:4,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from minios.c:29:
>> xen/include/public/memory.h:407:5: error: expected
>> specifier-qualifier-list before =E2=80=98XEN_GUEST_HANDLE_64=E2=80=99
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XEN_GUEST_HANDLE_64(const_uint8) buffer;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
>>
>> This is happening because xenctrl.h defines __XEN_TOOLS__ and therefore
>> the public headers will start to expose the non-stable ABI. However,
>> xen.h has already been included by a mini-OS header before hand. So
>> there is a mismatch in the way the headers are included.
>>
>> For now solve it in a very simple (and gross) way by including
>> xenctrl.h before the mini-os headers.
>>
>> Fixes: 0dbb4be739c5 ("tools/libs/foreignmemory: Fix PAGE_SIZE
>> redefinition error")
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> I couldn't find a better way with would not result to revert the patch
>> (and break build on some system) or involve a longer rework of the
>> headers.
>
> Just adding a "#define __XEN_TOOLS__" before the #include statements
> doesn't work?

Not really, no.

libxenforeignmem has nothing at all to do with any Xen unstable
interfaces.=C2=A0 Including xenctrl.h in the first place was wrong, because
it is an unstable library.=C2=A0 By extension, the use of XC_PAGE_SIZE is
also wrong.

This all needs reverting/reworking to avoid making the stable libraries
depend on unstable ones, but in the short term we also need to unbreak
the CI.

~Andrew


