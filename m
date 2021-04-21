Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DCA3668DE
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114279.217758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9n0-0005V9-OS; Wed, 21 Apr 2021 10:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114279.217758; Wed, 21 Apr 2021 10:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9n0-0005Ui-K1; Wed, 21 Apr 2021 10:08:58 +0000
Received: by outflank-mailman (input) for mailman id 114279;
 Wed, 21 Apr 2021 10:08:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=48UE=JS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lZ9mz-0005UX-4f
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:08:57 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfa7395f-c76a-4c78-bbd2-df367a5de166;
 Wed, 21 Apr 2021 10:08:56 +0000 (UTC)
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
X-Inumbo-ID: bfa7395f-c76a-4c78-bbd2-df367a5de166
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618999736;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gzh2l2Ngooq9A8KxDsNTuIgxzkcGJRpRGbWfXwqBaWo=;
  b=IsGX0b/GbnyRmwlDpdauD7ir2WqKEpFXUWCMPkMV25xK4M8PGSDvSfne
   reEd6sieNmydKxBrPolY4fXoO2G+OfY0Go7QSZ+6wL+BiA+wjzM4D90Tt
   Ik6zUqAhTjqjaexLdfbaz95m0Xu4YYoffWT2qCpONcaabhr34Dc9gl7+n
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZMLzgPZ0wH+rTXyKh8DS2h1ejpegOuOWgrVn9o7nCEf2kEdtRvT/aYITS1IaNDONUspypWEKYB
 h4whLuwYQOg4jrPziKWfpPJuxIfEWRsWEZ7AhHA3WiY9olgf6nllND7IGyydlJETkQq6pVN2Xb
 x5jh2wZ+lDq33M456lauOs+DtPmieYSDI+lm2SploDmmEc8ZjsimiR6We1ObZkZ+Xw00Bcr2uP
 T9H3moB+0eUYsIKbQKkn3Dc5O7ehg3SBjM7ddIgbTK5GtQfG2LvbJipK7sWGeTdVO7RUv5n1HD
 YoE=
X-SBRS: 5.2
X-MesageID: 41895955
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:76xhkKGnO6hV9eu4pLqFRZTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYcNi+wFEpqSA5aQb8wE5
 SB7sRKzgDQBkg/RMK9G3UDQqz/vNXNjp3relorABQg5QmIg1qTmcLHOjKf2QoTVC4K/Kc6/Q
 H+4nHEz4iAk9X+8B/T0GfP849b8eGO9vJvDNGB4/JlUgnEpR2vYO1aKtu/lRAz5Nqi8VM71O
 TLyi1QRfhbz1P0UiWLrQD22w/muQxemEPK7VODm3PsrYjYaVsBerN8rLlUeBfY9EYs1esUuM
 kgvxP7xu9qJCjNkyjn69/DWwsCrDvSnVMYnfMOlHsaaIMCadZq3Pwi1XlIG5QNFj+S0vFELM
 BSCqjnlZNrWG+BY2uclmdix8HEZAVJIj62BmIGusCTzgFMmmF4w0Yy1KUk7wY93aN4ZJ9e6+
 veNKN00JlIU88NdKp4QNwMWM2tFwX2MF3xGVPXBW6iOLAMOnrLpZKyyLIp5NuycJhN6Jcpgp
 zOXH5RqGZaQTOhNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEHiaKb0rYiK/yef8
 z2FINdAvflI2erM51OxRfCV55bLmRbeNEJu+w8R0mFrqvwW83Xn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3udWT/hDTXRnPxam3y9Z99C8Hhjq0u4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66isq7TnxjzwU/4q0FSfjZNBEdc57vtF1lQoxURDk/yebEf//GWeWVY2mq7NgZyJvmmVz
 J3lhBSw+aaPpaQzSctB5aMKWSBlUYeo3qMUtM6lrCc49zmPrc1FIwvVqA0NQijLW01pS9a7E
 N4LCMUTE7WET3jzY+/ioYPOe3Zf95gxCGxIcBVrnrbnV6Gpd4mQ0YaWzLGa7/UvS8eAx5vwn
 Fh+a4Wh7SN3Ry1L3Ekveg+OFpQLFiMDKl+FwSDboVMkrXNcAV9JF36wwCyulUWQC7H5k8Sjm
 vuIWmxdevQClRQgHxez53n6Uh5bGmbYkJ2ZE1rqIEVLxW1hl9DlcuwIoaj2WqYbVUPhtsQNz
 zIehM+CAJjzdLf7m/epB+yUVEdgrk+NO3UC7ouN4zJ0nS2MYuSiOUtBPlP5qtoM9jor84GWe
 +SYBWuMTv9Eu8lsjbl/0oNCW1Rkj0JgPno0Brq4CyEx3Y5G+PVO0kjaLcBId2QhlKUDsqg4d
 Fct5YSsuSxOGmqNYLD5qHTcjJZKhTc5USxVPolrJhIvaQ08Jt/dqOrJgfg5TVi5lEZKsyxqW
 Y1BIJcy5rFMpV0f8MTdzlCl2BZ3+inHQ8OiEjOHuQ6fVsRlHfVMNOC3qrQpdMUczm8jTq1HW
 PazjZU8PjEVRaSzLI2C6o/JmJNdUg3gU4Sit+qRsn1CA+wcftE80f/GnihcKVFQKztI8Rckj
 9Kp/WJlfSQbSz2xUT5uiZ6OLtH9yKCTdmpCAyBXc5O/NrSAyXBvoKapOqyhizwUz21dgAxgp
 BEb1UZaoB7sQYZ5bdHmhSae+jQuUIqk1xX/DFhmBrM4+GdkRnmNHADFxbYjJVQVSRUKV6Sg6
 3+gLCl6Eg=
