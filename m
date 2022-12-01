Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA7163EF51
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 12:20:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450527.707843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hc7-0000yF-Lg; Thu, 01 Dec 2022 11:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450527.707843; Thu, 01 Dec 2022 11:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hc7-0000uE-IW; Thu, 01 Dec 2022 11:20:23 +0000
Received: by outflank-mailman (input) for mailman id 450527;
 Thu, 01 Dec 2022 11:20:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yxuz=37=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1p0ha1-0007Jm-F1
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 11:18:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d767aa69-7169-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 12:18:12 +0100 (CET)
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PA4PR08MB6287.eurprd08.prod.outlook.com (2603:10a6:102:ef::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 11:18:09 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 11:18:08 +0000
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
X-Inumbo-ID: d767aa69-7169-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOGR5c5A3Jd49KM4BIrrrfWhCMW6vWOYVF+UwANqFf92XqRQtTGY5S5nK0KLFPSGpXISpNGSsVrr2qSh5GYGT6BPSuTvK5KWCwEOE54ml53FlSJ/8f98oHboKVxPCExtmd1rPzuYW4+tdNa4dr8+z0s31ziLf9GEP4CXPrmxfs34Yc/S8O2SbGPqb1WtrAZ4BBfYgODU9iNGxoj6TzqiArLfkDMcGbvcH+awFJO6i++LguyUr+fCl2IejcS/hDY1og96oT1NNC7BfAvxjsgi/NLKdRbePeKkwj8bb0W2tg48nFpYDOzhVjFhzwo3HxQr45CYzwKBXKQIhs3ukfxAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4AD/L8jR3RsJl4Pm02+iy8R79Zif1fOuANwHiiO+f8=;
 b=X8EBHQ/MFs6AvOAtSOMbfd/OvgOE0fayJ3WjGurCnksmvXPXh9PRzdgzgir/grYniOL4LzXSUe0PL6/e2JQ1WZK2RNrP96o5MycrQGtV7BrpM/0LXt1K1wm+zkmsfgdWu1BWSTJGtWqkskOexwaGoEQFNcVoe+8YTmXZz/gXQ6Mshs/Oz5HS9aBYQ8rixJpgLaPAxZzwggURTo1IRNO3fZFjN3NPaqKVVshfbG5fg0ToOAqFWHIvdQgclCIAwIHm5iQBi9bwARvoHg2Quqv1eoRQ23+/3jZdZtNllhimEFOrSvFTdib7dqlpsvwWsNDW0ApTcW+lbcHlxJs7ZriPdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4AD/L8jR3RsJl4Pm02+iy8R79Zif1fOuANwHiiO+f8=;
 b=Q9Hh+w8pttvdj1menmsVyGAoL+OpJHfBQ3Pi0O0digFmXPydeTMv+zRlEDvUtQaCoHajOEBA807Th13ROgRGDLZM8cTqoHv+HV0LsN6dxX4nrmU/5lj6JR96ZlpC87oEoixyiG/69+wm2dvdg2TGwLtZrgkMAxgu+rYbY/uRuUI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/4] xen/scripts: add cppcheck tool to the xen-analysis.py
 script
Thread-Topic: [PATCH 2/4] xen/scripts: add cppcheck tool to the
 xen-analysis.py script
Thread-Index: AQHZAzNLrQ+cdSzeJ02hq/RTLwHjha5WqVKAgAC2sICAAI2ugIAAyymAgAAt7YA=
Date: Thu, 1 Dec 2022 11:18:08 +0000
Message-ID: <3FE8EBB1-B565-4257-B966-BD1E97E32451@arm.com>
References: <20221128141006.8719-1-luca.fancellu@arm.com>
 <20221128141006.8719-3-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2211291607280.4039@ubuntu-linux-20-04-desktop>
 <CD8C2F1A-B321-4E3D-907C-E6DBB1A5E2CD@arm.com>
 <alpine.DEB.2.22.394.2211301145132.4039@ubuntu-linux-20-04-desktop>
 <471b6470-b0b7-a97d-2114-a1871e237a89@suse.com>
