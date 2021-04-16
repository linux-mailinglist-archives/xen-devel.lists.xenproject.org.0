Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67630362132
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 15:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111750.213719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXOgS-0001fV-FX; Fri, 16 Apr 2021 13:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111750.213719; Fri, 16 Apr 2021 13:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXOgS-0001f6-Bz; Fri, 16 Apr 2021 13:38:56 +0000
Received: by outflank-mailman (input) for mailman id 111750;
 Fri, 16 Apr 2021 13:38:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kml=JN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lXOgQ-0001f1-OV
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 13:38:54 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a71a68a-5430-482e-a5b0-3dc69c1067ed;
 Fri, 16 Apr 2021 13:38:53 +0000 (UTC)
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
X-Inumbo-ID: 8a71a68a-5430-482e-a5b0-3dc69c1067ed
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618580333;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nbO0UYxMPN49lUgfPa/AOG9MNqxUbjVd/4U7g9nz5T8=;
  b=E7/sGavd7G4/WUtmfQxY2czVSSbnCF9l6p/UXeFyD0uQBHntSEvc2Q5r
   7dUgv6dD7FFgLWsjJVz/ZnlrztENvdhKCeXDO2/+v3CBGGy54B+9kmlys
   0ocyIRALuY5cQoqQZrrfnHf8R7FEMxyBwcPCm9IHzExNN4Cjvt8xmbkw0
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xaoYQ3NZf8djGSwE4DiGWqbA00/SqpNknjX/uu7kaUVxmh0o33oK4ZND2Sq4aWB3bk3FQcDHPh
 C7eatzJbasog+DrkNSmdZ0X7ujo0ozLgyaMkLNaTkMeM7K1rfV0ctfck6PG2Rs6IhOT9NqwugR
 ESevpuxpvENwx+OJHpiTKfHQJ8HN+MAbQ495HSM+h29zahcmVbvJ0DtHZ16B5U6M6RWVyCCMMo
 YgPnydw4DbvCQPJTjvuK7gU224QQDOI8ereIL57DFo1464rUzPeYwx8ip6oiDw3BZsoOUhwiDJ
 FRw=
X-SBRS: 5.2
X-MesageID: 42141542
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ycGq16M2Y3p1FsBcT1Dw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZqQHIMxbVstRQ3a
 IIScNDIfX7B1RikILe6A63D94vzLC8gdiVrM3ZyGpgShwvTqlm4RtwBArzKDwMeCBtA50lGJ
 2AovdWvjbIQwVdUu2XJFkgG9LCqdrCiY78bXc9ayIPxQGSgVqTmdrHOjeC2BN2aVJy6JcktV
 PIignoopik2svLsyP080/2w9BolMD6yt1Fbfb8wPQ9Djn3kA6naMBAdtS5zVcIidqi4lorj9
 XAyi1IV6sc11rrcm64uhfr0QX7uQxejUPK80OSgnfovKXCNVEHIvdBno5Qf1/47EctrbhHoc
 d29l+ZrJZeAFf8mj387bHzJnNXv3ezyEBDrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcD1/p9tAB+nRkGcmlMq7M2nX3w1EBvDaFMFoNap3z9fm20851cExfYYgmwL+PsGOtZ5zt
 WBFp4tuKBFT8cQY644LvwGW9GLBmvERg+JF26OP1L9FuUiN2jWo5D6pJU5jdvaNqAg/d8Xot
 DsQVlYvWk9dwbFEsuVxqBG9RjLXSGzRjLoxsZC54Vou7H1SbbxWBfzCGwGoo+FmbEyE8fbU/
 G8NNZ9GPn4N1bjHo5Pwkn/VvBpWDojefxQnux+d0OFo8rNJIGvnPfcauzvKL3kFithXmv+B3
 AETSXiPcko1DHoZlbIxDzqH1/9cE32+px9VILA+fII9YQLPopQ9g4PiVq44cmPISZYsrM/eV
 Z/JL+PqNL7mUCGuULzq0l5MBtUCUhYpJ/6VWlRmAMMO0ToNaoYt86HYmBU1nufLhp5R8fbeT
 Qv4mhfyOaSFdi91CoiA9WoPiamlHMVvmuNVIpZsLaE/93ZdpQxCYsGVKR9GR7QLQF8nR9npQ
 54GUs5b36aMgmrqK2+yLQIGenUdrBH8X2WCP8RjUiaiGKxioUEQGABUzunTMiN6DxeOgZ8tx
 lW6K8QgL2JhDC1D3Aw6d5IfWFkYHiLAb5AEQSObJhVnLeuYw1rUWKWn1Wh+m0OU3uv+EMIim
 P7KyqIPfnNH1pGo3hdlr3n6VVuawymDjRNQ2E/tY12DmLdvHlvleeNe6qoymOUA2Fytt01IX
 XAYTEIJBlpyM3y3BmJmCyaHXFjwpk1JOTSAPAidL7Us0ndX7GghOUDH/VO+oxiO82ruugXUf
 iHcwvQNSjmEYoSqn+oj2dgPDMxpGgvkPvu1hGg5G+k3GQnCf6XJFh9XbkUL9yV8mCMfYfA7L
 xpydYu+eegOGT4bdCLjbvaaDNOMRvfq2+7ReNAk+EggYsi8L9oW5XLWzrB039KmAgkJMDvjU
 UEXeB15qvCNoIHRb1bRwtJul4y0NKBI0sgvlaoXqswfVQxg2TaON3M6bzSsrYrClCAogy1OV
 T3yVwtw97VGy+YkbgdAOYsJG4Tbk424nFr5vmDeI3dEx/CTZAwwHOqdnumNKZAQ62EE6gKph
 l049uUj/aaHhCIpjz4rH9+OOZS6G6pTsO5HRKUFeNJ+9K8P06QgqHC2r/CsB7nDT2ha0oZgo
 VZdUsfKsRb4wNS87EK7g==
