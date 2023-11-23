Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9068D7F5525
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 01:07:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639330.996556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5xFd-0008Hm-Li; Thu, 23 Nov 2023 00:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639330.996556; Thu, 23 Nov 2023 00:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5xFd-0008G7-Iv; Thu, 23 Nov 2023 00:07:25 +0000
Received: by outflank-mailman (input) for mailman id 639330;
 Thu, 23 Nov 2023 00:07:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0YW=HE=epam.com=prvs=5691553e4c=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r5xFc-0008Ec-8c
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 00:07:24 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 455be179-8994-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 01:07:21 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AMND41O007335; Thu, 23 Nov 2023 00:07:11 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uhskk871k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Nov 2023 00:07:10 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6355.eurprd03.prod.outlook.com (2603:10a6:20b:1bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 00:07:06 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 00:07:06 +0000
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
X-Inumbo-ID: 455be179-8994-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ki+U89V9lBuAtgGNS0PyrMm+5kiw/9ol/U+NXsrvTgG482gsA6aAQKMXJfhzyaazocZPQMc+IFQOQuffDpmBzHDtTpmydbYrOpIO4/DER6v5USce/NXgYsVdi0xWJRUBy0sIBC0hd9l+2blnM119pV/GPvAQnGyJaNk5NF/yBAePEL7kW1z3Hh/tDquJtQjo29p1K6Tx9pEw0HMbWPUztDJDQB3+MD4Ab3ZO8RK+7PdmoBGa9oU77VZPm5PgefUs1oXc1k68y4gx/WdAnojm78ewMh5eL22KHOMJh0X7shDXloq5ZAX61qcTfN1HDusYrlQRVhv7b+nFbsWK72kfQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aeBgurwzJIVKzksG+i2JHwRalCI7Eg7CX0LOmESiZ3o=;
 b=MZHZ6ji4bzjAXa/qxJegnVgS7h7xflOuDv4cSxlFUOSfGmtY/cOaV3GvCTgD2AoLP0c4pEBaXJv/kX9LRydUgWNzYEws1m62dvp93cW9BoEcM5bZxws4pShFmBcaLcNmQz07VHQm/ynOBgd5cyJmBMU5psF4kJceTL7o6Xb1qxUQl7AoaayhT2Jkpokn7r6Akk0oDB/P1dxvOVAkwEmth/l2jEyRnrjutlzHgWOho7acw0EyJvrArpsoMeP6Jj6BoJTickiI5wnDvEekjf+Js59R126/aTTKb49BqreQcfOU8rsdPzVfidCwT0NSS17T96poShytjZ6k8TO4vZ+8RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeBgurwzJIVKzksG+i2JHwRalCI7Eg7CX0LOmESiZ3o=;
 b=siM+hNW0oSVSfeJdh0k2WhwDzwZtNbiK6kxg3ALr/F+XYmdtOp6w2Y2j6uEfH/kZrp9WMPgvuHfh69pSfGYFcAFLp8Rz6P39fE00AHK/R0+OQFiqvBBS+ppIRjFknY1ahEM6O66PcEwc/W80Wu4QtU+HXRAubZXWpD+HXbzjXxYNmfth1h48N4ARPzuU827o432M86BBv9SuXk3b1y9lMR0+t3R3nxt9Cydr5xLuf3MfwDh6dG6M13KWjhHoW00QsTUe7nXmitnRaWSf9Y3xltsgOLkXAGCd9zgP+g4QFib0iT0CmDeSt1VxJw3YLRgIu+Ce+z7xJbFx2DTLO3/SnA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        David Woodhouse
	<dwmw2@infradead.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        David Woodhouse
	<dwmw2@infradead.org>, "paul@xen.org" <paul@xen.org>,
        "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>,
        Julien Grall <julien@xen.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Thread-Topic: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Thread-Index: 
 AQHaHMeIsCU+MAEGAkSnPoa9ThBNz7CGlGOAgABYsYCAAAmAgIAAAakAgAAAyoCAAAJ4gIAABwqAgAAFCoA=
Date: Thu, 23 Nov 2023 00:07:05 +0000
Message-ID: <87cyw1z61i.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-5-volodymyr_babchuk@epam.com>
 <b04daedc-ba6a-4109-8e23-fbcd023bcfec@xen.org>
 <alpine.DEB.2.22.394.2311221428570.2053963@ubuntu-linux-20-04-desktop>
 <ce719f35e72a9387fc04af098e6d688f9bbdca4e.camel@infradead.org>
 <alpine.DEB.2.22.394.2311221508270.2424505@ubuntu-linux-20-04-desktop>
 <a4e6a62a7cfe756344a1efcb8b2c3cfb1e50817e.camel@infradead.org>
 <alpine.DEB.2.22.394.2311221515010.2424505@ubuntu-linux-20-04-desktop>
 <87r0khz6zj.fsf@epam.com>
In-Reply-To: <87r0khz6zj.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6355:EE_
x-ms-office365-filtering-correlation-id: 9a593823-a6d6-4cbe-f43d-08dbebb820b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4XLcUYP8KoeAx4BJeJnfZR5n/7rNs+5SqIQUQaLsTfvaZJ2N0NBizDZEhq8qByog80bj5q1PD6Ynoo1jPEDUxCm8Me1QgY+mQbrWxm7d1cKDVtmmCFk8JuLTlK7a6oB142SPmHFgbzQ2R5BzOHvive3k3Qgajxyz50J8exwNDfe+I0S7PL8RJO4y7u1U9CLl3xWk4kkt1NAIdqXJ91VTtln0BAS/+F175eSG0qLzBJ5ZWM79vF2+XHd0vUOXrKxeYK6T2qhLtKyscPKpjcvA3gmYCU8KklKZHinqvd5U31kF7tOe2FcSmBL4kknbV6O5NvEKKl7uL+8qw8ZP0s532a0Pfbnm/N5JMhaiXNB1lMcFyPxHzvVo6wjGGFKVSLfnKh86g+m8QK15xeksX/tZq2rFE0SVKQNBuIsaxoIaU6CwhLHNmC8cPzplgUprUQBXV0WOhpOiIC48/p3alb+yk9UG5o8FUUHe0j1HVaV9T/WgXjoXDmjTggWLw+a8VujZ8KROq5EKzK+xF0OMeYvn5xNcSUFTatEUdfLEjXZMPZsoM8eAUY8Ue31KA3z4pl+iGT/53YzdfJyIOvFbx4YwKv2fQFPB0TUgOfn9wwC4u92QTzZCyHf8zyfQf9/v73l3
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38070700009)(66899024)(66556008)(110136005)(91956017)(76116006)(66476007)(66446008)(66946007)(36756003)(122000001)(86362001)(38100700002)(71200400001)(6512007)(53546011)(2616005)(55236004)(26005)(478600001)(4001150100001)(2906002)(316002)(64756008)(54906003)(6486002)(8676002)(5660300002)(4326008)(8936002)(6506007)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?qHvEQXYJW9uNvS56grSyBL4VX24iLOPTo7h+iFsSNaAeGFBktpjvjSmvg5?=
 =?iso-8859-1?Q?8QwfnHbF1zSTlo8w9IQJ/7pXAwTzYmhorrHN0RmtjJ+lMa704gm7ywxoKp?=
 =?iso-8859-1?Q?LnESPsRzeGzrLMwP0Cg8k/VvjjTqAdhFZZuW46kRpqiqROU+HC7X1nIXWR?=
 =?iso-8859-1?Q?f3/RbgCY5w105Ne/1jONFc/f0R1lzHkHZ5Ucev5SOObnKEKDX25k+NyhMU?=
 =?iso-8859-1?Q?6P3UYvk+aI+FM00fCx+optlnbFNFAbLTwkC3DVnXcvgwC0kfmDC/1kMGUV?=
 =?iso-8859-1?Q?LM1zQ+Jqemt4Y02xP4KX270AtDNRk7iW+P5bgR65X+bQEPrtzKkH29kZBL?=
 =?iso-8859-1?Q?+b9/BzunWAgfb/fDRL0fQIIclTZ4xeqJCShtQEzwNVYwCiWFLqE3CJBlp4?=
 =?iso-8859-1?Q?iiOxUW2XhNqwHtImX6z/jleZZJopdcMh/Ra20MlVA0M8/78jRpe3IDCc4E?=
 =?iso-8859-1?Q?/F8vZx4qfKcui09tS/K3pcQzEoJXvLv7fpl3S+YcEnXNc0WStgWHB/x/U9?=
 =?iso-8859-1?Q?ySakzgqdVai1ZCKfJVaWPze7KYAqZa7gO28E+cdoq+UGkIalsho99ufiS9?=
 =?iso-8859-1?Q?ph4fwGQkJ6Bct0mNqrCSeyO0iFitEVAfw5WK2JlUAVvL5uwg5HR9TesIpI?=
 =?iso-8859-1?Q?VhOa5CILL2opfOHYEnycDgu3Kh3xJiDigeGbVdLBDLkM7ztFU2o7O08ca5?=
 =?iso-8859-1?Q?K/qpqMjq7NehDjwbI4+CIREiBLPW7fFyeI2x+ROJQ4vSdFAnTKILMFhPqk?=
 =?iso-8859-1?Q?pAtCvSsY1ImPZl8sol9lHP6LGuAYRJuGPAYC/O1reun1YMMsrFZniikRUO?=
 =?iso-8859-1?Q?NobLJ8DfpqaDXiwtx5PoaV7gZqVU4fDdMceK+OflzsiAokejPbs7pATpOh?=
 =?iso-8859-1?Q?2vi5J666z5rDX1ZIJOv+ML31ym3ejuOGqH0MAm46qEpJjkvgfelwy0b2OD?=
 =?iso-8859-1?Q?a8238vf/3xkfalw1G1M0xKQKmUmdcvr7V+vj67yK4kwDrDifl7ycaFQ5yw?=
 =?iso-8859-1?Q?s4HCbClYIIsukfse/M2qOZ6N54fm1vvCnePofGlKJJD4cd8Ms0kukSCby4?=
 =?iso-8859-1?Q?hZIfTW0ePHKtcr+n3tXeaX215XF3h2vflVO7/kB1PT2k3aTDgD9PM7R4Oc?=
 =?iso-8859-1?Q?VF9U+h6CnCGT1t0yNv1dBZzgK0cLFlPj+//oTTm/HULVngDsVvqKSTLSWv?=
 =?iso-8859-1?Q?s51v+iqW9lFWAV9iIIMjM2fPFtp8+vFF/gIDQAOlys8jtaAtIxpGNtXRw0?=
 =?iso-8859-1?Q?34AhAgt86StVCNmXW5Cd5k3BA/IVYGldY22mb5e5JS8twrsB3VnoI1XOGx?=
 =?iso-8859-1?Q?RHhHicJj/Lx3Cs3TJoGPkPnci1dlqc7q4Vu3Hb+TmzO2B/myWnRnuGDIn3?=
 =?iso-8859-1?Q?lj26TawF7JwCpkuZEJWCICKsCltw2sBsg2Qn0+mIP7ycQCGvLy2OG97TgD?=
 =?iso-8859-1?Q?0JyuIPW89Dpdaw1iP0P8RbJ0vJFTeBi/t9zwz1br/lsM2XWh5vFUlYYcCY?=
 =?iso-8859-1?Q?sZzMRHoxlZHnNVAArDY/tG9CPDL5NVft6HRO0V19PKsiqBzSFgQjwYLXhd?=
 =?iso-8859-1?Q?QtlaDUSaoDOZoKDOpAqcsGqAZQxiXQfIBs+cT2J7mq9lj27Fe2Bqf9itqy?=
 =?iso-8859-1?Q?13kkN2rYNqozmjQqF7U+krlbqS/MpFVGhV6n93uyqqmYWYBj6bso2yNA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a593823-a6d6-4cbe-f43d-08dbebb820b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 00:07:05.8606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+tjS9UmsO92W6qfBgHRI72LOuBLb1zN5WLVSrZ9+P1Lygepq78wJsuR8QQF8bm9Xy+aUHufEpD/mPySwOoUWYwfOAmFDxnHl61etxFSS1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6355
