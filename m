Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4522426023
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 01:01:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204124.359326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYcNd-0006Fo-66; Thu, 07 Oct 2021 23:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204124.359326; Thu, 07 Oct 2021 23:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYcNd-0006Dv-2l; Thu, 07 Oct 2021 23:00:49 +0000
Received: by outflank-mailman (input) for mailman id 204124;
 Thu, 07 Oct 2021 23:00:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uL+=O3=epam.com=prvs=0914b18df8=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1mYcNc-0006Dp-8J
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 23:00:48 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fe35676-4b7a-42a9-acc7-03f7d5a373bf;
 Thu, 07 Oct 2021 23:00:45 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 197L8x4h023298;
 Thu, 7 Oct 2021 23:00:42 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2052.outbound.protection.outlook.com [104.47.9.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bj8j3r7an-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 23:00:42 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by PAXPR03MB8099.eurprd03.prod.outlook.com (2603:10a6:102:220::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 23:00:39 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::24db:d530:e190:518b]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::24db:d530:e190:518b%6]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 23:00:39 +0000
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
X-Inumbo-ID: 4fe35676-4b7a-42a9-acc7-03f7d5a373bf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXbrgDwmQauuYRGADdgMTUOntIYUZlm2Bgl/7YiIL2PG+6HJ0Zt86ptUq36sDWG2ULO5vJn+IbkfhZdk3KM8NKgNzsHL+YQmG7j4b7EgFawY9xwDDe7SVs76KY7jf0kB4rssgpsqATU5BK5cVQIjTjD9ObZYq8RIuwYuNY3pbTg/c9ZjGce20EsC+HSuJEufhkP/OR2P07NL4K+i6gW6qsUKz20lBhn08wDz5Ttku30BVCXACBkJnJQvFwXVLkXLTgvfRuw/bDl6nfvaJDRHB9hlTV54P+igHUe3EyAshRbh2d+A9VISBFNZd4qIpR9efZWK2GB45JhHhz3Qh+RSCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B14tgna0rLjL4hdMexFC2pYaUgMZvoJ93f2pZ3K1k4Y=;
 b=bzAOkTVPNVNuqixnse28qbc2L++znSpUokFJE8yDJTkPXVdEjfXI5K05moB4yHPpqTC8euhOocLstS7BK25QY/Trn/NntbLY++VlmvULVxng2/KNQUTlX85wbQCdFN1HwZ6FJHo3P7dyNj7bZh7AlwYPpHwNQRBicaXd/nG9hNoYg77GREQtClFPTSAeEKEdAvn7SPdMExCwDZy1hJRC1ewf+z2nsZO8YnQv3OB8XpV8+nnnseMo3tvFls81g3slk67TvfAVrLVE7YmvzXwq+SxKsDf8fh8da2NEQydoGmxXxAuZQ/CQ2BMtOQpwbY2yQeJuIpUNunNnQbOsdsDHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B14tgna0rLjL4hdMexFC2pYaUgMZvoJ93f2pZ3K1k4Y=;
 b=ER/0iIRozUrjrtTYwHQg3vB/UMWPXvu8sSv3Z3YKF7fQEMEJMC+zp9SaUP5jG1ixfkrE4SUUB5wxklW2Wy9jVUnyJNTDIDljsFHpBsAX3MLtZbatVu+2EN2W9BZeidMdQ3s5+qYQSu7THal+UsHr08wbK/0eJWvHs4yf2t/mnz6C0wG0D2pCDLQjI3iQhx4eth1iGgd6dbkjehJiJF0Q0xcTPqoibeeotN+md3FOqnNx+jqQ8HCeGc508bY5fFoc797k6XyO5EjC+iea5BBXPKYr7pIjnJiqmmDyBFtmbS94SQeqq0xv/cOodiMJAJUZmuRT3psA94TYIIMkB1Oouw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr <olekstysh@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Julien Grall <julien@xen.org>, Julien Grall
	<jgrall@amazon.com>
Subject: Re: [PING] Re: [PATCH] xen/arm: optee: Allocate anonymous domheap
 pages
