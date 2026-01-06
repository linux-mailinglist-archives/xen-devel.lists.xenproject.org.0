Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0B4CF6EAB
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 07:41:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195811.1513713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd0k9-0001LT-Kv; Tue, 06 Jan 2026 06:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195811.1513713; Tue, 06 Jan 2026 06:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd0k9-0001IM-Gw; Tue, 06 Jan 2026 06:40:37 +0000
Received: by outflank-mailman (input) for mailman id 1195811;
 Tue, 06 Jan 2026 06:40:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NVB6=7L=siemens.com=haseeb.ashraf@srs-se1.protection.inumbo.net>)
 id 1vd0k8-0001IE-Lk
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 06:40:36 +0000
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c405::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 982ae886-eaca-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 07:40:33 +0100 (CET)
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 (2603:1096:820:87::11) by SEZPR06MB7173.apcprd06.prod.outlook.com
 (2603:1096:101:22f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 06:40:26 +0000
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523]) by KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523%3]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 06:40:26 +0000
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
X-Inumbo-ID: 982ae886-eaca-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zm9Dx6dDxlCFIfBwrOP2CiXMYM06LTzJCia0l0juR/DW+v94E+iE9eNpluSKwFbcx/aILx4WlsypImE+0CwMQ2ugAD9nUm8tjtVFVviPXD/3FItLGISfH0UNc/0mz7W4sbzs2IbQcc5EAPhI4RSeL2ivTfUtAvAC7IxWFMukv52J3qajyGJq2vIVM60TZFQl5aYRz37aZPloXC3lEGWcLw0mZGsQeOnF0pumb1CXLFvk5sSgf3S8i4J6YsmCnhjrL7ITKaQfn/LcZYMwX1pzfDXkxgdjSAzT8c/zhLtVNUYh3LkUyTOFaOFaVeI16nQ2VSy16R4J2XPR0sMcDlrhGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Uv+NAI6jEJ5mTLs9M/JrTne1pihN67PjYw2suMMsoU=;
 b=yFbjJInn4qEWgIEqbe1De76ROoCvbIU7+LklLY2YqLCGQzt5Tzie4g+jtYozCUbOp+W3e+hjcbQKT86v5H4TrQG7C+42dDkD1aX19InMEpSeSWVToo3oFPjJ68y1bCxO/u7VkN80S6hvdSerMoczd2DgMp7JwzIN8mkUrUc2HBgx83IdW/9E9qHkrkV28XJFYplqwevJd5/dj8sCG+QsDajtreYVGvhyQ72SONSaKM2hRgPWtVxtjHe37eqvrGpQdS3HTQM1fu6SQOalaAELDF++bOmQ8ZuctTqHNDKcb6yUbB7yzgWOREBc+Zn+1ch7Y/tiaSE9euBw1sDDWg2LGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Uv+NAI6jEJ5mTLs9M/JrTne1pihN67PjYw2suMMsoU=;
 b=g6RG69mtGvapE/mRe4NCJGqNg0S1d3CEwm0yDRCkqHaNiyNdyVFKcNDzqI/aeVg1mP0gGWKEV04sqw3GAAMg9JgrqBJWI4SrcL6k7etRpjQiwxV7FUDvgrESGSWjFzkgvFz1r1VIzgQYiFOYIU+dLXCFZM/J7Eyx5/Xfvax2FeEehsaYSF31gC+euZ3eZYyJ82weNOr+mqd2MTUsGLbzjBzuxMaL/do4dYqy6vOkMqTvinxXxJYSVLND/N6Yll14X+VRxZrfkFtP1CG8iSJEK2wmD1s4MF5oD03OJE+bdqzXiWhK6g8p26Bwe0v/ZyA4q1xdwwePa6EVIpkYhdlmWQ==
From: "Ashraf, Haseeb" <haseeb.ashraf@siemens.com>
To: Haseeb Ashraf <haseebashraf091@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "Driscoll, Dan"
	<dan.driscoll@siemens.com>, "Ahsan Khawaja, Noor" <noor.ahsan@siemens.com>,
	"Arslan, Fahad" <fahad.arslan@siemens.com>, "Bachtel, Andrew"
	<andrew.bachtel@siemens.com>
