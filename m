Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F6563EF6F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 12:28:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450563.707898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hjF-0003wC-Jv; Thu, 01 Dec 2022 11:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450563.707898; Thu, 01 Dec 2022 11:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hjF-0003tU-H1; Thu, 01 Dec 2022 11:27:45 +0000
Received: by outflank-mailman (input) for mailman id 450563;
 Thu, 01 Dec 2022 11:27:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yxuz=37=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1p0hjD-0003ST-Pq
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 11:27:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b6c5956-716b-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 12:27:42 +0100 (CET)
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by VE1PR08MB5629.eurprd08.prod.outlook.com (2603:10a6:800:1a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 11:27:39 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 11:27:39 +0000
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
X-Inumbo-ID: 2b6c5956-716b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/GW93+A1/3jJvuGTLm6X8VkCZrqu+PGJ2NAnwlgt2Ywrnfr6EHvZSRHIrd9jPQmfSAG+baf0Ic1oWSGPcEI/cFQDZO3NdYQo+eT9I9dPQjttXs3aELzGhL+ig2reT/hYZhYiWiRuJx2Pt8PDeNlcT/sQ7NS0ulb8TCfUGadxMWiWOeo3jQINbwnHL3+W2e8D2NxusldI/ftLtDx7GMQxLIOaoofYUOr2WW1NTeKf+RSoTlt2vzQ5aaHRdHd4yM/l84xl9i8UQl+0Wvp5WOx8f64oIIoO9SVtMgUOtS64Lwu3e5y9qwzZ7q3wTWQ5JpeMltf2nZxrb3pH6ugXupRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBd6anyJW1ann0UWdRaq1cQ8X8lRRQ2abDRfs2Lf9b4=;
 b=iIFfRCS2sypvAtuXVj9Uwl7itza68vu1R036sbSFqGAQJIiMRo/LMCtPMnYIuWbgT2SEguU0m1N9RrICZ6Zp4osCiHX8GTGcyGjZQvoDSBTA1O2dJQuq2QlYiN/JA6cxKisd9GHjTQO3eSMjkbG+FvQjBt4DjtIPyFpzJMHaQcIeAthsF2aKbBZQl6dPHkWsYQDxQ21OG56OoVftyDJe370pAKD+217xfKG2LY5wV/0zbS+cziQulDKF4DYMyq1Ihrn48NbvFOlxf5FpDVpA0f8d2RP7h1sEG75KSJVaFiP82rWKPDm+R8r2jDL1iFeMLDSuk637pte6BRcmGNugcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBd6anyJW1ann0UWdRaq1cQ8X8lRRQ2abDRfs2Lf9b4=;
 b=R0namPYdJr+gem/0+HLwOawlltTetrnt01ysLMnENoUoPYJd2x9Ej/UUBlEtP7rrB7eLUwNe+gvCH2LREzgICMJdvvt2tc/7NivXyamxY4KMVHTyOk2mtd96UlqpYZ7wleBBXpl9Pu9mAjQzUR5wwsaSjsvGs82N9tpVbF4/v2M=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 3/4] tools/misra: fix skipped rule numbers
Thread-Topic: [PATCH 3/4] tools/misra: fix skipped rule numbers
Thread-Index: AQHZAzNHmn5ClVb9v0W1JXlG6nXFZ65WlJMAgACXfQCAAPYzgIAAxysA
Date: Thu, 1 Dec 2022 11:27:39 +0000
Message-ID: <677D59B8-839D-4C43-8546-67B2D1C887E6@arm.com>
References: <20221128141006.8719-1-luca.fancellu@arm.com>
 <20221128141006.8719-4-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2211291545420.4039@ubuntu-linux-20-04-desktop>
 <21F6A61B-1476-49A7-8726-7F94BBA627F6@arm.com>
 <alpine.DEB.2.22.394.2211301534190.4039@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2211301534190.4039@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR08MB3749:EE_|VE1PR08MB5629:EE_
