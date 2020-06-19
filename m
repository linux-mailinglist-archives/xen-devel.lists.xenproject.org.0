Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA5F2005C5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 11:53:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmDhZ-0005bO-0g; Fri, 19 Jun 2020 09:52:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bIi=AA=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jmDhY-0005bJ-CH
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 09:52:48 +0000
X-Inumbo-ID: a0d176fc-b212-11ea-b7bb-bc764e2007e4
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0d176fc-b212-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 09:52:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W38mVwoQgw6tlH2M9eISPcmDD8zzMh1+K3aEPRWODi5lN3WhbHj1FbiJH2hI9hDK/WIevVp2pCG0u77GYiwVh4dH1rbi7U/aOdhE9qHPymmKXBO0p6SGKaQa8uOQzvZfpx4DeCxU3pq3eIbpiRpsp1okDRb4ATTMOi9v0UMchQkT+8PHmWT+c8TpDig1PzDyL/dGdhz0JBAXnE5sYOTDUXik7fywXPOT1wCRsiGmOS3X6/z3XHJzMqxCqebH8Kx8aQNM3ivOR2so1LdIFo3r7kBJLriWM9FCcZaufDoZsrFZ4rjhtEw57IaxD0tDwBkWxP35wTiVK0oWpa1ngb36xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSAIFLl/JBZVYKwQ11W2i/ROCM2BixfB8A+9m3RJ5+8=;
 b=HrhTySdye83u1NJuUIszlgs/dcSaG30Cw8wdX1dTiIXzIyoXpffSmLE+1NC8ASJ/0jIimkH5ixAqgyppQwciaaCVm8ZGV49SHAwZhIjt/k3+t2TidAhbcaf+aTGIm8TG4B1EKe2ROU+JKF/AxjSoLBlcXWTcBwWu2LNsgxAgndyWPNHSPL4odsH0iFHML8sta2LUIIwGHT5IRZhxItwboEPYjVn9mQhEsT2fTxDlAqPJ1MrivxStaw308qEiPq+lDzseBYScJYAmVsnOPcjGrMIw89ZF08HTy0gpF9k5T5RSv0k2QWJnAsUNrN+584atTPwK7GQN+heNRFiqo1jjKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSAIFLl/JBZVYKwQ11W2i/ROCM2BixfB8A+9m3RJ5+8=;
 b=Xyq4fYGNAmBI/D2DxYdX8mDk3t7lnwpCh+EDZYs0z8JUxXyECS4q1dX3IqvA1oYbZrxkbQo6fX0OEdJhMHDsjqUbf1I4JY0Z8W9DqhYYKvES9LJCmpJitTg0oj7/2MtzisTiCQMSejhN3fIbjfjzAUmAVrbqsCEdcnG9/oR63mifb59TBdrZdjoho/Su5M0yIGkuhn4c3tky7dk6ORchEgDttuJOwYI2YrAo0nnmxYoVAgN+eCPbHfrU8BN9LvEIGHEW+FpXUr/n7IMjykK0JGL8xKXzrlYl57i4hnIp9wRYo+wdGJeeoebvdu8tqq53GiGZMXhh2qS/FMM+hWJT4Q==
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com (2603:10a6:802:35::28)
 by VI1PR03MB5023.eurprd03.prod.outlook.com (2603:10a6:803:c4::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Fri, 19 Jun
 2020 09:52:45 +0000
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37]) by VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37%7]) with mapi id 15.20.3109.023; Fri, 19 Jun 2020
 09:52:45 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: optee: allow plain TMEM buffers with NULL address
Thread-Topic: [PATCH] xen/arm: optee: allow plain TMEM buffers with NULL
 address