In-Reply-To: <471b6470-b0b7-a97d-2114-a1871e237a89@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR08MB3749:EE_|PA4PR08MB6287:EE_
x-ms-office365-filtering-correlation-id: ea485b57-593e-44c8-a262-08dad38db970
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 09BxsB/ui7/I0ZqRjcOMXOHUWTI4QCSS2iSf8Vj426CCnwVOnv2npPLD1x/zI8rrY2KTZH8X1lX0LlVHfEHQ5+SD52Pc21OlhTAOnoOXbAeS+nidJzZbbQXCPcsopgfcgrSquf+WMptnoQLfjNyzZ+fzfB+URDbQLV8Mb7Rji2KYrNiJF0JF6Mr3tkpCaCR0zwDO7YCV0xOTYPHHOzMTmNiSZgxl77leKQ+3SaBrZ58bROqMSdHzOGSG/8F6Gu2AVhkqSUoXiKTj0AzMaMo6oIwGfSNOjDuIUtn4S/1NohE7RYjYh9Wy3YiS7nprlKWL1jp94iTBV91Nm/wGT9OTbh4eWFvlu/Fmy9M05hcyrAKdtN76l35C5LPkXHrujXypsDSxTSQxtsHXV3uXfSPzCT29739jKK5Ki+gjAgjx2O8CT4T22Ql1iEkBvPUIF0kownf96zscGjca0YlKOVGqAAzeOZ1BJDeI1p6GZrrP7rNAG3qBQMJ2/EdcvLlCrbt/IuWtPgYXXLgIG5yEfTytxgdwfLdsRReRFOMG2jQaVbTEizrQSkHAhHebH6RNO3RlmTSEFRU6K4Mp4tmkDhocktCL2IIgNYUtrZo4CXimW4kgqRW0eHAftHYDUH1+cfmgJeMeiu6Gon2YbEE4lY35lnzpUcx+ylrrJd44MGvgyMrCBsm/NBc2SXrfcZoHIB9gxox1yKjcEfdJQh5exgydiTTC/VM1ro4q7dh6RY4hJu4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199015)(53546011)(5660300002)(6506007)(86362001)(316002)(36756003)(186003)(8936002)(91956017)(76116006)(4326008)(41300700001)(2616005)(66446008)(66946007)(66556008)(8676002)(66476007)(6916009)(54906003)(2906002)(478600001)(6512007)(26005)(33656002)(38100700002)(38070700005)(64756008)(122000001)(71200400001)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OfI7jIVYW37mJ1uehcRi7dFXYl792SeeAI4efZWWhmS0b2PI8TgWTL19K/TE?=
 =?us-ascii?Q?yb1oRfMgcR7cthJ5Gzk7TfWzK1xeo5W7JNgwj5rr+X4jX9+v8kw24FfxInI4?=
 =?us-ascii?Q?FDtIiEsjtANSlvrjtBDftoorf/oYo5KZAQu8F4CtPf1JBhCM3bHOW3rOKYfJ?=
 =?us-ascii?Q?EUqYO0Zl0luG1ZwutxZSZUGSbzSzGucEnQVSb9gGfka3JqAPIO/qD0GPin+k?=
 =?us-ascii?Q?OvKQaHS+TICRdpXG+E6FIPi6LygCfn/2I3MpiwapC+o9LOPFOc48V60lQVWR?=
 =?us-ascii?Q?UIH5iV6o33Zs6H7cAEQkbgprUTL+niu3aCjL0ofRLAomZ25qPdGz33scn2in?=
 =?us-ascii?Q?doWhZZKwTIR8qxJUnkljepx/KYKiJQ+dmJPRQfRPNrxzknKzmYUC85csJfNw?=
 =?us-ascii?Q?OMkGcFy2ySgAEe0Wb3dN9Dsh9ilsuMFofP/+eEcJSo9mG67NQ/qLbPmkPtG2?=
 =?us-ascii?Q?4TkRLNBFU9xMG1D7bIzDsZyLb5yS0fMjfcGJ46lU3cYgbxETjn/yJJU8F9dU?=
 =?us-ascii?Q?+SzW8PlT2vXOhI4ewclgVfvGLYmROOry0F5DXNec1YKToNC8a7fXQRfto665?=
 =?us-ascii?Q?o297SOow/KbYpYux0pTZwNnPs3L0lZPn0irx6LXmH+ZPmKuqYcg/G6yae4EZ?=
 =?us-ascii?Q?SyvAp8UP5bbF6O5f0xAaprT8kZNk1nJUYgMbHDMoDMrO8Zn89FOaBO6m6PJC?=
 =?us-ascii?Q?gyuMdfUm5IyGRmKV/paQPCP3UFae3iVZlDctkHV6DYXHHu/AidGRvS6iiJbh?=
 =?us-ascii?Q?VH/FW4g+fcRgt/ozGs1PRjqZx+K7nBEIDDPdCxEHSVJv/8COQMWohHuSm32y?=
 =?us-ascii?Q?1E0PBcaRwKWSxIZD2ErUyxtxcCNNMT63kYBHQJa3M2JlxFnLabH4PpJevbM4?=
 =?us-ascii?Q?11RG8Ljro53xDWZFzqPe3ZW2v9UaUZTQGd3EANihxyTvKJMeaclMOqz0hWXT?=
 =?us-ascii?Q?PAm6yKC7DSc9OP8NX3FwJTeTstKAdWjI2XLNz/kkTP/FqLe8aGByGSsFMRxT?=
 =?us-ascii?Q?XJWBOp/dRuKiSgwMy0J3+R0tyX3qF4m/AnwCpPmKa1n8LL+hTnUYsByWwW0P?=
 =?us-ascii?Q?KRpRuD6DfjHYv+uB1zXZcZFJkCqxFn9IuNl6W5YR4StYvwB+TfWlD0PC8DaQ?=
 =?us-ascii?Q?9Ut1nMCrNOtE2V/3QbmCWzjK65E4MHCUGhhZz7Ck6S15T0s3mjSQZ5Ixi3d9?=
 =?us-ascii?Q?U4I2E7vBq7cOsaZS92DdOMPgCyWiQxRJXEP/tdPzZHSmrqevSYMNpPjydg9I?=
 =?us-ascii?Q?I+PFBd1NQHYalujh7hLfiUhooT+wWK/9SdXo9KkQGZjxqOj/jI28GyMwHMfb?=
 =?us-ascii?Q?bZRqjeeNah5savDhIq7dSDn3EfaaKJvxCOtKDkyxnQLkSGK5OkXCf3a0vy+N?=
 =?us-ascii?Q?lRp4msq4wXLV7FaM4fPrS9X8YJCfnpARa5pvulfjHeRXDBlUYmLveV3LqJK0?=
 =?us-ascii?Q?dXIrtp2aVmR+nQ++vyOI+T2hvarsUxwkXcC3lLK9R9WlraMlh3aF9IfLP0x+?=
 =?us-ascii?Q?s6GLvfXexT3IVW3fmSe1UtCDuEchkLn5OmsKrTNuhUgv52yv4F7wSIv4iRka?=
 =?us-ascii?Q?EN3h1r91epzd3ce7d5JwNGDVr2fxkJtmwn5QzDzgfZxBxDwN8itaCceXHqTZ?=
 =?us-ascii?Q?Jw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5AF8BDC5AB0B834FB7821208A4876C2F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3749.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea485b57-593e-44c8-a262-08dad38db970
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 11:18:08.0737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2SHD4JYKVvCOMuMGoMxm2G1B+I+fehJtCVY8Jl8E3C7pMtzu3xVhbbVWPQRwC/M9HZLnSu2DHfiD1brNIyoZvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6287