Thread-Topic: [PING] Re: [PATCH] xen/arm: optee: Allocate anonymous domheap
 pages
Thread-Index: 
 AQHXoyUNSkY32SPluU6N5DMbFmm656uyJ0MAgAAJFoCAE/PzgIAAsCsAgAESVACAAFOXgIAAGYYA
Date: Thu, 7 Oct 2021 23:00:39 +0000
Message-ID: <87k0ioqw2x.fsf@epam.com>
References: <1630935741-17088-1-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2109231308200.17979@sstabellini-ThinkPad-T480s>
 <87bl4jrovq.fsf@epam.com> <81f7699b-69c1-da52-a1a7-5000343bf872@gmail.com>
 <alpine.DEB.2.21.2110061639050.3209@sstabellini-ThinkPad-T480s>
 <87r1cwra4t.fsf@epam.com>
 <alpine.DEB.2.21.2110071357160.414@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110071357160.414@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 806015fe-817c-4ec7-49ca-08d989e6485d
x-ms-traffictypediagnostic: PAXPR03MB8099:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PAXPR03MB8099E16E20885FC49983CEEBE6B19@PAXPR03MB8099.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8aIBi7eaqR9JAJFfM1MYVCyogW893+tDMMb1wbFjB4Vwp9bfc857/SIMIY0bisQI1/9weAxf+QPYD++B6WEeodwZG6BVx1IrZ3BOiOlaLorFenxRRzNgYZyvwdd9+Ij20jl0xSPun1YBpJmNlO6i+1kmLbTOskJsl3CL7gL4LLkdJKGmGsy5KDtegMh7dhiP94AMJl5v29DSo3+INt8uVyJ2zsQqJzFgTSFlAlZTJLD1Kxjt6PRxrZ2l1N0MMB/61TrWjYtZQW45xToI+5UlF0O1NrcwvoKp1np0fT/5hS/aZFaoE74Die/cCpGLNwD/yrUc18xTvVXuwgwpCO98vWswxGKi8Rm1ZefkfWvulFMG6yyxXn5HjpayIJXNslXWXfeTzjpVBSY+35deCTnml1YIzlVSHf5maHWizSFNG1tm6aN5BWV3NoHFG/1gJC/9wymH9r4EYEHiA0gXKy8dyQ4Oi2u+EhynOQRFEuFtLr9JQCCY3UrIPokD7Mn0lZo1JkJuHa+x+7pG0Dzp5g+0h1o1VY9bqfEGZYjJC1qdN+aOSrcMqVorKSgTFTpvr43xuek0+UDzoYoasPeJx3ISr+QLxqFfggVeGL0+olQsZLtPhvZNH6VkehKCwM5ke7ICdpioQNtszDEDgjQe7CIHtquuxMeECVF/ntSQqvARbfeDgS2VxFA4CM1nHtOTdhTRXO11/GLRtUppIr+XTlexDg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(30864003)(316002)(2906002)(66476007)(66556008)(91956017)(186003)(86362001)(76116006)(53546011)(83380400001)(6506007)(71200400001)(508600001)(55236004)(66946007)(64756008)(66446008)(6512007)(8936002)(54906003)(8676002)(4326008)(26005)(122000001)(6916009)(2616005)(38070700005)(5660300002)(38100700002)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?3ZykZNawuB0Bi5HkIc9jSxLN2SoXKa8fXpT1ZsVNOgoRQwz058z5f83aIU?=
 =?iso-8859-1?Q?Ns6xvjXijsqwqYIrPKHFMHq0wysZcB2WRqrtSDGYeJ9a575u1RP0ultDCj?=
 =?iso-8859-1?Q?gZTuP82usRwjYorbdYyRoWHf1Clxm6icBGtzx2wjezpRdKq2oxDiJtM9Sq?=
 =?iso-8859-1?Q?S3QLU3dRbuF6VKNhpHn98ZjWl5yULDGtaow7qY3yoOcMY5dAKvRJ5kYsPi?=
 =?iso-8859-1?Q?z5RknshfXi0S2PFnkeVXd4E1axo7zmyT7xiq+Nv+TPyW8NG8ne1HSalzuE?=
 =?iso-8859-1?Q?wHFYC4nOCdAfADDMJFal9JfkReB1JoDfzl1odXQ/As9NixTJsvEa0zCT1A?=
 =?iso-8859-1?Q?y3bnLLlEgmNA1HUft+Z7GUj7GJtxR3GjOkjgYXsjbdy+C5xd0eaGDAEo1N?=
 =?iso-8859-1?Q?bLs86gVwT90D4l7y/oKaVsHpO57OVbQoc/VzcQzVXQ4KGIKnRtMfoStpTc?=
 =?iso-8859-1?Q?PewCn8Z7YmTDxaI8J9lZARljEL7tNjqWw73MZ92uKVnKQsYqM8Rb+GiW8T?=
 =?iso-8859-1?Q?DP4CCKTYFei642njrFO8sw+OL/HRlgWYIJERXKyITUsuzji9TifPTARgur?=
 =?iso-8859-1?Q?zl8NuOPnXeGuUe4bMazBFbhGjcwAVf+luNeSh/DFEXOcKr+VhImeWSXiWm?=
 =?iso-8859-1?Q?uh0UAQ/JCRubJNRqPKfAsNRA1aIVnrk+GsAxtTXCSDn1AYZz8Ryh7bFUdi?=
 =?iso-8859-1?Q?7nEUMN7dkiPqCif6C9IeU/XckFYMjExUsZulY8CX/IzdhhvokoeOcEFqoU?=
 =?iso-8859-1?Q?i27KW/sIVvGcJyojr8vzGfQHnm4qbBaPoIuOHlL8YV6ngwMy4yrqLjl9Tu?=
 =?iso-8859-1?Q?3ek2yjGN88H54geeg4LcC0nPNnuOylEcFrsI9VhbJAINOhlEjx5BrIZzzb?=
 =?iso-8859-1?Q?L1vvH46uy1GjDayoHHIdhzTp5XjaC4LsZXOfQo2XcaWyOiibFUur81V8Cz?=
 =?iso-8859-1?Q?cBx6Z89gJ+gUs5/OG2ebQ75iYxn2QOHo5+wWlwUVTpks3kcLY+Kc5TWFAI?=
 =?iso-8859-1?Q?+DH5tDhjpWDntNZtHBEIsaJxTAICMcffgQs9+3xqmQ1pY+6dq4YNA2YBwT?=
 =?iso-8859-1?Q?NAlPWnRvruUSo9RsLMTaER1xW8BEq+QE+SVf5jqeDXA+r2dH1jzs0ZP3+V?=
 =?iso-8859-1?Q?KIoTTmMdow9VLGHpSm6FFDHv2EPTudZXzVFujbakuFva7svED5kxM2gnQe?=
 =?iso-8859-1?Q?iShAPPYP+7JUNjbHvEfwU64u1dwaVDWzZdM1kmAHoIcOo7JzkoU4ezS0VO?=
 =?iso-8859-1?Q?Ee5MwP+cc9kpJJ3VJ7x+FDmmjec4I+B88M1u/x6g5edzg1ARunGVcFHkLi?=
 =?iso-8859-1?Q?SR7dAlS4dy8PtGAO0+2kitQGeEYnjfIHXs6Ss2844C+i6/aQesuNialsme?=
 =?iso-8859-1?Q?q1k7ex+ckl?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806015fe-817c-4ec7-49ca-08d989e6485d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2021 23:00:39.7709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TjuVPSaKH9uIC7I9ZJyU91HmhYCaZCIYOYmVOKNCuwev8G75Go//DzmwygJ7Cc+d7SSYz7QDhpLE1wtL4zUdGwhqzR6QGp5R2XYtF0+/xSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8099
