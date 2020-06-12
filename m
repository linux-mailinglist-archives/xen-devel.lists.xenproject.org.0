Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C641F7B7B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 18:14:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjmJ7-0000vF-Fd; Fri, 12 Jun 2020 16:13:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lj+H=7Z=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jjmJ5-0000vA-VG
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 16:13:28 +0000
X-Inumbo-ID: a580d1fc-acc7-11ea-b5eb-12813bfff9fa
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a580d1fc-acc7-11ea-b5eb-12813bfff9fa;
 Fri, 12 Jun 2020 16:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwZR5HWYlrQS5AoCP0jInGfvYtHZZIHY5G9rqQDiJoo=;
 b=D77zEp25ecVdIsoidThdER72i9dQGPoK09HgeHD97I/5WhTbSLyMcnBuIfy1dmTx5qYfODPIVk5Z+4A4AMFA8qAXR5ZKerQZX9NxzA6nfKthvq+Urii5JA27nCwyYLzvriR1LnwNLADq3QX2MT7XfSpypeX+oRkwaLC7crPWLSI=
Received: from AM7PR02CA0021.eurprd02.prod.outlook.com (2603:10a6:20b:100::31)
 by AM0PR08MB3571.eurprd08.prod.outlook.com (2603:10a6:208:d8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 16:13:24 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::2c) by AM7PR02CA0021.outlook.office365.com
 (2603:10a6:20b:100::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Fri, 12 Jun 2020 16:13:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Fri, 12 Jun 2020 16:13:24 +0000
Received: ("Tessian outbound fb809da9b456:v59");
 Fri, 12 Jun 2020 16:13:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 79f39dd9b55dbf46
X-CR-MTA-TID: 64aa7808
Received: from c69eb8c054b9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3B1CB4AD-52DC-4CCA-AEC4-2712EB389F0D.1; 
 Fri, 12 Jun 2020 16:13:19 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c69eb8c054b9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 12 Jun 2020 16:13:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cu+ZHR/ZkOG8SqIfbKANV12ClOZWgo8R78f/t7gzfiXLoFVBBVvtm+zZwLyHLLDC3+REP8rrWLumP04jZWxMf/xl+rHYdNUAR2U2Pj9CYQBYU1Tiwg7XhyE+TSyAMc7CrdAGr3986qwSPXa5r6eRR7BYGw3HBxdB/95h75wM0GG/Wn52f6oTptECeiHHiSYH6vTWGcTSAXP9eJAt3VLatzCx5eZCdPZYhD7x8gxMfTAxW04VkJQji+AvWWsRB/JVzRvRo1ovalB/NKIP3qSNDRvDvMa5mMDGef1yP4coQyqkJrDdG2qfiXqRqvkqg9fpisfgEYTEehWt8vn5f/lGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwZR5HWYlrQS5AoCP0jInGfvYtHZZIHY5G9rqQDiJoo=;
 b=ch2w250esYbr5wkL8W/mldslOYh8D2VG+BtYuCe11uvm1oO/t83sruWUt5m8RJIjwz3ls1FMD1xneruQmTERRDKYWS1uKepSlvygHrIWRrcZp/DoJS2QQZpMgDAJELnRFOkt4MAB5OqQ+8ucEhqjjxXnfodzwYFqsk0X6S+HXw6QNNlSNNaeWVj3SL7S/63yzi3vrEB2Kz9piyltAtaMj7YZq7Q73XPxGyTpuQxtDp63nf9ZEMLF8xa0mq/0DqzVsS9+43PlWFqIMiuNzsngaYpzvQBHlvxu52SgC4TRm7oSR8qjlWG8RJgYBxYBdtqkKhdROJFd3OQ0f5ynq2CqBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwZR5HWYlrQS5AoCP0jInGfvYtHZZIHY5G9rqQDiJoo=;
 b=D77zEp25ecVdIsoidThdER72i9dQGPoK09HgeHD97I/5WhTbSLyMcnBuIfy1dmTx5qYfODPIVk5Z+4A4AMFA8qAXR5ZKerQZX9NxzA6nfKthvq+Urii5JA27nCwyYLzvriR1LnwNLADq3QX2MT7XfSpypeX+oRkwaLC7crPWLSI=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3307.eurprd08.prod.outlook.com (2603:10a6:5:1b::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.23; Fri, 12 Jun
 2020 16:13:17 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 16:13:17 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 2/2] xen/arm: Support runstate crossing pages
Thread-Topic: [PATCH 2/2] xen/arm: Support runstate crossing pages
Thread-Index: AQHWP+e8ujbYpkw47EG7vPpL5OIUa6jU5lsAgABClwA=
Date: Fri, 12 Jun 2020 16:13:17 +0000
Message-ID: <6FC8B7BD-8CCF-4CC6-8761-0062BC67DAE7@arm.com>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <b4843bd234d4ece4f843bc636071106746abb3b5.1591806713.git.bertrand.marquis@arm.com>
 <0ea51410-050b-58a6-806a-b175f534852f@xen.org>
In-Reply-To: <0ea51410-050b-58a6-806a-b175f534852f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 899ffed3-3180-4f5b-a1c6-08d80eeb88c2
x-ms-traffictypediagnostic: DB7PR08MB3307:|AM0PR08MB3571:
X-Microsoft-Antispam-PRVS: <AM0PR08MB35718EA6B16B06133DCE59459D810@AM0PR08MB3571.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: gU0rsRz63l7+g9b7SK5Udm3vjMzGsuTSAlU69y5iQsTE3oQlA/EqCDfv5PXSth/E430E4DGjyeXzNzuxuiQ+w/IbQFro1oFB68ZgK/+3os1GEIhLARDEUUxlfyMh7ZeirCv+K3TDDTSPv3gdYV3mdIZCy9uPC7GHwa1r6TTrjlqK62YGr1hAkLVeVlVz/C03SmY9VRA7rLMawvSAUO0Ysdm0QQ2Qo0UysnzQuNxn4DuY9+Y8IOgYm+4RQVyZ77u9x+TAvKsELRXP2Nd21hTNosVLKX76sCFVMQMG1vwlvVIKNbq4N3LzZZTVS9lIUGK1
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(64756008)(66476007)(66556008)(8676002)(316002)(6916009)(8936002)(4326008)(71200400001)(6506007)(76116006)(186003)(66946007)(26005)(478600001)(91956017)(2906002)(53546011)(86362001)(66446008)(54906003)(36756003)(33656002)(2616005)(83380400001)(6512007)(6486002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: xDy0tcfl9PUMs8tuIg/AOGCJWHkNNCbcPIPVPAma4nc58OW+0WaQgpP8GV3up6qTzmfh2Z0HREo6rDFC7acjFn7i5ax0N04Vgxy2qhM/hUbDkvF3ZW4g1Bp+LoCimmxGyr12xRaDqg8YhP1VpFHUlxQRijM7R9BYjJ9LZff0ozMGB+gDuxHag/aGBEBLWNYOzmy1HDxQImC4dRd9hJnqK1IqHLQqxvemA1vyfhBomNexuydjt0040Yn2ylVhziVS0/kHyjGBYI4lb3o3wICQA7/PyUaamu3KFsuEEW6xDI/b8cVXniO2mD5UUoxEWGoQLCm6dEWKHdCmzXqE8YBjE3VQhF/9+BXdDR8d7ys3cgc1XWviWHYWGpq5SigcmDoUkDUddJQA1PhHmrCkcxsrHPKX9l7pqnVYWoVYWPKGdLvhuwIf+ud7EqDdbLjnhVspmPE3JjfaiDlhtSHnswzazvg1pzk9oncbg72A56QvZpuFUiX8LPJrdTijcfVVJn08
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3FAA6B0D7E0DBC4FB4695CB3D1AE8009@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3307
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966005)(86362001)(2906002)(6512007)(6486002)(478600001)(356005)(53546011)(33656002)(70206006)(83380400001)(70586007)(6862004)(6506007)(316002)(8676002)(36906005)(47076004)(82310400002)(2616005)(107886003)(26005)(336012)(4326008)(186003)(5660300002)(54906003)(81166007)(36756003)(8936002)(82740400003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: dd5d3ef1-aaad-4553-a4f8-08d80eeb8471
X-Forefront-PRVS: 0432A04947
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nhExfqhnBuga+NL/QEkCmyRyp4E2dVA2sHEWWTY9DG3Hs8DVUhWAS0mZpM2v6KE2xYQ1OMHpcqRz/Cq6TVd2o4RIny9ucPhD1RP9sJgCSYsDQedk1mmdXB9ADuHn69U1XgnTrfLkR4YhwX3pUOeYyhrdatuvEggFnnxlL1InjOKjfwqIJiXJvgKI3VbS7bmR56NuubwYzFDKUcz7oaCaGzxF8eyFlgrJpg0pMCaegyHByW7ls6h1P4IVQ781uczzy1zqiCptkM07XT9fT0LYmnf62BkshLIH91Wp0InR0F2Uqb5c2upxVenhArdFTsEIOKyVckL1TNvdWzEAleeMbJxrxGq70hV3nZyP9qNNaADTerMFgmnNKH8p7FGbMexN7F1dSTDXeNeqlbWsj283mg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 16:13:24.6905 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 899ffed3-3180-4f5b-a1c6-08d80eeb88c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3571
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

> On 12 Jun 2020, at 13:14, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 11/06/2020 12:58, Bertrand Marquis wrote:
>> Add support for runstate area register with the structure crossing pages
>=20
> Well, this has always been supported until your previous patch. In genera=
l, we try to not break thing in a middle of the series so we can still bise=
ct it.
>=20
> I think this patch can be simplified a lot by mapping the two page contig=
uously (see my previous answer). With that it would be feasible to fold thi=
s patch in #1.

I will dig into switching to something using vmap.
Worst case scenario we would consume 8k * 128 vCPU which is still 1M but sh=
ould be acceptable as it could simplify greatly the code.

>=20
>> The code is storing up to 2 pages reference during the hypercall.
>> During a context switch, the code is computing where the
>> state_entry_time is and is breaking the memcpy in 2 parts when it is
>> required.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>  xen/arch/arm/domain.c        | 101 +++++++++++++++++++++++++----------
>>  xen/include/asm-arm/domain.h |   5 +-
>>  2 files changed, 76 insertions(+), 30 deletions(-)
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 739059234f..d847cb00f2 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -280,11 +280,16 @@ void arch_cleanup_runstate_guest(struct vcpu *v)
>>  {
>>      spin_lock(&v->arch.runstate_guest.lock);
>>  -    /* cleanup previous page if any */
>> -    if ( v->arch.runstate_guest.page )
>> +    /* cleanup previous pages if any */
>> +    if ( v->arch.runstate_guest.page[0] )
>>      {
>> -        put_page_and_type(v->arch.runstate_guest.page);
>> -        v->arch.runstate_guest.page =3D NULL;
>> +        put_page_and_type(v->arch.runstate_guest.page[0]);
>> +        v->arch.runstate_guest.page[0] =3D NULL;
>> +        if ( v->arch.runstate_guest.page[1] )
>> +        {
>> +            put_page_and_type(v->arch.runstate_guest.page[1]);
>> +            v->arch.runstate_guest.page[1] =3D NULL;
>> +        }
>=20
> I think this can be moved outside of the first if.
Agree

>=20
>>          v->arch.runstate_guest.offset =3D 0;
>>      }
>>  @@ -294,26 +299,25 @@ void arch_cleanup_runstate_guest(struct vcpu *v)
>>  int arch_setup_runstate_guest(struct vcpu *v,
>>                              struct vcpu_register_runstate_memory_area a=
rea)
>>  {
>> -    struct page_info *page;
>> +    struct page_info *page[2] =3D {NULL,NULL};
>=20
> I don't think you need the temporary variable. You can directly update pa=
ge[0] as it is protected by the lock. The nice benefits is you could take a=
dvantage of a common helper to cleanup and reduce the complexity of the cod=
e.

Would make sense yes (and remove the unlock everywhere).
I will try that, thanks for the hint.

>=20
>>      unsigned offset;
>>        spin_lock(&v->arch.runstate_guest.lock);
>>  -    /* cleanup previous page if any */
>> -    if ( v->arch.runstate_guest.page )
>> +    /* cleanup previous pages if any */
>> +    if ( v->arch.runstate_guest.page[0] )
>>      {
>> -        put_page_and_type(v->arch.runstate_guest.page);
>> -        v->arch.runstate_guest.page =3D NULL;
>> +        put_page_and_type(v->arch.runstate_guest.page[0]);
>> +        v->arch.runstate_guest.page[0] =3D NULL;
>> +        if ( v->arch.runstate_guest.page[1] )
>> +        {
>> +            put_page_and_type(v->arch.runstate_guest.page[1]);
>> +            v->arch.runstate_guest.page[1] =3D NULL;
>> +        }
>>          v->arch.runstate_guest.offset =3D 0;
>>      }
>>        offset =3D ((vaddr_t)area.addr.v) & ~PAGE_MASK;
>> -    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
>> -    {
>> -        spin_unlock(&v->arch.runstate_guest.lock);
>> -        gprintk(XENLOG_DEBUG, "Runstate is crossing pages\n");
>> -        return -EINVAL;
>> -    }
>>        /* provided address must be aligned to a 64bit */
>>      if ( offset % alignof(struct vcpu_runstate_info) )
>> @@ -323,15 +327,30 @@ int arch_setup_runstate_guest(struct vcpu *v,
>>          return -EINVAL;
>>      }
>>  -    page =3D get_page_from_gva(v, (vaddr_t)area.addr.v, GV2M_WRITE);
>> -    if ( !page )
>> +    page[0] =3D get_page_from_gva(v, (vaddr_t)area.addr.v, GV2M_WRITE);
>> +    if ( !page[0] )
>>      {
>>          spin_unlock(&v->arch.runstate_guest.lock);
>>          gprintk(XENLOG_DEBUG, "Runstate pointer is not mapped\n");
>>          return -EINVAL;
>>      }
>>  -    v->arch.runstate_guest.page =3D page;
>> +    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
>> +    {
>> +        /* guest area is crossing pages */
>> +        page[1] =3D get_page_from_gva(v, (vaddr_t)area.addr.v + PAGE_SI=
ZE,
>> +                                        GV2M_WRITE);
>> +        if ( !page[1] )
>> +        {
>> +            put_page_and_type(v->arch.runstate_guest.page[0]);
> v->arch.runstate_guest.page[0] would be NULL as you set it afterwards. So=
 you want to set v->arch.runstate_guest.page[0] beforehand.

Nice catch, should have been page[0] alone.

Thanks
Bertrand


