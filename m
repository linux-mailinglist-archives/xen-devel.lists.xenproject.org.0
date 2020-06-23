Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D73204774
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 04:49:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnYzp-0002Ac-JM; Tue, 23 Jun 2020 02:49:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IaA2=AE=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jnYzo-0002AX-6C
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 02:49:12 +0000
X-Inumbo-ID: 1d60e9ab-b4fc-11ea-befc-12813bfff9fa
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d60e9ab-b4fc-11ea-befc-12813bfff9fa;
 Tue, 23 Jun 2020 02:49:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZTO2a3VIQqjuvm27727puXlUNfjlQulEvQH3Y90Qbu3O9niRGfu25TI38Ltd6NTe8LNpQe2m2/nOl41fUKF9PLTa6dIns/ZSGfYi8G0cqyjJ3HTI+gPxUF/q+5ZUOkuemx95Zp07ieq5TFsIhkaFAoQqk00xH9CY7PqgCDo4FcT/R/DvjQjYpgcIG3V8vxc8XooMQrBr0w8+8/HPibsXR3Kmjr2Z+RKPaUpv0Knz0nfpLOQLtOWlAbaoPaPVs6DfQ4kxDwIJs3AmWGX1iOIsH6XioQ1ZrSI+X2iO68mMg5Q1oF1LQUok7514bZYuI7wO2UyxoUW7j9UytAbTs9+xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqNR09fnA/SWiVnyexrL1RD5D2+EU3RfWusK2lD0GkU=;
 b=K+H5IpN1Xd3e9ag3eQGlPugJyQiIdBmoAZo4lU5pHUC894thulHZXUFmBwztB8RmWVKrFy2wjfi8SIY19OLPF9HmrfB/sA9WasCOHPLB8kttEMWgLWc8ct0u4anrSZZlMjw5wuuDMJSewdH59FbMquESvz9RtcTeI+ceC6JPAnESoEQf6BoqBFsfJKUR3KeeeTMIFhK6J7wjyOIWML4jvKsq1cLJkuQZzXRiu5KoSjbipM0fbszeZMyazs5Gmudl2gGrTUzGxJJPyuRFL8EoveOFOPMOcti172WSalVMyC2Qdw3ilmVIjIbt4XeX+N4Fnl+862tRIPGfBXFj7BQN3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqNR09fnA/SWiVnyexrL1RD5D2+EU3RfWusK2lD0GkU=;
 b=P86gxqnTCSzjy/K6O3IbSanttohqSj1mGyw5GCOypSZDdEHBjiG7UWq+HcpIm9wRT/Bob+3EDA8wS2BwVr6NF/XuMFAEBso0NNB1iFVMXe3OQluLmcg6CUvK9JyWMSBUHLgDlrhUiJdDVlueciIcUO1xKzM8WIJMxaXcbW/KzGFkJYgojWlP2G8d8it1EpCkMbq3qpPUZNzHfyP9ebYjdVXgSbmt9juL0OITBQ35Tt7WQsCL1tlFx4lec2Aab5jRYNrAEHqy3Je8Lu/9T/DVrC3hJZU3bSgdiS8w956ipADhT6p7s9NPzt90NHMAp5STh1usHpsAdWgM2/YmIcisfg==
