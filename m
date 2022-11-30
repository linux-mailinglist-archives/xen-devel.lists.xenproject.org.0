Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F7263D98C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 16:37:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449957.707017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0P8K-0003Ki-Kh; Wed, 30 Nov 2022 15:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449957.707017; Wed, 30 Nov 2022 15:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0P8K-0003IM-Hs; Wed, 30 Nov 2022 15:36:24 +0000
Received: by outflank-mailman (input) for mailman id 449957;
 Wed, 30 Nov 2022 15:36:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jz7r=36=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1p0P8I-0003IG-Dk
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 15:36:22 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bca3f97a-70c4-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 16:36:20 +0100 (CET)
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8899.eurprd08.prod.outlook.com (2603:10a6:20b:5b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 30 Nov
 2022 15:36:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5880.008; Wed, 30 Nov 2022
 15:36:17 +0000
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
X-Inumbo-ID: bca3f97a-70c4-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSoTiLcoIkt1NMCLEwtwt1lv4pKil5mTv96diNvMKFqSpUvEO6oVw+yNJtxDgAxk2RQXAKOvdNzF0l39mGlO4KoFCFVH3WgaEbiZc5kkYMUSzAoVzvpQ5kGo+eoEKNxA8xaMQMl2Swgmm6JSFrGq8dpJJr40aVIbZ+gJxCTo1CODm4tdOsnV/+AfqUo75zgaqr/8akrMUsNZ1rTfmuTOOifEGOOY/bxYVZ+qaqnHR2Bf9SV+ljN963pYIBKvwsNCPZFT9e1Hc+co2+ew3b4dalAbL+f0eM+GgSu83IWvoe73ph0SWTjUX3q8ozyg+vGFYICOPXSLEYiK3pk+9kkd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bepxMMEEnDWs2olTHgnFgMjnFmMkMh2OKKHr5pkSSzM=;
 b=huBTy8jimj9cjb95EOhxgT3KMYHRctO+vCfOuNc3V0sBzo1vxaeTc9MVZHAW5x3IKbUufOhriE6Ppd7E4f6l+VWkeEH1zXwPqFw4TKBejvrUOjQlDmlRw6NrXD+iq7O8sh4VEk3fl6392u/PBCcAAkZw7EJGPC5GHFgeBiJWeE+Q8b3XmiHcyEk/9PSaujOfJbK1wbweZZLLlpDIiaukb3ASMw9g3XVMYKidwiInWHbBpRtOxp1fFu50GKg1dzvX5Q3aOWnjvbDxGQ7vrULptzuuaYXrHFYcwpmwuX/KLBcy6r1/RADMzkIOe7O+gn0dSPjHtyX9jYTvGx2yZcLxvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bepxMMEEnDWs2olTHgnFgMjnFmMkMh2OKKHr5pkSSzM=;
 b=yJYXKS01e5Ymw4KytnDIrlh95zcGuqnsskdnN8HL8TfSHHNqnVeyxRf4BMhEREHqDjpsNrSKR1b1s0SRcg+q73h58KR9PP+9SEdEoOq2iMpCEzgs9TVE2FAeqaO5nRD0rsEIH8QCORzPHGwL4UGsXEWxDHKmiLVPM/a2vzSVEkk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 3/3] automation: Add CI test jobs for Yocto
Thread-Topic: [PATCH v5 3/3] automation: Add CI test jobs for Yocto
Thread-Index: AQHZBLWHjw1n6cWydUSV320FMd2tla5XbqkAgAAi7oCAAARRAIAAA6UA
Date: Wed, 30 Nov 2022 15:36:17 +0000
Message-ID: <EB813F87-8B8B-4E4B-A99B-6B6FD6714B6D@arm.com>
References: <cover.1669810269.git.bertrand.marquis@arm.com>
 <e64015d3e8682d068223e94f3bfc8ad823b27a65.1669810269.git.bertrand.marquis@arm.com>
 <e453dd21-5fbd-5edd-2269-29c72a70299f@amd.com>
 <C03FF185-AAC7-4E06-8505-876BC17F800B@arm.com>
 <7310c943-4402-745e-c012-077f7c520c2a@amd.com>
