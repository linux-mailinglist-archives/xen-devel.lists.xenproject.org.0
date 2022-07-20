Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E350A57BDFC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 20:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372147.603988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEfx-0002tG-GW; Wed, 20 Jul 2022 18:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372147.603988; Wed, 20 Jul 2022 18:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEfx-0002qp-DR; Wed, 20 Jul 2022 18:44:01 +0000
Received: by outflank-mailman (input) for mailman id 372147;
 Wed, 20 Jul 2022 18:44:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dsmp=XZ=epam.com=prvs=920039d723=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oEEfw-0002qj-31
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 18:44:00 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e95a0f26-085b-11ed-924f-1f966e50362f;
 Wed, 20 Jul 2022 20:43:58 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KGrH79003649;
 Wed, 20 Jul 2022 18:43:46 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3hekbv8ubd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jul 2022 18:43:46 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PR2PR03MB5147.eurprd03.prod.outlook.com (2603:10a6:101:23::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Wed, 20 Jul
 2022 18:43:41 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::3db3:dad:7bd7:4488]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::3db3:dad:7bd7:4488%7]) with mapi id 15.20.5417.035; Wed, 20 Jul 2022
 18:43:41 +0000
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
X-Inumbo-ID: e95a0f26-085b-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErM32AbG+hCWIw+QnpU1c142uOuXjTkbIhaipYZWw9o7Cx0NHEC6FJlMK1A7c5959mayFHv07bPWG3/MdhgsJXF2xtTpwCyhWfZEPCHmV2TOD9yXgOALeRGUoGz0TIa34iLv6H1SWovmGtUpDm6b702RRakiNwCON0Vt3XYkjYevtPKwp9+ydjSsgKhalgbKRxM0DFgPTPDnvFSYVZBZqlWgHEm8R+Q4570StvUmToDLvWfM4GGkVQUkwzhptbN3FP9nk3YmGLIpkGa8A2tXvLUNLF53FAVraeyNtxMEvFaZQC0bORM7kU0PAKo00yTDjRtXajw0m1bciZrWUTlkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZdKd5ovZyiwO036SsIMsoGHufaPZnO4eryczz+BMfI=;
 b=deKkMGrYbxHumPIbciS9bQWuYHvI0N4eG5U9QJLKo9HlVUujgHKwmOPMV0BOWBTGTUn6zAduc8vs7IqIaTAma7+5H3ydtYneM4BKj2dOYJFKL3naY5W9r/v2VGKGsmH9JitfAmNKOmD49SIobjZLGHFw4NwIAA9mzAzHlSga7r1r6b3yfsfK3iwOfvc3vXVJUgRkeCf0N6nEp6uyj7UN6LfqjYe1XlMv9BYt+/Hqpzt/bJQKJsjQT8lZQ7ciRutLnFy+RW32MFj6sBpc8pS890RZmVciU8U23tjqOL1gnhTThggzhXJ2JJtVG5/JRrR5KkRii2RjUQatwFqfs1qvhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZdKd5ovZyiwO036SsIMsoGHufaPZnO4eryczz+BMfI=;
 b=JsZL8ltX5uZ+91QE9GzXFFkqE2l4cFhfSeIzBVUO98gO2i1u9iGnkSXvKW5LPX84foHW0yht7Z+26DXVFeyQ9BwtIhVTfmQXv6yUj7zd8DUNjl8kiFRO6l59SWr0wuyCat5+T/8UDa7uCmEyFmgBD8n0Fe1X+6auGTCSl563Pc2FtEV9HmsUEiUsCvrasdBABcBGlOBBhKyYzi3TvQrlQsMktjkkMw6dGtZbOYiULnQMFPAGPs/crVbJM6gfWSC8qagHmuWdvWe2sEag6bZAegTFHXPBgkVi46b1nEp7HLnvixcMZSYyIYb2tJSYVZpiwTxaZIg5FCNFaiKO2tCk+g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Wei Chen <Wei.Chen@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Jan Beulich
	<jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v2 1/4] pci: add rwlock to pcidevs_lock machinery
Thread-Topic: [PATCH v2 1/4] pci: add rwlock to pcidevs_lock machinery
Thread-Index: AQHYmuuJlTOCfCU2VEeylMdGd6xTk62FOW4AgAJgrAA=
Date: Wed, 20 Jul 2022 18:43:41 +0000
Message-ID: <87bktjhbfo.fsf@epam.com>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
 <20220718211521.664729-2-volodymyr_babchuk@epam.com>
 <0f8da611-0825-91ca-b1eb-dfbe0fb709f1@arm.com>