x-ms-office365-filtering-correlation-id: 6faaf4ae-84ea-43ca-5b98-08dad38f0dc4
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Q7JIx4v9zt5LUtbT4SiDqv33t6pC/dCV2FUSGb7yjX1gpwcgL2x9O+7K4Xwr/aGbmmRwFb6obNcVPvcMi+kTL8au4s0Mh95Q1z/KbmJL51XAkXgogPKytZNbwTfYnSRcOxByXPWDal8mKL/3VyhDXpE9S62PoVldvTpzzIg4VgPuHMQzgeWx95K42qimT7DT/LC0Bv0cxDCCZyMk7pf37SF/T92sLXHEP/wxTNCJLwUmbLLBsdwl0ZUh5ahOFtCR5VbgM+yY0f/L4jbwPnOGzdzr1b4PKEV+dk/08rU28+BIVGYUVR2o0BmOtdl5AA/fvmfa+g2UGjvk6cRKhZNwb+aXOjd0rjxmMsIp4spnXem9H/Bkgbr6JRbBdTEWI/vqNuV2Ot2Z0/APi7skyug/LL3QE3OVgAcceqUYNzKddkuE9zkXG6/cxG0YTUCkxnXe39uPdVdFFdRg26FK+H1wLqsTNSbrbmmTLkajM/dsrsdEXhMp+ny8zl4R/dd0mKrgLedm7fRMtbvr2PRV4+QodgQ3s0zFrQzHDKtt73N5eQ6YB4mVmARXOpJnwbEjo6BXlYE3LEl8/gR4VXjB+2YP6vsE6Axwu24/rBYR5Cbu+KZr1UmZcmhNS+VgHNx6QciiIIV0IUEWPpCRJE5jeEvdm7rZtlAiQiIROxa5sCmmqMIDry6RzIQfVH51q7fDGZd/IUPP/zvjB0ViDjX0UDKUUDSiFMan8SegzPJVNZk8Imw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39850400004)(136003)(346002)(396003)(376002)(451199015)(478600001)(2906002)(83380400001)(6486002)(38100700002)(5660300002)(54906003)(6916009)(122000001)(38070700005)(8936002)(66476007)(36756003)(4326008)(2616005)(41300700001)(66946007)(66556008)(8676002)(71200400001)(64756008)(86362001)(66446008)(6512007)(91956017)(33656002)(186003)(316002)(76116006)(26005)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?J3MSPrVePpwpEqmrM4H/wSORl4RKIMnKxfFpDir2x6HYEIxpdL22foLA6PVW?=
 =?us-ascii?Q?JmiY9y6iPJLq1Yp2peTltaNWPTOCM0XAV+qVO7PFmhKopnetkWHCGWBRVJLM?=
 =?us-ascii?Q?lAZcn4dafLNVdCfc0Z9Z8Imum1ixdr0ksHihLLUv0D/ULuNPc/74jNgtpQKZ?=
 =?us-ascii?Q?nj9XQBXkGs40hgHiElzQn05aU7VtWHyhbTz9KVKt+CujJyNrwDUpgRsoNybQ?=
 =?us-ascii?Q?IH72Mnd252LDSe21N9RDFtwyoIKzKkSv+XTISPadUwc+gtlj3rTC8KOO4tFy?=
 =?us-ascii?Q?XF8+8aKHFHxCL6sZFlST7z31FnZMLdGm+PBoEMUk4UOZwJQbTYD4opxlBEvo?=
 =?us-ascii?Q?zFeCU3il7nql+/FbKTSDAGNQoVts/mL7RMbphdO572DouY8v8Kzms6pY0Jyw?=
 =?us-ascii?Q?Cu4jO2kCMl+FKL466OW8L2HpVJruBiSMCpYQpCm/QWU+vhW6edC5xCwPiJpJ?=
 =?us-ascii?Q?wXoDaMTS5vo2ZyDasu3pMVUC6ypu7VlC9WakKGed2UvLoaWw4UUGCw5z6fVS?=
 =?us-ascii?Q?39Eo9JPrFRp6//gYXv9/ANKxs75SFENrckx2k7uFCm8/XPLbV7bG74r3k6cc?=
 =?us-ascii?Q?K/zsjAGq5/kztm8e/kCRFueSx08RrAIqAbtq+wJYf96Bp94cn0T/8N6tmD5Q?=
 =?us-ascii?Q?IZFDm4uwVqwnQJehASubal22B/Ic5ojg+swJwYNww3PM+0ZZWj/2nBUmdSUG?=
 =?us-ascii?Q?iN+7oOI5vpzyUIGxUHyCZNjW7ZgsvgB2Qchx4J0xTzwNwqaBEHyNWbvhCTbw?=
 =?us-ascii?Q?oT7gRIqdbuxSrsjkexcDWztEBTxJu7sNBP90lDBa+fuqEsy1tkr4ZKMIi2Rq?=
 =?us-ascii?Q?+oGPmaouh1r4bZqqqPWB9fPrNiH2kwxAcNcqCXrxLeiSE5rlHYuNYcZd+6pF?=
 =?us-ascii?Q?QApTCb1WOqcVwYd0VheP3PKI2XwSCTQYW4i/NRpBIxbqldKolvrFB3buBuEx?=
 =?us-ascii?Q?J2j1APELx5oT6cqQzUizcII4BQb9dPoNGJJhUchpA+btX1BPncrqsd8LWkNq?=
 =?us-ascii?Q?kuumefubXvhlhwac/49F3aBrdCd9dqdcsi52aTRg8UKQhlh51eOj/lyKaYe5?=
 =?us-ascii?Q?uEx/M9XatmQlDrT8PamufqfOED0qKjzOCHHcJApUd/OZVwr5CdHKRPsQdwCB?=
 =?us-ascii?Q?FK7jCjz2RCZOUpFftkNIHu6QwhdMJ6RKqF0fp9bmrpO9/NKoBAxA7CWvf5/S?=
 =?us-ascii?Q?I194d6OafP1P3UP/QVNj3trZlHbUrn4zPDfDP0QVHQoMpYTrS2Gn4z+Wd1KV?=
 =?us-ascii?Q?CEazqHCQe3sfXStKYeCfqNjw/dMgIMnlq/dyyLnTitmjnFGRQBvvA34uU/a+?=
 =?us-ascii?Q?EnDsy4ird7QDNltoj5MTGBXUn/K0yYcVKdWTk0gSJDVguPG884f7PBXigp9x?=
 =?us-ascii?Q?wc4wqVuZ5cTvmCH5HwS6RQL27XGP5rBVL+KGxW3+aXS5ZIx/2+C2vnywOHVF?=
 =?us-ascii?Q?v2m8KEusaYyL08eV1jUJnDcm9YkPYtjCNz6t/oEVgns1fuxMpDPxamgo9K5E?=
 =?us-ascii?Q?/p8VLmO71AWGbok+IHAcEdkwH8WYniqwGDTTG9GOMRxjOjyv5OmGBrxdzhrE?=
 =?us-ascii?Q?PGWMpVc3bGpWfwQmeE3hArF9J6Y1L8DsPonx1HCPif6MLDbv4X5cmEav2htq?=
 =?us-ascii?Q?Hg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3F68A32C81B6BA4AADDBDBCA5451C6D2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3749.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6faaf4ae-84ea-43ca-5b98-08dad38f0dc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 11:27:39.0790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yvCk3WlvZ/jdqMH250QB3PJbsWCjWYHRc/CFs8qq+QrMvnFlHIp/EGgx8qVWMFXgmAubu/+K4tCVhrgkxnUcqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5629