X-IronPort-AV: E=Sophos;i="5.82,238,1613451600"; 
   d="scan'208";a="41895955"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYY8aiEnesGdFkHux6vDz9xpj63ZHBQ5XLPXO1VDi5IHWnx1skBQpI/vSg3Os7OuYltOSVfcr/OWgT+9yn268fljJ6no0txdJBAyRciO5mOFEUmw8AXZbPbJImfueW/U6xsShnoPqlHreecIkVkZOdRQ03WMYg38ugQeVE+YfFLAYmZFG82R6GQ0hDWerFObe6NAtzUIEw+6dGoKGSJaNBuMwbukn2//Dh1oC5+mFND4MaJiCye6ER8AWECI17Z+xpHSzdUXDs6QMn93XVBJsCpdd0IWbsRujUsnYmFQZuxFBvP1QVi6S5iijzNOL7CdMH0JP28/r6QlsPZzK83blQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIxA9AExkXb7jCkIHGXGFRnm4xgS9ror02M7zg0YBfU=;
 b=P1rKjy9CPgGbGBGnaU7geEm+yLiX6WdBTTVxz52fksUHSrgNpN+Ap8Cg91QygtJc2IEiWMrqMBVHGTH5bw2vsn2sP2LTAuVLqpJBM4hR0qBfINRuZiUS5IMdRZK5HjFQLQyXOHaefTSh8b6MqpQn9Fy4+XpCPXEn3Ci1spnAtULbXoIHndCLY7eTit/jQfTv4qYv8LyHsFF/zijmToKIbB6m+QutKTC0W806o2MIKd+tYvqicfBy23VQpdEhK2cqnupvVgoGT90g5tvtR0PEZ6+l12kEKjf8kYt1S6AdHpUV9rTfcNqT53kijMh/hHeRdalB0MbhjOtzUMvVngk+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIxA9AExkXb7jCkIHGXGFRnm4xgS9ror02M7zg0YBfU=;
 b=CncMuYLqJBApgcYyz1iUfBzRk4O8EpHydW2OqxVWxpaXTOzC0onJX82l2Qeb9BgeB8wcnNJtPe4uLqPeclpG8JJjPh/vfD2Wk/P9VeDxaRL9aNRNQFgjl4Ky30vyCyTwZj2a4cVj9nJ49QzX132QeAhXDAY5SjbwoUTqju+pofs=
Subject: Re: [PATCH] CI: Drop TravisCI
To: Wei Liu <wl@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20210421092705.2295-1-andrew.cooper3@citrix.com>
 <20210421100418.7nyuka557iv6z2qk@liuwe-devbox-debian-v2>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e4f3157b-bb47-a15f-120a-e9b87d7d1faa@citrix.com>
