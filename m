Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277143BD7A1
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 15:19:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151288.279610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kz9-0005IW-DZ; Tue, 06 Jul 2021 13:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151288.279610; Tue, 06 Jul 2021 13:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kz9-0005FB-9L; Tue, 06 Jul 2021 13:19:35 +0000
Received: by outflank-mailman (input) for mailman id 151288;
 Tue, 06 Jul 2021 13:19:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rBn=L6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0kz7-0005Em-1U
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 13:19:33 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5b85e68-f48a-4949-8ac3-0e7e85cf9f5b;
 Tue, 06 Jul 2021 13:19:31 +0000 (UTC)
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
X-Inumbo-ID: b5b85e68-f48a-4949-8ac3-0e7e85cf9f5b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625577571;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PpMZHbe9Z1WRTkjdoh51QXuYDqQ2KO8OSgVAQPSDXDg=;
  b=DGs92++g8ewKynq4RcQ5XuM2MvOPl321BkiAgOugF1O5piyX3Tdi+l2e
   /jlaf7SLJ/xH45uVXc5oeiCMlk2qsOTWYJ6tUjuDyAAc6yCNeC1gJgB+B
   A+Y0PgJH7rthRoPA5UPVR9OdjDGk6RBX3sffEHzUFlAwtYKdy8sk0sUSc
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: eUajzpOtUVAX3ruXP8kzyTt2WqAKfEvQ6K1KgZinW3skTL0jtbjOowBudh+i2ukfLZdeazxmrz
 Hi5qsDjz8onZc+ELxkcTLWReY/0+IgW07oI7Weuhu04zI/wz1akwAb98KcN5kHaQsKZr+TqHql
 8aztcFzfstEbQz1SI09/A195ZzxzGSljLTuoV6A0mXdDFX/5L89BI0ZNDF32VaRfqr1IQ6Ek1w
 3zrwJTC6Dlzhui/VCKTRyoN5xPohbqGJrwTVaO1glwndm0DDKn3xZtkugbrJ/HScsNyxuJIrn+
 j+c=
X-SBRS: 5.1
X-MesageID: 47647329
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:AcfhPqoAaDrEWEo5wM+ww8gaV5taLNV00zEX/kB9WHVpm5Oj5r
 2TdaUgpGXJYWgqKQodcIi7SeK9qBPnmaKc4eEqTMSftXrdySGVxeBZnNHfKljbcVyDygcz79
 YWT0ETMqyAMbE+t7ez3ODaKad8/DDkytHfuQ629R4EIHAMGscQl3YHe3im+w9NNUB77PICf6
 Z0jfA31QZIDE5nGvhTcUN1KtQryee75K4P6HU9dmcaAIfnt1zYwYITz3Cjr0EjuyAl+9kf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi+AOQw+c1TqAVcBEYfmvrTo1qOag5BIBi9
 /XuSotOMx19jf4Yny1mx3wwAPtuQxetUMKiGXo0EcLk/aJFw7SOPAx176xtSGpvnbIiesMgJ
 6jGVjp46a/QymwyxgVrOK4Gy2C3nDE7kYKoKo2g3tDUY0YctZq3MEiFEE/KvY99XXBiLzPVt
 MeUP01vJxtADCnh3ezhBgM/DSrNU5DeytvRiM5y6io+ikTk3Zjw0QCwssD2n8G6ZImUpFBo/
 /JK6Jyidh1P5YrhI9GdaA8qPGMeyrwqNP3QSCvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93nJ
 jaSltXuWM7ZkqrUKS1rcZ22wGIRH/4USXmy8lY6ZQ8srrgRKDzOSnGTFw1icOvr/gWH8WeUf
 euP5BdBePlMALVaN50Ns3FKt1vwFwlIY4oU/oAKhOzS/PwW8jXX7bgAbjuzZLWYHYZZl8=
X-IronPort-AV: E=Sophos;i="5.83,328,1616472000"; 
   d="scan'208";a="47647329"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBhFfACE4O9sdV5oQSj5BYfuIst3/tbbCJAk++Vqq9tmVlOv8gr37Q2FbRYnIX8sJmcjZt99wjssg21jYOeL+rLO+ZLgJOz9esujo4/Drvf40BnzQbcEMihernaNytKITZfwWw37lOx4VUiWdt4d5B4Qw9poXZcLLEMPuKIfh6PMAzyW9Y+qFHAZNHJLS5DSw5D29D0Glt/9kLbnXBU3iUpdxTGoWOHG5Jdpqf1DVlxmxbu3VCkAjdMzEGboxv9eXimuEpI642D38JbJx9D+6VKU4fYxY/UcAPnpnWFxHEBO+kkjuavuo8eWwZXb5n+wqwnoGrtLyg8zqa3eKtPq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hx9FQ+vn5F955hOh0gDogUnRJixPrGhm4QMBRNQC6ho=;
 b=JcEqZNGp8fFdv8OAzqYiCoE+TouMtCcfplet1CzIKyO+Pwszf3IM7t84Rp1GDQHgLCZv53vVmgyC2ukW1y5PJLGQdZagqGCQcTPB5klcHTgWnn02Q6ozg7kodTQ9vGr0r1C09LgQ6C14TW7i0Q/jAmgTv6mC+01oD+Qx7+qHWMfeArMJt4MMr/fsxGp6BUgP8w1p3jdvSB1jfpc13ISWDl7nfa/sicT8FSb8gtgZTHR2HfNuYVgZE27ANtkNzxfkwALVFPzEbb3GsTeunysHvUDy2WXelP5X7nnkGtP0+NduhUxMYdkEbtC20lyFB7nJMLiAt1j9iey/WU0/cVDpUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hx9FQ+vn5F955hOh0gDogUnRJixPrGhm4QMBRNQC6ho=;
 b=gxV4/RMzoY+BAtWsZ44fiS9Il3dd4mTWVA8KFPnYKV6OE9vSN8oHmb3Qeje9A0FGzyWUiFmBumDIKZkwt3oK5HjEG8Li6jervOIJMwEWqyKPwIfOL4R44OWprfwGb34weneQnO9mi3AGOK6wj+yO4wVfgTvnh/bXKBffwAh/AHI=
