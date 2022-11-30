Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE4663D89C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 15:58:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449926.706969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0OWA-0004nG-Ma; Wed, 30 Nov 2022 14:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449926.706969; Wed, 30 Nov 2022 14:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0OWA-0004kc-Jn; Wed, 30 Nov 2022 14:56:58 +0000
Received: by outflank-mailman (input) for mailman id 449926;
 Wed, 30 Nov 2022 14:56:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jz7r=36=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1p0OW8-0004kW-R9
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 14:56:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b6e5bfa-70bf-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 15:56:56 +0100 (CET)
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAVPR08MB9529.eurprd08.prod.outlook.com (2603:10a6:102:315::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 30 Nov
 2022 14:56:53 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5880.008; Wed, 30 Nov 2022
 14:56:52 +0000
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
X-Inumbo-ID: 3b6e5bfa-70bf-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icGpsjTqIKB+KrJmOw1U417Hnh/gVwPSUG84sxeM6b7NCByt57IuTXICnJ1pH8JiD9q2/NlqSbvCGBsbORBoRxnHr/MfITFCtnnh21CdEkponPzM+tIATruRFXuKXdvGlSYj6ixZpM14r8u/jzyIKQM5ALocxMxeIJFu8gqtm0Txi+YpZHRU67nk4mw2liSU7X4PNXs8F3JNQubllDpGMWmpIkEnrmq6uTJBtq54XOSKk8npKsJW1Ti4PO/gAFkTq8PzlftIx1JufjHKp1UNPYsgsl2E9ZRgTbyQF4nUhjBarU0KVqRMoCjjdrbvYamvOay3pbBpqd40p05C1okxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PguNgRSJ73OSGU8nhMLC8EDFZ7GLXldEzRQtaMlxTRM=;
 b=U/tmSY/iDGUa8ToAa6SqxxmPo4ldHuqKbG3e/6BRe/z6hIPlv4AXc6gRs1KNKsZPsa1Zuz1gAI/JMcW2gtBJLocPYIxElQ0U1Ai5iSyw49PCXVvOZ8xfinT88PL0z2+vRGJnmMIheIOLzH5nndfByef9iknUumgKa0bNL/yAdEeSx/JSDCyDk+fOAJtPqIGlG1actwAU9we9z3fnIAj1EH9MdzZoYFje8jyVgFZaJLw81ptQUgfetqdi6M0p4nSWtoAoG4Stlld89GJwEUnh+juWwADOvWwE0UAX+SZ4CTecoocqjnR8O/Bw3XpHaqkBp2eQXlXYwVXn8GxSA74/VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PguNgRSJ73OSGU8nhMLC8EDFZ7GLXldEzRQtaMlxTRM=;
 b=ZkkMrflk4L9xhyH9PwQ563geADMInhN8FLuvDqCKJ713D0WaWyoFKwBoRr8fFeyTJscrWneVG1z38Lud7R/tGW8GiQN5NZGdwxSzcFRIY5HOszaiWNjWR+IL77KqreyxYboH2+O+JikbREKsWqNkP1u++YkrXzbeOdFFIgJ0sFU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 1/3] automation: Create Yocto docker images
Thread-Topic: [PATCH v5 1/3] automation: Create Yocto docker images
Thread-Index: AQHZBLWFmb3GO0y8oEy6bIpMhPppa65XdbOAgAAY1oA=
Date: Wed, 30 Nov 2022 14:56:52 +0000
Message-ID: <913CFB76-C7DB-4CC6-A1C1-4DDA0556FEC0@arm.com>
References: <cover.1669810269.git.bertrand.marquis@arm.com>
 <18861c0c9c547959900532e38df11b2d67f0a1cc.1669810269.git.bertrand.marquis@arm.com>
 <49d4c5e3-d853-605c-a87f-c90ccba1ab5d@amd.com>