X-IronPort-AV: E=Sophos;i="5.82,226,1613451600"; 
   d="scan'208";a="42141542"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTlekXfP1436M76orI2OHfkRSwR2iKkjwFzoJyTu/BqrWnl2CkPZIm6yBR8gBw+UQMd3bqke0BzAYB7fvOPYrQjDz7/LnrqNT9uOC0CB9sH9i9KPQVKiO+r8Kn5aq9DZ00Mn6y59KtsUD2ler0lU2WVMAgH+UIWUUc3CduBeqQvyQk/E6yHNUGKNBFjQtfJr8+gCURuPq45+O4IdsbhISfwCwpNbL4drWQzCI/pHGyAHUgORs7YjXY5joRfDhbnbu+2AWcbDaSDXf0stppj/Sb9/7FCKvR4aZOiztdnDwlbkcIwiio4Bt0DduHnRuy6grr8ILjK6TurNlMwbcoQs1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbO0UYxMPN49lUgfPa/AOG9MNqxUbjVd/4U7g9nz5T8=;
 b=mT+v7Kw/ldIEgYjjC7tgkFwY4zdj33WZR2YGmCS0flSaVJRkTVsnNEmQZLhR4YId5oEAOQSIAj3XuvxVUA+7XX0jZ6QlfWQstia+Z6j6vU0SZpoCJgK6LHFtr/Y5DEX0sY9ZKL2V28imwMrGe2jAejH8btP+aKpWw7W6GbE+RDMlNMaJLPfuiVED7uV0Nx+/kY/xz0z+pKlH9cZ0algTud8kuszlN43yuJ7i/fQVi2OOFQwZzuSC15Prg8gHCHs3pePzlCXaRtmqPKlq1Mr01eroFwfk2uGRuB5ilsC+HaVFwH+lxBO4RitQafZT6SGGW2HF7P7pdits+8ORV4/SLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbO0UYxMPN49lUgfPa/AOG9MNqxUbjVd/4U7g9nz5T8=;
 b=ZZmVka0hfTHKhsqpWmmojouAdwXiXTDUHyLi5O+D+jK+1y1TdFGpcfWsVZSlV2rJeVLki50FCMR0R9tElknZrgekN5mQs4CaStHl6+LRnB3UAAddM1JVhGT5BeHJ/ZOvCgOx85IrVUxQ78oP9lvvMsVyvoIUY/6UlP6rGaRUEfM=
Subject: Re: [PATCH] x86/CPUID: add further "fast repeated string ops" feature
 flags
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Anthony Perard
	<anthony.perard@citrix.com>
