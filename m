Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C0C63D8D6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 16:08:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449931.706980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Ogi-0006Vj-O8; Wed, 30 Nov 2022 15:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449931.706980; Wed, 30 Nov 2022 15:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Ogi-0006SP-KF; Wed, 30 Nov 2022 15:07:52 +0000
Received: by outflank-mailman (input) for mailman id 449931;
 Wed, 30 Nov 2022 15:07:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jz7r=36=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1p0Ogh-0006SJ-U3
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 15:07:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1db9a93-70c0-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 16:07:51 +0100 (CET)
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAWPR08MB9637.eurprd08.prod.outlook.com (2603:10a6:102:2ec::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 30 Nov
 2022 15:07:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5880.008; Wed, 30 Nov 2022
 15:07:48 +0000
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
X-Inumbo-ID: c1db9a93-70c0-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+vlgsQRUMwtw+KpGh3Z3iF2B5CZMSpXmLZmI+68qP1Ffs/JirsQ411cWBOe27y3DRhiD3o1muwZJ6SBm0N1OeqJH+k7UOid8rlcc5kJ/w8AYiALAefE5PL0iTuAt5LXK4xOW8x2PStIYNWn8Ap/VP1W5XL6f2YWtQ95SLbh0Cp0F0qwXqRjrD1Seqofj8X6RtHR3vSLr2gBUlQMMxxJxbgpPL/mXg+L5hbSK65o8kFIuIJDGAMQABRjDeyAWK2QlKNR7SuQNqRSgyTqZuXGVqMQHXD3vdV2X/DS3QZ0Vdv5U0iiTc/juQoMVcS4+Xsng6rNnr6jCKkNldW5x96kmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JSPBRv0xEMLWnES3R8tpiE0sel0x7eSYx7MrZeuS3w=;
 b=NLiiUls2IDBCw6Kyvgup29fQB5pNzA5PnZk48ZsESGTmsUXC2C7w9FOAxIGcZzsYTc1ZrDQ3vXHGQ4Q6+Qv9OZztR1ALVIsxXH7+ICs43e7wzZgsK620K7bUtEPVI6W1kc59noCKz9KMvbuNY/q7HHPSSFbQrci68D94sSnibxomlMuicvwD/UZncWD+7C1EbVaRJCbGR6RqCdU5sZ4OUCP+sv8JYBCzYzD/JPi8cBTAiWYGNfnkzJNi2QPk5hqNb5YcvMbnelCr8FBXvh/+gDN39yTWsCDEvhECXTPBhWVy4TteafMDh8b+/OrCqqc7bkL7He3FkSXxnQzjtJp0xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JSPBRv0xEMLWnES3R8tpiE0sel0x7eSYx7MrZeuS3w=;
 b=sQd07KovlTwfNYmahJlKQpmgw7n7x391ErxDZV1CL6zgLG7Vx42ymns/ZiiNfIDiervcQoopYHDPaYYfoezZ1eD1lKhQ93DcXRhbcUxEWgjJ9Prd/FvH76xttXYKrnnAJ58Bh9JSQkdU3sjXNHVoRmDlqtpIiwxBrnLAXgyNPU4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 3/3] automation: Add CI test jobs for Yocto
Thread-Topic: [PATCH v5 3/3] automation: Add CI test jobs for Yocto
Thread-Index: AQHZBLWHjw1n6cWydUSV320FMd2tla5XbqkAgAAi7oA=
Date: Wed, 30 Nov 2022 15:07:48 +0000
Message-ID: <C03FF185-AAC7-4E06-8505-876BC17F800B@arm.com>
References: <cover.1669810269.git.bertrand.marquis@arm.com>
 <e64015d3e8682d068223e94f3bfc8ad823b27a65.1669810269.git.bertrand.marquis@arm.com>
 <e453dd21-5fbd-5edd-2269-29c72a70299f@amd.com>
