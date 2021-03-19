Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551B3341BDD
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 12:57:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99188.188454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNDkv-0006TU-Aj; Fri, 19 Mar 2021 11:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99188.188454; Fri, 19 Mar 2021 11:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNDkv-0006T4-6k; Fri, 19 Mar 2021 11:57:29 +0000
Received: by outflank-mailman (input) for mailman id 99188;
 Fri, 19 Mar 2021 11:57:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z0Gn=IR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lNDku-0006Sz-9s
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 11:57:28 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d06afab2-67a3-4cbd-857f-a6efc522ee0f;
 Fri, 19 Mar 2021 11:57:27 +0000 (UTC)
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
X-Inumbo-ID: d06afab2-67a3-4cbd-857f-a6efc522ee0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616155047;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OCyjjQXnTBoDvFNQszyHClghT4OnlH6xOaByZJpeKfI=;
  b=dP0NzrlGmTBS6Ve+633SCxU9Hu66adEfcwGrrCCJk9mzPD9nfjwmh9Fv
   XodOiD3BlFaZnGakyiLHL6tVhj8vhCRwMaqwm5AWxqbAdAnGpjjr/4y7K
   4UDB7wL//pQZLUVxE+NTRIqEEdiCkI+yPsd2225nimF0rSZ/3NNz5/qZh
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ++HRilZzOYDzK83EstmEtFlYzZGEzDNaEVO16QOfW4J1ItjGbE3+uLWZOgVPljl0fjGPbjlyp2
 AxVv60YY1U2wamEYRKbs9PcU5E73FNL5IebfOZ7g4/TRYQrUXAtc9mmSyVF2l8I7BdXFoIb6D8
 3OMzFR0PNwxwh9hQB8GJZiXS7VJx01KQEvNJKJrS9pY0lJMokBsJC87d65s353KOy8gC014SgP
 eCz03f2qcDfuHKx+y6SFPmZcYjMAyXc7ocRePDpzERZmUcYwvmG1S9Tf5e0v331ixU3w9mX6Tb
 F1g=
X-SBRS: 5.2
X-MesageID: 39682422
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:2pQNaqEsZlUlSx5hpLqFRZTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYdNi+wFEpqSA5aQb8wE5
 SB7sRKzgDQBkg/RMK9G3UDQqz/vNXNjp3relorABQg5QmIg1qTmcLHOjKf2QoTVC4K/Kc6/Q
 H+4nHEz4iAk9X+8B/T0GfP849b8eGO9vJvDNGB4/JlUgnEpR2vYO1aKtq/lRAz5Nqi8VM71O
 TLyi1QRfhbz1P0UiWLrQD22w/muQxemEPK7VODm3PsrYjYaVsBerN8rLlUeBfY9EYs1esUuM
 kgvxP7xu9qJCjNkyjn69/DWwsCrDvRnVMYnfMOlHsaaIMCadZq3Pwi1XlIG5QNFj+S0vFALM
 BSCqjnlZRrWG+BY2uclmdix8HEZAVJIj62BmIGusCTzgFMmmF4w0Yy1KUk7wY93aN4ZJ9e6+
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
X-IronPort-AV: E=Sophos;i="5.81,261,1610427600"; 
   d="scan'208";a="39682422"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvvEWHqq2zO6hVcWw77oY71ABWa9Y+KRV9Shx5MWqsidXxd9/KkSqKGGQ6L15NG/7jU+XzFFGjCaygrNbOV3KW+0IhmaP8K8ddDkZz855J/GoK7KRpTRpgGPrPYIEBbUYDhdB8jX0MyZzNb173kPfGlUcvYCY0R++vWJQz9X+gcB1rC7AzIsVEKfmdew1txe+PiqFYkTpbuVod/wOtxyoi9nStnfZkgamTIMyMD2MXcSxNsusNJeVB6lZqnnzTbfOWm1xA3AKf+jwplO8xRzk5bXkX/xEQY5xiTjADFhulZRjL55yJy0ZebRCYSRMX7xbXVXgzuALFOYEx0EAuSbxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsqooOdB76lGAtjkkaoc3F6WpDipErIvdHTplSG30tU=;
 b=mHo2RkuH9HpCLgguFij5RCInYwPgKxleWOQs7w1iNwu2bJj0TtaaEMbQx2H7n+KRa+T5a5ULHvA4O6tv1U7pjnARaN+1glBRM0VoOnQSZLfvfL6tXA2vIoSvBp22qw0UfuK23uBNH8TesTfDsN2UCdI/FE+HM5fu8LFsLkmJewl0X9YUvvqjp0Gh8xBfeJp+rXIWwMFTTWQ86uej24jvdgkqIHLAvNRjkH8d39bIbMWTdOGItodWszNUD9DH89Yz3lWYffJA1g/3b4107ONJaIEM2RTE86Y065Iov1Erzmz25jm7UQZbM7kWeSbXuGIL6uNplZYdk1szEIEJjTQYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsqooOdB76lGAtjkkaoc3F6WpDipErIvdHTplSG30tU=;
 b=nAgVFbOhFdb1JP0g56yls0NuavbaI2zJ9ZXaf8b9h7x9Adbrmxn/mjwJOnFW3Qen+lNEgYJqhE5f540gWLow9i7vW2Wx2yjWx74KFI59jT2J/IcsY8txpWc7B3qYe85PvgvnMvyyaX2vCAfcudIjpab0yInlYVAhQPYvCMc02ig=