X-Proofpoint-GUID: -mRsoy8e48sLZyNPCQeVvLStfjzvFfFN
X-Proofpoint-ORIG-GUID: -mRsoy8e48sLZyNPCQeVvLStfjzvFfFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-07_05,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110070144


Hi,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Thu, 7 Oct 2021, Volodymyr Babchuk wrote:
>> Hi Stefano,
>>=20
>> Stefano Stabellini <sstabellini@kernel.org> writes:
>>=20
>> > On Wed, 6 Oct 2021, Oleksandr wrote:
>> >> Hello all
>> >>=20
>> >> Gentle reminder.
>> > =20
>> > Many thanks for the ping, this patch fell off my radar.
>> >
>> >
>> > =20
>> >> On 23.09.21 23:57, Volodymyr Babchuk wrote:
>> >> > Hi Stefano,
>> >> >=20
>> >> > Stefano Stabellini <sstabellini@kernel.org> writes:
>> >> >=20
>> >> > > On Mon, 6 Sep 2021, Oleksandr Tyshchenko wrote:
>> >> > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> >> > > >=20
>> >> > > > Allocate anonymous domheap pages as there is no strict need to
>> >> > > > account them to a particular domain.
>> >> > > >=20
>> >> > > > Since XSA-383 "xen/arm: Restrict the amount of memory that dom0=
less
>> >> > > > domU and dom0 can allocate" the dom0 cannot allocate memory out=
side
>> >> > > > of the pre-allocated region. This means if we try to allocate
>> >> > > > non-anonymous page to be accounted to dom0 we will get an
>> >> > > > over-allocation issue when assigning that page to the domain.
>> >> > > > The anonymous page, in turn, is not assigned to any domain.
>> >> > > >=20
>> >> > > > CC: Julien Grall <jgrall@amazon.com>
>> >> > > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.=
com>
>> >> > > > Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> >> > > Only one question, which is more architectural: given that these =
pages
>> >> > > are "unlimited", could the guest exploit the interface somehow to=
 force