Date: Wed, 21 Apr 2021 11:08:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210421100418.7nyuka557iv6z2qk@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0505.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7f96b9f-f7fd-47f9-5dfc-08d904ad7760
X-MS-TrafficTypeDiagnostic: BY5PR03MB4966:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB496639DE2770F00D292DA552BA479@BY5PR03MB4966.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8MyYduAa3csQW0yak//QQhnXYkDmRwbSANEnP0eCGBZyHLckAfz/jvdSW3vshRG4vUkEj+NMddzfAHlfgCCed58vUwatrxrqYAohsyhv7GA1ICPI+M3BxZmoET6zpmKloprCkEdkcffp0s5AHRl3IfXAYYdkXA4+E3ovxULB/LZV9UVw3wHzXAbn7sd89PxuPHIKjq6zBjArPgdb2AGE0VA4IHESC36Nq5w++QOXDXTYKpXruW/7YF+6m2gXWbUhCVQWr6+gAmjTtteR7q36qBZAMX7VGPbg2gpPRd1hSRSndTyuIYy/lhMDKLFSeNCC4w/N4dHa7bHRiR9raCofczI6BkFsph7ZMN4ZPjyZNqCXUyqfAvVYuGopCuYBSZrC+6lFfij86zjWK1L4OO2fRz+98khxhQxqLSgtqdw8EK0R9m1vkxY1YD5F8pU7r88wDf2H3C26uldlxrBJ8ZEJGfAImr1ZMTAFmYXghbtiJUeUP0SH5LnZ8Qbn0yL9fCNG3ikK7cA6bqbPU87U3zx4puYZ0J3RTA2DCzQ55ZePm/gQwivnC2GUgFv3H7bONmuj1CzNtCvfRTp30ZJ+EFcyqWceUuLW3UB1herGcZnK080B+ICvnfBfuFmVTijhxZI8lDKyXi4E2qQHEm3AzStWvvY+UctCnhUPKuoBlLNXNDP2nOHUcxA8ExwkhNjMC3ql
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(4744005)(54906003)(4326008)(26005)(478600001)(186003)(6486002)(31696002)(6916009)(5660300002)(36756003)(6666004)(956004)(2616005)(53546011)(316002)(8676002)(2906002)(16526019)(86362001)(38100700002)(31686004)(66476007)(66946007)(66556008)(16576012)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Wk5aQWpDdVV6M2RkYXBqWDRyNHhJeWJ2MXJvK09HODVvRlFCQm5XSjZ0TXZq?=
 =?utf-8?B?NFNaSlN3OXQ1U3RCUExjTWMwMjdQNk9XYnJIOFU4QkRNbUdES3l0bjhxRDFF?=
 =?utf-8?B?NENTUGxlMmFBMXBEcElTSHIzU3RLaUNmQTF1Z1prV2pST05xTGJRUDgwcm5X?=
 =?utf-8?B?N3B2S2RIUFZJcHNRRHhWTXFRSjAyNzFrcWgvbTl0SjZ4VTVPMGRLTzVwVXJN?=
 =?utf-8?B?d0ZUOTFoZm9JbDREckR1ZEtEdWFMSzA4cnFqMkNsZU9tRCtQamhsdlBpT29T?=
 =?utf-8?B?M1ZIb1J3d25sS0NlT1N2U1JpMGc4NWZRYlNjYkJKMXdpb2pNRDFHOG92WDJC?=
 =?utf-8?B?cWd6SzFLeVFGNjEvZE05Q1lVTXZuZVBZN0lpSnNOVXJva0dVMlRISDZRR3NI?=
 =?utf-8?B?bWpFVlBXbTBDUTRuOENjbHY5SVJYOFlBcWgrVFhmeWs2aUgxZE0rVlN3QTU1?=
 =?utf-8?B?MlNrbnc5dlVTRGdHMk1ROUFQVmlUcFFNRzVJUXQ4UGF2WGFCOVpxTE51em5r?=
 =?utf-8?B?bEcrMDVmVEdjekxteVBOL3dHbWYzeGdpdkM4ekh2KzRqUGZnRjIyaFltU3dL?=
 =?utf-8?B?c282aFl6V0orY0h5bTRSWmFLSlhvc05nOG9nSEtsdkJWR2llWEZZbE5SU1U3?=
 =?utf-8?B?bmJOODArWlp3eDQ4YW9jNEdDUlVGRTJES1ZPa1A3Y1dadk82QTFKZVdGdDdx?=
 =?utf-8?B?YXB4dnpGNitJR1RCdU92Q0pZazNudERteDBhSklSd1F1RHIyY3ZjQVN3ZUwv?=
 =?utf-8?B?UzR6Q0J1bW5aV3Z0d25rRXk3OUoyZTJoUjlldE1acUlSZXVHeFFvVEF0T0Ez?=
 =?utf-8?B?OUhBZTdSYlVJSEZtUkJWMUpOVVNYN1BnUTdlWHBEMTdqb1MzN1hMbG51cjl2?=
 =?utf-8?B?amlQK3I2d1FyU1MvOC9xdTZDNmNiNFJXb0c5QkRhSm9HSXB4b09tT0plVy9Y?=
 =?utf-8?B?bDc0Q29INDZ3Vm9wRmF2WEtxa0lTdktFdXI4dzR6YUd6ejRLSUdWdWVJdDNy?=
 =?utf-8?B?cU9CYTFtekJWckgzR0lYWWRzZTdVRWhxM1ZPS3NSWjR0ZXNBR3Z0NHRGQ0tn?=
 =?utf-8?B?QTZXRGxyRnBmREJjUzJWdlZWMkFTSjk0WDNmS2hQcU9ubVE0dUJZcGhvc3Jk?=
 =?utf-8?B?UTYzb2k0azV5NFZVK0RQNmQzcWh4K3NXeXlReEd1amhSS1FZT0ZuVEdZUGZx?=
 =?utf-8?B?TWV5MHUxeWNlY1B0OHBwaVM1L1czMGhRTDE0dGFVWWgya3VvNXFreVIyMEpa?=
 =?utf-8?B?cysyM2pSWHd5YTN6QytyOFpqTUIxWldWWEIrOFhOMHRoT0I3eVlJWTg2cEYz?=
 =?utf-8?B?WS9LMngyOTNOdmlYczhQMHNuaFduS2kyZzlEUmxSc1hYQTBGeW5HSXN2OU5z?=
 =?utf-8?B?MDJQeXpTUmVYZnRONW5JcVJPV05LdkRrRFpTdHUrTm1pVUdUSXpXeUtqVWJi?=
 =?utf-8?B?aXZoeWVvQU81SU5TZDhmTHBqWkp4aW9udEh1WmR4RkhFdlM1RlNXZUJqNFVs?=
 =?utf-8?B?M3NLTzlzWnk2MldkZ2VyaWRNS2lUTXpDMVIwZzFNeTI0b3A0ZERsS1BUcEdS?=
 =?utf-8?B?SE1XdjJwbzBGTTNQUGgweUdBR242V00wK05BdW9UaXFSWTdqU3hXdVpWK2da?=
 =?utf-8?B?T05GSFNQWUE5RU9TM1d3NkpDb3p2OG1PeUJqc2tydHErWTFnMEhhVVFTSmsr?=
 =?utf-8?B?YlhlcDd1QnZqRzNoWnc3dFFJMjBycHI0akQvd3ZJRVovYjZNWUFYWGc0NUlB?=
 =?utf-8?Q?BfmwZgODe93TkoRLtEkUu4XtHa2fhRL6gzRPv4e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f96b9f-f7fd-47f9-5dfc-08d904ad7760
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 10:08:52.9422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxmeT0L2l5RLNtDXW5sVIa/T19grnB99ShenrwZVJ8Bj/PHJyIaQDi4asTrqJgpc4f2D9nqGIAb5LOOFksAF29BQMtU8RRHrfnn7M+I4W5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4966
X-OriginatorOrg: citrix.com

On 21/04/2021 11:04, Wei Liu wrote:
> On Wed, Apr 21, 2021 at 10:27:05AM +0100, Andrew Cooper wrote:
>> Travis-ci.org is shutting down shortly.  The arm cross-compile testing has
>> been broken for a long time now, and all testing has now been superseded by
>> our Gitlab infrastructure.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Wei Liu <wl@xen.org>

Thanks.

> I guess this also needs backporting?

Unsure.  It logically depends on "automation: add arm32 cross-build
tests for Xen" which is currently the top commit on staging, but said
cross-compile tests were also the ones broken in Travis.

When travis shuts down, it will simply stop caring about repos/branches
containing a .travis.yml, so I don't think anything is going to break as
a consequence.

Then again, it is probably bad form to retain CI configuration for
something which we know doesn't work.

Jan - thoughts?

~Andrew