To: Olaf Hering <olaf@aepfle.de>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Jan Beulich <JBeulich@suse.com>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
 <20210706112332.31753-3-andrew.cooper3@citrix.com>
 <20210706145804.1ab98f16.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] tools/migration: Fix potential overflow in
 send_checkpoint_dirty_pfn_list()
Message-ID: <902720b3-d71d-82eb-9200-97f2b17dd264@citrix.com>
Date: Tue, 6 Jul 2021 14:19:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706145804.1ab98f16.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 592ec9dc-063f-4ef5-754f-08d94080aeb2
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5744:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5744488540086EFD653851B8BA1B9@SJ0PR03MB5744.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XWXtJgkQ7F2Xj+stjdtDZ2mBSVTkEqZozrWyvpWSIiAW8I9jE4meamPrcS+G49ejYU1iD0s8O2H2V+b3cg0fb48gLHCrVDPLar7TBk3paE4obsoqrXq+JoBb2VYAzWZpbHLIYygnp7Rf1sFAnhnudLRV49PnGjs8lv93GER3gW5dS3n7yjIdzyfcblcv/cGm7EesZiIhATuAf9v13ltelcMR37OnD1OH+09gD4P2e8t6FoWKKhnZIZb7NdFD66ustZR0odtobbs7S5i5yTHXmtJw8y8ydco+9kNZieENyIYS8aPm9dLtX2NzWbLLikZ4xeVN+NG8VTV9JrmxjgOBiguanKor2anpTlDZMOgYPlTOljhG5wYWaZzTktgtZX9msuY0HZn/q4rBL9fVlHUsQtQ0LUAb2rody1h7FSVxIhJuO8q7TOVLdQIo5of+vNImPjXzpeVoHtZe7uhpFVgio3GEAvH8Glznzm93Pwy6Z3JHzGzxCYstWVfPIhjUWl5mg4XeWfGGbJmFM/AjqazbOAog80muZ9uQiQn8QDfysu9KKTQYuyHVUjTJdPqVhRZWZxZZSBfdsrWbE7/2041xgsHQRmjNUMdQWAPlm06RcHi62mP6nal3kdmvCUZJg4emodv2EWm3kFTd6+afa15VwATBQ5VSAG5lZwgvUzOFoSIV0S2UzrTbSCU6xcXQPOwGFUqVSg+V5VvwDeaSgI8CVZt0Ah73U5/97ZiNO/MlrOF6SyFbVVgLT1CA3An7FeWd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(5660300002)(186003)(53546011)(66556008)(478600001)(956004)(31696002)(66476007)(31686004)(316002)(66946007)(16576012)(4326008)(8936002)(54906003)(36756003)(86362001)(38100700002)(2616005)(6486002)(6916009)(2906002)(26005)(6666004)(8676002)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?X1yYAWaRrIUI9vd4lx33kFbPDNEcQVpjbjlG2z/vigOcL36Ldbk0ecAj?=
 =?Windows-1252?Q?pRk5poMseUp05aJ0DQ5YiXMsJWR4DsPMYrNdd9L+jqjws8t521zF3DRo?=
 =?Windows-1252?Q?gqdbWBqY3oLf/pyr5jqgQz8tK7FFEtp+4t2Yy4Inaq9+VBzuNvWnXZ7z?=
 =?Windows-1252?Q?pBpT/VkuLhZOeQ9NF1CvdsF6pLjtGKa6j0n6RaBNmkta4voaWKLpR91R?=
 =?Windows-1252?Q?tqQ8wg4DlNKxQkmZ+w9kjTqIDdcMCaQ/6g7jc/QC+6jSoz7DLv7Osqxd?=
 =?Windows-1252?Q?fp4Kmvo6V75XU/ypHeQtYiyPGh2SsiaZ44Byvke45PvhnhU5rr0gEGZZ?=
 =?Windows-1252?Q?5mtKuuSiJqepmNJbZ72pMAFN+4yDZ+R376aTDvqebIwAaiM/oe32h66Y?=
 =?Windows-1252?Q?ckJh0kxkUN2dUYwlDSLWybekB0HjoI3RU8TWUTQ5nAw1oauJPn0s35t/?=
 =?Windows-1252?Q?c3zpPLFMNiu+OorIA0owFkIJLugfa8gTrOLxgyAva7u99lfutNSy8xfB?=
 =?Windows-1252?Q?HzXScr4xAq1iR1nGUP5l1RGrEw6HlXrdwhWJ+NBxWfLSbUFi6NyGstnS?=
 =?Windows-1252?Q?XsF5lsK9XK1pkkEiQCtmlcfwQOfU0o1/ufHpqalU5Jj0DH/20UGnS9+f?=
 =?Windows-1252?Q?Pv50zOeEqdpVVGAu2a3xKr4B9LmK1P4Ry7o8dAcXdH9uVDnMKJnlK78n?=
 =?Windows-1252?Q?dVyQDRj5uILai4NY5d4Nd438M7RQVq44F+yg2P8jR+KCLWxsywgW3X+s?=
 =?Windows-1252?Q?RIbG0Jv2NLehqzHARVanJjVLrvpdoK1P0+QZTRZzLOFy/Nde9WqbgsJE?=
 =?Windows-1252?Q?axNuYm7r03VeP5mhcNxf3Vx4IckPWW0fljVBBrR37AQyUOKOGoUO1TIq?=
 =?Windows-1252?Q?jv3BWJeFzPF0PF7cj7RicHJmnmNmCuIBKxhN14se7TsFqDE9rqxIVEk9?=
 =?Windows-1252?Q?ksNr9eBur1j+LEzG2V2wfvD5uZvBerDUbl0EDe1uTumQjGHHamEfjfq6?=
 =?Windows-1252?Q?h76SBfvnIaZgIRHmrDVEI0FMlhGehO286+VBWR8XvT09raNZwDXi2xcR?=
 =?Windows-1252?Q?cRm0jUYB+VqpkNJ50vIueRJUPO/HmEnZyT107lp0Maj2hN83aQfC1WwP?=
 =?Windows-1252?Q?q0X1TYQoEFu1ig9mTBuy3R4nuZEHUFwHUvM4L6tg1LiTOcVJhK4pNFl+?=
 =?Windows-1252?Q?JfaZakXQRwWzpo/8gNx4wV3O5Yz3Lxpo4YX33iw7iw1Goj88GJriu8UP?=
 =?Windows-1252?Q?PL+83ysLcuCy9L9C7UMfmBhcf23Dq8zLZX6Kb1zn+hFTdhvWiJhZgfvx?=
 =?Windows-1252?Q?hibsBAi5SVMF47P9Tb0WmN9pCv1HZn6jiZpOCJV5SxiAt8YHtlLmuQMY?=
 =?Windows-1252?Q?cyvZBiI+o/QB3OaGCjjnPvvW+PYnThaWH0a6l6EDrWC7cQplKPUEJp6I?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 592ec9dc-063f-4ef5-754f-08d94080aeb2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 13:19:28.1787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGUjD4TNi8ymJnCQAOsEFa934xo3oN+wfFdejvihG+nt29lGSkJ7SrYu6Qbuw9QLFepaamfidakLL5vD30sR++dQRlZRgxDk3wLoLIcaJPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5744