In-Reply-To: <e453dd21-5fbd-5edd-2269-29c72a70299f@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR08MB3784:EE_|PAWPR08MB9637:EE_
x-ms-office365-filtering-correlation-id: 11ab807c-4f71-479b-62b1-08dad2e4a4ee
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 J/jUNrx2NtGj7gQjba4tW0utQjrv6C+LksQXur3qh5GfBpYngrPfO6Gfq1NWqA76XM1q0ynCCLK/1JqKtfgwFngbPfvUwaggOdEeKmVQ0D00c9dcOaXyFOn2ML+rl+CQ+8KD9sjF0lra6IYTuHu3g2mtCG/NFGjqaNDqNXbL0bemNatAwHtKTTI4FBb230ftd+uL6EHrBCTz9FrmZRkQ1f+YuS0nIGuKRqf9LqHsSTq+gz9MwPpOzKzCCanowsBmbyOPq78qOUpMVYp0akqTRqX/8b1LGTtrNN4FlQtRo/2Qsd/5UvMG8+RKNc8sHNJD+27VpafI7NaZEW7iXN0Shiw+VXVUie+dyjn+q2S+DJZaceSH2qw/iy5E51eyK5ntCGyP2UYZcKzI70VNVBR85mJu5I/XV3N6GqQPaaXOiiyHWhIUFQtw2CtcID/ffP9x6WjWrKmKrOWhzuWZU0cty+hfcOBRADVVYI67+gRgBF3hvlLz8dt7/Bqy2XKW8010993tM4KJeBbsG9DExbG6duzlud4VbW4wdsvQUd1NYszVeI/BrouDIhjmyl7HVU2KqJlsNqNQtfrzIDhEuVWGmoWHAF25zR0tRzmuwC9/tmkIzvi1UTIfWAXjCiQjuuUTwhF+p7dgljrlixi1reEdqRFpbRaFYK0AK9Muegh88FUz8W9OMwDWDJVwUyTKY5/Ube4Pv7erkQyElOY1mTwN2nzKBb2aONGKaosJrhkxhjE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199015)(91956017)(5660300002)(36756003)(33656002)(2616005)(76116006)(6916009)(6512007)(54906003)(41300700001)(8936002)(316002)(8676002)(66476007)(66446008)(4326008)(186003)(66946007)(122000001)(66556008)(38070700005)(38100700002)(64756008)(26005)(2906002)(6506007)(86362001)(6486002)(71200400001)(478600001)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Qq6EPgTcv2zuVsAXAcblbGQe2HvRD44odatQqRK0Hrm26Mv/lIsDuzVqAvnp?=
 =?us-ascii?Q?TmMJGfTrGIYu2oaSAN4YNL8pum1n3FI9yGWGPwA5BSCGydQWFRnDnhSUirmp?=
 =?us-ascii?Q?fa+Kt8a8HKNav03Kuf0BNKLuVuaamA8S4ylI6dHnmJoEx5BLg2GdW2b8aS4n?=
 =?us-ascii?Q?LC1oapFYuszfGrqYK/HFXtFtMpv7lc/u1zAV1/xc3HAx8UxHx8vSy5AULpeJ?=
 =?us-ascii?Q?zoMA+04p3Fx3/tQZbHUyL0yAc4m944xhPszdL0eiI0ghH2jtUWG1aItfZjTy?=
 =?us-ascii?Q?AZe4rPQ5+kljJ1iDRxk6F2przU6t6fBRmk+eXfCkRhsrf1L8RfhPfLBSSQes?=
 =?us-ascii?Q?5EQg2FSUOjQd++wRlUtVSCYdxnFiMTz0m8Qv3BYtTLv360EZUWSToLmNIrbK?=
 =?us-ascii?Q?+8egdPFh3onMp8mvgILPN+07CC3i8VBuyS/+Sct67GAVQO3zl971Yh+0STIV?=
 =?us-ascii?Q?2golNrU+H1KY0twTaNq4kccCLyxVBV2Zp/LvbsSdBN3CcMOkYfIoISzJUnBt?=
 =?us-ascii?Q?NhC4kz2NUBmAxAMz5gIUngXQ+SvPAT9+YR0yjM+fYib5fx5DjHRy0mR1cAY8?=
 =?us-ascii?Q?v37dO+SL4PMZVja7PNfILA4ziR3hl6kDy7OPS7PAjrEy4YeUjHHhji8U2nCR?=
 =?us-ascii?Q?aR9aqWh1vsKZQzWltD4lw588rjY4Qllwwrvv+7uimZsm6xPLHgp4rzxCvRHT?=
 =?us-ascii?Q?F7I4+E3WOKwCk/sDokyACmsiBSsRklk+uJK/xtExWgC5s2kHdjaJHmWkWryI?=
 =?us-ascii?Q?UjMiM3HfleEGqCAMICDhY84NnDlvmxboC92bAoj6JyVLTuWv+xAk35lZ3M71?=
 =?us-ascii?Q?n2Gw30QhrGjZ50Kp4mF16yF8WMz6DixtWfuAQjW1lllsMuHscQc2hj5q9hyK?=
 =?us-ascii?Q?snTvxl0e29EZs1ySofRJju9ovD/e2HCFVoElPcjcUcuW2evIovnuefvwpjyR?=
 =?us-ascii?Q?CmT7btZ+06T1+yq5m8nQ2gVzrASsIi1wPVA7TM+BjK5M8UCBGGCiDrZksefC?=
 =?us-ascii?Q?KJiMZNRY1RqEpMXBxqS890H6/oA95mWrdn3HQ1n+nhgcO0ohERF6EHRXfne/?=
 =?us-ascii?Q?IyTQHP2xkYARm9e3mPbu6glhuYpD/fUjVpbKOH1cyATU1coomaCsjeLJ8mSz?=
 =?us-ascii?Q?wmAe9u7llinLD8KzC+h/V/8pDTYR+JlYeUVyMqxjsmliqqv0/Fh+3+22Iz3e?=
 =?us-ascii?Q?W1lHoQQbI7hCRErfROaJm1/u4cUfTldHWcMLj7LUyH9opGM9lWYOkWS0hZhx?=
 =?us-ascii?Q?RMMkrEL35KiZO2KBmYtjkIi54XTPZqWenHKJS8reio1h8vFCsq8NSeg8xXLz?=
 =?us-ascii?Q?zaY+NRI2rgNN14JEqbEhbnBfPonnL2e+ZGD0lXst1BvR59dvzItaZgLVV0dX?=
 =?us-ascii?Q?wt5cVT/aBBLW7qg6sfrWY4ndw7JbhsQnI48pIlsM7OffSuzphqXQsPCJJwlo?=
 =?us-ascii?Q?/1AWhzLzqpxQZaivCXkTOhQqBEMrTpMS0ooLoPRqRIq/bxOABwyMYfZ9QOoL?=
 =?us-ascii?Q?MTalfAhdvEuFvijEFRPv8rLqJqOrgdO6s/J2LdRjIZXWtn44xL7niZFxmcJe?=
 =?us-ascii?Q?TY7Bg7qCPo3jSqMDhX7Zith5Aoi7wBBAn72Yu+SG4zF+WPldLEgwoy7aGz84?=
 =?us-ascii?Q?Ow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <73E203669D91384B87BDC107F946AAE8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3784.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ab807c-4f71-479b-62b1-08dad2e4a4ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 15:07:48.7652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ToK04SHBPWY0yxT8Kts9MW/R7SKKjspvQwnxRMqnIzySjstUQBu7YILtItql1/BJpG7wMMgeBXXov6ylhCFGBpM64xKK5S0AWpG3ZpvTWk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9637