X-Proofpoint-GUID: 6JghHvzg4kpcd9DRRDrlsfdEpn6n3OPA
X-Proofpoint-ORIG-GUID: 6JghHvzg4kpcd9DRRDrlsfdEpn6n3OPA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_18,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220177


Hi,

Volodymyr Babchuk <volodymyr_babchuk@epam.com> writes:

> Hi Stefano,
>
> Stefano Stabellini <sstabellini@kernel.org> writes:
>
>> On Wed, 22 Nov 2023, David Woodhouse wrote:
>>> On Wed, 2023-11-22 at 15:09 -0800, Stefano Stabellini wrote:
>>> > On Wed, 22 Nov 2023, David Woodhouse wrote:
>>> > > On Wed, 2023-11-22 at 14:29 -0800, Stefano Stabellini wrote:
>>> > > > On Wed, 22 Nov 2023, Paul Durrant wrote:
>>> > > > > On 21/11/2023 22:10, Volodymyr Babchuk wrote:
>>> > > > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> > > > > >=20
>>> > > > > > Instead of forcing the owner to domid 0, use XS_PRESERVE_OWNE=
R to
>>> > > > > > inherit the owner of the directory.
>>> > > > >=20
>>> > > > > Ah... so that's why the previous patch is there.
>>> > > > >=20
>>> > > > > This is not the right way to fix it. The QEMU Xen support is *a=
ssuming* that
>>> > > > > QEMU is either running in, or emulating, dom0. In the emulation=
 case this is
>>> > > > > probably fine, but the 'real Xen' case it should be using the c=
orrect domid
>>> > > > > for node creation. I guess this could either be supplied on the=
 command line
>>> > > > > or discerned by reading the local domain 'domid' node.
>>> > > >=20
>>> > > > yes, it should be passed as command line option to QEMU
>>> > >=20
>>> > > I'm not sure I like the idea of a command line option for something
>>> > > which QEMU could discover for itself.
>>> >=20
>>> > That's fine too. I meant to say "yes, as far as I know the toolstack
>>> > passes the domid to QEMU as a command line option today".
>>>=20
>>> The -xen-domid argument on the QEMU command line today is the *guest*
>>> domain ID, not the domain ID in which QEMU itself is running.
>>>=20
>>> Or were you thinking of something different?
>>
>> Ops, you are right and I understand your comment better now. The backend
>> domid is not on the command line but it should be discoverable (on
>> xenstore if I remember right).
>
> Yes, it is just "~/domid". I'll add a function that reads it.

Just a quick question to QEMU folks: is it better to add a global
variable where we will store own Domain ID or it will be okay to read
domid from Xenstore every time we need it?

If global variable variant is better, what is proffered place to define
this variable? system/globals.c ?

--=20
WBR, Volodymyr=