X-OriginatorOrg: citrix.com

On 06/07/2021 13:58, Olaf Hering wrote:
> Am Tue, 6 Jul 2021 12:23:32 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> +    count =3D stats.dirty_count;
> Is this accurate?

The live loop relies on it, and it worked correctly the last time I
tested it.

> I remember the reporting is broken since a while, and testing a busy domU=
 indicates it is still the case.

If its broken, it needs fixing.

> # xen-logdirty `xl domid domU`
> 0: faults=3D 0 dirty=3D 258050
> 1: faults=3D 0 dirty=3D 257817
> 2: faults=3D 0 dirty=3D 253713
> 3: faults=3D 0 dirty=3D 253197
> 4: faults=3D 0 dirty=3D 255154
> 5: faults=3D 0 dirty=3D 260876
> 6: faults=3D 0 dirty=3D 259083
> 7: faults=3D 0 dirty=3D 253163
> 8: faults=3D 0 dirty=3D 258349
> 9: faults=3D 0 dirty=3D 260330
> 10: faults=3D 0 dirty=3D 259754
> 11: faults=3D 0 dirty=3D 257273
> 12: faults=3D 0 dirty=3D 255756
> 13: faults=3D 0 dirty=3D 258209
> 14: faults=3D 0 dirty=3D 257847
> 15: faults=3D 0 dirty=3D 59639
> 16: faults=3D 0 dirty=3D 81
> 17: faults=3D 0 dirty=3D 86
> 18: faults=3D 0 dirty=3D 111
> 19: faults=3D 0 dirty=3D 81
> 20: faults=3D 0 dirty=3D 80

What is this showing, other than (unsurprisingly) faults doesn't work
for an HVM guest?

~Andrew