>> >> > > Xen to allocate an very high number of anonymous pages?
>> >> > >=20
>> >> > > E.g. could a domain call OPTEE_SMC_RPC_FUNC_ALLOC in a loop to fo=
rce Xen
>> >> > > to exaust all memory pages?
>> >> > Generally, OP-TEE mediator tracks all resources allocated and impos=
es
>> >> > limits on them.
>> >> >=20
>> >> > OPTEE_SMC_RPC_FUNC_ALLOC case is a bit different, because it is iss=
ued
>> >> > not by domain, but by OP-TEE itself. As OP-TEE is more trusted piec=
e of
>> >> > system we allow it to request as many buffers as it wants. Also, we=
 know
>> >> > that OP-TEE asks only for one such buffer per every standard call. =
And
>> >> > number of simultaneous calls is limited by number of OP-TEE threads=
,
>> >> > which is quite low: typically only two.
>> >
>> > So let me repeat it differently to see if I understood correctly:
>> >
>> > - OPTEE_SMC_RPC_FUNC_ALLOC is only called by OP-TEE, not by the domain
>> > - OPTEE is trusted and only call it twice anyway
>>=20
>> Correct.
>>=20
>> > I am OK with this argument, but do we have a check to make sure a domU
>> > cannot issue OPTEE_SMC_RPC_FUNC_ALLOC?
>>=20
>> domU can't issue any RPC, because all RPCs are issued from OP-TEE
>> side. This is the nature of RPC - OP-TEE requests Normal World for some
>> service. But of course, Normal World can perform certain actions that
>> will make OP-TEE to issue a RPC. I discuss this in depth below.
>>=20
>> >
>> > Looking at the patch, there are other two places, in addition to
>> > OPTEE_SMC_RPC_FUNC_ALLOC, where the anonymous memory pages can be
>> > allocated:
>> >
>> > 1) copy_std_request
>> > 2) translate_noncontig
>> >
>> > We need to prove that neither 1) or 2) can result in a domU exausting
>> > Xen memory.
>> >
>> > In the case of 1), it looks like the memory is freed before returning =
to
>> > the DomU, right? If so, it should be no problem?
>>=20
>> Yes, mediator makes shadow copy of every request buffer to hide
>> translated addresses from the guest. Number of requests is limited by
>> number of OP-TEE threads.
>>=20
>> > In the case of 2), it looks like the memory could outlive the call whe=
re
>> > it is allocated. Is there any kind of protection against issuing
>> > something like OPTEE_MSG_ATTR_TYPE_TMEM_INOUT in a loop? Is it OP-TEE
>> > itself that would refuse the attempt? Thus, the idea is that
>> > do_call_with_arg will return error and we'll just free the memory ther=
e?
>>=20
>> Well, translate_noncontig() calls allocate_optee_shm_buf() which counts
>> all allocated buffers. So you can't call it more than
>> MAX_SHM_BUFFER_COUNT times, without de-allocating previous memory. But,
>> thanks to your question, I have found a bug there: memory is not freed
>> if allocate_optee_shm_buf() fails. I'll prepare patch later today.
>>=20
>> > I cannot see a check for errors returned by do_call_with_arg and memor=
y
>> > freeing done because of that. Sorry I am not super familiar with the
>> > code, I am just trying to make sure we are not offering to DomUs an ea=
sy
>> > way to crash the system.
>>=20
>> I tried to eliminate all possibilities for a guest to crash the
>> system. Of course, this does not mean that there are none of them.
>>=20
>> And yes, code is a bit hard to understand, because calls to OP-TEE are
>> stateful and you need to account for that state. From NW and SW this
>> looks quite fine, because state is handled naturally. But mediator sits
>> in a middle, so it's implementation is a bit messy.
>>=20
>> I'll try to explain what is going on, so you it will be easier to
>> understand logic in the mediator.
>>=20
>> There are two types of OP-TEE calls: fast calls and standard calls. Fast
>> call is simple: call SMC and get result. It does not allocate thread
>> context in OP-TEE and is non-preemptive. So yes, it should be fast. It
>> is used for simple things like "get OP-TEE version" or "exchange
>> capabilities". It is easy to handle them in mediator: just forward
>> the call, check result, return it back to a guest.
>>=20
>> Standard calls are stateful. OP-TEE allocates thread for each call. This
>> call can be preempted either by IRQ or by RPC. For consistency IRQ
>> return is also considered as special type of RPC. So, in general one
>> standard call can consist of series of SMCs:
>>=20
>> --> SMC with request
>> <-- RPC return (like IRQ)
>> --> SMC "resume call"
>> <-- RPC return (like "read disk")
>> --> SMC "resume call"
>> <-- RPC return (like "send network packet")
>> --> SMC "resume call"
>> ...
>> <-- Final return
>>=20
>> There are many types of RPCs: "handle IRQ", additional shared buffer
>> allocation/de-allocation, RPMB access, disks access, network access,
>> synchronization primitives (when OP-TEE thread is gets blocked on a
>> mutex), etc.
>>=20
>> Two more things that makes all this worse: Normal World can register
>> shared buffer with OP-TEE. Such buffer can live indefinitely
>> long. Also, Normal World decides when to resume call. For example,
>> calling process can be preempted and then resumed seconds
>> later. Misbehaving guest can decide to not resume call at all.
>>=20
>> As I said, I tried to take all this things into account. There are
>> basically 3 types of objects that can lead to memory allocation on Xen
>> side:
>>=20
>> 1. Standard call context. Besides memory space for struct optee_std_call
>> itself it allocates page for a shadow buffer, where argument addresses
>> are translated by Xen. Number of this objects is limited by number of
>> OP-TEE threads:
>>=20
>>     count =3D atomic_add_unless(&ctx->call_count, 1, max_optee_threads);
>>     if ( count =3D=3D max_optee_threads )
>>         return ERR_PTR(-ENOSPC);
>>=20
>> 2. Shared buffer. This is a buffer shared by guest with OP-TEE. It can
>> be either temporary buffer which is shared for one standard call
>> duration, or registered shared buffer, which is remains active until it
>> is de-registered. This is where translate_noncontig() comes into play.
>> Number of this buffers is limited in allocate_optee_shm_buf():
>>=20
>>     count =3D atomic_add_unless(&ctx->optee_shm_buf_count, 1,
>>                               MAX_SHM_BUFFER_COUNT);
>>     if ( count =3D=3D MAX_SHM_BUFFER_COUNT )
>>         return ERR_PTR(-ENOMEM);
>>=20
>> 3. Shared RPC buffer. This is very special kind of buffer. Basically,
>> OP-TEE needs some shared memory to provide RPC call parameters. So it
>> requests buffer from Normal World. There is no hard limit on this from
>> mediator side, because, as I told earlier, OP-TEE itself limits number
>> of this buffers. There is no cases when more that one buffer will be
>> allocated per OP-TEE thread. This type of buffer is used only to process
>> RPC requests themselves. OP-TEE can request more buffers via RPC, but
>> they will fall to p.2: NW uses separate request to register buffer and
>> then returns its handle in the preempted call.
>>=20
>>=20
>> Apart from those two limits, there is a limit on total number of pages
>> which is shared between guest and OP-TEE: MAX_TOTAL_SMH_BUF_PG. This
>> limit is for a case when guest tries to allocate few really BIG buffers.
>>=20
>>=20
>> > It looks like they could be called from one of the OPTEE operations th=
at
>> > a domU could request? Is there a limit for them?
>>=20
>> Yes, there are limits, as I described above.
>>=20
>> Also, bear in mind that resources available to OP-TEE are also quite
>> limited. So, in case of some breach in mediator, OP-TEE will give up
>> first. This of course is not an excuse to have bugs in the mediator...
>
> OK, thanks for the explanation. The reasons for my questions is that if
> the allocations are using the memory of DomU, then at worst DomU can run
> out of memory. But if the allocations are using anonymous memory, then
> the whole platform might run out of memory. We have issued XSAs for
> things like that in the past.
>
> This is why I am worried about this patch: if we apply it we really
> become reliant on these limits being implemented correctly. A bug can
> have much more severe consequences.

