Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9DA3C708E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 14:40:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155354.286779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3HhG-0004Wv-No; Tue, 13 Jul 2021 12:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155354.286779; Tue, 13 Jul 2021 12:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3HhG-0004Un-KP; Tue, 13 Jul 2021 12:39:34 +0000
Received: by outflank-mailman (input) for mailman id 155354;
 Tue, 13 Jul 2021 12:39:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRbA=MF=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m3HhE-0004Uh-Ft
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 12:39:32 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a56451f-1125-4536-a15d-75de4833918a;
 Tue, 13 Jul 2021 12:39:30 +0000 (UTC)
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
X-Inumbo-ID: 5a56451f-1125-4536-a15d-75de4833918a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626179970;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ef84o/OeHu6OqZFNBEnEMx42HBtfd51MIH4pilvhb/U=;
  b=F8fQj3XA6FPK08cUfzf4W3Hzwf+3oT8U/BRZ6CYz7ksg54CBaKeKZ1ww
   QpAYpeik3dZFHzAwZg5PokG4XlG/cc1Gf1vrxshu0UaXZpZMgC3h5bTe1
   Vohn1wT340QfCiATSxAJt5w18MQrRrI+7oIBgiVTiQgnUfR6+wrhm7uAz
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: glGuvsySL4quMF26omlxfjiCcSBG1K4lre3CWoDU+iz7b+FK87Qzd4tQgW9FM/WIXfnQM7uf3U
 g84KJ6rRgrQzxmU5sIUkK5vvFun3XGoIBgz5zO5a0iXvZoDJ/18jj+EiL4IE1wXDoigG5LdkUX
 6SJUUHlKIokudA5pXiXxqBH0s9APj1Bw0/bA7w0+PRT39SFF77dzTvMT1RkZ09ZGPaoGUu+t2s
 B55K5cxFSqOtQrU6S44tgXVQoJI40m2HuV/srbndpGey/Gaj3npkXBjy74lirQkb3/mia5N1hV
 yko=
X-SBRS: 5.1
X-MesageID: 48157128
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:AS8xy6+8Qz7uX1FLaq9uk+AiI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKL+Vbd8kbFh4xgPM
 lbEpSXCLfLfCVHZcSR2njFLz73quP3j5xBho3lvglQpRkBUdAG0+/gYDzraXGfQmN9dPwEPa
 vZ3OVrjRy6d08aa8yqb0N1JdQq97Xw5evbiQdtPW9e1DWz
X-IronPort-AV: E=Sophos;i="5.84,236,1620705600"; 
   d="scan'208";a="48157128"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwXQhKTSeng+RDwwvNt/3+eZr3+HzQGbvlZnYj9gxJ/XuDk1ds6XN28FJc2hO8eHW7BkSSQmlHoksNZRqf4XYh1HSyY+u8rV+tTocHGqKy45Acre6/PVTvwCMpg76eM4nL80jI79piwMOwYlXbNSbRb/gLqJJC56KCrRqnmbNaeZgPn1U1xHGhZWrhv0YRvDyN9OQFyl+yqH+X2UqMUHAGWOC3Dc0yUAm32HHocf+b9qSe3/OYZo1nuXJ1yKPWNl2r4TEvC0X8MAt4OKmi6Dj1g4X88kuidb8v2edUM3B/aDezDqyXspKxILshGsUcWufbbSayKga9i9XErAlaj8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef84o/OeHu6OqZFNBEnEMx42HBtfd51MIH4pilvhb/U=;
 b=a7olgLiWBKO0rVWkQfvFvmIaD4OGn6KOWcAz1o9objAopYeH2fkNITaBc0XLditi2D7I2yUfOI2YAa8nVuuA08TUXJRIzoqrYOxRgfDTEYPbwWBCM1sfbLx18AESIw45lQ5RnAMcti0fcFl0suP9VQer/U2KoshCTHTl8q0JKTu15LdWl71/A+PnEG91YDwEmvUUaNY9VzC0+A+kbeoSuf54U4NB4zKw/tpPtPh2sd+KzHx4MOHy7WSqwXePyXCRyjYL8V+apX0kT7n+9PO8qdPeKCbmPKup+d60+BCqtrlBpD6kGNm+9q4DE3LUAYPlh5/wvu8xlpVXDkY5IcXFCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef84o/OeHu6OqZFNBEnEMx42HBtfd51MIH4pilvhb/U=;
 b=fsUAwKk+BZbSFZj4FRPgs6kWzl30NcoyQtWVouaFfon7TGNMtfRaI1aew8DHaVLQdO0rRyTobI3Xqn+H1gacD49fQX3FCa8J1jDRJiONiQWRJNVsxu+itw6XXUOPKjS9DkjeRudpk1WgSSv4rpNBiwi+7ZdHrwGBD761fg6L0Ac=
