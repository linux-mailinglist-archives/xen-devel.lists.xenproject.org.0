Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3677EB32608
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 02:53:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090840.1447931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upcVT-0005OS-D6; Sat, 23 Aug 2025 00:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090840.1447931; Sat, 23 Aug 2025 00:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upcVT-0005LW-8y; Sat, 23 Aug 2025 00:53:19 +0000
Received: by outflank-mailman (input) for mailman id 1090840;
 Sat, 23 Aug 2025 00:53:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yyzx=3D=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1upcVS-0005LQ-70
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 00:53:18 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e345d37-7fbb-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 02:53:17 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DU0PR03MB8957.eurprd03.prod.outlook.com
 (2603:10a6:10:475::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Sat, 23 Aug
 2025 00:53:14 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.014; Sat, 23 Aug 2025
 00:53:14 +0000
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
X-Inumbo-ID: 8e345d37-7fbb-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNqgC6dnPLlP2Ctb0IWiRbam6zqHAVzr4DnOcpz+rz+zCcF54n9m+TDhvV9bX68/dcvByqJg48V7OijoRDl1ZXR4YH8Zefl2oiW0peVLM2u7b8YZGTCKpD0MS2Xy1E5XSGSFQh7paJRNXUJ9omZdRdmt1yWVduQfZIHnEl9rPcO90CKSSgjaZzLgxJ7T1RlD8WwV5la9wWwT32K9xZMhhgb1H21Nsn1oRPLbwvaXJTXRIaGqmLIMNx5UG3UzEGfFCk36kE66yRfEXzwX/ShKQiQHW40VbQsQD590qbR8nAKAxYIvZesj4oJAPqu9Kdncezrw4sHo2bOFxrcjs2iofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmcakKGRpCSdV7gwQtcfrfgco6UwLTgQ20Q02v1oV3w=;
 b=G3+pdu5WJRY/y+m2lw9ROqlLTD/dziFhkD9CzR1R9XGZCbAx1si04GRMEWJKd9+VaIW9s9Ngr9etTzq91CjvnrjQECgyIuQ+9+cJuVR375b3NNatktjV8UPwMuSJvnnKQh7f6vaoAUx4RYCr9bXm0lijq7/bXVxdNKamzPc0mPXnkmyDJSjwN45PttmPW19RZiqVl19mFGqyephGgI/RH7lHuS/G46ke9edF8vlp9bf2spx8L9MQXs5had5G+o7BU9tIpzoBs50+BX+dkApZ0HYUETvwC5ds/EwzpFr4FPv6mqQxx7OXftJI+eyO6v99FMyBbX686em3X7VHxko+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmcakKGRpCSdV7gwQtcfrfgco6UwLTgQ20Q02v1oV3w=;
 b=Z+oZAd18BEDPMS3Ao5V1BySlyAfVodi7VwEufRI2o0VOL1oJY6eXl62IXI5fcoko67kXD5nlbYTZgd1o4p0WBTu7BU0DVs1S065XsOUtRG3cpZv5C6CdAXJyG3rJ41Un5IYDkS5dAzQ0Jj8w5aM8ir9CdaMMbntj9xdQDoLUmbV5sJDkM2BCYDZavg/7y/xojVrAohgkYEyoz/4M0paYCq/Sp57/N5bxwPKywToWFzozFc9JKGNwmVRW6pK64M9SABlWFnCUaztrxjEpgkoGmBbf3Ahk6oQca7UAvcpjvXubBF8MQ1Dbw7GPyuU1PCCjhOrPL8M0D8U9akbX4dKgrQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Mykola Kvach <xakep.amatop@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Mirela Simonovic <mirela.simonovic@aggios.com>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Saeed Nowshadi
	<saeed.nowshadi@xilinx.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>, Mykola
 Kvach <Mykola_Kvach@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 07/12] xen/arm: Add support for system suspend
 triggered by hardware domain
Thread-Topic: [PATCH v5 07/12] xen/arm: Add support for system suspend
 triggered by hardware domain