To: Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, George Dunlap <george.dunlap@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
References: <5373f9d5-fc03-1967-8181-d77bbdaf25b9@suse.com>
 <b82a0932-761d-662c-baa4-59c4801ad5c8@xen.org>
 <24658.6228.390535.850901@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Call for tools backports (was Re: preparations for 4.13.3)
Message-ID: <e193afc5-2b42-8ebe-b20d-ba6fcd64742e@citrix.com>
Date: Fri, 19 Mar 2021 11:57:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <24658.6228.390535.850901@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0496.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::21) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdf35de6-7645-46b7-ffdd-08d8eace2791
X-MS-TrafficTypeDiagnostic: BN6PR03MB2771:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB2771A3CFB6B1571D16EF3F60BA689@BN6PR03MB2771.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qcskd58xjHPsHKptS4MtrCTSVMx/H1cCaiBDSoAhCrD1zsHAf723hDf0RifFWVKtHunV/8g+ZCPtnyRQPy8AQX0onKOaY/D44NUjCrLT5++qu16xkhWfYKHHE0C5HCEm+ygJYEsQybZ1cBfZzB0VHDsTwCKEKmiXUL6krexu39edKIlYtD1MC4KMzWSkdP7DVluElEby3Krm9OlG0gAnbbDiszKnL6X2z+7LeG9GuK1/wyTYzgU72uPujRROXUj2/w44dGfA2nZSzy151noGuIJ8iaUHF0TRXJFm5u0PsIE0syA/90iPMsCiPQfrjoURY45cd1VboMdSxcbOoght3mNfPeiEf7UPaj+/gwu1V4VzquxMFogArAehMDwPwJJ6F8EaCXOSPmZev7Uj38A4x4cgzrjRxtrsNu4mL3tCg0LvCv0I3c64Mfe1Puj4pZFgL09XEtT+Un133Oq+MbbT+WIf9PqPHsgXXFNyabwi7QuhlEJDCpCfvqpYfAptooZDj1BFGfkz3PBMzrlb2S6Hedvv46iR+9hojjeZWcQlgAo0xioeEfFO8F2J7iupqz6VRy7eccv3v8GsgfUnmsXpNjkYwV8ecam96glO9tL2tR1wWJzmEmxGIENDDnmD8PbJeMGevarWQAEx8pzPOi15XYMbCNOZ824VNqHwI6XDnbBoHMy3Hjoz7Vm9epE1TntoGHOLo/O6AmgClDgpu2SKoenuGRp6xt1Nb1NF5mnwpNQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(53546011)(83380400001)(31696002)(478600001)(107886003)(2906002)(2616005)(956004)(6486002)(86362001)(110136005)(8676002)(16576012)(26005)(54906003)(66946007)(66476007)(186003)(6666004)(316002)(5660300002)(38100700001)(31686004)(4326008)(36756003)(8936002)(66556008)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TExRV0pUU2pWMW9qb1ZvVmIreHpPYk0yTW1qbnhlZndWVkljUnpqMWo4REZr?=
 =?utf-8?B?SFdyb1FMQnZxWm5MY0pzZkJLYkdrakZkc25UZDZNS0dkNm5ReHFpNEJwZkp2?=
 =?utf-8?B?dmJlZWwxQ2NxUjNmckhram43YzExS3lYRUxBb3FKMWRCK01STUJxWkgraVhP?=
 =?utf-8?B?bmEyNFBadXZWQU5KSURhWEFiZHQ2RWpLU05tbjNJd2lUSjR1UkxCQ1BkNzQ4?=
 =?utf-8?B?MkJ0Qi9YYVRSSFIvZDBMNEhPQ0ZpT2YzYzdqNVR0WVRZZXM1bWh2Q250VVpU?=
 =?utf-8?B?YkVCaWxDajlLTWdQNkRqZ2V6Wk5TbklWekdaUFZTUklVUzVOSVlQL3VhLzhk?=
 =?utf-8?B?bVgxQTBjS3dRYzhlSE1JbXNYZ2tlYVhlSzJyVU85M2g4Qy9TLzdtVXlwd2xZ?=
 =?utf-8?B?UVlsUWJCNi8rNU1wYUdTaVVoRUFPRXNCVlYwRHc5dGd6eDRWZkJkTEgrNVor?=
 =?utf-8?B?dDZrNUFlV2xSUHowNGN5N01HMmZuQnhmb2lSanY5TGduQ0VJOHQ0cW9UY2R2?=
 =?utf-8?B?YlBYOVBhNXZmNVdWemN3UkFXRWJPMm9jTlR4SmhkSllZNTRTc004RldqUG03?=
 =?utf-8?B?ZFBQeTNuRTl3Zys4d05SUktQSlg3WitNcVRJblUxTDVScGY1ci9WWDV3Q2d3?=
 =?utf-8?B?ZE1Oc1JiMThCc21oblpZamZWNVdIdGcxSFhSTFVxVmxxSUpoRlpNOUt5eEJ5?=
 =?utf-8?B?SGdqbUF2UWl4SFdXNndieXNUcFRmcHF1Uk5kQjhXd3pycjZVclFDK0xZK1dW?=
 =?utf-8?B?WHFYQ21MQU91d2ora3hhSWV3Z05Tdm8zcUdJME1tRlBTQTlNd0trTmlwYmF1?=
 =?utf-8?B?dHl5a0g1RmQyRkZrSTM1VWpaVW80a2JJb053QnYwNzlMV1BYayt6YWpheVdQ?=
 =?utf-8?B?NFNBTEtHTVB4dC9ZWEJpZzNrOE1tbGM5Ui9KL283RnV6b1hnNGxDSWlPTjRm?=
 =?utf-8?B?MlR0Uzg0a0tGNFNLTGlEaitHWmQ0SWpSQlRWUkExUzNHVmY2cm9UVmNJazEx?=
 =?utf-8?B?aGY1RHE5SmlSQjAwbUZJTUFIQzVhV0ZpVHBCYkNBYXlJOFVqc01RYVdJdmZn?=
 =?utf-8?B?Zy9mK3BkTy9pckJLaStiWnlVaUFRU25vdFZuUjFOaHgvZUl4L1pNT3BncFU3?=
 =?utf-8?B?NzJ2NWpMekNrWks3RmJhbCtYM0hOcjhpNHpZK2Q2S1N2ZUtXVTdFQ2Y5Tkd6?=
 =?utf-8?B?ZHhtOFFKZTFhRzFlNGorQXBHK3gvYnRpWEVVOFpUeUpXUm9IN3NxMDdDeFJp?=
 =?utf-8?B?blJORGpKbTl3dFMyaE5CdXJ2dzFhN1BpczV6K2IzdjJDaXJUOThYVzh3MlF5?=
 =?utf-8?B?ZEdpS1VVU3ZjaWRCTEQyL3plaGpDNThJVkwzbGNuUWN6YldGa1BETVNDbTRa?=
 =?utf-8?B?NHFyOEoyaDFhTWlya1RCR3d0Y095NzZ3UUlZSW56SGlKcjhrSGVLeDJZd3dn?=
 =?utf-8?B?ZG1CazJ1bXlMZlRjM0dGNDQwR1JkbHg3alRRdWV6eU1xdFpvTXVWNE9XTG93?=
 =?utf-8?B?SW5nOGFDbEdzNjlPUjZhRHI0NVNIUlZRaGhJNXZPK3dmVzltVGg1ZnRINXBJ?=
 =?utf-8?B?d1hJQWRoR3ptSDhvMGJuaE9sNGw3TmJ5c2lKNmQ2Z25HVlZJUTdzbW1Nc042?=
 =?utf-8?B?Q0thYzVkMkhFaVZBWFVlc0NRclNWUmVaNm9VUWxMNXFWaThmYTU5WGFsN2RP?=
 =?utf-8?B?Mk9nSDg5Y2tyNEFiU1VVUnNYaENKRGF1MlNoU0VFcHQwT1drNlVOdVR1VW5T?=
 =?utf-8?Q?wm691fFhwaZ8k2jvUkWCf0SUtxooue862RAofcC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf35de6-7645-46b7-ffdd-08d8eace2791
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 11:57:22.3755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqehHRC2208mF1YJ5R48BY+ybqH6kDL4x7HS9uLU0xJ+wCcsQyPtAPu+/YlMw9/Mpgit5J2gtrqBK8cJeU63XsSYARrioYtbtuivTrlI6u0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2771
X-OriginatorOrg: citrix.com

