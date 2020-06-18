Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16561FFE9B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 01:29:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm3y4-0007tV-H8; Thu, 18 Jun 2020 23:29:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0e1t=77=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jm3y2-0007tQ-Kb
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 23:29:10 +0000
X-Inumbo-ID: 822bf828-b1bb-11ea-bca7-bc764e2007e4
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.65]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 822bf828-b1bb-11ea-bca7-bc764e2007e4;
 Thu, 18 Jun 2020 23:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7Gd3dXLhrflVSrzgXMgM9E3UIM3MYaPlxwf1uBuWldJFDp96B6D3jWeb283H1IxLkoomhwKLaWNSmb10wstPMoChUqCUjgRlEmosXe5lHJBIw1h31LUSDYdRBwnUcWM1OBFWDdfQST2Kr6IBxsbH3P1DqRRuN47svl85BaWGOz/fmOsWUnfNcbdwifPiBZ64QLx367Ty7nw05P6lA27XNx/tp+W80JJExthe1qw0HLbQeocwjG61jFl6qQKamVf/pwS2Il8/bMn1J6ZJpwDKiWDPheNxztyH1me6kwIPkaG5DxA8atsnVBYY089N5lKNzOjj35dnRK2ZpsPrqC0Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BE3xGRqIJ5fZeXZq5TpIagarg1WJmbmqwsnEhcIfRhE=;
 b=l3cSafqEj2+S3SoDIp1AOTPRjfc1VGm/4QtfdtMScqQCjI3HjbjorfABdeJ1RFchbmoyLdCDPL5S2mzHofh1fxzNAEUzYeLcnjlqvvaz7x0tGOHCmDVlyPTMqislOIIVjX1219/0We5Mu14QQPHEhBa8WDu3KpAe5wHIjsn4pWmbQUhYeKcWltEzsE+CkalKyA22NU8D/JRny9I/wLrpfAaIhwQp1LBWMpTcUm7NSFCm8HL+iYAKok1hhmSKebvFLPyGgtarjuWk8sSBYlKrcuzF7DQTQHa1P19kZuQPFyqrY7gSZiHux11/pSyIKJc2crAPrFFHuFVGuZpSb5uPLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BE3xGRqIJ5fZeXZq5TpIagarg1WJmbmqwsnEhcIfRhE=;
 b=FAJApfXIRi9n+MBkiYKio2gOeQDTrFQDFyQl2eWUsdCKCNFhONzJEL8eGZMZrN/f+yQEFY9HYQU/chEs+WKvxZBVCICjBmu4Oiksjiy+qmrSL0GMt5apgKVw7HJJOZpg/xsX9VDsgJTLyI1/Bv2Hka6c7TFpuVRLPJ6PFsxfjuDQz//Ctrvb6GvY2/8nHcjeJBzYWx6ikE6BlJVZYV4591Glc9WOoX5sQhKLsVrWaTmpgiWriXeHms4hcSakfaEXvn9TQFZrCHm5TcnRcME9do28XEHWJgYQUkiI8cvJ8fIPvF2y04C0C2Qf4FO/3geF/Ive76CRxzn3MxEfCNqFCA==
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com (2603:10a6:802:35::28)
 by VI1PR03MB5005.eurprd03.prod.outlook.com (2603:10a6:803:b7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 23:29:07 +0000
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37]) by VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37%7]) with mapi id 15.20.3088.028; Thu, 18 Jun 2020
 23:29:07 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: optee: allow plain TMEM buffers with NULL address
Thread-Topic: [PATCH] xen/arm: optee: allow plain TMEM buffers with NULL
 address
Thread-Index: AQHWLLcTxhZtogukPEOG78aedSZTLajL0lyAgBNkugA=
Date: Thu, 18 Jun 2020 23:29:07 +0000
Message-ID: <878sgk2bst.fsf@epam.com>
References: <2a32c7c2048333169c9378194d6a435e2e7ed2d7.camel@epam.com>
 <1b596a11-95b5-3e87-bbf5-c0c4dceb6489@xen.org>