In-Reply-To: <7310c943-4402-745e-c012-077f7c520c2a@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR08MB3784:EE_|AS8PR08MB8899:EE_
x-ms-office365-filtering-correlation-id: 1dde8047-276a-4756-e3e4-08dad2e89f76
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9KKtdtKjdPNTYgzKT1RdASuSWYSHlfqSj58X/ap6ZkVdsKIbTu3dpMUqG4YFMfLWl88j7E5Ou9z0ekHlvJ3MT3oLHI1bPB2R3t3sycAWCASnCcxP9ZcqbPGzS6+qumXcostCvl3xneGkJgMp6nCqO1ECdeYyiRWgKuJxJCoLZBXJRftLUORSG5ZAFduzPh0/f7mxaMQnOFYcztf6mQOfzRZKsN+eV99II+ujxj2wxL8oKp7ltHPlgMKrFzBthu/Xrx0SVQW+UYrDz8GC4NA49LHK557QcEPTFLswmzCIebeQDWOO2zVSWGwKIM1RunbDxZTBlGpI+AqBcHneC5IZecEv0x094CfSQMXwB2ibXXGtYJ/1RInsuNbeiKmiH2voxWuDxLWBdDdTCo/g69iy/PusXjwjLwyaaVO+zNAW2R8S62sc3TeIwWPJOHwOr1s3P0KdcgRRZZQEPgwzGCA+Dc7lxJbUr/tfy7C19bv9M1PrmthC3VmD8EINYK95xKLcHg19iA/C0UzYGW6HhJ7JhDp1fZYsnfGSUzvj3tx/J2pd118u2pcYHyzXVD27s9XqotWsvy4kLG7SPa5Z057ByT6/s0gHF9AoSX5eQiWZ08ih6IIhIbZIunQ6vaRRj7y6eLPxL3iC0I7GYOh+K/UJdwxkWi8cBg7+yFaSEmvLRqzJGGJXJGl9B9dAJX9dptX6XZoZgLywAmruvMaMgLHcWf+YUrKfq0XTwHaqWtAaFuQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199015)(38070700005)(33656002)(36756003)(86362001)(6916009)(54906003)(316002)(6486002)(71200400001)(478600001)(91956017)(2906002)(66556008)(66476007)(76116006)(66946007)(64756008)(41300700001)(8676002)(5660300002)(66446008)(4326008)(8936002)(38100700002)(122000001)(6506007)(53546011)(26005)(6512007)(186003)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yG/L0XLrpzh3ZQ8rI1lwH/jhOcPY6o82gFZwz8KMckT8ota2221WOB50BO4a?=
 =?us-ascii?Q?ZKvHjpPuJf9WmR9qN6ieopzoJMHwU6gRcwS2rwAO1x7V+a2BpJoEP0tGGLbR?=
 =?us-ascii?Q?t44XjZmFYSuqv78DAB0mmqFSga9hIZP5hwSkNglIJ1+g1c+BMamdS70L6KmC?=
 =?us-ascii?Q?NVx/FIvzYijOvMJNd8cZPoaoVE6hAEeG1OCeK5SnInKnPqJ4GRfLfzZpZMHJ?=
 =?us-ascii?Q?lRe9evU4nMnn/MNxI27lecRQFDuGtVrlr2qRJeFVr2lt3FMTHIgqFVUuhPS6?=
 =?us-ascii?Q?15lI4w2R5Ib9PxfitFvwvvHj67gg8BlwYzNpfMiQKXaQocgjC2N0SiJdkuAQ?=
 =?us-ascii?Q?SeHnI93zGEZFEzkaNDTX4NOqKbWCFxciCEOsqwJrTGbYCfjib14/0KgkAGg8?=
 =?us-ascii?Q?aDHHgLQg1bImCZvb7WxR7U4NJiNpqgzP3No6M38/MTXx4RgFpUMX0fhM+Qn3?=
 =?us-ascii?Q?x2zAkyJC60DoD3jzWPDok3ZNqwPwLR3KsoV2kGrvHlBBqO75pGHW/rAXPEKH?=
 =?us-ascii?Q?O0MQylFvgc8H2ryFt0Jij4sPI71hy+MjHkBXaCw1RUYuPATiZC9gv3q6wvw8?=
 =?us-ascii?Q?eloob17US6BKcb9o3CMQ1egcw070aN8NdW5VQprewiwmovO2ZLVnc6qZ4L93?=
 =?us-ascii?Q?2gCbcjxofm8f86nM10DqWT3+aUo98tn5gHohkqpIxb9IakOybJ6hwHdWygz4?=
 =?us-ascii?Q?zw7uCseK7X38zwBGDerEvldrMsv5h3+fRJNqLuwy8LE74a4rAdzlE+vVsJYg?=
 =?us-ascii?Q?Tbid+d6BinIH5mEmGHoEtH97qTJT97h1cigBh5jCjbdCbBO5po89OB5zz1Ew?=
 =?us-ascii?Q?+LyGEZ1G0qGchYa+2HYUknvN3MfHiLATRbuAREa1KwKvC996can13zLCLXqz?=
 =?us-ascii?Q?0y6UWM9i8bs5qzNA29kSWnDcjWrkdnS/SbMR6U3uW9PEGBq+M/Fh9Gos9wSb?=
 =?us-ascii?Q?vg1BQFJPkoulEzRDt3rxO66Ad0W1dzP6p7PqRr8k4//C10nbENRUMLJeSP0e?=
 =?us-ascii?Q?Ij4VC/MkBzGTYuMaf0mPWnCQRMXlWlCeeCayqmmQ1XBryazAnLUwWlxSpMSi?=
 =?us-ascii?Q?KKRWgrNhMAryCYARD8TJR+LhdzMR29kEkaodnD4jJWZRIhuyfyC+xzVspK+/?=
 =?us-ascii?Q?lzpMN/hZ3jRwPPJRoUWP8MnL3lR1L2WEpBQw8z5wR3AefzN8vrUwsmU3vF2O?=
 =?us-ascii?Q?iERkQwwF2F7GAV4wJfemkwjJtBT4YvFVwmzeC7Z9/xwA95jbFTuz+IeDLaMP?=
 =?us-ascii?Q?bjbaJtBd24voomnR5RctvK/E7ibjMcPhcGBXI4tZ+4E2Qta7KoWqQvE27wiq?=
 =?us-ascii?Q?Wj8wlz79rqj6deyAuJegLpq1qaaR73AfPScnl2VlbZqBmGCo22QYLu5pcUK0?=
 =?us-ascii?Q?a+sazl4kMXuSqVne+ELcXc50UI9TW0KsmEfUI3fTfrv50tGVSkGa1+I1JkaF?=
 =?us-ascii?Q?aiw4vJEKHaMOKbkWHzR3hFtFQM5yK49dmBjMf0TdVKlWmEMZUIHaJTUxHG59?=
 =?us-ascii?Q?E0ZXl1xxZ3R0tjobJpMUA+OOmvNR5URPewZ2M/XTVq+MX/wwQ5fYYzvao/7e?=
 =?us-ascii?Q?JDP8Rg2Se1svUyiE5ilJc4dYbBwIJx747QpJkbChsJM6ssG38BLDmVqtLCw2?=
 =?us-ascii?Q?DA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6A9A2FED89D51143869A2BA322F92540@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3784.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dde8047-276a-4756-e3e4-08dad2e89f76
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 15:36:17.5336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X+HwLURCvGmiEz+v53gP03fDlLN/hQisDtlN4Ygrz03jBoz3hsie09TcUF9FbDiatcLW8eOEGzNDcp0ujMVrNZHJ5voFmXukB46GSA9ng4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8899

