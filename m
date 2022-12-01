Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3301E63EB95
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 09:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450280.707554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0fFv-0007yJ-R3; Thu, 01 Dec 2022 08:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450280.707554; Thu, 01 Dec 2022 08:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0fFv-0007vz-Nu; Thu, 01 Dec 2022 08:49:19 +0000
Received: by outflank-mailman (input) for mailman id 450280;
 Thu, 01 Dec 2022 08:49:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ecKG=37=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1p0fFt-0007vr-NP
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 08:49:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 094f39a2-7155-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 09:49:16 +0100 (CET)
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB5934.eurprd08.prod.outlook.com (2603:10a6:102:e8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 08:49:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 08:49:13 +0000
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
X-Inumbo-ID: 094f39a2-7155-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuCkH/Fa4WptGEkO6cX36FBgAN5GjO4YW4f81gyaA1285nHKtKE9q/57Kw8NbeeGrf6fBskJ0VQd/tQN+iskMdKe/WKJnVwsliXN5mzTunB+qvmVSCrjKwI2cjh8ge6ouyAqtLJJTNK7JHfeiTrwEEHMkPFaCcaivNz67IIyZDml2HA3C8lzro0v9x7wTp7LuG3xgC2NlZCcS9/i7ZY7lG6Q4Nj36dMPXCqAKGIiIsHdfux4NT9dTTEdAY0cIeEXMBNShR6WTe3NNXvMdvsZmveKriA3b6qF6qGDIY07CKxNN3vLZswFHcMU8e3NunfF/Sa/z80kJVuXWz2+ZJ+v2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ye6K58sCinrNDeDGdaKXVKQTUx3zDr1TRmR32BAv6E4=;
 b=i+FzkvY9M8WL4SmNUv6WFflHne9b148pQzEkhiksSBIYuUJK5GsaP9RmY3llszxkxHKCS5AuaJDD6I3FdJFtxT2M9vUGSY9ydKQfjLGYdaCVJEz2NVRcYD8S27w9xSSEgGV/o0qtUZVgXAGCoNlnXgtqifXOcni5NEF1Wj/JbTn3gfYYDsoKXNKjrwMnd9ilDcsDEziieAJdQqAOg+wvTe28ZL5D13H2UYlI408YtsfM79QXsHupYPwYGEAsfIFE7lumtfn3qqGndGhIiwhNysrkUD2Fpr3ikkC5z0artynRVUTuWEMd8Jee4BCBhySIKCLnXkp0Gdn49+qJ+g3ggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ye6K58sCinrNDeDGdaKXVKQTUx3zDr1TRmR32BAv6E4=;
 b=0GkY7AiN4qH17q+1X3Hp9a0djLtu2a6AXFYRQoXDg56dt0ypnJzM58qXhChWEUAM5Qng3phRKYMs2E1u81v/4+RLCnXu87Vz704vx2AD6nSFRmYywjWMVZ9WhneqQrGjfcjYeBLxTYtXRQDpn6ZGkWWFIuC2qvSsTzQsZ8jnjKk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: Re: [PATCH v5 1/3] automation: Create Yocto docker images
Thread-Topic: [PATCH v5 1/3] automation: Create Yocto docker images
Thread-Index: AQHZBLWFmb3GO0y8oEy6bIpMhPppa65YMREAgACJFQA=
Date: Thu, 1 Dec 2022 08:49:12 +0000
Message-ID: <CAA41F61-8850-4DD9-88B5-61E9498F5FB8@arm.com>
References: <cover.1669810269.git.bertrand.marquis@arm.com>
 <18861c0c9c547959900532e38df11b2d67f0a1cc.1669810269.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.22.394.2211301637210.4039@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2211301637210.4039@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR08MB3784:EE_|PA4PR08MB5934:EE_
x-ms-office365-filtering-correlation-id: fbaf1c85-4475-4cbd-ce98-08dad378ebac
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1oZtse32ZoIfMdB81ZnHfbSFcJf1ej6CjAoItLj8+wV4I7VwecmPLRwnCm+/8NEyd3bUA5IJpxR9goFtWZucSKRv9irgynvt98O8dvtTQV5o6gSHjqTJkXoRySiEC+8RZtBUQO/9H/Og+SMuMWpPgkmbB3m48E6HY5i5nnxRIhJHlhfU9DsTmKqS7g56tO0Lennqh8arr/g1MQAcwsVh1Q7yoO+hPKo9GMEgixDqHKpthRcLXZOZ5lcD1NxEcVnNH2X8/uClbXYzhWCjdXJuSZGKaoQZP6ss+bCqAml3rsg2Rcz73m9/XA+Ckj1UHoukjaKKszeCdDxblTjlap0V1Aek33VynNI5aLWsiY0mrECL0bCz+rdV3PJNAe/2AQPerSonpm7MNVC6WtoruZiWsBECdf/p8gyhybiVOzxjuJ461a8jIS73wdJe9P3NDjV/ddo63Q016K76MUBKG3D4vWc99uB5N0Cy8eYVPK45yog/6qIyeI7dmQ2CQkvWa5UNd+N8Wb23fZd9w39pInRvlIPQ05yvmT1aO+ZHi+kzlF39Cq01AXRjVMAgXJR6Lh+pu2Q97rvXjDEWKosoIAF4hn6WnlYqB10zAFPggA8NYd0716HXTUpJgggL+FzaxT/z3nVoQkH2XklQ5PtxAfkySDnL5r912QL/oHd8bH6KaY7wrbzRauZACrfvNJTwMCJPp1zKxnL90komlqYndnl7hXiuwTozVJcbYboXGtnkDTS3YnNMU6gwNpQYQ5my3ZqkmGG007RMSFFXbrgjmOo76h2BnCMLX37ddnULsMTmiSc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199015)(54906003)(6916009)(71200400001)(316002)(122000001)(53546011)(38100700002)(6506007)(36756003)(26005)(64756008)(41300700001)(2616005)(186003)(5660300002)(30864003)(86362001)(4326008)(66556008)(66446008)(66476007)(8676002)(6512007)(8936002)(66946007)(33656002)(91956017)(2906002)(83380400001)(76116006)(6486002)(478600001)(38070700005)(84970400001)(966005)(45980500001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MFCI2A1vbNhb0ppkrF0XGSOlbOdAhuwhP/sLtLMjbeTFO/4ip425dLlN1Pta?=
 =?us-ascii?Q?5H62IQzHgwn67x990ofx6rcPepBJWww+IRlDWwYVkwos8EbtgUrbVtuKc5mg?=
 =?us-ascii?Q?Nyw1lv3fdCD1+DbpiORVUOJsq5OpOJe9Z2jf2z0c8V6TJNqdc9KlGqg11nnR?=
 =?us-ascii?Q?Kpf6ClKrTqHKxLD7ksA/YhaxW1u4Q6Qvi2D1gjnGgxYVv5Kk5QsbVTkH9UeX?=
 =?us-ascii?Q?6R5AUN0e2dCx6Ao2ZK6XYsDs1mkOSAe/hUBoDJtwDY7vK4r2U7Q6SoM/mh0n?=
 =?us-ascii?Q?xP+RebaR7TihDad2Cz1Rs1EHnOw1ly2WuSqmoVCJ7W3d+lW5SXSY3nhhGjDt?=
 =?us-ascii?Q?KGmg13tT+o8aMT3ifcgxjsdtch+WeDAFq6f9awMMcxkrnjSwQLXz+IbcFrpo?=
 =?us-ascii?Q?2JdNTpjUbmAgoXzvEO+GHG80/b/dyzQF+Or+hhaI8AEcaR/KUN4duc134F2z?=
 =?us-ascii?Q?upR7UTPrzxUnaWp9D9z9wZi41Y+/P+enwPfTn+Y1asbMDyjzBV4H9+0W15tH?=
 =?us-ascii?Q?2B//2UQfAV3ayOYSloxyD264mgIpNkhwZ1xw1xeMQ8oog/D/aJGYb3rXmF/T?=
 =?us-ascii?Q?llxW1uVeNErRSlE8UPPUKjspC/Jpd0EqyemvZbfS8n1d0OpcYa9LmIdcReUQ?=
 =?us-ascii?Q?+e5vKYa3toHxdQ2bRNksKl91/L/l1B84DMinvPRpyo96d1P9hsLcb7cGzd7+?=
 =?us-ascii?Q?CGXe0aqmNtwyiNhXf6BM/1P91JwQ4p7rd8ZmAyU2LxmU3GIki0bKAwUqrXIY?=
 =?us-ascii?Q?qB7wNMSNeGRXstvGIxM984PvD5cwxnSMEKKpylZjiwU2leEXLlcRnKn20v3V?=
 =?us-ascii?Q?ViFmRGT/GX8MXsZqz44MA1fuzk8sYAOGt86Gsloi+rQ1g4ldbPQuJkneqRV3?=
 =?us-ascii?Q?WzCPL/+S5T3tzrRypH9DMha0Etri4g1NX4t+qDf9p1DcAh3lhQ63x2F/Vik+?=
 =?us-ascii?Q?kwbkTolv/5KF+CaDmMxjXSU1M7UUvtdDDOFdrCODXVFDCKsdNLI64l69xVAH?=
 =?us-ascii?Q?TnKqocKBqAUBrfU3iUp29CxcmYISqrVrp9XU+XOeN0sxurJCXEVA9ZA0GT3j?=
 =?us-ascii?Q?w6FQXEvzQmXlBq0ULXMoUS1xVJsL9DADLLuT7vYJu3zhGTDIGF1k3w/XuvSz?=
 =?us-ascii?Q?Z89vkUB3vSrpaggCHLaWcGGyIRO5MVQjXspTfyk9CP+bw3YwaEvWXYgNI+6Y?=
 =?us-ascii?Q?e5hFmiPnp0qFqnUrpICcJmnTx3qXLoZb/gH2YRCZ6jwpNVOJPEoB+kyUCkxJ?=
 =?us-ascii?Q?GTYPcaM5xy9F87RF4bRdqEi+B+Jm3DukOh8uKk7oKq+GqURZEMlgs64HB84C?=
 =?us-ascii?Q?i2IOxDIlklxBxZVv7dAM3bZY5WkacgjYPM4Mc8QAXkqDybHDwbFOc3XEPBeT?=
 =?us-ascii?Q?8ZYY8k6mOw8JmDYkXqHcuLpUdP7QrvpX8OJ7lXQkcRud7yOlGnkrcXvXC0ne?=
 =?us-ascii?Q?uudhHJYYggeH4Qn1H+4BuhaTI7IixE4gVojAd6MrFXoF1DGDL2nbQJHJzkYq?=
 =?us-ascii?Q?IRa3eOHBvMDe0GfTyJ9lTG+dvqf5yOGjQVHRUy7QfrlD8Wod2l4rU6plO6Ps?=
 =?us-ascii?Q?cTPNQwk2PnMpEO9Br2FbNTEFm8eTQWU/XiI+PY+LctHjdqBqJV3SEPqFztY8?=
 =?us-ascii?Q?hg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8A3D836A7EE1CC4D821B19BECF385A00@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3784.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbaf1c85-4475-4cbd-ce98-08dad378ebac
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 08:49:12.9697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ur7g+U7NsXfk5BnssGULrkPWdcPLj2q9BnyKoJtYT60pM1uz48W/8uX4uU8Bj3Q6DVWigu9FYVqUJyNhUftEtj1+P59E6PbmCxTtkDh7AGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5934

Hi Stefano,

> On 1 Dec 2022, at 00:38, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Wed, 30 Nov 2022, Bertrand Marquis wrote:
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
>> +
>> help:
>> 	@echo "Builds containers for building Xen based on different distros"
>> 	@echo "To build one run 'make DISTRO/VERSION'. Available containers:"
>> 	@$(foreach file,$(sort $(CONTAINERS)),echo ${file};)
>> +	@echo "Extra containers (not built using make all):"
>> +	@$(foreach file,$(sort $(CONTAINERS_EXTRA)),echo ${file};)
>> 	@echo "To push container builds, set the env var PUSH"
>>=20
>> %: %.dockerfile ## Builds containers
>> @@ -16,5 +21,10 @@ help:
>> 		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
>> 	fi
>>=20
>> -.PHONY: all
>> +.PHONY: all clean
>> all: $(CONTAINERS)
>> +
>> +# Remove generated dockerfiles for yocto
>> +clean:
>> +	rm -f yocto/*.dockerfiles
>> +
>> diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yo=
cto/build-yocto.sh
>> new file mode 100755
>> index 000000000000..f42fdf72d964
>> --- /dev/null
>> +++ b/automation/build/yocto/build-yocto.sh
>> @@ -0,0 +1,351 @@
>> +#!/bin/bash
>> +#
>> +# Yocto meta virtualization build and run script
>> +#
>> +# This script is building Yocto xen-image-minimal for qemu targets and =
run
>> +# them using runqemu inside yocto to check that dom0 is booting properl=
y.
>> +# The build is using a local xen source tree so that specific patches c=
an be
>> +# tested.
>> +# In order to optimize the build time, a build cache is used so that on=
ly xen
>> +# packages and its dependencies are rebuilt (qemu and final image mainl=
y).
>> +#
>> +# get command error even when piped.
>> +set -o pipefail
>> +
>> +# Directories
>> +YOCTODIR=3D"$HOME/yocto-layers"
>> +CACHEDIR=3D"$HOME/yocto-cache"
>> +LOGDIR=3D"$HOME/logs"
>> +XENDIR=3D"$HOME/xen"
>> +BUILDDIR=3D"$HOME/build"
>> +
>> +# what yocto bsp we support
>> +TARGET_SUPPORTED=3D"qemuarm qemuarm64 qemux86-64"
>> +VERBOSE=3D"n"
>> +TARGETLIST=3D""
>> +BUILDJOBS=3D"8"
>> +
>> +# actions to do
>> +do_clean=3D"n"
>> +do_build=3D"y"
>> +do_run=3D"y"
>> +do_localsrc=3D"n"
>> +do_dump=3D"n"
>> +build_result=3D0
>> +
>> +# layers to include in the project
>> +build_layerlist=3D"poky/meta poky/meta-poky poky/meta-yocto-bsp \
>> +                 meta-openembedded/meta-oe meta-openembedded/meta-pytho=
n \
>> +                 meta-openembedded/meta-filesystems \
>> +                 meta-openembedded/meta-networking meta-virtualization"
>> +
>> +# yocto image to build
>> +build_image=3D"xen-image-minimal"
>> +
>> +function print_progress() {
>> +    echo -n "$(date +%T) $*"
>> +}
>> +
>> +function run_task() {
>> +    local task_name=3D"$1"
>> +    local task_target=3D"$2"
>> +
>> +    task_log=3D"${task_name//project_}-${task_target}"
>> +
>> +    mkdir -p "${LOGDIR}"
>> +    print_progress
>> +    echo -n "${task_name//project_} ${task_target}: "
>> +    if [ "${VERBOSE}" =3D "n" ]; then
>> +        "$@" > "${LOGDIR}/${task_log}.log" 2>&1
>> +    else
>> +        "$@" 2>&1 | tee "${LOGDIR}/${task_log}.log"
>> +    fi
>> +
>> +    if [ ${?} -ne 0 ]; then
>> +        echo "Error"
>> +        build_result=3D$((build_result+1))
>> +        if [ "${do_dump}" =3D "y" ]; then
>> +            echo
>> +            echo "############ LOGS-START ############"
>> +            cat "${LOGDIR}/${task_log}.log"
>> +            echo "############  LOGS-END  ############"
>> +            echo
>> +        fi
>> +        return 1
>> +    else
>> +        echo "OK"
>> +        return 0
>> +    fi
>> +}
>> +
>> +function project_create() {
>> +    target=3D"${1:?}"
>> +    destdir=3D"${BUILDDIR}/${target}"
>> +
>> +    (
>> +        # init yocto project
>> +        source "${YOCTODIR}/poky/oe-init-build-env" "${destdir}"
>> +
>> +        # add needed layers
>> +        for layer in ${build_layerlist}; do
>> +            bitbake-layers add-layer "${YOCTODIR}/${layer}" || exit 1
>> +        done
>> +    ) || return 1
>> +
>> +    # customize project configuration
>> +    cat <<EOF >> "${destdir}/conf/local.conf"
>> +# Yocto BSP
>> +MACHINE =3D "${target}"
>> +
>> +# Use local cache to reuse previous builds results
>> +SSTATE_DIR =3D "${CACHEDIR}/sstate-cache"
>> +DL_DIR =3D "${CACHEDIR}/downloads"
>> +
>> +# Enable xen and virtualization
>> +DISTRO_FEATURES =3D " virtualization xen ipv4"
>> +
>> +# Speed up run by not generating ssh host keys
>> +IMAGE_INSTALL:append:pn-xen-image-minimal =3D " ssh-pregen-hostkeys"
>> +
>> +# Save some disk space
>> +INHERIT +=3D "rm_work"
>> +
>> +# Reduce number of jobs
>> +BB_NUMBER_THREADS=3D"${BUILDJOBS}"
>> +
>> +EOF
>> +
>> +    if [ "${do_localsrc}" =3D "y" ]; then
>> +        XENVERS=3D$(grep -e "^XEN_REL" \
>> +            "${YOCTODIR}"/meta-virtualization/recipes-extended/xen/xen_=
*.bb \
>> +            2> /dev/null | tr -d ' ' | tr -d '?' | tr -d '"' \
>> +            | sed -e "s/.*=3D//" | sort -V | tail -n 1)
>> +
>> +        XENBASE=3D$(dirname "$(realpath -m "${XENDIR}")")
>> +        XENSUB=3D$(basename "$(realpath -m "${XENDIR}")")
>> +
>> +        cat <<EOF >> "${destdir}/conf/local.conf"
>> +# Use local sources for xen and xen-tools
>> +FILESEXTRAPATHS:prepend:pn-xen :=3D "${XENBASE}:"
>> +FILESEXTRAPATHS:prepend:pn-xen-tools :=3D "${XENBASE}:"
>> +
>> +SRC_URI:pn-xen =3D "file://${XENSUB}/;subdir=3Dlocal-xen/"
>> +SRC_URI:pn-xen-tools =3D "file://${XENSUB}/;subdir=3Dlocal-xen/"
>> +
>> +PREFERRED_VERSION:pn-xen =3D "${XENVERS}%"
>> +PREFERRED_VERSION:pn-xen-tools =3D "${XENVERS}%"
>> +
>> +S:pn-xen =3D "\${WORKDIR}/local-xen/${XENSUB}"
>> +S:pn-xen-tools =3D "\${WORKDIR}/local-xen/${XENSUB}"
>> +
>> +SRCREV:pn-xen =3D "\${AUTOREV}"
>> +SRCREV:pn-xen-tools =3D "\${AUTOREV}"
>> +
>> +SRCPV:pn-xen =3D "1"
>> +SRCPV:pn-xen-tools =3D "1"
>> +
>> +# Disable all QA errors as the recipe is not up to date with changes in=
 Xen
>> +# when we use local sources
>> +ERROR_QA:pn-xen =3D "arch"
>> +ERROR_QA:pn-xen-tools =3D "arch"
>> +
>> +EOF
>> +    fi
>> +}
>> +
>> +function project_build() {
>> +    target=3D"${1:?}"
>> +    destdir=3D"${BUILDDIR}/${target}"
>> +
>> +    (
>> +        source "${YOCTODIR}/poky/oe-init-build-env" "${destdir}"
>> +
>> +        bitbake "${build_image}" || exit 1
>> +    ) || return 1
>> +}
>> +
>> +function project_clean() {
>> +    target=3D"${1:?}"
>> +    destdir=3D"${BUILDDIR}/${target}"
>> +
>> +    rm -rf "${destdir}"
>> +}
>> +
>> +function project_run() {
>> +    target=3D"${1:?}"
>> +    destdir=3D"${BUILDDIR}/${target}"
>> +    (
>> +        source "${YOCTODIR}/poky/oe-init-build-env" "${destdir}" > /dev=
/null 2>&1
>> +
>> +        /usr/bin/expect <<EOF
>> +set timeout 100
>> +spawn bash -c "runqemu serialstdio nographic slirp"
>> +
>> +expect_after {
>> +    -re "(.*)\r" {
>> +        exp_continue
>> +    }
>> +    timeout {send_user "ERROR-Timeout!\n"; exit 1}
>> +    eof {send_user "ERROR-EOF!\n"; exit 1}
>> +}
>> +
>> +# wait initial login
>> +expect -re ".* login: "
>> +send "root\r"
>> +expect -re "root@.*# "
>> +
>> +EOF
>> +    exit $?
>> +    ) || return 1
>> +}
>> +
>> +function help() {
>> +    cat <<EOF
>> +Usage: ${0} [TARGET1] [TARGET2]
>> +
>> +This script is build the yocto xen-image-minimal for different qemu tar=
gets
>> +and is running it after.
>> +Without any target specified, all supported targets are done.
>> +
>> +Options:
>> +  -h, --help       Print this help
>> +  -v, --verbose    Verbose build
>> +  --list-target    List supported targets
>> +  --clean          Clean existing project before starting
>> +  --no-build       Do not build (to run an already built project)
>> +  --no-run         Do not run
>> +  --num-jobs=3DNUM   Define the number of parallel jobs in Yocto.
>> +                   Default: ${BUILDJOBS}
>> +  --dump-log       On error, dump the logs on the console
>> +  --image=3DIMG      Yocto image or package to build
>> +                   Default: xen-image-minimal
>> +  --xen-dir=3DDIR    path to xen hypervisor source tree
>> +                   if not provide, normal yocto version of xen is built
>> +                   Default: ${XENDIR}
>> +  --out-dir=3DDIR    directory where to create the projectss
>> +                   Default: ${BUILDDIR}
>> +  --log-dir=3DDIR    directory to store logs
>> +                   Default: ${LOGDIR}
>> +  --cache-dir=3DDIR  directory where to take and store build cache
>> +                   Default: ${CACHEDIR}
>> +  --layer-dir=3DDIR  directory containing the checkout of yocto layers
>> +                   Default: ${YOCTODIR}
>> +EOF
>> +}
>> +
>> +for OPTION in "$@"
>> +do
>> +    case ${OPTION} in
>> +        -h|--help)
>> +            help
>> +            exit 0
>> +            ;;
>> +        -v|--verbose)
>> +            VERBOSE=3D"y"
>> +            ;;
>> +        --list-targets)
>> +            echo "${TARGET_SUPPORTED}"
>> +            exit 0
>> +            ;;
>> +        --clean)
>> +            do_clean=3D"y"
>> +            ;;
>> +        --no-build)
>> +            do_build=3D"n"
>> +            ;;
>> +        --no-run)
>> +            do_run=3D"n"
>> +            ;;
>> +        --dump-log)
>> +            do_dump=3D"y"
>> +            ;;
>> +        --num-jobs=3D*)
>> +            BUILDJOBS=3D"${OPTION#*=3D}"
>> +            ;;
>> +        --image=3D*)
>> +            build_image=3D"${OPTION#*=3D}"
>> +            ;;
>> +        --xen-dir=3D*)
>> +            XENDIR=3D"${OPTION#*=3D}"
>> +            if [ ! -e "${XENDIR}/xen/Makefile" ]; then
>> +                echo "No Xen source tree in ${XENDIR}"
>> +                exit 1
>> +            fi
>> +            do_localsrc=3D"y"
>> +            ;;
>> +        --out-dir=3D*)
>> +            BUILDDIR=3D"${OPTION#*=3D}"
>> +            ;;
>> +        --log-dir=3D*)
>> +            LOGDIR=3D"${OPTION#*=3D}"
>> +            ;;
>> +        --cache-dir=3D*)
>> +            CACHEDIR=3D"${OPTION#*=3D}"
>> +            ;;
>> +        --layer-dir=3D*)
>> +            YOCTODIR=3D"${OPTION#*=3D}"
>> +            ;;
>> +        --*)
>> +            echo "Invalid option ${OPTION}"
>> +            help
>> +            exit 1
>> +            ;;
>> +        *)
>> +            if echo "${TARGET_SUPPORTED}" | grep -q -w "${OPTION}"; the=
n
>> +                TARGETLIST=3D"${TARGETLIST} ${OPTION}"
>> +            else
>> +                echo "Unsupported target ${OPTION}"
>> +                exit 1
>> +            fi
>> +            ;;
>> +    esac
>> +done
>> +
>> +# if no target is specified build all targets
>> +if [ -z "${TARGETLIST}" ]; then
>> +    TARGETLIST=3D"${TARGET_SUPPORTED}"
>> +fi
>> +
>> +mkdir -p "${CACHEDIR}"
>> +mkdir -p "${LOGDIR}"
>> +mkdir -p "${BUILDDIR}"
>> +
>> +# Make sure we have an absolute path
>> +YOCTODIR=3D$(realpath -m "${YOCTODIR}")
>> +CACHEDIR=3D$(realpath -m "${CACHEDIR}")
>> +BUILDDIR=3D$(realpath -m "${BUILDDIR}")
>> +LOGDIR=3D$(realpath -m "${LOGDIR}")
>> +if [ "${do_localsrc}" =3D "y" ]; then
>> +    XENDIR=3D$(realpath -m "${XENDIR}")
>> +fi
>> +
>> +# Check that we have all the layers we need
>> +for f in ${build_layerlist}; do
>> +    if [ ! -f "${YOCTODIR}/${f}/conf/layer.conf" ]; then
>> +        echo "Layer ${f} missing in ${YOCTODIR}"
>> +        exit 1
>> +    fi
>> +done
>> +
>> +for f in ${TARGETLIST}; do
>> +    if [ "${do_clean}" =3D "y" ]; then
>> +        run_task project_clean "${f}"
>> +    fi
>> +    if [ ! -f "${BUILDDIR}/${f}/conf/local.conf" ]; then
>> +        run_task project_create "${f}"
>> +    fi
>> +    if [ -f "${BUILDDIR}/${f}/conf/local.conf" ]; then
>> +        if [ "${do_build}" =3D "y" ]; then
>> +            run_task project_build "${f}"
>> +        fi
>> +        if [ "${do_run}" =3D "y" ]; then
>> +            run_task project_run "${f}"
>> +        fi
>> +
>> +    fi
>> +done
>> +
>> +print_progress "Build Complete (${build_result} errors)"
>> +echo
>> +exit ${build_result}
>> +
>> diff --git a/automation/build/yocto/yocto.dockerfile.in b/automation/bui=
ld/yocto/yocto.dockerfile.in
>> new file mode 100644
>> index 000000000000..b0892d420377
>> --- /dev/null
>> +++ b/automation/build/yocto/yocto.dockerfile.in
>> @@ -0,0 +1,114 @@
>> +# Docker file to create an environment to build yocto with virtualizati=
on
>> +#
>> +# Arguments that can be passed during image creation using --build-arg:
>> +# "host_uid=3D$(id -u)": to use current user uid for build user in the =
image
>> +# "host_gid=3D$(id -g)": to use current user gid for build user in the =
image
>> +# "ubuntu_version=3DVERS": to select the ubuntu version number
>> +
>> +# Use standard ubuntu minimal.
>> +ARG ubuntu_version=3D22.04
>> +From ##DOCKERPLAT##ubuntu:$ubuntu_version AS base
>> +LABEL maintainer.name=3D"The Xen Project " \
>> +      maintainer.email=3D"xen-devel@lists.xenproject.org"
>> +
>> +ENV DEBIAN_FRONTEND=3Dnoninteractive
>> +
>> +# Install minimal ubuntu requirements for yocto and other tools we need=
.
>> +# See https://docs.yoctoproject.org/4.0.1/brief-yoctoprojectqs/index.ht=
ml#build-host-packages
>> +RUN apt-get update && \
>> +    apt-get --quiet --yes install \
>> +        gawk \
>> +        wget \
>> +        git \
>> +        diffstat \
>> +        unzip \
>> +        texinfo \
>> +        gcc \
>> +        build-essential \
>> +        chrpath \
>> +        socat \
>> +        cpio \
>> +        python3 \
>> +        python3-pip \
>> +        python3-pexpect \
>> +        xz-utils \
>> +        debianutils \
>> +        iputils-ping \
>> +        python3-git \
>> +        python3-jinja2 \
>> +        libegl1-mesa \
>> +        libsdl1.2-dev \
>> +        python3-subunit \
>> +        mesa-common-dev \
>> +        zstd \
>> +        liblz4-tool \
>> +        file \
>> +        vim \
>> +        bison \
>> +        expect \
>> +        locales \
>> +        liblz4-tool \
>> +        zstd \
>> +        openssl \
>> +        libssl3 \
>> +        ca-certificates \
>> +        && \
>> +        apt-get autoremove -y && \
>> +        apt-get clean && \
>> +        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
>> +
>> +# Use bash as shell.
>> +RUN rm /bin/sh && ln -s bash /bin/sh
>> +
>> +# Fix local for yocto.
>> +RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=3Den_US.UTF-8 \
>> +    LANG=3Den_US.UTF-8
>> +ENV LANG en_US.UTF-8
>> +ENV LC_ALL en_US.UTF-8
>> +
>> +# Create a user for the build (we don't want to build as root).
>> +ENV USER_NAME docker-build
>> +ARG host_uid=3D1000
>> +ARG host_gid=3D1000
>> +RUN groupadd -g $host_gid $USER_NAME && \
>> +    useradd -g $host_gid -m -s /bin/bash -u $host_uid $USER_NAME
>> +
>> +# Switch to our user instead of root and start in its home.
>> +USER $USER_NAME
>> +WORKDIR /home/$USER_NAME
>> +
>> +# Create needed directories
>> +RUN mkdir -p /home/$USER_NAME/yocto-layers \
>> +             /home/$USER_NAME/yocto-cache \
>> +             /home/$USER_NAME/logs \
>> +             /home/$USER_NAME/bin \
>> +             /home/$USER_NAME/xen && \
>> +    chown $USER_NAME.$USER_NAME /home/$USER_NAME/*
>> +
>> +# clone yocto repositories we need.
>> +RUN for rep in \
>> +                https://github.com/openembedded/meta-openembedded \
>> +                https://git.yoctoproject.org/poky \
>> +                https://git.yoctoproject.org/meta-virtualization \
>> +            ; do \
>> +        git -C /home/$USER_NAME/yocto-layers \
>> +            clone -b ##YOCTOVERSION## --single-branch $rep; \
>> +    done
>> +
>> +# The builder stage is building an initial cache state that we include =
in the
>> +# final image.
>> +From base AS builder
>> +
>> +# This step can take one to several hours depending on your download ba=
ndwith
>> +# and the speed of your computer.
>> +COPY ./build-yocto.sh /
>> +RUN /build-yocto.sh --dump-log ##YOCTOTARGET##
>> +
>> +From base
>> +
>> +# Only copy the cache status.
>> +COPY --from=3Dbuilder /home/$USER_NAME/yocto-cache /home/$USER_NAME/yoc=
to-cache/.
>> +
>> +LABEL maintainer.name=3D"The Xen Project " \
>> +      maintainer.email=3D"xen-devel@lists.xenproject.org"
>> +
>> diff --git a/automation/build/yocto/yocto.inc b/automation/build/yocto/y=
octo.inc
>> new file mode 100644
>> index 000000000000..cc72debe366c
>> --- /dev/null
>> +++ b/automation/build/yocto/yocto.inc
>> @@ -0,0 +1,42 @@
>> +# This makefile generates the docker files for Yocto builds.
>> +# The containers for the current architecture are the one built using m=
ake all.
>> +# To build containers for a different architecture, you need to call ma=
ke for
>> +# the image you want explicitely.
>> +# The containers are named this way:
>> +# YOCTOVERSION-TARGET for x86_64 hosts
>> +# YOCTOVERSION-TARGET-arm64v8 for arm64 hosts
>=20
> Please add:
>=20
> # For example you can build an arm64 container with the following command=
:
> # make yocto/kirkstone-qemuarm64-arm64v8

ok

Cheers
Bertrand