In-Reply-To: <49d4c5e3-d853-605c-a87f-c90ccba1ab5d@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR08MB3784:EE_|PAVPR08MB9529:EE_
x-ms-office365-filtering-correlation-id: 60b9773c-9e1a-49a6-6986-08dad2e31dcd
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ZTtZDxmOK79G7fzp6nOt9TbS6KU00wnSESTspodepk8mEexVTr5sONHQZyvm48rdA8K2ubB9i18sohiyPzPhycGaCAlI/h8HH1dg9HCOYnXFT81nSZXHoUbZ0o01kpjwATqDLjEZhvmUq5Rx06Uev8++ydjmzLqQ/AwHlaimQw2/AbHWaWWztHBXGdKOSsk/JfQLWKPcGh6GLK5D/IuTayuWtX67G5qmVdx2M574Z6awcXqURrJIxKR195WyJtUh4XzrDouS0VP1NAxs0SWbHCazd+68JRfRCmpt/YVS5Q+ntw3dbH6/blLbieT9Gu1+bYtlntHkYILS5XUe+oiA/yI01RM09d5NaE6kUVlYesSVbakKEBjm1OcNP6o6w24yWlhj6DFBP/G8KsxhjTxweMe5CKJo4Xa2luKTa5Klrv/LYLJ8UFYJIox8SrscPlq4TfRcP0fmN+BZ8kXErgK57U2wP/q5x2AgVa+6+8xafcfZ/L0sMGyCwfpgPLiTmyjPpo0nvfDFBy4FwIBENs5NmMqIokHtgbfzX4RNuh/VDYwcwHIaiY2+aB7AoYdvBHFYS/N9aRL+ePw0NVwBZddYSmIrooAvkaMKAqOVTueHKmmFEYb+zBTklrqmLl1ehAhxUQyAcF9KKchdTKIMIqJHnv3uBMekO/6nt3oZtpYn90+NQhqYtVyJwLkxMh8RTwMpA7fkcj86jZD8xsFzHEaFL8NgvMXHsySy7TaJZ7ZhPuwyemfPB0tSwZba2Vy0qIvoRwQEg4b3UYrYxJyo/zN6ew==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199015)(53546011)(36756003)(478600001)(6506007)(122000001)(6486002)(71200400001)(41300700001)(38100700002)(66946007)(66556008)(33656002)(66446008)(8676002)(64756008)(26005)(6512007)(66476007)(91956017)(76116006)(86362001)(4326008)(316002)(6916009)(54906003)(38070700005)(5660300002)(8936002)(186003)(2616005)(83380400001)(2906002)(84970400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xsLmpkljxpYJ/eITF0WSEnrm8GwcvpaMRNo3aOcJUTviqygvXXvKyX7HvSbK?=
 =?us-ascii?Q?T634krT2jrZW4HU53m9mN8KWV5l9WZ+xvyMeMkTgW1K70hSNWT3c3OaaTXsj?=
 =?us-ascii?Q?wFD3e7F0l6VZgiH3a6hI/Du7yIuOCDobTrj++JR1uUPNgD0hbVVBvXM4x+AU?=
 =?us-ascii?Q?pBS92NusjdZOivLrZSsREC39TGe0qo/KUj7nbyDatq3xWLbKS0EhSHidExx9?=
 =?us-ascii?Q?QHA4hNc0dJdXPM9N+JWWhPHL1Ct9jNmP3hTVQSryr1VW+3v2nExu96Zp9jHY?=
 =?us-ascii?Q?PZASySwIX2Y7kn/YEkWrjtSdAPIEdVdOi/giJX0TrDzCpsjJyz6q03x99T4m?=
 =?us-ascii?Q?jF6RBebUkdX2i2fY5pou8SEMEOPxZrnjw5DWoM2hyFp+sKzCQPOdnGznG8PP?=
 =?us-ascii?Q?/2DayuLqh2kziHGhhH8W3EsjPfiB14WjWmiMs6lbITTNG5+KHH/gxIQvV5BR?=
 =?us-ascii?Q?Vcml3pDeXpJxi92xkj+cXXW4xzYTly5sbosfecvwq/ZXEqD/DGQXMufj7TXl?=
 =?us-ascii?Q?Ea00KwqkWLvOJgn4P0ait2f/oWBmaKU3XJSROQKqcjridtp52iOeu8ZG9qoa?=
 =?us-ascii?Q?PSbmuUEH+eQTFquS40NiCWL+0NUnSzkRk6Di0CWAyQ3OH2ib1kM/K6Zvk8/5?=
 =?us-ascii?Q?P4Fy0K2kDqFSo9jmq+JHVOBioSSBp4vsdZyo+VmV5k4FZgD8NFdNHx+EVrHH?=
 =?us-ascii?Q?bXCxDyl/BNhMfhBFaCwAoWmND+iON3atcbs48nOpX9JD8DmFuG7X7wjxmwZG?=
 =?us-ascii?Q?UPPRt6YZxqIkwGKthUmvMhNjRLZyLdFy6GeWyzZfr/eWytvinYgKwjgiXbAV?=
 =?us-ascii?Q?C9dpjAxwEvRkp8BxyvZiWeZpQu4D23zYjOcci6yW30Q8A3ySHn7fF3PZyJpC?=
 =?us-ascii?Q?6ClEprD2ySNrOysHdRunVzU3bQ1U3aW9EeYJNumEqT3vnLgYh4DyPk4d8xJF?=
 =?us-ascii?Q?Gbi9IgC6QgXnMPm26XOLfjeVPkgFe9EjLnB1S3d1przBFjb2+fKJKKvVV798?=
 =?us-ascii?Q?vYYMq4OoP+CIesHbAmuoCurX55SW8B+KCvRxq2FsRtktGSQPYynRKckX7WTM?=
 =?us-ascii?Q?ZYRTOCMoz6noEguKMz0hk0cGo3resoufPdo/9g53YfjntmOpFv+A7BkNO0X6?=
 =?us-ascii?Q?xPm+CUlhFnsEqidmxZkSN4p9CBukmUykhVXdEcar+2U54NjNbHVmQeEAC4jA?=
 =?us-ascii?Q?gMpzdXL3BLzyt2p+E0bDptpJA0HXxleW4nLeencT36jSdf0hFxBeRN79vkLk?=
 =?us-ascii?Q?8D8P0WWfYL25ElkbYOgtQmhrZFX0d31kdtUn7b73RE8G37pTP/O+vj8OvSJO?=
 =?us-ascii?Q?Nh9TyuBqs3ra3uzGg5j9Dw+0l0WHmZ5BOrTZMIBITqPbLft1S8b0nUKv16EV?=
 =?us-ascii?Q?kp68A2lBjLdL+za4cvRaC0YeUIFV0+15OjyscplpRgARHMDOpaAgHOfhKQXl?=
 =?us-ascii?Q?Mfvd882FTakdfcuWSeen+0aSzOnCW+uJ9tVd1RM5OyNdY4vTw9QZ8Oc4GCtE?=
 =?us-ascii?Q?d7iRIlTzccSleCBqpcpr7cHUp/7uQ4uMp0yhroffl7aTfT3hTvs6+RCr4n9E?=
 =?us-ascii?Q?6fNq1Rg00CyQNWAg9CFGOVi90n2KRljsXDyOldBYHDvoHMzjvtz04ij/g51l?=
 =?us-ascii?Q?Qg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <44FA011292083741804DE259D0D245FE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3784.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b9773c-9e1a-49a6-6986-08dad2e31dcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 14:56:52.5288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dFgodnUOAJycdDPB7lgqyLVOyo/LnI1Y6rMCE/uKjue+CSvHoluf9dOIVvmTi7XvxyptGSJy9AK3wkKqk4HI/NbyZ7hJkf6ltot+KksSyCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9529

Hi Michal,

> On 30 Nov 2022, at 13:27, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Bertrand,
>=20
> I will try to build and run the yocto containers for a test.
> In the meantime I just spotted one thing.

I will wait until tomorrow for a v6 in case you find issues.

>=20
> On 30/11/2022 13:15, Bertrand Marquis wrote:
>>=20
>>=20
>> Add containers suitable to run yocto kirkstone build based on ubuntu
>> 22.04. It contains all packages required by Yocto and a checkout of the
>> layers required to build Xen with Yocto.
>>=20
>> Add a generic docker image template to be used to automatically generate
>> docker files for different configurations:
>> - specific yocto version
>> - different targets (qemu arm, arm64 and x86)
>> - different host platforms (x86 or arm64)
>>=20
>> During a call to 'make all', only the images for the host platform we
>> run it on in the CI is generated.
>> If needed, images for an other host platform can be generated manually
>> by calling the right make target (see make help).
>>=20
>> Add a build script to build and run xen on qemu using Yocto.
>> The script supports arm32, arm64 and x86_64 and checks that dom0 is
>> properly booting. At this stage this does not run any guest on top of
>> dom0. The script is to be executed in one of the docker images to build
>> and run a system using a Xen source tree.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in v5:
>> - typo fixes
>> - add INTERMEDIATE to remove intermediate dockerfile
>> - use container architecture
>> - use full words in foreach loops
>> - fix shellcheck findings in build-yocto.sh
>> - rebase on sstabellini next branch
>> Changes in v4:
>> - Rework the system to have one dockerfile template from which make will
>> generate the required dockerfiles for the wanted configuration
>> - add support for different host architectures
>> - Merge the generation system into one single dockerfile
>> - Merge patches 1 and 2 in a single patch
>> - Introduce CONTAINERS_EXTRA to have extra containers not built by
>> default (for those not used by CI but useful to users)
>> Changes in v3:
>> - limit number of jobs in yocto by default to 8 and add --num-jobs
>> option to the script to set a custom number of jobs
>> - do not copy anymore the build-yocto.sh script inside the main image so
>> that the current one in the repository is used when running
>> Changes in v2:
>> - add a --dump-log command line option to build-yocto.sh script to dump
>> the logs if an error occurs.
>> Changes in v1:
>> - add --image command line argument to build-yocto.sh to allow building
>> something different than xen-image-minimal.
>> - modify dockerfile to have one layer per line and make it easier to add
>> other. I kept the for loop to keep the number of docker steps lower
>> - update commit message to warn that no guest are tested.
>> - fix build-yocto script to properly return with an error if expect
>> script ends up in timeout or EOF.
>> ---
>> automation/build/Makefile                  |  14 +-
>> automation/build/yocto/build-yocto.sh      | 351 +++++++++++++++++++++
>> automation/build/yocto/yocto.dockerfile.in | 114 +++++++
>> automation/build/yocto/yocto.inc           |  42 +++
>> 4 files changed, 519 insertions(+), 2 deletions(-)
>> create mode 100755 automation/build/yocto/build-yocto.sh
>> create mode 100644 automation/build/yocto/yocto.dockerfile.in
>> create mode 100644 automation/build/yocto/yocto.inc
>>=20
>> diff --git a/automation/build/Makefile b/automation/build/Makefile
>> index a4b2b85178cf..72a5335baec1 100644
>> --- a/automation/build/Makefile
>> +++ b/automation/build/Makefile
>> @@ -1,13 +1,18 @@
>>=20
>> # the base of where these containers will appear
>> REGISTRY :=3D registry.gitlab.com/xen-project/xen
>> -CONTAINERS =3D $(subst .dockerfile,,$(wildcard */*.dockerfile))
>> +CONTAINERS =3D $(filter-out yocto/%,$(subst .dockerfile,,$(wildcard */*=
.dockerfile)))
>> +CONTAINERS_EXTRA =3D
>> DOCKER_CMD ?=3D docker
>>=20
>> +include yocto/yocto.inc
> Because this appears before help, when calling make without any target li=
ke:
> make -C automation/build
> the previous behavior of printing help by default is no longer true (the =
default target is
> taken from yocto.inc in this case). Instead we're getting:
>=20
> make: Entering directory...
> rm yocto/kirkstone-qemuarm64.dockerfile
> make: Leaving directory...
>=20
> This include can be easily moved after help to stick to the current behav=
ior and still
> achieve what we want (i.e. make will still first evaluate include and the=
n call the first
> target which is help, so CONTAINERS and CONTAINERS_EXTRA will contain cor=
rect data).

Complete right.
I will fix that in v6.

Cheers
Bertrand

>=20
>> +
>> help:
>>        @echo "Builds containers for building Xen based on different dist=
ros"
>>        @echo "To build one run 'make DISTRO/VERSION'. Available containe=
rs:"
>>        @$(foreach file,$(sort $(CONTAINERS)),echo ${file};)
>> +       @echo "Extra containers (not built using make all):"
>> +       @$(foreach file,$(sort $(CONTAINERS_EXTRA)),echo ${file};)
>>        @echo "To push container builds, set the env var PUSH"
>>=20
>> %: %.dockerfile ## Builds containers
>> @@ -16,5 +21,10 @@ help:
>>                $(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
>>        fi
>>=20
>> -.PHONY: all
>> +.PHONY: all clean
>> all: $(CONTAINERS)
>> +
>> +# Remove generated dockerfiles for yocto
>> +clean:
>> +       rm -f yocto/*.dockerfiles
>> +
>=20
> ~Michal