> On 1 Dec 2022, at 08:33, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 30.11.2022 21:26, Stefano Stabellini wrote:
>> On Wed, 30 Nov 2022, Luca Fancellu wrote:
>>>> I think the revert of the cppcheck integration in xen/Makefile and
>>>> xen/tools/merge_cppcheck_reports.py could be a separate patch. There i=
s
>>>> no need to make sure cppcheck support in the xen Makefile is
>>>> "bisectable". That patch could have my acked-by already.
>>>=20
>>> Ok I will split these changes in a following patch
>>>=20
>>>>=20
>>>> Also the document changes introduced in this patch have my reviewed-by=
:
>>>> - docs/misra/cppcheck.txt
>>>> - docs/misra/documenting-violations.rst
>>>> - docs/misra/false-positive-cppcheck.json
>>>> - docs/misra/xen-static-analysis.rst
>>>=20
>>> Thank you, should I put those files in a separate patch with your rev-b=
y before
>>> this patch or this is just a comment for you to remember which file you=
 already
>>> reviewed?
>>=20
>> If Jan and the other reviewers are OK, I think you could split them out
>> in a separate patch and add my reviewed-by. If Jan prefers to keep it
>> all together in one patch, then I wrote it down so that I remember what
>> I have already acked :-)
>=20
> Docs changes being split off and going in first is okay as long as what
> is being documented is present behavior. If other changes are needed to
> make (parts of) new documentation actually correct, then it should imo
> go together. If new documentation describes future behavior (e.g.
> design docs), then of course it's fine as well to go in early, as then
> there simply is no code anywhere which this would (temporarily) not
> describe correctly.

Yeah I thought so, I would prefer to keep these files here otherwise I woul=
d need to
change them somehow and I would lose the r-by anyway.

Regarding the revert of cppcheck from makefile and xen/tools/merge_cppcheck=
_reports.py,
are you ok if I send a patch with only those changes? Would it be ok for yo=
u if the new patch
is after this one?

Just asking to prevent back and forth.

Thank you

>=20
> Jan