Hi Michal

> On 30 Nov 2022, at 15:23, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Bertrand,
>=20
> On 30/11/2022 16:07, Bertrand Marquis wrote:
>>=20
>>=20
>> Hi Michal,
>>=20
>>> On 30 Nov 2022, at 13:02, Michal Orzel <michal.orzel@amd.com> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> On 30/11/2022 13:15, Bertrand Marquis wrote:
>>>>=20
>>>>=20
>>>> From: Michal Orzel <michal.orzel@amd.com>
>>>>=20
>>>> Populate test jobs for Yocto based tests using the provided containers=
.
>>>> Due to the size restrictions, it is currently not possible to split th=
e
>>>> build and run tasks, therefore everything is done in a single step.
>>>>=20
>>>> Test jobs for the supported Yocto targets are generic to avoid the
>>>> necessity to add new ones after each Yocto release. The only thing
>>>> required to be changed after updating the containers is the variable
>>>> YOCTO_VERSION stored in a .yocto-test template.
>>>>=20
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>> Changes in v5:
>>>> - none
>>>> Changes in v4:
>>>> - add .yocto-test for arm64 and x86
>>>> - make yocto jobs use arm64 version
>>>> Changes in v3:
>>>> - patch added
>>>> ---
>>>> automation/gitlab-ci/test.yaml | 43 ++++++++++++++++++++++++++++++++++
>>>> 1 file changed, 43 insertions(+)
>>>>=20
>>>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/tes=
t.yaml
>>>> index c7e0078e04f1..6ce2fd63eee6 100644
>>>> --- a/automation/gitlab-ci/test.yaml
>>>> +++ b/automation/gitlab-ci/test.yaml
>>>> @@ -54,6 +54,33 @@
>>>>  tags:
>>>>    - x86_64
>>>>=20
>>>> +.yocto-test:
>>>> +  extends: .test-jobs-common
>>>> +  script:
>>>> +    - ./automation/build/yocto/build-yocto.sh -v --log-dir=3D./logs -=
-xen-dir=3D`pwd` ${YOCTO_BOARD}
>>>> +  variables:
>>>> +    YOCTO_VERSION: kirkstone
>>>> +    CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}-${YOCTO_HOST}
>>>> +  artifacts:
>>>> +    paths:
>>>> +      - 'logs/*'
>>>> +    when: always
>>>> +  needs: []
>>>> +
>>>> +.yocto-test-arm64:
>>>> +  extends: .yocto-test
>>>> +  variables:
>>>> +    YOCTO_HOST: arm64v8
>>>> +  tags:
>>>> +    - arm64
>>>> +
>>>> +.yocto-test-x86-64:
>>>> +  extends: .yocto-test
>>>> +  variables:
>>>> +    YOCTO_HOST: amd64
>>>> +  tags:
>>>> +    - x86_64
>>> This hidden job is not used by any yocto test job and as such can be mi=
sleading to others working on this file.
>>> So we can either remove it (can be easily reintroduced once we will fin=
d more x86 resources) or add a comment explaining why is it here.
>>=20
>> If I remove it then there is not reason to have something separated for =
arm64.
>> I will keep and add the following comment on top:
>> # This is not used by any test job as we only run Yocto on arm based mac=
hines
>> # Keep it here so that someone having x86 hardware can easily add jobs
>>=20
>> Would you be ok with that ?
> Yes, sure (+ add comma after end of sentence in multi line comments)

Will do.

Bertrand

>=20
>>=20
>> Cheers
>> Bertrand
>>=20
> ~Michal
>=20


