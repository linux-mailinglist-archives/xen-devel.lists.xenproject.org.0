Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE17341D9B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 14:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99237.188561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNEk9-0005LD-Bx; Fri, 19 Mar 2021 13:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99237.188561; Fri, 19 Mar 2021 13:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNEk9-0005Kr-8g; Fri, 19 Mar 2021 13:00:45 +0000
Received: by outflank-mailman (input) for mailman id 99237;
 Fri, 19 Mar 2021 13:00:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z0Gn=IR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lNEk7-0005Km-La
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 13:00:43 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6a96612-d6ab-44ae-a499-143a71a7f702;
 Fri, 19 Mar 2021 13:00:42 +0000 (UTC)
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
X-Inumbo-ID: d6a96612-d6ab-44ae-a499-143a71a7f702
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616158841;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jC9l/x/KU6qMZ2tu/k28lA/bQ5dXJbtKwW3CzD3rfMI=;
  b=Imga5r4/OV33hm3E0drjxPwAl9vIRn8DVmIJBjF+YCmM5ZxWJTag4Qd5
   x1i0Cq3PIMDt2Z7J7tgSzgAT7w37qOvyhL2rWQV5kIn4tHe3ytl3Jwj4e
   EAQf6p3tAhBgirappQts/nHxHOqdFCCBHCXbvglBKwf4FpVz5A8Le0gDQ
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MNV4IfXtrF4P4scRYYVQv5ZRieTNQE9gHtcu0qw2IhKqpGhmh8rsuzNEW9zimNP4LC6GgyZ5GX
 RTR0Ag+mpIlLrvMiJGrhBteXN4EWg8FiwpqycmqSZQEw25Uu5bEZU1fRHDB1oEVtFCeei6avOM
 gNs04ulwjDYOcht6bAMle3OBxK7bOp31ocDdpOrrQ5gZOyrKADK68sDFWIWCOqKHNWGi3hCN0Y
 U1FcQDQDD2zxoVuHeyfitu41vPncH8f6wCJrHtWNPYm+OZr5/DG+bf/PESz9z2IhwLqxHVOa3d
 L18=
X-SBRS: 5.2
X-MesageID: 39849250
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ut/yPqBIcYbnfeXlHegBtMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPufVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VHdMgXE3Kpm2a
 9kGpISNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0NcShBQchbnmJEIyycFVB7QxQDIJI/Go
 aV6MYvnUveRV08aMOnCn4ZG9XZr9rQm578JTIADRgr6A6B5AnYlILSOR6ewxsYTndz0a4vmF
 K17jDRy4eCl7WAyhHa33LO9Jg+orXc4/ZKGcDksLlsFhzCkQCtDb4RPIGqnDdwm+237UZvrd
 +kmWZbA+1Wy1f8Ol64ugHs3Q6I6kdc11bHxUWDiXXu5ezVLQhKcvZpvo5SfhvH50dIhrgVu8
 gqrgHpwqZ/Nh/OkD/w4NLFTXhR5y6JiEEvjPIJiDhnWZYeAYUh3bA3xl9fE5sLAUvBmeYaOd
 RpZfushsp+TUmXdDTwsGVp3bWXLw8ONybDaE0DtsuJ6iNRjXB0wmAJrfZv70soxdYTTYJJ6P
 /DNbktvLZSTtUOZaY4P+sZR9CrY1a9Di7kASa3GxDKBasHM3XCp9re56g03vijfNgtwIEpkJ
 rMfVtEvQcJCgzTIPzL+KcO3gHGQW27Uzio4NpZ/YJFtrr1Q6euGTGfSXg1+vHQ4Mk3M4n+Yb
 KeKZhWC/jsIS/FAoBSxTDzXJFUND03TNAVgNAmQFiDy/i7arHCh6j+SrL+NbDtGTErVifUGX
 0YRgX+I81G8wSFQXn9rB/NW278W0D28J5qeZKqutQ7+cwoDMlhowIVgVO26oWgMjtZqJE7e0
 N4PffGn8qA1C2L1FeNy18sFgtWD05T7rmleWhNvxU2P0T9dqtGn92efGtVzUaWPxMXdbKQLC
 dv43BMvY6nJZ2Zwi4vT/i9NHiBsncVrHWWC7ARh7OE/sWgXp8jFJ4pVOhQGGzwZl1IsDcvjF
 0GRB4PR0fZGD+ro76iloYoCObWcMQ5phyqL85SoXf2rl6duskre3seU1eVIIyqqDdrYwARqk
 x68qcZjrbFsy2oM3EDjOMxN0AJVH6aG4tcDAOOZJxdn5fifA0YdxbNuRWqzzUIPkb6/UQbgW
 LsaQmZY+vCDFZmtndE6ary619vemKBf0V/V2BiveRGZBb7k0c29dXOSru40mOXZFdH+O0bPT
 3fSRY5Iw9lxbmMpVSosQfHMU9j6oQlP+TbArhmTqra3Wm1LpaU0YscGeVPwZpjPNfyk+MCXO
 6FYTWJJDfgB+5B4X3Nml8VfA1P7FU0m/Lh3xPoqFWi1HkkGPzIPRBIQaoYL9z01Rmse9+4lL
 FCyfQ7suu7Pj+vNpqoyaTLYyVCLR2Wi2isVO0soY1Vu6V3lLYbJeitbRL4kFV8mDM5J4PIsW
 lbZoJRyrXIIJVucMwfYDgxxCtjqP2/aG8Q9jXrCeo/d2w3h3DVP9m186PFwIBfdnGplU/VAx
 2j6CVT8PfOYjub2ZMbA6w2J35KaEJU0gUVwMqyM6nRAh6tbedN4R6TNWK8aqZUTMG+aPgthy
 c/x9GDhOmMcSXknCjWoDtgO6pLt0KqW9m7Dg7JOelG9bWBSBixq5rvxM64lzHsTzSnL2wemI
 1ebEQVKv15tQNKtvx+7gGCDortokwklFNC4TZo0n7Vs7LWnlvzLAVhKg3WgpJfQD9JFGOH5P
 61qdSl6A==