Agree.

> As you are the maintainer for this code, and this code is not security
> supported, I'll leave it up to you (also see the other email about
> moving optee to "supported, not security supported").

Yes, I've seen this email. Just didn't had time to write followup.

> However, maybe a different solution would be to increase max_pages for a
> domain when optee is enabled? Maybe just by a few pages (as many as
> needed by the optee mediator)? Because if we did that, we wouldn't risk
> exposing DOS attack vectors for every bug in the mediator limits checks.
>
> The below adds a 10 pages slack.

Well, I didn't know that such option is available. If this is a valid
approach and there are no objections from other maintainers, I'd rather
use it.

Only one comment there is about number of pages. Maximal number of
domheap pages used per request is 6: one for request itself, one for RPC
buffer, 4 at most for request arguments. I checked OP-TEE configuration,
looks like some platforms allow up to 16 threads. This yields 6 * 16 =3D 96
pages in total. If this is acceptable I'd set TEE_SLACK to 96.

>
> diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
> index 3964a8a5cd..a3105f1a9a 100644
> --- a/xen/arch/arm/tee/tee.c
> +++ b/xen/arch/arm/tee/tee.c
> @@ -38,8 +38,11 @@ bool tee_handle_call(struct cpu_user_regs *regs)
>      return cur_mediator->ops->handle_call(regs);
>  }
> =20
> +#define TEE_SLACK (10)
>  int tee_domain_init(struct domain *d, uint16_t tee_type)
>  {
> +    int ret;
> +
>      if ( tee_type =3D=3D XEN_DOMCTL_CONFIG_TEE_NONE )
>          return 0;
> =20
> @@ -49,7 +52,15 @@ int tee_domain_init(struct domain *d, uint16_t tee_typ=
e)
>      if ( cur_mediator->tee_type !=3D tee_type )
>          return -EINVAL;
> =20
> -    return cur_mediator->ops->domain_init(d);
> +    ret =3D cur_mediator->ops->domain_init(d);
> +    if ( ret < 0 )
> +        return ret;
> +
> +    /*=20
> +     * Increase maxmem for domains with TEE, the extra pages are used by
> +     * the mediator
> +     */
> +    d->max_pages +=3D TEE_SLACK;
>  }
> =20
>  int tee_relinquish_resources(struct domain *d)


--=20
Volodymyr Babchuk at EPAM=