In-Reply-To: <1b596a11-95b5-3e87-bbf5-c0c4dceb6489@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 26.3
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85797aee-a6ba-457f-6371-08d813df6594
x-ms-traffictypediagnostic: VI1PR03MB5005:
x-microsoft-antispam-prvs: <VI1PR03MB5005518435F3C39ACC82EAD8E69B0@VI1PR03MB5005.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kiNeWXaFAg5hzOFMpOXuA69R8cWiek7mro5KMErihYyUwCtGzebnC9Ia7e2N4oRoXysIDEZFEUAVc04m+HhoNhAas24FRsTdRrHHHwrCRQz0el4mAttWFmw+MU5O+43eNZoHxP9ODHUxLqC9cOUOtv3ZPpzKHQ3LMzFN6u5d7FlReJT4O1yRxRodBm2l136bxcWD6izVpI8GpQTVE8+1++NsxcHGom2i50PBiVuRUVN/Xw1lp7c7QFdriUM5ZZmz1ML8h2ahr8m3+VgEkMluub81x9KElsPr9Hv9mfra8NtKwtATmD8bk1s5rgV9M5ooOrfVOniY54zGQvaIY8gGaQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB2926.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(2906002)(6506007)(53546011)(26005)(83380400001)(6486002)(5660300002)(8936002)(8676002)(71200400001)(55236004)(186003)(36756003)(4326008)(6916009)(66946007)(86362001)(54906003)(316002)(478600001)(76116006)(91956017)(66476007)(64756008)(66556008)(2616005)(66446008)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: RECDs+Z/Oz3USSfu0CwTx1KYeYLeEYoQqqXoewmBb35JY9iZT09rhZTYLDUV5SE0uGjcneNkjxBEUeOOYmRdQ1+QGykDul+uLgOrWTPfxQOqc8qqLqn7rlI0UAV+zmBZHeK4ImoVeqsrvTtyCJShJSdPaKzIsgZKD7imo//B3ZLxjMD9nCvYZDzgZPvU84GzVImd4nc7E1YH4DQQbI0B0b5ZzP4yvz8U8l4nVloj5Mk8NUo9msldaF7QCJG3tOxDYCmCxxur1I+3qPg+HgOpUuxo15Z4KSc3fHdj4M8HGnkOYsn7x1Q60L5vYhj96AMvvBLNwCuVBWyo02zX+SWW8UBS9xBZxIOJLcAFcaZ7epar3U9EIei7+Ikk9E5TW2qL+zdhjiaD9A9h01nESFFcu3CgoIBkKlaRUEW18VLVvXrfFiME3R+LsXDRlll5gaMeifvVcchd/vWQV/eC+k3Nf9sQlS5o1lOVqY8ipYr2Hzg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85797aee-a6ba-457f-6371-08d813df6594
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 23:29:07.4704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j9qPPnPwFThcVZab86Bo4QHA7LoTrf6HiDSi0TxO/1nDih0Sg6AjGFbjdVAiH8tcu+ng/XHK6lcgmewyVekPkroXS7MuJc6Vs+YJgw9v5R8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB5005
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


Hi Julien,

Julien Grall writes:

> (+Paul)
>
> Hi,
>
> On 18/05/2020 02:53, Volodymyr Babchuk wrote:
>> Trusted Applications use popular approach to determine required size
>> of buffer: client provides a memory reference with the NULL pointer to
>> a buffer. This is so called "Null memory reference".  TA updates the
>
> NIT: You use double space after '.' here but all the others use a
> single space.

Oops, missed that.

>> reference with the required size and returns it back to client. Then
>> client allocates buffer of needed size and repeats the operation.
>>
>> This behavior is described in TEE Client API Specification, paragraph
>> 3.2.5. Memory References.
>
> From the spec, it is not a clear cut that NULL will always used as
> fetching the required size of an output buffer. In particular, they
> suggest to refer to the protocol.
>
> In your commit message you indirectly point to an example where 0/NULL
> would have a different meaning depending on the flags. This is not
> explained in the TEE Client API Specification. Do you have some
> pointer I could use to check the behavior?

Well, GP specification describes application interface. It does not
specifies how implementation should handle this internally. Basically,
GP defines functions, data types, macros, etc to be used by CAs and
TAs. But it does not define how exactly call from CA will be delivered
to TA. Implementation is free to use any means as far, as they conform
with rules described in the specification.

OPTEE's REE<->TEE interface is described in the header files, that I
added to xen (optee_msg.h, optee_rpc_cmd.h,optee_smc.h). But it does not
describe every aspect, unfortunately.

>>
>> OP-TEE represents this null memory reference as a TMEM parameter with
>> buf_ptr =3D=3D NULL. This is the only case when we should allow TMEM
>> buffer without the OPTEE_MSG_ATTR_NONCONTIG flag.
>
> IIUC, 0 with OPTEE_MSG_ATTR_NONCONTIG set would mean "use the buffer
> at address 0" but with the flag cleared, it would mean "return the
> size". Am I correct?

Not exactly. This flag does not affect behavior for buffers with address
NULL. In any case, this would not mean "return the size" to
OP-TEE. This is because OP-TEE works as a transport between CA and TA
and it does not assign any meaning to client buffers. But certainly,
null buffer will mean "return the size" for some TAs, as described in
GlobalPlatform specification.

Reason why I prohibited buffers without OPTEE_MSG_ATTR_NONCONTIG flag in
the the original patch is that such buffers could span across page
boundary, which is no-go for fragmented p2m.

But I missed that special case: null buffer without
OPTEE_MSG_ATTR_NONCONTIG flag. As this is a special type of buffer, it
can be allowed with and without said flag.

>
>>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> The code looks to match your commit message, but I wasn't able to
> match it with the spec. Do you have other pointer I could use to check
> the behavior?
>
> I assume this wants to be part of Xen 4.14. The change is only for
> OP-TEE which is a tech preview feature. So the risk is very limited.

Sure.

--=20
Volodymyr Babchuk at EPAM=