X-IronPort-AV: E=Sophos;i="5.81,261,1610427600"; 
   d="scan'208";a="39849250"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ea85uEtH31bAUXrF+CJnqdm54Wg73ihVoGPGoP2D4W0iZEITwhQzMg1dcQbSg5mbV+Rg2HyZxZ9vN7GOLjYl0szWAAjBxrAEG7AEPE52+WEO38DI0CepvxHIHiCLmq4WeNMGcybKHloU5btpXDQF4VgFH2qv4Xl8P9whLEreSTSYua5DOWkl3XrJo6YSAs5pqCVk7xssN2GdaQB52TK0iZldn6KEWnP+R9Qsu2TZoIRtxPH1xdviw3FT4f+EKtMDWwT93rmX4q1F7SgYdfoLG/AckgcEuTcL55UWPwXW6PiXrj1tr9wtE2zvqJSu8e8u55Q0/Q16ohAZs7svf8xhew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMapGbUkc8nJroiuKd7gLHmcVz6oX0BZvmv4G79ZRvk=;
 b=JMBZcmIZfoF4dIkd/LRkCviHtt8h6TsB5i7LHLAuMCZo3fm7LPIgO4YRGL35/sfsF+8isYUqzF5GOI/AebQC2jck5NiSgx285pfuA+nSrO9zY63g0nJDrfglvupXF8NpcIBla2TWPM7JEo1bkc5+EDvoLI1hMKHwOE9n4XUMbWFFGSYTj9VSKko5W63y6MMZ5n9VyCRc9McmmIT5UZ4xjT7H7gOpF6FsBciDyLaLOHPjwLGSmvTsu6Z62pRt1LEkkS/gXQG6Gyy7TKVEZMvEcWz4UPMo6Mt63I4EUgWFHt6zYw/FUeglAgsEzZje+h8UMxI3GZ0po/tYgHlxDiMzFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMapGbUkc8nJroiuKd7gLHmcVz6oX0BZvmv4G79ZRvk=;
 b=jJ/y8bNHnT0cu1rKlWe9x+iL/zafiaWh4pXbrhJgY0XXbb/SytBhrm22AHD87EQ9S4n6EtmzBy1uGucXFEA0hZr8OxLh+92kidaiGmKvcbkyFyu+JUme2Cnf8RGoQ88Pd6XJlolFwhJxKnv3UtomxYQ32szQXafLfkeKKn9URls=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ian Jackson
	<iwj@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-2-andrew.cooper3@citrix.com>
 <df7b7faf-ce81-795a-6d8d-29fe967d2d77@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in
 guest_{rd,wr}msr()"