Hi Michal,

> On 30 Nov 2022, at 13:02, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Bertrand,
>=20
> On 30/11/2022 13:15, Bertrand Marquis wrote:
>>=20
>>=20
>> From: Michal Orzel <michal.orzel@amd.com>
>>=20
>> Populate test jobs for Yocto based tests using the provided containers.
>> Due to the size restrictions, it is currently not possible to split the
>> build and run tasks, therefore everything is done in a single step.
>>=20
>> Test jobs for the supported Yocto targets are generic to avoid the
>> necessity to add new ones after each Yocto release. The only thing
>> required to be changed after updating the containers is the variable
>> YOCTO_VERSION stored in a .yocto-test template.
>>=20
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Changes in v5:
>> - none
>> Changes in v4:
>> - add .yocto-test for arm64 and x86
>> - make yocto jobs use arm64 version
>> Changes in v3:
>> - patch added
>> ---
>> automation/gitlab-ci/test.yaml | 43 ++++++++++++++++++++++++++++++++++
>> 1 file changed, 43 insertions(+)
>>=20
>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.=
yaml
>> index c7e0078e04f1..6ce2fd63eee6 100644
>> --- a/automation/gitlab-ci/test.yaml
>> +++ b/automation/gitlab-ci/test.yaml
>> @@ -54,6 +54,33 @@
>>   tags:
>>     - x86_64
>>=20
>> +.yocto-test:
>> +  extends: .test-jobs-common
>> +  script:
>> +    - ./automation/build/yocto/build-yocto.sh -v --log-dir=3D./logs --x=
en-dir=3D`pwd` ${YOCTO_BOARD}
>> +  variables:
>> +    YOCTO_VERSION: kirkstone
>> +    CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}-${YOCTO_HOST}
>> +  artifacts:
>> +    paths:
>> +      - 'logs/*'
>> +    when: always
>> +  needs: []
>> +
>> +.yocto-test-arm64:
>> +  extends: .yocto-test
>> +  variables:
>> +    YOCTO_HOST: arm64v8
>> +  tags:
>> +    - arm64
>> +
>> +.yocto-test-x86-64:
>> +  extends: .yocto-test
>> +  variables:
>> +    YOCTO_HOST: amd64
>> +  tags:
>> +    - x86_64
> This hidden job is not used by any yocto test job and as such can be misl=
eading to others working on this file.
> So we can either remove it (can be easily reintroduced once we will find =
more x86 resources) or add a comment explaining why is it here.

If I remove it then there is not reason to have something separated for arm=
64.
I will keep and add the following comment on top:
# This is not used by any test job as we only run Yocto on arm based machin=
es
# Keep it here so that someone having x86 hardware can easily add jobs

Would you be ok with that ?

Cheers
Bertrand

>=20
>> +
>> # Test jobs
>> build-each-commit-gcc:
>>   extends: .test-jobs-common
>> @@ -188,3 +215,19 @@ qemu-smoke-x86-64-clang-pvh:
>>     - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE=
}
>>   needs:
>>     - debian-unstable-clang-debug
>> +
>> +# Yocto test jobs
>> +yocto-qemuarm64:
>> +  extends: .yocto-test-arm64
>> +  variables:
>> +    YOCTO_BOARD: qemuarm64
>> +
>> +yocto-qemuarm:
>> +  extends: .yocto-test-arm64
>> +  variables:
>> +    YOCTO_BOARD: qemuarm
>> +
>> +yocto-qemux86-64:
>> +  extends: .yocto-test-arm64
>> +  variables:
>> +    YOCTO_BOARD: qemux86-64
>> --
>> 2.25.1
>>=20
> ~Michal