To: Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
 <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
Message-ID: <badec201-6719-844e-2a07-6508e891ca3e@citrix.com>
Date: Tue, 13 Jul 2021 13:39:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0084.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28122c0d-85d8-484e-a493-08d945fb3e9c
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5887:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5887AAB103D1858137DA38A6BA149@SJ0PR03MB5887.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y4zxqcmFFLDjz7UuUinbbV91y1o+cJJdIQca7oWGdWfbF4VorsmIk620sUGqfoaHQg79hAMWdBCNTKgmwDs+aoWUGQsyjOsBQBIqn2Nxnf4zdp7heuPCyGktU7O//O2iuW8tLoGuQuIKUtFT3LiPwCFS33DZ5R4R9LGdO+qQmFjyEgsTqzqmmGB1d62jcbZl0U9xTDHEKQCwHwMsV4Ii/5qm2fmXnDDZ9zH+EnY6r6tBzd9X4jKbDzKouIZQMfftk5xfNSJ2f52HPSTlo4ezLMmgPXWW+s9uap3DE3FhK0chpUqLOf3Bt23sxO3ntpkPKyRxBxHCNp1TCDmKTqg1fIQ6OJ5MbXumVYJmE+cLCM3NohnFwAfddwesof+Wszms0TpOt0jMmqx+LYMJwnJDlokK0atoaVdXgKbwDfa4Rt3d25a1BkMii59n1HcluKYablTxzIyefVDKNhKuyn/tcoPOR8bM1//LJk6JL+7BsXzH95NZsErFIdkMfUglbhLmVsUgbjtI1dgLAKhwqRaMEAuEHnA8mmNx0Gsg8QxZa5vNAIXJ45/05Qv7ZOZQyxUpoJkpOselKxm9hLyYKxInGu+f83a132pgwHQHz8hc9gLsFcTj5FP6HcMk7nZ9qkPd3eeE+LudM6csLYppWT2ho/oK9evZ0JaxaVDWp7TuH7/I1HQ8Ce1n18TPvvHZXAkFAcXdvEKfQmp+giJnjsLA0cC5BfHjq7Rk3DteZx73c1NFN5NcRtdnYcNi3t0AGY5v
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(39850400004)(136003)(376002)(5660300002)(8676002)(31686004)(4326008)(186003)(54906003)(38100700002)(66946007)(478600001)(53546011)(110136005)(31696002)(956004)(66556008)(66476007)(36756003)(26005)(6666004)(2906002)(86362001)(316002)(6486002)(2616005)(8936002)(16576012)(98903001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUI0NUtNREdjSkZxVnQ3WlM1OHF3RnhWa3RjTnFlR1FCVDc3NXJ5K1pqOFd0?=
 =?utf-8?B?QTRaa1h5dzFLZWxBZFhady9FMlhqeHgvQVV4SmJjMm1iTjM1RGh5bGN4WExD?=
 =?utf-8?B?QjZGQ2c0ZmtGTHV4cTU2L3FjajNTdjNPYkdnMEVkdFEydnZmWVVrNzhQVVho?=
 =?utf-8?B?T2NNbGZXaFd3MjJSUTZLaWxtNnA0VkxlR2FGL2REVFYwVFhha0Y0UGlialJO?=
 =?utf-8?B?S1d3M0JHZzhwUjJacDZzaWlxVXhRR3Qwc0NQWVMrdlIvMElEN0k0U2laSWlK?=
 =?utf-8?B?L2hGMjVhaVJUallLZmIwRm9uTmtscG9ZbTRoMTlmTHl3RzRHeUs4bG5xV3Fi?=
 =?utf-8?B?ZW1NcjVUSDdVUS9LS2M4ZzQyZVlUVktDamJHazVyTUQwK3JyOCtvWmVMSzZQ?=
 =?utf-8?B?OU1hdFE0L2RzMy9xRFVFc0x2bVI0eGdGSHBWdWw0b3BmaXpvK3lKQ2N1Y0pa?=
 =?utf-8?B?SFlvMklEN2lPS0sxKzF0K2ZGMWFrN2FkZVVkNjk0eklCL1VyQmZIaE9tSy9l?=
 =?utf-8?B?bjlrVFNUaTRXRWE1bzI4RlZRWmdNeDNIR2hBRVhYWENwY0Z1VlVUalRjajJU?=
 =?utf-8?B?dXRFak04YUYvUDRKTnFueEVsRitDWWJwa1JkQndHUHFBODNtNVh0MDUvUGtZ?=
 =?utf-8?B?Y0V6cGR4dVlNSjd0WFFKc2NTcE1GNEFYeWIrc3ZsaDYyNVJvcHJ0dHE0eENS?=
 =?utf-8?B?VlBkU0h3UTAwSWRRRDhmV2lWZDc5T2ZRRVRocVlhUFJ1VW1WNDVqdmJnTDJJ?=
 =?utf-8?B?cVgvZFhDMUJVS2d3N1JYYWtSMk14RGxHNHo0SGphZll3czZiNmZndXZ6bFNE?=
 =?utf-8?B?TTN6YmVNeXhoVVoyUUc4SlZWaHQ0TU8xRUZUL0JmZ2cxc3VTODBJdUdoYzl6?=
 =?utf-8?B?ZklQQ21jTEFzN2plN1RxeWo0bXdiLzZDRlBNWVZRSENVYnpoZkp3b3BuRjFV?=
 =?utf-8?B?V2laUXFUS0ZmaTlQWW1RMllaNDJvdTJ0dk5WYVNjSkV1YytxYWFYMlVKdE1y?=
 =?utf-8?B?akNMMXIvQmswUkNnNThhWU1tdnBsL2RiWkNoOFdqLzRQYVlVdEdXOWNWamMv?=
 =?utf-8?B?RWVGSExjY1hYS2dBbys5UkY0TkZKakw1Rmx4QTE1NytOVVJxandzaG90UmJL?=
 =?utf-8?B?elVUZW9UWDRPeHg3N05aL3N0bnZHa0g3b1NsbFg2TlYxVldXZWtYQnNRN2Zo?=
 =?utf-8?B?N2MvaHplQTFJNGZ4WWNnZnVNcGlVOEI2QzNCN0RJWVhGYzRXa3FGVVNxNWdW?=
 =?utf-8?B?c1VHQ1dWSURQQWxUNmZKYXJIVFI5ZXBJaTF2UHZKM1ZTVUxpSnJPU0dBWkE3?=
 =?utf-8?B?OUhSdTNPVkoya240R1hvd0luUyswWFdsdVQyL2E4MlJHZ3FIL0RiVC9Qbm9l?=
 =?utf-8?B?RFZlRWdMeVYreGZ0T1d0amtRWVZmSjN3aWEwTHJEMjFTSlVzTjd5aldQNkt5?=
 =?utf-8?B?Q1V5YWQzcjNqUzhvcDkvWEtMTkRkNnAyK1JPcXZUNVg3cGRNa1Q2eVpnaDFl?=
 =?utf-8?B?UFhSaGFFN09kWGdvbGFKNWR2ZmRRVUFVNzhueEl4NS9GQzR3KzIyK3BGMlZF?=
 =?utf-8?B?OTUyWDF5TmNWUTRsNnQ5TCtlUWsxNWpMRmhOdVVrNVhRNFBHTkpwNmgvNUpk?=
 =?utf-8?B?MS9Eb0Y4WDZnb1lDSTNxd0h4UnZLbFBKZUFJaG9QK1JSUVBoSkZyOUsyZEZj?=
 =?utf-8?B?citEYXdFeW1CRVU0RHp3ODZIVjhjejg2T0JIYThIOUpydmU0VDlhOXZjWWlh?=
 =?utf-8?Q?8GA+4OGK4sa3B08ZkeqdQJxpA+FvILMQ91A5V6L?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28122c0d-85d8-484e-a493-08d945fb3e9c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 12:39:24.0945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bP6WQNUCtP4nid1CSJMm8HMP1LMgZj2u1B7qmTj/9Yo3lFDc0wHCAukvW+5aIXRjiI1GAo6pHkWzsh8jYbvjgKz1KJJ0yqDYGv4OdQDr5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5887
X-OriginatorOrg: citrix.com

On 13/07/2021 12:53, Julien Grall wrote:
> Hi Andrew,
>
> On 13/07/2021 12:23, Andrew Cooper wrote:
>> On 13/07/2021 12:21, Julien Grall wrote:
>>> Hi Andrew,
>>>
>>> On 13/07/2021 10:35, Andrew Cooper wrote:
>>>> On 13/07/2021 10:27, Juergen Gross wrote:
>>>>> On 13.07.21 11:20, Julien Grall wrote:
>>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>>
>>>>>> Commit 0dbb4be739c5 add the inclusion of xenctrl.h from private.h
>>>>>> and
>>>>>> wreck the build in an interesting way:
>>>>>>
>>>>>> In file included from xen/stubdom/include/xen/domctl.h:39:0,
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from xen/tools/include/xen=
ctrl.h:36,
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from private.h:4,
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from minios.c:29:
>>>>>> xen/include/public/memory.h:407:5: error: expected
>>>>>> specifier-qualifier-list before =E2=80=98XEN_GUEST_HANDLE_64=E2=80=
=99
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XEN_GUEST_HANDLE_64(const=
_uint8) buffer;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
>>>>>>
>>>>>> This is happening because xenctrl.h defines __XEN_TOOLS__ and
>>>>>> therefore
>>>>>> the public headers will start to expose the non-stable ABI. However,
>>>>>> xen.h has already been included by a mini-OS header before hand. So
>>>>>> there is a mismatch in the way the headers are included.
>>>>>>
>>>>>> For now solve it in a very simple (and gross) way by including
>>>>>> xenctrl.h before the mini-os headers.
>>>>>>
>>>>>> Fixes: 0dbb4be739c5 ("tools/libs/foreignmemory: Fix PAGE_SIZE
>>>>>> redefinition error")
>>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>>
>>>>>> I couldn't find a better way with would not result to revert the
>>>>>> patch
>>>>>> (and break build on some system) or involve a longer rework of the
>>>>>> headers.
>>>>>
>>>>> Just adding a "#define __XEN_TOOLS__" before the #include statements
>>>>> doesn't work?
>>>>
>>>> Not really, no.
>>>>
>>>> libxenforeignmem has nothing at all to do with any Xen unstable
>>>> interfaces.=C2=A0 Including xenctrl.h in the first place was wrong, be=
cause
>>>> it is an unstable library.=C2=A0 By extension, the use of XC_PAGE_SIZE=
 is
>>>> also wrong.
>>>
>>> Well... Previously we were using PAGE_SIZE which is just plain wrong
>>> on Arm.
>>>
>>> At the moment, we don't have a way to query the page granularity of
>>> the hypervisor. But we know it can't change because of the way the
>>> current ABI was designed. Hence why using XC_PAGE_SIZE is the best of
>>> option we had until we go to ABIv2.
>>
>> Still doesn't mean that XC_PAGE_SIZE was ok to use.
>
> Note that I wrote "best of the option". The series has been sitting
> for ages with no-one answering... You could have provided your option
> back then if you thought it wasn't a good use...

On a series I wasn't even CC'd on?

And noone had even bothered to compile test?

>
>>
>> Sounds like the constant needs moving into the Xen public headers, and
>> the inclusions of xenctrl.h into stable libraries needs reverting.
>
> This could work. Are you planning to work on it?

No.=C2=A0 I don't have enough time to do my own work thanks to all the CI
breakage and regressions being committed.

This needs fixing, or the original series reverting for 4.16 because the
current form (with or without this emergency build fix) isn't acceptable
to release with.

~Andrew