Message-ID: <ce3abf13-66ca-13f1-0b8c-25221cb90c77@citrix.com>
Date: Fri, 19 Mar 2021 12:59:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <df7b7faf-ce81-795a-6d8d-29fe967d2d77@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0284.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::19) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d87dd8f6-874d-4fe1-4c09-08d8ead6f705
X-MS-TrafficTypeDiagnostic: BN7PR03MB4515:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB4515E1BE8A255932AA137E60BA689@BN7PR03MB4515.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qqFfbidbI0g3v71Pm/IKEhyom4Lsju/swADXYta+96n3GPEOiT3zWDGg9WuQriIPph7VAouNR2vPxjL+2jupYv7GOk6CSlWqeVScWCSY2HzvZ/btaAFWPdJr9Ku1mocLLqHbExE/raDOdrAc8nzNp0gKw/13iRQSEjf5lG+KsLxMHH/4n/2gmT0rOySxv21jJ4+uINMpGT0RDROYiYHla40m4a6QL8/yBygxQ9K/hJjxT3YYzAKdcKm2Mp7E/0c3+OdE6GPUOzMUvOekn8FDtgWn4Qd9tc+BxZ+HhttLNriRU5ecLT7+5zyR8oSO0j3X+6H+j6oDWiS3To5lPokhm7qkskIDi/DaIfFsabIB8Fm/apLSi2TBvfxmEXck0nun4NtH0PNsmMhsDyU7lkU+Gpyr2ZXetXzyCm4x+X8EmbZLQddB6Mr7mas88fsLTkAv0S4RUi/MHudqzRamF7BB0vTARB5WTnOQUg8ACn1hQ9c6Dx2/DEh/B5EEJMQbNVC7P7igaXXfGOzQ3tCI2w+XVZnEQpcl5Z3SFE935diocW5jDKGwABQ6Xm5F+7BML17PJUNAkZEgfCYM2F0VJs58R1NZVzxffQfdgurEVxe9jToUhyJIXm7tvEIJy2hY12tQwTb4lSxNSEF+hsgay13iGSlTksvsEv1VCKKu4PUSgKvJHMx+fk6rTbf8Q9oIRE4xuTTOwR4KAbz/cc+uVKanKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(66946007)(8676002)(956004)(31696002)(4326008)(6666004)(54906003)(31686004)(6486002)(16576012)(53546011)(2906002)(16526019)(66476007)(5660300002)(316002)(38100700001)(186003)(8936002)(86362001)(36756003)(66556008)(26005)(2616005)(6916009)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dUtmRnIzbzNmUGdHUFNaR1kxNGs5UnI2QWJsMWJwc3ExSWRBZGZaTEhOQXBo?=
 =?utf-8?B?aTZwakE1Y2Y0REFjZHBCdTA4NmtEM0xIMUxTT0k2MlFrQW5od0NocGhWVTZs?=
 =?utf-8?B?ZkdJbER3eHZUU2JZYU4vK2dJamhMN2xpZGlQTE1TQ1o1d3ZrbVh6aFN0NWFJ?=
 =?utf-8?B?UDdVejVnSGlvQlc1RW00WlJkWGU2UzlGY1o2bVhiTmxFbXlpbHQvQmxUdmFZ?=
 =?utf-8?B?SEp6eUdtYU1pcTFtSzlVVnhwZVZjVU9tejY4QzJMQXZLeHB5TVZpTmxZSEdq?=
 =?utf-8?B?REhZWFEzeWd2NjBnbkJLa1hLVVFCVEl5S3VreVN3NkFobHRiMjh6Q1lIbE5U?=
 =?utf-8?B?emt2LytNSFF6VHV1Vnd4UFBnckJVQmxQZlhLWFJoQ0dtMHhhLyt3a2FRY1Vl?=
 =?utf-8?B?R2VtQit6S21DclZGQmZIVE5IczMwY0lSRmlpNlJEWXZ5UTJpY1QvaVQ0Nmtt?=
 =?utf-8?B?cnFTRy9lcmkvZkRXalRTTENkb3ZOdytrVnl6NEJSYVEvQi96Zy90RExCNUFi?=
 =?utf-8?B?UWovU0ZQNjF0aGo4QjFIY1FmUHMzZmY4aHQ1YWJSQ1A4MnJ4NDBqNk9hN1J6?=
 =?utf-8?B?UWFQbVoxSUkzeHdhVURUZ0cya1hHSzNBR3EwK1VSamY1bXh6RnZucEdzSW9Y?=
 =?utf-8?B?MjgyL3N5eDA0Zm4yU3NHbmtMM2N5MFhjem5XWmtDR1Q0aWN4b1FDeGgySGZX?=
 =?utf-8?B?SUJXVFhleUxqVlk1NzdYUXBVd2JvUW1OY29mRERvSWlwTEVHZUFWV0Q2M0Zi?=
 =?utf-8?B?RHNtUWlOWkFHUm91bml2WmZINGxOblZyUldiQjVUOTcvKy9heFpoV2d5dDI0?=
 =?utf-8?B?ZzNmQWc3RkF2RXNVRHJPQlY0K1gybHc0c0JtbFJQYlBMdjhzSU45azA0M2o2?=
 =?utf-8?B?OTFXcDcyMUs3cFZwUzBTNkt2SE1sWGsrUHp3R0kzbThoRVh4dFlZeU5kN245?=
 =?utf-8?B?M2lJT0FpZ29raEtuVUQrS3lIallEQUc3alFjbzNSek9IOGVrTmgyY1U5NU5L?=
 =?utf-8?B?cDFOOVRXVWo2Tmx6WWV4NmpXQ29oQWZoOXVodG1wb3drMkxmeUtnRmpIZE50?=
 =?utf-8?B?V2xyaEExWndYcmZyY1FxV3hQeGxyQkpOdnpzQnRETVNiZUJjdGtpcnJwVk1a?=
 =?utf-8?B?MDhTdk9GTHUvSHUvOEJzNGNFS3Q0WXlaUTRNRy8raXN4ek13TnlCd0hoMVdQ?=
 =?utf-8?B?L3o5MWYrWmlMS2ZLRzlVR2JjdkFzdXcxQUFHYm1oaitpMWZvSXRPZE9DZktj?=
 =?utf-8?B?ZWhpUlhDdy9jbHdoTTBKWm5uK2RBYWVrTGJTeDM0WGFnZ3FKV3JCRHV3U2Rl?=
 =?utf-8?B?RDExbGk3MWYyQUwzWGVmYnU1UzhhL2VtenZZSEM3T3g4WXRFT1FwYUpNVEw5?=
 =?utf-8?B?WUtuRnN6OTVrTTk2bEZsQTQyU1kxTy9vMDJISThPaldaZm9ZcWtVV09nWm03?=
 =?utf-8?B?NlVhMWZ5bDVDZWozc1Q1bUVmSTI1eXFPVGg0YUE4djcyaXU5ZUJDNUNiRzJw?=
 =?utf-8?B?Tm96RWpvaEhZaFNjaklHa3V0bVU2N0t0dHVaMU42QjJ1TUF2ckMxTmJGeWcv?=
 =?utf-8?B?bi9NQWFiRXpERklUSXhqK01rT01nT2NvTXRDS2lBVGt2blIyRjhFTWNQUUhj?=
 =?utf-8?B?dHBQR04xVGhraDZ3aFkzY2hMV2ZyMzVKOXBhNjBxTnRwVGphRG0xbXNnL2RC?=
 =?utf-8?B?NHRwQ2s0dEhRQ2pzMmRNRGsvemJhSmVPTHFRMmM5N3JqU0RkVjdYUkdiNTV4?=
 =?utf-8?Q?sGPm4dYR7uLDZRYKYH8se9ipcy7JxOb4Xf3cC0X?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d87dd8f6-874d-4fe1-4c09-08d8ead6f705
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 13:00:26.3054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ea/fixBoQ1CaZI3xuEVOh+0IHh8/KNprK6EhbX+prHiTWKXSAvTxNsVStO5/WlvNUWRnQ53aVsACBnp8D5hpz/Rh0datc2HubAE0qFY+2zI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4515
X-OriginatorOrg: citrix.com

On 16/03/2021 16:58, Jan Beulich wrote:
> On 16.03.2021 17:18, Andrew Cooper wrote:
>> In hindsight, this was a poor move.  Some of these MSRs require probing =
for,
>> causing unhelpful spew into xl dmesg, as well as spew from unit tests
>> explicitly checking behaviour.
> I can indeed see your point for MSRs that require probing. But what about
> the others (which, as it seems, is the majority)? And perhaps specificall=
y
> what about the entire WRMSR side, which won't be related to probing? I'm
> not opposed to the change, but I'd like to understand the reasoning for
> every one of the MSRs, not just a subset.
>
> Of course such ever-growing lists of case labels aren't very nice - this
> going away was one of the things I particularly liked about the original
> change.

The logging in the default case is only useful when it is genuinely MSRs
we haven't considered.

It is very useful at pointing bugs in guests, or bugs in Xen, but only
when the logging is not drowned out by things we know about.

~Andrew