Thread-Index: AQHWLLcTxhZtogukPEOG78aedSZTLajL0lyAgBNkugCAAKX1gIAACEgA
Date: Fri, 19 Jun 2020 09:52:45 +0000
Message-ID: <87h7v71ixf.fsf@epam.com>
References: <2a32c7c2048333169c9378194d6a435e2e7ed2d7.camel@epam.com>
 <1b596a11-95b5-3e87-bbf5-c0c4dceb6489@xen.org> <878sgk2bst.fsf@epam.com>
 <8d2f3475-4191-fa80-f476-e72af73e0559@xen.org>
In-Reply-To: <8d2f3475-4191-fa80-f476-e72af73e0559@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 26.3
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a02c990-516f-4b71-cf56-08d81436846d
x-ms-traffictypediagnostic: VI1PR03MB5023:
x-microsoft-antispam-prvs: <VI1PR03MB5023A80C8DFD9EFBA27B6FB0E6980@VI1PR03MB5023.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qwLUBnet2SRaUr+IqS7AoMgldV6RdpR1/ofP19qWg4VUp6Qs+sKtrisgV7zz9yDrPflOQJVF+sFfN9hKbIPmaf31vHbnPv0miobIbUXcfVW5lDlB/livBMI6G//hNvfZZt1w9Cbfix2VedtZ4BWjtkxP4dkYZ4qz2embBhRTw7hAlDRThBFw8L4UIIbxl+9EdAbLzjsePZ1SnzvY298KCFgWU4jFgcHrQTxcDZcfNFS67N5Z7ExUeGRS+nJiFLq34Li/PLb4QAyqS3NT9Dai1iDI45KxoJToNR6vAUxj4RX/Z7q0hqKKHUk0w2VRL49xQRxslQQjU5E1u2jU8jdTQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB2926.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(478600001)(76116006)(91956017)(66946007)(66476007)(6916009)(2616005)(36756003)(8676002)(86362001)(66446008)(64756008)(66556008)(71200400001)(8936002)(83380400001)(26005)(316002)(186003)(6486002)(55236004)(6506007)(53546011)(2906002)(5660300002)(6512007)(4326008)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: u3BK5SjlxmiETqjUPna0dUVXUYeDxAUkMQJPPsdfNGqAMIvpgjcimCS6uXKYyyGChq8BVc/nia97/5DoeIOevC6lwkJyZVFGXem3J+VR2Iojv1Um4k7hVvupCDqsKwzpaNrUU7psRBVKyMI8ULKzAy6QZK15LD89LYlBdzZOU7nSDnOISpYJvBNZ9o+bs7+fEs7TiiqmaavbQMRdtZtOZ+cDSGiTNTzHwzeBA5BkJhQOLvu8d5B32PHZJMkRHcigodOjosZ8y9bPlB/lD8VEMP3F6/xR89Ve4J9ZbUm4VVqu6Sin4KBrD2dTUhuKBUv2cCyGE9zr3UDzf7gd5MBXlFtwELVLcyOfBeghexNWZ2BhMnRvwXMdy8JzZRVOeUwmAJJKvvao8tG/f0qqRSgrF3IbfHb8wZ7AMxssYJj1VVJJ8pO0669xYW/IVSKvqhFBGyDJR4+W68xxAOG4H97x/uZIYhH4W/7wutUop/uVdLw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a02c990-516f-4b71-cf56-08d81436846d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 09:52:45.5013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zwO+Fq8k7nTxx/ua6AOmw6cPPzqNL8UNf9KOefaX0GoYMkVj59Gip9iW20yqcGCBr8zDWPKkKCLvjsIBFU7pf/ykDGmGPSLo+2aWbNjwyvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB5023
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
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


Julien Grall writes:

> On 19/06/2020 00:29, Volodymyr Babchuk wrote:
>>
>> Hi Julien,
>
> Hi Volodymyr,
>
>>
>> Julien Grall writes:
>>
>>> (+Paul)
>>>
>>> Hi,
>>>
>>> On 18/05/2020 02:53, Volodymyr Babchuk wrote:
>>>> Trusted Applications use popular approach to determine required size
>>>> of buffer: client provides a memory reference with the NULL pointer to
>>>> a buffer. This is so called "Null memory reference".  TA updates the
>>>
>>> NIT: You use double space after '.' here but all the others use a
>>> single space.
>>
>> Oops, missed that.
>>
>>>> reference with the required size and returns it back to client. Then
>>>> client allocates buffer of needed size and repeats the operation.
>>>>
>>>> This behavior is described in TEE Client API Specification, paragraph
>>>> 3.2.5. Memory References.
>>>
>>>  From the spec, it is not a clear cut that NULL will always used as
>>> fetching the required size of an output buffer. In particular, they
>>> suggest to refer to the protocol.
>>>
>>> In your commit message you indirectly point to an example where 0/NULL
>>> would have a different meaning depending on the flags. This is not
>>> explained in the TEE Client API Specification. Do you have some
>>> pointer I could use to check the behavior?
>>
>> Well, GP specification describes application interface. It does not
>> specifies how implementation should handle this internally. Basically,
>> GP defines functions, data types, macros, etc to be used by CAs and
>> TAs. But it does not define how exactly call from CA will be delivered
>> to TA. Implementation is free to use any means as far, as they conform
>> with rules described in the specification.
>>
>> OPTEE's REE<->TEE interface is described in the header files, that I
>> added to xen (optee_msg.h, optee_rpc_cmd.h,optee_smc.h). But it does not
>> describe every aspect, unfortunately.
>
> Thanks for digging-through! More below.
>
>>
>>>>
>>>> OP-TEE represents this null memory reference as a TMEM parameter with
>>>> buf_ptr =3D=3D NULL. This is the only case when we should allow TMEM
>>>> buffer without the OPTEE_MSG_ATTR_NONCONTIG flag.
>>>
>>> IIUC, 0 with OPTEE_MSG_ATTR_NONCONTIG set would mean "use the buffer
>>> at address 0" but with the flag cleared, it would mean "return the
>>> size". Am I correct?
>>
>> Not exactly. This flag does not affect behavior for buffers with address
>> NULL. In any case, this would not mean "return the size" to
>> OP-TEE. This is because OP-TEE works as a transport between CA and TA
>> and it does not assign any meaning to client buffers. But certainly,
>> null buffer will mean "return the size" for some TAs, as described in
>> GlobalPlatform specification.
>
> Does it mean a guest TA may potentially access address 0?

TA is running in S-EL0. That buffer with PA=3D0x0 will be not mapped in TA
address space at all. So, if TA will try to access address 0, it
will be terminated with data abort.

> I am asking that because 0 can be a valid host physical address. We
> are currently carving out 0 from the heap allocator to workaround a
> bug, but there is no promise this address will be used by the boot
> allocator and therefore Xen.
>

Well, this is a potential issue in OP-TEE. It does not treat 0 as a
valid address. So, in that rare case, when REE will try to use 0
as a correct address for data buffer, OP-TEE will not map it into
TA address space, instead it will pass NULL to TA, so TA will think that
no buffer was provided.

>> Reason why I prohibited buffers without OPTEE_MSG_ATTR_NONCONTIG flag in
>> the the original patch is that such buffers could span across page
>> boundary, which is no-go for fragmented p2m.
>>
>> But I missed that special case: null buffer without
>> OPTEE_MSG_ATTR_NONCONTIG flag. As this is a special type of buffer, it
>> can be allowed with and without said flag.
>
> Looking at translate_noncontig(), there is no specific treatment for
> NULL. So the address will get translated. This is likely to result to
> an error as usually a guest doesn't have anything mapped at address 0.

Yes, you are right. Right now, optee client driver will not emit buffer
wit OPTEE_MSG_ATTR_NONCONTIG and address 0. But this is possible. And
this should be handled correctly. I'll add fix for that. Today, as
well. Thanks for pointing this out.

--=20
Volodymyr Babchuk at EPAM=