Received: from HE1PR0302MB2699.eurprd03.prod.outlook.com (2603:10a6:3:ee::17)
 by HE1PR0302MB2826.eurprd03.prod.outlook.com (2603:10a6:3:f3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.27; Tue, 23 Jun
 2020 02:49:09 +0000
Received: from HE1PR0302MB2699.eurprd03.prod.outlook.com
 ([fe80::1d03:ee47:b130:ef55]) by HE1PR0302MB2699.eurprd03.prod.outlook.com
 ([fe80::1d03:ee47:b130:ef55%9]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 02:49:09 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/2] optee: allow plain TMEM buffers with NULL address
Thread-Topic: [PATCH v2 2/2] optee: allow plain TMEM buffers with NULL address
Thread-Index: AQHWRom6aQ+ko86LqESb88QJVYc4Lajla6SAgAAZAwA=
Date: Tue, 23 Jun 2020 02:49:08 +0000
Message-ID: <87ftampkd7.fsf@epam.com>
References: <20200619223332.438344-1-volodymyr_babchuk@epam.com>
 <20200619223332.438344-3-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.21.2006221809380.8121@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006221809380.8121@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 26.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 281a4bd4-ac86-45d8-8dfd-08d8172000ac
x-ms-traffictypediagnostic: HE1PR0302MB2826:
x-microsoft-antispam-prvs: <HE1PR0302MB2826CB7985554EB076CCEFCAE6940@HE1PR0302MB2826.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KI8jvVdPoW1gF7Lb43oGHCXaM2XpJiioittT1xaiJo3IfffoHfRbL2hG4ObVo/Jww0K37KLJ0PHdtb4f2MUd6rmU82JyELLjpmjjwBLtqnucg9E361i1bhKgAHBhqnGvqK6eKbfW+/ewoKqFZ2riHeMRdyk7FCj/af27GYSnGEszb5og4scUMIxfUt4Yvx1aK2PgzYQpt2dKGjrQEq7wc21JGlx8QeUHx21VKkYDaGcJL0lhrtJOK2fR04UJcQX4kriWz/hhFzG3rE4vj1i5MmgEW+huA8+obLJKIuIKfie0zY7DLyM2oKrvDy5e4miFOfXsP33XrP0cw5K7LPIWbg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0302MB2699.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(54906003)(478600001)(6486002)(8936002)(5660300002)(6512007)(83380400001)(4326008)(66946007)(6506007)(76116006)(91956017)(6916009)(2906002)(66476007)(66556008)(64756008)(66446008)(26005)(2616005)(316002)(186003)(71200400001)(8676002)(55236004)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 74bVMkMgtAf5+T8X9+/US0f34bq9tOKD/znVzdVh0nQ2R0VDqNhSC4/x2vVupRBYY2lylSE1eYlH9ewzHfPL/a0qR800sb14X/GBYaF2b65eAnqozvf/2Y5txhBkYUixJ0P+2df+SqiK7hc6Ko1pV/UeXRvkyeXYmSWAJDGbzhMwFQNVWF/j+V6WAyhMkle+H0BMIB49wzaKpnAhiSyuM8/WI4q3cw5/j4u+xdhQl7tCm16vURY6PgoAgiY/2FB7ZJWv8Ho2lrl/UQi5pO0sRL/66/4QZlOWjhcxMghyiyLRmU4g0hzfbz2ZyN3/Q4EXSrsQeGhR6Ye+fC3caXE0a9lgqfMohoqAhA5Sl4Bgqy/SN9Ijwpv/cNA+CIc5w5hobZQ2cFK8Cj1TnuYH6WBfYK3dXPb2lpXRHttzGZhk9IX/c/+ECVKDs2i6qpawEwSJss3uwQGA3pmeIaq+E9YqZGXhC6kHnjkP2siFvAs/dsM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281a4bd4-ac86-45d8-8dfd-08d8172000ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 02:49:08.9606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PxmO9NtL2cqwP9blqXZ6thOBoDcBka+p7Pm8+PpwJTrov8+Yatm1QyU46uRr8eYvxuAObXhyfrlTmqFnZSnn/84VLKJ2toM9bAjISL0xTRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2826
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "pdurrant@amazon.com" <pdurrant@amazon.com>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


Hi Stefano,

Stefano Stabellini writes:

> On Fri, 19 Jun 2020, Volodymyr Babchuk wrote:
>> Trusted Applications use popular approach to determine required size
>> of buffer: client provides a memory reference with the NULL pointer to
>> a buffer. This is so called "Null memory reference". TA updates the
>> reference with the required size and returns it back to the
>> client. Then client allocates buffer of needed size and repeats the
>> operation.
>>=20
>> This behavior is described in TEE Client API Specification, paragraph
>> 3.2.5. Memory References.
>>=20
>> OP-TEE represents this null memory reference as a TMEM parameter with
>> buf_ptr =3D 0x0. This is the only case when we should allow TMEM
>> buffer without the OPTEE_MSG_ATTR_NONCONTIG flag. This also the
>> special case for a buffer with OPTEE_MSG_ATTR_NONCONTIG flag.
>>=20
>> This could lead to a potential issue, because IPA 0x0 is a valid
>> address, but OP-TEE will treat it as a special case. So, care should
>> be taken when construction OP-TEE enabled guest to make sure that such
>> guest have no memory at IPA 0x0 and none of its memory is mapped at PA
>> 0x0.
>>=20
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> ---
>>=20
>> Changes from v1:
>>  - Added comment with TODO about possible PA/IPA 0x0 issue
>>  - The same is described in the commit message
>>  - Added check in translate_noncontig() for the NULL ptr buffer
>>=20
>> ---
>>  xen/arch/arm/tee/optee.c | 27 ++++++++++++++++++++++++---
>>  1 file changed, 24 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
>> index 6963238056..70bfef7e5f 100644
>> --- a/xen/arch/arm/tee/optee.c
>> +++ b/xen/arch/arm/tee/optee.c
>> @@ -215,6 +215,15 @@ static bool optee_probe(void)
>>      return true;
>>  }
>> =20
>> +/*
>> + * TODO: There is a potential issue with guests that either have RAM
>> + * at IPA of 0x0 or some of theirs memory is mapped at PA 0x0. This is
>                                ^ their
>
>> + * because PA of 0x0 is considered as NULL pointer by OP-TEE. It will
>> + * not be able to map buffer with such pointer to TA address space, or
>> + * use such buffer for communication with the guest. We either need to
>> + * check that guest have no such mappings or ensure that OP-TEE
>> + * enabled guest will not be created with such mappings.
>> + */
>>  static int optee_domain_init(struct domain *d)
>>  {
>>      struct arm_smccc_res resp;
>> @@ -725,6 +734,15 @@ static int translate_noncontig(struct optee_domain =
*ctx,
>>          uint64_t next_page_data;
>>      } *guest_data, *xen_data;
>> =20
>> +    /*
>> +     * Special case: buffer with buf_ptr =3D=3D 0x0 is considered as NU=
LL
>> +     * pointer by OP-TEE. No translation is needed. This can lead to
>> +     * an issue as IPA 0x0 is a valid address for Xen. See the comment
>> +     * near optee_domain_init()
>> +     */
>> +    if ( !param->u.tmem.buf_ptr )
>> +        return 0;
>
> Given that today it is not possible for this to happen, it could even be
> an ASSERT. But I think I would just return an error, maybe -EINVAL?

Hmm, looks like my comment is somewhat misleading :(

What I mean, is that param->u.tmem.buf_ptr =3D=3D 0 is the normal situation=
.
This is the special case, when OP-TEE treats this buffer as a NULL. So
we are doing nothing there. Thus, "return 0".

But, as Julien pointed out, we can have machine where 0x0 is the valid
memory address and there is a chance, that some guest will use it as a
pointer to buffer.

> Aside from this, and the small grammar issue, everything else looks fine
> to me.
>
> Let's wait for Julien's reply, but if this is the only thing I could fix
> on commit.
>
>
>>      /* Offset of user buffer withing OPTEE_MSG_NONCONTIG_PAGE_SIZE-size=
d page */
>>      offset =3D param->u.tmem.buf_ptr & (OPTEE_MSG_NONCONTIG_PAGE_SIZE -=
 1);
>> =20
>> @@ -865,9 +883,12 @@ static int translate_params(struct optee_domain *ct=
x,
>>              }
>>              else
>>              {
>> -                gdprintk(XENLOG_WARNING, "Guest tries to use old tmem a=
rg\n");
>> -                ret =3D -EINVAL;
>> -                goto out;
>> +                if ( call->xen_arg->params[i].u.tmem.buf_ptr )
>> +                {
>> +                    gdprintk(XENLOG_WARNING, "Guest tries to use old tm=
em arg\n");
>> +                    ret =3D -EINVAL;
>> +                    goto out;
>> +                }
>>              }
>>              break;
>>          case OPTEE_MSG_ATTR_TYPE_NONE:
>> --=20
>> 2.26.2
>>=20


--=20
Volodymyr Babchuk at EPAM=