In-Reply-To: <0f8da611-0825-91ca-b1eb-dfbe0fb709f1@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 28.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b427399-cd89-4523-ec2a-08da6a7fc437
x-ms-traffictypediagnostic: PR2PR03MB5147:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cDofurihTfjixs2mj3z/AA6zQFZfRbCl8j9M1N/GNb018Ni+IJ1ck468LwW0XSNxQW+UwtNqnVJILC6Y5/lVX20YcWpP6ZtWds75sPvu9RVXC4Tom6cHTA7SXJJ0EHGwuOO9ZjOjdCY13ckPmZmPdwNe5JEPDaoGkXesrO/4rcQQBtHxw+FUBslNr9QS89I17zCQKfmG6rUxnFO5mKZhiCD12OPnV9NZtD0bhoBJv4W56kFYbn0HwC3YLASipEW+E9NYapFbbKTjjEsuDnPzrKCSGT7VF7BSb+LpCd2LmNVWttxZVBAeJ3SS/CWkG/lAQCHa6Zoe91IOI59FyoElwdMtG6yKBT4SwfWfenuuc8dQ7aAZl48RWwsqn7/mZdNgbk+iyxlUddfHFxn8DNiFm+bkJ1FApcMk2G/CRL0EI+nRfln23MjN50J6xUbi0MmH9aGH7A7okFDHSc6R835/xV9z9XiiB2past3RHhg3jJfEqA8yPxTEFeFa8HUa252GRhUD4C6TVByKUb6yDNAJWzIxKEFS6pMOuFgteFwO8IVwQCRzATC0S13jMG96h7HX8cv/3f3t9itoZ4+eeAihrquZmjDbFfyFKydnCzvDBHaGx9DXePWc01GX4QF3GiyJFrXOyZ9gRmCcBlpVI6oAFyA9dZKUjqToJpgcnmQ2MK8qAib6PHxUjRMeTFXXMe+eyvSmGizLBvv/qAdqs9iZ/jq1XmTPjrGkzwCFyv1X/49af6WHZKtgHdspW/+wF7X+/p9gcPxQHA3DYZdcPWaJbnOZxYkuTvRKSNqGHGgtdRlQH8oB6SB5JHjYfnHGNXcmxrs+7kixXhoYxxGt+UpQyA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(36756003)(66556008)(122000001)(6916009)(86362001)(91956017)(66946007)(38100700002)(76116006)(66476007)(66446008)(64756008)(8676002)(54906003)(38070700005)(316002)(71200400001)(4326008)(8936002)(41300700001)(2906002)(2616005)(6512007)(55236004)(186003)(478600001)(26005)(7416002)(5660300002)(53546011)(6486002)(6506007)(83380400001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?KsqQrdxqQiheN+dQb8lzX2vkGWMymty3cPThP4oqU1tsew3rcntXug3dHl?=
 =?iso-8859-1?Q?vJAXGHB57D3Ydmm8RjPpoVwTh24XBefbQoxAc7CrnfkDCt5LT22/BZBSME?=
 =?iso-8859-1?Q?ObekOwWW3mWEKm8WtKI3dUAeO4u92wVP+cLYQlFxL1P1K02mFPeoBzalYf?=
 =?iso-8859-1?Q?lISLnnd9u5/nh6IPqih4/dedP4KoJN6aIIK2wXgJGaByCIK9B23V4L9GbF?=
 =?iso-8859-1?Q?YTVfdvhJD+kzt3OrMPrOjC1KOFgjYIPEduQ5zUvdWI9n+7m5XFUwaAXDl+?=
 =?iso-8859-1?Q?4tm5qymW7bEEIIX8Kh5rQDmseLNNKEUrcPkJAa2Nq46eEM2O6k0TAzws7D?=
 =?iso-8859-1?Q?LTtKepZD27M4BknbwnWnWyW6Nq0lx2xUErQ6t8WP8I5brLjqplGCX43lXD?=
 =?iso-8859-1?Q?8tHmGSuKTiX0UAKg2or/6+e57jES2EoQYCgw+PGOHiJ3rNWUz+E2Ltc3ND?=
 =?iso-8859-1?Q?hlDpiyuyCEA4sBKYIAjBDAK8HjBLdUzyEp67C5JsPHtAPL1AkcBnyY0icv?=
 =?iso-8859-1?Q?E21UV81ePF3ex4diLk6rjcVHJvO+Sfasoy+PpHNvriIZlov06UnX7l6WER?=
 =?iso-8859-1?Q?MgL6olqdGxkxNXCeVPRBKyvWtZ+x7uMONkuHQShzWswqIFR6m3Cyti4m74?=
 =?iso-8859-1?Q?LlN9doluXr0idPui1Yl1+dWTvZG6mECkGXq8xXGN89UBA7RRITlK4s5u5z?=
 =?iso-8859-1?Q?3KKqkh9un/EHqKdeABIsEumq1+G17spv/VntUc2xKqTBHJUJR3xQohkR6d?=
 =?iso-8859-1?Q?iqVj6AJvHO4KLfLW0f25cwOAGnPnsHNAc+jLHoIMDizQ0Zhvc4Js/Sv0jm?=
 =?iso-8859-1?Q?pQ5VSnk1emSotZzGzomyJh2ZrctUDmsxsAjbntaSxBSAyf/IIQZ24RUdNi?=
 =?iso-8859-1?Q?Ml/Lb4O8x5vcdQlIR2XXTDvDwN9G298ZusQLTtgVVwd26Y/xrJuWJ7d9eJ?=
 =?iso-8859-1?Q?manDxPTmKLtdBNmVL/JP1PY8T1aEIMT+LoYwS0qOow/eQ+i8XlgmzV0931?=
 =?iso-8859-1?Q?mMtwC7qqqqQUtZdMbv7q3l37X9vdS/JWVHaDYpS78TYKxHBwX9Aj1qE+e1?=
 =?iso-8859-1?Q?fBM0hICZkv5m9Hcbd3n2kcFMFEmlnwv24XtnCvQiPe7SbvuhJqXyz/7pkk?=
 =?iso-8859-1?Q?g+n+b6ppBgEWKcLaHKT2jQ6TVxpjatGYK4ZE/lEn7RF3k+zP9PWKmXXcOE?=
 =?iso-8859-1?Q?CTvjYORG/8IHQl4tSr3PNZSv1YsO+3mgVIJ3gEv//2i0lesIDEjt0AP2iw?=
 =?iso-8859-1?Q?eh7wa8kIWb/SEwrbWizbXk7cE6ZmPL5UVzYRXSDi3eyxyHwZ3caLERWt6P?=
 =?iso-8859-1?Q?XxEsGZZFESmS3/W2XrLz8A60Vl94IGVaL5kEdj5wHh21yQlIpH9MzmDMOO?=
 =?iso-8859-1?Q?ZM3MrwJy11EjHtLQSWJUtu7OeCA7XfMq2YAYNmQjmprBgCx6k9eBp9Dagq?=
 =?iso-8859-1?Q?4tXUiBdG24cXdQmsIZorZIj+oCH3QoarxsEw/OJ3En8FRuDAvhhUwMHcDU?=
 =?iso-8859-1?Q?R+zFszkxZtng+H3gbBBaNOPOkkL1k71poWxm6ShkDTq/dYi1gcSnBVs6tx?=
 =?iso-8859-1?Q?2YniS5HzhCYGk7lum99fCpqwuP9pojuguazLYTNbHkRhVY+huDc6G8Gg2f?=
 =?iso-8859-1?Q?xR07aavzUM6QElWEr0RbhV5i8urRRk7iX7DmZNn6eKaw9W7c2pXQoG0g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b427399-cd89-4523-ec2a-08da6a7fc437
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 18:43:41.1580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VFG9HwMf/oggzCQSml3cZccNNRG6JFah9GD6c3U/ZsdZ/we+AVigIAGHJvOJ2tz60NLMpBLyHJAOOg9K70XzmJrQr07rgbx+Vrh8Uode5f8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5147
X-Proofpoint-GUID: uJqhKfQZfu-vxRuUJU57fyJ6Q4yc5o_s
X-Proofpoint-ORIG-GUID: uJqhKfQZfu-vxRuUJU57fyJ6Q4yc5o_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_12,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207200076


Hello Wei,

Wei Chen <Wei.Chen@arm.com> writes:

> Hi Volodymyr,
>
> On 2022/7/19 5:15, Volodymyr Babchuk wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>
>>         if ( !use_msi )
>>           return -EOPNOTSUPP;
>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci=
.c
>> index 938821e593..f93922acc8 100644
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -50,21 +50,74 @@ struct pci_seg {
>>       } bus2bridge[MAX_BUSES];
>>   };
>>   -static spinlock_t _pcidevs_lock =3D SPIN_LOCK_UNLOCKED;
>> +static DEFINE_RWLOCK(_pcidevs_rwlock);
>> +static DEFINE_PER_CPU(unsigned int, pcidevs_read_cnt);
>> +static DEFINE_PER_CPU(unsigned int, pcidevs_write_cnt);
>>     void pcidevs_lock(void)
>>   {
>> -    spin_lock_recursive(&_pcidevs_lock);
>> +    pcidevs_write_lock();
>>   }
>>     void pcidevs_unlock(void)
>>   {
>> -    spin_unlock_recursive(&_pcidevs_lock);
>> +    pcidevs_write_unlock();
>>   }
>>   -bool_t pcidevs_locked(void)
>> +bool pcidevs_locked(void)
>>   {
>> -    return !!spin_is_locked(&_pcidevs_lock);
>> +    return pcidevs_write_locked();
>> +}
>> +
>> +void pcidevs_read_lock(void)
>> +{
>> +    if ( this_cpu(pcidevs_read_cnt)++ =3D=3D 0 )
>> +        read_lock(&_pcidevs_rwlock);
>> +}
>> +
>
> For my understanding, if pcidevs_read_cnt > 0, pcidevs_read_lock
> will be unblocked.I am not sure if this behavior is consistent with
> the original lock? According to my understanding, the original
> spinlock should be blocked all the time, if the lock is not
> acquired. Maybe

Original spinlock was recursive one. As read-write locks are
non-recursive in Xen, we need to implement some other mechanism to
support recursion. This code ensures that pCPU will not dead-lock itself
if it'll call pcidevs_read_lock() twice. Per-CPU counter ensures that
read_unlock() will be called only when pcidevs_read_unlock() calls is
balanced with pcidevs_read_lock()s.

> I have misunderstanding something, I am not very familiar with PCI
> subsystem.
>
> Cheers,
> Wei Chen

[...]

--=20
Volodymyr Babchuk at EPAM=