Thread-Index: AQHcCwFfU+9GQNRu4k2nrD5uWqCz7A==
Date: Sat, 23 Aug 2025 00:53:14 +0000
Message-ID: <87sehi97uu.fsf@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
	<c995126a9a61aecff7cb9a7c6fd28f091a332443.1754943875.git.mykola_kvach@epam.com>
	<67216d88-9296-43d1-aa46-54cefb53ea5d@suse.com>
In-Reply-To: <67216d88-9296-43d1-aa46-54cefb53ea5d@suse.com> (Jan Beulich's
	message of "Tue, 12 Aug 2025 09:18:17 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DU0PR03MB8957:EE_
x-ms-office365-filtering-correlation-id: 1d0136b2-e461-4f19-d097-08dde1df70b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?MjrsY4FsIMtSNNOe/3RDmeKkr+HrpFDk/H6+tIPgPEHNL8vzewDk2yB152?=
 =?iso-8859-1?Q?ivr6+ZRox08aGzIjjw/cgCHhoPQo/IpEBLd6GgoGOajRjagCItkT9D4P6N?=
 =?iso-8859-1?Q?9YwzAopCYj2Iy968Cp9ELvJS629iGaAVAIUnSgVGgcmfYmzaUMKw4KFgmX?=
 =?iso-8859-1?Q?3gFs5uqE/1z61CF3mBsfHDPj4K1awN7awGixdlM4qP9/WmKTExHQBgViFX?=
 =?iso-8859-1?Q?juKutug1ZUPgsqpcP5hqKT+e1C1KUsZUQm7tnALS1AErTfDz38qpFyD82k?=
 =?iso-8859-1?Q?ya15kw8JmKNhhQpnTbqybDA08SdLRRtMQpK8FvPHVRpqJWVVDPJy+lbhJP?=
 =?iso-8859-1?Q?cuITD7ZrdMvNGkVE0vVX4atvJ553J0KVb+c42t8dwi8Fn3NKuwzn4VtGg7?=
 =?iso-8859-1?Q?yczY1CUHC5slrvwcji3k4g7QuVQCNHbEiPQHgfIPB/U8GzPaPG2J2ovtFA?=
 =?iso-8859-1?Q?xjj2Bk2+Wn3+V8dk5dblVkGLD0VKCtvgbvlFUWEcUfBhdvcgUgOQXIz4hY?=
 =?iso-8859-1?Q?2mccBmbSWct2tkhqWTb8KgOW91p/pAqxtuxT0YfgKWfkNVt5rCSZEMvYM9?=
 =?iso-8859-1?Q?ihQHgjBnvHhFZRdLyf1pJ1jXkCUNcfmBbBcRkAAWNp+VDwET+pJMlcvU1z?=
 =?iso-8859-1?Q?JgQBvH/ebarq5NWxOQr5afZjXcuZAjU9D28tQHv9yU0fjPlgePFYZlizMD?=
 =?iso-8859-1?Q?AdJQ3X0WpTXwMWDVq4WAOIlcQ9EZWvWPi1Bqq1iB/pjkhzHXAKgFm0awB/?=
 =?iso-8859-1?Q?AwMQM6dAu005Uebgyllj5tCj8xSp5TZRLscmtufvqEhcmp8glyvh2NaprW?=
 =?iso-8859-1?Q?99H9RqgxaFTt9B2Ln4FZ/mmBU/OkHmx72oY1BLlYfgZZksakTr/pMxmL51?=
 =?iso-8859-1?Q?Bsj/tq/cvTuv08auQkfD5jTzSTnn5OUhUHivJOuHDaH/9If8Zs0zF29nB3?=
 =?iso-8859-1?Q?o11yrJqoW+fZ+IloWtHEjlc6YrKKgQJgcK93b/kqTtJ5v4P8gv4ThnXaJZ?=
 =?iso-8859-1?Q?8Dc78zkA8pO0R5tfo9qwsBzgO6+whSGZc0Df2AnFpC2Y1sqxjiJNbTLfLH?=
 =?iso-8859-1?Q?2Mcq82bRUGhEdlAeK8vzZl1b3LzJdJCkYIwlbygci4Vv4Jp+XR5/VApKl3?=
 =?iso-8859-1?Q?RckD374Tut8z64+VgylknMPtjyM5TI2wmZEE9ibO8pS30JYMx6zzVZotg6?=
 =?iso-8859-1?Q?0HteN21olD7rW+Oi/9AxfxdvsQafGv1fHriGMB9CGZMftm0mIZmgVO7/+S?=
 =?iso-8859-1?Q?EhhuOcqntbRzWNzarWS2mJRhmlqe+Ebl3mxSg+wYze6EMF/+njpmxnLmNn?=
 =?iso-8859-1?Q?CvDxEw6YeY9IzxkwfGIFDRL3j9Pk2yYaazMfGaozE+y1OriveHyiV4cX18?=
 =?iso-8859-1?Q?UuD15DKRTWBEKjpz06gM6+llENi1Mt4OD2I6k3xrF4cCeiEO8zVe8xC/Q/?=
 =?iso-8859-1?Q?S7LGuxpX/xYsXI96hhOsvuViDMJHdNkD2IGgC5CATnjZjAa+SEnQQz7zHJ?=
 =?iso-8859-1?Q?dtpmYdwdtZsNKK01XPGKM2ohEtpFJap60H/kMRtJba9g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?T/ZyZntNhEOm1tYHiHrrETN/wmL/+lc02rL3/R6y7WyOTHuAX5ESJBwn/7?=
 =?iso-8859-1?Q?K4LWIgYcR1hNjvstlHQlTnEtf+JnqyRnoRlouvwbibFJ75ToWzv57vnchC?=
 =?iso-8859-1?Q?ndz+4wu4nojQHdB+kavclGpHWRMMyZruKa/0Y+5qoi8WehgPzT5YpWjpdk?=
 =?iso-8859-1?Q?3duPJkEjX/1cmtn27qkjMHyiCXWpdOSZ9yEni4nsnQltug5H7NAZmOwgm7?=
 =?iso-8859-1?Q?LWB5EbjAWCFyV5e6rVC6UAVuuo3QL/DM+dB3zEy2DrLriM9yuowMgZqRrp?=
 =?iso-8859-1?Q?wHqpLSBsry9rcRal7jCsAy4CTC4l5bjBVkxp1dzNmewnBBYaWY8H6uADZL?=
 =?iso-8859-1?Q?MGtbPgYdSgzQBmqZgrAThGkPGaX2Y80Mk3kgF94jdTsnqoRK13FA3SswqM?=
 =?iso-8859-1?Q?A51Mouo99Yt5OD2QVKBwpUK1DjYzN+96MwnMjnkaUf5QeOk35Z4oMB2trn?=
 =?iso-8859-1?Q?b0hmfSpsRwudqGGwx3fC/VJAfNNehGg0HzyKGtmQTUy+RPSDBNiCrroDzV?=
 =?iso-8859-1?Q?piCVoH43WEsjkdMT1HXyBqfXlQGgXabR5CHM7fvdBYPohNHq0W1F5zgiOe?=
 =?iso-8859-1?Q?y06GutTRgIooP4u12k9eTl9+38ehXJ2kM4rCju0z+y2+mTnsuc4A6pgzaH?=
 =?iso-8859-1?Q?XlQyrFHJCasyDUiNMF2nZ7Hg+d1ub/1ReVWzFZMSkj9UeoL6ey153VR2q6?=
 =?iso-8859-1?Q?qMNsplaVzi4SHDZVUL5P2KdVHhK6i2+v4GK4+tT6Do7uXc04Yuxcgy8Xtx?=
 =?iso-8859-1?Q?g2anaCQSoegcU0/NEcIf8hs4HHHcs2Wqxu5SG3ZH+T6shF6K1x9U2AauLo?=
 =?iso-8859-1?Q?mWc1vvTPzKnYFyyZMSBh8yvnCuMPqiH5EkQ0KPBdpOtnY2pnnqNNpf9w99?=
 =?iso-8859-1?Q?8q8CBut1PRhxXg5F+ak+BT2chhjPA9Stl8W05ZDBTR/91tum0d/33RkMUq?=
 =?iso-8859-1?Q?Bx4hSnGD2ZQAKvz6hv2xEDs9MuCu7crV3YEqgk5gwi9gCnkNij6qoohcno?=
 =?iso-8859-1?Q?ZqQDAp21eECV7l4hMK3SsDYYH5QcDZvwyFK8S1xBMU7TQdMeFmVhnFagtV?=
 =?iso-8859-1?Q?v6i8K5Ruf5fSP+QocLbOjuhCJtZLLtx/cu52ACZZy0BDIpVBE376B2YtPo?=
 =?iso-8859-1?Q?ukRSdXGI4poo6L3Ayfd+DJoxH1EJgHcIrL6JFvOTO9Ye8M4UrXAV6YO36m?=
 =?iso-8859-1?Q?l0XE8URRQ+Vjmk/yrYGowWo9UOiCLQKWhEejmPY3nn416fgeYDx3lMm93t?=
 =?iso-8859-1?Q?9uyQBCMYnVkNQAy975Z4yptOVdHWjpWVC4/yMKGMNwQagFen5pM6LpANis?=
 =?iso-8859-1?Q?hPgdLNX2Tt+3p5iggqZIZL/rVfdJL1AMNmb+qQU40eSwGF8GHuBJByThiZ?=
 =?iso-8859-1?Q?Zbcjo+2OvVDlvirFN5vpAH4E5Q365v4s/7ItatICHmwGUCvgrDDckob0wt?=
 =?iso-8859-1?Q?v/rPDO3wcaXeIPD1bBVdq7Gq/UwSfyVxLlsaUcA6yUnBG4cF4HiRJtekpL?=
 =?iso-8859-1?Q?j9EPbtnVHhB6pStvZPfPdgLirxNTDR8fIwaBQWsBdCPpVnPO151lMl4Vye?=
 =?iso-8859-1?Q?EkLhMd03bkEtRcAtFS3CE0MM501IJUqODZXSUcK2ZRFMggnz/FTSigLVLe?=
 =?iso-8859-1?Q?2PGiHjGcjDgEDBByAndVisCDectQwDa+1k5gQLjUTsWs0IA4sCY3wWfg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0136b2-e461-4f19-d097-08dde1df70b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2025 00:53:14.1485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YxRiXwc2/PnwUjn3t5pZEEsbv5h7S1jtUPkZFvg37o5sOaXSJ45VSAUGKd/K3coJeWWSNbIAP19AWCfSWNgCyN1p+f7PsPMaRYveRVy/S8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8957

Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 11.08.2025 22:48, Mykola Kvach wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -1311,7 +1311,11 @@ int domain_shutdown(struct domain *d, u8 reason)
>>          d->shutdown_code =3D reason;
>>      reason =3D d->shutdown_code;
>> =20
>> +#if defined(CONFIG_SYSTEM_SUSPEND) && defined(CONFIG_ARM)
>> +    if ( reason !=3D SHUTDOWN_suspend && is_hardware_domain(d) )
>> +#else
>>      if ( is_hardware_domain(d) )
>> +#endif
>>          hwdom_shutdown(reason);
>
> There better wouldn't be any #ifdef here. Afaict you can easily use
> IS_ENABLED(CONFIG_SYSTEM_SUSPEND). For CONFIG_ARM, though, I think some
> new abstraction will need adding. E.g. HAS_HWDOM_SUSPEND (with want for
> a better, yet not overly long name).
>
> With the hwdom / ctldom separation work in mind I wonder though if it's
> really hwdom to be in charge of initiating system suspend. Imo
> conceptually that rather would want to be ctldom. Stefano?

I am not Stefano, but IMO, this should be ctldom. But only after hwdom
is already suspended, otherwise we'll have problems with devices.

It is unclear which entity should check if hwdom is already suspended,
though. Should be it be ctldom or Xen itself?

And if we already speaking of devices... There can be domains with
passed-through devices. Those domains should be suspended properly, not
just freezed. I think this requires another TODO.

--=20
WBR, Volodymyr=