>>=20
>> Hi Stefano,
>>=20
>> MISRA rules are in this format X.Y, misra_c2012_rules is a dictionary wh=
ere the key is=20
>> X and the value is the maximum number that Y can have.
>>=20
>> For example rule 13.Y goes from 13.1 to 13.6 (in the dictionary misra_c2=
012_rules[13] =3D=3D 6),
>> so the code can now check which among (13.1 .. 13.6) is not in the rule_=
list and add it to the
>> list of skipped rules.
>>=20
>> Here an example:
>> {
>>    "script": "misra.py",
>>    "args": [
>>      "--rule-texts=3D/path/to/cppcheck-misra.txt",
>>      "--suppress-rules=3D1.1,1.2,1.4,2.2,2.3,2.4,2.5,2.6,2.7,3.1,4.1,4.2=
,5.5,5.6,5.7,5.8,5.9,6.1,7.1,7.2,7.3,7.4,8.2,8.3,8.7,8.9,8.11,8.13,8.14,9.3=
,9.4,9.5,10.1,10.2,10.3,10.4,10.5,10.6,10.7,10.8,11.1,11.2,11.3,11.4,11.5,1=
1.6,11.7,11.8,11.9,12.1,12.2,12.3,12.4,12.5,13.1,13.2,13.3,13.4,13.5,14.2,1=
4.3,14.4,15.1,15.2,15.3,15.4,15.5,15.6,15.7,16.1,16.2,16.3,16.4,16.5,16.6,1=
7.1,17.2,17.5,17.6,17.7,17.8,18.1,18.2,18.3,18.4,18.5,18.6,18.7,18.8,19.1,1=
9.2,20.1,20.2,20.3,20.4,20.5,20.6,20.8,20.9,20.10,20.11,20.12,21.1,21.2,21.=
3,21.4,21.5,21.6,21.7,21.8,21.9,21.10,21.11,21.12,21.13,21.14,21.15,21.16,2=
1.17,21.18,21.19,21.20,21.21,22.1,22.2,22.3,22.4,22.5,22.6,22.7,22.8,22.9,2=
2.10"
>>    ]
>> }
>>=20
>> So this patch is solving two issues, the first one was that rule 22.Y wa=
s never included in the suppressed
>> list because range(1,22) produces a range in [1..21], the second issue i=
s that the code was producing
>> Invalid MISRA C 2012 rules, for example 1.21 and so on.
>=20
> I see, that makes sense. Please improve the commit message with this
> information and add
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thank you,

If you agree, I will change the commit message to be this one:

MISRA rules are in the format Rule X.Y, currently the script
convert_misra_doc.py is using two nested loop through range(1,22) to
enumerate rules that needs to be skipped, using combination of X.Y in
that range, however there are two issues in the code:
 - rule 22 is never included because the range(1,22) produces a range=20
   in [1..21]
 - the second issue is that the code is producing invalid MISRA C 2012
   rules, for example 1.21 and so on

Fix the issue using a dictionary that list the rules in misra c2012.