On 17/03/2021 14:55, Ian Jackson wrote:
> Julien Grall writes ("Re: preparations for 4.13.3"):
>> On 08/03/2021 09:49, Jan Beulich wrote:
>>> All,
>>>
>>> the release is overdue (my apologies). Please point out backports
>>> you find missing from the respective staging branches, but which
>>> you consider relevant.
>>>> Ones that I have queued already, but which hadn't passed the push
>>> gate to master yet when doing a swipe late last week, are
>>>
>>> c6ad5a701b9a crypto: adjust rijndaelEncrypt() prototype for gcc11
>>> 9318fdf757ec x86/shadow: suppress "fast fault path" optimization withou=
t reserved bits
>>> 60c0444fae21 x86/shadow: suppress "fast fault path" optimization when r=
unning virtualized
>> I would like to also consider the following one:
>>
>> 28804c0ce9fd SUPPORT.MD: Clarify the support state for the Arm SMMUv{1,=
=20
>> 2} drivers (4.11+ as updating the security support)
>> 067935804a8e xen/vgic: Implement write to ISPENDR in vGICv{2, 3} (4.13+)
>>      To support newer kernel on stable Xen
>> d81133d45d81 xen/arm: Add workaround for Cortex-A53 erratum #843419 (4.1=
3+)
>> fd7479b9aec2 xen/arm: Add workaround for Cortex-A55 erratum #1530923 (4.=
13+)
>> 5505f5f8e7e8 xen/arm: Add Cortex-A73 erratum 858921 workaround (4.13+)
>> 63b4c9bfb788 xen/arm: mm: Access a PT entry before the table is unmapped=
=20
>> (4.13 only)
>> f6790389613c xen/arm: sched: Ensure the vCPU context is seen before=20
>> vcpu_pause() returns (4.13 only)
>>
>> I have put in parentheses the list of versions targeted.
> My backport list seems to have very few tools patches on it.
>
> If anyone has any tools bugfixes that ought to go into 4.13 please do
> let me know!
>
> Additionally, perhaps this one commit to be backported ?
>   935e0836710ce8cab584155b2844cea8497a5159
>   arm: replace typeof() with __typeof__()

These are general backport requests, not specifically for 4.13

d92ba1aa7cf8 - tools/ocaml: libxb: Harden stub_header_of_string()
59b087e39544 - tools/ocaml: Fix stubs build when OCaml has been compiled
with -safe-string
78686437e949 - tools/ocaml: libxb: Avoid to use String_val() when value
is bytes
2b8079610ec5 - tools/libxc: misc: Mark const the parameter 'keys' of
xc_send_debug_keys()
a6ed77f1e033 - oxenstored: fix ABI breakage introduced in Xen 4.9.0

The penultimate one is an API change, but strictly in a relaxing
direction.=C2=A0 The final one is an ABI change, but fixing a regression.


5e31789634 - tools/ocaml/libs/xb: Do not crash after xenbus is unmapped
2a47797d1f - tools/oxenstored: Trim txhistory on xenbus reconnect
c8b9670825 - tools/oxenstored: Fix quota calculation for mkdir EEXIST
dc8caf214fb - tools/oxenstored: Reject invalid watch paths early
45dee7d92b - tools/oxenstored: mkdir conflicts were sometimes missed


Do we want to backport the -Og fixes so we can get ABI checking working?

~Andrew