Subject: Re: [PATCH 0/3] xen/arm{32,64}: perform IPA-based TLBI when IPA is
Thread-Topic: [PATCH 0/3] xen/arm{32,64}: perform IPA-based TLBI when IPA is
Thread-Index: AQHcaEpRSCjrYdYkH06BEtnycvkPLLUkOFKPgCClBPk=
Date: Tue, 6 Jan 2026 06:40:26 +0000
Message-ID:
 <KL1PR0601MB458826078A6100130495FB26E687A@KL1PR0601MB4588.apcprd06.prod.outlook.com>
References: <cover.1765197209.git.haseeb.ashraf@siemens.com>
 <TYZPR06MB4580CBD5DF15805985A70453E6AAA@TYZPR06MB4580.apcprd06.prod.outlook.com>
In-Reply-To:
 <TYZPR06MB4580CBD5DF15805985A70453E6AAA@TYZPR06MB4580.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-06T06:40:25.675Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4588:EE_|SEZPR06MB7173:EE_
x-ms-office365-filtering-correlation-id: f6c6ae12-a47a-4ea2-6f32-08de4cee79d4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|39142699007|31052699007|366016|38070700021|7053199007|8096899003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?moZUyL+svQ4C6JMpZBRKB3bHUYd1hSOiVIAaURaLlN5tnmouNZvm+LaW+oR1?=
 =?us-ascii?Q?dJeT9T+Euq9QvWOhbAcu8+r0C+cL/wvaXKwQ0cUkPuFt1TitAm1Tp497hZF7?=
 =?us-ascii?Q?pYe93xKuEf0JD5Z3h0CIxEXTfLhMRXGrdu/Xq6xa4EDoCcUbvr0RxZdDxiTI?=
 =?us-ascii?Q?UCqQlay7FVSy3CGqQvNzuyMtmdxg3wPh8AWdyoIFgzhu76d8/4TfcFUlV1IN?=
 =?us-ascii?Q?sboaAlKFAoaDw6TdKAUWSaqlY6t8JmMe+PZRDaQf1EKL23B1Pw8IdGf0yDqN?=
 =?us-ascii?Q?zqaNCUxArzdsLDupltV+Cdk4gngIRyAG0ydUgWIBrwaEaImiLetIRuVbZnci?=
 =?us-ascii?Q?glPEachq+XZrJjlodMSMwOWyGfpP3dDDoQGytoqh7zh2JOAAMZWMO4B885Mt?=
 =?us-ascii?Q?MoD6FGwLAn3By2vWDIr+XUBN6XcuOUHfBAWWYU+l9VpmaLWmjHb8k0JV7ul8?=
 =?us-ascii?Q?s4+o6bWl670nrzgPHYanec7kKGfxjoIPzvojMJgONx5TBVdmowvEFnrac6yV?=
 =?us-ascii?Q?Z1mTtFPV3WLN30bUjDxoolb8GZteIOqDFYP/0qprQsXpJkC1IGyT9R51yvWi?=
 =?us-ascii?Q?MHQYi2qxueyOrarFEZldLDyz+BF/WHhbYGam5Czp8aHpvp6lCBeetc77CK9/?=
 =?us-ascii?Q?VU/Zue23SJ34oDu4PaTSWJZV+ZgSjkqwDaMfGQY4sH8EBn5otw38v97ZVQ12?=
 =?us-ascii?Q?QOxenKalzvP9pxaflGw6qxqikgUxo/scOZ/SrIdMPqpSboaT2hxUCZpSUzbf?=
 =?us-ascii?Q?lwpMTWhK5YN0K5ck8ybYc3hjHm3wT7ognW6KAqMWdL4H7k7LEiut3TTFV4Ik?=
 =?us-ascii?Q?c0RDzk5FNtqm/VcYtdRzXWCWtXeMm78Hdl/z0pYZ7EFJ1U3CRGPDcLq540wR?=
 =?us-ascii?Q?BXohaMwHO55nLtPXXbVzPXFeRIXfK8PiU8nFBWUv8BS/2wFXEol5rbxUDqhN?=
 =?us-ascii?Q?NI3CE6q0U7rdrr+z51tHS8T/WqgivmbeTDl1ft7PcdB9lG3sM76k5vWZv5Co?=
 =?us-ascii?Q?zkX9ia4ER+wqygjp13iJPQt2OMvlEdYWAuouz7xSKM+IqOf6EXJO6XeRygXt?=
 =?us-ascii?Q?22Q+b1UpiKX+WH5Bi/DM6Z7O9SwpI7E6cgEGemEC8vaxHRkxj8Ryza+B1tNe?=
 =?us-ascii?Q?E0zR3VqAK9bDtGwCePLyUwqGC0q3+S8jLtAirKztkbp4N2RdPxAjRXg9iUmM?=
 =?us-ascii?Q?NhxOn3z2n0cOTTbLNoRyEm6Q6HhlOBTYKyMQHcTjsywsioPtUusgsnB2Od/t?=
 =?us-ascii?Q?3X8+UwsnXuesH0qSZYutNevhOfIFMuyXtEQlm99CmBaFexsYL7TUbV1lEcHT?=
 =?us-ascii?Q?nkQVjcQHGMouZPhnPRKhTuK6nsPafoEubZq4csF21Ftjopxq7ikRyhSqasmJ?=
 =?us-ascii?Q?FBWifctC1BUFGefLMrUKU9yP82DCa5LQfr0cUagW80bobHvuyVDICgWsb7bw?=
 =?us-ascii?Q?XlXikvM6GEg5kRXYNSdHjkKeZZsbjtclxzR6D2wMGnz7v3aiGVnjK8TopAWf?=
 =?us-ascii?Q?yaobkiUC8dZDR9ohFMnuAmcQ84abC6hAPhel?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4588.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(39142699007)(31052699007)(366016)(38070700021)(7053199007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4owgrbmzcZA84JLSwo8ytamxP3SxouLr7LHp2DnPJIPGOfH687S+4hZ8uuZg?=
 =?us-ascii?Q?MPEkTTMjztxwR2bWDYH1IJqm3KUuah5RG9NZ2pX8pEDRaLYEk9+2z95z/X0d?=
 =?us-ascii?Q?pW006o6iMqGf9x5sEiTMzxtacmHzvGQrRz45Hvbe5JVF+16b8UgPF5V5vB9Q?=
 =?us-ascii?Q?BPUo4K8qfxJNaE6XksSG8mpHSRLhybl38a1wOHLb8xboN7Ut6HAvXpBi35/A?=
 =?us-ascii?Q?HzWiiIPZUGulNAndTrnbFg+um0bLwk/CSHOrhKqEjTOuoQo3LgIlMEHYY4KP?=
 =?us-ascii?Q?y8/8gCH56Dk2bs3J4PXu/s/W6QO1ZdK1tMobDtm6O6M3t//+KQgdpubdE26n?=
 =?us-ascii?Q?8brtU17EKkvZXBuQth2yDOmPUQw3u/HLcunA6L8QspiFtM3UPAnvlvg7ppcY?=
 =?us-ascii?Q?4eSf6T1ZgE7PoagAz1R4v3AI39KiK7GvQfDG0G9hrf+mLtxzs6+iMy6iTxSg?=
 =?us-ascii?Q?qbIkSWzJAZxYMom5k0abXObotIA642cRGm0lzqWmm8tE5ZwtOyHo4FnA/xPQ?=
 =?us-ascii?Q?gv0YIVZeMBsNeofFDIFSWtMMN/16lzAqTG1F1LBnp2mdFMQmwO0vWiS4CTor?=
 =?us-ascii?Q?ajt5QRh9gTOyYNmyez29zFiDqulXA+SQrhPs2QSuyp8MShynZAezf+4gRJk1?=
 =?us-ascii?Q?gPy5PtiW0NpvDkJXp7iq7BaORjQvvpj7THmcpEAvKTzUzbPXBGpIm7xwZtL0?=
 =?us-ascii?Q?h0VNu5E3Wul2JOpRShJ4V/9vSXKtad6kDw1/2u5Jd8fIxbpbPg6EPYubneo+?=
 =?us-ascii?Q?DEXGDIeXBxdlANUwlqo6R1SAXSXzxG349M0lsonzXt8f1dTXLxo8FQ7tj86x?=
 =?us-ascii?Q?vRV3MtxOO5BKiE1OM+ir+rXRpYLLOp4D/bYOgUEqIzgn6NhP9Ug6IMXtxQwV?=
 =?us-ascii?Q?gPK2nx4UovPmHMmhaKNLnYs6pfSzSL1Y7P3zPFTpCsIqBvWHa5LE0IYUPfBo?=
 =?us-ascii?Q?OraC870nxB1pJYjOshEVowsygIgWLopci0FZ1SEAWVJ7Pbu7ckqq1k6MRq9a?=
 =?us-ascii?Q?YFPgoaWqD+lrjuMvpedqSudjERKLakz4AGfqEwV9iDCGCLo5vAc0ISS3i7tx?=
 =?us-ascii?Q?acYyk50Q0ZvAUywsvXBVt0BmhZ80oclguWeRgs6YnrrFnGJh9hpSZDrMlo89?=
 =?us-ascii?Q?MFdZOoc9ILlFyiDrWEW9t+whTgaExcpg+O9KWyyxzKhxexF8x+ezyz82GCyh?=
 =?us-ascii?Q?fzFXgEGRtNkHdMjizp08epPP0cG+MwDg8iF+xj18u1BcdrPGlofFIZMPp1us?=
 =?us-ascii?Q?5I9+F+lRifKrNm13kI0VYMyU0937pUD8d6nWth9F6eug6VaY6quxG0hmZ22V?=
 =?us-ascii?Q?UkGCYAUrIOthbu6YI00U6eBQMI7gUkLmtDUj54GwxAWIKtHWiUaRJqBXaD5y?=
 =?us-ascii?Q?OpJ4HtFHYvm9KRJ62QuOrmjJzRTRA7uhSpQfQ90xyyLvGPbsZQWEAO1Pfzwu?=
 =?us-ascii?Q?/3M6Q3yJ6srvxMs5QSNrqqDb8qmtYuMP4Z30Y+e+nddRfdpPc7CmDkwjHZcW?=
 =?us-ascii?Q?MgzcxkaKH7FLbfX2Aw09Y5k3Xpyg3hle360t3yFcCsdPDp2CkJDt6wTerlOp?=
 =?us-ascii?Q?jjn7uTDIVXksBCRhnl15ZcMhA9p425hvGdH4FiIPQzPtjc2Lwl32WzyrDuUD?=
 =?us-ascii?Q?V1HmaCjTQYEcFHRIJNj3uPsQoOdG6jZDBXSzzREuqZuMPnwo+lwTNDgYf2nd?=
 =?us-ascii?Q?nNZYvK+9gTQHF7psBtKSbdRxdmewiW26pByk9DR7t3a70Grc/Z5LTnPBmBvf?=
 =?us-ascii?Q?P+U646i40A=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_KL1PR0601MB458826078A6100130495FB26E687AKL1PR0601MB4588_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4588.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c6ae12-a47a-4ea2-6f32-08de4cee79d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 06:40:26.2836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C+xh1jm5SqtN0pP92GdTj842hcfjHioDVOnxFD0RmupgFGuwgyqIC6BQFxYSdOEBIra6yXhl7XDdjFxbpgDrVwTW5v8vPDwDPQzrUu5ASuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7173

--_000_KL1PR0601MB458826078A6100130495FB26E687AKL1PR0601MB4588_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Is there any comment on this patch series? I want to get this merged as it =
is a blocker for supporting Xen on KVM.

Regards,
Haseeb
________________________________
From: Ashraf, Haseeb (DI SW EDA HAV SLS EPS RTOS LIN) <haseeb.ashraf@siemen=
s.com>
Sent: Tuesday, December 16, 2025 5:08 PM
To: Haseeb Ashraf <haseebashraf091@gmail.com>; xen-devel@lists.xenproject.o=
rg <xen-devel@lists.xenproject.org>; Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>; Bertrand Marquis <bertrand=
.marquis@arm.com>; Michal Orzel <michal.orzel@amd.com>; Volodymyr Babchuk <=
Volodymyr_Babchuk@epam.com>; Driscoll, Dan (DI SW EDA HAV SLS EPS TOA) <dan=
.driscoll@siemens.com>; Ahsan Khawaja, Noor (DI SW EDA HAV SLS EPS RTOS LIN=
) <noor.ahsan@siemens.com>; Arslan, Fahad (DI SW EDA HAV SLS EPS RTOS LIN) =
<fahad.arslan@siemens.com>; Bachtel, Andrew (DI SW EDA HAV SLS EPS TOA) <an=
drew.bachtel@siemens.com>
Subject: Re: [PATCH 0/3] xen/arm{32,64}: perform IPA-based TLBI when IPA is

Hi @Julien Grall<mailto:julien@xen.org>,

Bringing up this patch series. Please have a look at it, and let me if ther=
e is any comment on v3 of this series.

Thanks & Regards,
Haseeb

--_000_KL1PR0601MB458826078A6100130495FB26E687AKL1PR0601MB4588_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Hello everyone,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Is there any comment on this patch series? I want to get this merged as it =
is a blocker for supporting Xen on KVM.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Haseeb</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ashraf, Haseeb (DI SW=
 EDA HAV SLS EPS RTOS LIN) &lt;haseeb.ashraf@siemens.com&gt;<br>
<b>Sent:</b> Tuesday, December 16, 2025 5:08 PM<br>
<b>To:</b> Haseeb Ashraf &lt;haseebashraf091@gmail.com&gt;; xen-devel@lists=
.xenproject.org &lt;xen-devel@lists.xenproject.org&gt;; Julien Grall &lt;ju=
lien@xen.org&gt;<br>
<b>Cc:</b> Stefano Stabellini &lt;sstabellini@kernel.org&gt;; Bertrand Marq=
uis &lt;bertrand.marquis@arm.com&gt;; Michal Orzel &lt;michal.orzel@amd.com=
&gt;; Volodymyr Babchuk &lt;Volodymyr_Babchuk@epam.com&gt;; Driscoll, Dan (=
DI SW EDA HAV SLS EPS TOA) &lt;dan.driscoll@siemens.com&gt;; Ahsan
 Khawaja, Noor (DI SW EDA HAV SLS EPS RTOS LIN) &lt;noor.ahsan@siemens.com&=
gt;; Arslan, Fahad (DI SW EDA HAV SLS EPS RTOS LIN) &lt;fahad.arslan@siemen=
s.com&gt;; Bachtel, Andrew (DI SW EDA HAV SLS EPS TOA) &lt;andrew.bachtel@s=
iemens.com&gt;<br>
<b>Subject:</b> Re: [PATCH 0/3] xen/arm{32,64}: perform IPA-based TLBI when=
 IPA is</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
Hi <a class=3D"x_tWKOu x_mention x_ms-bgc-nlr x_ms-fcl-b" id=3D"OWAAM423234=
" href=3D"mailto:julien@xen.org">
@Julien Grall</a>,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
Bringing up this patch series. Please have a look at it, and let me if ther=
e is any comment on v3 of this series.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
Thanks &amp; Regards,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Arial,Helvetica,sans-s=
erif; font-size:10pt; color:rgb(0,0,0)">
Haseeb</div>
<div style=3D"font-family:Arial,Helvetica,sans-serif; font-size:10pt; color=
:rgb(0,0,0)">
<span style=3D"font-family:Arial,Helvetica,sans-serif; color:rgb(0,0,0)"></=
span></div>
</div>
</body>
</html>

--_000_KL1PR0601MB458826078A6100130495FB26E687AKL1PR0601MB4588_--