References: <c4e5fad5-0468-fe9f-aa6f-1a4efce72cc4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3124157e-a180-3c66-4bb6-6c451b8436de@citrix.com>
Date: Fri, 16 Apr 2021 14:38:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <c4e5fad5-0468-fe9f-aa6f-1a4efce72cc4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0491.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e0ce5bf-edb1-4f1d-6b6c-08d900dcf723
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB553494E9793F026BE21C810CBA4C9@SJ0PR03MB5534.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NgglXXqycn/1yy0Y9VZ1IxqUwhp3YiI1ua1uMpAz0pFX++FGfpG0OzPlvBaOM2pLgOgZ2fc4luDEuiPmIi7/+gnWqYl5vLijYqE98P5eh0OWfa/XUajpN5Kh9z6trx8y7tvaSfk+5L6NSJY4Jy+o4uLEtl+Cue598RdsweVii/IGNeG9osjUzBiiaAyTWzxFJEocb4H5+b19Ir6qLT9crsU3AJs+bL4P7a/PeRwQvKwSR2qwOVnX99JJ43WSQbZwXlZ/kSn0Xd0301Abxrj+nYvG3SJJhN0CGxUUhSo6OuX7W7EqIc7AZFUDC+hEn7U0rAWwK0tzpKiCyMoXIaEREsAG+WCZPBA4Ec/YsS9XDJ7m6BGTOVv3YrD96fFIw9YjDOffcl9HyRDdDQIM6fOz8GPXNWWfkxu5l/w98VNGe3eeHAf9TrVihfuBWjFf5F7E0a2LPc8++MpQahcAOI4j8VTkEeXd0OC6GLhVRr2rMUzN/+opRv2PS+NzrysrLr4xb9nKshxPMvaQjGHHmwG1EmIvC61oXAOZReIFn9xUVuifP19dKqsH9dhc1tuVk9QRC4w7C4SGAELYO9NzuX5nRx2maU0BTo9o6hIicVxV9AacDTLDNPEbG9vw4saxd2LZ/zeGfJ+u8Y/i1wbe5jJXI0JM7FSK9GTVkw52y37Ya9TQKnWoHWH3AAX1ShWTtYiy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(107886003)(53546011)(4326008)(186003)(26005)(66476007)(5660300002)(66946007)(8936002)(66556008)(16526019)(31696002)(6486002)(8676002)(86362001)(31686004)(316002)(36756003)(2616005)(16576012)(2906002)(956004)(478600001)(6666004)(4744005)(54906003)(110136005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RXF6Z05LNThPZGQ3bGhuVGEyaTV1a3ZRUmdIR0V1WVRoWnNDSThSVHNLeUtU?=
 =?utf-8?B?WjVVekE4VG1HZzBpbDIyY1dJVHprL1d1UDdPN0g3d0VxbENMT3Z4MTVuZUZS?=
 =?utf-8?B?ZUFCWmlNeDM5NXovcC83WFhHWUcxT3Y2UE9JQ3VYOEN6c0lYcnJPR2ZyWVlV?=
 =?utf-8?B?NDVSNlpZS01PVGJ3d1J6NUV4enpYL2p5SVlMbzFqcFdscG5DYzlyM054VnR1?=
 =?utf-8?B?b2E2ck14OHhIRkFvNHROdGRPRHRMenlEcDhmM3FJY3RoUFduNHVGV0RjNWhT?=
 =?utf-8?B?RXA0RHpJb1RJSENseE9EcXIvV3Bja2NOQjVwQjZWZ053VzB0TXIraDBzeUhR?=
 =?utf-8?B?Um8xNFQ4eFNCQ0huTXVDb2hyL0kzRisvSmtiVVVUc3krTkdvcFROeEVEM0w0?=
 =?utf-8?B?TTBleTlpd2VLOHQrZG50aWlXekZWUG50MmJDK0o3R2NKbmZQKzV5NVJTd0dT?=
 =?utf-8?B?M0tpeisxNnJDM0NzU2NTWHkyNGpyWUZ6elBqa1UvVTR1dDl4TlhGdE9NODRt?=
 =?utf-8?B?bVJid0ZDYUFYRUNvdlBFMmtVc0VJQVJZVSs5VW1jUHg3amFTbThpejlEUkta?=
 =?utf-8?B?SkV2dVdPRjRCbTE3bDdYMjlwN1NoTktCUmRSSThDcVEzR0pGQ2dwbWpRVy9i?=
 =?utf-8?B?WHhLZGRHaGtueEtxT0RqMDN1NVczWVpXSitMTjkxN0dMVHZFVldPTU8zU0hi?=
 =?utf-8?B?WDExeTY1bTVjdGxuN1RUVWVpZEthb053c01kWVViTHdyYmcwenJzUThuYlYz?=
 =?utf-8?B?bThHT3EzY1ZOUU02b056OW5JSVU5TVZCaDhub2RtWW1GOVVVL2RjSjZiTFNY?=
 =?utf-8?B?UFRQS1pqZVlodEd4amljbFlaWTBramlWVDJ1aUdCYm9RY0puN0JjSGRvTXpt?=
 =?utf-8?B?VitvS3NQQjd5d3Vpa3R3QjhUN2lPYTFpQzVPOU9qZ3JFRVEyMHhZT3BUcDl3?=
 =?utf-8?B?WkVWSEY0Y3ZWaGlJbHE0QkJwcnNUNFFyUzdRVWJSYk1Fb2NQdnFGb3YyaUFZ?=
 =?utf-8?B?Y3BML0tiVzlsSHg0dVArZGJGTHZLR1luWUpScW9wb2RJWGtqaTJvN1Qvck1O?=
 =?utf-8?B?cENRZmpoU1VJK1FsSzhYSlh1dVpiSlRCQktzOVpzSUFBUUVGbGdSL1J6bkNN?=
 =?utf-8?B?RkVTVjdxSUJHWldxdFpXbXhJSWZJOXNXRnZvRGpxZGtpRWltMTJVbW9VM0pU?=
 =?utf-8?B?ZnV6WXh3eXd3R3dxR2hNUy9kSFJVMEVlWHY2NXFhb2RobTR3UWpNUW9vYlRp?=
 =?utf-8?B?UkFDMmpLU0xzZ2tkT2hwQkk0Q1NaeS9HMkkwblFGZUR0eUxpMUhkVEVSYTdE?=
 =?utf-8?B?bjZZbEZLTVN3Y3JyKzZwM0tXb3l1S3ZHeFlsbGhEeUM0WEdjRVpGQXlzWFkv?=
 =?utf-8?B?QUY2Yk4wV2dLenBGMDV4aU96MmlyTVY0TlI5eUF0SExleENubEtpWXY3RXln?=
 =?utf-8?B?d0hoa2VMRlBJR0wydUVQWTRLNnV4VzBwS0o1RVVTTndTV1ZXQWJNelVVdzZ6?=
 =?utf-8?B?NEI2SEtrL3ovQ0tUYzV1QVhNamJxQnZUMWtseVJPemxDeWlRZDR5bzdxSERB?=
 =?utf-8?B?SVZLaUY1cnR1OThEVFVrY1hiM3hvWStYd1pYSUlTWU0vYzZNS1F1eVAwc1FE?=
 =?utf-8?B?Nm5ab0Y2elRSUG4xcCtYRCs3Y3o2clpNUmpUWWFpcDFpeitVVDVTY3FUdVcw?=
 =?utf-8?B?S29OSjFPMEZsUVVHeW0xa0hieGlDb2FhSGdMeVJWeFBlKzdpVXBWdmN5ZEEx?=
 =?utf-8?Q?YP9Vrtk6Y/508h34wqU+y6NfQusZtpPUoIaWqAp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0ce5bf-edb1-4f1d-6b6c-08d900dcf723
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 13:38:49.0543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l52KruLeaOzV2zlVtSKyRbs9TR5HkOwmQFabmN3mBq7Ok31MShGfmpDaVUK/IbAAVBtrNLNiOjr2ghWQxCV5KJCh0yfXZMX0pdgwvAdoxKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5534
X-OriginatorOrg: citrix.com

On 16/04/2021 14:22, Jan Beulich wrote:
> Like ERMS this can always be exposed to guests, but I guess once we
> introduce full validation we want to make sure we don't reject incoming
> policies with any of these set when in the raw/host policies they're
> clear.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Like *everything* right now, there's no safety checking and rejection of
bad incoming policy data.  Xen will still zero out the bits it doesn't
like, and fixing this something which Roger and I are working on.  Its
basically the last piece of the "move to a new, better interface"
toolstack work.

~Andrew

